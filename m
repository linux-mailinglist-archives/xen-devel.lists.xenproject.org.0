Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 205FC58D72F
	for <lists+xen-devel@lfdr.de>; Tue,  9 Aug 2022 12:11:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.382887.617949 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oLMCv-0003A1-9z; Tue, 09 Aug 2022 10:11:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 382887.617949; Tue, 09 Aug 2022 10:11:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oLMCv-00037t-76; Tue, 09 Aug 2022 10:11:29 +0000
Received: by outflank-mailman (input) for mailman id 382887;
 Tue, 09 Aug 2022 10:11:27 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=A/TE=YN=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1oLMCt-00037n-Ry
 for xen-devel@lists.xenproject.org; Tue, 09 Aug 2022 10:11:27 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-eopbgr60086.outbound.protection.outlook.com [40.107.6.86])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a0f6c1d5-17cb-11ed-bd2e-47488cf2e6aa;
 Tue, 09 Aug 2022 12:11:26 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM9PR04MB8779.eurprd04.prod.outlook.com (2603:10a6:20b:40a::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5504.21; Tue, 9 Aug
 2022 10:11:25 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::fcd7:eaf7:5345:210f]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::fcd7:eaf7:5345:210f%6]) with mapi id 15.20.5504.019; Tue, 9 Aug 2022
 10:11:24 +0000
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
X-Inumbo-ID: a0f6c1d5-17cb-11ed-bd2e-47488cf2e6aa
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Z9YU9GpVxo+zYHwUbek5mmEYekZdpuiZRQ/i+tGlFbUN/Gv4hVCGgRERMMl1deqnt2Ng+Q9/+RoD4w2DWcAQRic7MyDQW0iXOvBo9XOEJqUJzCJcthtS6ze8jis4ieS3tMmvyhn2/lX83ZxNHMJzFWk3c9GWHHmPattjZLvncumzNt0l4y0VghGG7VqAx3GdtUc1aIAL30W+s0pU+BaazRgf9LAS8zW7hBqTKDCGtsBBnd6p389bOPWHSO0eOBIjDSDNIjn9QQOfLBsWb/rSL+isxY2JYtpGFW6pRNS4sYxvrA6uGYJvg7KlqchpQeaXGSw71TpErWPM4Qe8dk+wUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gxKSiC1OQmtpVWmA/XPbVf5BRb6scrzbYmJiVJJ50us=;
 b=H7ej6bpVd9dfqLqnJcl8cp3fy+a5PKDif0JKeejEgalKKsKcDuhBO5zhGlH16g4KOYxn+Le5JgOSvabuqylL8tUK9J+9lOv8AUISA9JLkAOHjA/pQBveckONSa+/EVNT2iREe2laPw13Yj/IepaEOnDV6LMEz028vF31VIeLvzrkSHmGLDVqF2sbixLm/Sc7YVIz4YEKnEbyhbWe1byPgtXxG4BVxYUHRBxoWKjAXUv09bE+naR+2H1dwywe1c8MH+j0xFTRQ2/AkriKf6g1a6v5oQNrlRSM/QuJQTGpP+4Ge81RMMkySDuzoQyNHcccdr5dpcgg+OnlZuqnV24EIQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gxKSiC1OQmtpVWmA/XPbVf5BRb6scrzbYmJiVJJ50us=;
 b=HZKUYdG5t4UYLkhTAH1ATnPZchHMi2JM+GU5+gUThdLR7X5m6m7LS2YNziC/fZl84t193w6z7uZomtE1xrGYcQj9ycFFT0QAwsQJkEUV9Vrn0bm1SgVcru3FizuHKJrxnAD++1VarXPOdE9iiNhh7JBWNYS0utdkAKWYRpyQC7oXAM9OvJJCydQJlkBvCf1/haMmcjNORosqCaRY4uupnSr6hcXD+G7LIiYUKumtlcZhll7kTTi68FIEgBoxxcxLhJ936S4bA9rcZaieisqhZ+he/dAcRCgEionHYYH3LYVeVphSJ5MqdYynQhvLqKvYrckQF3ps0hPjYIIQWtavcQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <a42dacd0-c046-cc8d-da4e-8a3feb405cd8@suse.com>
Date: Tue, 9 Aug 2022 12:11:23 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH] xen/pci: replace call to is_memory_hole to pci_check_bar
Content-Language: en-US
To: Oleksandr <olekstysh@gmail.com>, Rahul Singh <rahul.singh@arm.com>
Cc: bertrand.marquis@arm.com,
 Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, Paul Durrant <paul@xen.org>, xen-devel@lists.xenproject.org
References: <5650ddce1de4fd5471823bde44a12a03f157bc11.1659713913.git.rahul.singh@arm.com>
 <d5590d91683f2dddb3836b1afb444f30c2f5a7fb.1659713855.git.rahul.singh@arm.com>
 <5e762a42-d0d5-86be-e3cd-64bde82c8b47@gmail.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <5e762a42-d0d5-86be-e3cd-64bde82c8b47@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0040.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:4a::8) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 911957c0-eea8-4557-e9e3-08da79ef8412
X-MS-TrafficTypeDiagnostic: AM9PR04MB8779:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	zHHbmp3wsWkuvrrbDQY6TSexDxbVzFWffJMEFeGkKHQsAbMRZ10L/nEBE60zUPeOYRgYubxzFN9RUG36MfyK2kpPzayCpZoqpqQYLMIFPjwjUbD7SFtUTI/kV0amRSddaa8hdNaaRLUoi8DrKLV8m04r6vC/7eG96ALWzq8tvYbjTmYowAFUcQP5yJ7nyi6TeCFBx1p27mCHPKSnoKnVIkE362QuTqlHaMt9CsnKsdrlsvbtvxltyuhXsfvY09dODsfLrfC+We9OeyXNXAuTL0n24EEYmGOwx73Rbi+9SLkRkOJK/KenaUT7K5rCuvTP+Ve4llT5TQta3g9L8Wma4txB4cBmVGZDxK66y2m3Lff84FUz3bO3dK7H37vWKo7ZM0pQ16hzmHu5QNCraSupvBClEt1k87VmCpon169ldj1dTIXC7PkfxWFMmgjfI74VR7IqcDOzEBfWm6Z1UrOlEF6OEZTJzaNonzdLjZ9XWXZUdEIdxFw7Pc3ycGOv/yQb5AlBRVxQEVivCsEw6Htb7HR6c+4UWiDzzWukpLvrV7OilJIc4UFbjuSHGAu/HW0FfIqPj2X/XchAMNcSmpK/pyvi+syO50zkpdnKxiMwC6EVlHS8UQ99LJwARrCfBlV1n3Vim1pfsyzKMqCuI3pivq/ENg+O+FMjKzXW5wcTNbT49DXA5kI5Sfu3eTY0hvVl9mzH7+4JnMWGZ6g8aw1n6pMLewXal+kNJirrLX0jNndcVA/+XN4pLC/fd/+fmu1QZPEJgVWZrCNCKV65dU5BqFhjTUGF+EzX4Ky7KOmEzbjLuriEYGIMQaLb0wiEXskj+bmO9FswBqXUgn2iCdRkng==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(346002)(366004)(136003)(376002)(39860400002)(396003)(26005)(36756003)(2906002)(6512007)(53546011)(186003)(31686004)(41300700001)(2616005)(7416002)(38100700002)(5660300002)(8936002)(478600001)(110136005)(31696002)(86362001)(6506007)(4326008)(6486002)(316002)(66476007)(54906003)(66946007)(8676002)(66556008)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?c1lOVnRFZ05JRE4rM1dNNjJGTUw4dWNrMnNtWmZ0WlpHaEgvZmNHTHFEdGd2?=
 =?utf-8?B?SnRFZzNPTVpPR1FZaFdBRWhUYWtBWGV2aE9SbjllWkZ1K1JYKzI0RzFXMEcw?=
 =?utf-8?B?N2pLSHAvclpyWkxoVG9ERkh4bDh5TlVKWDVQRGFNQzlGVG1ZQi9MVXVDUTdE?=
 =?utf-8?B?WWltQTF3RCtTd2pTdXhQVktMeEdPZXB0TWhWNThRUEorU2tqQ3dCamRoLzlq?=
 =?utf-8?B?NUFESFJtSktGSnFpUlBiOERpazgxcU55Z1VQR2JkZGo3VGRiRGcxZEpvb0lL?=
 =?utf-8?B?b3VBa1huZndlNzhMcVNzUXpqR2hCVFIyNDVSWjl5L3NKQm9LQWJLOUFoWEt5?=
 =?utf-8?B?VjU3KzVoQUN3TnpUREtjbG51cDN1VVU3YkVpb3pBNHU1alNDdGdNUGpYc0Fs?=
 =?utf-8?B?VmxUL3FLNG4zSVp4N2ZSQytSWkNpaHoxTlhPeTVyMlQ2QVhUdkRKcmFaanZ1?=
 =?utf-8?B?WGlDTkZTd1V6dFBXYXp3MXdoQlNsMWZnSis2dnA1OGN3WGpIU1ZEcXRSSmp3?=
 =?utf-8?B?RjJNQzJFVk9NeU9IQmE5UjNxQXowL1pSRFBZeFdnVkdzWHpUOGNDTGtZeHVk?=
 =?utf-8?B?QXRGRWpRSUxlbDNQYlhreVJDalNsRFp2TEd2ckF5NmJEUE40M3FXL3htc0V3?=
 =?utf-8?B?SHhJbk52Yk9OOHdBT1R0aUhpdzVRWXZKbGI4TDlQU0Z4SjdvSkN5RURsQ0xE?=
 =?utf-8?B?NE5KWUQ2cFF4RUZHY1pTRXJiVG9YQTkyNmxJVWRBWXNLc0FVL0dPMVB3anVh?=
 =?utf-8?B?TjJxeXBOdkZSdkVlVDRkYWZBUFNxRlRaUmwwMHcyUEkrcTFlbStaWXE5Z2F4?=
 =?utf-8?B?NXZUYTgrd2V5U1IrWHkrRjdSVmZwb3p4RGI3WGp1ZUFha2IvZFlxYkRBN004?=
 =?utf-8?B?UE5Cb3plZDRMenpMTGRWZjAydEZNekhjWkc0cm9pNDVmaVBYTHdYN3FVdTcx?=
 =?utf-8?B?eFMvcnp1V0w2enVMVCs4a0NCUi9YOXJMRHNzOTBiZ2J6aFNjOXdVQ0VUeUV5?=
 =?utf-8?B?aEsyK1F5QVdXbUFsVHN3NjJNOHdoK2VPbnREN3d6SmcrUUFZSGkranFoKy80?=
 =?utf-8?B?YlQ0S09CQzlGcy9aMXowZHZlYjl1YkdkN2VwWWVYRytER0VEZWtNREhpS2tJ?=
 =?utf-8?B?Rnl5RDhLT3BpNk5XTlIwSzFBWWs1Y1JmZ1RjVW93N3c1eGRBbDlxRDJXb0p5?=
 =?utf-8?B?aFl5bnRCeC9EZ2MrcndZaFYzZ3VsYm41WTJkZ3ZyYVY1MFdkNnVGZUNkL1g3?=
 =?utf-8?B?ZE9zMUV1ck9CZWdUOFBPVFhYTU05SDNtWkhNMzNwbzFxcmxkUWRyNlZlVEJl?=
 =?utf-8?B?OVk4U3NxdVhTM093Qm5zSzNhNE5oWGd4WDFDU1NOWU5IR3FwMGlLZm5jSU5q?=
 =?utf-8?B?enB0NFVuK1VBSCt4djNsZnhZMStkbk5naENiZm1sb2FFMG1iVXlseVpNY1c3?=
 =?utf-8?B?MW1nSGxYRURJQnhJbVpyTGNLOGlFbW55OWgzNXNvbW1qVEpZclZ6NmpBN0dq?=
 =?utf-8?B?ejZ4OHl1dDhnUzNyT0lLYllKeUpLT2hDNDJuNWFlUGpQZXpMNHZKYXBOcHdw?=
 =?utf-8?B?a05OWDZRZFk5bEFRdGJCZ05XSEdJSThuUnZmS1RzMGFxdVFheVlTYUsrUG1Z?=
 =?utf-8?B?aHlXMER3bVBHNy8wM1lPVVd3ZjJPZEVnWHUrTjJuRUlRYlhxeEFoVjVhb0VX?=
 =?utf-8?B?dkdPVzY1QUdSL3k5S3lUUTJTRWQrZlNhbVhNbHFGcTYzU2lic2cxUU14Wmsw?=
 =?utf-8?B?Z0NaS0tHTGNlYmdoUm9lOGxuZ2JSSlh0bkxBK1lxTG5YTkdMelY5SVdJaE1x?=
 =?utf-8?B?VmI4cTB6TUxGN0VNNHJsWUtaTFk4alljR1ZqYjR0aGtVZlV2ZnJuTmUxQTcy?=
 =?utf-8?B?VExwSjdUcXZTTitRSFR3MlUvQiswdDdsNStYb1krb0NpVThSdS9FajVZckRS?=
 =?utf-8?B?U3J1Q2pLL0llRnRvd3FpRjU4N2pENTFzUC9iWGo4REozTXo1UFNqd3pNTVp6?=
 =?utf-8?B?dzkzRVFqRUpFS2xSMDd3M1d2cnFDelNwQ25RVVVaNWQ5K0ErcmZTcldPbGF6?=
 =?utf-8?B?NVd1VGtFRGUwQWRSODJBeHZMemJpOGExM0w5ZEVYcXFIQnl0TnFDbmg0WFNZ?=
 =?utf-8?Q?Lew7mSSZd9e61awZjfYhArpBn?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 911957c0-eea8-4557-e9e3-08da79ef8412
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Aug 2022 10:11:24.7573
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Xs/gbuXA9XPTGuhdkbAsicog4qgUGgkhCg/nnZmztcH2h1dJNczpXkLieu6Mf8IOrbUaJjRGk6KH0Zt/DrdGZQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8779

On 08.08.2022 17:30, Oleksandr wrote:
> On 05.08.22 18:43, Rahul Singh wrote:
>> --- a/xen/arch/arm/pci/pci-host-common.c
>> +++ b/xen/arch/arm/pci/pci-host-common.c
>> @@ -363,6 +363,41 @@ int __init pci_host_bridge_mappings(struct domain *d)
>>       return 0;
>>   }
>>   
>> +static int is_bar_valid(const struct dt_device_node *dev,
>> +                        u64 addr, u64 len, void *data)

Nit: No new uses of u64 please use uint64_t instead.

>> --- a/xen/arch/x86/include/asm/pci.h
>> +++ b/xen/arch/x86/include/asm/pci.h
>> @@ -57,4 +57,14 @@ static always_inline bool is_pci_passthrough_enabled(void)
>>   
>>   void arch_pci_init_pdev(struct pci_dev *pdev);
>>   
>> +static inline bool pci_check_bar(const struct pci_dev *pdev,
>> +                                 mfn_t start, mfn_t end)
>> +{
>> +    /*
>> +     * Check if BAR is not overlapping with any memory region defined
>> +     * in the memory map.
>> +     */
>> +    return is_memory_hole(start, end);
>> +}
> 
> 
> Nit: I would use simple #define instead of static inline here
> 
> But I am not 100% sure that x86 maintainers would be happy.

Quite the other way around - when possible we prefer inline functions.
And note that the two functions are strictly aliases of one another
(in which case a simplified

#define pci_check_bar is_memory_hole

might indeed have been worth a consideration, as there's no type
safety to be lost in such cases).

Jan

