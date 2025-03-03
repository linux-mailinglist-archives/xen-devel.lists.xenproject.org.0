Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ADE13A4BBDC
	for <lists+xen-devel@lfdr.de>; Mon,  3 Mar 2025 11:17:46 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.900125.1308048 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tp2rg-0003Y6-Dn; Mon, 03 Mar 2025 10:17:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 900125.1308048; Mon, 03 Mar 2025 10:17:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tp2rg-0003VH-AT; Mon, 03 Mar 2025 10:17:36 +0000
Received: by outflank-mailman (input) for mailman id 900125;
 Mon, 03 Mar 2025 10:17:35 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Kv9T=VW=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1tp2rf-000393-9r
 for xen-devel@lists.xenproject.org; Mon, 03 Mar 2025 10:17:35 +0000
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on20631.outbound.protection.outlook.com
 [2a01:111:f403:2416::631])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b88b76c0-f818-11ef-9ab2-95dc52dad729;
 Mon, 03 Mar 2025 11:17:34 +0100 (CET)
Received: from BN9PR12MB5273.namprd12.prod.outlook.com (2603:10b6:408:11e::22)
 by DS0PR12MB6461.namprd12.prod.outlook.com (2603:10b6:8:c7::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8489.21; Mon, 3 Mar
 2025 10:17:30 +0000
Received: from BN9PR12MB5273.namprd12.prod.outlook.com
 ([fe80::cf66:58ab:47be:4b13]) by BN9PR12MB5273.namprd12.prod.outlook.com
 ([fe80::cf66:58ab:47be:4b13%6]) with mapi id 15.20.8489.025; Mon, 3 Mar 2025
 10:17:30 +0000
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
X-Inumbo-ID: b88b76c0-f818-11ef-9ab2-95dc52dad729
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ON6qeQbp2r8/rV1BNVxdYndceZArNxOCqaczz94r/8bbXw360imrktqYkdiDbP4RFK0VC7JUWiXfTUniYv9mIpVeXnO6t/7XsPpvueqvbIJATVjXoCF9oeJNHfuR8Lvj3oQJUvECocosAAOgUwbVJtxDfFULD9Sakk19pEZRC7SzO61XVvtD8Fkbjz4nnxEydrFvqvsYE7uOyYwvUDqGC+ymm0S+kcEUt1+Sp2gG4necS6vECdgBQQd9AMtUSePR8M9RrkuDfQ9xY8XWas5tdUZgUROpp6F3BmqTB1MqvNsnGWikkM8RlsSZV+TqqcnVXHaxlwxkNAkRCRl1GhTKnQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tjnPGx+SW6SUeYSsfWN613+7fjuP7Vcfl9cO3fwRNN0=;
 b=YWuzV722qUtZGYwHgeOqSHhMhKoxxKF2Y2dLZdeUJGx0aiHCfc2MzMFz5NjRdWKMxyQzqUv28t26kpb8gVs15El7MPffAtOo0ksk08wEfg5RaU+vmbgg+IKgAmG2LyzUkLaF/er5Oir00qDNe7XRm9sDLOV1SNe/qm6bKJ7mdiC71ghrrgmUzb10i7cBewnxJouSvIrdBVKyELS+LJewXXRUFEFQwk7lfVs+85OQ5c1P/HimZObrnneFnW6KCUJHxpa7fiUf4+hKCwv9PYPaIe1WrmCiW/kFMOh3ZMETfskRvCie/QtJS9kY4H7Wfl/B5YFNHTbVrV7Qr+ZefPbYPg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tjnPGx+SW6SUeYSsfWN613+7fjuP7Vcfl9cO3fwRNN0=;
 b=Gek5QmIne/bZlyg6p7UrB6AHsN5Vu1i7k2tm6HE+OOdqdbSkWYR2yqzgiEblU9TRl9UwOCGJew3ZQ6wW9W91XJi5y0uKYPu7n2FAnJhardWVLEH088xazMW6u3d5bqYbRdrLImMQ7wRXqv2rO+1G3+xCiBqOdyaRevyFbJrmRv8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Message-ID: <3c84bece-9d18-47db-ba96-f4aa8b14066f@amd.com>
Date: Mon, 3 Mar 2025 11:17:26 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen/arm: Fix platforms Kconfig indent
To: Bertrand Marquis <Bertrand.Marquis@arm.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <449a9f85d07aca65f607944c4bdab850760c9445.1740996436.git.bertrand.marquis@arm.com>
 <91efefb1-11e3-41d2-a098-3124cef6578e@amd.com>
 <14E001BC-6308-4F6A-BFBB-D6FD71883A07@arm.com>
From: "Orzel, Michal" <michal.orzel@amd.com>
Content-Language: en-US
In-Reply-To: <14E001BC-6308-4F6A-BFBB-D6FD71883A07@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0137.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9e::12) To BN9PR12MB5273.namprd12.prod.outlook.com
 (2603:10b6:408:11e::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR12MB5273:EE_|DS0PR12MB6461:EE_
X-MS-Office365-Filtering-Correlation-Id: 91522ac1-02ad-408c-f9b9-08dd5a3c9b3d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?V0xVakNKTWpGWEZhbE90L0tyc3pwbmhtdk50QTVNdHlkT08wcEU3bzRzZWR1?=
 =?utf-8?B?cmtXenVuQjRrMTFBaHFiTzdXcFhSTmRRRjVYbVZxY0xIZTZBME9RUDZ0M2Rs?=
 =?utf-8?B?S0JOd0NSc3JYVERDbjhLa2RGa2dTeHZZVFFnRnJtdVpGL1FXVTJ3cDFTaGRB?=
 =?utf-8?B?WlZzaVMzMHY5WS9TNVFJRjhVaHZYMHNVRGo3TXJJaWIxMzNHSVdNY2FUV1Vw?=
 =?utf-8?B?dEYrTkMvdnBTLzhEYXpCTS9uYXVDR0ljTCthQ1J6TU1qUDZXalNmcGFCUDhI?=
 =?utf-8?B?ZzNTY3VzVklsVmJCYkNpbzJNblBJbXNHRGdZTlhSZnZFbmdMdDVOaGoxTGhO?=
 =?utf-8?B?eGhpaDFtd1ZqUk11d1dMVDdaMTlMblpSU1YxeHdsRkZtV0MzSmZpamJBTTZv?=
 =?utf-8?B?cGxPbGwyK1hOb3FpajRvQ0k2MDFQV0EyZFlXVDdiN3RLOGZWYy8zaUtsaWtI?=
 =?utf-8?B?VlJiWXkrdFVIcU1ZU2N5TUJMVFpNa1BlaDEwWC82NkJxdEpyYWRrK0dhYVBQ?=
 =?utf-8?B?cWUvZ003dEtxWi93cFJhaUlYQmxoUkFpb0pUcmdtZnJncmVCVnJjYURtNmkw?=
 =?utf-8?B?bHdlMFBzSFBNMHEwMm00MDhvemNZVE9CaCs1MEJEWmppNWliVTc5VG01Tjhv?=
 =?utf-8?B?bEVYOTZ5SVB1QUFPNTUzdEVsNDNuUlptMS81UDlCcnZZbkRiSkhFVGRVQ2FO?=
 =?utf-8?B?SUxYbUZHaFhvOXFvdkVmZ1FYL2lrcEhvQzBpMFRoN3VlbktIZ3BOemZtR3Qy?=
 =?utf-8?B?NnhZNW5LbkZYMGtQMkllL0NsT05NNVN5UXQweGpyRFdJaWF5ZlVaUGJiMjFr?=
 =?utf-8?B?NjRVSFdxN24xV2ZMaDRPQ0dIVEJmZG8zdTlKWFBSblR4cmtVL2plZ2NwR21j?=
 =?utf-8?B?MWhkUVRzYmlWQmgvQ3lyVHZua1pJNVRFelZBM2k1b1pqUEdSdWhjTFJmSUll?=
 =?utf-8?B?U1JLV08vN3IybE5zam5UaVcrdW5XUStORlpuMk1waUQ3RWVxOW9NTUV2NjFV?=
 =?utf-8?B?Z05EWUhsVk45Ukd5akJpRERka25MQkZFdEF6OStueVJjajZYRGYzYVBuVVJv?=
 =?utf-8?B?Ni9ZTWNZL2tldjYrUTR3NkNHRzdxemtUQ1VmTmZKVFFOVHZMNjA4eWFJbUxu?=
 =?utf-8?B?Y3JpNG9iLzQzSVNUQk5INjFMWjdNekNmM2lpeGQwazZiOVVjUWd0VThjODcv?=
 =?utf-8?B?bFUyeFJzY0ZMNWJPT1pYSzRnVHI1aUh5YXp4T25iNzJPaHlPQ2pPY1gvMEo3?=
 =?utf-8?B?bXh0ZFprcWZmUm9NOCs2VlRxWlJUaDdnaGlJeTNyUWo0THFJa2NRV3h2bDJG?=
 =?utf-8?B?cFFrZy9WTTArOThDdzBrZ214akJmTDlXV2dsaG44VE5xZDUyamN1dWZ6c3Vj?=
 =?utf-8?B?MXQ1RWF2SlBSSWgxQ1AwTzdSMDFFSWlhQzdHNi9aZnlaM2JhY3ErVjd5NnRY?=
 =?utf-8?B?VGxnZWlYbXlxMGhvWFBBcUFURlZqSGZjbUpMbFFEZGlJK1JMZTc4Nm5za01m?=
 =?utf-8?B?M1FtYlZlZjBHUEdGaWd0dCtoUzJEblhmaUpSeW9NODU5b2pqK05zL05ENVo3?=
 =?utf-8?B?ejBHbVNhRlI1bHEzQi9GMDFRRjUrSXhidGlLQmFtYndMYkwrdmoxbHcxK09y?=
 =?utf-8?B?eHlOZC9RZ3NVdC8xdEhxMEhOeGVRVEpzd1h2YkJxTlZEVkgrWFlZNEtPbGxn?=
 =?utf-8?B?anQ1K2R1QWtDUGRzNVBsaWJBZkh4dXBnbXU1dEZVK3ZBSGNyZ0tHTG5NbEdy?=
 =?utf-8?B?SENTUEQvSWw0TEdJOEw4YzdhSXFlOHRuM2ZJdzZWT3FiTVZsZUR5SmNxOE92?=
 =?utf-8?B?R3RaZzNVSkJlYTVYVXJMaUVEemNzcUJ5cXFlWUdNYnhaZkdINVUrbS9HQk5m?=
 =?utf-8?Q?wqno63HfjEFKh?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN9PR12MB5273.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?V1Fmc2dDNC9GMnhON2lqUVA5blQvN2ZEVzJTVUxtQ3JZUnExSVI5RmpFWnVa?=
 =?utf-8?B?aFNYc3R1ajVYSVZWUEw5bVI3QkdGaldCcXBLdXJLM1o1a01ZcnNoTTluRkN3?=
 =?utf-8?B?eXlpenBPVFVReDdIbkZFYXl2Wmg5dXFmd2JiQktwUlZQakc3SnVOdk5HbEtY?=
 =?utf-8?B?aG1CWGVEWm9WdXB5aFU0b05QZmFQYmZTc0VheWVrcWZralYvTGg0N0FkZlRX?=
 =?utf-8?B?YkJ5NHhPc3lXTXdPbHFWd0J1akNEVnlGTk1vUFVVbE83dmZOaGF5V2VuRUlt?=
 =?utf-8?B?YWxLd0ZieFh3bmVQT04zYlpSeGJYSTBhbzUwOWlBMEVvUzlGMUVyZlUzZFhM?=
 =?utf-8?B?cGNoSmthazJWZDl6Y2Y3OXdCZVZVckFFU2lodEJEaHRhZFM2U01Fb0FDMmFY?=
 =?utf-8?B?NS9RNGREeEFCUTlCNUE3SVNsVkVtN1laVjk1bEtQaEVwblJwcS9pSVNxdnZt?=
 =?utf-8?B?cXh4UkRjSUhuKzJZUFo1c0c4OHdyaGNtZ01VQ0k5RktKVnVDRVNBOTlMUURS?=
 =?utf-8?B?am5sUzRUekNKSlZ4UVpMN044VVM4cEVhNkQ4bzFYeXZ6alUxeGFRSXFDbGRH?=
 =?utf-8?B?ODV4bmZaTWUzMWp3S2lGbFE1dlNIRnhkdlc2bTdoZTVId2p1cU5pSDlBbU1C?=
 =?utf-8?B?Z3Nrc1JQVmlpMnoyNDc1cUc4MDNwcWJVN2IxWGdJa0d4L0xLTE9MdzR2bjJZ?=
 =?utf-8?B?eGVtS3Y5Y1BPWllEQkp6SjIraXB1WTYwYWczdS9zcEJUckpSUnI3SWtMWmhl?=
 =?utf-8?B?NWpCYnVHYndHdzlDb0hxQTdSbkdaVGZvY2xlVFNUM0F0YU9CNk1tN0gyZ2Iz?=
 =?utf-8?B?UmtkRDhOa1Y0dlJwUjgrV3BWSDVacVRRbk9XNU10YU9jUHVlaHRQVXQwYXNO?=
 =?utf-8?B?TTJWb0lJeHNMU3BGTkpxNWFIeTdsSHJDY0Rvc2FTaFBjZ1NHRlc5Zml4ei9P?=
 =?utf-8?B?Y2hiK285S1paSEhheWNWZ1ZPVDFVams5YzVVTGFNZklZVzdES3NEYzNCWlNJ?=
 =?utf-8?B?TmVMNU1OZWprOVpNNHNIQXZwbUt4cm9MbnpKZVhOZDY5T2FsMEZsekI0Tngx?=
 =?utf-8?B?OHVDdk42SDkrbkdDWG0wdDFZVHVrT3M1WnFGZE01S0xLaG9ROUd1ZjI0K0gw?=
 =?utf-8?B?d3ArM0VzSVZ2Z014UWh2UnR5c1drQ25yWXZqbno4aDEwNjdHOXpDMnl5WDYr?=
 =?utf-8?B?cUVWeDhCT3ZKaG1WVFdPVG14OE9hakpjMUF6QWd2c3NjUUs0d1o5WEpvTXhR?=
 =?utf-8?B?NDFCanoySEVtelNDcWlyVVNSemFCUWl2K1ZTTmhEWnlmVzZIMWN2ZHZvbUo3?=
 =?utf-8?B?Y2JDQ0UxdkkxUGNKZlc3WFduM29SNXIxS2xhZmplaFduR1hIRTFxR1ZJa1pN?=
 =?utf-8?B?RXVlcVpXVEFwZEJmbGlvYlNBMXZrN3QvRGQyaXhtZjVXWVNBMExudVhqNWkw?=
 =?utf-8?B?YzY5S251QldyRWwrelNzRDhreWErMXEvbmJZQlV6Z244ZWdoUnYzb2lNTCtC?=
 =?utf-8?B?cVBWdkk5cnNqNnYxRXdtaCtBelhZOE9qblFXZzNtZkowdkhXbFVubWhLeUEz?=
 =?utf-8?B?eWtBN3gwNHQ0LzJaZkxyWVNVUExpdTRHWm84T2lEbWVWUVFzekdWVTJMNDM4?=
 =?utf-8?B?QVhLQkxoeVZNbDBUWjdrMmJBMUJnajYzMEZjN2pydmpucVJKdkpadVllcTNP?=
 =?utf-8?B?OC94SnhiaFNvcjJtM1BQdXExazhEV0dOSkFaN3BYendta2kxTytBWW5jQXV5?=
 =?utf-8?B?WkpMb25qdG4vZFNRSmZZbjlKOHRTdWhmcW9JaWNxS0g2WUcwQWtMS2tySWd6?=
 =?utf-8?B?ZkM3cFF6b1AraFdPeTZCaWZMY0ZEWDh6Ujgyc1NLcmdKamdoa2V4a1B1TU5X?=
 =?utf-8?B?Sm5iSkFxMTA5NDRqV2dxYW5JN0JQdFNtdWo3Z29nQlVheklwbWpLQTlOVDA2?=
 =?utf-8?B?RWcxZ2dXdlZhWW1iMUFkZ0ZheUUvRmZJd3QzUysyWDh3ZGV6NC94UnIxR3Rn?=
 =?utf-8?B?cWZnUnpaSEI3eWwxWUpWeDhEbzdZZ04yT3BJMFhQTVlFdjRlUnRtSWFCWmNK?=
 =?utf-8?B?S0tCZ1JkcFV3cjgrTU55ZG5RellpditZRkhjRU54cVdBU1RrdUJmMGVERndB?=
 =?utf-8?Q?ebQY=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 91522ac1-02ad-408c-f9b9-08dd5a3c9b3d
X-MS-Exchange-CrossTenant-AuthSource: BN9PR12MB5273.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Mar 2025 10:17:30.7026
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Fj5DrDFaRy8+Rr+JsoQsr/Yd9xD7/+8lcPurk6LTaqWzi0gjqWnPY7bitrlj5JPN
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB6461



On 03/03/2025 11:15, Bertrand Marquis wrote:
> 
> 
> Hi Michal,
> 
>> On 3 Mar 2025, at 11:13, Orzel, Michal <Michal.Orzel@amd.com> wrote:
>>
>>
>>
>> On 03/03/2025 11:08, Bertrand Marquis wrote:
>>>
>>>
>>> Fix platforms/Kconfig help indent to respect the standard (tab + 2
>>> spaces).
>>>
>>> Signed-off-by: Bertrand Marquis <bertrand.marquis@arm.com>
>> Reviewed-by: Michal Orzel <michal.orzel@amd.com>
>>
>> Do you plan to fix also arch/arm/Kconfig.debug? You could squeeze it in this
>> patch as well :)
> 
> This one was in my stack of stuff to push after the release.
> Happy to also fix Kconfig.debug to.
> I will push a v2 with Kconfig.debug
Thank you very much. Feel free to retain the Rb tag.

~Michal


