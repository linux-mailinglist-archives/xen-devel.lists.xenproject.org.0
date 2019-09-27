Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 87B39C0109
	for <lists+xen-devel@lfdr.de>; Fri, 27 Sep 2019 10:22:19 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iDlUQ-0000Gv-Pm; Fri, 27 Sep 2019 08:20:34 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=CKAD=XW=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1iDlUP-0000Go-Ej
 for xen-devel@lists.xenproject.org; Fri, 27 Sep 2019 08:20:33 +0000
X-Inumbo-ID: ac440138-e0ff-11e9-9670-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by localhost (Halon) with ESMTPS
 id ac440138-e0ff-11e9-9670-12813bfff9fa;
 Fri, 27 Sep 2019 08:20:32 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 0965DAF97;
 Fri, 27 Sep 2019 08:20:32 +0000 (UTC)
To: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
References: <20190925070503.13850-1-jgross@suse.com>
 <20190925070503.13850-2-jgross@suse.com>
 <26e09877d338d3801dbb38b881e8890cca2255ab.camel@suse.com>
 <2c63edeb-b8b8-dc4e-4c25-7678bc7776a0@suse.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <545449be-4ecf-3625-8ad3-81487879941a@suse.com>
Date: Fri, 27 Sep 2019 10:20:34 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <2c63edeb-b8b8-dc4e-4c25-7678bc7776a0@suse.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH 1/2] xen/sched: fix locking in
 a653sched_free_vdata()
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
Cc: George Dunlap <george.dunlap@eu.citrix.com>, xen-devel@lists.xenproject.org,
 Josh Whitehead <josh.whitehead@dornerworks.com>,
 Robert VanVossen <robert.vanvossen@dornerworks.com>,
 Dario Faggioli <dfaggioli@suse.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjcuMDkuMjAxOSAwOToyMywgSsO8cmdlbiBHcm/DnyAgd3JvdGU6Cj4gT24gMjUuMDkuMTkg
MTI6NTksIERhcmlvIEZhZ2dpb2xpIHdyb3RlOgo+PiBPbiBXZWQsIDIwMTktMDktMjUgYXQgMDk6
MDUgKzAyMDAsIEp1ZXJnZW4gR3Jvc3Mgd3JvdGU6Cj4+PiBUaGUgYXJpbmM2NTMgc2NoZWR1bGVy
J3MgZnJlZV92ZGF0YSgpIGZ1bmN0aW9uIGlzIG1pc3NpbmcgcHJvcGVyCj4+PiBsb2NraW5nOiBh
cyBpdCBpcyBtb2RpZnlpbmcgdGhlIHNjaGVkdWxlcidzIHByaXZhdGUgdmNwdSBsaXN0IGl0Cj4+
PiBuZWVkcwo+Pj4gdG8gdGFrZSB0aGUgc2NoZWR1bGVyIGxvY2sgZHVyaW5nIHRoYXQgb3BlcmF0
aW9uLgo+Pj4KPj4+IFNpZ25lZC1vZmYtYnk6IEp1ZXJnZW4gR3Jvc3MgPGpncm9zc0BzdXNlLmNv
bT4KPj4+Cj4+IFJldmlld2VkLWJ5OiBEYXJpbyBGYWdnaW9saSA8ZGZhZ2dpb2xpQHN1c2UuY29t
Pgo+IAo+IEFzIHRoaXMgcGF0Y2ggaXMgYSBwcmVyZXF1aXNpdGUgZm9yIG15IGNvcmUgc2NoZWR1
bGluZyBzZXJpZXMgSSdkIHJlYWxseQo+IGFwcHJlY2lhdGUgaWYgaXQgY291bGQgYmUgY29tbWl0
dGVkIHJhdGhlciBzb29uZXIgdGhhbiBsYXRlci4KPiAKPiBKb3NoLCBSb2JlcnQsIGNvdWxkIHlv
dSBwbGVhc2UgY29tbWVudD8KPiAKPiBPciBpcyBEYXJpbydzIFItYiAoYW5kIEphbidzIGFzIHdl
bGwpIGVub3VnaCBpbiB0aGlzIHJhdGhlciBzaW1wbGUgYW5kCj4gb2J2aW91cyBjYXNlPwoKSSB3
YXMgbW9yZSBvciBsZXNzIHBsYW5uaW5nIHRvIHRpbWUgb3V0IG9uIHdhaXRpbmcgZm9yIHRoZWly
IGFjawpsYXRlciB0b2RheS4KCkphbgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVu
cHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZv
L3hlbi1kZXZlbA==
