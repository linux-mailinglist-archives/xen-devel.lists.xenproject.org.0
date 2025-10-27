Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 43401C11928
	for <lists+xen-devel@lfdr.de>; Mon, 27 Oct 2025 22:43:50 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1151809.1482343 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vDUza-000514-UQ; Mon, 27 Oct 2025 21:43:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1151809.1482343; Mon, 27 Oct 2025 21:43:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vDUza-0004ya-Rh; Mon, 27 Oct 2025 21:43:06 +0000
Received: by outflank-mailman (input) for mailman id 1151809;
 Mon, 27 Oct 2025 21:43:06 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=JYa4=5E=citrix.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1vDUzZ-0004yU-RD
 for xen-devel@lists.xenproject.org; Mon, 27 Oct 2025 21:43:06 +0000
Received: from CY7PR03CU001.outbound.protection.outlook.com
 (mail-westcentralusazlp170100005.outbound.protection.outlook.com
 [2a01:111:f403:c112::5])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e9891c0e-b37d-11f0-980a-7dc792cee155;
 Mon, 27 Oct 2025 22:43:03 +0100 (CET)
Received: from DM4PR03MB7015.namprd03.prod.outlook.com (2603:10b6:8:42::8) by
 DS7PR03MB5478.namprd03.prod.outlook.com (2603:10b6:5:2c7::14) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9253.19; Mon, 27 Oct 2025 21:42:59 +0000
Received: from DM4PR03MB7015.namprd03.prod.outlook.com
 ([fe80::e21:7aa4:b1ef:a1f9]) by DM4PR03MB7015.namprd03.prod.outlook.com
 ([fe80::e21:7aa4:b1ef:a1f9%3]) with mapi id 15.20.9253.013; Mon, 27 Oct 2025
 21:42:59 +0000
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
X-Inumbo-ID: e9891c0e-b37d-11f0-980a-7dc792cee155
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=zLp/Am5++ZLe5rs5x9q3rRIn/ZcBi/zSSbvVXRyFQ6yfY7AcfAOzGPtALVEceeK/MIjodR+w55Igj64PK5YXiRgWrBnwN16noC1b/XbK3CiRL+Igs5PAw3f2x3pW+mUVadJc4rNxUarjezxwKuyUZNNsannGFSDbYHR70fvbIMBXZV1bOu0NczjK1hWkHA/4iWMSFj/OGcGcUQI+0ioELyuheHIrQW7iuys7Xg77kCycEKBQc8qIWH/JQugciQwPmBqZJ/kFhcTsRmbwvdiigf2NS4243xLnnPLU8SXzYfCYameWx+euBc9ZXTjPunl2CB+SJ44TP0sOUgSm9RaVSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JdxusukkMrfs6N8bXjciBy17VOiYIH89jb8VvYIkCxw=;
 b=CSASLKIm3jLM5SOODVnk200dNp7hW7p9dlXQ0A9ZWa0JBmtDuKF45FS/mYzbjN4r2ktcBzqz7Ubg3Ez78VoHFfmJlq/6g2pFXF/2YGymTZahY+TppxVsLRSXDaDs2JSijEcSzAOE3RddtWlGgWm/erY9J0b1/pPyzOV9LCXW8b5Y8FrjSOMknH+zzULAguTd+EnaW1MBZKUFEPGySSgZQq9MJofnh9Ap+qdh7krzVMzMLVg+eMrC+5tIu/nqZ1WZ0jE4K2E1njctvRcOxI4hrnVnwbVe4lxMEzHJWIS1yAQAwXCvVD3d9f85bVmI9DEK+kgF2UQph6o7jzm2i1pTMw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JdxusukkMrfs6N8bXjciBy17VOiYIH89jb8VvYIkCxw=;
 b=kPAPTUZwpc0Ucn6DuQ7lcb8EV+SnfYbyGRDfQTrOPFDqHK8rQZuaxkGVw+w31+S44f5FPlpDCxAeg9UgiLnU+mz/EOkr2rnkTbPBj25l6bOxRCTSEb/nMqZEljaeiJiLyEWmSsWfpdXrDZWRiPqUS6ZlMRvSKnHEqBRvUZ/Mirw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <894f0835-a384-4395-b3bd-98ee130c0ce5@citrix.com>
Date: Mon, 27 Oct 2025 21:42:56 +0000
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/5] x86/ucode: Relax digest check when Entrysign is fixed
 in firmware
To: Jan Beulich <jbeulich@suse.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20251020131955.2928261-1-andrew.cooper3@citrix.com>
 <20251020131955.2928261-6-andrew.cooper3@citrix.com>
 <dbe8a444-daf2-4929-921f-704aa5f48cde@suse.com>
 <8306217c-2f7b-4d69-b051-ae1e6b4f443a@citrix.com>
 <78874979-52ed-48f6-a9ba-4ddb6c78c208@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
In-Reply-To: <78874979-52ed-48f6-a9ba-4ddb6c78c208@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO2P265CA0052.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:60::16) To DM4PR03MB7015.namprd03.prod.outlook.com
 (2603:10b6:8:42::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR03MB7015:EE_|DS7PR03MB5478:EE_
X-MS-Office365-Filtering-Correlation-Id: 7ed69b1a-e318-48f7-cbb5-08de15a1cc05
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?YXd2eENONW5IcFk3b1RTVHU0NEI0N2RFZGhLby9iOU90c2lDZlA3aTlpUk1P?=
 =?utf-8?B?dEpGRWZWTy85bVh6bVMxMnVhQnBIK3haUzhITVgxbDRZb2lnWHZJc2JGTXJa?=
 =?utf-8?B?MlJidjhGM3A1YVBrTHJJZGhXdC93L0JJSkhuMzVSQmpBQkVuM2FkZkdTQTEz?=
 =?utf-8?B?dWlZSEIvdUZqNmQya01ieXlYNHBpTE1QczJob2pCQ0dvbVBqM0cyY3p4T2No?=
 =?utf-8?B?Y21teVpGOWZ6dDE4bTZvaDlIK01DUExhbzQyUDBySHMwNlVRRkErZ1kzZnRw?=
 =?utf-8?B?WFUybEI2NktkZ0xTTENMem5HZllicU90L2ZSS0J6NzBxNW16Ykk0YUl5d1lW?=
 =?utf-8?B?RGZTMnIzMjVwMHVqUEdXNFk4S0pPVnByZVNVZGlXQnhlR3lrdUhaOWIyQXc5?=
 =?utf-8?B?M0phNXVtb25vSXdEbkFBckFyT2FzanZVcWhhYmZZbStlRGJjbEdId05iMGNW?=
 =?utf-8?B?Y1lrTHZvL1pyN1Z2Z0EybUtweDkydEVpWkRVbEIxYVpQZTkxWWlHQ0FQLzN5?=
 =?utf-8?B?V1RYYXZMU3YxTVJjcXIzYkxHT0pvK3RwaFRQYjFQeERmUmxRdExmKzN4Q04x?=
 =?utf-8?B?c1JSUGp5RWtKeWRLK1VHRlo0c1dCM3h4d0tFNURpWUI2N3ZzRzhIQmNwMTFQ?=
 =?utf-8?B?M1MvQkpYNEdHVnYzZGw3S2RLWHBCZ2VEMnRDa2M0dndROURqU2xNc2w2N3Rx?=
 =?utf-8?B?VkVRU3pSYU4wV3RSblBKUE0ybHcvR1JTVlo5NHIvcjRkZHlTREx5YnRtSVRS?=
 =?utf-8?B?anpxbmRsWmdqOFJjb1cyODUzZ1ZVQ09odGRKMmZUYWR3ZFBhZWJOdXlMeHFa?=
 =?utf-8?B?SnJxamtjTG85QzZSaHluNVUyNlJiMzJPNjlvRFZJb0pEQjNFRkc1dnZ2eDZY?=
 =?utf-8?B?QjVTSU9WSUtUUXZDbHV0S3FoUUt3QjVIazh6aVF0TXJiOVhZbnNab0xaMTgy?=
 =?utf-8?B?RGJMSENSMlFqd2o5MlJzTnBoQWNDUXhBK2JKbUdKT3dieCtjWkdoQnFVZ25p?=
 =?utf-8?B?SmkwQXhiVTZpQzVBbXNFbkswUjBvZWluL0dEUkVQQlovdjdTVGJzb3VRbTRJ?=
 =?utf-8?B?Z1dTeHRZa3N1VGs3RDVJTjRPOEREaWt5R3VIVDBwd0VGaUdmUG4wTHhkalVn?=
 =?utf-8?B?RFlMWGIraE1IVUFFYkExR1pUQWE2VGFOS3BQc1QvVGFQQkZVUjRCaW9BTmhv?=
 =?utf-8?B?SnlEd2ZhZ1RzL0MxVGJEMThZUEtLYXBCMkJqdmJDOVlVRVhMQjd2VWg0WHVW?=
 =?utf-8?B?N2I5TEpFNEp5bjRCU1kxZUNyMFl0MVpYdmhvcHJ5VXpDalZ4NHBVdmhVZzNv?=
 =?utf-8?B?TmhTSlpmbnNxT2o2aGswdkdLRzAzMmRXZ1Y0ZDJIa2NkaHdKZW5tVlUrNFlh?=
 =?utf-8?B?bkQzcmVYSmN5VGVlNVhMSmVyUzN2L2lKdGZRYjFMOUoxejR1QytPeTQ4NEht?=
 =?utf-8?B?NFh5ZkVmZzFMQndkSUNYZndzZUJtaStrbGFXVWtHSUpSMWxDSzQ3RkErR21N?=
 =?utf-8?B?ZXlLbk9UMC9CKzFaNVZVdEl5YlR6MGxYVEZWbEFDMEsxTDkvMC9MU05iSzF4?=
 =?utf-8?B?bVcwK1E0MzdlK0RIQ1dZL213MjhtREhEVjA5STZOM0o1QkF1bkJPOVowbXJJ?=
 =?utf-8?B?dXBTMkg2YjRaUTk5d2JBRkZTVjN1QkMwWk5hekpzZ2NoS3p6WUtqcVBhazAz?=
 =?utf-8?B?QUdrMGYyRVByVW81Y0NsY3l0dWx4ems3Rm13MkNVMUNXRUhLOThlUHJFQ0ps?=
 =?utf-8?B?RFRmMk1IVUs3Wm5CR1pnVTV1SWQ4ZmlCc0JaNThFcERsTFErbUNkV1M5amk1?=
 =?utf-8?B?cHVVeVhFajRuNGRiczJxbWoyMEk4bjJTVjEvc0NMZUhldXdnc0p0RnplTnJX?=
 =?utf-8?B?VEl0N2VVUEFaL1JOZU40ek5HYkFsMUtvS2ZOZU5IZzd3M0czSmxVV1Zkc2tF?=
 =?utf-8?Q?HtZh2oLUOPeJfiwqvzgYy4rrgrrzbacJ?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR03MB7015.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TS9vUFFyQXJaUFNmOGtiZktzVnhlaVpkd1dicVNMQmVQaFRwL1c0TU45eDNJ?=
 =?utf-8?B?eC9CRWNPbkZUWXRHOWc2NTBpc1pRRUE4VHhDOTdNaUJtM0pBY2VVdFJsaEVB?=
 =?utf-8?B?UThEYTRhbE54d0IzOEdtUnlYOW0xU25kWTl1N2lrbWFmYkhTZUdBWCs4ZnF1?=
 =?utf-8?B?aFBVZXB3anhaYUw0dkJLUDRLT3pldGJQemhPdUdhWXorNG9yWGNha1RiVzEr?=
 =?utf-8?B?U1ZLYzYyMjZDcnIveVBsSFJtdWFieDJtYVlJWm9za3I3S3lTVzl0TUt4R0NL?=
 =?utf-8?B?SmtMa3FwbTR0cktlZ1lNMDBLTUlBMXFTZzlGQVRNR3BTRlMvaUthRFN1VndV?=
 =?utf-8?B?blhhNnpUcXQwbFc4d1dHS2ZtbDFiR0tqbTNSNmx3eDF4bDFLU0F0SEg1MWZn?=
 =?utf-8?B?a1I1enFEclZrZmxjcUYvUkg4WUxPbTk2c2lmMGxXOUtuc1piZ3dmTnhXcVNW?=
 =?utf-8?B?dWd1N20zcVZRSVdweHZaSC9Ca2xDSlorZ3IvWVpJQjhxOXZVZGREZ1krdnpQ?=
 =?utf-8?B?ZEx1am9yK1dwY1NNWmdZTVJYYS91L1A0VVVaQTFzWVRFQmhtYVJNRk1QTGV1?=
 =?utf-8?B?clQxbWFRUWJGVWhHcFNRREFKTUhoamc0NEpCYmVUN2lnUnpaRy9FdE4xWTlp?=
 =?utf-8?B?d2EyZEFlWmVSUzN0cWx3WitucVB5TXhPL2lBa0ZpbHQ1NVJyd1JUMTR6T0Rl?=
 =?utf-8?B?NDFTMHJ0SzFsdWtBOGpuQXRoSlNHenhlUys3eDdnbEN5bEhmb0QwamZGOGdG?=
 =?utf-8?B?SUZzY0NYTmZreGNpTnBsUVFjak55enpPbGJVSVI2aGswOFlTVnNEdU5iTVIr?=
 =?utf-8?B?TEhEVE1LdmtvWjhQTC9MZ2ZtamNNTk1kSzlxQ3MrT0hWZzZRMTUxbCtSVHhF?=
 =?utf-8?B?bDZUVnlPYmczYlB4K05obGw2eUxmR1NDRGNBS3JwSDYvTUhycVNZMFZxMm9o?=
 =?utf-8?B?Y0MxQUpqU0N1d1ZKTjVNcC9BNUh3RmRBbzN5cGU5T0RhNkg3QUpmaEx4bzJJ?=
 =?utf-8?B?bHFjK005enc5c0dFSDlEc1AwTStCcHZZNEp5V0tYeS9Ic2dDLzczL0haeWdy?=
 =?utf-8?B?Uk5MdUtMR0hDeHJlNXZnam9KUXBhQjM4L3VCaGEvQkE3SDl2S1o4WHl0TkZn?=
 =?utf-8?B?cklyNWdPc1ZqclgzczFZK3BFM0ZlYUJqSG9UMUJUU0NHQmNqdThnTFZZRlg3?=
 =?utf-8?B?RlZzaHVpM080RkMzbGZHdGxLNVJkWHBuZHYxT2NKZXQyUlQ5Snp1SnpVb0hS?=
 =?utf-8?B?ZGdqTWkzUjF0dWN1czRGU2hJeHJjeCtHU3dQVWtnY0xVTTlDaHJFYU92TTJL?=
 =?utf-8?B?VkcwcFZjSng5M1oxejV6dGZhS2RKSTRGOGVxdzNvRU9OT0dUNnlJdEIwVURJ?=
 =?utf-8?B?eGF1K0RCNUpzN3JzUkNuZk9hcjZJbTZIdGp1eno4RGtHLzlTZTBSUlM4OGN6?=
 =?utf-8?B?dTVTWm9mVHF1Qnl2Qko2MUxwMFhFdW9yUksxeTY1Mk1ERmY2NmlVR1Z0Q2xW?=
 =?utf-8?B?cnNxZUsxYU8rMnE5cGhpZ2E3dTZXc2pYZjYzcWhzQUNsKzhsLzZuS3Q4clVF?=
 =?utf-8?B?cXNOUVFUem9YajF3MjlhekpTbnpyb0RmVG9wY3VMdHgzU2JLWDlOWXpxdDVM?=
 =?utf-8?B?Uk5HYmJJQ0ljK1YrblpqNEdDYjdnQ2tLK2dQbHpXTUkyME4xWTNJeFJESVg2?=
 =?utf-8?B?TkFZQXpkYUxqbXJqQVkrOXZpOHh0UGd3WlZyU2VUNSszUmpSR25GaTFjR042?=
 =?utf-8?B?SkhTYytaczF3Z1lvSlpEcDFPc1BoQURxTmFXdDRmRWtmWVVLZ09YcWNwaGFt?=
 =?utf-8?B?ZUtpWTZ0a2pVWUhqQnJVVk1pNlpSdS9sWWwxZld2bFJXRmtPMWFlQkFwUXoy?=
 =?utf-8?B?b0pxKzVEb1AvODZwOEwwbVVwamVVMlZ1ZDVsYmIyQktWUDc2QWYvMGhQcDRU?=
 =?utf-8?B?S2F6S05GVFdXRCtOVVl4UXo3UW5uaWQ0a0xFNVNlSWlBUzRaYUFsN0o5dnV3?=
 =?utf-8?B?ajVET0R0U1RyU09KVmtydGlDQ1NReEU1b29vdmFlVUg3UmU1WDlwbk1rMUo4?=
 =?utf-8?B?NHZNdncwclN3aXFjMTlhY2cvcEJDNm5WbDB5ZjNVQ05aSmcweUo5M3JmTmQr?=
 =?utf-8?B?aXBjdXZJSVdYemdaaWxaY2xxdVh5QlNROGhNMW5YWENDYkpUM3NiT3RHQ1JC?=
 =?utf-8?B?eEE9PQ==?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7ed69b1a-e318-48f7-cbb5-08de15a1cc05
X-MS-Exchange-CrossTenant-AuthSource: DM4PR03MB7015.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Oct 2025 21:42:59.1587
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WJEbYjWW2+UVjAuxU/ZOzhmSZwwD1W+8r9GxPORK1FjrGTH3GHBURKNLjgotZ4CLDb29G9SdgnGLFzlqd+VwxiHGS4CirGkEEqNNA/mQQak=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR03MB5478

On 23/10/2025 8:05 am, Jan Beulich wrote:
> On 22.10.2025 23:19, Andrew Cooper wrote:
>> On 21/10/2025 10:47 am, Jan Beulich wrote:
>>> On 20.10.2025 15:19, Andrew Cooper wrote:
>>>> +void __init amd_check_entrysign(void)
>>>> +{
>>>> +    unsigned int curr_rev;
>>>> +    uint8_t fixed_rev;
>>>> +
>>>> +    if ( boot_cpu_data.vendor != X86_VENDOR_AMD ||
>>>> +         boot_cpu_data.family < 0x17 ||
>>>> +         boot_cpu_data.family > 0x1a )
>>>> +        return;
>>>> +
>>>> +    /*
>>>> +     * Table taken from Linux, which is the only known source of information
>>>> +     * about client revisions.
>>>> +     */
>>>> +    curr_rev = this_cpu(cpu_sig).rev;
>>>> +    switch ( curr_rev >> 8 )
>>>> +    {
>>>> +    case 0x080012: fixed_rev = 0x6f; break;
>>>> +    case 0x080082: fixed_rev = 0x0f; break;
>>> In your reply you mentioned a "general off-by-1" when comparing with Linux,
>>> but I'm in trouble understanding how both can be correct. Leaving aside the
>>> 1st line (for which you sent a Linux patch anyway), how can our
>>> "(uint8_t)curr_rev >= fixed_rev" (i.e. "(uint8_t)curr_rev >= 0x0f") further
>>> below be correct at the same time as Linux'es "return cur_rev <= 0x800820f"
>>> (indicating to the caller whether a SHA check is needed) is also correct?
>>> We say 0x0f is okay, while they demand a SHA check for that revision.
>>>
>>> In any event, whatever (legitimate) off-by-1 it is that I'm failing to spot,
>>> I think this would want explaining in the comment above.
>> What you've spotted is the off-by-one error.
>>
>> Linux is written as "curr <= last-vuln-rev" in order to do the digest check.
>>
>> Xen wants "cur >= first-fixed-rev"; I renamed the variable and forgot to
>> adjust the table to compensate.  I've already fixed it in v2, so this
>> line now reads fixed_rev = 0x0a.
> Now I'm even more confused. If Linux uses 0x0f for last-vuln-rev, how would
> 0x0a be first-fixed-ref?

Sorry, that was a typo in my email.  I've got 0x10 locally.

>
>>>> +    case 0x083010: fixed_rev = 0x7c; break;
>>>> +    case 0x086001: fixed_rev = 0x0e; break;
>>>> +    case 0x086081: fixed_rev = 0x08; break;
>>>> +    case 0x087010: fixed_rev = 0x34; break;
>>>> +    case 0x08a000: fixed_rev = 0x0a; break;
>>>> +    case 0x0a0010: fixed_rev = 0x7a; break;
>>>> +    case 0x0a0011: fixed_rev = 0xda; break;
>>>> +    case 0x0a0012: fixed_rev = 0x43; break;
>>>> +    case 0x0a0082: fixed_rev = 0x0e; break;
>>>> +    case 0x0a1011: fixed_rev = 0x53; break;
>>>> +    case 0x0a1012: fixed_rev = 0x4e; break;
>>>> +    case 0x0a1081: fixed_rev = 0x09; break;
>>>> +    case 0x0a2010: fixed_rev = 0x2f; break;
>>>> +    case 0x0a2012: fixed_rev = 0x12; break;
>>>> +    case 0x0a4041: fixed_rev = 0x09; break;
>>>> +    case 0x0a5000: fixed_rev = 0x13; break;
>>>> +    case 0x0a6012: fixed_rev = 0x0a; break;
>>>> +    case 0x0a7041: fixed_rev = 0x09; break;
>>>> +    case 0x0a7052: fixed_rev = 0x08; break;
>>>> +    case 0x0a7080: fixed_rev = 0x09; break;
>>>> +    case 0x0a70c0: fixed_rev = 0x09; break;
>>>> +    case 0x0aa001: fixed_rev = 0x16; break;
>>>> +    case 0x0aa002: fixed_rev = 0x18; break;
>>>> +    case 0x0b0021: fixed_rev = 0x46; break;
>>>> +    case 0x0b1010: fixed_rev = 0x46; break;
>>>> +    case 0x0b2040: fixed_rev = 0x31; break;
>>>> +    case 0x0b4040: fixed_rev = 0x31; break;
>>>> +    case 0x0b6000: fixed_rev = 0x31; break;
>>>> +    case 0x0b7000: fixed_rev = 0x31; break;
>>> Without at least brief model related comments this looks extremely opaque.
>>> Linux, as a minimal reference, at least has cpuid_to_ucode_rev() and the
>>> accompanying union zen_patch_rev.
>> We have other tables like this in Xen.  Linux has even more.
> The one in amd-patch-digests.c I'm aware of. Oh, and tsa_calculations().
> But ...
>
>> These case labels are family/model/steppings, but not in the same format
>> as CPUID.1.EAX, and also not in the same format at patch->processor_id.
> ... none of them explaining what these numbers really mean isn't helpful.
> I didn't question them earlier because I assumed them to be all "magic".
> Now that I learned how they're encoded, I thought it might be (have been)
> nice if they weren't left as "entirely magic".

Well - they are about as magic as numbers get.

It's just a convention that AMD uses when choosing the (otherwise
arbitrary) patch_id, and I'm not aware of it being written down
anywhere.  Using the entrysign vulnerability, AIUI you can choose an
arbitrary 32bit value here.

Linux says it's from Fam17h onwards, but the pattern works from Fam12h,
and Fam10h was definitely different.

I've got no idea how long it will continue.  For one, the 8-bit ucode
revision is proving to be a limiting factor on some CPUs, and e.g. one
of the 3 F/M/S encoding (patch->processor_id) will run out when we hit
Zen15 CPUs at the current rate that AMD are using Family numbers.

>>>  Background of my remark is that I would
>>> have expected there to be more models per Zen<N>, seeing in particular how
>>> many different BKDGs / PPRs and RGs there are. Many RGs in particular say
>>> they apply to a range of models, yet no similar ranges are covered here
>>> (unless my deciphering attempts went wrong).
>> PPRs/RGs are generally per block of 0x10 models and all steppings
>> therewith.  This is quite often one production CPU and a handful of
>> preproduction steppings, but e.g. Milan and MilanX are two production
>> CPUs share a same PPR/RG, as they differ only by stepping.
>>
>> Preproduction CPUs probably won't have a fix (other than the final two
>> rows which are A0 stepping of something presumably trying to get out of
>> the door when Entrysign was found.)  The list does look to be right
>> order of magnitude for the production CPUs.
> Sure, and my question wasn't towards steppings of individual models. My
> question was towards models of individual families, where the docs
> suggest far more exist than this table would cover. I guess that while
> talking mainly of steppings, you really (also) meant to say that most of
> the model numbers weren't used in practice (for production CPUs) either?

AMD's numbering space is very sparse.  From a block of 0x10 (or in some
cases 8) model numbers, it's uncommon to see anything other than 0 or 1.

~Andrew

