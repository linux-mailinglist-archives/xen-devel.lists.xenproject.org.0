Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 090BC414201
	for <lists+xen-devel@lfdr.de>; Wed, 22 Sep 2021 08:38:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.192177.342489 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mSvtg-00052s-6J; Wed, 22 Sep 2021 06:38:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 192177.342489; Wed, 22 Sep 2021 06:38:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mSvtg-000515-31; Wed, 22 Sep 2021 06:38:24 +0000
Received: by outflank-mailman (input) for mailman id 192177;
 Wed, 22 Sep 2021 06:38:23 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ybNQ=OM=redhat.com=pbonzini@srs-us1.protection.inumbo.net>)
 id 1mSvte-00050z-Vv
 for xen-devel@lists.xenproject.org; Wed, 22 Sep 2021 06:38:23 +0000
Received: from us-smtp-delivery-124.mimecast.com (unknown [170.10.133.124])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTP
 id a5342723-14c2-4c12-8492-5a7f9a9252e9;
 Wed, 22 Sep 2021 06:38:22 +0000 (UTC)
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-514-6IqISAJgO7GWjjpFfJ6Ikw-1; Wed, 22 Sep 2021 02:38:18 -0400
Received: by mail-wr1-f69.google.com with SMTP id
 v1-20020adfc401000000b0015e11f71e65so1187017wrf.2
 for <xen-devel@lists.xenproject.org>; Tue, 21 Sep 2021 23:38:18 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id j21sm1162153wrd.48.2021.09.21.23.38.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 21 Sep 2021 23:38:16 -0700 (PDT)
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
X-Inumbo-ID: a5342723-14c2-4c12-8492-5a7f9a9252e9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1632292702;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Z3XTCa1nu8hCtlYTFFK2GZognBOtLDAkX/kYxcYF1XA=;
	b=NUU64Xb1BcgagGpy9iPM2unKlGXmCCkRfB69KsWkLaF1CANMexfuGIRg2veNeBpU0TlP7C
	SMmoE3GhDeOg+/rY3Jky4LurhV/dNIJD+g2nyanA45uYOJKrgQ5LdF9C5yl9nWGruU4Fm5
	/Fx0zIef1Gp4HywOyr78b6+Q+MzXQk8=
X-MC-Unique: 6IqISAJgO7GWjjpFfJ6Ikw-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=Z3XTCa1nu8hCtlYTFFK2GZognBOtLDAkX/kYxcYF1XA=;
        b=4INTo7wWrptTvwYh9dz3Kmz3h2QSViGbRU88JJeOJXjRc8Wle8Oy7cWZHXRohn2zOw
         +G+3euPoKIwPlBv84ifRtf1Db+TmZWC56iycdcDfJ/epqEACtkhPwTmkJ7K80LeBAWr2
         TjPYiIVBPEKyns9Y0S5jun7+NNRLulZswgLF0tp0sosv6pO4pwizaVoodae+goBgLuzJ
         /g4cILR2Bnxr0DmNGCK0F82wQH7Ld4aNmyv0HgR8qqKLPp0xILJLRaixVb4NbiywGxrv
         ufHgX5NkAY3uWu8rzNFZN41SAJ61/vmh+45OV5xKkEsAUWhLJizZ+qCJuN7tWGNE3lZP
         atrA==
X-Gm-Message-State: AOAM531F869Q6r0P/79Z6py+G5hXKJpNPN5A6PZG4HVnY40ZcfSaEOkS
	27pq1tYB2LupkLjkIfvDJTbS/uAHb69kiRz15er0tM2juGvM6nwxDSwXIIAJNPcWjrR4QuNKfaO
	Gw+e25Pn4g/MMTNfrFh+AKFRbrz8=
X-Received: by 2002:a05:600c:21c8:: with SMTP id x8mr8614006wmj.163.1632292697323;
        Tue, 21 Sep 2021 23:38:17 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJywCmZIrNrFYOLYwz4uLurAI8KkuEnxjxQSJf2bjooMgzy2h0qoOTiWQbU4UgbH2lcfc2iQrA==
X-Received: by 2002:a05:600c:21c8:: with SMTP id x8mr8613976wmj.163.1632292697089;
        Tue, 21 Sep 2021 23:38:17 -0700 (PDT)
Subject: Re: [PATCH v3 11/16] KVM: x86: More precisely identify NMI from guest
 when handling PMI
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
 <20210922000533.713300-12-seanjc@google.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <d444303f-7ee5-7ddc-8eae-64d1e6d4862a@redhat.com>
Date: Wed, 22 Sep 2021 08:38:14 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210922000533.713300-12-seanjc@google.com>
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 22/09/21 02:05, Sean Christopherson wrote:
> Note, this also doesn't completely prevent false positives if perf
> somehow ends up calling into KVM, e.g. an NMI can arrive in host after
> KVM sets its flag.

s/calling into KVM/being called from KVM/ ?

Not sure about what you meant though.  The code is nice, so

Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>

Paolo


