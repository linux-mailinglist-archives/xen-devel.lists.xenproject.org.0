Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BCE86560E8
	for <lists+xen-devel@lfdr.de>; Wed, 26 Jun 2019 05:53:18 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hfyxr-0000EL-LA; Wed, 26 Jun 2019 03:51:19 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=b9+3=UZ=kernel.org=luto@srs-us1.protection.inumbo.net>)
 id 1hfyxq-0000EG-SN
 for xen-devel@lists.xenproject.org; Wed, 26 Jun 2019 03:51:18 +0000
X-Inumbo-ID: a71e5312-97c5-11e9-bf3a-cf3016b8e3e9
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id a71e5312-97c5-11e9-bf3a-cf3016b8e3e9;
 Wed, 26 Jun 2019 03:51:18 +0000 (UTC)
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com
 [209.85.221.42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 792FF21783
 for <xen-devel@lists.xenproject.org>; Wed, 26 Jun 2019 03:51:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1561521077;
 bh=bZ1G2S3PGPwXnzJ2rk9+AJfTR7RiYbBDCp2Ne0/fTPM=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=hDpnehLLZWYQsb4aX9YZYzguXD8TTUSAIhULp729n8DAd3sPSpCCjjH+HzCPLwdZd
 b7eIz7p7jzWRuAZuJf+gL4x8oEpDDZ1WHdrxlJzrAbNnzfkQ4tgX4ZJLAL3u/PvZx1
 JmoDEivgDpfzwuzPz30YkfqmKdCjBVNxvm3Drhkk=
Received: by mail-wr1-f42.google.com with SMTP id v14so924446wrr.4
 for <xen-devel@lists.xenproject.org>; Tue, 25 Jun 2019 20:51:17 -0700 (PDT)
X-Gm-Message-State: APjAAAXenRa/wOmrJyOCTztE1r2mNAZEp4O5HzLBfcMb1nLP+QMatxLo
 bUoFV6WEGb7ypCiJPcdGpzUTSFd7zcFJmGUKf1NFPw==
X-Google-Smtp-Source: APXvYqxhbwnXC+HHtbgLXKDHMg8L3l+e67NPNctbsjFY5QgqxzbbdaPZPdECVjYrpk2ZK2KQAYoaSiz68v0i6AaL3z0=
X-Received: by 2002:adf:f606:: with SMTP id t6mr1183395wrp.265.1561521076028; 
 Tue, 25 Jun 2019 20:51:16 -0700 (PDT)
MIME-Version: 1.0
References: <20190613064813.8102-1-namit@vmware.com>
 <20190613064813.8102-5-namit@vmware.com>
 <CALCETrXyJ8y7PSqf+RmGKjM4VSLXmNEGi6K=Jzw4jmckRQECTg@mail.gmail.com>
 <28C3D489-54E4-4670-B726-21B09FA469EE@vmware.com>
In-Reply-To: <28C3D489-54E4-4670-B726-21B09FA469EE@vmware.com>
From: Andy Lutomirski <luto@kernel.org>
Date: Tue, 25 Jun 2019 20:51:05 -0700
X-Gmail-Original-Message-ID: <CALCETrUicyG0NJfj309zU6SX1Xdq6gcmC9+zGLqW4iFkodnWjw@mail.gmail.com>
Message-ID: <CALCETrUicyG0NJfj309zU6SX1Xdq6gcmC9+zGLqW4iFkodnWjw@mail.gmail.com>
To: Nadav Amit <namit@vmware.com>
Subject: Re: [Xen-devel] [PATCH 4/9] x86/mm/tlb: Flush remote and local TLBs
 concurrently
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
Cc: Sasha Levin <sashal@kernel.org>, Juergen Gross <jgross@suse.com>,
 "linux-hyperv@vger.kernel.org" <linux-hyperv@vger.kernel.org>,
 Dave Hansen <dave.hansen@linux.intel.com>,
 Stephen Hemminger <sthemmin@microsoft.com>, kvm list <kvm@vger.kernel.org>,
 Peter Zijlstra <peterz@infradead.org>, Haiyang Zhang <haiyangz@microsoft.com>,
 X86 ML <x86@kernel.org>, LKML <linux-kernel@vger.kernel.org>,
 Linux Virtualization <virtualization@lists.linux-foundation.org>,
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
 Andy Lutomirski <luto@kernel.org>, xen-devel <xen-devel@lists.xenproject.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Thomas Gleixner <tglx@linutronix.de>,
 "K. Y. Srinivasan" <kys@microsoft.com>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVHVlLCBKdW4gMjUsIDIwMTkgYXQgODo0OCBQTSBOYWRhdiBBbWl0IDxuYW1pdEB2bXdhcmUu
Y29tPiB3cm90ZToKPgo+ID4gT24gSnVuIDI1LCAyMDE5LCBhdCA4OjM2IFBNLCBBbmR5IEx1dG9t
aXJza2kgPGx1dG9Aa2VybmVsLm9yZz4gd3JvdGU6Cj4gPgo+ID4gT24gV2VkLCBKdW4gMTIsIDIw
MTkgYXQgMTE6NDkgUE0gTmFkYXYgQW1pdCA8bmFtaXRAdm13YXJlLmNvbT4gd3JvdGU6Cj4gPj4g
VG8gaW1wcm92ZSBUTEIgc2hvb3Rkb3duIHBlcmZvcm1hbmNlLCBmbHVzaCB0aGUgcmVtb3RlIGFu
ZCBsb2NhbCBUTEJzCj4gPj4gY29uY3VycmVudGx5LiBJbnRyb2R1Y2UgZmx1c2hfdGxiX211bHRp
KCkgdGhhdCBkb2VzIHNvLiBUaGUgY3VycmVudAo+ID4+IGZsdXNoX3RsYl9vdGhlcnMoKSBpbnRl
cmZhY2UgaXMga2VwdCwgc2luY2UgcGFyYXZpcnR1YWwgaW50ZXJmYWNlcyBuZWVkCj4gPj4gdG8g
YmUgYWRhcHRlZCBmaXJzdCBiZWZvcmUgaXQgY2FuIGJlIHJlbW92ZWQuIFRoaXMgaXMgbGVmdCBm
b3IgZnV0dXJlCj4gPj4gd29yay4gSW4gc3VjaCBQViBlbnZpcm9ubWVudHMsIFRMQiBmbHVzaGVz
IGFyZSBub3QgcGVyZm9ybWVkLCBhdCB0aGlzCj4gPj4gdGltZSwgY29uY3VycmVudGx5Lgo+ID4K
PiA+IFdvdWxkIGl0IGJlIHN0cmFpZ2h0Zm9yd2FyZCB0byBoYXZlIGEgZGVmYXVsdCBQViBmbHVz
aF90bGJfbXVsdGkoKQo+ID4gdGhhdCB1c2VzIGZsdXNoX3RsYl9vdGhlcnMoKSB1bmRlciB0aGUg
aG9vZD8KPgo+IEkgcHJlZmVyIG5vdCB0byBoYXZlIGEgZGVmYXVsdCBQViBpbXBsZW1lbnRhdGlv
biB0aGF0IHNob3VsZCBhbnlob3cgZ28gYXdheS4KPgo+IEkgY2FuIGNyZWF0ZSB1bm9wdGltaXpl
ZCB1bnRlc3RlZCB2ZXJzaW9ucyBmb3IgWGVuIGFuZCBIeXBlci1WLCBpZiB5b3Ugd2FudC4KPgoK
SSB0aGluayBJIHByZWZlciB0aGF0IGFwcHJvYWNoLiAgV2Ugc2hvdWxkIGJlIGFibGUgdG8gZ2V0
IHRoZQptYWludGFpbmVycyB0byB0ZXN0IGl0LiAgSSBkb24ndCBsb3ZlIGhhdmluZyBsZWdhY3kg
cGF0aHMgaW4gdGhlcmUsCmFoZW0sIFVWLgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMu
eGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL3hlbi1kZXZlbA==
