Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1325F666F0C
	for <lists+xen-devel@lfdr.de>; Thu, 12 Jan 2023 11:05:15 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.475950.737875 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pFuRi-0005OJ-Fi; Thu, 12 Jan 2023 10:04:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 475950.737875; Thu, 12 Jan 2023 10:04:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pFuRi-0005M7-CX; Thu, 12 Jan 2023 10:04:30 +0000
Received: by outflank-mailman (input) for mailman id 475950;
 Thu, 12 Jan 2023 10:04:28 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Lmgi=5J=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pFuRg-0005M1-SY
 for xen-devel@lists.xenproject.org; Thu, 12 Jan 2023 10:04:28 +0000
Received: from EUR03-AM7-obe.outbound.protection.outlook.com
 (mail-am7eur03on2084.outbound.protection.outlook.com [40.107.105.84])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7fb6baa2-9260-11ed-91b6-6bf2151ebd3b;
 Thu, 12 Jan 2023 11:04:27 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AS8PR04MB8296.eurprd04.prod.outlook.com (2603:10a6:20b:3f2::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.13; Thu, 12 Jan
 2023 10:04:26 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2991:58a4:e308:4389]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2991:58a4:e308:4389%7]) with mapi id 15.20.6002.012; Thu, 12 Jan 2023
 10:04:26 +0000
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
X-Inumbo-ID: 7fb6baa2-9260-11ed-91b6-6bf2151ebd3b
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EqR63RmIp6gVTn3ktjENM1dhrnlCeFRojk6W10Q2TQkY/e6nwPHuQAHhQJZkCQvdCK+PDbEBNz0qUuyLFVaQaI9kL8tM+dwT/eQj4JPiZACp55eKz5sAbUJfmXso6+dVBb4cO3UlpddEdPU8wWImlXxx31q30no5iexlVgyyRiOvwLVafb+qBL8W9e/VjJrN08qI+MagvyqoonkX7NQMuGPuZAz3ii1TF45q9/zoNPhNvGPoA+bPtcnWbqJuS60da4zM94UfliwkCPuvYwm0Kilem3zw1dxoX2imNunf515RvL2SkijTXkArolJq0mHLUefoHZDrJVXbRxHM4MJn8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QgD9SrKU0oo0baPtu3i+s2mTRlx/++FDvuMpUVol4ro=;
 b=IewZvXYDF5GVWq3k8p0dQf3ysQdAvAjpC+S5Rpp9WG/oLBt7c0zT+tTM+dlVngd0Uk5bMRyaLWw2tA85vSWiDTc96YIbD0P1ARhIqkHxvbdVEFT+aVkBISqapKKV+XnQg0se63+Ap1E6AJHbB9KKgw64kdkyaeQkZtMLyq7mSE1aBkJqX8Fhu0iZQ7yTMoauuoVMZtdJy99Wup8eU7xzQoyIO8acllsXpFohCsxExiwXVxfGk3+EqjBq7cJk6pyRZt2qzeCiDbNRtrf8JMHTvZzxnCmzfob2Wx2X2P6AjmGCaaw8sTUQi4x3kuBlR4hhusKyYhnUs89VV8kQBqPhZg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QgD9SrKU0oo0baPtu3i+s2mTRlx/++FDvuMpUVol4ro=;
 b=NyG91mPXeMRa/3rbFtcizpWc4T8SzeDp314aGHDEz333ZLKJqTwbrFRyyqM/UScQOVmFtk6bQzy0jhdKii57Or2lG4g8CYzvmB1sKHEO8r5MFCwpcUiAQpAYT9SJJlvBER48GRDoE12d9NqCrsger1XZZHIWQvlVW7duILiwBGjJ3/lr5KPhPSX0bpHIw6LI/qcZVpP3k5qBi8n+Z9VfgrysDFRdp3bCnqyibLeXSLid7HweU272menbr6dx8RnZKn+HIgRjeULApSr31Ky6/GNUT+k+vdugE4o3fJrSBQiZ1orcX3HIl8tYXkTYmv1QETJ6+1fe9RHQ3gSzcp0R3g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <3729733d-fa73-5221-4922-3abe40ffbbb2@suse.com>
Date: Thu, 12 Jan 2023 11:04:23 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [Multiple reverts] [RFC PATCH] build: include/compat: figure out
 which other compat headers are needed
Content-Language: en-US
To: Anthony PERARD <anthony.perard@citrix.com>
Cc: Andrew Cooper <Andrew.Cooper3@citrix.com>,
 George Dunlap <George.Dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <20230111181703.30991-1-anthony.perard@citrix.com>
 <5c7ffbe4-3c19-d748-9489-9a256faebb7a@citrix.com>
 <750ad2e8-a5be-d9c0-846e-41bb64c195fe@suse.com>
 <Y7/Shv1qyi0jgrai@perard.uk.xensource.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <Y7/Shv1qyi0jgrai@perard.uk.xensource.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0012.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1d::15) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AS8PR04MB8296:EE_
X-MS-Office365-Filtering-Correlation-Id: 002118a1-0164-4a99-e757-08daf48462bd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Tbwk2N+alil9JCgcU0nc4sex94QmAeLu0JdCyETp4X+L/NwZO9Vjv8u2k87CiMQgW2Kmz9C56S/BvtAaK0i8UQEmGKys+n714q9pv5dRrXYV6ITQzGZ4jT5377l80EVYRCV9UfpxEIo5wYEaYXXnqsmq2aje/qMGR/fsSI//HUIfCRHs9e34JNb5uTCnYzQpXd6ywHGSgvnAoNBz16jyEl3Y99HjqFMN6T+b6Lp/aUd61IT1ZveFjz3A/C1NBxih51e8f87h8t6pPJqMsmMU4JQ/qnLJyHDREz5LHOo7JdOJWEKUdg51Z3QLlzDg94FVc8AgncmUL2ZEIj9k6UMCFvT6JOSqAwQ4BSHxoyHVLVEdNSya7qpYOqn0H+8EFizOUpi5/zG6Vd0nvm5pV4WNltXlPQ6ozGbUvP2TjWrSjQlNYscgKgVMwO7uIEkK84ZwbZ8cvVRI5brxUNUO32ox30dgjc33YDRAus+2eTd9lvdXGtSnsj7ER52tq9ZhQC42zZKNtcXn0OsCinTvv+kAylBuFZ0/ihnPp6YqEJ3blDriHZVR4RHqrPmTccWtskezRvTQDyCuRRVg/RDKfJMOqMFn2LWfGqk7jlW43hLsa0nMJhkfR3GLI5jxzorGCfWQjVqLYXfxqbL7co3nMbdxdkuW8p1Mv6S3CTyyCBVbElgmeNuMigdWLMsB396EYnoSfqZdmlsatZBTAvHBWDwKbNS4tkJ16DIYmoKLBXAcVJbQtgjr1nBeB+RgqcZUjHL1g+bsUZjghUcenwsvnWCeiQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(376002)(396003)(366004)(39860400002)(346002)(136003)(451199015)(5660300002)(8936002)(41300700001)(38100700002)(36756003)(2906002)(31696002)(86362001)(478600001)(6486002)(31686004)(966005)(26005)(6512007)(186003)(6506007)(53546011)(8676002)(6916009)(4326008)(66556008)(66476007)(316002)(66946007)(2616005)(54906003)(6666004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MGFITmJoRk9nL1B6dS9DejBuWnhBdkRLSGNhTVBUQk9rRGdmSEMzellsWWNk?=
 =?utf-8?B?UTJ3eTlEd2ttQ1g0SW8zNVh4K1ZjVHZmcE0rQ2diMDBhdHpVbXZZczZPb0sy?=
 =?utf-8?B?eU9sRkt0SnUrMEsycVlXL2ZxK1FvTk5GQS9Ia0FXYnQ2TVN1VGdSY3M0TFcy?=
 =?utf-8?B?UzZmc2lkL3h4cmtMVysxd2kvK1F0NVJPZWZFREdOV210dTdVQ1JEVldvUHVP?=
 =?utf-8?B?NUNMa1Vwc1llbHRuRHpzU2I1akJjQ250MDc2VFdFRkJZYVlWN1RNY0lZUytY?=
 =?utf-8?B?eWFWUUEvZkVxb1RCWmZycGl4UElxZU1oNE1ISlNqaEMzVXZnWkRnYVRBd0Fk?=
 =?utf-8?B?R3JqRzhPSmMrS0w4UzlvT085TGx2UkZDQ3hBYUgvMm0yQy9qdXlBSlV2M2V5?=
 =?utf-8?B?M2dxdmxvbVlBeVFXc0doeGU3REsyRzZZSThNNmFxU3RseFZLa01aSXp1NFhn?=
 =?utf-8?B?TU5pb1htQjIydlZOWE43bkxVQkEvQTJRbzA0VnBCREx4blhJN1J2a0hiamdH?=
 =?utf-8?B?V0Z3TEV0RjJWTUpBQlVZK2I0OXllM2lQNW5UMUJFcXkrdnRzaTIyejloNEpS?=
 =?utf-8?B?YUdsUDdtVENWRzNNZHlvTjM1Smh1cFNZTGIzYy9SNkhtSVBkaldSeDZiQnoz?=
 =?utf-8?B?andXZjYza2JLTm8wUzJSakJEVzNkKzNpZ0tTQzM3dzE5UUFSMzRXRGZ2Z3Nv?=
 =?utf-8?B?aWpCclpQbG4vKzczNVY4ZFgzZUp4Qmc2RE1xbzZXMnp6aDNWUGp3VTQrMDl2?=
 =?utf-8?B?QUxFYzdtWUQrdnZ1QmkvU1VIcGFVMUc3bmNPSmpmRVczdWxMVWJmSzB0WDVz?=
 =?utf-8?B?Q3VTeXpGbFU2bFIraXJvSThXa0dQdWI3TGlxY04xTlpXYnEzK0ltU3RyVTRi?=
 =?utf-8?B?dGhCVmVSSnZHbGQycmdBaUx5V3Y4T0Y4ZFAveW5HS1g0NDdOZmtXWVpwdEV3?=
 =?utf-8?B?bklLdmtOd0loUFc0eVNpT3FwWTVaaVFHY1paM2lwdnNYZU00Tlc1bG84VHJv?=
 =?utf-8?B?QjlYTno1Y1FqTk81Qy9BVzMvSlAvbjhjQ1RkbnFVbUxKVEpXRFVKNTJjTEt3?=
 =?utf-8?B?TXJqMlZSdnQ4b2JkUVpEZEFBM0Y2VHNWZmdMVGplYUkrdi95Sk9lSWpPQW5q?=
 =?utf-8?B?aXliRmxyYTNORHJ6b2dsa2xNcWcwKytPUWZGNUFMaVJyb3I3ZkF4NGRoZ0pS?=
 =?utf-8?B?STBIMi9HNHVsNFl3ZEhHZ200ZCtZdG9seW01S3RldWFYZ29rR0JXWEdyblNs?=
 =?utf-8?B?bVRaUm9xNlRpUW41c0R1TzBZWlJ0TnVWdG1SN21icERQaXFoWGNLN2VPby9n?=
 =?utf-8?B?dDlURzZabGFFRmlSZWdHem85ekhHbUp2R1dvV0tmYkZab3RMUzhNdkVyOFBF?=
 =?utf-8?B?WHB2ZkdteWhVamdueDAzTk9BSVRuc3A3aTd6a0FaKzAyb1ErRllQZFdmQ1pp?=
 =?utf-8?B?cEVGNGdMa0NwS05USGRQNGhSaEdlZllQRktTemFDYXB2U2xTL1FYZ0tja0Qz?=
 =?utf-8?B?b2VqQldjY2FRYWphSW4vb3M0eklUU1NvakNQY0FhODJRYjFQZGxjVlR5TXkv?=
 =?utf-8?B?M29obSttU2gxWVBjQVpoN1IwRWlWN3BJbzJEUVU2WXNEVWY5SGFFT2kyUk9m?=
 =?utf-8?B?NHl2bXVhSkpScE9JMXFtRDh2RFptbi9CSUZabk1mV1JIdmRTUksxZ1lzRnVF?=
 =?utf-8?B?OFRVMmRyKzFWVzF3ZnVTSHJGZXVhZ2ZTZVd5d2p1VmpLT2tDVlEwK01BSHBG?=
 =?utf-8?B?ZVVpQVZVaHZWbzZjMlMvM3ZLTE9pNUdjalVQazhjWXZhWE9UczFDYkt2S1JR?=
 =?utf-8?B?eWNkbmdIRzNaNmIrNVo2dWFGTm94VEZrQmd1azQ2ZXd6TGJWUk1acVNaMW9j?=
 =?utf-8?B?dHpzSDdBUXFVRFRmZm93bFBzdCtFbVNmVmwrYmxYTGs2L3Y1KzY5ZDlkc2ZL?=
 =?utf-8?B?MXBUY3JLQysvVUplaWFkbGZSNlEvR0pxcGk4SzR0YkhtcW5MVlAwRUg0NWJT?=
 =?utf-8?B?KzNoUk9ic0pldW94ZFJQdkFPajZyQUpzL1lnS3lvcmRyeVVxbGtndXpLbFpn?=
 =?utf-8?B?MHdMMVhTeFlWVXJsVFlTeTN5eVBQRzNhRGZER0xnbEtvbFRkRHhaRjFLejZX?=
 =?utf-8?Q?4AewLeO8IzaLALO9uoRmkzUCg?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 002118a1-0164-4a99-e757-08daf48462bd
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jan 2023 10:04:25.7694
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IpVnERO8BwG7337sIiKtRKywsjKC2FxdcC6hUdoRgRgvsoOA74/mPcMX1R2L0QS9RcTH3+nobZ+R3kWzKBafKQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8296

On 12.01.2023 10:27, Anthony PERARD wrote:
> On Thu, Jan 12, 2023 at 08:46:23AM +0100, Jan Beulich wrote:
>> On 11.01.2023 23:29, Andrew Cooper wrote:
>>> The real hvm_op.h legitimately includes the real trace.h, therefore the
>>> compat hvm_op.h legitimately includes the compat trace.h too.  But
>>> generation of compat trace.h was made asymmetric because of 2c8fabb223.
>>>
>>> In hindsight, that's a public ABI breakage.  The current configuration
>>> of this build of the hypervisor has no legitimate bearing on the headers
>>> needing to be installed to /usr/include/xen.
>>>
>>> Or put another way, it is a breakage to require Xen to have
>>> CONFIG_COMPAT+CONFIG_TRACEBUFFER enabled in the build simply to get the
>>> public API headers generated properly.
>>
>> There are no public API headers which are generated. The compat headers
>> are generate solely for Xen's internal purposes (and hence there's also
>> no public ABI breakage). Since generation is slow, avoiding to generate
>> ones not needed during the build is helpful.
> 
> If only we could do the generation faster:
>     https://lore.kernel.org/xen-devel/20220614162248.40278-5-anthony.perard@citrix.com/
>     patch which takes care of the slower part of the generation (slower
>     at least for some compat headers).

Right, and I still have this in my folder waiting for a review (by someone
knowing Perl better than e.g. I do). Maybe you want to put on the agenda
of today's community call an item to see whether we can nominate someone
with enough Perl knowledge?

Jan

