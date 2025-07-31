Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D8D1CB17A21
	for <lists+xen-devel@lfdr.de>; Fri,  1 Aug 2025 01:39:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1066586.1431768 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uhcr0-0003gs-ER; Thu, 31 Jul 2025 23:38:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1066586.1431768; Thu, 31 Jul 2025 23:38:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uhcr0-0003ee-BQ; Thu, 31 Jul 2025 23:38:30 +0000
Received: by outflank-mailman (input) for mailman id 1066586;
 Thu, 31 Jul 2025 23:38:28 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=V7hc=2M=boeing.com=Anderson.Choi@srs-se1.protection.inumbo.net>)
 id 1uhcqy-0003eY-BQ
 for xen-devel@lists.xenproject.org; Thu, 31 Jul 2025 23:38:28 +0000
Received: from clt-mbsout-01.mbs.boeing.net (clt-mbsout-01.mbs.boeing.net
 [130.76.144.162]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 728226ff-6e67-11f0-a320-13f23c93f187;
 Fri, 01 Aug 2025 01:38:24 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by clt-mbsout-01.mbs.boeing.net (8.15.2/8.15.2/DOWNSTREAM_MBSOUT) with SMTP id
 56VNcMqh025200; Thu, 31 Jul 2025 19:38:22 -0400
Received: from XCH16-04-11.nos.boeing.com (xch16-04-11.nos.boeing.com
 [144.115.66.89])
 by clt-mbsout-01.mbs.boeing.net (8.15.2/8.15.2/8.15.2/UPSTREAM_MBSOUT) with
 ESMTPS id 56VNcFrl025151
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
 Thu, 31 Jul 2025 19:38:15 -0400
Received: from XCH16-04-07.nos.boeing.com (144.115.66.85) by
 XCH16-04-11.nos.boeing.com (144.115.66.89) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.57; Thu, 31 Jul 2025 16:38:14 -0700
Received: from XCH19-EDGE-C01.nos.boeing.com (130.76.144.197) by
 XCH16-04-07.nos.boeing.com (144.115.66.85) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.57 via Frontend Transport; Thu, 31 Jul 2025 16:38:14 -0700
Received: from USG02-BN3-obe.outbound.protection.office365.us (23.103.199.145)
 by boeing.com (130.76.144.197) with Microsoft SMTP Server
 (version=TLS1_2, 
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.26; Thu, 31 Jul
 2025 16:38:12 -0700
Received: from BN0P110MB2148.NAMP110.PROD.OUTLOOK.COM (2001:489a:200:19b::17)
 by PH1P110MB1651.NAMP110.PROD.OUTLOOK.COM (2001:489a:200:18b::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8964.30; Thu, 31 Jul
 2025 23:38:11 +0000
Received: from BN0P110MB2148.NAMP110.PROD.OUTLOOK.COM
 ([fe80::394b:7a34:da07:485d]) by BN0P110MB2148.NAMP110.PROD.OUTLOOK.COM
 ([fe80::394b:7a34:da07:485d%4]) with mapi id 15.20.8964.026; Thu, 31 Jul 2025
 23:38:11 +0000
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
X-Inumbo-ID: 728226ff-6e67-11f0-a320-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=boeing.com;
	s=boeing-s1912; t=1754005102;
	bh=liAJyxBBYdYCnO6+xFRYsxg1Jl/X9OaWGiNH6gohnwo=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:From;
	b=V+GHh4MZ9lSJOaDMCzQ21qkMESLkm1z4pietdxMQoyyvUYXvAm7iPwhn0cxm+RTLi
	 KtwUB/4rOcEhOzw7XpNkKLSBuSnUL6NhsnHSv5WIZP0zX5RiL5Zwibox9u5MnwLou3
	 WeE0xq3lfM/CCN5hMJhf9rRvqlK+y+BlDswB+ZpNhRI6yKTLHuZS1vO5MkSiAxq/wQ
	 oCS4gmRIdG/R7sAHlFulLSeDaHQiK6smdrBUiU1vM9721cI6ip1J3NCeaw5l9CzKNt
	 wPTbYeRyamTvzsiQH0L2OW7NF1VkavJ1tXkvZF40TqMGa6RTmy0GtlAqDpt+V+3tu7
	 0n7sfDXPt0ZuA==
ARC-Seal: i=1; a=rsa-sha256; s=arcselector5401; d=microsoft.com; cv=none;
 b=uGDtxAwYYKX3c8Y1x19zAqnrQXHcBDtG3rrGysXO/xx0PbNWDu3lOHQv6UrBuTm0DslaU4aMbxhFqncUtTiAxNNmV74oDhakg0kkBAVBCo67aadEcL0LdQStpEiF/4I/3KwShvQX651rrX0J6D/P5MtZTN1JQlviGtPc916dCE+Z0rtyBmzZf7GBlX/Zl2Z6mVMvzqkVaQejR/UwanGJWTw5C+9jfXPzdYdEyjoevsSGUkDiPRv/8dBrHXl4nt69WOZOn6k0ZhYwTmxw6eooJDBht93mrA6jRjzyKB4LPtEC/rOk8f0VJF6N5//s3XEPtYyvtCBaLjhYJlQOm/KojQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector5401;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=liAJyxBBYdYCnO6+xFRYsxg1Jl/X9OaWGiNH6gohnwo=;
 b=IAvgSl4vBLU9H/mPwTXvjeNxhNajOmoht2q4MQge2BfUMup3waX7V3zIN73Dt+VmWXqYrz7EGxgfbuCmaE4ci2GYxrhoe7DsWPeac8kUnWXknxxq8gQHCK0KeCTHM7Z3AvLEkKtgu75eM8EWu+76RO8UXCU8/0La/O/4QOY0pQHF/dsXTYPWzfwVJgFo/dJIsRgvV1RBuQPdcgvghrTY53slTuGxyLS0vQkZNRkoG3+hyEe/u728AtSldPFySTVqGc73JBGqx/Y2Dky5BRDQyRES34j3y5EZ7MnPt6eXgaSpFD1FtnHk4993VEe8BTGilKzHACnk5ZKFPDdHDm5C8Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=boeing.com; dmarc=pass action=none header.from=boeing.com;
 dkim=pass header.d=boeing.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=boeing.onmicrosoft.com; s=selector1-boeing-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=liAJyxBBYdYCnO6+xFRYsxg1Jl/X9OaWGiNH6gohnwo=;
 b=CtxHsqfyt0RwJ7E9veF2Kg2gRs5NXVzSNlnGW6qtEzfxNlE+wS0pivX6ijBd2wLSt/5tKFkyNBCganQzV4TSpkI7/0hFbn1hxR0rOGJeuvn3II7UR6mO9+ToKeg8I2aKFb7UjRyJIDb8IRtPVcZgBomQbHnDY9WcgRCWGLPO/3I=
From: "Choi, Anderson" <Anderson.Choi@boeing.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>,
        Dario Faggioli
	<dfaggioli@suse.com>,
        Stewart Hildebrand <stewart.hildebrand@amd.com>,
        "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: "Weber (US), Matthew L" <matthew.l.weber3@boeing.com>,
        "Whitehead (US),
 Joshua C" <joshua.c.whitehead@boeing.com>,
        Nathan Studer
	<nathan.studer@dornerworks.com>,
        Stewart Hildebrand <stewart@stew.dk>, Juergen Gross <jgross@suse.com>,
        George Dunlap <gwd@xenproject.org>,
        "xen-devel@dornerworks.com" <xen-devel@dornerworks.com>
Subject: RE: [EXTERNAL] Re: [XEN PATCH v4] xen/arinc653: fix delay in the
 start of major frame
Thread-Topic: [EXTERNAL] Re: [XEN PATCH v4] xen/arinc653: fix delay in the
 start of major frame
Thread-Index: AQHb/bnIPb194HVr+k6yT2nNqi2v3rRM33fggAAJcQCAAAD+wA==
Date: Thu, 31 Jul 2025 23:38:11 +0000
Message-ID: <BN0P110MB214803D0772529374518793A9027A@BN0P110MB2148.NAMP110.PROD.OUTLOOK.COM>
References: <88a17c994f85270982e03912c9c9db916ca69d4e.1753395268.git.anderson.choi@boeing.com>
 <69b04328-59a1-4186-837e-19d608054aa7@amd.com>
 <c6ef1aa7fbb4a9e92896f4454682ba0d7bf9cfb3.camel@suse.com>
 <BN0P110MB2148F944A565E5031260501E9027A@BN0P110MB2148.NAMP110.PROD.OUTLOOK.COM>
 <ecb7767b-bf51-4914-8efa-43be9412338f@citrix.com>
In-Reply-To: <ecb7767b-bf51-4914-8efa-43be9412338f@citrix.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=boeing.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BN0P110MB2148:EE_|PH1P110MB1651:EE_
x-ms-office365-filtering-correlation-id: 429da1e6-044e-41b4-f89e-08ddd08b4ff5
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?cGJTOFl1YnZvVGxtRWJ5dDlXUUJ6RVN4KzJ5Rjd6VGhFZERNRUxBalJJK3p4?=
 =?utf-8?B?Z2Ewdm9SSzlXc0JwLzZOTXVmZzIrVE84Z1hHS3RKRUFjSUNKOGJRUHhKa3Y1?=
 =?utf-8?B?TWRINDlLY0EvTXh4MkJtbjRyb0lnZ0JJZUlIZGp1b08xalM5TXJFYVlGVGgz?=
 =?utf-8?B?U3hnVllLcjZKOFlSM2g0UzdSd2tOd2NsWFNmNDMzc0VlM1Z5OWh6azNtOXNn?=
 =?utf-8?B?MTJjdnNSUmljRndQN051bEp6UzhFcU9JSXVzdUE2MDI1Y2c3Q2xLWUZPaUJP?=
 =?utf-8?B?ck9uWUZ5V1NhQ0VNT0NkeDZweTJqNkxyUTM0WjIra2QvMGU0ZStJdGR6aGdD?=
 =?utf-8?B?Rzl6WXZEbUNiKzFvaytFUVF2akJNdEY0b3RkVWV6cXcvK09LbVVWWFpXWFY0?=
 =?utf-8?B?MDltZEh1KzVhQjNRSkZodlUrTlBOMjhxRlZielFOUGpma1BqVE5RN0tPc3dN?=
 =?utf-8?B?c0hXMyttdWR3WElCcHF3WWc2Z1Bxejg0Rm02RE85TG1MTi8yanA2WVJ1Zkxt?=
 =?utf-8?B?RXM4a0JNODI1WnJhTXRSUjEvL0IrM0YzR243SFd4KzFGSnFiK095SXhUSWY2?=
 =?utf-8?B?NXRDeFBXeUNMMng1TC90MkVmTW4vNWRTZmJvR2pjNnh3SU5PaDUzcElCcGNj?=
 =?utf-8?B?N1FqNlZoK0JjMkV5RjlrejFuT0YyM2ZFT25QblIvVmtZdEFIVjFCQlkrY3Fs?=
 =?utf-8?B?YlVxTDJhYmFPYTRzc1ZyUVZsaFZQdlJlNFVGR0ppM0FmOHhjNkxsVkJkdDd6?=
 =?utf-8?B?ZjJhUjVCM1RkY2M1N2F2eUVUUFpWN2Era2pjNmo2djB1cUIrVHZETzdlWGpq?=
 =?utf-8?B?S3pxQzZRRTcxU3kxb2hIcE5rNnJzeklnSG5OeVFhRG9jcWZ6a1VCM3FZVFpY?=
 =?utf-8?B?aFFsUVpndjBFRzAyNXNzWUxWanVwc3JUL1l1MDIzL0VIWE1VZzdhQTVyQWVJ?=
 =?utf-8?B?T0lLUk9CYVplWXYzZHVHZkNDK2ZSbUtCVXdrbnFjUXQ0K1FFeTlLMThpRHVT?=
 =?utf-8?B?bFBoWWxRL29LMSs4ZlJoTHl6Tm1BMC9tcjFnY0VBdEM3VGhJN2ljNW14VnNo?=
 =?utf-8?B?eHFVWTVYbm81bnJjeHByMnVUeU9CYkQvQllESy9QdjJrdGsyS29YY3doa1Ar?=
 =?utf-8?B?WTdzRjNlS3A2aHBqQkwwTmFCVzA1K0NnQ2t5T2MxckdwTG1URUN4RmJZcmlQ?=
 =?utf-8?B?VDZuNDJIQU1TM0JaMnNCVnBaNituRU54bXdLbkVsVzNOVHovd3ZUM1pxenpl?=
 =?utf-8?B?YjNFWUQ1Rjh4eEtZNnZ0dkE2MzZ2cGhRRGp4TUFsalB3U0tVL0ZOZjR0WWdi?=
 =?utf-8?B?dStHajYreFFBUHFtUUFRanE3QlJWZDRCekpITVM2d3FZV2VFRllyNmIybERa?=
 =?utf-8?B?V0NIeENuWUVjU1prSXgvc0h3N2t4N0IxeTkwb2hLK1J6OCtCTEUvajRoNjBu?=
 =?utf-8?B?WTdrRnRpdHQrVjQyVkQvZkEwdGE4blVkcUlsYk9pTGYrTTllbjZFRVpmanN5?=
 =?utf-8?B?S1Z6a3Z5ZTM5QXVQMWRIamxNNzhKeTQ4bWFEcTlINHlkczY1SnQ3aFNKZHNU?=
 =?utf-8?B?bHA4N0FtcndZeWV5VlBSMk8zK1NQV0hQMWw1YVJTQi9LZ2lvbXg1QTVGZG9w?=
 =?utf-8?B?TWhWTDduTkxFWnhmQ2ltaCtiY0tUQ1ErbUUrTUlWdzhsQU5jaVJ1a001S3k3?=
 =?utf-8?B?eENDMlh6azcrM0xFS0FZcVB4OHB2Znh6eERicW5ZYTBZVDJiL2JtU1d6dHRR?=
 =?utf-8?B?cUgyL2ZtQWZWUmtxdjdrd2hucFZ3RXpYZnRtY21TcGZtcmg3bDQ4RGQ3SVpI?=
 =?utf-8?B?OWlFc0twaWVEZEUrcDV5MXJxZVpVVzRvY2o3dFZVMHFVbkhxb1VIWDF3d29j?=
 =?utf-8?B?azhEOURGV1lWdzg1SnRPSFhwZ1dNNkYrTW9UQXl6QStOZXZnQXJ1WFBVMHF4?=
 =?utf-8?Q?rYJ1okM285I=3D?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN0P110MB2148.NAMP110.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?ZGJqSzlUSGtlQWxrYW1nYWdUcjJ6c3pONFQwejIrdkZZWUdNWGFuZCtrVjZB?=
 =?utf-8?B?Zk4yZ2NHbWdjVSt2REtLWk5YSWxuZEtESE9vV095R0ZBUTl1c1N0SGwrekdJ?=
 =?utf-8?B?dmdZcnhEakJHTEFoWFYwY2pIUmFFSkFlTEI4TDBOWGQ0VjNIa3VVdVdDZU9S?=
 =?utf-8?B?ZnY3MEN2cW9lci9KZHhTbGZVM2tyc3llam5ZbU11UitaVXVKVVcwTFZQSzRB?=
 =?utf-8?B?NXp6Q01iSE05WEpXMW5rc3pxSDJQWVozN2ZlcVVqMnA2b044RlJQTmpjdlVG?=
 =?utf-8?B?VExRbzIwMUdBZ0xmdThER09zYjA4UnIwTG1iZFhreVFTT0tOSkNPMnZLZSt6?=
 =?utf-8?B?RHNXRFllZ0dMRnlsWG9HaGtYeTF3eDNMWWdjam54RWZLTHJTMEZTcHJQTTFa?=
 =?utf-8?B?aThpeVhtU2NMcDdqRGJVc1VQWEJCdjh5NTF6alA1Y0RHUjFpV3loT3RITmtK?=
 =?utf-8?B?eS9STmVuZEtmTUxtLyt3T2NZcWhrUnAzQkhzc0dVaXMwZzRqUFFKdTQ5Rllw?=
 =?utf-8?B?RWZ3MU4rdmswYVRMajJHMEFGdlVNYjl3enpDRUdLZFF3ZExqbjUrMGN1TEVw?=
 =?utf-8?B?VC9CMUdaU2p5NVBDNnRDbnRlS2lkRStQaTJFZWwvOWZUa1haR0UyNVFpTCtE?=
 =?utf-8?B?SjRoWDVRWW41V04vcDVEV3k4Z3hLc1U5WGoxbnpkOWZkYkd4YmtiODlaVURP?=
 =?utf-8?B?RXIrWVlZNTQ2Z25vVmc3U2FGZFI0aHJQNGQvWGRCVzc2U2h1dUcwK2VqK1BQ?=
 =?utf-8?B?T3BZVjF4MS9jZWVpQzhCVStqLzI0UUZsbG9ubzdPcVlOaUZ1QUFSQk9rVGpW?=
 =?utf-8?B?T1h5SGd4aTlSdWJ6azRVbElGZXBSQXJvVDNyOXFrbHk3eVZPQURiR0x1M3Z0?=
 =?utf-8?B?WW0yTXhLUFE2eFlKZVVhZUZaUDVFYlR2MHFDSnozNHl5YXNXb0FDUzRvVE1Q?=
 =?utf-8?B?NFNGN3hUVWcwR0NkSFlXV2JSRUNFSkN1SC9QWEhqbmNPS29qbHBoM3VBbzM4?=
 =?utf-8?B?eStYNUI0MGN5a2JFUWJ4QzVPVEQ4ajlXcTdndXM1TWhOaFQ0d0tIS0VQSEZP?=
 =?utf-8?B?WkdhL05DbHp2TVk3VDIwa2hVL0xjVkFEUUVvNERNSDRQTmFWclVJQW0zUFpP?=
 =?utf-8?B?dkxYYUU5dmx2NzdlbEFTYjM1OTl1Qks3NVp5UjVUWlNVTFpxeEJSWC9HTWN1?=
 =?utf-8?B?Z3RaSDJ5dkpGMit1K211TTl5MHN2NUpYelQwSHZHN3YvSHltaEZSVmYrMEdU?=
 =?utf-8?B?bW1FdFRscEExUmRMR3NsbzBKMTloZWtWWGw3aGVUL3l4Vzg4aXU4eGJzRjhQ?=
 =?utf-8?B?MUdpT0ZUeWkxWXQ3UWRPcUw0MEVVUVJxVnNWTEY1eUNMdTRWQWZQbWYxcVRX?=
 =?utf-8?B?WjA2QWVIcEtzVWxpdGVZalZveDFkajM4Z1U2N3hneE5zYUIxUGwwak01S0Jh?=
 =?utf-8?B?YmU5UkovMC93VVB0L2VkQ3JWb1FsVGZPbFlPQlZmd1VGS2FvWDk3TUlBU045?=
 =?utf-8?B?Uml6NjhNeENNd2U1U2E0Nkd1cDg0WXRPL0hQTlpacWE1NkxOMHZkZWM4OG9t?=
 =?utf-8?B?QWppVkZoUjJ0ZloxZ3lNQkIwZlJpWWRsQWF3QVU1eWZ1czJJRFdEcEdUSlBl?=
 =?utf-8?B?MFNRMjVKcjVhVEsrVXI1OU94MmdEMUdraVFxZXlZZmxBTFN2NWpwRWxmdEZt?=
 =?utf-8?B?RXF1emFpUDF3bHIxV01oY3UvSjQ5bUViVjF3blVuaVE5WVZpbTVNRTByVUhS?=
 =?utf-8?B?S25OV3lhNmtBMnNVd3Y3Ky8rTFUvQUM3dHJzQ3phZWZiWG5ncjczRjJabUtx?=
 =?utf-8?B?TWpMZXRNZGZEeVJ4cEFPL3FnN0I4b3NjQjVTa0RQRVFleTY5N2NjU28weTFr?=
 =?utf-8?B?bFE4WE1HRnZjOGp2Rk1tRnlTZjRDRHNiK205MU85YU5la2NhYkdKMlZCZEw2?=
 =?utf-8?B?OVAxbWYwYUFhWmVCQW9jWEVOdDFwMGc3K3VMbWdPTytZUWZpRk9TRWltNFIr?=
 =?utf-8?B?R1ZpMGUzR0Q5ZFdGUnh4R05Ic0FKN1NYQ3pBcHJDVE5vRVZxUEJXaFJkL1Ns?=
 =?utf-8?Q?P8GMwD?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN0P110MB2148.NAMP110.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 429da1e6-044e-41b4-f89e-08ddd08b4ff5
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 Jul 2025 23:38:11.7014
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: bcf48bba-4d6f-4dee-a0d2-7df59cc36629
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH1P110MB1651
X-OriginatorOrg: boeing.com
X-TM-AS-GCONF: 00

QW5kcmV3LA0KDQo+IEVYVCBlbWFpbDogYmUgbWluZGZ1bCBvZiBsaW5rcy9hdHRhY2htZW50cy4N
Cj4gDQo+IE9uIDMxLzA3LzIwMjUgMTE6NTIgcG0sIENob2ksIEFuZGVyc29uIHdyb3RlOg0KPj4g
RGFyaW8sDQo+PiANCj4+PiBPbiBUaHUsIDIwMjUtMDctMjQgYXQgMjE6MjggLTA0MDAsIFN0ZXdh
cnQgSGlsZGVicmFuZCB3cm90ZToNCj4+Pj4gT24gNy8yNC8yNSAxODozMywgQW5kZXJzb24gQ2hv
aSB3cm90ZToNCj4+Pj4+IEZpeGVzOiAyMjc4N2YyZTEwN2MgKCJBUklOQyA2NTMgc2NoZWR1bGVy
IikNCj4+Pj4+IFN1Z2dlc3RlZC1ieTogU3Rld2FydCBIaWxkZWJyYW5kIDxzdGV3YXJ0LmhpbGRl
YnJhbmRAYW1kLmNvbT4NCj4+Pj4+IFN1Z2dlc3RlZC1ieTogTmF0aGFuIFN0dWRlciA8bmF0aGFu
LnN0dWRlckBkb3JuZXJ3b3Jrcy5jb20+DQo+Pj4+PiBTaWduZWQtb2ZmLWJ5OiBBbmRlcnNvbiBD
aG9pIDxhbmRlcnNvbi5jaG9pQGJvZWluZy5jb20+DQo+Pj4+IFJldmlld2VkLWJ5OiBTdGV3YXJ0
IEhpbGRlYnJhbmQgPHN0ZXdhcnRAc3Rldy5kaz4NCj4+Pj4gDQo+Pj4gT2ssIGNvb2wsIHRoZXJl
IHdlcmUgdmVyc2lvbnMgb2YgdGhlc2Ugc2VyaWVzIHRoYXQgbXkgZmlsdGVycyBkaWQNCj4+PiBt
aXNzLCBhbmQgdGhhdCdzIHdoeSBJIHJlcGxpZWQgdG8gdjEuIDotLw0KPj4+IA0KPj4+IFdlbGws
IHNjcmF0Y2ggdGhhdCBlbWFpbCwgYW5kIHNvcnJ5IGZvciB0aGUgbm9pc2UuDQo+Pj4gDQo+Pj4g
UmVnYXJkcywNCj4+IEkgYXBwcmVjaWF0ZSB5b3VyIGZlZWRiYWNrLg0KPj4gDQo+PiBDb3VsZCBJ
IGdldCB5b3VyIEFDSyBmb3IgdjQgcGF0Y2ggYXMgd2VsbCBhcyBmb3IgdjE/DQo+IA0KPiBJdCB3
YXMgY29tbWl0dGVkIG9uIE1vbmRheQ0KPiANCj4gaHR0cHM6Ly94ZW5iaXRzLnhlbi5vcmcvZ2l0
d2ViLz9wPXhlbi5naXQ7YT1jb21taXQ7aD1mMjkyN2Q4MzQzYWVmNzE0MzM5DQo+IGZhNDU1MDc0
YmY1NmQyYjg3OGIzZQ0KPiANCj4gYW5kIGJhY2twb3J0ZWQgdG8gNC4yMCBhbmQgNC4xOSBhbHJl
YWR5Lg0KPiANCj4gfkFuZHJldw0KDQpPaCwgdGhhbmtzIGZvciBzaGFyaW5nIHRoZSBsYXRlc3Qg
c3RhdHVzISBJIGhhdmVuJ3Qgbm90aWNlZCB0aGF0Lg0KDQpIYXZlIGEgZ3JlYXQgZGF5IQ0KDQpU
aGFua3MsDQpBbmRlcnNvbg0KDQoNCg==

