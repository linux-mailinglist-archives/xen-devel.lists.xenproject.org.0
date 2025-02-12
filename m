Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A4A9AA331C1
	for <lists+xen-devel@lfdr.de>; Wed, 12 Feb 2025 22:53:39 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.886784.1296390 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tiKfK-0000Ww-8U; Wed, 12 Feb 2025 21:53:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 886784.1296390; Wed, 12 Feb 2025 21:53:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tiKfK-0000Uv-5z; Wed, 12 Feb 2025 21:53:06 +0000
Received: by outflank-mailman (input) for mailman id 886784;
 Wed, 12 Feb 2025 21:53:05 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=xJ3x=VD=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1tiKfJ-0000Up-93
 for xen-devel@lists.xenproject.org; Wed, 12 Feb 2025 21:53:05 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [2604:1380:4641:c500::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id bb53fad0-e98b-11ef-a075-877d107080fb;
 Wed, 12 Feb 2025 22:53:04 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 37D215C5E87;
 Wed, 12 Feb 2025 21:52:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 65994C4CEDF;
 Wed, 12 Feb 2025 21:53:00 +0000 (UTC)
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
X-Inumbo-ID: bb53fad0-e98b-11ef-a075-877d107080fb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739397181;
	bh=5lteKVHFadi6Om/Oxk+1cqTB22Bq7SMwpbiDayLzqhM=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=Zdlod3RXvQQKQCjpLpyvEZMT0OYLSW/NQi0TEK+LuL5UZMlkV7T8Aj8n8uYIq/zNW
	 ys7766yvLh/x0Un5IsZ8GBEbuscrG2RnxmKnVY5xhbH6ZAwcFabXSBydhChoZoKgN4
	 XdCttJynBG33DN9dflOF90YlZDr/hRuFeizY2DncdGLnTI4y/BJElnNcmRqgtaEP2Y
	 0TgL8N3qj7TrPBx/7KcCa9EK42mwiXVRHXVdr+iKumKiIHTlLnBcWVDjQn9T0E5oVJ
	 e5Sfn2xykb1NWDA7LQdXIPD2Y72Vvo0P/DLQlMQCYWul22KyQiYT4YHgxhhJTe2+fI
	 qEC2ddtZxCSxQ==
Date: Wed, 12 Feb 2025 13:52:59 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
cc: Xen-devel <xen-devel@lists.xenproject.org>, committers@xenproject.org, 
    Jan Beulich <jbeulich@suse.com>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
    Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>, 
    Bertrand Marquis <bertrand.marquis@arm.com>, 
    Michal Orzel <michal.orzel@amd.com>
Subject: Re: [BUG?] Wrong RC reported during 'make install'
In-Reply-To: <69a52464-4e2e-43fc-9792-46d7a9614a80@gmail.com>
Message-ID: <alpine.DEB.2.22.394.2502121347430.619090@ubuntu-linux-20-04-desktop>
References: <69a52464-4e2e-43fc-9792-46d7a9614a80@gmail.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-1386328416-1739397181=:619090"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-1386328416-1739397181=:619090
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT

On Wed, 12 Feb 2025, Oleksii Kurochko wrote:
> Hello everyone,
> 
> During the installation of Xen on an ARM server machine from the source code,
> I found that the wrong release candidate (rc) is being used:
>   $ make install  
>     install -m0644 -p xen //boot/xen-4.20-rc  
>     install: cannot remove ‘//boot/xen-4.20-rc’: Permission denied  
>     make[1]: *** [Makefile:507: _install] Error 1
> My expectation is that it should be xen-4.20-rc4.
> 
> I'm not sure if this behavior is intentional or if users are expected to set
> the XEN_VENDORVERSION variable manually to ensure the correct release
> candidate number.
> 
> In my opinion, we should set the proper release candidate number after
> "xen-4.20-rc" automatically.
> 
> Does anyone have any thoughts or suggestions on how to resolve this issue?

Hi Oleksii,

I did a quick test and I see exactly the same on x86 as well. This patch
fixes it, but then it would need someone to update the RC number in
xen/Makefile every time a new RC is made.

---
xen: add RC version number to xen filename

Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>

commit 319ac724748f2f03a5cc6e9648c9151f519eaeac
diff --git a/xen/Makefile b/xen/Makefile
index 65b460e2b4..3b395e1ead 100644
--- a/xen/Makefile
+++ b/xen/Makefile
@@ -6,6 +6,7 @@ this-makefile := $(call lastword,$(MAKEFILE_LIST))
 # All other places this is stored (eg. compile.h) should be autogenerated.
 export XEN_VERSION       = 4
 export XEN_SUBVERSION    = 20
+export XEN_VENDORVERSION = 4
 export XEN_EXTRAVERSION ?= -rc$(XEN_VENDORVERSION)
 export XEN_FULLVERSION   = $(XEN_VERSION).$(XEN_SUBVERSION)$(XEN_EXTRAVERSION)
 -include xen-version
--8323329-1386328416-1739397181=:619090--

