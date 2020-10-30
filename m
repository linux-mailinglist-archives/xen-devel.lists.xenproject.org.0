Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D8CD2A0D3B
	for <lists+xen-devel@lfdr.de>; Fri, 30 Oct 2020 19:17:49 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.16136.39441 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kYYxQ-0006li-1n; Fri, 30 Oct 2020 18:17:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 16136.39441; Fri, 30 Oct 2020 18:17:00 +0000
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
	id 1kYYxP-0006lJ-Ud; Fri, 30 Oct 2020 18:16:59 +0000
Received: by outflank-mailman (input) for mailman id 16136;
 Fri, 30 Oct 2020 18:16:58 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0fiM=EF=redhat.com=pbonzini@srs-us1.protection.inumbo.net>)
 id 1kYYxN-0006lD-Ta
 for xen-devel@lists.xenproject.org; Fri, 30 Oct 2020 18:16:58 +0000
Received: from us-smtp-delivery-124.mimecast.com (unknown [63.128.21.124])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTP
 id 51f61f03-0fa2-4443-bbef-2e9e24278cb2;
 Fri, 30 Oct 2020 18:16:57 +0000 (UTC)
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-68-nDSVqSHLM5Gz9gxYPRzgGA-1; Fri, 30 Oct 2020 14:16:54 -0400
Received: by mail-ed1-f71.google.com with SMTP id cb27so2960397edb.11
 for <xen-devel@lists.xenproject.org>; Fri, 30 Oct 2020 11:16:54 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id r24sm3338060eds.67.2020.10.30.11.16.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 30 Oct 2020 11:16:51 -0700 (PDT)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=0fiM=EF=redhat.com=pbonzini@srs-us1.protection.inumbo.net>)
	id 1kYYxN-0006lD-Ta
	for xen-devel@lists.xenproject.org; Fri, 30 Oct 2020 18:16:58 +0000
X-Inumbo-ID: 51f61f03-0fa2-4443-bbef-2e9e24278cb2
Received: from us-smtp-delivery-124.mimecast.com (unknown [63.128.21.124])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTP
	id 51f61f03-0fa2-4443-bbef-2e9e24278cb2;
	Fri, 30 Oct 2020 18:16:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1604081816;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=hQ9JbkxvNa0VjLQd06HFpKY/mjumkrtDAKSURNuwMaY=;
	b=RqKX+DP0RS54Yr1lQ/F8Bed33mIAGibN1Yno7dIuYutZz0mrrpoUGmG9qdNfJauA/cPyYt
	uULqyRlrpEPkFas8N65+mTu4LqFsVq8Z7Vp5LWZmJdMiEilYpMF9zUI/UyQubuPeHe2SIy
	49Syu43b6rmf5+egDoxmfA1AERFWD6U=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-68-nDSVqSHLM5Gz9gxYPRzgGA-1; Fri, 30 Oct 2020 14:16:54 -0400
X-MC-Unique: nDSVqSHLM5Gz9gxYPRzgGA-1
Received: by mail-ed1-f71.google.com with SMTP id cb27so2960397edb.11
        for <xen-devel@lists.xenproject.org>; Fri, 30 Oct 2020 11:16:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=hQ9JbkxvNa0VjLQd06HFpKY/mjumkrtDAKSURNuwMaY=;
        b=H/suE1U4/HqGdMIzfxjHwofp33nJXYBM06+8isPvqBz8uzC33RdDFa3/BYolWBKYFc
         hMMS6nzEMDD37pvGbBElulYN+16vk3cRs72rxxDS5Z64KOb1/XwpQahHj7wHt02xvr/F
         y2wU06BaZhZDLyluPhXU/U8yJHaGlmatiQzGPDR0bTeQgHlcVgMP6RKk5bNj3W1FFMCZ
         OmvJe+7ig6Wx0V0wlMdZT9PSGK8VkIQmc/4hA32+xW7T0OKNJv5KEkCnm0RVhkqRxDDe
         JDvvZB7B/18PK8nzRgnvPxM0KsswHHGWwdKuSbg21622Sj7lHnbJAV+wTMlFX9DtT7Nr
         L7nA==
X-Gm-Message-State: AOAM531RgR+9mhPRh6fpddCyOeKS6Dfm8ZAAqjbuBFF/Xis/R/w/6vMj
	/XYgHOjX7id/NxhsAxL7/exBj+XWqja8xc53jRvYvXa1jUYImvnkmbKSwKpbzc8frMeMCNMfUib
	AEqYKGbQwaA1f1V2ye8tEoL9j3JA=
X-Received: by 2002:a17:906:c20f:: with SMTP id d15mr3678297ejz.341.1604081812910;
        Fri, 30 Oct 2020 11:16:52 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyxORp9yhzCHXkXQ+SV0R3eIJai4qo4teWFQf7D18bUb6YmyTx02WLXvoVEuul2E5KtdAUsMg==
X-Received: by 2002:a17:906:c20f:: with SMTP id d15mr3678275ejz.341.1604081812714;
        Fri, 30 Oct 2020 11:16:52 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a? ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
        by smtp.gmail.com with ESMTPSA id r24sm3338060eds.67.2020.10.30.11.16.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 30 Oct 2020 11:16:51 -0700 (PDT)
Subject: Re: [PATCH] [v2] x86: apic: avoid -Wshadow warning in header
To: David Laight <David.Laight@ACULAB.COM>,
 'Arvind Sankar' <nivedita@alum.mit.edu>, Thomas Gleixner <tglx@linutronix.de>
Cc: 'Arnd Bergmann' <arnd@kernel.org>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, "x86@kernel.org" <x86@kernel.org>,
 Arnd Bergmann <arnd@arndb.de>, "K. Y. Srinivasan" <kys@microsoft.com>,
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
 <93180c2d-268c-3c33-7c54-4221dfe0d7ad@redhat.com>
 <87v9esojdi.fsf@nanos.tec.linutronix.de>
 <20201029213512.GA34524@rani.riverdale.lan>
 <ad73f56e79d249b1b3614bccc85e2ca5@AcuMS.aculab.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <070f590f-b702-35f0-0b6c-c6455f08e9d5@redhat.com>
Date: Fri, 30 Oct 2020 19:16:50 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.3.1
MIME-Version: 1.0
In-Reply-To: <ad73f56e79d249b1b3614bccc85e2ca5@AcuMS.aculab.com>
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 29/10/20 23:12, David Laight wrote:
>> https://godbolt.org/z/4dzPbM
>>
>> With -fno-strict-aliasing, the compiler reloads the pointer if you write
>> to the start of what it points to, but not if you write to later
>> elements.
> I guess it assumes that global data doesn't overlap.

Yeah, setting

	p = (struct s *) ((char *)&p) - 8;

invokes undefined behavior _for a different reason than strict aliasing_
(it's a pointer that is based on "p" but points before its start or
after one byte past its end).  So the compiler assumes that only the
first few bytes of a global can overlap it.

If you change the size of the fields from long to char in the compiler
explorer link above, every field forces a reload of the global.

Paolo


