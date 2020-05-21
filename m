Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 202061DCBD1
	for <lists+xen-devel@lfdr.de>; Thu, 21 May 2020 13:10:31 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jbj50-0004qI-7A; Thu, 21 May 2020 11:09:38 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=2WPz=7D=hermes.cam.ac.uk=amc96@srs-us1.protection.inumbo.net>)
 id 1jbj4z-0004qD-06
 for xen-devel@lists.xenproject.org; Thu, 21 May 2020 11:09:37 +0000
X-Inumbo-ID: 8d778145-9b53-11ea-aaf1-12813bfff9fa
Received: from ppsw-40.csi.cam.ac.uk (unknown [131.111.8.140])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 8d778145-9b53-11ea-aaf1-12813bfff9fa;
 Thu, 21 May 2020 11:09:35 +0000 (UTC)
X-Cam-AntiVirus: no malware found
X-Cam-ScannerInfo: http://help.uis.cam.ac.uk/email-scanner-virus
Received: from 88-109-182-220.dynamic.dsl.as9105.com ([88.109.182.220]:41892
 helo=[192.168.1.219])
 by ppsw-40.csi.cam.ac.uk (smtp.hermes.cam.ac.uk [131.111.8.158]:465)
 with esmtpsa (PLAIN:amc96) (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
 id 1jbj4u-000Ue9-jF (Exim 4.92.3)
 (return-path <amc96@hermes.cam.ac.uk>); Thu, 21 May 2020 12:09:32 +0100
Subject: Re: [PATCH v7 12/19] tools: add simple vchan-socket-proxy
To: Jason Andryuk <jandryuk@gmail.com>, xen-devel@lists.xenproject.org
References: <20200519015503.115236-1-jandryuk@gmail.com>
 <20200519015503.115236-13-jandryuk@gmail.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <edb28eba-622e-e9e6-5d22-0d5e86b503bd@citrix.com>
Date: Thu, 21 May 2020 12:09:26 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200519015503.115236-13-jandryuk@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-GB
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Ian Jackson <ian.jackson@citrix.com>,
 =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?=
 <marmarek@invisiblethingslab.com>, Wei Liu <wl@xen.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 19/05/2020 02:54, Jason Andryuk wrote:
> +static int connect_socket(const char *path_or_fd) {
> +    int fd;
> +    char *endptr;
> +    struct sockaddr_un addr;
> +
> +    fd = strtoll(path_or_fd, &endptr, 0);
> +    if (*endptr == '\0') {
> +        set_nonblocking(fd, 1);
> +        return fd;
> +    }
> +
> +    fd = socket(AF_UNIX, SOCK_STREAM, 0);
> +    if (fd == -1)
> +        return -1;
> +
> +    addr.sun_family = AF_UNIX;
> +    strncpy(addr.sun_path, path_or_fd, sizeof(addr.sun_path));

Coverity has identified issues, some perhaps more concerning than others.

Here, addr.sun_path not necessarily NUL terminated.

> +    if (connect(fd, (const struct sockaddr *)&addr, sizeof(addr)) == -1) {
> +        close(fd);
> +        return -1;
> +    }
> +
> +    set_nonblocking(fd, 1);
> +
> +    return fd;
> +}
> +
> +static int listen_socket(const char *path_or_fd) {
> +    int fd;
> +    char *endptr;
> +    struct sockaddr_un addr;
> +
> +    fd = strtoll(path_or_fd, &endptr, 0);
> +    if (*endptr == '\0') {
> +        return fd;
> +    }
> +
> +    /* if not a number, assume a socket path */
> +    fd = socket(AF_UNIX, SOCK_STREAM, 0);
> +    if (fd == -1)
> +        return -1;
> +
> +    addr.sun_family = AF_UNIX;
> +    strncpy(addr.sun_path, path_or_fd, sizeof(addr.sun_path));

And here.

> +    if (bind(fd, (const struct sockaddr *)&addr, sizeof(addr)) == -1) {
> +        close(fd);
> +        return -1;
> +    }
> +    if (listen(fd, 5) != 0) {
> +        close(fd);
> +        return -1;
> +    }
> +
> +    return fd;
> +}
> +
> +static struct libxenvchan *connect_vchan(int domid, const char *path) {
> +    struct libxenvchan *ctrl = NULL;
> +    struct xs_handle *xs = NULL;
> +    xc_interface *xc = NULL;
> +    xc_dominfo_t dominfo;
> +    char **watch_ret;
> +    unsigned int watch_num;
> +    int ret;
> +
> +    xs = xs_open(XS_OPEN_READONLY);
> +    if (!xs) {
> +        perror("xs_open");
> +        goto out;
> +    }
> +    xc = xc_interface_open(NULL, NULL, XC_OPENFLAG_NON_REENTRANT);
> +    if (!xc) {
> +        perror("xc_interface_open");
> +        goto out;
> +    }
> +    /* wait for vchan server to create *path* */
> +    xs_watch(xs, path, "path");
> +    xs_watch(xs, "@releaseDomain", "release");

Return values not checked.

> +    while ((watch_ret = xs_read_watch(xs, &watch_num))) {
> +        /* don't care about exact which fired the watch */
> +        free(watch_ret);
> +        ctrl = libxenvchan_client_init(NULL, domid, path);
> +        if (ctrl)
> +            break;
> +
> +        ret = xc_domain_getinfo(xc, domid, 1, &dominfo);
> +        /* break the loop if domain is definitely not there anymore, but
> +         * continue if it is or the call failed (like EPERM) */
> +        if (ret == -1 && errno == ESRCH)
> +            break;
> +        if (ret == 1 && (dominfo.domid != (uint32_t)domid || dominfo.dying))
> +            break;
> +    }
> +
> +out:
> +    if (xc)
> +        xc_interface_close(xc);
> +    if (xs)
> +        xs_close(xs);
> +    return ctrl;
> +}
> +
> +
> +static void discard_buffers(struct libxenvchan *ctrl) {
> +    /* discard local buffers */
> +    insiz = 0;
> +    outsiz = 0;
> +
> +    /* discard remaining incoming data */
> +    while (libxenvchan_data_ready(ctrl)) {
> +        if (libxenvchan_read(ctrl, inbuf, BUFSIZE) == -1) {
> +            perror("vchan read");
> +            exit(1);
> +        }
> +    }
> +}
> +
> +int data_loop(struct libxenvchan *ctrl, int input_fd, int output_fd)
> +{
> +    int ret;
> +    int libxenvchan_fd;
> +    int max_fd;
> +
> +    libxenvchan_fd = libxenvchan_fd_for_select(ctrl);
> +    for (;;) {
> +        fd_set rfds;
> +        fd_set wfds;
> +        FD_ZERO(&rfds);
> +        FD_ZERO(&wfds);
> +
> +        max_fd = -1;
> +        if (input_fd != -1 && insiz != BUFSIZE) {
> +            FD_SET(input_fd, &rfds);
> +            if (input_fd > max_fd)
> +                max_fd = input_fd;
> +        }
> +        if (output_fd != -1 && outsiz) {
> +            FD_SET(output_fd, &wfds);
> +            if (output_fd > max_fd)
> +                max_fd = output_fd;
> +        }
> +        FD_SET(libxenvchan_fd, &rfds);
> +        if (libxenvchan_fd > max_fd)
> +            max_fd = libxenvchan_fd;
> +        ret = select(max_fd + 1, &rfds, &wfds, NULL, NULL);
> +        if (ret < 0) {
> +            perror("select");
> +            exit(1);
> +        }
> +        if (FD_ISSET(libxenvchan_fd, &rfds)) {
> +            libxenvchan_wait(ctrl);
> +            if (!libxenvchan_is_open(ctrl)) {
> +                if (verbose)
> +                    fprintf(stderr, "vchan client disconnected\n");
> +                while (outsiz)
> +                    socket_wr(output_fd);
> +                close(output_fd);
> +                close(input_fd);
> +                discard_buffers(ctrl);
> +                break;
> +            }
> +            vchan_wr(ctrl);
> +        }
> +
> +        if (FD_ISSET(input_fd, &rfds)) {
> +            ret = read(input_fd, inbuf + insiz, BUFSIZE - insiz);
> +            if (ret < 0 && errno != EAGAIN)
> +                exit(1);
> +            if (verbose)
> +                fprintf(stderr, "from-unix: %.*s\n", ret, inbuf + insiz);
> +            if (ret == 0) {
> +                /* EOF on socket, write everything in the buffer and close the
> +                 * input_fd socket */
> +                while (insiz) {
> +                    vchan_wr(ctrl);
> +                    libxenvchan_wait(ctrl);
> +                }
> +                close(input_fd);
> +                input_fd = -1;

Dead store.

> +                /* TODO: maybe signal the vchan client somehow? */
> +                break;
> +            }
> +            if (ret)
> +                insiz += ret;
> +            vchan_wr(ctrl);
> +        }
> +        if (FD_ISSET(output_fd, &wfds))
> +            socket_wr(output_fd);
> +        while (libxenvchan_data_ready(ctrl) && outsiz < BUFSIZE) {
> +            ret = libxenvchan_read(ctrl, outbuf + outsiz, BUFSIZE - outsiz);
> +            if (ret < 0)
> +                exit(1);
> +            if (verbose)
> +                fprintf(stderr, "from-vchan: %.*s\n", ret, outbuf + outsiz);
> +            outsiz += ret;
> +            socket_wr(output_fd);
> +        }
> +    }
> +    return 0;
> +}
> +
> +/**
> +    Simple libxenvchan application, both client and server.
> +    Both sides may write and read, both from the libxenvchan and from
> +    stdin/stdout (just like netcat).
> +*/
> +
> +static struct option options[] = {
> +    { "mode",       required_argument, NULL, 'm' },
> +    { "verbose",          no_argument, NULL, 'v' },
> +    { "state-path", required_argument, NULL, 's' },
> +    { }
> +};
> +
> +int main(int argc, char **argv)
> +{
> +    int is_server = 0;
> +    int socket_fd = -1;
> +    int input_fd, output_fd;
> +    struct libxenvchan *ctrl = NULL;
> +    const char *socket_path;
> +    int domid;
> +    const char *vchan_path;
> +    const char *state_path = NULL;
> +    int opt;
> +
> +    while ((opt = getopt_long(argc, argv, "m:vs:", options, NULL)) != -1) {
> +        switch (opt) {
> +            case 'm':
> +                if (strcmp(optarg, "server") == 0)
> +                    is_server = 1;
> +                else if (strcmp(optarg, "client") == 0)
> +                    is_server = 0;
> +                else {
> +                    fprintf(stderr, "invalid argument for --mode: %s\n", optarg);
> +                    usage(argv);
> +                    return 1;
> +                }
> +                break;
> +            case 'v':
> +                verbose = 1;
> +                break;
> +            case 's':
> +                state_path = optarg;
> +                break;
> +            case '?':
> +                usage(argv);
> +        }
> +    }
> +
> +    if (argc-optind != 3)
> +        usage(argv);
> +
> +    domid = atoi(argv[optind]);
> +    vchan_path = argv[optind+1];
> +    socket_path = argv[optind+2];
> +
> +    if (is_server) {
> +        ctrl = libxenvchan_server_init(NULL, domid, vchan_path, 0, 0);
> +        if (!ctrl) {
> +            perror("libxenvchan_server_init");
> +            exit(1);
> +        }
> +    } else {
> +        if (strcmp(socket_path, "-") == 0) {
> +            input_fd = 0;
> +            output_fd = 1;
> +        } else {
> +            socket_fd = listen_socket(socket_path);
> +            if (socket_fd == -1) {
> +                perror("listen socket");
> +                return 1;
> +            }
> +        }
> +    }
> +
> +    if (state_path) {
> +        struct xs_handle *xs;
> +
> +        xs = xs_open(0);
> +        if (!xs) {
> +            perror("xs_open");
> +            return 1;
> +        }
> +        if (!xs_write(xs, XBT_NULL, state_path, "running", strlen("running"))) {
> +            perror("xs_write");
> +            return 1;
> +        }
> +        xs_close(xs);
> +    }
> +
> +    for (;;) {
> +        if (is_server) {
> +            /* wait for vchan connection */
> +            while (libxenvchan_is_open(ctrl) != 1)
> +                libxenvchan_wait(ctrl);
> +            /* vchan client connected, setup local FD if needed */
> +            if (strcmp(socket_path, "-") == 0) {
> +                input_fd = 0;
> +                output_fd = 1;
> +            } else {
> +                input_fd = output_fd = connect_socket(socket_path);
> +            }
> +            if (input_fd == -1) {
> +                perror("connect socket");
> +                return 1;
> +            }
> +            if (data_loop(ctrl, input_fd, output_fd) != 0)
> +                break;
> +            /* keep it running only when get UNIX socket path */
> +            if (socket_path[0] != '/')
> +                break;
> +        } else {
> +            /* wait for local socket connection */
> +            if (strcmp(socket_path, "-") != 0)
> +                input_fd = output_fd = accept(socket_fd, NULL, NULL);
> +            if (input_fd == -1) {
> +                perror("accept");

Leakage of scoket_fd, and ...

> +                return 1;
> +            }
> +            set_nonblocking(input_fd, 1);
> +            set_nonblocking(output_fd, 1);
> +            ctrl = connect_vchan(domid, vchan_path);
> +            if (!ctrl) {
> +                perror("vchan client init");

All 3 FDs here.

~Andrew

> +                return 1;
> +            }
> +            if (data_loop(ctrl, input_fd, output_fd) != 0)
> +                break;
> +            /* don't reconnect if output was stdout */
> +            if (strcmp(socket_path, "-") == 0)
> +                break;
> +
> +            libxenvchan_close(ctrl);
> +            ctrl = NULL;
> +        }
> +    }
> +    return 0;
> +}


