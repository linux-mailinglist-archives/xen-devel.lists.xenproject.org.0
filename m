Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D8120A6DF56
	for <lists+xen-devel@lfdr.de>; Mon, 24 Mar 2025 17:11:28 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.925885.1328766 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1twkON-0006WP-SB; Mon, 24 Mar 2025 16:11:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 925885.1328766; Mon, 24 Mar 2025 16:11:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1twkON-0006RT-OY; Mon, 24 Mar 2025 16:11:11 +0000
Received: by outflank-mailman (input) for mailman id 925885;
 Mon, 24 Mar 2025 16:11:11 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=r2bg=WL=epam.com=grygorii_strashko@srs-se1.protection.inumbo.net>)
 id 1twkON-0006OX-4C
 for xen-devel@lists.xenproject.org; Mon, 24 Mar 2025 16:11:11 +0000
Received: from OSPPR02CU001.outbound.protection.outlook.com
 (mail-norwayeastazlp170130007.outbound.protection.outlook.com
 [2a01:111:f403:c20f::7])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 995f0683-08ca-11f0-9ea2-5ba50f476ded;
 Mon, 24 Mar 2025 17:11:10 +0100 (CET)
Received: from AS2PR03MB8907.eurprd03.prod.outlook.com (2603:10a6:20b:5e4::22)
 by DB8PR03MB6249.eurprd03.prod.outlook.com (2603:10a6:10:13c::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.42; Mon, 24 Mar
 2025 16:11:08 +0000
Received: from AS2PR03MB8907.eurprd03.prod.outlook.com
 ([fe80::804:c187:252a:9593]) by AS2PR03MB8907.eurprd03.prod.outlook.com
 ([fe80::804:c187:252a:9593%4]) with mapi id 15.20.8534.040; Mon, 24 Mar 2025
 16:11:08 +0000
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
X-Inumbo-ID: 995f0683-08ca-11f0-9ea2-5ba50f476ded
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=K4IxPnh5zuzEu1AJhFuRhry48U7Es5HqQUuHpRa7cG42Xf4M0sO6igiHWw19LS8A0bA+MHFnIksNb4WzbV40IM7DPMUq0ZZTdSz738sma6m88l1pjedejmaUJQAbUNNtoiii0dvHhSSEz6XwyLltcn92kQhhnMOL9pnvXs4MWhgNZnmZB9T4c5RSOLkGksfPcJDzD8i734WjmbIXrZrtgA4TWUdXmg5sLHZAsXMlG2DN7x+V7MHmoYoU+zAjhV/ZftN/JIWC2U30NxoGNbMuHebfYXC1wO0OgIYktMqB1yij3kbWP0en/ml260p9xtyaQOlfgDn08n6RqhhTR7h3Tg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Xikv3VdyLryQHpPQFe50uan+0UPkBKcY92q5TqYarTo=;
 b=QWCeOziflH3Z0MxRheCmag0e7l1R2NdeSwTYO5SYxZY/YDKWVLzhedBbMNGa2fFQpZya7QOWvfguYYlPO+GjHEa0p/cEP8zX2M57DSG2Oz9Bvlx57mU4FQjPR3baQQT/7rrXApW7X8RXyJo84cUJbaulPkmF+IpzW3q3eIrSA5yHJejpEsJ4nh4WncYCDerrN+rorTQa70AuNwX26dWGCbWrvuy3B/MSAlIkN9ziVGXkNE1VIj/JLvntYRlgm+DZo4mbPaMS4XnM5FKCREUS7D8Ie0Yp3p+Eurgt0sfHoQOF3ae0b17OCFV6vnLCp/HR3p+M73uqpvEGDaI3PJHwHQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Xikv3VdyLryQHpPQFe50uan+0UPkBKcY92q5TqYarTo=;
 b=iibC13okCxM91QJZClS9XKhgcVk4bbiJMHgXkp/s3UZelekagZmJKuk15/8anX5yJGLVn38pVZaZVy+WRf+P+LClfHNK58lsG+7mVXJw2DZG5YdkAJHL852+L2HFvRX8np+OTuCTEXdwjHO+2Fi4HPHF916F3HJ2x6+fHkW/gP6f4riuCVjdMHap6ssdkdvRi9LNnqXjGCrb3XDOvja8DutignxN2cTuqLMuZO3iD83gDyGn9Z26qJHj++nKWbqHwh/18cRf3+zcUJ81klBB3pZbS9tahGvVWjJsKws2BbH6zxWT3DRALmZGIpPZEKdMx3Xt7gQAQJbdpVhsJpOBNA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
Message-ID: <4d4baa38-ab14-4565-8e4f-1280fcde9d3d@epam.com>
Date: Mon, 24 Mar 2025 18:11:05 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v3 3/7] xen/arm: scmi-smc: passthrough SCMI SMC to
 guest domain
To: Anthony PERARD <anthony.perard@vates.tech>,
 Grygorii Strashko <gragst.linux@gmail.com>
Cc: xen-devel@lists.xenproject.org,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Michal Orzel <michal.orzel@amd.com>, Roger Pau Monne <roger.pau@citrix.com>,
 Jan Beulich <jbeulich@suse.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Oleksii Moisieiev <oleksii_moisieiev@epam.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>, Juergen Gross <jgross@suse.com>
References: <20250311111618.1850927-1-grygorii_strashko@epam.com>
 <20250311111618.1850927-4-grygorii_strashko@epam.com> <Z9RYDnUtlzvw_xpI@l14>
Content-Language: en-US
From: Grygorii Strashko <grygorii_strashko@epam.com>
In-Reply-To: <Z9RYDnUtlzvw_xpI@l14>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0167.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a0::6) To AS2PR03MB8907.eurprd03.prod.outlook.com
 (2603:10a6:20b:5e4::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS2PR03MB8907:EE_|DB8PR03MB6249:EE_
X-MS-Office365-Filtering-Correlation-Id: a54fd73f-8709-46d2-e5d3-08dd6aee7c64
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|7416014|376014|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?T3JQeWpDb2VWZzRELzZuamZFQ3VGWmFzYlEwUXRFdmM2S3BHVlEzTGYyOExY?=
 =?utf-8?B?WFVoTzlWeGhZM09oZWx5QmNoSXpweFlTZmxNRHcwZk9qdzJWWk5UNnNmM0Jv?=
 =?utf-8?B?V0xmNGRPMnlaNkNPdTZtd2Y5dE9ieFA2K3pyOU52b3dJWHVOK1pmeUJFNld6?=
 =?utf-8?B?RVFjbEUzUU1QUWhSdWlOL2VVZlZpK0UwZ2ord2NoSFRQNEh3N2htWi9wUllh?=
 =?utf-8?B?eUZmZmtIMnhwOVhmRjJwMG9ROThHeENPTkEwSXpMcHN1NFF3T3FDODRtUklu?=
 =?utf-8?B?Mlk0MFJocGZGamdnN044NkswaGg1MmgrNWVJMkZjZHZKWGdEWitQNDd6VmM4?=
 =?utf-8?B?SEUrdG5nTVk0ejRzaVdjSWl2dHA3bmc4dlBpR1lmY0w3bnhWdGhVWWIrK3h0?=
 =?utf-8?B?Vk1XajRoaDVEa0p4MGtwKzhEVXM4U214a3poYld2Z2RLeFpZMnkvT1BLaE1m?=
 =?utf-8?B?WjhXY0JjWlc1TlhsRjJNVnNNejVFUXoyR0lERTVXTHhKdkNSdnd6L2xHbm40?=
 =?utf-8?B?V21LcVZXNGNQajZlMXM4ell6OGxDcWJXWUxVWXk1dnM0SzhiV2RUOHViKzl6?=
 =?utf-8?B?bXJmM0VuOGpaelNqYlQzK0xlUHZvN3NaeVYwa0JIbEQyU0ZMcW9xNFk5MHZP?=
 =?utf-8?B?OVVxajNsWEpodlBHZlJqNEF5MmJTTjJqVkozR3B0YUJRb1lsSzVrRlJlVFdr?=
 =?utf-8?B?NUFDRHlHeTJWNDBQV3NZSFl4WjYyQW5qYVdiNjVGVkFCL1gxb20rR1NKUUcw?=
 =?utf-8?B?OUJ5Z3k1R2p4K2NLZUJrbGt1VjMxNWliOE5TNkNUY0tTM2p0NjFRM0ZPdXFP?=
 =?utf-8?B?UStMcEgzWkUxKy9lQzU3RldZU3dsMCt1eU8zZkhtRDdQYmp2T1RPL01pYXZR?=
 =?utf-8?B?M0lsRndseFBzZzdaTDE4aHNDaHZZVExpUnJyTFZuZzJ3bTY1TnlVNkI5Z25s?=
 =?utf-8?B?L1dmLzgyZzJCcU1lTGc5WFV2c0x2MWRtYmJzY0g3eFUyMzMyMnBHZEhramJs?=
 =?utf-8?B?ZFNJOUVHbGNiaW9sTFYzSmkyYmFxanJVZUJJUFpjQVg5ZXBUTmV0djBlUldM?=
 =?utf-8?B?NGZBT0puSndjcHcxeXRETHprVzh6cUdFV3FoMklmdTlZNFFxNUdXYlcxcWJi?=
 =?utf-8?B?M1BxTU1FWTdTMFRxV3U2UDNMK1VEYkNHTDl6dHcwWVNLMU5lbjV3a0xBN2xi?=
 =?utf-8?B?elBMZzlHOFVqeXIxK0Q2dllrMkJOb1EwV1RiVmc5QUpXZzRGSG9HNU56UWdu?=
 =?utf-8?B?Z0JoT2txUE1jNWEwekFHcTdtREhYT2t4MG9LNkZBdjNyQlJBRURxT1doVENL?=
 =?utf-8?B?a2VhQjF3a0Z5UUwxZE5iWHlsSzZQQTkwajcvOTFVSTlEelg3cGxwcHF4b096?=
 =?utf-8?B?L2VyY0FtTlRETGY2T1h0bHhUWnkraWZFRWhub0tkUzltSTBoTHlXcVE4UnRC?=
 =?utf-8?B?cjUzK0pVYWN0TStuOTZXeEx0RlcrZUpPcWVCd2hBcXZZbTExMi9uS0dUY0tu?=
 =?utf-8?B?ejV2L2tNRnYydGVaRTg5ZlBHYW9HVlpiK0E1REo0TXpZNWVIT0JrQW1sUFM1?=
 =?utf-8?B?ZEkzdjFpdFNiajByVyt0dHc4aU9UT0dTQnlETHJvanI4bU9vWTlIU3psNmdM?=
 =?utf-8?B?MHhTY1ZKbnJMSjh5M2xiZzdCdVFEWGVDMmVYdFZaekRZNE1QL2FKSVhsaWFQ?=
 =?utf-8?B?TkpPL3VvWDJoMUtmamNIbks5bmtFcE5zUlJ5VmdwOGNWaGpFSUJ2WURlMDdl?=
 =?utf-8?B?SFlSWVZKRUVJMTFMaXltdUNPR2xKT2I0OUdaRUpadkY5b3o4UjhBcmNSa2ZK?=
 =?utf-8?B?RjVpdUI2UnM4YTdGa3JHS0VLdUdiR0VBakt1TGEzUXZ2V244czB4Mi85T01Z?=
 =?utf-8?Q?ObWroBRxnyf//?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS2PR03MB8907.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?c3k1aGJkY1pyRzZ3VzRCbjZXTGhpbXFKcnYyQmRGTEI1TXRGZjNyRWU1WTRj?=
 =?utf-8?B?QnpBcDlWYTBESXhQSnV1cnAwK3RPT0phcFlZSjQ4WHJ4cFJZWXQ2TEhBUlBw?=
 =?utf-8?B?Nnl3aUdJSmZ6RnI5ekE3dVpWWHl3SGU2ZGFrMUhtYUh0ZVVwakVJbElnaHQr?=
 =?utf-8?B?MGFzZHZPU3hpZzVqVWYrNEZVeUI1Y09pZmI0VkkxcndDQkxRRjRTNFh5blNF?=
 =?utf-8?B?MFJleEpPSnA1dmtxWk93bWpYYlN2RDU3UVlQM1lSQWxMaUZ5ZVpyR3FpNWZE?=
 =?utf-8?B?UDFkdEtibGZ1N0E0N01TUExac2Z3ejB0QnF0d0pEeTRBZnVzbi8zKzRZcDlJ?=
 =?utf-8?B?M1k3Z1ZxNzc1T3lWdk1mdnlXV29OeDFKekRPck5OYUo2MDNnbUFLWk5IdTJp?=
 =?utf-8?B?ejE4aHkzQ1h3YUttV1NTM0ZVMm0xb2xiWVYxbE00d3diYkpRdzIvNXF5UEQy?=
 =?utf-8?B?MnVBT0FNc3h0OGR1RWdFU1NXTEEydVpqSHV4eVdYOTRCL2I3bHZZS2dYV0M5?=
 =?utf-8?B?b3VraTk5NzRlQ0hHVXZqb1BkbWV4THhod3VtNUR1aStMaGhjWE5nVzhIOWJC?=
 =?utf-8?B?VnJsTmg5MEdpWUxsdFRCMTd3YXVXOTQ4RmduRFdFT0ZKVTJpTityQWhHRFpu?=
 =?utf-8?B?dUlmd0s5Q01wRWhiV3RaRk5FeFp0K3E4MGpSQ0hkcDBabUJMSnVodkZDVWRl?=
 =?utf-8?B?WVQ2VWQxYUQzREVTdFlzcVh6SGJLRktqSXNNdU1JZ2E2cHdKY0tuQTVWeXJo?=
 =?utf-8?B?VWVPRlRkNEdPa3ZISjlFSVMxQ3o5UW5POUd5MDB6TVJiNjFUK0V5V1Izekpo?=
 =?utf-8?B?QzNWQ2dqalQrUlJjVHl1dlk1RHE1dnQraENySzllbFlMdFhVRUFEQ2xMb2NW?=
 =?utf-8?B?ZTMrS0pDemZlOVY1ejdqaDgrUXV0d1habUZ6NVgvZHpNeHNUU1FLZlYvWksx?=
 =?utf-8?B?VEV6MTAxSUMyYlpacnFSS1hhOEJ0cXdRSVE5Q3hXVTVlclFoQ25JTDYzaEpw?=
 =?utf-8?B?S1RLbDFFNUtGSitpejRWQ0FtbS9ldGVwQUNCT0d2Nk8zeklmUlAzdnUvdk9I?=
 =?utf-8?B?M0Rid2NpMndKaTFwY1ppaXZzamhMRE9Tdnk3cnZrbmFpZnFFSGNlTkFSb0ND?=
 =?utf-8?B?d2dQRDE3UjFDSm56a2pkNDU4RmFJVDFNSnBRVGtvdDBRRFJNUEJFaTQxOUlZ?=
 =?utf-8?B?T1RoY0ZzMll5ZDlXSExCbWJyTUxsdTBYZzBsais5L0JUM2FGWndmMWM4WTdP?=
 =?utf-8?B?bXpmVDliMVRMVUJpdFpMQndqTzBVNWt6bkE2bUFjazJPR1VuVmNOdUdZYUN4?=
 =?utf-8?B?MU1tTXljN0Q5dGljSi9aRERNeDBkVmJUV0lvU2ZHNUFSTWZPUVNHM256bEFT?=
 =?utf-8?B?dUE1ejUwSnYzWHlReWFxRHRJczdXRlpXVkowaUhhUU5sNEdVTllYa2FDODFt?=
 =?utf-8?B?dm1Ldy80Tkw2TWd2SFlxaGVJRGlkVUZRSUI3VmwwWU1LazgrdStQYjY2eE9U?=
 =?utf-8?B?R1FpcFJVbldOQ0kvSzNlaElibzZ1ak1rVHJIWXFMdExlcm1kRUNlTi8zM2Nl?=
 =?utf-8?B?a1dDekNJT0RrbEpTaG51YWxHTi9NbjlDY2lSODc2d0o2eksrNzV0MFZ4NFNx?=
 =?utf-8?B?Q1BMamtOUXQ0Znh4akY4cnBiY0RVL2plMU1ZdU15SVZYOUlLQ2cxM1VhYm5Y?=
 =?utf-8?B?L2lZRGFmZHljRkRlZFNaazl2NnArS0wyNVdZR3NuakV4TDByclhuS1dTSjdj?=
 =?utf-8?B?enNhb0lFVlNEaWJjek1Ybmpjc1N0L2JFWmI3bmFEeE1CZTJQZ1h0ZU1OUGJn?=
 =?utf-8?B?YzNaK3g1Y0Z4U1JaTmNjb1VzTjRsQjdEcHJHaG9LK3U3N0RnM2hKM2MxY0hr?=
 =?utf-8?B?TStzaXc5dGhpb2orSHh2M3RUUXlLVm5xdUFuN2FzTVFUWTNkNCt4bjFUbUsy?=
 =?utf-8?B?SVJtWWJudkdRYzhrc0g4SkFkdzlwOGJUa0gzZGFWcDBCemVKYmUxeWR5bFJI?=
 =?utf-8?B?S0J3a3QwallEdUpER3N2QURyQXdWWTlhZ1JWbGYzWDNVK0JrditsWjlBZXhz?=
 =?utf-8?B?V1J4OGRmSUVycnNyMnNPSFNCbGoya0RLbUFncVZYdlowZVBoQTI0RllJb09y?=
 =?utf-8?B?WVFOaVdwQk5pVXpSOWdZd0tmUTlxMXk5UUR1anRnMklUU2lWb2UzRHFPbXgz?=
 =?utf-8?B?K3c9PQ==?=
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a54fd73f-8709-46d2-e5d3-08dd6aee7c64
X-MS-Exchange-CrossTenant-AuthSource: AS2PR03MB8907.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Mar 2025 16:11:08.0127
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: o93k1f7tIaKdO423jbxRKi6CGd4tfFP+ynDOTK5blkAVE0IlaTlYsFIA8dNDiU3mwZGQn+NgJbUtIj0UKb3ERBOSSY8CHxasjzzHV5qoXfg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR03MB6249

Hi Anthony,

Thanks a lot for your comments.

On 14.03.25 18:23, Anthony PERARD wrote:
> On Tue, Mar 11, 2025 at 01:16:14PM +0200, Grygorii Strashko wrote:
>> diff --git a/docs/man/xl.cfg.5.pod.in b/docs/man/xl.cfg.5.pod.in
>> index 8e1422104e50..7edf272386e3 100644
>> --- a/docs/man/xl.cfg.5.pod.in
>> +++ b/docs/man/xl.cfg.5.pod.in
>> @@ -3094,6 +3094,42 @@ assigned to the domain.
>>   
>>   =back
>>   
>> +=over 4
> 
> This =over 4 is unnecessary, but you need to move that existing =back to
> the end of the Arm section, just before "=head3 x86" that we can see in
> the context of this patch. (And doing that will fix a compiliation
> failure ;-))
> 
>> +=item B<arm_sci="ARM_SCI_STRING">
>> +
>> +Set ARM_SCI specific options for the guest. ARM SCI is System
>> +Control Protocol allows domain to manage various functions that are provided
>> +by HW platform firmware.
>> +
>> +B<ARM_SCI_STRING> is a comma separated list of C<KEY=VALUE> settings,
>> +from the following list:
>> +
>> +=over 4
>> +
>> +=item B<type=STRING>
>> +
>> +Specifies an ARM SCI type for the guest.
>> +
>> +=over 4
>> +
>> +=item B<none>
>> +
>> +Don't allow guest to use ARM SCI if present on the platform. This is the
>> +default value.
>> +
>> +=item B<scmi_smc>
>> +
>> +Enables ARM SCMI SMC support for the guest by enabling SCMI over SMC calls
>> +forwarding from domain to the EL3 firmware (like Trusted Firmware-A) with a
>> +single SCMI OSPM agent support.
>> +Should be used together with B<dom0_scmi_smc_passthrough> Xen command line
>> +option.
>> +
>> +=back
>> +
>> +=back
>> +
>>   =head3 x86
>>   
>>   =over 4
>> diff --git a/tools/include/libxl.h b/tools/include/libxl.h
>> index f8fe4afd7dca..5fa43637ab76 100644
>> --- a/tools/include/libxl.h
>> +++ b/tools/include/libxl.h
>> @@ -313,6 +313,11 @@
>>    */
>>   #define LIBXL_HAVE_BUILDINFO_ARCH_NR_SPIS 1
>>   
>> +/*
>> + * libxl_domain_build_info has the arch_arm.sci* fields.
> 
> The new field seems to be called `arm_sci`. Did you intend to add `sci`
> in `arch_arm` instead? Also, there's only `type` been added to
> `arm_sci`, with the possibility to add more field in the future, so it
> would be better to say that only "type" exist.
> 
>> + */
>> +#define LIBXL_HAVE_BUILDINFO_ARCH_ARM_SCI 1
>> +
>>   /*
>>    * LIBXL_HAVE_SOFT_RESET indicates that libxl supports performing
>>    * 'soft reset' for domains and there is 'soft_reset' shutdown reason
>> diff --git a/tools/libs/light/libxl_types.idl b/tools/libs/light/libxl_types.idl
>> index 33c9cfc1a267..ea0d30654cdd 100644
>> --- a/tools/libs/light/libxl_types.idl
>> +++ b/tools/libs/light/libxl_types.idl
>> @@ -551,6 +551,15 @@ libxl_sve_type = Enumeration("sve_type", [
>>       (2048, "2048")
>>       ], init_val = "LIBXL_SVE_TYPE_DISABLED")
>>   
>> +libxl_arm_sci_type = Enumeration("arm_sci_type", [
>> +    (0, "none"),
>> +    (1, "scmi_smc")
>> +    ], init_val = "LIBXL_ARM_SCI_TYPE_NONE")
>> +
>> +libxl_arm_sci = Struct("arm_sci", [
>> +    ("type", libxl_arm_sci_type),
>> +    ])
>> +
>>   libxl_rdm_reserve = Struct("rdm_reserve", [
>>       ("strategy",    libxl_rdm_reserve_strategy),
>>       ("policy",      libxl_rdm_reserve_policy),
>> @@ -639,6 +648,7 @@ libxl_domain_build_info = Struct("domain_build_info",[
>>       ("apic",             libxl_defbool),
>>       ("dm_restrict",      libxl_defbool),
>>       ("tee",              libxl_tee_type),
>> +    ("arm_sci",          libxl_arm_sci),
>>       ("u", KeyedUnion(None, libxl_domain_type, "type",
>>                   [("hvm", Struct(None, [("firmware",         string),
>>                                          ("bios",             libxl_bios_type),
>> diff --git a/tools/xl/xl_parse.c b/tools/xl/xl_parse.c
>> index 9a3679c02325..ac9bf0b25c5a 100644
>> --- a/tools/xl/xl_parse.c
>> +++ b/tools/xl/xl_parse.c
>> @@ -1284,6 +1284,63 @@ out:
>>       if (rc) exit(EXIT_FAILURE);
>>   }
>>   
>> +static int parse_arm_sci_config(XLU_Config *cfg, libxl_arm_sci *arm_sci,
>> +                                const char *str)
>> +{
>> +    enum {
>> +        STATE_OPTION,
>> +        STATE_TYPE,
>> +        STATE_TERMINAL,
>> +    };
>> +    int ret, state = STATE_OPTION;
>> +    char *buf2, *tok, *ptr, *end;
>> +
>> +    if (NULL == (buf2 = ptr = strdup(str)))
>> +        return ERROR_NOMEM;
>> +
>> +    for (tok = ptr, end = ptr + strlen(ptr) + 1; ptr < end; ptr++) {
>> +        switch(state) {
>> +        case STATE_OPTION:
>> +            if (*ptr == '=') {
>> +                *ptr = '\0';
>> +                if (!strcmp(tok, "type")) {
>> +                    state = STATE_TYPE;
>> +                } else {
>> +                    fprintf(stderr, "Unknown ARM_SCI option: %s\n", tok);
>> +                    goto parse_error;
>> +                }
>> +                tok = ptr + 1;
>> +            }
>> +            break;
>> +        case STATE_TYPE:
>> +            if (*ptr == '\0' || *ptr == ',') {
>> +                state = *ptr == ',' ? STATE_OPTION : STATE_TERMINAL;
>> +                *ptr = '\0';
>> +                ret = libxl_arm_sci_type_from_string(tok, &arm_sci->type);
>> +                if (ret) {
>> +                    fprintf(stderr, "Unknown ARM_SCI type: %s\n", tok);
>> +                    goto parse_error;
>> +                }
>> +                tok = ptr + 1;
>> +            }
>> +            break;
>> +        default:
>> +            break;
> 
> Instead of rolling your own parsing algo, could you do something similar
> to the code that parse VIRTIO_DEVICE_STRING just above? It's basically a
> loop with strtok() and a bunch of MATCH_OPTION() call (see
> parse_virtio_config(), not the MATCH_OPTION for "type") which seems it
> would be enough for parsing the SCI string. It would make
> parse_arm_sci_config() much smaller and avoid a lot of repetition in the
> code.
> 
>> +        }
>> +    }
>> +
>> +    if (tok != ptr || state != STATE_TERMINAL)
>> +        goto parse_error;
>> +
>> +    free(buf2);
>> +
>> +    return 0;
>> +
>> +parse_error:
>> +    free(buf2);
>> +    return ERROR_INVAL;
>> +}
>> +
>>   void parse_config_data(const char *config_source,
>>                          const char *config_data,
>>                          int config_len,
>> @@ -2981,6 +3038,15 @@ skip_usbdev:
>>       if (!xlu_cfg_get_long (config, "nr_spis", &l, 0))
>>           b_info->arch_arm.nr_spis = l;
>>   
>> +    if (!xlu_cfg_get_string(config, "arm_sci", &buf, 1)) {
>> +        libxl_arm_sci arm_sci = { 0 };
> 
> Please use libxl_arm_sci_init() to initialise `arm_sci` instead. And add
> a call to libxl_arm_sci_dispose() at the end of this context.
> 
>> +        if (!parse_arm_sci_config(config, &arm_sci, buf)) {
>> +            b_info->arm_sci.type = arm_sci.type;
>> +        } else {
>> +            exit(EXIT_FAILURE);
>> +        }
>> +    }
>> +
>>       parse_vkb_list(config, d_config);
>>   
>>       d_config->virtios = NULL;

I think I understood you comments and will update accordingly.

-- 
Best regards,
-grygorii

