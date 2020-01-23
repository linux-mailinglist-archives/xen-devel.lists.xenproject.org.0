Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 03564146149
	for <lists+xen-devel@lfdr.de>; Thu, 23 Jan 2020 06:16:06 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iuUoK-0000gb-W2; Thu, 23 Jan 2020 05:13:44 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=264E=3M=gmail.com=bobbyeshleman@srs-us1.protection.inumbo.net>)
 id 1iuUoI-0000gW-Qi
 for xen-devel@lists.xenproject.org; Thu, 23 Jan 2020 05:13:42 +0000
X-Inumbo-ID: 1f16a552-3d9f-11ea-9fd7-bc764e2007e4
Received: from mail-yw1-xc42.google.com (unknown [2607:f8b0:4864:20::c42])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 1f16a552-3d9f-11ea-9fd7-bc764e2007e4;
 Thu, 23 Jan 2020 05:13:42 +0000 (UTC)
Received: by mail-yw1-xc42.google.com with SMTP id 10so1041137ywv.5
 for <xen-devel@lists.xenproject.org>; Wed, 22 Jan 2020 21:13:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=FNRNiBa9lzVSTSUHOtHscEyAi7re9EjKBRe2uZYPjGA=;
 b=CKLrwXWcWvk8HmsV+cVsL0kvBqKtHXeG9EkbjCHvYL65Wpj7zRRmPyeKpRWHCA2OJu
 2xpcFFjwfL1BiVeuKyy5wG3LfTiU3JFnUfGi5EGu4VSdz6U3jrDHPS0/fFIvxKMiWFXs
 HMRWHDiXzkm6QuZgn+x+iM35RLLBff3ODf+tHPY/TuoG/eXOkSiCiAAqgD0frO1gGY0B
 04kXJ58PqaHRpjuYun6KZFMS9gZLP2UBO0V3qg3HJ6ckygI3OmfmVQEfRy9RBJts6G8Z
 D0CU8cxvSJFHMc2YFEQ69NJSwRFxnrq6NcLpYKyH2vagdc469JLkXzerqkWWkMAXDugX
 U+pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=FNRNiBa9lzVSTSUHOtHscEyAi7re9EjKBRe2uZYPjGA=;
 b=evO3rFbAjpoGcTJEvYz2vn3mHtE0geGJn3qyNpzUsFtWEMfgp59u9nz2n6NhOpzhlC
 FdU1dSUbHVyolg88iRGv1VugspFEBiw+LJWxa4mGaETzL8Yea++xiAHqDGFgLq0PUD52
 SAmqXM0yXRsjdVUO1rjNrlycSSQkVBiqdbtM82hFfiQ2BoHhqQ/QMnRYa4RTrwPxx9km
 u3B6veCc4GcqmAZjr4x0udwQprbcHy3rYRRdmh98eXvAdYIWr6kBpbWU8npNUro2NTYK
 a1SZRLHymd/hX3yr2ynzQgxpUVlUXEqest2H6SMfjOZa86fXKtG5TG8nB/dR9xZXm+YU
 2FVw==
X-Gm-Message-State: APjAAAVz2ffBoh8CLmTD592qSLeqIkbmNmYZIsnOgqZhSI1cW2lNn5PL
 ejXvWk2jE6RwxBV0l98jBYU=
X-Google-Smtp-Source: APXvYqxUES5nCeY8moZ+01PNukDY6LyoBz4UqoMjXZKBJYh2cGYu67ZFvBrk7u3q27e0FwtKAh4+NA==
X-Received: by 2002:a81:f89:: with SMTP id 131mr10343458ywp.269.1579756421438; 
 Wed, 22 Jan 2020 21:13:41 -0800 (PST)
Received: from bobbye-pc ([216.186.244.35])
 by smtp.gmail.com with ESMTPSA id y66sm364710ywf.79.2020.01.22.21.13.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Jan 2020 21:13:40 -0800 (PST)
Date: Wed, 22 Jan 2020 23:13:38 -0600
From: Bobby Eshleman <bobbyeshleman@gmail.com>
To: Stefano Stabellini <sstabellini@kernel.org>
Message-ID: <20200123051338.GA6612@bobbye-pc>
References: <cover.1579615303.git.bobbyeshleman@gmail.com>
 <f8ca4739-83c7-5829-4663-b1e5796e6490@citrix.com>
 <alpine.DEB.2.21.2001221302400.16648@sstabellini-ThinkPad-T480s>
 <20200123044527.GA5583@bobbye-pc>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200123044527.GA5583@bobbye-pc>
Subject: Re: [Xen-devel] [RFC XEN PATCH 00/23] xen: beginning support for
 RISC-V
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
Cc: Bobby Eshleman <bobbyeshleman@gmail.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 Bobby Eshleman <bobby.eshleman@starlab.io>,
 Dan Robertson <dan@dlrobertson.com>,
 Alistair Francis <alistair.francis@wdc.com>, xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gV2VkLCBKYW4gMjIsIDIwMjAgYXQgMDE6MDU6MTFQTSAtMDgwMCwgU3RlZmFubyBTdGFiZWxs
aW5pIHdyb3RlOgo+IE9uIFdlZCwgMjIgSmFuIDIwMjAsIEFuZHJldyBDb29wZXIgd3JvdGU6Cj4g
PiA+IE15IGJpZyBxdWVzdGlvbnMgYXJlOgo+ID4gPiAJRG9lcyB0aGUgWGVuIHByb2plY3QgaGF2
ZSBpbnRlcmVzdCBpbiBSSVNDLVY/Cj4gPiAKPiA+IFRoZXJlIGlzIHZlcnkgbGFyZ2UgZG93bnN0
cmVhbSBpbnRlcmVzdCBpbiBSSVNDLVYuwqAgU28gYSBkZWZpbml0ZSB5ZXMuCj4gCj4gRGVmaW5p
dGUgWWVzIGZyb20gbWUgdG9vCj4gCgpCb3RoIGdyZWF0IHRvIGhlYXIhCgo+IAo+ID4gPiAJV2hh
dCBjYW4gYmUgZG9uZSB0byBtYWtlIHRoZSBSSVNDLVYgcG9ydCBhcyB1cHN0cmVhbWFibGUgYXMK
PiA+ID4gCQlwb3NzaWJsZT8KPiA+ID4gCUFueSBtYWpvciBwaXRmYWxscz8KPiA+ID4KPiA+ID4g
SXQgd291bGQgYmUgZ3JlYXQgdG8gaGVhciBhbGwgb2YgeW91ciBmZWVkYmFjay4KPiA+IAo+ID4g
Qm90aCBSSVNDLVYgYW5kIFBvd2VyOSBhcmUgZnJlcXVlbnRseSByZXF1ZXN0ZWQgdGhpbmdzLCBh
bmQgYm90aCBzdWZmZXIKPiA+IGZyb20gdGhlIGZhY3QgdGhhdCwgd2hpbGUgd2UgYXMgYSBjb21t
dW5pdHkgd291bGQgbGlrZSB0aGVtLCB0aGUKPiA+IHVwc3RyZWFtIGludGVyc2VjdGlvbiBvZiAi
cGVvcGxlIHdobyBrbm93IFhlbiIgYW5kICJwZW9wbGUgd2hvIGtub3cKPiA+IGVub3VnaCBhcmNo
ICRYIHRvIGRvIGFuIGluaXRpYWwgcG9ydCIgaXMgMC4KPiA+IAo+ID4gVGhpcyBzZXJpZXMgY2xl
YXJseSBkZW1vbnN0cmF0ZXMgYSBjaGFuZ2UgaW4gdGhlIHN0YXR1cyBxdW8sIGFuZCBJIHRoaW5r
Cj4gPiBhIGxvdCBvZiBwZW9wbGUgd2lsbCBiZSBoYXBweS4KPiA+IAo+ID4gVG8gZ2V0IFJJU0Mt
ViB0byBiZWluZyBmdWxseSBzdXBwb3J0ZWQsIHdlIHdpbGwgdWx0aW1hdGVseSBuZWVkIHRvIGdl
dAo+ID4gaGFyZHdhcmUgaW50byB0aGUgQ0kgc3lzdGVtLCBhbmQgYW4gZWFzeSB3YXkgZm9yIGRl
dmVsb3BlcnMgdG8gdGVzdAo+ID4gY2hhbmdlcy7CoCBEbyB5b3UgaGF2ZSBhbnkgdGhvdWdodHMg
b24gcHJvZHVjdGlvbiBSSVNDLVYgaGFyZHdhcmUKPiA+IChpZGVhbGx5IHNlcnZlciBmb3JtIGZh
Y3RvcikgZm9yIHRoZSBDSSBzeXN0ZW0sIGFuZC9vciBkZXYgYm9hcmRzIHdoaWNoCj4gPiBtaWdo
dCBiZSBhdmFpbGFibGUgZmFpcmx5IGNoZWFwbHk/Cj4gCj4gTXkgdW5kZXJzdGFuZGluZyBpcyB0
aGF0IHZpcnR1YWxpemF0aW9uIGRldmVsb3BtZW50IGZvciBSSVNDLVYgaXMgZG9uZQo+IG9uIFFF
TVUgcmlnaHQgbm93ICh3aGljaCBjb3VsZCBzdGlsbCBiZSBob29rZWQgaW50byB0aGUgQ0kgc3lz
dGVtIGlmCj4gc29tZWJvZHkgd2FudGVkIHRvIGRvIHRoZSB3b3JrIEkgdGhpbmsuKQoKVGhhdCBp
cyBjb3JyZWN0LiAgSSB0aGluayB0aGUgUlRMIGFuZCBoYXJkd2FyZSBmb2xrcyBhcmUgd2FpdGlu
ZyBmb3IgdGhlCnNwZWMgdG8gYmUgZmluYWxpemVkIGJlZm9yZSBjb21taXR0aW5nIHRvIHRoZSBl
ZmZvcnQsIHNvIGV2ZXJ5b25lIGlzCmp1c3QgZGV2ZWxvcGluZyBhZ2FpbnN0IFFFTVUgZm9yIG5v
dy4KCkkgY2FuIGNlcnRhaW5seSBsb29rIGF0IGhvb2tpbmcgaW4gUUVNVSB0byB0aGUgQ0kgYXQg
c29tZSBwb2ludCBzb29uLiAgVGhhdAppcyB0aGUgT1NTVGVzdCByZXBvLCBjb3JyZWN0PwoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1h
aWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54
ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
