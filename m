Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 200F74B491B
	for <lists+xen-devel@lfdr.de>; Mon, 14 Feb 2022 11:33:11 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.271378.465788 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nJYet-0007a1-01; Mon, 14 Feb 2022 10:32:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 271378.465788; Mon, 14 Feb 2022 10:32:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nJYes-0007Wq-SG; Mon, 14 Feb 2022 10:32:38 +0000
Received: by outflank-mailman (input) for mailman id 271378;
 Mon, 14 Feb 2022 10:32:37 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=KkXt=S5=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nJYer-0007Wk-LO
 for xen-devel@lists.xenproject.org; Mon, 14 Feb 2022 10:32:37 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6d04eef2-8d81-11ec-8eb8-a37418f5ba1a;
 Mon, 14 Feb 2022 11:32:36 +0100 (CET)
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04lp2055.outbound.protection.outlook.com [104.47.12.55]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-31-qlTSl-meOzaVxqDn54pwGw-1; Mon, 14 Feb 2022 11:32:35 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by AM6PR04MB5031.eurprd04.prod.outlook.com (2603:10a6:20b:f::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4975.15; Mon, 14 Feb
 2022 10:32:33 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::d479:b728:345c:bd65]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::d479:b728:345c:bd65%5]) with mapi id 15.20.4975.015; Mon, 14 Feb 2022
 10:32:33 +0000
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
X-Inumbo-ID: 6d04eef2-8d81-11ec-8eb8-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1644834756;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=CdbRabmxR5P8EhWmmPZ2BUPcRqpFsvxGmQkBSq8dR6M=;
	b=CfF/H1MbM+rHuYbrNyS2O4bk6VoYeRE/KwL+V7JxYHPY8kOrcO13OwziiwJph8wdpG6sZf
	d5yRYLl0Rg7PHWOP8Jz3scNG04GGrsTM9kIbar95Tu8x9VRj3W+6lX5urLCADwX6pAZQ5U
	rycegmT7BMb+ef/WE3RD5r+3n1hQCsc=
X-MC-Unique: qlTSl-meOzaVxqDn54pwGw-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UqVhylEPq942nvM+VhEee8yik3B0Magxzd5MHkHFBxvguy67FVlkEJCRGU2tQafNHNv2klN8lVEE1oPAybs8HzvhHojECs/dGJramBiVWDasnLOZegK24Q075Yn6A2KSAqAnCu76VqdycuOCGVMd96i2QqJEy2t0yu3luc/jzqtj8GMw87LOxvysIM1sWrIYDQDJnjQNRgPX1uCln1HmBqFzzAOqUyFvuWA9obOzW79IM1k0LWIQ7KHcRnbrmqLAtadYZ0VaqbJxCDEW+omY65fRw2YRehcKdxz81i7Cf2S0mKGV4k9w6JJb+Rdeh6BIYhd7IAa4MnqTZ4bu8HI/tA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CdbRabmxR5P8EhWmmPZ2BUPcRqpFsvxGmQkBSq8dR6M=;
 b=g8ru2jAMPHNFxL8aToPekHzlDJ5zuugJBZSc+HMX0G9TrVcRbF/IhVeHZBB/lvsGgFs2DqBgWVI2qEi1wgQwm76Ct1a1f0lWEY9FbLI9Ah5bTBTJVeQ2mlbLgh4vkKodfGwRgpUSFcqinsEhroYXq2cNo4v46WX/Zp70gKqTXe6Fvl9lI2GLmDaUVGikqtx33sEkM1gJyJ/RkJlJdyUTwT2U8SKDDo9UtAQe14XFyDX1xsgPatBxRntWuOc0BF/bg+62i5chAxpDMkPRBH8PWB8F8jW35d470UBw93YBlYxxSjDWB7ALjJcU1JNwy91pkk3aZTwD2wI7SEMGTgV4og==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <7a71b56d-1f28-e0df-c89e-6fb69ff64dcd@suse.com>
Date: Mon, 14 Feb 2022 11:32:31 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.0
Subject: Re: tools backports
Content-Language: en-US
To: Andrew Cooper <Andrew.Cooper3@citrix.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Anthony Perard <anthony.perard@citrix.com>
References: <710fd687-16d5-c088-d3be-749851e6eab3@suse.com>
 <6f3157af-6ab7-ae67-0080-48754d41c19f@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <6f3157af-6ab7-ae67-0080-48754d41c19f@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM6P191CA0077.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:209:8a::18) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a7d73a1e-6e9a-4447-621a-08d9efa54fa7
X-MS-TrafficTypeDiagnostic: AM6PR04MB5031:EE_
X-Microsoft-Antispam-PRVS:
	<AM6PR04MB5031FB983A6A14B50275F0FDB3339@AM6PR04MB5031.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	LTMDS8wZcy0sbfeH0PpQsLmwD0DbN0EBmQuQUqxmhIVmMIBTahw5RuK+E7woHlaZON0/J3tSMf4HRK1MyoGBxSliOfj+4ttEOG+VZgPZk1CLw2MAm9A6/sQMQSYvn0pSH9XNOV3dt42rS/6AAzL7pR9W8mhXrMw0HaT7tvh73fB/7zwVJQKe0v/Pfr9tjoWXuCcvDJ+z+GfE7Ss9lz5Y9juWqnNk5yCNqFZcBvzL1YEUFJIwrSjT4elY7/bpPIFgf26G8+up40UBVkpqs3euZO0D/6d3OK0HBsgqUWgOMtMRU0Cnzseee5giOLe4+PFMpBhiZ63sinCm9JZCLUrUqDYO55jJ3a3WmL9u8X1ANGoFbBI8jw8S4Htn51Ww0k7jpwWpWScxdmlvGc7D7229vzilltmXxt9vQjuqs2FM1sUFWP0Z6BjhPc8wr5MtW04tx9F7X3Rv4TpZWnP04zhokIMQ95TfPFzGN9XDoKGW4eI5tCV66WnLlgX/AasfGKfDeRzwUPjx1jHE4ec659Id4Oq9ONF+tINShOYnfUE+CvYUt5anuGbwXUQtUmTepwMJUn3lrpLlENoTOCgMfCXZkz5MNTQsb8nRQHDmnYynxxLcsnPK5BJai459ARyhx6IJ20iqrQU42BNJ+hZBLTo7LbMz8opcZjrChD8RJd+zOdloNabVdGamqN9JtguBOxJvdoP+vzF2/Yn5Yf33pZaclzRpDEV/Dj5MWen2CM1Q/aFc3YSDpcM98aAv4SA5eIfN
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(26005)(186003)(6486002)(6512007)(8936002)(53546011)(6506007)(508600001)(5660300002)(36756003)(2616005)(31696002)(31686004)(3480700007)(8676002)(316002)(2906002)(66946007)(54906003)(86362001)(4744005)(7116003)(6916009)(38100700002)(66476007)(66556008)(4326008)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?d0ZtbG40RWpYWFN6WGVRYkNBQzRvS08ycVE3S213d1hCNThlNG1XWkZpcEV3?=
 =?utf-8?B?S21rbnROZ3d1YldDVU9XYUUza3dnTDZOQzJsdUZWeXlXSHBHeHBkc2tHU1I2?=
 =?utf-8?B?VDZKbXdLa2Z2ZjJvMG8xeXUzNWEvVXJaMVhGUm9LR3k5eDhselQreFdZZmRm?=
 =?utf-8?B?VE4yZjlNRWFwZTNZQ0JUc2FmYWJONmFSaXJOU1d6QzRteWttSTJTaWM0MzJv?=
 =?utf-8?B?bm1xMjZKTGFZR040M1RwWG1ad2xYeFBsVFZGbkpTcXBKdTdqa3JiVm5tOUp0?=
 =?utf-8?B?aElUWktzMVpQR09wWUJCK3ZWSitjWHJmVmdRREQ4OFZIMTVxR1JMTDJZNkcz?=
 =?utf-8?B?L1VkSnE2RHV6Vkw1S3ZVOWtOSEt4MTVpY09YcSthTytiejBmanpHb0VOLzZu?=
 =?utf-8?B?OXBIZXFjVE54ZEU0TFFTS0hMaTZzbUhMbXdCelh4T1lEMUV6NU56eUI2aldv?=
 =?utf-8?B?VkU5em53R1hzS1dSTmdxYm84YWdPUU9RdzlrWitHQTM0eHpFbjk0Mi8reVFp?=
 =?utf-8?B?bGVqcW11dXFuK3h3aVhQV1F1bExoWllacHJhKzBoYU8vM2JsMURycVJmZmtk?=
 =?utf-8?B?NDRyNHFyeXIrNDdNR0ZOMHVpTGViRlZ1b3ZUdG1qbGlkQ2RkL1NJRkc5RG9P?=
 =?utf-8?B?YUdsM2x3Rzl5cmkwMnorNnpCL1k3MDRzRHByRkNKUG1Sd3Bmd3dmYWVjdHZN?=
 =?utf-8?B?REhVdVFPZklWNW5VODhJRHlyM1NWalp0cG9PRW0wOXlTYVFlZVU0UUE0Nnlp?=
 =?utf-8?B?cXkzTU1KNDBYVWZJUnA3bDN2eHdIcytCTGgrZDhIa3BKVDFBMi82L0dsQXRx?=
 =?utf-8?B?ZlZuSlMrMkU2YmF3STZ4UjZFaWlIL3NLZXpyQ0M0K1dmeUM1NFg3N0tEUFF5?=
 =?utf-8?B?TGRCSWtVT010eEk4cmJmY0tUdE5OdVQ3TnNTWGdXL2FpUlJiclloNm1RTVJI?=
 =?utf-8?B?eENsRGxNNTBEeWd4VnMvZlQ0S0hraEJXZW1wejdjOEpSMXoxVzN2WkVFME5k?=
 =?utf-8?B?R1RqUFJDd1FVYnNvbWZYSFVWVmp4L0pId3R0ZFE1UnhldDc4MHNDU2Z3aFRh?=
 =?utf-8?B?TkNKNVI5L00yY3h3YUFKamFubEc5d3ZGRUcrQTl1RmFTTEpYUzEyd3k1RXFD?=
 =?utf-8?B?WXFaT05xYmp6Q0ZNRHNRWGE0a0kveTJyK1hTTEd4QmR1QitjTW43bFpidzRT?=
 =?utf-8?B?TS9ubVJwMVBJUVNhbmYybDl5WnZzQkNCTXh4eVU0NkxSK003SDhsc1RndCtj?=
 =?utf-8?B?RHhQRlM0bVJzSEpoMmxMZkZqcVZKV3I0b2JTZ3NmWmZyV2dBWkE0KzlaTm94?=
 =?utf-8?B?Z0c5NHRIcFNhNHpncEhBNDZ1U3EzalVmemVYSHpPY1B2ZU1zNTJreDJodFNy?=
 =?utf-8?B?YVVoaVJhNGpvVG5rSWVMb3lTNVJ2R1YyaktKbDhxNVZVVkJOMjEveHpaaWNp?=
 =?utf-8?B?M21YL3hUdVhXRjVONGkrNm43M29nZ09MUWF2aTBCRGdpTFNFazNEVGxYa28w?=
 =?utf-8?B?bjREQlkySlFoOVUvRjlTbGFOYlhGSWl5N0U1OG9oU0xmRHE4V2xDcGdUTzFy?=
 =?utf-8?B?ZlRqbmZWWFNLUW1aS1p0WHUzWU1VOHptS2x4RmV2NXgrbmpnemU5N3lFTE5E?=
 =?utf-8?B?Y09YbGFIQnBGRkg2UGIxTVF6UTRGM1dKcVJISEd0U1Rmdk55OGl0T2drSEQx?=
 =?utf-8?B?SnUrMGZsRnpRc2F2b1BDKzRlZHNubVRQeDBDaTI4RzRVSnBwZGRodXNCazNE?=
 =?utf-8?B?dHEzbnFmZVh3VG9EYTdWTWdFamNLOFFXZEVLL3JKSjJrMlpqOGFLd2tPd1NE?=
 =?utf-8?B?cjdOQXE2VkcwN01QWDVTdG16aTNTVk8zYmx0UUhNeXBESHhveGY4anlGeFFE?=
 =?utf-8?B?NFkrQ0RQaXROM3NTN2JTZ2R1MDMzZGVXL2ljUFU1Mm54ZHo2MWxGck5xMkdL?=
 =?utf-8?B?Q0grRzhEVjl3VWxXSDQrOUorRFBOdlBMalZNei9YMFRrMjFQWGtNWjU3SVdt?=
 =?utf-8?B?MTN6d3krNm16U3VGMGpFZjhIYVhDVVh6cndvdjdkSzREVDk1UXRmQlJMSUJ2?=
 =?utf-8?B?Vm5oV0lqeUp6VEtZNnUraGtKL1VpeUJCZCtTUDM2ZUxic0lQb2hKSlA4TGhx?=
 =?utf-8?B?TlltWWNOVXc2NGRyKzRlVUlzbklNNW5VQ3FiZy9wY2JudStlRFJGMU9BYjRY?=
 =?utf-8?Q?Npq6CuSBrOS3gTSvodtKdWI=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a7d73a1e-6e9a-4447-621a-08d9efa54fa7
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Feb 2022 10:32:33.6366
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gW24tfmSkphLuS1zUCEm+LEEW52pvpzVfoeU5ColMppffn2zx67oXKGmBzFf/ZWNsBs2jV1rMCaiRN2bztJ8HQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR04MB5031

On 14.02.2022 11:21, Andrew Cooper wrote:
> On 14/02/2022 10:18, Jan Beulich wrote:
>> I have a couple of simple tool stack backports queued, which - with your
>> agreement - I would want to put onto the stable tree whenever I get
>> around to applying the next batch of backports:
>>
>> d9d3496e817a tools/libs/light: don't touch nr_vcpus_out if listing vcpus and returning NULL
>> e62cc29f9b6c tools/libs: Fix build dependencies
>>
>> For 4.15 additionally
>>
>> dd6c062a7a4a tools/libxl: Correctly align the ACPI tables
> 
> c76cfada1cfad0 "tools/libacpi: Use 64-byte alignment for FACS" too,
> which was the underlying bug.

Well, yes, that one is already in 4.15.2.

Jan


