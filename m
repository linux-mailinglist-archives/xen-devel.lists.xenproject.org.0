Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BEF0F72E8EC
	for <lists+xen-devel@lfdr.de>; Tue, 13 Jun 2023 19:01:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.548315.856208 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q97Ne-0002RH-Ua; Tue, 13 Jun 2023 17:00:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 548315.856208; Tue, 13 Jun 2023 17:00:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q97Ne-0002Q9-Rd; Tue, 13 Jun 2023 17:00:30 +0000
Received: by outflank-mailman (input) for mailman id 548315;
 Tue, 13 Jun 2023 17:00:29 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ickz=CB=redhat.com=david@srs-se1.protection.inumbo.net>)
 id 1q97Nd-0002Q2-In
 for xen-devel@lists.xenproject.org; Tue, 13 Jun 2023 17:00:29 +0000
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id cb59f281-0a0b-11ee-b232-6b7b168915f2;
 Tue, 13 Jun 2023 19:00:27 +0200 (CEST)
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-249-8gD7JozFMeyehGXjVYsXEg-1; Tue, 13 Jun 2023 13:00:23 -0400
Received: by mail-wm1-f70.google.com with SMTP id
 5b1f17b1804b1-3f7e4dc0fe5so37055575e9.3
 for <xen-devel@lists.xenproject.org>; Tue, 13 Jun 2023 10:00:21 -0700 (PDT)
Received: from ?IPV6:2003:cb:c710:ff00:1a06:80f:733a:e8c6?
 (p200300cbc710ff001a06080f733ae8c6.dip0.t-ipconnect.de.
 [2003:cb:c710:ff00:1a06:80f:733a:e8c6])
 by smtp.gmail.com with ESMTPSA id
 d17-20020adffbd1000000b0030fb4b55c13sm9792662wrs.96.2023.06.13.10.00.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 13 Jun 2023 10:00:19 -0700 (PDT)
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
X-Inumbo-ID: cb59f281-0a0b-11ee-b232-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1686675626;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=N+LdwBzt0uYokh007O/q+HMXZaTU5MnHMEEMsHFG/3Y=;
	b=YbYZVOGrrzva336Ye3pwQub+T8sgsrlggRTyI0hiLhdsvrmWwcneTHVL4EAYZUpT0J+TXm
	an6VEUUEq+kdDOXHvSP5hIwAA+6nmsqtD8HuAsobFhzVF8bOZyjhxjWM/19MqL/C8F0pkx
	d8YfmwayON96FzPu2nwo9Ln21v/Q3/c=
X-MC-Unique: 8gD7JozFMeyehGXjVYsXEg-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686675621; x=1689267621;
        h=content-transfer-encoding:in-reply-to:organization:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=N+LdwBzt0uYokh007O/q+HMXZaTU5MnHMEEMsHFG/3Y=;
        b=j8AnThlMfhdoSNXAfdHA1QSscODwSC6zs5nJeZY7zMrnDnlJXa9eJVsA1FDubt7u4j
         UBbltKm6Rzt10liXjuTt/MnrSmPCKjldhbAB42+qJCgOcEeRZhKUXV8iFev0FimxHswn
         rNWeZ0MQux0X9DB8nALEZU90kF4g2eF39xeh+JofOQu+1/J8FGFS2z6+RGTPTVErdJuf
         z7lJj9ZyDr31hRXL03E59L/AUcSlNiF9mpydv4KDKB9/eaZi77E0WawViaXfY8zrwfK8
         TVpM2MgQs4O+I8sXsXoKMs6plWyCVVZ2cohiDPzZIS1lXrEupV2NQ1W0VrxIH8SYsWu8
         yrWg==
X-Gm-Message-State: AC+VfDwoXlyu+iKXzAXR7q+6OgHxY0AbXFJbE4RE61Fl0+KIF8vRrTwN
	yCDsjC7cPTKt6uqyp+YiSKedes5VAYmj0mP5RPfzfzvzzsJnww8YPYxUqBmydN34S3VBmb/+CnG
	LfTg3cBh8W7WirV2XTpFwdJ8/olY=
X-Received: by 2002:a05:600c:2041:b0:3f8:d0e7:daed with SMTP id p1-20020a05600c204100b003f8d0e7daedmr1651707wmg.19.1686675620853;
        Tue, 13 Jun 2023 10:00:20 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ5DqYDEwXY1aS+T8oevGZM1GGzvu3C6CrpD97OsPgkk4IOclN0QORetIFLX25l+OyKcdC2cGA==
X-Received: by 2002:a05:600c:2041:b0:3f8:d0e7:daed with SMTP id p1-20020a05600c204100b003f8d0e7daedmr1651659wmg.19.1686675620442;
        Tue, 13 Jun 2023 10:00:20 -0700 (PDT)
Message-ID: <8a053da2-0f26-82ca-f437-9b9de11d4584@redhat.com>
Date: Tue, 13 Jun 2023 19:00:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v9 02/42] mm: Move pte/pmd_mkwrite() callers with no VMA
 to _novma()
To: "Edgecombe, Rick P" <rick.p.edgecombe@intel.com>,
 "rppt@kernel.org" <rppt@kernel.org>
Cc: "akpm@linux-foundation.org" <akpm@linux-foundation.org>,
 "tglx@linutronix.de" <tglx@linutronix.de>,
 "linux-arch@vger.kernel.org" <linux-arch@vger.kernel.org>,
 "kcc@google.com" <kcc@google.com>, "Lutomirski, Andy" <luto@kernel.org>,
 "nadav.amit@gmail.com" <nadav.amit@gmail.com>,
 "kirill.shutemov@linux.intel.com" <kirill.shutemov@linux.intel.com>,
 "Schimpe, Christina" <christina.schimpe@intel.com>,
 "linux-s390@vger.kernel.org" <linux-s390@vger.kernel.org>,
 "Torvalds, Linus" <torvalds@linux-foundation.org>,
 "peterz@infradead.org" <peterz@infradead.org>,
 "corbet@lwn.net" <corbet@lwn.net>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "jannh@google.com" <jannh@google.com>,
 "dethoma@microsoft.com" <dethoma@microsoft.com>,
 "broonie@kernel.org" <broonie@kernel.org>,
 "mike.kravetz@oracle.com" <mike.kravetz@oracle.com>,
 "pavel@ucw.cz" <pavel@ucw.cz>, "bp@alien8.de" <bp@alien8.de>,
 "rdunlap@infradead.org" <rdunlap@infradead.org>,
 "linux-api@vger.kernel.org" <linux-api@vger.kernel.org>,
 "john.allen@amd.com" <john.allen@amd.com>, "arnd@arndb.de" <arnd@arndb.de>,
 "jamorris@linux.microsoft.com" <jamorris@linux.microsoft.com>,
 "bsingharora@gmail.com" <bsingharora@gmail.com>,
 "x86@kernel.org" <x86@kernel.org>, "oleg@redhat.com" <oleg@redhat.com>,
 "fweimer@redhat.com" <fweimer@redhat.com>,
 "keescook@chromium.org" <keescook@chromium.org>,
 "gorcunov@gmail.com" <gorcunov@gmail.com>,
 "andrew.cooper3@citrix.com" <andrew.cooper3@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 "hpa@zytor.com" <hpa@zytor.com>, "mingo@redhat.com" <mingo@redhat.com>,
 "szabolcs.nagy@arm.com" <szabolcs.nagy@arm.com>,
 "hjl.tools@gmail.com" <hjl.tools@gmail.com>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "debug@rivosinc.com" <debug@rivosinc.com>,
 "linux-mm@kvack.org" <linux-mm@kvack.org>,
 "Syromiatnikov, Eugene" <esyr@redhat.com>,
 "Yang, Weijiang" <weijiang.yang@intel.com>,
 "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
 "dave.hansen@linux.intel.com" <dave.hansen@linux.intel.com>,
 "Eranian, Stephane" <eranian@google.com>
References: <20230613001108.3040476-1-rick.p.edgecombe@intel.com>
 <20230613001108.3040476-3-rick.p.edgecombe@intel.com>
 <20230613074428.GS52412@kernel.org>
 <21b0342854b067c241206f422bc5b3254b43c7f5.camel@intel.com>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
In-Reply-To: <21b0342854b067c241206f422bc5b3254b43c7f5.camel@intel.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 13.06.23 18:19, Edgecombe, Rick P wrote:
> On Tue, 2023-06-13 at 10:44 +0300, Mike Rapoport wrote:
>>> Previous patches have done the first step, so next move the callers
>>> that
>>> don't have a VMA to pte_mkwrite_novma(). Also do the same for
>>
>> I hear x86 maintainers asking to drop "previous patches" ;-)
>>
>> Maybe
>> This is the second step of the conversion that moves the callers ...
> 
> Really? I've not heard that. Just a strong aversion to "this patch".
> I've got feedback to say "previous patches" and not "the last patch" so
> it doesn't get stale. I guess it could be "previous changes".

Talking about patches make sense when discussing literal patches sent to 
the mailing list. In the git log, it's commit, and "future commits" or 
"follow-up work".

Yes, we use "patches" all of the time in commit logs, especially when we 
  include the cover letter in the commit message (as done frequently in 
the -mm tree).

-- 
Cheers,

David / dhildenb


