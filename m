Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B94D36A538B
	for <lists+xen-devel@lfdr.de>; Tue, 28 Feb 2023 08:10:29 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.503015.775127 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pWu7c-0003s8-Gc; Tue, 28 Feb 2023 07:10:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 503015.775127; Tue, 28 Feb 2023 07:10:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pWu7c-0003pq-Dn; Tue, 28 Feb 2023 07:10:00 +0000
Received: by outflank-mailman (input) for mailman id 503015;
 Tue, 28 Feb 2023 07:09:59 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=4VB9=6Y=gmail.com=burzalodowa@srs-se1.protection.inumbo.net>)
 id 1pWu7b-0003pk-Cy
 for xen-devel@lists.xenproject.org; Tue, 28 Feb 2023 07:09:59 +0000
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com
 [2a00:1450:4864:20::530])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e7afbe88-b736-11ed-a550-8520e6686977;
 Tue, 28 Feb 2023 08:09:56 +0100 (CET)
Received: by mail-ed1-x530.google.com with SMTP id eg37so35661950edb.12
 for <xen-devel@lists.xenproject.org>; Mon, 27 Feb 2023 23:09:56 -0800 (PST)
Received: from [192.168.1.93] (adsl-6.109.242.139.tellas.gr. [109.242.139.6])
 by smtp.gmail.com with ESMTPSA id
 n28-20020a50935c000000b004b025c19c6esm3988581eda.93.2023.02.27.23.09.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 27 Feb 2023 23:09:55 -0800 (PST)
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
X-Inumbo-ID: e7afbe88-b736-11ed-a550-8520e6686977
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=9kcdWo72CyQpKeC8omblHGRf5bJTr2FSqOiMv6HT/F0=;
        b=MclWZjuVwFqFhRe+0Sky/ZvnZ6DaibSYE1JrSEgXzxRN4jt2L8R+jR1q+E0EIOO7kp
         0HYAA23o2F/ZsACy2o73JrTH5hPCJgrl73Flv89FDrDSsrN5i6Civg2pZMoXUo+ugFyT
         +wGtfTq5BngeASqaCDGG+rsHiIlC0YMLMPeEpRCgo8R7irOWaYrQV5gBmvSIdNqzejP5
         z1BcwaSsPFW3g/Kt9ul3fSHGCC/lbuN/5e3xccEQ6+LN05/jATcPbVCBNmTKGBtCInXt
         g6hXdZuAODQ0SHrJetlg2WQH+Ut1Al3DhSQVoQOs8uw0okDoDJsfDVpvKirlMEmZQNVw
         9H9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9kcdWo72CyQpKeC8omblHGRf5bJTr2FSqOiMv6HT/F0=;
        b=OIVLQuhgR6VbkX3ios2EBZ1noPHOSxzGmzKmD6rD5z5g0cYpl/DlsChj7u6YKbJ/T6
         kveLh1DQXgfKSzZ4KAMYOdcUzAzsl/+LZVAJeJp0yYS1rzSXgBAum+qykk1gOT40zBKD
         wqNtUAGku96heOGrGCKnkoeJwi18W/rygLeeJDpYjfYbNlRQrzV9FnErshoLCQ6bTDHY
         jn2pQXVBhaMLMtOLo0jHU6VTV6yghINTUoJGN8eiMVu5rAVuKXQqVdPvRwDNlEV0uMrm
         DobLW79I2JDonuF7ALNFA044addYHyBRUTYdgE6Rs2N8ZaPRvwN+wYsUBo1AZLUSBGU1
         ibRQ==
X-Gm-Message-State: AO0yUKWFfSG04UgKo9gBIlVeRWVyaSHOPQJSSjBtuw0ZQXIjCt/RqZMF
	cGOmTUiTP+da0ooFgVu8r5I=
X-Google-Smtp-Source: AK7set+6yPkM+PnAukftDkoPAAsS684UhwJnuYYf02TmwnHXUguVhFaXEZYE3uTM/XKyjP4JpsfuhQ==
X-Received: by 2002:aa7:c90c:0:b0:4aa:b63f:a0e with SMTP id b12-20020aa7c90c000000b004aab63f0a0emr2176173edt.17.1677568195624;
        Mon, 27 Feb 2023 23:09:55 -0800 (PST)
Message-ID: <dc6b36df-f46d-0903-0789-5dda74490eca@gmail.com>
Date: Tue, 28 Feb 2023 09:09:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v3 00/14] x86/hvm: {svm,vmx} {c,h} cleanup
Content-Language: en-US
To: Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Jun Nakajima <jun.nakajima@intel.com>,
 Kevin Tian <kevin.tian@intel.com>, xen-devel@lists.xenproject.org
References: <20230224185010.3692754-1-burzalodowa@gmail.com>
 <e51c2ed6-4dc2-bf77-5d89-7023b3201fd0@citrix.com>
 <8745c599-bf9f-1eec-739f-3d42920dc546@gmail.com>
 <989903f7-4ea0-a1d8-923f-efb84c70ba21@citrix.com>
 <aa326f9a-94ca-75b9-6d4a-ab6fdf992c29@suse.com>
 <2fec6c39-f73c-719b-7bc9-02e1ec3f195b@citrix.com>
 <5e623eaa-ce32-e3ac-2089-68bf8125b5db@suse.com>
 <18b9b99e-1d93-73d8-f9b8-873f44287c5c@citrix.com>
 <60252bef-c732-b061-8ec0-c4022eb41255@suse.com>
From: Xenia Ragiadakou <burzalodowa@gmail.com>
In-Reply-To: <60252bef-c732-b061-8ec0-c4022eb41255@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On 2/27/23 14:17, Jan Beulich wrote:
> On 27.02.2023 13:06, Andrew Cooper wrote:
>> On 27/02/2023 11:33 am, Jan Beulich wrote:
>>> On 27.02.2023 12:15, Andrew Cooper wrote:
>>>> On 27/02/2023 10:46 am, Jan Beulich wrote:
>>>>> On 24.02.2023 22:33, Andrew Cooper wrote:
>>>>>> But I think we want to change tact slightly at this point, so I'm not
>>>>>> going to do any further tweaking on commit.
>>>>>>
>>>>>> Next, I think we want to rename asm/hvm/svm/svm.h to asm/hvm/svm.h,
>>>>>> updating the non-SVM include paths as we go.  Probably best to
>>>>>> chain-include the other svm/hvm/svm/*.h headers temporarily, so we've
>>>>>> only got one tree-wide cleanup of the external include paths.
>>>>>>
>>>>>> Quick tangent - I will be making all of that cpu_has_svm_*
>>>>>> infrastructure disappear by moving it into the normal CPUID handling,
>>>>>> but I've not had sufficient time to finish that yet.
>>>>>>
>>>>>> Next, hvm/svm/nestedsvm.h can merge straight into hvm/svm.h, and
>>>>>> disappear (after my decoupling patch has gone in).
>>>>> Why would you want to fold hvm/svm/nestedsvm.h into hvm/svm/svm.h?
>>>>> The latter doesn't use anything from the former, does it?
>>>> It's about what else uses them.
>>>>
>>>> hvm_vcpu needs both svm_vcpu and nestedsvm, so both headers are always
>>>> included in tandem.
>>> Well, yes, that's how things are today. But can you explain to me why
>>> hvm_vcpu has to know nestedsvm's layout?
>>
>> Because it's part of the same single memory allocation.
> 
> Which keeps growing, and sooner or later we'll need to find something
> again to split off, so we won't exceed a page in size. The nested
> structures would, to me, look to be prime candidates for such.
> 
>>> If the field was a pointer,
>>> a forward decl of that struct would suffice, and any entity in the
>>> rest of Xen not caring about struct nestedsvm would no longer see it
>>> (and hence also no longer be re-built if a change is made there).
>>
>> Yes, you could hide it as a pointer.  The cost of doing so is an
>> unnecessary extra memory allocation, and extra pointer handling on
>> create/destroy, not to mention extra pointer chasing in memory during use.
>>
>>>> nestedsvm is literally just one struct now, and no subsystem ought to
>>>> have multiple headers when one will do.
>>> When one will do, yes. Removing build dependencies is a good reason
>>> to have separate headers, though.
>>
>> Its not the only only option, and an #ifdef CONFIG_NESTED_VIRT inside
>> the struct would be an equally acceptable way of doing this which
>> wouldn't involve making an extra memory allocation.
> 
> That would make it a build-time decision, but then on NESTED_VIRT=y
> hypervisors there might still be guests not meaning to use that
> functionality, and for quite some time that may actually be a majority.
> 
>> Everything you've posed here is way out of scope for Xenia's series.
> 
> There was never an intention to extend the scope of the work she's doing.
> Instead I was trying to limit the scope by suggesting to avoid a piece
> of rework which later may want undoing.

Can I suggest to leave hvm/svm/svm.h and hvm/svm/nestedsvm.h separate 
for now?

> 
> Jan

-- 
Xenia

