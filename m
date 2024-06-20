Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ACAD491099A
	for <lists+xen-devel@lfdr.de>; Thu, 20 Jun 2024 17:16:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.744796.1151913 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sKJWm-0003NV-0c; Thu, 20 Jun 2024 15:16:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 744796.1151913; Thu, 20 Jun 2024 15:16:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sKJWl-0003Lg-T6; Thu, 20 Jun 2024 15:16:43 +0000
Received: by outflank-mailman (input) for mailman id 744796;
 Thu, 20 Jun 2024 15:16:42 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=WCyn=NW=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1sKJWk-0002se-Ht
 for xen-devel@lists.xenproject.org; Thu, 20 Jun 2024 15:16:42 +0000
Received: from mail-qk1-x731.google.com (mail-qk1-x731.google.com
 [2607:f8b0:4864:20::731])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 18ccb68b-2f18-11ef-90a3-e314d9c70b13;
 Thu, 20 Jun 2024 17:16:42 +0200 (CEST)
Received: by mail-qk1-x731.google.com with SMTP id
 af79cd13be357-795ca45c54cso57665285a.0
 for <xen-devel@lists.xenproject.org>; Thu, 20 Jun 2024 08:16:41 -0700 (PDT)
Received: from [192.168.1.10] (host-92-26-98-202.as13285.net. [92.26.98.202])
 by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-6b2a5c466bfsm88189746d6.68.2024.06.20.08.16.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 20 Jun 2024 08:16:39 -0700 (PDT)
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
X-Inumbo-ID: 18ccb68b-2f18-11ef-90a3-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1718896601; x=1719501401; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=lq9pXP5HQnuXtd7tFhgPkKnrBD7CbpeBtTHng7xRZMo=;
        b=pL/AuGGT6trQfbCA4v3ov6tC8qKvBYpptj+gdf3/kmd8BzbfbOb0CwW2tvRIQsggpL
         RwWw5KHjvNRhlMcsUZvqHpGEGX4kYKlPWz2V2OvQbx115YSQ0prHWlSpcfG+U+ZwwesT
         j1jXmSlqRpFJGvDSHBtPVEufU8WhaCJXqXbN0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718896601; x=1719501401;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lq9pXP5HQnuXtd7tFhgPkKnrBD7CbpeBtTHng7xRZMo=;
        b=Z1yqIM+ES8tLxJx3Hv+ZOiDGooynhG/wcqTmFHE+OanG1ETet7H+13X/7IKgypIkBx
         WRFmLn+HldpwRNc3nQsbLrnMZmdF1xFwRFIBYaRFWTHtKhAzeIhP5dRWhLZGuX5l3BtL
         U3HGvc0Anq5ChhLpAyofjGyYKB64Zlel8u3+KQI8QqJdjkcZWzeJ4+Pyg+pdyX9QPrDp
         fc5qkcOGbHbmR9WtnI0sPR3XVdFjkH4ndhVfpfjTMPp2cs7ne39a9SdUI3718K8p2iDc
         vOnuplwzMtg8SbRfJBZIV9deHA1bH+tY3R1MnlVz74E54Yw/vHyRfrQu8Y4+7nOs6nYB
         a5PA==
X-Forwarded-Encrypted: i=1; AJvYcCVbqGJ72ndBrQz+x7u1ncCZJm2PbP7XGLFdvHJwyqhgGmoN2pFvaUqZOEAxhJ3QMe5XuJNsq61rlChRUA23JDPKFy+DOl7epk0m95CqxDg=
X-Gm-Message-State: AOJu0YzR49OVRWga/qi22s2ljZrAPKfGqbANSrfVNNZudmBT1QJRDeZq
	p1vbL8/L/Na5mPUk2SRTLVKn8JMdUO/jbOyksE7n6ZzuakeycYIfh7qlUNEQ/Fc=
X-Google-Smtp-Source: AGHT+IHix1W9NCwJ1Wdyl0pXo+3Et+o1nJqVkFouJ2Y9IkejYYsvkJC1o0xfCbkFy34u38ftCBWeAQ==
X-Received: by 2002:a05:6214:14ad:b0:6b4:f7bc:40f1 with SMTP id 6a1803df08f44-6b501ebb971mr52450026d6.57.1718896600581;
        Thu, 20 Jun 2024 08:16:40 -0700 (PDT)
Message-ID: <96e8edb4-f9a8-46bf-a99c-cb458b0cb3f0@citrix.com>
Date: Thu, 20 Jun 2024 16:16:37 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN for-4.19 PATCH] x86/apic: Fix signing in left bitshift
To: Matthew Barnes <matthew.barnes@cloud.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
Cc: Jan Beulich <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Oleksii Kurochko <oleksii.kurochko@gmail.com>
References: <6fe6d88c0e07348d3e08fd51863402827126ecb0.1718893590.git.matthew.barnes@cloud.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <6fe6d88c0e07348d3e08fd51863402827126ecb0.1718893590.git.matthew.barnes@cloud.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 20/06/2024 3:31 pm, Matthew Barnes wrote:
> There exists a bitshift in the IOAPIC code where a signed integer is
> shifted to the left by at most 31 bits. This is undefined behaviour,
> and can cause faults in xtf tests such as pv64-pv-iopl~hypercall.
>
> This patch fixes this by changing the integer from signed to unsigned.
>
> Signed-off-by: Matthew Barnes <matthew.barnes@cloud.com>

The code change itself is fine, but I'm going to recommend some
adjustments to the commit message.

Its "x86/ioapic";  apic implies the Local APIC which is apic.c and
distinct from the IO-APIC.  The subject would be clearer as "Fix signed
shift in end_level_ioapic_irq_new()".

The XTF test has nothing to do with this, so shouldn't be mentioned like
this.  The UBSAN failure was in an interrupt handler, and it was
complete chance that it triggered while pv64-pv-iopl~hypercall was the
test being ran.

I'm happy to fix all of that up on commit.

CC Oleksii for 4.19.  This is low risk, and found during testing with
UBSAN active.

~Andrew

