Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B0967B1BC0
	for <lists+xen-devel@lfdr.de>; Thu, 28 Sep 2023 14:08:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.609578.948699 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qlpok-00063c-E2; Thu, 28 Sep 2023 12:08:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 609578.948699; Thu, 28 Sep 2023 12:08:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qlpok-000616-Ao; Thu, 28 Sep 2023 12:08:30 +0000
Received: by outflank-mailman (input) for mailman id 609578;
 Thu, 28 Sep 2023 12:08:28 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=baK2=FM=amd.com=ayan.kumar.halder@srs-se1.protection.inumbo.net>)
 id 1qlpoi-0005x7-TW
 for xen-devel@lists.xenproject.org; Thu, 28 Sep 2023 12:08:28 +0000
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on20628.outbound.protection.outlook.com
 [2a01:111:f400:7e89::628])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id bacb8720-5df7-11ee-878a-cb3800f73035;
 Thu, 28 Sep 2023 14:08:28 +0200 (CEST)
Received: from SN6PR12MB2621.namprd12.prod.outlook.com (2603:10b6:805:73::15)
 by SN7PR12MB7202.namprd12.prod.outlook.com (2603:10b6:806:2a9::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6813.28; Thu, 28 Sep
 2023 12:08:22 +0000
Received: from SN6PR12MB2621.namprd12.prod.outlook.com
 ([fe80::5a5a:18dd:4832:75db]) by SN6PR12MB2621.namprd12.prod.outlook.com
 ([fe80::5a5a:18dd:4832:75db%4]) with mapi id 15.20.6813.027; Thu, 28 Sep 2023
 12:08:22 +0000
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
X-Inumbo-ID: bacb8720-5df7-11ee-878a-cb3800f73035
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DIFE6dgB60Rtj5HQozgbre7byYLMQhS0iUDGK4Wk3vlobtHh9XzjYjG3ow41SUyFq9usO2lvYzVY9VPQzR5jOBaOlWI8iHTL94uQ7XT7Zn3KYIWxWNHK0E1M/NjZ94SjtTa2gZbNQkw2aD6dwmXO/QxzouST29dc9u2MVx2ZouqgVVtTHX68cin8KLeApwTSe+uvyUloGolXfqqsRL5v+mln6w2bhVRpCpgXL9I89H/F1weorZSBdAO8/Z80mr4ThKVyIuIyUDYCbi1jECOeMCPhyIGEGbO110v6Ylr3xGuQVWNT24ZDugaMcYWVyzEja06RFv9VXblfyaMvdNYhWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fe3NYOEuIOZwDAafggleyOdpQk6WXMnGNJeKTzyllKo=;
 b=ZY7HSTNxtkOiF0XCGFo46or9bj8MOJIIfD7nnuXNL5S4CKeceCQrB1AxNt4mL02n1hMBUTUDcl67Sa7he0klg12fyjlw/C8k6aVg2b0Nt9mE959SSu6QU7aVa4RrdB+9XdHWgiHX/SzjMnasTKJAVWqAn7tCmK4Rc4lKeKvvvexZBPSAGtzogxTudgdk7nw083u2vyfOC8/wrZFTIvQ2Biq5ZA4ng+aednbF6HK3ggJKMkQ2ssiM+EBH2m31gP6G3bUSj8U2/FxSOdCkHZmp3T1RyfD9l3FYXT0whBl/qlYEUJzPgGTO1JnJkYla+dWMLbdVjGhsvcN1WyDuPpHpbg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fe3NYOEuIOZwDAafggleyOdpQk6WXMnGNJeKTzyllKo=;
 b=Wybq/a1f4wbJifCANuENARjKJWGaYWIFoRtgLNkezOKCM22TpHwEO83OGxtyK2u1HWBDOjVnfjB2dpI8UVnvd8bbIPtGUgVnQyc7K7Y/BIOjqAtcflSox+aCfzn+axPN4PFewXIrzggUna35yAmejFw28QcVG2hHmZQZeW6cXt0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Message-ID: <e5f6aa6a-7f9c-fdcd-a5b7-8714c15b0b3f@amd.com>
Date: Thu, 28 Sep 2023 13:08:14 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.15.1
Subject: Re: [XEN v1] xen: arm: procinfo.h: Fixed a typo
To: Julien Grall <julien@xen.org>,
 Ayan Kumar Halder <ayan.kumar.halder@amd.com>, xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org, stefano.stabellini@amd.com,
 bertrand.marquis@arm.com, Volodymyr_Babchuk@epam.com
References: <20230928114835.2592187-1-ayan.kumar.halder@amd.com>
 <42527c3c-2c47-4feb-ae96-37c6ac9547a8@xen.org>
From: Ayan Kumar Halder <ayankuma@amd.com>
In-Reply-To: <42527c3c-2c47-4feb-ae96-37c6ac9547a8@xen.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO2P265CA0119.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:c::35) To SN6PR12MB2621.namprd12.prod.outlook.com
 (2603:10b6:805:73::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN6PR12MB2621:EE_|SN7PR12MB7202:EE_
X-MS-Office365-Filtering-Correlation-Id: 6b206ec2-855d-47b0-5139-08dbc01b9c46
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	UcBQyeeqW9ZN6yFMYD5PdNKBU5+AnHh31yUbgoeUCCPpPOhEBXCc9XOfszNksDtJw4Y5NwFmyI8qosANqRC+vnCG6SeqjY7ahsaGOjniNjRmLVtAFy8wjiZXNL/PIDDd3UeCH499bpUq0S81h76TkNGk5ZLe7/s2xxnOQW4h+2N036ot2Hi1H5mQH6/xuLyLaDFtvnJG5tDyOmo84CUC3W7ZiP2hGinHkFXMSdxJNSD5WxRdt/FicI8KHhcBnvMmNbchXbax/arkvBp6v7j1yYG/3mQUDVzNWbAXNE4iNXTKDrpZUietlVTGbLcIGQU715P5t3cEwXfdfxuGX4TqeTHVcCjlflFGK2ADRWw1LcvRxoTjqkd7HXAqFtgc9BZNIGOxbhN9XfhS5b20HcEvdSXhXdGc0LUFDOnz2z7YTbyDYHQ3wlHGoOwJR5WlZCggnFmXkmlpmhxux0Ln+76HPmH6dmZaTD2iUYUQeiE0+qAPYPCcb6fTLaIm/hPqVl9g3SXDGk5RumeDaFRTvBYLUhG4E/Xd+3rC9xQfJhnIO4hW9k4WE0x538zlNKEXoJmI4uV8szvJJLVwZGHMp58r9ty/5K1gaDTCYiuLFFBb0I7eaEM4hC2odouHe87/1iuGePn4X+0x10ISt1lUAXGsZA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN6PR12MB2621.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(230922051799003)(451199024)(186009)(1800799009)(6666004)(26005)(6486002)(508600001)(2616005)(83380400001)(36756003)(31696002)(53546011)(5660300002)(38100700002)(6506007)(6512007)(8676002)(31686004)(2906002)(66556008)(66476007)(66946007)(4326008)(110136005)(8936002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?T1I4Tlk2ZVVLVGV1RTNXNFJpQUIvc2UyazIxVXZubytJNVhZc2h4Y1h6S2J2?=
 =?utf-8?B?am1QZVN5TldLY25uTDB1elF1dS9LRUJ4ZVpxZ1NCMEdPVmpsWW9EWTdNUFAr?=
 =?utf-8?B?aUNwVWUycFM3ak1CZkZUZnRYaWFLMTdJT2V5eDJrS0h0Sm15eDFadGgwNmFl?=
 =?utf-8?B?ZjZVMUdsZEc3YlBMcHNFK3lVS3Z1OFVSVVpUbVpFdSt4a282SllnNXVVb0lx?=
 =?utf-8?B?RUxOMTB5N1FUUmltTmliNzNrSlZJeFRFcW14ZVpaVlY2bnhSTjJBa3ZLMWx1?=
 =?utf-8?B?dmhqL0x3Rk5QWUJwOXdXRUxoN0ZHcXIzY3E0b0Fva3Q2dU9SOTJDaXk3VkN2?=
 =?utf-8?B?M2JUZDNtL2Y4bVZWRDduWkE4cmVaVXV6T0NOT2VUQzU0UWtDbTcwVFRUU1pH?=
 =?utf-8?B?SmM5VTFaMTRJT210UEp2T3VqNUJUTTNjWWhnUkkrcnJTOHZheGloYUNNSTVz?=
 =?utf-8?B?SkJicnZKaFpXTGVKMFZOYSt6cjRpM3dyUHByNThWRXpIVXhrWWp0RisyaEll?=
 =?utf-8?B?SS9relZoTm5YY1g5M2d6eFlnLzlpQy9PN0dwQkRZYUJCMVhHVko2ci83WWpu?=
 =?utf-8?B?OUhWcmpNRGtNT0V2OGRFMWczK204SGwxUVoxUGl5eFB0NytJcDJqejFpenlP?=
 =?utf-8?B?MnF0Skc1QXREams0V2UyRytVekFtMTRJK0lCV01ZQVI2NS8zV1duZHgyZjdJ?=
 =?utf-8?B?OEVMd3liVW9oTEJqUDJhcXlDVlIyU0M1eTc4VnZrZmYzWERmLyswTzc3YTBM?=
 =?utf-8?B?a29PaXNubndjUzZNTzNvMDZuWEI2WDRQY2JuWm1yMWU4cGRnT0M4VFlWMENp?=
 =?utf-8?B?cDdUd0JSdlJMNGhXYlZXT0FsNnB4ZEFZamxibXZsZEZkMGVtaHFTdFVIMkJC?=
 =?utf-8?B?WGVNOW1KME1aS2ZTc1gxazhYeW1yYjNweHl1RHg1cDNMamFHZllwM1pGR0Za?=
 =?utf-8?B?ME9DVjN5Q1BXdFBBODRiOWl2cklNOVZqbXZabHRFeVFFem40ZDY0bkdySDk3?=
 =?utf-8?B?bjNuWHozUXhZQ25NeExpb0NNZW4wUGZ6TVh4c0oySHR4c2xvVmY0MXVVeGc5?=
 =?utf-8?B?TmJ6MWVUSExXajNoczNCeWVRSlViWExBNUt5aDBOK3hIOXNNQlZ3N08rQmE3?=
 =?utf-8?B?Z3J5ZzR6eE96RUJyZTcxVmNneU9McSt2NzlHZFZDZlBLVFBXRVhybDJ2OUJE?=
 =?utf-8?B?VjFCRldjNjZndWJqckh2d0FXTEtlYUVwVVlwK0wwUG9CWk43aGJXNHZWYWpB?=
 =?utf-8?B?UElZVCtlSFFta05pbmkwSzlONDBFTnREZ3k3eGJyTGlxSnM5eHBBa0N5Q3lU?=
 =?utf-8?B?Q0JHL1RwTDlrN1pyU1ZTdms1UjkyYm5yRW5McFJpeXZacHBnRGxtc211WkdQ?=
 =?utf-8?B?L0pUOUFPdTZKK2tjZm5pejlBUWF1KzE1SHRoWHY3NUlGc3kvU3lPeHMrUEhP?=
 =?utf-8?B?aHBBUG4wM2Q3bVRQcE1GNFp6ZDNJQjZlOFNaSkcxbU1NamZ6dUFDOUtHNkpn?=
 =?utf-8?B?Mnp6QmcrcVZrL2QzV2pmOU1lMTFaV2tTTVZPVDdyTnVpY25EUVB2dTF5ZW1H?=
 =?utf-8?B?YnZNazhLOVZkZkw3NVBhWHFhaHR3WVp5NFIzMnhDNHJGOE4ydlJQQnlXMnMv?=
 =?utf-8?B?dUQrNU40Y3B1dEYwUURlVy9tVldIa2lYTElBTXZXOGdpMHpkM2sxMEIxQ0tr?=
 =?utf-8?B?N1B0NDg5WVNpbmhUQk10THdwK1ZXcmRjTHlTZTcxa2ZCd3E4bXNuaHlqRjVM?=
 =?utf-8?B?dzFjNlh1THFLMzVhVy9Nd2FJQ1NHMVVDeEVYNXY2aU8vVmUxandFWG93c3RY?=
 =?utf-8?B?cjRyOGJaNExVNXhXQ1pwbjJjbGNIZmpjK1FmZzFOMW92Tk9pdit3UGJiQ2pJ?=
 =?utf-8?B?R1ZhRWZZR0JtRzY5bWRrRzFmTTV3alZZdWJ1dVl5MmphaXNSU0dWcTMvWXJl?=
 =?utf-8?B?d203RDZwcm8rbmkvcUlPT2FDdERnaU54ZWx5YXZqbnl2SGhxeHhjQzNWSlo0?=
 =?utf-8?B?dE00cVNMVlBjZjBlcURvSnhtdzNKaHZIS3NpM0NjM2pTY3dtNWdSSmhhWVVW?=
 =?utf-8?B?Q1VEc0xwL0Z3NFBGc1R2VG1sQjlGVGUxUDl4a3czMTZ6YUpZbjFqRFc0ODJy?=
 =?utf-8?Q?0KVJafOZU/9y4O3bh0u7sxQ50?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6b206ec2-855d-47b0-5139-08dbc01b9c46
X-MS-Exchange-CrossTenant-AuthSource: SN6PR12MB2621.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Sep 2023 12:08:22.2541
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gtZZk6ca56vIpRYjODD7q6LX19hU0V0mxQd0RlFtj1kFZ00RapE0F5GUnGqpZPJefT1CMPTK+2vNeDsjfUkzIg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB7202


On 28/09/2023 12:57, Julien Grall wrote:
>
> Hi Ayan,
Hi Julien,
>
> On 28/09/2023 12:48, Ayan Kumar Halder wrote:
>> Change VPCU to VCPU.
>>
>> Signed-off-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
>> ---
>>   xen/arch/arm/include/asm/procinfo.h | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/xen/arch/arm/include/asm/procinfo.h 
>> b/xen/arch/arm/include/asm/procinfo.h
>> index 02be56e348..8b8dae3dd4 100644
>> --- a/xen/arch/arm/include/asm/procinfo.h
>> +++ b/xen/arch/arm/include/asm/procinfo.h
>> @@ -24,7 +24,7 @@
>>   #include <xen/sched.h>
>>     struct processor {
>> -    /* Initialize specific processor register for the new VPCU*/
>> +    /* Initialize specific processor register for the new VCPU*/
>
> As you are modifying the line, can you also add the missing space 
> before */?
>
> I have also a slight preference for using vCPU over VCPU.

I will address both of your suggestions and send a v2.

Just fyi, I see vCPU and VCPU used interchangebly.

xen/arch/arm/include/asm/new_vgic.h uses VCPU.

xen/arch/arm/vgic-v2.c uses vCPU.

>
> With that addressed:
>
> Acked-by: Julien Grall <jgrall@amazon.com>
>
> Cheers,
- Ayan

