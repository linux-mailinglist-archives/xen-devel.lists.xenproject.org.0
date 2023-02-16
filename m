Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A64FA699874
	for <lists+xen-devel@lfdr.de>; Thu, 16 Feb 2023 16:10:29 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.496616.767454 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pSftp-0004tI-Q0; Thu, 16 Feb 2023 15:10:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 496616.767454; Thu, 16 Feb 2023 15:10:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pSftp-0004qW-Mw; Thu, 16 Feb 2023 15:10:17 +0000
Received: by outflank-mailman (input) for mailman id 496616;
 Thu, 16 Feb 2023 15:10:16 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=/MZc=6M=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pSftn-0004qO-UZ
 for xen-devel@lists.xenproject.org; Thu, 16 Feb 2023 15:10:16 +0000
Received: from EUR02-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur02on2060f.outbound.protection.outlook.com
 [2a01:111:f400:fe16::60f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 032cfbec-ae0c-11ed-93b5-47a8fe42b414;
 Thu, 16 Feb 2023 16:10:13 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by PAXPR04MB9376.eurprd04.prod.outlook.com (2603:10a6:102:2b2::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6086.24; Thu, 16 Feb
 2023 15:10:10 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e138:4fc3:705c:d178]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e138:4fc3:705c:d178%7]) with mapi id 15.20.6111.013; Thu, 16 Feb 2023
 15:10:10 +0000
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
X-Inumbo-ID: 032cfbec-ae0c-11ed-93b5-47a8fe42b414
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NMxAKk8eIaoITgXRSITXPURn777shLwDdi340fuukL0O7pnAUcfWbtfHCUNJ8o3FgdnT11BUqtlrt9VzpA5ahzx0uhqnkyNI2U1+0cW8pOwlTzR1fgL68dO8TSPtyHac0SsuscWAowcI5lKyt5xcmHHLktIhk1HK2MsN8ygv+gHQzF1iQlOrtxfDP7Wdj5iYxp47+MAswVQYn1eOgupSw4cCq675cfuho20qhYHNq+Lww1YsS40U0JZxyP7TyQUVmO0KIirXmeWMQmb7Did5FesSFORdtIkxEwcaBavESJ+J+NGOCadad0bcp5hRcQ4ZVCeSuXNeVyrizHRlSp4GGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=y8zktC+YTutI+6oJLdvcWE3CfjXCaj18oHFnrK2D7iI=;
 b=TAIuH6O63EWoq/DbrVRkgQeik2ZAyb4PzSUKH8mPnSp2T90Ox/g0YYD5M20tXw73oc4KobGTs8FrRxGedZVyWE+iwxJwJFbqEFFxvvwfcLNbAVxeU2QRJ4focwZZp3XtJTGjySA3ab/T6lCEkuWF3RpzeYeuG/NdPJqdI2aZXWBRyRnKgBcP1mk9JO+n+VcNPKMkMV35L52SWrI6ScYzk4ffAlqg7RZ2BHaf1qmFq97Kb6qvhWoN0Tv+W7Lp2fCCms9STKLD2FL/6ykHyFYAMwfHUgHhhpqKddQrsfITcLTWN3ZWf1dkd4hOolDUfqOUQYPjgkMJLx5j/FKv3Ff3Ng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=y8zktC+YTutI+6oJLdvcWE3CfjXCaj18oHFnrK2D7iI=;
 b=MimMdpEztWPVNY9WXOSAXhuUdtbEM6aDGBOCfWcEGOe8LrZKZQRjm0Uk02+nQpyN2XwCS6dBXbhfK4RYqNELldVpAkDEWurwqKCjVm1OUYSmS1fy7iUJuPpke27mtX1jM/ci1d85JyM6dpRu9BO0L3gH4m3747l4/+ZSzSDua8Wt0P/0blzjvonRv4YeZgJQ1kwITgwha3B7W4dQ8mmWdYBcjbXh1McN95oG5+wH+/TG3VX+LvTq21fQuGfV+tNdsw8BmSs4PVVJvabffK9F5FydpMnWesCbmaY0LUBYI9YXbVkQmZy0HnNtqTP4GeoOGtWLvlt3+N4BPX1F3RZzBw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <ae332c37-f450-fdb2-fe29-549985be927f@suse.com>
Date: Thu, 16 Feb 2023 16:10:08 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.2
Subject: Re: [RFC PATCH v2 1/2] xen/memory : Add a stats_table resource type
Content-Language: en-US
To: Matias Ezequiel Vara Larsen <matiasevara@gmail.com>
Cc: Matias Ezequiel Vara Larsen <matias.vara@vates.fr>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, George Dunlap <george.dunlap@citrix.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Dario Faggioli <dfaggioli@suse.com>, xen-devel@lists.xenproject.org
References: <cover.1665138677.git.matias.vara@vates.fr>
 <af6032c9f5863b7e6fb183a0a197407ec92bb067.1665138677.git.matias.vara@vates.fr>
 <283a8095-3046-3324-3e8a-8671dc1ee8e7@suse.com>
 <20230216144856.GA2137216@horizon>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20230216144856.GA2137216@horizon>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0100.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9c::14) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|PAXPR04MB9376:EE_
X-MS-Office365-Filtering-Correlation-Id: c05d4a6d-4d75-4feb-7391-08db102fe592
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	oMvD5LW8n9cqut69TIg+cfa2uzk4bg0GRmWfOEI6AIF25pio92lYCrTmAxOvBEC8v9+Newkx5c88J0wHIa7Cb4gKiYrrd68z52ZxHFvbkHNbAx2Xxe2JEgmhUEfIJ9j61oDy7hq4Dme61uY4lzNvhO8gZuGjF28V0/5OteITW8kgbADTb/z1/UzyPjBgmPFAnwk3IW/kWe5WBHXfSBz57GrVGb2UJFzulLs8SedmK7wYjSWbGCqoq4f0ErijxeQHROl6vIlqXmmc3oK5q0/SyM6XA9JM3WObHItwonWx6xKPE9ASnjlf0n60rBENfY8cB45WJUjkG1rxoxTMahXg1LAlvNFoiGGU9fkOT3TZ2UTNzh+xS4+hNAEwDQQ1eoNpCzRwX9B9ggmbAJ4KZaznvN13PRflCn7MbyX/AiIxA9VelMKCnL8+ZWAh/nlrN91pV4aRwOx9kJ6q1qUKVAynhjCxUMkvzIno6VZ/fVDp5TFKUdbDRGarL7XSuSp46rI1ji8QWMauSz86R909Va0DP3vsjC04b79YAhXzbL4ihpl6vHh2tQnphXxcpVcKuqCZgQ9AyZ7qOyzjjeBJajI/PkkidQXocVIjyVTG1wwJ0htfT5NfNx61ul5EfGbaRlUdM/r/6WSDy7Wib0gOT6L0Mt727HqrDw7P80vXL9HeaO79FDx3hXTssBiG3G1i6+QMOKCyYHkiZ9owXaYiJ8VNIIhdzzj186+P6RmR4w37K08=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(39860400002)(396003)(366004)(346002)(376002)(136003)(451199018)(38100700002)(186003)(31696002)(36756003)(8676002)(41300700001)(86362001)(5660300002)(2906002)(4326008)(316002)(66476007)(6916009)(66556008)(54906003)(8936002)(66946007)(6486002)(83380400001)(478600001)(53546011)(31686004)(26005)(6506007)(6512007)(2616005)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?eTZySjg1YllyRiszYjl3Zm0yVmdTUlNQWFFmTHpSY0YvS3JYbFRkVGtYMG11?=
 =?utf-8?B?dDJOc3pvSGkzWldEVlJqWHhNd0FrRXpFRk0xWjVweE5YM0hTOHN0ZFNpNytU?=
 =?utf-8?B?TksrVXlPa2ZTbGViTEdidkp6Z0ViODdVQUMwSHZVVDJSZVRteEJuemJ3Vm84?=
 =?utf-8?B?QWxVNlJRZXI4NWUxdVdHcmhQbHZCN2szOVRRU3BwY3hBYlpnS1p5bFNMM2lj?=
 =?utf-8?B?KzVadEYvMEtVY1g4djZIVkJOK3dJWldxcS9BMStMNXlhczRpT1RwbzIzZ1My?=
 =?utf-8?B?amhTUldEQmdwaG1BZXJKNk93UW1FNUVQaFFMTzl6M0tWeko4elJzLzFMZTg0?=
 =?utf-8?B?eUM0NnBGRXQrZFlVaTJ5VkpjSk9hTnpaSmxpcjIvV1paa204dEZjdC8zbjRi?=
 =?utf-8?B?N2VIY0FzQXlUcWNDeVk2QW1yNkNKVHByZ1VxTVFRcW9yenBjVDcrLzBUc1U5?=
 =?utf-8?B?WXg3dzlGL0E0ODdkb0xBTjVlbmFRczVUeDN0bnU5cFAxMHlXdFliRXovbDZU?=
 =?utf-8?B?bGJjZDlTUytDNE1yVS9HZC9hNS8xRkZxRXJiOTR3Qk5Cc2FJbFpsdEszM29z?=
 =?utf-8?B?RThUbHM4KzltSmhzbklzc3FpV1J6TUl2VTg3YWY0VUZrckFRUU5TaDRHbkN5?=
 =?utf-8?B?bDhSQXNtRkFkL09oMTZ1YW9vN09uZ3BvVUFRL2JRUjVtMEQ0SlBKZXVySlF2?=
 =?utf-8?B?K3NZK0QzMzQxQjZBUC9kYm8zNll0VmZ1R0djYXdyNHh3dFVMeXhTNlBrZURo?=
 =?utf-8?B?TWU5b1dvNU1NQ2ZaejlrbG82RStTMkNTZ2VTV1M5MlRMeGdYak1Fa2I4ZEVm?=
 =?utf-8?B?V2dSbzUwWUc2OU9Zeng5VDVlVjVyNUd3U2dBdGJIYWU1V2k4d1pKbmNscnlP?=
 =?utf-8?B?dy9UaXRUempQS3pIVktKSjNTZnZab1A2RDI5bGVITmNqQ1hpS1RRT3oxWmJx?=
 =?utf-8?B?NVFiTStJZXdQTjIxSHJTVEJSLzlJRy9xOVhlMzk3SUdGaGtmTjhoWFVWYlNI?=
 =?utf-8?B?SkRqUTFNbmc4Q2d2WDJuL2t6SGF3U3dlcWoxd2hPSWZMRjVlVlhVdUJNOUgv?=
 =?utf-8?B?RU5GZ3ZJc0FDN3pJRmNsUk1zVEQyYVo5SCtCY08rdTJUcyt2NlA5UlFxTlMy?=
 =?utf-8?B?M3hCeGZEa3lsTmZPMm9rZGdXWnpaMmZiNUJhNWcrTS9RSE9PRWFsVGMwMHgv?=
 =?utf-8?B?S3hKL1JORmtaMWN4M3pTK0YwMFh3TEhaamZWNDd3SXM2am92U2NLQVFYdjQ3?=
 =?utf-8?B?dExrMFNXTm96WlNTRFJsZXZmZDJCOVlHeUVoZmJLODFpWkF2Z0ZuM0ovUGtV?=
 =?utf-8?B?aWNNQ1BjYkdKMDNEbzhsYkhTOWczakRnTk05V2Z6OG5tTW9sSHhIWmpmOHVU?=
 =?utf-8?B?aHgydHlKSmtwS2VxS2gxQlR5SjJjamJoRzNBSFgvUjRWVVJkbWVXSmtGUStN?=
 =?utf-8?B?OHMzNVZFR0FBaHdaN0pLK3dkWmtSNU5YWGdKNVNKUDJ0Qll6bHdKQ1JqVEtH?=
 =?utf-8?B?YXNCYTFaenFLZVVqQkd6RG9vUExuWlZvUkd5RGVkV0x3OUUxV3p2WFlNQWJ2?=
 =?utf-8?B?Z1pPTkY2c09KTE9INE5rcldZNmZ4V3VDRWtqZHBUeUVOOURuOU05K3F5T0pw?=
 =?utf-8?B?UzNqZ0RKRlRGMGdUMEg3dzRVeVlHdng4SWZVbWZ3anBNQ3dtejFvRlExTEJU?=
 =?utf-8?B?a2xMNmlUV0hGQlZKcGJGTUFKUlZpcjRUY0pqMnVGekMvazhmMVl6cEcwSVN2?=
 =?utf-8?B?ck00ekY0dXdaMEZnN1ptTDdjdkJjbWE5dWFCdG5YUG9acDFvblptZG1qOENl?=
 =?utf-8?B?eTVCY2NxUHMydXVUdWpTeGs5MThpR3lsajltVVFRcUtSQVJpbmlMUUdabi9u?=
 =?utf-8?B?RDJNSTZJL2ZhQ3RaSW9Wa1ZCQzRYenBHdmx3dGVQbXZmcHhXNFp0eFpPVGsw?=
 =?utf-8?B?TDNUT002bnc0T2oxMSttb0NPV3dZWGdkdlM4QU5Qb1ByamVFR0JZeTJJMGpp?=
 =?utf-8?B?Q3lJT0RKUkRYNjUyMmpsODlqVTF1OWpPR1l5eCs0dVNpN0tTWDM3U2hHbHdU?=
 =?utf-8?B?cU85MzhpWW9LRmJlRlB1U1plVE9ETFEwUUx3RU5UWE9sV0s1Y2FYTGFaQjBF?=
 =?utf-8?Q?osP6RSt7FXwxdTdznMf4uop8K?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c05d4a6d-4d75-4feb-7391-08db102fe592
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Feb 2023 15:10:10.6332
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tkF1usALW9JHexge3svsQUai9dcRNtXXpB1HAfqwYEDtA59kr8OxWo248LYT6buo3m8rpse9/demvvuJbRQGOA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB9376

On 16.02.2023 15:48, Matias Ezequiel Vara Larsen wrote:
> On Tue, Dec 13, 2022 at 06:02:55PM +0100, Jan Beulich wrote:
>> On 07.10.2022 14:39, Matias Ezequiel Vara Larsen wrote:
>>> This commit proposes a new mechanism to query the RUNSTATE_running counter for
>>> a given vcpu from a dom0 userspace application. This commit proposes to expose
>>> that counter by using the acquire_resource interface. The current mechanism
>>> relies on the XEN_DOMCTL_getvcpuinfo and holds a single global domctl_lock for
>>> the entire hypercall; and iterate over every vcpu in the system for every
>>> update thus impacting operations that share that lock.
>>>
>>> This commit proposes to expose vcpu RUNSTATE_running via the
>>> xenforeignmemory interface thus preventing to issue the hypercall and holding
>>> the lock. For that purpose, a new resource type named stats_table is added. The
>>> first frame of this resource stores per-vcpu counters. The frame has one entry
>>> of type struct vcpu_stats per vcpu. The allocation of this frame only happens
>>> if the resource is requested. The frame is released after the domain is
>>> destroyed.
>>>
>>> Note that the updating of this counter is in a hot path, thus, in this commit,
>>> copying only happens if it is specifically required.
>>>
>>> Note that the exposed structure is extensible in two ways. First, the structure
>>> vcpu_stats can be extended with new per-vcpu counters while it fits in a frame.
>>
>> I'm afraid I don't see how this is "extensible". I would recommend that
>> you outline for yourself how a change would look like to actually add
>> such a 2nd counter. While doing that keep in mind that whatever changes
>> you make may not break existing consumers.
>>
>> It's also not clear what you mean with "fits in a frame": struct
>> shared_vcpustatspage is a container for an array with a single element.
>> I may guess (looking at just the public interface) that this really is
>> meant to be a flexible array (and hence should be marked as such - see
>> other uses of XEN_FLEX_ARRAY_DIM in the public headers). Yet if that's
>> the case, then a single page already won't suffice for a domain with
>> sufficiently many vCPU-s.
>>
> 
> I taclked this by using "d->max_vcpus" to calculate the number of required frames
> to allocate for a given guest. Also, I added a new type-specific resource named
> XENMEM_resource_stats_table_id_vcpustats to host per-vcpu counters. I
> completely forgot the "id" in the previous series.

May I suggest that before you submit a new version of your patches, you
make yourself (and then perhaps submit for commenting) a layout of the
data structures you want to introduce, including how they interact and
what "granularity" (global, per-domain, per-vCPU, per-pCPU, or alike)
they are. While doing that, as previously suggested, put yourself in
the position of someone later wanting to add another counter. With the
initial logic there, such an extension should then end up being pretty
mechanical, or else the arrangement likely needs further adjustment.

>>> --- a/xen/arch/x86/hvm/hvm.c
>>> +++ b/xen/arch/x86/hvm/hvm.c
>>> @@ -741,6 +741,8 @@ void hvm_domain_relinquish_resources(struct domain *d)
>>>  
>>>      ioreq_server_destroy_all(d);
>>>  
>>> +    stats_free_vcpu_mfn(d);
>>
>> How come this lives here? Surely this new feature should be not only
>> guest-type independent, but also arch-agnostic? Clearly you putting
>> the new data in struct domain (and not struct arch_domain or yet
>> deeper in the hierarchy) indicates you may have been meaning to make
>> it so.
>>
> 
> The whole feature shall to be guest-type independent and also arch-agnostic.
> Would it be better to put it at xen/common/domain.c:domain_kill()?

Likely, and the earlier this is (safely) possible, the better.

>>> @@ -1162,6 +1171,88 @@ static int acquire_vmtrace_buf(
>>>      return nr_frames;
>>>  }
>>>  
>>> +void stats_free_vcpu_mfn(struct domain * d)
>>> +{
>>> +    struct page_info *pg = d->vcpustats_page.pg;
>>> +
>>> +    if ( !pg )
>>> +        return;
>>> +
>>> +    d->vcpustats_page.pg = NULL;
>>> +
>>> +    if ( d->vcpustats_page.va )
>>> +        unmap_domain_page_global(d->vcpustats_page.va);
>>> +
>>> +    d->vcpustats_page.va = NULL;
>>
>> We ought to gain UNMAP_DOMAIN_PAGE_GLOBAL() for purposes like this one,
>> paralleling UNMAP_DOMAIN_PAGE().
>>
> 
> I do not understand this comment. Could you elaborate it?

The last four lines of code would better be collapsed to a single one,
using the mentioned yet-to-be-introduced construct. I assume you did
look up UNMAP_DOMAIN_PAGE() to spot its difference from
unmap_domain_page()?

>>> +static int stats_vcpu_alloc_mfn(struct domain *d)
>>> +{
>>> +    struct page_info *pg;
>>> +
>>> +    pg = alloc_domheap_page(d, MEMF_no_refcount);
>>> +
>>> +    if ( !pg )
>>> +        return -ENOMEM;
>>> +
>>> +    if ( !get_page_and_type(pg, d, PGT_writable_page) ) {
>>
>> Style: Brace placement (more elsewhere).
>>
>>> +        put_page_alloc_ref(pg);
>>
>> This is not allowed when what you may put is the last reference.
>> See other examples we have in the tree.
>>
> 
> I do not understand this comment. Could you point me to an example? I used
> ioreq_server_alloc_mfn() as example but it may not be a good example. 

That's an okay example; what's not okay is that you altered what is
done there. There is a reason that the other function doesn't use
put_page_alloc_ref() like you do. And I would assume you've looked
up put_page_alloc_ref() and found the comment there that explains
things.

>>> +        return -ENODATA;
>>> +    }
>>> +
>>> +    d->vcpustats_page.va = __map_domain_page_global(pg);
>>> +    if ( !d->vcpustats_page.va )
>>> +        goto fail;
>>> +
>>> +    d->vcpustats_page.pg = pg;
>>> +    clear_page(d->vcpustats_page.va);
>>
>> I guess this should happen before you globally announce the
>> address.
>>
> 
> If I understand correctly, I should invoke clear_page() before I assign the
> address to "d->vcpustats_page.va". Am I right?

Yes.

Jan

