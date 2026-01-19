Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A88FDD3B68D
	for <lists+xen-devel@lfdr.de>; Mon, 19 Jan 2026 20:02:08 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1208279.1520483 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vhuVM-0003T0-Iw; Mon, 19 Jan 2026 19:01:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1208279.1520483; Mon, 19 Jan 2026 19:01:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vhuVM-0003Py-FM; Mon, 19 Jan 2026 19:01:36 +0000
Received: by outflank-mailman (input) for mailman id 1208279;
 Mon, 19 Jan 2026 19:01:35 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=9b5m=7Y=citrix.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1vhuVK-0003Ps-UV
 for xen-devel@lists.xenproject.org; Mon, 19 Jan 2026 19:01:35 +0000
Received: from SA9PR02CU001.outbound.protection.outlook.com
 (mail-southcentralusazlp170130001.outbound.protection.outlook.com
 [2a01:111:f403:c10c::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 447dfa29-f569-11f0-b15e-2bf370ae4941;
 Mon, 19 Jan 2026 20:01:33 +0100 (CET)
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by CO1PR03MB7913.namprd03.prod.outlook.com (2603:10b6:303:274::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.11; Mon, 19 Jan
 2026 19:01:29 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37%4]) with mapi id 15.20.9520.011; Mon, 19 Jan 2026
 19:01:28 +0000
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
X-Inumbo-ID: 447dfa29-f569-11f0-b15e-2bf370ae4941
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wjvNUzh63bPr6qKCa1Zh2IEACo2095t0wxE7iiWRTJFTGez+kYaYyNjaY8Q9mKRgweTpuYkWZe0mDvKC8GvmZe6PEhhygBIC7MnWrzcn75nwfsP5abLaKjkgdxUrDcPTZH4tUXxdA0yk7f0S0y4TkqlNs3WiWU4zER9WutHNksJt7Hd71EIamL1ZpOvv5aLSncDBgyMjZdH4VWV2kpk0snWyUYWjAoOzYnAYyv7855D/8cezqSlRHtZenfdD47fcvzZ34sbICAUY6q/7gYq+zABhVkLUTBM5ZN8ZP0gsRWXnbvJeUiUF+hGt08WjA0U0IpXw+2TvtK5hOwn1hqLY4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=p6NSuYkMmYDfkae9kO2qKhlwOe6zic4bnQPFknOnPpg=;
 b=qng1AIywYYTRbViS+Vz0sZRqFZs+b/tlztvinTIPt6LlobSWkgNDYMrOJOd5EZIR93/GG9VpZ4VvspH+uQ7Bdd99pu0X3dZ7Vn1glZ1VLD6nGrwo/KfiXj5dV6Wafa3bZsTnSZwX/XT3+NUZMhPtrwUzuF1x8zbEAyY9frKxK4PHhQAud4TvDO4SIykcAToMyV83nI1SXmPgOlnboAT0uvQZjfahIKELXedLtil/zxl5XWeWQf/a5AUJt1cLTcKdJHQ1WpfZlsu+1nUK4Mdo2blEBtHNtGUSHD/0gJwMaDtGsCVm+pqfjHMB9eK/f2ZUrf1qIbQk/dnvRaTAynlVwQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=p6NSuYkMmYDfkae9kO2qKhlwOe6zic4bnQPFknOnPpg=;
 b=GhqNlV0EFA+d2MQ2dm11OSiy1HxzBMWsBCxWDg9zJ2/O9m3EtfYc20gDwznxBZ/oHCwXJBdOaIcWYR7nfNvDPGKUbxQJG/OGH8PD78c1Rbg/S4kGeNsUMg/qzpZGL67PBKpOSK4CUbbKHAAVMxoH1p8JTGHStiSsuCP88pPOvXo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <335949fc-059e-477c-9b2b-ddcd2f144300@citrix.com>
Date: Mon, 19 Jan 2026 19:01:25 +0000
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 "Daniel P . Smith" <dpsmith@apertussolutions.com>,
 =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>, Jan Beulich <jbeulich@suse.com>
Subject: Re: [PATCH] xen: Move NX handling to a dedicated place
To: Julian Vetter <julian.vetter@vates.tech>, xen-devel@lists.xenproject.org
References: <20260115151658.3725784-1-julian.vetter@vates.tech>
 <69b511db-654d-46b3-aca3-3f37f30d3473@citrix.com>
 <c4c2c376-ab6b-4bb3-9ede-091f791c1427@vates.tech>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
In-Reply-To: <c4c2c376-ab6b-4bb3-9ede-091f791c1427@vates.tech>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0679.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:351::12) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|CO1PR03MB7913:EE_
X-MS-Office365-Filtering-Correlation-Id: fac5c2bd-a62b-4b88-5376-08de578d26bf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?aUN3UFIyampHTzg0S0lYMGZ1Z2N3M3YzSDViK0hiZFVQMFVhRWNyZUthUzRS?=
 =?utf-8?B?enBMZlpDL2w3eWtsRlFQMUw4Mm91ZFl5QUdCMThZTVJ1SzhFeDBQWnFTTk1Z?=
 =?utf-8?B?RDJuWnVDRVJzeTloK0FVN2pYalY2OVJYZzVNSHlpZDhFbGV1ZjU5UXlYbkxk?=
 =?utf-8?B?K2xHSWluSGoyUlMzcEU5SGtPdlJoczR5ZEZGVEtMTVpsQTV0MTZFc0lCa3Vq?=
 =?utf-8?B?QW1MK1A4L2o2bHc5d0F1ODBDT0VERGJ1dTFCbDFNRHgxYWRmWSs2Z2xOU2RU?=
 =?utf-8?B?cjdyY0pUdXBxWXRFczZkQ3B1elMrQVpKczQ5MEkxRWNsRm5PbHdjcnBxU2N2?=
 =?utf-8?B?SVVXMnV1ZzBleDVKQTVqNjZWRkM2VEhoN1pPN1NHMmhXVTVCYXNib0haSXpy?=
 =?utf-8?B?MjFmOGFtREs1dFdvcy9kRlRQQlpGSE1CL2ZqTmgybkFiNE1vajJCRlc2d2xU?=
 =?utf-8?B?bEhMeFIzTUZ0aTBhc1dkS3pKbEpCcmFFSHVxT014S3I1aVFNVlZ3R002dnBm?=
 =?utf-8?B?OVREY0ZPRFlOQmdjSi9Pd255SGVJR0NWeDNIZDZFbklLcmM2Z21PN1BCeGlC?=
 =?utf-8?B?S1BIWE10WmlyWUtNbDF1bXZnVnNiZWtKakdXbVF6empHaE01UWJGcEVFM3Q1?=
 =?utf-8?B?TTJJeGIrRk9mSzl6RERPeW9JWVdIb1RuR3Z5blRGb0RxV1RPNGNQdGF4M09l?=
 =?utf-8?B?dkJjODN0bE43OCtXeDQydG1LMG5jak1zUWxQcDRvVk5ydC8xV0hmTFp3aVRO?=
 =?utf-8?B?MG1nMVV0RmhzNlMxMlNWeEh3Kzl1VFo0dkVTZzlzTkFLRG5hTURTV3FOd0c1?=
 =?utf-8?B?K1pybzhJVWc0WnQ1MEdUdWdHZEJaaFFUbXhEQ2VkU0F0UjJyZUd4VzZQZXU1?=
 =?utf-8?B?WjB4WVZYUjZzeUhjYjNscWtDRG1Td0FzdFlDblAyNjNxcXk4bmdiZWVrZ1Jr?=
 =?utf-8?B?UTBMMzFaRk9Ua1JsOGlkcHZ1MHJ6OHM5b01WUHJmclppNDUrRGF6Tk05U1lo?=
 =?utf-8?B?d0hqNXppSmR4WmN3dzNkSUkxWW93Rm8wR1hPeWFLL1V5dVJYclNybE5nbncz?=
 =?utf-8?B?cUVNUmE1NHQ1T1gvMnZNZkRjT0djT25zcWI2Q2daT1hmSmlQWVc2cUNDa054?=
 =?utf-8?B?K0VKT1h1eVNlazhwZUFmY3pSaWF1akJEL2s3TXBBY1Z0U2xWNTBSNzBQOGwz?=
 =?utf-8?B?SHRvV01obE4rdmxLNmhOYTdTcHIvOU04L2FPNk1GMndqZmY3bHRPSDNXTUVP?=
 =?utf-8?B?cjJ3Ry9sNjFYV2lmRHRJR3hKWFVQM05mbVVBeE9SNm5CeW5PdFZjaEsxRWlD?=
 =?utf-8?B?QnBpL2htWnJsMWJ4c200SWdFVHJwMXMwN3RUVnUxbVFmcU5yb1F1N2Q2RHdl?=
 =?utf-8?B?SERzd3dWQVNCaVMwWE5MdVdOTE5QTEk3UU1HajBQdGowYnFhbHJKb2lQeFhQ?=
 =?utf-8?B?TlNmTGxWLzd2UDhvQi9FTXVsSVpGelpmSzdoMUdjMnlTb2ZPL09naS9Pbks3?=
 =?utf-8?B?Sm5IVlltVWhtN2JQWGpiZ1dwams5VkdPMk94REQ2RGFQVHdTMWwxL3VGS2NK?=
 =?utf-8?B?T2xYNlh5ZW1tYmJpUkdBL0U0dms2c1grYWRKRjNFYlc2Z3dpQzhoNkwyeDRt?=
 =?utf-8?B?SE01ZHo2ZmZnWmhyT3NpY1hNM3IxKzJTVyswYy85WG1ydS9ZT3krZ1MwS1VH?=
 =?utf-8?B?Q2luNkNBNjM2dWk1WXd1cXJ5OHRpeEdOUDBoNU1BT0dXZnM0Sm1tY3pKS2Rm?=
 =?utf-8?B?dUZ0V1J3OStiQ3pUREFwNmN5aXA4TUR0endTSkljRVBFYmZydTlZQkNyNjVP?=
 =?utf-8?B?UzlIWlRwdTlUdzV1T2d4Z0JWRE9ncGdnczhKRWlZZHVPZE41ckNWREtIM21k?=
 =?utf-8?B?OVRPT0ZxeUtkSy9KdGtnVjFGZVpNbVRURElLTWlHM2d3SHFrN2hrNGE5UkJK?=
 =?utf-8?B?RVZHdGQvSk1zazBOSmw4a1N4ZkljVURmZ21DNzZMc3E2TVJkSlBsK3ZNMHd2?=
 =?utf-8?B?clRmWnZyMXNCTWlNWEExWWFaMldEYlFiVUlUV0RwMkVWSnpWdE5TS3dlTEh1?=
 =?utf-8?B?YThmcXBRSCtvOXMvaGJOSEJzTFo3amV3Q1QvV2VGbU81T09FbXgvTGc5NCtp?=
 =?utf-8?Q?xEgg=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?K1ZjY2xmZHZiaUZIbFhXSlBYZnVCTmErczhtcFBIWWdNN3E3am5USWtjZVFj?=
 =?utf-8?B?d0lObE1UM3g1cm9NWXU5NmVzMmdTMzZGY0w2U1U0WUNodlY3bEhRYWNTWktN?=
 =?utf-8?B?aGJsWVA3ZDZlT1hsdU9JUDdlQ1NDSHBNUDBUYkZwaFVoVlBCMndYdHhhNlF0?=
 =?utf-8?B?bDVTdzZQWVJDS2VkZmdHKzJOS1JSQ1Rmd0dNMGtSUVlqM2F0S2ZtcWVaV241?=
 =?utf-8?B?SDhLbDFJR2I4NkROMktRZ2ZIVzdyUEJZVTZpdDB0Nnp4Z3NaZGtDeWJkSEsw?=
 =?utf-8?B?VXRYOVpaMXBKUUZ0dUNrTTA2dlRJNTFUWEdpL21iRWRLMG1ldXZiNWRXUmNp?=
 =?utf-8?B?UEttdUVSS0J1U0ExMzVRb1F4MlFSdXhUaW5aNGVzOGd3dTFyTWlmbFdYSHBO?=
 =?utf-8?B?eklHS3d6dDhlTzZRdzhCWkhLaTRoUUlIOUxpNzlYd3k4K3hmTnFVejhJR2hv?=
 =?utf-8?B?aEtCLytnd2QwbXhPaHc2RkFnRVhVaTluSXhSZmlJRkNlWTNjU0wwSy9yYUtr?=
 =?utf-8?B?bERHd3U5R0JGU0JRdXF1TmRKcERwc25jNDQ4ckNxTWFHRGhwbDNjMVFYYnhC?=
 =?utf-8?B?MXA3cTdVUU94MGJkQmtLWkxCWlpkZUgveHVqY0RGRGxpckdwaDBCM25qQkZS?=
 =?utf-8?B?K1pLNTlFb2dpNWtCRnJLN2ZhSXZEZko0aGVPQlNUTUkrSERZdStMenJkR3d6?=
 =?utf-8?B?ZTdoMVR6UXdXQzBRUkFmRDFtNmhjMHozMEY3b2hWS3AyWHg4YVJTMjNIc1lO?=
 =?utf-8?B?Yy9nUmpJMUpvOEFCS2pJNnB3ZHhwWXFEM2FoWHhPempyRDdjaTA4blBaR1Uz?=
 =?utf-8?B?UnlOd2JMajNTZDUxZVltcjV5bGpLNnhrZHYwTXQ5ckZaQ3FVYThmYjNEZkNL?=
 =?utf-8?B?Y0lsSVVFZ29aOUZzbUdzdUZ5enBvWXJWSjVOa2x1RzBUZWZla3hwbjR2dFRn?=
 =?utf-8?B?Z1VjbS9BT3l1dDljZVFEck1TcFdFTEx5Wk1NN0F5Rkh2Z3VYNDYzNTRmV0lo?=
 =?utf-8?B?emduaWUrNWxiaEpyOVRkQUZYUFltUDVaYmEzcm9heGo0WVY3MTFFN01vRVIw?=
 =?utf-8?B?YWUvQ2tsZTNSUWlpS1RuRFhWS2F5RUE1azVJeC81UUFkZFVGYlo1SGZvWXJX?=
 =?utf-8?B?Z1dDeDQ4eG1uTUEwRDN4OXFpcjdxK2wzeHpmM2NBRUkrL0R6clFTcFBzMy9T?=
 =?utf-8?B?Z25LWXdESVJsd2Nla2ZuZnJjbnhjK0IwUkJpaUVaR2VSL0hOT256SUFyR05h?=
 =?utf-8?B?bURQbXEwdDRleStoZGw3VmZvUWRsUTZBZ1EwZktPL1lVSEhoRStadmNKTThs?=
 =?utf-8?B?TGJEOWhBeHhLTy9RaFUyREtsSHdQVHFyWndkR3A2cGlFaVVONytvdjNER0ZC?=
 =?utf-8?B?b3Q3bDdBM1lmaHhhSExEcWlJbzZrQ0s2cXgvcmE1VTA5Q25VK2l2UXVFWGVo?=
 =?utf-8?B?Uks0MTQ5UmJSNWFJUzZuQkpLSUNicmRLNjgwYm9tQzFSbkxXdDhmMUMwd25m?=
 =?utf-8?B?Q3VkejFvclJBK0Rqdk9sdGdRSm54eUdOaWg0K2VmS3NQRWR6SWtJdWpFb3hz?=
 =?utf-8?B?R21UNTVKbE8vVFRUVURzTjYwQU1NZ2NRUmgycUNXSm1wbzN3c2VNY0F6RThE?=
 =?utf-8?B?RXJwd1ZpV01ZYzJBZE5USTRITktGR3VEYjhrSkYvMzM1VjhxTEdVYkUrN2Ur?=
 =?utf-8?B?R1RwVHoxZy9VSGNwempRZkh6OG9sRVc1ajFITldFLzZlWW5TK0UwdmVkNmZB?=
 =?utf-8?B?QlBjTm0zVjFnWUJENjU5bTBNc0NmNDNwbHgzY2lLV1N1V3pJSm5URG1qTG5m?=
 =?utf-8?B?Nk1NaUZGZTZBaGZ1RE9VUDFhblRSdEc1dS9pR2RZdWdMSy93ZEoyZlVDcldo?=
 =?utf-8?B?SXlsOU9nV240M0ozeUFXZ0k2dUVDQnJBL1M3WW05eGxpenlhSTBvcWxiVmFG?=
 =?utf-8?B?K2V3bmx1b1kzNkYrQzRORFhGQmpXc0xiZFBpY1BzNWYxTy9ReWdKRXFvam42?=
 =?utf-8?B?WGZMYk5pOHpHVnUzajFqWFpQc1U1bGhJY2FKTzlDOXZUZFp5Tm55cjVCamRM?=
 =?utf-8?B?LzJxK1owU1phQWM0ZHNZOWZhSG45VXlQeW9MNG5wZzIwdmVrc3pKYjg1aWdw?=
 =?utf-8?B?cjcxMVhHSnNCaW9TTjFoL0kzT0xIMUdJNmhXMEplMHFReG40QkVsL2Z2MThk?=
 =?utf-8?B?ckcwUXNJQ0w2b2RBRWEydTJXTWRoL2NTSUtJN3FLWmhoUW4zTHplNzFKcXh1?=
 =?utf-8?B?Ui9iVkhYWHhkNnNXV0tJVE16L3AzZEVFZXc3LzVpSlVRMkNxZ1dqMkREWGp6?=
 =?utf-8?B?RXZIV2JHczV6ZkFoM2IzVjc2SDRPcTBiRURNcXJWcGw3L0pmNFRxZz09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fac5c2bd-a62b-4b88-5376-08de578d26bf
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jan 2026 19:01:28.5931
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ysi/vySjY/aZ5Xh3sOjD60NjptyK2Mg0Z4vkebsw4OkFem97QmC8OceZd2jJB+Pde4bBTXnNgN8Y1apIRCCPiPnwoEOK+GJBik/bRw0JlU0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR03MB7913

On 19/01/2026 10:34 am, Julian Vetter wrote:
> On 1/15/26 4:50 PM, Andrew Cooper wrote:
>> On 15/01/2026 3:17 pm, Julian Vetter wrote:
>>> +{
>>> +    uint64_t misc_enable;
>>> +    uint32_t eax, ebx, ecx, edx;
>>> +
>>> +    if ( !boot_cpu_has(X86_FEATURE_NX) )
>>> +    {
>>> +        /* Intel: try to unhide NX by clearing XD_DISABLE */
>>> +        cpuid(0, &eax, &ebx, &ecx, &edx);
>>> +        if ( ebx == X86_VENDOR_INTEL_EBX &&
>>> +             ecx == X86_VENDOR_INTEL_ECX &&
>>> +             edx == X86_VENDOR_INTEL_EDX )
>>> +        {
>>> +            rdmsrl(MSR_IA32_MISC_ENABLE, misc_enable);
>>> +            if ( misc_enable & MSR_IA32_MISC_ENABLE_XD_DISABLE )
>>> +            {
>>> +                misc_enable &= ~MSR_IA32_MISC_ENABLE_XD_DISABLE;
>>> +                wrmsrl(MSR_IA32_MISC_ENABLE, misc_enable);
>>> +
>>> +                /* Re-read CPUID after having cleared XD_DISABLE */
>>> +                boot_cpu_data.x86_capability[FEATURESET_e1d] = cpuid_edx(0x80000001U);
>>> +
>>> +                /* Adjust misc_enable_off for secondary startup and wakeup code */
>>> +                bootsym(trampoline_misc_enable_off) |= MSR_IA32_MISC_ENABLE_XD_DISABLE;
>>> +                printk(KERN_INFO "re-enabled NX (Execute Disable) protection\n");
>>> +            }
>>> +        }
>>> +        /* AMD: nothing we can do - NX must be enabled in BIOS */
>> The BIOS is only hiding the CPUID bit.  It's not blocking the use of NX.
> Yes, you're right.
>> You want to do a wrmsr_safe() trying to set EFER.NXE, and if it
>> succeeds, set the NX bit in MSR_K8_EXT_FEATURE_MASK to "unhide" it in
>> regular CPUID.  This is a little more tricky to arrange because it needs
>> doing on each CPU, not just the BSP.
> Ok, yes, I have modified the AMD side to use MSR_K8_EXT_FEATURE_MASK to 
> "unhide" it.

Great.  And contrary to the other thread, this really must modify the
mask MSRs rather than use setup_force_cpu_cap(), because we still need
it to be visible to PV guest kernels which can't see Xen's choice of
setup_force_cpu_cap().

>
>>> +    }
>>> +
>>> +    /* Enable EFER.NXE only if NX is available */
>>> +    if ( boot_cpu_has(X86_FEATURE_NX) )
>>> +    {
>>> +        if ( !(read_efer() & EFER_NXE) )
>>> +            write_efer(read_efer() | EFER_NXE);
>>> +
>>> +        /* Adjust trampoline_efer for secondary startup and wakeup code */
>>> +        bootsym(trampoline_efer) |= EFER_NXE;
>>> +    }
>>> +
>>> +    if ( IS_ENABLED(CONFIG_REQUIRE_NX) && !boot_cpu_has(X86_FEATURE_NX) )
>>> +        panic("This build of Xen requires NX support\n");
>>> +}
>>> +
>>>   /* How much of the directmap is prebuilt at compile time. */
>>>   #define PREBUILT_MAP_LIMIT (1 << L2_PAGETABLE_SHIFT)
>>>   
>>> @@ -1159,6 +1203,8 @@ void asmlinkage __init noreturn __start_xen(void)
>>>       rdmsrl(MSR_EFER, this_cpu(efer));
>>>       asm volatile ( "mov %%cr4,%0" : "=r" (info->cr4) );
>>>   
>>> +    nx_init();
>>> +
>>>       /* Enable NMIs.  Our loader (e.g. Tboot) may have left them disabled. */
>>>       enable_nmis();
>>>   
>> This is too early, as can be seen by the need to make a cpuid() call
>> rather than using boot_cpu_data.
>>
>> The cleanup I wanted to do was to create/rework early_cpu_init() to get
>> things in a better order, so the panic() could go at the end here.  The
>> current split we've got of early/regular CPU init was inherited from
>> Linux and can be collapsed substantially.
> I have tried to add the logic into the early_init_{intel,amd}() 
> functions. But it seems this is already too late in the boot chain. This 
> is why I put into an extra function which is called earlier. Because it 
> seems there are already pages with PAGE_NX being used on the way to 
> early_init_{intel,amd}(). Because when I put my code into 
> early_init_intel I get a fault and a reboot. What do you suggest?

Have you got the backtrace available?

It's probably easiest if I prototype the split I'd like to see, and you
integrate with that.

~Andrew

