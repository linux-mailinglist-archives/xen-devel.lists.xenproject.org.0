Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KFC/E69mDGo9hAUAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 19 May 2026 15:33:35 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B58BC57FBF8
	for <lists+xen-devel@lfdr.de>; Tue, 19 May 2026 15:33:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1313012.1583170 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wPKZS-0006gP-0S; Tue, 19 May 2026 13:33:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1313012.1583170; Tue, 19 May 2026 13:33:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wPKZR-0006eJ-TM; Tue, 19 May 2026 13:33:17 +0000
Received: by outflank-mailman (input) for mailman id 1313012;
 Tue, 19 May 2026 13:33:17 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wPKZR-0006dy-08
 for xen-devel@lists.xenproject.org; Tue, 19 May 2026 13:33:17 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wPKZQ-006zNh-8b
 for xen-devel@lists.xenproject.org; Tue, 19 May 2026 15:33:16 +0200
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a0c6694-2eae-0a2a0a5409dd-0a2a4506865a-18
 for <xen-devel@lists.xenproject.org>; Tue, 19 May 2026 15:33:16 +0200
Received: from [209.85.218.50] (helo=mail-ej1-f50.google.com)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a0c669c-7371-0a2a45060019-d155da32c973-3
 for <xen-devel@lists.xenproject.org>; Tue, 19 May 2026 15:33:16 +0200
Received: by mail-ej1-f50.google.com with SMTP id
 a640c23a62f3a-bccd251d622so610272566b.3
 for <xen-devel@lists.xenproject.org>; Tue, 19 May 2026 06:33:16 -0700 (PDT)
Received: from [192.168.1.6] (user-109-243-69-121.play-internet.pl.
 [109.243.69.121]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-bd4f4e604e6sm698951166b.52.2026.05.19.06.33.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 19 May 2026 06:33:15 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=20251104 header.d=gmail.com header.i="@gmail.com" header.h="Content-Transfer-Encoding:In-Reply-To:From:Content-Language:References:Cc:To:Subject:User-Agent:MIME-Version:Date:Message-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779197596; x=1779802396; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=wD6jX6leT/+DMbGpqeYfChYVqoUr613qF9ySP36PMns=;
        b=N24Hfwe8b6hNjAfT4qKMTk5ASKyATGujQCkcGqYurwdlvcr2AbnSSjLAVP0WYMxLpF
         UvjYrbKgcgBwgXw/qwkehZ8groJxMftwobKpHdGJ/s2YMUocFcsr6aLSKOR3OzPZihvJ
         ixmLM/iQ2XSOLbAETgYcGFaqJ0kElDWVhSydEYe2+H32GKdtICD/cfjKmE4Pj2HTzH6E
         dBJElJSZXxNNa5B9bd3+fWSCVIMxWDzSpxdKQPI3HYsjIuqpTBTvYIlCZsqPxFoJxDM+
         flk5l1BBHm18uhSQvF+u4piUy0dheKDjw+ivUY32UpQdEamjiTfm+nWgvYMlrnwItxK5
         62Hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779197596; x=1779802396;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wD6jX6leT/+DMbGpqeYfChYVqoUr613qF9ySP36PMns=;
        b=of5+tIqavMN7H6G+yH7bBfL4BtPIbGpdVbzHms9JMKZTTpiftwWOvOFZ38jbMsMBaO
         uM2AGtBHujAWjZdGCr1Zf6AmjwsdEkGH78DG0ggMxIZ8VyzeyX+uNf8BSWmmx9IG3kN5
         JWHvzbS9C+7I+dx/EyBXXTMxEkT2mpMvGGYhWMrrJjnnk9o3Sr5aj8pBitEWLlPy4sfo
         9ah/bjtRJKJYrOmMBBAtJDuD00MbOVR9+p3g9LU7AuE1sJZZHxq1hssyCPCV9Loc/bSZ
         JT6iD5AUwgXqJrXVu0GADF5MVm22zVqMjVjV0K4+y1WmsXJZs2KAuA9pOhX/pupOtkL0
         ICDw==
X-Forwarded-Encrypted: i=1; AFNElJ/x1vEn1tmo5H1tzeb86gJZxF0IcVyfeOLR8mziiAWgg2EnwbsyNSRmqJw1PC6brhPhBG8fvvWqQ2E=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwWu07xBHu4AGDpi6iEeH53QEv452fWYfLRien8dr5JSsjLsmLr
	U+FlYPRz+woKSJVi9dZKtBgZ5//je91ZJhOgV6q0mmAk1Ba1LX6tw9Di4Spq0A==
X-Gm-Gg: Acq92OF5JzlTQGnEVM/W/jq6IZzrOR5oZNg9tjCyMNZ83vUfgUI5YvafcA4ooEtsyLt
	UgPHjuAVv4uvmDqhq+QakwLsHGTAFjbGRiwSvXycyu5zxqR8RjVI/IJOv3IN5EvgNl8+VpKyuP0
	TXJ+uEmx0mE9Oi0QgIdcEKlFO2u2wOCTkYptgkrsxayMlNG4N1eYSoIEZDK6TD3YxvkaZhKQ7JS
	Smv/I0d8mrvg1kMN2Je58PgF7DmRRk9ilWD9fL2C3YlpH+Vw4zMAcmJeP/wGa38o0gAokhcmxRA
	LuHkEFES7XCbHT4XE87MPIqQnCuD/GQiJD/zn5jBQVzqmixN0pV6OlSTdW6WgDKCgi7XcDasLcf
	s6rEMimJbyNBWnY633uGFErJOE5OtNZs8toPwOZHxaH+1Z1FwikT1zrkR5I6fwdkSue7XPLKofi
	cLUHY0/GKI2AO+tSMTs2ZDHVwz/7q2mmkN0LSfzs38fYR/nYASAPE44BITb6ISUYtlsy6kTN+lM
	n4pM8WjRYS/6w==
X-Received: by 2002:a17:906:418f:10b0:bda:24df:231 with SMTP id a640c23a62f3a-bda24df084dmr19413666b.9.1779197595349;
        Tue, 19 May 2026 06:33:15 -0700 (PDT)
Message-ID: <acef31a4-de38-4883-a6e5-7c03106147a3@gmail.com>
Date: Tue, 19 May 2026 15:33:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 06/26] xen/riscv: implement make_cpus_node()
To: Jan Beulich <jbeulich@suse.com>
Cc: Romain Caritey <Romain.Caritey@microchip.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1778250616.git.oleksii.kurochko@gmail.com>
 <69d2dd26b7c2d00c9d28f898f041f6d1be145e0d.1778250616.git.oleksii.kurochko@gmail.com>
 <3c0e5b33-d3bb-41ea-ba13-43add1d64617@suse.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <3c0e5b33-d3bb-41ea-ba13-43add1d64617@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-16d1c6/1779197596-87B7DD75-082C7119/10/73395122804
X-purgate-type: spam
X-purgate-size: 4168
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jbeulich@suse.com,m:Romain.Caritey@microchip.com,m:alistair.francis@wdc.com,m:connojdavis@gmail.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[mailman];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[microchip.com,wdc.com,gmail.com,citrix.com,vates.tech,amd.com,xen.org,kernel.org,lists.xenproject.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: B58BC57FBF8
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 5/18/26 6:00 PM, Jan Beulich wrote:
> On 08.05.2026 16:43, Oleksii Kurochko wrote:
>> @@ -50,3 +52,107 @@ int __init construct_domain(struct domain *d, struct kernel_info *kinfo)
>>   
>>       return 0;
>>   }
>> +int __init make_cpus_node(const struct domain *d, struct kernel_info *kinfo)
> 
> Nit: Blank line above here, please.
> 
>> +{
>> +    int res;
>> +    const struct dt_device_node *cpus = dt_find_node_by_path("/cpus");
>> +    unsigned int cpu;
>> +    uint32_t timebase_frequency;
>> +    bool frequency_valid;
>> +    void *fdt = kinfo->fdt;
>> +
>> +    dt_dprintk("Create cpus node\n");
>> +
>> +    if ( !cpus )
>> +    {
>> +        dprintk(XENLOG_ERR, "Missing /cpus node in the device tree?\n");
>> +        return -ENOENT;
>> +    }
>> +
>> +    frequency_valid = dt_property_read_u32(cpus, "timebase-frequency",
>> +                                           &timebase_frequency);
>> +
>> +    res = fdt_begin_node(fdt, "cpus");
>> +    if ( res )
>> +        return res;
>> +
>> +    res = fdt_property_cell(fdt, "#address-cells", 1);
>> +    if ( res )
>> +        return res;
>> +
>> +    res = fdt_property_cell(fdt, "#size-cells", 0);
>> +    if ( res )
>> +        return res;
>> +
>> +    if ( frequency_valid )
>> +        res = fdt_property_cell(fdt, "timebase-frequency", timebase_frequency);
>> +
>> +    for ( cpu = 0; cpu < d->max_vcpus; cpu++ )
> 
> Limit cpu's scope to this loop?

I will remove 'unsigned int cpu' from the function-level declarations 
and moved it into the for loop.

> 
>> +    {
>> +        char buf[64];
>> +        uint32_t reg = cpu_to_fdt32(cpu);
> 
> Isn't this a byte-order adjustment? If so, how come ...
> 
>> +        snprintf(buf, sizeof(buf), "cpu@%u", cpu);
> 
> ... the result is passed to an entirely non-FDT function? (Most pre-existing uses
> of the function that I can spot store something in memory, i.e. adjusting byte-
> order makes sense there.)

But here pure cpu is used instead of reg variable and reg variable is 
used here ...

> 
>> +        res = fdt_begin_node(fdt, buf);
>> +        if ( res )
>> +            return res;
>> +
>> +        res = fdt_property(fdt, "reg", &reg, sizeof(reg));
>> +        if ( res )
>> +            return res;
... but it we could drop it and use just:
   res = fdt_property_cell(fdt, "reg", cpu);

fdt_property_cell will take care if a byte-order adjustment.

>> +
>> +        res = fdt_property_string(fdt, "status", "okay");
>> +        if ( res )
>> +            return res;
>> +
>> +        res = fdt_property_string(fdt, "compatible", "riscv");
>> +        if ( res )
>> +            return res;
>> +
>> +        BUILD_BUG_ON((sizeof("riscv,") +
>> +                      sizeof_field(struct gstage_mode_desc, name)) >= sizeof(buf));
>> +        snprintf(buf, sizeof(buf), "riscv,%s", max_gstage_mode->name);
>> +        res = fdt_property_string(fdt, "mmu-type", buf);
>> +        if ( res )
>> +            return res;
>> +
>> +        res = fdt_property_string(fdt, "riscv,isa", d->arch.guest_isa_str);
>> +        if ( res )
>> +            return res;
>> +
>> +        res = fdt_property_string(fdt, "device_type", "cpu");
>> +        if ( res )
>> +            return res;
>> +
>> +        res = fdt_begin_node(fdt, "interrupt-controller");
>> +        if ( res )
>> +            return res;
>> +
>> +        res = fdt_property_string(fdt, "compatible", "riscv,cpu-intc");
>> +        if ( res )
>> +            return res;
>> +
>> +        res = fdt_property_cell(fdt, "#interrupt-cells", 1);
>> +        if ( res )
>> +            return res;
>> +
>> +        res = fdt_property(fdt, "interrupt-controller", NULL, 0);
>> +        if ( res )
>> +            return res;
>> +
>> +        res = fdt_property_u32(fdt, "phandle", alloc_phandle(kinfo));
>> +        if ( res )
>> +            return res;
>> +
>> +        /* end of interrupt-controller */
> 
> Nit: Comment style. Also such a comment pretty clearly calls for a counterpart
> at the start.

Sure, I will add one.

Thanks.

~ Oleksii

