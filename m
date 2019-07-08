Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BDB8628B7
	for <lists+xen-devel@lfdr.de>; Mon,  8 Jul 2019 20:50:21 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hkYfn-00054q-Vi; Mon, 08 Jul 2019 18:47:35 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Un8F=VF=wdc.com=prvs=0852429f4=chaitanya.kulkarni@srs-us1.protection.inumbo.net>)
 id 1hkYfm-00054b-Km
 for xen-devel@lists.xenproject.org; Mon, 08 Jul 2019 18:47:34 +0000
X-Inumbo-ID: d8d4e5aa-a1b0-11e9-8980-bc764e045a96
Received: from esa3.hgst.iphmx.com (unknown [216.71.153.141])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id d8d4e5aa-a1b0-11e9-8980-bc764e045a96;
 Mon, 08 Jul 2019 18:47:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1562611654; x=1594147654;
 h=from:to:cc:subject:date:message-id:in-reply-to: references;
 bh=/pc9L2crAxHB7hq+ujlWtvkrNrky6qYpFgcsaAJbQKc=;
 b=Bqm87qlCyL2Ehz0kxOAWgxgFp2pN7X76BVbm70RgdYEQXfRiiByEi8xQ
 ZR1hiyubKVEkghaC/diTJw83/f/UTdZBu4d9S5zSUWynjbWZeCrYOqw+D
 WRGQt63z/Qks0DwGqpHnEaGFkGelpLliDi8BTqI46+TGVfBtyCTSxHOTO
 yVNrsQ9N/Tz4ZGL6LbWEAErO7z/UFVj5F7138wPa9TeDTprTRX5DxVOne
 JhPb3joJeR++B4KqQekodM2wB6MLZlEZXS1f88zmRN1eNpeGkL2t8uycg
 dZA4TSgbS8Dra8xY/JQ5Hgh4cFJDc+8Nf2WQo+/2oR+hcUkqRIdZQO9nv A==;
IronPort-SDR: M4YTdtCeevV5EVQ8JSFk1BW41CnfqZISY6utxO+ACiGTQKZB6MPGGkSt611NuDqC5tz7z7+Htn
 HZ91SNhGW/Q78W3etUMt5B6+eokUl7osufYY3n51iJOGapGyO+JEuxG2Q+rOFFt0+LcGUcBNde
 s+rITEIgHpdC9lIUdHntChbMQBMF6p8UdgvPAJdVyF1UXJfnpFUkt1gzI7+FRhGWR6OO1xvhqZ
 cHQdCpWfEOhCoosrQjiuOAyTANpn9XTLK+z73mF+lWB6fxNBxqZFgg+YT0dQyS0mNRKzxeMxZH
 tCk=
X-IronPort-AV: E=Sophos;i="5.63,466,1557158400"; d="scan'208";a="117296113"
Received: from h199-255-45-15.hgst.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 09 Jul 2019 02:47:34 +0800
IronPort-SDR: 6ETWBfH2N5AsdrFNNzy7z623JrLbMaV2O8ZnTu+em5k76Dfv9v50IRHdiw2SLA77ZRMWBZwYGA
 Rm45wBvpf80uiBbQKDMroSa4AuSlNQvZUwRnHjs3vgu9CsKrI3edzVZMXt/L1f1bc7yUAyQP72
 SLo7CIs1H2uPrRGH3f0Ez3byjKo2FYKSOtL2ur9jvxdiIrA8XW6Jtlc1QCF7TXg60dVqWcsXD3
 MeeCMFp+HQ9XxGwJVZAg2rNhrZP5dgc1ORD9fosJQtKlAlV05fmmEJAhh7kJRtdb+zC90XnZPK
 TfQ0B+MiBXTZx316XhRjtK3O
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep02.wdc.com with ESMTP; 08 Jul 2019 11:46:21 -0700
IronPort-SDR: jWdfh5Z5t7pjUC0B9fFgAyqOLuJnVq8Y8Vuwuw3p7a+MWysaGbZwoaQwzshB2rHxKcfqUwLipY
 XVsaf4oWX0EjvpBNWkaZZfPekQOryyganAT5TONr5hleW1fklSNaogTOGJf93qqApcdI8fz9mz
 KfZHtl2vopgSzLQ1sb5TTaY8qXUFTJ18FRvM4b3y9NCSYdEddF3MpV9glHcmCofAwi4dZkmIVC
 gaihu23gkcHfYLTnJNU0ZelUPMn6wHyW13Dx7Ze2Ij6N6zfOw7fSaRbNf+nH3JXFZwBS4Rrg8p
 HLQ=
Received: from cvenusqemu.hgst.com ([10.202.66.73])
 by uls-op-cesaip02.wdc.com with ESMTP; 08 Jul 2019 11:47:33 -0700
From: Chaitanya Kulkarni <chaitanya.kulkarni@wdc.com>
To: linux-block@vger.kernel.org
Date: Mon,  8 Jul 2019 11:47:05 -0700
Message-Id: <20190708184711.2984-4-chaitanya.kulkarni@wdc.com>
X-Mailer: git-send-email 2.17.0
In-Reply-To: <20190708184711.2984-1-chaitanya.kulkarni@wdc.com>
References: <20190708184711.2984-1-chaitanya.kulkarni@wdc.com>
Subject: [Xen-devel] [PATCH V4 3/9] blk-zoned: update blkdev_report_zone()
 with helper
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
Cc: damien.lemoal@wdc.com, linux-btrace@vger.kernel.org, bvanassche@acm.org,
 linux-scsi@vger.kernel.org, konrad.wilk@oracle.com,
 Chaitanya Kulkarni <chaitanya.kulkarni@wdc.com>, yuchao0@huawei.com,
 colyli@suse.de, linux-bcache@vger.kernel.org, jaegeuk@kernel.org,
 xen-devel@lists.xenproject.org, kent.overstreet@gmail.com,
 roger.pau@citrix.com
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

VGhpcyBwYXRjaCB1cGRhdGVzIHRoZSBibGtkZXZfcmVwb3J0X3pvbmUocykoKSB3aXRoIG5ld2x5
IGludHJvZHVjZWQKaGVscGVyIGZ1bmN0aW9uIHRvIHJlYWQgdGhlIG5yX3NlY3RzIGZyb20gYmxv
Y2sgZGV2aWNlJ3MgaGRfcGFydHMgd2l0aAp0aGUgaGVscCBvZiBwYXJ0X25yX3NlY3RzX3JlYWQo
KS4KClNpZ25lZC1vZmYtYnk6IENoYWl0YW55YSBLdWxrYXJuaSA8Y2hhaXRhbnlhLmt1bGthcm5p
QHdkYy5jb20+Ci0tLQogYmxvY2svYmxrLXpvbmVkLmMgfCA2ICsrKy0tLQogMSBmaWxlIGNoYW5n
ZWQsIDMgaW5zZXJ0aW9ucygrKSwgMyBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9ibG9jay9i
bGstem9uZWQuYyBiL2Jsb2NrL2Jsay16b25lZC5jCmluZGV4IDUwNTFkYjM1YzNmZC4uOWZhZjQ0
ODgzMzlkIDEwMDY0NAotLS0gYS9ibG9jay9ibGstem9uZWQuYworKysgYi9ibG9jay9ibGstem9u
ZWQuYwpAQCAtMTA2LDcgKzEwNiw3IEBAIHN0YXRpYyBib29sIGJsa2Rldl9yZXBvcnRfem9uZShz
dHJ1Y3QgYmxvY2tfZGV2aWNlICpiZGV2LCBzdHJ1Y3QgYmxrX3pvbmUgKnJlcCkKIAkJcmV0dXJu
IGZhbHNlOwogCiAJcmVwLT5zdGFydCAtPSBvZmZzZXQ7Ci0JaWYgKHJlcC0+c3RhcnQgKyByZXAt
PmxlbiA+IGJkZXYtPmJkX3BhcnQtPm5yX3NlY3RzKQorCWlmIChyZXAtPnN0YXJ0ICsgcmVwLT5s
ZW4gPiBiZGV2X25yX3NlY3RzKGJkZXYpKQogCQlyZXR1cm4gZmFsc2U7CiAKIAlpZiAocmVwLT50
eXBlID09IEJMS19aT05FX1RZUEVfQ09OVkVOVElPTkFMKQpAQCAtMTc2LDEzICsxNzYsMTMgQEAg
aW50IGJsa2Rldl9yZXBvcnRfem9uZXMoc3RydWN0IGJsb2NrX2RldmljZSAqYmRldiwgc2VjdG9y
X3Qgc2VjdG9yLAogCWlmIChXQVJOX09OX09OQ0UoIWJkZXYtPmJkX2Rpc2stPmZvcHMtPnJlcG9y
dF96b25lcykpCiAJCXJldHVybiAtRU9QTk9UU1VQUDsKIAotCWlmICghKm5yX3pvbmVzIHx8IHNl
Y3RvciA+PSBiZGV2LT5iZF9wYXJ0LT5ucl9zZWN0cykgeworCWlmICghKm5yX3pvbmVzIHx8IHNl
Y3RvciA+PSBiZGV2X25yX3NlY3RzKGJkZXYpKSB7CiAJCSpucl96b25lcyA9IDA7CiAJCXJldHVy
biAwOwogCX0KIAogCW5yeiA9IG1pbigqbnJfem9uZXMsCi0JCSAgX19ibGtkZXZfbnJfem9uZXMo
cSwgYmRldi0+YmRfcGFydC0+bnJfc2VjdHMgLSBzZWN0b3IpKTsKKwkJICBfX2Jsa2Rldl9ucl96
b25lcyhxLCBiZGV2X25yX3NlY3RzKGJkZXYpIC0gc2VjdG9yKSk7CiAJcmV0ID0gYmxrX3JlcG9y
dF96b25lcyhiZGV2LT5iZF9kaXNrLCBnZXRfc3RhcnRfc2VjdChiZGV2KSArIHNlY3RvciwKIAkJ
CSAgICAgICB6b25lcywgJm5yeiwgZ2ZwX21hc2spOwogCWlmIChyZXQpCi0tIAoyLjE3LjAKCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwg
bWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3Rz
LnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
