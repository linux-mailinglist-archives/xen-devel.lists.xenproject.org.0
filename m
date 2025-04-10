Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3546AA8448A
	for <lists+xen-devel@lfdr.de>; Thu, 10 Apr 2025 15:20:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.945752.1343883 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u2rpK-0000rm-HA; Thu, 10 Apr 2025 13:20:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 945752.1343883; Thu, 10 Apr 2025 13:20:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u2rpK-0000pv-DW; Thu, 10 Apr 2025 13:20:18 +0000
Received: by outflank-mailman (input) for mailman id 945752;
 Thu, 10 Apr 2025 13:20:17 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Mta4=W4=bounce.vates.tech=bounce-md_30504962.67f7c58e.v1-2642bac2fe4741f88186670e2b40f9d8@srs-se1.protection.inumbo.net>)
 id 1u2rpJ-0000pp-Ie
 for xen-devel@lists.xenproject.org; Thu, 10 Apr 2025 13:20:17 +0000
Received: from mail177-19.suw61.mandrillapp.com
 (mail177-19.suw61.mandrillapp.com [198.2.177.19])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8a06e6a0-160e-11f0-9ffb-bf95429c2676;
 Thu, 10 Apr 2025 15:20:15 +0200 (CEST)
Received: from pmta14.mandrill.prod.suw01.rsglab.com (localhost [127.0.0.1])
 by mail177-19.suw61.mandrillapp.com (Mailchimp) with ESMTP id 4ZYL5p5K20zDDS
 for <xen-devel@lists.xenproject.org>; Thu, 10 Apr 2025 13:20:14 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 2642bac2fe4741f88186670e2b40f9d8; Thu, 10 Apr 2025 13:20:14 +0000
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
X-Inumbo-ID: 8a06e6a0-160e-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1744291214; x=1744561214;
	bh=6T6m/c+3EJmR1fhTc7g2Pe21cejLM+G7EDHGrId4gx4=;
	h=From:Subject:To:Cc:Message-Id:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=a4m/S8vwv1S+G+q30t+WNl1QxXPvkzwIcK+ZnlWTPESJhH11ZLeFbeklQKTHphOpF
	 aliqYcXPU7HTmzUUU9hp8ONsGCJK8xfS4zIM07A4dMhwztqGdZGn2B+YkOBf2ZL1aG
	 7MP93AbTo03eE7Rsm8qraT36e6l4kw65ZMxkSngwv5qZBmRvq896pPLfKDqRC3bZWK
	 bM8c1nhhWFvDi0SEF3v67fSxASjvIvfM6kPiEIQVP8RTIRWsYgEu3IrK91emqbpfT2
	 ve4FEPbAZn7oBPrQuQ0dJdkKE0yujYs6mekFGQz+f8pxeW1btRxEYX45vjIepwPs7E
	 4fU8xNJi+prCA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1744291214; x=1744551714; i=anthony.perard@vates.tech;
	bh=6T6m/c+3EJmR1fhTc7g2Pe21cejLM+G7EDHGrId4gx4=;
	h=From:Subject:To:Cc:Message-Id:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=ma0Ic/MtnWglBDc77RKUTpy+u7BjnzksO84qY34lLxepCz0Jz/56NcAB0+XTCVWs4
	 hAgUTuvwTuHgveADI+CvEmKpxJhDvEztoE05nJDlZhXbyl97R/t3oPbHWp0C391Li2
	 PxT/7TuFa+x0pcEJzznp4a28k37h1jOVzAp37G8TO9dz0WA/eb1SAarLcHkfIm34yS
	 m7/mEONmK01iwg8modstUSw8KwI6/hcwm1ScDrLd+G+xEOd4c97ETVTNqhlc/Dv8D2
	 oub1ACakVMh+2f6OGibXb0HO/l+/42CIb1p7B4cxjb5xGS8zsBvIWYj6IEr6K7Bhb9
	 d6YGTh+AZ7kKw==
From: "Anthony PERARD" <anthony.perard@vates.tech>
Subject: =?utf-8?Q?Re:=20[PATCH=202/6]=20Clean=20up=20Gitlab=20yaml?=
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1744291213192
To: "Andrew Cooper" <andrew.cooper3@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>, "=?utf-8?Q?Roger=20Pau=20Monn=C3=A9?=" <roger.pau@citrix.com>, "Stefano Stabellini" <sstabellini@kernel.org>, "Michal Orzel" <michal.orzel@amd.com>, "=?utf-8?Q?Marek=20Marczykowski-G=C3=B3recki?=" <marmarek@invisiblethingslab.com>
Message-Id: <Z_fFjGRdQDNYQtfn@l14>
References: <20250410114628.2060072-1-andrew.cooper3@citrix.com> <20250410114628.2060072-3-andrew.cooper3@citrix.com>
In-Reply-To: <20250410114628.2060072-3-andrew.cooper3@citrix.com>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.2642bac2fe4741f88186670e2b40f9d8?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20250410:md
Date: Thu, 10 Apr 2025 13:20:14 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

On Thu, Apr 10, 2025 at 12:46:24PM +0100, Andrew Cooper wrote:
> Factor out the registry into a common location.  Drop the worflow name, as all
> it does is hide the commit message of the change that triggered the pipeline.
> List all the stages.  Set a default expiry of 1 month.
> 
> Note all the current jobs as legacy.  Their naming scheme needs changing, and
> we'll use this opportunity to switch formats too.  However, the artefacts need
> to stay using the old name until the final staging-* branch using them is
> phased out.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Reviewed-by: Anthony PERARD <anthony.perard@vates.tech>

Thanks,

-- 

Anthony Perard | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech



