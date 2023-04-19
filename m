Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C4D06E7617
	for <lists+xen-devel@lfdr.de>; Wed, 19 Apr 2023 11:19:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.523270.813156 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pp3xf-0007n4-0s; Wed, 19 Apr 2023 09:18:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 523270.813156; Wed, 19 Apr 2023 09:18:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pp3xe-0007kJ-TW; Wed, 19 Apr 2023 09:18:46 +0000
Received: by outflank-mailman (input) for mailman id 523270;
 Wed, 19 Apr 2023 09:18:45 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=8hvW=AK=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pp3xd-0007jx-Im
 for xen-devel@lists.xenproject.org; Wed, 19 Apr 2023 09:18:45 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on20615.outbound.protection.outlook.com
 [2a01:111:f400:7e1a::615])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2d9e670d-de93-11ed-8611-37d641c3527e;
 Wed, 19 Apr 2023 11:18:42 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DB8PR04MB6795.eurprd04.prod.outlook.com (2603:10a6:10:fa::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6298.45; Wed, 19 Apr
 2023 09:18:40 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::52b2:f58:e19:56ae]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::52b2:f58:e19:56ae%2]) with mapi id 15.20.6298.045; Wed, 19 Apr 2023
 09:18:40 +0000
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
X-Inumbo-ID: 2d9e670d-de93-11ed-8611-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NWbZgUzSHbm7UjdlvZvZduSOFmw3myw6jmnp7Ogw/b1GuIvOK6LVQa5iGJU/+TBE5wjdtQbBGF93TLLDMoBLLSMlOHIyAcT0QkqLcFDV/M4yhUJfL7v/LVb5HMoT8Z1no7lZ1QJd/TV+5OMYffwvNgg0iyEI6pSgdGbUPWowzaHotqnGi3qKOtjKXY2AwPC7RHEY3XiXuLMfxqQkz6SUTCEcwSCfhsBM603L5pshxjBavwlnOCER54imYSSDUq+Qc04d6tieAgY8bXRbHG9j5/36l45EExi00SwLS7fgr1foioFBvhtdihwOWC9c7YbacXh+ql06B/ORZaztRI+EQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Z3rUZJgYqjCHR8Zt9kBKYEx2OC1fPPjxo69meIDR+tw=;
 b=eNOp9GkuFNtuCNMV7Pj8ArbFRkejZqsrqrPwyk7ItKXWGjxtDCK637Jp8ZGt84WPJwkBmtkWav3t2DnkPtUK4wqPUE24S57RnVEHe7bmRzK+L5zdpOI8HFjsmwCPSYtSI6pZ0C+RbWKNse0CNzcwaOxExT4fODNGkQLvjaY0u8sm5fQbEN5OI481v4DTjYj2C880EU+xcIvMYlj9NBsu5STcuteqBFOsW+9nu0+XZnlVWuFk35QlQu8C+8iJlkyAJysdI5YTMzmuBr0bqZmqtREISeVyvlQJXReiCmoY9aAFbFtzDSsBKPqLCkjEuUm0EAhKE7JIBSp46Lw02zuyFw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Z3rUZJgYqjCHR8Zt9kBKYEx2OC1fPPjxo69meIDR+tw=;
 b=Fi0sBI3JNl/yBIicyxwGLhT3Lbzv/EjQpJqUdUXqKJnLUvAt5faUEVj1Ewiy30JY4F4+3IMRCBhR6AAXKVO1lmbNZgaLM8n/9WUYG8V768X/7ft5tyWS128exmcM5qoshtNBUFXkDBAuUd1uhCxVAwVN7EmNq/I9mk/VQkoVB89naU0jYmIg2Vy+ON38N4M34KElAzPhXDD1BvHpBzfYwxAtLLZTLMuYmgqwomBmiPP47UqVxYd9nsDBE7O2D9Rl/nbUiZhLQPqto1PoI+Qb0FdLxCR2AcnGgmuZMKYUY/hul3GCAe5TxabTUccVipOgEujyIJTC/hbB7ctwDOfRNQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <619fe14d-e5cd-c355-bcfa-1d20e0c219ca@suse.com>
Date: Wed, 19 Apr 2023 11:18:38 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [PATCH] xen/vcpu: remove vcpu_set_singleshot_timer flags field
Content-Language: en-US
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Henry Wang
 <Henry.Wang@arm.com>, Community Manager <community.manager@xenproject.org>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <20230418154223.20181-1-roger.pau@citrix.com>
 <225aeacd-7d8d-3832-8043-4f565403c2d7@citrix.com>
 <7452a070-48b8-03fb-26c7-3dc7d652dcba@suse.com>
 <ZD+uPd/wICTK6qB4@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <ZD+uPd/wICTK6qB4@Air-de-Roger>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0096.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a1::8) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|DB8PR04MB6795:EE_
X-MS-Office365-Filtering-Correlation-Id: 07565fc7-bafd-4335-d19c-08db40b71070
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	8YHBSQjMdqA8fIWYLuAssQnNl131vGVhmSoU4k0m3ceNmF63N5oDAmqJYnkdSXBa47BxloEK8D0WavvkFp8gO4nHcqJZi0b2QoYTC/9T6+OYMDPtJv3N97PvUD3YkBaITWRExv9EaUEqVCM57GcmDplCFft89f8d1gSrbB4GuiGS8yi+H3Uv+DZqrL+BEyyXcYd6sbVioPd3amMkAI7/AQngsfGYvyd/xCBl9tQH8UlULzJO0z0NJp54WOxx678UBxqqG8HHZPtQxRTjbQjyYTLZwmj+BO27otIslTku9ka+VN0i3XNPQVKWr+Kw8q6bO5PZEhursKvxRn8UapiEcW5y/DbMp1SUNexzSWVQZ7i06wemlc+oCzBvY8rdPAGKReGMowsX3gLDDkm/sNkMlrqDeYlRAs1AcumKGSP7Eq1gA3ONqMgyfpTrANhGicRYvB95J5NrllSzfHNWUT1onXF4FKmDfq8UkWEjfqgjH3W7lsT2rjbOrzgHO5pkHqSrBB+s+8AU0NIR45rcEu4+6u42vCju1FLGfr1KTttH/g177WHTcBVoXEMMWtoNBhhQ8OOO6xLWdmWvg6Hh4sTrQuafQr4ZVKgBA/KU3fX2CMfZIWs142qEcMg3T/mju5sAqoOb4bKBtWXVoVTY8vDwNg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(136003)(396003)(346002)(39860400002)(376002)(366004)(451199021)(5660300002)(86362001)(2616005)(83380400001)(31696002)(53546011)(6512007)(186003)(6506007)(26005)(38100700002)(8676002)(8936002)(54906003)(478600001)(6486002)(316002)(41300700001)(36756003)(4326008)(6916009)(66946007)(66556008)(31686004)(66476007)(2906002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ckpYMVZ0VTlLVXZheXVPbE1JNFQwTzRhVmpCaXY5ZlBITmE0ZG5jTmNhV0Zn?=
 =?utf-8?B?b29rMXBkbytyZTl0STBLeFBpU3NKQ0xQbStGZ0dPSUJDWHkwRWs4MlNIOXZE?=
 =?utf-8?B?VlJDdUFzRjZaUmgwWVdoTzVkYnVtOTRvcW1kWXo5UWJsd0ZtN0lOUklCL2J3?=
 =?utf-8?B?ZkFHVG5ncjREQklPWjY3TnZ5V21ZdzBSQm4yZkV1bEd6SStXaWIrb0VYa1lF?=
 =?utf-8?B?YzdpN09qcXZuNnNab2o5ZlBJY2oxWXBUUC9lendrZXg2M0k1YXpYSkhtU2to?=
 =?utf-8?B?ckQzeElZWVAyR2pUclRzL3kwam9GNHNxaGVyNTRaMEw5UXlSQmtzRjQwMndz?=
 =?utf-8?B?MEFLMzA5TEk1a2ROcDBtdWtpdHZLcG96MktYeDNvVGZWSzJ2V0tqaVo0Y1Zr?=
 =?utf-8?B?cG8wU2tOYjlqcXZhbGZRZTZNMzVjV2dzWkpQSjJySG16bFFOOHJUK3ozTXpE?=
 =?utf-8?B?Mnl5Rk96ZU45dld4WUFmVEZ1MVhMUE1TVE12UjEyUGJDVHc3U2RXR1EzYTRp?=
 =?utf-8?B?anlyZE5LTy9sQlZaODNvc0NpdlFzT1RLWkFGTGs3aXBNVGIrOVBsVEdKS1c3?=
 =?utf-8?B?WWpJZExIMDIxcFN0STN5S2MxbFd3K1RXQ3MvVDRIRFZXdEo1TFl1cmw1R25D?=
 =?utf-8?B?eGJPRzlldWROMTRVUjNRbUJPTFN4K2NpUitVbCtxcDN1Q0pzbDBCYlBXUkps?=
 =?utf-8?B?a1RiK0pEdkxSaE0rNVV3cSswTWZWb0tOMGR2Sm40ZW5kVnJWZUhJMlo0MFZM?=
 =?utf-8?B?dkdOVjBwd2ZCRHdRMjRKVGV5YnJnekZmRTNEcGpNYmhFSnNwR1Fuc3lpbndB?=
 =?utf-8?B?aTlqNEYzUWJlR0lrc09yTkIrUDJyd1U5cWhFSW5OSWMwUVdwblRsaldmSGJx?=
 =?utf-8?B?OVhZRWl1VDRINC81cWRNYU5DYXgxak4waG1IUkVTTFB2aVpMK0t2OUJNdEFp?=
 =?utf-8?B?bVZtTVFsZFA2YWR1blJDUkJNbERLQXdnSlY3alI1ZmFXSjBIT2RYemdMZHNB?=
 =?utf-8?B?NkJ6Ynp3aFNabDlXVmg0dWdRWXN0MHdCeWJpM3FGd3k5NXlYdVU3U0Rqdm4z?=
 =?utf-8?B?NmRaWkNwNlFqYUY2WDZPV1ZNNHBnS2lIcS9nNWs5L0x4TWZ6dUx0U2hwZEl1?=
 =?utf-8?B?bjJUL2NKb3E1OW1LbmloVzJ4ejQ5K2h1MFhNb01NeTloajh3dFhlS3RVQkFp?=
 =?utf-8?B?WDVLZTIvQk1HcGFWOEh3TkZlcm5OV0RYZUk5V2lBa2wxeVZHNzVyNW9qSnVz?=
 =?utf-8?B?cGsrRlNxSWxnc3Q0U0h0TFFQbEVuTGR3bm5NTDVBT1k3bmpNOUZiZmUrRW04?=
 =?utf-8?B?azA4QzRUNUwyeUY2cjdlYVJyazlyRmhlUU9HQ2NkSXQwajJkNk5veEdtd1FL?=
 =?utf-8?B?YWVvWlB2UVRUUGdLUVRVWlVucWtYeGtsTVc1TXlzZ25JL0ppcjhTY2EvMElw?=
 =?utf-8?B?UXM5UlVrektzL1BYbnBTNEtZMmRFZFQybjZVdmRseWIwVm9FOGhHZGd2Risr?=
 =?utf-8?B?amgvR3ZzWnNLSW9rRURUeVlwb3k1TndoNlRuKzhGY3V1OFJ4L1RLVlAxaVUw?=
 =?utf-8?B?U0FsUXpsbk1Rd1RmdjJBNEFSNTAydFcydnZuaDR2eXQvSzJaN1JMbnZUT0NY?=
 =?utf-8?B?akxNL3hzUnZZMEdaeVpYS0dFM0QxRnQxSUd1SDNjcHJZQVBad1hSc3J4Szcz?=
 =?utf-8?B?eVF5NTkwWGpDbUp1ZlgvWVIvUmdEbnM5c2xkN01mTzk3Zm9jUXgvMEJrcWcz?=
 =?utf-8?B?ZzVjSzYzQ1pFRUF6L3N5ODhOckMwcEFUcW44WTZ6SkptKzBQSEx5aFlacXBh?=
 =?utf-8?B?SHUwSmsyaHNWT2g5dEtiN1RJYXlDTmIyTUFKTUxDRVM2WjVSWjF6c3JXQ1Z6?=
 =?utf-8?B?bmJHWWpOUldWS0I4OXQwUmJOL2hYeEdqbGp0RXo2ZTd5U3h4Mm1kZ3dqSVhw?=
 =?utf-8?B?S0NYN0F3eTBaK3BuaU1wSXpzVzRrTGFBb09LTGVraXo5NElxZFlPVkt1b090?=
 =?utf-8?B?NGsxRzFiOXlveWpFNTNJaExMa2R4VCs5WFFRSXZKb005TmNrYUlxcmJVMlV3?=
 =?utf-8?B?a0JPTUJTRUZsbTlYTGw5NWdiLzFRRFdVM1dJNWU3U1dIYlR0eHppZ21oenlw?=
 =?utf-8?Q?BmwbejlTBNv9yA8twHfRLwB5z?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 07565fc7-bafd-4335-d19c-08db40b71070
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Apr 2023 09:18:40.4246
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nxOUT11JOp3ZzaQwnYrh07Ssaj8Q6/VGp6CFpFfkzg8MvIA08ui1Snj0F4wGt7al28Ud1uq6l+t2qhXhOMPX0w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR04MB6795

On 19.04.2023 11:02, Roger Pau Monné wrote:
> On Wed, Apr 19, 2023 at 09:07:41AM +0200, Jan Beulich wrote:
>> On 18.04.2023 17:54, Andrew Cooper wrote:
>>> On 18/04/2023 4:42 pm, Roger Pau Monne wrote:
>>>> The addition of the flags field in the vcpu_set_singleshot_timer in
>>>> 505ef3ea8687 is an ABI breakage, as the size of the structure is
>>>> increased.
>>>>
>>>> Remove such field addition and drop the implementation of the
>>>> VCPU_SSHOTTMR_future flag.  If a timer provides an expired timeout
>>>> value just inject the timer interrupt.
>>>>
>>>> Bump the Xen interface version, and keep the flags field and
>>>> VCPU_SSHOTTMR_future available for guests using the old interface.
>>>>
>>>> Note the removal of the field from the vcpu_set_singleshot_timer
>>>> struct allows removing the compat translation of the struct.
>>>>
>>>> Fixes: 505ef3ea8687 ('Add flags field to VCPUOP_set_singlsehot_timer.')
>>>> Reported-by: Andrew Cooper <andrew.cooper3@citrix.com>
>>>> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
>>>
>>> While everything said is true, this isn't the reason to to get rid of
>>> VCPU_SSHOTTMR_future
>>>
>>> It 505ef3ea8687 does appear to have been an ABI break, that's
>>> incidental.  It dates from 2007 so whatever we have now is the de-facto
>>> ABI, whether we like it or not.
>>>
>>> The reason to delete this is because it is a monumentality and entirely
>>> stupid idea which should have been rejected outright at the time, and
>>> the only guest we can find which uses it also BUG_ON()'s in response to
>>> -ETIME.
>>
>> The instance in Linux (up to 4.6) that I could find was
>>
>> 	BUG_ON(ret != 0 && ret != -ETIME);
>>
>> i.e. not really dying when getting back -ETIME. (And if there really was
>> a BUG_ON(ret) somewhere despite setting the flag, it would be a bug there,
>> not something to "fix" in Xen.) I'm afraid I also disagree on "stupid
>> idea" as well as ...
> 
> The logic in old Linux is indeed 'fine' in the sense that it doesn't
> hit a BUG_ON.
> 
> The problem we are seeing is that when logdirty is enabled on a guest
> with 32vCPUs (and without any kind of logdirty hardware assistance)
> the contention on the p2m lock is so high that by the time
> VCPUOP_set_singleshot_timer has copied the hypercall data from HVM
> context the provided timeout has already expired, leading to:
> 
> [   65.543736] hrtimer: interrupt took 10817714 ns
> [   65.514171] CE: xen increased min_delta_ns to 150000 nsec
> [   65.514171] CE: xen increased min_delta_ns to 225000 nsec
> [   65.514171] CE: xen increased min_delta_ns to 337500 nsec
> [   65.566495] CE: xen increased min_delta_ns to 150000 nsec
> [   65.514171] CE: xen increased min_delta_ns to 506250 nsec
> [   65.573088] CE: xen increased min_delta_ns to 150000 nsec
> [   65.572884] CE: xen increased min_delta_ns to 150000 nsec
> [   65.514171] CE: xen increased min_delta_ns to 759375 nsec
> [   65.638644] CE: xen increased min_delta_ns to 150000 nsec
> [   65.566495] CE: xen increased min_delta_ns to 225000 nsec
> [   65.514171] CE: xen increased min_delta_ns to 1000000 nsec
> [   65.572884] CE: xen increased min_delta_ns to 225000 nsec
> [   65.573088] CE: xen increased min_delta_ns to 225000 nsec
> [   65.630224] CE: xen increased min_delta_ns to 150000 nsec
> ...
> 
> xenrt1062821 login: [   82.752788] CE: Reprogramming failure. Giving up
> [   82.779470] CE: xen increased min_delta_ns to 1000000 nsec
> [   82.793075] CE: Reprogramming failure. Giving up
> [   82.779470] CE: Reprogramming failure. Giving up
> [   82.821864] CE: xen increased min_delta_ns to 506250 nsec
> [   82.821864] CE: xen increased min_delta_ns to 759375 nsec
> [   82.821864] CE: xen increased min_delta_ns to 1000000 nsec
> [   82.821864] CE: Reprogramming failure. Giving up
> [   82.856256] CE: Reprogramming failure. Giving up
> [   84.566279] CE: Reprogramming failure. Giving up
> [   84.649493] Freezing user space processes ... 
> [  130.604032] INFO: rcu_sched detected stalls on CPUs/tasks: { 14} (detected by 10, t=60002 jiffies, g=4006, c=4005, q=14130)
> [  130.604032] Task dump for CPU 14:
> [  130.604032] swapper/14      R  running task        0     0      1 0x00000000
> [  130.604032] Call Trace:
> [  130.604032]  [<ffffffff90160f5d>] ? rcu_eqs_enter_common.isra.30+0x3d/0xf0
> [  130.604032]  [<ffffffff907b9bde>] ? default_idle+0x1e/0xd0
> [  130.604032]  [<ffffffff90039570>] ? arch_cpu_idle+0x20/0xc0
> [  130.604032]  [<ffffffff9010820a>] ? cpu_startup_entry+0x14a/0x1e0
> [  130.604032]  [<ffffffff9005d3a7>] ? start_secondary+0x1f7/0x270
> [  130.604032]  [<ffffffff900000d5>] ? start_cpu+0x5/0x14
> [  549.654536] INFO: rcu_sched detected stalls on CPUs/tasks: { 26} (detected by 24, t=60002 jiffies, g=6922, c=6921, q=7013)
> [  549.655463] Task dump for CPU 26:
> [  549.655463] swapper/26      R  running task        0     0      1 0x00000000
> [  549.655463] Call Trace:
> [  549.655463]  [<ffffffff90160f5d>] ? rcu_eqs_enter_common.isra.30+0x3d/0xf0
> [  549.655463]  [<ffffffff907b9bde>] ? default_idle+0x1e/0xd0
> [  549.655463]  [<ffffffff90039570>] ? arch_cpu_idle+0x20/0xc0
> [  549.655463]  [<ffffffff9010820a>] ? cpu_startup_entry+0x14a/0x1e0
> [  549.655463]  [<ffffffff9005d3a7>] ? start_secondary+0x1f7/0x270
> [  549.655463]  [<ffffffff900000d5>] ? start_cpu+0x5/0x14
> [  821.888478] INFO: rcu_sched detected stalls on CPUs/tasks: { 26} (detected by 24, t=60002 jiffies, g=8499, c=8498, q=7664)
> [  821.888596] Task dump for CPU 26:
> [  821.888622] swapper/26      R  running task        0     0      1 0x00000000
> [  821.888677] Call Trace:
> [  821.888712]  [<ffffffff90160f5d>] ? rcu_eqs_enter_common.isra.30+0x3d/0xf0
> [  821.888771]  [<ffffffff907b9bde>] ? default_idle+0x1e/0xd0
> [  821.888818]  [<ffffffff90039570>] ? arch_cpu_idle+0x20/0xc0
> [  821.888865]  [<ffffffff9010820a>] ? cpu_startup_entry+0x14a/0x1e0
> [  821.888917]  [<ffffffff9005d3a7>] ? start_secondary+0x1f7/0x270
> [  821.888966]  [<ffffffff900000d5>] ? start_cpu+0x5/0x14
> 
> At some point Linux simply gives up trying to reprogram the timer, and
> that obviously lead to CPU stalls.

And that's all with old enough Linux then, I suppose?

> Ignoring the VCPU_SSHOTTMR_future flag allows the guest to survive, by
> not returning ETIME and just injecting the expired interrupt.
> 
> Overall I'm not sure how useful VCPU_SSHOTTMR_future is at least when
> implemented as done currently in Linux.
> 
> Instead of trying to reprogram the timer Linux should do the
> equivalent of self-inject a timer interrupt in order to cope with the
> fact that the selected timeout has already expired.

Indeed - that's what I was expecting would be happening. But I didn't
go check their code ... Yet them getting it wrong still isn't a reason
to ignore the request, at least not unconditionally. OSes could be
getting it right, and they could then benefit from the avoided event.

As to "unconditionally": Introducing a per-guest control is likely too
much overhead for something that, aiui, isn't commonly used (anymore).
But tying this to a command line option might make sense - engaging it
shouldn't (hopefully) lead to misbehavior in guests properly using the
flag, so ought to be okay to enable in a system-wide manner.

I vaguely recall considerations for similar overrides to hypercall
behavior in other areas, so such an option - if made extensible -
might find further uses down the road.

Jan

