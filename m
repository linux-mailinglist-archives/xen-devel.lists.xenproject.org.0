Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D90448CE4C4
	for <lists+xen-devel@lfdr.de>; Fri, 24 May 2024 13:16:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.729409.1134601 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sASu9-0003NT-EU; Fri, 24 May 2024 11:16:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 729409.1134601; Fri, 24 May 2024 11:16:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sASu9-0003KH-Az; Fri, 24 May 2024 11:16:09 +0000
Received: by outflank-mailman (input) for mailman id 729409;
 Fri, 24 May 2024 11:16:08 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=di0w=M3=cloud.com=alejandro.vallejo@srs-se1.protection.inumbo.net>)
 id 1sASu8-0003K3-0X
 for xen-devel@lists.xenproject.org; Fri, 24 May 2024 11:16:08 +0000
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com
 [2a00:1450:4864:20::636])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 017ba667-19bf-11ef-b4bb-af5377834399;
 Fri, 24 May 2024 13:16:02 +0200 (CEST)
Received: by mail-ej1-x636.google.com with SMTP id
 a640c23a62f3a-a6265d3ba8fso69688666b.0
 for <xen-devel@lists.xenproject.org>; Fri, 24 May 2024 04:16:02 -0700 (PDT)
Received: from [192.168.0.16] (0545937c.skybroadband.com. [5.69.147.124])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a626cc8e2b2sm116641866b.171.2024.05.24.04.16.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 24 May 2024 04:16:01 -0700 (PDT)
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
X-Inumbo-ID: 017ba667-19bf-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1716549362; x=1717154162; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=LErNZqDdT1LDKm+B+1gqdgsfgkPjrgXE96aziTJ654M=;
        b=O0fV8+BeehFz3tkqFSf2Oy3Az4qwv1I8ue45oh9WX3D5jA71sdf71w756IwQM6ijfH
         NTvZHHOorD7xHyn2bLo6vY08BkpcdJpj8bKNnmDLOEdK/XWzDYC+bpqTS7C1qUZrWzXo
         DnRRtm72T045nqAJ7r6S9gw319fFRXvTN3m5A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716549362; x=1717154162;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=LErNZqDdT1LDKm+B+1gqdgsfgkPjrgXE96aziTJ654M=;
        b=eSch5IAoIrNEnjPVTSmZxlT36ttnXRinj0kH6XcSzPTzretH1wp5ZrRP2fTTDgMoah
         FQJYmPV9YaibGWqTWWMRmaGQwsW6JAq/FS8WXv+ZrCc8Zuecp3AwTW0PX54h+jZPEKWM
         eC2+JTrVo8rYmb/sOy85KLy6/e96rCHb0VI3BS2nk15uFQvQ3h0iv9a2z0aM6puQUMsj
         e2H3o7dkNVLGcF0K8OgGjOF10bae80CZh13gtEnTsclYD7o0MtSk2BrDXNM5Q+Xyi7Qf
         NlOTmqkzHSNgn4SmrPzI9KczThwdeYu1kWv45xO4H9dUzKEHioBPWTPugliID6KNkl3r
         zpLQ==
X-Gm-Message-State: AOJu0YwotMVCfO4M05eGEjgLiiBsGHG+/1MkZ3CDZvWWONYcd3vQJVxo
	6tGfoWs25Kz1Aa6aYv2Yt6quD3/BNBJ+wh77+qRKr6gsqCoT0+4StHmvyFrti6E=
X-Google-Smtp-Source: AGHT+IFvAbBYwIfdM6sb67Rlktjl3lRkBTwQx2ML+6+wxE1Y5nXsbhxs98rjKHoeHWHh5vdPjqDIzw==
X-Received: by 2002:a17:907:3a13:b0:a59:cb29:3fb5 with SMTP id a640c23a62f3a-a62641de8a2mr113291766b.20.1716549362182;
        Fri, 24 May 2024 04:16:02 -0700 (PDT)
Message-ID: <a1f7a182-4cf2-4fd1-ba8f-5b12a34b1af0@cloud.com>
Date: Fri, 24 May 2024 12:16:00 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/8] x86/vlapic: Move lapic_load_hidden migration
 checks to the check hook
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
 Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>
References: <cover.1715102098.git.alejandro.vallejo@cloud.com>
 <499e029a7d2fce4fb9118b1e508313f369b37c79.1715102098.git.alejandro.vallejo@cloud.com>
 <Zk9Xy7W30WWZlb6-@macbook>
Content-Language: en-GB
From: Alejandro Vallejo <alejandro.vallejo@cloud.com>
In-Reply-To: <Zk9Xy7W30WWZlb6-@macbook>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 23/05/2024 15:50, Roger Pau Monné wrote:
> On Wed, May 08, 2024 at 01:39:22PM +0100, Alejandro Vallejo wrote:
>> While at it, add a check for the reserved field in the hidden save area.
>>
>> Signed-off-by: Alejandro Vallejo <alejandro.vallejo@cloud.com>
>> ---
>> v2:
>>   * New patch. Addresses the missing check for rsvd_zero in v1.
> 
> Oh, it would be better if this was done at the time when rsvd_zero is
> introduced.  I think this should be moved ahead of the series, so that
> the patch that introduces rsvd_zero can add the check in
> lapic_check_hidden().

I'll give that a whirl.

> 
>> ---
>>  xen/arch/x86/hvm/vlapic.c | 41 ++++++++++++++++++++++++++++-----------
>>  1 file changed, 30 insertions(+), 11 deletions(-)
>>
>> diff --git a/xen/arch/x86/hvm/vlapic.c b/xen/arch/x86/hvm/vlapic.c
>> index 8a244100009c..2f06bff1b2cc 100644
>> --- a/xen/arch/x86/hvm/vlapic.c
>> +++ b/xen/arch/x86/hvm/vlapic.c
>> @@ -1573,35 +1573,54 @@ static void lapic_load_fixup(struct vlapic *vlapic)
>>                 v, vlapic->loaded.id, vlapic->loaded.ldr, good_ldr);
>>  }
>>  
>> -static int cf_check lapic_load_hidden(struct domain *d, hvm_domain_context_t *h)
>> +static int cf_check lapic_check_hidden(const struct domain *d,
>> +                                       hvm_domain_context_t *h)
>>  {
>>      unsigned int vcpuid = hvm_load_instance(h);
>> -    struct vcpu *v;
>> -    struct vlapic *s;
>> +    struct hvm_hw_lapic s;
>>  
>>      if ( !has_vlapic(d) )
>>          return -ENODEV;
>>  
>>      /* Which vlapic to load? */
>> -    if ( vcpuid >= d->max_vcpus || (v = d->vcpu[vcpuid]) == NULL )
>> +    if ( vcpuid >= d->max_vcpus || d->vcpu[vcpuid] == NULL )
>>      {
>>          dprintk(XENLOG_G_ERR, "HVM restore: dom%d has no apic%u\n",
>>                  d->domain_id, vcpuid);
>>          return -EINVAL;
>>      }
>> -    s = vcpu_vlapic(v);
>>  
>> -    if ( hvm_load_entry_zeroextend(LAPIC, h, &s->hw) != 0 )
>> +    if ( hvm_load_entry_zeroextend(LAPIC, h, &s) )
> 
> Can't you use hvm_get_entry() to perform the sanity checks:
> 
> const struct hvm_hw_lapic *s = hvm_get_entry(LAPIC, h);
> 
> Thanks, Roger.

I don't think I can. Because the last field (rsvd_zero) might or might
not be there, so it needs to be zero-extended. Unless I misunderstood
what hvm_get_entry() is meant to do. It seems to check for exact sizes.

Cheers,
Alejandro

