Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B2953AD1A98
	for <lists+xen-devel@lfdr.de>; Mon,  9 Jun 2025 11:30:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1010198.1388353 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uOYpE-000281-Vn; Mon, 09 Jun 2025 09:29:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1010198.1388353; Mon, 09 Jun 2025 09:29:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uOYpE-00025p-T7; Mon, 09 Jun 2025 09:29:52 +0000
Received: by outflank-mailman (input) for mailman id 1010198;
 Mon, 09 Jun 2025 09:29:51 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=bnjC=YY=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1uOYpD-00025j-3q
 for xen-devel@lists.xenproject.org; Mon, 09 Jun 2025 09:29:51 +0000
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [2a00:1450:4864:20::42f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4a566e5e-4514-11f0-a304-13f23c93f187;
 Mon, 09 Jun 2025 11:29:50 +0200 (CEST)
Received: by mail-wr1-x42f.google.com with SMTP id
 ffacd0b85a97d-3a52874d593so4017516f8f.0
 for <xen-devel@lists.xenproject.org>; Mon, 09 Jun 2025 02:29:49 -0700 (PDT)
Received: from localhost (112.pool92-178-7.dynamic.orange.es. [92.178.7.112])
 by smtp.gmail.com with UTF8SMTPSA id
 ffacd0b85a97d-3a53244f07dsm9208001f8f.79.2025.06.09.02.29.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Jun 2025 02:29:48 -0700 (PDT)
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
X-Inumbo-ID: 4a566e5e-4514-11f0-a304-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1749461389; x=1750066189; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=BtrQJEnXi92/tm+p/7qv+7Zmn0bRhtMrAiRLe9dE06U=;
        b=A/rtboN7pJfhsiQPxaNs2fcI8X9cN8YXnN3uv6d/J3Emv5h1g8f5h+yzObKfZcJOTs
         s1P8xKenJAfOtjzlgFsPvVGCqMoB0/+g/qNXQTC8dPIEnNA+QL+0NonUjKeWFyxlHTZq
         F53/wPWS/1iS5vvW6hmZ9hABhC+2MUdktTi9s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749461389; x=1750066189;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=BtrQJEnXi92/tm+p/7qv+7Zmn0bRhtMrAiRLe9dE06U=;
        b=kYGKx6pci1GN4hrUZtbI32rgt3Vxy4cJXadW4w4GRfRlHYQcdB6+1anppUnJZfDo0h
         BaGcvFT+vjU56/CipDGZLFyYX2jgxR+21xojQ3sqkKboa1EQzzu0cU9oMJuNqcrHwrlN
         C2JEPJoLqGoUECBZ86oSYtihcM+I8tF9sWyaCqNOtJdzXBNUQ3/QznDAHeurz/YuAxzt
         DNbORQnRHiFupnQQE8L8qvbrL5gLO/O6lcIZZJ9a/Zk08fc+3oDUxgRSfazEJRJW9LSW
         xs+MgFDLKKAuiYYXQZZgKpA4SS34xmdU0XS6WOqgZk4n5YTB3XD5i/yuy15dNF2baQaQ
         kaTA==
X-Gm-Message-State: AOJu0Yy2cZhhVbPfV5H66qVFyKi7kCpOGDnTXBRahI+rl1CkWkKKNGQ7
	N/Wvski72ZyL91MHYsrDzU4451bTwvKrBitwKUE2Rv4NjAmF3btfwA/8gdOtQkOaRFQ=
X-Gm-Gg: ASbGncsASJdwmuOb71LHhsS67+ugubShzfT3S6eam4y/WyyJlhbdNSDRXwuJfd9ApB0
	3GnwXF1lCpIanZqr8JrKB6so0kPYqeaZsK/uraurtkVWz0IR/ZNfR/WweY39wehmm5HJVQcCby8
	zlD+PCR8kzkRZbiJRPM6EYAfOwrcbmGwtE180l1gh5u39D9ultKfUniqGwwWokgTFqk5CpV2Fg/
	BnLRJ7ucFuROIms5Xw9mk+7h80C+1tRT+wA5vQbeP7tBODbveNXzv3d4QO84z+7WMcHWOlj47Nl
	vzUSVnB05gF0AaFiA4U2bbtiHvkkSSu0tfeJMbbtBK2VvmD7un6rXlEHVqNalMkq5k0YPf/txSN
	yow2OGeckyC9LsinWRey8GePGtG40MQ==
X-Google-Smtp-Source: AGHT+IFRuvXDrPRKEOrumfu238VRd/wMQykXGd1N52ehiffAddKqSEmdyCH9HYppGPAHYjpy65JEbA==
X-Received: by 2002:a05:6000:2dc7:b0:3a3:71cb:f0bd with SMTP id ffacd0b85a97d-3a53188de8bmr9401210f8f.23.1749461389254;
        Mon, 09 Jun 2025 02:29:49 -0700 (PDT)
Date: Mon, 9 Jun 2025 11:29:48 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: "Chen, Jiqian" <Jiqian.Chen@amd.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	"Orzel, Michal" <Michal.Orzel@amd.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	"Huang, Ray" <Ray.Huang@amd.com>
Subject: Re: [PATCH v5 04/10] vpci: Refactor REGISTER_VPCI_INIT
Message-ID: <aEapjHyBxHkkylkh@macbook.local>
References: <20250526094559.140423-1-Jiqian.Chen@amd.com>
 <20250526094559.140423-5-Jiqian.Chen@amd.com>
 <aEGSp-LKerGb-wIW@macbook.local>
 <BL1PR12MB58497C341C79658B7221A67FE76EA@BL1PR12MB5849.namprd12.prod.outlook.com>
 <752cff02-cef6-4a4c-80b9-eba3bbf9b264@suse.com>
 <aEKxWLdDDyzmNvGF@macbook.local>
 <BL1PR12MB5849CA0CBDAE1E49DE54BD03E76BA@BL1PR12MB5849.namprd12.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <BL1PR12MB5849CA0CBDAE1E49DE54BD03E76BA@BL1PR12MB5849.namprd12.prod.outlook.com>

On Mon, Jun 09, 2025 at 07:50:21AM +0000, Chen, Jiqian wrote:
> On 2025/6/6 17:14, Roger Pau Monné wrote:
> > On Fri, Jun 06, 2025 at 09:05:48AM +0200, Jan Beulich wrote:
> >> On 06.06.2025 08:29, Chen, Jiqian wrote:
> >>> On 2025/6/5 20:50, Roger Pau Monné wrote:
> >>>> On Mon, May 26, 2025 at 05:45:53PM +0800, Jiqian Chen wrote: 
> >>>>> +  }; \
> >>>>> +  static vpci_capability_t *const finit##_entry  \
> >>>>> +               __used_section(".data.vpci") = &finit##_t
> >>>>
> >>>> IMO this should better use .rodata instead of .data. 
> >>> Is below change correct?
> >>>
> >>> +    static const vpci_capability_t *const finit##_entry  \
> >>> +        __used_section(".rodata") = &finit##_t
> >>
> >> No, specifically because ...
> >>
> >>>> Not that it matters much in practice, as we place it in .rodata anyway.  Note
> >>>> however you will have to move the placement of the VPCI_ARRAY in the
> >>>> linker script ahead of *(.rodata.*), otherwise that section match will
> >>>> consume the vPCI data.
> >>> I am sorry, how to move it ahead of *(.rodata.*) ?
> >>> Is below change correct?
> >>>
> >>> diff --git a/xen/include/xen/xen.lds.h b/xen/include/xen/xen.lds.h
> >>> index 793d0e11450c..3817642135aa 100644
> >>> --- a/xen/include/xen/xen.lds.h
> >>> +++ b/xen/include/xen/xen.lds.h
> >>> @@ -188,7 +188,7 @@
> >>>  #define VPCI_ARRAY               \
> >>>         . = ALIGN(POINTER_ALIGN); \
> >>>         __start_vpci_array = .;   \
> >>> -       *(SORT(.data.vpci.*))     \
> >>> +       *(.rodata)             \
> >>
> >> ... this isn't - you'd move _all_ of .rodata into here, which definitely
> >> isn't what you want. What I understand Roger meant was a .rodata-like
> >> section, e.g. .rodata.vpci.* (much like it was .data.vpci.* before).
> > 
> > Indeed, my suggestion was merely to use .rodata instead of .data, as
> > that's more accurate IMO.  I think it should be *(.rodata.vpci) (and
> > same section change for the __used_section() attribute.
> 
> If I understand correctly, the next version will be:
> 
> +    static const vpci_capability_t *const finit##_entry  \
> +        __used_section(".rodata.vpci") = &finit##_t
> +
> 
> and
> 
>  #define VPCI_ARRAY               \
>         . = ALIGN(POINTER_ALIGN); \
>         __start_vpci_array = .;   \
> -       *(SORT(.data.vpci.*))     \
> +       *(.rodata.vpci)           \
>         __end_vpci_array = .;

Did you also move the instances of VPCI_ARRAY in the linker scripts so
it's before the catch-all *(.rodata.*)?

> 
> But, that encountered an warning when compiling.
> " {standard input}: Assembler messages:
> {standard input}:1160: Warning: setting incorrect section attributes for .rodata.vpci
> {standard input}: Assembler messages:
> {standard input}:3034: Warning: setting incorrect section attributes for .rodata.vpci
> {standard input}: Assembler messages:
> {standard input}:6686: Warning: setting incorrect section attributes for .rodata.vpci "

What are the attributes for .rodata.vpci in the object files?  You can
get those using objdump or readelf, for example:

$ objdump -h xen/drivers/vpci/msi.o
[...]
 17 .data.vpci.9  00000008  0000000000000000  0000000000000000  00000a50  2**3
                  CONTENTS, ALLOC, LOAD, RELOC, DATA

It should be READONLY, otherwise you will get those messages.

> And, during booting Xen, all value of __start_vpci_array is incorrect.
> Do I miss anything?

I think that's likely because you haven't moved the instance of
VPCI_ARRAY in the linker script?

Thanks, Roger.

