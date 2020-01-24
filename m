Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AD5FA148EBD
	for <lists+xen-devel@lfdr.de>; Fri, 24 Jan 2020 20:36:00 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iv4h2-000206-RX; Fri, 24 Jan 2020 19:32:36 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=266H=3N=gmail.com=rosbrookn@srs-us1.protection.inumbo.net>)
 id 1iv4h1-000201-9p
 for xen-devel@lists.xenproject.org; Fri, 24 Jan 2020 19:32:35 +0000
X-Inumbo-ID: 44da22fe-3ee0-11ea-9fd7-bc764e2007e4
Received: from mail-lf1-x143.google.com (unknown [2a00:1450:4864:20::143])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 44da22fe-3ee0-11ea-9fd7-bc764e2007e4;
 Fri, 24 Jan 2020 19:32:34 +0000 (UTC)
Received: by mail-lf1-x143.google.com with SMTP id z26so1894872lfg.13
 for <xen-devel@lists.xenproject.org>; Fri, 24 Jan 2020 11:32:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=c5++biUjo2FQfGzG/19AT204gPu5Asvu4EA+DU+Kn0M=;
 b=ULRo1YBX7Xh6Hbn5PhYeeLst/D86IW1tmUIXSGhhTfmR3U+a5zYXa37IkeRrkivufB
 +XqCJkOpepX10XaSnSBWu4pMJpremL2IV6nFjLOo/0oZXFxpmkNpggnBm63JqRq0GpGW
 xP7I2r8PHradV2RoLIEbiFhTBHp3IKh6ZsSGb7aoDf5lY1oKwfW7wBVuIOZ2AsnKPBUb
 8fXSmiG4ri3TTJIxOBe/xbDHrMZDZVJKucZ1uiv7XdEeKTsjazl1S0+nuX2juDf5DNFK
 4Hcjz4GDcpFxzGIo3wTUuE2kld1FTfcAGGoh9u4NZNHkXFvDWkGxA+FgUHZO7VqlKqLI
 KdZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=c5++biUjo2FQfGzG/19AT204gPu5Asvu4EA+DU+Kn0M=;
 b=VDDGFOHTvEsts1OD2nb0CAL5yIKyhCV0OP+B5flWB7E0LgsOkGZGI2R3nTdC0ihy4L
 zOtxXim27M3I10ZGnSAXnI1ZHlCdOPN2oY9brrYdk5sxdHsAFd3ovGRTAEpYtmsjbGLr
 yagofIIRzqxrzt8RQPhDLeFR+/IQX1+ELeZIT2KYTNFF7IeK0BT0uIKqFt8iWC1xQmxx
 NtGJ1pBg61Ob228NlU6D/56U+JJtW/TKB89Sh77P5TWzuA8UQAgL5WevKuJPLTEf6KRZ
 NrfByf6jMTYUGBXWnqBa066m7j43IW/sKo8A3nGhwKayHEpq3Z8oflVMN+3pjv9FOdwO
 6DSA==
X-Gm-Message-State: APjAAAX6Ti8U/aK0yho1XKSH24YIMeGK2zc9iwzbVzu4iOYYb/ej4f18
 ztTMC3I2QOnnqiqJVOD6bLVNOisobn+lN2FwSkE=
X-Google-Smtp-Source: APXvYqwAiEKI94GyAa1mhM28sZF14Phm0vKKTjWOXMwKRbYRcT1aTBWJdfKx9JW9o+D27TceaP6UVBA3dmgJUVKFJg8=
X-Received: by 2002:ac2:5e72:: with SMTP id a18mr2112366lfr.9.1579894353198;
 Fri, 24 Jan 2020 11:32:33 -0800 (PST)
MIME-Version: 1.0
References: <20200117155734.1067550-1-george.dunlap@citrix.com>
 <20200117155734.1067550-8-george.dunlap@citrix.com>
In-Reply-To: <20200117155734.1067550-8-george.dunlap@citrix.com>
From: Nick Rosbrook <rosbrookn@gmail.com>
Date: Fri, 24 Jan 2020 14:32:21 -0500
Message-ID: <CAEBZRSc_+G6itzyNGMd7GO5eC6aOZ3zE7vopQmTiQ5CnG+6VYw@mail.gmail.com>
To: George Dunlap <george.dunlap@citrix.com>
Subject: Re: [Xen-devel] [PATCH v3 8/8] RFC: Sketch constructors,
 DomainCreateNew
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
Cc: Nick Rosbrook <rosbrookn@ainfosec.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

U29ycnkgZm9yIHRoZSBsYXRlIHJlcGx5IG9uIHRoaXMgb25lLgoKPiArZnVuYyBOZXdEb21haW5D
b25maWcodCBEb21haW5UeXBlKSAoKkRvbWFpbkNvbmZpZywgZXJyb3IpIHsKPiArICAgICAgIHZh
ciBjY29uZmlnIEMubGlieGxfZG9tYWluX2NvbmZpZwo+ICsKPiArICAgICAgIEMubGlieGxfZG9t
YWluX2NvbmZpZ19pbml0KCZjY29uZmlnKQo+ICsgICAgICAgQy5saWJ4bF9kb21haW5fYnVpbGRf
aW5mb19pbml0X3R5cGUoJmNjb25maWcuYl9pbmZvLCBDLmxpYnhsX2RvbWFpbl90eXBlKHQpKQo+
ICsKPiArICAgICAgIGdjb25maWcgOj0gJkRvbWFpbkNvbmZpZ3t9Cj4gKyAgICAgICBlcnIgOj0g
Z2NvbmZpZy5mcm9tQygmY2NvbmZpZykKPiArICAgICAgIGlmIGVyciAhPSBuaWwgewo+ICsgICAg
ICAgICAgICAgICByZXR1cm4gbmlsLCBlcnIKPiArICAgICAgIH0KPiArCj4gKyAgICAgICByZXR1
cm4gZ2NvbmZpZywgbmlsCj4gK30KCkkgdGhpbmsgdGhpcyBpcyBzdWZmaWNpZW50IGZvciB0aGUg
Ik5ldyIgZnVuY3Rpb25zOyBzaW1wbGUgaXMgcHJvYmFibHkKYmV0dGVyIGhlcmUuIEkgYXBwcmVj
aWF0ZSB0aGUgaWRlYSBvZiB0aGUgYHBvcHVsYXRlIGZ1bmNgIGFwcHJvYWNoIHlvdQptZW50aW9u
ZWQgaW4gYW5vdGhlciBlbWFpbCwgYnV0IEkgdGhpbmsgaW4gcHJhY3RpY2UgcGVvcGxlIHdpbGwg
d2FudAp0byBsZXZlcmFnZSBlbmNvZGluZy9qc29uIG9yIG90aGVyd2lzZSB0byB1bm1hcnNoYWwg
c29tZSBkYXRhIGludG8gYQpEb21haW5Db25maWcgZXRjLiBPciwgd2Ugd291bGQgaG9wZWZ1bGx5
IGJlIGFibGUgdG8gdW5tYXJzaGFsIGFuCnhsLmNmZy4gQWxsIHRoYXQgaXMgdG8gc2F5LCBJIHRo
aW5rIHRoZSBhcHByb2FjaCB5b3UgaGF2ZSBzaG93biBoZXJlCmdpdmVzIHVzIGFuZCBwYWNrYWdl
IHVzZXJzIHRoZSBtb3N0IGZsZXhpYmlsaXR5LgoKRG8geW91IGhhdmUgYW55IHRob3VnaHRzIG9u
IHN1cHBvcnRpbmcgdW5tYXJzaGFsaW5nIGpzb24sIHhsLmNmZywgZXRjLj8KCklmIHdlIHN0aWNr
IHdpdGggdGhpcyBvdXRsaW5lIGZvciBjb25zdHJ1Y3RvcnMsIHRoZXkgd2lsbCBiZSBlYXN5IHRv
CmdlbmVyYXRlLiBJJ20gaGFwcHkgdG8gd29yayBvbiB0aGF0LCB1bmxlc3MgeW91IHdlcmUgYWxy
ZWFkeSBwbGFubmluZwpvbiBpdC4KClRoYW5rcywKLU5SCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZl
bEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxt
YW4vbGlzdGluZm8veGVuLWRldmVs
