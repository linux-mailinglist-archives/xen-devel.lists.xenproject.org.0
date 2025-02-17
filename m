Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DCDCA38385
	for <lists+xen-devel@lfdr.de>; Mon, 17 Feb 2025 13:55:41 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.890392.1299468 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tk0eV-0000sy-Vo; Mon, 17 Feb 2025 12:55:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 890392.1299468; Mon, 17 Feb 2025 12:55:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tk0eV-0000qy-RR; Mon, 17 Feb 2025 12:55:11 +0000
Received: by outflank-mailman (input) for mailman id 890392;
 Mon, 17 Feb 2025 12:55:10 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=MRFu=VI=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1tk0eU-0000qs-H9
 for xen-devel@lists.xenproject.org; Mon, 17 Feb 2025 12:55:10 +0000
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on20616.outbound.protection.outlook.com
 [2a01:111:f403:2416::616])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6a19d988-ed2e-11ef-9aa6-95dc52dad729;
 Mon, 17 Feb 2025 13:55:09 +0100 (CET)
Received: from BN9PR12MB5273.namprd12.prod.outlook.com (2603:10b6:408:11e::22)
 by DS7PR12MB6286.namprd12.prod.outlook.com (2603:10b6:8:95::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8445.19; Mon, 17 Feb
 2025 12:55:05 +0000
Received: from BN9PR12MB5273.namprd12.prod.outlook.com
 ([fe80::cf66:58ab:47be:4b13]) by BN9PR12MB5273.namprd12.prod.outlook.com
 ([fe80::cf66:58ab:47be:4b13%6]) with mapi id 15.20.8445.017; Mon, 17 Feb 2025
 12:55:04 +0000
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
X-Inumbo-ID: 6a19d988-ed2e-11ef-9aa6-95dc52dad729
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dCmzMifMjBjlG2WecYK3IwElCTZDtqSzj6klSpSOfK1601+bQtBit0yg0b+gV2m6+i/bX7iQA6UioT19X/3hIkSpWB2kR8vxsh2xOrf9Wk1NSILigceizpXe/SoweRI1Q/NH7Oy9gt+FltqzEICNHlO49y10gE3aO/UujzWBc9bPdx2RVsytn3zSXRSovrd7CqO37zkCGH4L/3b6W3yEfQyKopzbawyAyJzY53dnA27vTG0AiPoD/n9ZOs4acwgATODYdDHriCawWtY+QOsuAK2rHilMB2W77Pr5MleNzuDeCFLWxRmQWA/LGxNDgaGOj+OLtRrXIKPJeKV/jYtx/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MhCOZRGyX+S0QXguNWg8dPtjtVr9Hw9WeNfu6KIZYRM=;
 b=gWkqgGXx8c5lWkgL127UPjFFviqCkO8YnibmH2Dus/Mrme9z6MjuCVfLSmHRX20FSWYpptOwwD1z2pxOiuL+cStPimWV3Jit3OIRiSOxJjFYk7qbIH5s37wo0Y4vaTO34dicSmxs3OA766hguqbchu9htJD9CNiK7X+ZbrWxXk2mQayH6famd2YV4R0Z6xVV9QOBDxPTx2bfTvU8iMG/sF/IIpQqKyUONbSDNfQSt6EbJeBJ/n+aRlKSdiAyZsmYAVB0C5cq3+qD8WVBjc+eIu3DkDPP5TlRWGxLxI1pONE3BPRFKIAibqVpI2xCHyYZA6OzlUZzuhAFGiVkAsZyHw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MhCOZRGyX+S0QXguNWg8dPtjtVr9Hw9WeNfu6KIZYRM=;
 b=ZlKvd4U+/s2BTDknTj/8MeNbnoz9jqHDux0frSpVHA0Owgc9NkcOCrq9HCVcZFvZSJEIIpf/v0zhRbWno88yqbRKfRt6VQi6JB2FCGrIaluALoVjpxjFKn6gbaSqdWOzhJWoNxlBmHV8r1AKD7+z1USeEEhx7LZ5kuXLVjsw+0Y=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Message-ID: <0ac6b968-c298-462e-a190-65cc3e74aa01@amd.com>
Date: Mon, 17 Feb 2025 13:55:01 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] xen/arm: Restrict Kconfig configuration for LLC
 coloring
To: Luca Fancellu <luca.fancellu@arm.com>, xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20250217102732.2343729-1-luca.fancellu@arm.com>
 <20250217102732.2343729-3-luca.fancellu@arm.com>
From: "Orzel, Michal" <michal.orzel@amd.com>
Content-Language: en-US
In-Reply-To: <20250217102732.2343729-3-luca.fancellu@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0208.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a5::18) To BN9PR12MB5273.namprd12.prod.outlook.com
 (2603:10b6:408:11e::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR12MB5273:EE_|DS7PR12MB6286:EE_
X-MS-Office365-Filtering-Correlation-Id: 18bf0e2b-39ee-4866-1b0a-08dd4f524c89
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?aWc5bGozcW9ldGxmVjl5QjN6RHZTQmJ6VkJIVlRWa1FLampuWlZEbTFCM0JY?=
 =?utf-8?B?L0l3S1Z5cUFQejFHdXdmUFgzVmREUXY0S09FUUtCSWxCWWNnZmJ0S2hLUVNK?=
 =?utf-8?B?czFPRUNNcnJUOWVFMXhWTXFIRExEbnNGeTdYRlU4aTJiUlhENVVTS3gydkhI?=
 =?utf-8?B?bzc2NkxrajNKUkcxd1dGM1p6YUtDVE11TTJQOVJIdjBNTUNRMFVyM1VyZ1NY?=
 =?utf-8?B?K0FpT2JUM2hvcXlIWW9reXdHS1NlNDNCSzdyK1U3c1lnTzhLcEdWK0Z5a1Ew?=
 =?utf-8?B?NzVxUlkxR3NPM2lxWUFPN1BmcEtlS2JQck9DdmhVVzFPSlJVQyt6NFZ2L3E3?=
 =?utf-8?B?enZER1l5Q3l6RWhaNFJYZjJnRHVIbWJ3ZnB5NDFseE1qM1lURDFObGJvR2Rw?=
 =?utf-8?B?Y28vUDNmZXdzLzMrN09DOER2a0dCV2JFaWppQ1ZuazQ5SXVXK3VqVUp2V2Jh?=
 =?utf-8?B?eDQ5QUhxT01PTzZTcUZrNGNOaVZrbjJpQ1grUGNnc2Uza0VHZnJBVG9ZMGZn?=
 =?utf-8?B?YW9QK0g1Si9KTHlCSURDcEtvMEZiTkhFWmxnd3lMMUw0cXpTWnBicHF6dFk3?=
 =?utf-8?B?NU9QZGhuUWRFQUUzQkxQK1doOGJEekRMbElWMWFFR01ldGtVL3FXaHN3VlI4?=
 =?utf-8?B?bGs4clBMeHErM1hYRlhRQkFQQ2Y1eXd0T0cxMHE1TUl1ME42MjlqWVFEZ1FZ?=
 =?utf-8?B?ckpidERyYmhnSTZLbnJiRzdzem1wcnNvSFRsUHgzUjFWQjlhN3RUdkxheTJZ?=
 =?utf-8?B?UEc5SFd4SE9BdnY0ai96UnU4bzQ2dU9RaHBUMnZjaDlBZWtEczljeURKWGt1?=
 =?utf-8?B?cTh0WWJ2WkFlSTFGT0Nsa1BjVHZ6aDlRMlFTeDVUeDRFbG5QZnE3bWVlTUht?=
 =?utf-8?B?OW03cGRZM09TK0dsQVdVTEZ0Vk1taXJ4QVpvRHZNT0Z4ZWYrdk1FSnFXL01o?=
 =?utf-8?B?ZVdPYmhETjBUU2tiditkMi9uZ2h4Z0VyZnFpRWthVElqa0JGRzdDeDQ4b3Jl?=
 =?utf-8?B?L2dMVElpVExrWkdGRzl6Q2NxSjNwcys2ZTh4N0lmMVowV3JGeWJEM3k5L2dY?=
 =?utf-8?B?UUl1RmpMVHZ4b0lxQXUvUjJDWUlDemlnOWIyK05ScmtMdHhubldUdTdlNnpk?=
 =?utf-8?B?aXJ3d29WV1pCRkd1ekk4ZEZldnFYTVNnRVhyeEhUemsvVE9vaWpHNnhXM2lF?=
 =?utf-8?B?MWZXclQxdHU2Q09TMWFqbjFRZmtDL2c2QUxTWGRCRk54eUV2dGxtUGJ6SW41?=
 =?utf-8?B?dFBTRDZnRzI3dndGbC94VTd6dVhDdjY0OElPZzZiSTA4c2Vqd29Sb3YvMG0w?=
 =?utf-8?B?OXhPTnlzQnk0SklFeFI5aFkzYWdXZDBDNVZPYTV4QkZTTVlXdXJnWEp4RmdI?=
 =?utf-8?B?RnMxZWJOUXZGdjNvNUdjUnFVVm0wNGx6ZEp6a0xKRndtQm9vODVGakhRYlE0?=
 =?utf-8?B?SU05UEEwc3JtZE8rKzFCTjJnRXdia01CK1BXTVZGcThjS3pEdTB1aS96Y2Iw?=
 =?utf-8?B?L05UVFlPK0s0T1M0NmthSkNVWCtYN25yakRDZGcwODZneWd0Nk5haHI0Z0k4?=
 =?utf-8?B?bXRWcjZjRzliM29kK2xpZ2FvM3QvWW9UcWpjd05KSFhtNjVxd0ZHQWRiejhs?=
 =?utf-8?B?d0Z0K3Z6Skt0WTBQNFhkK2w5bVcyWWJLY0RKWVJvdTA5U1RXSmRsYWd2VjBT?=
 =?utf-8?B?dzVaaEFWMEttbWZlQXd0Q20vT2ttL3l5bW9sME50S09Yd0E4aWd3UjdESzg3?=
 =?utf-8?B?MUd5MSs2VGFzZ2svbEtUN1NWNUF5b3RueU5hVU9zZDRUK1dWZzFkM3VIT21x?=
 =?utf-8?B?MWRqcXl5cXI2OXVKSTJ6V2NqVG4wZUswanNlRDNWeWFVWklNUmV1Z0hyRkJz?=
 =?utf-8?Q?2T8OLobGE/AFC?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN9PR12MB5273.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?blFJblB5OFlNc0cxU1cvMzY2N0p3bFpjcEdEUVgrbmxlS2pndnBOcDBBZnVT?=
 =?utf-8?B?eFR3VEdVN29yeFIxR3NOdXN0N1lVN09VSVZsWXU0TWhEMXJ3Wmw3Sk9EZXRu?=
 =?utf-8?B?dUZKakIxejhZazN4UW5kVDZ4WitDd3pvMjVDWCthakJDN1BGeGFQbzNNMzZo?=
 =?utf-8?B?YjM1aWE4VW9YclpZdzEyMzlxWnZleXZKRHJ0Y1pMK2tzVlhSVXJHK1RZUUhE?=
 =?utf-8?B?TFRpQUNpWlR2OW5WVVNaUVhsS3B2bnZIcmordlNIaVEzcWgzV0t4RFpDK0ZI?=
 =?utf-8?B?eWo1N216eWkzZGx6TURkMldVdGcvY0RpbjdpRnVYblNNeG5XL01VSzloVHk4?=
 =?utf-8?B?U21FYTNpY2o0cXdBOURTK0t2RXE1bFR6M0RTOHMyNk1mQW5OaFo0a1NRNm1y?=
 =?utf-8?B?TUVaS2NoeXJ1NWZMWkQ2T3p5ZGgrRG5TUFJsTEVyVTFrcHF2SzU5T2t1QXZ2?=
 =?utf-8?B?YStjcGtyR0ZaM1VTSXBOVHZHRWsxUUwxQ1NkMXJqTitLa01LVmExcmxpdllx?=
 =?utf-8?B?VCtaZ0hIS2FZTWFRK2NzSGRZeFNSN1JnZjE5OTQxWHFhTVF1NXZaTjZDWjhw?=
 =?utf-8?B?RXJwenVxWU9xL01kZFZpblloNHhwRlZUalFkMDlGNjlxaWVZYWdzUkdqWVNJ?=
 =?utf-8?B?K1hMVjl3aEwwSWtTQVQ1WnlvWllCOW9IaSthbXd4TW9xSzZyZ015ajVTcFJ2?=
 =?utf-8?B?YlF3NkIrQVhnTmdkYkJHUzZiYTZ2NjlQaWhYZ1J4L1c5a0Z6Mk81WlprYUx1?=
 =?utf-8?B?OCtDcHozMjJQV3haWVZwTmhFVTJDVUt3WTM5R3hEQnJTYUVjeVdwRmhwOVpi?=
 =?utf-8?B?TEVNOTUyb3d6TmZyaGZnSzEyRENLSXpIaUoxdE4xQ3BhNzZucmtkQjgycDh6?=
 =?utf-8?B?dFVlbTlJOWgycXRDU2hEQlA2UDg2Nlc5QndwT2VGalp2bWFEYTF5QTFISkpE?=
 =?utf-8?B?ZFc4TU5YQkczbWRweXROaS9ld1lTNVp0RDM2YUxtUnJGVVdZNDdBcnM4WHp4?=
 =?utf-8?B?VDdHdmExTHVOZkFVR0VNNXJ5K0Q4TWRLeDRjMk1sRzBlOGY2V1JvV0t4Wmpj?=
 =?utf-8?B?MmNJVDdDMTBHU0hIai8xQzhNWHdDa1BOUHFmV3d1ZnFtQm9tcmhKaThrWFBT?=
 =?utf-8?B?TkxxZFA1azdTRkhkR3JER2ppaHBxS1RQQjg5emx5YnB3c3dncERVZVRwaWNB?=
 =?utf-8?B?V05DbjJlWWVEcUVVdlR1MDRyLy92Vk1pV0hWMzNtTy9ob3B2aXloMUNLa1Nk?=
 =?utf-8?B?ZCtPcHBhRG1tSk1hYVhZTzV6ZXhCZGRHZnFTZW9CSDdkU0xiN3hXOGNOVzFz?=
 =?utf-8?B?V0pzaS9ESCtZY3BRUE9DNEJyQWFvN090ZVE2THc3dmRwWmtibkQxTXB0MWxw?=
 =?utf-8?B?aHZCVU1VUTQyR3VlcjgybE5JRG9vRmIxZ2k2UVY0YmljS1BXb2ppMi9jOWw1?=
 =?utf-8?B?MmRLYndNeTV0eDlCdXkyb0RGUkh2RmxTN0NqdlVLSmx2bHgrYkRFWHJQOVEx?=
 =?utf-8?B?aGdWQ3hDVnhERFArT096TW5taldCOCtUVWhzWW9TOHpBbGp1SDJQbExheVg3?=
 =?utf-8?B?UDdCYTdTNTNLWEJJMlJuZ0M5Z0FqWXdZM1RSWUIvZFQzeEhJYzNxV3NMYVFi?=
 =?utf-8?B?Z0U0SXFSNlFlVWtpYkkwMjk3U0ZOdzJnOHdZb0o2OEoxdEVnZzZkcVk5VnZ0?=
 =?utf-8?B?czBveVc1OGJ0VzZZWkt5aFl5ZFIrZG90bnZVN08wb3FIdW5jTTZjUlIwSmI0?=
 =?utf-8?B?Vkt5dWxCcmpVVElNaC9aYjdmYXh1MjdxWjlhOU5hZzBZZ2FBNUZGMXo2TFg3?=
 =?utf-8?B?bHFDQUdEd1FkQlMwSnBjRllDVVFHZVhtRys0SW5QOE1DTFVXVS95TTE5MjVs?=
 =?utf-8?B?K2UyZUFTbDhYRjcrWis3RHFFZlVYUGJmOW9QZDE1MHcybTFHK2ZONDIrZVQ1?=
 =?utf-8?B?d2k2NDQwS2hqLzRYY3VBSTNhYVRLQURTeVNzbkR6bWZKRW9Ibml6THluWEIz?=
 =?utf-8?B?UDREeXF0THBtMGNCSnAvdS9vRlVoMEMwYkxsUVRDdlNPVm54U0FDc2p1OE1J?=
 =?utf-8?B?cW1RclIzUitJdnQ4WVhqQnNRSDFLOUtCQ2lLdUVtdGV2clA2Z3UreU90RVRa?=
 =?utf-8?Q?6QAw=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 18bf0e2b-39ee-4866-1b0a-08dd4f524c89
X-MS-Exchange-CrossTenant-AuthSource: BN9PR12MB5273.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Feb 2025 12:55:04.8998
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gnYdyQ3+Jkjrjk0escHs9/snBcKEmLQMDKhe1sEbpcwGNX2K+gnUTEJyVYOrism7
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB6286



On 17/02/2025 11:27, Luca Fancellu wrote:
> 
> 
> LLC coloring can be used only on MMU system, move the code
> that selects it from ARM_64 to MMU and add the ARM_64
> dependency.
> 
> While there, add a clarification comment in the startup
> code related to the LLC coloring, because boot_fdt_info()
> is required to be called before llc_coloring_init(), because
> it parses the memory banks from the DT, but to discover that
> the developer needs to dig into the function.
Well, if at all such requirement would better be expressed using ASSERT in
get_xen_paddr(). The reason is ...

> 
> Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
> ---
> v2 changes:
>  - dropped part of the v1 code, now this one is simpler, I will
>    discuss better how to design a common boot flow for MPU and
>    implement on another patch.
> 
> ---
> ---
>  xen/arch/arm/Kconfig | 2 +-
>  xen/arch/arm/setup.c | 1 +
>  2 files changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/xen/arch/arm/Kconfig b/xen/arch/arm/Kconfig
> index a26d3e11827c..ffdff1f0a36c 100644
> --- a/xen/arch/arm/Kconfig
> +++ b/xen/arch/arm/Kconfig
> @@ -8,7 +8,6 @@ config ARM_64
>         depends on !ARM_32
>         select 64BIT
>         select HAS_FAST_MULTIPLY
> -       select HAS_LLC_COLORING if !NUMA
> 
>  config ARM
>         def_bool y
> @@ -76,6 +75,7 @@ choice
> 
>  config MMU
>         bool "MMU"
> +       select HAS_LLC_COLORING if !NUMA && ARM_64
>         select HAS_PMAP
>         select HAS_VMAP
>         select HAS_PASSTHROUGH
> diff --git a/xen/arch/arm/setup.c b/xen/arch/arm/setup.c
> index c1f2d1b89d43..91fa579e73e5 100644
> --- a/xen/arch/arm/setup.c
> +++ b/xen/arch/arm/setup.c
> @@ -328,6 +328,7 @@ void asmlinkage __init start_xen(unsigned long fdt_paddr)
>                               (paddr_t)(uintptr_t)(_end - _start), false);
>      BUG_ON(!xen_bootmodule);
> 
> +    /* This parses memory banks needed for LLC coloring */
this comment is confusing. It reads as if boot_fdt_info was here only for LLC
coloring. Moreover, if you add such comment here, why not adding a comment above
boot_fdt_cmdline and cmdline_parse which are hard dependency for LLC coloring
code to read LLC cmdline options parsed by llc_coloring_init?

~Michal


