Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A2E99654182
	for <lists+xen-devel@lfdr.de>; Thu, 22 Dec 2022 14:07:08 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.468516.727629 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p8LHU-0006CX-Hk; Thu, 22 Dec 2022 13:06:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 468516.727629; Thu, 22 Dec 2022 13:06:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p8LHU-0006Ah-Ex; Thu, 22 Dec 2022 13:06:40 +0000
Received: by outflank-mailman (input) for mailman id 468516;
 Thu, 22 Dec 2022 13:06:39 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=TLdZ=4U=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1p8LHT-0006Ab-Ba
 for xen-devel@lists.xenproject.org; Thu, 22 Dec 2022 13:06:39 +0000
Received: from EUR02-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur02on2064.outbound.protection.outlook.com [40.107.249.64])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 781b882f-81f9-11ed-91b6-6bf2151ebd3b;
 Thu, 22 Dec 2022 14:06:38 +0100 (CET)
Received: from AM6PR04MB6551.eurprd04.prod.outlook.com (2603:10a6:20b:fa::20)
 by AS4PR04MB9289.eurprd04.prod.outlook.com (2603:10a6:20b:4e4::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5924.16; Thu, 22 Dec
 2022 13:06:36 +0000
Received: from AM6PR04MB6551.eurprd04.prod.outlook.com
 ([fe80::8084:fa5b:fe3a:fa24]) by AM6PR04MB6551.eurprd04.prod.outlook.com
 ([fe80::8084:fa5b:fe3a:fa24%4]) with mapi id 15.20.5924.016; Thu, 22 Dec 2022
 13:06:36 +0000
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
X-Inumbo-ID: 781b882f-81f9-11ed-91b6-6bf2151ebd3b
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oYwzX+LcrF67ycYCwuuCTpTkEkzG+eehjG1FSn2n0U2OfGf5ECWGo1jF1mEEcdwQV+/u2uAm25pouGjAnHfUMQIjBzX6iTGxSnd8mnk21FCmSg1IRGa4+JQDMxlqN5aBgiiLqmsKDEI6UM9oPa92Iu3O8Pw4mBF4x+DYglOQcQjquoNmTqUO9A0sBimA2fppQsqKtbqCMJbY6WmOgSbhCkmful90AEWHEjWSFt+mvAoRJ9UDLuykd6dsONTMK25jw4MwSVZ9pickylgt6UYr0McYS6FVSjJf4FwEs8Ti82m+a1ncsGyzMj8eVVkG5vVXvsznWLpHXREE9iH33p3X7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TDw3BjNQpD9JfYqN5BmhFNoyfMRTSqoCJgSTmCM6ATM=;
 b=drGVR2BQWGDUPiVzFjNe4Hk01OF62pZH0ASDSDoHGVAC78p1O1ethLQvpu9DehjkKkiJDNhxnP344SmTTdPIHWxcXSXWQbZckOpA76yRiOPPweLGkae/fAvAfTm2YiieWmXUhl9+QMGHgcI23vOEZTxNHwbNl/s0G40qYTNeplpA8HKlQV4Se7ZsMPDMIjOPfwI0kw1f6Hi2Rov5uAX9MswA+kSlAcIaM4N0TR0my4bSRWVIWkwWOPIkTN4oDz8Xa7MFiUIKiSFtLFaqmvyJEHJTbYElF52jKcWsxrcXUE8BF+Ubr/t8P8AGGCDKILybbHfUIgme5sNkCKkl2/yOwA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TDw3BjNQpD9JfYqN5BmhFNoyfMRTSqoCJgSTmCM6ATM=;
 b=rSDtiZrTgyIavECBzeogoazmOA4n7qOi5jDaRE2fDF4t5cSZjuaU+itOXHYbzlbsVmlK4OOIZDUQVYCXSkNLfZAZwPjLee30TG92+a4ccO2vGnHVQP08vVD9Tcamuz/UdfdorM3iq4W68tjNBI0BjukrUQyDnkT2pZe/+bewl4QIeUX5Mixdb0bCiEhhYHU6MwBqO3XZWdzSOW1t8g2tGZaBXINBxC0v9Jml4/Usk5al5Rq+Z93A82zcjXfp/V4qa9JuB/HvvewXfvMDjOASQKeVEHEvYvAEsMBXjy2pYlLD9SfTkWc11MjdwvlhZ/sPRSRldTo6BxW7JDByH3+mFw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <751ffdb3-651c-b8e6-dc33-5a6857e3c88d@suse.com>
Date: Thu, 22 Dec 2022 14:06:34 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH 10/22] x86/mapcache: initialise the mapcache for the idle
 domain
Content-Language: en-US
To: Julien Grall <julien@xen.org>
Cc: Hongyan Xia <hongyxia@amazon.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, Wei Wang <wawei@amazon.de>, Julien Grall <jgrall@amazon.com>,
 xen-devel@lists.xenproject.org
References: <20221216114853.8227-1-julien@xen.org>
 <20221216114853.8227-11-julien@xen.org>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20221216114853.8227-11-julien@xen.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0046.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:92::20) To AM6PR04MB6551.eurprd04.prod.outlook.com
 (2603:10a6:20b:fa::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM6PR04MB6551:EE_|AS4PR04MB9289:EE_
X-MS-Office365-Filtering-Correlation-Id: 3f92c687-fdeb-4d74-fcb9-08dae41d5b1e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	FCHJwwKvmQQF/ENsKfREEK07Lrf8gMKa5HuMUvnkuoZYE4vIqdy/swKIZnD2GmFs5ooTgFAusMiZI/6y/u/dmHCdAAginc03GznW0ZRDim0jor+Yfi5GPRsUeXCjx91Dt0dInP+eB+iilgPFtLu1cQbRIiX/YghrtXqiVNipscfM922/J4LZsHZqN6/f6Euh6Qa9O0OAUUEnYI0grs/lSkAfblshMVZ9R1q1tDBqSul7/F8u17LQRcdMdrAEHPlvC08WRoZdVKW4QdLqcfarx+35JV9jBhFt4pTRsajl27srjq6HExGL5jpeO/OkeFEbi3jM5t42/VDb6cqWG/Hdtn7mKWH9GxTH2ixtINqhd1gxxlL6cGt6l0bNCk/eAyypvPgOKCdd1/oQvSnwJ7u/V5SnOvt5YL5xkbshF18zkjTmFPQvtgNC8Afe5aofMumewqOAs8L+22Vo2ceNr0VqWX+yXxZXyXrnxJQsC8hgZiGCp8okLsYHAYMMirjfJkbeaA0EUajhOorIO6HKBPOUE/WP2iEvQCzlGc7CHpLkEZZmHftrYu8UODWyWFGiSESbLUKeiY4V8LY7Ovlmp67i82jJbx9MVHcHz6AkEmcCW/ds7C7BC1M5hBrKNNf9XClhqcXM6N6z/3pwQOEsOF2Dr/sb/fj07EUxh3CHIbeND+OiygU/Oi14nO9Y4PbSPGvO2Vjd8hJEuIMG2MauDmLa37d8yLE+E3qSGn15Yz7BMR4=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR04MB6551.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(39860400002)(376002)(346002)(366004)(396003)(136003)(451199015)(31686004)(478600001)(86362001)(316002)(54906003)(31696002)(6486002)(6916009)(36756003)(53546011)(2616005)(6512007)(26005)(186003)(6506007)(38100700002)(2906002)(8936002)(8676002)(5660300002)(4326008)(83380400001)(66476007)(66556008)(41300700001)(66946007)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?a2lRSnhSdzJDNTQ3ZkVOTTZ3Q21aVTJvOElZblFzZllDd1I0Qy9iYkVhbGNW?=
 =?utf-8?B?ZHcrTS9UNFBZcmhBNWdyWmNJR2hnSzRqY0xiSFp3MURna1RKM3BILzZtaUUz?=
 =?utf-8?B?blRTcFliNUFrbTMvNElKbFFSMnBTcDVwU2RHTWpXa25KM0c5UFZGS1BtUzQw?=
 =?utf-8?B?dXRXc1hDWU5xaE9FRFVQdU5GaitHaS94ZHdVNCtQMWdyV2lpbnQ4QXFBR0V5?=
 =?utf-8?B?bHVFNEtvSE9DSytzdHpRdm4vRCtjYzYvcTl1Rmp3UXJ0STc1NndhYUJHMElV?=
 =?utf-8?B?c2hvcGhNSHcvSmx6d0lJQWh0OFoyU2tBUDcraFBoVittLzYzNUJ0Ni9pR2F5?=
 =?utf-8?B?RXd3dEVXV044cDdpbUZNWHFiNFp6dk1GVkVQeDlLZDdHTFMzajk5RGpJRFNZ?=
 =?utf-8?B?K2FKODhIODBRYmxjN2R0RFlIOFFrSFRTYzZ5UW1HS3hxcEcvL0ZWaWxLUWFp?=
 =?utf-8?B?R2oyRDNXOW5qaExrYlE4VTFsM2xYUG9DNDFZNWxTU2llVllRcldhY1gvdkZP?=
 =?utf-8?B?RXNGL3dEcEZoUmI5NUJubEVyVzVRNGxFbktWd05iSHQ2cDlsRmZ4Vkdrb05y?=
 =?utf-8?B?TXpncUl4OTI3YzlER0lhRmxJR3FzSy9YVEh3SEU1TkREakJQVGg5dlZ0Z1dR?=
 =?utf-8?B?SUo2WTdnNGo2Q0l1UFVmL3VvclRrcDJsMzN1M0ZYYUZvN2tqMlJXcmpsV0hP?=
 =?utf-8?B?bW5WdnpCZFY5QzlKcmFHVkpnQ1h1d2djbTlwdUF3eVlBTkt1eHVNRThyODRH?=
 =?utf-8?B?KzhNMUgxbkJLTENpWlhxS2ZlUFRvUG1NZDMyY01XNVN1MitPTFRyRXl0QXgy?=
 =?utf-8?B?ZG1oditpOXZQbkphK2VmMS9JK0NWN0dGaE5jOTZzanRyMW11MVNPdVJ4Vkhq?=
 =?utf-8?B?c2NYdzEzWXlhRHViWS94U01DS25qb25LRllteTVuOWZBS1Nic2F5U2kyTCtD?=
 =?utf-8?B?UHVvNXVleWFRVHRtTkE2enBDU2RyVzJYVFMxSHg2QnFSbmVFMDBtbXRDSDBp?=
 =?utf-8?B?RlByODZXb3RWWjNGdUpDb2lSL1lZaitGMDQ2NmRwSG8yUU5CVFIwUmhHQXRB?=
 =?utf-8?B?QUFwVFlEUUd3d1RFMTBBdHd6QUdPRllPM3pxODNxZEJYYW1yZW9NQVNTekI1?=
 =?utf-8?B?OUtWVnpkdzU4OC9QOFFVanYzcXA3c29PaC84NGpVSHhtMVhkVTE5MTMvRFFt?=
 =?utf-8?B?MDJlcHJJQjBPdTlGZjdDZjlyK3Fha1lQcWg4bFJzNU05ckxYZ1JPWVJFY1NQ?=
 =?utf-8?B?MmZoNnJ4eVcrN09RbHBnZXlVUGJoaFdnN1pjRXNFOExoUk1mS3VaeVNZU1Y0?=
 =?utf-8?B?UTNVWmpicU9iRE1JeGpJTkdUdTZJZVNIaXR3MU01ZWlxcnZUdVhjUXE0VDhZ?=
 =?utf-8?B?UGtLVGpESWFsdEtVMTFFamEyemtjQ2t4K2lhdjE5NXA5SmFadDJ1K0RvdHNi?=
 =?utf-8?B?K1R6VTNQNk5iU28zWDNZb3kvUDFRYmdWZlkyamRyK01zaFBiTzQ1UXNobGRy?=
 =?utf-8?B?N0NqdXVRdGgzUXdvZ1JmY2E1cmZGODlSNlRNRURTRCtZUURPM2lHejlUY3JR?=
 =?utf-8?B?eFpqMzNhZXQ2Ty9XalUzbTBGMFN5QVNCLy9XYm93MDlwaXJWZVYreHEyd21H?=
 =?utf-8?B?MWhvQjhybVYxZmdSUmJJTjBKcUZHLzNZUTM5a0l6SnY4S0YzUzE2SkJQazNo?=
 =?utf-8?B?TktNWDc2Rm5iRkluaGlmc1B4bDlUdkdPa2FGZ29CamtMYUp4K1FORThIcUFX?=
 =?utf-8?B?bGpwakpwOU5QR28rY05VQ3JWbU4yQ3lYWjZ3K2lZaVJ3MHJTMVFHVXNZZmVB?=
 =?utf-8?B?SktsYzdSTkRGeVRTM3hLZWZzVGNHM2t2Wk51OUZsSHowcElva0p1SnVDQ3RK?=
 =?utf-8?B?UG9FYXJoVnY0QkJBS3VqMXF1WFE1dVZzSnRVa2FEckZJcmozUHltNG9vZzdW?=
 =?utf-8?B?YUlqYTJwSERISUpqZWpLZG5kdVR6KzIycHkzUkU4Wm5nNGhCVXNRWUNNNEdk?=
 =?utf-8?B?UC9LUDNuTjB1a0NGZWN3Z3A3WHNsOFhZcVo5SXVoeXNORmw3dmFZenlBRXRN?=
 =?utf-8?B?SDZQeW1RdFBLbVNuU1BDdWpVVDE3MXlFaU5yaXdXaEdkR0RZMmp4Ukw3UjVn?=
 =?utf-8?Q?qXRpa37zu0GN9KdeZnjONKGYu?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3f92c687-fdeb-4d74-fcb9-08dae41d5b1e
X-MS-Exchange-CrossTenant-AuthSource: AM6PR04MB6551.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Dec 2022 13:06:36.1538
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5ao1ycFo5P6gCKoC86N1e2O07bYk57CIDj8uJwncFsE6G9ZASLindKwIYOxDMmyYHLkj0xAdM9Y26M2a0/68Jw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR04MB9289

On 16.12.2022 12:48, Julien Grall wrote:
> From: Hongyan Xia <hongyxia@amazon.com>
> 
> In order to use the mapcache in the idle domain, we also have to
> populate its page tables in the PERDOMAIN region, and we need to move
> mapcache_domain_init() earlier in arch_domain_create().
> 
> Note, commit 'x86: lift mapcache variable to the arch level' has
> initialised the mapcache for HVM domains. With this patch, PV, HVM,
> idle domains now all initialise the mapcache.

But they can't use it yet, can they? This needs saying explicitly, or
else one is going to make wrong implications.

> --- a/xen/arch/x86/domain.c
> +++ b/xen/arch/x86/domain.c
> @@ -732,6 +732,8 @@ int arch_domain_create(struct domain *d,
>  
>      spin_lock_init(&d->arch.e820_lock);
>  
> +    mapcache_domain_init(d);
> +
>      /* Minimal initialisation for the idle domain. */
>      if ( unlikely(is_idle_domain(d)) )
>      {
> @@ -829,8 +831,6 @@ int arch_domain_create(struct domain *d,
>  
>      psr_domain_init(d);
>  
> -    mapcache_domain_init(d);

You move this ahead of error paths taking the "goto out" route, so
adjustments to affected error paths are going to be needed to avoid
memory leaks.

> --- a/xen/arch/x86/mm.c
> +++ b/xen/arch/x86/mm.c
> @@ -5963,6 +5963,9 @@ int create_perdomain_mapping(struct domain *d, unsigned long va,
>          l3tab = __map_domain_page(pg);
>          clear_page(l3tab);
>          d->arch.perdomain_l3_pg = pg;
> +        if ( is_idle_domain(d) )
> +            idle_pg_table[l4_table_offset(PERDOMAIN_VIRT_START)] =
> +                l4e_from_page(pg, __PAGE_HYPERVISOR_RW);

Hmm, having an idle domain check here isn't very nice. I agree putting
it in arch_domain_create()'s respective conditional isn't very neat
either, but personally I'd consider this at least a little less bad.
And the layering violation aspect isn't much worse than that of setting
d->arch.ctxt_switch there as well.

Jan

