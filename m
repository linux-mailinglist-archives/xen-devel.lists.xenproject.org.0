Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D13357D2FF3
	for <lists+xen-devel@lfdr.de>; Mon, 23 Oct 2023 12:33:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.621284.967616 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qusFC-0005IA-0P; Mon, 23 Oct 2023 10:33:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 621284.967616; Mon, 23 Oct 2023 10:33:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qusFB-0005G2-Tg; Mon, 23 Oct 2023 10:33:09 +0000
Received: by outflank-mailman (input) for mailman id 621284;
 Mon, 23 Oct 2023 10:33:08 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=OVTz=GF=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qusFA-0005Fp-Lv
 for xen-devel@lists.xenproject.org; Mon, 23 Oct 2023 10:33:08 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on20615.outbound.protection.outlook.com
 [2a01:111:f400:7e1b::615])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8e4de3ba-718f-11ee-98d5-6d05b1d4d9a1;
 Mon, 23 Oct 2023 12:33:07 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by AM0PR04MB6945.eurprd04.prod.outlook.com (2603:10a6:208:17f::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6933.11; Mon, 23 Oct
 2023 10:33:04 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::d924:b650:a2ad:7b25]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::d924:b650:a2ad:7b25%3]) with mapi id 15.20.6933.011; Mon, 23 Oct 2023
 10:33:04 +0000
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
X-Inumbo-ID: 8e4de3ba-718f-11ee-98d5-6d05b1d4d9a1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HuAxcVuIIaJFLopb9sfVkKuvuKrrTAhCAGiKzuNK2lzanABd93HmcxKvm7lKGiCpsG2JCUJMtSuIDOYwmlQoshb4t/xpaPYxRsqlqKKmXcJFfJjR0+oAN3FGq+s+Y1OdnABQpmG4gln1NeoyjGE+/U295L5lJ9Q5ARUg/WGunxyDg8AP6CtR1n1EUXjhfgbb6zAwY3kDU3rwCOd5QnHdbws0xHPjXfnQXBZnz/PclY9izr53lIhDXP+e5fTp/2PSmhiCaRnXVWJKJgTBmap1/EOjCKvkDSb3+ndVqfj71vxmP9sNjMcqmyqDAXPRvKpSPzJgky7lruO+M5w3VGcVUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gSfOhmZxKkceqUVB+Sr8ey7FNq4+OOxig1hpDrdO9QA=;
 b=DTrPhb6vIY4q5v9Fend0WWGv0OHZyoUeZGLWhFZbY6yeXZPQYspxbEnjBsE3uASs1Dyib25IsmzQzgIUoASz3qJhoO4PQPNfEaS6rIW3uWMqqPEFJRug5dqRYDBmthLN47JjafLwDx+xo42kc29sdnca73v9T21PefTUokjlP7P/GyNSRkw0jRCnkhzCeDUIOlrSFUqS7Q/Wwolh5w1sNza8D6U0c/ZYmHzQE+0yD8fsUcXY0A4HkQEnR5uavDsE+fJdb6VGBPOVILYRgQzX81fd1z6Lvm+I5SwY7SgzILmJeHMqdsHKX/ZY4qkfDVf/1SS2KlGphhnjihPhXuYmGg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gSfOhmZxKkceqUVB+Sr8ey7FNq4+OOxig1hpDrdO9QA=;
 b=hTBvYjfAT9x4xd7bustkiyskXV1keSvrCv1Gb4HXZ8hknqK/elXmYYYx2vPpEtCpJQEFMMVYiYXPNCR4Ybajc7LLHEYiAGgHAEb+jYB1maviLu9hXliBPvkg7E0lPdN8faAfprB9Z1LpQDuaWPkaC1BbVN0gbO1/DrmpDZ4yekSA2tG+GKyyrFFAvKd+wp5flYLZoUxw5vuZflfPkFvHPjii1v/KGn4YwBg5rt+fpUdCM6iJtla3KQFeCvNt8jDZViE4JR/Je4xBBGnTKrIru/hodkrq0YosI7WdiGUlVyyUgS4lEB16nbmLx4l9Q55zmzPKC0vR/51rKqdesipWgw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <48c3c78d-465f-8102-87a3-cef3a5d4838c@suse.com>
Date: Mon, 23 Oct 2023 12:33:02 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH v1 04/29] xen/asm-generic: introduce stub header device.h
Content-Language: en-US
To: Oleksii <oleksii.kurochko@gmail.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org, Julien Grall <julien@xen.org>
References: <cover.1694702259.git.oleksii.kurochko@gmail.com>
 <3cc9ecc3abcd21c5ed7276b01bf5963e6a5fd5e0.1694702259.git.oleksii.kurochko@gmail.com>
 <a20f5783-7ee3-6ed1-d4cf-379c30c64a12@suse.com>
 <9ee7b3c9-de71-4790-815c-8b2859a85465@xen.org>
 <17d9102a-da9d-d41b-6362-1ccfe21b7976@suse.com>
 <5059771d-3842-4a7c-814d-69388179b246@xen.org>
 <61c20f5d-a324-9ece-2140-4d0c775e193c@suse.com>
 <54ac0161-7302-4190-9c6e-273caa652058@xen.org>
 <04fe316e-bc4f-0df8-7771-5be7ca878297@suse.com>
 <3ce85a73-96ab-41c8-8b90-f3899e771845@xen.org>
 <63392d67-f1af-a53b-59c2-ad4752159726@suse.com>
 <97eaa9e6-bc4b-4128-9563-cf3647a794c7@xen.org>
 <d7e862261c5a45902ba95eaff31d813d97f3c62e.camel@gmail.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <d7e862261c5a45902ba95eaff31d813d97f3c62e.camel@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR4P281CA0008.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:c8::19) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|AM0PR04MB6945:EE_
X-MS-Office365-Filtering-Correlation-Id: 8da81518-56cd-4e54-38dc-08dbd3b37065
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	/WNHkDMF+Qw09Knec1mFOegeGtATJN0z37vWSkifttsv22Kdr+Ud8fqA3JJG85ZsfwpqvhxVsxbZZlTq9TDWD8buR2aTf1bN2AJDJ+5nSc/M3T7Qqk2lRnxbqS+iybZ71pDXuA2nvmZvsHFugoO/g8KoweD4SvRzyoq5lIUKf7XAjSzjHcSRlt2vq4mD9v9KxofBrPlp9pvMJtqhxjznMp6KmcSvhqXI/DfwYx/+3WXdMNJ+9gpnIsu030GVa7GId2pPeUm1bbwDZp95grkOyE+KdbUElIRCbHJgKdLBKBnq80bcRUyAeG/srLIhwa4LwvDJynWBapb84ceb2hWpgRCN5IaCReC9nqmC9htMvBigoYElgnaevWYG6UgiMZdMdnIPQHHIelDqd0yGYpMmLSBCCy4TkqyXpCMGWk9odaypmesVMg1iuL+YP5cdlr54RRsCuOi9uURQum0bKoK6nr98Lf4Ih3+mVFHd7YWhT2PVvL0grF0oBJUpKRoZiDMsX9rto7miAbVLKD5/XEpytC1yqEEu6EFeKiQFbBS9Zf7yaXM6Dvmr0fYa46GcGPN6rZDRjjvPVDvL4ryDzZb7L9IGPuDI5RvnUWpiU+a2lQSavPwulC12z6SQYZ9mMqqDlcClB0gdoyQ4AZZblyNWY4jVQw/Zj6UYSTvdYot9xa0=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(376002)(346002)(136003)(39860400002)(396003)(230922051799003)(1800799009)(186009)(64100799003)(451199024)(31686004)(2906002)(4001150100001)(6916009)(5660300002)(8676002)(4326008)(36756003)(8936002)(41300700001)(66476007)(66946007)(6486002)(316002)(478600001)(6512007)(6506007)(2616005)(53546011)(66556008)(26005)(38100700002)(86362001)(31696002)(54906003)(41533002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?a0dDVlJSbCtNbFNaZDF1ZDJUYTlDcGYrdGpYWHViSXlsT2VWR1l2dWs5S0dx?=
 =?utf-8?B?VUFrcFRaUkgzQW9nTDBRUUtXYk5BaHBzTDMxL0xqbFYvR2g1OTVzUHkweEh3?=
 =?utf-8?B?cXd3V3Z0YWFzSWhHUTd2N0p6eXl5ZkljenREd2xIU0JOcFZIRVNDVXFxOUJp?=
 =?utf-8?B?OFFHY2NsT0w4aTNZNXFxeGtzU0dpSlJsRHg4Um96d1MwWDFGNTlxV0R5eFhY?=
 =?utf-8?B?TjhVbWhlUmFCcGNocE5sdXZ0QlBqem5RSFJ0aksxckh4R0NFVWxHV1IyMjJX?=
 =?utf-8?B?WWVzWjVUV2RFQ2Rvbmw4S1gwRUd5VFhaZW1aZUE5Y2c4c1QrOHNSZFFPa2cx?=
 =?utf-8?B?OS8yekZZaFVxZjdaZ3hNaHpuWUx6bmh3MmJpdjBqaTd5WUx6WUNON2t4a0Yr?=
 =?utf-8?B?ZFJaN2d0Q3c1UTJYakJET2xFTkxYMzZpbzdteDRGOHBqcmYyM2w1NlkwMWsr?=
 =?utf-8?B?NDhxQzNaeVVzNDJZSURzRkJ5RjU0c29pUHVtcVFXdWk0SEcrNEF0M2tnOGl0?=
 =?utf-8?B?L0UyMGdoOE41S2xrWUtxN3ZzVU1uV2o3d2IwN2tpZngwQXFDRXpldnp2Yith?=
 =?utf-8?B?OUhEN3Z4bHF0aXZYOU9CMWhXUzY3SW95bGw0SkZXNzNDcDBvTnJzOEJWMXFs?=
 =?utf-8?B?dGd5OVZlZXh5aGxDa0dsRjlPSDRpaTZaNFdTZ29uYjRpYVlVcWEzVEc4am1L?=
 =?utf-8?B?NE9xdENOL0d5aUp1SUFjVTdNeCtHNmw5V1NVTEQzQXh4dDRRejFJVGI3NU5U?=
 =?utf-8?B?TXZXWk9xTFlmVlVabUFLaHNPNlBHcDMvTUprR0hON3RvWFlJU3MyTVRsOXV1?=
 =?utf-8?B?aXlZTU5FTXduaE84ajIzNzJqTFBFMytIT3pJMG9JbzNWby9aVHZWbUMrNmgr?=
 =?utf-8?B?WkRTRGRJYmRuSTJyYWVTeWlLNUdwQ0dZZ2pJWFhVR0NmN0NEMzFDazVud0JS?=
 =?utf-8?B?NWZZTG1OMzBlMjR5NzBwNVc4bk9qbEZxSGtGd2ovb2hiWUk0RHZOcHlqTkdh?=
 =?utf-8?B?czZwWTduWEV5VGNCdHdWZjAvNWh0TWN4Y2hTSGwyYTZZQjhaTTBTQ3FNeGc5?=
 =?utf-8?B?R1pnb096TERQMW5DV2xnNGMzaEF4YlU0SStGcThyY2d1T1dQL1BiY2hSUzZp?=
 =?utf-8?B?a2hQQ2NIMHlWWTllVWJmdjh3bnpqemtFcGVDb0hwaGY0ZmlaNCtuUFBCTmw2?=
 =?utf-8?B?M05NRGd6K3p3ZEYrcnRTMHlVMm5lSXdUVGhxV0lPZlNndmZMZ1FnT3NwZVVM?=
 =?utf-8?B?c1NORkI5ZmlrUDNOa2tXTUNkb2V5S2pFVnlwSGxOVXpOcW9zZnBlT3ZIRHhG?=
 =?utf-8?B?OVlRM3lvbkFFeWVKbTJsdXNPY2tOT1dJbHROYTl4YmRMR1VXYnJQeWFDZ2Rm?=
 =?utf-8?B?cE53WXVqc09kdklia0dEYll4T3ArNUpFeE5PR0pzUTI5SkJZb3pBNldLMVZK?=
 =?utf-8?B?TWI2NzV4ZUZadTE0Z3A1Q0Y0Z3NBNnZlbXJ4RXJCUWNRSS9wSzdacUs4NU5H?=
 =?utf-8?B?UTY1aTB6Z3lVSGZMbEtweTVyc3RhR1Uwb1o3WnVnbUkzWVI2Rk5rYUxlUkU3?=
 =?utf-8?B?cGFmR3Q3SjhKYW5lem9sZDhhUVdsSEtyZUc4MHpPQ3dSSzBZcTFHMkQ4Q2RS?=
 =?utf-8?B?YlEyRE1ocVFDQ2UwNGM2dG1YeHFHUSt1K3RGQStHWTZ4bFZkTDZsa1dobUdn?=
 =?utf-8?B?Q3Fib0V2bUxvWUJlM29XQ00ybUZiRjFkcm1LM2NnSTRrQXRZcjBtdmdibTBk?=
 =?utf-8?B?QXhLZER2SFBLdE85NlR3S09EdWo5K0FWc3hwaENsZHRGdTI4Ym1WN0RKSW13?=
 =?utf-8?B?OFJCeDFHSFVCaW9LL3hiK3lJRGNPc0tSRGx6by8zVGhaWExtOXNmKy9qdmdB?=
 =?utf-8?B?Vk5QOCswU1BWTGtOWm9uZWlzYjJXYmhNRzFNV3pUN3daMUxrYUtHclp6Smdp?=
 =?utf-8?B?emtERlIwNEd0M1FTbnhXQWdGZEpDclNoNzdGQVpHRzVRcTZiR2xYc3hyTUJW?=
 =?utf-8?B?ZitJbE1EaW5oUUpSalRINCt3cDJXMldGN1hGOXU0RWc1ck84R3pQNG9ZZHNu?=
 =?utf-8?B?U0FsTFNOelR4b2xJcW9qOEQ0ampQWkVLTWEvRGhEWDdNUXNxQzBWc1llVU1C?=
 =?utf-8?Q?LrJ8ixhaLi+dxIJ8VGryDKE87?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8da81518-56cd-4e54-38dc-08dbd3b37065
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Oct 2023 10:33:04.2400
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: owEdI5d8Ri333KQg7Dt3i2FibV/or8AMKOxYWtw6oV5Mf7+1MArKX4/q6S2dOS1FI3aNLMPZAaVRKDn+XHNO4w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB6945

On 23.10.2023 12:17, Oleksii wrote:
> On Thu, 2023-10-19 at 13:12 +0100, Julien Grall wrote:
>> Hi,
>>
>> On 19/10/2023 12:41, Jan Beulich wrote:
>>> On 19.10.2023 13:27, Julien Grall wrote:
>>>> that doesn't involve one arch to symlink headers from another
>>>> arch.
>>>
>>> Whether to use symlinks or #include "../../arch/..." or yet
>>> something else is
>>> a matter of mechanics.
>>
>> #include "../../arch/../" is pretty much in the same category. This
>> is 
>> simply hiding the fact they could be in asm-generic.
>>
>> Anyway, I have shared my view. Let see what the others thinks.
> I have the same point: if something is shared at least between two
> arch, it should go to ASM-generic.

I continue to disagree: What if one pair of arch-es shares one set
of things, and another shares another set? You can't fit both pairs
then with a single fallback header (unless of course you make it a
big #if / #else / #endif, which I'm inclined to say isn't the goal
with headers put in asm-generic/).

Jan

> And that is the reason why I pushed device.h header to asm-generic.
> It is needed to rename some stuff (e.g... GIC ) in it or add some
> ifdefs.
> 
> ~ Oleksii


