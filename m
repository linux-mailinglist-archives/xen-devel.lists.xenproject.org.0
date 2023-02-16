Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A76FE69987F
	for <lists+xen-devel@lfdr.de>; Thu, 16 Feb 2023 16:15:56 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.496629.767477 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pSfz2-00069S-Ok; Thu, 16 Feb 2023 15:15:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 496629.767477; Thu, 16 Feb 2023 15:15:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pSfz2-00066j-La; Thu, 16 Feb 2023 15:15:40 +0000
Received: by outflank-mailman (input) for mailman id 496629;
 Thu, 16 Feb 2023 15:15:39 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=/MZc=6M=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pSfz1-00066d-N4
 for xen-devel@lists.xenproject.org; Thu, 16 Feb 2023 15:15:39 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on20605.outbound.protection.outlook.com
 [2a01:111:f400:7d00::605])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c41e528c-ae0c-11ed-93b5-47a8fe42b414;
 Thu, 16 Feb 2023 16:15:37 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AS8PR04MB7749.eurprd04.prod.outlook.com (2603:10a6:20b:2a9::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6111.13; Thu, 16 Feb
 2023 15:15:31 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e138:4fc3:705c:d178]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e138:4fc3:705c:d178%7]) with mapi id 15.20.6111.013; Thu, 16 Feb 2023
 15:15:31 +0000
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
X-Inumbo-ID: c41e528c-ae0c-11ed-93b5-47a8fe42b414
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Sqt018hGQNdhZnOgWp0uuqQ8GHGJvA/2Q+vWcZ8joyBxhcj62kGFCf4s8jytBaMZwFiJd/LI7uJ2XTQLkFFOd3TZf7bz+xbbVwjZjISUJzTp3eVaYXuoAPfB869gAopUMDCX+kzNhmW+J5rp1uhMXV43SqZh2HU5XEXuRR7m4Taqj29d6LfJ87VvHid7Bj0pd/RbnngIh+cUxjsNFhWbIh6xHLgEgrZfeLxfkTJDpzUE0TecY8viGDzW2Ay87+yw+qvhO97zaIxP6bdTYkRqpFpGHnkLl5L5Gx6eB8Kx6WikyeBdhezQLtWZd4pekbiqgOawzho70eDMnW137GMFTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hGT+yRH7i5ZbGzCexLdhZ+NAB8BYdENkuC3u4Hrk6RI=;
 b=KIsZjaFDt1hTNXh7LjQSk3NR4GC+moOARrwQr9vpM10Wp+k/Phn33pSiikSoZPxc1XMAIRM3a7uE/aXc1yu5hj7rau/Q55iNRVhLyqm0u9dglU/M6z7VM+ULw/iyj2CGG9Molxo3Et7K5VRLzEpG3O3hXIAKR8kOvhICnN2tjMCgc4FgIrvepzikWsjSIZRQy9hkyeKarswesyAUXsIhClhY4HyGN3u15TuWlbft13aJswGqxW09DcqV73B27WA/z2IdHlKz7lDCxOYEI8Leqxuoi/1ugxLdaRoUukWylvXyQkelD9/soQqw94eeov5g/sPfg7uAHB0BZDUJDBLiHg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hGT+yRH7i5ZbGzCexLdhZ+NAB8BYdENkuC3u4Hrk6RI=;
 b=iaNG4m4SUI8XtWYBlpXiFgioeZai9/HoiFVTbQhRww7D9QMYjI4cS1hwJjgPBgXJGhGtY8I0PmuVIJPPdVVBcwtfclmcElWMks6FJguaeqO9kfkgUmVfaGrijpgQ4QnJ7IgvVDPDTrU4XIQ+aPu2HbxEKYEqAdnCB/FLnagTVMxLcKlap+FE0dRW68XnAZWZ/bmoUOlzFvwUZGJybDVAl+PQ1eTOooJfnax97T3s1Dm7hiSC+yJNMx2KjqWOzgKy9tQvMCRvYyqV0ptJwVL2hBH/qpM7e1K/4uSJHDN6QNZu9Ib36tVJuZnQ6jNouA7b99M03ud1MIFZaXe5bbGAHQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <ba0c8c8f-894a-0ec7-4339-0537952f781a@suse.com>
Date: Thu, 16 Feb 2023 16:15:29 +0100
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
 <b59b6466-8d06-f7af-beb9-3c38c638a455@suse.com>
 <20230216150734.GB2137216@horizon>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20230216150734.GB2137216@horizon>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0059.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:93::13) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AS8PR04MB7749:EE_
X-MS-Office365-Filtering-Correlation-Id: dc31dcb8-0f29-4a3d-f94f-08db1030a4c4
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Hl5SCqTSaYaMW5kEve2Qu8mw6prM88rPJysNMY0fhOO2duDrLZvwOSJqP9rz64tLO0y6jS20biKDI7W0APu1rAwXVQ8qRjQfAgwyToI2R1d+DknGIYb2heppl8QjDf3y5mWXeTXL6zUBUKqeqAJkzwP/OekQJ8W7WDNaDLM60fYU89jEktVo5h45ICQHkrjCbOePcESbcDQ7b65494jxztU/7xwM3tSTn1deDBNaPFfbGdfd3yELjsNWgGs1ffIpNZ6lVkMps9IzqTjQZwCxBC+DumCTafNynADhTty1MPUFfABeQYV6mMKIk8yACNsM+pmyvBoda6d4jfUshSXbMMFFOC9RAtznRDoOaAYJhSt3Q6zmy42C5xY2Hj30bGgN65RW/uo17pQJwk6/sHVAkFZNsp4K7Oz3dV5Ki+dYX3ATyH27jJtzbs/JKDa0FJfv2lzJujCQYJP6jbJUfFN0IFAR2gVD7QUxbkTG/aatZES7+QHGqNEqrhtavSqEZp3TURwrhuznLax2+GZd1hgRqSsgqGi8Wg/3yU0rCXh1io0Nu2F8SKCHs5SsppCgOPg1Mvvceww28cz7nQGLv8RbqbCX6UXPKvAdWuJuBpAxfW1ZbNYeuNsSTxxasemZyLCiWGE6JucJrSqfkdTJG6nXwkqS6HNh0kKkR3OUIfg/N9yLT/rLt/Q9OkbCRDSUK2DFYbyLrH2CKsDIiBkSvjrZSFOzWNmqqGWPlxkZGY5crvU=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(366004)(376002)(396003)(346002)(136003)(39860400002)(451199018)(6486002)(478600001)(83380400001)(31696002)(86362001)(38100700002)(186003)(26005)(6512007)(2616005)(6506007)(53546011)(8936002)(36756003)(41300700001)(2906002)(5660300002)(31686004)(4326008)(6916009)(66946007)(8676002)(66476007)(316002)(54906003)(66556008)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?b2hCUnlNMEFqbU1Vajc1WTNOUVphRUl0M2dWVXl5MHNERzMrMm9VdjJuQVpm?=
 =?utf-8?B?UGNCTVVGZk1FL29WaXIzMzVNc1FkeTdBaGdOK1ZLSS91RXVwTk9FRnN4ZjBF?=
 =?utf-8?B?OUZuTnU5TXQyOTJzTUZRVnYwaTQreWtlTnNLOVM4M05ZUjlobDI1VXpXY05X?=
 =?utf-8?B?S2cyTWt3RmxNUnd5UkJaVjB6eWpBWU9wMWxVREVjaVg0ZzVGNG44TlJxbmpz?=
 =?utf-8?B?bUxEK2g2eG8xRDJmUDNtckwydUFCSHp1MGd4KzVOSUthV1BsTzVVM2h1TDRt?=
 =?utf-8?B?NkxBaEFxd1FFdjNEV2EvdEVLS0x4Y1ByTUZPTmU3c0EwVnJheldNTk1KN2VY?=
 =?utf-8?B?OTg5NWc0b2ZUVkxPM0N6akkxWHdENjdwbi9hcUtpSE1laVcxaDhlejJMbFU2?=
 =?utf-8?B?YVZxc015aXhtT1ZEZ0FCQTR6UFZKNFA0RmtlZCtCbXRINzBIQVY1Y2g1anV2?=
 =?utf-8?B?VXJHTnFTazR1V1A0VTVoejNMS2RpUnVHRHFocllEb3JaZFExYzV4dzJZZCs4?=
 =?utf-8?B?Z2pMQnMxWWtVN3dlSXJ4aVdNV3pkdUFXTmxTdjN3RHZtc3JTV1Q2eDd6ZWc4?=
 =?utf-8?B?Q1JKcHlSbld3VTFrakEwR0I0blFTTVhyUGtpS0QxR2l2ek5Yc1ZJd2pveVBN?=
 =?utf-8?B?THU1bWVvV2Q5NzFtK2xiL2RBdXVQRmFUYXRIcjZmU1d1TmFnaytZSVd5dVBz?=
 =?utf-8?B?SmE3TmxQOTE2SFdzakc2Zlp3YnpybXNoTlRsOVVwSExmZzdqWHEzakJGK3Rm?=
 =?utf-8?B?R2xoWmtNSmFGUE4wd1JLK2VmODFVTUF6eFJIc1E5TXpWR0g2ZE8yS0xIWTE2?=
 =?utf-8?B?QUhoeDNKcUxKQWxjZ3R3ekd6MHRlZUlST1U5dUlrV010eWRweVh5Y1ErQUJu?=
 =?utf-8?B?eTZXNjFUbVAyR25WR1ZvT2JJV1cvNjJVWUFpdzgzUWRhbFNMT2lmcDdmZkRL?=
 =?utf-8?B?UEEzQjhONVNIOVV1TjgxbzRUMG0vM21lNEhHMzIvMytXVVJhYnlkc0owRzNJ?=
 =?utf-8?B?c2FSREErT01udlZhelNUQmFDRjc0Nmg4VkJ6bnIrL21OMWppczZCK3poSk8w?=
 =?utf-8?B?VGxiem14NFBHV1ZHK2F3ZnBKbUdiSHRiOW80YWtabngwWS9pbW80ck1xUnFo?=
 =?utf-8?B?ZVpyTVM0dEJZMldTQzhQTzFVMGlFS1VMbVBnc2lwTmxuOTduMnY5NER0MlYx?=
 =?utf-8?B?aTFSSGdzb2xsN29jZXdaY0QyejRQZm44cU4yd2JnWDBWVE4zdWJNTUhLUFJ0?=
 =?utf-8?B?ZlRnbXFkTUdkT0djWkhML1hQSk1hQTFGU2VENG5DN25rUzc4bFF6bjNOTmhI?=
 =?utf-8?B?TEZSeGN2RnFCL00zSXBUWG1qYWVhQjR5UjQzMkNwVGhoeGUybXFGKytvSjAy?=
 =?utf-8?B?QXpsTlN4Qkd0YTBDb3c3VkRybHEzQkhoMDJlZ0xWYmsvU0N3Zmp6YmtMVElD?=
 =?utf-8?B?WEtjQlRVNXJLQVVQbE1BUFlmWkFBYU5aMUt5aktVOC9aNjYxbisyeDdMQVgw?=
 =?utf-8?B?eHhySlRNbWh6WnRYTnJ2d0hqMlh4L3hmSGt1VGJXdlZGV0JwL2hBbkZSbUI1?=
 =?utf-8?B?VXR0dDlxY1JkRkZNYXFuVDI1K25UNlpjWmtpeWxpOFBYWG52dkNlWWViQzRv?=
 =?utf-8?B?dndhTlUyaEZpenQ3SFNTdUhyMWM4UURDTkNZaWhGWkZ2S1FNS0JUQU5CR2Ry?=
 =?utf-8?B?YmtHSm9LV0tQQ00rL2J2VU5MbUJJbTRpUE0wTk1OVzUvOUpJUDFQZVpaZERW?=
 =?utf-8?B?a0djcmpTUUZvTHp0NVBlbGIwS3hwQ1lQeVl6RDZObDF5clVhL0hpcjhDNVc3?=
 =?utf-8?B?NDN0LzhQeEdIT1V1OFQ2RUtBWXFZalRub2ZkNTkwOGFMMkRBMHQ1RVVOeG82?=
 =?utf-8?B?bDA5U0E1NGNIb09qaGRxVkhjbXpPMXRCM2dTTUFabmt4ZDB3OGpwSENXdi9k?=
 =?utf-8?B?ajJyV1FBazJ1c2hnOWJ5aUFIZGNVdnAvRzhtZ1V0OHFtSmQyRmhjMmtBK2tv?=
 =?utf-8?B?OUJuZS9HRmQzUFY4ZEYwSWN0cEx6YUpLU3orVyt2SHJBempXNi9tanFpSWV1?=
 =?utf-8?B?M1FMZk50enB3WUlOYXd1TDJTOUcyQ3FvV2t0elJ6d0RUZjcwT0pJWXNUTlAv?=
 =?utf-8?Q?K+m/SC9QapY5iviRbCr2csHOM?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dc31dcb8-0f29-4a3d-f94f-08db1030a4c4
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Feb 2023 15:15:31.3466
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OM/d5TZEUXFdQfoTnMszbY7TIbRWw13E6iDezsmGfnp1dGEkOLYUmmM70J6uQDQrrss3ttaLxSaujHcA4tM2WQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB7749

On 16.02.2023 16:07, Matias Ezequiel Vara Larsen wrote:
> On Wed, Dec 14, 2022 at 08:29:53AM +0100, Jan Beulich wrote:
>> On 07.10.2022 14:39, Matias Ezequiel Vara Larsen wrote:
>>> @@ -287,6 +289,20 @@ static inline void vcpu_runstate_change(
>>>      }
>>>  
>>>      v->runstate.state = new_state;
>>> +
>>> +    vcpustats_va = (shared_vcpustatspage_t*)d->vcpustats_page.va;
>>> +    if ( vcpustats_va )
>>> +    {
>>> +	vcpustats_va->vcpu_info[v->vcpu_id].version =
>>> +	    version_update_begin(vcpustats_va->vcpu_info[v->vcpu_id].version);
>>> +        smp_wmb();
>>> +        memcpy(&vcpustats_va->vcpu_info[v->vcpu_id].runstate_running_time,
>>> +               &v->runstate.time[RUNSTATE_running],
>>> +               sizeof(v->runstate.time[RUNSTATE_running]));
>>> +        smp_wmb();
>>> +        vcpustats_va->vcpu_info[v->vcpu_id].version =
>>> +            version_update_end(vcpustats_va->vcpu_info[v->vcpu_id].version);
>>> +    }
>>
>> A further aspect to consider here is cache line ping-pong. I think the
>> per-vCPU elements of the array want to be big enough to not share a
>> cache line. The interface being generic this presents some challenge
>> in determining what the supposed size is to be. However, taking into
>> account the extensibility question, maybe the route to take is to
>> simply settle on a power-of-2 value somewhere between x86'es and Arm's
>> cache line sizes and the pretty common page size of 4k, e.g. 512 bytes
>> or 1k?
>>
> 
> I do not now how to address this. I was thinking to align each vcpu_stats
> instance to a multiple of the cache-line. I would pick up the first multiple
> that is bigger to the size of the vcpu_stats structure. For example, currently
> the structure is 16 bytes so I would align each instance in a frame to 64
> bytes. Would it make sense? 

Well, 64 may be an option, but I gave higher numbers for a reason. One thing
I don't know is what common cache line sizes are on Arm or e.g. RISC-V.

>>> --- a/xen/include/public/vcpu.h
>>> +++ b/xen/include/public/vcpu.h
>>> @@ -235,6 +235,22 @@ struct vcpu_register_time_memory_area {
>>>  typedef struct vcpu_register_time_memory_area vcpu_register_time_memory_area_t;
>>>  DEFINE_XEN_GUEST_HANDLE(vcpu_register_time_memory_area_t);
>>>  
>>> +struct vcpu_stats{
>>> +    /* If the least-significant bit of the version number is set then an update
>>> +     * is in progress and the guest must wait to read a consistent set of values
>>> +     * This mechanism is similar to Linux's seqlock.
>>> +     */
>>> +    uint32_t version;
>>> +    uint32_t pad0;
>>> +    uint64_t runstate_running_time;
>>> +};
>>> +
>>> +struct shared_vcpustatspage {
>>> +    struct vcpu_stats vcpu_info[1];
>>> +};
>>> +
>>> +typedef struct shared_vcpustatspage shared_vcpustatspage_t;
>>
>> For new additions please avoid further name space issues: All types
>> and alike want to be prefixed by "xen_".
> 
> Should I name it "xen_shared_vcpustatspage_t" instead?

Yes, that would fulfill the name space requirements. It's getting longish,
so you may want to think about abbreviating it some. For example, I'm not
sure the "page" in the name is really necessary.

Jan

