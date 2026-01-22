Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GDOSNpwycmmadwAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 22 Jan 2026 15:22:20 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A66C67DDA
	for <lists+xen-devel@lfdr.de>; Thu, 22 Jan 2026 15:22:20 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1211159.1522701 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vivZc-0007A0-In; Thu, 22 Jan 2026 14:22:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1211159.1522701; Thu, 22 Jan 2026 14:22:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vivZc-000782-FB; Thu, 22 Jan 2026 14:22:12 +0000
Received: by outflank-mailman (input) for mailman id 1211159;
 Thu, 22 Jan 2026 14:22:10 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=yxn8=73=citrix.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1vivZa-0006ZC-Io
 for xen-devel@lists.xenproject.org; Thu, 22 Jan 2026 14:22:10 +0000
Received: from DM5PR21CU001.outbound.protection.outlook.com
 (mail-centralusazlp170110009.outbound.protection.outlook.com
 [2a01:111:f403:c111::9])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id bb87f6d3-f79d-11f0-9ccf-f158ae23cfc8;
 Thu, 22 Jan 2026 15:22:08 +0100 (CET)
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by MN2PR03MB5149.namprd03.prod.outlook.com (2603:10b6:208:1a4::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.9; Thu, 22 Jan
 2026 14:22:05 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37%4]) with mapi id 15.20.9520.011; Thu, 22 Jan 2026
 14:22:05 +0000
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
X-Inumbo-ID: bb87f6d3-f79d-11f0-9ccf-f158ae23cfc8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Zc5rMJabjY6vDDDhRuVedUqNlrK9lzR2Fux+Qs+p7Fuf67k1GwxaJiVHSQeMFyGxw+ss6yO3M0IwbM6VXQFod5Ph9bOseFjm0XM+AMH0cuRquPumWz2OF8+D+kUbM0oNcs0flsSuggOW3cxA8Uk+DEDJFTtVs7/DIoNfNC2IrmOOkFrqC9ZVYCfWYonSStllq+bvDQFLp8JTe7m8VCoex8bswj83FL4O6K0weCD2j1EH0werkG3Yw9Ev07HSRMw5x41/EfdgaUapiW6I1c/4JonqIsNQ7nsZqk8lQVjE16JGAcl2hJLXi+kAQMIhh/XR00P48PNsr2kNPTvSV6lXxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=a2pp6K0iL+LUPLiBUkm9GiBqMMcAbkMFilWT6ZXr7S8=;
 b=mIjx2OvXTJ3A2n2JM6G9f+1U9XSrYitHIVe5P9H4qvgCi0jzUWccIbXqftqwt6gUs3nsF0OjHSyQ+6D2rf16a9QJFPGh4OgNFUDjX9TtPlUjshZicsb0uAna5aFM3Nb3PsUfJJoLltiKL1QuarNZ8vRxGN+ujIM3d1VRNEBPaPBouqjzU5iQ6sE4ovu9Sj2JzsMWzPmjbQdey5H1ng6z1TytlZqH0J7ZBkXHjXxhzjlbJaETYbwV0HyRaOIezPOt7KCtZsI/swOgNduCtkDolj+sKcD9CpsmafB1W31PgRFF6+GX3Im+UAN/Bo8UUU+HgrjTAUSu+HE3tqKATYrX7Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=a2pp6K0iL+LUPLiBUkm9GiBqMMcAbkMFilWT6ZXr7S8=;
 b=cJkeQvl6Qp+g6RfZNzoP7BYYvQ5Ai3OYWbi65soXV5CXwkJuL5g1KDoouMhth3uP3IBUtVeX6oJG8+uY3hINpt1WszFyKZvMeaQqmAnHHCoRkmJaHa1BiHyuAfYfgO/LfLWX3ksm+yZRZf10gxFCc+OGmZfD9eiDb/dt9jvq7x4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <b8262c0d-5602-436f-9137-46621e39fd03@citrix.com>
Date: Thu, 22 Jan 2026 14:22:01 +0000
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Juergen Gross
 <jgross@suse.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
Subject: Re: [PATCH] xen/mcelog: simplify MCE_GETCLEAR_FLAGS using xchg()
To: Uros Bizjak <ubizjak@gmail.com>, xen-devel@lists.xenproject.org,
 linux-kernel@vger.kernel.org
References: <20260122141754.116129-1-ubizjak@gmail.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
In-Reply-To: <20260122141754.116129-1-ubizjak@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO2P265CA0186.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:a::30) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|MN2PR03MB5149:EE_
X-MS-Office365-Filtering-Correlation-Id: 86a1a5c3-3750-4f7e-9f06-08de59c19e6c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?bS9BUGRSVjBQSVBnRXloVXlvbjkycVQ4cFFZTWVsenZOSGUzNTJvNHhsMDdr?=
 =?utf-8?B?OHBEKyt5N3RjTXdCUG5BME9wUUdIaDFzUVdUbnlGWFNHc0hiM2tibmdubVMy?=
 =?utf-8?B?WUR6ZFZZbGNjcllWQzVMVjVhUTZ2YmR2RkpxMlhkem1VYU9WNVJWbm1rMXNI?=
 =?utf-8?B?L1RDU1MvSmFpcElBT2tWSllFZW9zQ0JURlpvMDlJMm5RN2o3akRPZUhOeTdm?=
 =?utf-8?B?NERwbXB6aXRGS2RZZG1tNkllRkc5VWNVKzI3L0tqSi9SVE9pV3g0c0htYWlB?=
 =?utf-8?B?ekliZE8xemRsUjY4M0Y1ZVJEcXV6bjJCL2g0YUViS1pBSTlBZWxtSE1Yallo?=
 =?utf-8?B?WnFmN2VyTi9ZcFl2TkJnWFdZKzBjdHVaS1NUY0JMUlBtZkRGS3NwNTUvbXRn?=
 =?utf-8?B?bGE2bXZSTU9wNnZNOGdTL0JtQVJMc2FSNEdrVlNVVHIyclZvQWplOVlQRHhZ?=
 =?utf-8?B?RDBiMkhxOTJINGZ2Rk80Nmgwb29IMERtTTRNOXdUNHI2aE9POWh2b0ZtV2kv?=
 =?utf-8?B?cEpVUjNWTVpTcXEvMFBySEdaTXI0OEttWDRmTG1FZDJUUWpXdFk2ZEtiSzl1?=
 =?utf-8?B?am4vdG02ZlVVZ1FlVG9WVDVoQ0hXd0dMeDZDODBCUEoxWlg5WGFLYkx3NzhL?=
 =?utf-8?B?a1NjNDBNdVZOVnhDbVJ2Um83TjFLR2xKcVlkZG05NnhkQ2FpMW5WdGEwZ1g5?=
 =?utf-8?B?T3FZRkVvektmbldjUHYrbXVBbzNua0gvaSswNlVMblppcnJSQUZBeW5RS2R5?=
 =?utf-8?B?a0pYaEdPZVpGQllkbEtQL1hEZTRMQUo0YTFlTm5EU0trYVVNYzFsWTJBN002?=
 =?utf-8?B?KzUzTU03dTRhZ1J1OU82SFUvR25GT3hEZ0xCaFphQ2xXRkFQSGlUbFgvWkM2?=
 =?utf-8?B?MHZ6a0hoemU4TW5vU1RqNkpIcFVOc1NJNjNVZXN1YlpBMGZ3V01qczBoNGxX?=
 =?utf-8?B?NTkxTWxINjg0VWpvcDRUQnphdXRNcm92a3kyWmZPRU9JcXJWaENocWFqU2Qr?=
 =?utf-8?B?dEw0VEpxMWhGR25OckpKWVZWWjBxWDRiV25xdXpZSjhkUUN4czh5MHRpTi9x?=
 =?utf-8?B?bkc2R1U2Q3N4bkk1Ri9JMXVIc3lWdW45UmE0SFgvVnNsc1Y5RzIzRDFqYXZ6?=
 =?utf-8?B?b3hDWnRCUWhXZTBEOW0yV00vUkJxSUJSNTRYS3lTQjAwTDh6NWttMEcvZEEw?=
 =?utf-8?B?bVNqVFFNTHFzZ0h6QmN3WXYxbFBkRHQ4L2x0Rkc2cExqREFaNUJVb2pMSk42?=
 =?utf-8?B?ZDh6c3dKSExnbmZ6TnMyU1JRUTZvTzZIdUFlNDNoeHdLREtvMTZaVDRIU2hO?=
 =?utf-8?B?VHBZS1pXQnFpOGFGRVk4OEx0ZlBRSS9PdGFoaTUrOFFnRXhSR0JXRUlzYzgy?=
 =?utf-8?B?VERjWWdrTUR3R25jdDFqZlUvM0toalpXUVVVQmtkUTJncGtOdG9HOVNBbVkv?=
 =?utf-8?B?dFN5dmZsM08rVUtud2xKc1VJYkxRVHN0bHlqWkc2czJlZHlYem12aGFaTHBp?=
 =?utf-8?B?WDBjNUs2RFAwbGs5WXNaN1hYWVdIZFFpL0oxNXVOVG9yc1lrOW1NTDBXSXkz?=
 =?utf-8?B?TUFxaDNZQm1YcVczV3IvRDFIUEZCamRWYmZhRjJPM1lZbFhvKzJSUE5lMTBa?=
 =?utf-8?B?ak5uOVRBQkdTTmZvb3JpZDgwNWUzc1VRTVF4b20xZC9jM2lHbUpIaUhjL1Yx?=
 =?utf-8?B?Y09Nak96ZzJZUHRVb3U5WEppR3o4QTVmNnN6Ymd6cllTd21haDlZc0dJNjV6?=
 =?utf-8?B?eWpGeCswMHdsUGxWU1hxUXQ3ejRtZjM2RUp2Mlhhbnh5WDREWkpNQ2JHSW9W?=
 =?utf-8?B?SVRkRHFxWHlJTFQ5RjRXVU44VUl1NGdJcXVtdm01VEp5dTJzRWhGeGg3VGZw?=
 =?utf-8?B?amJWZzNVeUFGSTh0Z3lyam5kS0cycklNQVJTa3hZWGxmbHlZUTZ2VnZRYjZa?=
 =?utf-8?B?ZCtPOHh4YmdZS3dnMEhkNVh0aC9OU0Vqa3NaakFVVzgxbUliRW9EeDRDdVZZ?=
 =?utf-8?B?U0RuenJLVmN0Z2Q2Y0hzZjlSb0V6WGZwVDdqQXpNL3hvdUJBTHA5QzE1UVBE?=
 =?utf-8?B?dDZqWEdpUE1Gbm9xd2NhaE9Iejlyd2ord0RoMytyeHJjRHUweXhVQlNLUm9q?=
 =?utf-8?Q?SMBo=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WHF4aDMzRHJPdW9VNmlyVGk2OUlKSUE5VXIxNGs2WDBuclBjUjZ4RW1icnNh?=
 =?utf-8?B?SWkxWVB3NWlpa21aNmJQZ1FMeHJ2TVJ0WkJnd2ZNSzIxYmRvTklsWUovd1Vx?=
 =?utf-8?B?RHNEcmVaSVlNMC9xa0lldll6UDNPS1V6K1RsS2hwSlZDTW5EbDluNnFWVE1L?=
 =?utf-8?B?d1JFbkhZWFRBQk1wWVZIdVZrSHpvbUw5QWpRcEVkSlp1NmsremR0ZDdiUmFo?=
 =?utf-8?B?U0h4OHJ1UnBvVlNaS3QyVnRPQVZHQVBkUVVzcWN0UmszV0FIN2t0RytuSS93?=
 =?utf-8?B?UlpvRytLamdKOWxFbVhpMjd5ZVlLUnlPSzJYRnZoVFpjQUtSdHgzeDJkQ29j?=
 =?utf-8?B?TUQ0M2lYVXpteE9ZL0dGUW5CUW9Ccm5md0lKdXVwaDJNSWlod0hSQkRYUjBq?=
 =?utf-8?B?SEJMQTZBclR6Z0swSkREQTMwREZ6RHluVm4yemRNWis0QWw0WEh0RTUxK24z?=
 =?utf-8?B?djE1N0RteDNkK3Z5czhSQW1tT3M4ZU8vK09hK042d1hPN21tbVRGbmM2Nm9m?=
 =?utf-8?B?cElXRXF2WFpjdTdPTzVKZUtFc3FzL2ZUZDlEd3VPTkoybXltb2o4U1k1aW1G?=
 =?utf-8?B?UE0xNlFoQm0vMHltODVPUlVqYitOOWJrSWtEWTVSS3VHM0t1elhsbzdXbjk4?=
 =?utf-8?B?Ymo4a0ZlTkRFKyttZHk2aXBzdmJLbU11MzVtVWJDN1NTbXdCMGVLeFYyYU1p?=
 =?utf-8?B?TW5mT2UrUEt2SVdFc2U2Rm4wSFExQ1I5c01HQW53UU1PSVRmZW1qQjhRUDBx?=
 =?utf-8?B?TGxEZFdBZHpxYzRDUDFFcXVxaFFHTVFuYlZmcUhxQ2M4dFpyWExaQ1B2ODFw?=
 =?utf-8?B?WS9MaC9XTGZrbWE2L1lnMFVkamhSTzd4RVZtS0g5ZHZRRXJ1blhyMEs3SEN0?=
 =?utf-8?B?V2h2R3N2WDlrZ2NvMXFTcmxzY0ptY01Zd0I5Rm5nOGVFZXJBN1FYNHVxYXBD?=
 =?utf-8?B?R2l1NWZ5WHBXWkIyallGRFpmZW4yeDR1a3dwL1NIUXk0dnh1a29tb29SVDJv?=
 =?utf-8?B?N0tsTTZITTkvU0RzeVU0REU1RGNBczk1dXZSRUlRZFJpTGQ0RVJHaEp4T2pD?=
 =?utf-8?B?RFRIaTdWQXBEZzBHMi9sQyszTzhsVkowWDV0WGw2RUVQQmNKbnh2N0VVKzdv?=
 =?utf-8?B?aVM2M243WEo3T3ZKb2lLdk9adExyOVNBVkExM2hycVcvd0Y5NnEzTllBY21x?=
 =?utf-8?B?ZlVHa3lKejA2NkVuVTk3V2hsaUZxZUR6VXR5SVFoSHVNRENmVDY2RGF6ZEIy?=
 =?utf-8?B?bXRZS2dUSDBpdjVraWNib1htTzd5ZTdjdlNteXMzSlRpb3FRcE5yc0hpUUdI?=
 =?utf-8?B?TkZlU1JDeUc3NWZLM29XVWsyZWQ5V0ZQbEVreXpySWRHRThzN0lXWVBsTy9H?=
 =?utf-8?B?VSt2cUZqQVErZHdOTXQvV2dyUUZDMnF1cDM2WEVmTG00R29oVyt3aU94RjdD?=
 =?utf-8?B?RFFrRnc1UWJQOGVrZlZtcS8xNVdkTGc2N2h1U25tWis3WmpRZkRRdGVzZ0VG?=
 =?utf-8?B?aFJDNXRMRXpIUWFuRUx1MFhTeGdVVnBSL2pzd0RrakdxOElQUTdNU2NaYlpC?=
 =?utf-8?B?UFN2V0lwN1o5QTViRnVMRWhLR2IvcU8zQnIxMHJNMEljZGhqQ1UrYXdMUlpT?=
 =?utf-8?B?WXJ6OEZrTlJXWGpwU2wvQmRGMUpYMUlGWDlWYXJPTk5Oa215YlpTRnZEU3RV?=
 =?utf-8?B?dFRBV2xGaXE1OXRrQzhUTWFxOTA2Q2JCM2JlOG1FRzZ2M2lGUnFEYzYwa0My?=
 =?utf-8?B?OURiZU5qNUhmSDRHVVdrVVZJdHNFN1czTnJKMmt0TFkrSDRTQ044eXBFZnAx?=
 =?utf-8?B?aWFCa2txeDM4S0dscHJXTkw4R25VbUVMWndLMzRNam0rN1dZdEJMMTB6UzEx?=
 =?utf-8?B?clllUnVoZ3lyTytwUU5oTUJtaXlGd0pSY3BWQUF6VE9qYi9abjFFL3NEbzUr?=
 =?utf-8?B?RDhpYkpJSDNXRlc2bm1Xak5RWDFIQStkdzcvMjBZcm9ETHRHdzZPSzdVVk1C?=
 =?utf-8?B?eW9CWW84SEZBQXlIQmZCeUZhV09NNmp6TkxRa0Z4TDNpSXdjbHdoWFVjK1Bx?=
 =?utf-8?B?MzU3czRkT0JyK0hrZjFSTml2RVk3Vkx4azZCV0ZjR1BWNFhJNmRNNDM5Nkt2?=
 =?utf-8?B?WU95ZFYwaEk2R1VKMFluNmw2azlvb3pHOTF5NVlNTjhuV1FrQmpPTnNkYW53?=
 =?utf-8?B?TE5sQ1BIWG1kb0lHNTd0bWoxOHNSTXErbmpmY1BtSHZscGRIbDA2aU1TNnhm?=
 =?utf-8?B?U0hSdk1YTE8zMDk2a1RlY1I0YjhOYklEZTh6Um5waTlrOHVSanVyeXZ1S1Er?=
 =?utf-8?B?VEZXWitIQjBoRE5Oc0Q5VnZnVHd3NVZldkM1bjVGdHpFMXBNa1Ivbm43OGhx?=
 =?utf-8?Q?Yk8KCYD1RCX/jcSY=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 86a1a5c3-3750-4f7e-9f06-08de59c19e6c
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jan 2026 14:22:05.6137
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gXlPP6zD1lwmZTZIuOZBo3NsPX/TLg1FFvNp57yDPImqPtlwNYfDW9XJ1Kmu7S81qheBXqPLkMZZQbJHmw5U/mdVWJzCIMxcXJWaM+wZ3hY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR03MB5149
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:jgross@suse.com,m:sstabellini@kernel.org,m:oleksandr_tyshchenko@epam.com,m:ubizjak@gmail.com,m:xen-devel@lists.xenproject.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[gmail.com,lists.xenproject.org,vger.kernel.org];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[citrix.com:+];
	RCPT_COUNT_SEVEN(0.00)[7];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 2A66C67DDA
X-Rspamd-Action: no action

On 22/01/2026 2:17 pm, Uros Bizjak wrote:
> The MCE_GETCLEAR_FLAGS ioctl retrieves xen_mcelog.flags while
> atomically clearing it. This was previously implemented using a
> cmpxchg() loop.
>
> Replace the cmpxchg() loop with a single xchg(), which provides the
> same atomic get-and-clear semantics, avoids retry spinning under
> contention, and simplifies the code.
>
> The code on x86_64 improves from:
>
>     186:	8b 15 00 00 00 00    	mov    0x0(%rip),%edx
>     18c:	89 d0                	mov    %edx,%eax
>     18e:	f0 0f b1 0d 00 00 00 	lock cmpxchg %ecx,0x0(%rip)
>     195:	00
>     196:	39 c2                	cmp    %eax,%edx
>     198:	75 ec                	jne    186 <...>
>
> to just:
>
>     186:	87 05 00 00 00 00    	xchg   %eax,0x0(%rip)
>
> No functional change intended.
>
> Signed-off-by: Uros Bizjak <ubizjak@gmail.com>
> Cc: Juergen Gross <jgross@suse.com>
> Cc: Stefano Stabellini <sstabellini@kernel.org>
> Cc: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
> ---
>  drivers/xen/mcelog.c | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
>
> diff --git a/drivers/xen/mcelog.c b/drivers/xen/mcelog.c
> index 4f65b641c054..abe658c73b7b 100644
> --- a/drivers/xen/mcelog.c
> +++ b/drivers/xen/mcelog.c
> @@ -165,9 +165,7 @@ static long xen_mce_chrdev_ioctl(struct file *f, unsigned int cmd,
>  	case MCE_GETCLEAR_FLAGS: {
>  		unsigned flags;
>  
> -		do {
> -			flags = xen_mcelog.flags;
> -		} while (cmpxchg(&xen_mcelog.flags, flags, 0) != flags);
> +		flags = xchg(&xen_mcelog.flags, 0);
>  
>  		return put_user(flags, p);
>  	}

Oh yeah, that was very daft beforehand.

Reviewed-by: Andrew Cooper <andrew.cooper3@citrix.com>


