Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 602479776F7
	for <lists+xen-devel@lfdr.de>; Fri, 13 Sep 2024 04:38:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.797907.1207970 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sowCW-00030l-P8; Fri, 13 Sep 2024 02:38:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 797907.1207970; Fri, 13 Sep 2024 02:38:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sowCW-0002zE-M0; Fri, 13 Sep 2024 02:38:24 +0000
Received: by outflank-mailman (input) for mailman id 797907;
 Fri, 13 Sep 2024 02:38:23 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Mb5q=QL=amd.com=Jiqian.Chen@srs-se1.protection.inumbo.net>)
 id 1sowCV-0002z5-AU
 for xen-devel@lists.xenproject.org; Fri, 13 Sep 2024 02:38:23 +0000
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2060e.outbound.protection.outlook.com
 [2a01:111:f403:2009::60e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3d316eaa-7179-11ef-99a1-01e77a169b0f;
 Fri, 13 Sep 2024 04:38:21 +0200 (CEST)
Received: from BL1PR12MB5849.namprd12.prod.outlook.com (2603:10b6:208:384::18)
 by CY5PR12MB6552.namprd12.prod.outlook.com (2603:10b6:930:40::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7939.25; Fri, 13 Sep
 2024 02:38:17 +0000
Received: from BL1PR12MB5849.namprd12.prod.outlook.com
 ([fe80::b77f:9333:3a5a:d285]) by BL1PR12MB5849.namprd12.prod.outlook.com
 ([fe80::b77f:9333:3a5a:d285%4]) with mapi id 15.20.7939.022; Fri, 13 Sep 2024
 02:38:16 +0000
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
X-Inumbo-ID: 3d316eaa-7179-11ef-99a1-01e77a169b0f
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=S3qw85bvizLMxEN7mj0Pv4qMtVfexQmZT4b46By6wi747FSNQz4uswzOI1rQDAxUIjPZaYhFBvfNmwVy3Fg79pAANzALRNTuklT0X2DDX0HN78LMa8OFCxwp5Ob3+S7asiCkHZqtVehQ+iwBg97flPrqyysEvh09CY+mM/ONHA2uWYxyuSfG2k03xa44ZLIWx11fMkKYwWB+DI+qYfb5Z08r3rXiC38hsDSMVXDQ6bBcGD/wkMW07ifVqcIKI3Pfrlcc1TNPwmBtioqzZyh7IK5NMpBBs+I5cQmXctTo6BKa4sJBHiPXALerV+eGKbc8Jsd1SZOQeQVRKipmOkZtqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=F9hfHVBibKImmSNngGistT4fDuSWJC4VUQv36EtXzIU=;
 b=Be7zzZmRvoWGBeKblgxLMFyPK2yH5sqIztLe0KGkDb2pBcKOeiEkll2e5UKBC+QRKviBn6EiRhXxE4MAGTt79hiVF8275sWBVX4CncXRUn53zfkv0eWJvyo7wI4ya2sVn6zbZdnDaGqw0GzpQbwbYvE15UwBGPMDM27NSxqDxgQcbupI+18Qrwhb4bR70wq0+pvoXPR39tUbg8E0TV/u7RdXr80HTdgLxQnjJxpIrAmdnsWD3B8eNshdBWE/piD//OOO24SKi0yuuHOgighX5XE3Gy59Kj49YorDpfbLW+GsBB5d05IM4NC8X1I39RbneeqAXvYkLjVcLmCNRaBqqA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=F9hfHVBibKImmSNngGistT4fDuSWJC4VUQv36EtXzIU=;
 b=mHif+rQUnCGg79L+5ZLJY6KxTuRWA/jhFbjQNRKLiRtM49ooPF/ay8ZxxwACfial+fUfV8ovxPYmqv7mtDw8ZnfIU2OtCMmVAQK4F8krK+riMP8Qwqd/ls2jMxgHyudkevLQ/BGWJRRk1spHs5szcnY3Ns9foi1qDwVHBx5jOXc=
From: "Chen, Jiqian" <Jiqian.Chen@amd.com>
To: Jan Beulich <jbeulich@suse.com>, "Daniel P. Smith"
	<dpsmith@apertussolutions.com>
CC: Andrew Cooper <andrew.cooper3@citrix.com>,
	=?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>, Julien Grall
	<julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Anthony PERARD
	<anthony@xenproject.org>, Juergen Gross <jgross@suse.com>, "Huang, Ray"
	<Ray.Huang@amd.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>, "Chen, Jiqian" <Jiqian.Chen@amd.com>
Subject: Re: [XEN PATCH v15 2/4] x86/irq: allow setting IRQ permissions from
 GSI instead of pIRQ
Thread-Topic: [XEN PATCH v15 2/4] x86/irq: allow setting IRQ permissions from
 GSI instead of pIRQ
Thread-Index: AQHbBBiuopssrGEkhk6CaPzsYxSpJrJT9mIAgAAE1QCAAY3jgA==
Date: Fri, 13 Sep 2024 02:38:16 +0000
Message-ID:
 <BL1PR12MB5849AB4428D6278BCD24C610E7652@BL1PR12MB5849.namprd12.prod.outlook.com>
References: <20240911065832.1591273-1-Jiqian.Chen@amd.com>
 <20240911065832.1591273-3-Jiqian.Chen@amd.com>
 <971eba46-79e0-411f-8ae5-6b1f986f2ed0@apertussolutions.com>
 <5a3b43eb-6c98-42bf-8331-1112de9d888d@suse.com>
In-Reply-To: <5a3b43eb-6c98-42bf-8331-1112de9d888d@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-exchange-imapappendstamp: BL1PR12MB5849.namprd12.prod.outlook.com
 (15.20.7939.015)
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BL1PR12MB5849:EE_|CY5PR12MB6552:EE_
x-ms-office365-filtering-correlation-id: 8bc64d4b-2798-4edf-97a2-08dcd39d1ee9
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|366016|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?TmJseU93dzc2bzJoa3VFRS9KRzA3SkM5d0ZjSkFqZlRVYWIvVUZIWVpSR0da?=
 =?utf-8?B?d2xJS05iRVhZVlR3bVo5N2VvSHVWeU9JVEtyL3JtMXA1aDFPL0tXL2dabkhV?=
 =?utf-8?B?RGladTQ2N0FkUjN6YTdHSkZvZkVIK1FBQW5kTmtScjlLYlhrMzR0VnlRSGQr?=
 =?utf-8?B?V0pQMWJ2d0hWMG0yZU0rVTRiL1BDZUdPbHNHQVkvOWZnS0phelV3ZlkvVitJ?=
 =?utf-8?B?WUl4ZzZpVjk0K0syVkJ6OW5ocFFGdVBEOHRJOTRLMjdzVDZrYVpVZjNZL05Y?=
 =?utf-8?B?TlZ0Yjh0Zjl0OWJUOHdRVnkxMzVma1YxbXFqRHdhTmd2amFJN09hem1KNjBv?=
 =?utf-8?B?eitOUHcxb2lJS08rT2dUUnpUbEloM0JENUpnRzlOYWsrWjhYb082dk85dWJZ?=
 =?utf-8?B?OFRJMlNWY3g0RGJYRnFLRW5OcitmNjhxQ3AyY2VQbG0ySGxmcDlKenVLSUNa?=
 =?utf-8?B?Z2t2dXBFR3lZaGhkNXd2aDZXU0oyWXJSeTJBNE5NUitHaTMrUGxrbGhpKzdi?=
 =?utf-8?B?N2UzVGhJdkp2bFJVZU15emcrT1NBQStCK2dVOHBaaGp3S2Z6Yk5UTDU0MVlt?=
 =?utf-8?B?M29ibjgyR0Z3NGhXcERrTE5nNDBPaHBINGhYSUQ2dlVKTUxobFhoSzNTZ250?=
 =?utf-8?B?V0FQMnI3TTdNRnVhWVc2T1RXT2RMcktUZUQ2eXNWSmQvS0M3eHZBU2dZZi9u?=
 =?utf-8?B?QXZCd2hEWnhFc0RRWUd4N0ZlMml6eTBZUjVZb1dOQlo1TlhvZGYzYXlyQ3dE?=
 =?utf-8?B?TUw5Sm5JelA0c00zQnlnUHJHR2VVZXlCRU10ODdIZVg3OUFuQmVadGFvSEU1?=
 =?utf-8?B?QkoxZ1FYR29kazFjb1ZvTnh3SjJ1YW0veVRZRGd4SDlXWTlQZ0pSbHlHOGhr?=
 =?utf-8?B?and0MHZaMDNaRCt5N0J6dVNzeENlK01XaFVpdXVHZU9rOG5BY1lRRktwcHEr?=
 =?utf-8?B?elZubURvZ0U2YldQVDZ2aHNFN2NrdCtNeXB1T0E5eDhXQW5RTlY3MHdGaUM4?=
 =?utf-8?B?S1dodGFQTUhrV3paOTlTYlM0Z3RPa2NBUEUvMjE3RW9XZm5BS25ZanlCMTJu?=
 =?utf-8?B?R1FscXNjc0lxcjBkcnhoZTBEeThHbVJQL09Rdk0wYm5jcWFXNmVla0tuVXl1?=
 =?utf-8?B?ejJiR3BNb0R6bFgwMmxVVWJHNEQ1WHNseEVpclRWRVlWVUp2aUg4R05KZ0hk?=
 =?utf-8?B?aHBRb1BOcTBnZll6bUc1V05GQkh5WlhPeE81aURtaERYS2o2NnFWN2RoQVcw?=
 =?utf-8?B?NGpkaVpCakxxVURJTVZtY1pUNkIyVDE1ZHZhK0ZISllNNFgrT1JWMmN6Lyt5?=
 =?utf-8?B?UFNqdTBGejdoTC9RRmw4Q3BjMXlLTWZtQXRkTzFOcVJ3K0tKSzkrQVBrTFdY?=
 =?utf-8?B?eERzUlpkbzVwY29vMTY2TlRhcTBZUUluME0xcng0SWdhc3MyVzZtNnJzUFhM?=
 =?utf-8?B?RjFhVTQ2VDV2VXN5N3dkN2YvQ0JFd3kzRHZzN0FIWWZ1QU5na1htaUR2NlRP?=
 =?utf-8?B?VkwwQUlrdmpUbHJmKzY0WUNHU1NQVk9nNVpyM0pFQ3hOYjVhVXI2Q1ZQQ0l0?=
 =?utf-8?B?dU9YMzFVTGd4Tm04eVBnSGxWczJqdkZ2TC9kRE9KVjY5L1Z6NGpxK3ZrOGZa?=
 =?utf-8?B?YWZ4eHpNYUpXazNaWGI0ci9PRUVoeEZHQWFXWUFNaG5LTTJtRlo2SjlIRE5U?=
 =?utf-8?B?aUIxeW1WY2htZE4rRndKcnVxblhjWjM5aWxsRmw0NDFhci96dDhsNEp1Sm9B?=
 =?utf-8?B?RXFQSDZnMDRyUSs1bnVhVllwSGkrS0RsSzMxc1VUa2xqMWVuSFgwZm5iZUdi?=
 =?utf-8?B?U1p1MXNTaVhUelBnTlpyVlAxVVI2cVVmVjB6Q0VlbEtYQXZsdmpIZXNQMUZt?=
 =?utf-8?B?QmRCend4dm1yQTZJWkhVTC9mYmxCNVZGQm5zY0E2TUdTOXc9PQ==?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR12MB5849.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?TEp5MlJxWTZSZ3hDN2RyelorRUhwK2NnbXRXRmtUcHc1L1N5V3ZOeWdkYkFQ?=
 =?utf-8?B?S0tUdHM5Zy9vYm9FR0JwT0FiallmWFRHVVIyWEJNSU9wZXozUS9nU1NFU3VO?=
 =?utf-8?B?T1Z2QUljT2thaGxMMTBtZ1hEVVA5cEYraHpOK3FtR1VGZlowRTRheTlmbk5Y?=
 =?utf-8?B?Y1FsLzcyTFpnZTFBMFg1eEM3cHJCYVdYQ2tEZ3RkSC9tSnNOS3Era3hvbnBI?=
 =?utf-8?B?R1h2aXZ0bGZWVERpT3NLc2JzZjM0UHlYNDFLbTFMUVYvVVBMTC8xcStYQmIv?=
 =?utf-8?B?K1lMb0tqTnJaUzhkUXBhdmpYb0JQc3VzQTF1aWpJODFpSldWWXlWNTdYY1RV?=
 =?utf-8?B?VmJRWVZWS2VsU1hFb1UvRWNCeXlqdUM3VHk1UkFSa252ZzFwb2ZwT3M1bUd2?=
 =?utf-8?B?SmdiOERZUmFxd1dwSFdLSUJqUGh6aEJOUGQzYnhFc3VvRzJzQVdsNWRaaU45?=
 =?utf-8?B?bk00dEJWYkpHc1BxcElRdXBHS3N4aS85Y053YnlHQmhUYkczLzhNbUZGVi94?=
 =?utf-8?B?K29DSGsvdXZVQ2dlcHZiRU12eTJyZjhYRGYvbjNkZkdyeFZTUmIrNERxZ0x5?=
 =?utf-8?B?Vm1kRFFLdmdOTnNvczRmVno3dEVzVzFuKzhqbWN6RlM5dU5VNTlGVk96NmZE?=
 =?utf-8?B?VHFGb0k1Y3JlYUxlNHJKais5cjlwdXZSSmhaZDJwVE5hSWRQNGhpQVVUd2ZE?=
 =?utf-8?B?VXNocWlGVDFYZE44Z3l0S2xDd0lYTVpQVFcwTG5XdzdCd256ckY0bkVGZmJR?=
 =?utf-8?B?R3A0QWwvQUhlNFBXWFNjYVV5aDYwYkFXa0E5MmJCS1RBVnB5eWJ2R0pGMG84?=
 =?utf-8?B?d09jM3pPK0Z0WUVISURJak5xSVJBR0FrakxpN3ZOcFUwRE9pdmZPQkJrY1pR?=
 =?utf-8?B?UDdILzBjY2ovQXpBUFZDdTlrcXluWnVMMGYxT1AwUW9jd0hkNEZkK2dMVjNi?=
 =?utf-8?B?Tjl0dnA3anh0R3lxQldrU2IwOG92YUpuYTZxQVFmU3hBUEY3bXVpbUdQQlY0?=
 =?utf-8?B?bG5iMXB2UDNYcktwL2VHVndSMi9TdkZQOCtmUDFtak5wa05oNUZmeHdEcHoy?=
 =?utf-8?B?bTVXN0VqUkFIMEhzanVIaWE3dHlQQ0F1ai9IUmh2NFhFdmpEdHhwL0dJMFN6?=
 =?utf-8?B?SVQ2RmF6RnlMZjVETEw0eGQ4S0dIbGlVemVpU0toR2lJd1VRUW50TWswNmlH?=
 =?utf-8?B?MGFCRUYwUE5ZYzJlSCtNZzRSMlpPRVg2bXBFSEcyMC8weUVaaEVldkxWdytL?=
 =?utf-8?B?WEltV3VOb1cvb0JCU0J0U0s3ZDhGR3JreTYzbC9VeHQ2YnVUallDV1kxYnh4?=
 =?utf-8?B?c3VIdm1FT3h2RkFWK2huTnFWTGhNNzZTcm4zZHNMbUJSUmZKdkNoM3puTWJL?=
 =?utf-8?B?Y2dZTURNQStDTXNUcXM0MmpHcUFnQmx5WUp6NnRZbkJzc2ZKclBVQ3FJcC9y?=
 =?utf-8?B?N3JMQTMvVkhIUzlVa1R3d3NtdlpFcTNqQ3FpU2xic0grbUhaOElHOHdpcHJY?=
 =?utf-8?B?RjVFWG4xcDVzbElqYTdRRm5za1BrWlJqb2k4MnpWZEhudmQxdHpuSFJSMXRC?=
 =?utf-8?B?M1lYcG1TcGJONUMzTDU3UW44U0c3dUp2UStnUzB4Z1E2N01YTGlsVVdyd0RJ?=
 =?utf-8?B?SzlxdUVNK3FlZW4vd2hJZzNLcERoQ3hnMjZmVVM0SlM1bmRFYTl4S3ZRNEla?=
 =?utf-8?B?QnB0ZDY3aEJDYmtnU3c3WlVXc2pNWHgxMmdHMk41UFFZYkZkSnVyLy9jL3Zh?=
 =?utf-8?B?TmswK2dCK2hvcEFVVzJPUGZSaGtQVDlrbmtlU0hMaXRHbHNrVUg1dytFU3JM?=
 =?utf-8?B?SUNWWlUvNnhiR0JOSGRvN2N6cVBCVUJQZWVFRjUvOGtCNWRTQkw5ZVFqM0cr?=
 =?utf-8?B?YnJjZDJsZFppeC8yT1dBWTZMK3JIeVBCTFpJMVNETzJuL0xqK1MxS09FZHh5?=
 =?utf-8?B?Q3AxeS9xNU1kQkhyUzdDUk84Y1ZtaExoY05jUDd2RWRCTFU2U09Eeld4eGJR?=
 =?utf-8?B?ZGtMRi8zN1EwcktwRXIrVHFnOWppTFd5ckROaHp0VzE3UElWenE2T1dDRmMw?=
 =?utf-8?B?RWJhZDJrNTQ3VkU2V2hsRHIzOUxpR2ZUMHpZUjU0WmpiSHBHNWVyNTlETTRC?=
 =?utf-8?Q?mtTE=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <6FEC4AD6A93C48429A18EA170FE081D4@amdcloud.onmicrosoft.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5849.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8bc64d4b-2798-4edf-97a2-08dcd39d1ee9
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Sep 2024 02:38:16.1114
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: uvaltf0jvhqAfgrqPj4ftoe0DTYF3Ol6FUW9yM2ZDfuIYSWaUJm+ECqdvPfRTbG6AuECici8iJkIvFGoQ90Adg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6552

T24gMjAyNC85LzEyIDE4OjUxLCBKYW4gQmV1bGljaCB3cm90ZToNCj4gT24gMTIuMDkuMjAyNCAx
MjozNCwgRGFuaWVsIFAuIFNtaXRoIHdyb3RlOg0KPj4gT24gOS8xMS8yNCAwMjo1OCwgSmlxaWFu
IENoZW4gd3JvdGU6DQo+Pj4gQEAgLTIzNyw2ICsyMzgsMzQgQEAgbG9uZyBhcmNoX2RvX2RvbWN0
bCgNCj4+PiAgICAgICAgICAgYnJlYWs7DQo+Pj4gICAgICAgfQ0KPj4+ICAgDQo+Pj4gKyAgICBj
YXNlIFhFTl9ET01DVExfZ3NpX3Blcm1pc3Npb246DQo+Pj4gKyAgICB7DQo+Pj4gKyAgICAgICAg
aW50IGlycTsNCj4+PiArICAgICAgICB1bnNpZ25lZCBpbnQgZ3NpID0gZG9tY3RsLT51LmdzaV9w
ZXJtaXNzaW9uLmdzaTsNCj4+PiArICAgICAgICB1aW50MzJfdCBmbGFncyA9IGRvbWN0bC0+dS5n
c2lfcGVybWlzc2lvbi5mbGFnczsNCj4+PiArDQo+Pj4gKyAgICAgICAgLyogQ2hlY2sgb25seSB2
YWxpZCBiaXRzIGFyZSBzZXQgKi8NCj4+PiArICAgICAgICByZXQgPSAtRUlOVkFMOw0KPj4+ICsg
ICAgICAgIGlmICggZmxhZ3MgJiB+WEVOX0RPTUNUTF9HU0lfQUNUSU9OX01BU0sgKQ0KPj4+ICsg
ICAgICAgICAgICBicmVhazsNCj4+PiArDQo+Pj4gKyAgICAgICAgcmV0ID0gaXJxID0gZ3NpXzJf
aXJxKGdzaSk7DQo+Pg0KPj4gSSB3YXMgcmVjZW50bHkgaW5mb3JtZWQgdGhhdCBhID0gYiA9IGM7
IGZvcm0gaXMgbm90IE1JU1JBIGNvbXBsaWFudC4gDQo+PiBTaW5jZSB5b3UganVzdCBvdmVyd3Jp
dGUgcmV0IGFmdGVyIHRoZSBjaGVjaywgd2h5IG5vdCBkcm9wIHRoZSANCj4+IGFzc2lnbm1lbnQg
dG8gcmV0IGFuZCBtYWUgdGhlIG5leHQgY2hlY2sgYWdhaW5zdCBpcnEgaW5zdGVhZC4NCj4gDQo+
IFRoZSBNaXNyYSBjb25jZXJuIGlzIHZhbGlkLCB5ZXQgdGhlIHN1Z2dlc3Rpb24gZG9lc24ndCBs
b29rIHRvIGJlIHF1aXRlDQo+IG1hdGNoaW5nIHdoYXQgaXMgbmVlZGVkLiBBZnRlciBhbGwgaWYg
d2UgdGFrZSAuLi4NCj4gDQo+Pj4gKyAgICAgICAgaWYgKCByZXQgPD0gMCApDQo+Pj4gKyAgICAg
ICAgICAgIGJyZWFrOw0KPiANCj4gLi4uIHRoZSAiYnJlYWsiIHBhdGgsICJyZXQiIG5lZWRzIHRv
IGJlIHNldC4gUGx1cyB0aGVyZSdzIHRoZSBwcm9ibGVtIG9mDQo+ICJyZXQiIGJlaW5nIHplcm8g
d2hlbiBleGl0aW5nIHRoZSBmdW5jdGlvbiBpbmRpY2F0ZXMgc3VjY2VzcywgeWV0IHRoaXMNCj4g
aXMgYW4gZXJyb3IgcGF0aCAocmVxdWlyaW5nIHJldCA8IDApLiBTbyBvdmVyYWxsIHBlcmhhcHMN
Cj4gDQo+ICAgICAgICAgIGlycSA9IGdzaV8yX2lycShnc2kpOw0KPiAgICAgICAgICBpZiAoIGly
cSA8PSAwICkNCj4gICAgICAgICAgew0KPiAgICAgICAgICAgICAgcmV0ID0gaXJxID86IC1FQUND
RVM7DQo+ICAgICAgICAgICAgICBicmVhazsNCj4gICAgICAgICAgfQ0KPiANCj4gPw0KDQpZZXMs
IHJldCBuZWVkcyB0byBiZSBzZXQuIEFuZCBzaW5jZSBnc2lfMl9pcnEgZG9lc24ndCByZXR1cm4g
MChpZiBpcnEgaXMgMCwgZ3NpXzJfaXJxIHJldHVybnMgLUVJTlZBTCkuDQpNYXliZSBiZWxvdyBp
cyBlbm91Z2g/DQogICAgICAgIGlycSA9IGdzaV8yX2lycShnc2kpOw0KICAgICAgICBpZiAoIGly
cSA8IDAgKQ0KICAgICAgICB7DQogICAgICAgICAgICByZXQgPSBpcnE7DQogICAgICAgICAgICBi
cmVhazsNCiAgICAgICAgfQ0KDQo+IA0KPiBKYW4NCg0KLS0gDQpCZXN0IHJlZ2FyZHMsDQpKaXFp
YW4gQ2hlbi4NCg==

