Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 47E6BA87FCF
	for <lists+xen-devel@lfdr.de>; Mon, 14 Apr 2025 13:54:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.949970.1346406 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u4IOU-0000Er-Lc; Mon, 14 Apr 2025 11:54:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 949970.1346406; Mon, 14 Apr 2025 11:54:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u4IOU-0000CJ-I1; Mon, 14 Apr 2025 11:54:30 +0000
Received: by outflank-mailman (input) for mailman id 949970;
 Mon, 14 Apr 2025 11:54:29 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=GQ8q=XA=amd.com=ayan.kumar.halder@srs-se1.protection.inumbo.net>)
 id 1u4IOT-0000C9-JZ
 for xen-devel@lists.xenproject.org; Mon, 14 Apr 2025 11:54:29 +0000
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on20614.outbound.protection.outlook.com
 [2a01:111:f403:2416::614])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 373ca5c4-1927-11f0-9eae-5ba50f476ded;
 Mon, 14 Apr 2025 13:54:28 +0200 (CEST)
Received: from PH8PR12MB7326.namprd12.prod.outlook.com (2603:10b6:510:216::7)
 by CH2PR12MB4085.namprd12.prod.outlook.com (2603:10b6:610:79::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.33; Mon, 14 Apr
 2025 11:54:23 +0000
Received: from PH8PR12MB7326.namprd12.prod.outlook.com
 ([fe80::6d76:9c33:d230:8264]) by PH8PR12MB7326.namprd12.prod.outlook.com
 ([fe80::6d76:9c33:d230:8264%2]) with mapi id 15.20.8632.030; Mon, 14 Apr 2025
 11:54:23 +0000
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
X-Inumbo-ID: 373ca5c4-1927-11f0-9eae-5ba50f476ded
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Z2+feU4ppJOlHAihiV2c1iarOWjjsm+6qa6Gs2fdOkan0/6PNR1WH1kZO/+LnniZY+gxCZVJss9HUsxoXXc96nWeqqNGEDoyh1CQrHs7rGgFe4IUFSlf+lYDRSmOffrk3dKKFfI+K3Zri4q1kamZmst8wg+Bnc8zUQbSbhhL3UF8BreSgr88+/HK1qjwRci7vvdogBDyAObMUBW/cVj7+8t6NJO0BaPa09tl8akv9UB1UR++ZieMWd4F1xdghw2PuYgm7N+qJ8dqPXJNzgw9u2cYiUOKAMih0+iMxhtWzBp6FFq706KomCyDB1IBlXvbCdviR+B6YrvxkfxbllQZ4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uv+jy1ynXd4Z5tbf9QOragjUmw77qhcQMxNTZ3LsQbY=;
 b=np+n0S7SXm7ZsEhMKmANFj7dbRenUn6zdu8F7AyGTqRs2bGpgkcf81VkuBUUatYzZj/WXbN1V8Yflf1jXfWuDatBU+I1O5kgJbpIK5esX6/lP84v2lzPq1jkk0mKpuJzTyZCK1O5PK2Q6gdyuNqUbYjwg8yJrRnzAfr6ODlo2k+AcAlSTJyl/4AO15fZ+GzsMSlYrY/bbE5QyMsU8XNhmZrzwStePAYCHgShHoz7uIPUasuPo0weIsgcoX38c1fLWvzM1I4x3fSJIqFVepdONFE0D2Qq21yO6BzKfE8KFJgvq+HbvSpM0R27tlBkWyfr8i0aVcMvXC/rgH/Ety7ANw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uv+jy1ynXd4Z5tbf9QOragjUmw77qhcQMxNTZ3LsQbY=;
 b=yYtEVcH7wpZ98ytShL8N1a6bXwEvmPbDSkQ1iqDE3VJLb2xMOkTSmHxM1D1As6HoycBDi+wgV3tfRBJDx8tLT5YgaYNB1m+n3J5u/sboaQQ83N0yi9X+EUxKMZnPLakOYEC6iZE6UvdPIWZMpWUiqD/qzBbmmw6Pu8fEF86mvTk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Message-ID: <614002cc-4dfe-44f7-8ab5-ff7d4f1e694f@amd.com>
Date: Mon, 14 Apr 2025 12:54:19 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 2/3] xen/arm32: Create the same boot-time MPU regions
 as arm64
Content-Language: en-GB
To: Julien Grall <julien@xen.org>,
 Ayan Kumar Halder <ayan.kumar.halder@amd.com>, xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Luca Fancellu <luca.fancellu@arm.com>
References: <20250411110452.3748186-1-ayan.kumar.halder@amd.com>
 <20250411110452.3748186-3-ayan.kumar.halder@amd.com>
 <b401f18a-f32a-46c2-8e2f-343a4eb134b8@xen.org>
From: Ayan Kumar Halder <ayankuma@amd.com>
In-Reply-To: <b401f18a-f32a-46c2-8e2f-343a4eb134b8@xen.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0504.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1ab::23) To PH8PR12MB7326.namprd12.prod.outlook.com
 (2603:10b6:510:216::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR12MB7326:EE_|CH2PR12MB4085:EE_
X-MS-Office365-Filtering-Correlation-Id: 79d9c1ed-24bf-4aef-a55a-08dd7b4b1912
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?dlIvS3k5YzEwSGMvT1dJZFEwUHhKMEF4MWprQ01SSlhFL0x5NkJHcDN4ekx6?=
 =?utf-8?B?dEczbnFSWk9jYjdheDdaU2daYjl2RlRWVzIzU1U3SXgyWFBrZStGUjI3SjM2?=
 =?utf-8?B?eXNuMldUNjNEcmV0RzNZSXBrL1R3aGljVkJNQmQ0dnhmdTZzM2YvMlZCb0wz?=
 =?utf-8?B?NGpmbkZlT0UrU3VNM3JKeDU2TXJGQnYxcHdMYlk0VG5xZGpDZVlmd1NiMTND?=
 =?utf-8?B?NENBMDE1ck5nYnBCb000eGN3SjFNdVY5ZEdSc3NHMUFtM04vL0U3N1RmT1pv?=
 =?utf-8?B?ZUs2c0dpcEhRS0ttVkN6QmxDaWw3L0ZsNHovTENiVEt6NFNJWS9vcHF3OVp6?=
 =?utf-8?B?YVVoMmpHN0w5WDI0RWpLamhqRjlaUjRwelQwV0J3VWxJd2NNZUlDVm02UnU4?=
 =?utf-8?B?dnpJdUk0TFBRdVpJaHp2dWlHN25pWEJIS1g5V0crNTJibWw1bDFWRDlDRWRI?=
 =?utf-8?B?UGFZZms0RXpZbEIyRWxtQUZlbnZrQ09EVVNrMllLdVF4VThSNzRKUDNETXVS?=
 =?utf-8?B?cHRaTWlYVENOM2xHNzc4RHJuMEthdVVxM3R5K3A5V1JqUGV5OStFOE5HRjJv?=
 =?utf-8?B?LzdxclNBa3l0NGthRXpPMlFab01CV05OYTByWjRrdXovWXdNQjJtZ2lCRUJX?=
 =?utf-8?B?eG16dmFIMURUOE92SVk3Q2hSKy94cVZHTDFmcnpjZ1I5aW04RVQ5YkY1dUV0?=
 =?utf-8?B?VkJoTE1jcWJ3TllJOGFLNlNRWVphWWk4ZStTVG9oM1lyM0dpRUlTUXpTVG9L?=
 =?utf-8?B?U21IejU1WHRxNTF6bTZHZ3czcXBZS09HOW9JT3VxZUJRQTBiYlU4T0pZWnJF?=
 =?utf-8?B?YVNqWWhIcWxmNEtKMnZ5WUgzWS94YUl6cTNicElVWW9NVmVzZDRaMW5kcUZu?=
 =?utf-8?B?KzZ1Y0RKeGU3MFhScGRtMENLUzQ3Y2RUQnNoZmppNnpqMnNOaDRNNllOYnRK?=
 =?utf-8?B?UDdGSjk0S1FuNkRUSVhjTEFaaUNWV1piRnFMRlpZMFBQenhnck9wZ1c3Q2tQ?=
 =?utf-8?B?aGlVMS80WFllci9sZ1JMUlhNSGlxdFlxRDgxQWFrV1kyUDhGNE0yNE9GOWRw?=
 =?utf-8?B?eWo1NERJV1NETkdIdU5iUENpazg1aDV6ejR1YXhLS3VhbG1WUGJqbUFUaTNt?=
 =?utf-8?B?akpCOXpFZzY0L0UwMXVIMVY2QWQyeHBTaHZkTUNIc0RZaFVLamQ2bWpNNVJn?=
 =?utf-8?B?OEtGN2R4c0VUTDdpamJZMC9YL0IwUTNYeFI1a3BVTmQyenhhNkxlMXd4dnBu?=
 =?utf-8?B?VGNUNjNtRXlsdUhmSU42bHBCU1Y5WGJIRlFiSnVMZkkvVUk0eTNUYk12S001?=
 =?utf-8?B?Q2gwbS83Zndsc2lWS3JQaytsMXR4bjNxMkJBR1MyNnp6VmRJWGk2WXd3MjJl?=
 =?utf-8?B?aGRXQ2FLZ2FMNEF5c2xsaHNkZDFrNEtQUFhLajFtU09JeUhhbE9aeVBFQXVo?=
 =?utf-8?B?WUQ3WEtZcHRnL1ZRS096YXFjejRuY3hDQUFIMjFLOFFwWXFNaHBMTUk2S2c4?=
 =?utf-8?B?SEdBSnNwcENCdXRBNE9Sc0c1Qk1YMEI0aWFGbDJaVkxyRG9IZExNRzBMaTdG?=
 =?utf-8?B?K0ZGbGhnWGZOWnNVZnpOa081V3IxUWR1RHB1SWRtQjNwT01lUlJGendTblRE?=
 =?utf-8?B?azBwbkgzb3Y0ZmtIYXBFOU1ab1BwYUE0YmR0bzE2OE1lb0tkbkNQbE5mN1Fr?=
 =?utf-8?B?ejZ0c1lTcm5VQythVjQvNlVreE1aR2tkU3JWSHBSOFF0S2J2VXlyWHR3aXBE?=
 =?utf-8?B?SEg1eFJPZ29CL3NYakN3Skt4cUdVVG5OMnlnTG0vN05SL0FqV0VnRVJldU1M?=
 =?utf-8?B?TTlVTHNkMFFncTBBWS9DSU1BeWZJQVppZVBPRzZMNCtGYzc0RG8vS2V1dUpE?=
 =?utf-8?B?S1QxYndwUlpNWW9yc1pnRGtFR1Q2YUtqeEdyYVR1VUFodGdnakxSYmtkaTFI?=
 =?utf-8?Q?UXhAoLU1DW0=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR12MB7326.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZDl5RGxsVHJEWlBwTitxaTF6UGgwemxpelJBczJtYU43UFpJakhUTGFMWHlY?=
 =?utf-8?B?NEIvZTYvYklWWjluTFBGRG42UkNtQk5veFdLNEhBR0hQZ1ZOdWNEMFNnd0Yw?=
 =?utf-8?B?am1IM1JGaE1RSTJDMFI0V3htUmtOclk0bHYvdVdPOHBybGpNdVJQUjdWbjRM?=
 =?utf-8?B?QU1LcXdhSFBmYnNCSkgyajlQT3FRUUUwNmFhVVJteWFXRkdKSE5TUWcyM0Va?=
 =?utf-8?B?RHVObXkxTys0SWY1RjliNW5GMjhGaStHRnVZaUM2L3o1RlVMYklCYnNLdXJw?=
 =?utf-8?B?ZTQ2N1NOTVMreWJzTWkxVDNSd1h3MVNsVlM3SXY5RmVJbzc3cEdUaUl3Zjh5?=
 =?utf-8?B?aWRBbXU3N0xSMytjblNyMjRaRkg5dkhrU1VxaDRUWDhrUE9QZkNoVlVNWEM5?=
 =?utf-8?B?d2tuakZMVkdDS3FFa2VSUmxnV3RJYUYwQmtNV0c4OXZuVkJqME5vYmJVSU5C?=
 =?utf-8?B?M0oyYllnSnFTMk9BSjdGSmtZYUJrTmcxSWo4V0kwQTU0RTRlaTNCS3ZpdUhE?=
 =?utf-8?B?dnpDeldsaGJxWVI4cW9vOEh6MXFBMlVDdVhSR01LaWxta1hXY1pqVjBhMlgz?=
 =?utf-8?B?ZDdPVHR6TUlyNUhDSis3OVNKc2gweFFneUtXbUV5blgvSXFaVWhlUGpZOTVm?=
 =?utf-8?B?S1QwZHFXMGRZc3NRdmhtTU9DVXM2cFRCRHpOaDcvazdZYUlDdk90TTAxOFJD?=
 =?utf-8?B?VWF6YnAvWTh3OEtkK3g0S2FaTFNlMFpJRjBBa1I5SE9kY1lEVG1mNGRVaWY4?=
 =?utf-8?B?bEZ2aStrRUE3amd0b1g3anBYdlI5NmROejk5dURFTjRGaEFqUU1zM25XK281?=
 =?utf-8?B?VUlEU2NiQ1JvRnVWWVJQc0k0UjhmaUIrSnlWUkVjMmwyOTlNelNvTDFzNGY5?=
 =?utf-8?B?bFlSaEhYRGVrKzhXTGZzM0lKak1XNGM0RXNyb1JrSWQ0djhuTUU0SzV6ZG4z?=
 =?utf-8?B?UXRzUkxPZng3SW95Z3d4UWl3ZTNXRWVCcjBRcDlpbHROb0lhUjczam5BVHgx?=
 =?utf-8?B?eGJQOHZDeTlMbnYzOTBIZGlkcHhmNHZYeFphSUlrR1pSVHFZVjFOem5kb01u?=
 =?utf-8?B?Vi9FOGJLK29XZWZGOWRVVVpDSUxyM2lmK2o5UHBEWjZkUGlqSmYyeEwvMjMx?=
 =?utf-8?B?elFiZ25zUE02ejB4REkyenJ3N1VGSm1DcHhQZUtZeExoaHFlMjNOcFBwWG9Q?=
 =?utf-8?B?YjRJQVBTeERSZG03UXJBWHZ3ejUwcHBsYW14MmViR3A5THR5ZDU2dGZuc0hN?=
 =?utf-8?B?VFJzeG14N012TjY5YllKR3dCbHlib2JGOUJqUm0vSmc0WXBIZXc1RE5nRXdu?=
 =?utf-8?B?cUs3MlFpTmYvY295V2pxZlhrRU51QzAxWGI5aVVVUXg5UXZSeTRUUnBHRlhY?=
 =?utf-8?B?aGNoSkZHcHV4OFIwNzRrbmRXaWQyNmhLNFl6dXQvZW1USWhtME9nU0t2VUhy?=
 =?utf-8?B?MitpU3ZFbzJFcjJCNml2NzY4WkdtQVJVWm02bEFrNGw0SzBGdXVKNzlKQlRt?=
 =?utf-8?B?VkJNODN5VnVzcmhwWVloOFhRMjlVbS81RWRsZWRSYnI5WHJ5SVgwS2tvVkx5?=
 =?utf-8?B?QnluYU5iVVZHQ1BTdmZlVmtoL0dHUUp6ZlQ2SlcxNk1uSkgzMzdLMVI4eFNn?=
 =?utf-8?B?VkNVMmNLS1U0WlQ5Z0pmd2JEVUVoajJlaVBpYnNuQXMrUnIwNFJkVHNBYmFW?=
 =?utf-8?B?SU1DK0V0VlZsUkZSL0RxLzVTS292OUR6SW1vQXhVZVN4cjdENUJyK0JCSDNV?=
 =?utf-8?B?NlRKVFFMYThac1Y3VzNUOWpPeUo4QXVMNDFTeDJrUkRDcVE5YXpsWDQ2bHdM?=
 =?utf-8?B?c0kyMllyTVJoWFNsS1R0L3FqbEpGa0N5MXhuYzEzeDVaaEFwNGcwNVNHOHV0?=
 =?utf-8?B?U2szeTV6ckxYWnZyWHgyM3V4SjlnVGpBeStlK1dHa2FCZFF1cklZN2dXYjhL?=
 =?utf-8?B?Ym8wNitPV0llYUFBT1BEVnBrenFsanJwNlU2RUsrRGYyVDYyai8wd1FpZnZk?=
 =?utf-8?B?Lzl2bitmR2YyK3VNNng4a2xhSk5KcUlVVktob2lCZWJuZHpYdUY5ZjBnTVk4?=
 =?utf-8?B?ZC9NbGpraS8yKysyY2lqdDl4VjVzT3hKenhJaWRZZzNuc0JWZnJnbjRoSFRZ?=
 =?utf-8?Q?4ojFYP4SmJ2ErP1jmCr9Y1ZOF?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 79d9c1ed-24bf-4aef-a55a-08dd7b4b1912
X-MS-Exchange-CrossTenant-AuthSource: PH8PR12MB7326.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Apr 2025 11:54:23.2696
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RO3yBR/MTY4Mh6/MtQ9q6zHuiuryOa1UicTCnnGZb13NiM9H51Uruvy2qgq9u+V7Rm0YeC1W1Q75u8Z1Ly1JJQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4085


On 14/04/2025 12:21, Julien Grall wrote:
> Hi Ayan,

Hi Julien,

A few clarifications.

>
> On 11/04/2025 20:04, Ayan Kumar Halder wrote:
>> diff --git a/xen/arch/arm/include/asm/arm32/sysregs.h 
>> b/xen/arch/arm/include/asm/arm32/sysregs.h
>> index 22871999af..8d7b95d982 100644
>> --- a/xen/arch/arm/include/asm/arm32/sysregs.h
>> +++ b/xen/arch/arm/include/asm/arm32/sysregs.h
>> @@ -20,6 +20,15 @@
>>    * uses r0 as a placeholder register. */
>>   #define CMD_CP32(name...)      "mcr " __stringify(CP32(r0, name)) ";"
>>   +#define REGION_TEXT_PRBAR       0x18    /* SH=11 AP=10 XN=0 */
>> +#define REGION_RO_PRBAR         0x1D    /* SH=11 AP=10 XN=1 */
>> +#define REGION_DATA_PRBAR       0x19    /* SH=11 AP=00 XN=1 */
>> +#define REGION_DEVICE_PRBAR     0x11    /* SH=10 AP=00 XN=1 */
>> +
>> +#ifdef __ASSEMBLY__
>> +#define WRITE_SYSREG_ASM(v, name) mcr CP32(v, name)
>> +#endif /* __ASSEMBLY__ */
>> +
>>   #ifndef __ASSEMBLY__
>>     /* C wrappers */
>> diff --git a/xen/arch/arm/include/asm/cpregs.h 
>> b/xen/arch/arm/include/asm/cpregs.h
>> index aec9e8f329..a7503a190f 100644
>> --- a/xen/arch/arm/include/asm/cpregs.h
>> +++ b/xen/arch/arm/include/asm/cpregs.h
>> @@ -1,6 +1,8 @@
>>   #ifndef __ASM_ARM_CPREGS_H
>>   #define __ASM_ARM_CPREGS_H
>>   +#include <asm/mpu/cpregs.h>
>
> Just to confirm, the CP registers used by the MPU will never be used 
> for an other purpose on MMU systems, is that correct?
Yes, this is correct. The registers are specific to PMSAv8-32 which will 
not be present on MMU systems.
>
>> diff --git a/xen/arch/arm/include/asm/mpu/cpregs.h 
>> b/xen/arch/arm/include/asm/mpu/cpregs.h
>> new file mode 100644
>> index 0000000000..e2f3b2264c
>> --- /dev/null
>> +++ b/xen/arch/arm/include/asm/mpu/cpregs.h
>> @@ -0,0 +1,27 @@
>> +/* SPDX-License-Identifier: GPL-2.0-only */
>> +
>> +#ifndef __ASM_ARM_MPU_CPREGS_H
>> +#define __ASM_ARM_MPU_CPREGS_H
>> +
>> +#ifdef CONFIG_ARM_32
>
> I am not sure I agree with the placement of this ifdef. Is the 
> implication that 32-bit domain will never be supported on arm64? If 
> not, then everything but the aliases should be available for 64-bit 
> (like we already do in asm/cpregs.h).
Yes, I will enclose the alias only.
>
>> +
>> +/* CP15 CR0: MPU Type Register */
>> +#define HMPUIR          p15,4,c0,c0,4
>> +
>> +/* CP15 CR6: MPU Protection Region Base/Limit/Select Address 
>> Register */
>> +#define HPRSELR         p15,4,c6,c2,1
>> +#define PRBAR_EL2       p15,4,c6,c3,0
>> +#define PRLAR_EL2       p15,4,c6,c8,1
>
> I am a little bit surprised the registers have _EL2 in their name. By 
> any chance are you using the aarch64 naming? 
yes.
> If so, please provide the 32-bit name and add an alias below.

yes, sorry this is a bit mixed up. I did not understand the purpose for 
defining alias , so I used the common name.

I will use HPRBAR and HPRLAR here and ....

>
>> +
>> +#define MPUIR_EL2       HMPUIR
>> +#define PRSELR_EL2      HPRSELR

#define PRBAR_EL2 HPRBAR

#define PRLAR_EL2 HPRLAR

>
> Please add a comment on top explaining why we have the aliases (see in 
> cpregs.h).

Actually, that comment (in asm/cpregs.h) did not make sense to me

"/* Aliases of AArch64 names for use in common code when building for 
AArch32 */"

Do you mean the common code is used for building both AArch64 and AArch32 ?

If so, then the comment I should put here

/* Aliases of AArch32 names for use in common code */

Does this sound correct ?

- Ayan

>
>> +
>> +#endif /* CONFIG_ARM_32 */
>> +#endif /* __ASM_ARM_MPU_CPREGS_H */
>> +
>> +/*
>> + * Local variables:
>> + * mode: ASM
>> + * indent-tabs-mode: nil
>> + * End:
>> + */
>
> Cheers,
>

