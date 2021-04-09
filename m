Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 11FCA3595A3
	for <lists+xen-devel@lfdr.de>; Fri,  9 Apr 2021 08:39:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.107623.205652 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lUknH-0005Rg-1I; Fri, 09 Apr 2021 06:39:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 107623.205652; Fri, 09 Apr 2021 06:39:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lUknG-0005RK-US; Fri, 09 Apr 2021 06:39:02 +0000
Received: by outflank-mailman (input) for mailman id 107623;
 Fri, 09 Apr 2021 06:39:02 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=rPLO=JG=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lUknG-0005RF-3A
 for xen-devel@lists.xenproject.org; Fri, 09 Apr 2021 06:39:02 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 105ca9c5-c5ca-4c2c-81c6-73953f96eb3a;
 Fri, 09 Apr 2021 06:39:01 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 49EA9AFEF;
 Fri,  9 Apr 2021 06:39:00 +0000 (UTC)
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
X-Inumbo-ID: 105ca9c5-c5ca-4c2c-81c6-73953f96eb3a
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1617950340; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=4071pFx3oNmtSHkAWGgQMH0S3kVve/x4fmKzQtIcAOo=;
	b=MeRWvDabm7TFa+qGocGt8kGH/uvPFSw3jvzpsi8tIc6BLIOEWt6JcZ+KrdqXCyZMEcPL+v
	R7jYbbyR/Tj92MmWoMlutLviabdS4K4jT3OYBzu6ClMe1U0dFr3K+wAW99H6yCPcI4TU93
	OXK62dv1zeSFrmjzh/zC2uSPmwqTkOM=
Subject: Re: x86: memset() / clear_page() / page scrubbing
To: Ankur Arora <ankur.a.arora@oracle.com>
Cc: andrew.cooper3@citrix.com, roger.pau@citrix.com,
 xen-devel@lists.xenproject.org
References: <0753c049-9572-c12a-c74f-7e2fac3f5a24@suse.com>
 <20210409060845.3503745-1-ankur.a.arora@oracle.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <4d8202b3-ffe8-c4e7-e477-d8e7dc294c33@suse.com>
Date: Fri, 9 Apr 2021 08:38:59 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.0
MIME-Version: 1.0
In-Reply-To: <20210409060845.3503745-1-ankur.a.arora@oracle.com>
Content-Type: multipart/mixed;
 boundary="------------9DC579F8BDE441FCF75385D5"
Content-Language: en-US

This is a multi-part message in MIME format.
--------------9DC579F8BDE441FCF75385D5
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

On 09.04.2021 08:08, Ankur Arora wrote:
> I'm working on somewhat related optimizations on Linux (clear_page(),
> going in the opposite direction, from REP STOSB to MOVNT) and have
> some comments/questions below.

Interesting.

> On 4/8/2021 6:58 AM, Jan Beulich wrote:
>> All,
>>
>> since over the years we've been repeatedly talking of changing the
>> implementation of these fundamental functions, I've taken some time
>> to do some measurements (just for possible clear_page() alternatives
>> to keep things manageable). I'm not sure I want to spend as much time
>> subsequently on memcpy() / copy_page() (or more, because there are
>> yet more combinations of arguments to consider), so for the moment I
>> think the route we're going to pick here is going to more or less
>> also apply to those.
>>
>> The present copy_page() is the way it is because of the desire to
>> avoid disturbing the cache. The effect of REP STOS on the L1 cache
>> (compared to the present use of MOVNTI) is more or less noticable on
>> all hardware, and at least on Intel hardware more noticable when the
>> cache starts out clean. For L2 the results are more mixed when
>> comparing cache-clean and cache-filled cases, but the difference
>> between MOVNTI and REP STOS remains or (at least on Zen2 and older
>> Intel hardware) becomes more prominent.
> 
> Could you give me any pointers on the cache-effects on this? This
> obviously makes sense but I couldn't come up with any benchmarks
> which would show this in a straight-forward fashion.

No benchmarks in that sense, but a local debugging patch measuring
things before bringing up APs, to have a reasonably predictable
environment. I have attached it for your reference.

>> Otoh REP STOS, as was to be expected, in most cases has meaningfully
>> lower latency than MOVNTI.
>>
>> Because I was curious I also included AVX (32-byte stores), AVX512
>> (64-byte stores), and AMD's CLZERO in my testing. While AVX is a
>> clear win except on the vendors' first generations implementing it
>> (but I've left out any playing with CR0.TS, which is what I expect
>> would take this out as an option), AVX512 isn't on Skylake (perhaps
>> newer hardware does better). CLZERO has slightly higher impact on
>> L1 than MOVNTI, but lower than REP STOS.
> 
> Could you elaborate on what kind of difference in L1 impact you are
> talking about? Evacuation of cachelines?

Replacement of ones, yes. As you may see from that patch, I prefill
the cache, do the clearing, and then measure how much longer the
same operation takes that was used for prefilling. If the clearing
left the cache completely alone (or if the hw prefetcher was really
good), there would be no difference.

>> Its latency is between
>> both when the caches are warm, and better than both when the caches
>> are cold.
>>
>> Therefore I think that we want to distinguish page clearing (where
>> we care about latency) from (background) page scrubbing (where I
>> think the goal ought to be to avoid disturbing the caches). That
>> would make it
>> - REP STOS{L,Q} for clear_page() (perhaps also to be used for
>>   synchronous scrubbing),
>> - MOVNTI for scrub_page() (when done from idle context), unless
>>   CLZERO is available.
>> Whether in addition we should take into consideration activity of
>> other (logical) CPUs sharing caches I don't know - this feels like
>> it could get complex pretty quickly.
> 
> The one other case might be for ~L3 (or larger) regions. In my tests,
> MOVNT/CLZERO is almost always better (the one exception being Skylake)
> wrt both cache and latency for larger extents.

Good to know - will keep this in mind.

> In the particular cases I was looking at (mmap+MAP_POPULATE and
> page-fault path), that makes the choice of always using MOVNT/CLZERO
> easy for GB pages, but fuzzier for 2MB pages.
> 
> Not sure if the large-page case is interesting for you though.

Well, we never fill large pages in one go, yet the scrubbing may
touch many individual pages in close succession. But for the
(background) scrubbing my recommendation is to use MOVNT/CLZERO
anyway, irrespective of volume. While upon large page allocations
we may also end up scrubbing many pages in close succession, I'm
not sure that's worth optimizing for - we at least hope for the
pages to have got scrubbed in the background before they get
re-used. Plus we don't (currently) know up front how many of them
may still need scrubbing; this isn't difficult to at least
estimate, but may require yet another loop over the constituent
pages.

Jan

--------------9DC579F8BDE441FCF75385D5
Content-Type: text/plain; charset=UTF-8;
 name="x86-clear-page-ERMS.patch"
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="x86-clear-page-ERMS.patch"

ClRPRE86IHJlbW92ZSAob3Igc3BsaXQgb3V0KSAvL3RlbXAtcwpOb3RlOiBBbmt1ciBpbmRp
Y2F0ZXMgdGhhdCBmb3IgfkwzLXNpemUgb3IgbGFyZ2VyIHJlZ2lvbnMgTU9WTlQvQ0xaRVJP
IGlzIGJldHRlciBldmVuIGxhdGVuY3ktd2lzZQoKLS0tIHVuc3RhYmxlLm9yaWcveGVuL2Fy
Y2gveDg2L2NsZWFyX3BhZ2UuUwkyMDIxLTAyLTI1IDA5OjI4OjE0LjE3NTYzNjg4MSArMDEw
MAorKysgdW5zdGFibGUveGVuL2FyY2gveDg2L2NsZWFyX3BhZ2UuUwkyMDIxLTAyLTI1IDEw
OjA0OjA0LjMxNTMyNTk3MyArMDEwMApAQCAtMTYsMyArMTYsNjYgQEAgRU5UUlkoY2xlYXJf
cGFnZV9zc2UyKQogCiAgICAgICAgIHNmZW5jZQogICAgICAgICByZXQKKworRU5UUlkoY2xl
YXJfcGFnZV9zdG9zYikKKyAgICAgICAgbW92ICAgICAkUEFHRV9TSVpFLCAlZWN4CisgICAg
ICAgIHhvciAgICAgJWVheCwlZWF4CisgICAgICAgIHJlcCBzdG9zYgorICAgICAgICByZXQK
KworRU5UUlkoY2xlYXJfcGFnZV9zdG9zbCkKKyAgICAgICAgbW92ICAgICAkUEFHRV9TSVpF
LzQsICVlY3gKKyAgICAgICAgeG9yICAgICAlZWF4LCAlZWF4CisgICAgICAgIHJlcCBzdG9z
bAorICAgICAgICByZXQKKworRU5UUlkoY2xlYXJfcGFnZV9zdG9zcSkKKyAgICAgICAgbW92
ICAgICAkUEFHRV9TSVpFLzgsICVlY3gKKyAgICAgICAgeG9yICAgICAlZWF4LCAlZWF4Cisg
ICAgICAgIHJlcCBzdG9zcQorICAgICAgICByZXQKKworRU5UUlkoY2xlYXJfcGFnZV9hdngp
CisgICAgICAgIG1vdiAgICAgJFBBR0VfU0laRS8xMjgsICVlY3gKKyAgICAgICAgdnB4b3Ig
ICAleG1tMCwgJXhtbTAsICV4bW0wCiswOiAgICAgIHZtb3ZudGRxICV5bW0wLCAgICglcmRp
KQorICAgICAgICB2bW92bnRkcSAleW1tMCwgMzIoJXJkaSkKKyAgICAgICAgdm1vdm50ZHEg
JXltbTAsIDY0KCVyZGkpCisgICAgICAgIHZtb3ZudGRxICV5bW0wLCA5NiglcmRpKQorICAg
ICAgICBzdWIgICAgICQtMTI4LCAlcmRpCisgICAgICAgIHN1YiAgICAgJDEsICVlY3gKKyAg
ICAgICAgam56ICAgICAwYgorICAgICAgICBzZmVuY2UKKyAgICAgICAgcmV0CisKKyNpZiBf
X0dOVUNfXyA+IDQKK0VOVFJZKGNsZWFyX3BhZ2VfYXZ4NTEyKQorICAgICAgICBtb3YgICAg
ICRQQUdFX1NJWkUvMjU2LCAlZWN4CisgICAgICAgIHZweG9yICAgJXhtbTAsICV4bW0wLCAl
eG1tMAorMDogICAgICB2bW92bnRkcSAlem1tMCwgICAgKCVyZGkpCisgICAgICAgIHZtb3Zu
dGRxICV6bW0wLCAgNjQoJXJkaSkKKyAgICAgICAgdm1vdm50ZHEgJXptbTAsIDEyOCglcmRp
KQorICAgICAgICB2bW92bnRkcSAlem1tMCwgMTkyKCVyZGkpCisgICAgICAgIGFkZCAgICAg
JDI1NiwgJXJkaQorICAgICAgICBzdWIgICAgICQxLCAlZWN4CisgICAgICAgIGpueiAgICAg
MGIKKyAgICAgICAgc2ZlbmNlCisgICAgICAgIHJldAorI2VuZGlmCisKKyNpZiBfX0dOVUNf
XyA+IDUKK0VOVFJZKGNsZWFyX3BhZ2VfY2x6ZXJvKQorICAgICAgICBtb3YgICAgICVyZGks
ICVyYXgKKyAgICAgICAgbW92ICAgICAkUEFHRV9TSVpFLzI1NiwgJWVjeAorMDogICAgICBj
bHplcm8KKyAgICAgICAgYWRkICAgICAkNjQsICVyYXgKKyAgICAgICAgY2x6ZXJvCisgICAg
ICAgIGFkZCAgICAgJDY0LCAlcmF4CisgICAgICAgIGNsemVybworICAgICAgICBhZGQgICAg
ICQ2NCwgJXJheAorICAgICAgICBjbHplcm8KKyAgICAgICAgYWRkICAgICAkNjQsICVyYXgK
KyAgICAgICAgc3ViICAgICAkMSwgJWVjeAorICAgICAgICBqbnogICAgIDBiCisgICAgICAg
IHJldAorI2VuZGlmCi0tLSB1bnN0YWJsZS5vcmlnL3hlbi9hcmNoL3g4Ni9jcHUvY29tbW9u
LmMJMjAyMS0wMi0wOSAxNjoyMDo0NS4wMDAwMDAwMDAgKzAxMDAKKysrIHVuc3RhYmxlL3hl
bi9hcmNoL3g4Ni9jcHUvY29tbW9uLmMJMjAyMS0wMi0wOSAxNjoyMDo0NS4wMDAwMDAwMDAg
KzAxMDAKQEAgLTIzOCw2ICsyMzgsNyBAQCBpbnQgZ2V0X21vZGVsX25hbWUoc3RydWN0IGNw
dWluZm9feDg2ICpjCiB9CiAKIAorZXh0ZXJuIHVuc2lnbmVkIGwxZF9zaXplLCBsMl9zaXpl
Oy8vdGVtcAogdm9pZCBkaXNwbGF5X2NhY2hlaW5mbyhzdHJ1Y3QgY3B1aW5mb194ODYgKmMp
CiB7CiAJdW5zaWduZWQgaW50IGR1bW15LCBlY3gsIGVkeCwgc2l6ZTsKQEAgLTI1MCw2ICsy
NTEsNyBAQCB2b2lkIGRpc3BsYXlfY2FjaGVpbmZvKHN0cnVjdCBjcHVpbmZvX3g4CiAJCQkJ
ICAgICAgICAgICAgICAiIEQgY2FjaGUgJXVLICgldSBieXRlcy9saW5lKVxuIiwKIAkJCQkg
ICAgICAgZWR4ID4+IDI0LCBlZHggJiAweEZGLCBlY3ggPj4gMjQsIGVjeCAmIDB4RkYpOwog
CQkJYy0+eDg2X2NhY2hlX3NpemUgPSAoZWN4ID4+IDI0KSArIChlZHggPj4gMjQpOworaWYo
ZWN4ID4+PSAyNCkgbDFkX3NpemUgPSBlY3g7Ly90ZW1wCiAJCX0KIAl9CiAKQEAgLTI2MCw2
ICsyNjIsNyBAQCB2b2lkIGRpc3BsYXlfY2FjaGVpbmZvKHN0cnVjdCBjcHVpbmZvX3g4CiAK
IAlzaXplID0gZWN4ID4+IDE2OwogCWlmIChzaXplKSB7CitsMl9zaXplID0vL3RlbXAKIAkJ
Yy0+eDg2X2NhY2hlX3NpemUgPSBzaXplOwogCiAJCWlmIChvcHRfY3B1X2luZm8pCi0tLSB1
bnN0YWJsZS5vcmlnL3hlbi9hcmNoL3g4Ni9jcHUvaW50ZWxfY2FjaGVpbmZvLmMJMjAyMS0w
Mi0yNSAwOToyODoxNC4xNzU2MzY4ODEgKzAxMDAKKysrIHVuc3RhYmxlL3hlbi9hcmNoL3g4
Ni9jcHUvaW50ZWxfY2FjaGVpbmZvLmMJMjAyMS0wMi0wOSAxNjoyMDoyMy4wMDAwMDAwMDAg
KzAxMDAKQEAgLTExNiw2ICsxMTYsNyBAQCBzdGF0aWMgaW50IGZpbmRfbnVtX2NhY2hlX2xl
YXZlcyh2b2lkKQogCXJldHVybiBpOwogfQogCitleHRlcm4gdW5zaWduZWQgbDFkX3NpemUs
IGwyX3NpemU7Ly90ZW1wCiB2b2lkIGluaXRfaW50ZWxfY2FjaGVpbmZvKHN0cnVjdCBjcHVp
bmZvX3g4NiAqYykKIHsKIAl1bnNpZ25lZCBpbnQgdHJhY2UgPSAwLCBsMWkgPSAwLCBsMWQg
PSAwLCBsMiA9IDAsIGwzID0gMDsgLyogQ2FjaGUgc2l6ZXMgKi8KQEAgLTIzMCwxMiArMjMx
LDE0IEBAIHZvaWQgaW5pdF9pbnRlbF9jYWNoZWluZm8oc3RydWN0IGNwdWluZm8KIAl9CiAK
IAlpZiAobmV3X2wxZCkKK2wxZF9zaXplID0vL3RlbXAKIAkJbDFkID0gbmV3X2wxZDsKIAog
CWlmIChuZXdfbDFpKQogCQlsMWkgPSBuZXdfbDFpOwogCiAJaWYgKG5ld19sMikgeworbDJf
c2l6ZSA9Ly90ZW1wCiAJCWwyID0gbmV3X2wyOwogCX0KIAotLS0gdW5zdGFibGUub3JpZy94
ZW4vYXJjaC94ODYvbW0uYwkyMDIxLTAyLTI1IDA5OjI4OjQxLjIxNTc0NTc4NCArMDEwMAor
KysgdW5zdGFibGUveGVuL2FyY2gveDg2L21tLmMJMjAyMS0wNC0wNiAxNTo0NDozMi40Nzgw
OTk0NTMgKzAyMDAKQEAgLTI4NCw2ICsyODQsMjIgQEAgc3RhdGljIHZvaWQgX19pbml0IGFz
c2lnbl9pb19wYWdlKHN0cnVjdAogICAgIHBhZ2UtPmNvdW50X2luZm8gfD0gUEdDX2FsbG9j
YXRlZCB8IDE7CiB9CiAKK3N0YXRpYyB1bnNpZ25lZCBfX2luaXQgbm9pbmxpbmUgcHJvYmUo
Y29uc3QgdW5zaWduZWQqc3BjLCB1bnNpZ25lZCBucikgey8vdGVtcAorI2RlZmluZSBQQUdF
X0VOVFMgKFBBR0VfU0laRSAvIHNpemVvZigqc3BjKSkKKyB1bnNpZ25lZCBpLCBqLCBhY2M7
CisgZm9yKGFjYyA9IGkgPSAwOyBpIDwgUEFHRV9TSVpFIC8gNjQ7ICsraSkKKyAgZm9yKGog
PSAwOyBqIDwgbnI7ICsraikKKyAgIGFjYyArPSBzcGNbaiAqIFBBR0VfRU5UUyArICgoaSAq
ICg2NCAvIHNpemVvZigqc3BjKSkgKiA3KSAmIChQQUdFX0VOVFMgLSAxKSldOworIHJldHVy
biBhY2MgJiAoaSAqIG5yIC0gMSk7CisjdW5kZWYgUEFHRV9FTlRTCit9CitleHRlcm4gdm9p
ZCBjbGVhcl9wYWdlX3N0b3NiKHZvaWQqKTsvL3RlbXAKK2V4dGVybiB2b2lkIGNsZWFyX3Bh
Z2Vfc3Rvc2wodm9pZCopOy8vdGVtcAorZXh0ZXJuIHZvaWQgY2xlYXJfcGFnZV9zdG9zcSh2
b2lkKik7Ly90ZW1wCitleHRlcm4gdm9pZCBjbGVhcl9wYWdlX2F2eCh2b2lkKik7Ly90ZW1w
CitleHRlcm4gdm9pZCBjbGVhcl9wYWdlX2F2eDUxMih2b2lkKik7Ly90ZW1wCitleHRlcm4g
dm9pZCBjbGVhcl9wYWdlX2NsemVybyh2b2lkKik7Ly90ZW1wCit1bnNpZ25lZCBsMWRfc2l6
ZSA9IEtCKDE2KSwgbDJfc2l6ZTsvL3RlbXAKIHZvaWQgX19pbml0IGFyY2hfaW5pdF9tZW1v
cnkodm9pZCkKIHsKICAgICB1bnNpZ25lZCBsb25nIGksIHBmbiwgcnN0YXJ0X3BmbiwgcmVu
ZF9wZm4sIGlvc3RhcnRfcGZuLCBpb2VuZF9wZm47CkBAIC0zOTIsNiArNDA4LDY3IEBAIHZv
aWQgX19pbml0IGFyY2hfaW5pdF9tZW1vcnkodm9pZCkKICAgICB9CiAjZW5kaWYKIAorey8v
dGVtcAorIHVuc2lnbmVkIG9yZGVyID0gZ2V0X29yZGVyX2Zyb21fcGFnZXMoUEZOX0RPV04o
bDJfc2l6ZSA8PCAxMCkpID86IDE7Cisgdm9pZCpmaWxsID0gYWxsb2NfeGVuaGVhcF9wYWdl
cyhvcmRlciwgMCk7Cisgdm9pZCpidWYgPSBhbGxvY194ZW5oZWFwX3BhZ2VzKG9yZGVyIC0g
MSwgMCk7CisgdW5zaWduZWQgbG9uZyBjcjAgPSByZWFkX2NyMCgpOworIHByaW50aygiZXJt
cz0lZCBmc3JtPSVkIGZ6cm09JWQgZnNycz0lZCBmc3Jjcz0lZCBsMWQ9JXVrIGwyPSV1a1xu
IiwKKyAgICAgICAgISFib290X2NwdV9oYXMoWDg2X0ZFQVRVUkVfRVJNUyksICEhYm9vdF9j
cHVfaGFzKFg4Nl9GRUFUVVJFX0ZTUk0pLAorICAgICAgICAhIWJvb3RfY3B1X2hhcyhYODZf
RkVBVFVSRV9GWlJNKSwgISFib290X2NwdV9oYXMoWDg2X0ZFQVRVUkVfRlNSUyksCisgICAg
ICAgICEhYm9vdF9jcHVfaGFzKFg4Nl9GRUFUVVJFX0ZTUkNTKSwgbDFkX3NpemUsIGwyX3Np
emUpOworIGNsdHMoKTsKKyBmb3IodW5zaWduZWQgcGFzcyA9IDA7IHBhc3MgPCA0OyArK3Bh
c3MpIHsKKyAgcHJpbnRrKCJMJWQgdy8lcyBmbHVzaDpcbiIsIDIgLSAhKHBhc3MgJiAyKSwg
cGFzcyAmIDEgPyAiIiA6ICJvIik7CisgIHdiaW52ZCgpOworICBmb3IoaSA9IDA7IGZpbGwg
JiYgYnVmICYmIGkgPCAzOyArK2kpIHsKKyAgIHVuc2lnbmVkIG5yID0gUEZOX0RPV04oKHBh
c3MgJiAyID8gbDJfc2l6ZSA6IGwxZF9zaXplKSA8PCAxMCk7CisgICB1aW50NjRfdCBzdGFy
dCwgcHJlLCBjbHIsIHBvc3Q7CisKKyNkZWZpbmUgQ0hLKGtpbmQpIGRvIHsgXAorIC8qIGxv
Y2FsX2lycV9kaXNhYmxlKCk7ICovIFwKK1wKKyBtZW1zZXQoYnVmLCBfX0xJTkVfXyB8IChf
X0xJTkVfXyA+PiA4KSwgbnIgKiBQQUdFX1NJWkUgLyAyKTsgXAorIGlmKHBhc3MgJiAxKSB3
YmludmQoKTsgZWxzZSBtYigpOyBcCisgbWVtc2V0KGZpbGwsIF9fTElORV9fIHwgKF9fTElO
RV9fID4+IDgpLCBuciAqIFBBR0VfU0laRSk7IFwKKyBtYigpOyBcCitcCisgaWYoYm9vdF9j
cHVfaGFzKFg4Nl9GRUFUVVJFX0lCUlNCKSB8fCBib290X2NwdV9oYXMoWDg2X0ZFQVRVUkVf
SUJQQikpIFwKKyAgd3Jtc3JsKE1TUl9QUkVEX0NNRCwgUFJFRF9DTURfSUJQQik7IFwKKyBz
dGFydCA9IHJkdHNjX29yZGVyZWQoKTsgXAorIGlmKHByb2JlKGZpbGwsIG5yKSkgQlVHKCk7
IFwKKyBwcmUgPSByZHRzY19vcmRlcmVkKCkgLSBzdGFydDsgXAorXAorIHN0YXJ0ID0gcmR0
c2Nfb3JkZXJlZCgpOyBcCisgZm9yKHBmbiA9IDA7IHBmbiA8IG5yIC8gMjsgKytwZm4pIFwK
KyAgY2xlYXJfcGFnZV8jI2tpbmQoYnVmICsgcGZuICogUEFHRV9TSVpFKTsgXAorIGNsciA9
IHJkdHNjX29yZGVyZWQoKSAtIHN0YXJ0OyBcCitcCisgaWYoYm9vdF9jcHVfaGFzKFg4Nl9G
RUFUVVJFX0lCUlNCKSB8fCBib290X2NwdV9oYXMoWDg2X0ZFQVRVUkVfSUJQQikpIFwKKyAg
d3Jtc3JsKE1TUl9QUkVEX0NNRCwgUFJFRF9DTURfSUJQQik7IFwKKyBzdGFydCA9IHJkdHNj
X29yZGVyZWQoKTsgXAorIGlmKHByb2JlKGZpbGwsIG5yKSkgQlVHKCk7IFwKKyBwb3N0ID0g
cmR0c2Nfb3JkZXJlZCgpIC0gc3RhcnQ7IFwKK1wKKyAvKiBsb2NhbF9pcnFfZW5hYmxlKCk7
ICovIFwKKyBwcmludGsoIiBwcmU9JWx4ICIgI2tpbmQgIj0lbHggcG9zdD0lbHhcbiIsIHBy
ZSwgY2xyLCBwb3N0KTsgXAorfSB3aGlsZSgwKQorCisgICBDSEsoc3NlMik7CisgICBDSEso
c3Rvc2IpOworICAgQ0hLKHN0b3NsKTsKKyAgIENISyhzdG9zcSk7CisgICBpZihib290X2Nw
dV9oYXMoWDg2X0ZFQVRVUkVfQVZYKSkgQ0hLKGF2eCk7CisgICBpZihfX0dOVUNfXyA+IDQg
JiYgYm9vdF9jcHVfaGFzKFg4Nl9GRUFUVVJFX0FWWDUxMkYpKSBDSEsoYXZ4NTEyKTsKKyAg
IGlmKF9fR05VQ19fID4gNSAmJiBib290X2NwdV9oYXMoWDg2X0ZFQVRVUkVfQ0xaRVJPKSkg
Q0hLKGNsemVybyk7CisKKyN1bmRlZiBDSEsKKyAgfQorIH0KKyB3cml0ZV9jcjAoY3IwKTsK
KyBmcmVlX3hlbmhlYXBfcGFnZXMoYnVmLCBvcmRlciAtIDEpOworIGZyZWVfeGVuaGVhcF9w
YWdlcyhmaWxsLCBvcmRlcik7Cit9CiAgICAgLyogR2VuZXJhdGUgYSBzeW1ib2wgdG8gYmUg
dXNlZCBpbiBsaW5rZXIgc2NyaXB0ICovCiAgICAgQVNNX0NPTlNUQU5UKEZJWEFERFJfWF9T
SVpFLCBGSVhBRERSX1hfU0laRSk7CiB9Cg==
--------------9DC579F8BDE441FCF75385D5--

