Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7353F605E9F
	for <lists+xen-devel@lfdr.de>; Thu, 20 Oct 2022 13:18:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.426598.675141 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1olTYi-0000QQ-42; Thu, 20 Oct 2022 11:17:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 426598.675141; Thu, 20 Oct 2022 11:17:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1olTYi-0000Ne-14; Thu, 20 Oct 2022 11:17:56 +0000
Received: by outflank-mailman (input) for mailman id 426598;
 Thu, 20 Oct 2022 11:17:54 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=2/78=2V=linaro.org=philmd@srs-se1.protection.inumbo.net>)
 id 1olTYg-0000NY-Q7
 for xen-devel@lists.xenproject.org; Thu, 20 Oct 2022 11:17:54 +0000
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [2a00:1450:4864:20::334])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d2c9c332-5068-11ed-8fd0-01056ac49cbb;
 Thu, 20 Oct 2022 13:17:46 +0200 (CEST)
Received: by mail-wm1-x334.google.com with SMTP id
 fn7-20020a05600c688700b003b4fb113b86so1960891wmb.0
 for <xen-devel@lists.xenproject.org>; Thu, 20 Oct 2022 04:17:53 -0700 (PDT)
Received: from [10.50.0.10]
 (ec2-54-194-108-71.eu-west-1.compute.amazonaws.com. [54.194.108.71])
 by smtp.gmail.com with ESMTPSA id
 k33-20020a05600c1ca100b003c6cd82596esm2672545wms.43.2022.10.20.04.17.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 20 Oct 2022 04:17:52 -0700 (PDT)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
X-Inumbo-ID: d2c9c332-5068-11ed-8fd0-01056ac49cbb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=aji4vbaAsAZUvQBuxSvdAC7h4FHkKHnOC3DlhOWZEd0=;
        b=moo5qfDu/Ser6hNax3oFsOlv+Dpkmcdt1iwnOv9cljJVLF1IDg0B0DBVqK28e23eVn
         sabAfeMgV5d791gjcbb2ExVERO1ipRXCb2MvhDnDPFv9xy8kGiNy5cTYIWztDmzrj051
         6ImKulsnmgwr4JnCz3vJoI+YbEX7tA0sU3VI56Noq4n/Q679uoiR6SHTqapYGpJtW+3l
         DIx54ZuXspT0Mh6mpEdkdyjEwZZkNTDg7WJs64CgaiSfpnCXLOyQUbG3gW6iQYtsKqiZ
         d1YSwfwZcESrk5FeXn8vi3Bcv5Me7oDCtwNNfpzL6OtuaOtbXJAgvKkcf8L+zFSCGrMh
         WDNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=aji4vbaAsAZUvQBuxSvdAC7h4FHkKHnOC3DlhOWZEd0=;
        b=ZKQP3IUq49oU21BHqAIGEBK/vRQpBvV3YvgQdEFyC91VZwQsZldfz1VeuHw+VVbXnw
         WfKPheGP8KFQ9E7PbmSzDCbwzHFWryEJSZ7dbGPTlz+zjVUcK5s7X1oLKkuj0HXVTq31
         PNWUA/dXV+7vls7D5/6yf+CUtzcQiOZz5lqecwD3Cr3OIvdH0C8kCSLcIEgFDyQkPWe6
         Uy3VK21l9cWvK/31Qr8ZBGb0JEaOB4BnyuSo/iOi7GaTco549iaXWORx/QGR12QKWjn8
         0LFcmtTd2xAxgM7NSdc7hYGvCp+z3QSvWH9n8fxxuBTJwfJzERlKsDH26jIvchIP493V
         ISog==
X-Gm-Message-State: ACrzQf1t+DqPE52oJ368brXJwE9rYHHJ/VfjnAEZa4hWQlHVntNbCk9/
	IDVF/Z1vTEiwyPni53THxGppwQ==
X-Google-Smtp-Source: AMsMyM5yjZYeFyMUFDsrwK9W8Au6afb9js5tIWn4HVsweRZFCfALDEiJuOLfDDfch4uFJFt/Dl8Q8Q==
X-Received: by 2002:a05:600c:34d4:b0:3c6:f695:b5f8 with SMTP id d20-20020a05600c34d400b003c6f695b5f8mr8951954wmq.203.1666264672833;
        Thu, 20 Oct 2022 04:17:52 -0700 (PDT)
Message-ID: <15217f04-d689-7579-1501-320761b2f6e7@linaro.org>
Date: Thu, 20 Oct 2022 13:17:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.3.2
Subject: Re: [PATCH v12 10/17] net: dgram: make dgram_dst generic
Content-Language: en-US
To: Laurent Vivier <lvivier@redhat.com>, qemu-devel@nongnu.org
Cc: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 xen-devel@lists.xenproject.org, Eric Blake <eblake@redhat.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Greg Kurz <groug@kaod.org>,
 Jason Wang <jasowang@redhat.com>, Anthony Perard
 <anthony.perard@citrix.com>, Thomas Huth <thuth@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Samuel Thibault <samuel.thibault@ens-lyon.org>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, Paul Durrant <paul@xen.org>,
 Stefan Weil <sw@weilnetz.de>, Markus Armbruster <armbru@redhat.com>,
 Stefano Brivio <sbrivio@redhat.com>
References: <20221020091624.48368-1-lvivier@redhat.com>
 <20221020091624.48368-11-lvivier@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20221020091624.48368-11-lvivier@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 20/10/22 11:16, Laurent Vivier wrote:
> dgram_dst is a sockaddr_in structure. To be able to use it with
> unix socket, use a pointer to a generic sockaddr structure.
> 
> Rename it dest_addr, and store socket length in dest_len.
> 
> Signed-off-by: Laurent Vivier <lvivier@redhat.com>
> Reviewed-by: Stefano Brivio <sbrivio@redhat.com>
> Acked-by: Michael S. Tsirkin <mst@redhat.com>
> ---
>   net/dgram.c | 82 ++++++++++++++++++++++++++++++++++-------------------
>   1 file changed, 53 insertions(+), 29 deletions(-)

>   static NetClientInfo net_dgram_socket_info = {
> @@ -260,7 +263,7 @@ static NetDgramState *net_dgram_fd_init(NetClientState *peer,
>                                           SocketAddress *mcast,
>                                           Error **errp)
>   {
> -    struct sockaddr_in saddr;
> +    struct sockaddr_in *saddr = NULL;

Preferrably g_autofree.

>       int newfd;
>       NetClientState *nc;
>       NetDgramState *s;
> @@ -275,31 +278,32 @@ static NetDgramState *net_dgram_fd_init(NetClientState *peer,
>       qapi_free_SocketAddress(sa);
>   
>       /*
> -     * fd passed: multicast: "learn" dgram_dst address from bound address and
> +     * fd passed: multicast: "learn" dest_addr address from bound address and
>        * save it. Because this may be "shared" socket from a "master" process,
>        * datagrams would be recv() by ONLY ONE process: we must "clone" this
>        * dgram socket --jjo
>        */
>   
>       if (is_fd && mcast != NULL) {
> -            if (convert_host_port(&saddr, mcast->u.inet.host,
> -                                  mcast->u.inet.port, errp) < 0) {
> +            saddr = g_new(struct sockaddr_in, 1);
> +
> +            if (convert_host_port(saddr, mcast->u.inet.host, mcast->u.inet.port,
> +                                  errp) < 0) {
>                   goto err;
>               }
>               /* must be bound */
> -            if (saddr.sin_addr.s_addr == 0) {
> +            if (saddr->sin_addr.s_addr == 0) {
>                   error_setg(errp, "can't setup multicast destination address");
>                   goto err;
>               }
>               /* clone dgram socket */
> -            newfd = net_dgram_mcast_create(&saddr, NULL, errp);
> +            newfd = net_dgram_mcast_create(saddr, NULL, errp);
>               if (newfd < 0) {
>                   goto err;
>               }
>               /* clone newfd to fd, close newfd */
>               dup2(newfd, fd);
>               close(newfd);
> -
>       }
>   
>       nc = qemu_new_net_client(&net_dgram_socket_info, peer, model, name);
> @@ -311,21 +315,20 @@ static NetDgramState *net_dgram_fd_init(NetClientState *peer,
>       net_dgram_read_poll(s, true);
>   
>       /* mcast: save bound address as dst */
> -    if (is_fd && mcast != NULL) {
> -        s->dgram_dst = saddr;
> +    if (saddr) {
> +        g_assert(s->dest_addr == NULL);
> +        s->dest_addr = (struct sockaddr *)saddr;
> +        s->dest_len = sizeof(*saddr);
>           qemu_set_info_str(nc, "fd=%d (cloned mcast=%s:%d)", fd,
> -                          inet_ntoa(saddr.sin_addr), ntohs(saddr.sin_port));
> +                          inet_ntoa(saddr->sin_addr), ntohs(saddr->sin_port));
>       } else {
> -        if (sa_type == SOCKET_ADDRESS_TYPE_UNIX) {
> -            s->dgram_dst.sin_family = AF_UNIX;
> -        }
> -
>           qemu_set_info_str(nc, "fd=%d %s", fd, SocketAddressType_str(sa_type));
>       }
>   
>       return s;
>   
>   err:
> +    g_free(saddr);
>       closesocket(fd);
>       return NULL;
>   }
> @@ -339,21 +342,24 @@ static int net_dgram_mcast_init(NetClientState *peer,
>   {
>       NetDgramState *s;
>       int fd, ret;
> -    struct sockaddr_in saddr;
> +    struct sockaddr_in *saddr;

Preferrably:

   g_autofree struct sockaddr_in *saddr = NULL.

>   
>       if (remote->type != SOCKET_ADDRESS_TYPE_INET) {
>           error_setg(errp, "multicast only support inet type");
>           return -1;
>       }
>   
> -    if (convert_host_port(&saddr, remote->u.inet.host, remote->u.inet.port,
> +    saddr = g_new(struct sockaddr_in, 1);
> +    if (convert_host_port(saddr, remote->u.inet.host, remote->u.inet.port,
>                             errp) < 0) {
> +        g_free(saddr);
>           return -1;
>       }
>   
>       if (!local) {
> -        fd = net_dgram_mcast_create(&saddr, NULL, errp);
> +        fd = net_dgram_mcast_create(saddr, NULL, errp);
>           if (fd < 0) {
> +            g_free(saddr);
>               return -1;
>           }
>       } else {
> @@ -362,13 +368,15 @@ static int net_dgram_mcast_init(NetClientState *peer,
>               struct in_addr localaddr;
>   
>               if (inet_aton(local->u.inet.host, &localaddr) == 0) {
> +                g_free(saddr);
>                   error_setg(errp, "localaddr '%s' is not a valid IPv4 address",
>                              local->u.inet.host);
>                   return -1;
>               }
>   
> -            fd = net_dgram_mcast_create(&saddr, &localaddr, errp);
> +            fd = net_dgram_mcast_create(saddr, &localaddr, errp);
>               if (fd < 0) {
> +                g_free(saddr);
>                   return -1;
>               }
>               break;
> @@ -376,16 +384,19 @@ static int net_dgram_mcast_init(NetClientState *peer,
>           case SOCKET_ADDRESS_TYPE_FD:
>               fd = monitor_fd_param(monitor_cur(), local->u.fd.str, errp);
>               if (fd == -1) {
> +                g_free(saddr);
>                   return -1;
>               }
>               ret = qemu_socket_try_set_nonblock(fd);
>               if (ret < 0) {
> +                g_free(saddr);
>                   error_setg_errno(errp, -ret, "%s: Can't use file descriptor %d",
>                                    name, fd);
>                   return -1;
>               }
>               break;
>           default:
> +            g_free(saddr);
>               error_setg(errp, "only support inet or fd type for local");
>               return -1;
>           }
> @@ -395,13 +406,17 @@ static int net_dgram_mcast_init(NetClientState *peer,
>                             local->type == SOCKET_ADDRESS_TYPE_FD,
>                             remote, errp);
>       if (!s) {
> +        g_free(saddr);
>           return -1;
>       }
>   
> -    s->dgram_dst = saddr;
> +    g_assert(s->dest_addr == NULL);
> +    s->dest_addr = (struct sockaddr *)saddr;
> +    s->dest_len = sizeof(*saddr);
> +
> +    qemu_set_info_str(&s->nc, "mcast=%s:%d", inet_ntoa(saddr->sin_addr),
> +                      ntohs(saddr->sin_port));
>   
> -    qemu_set_info_str(&s->nc, "mcast=%s:%d", inet_ntoa(saddr.sin_addr),
> -                      ntohs(saddr.sin_port));
>       return 0;
>   
>   }
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


