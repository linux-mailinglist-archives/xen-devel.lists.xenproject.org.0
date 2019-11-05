Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 985FFF08A1
	for <lists+xen-devel@lfdr.de>; Tue,  5 Nov 2019 22:45:53 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iS6bi-0008LL-WF; Tue, 05 Nov 2019 21:43:22 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=OEmz=Y5=zytor.com=hpa@srs-us1.protection.inumbo.net>)
 id 1iS6bh-0008LG-Ix
 for xen-devel@lists.xenproject.org; Tue, 05 Nov 2019 21:43:21 +0000
X-Inumbo-ID: 484d36ce-0015-11ea-a1a4-12813bfff9fa
Received: from mail.zytor.com (unknown [198.137.202.136])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 484d36ce-0015-11ea-a1a4-12813bfff9fa;
 Tue, 05 Nov 2019 21:43:20 +0000 (UTC)
Received: from carbon-x1.hos.anvin.org
 ([IPv6:2601:646:8600:3281:e7ea:4585:74bd:2ff0])
 (authenticated bits=0)
 by mail.zytor.com (8.15.2/8.15.2) with ESMTPSA id xA5LeY98676567
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NO);
 Tue, 5 Nov 2019 13:40:34 -0800
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.zytor.com xA5LeY98676567
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zytor.com;
 s=2019091901; t=1572990035;
 bh=hV95SYGgMVR5wGxxOALwv/ps4w4vExuRTEInenwJJ/8=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=nXSmzhHh3MMQiHdNjLkOYKgl+nxPFIG9UR1AlYj0pB1u/YFIeiEOSUxo0D4V7Z52P
 DuOOHXX3pN3t3HPiT/HWLYRpAHfwBSBW85fVcO52n6xIoDfb5kfXr3saCRpsgjjz4F
 rz9WpEnNMhEI2gAKERTR/q+Er5zCtOar+BnEzg5+riWFrc6Qf8rgqAJQ6lo9+piMUE
 ugWD97HlNeJipb9ecQ5q8ZkamOHSXie9U5EL/pF0YDyKMODesaKW7dS8wssyCi92Ee
 2T0gwFp7Zgx5l+cKaq714MOAZDGtjbnsnnvXRwLsf5hNVK8u0oxsouwiRPVlSZZjjC
 7I7HgRVitwnmg==
To: Daniel Kiper <daniel.kiper@oracle.com>, linux-efi@vger.kernel.org,
 linux-kernel@vger.kernel.org, x86@kernel.org,
 xen-devel@lists.xenproject.org
References: <20191104151354.28145-1-daniel.kiper@oracle.com>
From: "H. Peter Anvin" <hpa@zytor.com>
Message-ID: <d45aa4da-57fd-757f-3f82-d88449f057ce@zytor.com>
Date: Tue, 5 Nov 2019 13:40:28 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <20191104151354.28145-1-daniel.kiper@oracle.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v5 0/3] x86/boot: Introduce the kernel_info
 et consortes
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
Cc: jgross@suse.com, eric.snowberg@oracle.com, ard.biesheuvel@linaro.org,
 konrad.wilk@oracle.com, corbet@lwn.net, peterz@infradead.org,
 ross.philipson@oracle.com, dave.hansen@linux.intel.com, mingo@redhat.com,
 bp@alien8.de, rdunlap@infradead.org, luto@kernel.org,
 kanth.ghatraju@oracle.com, boris.ostrovsky@oracle.com, tglx@linutronix.de
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjAxOS0xMS0wNCAwNzoxMywgRGFuaWVsIEtpcGVyIHdyb3RlOgo+IEhpLAo+IAo+IER1ZSB0
byB2ZXJ5IGxpbWl0ZWQgc3BhY2UgaW4gdGhlIHNldHVwX2hlYWRlciB0aGlzIHBhdGNoIHNlcmll
cyBpbnRyb2R1Y2VzIG5ldwo+IGtlcm5lbF9pbmZvIHN0cnVjdCB3aGljaCB3aWxsIGJlIHVzZWQg
dG8gY29udmV5IGluZm9ybWF0aW9uIGZyb20gdGhlIGtlcm5lbCB0bwo+IHRoZSBib290bG9hZGVy
LiBUaGlzIHdheSB0aGUgYm9vdCBwcm90b2NvbCBjYW4gYmUgZXh0ZW5kZWQgcmVnYXJkbGVzcyBv
ZiB0aGUKPiBzZXR1cF9oZWFkZXIgbGltaXRhdGlvbnMuIEFkZGl0aW9uYWxseSwgdGhlIHBhdGNo
IHNlcmllcyBpbnRyb2R1Y2VzIHNvbWUKPiBjb252ZW5pZW5jZSBmZWF0dXJlcyBsaWtlIHRoZSBz
ZXR1cF9pbmRpcmVjdCBzdHJ1Y3QgYW5kIHRoZQo+IGtlcm5lbF9pbmZvLnNldHVwX3R5cGVfbWF4
IGZpZWxkLgo+IAo+IERhbmllbAo+IAoKTG9va3MgZ3JlYXQhICBTaGlwIGl0IQoKUmV2aWV3ZWQt
Ynk6IEguIFBldGVyIEFudmluIChJbnRlbCkgPGhwYUB6eXRvci5jb20+CgoJLWhwYQoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxp
bmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5w
cm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
