Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 404B819587A
	for <lists+xen-devel@lfdr.de>; Fri, 27 Mar 2020 15:02:12 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jHpWB-0007Hn-Fr; Fri, 27 Mar 2020 13:59:27 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=RsLI=5M=gmail.com=julien.grall.oss@srs-us1.protection.inumbo.net>)
 id 1jHpW9-0007Hc-FR
 for xen-devel@lists.xenproject.org; Fri, 27 Mar 2020 13:59:25 +0000
X-Inumbo-ID: 2a2340b0-7033-11ea-8995-12813bfff9fa
Received: from mail-ed1-f68.google.com (unknown [209.85.208.68])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 2a2340b0-7033-11ea-8995-12813bfff9fa;
 Fri, 27 Mar 2020 13:59:24 +0000 (UTC)
Received: by mail-ed1-f68.google.com with SMTP id a43so11219405edf.6
 for <xen-devel@lists.xenproject.org>; Fri, 27 Mar 2020 06:59:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=SSj+YvyZCis1FlcnGg/woqlnXgxuE7afOSuDv7Usuyk=;
 b=DYjlBxnvql1RKJIv4ItUxiOTin4XpB1Epu22XHBrt2guvThm+wqUE4dP6rB2eD6dkK
 LEGx1RPr5DcWKsFW7n9mxk7VIfT1jxa1wJoECS1macf2N9TbQ0hk1oMIZzVRLH9Z3U+g
 H1GH1ZWjAbZIQtgYkNvWCu06twy+OMsU/FxAA33Zectdallp0ES7gnKvY/NSrzEYoR+e
 HSvGa8qbPb8DvSv5Kq6CS+ALHccy+TQOkXW5E/9rTbDB01sVKWACkNPJWN/Lm4skLfY4
 l9t9MljukrrvFLJ/qAILfC/ZRtsW7bV8sBBVg7sl7U90x1NAJxHG0i/eWvE1Sn63TrU6
 pkCg==
X-Gm-Message-State: ANhLgQ1fT4TYAntmevef9ukNk/dhjQnwb37mWGvoWi1xNivQHEsUpuX6
 lot9PdoE+Q/LeuKvWUXl58I=
X-Google-Smtp-Source: ADFU+vtaJXLaRbLrSSe0el3eLvYJqzlFYOohJc7dksKgreT5sIUAp8A2y7zeeS74zUj/NmPdY8O9Jw==
X-Received: by 2002:a17:906:958c:: with SMTP id
 r12mr9722971ejx.36.1585317563683; 
 Fri, 27 Mar 2020 06:59:23 -0700 (PDT)
Received: from a483e7b01a66.ant.amazon.com ([54.239.6.187])
 by smtp.gmail.com with ESMTPSA id b15sm869559edn.69.2020.03.27.06.59.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 27 Mar 2020 06:59:23 -0700 (PDT)
To: Jan Beulich <jbeulich@suse.com>
References: <20200322161418.31606-1-julien@xen.org>
 <20200322161418.31606-18-julien@xen.org>
 <5a5e6da9-ddef-ee4f-fb11-99e3e2b5ef63@suse.com>
From: Julien Grall <julien@xen.org>
Message-ID: <e9b4b151-19c2-760a-095f-5a646a025668@xen.org>
Date: Fri, 27 Mar 2020 13:59:21 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:68.0)
 Gecko/20100101 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <5a5e6da9-ddef-ee4f-fb11-99e3e2b5ef63@suse.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
Subject: Re: [Xen-devel] [PATCH 17/17] xen: Switch parameter in
 get_page_from_gfn to use typesafe gfn
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Kevin Tian <kevin.tian@intel.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Paul Durrant <paul@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Tim Deegan <tim@xen.org>,
 Julien Grall <julien.grall@arm.com>, Jun Nakajima <jun.nakajima@intel.com>,
 xen-devel@lists.xenproject.org, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Hi Jan,

On 27/03/2020 13:50, Jan Beulich wrote:
> On 22.03.2020 17:14, julien@xen.org wrote:
>> --- a/xen/arch/x86/hvm/domain.c
>> +++ b/xen/arch/x86/hvm/domain.c
>> @@ -296,8 +296,10 @@ int arch_set_info_hvm_guest(struct vcpu *v, const vcpu_hvm_context_t *ctx)
>>       if ( hvm_paging_enabled(v) && !paging_mode_hap(v->domain) )
>>       {
>>           /* Shadow-mode CR3 change. Check PDBR and update refcounts. */
>> -        struct page_info *page = get_page_from_gfn(v->domain,
>> -                                 v->arch.hvm.guest_cr[3] >> PAGE_SHIFT,
>> +        struct page_info *page;
>> +
>> +        page = get_page_from_gfn(v->domain,
>> +                                 gaddr_to_gfn(v->arch.hvm.guest_cr[3]),
> 
> My earlier comment on this remains - I thing this conversion makes
> the problem this expression has more hidden than with the shift.
> This would better use a gfn_from_cr3() helper (or whatever it'll
> be that it gets named). Same elsewhere in this patch then.

I will have a closer look the *cr3 helpers and reply with some suggestions.

> 
>> @@ -2363,7 +2364,7 @@ int hvm_set_cr3(unsigned long value, bool may_defer)
>>       {
>>           /* Shadow-mode CR3 change. Check PDBR and update refcounts. */
>>           HVM_DBG_LOG(DBG_LEVEL_VMMU, "CR3 value = %lx", value);
>> -        page = get_page_from_gfn(v->domain, value >> PAGE_SHIFT,
>> +        page = get_page_from_gfn(v->domain, cr3_to_gfn(value),
> 
> Oh, seeing this I recall Paul did point out the above already.
> 
>> @@ -508,7 +508,7 @@ int evtchn_fifo_init_control(struct evtchn_init_control *init_control)
>>   {
>>       struct domain *d = current->domain;
>>       uint32_t vcpu_id;
>> -    uint64_t gfn;
>> +    gfn_t gfn;
>>       uint32_t offset;
>>       struct vcpu *v;
>>       int rc;
>> @@ -516,7 +516,7 @@ int evtchn_fifo_init_control(struct evtchn_init_control *init_control)
>>       init_control->link_bits = EVTCHN_FIFO_LINK_BITS;
>>   
>>       vcpu_id = init_control->vcpu;
>> -    gfn     = init_control->control_gfn;
>> +    gfn     = _gfn(init_control->control_gfn);
> 
> There's silent truncation here now for Arm32, afaict. Are we really
> okay with this?

Well, the truncation was already silently happening as we call 
get_page_from_gfn() in map_guest_page(). So it is not worse than the 
current situation.

Although, there are a slight advantage with the new code as you can more 
easily spot potential truncation. Indeed, you could add some type check 
in _gfn().

Cheers,

-- 
Julien Grall

