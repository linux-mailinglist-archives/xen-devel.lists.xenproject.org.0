Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 10377696A67
	for <lists+xen-devel@lfdr.de>; Tue, 14 Feb 2023 17:56:28 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.495401.765767 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pRybG-0007qc-Kh; Tue, 14 Feb 2023 16:56:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 495401.765767; Tue, 14 Feb 2023 16:56:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pRybG-0007nS-HB; Tue, 14 Feb 2023 16:56:14 +0000
Received: by outflank-mailman (input) for mailman id 495401;
 Tue, 14 Feb 2023 16:56:12 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=jX19=6K=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pRybE-0007nM-Ov
 for xen-devel@lists.xenproject.org; Tue, 14 Feb 2023 16:56:12 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on2062d.outbound.protection.outlook.com
 [2a01:111:f400:7d00::62d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 767fb51b-ac88-11ed-93b5-47a8fe42b414;
 Tue, 14 Feb 2023 17:56:02 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM9PR04MB8113.eurprd04.prod.outlook.com (2603:10a6:20b:3b5::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6086.24; Tue, 14 Feb
 2023 16:56:00 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e138:4fc3:705c:d178]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e138:4fc3:705c:d178%7]) with mapi id 15.20.6086.024; Tue, 14 Feb 2023
 16:55:59 +0000
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
X-Inumbo-ID: 767fb51b-ac88-11ed-93b5-47a8fe42b414
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ek6CRwTWag4BMm1OlFjejGEIdxKxmeUxF4JfNdjZWHwfG3ACDedPTcohphIxv3JsC+nfaLMqehr1xd/LdxfpfvD2wkyCEp4gpRonuyJ7WZZCnN0JNz6SrzX1ZFy3AVWXOLdEb8ofoZMpL8tOttMqsK+Cfe5AMecA9SqffxkLsNrkJS2ZMg9R3TY5ZBBKXpwIg/cAUs+NqCeEJSr0T1NO6fkhWwljvhv2qKc+zTwo8KjnHl3/F/okbKDW0LGRdi7ESHNONJsaDkI/p4AuLd1ec07z9p4x6Meo+uPC4Wzp0MhwY9DEG5CSMchZtZ5omt3B0DVQumhX8U+iRBsVrjdstA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Zk8iQbzQEbnZJK2ZTkoi+kHm2g1qKl1Ss+iKSUroZSU=;
 b=XZcrJzSey2b1zbjfSyPiapzVfljxxu3VbpKlxAbl1hM8LVcjMW3gYzXIQVtY1tTUkFxZQ3i6Tj9KF/7jsjyjhJ5xx4TtkxFyOtwfMfYBKeU0ZxTQvgQ4/O4IZq4vvfn4pbznf4gWa+WGRZOAijNB2OVG73W2e9W0XljIEnVZQjT3ZuY9dvCZayBG5Va2gT5qiQlxuaGjOd/ZSDTnIAxEH9l+VCENdBnIiHE1vJXzgm/apsPOAdJrV2gUM9/j+WckS4i9UuinqZhLaUCElBfxYYshi26Bid7CX1J1hHNb3QmpxA/ctiZ71BQZZWopawQ4VXWjQyKlF1MjW+c2aBUQUA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Zk8iQbzQEbnZJK2ZTkoi+kHm2g1qKl1Ss+iKSUroZSU=;
 b=skj1vEkWyZC0RS8hN4PP5TiM8Ki4DEshPuXOLr+qoXz/CGLpcljw1cKya4Hz5RMtuI45sG/AugcoH8ovpqrxvTJ4my2cKQh0CJHoMZh81zTNWydRB1gT+3GKTCDTMKwlyNr7Z1U3Grljo8Mh44tujKzbKpEWyFnWp1MAuJFljQOoxnvrf3LZsvgqoq3ISH8jWEnKoqq1hRJ6gHxjVpBTn6PFotorSf18xaBznG6Ue4mpcuwsxWKQP40KESulUpRSBGZg6KXyLySIPvNUcfnsaO1Y1GfwUYCb4QcC1WfVUtcvyyyKSxHuin7K1p+twqYS9zFjxyCFJcwOOR7SRKW2dA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <9cf03b23-586b-92e1-c0b1-578f3eadd2ad@suse.com>
Date: Tue, 14 Feb 2023 17:55:57 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.2
Subject: Re: [PATCH v1 1/4] xen: introduce CONFIG_GENERIC_BUG_FRAME
Content-Language: en-US
To: Oleksii <oleksii.kurochko@gmail.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <cover.1675441720.git.oleksii.kurochko@gmail.com>
 <8adf4aeff96750982e3d670cb3aed11553d546d5.1675441720.git.oleksii.kurochko@gmail.com>
 <199fa5a6-ca31-091e-88e0-cae9efde307b@suse.com>
 <81fd6cf5ff59acf6ca8b66e093630e5accc45198.camel@gmail.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <81fd6cf5ff59acf6ca8b66e093630e5accc45198.camel@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0203.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a5::11) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AM9PR04MB8113:EE_
X-MS-Office365-Filtering-Correlation-Id: 0080ee65-2aa6-45dd-3188-08db0eac58ef
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	rVwqbmnBmJj2PzXpHkf3bfxG9r95o8dLNldGc2uMjdPgEC2HEMT0Ab/BClzg+iz+1vZzuwKEL98abj3NWOJ4xsJuDMg/Q/1HsmBV6V+7JE2WtISXaeSwAiO7bRTNeZZ6lUW0+gB0s2ltagPx36aUjNt5gydU9Iwob+/07ufAa4HpMDVxJckoz4vxIinPbtvXxGcbRauSei5AQfwtt6/k6oxg/cH6DPnO+4XE0Gh7+U05AInFsVjLh3kP++mmV/q8z0xA5McC0Weabji5SEahdOsOjbi2I1sDlr2hlvNYCzSW4VbM2ckwcsDDWnfq6q8cO014DJ8jI7/aCsVqIHTkBxS3LR6pIcmYxtZON4+SPuJQOV/eHnyi5I4Xzz5pCyysXKSOSUYcUNnQOqdMzYXpIzOYUHl9wBRJzimC7GZaf76A4PHDO+3hSOmdhXEQwVu+sA4aP0iWI0eJMYXrRzT/y6Y4R57Qb2nBiC7Xuh1pF7dxtZKwa9NI+uFyiYwYCg1Zr+GCUD+mlBNCxqtnvw8Qy+gd6n8xPiCfZyVHRhdoSMDuGaxej6O6JcKD6M1oY9B3qYX1+MquAbMclJyINIyOmQrQ2UHAZsq6iIGFmp2EqrLqNXh+FtOY8vT5qv+pIMrki1tqjKpvNGRoQaCJgCjDa7Ckk7cvhwa8hPzoD68FHxl+oS9ha8lBhjubrDNfW36liNocBpxCYuViI+PcqZXzWGbgkw87h73Y7VyU0MhgSBXA1jc9KkSrcYX+PpHMQ98d
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(39860400002)(376002)(396003)(136003)(366004)(346002)(451199018)(6486002)(8936002)(478600001)(38100700002)(31686004)(6506007)(53546011)(26005)(6512007)(186003)(2616005)(316002)(6916009)(66556008)(8676002)(4326008)(66476007)(66946007)(54906003)(41300700001)(31696002)(83380400001)(36756003)(5660300002)(86362001)(2906002)(41533002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MmZyUHhaNEVYUndSMjJRd3lzLzJIeFp5eUNFNlJNeFkxUGVNTTFwQ2p0cEtl?=
 =?utf-8?B?ckRDUlEzZitJV1poR2JQdmpQemZuTGRxWFRPUlpBTmhZSVpzZDBnWEpySWVH?=
 =?utf-8?B?SFR2dzZGSGJkcWhzaGVib2J5QURwVGtrTTFkeUpGZXZmTnVIQjB5OGJDUGxJ?=
 =?utf-8?B?Q0plNVZ1TEV1alhoTkhMaFJHRXVWejRSOHI0SnNBV0twYThIMVdZRFZQRWN1?=
 =?utf-8?B?VUE2bnI2Y1FCVE5qMzhUb2VkL0haa2s5d3VXTWh3eXMxdWNtNXkyaU9FUzV1?=
 =?utf-8?B?VlQ3N3NVdTBSNGRTb3ZORG1iSVFzMnRmQ3FKSXNwT3ptK0Z4U0h0dDJqazZr?=
 =?utf-8?B?V01sVkU3V0VkNnhjRzRqM09Lb3Bza0lXejJIYlk2NzhMazQ0Tmw4R0FsbFdx?=
 =?utf-8?B?ZnhWZDlGeTd2RU95MnA2RFJTMWZJSVpNa0d6ZlNoTjVSZ0JndWtmMFZ3a295?=
 =?utf-8?B?V0RhdmtJamNrc2dqaS9NWnVIWXZKekVqVkxUR01tai9mWDN1OC9rS1p5cjJa?=
 =?utf-8?B?am0rdDZHT2Y2dnl6cFhOSkE1eTFrUkRFN3FNR1Z1UFZ4TERuUEtGS0U5R0Zw?=
 =?utf-8?B?eGRKc25SS3UwcU9lSTZLTWgxYlRxa2pLUE9IV2FYYkx0SWt3ZUFRMTlHSG1h?=
 =?utf-8?B?SHMycXpHUkhIMWZjbCtRYUJoMkZyaG54ZVpXZXdtcVVjS0F6N2o3UTdYN1Br?=
 =?utf-8?B?RU0zY1NLZjJDQU5RL2lXWnVXVktaVE5Uc2FEWlNVbGoxL0hHOTN3ajdyZGl6?=
 =?utf-8?B?dWV4RFVuUVRidXgvQmd5eFplMmNQcXNCMFdyZGduKzB0R0xyZ25lRVNOYXFN?=
 =?utf-8?B?dFZYdUJLc09Obm1JM3p2N1o3K2VFY1B3NzRiNUZWZ2loSFZBQWI1UGVsVHNs?=
 =?utf-8?B?SDdSUzE4M2FsN0xtRTFITzFoRTg3OUFPUHJra2hHL2dyOFdHTmJoWFl0Q0FP?=
 =?utf-8?B?Y0NxQ0JEeG1Cc2pNV0FmZlM1OU1vUU9Ba00vVERjaFNHUHhOQnJ4OVZKRGp0?=
 =?utf-8?B?WFNsdTRTbVZhOCtTSnJpcFYzcmhoWmRIY200eUY5WkxlOEhpTmZDeGN2c2c1?=
 =?utf-8?B?ei9XVzRkbVA4Vm1vamErK2NXU2xubW9CSUorYkhlU3pWY2s2MUJkY21TenF1?=
 =?utf-8?B?TmpoV0ZqdnN2V2NkKzl5TkNCcTdvci8wREZoRldXSk5TcGQ4cjMvTWE1Ymp4?=
 =?utf-8?B?RHp2ZGVmdG1Sb2FaQTV2c3hROEc3aUVzbmMwdGFoTTNQbDY0RHhhdHZuL0Uy?=
 =?utf-8?B?S3Z3M3VvMnVCTHNMSG1uUzZBclFZT2RLYTZTbmJidUZtN2hzYkNLSURnUEp1?=
 =?utf-8?B?UTNYbkxmQVZYYzY0ZWozZEhwbkJaclBKaWtzNnpwMERnVlZDTis0QVArWXNh?=
 =?utf-8?B?ODRhaXZORVNLdUt1T3kvUXJWYWpvRGo3UHMwTFpwOFY3bHRzYlp3bndlbUs2?=
 =?utf-8?B?MWVaSklvbTRBcTc4MDRwTXVGcFNQa0YxSmZGNS9EaStSWFB2WmRRYmVzRTk2?=
 =?utf-8?B?akUyUGdSRHk4QS9vZ2UwSDFiaThwLzJObXpFNzJralo4aTRveU1Za01zVHZr?=
 =?utf-8?B?bTB4NkNJWndYMy9PWmEySVdrYlpGVUFFZncyOEZRZFhmTEFNS2sxOTBXQXh2?=
 =?utf-8?B?VldGUXVHQktkb2M0MVY5N2FCdWZZWFd1Z2FOSTZiMkY1UDliOWFEd3ZjMmp1?=
 =?utf-8?B?THVOOEsxWFlTR1ZiMmlTa2hKSnhDTEx2dVhKQnc5c29VR21qU3FZYUxPRVRo?=
 =?utf-8?B?ZWtaWlJVanpVZ1R3MDVNUERPcWc2ZWpWSFNHWS9yUVpIUXk5TUVGdkd1cHFi?=
 =?utf-8?B?YXlMK1B0aDU0WmZRMkQ5NEtMdDN5OUFVVklJMjQ3TTlYc0hpQVphd3ZTcHdI?=
 =?utf-8?B?d0JKd2s3UWF4bGY5RDlGcWM0RWU3TTVQaVkydDNTZHBzZXc4ZW1EczdQcGRI?=
 =?utf-8?B?cEw0L1FlOWsva1N2VGE0S2laY2FNT1BRV3IxbGNqcDFDaTBtUU5OYTBlOTRz?=
 =?utf-8?B?dFVxcXVyWmdwMXBUcXFmR0lEN25DV0NxdWpTakQrRGEyckZQSHJ5NmpVRU16?=
 =?utf-8?B?bmN4TlJFSnVlNFRTdFB5U0lRNkNNQXRwMTJ6VFpJMTBYbHNWbjdKdXFzNk9n?=
 =?utf-8?Q?vKxRyEOxknSjY/ieuaUgKD1wK?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0080ee65-2aa6-45dd-3188-08db0eac58ef
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Feb 2023 16:55:59.4166
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sIAKkvvB6LqpLJXFXgFba8GGksikvPdRa6ZD4t3Sh7hQM/p8vEXJWzt9YccIvOqMXSp5+RBM5m5GoGrRJtC5Iw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8113

On 14.02.2023 17:22, Oleksii wrote:
> On Mon, 2023-02-13 at 13:24 +0100, Jan Beulich wrote:
>> On 03.02.2023 18:05, Oleksii Kurochko wrote:
>>> --- a/xen/common/Kconfig
>>> +++ b/xen/common/Kconfig
>>> @@ -92,6 +92,12 @@ config STATIC_MEMORY
>>>  
>>>           If unsure, say N.
>>>  
>>> +config GENERIC_DO_BUG_FRAME
>>> +       bool
>>> +       help
>>> +         Generic do_bug_frame() function is needed to handle the
>>> type of bug
>>> +         frame and print an information about it.
>>
>> Generally help text for prompt-less functions is not very useful.
>> Assuming
>> it is put here to inform people actually reading the source file, I'm
>> okay
>> for it to be left here, but please at least drop the stray "an". I
>> also
>> think this may want moving up in the file, e.g. ahead of all the
>> HAS_*
>> controls (which, as you will notice, all have no help text either).
>> Plus
>> finally how about shorter and more applicable GENERIC_BUG_FRAME -
>> after
>> all what becomes generic is more than just do_bug_frame()?
> Thanks for the comments. I will take them into account.
> Right now only do_bug_frame() is expected to be generic.

Hmm, do you mean to undo part of what you've done? I didn't think
you would. Yet in what you've done so far, the struct an several
macros are also generalized. Hence the "DO" in the name is too
narrow from my pov.

>>> --- /dev/null
>>> +++ b/xen/include/xen/bug.h
>>> @@ -0,0 +1,127 @@
>>> +#ifndef __XEN_BUG_H__
>>> +#define __XEN_BUG_H__
>>> +
>>> +#define BUG_DISP_WIDTH    24
>>> +#define BUG_LINE_LO_WIDTH (31 - BUG_DISP_WIDTH)
>>> +#define BUG_LINE_HI_WIDTH (31 - BUG_DISP_WIDTH)
>>> +
>>> +#define BUGFRAME_run_fn 0
>>> +#define BUGFRAME_warn   1
>>> +#define BUGFRAME_bug    2
>>> +#define BUGFRAME_assert 3
>>> +
>>> +#define BUGFRAME_NR     4
>>> +
>>> +#ifndef __ASSEMBLY__
>>> +
>>> +#include <xen/errno.h>
>>> +#include <xen/stringify.h>
>>> +#include <xen/types.h>
>>> +#include <xen/lib.h>
>>
>> Again - please sort headers.
>>
>>> +#include <asm/bug.h>
>>> +
>>> +#ifndef BUG_FRAME_STUFF
>>> +struct bug_frame {
>>
>> Please can we have a blank line between the above two ones and then
>> similarly
>> ahead of the #endif?
> Sure.
> 
>>
>>> +    signed int loc_disp;    /* Relative address to the bug address
>>> */
>>> +    signed int file_disp;   /* Relative address to the filename */
>>> +    signed int msg_disp;    /* Relative address to the predicate
>>> (for ASSERT) */
>>> +    uint16_t line;          /* Line number */
>>> +    uint32_t pad0:16;       /* Padding for 8-bytes align */
>>
>> Already the original comment in Arm code is wrong: The padding
>> doesn't
>> guarantee 8-byte alignment; it merely guarantees a multiple of 8
>> bytes
>> size. Aiui there's also no need for 8-byte alignment anywhere here
>> (in
>> fact there's ".p2align 2" in the generator macros).
>>
>> I also wonder why this needs to be a named bitfield: Either make it
>> plain uint16_t, or if you use a bitfield, then omit the name.
>>
> It will better to change it to 'uint16_t' as I don't see any reason to
> use 'uint32_t' with bitfield here.
> I'll check if we need the alignment. If there  is '.p2align 2' we
> really don't need it.

See Julien's replies any my responses: FTAOD I did _not_ ask to remove
the field.

>>> +};
>>> +
>>> +#define bug_loc(b) ((const void *)(b) + (b)->loc_disp)
>>> +#define bug_file(b) ((const void *)(b) + (b)->file_disp);
>>> +#define bug_line(b) ((b)->line)
>>> +#define bug_msg(b) ((const char *)(b) + (b)->msg_disp)
>>> +#endif /* BUG_FRAME_STUFF */
>>> +
>>> +#ifndef BUG_FRAME
>>> +/* Many versions of GCC doesn't support the asm %c parameter which
>>> would
>>> + * be preferable to this unpleasantness. We use mergeable string
>>> + * sections to avoid multiple copies of the string appearing in
>>> the
>>> + * Xen image. BUGFRAME_run_fn needs to be handled separately.
>>> + */
>>
>> When generalizing the logic, I wonder in how far the comment doesn't
>> want re-wording some. For example, while Arm prefixes constant insn
>> operands with # (and x86 uses $), there's no such prefix in RISC-V.
>> At
>> which point there's no need to use %c in the first place. (Which in
>> turn means x86'es more compact representation may also be usable
>> there.
>> And yet in turn the question arises whether RISC-V wouldn't better
>> have
>> its own derivation of the machinery, rather than trying to generalize
>> things. RISC-V's would then likely be closer to x86'es, just without
>> the use of %c on asm() operands. Which might then suggest to rather
>> generalize x86'es variant down the road.)
> ARM version is more portable because of the '%c' modifier which is not
> present everywhere, so I decided to use it as a generic implementation.
> Moreover I don't see any reason why we can't switch x86 implementation
> to 'generic/ARM'.

That would increase data size on x86 for no gain, from all I can tell.

>>> +         ".hword " __stringify(line) ",
>>> 0\n"                                \
>>
>> Hmm, .hword. How generic is support for that in assemblers? I notice
>> even
>> very old gas has support for it, but architectures may not consider
>> it
>> two bytes wide. (On x86, for example, it's bogus to be two bytes,
>> since
>> .word also produces 2 bytes of data. And indeed MIPS and NDS32
>> override it
>> in gas to produce 1 byte of data only, at least in certain cases.)
>> I'd
>> like to suggest to use a fourth .long here, and to drop the padding
>> field
>> from struct bug_frame in exchange.
> Changing .hword to .half can make the code more portable and generic,
> as .half is a more standard and widely supported assembler directive
> for declaring 16-bit data. 

And how is "half" better than "hword" in the mentioned respect? Half
a word is still a byte on x86 (due to its 16-bit history).

That said - from all I can tell by briefly looking at gas sources,
there's no ".half" there.

Jan

