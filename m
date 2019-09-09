Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C35DADB5E
	for <lists+xen-devel@lfdr.de>; Mon,  9 Sep 2019 16:43:44 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i7KrS-0003C6-Ku; Mon, 09 Sep 2019 14:41:46 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=MMG2=XE=gmail.com=olekstysh@srs-us1.protection.inumbo.net>)
 id 1i7KrR-0003By-4k
 for xen-devel@lists.xenproject.org; Mon, 09 Sep 2019 14:41:45 +0000
X-Inumbo-ID: f0dcf064-d30f-11e9-978d-bc764e2007e4
Received: from mail-lf1-x142.google.com (unknown [2a00:1450:4864:20::142])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id f0dcf064-d30f-11e9-978d-bc764e2007e4;
 Mon, 09 Sep 2019 14:41:43 +0000 (UTC)
Received: by mail-lf1-x142.google.com with SMTP id w6so10735130lfl.2
 for <xen-devel@lists.xenproject.org>; Mon, 09 Sep 2019 07:41:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=ZEP7IYiCd9E4kAARxdNvtaGCENZE8YNNbcbiub753DM=;
 b=b+dJsFEI+G+p3p+NQ0YvctNLwsYeklmDyPdh/wUo8FppXJ1K3Ek9Benw5bdoiVZ7av
 ng4AdS7Oy3ckt4tW+hW8UPYosEcNh7DL18fXlIHr/+OhpWhukNtKPPXlI9onD55rPpL5
 ivB3hINtLvj/pXgtHbPrkK4VjqBIeJfqVgZG7jExc/GZqYDEPeFvDt2Krei8zDCvrE6D
 /ntTe5O0a0lFr6W+v8Am71Z/C/YdFQ37aIrJSNQvjpFfMf2jTNfWKsxjXAj2k3rqtfVt
 m2nohVreFqSxBSF/Se013EFWPYiCt3PCIwjsrc5Y5LiRC1n7G/tuX7Pd2WDYEA3QUS7x
 ggrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=ZEP7IYiCd9E4kAARxdNvtaGCENZE8YNNbcbiub753DM=;
 b=N5O0wGGPbtf6SSJ+fqx66wm6Xbeqvrc+n5oa32GwTv167swEs0u6wSpTlcC7Tk8W7X
 wloum9q5j6m8611T4d13KqjUow8V9Y0N03jqbKdAXDKJrqCu3mbtgEhxCCflotwrojHW
 lfNrf7pi80vDDzxHBz5sNIHcGluskHmS/OHHo/W2KkpXdjL4qSdRcbz50MFuOEjU4kgF
 Udo1STG2z9kqqsfWBZSqIH9ISQ0fXDlYciRVdsCez9c54AlssGakTGIR3E4oJ2rKMhFE
 D0byJ/1SH6U9os9LfIbPy+V+5p3z6qHves3DV1F23vv+aasUZs4/mDJnxnnWcJtJC/ll
 Y3Wg==
X-Gm-Message-State: APjAAAWVjKtLz0ECYbxoyX4wJ7HK9Wgn+n0bZzaCF5InmeN1xQDIWQQR
 TqL2uF4jWLuNwYINZ3vGGsU=
X-Google-Smtp-Source: APXvYqwYkQ6TQ+zjia3pACE+3Dg+YrYfgHTbxPZDaGvl3e/joevDgcZHuNB/RPNuFYsseK0F7JaGWQ==
X-Received: by 2002:a19:2c1:: with SMTP id 184mr16751459lfc.100.1568040102624; 
 Mon, 09 Sep 2019 07:41:42 -0700 (PDT)
Received: from [10.17.182.120] (ll-74.141.223.85.sovam.net.ua. [85.223.141.74])
 by smtp.gmail.com with ESMTPSA id q10sm3366515lfm.11.2019.09.09.07.41.41
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 09 Sep 2019 07:41:42 -0700 (PDT)
To: Julien Grall <julien.grall@arm.com>, xen-devel@lists.xenproject.org
References: <1566324587-3442-1-git-send-email-olekstysh@gmail.com>
 <1566324587-3442-6-git-send-email-olekstysh@gmail.com>
 <b1c70055-51a1-51fd-9c9f-4e545d1faed2@arm.com>
From: Oleksandr <olekstysh@gmail.com>
Message-ID: <9ea87cee-fcb3-e6b4-2666-2be6df31508c@gmail.com>
Date: Mon, 9 Sep 2019 17:41:41 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <b1c70055-51a1-51fd-9c9f-4e545d1faed2@arm.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH V3 5/8] iommu/arm: Add lightweight
 iommu_fwspec support
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
Cc: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 sstabellini@kernel.org, Volodymyr_Babchuk@epam.com
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Ck9uIDA5LjA5LjE5IDE3OjM2LCBKdWxpZW4gR3JhbGwgd3JvdGU6Cj4gSGkgT2xla3NhbmRyLAoK
SGksIEp1bGllbgoKCj4KPiBPbiA4LzIwLzE5IDc6MDkgUE0sIE9sZWtzYW5kciBUeXNoY2hlbmtv
IHdyb3RlOgo+PiBGcm9tOiBPbGVrc2FuZHIgVHlzaGNoZW5rbyA8b2xla3NhbmRyX3R5c2hjaGVu
a29AZXBhbS5jb20+Cj4+Cj4+IFdlIG5lZWQgdG8gaGF2ZSBzb21lIGFic3RyYWN0IHdheSB0byBh
ZGQgbmV3IGRldmljZSB0byB0aGUgSU9NTVUKPj4gYmFzZWQgb24gdGhlIGdlbmVyaWMgSU9NTVUg
RFQgYmluZGluZ3MgWzFdIHdoaWNoIGNhbiBiZSB1c2VkIGZvcgo+PiBib3RoIERUIChyaWdodCBu
b3cpIGFuZCBBQ1BJIChpbiBmdXR1cmUpLgo+Pgo+PiBGb3IgdGhhdCByZWFzb24gd2UgY2FuIGJv
cnJvdyB0aGUgaWRlYSB1c2VkIGluIExpbnV4IHRoZXNlIGRheXMKPj4gY2FsbGVkICJpb21tdV9m
d3NwZWMiLiBIYXZpbmcgdGhpcyBpbiwgaXQgd2lsbCBiZSBwb3NzaWJsZQo+PiB0byBjb25maWd1
cmUgSU9NTVUgbWFzdGVyIGludGVyZmFjZXMgb2YgdGhlIGRldmljZSAoZGV2aWNlIElEcykKPj4g
ZnJvbSBhIHNpbmdsZSBjb21tb24gcGxhY2UgYW5kIGF2b2lkIGtlZXBpbmcgYWxtb3N0IGlkZW50
aWNhbCBsb29rLXVwCj4+IGltcGxlbWVudGF0aW9ucyBpbiBlYWNoIElPTU1VIGRyaXZlci4KPj4K
Pj4gVGhlcmUgaXMgbm8gbmVlZCB0byBwb3J0IHRoZSB3aG9sZSBpbXBsZW1lbnRhdGlvbiBvZiAi
aW9tbXVfZndzcGVjIgo+PiB0byBYZW4sIHdlIGNvdWxkLCBwcm9iYWJseSwgZW5kIHVwIHdpdGgg
YSBtdWNoIHNpbXBsZXIgc29sdXRpb24sCj4+IHNvbWUgInN0cmlwcGVkIGRvd24iIHZlcnNpb24g
d2hpY2ggZml0cyBvdXIgcmVxdWlyZW1lbnRzLgo+Pgo+PiBTbywgdGhpcyBwYXRjaCBhZGRzIHRo
ZSBmb2xsb3dpbmc6Cj4+IDEuIEEgY29tbW9uIHN0cnVjdHVyZSAiaW9tbXVfZndzcGVjIiB0byBo
b2xkIHRoZSB0aGUgcGVyLWRldmljZQo+PiDCoMKgwqAgZmlybXdhcmUgZGF0YQo+PiAyLiBOZXcg
bWVtYmVyICJpb21tdV9md3NwZWMiIG9mIHN0cnVjdCBkZXZpY2UKPj4gMy4gRnVuY3Rpb25zL2hl
bHBlcnMgdG8gZGVhbCB3aXRoICJkZXYtPmlvbW11X2Z3c3BlYyIKPj4KPj4gSXQgc2hvdWxkIGJl
IG5vdGVkIHRoYXQgaW4gY29tcGFyaW5nIHdpdGggb3JpZ2luYWwgImlvbW11X2Z3c3BlYyIKPgo+
IHMvY29tcGFyaW5nIHdpdGgvY29tcGFyaXNvbiBvZi8KPiBzL29yaWdpbmFsL3RoZSBMaW51eC8g
b3IgInRoZSBvcmlnaW5hbCIuCgpvawoKCj4KPj4gWGVuJ3MgdmFyaWFudCBkb2Vzbid0IGNvbnRh
aW4gc29tZSBmaWVsZHMsIHdoaWNoIGFyZSBub3QgcmVhbGx5Cj4+IG5lZWRlZCBhdCB0aGUgbW9t
ZW50IChvcHMsIGZsYWcpIGFuZCAiaW9tbXVfZndub2RlIiBmaWVsZCB3YXMgcmVwbGFjZWQKPj4g
YnkgImlvbW11X2RldiIgdG8gYXZvaWQgcG9ydGluZyBhIGxvdCBvZiBjb2RlICh0byBzdXBwb3J0
IAo+PiAiZndub2RlX2hhbmRsZSIpCj4+IHdpdGggbGl0dGxlIGJlbmVmaXQuCj4KPgo+IEl0IHdv
dWxkIGJlIGdvb2QgdG8gbWVudGlvbiB3aGljaCB2ZXJzaW9uIG9mIExpbnV4IHRoaXMgaXMgYmFz
ZWQgb24uIAo+IFNvIGlmIHRoZXJlIGlzIGEgY3JpdGljYWwgYnVnIGluIExpbnV4IHdlIGNhbiBw
b3J0IGl0LgoKSXQgd2FzIGJhc2VkIG9uIGN1cnJlbnQgTGludXggbWFzdGVyLiBJIHdpbGwgbWVu
dGlvbiBleGFjdCB2ZXJzaW9uLgoKCi0tIApSZWdhcmRzLAoKT2xla3NhbmRyIFR5c2hjaGVua28K
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2
ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xp
c3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
