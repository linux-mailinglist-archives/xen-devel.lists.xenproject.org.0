Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4ED119F32AD
	for <lists+xen-devel@lfdr.de>; Mon, 16 Dec 2024 15:15:11 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.858128.1270390 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tNBs9-00012g-EM; Mon, 16 Dec 2024 14:14:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 858128.1270390; Mon, 16 Dec 2024 14:14:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tNBs9-000114-BP; Mon, 16 Dec 2024 14:14:57 +0000
Received: by outflank-mailman (input) for mailman id 858128;
 Mon, 16 Dec 2024 14:14:55 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hw0S=TJ=bounce.vates.tech=bounce-md_30504962.676035dc.v1-88620f5623e9448d8e01c29ceb9969e8@srs-se1.protection.inumbo.net>)
 id 1tNBs7-00010w-Dl
 for xen-devel@lists.xenproject.org; Mon, 16 Dec 2024 14:14:55 +0000
Received: from mail179-16.suw41.mandrillapp.com
 (mail179-16.suw41.mandrillapp.com [198.2.179.16])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1eb46353-bbb8-11ef-a0d6-8be0dac302b0;
 Mon, 16 Dec 2024 15:14:54 +0100 (CET)
Received: from pmta12.mandrill.prod.suw01.rsglab.com (localhost [127.0.0.1])
 by mail179-16.suw41.mandrillapp.com (Mailchimp) with ESMTP id
 4YBhlw6JRWzB5pB8n
 for <xen-devel@lists.xenproject.org>; Mon, 16 Dec 2024 14:14:52 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 88620f5623e9448d8e01c29ceb9969e8; Mon, 16 Dec 2024 14:14:52 +0000
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
X-Inumbo-ID: 1eb46353-bbb8-11ef-a0d6-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1734358492; x=1734618992;
	bh=Eg1AR4hb4BDWRnauHnhGJuys1Ck7P04mXrpjVWQykhY=;
	h=From:Subject:To:Cc:Message-Id:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=iadVfP41f/vAqcXRngcyNYLe40KTjjF9dDI8HMUVlmKNAPZjW8bJypIC9gGmbU1t8
	 7A5l2r6Ugfur90suiJY3jo/TGyPEt7N1hfTsxIbUTzVC2qld7KIK9taCp1nzmB7kKF
	 vCS1RdJXplBy425lt4VOXX108wd12LlDuoXubFetG9zFrp/UOMeHq5GnrOxEdRPK0N
	 BZ0PNY7iOJhnEZzDiLoSsjxGg+/y/OlXnpGwT4/s1n0WPSMRINGdyJWuB9mZHdrDlC
	 Anj1fbEMgpMTgh57Bk2mxfiSKUKsnU+S+XwYTBceHHrdtNF2qzFR8EnUs6Ka8J2jEI
	 9ID6ZwrWUGutA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1734358492; x=1734618992; i=anthony.perard@vates.tech;
	bh=Eg1AR4hb4BDWRnauHnhGJuys1Ck7P04mXrpjVWQykhY=;
	h=From:Subject:To:Cc:Message-Id:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=Hi4hSVxAc8deq8t4rVQjm/CR5HkNDYeVKviujrm5qrYWQ2lh4UkAjbTDj84PVpIvb
	 ph2VsgOPgnB24MNCuqSEKDa6zRx8YF3vbbJem2ojZq8GU3zH62DO3oaTkGGxS8/XIY
	 Kncvfgx2EFRgrfa3zT39gAdVrxf2JwZV6ihmh0E9juHW+fJdHqgGDwigOGEk3QKUiA
	 jrMQGGjacAMOfNCs4/UpnXmJH24WJT0/WGk7xDD7wG/oj2n6xQKE4ubCahFtKsSvIb
	 +/bZxfq8crlZnryLxmJj3wuh27TE/gr9pDmJ6pvC/ilY3ALiEB1yoYj2EwKK6vzvrf
	 yzP8WBdQSDLCg==
From: "Anthony PERARD" <anthony.perard@vates.tech>
Subject: =?utf-8?Q?Re:=20[PATCH=20v3=202/7]=20tools:=20add=20a=20dedicated=20header=20file=20for=20barrier=20definitions?=
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1734358492393
To: "Juergen Gross" <jgross@suse.com>
Cc: xen-devel@lists.xenproject.org
Message-Id: <Z2A13FQpYpvlZPaH@l14>
References: <20241213162421.16782-1-jgross@suse.com> <20241213162421.16782-3-jgross@suse.com>
In-Reply-To: <20241213162421.16782-3-jgross@suse.com>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.88620f5623e9448d8e01c29ceb9969e8?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20241216:md
Date: Mon, 16 Dec 2024 14:14:52 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

On Fri, Dec 13, 2024 at 05:24:16PM +0100, Juergen Gross wrote:
> diff --git a/tools/include/xen-barrier.h b/tools/include/xen-barrier.h
> new file mode 100644
> index 0000000000..a716fb93cc
> --- /dev/null
> +++ b/tools/include/xen-barrier.h
> @@ -0,0 +1,39 @@
> +/* SPDX-License-Identifier: LGPL-2.1 */

That's a deprecated SPDX identifier, it should be written
"LGPL-2.1-only" instead.

With that fixed: Reviewed-by: Anthony PERARD <anthony.perard@vates.tech>

Thanks,

-- 

Anthony Perard | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech

