Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D68B886E0D8
	for <lists+xen-devel@lfdr.de>; Fri,  1 Mar 2024 13:08:19 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.687633.1071324 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rg1g8-0003Zg-Pn; Fri, 01 Mar 2024 12:07:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 687633.1071324; Fri, 01 Mar 2024 12:07:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rg1g8-0003Y0-MO; Fri, 01 Mar 2024 12:07:52 +0000
Received: by outflank-mailman (input) for mailman id 687633;
 Fri, 01 Mar 2024 12:07:50 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=do9M=KH=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1rg1g6-0003Xu-IJ
 for xen-devel@lists.xenproject.org; Fri, 01 Mar 2024 12:07:50 +0000
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [2a00:1450:4864:20::336])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 52a579a5-d7c4-11ee-afd8-a90da7624cb6;
 Fri, 01 Mar 2024 13:07:49 +0100 (CET)
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-412c34e84a5so8123625e9.3
 for <xen-devel@lists.xenproject.org>; Fri, 01 Mar 2024 04:07:49 -0800 (PST)
Received: from [10.80.67.149] (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 c21-20020a05600c0a5500b00412cb0961fasm549799wmq.6.2024.03.01.04.07.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 01 Mar 2024 04:07:47 -0800 (PST)
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
X-Inumbo-ID: 52a579a5-d7c4-11ee-afd8-a90da7624cb6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1709294869; x=1709899669; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=yXxfSimnoRmoFAT1TH4Kc2IG3WcGZKA2IB43QW1qH2s=;
        b=oXlfsH7hESbU9dhoBQe92H8h5jPDwDlXKKKlKGUczS6K6sN4N0znbCwniyj7Wum4T8
         pUb1hxTBbJ7iqm4y2TeRngYjQf83rnJUEqln5swmG0DzuQvP/mD58ZFaJswL6gqBYhAb
         EoWVQqU68caLcpI1bWcJ68btAddNqDFtM3rIk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709294869; x=1709899669;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=yXxfSimnoRmoFAT1TH4Kc2IG3WcGZKA2IB43QW1qH2s=;
        b=D+2p1pGVaDzdT0EIiPo0oALM54ldr4E22r7sES+oofq7jgTGmGkt9szYbu2pfb0g7Q
         HgfmdKBhnBT0zYBdj2XGi7SAX8XftplQp4x5ioMD0/0vkxfW2YmaOpRUjFEbdZ+bm/h8
         07pnRJ9Bso8iRjKzqp7ynnAkgt+HSCvJC3bW9GNH+GueHoYzmtqEI+HAgZRlalhTl3j+
         RMsqppDFFM4kMJzsEt4pWU3O6bmBwIasuwPadOGENa6I5DQkrsjjg30WMGXB9/ahnbEp
         FuUUOhilgX7SmY4VDFQRdT+Xx0g7r4yFkSuzCoudx/JWbbEKzmcps1vrzSwEJ3NDlH5W
         bsKg==
X-Gm-Message-State: AOJu0YzB8TAkK44H8odiZSEas1vv0hp8e9YnW+BgtYLM1wZbP1vgJzt4
	TmGcEg6XXuI3froXxA2+rvhQ38F+qoHQnpQPNpQpsMxYVddLXGwaqu/lWcOSpO8rb5rsPK4RV9W
	j
X-Google-Smtp-Source: AGHT+IEpnXp7em0Y6tiDHUiXWmuvVfBLt7QU+qQoGfrUVkpPAsoRyAe2XYUejDT6tViEetrrRTGvOg==
X-Received: by 2002:a7b:c7d9:0:b0:412:9ed4:290 with SMTP id z25-20020a7bc7d9000000b004129ed40290mr1315637wmk.25.1709294869114;
        Fri, 01 Mar 2024 04:07:49 -0800 (PST)
Message-ID: <dded6723-15fb-4f5c-85e0-70491e2876c3@citrix.com>
Date: Fri, 1 Mar 2024 12:07:46 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] tests/resource: Fix HVM guest in !SHADOW builds
Content-Language: en-GB
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
 Jan Beulich <JBeulich@suse.com>, Wei Liu <wl@xen.org>
References: <20240229205354.2574207-1-andrew.cooper3@citrix.com>
 <ZeHA2usyM2aOISxq@macbook>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <ZeHA2usyM2aOISxq@macbook>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 01/03/2024 11:49 am, Roger Pau Monné wrote:
> On Thu, Feb 29, 2024 at 08:53:54PM +0000, Andrew Cooper wrote:
>> Right now, test-resource always creates HVM Shadow guests.  But if Xen has
>> SHADOW compiled out, running the test yields:
>>
>>   $./test-resource
>>   XENMEM_acquire_resource tests
>>   Test x86 PV
>>     Created d1
>>     Test grant table
>>   Test x86 PVH
>>     Skip: 95 - Operation not supported
>>
>> and doesn't really test HVM guests, but doesn't fail either.
>>
>> There's nothing paging-mode-specific about this test, so default to HAP if
>> possible and provide a more specific message if neither HAP or Shadow are
>> available.
>>
>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> Acked-by: Roger Pau Monné <roger.pau@citrix.com>
>
> One comment below.
>
>> ---
>> CC: Jan Beulich <JBeulich@suse.com>
>> CC: Roger Pau Monné <roger.pau@citrix.com>
>> CC: Wei Liu <wl@xen.org>
>> ---
>>  tools/tests/resource/test-resource.c | 25 +++++++++++++++++++++++++
>>  1 file changed, 25 insertions(+)
>>
>> diff --git a/tools/tests/resource/test-resource.c b/tools/tests/resource/test-resource.c
>> index 7ae88ea34807..2796053588d3 100644
>> --- a/tools/tests/resource/test-resource.c
>> +++ b/tools/tests/resource/test-resource.c
>> @@ -20,6 +20,8 @@ static xc_interface *xch;
>>  static xenforeignmemory_handle *fh;
>>  static xengnttab_handle *gh;
>>  
>> +static xc_physinfo_t physinfo;
>> +
>>  static void test_gnttab(uint32_t domid, unsigned int nr_frames,
>>                          unsigned long gfn)
>>  {
>> @@ -172,6 +174,23 @@ static void test_domain_configurations(void)
>>  
>>          printf("Test %s\n", t->name);
>>  
>> +#if defined(__x86_64__) || defined(__i386__)
>> +        /*
>> +         * On x86, use HAP guests if possible, but skip if neither HAP nor
>> +         * SHADOW is available.
>> +         */
>> +        if ( t->create.flags & XEN_DOMCTL_CDF_hvm )
>> +        {
>> +            if ( physinfo.capabilities & XEN_SYSCTL_PHYSCAP_hap )
>> +                t->create.flags |= XEN_DOMCTL_CDF_hap;
>> +            else if ( !(physinfo.capabilities & XEN_SYSCTL_PHYSCAP_shadow) )
>> +            {
>> +                printf("  Skip: Neither HAP or SHADOW available\n");
>> +                continue;
>> +            }
>> +        }
> Provided that you are already checking, might also be worth to keep in
> mind that at some point we might want to also check for
> XEN_SYSCTL_PHYSCAP_{hvm,pv} and skip those tests if the requested domain
> type is not available.

Fair point.  Lemme do a v2.

~Andrew

