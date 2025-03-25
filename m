Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 60E78A7056B
	for <lists+xen-devel@lfdr.de>; Tue, 25 Mar 2025 16:46:48 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.926631.1329469 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tx6Tw-0008Dk-Bw; Tue, 25 Mar 2025 15:46:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 926631.1329469; Tue, 25 Mar 2025 15:46:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tx6Tw-0008Al-97; Tue, 25 Mar 2025 15:46:24 +0000
Received: by outflank-mailman (input) for mailman id 926631;
 Tue, 25 Mar 2025 15:46:22 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=n8Tn=WM=bounce.vates.tech=bounce-md_30504962.67e2cfca.v1-8f9f5b69702444d39048229a2f5de7b5@srs-se1.protection.inumbo.net>)
 id 1tx6Tt-0008Ad-Ul
 for xen-devel@lists.xenproject.org; Tue, 25 Mar 2025 15:46:22 +0000
Received: from mail132-31.atl131.mandrillapp.com
 (mail132-31.atl131.mandrillapp.com [198.2.132.31])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4b789fef-0990-11f0-9ea3-5ba50f476ded;
 Tue, 25 Mar 2025 16:46:20 +0100 (CET)
Received: from pmta09.mandrill.prod.atl01.rsglab.com (localhost [127.0.0.1])
 by mail132-31.atl131.mandrillapp.com (Mailchimp) with ESMTP id
 4ZMZ5k5Fwyz9K7SNp
 for <xen-devel@lists.xenproject.org>; Tue, 25 Mar 2025 15:46:18 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 8f9f5b69702444d39048229a2f5de7b5; Tue, 25 Mar 2025 15:46:18 +0000
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
X-Inumbo-ID: 4b789fef-0990-11f0-9ea3-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1742917578; x=1743187578;
	bh=tfrJNZ0Du/qXL8jqA1pOPciSsmU33umD88m5fCFmlt8=;
	h=From:Subject:To:Cc:Message-Id:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=zSVs60ZsQv+9VEy37VC9bMMSSiwRPVQ5sCvzfZF+gDYLfdhkbvQWb5+yhz/CDZ2tQ
	 wAduc+wI+ji/KFYq5p2U9t4Hv+W2oHwYg5WiuvtKggRMIgrDQvMp5DCzqiOuShNjr7
	 hfYBi4pMYBpahCVJ2bL+hxsrsvz2X6dKv1fAJ4gFP7/BGtmkuMWu0qvhSSPM6TSVxa
	 fLsDXr6eLY5zsyNbLCYwDVZdEwi6T5ccoxug1L4RWvDibxd9xo1nuWHE3D3bfr8OvY
	 FgwLpxQuWvsIRYb3D0oD311ee0YV5KoV5ooXQJZGNh6AP9xedJhedvUxqbjcMJiPLo
	 b6tPigmVBkmyw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1742917578; x=1743178078; i=anthony.perard@vates.tech;
	bh=tfrJNZ0Du/qXL8jqA1pOPciSsmU33umD88m5fCFmlt8=;
	h=From:Subject:To:Cc:Message-Id:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=vBZfavZlE57PIInbgLYPqu8W07JNN1TwmWOfhxEK9Tsx9epES2x6806mKvaqMgZn2
	 95VpFzfSNYLaxk5kiOxGyNHXQAKe3QkGMpqgrowqpft+2LTdXSOZpFwDVs7chKtQYp
	 NYgHibChJ+0L6GkH0RJW1BvpU2+ruuqkzpdKSq9RZOdanhnX4kFSEnx1hYAUxaSHji
	 hwOoYGFJsuX3axGjcICMZtiiI1Fp7Sfh57A72CZuep5uiy/Ol8KXaUW+wrAY9mWR/+
	 ApNwfvA/bR2w8zXSMIc9GlK+l22btxI8SNxRBN50mvDNHxv4YRSdR3JnKjYhaNmxoh
	 gESPrWHKTah3g==
From: "Anthony PERARD" <anthony.perard@vates.tech>
Subject: =?utf-8?Q?Re:=20[PATCH=201/3]=20CI:=20Update=20build=20tests=20based=20on=20new=20minimum=20toolchain=20requirements?=
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1742917576969
To: "Andrew Cooper" <andrew.cooper3@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>, "Michal Orzel" <michal.orzel@amd.com>, "Jan Beulich" <jbeulich@suse.com>, "Julien Grall" <julien@xen.org>, "=?utf-8?Q?Roger=20Pau=20Monn=C3=A9?=" <roger.pau@citrix.com>, "Stefano Stabellini" <sstabellini@kernel.org>, "Oleksii Kurochko" <oleksii.kurochko@gmail.com>
Message-Id: <Z-LPyLXlcrk1wD6P@l14>
References: <20250320155908.43885-1-andrew.cooper3@citrix.com> <20250320155908.43885-2-andrew.cooper3@citrix.com> <ef8fbae6-e231-4348-843b-bf84eaf0ef52@citrix.com>
In-Reply-To: <ef8fbae6-e231-4348-843b-bf84eaf0ef52@citrix.com>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.8f9f5b69702444d39048229a2f5de7b5?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20250325:md
Date: Tue, 25 Mar 2025 15:46:18 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

On Thu, Mar 20, 2025 at 04:01:36PM +0000, Andrew Cooper wrote:
> On 20/03/2025 3:59 pm, Andrew Cooper wrote:
> > Drop CentOS 7 entirely.  It's way to old now.
> >
> > Ubuntu 22.04 is the oldest Ubuntu with a suitable version of Clang, so swap
> > the 16.04 clang builds for 22.04.
> >
> > Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Reviewed-by: Anthony PERARD <anthony.perard@vates.tech>

Thanks,

-- 

Anthony Perard | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech

