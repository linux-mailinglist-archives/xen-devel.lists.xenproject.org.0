Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FF80616049
	for <lists+xen-devel@lfdr.de>; Wed,  2 Nov 2022 10:57:52 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.435745.689471 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oqAUk-0000Xh-04; Wed, 02 Nov 2022 09:57:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 435745.689471; Wed, 02 Nov 2022 09:57:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oqAUj-0000VU-TD; Wed, 02 Nov 2022 09:57:13 +0000
Received: by outflank-mailman (input) for mailman id 435745;
 Wed, 02 Nov 2022 09:57:12 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=O0pi=3C=gmail.com=burzalodowa@srs-se1.protection.inumbo.net>)
 id 1oqAUi-0000VO-JT
 for xen-devel@lists.xenproject.org; Wed, 02 Nov 2022 09:57:12 +0000
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [2a00:1450:4864:20::436])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b874ba0a-5a94-11ed-91b5-6bf2151ebd3b;
 Wed, 02 Nov 2022 10:57:11 +0100 (CET)
Received: by mail-wr1-x436.google.com with SMTP id w14so23683518wru.8
 for <xen-devel@lists.xenproject.org>; Wed, 02 Nov 2022 02:57:11 -0700 (PDT)
Received: from [192.168.1.93] (adsl-187.176.58.195.tellas.gr. [176.58.195.187])
 by smtp.gmail.com with ESMTPSA id
 bo29-20020a056000069d00b0022eafed36ebsm12674656wrb.73.2022.11.02.02.57.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 02 Nov 2022 02:57:10 -0700 (PDT)
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
X-Inumbo-ID: b874ba0a-5a94-11ed-91b5-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=l1Zr+ROJX+1LLm7/1PyIDgn0rklVbwIyI46qsgY4fKU=;
        b=EKL85XA8/iTlANoM+1T3xhat12Y3iXtWkifbCLcorCri0Def8cBnnmuCsK+huKu+e0
         /+nvOlSw9DreC5ZbdDmyO1HU15xCwHgow1hVxGvcj2s4O83QAk6vNYqg7+WkrYteLmmk
         AHnwLAF3Go7LDqQE3T8DyNHVUW/qIkqVYBmLKGK3Pvi1jAt89HPpBkUH6iVFKjF4TMvB
         95IPF9Hw3+okMlB8vJUFmwcqdxUMJSDp5BGbNVtBoZYGBDYtTD6vppZuYyLZwmbk69TU
         oELSHZ6QJxr2qiaXQJzhO0bXUlwd3oui4HF0PZPmU/UcHbJYpkCmjhCghDzRAlzR3FLK
         f+JQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=l1Zr+ROJX+1LLm7/1PyIDgn0rklVbwIyI46qsgY4fKU=;
        b=cW+BHLaLoc9qDoOybmJSh6Pyqng2hOY77Z6UerMn4V/Lc2437lMpkQwi0eLklT6tO8
         1L5dY7iXVyaJaSHZKlCDwqoz+wxDwtXr0mQuDRxQNOgMBlW97uXeqy8rPV7d4gZ9O1WK
         1OMtSJMTc0tS82ycAyli9KLEqQOx5skfv6dIRXYDAQ62elgnfPUHDPuHL2GVePgMAthL
         5PKAMEqlJ6s1SdQTTm17Kg4373VZOQXV9BzljR9OcWgL4j3zRdi8FZ8Fb134XPDuC/Dy
         DCmtJJVuC8nbBIzZakaZXssqJoUyL4yIwJqLaKe3wTkFBiQKl9Mf0O+hUjLhjIXauXZg
         PjsQ==
X-Gm-Message-State: ACrzQf3cWIwN4O7FJOHDsGitr427/WEt4nAxmu74W6qcoB80qfoxCn+o
	Gt38FWzeIHJ/7pXjjKLbd2o=
X-Google-Smtp-Source: AMsMyM427MALCkkF89RY3Paa7OoszKLR0VttOK9XneONavmf/Q/FNhOHs2ZtBaDiw4O1jp18wOV4ng==
X-Received: by 2002:adf:e992:0:b0:236:70ad:3bd9 with SMTP id h18-20020adfe992000000b0023670ad3bd9mr14479169wrm.136.1667383031042;
        Wed, 02 Nov 2022 02:57:11 -0700 (PDT)
Message-ID: <8e36fec2-6df5-835c-f75a-f530c1a678e3@gmail.com>
Date: Wed, 2 Nov 2022 11:57:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [XEN v2 02/12] xen/Arm: GICv3: Move the macros to compute the
 affnity level to arm64/arm32
Content-Language: en-US
To: Julien Grall <julien@xen.org>, Ayan Kumar Halder <ayankuma@amd.com>,
 xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org, stefanos@xilinx.com, Volodymyr_Babchuk@epam.com,
 bertrand.marquis@arm.com
References: <20221031151326.22634-1-ayankuma@amd.com>
 <20221031151326.22634-3-ayankuma@amd.com>
 <d791158a-4f1b-9d6a-6bd4-8792da2217b2@xen.org>
From: Xenia Ragiadakou <burzalodowa@gmail.com>
In-Reply-To: <d791158a-4f1b-9d6a-6bd4-8792da2217b2@xen.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On 11/2/22 10:46, Julien Grall wrote:
> Hi,
> 
> Title: The macros you are moving are not GICv3 specific.
> 
> On 31/10/2022 15:13, Ayan Kumar Halder wrote:
>> Refer https://elixir.bootlin.com/linux/v6.1-rc1/source/arch/arm64/ \
>> include/asm/cputype.h#L14 , for the macros specific for arm64.
>>
>> Refer 
>> https://elixir.bootlin.com/linux/v6.1-rc1/source/arch/arm/include/ \
>> asm/cputype.h#L54  , for the macros specific for arm32.
>>
>> MPIDR_LEVEL_SHIFT() differs between 64 and 32 bit. > For 64 bit :-
>>
>>   aff_lev3          aff_lev2 aff_lev1 aff_lev0
>> |________|________|________|________|________|
>> 40       32       24       16       8        0
>>
>> For 32 bit :-
>>
>>   aff_lev3 aff_lev2 aff_lev1 aff_lev0
>> |________|________|________|________|
>> 32       24       16       8        0
> 
> As discussed with Michal, AFF3 doesn't exist for 32-bit. So it is not 
> clear to me what we are gaining by moving the macros.
> 

I cannot understand what do you mean by "what we are gaining by moving 
the macros".

IIUC, when identifying the cpu topology, a mask is applied to the value 
of MPIDR_EL1
#ifdef CONFIG_ARM_64
#define MPIDR_HWID_MASK     _AC(0xff00ffffff,UL)
#else
#define MPIDR_HWID_MASK     _AC(0xffffff,U)
#endif
So, for arm32, the affinity at level 3 is considered to be 0.

Do you mean, what we are gaining by defining the MPIDR_LEVEL_SHIFT in a 
different way for arm32 and for arm64?

IMO, we need to do so, because the shift, used to retrieve the affinity 
at each level, cannot be calculated using the same logic i.e
(((1 << (level)) >> 1) << MPIDR_LEVEL_BITS_SHIFT)

For arm32 the affinity at each level is calculated as follows
((level) << MPIDR_LEVEL_BITS_SHIFT)

Also, IMO, since MPIDR_HWID_MASK is defined in the common header, maybe 
the same needs to be done for MPIDR_LEVEL_SHIFT, to make easier for 
someone reading the code to understand the difference.

I hope I'm not out of context.

> Cheers,
> 

-- 
Xenia

