Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C81469DB94
	for <lists+xen-devel@lfdr.de>; Tue, 21 Feb 2023 08:58:33 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.498549.769428 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pUNXb-0000BL-UE; Tue, 21 Feb 2023 07:58:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 498549.769428; Tue, 21 Feb 2023 07:58:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pUNXb-00008m-RU; Tue, 21 Feb 2023 07:58:23 +0000
Received: by outflank-mailman (input) for mailman id 498549;
 Tue, 21 Feb 2023 07:58:22 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=RUos=6R=gmail.com=burzalodowa@srs-se1.protection.inumbo.net>)
 id 1pUNXa-00008K-Aq
 for xen-devel@lists.xenproject.org; Tue, 21 Feb 2023 07:58:22 +0000
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com
 [2a00:1450:4864:20::52b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 825bbe54-b1bd-11ed-933d-83870f6b2ba8;
 Tue, 21 Feb 2023 08:58:21 +0100 (CET)
Received: by mail-ed1-x52b.google.com with SMTP id ck15so14748496edb.0
 for <xen-devel@lists.xenproject.org>; Mon, 20 Feb 2023 23:58:21 -0800 (PST)
Received: from [192.168.1.93] ([188.73.238.161])
 by smtp.gmail.com with ESMTPSA id
 8-20020a170906310800b008e0e08b5fc7sm268500ejx.145.2023.02.20.23.58.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 20 Feb 2023 23:58:20 -0800 (PST)
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
X-Inumbo-ID: 825bbe54-b1bd-11ed-933d-83870f6b2ba8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=aqLRKH1h7HHnZgA2/GKBFIRjzmkMPaTNCLih2tBfIo0=;
        b=qE7+EekSANILz7CUg7Y39KHJkUyvxmeXweJkNCEUeuS4vB2n+Wme9k5dgKsRDObMCj
         8KT+Enam+KBYWc2jC85kZpDXP+jAofLxJlpEQRynxED0Pfm2IlW6fN31o3wuWTLlPJo6
         jhPt9rPuPwaz8Pnnzuj//Gi0VqUpUStXpyxO8Ue9hg8nNxx6Pih5O+/Kh19NMCpW8rtS
         nmQoMvv+tPK4otWKtUhRsX5k9bdVnS1k6dEDmBe/9A0bJ2J9m0esfPOUUXV68Zw5DnHj
         bE6rkAWbwmFw1HIZDSGE1IwP8mNBTxq4Irop0kQcMNO2J7M3pO5u6NLtW5ChRsI/xO5P
         vCDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=aqLRKH1h7HHnZgA2/GKBFIRjzmkMPaTNCLih2tBfIo0=;
        b=lhVLaYztcJqk3S+prUNkpGVtDImqoWemXMMuShssFkol0couN+NBiw+wJwZ6SuoLIc
         lkZajBK2qj26WA1MErgSgpkIfQb6txyQ6H5Y+BCW5++SXYYGBfU4CTDRSgoAc9Yk9sCD
         mMkbj7GsXV4kqFM3SdftaVudssq8yHS4KCXLxFMGEBT/013hULkduiK2O4IJ2hA83U5C
         Qud92I0kmonW/E7uiJ3n7epPikSjf3uAayv2r4iXGKzb0WgZTMMwrRnD4PwoJ1YBU0eA
         SZZ6C+Ik2HiU0glSULysHCL+tcJOavlQknuazr+WiJjMks597quxsngyZ6Pt26Y9klBa
         Gldw==
X-Gm-Message-State: AO0yUKXHHY47OGr1UbB8o1l03TF/IBleq+63iYFYoB5JKWsIyjoHdF10
	wQXuIt2ywLU3w2evyvUYuwE=
X-Google-Smtp-Source: AK7set8qnkjyWcquNvagec3VBzX0bVegh3oaxL8pehY6mkmby1gndMPumhIwB2uzOuIiJMdKPkUU1A==
X-Received: by 2002:a17:906:fcd5:b0:8b1:81eb:158f with SMTP id qx21-20020a170906fcd500b008b181eb158fmr15461952ejb.62.1676966300857;
        Mon, 20 Feb 2023 23:58:20 -0800 (PST)
Message-ID: <d90c5512-240f-d2a1-6748-3b56e8f911ea@gmail.com>
Date: Tue, 21 Feb 2023 09:58:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH 2/4] x86/svm: cleanup svm.h
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>, Wei Liu <wl@xen.org>
References: <20230217184814.1243046-1-burzalodowa@gmail.com>
 <20230217184814.1243046-3-burzalodowa@gmail.com>
 <562ae912-e833-ba97-dcd5-4c6b6d8898e0@citrix.com>
From: Xenia Ragiadakou <burzalodowa@gmail.com>
In-Reply-To: <562ae912-e833-ba97-dcd5-4c6b6d8898e0@citrix.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On 2/21/23 01:08, Andrew Cooper wrote:
> On 17/02/2023 6:48 pm, Xenia Ragiadakou wrote:
>> Remove the forward declaration of struct vcpu because it is not used.
> 
> Huh, turns out that was my fault in c/s b158e72abe, shortly after I
> introduced them in the first place.
> 
> Also, looking into that, there's one legitimate use of svm.h from
> outside, which is svm_load_segs*() which means we can't make all the
> headers be local.
> 
> But still, most of svm.h shouldn't be includable in the rest of Xen.
> Perhaps we can make a separate dedicated header for just this.
> 
> [edit]  And svm_{doman,vcpu}.  Perhaps we want a brand new
> include/asm/hvm/svm.h with only the things needed elsewhere.

This can be done as part of the series aiming to make svm/vmx support 
configurable.

> 
>> Move the forward declaration of struct cpu_user_regs just above the
>> function that needs it (to remind that it will need to be removed
>> along with the function).
> 
> I'm not sure.  This feels like churn.

Ok I will leave it where it is in v2.

> 
>> Move the definitions of NPT_PFEC_with_gla and NPT_PFEC_in_gpt in svm.c
>> because they are used only in this file.
> 
> IMO, these would better live in vmcb.h because that's where all the
> other decode information lives, not that there is much.  I previously
> started trying to convert all the exit_into fields into a typed union,
> but I didn't get as far the NPT info.

Ok I will fix it in v2.

> 
>> Move the definitions of SVM_PAUSE{FILTER,THRESH}_INIT in vmcb.c because
>> they are used only in this file.
> 
> Honestly, at this point you might as well just delete the defines, and
> opencode at their single usage site.  They're pure obfuscation like
> this, given no statement of units / behaviour, etc.

Ok I will do in v2.

> 
> That said, we do need to stea^W borrow adaptive PLE, and make the

I cannot understand what do you mean by "stea^W borrow adaptive PLE".

> settings hvm-common because right now we've got two different ways of
> configuring the same thing for VT-x and SVM.  (This is definitely not
> cleanup work.  Just an observation for anyone feeling at a loose end.)

I will create hvm_function_table stubs for the functions that are used 
in common code, do the same thing but are implemented differently by svm 
and vtx, as part of the series aiming to make svm/vmx support configurable.

> 
> ~Andrew

-- 
Xenia

