Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D326A6BD684
	for <lists+xen-devel@lfdr.de>; Thu, 16 Mar 2023 17:56:41 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.510743.789036 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pcqtd-0007EJ-Av; Thu, 16 Mar 2023 16:56:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 510743.789036; Thu, 16 Mar 2023 16:56:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pcqtd-0007Bn-7j; Thu, 16 Mar 2023 16:56:09 +0000
Received: by outflank-mailman (input) for mailman id 510743;
 Thu, 16 Mar 2023 16:56:07 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Ta6a=7I=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pcqtb-0007Bh-RL
 for xen-devel@lists.xenproject.org; Thu, 16 Mar 2023 16:56:07 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on20628.outbound.protection.outlook.com
 [2a01:111:f400:7e1b::628])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 709f80d6-c41b-11ed-b464-930f4c7d94ae;
 Thu, 16 Mar 2023 17:56:05 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM8PR04MB7474.eurprd04.prod.outlook.com (2603:10a6:20b:1d9::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.31; Thu, 16 Mar
 2023 16:56:03 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b%5]) with mapi id 15.20.6178.026; Thu, 16 Mar 2023
 16:56:03 +0000
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
X-Inumbo-ID: 709f80d6-c41b-11ed-b464-930f4c7d94ae
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Wh5VfUGhlcgD5XOnXGOgdXOm0P+BfKRGbIxsN7j3prYytq5SywjqHrFAWi1q53duxSDQYFtbU0H8x3gDKoTUxWt4bfuXr/hsnUctCwxpx1BeLiVp2BRgiNiexx5qVtLTNCo/bSTC78pKNfH9o3YOMeVy3fNwVIHbcxslqKQx0CY8zUrz6ziVFPer0Ce9h74CoP5xMJdQ/5rRF6h0Na4aKudqc5y7datJ132P1Ew2NDfTTuowyTuI6QBVePkjCymBBlo9upsB63lvViDGg9INQPzynDyVC7ymkhEs96mY7HVopnj2rgS1r/eXOwRcC/dHMutqOI3UPE2JVOExy+n46Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EoYtS6FIFHj0yhJbGSZSkmElypIr8mg/xeYqKVNiFe0=;
 b=jx2F5dfAcBcpqp9Xr8vI7kRW66cDE9w1iXLZHepfY12J3zlTYkWz6fNpqqP7iL2LTxGteEiM9Om4Wfu9rF62mzkqyiyKspbJKVQh2lbu5ECCxnS0vzVRSYDqSW5fZHlu/pZcUNF4QCX64rcQuPNO7uduQIfDeoaCh4AGLa4TVYA0qe3xyGmRAGPocwXgWdQFl80jvG6f65qAaOd/Ggm7F1NkG4p/kO7nTKJ/UdkdiOyIBnG4t6J5bPatc4nxafP07o+cieFVYP2Nrz5xMvjChXpnOecQiuV5y5Sb7vf8zlAvuSPXa7sWRz997ovHZQokX1IPoco887bmT4tp+kbS7w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EoYtS6FIFHj0yhJbGSZSkmElypIr8mg/xeYqKVNiFe0=;
 b=UkRTRJnIIhneHzmdx/Jl+XFCdVmZCY4OmY7L9iUTQONjMD5+Et1/Njh7EjBMmBmJzxDl4Ubny57D4RGCiYnRy+wjkW5ZphWW8xpyH/A1Fy3EYS8Kx8SleMgPq+EmRd2bynJ7m9FuULoG2mszE/AODDiI30ODenD5VIQ3r2sZEizYwZnPzuJj8+g/NNFXHAsv9nYFZO54dkUqC9CqBDI8P8aDVHXXJlTachI1XP/gXzWVBdAkPsGtzjC/1T2wjQQ/YJd/8GfvZHzKTMTlU+XjGW/qvhdjSTmDAT26gW7FIGY/2MDwmQ/+VqtF+mllq78otKBejf2J5nRikDk4ggmvyg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <9693e011-a0df-4b18-fc49-fe8f46d97d9f@suse.com>
Date: Thu, 16 Mar 2023 17:56:00 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v3 1/6] xen: add reference counter support
Content-Language: en-US
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20230314205612.3703668-1-volodymyr_babchuk@epam.com>
 <20230314205612.3703668-2-volodymyr_babchuk@epam.com>
 <ZBNBhS2I4XWkwXr0@Air-de-Roger>
 <dc31ee54-b6ce-3251-ab0d-487d9a9bfd35@suse.com>
 <ZBNGO7/NY0VQQM/f@Air-de-Roger>
 <8331a0c4-07fa-0340-20bf-77a5c8661aa1@suse.com>
 <ZBNIbhW3Eu07aj8I@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <ZBNIbhW3Eu07aj8I@Air-de-Roger>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0114.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a3::6) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AM8PR04MB7474:EE_
X-MS-Office365-Filtering-Correlation-Id: 6c54fcc7-2810-4aeb-38f7-08db263f5385
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	tG0H6cD6bl+c5E5s1OKDe6SH2TFlx6YtUljJKeeQehbKu5yRx9adYu2s70HyHwP0q6+aGqw816xTmT4HvHnNAUrOvurfkx9OcTjozpLpDVBNktmZuQV4CHGHxZi6f2gRsW+0lX2giZOmgdIIDG6C40q7Z4AvOzJfRNFrIWw6BFXyr88c7AyIxoDvPfw8Qw+nzH0P+u9cFWDk3lXtDx30vaiV3hVY3s8DFJW06tS2jsqmpWbsXhMB/pxNDJVt9ZwqwW++5Vq3maIRaJyk3e3atfS0VJxWKZVHiQKcWRCFwuY1ku6iAxxRycyZp7JRW5TRkQ/M3u0XVtsZK8wng9d6WfylB0XkRi0vfYPsULY7TrLrQwv96XB7H82TrsLwboa5/z3dEHHkFF5jrqy9sIjQe7VIbuouzh9Z5YEfCG1T84hLcxZrmpj/3mRsB63rEsqm9KxmdcEqOODU2h3Vbhp61k+1bfqisHtEthd2fji/+26bsH6SX4e5PSYmR8YX7nhUoRb4aVGa01Gy13qIuCY6bXH68CaFUvsJCU13Y7/COahANgycwaswZU/y75/M/NbZnPqdiRM79h2rNjjvmz3GJNV8lQS86Y6+N6HeF/koVL2HsGn0eGHjQ0qRh+3tgmm74vQFb3rTQPqnpgJBHTe8tEMBZu/dq9FWikZVraaTGbJfksO2rBLjiA+dPofKbKjU3zGw9tV9+ie6QJSgQmpGosxAcqh68iV6uWtH2UO1WwY=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(396003)(366004)(39860400002)(136003)(346002)(376002)(451199018)(31686004)(36756003)(4326008)(41300700001)(8936002)(5660300002)(2906002)(31696002)(38100700002)(86362001)(478600001)(66946007)(66476007)(66556008)(8676002)(6486002)(6916009)(54906003)(316002)(6506007)(53546011)(6512007)(26005)(186003)(83380400001)(2616005)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MUpsVlpHVlU0NHhuUStUV2NCMnpzYkFraFVQd2FRRzB3eU9Va2p4dW1uR1FH?=
 =?utf-8?B?VjJKblo5cUEycGFTc0dYT0laLzlJVWRyN1VXbk1kdXp5UUN1K3dsQXlLbURM?=
 =?utf-8?B?SUt6U0d4YVhTZ1hjd21tbld3R0xaTXBGaWFRVDlTMmVUZCsyTHluU283K1A5?=
 =?utf-8?B?ZkE1SUs2STgzZitGL1ExV2R5YkZ2SjhGMjVCNlVCVjZsUjBWcG1BWk1mV1Iw?=
 =?utf-8?B?OWJXUU5wQXI0a29HME0vWG92Z29QY04wci9iSklvdnpuMlpNOUs4MGtaV2ZJ?=
 =?utf-8?B?YjdGUjdwZVZkcEg0NnhoWUlyY0RhYkVZbmx1ZUxUSzVWQis2dnJnRTdGOEpt?=
 =?utf-8?B?Y1lpT3dlTzhwMVhyWGpwYVByT21NTURPS0UvcEo2RE1SM3MxMFZidWtLZGZU?=
 =?utf-8?B?d2RWc0RXNitRVHpNcjJveWdpamVDTU1Ka2NUVGdWbTVCbE9KbVE5NS9NVzJa?=
 =?utf-8?B?T0dGckwxOWlrMHRJUEozSVcvOEVIV3BBc2tCdnVWdlQzclYwSWlXMGtaZFkz?=
 =?utf-8?B?OTgxWGsrOE1Kc2V3Ulkra1VCTFN3bjdIMmJteW9DZjFEQ1VqTktKNXhjMGpX?=
 =?utf-8?B?cWM5UU1iYmZQaURmQW9WcVhCOFBQeUJua3k2Q0Q0cU1DMm9zZVpId2ZBNXpE?=
 =?utf-8?B?cFljM1M1ZEpRZ3JHdG01WnZUTEtDdnRTcjIwUThmaVpja2w5Nzl2ZDgvbW00?=
 =?utf-8?B?WmZTRGdKQUJwRlQ2Skl6aytoeTBUQkpPb0ZDcTJoTmxvNi9WU2l3aTFlT0tv?=
 =?utf-8?B?QXZRUVdjekZ6cFdpU0JwR3Fsc3JadkdsUEZMRDA0OHZVbG5JeUFZcHVONm1R?=
 =?utf-8?B?UVp2UzBKTVpENU9qNU16cDBKRWpPWEZ5RlZNSDdBeHRqZWV2NEJTcndRNlVy?=
 =?utf-8?B?Ly9qS1R4bUFwY2ZwOWh3NldBamliYjR6Sk00N3RvbVVwR3FCSjVBdkhtTnRR?=
 =?utf-8?B?R1A0NXNoa0MyMXM5aUxNQ0pqMFRqNmt0ZTNpWTNsUmJYSnFpdVc0bnVsZi92?=
 =?utf-8?B?U1R5ZlZGQUtRVUtzTTNmbFRwcktDZVJUZUc2YmZtTkNmN01TcEp6a2xjS0hu?=
 =?utf-8?B?RnRmVSt4M3hHdkVOUk91c3RTOUtHWVlxTVhJQ044eWlOZEpiWmNoRC9qcy9l?=
 =?utf-8?B?eTZSdDRRSDI5eFk5b0x6Z0dURXFCUWpKRlNSYmVsckIzeTJaSldFNEQraTF4?=
 =?utf-8?B?U1QvMzA2UVcxTE5kMDdDNkZHWnR4c20xbVJqd1U3Y1hYT1Ara0dGcHYyaDJ1?=
 =?utf-8?B?U0hkSDhjSGQyQmwxbmdzSzFiMnEwVi9NaWZsU2lvZERpdUxsV0pCYlVYUjBl?=
 =?utf-8?B?RTQ5SUM1ZENiVHF4Wmc1MjlQV0hmVjFaNUVTa2R6U0FnTGd0Q1FQblAzbEJW?=
 =?utf-8?B?SlVVb2JXdStNMGw3SE1yRWtXVnpkM1Z2V2g5bFpRdFZ6a0I1RHZWeDhFUU9u?=
 =?utf-8?B?NkhySTVVQndiaEVmRFVzSEJtR1h5NXFlVzJubk5qelVtVWJ5cURJN1dNZEpi?=
 =?utf-8?B?RDUzZkhMZXB2Z3BITjlhQW41MzlxdFdjb3BQZnExZHllRy81WlBZbjhkaFVp?=
 =?utf-8?B?YU1oNXBFNVQ1Z0hOR2VKZGU1VUhFUmxaZVRVbFExaVVYeEtwaHoydEV6LzVw?=
 =?utf-8?B?VytaS1JVMU1FM3ppcmtUaDdadUF5b2wyK0pJY3RXaEhwb0lhU3RmZ2lXNWRp?=
 =?utf-8?B?emdhSDdXdEk5V3g0NysxcXh6YllFU0p5QmZZNnR5VXM4MklyMWhqTUtKM2Ni?=
 =?utf-8?B?NS92am5mbFg0UDlEMVZNSjEwNTFwdWV6aUNwUEdRMzRZNWVJZHMzUHVGVlM2?=
 =?utf-8?B?cUROdkZ1Z0JmWlFPU0pidjZVN3Z6VkFSU2VGY0h4L2NaNzl1SUZlS3MzamF0?=
 =?utf-8?B?VXowUC94WDMxTDFkeE9UdDJvRDViQ2F3ZitPbjVWOUNmQXd4WnlqNXNWZ0Zl?=
 =?utf-8?B?bEw2dDFwampYRkZNV3dKL083RjZoT0N3aVMzRm1PdjBPVzMwemtvN0M2VFlZ?=
 =?utf-8?B?aGFLclpMWTdqZGlEYUxPUE9SSzF4R1ZPS1FnWEVkMUZLczhIeVZSaCtIRmky?=
 =?utf-8?B?cStXYm0wTTEvZ2t5aURlZUZVa1Azd1BCU3gyV2lxc1NiVkpRaUFMUzZNWGFk?=
 =?utf-8?Q?i4t3PU8il0YyulSgOQLQL6V5A?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6c54fcc7-2810-4aeb-38f7-08db263f5385
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Mar 2023 16:56:03.0498
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PQCM1+LAtjvVrVVYyBHxu9kRdjy1ztNBkmv0l5d/7tY+tigpCN9kMZqmo4qN6bGgUx35asMf/1db+NzLf5HTqQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR04MB7474

On 16.03.2023 17:48, Roger Pau Monné wrote:
> On Thu, Mar 16, 2023 at 05:43:18PM +0100, Jan Beulich wrote:
>> On 16.03.2023 17:39, Roger Pau Monné wrote:
>>> On Thu, Mar 16, 2023 at 05:32:38PM +0100, Jan Beulich wrote:
>>>> On 16.03.2023 17:19, Roger Pau Monné wrote:
>>>>> On Tue, Mar 14, 2023 at 08:56:29PM +0000, Volodymyr Babchuk wrote:
>>>>>> +static inline void refcnt_get(refcnt_t *refcnt)
>>>>>> +{
>>>>>> +    int old = atomic_add_unless(&refcnt->refcnt, 1, 0);
>>>>>
>>>>> Occurred to me while looking at the next patch:
>>>>>
>>>>> Don't you also need to print a warning (and saturate the counter
>>>>> maybe?) if old == 0, as that would imply the caller is attempting
>>>>> to take a reference of an object that should be destroyed? IOW: it
>>>>> would point to some kind of memory leak.
>>>>
>>>> Hmm, I notice the function presently returns void. I think what to do
>>>> when the counter is zero needs leaving to the caller. See e.g.
>>>> get_page() which will simply indicate failure to the caller in case
>>>> the refcnt is zero. (There overflow handling also is left to the
>>>> caller ... All that matters is whether a ref can be acquired.)
>>>
>>> Hm, likely.  I guess pages never go away even when it's refcount
>>> reaches 0.
>>>
>>> For the pdev case attempting to take a refcount on an object that has
>>> 0 refcounts implies that the caller is using leaked memory, as the
>>> point an object reaches 0 it supposed to be destroyed.
>>
>> Hmm, my thinking was that a device would remain at refcnt 0 until it is
>> actually removed, i.e. refcnt == 0 being a prereq for pci_remove_device()
>> to be willing to do anything at all. But maybe that's not a viable model.
> 
> Right, I think the intention was for pci_remove_device() to drop the
> refcount to 0 and do the removal, so the refcount should be 1 when
> calling pci_remove_device().  But none of this is written down, so
> it's mostly my assumptions from looking at the code.

Could such work at all? The function can't safely drop a reference
and _then_ check whether it was the last one. The function either has
to take refcnt == 0 as prereq, or it needs to be the destructor
function that refcnt_put() calls.

Jan

