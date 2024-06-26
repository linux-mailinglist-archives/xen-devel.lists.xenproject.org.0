Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D60B9185C9
	for <lists+xen-devel@lfdr.de>; Wed, 26 Jun 2024 17:29:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.749212.1157248 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sMUa3-0002MK-Di; Wed, 26 Jun 2024 15:29:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 749212.1157248; Wed, 26 Jun 2024 15:29:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sMUa3-0002KB-B4; Wed, 26 Jun 2024 15:29:07 +0000
Received: by outflank-mailman (input) for mailman id 749212;
 Wed, 26 Jun 2024 15:29:06 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=pb7p=N4=bounce.vates.tech=bounce-md_30504962.667c3279.v1-5533be79f55c46a48dcd81b32f46d421@srs-se1.protection.inumbo.net>)
 id 1sMUUk-0006XW-Mi
 for xen-devel@lists.xenproject.org; Wed, 26 Jun 2024 15:23:38 +0000
Received: from mail187-10.suw11.mandrillapp.com
 (mail187-10.suw11.mandrillapp.com [198.2.187.10])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0f47dd49-33d0-11ef-90a3-e314d9c70b13;
 Wed, 26 Jun 2024 17:23:38 +0200 (CEST)
Received: from pmta09.mandrill.prod.suw01.rsglab.com (localhost [127.0.0.1])
 by mail187-10.suw11.mandrillapp.com (Mailchimp) with ESMTP id
 4W8QT51XxMz5QkLpF
 for <xen-devel@lists.xenproject.org>; Wed, 26 Jun 2024 15:23:37 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 5533be79f55c46a48dcd81b32f46d421; Wed, 26 Jun 2024 15:23:37 +0000
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
X-Inumbo-ID: 0f47dd49-33d0-11ef-90a3-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1719415417; x=1719675917;
	bh=HQnzbPh+i1Pp6Lcr9ot6UJATrOws3xOB7YqdoqCYhiU=;
	h=From:Subject:Message-Id:To:Cc:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=JsNaSJACkzhO3rIxMEBeFtwxusl8EpZA44O4u+f/t/Imv9bjqQJVyvd1j+5HIk9sF
	 0vu3f8yMfL9NxhBqrOJxTlsgi41+B/gbCig6liI3mSbVcwjVRbzzStudwKKi6BxbAk
	 DwXqdLmMa57pIA2fplNlYsOy6Qt0QDiC8OEznXA6UmDnEUE5kBD79JwlTXtLjrp8ez
	 mLn/hm5ciSgJlez79ozBJG8vUnx859bonOEXOO2A3UBDI9oo7OgY3jJ/9xRoBpkjs5
	 m+97Oq8q/ftnTwRPk7jlaUW3tsLFuUTvEz6MB+O3SPaHhIo6/4DXGmMgh71aPc3/Ki
	 T+Yn2nKDh015w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1719415417; x=1719675917; i=teddy.astie@vates.tech;
	bh=HQnzbPh+i1Pp6Lcr9ot6UJATrOws3xOB7YqdoqCYhiU=;
	h=From:Subject:Message-Id:To:Cc:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=XkwOTjmbxB7JaXtLh7FxChPPedd+RgAjgI3aCIRrcx9w2Xv8gv82sQD4866Cj5Rcq
	 VRNAYbrrwzj+nXGzxX2P3cVJU/EuK60sGNFUUwzURX9ZHhVRjGvacS5lN3q6NZ6/oF
	 kEKZsZAcGKb1sQnEaZjGqvegl3zF7hqnJ0VNfT/BQ7I2IJj9CzGCWKJkPXPbJol05r
	 zubrW30ONXpm6kGBSf2G17zARDDhYuiHXe547r10yG18td1VsyUhrgeW6v9JaDxC1P
	 23v5+UaZDQ6DGgddaNCO8kRxlPtKvaoKjiD2wdpb8omrc+rAmhXejhN5OlFNAiz5xJ
	 8TR5bQV4WJ+rQ==
From: Teddy Astie <teddy.astie@vates.tech>
Subject: =?utf-8?Q?Re:=20[RFC=20XEN=20PATCH=20v2=200/5]=20IOMMU=20subsystem=20redesign=20and=20PV-IOMMU=20interface?=
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1719415415340
Message-Id: <c3a91cde-f325-4459-8629-f3575543e4d8@vates.tech>
To: xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, =?utf-8?Q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>, Lukasz Hawrylko <lukasz@hawrylko.pl>, "Daniel P. Smith" <dpsmith@apertussolutions.com>, =?utf-8?Q?Mateusz=20M=C3=B3wka?= <mateusz.mowka@intel.com>, =?utf-8?Q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
References: <cover.1719414736.git.teddy.astie@vates.tech>
In-Reply-To: <cover.1719414736.git.teddy.astie@vates.tech>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.5533be79f55c46a48dcd81b32f46d421?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20240626:md
Date: Wed, 26 Jun 2024 15:23:37 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

forgot to add that this patch series is rebased on top of staging

Teddy


Teddy Astie | Vates XCP-ng Intern

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech

