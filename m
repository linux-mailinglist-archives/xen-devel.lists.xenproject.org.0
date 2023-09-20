Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 96EF07A8AF0
	for <lists+xen-devel@lfdr.de>; Wed, 20 Sep 2023 19:55:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.605863.943466 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qj1Pm-0005b4-Qa; Wed, 20 Sep 2023 17:55:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 605863.943466; Wed, 20 Sep 2023 17:55:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qj1Pm-0005Yt-Mr; Wed, 20 Sep 2023 17:55:06 +0000
Received: by outflank-mailman (input) for mailman id 605863;
 Wed, 20 Sep 2023 17:55:06 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=tFM0=FE=redhat.com=pbonzini@srs-se1.protection.inumbo.net>)
 id 1qj1Pm-0005Yn-4s
 for xen-devel@lists.xenproject.org; Wed, 20 Sep 2023 17:55:06 +0000
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d2e4f336-57de-11ee-8789-cb3800f73035;
 Wed, 20 Sep 2023 19:55:03 +0200 (CEST)
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-669-JviK83i-NoeIcukGngaZAg-1; Wed, 20 Sep 2023 13:54:59 -0400
Received: by mail-wm1-f70.google.com with SMTP id
 5b1f17b1804b1-3f5df65f9f4so570605e9.2
 for <xen-devel@lists.xenproject.org>; Wed, 20 Sep 2023 10:54:58 -0700 (PDT)
Received: from ?IPV6:2001:b07:6468:f312:9af8:e5f5:7516:fa89?
 ([2001:b07:6468:f312:9af8:e5f5:7516:fa89])
 by smtp.googlemail.com with ESMTPSA id
 g7-20020a05600c310700b003fe15ac0934sm1501378wmo.1.2023.09.20.10.54.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 20 Sep 2023 10:54:54 -0700 (PDT)
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
X-Inumbo-ID: d2e4f336-57de-11ee-8789-cb3800f73035
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1695232502;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=h5xYFinNZipHsHGmHUqZFR1epFlz8wPv/8ryGu1Ybe8=;
	b=RUdhs6NCZArzN5tmhbMls6Ei3DrhYhtrd+xrjh63tN8PIUL4cBIEIXXGCVrPQuBFu8t1/+
	3rtTKT2y5jXsUDpxtoaoLBmkvxBoXJ4qW7niW+XLJNbyFM0EbD9ElnFHW1A7Oq7aOgDjOM
	816KRapTtghDKkr5frY7YmJNF3f5W/4=
X-MC-Unique: JviK83i-NoeIcukGngaZAg-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695232498; x=1695837298;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=h5xYFinNZipHsHGmHUqZFR1epFlz8wPv/8ryGu1Ybe8=;
        b=FrPzlPrreDTyQcR1SIgMI3TndC43TYmBeNvMXjHu2jO5NH8AeCey+oDXmOmURafY3h
         v5UtLUWgXL9xC95x+kY5pCndJONybVyNUpHVndwhDjY7FZVyGMPCAx09Yow4D6aI3B3O
         TrCA+2Gsaq4e68szN23iOPuLDT51adqlECDW8WKGrBWCgNYslsiU+JUGGvcP8HEeMpkm
         MFcx01/xqpkIdnNS8ac37f+I5IJgmc+RTRt1QHWm5b1w6Zc5qGcjqqE8YUY3k74gc3NI
         WHnpxG2NE2sjmMOWcI5OM+RKi/uM5mKWADzoruYq3n5wubKsE51B3hUHimzpZ0VLwtvq
         HEWw==
X-Gm-Message-State: AOJu0YxVS3tnK+UkOsd+PEuFBjTyBOTxXynAjJ8kOZBQ4o855Idq+VJi
	BMTpy5aUQqkhDIIS6F5jTroSMkTObwC/hTO7/009U1ELzpg6LJEApMTttYShIA+cjAI7U0TAsG+
	MvxOxiij90os591FWLBEW7TjNhAY=
X-Received: by 2002:a7b:ce88:0:b0:400:57d1:4910 with SMTP id q8-20020a7bce88000000b0040057d14910mr3302432wmj.17.1695232497846;
        Wed, 20 Sep 2023 10:54:57 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHnadv5Rrllbv+1DebvWmStjUdr36msQ4bItIjpfqmG73HPxauN1Zj4NCrq5iVMGFuoky2thA==
X-Received: by 2002:a7b:ce88:0:b0:400:57d1:4910 with SMTP id q8-20020a7bce88000000b0040057d14910mr3302418wmj.17.1695232497523;
        Wed, 20 Sep 2023 10:54:57 -0700 (PDT)
Message-ID: <facdf62c-d0b4-597d-a85d-5772ecaa2b86@redhat.com>
Date: Wed, 20 Sep 2023 19:54:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v10 33/38] x86/entry: Add fred_entry_from_kvm() for VMX to
 handle IRQ/NMI
To: Xin Li <xin3.li@intel.com>, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-edac@vger.kernel.org,
 linux-hyperv@vger.kernel.org, kvm@vger.kernel.org,
 xen-devel@lists.xenproject.org
Cc: tglx@linutronix.de, mingo@redhat.com, bp@alien8.de,
 dave.hansen@linux.intel.com, x86@kernel.org, hpa@zytor.com, luto@kernel.org,
 seanjc@google.com, peterz@infradead.org, jgross@suse.com,
 ravi.v.shankar@intel.com, mhiramat@kernel.org, andrew.cooper3@citrix.com,
 jiangshanlai@gmail.com
References: <20230914044805.301390-1-xin3.li@intel.com>
 <20230914044805.301390-34-xin3.li@intel.com>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <20230914044805.301390-34-xin3.li@intel.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/14/23 06:48, Xin Li wrote:
> +	/*
> +	 * Don't check the FRED stack level, the call stack leading to this
> +	 * helper is effectively constant and shallow (relatively speaking).

It's more that we don't need to protect from reentrancy.  The external 
interrupt uses stack level 0 so no adjustment would be needed anyway, 
and NMI does not use an IST even in the non-FRED case.

> +	 * Emulate the FRED-defined redzone and stack alignment.
> +	 */
> +	sub $(FRED_CONFIG_REDZONE_AMOUNT << 6), %rsp
> +	and $FRED_STACK_FRAME_RSP_MASK, %rsp


