Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CD392686CC4
	for <lists+xen-devel@lfdr.de>; Wed,  1 Feb 2023 18:22:01 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.488361.756391 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pNGna-0007Z4-SH; Wed, 01 Feb 2023 17:21:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 488361.756391; Wed, 01 Feb 2023 17:21:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pNGna-0007Wc-PO; Wed, 01 Feb 2023 17:21:30 +0000
Received: by outflank-mailman (input) for mailman id 488361;
 Wed, 01 Feb 2023 17:21:29 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=tMue=55=amd.com=vikram.garhwal@srs-se1.protection.inumbo.net>)
 id 1pNGnZ-0007WV-U7
 for xen-devel@lists.xenproject.org; Wed, 01 Feb 2023 17:21:29 +0000
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on20615.outbound.protection.outlook.com
 [2a01:111:f400:7eaa::615])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id dc4454f6-a254-11ed-b63b-5f92e7d2e73a;
 Wed, 01 Feb 2023 18:21:27 +0100 (CET)
Received: from MW3PR12MB4409.namprd12.prod.outlook.com (2603:10b6:303:2d::23)
 by CH2PR12MB4280.namprd12.prod.outlook.com (2603:10b6:610:ac::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6064.25; Wed, 1 Feb
 2023 17:21:24 +0000
Received: from MW3PR12MB4409.namprd12.prod.outlook.com
 ([fe80::f803:f951:a68f:663a]) by MW3PR12MB4409.namprd12.prod.outlook.com
 ([fe80::f803:f951:a68f:663a%5]) with mapi id 15.20.6043.038; Wed, 1 Feb 2023
 17:21:24 +0000
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
X-Inumbo-ID: dc4454f6-a254-11ed-b63b-5f92e7d2e73a
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=S2cGSR5B30bsixMo38uqQPPdVZvna43o6TopMT4vIaRaUR+BsuV+VwFy76E3yrkWNEpgJofq6S/dPhc/xjGGIq/ZOnUZI5MH6VMX2MwoJ04RNE2T4Tgw6r9yClrnfJXgZxyOOOBZARH7hADd0yGFc1fbTu6XbIgKnjkynv+sNv2qJLcnMl+Y6AiQXTWsEEI129auzK387l0QLeMNQx+H+/Jg6r5mW3iWwaOZxCeBThgWTa9tQD0EUASKtnfpz0q8dZlIZi6K0FuJjuQsADtrqHBP9/LelGYXjoBP5NYeXzsR7ZU/YtDSFFK7EahdN6/AiSiXaMYEItulAPoG1USGmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mD1OrwwWiDuw+YEwSJ75bfvbEzk3Wgg4euOqwnrY2M8=;
 b=Nqx8gakPXw3biSamjKI18tcd/4dfdojsFKtiS3RNJV8KAysjHhgGMG6lqlp7z9q5xkdsb4vWOg8JpgHmM9cEzIZdLrHjUMA7dDumWEJKuB0ntjfkFrVvDZI3DSPk+gcxa8J6aZOUG79lvbu4NxZ4PcOWkpKl0UwinFvPz7FzvX7bZoyau3/SGekC4j+zvofGYiVqmaPPrdJH97Rsfii/8AGimh4AXADvU8aV1UFj27xmxwcu2wELhXYWhK6tklvvFdE8qv92FOYwjQeguY+jSiNKqTMa7NaGhW+NR7xTRinH7JOb3y6k2I7PqBEVF/BXsG665PedTL4KwT1ZAvfAgg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mD1OrwwWiDuw+YEwSJ75bfvbEzk3Wgg4euOqwnrY2M8=;
 b=obwLNqyk4v+XxLGUHdasyS3CpM5b7du0YUT3H/2Pj2JCgetWX4lQYOBx8o+Eyp2//zj5z6AOkUWkbWrhdHvxCDzEuQnYBMSIapfZPOHh0YVWz6sbrhbbwvsKdywUDg8QxzfIxHsqs7tehjALlv2D6kN9uYNjyhUQNLcEPvm3fLA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Message-ID: <13031ce2-6d66-104c-4a3e-d4a08883f89d@amd.com>
Date: Wed, 1 Feb 2023 09:21:21 -0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [XEN][RFC PATCH v4 12/16] xen/arm: Implement device tree node
 removal functionalities
Content-Language: en-US
To: Jan Beulich <jbeulich@suse.com>
Cc: sstabellini@kernel.org, julien@xen.org, Luca.Fancellu@arm.com,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <20221207061815.7404-1-vikram.garhwal@amd.com>
 <20221207061815.7404-6-vikram.garhwal@amd.com>
 <786addf7-2698-5a18-26c4-b6b88bba1d67@suse.com>
From: Vikram Garhwal <vikram.garhwal@amd.com>
In-Reply-To: <786addf7-2698-5a18-26c4-b6b88bba1d67@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BYAPR06CA0035.namprd06.prod.outlook.com
 (2603:10b6:a03:d4::48) To MW3PR12MB4409.namprd12.prod.outlook.com
 (2603:10b6:303:2d::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW3PR12MB4409:EE_|CH2PR12MB4280:EE_
X-MS-Office365-Filtering-Correlation-Id: dd6c4b61-12ca-446e-9472-08db0478be6a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	lZTi0whffj/hx/tfE2jHTdeh5DNMx1A/8JS/tXAwNVxgK3XPd0r1cQd70R3gXWlEsD0f6rT+PUfhi4XIaZG8lPFaL6sXpmFqmM2Sv51OYY9bizwHsD6g2q2LIOOKsz57FSSGFvFhkFghYekARyPgJMrOAdUwQvMkutQJeghxVhq1YciOGM5k8NOczCtjQ36OimbMe7TxP1+EsG4fDYln89UqbGTw+J4Jo6r5wqeKWI3OZ4ZXx7cJaeIzJRuHWc4AdRR8qz88AgkQXGkbORd38X2pxqWaG7dfNdAZcewQT/IHmOFV8KC/GZ0vwWyD31v/UJue9vg58NMD93IjqZKymMuNitlppRwj8h/OmSyFoi12ummfMDEu3IEaIzxap4N0c31mfGx/Q2sMo0a+/bcs2HAT0T+lMhtGR6EOc3jJsl3bdEGfgNZmZ9R9Uvcgl8LM3oksRVwoGz36XVVkgEibOxtflAC4nOVCRoahcfAO4i5CnJ1Kk3CiB+In3aZDo2Ih22yK9eMB6wHu5oaJZAIrkjnYw5ekVSYGGCQScpz3m5utfC6TQgFIX7wr6Z7DespCAkSw6JDaVGpzVYQnBcmL7GVlnJ5blQLwv6TzykilUr+YxlqXEOqLCKgaBHbcDrfN/uojYV4wDdgxiNkhjPMXIzl/9cELL1WzLpJjwyqIFs7Guqb9Yw0V5P/S37xGt6qOhps8aq3K4ndu/4pBQCeSRNhqNHqMsrOZWlk6mPn6tc4=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW3PR12MB4409.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(136003)(346002)(366004)(376002)(39860400002)(396003)(451199018)(31696002)(31686004)(36756003)(86362001)(44832011)(5660300002)(2906002)(38100700002)(478600001)(4326008)(8676002)(54906003)(316002)(41300700001)(66476007)(6916009)(66946007)(66556008)(8936002)(83380400001)(186003)(53546011)(6506007)(6666004)(26005)(6512007)(6486002)(2616005)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZWZiWXlKTEYxd2paeFlsU3R4VnBuZ1ZNbm1zOUhWZkJKRmhmc0taditlYnhI?=
 =?utf-8?B?dlVvYVJFR1Nkb0VjNXRqcStkM3IvU0tIdmkzUXZOUG9Kb2RLZDdId1dDR0w4?=
 =?utf-8?B?c3lFSHdrcEQ5eHFkMTRCdXZTZTlWYjltYUM3dEU0UzE2Nk5La2R6MC9pRjQ0?=
 =?utf-8?B?M1ZIdHdBbmU5OEhaNkFyQXRMT3dqWkgxc0dtcWNOdVlyS093a01NcVp5eUNY?=
 =?utf-8?B?eXRESm16VVV0dmUwNzFhU0VoOUVndzdVdkhzNy9yK2NNRnJYN29JNGRYUWlT?=
 =?utf-8?B?UlJrODlzWFJrMzlkblhBU1ZXOE9zNVI1QmEvRzA3VW00UTRpYmhTZEZTMExy?=
 =?utf-8?B?Y3BVU3c1dGU4NEhvSHp4cVhEZW00NzJ1OFFvRUlVQXAzSnFtZFkveWNtVVFv?=
 =?utf-8?B?ZlRKQ3pnOGtwV1d0ZWFyRXVFdWQ3WTBRVDEvSnJWeS9MLzdjUUZCWU5UQ1lo?=
 =?utf-8?B?MWsyYVdjNFo5RjJXZkhwc1dvWmsxUlQ3Ly9EeU9PM1gwcmJ0clhRMHlSM2Ju?=
 =?utf-8?B?dy9CUnhKZVhud2dMRVMrTFNiWlNuTkJGTU1TVXhTRlJmSlAxWFBvbVFMQmpS?=
 =?utf-8?B?UjhjNThNd1Y0NXR1eW5LUDNmSHFScDVQNkl5c05RVXhkL1duM0R2SHcwT2Fi?=
 =?utf-8?B?UW1wRE1JU3hrZUt5eEp1NE5SUWxGNlNqZ004cEY1OFhtZ2JnWHFRb0J1blBO?=
 =?utf-8?B?ekhCS0kzc1ZYUUh0VGxDMXdZNU14N3dXQUNuR25ZdW84UXpIU3lpQ2VqOXUx?=
 =?utf-8?B?VzVwMW5obHNTOUoxNXMwcTdlOEhrVkkxZGRvaExPQzV3MmxoS3N0UkFNWjNT?=
 =?utf-8?B?bFJ5bWNQbzRuakRBbkhwQWVTSzNIYnVMaXdScENhVnBWdHZWZ285UDF5Y0t4?=
 =?utf-8?B?cWxpL2lFam16TzF0RWFncG1WWVpyZHJNTkJJY0ZOR21HM2dxcnlIU3U1VW8z?=
 =?utf-8?B?SjhzL2g0TEpKeUM1dDIzRXN6RXkyRUovREJuQXNlZEpoRmlWU1hIL05SbS9j?=
 =?utf-8?B?ZHNoQ1FHc3Y2MEcxcHRsbHZZKy84cmFiNUY2UWlXV2k4cm1UbEhxcG04NzJK?=
 =?utf-8?B?dTY4dklqcnZBNHpIU2tXbTVXZ25wV29lbXpHUE9aZlZvRm9lZjI0aC9EZjZL?=
 =?utf-8?B?WTd1OEVYeFAwUUpPVXVtcC8raGNKVEt3aHh5TDhJaTJxZVRJaEIydHcvWm1r?=
 =?utf-8?B?ZVFKbVp0dXRmZ3dPSWVVRmxNeWR4amtqN3VHbnM5MitkQ1I4cmU4dWVYZ29p?=
 =?utf-8?B?UXpLNkJ5cnl5S0tEb2VhVUtSOUNSMlN6a0hHTXJKbCtPZ2FKSWJ5MW9HTGhj?=
 =?utf-8?B?VHVpNnJPVmVHZEZEdnVDT2E1ME5PKzhhZ2MreU5lWm1YUXdDSjY0UnU5VFgx?=
 =?utf-8?B?ckJYOXFjWmJYTm8wQWhGSCtLay9QWnhFQnl0VjlHNjBOVEdMTkNzbUNzZW40?=
 =?utf-8?B?SW9oaVQzRkFJWTV5R2swS3RkOGVwMFlTcmpzT2xIbTZ4Y1hGTExMYUh3cTIz?=
 =?utf-8?B?NVdRbng2Y3V1V0thSHZIWlByaWV4Mndad1FpNFJ2dlBwZ1BuZzdnTThyMTFr?=
 =?utf-8?B?dVV5ZkhrdG80Wm52RXVBU1dNYUMxYWdKMlluMGt6UlRpYWR6Q0MreStJbVM5?=
 =?utf-8?B?bHJrWldEbktUY0pVVXcvKzNYRlBUd1l1TVVoMDBCWEZHZUxoM1lxR3l0YXBF?=
 =?utf-8?B?dkhOV01JRGhpdFpwa1JWZlk1NDVhZE11aUloZTRrekl5YU12WFJNTDBIMVp4?=
 =?utf-8?B?c3M2R1BpRGUvRUhaazhTUUdJVE12NE9pUVBveG0zSjJXbU51VlhzSEV3SWRG?=
 =?utf-8?B?L1Rwc1EzcnNVN2s5aFVROWFXenV1WHppeUdrOHExRmRkTjZZRm8yVC96YjVr?=
 =?utf-8?B?YTdwL2NJajIxUmhqdXprNmdWbGVBODNIZlNxRGlGd3RDUFlpSXBsZlBUejBI?=
 =?utf-8?B?dEpuYWVNTEEySDNva2d6VmRrdDFxUk1HdUR3clVmNzc5R0Zxa1Z6OWhweGJO?=
 =?utf-8?B?RkJtTG9zdDA4OW9VMzdhQXd3WGJkMXl3SG1WQStidjhFZ3IyNFN1bE9nb3ZL?=
 =?utf-8?B?a3JrTDB4dzROaDRrbVJjSDFIV1ZOcG5mUlhrNFloNmF0WmN6U0NobVluSjFT?=
 =?utf-8?Q?O5ziE3RgOPylm79Xo4c2rPzxq?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dd6c4b61-12ca-446e-9472-08db0478be6a
X-MS-Exchange-CrossTenant-AuthSource: MW3PR12MB4409.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Feb 2023 17:21:24.2174
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8vQhypn0qtGaBRCzZcnZHp4+B/Ij2cf/40mNCXtxfaRGT/iWfxWd7Ri6VXJHCwe8FSQdl64PTMQj245RAm/H0A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4280

Hi Jan,

On 12/7/22 12:41 AM, Jan Beulich wrote:
> On 07.12.2022 07:18, Vikram Garhwal wrote:
>> --- a/xen/include/public/sysctl.h
>> +++ b/xen/include/public/sysctl.h
>> @@ -1079,6 +1079,23 @@ typedef struct xen_sysctl_cpu_policy xen_sysctl_cpu_policy_t;
>>   DEFINE_XEN_GUEST_HANDLE(xen_sysctl_cpu_policy_t);
>>   #endif
>>   
>> +#define XEN_SYSCTL_DT_OVERLAY_ADD                   1
>> +#define XEN_SYSCTL_DT_OVERLAY_REMOVE                2
>> +
>> +/*
>> + * XEN_SYSCTL_dt_overlay
>> + * Performs addition/removal of device tree nodes under parent node using dtbo.
>> + * This does in three steps:
>> + *  - Adds/Removes the nodes from dt_host.
>> + *  - Adds/Removes IRQ permission for the nodes.
>> + *  - Adds/Removes MMIO accesses.
>> + */
>> +struct xen_sysctl_dt_overlay {
>> +    XEN_GUEST_HANDLE_64(void) overlay_fdt;
>> +    uint32_t overlay_fdt_size;  /* Overlay dtb size. */
>> +    uint8_t overlay_op; /* Add or remove. */
>> +};
>> +
>>   struct xen_sysctl {
>>       uint32_t cmd;
>>   #define XEN_SYSCTL_readconsole                    1
>> @@ -1109,6 +1126,7 @@ struct xen_sysctl {
>>   #define XEN_SYSCTL_livepatch_op                  27
>>   /* #define XEN_SYSCTL_set_parameter              28 */
>>   #define XEN_SYSCTL_get_cpu_policy                29
>> +#define XEN_SYSCTL_dt_overlay                    30
>>       uint32_t interface_version; /* XEN_SYSCTL_INTERFACE_VERSION */
>>       union {
>>           struct xen_sysctl_readconsole       readconsole;
>> @@ -1139,6 +1157,7 @@ struct xen_sysctl {
>>   #if defined(__i386__) || defined(__x86_64__)
>>           struct xen_sysctl_cpu_policy        cpu_policy;
>>   #endif
>> +        struct xen_sysctl_dt_overlay        dt_overlay;
> For now your additions are Arm-only, aren't they? You want to use
> #ifdef-ary similar to what you see in context in this last hunk then,
> to avoid undue exposure.
In v2 there was a comment regarding "No CONFIG_* dependencies in public 
headers". So, i remove the ifdef.
Will add "if defined(__arm__) || defined (__aarch64__)"
>
> Jan

