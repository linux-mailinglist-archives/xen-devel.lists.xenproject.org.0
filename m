Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 073EEAD8504
	for <lists+xen-devel@lfdr.de>; Fri, 13 Jun 2025 09:53:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1013886.1392078 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uPzEH-0007JH-MK; Fri, 13 Jun 2025 07:53:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1013886.1392078; Fri, 13 Jun 2025 07:53:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uPzEH-0007HP-IH; Fri, 13 Jun 2025 07:53:37 +0000
Received: by outflank-mailman (input) for mailman id 1013886;
 Fri, 13 Jun 2025 07:53:36 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jsFi=Y4=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1uPzEG-0007HJ-Bu
 for xen-devel@lists.xenproject.org; Fri, 13 Jun 2025 07:53:36 +0000
Received: from NAM02-BN1-obe.outbound.protection.outlook.com
 (mail-bn1nam02on20625.outbound.protection.outlook.com
 [2a01:111:f403:2407::625])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 817ad67b-482b-11f0-a309-13f23c93f187;
 Fri, 13 Jun 2025 09:53:34 +0200 (CEST)
Received: from BN9PR12MB5273.namprd12.prod.outlook.com (2603:10b6:408:11e::22)
 by CH3PR12MB9124.namprd12.prod.outlook.com (2603:10b6:610:1a7::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.23; Fri, 13 Jun
 2025 07:53:31 +0000
Received: from BN9PR12MB5273.namprd12.prod.outlook.com
 ([fe80::cf66:58ab:47be:4b13]) by BN9PR12MB5273.namprd12.prod.outlook.com
 ([fe80::cf66:58ab:47be:4b13%5]) with mapi id 15.20.8792.034; Fri, 13 Jun 2025
 07:53:31 +0000
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
X-Inumbo-ID: 817ad67b-482b-11f0-a309-13f23c93f187
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HpK/XViHUoZ/76+ZmwbB2l+BbJsylRDVAxeM84hj6bllku+a3Qk0s76HJjeR6w0M3RHCK38wKqjNhNme5JKtbE0XN59Jkj9gB569kwwvy9pt9ndneMbMbEGBkmbc3s2V3/rjsManPBaXHxFw20ZW+lT1lTYptJ8JDpV75CmB5jgU8kmC3Mxs0SToUQHwvZ2UAgkCeS/KPWHDTeu24xsU2AIMqw/d8Ry4gBB2jtmaZmnVrX9guF0cWgou6nfyllAaiReo+tBRrtp+op49aIQnZpXnjNz0ygeEZ581YIDK7SrM/CQl8C17TA23/jC+RxOmgGNpzxgORr4lwnpBH59Jlg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CAcSQNZ0y2Sb6z/URFBCdGkghbTMqhrdlRt3DkGP44k=;
 b=AwquvirxVBVuaAMWEBqMPoMzsNb8Fba6dk/7GKW1h8CipfthU6Ro7pgAefJyoeCbhxKGPMAED54Id9Dt/Xgm5K2P6IZt1h/+90U57CyVJ7MmE/3HzQJ5DLIU7Df1DJp/EOf5cRSHCx50ucbErTwIC4adhdpfjLuKTiMIu9CJIl8sfHM51L0M6Ly0r9JKgk0e61RTHlw/7MyiaC/5Vwc/2L01/o0JUTTjNEx2gi0WtYjDzP3iFJL+7ISAxttuzKgOajf5ey8ki4m+jnMyTGD9+gdRkmDffQD1ugTxeF/8yafbwrVSRf2mPCDhY+SCriJsgPw/1/8k4fUhsO968bem4Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CAcSQNZ0y2Sb6z/URFBCdGkghbTMqhrdlRt3DkGP44k=;
 b=L/8mbylfyR8VI9VNUm58n6nzJyHcApOstDMZTZDXdFsAYzs6O5JiIFX5BzWTewymc5mHxUCbbGzRENeorjPwRwt0AImSVwuZvOrFED69vSGnyRqnQdyb90gPNMaWMYlp+UZF9rZa1wPgtIzt6uU2Hmw0u+2TMWXZEOUNTv/+H8g=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Message-ID: <8884a8e1-4816-4b08-9f27-58f1df0c1d30@amd.com>
Date: Fri, 13 Jun 2025 09:53:27 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4][PART 1 2/4] xen/arm: Implement PSCI SYSTEM_SUSPEND
 call for guests
To: Mykola Kvach <xakep.amatop@gmail.com>, Julien Grall <julien@xen.org>
Cc: xen-devel@lists.xenproject.org, Mykola Kvach <mykola_kvach@epam.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <cover.1748337249.git.mykola_kvach@epam.com>
 <1a8313537603bee36636b0fcd2fdc2f76a2374fb.1748337249.git.mykola_kvach@epam.com>
 <abf5da3e-8e5b-4159-98d4-60bf90672c2c@xen.org>
 <CAGeoDV-gZQ5QzP-5gFmFpNy5B=vUhdaeAbkN1LPFtSXBdGwepg@mail.gmail.com>
From: "Orzel, Michal" <michal.orzel@amd.com>
Content-Language: en-US
In-Reply-To: <CAGeoDV-gZQ5QzP-5gFmFpNy5B=vUhdaeAbkN1LPFtSXBdGwepg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR4P281CA0220.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:e4::15) To BN9PR12MB5273.namprd12.prod.outlook.com
 (2603:10b6:408:11e::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR12MB5273:EE_|CH3PR12MB9124:EE_
X-MS-Office365-Filtering-Correlation-Id: a3ded44d-3464-4864-68d5-08ddaa4f63e6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?a2h2Y3ZGQlYvL2FOY3hwQXVzZGJjZlVlWTBWS1FEQlZsb1hPUFp1NnN6MDRo?=
 =?utf-8?B?V0hhWjJQeDIxRUo0ZmdsWHhTNmZOK1dQbnM1QXhwODlremJqODdxWGJZZU1V?=
 =?utf-8?B?cThIQ2xSUDduRHNVOUNhTmxHNDVGME5ESHNBVkFGWVJndUR1dHhmVFB1VmtB?=
 =?utf-8?B?Um1RRTRsRUFGRDd1ZHBDMmVPUzJWT3dqUEpJaE9YMHhNc25wQTVWSDRxOW9a?=
 =?utf-8?B?QXBUU3lsckppbUFHTmduamtYbHAySVlOVzdtampRUE5qUlJUZ2tPN0tDK2U1?=
 =?utf-8?B?VVJNUWNXMEdrU3IzRDB1RkdFN3NjZ04vYndodG9lQzJjRE1yZmNpTlQzcFpR?=
 =?utf-8?B?cUQyUHYvd1JldHlHVXdmV2pvbU96UGo1dWhILytNTWZZQ1Y1aVp4MHV3Vnhu?=
 =?utf-8?B?SHY1N2JvVHNLM291V3RIRGhEazlodkUyK2UxckNudDhIU3A0dENzdFNnTGlC?=
 =?utf-8?B?d1ZJK2t5U2RjM2lkQ09QU3E4VzUxUjJsQTRZejY5U2paRjc4TlY2T1lWem9h?=
 =?utf-8?B?dE8yYkI3K002ZXNzdnpHNUIzR3NnajJKZXVtc3lMdGRHbTZBRmw5dGoyT2dQ?=
 =?utf-8?B?aW5lNVNEK3JnK1lJNWMvTUZwQktHb2JLM2tUV1hrYTlSYStIMHBKR2lNNHkv?=
 =?utf-8?B?NXhOU0JQRWdxVHlTVXB6R2NwcjNicVlVWlB2UVpQNHZOSG5sR2tnYUh3NitM?=
 =?utf-8?B?aVdia3BXY2RjMXlmQkpUekR6bHRwSHl6NFlMckJ3b3gzbDdrdGd6N0F0c0NG?=
 =?utf-8?B?RDU4VjV2c1hzV2N3N25qUzBzT0FOR2grbVVKOWJEZFd4RWUxa0YybE9PSUJL?=
 =?utf-8?B?V3VkcHBaYmY4cktmaU5qdWliUGZncHZmMlp0WTQyYi9FQ0E5VjF0Nk5qa3hQ?=
 =?utf-8?B?R1ZPazNuU2tlMzE5akZic2l6eEhUdS9VS0JwdlhwdzIxTzF1MGl2Y3R0eTFw?=
 =?utf-8?B?TjBsaGZlT1Z5ejVNZGRpYmR1cUxxL05JZk9Wb2JWMzZBQkN2MlJncFdPVkdL?=
 =?utf-8?B?d0xRTkZXVENnNm9GLzNjOXZyZ2svY091amFGdU5IeHA3OVVoMVIyaC9hTkkw?=
 =?utf-8?B?WXNoTmRvY1ZkUno1NjU0L1UycDhqaTdQZDBuKzkzVXErc29OTUZidHZsOE50?=
 =?utf-8?B?QUFsWHBwN0NnOVh5NlpHelFiaWtxRkc4TFRuUWZ0MndwMzhJZ25qQmhLM2w1?=
 =?utf-8?B?QU5FaGNLci8yc0hnaVIxZ0VpYk5KVFAyVEQ3UzJIVVkyaGFHR1U2blIxTXh5?=
 =?utf-8?B?a21nN2xVZEhwcEs2dUYwSlUwc3RmUzYrM2s1ZzNFd0ZQY2QxTTJNMi84Y29E?=
 =?utf-8?B?dUQydlNhM0M0NTdkNUh5Yy9EOGwrZGtGMjRFd01xQWFrNGVYWnMwOEIvSmxn?=
 =?utf-8?B?cDZXbjgxNWtLMUJ5TlFtLzk4Z2xrZk93NVdFNngwemZtWDVrYXdkdktZSGdN?=
 =?utf-8?B?QjVZVUp6eUhwNEFpdWo2WUg5bkcyaS9aTHE5UEQzNmRoSjJPRlhPbGlrZFhJ?=
 =?utf-8?B?b2ZhRnFWNXNKckdQa0ZQLzVONFhnbFFJUjFFNlp6NFJhSTgvOVBZVDVHQ3Ry?=
 =?utf-8?B?Rm5iQWJVcGlEc3h2S1RjN1U3ZVBjcU9XUUJ2aXFmdjB1S3VYc09yNEFCMlc4?=
 =?utf-8?B?czFMVEJyK3hsVFpvdkJTazAvQUtaTXNYNnZ6NVNCSEw1WUY4ak5XS05VYlNK?=
 =?utf-8?B?Q2dqbkJyVGNuTDEreXE3YnRxNzd2TVFSSGNTK1cwMzBkN2ZLVkV5aTFaamlH?=
 =?utf-8?B?amZqMFoyYVdWUERka0dVNWIxR3hGV3NpdytkM01TOC9DRlMxZnczMzdadTNT?=
 =?utf-8?B?VjBzcmNEOXNqbE5FenptRkxVSTJpZjJsM29lcWFNUGZBNUJNd0dGcWIyQXRU?=
 =?utf-8?B?V3VUUkg0OGF2NGVaRkFkb3NvMW1jRWt5bGJ2a1B4QncrOGlmdUZoVE91c3NX?=
 =?utf-8?Q?ci6FpzhfVos=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN9PR12MB5273.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?anhhWTAzek1LcVRScy8rcExHRUFQT1JuY0U3cUVKZWdHclR1YllmTU5wT1Nz?=
 =?utf-8?B?Q0Z3QmRKOXlTTldXRDVFdnV6WjdnMTV0VzVlWHQ1ajM2YTV4djVrWHp5ZGpn?=
 =?utf-8?B?aitMT1EvNG01OSthK01xSDNtZHppemZ4UWpySkJzUzVxNVJFc3FKaDJvS2NX?=
 =?utf-8?B?b2U4eVNnaGpoNjd6S1JOSVVnL09JMUcyK0dVMmJOVSs0U2FSOE1JN2RaS0Zt?=
 =?utf-8?B?RWQ4Z09EQXEzYXhlR0RES2xFeEY3RmplYzZ4Y3VZM1FENFJtaDdxZjhiN3RE?=
 =?utf-8?B?MjJNYlA1eWs1NkYxL1RMbDNQa1BDUWR0bm5CakdQMFovNUZ6Y2QvM3Y2dUY3?=
 =?utf-8?B?QklVb2pUUlRIOHNjZEkwU2l2eWtBWUxCVFh2M29YbU9rNmFTN3dtZGtVd2dF?=
 =?utf-8?B?ZXU4U2pnOC9TOFVIOC9uSDFIMWpEUk8yMm1iZ1dEenlmK1FOYjdxSDZDemQz?=
 =?utf-8?B?QkYwYTQ0YU02T20zbjUwbWVDUzc1RFAyRlZ2dHM0MFBKSXFHRS9FK1lVOWVE?=
 =?utf-8?B?eHRGUy81Y0FmN1ZqZHBSalhFcWRIRXdoSkkycVJlOVBYYnlTQzBUcDB3L01E?=
 =?utf-8?B?a0U2TUwxWXNNTkVmcU9IeG1yQm5IUmNqTE90RGZpQ3lLM3AydmYzMGM5T2Rj?=
 =?utf-8?B?VWxmazV6cXRTd1o2UXJlRjZJb3B4MzN0MHJhWlBKU2k0b3FOcGZHdFNOT05P?=
 =?utf-8?B?ZHRHcmVuT2dGZWJkWllaanhEU3BVM2JSMXNkZW43T1ZFcWZtR3JJWHA2TThu?=
 =?utf-8?B?V0MrM2YvZ3F6N1VWazJ1Zmo4ZUhoT1JObDNMT0E3OVZwWVBjVmR4WGNiU3RW?=
 =?utf-8?B?V2hvTDgwMTNYcjNmVkZoZHJUWEw0S21CWW5YM1haSDBRdEIvaC9YQWpvLzRj?=
 =?utf-8?B?d0o1aytNWThueG1PTkpKVFVseFNDZkt0WkpHdW1JNmkwbXdSYWFBaEZ6dVZT?=
 =?utf-8?B?OTRWMkdhdm12TTJCcFZON3RuZlFoTTJMc2k5RjMxT0hFZ1lUekRUY3ZQRnNm?=
 =?utf-8?B?Mi9oditDZ3pSVDJQMXREajFpc1FHSS9SSDBXS2JnS2xJMkZydllXSjhsOHFR?=
 =?utf-8?B?Vm9peDdWSGZjREcxZjFpYmc5cURkY2RWcEd4VHZtak5BKzdYZVJGYkU3MHh0?=
 =?utf-8?B?NVBOcTI1NHI0a1JWeko2V2pVRGFHY1o0a2xPak1XVVNTV0svQ3Rqc2NWRTUv?=
 =?utf-8?B?WS8xNTdGQlRFUFk2M3lqaWl1Z244MkVJZTI4bHUzclBZWTFJNld3R3R6Q3Ry?=
 =?utf-8?B?Mm1MUkREME9BN00zU2VvbGNOM0pUTzJYQzJuZ3E2VURGZ0JKK1NpSHJ0R25a?=
 =?utf-8?B?eVVmMWxGRWRsQzlwU09iNG52eGR0Y2ZQM0x2cFJpbGZpNmNtajRqQjI3MEE3?=
 =?utf-8?B?d0JmK1FkK0ZOK3pCRC90aXdLUmRDdTV5SS9GR0EvU1VaS2NkT0x5MjRZYzFH?=
 =?utf-8?B?S1FtU2ZveXFaU2xqUzhtSm1RcTFrUnBqWGdaNlNabFYyNjNrZFgvV3gzN3FY?=
 =?utf-8?B?d2Q0K1ZlenY1Sm1jTFJqeDRTQm9NeXFWL3JFblZrdmhqd1JiY0o5c2wxZTBy?=
 =?utf-8?B?cWdwZFJGaklDSXdSVVYxRnVEc3BOLzFtQ1c3eS9EM2lnaXB5bUZQTHNUVEhl?=
 =?utf-8?B?WEVsSHk5ZVl5VEI1L09mb2NjVEhva2hhMiszVkxoN0FvR0N3dVdVa1RDT3Fj?=
 =?utf-8?B?UkwrN3M4MmdET1A1d0hXWEZ2VlpIZUNFd05Jckp4aTZKbkkwZWQ5SU1od1pB?=
 =?utf-8?B?TGxEV1dXNjlFMHpCdWk2V1lMd3ppYnozclNHV3FxMFdNSkV5bDhCQXZZRkU5?=
 =?utf-8?B?T21ONGlwMWsybG9mUVJoWktIak4zbWJzQU1la2NZVlZheXJXazN0NnJaWGVu?=
 =?utf-8?B?NThjeTMrQldQNjZXS1F2alZSOG1lR293ajdkMXBjeEhOV3ROUEZMbWRQa2lL?=
 =?utf-8?B?dHVQcHpKMzljQXB2dE15TTEzRDBLQ2t5RHA0TktaSzRZYmR1Qk1pek5heFRa?=
 =?utf-8?B?QkZGeDVlVmtrT090UCsvQW5iQ2J5TWhvMGlPem56dEwrVmZXZ1pXUVN2NG5D?=
 =?utf-8?B?YVl4UmhlVXB3bkVIY1gwSUVJWFpWeUhjWEJpaW1xdUYvZXgxOUJETHNZMnNM?=
 =?utf-8?Q?yzdI=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a3ded44d-3464-4864-68d5-08ddaa4f63e6
X-MS-Exchange-CrossTenant-AuthSource: BN9PR12MB5273.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jun 2025 07:53:31.4143
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hXJg8KuC6QDm94fDRLo48aOAV86nYUiMLhtlrqKIsrTQWWtJbmco1fsAIJ0PyMfd
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB9124



On 06/06/2025 05:52, Mykola Kvach wrote:
> Hi, @Julien Grall
> 
> On Wed, Jun 4, 2025 at 2:00 AM Julien Grall <julien@xen.org> wrote:
>>
>> Hi Mykola,
>>
>> On 27/05/2025 10:18, Mykola Kvach wrote:
>>> From: Mykola Kvach <mykola_kvach@epam.com>
>>>
>>> This patch adds support for the PSCI SYSTEM_SUSPEND function in the vPSCI
>>> (virtual PSCI) interface, allowing guests to request suspend via the PSCI
>>> v1.0 SYSTEM_SUSPEND call (both 32-bit and 64-bit variants).
>>>
>>> The implementation:
>>> - Adds SYSTEM_SUSPEND function IDs to PSCI definitions
>>> - Implements trapping and handling of SYSTEM_SUSPEND in vPSCI
>>> - Allows only non-hardware domains to invoke SYSTEM_SUSPEND; for the
>>>    hardware domain, PSCI_NOT_SUPPORTED is returned to avoid halting the
>>>    system in hwdom_shutdown() called from domain_shutdown
>>> - Ensures all secondary VCPUs of the calling domain are offline before
>>>    allowing suspend due to PSCI spec
>>> - Treats suspend as a "standby" operation: the domain is shut down with
>>>    SHUTDOWN_suspend, and resumes execution at the instruction following
>>>    the call
>>
>> Looking at the specification, I am still not convinced you can implement
>> PSCI SUSPEND as a NOP. For instance, in the section "5.1.19
>> SYSTEM_SUSPEND", the wording implies the call cannot return when it is
>> successul.
>>
>> I understand that 5.20.2 ("Caller reponsabilities" for SYSTEM_SUSPEND)
>> suggests the caller should apply all the rules from 5.4 ("Caller
>> responsabilties" for CPU_SUSPEND), but it is also mentioned that
>> SYSTEM_SUSPEND behave as the deepest power down state.
>>
>> So I don't think standby is an option. I would like an opinion from the
>> other maintainers.
> 
> Sure, let's discuss this with the others.
My understanding of the spec is that SYSTEM_SUSPEND is equivalent to CPU_SUSPEND
*for the deepest possible powerdown* state. CPU_SUSPEND can be implemented as
standby or powerdown, but the SYSTEM_SUSPEND only mentions powerdown state
(which is the true deepest state). Therefore I don't think standby could apply
to SYSTEM_SUSPEND and we could simply ignore the entry point address passed by OS.

~Michal

> 
>>
>>> +static int32_t do_psci_1_0_system_suspend(register_t epoint, register_t cid)
>>  > +{> +    struct vcpu *v;
>>> +    struct domain *d = current->domain;
>>> +
>>> +    /* Drop this check once SYSTEM_SUSPEND is supported in hardware domain */
>>> +    if ( is_hardware_domain(d) )
>>> +        return PSCI_NOT_SUPPORTED;
>>> +
>>> +    /* Ensure that all CPUs other than the calling one are offline */
>>> +    for_each_vcpu ( d, v )
>>> +    {
>>> +        if ( v != current && is_vcpu_online(v) )
>>
>> I think this is racy because you can still turn on a vCPU afterwards
>> from a vCPU you haven't checked.
>>
> 
> I'll think about how to protect against such cases.
> Thank you for pointing that out.
> 
>> Did you add this check just to follow the specification, or is there any
>> other problem in Xen?
> 
> Yes, it's just to comply with the specification — at least,
> I've never seen PSCI_DENIED triggered because of this check.
> It's a leftover from a previous patch series.
> 
>>
>>> +            return PSCI_DENIED;
>>  > +    }> +
>>> +    /*
>>> +     * System suspend requests are treated as performing standby
>>> +     * as this simplifies Xen implementation.
>>> +     *
>>> +     * Arm Power State Coordination Interface (DEN0022F.b)
>>
>> This comment is a bit too verbose. There is no need to copy/paste the
>> specification. You can just write a couple of sentence with link to the
>> specification.
> 
> Got it, I'll revise the comment accordingly.
> 
>>
>> Cheers,
>>
>> --
>> Julien Grall
>>
> 
> Best regards,
> Mykola


