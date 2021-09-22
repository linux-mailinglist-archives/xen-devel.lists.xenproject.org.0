Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AD134141D6
	for <lists+xen-devel@lfdr.de>; Wed, 22 Sep 2021 08:29:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.192145.342434 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mSvkc-00012E-5p; Wed, 22 Sep 2021 06:29:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 192145.342434; Wed, 22 Sep 2021 06:29:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mSvkc-00010O-2h; Wed, 22 Sep 2021 06:29:02 +0000
Received: by outflank-mailman (input) for mailman id 192145;
 Wed, 22 Sep 2021 06:29:01 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ybNQ=OM=redhat.com=pbonzini@srs-us1.protection.inumbo.net>)
 id 1mSvkb-00010I-5Y
 for xen-devel@lists.xenproject.org; Wed, 22 Sep 2021 06:29:01 +0000
Received: from us-smtp-delivery-124.mimecast.com (unknown [170.10.133.124])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id 5f5e3177-1b6e-11ec-b95f-12813bfff9fa;
 Wed, 22 Sep 2021 06:29:00 +0000 (UTC)
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-388-CRwhY5nVO22gZ90a4b3SMA-1; Wed, 22 Sep 2021 02:28:58 -0400
Received: by mail-wr1-f71.google.com with SMTP id
 m1-20020a056000180100b0015e1ec30ac3so1145089wrh.8
 for <xen-devel@lists.xenproject.org>; Tue, 21 Sep 2021 23:28:58 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id i18sm1136021wrn.64.2021.09.21.23.28.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 21 Sep 2021 23:28:56 -0700 (PDT)
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
X-Inumbo-ID: 5f5e3177-1b6e-11ec-b95f-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1632292140;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=pJ7mY3KGJnt0GGObf9665ZCn7DQvGIxKlz9Hgzfe7VE=;
	b=Ah6F7aW5/exccYXC1OVMx5XAUJSgBfMU9UjQW3vy82NGWuB7IHHWUbst15q9aKgbi61m1R
	6xtU221qIfogFbksD81bH4UyMgm0TgzITsoPmxn35yTy+dSFgwUZI+QluwQbcauAFBXG8n
	5gL0qX9f/vf+qoNQX5SPW2JkhnRz5lI=
X-MC-Unique: CRwhY5nVO22gZ90a4b3SMA-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=pJ7mY3KGJnt0GGObf9665ZCn7DQvGIxKlz9Hgzfe7VE=;
        b=qKtI2wnc9MG9PoumStk7royVKZ2cGmxcaWAwqni99B8zZBzqJZanvSCHFMhno46TmO
         4/WLQYXkL4KbokXtPgQYp+F8BsWUfWGawfJ5Fs5Ehl0OTxb1rzJkubQOs3m5SN823Uyj
         9kdDcf81XV/xPce5FlMBezlRvVCedk5pQCcWqkFjUhneMHyT+bVfrUL/KKk49skeK4BV
         tsa7hVbFpbSrHV+tH/fdqkgYrFZhE5uuMTtfiahHLbTN+g6iOq3+fi/TDUBJu/zPtTBU
         4q9vEjOaYmRKveuT0nlcgY8Kqrq+c9i8qGCPP8FxekB7tM0rejK14Oq7Ndl6Dl1+odvF
         hxBA==
X-Gm-Message-State: AOAM533+QMHPH7djp3uJr/ml578UydWLo/id+ia6stj4kBeID5/N+Y2v
	t02Dwg7UPiIE2w5XU2l7oJqAEdc19fK8l5aqHhTbEV50uB7At0E5WSqVBWf81vrRqVQnJgh2oyj
	i5kX+aM7tmV010VtWIjNgv0FaBII=
X-Received: by 2002:a05:600c:3ba4:: with SMTP id n36mr8722438wms.35.1632292137444;
        Tue, 21 Sep 2021 23:28:57 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzGUh0clwu4unN1cIXXPNEQKf8qlYc4JIONnRibnq73sMmW8cPrqysrS+MXk+0qjWI0DZnAvw==
X-Received: by 2002:a05:600c:3ba4:: with SMTP id n36mr8722395wms.35.1632292137204;
        Tue, 21 Sep 2021 23:28:57 -0700 (PDT)
Subject: Re: [PATCH v3 06/16] perf/core: Rework guest callbacks to prepare for
 static_call support
To: Sean Christopherson <seanjc@google.com>,
 Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>,
 Arnaldo Carvalho de Melo <acme@kernel.org>, Will Deacon <will@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>, Marc Zyngier <maz@kernel.org>,
 Guo Ren <guoren@kernel.org>, Nick Hu <nickhu@andestech.com>,
 Greentime Hu <green.hu@gmail.com>, Vincent Chen <deanbo422@gmail.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>, Juergen Gross <jgross@suse.com>
Cc: Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Jiri Olsa <jolsa@redhat.com>, Namhyung Kim <namhyung@kernel.org>,
 James Morse <james.morse@arm.com>,
 Alexandru Elisei <alexandru.elisei@arm.com>,
 Suzuki K Poulose <suzuki.poulose@arm.com>,
 Vitaly Kuznetsov <vkuznets@redhat.com>, Wanpeng Li <wanpengli@tencent.com>,
 Jim Mattson <jmattson@google.com>, Joerg Roedel <joro@8bytes.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 linux-arm-kernel@lists.infradead.org, linux-perf-users@vger.kernel.org,
 linux-kernel@vger.kernel.org, kvmarm@lists.cs.columbia.edu,
 linux-csky@vger.kernel.org, linux-riscv@lists.infradead.org,
 kvm@vger.kernel.org, xen-devel@lists.xenproject.org,
 Artem Kashkanov <artem.kashkanov@intel.com>,
 Like Xu <like.xu.linux@gmail.com>, Zhu Lingshan <lingshan.zhu@intel.com>
References: <20210922000533.713300-1-seanjc@google.com>
 <20210922000533.713300-7-seanjc@google.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <6636ab49-e21c-601f-9d2c-34e681c14faa@redhat.com>
Date: Wed, 22 Sep 2021 08:28:52 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210922000533.713300-7-seanjc@google.com>
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 22/09/21 02:05, Sean Christopherson wrote:
> To prepare for using static_calls to optimize perf's guest callbacks,
> replace ->is_in_guest and ->is_user_mode with a new multiplexed hook
> ->state, tweak ->handle_intel_pt_intr to play nice with being called when
> there is no active guest, and drop "guest" from ->is_in_guest.

... from ->get_guest_ip.  Code-wise,

Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>


