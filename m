Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CBFBF201E0E
	for <lists+xen-devel@lfdr.de>; Sat, 20 Jun 2020 00:34:36 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jmPaG-0007TM-IP; Fri, 19 Jun 2020 22:34:04 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=8bIi=AA=epam.com=volodymyr_babchuk@srs-us1.protection.inumbo.net>)
 id 1jmPaE-0007TH-Fj
 for xen-devel@lists.xenproject.org; Fri, 19 Jun 2020 22:34:02 +0000
X-Inumbo-ID: f72248c8-b27c-11ea-bc14-12813bfff9fa
Received: from EUR02-VE1-obe.outbound.protection.outlook.com (unknown
 [40.107.2.83]) by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id f72248c8-b27c-11ea-bc14-12813bfff9fa;
 Fri, 19 Jun 2020 22:33:58 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UF7llm1WkqnZ0l+BeFEgw7Cbrmzx0qEoO4K/Mjb1Cg7ALF2V8jQQsNprY4rugOIvzF3eRBBLRRppg+mNALphT/AH4qYpVOmFI21mvQObF/SCnEnUIJ/VAksA0Kex3O8DKBkc/1QrJ+oT/8Fw8gHVBUBL/84yyESIsv+8yeLS/BPvgv5wZkfNQ3SB0li1FNnn9z9zN1Yyf6Uc+Xu3lYf/Bn4ViwxgTSm5fNOMieTZjRTFqpSK/Bob6mhAu3MOVawJyjb7jCflZXbe5ZR+rMG6SU4OtBJDzt1fvCJyIzlkHf7ReEiLQEOq7i/x3MQP3VYNIOYfhL41z+jboJqBJFha1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1m/qnUjI/zR2Dk1NrXmpLkzO7PmIHROqTQgtwyhxXcE=;
 b=NwoYfgER4lSZBqUqaguMOzakgzA+t2SmS1/WiZ1UhoCJv/PvPSHTcZC5RH9luNujhWD2BYvbV/JOu1VYFwr67JQViDHdNyp0begNQ4m8uv3jHtPYGLMabC+1wEwJ9Rkh+o/w7TrR18rwF5O+OQBauWN69aQTUueOBJnqrgGhbYmqYFV5ZYZy36HEEu5DpkZ51JKxM0EtxgM9/c8e0NRZUwZO2kUWSO8UpPXKqGGsGkcjqnMA95Y8VwIyCVF69AApwN9wzXiXwesJ1jKfC4nXZEKMxIt4zFRcuTwnMW8x3AeOEqAz/SI4odmwt4ekoFOfphdd8DQ0Rrg5djsj6xhntg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1m/qnUjI/zR2Dk1NrXmpLkzO7PmIHROqTQgtwyhxXcE=;
 b=wC7lQCDBv8A7j4Gnqi0Y78c6sImW770/UAWLMiFk+Ls1sp/t+ettR7jngChpeRFjyI4djCM773mjqUEyJrT9bVbuSyErzow84FmCSgT/D9VGKGITNHtL0U08K41bD9BGZSy6cyugOTpS/TniIuPbmMgxcp3mjPSpqlnETCYJpYKq+BWmmi5bavVIOvkQiNak0vKvOdJtuj/V0B1csQ/l5SjrJKrPhh+iDGqtLEtiRy1KqGggJM1p/Gh3R0VfTQybtSEQhuRaxsTFStA/m+Gb4wXMGFeCAFivtDNZp5wobBL2NKgdz5ofWibXtFyItk29dlc1IHVlDPTyNSr0ckdqoQ==
Received: from VI1PR03MB2926.eurprd03.prod.outlook.com (2603:10a6:802:35::28)
 by VI1PR03MB6304.eurprd03.prod.outlook.com (2603:10a6:800:136::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3109.21; Fri, 19 Jun
 2020 22:33:55 +0000
Received: from VI1PR03MB2926.eurprd03.prod.outlook.com
 ([fe80::95fd:55d9:421b:1f37]) by VI1PR03MB2926.eurprd03.prod.outlook.com
 ([fe80::95fd:55d9:421b:1f37%7]) with mapi id 15.20.3109.023; Fri, 19 Jun 2020
 22:33:55 +0000
From: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
To: "pdurrant@amazon.com" <pdurrant@amazon.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: [PATCH v2 0/2] optee: SHM handling fixes
Thread-Topic: [PATCH v2 0/2] optee: SHM handling fixes
Thread-Index: AQHWRom3ZYG+JNafjk+6b4hYNOXtgw==
Date: Fri, 19 Jun 2020 22:33:55 +0000
Message-ID: <20200619223332.438344-1-volodymyr_babchuk@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: amazon.com; dkim=none (message not signed)
 header.d=none;amazon.com; dmarc=none action=none header.from=epam.com;
x-originating-ip: [176.36.48.175]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 06b4d038-271b-41f4-8130-08d814a0d9fa
x-ms-traffictypediagnostic: VI1PR03MB6304:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <VI1PR03MB6304F30A8EB824B2EDA830AFE6980@VI1PR03MB6304.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6790;
x-forefront-prvs: 0439571D1D
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 2Dl+wINLZebK0+lGwRD60FQpuH7//LxpZtSqJMB4ukFzKgBRd812/qI9YpptTfFT2hO8PAhiN+ZWUbJ7tIevHvum9474xnDyX3QxQTLk5d89LkYBPYDJvZPp4KyQ42qSytNHV1bE2Vd/2DXFQljhL8Gl0fK5Ij1jqjxN40XIRYsL2TS3pTmCrMZy2i3EANQ8riHzDr5q2swK6NhO+ei/Up/hB2ectFbzDUP/XVF0C6+Y78oQXWBKHNI3xvVqPhK0WHnG4fPECyBN+Mi6k61fducHRTPum3lbJV5ZKBwhKXtSgzovqgnAdWZ4Ng9vXwj1
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR03MB2926.eurprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(4636009)(376002)(396003)(366004)(39860400002)(346002)(136003)(66946007)(66476007)(76116006)(91956017)(66556008)(64756008)(86362001)(5660300002)(66446008)(2616005)(4326008)(36756003)(6486002)(478600001)(71200400001)(4744005)(2906002)(316002)(1076003)(186003)(54906003)(55236004)(8936002)(26005)(6506007)(110136005)(8676002)(83380400001)(6512007);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: ie6HgA07Il1Jxz06XWxcXJO5tkoOAksAaF/mFNzRAO0iFi0OaM+dctRZmFUQmvw7PSU2ZVjahQyJCjjXCSYNl6CsnrBG2EzlhznO3q2/S/CFtjOZgCeoWX8W/Gsnb+egD64pgBlKbeCd7XMuYizlPqqp9e/Q5W8Caa7l6sZ+lDSYWVqSl185chC2Jd3BBD5HBOmEBbwZ0HmhStjTRAkghQ/ddR41EquovaPfeBb8jlq6HcQawkxLwTOl9NSdAmMRzh636oVr1DmAWRjMbVLYj7IFso8FfwXyRKrl7IXh+djl48hLMNW+ZXwSkCwqnPTa5DbKOPalyS1rNSgTEgM9Hi9V7SbmAGWqCaktkShmcYl59YcCh9h+RZrtI2jWyhOsSX7rDhWOhTtd7y7tlrjGp/+YrCHgnKm9iBWjWTx7iu+miM9pBNq8jN9nyyKhWAbsTSlxAqCDI71ewp/BkTw4lhLqj8MoycmVjbqs5D2EPN0=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 06b4d038-271b-41f4-8130-08d814a0d9fa
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Jun 2020 22:33:55.6491 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 1yXNtDaX35/OR9ThAQKEl3O16dD9YHm4t+P8s25CQ/u79UeNcC6vQEWIuCNIzi9QEuCeRgoxxa0cmoNTwgTQ22RzDOxkyjTMtwiusocaedI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR03MB6304
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
Cc: Julien Grall <julien@xen.org>,
 "op-tee@lists.trustedfirmware.org" <op-tee@lists.trustedfirmware.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Stefano Stabellini <sstabellini@kernel.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

There are two patches that previously was mailed separatedly. Both
patches fix issues found during testing the OP-TEE 3.9 release.

Julien and Stefano suggested to include this patches in Xen 4.14
release, because optee support still in the preview state and those
patches provide no new functionality, bugfixes only.

Volodymyr Babchuk (2):
  optee: immediately free buffers that are released by OP-TEE
  optee: allow plain TMEM buffers with NULL address

 xen/arch/arm/tee/optee.c | 59 +++++++++++++++++++++++++++++++++++-----
 1 file changed, 52 insertions(+), 7 deletions(-)

--=20
2.26.2

