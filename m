Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BEDEA83F1B
	for <lists+xen-devel@lfdr.de>; Thu, 10 Apr 2025 11:41:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.945151.1343405 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u2oPO-0006Ya-9I; Thu, 10 Apr 2025 09:41:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 945151.1343405; Thu, 10 Apr 2025 09:41:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u2oPO-0006WI-5y; Thu, 10 Apr 2025 09:41:18 +0000
Received: by outflank-mailman (input) for mailman id 945151;
 Thu, 10 Apr 2025 09:41:17 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=TBLJ=W4=bounce.vates.tech=bounce-md_30504962.67f79235.v1-df2486676a3f44c4932a2cbd74639f5a@srs-se1.protection.inumbo.net>)
 id 1u2oPN-0006Qy-25
 for xen-devel@lists.xenproject.org; Thu, 10 Apr 2025 09:41:17 +0000
Received: from mail180-44.suw31.mandrillapp.com
 (mail180-44.suw31.mandrillapp.com [198.2.180.44])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id eed6933b-15ef-11f0-9ffb-bf95429c2676;
 Thu, 10 Apr 2025 11:41:10 +0200 (CEST)
Received: from pmta11.mandrill.prod.suw01.rsglab.com (localhost [127.0.0.1])
 by mail180-44.suw31.mandrillapp.com (Mailchimp) with ESMTP id
 4ZYFF11Mcfz70669s
 for <xen-devel@lists.xenproject.org>; Thu, 10 Apr 2025 09:41:09 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 df2486676a3f44c4932a2cbd74639f5a; Thu, 10 Apr 2025 09:41:09 +0000
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
X-Inumbo-ID: eed6933b-15ef-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1744278069; x=1744548069;
	bh=Uz04yy/kkZTV5Wpx3eGRD6DH5bZhwzXo5r6ZQhmzs+8=;
	h=From:Subject:To:Cc:Message-Id:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=o+RKKUOpGuHyCBUCc2zvqGC0fNOGEA3TpVTOXYW9jEMcCBWn0HCupeyNCl6G0Jy0V
	 kmHNSVJ+KmSi9ZryhBvjgS5vR+29H8yzysNtvD72QbCUD6whXFcrE6xpfwR11UpwCo
	 YeHsgqQIwMGG3+6J/RrkpjLlEpj6vjGlh6QpsuIYeYdpYZwwigOwDEnzEoGU5h6eOn
	 +pAFzmK+sE6+g34DpJ2/NiLHRxUFCv9Q6a5RYdAFdryhhIYyvSf00o5WHb4yjZWQU0
	 474SAtP7+39iDqe9z6W6uTxFBE5YPw4w7kfuHKT+zAuouKKqc2zqt63xP9TNErktQ+
	 Nic9h5M3myqYg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1744278069; x=1744538569; i=anthony.perard@vates.tech;
	bh=Uz04yy/kkZTV5Wpx3eGRD6DH5bZhwzXo5r6ZQhmzs+8=;
	h=From:Subject:To:Cc:Message-Id:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=mu0Yp1dPZs/4yuybgIQgwPTA4s45QNx0srtC8ASjwqqvbC9kNS0TwhsjfjW5jHzJw
	 tUmbeh9FVJmx1uFIo60Gz3fPKRvWvRns+/H7bqyS8JoUIzfn9pYpo0033k+XAtzYMF
	 nKHuv/s+bz//aZzH+2Zh+uTfOCNTjMOA+6lMAslpuJglCF4zBYjlTrGBlApXD87VvO
	 RgAvNyV8rbXmbPM6Ohg7/rLFV4WMXiUCzqeARfMfLCV+8GpG09AoIOK6ZLLJHVeFB2
	 rEuPIsCQNBJ6eFlY1oe0MAbC/FOfbDI8g0b3c03Y7VWvGfpqzaUAaN6xM5xsyzV/Oj
	 D/Pk+4zi0Qfyw==
From: "Anthony PERARD" <anthony.perard@vates.tech>
Subject: =?utf-8?Q?Re:=20[PATCH=203/8]=20Fix=20container=20user=20setup?=
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1744278067731
To: "Andrew Cooper" <andrew.cooper3@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>, "=?utf-8?Q?Roger=20Pau=20Monn=C3=A9?=" <roger.pau@citrix.com>, "Stefano Stabellini" <sstabellini@kernel.org>, "Michal Orzel" <michal.orzel@amd.com>, "=?utf-8?Q?Marek=20Marczykowski-G=C3=B3recki?=" <marmarek@invisiblethingslab.com>
Message-Id: <Z_eSM8NC5WeWPOy-@l14>
References: <20250409163702.2037301-1-andrew.cooper3@citrix.com> <20250409163702.2037301-4-andrew.cooper3@citrix.com>
In-Reply-To: <20250409163702.2037301-4-andrew.cooper3@citrix.com>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.df2486676a3f44c4932a2cbd74639f5a?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20250410:md
Date: Thu, 10 Apr 2025 09:41:09 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

On Wed, Apr 09, 2025 at 05:36:57PM +0100, Andrew Cooper wrote:
> Use USER (and 'user' as normal), rather than specifying configuration from the
> outside.  This also fixes the fact that root-needing containers need to
> override the default.

This patch also removes one "docker:platform" which is redundant with
the containers image name.

> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Reviewed-by: Anthony PERARD <anthony.perard@vates.tech>

Thanks,

-- 

Anthony Perard | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech



