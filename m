Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 65314A13A92
	for <lists+xen-devel@lfdr.de>; Thu, 16 Jan 2025 14:12:34 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.873575.1284580 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tYPfT-0000hg-Sm; Thu, 16 Jan 2025 13:12:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 873575.1284580; Thu, 16 Jan 2025 13:12:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tYPfT-0000f6-QB; Thu, 16 Jan 2025 13:12:15 +0000
Received: by outflank-mailman (input) for mailman id 873575;
 Thu, 16 Jan 2025 13:12:14 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=PdhZ=UI=bounce.vates.tech=bounce-md_30504962.678905aa.v1-9424578a66f24915a65dc65823ee464c@srs-se1.protection.inumbo.net>)
 id 1tYPfS-0000f0-I7
 for xen-devel@lists.xenproject.org; Thu, 16 Jan 2025 13:12:14 +0000
Received: from mail133-1.atl131.mandrillapp.com
 (mail133-1.atl131.mandrillapp.com [198.2.133.1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7f3ada28-d40b-11ef-99a4-01e77a169b0f;
 Thu, 16 Jan 2025 14:12:12 +0100 (CET)
Received: from pmta13.mandrill.prod.atl01.rsglab.com (localhost [127.0.0.1])
 by mail133-1.atl131.mandrillapp.com (Mailchimp) with ESMTP id
 4YYjvG6kB4zBsW9BX
 for <xen-devel@lists.xenproject.org>; Thu, 16 Jan 2025 13:12:10 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 9424578a66f24915a65dc65823ee464c; Thu, 16 Jan 2025 13:12:10 +0000
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
X-Inumbo-ID: 7f3ada28-d40b-11ef-99a4-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1737033130; x=1737303130;
	bh=bHVbnQrA+apYF5cGgvaLXBOWXQDf8GIbShzQDUS0SKQ=;
	h=From:Subject:To:Cc:Message-Id:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=NMB4tdtIthEPJcQiBCYnix9QPQji4PS2FlgcwKSfS30Ri1hbcxyJMJ8psl58FrcRg
	 iLMAQERpl32HaR+ijT2Fpl1OyCDSvWOmS15vITzFvD/0MEiLqwmU0QABeW2RgAi6Ns
	 hN+NokAO1KHLjw2HttRylLiCb1KNo5Vc2qs9tVU1zTxpL9m98f1ar4+T5FBWyNn/J2
	 vK+AhFOq9jL4MgHEzL4ULmyBJ7rPP1YRzz2QNEc0MNh6EZQrjEKjhE/aTaVeFXH+PN
	 +J0mY/uJbCf0jjv5oOaL7/XKODGgplSu7IAk5GifNkZy9sFGSkL0DxhBfePE9kmBnR
	 VEXR3L0ahNLDQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1737033130; x=1737293630; i=anthony.perard@vates.tech;
	bh=bHVbnQrA+apYF5cGgvaLXBOWXQDf8GIbShzQDUS0SKQ=;
	h=From:Subject:To:Cc:Message-Id:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=cJRNuOgwwdra8Ra6yiWLrKcRq0k6BpqVuYzK4IqDCRquN1fgncDBKgJNJRfe9xmNh
	 xn8uIOVwhAnWec+5asu2L1+xo1v7G/odaZ6vyNs0myWf9B0Z7lz2+RuZQ1yLCRp65O
	 63uD86DAQobGfvhXgB7kF0vG14devdtHIMZJ3y1CWEDQazFAfTSyq4bp0eoJWvohyP
	 y9KKlMXtHYUhC+Kj1a9cBhHglA272JxPFgj3fUrT3pN/HvndcxyErBG+133FuXMS2l
	 LyVsXWs/RrleAkHL2XH4mCHP7xcgJZnXxSOZMPkYNjYng8adYNggu+yfWE5NDPhukL
	 yWtu/qlvr/dkw==
From: "Anthony PERARD" <anthony.perard@vates.tech>
Subject: =?utf-8?Q?Re:=20[PATCH]=20xl:=20properly=20dispose=20of=20vTPM=20struct=20instance?=
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1737033129829
To: "Jan Beulich" <jbeulich@suse.com>
Cc: xen-devel@lists.xenproject.org, "Oleksii Kurochko" <oleksii.kurochko@gmail.com>
Message-Id: <Z4kFqZCcwjNggdUi@l14>
References: <73a01ddf-6090-4fda-a8c0-5703e7c9e81b@suse.com>
In-Reply-To: <73a01ddf-6090-4fda-a8c0-5703e7c9e81b@suse.com>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.9424578a66f24915a65dc65823ee464c?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20250116:md
Date: Thu, 16 Jan 2025 13:12:10 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

On Tue, Jan 14, 2025 at 09:13:16AM +0100, Jan Beulich wrote:
> The backend_domname field requires separate freeing; make sure to call
> libxl_device_vtpm_dispose() also on respective error paths.
> 
> Coverity-ID: 1638719
> Fixes: dde22055ac3a ("libxl: add vtpm support")
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Acked-by: Anthony PERARD <anthony.perard@vates.tech>

Thanks,

-- 

Anthony Perard | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech

