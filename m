Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 84EE22756D9
	for <lists+xen-devel@lfdr.de>; Wed, 23 Sep 2020 13:08:52 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kL2da-0003zv-IS; Wed, 23 Sep 2020 11:08:38 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=u6iF=DA=arm.com=bertrand.marquis@srs-us1.protection.inumbo.net>)
 id 1kL2dY-0003zq-IZ
 for xen-devel@lists.xenproject.org; Wed, 23 Sep 2020 11:08:36 +0000
X-Inumbo-ID: 0e13b9c0-abbb-44be-b32c-a06563105eaa
Received: from EUR04-HE1-obe.outbound.protection.outlook.com (unknown
 [40.107.7.52]) by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 0e13b9c0-abbb-44be-b32c-a06563105eaa;
 Wed, 23 Sep 2020 11:08:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=X93lwwNey1L0K7fYhSn92oGBlQJ/ExKpW1zwjlRoVr8=;
 b=Jyj9drg6alhefuTBEy/XZ1oSwXtmnN9XVowmSFg078FWWyZCJmyFUU0GAyVJsIkQ8OOrRhvnsrHPoYW19HTdm8EdTZ/RyKddVCRloB+DpWsbaiLRMZPPNVXimXLfVPSwxjB8GCNr2E/HD7IHxRl8woj3q6uhMs3uBdifvumvvzo=
Received: from AM6P194CA0038.EURP194.PROD.OUTLOOK.COM (2603:10a6:209:84::15)
 by AM7PR08MB5509.eurprd08.prod.outlook.com (2603:10a6:20b:10c::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3391.15; Wed, 23 Sep
 2020 11:08:34 +0000
Received: from VE1EUR03FT062.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:209:84:cafe::31) by AM6P194CA0038.outlook.office365.com
 (2603:10a6:209:84::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3412.20 via Frontend
 Transport; Wed, 23 Sep 2020 11:08:33 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org;
 dmarc=bestguesspass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT062.mail.protection.outlook.com (10.152.18.252) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3412.21 via Frontend Transport; Wed, 23 Sep 2020 11:08:33 +0000
Received: ("Tessian outbound 7fc8f57bdedc:v64");
 Wed, 23 Sep 2020 11:08:33 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 43a8172134ada775
X-CR-MTA-TID: 64aa7808
Received: from 93bafc8536bd.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 B1B898CD-5E59-4319-995B-B325C169E5FF.1; 
 Wed, 23 Sep 2020 11:08:27 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 93bafc8536bd.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 23 Sep 2020 11:08:27 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=f9KAriQMZFM1FggoOJMy2XgJsl2kTdPMeeOvcwFUCq+zARkU6VfyFwyvHyXAoJE2lblv8faL15nEYLiEqmWhPVtso5fRBiR3L3WM3BnCQlN1lmqpsCZCIr7YdF+f5FoYT+7oQyTgLOlm7cCAYLRB0hfaOlJu88bsPaqFDyr+hRAOhFG56LT9w5iRjat+4g1C/sVfjeOn2yqNrybaS7DwZDIGdO2yejEKx6WpG22qHeHqxH1dFXxyxpLsDtCsQ7LorSZx+o6Bkudr9+cTVTtj05QwxDkh607T/fbPToRYdmcB7vofQ3br/7yKL+znlh8aMr6PyDJkA0TwLbu4MIvQ2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=X93lwwNey1L0K7fYhSn92oGBlQJ/ExKpW1zwjlRoVr8=;
 b=aTYiPXfYq763VRpRzvczBoMDnKsszFYr1O/EtQBIIdXX1scvrPT8ZxWOCbd2LqMtFjNMtC+r+PKqpnvwrd5Nk/hMmwJGkm2+8pUE+/4ECK4Hc2JAqngoyJbLfL1ZeWJrb+ilBlnIV+AcMq4yCNP10FCcIHb/ZbECalRSLcF44b9UU6ToW3aDiQGVc56Or861VN9/udLEYya1AFST1+V9kCF7frImtcafAlZLLT15I9GWecfrENmSKljaxJ3o8A2dLMNZ5OBvbKAW6BkZm4Yol82KigFtkn5i3az4dchesZ5/gurm62YCRFRXpVtZ7L7q88UklKlYSe/0nrBJ18KCsA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=X93lwwNey1L0K7fYhSn92oGBlQJ/ExKpW1zwjlRoVr8=;
 b=Jyj9drg6alhefuTBEy/XZ1oSwXtmnN9XVowmSFg078FWWyZCJmyFUU0GAyVJsIkQ8OOrRhvnsrHPoYW19HTdm8EdTZ/RyKddVCRloB+DpWsbaiLRMZPPNVXimXLfVPSwxjB8GCNr2E/HD7IHxRl8woj3q6uhMs3uBdifvumvvzo=
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com (2603:10a6:10:79::16)
 by DB7PR08MB3691.eurprd08.prod.outlook.com (2603:10a6:10:75::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3391.15; Wed, 23 Sep
 2020 11:08:24 +0000
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::cccc:2933:d4d3:1a9e]) by DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::cccc:2933:d4d3:1a9e%6]) with mapi id 15.20.3412.020; Wed, 23 Sep 2020
 11:08:24 +0000
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Julien Grall <julien@xen.org>
CC: "open list:X86" <xen-devel@lists.xenproject.org>, Julien Grall
 <jgrall@amazon.com>, Stefano Stabellini <sstabellini@kernel.org>, Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>, Andrew Cooper
 <andrew.cooper3@citrix.com>, Jan Beulich <jbeulich@suse.com>, George Dunlap
 <george.dunlap@citrix.com>, Dario Faggioli <dfaggioli@suse.com>
Subject: Re: [RESEND][PATCH] xen/arm: sched: Ensure the vCPU context is seen
 before vcpu_pause() returns
Thread-Topic: [RESEND][PATCH] xen/arm: sched: Ensure the vCPU context is seen
 before vcpu_pause() returns
Thread-Index: AQHWkRb3YbUANCat5069iZiL+rQxOal2EYaA
Date: Wed, 23 Sep 2020 11:08:23 +0000
Message-ID: <582CD990-4D6B-4B93-BDB5-C16D5F69A9EB@arm.com>
References: <20200922193104.20604-1-julien@xen.org>
In-Reply-To: <20200922193104.20604-1-julien@xen.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
Authentication-Results-Original: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=arm.com;
x-originating-ip: [82.24.250.194]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 8d5df7e1-d1ee-46db-c461-08d85fb102f0
x-ms-traffictypediagnostic: DB7PR08MB3691:|AM7PR08MB5509:
X-Microsoft-Antispam-PRVS: <AM7PR08MB5509F96D339DBB66A42F594A9D380@AM7PR08MB5509.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:10000;OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: C2NnGdMilX3maNVD8gNrJ28js+G9GYSFIS1LU0Zk3tQbXXhBN9/rw2yeO4J+al0aGdEzA88Z14+uDklcw//7Lr0SiZiiFSy7CU04YfYpEutSGmbqyWaqhEZtgTULPiXbNnzQvCwj/kko2jHVKMzX1XeW/20XCV8vzmMyrh/OXKIvbVQCwmU/v6DtvItyh0ObnviTtBwvuG7MLwaVCbFArpOKolmVrMikgJlzTJRy3wgPNhDPcpLr3/Ijzqd3wsIOpVuPWEa2inhchjO0H3LNrV8/Mpi/Y+dLOg/Gc+JaaYUcuwvA8CwVJcdoFpem0geyq1bH3QpAFUIxZ4PBV7o00gsMnzY0acAPViHm0JpT8N5i3KxdFFh+LF09jTxhH8PV
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:DB7PR08MB3689.eurprd08.prod.outlook.com;
 PTR:; CAT:NONE;
 SFS:(4636009)(136003)(376002)(366004)(39860400002)(346002)(396003)(186003)(478600001)(66556008)(76116006)(91956017)(66476007)(66946007)(53546011)(2906002)(64756008)(5660300002)(33656002)(26005)(6916009)(6506007)(316002)(6486002)(66446008)(83380400001)(2616005)(36756003)(8676002)(86362001)(54906003)(6512007)(4326008)(71200400001)(8936002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: fIUjRDjmC/gR4vOadCU0DYSoer3mMxihNs+VsBQl60uqpqX70ZzizQdAxJa44YL04pRb1aBniJ23igNRcvH4A0zjyI48dtZa7Oxy3+opRPcG/msW5WYlQxYUiIhiCVnFhEMDYRA1sh9RFst26Y4rihS8LGJN4R6OvN+HLv9YqbGyYmy6AMNj/AFCQ+/aTcNpijEunxrSIhdVe2rokBpnqvu9xBV9l6uXJ+U+Xk6l6RE3wmowlnB8XpMsNAwe6bcsP0MxxMz+QVDcEck2vZjqs/mLfQvvQgLtxtpMrQkBK1j4/PwC+eWuRu/CrlSUdwsBo+SAyHCfsdl2S/0Q77ubeDr548NND1P3ZB5Ize4WXrBEMyScMjpm2c22nYScntj3Drk7uFuxndz8a4j2Dpb33deLPQ/dAcf0OK8MKWxiLzR3JJ17NEylZXE3a/BzMRe6ViFHkWoz51JqIFJzJt9DNH836RfUtLowYHk/3Y07KYDOOJajRZi0ysGsJd1Fek8Z2U/UmUJd2nXTK2oSv4ecsyAk6HEamJoZ/1F/TKSABxGvFSo7PCLs0qnB6jW+g574IB3RQWxtFLG5RJ3yJvDm2KDAQS3FUJlBwLd3g/nP0ruld6Gy48TZ5zNe8j7H9iUBsy1uIQB20vHdMy++e/+Xlg==
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-ID: <0DFC3135B9A1C442BE43081856FB7718@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR08MB3691
Original-Authentication-Results: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: VE1EUR03FT062.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: e6639e29-133e-4246-78b4-08d85fb0fd49
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: cSfXpWqoRH3UTzDT/8lu2exD9Zu1Nb7yrKmTkCneIDHdIVbqMcn6Vzc0KsORPsWHVGMX5vkumL3J/x1/k6JB2KSnfWpYHUIKJ5HOYbScLMFc+DFVyNJ01P5LLa6adNCiA2LJ41Pp1tlAunZf3iz46mrkiapDoOzwZ9F3wsLmkEabSTU2jeEYLeuw7Di3I766TajZFPW8zD7Gpv8Qu6LUVMwvAYv7p7tlRlp9G3ofHky+ywGVJswO6cza3elslmUiYHfjoANEgZ8p8baAMzVTHM+G2T1HNYROsf8AJxPwgQ3yTV8rykiWiDQzQNSEgRWEgnVxEqT+YbxyTnPNbiu39VVBSZXG+RVMywmrBB6SJXkBITGbufH8FykMSCqyE5EXab+hpZ54WBA4w4qwhvXo3w==
X-Forefront-Antispam-Report: CIP:63.35.35.123; CTRY:IE; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:64aa7808-outbound-1.mta.getcheckrecipient.com;
 PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com; CAT:NONE;
 SFS:(4636009)(136003)(376002)(396003)(346002)(39860400002)(46966005)(33656002)(82310400003)(356005)(53546011)(82740400003)(47076004)(107886003)(4326008)(6862004)(70206006)(8676002)(6486002)(54906003)(86362001)(70586007)(478600001)(6512007)(8936002)(2906002)(36906005)(5660300002)(36756003)(316002)(6506007)(83380400001)(336012)(26005)(81166007)(2616005)(186003);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Sep 2020 11:08:33.4995 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8d5df7e1-d1ee-46db-c461-08d85fb102f0
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: VE1EUR03FT062.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR08MB5509
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGkgSnVsaWVuLA0KDQo+IE9uIDIyIFNlcCAyMDIwLCBhdCAyMDozMSwgSnVsaWVuIEdyYWxsIDxq
dWxpZW5AeGVuLm9yZz4gd3JvdGU6DQo+IA0KPiBGcm9tOiBKdWxpZW4gR3JhbGwgPGpncmFsbEBh
bWF6b24uY29tPg0KPiANCj4gU29tZSBjYWxsZXJzIG9mIHZjcHVfcGF1c2UoKSB3aWxsIGV4cGVj
dCB0byBhY2Nlc3MgdGhlIGxhdGVzdCB2Y3B1DQo+IGNvbnRleHQgd2hlbiB0aGUgZnVuY3Rpb24g
cmV0dXJucyAoc2VlIFhFTkRPTUNUTF97c2V0LGdldH12Y3B1Y29udGV4dH0uDQo+IA0KPiBIb3dl
dmVyLCB0aGUgbGF0ZXN0IHZDUFUgY29udGV4dCBjYW4gb25seSBiZSBvYnNlcnZlZCBhZnRlcg0K
PiB2LT5pc19ydW5uaW5nIGhhcyBiZWVuIG9ic2VydmVkIHRvIGJlIGZhbHNlLg0KPiANCj4gQXMg
dGhlcmUgaXMgbm8gbWVtb3J5IGJhcnJpZXIgaW5zdHJ1Y3Rpb24gZ2VuZXJhdGVkLCBhIHByb2Nl
c3NvciBjb3VsZA0KPiB0cnkgdG8gc3BlY3VsYXRpdmVseSBhY2Nlc3MgdGhlIHZDUFUgY29udGV4
dCBiZWZvcmUgaXQgd2FzIG9ic2VydmVkLg0KDQpUaGUgZnVuY3Rpb24gdmNwdV9jb250ZXh0X3Nh
dmVkIGRvZXMgY29udGFpbiBhIG1lbW9yeSBiYXJyaWVyIGFscmVhZHkuDQoNClNob3VsZG7igJl0
IHdlIG1ha2Ugc3VyZSBpbnN0ZWFkIHRoYXQgYW55IHRpbWUgaXNfcnVubmluZyBpcyBtb2RpZmll
ZCB0bw0KZmFsc2UgdGhlcmUgaXMgYSBiYXJyaWVyIGJlZm9yZSAod2hpY2ggaXMgdGhlIGNhc2Ug
aW4gdmNwdV9jb250ZXh0X3NhdmVkKSA/DQoNCkkgdW5kZXJzdGFuZCB0aGUgZ29hbCBoZXJlIGJ1
dCB0aGUgYmFycmllciBzZWVtIHZlcnkgZmFyIGZyb20gdGhlIG1vZGlmaWNhdGlvbg0Kb2YgaXNf
cnVubmluZy4NCg0KQ2hlZXJzLA0KQmVydHJhbmQNCg0KPiANCj4gVG8gcHJldmVudCB0aGUgY29y
cnVwdGlvbiBvZiB0aGUgdkNQVSBjb250ZXh0LCB3ZSBuZWVkIHRvIGluc2VydCBhDQo+IG1lbW9y
eSBiYXJyaWVyIGluc3RydWN0aW9uIGFmdGVyIHYtPmlzX3J1bm5pbmcgaXMgb2JzZXJ2ZWQgYW5k
IGJlZm9yZQ0KPiB0aGUgY29udGV4dCBpcyBhY2Nlc3NlZC4gVGhpcyBiYXJyaWVyIGlzIGFkZGVk
IGluIHN5bmNfdmNwdV9leGVjc3RhdGUoKQ0KPiBhcyBpdCBzZWVtcyB0byBiZSB0aGUgcGxhY2Ug
d2hlcmUgd2UgZXhwZWN0IHRoZSBzeW5jaHJvbml6YXRpb24gdG8NCj4gaGFwcGVuLg0KPiANCj4g
U2lnbmVkLW9mZi1ieTogSnVsaWVuIEdyYWxsIDxqZ3JhbGxAYW1hem9uLmNvbT4NCj4gDQo+IC0t
LQ0KPiANCj4gQ2M6IEFuZHJldyBDb29wZXIgPGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+DQo+
IENjOiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+DQo+IENjOiBHZW9yZ2UgRHVubGFw
IDxnZW9yZ2UuZHVubGFwQGNpdHJpeC5jb20+DQo+IENjOiBEYXJpbyBGYWdnaW9saSA8ZGZhZ2dp
b2xpQHN1c2UuY29tPg0KPiBDYzogQmVydHJhbmQgTWFycXVpcyA8QmVydHJhbmQuTWFycXVpc0Bh
cm0uY29tPg0KPiANCj4gSSBhbSBhbHNvIGFkZGluZyB0aGUgeDg2IGFuZCBzY2hlZHVsZXIgbWFp
bnRhaW5lcnMgYmVjYXVzZSBJIGFtIG5vdCBzdXJlDQo+IHdoZXRoZXIgdGhpcyBiYXJyaWVyIHNo
b3VsZCBiZSBwYXJ0IG9mIHRoZSBjb21tb24gY29kZSBpbnN0ZWFkLg0KPiAtLS0NCj4geGVuL2Fy
Y2gvYXJtL2RvbWFpbi5jIHwgMTUgKysrKysrKysrKysrKystDQo+IDEgZmlsZSBjaGFuZ2VkLCAx
NCBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pDQo+IA0KPiBkaWZmIC0tZ2l0IGEveGVuL2Fy
Y2gvYXJtL2RvbWFpbi5jIGIveGVuL2FyY2gvYXJtL2RvbWFpbi5jDQo+IGluZGV4IDkyNThmNmQz
ZmFhMi4uM2IzN2Y4OTliOWRhIDEwMDY0NA0KPiAtLS0gYS94ZW4vYXJjaC9hcm0vZG9tYWluLmMN
Cj4gKysrIGIveGVuL2FyY2gvYXJtL2RvbWFpbi5jDQo+IEBAIC0zNzEsNyArMzcxLDIwIEBAIHZv
aWQgc3luY19sb2NhbF9leGVjc3RhdGUodm9pZCkNCj4gDQo+IHZvaWQgc3luY192Y3B1X2V4ZWNz
dGF0ZShzdHJ1Y3QgdmNwdSAqdikNCj4gew0KPiAtICAgIC8qIE5vdGhpbmcgdG8gZG8gLS0gbm8g
bGF6eSBzd2l0Y2hpbmcgKi8NCj4gKyAgICAvKg0KPiArICAgICAqIFdlIGRvbid0IHN1cHBvcnQg
bGF6eSBzd2l0Y2hpbmcuDQo+ICsgICAgICoNCj4gKyAgICAgKiBIb3dldmVyIHRoZSBjb250ZXh0
IG1heSBoYXZlIGJlZW4gc2F2ZWQgZnJvbSBhIHJlbW90ZSBwQ1BVIHNvIHdlDQo+ICsgICAgICog
bmVlZCBhIGJhcnJpZXIgdG8gZW5zdXJlIGl0IGlzIG9ic2VydmVkIGJlZm9yZSBjb250aW51aW5n
Lg0KPiArICAgICAqDQo+ICsgICAgICogUGVyIHZjcHVfY29udGV4dF9zYXZlZCgpLCB0aGUgY29u
dGV4dCBjYW4gYmUgb2JzZXJ2ZWQgd2hlbg0KPiArICAgICAqIHYtPmlzX3J1bm5pbmcgaXMgZmFs
c2UgKHRoZSBjYWxsZXIgc2hvdWxkIGNoZWNrIGl0IGJlZm9yZSBjYWxsaW5nDQo+ICsgICAgICog
dGhpcyBmdW5jdGlvbikuDQo+ICsgICAgICoNCj4gKyAgICAgKiBOb3RlIHRoaXMgaXMgYSBmdWxs
IGJhcnJpZXIgdG8gYWxzbyBwcmV2ZW50IHVwZGF0ZSBvZiB0aGUgY29udGV4dA0KPiArICAgICAq
IHRvIGhhcHBlbiBiZWZvcmUgaXQgd2FzIG9ic2VydmVkLg0KPiArICAgICAqLw0KPiArICAgIHNt
cF9tYigpOw0KPiB9DQo+IA0KPiAjZGVmaW5lIE5FWFRfQVJHKGZtdCwgYXJncykgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgXA0KPiAtLSANCj4gMi4xNy4x
DQo+IA0KDQo=

