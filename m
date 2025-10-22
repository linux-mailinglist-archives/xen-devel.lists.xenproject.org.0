Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D9D6DBFB5C7
	for <lists+xen-devel@lfdr.de>; Wed, 22 Oct 2025 12:16:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1147849.1479995 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vBVsg-0005d8-S4; Wed, 22 Oct 2025 10:15:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1147849.1479995; Wed, 22 Oct 2025 10:15:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vBVsg-0005bS-PI; Wed, 22 Oct 2025 10:15:46 +0000
Received: by outflank-mailman (input) for mailman id 1147849;
 Wed, 22 Oct 2025 10:15:44 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+n4a=47=citrix.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1vBVse-0005bJ-L0
 for xen-devel@lists.xenproject.org; Wed, 22 Oct 2025 10:15:44 +0000
Received: from SN4PR0501CU005.outbound.protection.outlook.com
 (mail-southcentralusazlp170110003.outbound.protection.outlook.com
 [2a01:111:f403:c10d::3])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 110d2e21-af30-11f0-9d15-b5c5bf9af7f9;
 Wed, 22 Oct 2025 12:15:43 +0200 (CEST)
Received: from DM4PR03MB7015.namprd03.prod.outlook.com (2603:10b6:8:42::8) by
 CH8PR03MB8202.namprd03.prod.outlook.com (2603:10b6:610:2c4::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.12; Wed, 22 Oct
 2025 10:15:41 +0000
Received: from DM4PR03MB7015.namprd03.prod.outlook.com
 ([fe80::e21:7aa4:b1ef:a1f9]) by DM4PR03MB7015.namprd03.prod.outlook.com
 ([fe80::e21:7aa4:b1ef:a1f9%3]) with mapi id 15.20.9253.011; Wed, 22 Oct 2025
 10:15:41 +0000
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
X-Inumbo-ID: 110d2e21-af30-11f0-9d15-b5c5bf9af7f9
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IG59CU4qbRmqIE+2drzehNDX2a0L11fFDFeHfhu43uU5C7j1lcvdHtnl48pJkrP6wJKakwhfk3FQc6w9qxKmpfbr36vXXFt51wJ1dD95SJ+jsFu5Va1v6VBHt+jB0Cuc6ML6w1ock/N38Yc415oCxDt1t0t1DXIfQa2lkV5xHl+4t1FIrGTXLhBGTGLoJDVEc9oN5jdaONFTwA2/8jPwhRsvkI98ejq3zWvtqmYHdwjMhkg8zK/hFa+HafN644GsaXmHj68vDljsqNt4Mbw/4M9mPH3Y7aA2VZGzlvTqpjarp9qvXKJ/OMoa58a85n/RAR/nn0fphwfSiSBL4bTLbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6A1MJbIBK9f1FqQJdobW71kVnUKHWBjhSG3tjRRy1BU=;
 b=dBlt2EbgX2FUF4uFI0qvrU6opwELAvGXHtityvUwTSl0UJDzJ1ervMXQIERJ1RyhpM2/2yWWlpMFsfEgIKlR2r3HEk9RE3OKtFJFs39JZZq+H8Y3hxvfbQ8W9AFVWrPzyB9RCgYvF1PlPGY2KJYFCmPg1r1Ta8GctPJrPBH8YJsSW/qCzHBIsHqIe+rqFRPKUgJAXBHIT4Kfz0iiucBWoYmYH5dMiBPr695NjJfx0fcLSZb+p2d2lw/9jUPwHK7d2aV/G/MjCqc5SNcLC5Abt3ScTqSKWQyVLMdWXA0jhUVwzlyFYB/bWCXXs7P0hHKfCK3mOou8ea/P73fQ7QzueA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6A1MJbIBK9f1FqQJdobW71kVnUKHWBjhSG3tjRRy1BU=;
 b=iOxVQTD3QaxnD1iw+++GDDUQrNBniRVW+7laSoD+JaSD2uW2aWFenp7neppnzyFDHKbUoRH9+HOATMr6lxNpASP2rBC1h+GoPL7NTn7DI8tbIdI4qMaGoU3neh2rKfDyrpQ4BxV1HOc3JAnMAnIM6+sKjrSy/ebcLxwQMD+/mzQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <1dd932c3-07b4-4fb4-b974-7e4ed58d998a@citrix.com>
Date: Wed, 22 Oct 2025 11:15:38 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/4] vtd: Remove IO_xAPIC_route_entry macro
To: Teddy Astie <teddy.astie@vates.tech>, xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>
References: <cover.1761124632.git.teddy.astie@vates.tech>
 <540db157df0f0f6e27c7b50edc6a7d82fe668608.1761124632.git.teddy.astie@vates.tech>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
In-Reply-To: <540db157df0f0f6e27c7b50edc6a7d82fe668608.1761124632.git.teddy.astie@vates.tech>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO2P265CA0404.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:f::32) To DM4PR03MB7015.namprd03.prod.outlook.com
 (2603:10b6:8:42::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR03MB7015:EE_|CH8PR03MB8202:EE_
X-MS-Office365-Filtering-Correlation-Id: 36b70278-0d83-41d0-f4e4-08de1153f47d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?aGJHOGlmRlNONkZ3TUxMT2pPS2VzVkJZaWErb0JmZWdFM1U2cWlJcW9IMS9k?=
 =?utf-8?B?YVBxN2xmZFpZY2FYUE5vRVhNeDVKaFJLTHFHQ0JHS210NXRNMkYwWGZrdVNj?=
 =?utf-8?B?SkUySWF1Yy9Bb1JxM29zc2JDK1Fna3FTYmFxSWwrMk11S3RoVVlCTzRsK0sy?=
 =?utf-8?B?MCtyY3NOWllDUjlwZDRhdCtMaGpzT0Nrd2NvWmQyV1ZCSmVrWWUveE9vVity?=
 =?utf-8?B?dS9IRmhBbG1ENk4yem0yY2xEamFZcmVjVlhhWkRGSkFiWjF5ZGNwM1AvQ0VT?=
 =?utf-8?B?c1hYY0sxV1BVelFkTjhLbHFFUjE1SDZZOFJBU25kam9GS3JURFQycUlDQjhj?=
 =?utf-8?B?VWFVeGJ6UnR4YTNvUFI2T3QwaXcwaXcyZ2hoMWdyd3Q1UGdFUHkvcXZNOHd5?=
 =?utf-8?B?WlY4Zi9Ya2JYRFhjazZFRE84ZVIzRVhJMXYwVzRsOUQwU0lhUzFuVkwzcElq?=
 =?utf-8?B?MCtUbklkRTE4TkhlWjNYTTV4TnI5RFRUaG9kNnI3Zk9DMkJEY3FOMzlXeDFn?=
 =?utf-8?B?aG9JVkRKTDdSM2dXYWd4eEJNUkg2TE1CRFluak9OYS8wQ1JKTTNYajNlbkxT?=
 =?utf-8?B?Z1drNmwwK0FzTlVTY1lRYjY2Z0dYbzlIUHFFY1hvNVA0WFNBbmlxTERmWWla?=
 =?utf-8?B?bkNoSXoraEcvdUhQZGhLbTRiQ1BEbjg3WGt0bW1KVWxuNXBXeWlDMy8vNzFM?=
 =?utf-8?B?UitSZisybjZ4U3E4UVNTVXFDOWQ0SmxqWE5FN3M4QlVmMEllbHcvYXgwcGNP?=
 =?utf-8?B?WGx1M2NQR0F4UGUzaTg0enB6alRVZmhlRmZraFh4Zi9EZFF3aVNqbG0zZXNW?=
 =?utf-8?B?ODhjQ2E4MmRlU21GNys4NFhaL3dDdTRXa2MzL0tmai9tUTYzQ2NTUnhQS09D?=
 =?utf-8?B?RWZ6eGhVZzhkMHVDNUpyZU41OFE5UkZhd1RYazZBckY3SXJITDlyWE5mUms3?=
 =?utf-8?B?SnNJa2M0RGpwZ2JlNnNRVU5EWmxvRlJXQWR3ZkdWVnFaTEo5eSszcUl6aEli?=
 =?utf-8?B?TzV6RUlzTEplZk5idlRZc0hFS0I2ajlrNHZ0L1N2aXdYemx3QlRPOXQ3L3VB?=
 =?utf-8?B?TlBxYk9xS0hzT054ZG1Hdkp0RGNJU1hkUUFOamVpamxXank0Y1kzV1hyRXBY?=
 =?utf-8?B?NFlBZ3hTSVFXSU9wa1JoNkhtS1NVS01nQ2ZHNkYvYkRscGM1cFN5eUE1OXR1?=
 =?utf-8?B?TnZ4L2dqV1FCU3daR25rbngvcGFiVGZlZ1pqY0RzVVYyRTVpVE5GS1RwdytU?=
 =?utf-8?B?ZnQ3ZUJxYS9UNkcxVW1wQnJTaEIrRjlJYkxxVVZja0Q2MURtNDNhb1YwUlEv?=
 =?utf-8?B?RzJXRTZlcGp5bVNuZHVsV2w5ajNFSmtwQ016Ry9IRENHMlM5UElxMmcwdVNK?=
 =?utf-8?B?dkFyNUlJeXlTcVJxLy9iUzg0Sm9yZTY0dVRqYlplWjNyZElLU0ZiODdIeG84?=
 =?utf-8?B?VCsvcW9oRHFxRTg4NkF6WHp3Mkp1WkpKWHYrM0tiMkErVDNueDduR1ZNMHcx?=
 =?utf-8?B?cGhXeTBISVIrKzdwQmFFcmIvVjlIR1MyQ3BqRVR5VFFrRUZtNUNnbTRUbkJJ?=
 =?utf-8?B?M0pHK2NCUnpTT3U3VHpGV2xvNVo1SHFtTlB6ak0rcndBMFVFRndhRUYwQVhx?=
 =?utf-8?B?K1MyOGNkN2ZWSkdvU0FBU2lNbi9hSkNKRUF2bjcyNG1pTDJ0MHNxTzBvLytG?=
 =?utf-8?B?VzFHNlJwTmsxUWZmdTBvMkRFTFNFTlZxOFBSRzBXQTNpNGcxMU00WG04cTNv?=
 =?utf-8?B?ckdJeUJhb25vT1l2MkxHcTBkZ1RsUTlONWk2V01PY0lZTHd1Yy9rZWc3TVpv?=
 =?utf-8?B?VzJRcnJMN20zT2xDN3NmU2VLbUVCcmwrT1VYK2hydnFRb1dLY2lTVmNScXR5?=
 =?utf-8?B?SGlkNHdBTVVvTWhNMWxUUVR3aE5KdmxuendwdDBycXUrZVovamtxT3EyMjlz?=
 =?utf-8?Q?3nSZ9ahXGxwbxO1Rcdjzk5Fbms8XNxCu?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR03MB7015.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Y2xrellPaVN6L01HcWtXMGpjbTY5WjRtS2g3MmJLNlZETUVZem8zMmdCUlcz?=
 =?utf-8?B?emJLQ3VHTFNWeGdmZ3JnWXM4Nmp5c24xbFVLalBZWGpoUGhDYkpTWGZDUWY5?=
 =?utf-8?B?Mm4rNTYycHFjUnd3UXVoVjB0bDVUUyttcUc5cklpdWl4cXlQRThpUDVxeGV1?=
 =?utf-8?B?SUN0eTJOMWtWMWtyVU1uOXJaOTg2TUN0M1d0ZDFDdkd4SStpdWc3aGNvUkM2?=
 =?utf-8?B?V2IvMmtIUldEcTVMN0tEZjJjVThtRXdRN2JmdDZMNXQyMjhBZXVNUEE2TWpS?=
 =?utf-8?B?Z3RlQ0J3eU9BTFlVZjRHcFFCU0NVUEd2M1FpY3dmWkJiTnorQzZzWUNZRW9q?=
 =?utf-8?B?NDRNWHFvNTZRZjllMHY3Y3poYkRjOWhoNnhsZTlXa0FjVjRFM0JGVVF3cEEx?=
 =?utf-8?B?UWRkTVRFVXA5MW1Rb0JTaEFnVVRhR28yMGtLTmF4RDRkdVAya3lhL0pic1pC?=
 =?utf-8?B?aVo0eVp1aXhOMmtxVzBUN0VxZ01KUjlmeXlPcXN3OFlvbGpmWWw0VXB3Qml1?=
 =?utf-8?B?RDd3Uzl3MEFncXAxZnVEYUVkWVovYmc4WFpkSUZ6ZHJzODlvN2pDQnM5VHR0?=
 =?utf-8?B?ZnNlYzBWb083NlE0Y1I0Z2N6ZUd2N0RSeDEzWUFtRWFlOWlMUE5qR3p5bUdY?=
 =?utf-8?B?dDBHZHNiVWFkUk5CMjNOemFYSVBkQVh0aVJpZlpxVU1aZW9QVkpJNXFOU01y?=
 =?utf-8?B?MVRiZVBkeGhSTkxnYllRRDBSRlRCNUVBRkZaYkNvOVBUV2ZpZ2wvNWp1UWFK?=
 =?utf-8?B?eW0ya2RMSktHL0I2T0E0NXplUVR6QXRPVWlSaVkvNXNjYVlDcjVCVnJBRER4?=
 =?utf-8?B?L3lmYlJUN0phRWY3b1o0MUJidnJUc0xHdG9hZmllY1ppVEZueW02YkRzTGhR?=
 =?utf-8?B?NlkxanJwM2dpVUZ4ZG1pV3NXN0hUQmJpbWV0SWRzRWROTDZ1L3liTDJrRjFG?=
 =?utf-8?B?SGp6c2EyU0U3dUhZbjVreUZMaDNwa2pJazhtTnRYbHZNekxxcVVYOGJ4L3N0?=
 =?utf-8?B?ZVpwN3BmVVBmSy9xWlNHUERnaVJMV1ViQ1ZBTmJOZWx2SzNZR3VLYmhZV0t3?=
 =?utf-8?B?Yll0bEVoVFZVZG0wSVRRdWtIdGJaMFA3T1c3R3l3RTl6KzMvVGtqZFlNY3NM?=
 =?utf-8?B?T3pBeGxXZTBTYS9iYVk3Q1BSYzcvbEphc2lEdEliNkV1TWVOSE9vS0Zoc1VH?=
 =?utf-8?B?UHRBUW1QZ1hGelN3TWx4YTdhamJjdTZQSXc0eFlWR0hvVEFzU1REcWZBMm5v?=
 =?utf-8?B?eFNYY2NoVnhJc1dNT1FRMjZLaCtMcjhkbFowbk9VT0c1V1VXam9MMDFUWEVB?=
 =?utf-8?B?SVkwODVTQUN6VVNDc01tcTE5UytFUlRzM3F2TlUxcDNab3VlWFFNS1ZmbzVB?=
 =?utf-8?B?QUVnU1hzYnh3di9oc0tZRXkvcUhEay9DZ0dza2FUdUlsV2pKc3VOSVc1TGh4?=
 =?utf-8?B?RU9KTGZaSWJKcTJvRzFsRUp2MGROTUNKdmg2YjQ1VVN4cmgvSkM5QTdRQ0xi?=
 =?utf-8?B?aDdGSFFrUGNIdXhSUC9XREIxTVZVa0Z3Mit5dTd0SytEclUzUzZ3SUVCUHVC?=
 =?utf-8?B?OFl4NlQ2Y1Q2ZGkrSEpjSzZMZVhlZ0hQR2xuejN5NzJzVEpYVG9EUlhOSmxJ?=
 =?utf-8?B?UzhlTndid0R4SlJiLzhmS0JjaTdzdW1CSG1yeFlzcjJFMGMzRzdpOGV2U0wx?=
 =?utf-8?B?WlQvUVE4cHdMTnFteXNwZk9veVJ1RXZpUm5HQ2VUNnJucWs4ZnVtWERFVXhJ?=
 =?utf-8?B?ai9rY1ozNHhGaitaUTBOc25qc2JIZEhncEtxVXlsZStpYnR2YUxPdUc3S0w3?=
 =?utf-8?B?aW4zU0RINGE5UFRKNlo4OUloTC8vd0pFVzgyNjRWMlhqMEJJY0NiUmY1Q0pt?=
 =?utf-8?B?cUZJVTBwYmhteWJQMkJPOG1PcGJFWmw1amowYlBiTlF4MWtHbUtlU05lZVE0?=
 =?utf-8?B?L2YvU1dFdTRodlNSUUFwVGpOZDFQVzFGN3g3ZDNYU1MrdEkxV3FhT3V4d0ZT?=
 =?utf-8?B?MlJ2Tzh0dE4wT01yU1J3eVA4dm1RZkhaZzlEbGUwaC9MK0J3b2ZieEl0OEJh?=
 =?utf-8?B?Z1RTQnhaZzRwb1RoVDRlNFY5Wllrakg1UlFXZ0h0aHM2STF6eEZKblVHOVQ4?=
 =?utf-8?B?a3Y5WjhUZ2l6Y1l2eWZnQWowdFpWN2Q0S0c0dm9PK3YzNjFhVmViMnZvcGZL?=
 =?utf-8?B?ZkE9PQ==?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 36b70278-0d83-41d0-f4e4-08de1153f47d
X-MS-Exchange-CrossTenant-AuthSource: DM4PR03MB7015.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Oct 2025 10:15:41.6774
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: epOTBglLi++rrgV5vrpimv0LExbJneD3y/lRxRHjrIXsqxTBfB3+U/UzVputEaTStcNaxs4eeE5eR/gvAuEuBfGHt1hclZ+MVbKpvmUclBg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH8PR03MB8202

On 22/10/2025 10:51 am, Teddy Astie wrote:
> This macro was introduced to abstract between IO-APIC and IO-SAPIC (ia64),
> now that ia64 isn't supported anymore, this macro now only refers to IO-APIC.
>
> Signed-off-by: Teddy Astie <teddy.astie@vates.tech>

Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>

> diff --git a/xen/drivers/passthrough/vtd/intremap.c b/xen/drivers/passthrough/vtd/intremap.c
> index 7726ee618a..e0314aa469 100644
> --- a/xen/drivers/passthrough/vtd/intremap.c
> +++ b/xen/drivers/passthrough/vtd/intremap.c
> @@ -398,7 +398,7 @@ unsigned int cf_check io_apic_read_remap_rte(
>  {
>      unsigned int ioapic_pin = (reg - 0x10) / 2;
>      int index;
> -    struct IO_xAPIC_route_entry old_rte = { };
> +    struct IO_APIC_route_entry old_rte = { };

This should be tidied up to '= {};' as the line is being edited anyway.

~Andrew

