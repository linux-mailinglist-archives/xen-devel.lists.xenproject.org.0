Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E1F248CD1BF
	for <lists+xen-devel@lfdr.de>; Thu, 23 May 2024 14:06:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.728441.1133362 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sA7CF-0003kC-IW; Thu, 23 May 2024 12:05:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 728441.1133362; Thu, 23 May 2024 12:05:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sA7CF-0003iV-Fn; Thu, 23 May 2024 12:05:23 +0000
Received: by outflank-mailman (input) for mailman id 728441;
 Thu, 23 May 2024 12:05:22 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=VTls=M2=bounce.vates.tech=bounce-md_30504962.664f30fd.v1-65d8e32aceea4e8482b1da48d10c8cc5@srs-se1.protection.inumbo.net>)
 id 1sA7CD-0003iP-Ux
 for xen-devel@lists.xenproject.org; Thu, 23 May 2024 12:05:22 +0000
Received: from mail136-17.atl41.mandrillapp.com
 (mail136-17.atl41.mandrillapp.com [198.2.136.17])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b967d79f-18fc-11ef-90a1-e314d9c70b13;
 Thu, 23 May 2024 14:05:20 +0200 (CEST)
Received: from pmta11.mandrill.prod.atl01.rsglab.com (localhost [127.0.0.1])
 by mail136-17.atl41.mandrillapp.com (Mailchimp) with ESMTP id
 4VlRgx6Gn9zPm0Qtd
 for <xen-devel@lists.xenproject.org>; Thu, 23 May 2024 12:05:17 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 65d8e32aceea4e8482b1da48d10c8cc5; Thu, 23 May 2024 12:05:17 +0000
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
X-Inumbo-ID: b967d79f-18fc-11ef-90a1-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1716465917; x=1716726417;
	bh=JNvFeMqGoI55P8uBt4zqoVdFN/j6TBeZElOI472f5r0=;
	h=From:Subject:Message-Id:To:Cc:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=yrne4+ruQu503UAP0VGUMslSmP6DelWU31ukUwnH4BJHSxV5ZLE8/eatY728uskkb
	 Epf2reRUCjAAhNvpwSwBBWs5DTfyC5QrpLuGWhHtw/FhK8MjpmwFvjphhdPAiS7ivS
	 HkSvkSUJXVq4hlT1OPIszMF/cgYEDa3ky7sbX+jLAkfjk26QSzyF5XmfXZGwc0L2C/
	 icsxa3Z9nJKvOGPXhAiRrYGs7x8g59BQLzTLBYuhGRAbeYXweow6AiDAI74xBvApUV
	 UZdXATL90zsddgPd6I5Fesguk9/NVIwtzmzQUaMnuSTuZ6x7ooBEP1CISiwGGcJbvj
	 PtZelil88A7Qw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1716465917; x=1716726417; i=teddy.astie@vates.tech;
	bh=JNvFeMqGoI55P8uBt4zqoVdFN/j6TBeZElOI472f5r0=;
	h=From:Subject:Message-Id:To:Cc:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=d6+Lcviq8b2imoOqBti+Ac5C4B2ZzW2e/SrQ6Yn2rDwxNtueZA9a5uK/aBQXQQULr
	 NTJ97ONO1QylvQ2PISfBxpsIeWM0aC1guxEhnjxG7j8Dosd/clhsICFHwCD9w2H7TK
	 USrzs0MP0DnwUBuQU/x0Vc59lOIbZT2h43Bk05ltCRlDfRBekOiWc4SLYiteFL3sqj
	 nkTPBN8mrT0pjk99fb6TUpZGYZ6VO1LmCPu4/1xUzFvvTBz0y7C2R7ax98SHgfpf+a
	 OWJzLrfMfpVlUWWa6ZKdunk2cXwvz7EiuOFT6TogASFRaEM1Zi3Sn4xIQkItu4nUMQ
	 8FptYcsUi8vXg==
From: Teddy Astie <teddy.astie@vates.tech>
Subject: =?utf-8?Q?Re:=20[XEN=20PATCH]=20x86/iommu:=20Conditionally=20compile=20platform-specific=20union=20entries?=
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1716465916649
Message-Id: <a934c9c3-7de1-4863-aec6-7bdbfbfaff5d@vates.tech>
To: =?utf-8?Q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Cc: xen-devel@lists.xenproject.org, Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>
References: <2744240f42dadcb1edc69d0f921d5909fe0f63a2.1716455673.git.teddy.astie@vates.tech> <Zk8R7YAhD9UHtVW6@macbook>
In-Reply-To: <Zk8R7YAhD9UHtVW6@macbook>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.65d8e32aceea4e8482b1da48d10c8cc5?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20240523:md
Date: Thu, 23 May 2024 12:05:17 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Le 23/05/2024 =C3=A0 11:52, Roger Pau Monn=C3=A9 a =C3=A9crit=C2=A0:
> The #ifdef and #endif processor directives shouldn't be indented.
> 
> Would you mind adding /* CONFIG_{AMD,INTEL}_IOMMU */ comments in the
> #endif directives?
>

Sure, will change it for v2.

> I wonder if we could move the definitions of those structures to the
> vendor specific headers, but that's more convoluted, and would require
> including the iommu headers in pci.h

Do you mean moving the vtd/amd union entries to separate structures (e.g 
vtd_arch_iommu) and put them into another file (I don't see any 
vendor-specific headers for this, perhaps create ones ?).

> 
> Thanks, Roger.

Teddy


Teddy Astie | Vates XCP-ng Intern

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech


