Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0627E6CA915
	for <lists+xen-devel@lfdr.de>; Mon, 27 Mar 2023 17:32:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.515318.798037 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pgopK-0001EL-So; Mon, 27 Mar 2023 15:32:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 515318.798037; Mon, 27 Mar 2023 15:32:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pgopK-0001B6-Ps; Mon, 27 Mar 2023 15:32:06 +0000
Received: by outflank-mailman (input) for mailman id 515318;
 Mon, 27 Mar 2023 15:32:05 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=81wl=7T=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pgopJ-0001B0-4W
 for xen-devel@lists.xenproject.org; Mon, 27 Mar 2023 15:32:05 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04on0630.outbound.protection.outlook.com
 [2a01:111:f400:fe0c::630])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 85331bbe-ccb4-11ed-b464-930f4c7d94ae;
 Mon, 27 Mar 2023 17:32:02 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AS8PR04MB9206.eurprd04.prod.outlook.com (2603:10a6:20b:44d::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6222.28; Mon, 27 Mar
 2023 15:32:00 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b%6]) with mapi id 15.20.6222.029; Mon, 27 Mar 2023
 15:32:00 +0000
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
X-Inumbo-ID: 85331bbe-ccb4-11ed-b464-930f4c7d94ae
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HwDS5+J2xCSAsN8eUhW79cTY3wC8DaV6IlUSDzzTWg1Z0lQK9M1avx+BgKnUidKTEklEKRIIqjJLum5AG1t3iuWMpExSG0meU0XAhsYDja2gApM4YmPsAfj07550Tr4YiBnm00sXwPeTnmHdqyad2lr36dcI7XohTKA6B7lxlWsjXxdP9OUSaJgwJavktGEccy7xZi4Q25sFgSqyiALpUQu6iDkbZVZWi+oT29u5P1aCkZfmpCJJGGsz9GF23TkhbHOrBkIWSXdFKaIsQZqlDo8P2ELi8PYaM26KJEWWBETtl1PaB2UdaEHMdhprmoJ0kz2wMbvrwCEREe0v7vF9Qw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=m0Luxp3ZmH4e0nS4kardGqQJvEXRAGiqZ/W1n3P9JvU=;
 b=Oex52l6NjZq+3Lx4Xr1DEYqt2kobabLzmd2x4E+9wVxnRDVX4hDuctvJZqBY5BjwruLvEnffLoHHVH6UJWwMs9+BYx5rDN4osnJvfKiAriusxj0IxgoR17aCo6Y8ufW42cV09r14efFdQegOF9VLhP/w1/VpP9iK+F/NOV8k1yq3r+GB3K4t4VK+rKahigEw8UKEdpn0qrVGiybARjBX05fAD67aUksnMNza9oAHcDHOvyfV5zkzDJ0QTHANPR/ryowR69f4k3gSr+NhvsVftf2uZ05M0xnOZh+JQJrShSvOFtjW6+K+eWTLWB8RQAqZJbN7nlPL38FgaWmJRphzoA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=m0Luxp3ZmH4e0nS4kardGqQJvEXRAGiqZ/W1n3P9JvU=;
 b=lx+6wg2D/ZjnSgio8I/k+c+jemGv7qn57KoVo23K6VJ1gb1HgUZruAyGc4xmhYy1gGvTc4YaIEbCiWsWEy2JbcXCqFS8cu80GTRy6EY2tUFhFOL/eqnuYpUl3eYngAWHgVSrJ0f0EEXmpvMYcVsBbyoQMBJVD2xt26wlGmM5mmqfx5KCZMl1U+/3Hu3E/WDhLX2Q+D+tnruIxcogvoqVwlA46fb0twm+7x/Y03C+aICbjdB66gojvEPDRTREFeDKORFgz2P0cz0k6sTcRiOeO1J0MANf5pRXS2+IXZc7ggUvPz0+d7hpJLyaG4uod8SUrlmnIe0er1+k9CnVMn7SJw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <0fa4f2e8-390c-f898-973f-55f5b56a9ccc@suse.com>
Date: Mon, 27 Mar 2023 17:32:01 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v2 1/3] x86/msi: passthrough all MSI-X vector ctrl writes
 to device model
Content-Language: en-US
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Cc: xen-devel@lists.xenproject.org, Jason Andryuk <jandryuk@gmail.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?= <marmarek@invisiblethingslab.com>
References: <20230325024924.882883-1-marmarek@invisiblethingslab.com>
 <ZCFsDbKfGvn7giN+@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <ZCFsDbKfGvn7giN+@Air-de-Roger>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0068.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:49::13) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AS8PR04MB9206:EE_
X-MS-Office365-Filtering-Correlation-Id: 9ca523ad-65d2-4952-7cb1-08db2ed86847
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	VKMxAexKcEu7Fgyn5JaSUTYg8IEeJtmSUUZubFQHXcN8EtuCYMYTlTjBCax1s1DX5nH8F6IN8KGiOnhliqPM4g1ZDR1+yNyZVyMhnmdzaQyTv/WXZzgk+UWxWw+r24WQ3I3Q9xRv/rAFGhrrHxyZB57+XWIYzxabclnBsAI1ISCTm+fn8dVMhG3Rk1kMJQcRhHINYNnW/jn40hl6690eOqNGFuVyZ7tzP7F5q7lY7FvVRlIEja/aHbATC42D15NFcErrkhTfEh1O5uwUhjLN4kjoB1MRhlqoqIy+l+9arFu5F1Q+BvTxAabO1wqh4dCd8ZWCHDFBKG4bUD0WSIFg1XfFXq+P/SncgavfisZRe9pyLjTd5qbmCJYK+cSDcGPljBDKuz4d9Z74uzFkbKLRI0DKPEadxZZE5U0p27UgfaC0BRKzYow7XBdO5YQu5OCuOuqZGR7T/ZgNxwi4CkCZEYJLu4Zbn9UVSCg58uYu9QOJu2g3t5/adCinKNrho6MgZy/u6Qw0b+scOR2wZqzEZW6aiJYlrHUS7zo3qF65PcwjpN/YDYZusuLTbfs8DK0O9FboZzmg1QgxuaZChbH+DACZvdKFYfGJvs5uKu+RUU/82J4ktiU/XLxMDzs91+M8604cSUh74/p9xh5NbRL7vA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(39860400002)(366004)(396003)(346002)(136003)(376002)(451199021)(31686004)(83380400001)(66574015)(31696002)(2906002)(86362001)(26005)(6486002)(186003)(316002)(54906003)(478600001)(6512007)(2616005)(53546011)(38100700002)(8676002)(4326008)(6916009)(5660300002)(66946007)(66476007)(66556008)(41300700001)(36756003)(6506007)(8936002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?REYwN1RMeEhhaS9WdndQZUJUUGZtNk5vaHNSMHNCMFFOTnRGdGwyOWQyU2gv?=
 =?utf-8?B?V1ZEOC9Da3c0b25JV3ZBanYrQnBVQWlsZjRpVXpDM20yeCtmSE9UMmo1bCtV?=
 =?utf-8?B?RnU2Y0xhaHlDbk5KWnhTMmdPTjRadzRrWjdwQ2tkYzkvT2NPaVpRdFptUW1u?=
 =?utf-8?B?eU5pVWEwN0cwUUdTZ1pJYzhNY3BlVHdqYWVTaS9DVS9ueXFlTXQ5YzJSVThB?=
 =?utf-8?B?aE5nS1lkWE54bG9CSmFWSzhuRjFkWGxVZ0RHWGlib09jclRLZk9PMzZ3VEFt?=
 =?utf-8?B?SFhRa3dCdDZQMTN0NFFCT3NCRmRNTmpqa3FGb1JwVExZSzlTSVpvbEZaY0xU?=
 =?utf-8?B?U3ZiNUx0T0pVVXhYYk9iOHdjV1hadmZrTGM3eVV0c1lJR2NzVnlobU9Xc3RE?=
 =?utf-8?B?bVB5N1hjRklMSXFwY2w5bkRBVXB3SENQVW0vUTBPS0xFQkdLWXRxV1BkSUVV?=
 =?utf-8?B?ZXppc0lMcFpSbFFyckxILzVzWnEyeXEwV2hvcGpIN2FCeVVqNnU4NnU3NWx6?=
 =?utf-8?B?NStKSi9sbUk4Y2JsVEJCYmkrdjE5TEpxcEpqUHVDVENtajlYZ3NvWFF2VWZE?=
 =?utf-8?B?ajJpVkFhU2R2aUVVQ2g3Rm9PVEt4UDYrNHB4TjdXdzMrdmVTbkViMzhwTXAv?=
 =?utf-8?B?M09GYVcrbW1IdWNvS2RaVS95OHc1eEZVOVRvbDJBc1FRa2doOWg5RzhwWG51?=
 =?utf-8?B?L3BNQzNmSkdhbVhrVDJlTXU2YTJ3MU4wVHBDTTBkQUhNZEorVDZwL09QSmhh?=
 =?utf-8?B?NzBaZ21DMjZESDRhL2p2NGlYTWtlRUhQMndPS1dudllxNmFHM3E2L1lEcW1X?=
 =?utf-8?B?bFJPd2lscjdiRmVpME5WejhVaE5JSDhaVmFZRWo0UVBUbmZRN29GWE1TdUgw?=
 =?utf-8?B?RDN1Y0V5eTlaK09rSkhOVVhGbEJMR1JRWjJpdVJtV09DVm02eUk1WVIxdmIx?=
 =?utf-8?B?SXE4bElUN1k5aTh3U3BOQTMxRHhMbUtpV2NXTUlxMVVJNENRdGEyOFRJUm5m?=
 =?utf-8?B?TDNOWGpNRXJibUJtZUJaMFh5d0Y4NVQrYWtZMzV5UGFGYndhYk4vaDhxOUhH?=
 =?utf-8?B?QUVWcDM4QmVRMXUyN2lyaG4xd0VVQ0pqbUVDU29hckFXaVlMQzhCRHNyMXZH?=
 =?utf-8?B?UjBZaERMUHVvNlVScWFaZVlobnlxcXMvSWlZWTQrTkY3QUdXWk9aWklOSW5G?=
 =?utf-8?B?eVFuNURuU09qeUtuQU1sN1JLcXpUdEZ3U2w5cERsWFhoZVgvVEMyQXhUWStp?=
 =?utf-8?B?UTFlTWIyUDlHTzJoV2JTdlVmdGxSaXRYZzd0ZGtJQ2QxTmhlUXdRYzh5VmU4?=
 =?utf-8?B?RlgxR1B1NE4zUUtTUnBxdUkya09pSTRQdGplY3hHMXd0MTVjNXZGY0Y2ZERU?=
 =?utf-8?B?SCsyQkQwQ3JmdmJUNENQeDRpdm1KREpzS1MrUnA1NjlBVGt0YXA2cUJIY1M0?=
 =?utf-8?B?L1hRL1pqcGZ5Q2FqM012NXJocUpCQWlXTXlBMEdMSlFLTWM3M3pUMEFNOTBM?=
 =?utf-8?B?V2NTQytQZUlqcjBHcEo5bnNRdithcWUzZ1dSVU1Cc3hTWmlkc011RUZIVTdy?=
 =?utf-8?B?b2pTT1dPNjVHTWZHUE9YaGw3S1Jud1JhYjVRZ0M4L1NiQTBldkxxMldQblBH?=
 =?utf-8?B?anEwc0lsSXZ3VTU0YnNWcHZiN0hXaGc0SEs2bWdyeWNaNDhsSWYxUnBRMU5k?=
 =?utf-8?B?c0RMeWtBZG8rU2NNTVUzWTJBUW5EcnJDaUJkV0g2ZTNCUExHTXl3bzJKb1hJ?=
 =?utf-8?B?K2czOE9IMXhITmJqRWNIMFg1eVhRZlF2bStPZ0JSZjVaVWZHanVaK3BNS3Nh?=
 =?utf-8?B?TVl0MXBxQ2wzMm95QkRoRnBqSnRWSlhKYzZuQm13VklsMTF4TFMyT29QRXlP?=
 =?utf-8?B?T1RkNCs2QmZyd1hpVlFiKzNwWVNiaFo2YUVDOXE0cThMMHNxN0lsSlFaaUZm?=
 =?utf-8?B?bXBISWRQbVBoTVhYaHZvUm9GcW82VCtqS0o0VDQwRlQrTHBjME5vQkVZSUdQ?=
 =?utf-8?B?UkpVNUY4NExVeDREanZXVWJvR1ZPODNRbjZ0ZndZVERpRlBLS2lqN0E5eCsz?=
 =?utf-8?B?NmRtbHVXN0xJRGJXQk4vUHFkQVRPQnpRN2VST2VOTGhEMW9UUFV2NkxiT2RX?=
 =?utf-8?Q?41ly5Wzfynhc0Dc90tPyM0Qd4?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9ca523ad-65d2-4952-7cb1-08db2ed86847
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Mar 2023 15:32:00.8502
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FNyxSQETvjm+wO8MEmytEZvZKW58pnlxU/nIDQn6/vMjRTfTaGtkANtmnHSgsSbbQgeLFDum6X/mqCfhj8/YEg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB9206

On 27.03.2023 12:12, Roger Pau Monné wrote:
> On Sat, Mar 25, 2023 at 03:49:22AM +0100, Marek Marczykowski-Górecki wrote:
>> QEMU needs to know whether clearing maskbit of a vector is really
>> clearing, or was already cleared before. Currently Xen sends only
>> clearing that bit to the device model, but not setting it, so QEMU
>> cannot detect it. Because of that, QEMU is working this around by
>> checking via /dev/mem, but that isn't the proper approach.
>>
>> Give all necessary information to QEMU by passing all ctrl writes,
>> including masking a vector. This does include forwarding also writes
>> that did not change the value, but as tested on both Linux (6.1.12) and
>> Windows (10 pro), they don't do excessive writes of unchanged values
>> (Windows seems to clear maskbit in some cases twice, but not more).
>
> Since we passthrough all the accesses to the device model, is the
> handling in Xen still required?

"All accesses" isn't really correct; aiui even after this change it's only
"all writes". We still "accelerate" reading from the first 3 table entries
(whether or not that's [still] useful in this shape is a separate question).
Plus we need to invoke guest_mask_msi_irq() as necessary, and I don't think
we should make ourselves dependent upon qemu communicating the necessary
info back to us, when that's necessary for the correctness of Xen's internal
interrupt handling. (That's further leaving aside the performance aspect of
handing off to qemu just for it to pass data back to us.)

Jan

>  It might be worth to also expose any
> interfaces needed to the device model so all the functionality done by
> the msixtbl_mmio_ops hooks could be done by QEMU, since we end up
> passing the accesses anyway.
>
>> Signed-off-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
>> ---
>> v2:
>>  - passthrough quad writes to emulator too (Jan)
>>  - (ab)use len==0 for write len=4 completion (Jan), but add descriptive
>>    #define for this magic value
>>
>> This behavior change needs to be surfaced to the device model somehow,
>> so it knows whether it can rely on it. I'm open for suggestions.
>
> Maybe exposed in XEN_DMOP_get_ioreq_server_info?
>
> But I wonder whether it shouldn't be the other way arround, the device
> model tells Xen it doesn't need to handle any MSI-X accesses because
> QEMU will take care of it, likely using a new flag in
> XEN_DMOP_create_ioreq_server or maybe in XEN_DOMCTL_bind_pt_irq as
> part of the gflags, but then we would need to assert that the flag is
> passed for all MSI-X interrupts bound from that device to the same
> domain.
>
> Thanks, Roger.


