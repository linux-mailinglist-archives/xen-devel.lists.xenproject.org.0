Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BAB72B0403
	for <lists+xen-devel@lfdr.de>; Thu, 12 Nov 2020 12:36:57 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.25716.53662 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kdAu9-0002qz-3Y; Thu, 12 Nov 2020 11:36:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 25716.53662; Thu, 12 Nov 2020 11:36:41 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kdAu8-0002qa-W1; Thu, 12 Nov 2020 11:36:40 +0000
Received: by outflank-mailman (input) for mailman id 25716;
 Thu, 12 Nov 2020 11:36:39 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=2UFB=ES=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kdAu7-0002qU-7H
 for xen-devel@lists.xenproject.org; Thu, 12 Nov 2020 11:36:39 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 7de6145b-45c5-4000-b620-a398842d3708;
 Thu, 12 Nov 2020 11:36:37 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id F2EA1AF24;
 Thu, 12 Nov 2020 11:36:36 +0000 (UTC)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=2UFB=ES=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
	id 1kdAu7-0002qU-7H
	for xen-devel@lists.xenproject.org; Thu, 12 Nov 2020 11:36:39 +0000
X-Inumbo-ID: 7de6145b-45c5-4000-b620-a398842d3708
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id 7de6145b-45c5-4000-b620-a398842d3708;
	Thu, 12 Nov 2020 11:36:37 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1605180997;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=vLKbMWaFXCMsz44OKSt0fQ8NlYkTUyvX8Xnk6olrnVQ=;
	b=q5+nxDMv4uYqyb1tHwcG4SMMWzlZQdfA/PQoXLvAejzIHfEeUbj2nnW8lVQGtiI4DVR18P
	FQzfTfai51SA8rnlfzihwp+JJsIRVtilOZpzY0V34Bxz1wAOTy+Z4Zx26VI7gia2WGaEii
	n1k6nbLpQCoQO+47oKYCty/ZRc4V1uU=
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id F2EA1AF24;
	Thu, 12 Nov 2020 11:36:36 +0000 (UTC)
Subject: Re: [PATCH v4 2/3] xen/oprofile: use NMI continuation for sending
 virq to guest
To: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, xen-devel@lists.xenproject.org
References: <20201109095021.9897-1-jgross@suse.com>
 <20201109095021.9897-3-jgross@suse.com>
 <d55adbc0-8a98-dd5c-c204-2ec11955c356@suse.com>
 <288804e4-75e6-6600-9634-8c0ea7a06c22@suse.com>
 <b84d687e-0aab-d48f-c068-1852cc1075b2@suse.com>
 <6229914c-bc76-2670-a272-ab0603f612cc@suse.com>
 <2fe880fb-43d6-8479-278f-a2a38c5b3a9f@suse.com>
 <f52adcb9-cff7-3bf9-ab98-881e471b0c9a@suse.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <11ead195-f3a9-f9ba-58b6-9ae96650cf07@suse.com>
Date: Thu, 12 Nov 2020 12:36:37 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.1
MIME-Version: 1.0
In-Reply-To: <f52adcb9-cff7-3bf9-ab98-881e471b0c9a@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 12.11.2020 12:27, Jürgen Groß wrote:
> On 12.11.20 12:05, Jan Beulich wrote:
>> On 12.11.2020 11:48, Jürgen Groß wrote:
>>> On 12.11.20 11:23, Jan Beulich wrote:
>>>> On 11.11.2020 16:48, Jürgen Groß wrote:
>>>>> On 11.11.20 16:45, Jan Beulich wrote:
>>>>>> On 09.11.2020 10:50, Juergen Gross wrote:
>>>>>>>     static int nmi_callback(const struct cpu_user_regs *regs, int cpu)
>>>>>>>     {
>>>>>>>     	int xen_mode, ovf;
>>>>>>>     
>>>>>>>     	ovf = model->check_ctrs(cpu, &cpu_msrs[cpu], regs);
>>>>>>>     	xen_mode = ring_0(regs);
>>>>
>>>> Unrelated to the patch here (i.e. just as an observation), this
>>>> use of ring_0() looks bogus when the NMI occurred in HVM guest
>>>> mode.
>>>
>>> An NMI in an HVM guest due to oprofile would be a VMEXIT with NMI
>>> reason, or just be handled completely inside the guest, right?
>>
>> Yes, and in the former case for VMX it would be handed on to do_nmi(),
>> with the guest register state. For SVM it would get handled on the
>> next STGI, i.e. would indeed never surface from HVM guest mode.
>>
>>> I don't see how this test should ever result in xen_mode being
>>> false for an HVM guest.
>>
>> I think, because of hvm_invalidate_regs_fields(), on VMX it would be
>> consistently true in release builds and consistently false in debug
>> ones.
> 
> Ah, okay. I searched for do_nmi(), but the vmx code uses the exception
> table instead.
> 
> So I guess this should be:
> 
> xen_mode = !guest_mode(regs);

Yes, I think so. Just that guest_mode() also has its issues (my patch
"x86: refine guest_mode()" improving it at least some is still pending
Andrew's go / no-go / improvement suggestions), so whether it's
suitable to use here may need some careful evaluation.

Jan

