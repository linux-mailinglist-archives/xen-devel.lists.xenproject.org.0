Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D040B16EBCD
	for <lists+xen-devel@lfdr.de>; Tue, 25 Feb 2020 17:55:23 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j6dRv-0003Kw-8I; Tue, 25 Feb 2020 16:52:47 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=3lsx=4N=gmail.com=julien.grall.oss@srs-us1.protection.inumbo.net>)
 id 1j6dRt-0003K3-Rv
 for xen-devel@lists.xenproject.org; Tue, 25 Feb 2020 16:52:45 +0000
X-Inumbo-ID: 3e78bd94-57ef-11ea-933c-12813bfff9fa
Received: from mail-ed1-f65.google.com (unknown [209.85.208.65])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 3e78bd94-57ef-11ea-933c-12813bfff9fa;
 Tue, 25 Feb 2020 16:52:45 +0000 (UTC)
Received: by mail-ed1-f65.google.com with SMTP id j17so200623edp.3
 for <xen-devel@lists.xenproject.org>; Tue, 25 Feb 2020 08:52:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=zfkyCHwAyfdaLUiFTRr4oprKCDuI2+Xorrw0DCfCHs4=;
 b=jABQfqMvCgS7nITf+QHW/t72M14kffredWhWFEg4+rdluZBE9u0OYMWwvCC6bVENjT
 90NreTccNIj0LT0s+pitUSPfg6UQSez6FEuzI9oqYHzShp4cF2oaxvfEwmBygRZZ2VgG
 bkHz2OvKPhN6NMeU9QjPqhnqCsz9ID5kWK2M0zkFF7vuapF/I2f1I+Wt4jBWeH+jmzVO
 E8cm1+ktK994WcKnFFpySVgvSonS645mllPjyX70b345DOcmcr5dOkMtr3y/2BYCbnT4
 92lUsmvnISuacOiOII162UZkIan5FHlIejDwj5Qmc9MlX8YTirJ5Ndsk2xaRlGf1544k
 Ii8g==
X-Gm-Message-State: APjAAAV/1LtetxR6oPZ/7U1E0zbjOxOX3b8AS24tlz9wptvzQVQEY16Z
 cjMrqBR+Nc2R/m4tpvm2vFI=
X-Google-Smtp-Source: APXvYqys/qhsrQCzu3I/TjgglZO+92FfcNwUhxBZ5tFuY5e/58PHbMOJ6E5WjmnHLM9++8qMmkzitA==
X-Received: by 2002:a17:906:5e16:: with SMTP id n22mr68221eju.25.1582649564083; 
 Tue, 25 Feb 2020 08:52:44 -0800 (PST)
Received: from a483e7b01a66.ant.amazon.com (54-240-197-238.amazon.com.
 [54.240.197.238])
 by smtp.gmail.com with ESMTPSA id d13sm1222806edk.0.2020.02.25.08.52.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 25 Feb 2020 08:52:43 -0800 (PST)
To: Jan Beulich <jbeulich@suse.com>
References: <20200224084400.94482-1-roger.pau@citrix.com>
 <20200224084400.94482-2-roger.pau@citrix.com>
 <6a22dad2-946a-ae9f-2304-61f60e0d7f8c@xen.org>
 <20200224100919.GH4679@Air-de-Roger>
 <63c23677-1dbd-3dce-d67a-ea86c5683cc7@xen.org>
 <20200224102355.GJ4679@Air-de-Roger>
 <01f7434f-295c-06de-5576-a4c5af1d3048@xen.org>
 <79664397-d445-1af9-c398-daf0b641f72f@suse.com>
From: Julien Grall <julien@xen.org>
Message-ID: <a2b679c3-39aa-b370-d1e6-f2b752338269@xen.org>
Date: Tue, 25 Feb 2020 16:52:42 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:68.0)
 Gecko/20100101 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <79664397-d445-1af9-c398-daf0b641f72f@suse.com>
Content-Language: en-GB
Subject: Re: [Xen-devel] [PATCH v3 1/2] atomic: add atomic_and operations
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

CgpPbiAyNS8wMi8yMDIwIDE2OjE1LCBKYW4gQmV1bGljaCB3cm90ZToKPiBPbiAyNC4wMi4yMDIw
IDExOjI5LCBKdWxpZW4gR3JhbGwgd3JvdGU6Cj4+IE9uIDI0LzAyLzIwMjAgMTA6MjMsIFJvZ2Vy
IFBhdSBNb25uw6kgd3JvdGU6Cj4+PiBPbiBNb24sIEZlYiAyNCwgMjAyMCBhdCAxMDoxOTo0NEFN
ICswMDAwLCBKdWxpZW4gR3JhbGwgd3JvdGU6Cj4+Pj4gT24gMjQvMDIvMjAyMCAxMDowOSwgUm9n
ZXIgUGF1IE1vbm7DqSB3cm90ZToKPj4+Pj4gT24gTW9uLCBGZWIgMjQsIDIwMjAgYXQgMTA6MDI6
NTNBTSArMDAwMCwgSnVsaWVuIEdyYWxsIHdyb3RlOgo+Pj4+Pj4gT24gMjQvMDIvMjAyMCAwODo0
MywgUm9nZXIgUGF1IE1vbm5lIHdyb3RlOgo+Pj4+Pj4+IC0tLSBhL3hlbi9pbmNsdWRlL2FzbS1h
cm0vYXJtMzIvYXRvbWljLmgKPj4+Pj4+PiArKysgYi94ZW4vaW5jbHVkZS9hc20tYXJtL2FybTMy
L2F0b21pYy5oCj4+Pj4+Pj4gQEAgLTk2LDYgKzk2LDIzIEBAIHN0YXRpYyBpbmxpbmUgaW50IGF0
b21pY19zdWJfcmV0dXJuKGludCBpLCBhdG9taWNfdCAqdikKPj4+Pj4+PiAgICAgIAlyZXR1cm4g
cmVzdWx0Owo+Pj4+Pj4+ICAgICAgfQo+Pj4+Pj4+ICtzdGF0aWMgaW5saW5lIHZvaWQgYXRvbWlj
X2FuZCh1bnNpZ25lZCBpbnQgbSwgYXRvbWljX3QgKnYpCj4+Pj4+Pgo+Pj4+Pj4gQWxsIHRoZSBh
dG9taWMgaGVscGVycyBoYXZlIHRha2VuIGEgc2lnbmVkIGludCBzbyBmYXIgYmVjYXVzZSB0aGUg
Y291bnRlciBpcwo+Pj4+Pj4gYW4gaW50LiBBbnkgcmVhc29uIHRvIGRpdmVyZ2UgZnJvbSB0aGF0
Pwo+Pj4+Pgo+Pj4+PiBTaW5jZSB0aGlzIGlzIG5vdCBhbiBhcml0aG1ldGljIG9wZXJhdGlvbiBJ
IGZlbHQgdW5zaWduZWQgaW50IHdhcyBhCj4+Pj4+IG1vcmUgc3VpdGFibGUgdHlwZSB0byBkZXNj
cmliZSBhIGJpdG1hc2s6IGl0IGZlbHQgd2VpcmQgdG8gcGFzcyBhCj4+Pj4+IGJpdG1hc2sgd2l0
aCB0eXBlIGludCwgYmVjYXVzZSBzaWduZWRuZXNzIGRvZXNuJ3QgbWFrZSBzZW5zZSB3aGVuCj4+
Pj4+IHJlZmVycmluZyB0byBhIG1hc2suCj4+Pj4KPj4+PiBBdCBzb21lIHBvaW50IEkgd291bGQg
bGlrZSB0byBoYXZlIG1hY3JvIGdlbmVyYXRpbmcgYWxsIHRoZSBhdG9taWNzIGluIG9uCj4+Pj4g
QXJtIGluIHRoZSBzYW1lIHdheSBhIExpbnV4IChzZWUgYXNtLWdlbmVyaWMvYXRvbWljLmgpLiBU
aGlzIGlzIHRvIGF2b2lkCj4+Pj4gZHVwbGljYXRpb24gYW5kIG1ha2UgZWFzeSB0byBpbnRyb2R1
Y2UgQXJtdjguMSBMU0UgYXRvbWljcy4gU28gSSB3b3VsZCBsaWtlCj4+Pj4gdG8gYXZvaWQgaW50
cm9kdWNpbmcgZGlmZmVyZW5jZSBpbiB0aGUgcHJvdG90eXBlIHVubGVzcyBpdCBpcyBzdHJpY2x5
Cj4+Pj4gbmVjZXNzYXJ5Lgo+Pj4KPj4+IFdoeSBub3QgaGF2ZSB0aGUgbWFjcm8gZ2VuZXJhdG9y
IGZ1bmN0aW9uIGdldCBwYXNzZWQgdGhlIHR5cGUgb2YgdGhlCj4+PiBwYXJhbWV0ZXI/Cj4+Cj4+
IEl0IGlzIG5vdCB3b3J0aCBpdCBmb3IgYSBzaW1wbGUgb3BlcmF0aW9uIGFuZCBJIGRvbid0IHdh
bnQgdG8gZGl2ZXJnZQo+PiB0b28gbXVjaCBvZiBhdG9taWNzIGZyb20gTGludXguCj4gCj4gU28s
IGhhdmluZyByZWFjaGVkIGFncmVlbWVudCB0byB1c2UgcGxhaW4gaW50LCB3b3VsZCB5b3UgYmUg
d2lsbGluZwo+IHRvIGdpdmUgeW91ciBhY2sgcHJvdmlkZWQgdGhlIGFkanVzdG1lbnRzIGdldCBt
YWRlIHdoaWxlIGNvbW1pdHRpbmcsCj4gdG8gc2F2ZSBhbm90aGVyIHJvdW5kIHRyaXA/CgpZZXMs
IHRoZSBpbXBsZW1lbnRhdGlvbiBvZiB0aGUgYXRvbWljIGZvciBhcm0gbG9va2VkIGNvcnJlY3Q6
CgpSZXZpZXdlZC1ieTogSnVsaWVuIEdyYWxsIDxqdWxpZW5AeGVuLm9yZz4KCkNoZWVycywKCi0t
IApKdWxpZW4gR3JhbGwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qu
b3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2
ZWw=
