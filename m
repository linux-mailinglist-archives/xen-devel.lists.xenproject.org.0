Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 857AEA83ED5
	for <lists+xen-devel@lfdr.de>; Thu, 10 Apr 2025 11:34:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.945103.1343365 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u2oIO-0002S3-Q2; Thu, 10 Apr 2025 09:34:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 945103.1343365; Thu, 10 Apr 2025 09:34:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u2oIO-0002Pz-NF; Thu, 10 Apr 2025 09:34:04 +0000
Received: by outflank-mailman (input) for mailman id 945103;
 Thu, 10 Apr 2025 09:34:03 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=My9i=W4=bounce.vates.tech=bounce-md_30504962.67f79082.v1-8ad5a537d5b3451185ff944bd7ecda08@srs-se1.protection.inumbo.net>)
 id 1u2oIN-0002Pt-H7
 for xen-devel@lists.xenproject.org; Thu, 10 Apr 2025 09:34:03 +0000
Received: from mail180-44.suw31.mandrillapp.com
 (mail180-44.suw31.mandrillapp.com [198.2.180.44])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ebc3e143-15ee-11f0-9ffb-bf95429c2676;
 Thu, 10 Apr 2025 11:33:55 +0200 (CEST)
Received: from pmta11.mandrill.prod.suw01.rsglab.com (localhost [127.0.0.1])
 by mail180-44.suw31.mandrillapp.com (Mailchimp) with ESMTP id
 4ZYF4f31Xwz706XCZ
 for <xen-devel@lists.xenproject.org>; Thu, 10 Apr 2025 09:33:54 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 8ad5a537d5b3451185ff944bd7ecda08; Thu, 10 Apr 2025 09:33:54 +0000
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
X-Inumbo-ID: ebc3e143-15ee-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1744277634; x=1744547634;
	bh=0bO/zanw2FDenv2CZwniKj8laRPD05Ao2xxbyMAaBTg=;
	h=From:Subject:To:Cc:Message-Id:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=If7JfVC8Eun2x5Tu+mY7G8CdZxjbaK6fWIojjCrpjlOhjBdJrHCS2U0i+JZWuJ8GH
	 JGS28k3uyE3fn6eDShpGh4iz+Dhy+usEZsKiEPz7aSZ/ANf8u0B3BdIP+In6Gpp2Mo
	 9myzICFr5PCcIsWHUuq7oSixoPejGkbvKIBuh0S7rxHtNRj3aSDcgiDspCwHNFnt7G
	 WwDBOmCZlw4zsu2XOIDf/HhisKsU+98SaydfgeSXBIHV9SPDos0eFo5CFgLk9u0bJd
	 FFGbC9bIiD66sssTjddpY8Y0jdaZm4aYfhz6SZxOtS3IIUGMNukzrlwSOl1Dzs5diW
	 FhMpifoPGs0og==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1744277634; x=1744538134; i=anthony.perard@vates.tech;
	bh=0bO/zanw2FDenv2CZwniKj8laRPD05Ao2xxbyMAaBTg=;
	h=From:Subject:To:Cc:Message-Id:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=FyY3ut4uxzTGDKl1r210861QpItbHKXyamkIwgzlXwjVTdVUYDcWzcih9HFUYcUaW
	 ZMgEGcMdmsNS2O7BXzzMhsJQr5cQrtGuYMNJ8U01kzHgL1YaN1bnNc442bpaucUBD8
	 LVJpyzOKoxfZ+UKWCeYssccd0S6/kluNIapdFjHujiFPulj2NwL4c+K4CJaAF/6/f7
	 1ADsM+OrH92JvK4YsvJlEi6KETpPbC0hYv67Ly3hTASXMDubwTiYFLWm2c08QzDj12
	 ASN2jnhEgAcsujXc2IChqBTExrKPQwO8PBJh6eHWj8atkpnfplZSkaonozvwsS7G5C
	 qOIxw/xR4DyIw==
From: "Anthony PERARD" <anthony.perard@vates.tech>
Subject: =?utf-8?Q?Re:=20[PATCH=202/8]=20Port=20containerise?=
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1744277630832
To: "Andrew Cooper" <andrew.cooper3@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>, "=?utf-8?Q?Roger=20Pau=20Monn=C3=A9?=" <roger.pau@citrix.com>, "Stefano Stabellini" <sstabellini@kernel.org>, "Michal Orzel" <michal.orzel@amd.com>, "=?utf-8?Q?Marek=20Marczykowski-G=C3=B3recki?=" <marmarek@invisiblethingslab.com>
Message-Id: <Z_eQfmVjH5Z4TQ5K@l14>
References: <20250409163702.2037301-1-andrew.cooper3@citrix.com> <20250409163702.2037301-3-andrew.cooper3@citrix.com>
In-Reply-To: <20250409163702.2037301-3-andrew.cooper3@citrix.com>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.8ad5a537d5b3451185ff944bd7ecda08?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20250410:md
Date: Thu, 10 Apr 2025 09:33:54 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

On Wed, Apr 09, 2025 at 05:36:56PM +0100, Andrew Cooper wrote:
> +BASE="registry.gitlab.com/xen-project/hardware/test-artifacts"
> +case "_${CONTAINER}" in
> +    _alpine-x86_64-base) CONTAINER="${BASE}/alpine:x86_64-base" ;;

There's no "images/alpine/x86_64-base.dockerfile" in the repo, do you
mean "alpine:x86_64-rootfs" instead?

Cheers,

-- 

Anthony Perard | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech



