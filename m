Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 486E6782D13
	for <lists+xen-devel@lfdr.de>; Mon, 21 Aug 2023 17:17:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.587644.918994 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qY6eV-0001Zh-KU; Mon, 21 Aug 2023 15:17:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 587644.918994; Mon, 21 Aug 2023 15:17:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qY6eV-0001Xv-Gg; Mon, 21 Aug 2023 15:17:11 +0000
Received: by outflank-mailman (input) for mailman id 587644;
 Mon, 21 Aug 2023 15:17:10 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=WiRE=EG=cloud.com=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1qY6eU-0001Xn-1i
 for xen-devel@lists.xenproject.org; Mon, 21 Aug 2023 15:17:10 +0000
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [2a00:1450:4864:20::335])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id caebbee8-4035-11ee-9b0c-b553b5be7939;
 Mon, 21 Aug 2023 17:17:07 +0200 (CEST)
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-3fed6c2a5cfso28824005e9.3
 for <xen-devel@lists.xenproject.org>; Mon, 21 Aug 2023 08:17:07 -0700 (PDT)
Received: from perard.uk.xensource.com (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 q1-20020a056000136100b003180027d67asm12637489wrz.19.2023.08.21.08.17.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Aug 2023 08:17:06 -0700 (PDT)
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
X-Inumbo-ID: caebbee8-4035-11ee-9b0c-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1692631027; x=1693235827;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=YzQdfYs6xmhhgJ7jfDYbEyX3/BYgph1r4B5q0WoGV1U=;
        b=VjZcet6KE8z4c6eioLO3mkaxLCvzsdZySEekr8gZPnMNUzuIBLGy1sVO5aFno4YsYl
         L7Z1HYw13ch6w81pd0Nk/34ghBBUm6WRoa7uGQ4vyPCxs+n9oynqnygA8EHDJl0XDUSt
         BSjGj/ZLWxB2dM6leJIUug4r/L01tGMIZjvr4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692631027; x=1693235827;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YzQdfYs6xmhhgJ7jfDYbEyX3/BYgph1r4B5q0WoGV1U=;
        b=Sq69hFaiQrkHddHuOTynG4PCAWKymaCR4JRAcVWEKHr2ly2zQotR64rI2Bza5eRVio
         salDHZY7UIilH9lcSDi4L63d6y9fU9ZCbGpUu0IPhAzg0HQHKSKNF+g2hFZHYIW+6m0D
         le9HaM8PwiyMsvEW+dIoaQiszu7+B7l9nAMyAeuXXXnOFNN2Fi0Hip/ugkr9U8yAUJ6f
         VKwvHyfrad3hTLDEvX2MclqOynlPlKMhRbtkRhf87TaNmPp5Ocdlyi7f8g6uUW0cfW/I
         pCHPR9qQjeb7A1FhJ1CO+sIF2ZZ6KCPrMZDxqKMsusXqzQecJ/Kt6hKjc5wlc48lbNmG
         wVdg==
X-Gm-Message-State: AOJu0Yyn4Xob4Tar50Xn6n7viiMSUzDTRtXVVojiEjzQR+IYMz6tWrbB
	Y+1cK7S5NSvSRN8m9C7WzmprjA==
X-Google-Smtp-Source: AGHT+IHgq/biSP89vVpL+IzoTIhTw7cJ9hlCS/ZumIEiMHSVf4xoOdnxzT6JtyKx4d6mMiDngaOd5A==
X-Received: by 2002:a1c:4b0e:0:b0:3fe:c7fe:206c with SMTP id y14-20020a1c4b0e000000b003fec7fe206cmr5241849wma.23.1692631027295;
        Mon, 21 Aug 2023 08:17:07 -0700 (PDT)
Date: Mon, 21 Aug 2023 16:17:06 +0100
From: Anthony PERARD <anthony.perard@citrix.com>
To: Juergen Gross <jgross@suse.com>
Cc: xen-devel@lists.xenproject.org,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
	Samuel Thibault <samuel.thibault@ens-lyon.org>,
	Julien Grall <jgrall@amazon.com>
Subject: Re: [PATCH v6] tools/xenstore: move xenstored sources into dedicated
 directory
Message-ID: <9c10e5ba-6b5a-4d97-bce2-908a588729f6@perard>
References: <20230821081422.17027-1-jgross@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230821081422.17027-1-jgross@suse.com>

On Mon, Aug 21, 2023 at 10:14:22AM +0200, Juergen Gross wrote:
> diff --git a/tools/xenstored/.gitignore b/tools/xenstored/.gitignore
> new file mode 100644
> index 0000000000..edbb5d79fe
> --- /dev/null
> +++ b/tools/xenstored/.gitignore
> @@ -0,0 +1 @@
> +xenstored

Could you write that "/xenstored" ? The prefix "/" just makes sure that
only the file in the current directory is ignored, and not any
"xenstored" in subdirectory. Just in case.

> diff --git a/tools/xenstored/Makefile b/tools/xenstored/Makefile
> new file mode 100644
> index 0000000000..f3bd3d43c4
> --- /dev/null
> +++ b/tools/xenstored/Makefile
> @@ -0,0 +1,48 @@
> +XEN_ROOT=$(CURDIR)/../..
> +include $(XEN_ROOT)/tools/Rules.mk
> +
> +include Makefile.common
> +
> +xenstored: LDLIBS += $(LDLIBS_libxenevtchn)
> +xenstored: LDLIBS += $(LDLIBS_libxengnttab)
> +xenstored: LDLIBS += $(LDLIBS_libxenctrl)
> +xenstored: LDLIBS += -lrt
> +xenstored: LDLIBS += $(SOCKET_LIBS)
> +
> +ifeq ($(CONFIG_SYSTEMD),y)
> +$(XENSTORED_OBJS-y): CFLAGS += $(SYSTEMD_CFLAGS)
> +xenstored: LDLIBS += $(SYSTEMD_LIBS)
> +endif
> +
> +TARGETS += xenstored

Could you change that to := instead of += ? TARGETS is currently
introduced with a := (in tools/xenstore/Makefile).

> diff --git a/tools/xs-clients/.gitignore b/tools/xs-clients/.gitignore
> new file mode 100644
> index 0000000000..233fd8228a
> --- /dev/null
> +++ b/tools/xs-clients/.gitignore
> @@ -0,0 +1,10 @@
> +xenstore
> +xenstore-chmod
> +xenstore-control
> +xenstore-exists
> +xenstore-list
> +xenstore-ls
> +xenstore-read
> +xenstore-rm
> +xenstore-watch
> +xenstore-write

Same thing here, could you prefix all those entries with "/"?

> diff --git a/tools/xenstore/Makefile b/tools/xs-clients/Makefile
> similarity index 74%
> rename from tools/xenstore/Makefile
> rename to tools/xs-clients/Makefile
> index dc39b6cb31..1c5740450a 100644
> --- a/tools/xenstore/Makefile
> +++ b/tools/xs-clients/Makefile

I'm tempted to ask for the targets "clients-install" and
"clients-uninstall" to be removed from this makefile. Nothing is calling
them in our build system and something outside the git tree that rely on
that would need to be adjusted to the new directory. But maybe that can
be done in a followup patch as it would help with reverting it if the
targets are actually useful.


In any case, the patch is already good:
Acked-by: Anthony PERARD <anthony.perard@citrix.com>

Thanks,

-- 
Anthony PERARD

