Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C8F0DB826
	for <lists+xen-devel@lfdr.de>; Thu, 17 Oct 2019 22:12:15 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iLC46-0002OD-Bb; Thu, 17 Oct 2019 20:08:06 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=6xiX=YK=xilinx.com=woods@srs-us1.protection.inumbo.net>)
 id 1iLC44-0002O8-Qg
 for xen-devel@lists.xenproject.org; Thu, 17 Oct 2019 20:08:04 +0000
X-Inumbo-ID: d3433c52-f119-11e9-93d7-12813bfff9fa
Received: from NAM02-CY1-obe.outbound.protection.outlook.com (unknown
 [40.107.76.81]) by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id d3433c52-f119-11e9-93d7-12813bfff9fa;
 Thu, 17 Oct 2019 20:08:03 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VNRCpS5NaCGtVKBTlyvoH3/1kkCW/DeTQj79+KBONR3z/rHX8rNymMSQmw0+up6wCBQmL6ccN2QkfBg+Hjp+PVPMzJel6CFv7KMaJ/QN9eqyG6QaEVPOftO+kctN/1MYBvL+8AWqEK6V4/IlI83NkgwOCzY/BWP6s8E0qM+y3vzzP5L0vXugNkXA41Q1s3Y9FU7YPzY8Xf/aCbhKYDgTLhfpwLiUJYeM4RNYiQKDhfZt+domYfbs8w43BuKo3vmrFTRMUVVH8h671w8Gppy7f4QkR003h+a2R3HnnHEEuCx9FFZ//f/UDiVdlsSBZJAmIE/FkPXlFXOwyJA2cILaMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+6aqsrlVx+M4Yaf0+/zrHQY0vg69SlIZH0Lw6B9X3E8=;
 b=kXLzWw3CVtouyN2ipqqKs+FwPPjCd+N/BWQRSRrvIwe3LVe6gbFeTLiEzdaQnCfv78oOW+7nNzawEsKFKe+CqeMoZE6XRk0vmWJnEZQp/QQMpB99+4NNSAdi9MzBunXU7g+2scCF0nL5qywMkL9Dwb4v8Ui7FXGOFAmfVZ2qeB4M9ARWGVejSvMzhTx1KscLwA4y0T4lh6lm7S8cfBh+eIIm6RGGFar5Bvt3sy+G6h/x3MAEdugI9htNMo/xbpehEc98tu94Woto7JcMk+JqFAweyLpCU7jhBqehSZK1tjtVuOryFUqoAVJCYtdREP2Q+J6B/zKRNcS1kxJZPyBOfg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.60.83) smtp.rcpttodomain=epam.com smtp.mailfrom=xilinx.com;
 dmarc=bestguesspass action=none header.from=xilinx.com; dkim=none (message
 not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+6aqsrlVx+M4Yaf0+/zrHQY0vg69SlIZH0Lw6B9X3E8=;
 b=NZFed5DYq2k3YJ1c8GMbqhiL8OrazqtOWJN1/2lwv4J4oxitoaaiuaojoonwAKtSihGSPTCystCQuNR+YY9nf1yJaCSpKmEqFeNLLznqhkqzKvuYJp+Ka+lfIDry23xp7kSGJ14qy4fSroUCO58pug4z6y9hQnY0or0vI/D03F0=
Received: from SN4PR0201CA0068.namprd02.prod.outlook.com
 (2603:10b6:803:20::30) by BL0PR02MB3796.namprd02.prod.outlook.com
 (2603:10b6:207:48::29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2347.21; Thu, 17 Oct
 2019 20:08:00 +0000
Received: from SN1NAM02FT025.eop-nam02.prod.protection.outlook.com
 (2a01:111:f400:7e44::203) by SN4PR0201CA0068.outlook.office365.com
 (2603:10b6:803:20::30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2347.18 via Frontend
 Transport; Thu, 17 Oct 2019 20:08:00 +0000
Authentication-Results: spf=pass (sender IP is 149.199.60.83)
 smtp.mailfrom=xilinx.com; epam.com; dkim=none (message not signed)
 header.d=none;epam.com; dmarc=bestguesspass action=none
 header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.60.83 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.60.83; helo=xsj-pvapsmtpgw01;
Received: from xsj-pvapsmtpgw01 (149.199.60.83) by
 SN1NAM02FT025.mail.protection.outlook.com (10.152.72.87) with Microsoft SMTP
 Server (version=TLS1_0, cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.20.2367.14
 via Frontend Transport; Thu, 17 Oct 2019 20:08:00 +0000
Received: from unknown-38-66.xilinx.com ([149.199.38.66] helo=xsj-pvapsmtp01)
 by xsj-pvapsmtpgw01 with esmtp (Exim 4.63)
 (envelope-from <brian.woods@xilinx.com>)
 id 1iLC3z-0002JZ-PX; Thu, 17 Oct 2019 13:07:59 -0700
Received: from [127.0.0.1] (helo=localhost)
 by xsj-pvapsmtp01 with smtp (Exim 4.63)
 (envelope-from <brian.woods@xilinx.com>)
 id 1iLC3u-0002IJ-MD; Thu, 17 Oct 2019 13:07:54 -0700
Received: from xsj-pvapsmtp01 (maildrop.xilinx.com [149.199.38.66])
 by xsj-smtp-dlp2.xlnx.xilinx.com (8.13.8/8.13.1) with ESMTP id x9HK7npR022748; 
 Thu, 17 Oct 2019 13:07:49 -0700
Received: from [172.19.2.62] (helo=xsjwoods50.xilinx.com)
 by xsj-pvapsmtp01 with esmtp (Exim 4.63)
 (envelope-from <brian.woods@xilinx.com>)
 id 1iLC3p-0002HY-3b; Thu, 17 Oct 2019 13:07:49 -0700
From: Brian Woods <brian.woods@xilinx.com>
To: xen-devel@lists.xenproject.org
Date: Thu, 17 Oct 2019 13:07:40 -0700
Message-Id: <1571342860-15838-1-git-send-email-brian.woods@xilinx.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1570650447-3225-1-git-send-email-brian.woods@xilinx.com>
References: <1570650447-3225-1-git-send-email-brian.woods@xilinx.com>
X-RCIS-Action: ALLOW
X-TM-AS-Product-Ver: IMSS-7.1.0.1224-8.2.0.1013-23620.005
X-TM-AS-User-Approved-Sender: Yes;Yes
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:149.199.60.83; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(199004)(189003)(4326008)(426003)(6916009)(305945005)(36386004)(11346002)(486006)(476003)(2616005)(14444005)(126002)(336012)(2906002)(70586007)(48376002)(446003)(44832011)(70206006)(50226002)(8936002)(8676002)(9786002)(81166006)(81156014)(2361001)(2351001)(498600001)(36756003)(5660300002)(26005)(186003)(86362001)(47776003)(7696005)(76176011)(51416003)(50466002)(54906003)(6666004)(106002)(16586007)(356004);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BL0PR02MB3796; H:xsj-pvapsmtpgw01; FPR:;
 SPF:Pass; LANG:en; PTR:unknown-60-83.xilinx.com; A:1; MX:1; 
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 483cd3a1-1bc0-48af-4c52-08d7533db5bb
X-MS-TrafficTypeDiagnostic: BL0PR02MB3796:
X-Microsoft-Antispam-PRVS: <BL0PR02MB3796BBDC59EE6287328DB166D76D0@BL0PR02MB3796.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:595;
X-Forefront-PRVS: 01930B2BA8
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: HeN1AR+as6qtmYersEqM4SbCcfl8FYzN1Cdz398qXND4ipLTZXOh8umaRqds87CRSInLJpWcHOBjy/UOSNmnRTUtlsEpdROOesJoZGGojbOArnDiMfwBK3f4CzknJv32n8f9+hTmFEc7JYFLO2qRMES3qrYWiJolTmcMc6nyBHNjFIG2cabGx77J94fRIiojT5X6gMWZbxODqB0dasXVg3yxZZo2kxe6U9pNaniUOraLboRjaDKtlRXl1Jym2uI8YMn7D1FzPqDMUigyzlUFyHm4w/LkX9KggeezdlyW9z/OA1r/Sennqzfw0sGI4Diir06YOQNVSsjgqdaE7/MNOU0nKmZgjPnrT8cEqiip3VCIXTzQKxleXv7IMJlHU8hi8T39lvGYx4Yva7ONrtPY6XDVF9SsFbdqUs8Vr7gaH4g=
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Oct 2019 20:08:00.1784 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 483cd3a1-1bc0-48af-4c52-08d7533db5bb
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c; Ip=[149.199.60.83];
 Helo=[xsj-pvapsmtpgw01]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR02MB3796
Subject: [Xen-devel] [PATCH v2] xen/arm: add warning if memory modules
 overlap
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
Cc: Brian Woods <brian.woods@xilinx.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SXQncyBwb3NzaWJsZSBmb3IgYSBtaXNjb25maWd1cmVkIGRldmljZSB0cmVlIHRvIGNhdXNlIFhl
biB0byBjcmFzaCB3aGVuCnRoZXJlIGFyZSBvdmVybGFwcGluZyBhZGRyZXNzZXMgaW4gdGhlIG1l
bW9yeSBtb2R1bGVzLiAgQWRkIGEgd2FybmluZwp3aGVuIHByaW50aW5nIHRoZSBhZGRyZXNzZXMg
dG8gbGV0IHRoZSB1c2VyIGtub3cgdGhlcmUncyBhIHBvc3NpYmxlCmlzc3VlLgoKU2lnbmVkLW9m
Zi1ieTogQnJpYW4gV29vZHMgPGJyaWFuLndvb2RzQHhpbGlueC5jb20+Ci0tLQp2MSAtPiB2MgoJ
LSByZW1vdmVkIG5lc3RlZCBsb29wIGFuZCBwbGFjZWQgY2hlY2sgaW4gYWRkX2Jvb3RfbW9kdWxl
KCkKClNhbXBsZSBvdXRwdXQ6Ci4uLgooWEVOKSBNT0RVTEVbMF06IDAwMDAwMDAwMDE0MDAwMDAg
LSAwMDAwMDAwMDAxNTQyMTIxIFhlbiAgICAgICAgIAooWEVOKSBNT0RVTEVbMV06IDAwMDAwMDAw
MDM4NDYwMDAgLSAwMDAwMDAwMDAzODUwMDgwIERldmljZSBUcmVlIAooWEVOKSBNT0RVTEVbMl06
IDAwMDAwMDAwMDM4NTMwMDAgLSAwMDAwMDAwMDA3ZmZmNjc2IFJhbWRpc2sgICAgIAooWEVOKSBN
T0RVTEVbM106IDAwMDAwMDAwMDAwODAwMDAgLSAwMDAwMDAwMDAzMTgwMDAwIEtlcm5lbCAgICAg
IAooWEVOKSAgUkVTVkRbMF06IDAwMDAwMDAwMDM4NDYwMDAgLSAwMDAwMDAwMDAzODUwMDAwCihY
RU4pICBSRVNWRFsxXTogMDAwMDAwMDAwMzg1MzAwMCAtIDAwMDAwMDAwMDdmZmY2NzYKKFhFTikg
CihYRU4pIFdBUk5JTkc6IG92ZXJsYXAgZGV0ZWN0ZWQgaW4gdGhlIG1lbW9yeSBtb2R1bGUgYWRk
cmVzc2VzCihYRU4pIAooWEVOKSBDb21tYW5kIGxpbmU6IGNvbnNvbGU9ZHR1YXJ0IGR0dWFydD1z
ZXJpYWwwIGRvbTBfbWVtPTFHIGJvb3RzY3J1Yj0wIG1heGNwdXM9MSB0aW1lcl9zbG9wPTAKLi4u
CgogeGVuL2FyY2gvYXJtL2Jvb3RmZHQuYyAgICAgIHwgNCArKysrCiB4ZW4vYXJjaC9hcm0vc2V0
dXAuYyAgICAgICAgfCA2ICsrKysrKwogeGVuL2luY2x1ZGUvYXNtLWFybS9zZXR1cC5oIHwgMSAr
CiAzIGZpbGVzIGNoYW5nZWQsIDExIGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS94ZW4vYXJj
aC9hcm0vYm9vdGZkdC5jIGIveGVuL2FyY2gvYXJtL2Jvb3RmZHQuYwppbmRleCAwOGZiNTlmLi5m
OGIzNGQ0IDEwMDY0NAotLS0gYS94ZW4vYXJjaC9hcm0vYm9vdGZkdC5jCisrKyBiL3hlbi9hcmNo
L2FybS9ib290ZmR0LmMKQEAgLTM4Nyw2ICszODcsMTAgQEAgc3RhdGljIHZvaWQgX19pbml0IGVh
cmx5X3ByaW50X2luZm8odm9pZCkKICAgICAgICAgICAgICAgIG1lbV9yZXN2LT5iYW5rW2pdLnN0
YXJ0ICsgbWVtX3Jlc3YtPmJhbmtbal0uc2l6ZSAtIDEpOwogICAgIH0KICAgICBwcmludGsoIlxu
Iik7CisKKyAgICBpZiAoIG1lbV9tb2R1bGVfb3ZlcmxhcCApCisgICAgICAgIHByaW50aygiV0FS
TklORzogb3ZlcmxhcCBkZXRlY3RlZCBpbiB0aGUgbWVtb3J5IG1vZHVsZSBhZGRyZXNzZXMuXG4i
KTsKKwogICAgIGZvciAoIGkgPSAwIDsgaSA8IGNtZHMtPm5yX21vZHM7IGkrKyApCiAgICAgICAg
IHByaW50aygiQ01ETElORVslIlBSSXBhZGRyIl06JXMgJXNcbiIsIGNtZHMtPmNtZGxpbmVbaV0u
c3RhcnQsCiAgICAgICAgICAgICAgICBjbWRzLT5jbWRsaW5lW2ldLmR0X25hbWUsCmRpZmYgLS1n
aXQgYS94ZW4vYXJjaC9hcm0vc2V0dXAuYyBiL3hlbi9hcmNoL2FybS9zZXR1cC5jCmluZGV4IDcw
NWE5MTcuLjMxNWExMzEgMTAwNjQ0Ci0tLSBhL3hlbi9hcmNoL2FybS9zZXR1cC5jCisrKyBiL3hl
bi9hcmNoL2FybS9zZXR1cC5jCkBAIC02OSw2ICs2OSw4IEBAIGludGVnZXJfcGFyYW0oInhlbmhl
YXBfbWVnYWJ5dGVzIiwgb3B0X3hlbmhlYXBfbWVnYWJ5dGVzKTsKIAogZG9taWRfdCBfX3JlYWRf
bW9zdGx5IG1heF9pbml0X2RvbWlkOwogCitib29sIF9faW5pdGRhdGEgbWVtX21vZHVsZV9vdmVy
bGFwOworCiBzdGF0aWMgX191c2VkIHZvaWQgaW5pdF9kb25lKHZvaWQpCiB7CiAgICAgLyogTXVz
dCBiZSBkb25lIHBhc3Qgc2V0dGluZyBzeXN0ZW1fc3RhdGUuICovCkBAIC0yNTQsNiArMjU2LDEw
IEBAIHN0cnVjdCBib290bW9kdWxlIF9faW5pdCAqYWRkX2Jvb3RfbW9kdWxlKGJvb3Rtb2R1bGVf
a2luZCBraW5kLAogICAgICAgICAgICAgICAgIG1vZC0+ZG9tVSA9IGZhbHNlOwogICAgICAgICAg
ICAgcmV0dXJuIG1vZDsKICAgICAgICAgfQorCisgICAgICAgIGlmICggKChtb2QtPnN0YXJ0ID49
IHN0YXJ0KSAmJiAobW9kLT5zdGFydCA8IHN0YXJ0ICsgc2l6ZSkpIHx8CisgICAgICAgICAgICAg
KChzdGFydCA+PSBtb2QtPnN0YXJ0KSAmJiAoc3RhcnQgPCBtb2QtPnN0YXJ0ICsgbW9kLT5zaXpl
KSkgKQorICAgICAgICAgICAgbWVtX21vZHVsZV9vdmVybGFwID0gdHJ1ZTsKICAgICB9CiAKICAg
ICBtb2QgPSAmbW9kcy0+bW9kdWxlW21vZHMtPm5yX21vZHMrK107CmRpZmYgLS1naXQgYS94ZW4v
aW5jbHVkZS9hc20tYXJtL3NldHVwLmggYi94ZW4vaW5jbHVkZS9hc20tYXJtL3NldHVwLmgKaW5k
ZXggMmY4ZjI0ZS4uNGJiMWJhMSAxMDA2NDQKLS0tIGEveGVuL2luY2x1ZGUvYXNtLWFybS9zZXR1
cC5oCisrKyBiL3hlbi9pbmNsdWRlL2FzbS1hcm0vc2V0dXAuaApAQCAtMTIyLDYgKzEyMiw3IEBA
IHZvaWQgZGV2aWNlX3RyZWVfZ2V0X3JlZyhjb25zdCBfX2JlMzIgKipjZWxsLCB1MzIgYWRkcmVz
c19jZWxscywKIHUzMiBkZXZpY2VfdHJlZV9nZXRfdTMyKGNvbnN0IHZvaWQgKmZkdCwgaW50IG5v
ZGUsCiAgICAgICAgICAgICAgICAgICAgICAgICBjb25zdCBjaGFyICpwcm9wX25hbWUsIHUzMiBk
Zmx0KTsKIAorZXh0ZXJuIGJvb2wgbWVtX21vZHVsZV9vdmVybGFwOwogI2VuZGlmCiAvKgogICog
TG9jYWwgdmFyaWFibGVzOgotLSAKMi43LjQKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0
cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlz
dGluZm8veGVuLWRldmVs
