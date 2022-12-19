Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 563D7650E35
	for <lists+xen-devel@lfdr.de>; Mon, 19 Dec 2022 16:02:35 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.466195.725056 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p7HeW-00039T-Vp; Mon, 19 Dec 2022 15:02:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 466195.725056; Mon, 19 Dec 2022 15:02:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p7HeW-00037T-Rb; Mon, 19 Dec 2022 15:02:04 +0000
Received: by outflank-mailman (input) for mailman id 466195;
 Mon, 19 Dec 2022 15:02:04 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=eGu8=4R=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1p7HeW-00037N-1W
 for xen-devel@lists.xenproject.org; Mon, 19 Dec 2022 15:02:04 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04on2040.outbound.protection.outlook.com [40.107.6.40])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 17f82f2e-7fae-11ed-8fd4-01056ac49cbb;
 Mon, 19 Dec 2022 16:02:02 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AS8PR04MB8134.eurprd04.prod.outlook.com (2603:10a6:20b:3f1::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5924.16; Mon, 19 Dec
 2022 15:02:00 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::4da2:ea8b:e71e:b8d8]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::4da2:ea8b:e71e:b8d8%4]) with mapi id 15.20.5924.016; Mon, 19 Dec 2022
 15:02:00 +0000
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
X-Inumbo-ID: 17f82f2e-7fae-11ed-8fd4-01056ac49cbb
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LQ8EYyTBXCTzMHy+VB9TYLzevQe+N37pZUD50ny1du46wXCEwrR+pQOdrChvw73AZmCwy/h8Seg+gJFgAmm0JZc5bg1MkjiBoJ5B24dMvdrkBXFCxuINenTjN+9e16aBJ6+QPj59iAMvzBq32owjH6zkRFiwFhxE8mMEb1RNidiZCF6MdzDHoaX0O0Hpkjd8XqfmYzyqa4shtRrTii4+IvEjAH6be/jvKoSb6MqkC3MKuzAMsSfAMfQgWySZoS5CSQQJ4B2cRrl4TlrAn9x4MwF0sriVz650jgo3iUTTMNEyHLwmvua11C6keY7PV1HsXHt+2C2um7ImGVpqE3GKZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WlcFXuq1g/XlJtfiZffwTl43JILP6Xj6tBc7eakquRY=;
 b=lguJcK1j9yxBy/ZVIJ4wGGApYGtF4IdVy1vWYJCBR6QfHAyOdGvtOxPASrO/RKE3yYkOhsg1yOw1h2fopBFctA7w9WVyFDae5ANI74OwSG6q5Z5X+52iXOJiueR5fY1ifRtOdrpIkWi6CdLQuT/aSuHUTN0ZzPhZ79vhVQ6sdyXGjPQ5HgK9U5ONsz43MzK7Ma/pWZzmIHjD3jh8NPAehXpmRJdNZvMPb/MfUB+u4xq7APkwrNU0dMCTsiK+7jW16UmFVAZhWJIMFb7k7wCqXLWk60jCqp13ApR0qOrHFUbKi4Ap7NNMO0uvc/W8a32r20UGe8Iucr8z7CAwIBSHaw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WlcFXuq1g/XlJtfiZffwTl43JILP6Xj6tBc7eakquRY=;
 b=KuYt1kjYsyNeI9YIz9dByqA3/Tj0K8zcwNSEWxqj4gc77qlYqJx955i+78Wr63BKAsZG8LLsFFoBzi9r8gcHxuXsJ0zdE3u0/BS2dHnLfvG7p4oij/x2hTjwXC8Txy1fLJ8Yx19giFUi6F1Uk8zBHi53JQH48trYvtRqW8m8Ou3plOMukttsLC/fqYt0dgtoC+3ur989NbGJC632YG/aCX/+2R4gFFM+6A3Ew5+dvCr6mqa8kVDVmNQT+Vs+N0Bc8s3m/m6c0H+hbuAyW303c/I0p+DGfiMuosYmcR2QheTbC6DYgedpwCoLnrtqRYVW1m9dxVOtX3SxX9RDlGny8A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <e87503e1-992f-28d6-cfa5-e0882541a12b@suse.com>
Date: Mon, 19 Dec 2022 16:01:59 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH RFC 10/10] common: convert vCPU info area registration
Content-Language: en-US
To: Julien Grall <julien@xen.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Tamas K Lengyel <tamas@tklengyel.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <bcab8340-6bfd-8dfc-efe1-564e520b3a06@suse.com>
 <f1745e62-8a46-e9af-6a79-592a5402a5f4@suse.com>
 <92e35f8b-72d9-e55f-9218-3f21742c14c6@xen.org>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <92e35f8b-72d9-e55f-9218-3f21742c14c6@xen.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0120.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9d::13) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AS8PR04MB8134:EE_
X-MS-Office365-Filtering-Correlation-Id: b3c2c7bb-95cd-47ce-6476-08dae1d1fb1d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	XXKygtfSTAteKZEZRjstbGVlfymC9ywRYqvA8ty75Y0OKxZ56uf0Z3DAvsRvnOPNmvLTDlOe8pls4YjqnrmUblRH4zwLim4eJMEyloGkAfWxeH+dD8QhMF4fAOe1lBlHtDQceI1IKXkpG91COY4XThnnuMJOVzZKcqbAazdHB9bxhssuv2806r7Ff/gy4wCHz0z2KfubG5Hpd5BHfGBUlW0KQj3WyEVNBzaiJhKWoq04RjZe6+o1PgxPhAnolR+aSWX1D3kdE+vizQ7jhxL4eWirF3Vmzs8GBPfYp7UGxvtzitdUexsa/LuPIz8Uy7KsaSneVsFyCrb2zDN1Iifsu7siFbfx/mQ8tiCijnuqKAfqA1WdJvPHnQxxs4tzIoXH02Lbrv9DL+WAPOwKm9Opp9rSA8Jm+sOvoG5IEOV7+3k0jvJzPxzMKdew1mY0osOiGOf9U47aYcdbLI4DcYxktyJ4zUCjX9FdXPactwVGtKQEM078dfLNE4GH8HE0McsZTnt5GwYj1jvFsTWDxOE3+9RYSUv6pOwacTekTxPc97PTFgm0a34aONcpMZGMdaujXQIQkXHCIpNbsRIFhH+f29+7WQL3OETJy3CaITmAjMVM9ei3bfcnDGixka6kt0nTJEE7phl4Av04k6+22zHEhfN+YaVKbRkuXjE4BxwKZHXKHcPi0wBP0KeQ0ia/TicEFqrg77BgU0USQIhfTQAeeO1oBr9T2i+rd7ObXM3dJyo=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(376002)(39860400002)(396003)(366004)(136003)(346002)(451199015)(31696002)(86362001)(478600001)(2906002)(6506007)(6486002)(53546011)(31686004)(6512007)(26005)(6916009)(54906003)(83380400001)(186003)(2616005)(66476007)(8676002)(66556008)(5660300002)(4326008)(66946007)(38100700002)(36756003)(8936002)(316002)(41300700001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cW8ydTRpT0g1QkZSYXJGTnBkYzc2RW02VGRXWnhNLzVyTkx5MGxUSGFNdSs5?=
 =?utf-8?B?U3dVVDB5SE1MSys1TWYyTC9xeDE3QUpWUS9TUmwwOUc2ajF4a1ZVMHhza2tP?=
 =?utf-8?B?Sk9rNnVweGdLVUFha2xDcnVMUDd3M0FPU1V5MjJvbFRFWEtUZlZrVzRwQS9t?=
 =?utf-8?B?S0Q5Umt3Y0hWdUxldC9TUHE4cHdFZDlueEhML0NveFArT2RMcDFPWmc2Z2Yx?=
 =?utf-8?B?ZzBaQzF0a2VNUFZ4UVZ1a3ZsczlGNG13SVlYWTdrQi9jN3NTa2ZLbTNoeGhD?=
 =?utf-8?B?MUJLaTVCdnpMT0VBc3lMTktrS1VrenNSTUdHZXRUVHpkR0QrYW5EQjBsN0ho?=
 =?utf-8?B?aTNqdDJPb3QxVUtPOXgxQ0F4ZlhPVG1ZRUdaSnBCWDBPUUNNZ2haNnl1Y1lS?=
 =?utf-8?B?b3MzUkRnbXQzL3NVUzQ2clJGRjd0cXJlMk16cTB5WFVWbGVaR3Rxc2JicEt5?=
 =?utf-8?B?Z1VOczhGL3pLOVFQU3BhdHFFMm1CVmNoeXhtSEY3Z0hvdUNUdHRVdGxWS3Vv?=
 =?utf-8?B?M1VVSk8yeU03cHNHeGRrWjhiUjBrS2VQdGJsOFRQbk12cDlzSWwxU1FtT3ky?=
 =?utf-8?B?VHNTWi9iTlk2NHh2VURWVUFmd3VhL1NYdHY0eFlLZHVWdTl2aUdWa0swdHF0?=
 =?utf-8?B?Tkk5UXJ1T2xpcWc0K2Y4SE8yZHRaMnhWZDVtbmFVeldQUEcybkF0TFljV3ow?=
 =?utf-8?B?S3hKZTJ3clJvclVsSmJaODhGV2lBaUkrQjQvV1RtZjhObUtzbGMyS0Z5L3Vx?=
 =?utf-8?B?TzNLckNaTGNLUytCZFFQWTJ3N202bUtPa2dQQWs5b1ZqQkVCbVY2cDlucWVU?=
 =?utf-8?B?RjVrVjVaVURxT1VmNkQ1SEh2QnBUem5LdXhEcTRPVmswekZ5T3AzQnBvUWp4?=
 =?utf-8?B?V1hDamM2TnBhRklBdEs5OU9ybTBCK0NmMHZJM09VVnNHQ0NNSTdpaXJmcWJ3?=
 =?utf-8?B?MXIzQTRNRHFCZ3RPL0o2VXVrVHVDODY1bDgzUllrU1BuOUdoekhFZHY4ckRE?=
 =?utf-8?B?V0F2OGI4aXphODJuMlNkazRzRDdJelZPb2N4QWI1ZVd2K2J0Vi96MXBoZVRK?=
 =?utf-8?B?LzVtdUpsLzdKUXBIdHptVFd2U3ErV1oydlpYd203eTdvcFBsVzZoOE5QNWFV?=
 =?utf-8?B?MGZwancrbG1jR3NROTNvaW1VME9KRGhUU09jT1JuMXExWnM5b3cxTVg1WHZM?=
 =?utf-8?B?Smp2WFkvL0IwN00xaXJtN2FaYzhLS0cxNDhFNm92d2NOWlE5b0swcG1mUE4v?=
 =?utf-8?B?ZGRFdjVSWHZxM0RRR1hKMEVGVW5KVXI1MGFzeCtGWU44NFlMeTlQQXhGVVNp?=
 =?utf-8?B?MWE5Ry8vWDdMZTlPUmVQbmx6TFVPWCtNRWxtZ2NzcmI5NjIxbWNwUmtBTmo4?=
 =?utf-8?B?ZWZYQ21yYVgrY3VtbnpqdW4rTTdaZ1BJNG00dndjRWV4YldBZnVEWFdHZWx1?=
 =?utf-8?B?QjVudy9qcFRaWTQreXVvaU0yOG03OVFRN0RpcTdrcVI5blFVdWFSUXBWajBZ?=
 =?utf-8?B?Qm9HdFFtKzlPaEVtamFCOXE0OC9hMnVvUks3NU1ISXUwd1ZYVk40YUNZcjJQ?=
 =?utf-8?B?U0VjTmd1TjBNS3A5R2ZyQnMyQjF5T3F5WkNQWDl0Ky8zNkVxR2xvdE1qcElP?=
 =?utf-8?B?VGU4WHJXSk93bTNGaDN5M0pPZ0l1WU1FTTJxOGdDNGFhaGN4TU5kMFk1NmZO?=
 =?utf-8?B?aVJiaGJlbnltZUc1QUFVMXZRMDEzbmZVYXlBZ2ludkQ5YS8vRWZ2UUhuYzdi?=
 =?utf-8?B?RThXUzhHOW1xQTlDYTdYR3BDNG5MdDdjSHN3UEpGMVJOZkptdEdXanBPejZ6?=
 =?utf-8?B?ZFVNNDVTWWhHNTdWRlREcG5YZDcza0xtTVdZb3FRSEtwdjBBM0g4UDBlZUhJ?=
 =?utf-8?B?Yzl2alZMWGVMWUVYZUF2V3FOdkdwYUFDd1ZSUVBhRUphcHlLbDR3MGwrTG9G?=
 =?utf-8?B?Z3YvT3ZXZ1RDZTZaS0lYajR4M29WQ0xvWFNlT20vQTgyOUdUZDl6Y0htVy9S?=
 =?utf-8?B?ZlNON3RBNXAwMnJ1cmluVjZ3b25ZQzl3dHI1Z2huSXpVem5LQWUwQVFacjJy?=
 =?utf-8?B?NzFKTkMvSjdQNEFnS3ZLNmpMUVBnVEpGVEJma205R1hKVmV4bHA1SlZ0dGJI?=
 =?utf-8?Q?Rj1ERnefs2dL9KZt/kPA+oyEn?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b3c2c7bb-95cd-47ce-6476-08dae1d1fb1d
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Dec 2022 15:02:00.4705
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rttWha6owp2rBacOqndCoV7m6LXnOToRJLjl2pzKsUNIfUGhuSx27vlgEvwK07gTThvCpR+BZGSxkOVL4bEh3A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8134

On 17.12.2022 16:53, Julien Grall wrote:
> On 19/10/2022 08:45, Jan Beulich wrote:
>> Switch to using map_guest_area(). Noteworthy differences from
>> map_vcpu_info():
>> - remote vCPU-s are paused rather than checked for being down (which in
>>    principle can change right after the check),
>> - the domain lock is taken for a much smaller region,
>> - areas could now be registered more than once, if we want this,
>> - as a corner case registering the area at GFN 0 offset 0 is no longer
>>    possible (this is considered an invalid de-registration request).
>>
>> Note that this eliminates a bug in copy_vcpu_settings(): The function
>> did allocate a new page regardless of the GFN already having a mapping,
>> thus in particular breaking the case of two vCPU-s having their info
>> areas on the same page.
>>
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>> ---
>> RFC: While the "no re-registration" check is retained, it is now racy.
>>       If we really think it needs retaining _and_ properly enforcing,
>>       then locking will be needed, but I don't think we can hold the
>>       domain lock around a call to map_guest_area(), first and foremost
>>       because of its use of vcpu_pause().
> 
> function like evtchn_2l_unmask() may access vcpu_info that is not the 
> current one.
> 
> So I believe the check needs to be reatined and properly enforced. 
> Otherwise, the old structure may still be used for a short time even if 
> it has been freed.

Good point, I'll try to come up with something suitable.

>> RFC: Is the GFN 0 offset 0 behavioral change deemed acceptable?
> 
> I would say n  (See the previous discussion for more details).

Of course - with 0 going to be replaced in map_guest_area(), the check
there needs to be adjusted accordingly. And ~0 was already invalid to
pass in here, due to the alignment check.

>> RFC: To have just a single instance of casts to vcpu_info_t *,
>>       introducing a macro (or inline function if header dependencies
>>       permit) might be nice. However, the only sensible identifier for it
>>       would imo be vcpu_info(). Yet we already have a macro of that name.
>>       With some trickery it might be possible to overload the macro
>>       (making the "field" argument optional), but this may not be
>>       desirable for other reasons (it could e.g. be deemed confusing).
> 
> You might be able to reduce the number of cast by using local variables.
> 
> But it is not entirely clear why we can't use the existing vcpu_info() 
> in many of the cases. For instance...
> 
> 
>>
>> --- a/xen/arch/x86/include/asm/shared.h
>> +++ b/xen/arch/x86/include/asm/shared.h
>> @@ -27,16 +27,16 @@ static inline void arch_set_##field(stru
>>   static inline type arch_get_##field(const struct vcpu *v)       \
>>   {                                                               \
>>       return !has_32bit_shinfo(v->domain) ?                       \
>> -           v->vcpu_info->native.arch.field :                    \
>> -           v->vcpu_info->compat.arch.field;                     \
>> +           ((const vcpu_info_t *)v->vcpu_info_area.map)->native.arch.field : \
>> +           ((const vcpu_info_t *)v->vcpu_info_area.map)->compat.arch.field;  \
> 
> ... here.

vcpu_info() has a property which gets in the way of using the macro
here. Since __vcpu_info() wants to return something which can also
be used as lvalue, the 2nd and 3rd operands of the conditional
operator need to resolve to the same pointer type. Hence the smaller
(compat) type is the only one which is safe to use. See the comment
next to __shared_info()'s definition (which is the one __vcpu_info()'s
refers to).

Jan

