Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 789A37DB64B
	for <lists+xen-devel@lfdr.de>; Mon, 30 Oct 2023 10:44:04 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.625049.973902 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qxOnN-0000iU-If; Mon, 30 Oct 2023 09:42:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 625049.973902; Mon, 30 Oct 2023 09:42:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qxOnN-0000gM-G3; Mon, 30 Oct 2023 09:42:53 +0000
Received: by outflank-mailman (input) for mailman id 625049;
 Mon, 30 Oct 2023 09:42:52 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=8Ooz=GM=bounce.vates.tech=bounce-md_30504962.653f7a97.v1-ecab575db48a446ab11c8dcd4b8e7f2c@srs-se1.protection.inumbo.net>)
 id 1qxOnL-0000gG-Qz
 for xen-devel@lists.xenproject.org; Mon, 30 Oct 2023 09:42:52 +0000
Received: from mail137-22.atl71.mandrillapp.com
 (mail137-22.atl71.mandrillapp.com [198.2.137.22])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id afb1032d-7708-11ee-9b0e-b553b5be7939;
 Mon, 30 Oct 2023 10:42:49 +0100 (CET)
Received: from pmta07.mandrill.prod.atl01.rsglab.com (localhost [127.0.0.1])
 by mail137-22.atl71.mandrillapp.com (Mailchimp) with ESMTP id
 4SJpGc02FwzFCWZZZ
 for <xen-devel@lists.xenproject.org>; Mon, 30 Oct 2023 09:42:48 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 ecab575db48a446ab11c8dcd4b8e7f2c; Mon, 30 Oct 2023 09:42:47 +0000
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
X-Inumbo-ID: afb1032d-7708-11ee-9b0e-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech;
	s=mandrill; t=1698658968; x=1698919468;
	i=vaishali.thakkar@vates.tech;
	bh=27kZKJ+F0MRA8fErAYHLDoQcxLR9bNNuPu5Or1KKmHM=;
	h=From:Subject:Message-Id:To:Cc:Feedback-ID:Date:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:CC:Date:Subject:From;
	b=Y0o3cTJYDHgjAUzLOrn2Ed24icOHCyBET24wpf/kJsEKGymvxMz0V5QiL8AwyRlVt
	 pnWR7erOrUhnGkZ1vaiAo2Tg4E2QHxUGslGDx82sguBnCTAOZdoZ9ASwUJleUyqlxR
	 4jmiaC4xUOSAuwHoMhyJQclglRuugHjWqirYf5nA=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
 i=@mandrillapp.com; q=dns/txt; s=mandrill; t=1698658967; h=from :
 subject : message-id : to : cc : date : mime-version : content-type :
 content-transfer-encoding : from : x-mandrill-user : list-unsubscribe;
 bh=27kZKJ+F0MRA8fErAYHLDoQcxLR9bNNuPu5Or1KKmHM=;
 b=JLzk6lBhwnqEX8Dfvvb3z50M7guHCcVA8sSuyBs6OAD5fi9OmXVAYMqLOCbRmprwRdjrY
 80es8qkjuPLpa2QdQj4IJSMKnOCzf1NhJOjDaHW5EvZR+4+DykPFIQI3rp/UHzMTOoKXK4H
 mhlsgrbNRIVo4FxLP0a2dDbK8mPHDvs=
From: Vaishali Thakkar <vaishali.thakkar@vates.tech>
Subject: =?utf-8?Q?AMD=20SEV=20Enablement=20plans=20in=20Xen?=
X-Bm-Milter-Handled: a6f8c62a-75f8-4756-90d1-92e0b788484c
X-Bm-Transport-Timestamp: 1698658967179
Message-Id: <1dceb501-1502-4621-a6c6-5e9e90e20280@vates.tech>
To: xen-devel@lists.xenproject.org
Cc: andrei.semenov@vates.tech, olivier.lambert@vates.tech
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.ecab575db48a446ab11c8dcd4b8e7f2c?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20231030:md
Date: Mon, 30 Oct 2023 09:42:47 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi All,

This is an informational post about our plans for the enablement of AMD SEV 
support in Xen. This work will be done as part of the Hyper OpenX project[1].

Phase Zero:
----------------

Our primary intention is to gather the necessary information required to 
commence the upstream work for this project. This phase also encompasses 
the development of a small demo to demonstrate the SME technology itself.

Please note, this small demo won't be part of the upstream, as its primary 
purpose is to demonstrate the SME technology as part of Hyper OpenX 
project. And it is not integral to the enablement work in Xen. Although the 
demo code will be open source, so feel free to keep an eye on this repo[2] 
as we'll add the related links there.

Phase One:
----------------
The main goal of this phase is to achieve basic SEV support using XTF 
guests. This work will entail:
- Xen adaptations to make it compliant with SEV technology. (For example: 
how Xen currently manages multiple ASIDs for a single VM)
- An ASP/PSP driver for platform and key management.
- ASID allocation mechanism

Dom0:

- Introduction of a security hypercall and an ASP sub-op
- Support for enabling SEV during guest creation

DomU XTF:

- Support for the security hypercall and ASP sub-op
- Support for the C bit
- Test cases for OSS-Test to launch the XTF guest

Phase Two:
----------------

This phase emphasizes achieving full support for the PVH VM with 
paravirtualized devices capable of running in the SEV-ES environment. The 
primary tasks include:

- SEV-ES support addition
- GHCB MSR protocol implementation and #vc handler
- Enhancements in PV protocol related to PV devices framework (Xenstore/Xen 
console)
- Adjustments in VMEXIT handling
- Establishing ABI rules for the HVM ABI redesign
- Dom0 developments concerning the HVM ABI redesign
- OSS Test: PVH Linux+initrd+metadata+signature mimicking phase one XTF test
- XTF(testing): comprehensive test cases for the new HVM ABI

Phase Three:
-----------------
This phase revolves around enabling SEV-SNP support for PVH Linux guests. 
Predominantly, this will require:

- Addition of alternative SNP commands supporting the API and extending the 
flow in the PSP/ASP driver
- Hypercall expansion for domain creation
- Developments in RMP Management
- Dom0 and DomU developments related to the enablement of SNP in guests
- Testing that includes support for guest RMP instructions

We're also looking forward to integrating CI and documenting the various 
project stages. Like any significant upstream project, implementation 
details may change as we advance. However, we are committed to 
collaborating and communicating with the Xen community regarding any 
modifications.

We would also like to thank Andrew and folks from Apertus solutions , in 
doing the early research with regards to defining the tasks for the AMD 
SEV-SNP enablement in Xen.

Please don't hesitate to reply here or email me & Andrei (CC'ed here) if 
you have any further inquiries.

Thank you,
Vaishali

[1] 
https://www.lemondeinformatique.fr/actualites/lire-hyper-open-x-sort-de-terre-avec-10-meteuro-de-financements-90954.html

[2] https://github.com/xcp-ng/hyper-sev-project

