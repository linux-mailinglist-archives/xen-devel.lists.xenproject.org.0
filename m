Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A03BB960A9
	for <lists+xen-devel@lfdr.de>; Tue, 23 Sep 2025 15:38:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1128387.1468756 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v13DR-0004GY-Uv; Tue, 23 Sep 2025 13:37:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1128387.1468756; Tue, 23 Sep 2025 13:37:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v13DR-0004EK-RI; Tue, 23 Sep 2025 13:37:57 +0000
Received: by outflank-mailman (input) for mailman id 1128387;
 Tue, 23 Sep 2025 13:37:56 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+SkI=4C=epam.com=Mykyta_Poturai@srs-se1.protection.inumbo.net>)
 id 1v13DP-0004EE-VL
 for xen-devel@lists.xenproject.org; Tue, 23 Sep 2025 13:37:56 +0000
Received: from DUZPR83CU001.outbound.protection.outlook.com
 (mail-northeuropeazlp170120005.outbound.protection.outlook.com
 [2a01:111:f403:c200::5])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 810c698c-9882-11f0-9809-7dc792cee155;
 Tue, 23 Sep 2025 15:37:53 +0200 (CEST)
Received: from PAVPR03MB10102.eurprd03.prod.outlook.com
 (2603:10a6:102:30d::12) by PA4PR03MB7150.eurprd03.prod.outlook.com
 (2603:10a6:102:f1::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9137.20; Tue, 23 Sep
 2025 13:37:49 +0000
Received: from PAVPR03MB10102.eurprd03.prod.outlook.com
 ([fe80::b8c6:f37a:987a:beb]) by PAVPR03MB10102.eurprd03.prod.outlook.com
 ([fe80::b8c6:f37a:987a:beb%7]) with mapi id 15.20.9137.018; Tue, 23 Sep 2025
 13:37:49 +0000
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
X-Inumbo-ID: 810c698c-9882-11f0-9809-7dc792cee155
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=c8E7FtGdj+kUmYNXDFZ2KuRcXT66gY/vc0Cb9hc6xmgOnerPBx6URFQ8RN8MlLjZD0alebGxi3ISOp3/4VlJ7SVCc/WUbGl5RtZ4UMfy8m9gxaiQ2D3suVnhnsBWTcPgjXtG6BufIg1ZcTNa6mKjzSd6qPcYg9dMaMLx2lb/emwcHT8IavZk+9YnYM5hiTQRjad3HQyRctw3+DwLXezDEpb/WP20SZswj+PuinNINKMUq8/4XFuM2Emv1DNWuznwmPXrPNTv9JoxCWT8oMEmYgg9sneLieriEauZljFASb9gde+T6Dxge3qY6ROA5R3HfnJbN79IkRn6Xub/ljGtkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2xODpB8sHvEl/yb200BnZDDp3n6ihKEeBe5isyzfX0s=;
 b=pbY8Voeppg3IPRXtUEHKnZfCrB8PYk/W+2N9V36P6rjk79ra1MsY51GKOjLDXUMJrjaCr8K6/8Lnx4eiL868le30BfyU9E8bi0qMuKCZy0AShDWDxafTJH0MBH1ufqClAxkcjdAaVXUT9WLt5SneuxXeCFOMqR4lXqlpT1dJjBfWmCFMGWndWzikulNXb55Ad168NoGy9Ydjdd0U6TSRoYF/LaG+cN8Y5276sj/NQm8wK0xF2uUNskX/QZ3UHpRL6MnIh+pLlkilSWJQM0QdH8GPj97yFiaH5J7Y3PEJN4xNT6aINng3QHsrzxbsmTy8ofsa3r51Aj2WJhUvRIFxQw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2xODpB8sHvEl/yb200BnZDDp3n6ihKEeBe5isyzfX0s=;
 b=IKsNQ4J4woi5yQloCXhFG9wKJcfzH/Glc2qvRaDELLRTkn5D2ShSkVvQUFzixUTOFvQs1lAt8OVX5mdQPC16PQ3TAKfYSLis/UIi9eSKupxvzZNyf50oW3Nmwci1m/OY14i9M1iwbpPNCQXD9ngNNMB7ifKHd/w/UAUVbeBLzNbraVZ2SEXLfkiVckeMC0qDhuxgSS+sZONjwtbfwHi4Cx6IrwrDKbSSFcLkKkrapZIf2FJXCAjt0Clk1yn6Zgnpb/YroYjONjDH5CyBKku8u/BdI4TnG1oQV9ZHHMHS2v2mQgLIR9ajbxP/PgdXQvabJJ5kr/zHH2vZ3VBcV9IifQ==
From: Mykyta Poturai <Mykyta_Poturai@epam.com>
To: Julien Grall <julien@xen.org>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Stefano Stabellini <sstabellini@kernel.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH v1 3/4] arm/sysctl: Implement cpu hotplug ops
Thread-Topic: [PATCH v1 3/4] arm/sysctl: Implement cpu hotplug ops
Thread-Index: AQHcKJYTkGTrKHgw3E6UlX6hg7Or+LSY8SMAgAfcMoA=
Date: Tue, 23 Sep 2025 13:37:49 +0000
Message-ID: <721b5d6a-257e-447d-bac6-675ccedc3928@epam.com>
References: <cover.1758197507.git.mykyta_poturai@epam.com>
 <34c9b488ad949cbcd93bd8578dd5bc180fab8738.1758197507.git.mykyta_poturai@epam.com>
 <ddce2b69-3ba3-4c04-ab82-092ce2c98cf3@xen.org>
In-Reply-To: <ddce2b69-3ba3-4c04-ab82-092ce2c98cf3@xen.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAVPR03MB10102:EE_|PA4PR03MB7150:EE_
x-ms-office365-filtering-correlation-id: ee0b2e43-306a-4b74-981d-08ddfaa6637f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|376014|1800799024|38070700021;
x-microsoft-antispam-message-info:
 =?utf-8?B?U1NJd1h6TnFOVUZIeU0yak5ycDRxMllmeXd2V05IRCtXckFZdGhNa3Nhdm5Y?=
 =?utf-8?B?akNyTXhQRnd6Tms2RmJiNWhpelVXOCt0ckVCb2o4a3BlNUtyRERVTFBmZ0dp?=
 =?utf-8?B?RDVQbjJTR2w4eTVrenV3YjBGcGp5T01XK2UyZ1VLWjNuZEVLR0V1cnY0ZGNy?=
 =?utf-8?B?aGtxc3N2VFZqb3hvT01ZVEhJQTBsbUZkMzVvbUZnLzF6dSs0bjBtSkFLenhx?=
 =?utf-8?B?eFdNYXNaZ280a0w1MXBvdlpUUzUvUHNCVXRmN0dLdWk2TVVqUWNUYjlOYmtY?=
 =?utf-8?B?MmFnc2xVcThOdjdxZ3hYVGQrMmlaYjM1MnFoc29xV0tjMXBPc2VzdVFaNVh1?=
 =?utf-8?B?bE5UeGRVNmxTWVkvYk9KM21rSmZvRWd1YzdJb2lYOEg5eWtXUDh5RTI1Tmc5?=
 =?utf-8?B?TDlYbEFBd0p2UDFmcXBiVFdveVZHUW4yVGlXWlZ4RUY3UGxvV0dCOWNVQ09T?=
 =?utf-8?B?eVhJbkdwZFhZR0M4OU4yeWdkNmk3Vjk0VncyOGQ0OTNqSS83UkpUdTlDU09V?=
 =?utf-8?B?VFR3R0JkQncxL1BmSS82RzdXMmRHUjRXNWtQVE5GalpJRGVYOVBmOTlwWmpS?=
 =?utf-8?B?MXNqTXh0ZXg5MFk1dkNxZk4wNlpOczNXNEd5aWxrclRZOEdjUUVIanhPdE1t?=
 =?utf-8?B?S2lManYyWVE0N29xS0dZa1N6bzJ6U3VJVURpdWpUdVdqdk1iOTJvckN0WUZv?=
 =?utf-8?B?dEZFSmhQeC9xcHdKMnF2WkNhV3ltVVM4QXluaHBCY3Bqc1FZSklTV0src3ln?=
 =?utf-8?B?M0hqYmlEME1aMzZKUFR0MlNlQjA3NTBuemswekdDMGVSVk9kSjFFU004VzNL?=
 =?utf-8?B?SW1RTHoxR3RSeklyc3ZRbnZsSU4xSWYzVFdMc0thRjl4OEhxQzFFekhDcVBQ?=
 =?utf-8?B?VitPL0F2VVc4aFRYQTVuTVh0L0dnYWp2WFdtMFE4bUw0U3JyNjM2d3pXWmJU?=
 =?utf-8?B?YUpJTWNRTnBhcmdVS1FIYkNhT25EQ2dZQ2tHb2p5NmEzeVhnelhrOTJYZE10?=
 =?utf-8?B?SVhub0dTZTg3TDdZeFlyVzI3b2wyRTMzMHBQS1VzZUtvYkRlUEJJQ1JYZkxS?=
 =?utf-8?B?eWx1VTNoeU5aTXlpcGxoV0JuanJ4QXloUktYd3NhQkk1a3M5YWk1Q2E2TDl0?=
 =?utf-8?B?c01Qa0Iza2JueVRLUlEyTE5ka1dGMy9sOUg3bEdpV0xIc0lxbTlteTNTZkxT?=
 =?utf-8?B?Y1JNSEhmaXB1UFNvdm5RYWt1KzAxOEFFL1ora0JqeU9tdXJwWEQwdXIycXl0?=
 =?utf-8?B?Y3pqUGdaWFVDR29BcGVtaGdLM2ZVNEFORmQ5R0oxUlpBVG5RbEx0cEd0ajhZ?=
 =?utf-8?B?NE9RUkxvajhxL0xIM0ZyR3JlWmhyWUVUak1IRkR4cEZVTVJYUEkrRHdGWnVC?=
 =?utf-8?B?K3ZPQVpYZG9raGxjeVV5V3ZLcis3dFhORDN3V0N5TlFwWU85SXhHdGpVOGFh?=
 =?utf-8?B?ZTNDTUFLaGJvcVphQXIzWU5hcmRMbTlPdm5GMzZyKzZtSHN1WmxscTV0NDZj?=
 =?utf-8?B?K1ovV2VObVA0QnErU1Z2Q3hFY0hTa0htdUwwc0JlVW9sWFpFMENOZFNSUlh3?=
 =?utf-8?B?L25YU1RNYVh5MmZoR3cwNzU1M0FJY214a21SQk16S3hHS0FtSndBOTN6d3VD?=
 =?utf-8?B?ZWprN29tRWtIcE9RcXA1cTBFWGFFTmVPLzhYbVdvdmptdlR5UE9LQkdoNjk2?=
 =?utf-8?B?M05pczl3emptWmFBQS9lVzlsZzB1MGZGTWM2WVhWVHVQd2d3Qm9IWlhxSVZ5?=
 =?utf-8?B?U2UvYUZ5em5yMkl6b0ZCTU1WZFM4Qngwa0lyVnA4K080L0p3WkpzK2pIMzYw?=
 =?utf-8?B?VTVZNmZNenRva3dZd04xRDc1UzNxL3RXU0IyanFVTFpJejc4WVBOS3BZY3pF?=
 =?utf-8?B?NHljeTV0S3R6bXpVNTUzZVJhZ1BFYjZSVWc4V1dnUHpSTXcvV0ZoU09aUmNP?=
 =?utf-8?B?cWJsM05FQms2a2FOYklHVkdXeUcybFppTUdKUVNBMWdHbzFXak5aMkdoRDB5?=
 =?utf-8?Q?Q1SAcFJWmUvzKlOOBKCnfx7mFfHSI4=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAVPR03MB10102.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?akx0UHh0Y3RIa2VzS2J2ZEZDR3lFeUttN0d3RUpudGNILzROUEJBQjUxUnd3?=
 =?utf-8?B?OTlMSVdubmoxeC91SWRmWFBPU3VrdmxQemo3N0NHK1pRbDlnYXZ3cUhST29m?=
 =?utf-8?B?UUJOMkRwSzNucVVJMTNvMk94V05lVitJN0hpVzRvUWdBQ0RUSnowRWxkOStl?=
 =?utf-8?B?MVhiazhhWUxDUyt6N29JZ2VWMFBLODhsS1FQZGZqMHBsbkFFMVhhRFlYUG91?=
 =?utf-8?B?N0xlZjQyUkt6M1FEbnZiUU00MTgwUks3eEdmcVZqMnF3VEpzRDEyMWZ3K3lD?=
 =?utf-8?B?bytBcjdRZ3paenNtaXNXNjd4OXd5Uyt4UCt1cWplc0gwYUJKenNENDFTcXBt?=
 =?utf-8?B?RDJpRVV1N1JxbjVRdFJhRktqZmFKQi85aHluVjF0R3ZLdEJyMGdKTXVkbk1U?=
 =?utf-8?B?d0RxQlRsSDdNOUFBOHVtc3gySVhKOUtscFc3L0hRdkxUMThRRkpIUS9jYzc1?=
 =?utf-8?B?VzZWdDdVUWpxbUcvMndxYWJGanVDaGE0Q0VOaEJLdjc2NXoxRE1DeWxkN09Z?=
 =?utf-8?B?aXV4OS95L0Y1YVhkd214Vm9pVXJqdFZhRVRaazRQMThLaDQ4U1J5WDNZdHpn?=
 =?utf-8?B?RmwvTUQ1aEFUWnBQUTJWVFo2WCtXNWV3VWJwYUZmbW13QXlSMUpPdExUb2N4?=
 =?utf-8?B?ZXAyVTZsaUpaU3RQaXArY2k3L1hzakxtT3JscjZNemptU0VzREZ6SzVSNklY?=
 =?utf-8?B?ZVNHZW9UbmJiQ2MwYWM3K3NXZ0Z0dUsrMWc0RitCcVYyQ1YrTnFlTnA2Q1k5?=
 =?utf-8?B?RnRMVmZpTlFTZlBpUGUzZkxzck94cFJuWkJ0b0NYakVjVXA1dEhyZVpGb1J2?=
 =?utf-8?B?dGQzZWJwNWlMZ0k5MVdFMkkyL0UwaFlkdjNRQjBYRmRNaGpFMFdEc0xmcTJD?=
 =?utf-8?B?NkE0M2ZLelhqZStOa2VwVlhTOExsV2hERVdzRGxadHlCeDZBa1FLRGZZY25K?=
 =?utf-8?B?aHBQaWF0c2ZSS0hzQjZpU05UYnl0TVc4VWFieGdiV0FPMVY3emZoSnpmaXBQ?=
 =?utf-8?B?YVRaL0xSTnRUZ1dYMUlGdmpIV1N3dEg0YlRsZ1k4b2tZR0szbGJ6RVRhRzha?=
 =?utf-8?B?bUwyMzhGYUFMSTFhclg3QXJlZExrYm1yWHlCZHdWVDJhdDljTjMyMGl4ajFu?=
 =?utf-8?B?ay9pYUhhd3YvSUVNQjdocmZyZ2J3VFVlditLdWRaQVp1VkdVQUhGVGIzRTZI?=
 =?utf-8?B?dTFtMGZYbUVPZHpPTUN2RGMrM1U1QndFZVkxNG9NdEhkM24wOWdKdVB2U2hq?=
 =?utf-8?B?WTRHWVp3QVpOTTZCT2FKUWJiR0dsVHdjN0N4UEZaSlluOWt2NDdGR2UvQ0Fv?=
 =?utf-8?B?eEswVVlKU2RkRGVzU0FuME50MUlUVVE1bE5lUXpORjRMamxtVzA0MlUwdFFI?=
 =?utf-8?B?V2pXd3pYTWZwcVloZjEzbUhzMGZ4dzFtaTEvTXJDUzBPOUNSakFXaGMyVS95?=
 =?utf-8?B?S08yRGUwZ3BNeFB5amMzTGYvaHNmVUtBMlhDYVdNT3BaSVNXWkc1Q04vWWFp?=
 =?utf-8?B?cUkzWXJLR1RFVXVWTmViMnVvb2tMV1I4eDFXTlhrRWhKZGU5VnprTStrUDZu?=
 =?utf-8?B?VmhrSHgvRWlHZ0RsZ0RLVTZ0bnNtMFU2M0RTaExzZXIrNzlIbjlNMStHUENE?=
 =?utf-8?B?WmZMZUJHRUIyYUNIWU91dXhZZC8zd3FmQ2hqZi9RUW5mdXlrM3phSno3OHg4?=
 =?utf-8?B?bEdwakJHM01aL0ZlekovZUduVlBURGgyQ1NJc2ljaXFWMmVIVHhjcmNOcCty?=
 =?utf-8?B?Rmp3end6YWdjRThHS2ZSS25hK0E3SDJaSFV2Y3VpY1B6R3k3V0hCb0lTbTJR?=
 =?utf-8?B?a1d6dFpJRzlIMGhDSUdvZTVZK1Bsc2pZUmRPdG91MkMvbitsVTNIam9jVXdF?=
 =?utf-8?B?OUlBWFhtL1A4NVlwZkFCNEJNaWJwVWJ2RUlLWiswaFFVd2k3WkZ3VlVRMW1B?=
 =?utf-8?B?RWtKbVI1bitWUDlGWDVDOWZvSEJCOExaUXBzREgxcWU0SzFyVUZZQk55dm9M?=
 =?utf-8?B?ZElSdEFyVXEwUFR1Q2xRcjlaeE1WNUNzODdPMENqeG0rQURKalhhbVdkRU93?=
 =?utf-8?B?WFRkK3QyelI2ZGVTdDNCL2xGa1Fic3gxbjVJeERHTkR2aUVFL2hwU0ZiV2lX?=
 =?utf-8?B?Tm1NcnNkRzNSckNQWHBDVWNxZHp5Z2VIQ2VGVmhNMEhuY1BFcmwwUytrZy93?=
 =?utf-8?B?WkE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <D49980D7B0EF4745BF02EFF7884767DD@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAVPR03MB10102.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ee0b2e43-306a-4b74-981d-08ddfaa6637f
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Sep 2025 13:37:49.6993
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: NH15SRZi5NsE2iDUZkikF/xN7s6DwoL7nsywMgiOap13D/TDEqoVlCca1BfEUsgp1POId/8Bt6OyTkr6ntlrsw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR03MB7150

T24gMTguMDkuMjUgMTY6MzUsIEp1bGllbiBHcmFsbCB3cm90ZToNCj4gSGkgTXlreXRhLA0KPiAN
Cj4gT24gMTgvMDkvMjAyNSAxMzoxNiwgTXlreXRhIFBvdHVyYWkgd3JvdGU6DQo+PiBJbXBsZW1l
bnQgWEVOX1NZU0NUTF9DUFVfSE9UUExVR18qIGNhbGxzIHRvIGFsbG93IGZvciBlbmFibGluZy9k
aXNhYmxpbmcNCj4+IENQVSBjb3JlcyBpbiBydW50aW1lLg0KPj4NCj4+IFNpZ25lZC1vZmYtYnk6
IE15a3l0YSBQb3R1cmFpIDxteWt5dGFfcG90dXJhaUBlcGFtLmNvbT4NCj4+IC0tLQ0KPj4gICB4
ZW4vYXJjaC9hcm0vc3lzY3RsLmMgfCA2NyArKysrKysrKysrKysrKysrKysrKysrKysrKysrKysr
KysrKysrKysrKysrDQo+PiAgIDEgZmlsZSBjaGFuZ2VkLCA2NyBpbnNlcnRpb25zKCspDQo+Pg0K
Pj4gZGlmZiAtLWdpdCBhL3hlbi9hcmNoL2FybS9zeXNjdGwuYyBiL3hlbi9hcmNoL2FybS9zeXNj
dGwuYw0KPj4gaW5kZXggMzJjYWI0ZmVmZi4uY2E4ZmI1NTBmZCAxMDA2NDQNCj4+IC0tLSBhL3hl
bi9hcmNoL2FybS9zeXNjdGwuYw0KPj4gKysrIGIveGVuL2FyY2gvYXJtL3N5c2N0bC5jDQo+PiBA
QCAtMTIsNiArMTIsNyBAQA0KPj4gICAjaW5jbHVkZSA8eGVuL2R0LW92ZXJsYXkuaD4NCj4+ICAg
I2luY2x1ZGUgPHhlbi9lcnJuby5oPg0KPj4gICAjaW5jbHVkZSA8eGVuL2h5cGVyY2FsbC5oPg0K
Pj4gKyNpbmNsdWRlIDx4ZW4vY3B1Lmg+DQo+PiAgICNpbmNsdWRlIDxhc20vYXJtNjQvc3ZlLmg+
DQo+PiAgICNpbmNsdWRlIDxwdWJsaWMvc3lzY3RsLmg+DQo+PiBAQCAtMjMsNiArMjQsNjggQEAg
dm9pZCBhcmNoX2RvX3BoeXNpbmZvKHN0cnVjdCB4ZW5fc3lzY3RsX3BoeXNpbmZvICpwaSkNCj4+
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgDQo+PiBYRU5fU1lTQ1RM
X1BIWVNDQVBfQVJNX1NWRV9NQVNLKTsNCj4+ICAgfQ0KPj4gK3N0YXRpYyBsb25nIGNwdV91cF9o
ZWxwZXIodm9pZCAqZGF0YSkNCj4+ICt7DQo+PiArICAgIHVuc2lnbmVkIGxvbmcgY3B1ID0gKHVu
c2lnbmVkIGxvbmcpIGRhdGE7DQo+PiArICAgIHJldHVybiBjcHVfdXAoY3B1KTsNCj4+ICt9DQo+
PiArDQo+PiArc3RhdGljIGxvbmcgY3B1X2Rvd25faGVscGVyKHZvaWQgKmRhdGEpDQo+PiArew0K
Pj4gKyAgICB1bnNpZ25lZCBsb25nIGNwdSA9ICh1bnNpZ25lZCBsb25nKSBkYXRhOw0KPj4gKyAg
ICByZXR1cm4gY3B1X2Rvd24oY3B1KTsNCj4+ICt9DQo+PiArDQo+PiArc3RhdGljIGxvbmcgc210
X3VwX2Rvd25faGVscGVyKHZvaWQgKmRhdGEpDQo+IA0KPiBMb29raW5nIGF0IHRoZSBjb2RlLCB5
b3Ugd2lsbCBlZmZlY3RpdmVseSBkaXNhYmxlIGFsbCB0aGUgQ1BVcyBidXQgQ1BVMC4gDQo+IEJ1
dCBJIGRvbid0IHVuZGVyc3RhbmQgd2h5LiBGcm9tIHRoZSBuYW1lIGlzIGdvYWwgc2VlbXMgdG8g
YmUgZGlzYWJsZSANCj4gU01UIHRocmVhZGluZy4NCj4NCg0KU29ycnkgSSBoYXZlIHNsaWdodGx5
IG1pc3VuZGVyc3Rvb2QgdGhlIHg4NiBpbXBsZW1lbnRhdGlvbi9yZWFzb25pbmcgb2YgDQp0aGlz
IG9wcy4gSSB3aWxsIGRyb3AgdGhlbSBpbiBWMi4NCg0KPj4gK3sNCj4+ICsgICAgYm9vbCB1cCA9
IChib29sKSBkYXRhOw0KPj4gKyAgICB1bnNpZ25lZCBpbnQgY3B1Ow0KPj4gKyAgICBpbnQgcmV0
Ow0KPj4gKw0KPj4gKyAgICBmb3JfZWFjaF9wcmVzZW50X2NwdSAoIGNwdSApDQo+PiArICAgIHsN
Cj4+ICsgICAgICAgIGlmICggY3B1ID09IDAgKQ0KPj4gKyAgICAgICAgICAgIGNvbnRpbnVlOw0K
Pj4gKw0KPj4gKyAgICAgICAgaWYgKCB1cCApDQo+PiArICAgICAgICAgICAgcmV0ID0gY3B1X3Vw
KGNwdSk7DQo+PiArICAgICAgICBlbHNlDQo+PiArICAgICAgICAgICAgcmV0ID0gY3B1X2Rvd24o
Y3B1KTsNCj4+ICsNCj4gDQo+IFJlZ2FyZGxlc3Mgd2hhdCBJIHdyb3RlIGFib3ZlLCB5b3UgbGlr
ZWx5IHdhbnQgdG8gaGFuZGxlIHByZWVtcHRpb24uDQo+IA0KPj4gKyAgICAgICAgaWYgKCByZXQg
KQ0KPj4gKyAgICAgICAgICAgIHJldHVybiByZXQ7DQo+ICA+ICsgICAgfQ0KPj4gKw0KPj4gKyAg
ICByZXR1cm4gMDsNCj4+ICt9DQo+PiArDQo+PiArc3RhdGljIGxvbmcgY3B1X2hvdHBsdWdfc3lz
Y3RsKHN0cnVjdCB4ZW5fc3lzY3RsX2NwdV9ob3RwbHVnICpob3RwbHVnKQ0KPj4gK3sNCj4+ICsg
ICAgYm9vbCB1cDsNCj4+ICsNCj4+ICsgICAgc3dpdGNoIChob3RwbHVnLT5vcCkgew0KPj4gKyAg
ICAgICAgY2FzZSBYRU5fU1lTQ1RMX0NQVV9IT1RQTFVHX09OTElORToNCj4+ICsgICAgICAgICAg
ICBpZiAoIGhvdHBsdWctPmNwdSA9PSAwICkNCj4gDQo+IEkgY2FuJ3QgZmluZCBhIHNpbWlsYXIg
Y2hlY2sgb24geDg2LiBEbyB5b3UgaGF2ZSBhbnkgcG9pbnRlcj8NCg0KSmFuIGNvcnJlY3RseSBt
ZW50aW9uZWQgdGhhdCBDUFUwIGNhbid0IGJlIGRpc2FibGVkIHNvIHRoaXMgaXMgYSBzaG9ydCAN
CmNpcmN1aXQgZm9yIGNsYXJpdHkuDQoNCj4gDQo+PiArICAgICAgICAgICAgICAgIHJldHVybiAt
RUlOVkFMOw0KPiANCj4gT24geDg2LCB0aGV5IHNlZW0gdG8gY2hlY2sgZm9yIFhTTSBwZXJtaXNz
aW9uIGJlZm9yZSBjb250aW51aW5nLiBDYW4geW91IA0KPiBleHBsYWluIHdoeSB0aGlzIGlzIG5v
dCBuZWNlc3Nhcnk/IFNhbWUgcXVlc3Rpb25zIGFwcGxpZXMgYmVsb3cuDQoNCkkgd2lsbCBhZGQg
WFNNIGNoZWNrcyB0aGFua3MgZm9yIHBvaW50aW5nIHRoaXMgb3V0Lg0KDQo+IA0KPj4gKyAgICAg
ICAgICAgIHJldHVybiBjb250aW51ZV9oeXBlcmNhbGxfb25fY3B1KDAsIGNwdV91cF9oZWxwZXIs
IA0KPj4gX3AoaG90cGx1Zy0+Y3B1KSk7DQo+PiArDQo+PiArICAgICAgICBjYXNlIFhFTl9TWVND
VExfQ1BVX0hPVFBMVUdfT0ZGTElORToNCj4+ICsgICAgICAgICAgICBpZiAoIGhvdHBsdWctPmNw
dSA9PSAwICkNCj4+ICsgICAgICAgICAgICAgICAgcmV0dXJuIC1FSU5WQUw7DQo+PiArICAgICAg
ICAgICAgcmV0dXJuIGNvbnRpbnVlX2h5cGVyY2FsbF9vbl9jcHUoMCwgY3B1X2Rvd25faGVscGVy
LCANCj4+IF9wKGhvdHBsdWctPmNwdSkpOw0KPj4gKw0KPj4gKyAgICAgICAgY2FzZSBYRU5fU1lT
Q1RMX0NQVV9IT1RQTFVHX1NNVF9FTkFCTEU6DQo+PiArICAgICAgICBjYXNlIFhFTl9TWVNDVExf
Q1BVX0hPVFBMVUdfU01UX0RJU0FCTEU6DQo+IA0KPiBXaHkgYXJlIHdlIGltcGxlbWVudGluZyB0
aG9zZSBoZWxwZXJzIG9uIEFybT8NCj4gDQo+PiArICAgICAgICAgICAgaWYgKCBDT05GSUdfTlJf
Q1BVUyA8PSAxICkNCj4+ICsgICAgICAgICAgICAgICAgcmV0dXJuIDA7DQo+PiArICAgICAgICAg
ICAgdXAgPSBob3RwbHVnLT5vcCA9PSBYRU5fU1lTQ1RMX0NQVV9IT1RQTFVHX1NNVF9FTkFCTEU7
DQo+PiArICAgICAgICAgICAgcmV0dXJuIGNvbnRpbnVlX2h5cGVyY2FsbF9vbl9jcHUoMCwgc210
X3VwX2Rvd25faGVscGVyLCANCj4+IF9wKHVwKSk7DQo+PiArDQo+PiArICAgICAgICBkZWZhdWx0
Og0KPj4gKyAgICAgICAgICAgIHJldHVybiAtRUlOVkFMOw0KPj4gKyAgICB9DQo+PiArfQ0KPj4g
Kw0KPj4gICBsb25nIGFyY2hfZG9fc3lzY3RsKHN0cnVjdCB4ZW5fc3lzY3RsICpzeXNjdGwsDQo+
PiAgICAgICAgICAgICAgICAgICAgICAgWEVOX0dVRVNUX0hBTkRMRV9QQVJBTSh4ZW5fc3lzY3Rs
X3QpIHVfc3lzY3RsKQ0KPj4gICB7DQo+PiBAQCAtMzQsNiArOTcsMTAgQEAgbG9uZyBhcmNoX2Rv
X3N5c2N0bChzdHJ1Y3QgeGVuX3N5c2N0bCAqc3lzY3RsLA0KPj4gICAgICAgICAgIHJldCA9IGR0
X292ZXJsYXlfc3lzY3RsKCZzeXNjdGwtPnUuZHRfb3ZlcmxheSk7DQo+PiAgICAgICAgICAgYnJl
YWs7DQo+PiArICAgIGNhc2UgWEVOX1NZU0NUTF9jcHVfaG90cGx1ZzoNCj4gDQo+IFRoaXMgd2ls
bCBhbHNvIGVuYWJsZSBDUFUgaG90cGx1ZyBvbiAzMi1iaXQgQXJtLiBJcyB0aGlzIHdoYXQgeW91
IA0KPiBpbnRlbmRlZD8gKEkgc2VlIHBhdGNoICM0IG9ubHkgbWVudGlvbiA2NC1iaXQgQXJtKS4N
Cg0KSXQgd2Fzbid0IGludGVuZGVkLiBJIHdpbGwgYWRkaXRpb25hbGx5IGNoZWNrIGlmIGl0IHdv
cmtzIG9uIGFybTMyIGVuZCANCmV4cGxpY2l0bHkgc3BlY2lmeSBpdC4NCg0KPiANCj4+ICsgICAg
ICAgIHJldCA9IGNwdV9ob3RwbHVnX3N5c2N0bCgmc3lzY3RsLT51LmNwdV9ob3RwbHVnKTsNCj4+
ICsgICAgICAgIGJyZWFrOw0KPj4gKw0KPj4gICAgICAgZGVmYXVsdDoNCj4+ICAgICAgICAgICBy
ZXQgPSAtRU5PU1lTOw0KPj4gICAgICAgICAgIGJyZWFrOw0KPiANCj4gQ2hlZXJzLA0KPiANCg0K
LS0gDQpNeWt5dGE=

