Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C295DE0DF3
	for <lists+xen-devel@lfdr.de>; Tue, 22 Oct 2019 23:58:56 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iN27O-0004Si-7g; Tue, 22 Oct 2019 21:55:06 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=lcDy=YP=intel.com=dan.j.williams@srs-us1.protection.inumbo.net>)
 id 1iN27M-0004Sd-Q7
 for xen-devel@lists.xenproject.org; Tue, 22 Oct 2019 21:55:04 +0000
X-Inumbo-ID: 991b1198-f516-11e9-beca-bc764e2007e4
Received: from mail-ot1-x342.google.com (unknown [2607:f8b0:4864:20::342])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 991b1198-f516-11e9-beca-bc764e2007e4;
 Tue, 22 Oct 2019 21:55:02 +0000 (UTC)
Received: by mail-ot1-x342.google.com with SMTP id g13so15583829otp.8
 for <xen-devel@lists.xenproject.org>; Tue, 22 Oct 2019 14:55:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=intel-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=X+xhy3C7ct4Wd70Xt4OQNAyYmD6XISU1mkD27wwsH4c=;
 b=e6GVBLMv/V4iAdkfWlAXzADW0DLH0ywch5G0LGr+6++slwJhs2ysGTULdUcotQKYgd
 WvTyOi8z9vET1krZn1EMRocnjmPrLDAWWBl0e+DDdfTIVpda3KbYcobsSukz/xXtnWSC
 ZQtGJrQtK05zIxxgAns0ZaO0HHZ9zxQd3iOnrg9SRoBF3dwEbgxB6kbHp1i3JTqB9Fj9
 opopASozuNvGmtfcE2psfc/mttjRcEa+QRgxLSQdWXH9K3QGe+2rJ5AJpXwm355yEKqj
 kWc+H/zOB1wp7gTllbz46Sbxau/Gyb16yQFt7zE0emKw99oiq7QMqumCqJj5kMsWralz
 baBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=X+xhy3C7ct4Wd70Xt4OQNAyYmD6XISU1mkD27wwsH4c=;
 b=nbWJmDJZ1lqhCcBiQtHDWMsmbjidTv5mXy19rDftwCrPD/kCiBZ4rRo33iHilh59fW
 fBFfzpOLTtmkpMe6vKdJv61TBjb40OalnhJw9ItOl3ElAq8tBhB9JRy4deGA+EIQKjiY
 R7A9UwU0Rz5+U8Y87sSiWBMK2V+QLXx4sOxQPyx/LLyg2PA+voSHODfxET4ig+akkO5A
 vUjpnOYe1UVEqHnm1oOBCKSpfDwaYnha6XVEvuFpCMMfCalKInXsQ92sEPZQI0syzBqn
 Kv3h0JF+KnmF6TlgJszjBepVDBd0lSkpIY7PRrbWeNY83geal4+GEKIuPwh4wbuIhgH0
 vj+g==
X-Gm-Message-State: APjAAAUPH1wBf1VEyw52Vlw4XR7M9d2FO+2sg7525nozsrC4Hyz0pNkL
 UN76WwiXDooVI6T3CPl+XgKXkn6Vjzpb5VA3hZLlrg==
X-Google-Smtp-Source: APXvYqwiQBeyg9j33QDXGkD1y7feKBrNdPRGKNKM/b+c8diEhCMBl1zIP9b9Mw2m1ljAM+dxjsHOktasSwWYIWy9hhA=
X-Received: by 2002:a05:6830:1b78:: with SMTP id
 d24mr4571406ote.363.1571781301217; 
 Tue, 22 Oct 2019 14:55:01 -0700 (PDT)
MIME-Version: 1.0
References: <20191022171239.21487-1-david@redhat.com>
In-Reply-To: <20191022171239.21487-1-david@redhat.com>
From: Dan Williams <dan.j.williams@intel.com>
Date: Tue, 22 Oct 2019 14:54:47 -0700
Message-ID: <CAPcyv4gJ+2he2E-6D0QZvkFWvRM9Fsvn9cAoPZbcU4zvsDHcEQ@mail.gmail.com>
To: David Hildenbrand <david@redhat.com>
Subject: Re: [Xen-devel] [PATCH RFC v1 00/12] mm: Don't mark hotplugged
 pages PG_reserved (including ZONE_DEVICE)
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
Cc: Kate Stewart <kstewart@linuxfoundation.org>, linux-hyperv@vger.kernel.org,
 Michal Hocko <mhocko@suse.com>,
 =?UTF-8?B?UmFkaW0gS3LEjW3DocWZ?= <rkrcmar@redhat.com>,
 KVM list <kvm@vger.kernel.org>, Pavel Tatashin <pavel.tatashin@microsoft.com>,
 KarimAllah Ahmed <karahmed@amazon.de>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Dave Hansen <dave.hansen@linux.intel.com>,
 Alexander Duyck <alexander.duyck@gmail.com>, Michal Hocko <mhocko@kernel.org>,
 Paul Mackerras <paulus@ozlabs.org>, Linux MM <linux-mm@kvack.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>,
 "H. Peter Anvin" <hpa@zytor.com>, Wanpeng Li <wanpengli@tencent.com>,
 Alexander Duyck <alexander.h.duyck@linux.intel.com>,
 "K. Y. Srinivasan" <kys@microsoft.com>, Fabio Estevam <festevam@gmail.com>,
 Ben Chan <benchan@chromium.org>, Kees Cook <keescook@chromium.org>,
 devel@driverdev.osuosl.org, Stefano Stabellini <sstabellini@kernel.org>,
 Stephen Hemminger <sthemmin@microsoft.com>,
 "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>,
 Joerg Roedel <joro@8bytes.org>, X86 ML <x86@kernel.org>,
 YueHaibing <yuehaibing@huawei.com>, Mike Rapoport <rppt@linux.ibm.com>,
 Madhumitha Prabakaran <madhumithabiw@gmail.com>,
 Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>,
 Vlastimil Babka <vbabka@suse.cz>, Nishka Dasgupta <nishkadg.linux@gmail.com>,
 Anthony Yznaga <anthony.yznaga@oracle.com>, Oscar Salvador <osalvador@suse.de>,
 Dan Carpenter <dan.carpenter@oracle.com>,
 "Isaac J. Manjarres" <isaacm@codeaurora.org>,
 Matt Sickler <Matt.Sickler@daktronics.com>, Juergen Gross <jgross@suse.com>,
 Anshuman Khandual <anshuman.khandual@arm.com>,
 Haiyang Zhang <haiyangz@microsoft.com>,
 =?UTF-8?Q?Simon_Sandstr=C3=B6m?= <simon@nikanor.nu>,
 Sasha Levin <sashal@kernel.org>, kvm-ppc@vger.kernel.org,
 Qian Cai <cai@lca.pw>, Alex Williamson <alex.williamson@redhat.com>,
 Mike Rapoport <rppt@linux.vnet.ibm.com>, Borislav Petkov <bp@alien8.de>,
 Nicholas Piggin <npiggin@gmail.com>, Andy Lutomirski <luto@kernel.org>,
 xen-devel <xen-devel@lists.xenproject.org>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Todd Poynor <toddpoynor@google.com>, Vitaly Kuznetsov <vkuznets@redhat.com>,
 Allison Randal <allison@lohutok.net>, Jim Mattson <jmattson@google.com>,
 Christophe Leroy <christophe.leroy@c-s.fr>, Vandana BN <bnvandana@gmail.com>,
 Jeremy Sowden <jeremy@azazel.net>, Mel Gorman <mgorman@techsingularity.net>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Cornelia Huck <cohuck@redhat.com>, Pavel Tatashin <pasha.tatashin@soleen.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Sean Christopherson <sean.j.christopherson@intel.com>,
 Rob Springer <rspringer@google.com>, Thomas Gleixner <tglx@linutronix.de>,
 Johannes Weiner <hannes@cmpxchg.org>, Paolo Bonzini <pbonzini@redhat.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGkgRGF2aWQsCgpUaGFua3MgZm9yIHRhY2tsaW5nIHRoaXMhCgpPbiBUdWUsIE9jdCAyMiwgMjAx
OSBhdCAxMDoxMyBBTSBEYXZpZCBIaWxkZW5icmFuZCA8ZGF2aWRAcmVkaGF0LmNvbT4gd3JvdGU6
Cj4KPiBUaGlzIHNlcmllcyBpcyBiYXNlZCBvbiBbMl0sIHdoaWNoIHNob3VsZCBwb3AgdXAgaW4g
bGludXgvbmV4dCBzb29uOgo+ICAgICAgICAgaHR0cHM6Ly9sa21sLm9yZy9sa21sLzIwMTkvMTAv
MjEvMTAzNAo+Cj4gVGhpcyBpcyB0aGUgcmVzdWx0IG9mIGEgcmVjZW50IGRpc2N1c3Npb24gd2l0
aCBNaWNoYWwgKFsxXSwgWzJdKS4gUmlnaHQKPiBub3cgd2Ugc2V0IGFsbCBwYWdlcyBQR19yZXNl
cnZlZCB3aGVuIGluaXRpYWxpemluZyBob3RwbHVnZ2VkIG1lbW1hcHMuIFRoaXMKPiBpbmNsdWRl
cyBaT05FX0RFVklDRSBtZW1vcnkuIEluIGNhc2Ugb2Ygc3lzdGVtIG1lbW9yeSwgUEdfcmVzZXJ2
ZWQgaXMKPiBjbGVhcmVkIGFnYWluIHdoZW4gb25saW5pbmcgdGhlIG1lbW9yeSwgaW4gY2FzZSBv
ZiBaT05FX0RFVklDRSBtZW1vcnkKPiBuZXZlci4gSW4gYW5jaWVudCB0aW1lcywgd2UgbmVlZGVk
IFBHX3Jlc2VydmVkLCBiZWNhdXNlIHRoZXJlIHdhcyBubyB3YXkKPiB0byB0ZWxsIHdoZXRoZXIg
dGhlIG1lbW1hcCB3YXMgYWxyZWFkeSBwcm9wZXJseSBpbml0aWFsaXplZC4gV2Ugbm93IGhhdmUK
PiBTRUNUSU9OX0lTX09OTElORSBmb3IgdGhhdCBpbiB0aGUgY2FzZSBvZiAhWk9ORV9ERVZJQ0Ug
bWVtb3J5LiBaT05FX0RFVklDRQo+IG1lbW9yeSBpcyBhbHJlYWR5IGluaXRpYWxpemVkIGRlZmVy
cmVkLCBhbmQgdGhlcmUgc2hvdWxkbid0IGJlIGEgdmlzaWJsZQo+IGNoYW5nZSBpbiB0aGF0IHJl
Z2FyZC4KPgo+IEkgcmVtZW1iZXIgdGhhdCBzb21lIHRpbWUgYWdvLCB3ZSBhbHJlYWR5IHRhbGtl
ZCBhYm91dCBzdG9wcGluZyB0byBzZXQKPiBaT05FX0RFVklDRSBwYWdlcyBQR19yZXNlcnZlZCBv
biB0aGUgbGlzdCwgYnV0IEkgbmV2ZXIgc2F3IGFueSBwYXRjaGVzLgo+IEFsc28sIEkgZm9yZ290
IHdobyB3YXMgcGFydCBvZiB0aGUgZGlzY3Vzc2lvbiA6KQoKWW91IGdvdCBtZSwgQWxleCwgYW5k
IEtWTSBmb2xrcyBvbiB0aGUgQ2MsIHNvIEknZCBzYXkgdGhhdCB3YXMgaXQuCgo+IE9uZSBvZiB0
aGUgYmlnZ2VzdCBmZWFyIHdlcmUgc2lkZSBlZmZlY3RzLiBJIHdlbnQgYWhlYWQgYW5kIGF1ZGl0
ZWQgYWxsCj4gdXNlcnMgb2YgUGFnZVJlc2VydmVkKCkuIFRoZSBvbmVzIHRoYXQgZG9uJ3QgbmVl
ZCBhbnkgY2FyZSAocGF0Y2hlcykKPiBjYW4gYmUgZm91bmQgYmVsb3cuIEkgd2lsbCBkb3VibGUg
Y2hlY2sgYW5kIGhvcGUgSSBhbSBub3QgbWlzc2luZyBzb21ldGhpbmcKPiBpbXBvcnRhbnQuCj4K
PiBJIGFtIHByb2JhYmx5IGEgbGl0dGxlIGJpdCB0b28gY2FyZWZ1bCAoYnV0IEkgZG9uJ3Qgd2Fu
dCB0byBicmVhayB0aGluZ3MpLgo+IEluIG1vc3QgcGxhY2VzIChiZXNpZGVzIEtWTSBhbmQgdmZp
byB0aGF0IGFyZSBudXRzKSwgdGhlCj4gcGZuX3RvX29ubGluZV9wYWdlKCkgY2hlY2sgY291bGQg
bW9zdCBwcm9iYWJseSBiZSBhdm9pZGVkIGJ5IGEKPiBpc196b25lX2RldmljZV9wYWdlKCkgY2hl
Y2suIEhvd2V2ZXIsIEkgdXN1YWxseSBnZXQgc3VzcGljaW91cyB3aGVuIEkgc2VlCj4gYSBwZm5f
dmFsaWQoKSBjaGVjayAoZXNwZWNpYWxseSBhZnRlciBJIGxlYXJuZWQgdGhhdCBwZW9wbGUgbW1h
cCBwYXJ0cyBvZgo+IC9kZXYvbWVtIGludG8gdXNlciBzcGFjZSwgaW5jbHVkaW5nIG1lbW9yeSB3
aXRob3V0IG1lbW1hcHMuIEFsc28sIHBlb3BsZQo+IGNvdWxkIG1lbW1hcCBvZmZsaW5lIG1lbW9y
eSBibG9ja3MgdGhpcyB3YXkgOi8pLiBBcyBsb25nIGFzIHRoaXMgZG9lcyBub3QKPiBodXJ0IHBl
cmZvcm1hbmNlLCBJIHRoaW5rIHdlIHNob3VsZCByYXRoZXIgZG8gaXQgdGhlIGNsZWFuIHdheS4K
CkknbSBjb25jZXJuZWQgYWJvdXQgdXNpbmcgaXNfem9uZV9kZXZpY2VfcGFnZSgpIGluIHBsYWNl
cyB0aGF0IGFyZSBub3QKa25vd24gdG8gYWxyZWFkeSBoYXZlIGEgcmVmZXJlbmNlIHRvIHRoZSBw
YWdlLiBIZXJlJ3MgYW4gYXVkaXQgb2YKY3VycmVudCB1c2FnZXMsIGFuZCB0aGUgb25lcyBJIHRo
aW5rIG5lZWQgdG8gY2xlYW5lZCB1cC4gVGhlICJ1bnNhZmUiCm9uZXMgZG8gbm90IGFwcGVhciB0
byBoYXZlIGFueSBwcm90ZWN0aW9ucyBhZ2FpbnN0IHRoZSBkZXZpY2UgcGFnZQpiZWluZyByZW1v
dmVkIChnZXRfZGV2X3BhZ2VtYXAoKSkuIFllcywgc29tZSBvZiB0aGVzZSB3ZXJlIGFkZGVkIGJ5
Cm1lLiBUaGUgInVuc2FmZT8gSE1NIiBvbmVzIG5lZWQgSE1NIGV5ZXMgYmVjYXVzZSBITU0gbGVh
a3MgZGV2aWNlCnBhZ2VzIGludG8gYW5vbnltb3VzIG1lbW9yeSBwYXRocyBhbmQgSSdtIG5vdCB1
cCB0byBzcGVlZCBvbiBob3cgaXQKZ3VhcmFudGVlcyAnc3RydWN0IHBhZ2UnIHZhbGlkaXR5IHZz
IGRldmljZSBzaHV0ZG93biB3aXRob3V0IHVzaW5nCmdldF9kZXZfcGFnZW1hcCgpLgoKc21hcHNf
cG1kX2VudHJ5KCk6IHVuc2FmZQoKcHV0X2Rldm1hcF9tYW5hZ2VkX3BhZ2UoKTogc2FmZSwgcGFn
ZSByZWZlcmVuY2UgaXMgaGVsZAoKaXNfZGV2aWNlX3ByaXZhdGVfcGFnZSgpOiBzYWZlPyBncHUg
ZHJpdmVyIG1hbmFnZXMgcHJpdmF0ZSBwYWdlIGxpZmV0aW1lCgppc19wY2lfcDJwZG1hX3BhZ2Uo
KTogc2FmZSwgcGFnZSByZWZlcmVuY2UgaXMgaGVsZAoKdW5jaGFyZ2VfcGFnZSgpOiB1bnNhZmU/
IEhNTQoKYWRkX3RvX2tpbGwoKTogc2FmZSwgcHJvdGVjdGVkIGJ5IGdldF9kZXZfcGFnZW1hcCgp
IGFuZCBkYXhfbG9ja19wYWdlKCkKCnNvZnRfb2ZmbGluZV9wYWdlKCk6IHVuc2FmZQoKcmVtb3Zl
X21pZ3JhdGlvbl9wdGUoKTogdW5zYWZlPyBITU0KCm1vdmVfdG9fbmV3X3BhZ2UoKTogdW5zYWZl
PyBITU0KCm1pZ3JhdGVfdm1hX3BhZ2VzKCkgYW5kIGhlbHBlcnM6IHVuc2FmZT8gSE1NCgp0cnlf
dG9fdW5tYXBfb25lKCk6IHVuc2FmZT8gSE1NCgpfX3B1dF9wYWdlKCk6IHNhZmUKCnJlbGVhc2Vf
cGFnZXMoKTogc2FmZQoKSSdtIGhvcGluZyBhbGwgdGhlIEhNTSBvbmVzIGNhbiBiZSBjb252ZXJ0
ZWQgdG8KaXNfZGV2aWNlX3ByaXZhdGVfcGFnZSgpIGRpcmVjdGxseSBhbmQgaGF2ZSB0aGF0IHJv
dXRpbmUgZ3JvdyBhIG5pY2UKY29tbWVudCBhYm91dCBob3cgaXQga25vd3MgaXQgY2FuIGFsd2F5
cyBzYWZlbHkgZGUtcmVmZXJlbmNlIGl0cyBAcGFnZQphcmd1bWVudC4KCkZvciB0aGUgcmVzdCBJ
J2QgbGlrZSB0byBwcm9wb3NlIHRoYXQgd2UgYWRkIGEgZmFjaWxpdHkgdG8gZGV0ZXJtaW5lClpP
TkVfREVWSUNFIGJ5IHBmbiByYXRoZXIgdGhhbiBwYWdlLiBUaGUgbW9zdCBzdHJhaWdodGZvcndh
cmQgd2h5IEkKY2FuIHRoaW5rIG9mIHdvdWxkIGJlIHRvIGp1c3QgYWRkIGFub3RoZXIgYml0bWFw
IHRvIG1lbV9zZWN0aW9uX3VzYWdlCnRvIGluZGljYXRlIGlmIGEgc3Vic2VjdGlvbiBpcyBaT05F
X0RFVklDRSBvciBub3QuCgo+Cj4gSSBvbmx5IGdhdmUgaXQgYSBxdWljayB0ZXN0IHdpdGggRElN
TXMgb24geDg2LTY0LCBidXQgZGlkbid0IHRlc3QgdGhlCj4gWk9ORV9ERVZJQ0UgcGFydCBhdCBh
bGwgKGFueSB0aXBzIGZvciBhIG5pY2UgUUVNVSBzZXR1cD8pLiBDb21waWxlLXRlc3RlZAo+IG9u
IHg4Ni02NCBhbmQgUFBDLgoKSSdsbCBnaXZlIGl0IGEgc3BpbiwgYnV0IEkgZG9uJ3QgdGhpbmsg
dGhlIGtlcm5lbCB3YW50cyB0byBncm93IG1vcmUKaXNfem9uZV9kZXZpY2VfcGFnZSgpIHVzZXJz
LgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRl
dmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9s
aXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
