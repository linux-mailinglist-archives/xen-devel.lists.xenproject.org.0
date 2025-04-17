Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 017ACA916E6
	for <lists+xen-devel@lfdr.de>; Thu, 17 Apr 2025 10:52:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.957190.1350364 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u5Kye-0004D8-Uq; Thu, 17 Apr 2025 08:52:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 957190.1350364; Thu, 17 Apr 2025 08:52:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u5Kye-0004Aw-QX; Thu, 17 Apr 2025 08:52:08 +0000
Received: by outflank-mailman (input) for mailman id 957190;
 Thu, 17 Apr 2025 08:52:07 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/8PF=XD=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1u5Kyd-0003NP-1C
 for xen-devel@lists.xenproject.org; Thu, 17 Apr 2025 08:52:07 +0000
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2062a.outbound.protection.outlook.com
 [2a01:111:f403:2412::62a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3b839ddf-1b69-11f0-9ffb-bf95429c2676;
 Thu, 17 Apr 2025 10:52:04 +0200 (CEST)
Received: from BN9PR12MB5273.namprd12.prod.outlook.com (2603:10b6:408:11e::22)
 by CY1PR12MB9560.namprd12.prod.outlook.com (2603:10b6:930:fd::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.34; Thu, 17 Apr
 2025 08:52:01 +0000
Received: from BN9PR12MB5273.namprd12.prod.outlook.com
 ([fe80::cf66:58ab:47be:4b13]) by BN9PR12MB5273.namprd12.prod.outlook.com
 ([fe80::cf66:58ab:47be:4b13%5]) with mapi id 15.20.8655.022; Thu, 17 Apr 2025
 08:52:00 +0000
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
X-Inumbo-ID: 3b839ddf-1b69-11f0-9ffb-bf95429c2676
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sBOGN3qeOA3MT+BuojdLUUD3NvV5JmE3YHyoPRQAduuBIqwRIBE+drHweV7HbYaCAO89s7UeQdfo7ipEzeYprFeGB7itZq3bV6Izoqpyo60tMKL6Ct47Z5QkH11iaggiktnk44HMgvGaKn8nQX9PmytPync+oWeUcWa/jP7qtHqDaye/UigjEarHFt2bRYkDHOLeFXXq0ZEwd8pDAL8BLBtykkcfW5+2LqaJIC2WVK0l46l08z31+HXIDoB18wKmWzO/dtuHyFqGj72JCFK20ySkl6fnTBN+4CiuvnvRd0QtxGphYBKtpUylPzMn1PM57ssAqnCvRVwQZIARxJaiJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DRyWKdTFO2wU1cwOYMZJMSGsuek8ecYSmai7W66I18E=;
 b=jNs8m/Nq4NPDxYZ/gCyz7eFmdup1i0qdWWkDAhU01YOvuhWvEGbIXQKlZ1s63F4wFz035k3rJTprBOfapV+vpBiTzgNLzOZx21j4keGd/XOSrlaJxG0nfbyrmr7p6dNhP88KbHJ75/UjMdwtqjbfaZr0hDP24hgyoV4V41FFxOrCXRyMQcLLdvpyTIAIvOB2jYtGdUllZnq5OnIfuN0MddsTjrdHwKMrMAU7t9cy0VXayYYngxz9QXMnZa/t1N+B5bUYXzECzZ3EvCJ6zZOBUBvfXcyfhb9EVHWv1Xx3skxft5KQfP+kX8K8LSZzCYxKZSZc2zHy9F7bdKD80gpHKg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DRyWKdTFO2wU1cwOYMZJMSGsuek8ecYSmai7W66I18E=;
 b=j0srUXIYJEQfcD4CmlmxzIDzrd0l6ivtGxq2sK+bp6r5IuRJGX1fcPf9xhOvFgSxeDXOfT1NMTvTBvCjFJvi/nRSBb/hr4KxsYAfkYpFOh0fMIDb/iYe6tp4vZKYNincPs6jvUBIYRy888cQdDL96XOT6DEZCduY3IvdkC2QUlY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Message-ID: <25034b0b-74c9-4da0-b6f3-f4a00c010cd5@amd.com>
Date: Thu, 17 Apr 2025 10:51:57 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] Arm: rename smp_clear_cpu_maps()
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Julien Grall <julien@xen.org>, Stefano Stabellini
 <sstabellini@kernel.org>, Volodymyr Babchuk <volodymyr_babchuk@epam.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 "consulting@bugseng.com" <consulting@bugseng.com>
References: <b792df9c-9912-468b-87a8-bb5d81c14df6@suse.com>
From: "Orzel, Michal" <michal.orzel@amd.com>
Content-Language: en-US
In-Reply-To: <b792df9c-9912-468b-87a8-bb5d81c14df6@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0208.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a5::18) To BN9PR12MB5273.namprd12.prod.outlook.com
 (2603:10b6:408:11e::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR12MB5273:EE_|CY1PR12MB9560:EE_
X-MS-Office365-Filtering-Correlation-Id: 3060f1c3-d2bb-401f-3ac0-08dd7d8d1dfe
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?blorZmFWZkUrbVMraVV6WXpLVlNmeWdHMXd1dEZxUVRJNnYyUUhlMHIwdnZq?=
 =?utf-8?B?NHZ5ZjN6M3k5eWtCeC83anpEWkRzcjRBUlR6ZlgzOVY2dTNRYXMxam11RzFz?=
 =?utf-8?B?aUtTeWdyWFlzcWljQ2RzTXE4TWlxT1dlQzZXMUl5aGIvK2R4R2V2YXozWlhG?=
 =?utf-8?B?VitlTmFDWWxhSjFMS09kYVNpOHF2QlZWL1p5eVRYMW0xT21hWE1UUkM1R0xC?=
 =?utf-8?B?SFl6YXNIdEVaK0NKTDJmU09OemRleTZTcytxU1Uzc1VHZTRna0VCdlVaZ0VB?=
 =?utf-8?B?Vk92d0JSdWhBZ25LVi9IR1JlbHZoSXNhUUcxc3FRR2J3d3A1ZElwalJ1REli?=
 =?utf-8?B?MmcwVWpCVXREL3ByU1BrSGpXMmQ5aVZCZWlXL0c2b1BiVndaK0VHYjZvNU1S?=
 =?utf-8?B?ZVBWNGNxa2xvMzJWME0yVElVSVY4eUhIa1NNODV4d09DdzNyYVlmSUNhNjVZ?=
 =?utf-8?B?UnE5MEprU3hUeUVoVFR6R0JFSm9xTm5va2Q2SzJyS0VyVXhReW5kTHp6MjFL?=
 =?utf-8?B?TDBSc2pBL1ZpVU9GYkZIK1BINmFZWUNPWUI1U0NHQm1kZ1NYYzdIeWF0ZVdh?=
 =?utf-8?B?Y2QySDc1K0VzaGdxd3pTMGVqaDdKVkJQL0ZMZjFWaGpnRmlNZGU4L1Q0WXZp?=
 =?utf-8?B?OUhvV0hsZ01HeHNEcVVrOXNLVDEveVhPUXIvMGdWcURxOVphRkZ6UnJGSUFm?=
 =?utf-8?B?S0NCZUNOc3g1cWYwZ1U2Q3RmREltS2VGc2ZxcUlicE1Zc3lTbkE2MFFmdjVr?=
 =?utf-8?B?Q3ZQSW9HK2hWNFVTQVp6TkhkdG5xenpTSVI2ZXA0Ui9ON1h5UE0wNzYrcUJm?=
 =?utf-8?B?UEFaUmNkM0RlTkdaN25tVUdrSm05YzZEUTZXcXlzd0ZEL1A0WXlILzZJUExC?=
 =?utf-8?B?RW43WjVQWUd6bUM0Q2R0NXAwN1IyREliMlMvNU5nTDdiUUNIdXFiRjV4S2lq?=
 =?utf-8?B?ZmVJeXhvTkRjYmxGVnFlSDNuTnpXZDk3b29qcFBtUkVCdWVrNFp4bUErZVlO?=
 =?utf-8?B?MDZDdENycWpCSVdmNyt5RXVaQ3pvUFg5dUhjWEljNkVtWWZKWE9MSUh3aTF6?=
 =?utf-8?B?VzdtNENhTUJFa2EzMHJQT2lmNHFteFkvWG9WU1dYNkhEclZ4aEVEbnFLRER3?=
 =?utf-8?B?R3hpQm9YUEpLdjE2TlFsTFN1bThvS3FEdWxTOWUyVlhMa25RS29pMEZqamVP?=
 =?utf-8?B?eStJb050M0RWTGxSVk9tTCtYUkd4V3QzU3hDa2xiNm5lY0cwYk14YmYxRGhH?=
 =?utf-8?B?b242a3Z0clNhd01waTFudDJRb3M4V0hJRGFUc2Z2WGRHVjEweGJSUGJKazJO?=
 =?utf-8?B?SGlhb0tTcEtHcWs1LzM1YTE4SVhFYmZoam1ZaXRMQ2hwTGMyOHVYZTE4Y3Fn?=
 =?utf-8?B?ZUtYOFFadHdMc0poSVBPUWllUGFQbnBmVWFoUlBpaDBndlBuQ2VnOWRQRUNE?=
 =?utf-8?B?Y0UyYzBOdFB1czZ1dGhmWkZSZzh4NDNPUlVjOHRvYU1yZ09jRllqWEpWWU1R?=
 =?utf-8?B?RG9laERaNS8rWlRDbDJKK1pNVXIwN1pOY3l2K05VQ25mQ3prRFcrSWtVN04v?=
 =?utf-8?B?bU05L3dMRzYybmtPS1ZZWlpaM3NKdEVvbUNyNTVyNmlHUmVSMW5uRmxwWGRv?=
 =?utf-8?B?VTgwbktsdjJmM0lmZjhJbWt5S1dPd1huanlaeHlQaGZoenJQMG4wNC9IS3U0?=
 =?utf-8?B?VHZyNDVyY2RuVTBteXJUY2U2di91c2x6WjYxL0huYnljYWdlc2R0ZitEUmc1?=
 =?utf-8?B?SC9XdS9zT3BpSUpYR2JsMTIyU0xWbVZmRFhwckEvYkNrVUNIakVnbDBLWmVB?=
 =?utf-8?B?WUV1TUUzeUZWam42ZVBmRTY1Nm1qbU5HR2U5SnlIc2cySGxmL3hadCtONG5w?=
 =?utf-8?B?NnRIb3NTMVFkZlFYWFIycDhqY015a0dOWUxqSnppS0tTVjJBMXhjbzN1engy?=
 =?utf-8?Q?oDVBwmTxeHA=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN9PR12MB5273.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cGZ5RTNoNFU4ZGdUM1FiM2dlMmZuTk1keGxzOFVJWk9GL2d3NS9UeDFndzhL?=
 =?utf-8?B?QVAxSnNiUVpHb1pXMWtqYlVrZjhVaEZuNHJBdFVJY1pPN29lTUZTclVLTmpZ?=
 =?utf-8?B?N3BTY3dkdm9nWWtSNWpNWElLRnE1d1hjeExrNEgvTENFamI3bU9PYk9WeHJv?=
 =?utf-8?B?YWF1MWdTSXNId3RIaTlvalgzZ2VvdUIwWkVQMTBDNGc0QkdXU01mN3NwUEk2?=
 =?utf-8?B?TXR2cFV0MjdqZEdlT0J5cnpKcThDWWlCcXc3SlVET3JqR3krZEJzUGdScXpz?=
 =?utf-8?B?UFhOWTVMcURWMUwzTitOWTVndnpFcUhnODBOYUpRWjVtbG8vR2tTVlZEenpU?=
 =?utf-8?B?YkI5SnVVb0t4UURMbHkrc0JsaWlTYXFCNmJmc000YThNdGRZYmNicnRDRktt?=
 =?utf-8?B?eVZja1dVamJCQXI3ZGtjWHVDYkR5eHRlRGt0OG1CYWI0dTBuQW8xNHBxQWhX?=
 =?utf-8?B?VFl4VFY4blcrVVkrbkJ2OFMzQWZzUWdZRExaVmp0bDVIbmlrWEhKMTQrNGhY?=
 =?utf-8?B?Q0k4YTcwOC9YeUtPM0hpMFNoMXBRbmRMWE1vaExMN2xJb2M0dVNVREM2VEtS?=
 =?utf-8?B?M2hxcmZkWXF2UGY2ODZUMGtnZzhaU2JBbjJiWUJhYldOM1NjUUhuV0Qvb08z?=
 =?utf-8?B?MGt1YXdOcDBoMU9CTG03K3VCU1daWksyYXpydzBZZ3Rjb3d1MHdnMUR4T1A1?=
 =?utf-8?B?YmhVSTJuTFZHUjBQSWFLMUxNZXROaTFMRWcreVZoZnNDSHhaQktuRnZvQWtR?=
 =?utf-8?B?enNJZExzSFUvR0tFZ0czNFNxbnJwSGlyV0xFL3o2QWc1WHdyUFRlWURoWjE5?=
 =?utf-8?B?WWdqNXU1c1ZuenpuSWlYeDVoRVF2aUt6TWtDWHZFbFh0ME5GUEVyQlpwam1u?=
 =?utf-8?B?UDg0V3J0RTgwelFJSER2WG40UGlFVWJnYzJ4dXcxYXI0SVlVTVFhODYzK29m?=
 =?utf-8?B?TkpibDY2R1duMTV5RXB4RWt6NFlra1NKTGJCY0pmVWdET0ZMSUZ4T0EwV09I?=
 =?utf-8?B?RTluN2ZBRkdJMnRSWEs4OWVxcFVUTTFWRzJ3VnA1ZUdMM0x2ZXo3TXhOYWN0?=
 =?utf-8?B?bmZrUjBmbXJLQTAzZTdTOGdQRUg4SGpjdEhJNWxrbUNkWEY3dVM1Y2NVTUFM?=
 =?utf-8?B?eEFEcHZJbXBsZUNpTGFmQWJmeGVIV0hPTUQvL3FqTVlNVFlxNCtoM3VzU1hK?=
 =?utf-8?B?dVUxdlhtbTFDS2N3T3V5b2RpbGJVYkVxRGlzWkVndnhaZkxQdkRpRTAzSmc0?=
 =?utf-8?B?bUdEMDFOS3E1UUhyalhIUVk4Vys2V0hZSjBxK3BvcDJHVjhxSFo5N2R6dkw1?=
 =?utf-8?B?bEl0a3V5RURYQXdjNU4zcjNXcUVBT1hMZ0R6S1JTVmlMWnk0ZnBaRlROMy9X?=
 =?utf-8?B?RVR3VzRmVnRhYTlCR2ZlSzIrUDJYK2toTGllcG9NeXRnbkhTZGM1ZENSNlFY?=
 =?utf-8?B?WWtkTkNpcFVScUxBWC9jZnV3YUMxVTRmQ2FOZHRxcTF0aWlKTkoxYmJCcG0x?=
 =?utf-8?B?U0RyeWdZQXdaWkNwMHQxcXVuQmxpWjBEeXBZYkEycVZ6dXF6Zk5WRVNPa0N4?=
 =?utf-8?B?NERYUmRiSzROL1ZKcktEUDF0Q3UwWVJndUpLK083UzBFMHZ4M2g0OEx0TW9j?=
 =?utf-8?B?NDVCdXFkTGdlNW5mLytJRTFIa1drbnFyNHJCTGRmYU1vVUpUL0Rrb0JwQzV0?=
 =?utf-8?B?aVhoQThIT20zS01Ocno5cFBBV3paVkowYzhOeVZGQnZjc0k5bXU1a0tSbDlT?=
 =?utf-8?B?OVgzelJnSnJpY0I0MitLT2tWUCtxYmpTbGZMMDdGa0FmNXBxaXRCTlo0NSsz?=
 =?utf-8?B?WUkwbThIV2lsRkxySitaZXZuRVJJem82OFBKY2dXT3BTaGhJRnpaOGF5bDdo?=
 =?utf-8?B?bG56dEhUUVRkRWFxcGt1Zm1LMTJDT1RJTnlIbUNmWE9raE8rWTRtQncxNDZP?=
 =?utf-8?B?cGpkNnF3QlVVRjNPaEh5ZWc4b1FXNXovRG83cUhtaDV1aHVoYzlHSFJ2K0hT?=
 =?utf-8?B?VzBtUnEySXg5OWlzRHFFNkhIU1NlbE55M28va2M2TGNVekhRcURxbHFqQVBZ?=
 =?utf-8?B?MnlWTWo2OXZvOTVUelYyVDBFVXI1Wk9aQk53WXAwNzBQOEhqS21IRENtc2Zx?=
 =?utf-8?Q?i9HTsX/wMt1ufWfv0wvgRuL2A?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3060f1c3-d2bb-401f-3ac0-08dd7d8d1dfe
X-MS-Exchange-CrossTenant-AuthSource: BN9PR12MB5273.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Apr 2025 08:52:00.6049
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Y27/27jIWJnzjFlkM4idarAGO7V0YBRGLq0YbozZsW4j0uwqOco5qsli2JZB0Pbn
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY1PR12MB9560



On 17/04/2025 10:36, Jan Beulich wrote:
> The function has lost all clearing operations. Use the commonly
> available name (declared in xen/smp.h), that x86 also uses.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
Reviewed-by: Michal Orzel <michal.orzel@amd.com>

~Michal


