Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FFBE12DF06
	for <lists+xen-devel@lfdr.de>; Wed,  1 Jan 2020 14:30:18 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ime1D-0001JF-3M; Wed, 01 Jan 2020 13:26:35 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Q8Ry=2W=gmail.com=julien.grall.oss@srs-us1.protection.inumbo.net>)
 id 1ime1B-0001J8-Lj
 for xen-devel@lists.xenproject.org; Wed, 01 Jan 2020 13:26:33 +0000
X-Inumbo-ID: 536630a4-2c9a-11ea-a261-12813bfff9fa
Received: from mail-wm1-f46.google.com (unknown [209.85.128.46])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 536630a4-2c9a-11ea-a261-12813bfff9fa;
 Wed, 01 Jan 2020 13:26:32 +0000 (UTC)
Received: by mail-wm1-f46.google.com with SMTP id t14so3547607wmi.5
 for <xen-devel@lists.xenproject.org>; Wed, 01 Jan 2020 05:26:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=La3CHrfxTd3UHk4Z0zhNjOoUelKJaDNcQvdMqNJ/Cq4=;
 b=DhZUf0lZjV+QHYRjt0xHlGvegMi8TXPAptRKR+fajL6+HFFKr1dDHcfE1wj9HFjYJE
 hpg/46Jcx5n3vLkA9W7K8nuceZHSH87TLjMJmHCEMvTgnSgP/5uO8xA5E5G9q0rJT8FK
 A4ditpQNj4sjpWMvwwkZEm10PZN1suWhlV14OAX/z4ajmLVXuyQir/l+x3d45ZL34pWt
 aEQ/AWmZzzNxFDCWCzap3LW7gbWMOovf7ZBAaDrIrmMiE20ZYP0hwKZIK7vaIL6bgTRx
 nwROwIYNIBcWiiUl6Pl7C4Chm2ixmRN+ll6pZ2hDUKeo/HKR+LWRq75Vw8NnVZ6vtFpI
 uoBQ==
X-Gm-Message-State: APjAAAUQmb7uv/cFC8lSOCPdDLKvGJOt4jIyJBjyf4gC4WxKb/6ABa4Q
 CH+lZ1fDlYwb+VAjROf4CYw=
X-Google-Smtp-Source: APXvYqyDimQnL022PSdrXGOG/6C1j9u1DKtC8no8pJp3jl4ESf4yWNShP2+1Dg9Zzdg25XkB12DnUw==
X-Received: by 2002:a1c:234b:: with SMTP id j72mr9690614wmj.128.1577885192049; 
 Wed, 01 Jan 2020 05:26:32 -0800 (PST)
Received: from a483e7b01a66.ant.amazon.com
 (cpc91200-cmbg18-2-0-cust94.5-4.cable.virginm.net. [81.100.41.95])
 by smtp.gmail.com with ESMTPSA id o129sm5533557wmb.1.2020.01.01.05.26.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 01 Jan 2020 05:26:31 -0800 (PST)
To: Roman Shaposhnik <roman@zededa.com>
References: <CAMmSBy8Zh00tebTvz=__GDv478++b-2t4248YnkH0W9DVgqKbw@mail.gmail.com>
 <CAMmSBy-bdEumC=6s6CVFweJWc50nh2-nkEmQ2jtkXjZzziD2_A@mail.gmail.com>
 <alpine.DEB.2.21.1912171737160.12921@sstabellini-ThinkPad-T480s>
 <CAMmSBy8nMc1xj4Lh4emdkxpnwBrYBWh9wOx_muHAuO2rs1HmmQ@mail.gmail.com>
 <CAMmSBy9Djc6CxLnq8br8Ha1HrsHUf8ry5c0U0spbT9YRR+0fZg@mail.gmail.com>
 <d77e7ec8-3b28-ee60-a180-794deb227099@xen.org>
 <CAMmSBy8LT4yZGoGKWTOtEeV4e=9+BQaAx+zFp1oUf6fi1PzY2A@mail.gmail.com>
 <87e4706e-5b7a-1025-5825-376ed801a6e4@xen.org>
 <CAMmSBy_26UqPHeuRC9Jw0g=1oe3jzrsxKsQXs4xB+y3xPLmm-w@mail.gmail.com>
 <86f35bc9-4059-b56f-d77d-c3aa44a75c75@xen.org>
 <alpine.DEB.2.21.1912191555240.9832@sstabellini-ThinkPad-T480s>
 <CAMmSBy8B0T1j5XhaHHNXv=HWLKqNNfzb2hP=j+mAR2VOg5Y4sw@mail.gmail.com>
 <5d085390-15e0-4a62-ea0b-ee9ddd428d6d@xen.org>
 <CAMmSBy9oQz7DkRrdBS5quO56ViCKBv-S5_uug+7x1hw6gd3svg@mail.gmail.com>
 <CAMmSBy9EP0Brn8P-N61LEZA1-RH9uBQ3NWNrvA070=PCnboy7g@mail.gmail.com>
From: Julien Grall <julien@xen.org>
Message-ID: <2f2990a7-c8ad-0b29-3f63-b4ef648677bc@xen.org>
Date: Wed, 1 Jan 2020 13:26:30 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:68.0)
 Gecko/20100101 Thunderbird/68.3.1
MIME-Version: 1.0
In-Reply-To: <CAMmSBy9EP0Brn8P-N61LEZA1-RH9uBQ3NWNrvA070=PCnboy7g@mail.gmail.com>
Content-Language: en-GB
Subject: Re: [Xen-devel] REGRESSION: Xen 4.13 RC5 fails to bootstrap Dom0 on
 ARM
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: xen-devel@lists.xenproject.org, Stefano Stabellini <sstabellini@kernel.org>,
 Stefano Stabellini <stefano.stabellini@xilinx.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

CgpPbiAzMS8xMi8yMDE5IDIyOjQ4LCBSb21hbiBTaGFwb3NobmlrIHdyb3RlOgo+IEhpIQoKSGks
Cgo+IAo+IEdvb2QgbmV3czogb25lIHRoYXQgdHlwZSB3YXMgZml4ZWQgWGVuIGJvb3RlZCBqdXN0
IGZpbmUgYW5kIGRldGVjdGVkCj4gYWxsIHRoZSBhdmFpbGFibGUgMkcgb2YgbWVtb3J5LgoKVGhh
bmsgeW91IGZvciB0ZXN0aW5nLiBAU3RlZmFubyBhcmUgeW91IGdvaW5nIHRvIHByZXBhcmUgYW5k
IHN1Ym1pdCB0aGUgCnBhdGNoPwoKQ2hlZXJzLAoKLS0gCkp1bGllbiBHcmFsbAoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcg
bGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9q
ZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
