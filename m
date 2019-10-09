Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 12EEBD193D
	for <lists+xen-devel@lfdr.de>; Wed,  9 Oct 2019 21:52:37 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iIHwp-0003qF-0H; Wed, 09 Oct 2019 19:48:35 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=1LiL=YC=xilinx.com=woods@srs-us1.protection.inumbo.net>)
 id 1iIHwn-0003pF-KP
 for xen-devel@lists.xenproject.org; Wed, 09 Oct 2019 19:48:33 +0000
X-Inumbo-ID: c5e081c0-eacd-11e9-8c93-bc764e2007e4
Received: from NAM01-SN1-obe.outbound.protection.outlook.com (unknown
 [40.107.82.70]) by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id c5e081c0-eacd-11e9-8c93-bc764e2007e4;
 Wed, 09 Oct 2019 19:48:32 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=O0O59CdmHuwlkmz6l8qipzEGoGk1EEk54oC1rio4SLb1yBOXUjofn+B9kud+y7/xC0Zc2fUG3mqBmOABFKVyLDyM5AFIan/+IvII6qVXhfYZ4uTmWos81ov+1o7uQ+QPYr2/LRooCiU4q0T75RsSv0cACvE2KXNUzrfYwAHznf1cM9T2zOTLqZRyFDtSuEPQuN5VBySOtLzLGMVFYtV7TwCZpza3MfXsMboANoZMMiugTAmBV7HXk+Fm3Lo+NFMHcv7aOm9r0LlBmFbQgLv+glptPAYYghqvy+stqbkpcyo+bLe/p7SOLAlO9jxOJZHICO+7ZP/p6mCe2iDBExjB7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lWBpE0pKeR2Jk4Lh4QmLckDhf4gzK1hkXZqsFTE2UVU=;
 b=LM6Xts8uZ1/3tfz2ibCTk9lW+AR1M6PTqhE1nST3nCqt1HEFsspPBq4O9rQGvPyLZ4N/Gai6WFkiPp/uTMW2klU+YM14/g1hrT3wbXRfWM6AtNcfTxCuXhJ2Q0VSMu2s9p2ZdRd2lkCgRXDk7FV38Csxm6RtqDc5RIFvjrfynsgxko/estFM6/soKH/h35TR7E4NRiVDywoTBXf7OraCLXUNkXB8wT4l4Gc4soADRepB2T0U+owGWxCtvpngAATEY9+r2PaGuEw20msbagj36rgeaf9rxk67CK+480f/qE3oO5oBzh70msY9NI3/zW7J2J02M7AsC0VH51rMI25Dxw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.60.83) smtp.rcpttodomain=epam.com smtp.mailfrom=xilinx.com;
 dmarc=bestguesspass action=none header.from=xilinx.com; dkim=none (message
 not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lWBpE0pKeR2Jk4Lh4QmLckDhf4gzK1hkXZqsFTE2UVU=;
 b=YgE1oYUaeRcNEnLupeMoVLeJhWhPAxBAnGU9r+nWkP69/f8qRGLzcOOjZlOpvir/fr1lAxottg0BCPzd4VEi1M6t+RqvVPqA6xDl2OJVOdx0J8GMg3mGSrfVYoUk9Un70yzo0ME6zCnfsTF42GabUdCdHq0oHlzydF3xI0LToRg=
Received: from SN6PR02CA0034.namprd02.prod.outlook.com (2603:10b6:805:a2::47)
 by BN7PR02MB5332.namprd02.prod.outlook.com (2603:10b6:408:30::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2347.16; Wed, 9 Oct
 2019 19:48:28 +0000
Received: from CY1NAM02FT008.eop-nam02.prod.protection.outlook.com
 (2a01:111:f400:7e45::209) by SN6PR02CA0034.outlook.office365.com
 (2603:10b6:805:a2::47) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2220.19 via Frontend
 Transport; Wed, 9 Oct 2019 19:48:28 +0000
Authentication-Results: spf=pass (sender IP is 149.199.60.83)
 smtp.mailfrom=xilinx.com; epam.com; dkim=none (message not signed)
 header.d=none;epam.com; dmarc=bestguesspass action=none
 header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.60.83 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.60.83; helo=xsj-pvapsmtpgw01;
Received: from xsj-pvapsmtpgw01 (149.199.60.83) by
 CY1NAM02FT008.mail.protection.outlook.com (10.152.75.59) with Microsoft SMTP
 Server (version=TLS1_0, cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.20.2347.16
 via Frontend Transport; Wed, 9 Oct 2019 19:48:27 +0000
Received: from unknown-38-66.xilinx.com ([149.199.38.66] helo=xsj-pvapsmtp01)
 by xsj-pvapsmtpgw01 with esmtp (Exim 4.63)
 (envelope-from <brian.woods@xilinx.com>)
 id 1iIHwh-0002be-Ah; Wed, 09 Oct 2019 12:48:27 -0700
Received: from [127.0.0.1] (helo=localhost)
 by xsj-pvapsmtp01 with smtp (Exim 4.63)
 (envelope-from <brian.woods@xilinx.com>)
 id 1iIHwc-00051T-6X; Wed, 09 Oct 2019 12:48:22 -0700
Received: from xsj-pvapsmtp01 (smtp-fallback.xilinx.com [149.199.38.66] (may
 be forged))
 by xsj-smtp-dlp1.xlnx.xilinx.com (8.13.8/8.13.1) with ESMTP id x99JmK32024453; 
 Wed, 9 Oct 2019 12:48:20 -0700
Received: from [172.19.2.62] (helo=xsjwoods50.xilinx.com)
 by xsj-pvapsmtp01 with esmtp (Exim 4.63)
 (envelope-from <brian.woods@xilinx.com>)
 id 1iIHwZ-00050c-Uj; Wed, 09 Oct 2019 12:48:19 -0700
From: Brian Woods <brian.woods@xilinx.com>
To: xen-devel@lists.xenproject.org
Date: Wed,  9 Oct 2019 12:47:27 -0700
Message-Id: <1570650447-3225-1-git-send-email-brian.woods@xilinx.com>
X-Mailer: git-send-email 2.7.4
X-RCIS-Action: ALLOW
X-TM-AS-Product-Ver: IMSS-7.1.0.1224-8.2.0.1013-23620.005
X-TM-AS-User-Approved-Sender: Yes;Yes
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:149.199.60.83; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(189003)(199004)(8676002)(36756003)(70586007)(54906003)(47776003)(26005)(2906002)(50226002)(81156014)(186003)(14444005)(81166006)(106002)(70206006)(9786002)(498600001)(2616005)(126002)(16586007)(476003)(486006)(50466002)(7696005)(44832011)(336012)(2361001)(6916009)(305945005)(48376002)(51416003)(5660300002)(6666004)(356004)(2351001)(36386004)(8936002)(86362001)(4326008)(426003)(42866002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BN7PR02MB5332; H:xsj-pvapsmtpgw01; FPR:;
 SPF:Pass; LANG:en; PTR:unknown-60-83.xilinx.com; MX:1; A:1; 
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a5facd43-7874-4cf2-d839-08d74cf1a7b6
X-MS-TrafficTypeDiagnostic: BN7PR02MB5332:
X-Microsoft-Antispam-PRVS: <BN7PR02MB5332B7323FBD2BBD7DAC5ADED7950@BN7PR02MB5332.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:765;
X-Forefront-PRVS: 018577E36E
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: LtSO/dGUSHU0SJsZLJITnbaGmGtXAzPwAmab6kMvazpfPzlcw4sR8+Sr2ryJ15fQeejAKi3NZgdCTL5XtIbhnK9nAyfvQQatdZ0X4WzE9oygqCIvaTec9mRzgMwFaGr6Rke15u+oKDD1DhAnLsRQwKp9FopqTxzrc6xsK6OMMVZRToMMZXim8pChbj2M1lbms4DXAI30Y9FLawuXZjDL0Jia7UwXV8w2QWBJbuQU6n5B+jwXAlRIFmbkhOHbpA5B1zbQ/cH+N6xLVmOwmImDv77LXzAwEjaNmCskuq/eD3tCTD462ZBAba2jWVuWu1lp3cmBQHM09RhHzE52k158JqA8xWHGoIUu+Zumtfofx9L/To3UBk47YBwXroY2sBvyCQPOAEZyfQA2KDEWO+dNJ7J+EV4/tUlWNFC0EDsBPOQ=
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Oct 2019 19:48:27.8419 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a5facd43-7874-4cf2-d839-08d74cf1a7b6
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c; Ip=[149.199.60.83];
 Helo=[xsj-pvapsmtpgw01]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN7PR02MB5332
Subject: [Xen-devel] [PATCH] xen/arm: add warning if memory modules overlap
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
dG8gbGV0IHRoZSB1c2VyIGtub3cgdGhlcmUncyBhIHBvc3NpYmxlCmlzc3VlIHdoZW4gREVCVUcg
aXMgZW5hYmxlZC4KClNpZ25lZC1vZmYtYnk6IEJyaWFuIFdvb2RzIDxicmlhbi53b29kc0B4aWxp
bnguY29tPgotLS0Kc2FtcGxlIG91dHB1dDoKLi4uCihYRU4pIE1PRFVMRVswXTogMDAwMDAwMDAw
MTQwMDAwMCAtIDAwMDAwMDAwMDE1M2I4ZjEgWGVuICAgICAgICAgCihYRU4pIE1PRFVMRVsxXTog
MDAwMDAwMDAwNzZkMjAwMCAtIDAwMDAwMDAwMDc2ZGMwODAgRGV2aWNlIFRyZWUgCihYRU4pIE1P
RFVMRVsyXTogMDAwMDAwMDAwNzZkZjAwMCAtIDAwMDAwMDAwMDdmZmYzNjQgUmFtZGlzayAgICAg
CihYRU4pIE1PRFVMRVszXTogMDAwMDAwMDAwMDA4MDAwMCAtIDAwMDAwMDAwMDMxODAwMDAgS2Vy
bmVsICAgICAgCihYRU4pICBSRVNWRFswXTogMDAwMDAwMDAwNzZkMjAwMCAtIDAwMDAwMDAwMDc2
ZGMwMDAKKFhFTikgIFJFU1ZEWzFdOiAwMDAwMDAwMDA3NmRmMDAwIC0gMDAwMDAwMDAwN2ZmZjM2
NAooWEVOKSAKKFhFTikgV0FSTklORzogbW9kdWxlcyBYZW4gICAgICAgICAgYW5kIEtlcm5lbCAg
ICAgICBvdmVybGFwCihYRU4pIAooWEVOKSBDb21tYW5kIGxpbmU6IGNvbnNvbGU9ZHR1YXJ0IGR0
dWFydD1zZXJpYWwwIGRvbTBfbWVtPTFHIGJvb3RzY3J1Yj0wIG1heGNwdXM9MSB0aW1lcl9zbG9w
PTAKLi4uCgogeGVuL2FyY2gvYXJtL2Jvb3RmZHQuYyB8IDE3ICsrKysrKysrKysrKysrKysrCiAx
IGZpbGUgY2hhbmdlZCwgMTcgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL3hlbi9hcmNoL2Fy
bS9ib290ZmR0LmMgYi94ZW4vYXJjaC9hcm0vYm9vdGZkdC5jCmluZGV4IDA4ZmI1OWYuLjNjYjBj
NDMgMTAwNjQ0Ci0tLSBhL3hlbi9hcmNoL2FybS9ib290ZmR0LmMKKysrIGIveGVuL2FyY2gvYXJt
L2Jvb3RmZHQuYwpAQCAtMzg3LDYgKzM4NywyMyBAQCBzdGF0aWMgdm9pZCBfX2luaXQgZWFybHlf
cHJpbnRfaW5mbyh2b2lkKQogICAgICAgICAgICAgICAgbWVtX3Jlc3YtPmJhbmtbal0uc3RhcnQg
KyBtZW1fcmVzdi0+YmFua1tqXS5zaXplIC0gMSk7CiAgICAgfQogICAgIHByaW50aygiXG4iKTsK
KworI2lmbmRlZiBOREVCVUcKKyAgICAvKgorICAgICAqIEFzc3VtaW5nIGFsbCBjb21iaW5hdGlv
bnMgYXJlIGNoZWNrZWQsIG9ubHkgdGhlIHN0YXJ0aW5nIGFkZHJlc3MKKyAgICAgKiBoYXMgdG8g
YmUgY2hlY2tlZCBpZiBpdCdzIGluIGFub3RoZXIgbWVtb3J5IG1vZHVsZSdzIHJhbmdlLgorICAg
ICAqLworICAgIGZvciAoIGkgPSAwIDsgaSA8IG1vZHMtPm5yX21vZHM7IGkrKyApCisgICAgICAg
IGZvciAoIGogPSAwIDsgaiA8IG1vZHMtPm5yX21vZHM7IGorKyApCisgICAgICAgICAgICBpZiAo
IChpICE9IGopICYmCisgICAgICAgICAgICAgICAgIChtb2RzLT5tb2R1bGVbaV0uc3RhcnQgPj0g
bW9kcy0+bW9kdWxlW2pdLnN0YXJ0KSAmJgorICAgICAgICAgICAgICAgICAobW9kcy0+bW9kdWxl
W2ldLnN0YXJ0IDwKKyAgICAgICAgICAgICAgICAgIG1vZHMtPm1vZHVsZVtqXS5zdGFydCArIG1v
ZHMtPm1vZHVsZVtqXS5zaXplKSApCisgICAgICAgICAgICAgICAgcHJpbnRrKCJXQVJOSU5HOiBt
b2R1bGVzICUtMTJzIGFuZCAlLTEycyBvdmVybGFwXG4iLAorICAgICAgICAgICAgICAgICAgICAg
ICBib290X21vZHVsZV9raW5kX2FzX3N0cmluZyhtb2RzLT5tb2R1bGVbaV0ua2luZCksCisgICAg
ICAgICAgICAgICAgICAgICAgIGJvb3RfbW9kdWxlX2tpbmRfYXNfc3RyaW5nKG1vZHMtPm1vZHVs
ZVtqXS5raW5kKSk7CisjZW5kaWYKKwogICAgIGZvciAoIGkgPSAwIDsgaSA8IGNtZHMtPm5yX21v
ZHM7IGkrKyApCiAgICAgICAgIHByaW50aygiQ01ETElORVslIlBSSXBhZGRyIl06JXMgJXNcbiIs
IGNtZHMtPmNtZGxpbmVbaV0uc3RhcnQsCiAgICAgICAgICAgICAgICBjbWRzLT5jbWRsaW5lW2ld
LmR0X25hbWUsCi0tIAoyLjcuNAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnBy
b2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94
ZW4tZGV2ZWw=
