Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 43C90962409
	for <lists+xen-devel@lfdr.de>; Wed, 28 Aug 2024 11:54:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.784618.1194023 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sjFNV-0006ll-Mf; Wed, 28 Aug 2024 09:54:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 784618.1194023; Wed, 28 Aug 2024 09:54:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sjFNV-0006hh-Ic; Wed, 28 Aug 2024 09:54:13 +0000
Received: by outflank-mailman (input) for mailman id 784618;
 Wed, 28 Aug 2024 09:54:11 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=mQTD=P3=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1sjFNT-0006Cg-Ob
 for xen-devel@lists.xenproject.org; Wed, 28 Aug 2024 09:54:11 +0000
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com
 [2a00:1450:4864:20::534])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 79abd2a3-6523-11ef-a0b0-8be0dac302b0;
 Wed, 28 Aug 2024 11:54:11 +0200 (CEST)
Received: by mail-ed1-x534.google.com with SMTP id
 4fb4d7f45d1cf-5bede548f7cso7475532a12.2
 for <xen-devel@lists.xenproject.org>; Wed, 28 Aug 2024 02:54:11 -0700 (PDT)
Received: from [10.125.226.166] ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5c0bb471dfdsm2020321a12.60.2024.08.28.02.54.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 28 Aug 2024 02:54:09 -0700 (PDT)
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
X-Inumbo-ID: 79abd2a3-6523-11ef-a0b0-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1724838851; x=1725443651; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=A/ZefStMd0MSIlj+zM8LvXm5uBaBJjURoHOaiqWbMyM=;
        b=D0sdPs60f6FiA+xq93QORtHBqu+GypvqF3m6ZUIUKBo8JplvNoj1jkUuKT84erLC5Q
         bCkbmIG+wNliJ9Ojup3IWTrPkSM5vC9IvarUuBW+JJngkSPPrcTlKmQlpSt6D2Wudv94
         oycZY/k6UeZ7lTI+q2g8nXf5KJzOWk3yxc5h4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724838851; x=1725443651;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=A/ZefStMd0MSIlj+zM8LvXm5uBaBJjURoHOaiqWbMyM=;
        b=PHTkoaMamyLHpfDVDWWguXaeDLH9+/WRxD92OGGDCzx9uLi6hITlp24x2cnWqMnw0y
         vSRWqcjKL2kqKuFIw1hK/eSWZaIiFHP8iLyeH+W+Ao41uDqXQhCeX6Yq2tRHnMWlg/ul
         MEw9VXcZmW/OXBIOJZCdSCp9DYdf4WpO7DTTe0+kcDCAOtI76ciOIT/ymWXFmg2iBDM9
         6196upE/5+qWSrJq6GY0J7BKzkvZ0dK78CaotLZ7HATRokYLIln5S4zAjsQLzESF/WYV
         AHZoFjDBQ+gZRqsVjHKUz1K8EEPfaypLoXxHLltjYC1RVFiggvZ0AjpbgZ5NGvz3sM5S
         Vbcw==
X-Gm-Message-State: AOJu0Ywz62jAmEvgWTu5n5AU/OLJIzy6e8HFcg5YGdWB5AmOW4i7sgVi
	cI0qLmo5WDaZQr8AAztBkLwYG104nXufznV4+N3mNrThRaBKc2vuEIU3wnG0Wq0=
X-Google-Smtp-Source: AGHT+IFANIwBJEVOur10Q3EJpoal7hxcl64tbj3dU1WE7ke0Tk4gnwmvQ/sx2Eq1EDt6nE+wgxqcQA==
X-Received: by 2002:a05:6402:2350:b0:5be:ee30:9948 with SMTP id 4fb4d7f45d1cf-5c08915ba45mr11543060a12.8.1724838850295;
        Wed, 28 Aug 2024 02:54:10 -0700 (PDT)
Message-ID: <94456289-dad1-4fa8-98ad-1012a8ddc779@citrix.com>
Date: Wed, 28 Aug 2024 10:54:08 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5] x86/dom0: disable SMAP for PV domain building only
To: Jan Beulich <jbeulich@suse.com>, Roger Pau Monne <roger.pau@citrix.com>
Cc: xen-devel@lists.xenproject.org
References: <20240827123949.24400-1-roger.pau@citrix.com>
 <77276161-2fcc-4527-87ba-0ef5988ff82a@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <77276161-2fcc-4527-87ba-0ef5988ff82a@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 28/08/2024 10:49 am, Jan Beulich wrote:
> On 27.08.2024 14:39, Roger Pau Monne wrote:
>> --- a/xen/arch/x86/dom0_build.c
>> +++ b/xen/arch/x86/dom0_build.c
>> @@ -612,7 +612,24 @@ int __init construct_dom0(struct domain *d, const module_t *image,
>>      if ( is_hvm_domain(d) )
>>          rc = dom0_construct_pvh(d, image, image_headroom, initrd, cmdline);
>>      else if ( is_pv_domain(d) )
>> +    {
>> +        /*
>> +         * Temporarily clear SMAP in CR4 to allow user-accesses in
>> +         * construct_dom0().  This saves a large number of corner cases
>> +         * interactions with copy_from_user().
>> +         */
>> +        if ( boot_cpu_has(X86_FEATURE_XEN_SMAP) )
>> +        {
>> +            cr4_pv32_mask &= ~X86_CR4_SMAP;
>> +            write_cr4(read_cr4() & ~X86_CR4_SMAP);
>> +        }
>>          rc = dom0_construct_pv(d, image, image_headroom, initrd, cmdline);
>> +        if ( boot_cpu_has(X86_FEATURE_XEN_SMAP) )
>> +        {
>> +            write_cr4(read_cr4() | X86_CR4_SMAP);
>> +            cr4_pv32_mask |= X86_CR4_SMAP;
>> +        }
>> +    }
> Andrew, looking at this code I really wonder what benefit you request to
> move this further is going to have. Afaict no matter where we put it, it'll
> be an #ifdef around each of the two accesses to cr4_pv32_mask when we make
> that variable CONFIG_PV32-only.

This TU is common to PV and HVM, meaning that this logic inspecting
XEN_SMAP and playing with cr4 is included even in !PV builds.

Having it all in x86/pv/dom0_build.c means it will be dropped in a !PV
build.

~Andrew

