Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 534F5180C40
	for <lists+xen-devel@lfdr.de>; Wed, 11 Mar 2020 00:22:06 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jBo9Q-0004Q2-JZ; Tue, 10 Mar 2020 23:19:04 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=ihMg=43=redhat.com=mcroce@srs-us1.protection.inumbo.net>)
 id 1jBo9P-0004Px-Dw
 for xen-devel@lists.xenproject.org; Tue, 10 Mar 2020 23:19:03 +0000
X-Inumbo-ID: 878a05d8-6325-11ea-b34e-bc764e2007e4
Received: from us-smtp-delivery-1.mimecast.com (unknown [205.139.110.120])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTP
 id 878a05d8-6325-11ea-b34e-bc764e2007e4;
 Tue, 10 Mar 2020 23:19:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1583882342;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=SsEVgIb0FHCXJVxaEJkcHFE2l9+mdWsKDxZwEgCv+7g=;
 b=bNz9MuzGtI/DcubHgqE6LXtKPk+Kv/gCHI4kDvZ9hhPDMonMcDwNCvCXWnp+HHKM94ry+k
 Vve4y74cSHS4h7tuGlgy/ARfNoQjKwgUjMMo1kmQfc74essc2efgz+T/ud2UEwx8UU9DjA
 Nu0UkbZuDpy7XIZ1rdhQPjxPQvlJJt4=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-460-QnmOrZJbMGaK8kLChWkuSw-1; Tue, 10 Mar 2020 19:18:58 -0400
X-MC-Unique: QnmOrZJbMGaK8kLChWkuSw-1
Received: by mail-ed1-f70.google.com with SMTP id x1so180843edv.14
 for <xen-devel@lists.xenproject.org>; Tue, 10 Mar 2020 16:18:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=z5sLqw2q00TFWFE2+/xEamSW6/qGE1IWWYINTtiDzeQ=;
 b=Lzg+ThpfLjpHbEyTP0WaHLQvoaTtlO6ZK8ghPXbSYG7fnUNAy1QNG5+VMswFXTd3wR
 rGfq5kHNHMwVG7U7pOwMcUDK6CWlftWG7bu5C+dZOtOU16vqcnaenf0D+/fBrSb+fxdf
 u2mmFygedBHmawJHtABVWwWFiPxLR0yIJKHTCSFBqGxLzgR9lc83vMb0uQeNF/oEK5yF
 ISHqeYjIBIWVSsufQk4KxYJOvl7bVDS/irvZBDtYY2Yh+A80700iynUS1TzordSIsXbH
 VpCJn6JmCqGiWQnzrRndK0FY5TgJc3X58PsuB7Frkg3noyhm8YtMwDPzfdk+9WEpfuci
 4zHw==
X-Gm-Message-State: ANhLgQ3deZ82ZO+c49qz+TO07dStaWvhzlcEoWDbC4jeqo0NTSsNEqlS
 LsupfEAxueVUFVaaM14bwuksB11fyn6FhIxiR6zA2/orDCyUx2IYV9fLFZM8F0WDrxikhKgkY/U
 R3BdJVK5uvl4ArbW4t4VECdUvxQ3m8oGpuOQufQbls0M=
X-Received: by 2002:a17:907:262a:: with SMTP id
 aq10mr12415670ejc.377.1583882337423; 
 Tue, 10 Mar 2020 16:18:57 -0700 (PDT)
X-Google-Smtp-Source: ADFU+vstjHqiZOF0xElis+31S7G0gY2aH73JLw/AluJvKeWmdJcJyHfoWoeERc+w0Ht0pyWZgseKXsqtbLAkFkQLxyM=
X-Received: by 2002:a17:907:262a:: with SMTP id
 aq10mr12415648ejc.377.1583882337100; 
 Tue, 10 Mar 2020 16:18:57 -0700 (PDT)
MIME-Version: 1.0
References: <20200310223516.102758-1-mcroce@redhat.com>
 <d473061b-688f-f4a6-c0e8-61c22b8a2b10@cloud.ionos.com>
In-Reply-To: <d473061b-688f-f4a6-c0e8-61c22b8a2b10@cloud.ionos.com>
From: Matteo Croce <mcroce@redhat.com>
Date: Wed, 11 Mar 2020 00:18:21 +0100
Message-ID: <CAGnkfhwjXN_T09MsD1e6P95gUqxCbWL7BcOLSy16_QOZsZKbgQ@mail.gmail.com>
To: Guoqing Jiang <guoqing.jiang@cloud.ionos.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Subject: Re: [Xen-devel] [PATCH v2] block: refactor duplicated macros
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
Cc: Jens Axboe <axboe@kernel.dk>, linux-raid <linux-raid@vger.kernel.org>,
 linux-nfs@vger.kernel.org, linux-scsi <linux-scsi@vger.kernel.org>,
 linux-nvdimm <linux-nvdimm@lists.01.org>,
 "James E.J. Bottomley" <jejb@linux.ibm.com>, linux-mmc@vger.kernel.org,
 LKML <linux-kernel@vger.kernel.org>, linux-block@vger.kernel.org,
 Song Liu <song@kernel.org>, linux-bcache@vger.kernel.org,
 xen-devel <xen-devel@lists.xenproject.org>,
 Ulf Hansson <ulf.hansson@linaro.org>,
 Anna Schumaker <anna.schumaker@netapp.com>,
 Dan Williams <dan.j.williams@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gV2VkLCBNYXIgMTEsIDIwMjAgYXQgMTI6MTAgQU0gR3VvcWluZyBKaWFuZwo8Z3VvcWluZy5q
aWFuZ0BjbG91ZC5pb25vcy5jb20+IHdyb3RlOgo+Cj4KPgo+IE9uIDMvMTAvMjAgMTE6MzUgUE0s
IE1hdHRlbyBDcm9jZSB3cm90ZToKPiA+ICsrKyBiL2RyaXZlcnMvbWQvcmFpZDEuYwo+ID4gQEAg
LTIxMjksNyArMjEyOSw3IEBAIHN0YXRpYyB2b2lkIHByb2Nlc3NfY2hlY2tzKHN0cnVjdCByMWJp
byAqcjFfYmlvKQo+ID4gICAgICAgaW50IHZjbnQ7Cj4gPgo+ID4gICAgICAgLyogRml4IHZhcmlh
YmxlIHBhcnRzIG9mIGFsbCBiaW9zICovCj4gPiAtICAgICB2Y250ID0gKHIxX2Jpby0+c2VjdG9y
cyArIFBBR0VfU0laRSAvIDUxMiAtIDEpID4+IChQQUdFX1NISUZUIC0gOSk7Cj4gPiArICAgICB2
Y250ID0gKHIxX2Jpby0+c2VjdG9ycyArIFBBR0VfU0VDVE9SUyAtIDEpID4+IChQQUdFX1NISUZU
IC0gOSk7Cj4KPiBNYXliZSByZXBsYWNlICJQQUdFX1NISUZUIC0gOSIgd2l0aCAiUEFHRV9TRUNU
T1JTX1NISUZUIiB0b28uCj4KPiBUaGFua3MsCj4gR3VvcWluZwo+CgpXb3csIHRoZXJlIGFyZSBh
IGxvdCBvZiB0aGVtIQoKJCBnaXQgZ3JlcCAtYyAnUEFHRV9TSElGVCAtIDknCmFyY2gvaWE2NC9p
bmNsdWRlL2FzbS9wZ3RhYmxlLmg6MgpibG9jay9ibGstc2V0dGluZ3MuYzoyCmJsb2NrL3BhcnRp
dGlvbi1nZW5lcmljLmM6MQpkcml2ZXJzL21kL2RtLXRhYmxlLmM6MQpkcml2ZXJzL21kL3JhaWQx
LmM6MQpkcml2ZXJzL21kL3JhaWQxMC5jOjEKZHJpdmVycy9tZC9yYWlkNS1jYWNoZS5jOjUKZHJp
dmVycy9tZC9yYWlkNS5oOjEKZHJpdmVycy9udm1lL2hvc3QvZmMuYzoxCmRyaXZlcnMvbnZtZS90
YXJnZXQvbG9vcC5jOjEKZnMvZXJvZnMvaW50ZXJuYWwuaDoxCmZzL2V4dDIvZGlyLmM6MQpmcy9s
aWJmcy5jOjEKZnMvbmlsZnMyL2Rpci5jOjEKbW0vcGFnZV9pby5jOjIKbW0vc3dhcGZpbGUuYzo2
CgotLSAKTWF0dGVvIENyb2NlCnBlciBhc3BlcmEgYWQgdXBzdHJlYW0KCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0
Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qu
b3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
