Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3970D569B8C
	for <lists+xen-devel@lfdr.de>; Thu,  7 Jul 2022 09:28:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.362761.592963 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o9LvB-0000Hq-8s; Thu, 07 Jul 2022 07:27:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 362761.592963; Thu, 07 Jul 2022 07:27:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o9LvB-0000FE-4S; Thu, 07 Jul 2022 07:27:33 +0000
Received: by outflank-mailman (input) for mailman id 362761;
 Thu, 07 Jul 2022 07:27:31 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=S5Xm=XM=gmail.com=burzalodowa@srs-se1.protection.inumbo.net>)
 id 1o9Lv9-0000F8-6N
 for xen-devel@lists.xenproject.org; Thu, 07 Jul 2022 07:27:31 +0000
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [2a00:1450:4864:20::434])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 41fdeb5c-fdc6-11ec-bd2d-47488cf2e6aa;
 Thu, 07 Jul 2022 09:27:29 +0200 (CEST)
Received: by mail-wr1-x434.google.com with SMTP id z12so15408524wrq.7
 for <xen-devel@lists.xenproject.org>; Thu, 07 Jul 2022 00:27:29 -0700 (PDT)
Received: from [192.168.1.10] (adsl-142.37.6.26.tellas.gr. [37.6.26.142])
 by smtp.gmail.com with ESMTPSA id
 u23-20020a7bcb17000000b0039aef592ca0sm27595843wmj.35.2022.07.07.00.27.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 07 Jul 2022 00:27:28 -0700 (PDT)
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
X-Inumbo-ID: 41fdeb5c-fdc6-11ec-bd2d-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=1ql0Om+7fOyjMeo5Zo+X8dbi9gB0ZxyDgS56Zjlj/+o=;
        b=T6qrn0Gb8Y7vWefjUQRBaKWxuxiaIzM6L3hUYGmHVMZSZUf7gd6qdunsX3UEbp5nIA
         15ipcEEzEYfl2hZUmIVITwWqA1c1EU19+qjFCR1VBMPDII7AgoLjaniNcaR/HXeXhibZ
         WKdWl5Tfa0Bp8WTmevVp79cLi1nFr4FJR66UaPvrK0A+O9LDnVoAXgtO+PqyzYZcd2wh
         bpGAa1wnbpbikwHtofiweADtBceJelbp2yMFbYK5CKf9D+LrRklosyHerNx1O5Fg5tb8
         aswFRgnRjvNIObxs/XGKV+S5FCaDU0/OOPUubZgPgfpWCzjP9NKRqsPJLpY+gLV4M4Z+
         X6Ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=1ql0Om+7fOyjMeo5Zo+X8dbi9gB0ZxyDgS56Zjlj/+o=;
        b=Efp3QfBfTL/ausdCxPv/9WzipDU41mXUoV2f2L7puYRDKb5CNSKCv5GOokCubLe+Ow
         EBg5UGPpfgcl3Qq3J87/xrTt1439ZulGOLHjqDgh4Z0T0hrL4KHOWJCoJKFecUIf8sT3
         tINyoWC0W6LRGmBIbGTqRMDZN5bLPiUaGwMdRIRNzkoarxT9qaVhcWD5aNlhKA7Psqi/
         dyVQjcOSO5EYosDgLIZ2hamm1CPmNZ8f085Pzf27kDDX2V7NH4GGQIoZf4OzsZmQzvPS
         nkCuh5NzzFJRtVWpPY0NW+BqdtjrlBvxyiD61jr0LtENCSVP0y4SDwfZuLwBhqRR8f4O
         zl7g==
X-Gm-Message-State: AJIora9F0C192FSi1x2UaUVJAG5a7DlcGKKKS80GvV0QiMqBywKHVfc1
	YJIqhmK/BxYqPLZh1AoYXdc=
X-Google-Smtp-Source: AGRyM1thA8QiMUY9ZVScGtbHAL0Sbjo9lZJWBNtPn2z7E9WvFIPulZJoNXBljMe7WDcrRK7Os/FqbA==
X-Received: by 2002:a05:6000:18ad:b0:21b:a24a:1786 with SMTP id b13-20020a05600018ad00b0021ba24a1786mr44003135wri.115.1657178849001;
        Thu, 07 Jul 2022 00:27:29 -0700 (PDT)
Message-ID: <e0a05c63-dc0a-6898-3e73-c327ff7514e2@gmail.com>
Date: Thu, 7 Jul 2022 10:27:26 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH 3/4] xen/arm: domain: Fix MISRA C 2012 Rule 8.7 violation
Content-Language: en-US
To: Jan Beulich <jbeulich@suse.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 xen-devel@lists.xenproject.org
References: <20220705210218.483854-1-burzalodowa@gmail.com>
 <20220705210218.483854-4-burzalodowa@gmail.com>
 <115c89bc-259e-8ca1-5533-49c98f637a0d@suse.com>
 <3f4c9270-56e5-f9fe-6de8-01c997ad2ddb@gmail.com>
 <910119aa-69c6-6736-49f1-3b51da1c4fb0@suse.com>
From: Xenia Ragiadakou <burzalodowa@gmail.com>
In-Reply-To: <910119aa-69c6-6736-49f1-3b51da1c4fb0@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Jan,

On 7/6/22 11:51, Jan Beulich wrote:
> On 06.07.2022 10:43, Xenia Ragiadakou wrote:
>> On 7/6/22 10:10, Jan Beulich wrote:
>>> On 05.07.2022 23:02, Xenia Ragiadakou wrote:
>>>> The function idle_loop() is referenced only in domain.c.
>>>> Change its linkage from external to internal by adding the storage-class
>>>> specifier static to its definitions.
>>>>
>>>> Since idle_loop() is referenced only in inline assembly, add the 'used'
>>>> attribute to suppress unused-function compiler warning.
>>>
>>> While I see that Julien has already acked the patch, I'd like to point
>>> out that using __used here is somewhat bogus. Imo the better approach
>>> is to properly make visible to the compiler that the symbol is used by
>>> the asm(), by adding a fake(?) input.
>>
>> I 'm afraid I do not understand what do you mean by "adding a fake(?)
>> input". Can you please elaborate a little on your suggestion?
> 
> Once the asm() in question takes the function as an input, the compiler
> will know that the function has a user (unless, of course, it finds a
> way to elide the asm() itself). The "fake(?)" was because I'm not deeply
> enough into Arm inline assembly to know whether the input could then
> also be used as an instruction operand (which imo would be preferable) -
> if it can't (e.g. because there's no suitable constraint or operand
> modifier), it still can be an input just to inform the compiler.

According to the following statement, your approach is the recommended one:
"To prevent the compiler from removing global data or functions which 
are referenced from inline assembly statements, you can:
-use __attribute__((used)) with the global data or functions.
-pass the reference to global data or functions as operands to inline 
assembly statements.
Arm recommends passing the reference to global data or functions as 
operands to inline assembly statements so that if the final image does 
not require the inline assembly statements and the referenced global 
data or function, then they can be removed."

IIUC, you are suggesting to change
asm volatile ("mov sp,%0; b " STR(fn) : : "r" (stack) : "memory" )
into
asm volatile ("mov sp,%0; b %1" : : "r" (stack), "S" (fn) : "memory" );

This gives, respectively:
reset_stack_and_jump(idle_loop);

      460:	9100001f 	mov	sp, x0

      464:	14000007 	b	480 <idle_loop>


reset_stack_and_jump(idle_loop);

      460:	9100001f 	mov	sp, x0

      464:	14000000 	b	600 <idle_loop>


With this change, the functions return_to_new_vcpu32 and 
return_to_new_vcpu64, implemented in assembly and called in the same way 
as idle_loop(), need to be declared.

-- 
Xenia

