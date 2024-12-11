Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 367A09EC8CA
	for <lists+xen-devel@lfdr.de>; Wed, 11 Dec 2024 10:19:56 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.854167.1267439 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tLIsd-0006BC-Lm; Wed, 11 Dec 2024 09:19:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 854167.1267439; Wed, 11 Dec 2024 09:19:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tLIsd-00068l-J5; Wed, 11 Dec 2024 09:19:39 +0000
Received: by outflank-mailman (input) for mailman id 854167;
 Wed, 11 Dec 2024 09:19:38 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=GKKk=TE=bounce.vates.tech=bounce-md_30504962.67595927.v1-b80dabdd87a045679bd37280ca1c8e60@srs-se1.protection.inumbo.net>)
 id 1tLIsc-00068d-JV
 for xen-devel@lists.xenproject.org; Wed, 11 Dec 2024 09:19:38 +0000
Received: from mail180-34.suw31.mandrillapp.com
 (mail180-34.suw31.mandrillapp.com [198.2.180.34])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 071b9ec5-b7a1-11ef-99a3-01e77a169b0f;
 Wed, 11 Dec 2024 10:19:31 +0100 (CET)
Received: from pmta11.mandrill.prod.suw01.rsglab.com (localhost [127.0.0.1])
 by mail180-34.suw31.mandrillapp.com (Mailchimp) with ESMTP id
 4Y7VRW15QDzS62GfK
 for <xen-devel@lists.xenproject.org>; Wed, 11 Dec 2024 09:19:35 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 b80dabdd87a045679bd37280ca1c8e60; Wed, 11 Dec 2024 09:19:35 +0000
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
X-Inumbo-ID: 071b9ec5-b7a1-11ef-99a3-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1733908775; x=1734169275;
	bh=pT9B4PdumFBWIdOPG9d3JVLYS0KHd7B2GBDJnzQAJyg=;
	h=From:Subject:To:Cc:Message-Id:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=fJfeuJRLkj3rgut4I32nRbcyaTZ1+I2kscV7y7cNnM3n9QnEzow53Thm2nr8Le2Gf
	 mcaKrMMZxbgDFRTQI9qX7domkSyFnIz0WIQustGDgzzNnBr13xkYvLsA5RaqDCo9wh
	 dtxRZEZ3rHwGOvHy1pfF85kaUoCcxB473fD+RaGOO7Ity2x9g6cPTTxmimzccTyarp
	 f/eq89k1IgE0ZKrE2SeubB8aAsGPAtFo2PhB6YVwFOkvHGkjfXLbE8yOYMniTDcK5D
	 4id9/y9kKh/+Miqj29D52HP7upS0GobqnSFpqcji2q50JVvDPN4bgBedrCw3l6B8Wd
	 yxULeWOhoPaew==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1733908775; x=1734169275; i=anthony.perard@vates.tech;
	bh=pT9B4PdumFBWIdOPG9d3JVLYS0KHd7B2GBDJnzQAJyg=;
	h=From:Subject:To:Cc:Message-Id:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=EaoIGdJJ9GeKdMo13VqOvNz3FWR1b8xhEtzE3T6qYxQmPB/NJj1uwSLk3L2gAP/Zi
	 Ukg2eAELiPLqDU8VSdGSR79hQzXLoBd4T8hKw8WdPmtoxhUu7MlrmdIozytPxh98Gw
	 jpNySWZDY59JPthIkOl3PTMZG5st97G0cqU8ENj/0n2QGWMepqPMRF2z26/SeIqYmH
	 qRdxd9BEJ0FIXwT2oXaQwwW/XPHYtyUJXrsZSLUXegHLuoWoueAFPnX2SFEzxWt2oW
	 iecjmKorFF96E5e10Y0J9pe30wb1P6d7SArTcktmgyqvUxw0DJS5imoI+sMNPMULCB
	 SCKqYL/DNtP8Q==
From: "Anthony PERARD" <anthony.perard@vates.tech>
Subject: =?utf-8?Q?Re:=20[PATCH]=20MAINTAINERS:=20add=20Anthony,=20Michal,=20Roger=20to=20THE=20REST?=
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1733908772161
To: "Stefano Stabellini" <sstabellini@kernel.org>
Cc: xen-devel@lists.xenproject.org, kelly.choi@cloud.com, michal.orzel@amd.com, roger.pau@cloud.com, committers@xenproject.org
Message-Id: <Z1lZIxWlnm1YpvSK@l14>
References: <alpine.DEB.2.22.394.2412101558000.463523@ubuntu-linux-20-04-desktop>
In-Reply-To: <alpine.DEB.2.22.394.2412101558000.463523@ubuntu-linux-20-04-desktop>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.b80dabdd87a045679bd37280ca1c8e60?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20241211:md
Date: Wed, 11 Dec 2024 09:19:35 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 10, 2024 at 03:58:04PM -0800, Stefano Stabellini wrote:
> In recognition of their outstanding work and years of service to the Xen
> Community, please join me in welcoming Anthony, Michal, and Roger as
> Committers and REST Maintainers.
> 
> Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 026aa25a53..34ad49bc39 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -662,8 +662,11 @@ K:=09\b(xsm|XSM)\b
>  
>  THE REST
>  M:=09Andrew Cooper <andrew.cooper3@citrix.com>
> +M:=09Anthony PERARD <anthony.perard@vates.tech>
> +M:=09Michal Orzel <michal.orzel@amd.com>
>  M:=09Jan Beulich <jbeulich@suse.com>
>  M:=09Julien Grall <julien@xen.org>
> +M:=09Roger Pau Monn=C3=A9 <roger.pau@citrix.com>
>  M:=09Stefano Stabellini <sstabellini@kernel.org>
>  L:=09xen-devel@lists.xenproject.org
>  S:=09Supported

Acked-by: Anthony PERARD <anthony.perard@vates.tech>

Cheers,

-- 

Anthony Perard | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech


