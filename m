Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 738C2B0C3E2
	for <lists+xen-devel@lfdr.de>; Mon, 21 Jul 2025 14:13:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1051453.1419775 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1udpOQ-0001sh-VY; Mon, 21 Jul 2025 12:13:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1051453.1419775; Mon, 21 Jul 2025 12:13:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1udpOQ-0001pn-Rq; Mon, 21 Jul 2025 12:13:18 +0000
Received: by outflank-mailman (input) for mailman id 1051453;
 Mon, 21 Jul 2025 12:13:18 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=cu2o=2C=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1udpOQ-0001pe-35
 for xen-devel@lists.xenproject.org; Mon, 21 Jul 2025 12:13:18 +0000
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on20614.outbound.protection.outlook.com
 [2a01:111:f403:2417::614])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 144a8040-662c-11f0-a31d-13f23c93f187;
 Mon, 21 Jul 2025 14:13:16 +0200 (CEST)
Received: from BN9PR12MB5273.namprd12.prod.outlook.com (2603:10b6:408:11e::22)
 by PH0PR12MB7470.namprd12.prod.outlook.com (2603:10b6:510:1e9::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8943.30; Mon, 21 Jul
 2025 12:13:12 +0000
Received: from BN9PR12MB5273.namprd12.prod.outlook.com
 ([fe80::cf66:58ab:47be:4b13]) by BN9PR12MB5273.namprd12.prod.outlook.com
 ([fe80::cf66:58ab:47be:4b13%6]) with mapi id 15.20.8922.028; Mon, 21 Jul 2025
 12:13:12 +0000
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
X-Inumbo-ID: 144a8040-662c-11f0-a31d-13f23c93f187
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WgYhHhNTAqv9KNSE2gnBRSy39UXyqNOuFhl5ZwRhsbf6OzDH+Qzp9skisnbpfgYx38h4Jus0+N2tGWchS1ZLkTsAR88ogO6Kyz0v6vJnH3RJyAwrL44xW+OnHRYGlsAhhgWCN2fbH4ZASrFA6ImTpyTfYX2HGEiCdd7IlP3FE/6rBB1Z2ygxO2zTeUvg0S2qcLh3rBOAFgQKIGXFPOVWu6rGhXvlkO1vw0B4cW4lUrzu+z/9TI8yIg5TK7qR1eO6kwTP+zPDk9Ih+YE5+puPhGCz2aD8itgIoWOybcUN5CSHzf7pg3CQml6BnidpHgkS5I7h1L6DwM9B62DmaXqxdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=deQOjTUVCZnMnv9CktKBpqII466lEPskS8XESm9jtW0=;
 b=LguX9iBCAg3reDQNPhQDVVbyyR/8utLA4BI3nm/YP+Ya6Qc1L9f6GQNqXffYD/TAeFaFDfJQvkInWNRpx/mk5Fi0tlFdoVXeVopxXni5hdJXyJmte7zOtdDIT614m7TAseaGX9HhOYgK6Y/MzenzdJii6oK8ydU+/NNj8DNbaYCFJfDYdFtd3GWnB54Cm2A233Piq5k3xWBScwuwrBEgnV5Wz4J7pdi0+BNgY2HnM4C1mk+0FvyzWRgxW78WL0IEv6dYUe7y7BlZGOnazGzZAmMf1w9btg3wApIk5WMwXx0l90FUbHnEDYo+mrY2D0xrmzF+SEpFIx4obHJednMOSA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=deQOjTUVCZnMnv9CktKBpqII466lEPskS8XESm9jtW0=;
 b=BTckYcylY12QZ8EN3e081acJn+7gf2HS6N/H1k2JEtzLYjqTxDYApSsS54U1EJMpO+SPchzdDm/ocz6e5m/m8KIyJTHH/wiOtxv22KLc9P5bV0N9a2DmSAsIE2TQ/wggutLrTlWbUwDNenYXG+aTBZhDmwFkzNtBcgAifaCInj8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Message-ID: <60505d70-7dae-4260-8a2d-960115e6ba5a@amd.com>
Date: Mon, 21 Jul 2025 14:13:09 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] xen/efi: Reuse fdt_setprop_u32 and fdt_setprop_u64
To: Frediano Ziglio <frediano.ziglio@cloud.com>,
 xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20250721090713.414324-1-frediano.ziglio@cloud.com>
 <20250721090713.414324-2-frediano.ziglio@cloud.com>
From: "Orzel, Michal" <michal.orzel@amd.com>
Content-Language: en-US
In-Reply-To: <20250721090713.414324-2-frediano.ziglio@cloud.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR4P281CA0127.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:b9::11) To BN9PR12MB5273.namprd12.prod.outlook.com
 (2603:10b6:408:11e::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR12MB5273:EE_|PH0PR12MB7470:EE_
X-MS-Office365-Filtering-Correlation-Id: 7a778408-a06a-470c-d854-08ddc84ff693
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?Y2hQN3AxZnNRUWNDWU9nMGFSWDB3T3I4WktFVG8vVk5uVnVNbTdrOU85Q1R6?=
 =?utf-8?B?V3VzTW9PQlRqaFZ6QmwrTTc3d1FndFE2MVAxZzhncmIrdVJIQzBlUUxPTHNp?=
 =?utf-8?B?eGh6ZjdpVVJwbi9iRXpUZFFKUXhYdmsycU4rcFhieUN5NXQrNVJLNE1HR0ZQ?=
 =?utf-8?B?RDZjb2Q0c0txa25nUzF1NEhDWUhTMGJqVEp6SGovTWp6cmJJZWs5SzZML0o1?=
 =?utf-8?B?TkhzKzVwR3Nic3VwUU1IMmViSDdBaUJZUk96cUlvUUw4TUtDRWs2L3dzYm96?=
 =?utf-8?B?OUU5QVpSTzlLRHh1K1NXSlBGOW9tTUN2V3dENlNabDJ4eFkzOTkrUndmMURE?=
 =?utf-8?B?ZjZJMnpmenRTOEVvMUVHcHM5OTFEKzJIZnY2U0cxUzlleG5TRVdKRVduL00x?=
 =?utf-8?B?a0UxUzRpNFFiT00rZzZncy9ZcE5QVDBOYlQ3cTU2NXlmOWVPcWprMlgydDV2?=
 =?utf-8?B?MW4zcWpUN0hlZThFeS9GNEpRZ1RtMTd6NW81YnNudVd1OUtxSE43TlczNkw2?=
 =?utf-8?B?WEI5VkVGN0NnNWFKMGozNG9qQ0pFaFdzRnF3NDJnNnFIbGk1TXp1ZXpVaFZi?=
 =?utf-8?B?ZVFtVXdMRlNRbm83ZTFKdkxjL1BhRmFCOWZkWDE5STVLQThLL3hWcUFlOVV0?=
 =?utf-8?B?aWdubFJ5NWdCbUZRN29HOU1ZV2VOTnNxTWdWbVZrK0dsWitMckpKOWhjUStv?=
 =?utf-8?B?ZmZQUzExb2RXQnRGM0pvb01zaTg4NDNHeFRKbEJ6a20zYlpCOTVKbTBzQnBr?=
 =?utf-8?B?REFjRVhiVmE0bGVrYkR6TjZSRG9FYXNwK1JndDhiOWhYaEc2Z2V2eWRkUStD?=
 =?utf-8?B?ZXU1YlgrSXlVVnNnSTVzMWJxZWgzOWxsZDlTYjV5M1ExYzZzMHFRRFpPaC9H?=
 =?utf-8?B?dE9rRmNZNmdueG9yY3hsVmpsbDFTbGxhbXhQekg4YmowUHN4ZjZwdk14TldT?=
 =?utf-8?B?UDRpSE1OeEJWa1RBVlk4d1RjbHZJTi9rQU1JRURsc0FqK1g3cEdjTmdQNTRp?=
 =?utf-8?B?MU5ycHBnVDM3ekkvYW1jcFVhMzFSRFlCeHNDZHJoc3VPZ0hMYlB2a1JiZytE?=
 =?utf-8?B?Z1FabXR6WlRRR1pwMEVsVVBIcEpPVURLRmZURUErTi96YjVoaEgzVmJnZHBH?=
 =?utf-8?B?eDdHVlhIRXk0L3hrMTVDbEEyMDhiaWtyZTNhQlFJQXVJMTdvU3pHZ3FJWkYw?=
 =?utf-8?B?ZjJ2UWwxbUM3NjAveVFQbU81TzhoY1NDbmgvcjk2UzlEN3FUODVvZnYzUUIy?=
 =?utf-8?B?MklaMmdNMzlnaG9qT3NENUZIQTI1QmUzTFdYbi9PdU11cjJJdnMwb3RlMGQ1?=
 =?utf-8?B?MFcwa1FwbmU0N2lKVkkzTjdiUGNoSGZRU2tOUWhKWlYrUTZsWTE2b3VlSXor?=
 =?utf-8?B?YVUwcFRiUldsUDgwcWx0OTU5NXYxd3ZzTklieUdYTjlrQmVDUkl4Tkdqd1lx?=
 =?utf-8?B?b29wZndCZElaY2pJQURuL2dxQVdMOXAzUGpJdHJZaDM0ejlaMlpzVWR3STQ0?=
 =?utf-8?B?ejQycVRQZ3Y2MHE0b3l3czZOSldKSGQyYnFHVGVqRUVibmJENmVsMlhQVVY0?=
 =?utf-8?B?MkdGKzZKSDd2K1FOdVpxUHRtQ2VxeDgrU01YRVhVUVBCNnJYOURzQmhRb2FR?=
 =?utf-8?B?UUdsOVYrQ3Y2eURqLzlZUTZnVGxsVHRua2kzb0dtMk1Lb3AzRmJmdTUxK2hR?=
 =?utf-8?B?V1lnNWo0emZ5anVRcWkwWCsrbXVXUlZEZmFITG5Wd1Z4aWNjRVllWVI0QkVZ?=
 =?utf-8?B?empBa3l1ejdQUy9ib3dSNzYwVk5HNnVBNnh5QTJaRnhlY2V5ekNPaDF5WmpJ?=
 =?utf-8?B?QXArR09FTTVOY1lZRFg5VS8yaStQRGwvSHlhV2hzaE5zOVU5OTc4M1NwV3ZL?=
 =?utf-8?B?bHdudk8vZklsYytQeGhOcEkxNXhGRkdrekZGcHJqeWMrZmpnNW1lM2FEdWJ1?=
 =?utf-8?Q?1RuYe0rWIvY=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN9PR12MB5273.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VE1hK0hKQm16R3dNS1FqdERkREVuVjU3ZENSZ2ZXR0loaG5ndTd2dGJEN0px?=
 =?utf-8?B?V1dqS0YwYTNBaWpQMEhBZzAwMDcrVW0ybTBqYlBML2lYc3U1TTB4TjdOS3hU?=
 =?utf-8?B?SE1iL3lQWmFsSkJNUGhvdmUwbUdiVnpweHRnUU5tWmp2SkduUGJ0SlNUMWNP?=
 =?utf-8?B?V1JHa3V6TmcwcnRGeWZ2WmcxWXk5THZqN3dFY1VTNXJoQWtXam02YlZGWTg3?=
 =?utf-8?B?WkFQSlhYL0JHcUk4Y1kxSi9wSUZoU2l5bXB5cG5EaDQ4cEdqUmFjb0hQdFE4?=
 =?utf-8?B?SjRpemdEVXhSaTB0RDc4NVhhai9VcDVCenRiM2p4YTFDOVJRMzZqK01kNmxE?=
 =?utf-8?B?aWhBNEw4YmZQK0JoM3dqWm9lMWdvaU9nbTlnWittK3NFTW4vL1V5MWdDdVZC?=
 =?utf-8?B?am91WG8raDdhNGZyY2wyZUlMcUtNb052YnpHR3lqTlZUSFFXdlhreTRCTFNh?=
 =?utf-8?B?ZW9nRkh5RnFGMlprbmNlM282Y1NxOGgyai9OSGJIVUhsVy9IRzZ4U3Z3Qmoz?=
 =?utf-8?B?V05iNU1PZEk4N1pzMG44QzRvaFpCS3F4YnlzNXVwYmJDNWxYL2daWC9rNThL?=
 =?utf-8?B?eFdteEJCb2xFWHRpMWJnbU44Vjk1N0dLZHlNeEVWMi96ZURYZVBSYkVFTmRQ?=
 =?utf-8?B?VktVZENISnYyMjFyNkQwWWVXeUwyVnZmNXRNUmFrZzJ3SHdwa05ZZCt5Zm5v?=
 =?utf-8?B?U2ZBUGQ3SVUwOS9veVBOeHppQjVRR1lPOU03bksvOGZqbFAxZ2hXMHVIRlQ2?=
 =?utf-8?B?L2JaVkVMZE9Ob29lcmIrWGpOUVpzSmtZSlRxZjdPeFhQTnVGVXFxS0FFRVFu?=
 =?utf-8?B?ajRVL05LcFc0K05LZjh2TWJndm5LRVRhTmM1SFpoYUNPUUJDMVpGWGVGeFox?=
 =?utf-8?B?QVNiaWIyY20zbHRNdDJCTUZJU09lUXViVUE2R1hJcEk2RkM0c0o1dlVHaktH?=
 =?utf-8?B?Y0lodU9Bb3YvZ1pGR3lvNm1POTMrSFpNTE9HSWdpOGhpL2tJYllhMndkeGFv?=
 =?utf-8?B?S1pCejFJVWtYOHZtbjFUSCt3UVlLSHFRTGZURFlST01MSS9Zelk2djNhd05n?=
 =?utf-8?B?OU9kV1JKZitlVUVqeFhhVFpLM0xhbTN4MlNDRnl4aEtSSjczM3o3S21ya0ZO?=
 =?utf-8?B?M1A4UmVBZ3NBdlBTS3UwQWRyTmJDMnE0c2JNTDVhYW1tQkhqWG14SHowVmw2?=
 =?utf-8?B?Z0dlVmtCc3RadHBVakdsYVB1NDhFNlI1aTVYSlZacmhZV3BMZkRCT1VyaVhs?=
 =?utf-8?B?TmEvbnFwWjJVRlVZK3ZSVU9EU1pBOVhMTlltV1kwb09EOTVGQ2tuUU9BRk9C?=
 =?utf-8?B?VTZvNWc0TzdUbDhoVXVOMUVtRlUrOGo5ME9JeDc3ME9wR0hKcHc0alFGZnhY?=
 =?utf-8?B?Q0VKTGVHQ3RVUTEraWxCb3U1L0JXU2pBYnBoWGw3V0N4bDNGTlRtOHYyNHR2?=
 =?utf-8?B?KzJDQUdNbWtTSU5sQjdZQ2JQakZFVnVOakxZRmRwZFRtZU44MzZUWXVYRE85?=
 =?utf-8?B?dDBoQ1IrVW1CdGZtN1FLSi9tc2dQcU91VUZERWNDSHZKWUJWc2dXYUtjdmcv?=
 =?utf-8?B?ZGdoT0gvcThGNDQ1MTgzek5kcFdMcVZIdG5JUEZPYzlxRC9MeUR4a09jZlR6?=
 =?utf-8?B?cExWWlh6TnBlUlpvRzFJQTZyalFDUlhQRlJsdTFla1g0K1FMNFMzUEU0Y0pq?=
 =?utf-8?B?OGtwWWh2TllYRlY5OUQ2WHZaVlVSQUlMT2VFMkpxNXM5eS9QbGhYVHAzVHVD?=
 =?utf-8?B?dnI1dUtmem1HZGJ4Mm9ySHowWUdGL0lTN1V5ZWRwSjMyS05oelh5bTRNVEc3?=
 =?utf-8?B?Y29STnRXWVB5Rzc3aVdtQUZCY2JvdUV3OUpnUU1NeFQ5NWxsbVZqdkpkRWxL?=
 =?utf-8?B?TEZld2VTRXlBK1NrV2NiUDRkTnJRZ1NBN25VNHlybDFQNTlHVWZqb1VGVVRG?=
 =?utf-8?B?MDBFb0pEcGlUSHNlSFc0bEVmcEtTQmJ6Q0lZL1llTXUwNEhneVR6NVJoVXVL?=
 =?utf-8?B?L1pvZ2Q1SEZaRWkvS0QyaUNjMUV4ZHVsZW9mWEVIb3lzeEhaVG9tTDhkaTRn?=
 =?utf-8?B?NkZxT2RHdFhMQkxPZHc0VVhyOFJYWXJMQW14bHpJVWJvS0VIUHZFVTFsMk5C?=
 =?utf-8?Q?e9Sc=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7a778408-a06a-470c-d854-08ddc84ff693
X-MS-Exchange-CrossTenant-AuthSource: BN9PR12MB5273.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jul 2025 12:13:12.3829
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oTEgnmrEfQOD/+QeJ3eUy4wyWueeJNMTCbfc+dsq6kBG81L24B3RC/FGDzRTB0H5
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB7470



On 21/07/2025 11:07, Frediano Ziglio wrote:
> Signed-off-by: Frediano Ziglio <frediano.ziglio@cloud.com>
> ---
>  xen/arch/arm/efi/efi-boot.h | 33 ++++++++++++---------------------
>  1 file changed, 12 insertions(+), 21 deletions(-)
> 
> diff --git a/xen/arch/arm/efi/efi-boot.h b/xen/arch/arm/efi/efi-boot.h
> index 3dbeed3f89..a2aede21d5 100644
> --- a/xen/arch/arm/efi/efi-boot.h
> +++ b/xen/arch/arm/efi/efi-boot.h
> @@ -79,8 +79,7 @@ static int __init setup_chosen_node(void *fdt, int *addr_cells, int *size_cells)
>      prop = fdt_get_property(fdt, node, "#address-cells", &len);
>      if ( !prop )
>      {
> -        val = cpu_to_fdt32(2);
> -        if ( fdt_setprop(fdt, node, "#address-cells", &val, sizeof(val)) )
> +        if ( fdt_setprop_u32(fdt, node, "#address-cells", 2) )
>              return -1;
>          *addr_cells = 2;
>      }
> @@ -90,8 +89,7 @@ static int __init setup_chosen_node(void *fdt, int *addr_cells, int *size_cells)
>      prop = fdt_get_property(fdt, node, "#size-cells", &len);
>      if ( !prop )
>      {
> -        val = cpu_to_fdt32(2);
> -        if ( fdt_setprop(fdt, node, "#size-cells", &val, sizeof(val)) )
> +        if ( fdt_setprop_u32(fdt, node, "#size-cells", 2) )
>              return -1;
>          *size_cells = 2;
>      }
> @@ -251,8 +249,6 @@ static EFI_STATUS __init fdt_add_uefi_nodes(EFI_SYSTEM_TABLE *sys_table,
>  {
>      int node;
>      int status;
> -    u32 fdt_val32;
> -    u64 fdt_val64;
>      int num_rsv;
>  
>     /*
> @@ -275,33 +271,28 @@ static EFI_STATUS __init fdt_add_uefi_nodes(EFI_SYSTEM_TABLE *sys_table,
>          }
>      }
>  
> -    fdt_val64 = cpu_to_fdt64((u64)(uintptr_t)sys_table);
> -    status = fdt_setprop(fdt, node, "linux,uefi-system-table",
> -                         &fdt_val64, sizeof(fdt_val64));
> +    status = fdt_setprop_u64(fdt, node, "linux,uefi-system-table",
> +                             (uintptr_t)sys_table);
Don't we need explicit cast here? In other words, why did you drop them?

Other than that:
Reviewed-by: Michal Orzel <michal.orzel@amd.com>

~Michal


