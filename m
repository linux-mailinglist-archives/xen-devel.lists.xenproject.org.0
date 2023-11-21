Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 97DDB7F34F1
	for <lists+xen-devel@lfdr.de>; Tue, 21 Nov 2023 18:31:20 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.638086.994384 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r5Uaf-0008Fc-Aj; Tue, 21 Nov 2023 17:31:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 638086.994384; Tue, 21 Nov 2023 17:31:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r5Uaf-0008D8-7b; Tue, 21 Nov 2023 17:31:13 +0000
Received: by outflank-mailman (input) for mailman id 638086;
 Tue, 21 Nov 2023 17:31:11 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=qy+O=HC=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1r5Uad-0007h1-6y
 for xen-devel@lists.xenproject.org; Tue, 21 Nov 2023 17:31:11 +0000
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [2a00:1450:4864:20::432])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c2d4012e-8893-11ee-98e1-6d05b1d4d9a1;
 Tue, 21 Nov 2023 18:31:10 +0100 (CET)
Received: by mail-wr1-x432.google.com with SMTP id
 ffacd0b85a97d-3316bd84749so2863124f8f.2
 for <xen-devel@lists.xenproject.org>; Tue, 21 Nov 2023 09:31:10 -0800 (PST)
Received: from [192.168.1.10] (host-92-26-107-252.as13285.net. [92.26.107.252])
 by smtp.gmail.com with ESMTPSA id
 v11-20020adfe28b000000b0032d09f7a713sm15049973wri.18.2023.11.21.09.31.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 21 Nov 2023 09:31:09 -0800 (PST)
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
X-Inumbo-ID: c2d4012e-8893-11ee-98e1-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1700587870; x=1701192670; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=WG3CpO8GGSOx8ROiV6YhOUkLfmA8nltY0tnQdpEYci4=;
        b=ajINeXb/+tL8/K6CG+etff7rX8YS54iPLLHB42XNlbM4QvuvXEutSOpLaj1shFDr0O
         KLJOiuMEU5BktC87eEDQWXKlAH0zrH1YIocqqem8kCMEjn06LyL6urIgR2EijL+qCE3d
         AZFMPO48048KW+J5poYaQdBrvRWFWB2P49Jyo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700587870; x=1701192670;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=WG3CpO8GGSOx8ROiV6YhOUkLfmA8nltY0tnQdpEYci4=;
        b=loPqYF/viyx1y9CDSFgCR6B3glPnGfOE4rM6kgNj8JViB4epCROkGfXxhZnSp82kZd
         zZPvVLNHww1j7Vf9g2JOL4BGwO50p9ORlvwRWKNsUy4Dc26R4xlthuH312WLXzY75HFo
         UsnpDaUcLCSOVQLqIxDB6bYSpV87x6HzMr7YnhiDu5DC0OwkrZ3tp9R/zZtCAkuIp2zR
         UjxwvMs1UarJ1af5WQjVNfuSIZykRbyjzHz3rgl/yOoUutqQEP96oX5eQm9r6Lp46J1r
         kLQfiuyJBSHwC8DISohh2+Igg2X4y68yoWIRa5o8QRJ8g2shp5EMnDQAfOJLF6qGKgzp
         rF0A==
X-Gm-Message-State: AOJu0Yw8Zia6psq+Ye4DVDwYZJFn8Vhtr9cupC0NLZnffA4nea9fOMQU
	rmQU+QCLQpm/kIR3T+m8DxkJxQ==
X-Google-Smtp-Source: AGHT+IFNjbadjIOemi/C4HGF9dkpGtGBHIRawNVHYOTzvIsSYmAF34Y/ES9VSmgy5Nr//KC6Hc3kYw==
X-Received: by 2002:a05:6000:402a:b0:332:c4f7:1f83 with SMTP id cp42-20020a056000402a00b00332c4f71f83mr5839057wrb.7.1700587870141;
        Tue, 21 Nov 2023 09:31:10 -0800 (PST)
Message-ID: <b75a4d31-260c-4377-b68c-c8153dfd948e@citrix.com>
Date: Tue, 21 Nov 2023 17:31:09 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/5] x86/HVM: hide SVM/VMX when their enabling is
 prohibited by firmware
Content-Language: en-GB
To: Jan Beulich <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Wei Liu <wl@xen.org>, Kevin Tian <kevin.tian@intel.com>,
 Jun Nakajima <jun.nakajima@intel.com>
References: <791a9f45-2bed-48f9-af6a-9fbde65bcc71@suse.com>
 <b16802f5-13ae-47a0-b12d-604928f4cf7e@suse.com>
 <ZVzZy-KYgdAsqRE3@macbook.local>
 <d63dfc54-cf89-44b7-ab7e-983037892833@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <d63dfc54-cf89-44b7-ab7e-983037892833@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 21/11/2023 5:27 pm, Jan Beulich wrote:
> On 21.11.2023 17:24, Roger Pau Monné wrote:
>> On Thu, Nov 16, 2023 at 02:31:05PM +0100, Jan Beulich wrote:
>>> --- a/xen/arch/x86/hvm/vmx/vmcs.c
>>> +++ b/xen/arch/x86/hvm/vmx/vmcs.c
>>> @@ -2163,6 +2163,23 @@ int __init vmx_vmcs_init(void)
>>>  
>>>      if ( !ret )
>>>          register_keyhandler('v', vmcs_dump, "dump VT-x VMCSs", 1);
>>> +    else
>>> +    {
>>> +        setup_clear_cpu_cap(X86_FEATURE_VMX);
>>> +
>>> +        /*
>>> +         * _vmx_vcpu_up() may have made it past feature identification.
>>> +         * Make sure all dependent features are off as well.
>>> +         */
>>> +        vmx_basic_msr              = 0;
>>> +        vmx_pin_based_exec_control = 0;
>>> +        vmx_cpu_based_exec_control = 0;
>>> +        vmx_secondary_exec_control = 0;
>>> +        vmx_vmexit_control         = 0;
>>> +        vmx_vmentry_control        = 0;
>>> +        vmx_ept_vpid_cap           = 0;
>>> +        vmx_vmfunc                 = 0;
>> Are there really any usages of those variables if VMX is disabled in
>> CPUID?
> I wanted to be on the safe side, as to me the question was "Are there really
> _no_ uses anywhere of those variables if VMX is disabled in CPUID?" And I
> couldn't easily convince myself of this being the case, seeing how all of
> vmcs.h's cpu_has_* are defined (and I'm pretty sure we have uses outside of
> arch/x86/hvm/vmx/).

Before you commit, are you sure that VT-d will continue to be happy
using IOMMU superpages when the EPT features are cleared like this?

That's the only linkage I'm aware of that might cause issues.

~Andrew

