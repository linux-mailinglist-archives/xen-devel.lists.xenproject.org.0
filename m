Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DF916135EF1
	for <lists+xen-devel@lfdr.de>; Thu,  9 Jan 2020 18:11:12 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ipbHe-00060w-9m; Thu, 09 Jan 2020 17:07:46 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=SN5F=26=citrix.com=george.dunlap@srs-us1.protection.inumbo.net>)
 id 1ipbHc-00060r-7s
 for xen-devel@lists.xenproject.org; Thu, 09 Jan 2020 17:07:44 +0000
X-Inumbo-ID: 878e3034-3302-11ea-a985-bc764e2007e4
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 878e3034-3302-11ea-a985-bc764e2007e4;
 Thu, 09 Jan 2020 17:07:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1578589655;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to;
 bh=1yQMvLrk4kxv6Fd9ocGTXp8LgOHA1ssvBto9o3Du7fU=;
 b=Nkup5GPdNIuPARtdzF+j/oR7M7blnWqUYcRwj3cie0WRvp8BkuuSh/WD
 3rUt14jVPDI/ex/W0MyZrbZFGHJeLf8AbpWtAw+bvgI0z9Om3pVuDx07D
 H9o0eyieeWc2uXuNbTjLoqnsl4vDBI0T0e3GLgHWddAp1klzv3NZfsAn4 s=;
Authentication-Results: esa5.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=george.dunlap@citrix.com;
 spf=Pass smtp.mailfrom=George.Dunlap@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 george.dunlap@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="George.Dunlap@citrix.com";
 x-sender="george.dunlap@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa5.hc3370-68.iphmx.com: domain of
 George.Dunlap@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="George.Dunlap@citrix.com";
 x-sender="George.Dunlap@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="George.Dunlap@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: ZvXMI5IEKd24N1q3flLNPtVmnv2aovwmv9Q7qfcrKcKUF8ew1qcRrC0g8htfRtIMAfTShnxM2X
 utzuGv8ozWA8sLpq0WBUUWCdbUMUH/PtB4X4XKpXE7AmhbgA3gX4IAy5iGHDsp4St2LKTQmG9K
 qqAmEamaauHXMlfBD2AE0JeDdhri9RgznMsSlFBPfDJJjq3iH7LaMpnt0jnkM0PGvJYYG1eZ7U
 VRQGSA0shEy+YFPJUHLg4o4oVB5mLrEX9Ywk1R4SW1I9Z72+fkxuo3hBarsOElTR6pN3iohua7
 +Z8=
X-SBRS: 2.7
X-MesageID: 11073294
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.69,414,1571716800"; d="c'?scan'208";a="11073294"
To: <xen-devel@lists.xenproject.org>
References: <20200109121227.949665-1-george.dunlap@citrix.com>
 <20200109121227.949665-2-george.dunlap@citrix.com>
From: George Dunlap <george.dunlap@citrix.com>
Openpgp: preference=signencrypt
Autocrypt: addr=george.dunlap@citrix.com; prefer-encrypt=mutual; keydata=
 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
 rIFfe2Dk+lD9A9BVd2rfoHA=
Message-ID: <471b37ec-3401-91c3-1a6e-508c065beb4f@citrix.com>
Date: Thu, 9 Jan 2020 17:07:31 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20200109121227.949665-2-george.dunlap@citrix.com>
Content-Type: multipart/mixed; boundary="------------519163A99AE3FE0EC7A8B8B6"
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v2 2/2] libxl: Add new "notify-only"
 childproc mode
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Anthony Perard <anthony.perard@citrix.com>,
 Ian Jackson <ian.jackson@citrix.com>, Nick Rosbrook <rosbrookn@ainfosec.com>,
 Wei Liu <wl@xen.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

--------------519163A99AE3FE0EC7A8B8B6
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit

On 1/9/20 12:12 PM, George Dunlap wrote:
> libxl needs to be able to know when processes it forks have completed.
> 
> At the moment, libxl has two basic mode (with some variations).  In
> one mode -- libxl_sigchld_owner_libxl* -- libxl sets up its own
> SIGCHLD signal handler, and also handles the event loop that allows
> libxl to safely block until the child in question is finished (using a
> self-pipe for the SIGCHLD handler to notify the waiters that it's time
> to look for reaped children).
> 
> In the other mode, libxl does not set up the SIGCHLD handler, nor does
> it do anything with processing the event loop; it expects the library
> caller to handle the event loop itself.
> 
> The golang runtime manages its own processes, and thus must use
> SIGCHLD itself; and it has an easy way for other users to get SIGCHLD
> notifications.  However, because its event loop is hidden away behind
> abstractions, it's not easy to hook into; and there's no need -- the
> golang runtime assumes that C function calls may block, and handles
> everything behind the scenes.

FWIW, attached is a C program that behaves as I think golang would
behave, which hangs in `mainloop` mode.

It's actually got two modes: Run it without any arguments, and it will
run in "default" mode (not setting up a SIGCHLD nor setting
childproc_mode);  run with at least one argument (whatever it is), it
will run in `mainloop` mode, and hang after the second SIGCHLD event.

 -George

--------------519163A99AE3FE0EC7A8B8B6
Content-Type: text/x-csrc; name="xltest_sigchld_main.c"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="xltest_sigchld_main.c"

#include <unistd.h>
#include <stdlib.h>
#include <string.h>
#include <libxl.h>
#include <assert.h>
#include <pthread.h>
#include <poll.h>
#include <signal.h>
#include <fcntl.h>

char * malloc_copy(const char *src) {
  int len = strlen(src);
  char * dst = malloc(strlen(src)+1);

  strncpy(dst, src, len);

  return dst;
}

libxl_ctx *ctx;

int self_pipe_wakeup(int fd)
{
    /* Called from signal handlers, so needs to be async-signal-safe */
    static const char buf[1] = "";

    for (;;) {
        int r = write(fd, buf, 1);
        if (r==1) return 0;
        assert(r==-1);
        if (errno == EINTR) continue;
        if (errno == EWOULDBLOCK) return 0;
        if (!errno) abort();
        return errno;
    }
}

int self_pipe_eatall(int fd)
{
    char buf[256];
    for (;;) {
        int r = read(fd, buf, sizeof(buf));
        if (r == sizeof(buf)) continue;
        if (r >= 0) return 0;
        assert(r == -1);
        if (errno == EINTR) continue;
        if (errno == EWOULDBLOCK) return 0;
        assert(errno);
        return errno;
    }
}

int sigchld_selfpipe[2];

static void *sigchld_helper(void *fd) {
    struct pollfd pfd;
    int r;

    pfd.fd = (int)(unsigned long)fd;
    pfd.events = POLLIN | POLLHUP;

    while (true) {
        // Wait for a sigchld on [0]
        fprintf(stderr, "Waiting for self-pipe\n");
        r = poll(&pfd, 1, -1);
        if (r < 0) {
            if (errno == EINTR)
                continue;
            perror("poll");
            return NULL;
        }
        if (pfd.revents == POLLHUP) {
            fprintf(stderr, "Received POLLHUP, closing helper\n");
            return NULL;
        }
        fprintf(stderr, "Self-pipe received, calling libxl_childproc_sigchld_occurred\n");
        self_pipe_eatall(pfd.fd);
        libxl_childproc_sigchld_occurred(ctx);
    }

    return NULL;
}

static void sigchld_handler(int signo) {
    // Signal on pipe [1]
    fprintf(stderr, "SIGCHLD received, self-signaling\n");
    self_pipe_wakeup(sigchld_selfpipe[1]);
}

void setup_sigchld(void) {
    struct sigaction ours, old;
    pthread_t t;
    int i, flags, r;

    // Get self-signal pipe
    if (pipe(sigchld_selfpipe) < 0) {
        perror("Failed to create a pipe");
        exit(1);
    }

    r = pthread_create(&t, NULL, sigchld_helper, (void *)(unsigned long)sigchld_selfpipe[0]);
    if (r < 0) {
        perror("Creating helper thread");
        exit(1);
    }

    // Make non-blocking
    for (i = 0; i < 2; i++) {
        int fd = sigchld_selfpipe[i];
        flags = fcntl(fd, F_GETFL);
        if (flags == -1) {
            perror("Getting block flags");
            exit(1);
        }

        flags |= O_NONBLOCK;

        r = fcntl(fd, F_SETFL, flags);
        if (flags == -1) {
            perror("Setting pipe non-blocking");
            exit(1);
        }
    }

    memset(&ours,0,sizeof(ours));
    ours.sa_handler = sigchld_handler;
    sigemptyset(&ours.sa_mask);
    ours.sa_flags = SA_NOCLDSTOP | SA_RESTART;
    r = sigaction(SIGCHLD, &ours, &old);
    assert(!r);
}

int main(int argc, char * argv[]) {
    int rc;
    xentoollog_logger_stdiostream * xtl;
    libxl_domain_config cconfig;
    uint32_t domid;
    bool mainloop = false;

    if (argc > 1)
        mainloop=true;

    if (mainloop)
        setup_sigchld();

    xtl = xtl_createlogger_stdiostream(stderr, XTL_DEBUG, 0);
    rc = libxl_ctx_alloc(&ctx, LIBXL_VERSION, 0, (xentoollog_logger*)xtl);
    if (rc) {
        fprintf(stderr, "Getting libxl_ctx: %d", rc);
        exit(1);
    }

    if (mainloop) {
        libxl_childproc_hooks *cp = malloc(sizeof(*cp));

        cp->chldowner = libxl_sigchld_owner_mainloop;
        libxl_childproc_setmode(ctx, cp, NULL);
    }

    libxl_domain_config_init(&cconfig);
    libxl_domain_build_info_init_type(&cconfig.b_info, LIBXL_DOMAIN_TYPE_PV);

    cconfig.c_info.type = LIBXL_DOMAIN_TYPE_PV;
    cconfig.c_info.name = malloc_copy("c6-01");
    cconfig.b_info.max_vcpus = 4;
    cconfig.b_info.max_memkb = 2048*1024;
    cconfig.b_info.target_memkb = 2048*1024;
    cconfig.on_crash = LIBXL_ACTION_ON_SHUTDOWN_DESTROY;
    cconfig.b_info.bootloader = malloc_copy("pygrub");

    cconfig.num_disks = 1;
    cconfig.disks = malloc(sizeof(libxl_device_disk));
    libxl_device_disk_init(cconfig.disks);
    cconfig.disks[0].vdev = malloc_copy("hda");
    cconfig.disks[0].format = LIBXL_DISK_FORMAT_RAW;
    cconfig.disks[0].pdev_path = malloc_copy("/images/c6-01.raw");
    cconfig.disks[0].readwrite = 1;

    cconfig.num_nics = 1;
    cconfig.nics = malloc(sizeof(libxl_device_nic));
    libxl_device_nic_init(cconfig.nics);

    rc = libxl_domain_create_new(ctx, &cconfig, &domid, NULL, NULL);
    if (rc) {
        fprintf(stderr, "Creating domain: %d", rc);
        exit(1);
    }

    printf("Created domain with id %d", domid);

    libxl_domain_config_dispose(&cconfig);

    if (mainloop) {
        close(sigchld_selfpipe[1]);
        close(sigchld_selfpipe[0]);
    }

    return 0;
}

--------------519163A99AE3FE0EC7A8B8B6
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--------------519163A99AE3FE0EC7A8B8B6--

