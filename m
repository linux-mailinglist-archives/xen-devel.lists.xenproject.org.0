Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EEB4AFED53
	for <lists+xen-devel@lfdr.de>; Wed,  9 Jul 2025 17:13:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1038369.1410857 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uZWU1-0006Mf-4V; Wed, 09 Jul 2025 15:13:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1038369.1410857; Wed, 09 Jul 2025 15:13:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uZWU1-0006Kl-1v; Wed, 09 Jul 2025 15:13:17 +0000
Received: by outflank-mailman (input) for mailman id 1038369;
 Wed, 09 Jul 2025 15:13:15 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0v+Y=ZW=amd.com=ayan.kumar.halder@srs-se1.protection.inumbo.net>)
 id 1uZWTz-0006Kf-Mt
 for xen-devel@lists.xenproject.org; Wed, 09 Jul 2025 15:13:15 +0000
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on20631.outbound.protection.outlook.com
 [2a01:111:f403:2413::631])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3aba0e06-5cd7-11f0-a317-13f23c93f187;
 Wed, 09 Jul 2025 17:13:13 +0200 (CEST)
Received: from PH8PR12MB7326.namprd12.prod.outlook.com (2603:10b6:510:216::7)
 by MW4PR12MB6873.namprd12.prod.outlook.com (2603:10b6:303:20c::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.26; Wed, 9 Jul
 2025 15:13:09 +0000
Received: from PH8PR12MB7326.namprd12.prod.outlook.com
 ([fe80::6d76:9c33:d230:8264]) by PH8PR12MB7326.namprd12.prod.outlook.com
 ([fe80::6d76:9c33:d230:8264%4]) with mapi id 15.20.8880.021; Wed, 9 Jul 2025
 15:13:09 +0000
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
X-Inumbo-ID: 3aba0e06-5cd7-11f0-a317-13f23c93f187
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QZIOWA2Sxdj+ToM2i77Q3rB8KVYJ5UrLj9+G6MdPJasD3UGTfY1uiy2042VAFkeeJJgvDsnmg4tq/NK+2oFdnqPRVwTFM0ZpiGGoPsIof3KK/vLRkwGpiy2d+iTCPjVcYDsZAbIIR6JrNkMnVQBFxzev91A+RDTBTt2+Qwy+TDN0zQD5ni5rvGYgVTdAkSBKRj0lGcjB5+kB9kvGwoFFYoGGTN79olA9bF9+ElBdV3tvmsQkNtO1vgE34i803AyH9OjhKX5psQlu04/U3s0XAIge6lg5BE8W8Gzkp+2W7ukd/2lV9LeLqZBGsEqerYqiXoc78mbee/4sKaMiSHKTkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/N+PsCLW6unp3T2/330CHCaJtLz5u4kJpJq8BMKoW+w=;
 b=AY4GCtkMwAWoGdmIY8qHiKf/Y70K1i0eyoitpzUcDqlKR0YZosJAomTmOzPLycxjEAKO9Yo43haA5hJYII+EkwdT8PjMlJLKQhdAPN3zdAtvaMXBpYkattkzJG4r/mRDVrIa4VrQ/mgPyLDLZQNJit5q5BzqwOJflPASw/Gf+wYs2AW4RClcArEj9WfRWIxutf508bXlBeCx9dSGTY+BZ9q/lDB59Pmh01dBgdtjolKpTdVcw3SixRp4trnUafP9rSYmBnWQ9uBoCXTfQfRQuT5ganjJLZ8EKxGcRSEjfVyEEv6ZlmJ/h1kp18AKDJHXO68S4S2npG5mXB830USZ9g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/N+PsCLW6unp3T2/330CHCaJtLz5u4kJpJq8BMKoW+w=;
 b=EI/7s8Sp+Mj1sDW9BnBI2g5pBSP3dZALcvXcxwKzngGmbhmqVPV505ejyViwZBIY9URI7Lr9bXG//qKV3NIoaVXdxTMr0Tr+FUL37jeWJ+zY6S3yJ9niyzpECcmSraiAJz39TmMvtgn64JwBQniuKIRI52nGi2C+QyDk7tYldH4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Message-ID: <22913eae-51f1-4745-8c2f-ca5d299c4d4d@amd.com>
Date: Wed, 9 Jul 2025 16:13:04 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH] xen/arm: Track coverage gap due to architecture
 limitations
To: "Orzel, Michal" <michal.orzel@amd.com>,
 Ayan Kumar Halder <ayan.kumar.halder@amd.com>, xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Artem Mygaiev <artem_mygaiev@epam.com>, Julien Grall <julien@xen.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20250709131257.1655509-1-ayan.kumar.halder@amd.com>
 <48d3c8cc-a85c-4dff-8e59-63a284f73922@amd.com>
Content-Language: en-GB
From: Ayan Kumar Halder <ayankuma@amd.com>
In-Reply-To: <48d3c8cc-a85c-4dff-8e59-63a284f73922@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: DBBPR09CA0040.eurprd09.prod.outlook.com
 (2603:10a6:10:d4::28) To PH8PR12MB7326.namprd12.prod.outlook.com
 (2603:10b6:510:216::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR12MB7326:EE_|MW4PR12MB6873:EE_
X-MS-Office365-Filtering-Correlation-Id: ef5e7892-1927-442d-acf8-08ddbefb1d11
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?cXJHUnI2NUVnYWtGbHVlMmk5cWYxSm1oTEV0NThHREovcjlNaFRBRERxUHNy?=
 =?utf-8?B?Y1RES0ZtSkxOV2VWbTBjMUxNcUtvaFpUWDhDN2xwRnpKNFUrM0luNVczNTR6?=
 =?utf-8?B?WllxbnhsbTA5SWEyZllhN00wUkRsM0szL0tJWDdaN21kRkk3aXl1RXZMbGZQ?=
 =?utf-8?B?b1EzYTVucmZ6ZTZuN2JBNjVsZlZ6MGFiOWpUL1M5OWVqdW1rSExDcks0cFha?=
 =?utf-8?B?SldnQmlLQTZvc3FWR3Z3TFJZcDIzajZYNDNSNVg4d0VhOEoweDhrdDA1VlMz?=
 =?utf-8?B?alNHWFBlYWErZGpnUmNwZG5yM3h0bktEam5UcGxlQlJUUHZuQVZBTlZPTkdj?=
 =?utf-8?B?TE1nMjY2Wk9WK3NEK1Q3MWQvSFNtUVRGajcxZjgya3R3c2Q0K0FlTFVJNmZu?=
 =?utf-8?B?WDJOQkR2TlNTOHFxcktGU3hSV0Y1K211aXVuUEtnai9Tay81RFBlRDNtMGtp?=
 =?utf-8?B?a0lybVRjVGROeTZ2UVFTOWc3T1FTcHVNR2NSUzNNSkx5OENYV0ZEalpIMXEr?=
 =?utf-8?B?bHIrdUN6d1o1YmljM3oyYldLOXZlSHZ4NHZ1QmQrdzZFRGN5OXZPUzBMWUdu?=
 =?utf-8?B?Ri9zTFFsQmxzbHoxTkV4aVJIQ3dFait5OFJJN1QyQ3FmQW54Vjl4MFVmdU5B?=
 =?utf-8?B?UzVidXR4ZWc0VUFsUDRrZzBhbnpmVVVGZmZuZ3NEaXJKay84aEtBamRLdlp1?=
 =?utf-8?B?VkJzWEFvcTBIZHVVdzdaRGRIQ0ZjM3BBVUlWSTh6TnIvQlRldG9SaDBkUEky?=
 =?utf-8?B?c0NGbFdVeFIrY3ZVajFXZXBmeU9VMkxLdUpmM2p5WjZMekJ5R0pjQVovUnVr?=
 =?utf-8?B?a3kvSzk0YnNMSW93dFMxT0R6b2hXNXNaQ3ZyZCtSeTZmcXdyWXIwUS9ibi9P?=
 =?utf-8?B?emN5VUkxSFhWTS84WVBVeW1oaGRJb0hTTkFMWTg3VXRXdDRBMDdrR213VHJK?=
 =?utf-8?B?bXpjMjlYUjE3ZlByalNjNnVDbTUrcWs3d2NmekJ2NUZLcGF5WERNVmR2V0E0?=
 =?utf-8?B?QTZ5Q3h5L3Brd3NZa2todllBdTBJSE81VHVtS1lQSEltb0pGSkEvM1d0Umdu?=
 =?utf-8?B?RUcxVG14SnJMMlZscWdYV1pHdmd3bmY5Y2xvU1ErT3B1bHVLK2J3NVBqOENT?=
 =?utf-8?B?NW9hcWs4S2RIVDBKZm51OFlrTnp1cFVuK0xTVmJTZk9Zd3pUNm5SdW43eUxE?=
 =?utf-8?B?NUt2S2RLdFd0VGU0aHBhL3lkeWRNTU54RE1NaG42bHcrM2ZOaDNMRG1aWERt?=
 =?utf-8?B?RDIyVzlDcTVnRHU0YlBRYmNkS25leWN3cE9lcE04NUhvSG44VEhFempIRmFl?=
 =?utf-8?B?Z3BucUsxZndMTWRGQ3J2ZUpTckxORVhlNGQ2RlA5clZ0S2R4R0NHaGM2MTZj?=
 =?utf-8?B?K0lFNUIvVFpUc1QrNTZrVVorWkF3VTVSNXRWRHR4ZGlTY3hlUVhtMXhKRWxa?=
 =?utf-8?B?a041Q21lL3h3aEVlbUUzaW9rOXJOb2t5V1hOYWsrQ0ZMMjFKT240ekJqS2d5?=
 =?utf-8?B?SFQ2cGVxWXZ5QzVQY2lsaDd6OGoybDh2eW9vOWhKQVIxcGREZnBGUVN4OXEy?=
 =?utf-8?B?YVd1amVTQ2VGYVFVankrNVhjMWtXN2tlbnBiTUZ6a0Y0VktOUEtGQlpVYUlG?=
 =?utf-8?B?eVdNR3VNZ1VuUGlIQmpaM1Y0VEMvUlRXZ3UrY2RsL0daRkswME96R3V4b09l?=
 =?utf-8?B?bUg4WlNLeGNmV3h2N0ZGZC9KRUNXYW9aYXdXODFRVFI0YXFsYlhyQVpBUmhq?=
 =?utf-8?B?NHdiZTNwSW1YaHBJa252MDcvUzFlRy9MRHZic1RETUpqVkdRS2c2VTdpaDQ4?=
 =?utf-8?B?ZkdzK00vbzFSVmVLR2liNCs1akk0c3NpUERpaHYvU2gwWHQ1UjFqdXVidU53?=
 =?utf-8?B?aWNVVFQyS2ZuSUpBdU5TMFptZWdGelF0aWptRHkvRUMxWkFoaXNPUzl0UFNr?=
 =?utf-8?Q?PB3hxy+VCIU=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR12MB7326.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UkNyYnAzY015dTBFUVAwLytBbjY4bk5UdEtXdWxrZ2JPeFlQL09aS0JsdVlI?=
 =?utf-8?B?bmFzTm9nSUl3T1VDTWQxR0dnNFkwS29LQVRSRW9sUzYyRTIvUGdEV3ZKdHpy?=
 =?utf-8?B?ZHNZbFhkV3NkdEtVNDljcStPNXdzTXJBZnY3d1ZxYTY3Y2pIU2ErMmZpZXFr?=
 =?utf-8?B?U1l1OGFESHpJUjQ1NDJtZ2ZkS1F5WVVCQzVvVUk5VHhsczNiM3VuS3FlU0Jv?=
 =?utf-8?B?aExHOVprOGU1OHJXd0gxMUJDRkRqUFArVElYaW5rUSs4a1MxSW1GMzZNSnVm?=
 =?utf-8?B?MmQ3enhBU29VYXRacHRic3hFTWkzVDZYQ1JhcmZncVExc09LUkdYM1dsRUpD?=
 =?utf-8?B?dzdnY1J4OXZ5QWxkbXQyRnR4aW9JSlRidkZCRXpTSHRIWFZFK2FsS2hhQ1M4?=
 =?utf-8?B?ZWlIRXFIT0lHRFBQelgzYitMbExTZklEdjFwZC84VnBMcGhIQXlaWTFXU05n?=
 =?utf-8?B?TmlNYVAxdWszUC9oNnhwMTBNdFNqRnRSbCt3aUd2WlM2WW14ZXM2VEl6emxm?=
 =?utf-8?B?SHA5UnBoZ0wzazRGZytBc1dUdUQxOFNTditMa3ZiTktCNlY4bHlBYVpvQlpK?=
 =?utf-8?B?aUtQYmpTczFKQWVXVU9UbStDUmlCcGRsTkZrZUY0aERnQjFJZTNnUVFXWGxy?=
 =?utf-8?B?Rlc4WThBUHFIVld2dlEyVkM2T1k2WlNnM2xOK2x3cXp0b0EvcXRIdmZ2aWRR?=
 =?utf-8?B?UE0wWnJxd2YvZFYvakVreDd2aWpDaEZQMWdpaHJMc3R6VS9JYzZnbVVMYTVs?=
 =?utf-8?B?MjVRTlBTUkQ3blAyZjhCRGJEQVF5anAwZG02dlFTTDVJcmc4b1RDRTFJQXZP?=
 =?utf-8?B?YVNvOE8zcURmY3NhZGhtOVJWVnNzcm9rZXVzU3BTM1FQNmlUVUZRb3dSMCs1?=
 =?utf-8?B?a3d1V0RQZW9QMFRrS1hhT0oySTd2QXh4V3dDaUg2bHNQSSt2Z2dETitFbnBv?=
 =?utf-8?B?L1lYZWRyNGtCT2NpMWMxSmI5QlJSVmJXRjdDd0t2WHU1cExIdkhKNWdJRlRr?=
 =?utf-8?B?TFFlN3pqZlNlOXJyU0g2aENid0RZa0hEYTMxeTNvNlVUQWZhaGZpNWdnZU1n?=
 =?utf-8?B?UlU1NVFSRlVWcjJvdndubmZDTmVTQTJ5ZWUvZENRV0xmb1R6RDJMNDh1TzRs?=
 =?utf-8?B?Zkg0c01QOG8xeS9hRURLcHI0YjB3cFUzcEVZN3RWWGpHejMvZllBTUtzbHd2?=
 =?utf-8?B?MWtVdm9EYVJmNmk2SThLOUJ2UWQyeEdjSkc3U3JOdXl0VWdXTjAvR1NHQld2?=
 =?utf-8?B?eVZZK3VtWktvWjM4MFBHNXpEaDhYb3VOeXNQNGtOa3hFRTlvZisrQ2Z5WE1X?=
 =?utf-8?B?aUhoWTcyTGlYOFdyTnZEQ2JGR3l4ZzNaR0VaOTV6dHJlcitYYnZpK3pucFJz?=
 =?utf-8?B?Sm51RmxFc3FlbmlsTElwdURkRzdzODEzZkp1L1MrMDdPZ3ZVbGlhWWtZT0k1?=
 =?utf-8?B?b3ZsakErVVNWZEFJL3RjQW9KbXRpSm9lUDY2Tml2c241K1JpU05ySldOY1NG?=
 =?utf-8?B?MmFMZDZrNUo1Vm1GMXNreVJkK2l2YkNjb2JvMzZYUTUxTFBTa1NVblMyVm04?=
 =?utf-8?B?MzhnaC9CUDA0SjBId0tIZ0svUHR3RXNPcWdHdE1oNEtKZUNDeVZ2V1N6cTBk?=
 =?utf-8?B?eEphVFJBZFZmUG14RE9hM0NrUTIrVGk1Tlh1SkhteGVrbUlpay92eTNYSW5o?=
 =?utf-8?B?S2V4RWxBZnB2blZNRGNaejdjQzdWcitUY0xWWlRtQ0ZyK01rdlZQRjNhWWcv?=
 =?utf-8?B?V2Qza1pWcjY5NEdUUEt3NmFYeElVKzFrbm9TdXFUWWhnelBWRHdRaUU3UWQr?=
 =?utf-8?B?dWxnSGRCa3RoNFA4Qm9SelFVSjZiRDZmUDU4aWNnQnQvZ1licmN4NTdUYjJP?=
 =?utf-8?B?Z0pCOGcwTzJmVlMvUWVNYWhRTUtjVDFvd1NXUUlOU1F1Z2ZjK0hKRy9pajYy?=
 =?utf-8?B?ZmlIZWdUVUwvYkZDcVRYNitvbjFHZDEzN1lyZkJHb2hKQnZ0NEhNSi80UjVs?=
 =?utf-8?B?WldTYUJZL0dySXMzTXpBdXdkQlFGRkZEYmgxNDBmNzBDTEgrenI2T2JBWVV1?=
 =?utf-8?B?L1NmSis4UDJoU3ZIeFJwVU50TmRzeTNXUEw5ODVMQjgzWnVCSFVGR25KeUFC?=
 =?utf-8?Q?Ur5ZJKumv6cfb4cV8AdOYBF7k?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ef5e7892-1927-442d-acf8-08ddbefb1d11
X-MS-Exchange-CrossTenant-AuthSource: PH8PR12MB7326.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jul 2025 15:13:09.2964
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ORdsCu/zqZGxffTz65GI11dP3znjPvyZqte88QkkRsDWyh5/wlyRfUTz73yJy5he0nm+U2KOiun5xRy6UeIn4Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB6873

Hi Michal,

On 09/07/2025 14:38, Orzel, Michal wrote:
>
> On 09/07/2025 15:12, Ayan Kumar Halder wrote:
>> There are a number of places where Xen triggers a BUG() due to 'impossible'
>> conditions. One of these impossible condition is when gicv3_info.nr_lrs is
>> equal to 0 or greater than 16.
>>
>> Add a OFT marker in the code and link it to document explaining why this
>> condition is impossible to be covered while running Xen on a platform. As a
>> consequence, explain the architectural limitation that Xen relies on.
>>
>> Signed-off-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
>> ---
>> While running Xen with coverage, there will be some parts of code which cannot
>> be covered as long as we run Xen on a supported platform. If we have link the
>> code with the specific explanation, this will provide some context for the
>> missing coverage. Also if the relevant part of the code is ever modified, the
>> dev can update the explanation.
>>
>>   docs/fusa/coverage_gaps.rst | 17 +++++++++++++++++
>>   xen/arch/arm/gic-v3.c       |  4 ++++
>>   2 files changed, 21 insertions(+)
>>   create mode 100644 docs/fusa/coverage_gaps.rst
>>
>> diff --git a/docs/fusa/coverage_gaps.rst b/docs/fusa/coverage_gaps.rst
>> new file mode 100644
>> index 0000000000..3cb877a8ee
>> --- /dev/null
>> +++ b/docs/fusa/coverage_gaps.rst
>> @@ -0,0 +1,17 @@
>> +
>> +Coverage gap
>> +============
>> +
>> +No support for zero or greater than 16 LRs
>> +------------------------------------------
>> +
>> +`CovGapExp~unexp_err~1`
> I think the tags need to be named better. 'unexp_err' does not mean a lot when
> seen in a code.

While writing this, I was thinking that this is an unexpected error. Can 
I name this

`CovGapExp~gicv3_lr~1`, so we can correlate this with the component ?

>
>> +
>> +Description:
>> +gicv3_info.nr_lrs is populated by reading ICH_VTR_EL2.ListRegs. The supported
>> +number of list resgister is 1 - 16. Thus, any value outside of the range is
> s/resgister/registers
Ack
>
>> +currently unsupported by Xen.
> Having a description written this way is misleading as it gives a false
> impression that this is Xen limitation. It is not. ListRegs bitfield is 4 bits
> width, therefore it's a GIC limit.

I agree. Should I say ?

...... currently unsupported by GICv3 (Refer Arm IHI 0069H.bID041224, 
Sec 12.4.9 ICH_VTR_EL2).

Thus, we know eactly the source of truth. If Arm specs change in future 
and Xen is updated, then we can update with reference to the latest doc.

- Ayan

>
>> +
>> +Needs:
>> + - CovGap
>> +
>> diff --git a/xen/arch/arm/gic-v3.c b/xen/arch/arm/gic-v3.c
>> index cd3e1acf79..eca4d76f5a 100644
>> --- a/xen/arch/arm/gic-v3.c
>> +++ b/xen/arch/arm/gic-v3.c
>> @@ -109,6 +109,7 @@ static inline void gicv3_save_lrs(struct vcpu *v)
>>       case 1:
>>            v->arch.gic.v3.lr[0] = READ_SYSREG_LR(0);
>>            break;
>> +    /* [CovGap~~1->CovGapExp~unexp_err~1] */
>>       default:
>>            BUG();
>>       }
>> @@ -171,6 +172,7 @@ static inline void gicv3_restore_lrs(const struct vcpu *v)
>>       case 1:
>>           WRITE_SYSREG_LR(v->arch.gic.v3.lr[0], 0);
>>           break;
>> +    /* [CovGap~~1->CovGapExp~unexp_err~1] */
>>       default:
>>            BUG();
>>       }
>> @@ -196,6 +198,7 @@ static uint64_t gicv3_ich_read_lr(int lr)
>>       case 13: return READ_SYSREG_LR(13);
>>       case 14: return READ_SYSREG_LR(14);
>>       case 15: return READ_SYSREG_LR(15);
>> +    /* [CovGap~~1->CovGapExp~unexp_err~1] */
>>       default:
>>           BUG();
>>       }
>> @@ -253,6 +256,7 @@ static void gicv3_ich_write_lr(int lr, uint64_t val)
>>       case 15:
>>           WRITE_SYSREG_LR(val, 15);
>>           break;
>> +    /* [CovGap~~1->CovGapExp~unexp_err~1] */
>>       default:
>>           return;
>>       }~Michal

