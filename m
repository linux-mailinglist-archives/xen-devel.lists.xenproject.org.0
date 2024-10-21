Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 417A39A6E5B
	for <lists+xen-devel@lfdr.de>; Mon, 21 Oct 2024 17:38:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.823715.1237761 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t2uUB-0004vV-Kc; Mon, 21 Oct 2024 15:38:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 823715.1237761; Mon, 21 Oct 2024 15:38:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t2uUB-0004sU-HD; Mon, 21 Oct 2024 15:38:23 +0000
Received: by outflank-mailman (input) for mailman id 823715;
 Mon, 21 Oct 2024 15:38:21 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=uLLp=RR=amd.com=ayan.kumar.halder@srs-se1.protection.inumbo.net>)
 id 1t2uU9-0004sM-T2
 for xen-devel@lists.xenproject.org; Mon, 21 Oct 2024 15:38:21 +0000
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2060b.outbound.protection.outlook.com
 [2a01:111:f403:2009::60b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7ecfe2b9-8fc2-11ef-99a3-01e77a169b0f;
 Mon, 21 Oct 2024 17:38:19 +0200 (CEST)
Received: from PH8PR12MB7326.namprd12.prod.outlook.com (2603:10b6:510:216::7)
 by DM4PR12MB8452.namprd12.prod.outlook.com (2603:10b6:8:184::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8069.29; Mon, 21 Oct
 2024 15:38:16 +0000
Received: from PH8PR12MB7326.namprd12.prod.outlook.com
 ([fe80::6d76:9c33:d230:8264]) by PH8PR12MB7326.namprd12.prod.outlook.com
 ([fe80::6d76:9c33:d230:8264%6]) with mapi id 15.20.8069.027; Mon, 21 Oct 2024
 15:38:16 +0000
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
X-Inumbo-ID: 7ecfe2b9-8fc2-11ef-99a3-01e77a169b0f
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dacL7WIEPgpJFuY2Jhncd2kL4IPw7yoEWPT080Poh3SIZ+UqwpGrNq55QdZeFHMiwOiR0FK7nvzUJd7+muQ2kKxu6QrrHph/klCMwe0eG8QzX6JagTTc6SMqpCqw+JTlkDtLqbIr4mpHLvbJAg0wCMja5sNstjr4jN/TMOcWG6hDVM3zC/wsqubQokTTdye5NqKKo7kOii9y7sRi/Ehh65X3j/ctnWmjjto0uB6lnGX5TmYSnEoElZOk1Yr9mn0dXo7+dd0Zk8Grtur5p3Ysgju3ZDRJT8OBIhbbrWmqk8821OH6QvwLA/9VMLDfoJbMMs7KOoKrZ+OD2LCckDSzRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FX6YhEdY+0Axj5TvJVj3Q7SUU4UyfU0JGkiPPwqbbM8=;
 b=RK+IgUX2ulhsZ4Pe6xEMFFVPbRTh0NdBw0vSIyvNLTeD+XnBb+rBpoSDHfA9NiNmFD66BkOy5Yn+kZnLgg4XUts9qVercmXp8yTrSTBk+096xn4hurSq2B0ENInDLBdDPqHp1BajC1iVmKl+5qrZvxT4SeZpvAKH112SCDsPFl85E93WP8Xt1efp8FvTrnMCOhqHcSQSd2A9cVu3CSffKj+VjlNJo+VuC6QuiaMQHfsKLnvMAXCNeU4G1vSBRJjjc/Of0gRBl1fv9xJQfrpxezfdALAwc7RS5MyHBAmsQhuDKzENEbny2X+MRTF2spFI6FpIcOObqjyCU4NKdwIDRQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FX6YhEdY+0Axj5TvJVj3Q7SUU4UyfU0JGkiPPwqbbM8=;
 b=zrBrE+19qoJrerJsdiIrnqfWEN926YVsYjUzjkmJ55FfTCANR4ublAupV7cGq5VXmFlEkvTGnfjkXbwQSjk+tqeW2CiT23wBfKBIzCvKWrGe0bfmDA+e2u+a2+MW2UGAQJf/vekc3TXk2xvuiTQg/15ZDJNyG80gbUQrsLc1hac=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Message-ID: <810ef39a-8af8-416d-bf42-e6b0eebd1f00@amd.com>
Date: Mon, 21 Oct 2024 16:38:11 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/6] xen/arm: Skip initializing the BSS section when it
 is empty
Content-Language: en-GB
To: Julien Grall <julien@xen.org>,
 Ayan Kumar Halder <ayan.kumar.halder@amd.com>, xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20241010140351.309922-1-ayan.kumar.halder@amd.com>
 <20241010140351.309922-2-ayan.kumar.halder@amd.com>
 <7ee1579b-f1e8-4dd4-8540-e6c0858c6999@xen.org>
 <f5b875e0-56e6-451d-a736-f2cc33cabae0@amd.com>
 <3ea2fdeb-faac-4766-800f-917ea8af1063@xen.org>
From: Ayan Kumar Halder <ayankuma@amd.com>
In-Reply-To: <3ea2fdeb-faac-4766-800f-917ea8af1063@xen.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P265CA0249.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:350::14) To PH8PR12MB7326.namprd12.prod.outlook.com
 (2603:10b6:510:216::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR12MB7326:EE_|DM4PR12MB8452:EE_
X-MS-Office365-Filtering-Correlation-Id: 320a935e-a07f-4cab-19d6-08dcf1e661a5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?RzltTWloYmhKNVRzUHVIWWgyWXBJZUlmTzdmQzNoQmJkNWJVUiszWGFydFdG?=
 =?utf-8?B?TUVuamZRWG84emZzUUNoM3RzK2dVRGFMdmRRNnowYVIyRnF2aGVSUzRCWE80?=
 =?utf-8?B?bmN3a3Y1Vjhrei94Q3ZYWHphNzAwdG9hd0Zad2creGVMKzRvZDR4MG9xTGIw?=
 =?utf-8?B?UDhCaVlBMSs4WDZzbjVyenlDbWlZN0kxR2E3NDg3UUtFMHpJdzkvRXl4K2FN?=
 =?utf-8?B?M200QmFVdVVFQWZJTzVUSGFKN2M4MmdDNUxTVldvakFNQmgwZUYyZjdPbjBZ?=
 =?utf-8?B?S0sxSUFFZW94ZVJ3OGw5ZDRQbEtBZlFneldvVzFhb090dnZnNDBYeG8zR09Q?=
 =?utf-8?B?dzhzcmM3eDYvMG0xT2REUTJyTUVnclVydnFlQUZDS3BxWUtMSEVXWmpiK24x?=
 =?utf-8?B?dUFaZkhCdmk3WkF6VWRtSXQvMmxtc0RCSFo1RlpKTmk0SXpLUHhIYk1penRk?=
 =?utf-8?B?ZkJ6QThMQmQzN3c5REFHQjVaYjhnMm5Ob1hPNzVOMjYwWEgxdEZYcVlsZTdH?=
 =?utf-8?B?Z2lsYUhMOXNzdFR6b3J4dDBwUVRaSjA1UzdYT1hCd1ZFdXFKM0dvMzBVcEs5?=
 =?utf-8?B?Mi9tQ1B0djRFTlNLeDcwaC84bzB5SnVXNGNHMS9Rc0hHNnlhbmRvK0VrTGtN?=
 =?utf-8?B?QndKbjBiK2I1TytudXE3TzArUGRrU0QwVWxhZE40WlNFbXhwYjUyRlhlUmFy?=
 =?utf-8?B?UE5PeG56c3lTaW8wNXQzMnRtK2pyeDY0QmtIOER6USsxWXQ2ZkJxZGYzdGhi?=
 =?utf-8?B?RE01S3M1dEpyWjBvb2RsVXoyRzJnK3l1TXUySHpROEVYTWdKcU5RbEhqL3Bm?=
 =?utf-8?B?MitSdHJ6dnNnUXFZd2UxQzNSVXFhS0FvWTk5MHVhVzdYdWQ2K1A4OTNmS1J5?=
 =?utf-8?B?cGY3dFFFcytYMm1EVjZZcncyZWNKZkhhdFcwb2x1OVJlblkzbU1PNHVrSk1E?=
 =?utf-8?B?THlaODZwaE9FTWVEWHR1MXlDU3pJcFB1RGJFM1JFSzdyS09TYVBra1YzVmxl?=
 =?utf-8?B?TnFjK1o2NCtnOVNveWg0cGpCbGRGWWtxbmxEUCtKUy9OVkE0YWIyNEtWcVZN?=
 =?utf-8?B?VHY1cG84Zm5VQVRzYXFaMUpqWFRnMkw2RE1GdGxlYUhkcTBiVW4zajJXbTlK?=
 =?utf-8?B?d0ZoSEN5SERlb2Jud21va2FEOC80dzVtaTQxekJKcGlxaWxwOXd6czdKNXFv?=
 =?utf-8?B?eXRybVh1Q0k3ZkNSR0NLOUQ1dEVZZnpFajdDSERoMWl1eTROaTR4dXE1VVRU?=
 =?utf-8?B?YTk2bHZqOXdaR0tVOWpxMWxTMC9Pdy92bEFPSDRwbTJLZCt4ZVVuR2haZGRx?=
 =?utf-8?B?WTRhNGpLKzkyR3N3a2VkQXVkVEV6VG5ySVJWNEpPVUJWYVkrRStCaEsyUDVs?=
 =?utf-8?B?bC80VWk1d1JKaVBnaEl3VmU1cHhlNVExTUNWZTF3N1JqdVpuRk9XTEdmdC9F?=
 =?utf-8?B?MkhMN05HZ0ZZZDVtZDJ3Vk5KR28vclNKN1RUVDU3OFhHTnYrQU9tVE52YWZN?=
 =?utf-8?B?KzEyaEdqdXBwTld2OUZuc1BYRnVjMUJmZW9OQ1d0cWc3VWtrdzRvd3A5SWJy?=
 =?utf-8?B?cjdlenYxQndOczRjT1ovL0R0UDN0MG9uKzZyYko1Q28zRHlvc2NhWjREZkZ0?=
 =?utf-8?B?RDliV2JWajlUdTNiNjBWend1VUZndlNOQkJlUzVpaWNsOEF3bUt3Y1gwWW1W?=
 =?utf-8?B?clhQWVBYZG9UTEJKVitsYkFpL2w1MGM3Rm1MVXdBSjdhTWs0bUJMRHlmZ0Fi?=
 =?utf-8?Q?NdjXO1RyF5cWDDmfYIa0or9eVk1m7ngW6bBATh6?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR12MB7326.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cHlMOEdMWkdjaFE0cVVtZWNxeUVDckRmdlhVbjJ3ZjBONkN1M0Rrd2g4Z0F0?=
 =?utf-8?B?WEZDL0tEWStCNnltemdLV0RyTHI0SURCV1ZaMnJkUjdoRnhNQ1kwMmhJSVc2?=
 =?utf-8?B?bGQvczBJYWM5Qndjamg4Vmtsb2RFdWtYUnlHM3RiT2FGeHh5QVY3Ni9RdFR3?=
 =?utf-8?B?OWF1VEdKazhhTXBFKzh3TjZtTFlaVXB0NGVRSlczalA2NjdJTXViQmUzY2tk?=
 =?utf-8?B?V0dHcUlBYnFGRUhqSEhYZGt2Q0VzMEdBdUtGVDl2ODJhMFZWUCtlUy9YWkk1?=
 =?utf-8?B?ZDVBS3IvaHVmUWhlb3RSbEZwR2R0MFcyd2lIT0xLT3oycUhLNTFpazZRM1dO?=
 =?utf-8?B?VW5IVVRYVG5nWWFaekpXZkJYV1pTYlZwalZZVHozNUtjWDBlQjl2V3Y5Ulds?=
 =?utf-8?B?NE5yMUVxVC9YQmRvU0VBenBQZ2ZtdkJCc3ExVmlDVFFDeStJWUhidkFJMHhK?=
 =?utf-8?B?RXFUb09kUGZWV2lNVUhkVkw5RTkzMHZoR3M4YmZ5b1FhZU1rK3JsdHk5ME4y?=
 =?utf-8?B?MnA4T3VkMFBGZUg4QUkxMC8rRFI3Qm93VnpqalFWQ3RkWEVDbE8rVEZ6OG12?=
 =?utf-8?B?YlpXZXMzR28yVXBRZGcxZ1BIcEgreEFheVp3ZHdhQWprOVhwZlVLR3dsWXM0?=
 =?utf-8?B?NnhSbHM5V0t4S1dXTUVwRjh5L09vZHBML2U2QUdiRU9uK20xS09PVlJXbDlN?=
 =?utf-8?B?YUQ2UHV0NmU0cVJ0T09NSGZwd1hvc3RJelN0NTFubFoyY1lSUExxSTlXbFlP?=
 =?utf-8?B?NFpEUUd4a2NzSFpEbnk1dlBVcU9uM0FqNmlScXNvV0s4eVMrc29VNzBSSDI0?=
 =?utf-8?B?NTNDMmo0SWNmS2hkQkJ3UXdzcnE0TnRRdDN2ZzUxRUcvYmdjZ3pLN0Z0L1ZX?=
 =?utf-8?B?ektBTjFOMHZGcHh1UUR2dTg0RUk4RUlIVVl6YTZObEx5anpVeTBxNVJUb3U4?=
 =?utf-8?B?QUdZR3pKNVZWRzFNYzI3cjhXdDhQR0pnN0ZnNEdjRjFhTGZDL2cxK1cySk5L?=
 =?utf-8?B?VXIrblhEdG9iL3FnNThGR3d0UGo2MHdPQndieUJBL0ozVVB6QnVlMWR1VFE0?=
 =?utf-8?B?dTlxOGZsbGx3bHQwU0JFRmNQSUZiV3pnUmpPTjJ0N1N4Mk4zWGN1b08zR1FF?=
 =?utf-8?B?bmVyUnlSK3R3UUJkZnZBVjBZdG4wdGE0RkNzcWkrS25nQ2lLM1NQOC9SM1di?=
 =?utf-8?B?b3lCYURJUUxrZ0FaSXlYSkUxSDc3NmViM1pMYXR0dUE1dmF4ZkhMbkY0UFlU?=
 =?utf-8?B?VGNJNE9Zak1EcVpDZFlxMVJEUmo5anM3VTFUbWxuVTJieXhnVXBnS3VCQmx5?=
 =?utf-8?B?TUNKdlc1bVdnelgvbmNiSjN0QnlLMVVJR003bk1YWS9BMTZRNlFNVmh4UDZG?=
 =?utf-8?B?eEs2VnlwSHJBRDBzcXVZTVNNYVJjZUVYRHNOeFdRZWR6MkE0RWc4Z3FqSEJY?=
 =?utf-8?B?a3NYM1R4SVBDSkxsTHNnRWIzN2IxQ0lENEw0a09nZEFhN2JGTXBRbnhmMjZs?=
 =?utf-8?B?cy9yUEVacXQ1U2NqdG50VFVCUUhTK1NLaWhwZEJmTjArSG5YLytIek1MWU9j?=
 =?utf-8?B?cGkxcWpnUGFsQ1FxcG5LbnZjd3kvZDdteGZnSUpoWjA0RkNPOXBhNkgvYXNl?=
 =?utf-8?B?SjcxaUdwN2tYdnZNTnpyeHJ4bDloclMyaTlTZUc1Y1dpOWRFanQrcmN5dCtu?=
 =?utf-8?B?R2xZM3hwMHM4Nk8xWnRGVG9EaGM1ZWV2UTJRWVVIUE1HL3lNNUJ5akpXT0pH?=
 =?utf-8?B?TmoyaFNkcmhreS9IUm9CNUFFVUFYdDhRd2swVEhBakRaZUlCYzZoWEFzaDNC?=
 =?utf-8?B?a2JabE4vdzJsRk9ySjIyNjRXUzMvZkgvMXJHS0h5ejZBT0ZOeWJnT1l2RVpY?=
 =?utf-8?B?cnptakEydGUwTUtBaCt5WlN5QTJiUURBV0czM0dpVE5HUUxnYnY1UWdveUZQ?=
 =?utf-8?B?aVVlVVVzb2RoWThEZFF4T2wxWE5DQVRDUnQwNHRxTS9XL3pBZm40RkdxN2JI?=
 =?utf-8?B?cFNYREQ3MlRMMUxKZWgzdTRtQmtvWllJVXY2MVVVbVB0WTc1N2xIdFN3RXBa?=
 =?utf-8?B?V1RENit0R3piUUtaMWN5TklmcEdZb1pMME5GNzloWUJEd2FRV1FCOUY0ZndD?=
 =?utf-8?Q?OVsZr1/LVXukeF3K20VeOk9+P?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 320a935e-a07f-4cab-19d6-08dcf1e661a5
X-MS-Exchange-CrossTenant-AuthSource: PH8PR12MB7326.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Oct 2024 15:38:16.5228
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4uGWuKCwnzkLArVJpcOEsOfj310m881fqhhhVurODmktj/KCgf6rutAbnwY3T8O4xAGJi2/DwbEn+h/MY55bew==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB8452


On 21/10/2024 16:24, Julien Grall wrote:
> Hi Ayan,
Hi Julien,
>
> On 21/10/2024 12:12, Ayan Kumar Halder wrote:
>>
>> On 18/10/2024 14:41, Julien Grall wrote:
>>> Hi Ayan,
>> Hi Julien,
>>>
>>> On 10/10/2024 15:03, Ayan Kumar Halder wrote:
>>>> If the BSS section is empty, then the function can just return.
>>>
>>> This is more than "can", right? If we don't do it, we will end up to 
>>> zero outside of BSS. This could be critical data...
>> s/can just/should
>>>
>>> Also, I am tempted to suggest to add a Fixes tag because even if it 
>>> is unlikely BSS will be zero in the current Xen, it is also not 
>>> unlikely.
>>>
>>> The tag would be:
>>>
>>> Fixes: dac84b66cc9a ("xen: arm64: initial build + config changes, 
>>> start of day code")
>> Ack.
>>>
>>>>
>>>> Signed-off-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
>>>
>>> I saw the discussion. I don't have a strong opinion on the exact 
>>> approach choosen for zeroing. With the commit message updated:
>>>
>>> Acked-by: Julien Grall <jgrall@amazon.com>
>>
>> I propose that this patch to be committed. The changes to the commit 
>> message can be done on commit.
>>
>>>
>>>> ---
>>>> Changes from :-
>>>>
>>>> v1..v2 - New patch introduced in v3.
>>>>
>>>>   xen/arch/arm/arm64/head.S | 2 ++
>>>
>>> Don't we need a similar change on the arm32 code?
>>
>> I haven't looked at the arm32 code. My idea is to get the earlyboot 
>> (ie the asm part) of Xen working on R82 and then do the similar 
>> changes for R52 (ie arm32).
>
> AFAIU, this change is not related to the MPU. So I would rather prefer 
> if we keep this change in sync. I am happy to send a patch for it if 
> you don't have time.

No worries, I can do it.

I will include the arm32 changes in this patch. So that we have a single 
patch covering the issue for both arm64 and arm32.

- Ayan


