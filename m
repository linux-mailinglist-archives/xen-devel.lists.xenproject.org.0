Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 056B192E894
	for <lists+xen-devel@lfdr.de>; Thu, 11 Jul 2024 14:55:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.757447.1166369 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sRtJz-0006MX-64; Thu, 11 Jul 2024 12:54:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 757447.1166369; Thu, 11 Jul 2024 12:54:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sRtJz-0006L0-33; Thu, 11 Jul 2024 12:54:51 +0000
Received: by outflank-mailman (input) for mailman id 757447;
 Thu, 11 Jul 2024 12:54:49 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=fcyN=OL=bounce.vates.tech=bounce-md_30504962.668fd616.v1-556f190b2d6b43f09a54b9e014007646@srs-se1.protection.inumbo.net>)
 id 1sRtJx-0006Ku-Gf
 for xen-devel@lists.xenproject.org; Thu, 11 Jul 2024 12:54:49 +0000
Received: from mail186-27.suw21.mandrillapp.com
 (mail186-27.suw21.mandrillapp.com [198.2.186.27])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c0c3dad3-3f84-11ef-bbfb-fd08da9f4363;
 Thu, 11 Jul 2024 14:54:48 +0200 (CEST)
Received: from pmta10.mandrill.prod.suw01.rsglab.com (localhost [127.0.0.1])
 by mail186-27.suw21.mandrillapp.com (Mailchimp) with ESMTP id
 4WKZSQ6PbCz6CQ3pX
 for <xen-devel@lists.xenproject.org>; Thu, 11 Jul 2024 12:54:46 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 556f190b2d6b43f09a54b9e014007646; Thu, 11 Jul 2024 12:54:46 +0000
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
X-Inumbo-ID: c0c3dad3-3f84-11ef-bbfb-fd08da9f4363
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1720702486; x=1720962986;
	bh=QT7Nyr/C+R4jjSf5+6fGFGCoMGbBcAFFa43DxFSxuLc=;
	h=From:Subject:To:Cc:Message-Id:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=nebNAdRGZYycjcI5Im9TZqAkzqBsnJxrvw6+2bstR3Lyfie9/FAvQLhYcowsf3VM7
	 J7seCf3XctwB75S7/pVm3M8DjTw/laqSck/RNykF33iiNLXx/Y2a/KtVJqfHxJaJEH
	 Aat4fS+vdltOMSYXCqlycaKjwyCMUUZe4sEbYb0yVMkxbunw13SMadIntXxchut9ST
	 z2oWKuhzFb+BYvzYussuoKDha7E/MEbbJlL9NHH/wX3y5VUdugm9v27Bqe4m44fmSo
	 y8pwQGW4Sz//zIiI92H9/+dJ0KDnxUCc9IszJPWB5h0O9hys5OiNNA/0RoQcDUTOpa
	 0OihJ3lXgO4rA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1720702486; x=1720962986; i=anthony.perard@vates.tech;
	bh=QT7Nyr/C+R4jjSf5+6fGFGCoMGbBcAFFa43DxFSxuLc=;
	h=From:Subject:To:Cc:Message-Id:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=Dyxb6AWvTaDUR/ZtjG++K0uRE2gM5cdwxEXIgDx/0cnEovckjrITl5A0Vv5kMiQq/
	 IIMPuLOcNLS0PBai1s7sxgjvHvkjK9cNm28onCZZK6Q4xBPQICz3GW5txYlefKV5t9
	 I76CdAhxB7boKEh4cnuxIsxaxbJxpGJtSRmkmBh9DMd9e8rmvxZ40NlJmlhVQBjKTL
	 pdFMPDZ8JsPq+ku0O2RK8I1IYRycjxc7d54VDsDlvtkYJg8co8LyYqm4rFUm4O+2iM
	 IlQ2nVJdUwA/zBrDDr5q9n1NYKoy1vL2AP/YhwiIU3gU+oZj95vNu7jM4UABa9Wjw7
	 GgSbNVi8MYqgw==
From: Anthony PERARD <anthony.perard@vates.tech>
Subject: =?utf-8?Q?Re:=20[PATCH=2001/12]=20CI:=20Fix=20CONTAINER=5FUID0=3D1=20scripts/containerize?=
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1720702485185
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>, Juergen Gross <jgross@suse.com>, =?utf-8?Q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>, Jan Beulich <JBeulich@suse.com>, Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Oleksii Kurochko <oleksii.kurochko@gmail.com>, Shawn Anastasio <sanastasio@raptorengineering.com>
Message-Id: <Zo/WFAS3LFKG3LJf@l14>
References: <20240711111517.3064810-1-andrew.cooper3@citrix.com> <20240711111517.3064810-2-andrew.cooper3@citrix.com>
In-Reply-To: <20240711111517.3064810-2-andrew.cooper3@citrix.com>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.556f190b2d6b43f09a54b9e014007646?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20240711:md
Date: Thu, 11 Jul 2024 12:54:46 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

On Thu, Jul 11, 2024 at 12:15:06PM +0100, Andrew Cooper wrote:
> Right now, most build containers use root.  Archlinux, Fedora and Yocto set up
> a regular user called `user`.
> 
> For those containers, trying to containerize as root fails, because
> CONTAINER_UID0=1 does nothing, whereas CONTAINER_UID0=0 forces the user away
> from root.
> 
> To make CONTAINER_UID0=1 work reliably, force to root if requested.
> 
> Fixes: 17fbe6504dfd ("automation: introduce a new variable to control container user")
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Reviewed-by: Anthony PERARD <anthony.perard@vates.tech>

Thanks,

-- 

Anthony Perard | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech

