Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 09370845E33
	for <lists+xen-devel@lfdr.de>; Thu,  1 Feb 2024 18:11:18 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.674587.1049662 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rVaaQ-0002hS-Ex; Thu, 01 Feb 2024 17:10:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 674587.1049662; Thu, 01 Feb 2024 17:10:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rVaaQ-0002fK-CE; Thu, 01 Feb 2024 17:10:50 +0000
Received: by outflank-mailman (input) for mailman id 674587;
 Thu, 01 Feb 2024 17:10:48 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=cAD+=JK=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1rVaaO-0002fC-Nk
 for xen-devel@lists.xenproject.org; Thu, 01 Feb 2024 17:10:48 +0000
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [2a00:1450:4864:20::62a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d7b13bb1-c124-11ee-8a43-1f161083a0e0;
 Thu, 01 Feb 2024 18:10:47 +0100 (CET)
Received: by mail-ej1-x62a.google.com with SMTP id
 a640c23a62f3a-a3566c0309fso158463466b.1
 for <xen-devel@lists.xenproject.org>; Thu, 01 Feb 2024 09:10:47 -0800 (PST)
Received: from localhost ([213.195.118.74]) by smtp.gmail.com with ESMTPSA id
 xa14-20020a170907b9ce00b00a34ae71e58dsm7473352ejc.147.2024.02.01.09.10.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 01 Feb 2024 09:10:46 -0800 (PST)
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
X-Inumbo-ID: d7b13bb1-c124-11ee-8a43-1f161083a0e0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1706807447; x=1707412247; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=510KNn1Q+2goZvYgFG10wKrbP7MgTGvopo6XgmHSduA=;
        b=c511vmQT8O1jGlO0HNVMWgEU0bMSxc9Q1AYxGALHb5wOUvaggjdSpg/Z+F+CnTmL/0
         tS2lfxlHJANGcegZ3PMp0AsweM0tQt+vxOOO01cCK6wQfaILfrV3ZX3IUERkDbV/zH0l
         YIs/I1CMmgAj9M9EoXBib43Bfd3+zhtinKYVY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706807447; x=1707412247;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=510KNn1Q+2goZvYgFG10wKrbP7MgTGvopo6XgmHSduA=;
        b=Q6OQNQKpyFHqKhVVLL1nca+V2txI4zW5pkrmTWqjGRfv66+XkUZhoiS/iKUaPNTsZr
         a5DVDnBA2/3wEDYI94gB7xFsoRZz9iouNFdIVjxhMyYutZ8XKsrxHjGWLcAITZDYh4SN
         fa2nbF8aAlpQ3872Taq0UPw4aZz6qYUVQUhzuYaHjPLK5tZs1omlmrY7z2dE8AXWEFi9
         LJsx5Qn7BpNujygJeyjFhVMKRuqU2qLhGhHkAy1LOJhbmAe4qrM6PVJ/PHx/1awNvaQy
         BU77abXQKekXOrgqvIAlik4ZEW068pS/zoyCnJirUFhPQzUHRRU52P/4o6O7oo+Zuv6H
         hdmg==
X-Gm-Message-State: AOJu0Yx4kCy+4VaAcoNJxXBLwpCRjDhIYaQyqCXjoq42QBec+s7218Hc
	Dyzw+EsV9M7C4uqb7ORPHh5Fwuq8PK9k2KvukJJ5U2prviHr+etMQp8scq5LnqU=
X-Google-Smtp-Source: AGHT+IGMB8bk+RwtbqA2kw8RFjlZrVHfrfFT0UtQLSx8nX7wXIHIn6m63pkC0HTAArmKFfW7Xxq61A==
X-Received: by 2002:a17:906:491a:b0:a36:34c7:21a5 with SMTP id b26-20020a170906491a00b00a3634c721a5mr3836938ejq.22.1706807447306;
        Thu, 01 Feb 2024 09:10:47 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCW3rj632b4k6Bly38eru1TfMXrU1Brj/DVB1CG1KkVRxwmfU+NLcJSgsyEWaPQjVgQmnD9E7P+s7lIa61S0YJvXamPbo/Ah8Ik+43p9BIu+4zJ5kZTcWnsxDLKHdQy2tw0QRBFyZhGd2XVcV5og0TTegfh0fOp1Ydj3IIU4/MqxEMaUUs1SiMGV
Date: Thu, 1 Feb 2024 18:10:46 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Wei Liu <wl@xen.org>, Kevin Tian <kevin.tian@intel.com>,
	Jun Nakajima <jun.nakajima@intel.com>
Subject: Re: [PATCH v4 3/8] VMX: tertiary execution control infrastructure
Message-ID: <ZbvQlrj7u-bwoVzy@macbook>
References: <9dd23064-c79e-4a50-9c71-c0e73b189944@suse.com>
 <aa553449-888f-4e52-85b7-0bc0b7f010b4@suse.com>
 <ZbuFc-ha-iv6B9ui@macbook>
 <56822f9c-6156-4652-9de1-3d599e22c51a@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <56822f9c-6156-4652-9de1-3d599e22c51a@suse.com>

On Thu, Feb 01, 2024 at 01:09:11PM +0100, Jan Beulich wrote:
> On 01.02.2024 12:50, Roger Pau Monné wrote:
> > On Thu, Jan 11, 2024 at 10:00:10AM +0100, Jan Beulich wrote:
> >> @@ -503,6 +538,9 @@ static int vmx_init_vmcs_config(bool bsp
> >>              "Secondary Exec Control",
> >>              vmx_secondary_exec_control, _vmx_secondary_exec_control);
> >>          mismatch |= cap_check(
> >> +            "Tertiary Exec Control",
> >> +            vmx_tertiary_exec_control, _vmx_tertiary_exec_control);
> > 
> > I know it's done to match the surrounding style, but couldn't you move
> > the name parameter one line up, and then limit the call to two lines?
> > 
> > (I don't think it will compromise readability).
> 
> You mean like this:
> 
>         mismatch |= cap_check("Tertiary Exec Control",
>             vmx_tertiary_exec_control, _vmx_tertiary_exec_control);
> 
> ? No, I view this as a mix of two possible styles. If the string literal
> was moved up, the other legitimate style would only be
> 
>         mismatch |= cap_check("Tertiary Exec Control",
>                               vmx_tertiary_exec_control,
>                               _vmx_tertiary_exec_control);
> 
> aiui (again extending over 3 lines). Yet none of this is written down
> anywhere.
> 
> But anyway - consistency with surrounding code trumps here, I think.

I was hoping it could still fit on 2 lines, but if you need 3 never
mind then.

> >> @@ -2068,10 +2111,12 @@ void vmcs_dump_vcpu(struct vcpu *v)
> >>                 vmr(HOST_PERF_GLOBAL_CTRL));
> >>  
> >>      printk("*** Control State ***\n");
> >> -    printk("PinBased=%08x CPUBased=%08x SecondaryExec=%08x\n",
> >> +    printk("PinBased=%08x CPUBased=%08x\n",
> >>             vmr32(PIN_BASED_VM_EXEC_CONTROL),
> >> -           vmr32(CPU_BASED_VM_EXEC_CONTROL),
> >> -           vmr32(SECONDARY_VM_EXEC_CONTROL));
> >> +           vmr32(CPU_BASED_VM_EXEC_CONTROL));
> >> +    printk("SecondaryExec=%08x TertiaryExec=%08lx\n",
> > 
> > For consistency, shouldn't TertiaryExec use 016 instead of 08 (as it's
> > a 64bit filed).
> 
> Perhaps, assuming we'll gets bits 32 and populated sooner or later.
> However, I view 16-digit literal numbers as hard to read, so I'd be
> inclined to insert a separator (e.g. an underscore) between the low
> and high halves. Thoughts?

Works for me.

Thanks, Roger.

