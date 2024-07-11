Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A216192E4FF
	for <lists+xen-devel@lfdr.de>; Thu, 11 Jul 2024 12:45:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.757292.1166110 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sRrIj-0000WW-At; Thu, 11 Jul 2024 10:45:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 757292.1166110; Thu, 11 Jul 2024 10:45:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sRrIj-0000UI-7t; Thu, 11 Jul 2024 10:45:25 +0000
Received: by outflank-mailman (input) for mailman id 757292;
 Thu, 11 Jul 2024 10:45:24 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=PZf6=OL=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1sRrIh-0000UB-Td
 for xen-devel@lists.xenproject.org; Thu, 11 Jul 2024 10:45:23 +0000
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [2a00:1450:4864:20::62f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ac150b98-3f72-11ef-8776-851b0ebba9a2;
 Thu, 11 Jul 2024 12:45:21 +0200 (CEST)
Received: by mail-ej1-x62f.google.com with SMTP id
 a640c23a62f3a-a77d85f7fa3so112254066b.0
 for <xen-devel@lists.xenproject.org>; Thu, 11 Jul 2024 03:45:21 -0700 (PDT)
Received: from [10.125.226.166] ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a780a8720f9sm243479566b.220.2024.07.11.03.45.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 11 Jul 2024 03:45:20 -0700 (PDT)
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
X-Inumbo-ID: ac150b98-3f72-11ef-8776-851b0ebba9a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1720694721; x=1721299521; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=wikxxdCb9UCsdQjqlshXnpsF/3EIayZ/9SmNUo1kJbo=;
        b=IY4becxGMK5cSCEnr5mk1NcaG3HxQWlR7DDw9lViwLdlhihysMC3bSeV4KPDGZ9HQe
         hloE1p3Q//JZ4qdMAKimr3Vi6m8ip2xKSamvSHKpqGV3cjVtZlIMORnE7Bkpqy+MBt0r
         +PhwlgEHYn7XXSDoP2X96dm/xFagAM9yMBhkM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720694721; x=1721299521;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wikxxdCb9UCsdQjqlshXnpsF/3EIayZ/9SmNUo1kJbo=;
        b=lFbXxszZFwMDr8J3cK5+dq64vC9k6H/7VDicM4M+Ud/DSFPsBcrbUxhbLNzlpC4qKd
         Cgsr1KtHTWWDgZmiyhmRjRl1Da1iX6l2r5rCFWqP7DgkFt2XXIBMIHb6IfnKZrw63FlZ
         PCha56D8HmLrTVp8AOEUin+snF/yXnfXaHd4N5ZJOsuVgxmJuulE5suU6+hxh6j5Bbxi
         7r0PKDPweLa0rmeCHAkf5UtSUgpgWdMhHm9WvkfuNTDkgTMuxybGyxf/hiNZH3njnG2Z
         Z4gAJJ4O8Al0coitKqy5ct+e725Lifj13ax2lese2Ksh3cjQW4YH54WWEvtejz80PjmD
         /4Aw==
X-Forwarded-Encrypted: i=1; AJvYcCXXBbJByWaaJW5zymfjJr4v8ZdE/jUcA7vXro1WEooT9L8yxcxT8hQmA6ImqqdoLuUyVh/2wkqUYXjt+Q27/2Pw4IvV1eSBXfR1Swt9RRY=
X-Gm-Message-State: AOJu0YzD7GcaFrCgmHo7iH7hnhVbLtELWSdr7OHb59+cUJacTqrAHLr8
	Q1X19nbVj+4wmsLBXDThEfM0SLTr5E+8rhQji6aZreWtV6OX/2Gppr7tLw8G5QZt2ipdhQV/gFg
	U
X-Google-Smtp-Source: AGHT+IHFPxc443TVJPtML3CXLnW2sd4exU+dp5p1EkEp++Hf2WaULk1Nz9gJYtUC7aVMRKd4ZYiAGw==
X-Received: by 2002:a17:906:d19a:b0:a72:8c53:1798 with SMTP id a640c23a62f3a-a798a487a73mr166563166b.30.1720694721231;
        Thu, 11 Jul 2024 03:45:21 -0700 (PDT)
Message-ID: <94e94a94-14f2-4fa6-bc3b-6c64c1b84b59@citrix.com>
Date: Thu, 11 Jul 2024 11:45:18 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Help with Understanding vcpu xstate restore error during vm
 migration
To: Fonyuy-Asheri Caleb <fonyuy-asheri.caleb@inria.fr>,
 xen-devel <xen-devel@lists.xenproject.org>
References: <60751777.2038091.1720694327760.JavaMail.zimbra@inria.fr>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <60751777.2038091.1720694327760.JavaMail.zimbra@inria.fr>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 11/07/2024 11:38 am, Fonyuy-Asheri Caleb wrote:
> Hello, 
> 
> I am trying to understand the causes of the vcpu xstate restore error
> during live migration.
> I get the following error during live migration: 
> 
> xc: error: Failed to set vcpu0's xsave info (22 = Invalid argument):
> Internal error
> 
> I was able to locate the failure point to the file
> xen/arch/x86/domctl.c  with the following check.
> 
> if( evc->size<PV_XSAVE_HDR_SIZE||
> evc->size>PV_XSAVE_SIZE(xfeature_mask) )
> gotovcpuextstate_out;
> 
> I know this is related to the number of xstates handled by the source
> server. Please can 
> someone explain to me how these states are computed? 
> 
> I earlier thought it was simply the number xsave dependent features on
> the CPU but it seems
> to be more than that. 
> 
> Thanks in advance.

It is certainly more complicated than that.

What that's saying is that Xen doesn't think that the size of the blob
matches expectations.  That said - I'm in the middle of rewriting this
logic because lots of it is subtly wrong.

To start with, which version (or versions?) of Xen, and what hardware?

Are you able to capture `xen-cpuid -p` on the source and destination, as
well as `xen-cpuid -p $domid` of the VM running on the source?

Do you have any CPUID overrides in the VM config file?

Thanks,

~Andrew

