Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D2AED7092A3
	for <lists+xen-devel@lfdr.de>; Fri, 19 May 2023 11:09:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.536801.835511 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pzw6v-0006bV-3c; Fri, 19 May 2023 09:09:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 536801.835511; Fri, 19 May 2023 09:09:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pzw6v-0006Ye-0z; Fri, 19 May 2023 09:09:17 +0000
Received: by outflank-mailman (input) for mailman id 536801;
 Fri, 19 May 2023 09:09:14 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=TMQ+=BI=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pzw6s-0006YY-S9
 for xen-devel@lists.xenproject.org; Fri, 19 May 2023 09:09:14 +0000
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur01on060a.outbound.protection.outlook.com
 [2a01:111:f400:fe02::60a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d226edd0-f624-11ed-8611-37d641c3527e;
 Fri, 19 May 2023 11:09:12 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by PAXPR04MB8766.eurprd04.prod.outlook.com (2603:10a6:102:20d::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6411.19; Fri, 19 May
 2023 09:09:10 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e442:306f:7711:e24c]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e442:306f:7711:e24c%5]) with mapi id 15.20.6411.021; Fri, 19 May 2023
 09:09:10 +0000
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
X-Inumbo-ID: d226edd0-f624-11ed-8611-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Q67JiSTv0UB/SDlng+V597s8OrIKmrcnwYO7mRvFv0yhuqe8BVsOmz+MelQC/EwwT3c0TO+0fJXw0Tv79Pg08zn1UzU6GbIg1DseY5v8IsN6Vcw1SqdXHuoxkWjSWUKdaD+JMLobkYzL2eAHZ21JZqon8pz960GlsGhdVlhAa40BFR3XQQFo1ro9x/miaaTRpxwUUTi2AREa5woa3Q0v8a9mITafBxHqMVyl4wGmjZQr1aSgfFtQW0M0Tz6S0E9X7S6p6QGmu7oZbtioanEylcgHl55K13cqabt4qnOfaAgLHAng5pOlv7zBtodnBLWjXCS1vONSd1ShwBpy89w+mA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fsB3vCLgthXRHPhn4STfbolD2zd1U7buZWW3Ey+MIRQ=;
 b=jESaUzIVAoMmVzrT7IbFJydoBqxEyNMCJ+FpYhRFd6zb4pBlOf8JIcTqfdBZQHsrFwCz+yE1MiVoUfwvotT4fPhxl4Llzbu38EGOB5ucctmPNxrn5BfAVbhGFJRVE1itOdZg/+4IfEWf/JQh7m0IkWzQrFYpnOT8Kxx4doMkt0rc4z8tOLamiEMG+XGhqFJqoQzGG7BA200BqfLFUkFHh/mRx0T7mrm4xeWP0J5aQwfsdihjyoA2WaDJ/ZXi71D3JVP+pUrLb/QZJCIfbc1Gb7loErKx10+0FdXc9EXkbt7/mVdxC/n7x35GCt+ZUMaee4QxKYfbhGJ5pFNWx8wkqA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fsB3vCLgthXRHPhn4STfbolD2zd1U7buZWW3Ey+MIRQ=;
 b=e0P2Vg/1aYa6hDfY7mllpQLfhqyIfCxd23gz2xZhz5tkpmHxXzIEu4GEH4bXq0QzRnvF+XKdCf4pkvyj8/HopiEOpngu39c+HqTzwPkwtz6/y+YJcj4gPSK8oe4sgDsla1Duof+0U4xgSs9zGVb01KntT6EC/9F9l4VrUKixrpdN4mwq7N91Zfqhe11gpfZDqb72E58gPqhlkwRTVp6HuWIi7PJfRmumgdmQNEzuU1E4cR6WkNzZ7k8SXZLmQ9UkjPMkudZp0xQXA8bZcFWQWgZRfWN00zW876LxFxb/dj+XvA7hOHXtFWKTX1DH0tIZVuE1oFpLfIUt0b4OWDuaIA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <8214dfbe-8438-8adc-6ac2-6300e8eb7923@suse.com>
Date: Fri, 19 May 2023 11:09:11 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
Subject: Re: PVH Dom0 related UART failure
Content-Language: en-US
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, andrew.cooper3@citrix.com,
 xen-devel@lists.xenproject.org, marmarek@invisiblethingslab.com,
 xenia.ragiadakou@amd.com
References: <alpine.DEB.2.22.394.2305171745450.128889@ubuntu-linux-20-04-desktop>
 <ZGX/Pvgy3+onJOJZ@Air-de-Roger>
 <b411f7aa-7fd2-7b1c-1bcd-35b989f528b6@suse.com>
 <ZGcnh/DZvFAIBR/n@Air-de-Roger>
 <7a00019e-da64-ad0c-d107-d002cf6bce85@suse.com>
 <ZGc5ZfebSL21W5sY@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <ZGc5ZfebSL21W5sY@Air-de-Roger>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0079.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1e::19) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|PAXPR04MB8766:EE_
X-MS-Office365-Filtering-Correlation-Id: 30720829-8b80-43c5-2547-08db5848b545
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	OqQjztKpKYIeF5IyZwQvIYl7MTQnN6LckVitsEqbVF7bWONUn55zq72RsRDlszdcMvi1NUm1VT1FYPTTY/5Iw/aTR+8l7yRwhfXKAKXDPbAxbrn8xkAa4zYsHpYDtcw7SqkNePQFur0CDNCo3TeoHzLIv5OTdt3msK++JDtJ0uxOqqdQEdtqcBRJem9CJuD0p9qosQmBhO26uFwhUW6T0sxt1Q6YMdZ6Z61m8YvFeDZdtdf2nx/72zkXOEUlxcYhskQBD1xh2y3gUi14jRM4ACxELOBE7QG9lJL7W8aBJtNniMCr00xrA0OTmZoA7ja7mJiM89QXNUmYWM34S4S2KP031j10t4UcfQ8PNhbPJ2QhqxhgdWEkrUXfaQYmHMG52vUdUWHS/35FdpXaheRWbl0wlX7xpnx5qLBBooCstwOtLEG5ekUK4ybeVYvSW1frdI2zlSww/wDyISTuwAs4iZDEOE1oe5Fa+RPx8etnXbC4HUS/Lyq86bMSKo7i/lQar2k4qIuOUQRJu1dSjP0PF/21A36uP05f8+nDL1WlUy6wsiYhiJ0itPdlB0OlxZKVZc26g4jKib0MHMyBKWLEpcEnBc9wBKw8WhJIrYJM5ueWbUu4Pbl3sLSOeayh0vSLaL2bkAQD1N1h9NkDbitkoQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(346002)(39860400002)(136003)(376002)(366004)(396003)(451199021)(31696002)(86362001)(36756003)(6916009)(966005)(478600001)(316002)(66476007)(66556008)(4326008)(66946007)(2906002)(5660300002)(8676002)(41300700001)(6486002)(8936002)(38100700002)(6512007)(53546011)(6506007)(2616005)(26005)(83380400001)(186003)(66899021)(31686004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SElQQnNZMC9vR0IxNVN4bWlXVFpEdTloczlhUW9TR0RyZkpYZnQ2eHZZcS83?=
 =?utf-8?B?MWJ6a2UyMlQ1MXVGUDMvUTdCTm56STZIUkp2NmZvR2pLRjZ0a0JQYkFsSzFL?=
 =?utf-8?B?RkUwK0RUV2YzQ0xlSUhXb3hlemQ3STMyMGxpRXR6U1l5a0h6Y0xiSktuVnJR?=
 =?utf-8?B?RWJSRThtNTE1T2lCR09ScE5JOVlIUDBhK0lrVjN3TVdVWGo2VUlqYXdaZDBI?=
 =?utf-8?B?dmxUSFBSZURUR3dIMFlzUHY0R1dhSXdySmVmUmFNVU9KNitRQnNCQ2xMaHhi?=
 =?utf-8?B?ZWNkM2E3TTVpSjgwOU9nRTh0RmZncFZhald4YjlIamhkU3hZTy9BbzBNMDhV?=
 =?utf-8?B?REFBcExCZTUzajhYMlF3cFlsRmJoT2VHY2Q0UGhIamp6ZW81bFlMQ1Z3cTE2?=
 =?utf-8?B?NFcxdisveEJ1WXFWdUtpVllmcmZaZmhRb2FBRFNZNk9wZThCT3JNbUoydzRn?=
 =?utf-8?B?NE4xdnBnZlRNaTJ0QStWMTVjSDJOdVYvT0NFUDd0UENhQVFWNmRnV0VreWNl?=
 =?utf-8?B?enpTV3I3dzlMeW5xcDl2YWsweTFhbW5Hb2pCWEhBYzFQbzN1Z09iakpXeTNK?=
 =?utf-8?B?MlBqeUVnczEyMEJEUC9GWUpaa1lyRWFhUWVDQkFyRXBLOWJlR2RVamxIK1Nw?=
 =?utf-8?B?UzQzRWZTNTVPVFJJcCtlemRzSnh0UW50NFNNQ3hKcGtYN1NTamVySFFsbnNE?=
 =?utf-8?B?Z0ZlcnFEcEp0VVREUnJQV1ZONGo4YjRiandjbDFLTUNjTG1meE1jR3NQNXlY?=
 =?utf-8?B?cG1wRTdlSkNxZWlvVk1nTGlTUlFnai9Ub0V2K3AzYUs2R1lxS2JORlB5a01t?=
 =?utf-8?B?Y3pFcnBiOHR3Y1ExZkt4VDFOMmlnMy8vRWxTT2FaOG5heDNxai8yS3dqM2hH?=
 =?utf-8?B?UjlNT2tBVzhoSWVOMmJWZTdtVzRtUDlLclIxVnFlcWprc042RnBjWDdnOVA5?=
 =?utf-8?B?UjA2emVPUndETDFaQ2t2UGtQYy91RWFnaDZPY21qd1g1anlsaWE1ZUt6THU5?=
 =?utf-8?B?L1F5eFR2UkdLdG1XMzFhUmVFbzM2OStnM3EzZ1lFQWs1RGx0UnI2OFBPZEpH?=
 =?utf-8?B?TnF0VDJIVlFPSENqUHQrbW1kc0dXUzF4a3NpZmRDV0djbGZLT2diOEJodUt2?=
 =?utf-8?B?ekNCK2w2VkRQczR2ejNtd0VKKytCVEI0UkJPdW1mRlNQcmVKNzJNRmNEcWx0?=
 =?utf-8?B?eHhGM21zRjVNWWFnL0Z6RDV6WGtaMWtqUTNZK0FqK3dTbVZ4YmhJY05kM3ly?=
 =?utf-8?B?b2g5aE9lMGFzV1NJelQ2MTNad2t2cjkzMVo0MElsd2RxQ2c5U0NkSDgxSkxG?=
 =?utf-8?B?b0ZCWGIzbm5OeDV5ZjdmVlRiWS9IVjZvTFV0ZlFWYVBRdm9nTk96QXNIWWlR?=
 =?utf-8?B?UDR1L1JjMGNEUFdhSjBaTUpKd1ErOWFhK2d3RGRXcGZTQ244U1VMM3RzeTFs?=
 =?utf-8?B?aTNPMW9ySERqZTlsQkpHNWtQeHc4RE1odHZNWEY4aUlzTDVIcjBWaVBCUXoy?=
 =?utf-8?B?b09mMDRCWmNxWnQyOGxmS2pYZk5wK28waXVES2R6NUllYkd1NTR4V0puZjFJ?=
 =?utf-8?B?UlUvdXZyTDRuU1M4TjBONTJibG1JTnFZaVd3NjlnQkdSajFONDA2YWxVT3Mw?=
 =?utf-8?B?SHJTWEg3VW5TemV2Mmc3NDFRQVpQK1cwREFVd1U0bjBZM2RWVGtTRlFRcDlk?=
 =?utf-8?B?aVMvMk5ZUjZ6elRLZUVIanRMVVVZbjlaZDN6RTAzQU90cm9lMEhLNTZjb3JC?=
 =?utf-8?B?Q3pNenZOVnVWUkhuREFTdG1rcUFRaDhOaldkZEtvOWwxM1lwLzIvbnhyZWZy?=
 =?utf-8?B?Tjd6VTllY0JnWmtDU21HekVUZ1BsWVpEY1k2YVZmUEJtUENhalpHSjQ0K2o5?=
 =?utf-8?B?MnhDcnRJVWdocThLQXVpaG9PTHFWRXpZR1FKV0UzT1dtbDkwWlZMai9GVVY4?=
 =?utf-8?B?QXUvY0JHYXYwd3hMUVpjLzFnWjNWdmdNYlEwRjBhVm5qK0lBUC9BdnJnaFln?=
 =?utf-8?B?Z1lFeUYvTGQrTHR4MG5yK1N4ZjNvL0w0QzRFQ0pFVWhyWXpvVHllT3luZWNW?=
 =?utf-8?B?TjNWbVZSUVZVd0NEWmZzbHFQd2I2TWZUbTVqT2V5ZnNHQlBWTlNyOFVTRm93?=
 =?utf-8?Q?YU78+9OX1/Ch4ecWJCWdnBIiW?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 30720829-8b80-43c5-2547-08db5848b545
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 May 2023 09:09:10.6802
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: R1IeZfcTt991DMideG86gJv0kD29FQuGSKStDOe4tsntm6DvFFZwssXBWT6Ki0iYJ1Lqxs91iNA5xE8TJHeuYg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8766

On 19.05.2023 10:55, Roger Pau Monné wrote:
> On Fri, May 19, 2023 at 10:20:24AM +0200, Jan Beulich wrote:
>> On 19.05.2023 09:38, Roger Pau Monné wrote:
>>> On Fri, May 19, 2023 at 09:22:58AM +0200, Jan Beulich wrote:
>>>> On 18.05.2023 12:34, Roger Pau Monné wrote:
>>>>> On Wed, May 17, 2023 at 05:59:31PM -0700, Stefano Stabellini wrote:
>>>>>> I have run into another PVH Dom0 issue. I am trying to enable a PVH Dom0
>>>>>> test with the brand new gitlab-ci runner offered by Qubes. It is an AMD
>>>>>> Zen3 system and we already have a few successful tests with it, see
>>>>>> automation/gitlab-ci/test.yaml.
>>>>>>
>>>>>> We managed to narrow down the issue to a console problem. We are
>>>>>> currently using console=com1 com1=115200,8n1,pci,msi as Xen command line
>>>>>> options, it works with PV Dom0 and it is using a PCI UART card.
>>>>>>
>>>>>> In the case of Dom0 PVH:
>>>>>> - it works without console=com1
>>>>>> - it works with console=com1 and with the patch appended below
>>>>>> - it doesn't work otherwise and crashes with this error:
>>>>>> https://matrix-client.matrix.org/_matrix/media/r0/download/invisiblethingslab.com/uzcmldIqHptFZuxqsJtviLZK
>>>>>
>>>>> Jan also noticed this, and we have a ticket for it in gitlab:
>>>>>
>>>>> https://gitlab.com/xen-project/xen/-/issues/85
>>>>>
>>>>>> What is the right way to fix it?
>>>>>
>>>>> I think the right fix is to simply avoid hidden devices from being
>>>>> handled by vPCI, in any case such devices won't work propewrly with
>>>>> vPCI because they are in use by Xen, and so any cached information by
>>>>> vPCI is likely to become stable as Xen can modify the device without
>>>>> vPCI noticing.
>>>>>
>>>>> I think the chunk below should help.  It's not clear to me however how
>>>>> hidden devices should be handled, is the intention to completely hide
>>>>> such devices from dom0?
>>>>
>>>> No, Dom0 should still be able to see them in a (mostly) r/o fashion.
>>>> Hence my earlier RFC patch making vPCI actually deal with them.
>>>
>>> What's the difference between a hidden device and one that's marked RO
>>> then?
>>
>> pci_hide_device() simply makes the device unavailable for assignment
>> (by having it owned by DomXEN). pci_ro_device() additionally adds the
>> device to the segment's ro_map, thus protecting its config space from
>> Dom0 writes.
> 
> But above you mention that hidden devices should be visible to dom0
> "in a (mostly) r/o fashion.".

I'm sorry for the confusion. My reply was in the context of the UART
question here, which is a "r/o device" case. I didn't realize you
were asking a question not directly related to such UART devices.

> I understand that for RO devices the whole config space of the device
> is RO, in which case we should simply avoid using vPCI for them.  We
> however likely want to have the BARs of such devices permanently
> mapped into the dom0 physmap (if memory decoding is enabled).
> 
> But for hidden devices it's not clear to me what needs to be RO, do we
> also need to protect the config space from dom0 accesses?

No, then they would be identical to r/o devices. Dom0 should be allowed
to deal with hidden devices normally, I think, with the sole exception
of them not being possible to assign to another domain (not even DomIO,
if I'm not mistaken).

> It might be complicated for vPCI to deal with devices that have MSI-X
> interrupts in use by Xen for example.  So I would suggest that at
> leeat for the time being we don't handle hidden devices with vPCI.

If any interrupts are in use on a device, I think it needs to be made
"r/o", not just "hidden".

Jan

> We might want to do similar to RO devices and prevent write access to
> the config space for those also.
> 
>> And just to clarify - a PCI dev containing a UART isn't "hidden" in the
>> above sense, but "r/o" (by virtue of calling pci_ro_device() on it).
>> But the issue reported long ago (and now re-discovered by Stefano) is
>> common to "r/o" and "hidden" devices (it's the "hidden" aspect that
>> counts here, which is common for both).
> 
> Indeed, the issue is with any device assigned to dom_xen (or not
> assigned to the hardware domain, but accessible by the hardware domain
> from vPCI).


