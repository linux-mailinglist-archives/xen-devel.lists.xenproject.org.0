Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 597D77A12D6
	for <lists+xen-devel@lfdr.de>; Fri, 15 Sep 2023 03:17:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.602825.939596 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qgxS2-0002aC-Ko; Fri, 15 Sep 2023 01:16:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 602825.939596; Fri, 15 Sep 2023 01:16:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qgxS2-0002Wq-H9; Fri, 15 Sep 2023 01:16:54 +0000
Received: by outflank-mailman (input) for mailman id 602825;
 Fri, 15 Sep 2023 01:16:53 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=upey=E7=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1qgxS1-0002WR-0r
 for xen-devel@lists.xenproject.org; Fri, 15 Sep 2023 01:16:53 +0000
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com
 [2a00:1450:4864:20::636])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8ce26f45-5365-11ee-8788-cb3800f73035;
 Fri, 15 Sep 2023 03:16:51 +0200 (CEST)
Received: by mail-ej1-x636.google.com with SMTP id
 a640c23a62f3a-99de884ad25so220077566b.3
 for <xen-devel@lists.xenproject.org>; Thu, 14 Sep 2023 18:16:51 -0700 (PDT)
Received: from [192.168.1.10] (host-92-12-44-130.as13285.net. [92.12.44.130])
 by smtp.gmail.com with ESMTPSA id
 v7-20020a1709064e8700b00977cad140a8sm1674597eju.218.2023.09.14.18.16.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 14 Sep 2023 18:16:51 -0700 (PDT)
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
X-Inumbo-ID: 8ce26f45-5365-11ee-8788-cb3800f73035
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1694740611; x=1695345411; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:references:cc:to
         :content-language:subject:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=NPhAEJforhjWZp+uVyQ1+GyAsVZzUl1B486vJg9MvnA=;
        b=pTmjpYPNjAzjbtVgLygXGfRYlyZ1OlGpKqW1foMH2wOEPc6tlzOOXN9GKc7p4UX4E6
         pjBMrDoPdPDCSynDhkgq2fniu864ucY4A8HV3qeLHuBqHOBeixFf6ObNAr7zYbqnd9Tk
         k2rhK7cu0+9wFVsk60abM8XKx54Huylp00zUU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694740611; x=1695345411;
        h=content-transfer-encoding:in-reply-to:references:cc:to
         :content-language:subject:from:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NPhAEJforhjWZp+uVyQ1+GyAsVZzUl1B486vJg9MvnA=;
        b=PtluXHLyZy1J9W0a7Yw2Bwi1SizjX2UgS08bhL6LbiksscmysWpsbT0ohnBvDXqWV3
         xaNAcbgxrEoJ4HDkRbsbNw0h1XBMbJGOHunppvsIs/nqf95qQk6CUnMU/dOS/XTHMC07
         13JHiTBfGBfm1iNPfDjfwImKxeCussmuULrtYWRROmnE8zgrK1siIt0JvuGhRPX2m8+S
         dpcd+ZnIh/rSYUBwNBt0wN7KNYDULpVrK9Eadu6bLkgfGHwAeI1uMCczw7cqpMAIJSL/
         jv779lAhxXpQ3+OpKbqv/aTO+JqaOQk6/6tlTCW/jANOCi3nJR+/RIs0eGlodd/vebZy
         CIag==
X-Gm-Message-State: AOJu0YzsAWoHgIvOVUcYuiJrzIPVPoqrfvB9kx6VKNTVLE543P3B1a8M
	n7gJX/7qoYTRJCql6L2zD8EUsQ==
X-Google-Smtp-Source: AGHT+IE7O+PeUxB72+aWKd2SThAEBmIs9sfrCItn5Ff0aKMedVWukOd31H6m4Ef8LNnP3BDRvPbAaw==
X-Received: by 2002:a17:906:3f49:b0:99c:56d1:7c71 with SMTP id f9-20020a1709063f4900b0099c56d17c71mr118141ejj.26.1694740611206;
        Thu, 14 Sep 2023 18:16:51 -0700 (PDT)
Message-ID: <6575702e-fea5-61b2-dd61-7b556a8603e8@citrix.com>
Date: Fri, 15 Sep 2023 02:16:50 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
From: andrew.cooper3@citrix.com
Subject: Re: [PATCH v10 03/38] x86/msr: Add the WRMSRNS instruction support
Content-Language: en-GB
To: "H. Peter Anvin" <hpa@zytor.com>, Thomas Gleixner <tglx@linutronix.de>,
 Xin Li <xin3.li@intel.com>, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-edac@vger.kernel.org,
 linux-hyperv@vger.kernel.org, kvm@vger.kernel.org,
 xen-devel@lists.xenproject.org
Cc: mingo@redhat.com, bp@alien8.de, dave.hansen@linux.intel.com,
 x86@kernel.org, luto@kernel.org, pbonzini@redhat.com, seanjc@google.com,
 peterz@infradead.org, jgross@suse.com, ravi.v.shankar@intel.com,
 mhiramat@kernel.org, jiangshanlai@gmail.com
References: <20230914044805.301390-1-xin3.li@intel.com>
 <20230914044805.301390-4-xin3.li@intel.com>
 <6f5678ff-f8b1-9ada-c8c7-f32cfb77263a@citrix.com> <87y1h81ht4.ffs@tglx>
 <7ba4ae3e-f75d-66a8-7669-b6eb17c1aa1c@citrix.com>
 <0e7d37db-e1af-ac40-6eca-5565d1bebcde@zytor.com>
In-Reply-To: <0e7d37db-e1af-ac40-6eca-5565d1bebcde@zytor.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 15/09/2023 2:01 am, H. Peter Anvin wrote:
> The whole bit with alternatives and pvops being separate is a major
> maintainability problem, and honestly it never made any sense in the
> first place. Never have two mechanisms to do one job; it makes it
> harder to grok their interactions.

This bit is easy.

Juergen has already done the work to delete one of these two patching
mechanisms and replace it with the other.

https://lore.kernel.org/lkml/a32e211f-4add-4fb2-9e5a-480ae9b9bbf2@suse.com/

Unfortunately, it's only collecting pings and tumbleweeds.

~Andrew

