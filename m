Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D5ED95B6DC6
	for <lists+xen-devel@lfdr.de>; Tue, 13 Sep 2022 14:55:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.406381.648769 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oY5RP-0001Qk-Ue; Tue, 13 Sep 2022 12:55:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 406381.648769; Tue, 13 Sep 2022 12:55:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oY5RP-0001NK-QZ; Tue, 13 Sep 2022 12:55:03 +0000
Received: by outflank-mailman (input) for mailman id 406381;
 Tue, 13 Sep 2022 12:55:03 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+eTZ=ZQ=chiark.greenend.org.uk=ijackson@srs-se1.protection.inumbo.net>)
 id 1oY5RO-0001NE-JU
 for xen-devel@lists.xenproject.org; Tue, 13 Sep 2022 12:55:03 +0000
Received: from chiark.greenend.org.uk (v6.chiark.greenend.org.uk
 [2001:ba8:1e3::]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4649f7c8-3363-11ed-9761-273f2230c3a0;
 Tue, 13 Sep 2022 14:55:00 +0200 (CEST)
Received: by chiark.greenend.org.uk (Debian Exim 4.94.2 #2) with local
 (return-path ijackson@chiark.greenend.org.uk)
 id 1oY5RK-0005Cw-By; Tue, 13 Sep 2022 13:54:58 +0100
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
X-Inumbo-ID: 4649f7c8-3363-11ed-9761-273f2230c3a0
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=chiark.greenend.org.uk; s=i.chiark; h=DKIM-Signature-Warning:References:
	In-Reply-To:Subject:Cc:To:Date:Message-ID:Content-Transfer-Encoding:
	Content-Type:MIME-Version:From:Sender:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
	List-Archive; bh=u/mf5+XHxvC2Vr8pe+4W6SHH4hwWcKDEX1QmTz6fzTM=; b=g4+NZbXVpT2H
	KBI64rp9FZEEASzsDCcVt1r1fb+aEasf8RRJL53oStBjLolnHmdNNLoGGVE5Jh+7+xLIjXNV1jciN
	fMuMQaK+J/9s9l2CxhGdWT3ZPlUbYthuBOAlq6x/amzNotOXIpttJ0gXTwsDtNhvkvq8XmpU3YmNu
	/jdw5FCsfePrkVc9czuusupc+8Mu6wYEzFpBgEIySdz3284UzC7OsThYhA96F/G5pqyFkM65l97Fq
	jzzxPr0A6tyQuHxyt30A7aBxzXHZ2wBv5H1Ky9c5/ymSkFw+w6xu5csp1fPa3DHXasTRv5vhXYElh
	qNyiLvgDOGoUxHSyhysjhA==;
From: Ian Jackson <ijackson@chiark.greenend.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Message-ID: <25376.32116.525864.165666@chiark.greenend.org.uk>
Date: Tue, 13 Sep 2022 13:54:12 +0100
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: xen-devel@lists.xenproject.org,
    Anthony PERARD <anthony.perard@citrix.com>,
    Julien Grall <julien@xen.org>
Subject: Re: [PATCH] libvirt: disable Werror for non-libvirt flights
In-Reply-To: <20220913100328.27771-1-roger.pau@citrix.com>
References: <20220913100328.27771-1-roger.pau@citrix.com>
X-Mailer: VM 8.2.0b under 27.1 (x86_64-pc-linux-gnu)
DKIM-Signature-Warning: NOTE REGARDING DKIM KEY COMPROMISE https://www.chiark.greenend.org.uk/dkim-rotate/README.txt https://www.chiark.greenend.org.uk/dkim-rotate/ab/abe9e63fcd017dfafc3d4f51a03e88e5.pem

Roger Pau Monne writes ("[PATCH] libvirt: disable Werror for non-libvirt flights"):
> Current usage of Werror=switch-enum by default for libvirt builds out
> of the git tree causes issues when new items are added to libxl public
> API enums if those are used in a switch statement in libvirt code.
> This leads to libvirt build failures for seemingly unrelated libxl
> changes.
> 
> In order to prevent those errors from blocking the push gate, disable
> Werror for libvirt builds when not in a libvirt specific flight.
> 
> The errors will be reported on the libvirt flight, and block the
> pushes there.  So the author of the changes in libxl is still expected
> to send a fix to libvirt code.  This is no ideal, but the other option
> is to just disable Werror for all libvirt builds and let libvirt
> developers fix the breakage when they notice it.
..
> +build-i386-libvirt                                    autogen_options                 --disable-werror

We have no way to specify -Wno-error-switch-enum specifically ?
(I'm not sure if that would be desirable.)

> I'm unsure whether we want o disable Werror even for libvirt flights,
> but this seems more conservative.

Probably disabling it only for Xen is right.

Ian.

-- 
Ian Jackson <ijackson@chiark.greenend.org.uk>   These opinions are my own.  

Pronouns: they/he.  If I emailed you from @fyvzl.net or @evade.org.uk,
that is a private address which bypasses my fierce spamfilter.

