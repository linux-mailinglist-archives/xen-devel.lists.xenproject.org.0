Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 921207F32AD
	for <lists+xen-devel@lfdr.de>; Tue, 21 Nov 2023 16:48:22 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.637922.994024 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r5Sz1-0003Ds-3s; Tue, 21 Nov 2023 15:48:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 637922.994024; Tue, 21 Nov 2023 15:48:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r5Sz1-0003CB-12; Tue, 21 Nov 2023 15:48:15 +0000
Received: by outflank-mailman (input) for mailman id 637922;
 Tue, 21 Nov 2023 15:48:13 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=MZRi=HC=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1r5Syz-0003Bn-Jt
 for xen-devel@lists.xenproject.org; Tue, 21 Nov 2023 15:48:13 +0000
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com
 [2a00:1450:4864:20::22b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5fd200d3-8885-11ee-9b0e-b553b5be7939;
 Tue, 21 Nov 2023 16:48:11 +0100 (CET)
Received: by mail-lj1-x22b.google.com with SMTP id
 38308e7fff4ca-2c88750e7d1so20912981fa.3
 for <xen-devel@lists.xenproject.org>; Tue, 21 Nov 2023 07:48:11 -0800 (PST)
Received: from localhost ([213.195.113.99]) by smtp.gmail.com with ESMTPSA id
 p4-20020a05600c468400b00405959bbf4fsm17643150wmo.19.2023.11.21.07.48.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Nov 2023 07:48:10 -0800 (PST)
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
X-Inumbo-ID: 5fd200d3-8885-11ee-9b0e-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1700581691; x=1701186491; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=HqIFDC7sw9FrFrkiQN6BhvfYvQBHh1SHDXc9ULlRUL8=;
        b=MSZyFd4PA4M/FgsziFQkPmxx2nZMIBz7Z2sMq2wWToge/JjM7na8YpGexKcvbOBijQ
         +Zpp9gG1g4ufDkL/O0Xj2IpCqAcblVpJtMDISKlUAeEis5aAm7CWMUPhV89kvmqaBinW
         Xdt3LoZPclO/5NnciKAwKiNVrdmQvPbvQ9fIY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700581691; x=1701186491;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=HqIFDC7sw9FrFrkiQN6BhvfYvQBHh1SHDXc9ULlRUL8=;
        b=P9TP6s4WpkwNX6uJv9wZJwOapnt1Lv9KwThGtX2M5shIt4S1u0WTwR9kPkjdkcWMgZ
         +XEGdXpa0tDEo6zsfAHnNMa1ndBefVNxjfb8wTp9Z7EM30pRcnf+M28tO+45jAnReod0
         qIUUH+zbotP3gpMKjLQAyP/K2QO3dT5UQwAwyICwhi7p4i9uMEl8xRlNgbilVL4/jMmI
         k5lSbF3/kgXpJVF3qRuDUZAU2jOLXtZ54qkHCJnxqHLnkVoAc8/83gQZGjhBpcNyK5hI
         +8RVnsdh8UW6XVJi8Vr6bh2uxMXKvwkfZYA9potWBYWI5vCfb2XpKmvDmanyWMMUMcC9
         YqFg==
X-Gm-Message-State: AOJu0YyNsKJVrkgdbS28qtTOf9tpUu7raHfypeBlQXev9ZPOjyUHhbRS
	mwcGxFdPeKPzWbZ6C9HaV83B7Q==
X-Google-Smtp-Source: AGHT+IEaKtrk9t/a08zPYEN191u5MGbb8/k5FVQr9Izc6FtTnlM5aHANZK8JHE6zVJ2w+lAfVYOdHQ==
X-Received: by 2002:a05:651c:1507:b0:2c8:8ba8:afa7 with SMTP id e7-20020a05651c150700b002c88ba8afa7mr1675228ljf.39.1700581691015;
        Tue, 21 Nov 2023 07:48:11 -0800 (PST)
Date: Tue, 21 Nov 2023 16:48:09 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
	Kevin Tian <kevin.tian@intel.com>,
	Jun Nakajima <jun.nakajima@intel.com>
Subject: Re: [PATCH 1/5] VMX: drop vmx_virt_exception and make vmx_vmfunc
 static
Message-ID: <ZVzROZu9Afs-mEah@macbook.local>
References: <791a9f45-2bed-48f9-af6a-9fbde65bcc71@suse.com>
 <fd9d6043-4877-4156-97d9-4bdf7cc8fe04@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <fd9d6043-4877-4156-97d9-4bdf7cc8fe04@suse.com>

On Thu, Nov 16, 2023 at 02:30:41PM +0100, Jan Beulich wrote:
> The variable was introduced by 69b830e5ffb4 ("VMX: VMFUNC and #VE
> definitions and detection") without any use and - violating Misra C:2012
> rule 8.4 - without a declaration. Since no use has appeared, drop it.
> 
> For vmx_vmfunc the situation is similar, but not identical: It at least
> has one use. Convert it to be static (and make style adjustments while
> there).

I think you could also remove the sole user of vmx_vmfunc, as it's
just a cap_check() usage (unless there are more hidden usages).

> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Acked-by: Roger Pau Monné <roger.pau@citrix.com>

> ---
> In how far the sole vmx_vmfunc use is actually meaningful (on its own)
> I'm not really sure.
> 
> --- a/xen/arch/x86/hvm/vmx/vmcs.c
> +++ b/xen/arch/x86/hvm/vmx/vmcs.c
> @@ -167,8 +167,7 @@ u32 vmx_secondary_exec_control __read_mo
>  u32 vmx_vmexit_control __read_mostly;
>  u32 vmx_vmentry_control __read_mostly;
>  u64 vmx_ept_vpid_cap __read_mostly;
> -u64 vmx_vmfunc __read_mostly;
> -bool_t vmx_virt_exception __read_mostly;
> +static uint64_t __read_mostly vmx_vmfunc;

I'm quite sure this should be __ro_after_init, but I guess we cannot
be sure give the current code in vmx_init_vmcs_config().

Any CPU hot plugged that has a different set of VMX controls should
not be onlined, the more that migrating an already running VMCS to
such CPU will lead to failures if non-supported features are used.

Thanks, Roger.

