Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ED9EC96265E
	for <lists+xen-devel@lfdr.de>; Wed, 28 Aug 2024 13:51:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.784760.1194151 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sjHD0-0002zW-Fz; Wed, 28 Aug 2024 11:51:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 784760.1194151; Wed, 28 Aug 2024 11:51:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sjHD0-0002y0-Cs; Wed, 28 Aug 2024 11:51:30 +0000
Received: by outflank-mailman (input) for mailman id 784760;
 Wed, 28 Aug 2024 11:51:29 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=mQTD=P3=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1sjHCy-0002xs-UK
 for xen-devel@lists.xenproject.org; Wed, 28 Aug 2024 11:51:28 +0000
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com
 [2a00:1450:4864:20::62b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id db241cbd-6533-11ef-99a0-01e77a169b0f;
 Wed, 28 Aug 2024 13:51:26 +0200 (CEST)
Received: by mail-ej1-x62b.google.com with SMTP id
 a640c23a62f3a-a8684c31c60so796058666b.3
 for <xen-devel@lists.xenproject.org>; Wed, 28 Aug 2024 04:51:26 -0700 (PDT)
Received: from [10.125.226.166] ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a86e582d496sm235798766b.112.2024.08.28.04.51.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 28 Aug 2024 04:51:25 -0700 (PDT)
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
X-Inumbo-ID: db241cbd-6533-11ef-99a0-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1724845886; x=1725450686; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=YVonPyzXYY2JGbCkvrDq1/ZLFtUKj0/ExqdDot0/Pbk=;
        b=E/irsQde1B9GXpvTXDJiiv6/olIZ3z56nPCdNDVkGwTr0a0DNMPnHpdseRwwdE9VDO
         yihkaym7KuWYgQkuf+RzA5IJXJAfpLxMIm+F7NYAFVCn4HezST5pap2aWCo5A6NHkRjO
         NVvjtIl99VPvK/9nn20oIe/Z/ziTRDltGN0ks=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724845886; x=1725450686;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YVonPyzXYY2JGbCkvrDq1/ZLFtUKj0/ExqdDot0/Pbk=;
        b=PPQYg+H52zdse1Ivj0btYf2f7ZTbN2Y2+p9Bw+mipMPlYDe0gB7t07zD55rciKgKbP
         l4zBGziOt5YeVmBNXZ47lOLbBeBbK9HdRAgk1Lz3idLe6ikUuEjsV7HMOe9zBm8VVMHW
         1aTlQj/vDJKybOuTjJ3xbrj2LlsHZrMHdbvQEauuBhtOAdDr7+0J4vBdcfzckJ6859fF
         l9exDasPgOZ3KYpkLRcWc6gG2SRHtI7oBQNdUYYxHbJIMuXb6QwZmGQXkAOttocgmO24
         /8FjzwAfhAS2R8fIuPMtfqQREO24q1jNzkJBkj62kv0xAO6lTz1w0bjs3wrCw9/a0ci0
         MAuA==
X-Gm-Message-State: AOJu0YzDLmxUeBoCwqEXTvx4Xqt7DIoRb7ukN18+7NLD6WxaxE/qvC/i
	vlqazGm8rEbV1v+vAAaVcFf2/9y/+7+Pb/X4t7Xdbex6kSVxpsApJSuHHYwjhgVAbkRbPvcG4jT
	8
X-Google-Smtp-Source: AGHT+IE+ugCFsBDBm5lhEPhKz0TQhq202WjceTsu6m6/meNzD20Ptd5eR4KQX5jOZVV6p1r+mG6QGg==
X-Received: by 2002:a17:907:7d9f:b0:a86:8b7b:7880 with SMTP id a640c23a62f3a-a86a54bf55emr1178583166b.63.1724845885907;
        Wed, 28 Aug 2024 04:51:25 -0700 (PDT)
Message-ID: <bd206c4d-8e1d-488c-b428-3f6402a9ae4f@citrix.com>
Date: Wed, 28 Aug 2024 12:51:23 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6] x86/dom0: disable SMAP for PV domain building only
To: Jan Beulich <jbeulich@suse.com>, Roger Pau Monne <roger.pau@citrix.com>
Cc: xen-devel@lists.xenproject.org
References: <20240828113044.35541-1-roger.pau@citrix.com>
 <50658093-8463-4ee3-b308-31be2dd1fd42@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <50658093-8463-4ee3-b308-31be2dd1fd42@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 28/08/2024 12:50 pm, Jan Beulich wrote:
> On 28.08.2024 13:30, Roger Pau Monne wrote:
>> Move the logic that disables SMAP so it's only performed when building a PV
>> dom0, PVH dom0 builder doesn't require disabling SMAP.
>>
>> The fixes tag is to account for the wrong usage of cpu_has_smap in
>> create_dom0(), it should instead have used
>> boot_cpu_has(X86_FEATURE_XEN_SMAP).  Fix while moving the logic to apply to PV
>> only.
>>
>> While there also make cr4_pv32_mask __ro_after_init.
>>
>> Fixes: 493ab190e5b1 ('xen/sm{e, a}p: allow disabling sm{e, a}p for Xen itself')
>> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> Reviewed-by: Jan Beulich <jbeulich@suse.com>
> preferably with ...
>
>> @@ -1051,6 +1051,34 @@ out:
>>      return rc;
>>  }
>>  
>> +int __init dom0_construct_pv(struct domain *d,
>> +                             const module_t *image,
>> +                             unsigned long image_headroom,
>> +                             module_t *initrd,
>> +                             const char *cmdline)
>> +{
>> +    int rc;
>> +
>> +    /*
>> +     * Temporarily clear SMAP in CR4 to allow user-accesses in
>> +     * construct_dom0().  This saves a large number of corner cases
> ... the final 's' dropped here and ...
>
>> +     * interactions with copy_from_user().
>> +     */
>> +    if ( boot_cpu_has(X86_FEATURE_XEN_SMAP) )
>> +    {
>> +        cr4_pv32_mask &= ~X86_CR4_SMAP;
>> +        write_cr4(read_cr4() & ~X86_CR4_SMAP);
>> +    }
>> +    rc = dom0_construct(d, image, image_headroom, initrd, cmdline);
>> +    if ( boot_cpu_has(X86_FEATURE_XEN_SMAP) )
> ... blank lines added around the function call. Happy to adjust while
> committing, so long as you agree.

+1 to both suggestions.

Reviewed-by: Andrew Cooper <andrew.cooper3@citrix.com>

