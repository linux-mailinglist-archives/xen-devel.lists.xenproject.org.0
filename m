Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 206FE50FB71
	for <lists+xen-devel@lfdr.de>; Tue, 26 Apr 2022 12:50:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.313783.531527 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1njIm6-0001MH-IF; Tue, 26 Apr 2022 10:50:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 313783.531527; Tue, 26 Apr 2022 10:50:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1njIm6-0001Jb-F8; Tue, 26 Apr 2022 10:50:30 +0000
Received: by outflank-mailman (input) for mailman id 313783;
 Tue, 26 Apr 2022 10:50:28 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=bVWk=VE=apertussolutions.com=dpsmith@srs-se1.protection.inumbo.net>)
 id 1njIm4-0001JU-T1
 for xen-devel@lists.xenproject.org; Tue, 26 Apr 2022 10:50:28 +0000
Received: from sender4-of-o51.zoho.com (sender4-of-o51.zoho.com
 [136.143.188.51]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ae407c12-c54e-11ec-8fc2-03012f2f19d4;
 Tue, 26 Apr 2022 12:50:27 +0200 (CEST)
Received: from [10.10.1.128] (static-72-81-132-2.bltmmd.fios.verizon.net
 [72.81.132.2]) by mx.zohomail.com
 with SMTPS id 1650970222258997.9651052220515;
 Tue, 26 Apr 2022 03:50:22 -0700 (PDT)
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
X-Inumbo-ID: ae407c12-c54e-11ec-8fc2-03012f2f19d4
ARC-Seal: i=1; a=rsa-sha256; t=1650970224; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=VA/LgwvKPyhMEL87ZqPVOX+nNpOGv7cDnLFnV7DcptEDb90erKtqd+0dT+/J709R+epTxNU6tZPM99k22ErjEXIrmhidRDtF34neaIaelEOEw0THD6I8kW79/BIblJTxKBRBDJKYEK2MP/kxMdBSFEncxjozyLIrM9fY/v9U0cY=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1650970224; h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To; 
	bh=3NQrrNyZoAl0l1fOEv3Xq3z7Xgge+LjZzQZC2mC6AAI=; 
	b=nsBqNXT+aDzm//EV9+QzlDRujpBx/zxnG/Z9gf817YDhilhgahRtW6o9NC3/P4P6gftXFPucMYEDmOShqqyW762fLPjQN52Iu4NzvAlyuU9OUzGFLmVC9twn9bMJ+V7MvhSotG3DGfTJ5DPqOtmfS8n5KYbll+wrIM2HWEyjTCM=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1650970224;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=3NQrrNyZoAl0l1fOEv3Xq3z7Xgge+LjZzQZC2mC6AAI=;
	b=pgquhFaBPXkDdhM4LkMWxz3KzA8udZqEByQk2p1u16F0Yphyg+jD0ZIZZJT250X/
	1vI3I52ZcVvYAnyL4frN1fS2l4AWJdaFwaLQjXXsdVf9/6x5EmiU2d38VvENEhlqV0Z
	7Qa/JzcVS1IR6FnF70o10xS00MhzxwHMq/H61wmg=
Message-ID: <76db9e2c-7552-f316-ea57-1fc59244389d@apertussolutions.com>
Date: Tue, 26 Apr 2022 06:49:31 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.0
Subject: Re: [PATCH] xsm/flask: code style formatting
Content-Language: en-US
To: Jan Beulich <jbeulich@suse.com>
Cc: "jandryuk@gmail.com" <jandryuk@gmail.com>,
 Daniel De Graaf <dgdegra@tycho.nsa.gov>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <Andrew.Cooper3@citrix.com>
References: <20220422194344.9318-1-dpsmith@apertussolutions.com>
 <5b199cfb-98c8-c382-82b3-a60819a0e977@citrix.com>
 <0e2724dc-bde8-a477-24aa-4bec5da55548@suse.com>
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
In-Reply-To: <0e2724dc-bde8-a477-24aa-4bec5da55548@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External



On 4/26/22 04:38, Jan Beulich wrote:
> On 23.04.2022 01:07, Andrew Cooper wrote:
>> On 22/04/2022 20:43, Daniel P. Smith wrote:
>>> diff --git a/xen/xsm/flask/hooks.c b/xen/xsm/flask/hooks.c
>>> index 0bf63ffa84..e2ebbc7716 100644
>>> --- a/xen/xsm/flask/hooks.c
>>> +++ b/xen/xsm/flask/hooks.c
>>> @@ -120,8 +121,8 @@ static int get_irq_sid(int irq, u32 *sid, struct avc_audit_data *ad)
>>>           struct irq_desc *desc = irq_to_desc(irq);
>>>           if ( desc->msi_desc && desc->msi_desc->dev ) {
> 
> I've elected to also fix this misplaced brace while committing.

Ack.

>>>               struct pci_dev *dev = desc->msi_desc->dev;
>>> -            u32 sbdf = (dev->seg << 16) | (dev->bus << 8) | dev->devfn;
>>> -            if (ad) {
>>> +            uint32_t sbdf = (dev->seg << 16) | (dev->bus << 8) | dev->devfn;
>>> +            if ( ad ) {
>>
>> Brace on newline, and in the subsequent hunk.  Can be fixed on commit.
>>
>> Otherwise, LGTM.  Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>
> 
> Strictly speaking the u32 -> uint32_t conversion was getting us only
> half the mileage, but I've committed the change as is (in this regard)
> nevertheless. In many of the cases "unsigned int" or alike should be
> used instead.

Thank you, I can add a review of uint{X}_t usage to the list of updates 
for flask.

v/r,
dps

