Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 575FE1364CE
	for <lists+xen-devel@lfdr.de>; Fri, 10 Jan 2020 02:31:27 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ipj6K-00075s-PP; Fri, 10 Jan 2020 01:28:36 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=eZRS=27=xilinx.com=woods@srs-us1.protection.inumbo.net>)
 id 1ipj6J-000758-Hq
 for xen-devel@lists.xenproject.org; Fri, 10 Jan 2020 01:28:35 +0000
X-Inumbo-ID: 7fa66666-3348-11ea-a985-bc764e2007e4
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (unknown
 [40.107.220.66]) by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 7fa66666-3348-11ea-a985-bc764e2007e4;
 Fri, 10 Jan 2020 01:28:26 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=H30bwx5nCV1Y9iRD/WNi0MMQ2qCw3BvzDDH4biw7ThdHXtJjLJ5JdtfhtSVybe0CW3zkpRd0wr3mKJH5cINa2IIDvF5rdo5py5bXZhB+bq6Q/TQAT5caE9y8u8Nal25f+DVfIjoDDcfv96FeISigc5svSzF+xHTAU5CyLXmM0hA6vvnrFhEmPY0jYuu28cXJSkfHmyVURiV2l2OB5JUxSbuqkJ2K8Q3vlZrSD/ljAEfdSGQGLlgsFGqFXyjNJW/fOURV+m8iVikLx2LgUyfMY46osxaobdm0O96tn4fwnJObHJGyICOBs+uNLco143V6X+fC45l9nRXLoeYqett0Jg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=A4oZGAh4w8/PJh/tv/MXVBtSiUUq1DNE06HRbWgioLs=;
 b=ilrnmowBtYcfGWVZ43nLfLfiB75LJJnNdDMFKYYs6YzY7n7lI+5/GgIOzmkoxkhuqF41CzMmsJ5XMVPy95aXGKjodFhRHGQIrrV38sI9nqCXvVAI/WP2C6razWX2F91lOs/e/DDvYq5KvqDLpNDk2NDpCOCmrLLkXOgLrVZHhiS7h7rFBSjB4qyicuHC+/OCvGQcRYCceQSzTvq736S6O+A88wU0TOt8aKiFijUAO6iJfK4x+cV6p0/G11ceCc7AUW+OMHmo66IYPC5Pn1jeaLRyjJr3X41rxcWSo2SEmzE4fL9feYab+u3tkGGOttAUmgK2nElXDW093f5aLi3Bjw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.60.83) smtp.rcpttodomain=lists.xenproject.org
 smtp.mailfrom=xilinx.com; dmarc=bestguesspass action=none
 header.from=xilinx.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=A4oZGAh4w8/PJh/tv/MXVBtSiUUq1DNE06HRbWgioLs=;
 b=rQj8ZfY6UgQR8n58qUAWnuvf/77mPV+lVuf7dm1R/y/WGoGgK4Qj7HzF/nNAE3VI8FYRjYKjzRHbJVAs7zzqvC8xACMCg4vUgtsrTikVHdTKthw6pxKBESm5WzjVjPl070pEPrqPnDD7F4mfZWG7jsMYaozOwxuESkq6jCDPFxQ=
Received: from DM6PR02CA0112.namprd02.prod.outlook.com (2603:10b6:5:1b4::14)
 by BYAPR02MB5734.namprd02.prod.outlook.com (2603:10b6:a03:11c::30) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2623.9; Fri, 10 Jan
 2020 01:28:24 +0000
Received: from SN1NAM02FT032.eop-nam02.prod.protection.outlook.com
 (2a01:111:f400:7e44::207) by DM6PR02CA0112.outlook.office365.com
 (2603:10b6:5:1b4::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2623.8 via Frontend
 Transport; Fri, 10 Jan 2020 01:28:24 +0000
Authentication-Results: spf=pass (sender IP is 149.199.60.83)
 smtp.mailfrom=xilinx.com; lists.xenproject.org; dkim=none (message not
 signed) header.d=none;lists.xenproject.org; dmarc=bestguesspass action=none
 header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.60.83 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.60.83; helo=xsj-pvapsmtpgw01;
Received: from xsj-pvapsmtpgw01 (149.199.60.83) by
 SN1NAM02FT032.mail.protection.outlook.com (10.152.72.126) with Microsoft SMTP
 Server (version=TLS1_0, cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.20.2623.9
 via Frontend Transport; Fri, 10 Jan 2020 01:28:23 +0000
Received: from unknown-38-66.xilinx.com ([149.199.38.66] helo=xsj-pvapsmtp01)
 by xsj-pvapsmtpgw01 with esmtp (Exim 4.63)
 (envelope-from <brian.woods@xilinx.com>)
 id 1ipj67-0003lU-Hi; Thu, 09 Jan 2020 17:28:23 -0800
Received: from [127.0.0.1] (helo=localhost)
 by xsj-pvapsmtp01 with smtp (Exim 4.63)
 (envelope-from <brian.woods@xilinx.com>)
 id 1ipj62-0000R8-E3; Thu, 09 Jan 2020 17:28:18 -0800
Received: from [172.19.2.62] (helo=xsjwoods50.xilinx.com)
 by xsj-pvapsmtp01 with esmtp (Exim 4.63)
 (envelope-from <brian.woods@xilinx.com>)
 id 1ipj60-00008C-NW; Thu, 09 Jan 2020 17:28:16 -0800
From: Brian Woods <brian.woods@xilinx.com>
To: xen-devel@lists.xenproject.org
Date: Thu,  9 Jan 2020 17:26:30 -0800
Message-Id: <1578619590-3661-3-git-send-email-brian.woods@xilinx.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1578619590-3661-1-git-send-email-brian.woods@xilinx.com>
References: <1578619590-3661-1-git-send-email-brian.woods@xilinx.com>
X-TM-AS-Product-Ver: IMSS-7.1.0.1224-8.2.0.1013-23620.005
X-TM-AS-User-Approved-Sender: Yes;Yes
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:149.199.60.83; IPV:; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(136003)(346002)(39860400002)(396003)(376002)(199004)(189003)(70206006)(70586007)(316002)(54906003)(4326008)(426003)(81156014)(8676002)(336012)(186003)(8936002)(81166006)(6916009)(107886003)(36756003)(5660300002)(44832011)(86362001)(7696005)(9786002)(2616005)(6666004)(26005)(2906002)(478600001)(356004)(41533002)(21314003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BYAPR02MB5734; H:xsj-pvapsmtpgw01; FPR:;
 SPF:Pass; LANG:en; PTR:unknown-60-83.xilinx.com; A:1; MX:1; 
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: dae7cb25-184c-4d04-6ff4-08d7956c62b0
X-MS-TrafficTypeDiagnostic: BYAPR02MB5734:
X-Microsoft-Antispam-PRVS: <BYAPR02MB57345A8EE70C2E145C41F3EFD7380@BYAPR02MB5734.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:1169;
X-Forefront-PRVS: 02788FF38E
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ie4nafu3DuOdaQ6PyaYGuzCJ2FmTHZQZHW/0U8aAklwD1bLA6buSETkg6rwhFsUNacPXUuQtQjxBjR7MSu1fWIKq8JJ+ggaRXTkGT4GQN4AZWW+tLPgxAvv93KrvYynryWKNkpN59onxzabEvD51/Svl1aIjVolEysx/5ivIXNaWdJ5XqdoD+OfJZyfXwo3wYO/aNsmljXui2WXJNwveeiDo7eHb5a8GKUOqrhkwr7TKx5lVqoFjYCOBgIEfBRAbZ9INQJpz8SBIBKyMW95GL2UdTkZa7uxh0+9NxrSK5yGfhsDivnr9gZ12x+grOt4TVZ71jYdKIi3n2fKftdueMseXxN28MhbDID9BdHW+pY3IEre8HKY9LqKxUDIX8WFN+xu/nubtq/Gk7Dhqo0fyXQ+NFyhBAjYm+Da1HoevM62KR3lhrLAPvBR9Uo0284rP6jU/lRMS+aek71/mGWeYU+grlIVk0JgdI0D50grGkf0CanLBJQsfFJmkZJyub6lRoezSTgOSITu5OwWAQ2jJOg==
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jan 2020 01:28:23.9129 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: dae7cb25-184c-4d04-6ff4-08d7956c62b0
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c; Ip=[149.199.60.83];
 Helo=[xsj-pvapsmtpgw01]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR02MB5734
Subject: [Xen-devel] [RFC 2/2] smmu: add support for generic DT bindings
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
Cc: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Brian Woods <brian.woods@xilinx.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

UmVzdHJ1Y3R1cmUgc29tZSBvZiB0aGUgY29kZSBhbmQgYWRkIHN1cHBvcnRpbmcgZnVuY3Rpb25z
IGZvciBhZGRpbmcKZ2VuZXJpYyBkZXZpY2UgdHJlZSAoRFQpIGJpbmRpbmcgc3VwcG9ydC4gIFRo
ZSBub3JtYWwgYWRkX2RldmljZSBhbmQKZHRfeGxhdGUgZnVuY3Rpb25zIGFyZSB3cmFwcGVycyBv
ZiB0aGUgbGVnYWN5IGZ1bmN0aW9ucyBkdWUgdG8gbGVnYWN5CmNhbGxzIG5lZWRpbmcgbW9yZSBh
cmd1bWVudHMgYmVjYXVzZSB0aGUgZmluZF9zbW11IGNhbid0IGEgc21tdSB0aGF0Cmlzbid0IGlu
aXRpYWxpemVkLgoKU2lnbmVkLW9mZi1ieTogQnJpYW4gV29vZHMgPGJyaWFuLndvb2RzQHhpbGlu
eC5jb20+Ci0tLQpSRkMgZXNwZWNpYWxseSBvbjoKICAgLSBDaGVja3MgZm9yIHRoZTogYXJtX3Nt
bXVfZHRfYWRkX2RldmljZSogYW5kIGFybV9zbW11X2R0X3hsYXRlKgogICAgIGZ1bmN0aW9ucy4K
CiB4ZW4vZHJpdmVycy9wYXNzdGhyb3VnaC9hcm0vc21tdS5jICAgIHwgMTE4ICsrKysrKysrKysr
KysrKysrKysrKysrKystLS0tLS0tLS0KIHhlbi9kcml2ZXJzL3Bhc3N0aHJvdWdoL2RldmljZV90
cmVlLmMgfCAgMTcgKy0tLS0KIDIgZmlsZXMgY2hhbmdlZCwgODcgaW5zZXJ0aW9ucygrKSwgNDgg
ZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEveGVuL2RyaXZlcnMvcGFzc3Rocm91Z2gvYXJtL3Nt
bXUuYyBiL3hlbi9kcml2ZXJzL3Bhc3N0aHJvdWdoL2FybS9zbW11LmMKaW5kZXggYzVkYjViZS4u
MDg3ODdjZCAxMDA2NDQKLS0tIGEveGVuL2RyaXZlcnMvcGFzc3Rocm91Z2gvYXJtL3NtbXUuYwor
KysgYi94ZW4vZHJpdmVycy9wYXNzdGhyb3VnaC9hcm0vc21tdS5jCkBAIC0yNTEsNiArMjUxLDgg
QEAgc3RydWN0IGlvbW11X2dyb3VwCiAJYXRvbWljX3QgcmVmOwogfTsKIAorc3RhdGljIGNvbnN0
IHN0cnVjdCBhcm1fc21tdV9kZXZpY2UgKmZpbmRfc21tdShjb25zdCBzdHJ1Y3QgZGV2aWNlICpk
ZXYpOworCiBzdGF0aWMgc3RydWN0IGlvbW11X2dyb3VwICppb21tdV9ncm91cF9hbGxvYyh2b2lk
KQogewogCXN0cnVjdCBpb21tdV9ncm91cCAqZ3JvdXAgPSB4emFsbG9jKHN0cnVjdCBpb21tdV9n
cm91cCk7CkBAIC03NzUsNjQgKzc3NywxMTQgQEAgc3RhdGljIGludCBpbnNlcnRfc21tdV9tYXN0
ZXIoc3RydWN0IGFybV9zbW11X2RldmljZSAqc21tdSwKIAlyZXR1cm4gMDsKIH0KIAotc3RhdGlj
IGludCByZWdpc3Rlcl9zbW11X21hc3RlcihzdHJ1Y3QgYXJtX3NtbXVfZGV2aWNlICpzbW11LAot
CQkJCXN0cnVjdCBkZXZpY2UgKmRldiwKLQkJCQlzdHJ1Y3Qgb2ZfcGhhbmRsZV9hcmdzICptYXN0
ZXJzcGVjKQorLyoKKyAqIFNpbmNlIHNtbXUgaXNuJ3QgZG9uZSBpbml0aWFsaXppbmcgYmVmb3Jl
IHRoaXMgaXMgcnVuIGluIHRoZSBsZWdhY3kKKyAqIGNhc2UsIGNyZWF0ZSBhIGZ1bmN0aW9uIHdo
ZXJlIHRoYXQncyBwYXNzZWQgYW5kIHRoZW4gaGF2ZSB0aGUgZ2VuZXJpYworICogZnVuY3Rpb24g
anVzdCBiZSBhIHNpbXBsZSB3cmFwcGVyLgorICovCitzdGF0aWMgaW50IGFybV9zbW11X2R0X3hs
YXRlX2xlZ2FjeShzdHJ1Y3QgZGV2aWNlICpkZXYsCisJCQkJICAgIGNvbnN0IHN0cnVjdCBvZl9w
aGFuZGxlX2FyZ3MgKnNwZWMsCisJCQkJICAgIHN0cnVjdCBpb21tdV9md3NwZWMgKmZ3c3BlYykK
K3sKKwlpZiAoKHNwZWMtPmFyZ3NfY291bnQgKyBmd3NwZWMtPm51bV9pZHMpID4gTUFYX01BU1RF
Ul9TVFJFQU1JRFMpIHsKKwkJZGV2X2VycihkZXYsCisJCQkicmVhY2hlZCBtYXhpbXVtIG51bWJl
ciAoJWQpIG9mIHN0cmVhbSBJRHMgZm9yIG1hc3RlciBkZXZpY2UgJXNcbiIsCisJCQlNQVhfTUFT
VEVSX1NUUkVBTUlEUywgc3BlYy0+bnAtPm5hbWUpOworCQlyZXR1cm4gLUVOT1NQQzsKKwl9CisK
KwkvKiBhZGRpbmcgdGhlIGlkcyBoZXJlICovCisJcmV0dXJuIGlvbW11X2Z3c3BlY19hZGRfaWRz
KGRldiwKKwkJCQkgICAgc3BlYy0+YXJncywKKwkJCQkgICAgc3BlYy0+YXJnc19jb3VudCk7Cit9
CisKK3N0YXRpYyBpbnQgYXJtX3NtbXVfZHRfeGxhdGUoc3RydWN0IGRldmljZSAqZGV2LAorCQkJ
ICAgICBjb25zdCBzdHJ1Y3QgZHRfcGhhbmRsZV9hcmdzICpzcGVjKQoreworCXJldHVybiBhcm1f
c21tdV9kdF94bGF0ZV9sZWdhY3koZGV2LAorCQkJCQlzcGVjLAorCQkJCQlkZXZfaW9tbXVfZndz
cGVjX2dldChkZXYpKTsKK30KKworc3RhdGljIGludCBhcm1fc21tdV9kdF9hZGRfZGV2aWNlX2xl
Z2FjeShzdHJ1Y3QgYXJtX3NtbXVfZGV2aWNlICpzbW11LAorCQkJCQkgc3RydWN0IGRldmljZSAq
ZGV2LAorCQkJCQkgc3RydWN0IGlvbW11X2Z3c3BlYyAqZndzcGVjKQogewotCWludCBpLCByZXQg
PSAwOworCWludCBpOwogCXN0cnVjdCBhcm1fc21tdV9tYXN0ZXIgKm1hc3RlcjsKKwlzdHJ1Y3Qg
ZGV2aWNlX25vZGUgKmRldl9ub2RlID0gZGV2X2dldF9kZXZfbm9kZShkZXYpOworCisJQlVHX09O
KGRldiA9PSBOVUxMKTsKKwlCVUdfT04oZGV2X25vZGUgPT0gTlVMTCk7CiAKLQltYXN0ZXIgPSBm
aW5kX3NtbXVfbWFzdGVyKHNtbXUsIG1hc3RlcnNwZWMtPm5wKTsKKwltYXN0ZXIgPSBmaW5kX3Nt
bXVfbWFzdGVyKHNtbXUsIGRldl9ub2RlKTsKIAlpZiAobWFzdGVyKSB7CiAJCWRldl9lcnIoZGV2
LAogCQkJInJlamVjdGluZyBtdWx0aXBsZSByZWdpc3RyYXRpb25zIGZvciBtYXN0ZXIgZGV2aWNl
ICVzXG4iLAotCQkJbWFzdGVyc3BlYy0+bnAtPm5hbWUpOworCQkJZGV2X25vZGUtPm5hbWUpOwog
CQlyZXR1cm4gLUVCVVNZOwogCX0KIAotCWlmIChtYXN0ZXJzcGVjLT5hcmdzX2NvdW50ID4gTUFY
X01BU1RFUl9TVFJFQU1JRFMpIHsKLQkJZGV2X2VycihkZXYsCi0JCQkicmVhY2hlZCBtYXhpbXVt
IG51bWJlciAoJWQpIG9mIHN0cmVhbSBJRHMgZm9yIG1hc3RlciBkZXZpY2UgJXNcbiIsCi0JCQlN
QVhfTUFTVEVSX1NUUkVBTUlEUywgbWFzdGVyc3BlYy0+bnAtPm5hbWUpOwotCQlyZXR1cm4gLUVO
T1NQQzsKLQl9Ci0KIAltYXN0ZXIgPSBkZXZtX2t6YWxsb2MoZGV2LCBzaXplb2YoKm1hc3Rlciks
IEdGUF9LRVJORUwpOwogCWlmICghbWFzdGVyKSB7CiAJCXJldHVybiAtRU5PTUVNOwogCX0KLQlt
YXN0ZXItPm9mX25vZGUgPSBtYXN0ZXJzcGVjLT5ucDsKLQotCXJldCA9IGlvbW11X2Z3c3BlY19p
bml0KCZtYXN0ZXItPm9mX25vZGUtPmRldiwgc21tdS0+ZGV2KTsKLQlpZiAocmV0KSB7Ci0JCWtm
cmVlKG1hc3Rlcik7Ci0JCXJldHVybiByZXQ7Ci0JfQotCW1hc3Rlci0+Y2ZnLmZ3c3BlYyA9IGRl
dl9pb21tdV9md3NwZWNfZ2V0KCZtYXN0ZXItPm9mX25vZGUtPmRldik7CisJbWFzdGVyLT5vZl9u
b2RlID0gZGV2X25vZGU7CiAKLQkvKiBhZGRpbmcgdGhlIGlkcyBoZXJlICovCi0JcmV0ID0gaW9t
bXVfZndzcGVjX2FkZF9pZHMoJm1hc3RlcnNwZWMtPm5wLT5kZXYsCi0JCQkJICAgbWFzdGVyc3Bl
Yy0+YXJncywKLQkJCQkgICBtYXN0ZXJzcGVjLT5hcmdzX2NvdW50KTsKLQlpZiAocmV0KQotCQly
ZXR1cm4gcmV0OworCW1hc3Rlci0+Y2ZnLmZ3c3BlYyA9IGZ3c3BlYzsKIAogCS8qIFhlbjogTGV0
IFhlbiBrbm93IHRoYXQgdGhlIGRldmljZSBpcyBwcm90ZWN0ZWQgYnkgYW4gU01NVSAqLwotCWR0
X2RldmljZV9zZXRfcHJvdGVjdGVkKG1hc3RlcnNwZWMtPm5wKTsKKwlkdF9kZXZpY2Vfc2V0X3By
b3RlY3RlZChkZXZfbm9kZSk7CiAKIAlpZiAoIShzbW11LT5mZWF0dXJlcyAmIEFSTV9TTU1VX0ZF
QVRfU1RSRUFNX01BVENIKSkgewotCQlmb3IgKGkgPSAwOyBpIDwgbWFzdGVyLT5jZmcuZndzcGVj
LT5udW1faWRzOyArK2kpIHsKLQkJCWlmIChtYXN0ZXJzcGVjLT5hcmdzW2ldID49IHNtbXUtPm51
bV9tYXBwaW5nX2dyb3VwcykgeworCQlmb3IgKGkgPSAwOyBpIDwgZndzcGVjLT5udW1faWRzOyAr
K2kpIHsKKwkJCWlmIChmd3NwZWMtPmlkc1tpXSA+PSBzbW11LT5udW1fbWFwcGluZ19ncm91cHMp
IHsKIAkJCQlkZXZfZXJyKGRldiwKIAkJCQkJInN0cmVhbSBJRCBmb3IgbWFzdGVyIGRldmljZSAl
cyBncmVhdGVyIHRoYW4gbWF4aW11bSBhbGxvd2VkICglZClcbiIsCi0JCQkJCW1hc3RlcnNwZWMt
Pm5wLT5uYW1lLCBzbW11LT5udW1fbWFwcGluZ19ncm91cHMpOworCQkJCQlkZXZfbm9kZS0+bmFt
ZSwgc21tdS0+bnVtX21hcHBpbmdfZ3JvdXBzKTsKIAkJCQlyZXR1cm4gLUVSQU5HRTsKIAkJCX0K
IAkJfQogCX0KKwogCXJldHVybiBpbnNlcnRfc21tdV9tYXN0ZXIoc21tdSwgbWFzdGVyKTsKIH0K
IAorc3RhdGljIGludCBhcm1fc21tdV9kdF9hZGRfZGV2aWNlKHU4IGRldmZuLCBzdHJ1Y3QgZGV2
aWNlICpkZXYpCit7CisJc3RydWN0IGFybV9zbW11X2RldmljZSAqc21tdTsKKwlzdHJ1Y3QgaW9t
bXVfZndzcGVjICpmd3NwZWMgPSBkZXZfaW9tbXVfZndzcGVjX2dldChkZXYpOworCisJc21tdSA9
IChzdHJ1Y3QgYXJtX3NtbXVfZGV2aWNlICopIGZpbmRfc21tdShmd3NwZWMtPmlvbW11X2Rldik7
CisKKwlyZXR1cm4gYXJtX3NtbXVfZHRfYWRkX2RldmljZV9sZWdhY3koc21tdSwgZGV2LCBmd3Nw
ZWMpOworfQorCitzdGF0aWMgaW50IHJlZ2lzdGVyX3NtbXVfbWFzdGVyKHN0cnVjdCBhcm1fc21t
dV9kZXZpY2UgKnNtbXUsCisJCQkJc3RydWN0IGRldmljZSAqZGV2LAorCQkJCXN0cnVjdCBvZl9w
aGFuZGxlX2FyZ3MgKm1hc3RlcnNwZWMpCit7CisJaW50IHJldCA9IDA7CisJc3RydWN0IGlvbW11
X2Z3c3BlYyAqZndzcGVjOworCisJcmV0ID0gaW9tbXVfZndzcGVjX2luaXQoJm1hc3RlcnNwZWMt
Pm5wLT5kZXYsIHNtbXUtPmRldik7CisJaWYgKHJldCkKKwkJcmV0dXJuIHJldDsKKworCWZ3c3Bl
YyA9IGRldl9pb21tdV9md3NwZWNfZ2V0KCZtYXN0ZXJzcGVjLT5ucC0+ZGV2KTsKKworCXJldCA9
IGFybV9zbW11X2R0X3hsYXRlX2xlZ2FjeSgmbWFzdGVyc3BlYy0+bnAtPmRldiwKKwkJCQkgICAg
ICAgbWFzdGVyc3BlYywKKwkJCQkgICAgICAgZndzcGVjKTsKKwlpZiAocmV0KQorCQlyZXR1cm4g
cmV0OworCisJcmV0dXJuIGFybV9zbW11X2R0X2FkZF9kZXZpY2VfbGVnYWN5KHNtbXUsCisJCQkJ
CSAgICAgJm1hc3RlcnNwZWMtPm5wLT5kZXYsCisJCQkJCSAgICAgZndzcGVjKTsKK30KKwogc3Rh
dGljIHN0cnVjdCBhcm1fc21tdV9kZXZpY2UgKmZpbmRfc21tdV9mb3JfZGV2aWNlKHN0cnVjdCBk
ZXZpY2UgKmRldikKIHsKIAlzdHJ1Y3QgYXJtX3NtbXVfZGV2aWNlICpzbW11OwpAQCAtMjc1NCw2
ICsyODA2LDcgQEAgc3RhdGljIHZvaWQgYXJtX3NtbXVfaW9tbXVfZG9tYWluX3RlYXJkb3duKHN0
cnVjdCBkb21haW4gKmQpCiBzdGF0aWMgY29uc3Qgc3RydWN0IGlvbW11X29wcyBhcm1fc21tdV9p
b21tdV9vcHMgPSB7CiAgICAgLmluaXQgPSBhcm1fc21tdV9pb21tdV9kb21haW5faW5pdCwKICAg
ICAuaHdkb21faW5pdCA9IGFybV9zbW11X2lvbW11X2h3ZG9tX2luaXQsCisgICAgLmFkZF9kZXZp
Y2UgPSBhcm1fc21tdV9kdF9hZGRfZGV2aWNlLAogICAgIC50ZWFyZG93biA9IGFybV9zbW11X2lv
bW11X2RvbWFpbl90ZWFyZG93biwKICAgICAuaW90bGJfZmx1c2ggPSBhcm1fc21tdV9pb3RsYl9m
bHVzaCwKICAgICAuaW90bGJfZmx1c2hfYWxsID0gYXJtX3NtbXVfaW90bGJfZmx1c2hfYWxsLApA
QCAtMjc2MSw5ICsyODE0LDEwIEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3QgaW9tbXVfb3BzIGFybV9z
bW11X2lvbW11X29wcyA9IHsKICAgICAucmVhc3NpZ25fZGV2aWNlID0gYXJtX3NtbXVfcmVhc3Np
Z25fZGV2LAogICAgIC5tYXBfcGFnZSA9IGFybV9pb21tdV9tYXBfcGFnZSwKICAgICAudW5tYXBf
cGFnZSA9IGFybV9pb21tdV91bm1hcF9wYWdlLAorICAgIC5kdF94bGF0ZSA9IGFybV9zbW11X2R0
X3hsYXRlLAogfTsKIAotc3RhdGljIF9faW5pdCBjb25zdCBzdHJ1Y3QgYXJtX3NtbXVfZGV2aWNl
ICpmaW5kX3NtbXUoY29uc3Qgc3RydWN0IGRldmljZSAqZGV2KQorc3RhdGljIGNvbnN0IHN0cnVj
dCBhcm1fc21tdV9kZXZpY2UgKmZpbmRfc21tdShjb25zdCBzdHJ1Y3QgZGV2aWNlICpkZXYpCiB7
CiAJc3RydWN0IGFybV9zbW11X2RldmljZSAqc21tdTsKIAlib29sIGZvdW5kID0gZmFsc2U7CmRp
ZmYgLS1naXQgYS94ZW4vZHJpdmVycy9wYXNzdGhyb3VnaC9kZXZpY2VfdHJlZS5jIGIveGVuL2Ry
aXZlcnMvcGFzc3Rocm91Z2gvZGV2aWNlX3RyZWUuYwppbmRleCBhY2Y2YjYyLi5kZDljZjY1IDEw
MDY0NAotLS0gYS94ZW4vZHJpdmVycy9wYXNzdGhyb3VnaC9kZXZpY2VfdHJlZS5jCisrKyBiL3hl
bi9kcml2ZXJzL3Bhc3N0aHJvdWdoL2RldmljZV90cmVlLmMKQEAgLTE1OCwyMiArMTU4LDcgQEAg
aW50IGlvbW11X2FkZF9kdF9kZXZpY2Uoc3RydWN0IGR0X2RldmljZV9ub2RlICpucCkKICAgICAg
ICAgICogdGhlc2UgY2FsbGJhY2sgaW1wbGVtZW50ZWQuCiAgICAgICAgICAqLwogICAgICAgICBp
ZiAoICFvcHMtPmFkZF9kZXZpY2UgfHwgIW9wcy0+ZHRfeGxhdGUgKQotICAgICAgICB7Ci0gICAg
ICAgICAgICAvKgotICAgICAgICAgICAgICogU29tZSBEZXZpY2UgVHJlZXMgbWF5IGV4cG9zZSBi
b3RoIGxlZ2FjeSBTTU1VIGFuZCBnZW5lcmljCi0gICAgICAgICAgICAgKiBJT01NVSBiaW5kaW5n
cyB0b2dldGhlci4gSG93ZXZlciwgdGhlIFNNTVUgZHJpdmVyIGlzIG9ubHkKLSAgICAgICAgICAg
ICAqIHN1cHBvcnRpbmcgdGhlIGZvcm1lciBhbmQgd2lsbCBwcm90ZWN0IHRoZW0gZHVyaW5nIHRo
ZQotICAgICAgICAgICAgICogaW5pdGlhbGl6YXRpb24uIFNvIHdlIG5lZWQgdG8gc2tpcCB0aGVt
IGFuZCBub3QgcmV0dXJuCi0gICAgICAgICAgICAgKiBlcnJvciBoZXJlLgotICAgICAgICAgICAg
ICoKLSAgICAgICAgICAgICAqIFhYWDogVGhpcyBjYW4gYmUgZHJvcHBlZCB3aGVuIHRoZSBTTU1V
IGlzIGFibGUgdG8gZGVhbAotICAgICAgICAgICAgICogd2l0aCBnZW5lcmljIGJpbmRpbmdzLgot
ICAgICAgICAgICAgICovCi0gICAgICAgICAgICBpZiAoIGR0X2RldmljZV9pc19wcm90ZWN0ZWQo
bnApICkKLSAgICAgICAgICAgICAgICByZXR1cm4gMDsKLSAgICAgICAgICAgIGVsc2UKLSAgICAg
ICAgICAgICAgICByZXR1cm4gLUVJTlZBTDsKLSAgICAgICAgfQorICAgICAgICAgICAgcmV0dXJu
IC1FSU5WQUw7CiAKICAgICAgICAgaWYgKCAhZHRfZGV2aWNlX2lzX2F2YWlsYWJsZShpb21tdV9z
cGVjLm5wKSApCiAgICAgICAgICAgICBicmVhazsKLS0gCjIuNy40CgoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApY
ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
