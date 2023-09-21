Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F261F7A944E
	for <lists+xen-devel@lfdr.de>; Thu, 21 Sep 2023 14:39:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.606407.944296 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qjIxQ-0000ww-5T; Thu, 21 Sep 2023 12:39:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 606407.944296; Thu, 21 Sep 2023 12:39:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qjIxQ-0000uD-2W; Thu, 21 Sep 2023 12:39:00 +0000
Received: by outflank-mailman (input) for mailman id 606407;
 Thu, 21 Sep 2023 12:38:58 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=k/An=FF=redhat.com=pbonzini@srs-se1.protection.inumbo.net>)
 id 1qjIxO-0000u7-Et
 for xen-devel@lists.xenproject.org; Thu, 21 Sep 2023 12:38:58 +0000
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d44073b5-587b-11ee-878a-cb3800f73035;
 Thu, 21 Sep 2023 14:38:57 +0200 (CEST)
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-68-66Xh11FxNqiEJpGAa8yxWw-1; Thu, 21 Sep 2023 08:38:52 -0400
Received: by mail-wm1-f72.google.com with SMTP id
 5b1f17b1804b1-3fd0fa4d08cso6886865e9.1
 for <xen-devel@lists.xenproject.org>; Thu, 21 Sep 2023 05:38:52 -0700 (PDT)
Received: from ?IPV6:2001:b07:6468:f312:9af8:e5f5:7516:fa89?
 ([2001:b07:6468:f312:9af8:e5f5:7516:fa89])
 by smtp.googlemail.com with ESMTPSA id
 c12-20020adfed8c000000b0032179c4a46dsm1650846wro.100.2023.09.21.05.38.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 21 Sep 2023 05:38:50 -0700 (PDT)
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
X-Inumbo-ID: d44073b5-587b-11ee-878a-cb3800f73035
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1695299935;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=jkSn+PxPk9HUDFePBeJ+qJj/mQ3EC7rJPAPt5aKMVQM=;
	b=Zqkwp7dX9YxjJ4LSgYDDprHVAhqJcqGt+EFJ3KDvfm2eeHmnlZoymxfAryo/ERkgVyF1Iv
	Rqh34QN2cokEMFmPfauR3ipwwIXT+zhpZjnZrafcrlXKTJkWA0yoTlOK5lX+hDTiMFvtcU
	C7d7JyubVmO7U/UbnI08TvnkubxGSfw=
X-MC-Unique: 66Xh11FxNqiEJpGAa8yxWw-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695299931; x=1695904731;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jkSn+PxPk9HUDFePBeJ+qJj/mQ3EC7rJPAPt5aKMVQM=;
        b=D1gYhqGxQ+DjVN8aDhipq2AW1iWSZNaX/HW/6g4xwhL57x1qUvCKrYJ/0AEk8T35Km
         mJbu3gV8ukyUwpimfL95MA7Bvpmkv5z3+H8pAVwjN5hGxu6kFkZlX0nckMse0uAp+ZyG
         WIFSLtoA54iYXcBv838xBo1G8iiR7ch50WXw0AHQFe4cAsEelDl6kaF71bTdmrtPN+mU
         brYfbBdx3DghpoSbTvdp4GBxZxHVHnP3tTikmHwXnKLegi9uxFZGV6yApFZUYpjIhPpW
         Oxkx9XeVp7Jw5PnXwh4ST6L/DiUwbrPlqVsUbBpEpUCUG4NUHEhCa9MU9JWwqopcr/pw
         KeYw==
X-Gm-Message-State: AOJu0Ywu5DeqEMTLInr4/Cg7DtczvRtgSWbTBC6YT5LNQX8PFRZxEzGA
	HgVvbJvLBEuig5Tu2Z/l0Nr1Q32HxbDwxTPA97RMtOyNat6WxvPZuULyi5wbVaOZ35EAia7WzHb
	RiR5hDd1G39jEDeb+qceSx3Bp17g=
X-Received: by 2002:a05:600c:2218:b0:3fe:d7c8:e0d with SMTP id z24-20020a05600c221800b003fed7c80e0dmr5342826wml.34.1695299931204;
        Thu, 21 Sep 2023 05:38:51 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFiI3gcW3I+u5Eo8SPNcaANg2683MWXN2khdedOCHDWhlltohFDz1lgyBkB4z+3k5LCX1UlHw==
X-Received: by 2002:a05:600c:2218:b0:3fe:d7c8:e0d with SMTP id z24-20020a05600c221800b003fed7c80e0dmr5342805wml.34.1695299930876;
        Thu, 21 Sep 2023 05:38:50 -0700 (PDT)
Message-ID: <9d2cccad-16ee-abcf-5a34-7e513a050229@redhat.com>
Date: Thu, 21 Sep 2023 14:38:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v10 33/38] x86/entry: Add fred_entry_from_kvm() for VMX to
 handle IRQ/NMI
To: Nikolay Borisov <nik.borisov@suse.com>, Xin Li <xin3.li@intel.com>,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-edac@vger.kernel.org, linux-hyperv@vger.kernel.org,
 kvm@vger.kernel.org, xen-devel@lists.xenproject.org
Cc: tglx@linutronix.de, mingo@redhat.com, bp@alien8.de,
 dave.hansen@linux.intel.com, x86@kernel.org, hpa@zytor.com, luto@kernel.org,
 seanjc@google.com, peterz@infradead.org, jgross@suse.com,
 ravi.v.shankar@intel.com, mhiramat@kernel.org, andrew.cooper3@citrix.com,
 jiangshanlai@gmail.com
References: <20230914044805.301390-1-xin3.li@intel.com>
 <20230914044805.301390-34-xin3.li@intel.com>
 <8163cf98-8968-72a4-4193-1ca9f019d9ff@suse.com>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <8163cf98-8968-72a4-4193-1ca9f019d9ff@suse.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 9/21/23 14:11, Nikolay Borisov wrote:
>>
>> +SYM_FUNC_START(asm_fred_entry_from_kvm)
>> +    push %rbp
>> +    mov %rsp, %rbp
> 
> use FRAME_BEGIN/FRAME_END macros to ommit this code if 
> CONFIG_FRAME_POINTER is disabled.

No, the previous stack pointer is used below, so the code might as well 
use %rbp for that; but it must do so unconditionally.

Paolo

>> +
>> +    UNWIND_HINT_SAVE
>> +
>> +    /*
>> +     * Don't check the FRED stack level, the call stack leading to this
>> +     * helper is effectively constant and shallow (relatively speaking).
>> +     *
>> +     * Emulate the FRED-defined redzone and stack alignment.
>> +     */
>> +    sub $(FRED_CONFIG_REDZONE_AMOUNT << 6), %rsp
>> +    and $FRED_STACK_FRAME_RSP_MASK, %rsp
>> +
>> +    /*
>> +     * Start to push a FRED stack frame, which is always 64 bytes:
>> +     *
>> +     * +--------+-----------------+
>> +     * | Bytes  | Usage           |
>> +     * +--------+-----------------+
>> +     * | 63:56  | Reserved        |
>> +     * | 55:48  | Event Data      |
>> +     * | 47:40  | SS + Event Info |
>> +     * | 39:32  | RSP             |
>> +     * | 31:24  | RFLAGS          |
>> +     * | 23:16  | CS + Aux Info   |
>> +     * |  15:8  | RIP             |
>> +     * |   7:0  | Error Code      |
>> +     * +--------+-----------------+
>> +     */
>> +    push $0                /* Reserved, must be 0 */
>> +    push $0                /* Event data, 0 for IRQ/NMI */
>> +    push %rdi            /* fred_ss handed in by the caller */
>> +    push %rbp

^^ here

Paolo

>> +    pushf
>> +    mov $__KERNEL_CS, %rax
>> +    push %rax 


