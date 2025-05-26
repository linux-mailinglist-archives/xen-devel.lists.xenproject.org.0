Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 36140AC4474
	for <lists+xen-devel@lfdr.de>; Mon, 26 May 2025 22:31:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.997777.1378596 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uJeTN-0006fO-M7; Mon, 26 May 2025 20:31:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 997777.1378596; Mon, 26 May 2025 20:31:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uJeTN-0006ct-JQ; Mon, 26 May 2025 20:31:01 +0000
Received: by outflank-mailman (input) for mailman id 997777;
 Mon, 26 May 2025 20:31:00 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=pkau=YK=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1uJeTM-0006cn-F4
 for xen-devel@lists.xenproject.org; Mon, 26 May 2025 20:31:00 +0000
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [2a00:1450:4864:20::330])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 52cde1e9-3a70-11f0-b893-0df219b8e170;
 Mon, 26 May 2025 22:30:55 +0200 (CEST)
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-43ce71582e9so23940175e9.1
 for <xen-devel@lists.xenproject.org>; Mon, 26 May 2025 13:30:55 -0700 (PDT)
Received: from [192.168.1.183] (host-92-26-98-202.as13285.net. [92.26.98.202])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-447f23c07bfsm248208045e9.23.2025.05.26.13.30.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 26 May 2025 13:30:53 -0700 (PDT)
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
X-Inumbo-ID: 52cde1e9-3a70-11f0-b893-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1748291454; x=1748896254; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=IcSCIPKCYzq3xMUPyqz+c2UB2LSl8Sj1A3zJWV6wQU8=;
        b=PZN0HNSzxtQ4jziHDMp7nWDGeZD7i8kvpvdFzgdY9Z4S5qKjZ/jaxiwKH0cnVVl7zL
         reu+6Eimm45EERFOLSgu9PXgiWPu2sjwTgnjgqUS6NkoWWmTJBEdkgXsx/1n0VF+amE9
         wpIVg/gXaQvS57bHlubgcnR3gkezOlyYq4unk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748291454; x=1748896254;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IcSCIPKCYzq3xMUPyqz+c2UB2LSl8Sj1A3zJWV6wQU8=;
        b=gVksy0IvAmFDp2WkGJ0cHDfTyquPyriNTxTeIdHk9FgoTT/d9vZ3HZovm5K5QJJhQX
         q7Cdm7f8XzXZW+7/CSH7gIHEP8QcYOmXI6cO1TQ7eMK0jyePqQ4JZBEHZSDuL7W5z3jG
         3GxmiGNmlUDUHOztnA0cSDhtyN7itEC5GUTq0UoHBZ8WasFCLcJk6I9LgRtSWoAHHVCa
         q5zyspq3MciDKnWx9X3YkeYDGMMt5rqQpJSaPJkvnp7e7wscOZDB9h8O4nReSxmHe5gj
         rCMJT6mxl7seK1+Trs0IDPtfy8M6lbzNu4+6bKiYsBjSo+Z2AwyNdriM20wNq22wdcXP
         y/vw==
X-Gm-Message-State: AOJu0YwcdW8Mci/7imW83Jsqq2G4FYibnghtHILo/7JpU6EM7yqMpyAZ
	6UT0MhRfTpIb0jtTW0dd9OfROzlz03nmovmxKAjSbb3AZYVWzsq+Mv6HvmRMOQ241LTrwwdtFVF
	qqf06
X-Gm-Gg: ASbGnctvZ0IalwzPLMeqYDCn0KHADswwY7J5ULfCAIUnXz3XFX4P7PFGYUtWPvorPGU
	7wx/polrPvrn3lHPIyEL8zrEUt4s9bzy6s48gcsEvrs44g7NgUZqf7hqqVet2CipDQl5YTgz/U/
	yC6UPP3+xIZLrj7kw+UorXkS0S31VBi6vXGMt+b/vQL+BtzzE8NDgY11uUDS1JyAynQzxUF6/yO
	YtlxPSHy07zZtkuAo4NZpiBHT6qf+D0ccHSL+dF6pzUBUd/gzj3yNHDi2TVmO8aGj7rnPctczDb
	/R9aKDCuU64eLud0/N/AqmWzp80XiptKWByJh/3mxzMtksgXu/sx4iMoJdeCBv/+8YBJ7Tdmlb3
	5UDypiCxTAZddHzQv
X-Google-Smtp-Source: AGHT+IF7reztmZ3BQHn1M9VVzMOPz5+ZOHv1u3l0bkqIiNtWbZ0SktchYVfi+UnzOu4J+dOQvr0pQw==
X-Received: by 2002:a05:600c:512a:b0:44b:2f53:351c with SMTP id 5b1f17b1804b1-44c91dcb6e7mr96586375e9.18.1748291454393;
        Mon, 26 May 2025 13:30:54 -0700 (PDT)
Message-ID: <ec1fa3bd-303a-49d2-95cb-2f873c66a7b1@citrix.com>
Date: Mon, 26 May 2025 21:30:53 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Xen 4.18.5 PV dbregs fail
To: Manuel Bouyer <bouyer@antioche.eu.org>
Cc: xen-devel@lists.xenproject.org
References: <aDSr8u-7w_Rbf4el@mail.soc.lip6.fr>
 <d019f9f9-6d45-43fe-b184-fc55f79d411f@citrix.com>
 <b1336e71-356c-46a0-b0c4-9fcbee3f92fa@citrix.com>
 <aDS27G05bJvSyd5o@antioche.eu.org>
 <0733f3dc-9f01-4e15-98ab-d7fd7c3e303d@citrix.com>
 <aDTLdL4irrkTLxje@antioche.eu.org>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <aDTLdL4irrkTLxje@antioche.eu.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 26/05/2025 9:13 pm, Manuel Bouyer wrote:
> On Mon, May 26, 2025 at 07:50:14PM +0100, Andrew Cooper wrote:
>> [...]
>> Well, that range does include the aforementioned commit.
>>
>> Can you bisect around d32c77f471fb8400b6512c171a14cdd58f04f0a3 which is
>> the backport of ^ in 4.18 ?
> Sure,
> with 0d5f15e and d32c77f the test pass, with cecee35 it fails.
>

Oh interesting, so the basic forwarding of #DB back into a guest
(d32c77f) works fine, but the changes to emulated debug exceptions
(cecee35) break.

Anyway, I think I've spotted a logical error.  We do indeed end up
calling x86_merge_dr6() twice, because of the TODO just out of context. 
Does this help?

~Andrew


diff --git a/xen/arch/x86/traps.c b/xen/arch/x86/traps.c
index 6d75b59b1e97..01b8be02b055 100644
--- a/xen/arch/x86/traps.c
+++ b/xen/arch/x86/traps.c
@@ -1798,7 +1798,7 @@ void asmlinkage do_debug(struct cpu_user_regs *regs)
         return;
     }
 
-    pv_inject_DB(0 /* N/A, already merged */);
+    pv_inject_DB(dr6 ^ X86_DR6_DEFAULT);
 }
 
 void asmlinkage do_entry_CP(struct cpu_user_regs *regs)


