Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DC37735BF0
	for <lists+xen-devel@lfdr.de>; Mon, 19 Jun 2023 18:11:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.551217.860633 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qBHSn-0004RN-S0; Mon, 19 Jun 2023 16:10:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 551217.860633; Mon, 19 Jun 2023 16:10:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qBHSn-0004OU-Mw; Mon, 19 Jun 2023 16:10:45 +0000
Received: by outflank-mailman (input) for mailman id 551217;
 Mon, 19 Jun 2023 16:10:44 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Jerb=CH=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qBHSm-0004OO-Gt
 for xen-devel@lists.xenproject.org; Mon, 19 Jun 2023 16:10:44 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on20608.outbound.protection.outlook.com
 [2a01:111:f400:7e1a::608])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d6a6bc5d-0ebb-11ee-8611-37d641c3527e;
 Mon, 19 Jun 2023 18:10:42 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM8PR04MB7764.eurprd04.prod.outlook.com (2603:10a6:20b:244::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6500.36; Mon, 19 Jun
 2023 16:10:37 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e442:306f:7711:e24c]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e442:306f:7711:e24c%5]) with mapi id 15.20.6500.031; Mon, 19 Jun 2023
 16:10:37 +0000
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
X-Inumbo-ID: d6a6bc5d-0ebb-11ee-8611-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=i+B6vlinyKn/o5yBkzajp1bm+x/rixNA34QXPzAZNI1H13nJl5xG7CWuWmlDVuTM5Y+BCm7um4hOLmeo5ZGEgZh6fLUXDJRwlJcsbqovA/FM+sl9rDA2KLsuaEPvqOOnpxSkgmaoglAMeDXku1N3X4KJmdwJRK+QhRCsVjgIJOyQZrL6/SycOr72K+TIkuNZjTIfzBbafPmV6dLVRdTEsZxO3SaFoN4T/bFRdIiLl5K1s4WOvcpmwzmab6W2xPenVjEFY0Zo0cQmiRZLz76VsX+O5xks/vq72sTCOZ9IAwd1aEyAO0l9GpUJ0eLOAJ6XXr1GMU8jOYNZO35WdM7V+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bJ3ZPC+S6x+yP1dQlKuoBWeryTM70zr0VRu6ptJED5A=;
 b=nP+jVR874CETSDRdNvGy0K6vqalKq0iSPSptxNgQV7Vd5NrP9uLpzPlnc1QV/YHNxhizwULCo24RKO+FsZDq1dWiijdK0i2s7Z0V0g83u/ByhZ8DUQlzSM0IKoC75D3LSdx0SBDnt0NFKSZ1cRi8YPz3F4AvyYx6VrG4ROLpT60D3Xm2r87ayXZ38esnxvnTkUUKpWdtEWBeqHeXrx9JJB+t3SVjT7LDz3NXi+E01mwBc0HDbj/8bB1AydyJd/izwNV4007wh/HZWhH+t2sT5y4mAc9JFAimJ+oDnuxhJNv+sgmfjbGSyCs3y7n+DoR6TsxzC+NxRUAkZpcL+aNnug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bJ3ZPC+S6x+yP1dQlKuoBWeryTM70zr0VRu6ptJED5A=;
 b=Ugpkr8oCrVpfht8zax5oCEJgmaxPv1yZBGrmePNyb0LLdvUoPZPrqge5m8KqurVVlH6rm88eVu7j+ijeAaM1CoMjmmyMDefXEQMLbAKSz9dGNd8qFKj42xULJUacww0irmafBoPQZWezVlX/6rA+R5AJEUU1roIE28v1lgcHlT/5ul8gI97tnlOwp+Mp5lNLCNFOUxDp+zWHzPQhK+Rsl1XoTppV2QdOfhOemwlymw+skOT8RAoXNEzf7qUZ2m+jHC/ukIncsXZitxoeLMdcjsyFrNKcxXVg2D/eV4eUKib0ujJh7snSyT8VDrGUahqO5gW6jXqfXHgR8i6WQVYJsw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <ad16fef3-f022-9ffa-7aa7-bdecf41e715d@suse.com>
Date: Mon, 19 Jun 2023 18:10:38 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v3 1/5] x86/microcode: Allow reading microcode revision
 even if it can't be updated
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Alejandro Vallejo <alejandro.vallejo@cloud.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20230615154834.959-1-alejandro.vallejo@cloud.com>
 <20230615154834.959-2-alejandro.vallejo@cloud.com>
 <b3543c89-9df5-53dd-2b11-aff83211187f@citrix.com>
 <3a92fbe8-a9b4-f671-7895-c4d8065b61ed@suse.com>
 <867ebb90-2bd4-7500-d6db-0af08efff88c@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <867ebb90-2bd4-7500-d6db-0af08efff88c@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR2P281CA0018.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a::28) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AM8PR04MB7764:EE_
X-MS-Office365-Filtering-Correlation-Id: 6c8d0d1c-d92f-4737-494d-08db70dfb83c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	5WwP6DWzD0mN5yFbnhIjN/QHQooKZPhvAlAUnjXCHuefCT4l63RvSTfKIU0GoiwcNQ9kBb4KlyLJydc4bhFkXd/Wz9ymhqa7qr1YoDCW5SzikRcz6p8hziyLEn4zvS+CumPULTgI4uBca8ZjmxHhy51rGWIo+fLdh0xOLykvSIOWfxGKw1VlkikmAclFxVXbysTWf1CnM/fu4gXgEyD2jS88QpcFh7+rES66CfXx75lH2Gx+Zj+/vvlKQaCYZMxAH0HvL4A9kTtgN8vT3E9GeskAOaqxTGt4yjiPs/JoG185msPwHJ8aLclP/8ZhhKTJH4aF0VV4inTHamgpZ1aw/kKY0pvUyls0+ajp9FFzA3uFmloAuDPm8msVAroJmclHZVY8o4fWksXYfhknrvxCvTME5wpY2SapKmEURtCmwyAESyh90hv1oLshv3l0k3V+eZv1dew4tMRf/UazIwcEwme+KMtKOxOX8lKhkEMWYTWWM3LuQdzEZURsmw+uRCP334ft0IgSKQnajVqepAWQWwAy+UkK0SlckWZcowJG49dYxasZIAU/RI+SnW8VdI/aydAEG55q+76eWdQNYmw1+mSQlS/+sbMLvDXbRZitar6236R/WdGUTL72F7TjYa6n+uS+F1F8d3A5NA/TXFoBYw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(39860400002)(376002)(366004)(396003)(346002)(136003)(451199021)(4326008)(54906003)(478600001)(53546011)(6506007)(6512007)(26005)(6486002)(186003)(36756003)(2906002)(8676002)(41300700001)(8936002)(66946007)(6916009)(66556008)(66476007)(316002)(5660300002)(31696002)(83380400001)(38100700002)(86362001)(31686004)(2616005)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?LzlKaVFDNXo1QkdoS2REY1pacnV2NWdFNU5Cb05ZZjlnS2dGd2U3NjFJWURB?=
 =?utf-8?B?dytSeHUzMVdtcGhRaXpsUlMvQXM1ZDRYWFNXK3I0YjErZWFOR0R1K0pIUlF6?=
 =?utf-8?B?ZXU1amthUTNvWVR3Y2MwK25TblJXNUZWKzRraDYwVjhaeEJvQllXdmw0bU1K?=
 =?utf-8?B?S0R5cG5HbGpCMlc3YUJPaXNvR0tJQ3FhNWU5K0ZjUHpCRGFLTjc1ZGNkVG1F?=
 =?utf-8?B?ay8vYmgwenBxeGZrWkp3a09QN2R5RzEzbHdRRGkwOFV5d2dueXJFbzVrcENS?=
 =?utf-8?B?OGV2d2ZKT01JeDgvZW5kLzJkZDB6a1BaWEp2Zm1DYjhXci9PWklNbDM0U08w?=
 =?utf-8?B?czdwblNHZWdjZC9RYWxpRmpSRlR0bDN5d2RseGFqVDFFa1dWTnJjS01mbXJG?=
 =?utf-8?B?OXdBY25CbU5rOXIvOHBOS3NSb2R4VCszQ2FqOGxHd2t5SFVFYldWWC9GWVpQ?=
 =?utf-8?B?clF5WitpeVNoZGZLSjNIOWpoSm00U0I0ZzUveGtKVk9DamVxVHl4NkVENVcv?=
 =?utf-8?B?QzNQZlkrb1BwczkwT1NJVGZTR0Y4YzE1aU9kTzg4NVdUa1NGdGVBTE1icWpK?=
 =?utf-8?B?UmFaSVdBMUlEc3NOR3VUd0tuZEhFaHMvTkpVZHE0QzdmaXFLQmVEaHlxNlVr?=
 =?utf-8?B?WGFna1Q5dlJyT1p2R3FiWXhKR2dQUUVnVkQ2QVA3RUg0eVFDbElIczBiYmN5?=
 =?utf-8?B?YkFOOFdYbld1ZjdneDM5N29RMkxwemFlSmVlbGducEVkMm1HdFM2V2oyL2th?=
 =?utf-8?B?NGlGdkRncVBZdWJneDRwWmZsVVJIVDhWNEd5bUdwZWNoRVJyM0R4d2JPb1RV?=
 =?utf-8?B?VmpCS3lXcys4WFlaN1RVdnpkV1NkVEZVcTVKUW9aS1dGVWhGZzBEckVIZW1G?=
 =?utf-8?B?QlE4SFBVRG8xNFlqTmhkSVA2cEJWV0U1Ym9FVTBLVmJpdXhtTmlFVTVkczlh?=
 =?utf-8?B?dk1ENTJtcFlpNjlaMU92WjVjNE1uUW16UTFXUHdJZzg5WlVnTWRPbnJKLzFp?=
 =?utf-8?B?d3oyYmUzTEJIaWNLNmdjVjkwWEFlUHZsb3crNTJvQ0N0Rmc5cXJ6NWxYZjRI?=
 =?utf-8?B?OHBidjNVZHZMNmt6YzRueHlHY3NYbkQvOHpROFFPSTZKVmNQWVdWNm8rMzNC?=
 =?utf-8?B?cERLRVVlTGRoQTdmMFhVajEvREllM2p6angzSTRnaHp4dlR6a1N0OS9sOUEw?=
 =?utf-8?B?TExrTHZUN2NJanNWVlBrR2hOakVLUXQvUXZWdFZ2cndRV1BZMGc0SkNDaWo0?=
 =?utf-8?B?UkZySUhHTGVWWmZGQ2hYMHNZK2NNeUFqV2l6d0VzNG1aMTBsVmNtZFFka0Q1?=
 =?utf-8?B?ZW9ONnZJZ09XSnJJeFlISnZFc1BCbHN2Q2tJZTN2TWV2R2xkaWpWT3Q3ckdX?=
 =?utf-8?B?WTFvN2JKTGdYcmc2eGVYaVNuakszYnIyNjF6U1I3NUJzbEE3Q1Faclo1ZTBT?=
 =?utf-8?B?b09xeVVOS01CWDgvZ1N4NWVvZ3JxeEdsUE4rY2k3dzNkc1ZWc1JPODBVQWdB?=
 =?utf-8?B?djAvVS9XbHlMMzJOQ1NWVnRhcVZ4eVdNaHJPRS9iWFpiS3BDNFNHb3B6Vm5K?=
 =?utf-8?B?WTFmeGd6K2dUUno4REoydFJjR1dDMXFUb01hNUpML2VwTFJFRGJoVW9MTW10?=
 =?utf-8?B?cWF6d0lldVdtTzJnazgwUjV2c3djT3BkTVdYVjAxZ0p0aWFnWDZtZlc3aWxI?=
 =?utf-8?B?Q2cwek5aSGFEVlh2bVNoKzlqSkZvMC82bzBUSnVQWk1OL1ZxWmZjZndOY01H?=
 =?utf-8?B?cGNDMmlBSnRwQTNFbmwwMTBwcWhsSjZab3Jyem1jYjNIMVFEOWswM0s4bXdW?=
 =?utf-8?B?dUlSR0tKZ28xMDRDeklHejZodGJMMm5BanhsUlkwNDV6OXpjU3YrZk14aFRu?=
 =?utf-8?B?Z0RmQlBYN0tIbU9sOUU3NEJiOEgxeWNOZVNOMVo4d2VoUVFLTTRlQXhacHBG?=
 =?utf-8?B?NVRzYk14VEpFYWFabmNaQVVBK3dWbUxPSklvQzlhTjZKNXRPbWIvZlMzZGp2?=
 =?utf-8?B?aW9NNmFXTHpuZllWeDBFUkZDTEpLSTd4RWFrY0ZVSG1kTXIxeTRydWJRWGNy?=
 =?utf-8?B?L3dVL2VyYldtZXVSZzFmc25FSkYwNWZrdEtyTUFKYnc5cmIwbFVRbVpsUFZ1?=
 =?utf-8?Q?wSmvkYZbKdnHdY4kDVnF9g3Pg?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6c8d0d1c-d92f-4737-494d-08db70dfb83c
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jun 2023 16:10:37.5891
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: upB08VbtulKKtxEDSkBmoVj5Rz9CpkLT4yb2wvPoHMFJ1lpWnPlS8tKP6UPDsp805XK1ez6ZscnANY56YypCyg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR04MB7764

On 19.06.2023 18:06, Andrew Cooper wrote:
> On 19/06/2023 4:58 pm, Jan Beulich wrote:
>> On 19.06.2023 17:49, Andrew Cooper wrote:
>>> On 15/06/2023 4:48 pm, Alejandro Vallejo wrote:
>>>> diff --git a/xen/arch/x86/cpu/microcode/core.c b/xen/arch/x86/cpu/microcode/core.c
>>>> index e65af4b82e..df7e1df870 100644
>>>> --- a/xen/arch/x86/cpu/microcode/core.c
>>>> +++ b/xen/arch/x86/cpu/microcode/core.c
>>>> @@ -750,11 +750,12 @@ __initcall(microcode_init);
>>>> @@ -860,6 +861,9 @@ int __init early_microcode_init(unsigned long *module_map,
>>>>          break;
>>>>      }
>>>>  
>>>> +    if ( ucode_ops.collect_cpu_info )
>>>> +        ucode_ops.collect_cpu_info();
>>>> +
>>> I still think this wants to be the other side of "ucode loading fully
>>> unavailable", just below.
>>>
>>> I'm confident it will result in easier-to-follow logic.
>> Yet wouldn't that be against the purpose of obtaining the ucode
>> revision even if loading isn't possible?
> 
> No.  The logical order of checks is:
> 
> if ( !ops.apply )
>     return; // Fully unavailable
> 
> collect_cpu_info();
> 
> if ( rev == ~0 || !can_load )
>     return; // Loading unavailable
> 
> // search for blob to load
> 
> 
> This form has fewer misleading NULL checks, and doesn't get
> printk(XENLOG_WARNING "Microcode loading not available\n"); after
> successful microcode actions.

But from the earlier version and from what I've seen in patches 1-4
so far, I expect patch 5 will introduce a case with ops.apply being
NULL but ops.collect being non-NULL. Otherwise I don't see why patch
2 does what it does (sacrificing cf_clobber, albeit likely not really
intentionally).

Jan

