Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A39B7B07CC
	for <lists+xen-devel@lfdr.de>; Wed, 27 Sep 2023 17:11:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.609096.947961 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qlWCJ-0003d5-Qf; Wed, 27 Sep 2023 15:11:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 609096.947961; Wed, 27 Sep 2023 15:11:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qlWCJ-0003bO-Mk; Wed, 27 Sep 2023 15:11:31 +0000
Received: by outflank-mailman (input) for mailman id 609096;
 Wed, 27 Sep 2023 15:11:30 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=3bhA=FL=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qlWCI-0003Zw-19
 for xen-devel@lists.xenproject.org; Wed, 27 Sep 2023 15:11:30 +0000
Received: from EUR03-DBA-obe.outbound.protection.outlook.com
 (mail-dbaeur03on2061f.outbound.protection.outlook.com
 [2a01:111:f400:fe1a::61f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2200fd14-5d48-11ee-878a-cb3800f73035;
 Wed, 27 Sep 2023 17:11:28 +0200 (CEST)
Received: from AS8PR04MB8788.eurprd04.prod.outlook.com (2603:10a6:20b:42f::21)
 by PA4PR04MB7952.eurprd04.prod.outlook.com (2603:10a6:102:b8::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6813.28; Wed, 27 Sep
 2023 15:11:26 +0000
Received: from AS8PR04MB8788.eurprd04.prod.outlook.com
 ([fe80::afae:3fda:c84d:bcdc]) by AS8PR04MB8788.eurprd04.prod.outlook.com
 ([fe80::afae:3fda:c84d:bcdc%7]) with mapi id 15.20.6838.016; Wed, 27 Sep 2023
 15:11:26 +0000
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
X-Inumbo-ID: 2200fd14-5d48-11ee-878a-cb3800f73035
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DRqpLWm28QAOGaQ6Ft1Fc6Z+kfFTTwS6mrE2FrdRS0D32O89P1/e6Ah+H9Pv/EMM7jwyZvyERWhxDW08KAIehvGXqcGlNBJBdryME3syh+xCd5ei5PnD858H6nSr3sRa5xvUjgv/jMtza02WBWCQLUDpTlMnyisc9y8M3KjA4mnPFLixpzvzjHqr2n9b7pwCcXwN1aH3OieYEinZrEQhsG+kAfh2oZDf9lBXTHT5l+PQ8MJt6zd+9m8xdLerIbshZGRwfkYdGJ1PPJrbC8X0lnoT6cr6lb9XQk0ysXIH5y8MErQfmGpu19tmCMws8j5ShC/2w/STFGJHuAhjWgt5lg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IOk+QKweONi2z8bAnwX4knNyXssB/MCcxlv0QAawzjg=;
 b=ma4Gv1zjDwfjoPUTYDpMaH/AHlDAE6EwbSeA8tyAo0nPkGVMo8i80eBZmYUbxEou2yzabjcdbS4PSMw16gdGEYSED8cem1fN2JFq8wvOZ6Q7ux5IShcMbO5Zf9S+fYJwi7qJr6hPSlM+MTI9yzsDh/OsBFZEeW1lX9skKS/SufKSB30sezXfnNGi7l06CVb/BnnlkkSs4NbqKcpVpEd/rXpjPitttMEz9Q5CHNw3owpYVwCUs8+7BGruKylBofoVh3CD+T1k4NcybLwbRwV3EyjkGzTDHGZBMxiL4zZ7jzmMZPlq3kt/5+nqn+qv5eGn4YAVMLd/Q8KG0qftxwLaFA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IOk+QKweONi2z8bAnwX4knNyXssB/MCcxlv0QAawzjg=;
 b=1fwe4EIOM0B01SgUXORJIa5O5bNx8EXofCzQsMqMPd0WLNYFdpBFt4qt05m/eFRZni2tdBm/f/9N0m6on1Gih9zXthnZYuhpgUPnFTMQygKxzLttAgAvs7NB+YUbHW4m3haueOddYre11qXXuvNA08SH2l1TveJWdz7Tw4cDHQNsGGHEk/kBKyBI/+sLx2Bk4T4OBBMolz6FISGenE6rhIBP0ttWHm8A/bITDpfZ4K8JaJAO/fNIL0gfD4JkfW1FvZFb3picHyvvydkd862F0Td6OdOG2aBkmT8Z9NWG+9S1384nsRFOs6v7zaNV/nwPYpE3I6P5OMkZPjdi3y3txg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <b4676564-166c-b316-b91e-a9af18a69768@suse.com>
Date: Wed, 27 Sep 2023 17:11:23 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH v3 4/8] x86/mem-sharing: copy GADDR based shared guest
 areas
Content-Language: en-US
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Tamas K Lengyel <tamas@tklengyel.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
References: <472f8314-9ad7-523a-32dc-d5c2138c2c8c@suse.com>
 <a79d2a8b-6d6e-bd31-b079-a30b555e5fd0@suse.com>
 <ZRQNHyggOFD1FuMD@MacBookPdeRoger>
 <6b55a773-c005-f524-531c-45247cac1d55@suse.com>
 <ZRQ2lHBHDlHJKYzp@MacBookPdeRoger>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <ZRQ2lHBHDlHJKYzp@MacBookPdeRoger>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0049.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:48::15) To AS8PR04MB8788.eurprd04.prod.outlook.com
 (2603:10a6:20b:42f::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8788:EE_|PA4PR04MB7952:EE_
X-MS-Office365-Filtering-Correlation-Id: 71cee6a6-df87-4638-8741-08dbbf6c04c6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	aJ+fur3yD0XoE1z1JSqIU+eHfHa78rUrbONChi2d+3FIyF/lZCfL63GWflBoxgoYsZ3MwdZZzn5PEaYqVYyM0CE1A2CE45pA3U3aTnOrr8KDeAsmhKAMCQgFxncghntCEHs+L56rWyPacEvcyVZuKnXcxci7nMXYNSQKGufnrWMaAbyIDJTHKuRwE8Gp++VIsevjFxrMLaw78AX9OpZSfOm78q71eWDIl3kVoDJY09oZIg+rvmRW7wkgsIWhkvR5AHDljlScVSKBqpEvdSX9C1PKUMrcZKUgo9PGvzVV0mgYgliTn9y4Rxj6MoTp23RPMETLjOU0EQt1QoUHJaPRhkqucidMHsrXjIrOapJPYxbesBYhKhXZXOi8ChetJVWzW/oij5z0vYL0UpyywPWJC6LsRTur4QtmA9lNVtXwUXGgToiEVCnxx5wyXOTVLA/dFrjXLCHJQkCeYqTaiDw8t4EldEYClrHo5nOWVVhbhDxNlqqun6QAb1s7XRc7L8rCDnOGfRF4X2eBqYTPhKwy8msLET+x90I0a8P8JLJgNZX1Mu6BzGVd/WZxymHYF1Mavb9jGnCHAJoxxfG8nXcT1qIfp6fDoueGaxawAfxS1mZVehE8DYqTGWg1P6n1jfgyUXkcneR8vxlyl22QppzQng==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8788.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(346002)(376002)(366004)(396003)(136003)(230922051799003)(186009)(1800799009)(451199024)(2906002)(6506007)(53546011)(2616005)(6512007)(110136005)(478600001)(26005)(6486002)(86362001)(66946007)(31696002)(6666004)(66556008)(38100700002)(5660300002)(54906003)(66476007)(83380400001)(316002)(41300700001)(36756003)(8676002)(4326008)(8936002)(31686004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?aWM3OGtzb3BRV3RNdVBWT1ExT3g5U013Mk9LcWRhZ0w5dkh0c3NBRGFpcUp0?=
 =?utf-8?B?VnZCTHh1SUpvd0tEbFFkN0x6YWxXR21xMzBwR01LZ21hb2pwM3hZTTlNQ3ls?=
 =?utf-8?B?YjhFKzJLTjRacCtQVXBnL2h0WXlhN1l5VGFrSVpUeW9MU1ZGSnA4TlZIcUk3?=
 =?utf-8?B?azJraUxOeUFPdVdPOWFxMk4rY0t6Qlkvd0Z2WWZrZ1Vwa3RKZ2JYVk1ia29O?=
 =?utf-8?B?ZTdkR2NZcUpaQXZYMUlQazZPQVdDVXNqa25iOWZYNWZxTjEzN3p5U3RnbzNr?=
 =?utf-8?B?UENkYm1ZU3FnS2c1TE5zVEd5MEhPS1ZxY0YydWtkcW4vbmZ0N1UzakxzMXFn?=
 =?utf-8?B?M0t3MFRzdjJobjZDNjVvcGNmNGwzQUgzLzB4YXA1cytrai96Y25YVzcvWjlS?=
 =?utf-8?B?bmRFVlFqbSs4T0lYVEVFYjVMWU5vcXowZzdNNEZVWWJtUHhRWVJlZnNTV0ZT?=
 =?utf-8?B?VjZZa1g1ZEZaTzI0RGF4VU9sV2x5RmZUeitsTm0rMllENTAxTUhBOVA1WTl3?=
 =?utf-8?B?L2svMEl5VWtGUCtUVjhCZnp1bXhwd20xUHI0WW5TSm5vUElrRkU4dWY2RjlT?=
 =?utf-8?B?Tlh0VjhZdENuR0FRdXc3ZGNqTHRramVvZkVvNE93Q1Yxd0FKVnVNTmFRYVNU?=
 =?utf-8?B?ZmU1KzFGUUtLWmVXMkQyNkUxSERta0twUXAySEY1Z3VHL1o0TU1DZ2ZlR1hK?=
 =?utf-8?B?c3hKZE9mUXY1N0pJZU5zeFE1aitBV252WGgyeGl4aUJ1WGJxV3ppOVZZK0Fr?=
 =?utf-8?B?N2JwdGVKN1FyVDVQZm1vbHZQcytSWlh3U0RaeEN5U1g5dk5KUjhYbm1idDlT?=
 =?utf-8?B?K3BIalhKZEltS0E3SUhlWk9VMWVnRUJCbHc0aWZxTUFSajVqaWplYW04YzF5?=
 =?utf-8?B?Z2c4R3FjN1V3Sks5a3hEVmpEZjVmWjJTYTAwbG1iT2dFTEUrUVFUd0FVSDlY?=
 =?utf-8?B?aHlHaS8zdVk1QVZxbzd2MXFEZmJyZGYxak5xVkdBdm5XOTJmVkt1UDJBQmFz?=
 =?utf-8?B?WGRpQTg2YkhtNWkvWXlXVklyUWpSa0J0VXZFOHpnNkVvNWhoVGpHTlcrTGhz?=
 =?utf-8?B?ZEZ1YVFlMit4TmR0L2gzUStnbVNyRDZFWFhjdGFmWWVJQnMvN0lOYWNScjd1?=
 =?utf-8?B?c2pRUTYzd1BseTZhZHBEaEw5ZWt5aGJtNFpGYTRHVmZMOTZVbmVHU1ZwL3Zr?=
 =?utf-8?B?MHB2cE4xNjgzUENxSlFxWjlMeXduQmUvN2pQYXhvVzl3elBoTWkwR3VPd1RQ?=
 =?utf-8?B?V2g3Q3Z1UmwxY0s1TWJqcWx4WS9wTVhic2dFWlRZRWxHNmdrVXdsUzlKVHVy?=
 =?utf-8?B?TGJ0a1dPUkdJSTZ2RjlwY01aamJ5cktxaklHRzY0U1pkSkxEODI5TTNQNmlK?=
 =?utf-8?B?dGVCVitOUGpiajliWU1jV3lwWEw5bEk4WkFRZ2FWUW1GRVFLRXp1UGdvRUtx?=
 =?utf-8?B?Ymlza2d1SGY5SWhrK2JwZUlWRkZCdE05Vk1zcHgzZVBFSmY1T21XTmtJK3pr?=
 =?utf-8?B?cmt5b0RXN3BZaEFlM0pPOUIvN2dOVWQzQy9BQ2w4cE5MVk8yU09aVVdIWUty?=
 =?utf-8?B?UGE3RUlyMm94bGZuWllCRkdvRXN3SWgyNTk3YWRFMlNySjhTZmU0TzlSTGhU?=
 =?utf-8?B?clMvZ3hxOUxMMlZUL1Y3VTA2U01WL2MyY3NJOSs0TGFsazNOL3lsaGVpQTk2?=
 =?utf-8?B?Ri83TUtaWklpVGNRVlJpZ2NDWnlvdzJIMjduaDJZdmV5Mm44ZU80SEVEWWwv?=
 =?utf-8?B?TEx2dHQvYkxmYy9HV1QxQjlmRi8xc3VsdGJLREphdzhsa1BvWjJtY3I3d2dh?=
 =?utf-8?B?c0N4K2xtRXJWM2lwdm1jL2Qwck5JaXVKbHN5ZUZ0aCt4RW9zazBrSkhtWGpL?=
 =?utf-8?B?RDVNSHoza0hSYzFpdmhQM3JhbkRKNjVrSzBSMnFWODVCMStLalhFUEtZOER4?=
 =?utf-8?B?cWlKQXFBTGFxYmFyOFhBbG5ta0NGaUpDWUZkdEdTZWZwb0FOM3RrM3dRRklw?=
 =?utf-8?B?ZU1wQnB1elFFYkgzYlJNU0RyYnkrcUpxSE8ycUJYbXdhZDl0OEtNTWVhRExV?=
 =?utf-8?B?b0pSYzYyWEpPbVVRVHVuV1M4d2VLL25MTVVRRUtpa0lOVTNSUWVFRWpDNXB0?=
 =?utf-8?Q?h86m90u93UZ5OHqgQxEDJNhN/?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 71cee6a6-df87-4638-8741-08dbbf6c04c6
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8788.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Sep 2023 15:11:26.3177
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pBOsHTInKUSQNhLhgpTxU7m9hMZYW4ojb2kMk/L/K9w05v+9cZtLJgPLWatZQ2VUTSvLy1tU15sFLw3wZ4JQ6g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB7952

On 27.09.2023 16:05, Roger Pau Monné wrote:
> On Wed, Sep 27, 2023 at 02:06:47PM +0200, Jan Beulich wrote:
>> On 27.09.2023 13:08, Roger Pau Monné wrote:
>>> On Wed, May 03, 2023 at 05:56:46PM +0200, Jan Beulich wrote:
>>>> --- a/xen/arch/x86/mm/mem_sharing.c
>>>> +++ b/xen/arch/x86/mm/mem_sharing.c
>>>> @@ -1641,6 +1641,68 @@ static void copy_vcpu_nonreg_state(struc
>>>>      hvm_set_nonreg_state(cd_vcpu, &nrs);
>>>>  }
>>>>  
>>>> +static int copy_guest_area(struct guest_area *cd_area,
>>>> +                           const struct guest_area *d_area,
>>>> +                           struct vcpu *cd_vcpu,
>>>> +                           const struct domain *d)
>>>> +{
>>>> +    mfn_t d_mfn, cd_mfn;
>>>> +
>>>> +    if ( !d_area->pg )
>>>> +        return 0;
>>>> +
>>>> +    d_mfn = page_to_mfn(d_area->pg);
>>>> +
>>>> +    /* Allocate & map a page for the area if it hasn't been already. */
>>>> +    if ( !cd_area->pg )
>>>> +    {
>>>> +        gfn_t gfn = mfn_to_gfn(d, d_mfn);
>>>> +        struct p2m_domain *p2m = p2m_get_hostp2m(cd_vcpu->domain);
>>>> +        p2m_type_t p2mt;
>>>> +        p2m_access_t p2ma;
>>>> +        unsigned int offset;
>>>> +        int ret;
>>>> +
>>>> +        cd_mfn = p2m->get_entry(p2m, gfn, &p2mt, &p2ma, 0, NULL, NULL);
>>>> +        if ( mfn_eq(cd_mfn, INVALID_MFN) )
>>>> +        {
>>>> +            struct page_info *pg = alloc_domheap_page(cd_vcpu->domain, 0);
>>>> +
>>>> +            if ( !pg )
>>>> +                return -ENOMEM;
>>>> +
>>>> +            cd_mfn = page_to_mfn(pg);
>>>> +            set_gpfn_from_mfn(mfn_x(cd_mfn), gfn_x(gfn));
>>>> +
>>>> +            ret = p2m->set_entry(p2m, gfn, cd_mfn, PAGE_ORDER_4K, p2m_ram_rw,
>>>> +                                 p2m->default_access, -1);
>>>> +            if ( ret )
>>>> +                return ret;
>>>> +        }
>>>> +        else if ( p2mt != p2m_ram_rw )
>>>> +            return -EBUSY;
>>>
>>> Shouldn't the populate of the underlying gfn in the fork case
>>> be done by map_guest_area itself?
>>
>> I've used the existing logic for the info area to base my code on. As
>> noted in the patch switching the info area logic to use the generalize
>> infrastructure, I've taken the liberty to address an issue in the
>> original logic. But it was never a goal to re-write things from scratch.
>> If, as Tamas appears to agree, there a better way of layering things
>> here, then please as a follow-on patch.
> 
> Hm, I'm unsure the code that allocates the page and adds it to the p2m
> for the vcpu_info area is required?  map_vcpu_info() should already be
> able to handle this case and fork the page from the previous VM.

I don't think that's the case. It would be able to unshare, but the fork
doesn't use shared pages aiui. I think it instead runs on an extremely
sparse p2m, where pages from the parent are brought in only as they're
touched. Tamas?

Jan

