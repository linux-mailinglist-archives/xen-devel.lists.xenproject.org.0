Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 148C76692BC
	for <lists+xen-devel@lfdr.de>; Fri, 13 Jan 2023 10:16:40 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.476916.739356 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pGGAQ-0004EG-Pa; Fri, 13 Jan 2023 09:16:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 476916.739356; Fri, 13 Jan 2023 09:16:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pGGAQ-0004Bs-Mm; Fri, 13 Jan 2023 09:16:06 +0000
Received: by outflank-mailman (input) for mailman id 476916;
 Fri, 13 Jan 2023 09:16:05 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=grKZ=5K=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pGGAP-0004Bk-Ia
 for xen-devel@lists.xenproject.org; Fri, 13 Jan 2023 09:16:05 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on2079.outbound.protection.outlook.com [40.107.22.79])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e7a2b533-9322-11ed-91b6-6bf2151ebd3b;
 Fri, 13 Jan 2023 10:16:04 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by PA4PR04MB7982.eurprd04.prod.outlook.com (2603:10a6:102:c4::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.19; Fri, 13 Jan
 2023 09:16:03 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2991:58a4:e308:4389]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2991:58a4:e308:4389%7]) with mapi id 15.20.6002.012; Fri, 13 Jan 2023
 09:16:03 +0000
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
X-Inumbo-ID: e7a2b533-9322-11ed-91b6-6bf2151ebd3b
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cz36W0dh2FXosdtxqdAa92ZDiP4Oyr9Uac0ps+Bir/G9QyZJgakmOt9e6lJbEZ1IobKm4vxLF+RXVTAWNZyXT63uV4Mtv2nQDsuiA0wehzObnbGGFU6WMCQ2SekHjr3q7BIaHICAa9Au5yU+qdKKAc+L+7vviIHHSvrHif/vmrtOs8vsNZL8cdFrti/JWRtAIYoylR5WDdepvXt3t6z7RKmOisMThsQ8UmPRLn6O9bmMhk93gPFA8NaY1UuiZMApNlCqSBenn82aUc1Wya55ks10VtZM1To2IU0cpKu3Egcr2dtkDhwFmZ/vhECfPO+4RRyVuWP24uqGhBbCK7bDvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=H/EGN5qboOgBGC012glyK/C4KBiGb90uJnhpWogn/v8=;
 b=Z/SqRmTfgsHqsREqawPqCdRgZafk98IoWDFVJeHOKPKnPKGHGS3+7dYhIG5O1yfzESLDZYh3DXuA7dzJOY1fmc+NV3cLQM+d21gnDyylYk0QykHk+I7LZiuEV3I4RWmzRgqhGSNeT+91pgrbYSwNNlYfEUCeq8fepbxisM8E8HRktQtzEUuu9faCOZR9CEh9eaj7RwXcfLau/WJ7eOmIgaMfLDJelT+sawnPEd2YErgVfP27Kf6wjbpmGC0bT7lsffmLjVOcuhxsUNJJQRCGnAWrjDVAdXgLWge7LG9ULdbtLSvECqSYhTnSGA/LDfrbm3g+IXx31g/+2MI58aAflQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=H/EGN5qboOgBGC012glyK/C4KBiGb90uJnhpWogn/v8=;
 b=F35NrIeC6MkYr1JyXwHRdc35hUgz/BtKqWEBdolVOMK6g2U0Y0u7SNBKjZxdPL9lLnv2qiFBwcmef3595DDnS2jFPD/3j78RjA/cK0dDPZC5BqdzrdjvYKX3GLiYtu08ZhhiD57wVpqYH0SKjHl+pxCfd0n6CEAT/tU/z4/4mbs4DxnPDnUzD7F1TeZRosrsrqFRaLVsuC4ql/0LluJJPTrUrRc10tYyakeTUYGJOYMhzY07EXlieiibXL72USoFE4eB87gKEDfInnPslzpgJheqdIuw71xSUQu4LibxNfErdxb8A9JhtCLZCBFDWQRwxyrf9ZjASa2EZ2KIOttVlA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <386a58bc-6d16-475e-ffd5-a3340adbe4b3@suse.com>
Date: Fri, 13 Jan 2023 10:16:00 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH 05/22] x86/srat: vmap the pages for acpi_slit
Content-Language: en-US
To: Julien Grall <julien@xen.org>
Cc: Hongyan Xia <hongyxia@amazon.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, xen-devel@lists.xenproject.org,
 Julien Grall <jgrall@amazon.com>
References: <20221216114853.8227-1-julien@xen.org>
 <20221216114853.8227-6-julien@xen.org>
 <ca02a313-0fa2-8041-3e8f-d467c3e99fb6@suse.com>
 <965e3faa-472d-9a79-83ca-fef57cda81c5@xen.org>
 <ade9f97d-aa28-bd7e-552c-35bd707bab29@suse.com>
 <a607223f-1cd5-5b32-4d9b-500496745786@xen.org>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <a607223f-1cd5-5b32-4d9b-500496745786@xen.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0137.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:95::11) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|PA4PR04MB7982:EE_
X-MS-Office365-Filtering-Correlation-Id: 80f1fb61-c02d-4e89-af96-08daf546cac0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	UeUBtcNlWfkssLfoj6C5bGLXdUo1rTl7S1Sn3kjXIOt/H2LQ+Wu9T60UWMggk5KgQYL/iSR3TxKhOq+oPPGIUpC2sIClRexlSFgyP+PreYubhdofjnugU9dQENb+dvxuMWdPTjg2y8HBzehA3opmcyFoOG+iAsxgxYCHIqexw6tEEt3HZ7rXoMuHflzD/IwCCGohgIfdmodot4vCJ8mVuHufVTwrP3nk2gz4TccC/wIa6E311H3FG8l8HnGSAlTIJo08WSaRVokYsyyAHbZ8WpqmhOSrfWmm2aZ9eyWpU3DcXYI8gFaU5owRv0SvBUSXbCJ2RXc9wpVv67RHR/orUZWuM/Nc2OzW/i99qfPXJzEQY/z1rkfr9UqujztIWlYCrWqWDrx70cB1co9L9ZbMHgX521UP765m5hKtRJtDfGwMuoro9cvUDdW0+MlBZgntLaUeiR3ImUC0hmi5NdkUt+uVrje3Nbd3I6TuL/o2EaAHCdF5ZstZCb+b0bU7XLrQGi7BY57GBZOF6wxatkwQ+NsdRLlVVjAkjHnezp1hoMdhGgYGzAsWiuwIMJA52qJv5g/lBuQ72bKNh5U/9MIK3H4Cx+CKqq78pBURPm2KWNnjbcP9Fw0ai/uSetsJvry5bGMDE65MORih6LnG9YS6Fc9PjVBVGWFLLuHL6WhnfxrXRi/VePI11iGkeBR+0nhNM9vY5lMfzhRiFJZvofmTbHQyqjXJMFV+GfkQTU7j8qs=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(39860400002)(376002)(346002)(136003)(366004)(396003)(451199015)(66556008)(66476007)(66946007)(31686004)(6916009)(41300700001)(8676002)(8936002)(4326008)(36756003)(2906002)(54906003)(316002)(2616005)(5660300002)(26005)(86362001)(31696002)(6486002)(186003)(6512007)(478600001)(53546011)(6506007)(38100700002)(83380400001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bngyTE1NTHdPc2pDcXR2bk1CYlBtcjRFb3hHOVN0VlROWUhtcFVZZHBnK3J6?=
 =?utf-8?B?QSt5alFMa0k2MjJyaXZtSWRENkNXNTRUQlg0V1I3UEhJZHJZRHY5U3g4L0Ji?=
 =?utf-8?B?ZzR1S2x3NjE4a2tEdEs3enQ3NEhVaVZYaUM4TXB4cjNvWDRaUTRpSXZTUFAz?=
 =?utf-8?B?RzdNd0RDYmtmWkZJMGtkZzd0ZWJJL0dYaEt5VHpjcFBHUUF3b01URU96TTBR?=
 =?utf-8?B?ei80cHFHUmhPOWRNZXRKbUhhUTZCN2dYZVNhNExTTkdjNzNuMFdRaU42Yk4r?=
 =?utf-8?B?TzVRdHkwZkQxa09Ud05lRmVwbUdCS2JiWlpZTnRRcUUramRQZ284dnNRTVEy?=
 =?utf-8?B?OE5YRTZMZGNIdE1LNVFSM3ZSd0JRV0d6SXp3aC9xQnYzVVc0QkVnUXpuMVNo?=
 =?utf-8?B?cmpxc2dTUjljWU9ubzFWK2VxT0RWeUFXWGNIWDA2Zm9wQklTSnh1SXBEbHB6?=
 =?utf-8?B?WXd0SmkraHdSQ3BObTRTY1lmUjdneThHczR0RlliSDBnZG9ydW5zS0tmam5W?=
 =?utf-8?B?TWJKU2gwWVg3cnJ1eGwyWTBjbkNvMjR4RnZUTzdpRmQ2dWN4L1dTclp5eXRi?=
 =?utf-8?B?TllDMTFJZEFHc0hmWEFhNlo3VHJnaW9pOUpIMjc1YzRXMTVneGVmcDAzaHRL?=
 =?utf-8?B?NkhwRW5qek55ZGZ5WDZzb1hpeVp6bkdKOG1xTitwMUo2WE4vdEtwTDNzM0lS?=
 =?utf-8?B?Z1lIQnhVc2tmZHZMUytBay9QMjhzNW1oeWdoelZlb3l3SytwWVBzOTNMelZQ?=
 =?utf-8?B?UGRic2pWcythSk0vSUxJOEZqY1lGMjdsNndUVk5KV293ZXp3Y3o3ejkrVEZr?=
 =?utf-8?B?UjY5aURGTit3U0VuMFdZSnMreEoxTzZWZ2c4YjZXSENCY3NXbEYvZCtteVpO?=
 =?utf-8?B?T2wrMUM0MXFXaGpHSXd0NXlTcytqQTh2L3QzTVpIZnZiNGJ4MjVmSWpTTkYr?=
 =?utf-8?B?NzVRVkVQWEhlZ3N6MlAyUDA0VlNxWmo2aWxxeG9Xem1NeGdtczU4cW43a3FY?=
 =?utf-8?B?Nlk4c0h0UGY4UzhIaHlIbjNuYjBkUEtyc1hTTHUvZlBWM0VzaGZEeVRSSlRB?=
 =?utf-8?B?NmtkcUJpV1c4YzVoTVdLV2FDb3pvU0VZUFVMMUREcnJmNldaNWxnSkR0K3Nu?=
 =?utf-8?B?WERJMVNBVXZJRTVVOTF1K2Jmd1VrdldHRDNPaHU5endxOWxlYmJQektTNHk0?=
 =?utf-8?B?SzdVUXlycElpL3FGMTBXQUd0cGMvbDNPYnQ2OXNZUUROUHVFQ01TTWJnOW1O?=
 =?utf-8?B?RGU3cndRc2VXcWxZQmhJV0xTUlN5TExwbzJqTUxJQTRhNEwxVjNuTGtTWjZ3?=
 =?utf-8?B?cFRGK1ExakRTRkYrcVp1b1BSN2FkSXFyZTV6bUQxa2djVHcxaW9NdkZtUnFv?=
 =?utf-8?B?cVVoT3hzOFZDNHdZdWNXcGdXb1VTT1Q4M0RkQ0tPekhwZTA5K0l6cnA4Yldw?=
 =?utf-8?B?M3RnS2t0ckMvM24zQzUxVG9sSXBWOGFxU1JjOVJZWUpVMlJwby9BV2tSZGtt?=
 =?utf-8?B?SjBxbmkwTWx6WlpXOHBGL3FoUUdPVVRBejI1bXI1dWU4bmZLcm5iYXlZajVj?=
 =?utf-8?B?VEdiZTZpUlhlLzcxYVJ4S2RvMmhsOEtlQzRzcXE2TVdOM2dSNXRuRUMyT1Q3?=
 =?utf-8?B?akh1TzBOVng1OGNIRjY4dDJMSXFURXY4cTV6UFFIVzJrS3R2T3Jja2FYeHFk?=
 =?utf-8?B?SWUyWmlmMnhaTFBDUkdKNlA2ZWh5WHBialhCRnF6T2dsdllOTXNQR0sxcFk2?=
 =?utf-8?B?aHVkZzhMaVBSNTM3bXlEMEZKMTNqN3cvSjBNMWFqUWJxTjZ6QnJaOXpCSzdP?=
 =?utf-8?B?WDBrTDlTK09KSmI2WHFyVGY2MS82QU9wQ3F0a1Q1UGVia0N2cnBPZnM0YVJT?=
 =?utf-8?B?RWxTbWt0WWhvNWU5KzlNWUtNa1BWME1tdTBpOUNFOXBGb2ZiZUFBNE9IUWdz?=
 =?utf-8?B?Z2VrdHZzeC9IZ2Vtb2pkbHNwUWFJWllFOG1nOFBsWGpQUG5OY0E2UDREMXlP?=
 =?utf-8?B?ditVdUN6SlEzVkRxRjF0dHgvUHFhUVNFVmwyU3lsVnkwM3YvMVdZRSsvMENw?=
 =?utf-8?B?OHl3bmNkYnJkUk9jdHBOMHlnbHZtRGp6SnRVWUZXYXVkVlVWWUppRWtETEc1?=
 =?utf-8?Q?01AzF+B99tBrc9fbi2574pE5D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 80f1fb61-c02d-4e89-af96-08daf546cac0
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jan 2023 09:16:02.9799
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sGZX8WnNxv2RMUv7dCtdwCYNxaJXgAzDXqFC1TDi5QBfAkHdi6XaYCu4V68N/6Mslownwlaq23MhCf+hLO6yqg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB7982

On 13.01.2023 00:15, Julien Grall wrote:
> Hi,
> 
> On 04/01/2023 10:23, Jan Beulich wrote:
>> On 23.12.2022 12:31, Julien Grall wrote:
>>> On 20/12/2022 15:30, Jan Beulich wrote:
>>>> On 16.12.2022 12:48, Julien Grall wrote:
>>>>> From: Hongyan Xia <hongyxia@amazon.com>
>>>>>
>>>>> This avoids the assumption that boot pages are in the direct map.
>>>>>
>>>>> Signed-off-by: Hongyan Xia <hongyxia@amazon.com>
>>>>> Signed-off-by: Julien Grall <jgrall@amazon.com>
>>>>
>>>> Reviewed-by: Jan Beulich <jbeulich@suse.com>
>>>>
>>>> However, ...
>>>>
>>>>> --- a/xen/arch/x86/srat.c
>>>>> +++ b/xen/arch/x86/srat.c
>>>>> @@ -139,7 +139,8 @@ void __init acpi_numa_slit_init(struct acpi_table_slit *slit)
>>>>>    		return;
>>>>>    	}
>>>>>    	mfn = alloc_boot_pages(PFN_UP(slit->header.length), 1);
>>>>> -	acpi_slit = mfn_to_virt(mfn_x(mfn));
>>>>> +	acpi_slit = vmap_contig_pages(mfn, PFN_UP(slit->header.length));
>>>>
>>>> ... with the increased use of vmap space the VA range used will need
>>>> growing. And that's perhaps better done ahead of time than late.
>>>
>>> I will have a look to increase the vmap().
>>>
>>>>
>>>>> +	BUG_ON(!acpi_slit);
>>>>
>>>> Similarly relevant for the earlier patch: It would be nice if boot
>>>> failure for optional things like NUMA data could be avoided.
>>>
>>> If you can't map (or allocate the memory), then you are probably in a
>>> very bad situation because both should really not fail at boot.
>>>
>>> So I think this is correct to crash early because the admin will be able
>>> to look what went wrong. Otherwise, it may be missed in the noise.
>>
>> Well, I certainly can see one taking this view. However, at least in
>> principle allocation (or mapping) may fail _because_ of NUMA issues.
> 
> Right. I read this as the user will likely want to add "numa=off" on the 
> command line.
> 
>> At which point it would be better to boot with NUMA support turned off
> I have to disagree with "better" here. This may work for a user with a 
> handful of hosts. But for large scale setup, you will really want a 
> failure early rather than having a host booting with an expected feature 
> disabled (the NUMA issues may be a broken HW).
> 
> It is better to fail and then ask the user to specify "numa=off". At
> least the person made a conscientious decision to turn off the feature.

Yet how would the observing admin make the connection from the BUG_ON()
that triggered and the need to add "numa=off" to the command line,
without knowing Xen internals?

> I am curious to hear the opinion from the others.

So am I.

Jan

