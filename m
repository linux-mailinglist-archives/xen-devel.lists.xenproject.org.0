Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 372F729F272
	for <lists+xen-devel@lfdr.de>; Thu, 29 Oct 2020 18:00:10 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.14373.35523 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kYBHP-0000M1-2M; Thu, 29 Oct 2020 17:00:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 14373.35523; Thu, 29 Oct 2020 17:00:03 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kYBHO-0000KA-Ui; Thu, 29 Oct 2020 17:00:02 +0000
Received: by outflank-mailman (input) for mailman id 14373;
 Thu, 29 Oct 2020 17:00:01 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=2HK/=EE=redhat.com=pbonzini@srs-us1.protection.inumbo.net>)
 id 1kYBHN-0000Bc-Jb
 for xen-devel@lists.xenproject.org; Thu, 29 Oct 2020 17:00:01 +0000
Received: from us-smtp-delivery-124.mimecast.com (unknown [63.128.21.124])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTP
 id a4719388-7c24-45c1-a71b-5d60c346accc;
 Thu, 29 Oct 2020 17:00:00 +0000 (UTC)
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-18-QcIn_t-uP3268TnP8ugTDA-1; Thu, 29 Oct 2020 12:59:58 -0400
Received: by mail-wr1-f71.google.com with SMTP id 2so1530694wrd.14
 for <xen-devel@lists.xenproject.org>; Thu, 29 Oct 2020 09:59:58 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id f17sm6577560wrm.27.2020.10.29.09.59.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 29 Oct 2020 09:59:56 -0700 (PDT)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=2HK/=EE=redhat.com=pbonzini@srs-us1.protection.inumbo.net>)
	id 1kYBHN-0000Bc-Jb
	for xen-devel@lists.xenproject.org; Thu, 29 Oct 2020 17:00:01 +0000
X-Inumbo-ID: a4719388-7c24-45c1-a71b-5d60c346accc
Received: from us-smtp-delivery-124.mimecast.com (unknown [63.128.21.124])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTP
	id a4719388-7c24-45c1-a71b-5d60c346accc;
	Thu, 29 Oct 2020 17:00:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1603990800;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=LFIk1KDbaI+imFseS7EgKO+PMROEHyYFYHvDyMX5vJs=;
	b=dSWCbKpj2w6DFFmHob56gvbFpNw5b2wuB7FI2aaN0gcPaWz67Xsjhd029zbGGIsAkH1DOL
	nrgPEx8hTWdobVXvAKIn2j9+E0w3+9yhrQV3MGVouJolKdnLKLMTUf47z6tOcMYN/3FVcP
	7M4GYkPPTuWbrqcApUVZhcQLZGTI3M4=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-18-QcIn_t-uP3268TnP8ugTDA-1; Thu, 29 Oct 2020 12:59:58 -0400
X-MC-Unique: QcIn_t-uP3268TnP8ugTDA-1
Received: by mail-wr1-f71.google.com with SMTP id 2so1530694wrd.14
        for <xen-devel@lists.xenproject.org>; Thu, 29 Oct 2020 09:59:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=LFIk1KDbaI+imFseS7EgKO+PMROEHyYFYHvDyMX5vJs=;
        b=ixM1eHdh38UpLKV0YEZBjsREbPt24UxImEl+shehwM3zEtn8fX/R+4hYbK6xi18VeB
         A410cyEuiyfaNEZvSaUDsDws/lvRMBIvN9kf/lcRyZC78c0nrfVcrbsFuBrAfxiBFin7
         /g9EPcbuvNtD8iNiNP9sPlktuPDjUZHKrOy7EcZNZWSx05clSEiMZkdhXkZG4oNAH49X
         xzaVtyW6+QYsnVH/V6K+SiJ7oVioANUPIwG7VIUldz02Frtd5D0cWhqJFyctwZunIV0z
         wBVxz3ZplrkxI+36CEL/Kj86z14qY5TQo0ZYyjERI6DmYRi1SQocRRUTSV5899S46JBn
         EflQ==
X-Gm-Message-State: AOAM531pjGPpPvZsxqNobZWHjoSZvBn/IPFdIT5fnLZZqlCXuuYn168G
	qPzTCwzwJCMlLHLAEXnALuZHQiBux4Nos2RWSmTPBB/FNXPGE9L8yqmVqNwlLNgHz/XxJagVi23
	DVWazCOPEf54ss+/VfCddtIh3mnc=
X-Received: by 2002:a5d:4e8d:: with SMTP id e13mr6897938wru.368.1603990797493;
        Thu, 29 Oct 2020 09:59:57 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxIJpY7s5tS16KM1jeRqPRytnQIFiA4jNhSDraUoIgQqWjC9ew8fh0YJ62Gxk2fkrYU/ZAcRw==
X-Received: by 2002:a5d:4e8d:: with SMTP id e13mr6897898wru.368.1603990797308;
        Thu, 29 Oct 2020 09:59:57 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a? ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
        by smtp.gmail.com with ESMTPSA id f17sm6577560wrm.27.2020.10.29.09.59.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 29 Oct 2020 09:59:56 -0700 (PDT)
Subject: Re: [PATCH] [v2] x86: apic: avoid -Wshadow warning in header
To: Arvind Sankar <nivedita@alum.mit.edu>,
 David Laight <David.Laight@ACULAB.COM>
Cc: 'Arnd Bergmann' <arnd@kernel.org>, Thomas Gleixner <tglx@linutronix.de>,
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
 "x86@kernel.org" <x86@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 "K. Y. Srinivasan" <kys@microsoft.com>,
 Haiyang Zhang <haiyangz@microsoft.com>,
 Stephen Hemminger <sthemmin@microsoft.com>, "H. Peter Anvin"
 <hpa@zytor.com>, "Rafael J. Wysocki" <rjw@rjwysocki.net>,
 Vitaly Kuznetsov <vkuznets@redhat.com>, Wanpeng Li <wanpengli@tencent.com>,
 Jim Mattson <jmattson@google.com>, Joerg Roedel <joro@8bytes.org>,
 "linux-hyperv@vger.kernel.org" <linux-hyperv@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "kvm@vger.kernel.org" <kvm@vger.kernel.org>,
 "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 "iommu@lists.linux-foundation.org" <iommu@lists.linux-foundation.org>
References: <20201028212417.3715575-1-arnd@kernel.org>
 <38b11ed3fec64ebd82d6a92834a4bebe@AcuMS.aculab.com>
 <20201029165611.GA2557691@rani.riverdale.lan>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <93180c2d-268c-3c33-7c54-4221dfe0d7ad@redhat.com>
Date: Thu, 29 Oct 2020 17:59:54 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.3.1
MIME-Version: 1.0
In-Reply-To: <20201029165611.GA2557691@rani.riverdale.lan>
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 29/10/20 17:56, Arvind Sankar wrote:
>> For those two just add:
>> 	struct apic *apic = x86_system_apic;
>> before all the assignments.
>> Less churn and much better code.
>>
> Why would it be better code?
> 

I think he means the compiler produces better code, because it won't
read the global variable repeatedly.  Not sure if that's true,(*) but I
think I do prefer that version if Arnd wants to do that tweak.

Paolo

(*) if it is, it might also be due to Linux using -fno-strict-aliasing


