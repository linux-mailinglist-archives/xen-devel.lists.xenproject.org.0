Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9643EA7DDB4
	for <lists+xen-devel@lfdr.de>; Mon,  7 Apr 2025 14:33:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.939822.1339789 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u1leK-0005ie-HQ; Mon, 07 Apr 2025 12:32:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 939822.1339789; Mon, 07 Apr 2025 12:32:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u1leK-0005fW-EB; Mon, 07 Apr 2025 12:32:24 +0000
Received: by outflank-mailman (input) for mailman id 939822;
 Mon, 07 Apr 2025 12:32:22 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Q09o=WZ=bounce.vates.tech=bounce-md_30504962.67f3c5d2.v1-b2322e5eb47c47b59d64832e3500a175@srs-se1.protection.inumbo.net>)
 id 1u1leI-0005fQ-RL
 for xen-devel@lists.xenproject.org; Mon, 07 Apr 2025 12:32:22 +0000
Received: from mail180-44.suw31.mandrillapp.com
 (mail180-44.suw31.mandrillapp.com [198.2.180.44])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 58f14cd8-13ac-11f0-9eaa-5ba50f476ded;
 Mon, 07 Apr 2025 14:32:20 +0200 (CEST)
Received: from pmta11.mandrill.prod.suw01.rsglab.com (localhost [127.0.0.1])
 by mail180-44.suw31.mandrillapp.com (Mailchimp) with ESMTP id
 4ZWT9t6t3Tz705bCL
 for <xen-devel@lists.xenproject.org>; Mon,  7 Apr 2025 12:32:18 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 b2322e5eb47c47b59d64832e3500a175; Mon, 07 Apr 2025 12:32:18 +0000
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
X-Inumbo-ID: 58f14cd8-13ac-11f0-9eaa-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1744029139; x=1744299139;
	bh=O+9ndxKaq8ZvMLtReJ/Moc8XlsyvhrJhqOJbn+VuPGI=;
	h=From:Subject:To:Cc:Message-Id:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=utsYKeYkJRbTQMKXRrW3ub6CTpWzXho0MRzik7as09ALbyr1HlFqEJmPbvjpc/za+
	 Wtf7zQY814xyk4Thh6OXfZaqunZeWJWxQHZc0SiWF9HX4pu0pfv8ises+baIRzJ0JW
	 aBaPjcfSvCvnp3jD5Qd2ZKFPqmyEJRrv8sC9qSiHYzRXWsA1+lSNFjCFSyf82/kvXd
	 UO8s1n865chnypqjqfnl+IaGX8VJepcHZHub6sYoJOpa1WYNw19OwYyPwnQuZD4yps
	 +qCD6zErIbEFkAP9J8+pI9L1XUPlWeZllIe66yHC8R59WixepxH66ozRy+dZhw0e9d
	 1Xw5GUr7Y5n2Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1744029139; x=1744289639; i=anthony.perard@vates.tech;
	bh=O+9ndxKaq8ZvMLtReJ/Moc8XlsyvhrJhqOJbn+VuPGI=;
	h=From:Subject:To:Cc:Message-Id:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=FU6DMGYtAcr5C9CgUgsOHyE6JpjhHFT2eGIYaXvj1M191QtGheZxjhC2RiGsaIAYG
	 S++kah9AJZ4NhNbUfP3HXTcaKaXerUfzM68evN5yVncuAtPW70NiK/A4a7+bZR/soN
	 i7mkSNEUD2g70wWK8BVvZ9YjbBu3mtHTgvzm5RBmmIr903edRgk2LFQj1rPon4Z1Vg
	 k/MahTsOHzAy6RsHG2AYcFS5kuf3OY3fOA9HTY0+hLuZpP5GbGpBCsd26pArCYUphX
	 /2P6XEzoDQxtXDcx6wadezHBSD7NCeGtY68a6blx70TuDvmwoTA074XJ0v/kq1jJc/
	 q6qB0KdU3N3CQ==
From: "Anthony PERARD" <anthony.perard@vates.tech>
Subject: =?utf-8?Q?Re:=20[PATCH]=20libxl{,u}:=20replace=20TOSTRING()?=
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1744029137811
To: "Jan Beulich" <jbeulich@suse.com>
Cc: xen-devel@lists.xenproject.org, "Juergen Gross" <jgross@suse.com>
Message-Id: <Z_PF0LZpcqMwmmVn@l14>
References: <8b16c210-4a2f-4d06-8fab-624394f06e5f@suse.com>
In-Reply-To: <8b16c210-4a2f-4d06-8fab-624394f06e5f@suse.com>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.b2322e5eb47c47b59d64832e3500a175?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20250407:md
Date: Mon, 07 Apr 2025 12:32:18 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

On Mon, Apr 07, 2025 at 01:29:29PM +0200, Jan Beulich wrote:
> Now that common-macros.h has STR() available, which is even slightly
> more flexible, use that and drop the custom macros.
> 
> No difference in generated code (except for line numbers, of course,
> where embedded in code/data).
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Reviewed-by: Anthony PERARD <anthony.perard@vates.tech>

Thanks,

-- 

Anthony Perard | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech



