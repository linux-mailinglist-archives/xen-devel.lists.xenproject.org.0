Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A7BE133E80
	for <lists+xen-devel@lfdr.de>; Wed,  8 Jan 2020 10:44:41 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ip7r3-0003Gk-I7; Wed, 08 Jan 2020 09:42:21 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=/T+N=25=gmail.com=julien.grall.oss@srs-us1.protection.inumbo.net>)
 id 1ip7r2-0003Gf-73
 for xen-devel@lists.xenproject.org; Wed, 08 Jan 2020 09:42:20 +0000
X-Inumbo-ID: 28d47632-31fb-11ea-ad6d-12813bfff9fa
Received: from mail-wr1-f67.google.com (unknown [209.85.221.67])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 28d47632-31fb-11ea-ad6d-12813bfff9fa;
 Wed, 08 Jan 2020 09:42:18 +0000 (UTC)
Received: by mail-wr1-f67.google.com with SMTP id j42so2548019wrj.12
 for <xen-devel@lists.xenproject.org>; Wed, 08 Jan 2020 01:42:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=UefK4vRAhU2UNTVQf0qMutEOxa+JsME84Mi22uhmPbI=;
 b=Cd425HHlOtqow1DaCAeX+UcA+xrFVBjlUv4lUgCjxk8JcUwmjPUqQ5mog59PO9m6QN
 6DYaZQsDjV7EwNkgxc5OzF8NQxHV5sd2p7nDGdfe8CPZxtbVIsO7fFp1lO7zQ8Oq4aYf
 R3HxdzAsff2qCtBxKzaNRA4xGgiWx1ln2lY+zzUUeQ9SDWPeanjoHFf34MOqffgyjfQj
 4IiD/oQ4r6kczo/jqdzFJXpc0dXzHGSRN0c2ycQg09WwVuf5xszlvdRBDnE+vIy7X4kV
 qHC6TiHvF+SYG67vAe4Av2tpb4ARMYFwuHCLwUoIALF3DrDcw6T+HboL+jZmTPtHH9wh
 MoVw==
X-Gm-Message-State: APjAAAW2jWaniUG99SB77smi6Q1CepheXYolzkL2ZXz95wq4zSmI1Wgg
 y1lFP9/1DQWuqvuDibfUKlJIsCaKRnI5Gg==
X-Google-Smtp-Source: APXvYqybrgSZVuefq6t7gwiZgmgMMzGSJ6QemYI5QrYq//nZtwFhQHAOHEWZVOz9x1rEU3x8mXEQvw==
X-Received: by 2002:a5d:5267:: with SMTP id l7mr3745972wrc.84.1578476537343;
 Wed, 08 Jan 2020 01:42:17 -0800 (PST)
Received: from a483e7b01a66.ant.amazon.com (54-240-197-233.amazon.com.
 [54.240.197.233])
 by smtp.gmail.com with ESMTPSA id w8sm3147246wmm.0.2020.01.08.01.42.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 08 Jan 2020 01:42:16 -0800 (PST)
To: Tamas K Lengyel <tamas@tklengyel.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <20191219094814.GB11756@Air-de-Roger>
 <CABfawhnVZmYOZb=wuc2TVDewH9nNtJBTBvJYUk-RDHLCGRVzPw@mail.gmail.com>
 <20191230175900.GF11756@Air-de-Roger>
 <CABfawhkiB=6zvTo6TBCE6y_-to65DFGDVRcqk7ANpSGdwwveFQ@mail.gmail.com>
 <3ff918fc-02a3-1413-4135-a378d65a19ab@xen.org>
 <CABfawh=Wvn16sWp8_MPy0kGAp-OhkCmug4nY272igyg+u4PKBw@mail.gmail.com>
 <CAF3u54B2+3q90jFftH+ZcuhdH6i8cOEpjiOjrVdNJCiBSzBtng@mail.gmail.com>
 <CABfawh=F8dsn4LLtdfYR4nb0djaswofEioDtqi2TKVJ0zCBK0Q@mail.gmail.com>
 <20191231104022.GG11756@Air-de-Roger>
 <CABfawh=tDFzsp61MmFxpmcBbNT2GXa4C=-eXD=044L1gdxPEpw@mail.gmail.com>
 <20191231151107.GJ11756@Air-de-Roger>
 <CABfawhnqGE6OSAPxFP56-fOXDVMcb+fWN6GpjT-1EcSi29xYDQ@mail.gmail.com>
 <CABfawhkHK3FYuGTwm6A4Ni+_a6wdqHwDxbDYqofcNyS_kQT-Yw@mail.gmail.com>
From: Julien Grall <julien@xen.org>
Message-ID: <ad37bbb3-6f2b-eaa8-4d11-8a131a68c3f4@xen.org>
Date: Wed, 8 Jan 2020 09:42:14 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:68.0)
 Gecko/20100101 Thunderbird/68.3.1
MIME-Version: 1.0
In-Reply-To: <CABfawhkHK3FYuGTwm6A4Ni+_a6wdqHwDxbDYqofcNyS_kQT-Yw@mail.gmail.com>
Content-Language: en-GB
Subject: Re: [Xen-devel] [PATCH v2 00/20] VM forking
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
Cc: Petre Pircalabu <ppircalabu@bitdefender.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Tamas K Lengyel <tamas.lengyel@intel.com>, Wei Liu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <george.dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Julien Grall <julien.grall@gmail.com>,
 Alexandru Isaila <aisaila@bitdefender.com>, Jan Beulich <jbeulich@suse.com>,
 Anthony PERARD <anthony.perard@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGkgVGFtYXMsCgpPbiAzMS8xMi8yMDE5IDE2OjM2LCBUYW1hcyBLIExlbmd5ZWwgd3JvdGU6Cj4g
T24gVHVlLCBEZWMgMzEsIDIwMTkgYXQgOTowOCBBTSBUYW1hcyBLIExlbmd5ZWwgPHRhbWFzQHRr
bGVuZ3llbC5jb20+IHdyb3RlOgo+Pgo+PiBPbiBUdWUsIERlYyAzMSwgMjAxOSBhdCA4OjExIEFN
IFJvZ2VyIFBhdSBNb25uw6kgPHJvZ2VyLnBhdUBjaXRyaXguY29tPiB3cm90ZToKPj4+Cj4+PiBP
biBUdWUsIERlYyAzMSwgMjAxOSBhdCAwODowMDoxN0FNIC0wNzAwLCBUYW1hcyBLIExlbmd5ZWwg
d3JvdGU6Cj4+Pj4gT24gVHVlLCBEZWMgMzEsIDIwMTkgYXQgMzo0MCBBTSBSb2dlciBQYXUgTW9u
bsOpIDxyb2dlci5wYXVAY2l0cml4LmNvbT4gd3JvdGU6Cj4+Pj4+Cj4+Pj4+IE9uIE1vbiwgRGVj
IDMwLCAyMDE5IGF0IDA1OjM3OjM4UE0gLTA3MDAsIFRhbWFzIEsgTGVuZ3llbCB3cm90ZToKPj4+
Pj4+IE9uIE1vbiwgRGVjIDMwLCAyMDE5IGF0IDU6MjAgUE0gSnVsaWVuIEdyYWxsIDxqdWxpZW4u
Z3JhbGxAZ21haWwuY29tPiB3cm90ZToKPj4+Pj4+Pgo+Pj4+Pj4+IEhpLAo+Pj4+Pj4+Cj4+Pj4+
Pj4gT24gTW9uLCAzMCBEZWMgMjAxOSwgMjA6NDkgVGFtYXMgSyBMZW5neWVsLCA8dGFtYXNAdGts
ZW5neWVsLmNvbT4gd3JvdGU6Cj4+Pj4+Pj4+Cj4+Pj4+Pj4+IE9uIE1vbiwgRGVjIDMwLCAyMDE5
IGF0IDExOjQzIEFNIEp1bGllbiBHcmFsbCA8anVsaWVuQHhlbi5vcmc+IHdyb3RlOgo+Pj4+Pj4+
PiBCdXQga2VlcCBpbiBtaW5kIHRoYXQgdGhlICJmb3JrLXZtIiBjb21tYW5kIGV2ZW4gd2l0aCB0
aGlzIHVwZGF0ZQo+Pj4+Pj4+PiB3b3VsZCBzdGlsbCBub3QgcHJvZHVjZSBmb3IgeW91IGEgImZ1
bGx5IGZ1bmN0aW9uYWwiIFZNIG9uIGl0cyBvd24uCj4+Pj4+Pj4+IFRoZSB1c2VyIHN0aWxsIGhh
cyB0byBwcm9kdWNlIGEgbmV3IFZNIGNvbmZpZyBmaWxlLCBjcmVhdGUgdGhlIG5ldwo+Pj4+Pj4+
PiBkaXNrLCBzYXZlIHRoZSBRRU1VIHN0YXRlLCBldGMuCj4+Pj4+Cj4+Pj4+IElNTyB0aGUgZGVm
YXVsdCBiZWhhdmlvciBvZiB0aGUgZm9yayBjb21tYW5kIHNob3VsZCBiZSB0byBsZWF2ZSB0aGUK
Pj4+Pj4gb3JpZ2luYWwgVk0gcGF1c2VkLCBzbyB0aGF0IHlvdSBjYW4gY29udGludWUgdXNpbmcg
dGhlIHNhbWUgZGlzayBhbmQKPj4+Pj4gbmV0d29yayBjb25maWcgaW4gdGhlIGZvcmsgYW5kIHlv
dSB3b24ndCBuZWVkIHRvIHBhc3MgYSBuZXcgY29uZmlnCj4+Pj4+IGZpbGUuCj4+Pj4+Cj4+Pj4+
IEFzIEp1bGllbiBhbHJlYWR5IHNhaWQsIG1heWJlIEkgd2Fzbid0IGNsZWFyIGluIG15IHByZXZp
b3VzIHJlcGxpZXM6Cj4+Pj4+IEknbSBub3QgYXNraW5nIHlvdSB0byBpbXBsZW1lbnQgYWxsIHRo
aXMsIGl0J3MgZmluZSBpZiB0aGUKPj4+Pj4gaW1wbGVtZW50YXRpb24gb2YgdGhlIGZvcmstdm0g
eGwgY29tbWFuZCByZXF1aXJlcyB5b3UgdG8gcGFzcyBjZXJ0YWluCj4+Pj4+IG9wdGlvbnMsIGFu
ZCB0aGF0IHRoZSBkZWZhdWx0IGJlaGF2aW9yIGlzIG5vdCBpbXBsZW1lbnRlZC4KPj4+Pj4KPj4+
Pj4gV2UgbmVlZCBhbiBpbnRlcmZhY2UgdGhhdCdzIHNhbmUsIGFuZCB0aGF0J3MgZGVzaWduZWQg
dG8gYmUgZWFzeSBhbmQKPj4+Pj4gY29tcHJlaGVuc2l2ZSB0byB1c2UsIG5vdCBhbiBpbnRlcmZh
Y2UgYnVpbHQgYXJvdW5kIHdoYXQncyBjdXJyZW50bHkKPj4+Pj4gaW1wbGVtZW50ZWQuCj4+Pj4K
Pj4+PiBPSywgc28gSSB0aGluayB0aGF0IHdvdWxkIGxvb2sgbGlrZSAieGwgZm9yay12bSA8cGFy
ZW50X2RvbWlkPiIgd2l0aAo+Pj4+IGFkZGl0aW9uYWwgb3B0aW9ucyBmb3IgdGhpbmdzIGxpa2Ug
bmFtZSwgZGlzaywgdmxhbiwgb3IgYSBjb21wbGV0ZWx5Cj4+Pj4gbmV3IGNvbmZpZywgYWxsIG9m
IHdoaWNoIGFyZSBjdXJyZW50bHkgbm90IGltcGxlbWVudGVkLCArIGFuCj4+Pj4gYWRkaXRpb25h
bCBvcHRpb24gdG8gbm90IGxhdW5jaCBRRU1VIGF0IGFsbCwgd2hpY2ggd291bGQgYmUgdGhlIG9u
bHkKPj4+PiBvbmUgY3VycmVudGx5IHdvcmtpbmcuIEFsc28ga2VlcGluZyB0aGUgc2VwYXJhdGUg
InhsIGZvcmstbGF1bmNoLWRtIgo+Pj4+IGFzIGlzLiBJcyB0aGF0IHdoYXQgd2UgYXJlIHRhbGtp
bmcgYWJvdXQ/Cj4+Pgo+Pj4gSSB0aGluayBmb3JrLWxhdW5jaC12bSBzaG91bGQganVzdCBiZSBh
biBvcHRpb24gb2YgZm9yay12bSAoaWU6Cj4+PiAtLWxhdW5jaC1kbS1vbmx5IG9yIHNvbWUgc3Vj
aCkuIEkgZG9uJ3QgdGhpbmsgdGhlcmUncyBhIHJlYXNvbiB0byBoYXZlCj4+PiBhIHNlcGFyYXRl
IHRvcC1sZXZlbCBjb21tYW5kIHRvIGp1c3QgbGF1bmNoIHRoZSBkZXZpY2UgbW9kZWwuCj4+Cj4+
IEl0J3MganVzdCB0aGF0IHRoZSBmb3JrLWxhdW5jaC1kbSBuZWVkcyB0aGUgZG9taWQgb2YgdGhl
IGZvcmssIHdoaWxlCj4+IHRoZSBmb3JrLXZtIG5lZWRzIHRoZSBwYXJlbnQncyBkb21pZC4gQnV0
IEkgZ3Vlc3Mgd2UgY2FuIGludGVycHJldCB0aGUKPj4gImRvbWlkIiByZXF1aXJlZCBpbnB1dCBk
aWZmZXJlbnRseSBkZXBlbmRpbmcgb24gd2hpY2ggc3ViLW9wdGlvbiBpcwo+PiBzcGVjaWZpZWQg
Zm9yIHRoZSBjb21tYW5kLiBMZXQncyBzZWUgaG93IGl0IHBhbnMgb3V0Lgo+IAo+IEhvdyBkb2Vz
IHRoZSBmb2xsb3dpbmcgbG9vayBmb3IgdGhlIGludGVyZmFjZT8KPiAKPiAgICAgIHsgImZvcmst
dm0iLAo+ICAgICAgICAmbWFpbl9mb3JrX3ZtLCAwLCAxLAo+ICAgICAgICAiRm9yayBhIGRvbWFp
biBmcm9tIHRoZSBydW5uaW5nIHBhcmVudCBkb21pZCIsCj4gICAgICAgICJbb3B0aW9uc10gPERv
bWlkPiIsCj4gICAgICAgICItaCAgICAgICAgICAgICAgICAgICAgICAgICAgIFByaW50IHRoaXMg
aGVscC5cbiIKPiAgICAgICAgIi1OIDxuYW1lPiAgICAgICAgICAgICAgICAgICAgQXNzaWduIG5h
bWUgdG8gVk0gZm9yay5cbiIKPiAgICAgICAgIi1EIDxkaXNrPiAgICAgICAgICAgICAgICAgICAg
QXNzaWduIGRpc2sgdG8gVk0gZm9yay5cbiIKPiAgICAgICAgIi1CIDxicmlkZ2UgICAgICAgICAg
ICAgICAgICAgQXNzaWduIGJyaWRnZSB0byBWTSBmb3JrLlxuIgo+ICAgICAgICAiLVYgPHZsYW4+
ICAgICAgICAgICAgICAgICAgICBBc3NpZ24gdmxhbiB0byBWTSBmb3JrLlxuIgo+ICAgICAgICAi
LUMgPGNvbmZpZz4gICAgICAgICAgICAgICAgICBVc2UgY29uZmlnIGZpbGUgZm9yIFZNIGZvcmsu
XG4iCj4gICAgICAgICItUSA8cWVtdS1zYXZlLWZpbGU+ICAgICAgICAgIFVzZSBxZW11IHNhdmUg
ZmlsZSBmb3IgVk0gZm9yay5cbiIKPiAgICAgICAgIi0tbGF1bmNoLWRtICA8eWVzfG5vfGxhdGU+
ICAgTGF1bmNoIGRldmljZSBtb2RlbCAoUUVNVSkgZm9yIFZNIGZvcmsuXG4iCj4gICAgICAgICIt
LWZvcmstcmVzZXQgICAgICAgICAgICAgICAgIFJlc2V0IFZNIGZvcmsuXG4iCj4gICAgICAgICIt
cCAgICAgICAgICAgICAgICAgICAgICAgICAgIERvIG5vdCB1bnBhdXNlIFZNcyBhZnRlciBmb3Jr
LiIKPiAgICAgICAgIi1oICAgICAgICAgICAgICAgICAgICAgICAgICAgUHJpbnQgdGhpcyBoZWxw
LlxuIgo+ICAgICAgICAiLWQgICAgICAgICAgICAgICAgICAgICAgICAgICBFbmFibGUgZGVidWcg
bWVzc2FnZXMuXG4iCj4gICAgICB9LAo+IAo+IEN1cnJlbnRseSB0aGUgcGFydHMgdGhhdCBhcmUg
aW1wbGVtZW50ZWQgd291bGQgbG9vayBsaWtlOgo+IHhsIGZvcmstdm0gLXAgLS1sYXVuY2gtZG0g
bm8gPHBhcmVudF9kb21pZD4KPiB4bCBmb3JrLXZtIC1wIC0tbGF1bmNoLWRtIGxhdGUgLUMgPGNv
bmZpZz4gLVEgPHFlbXUtc2F2ZS1maWxlPiA8Zm9ya19kb21pZD4KPiB4bCBmb3JrLXZtIC1wIC0t
Zm9yay1yZXNldCA8Zm9ya19kb21pZD4KClRoZSBpbnRlcmZhY2UgbG9va3MgZ29vZCB0byBtZS4g
Tm90ZSB0aGF0IEkgZG9uJ3QgdGhpbmsgeW91IG5lZWQgdG8gCmRlc2NyaWJyZSBhbGwgdGhlIHVu
aW1wbGVtZW50ZWQgb3B0aW9uIGluIHRoZSBoZWxwLiBJdCB3b3VsZCBiZSAKc3VmZmljaWVudCB0
byBkZXNjcmliZSB3aGF0IHlvdSBvbmx5IHN1cHBvcnQgYW5kIGJhaWwgb3V0IGlmIHRoZSB1c2Vy
IApnaXZlcyBzb21ldGhpbmcgZGlmZmVyZW50LgoKV2hhdCBtYXR0ZXJzIGlzIHdlIGFyZSBhYmxl
IHRvIGV4dGVuZCB0aGUgY29tbWFuZCBsaW5lIG9wdGlvbiBvdmVyIHRoZSB0aW1lLgoKQ2hlZXJz
LAoKLS0gCkp1bGllbiBHcmFsbAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJv
amVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hl
bi1kZXZlbA==
