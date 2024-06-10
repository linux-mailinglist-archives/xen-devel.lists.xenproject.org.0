Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A171902A6C
	for <lists+xen-devel@lfdr.de>; Mon, 10 Jun 2024 23:11:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.737564.1143933 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sGmHa-0005NM-Op; Mon, 10 Jun 2024 21:10:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 737564.1143933; Mon, 10 Jun 2024 21:10:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sGmHa-0005Lk-Lj; Mon, 10 Jun 2024 21:10:26 +0000
Received: by outflank-mailman (input) for mailman id 737564;
 Mon, 10 Jun 2024 21:10:26 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=OhkP=NM=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1sGmHa-0005Le-30
 for xen-devel@lists.xenproject.org; Mon, 10 Jun 2024 21:10:26 +0000
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [2a00:1450:4864:20::32e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id dab1ec9a-276d-11ef-90a3-e314d9c70b13;
 Mon, 10 Jun 2024 23:10:24 +0200 (CEST)
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-421798185f0so22939455e9.1
 for <xen-devel@lists.xenproject.org>; Mon, 10 Jun 2024 14:10:24 -0700 (PDT)
Received: from [192.168.1.10] (host-92-26-98-202.as13285.net. [92.26.98.202])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4215c1aa2f7sm151881475e9.14.2024.06.10.14.10.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 10 Jun 2024 14:10:23 -0700 (PDT)
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
X-Inumbo-ID: dab1ec9a-276d-11ef-90a3-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1718053824; x=1718658624; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=UO1E0YV6wqdAbLiHhuKko7dau2iK752deLBVS+LJyeo=;
        b=Cm+GM5d22czNue9p4yuQW599UGhdwyeRjJoQMjzbedt77dWl1A7VwCXNVC7ueGIiT8
         J858HnNPBCcyMJLMwdV/cuNlUJcRGM/x8Ju4aV8MY/8pvz6zA4ETFcwZN8ZYKfphpJYN
         dqTmO7HQV22mOUdqrUQPqddsTOYcfo1iYifT4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718053824; x=1718658624;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UO1E0YV6wqdAbLiHhuKko7dau2iK752deLBVS+LJyeo=;
        b=uLu0lug1XyYPPMAwlb99YHamrAzp/dlfdrTN/ZtdUHasBmMu70NTMw6PSndM3kD0YD
         jYPW7zQZvBKZcWWOiC5ZRGQ549BONYuMg1DPEp3AabvWnHStke7v6090omz1wDV33L0p
         2kUy8wHQ8g6l1AHUXWtv3B8ra1Ik5Bg5XceMO6goglpeaxO4WMhmAEhGIiYLbpTBItLp
         /f9doheW3Rk/BRObZKg2AYqKfWmrs+8f9Zg0xJcGm8aazcIBjdqqX9v9lOXxO92FxfyC
         VkTQLgprJMKxFG1qDAdMv+1Cr7XMMnxSYkBPdOiE4DCuF9UEE9p2In8R8OPYOMhRZBHC
         aHRg==
X-Gm-Message-State: AOJu0YxYaJjgRbcX+RiTlfJKYCjRDIFsgfd9KPfwHjObWHZsaqFeaFNa
	eI7Kakt6zQv4bYA40Gep5FgXd7kQPFJJQJvp8euhcnwQv2nuoqBIH1N0X9M2q/0=
X-Google-Smtp-Source: AGHT+IGJH5ewgRoMSY1DvomImJJRsYknZa/0Cdb1iZuv3dAlj4zPLzXOWWT0d9E8OtPwyOqg8dkBog==
X-Received: by 2002:a05:600c:3aca:b0:421:b47d:4e9d with SMTP id 5b1f17b1804b1-421b47d4eaemr32655145e9.40.1718053824135;
        Mon, 10 Jun 2024 14:10:24 -0700 (PDT)
Message-ID: <f5c63d7a-5254-49f1-a907-9876be7f50b6@citrix.com>
Date: Mon, 10 Jun 2024 22:10:23 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH for-4.19 v1] automation: add a test for HVM domU on PVH
 dom0
To: =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>
Cc: xen-devel@lists.xenproject.org,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 Doug Goldstein <cardoe@cardoe.com>,
 Stefano Stabellini <sstabellini@kernel.org>
References: <20240610133210.724346-1-marmarek@invisiblethingslab.com>
 <67a6fc3a-bcc3-48e8-beb8-b3c05217083c@citrix.com> <ZmdKMthsjw0qejyg@mail-itl>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <ZmdKMthsjw0qejyg@mail-itl>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 10/06/2024 7:47 pm, Marek Marczykowski-Górecki wrote:
> On Mon, Jun 10, 2024 at 04:25:01PM +0100, Andrew Cooper wrote:
>> On 10/06/2024 2:32 pm, Marek Marczykowski-Górecki wrote:
>>> This tests if QEMU works in PVH dom0. QEMU in dom0 requires enabling TUN
>>> in the kernel, so do that too.
>>>
>>> Add it to both x86 runners, similar to the PVH domU test.
>>>
>>> Signed-off-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
>> Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>
>>
>> CC Oleksii.
>>
>>> ---
>>> Requires rebuilding test-artifacts/kernel/6.1.19
>> Ok.
>>
>> But on a tangent, shouldn't that move forwards somewhat?
> There is already "[PATCH 08/12] automation: update kernel for x86 tests"
> in the stubdom test series. And as noted in the cover letter there, most
> patches can be applied independently, and also they got R-by/A-by from
> Stefano already.

I've got yet more fixes to come too.  I'll chase down some CI R-ack's in
due course.

>
>>> I'm actually not sure if there is a sense in testing HVM domU on both
>>> runners, when PVH domU variant is already tested on both. Are there any
>>> differences between Intel and AMD relevant for QEMU in dom0?
>> It's not just Qemu, it's also HVMLoader, and the particulars of VT-x/SVM
>> VMExit decode information in order to generate ioreqs.
> For just HVM, we have PCI passthrough tests on both - they run HVM (but
> on PV dom0). My question was more about PVH-dom0 specific parts.

Still a firm recommendation for both.

Dom0 is a very different set of codepaths to other domains, and unlike
PV (where almost all logic is common), for PVH there's large variety of
VT-x/SVM specifics both in terms of configuring dom0 to start with, and
at runtime.

Within XenRT, it's been very rare that we've found a PVH dom0 bug
affecting Intel and AMD equally.

~Andrew

