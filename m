Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A8B5D91A6AC
	for <lists+xen-devel@lfdr.de>; Thu, 27 Jun 2024 14:39:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.750056.1158306 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sMoOR-0004Pl-Qs; Thu, 27 Jun 2024 12:38:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 750056.1158306; Thu, 27 Jun 2024 12:38:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sMoOR-0004NI-Nx; Thu, 27 Jun 2024 12:38:27 +0000
Received: by outflank-mailman (input) for mailman id 750056;
 Thu, 27 Jun 2024 12:38:26 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Q1FW=N5=bounce.vates.tech=bounce-md_30504962.667d5d3d.v1-3cff0952a75c489c975df7cb677a1890@srs-se1.protection.inumbo.net>)
 id 1sMoOQ-0004Lu-EU
 for xen-devel@lists.xenproject.org; Thu, 27 Jun 2024 12:38:26 +0000
Received: from mail145-25.atl61.mandrillapp.com
 (mail145-25.atl61.mandrillapp.com [198.2.145.25])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 240d2180-3482-11ef-b4bb-af5377834399;
 Thu, 27 Jun 2024 14:38:23 +0200 (CEST)
Received: from pmta06.mandrill.prod.atl01.rsglab.com (localhost [127.0.0.1])
 by mail145-25.atl61.mandrillapp.com (Mailchimp) with ESMTP id
 4W8ylx5vDQz35hXmQ
 for <xen-devel@lists.xenproject.org>; Thu, 27 Jun 2024 12:38:21 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 3cff0952a75c489c975df7cb677a1890; Thu, 27 Jun 2024 12:38:21 +0000
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
X-Inumbo-ID: 240d2180-3482-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1719491901; x=1719752401;
	bh=HHUr0R2A0PLs0r7i6fQCR8T6CoP2tkG7jChUGBbfgYg=;
	h=From:Subject:Message-Id:To:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=G6jbAW9WlNRWAHfDZqmM5S+4LRmsLRg7OXqumiPXUkkSbVgwvZaCyp3XI3fWCxuON
	 oHRxkOLACemBDbtfITJUwJ/gyyaBhKpVvK1vFQ+hlbjaFUGtz3VgvNWLlCYNa7Y9lM
	 PtUl7W0tOM9v9iPpIL6YzU0NpRYbsEweIPpr58xaqdeSiJgcJjI7k3UGgVWVEhFXA8
	 gC+pIQ86xqkVLg6D+IuAg8jGh2Z+x+wBmQ+lNLjtxRRefcBcyF2enxIZq5jJSSaXiH
	 aMCiUmHhK0nCNgPWDrwr6ZSoVDYP/y8/ozg2Ovc1aAKiFhWSv3xa+0+R5IBCZ2jyGw
	 WMfUhR4HOU2NQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1719491901; x=1719752401; i=teddy.astie@vates.tech;
	bh=HHUr0R2A0PLs0r7i6fQCR8T6CoP2tkG7jChUGBbfgYg=;
	h=From:Subject:Message-Id:To:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=m2XQwZjnd3/7fTrodbVAX6QzYfGqN4+YFVX6g6VP4DNs2F0bbUlp0NJL3dTyeDCe1
	 Fj2kbSNFMbLDmD94Jvb11orC4Vhy6syJp/TA19nqW+mO4krxTKYmp/4AaYgjn67Taf
	 j2g9yPy62l1A/fmFjTIa4OFkQoVhpR476Vb3d1dJ0i57cG1PWrAX4sgVNod5tzxxpg
	 AgQvWaQeZYb+lOdxPAswd3jEqvcJzFcQADmmXXN9nKRbulQ56xlhhy113siQs4HtTl
	 bQjmUtpMdGQDTxjx57XS7t+fcD2XZ/3FFTzBoepFIeZYYnWCWT6odjQVcxIvRkq6ds
	 T/Uv1M51nF/Zw==
From: Teddy Astie <teddy.astie@vates.tech>
Subject: =?utf-8?Q?Re:=20Disaggregated=20(Xoar)=20Dom0=20Building?=
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1719491899276
Message-Id: <364e5058-ce40-482d-acf3-37f70266fdb3@vates.tech>
To: Lonnie Cumberland <lonnie@outstep.com>, Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org
References: <376f0fe4-4ae8-461d-87f2-0fa2e6913689@outstep.com> <59d67a78-14a0-42ac-b0dc-3d75c109f767@suse.com> <be292bcf-d77f-44ba-b29a-b1608586647b@outstep.com>
In-Reply-To: <be292bcf-d77f-44ba-b29a-b1608586647b@outstep.com>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.3cff0952a75c489c975df7cb677a1890?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20240627:md
Date: Thu, 27 Jun 2024 12:38:21 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hi Lonnie,

Le 27/06/2024 =C3=A0 11:33, Lonnie Cumberland a =C3=A9crit=C2=A0:
> I am working towards is to have 
> everything as a RAM-based ultra-lightweight thin hypervisor.=C2=A0=C2=A0 =
I looked 
> over ACRN, the NOVA Microhypervisor (Headron, Beadrock Udo), 
> Rust-Shyper, Bareflank-MicroV, and many other development efforts but it 
> seems that Xen is the most advanced for my purposes here.
> 

You can have a disk-less (or ramdisk based) distro supporting Xen with 
Alpine Linux (with Xen flavour). It does still use Dom0 with all its 
responsibilities though.

>>> Currently, I am investigating and researching the ideas of 
>>> "Disaggregating" Dom0 and have the Xoar Xen patches ("Breaking Up is 
>>> Hard to Do: Security and Functionality in a Commodity Hypervisor" 
>>> 2011) available which were developed against version 22155 of 
>>> xen-unstable. The Linux patches are against Linux with pvops 
>>> 2.6.31.13 and developed on a standard Ubuntu 10.04 install. My effort 
>>> would also be up update these patches.
>>>
>>> I have been able to locate the Xen "Dom0 Disaggregation" 
>>> (https://wiki.xenproject.org/wiki/Dom0_Disaggregation) am reading up 
>>> on things now but wanted to ask the developers list about any 
>>> experience you may have had in this area since the research objective 
>>> is to integrate Xoar with the latest Xen 4.20, if possible, and to 
>>> take it further to basically eliminate Dom0 all together with 
>>> individual Mini-OS or Unikernel "Service and Driver VM's" instead 
>>> that are loaded at UEFI boot time.

The latest stuff going on I have in mind regarding this idea of moving 
stuff out of Dom0 is QEMU as Unikernel (using Unikraft), there were some 
discussions on this in Matrix and at Xen Summit, and it's currently work 
in progress from Unikraft side.

Teddy


Teddy Astie | Vates XCP-ng Intern

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech


