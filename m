Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0203B539564
	for <lists+xen-devel@lfdr.de>; Tue, 31 May 2022 19:23:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.339917.564836 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nw5ZL-0002GA-Ab; Tue, 31 May 2022 17:22:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 339917.564836; Tue, 31 May 2022 17:22:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nw5ZL-0002Ck-7j; Tue, 31 May 2022 17:22:11 +0000
Received: by outflank-mailman (input) for mailman id 339917;
 Tue, 31 May 2022 17:22:10 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/bi/=WH=citrix.com=prvs=1435b4b80=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1nw5ZJ-0002Ce-V0
 for xen-devel@lists.xenproject.org; Tue, 31 May 2022 17:22:10 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 310e22a6-e106-11ec-bd2c-47488cf2e6aa;
 Tue, 31 May 2022 19:22:07 +0200 (CEST)
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
X-Inumbo-ID: 310e22a6-e106-11ec-bd2c-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1654017727;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Qhk2n5usJqKedYq7mN0FzsbpOhYj3dAcM2lzVNe5OVI=;
  b=EK27l0aHO1fTSjzGV4htEt1CbtfmQ9qX8DTCU9Gs33EoRWZzeCvUwBLG
   te2WabR8936II2xXukxYfRYR611WKIYdNjJjp1MlraPLXCBIh2iVwofWV
   q1uk5UH37wU/gpgNpfr7HdyrH0ZtvrBzuxA39nNgQqgVXwkGtUnoHqBpT
   A=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 5.1
X-MesageID: 75082381
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:k9v3Xq5EzfTBPXnDjPVbCAxRtFDHchMFZxGqfqrLsTDasY5as4F+v
 moXUTzUbPffNGf3Kd9zaIu+8EgP6pSAyNFrGQJr/no8Hi5G8cbLO4+Ufxz6V8+wwmwvb67FA
 +E2MISowBUcFyeEzvuVGuG96yE6j8lkf5KkYAL+EnkZqTRMFWFw0HqPp8Zj2tQy2YXiWlvX0
 T/Pi5a31GGNimYc3l08s8pvmDs31BglkGpF1rCWTakjUG72zxH5PrpGTU2CByKQrr1vNvy7X
 47+IISRpQs1yfuP5uSNyd4XemVSKlLb0JPnZnB+A8BOiTAazsA+PzpS2FPxpi67hh3Q9+2dx
 umhurT3UFcDB6Pmht8ydB5ZEHpXPrBg2LLudC3XXcy7lyUqclPpyvRqSko3IZcZ6qB8BmQmG
 f4wcW5XKErZ3qTvnez9GrIEascLdaEHOKsWvG1gyjfIS+4rW5nZT43B5MNC3Sd2jcdLdRrbT
 5VEMWo1N0SZC/FJEntJKIogu9mLvXTcLSFqlV2Yq4RuumeGmWSd15CyaYGIK7RmX/59gUKwt
 m/AuWPjDXkyNtOFziGe2mmxneKJliT+MKoQHbu07O93g3Wcw2USDFsdUl7Tiem0jAuyVsxSL
 2QQ+zEytu4i+UqzVN7/Uhak5nmesXYht8F4SrNgrlvXk+yNvljfVjNsoiN9hMIO89ZmbwUk/
 EGysPTuBD80mb6Ib1KQ3+LBxd+tAhT5PVPudAddE1ZevYC+/d9j5v7cZo09SfDo17UZDRm1m
 mnX93Zm2t3/mOZRj82GEUb7byVAT3QjZio8/U3pU22s9WuVj6b1NtXzuTA3ARutRbt1r2VtX
 1BewqByFMhUUfmweNWlGY3h5o2B6fefKyH7ilVyBZQn/DnF0yf9INsBu2wgehkyapdsldrVj
 Kj74Fg52XOuFCHyMf8fj3yZV6zGMpQM5fy6D6uJP7Kik7B6dROd/TEGWKJj9zmFraTYqolmY
 c3zWZ/1VR4yUP07pBLrFrx1+eJ6mUgDKZb7GMmTI+KPiuLOOhZ4iN4tbTOzUwzOxPrc/V+Iq
 o0FapfiJtc2eLSWXxQ7OLU7dTgiRUXXz7iv9qS7qsbrztJaJVwc
IronPort-HdrOrdr: A9a23:6sxuJ6kgTpb1UlkeJFLjSOHQXqTpDfIs3DAbv31ZSRFFG/Fxl6
 iV8sjz8SWE7Ar5OUtQ/OxoV5PsfZqxz/JICMwqTNCftWrdyQmVxeNZjbcKqgeIc0aVygce79
 YCT0EXMqyXMbEQt6fHCWeDfOod/A==
X-IronPort-AV: E=Sophos;i="5.91,265,1647316800"; 
   d="scan'208";a="75082381"
Date: Tue, 31 May 2022 18:21:37 +0100
From: Anthony PERARD <anthony.perard@citrix.com>
To: Jason Andryuk <jandryuk@gmail.com>
CC: <xen-devel@lists.xenproject.org>, Wei Liu <wl@xen.org>, Juergen Gross
	<jgross@suse.com>
Subject: Re: [PATCH] libxl: Don't leak self pipes
Message-ID: <YpZOoV9h6/1NG9Pa@perard.uk.xensource.com>
References: <20220524163152.19948-1-jandryuk@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20220524163152.19948-1-jandryuk@gmail.com>

On Tue, May 24, 2022 at 12:31:52PM -0400, Jason Andryuk wrote:
> libxl is leaking self pipes to child processes.  These can be seen when
> running with env var _LIBXL_DEBUG_EXEC_FDS=1:
> 
> libxl: debug: libxl_aoutils.c:593:libxl__async_exec_start: forking to execute: /etc/xen/scripts/vif-bridge online
> [Detaching after fork from child process 5099]
> libxl: execing /etc/xen/scripts/vif-bridge: fd 4 is open to pipe:[46805] with flags 0
> libxl: execing /etc/xen/scripts/vif-bridge: fd 13 is open to pipe:[46807] with flags 0
> libxl: execing /etc/xen/scripts/vif-bridge: fd 14 is open to pipe:[46807] with flags 0
> libxl: execing /etc/xen/scripts/vif-bridge: fd 19 is open to pipe:[48570] with flags 0
> libxl: execing /etc/xen/scripts/vif-bridge: fd 20 is open to pipe:[48570] with flags 0
> 
> (fd 3 is also open, but the check only starts at 4 for some reason.)
> 
> For xl, this is the poller created by libxl_ctx_alloc, the poller
> created by do_domain_create -> libxl__ao_create, and the self pipe for
> libxl__sigchld_needed.  Set CLOEXEC on the FDs so they are not leaked
> into children.
> 
> Signed-off-by: Jason Andryuk <jandryuk@gmail.com>
> ---
> Maybe the setting wants to move into libxl__pipe_nonblock()?  Poller &
> sigchld are the only callers of that function.

No because we could want a pipe which survive fork/exec. The function
would need to be renamed. I think it's fine to set cloexec on the spot.

> ---
> diff --git a/tools/libs/light/libxl_event.c b/tools/libs/light/libxl_event.c
> index c8bcd13960..8d24613921 100644
> --- a/tools/libs/light/libxl_event.c
> +++ b/tools/libs/light/libxl_event.c
> @@ -1800,6 +1800,9 @@ int libxl__poller_init(libxl__gc *gc, libxl__poller *p)
>      rc = libxl__pipe_nonblock(CTX, p->wakeup_pipe);
>      if (rc) goto out;
>  
> +    libxl_fd_set_cloexec(CTX, p->wakeup_pipe[0], 1);
> +    libxl_fd_set_cloexec(CTX, p->wakeup_pipe[1], 1);

I think that's ok. I tried to find out if pollers needs to survive a
fork/exec, but that doesn't seems to be the case. Pollers are only used
by libxl's event machinery, and in a single CTX I think.

> diff --git a/tools/libs/light/libxl_fork.c b/tools/libs/light/libxl_fork.c
> index 676a14bb28..b13659d231 100644
> --- a/tools/libs/light/libxl_fork.c
> +++ b/tools/libs/light/libxl_fork.c
> @@ -387,6 +387,8 @@ int libxl__sigchld_needed(libxl__gc *gc) /* non-reentrant, idempotent */
>      if (CTX->sigchld_selfpipe[0] < 0) {
>          rc = libxl__pipe_nonblock(CTX, CTX->sigchld_selfpipe);
>          if (rc) goto out;
> +        libxl_fd_set_cloexec(CTX, CTX->sigchld_selfpipe[0], 1);
> +        libxl_fd_set_cloexec(CTX, CTX->sigchld_selfpipe[1], 1);

These ones should be also ok, as the pipe is only used for the SIGCHLD
handler so not shared outside of libxl.


So the patch looks good, and hopefully we don't break libvirt.

Reviewed-by: Anthony PERARD <anthony.perard@citrix.com>

Thanks,

-- 
Anthony PERARD

