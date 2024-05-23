Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B2F88CCE1F
	for <lists+xen-devel@lfdr.de>; Thu, 23 May 2024 10:22:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.728193.1133022 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sA3hu-0001cn-Hu; Thu, 23 May 2024 08:21:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 728193.1133022; Thu, 23 May 2024 08:21:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sA3hu-0001Zg-FE; Thu, 23 May 2024 08:21:50 +0000
Received: by outflank-mailman (input) for mailman id 728193;
 Thu, 23 May 2024 08:21:49 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=cGfz=M2=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1sA3ht-0001Za-K9
 for xen-devel@lists.xenproject.org; Thu, 23 May 2024 08:21:49 +0000
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [2a00:1450:4864:20::629])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7f040bc2-18dd-11ef-b4bb-af5377834399;
 Thu, 23 May 2024 10:21:47 +0200 (CEST)
Received: by mail-ej1-x629.google.com with SMTP id
 a640c23a62f3a-a59a352bbd9so307453366b.1
 for <xen-devel@lists.xenproject.org>; Thu, 23 May 2024 01:21:47 -0700 (PDT)
Received: from ?IPV6:2003:e5:8729:4000:29eb:6d9d:3214:39d2?
 (p200300e58729400029eb6d9d321439d2.dip0.t-ipconnect.de.
 [2003:e5:8729:4000:29eb:6d9d:3214:39d2])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a5a179c822fsm1896097166b.138.2024.05.23.01.21.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 23 May 2024 01:21:46 -0700 (PDT)
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
X-Inumbo-ID: 7f040bc2-18dd-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1716452506; x=1717057306; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Vi031+qGJOuHKgdSFgi7xqaLmxkWTvLlJ5rgn7hheEw=;
        b=P/Cn+rax1C5jqmKBnGmINfjKNuFO5eweGuLNBNpvWDIFkYZUXcS3FeVKhgSQ1LKvJL
         IFeDA8aQBswtoihZ7byQLKxGfvpnQAEcsNWnJAUBSWmVqLanyzmLyZ3gBge3sHJ9WwjZ
         6eQVSwkm4HjU1kRH+rJseAvRZjFL1etU8UYyCmNjw9TadHIpoXBYMVQ/fn+5/RyUpg2/
         AxLYU4nBAo1fM/BLRZ4SKwbOU0Tv7wc4frLHtp1LIJVktbE0860jq3wQ9drBhuoJmEOs
         r3M0df3UfmlRXco4jEdb/D3rm8aqIeSRyQSaQrR8Cud3DOAWnUClohL+11Hd2+ILIsg7
         gdWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716452506; x=1717057306;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Vi031+qGJOuHKgdSFgi7xqaLmxkWTvLlJ5rgn7hheEw=;
        b=GJPoTD8c64AWAeOhJfEJcMkUQhFzv8MfAClFah9InB5r0gZWuNEQRkgG5rbW+mCHb8
         FM6XL/YIAIt6BWQj/9kYHKV/kr/pcyC/cCuKrI6sfCndZRKMr5bVIONfXaNjlKpytEFz
         /jLCKTSMAocSWImpAzjuvHweqY14DzsbtBUh7YQPbNJUQmJAczEImIF/68IRaZ9e/52h
         OajiEurxi2XPH//In7aYQOVjmiDjqKFpu1gwOAx2MO6+dbPBtgRiIr3Y9UL87YHdBldX
         9XOPbOkzMT6aVI6S0zVb3TMhVXZ/SwILPppD9UCnHnYJfH4e9DVydoFpNYiFsflDw4am
         DXzA==
X-Forwarded-Encrypted: i=1; AJvYcCX69BditXOe/Som0FsMiP7a+ySKtY2GGWgRKfQ1U2r3HZp15PHtUttFOWhuAEEM5to0vsPCBC90z/m3QjgNY1EwTKnDMeigzOVmfWByyqo=
X-Gm-Message-State: AOJu0YyjEL+KMs84UAyy3CmfLNPO6Bk5XleJiBdb8tbP8t2nl6vZMBhU
	w/dQifsVR7fUf7tKiPO4iu41zIe9zSWGPxBZlfynQZyxPJlqjvy6PNNy7JDL1BI=
X-Google-Smtp-Source: AGHT+IE6SgDfMfz2P1eoa/c5xe/G9khVO0tHSFiswaPSnQoW34giQqKJ6pGN2Zr9USFyLE/xDeJvlw==
X-Received: by 2002:a17:906:3bc3:b0:a5a:3908:f4ad with SMTP id a640c23a62f3a-a623e8e75f1mr129920766b.10.1716452506585;
        Thu, 23 May 2024 01:21:46 -0700 (PDT)
Message-ID: <3937c37d-8872-463d-8881-8794c0966580@suse.com>
Date: Thu, 23 May 2024 10:21:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/4] tools: Import standalone sd_notify()
 implementation from systemd
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
Cc: Anthony PERARD <anthony@xenproject.org>,
 George Dunlap <George.Dunlap@citrix.com>, Jan Beulich <JBeulich@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Christian Lindig <christian.lindig@citrix.com>,
 =?UTF-8?B?RWR3aW4gVMO2csO2aw==?= <edwin.torok@cloud.com>
References: <20240516185804.3309725-1-andrew.cooper3@citrix.com>
 <20240516185804.3309725-3-andrew.cooper3@citrix.com>
Content-Language: en-US
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
In-Reply-To: <20240516185804.3309725-3-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 16.05.24 20:58, Andrew Cooper wrote:
> ... in order to avoid linking against the whole of libsystemd.
> 
> Only minimal changes to the upstream copy, to function as a drop-in
> replacement for sd_notify() and as a header-only library.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

With s/cleanup(sd_closep)/cleanup(xen_sd_closep)/

Reviewed-by: Juergen Gross <jgross@suse.com>


Juergen

> ---
> CC: Anthony PERARD <anthony@xenproject.org>
> CC: Juergen Gross <jgross@suse.com>
> CC: George Dunlap <George.Dunlap@citrix.com>
> CC: Jan Beulich <JBeulich@suse.com>
> CC: Stefano Stabellini <sstabellini@kernel.org>
> CC: Julien Grall <julien@xen.org>
> CC: Christian Lindig <christian.lindig@citrix.com>
> CC: Edwin Török <edwin.torok@cloud.com>
> 
> v2:
>   * New
> ---
>   tools/include/xen-sd-notify.h | 98 +++++++++++++++++++++++++++++++++++
>   1 file changed, 98 insertions(+)
>   create mode 100644 tools/include/xen-sd-notify.h
> 
> diff --git a/tools/include/xen-sd-notify.h b/tools/include/xen-sd-notify.h
> new file mode 100644
> index 000000000000..eda9d8b22d9e
> --- /dev/null
> +++ b/tools/include/xen-sd-notify.h
> @@ -0,0 +1,98 @@
> +/* SPDX-License-Identifier: MIT-0 */
> +
> +/*
> + * Implement the systemd notify protocol without external dependencies.
> + * Supports both readiness notification on startup and on reloading,
> + * according to the protocol defined at:
> + * https://www.freedesktop.org/software/systemd/man/latest/sd_notify.html
> + * This protocol is guaranteed to be stable as per:
> + * https://systemd.io/PORTABILITY_AND_STABILITY/
> + *
> + * Differences from the upstream copy:
> + * - Rename/rework as a drop-in replacement for systemd/sd-daemon.h
> + * - Only take the subset Xen cares about
> + * - Respect -Wdeclaration-after-statement
> + */
> +
> +#ifndef XEN_SD_NOTIFY
> +#define XEN_SD_NOTIFY
> +
> +#include <errno.h>
> +#include <stddef.h>
> +#include <stdlib.h>
> +#include <sys/socket.h>
> +#include <sys/un.h>
> +#include <unistd.h>
> +
> +static inline void xen_sd_closep(int *fd) {
> +  if (!fd || *fd < 0)
> +    return;
> +
> +  close(*fd);
> +  *fd = -1;
> +}
> +
> +static inline int xen_sd_notify(const char *message) {
> +  union sockaddr_union {
> +    struct sockaddr sa;
> +    struct sockaddr_un sun;
> +  } socket_addr = {
> +    .sun.sun_family = AF_UNIX,
> +  };
> +  size_t path_length, message_length;
> +  ssize_t written;
> +  const char *socket_path;
> +  int __attribute__((cleanup(sd_closep))) fd = -1;
> +
> +  /* Verify the argument first */
> +  if (!message)
> +    return -EINVAL;
> +
> +  message_length = strlen(message);
> +  if (message_length == 0)
> +    return -EINVAL;
> +
> +  /* If the variable is not set, the protocol is a noop */
> +  socket_path = getenv("NOTIFY_SOCKET");
> +  if (!socket_path)
> +    return 0; /* Not set? Nothing to do */
> +
> +  /* Only AF_UNIX is supported, with path or abstract sockets */
> +  if (socket_path[0] != '/' && socket_path[0] != '@')
> +    return -EAFNOSUPPORT;
> +
> +  path_length = strlen(socket_path);
> +  /* Ensure there is room for NUL byte */
> +  if (path_length >= sizeof(socket_addr.sun.sun_path))
> +    return -E2BIG;
> +
> +  memcpy(socket_addr.sun.sun_path, socket_path, path_length);
> +
> +  /* Support for abstract socket */
> +  if (socket_addr.sun.sun_path[0] == '@')
> +    socket_addr.sun.sun_path[0] = 0;
> +
> +  fd = socket(AF_UNIX, SOCK_DGRAM|SOCK_CLOEXEC, 0);
> +  if (fd < 0)
> +    return -errno;
> +
> +  if (connect(fd, &socket_addr.sa, offsetof(struct sockaddr_un, sun_path) + path_length) != 0)
> +    return -errno;
> +
> +  written = write(fd, message, message_length);
> +  if (written != (ssize_t) message_length)
> +    return written < 0 ? -errno : -EPROTO;
> +
> +  return 1; /* Notified! */
> +}
> +
> +static inline int sd_notify(int unset_environment, const char *message) {
> +    int r = xen_sd_notify(message);
> +
> +    if (unset_environment)
> +        unsetenv("NOTIFY_SOCKET");
> +
> +    return r;
> +}
> +
> +#endif /* XEN_SD_NOTIFY */


