Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BAA901711D9
	for <lists+xen-devel@lfdr.de>; Thu, 27 Feb 2020 09:00:05 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j7E3C-0005zR-75; Thu, 27 Feb 2020 07:57:42 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=Qtag=4P=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1j7E3A-0005zM-1H
 for xen-devel@lists.xenproject.org; Thu, 27 Feb 2020 07:57:40 +0000
X-Inumbo-ID: d2f1f998-5936-11ea-95e9-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id d2f1f998-5936-11ea-95e9-12813bfff9fa;
 Thu, 27 Feb 2020 07:57:39 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 7AA57AD05;
 Thu, 27 Feb 2020 07:57:38 +0000 (UTC)
To: Andrew Cooper <andrew.cooper3@citrix.com>
References: <20200226202221.6555-1-andrew.cooper3@citrix.com>
 <20200226202221.6555-4-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <e9cfe667-9cbf-4f04-352d-bbf45a416165@suse.com>
Date: Thu, 27 Feb 2020 08:57:47 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200226202221.6555-4-andrew.cooper3@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH 03/10] x86/gen-cpuid: Rework internal logic
 to ease future changes
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
Cc: Xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjYuMDIuMjAyMCAyMToyMiwgQW5kcmV3IENvb3BlciB3cm90ZToKPiBCZXR0ZXIgc3BsaXQg
dGhlIGxvZ2ljIGJldHdlZW4gcGFyc2UvY2FsY3VsYXRlL3dyaXRlLiAgQ29sbGVjdCB0aGUgZmVh
dHVyZQo+IGNvbW1lbnQgYnkgdGhlaXIgY29tbWVudCBjaGFyYWN0ZXIsIGFuZCBwZXJmb3JtIHRo
ZSBhY2N1bXVsYXRpb24gb3BlcmF0aW9ucyBpbgo+IGNydW5jaF9udW1iZXJzKCkuCgpXb3VsZCB5
b3UgbWluZCBzYXlpbmcgImNoYXJhY3RlcihzKSIgaGVyZSwgYXMgdGhlcmUgYXJlIGl0ZW1zIHdp
dGgKbXVsdGlwbGUgb2YgdGhlbT8KCj4gQXZvaWQgcmVuZGVyaW5nIHRoZSBmZWF0dXJlc2V0cyB0
byBDIHVpbnQzMl90J3MgaW4gY3J1bmNoX251bWJlcnMoKSwgYW5kCj4gaW5zdGVhZCBkbyB0aGlz
IGluIHdyaXRlX3Jlc3VsdHMoKS4gIFVwZGF0ZSBmb3JtYXRfdWludDMycygpIHRvIGNhbGwKPiBm
ZWF0dXJlc2V0X3RvX3VpbnQzMnMoKSBpbnRlcm5hbGx5Lgo+IAo+IE5vIGZ1bmN0aW9uYWwgY2hh
bmdlIC0gdGhlIGdlbmVyYXRlZCBjcHVpZC1hdXRvZ2VuLmggaXMgaWRlbnRpY2FsLgoKSSBub3Rp
Y2UgdGhlICJzcGVjaWFsIiBmaWVsZCAob3IgaG93ZXZlciBzdWNoIGlzIGNhbGxlZCBpbiBQeXRo
b24pCmdvZXMgYXdheSwgaW4gZmF2b3Igb2YgdXNpbmcgcmF3WychJ10gYXQgdGhlIGFwcGFyZW50
bHkgc29sZQpjb25zdW1pbmcgc2l0ZS4gSSBhbHNvIG5vdGljZSB0aGUgc2FtZSBpc24ndCB0cnVl
IGZvciAicHYiLCB3aGljaApub3cgY291bGQgYWxzbyBiZSByYXdbJ0EnXSBhcyBpdCBzZWVtcy4g
SWYgdGhpcyBpcyB0aGUgY2FzZSAoaS5lLgpJJ20gbm90IG92ZXJsb29raW5nIGFueXRoaW5nKSwg
Y291bGQgeW91IHNheSBhIHdvcmQgb24gdGhlIGNoYW5nZQpmb3IgInNwZWNpYWwiIGFuZC9vciB0
aGUgZGlmZmVyZW5jZSBiZXR3ZWVuICJzcGVjaWFsIiBhbmQgInB2Ij8KCj4gU2lnbmVkLW9mZi1i
eTogQW5kcmV3IENvb3BlciA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4KCldpdGggbXkgbGlt
aXRlZCBQeXRob24gc2tpbGxzIG1lcmVseQpBY2tlZC1ieTogSmFuIEJldWxpY2ggPGpiZXVsaWNo
QHN1c2UuY29tPgoKSmFuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0
Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRl
dmVs
