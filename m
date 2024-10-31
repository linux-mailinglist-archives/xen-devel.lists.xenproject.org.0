Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E33D9B789A
	for <lists+xen-devel@lfdr.de>; Thu, 31 Oct 2024 11:25:19 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.828571.1243503 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t6SLh-0008DH-Oc; Thu, 31 Oct 2024 10:24:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 828571.1243503; Thu, 31 Oct 2024 10:24:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t6SLh-0008BS-Lo; Thu, 31 Oct 2024 10:24:17 +0000
Received: by outflank-mailman (input) for mailman id 828571;
 Thu, 31 Oct 2024 10:24:15 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=7hTS=R3=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1t6SLf-0008BL-SU
 for xen-devel@lists.xenproject.org; Thu, 31 Oct 2024 10:24:15 +0000
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com
 [2a00:1450:4864:20::230])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 43f1dd40-9772-11ef-99a3-01e77a169b0f;
 Thu, 31 Oct 2024 11:24:09 +0100 (CET)
Received: by mail-lj1-x230.google.com with SMTP id
 38308e7fff4ca-2fb5fa911aaso10639341fa.2
 for <xen-devel@lists.xenproject.org>; Thu, 31 Oct 2024 03:24:09 -0700 (PDT)
Received: from [10.125.226.166] ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a9e564c4fc6sm50716066b.69.2024.10.31.03.24.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 31 Oct 2024 03:24:08 -0700 (PDT)
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
X-Inumbo-ID: 43f1dd40-9772-11ef-99a3-01e77a169b0f
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDA6MTQ1MDo0ODY0OjIwOjoyMzAiLCJoZWxvIjoibWFpbC1sajEteDIzMC5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6IjQzZjFkZDQwLTk3NzItMTFlZi05OWEzLTAxZTc3YTE2OWIwZiIsInRzIjoxNzMwMzcwMjQ5LjQ5MTA2Nywic2VuZGVyIjoiYW5kcmV3LmNvb3BlckBjbG91ZC5jb20iLCJyZWNpcGllbnQiOiJ4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcifQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1730370249; x=1730975049; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=7mArC1vUBz+lNBISIxc6efpudfS/T7AiVoWNFagJAnY=;
        b=Praqn9XK7PSSXPRFSEsJQkENN6Ip+NEIOM2s52osTOCFvEucxxWiSkdaRcm8FK4BSS
         dXM4poK0zdr7NC3FJAeNieY6wdoCal18gP4I3hwlRRLPVyplftUACyrDomdtI71FOBaU
         u7XAYRcm9EnGKla//L3cGq47djtQY30f9HpoA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730370249; x=1730975049;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7mArC1vUBz+lNBISIxc6efpudfS/T7AiVoWNFagJAnY=;
        b=fnH1snvoAreRV8xYpj79QR2ID8t2brz/VPAUDF6S4o5cP6lVGT/kDa7Bx205MetRJq
         2uDlQWxIn/O+ypCe0rkRPZdHXiRwi5aMkdWJe2MTx9uu+3gT4RqOzs46cSnPen9od12J
         HLHQfo1vUEwd1I9BqgQaQ36cKbdHlVdEudHIoTWwXbsZ4RIOy5LLvzIHhK/1ez2PcpjU
         dDLdnsbIIB7S/voZaG9g4GEV1ojQqmGws7IszvzSHMaIZ3Jig82LSYZCGwOT04Wb4zs4
         FsRzRjyqdP45jvcnzZsj7jo2gkvbeWEZ8g84P7vhf1CIsVnGAzGjTCU2JtmNNwfos+9e
         Xhgg==
X-Forwarded-Encrypted: i=1; AJvYcCVnOKh30j55LMjOjOLc3Zmt5MXtgBmV77E7OhNm8Y1uUYIX5JypOirzEvwwsfXeGlTDFQIoYS+khhs=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yy8cMU3hww8yas0wWnirAgaf9ga6nyLuF92D1ydWs8eLBxbDxQy
	iahjvdYX2XIGZCfT60j3eW9XbqqHsjJWmJc6NeP/eyFqpTpadbkEHTGzGk3nn6Q=
X-Google-Smtp-Source: AGHT+IGMBWWyi4tDRXHH+AohzOL2wp06uKxlNm4IYkXKaRXuRjpks2KAXpy5puccfla9IRs3p4wg2Q==
X-Received: by 2002:a05:651c:1509:b0:2fb:5bd:8ff2 with SMTP id 38308e7fff4ca-2fcbdf9d41amr146718101fa.16.1730370248816;
        Thu, 31 Oct 2024 03:24:08 -0700 (PDT)
Message-ID: <9ad2c3b7-ef2a-4888-a24f-77aebfedb6fe@citrix.com>
Date: Thu, 31 Oct 2024 10:24:06 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH for-4.19] Config: Update MiniOS revision
To: Jan Beulich <jbeulich@suse.com>, Juergen Gross <jgross@suse.com>,
 Samuel Thibault <samuel.thibault@ens-lyon.org>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20241030180332.2726909-1-andrew.cooper3@citrix.com>
 <a76d84a3-d150-4836-8ad2-ee0eeabe557b@suse.com>
 <c84ef564-98de-451d-af4e-04e824231ea6@citrix.com>
 <701da657-a709-4c2b-908f-2bfe193948ca@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <701da657-a709-4c2b-908f-2bfe193948ca@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 31/10/2024 10:02 am, Jan Beulich wrote:
> On 31.10.2024 10:46, Andrew Cooper wrote:
>> On 31/10/2024 9:25 am, Jan Beulich wrote:
>>> On 30.10.2024 19:03, Andrew Cooper wrote:
>>>> A new branch from xen-RELEASE-4.19.0, for now containing commit
>>>> a400dd517068 ("Add missing symbol exports for grub-pv").
>>>>
>>>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
>>>> ---
>>>> CC: Juergen Gross <jgross@suse.com>
>>>> CC: Jan Beulich <JBeulich@suse.com>
>>>> CC: Stefano Stabellini <sstabellini@kernel.org>
>>>> CC: Julien Grall <julien@xen.org>
>>>> ---
>>>>  Config.mk | 2 +-
>>>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>>>
>>>> diff --git a/Config.mk b/Config.mk
>>>> index 03a89624c77f..aa3d5843f1ed 100644
>>>> --- a/Config.mk
>>>> +++ b/Config.mk
>>>> @@ -224,7 +224,7 @@ QEMU_UPSTREAM_URL ?= https://xenbits.xen.org/git-http/qemu-xen.git
>>>>  QEMU_UPSTREAM_REVISION ?= qemu-xen-4.19.0
>>>>  
>>>>  MINIOS_UPSTREAM_URL ?= https://xenbits.xen.org/git-http/mini-os.git
>>>> -MINIOS_UPSTREAM_REVISION ?= xen-RELEASE-4.19.0
>>>> +MINIOS_UPSTREAM_REVISION ?= xen-stable-4.19
>>> Wouldn't we better use a hash here, like we do on staging? There had been
>>> cases where it wasn't safe for the used commit to move "automatically", and
>>> the same could occur on a stable branch. The hash would then be replaced by
>>> a release tag when a release is being prepared (again like on staging).
>> It will only be getting build fixes, not new content.  So it will be
>> stable-enough in that regard.
> Hmm, can we really expect it to only ever be build fixes, not fixes of any
> other kind (which then may have dependencies)? Jürgen, Samuel, what's your
> take?

The reason I needed to make a branch (and I've got 4.18 (shared with
4.17) and 4.16 also queued up) is to avoid taking intermediate changes
while backporting a build fix.

The last time this happened was Xen 4.6.

The reasoning would be different if we backported new features, but we
don't as a matter of course.

~Andrew

