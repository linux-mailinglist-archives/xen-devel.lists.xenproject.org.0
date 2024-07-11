Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EE6692E9B3
	for <lists+xen-devel@lfdr.de>; Thu, 11 Jul 2024 15:37:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.757507.1166492 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sRtzQ-0002YY-Tf; Thu, 11 Jul 2024 13:37:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 757507.1166492; Thu, 11 Jul 2024 13:37:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sRtzQ-0002Vv-QN; Thu, 11 Jul 2024 13:37:40 +0000
Received: by outflank-mailman (input) for mailman id 757507;
 Thu, 11 Jul 2024 13:37:39 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=DPLo=OL=bounce.vates.tech=bounce-md_30504962.668fe01f.v1-f4d098914e3d484fad62a1fd6cac5bb0@srs-se1.protection.inumbo.net>)
 id 1sRtzP-0002Vp-BZ
 for xen-devel@lists.xenproject.org; Thu, 11 Jul 2024 13:37:39 +0000
Received: from mail136-18.atl41.mandrillapp.com
 (mail136-18.atl41.mandrillapp.com [198.2.136.18])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id bc0c3a40-3f8a-11ef-8776-851b0ebba9a2;
 Thu, 11 Jul 2024 15:37:37 +0200 (CEST)
Received: from pmta11.mandrill.prod.atl01.rsglab.com (localhost [127.0.0.1])
 by mail136-18.atl41.mandrillapp.com (Mailchimp) with ESMTP id
 4WKbPq6yNhzB5pYR9
 for <xen-devel@lists.xenproject.org>; Thu, 11 Jul 2024 13:37:35 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 f4d098914e3d484fad62a1fd6cac5bb0; Thu, 11 Jul 2024 13:37:35 +0000
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
X-Inumbo-ID: bc0c3a40-3f8a-11ef-8776-851b0ebba9a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1720705056; x=1720965556;
	bh=XirGZE9FtdP9Yh4xSPfegTinkKBWXwoDSkBbKd+waT0=;
	h=From:Subject:To:Cc:Message-Id:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=ZEOPlcPnLfQLQZ2Xea2XQG/rIbxHKWN1481/9RXlaMesNC4KUkP444oXNsaMUFRy1
	 jFcN+Uc85fDxP+Z4WSbpOXbShGnRE7AiI+BQ0OfQWVmehZ529Vx1FvBkL+Y2fQ05+u
	 D6SRG0ZiHq2oNREQR0tsOno2esKmic/BZv11xvTQBFyJdWsrVOqnvvLk3QivGmbIwR
	 mOPEvpTxfnXEQi6tQ+W6fHsaUXy/Gsw9Ce6u+ZP7ZfXN6SYn1xPp15vbWVVnR7SxPv
	 zKCUeKAd9ku5TK6TYp5z/pt3tkL8fcPoPjc8SxNLZVdq0l+RcLODv16HGBhsVkNxHU
	 14tQ0EGOlmy4Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1720705056; x=1720965556; i=anthony.perard@vates.tech;
	bh=XirGZE9FtdP9Yh4xSPfegTinkKBWXwoDSkBbKd+waT0=;
	h=From:Subject:To:Cc:Message-Id:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=ooP4xAIzQhbTFZIFYgl9A/kLVjfanhRkAfugub8F7ysNP4PfGKHgz2FGjSlKkM39G
	 LQK8IiVrpt7HlTKCN1PnKbbD5b5RNgxZShI/mTRCcFnp7HRLVc8OLqheVozDWGv2nL
	 fccTYtH8ZSWwr9j3vDwhN1QxKOyhcfomWf9MbzeZKrOts9o82LC9t+YKL80zub063V
	 se18PJuPlgYLOC5/R5l6lpiIrgswH3jvj6UGgaBdZrrOn9JR6tbhnkZcHm7eSPmcYO
	 wR9xQoyQm7GUZp04MVgwPYEgB47f+zjI+DDk31EKIR0vNapg7LBqqEZQafkRPiDm4+
	 E/geiAiG1pi/Q==
From: Anthony PERARD <anthony.perard@vates.tech>
Subject: =?utf-8?Q?Re:=20[PATCH=2006/12]=20CI:=20Mark=20Archlinux/x86=20as=20allowing=20failures?=
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1720705054810
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>, Juergen Gross <jgross@suse.com>, =?utf-8?Q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>, Jan Beulich <JBeulich@suse.com>, Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Oleksii Kurochko <oleksii.kurochko@gmail.com>, Shawn Anastasio <sanastasio@raptorengineering.com>
Message-Id: <Zo/gHsMSXR6hEtsS@l14>
References: <20240711111517.3064810-1-andrew.cooper3@citrix.com> <20240711111517.3064810-7-andrew.cooper3@citrix.com>
In-Reply-To: <20240711111517.3064810-7-andrew.cooper3@citrix.com>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.f4d098914e3d484fad62a1fd6cac5bb0?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20240711:md
Date: Thu, 11 Jul 2024 13:37:35 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

On Thu, Jul 11, 2024 at 12:15:11PM +0100, Andrew Cooper wrote:
> Archlinux is a rolling distro, and is subject to arbitrary changes as the
> container is rebuilt.

I disagree about the changes been arbitrary, it is just new version of
software. :-)

But I guess "arbirary changes" could be a description for package been
removed from the main/official archive, and left for the users to build
themselfs.

> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Anyway:
Reviewed-by: Anthony PERARD <anthony.perard@vates.tech>

(Next, automatically rebuild the container every month, I could probably
revive my old patch series doing that)

Cheers,

-- 

Anthony Perard | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech

