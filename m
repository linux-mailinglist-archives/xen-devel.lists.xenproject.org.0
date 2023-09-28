Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 642BC7B2526
	for <lists+xen-devel@lfdr.de>; Thu, 28 Sep 2023 20:21:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.610015.949228 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qlvcl-000763-9T; Thu, 28 Sep 2023 18:20:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 610015.949228; Thu, 28 Sep 2023 18:20:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qlvcl-00073i-5r; Thu, 28 Sep 2023 18:20:31 +0000
Received: by outflank-mailman (input) for mailman id 610015;
 Thu, 28 Sep 2023 18:20:30 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=baK2=FM=amd.com=ayan.kumar.halder@srs-se1.protection.inumbo.net>)
 id 1qlvcj-00073J-S3
 for xen-devel@lists.xenproject.org; Thu, 28 Sep 2023 18:20:30 +0000
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on20621.outbound.protection.outlook.com
 [2a01:111:f400:7e8a::621])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b2413822-5e2b-11ee-9b0d-b553b5be7939;
 Thu, 28 Sep 2023 20:20:27 +0200 (CEST)
Received: from SN6PR12MB2621.namprd12.prod.outlook.com (2603:10b6:805:73::15)
 by SN7PR12MB8146.namprd12.prod.outlook.com (2603:10b6:806:323::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6792.28; Thu, 28 Sep
 2023 18:20:22 +0000
Received: from SN6PR12MB2621.namprd12.prod.outlook.com
 ([fe80::5a5a:18dd:4832:75db]) by SN6PR12MB2621.namprd12.prod.outlook.com
 ([fe80::5a5a:18dd:4832:75db%4]) with mapi id 15.20.6813.027; Thu, 28 Sep 2023
 18:20:21 +0000
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
X-Inumbo-ID: b2413822-5e2b-11ee-9b0d-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aaMxakZPjZu7MizOPqYFBufsZeOhnQw9MFNoM6Z832nTU9Yec2zw8ZtvKlB+aMuEfX30A9DI5Hx+wWBnN3kkoH3G9LM9YverKsVvE+CGgKRupdUii5I8YX0naxKiYQfRTrgezns2JwVx89px/eTeH1pwV5DBW91PzBn3Q3m1wcx48DJL9R9hGbPYdH0S5/FTinwLhXwguuaceYV7Pnlg0sAbkYoil1p96VY1T1KHzQC8QJ2MkOWoyTSwJnyPB1LQzR+74zD/6KgIIvF1/hVuoaWBr9zbkkJlRznvrVTluR5kw/itV2BzPB01bqIdXUehZoB7ObqUvBq2C5u/+2RCWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ugrOY89PIWfa9NXUFzEQkr8whd/Ny5XGFm/32b9VS0s=;
 b=d030f8sxF6eL4ujR6ZPTZf7rnCOthgab75jFg2a1/5NpA6SXxqS/ZJl381/Yy+UCaVVnMtq6LL50xqTPXkQAASGgodIZAw2xb/GBmxEo378y6KUyh1R1WHb5H/fOHY+toGdL2FQdugVZggYVXCLR/MVW2s1oOxBBHtft8hj8k7sPFVhwOZMSrivMOH07qzfZChZy/Jj2NXi+ji6wxFLc0A3kk+gjuUMkBHUVonhSKz8uXlB7lA8KoapY6Q+m4GQcJO52QLCukNtGYkljlPZAZJkudMYRnR48teE44fkpOkHXNGcMvBpycYXIuTuBgRAaFP2X4g5HKJo6anpIBatHAQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ugrOY89PIWfa9NXUFzEQkr8whd/Ny5XGFm/32b9VS0s=;
 b=KB5NH/hPvh7vIx/01bS73QQ/kgKKuNB4NH27JnPE+CLakRHP88BwY7ZFETdFU8/gFEkvnob4DHGlKanSrxpCZCTjd6gjHtXyS5G6vfpGtqqt2xGa3l6gvTrum1Q2x9DLe/LcN0PRa7+0iEyrAk0W6FLr75nq7ZQ0NgHlAaNu7n0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Message-ID: <fff7c46c-78ea-4656-fcca-85667e176104@amd.com>
Date: Thu, 28 Sep 2023 19:20:14 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.15.1
Subject: Re: Misra rule 10.3 violations report script
To: Luca Fancellu <Luca.Fancellu@arm.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 "andrew.cooper3@citrix.com" <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Julien Grall <julien@xen.org>, Bertrand Marquis <Bertrand.Marquis@arm.com>
References: <D36FE722-43D5-4A93-B725-AD4157A1BA61@arm.com>
From: Ayan Kumar Halder <ayankuma@amd.com>
In-Reply-To: <D36FE722-43D5-4A93-B725-AD4157A1BA61@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO6P123CA0054.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:310::11) To SN6PR12MB2621.namprd12.prod.outlook.com
 (2603:10b6:805:73::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN6PR12MB2621:EE_|SN7PR12MB8146:EE_
X-MS-Office365-Filtering-Correlation-Id: 79c745c7-ba3a-472c-121c-08dbc04f939a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	3mZsVpXAdHuWczaWAgS9tSMgLlZxHe94aeGdxLVkPL5uvPkLzAYefGnDc71/+ao0GlbHHT5j+AlHJxo2tI3iAa/cs2OBZeUKaETQx5Z6JF0dhC4JX0qVesTPVUMxypfMWhIkJ7Ay8cRlQSVpVcIU5iNiCglW7m1ZOu9gLkb91bSSzbYEbwuRSQQz40ExtnnbCLZQ7/J3agh1Yc2/xEtQryVTCh/5a/HGEphEppRTbCQVEkuOXKVu6s+f1zRD8pyLJhFX17w3c44UJ9se2NNbyXBbqHFDKdOf/dou16OmGflnf7DQ/LxlHm6L6iSMHsQnolVnqeA51E+SIJwOZw4d9d7P+J+duIcr6fpYSXq/25E5mGNThLeoRizRTz6qYeAnQc8vPdLyM2vB7mdsBLGGBhAVdhNCAjkZ8Noois2UrHU5bceQj/lXD966pu/1q0wdj3D9gweH9TFcl82h9HAMUvnVZQ8/+5mXGMj/DMlreYbBoU49+gY8PILwJKbF4ekvQaSHKMN7tzfIjVUMydS4/PNADTnepawFKiFvU4a8ce3P28ZlEEPY1THA1GiFyrEcQzx0uX/pDIYqRY970GnXAUZy2Ca7NTEyhKT991KDWQdBjB/zV/jy9iJRs00+5C9xeiBq5lHU0zq3Xn83RhP9xA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN6PR12MB2621.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(230922051799003)(1800799009)(451199024)(186009)(6512007)(6486002)(6506007)(53546011)(26005)(2616005)(8936002)(5660300002)(4326008)(8676002)(31696002)(2906002)(38100700002)(110136005)(36756003)(66556008)(66476007)(66946007)(54906003)(6666004)(966005)(508600001)(31686004)(83380400001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dngvSmEyMDUrT2tUekZwVmMzZ1lIcVc5dVlyUVduWTFFSTF5aDdtUzZQZ3FT?=
 =?utf-8?B?Wm5nenU1QnE5bmgwSmRxSTNpZVM3amlncERaU3hzMURqanNKbllQT0RIN2VC?=
 =?utf-8?B?OXl6QzE3U3M3ZllER2xRYTlrQU1RenRxRkZkWEMrSmIvNStKQjVMYVFucG9W?=
 =?utf-8?B?T2lpN2VpbGZSSFlQcW5PbWplQXJXaG5kekhyWm05dzBqd3M1OEtXQ0N4c2hu?=
 =?utf-8?B?c2ZwSVF3Q2lQREdMNEYySTl5dEVNOHlQcnBGNDhVNFRiWFpsTXdIK3kwdlh1?=
 =?utf-8?B?Sy9qNkZzUVV0K01KbFNBSUFHKzB5aDRFZTVyWC9PYVFSTCtuNVR5cHRUZ2cv?=
 =?utf-8?B?cTkxNWJCcE85L3c3OEh4MEd0YnprOHdHRTRVSW5YbHRqUGVxY2ZVVDIvbTZM?=
 =?utf-8?B?UlJ0UVR2M0UxeW9hRWFLeUU4TlYxblNRZGV1WFRueFlhZ0oyNHdKSnM4QUJs?=
 =?utf-8?B?djl0c2JTeW8zdTQ1VXBQMzg1THNsQWh0a2FBemtsODJMYmRVMnN6Lzk2c1dT?=
 =?utf-8?B?bUpidWRxRWVOVFVJMXY0WVdKNW0rUU5idllIM3JhTlNVTmRnc2lxYUxmakR0?=
 =?utf-8?B?MFlWY05Qd3d6WnNWMk54VEtUT3JiRGpST0trRDRWSlNuUlNxN3lsRWFENXBu?=
 =?utf-8?B?MGNQcjc1cHNSMjJONUNjM25yZTVFZGo2aFlrVTN6eEVoSkRLK0U0Q3h0dlpp?=
 =?utf-8?B?eXFRZ1lkNVN5MTR4QTFvNnBrWnMySW12VjBUQllaWWNMdXRYRDJZeGtZK0sy?=
 =?utf-8?B?SDFvbDUvM2JMOFVYOGVnVnVwczlNeWtra3NESUFydVBBcFRvZjExelNva2Fi?=
 =?utf-8?B?Z2NqNmFwMnhhMzJVbUxGOGR2Wjc0OGhUYTZZbjZLUDVoVlBPRnNKMDF3Nm5R?=
 =?utf-8?B?SzQ1TWJ4ZWJ6MUtOcWpBV0g5dHg3amdIc1Y0UmZSQU1yeHBjaXRCMXBJcjZS?=
 =?utf-8?B?R2RpVWFHbDROekVWQTY5bjBBUUpieGJDQXIzN05Lc0hGd25ZVTkyYzBFcEYz?=
 =?utf-8?B?Ny9uN0VBMGZXM3Nqa1cwdnFhZVhpWkRwK3dvNlMwTnZxR0x6VzdkMVNkajBV?=
 =?utf-8?B?SUlMMkFhUENvUHlmaGR4TjNFeDIyWkpoM0FEd3hhMmxRZERZYUdpcmZHVmxK?=
 =?utf-8?B?dXR1YVBnVTJBU2FOZnM4MUE1ZGdEQWdFM045YVRwSXJpamgrK2JtS3dCOEFj?=
 =?utf-8?B?OXVjd3E3ZGdVSnFrYkhkWXJVczBhRFdoT1NvbU94bFdJK2hhd1h2NEcvZC8x?=
 =?utf-8?B?anZtQ25IU1RyNVNaQVlZNHRzSEozYmNuN0pUbmRTWU1tWFo4RVNHNGNCZEEv?=
 =?utf-8?B?OWVVOUdKN1VjUUNMMWljWUxoakR6aCtmVVJoZkpUbStuNUxoS2tLLzg4RnJD?=
 =?utf-8?B?S3o0Uk5WVzk5MGdMSXRVekcweHZEMnlKUi9LRXYwZkVBTUtEcXZJMzIzM1F3?=
 =?utf-8?B?U2hPZUhzK0lpMU51cTRFdXl0R1l1T3M3aHJiWTluSzhpYWFXUFBuUkJ2REJz?=
 =?utf-8?B?YlptRjgwU1YxcUpjSUNwZkRtUDc3NFZ6S0JWcnVwenh6MVh2OFJPTVFFdHUx?=
 =?utf-8?B?RStGSkhhTG1NR2JLZlFDUm1BS21paXRiRlVHSlZjY0I1T1AvTk9BRVpHQTE2?=
 =?utf-8?B?TUZ1Y0o1c2xKYkhsa1ZvSWtQSGMyczhONDVZU25WMUg5Z2NLQy9oUVZqb3E4?=
 =?utf-8?B?WlRQUTEzNmFyeWRkMjdFTmtqMjBLcFk5VVNpTU85SDVjSWo1M2w2Qk5WbitW?=
 =?utf-8?B?RzFrNVp0cHFER1ZZOEhORHdPUmZHam1vMURTVzQyblZOUURVVllPaTFMYStk?=
 =?utf-8?B?ZUN2VkF0a00wZXAxVXI2Z2hRR2MwdnNKSlhUbTlkUEpEeGxwT0tValIxb1dG?=
 =?utf-8?B?Mit1NVI4UDNTMWUzQmltdXhvR2Z0T1pENElzVjA3Y1YyRFJTRExzU212cXJP?=
 =?utf-8?B?NmFKRU9rYXZrNXFwS3pZQkg4SERESGdUTm9pbFVHbTNZYXBRbzBNRlFCTEp1?=
 =?utf-8?B?RllrQjhUQzE5OVB6RXR6aDdVcktsam5vc0tVc2JQK1NOY3RvMmF3NXg4MmV5?=
 =?utf-8?B?Sy9tQ3hXZlFEWFF0V0t4d0paenIrZWlZQXdmclN5TTcwQmt1ZFdOYzYvY0pZ?=
 =?utf-8?Q?Cy+QDV2ETu4X7JQQvHvP5989N?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 79c745c7-ba3a-472c-121c-08dbc04f939a
X-MS-Exchange-CrossTenant-AuthSource: SN6PR12MB2621.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Sep 2023 18:20:21.6822
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GpLwOBH68sPL4QB0mUl3bBuJ+prgAebpDPVpgZ5bzHEVWWOiUj0loBH9Ow2i3iurV2ZD6VVG52uiIHdVWwKOBg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB8146


On 28/09/2023 09:34, Luca Fancellu wrote:
> CAUTION: This message has originated from an External Source. Please use proper judgment and caution when opening attachments, clicking links, or responding to this email.
>
>
> Hi all,
Hi Luca,
>
> In the last MISRA meeting Stefano told me about the Rule 10.3 and that we have a lot of violations,
> but GCC has a way to list them as written in rules.rst.
>
> So the issue was just that we have a lot of violations, most of them coming from headers and the
> Developer might feel a bit lost since the number is very high, so I’ve developed this script to take
> the GCC build log and create a list of unique occurrences of the violations sorted in descending
> order, so that who has a bit of time can try to fix some of those and maybe can start from the top
> of the list to fix as many as possible occurrences.
>
> I attach the script as patch file.

This is an excellent script to see the violations in a neat way. For eg, 
I see this

arch/arm/domain_build.c:3883:28 (1)
arch/arm/domain_build.c:3910:36 (1)
./include/xen/pfn.h:6:23 (1)
./include/xen/macros.h:4:40 (1)
arch/arm/setup.c:221:10 (1)
arch/arm/setup.c:227:59 (1)

I think once in a while, we have been approached by newbies wanting to 
contribute to Xen project.

For eg "Beginner looking to contribute to project in archived list"

Sometimes people reach out individually as well.

Do you have such similar tasks (like this) within or beyond the scope of 
MISRA which will require some basic programming skills and is a great 
first step to learn and contribute to Xen project ?

This can be things which students/folks can contribute on an ad-hoc basis.

I can work with Kelly to see if we can put them in a wiki page.

I could see https://wiki.xenproject.org/wiki/Outreach_Program_Projects , 
but don't know if it is up to date.

- Ayan

>
> Cheers,
> Luca
>

