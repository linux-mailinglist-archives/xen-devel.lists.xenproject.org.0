Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 73F5D7A04BF
	for <lists+xen-devel@lfdr.de>; Thu, 14 Sep 2023 15:02:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.602265.938725 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qglyW-00042z-C7; Thu, 14 Sep 2023 13:01:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 602265.938725; Thu, 14 Sep 2023 13:01:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qglyW-00040x-8u; Thu, 14 Sep 2023 13:01:40 +0000
Received: by outflank-mailman (input) for mailman id 602265;
 Thu, 14 Sep 2023 13:01:38 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=uqVP=E6=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1qglyU-00040r-Ka
 for xen-devel@lists.xenproject.org; Thu, 14 Sep 2023 13:01:38 +0000
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [2a00:1450:4864:20::32a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d6bee8f3-52fe-11ee-8787-cb3800f73035;
 Thu, 14 Sep 2023 15:01:37 +0200 (CEST)
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-401da71b85eso9825725e9.1
 for <xen-devel@lists.xenproject.org>; Thu, 14 Sep 2023 06:01:37 -0700 (PDT)
Received: from [10.80.67.28] (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 c20-20020a7bc854000000b003fee6f027c7sm4769165wml.19.2023.09.14.06.01.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 14 Sep 2023 06:01:35 -0700 (PDT)
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
X-Inumbo-ID: d6bee8f3-52fe-11ee-8787-cb3800f73035
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1694696497; x=1695301297; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:references:cc:to
         :content-language:subject:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=ddiGkE6j5Yqjx2YChUyXAKUMjOfVYGR2wU1BDa/uOVM=;
        b=HgD2X5Uu3+bUTHe7WZm3WbTwKHNBtaR4eIDTmMYpL+G+S3DwRUhzWaivn7adykZHvj
         ghyqbWlyMPbKdkWnroBLZbpM1YVANp5UwnU/gtxLeln0LHFkUMtjMzNzZznFgdSgVGnq
         aG50s1f0HNsXeXzNGzWUfmXoWhaFkMNl2RFyQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694696497; x=1695301297;
        h=content-transfer-encoding:in-reply-to:references:cc:to
         :content-language:subject:from:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ddiGkE6j5Yqjx2YChUyXAKUMjOfVYGR2wU1BDa/uOVM=;
        b=M2bH1VC1f0OCaRVQhEMMiiDeu7MvyOCwi9F5jvRdfc/XFCvCBLInf0rawJMjYXtb7V
         AOQaiukPnpM2YfYHRx/+nmjSaWpad0oNU/s7gbH/juiDdqLKXUx8ysMov5DfXWxgnrab
         cY3lB4ROJXo51/rmYvW0W+M3Mxqwq1oZhv5vRHG2Yy3Ahp5mqu9zAJcxcCz9NUq2/mir
         7Q6o8CzR+QUALuwN+BSDdemIE/i3didsHJARymC2OjTbNzkalvhwYHIWTkhg7ajkYFt3
         90gvQ+GZHWLD8TQSRBGY9QspQTFjVdPRo5UfFM8LgMlXl2myZsx3xTnScdFuUEfrn/04
         D75Q==
X-Gm-Message-State: AOJu0YzLohX6Zk4iiXeeAbnlcRfQEkPkDQPoYOZ1tbg9wa0BkV2oCgQ7
	XL82mrjiRYgpsRKfu4GTI3o+Pw==
X-Google-Smtp-Source: AGHT+IGu9ZokynanEidxo6b4ugwjHDqKzn9EMgeKgnKUXWugWLtEAMgf7RA8IhMPo5oq1q9TPG+E9Q==
X-Received: by 2002:a05:600c:b5a:b0:401:eb0:a98d with SMTP id k26-20020a05600c0b5a00b004010eb0a98dmr4538194wmr.24.1694696496369;
        Thu, 14 Sep 2023 06:01:36 -0700 (PDT)
Message-ID: <b894ba89-27b2-88a9-6adf-7d53e2c51c02@citrix.com>
Date: Thu, 14 Sep 2023 14:01:35 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
From: andrew.cooper3@citrix.com
Subject: Re: [PATCH v10 03/38] x86/msr: Add the WRMSRNS instruction support
Content-Language: en-GB
To: Juergen Gross <jgross@suse.com>, Xin Li <xin3.li@intel.com>,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-edac@vger.kernel.org, linux-hyperv@vger.kernel.org,
 kvm@vger.kernel.org, xen-devel@lists.xenproject.org
Cc: tglx@linutronix.de, mingo@redhat.com, bp@alien8.de,
 dave.hansen@linux.intel.com, x86@kernel.org, hpa@zytor.com, luto@kernel.org,
 pbonzini@redhat.com, seanjc@google.com, peterz@infradead.org,
 ravi.v.shankar@intel.com, mhiramat@kernel.org, jiangshanlai@gmail.com
References: <20230914044805.301390-1-xin3.li@intel.com>
 <20230914044805.301390-4-xin3.li@intel.com>
 <48d312f4-50cd-468d-af70-51314796b0d8@suse.com>
In-Reply-To: <48d312f4-50cd-468d-af70-51314796b0d8@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 14/09/2023 7:02 am, Juergen Gross wrote:
> On 14.09.23 06:47, Xin Li wrote:
>> Add an always inline API __wrmsrns() to embed the WRMSRNS instruction
>> into the code.
>>
>> Tested-by: Shan Kang <shan.kang@intel.com>
>> Signed-off-by: Xin Li <xin3.li@intel.com>
>
> In order to avoid having to add paravirt support for WRMSRNS I think
> xen_init_capabilities() should gain:
>
> +    setup_clear_cpu_cap(X86_FEATURE_WRMSRNS);

Xen PV guests will never ever see WRMSRNS.  Operating in CPL3, they have
no possible way of adjusting an MSR which isn't serialising, because
even the hypercall forms are serialising.

Xen only exposes the bit for HVM guests.

~Andrew

