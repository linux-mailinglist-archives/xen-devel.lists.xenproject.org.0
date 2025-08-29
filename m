Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BBDF7B3BCCB
	for <lists+xen-devel@lfdr.de>; Fri, 29 Aug 2025 15:48:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1101396.1454486 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1urzSX-0006tF-DS; Fri, 29 Aug 2025 13:48:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1101396.1454486; Fri, 29 Aug 2025 13:48:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1urzSX-0006qp-AU; Fri, 29 Aug 2025 13:48:05 +0000
Received: by outflank-mailman (input) for mailman id 1101396;
 Fri, 29 Aug 2025 13:48:04 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=d4/I=3J=bounce.vates.tech=bounce-md_30504962.68b1af91.v1-16a16003aa654314b456220f73ef316c@srs-se1.protection.inumbo.net>)
 id 1urzSV-0006qj-UV
 for xen-devel@lists.xenproject.org; Fri, 29 Aug 2025 13:48:03 +0000
Received: from mail180-6.suw31.mandrillapp.com
 (mail180-6.suw31.mandrillapp.com [198.2.180.6])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c7d66a61-84de-11f0-8adc-4578a1afcccb;
 Fri, 29 Aug 2025 15:48:02 +0200 (CEST)
Received: from pmta11.mandrill.prod.suw01.rsglab.com (localhost [127.0.0.1])
 by mail180-6.suw31.mandrillapp.com (Mailchimp) with ESMTP id 4cD02n1m05z2K2bj8
 for <xen-devel@lists.xenproject.org>; Fri, 29 Aug 2025 13:48:01 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 16a16003aa654314b456220f73ef316c; Fri, 29 Aug 2025 13:48:01 +0000
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
X-Inumbo-ID: c7d66a61-84de-11f0-8adc-4578a1afcccb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1756475281; x=1756745281;
	bh=qdqMh9oGIVcnu7jaFB68Y6ps+ZPJAxYb5jXR4lu26Jk=;
	h=From:Subject:Message-Id:To:Cc:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=O9ZgdTui9WSK4UcvxFq/zgr9OacK9azdNFugtjm3142AX9RFWRgRs1HiHIRRrcYAc
	 AAsy2VfJ7GWKvgDUWZd1jttlQ73WjaQugB8QmyIZVObi9Hc0LPiGbT4QmBb+Nd+qkd
	 E8VD+5nGwk231jbISiapoE1/PyMGgCe7VFp/iGSM3zpH9x4rkRmdX1eiZ9/uFfBih0
	 yEqIZrV7WfcZ5XOsJoN26t4OpodTOf9FhdjIKzQTyDzAyiORqrvGjd7P1uwzE+1nmD
	 tIL3tVEG1qISL965HsYzu9bJWCeuIWPYH9xeArmBUhaiH0gehx+OWm9ATgZtdLJJA8
	 vzFRzLfrSKODQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1756475281; x=1756735781; i=teddy.astie@vates.tech;
	bh=qdqMh9oGIVcnu7jaFB68Y6ps+ZPJAxYb5jXR4lu26Jk=;
	h=From:Subject:Message-Id:To:Cc:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=DeQYoEibHggnOgoxx00fLP80Zay+RPT/yFksm5p7MKrBuOcyLty1qan+6X5w5DoAZ
	 wfL7sdcalMdOPYeSvbD5rAY6TH+isjJ/9jq7bE1J2mKuWz0N3MORgInynd/w6sSQ3Q
	 Ez5ZMlKrCAXqqW3XXo6+JEr3CwKYfrC2uTB8Zcy8n/tU9vbLCedv1wEwrj9CtjlBUs
	 D/xDsgANRAxJh3vh0chluNvq7ETbHzTgqVCMltYvV3SVFT8PmwPi7Z1VDz/Hx7cFEo
	 mP48ZtAzliFAYnSjn6KOEBygWiYT3hx+4Msocdf1xDv/cmAeezO8qRKACEezcDAXt8
	 djzlJuHRn7D9g==
From: "Teddy Astie" <teddy.astie@vates.tech>
Subject: =?utf-8?Q?Re:=20[RFC=20PATCH=208/9]=20hvm:=20Introduce=20XEN=5FHVM=5FMEMMAP=5FTYPE=5FHOTPLUG=5FZONE?=
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1756475280188
Message-Id: <a3f55e6f-4467-47e4-8cf0-d5554ae354b8@vates.tech>
To: "Jan Beulich" <jbeulich@suse.com>
Cc: "Andrew Cooper" <andrew.cooper3@citrix.com>, "=?utf-8?Q?Roger=20Pau=20Monn=C3=A9?=" <roger.pau@citrix.com>, xen-devel@lists.xenproject.org
References: <cover.1755785258.git.teddy.astie@vates.tech> <3fe81c78b95f60353a84b8394883ecfeee066732.1755785258.git.teddy.astie@vates.tech> <43c65b51-ed9b-4ec5-b1dd-ae3a047cba86@suse.com>
In-Reply-To: <43c65b51-ed9b-4ec5-b1dd-ae3a047cba86@suse.com>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.16a16003aa654314b456220f73ef316c?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20250829:md
Date: Fri, 29 Aug 2025 13:48:01 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Le 28/08/2025 =C3=A0 14:40, Jan Beulich a =C3=A9crit=C2=A0:
> On 21.08.2025 17:25, Teddy Astie wrote:
>> Allow specifying in memory map a region which can be hotplugged.
>>
>> This will be used by a future memory hotplug feature.
> 
> Why could this not be done the ACPI way, with the regions properly specif=
ied
> in SRAT?
> 

I am not sure whether or not ACPI mandates a specific way of doing 
memory hotplug when SRAT is advertised. But if doesn't, SRAT sounds like 
a better alternative.

> Jan
> 



Teddy Astie | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech



