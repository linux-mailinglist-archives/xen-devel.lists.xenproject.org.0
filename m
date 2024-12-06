Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D0C0F9E6FEB
	for <lists+xen-devel@lfdr.de>; Fri,  6 Dec 2024 15:17:24 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.850366.1264784 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tJZ86-0001G4-DA; Fri, 06 Dec 2024 14:16:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 850366.1264784; Fri, 06 Dec 2024 14:16:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tJZ86-0001EF-9W; Fri, 06 Dec 2024 14:16:26 +0000
Received: by outflank-mailman (input) for mailman id 850366;
 Fri, 06 Dec 2024 14:16:25 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=StVE=S7=bounce.vates.tech=bounce-md_30504962.67530734.v1-4ca2d43c805d4cd3ad4ee2cb8912a549@srs-se1.protection.inumbo.net>)
 id 1tJZ85-0001E9-6B
 for xen-devel@lists.xenproject.org; Fri, 06 Dec 2024 14:16:25 +0000
Received: from mail180-17.suw31.mandrillapp.com
 (mail180-17.suw31.mandrillapp.com [198.2.180.17])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id aad574e1-b3dc-11ef-99a3-01e77a169b0f;
 Fri, 06 Dec 2024 15:16:22 +0100 (CET)
Received: from pmta11.mandrill.prod.suw01.rsglab.com (localhost [127.0.0.1])
 by mail180-17.suw31.mandrillapp.com (Mailchimp) with ESMTP id
 4Y4YGD4RGfzRKMtvJ
 for <xen-devel@lists.xenproject.org>; Fri,  6 Dec 2024 14:16:20 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 4ca2d43c805d4cd3ad4ee2cb8912a549; Fri, 06 Dec 2024 14:16:20 +0000
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
X-Inumbo-ID: aad574e1-b3dc-11ef-99a3-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1733494580; x=1733755080;
	bh=Y0o1f3HA8+COSIdJmIZ/qovkjjUIMOVDZfQZHuY9OhQ=;
	h=From:Subject:Message-Id:To:Cc:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=L0q3CzeC5wwg9fk1WmGeOIK3NLIvIiKF4xLOu48HW/5gkG7d5oWt7XPQDI8HDWI7f
	 ubo59GjbmVbrFl7xWEVPIrLUIrigKWUnBFDyePJ2CtOXpvyhovyYsaUwFReNUhgqfy
	 7/AFLpAe4nGyEyLw9Biaf5kIKcoivQ6jxiP8LoX63b5ZvSy5DKd6N71bhB+4R6R1ei
	 fXtFrPcEVDW3v6HGQ+D6wIP6zWgy0uwTY89e7xOIg2BIaGJt5ZLKCbvCBRDnXwf5Qc
	 nkMk3PhZyCgf03A3hug79gVlIq2/v1PJkhCdZsh170yAuFmluSVV0NfNHRA7S59Y/y
	 gVQuNyi2za2kg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1733494580; x=1733755080; i=ngoc-tu.dinh@vates.tech;
	bh=Y0o1f3HA8+COSIdJmIZ/qovkjjUIMOVDZfQZHuY9OhQ=;
	h=From:Subject:Message-Id:To:Cc:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=DQgDLklNvaXSd27Jrl7Vk074nMTsEuSxx+x+k0U/IAn4BASsqoOAjLCX0ajcnCd/W
	 b8bNRwHxiijYk0wqZuZWZw45xFta2irTv6oVPBNIelc+vJDibpuOLzPNCpwlW8t/+O
	 1KtOGp8LLE9FYkPTjKeXFQ5+lbP+CSzzQVGoplKoRKAdmXTvaeO/NTAJ8CX4kXUju0
	 8NOK7gayH+Tr7zHLz+VwWmCQzS3gTUUIYBrjTAgFkOkLWNrIM7q4C3sfouj3w1X/Lo
	 w6AdzHDoVW2QNYpByxS6KMuAahUtWy+bgecVsfV2TocBxoqKS34CraoUMNmOsEqpa+
	 KJjS5+BZuvbWw==
From: "Tu Dinh" <ngoc-tu.dinh@vates.tech>
Subject: =?utf-8?Q?Re:=20[PATCH=200/4]=20Virtualize=20architectural=20LBRs?=
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1733494579706
Message-Id: <953fed09-385c-4489-ae50-b59ebd444114@vates.tech>
To: "Andrew Cooper" <andrew.cooper3@citrix.com>, "Jan Beulich" <jbeulich@suse.com>
Cc: xen-devel@lists.xenproject.org
References: <20241118084914.22268-1-ngoc-tu.dinh@vates.tech> <7706bd63-8f26-4eb8-8dc0-67b302597e3b@suse.com> <3f75df1d-f397-487f-9b81-d7740712b924@vates.tech> <78d9df73-c9b7-479d-8e05-e4efb823ea20@citrix.com>
In-Reply-To: <78d9df73-c9b7-479d-8e05-e4efb823ea20@citrix.com>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.4ca2d43c805d4cd3ad4ee2cb8912a549?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20241206:md
Date: Fri, 06 Dec 2024 14:16:20 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hi Andrew,

On 18/11/2024 10:52, Andrew Cooper wrote:
> On 18/11/2024 9:13 am, Tu Dinh wrote:
>> On 18/11/2024 09:52, Jan Beulich wrote:
>>> Looking over just the files touched: No change to XSAVE logic at all?
>> XSAVE is hidden behind a new IA32_XSS bit. I'll try to implement that ne=
xt.
> 
> It's rather more severe than that.
> 
> Without XSAVE support, Xen can't context-switch the LBR state when vCPUs
> are scheduled in and out.=C2=A0 (In patch 4 you seem to have copied the
> legacy way, which is extremely expensive.)
> 
> Architecturally, ARCH_LBR depends on XSAVES so OSes can context switch
> it easily(ish) per thread.
> 
> There's also a reason why we haven't got this working yet.=C2=A0 There ar=
e a
> couple of areas of prerequisite work which need addressing before XSS
> can be enabled properly.
> 
> If you're willing to tackle this, then I can explain what needs doing,
> and in roughly which order.
> 
> ~Andrew

Following the community call yesterday, I'd like to clarify my 
understanding of the issue:

- Firstly, virtual XSS support for architectural LBR must be enabled. I 
noticed that XSS is already implemented, just not enabled; barring the 
LBR format issues below, are there any other issues with the current XSS 
implementation?

- There are LBR format differences between some cores of the same CPU 
(e.g. in Intel hybrid CPUs: P-cores use effective IP while E-cores use 
linear IP). These differences are expected to be handled by 
XSAVES/XRSTORS. However, Xen would have to make sure that LBR MSRs are 
saved/restored by XSS instead of by manually poking MSRs.

- A related issue is handling the compressed XSAVE format for migration 
streams. Xen currently expands/compacts XSAVE format manually during 
migration; are there any concerns with arch LBR breaking the XSAVE 
migration logic?

My understanding is that as long as we don't manually poke the LBR state 
component, and that LBR state size remains consistent across hybrid 
cores in the same CPU (which it should be for XSAVE compatibility), 
there should be no concern with the XSAVE state itself. However, Xen 
must check CPU features of both sides during migration to make sure that 
XSAVE states are compatible, which is more complex in migrations 
involving hosts with hybrid CPUs.

Please tell me if I'm missing any potential issues.

Thanks,


Ngoc Tu Dinh | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech


