Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 523EA8D0232
	for <lists+xen-devel@lfdr.de>; Mon, 27 May 2024 15:51:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.730781.1135984 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sBal6-0001cu-Sz; Mon, 27 May 2024 13:51:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 730781.1135984; Mon, 27 May 2024 13:51:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sBal6-0001aa-Nk; Mon, 27 May 2024 13:51:28 +0000
Received: by outflank-mailman (input) for mailman id 730781;
 Mon, 27 May 2024 13:51:26 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ClYa=M6=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1sBal4-000158-Sk
 for xen-devel@lists.xenproject.org; Mon, 27 May 2024 13:51:26 +0000
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com
 [2a00:1450:4864:20::52f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 35fe4ad1-1c30-11ef-90a1-e314d9c70b13;
 Mon, 27 May 2024 15:51:26 +0200 (CEST)
Received: by mail-ed1-x52f.google.com with SMTP id
 4fb4d7f45d1cf-57857e0f45dso3239668a12.1
 for <xen-devel@lists.xenproject.org>; Mon, 27 May 2024 06:51:26 -0700 (PDT)
Received: from [192.168.219.221] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-579ced17435sm2033996a12.53.2024.05.27.06.51.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 May 2024 06:51:25 -0700 (PDT)
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
X-Inumbo-ID: 35fe4ad1-1c30-11ef-90a1-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1716817886; x=1717422686; darn=lists.xenproject.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=goesb8cXz2px5dcrm7tFtR9L+lofzK1L1CKjQDQyGdI=;
        b=QD8Nijtr1UYwMBNTe/utRi93AK4YW+4DdR92gBLcJ4Fqtcq64VBiEhxQ4Hd4QWnj0j
         KiQUWTnETzfy9ClDnHx9YL0h2Q0C9/nt+KOPPRjMtsSM3PDlWjRYLzwEobhOnSId9rpS
         6LVh/TGalpoccWLeXc5yoanBVoH7eYmYdx20elE9uB773SQOxdbH4x6Fxp07JAudr4sS
         mN/YrI3RN6mAv1FH5IkgOOGkQ5/vXL0N9zwJcFhyTPETSsVEWfmYPTDdInHtU4a6BqDm
         9NpKQ+70FhAKaO3stLLmd0lFPcx01PEUKpDTs+TXsu3V5A5joYh1z1kpVQy5uY3rnGHG
         0kdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716817886; x=1717422686;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=goesb8cXz2px5dcrm7tFtR9L+lofzK1L1CKjQDQyGdI=;
        b=Ys/G7WQoKJlQOxqxpBJW1qwlDgCfddYKba+oEBbnk1PfMNfBHQ+oweTXA83REJnlDg
         5jCTg3JZB9Aey200rCG2UWVTABn2lkGE7ALg9+af09WRYe8JeRDr1vn5BMeiH7rbrSKN
         ngUoQKE8Yd2jiMarus8GAWOOhlJSkN/wwk0+XlN/VbKlPXvD+iYVNjT8lMZvQ3xRjwQu
         ySZIhyx+y+I9iNWeFazcILpBrEhMF0ef3nP2R8FYcnA7VmWB98JNoUCidP8B+KbhKDRb
         BXuPKhpfokm2xD/colrp9+lDBGF9V/KFG1xMLgeK6BPY2p6EYyHMDH/kNkWBaLLrkyBz
         cCeA==
X-Forwarded-Encrypted: i=1; AJvYcCX4NQaRxGz1DbSsgQLIqMxS+GTfhpX6QPKxNx2oDstttP5Za6spv80YegnoCubijCqukvgNXKzYHS+JiCrUDXOE+XzVBOr6L1e7MpibQ+k=
X-Gm-Message-State: AOJu0YwyJi6dm1lj934wv6C7vyknowq7L2E3a4pwDXxQ71Nobv6LD/JZ
	WNgXNt+grdTHu+mInrNrlNZu1TLZ+GYrWQDqnfKl5sNiNz7BJHbF
X-Google-Smtp-Source: AGHT+IGLFqvAwRhFNeA9giLHQ+PVc4GkANuaLEKUT6l//dQ7BFtjPTVECXHxo56g5xr0tgxpt5O3uQ==
X-Received: by 2002:a50:aa84:0:b0:56d:c928:ad76 with SMTP id 4fb4d7f45d1cf-57851a8daebmr5999057a12.26.1716817885455;
        Mon, 27 May 2024 06:51:25 -0700 (PDT)
Message-ID: <494232556bdafdd96a6795638bb1376a434cb2b8.camel@gmail.com>
Subject: Re: [PATCH v2 for-4.19 00/13] xen/bitops: Untangle ffs()/fls()
 infrastructure
From: "Oleksii K." <oleksii.kurochko@gmail.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>, Xen-devel
	 <xen-devel@lists.xenproject.org>
Cc: Jan Beulich <JBeulich@suse.com>, Roger Pau =?ISO-8859-1?Q?Monn=E9?=
 <roger.pau@citrix.com>, Wei Liu <wl@xen.org>, Stefano Stabellini
 <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Volodymyr Babchuk
 <Volodymyr_Babchuk@epam.com>, Bertrand Marquis <bertrand.marquis@arm.com>, 
 Michal Orzel <michal.orzel@amd.com>, Shawn Anastasio
 <sanastasio@raptorengineering.com>, "consulting @ bugseng . com"
 <consulting@bugseng.com>, Simone Ballarin <simone.ballarin@bugseng.com>,
 Federico Serafini <federico.serafini@bugseng.com>, Nicola Vetrini
 <nicola.vetrini@bugseng.com>
Date: Mon, 27 May 2024 15:51:24 +0200
In-Reply-To: <20240524200338.1232391-1-andrew.cooper3@citrix.com>
References: <20240524200338.1232391-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
User-Agent: Evolution 3.52.1 (3.52.1-1.fc40) 
MIME-Version: 1.0

SSB0aGluayB3ZSBjYW4gY29uc2lkZXIgdG8gaGF2ZSB0aGlzIHBhdGNoIHNlcmllcyBpbiBYZW4g
NC4xOSByZWxlYXNlOgogUmVsZWFzZS1hY2tlZC1ieTogT2xla3NpaSBLdXJvY2hrbyA8b2xla3Np
aS5rdXJvY2hrb0BnbWFpbC5jb20+IAoKfiBPbGVrc2lpCk9uIEZyaSwgMjAyNC0wNS0yNCBhdCAy
MTowMyArMDEwMCwgQW5kcmV3IENvb3BlciB3cm90ZToKPiBiaXRvcHMuaCBpcyBhIG1lc3MuwqAg
SXQgaGFzIGdyb3duIG9yZ2FudGljYWxseSBvdmVyIG1hbnkgeWVhcnMsIGFuZAo+IGZvcmNlcwo+
IHVucmVhc29uYWJsZSByZXBzb25zaWJpbGl0aWVzIG91dCBpbnRvIHRoZSBwZXItYXJjaCBzdHVi
cy4KPiAKPiBTdGFydCBjbGVhbmluZyBpdCB1cCB3aXRoIGZmcygpIGFuZCBmcmllbmRzLsKgIEFj
cm9zcyB0aGUgYm9hcmQsIHRoaXMKPiBhZGRzOgo+IAo+IMKgKiBGdW5jdGlvbmluZyBiaXRvcHMg
d2l0aG91dCBhcmNoLXNwZWNpZmljIGFzbQo+IMKgKiBBbiBvcHRpb24gZm9yIGFyY2hlcyB0byBw
cm92aWRlIG1vcmUgb3B0aW1hbCBjb2RlIGdlbmVyYXRpb24KPiDCoCogQ29tcGlsZS10aW1lIGNv
bnN0YW50IGZvbGRpbmcKPiDCoCogVGVzdGluZyBhdCBib3RoIGNvbXBpbGUgdGltZSBhbmQgZHVy
aW5nIGluaXQgdGhhdCB0aGUgYmFzaWMKPiBvcGVyYXRpb25zCj4gwqDCoCBiZWhhdmUgYWNjb3Jk
aW5nIHRvIHNwZWMuCj4gCj4gYW5kIHRoZSBvbmx5IHJlYXNvbiB0aGlzIHNlcmllcyBpc24ndCBh
IG5ldCByZWR1Y3Rpb24gaW4gY29kZSBhbG9uZQo+IGlzIHRoZQo+IGJlY2F1c2Ugb2YgdGhlIG5l
dyB1bml0IHRlc3RpbmcuCj4gCj4gVGhpcyBmb3JtIGlzIHN1cGVyaW9yIGluIG1hbnkgd2F5cywg
aW5jbHVkaW5nIGdldHRpbmcgUklTQy1WIHN1cHBvcnQKPiBmb3IgZnJlZS4KPiAKPiB2MjoKPiDC
oCogTWFueSBjaGFuZ2VzLsKgIFNlZSBwYXRjaGVzIGZvciBkZXRhaWxzCj4gwqAqIEluY2x1ZGUg
dGhlIGZscygpIHNpZGUgb2YgdGhlIGluZnJhc3RydWN0dXJlIHRvby4KPiAKPiBUZXN0aW5nOgo+
IMKgCj4gaHR0cHM6Ly9naXRsYWIuY29tL3hlbi1wcm9qZWN0L3Blb3BsZS9hbmR5aGhwL3hlbi8t
L3BpcGVsaW5lcy8xMzA0NjY0NTQ0Cj4gwqAgaHR0cHM6Ly9jaXJydXMtY2kuY29tL2dpdGh1Yi9h
bmR5aGhwL3hlbi8KPiAKPiBTZXJpZXMtd2lkZSBuZXQgYmxvYXQtby1tZXRlcjoKPiAKPiDCoCB4
ODY6wqDCoCB1cC9kb3duOiA1MS8tMjQ3ICgtMTk2KQo+IMKgIEFSTTY0OiB1cC9kb3duOiA0MC8t
NDAwICgtMzYwKQo+IAo+IGFuZCBQUEM2NCByZXByb2R1Y2VkIGluIGZ1bGwsIGp1c3QgdG8gZGVt
b25zdHJhdGUgaG93IGFic3VyZCBpdCB3YXMKPiB0byBoYXZlCj4gZ2VuZXJpY19mP3MoKSBhcyBz
dGF0aWMgaW5saW5lcy4uLgo+IAo+IMKgIGFkZC9yZW1vdmU6IDEvMCBncm93L3NocmluazogMS8x
MSB1cC9kb3duOiAyMjgvLTQ4MzIgKC00NjA0KQo+IMKgIEZ1bmN0aW9uwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
IG9sZMKgwqDCoMKgIG5ld8KgwqAgZGVsdGEKPiDCoCBpbml0X2NvbnN0cnVjdG9yc8KgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgLcKgwqDC
oMKgIDIyMMKgwqDCoCArMjIwCj4gwqAgc3RhcnRfeGVuwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIDkywqDCoMKg
wqAgMTAwwqDCoMKgwqDCoCArOAo+IMKgIGFsbG9jX2hlYXBfcGFnZXPCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgMTk4MMKgwqDCoCAxNzQ0wqDC
oMKgIC0yMzYKPiDCoCB4ZW5oZWFwX21heF9tZm7CoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIDM2MMKgwqDCoMKgIDEyMMKgwqDCoCAtMjQw
Cj4gwqAgZnJlZV9oZWFwX3BhZ2VzwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoCA3ODTCoMKgwqDCoCA1MzbCoMKgwqAgLTI0OAo+IMKgIGZp
bmRfbmV4dF96ZXJvX2JpdMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqAgNTY0wqDCoMKgwqAgMjc2wqDCoMKgIC0yODgKPiDCoCBmaW5kX25leHRfYml0
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqAgNTQ4wqDCoMKgwqAgMjYwwqDCoMKgIC0yODgKPiDCoCBmaW5kX2ZpcnN0X3plcm9fYml0
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgNDQ0wqDC
oMKgwqAgMTQ4wqDCoMKgIC0yOTYKPiDCoCBmaW5kX2ZpcnN0X2JpdMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCA0NDTCoMKgwqDCoCAx
MzLCoMKgwqAgLTMxMgo+IMKgIHhtZW1fcG9vbF9mcmVlwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAxNzc2wqDCoMKgIDE0NDDCoMKgwqAg
LTMzNgo+IMKgIF9fZG9fc29mdGlyccKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgNjA0wqDCoMKgwqAgMjUywqDCoMKgIC0zNTIK
PiDCoCBpbml0X2hlYXBfcGFnZXPCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoCAyMzI4wqDCoMKgIDE0MTbCoMKgwqAgLTkxMgo+IMKgIHhtZW1f
cG9vbF9hbGxvY8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgIDI5MjDCoMKgwqAgMTU5NsKgwqAgLTEzMjQKPiAKPiAKPiBBbmRyZXcgQ29vcGVy
ICgxMik6Cj4gwqAgcHBjL2Jvb3Q6IFJ1biBjb25zdHJ1Y3RvcnMgb24gYm9vdAo+IMKgIHhlbi9i
aXRvcHM6IENsZWFudXAgYWhlYWQgb2YgcmVhcnJhbmdlbWVudHMKPiDCoCBBUk0vYml0b3BzOiBD
aGFuZ2UgZmluZF9maXJzdF9zZXRfYml0KCkgdG8gYmUgYSBkZWZpbmUKPiDCoCB4ZW4vcGFnZV9h
bGxvYzogQ29lcmNlIG1pbihmbHNsKCksIGZvbykgZXhwcmVzc2lvbnMgdG8gYmVpbmcKPiB1bnNp
Z25lZAo+IMKgIHhlbi9iaXRvcHM6IEltcGxlbWVudCBnZW5lcmljX2Y/c2woKSBpbiBsaWIvCj4g
wqAgeGVuL2JpdG9wczogSW1wbGVtZW50IGZmcygpIGluIGNvbW1vbiBsb2dpYwo+IMKgIHg4Ni9i
aXRvcHM6IEltcHJvdmUgYXJjaF9mZnMoKSBpbiB0aGUgZ2VuZXJhbCBjYXNlCj4gwqAgeGVuL2Jp
dG9wczogSW1wbGVtZW50IGZmc2woKSBpbiBjb21tb24gbG9naWMKPiDCoCB4ZW4vYml0b3BzOiBS
ZXBsYWNlIGZpbmRfZmlyc3Rfc2V0X2JpdCgpIHdpdGggZmZzbCgpIC0gMQo+IMKgIHhlbi9iaXRv
cHM6IERlbGV0ZSBmaW5kX2ZpcnN0X3NldF9iaXQoKQo+IMKgIHhlbi9iaXRvcHM6IENsZWFuIHVw
IGZmczY0KCkvZmxzNjQoKSBkZWZpbml0aW9ucwo+IMKgIHhlbi9iaXRvcHM6IFJlYXJyYW5nZSB0
aGUgdG9wIG9mIHhlbi9iaXRvcHMuaAo+IAo+IE9sZWtzaWkgS3Vyb2Noa28gKDEpOgo+IMKgIHhl
bi9iaXRvcHM6IEltcGxlbWVudCBmbHMoKS9mbHNsKCkgaW4gY29tbW9uIGxvZ2ljCj4gCj4gwqB4
ZW4vYXJjaC9hcm0vaW5jbHVkZS9hc20vYXJtMzIvYml0b3BzLmjCoMKgwqDCoMKgIHzCoMKgIDIg
LQo+IMKgeGVuL2FyY2gvYXJtL2luY2x1ZGUvYXNtL2FybTY0L2JpdG9wcy5owqDCoMKgwqDCoCB8
wqAgMTIgLS0KPiDCoHhlbi9hcmNoL2FybS9pbmNsdWRlL2FzbS9iaXRvcHMuaMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqAgfMKgIDM1ICstLS0KPiDCoHhlbi9hcmNoL3BwYy9pbmNsdWRlL2FzbS9iaXRv
cHMuaMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgfMKgIDE3ICstCj4gwqB4ZW4vYXJjaC9wcGMvc2V0
dXAuY8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB8wqDC
oCAyICsKPiDCoHhlbi9hcmNoL3g4Ni9ndWVzdC94ZW4veGVuLmPCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoCB8wqDCoCA0ICstCj4gwqB4ZW4vYXJjaC94ODYvaHZtL2RvbTBfYnVpbGQu
Y8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB8wqDCoCAyICstCj4gwqB4ZW4vYXJjaC94
ODYvaHZtL2hwZXQuY8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB8
wqDCoCA4ICstCj4gwqB4ZW4vYXJjaC94ODYvaW5jbHVkZS9hc20vYml0b3BzLmjCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgIHwgMTE0ICsrKysrKystLS0tLS0KPiDCoHhlbi9hcmNoL3g4Ni9pbmNsdWRl
L2FzbS9wdC1jb250aWctbWFya2Vycy5oIHzCoMKgIDIgKy0KPiDCoHhlbi9hcmNoL3g4Ni9tbS5j
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHzC
oMKgIDIgKy0KPiDCoHhlbi9hcmNoL3g4Ni9tbS9wMm0tcG9kLmPCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoCB8wqDCoCA0ICstCj4gwqB4ZW4vY29tbW9uL01ha2VmaWxlwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgfMKgwqAgMSAr
Cj4gwqB4ZW4vY29tbW9uL2JpdG9wcy5jwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqAgfMKgIDg5ICsrKysrKysrKysrCj4gwqB4ZW4vY29tbW9uL3BhZ2Vf
YWxsb2MuY8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB8wqDCoCA2
ICstCj4gwqB4ZW4vY29tbW9uL3NvZnRpcnEuY8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoCB8wqDCoCAyICstCj4gwqB4ZW4vZHJpdmVycy9wYXNzdGhyb3Vn
aC9hbWQvaW9tbXVfbWFwLmPCoMKgwqDCoMKgIHzCoMKgIDIgKy0KPiDCoHhlbi9kcml2ZXJzL3Bh
c3N0aHJvdWdoL2lvbW11LmPCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB8wqDCoCA0ICstCj4g
wqB4ZW4vZHJpdmVycy9wYXNzdGhyb3VnaC94ODYvaW9tbXUuY8KgwqDCoMKgwqDCoMKgwqDCoCB8
wqDCoCA0ICstCj4gwqB4ZW4vaW5jbHVkZS94ZW4vYml0b3BzLmjCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgIHwgMTU5ICsrKysrKysrLS0tLS0tLS0tCj4gLS0KPiDCoHhl
bi9pbmNsdWRlL3hlbi9ib290LWNoZWNrLmjCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oCB8wqAgNjAgKysrKysrKwo+IMKgeGVuL2luY2x1ZGUveGVuL2NvbXBpbGVyLmjCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgfMKgwqAgMyArLQo+IMKgeGVuL2xpYi9NYWtlZmls
ZcKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
IHzCoMKgIDIgKwo+IMKgeGVuL2xpYi9nZW5lcmljLWZmc2wuY8KgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHzCoCA2NSArKysrKysrKwo+IMKgeGVuL2xpYi9nZW5l
cmljLWZsc2wuY8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHzC
oCA2OCArKysrKysrKwo+IMKgMjUgZmlsZXMgY2hhbmdlZCwgNDQ0IGluc2VydGlvbnMoKyksIDIy
NSBkZWxldGlvbnMoLSkKPiDCoGNyZWF0ZSBtb2RlIDEwMDY0NCB4ZW4vY29tbW9uL2JpdG9wcy5j
Cj4gwqBjcmVhdGUgbW9kZSAxMDA2NDQgeGVuL2luY2x1ZGUveGVuL2Jvb3QtY2hlY2suaAo+IMKg
Y3JlYXRlIG1vZGUgMTAwNjQ0IHhlbi9saWIvZ2VuZXJpYy1mZnNsLmMKPiDCoGNyZWF0ZSBtb2Rl
IDEwMDY0NCB4ZW4vbGliL2dlbmVyaWMtZmxzbC5jCj4gCgo=


