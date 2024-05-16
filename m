Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 018608C7A2D
	for <lists+xen-devel@lfdr.de>; Thu, 16 May 2024 18:18:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.723528.1128466 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s7doA-00053t-B7; Thu, 16 May 2024 16:18:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 723528.1128466; Thu, 16 May 2024 16:18:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s7doA-00051Z-7o; Thu, 16 May 2024 16:18:18 +0000
Received: by outflank-mailman (input) for mailman id 723528;
 Thu, 16 May 2024 16:18:16 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0hAQ=MT=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1s7do8-00051A-MG
 for xen-devel@lists.xenproject.org; Thu, 16 May 2024 16:18:16 +0000
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com
 [2a00:1450:4864:20::136])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e63d4adc-139f-11ef-909d-e314d9c70b13;
 Thu, 16 May 2024 18:18:15 +0200 (CEST)
Received: by mail-lf1-x136.google.com with SMTP id
 2adb3069b0e04-51f174e316eso1188051e87.0
 for <xen-devel@lists.xenproject.org>; Thu, 16 May 2024 09:18:15 -0700 (PDT)
Received: from [192.168.226.248] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-521f38d8edbsm3008735e87.239.2024.05.16.09.18.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 May 2024 09:18:14 -0700 (PDT)
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
X-Inumbo-ID: e63d4adc-139f-11ef-909d-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1715876295; x=1716481095; darn=lists.xenproject.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=3zHgXCJVqG6j26NuClzdMhWEUX+xEfpJpSOC/7Qz8Ow=;
        b=FkZhrFkNvYe9HQNcK0WDALM4RKX+pqsOKsP9Mql+T2/9LD9U5o9mTkJLG5aFwVRz/r
         nUubjYIXc8l/n4ImIwOfxZk3MErCoOsMWJpOveaqOgQbWy+EshZkbL9xsB1IdVpnqFl6
         ++ClUs6GAfTadp7szsWZ4dDFU4DoQcJZyXMsDjAM/La8o1Y1RhyR75EYvg9lUmkKtlwH
         n5jvT3LPcuATuUhB7olGVZRhnSqdcc1ICJrv7IzKmkjKmvatOq3D0C+dVz3PpQEEZBC7
         bM5KW7sz3hNACyLV1B0YoHvt0rVcivprdhFQwQWQABWBI6/Bh+cxvD/J8EW+zbBX2/KA
         YPKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715876295; x=1716481095;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=3zHgXCJVqG6j26NuClzdMhWEUX+xEfpJpSOC/7Qz8Ow=;
        b=Uvaf0Y0asn5CPD44s4p8J7ZuXEir676JPQ8coxUX40S1e9HBhWAp6miLOlfh5W45q0
         RyhSvPTwwfSqHRCrgWS6HMR6yzbTAyceacOSZXd4Un69Sf6C8omJ29sJOvf3G1AnQYjC
         5hbkPQcwjEDpV00ATMXloc2jAU4Ve+dxSQZHF1AZHady1ylQvlPo7Viao4cvWPPZdiE6
         Ep9YKUQbEZt9y4rM1uK92600guE9z4sngXaYKkBCwwqySwaW34JTV7wzd1Mpt9rFNZWA
         AdtHYk4RnafWl2eyBam/DMex7V6Hu4O1u7U2O8kfWZ+vtHgi+Wr8MbmuFa8seAMEnn2K
         /jzw==
X-Gm-Message-State: AOJu0Yy23NxRU9RPqZSfxq6KG4lzXzYwZrjvVef2YVQ/YFo4tFMfWvVV
	fCXkXn1OHPnUVyo0ft86tfP8//ytJbTuNeswjiCs88ObkgGHdvyQ
X-Google-Smtp-Source: AGHT+IH5pl8FslVbh4Ll9+N5ni/SfuxT4XEbxtNZgPTgPtw1Bnyw1kMVtQkAMbyCGgpydvUk9wMXAg==
X-Received: by 2002:a05:6512:1046:b0:521:9f04:27c1 with SMTP id 2adb3069b0e04-5220ff74b99mr14344142e87.66.1715876294855;
        Thu, 16 May 2024 09:18:14 -0700 (PDT)
Message-ID: <603054a7234c5262f10df552dad1c0919dacaf90.camel@gmail.com>
Subject: Re: [PATCH for-4.19] tools/xentop: fix cpu% sort order
From: "Oleksii K." <oleksii.kurochko@gmail.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>, Leigh Brown
 <leigh@solinno.co.uk>
Cc: xen-devel@lists.xenproject.org
Date: Thu, 16 May 2024 18:18:14 +0200
In-Reply-To: <2f83c912-c6bf-4f02-9c64-abe539d25a61@citrix.com>
References: <20240514081344.4499-1-leigh@solinno.co.uk>
	 <195184dd-46e3-4bd0-b82b-cf41000e4db1@citrix.com>
	 <d1fbc48ee89da3f4fe45a96161f9502e@solinno.co.uk>
	 <2f83c912-c6bf-4f02-9c64-abe539d25a61@citrix.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
User-Agent: Evolution 3.52.1 (3.52.1-1.fc40) 
MIME-Version: 1.0

T24gVHVlLCAyMDI0LTA1LTE0IGF0IDE0OjUyICswMTAwLCBBbmRyZXcgQ29vcGVyIHdyb3RlOgo+
IE9uIDE0LzA1LzIwMjQgMTozNiBwbSwgTGVpZ2ggQnJvd24gd3JvdGU6Cj4gPiBIZWxsbywKPiA+
IAo+ID4gT24gMjAyNC0wNS0xNCAxMzowNywgQW5kcmV3IENvb3BlciB3cm90ZToKPiA+ID4gT24g
MTQvMDUvMjAyNCA5OjEzIGFtLCBMZWlnaCBCcm93biB3cm90ZToKPiA+ID4gPiBBbHRob3VnaCB1
c2luZyBpbnRlZ2VyIGNvbXBhcmlzb24gdG8gY29tcGFyZSBkb3VibGVzIGtpbmQgb2YKPiA+ID4g
PiB3b3JrcywgaXQncyBhbm5veWluZyB0byBzZWUgZG9tYWlucyBzbGlnaHRseSBvdXQgb2Ygb3Jk
ZXIgd2hlbgo+ID4gPiA+IHNvcnRpbmcgYnkgY3B1JS4KPiA+ID4gPiAKPiA+ID4gPiBBZGQgYSBj
b21wYXJlX2RibCgpIGZ1bmN0aW9uIGFuZCB1cGRhdGUgY29tcGFyZV9jcHVfcGN0KCkgdG8KPiA+
ID4gPiBjYWxsIGl0Lgo+ID4gPiA+IAo+ID4gPiA+IFNpZ25lZC1vZmYtYnk6IExlaWdoIEJyb3du
IDxsZWlnaEBzb2xpbm5vLmNvLnVrPgo+ID4gPiA+IC0tLQo+ID4gPiA+IMKgdG9vbHMveGVudG9w
L3hlbnRvcC5jIHwgMTMgKysrKysrKysrKysrLQo+ID4gPiA+IMKgMSBmaWxlIGNoYW5nZWQsIDEy
IGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKPiA+ID4gPiAKPiA+ID4gPiBkaWZmIC0tZ2l0
IGEvdG9vbHMveGVudG9wL3hlbnRvcC5jIGIvdG9vbHMveGVudG9wL3hlbnRvcC5jCj4gPiA+ID4g
aW5kZXggNTQ1YmQ1ZTk2ZC4uOTkxOTljYWVjOSAxMDA2NDQKPiA+ID4gPiAtLS0gYS90b29scy94
ZW50b3AveGVudG9wLmMKPiA+ID4gPiArKysgYi90b29scy94ZW50b3AveGVudG9wLmMKPiA+ID4g
PiBAQCAtODUsNiArODUsNyBAQCBzdGF0aWMgdm9pZCBzZXRfZGVsYXkoY29uc3QgY2hhciAqdmFs
dWUpOwo+ID4gPiA+IMKgc3RhdGljIHZvaWQgc2V0X3Byb21wdChjb25zdCBjaGFyICpuZXdfcHJv
bXB0LCB2b2lkCj4gPiA+ID4gKCpmdW5jKShjb25zdAo+ID4gPiA+IGNoYXIgKikpOwo+ID4gPiA+
IMKgc3RhdGljIGludCBoYW5kbGVfa2V5KGludCk7Cj4gPiA+ID4gwqBzdGF0aWMgaW50IGNvbXBh
cmUodW5zaWduZWQgbG9uZyBsb25nLCB1bnNpZ25lZCBsb25nIGxvbmcpOwo+ID4gPiA+ICtzdGF0
aWMgaW50IGNvbXBhcmVfZGJsKGRvdWJsZSwgZG91YmxlKTsKPiA+ID4gPiDCoHN0YXRpYyBpbnQg
Y29tcGFyZV9kb21haW5zKHhlbnN0YXRfZG9tYWluICoqLCB4ZW5zdGF0X2RvbWFpbgo+ID4gPiA+
ICoqKTsKPiA+ID4gPiDCoHN0YXRpYyB1bnNpZ25lZCBsb25nIGxvbmcgdG90X25ldF9ieXRlcygg
eGVuc3RhdF9kb21haW4gKiwKPiA+ID4gPiBpbnQpOwo+ID4gPiA+IMKgc3RhdGljIGJvb2wgdG90
X3ZiZF9yZXFzKHhlbnN0YXRfZG9tYWluICosIGludCwgdW5zaWduZWQgbG9uZwo+ID4gPiA+IGxv
bmcgKik7Cj4gPiA+ID4gQEAgLTQyMiw2ICs0MjMsMTYgQEAgc3RhdGljIGludCBjb21wYXJlKHVu
c2lnbmVkIGxvbmcgbG9uZyBpMSwKPiA+ID4gPiB1bnNpZ25lZCBsb25nIGxvbmcgaTIpCj4gPiA+
ID4gwqDCoMKgwqAgcmV0dXJuIDA7Cj4gPiA+ID4gwqB9Cj4gPiA+ID4gCj4gPiA+ID4gKy8qIENv
bXBhcmVzIHR3byBkb3VibGUgcHJlY2lzaW9uIG51bWJlcnMsIHJldHVybmluZyAtMSwwLDEgZm9y
Cj4gPiA+ID4gPCw9LD4gKi8KPiA+ID4gPiArc3RhdGljIGludCBjb21wYXJlX2RibChkb3VibGUg
ZDEsIGRvdWJsZSBkMikKPiA+ID4gPiArewo+ID4gPiA+ICvCoMKgwqAgaWYoZDEgPCBkMikKPiA+
ID4gPiArwqDCoMKgwqDCoMKgwqAgcmV0dXJuIC0xOwo+ID4gPiA+ICvCoMKgwqAgaWYoZDEgPiBk
MikKPiA+ID4gPiArwqDCoMKgwqDCoMKgwqAgcmV0dXJuIDE7Cj4gPiA+ID4gK8KgwqDCoCByZXR1
cm4gMDsKPiA+ID4gPiArfQo+ID4gPiA+ICsKPiA+ID4gPiDCoC8qIENvbXBhcmlzb24gZnVuY3Rp
b24gZm9yIHVzZSB3aXRoIHFzb3J0LsKgIENvbXBhcmVzIHR3bwo+ID4gPiA+IGRvbWFpbnMKPiA+
ID4gPiB1c2luZyB0aGUKPiA+ID4gPiDCoCAqIGN1cnJlbnQgc29ydCBmaWVsZC4gKi8KPiA+ID4g
PiDCoHN0YXRpYyBpbnQgY29tcGFyZV9kb21haW5zKHhlbnN0YXRfZG9tYWluICoqZG9tYWluMSwK
PiA+ID4gPiB4ZW5zdGF0X2RvbWFpbgo+ID4gPiA+ICoqZG9tYWluMikKPiA+ID4gPiBAQCAtNTIz
LDcgKzUzNCw3IEBAIHN0YXRpYyBkb3VibGUgZ2V0X2NwdV9wY3QoeGVuc3RhdF9kb21haW4KPiA+
ID4gPiAqZG9tYWluKQo+ID4gPiA+IAo+ID4gPiA+IMKgc3RhdGljIGludCBjb21wYXJlX2NwdV9w
Y3QoeGVuc3RhdF9kb21haW4gKmRvbWFpbjEsCj4gPiA+ID4geGVuc3RhdF9kb21haW4KPiA+ID4g
PiAqZG9tYWluMikKPiA+ID4gPiDCoHsKPiA+ID4gPiAtwqDCoMKgIHJldHVybiAtY29tcGFyZShn
ZXRfY3B1X3BjdChkb21haW4xKSwKPiA+ID4gPiBnZXRfY3B1X3BjdChkb21haW4yKSk7Cj4gPiA+
ID4gK8KgwqDCoCByZXR1cm4gLWNvbXBhcmVfZGJsKGdldF9jcHVfcGN0KGRvbWFpbjEpLAo+ID4g
PiA+IGdldF9jcHVfcGN0KGRvbWFpbjIpKTsKPiA+ID4gCj4gPiA+IE9oLCB3ZSB3ZXJlIGRvaW5n
IGFuIGltcGxpY2l0IGRvdWJsZS0+dW5zaWduZWQgbG9uZyBsb25nCj4gPiA+IGNvbnZlcnNpb24u
wqAKPiA+ID4gT3ZlciB0aGUgcmFuZ2UgMC4wIHRvIDEwMC4wLCB0aGF0IG91Z2h0IHRvIHdvcmsg
YXMgZXhwZWN0ZWQuwqAKPiA+ID4gV2hhdCBraW5kCj4gPiA+IG9mIG91dC1vZi1vcmRlciBhcmUg
eW91IHNlZWluZz8KPiA+IAo+ID4gV2l0aG91dCBwYXRjaDoKPiA+IAo+ID4geGVudG9wIC0gMTM6
Mjk6MDHCoMKgIFhlbiA0LjE4LjIKPiA+IDEzIGRvbWFpbnM6IDEgcnVubmluZywgMTIgYmxvY2tl
ZCwgMCBwYXVzZWQsIDAgY3Jhc2hlZCwgMCBkeWluZywgMAo+ID4gc2h1dGRvd24KPiA+IE1lbTog
NjcwMzA2NDBrIHRvdGFsLCAzMzA5NzgwMGsgdXNlZCwgMzM5MzI4NDBrIGZyZWXCoMKgwqAgQ1BV
czogMjQgQAo+ID4gMzY5M01Iego+ID4gwqDCoMKgwqDCoCBOQU1FwqAgU1RBVEXCoMKgIENQVShz
ZWMpIENQVSglKcKgwqDCoMKgIE1FTShrKSBNRU0oJSnCoCBNQVhNRU0oaykKPiA+IE1BWE1FTSgl
KQo+ID4gwqAgaWNlY3JlYW0gLS1iLS0twqDCoMKgwqDCoMKgIDI1OTfCoMKgwqAgNi42wqDCoMKg
IDQxOTQzNjjCoMKgwqAgNi4zwqDCoMKgCj4gPiA0MTk1MzI4wqDCoMKgwqDCoMKgIDYuMwo+ID4g
wqDCoMKgwqAgeGVuZGQgLS1iLS0twqDCoMKgwqDCoMKgIDQwMTbCoMKgwqAgNS40wqDCoMKgwqAg
NTI0MjY4wqDCoMKgIDAuOMKgwqDCoMKgCj4gPiA1MjUzMTLCoMKgwqDCoMKgwqAgMC44Cj4gPiDC
oCBEb21haW4tMCAtLS0tLXLCoMKgwqDCoMKgwqAgMTA1OcKgwqDCoCAxLjfCoMKgwqAgMTA0ODU3
NsKgwqDCoCAxLjbCoMKgwqAKPiA+IDEwNDg1NzbCoMKgwqDCoMKgwqAgMS42Cj4gPiDCoMKgwqDC
oMKgIG5lb24gLS1iLS0twqDCoMKgwqDCoMKgwqAgODI2wqDCoMKgIDEuMcKgwqDCoCAyMDk3MjE2
wqDCoMKgIDMuMcKgwqDCoAo+ID4gMjA5ODE3NsKgwqDCoMKgwqDCoCAzLjEKPiA+IMKgwqAgYmxl
bmRlciAtLWItLS3CoMKgwqDCoMKgwqDCoCAxMjHCoMKgwqAgMC4ywqDCoMKgIDEwNDg2NDDCoMKg
wqAgMS42wqDCoMKgCj4gPiAxMDQ5NjAwwqDCoMKgwqDCoMKgIDEuNgo+ID4gwqDCoMKgwqAgYnJl
YWQgLS1iLS0twqDCoMKgwqDCoMKgwqDCoCA2OcKgwqDCoCAwLjHCoMKgwqDCoCA1MjQzNTLCoMKg
wqAgMC44wqDCoMKgwqAKPiA+IDUyNTMxMsKgwqDCoMKgwqDCoCAwLjgKPiA+IMKgwqDCoMKgwqDC
oCBib2IgLS1iLS0twqDCoMKgwqDCoMKgwqAgNTAywqDCoMKgIDAuM8KgwqAgMTY3NzcyODTCoMKg
IDI1LjDCoMKgCj4gPiAxNjc3ODI0MMKgwqDCoMKgwqAgMjUuMAo+ID4gwqDCoMKgIGNoZWVzZSAt
LWItLS3CoMKgwqDCoMKgwqDCoCAyMjXCoMKgwqAgMC41wqDCoMKgIDEwNDgzODTCoMKgwqAgMS42
wqDCoMKgCj4gPiAxMDQ5NjAwwqDCoMKgwqDCoMKgIDEuNgo+ID4gwqDCoCBjYXNzaW5pIC0tYi0t
LcKgwqDCoMKgwqDCoMKgIDQ4OcKgwqDCoCAwLjTCoMKgwqAgMzE0NTc5MsKgwqDCoCA0LjfCoMKg
wqAKPiA+IDMxNDY3NTLCoMKgwqDCoMKgwqAgNC43Cj4gPiDCoCBjaGlja3BlYSAtLWItLS3CoMKg
wqDCoMKgwqDCoMKgIDY3wqDCoMKgIDAuMcKgwqDCoMKgIDUyNDM1MsKgwqDCoCAwLjjCoMKgwqDC
oAo+ID4gNTI1MzEywqDCoMKgwqDCoMKgIDAuOAo+ID4gwqDCoMKgIGxlbnRpbCAtLWItLS3CoMKg
wqDCoMKgwqDCoMKgIDY3wqDCoMKgIDAuMcKgwqDCoMKgIDI2MjIwOMKgwqDCoCAwLjTCoMKgwqDC
oAo+ID4gMjYzMTY4wqDCoMKgwqDCoMKgIDAuNAo+ID4gwqDCoCBmdXNpbGxpIC0tYi0tLcKgwqDC
oMKgwqDCoMKgIDE1OcKgwqDCoCAwLjLCoMKgwqDCoCA1MjQzNTLCoMKgwqAgMC44wqDCoMKgwqAK
PiA+IDUyNTMxMsKgwqDCoMKgwqDCoCAwLjgKPiA+IMKgwqDCoMKgIHBpenphIC0tYi0tLcKgwqDC
oMKgwqDCoMKgIDM1OcKgwqDCoCAwLjXCoMKgwqDCoCA1MjQzNTLCoMKgwqAgMC44wqDCoMKgwqAK
PiA+IDUyNTMxMsKgwqDCoMKgwqDCoCAwLjgKPiA+IAo+ID4gV2l0aCBwYXRjaDoKPiA+IAo+ID4g
eGVudG9wIC0gMTM6MzA6MTfCoMKgIFhlbiA0LjE4LjIKPiA+IDEzIGRvbWFpbnM6IDEgcnVubmlu
ZywgMTIgYmxvY2tlZCwgMCBwYXVzZWQsIDAgY3Jhc2hlZCwgMCBkeWluZywgMAo+ID4gc2h1dGRv
d24KPiA+IE1lbTogNjcwMzA2NDBrIHRvdGFsLCAzMzA5Nzc4OGsgdXNlZCwgMzM5MzI4NTJrIGZy
ZWXCoMKgwqAgQ1BVczogMjQgQAo+ID4gMzY5M01Iego+ID4gwqDCoMKgwqDCoCBOQU1FwqAgU1RB
VEXCoMKgIENQVShzZWMpIENQVSglKcKgwqDCoMKgIE1FTShrKSBNRU0oJSnCoCBNQVhNRU0oaykK
PiA+IE1BWE1FTSglKQo+ID4gwqDCoMKgwqAgeGVuZGQgLS1iLS0twqDCoMKgwqDCoMKgIDQwMjDC
oMKgwqAgNS43wqDCoMKgwqAgNTI0MjY4wqDCoMKgIDAuOMKgwqDCoMKgCj4gPiA1MjUzMTLCoMKg
wqDCoMKgwqAgMC44Cj4gPiDCoCBpY2VjcmVhbSAtLWItLS3CoMKgwqDCoMKgwqAgMjYwMMKgwqDC
oCAzLjjCoMKgwqAgNDE5NDM2OMKgwqDCoCA2LjPCoMKgwqAKPiA+IDQxOTUzMjjCoMKgwqDCoMKg
wqAgNi4zCj4gPiDCoCBEb21haW4tMCAtLS0tLXLCoMKgwqDCoMKgwqAgMTA2MMKgwqDCoCAxLjXC
oMKgwqAgMTA0ODU3NsKgwqDCoCAxLjbCoMKgwqAKPiA+IDEwNDg1NzbCoMKgwqDCoMKgwqAgMS42
Cj4gPiDCoMKgwqDCoMKgIG5lb24gLS1iLS0twqDCoMKgwqDCoMKgwqAgODI3wqDCoMKgIDEuMcKg
wqDCoCAyMDk3MjE2wqDCoMKgIDMuMcKgwqDCoAo+ID4gMjA5ODE3NsKgwqDCoMKgwqDCoCAzLjEK
PiA+IMKgwqDCoCBjaGVlc2UgLS1iLS0twqDCoMKgwqDCoMKgwqAgMjI1wqDCoMKgIDAuN8KgwqDC
oCAxMDQ4Mzg0wqDCoMKgIDEuNsKgwqDCoAo+ID4gMTA0OTYwMMKgwqDCoMKgwqDCoCAxLjYKPiA+
IMKgwqDCoMKgIHBpenphIC0tYi0tLcKgwqDCoMKgwqDCoMKgIDM1OcKgwqDCoCAwLjXCoMKgwqDC
oCA1MjQzNTLCoMKgwqAgMC44wqDCoMKgwqAKPiA+IDUyNTMxMsKgwqDCoMKgwqDCoCAwLjgKPiA+
IMKgwqAgY2Fzc2luaSAtLWItLS3CoMKgwqDCoMKgwqDCoCA0OTDCoMKgwqAgMC40wqDCoMKgIDMx
NDU3OTLCoMKgwqAgNC43wqDCoMKgCj4gPiAzMTQ2NzUywqDCoMKgwqDCoMKgIDQuNwo+ID4gwqDC
oCBmdXNpbGxpIC0tYi0tLcKgwqDCoMKgwqDCoMKgIDE1OcKgwqDCoCAwLjLCoMKgwqDCoCA1MjQz
NTLCoMKgwqAgMC44wqDCoMKgwqAKPiA+IDUyNTMxMsKgwqDCoMKgwqDCoCAwLjgKPiA+IMKgwqDC
oMKgwqDCoCBib2IgLS1iLS0twqDCoMKgwqDCoMKgwqAgNTAywqDCoMKgIDAuMsKgwqAgMTY3Nzcy
ODTCoMKgIDI1LjDCoMKgCj4gPiAxNjc3ODI0MMKgwqDCoMKgwqAgMjUuMAo+ID4gwqDCoCBibGVu
ZGVyIC0tYi0tLcKgwqDCoMKgwqDCoMKgIDEyMcKgwqDCoCAwLjLCoMKgwqAgMTA0ODY0MMKgwqDC
oCAxLjbCoMKgwqAKPiA+IDEwNDk2MDDCoMKgwqDCoMKgwqAgMS42Cj4gPiDCoMKgwqDCoCBicmVh
ZCAtLWItLS3CoMKgwqDCoMKgwqDCoMKgIDY5wqDCoMKgIDAuMcKgwqDCoMKgIDUyNDM1MsKgwqDC
oCAwLjjCoMKgwqDCoAo+ID4gNTI1MzEywqDCoMKgwqDCoMKgIDAuOAo+ID4gwqAgY2hpY2twZWEg
LS1iLS0twqDCoMKgwqDCoMKgwqDCoCA2N8KgwqDCoCAwLjHCoMKgwqDCoCA1MjQzNTLCoMKgwqAg
MC44wqDCoMKgwqAKPiA+IDUyNTMxMsKgwqDCoMKgwqDCoCAwLjgKPiA+IMKgwqDCoCBsZW50aWwg
LS1iLS0twqDCoMKgwqDCoMKgwqDCoCA2N8KgwqDCoCAwLjHCoMKgwqDCoCAyNjIyMDjCoMKgwqAg
MC40wqDCoMKgwqAKPiA+IDI2MzE2OMKgwqDCoMKgwqDCoCAwLjQKPiAKPiAKPiBBaCwgc28gaXQn
cyB0aGUgcm91bmRpbmcsIGFuZCBhIHN0cmFpZ2h0IGNhc3QgZGlzY2FyZHMgdGhlIGZyYWN0aW9u
YWwKPiBwYXJ0Lgo+IAo+IEkgdGhpbmsgeW91ciBwYXRjaCBpcyBmaW5lLCBhbHRob3VnaCBpdCBj
b3VsZCBkbyB3aXRoIGEgbWVudGlvbiBvZgo+IHdoeQo+IHRoaXMgZ29lcyB3cm9uZyBpbiB0aGUg
Y29tbWl0IG1lc3NhZ2UuwqAgSSdtIGhhcHB5IHRvIGFkanVzdCBvbgo+IGNvbW1pdC4KRmVlbCBm
cmVlIHRvIG1lcmdlIGl0IGFzIEkgYW0gY29uc2lkZXJpbmcgaXQgYXMgYnVnZml4OgogUmVsZWFz
ZS1hY2tlZC1ieTogT2xla3NpaSBLdXJvY2hrbyA8b2xla3NpaS5rdXJvY2hrb0BnbWFpbC5jb20+
Cgp+IE9sZWtzaWkKPiAKPiB+QW5kcmV3Cgo=


