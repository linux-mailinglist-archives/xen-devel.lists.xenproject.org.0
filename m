Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4095E165CDA
	for <lists+xen-devel@lfdr.de>; Thu, 20 Feb 2020 12:36:30 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j4k3x-0007oB-8z; Thu, 20 Feb 2020 11:32:13 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=CM6a=4I=redhat.com=pbonzini@srs-us1.protection.inumbo.net>)
 id 1j4k3v-0007o6-F0
 for xen-devel@lists.xenproject.org; Thu, 20 Feb 2020 11:32:11 +0000
X-Inumbo-ID: a11cf971-53d4-11ea-8507-12813bfff9fa
Received: from us-smtp-1.mimecast.com (unknown [207.211.31.81])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id a11cf971-53d4-11ea-8507-12813bfff9fa;
 Thu, 20 Feb 2020 11:32:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1582198328;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=QWVB1EwMWCtwKFBhcpbo7xi/6/S5cmCGv79iOGlT5xw=;
 b=QdtSMkUpPFTjFKnUnmj5/UfrmD4ZCq26bWFG0DcPbPT1yJRjDd9q/qVfpQOmri5p3zPrh3
 lTxe46p9l5X0+QUVqi8Qn8xbgshR8bogeL2JHZMJG2nRP6d1de8fsnaDZSN+aIojZzL3zT
 lE8lm2mLL+sCpZZ/cJ95/21lbrN5urc=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-37-syUCacbZMdye20nzRXxC6A-1; Thu, 20 Feb 2020 06:32:05 -0500
X-MC-Unique: syUCacbZMdye20nzRXxC6A-1
Received: by mail-wm1-f72.google.com with SMTP id p2so501694wma.3
 for <xen-devel@lists.xenproject.org>; Thu, 20 Feb 2020 03:32:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=QWVB1EwMWCtwKFBhcpbo7xi/6/S5cmCGv79iOGlT5xw=;
 b=ZcGXLWtfBhjl07vWh+UqN/Z0J7qLdcA4hUmoclsNQxFlA55604JTNBCGBQCuudIAty
 8LbRaiY4cbJTdoJhhY47g1ckMKNPG2rxlzjaCvQIcXKwI6ZUZGLiIaswjV2xs1SI/3V1
 24hVHfRF5kuapwPnPHpYL4PeYtMuobHxUrcpDVkrOBDfYRQ9l05Z3lyRcjrIusWPxNKX
 FPiD6ZYzPo7tlHbXLJNi3qY1KyQuZkdnmQRFM2ANyTp3aEUCyxwYkIeElgi1oL4GcUVp
 saqKkLplaUoTzmH9QuLvmZjCu8KSdCHaUgXduk1CmhVtL88addxvFLz/Hl/gRbRIBEDK
 D+Zg==
X-Gm-Message-State: APjAAAV+pIlEM3LUgWlbylQe1MzLKawJlrmhDLlH0IM+QWFuuATfm01w
 nGsW0awiuAnxI5lQr/fSWOBtwNGQMYCKEXAOE7A5iy8m9j3llRyv4V9rnWaeCz+SMzKU5wckTct
 tADJvZY+MJGZimdqpqec+A/LaTQw=
X-Received: by 2002:a1c:3906:: with SMTP id g6mr4171977wma.49.1582198324271;
 Thu, 20 Feb 2020 03:32:04 -0800 (PST)
X-Google-Smtp-Source: APXvYqwsoI898pHRfDhuvY3JvyY0B/1bK61gq6BrS8ThT8yE8p9feUNDHNl/G1Axzr0++wyymYpNOw==
X-Received: by 2002:a1c:3906:: with SMTP id g6mr4171938wma.49.1582198324020;
 Thu, 20 Feb 2020 03:32:04 -0800 (PST)
Received: from [10.201.49.12] (nat-pool-mxp-u.redhat.com. [149.6.153.187])
 by smtp.gmail.com with ESMTPSA id a13sm4118958wrp.93.2020.02.20.03.32.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 20 Feb 2020 03:32:03 -0800 (PST)
To: Peter Maydell <peter.maydell@linaro.org>, Stefan Weil <sw@weilnetz.de>
References: <20200218132023.22936-1-philmd@redhat.com>
 <87e06de3-179b-54a1-3451-39a0a30b65f0@weilnetz.de>
 <CAFEAcA9Jr2Yi1K8_9MGUJYt8C=OcKbWDh1UJjTQG1EspLux3JQ@mail.gmail.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <86e6b3cf-f137-4980-739e-61690a9249c2@redhat.com>
Date: Thu, 20 Feb 2020 12:32:02 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <CAFEAcA9Jr2Yi1K8_9MGUJYt8C=OcKbWDh1UJjTQG1EspLux3JQ@mail.gmail.com>
Content-Language: en-US
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Subject: Re: [Xen-devel] [PATCH] Avoid cpu_physical_memory_rw() with a
 constant is_write argument
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
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Eduardo Habkost <ehabkost@redhat.com>, Paul Durrant <paul@xen.org>,
 QEMU Developers <qemu-devel@nongnu.org>,
 Anthony Perard <anthony.perard@citrix.com>,
 "open list:X86" <xen-devel@lists.xenproject.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 Richard Henderson <rth@twiddle.net>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTgvMDIvMjAgMTk6NDksIFBldGVyIE1heWRlbGwgd3JvdGU6Cj4gRGVwZW5kaW5nIG9uIHdo
aWNoIHdheSB3ZSBnbyB3ZSB3b3VsZCBlaXRoZXIgd2FudCB0byByZW1vdmUgdGhlc2UKPiBjYXN0
cywgb3Igbm90Lgo+IAo+IEkgZ3Vlc3MgdGhhdCB3ZSBoYXZlIG1vcmUgY2FzZXMgb2YgJ3ZvaWQq
JywgYW5kIHRoYXQgd291bGQKPiBjZXJ0YWlubHkgYmUgdGhlIGVhc2llciB3YXkgdG8gY29udmVy
dCAob3RoZXJ3aXNlIHdlIHByb2JhYmx5Cj4gbmVlZCB0byBhZGQgYSBidW5jaCBvZiBuZXcgY2Fz
dHMgdG8gdWludDhfdCogaW4gdmFyaW91cyBjYWxsc2l0ZXMpLAo+IGJ1dCBJIGRvbid0IGhhdmUg
YSBzdHJvbmcgb3Bpbmlvbi4gUGFvbG8gPwoKSSBhZ3JlZSB3ZSBzaG91bGQgdXNlIHZvaWQqIChw
b3NzaWJseSBjb25zdCkuCgpQYW9sbwoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhl
bnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5m
by94ZW4tZGV2ZWw=
