Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5236F6658EA
	for <lists+xen-devel@lfdr.de>; Wed, 11 Jan 2023 11:22:51 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.475192.736770 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pFYFR-0006qj-45; Wed, 11 Jan 2023 10:22:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 475192.736770; Wed, 11 Jan 2023 10:22:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pFYFR-0006nI-0X; Wed, 11 Jan 2023 10:22:21 +0000
Received: by outflank-mailman (input) for mailman id 475192;
 Wed, 11 Jan 2023 10:22:19 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Uwfa=5I=gmail.com=burzalodowa@srs-se1.protection.inumbo.net>)
 id 1pFYFO-0006nC-Tg
 for xen-devel@lists.xenproject.org; Wed, 11 Jan 2023 10:22:19 +0000
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com
 [2a00:1450:4864:20::62c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d1120586-9199-11ed-b8d0-410ff93cb8f0;
 Wed, 11 Jan 2023 11:22:14 +0100 (CET)
Received: by mail-ej1-x62c.google.com with SMTP id az20so16561123ejc.1
 for <xen-devel@lists.xenproject.org>; Wed, 11 Jan 2023 02:22:16 -0800 (PST)
Received: from [192.168.1.93] (adsl-211.37.6.0.tellas.gr. [37.6.0.211])
 by smtp.gmail.com with ESMTPSA id
 kx1-20020a170907774100b0084d368b1628sm4908156ejc.40.2023.01.11.02.22.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 11 Jan 2023 02:22:15 -0800 (PST)
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
X-Inumbo-ID: d1120586-9199-11ed-b8d0-410ff93cb8f0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=6tJ7kpzrhyHUzMy1RjtfFRjdNaVMpk5nM2TuZL5gE8g=;
        b=KufNy0VSaoPfgDDeR+SD9quaYDs9EZYi/89cMJk+QbGxz9EaN2xbZemRNgLQalRfp0
         CtE5ZhcTlstIlwml8qq22uNe6E5F3cm8RD0mEeb97pszLenvnsFTLSlsJjIHgzSeAPW/
         fEoRIv7jd3dZxEPJFSYvrIIFG1R8spkfCAPc+btJST1OBTZbFeqgeNLgV/ECTXZCbLgd
         ePvtC1Wov2zAQXZrMTzA7jrr5nQOsgC5N50rMqNFXSiJD0/h69RsLJO9dk5WDV9vGdA3
         cnCyXVIZqTGRMrPQ7w2t8gbSnYMqRYLrxstjbNiMB6tN7O89dm/WxBOlmKITDshTvs0C
         0Kmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6tJ7kpzrhyHUzMy1RjtfFRjdNaVMpk5nM2TuZL5gE8g=;
        b=xrG8KXF964YsoO/b6OJRA4CVjnYxHO6endV0GnLnTjiip/1RRUhzzFK3e6aJvbbV9H
         k4cVfD9H46DQYWzr7OzxUTL1rMFC+h7f3d1H89hVfZ8JyLMx0nA7PuyHcsS92VdI3mnf
         FMhupGtesUEGfFvb0s4YJpeL7SD4E5tQWZuIgG5Fgw6zt9D8OXdWXEVgH5uR9yMNmuVn
         QwF87cxlbtN3WLAoThwOlZqfQSc9vuzNKruh7bDwa0TDqoiHjjAVvfjkrDRbe3TU2Opo
         y+bbGWsTZrW12qVAcnqXzlSerWkPix7vmJTV447AnKZlKQvV9z5IqjRLg+5GsGFgnewy
         YiKw==
X-Gm-Message-State: AFqh2krCWLWDSZwy6bDiVZpFDJszp0Y4pKz/B+gMP+OhEKVNFL50j4wo
	x5gbHv3/KMpjZGN7QQpSa5A=
X-Google-Smtp-Source: AMrXdXsRxv3g1e/h/BybE80Hrt7Q0YSmsDLpGYzAvSabVG+lJTSGohlyCqExnCpAITtHrgwgpusLZg==
X-Received: by 2002:a17:906:380e:b0:7c0:be5d:59a9 with SMTP id v14-20020a170906380e00b007c0be5d59a9mr64490219ejc.20.1673432536107;
        Wed, 11 Jan 2023 02:22:16 -0800 (PST)
Message-ID: <0398c48c-cc5d-a4fb-354f-54e3c5900d18@gmail.com>
Date: Wed, 11 Jan 2023 12:22:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v3 2/6] xen/riscv: introduce asm/types.h header file
To: Jan Beulich <jbeulich@suse.com>, Oleksii <oleksii.kurochko@gmail.com>
Cc: Julien Grall <julien@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Gianluca Guida <gianluca@rivosinc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>, xen-devel@lists.xenproject.org
References: <cover.1673362493.git.oleksii.kurochko@gmail.com>
 <ca2674739cfa71cae0bf084a7b471ad4518026d3.1673362493.git.oleksii.kurochko@gmail.com>
 <c333b5b0-f936-59f8-d962-79d449403e6c@suse.com>
 <06185fcfb8cbd849df4b033efa923b55c054738d.camel@gmail.com>
 <1b6ee20d-2f32-ab38-83ec-69c33baf42fd@suse.com>
Content-Language: en-US
From: Xenia Ragiadakou <burzalodowa@gmail.com>
In-Reply-To: <1b6ee20d-2f32-ab38-83ec-69c33baf42fd@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On 1/11/23 11:08, Jan Beulich wrote:
> On 11.01.2023 09:47, Oleksii wrote:
>> On Tue, 2023-01-10 at 17:58 +0100, Jan Beulich wrote:
>>> On 10.01.2023 16:17, Oleksii Kurochko wrote:
>>>> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
>>>> ---
>>>> Changes in V3:
>>>>      - Nothing changed
>>>> ---
>>>> Changes in V2:
>>>>      - Remove unneeded now types from <asm/types.h>
>>>
>>> I guess you went a little too far: Types used in common code, even if
>>> you
>> It looks then I didn't understand which one of types are needed.
>>
>> In "[PATCH v1 2/8] xen/riscv: introduce asm/types.h header file" all
>> types were introduced as most of them are used in <xen/types.h>:
>> __{u|s}{8|16|32|64}. Thereby it looks like the following types in
>> <asm/types.h> should be present from the start:
>>    typedef __signed__ char __s8;
>>    typedef unsigned char __u8;
>>
>>    typedef __signed__ short __s16;
>>    typedef unsigned short __u16;
>>
>>    typedef __signed__ int __s32;
>>    typedef unsigned int __u32;
>>
>>    #if defined(__GNUC__) && !defined(__STRICT_ANSI__)
>>    #if defined(CONFIG_RISCV_32)
>>      typedef __signed__ long long __s64;
>>      typedef unsigned long long __u64;
>>    #elif defined (CONFIG_RISCV_64)
>>      typedef __signed__ long __s64;
>>      typedef unsigned long __u64;
>>    #endif
>>    #endif
>>
>>   Then it turns out that there is no any sense in:
>>    typedef signed char s8;
>>    typedef unsigned char u8;
>>
>>    typedef signed short s16;
>>    typedef unsigned short u16;
>>
>>    typedef signed int s32;
>>    typedef unsigned int u32;
>>
>>    typedef signed long long s64;
>>    typedef unsigned long long u64;
>>      OR
>>    typedef signed long s64;
>>    typedef unsigned long u64;
>> As I understand instead of them should be used: {u|s}int<N>_t.
> 
> Hmm, the situation is worse than I thought (recalled) it was: You're
> right, xen/types.h actually uses __{u,s}<N>. So I'm sorry for mis-
> guiding you; we'll need to do more cleanup first for asm/types.h to
> become smaller.

What is the reason for not declaring __{u,s}<N> directly in xen/types.h 
as type alias to {u,s}<N>?

IIUC __{u,s}<N> and {u,s}<N> are needed by code ported from Linux while 
Xen code should use {u|s}int<N>_t instead, right?

-- 
Xenia

