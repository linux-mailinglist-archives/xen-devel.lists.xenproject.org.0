Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C13B968C18
	for <lists+xen-devel@lfdr.de>; Mon,  2 Sep 2024 18:38:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.788260.1197733 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1slA4C-0001tY-3s; Mon, 02 Sep 2024 16:38:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 788260.1197733; Mon, 02 Sep 2024 16:38:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1slA4C-0001qg-0J; Mon, 02 Sep 2024 16:38:12 +0000
Received: by outflank-mailman (input) for mailman id 788260;
 Mon, 02 Sep 2024 16:38:10 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=qspk=QA=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1slA4A-0001qY-MS
 for xen-devel@lists.xenproject.org; Mon, 02 Sep 2024 16:38:10 +0000
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com
 [2a00:1450:4864:20::22d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id bc5ff790-6949-11ef-99a1-01e77a169b0f;
 Mon, 02 Sep 2024 18:38:08 +0200 (CEST)
Received: by mail-lj1-x22d.google.com with SMTP id
 38308e7fff4ca-2f3f163e379so71957571fa.3
 for <xen-devel@lists.xenproject.org>; Mon, 02 Sep 2024 09:38:08 -0700 (PDT)
Received: from [10.125.226.166] ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a898900e95dsm580532766b.54.2024.09.02.09.38.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 02 Sep 2024 09:38:06 -0700 (PDT)
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
X-Inumbo-ID: bc5ff790-6949-11ef-99a1-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1725295088; x=1725899888; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:cc
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=kI8ehFREsBBJYUM3Y/dvmYdYOjjEdZer5j6KbpUPa8Y=;
        b=Eq0Yjgv1vayrGQu6NqfrQCY0JyASpDoCjkQEWScdI8zNuLIlJWHpwQShsAy7eUvDFu
         TIBcDDsbuxvWjykhZLoh6rijGgBexF4IVvSC/5dWbVg8TuP5kZYLPmkZVFJUNb7/dphV
         A1QpEVb9TcRXALbsPsR/0Bs+HSV+DW5gv079w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725295088; x=1725899888;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:cc
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kI8ehFREsBBJYUM3Y/dvmYdYOjjEdZer5j6KbpUPa8Y=;
        b=ual//z/j0QBrnaOIFKaJlhco+tdSJ1wGICXhsax590vYy8fq4WGjxVuLgLlRTuLlLU
         oy3sSgr8j5R8USwQ7QTPZZCa1EbP0RzQckwBVQxZl/bYAWPI5FrQdMVekHAb6FdWi/QD
         78pU+gdgb+dcKzva6utVtP0t2RcIoAeu4EgfUc4AirahR0+nSlR8No/m5pr7MzzhpSvs
         dFPHgkT/0+YABPWhcWKvCpWltJ/IOQpd++MnfGe1kepuaMA36YTNYZ/TrKsz8RqiuKIP
         ZfG57ooW5yPQen3l3eu37JDCQKBxzrOjwg253Ts3bJ1J8qKHvUwVaUzvPu6i54SLU84/
         i9EQ==
X-Forwarded-Encrypted: i=1; AJvYcCXqcfty/IBL2lpvs9Yy7tuAW/n0DF6JdBI3ILAjb7Ejt8bIqUSvxUiM2xe+XnGtKfzCLFsOhBH5AHY=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxOmWCwtPwp+BIWcvvOiXzW+AedgQ/znxFbOiqruCAFYRztknZ0
	T4rrxJ6rff6t7PTYL2hI0nTJMu872gcHE4WD+ZeXn2qp8eSf4s9YWsDupooTYrQ=
X-Google-Smtp-Source: AGHT+IGGkF5wodfeWHk8XJ+At1zv4Kv0S3b6Va+vWZfp9TZJsNp6T/9hyRZQHRsR+kegsEHi1KZRLg==
X-Received: by 2002:a2e:f19:0:b0:2f3:cd65:cf65 with SMTP id 38308e7fff4ca-2f6107080ccmr106900791fa.28.1725295087401;
        Mon, 02 Sep 2024 09:38:07 -0700 (PDT)
Message-ID: <dfb2a806-65ff-49f1-8955-7eceea2bc566@citrix.com>
Date: Mon, 2 Sep 2024 17:38:05 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] tools/ocaml/xc: Drop the GC lock for all hypercalls
To: Edwin Torok <edwin.torok@cloud.com>,
 xen-devel <xen-devel@lists.xenproject.org>
References: <20240830175309.2854442-1-andrew.cooper3@citrix.com>
 <CAEfZLvkhqA9urPyFqPp+bAeF-+X8dAs3+iC2NnpMdrUSwpuH5w@mail.gmail.com>
Content-Language: en-GB
Cc: Christian Lindig <christian.lindig@citrix.com>,
 "dave@recoil.org" <dave@recoil.org>, Rob Hoes <Rob.Hoes@citrix.com>,
 Andrii Sultanov <andrii.sultanov@cloud.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <CAEfZLvkhqA9urPyFqPp+bAeF-+X8dAs3+iC2NnpMdrUSwpuH5w@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 02/09/2024 9:10 am, Edwin Torok wrote:
> On Fri, Aug 30, 2024 at 6:53 PM Andrew Cooper <andrew.cooper3@citrix.com> wrote:
>> We should be doing this unilaterally.
> Agreed, but we should do it safely, since last time I did this I
> learned about a few more instances of behaviours I previously thought
> to be safe, but that are undefined behaviour.
> Which probably means we have a bunch of other code to fixup (I should
> really finish my static analyzer project, and update it with the newly
> learned rules to catch all these...).
> See below for comments.
>
> Although there is one bug here we've previously known to avoid:
> String_val cannot be dereferenced with the lock released, that one is
> an OCaml value and will cause actual problems,
> so we need to caml_copy_string that one.
>
>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
>> ---
>> CC: Christian Lindig <christian.lindig@citrix.com>
>> CC: David Scott <dave@recoil.org>
>> CC: Edwin Török <edwin.torok@cloud.com>
>> CC: Rob Hoes <Rob.Hoes@citrix.com>
>> CC: Andrii Sultanov <andrii.sultanov@cloud.com>
>>
>> Also pulled out of a larger cleanup series.
>> ---
>>  tools/ocaml/libs/xc/xenctrl_stubs.c | 63 +++++++++++++++++++++++++++--
>>  1 file changed, 60 insertions(+), 3 deletions(-)
>>
>> diff --git a/tools/ocaml/libs/xc/xenctrl_stubs.c b/tools/ocaml/libs/xc/xenctrl_stubs.c
>> index c78191f95abc..20487b21008f 100644
>> --- a/tools/ocaml/libs/xc/xenctrl_stubs.c
>> +++ b/tools/ocaml/libs/xc/xenctrl_stubs.c
>> @@ -312,7 +312,10 @@ CAMLprim value stub_xc_domain_max_vcpus(value xch_val, value domid,
>>         xc_interface *xch = xch_of_val(xch_val);
>>         int r;
>>
>> +       caml_enter_blocking_section();
>>         r = xc_domain_max_vcpus(xch, Int_val(domid), Int_val(max_vcpus));
> We need to move the Int_val macros out of here, domid is registered as
> a GC root, so the GC *will* write to it (it'll write the same value).

How?

As value's, both domid and max_vcpu are integers living in GPRs.

These expressions are not dereferencing  into the Ocaml Heap.

~Andrew

