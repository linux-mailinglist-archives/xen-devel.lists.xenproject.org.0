Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 0/kBIRYXUWr7/AIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 10 Jul 2026 18:00:22 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D8F7773C6D7
	for <lists+xen-devel@lfdr.de>; Fri, 10 Jul 2026 18:00:21 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=BBHjvSxk;
	dmarc=pass (policy=none) header.from=gmail.com;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.1359595.1613096 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wiDe7-0001QR-2c; Fri, 10 Jul 2026 16:00:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1359595.1613096; Fri, 10 Jul 2026 16:00:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wiDe6-0001Nj-VQ; Fri, 10 Jul 2026 16:00:10 +0000
Received: by outflank-mailman (input) for mailman id 1359595;
 Fri, 10 Jul 2026 16:00:09 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wiDe5-0001Nd-B3
 for xen-devel@lists.xenproject.org; Fri, 10 Jul 2026 16:00:09 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wiDe3-0019Qt-LX
 for xen-devel@lists.xenproject.org; Fri, 10 Jul 2026 18:00:07 +0200
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a5116fa-e002-0a2a0a5209dd-0a2a4509bfe6-28
 for <xen-devel@lists.xenproject.org>; Fri, 10 Jul 2026 18:00:07 +0200
Received: from [209.85.208.48] (helo=mail-ed1-f48.google.com)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.2)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a511707-b440-0a2a45090019-d155d030b15c-3
 for <xen-devel@lists.xenproject.org>; Fri, 10 Jul 2026 18:00:07 +0200
Received: by mail-ed1-f48.google.com with SMTP id
 4fb4d7f45d1cf-6986287534eso2050370a12.3
 for <xen-devel@lists.xenproject.org>; Fri, 10 Jul 2026 09:00:07 -0700 (PDT)
Received: from [192.168.1.6] (user-109-243-144-234.play-internet.pl.
 [109.243.144.234]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-69bfd7a20e5sm2930271a12.20.2026.07.10.09.00.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 10 Jul 2026 09:00:06 -0700 (PDT)
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
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783699207; x=1784304007; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=O4ErMFOyLaDsc4TF2Gu+orwNd27puCm7vAERNtExwrg=;
        b=BBHjvSxkofku5zStXDZmLO74JbrQq9nplydPUolRGgKVn3Pi8e/5DrUPc69bfOh2Pe
         5Z65YOswk9TxuXg5330cy1Rh5WFQg02eOeYeTDfxDyxkZAOnljKfDRAI6b8AVLFKqSu8
         +A8+XDSgqQkakG8RPMVc1Iv9TwNRQOs1n0Of+64IQrksHVWC/ba39koHdXtSoCmaHIhL
         SyZCgyIWA3n3XycQLdgcx7hWSBnpPkZEbc3EjmiYKHt4McrBbbwntqm68+K/eCJ78FgX
         7Gaw2U+S/Y58oQFkpmlfdwkWNeX0zI/fuyPhRnTWeEERSXhx7K/LhIutdz+iyPy2AQ0H
         9BiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783699207; x=1784304007;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=O4ErMFOyLaDsc4TF2Gu+orwNd27puCm7vAERNtExwrg=;
        b=cG7s7EhTS3AzVSxuODbJqkm6djNuKQ+JvW/07EdgUHR+llWYBmnv1xMNjoRVSXCcL3
         ybhYdrMxBKfuTpXacMXT3Pl8iYI7IaKCsfnt1ur9FatzjSswfiMkaWWfCRYeNGtg8vlK
         3WRYEgKTREwWJJbjsv3EyY8NrgM8OfKjQm1rBdTDSuiJDbT3YEflg8x1jzqkhEAjJIlJ
         ezJSoYeM5sxcEn9ee97dS3JmPHqeaqtET9PulXxa1n84XhREo0/bvyQmych6DfccfEBZ
         UejFONmSSNHI4KyyI+X8zLMOLhQdYnozMVrzOOnob9N++CBjgXkxS8h66qruQRBE6SGJ
         Tckw==
X-Forwarded-Encrypted: i=1; AHgh+RoGwq+fWGbROlmXF1W4/m830Fo8Jv9/Pc9CIa0MdevlNp1nJQqff4y+P9FJChqApDEESPxaRnW8hHc=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyUIjuMCLN3P/h2ERso+2klOJsL3t+3wfCYfYolVRzJKdXVfpi0
	y0z79pTUOgOxukOwjZtofkXgqZs9vcCrogwFtgskIuBUGGuEkH8/oVxR
X-Gm-Gg: AfdE7cnLIVJ4FgcxFx9CwU7xFokrw6Kd8s3RFTmY3kn6BhTIxBs2rOqbEH0loexQDp4
	q/SSPJTM1BZvhb3Mzruspfdj4bmma0WFIUCAvpOSKae4IN7u9k3rzELGtuzfE8Au4VZ6Bp6d2f3
	yWywRA4CKpUbvT2BZ/x82PGZrlX3DzlLncaLYZyboc0TvcWuGdfolrMyQSnnaHoA6cuLOOpbM6x
	wls0Rjj12JJTol0V5HQUAjNd1EffvE8VXIt8VVCpGmmbvEJNkF2GDq+09/nooP6XmC3XDo7xRCd
	v/qiFrK7dFdo7wHVJbGF+4dX4xjWMyNwfpBDy+O4vw6S7Yd4N1abWJemSb59fiAr7I78UDEEeKo
	Bi6i0V+/31+5V/VcmeOYPUs+BUesWOAUEhRnTmAEkN1s80YUxp1uJCMk/qnH7WE3Bxl/WHJvPjk
	I7B6NtEBr9GJUDDz9yrfOEvbNS3p0yu5QTZpZKx66qCn3qZsAbbCIdBUYNRtgvX+Log7E=
X-Received: by 2002:a17:907:6d06:b0:c16:12b6:243e with SMTP id a640c23a62f3a-c1612b63a39mr59773266b.44.1783699207002;
        Fri, 10 Jul 2026 09:00:07 -0700 (PDT)
Message-ID: <2eb30962-4357-4113-8589-14da7637ebb6@gmail.com>
Date: Fri, 10 Jul 2026 18:00:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 10/26] xen/riscv: implement make_cpus_node()
To: Jan Beulich <jbeulich@suse.com>
Cc: Romain Caritey <Romain.Caritey@microchip.com>,
 Baptiste Le Duc <baptiste.le-duc@vates.tech>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>, xen-devel@lists.xenproject.org
References: <cover.1783331040.git.oleksii.kurochko@gmail.com>
 <d8e17abcf195ca97056c8ed078ad968f68fa4ca9.1783331040.git.oleksii.kurochko@gmail.com>
 <0c65cc0a-76c6-4ca3-8d39-7f6d82b7f54b@suse.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <0c65cc0a-76c6-4ca3-8d39-7f6d82b7f54b@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-bad1c0/1783699207-55573A0B-B6F49EFB/10/73395122804
X-purgate-type: spam
X-purgate-size: 2671
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:from_smtp,lists.xenproject.org:helo,lists.xenproject.org:rdns,suse.com:email];
	FREEMAIL_CC(0.00)[microchip.com,vates.tech,citrix.com,amd.com,xen.org,kernel.org,wdc.com,gmail.com,lists.xenproject.org];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jbeulich@suse.com,m:Romain.Caritey@microchip.com,m:baptiste.le-duc@vates.tech,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:alistair.francis@wdc.com,m:connojdavis@gmail.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FORWARDED(0.00)[mailman];
	FREEMAIL_FROM(0.00)[gmail.com];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: D8F7773C6D7



On 7/9/26 3:20 PM, Jan Beulich wrote:
> On 06.07.2026 17:57, Oleksii Kurochko wrote:
>> Implement make_cpus_node() to create cpus node for a guest domain.
>>
>> This function is going to be use by common dom0less code during
>> construction domain.
>>
>> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
>> ---
>> Changes in v5:
>> - Drop Acked-by: Jan Beulich <jbeulich@suse.com> as extra changes were done
>>    because of the changed in prev. patch.
>> - Move isa_str allocation and construction out of arch_domain_create() and
>>    into make_cpus_node() as a local variable, since the string is only
>>    needed during FDT generation. Use a two-call build_guest_isa_str()
>>    pattern (size probe, then fill) with xvmalloc_array, and convert all
>>    post-allocation error returns to goto out so xvfree() runs on every path.
>> ---
>> Changes in v4:
>>   - Update the comment in make_cpus_node() to match code style.
>>   - Add Acked-by: Jan Beulich <jbeulich@suse.com>.
>> ---
>> Changes in v3:
>>   - Add blank line above make_cpus_node() function definition.
>>   - Move 'unsigned int cpu' from function-level declarations into the for loop.
>>   - Drop 'uint32_t reg = cpu_to_fdt32(cpu)'; use fdt_property_cell(fdt, "reg", cpu)
>>     instead of fdt_property(fdt, "reg", &reg, sizeof(reg)) so byte-order adjustment
>>     is handled internally.
>>   - Add matching /* interrupt-controller */ start comment; fix end comment to
>>     /* end interrupt-controller */.
>>   - Update d->arch.guest_isa_str to ->isa_str in make_cpus_node() function.
>> ---
>> Changes in v2:
>>   - s/u32/uint32_t for timebase_frequency local variable.
>>   - Drop +1 from BUILD_BUG_ON().
>>   - return fdt_end_node(fdt); instead of res at the end of the function.
>> ---
>> ---
>>   build/tools/fixdep            | Bin 0 -> 13632 bytes
> 
> There was a stray file in the v4 series iirc. Now there again is a stray file
> in v5. Can you please make sure to take a look yourself before posting a
> series? 

Sorry about that, I will double-check next time.

> Are you doing out-of-tree hypervisor builds, but with a build directory
> within the source repo? There is an entry in .gitignore after all, just for
> xen/tools/fixdep.

No, it should in-tree:
CONTAINER=bookworm-riscv64 ./automation/scripts/containerize make V=1 
XEN_TARGET_ARCH=riscv64 -C xen

Sometime I am doing without CONTAINER when I want to check on my system 
with newer compile version but still I don't use O=, just make ... -C xen.

> 
> With this properly dropped:
> Acked-by: Jan Beulich <jbeulich@suse.com>

Thanks.

~ Oleksii

