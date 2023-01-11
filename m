Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2331C665B67
	for <lists+xen-devel@lfdr.de>; Wed, 11 Jan 2023 13:31:13 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.475283.736911 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pFaFt-0001GT-QE; Wed, 11 Jan 2023 12:30:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 475283.736911; Wed, 11 Jan 2023 12:30:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pFaFt-0001EZ-NW; Wed, 11 Jan 2023 12:30:57 +0000
Received: by outflank-mailman (input) for mailman id 475283;
 Wed, 11 Jan 2023 12:30:55 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Uwfa=5I=gmail.com=burzalodowa@srs-se1.protection.inumbo.net>)
 id 1pFaFr-0001ER-ME
 for xen-devel@lists.xenproject.org; Wed, 11 Jan 2023 12:30:55 +0000
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com
 [2a00:1450:4864:20::636])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id cac2bd1c-91ab-11ed-91b6-6bf2151ebd3b;
 Wed, 11 Jan 2023 13:30:54 +0100 (CET)
Received: by mail-ej1-x636.google.com with SMTP id az20so17363314ejc.1
 for <xen-devel@lists.xenproject.org>; Wed, 11 Jan 2023 04:30:54 -0800 (PST)
Received: from [192.168.1.93] (adsl-211.37.6.0.tellas.gr. [37.6.0.211])
 by smtp.gmail.com with ESMTPSA id
 r18-20020a1709061bb200b0082000f8d871sm6178680ejg.152.2023.01.11.04.30.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 11 Jan 2023 04:30:53 -0800 (PST)
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
X-Inumbo-ID: cac2bd1c-91ab-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Yjk1YZNghOMLZI3FrMEWJU4Cn7nFZUvUvjgjLRR3p2k=;
        b=AOjelN5z2UIcIODUnVgWrlBIX9DOy+sD3o6f/jPR74RP7uzVY3+4DfdoB61jI7tYzO
         Yh9qkGKx+gMTTmociq21tB0DYouTv4A3gmAQzXrS7xELrHHOyGcMIgl6HWqAPQSETSDL
         PkiF1MlDjNt2A4rKQvARidkk8pdSLm+/VhEfTEBwlF8uGfmUTHJqURnBwQzRDHHFXnLw
         K+uHPZWH4726AL1M+vylSEVP1x/bIZ3zxXydGTzagT95fZHACiApMt623VOnGSNnspFK
         RFaY56bPgFPeiOAulfAkikKH3BdqEdcAGD5yQ0OwfUrAJB908y3AruuYVMP/PAzZWE3o
         USPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Yjk1YZNghOMLZI3FrMEWJU4Cn7nFZUvUvjgjLRR3p2k=;
        b=3vfa4hgEx7RyGeu5KhqSO7K++HP+BpeY/qrS+AEJ8VSdGf+EKUqanMZDSLfztD8daK
         cvnwqKDfcwHzxKIwwTx96lr6dCeozYbIKEEqemXIjdmljGtncSlk8mx+nQ86zpp/0GTg
         ScZ/E+zmbOUd4kvukUOzSLFpRRaBRO8wUlWJZeqZlqz9l3HXMKU5YjHWwmrdhqpLp0vX
         8//ZMGjOmdXvnU8AN8PagTSs/ExugjJHgfDTDI0Rn6JXDEcx+I8x2EEqm55h01vYPnBb
         zwtly+cGTqUb+7egxOugPDQhref9YWmQrge5Rb6npepsixaU0bhwfwCwHnXSVy/AUwqN
         AdCQ==
X-Gm-Message-State: AFqh2krGc/JL7e/QJOWjuncIuB/KwWCiBfVdo7Jt9bVBSZBfssl3Hdju
	AVDwEuzSRlrCcu8DihSsVFA=
X-Google-Smtp-Source: AMrXdXvNAsGU5q66/AH9qF3roK03cLm2BWTh8G7reASo6tOvzixzJEnl0XWV5s9mWLkvF68lyIWEPg==
X-Received: by 2002:a17:907:8d16:b0:7c4:fa17:71fe with SMTP id tc22-20020a1709078d1600b007c4fa1771femr9867416ejc.45.1673440254190;
        Wed, 11 Jan 2023 04:30:54 -0800 (PST)
Message-ID: <2acf07aa-ec56-99fc-765e-70fb7e753547@gmail.com>
Date: Wed, 11 Jan 2023 14:30:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v3 2/6] xen/riscv: introduce asm/types.h header file
Content-Language: en-US
To: Jan Beulich <jbeulich@suse.com>
Cc: Julien Grall <julien@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Gianluca Guida <gianluca@rivosinc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>, xen-devel@lists.xenproject.org,
 Oleksii <oleksii.kurochko@gmail.com>
References: <cover.1673362493.git.oleksii.kurochko@gmail.com>
 <ca2674739cfa71cae0bf084a7b471ad4518026d3.1673362493.git.oleksii.kurochko@gmail.com>
 <c333b5b0-f936-59f8-d962-79d449403e6c@suse.com>
 <06185fcfb8cbd849df4b033efa923b55c054738d.camel@gmail.com>
 <1b6ee20d-2f32-ab38-83ec-69c33baf42fd@suse.com>
 <0398c48c-cc5d-a4fb-354f-54e3c5900d18@gmail.com>
 <644334f1-8e1d-3203-e942-0eb3ef5584a9@suse.com>
From: Xenia Ragiadakou <burzalodowa@gmail.com>
In-Reply-To: <644334f1-8e1d-3203-e942-0eb3ef5584a9@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On 1/11/23 13:38, Jan Beulich wrote:
> On 11.01.2023 11:22, Xenia Ragiadakou wrote:
>>
>> On 1/11/23 11:08, Jan Beulich wrote:
>>> On 11.01.2023 09:47, Oleksii wrote:
>>>> On Tue, 2023-01-10 at 17:58 +0100, Jan Beulich wrote:
>>>>> On 10.01.2023 16:17, Oleksii Kurochko wrote:
>>>>>> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
>>>>>> ---
>>>>>> Changes in V3:
>>>>>>       - Nothing changed
>>>>>> ---
>>>>>> Changes in V2:
>>>>>>       - Remove unneeded now types from <asm/types.h>
>>>>>
>>>>> I guess you went a little too far: Types used in common code, even if
>>>>> you
>>>> It looks then I didn't understand which one of types are needed.
>>>>
>>>> In "[PATCH v1 2/8] xen/riscv: introduce asm/types.h header file" all
>>>> types were introduced as most of them are used in <xen/types.h>:
>>>> __{u|s}{8|16|32|64}. Thereby it looks like the following types in
>>>> <asm/types.h> should be present from the start:
>>>>     typedef __signed__ char __s8;
>>>>     typedef unsigned char __u8;
>>>>
>>>>     typedef __signed__ short __s16;
>>>>     typedef unsigned short __u16;
>>>>
>>>>     typedef __signed__ int __s32;
>>>>     typedef unsigned int __u32;
>>>>
>>>>     #if defined(__GNUC__) && !defined(__STRICT_ANSI__)
>>>>     #if defined(CONFIG_RISCV_32)
>>>>       typedef __signed__ long long __s64;
>>>>       typedef unsigned long long __u64;
>>>>     #elif defined (CONFIG_RISCV_64)
>>>>       typedef __signed__ long __s64;
>>>>       typedef unsigned long __u64;
>>>>     #endif
>>>>     #endif
>>>>
>>>>    Then it turns out that there is no any sense in:
>>>>     typedef signed char s8;
>>>>     typedef unsigned char u8;
>>>>
>>>>     typedef signed short s16;
>>>>     typedef unsigned short u16;
>>>>
>>>>     typedef signed int s32;
>>>>     typedef unsigned int u32;
>>>>
>>>>     typedef signed long long s64;
>>>>     typedef unsigned long long u64;
>>>>       OR
>>>>     typedef signed long s64;
>>>>     typedef unsigned long u64;
>>>> As I understand instead of them should be used: {u|s}int<N>_t.
>>>
>>> Hmm, the situation is worse than I thought (recalled) it was: You're
>>> right, xen/types.h actually uses __{u,s}<N>. So I'm sorry for mis-
>>> guiding you; we'll need to do more cleanup first for asm/types.h to
>>> become smaller.
>>
>> What is the reason for not declaring __{u,s}<N> directly in xen/types.h
>> as type alias to {u,s}<N>?
>>
>> IIUC __{u,s}<N> and {u,s}<N> are needed by code ported from Linux while
>> Xen code should use {u|s}int<N>_t instead, right?
> 
> Yes. Hence in the long run only Linux files should get to see __{u,s}<N>
> and {u,s}<N>, perhaps from a new linux-types.h.

Thanks for the clarification. Could you please help me understand also 
why __signed__ keyword is required when declaring __{u,s}<N>?
I mean why __{u,s}<N> cannot be declared using the signed type 
specifier, just like {u,s}<N>?

-- 
Xenia

