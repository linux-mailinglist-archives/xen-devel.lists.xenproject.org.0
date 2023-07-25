Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E6B31760D60
	for <lists+xen-devel@lfdr.de>; Tue, 25 Jul 2023 10:44:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.569543.890379 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qODe7-0002Mf-LU; Tue, 25 Jul 2023 08:43:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 569543.890379; Tue, 25 Jul 2023 08:43:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qODe7-0002Jf-IV; Tue, 25 Jul 2023 08:43:55 +0000
Received: by outflank-mailman (input) for mailman id 569543;
 Tue, 25 Jul 2023 08:43:54 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=BzC/=DL=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1qODe6-0002JX-0P
 for xen-devel@lists.xenproject.org; Tue, 25 Jul 2023 08:43:54 +0000
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com
 [2a00:1450:4864:20::22c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 624e52a0-2ac7-11ee-b23d-6b7b168915f2;
 Tue, 25 Jul 2023 10:43:53 +0200 (CEST)
Received: by mail-lj1-x22c.google.com with SMTP id
 38308e7fff4ca-2b9338e4695so77079871fa.2
 for <xen-devel@lists.xenproject.org>; Tue, 25 Jul 2023 01:43:53 -0700 (PDT)
Received: from [192.168.202.116] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 h8-20020a2e9ec8000000b002b6efce3f54sm3374404ljk.123.2023.07.25.01.43.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Jul 2023 01:43:52 -0700 (PDT)
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
X-Inumbo-ID: 624e52a0-2ac7-11ee-b23d-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1690274633; x=1690879433;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=aHaat45Ng8OamlXU6VLPk832wooGU9Zg94nTarMt7F4=;
        b=smMrtBiq7wTuyIdetfmdRsBqAeMTLnzj2hCg7Af1rMuc9sv+ql+nQNRLDUqgMaiVGm
         P5Jp30Rx0vpTEtWy9+6hFQo3Vl+MT+AIfCWdtnEteflo9VZkyndcL3lga5Mh2uChd9/P
         B/EB16+K5nWEQcpbHM08m5ZW+PoPgKUD6lTsUhLcrEgTvNKshhtjjHdlbHjvC68XAYTU
         75G3I5JZjJiUKZZtH5mdc8+ilFZ+PzRvAFubahSEKGXkjTMVMh+mzlcQFGdZANrJ3RV5
         JaELGiYfGcba4k6bEAHJ1bVY9j00G3dwtcl+88KPxqt+CClUH/eI5YPbPiSYs4bHFBhH
         QduA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690274633; x=1690879433;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=aHaat45Ng8OamlXU6VLPk832wooGU9Zg94nTarMt7F4=;
        b=OpgXWTFfiRAHsUwYqJFzlNP2ypt8fKPg5JyizAQFZ4imZ+4okv7889ZrRlS//RqJKa
         B6L+Et/8fIFJNG6uJoNmU+zlL//gd5pBrNzn1euCZiIZnoH9zy/jaAsi/SK9ODqYV2Lq
         BctneC0na/G9euUbUDnDtyvfcuLtTufCuD8dxrFCEwxWKsy1RP3mCSFw1nmYU5u5eLV4
         mJLsIyn9ztWYMhSMnO+8sOGpXCq8fsMtltQMY0l8cVoYalKOCdjcv4NgkDZb5Voj+xSf
         XDvdZ7ceKwyR8Gkbaoihjv4Slf+bqKkRd2IuWtckZ5DjTC2IcZYLvEp3LS+ZdKYTgcjq
         AXjg==
X-Gm-Message-State: ABy/qLb16U4DmZmlQCGe0SFPWWgZZVlUYgHrgjcRrBUA5dkQ1qniKBMM
	IB/FQ6ohI7kfXodTmkRS9Hk=
X-Google-Smtp-Source: APBJJlG7S/zg7foFO7C/BxkZfvTtGJ199qtuAP7Y0bCvZmpd9ybMdLvMds1s3uqsv1jsoFTElSN4hw==
X-Received: by 2002:a2e:92d0:0:b0:2b4:7c31:ab8a with SMTP id k16-20020a2e92d0000000b002b47c31ab8amr6991443ljh.23.1690274632451;
        Tue, 25 Jul 2023 01:43:52 -0700 (PDT)
Message-ID: <43701a3fcebf4ddc66defef9a6d5bacd6df876bb.camel@gmail.com>
Subject: Re: [PATCH v3] ns16550: add support for polling mode when device
 tree is used
From: Oleksii <oleksii.kurochko@gmail.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap
 <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
Date: Tue, 25 Jul 2023 11:43:51 +0300
In-Reply-To: <004fa0af-105b-63eb-2abc-53b0cbcfaef7@suse.com>
References: 
	<d929b43814e6e1a247b954c4be40a35d61b6a45a.1690208840.git.oleksii.kurochko@gmail.com>
	 <be0c9eb8-6561-f6bc-ff76-a1bfeaeaab9d@suse.com>
	 <ab9e7a3f3b5faa4805b5b2c8ffc985bc3330c4a3.camel@gmail.com>
	 <004fa0af-105b-63eb-2abc-53b0cbcfaef7@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
User-Agent: Evolution 3.48.4 (3.48.4-1.fc38) 
MIME-Version: 1.0

T24gVHVlLCAyMDIzLTA3LTI1IGF0IDEwOjE4ICswMjAwLCBKYW4gQmV1bGljaCB3cm90ZToKPiBP
biAyNS4wNy4yMDIzIDEwOjE1LCBPbGVrc2lpIHdyb3RlOgo+ID4gT24gTW9uLCAyMDIzLTA3LTI0
IGF0IDE2OjQzICswMjAwLCBKYW4gQmV1bGljaCB3cm90ZToKPiA+ID4gT24gMjQuMDcuMjAyMyAx
NjoyNywgT2xla3NpaSBLdXJvY2hrbyB3cm90ZToKPiA+ID4gPiBAQCAtMTMzMCw5ICsxMzQxLDEy
IEBAIHBjaV91YXJ0X2NvbmZpZyhzdHJ1Y3QgbnMxNjU1MCAqdWFydCwKPiA+ID4gPiBib29sX3QK
PiA+ID4gPiBza2lwX2FtdCwgdW5zaWduZWQgaW50IGlkeCkKPiA+ID4gPiDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgICogYXMgc3BlY2lhbCBvbmx5IGZvciBYODYuCj4gPiA+ID4g
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAqLwo+ID4gPiA+IMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgIGlmICggdWFydC0+aXJxID09IDB4ZmYgKQo+ID4gPiA+ICvC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgewo+ID4gPiA+IMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgdWFydC0+aXJxID0gMDsKPiA+ID4gPiArwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgdWFydC0+aW50cl93b3JrcyA9IHBvbGxpbmc7
Cj4gPiA+ID4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB9Cj4gPiA+ID4gwqAjZW5k
aWYKPiA+ID4gPiAtwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGlmICggIXVhcnQtPmly
cSApCj4gPiA+ID4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBpZiAoICF1YXJ0LT5p
cnEgfHwgKHVhcnQtPmludHJfd29ya3MgPT0KPiA+ID4gPiBwb2xsaW5nKSApCj4gPiA+ID4gwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBwcmludGsoWEVOTE9HX0lORk8K
PiA+ID4gPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqAgIm5zMTY1NTA6ICVwcDogbm8gbGVnYWN5IElSUSwgdXNpbmcKPiA+ID4gPiBwb2xsIG1v
ZGVcbiIsCj4gPiA+ID4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgICZQQ0lfU0JERigwLCBiLCBkLCBmKSk7Cj4gPiA+IAo+ID4gPiBNZXNzYWdl
IGFuZCBjb2RlIChhZnRlciB5b3VyIGFkZGl0aW9uKSBjb250aW51ZSB0byBiZSBvdXQgb2YKPiA+
ID4gc3luYy4KPiA+ID4gQXMgc2FpZCBiZWZvcmUsIGFueSBjb25kaXRpb24gdGhhdCBsZWFkcyB0
byBwb2xsaW5nIG1vZGUgd2FudHMgdG8KPiA+ID4gZmluZCBpdHNlbGYgZXhwcmVzc2VkIGJ5IHVh
cnQtPmludHJfd29ya3Mgc2V0IHRvICJwb2xsaW5nIi4KPiA+IFdlbGwuIEl0IGxvb2tzIGxpa2Ug
aXQgd291bGQgYmUgYmV0dGVyIHRvIHNldCAndWFydC0+aW50cl93b3JrcyA9Cj4gPiBwb2xsaW5n
JyBpbnNpZGUgaWYgKCAhdWFydC0+aXJxICk6Cj4gPiDCoCBpZiAoICF1YXJ0LT5pcnEgfHwgKHVh
cnQtPmludHJfd29ya3MgPT0gcG9sbGluZykgKQo+ID4gwqAgewo+ID4gwqDCoMKgwqDCoCB1YXJ0
LT5pbnRyX3dvcmtzID0gcG9sbGluZzsKPiA+IMKgwqDCoMKgwqAgcHJpbnRrKFhFTkxPR19JTkZP
Cj4gPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgIm5zMTY1NTA6ICVwcDogdXNpbmcgcG9sbCBt
b2RlXG4iLAo+ID4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgICZQQ0lfU0JERigwLCBiLCBkLCBm
KSk7Cj4gPiDCoCB9Cj4gPiBUaGVuICJ1YXJ0LT5pbnRyX3dvcmtzID0gcG9sbGluZzsiIGNhbiBi
ZSByZW1vdmVkIGZyb20gImlmICggdWFydC0KPiA+ID5pcnEKPiA+ID09IDB4ZmYgKSIgYXMgaW4g
dGhhdCBjYXNlICd1YXJ0LT5pcnEgPSAwJyBtZWFucyBwb2xsaW5nIG1vZGUgZm9yCj4gPiBYODYu
Cj4gCj4gSSdtIG5vdCBmdWxseSBjb252aW5jZWQuIENhcmUgbmVlZHMgdG8gYmUgdGFrZW4gdGhh
dCBib3RoIHRoZSB4ODYKPiBjYXNlCj4gYW5kIHRoZSBnZW5lcmFsIGNhc2UgY29udGludWUgdG8g
ZnVuY3Rpb24gYXMgdGhleSBkaWQgKHVubGVzcyBwcm92ZW4KPiB0bwo+IGJlIGJ1Z2d5KS4KQnV0
IGl0IGNvbnRpbnVlcyB0byB3b3JrIGFzIGl0IHdvcmtlZCBiZWZvcmUgKCB3aGVuIHVhcnQtPmlu
dHJfd29ya3MgIT0KcG9sbGluZyApIG90aGVyd2lzZSwgaWYgdWFydC0+aW50cl93b3JrcyA9IHBv
bGxpbmcsIHRoZW4gcG9sbGluZyBtb2RlCmlzIGZvcmNlZC4KClRoZSBvbmx5IHRoaW5nIHRoYXQg
SSB3b3VsZCBwcm9iYWJseSBhZGQgaXQgaXMgdG8gZm9yY2UgcG9sbGluZyBtb2RlIGluCmNhc2Ug
b2YgWDg2IHdoZW4gcG9sbGluZyBtb2RlIGlzIGZvcmNlZCBieSBjb21tYW5kIGxpbmU6CiAgICBp
ZiAoICggdWFydC0+aXJxID09IDB4ZmYgKSB8fCAodWFydC0+aW50cl93b3JrcyA9PSBwb2xsaW5n
KSApCiAgICB7CiAgICAgICAgdWFydC0+aXJxID0gMDsKICAgICAgICB1YXJ0LT5pbnRyX3dvcmtz
ID0gcG9sbGluZzsKICAgIH0KQnV0IHRoaXMgY2hlY2sgbG9va3MgYSBsaXR0bGUgYml0IHVubmVj
ZXNzYXJ5IGJlY2F1c2UgaWYgdGhlIHBvbGxpbmcKbW9kZSBpcyBmb3JjZWQgb3Igbm90IHdpbGwg
YmUgY2hlY2tlZCBsYXRlciBpbiB0aGUgbmV4dCBpZiBjb25kaXRpb24uCgp+IE9sZWtzaWkK


