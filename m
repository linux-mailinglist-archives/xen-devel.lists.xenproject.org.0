Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 505AD53A9AF
	for <lists+xen-devel@lfdr.de>; Wed,  1 Jun 2022 17:10:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.340528.565581 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nwPzQ-0001eb-Mh; Wed, 01 Jun 2022 15:10:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 340528.565581; Wed, 01 Jun 2022 15:10:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nwPzQ-0001c7-Jv; Wed, 01 Jun 2022 15:10:28 +0000
Received: by outflank-mailman (input) for mailman id 340528;
 Wed, 01 Jun 2022 15:10:27 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Z6G0=WI=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nwPzP-0001c0-9x
 for xen-devel@lists.xenproject.org; Wed, 01 Jun 2022 15:10:27 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f73d3cad-e1bc-11ec-bd2c-47488cf2e6aa;
 Wed, 01 Jun 2022 17:10:26 +0200 (CEST)
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04lp2055.outbound.protection.outlook.com [104.47.12.55]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-44--knJa1v6OB2gHSjquqqBkg-1; Wed, 01 Jun 2022 17:10:22 +0200
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM6PR04MB6295.eurprd04.prod.outlook.com (2603:10a6:20b:72::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5314.13; Wed, 1 Jun
 2022 15:10:20 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::dfa:a64a:432f:e26b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::dfa:a64a:432f:e26b%7]) with mapi id 15.20.5314.012; Wed, 1 Jun 2022
 15:10:20 +0000
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
X-Inumbo-ID: f73d3cad-e1bc-11ec-bd2c-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1654096225;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=vPsLL7XIAwhRmlTLJqGC9WGiVhVFHUcjTqNTmq6BBiA=;
	b=fY6V9eO5rrrop9gDtsnqbWYFlec73LL9TNatlD2OAcB6Sq4wgfFfUR4D8GvXmL4r8B7Zq/
	VxhIv46vxDtyYJqiude4jIZPvdfP02sPu5ybJH9eELln6fB2zge+hAuqPWu9Itih6JIg9C
	yyloZfXKb2UGflLalWce9JHknsWmul0=
X-MC-Unique: -knJa1v6OB2gHSjquqqBkg-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mRikj1fHEB9HqLelk9gPF94DrYDX5472LATwSMEKwL1GWyr74tPcMo4PLDNdKJ5mmeUviR7bqu0XUHRwV8smDn58xIpAZlXgnQ+kiwnmS5ZuZjziSez97PJ5EG3uM+a0ZT9Hh4p4K3LKEfHLeFfWXbUz/dIJ90gLJTRgaxSQmyHAcg4LnjXUOpmpLu+BcgLziZx89Bp7R1Qsj36zIrQC9YK1uFRqX39BtlgGXpAdF6Ds3pRtV5FMv8hy1Ti6BSo0GJaVEO+mruuojTrUNr0rpiq434c3rZVwOu+EAFkt2L9a/YVYEB4L8+/9W7Ov8eFo2Sa8rXrGbMDl9DP7dNonXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=t1/Sme7U92u2KIarhnjjkAxXPb/ONRS0zXaXbcS8Ssc=;
 b=cjsByuXUqCGgxw52c43OnggqWaa6RUy4oAg0L1M9WnBBDQAzeRDA3/jHcZjrSFPXQxLrSD0U4utCMiDuVdTF++CIC4gKVGMDATOaVnjcnamQiJQJNpF/ExM9Ms7F1kN8D+hOF2ZcsgEqP06RCpHeC2Qh+PfsTpY8z3b/w59SDjvVyA0gb+8FsTJ8h6u0g8pqh4JhjXzV6CySWNThB3fnrrP2yixdx+rZ+ysTFk8if9aVr8fFMM0kQpKZFB2TbCNcNfpCP/i1w3RXDWdCPoamsnFw0SDbun3fBD/GfUYJfuqBFmOaPO2i5CBXc37v7jPalJEELJF7/iMZ3qcuq9BWOQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <671e1678-0bcd-6cc2-af9f-55b6e71db894@suse.com>
Date: Wed, 1 Jun 2022 17:10:17 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH v5 01/15] IOMMU/x86: restrict IO-APIC mappings for PV Dom0
Content-Language: en-US
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Paul Durrant <paul@xen.org>
References: <80448822-bc1c-9f7d-ade5-fdf7c46421fe@suse.com>
 <1de2cc0a-e89c-6be9-9d6e-a10219f6f9aa@suse.com>
 <YpYozCRkfs1KdBus@Air-de-Roger>
 <22d2f071-4046-52c6-6f11-23fb23fb61c1@suse.com>
 <YpY/Pm43mMJFGYql@Air-de-Roger>
 <e5bc83c8-3962-4d43-4ef1-f338ca2fb782@suse.com>
 <YpcgoYkJMzQnXUkb@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <YpcgoYkJMzQnXUkb@Air-de-Roger>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AM6PR08CA0030.eurprd08.prod.outlook.com
 (2603:10a6:20b:c0::18) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e2fb40bf-a4bc-42bd-fa54-08da43e0d822
X-MS-TrafficTypeDiagnostic: AM6PR04MB6295:EE_
X-Microsoft-Antispam-PRVS:
	<AM6PR04MB6295A5FF41C03CD7ABD4FC50B3DF9@AM6PR04MB6295.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	lyIN1D++jPv21a9wDGBHs/iCgAGQyOdZtsa8pa8H2lguM2aoZ+49NwGVQe6tNQvR1oIOilknpfcmUEI8uTXuXbOBpwgfmEQAwz/C6z4zo0WZRdbwZoA3HsAU6P1e0xw/46dM7jjXa4+Al9tvqhbi73A3VJJh105OpoRjBpRDFES1RMnJj+SCRg3R4UidmD/d0+GJnkyUdkH9MbH6br7Nfhu2FrmpX8x9I+nfge28LMjarEDs3zm/jtZYPmhdqx7sOWFwzCSx/l3VY3t9GnJPh6nBHVkQZgRuOAh6WCCrZDW+qQw1luRbieVdCdyYpuYDgQH4suNKRjFA+a5dWzBmnRtU7rPdSFXGIrSOlxih+sCpBFftRthHBxH7Jwfed91rxYzQQDF6DLnEeF09WmHqF/kQbzTinaZJ21SLYNyZjeHVmnX2Z5URpc6mSyskU4c304LR2JTx79xrYtglL7+NL/M9BdsXc6YwwIYEW0VYYwo6LsPbSfcxXgKHBbtviWtjZKOMOfZRTLonkSfjtbAxTRthluccoSwPO/2rykIplqc/rp7CXMNWmXCDUxEtO0cpkalzy39yfkq7D5R+Eu05iFZS6C4XqRzheaOiqO27MUWipkZO0JD/SFIYk/oE3L5GddCgcWvBKj8FUSCHv4kbfI7I7Xxr826yS7As7EliLxMUnwBjsK+ujfXn5OSXxHPP9zthMaf3OZFtoTU+ePICGz8WsVkVqAS0PTELbIEB8iJRfPofeumPJ6PEU1wPBdNC
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(6666004)(26005)(6512007)(31686004)(5660300002)(508600001)(2616005)(186003)(38100700002)(36756003)(6506007)(53546011)(6486002)(8936002)(31696002)(66476007)(4326008)(83380400001)(66556008)(8676002)(66946007)(6916009)(54906003)(2906002)(316002)(86362001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?wyFXNLcckk7EPTGoPa4GQyBkElqAoW/TD3QNfElI70dpogIEYsGYwCbszS5X?=
 =?us-ascii?Q?WTIM0EFGZmMGX7CMJkn7V9iAZLnkHvI3NStkmLS6ZMEvu+wg/0wXkBHysI0W?=
 =?us-ascii?Q?ka0FctiMU+FwmpPdxnwLEH5B1gmv4OPlZwJVNuwp4kPf/bOS5il7owg6jjmo?=
 =?us-ascii?Q?aHlswsXP8niMvNpPrlxv0KFURl3MmdYfyjkz+znqySchauwT3/ZmIAhpkTau?=
 =?us-ascii?Q?sEyBNI/uCfPq26rwC0v6DgOoCi2AC7ONJfrdFKS3GNwNSOP8mbxx7AF1cw5q?=
 =?us-ascii?Q?InCMAbvIGyemLm+AsPPnPIGuDnYQJVZXG0langRfTIEscUS/ZWaGIqgwtwl1?=
 =?us-ascii?Q?zMeZ6+xYqWDnCAFFsvusWuvRBq91Clz2H56ELHkVQ1oHOZl+CrB+Fy4zx1O1?=
 =?us-ascii?Q?wIcqTbjIA59MQTeEX5R1nqZC1S3O/wvI4HNWGQVMnadLkslaa7C5w1EckRl0?=
 =?us-ascii?Q?n/LlTUE2O4TU26iLAfROCKYx1bsXHiCC0ZyEzAiYdvMbxJz8xE4HBD0M0vBU?=
 =?us-ascii?Q?hXBqop1sFhfdQB5qBh7mYtM9frbOM8uhgZJLkNvaxW7YKDdXfu9dBv4K6gBw?=
 =?us-ascii?Q?mcQCsEwZZ/nnpZuZIXglZtBPR12/L0oiNFQlRN5TBYVaOTIe0EV5UV8nEIVQ?=
 =?us-ascii?Q?e2J5lYltK1vBnysIEUdVU0RYiRve67LwWUmcSoKFePoZ8jZ9q4zYwuGoae/3?=
 =?us-ascii?Q?/9UE6TDN78A0iGuuFBmCpLlBP+wNChl+H/QrEqdy9AF+CAChqEf2BjxM+Tlw?=
 =?us-ascii?Q?bA6HZRXs8v37+hDp08M2jCO7vGO6Ho69yV1NN6ltkitlDCqe57/UsLrnPW0G?=
 =?us-ascii?Q?+ZGbgqB777xUaxDgpf3jSMVraQbXiePnQy4/uGYc/ytZuyb0ptTY1iUsb6uZ?=
 =?us-ascii?Q?WLd21ysv5amGyUj++S2mqBOyZ9R8bu7WLLU5qp8s/nTH+CB894TMkJL4ydyu?=
 =?us-ascii?Q?WY3WFoRBe4JHjLL0ffkh8rfYlg0zLCnEgZ3ulnIrjl992Q1E+kuX9azOx5/K?=
 =?us-ascii?Q?qsccocIwSbiYUAGMaTbZXXgq5BKAB718K9Xl140Is5IyjkwcBawdFTPzIHxx?=
 =?us-ascii?Q?F/+fC9VOB13e3rW5Nt4vBnZWfRx7qvJGgXVX5MDpxTFOVNKRxz0DaBxN5UT9?=
 =?us-ascii?Q?DlJlGS02yGUwIAxMr0/8n46TetcGWaWB/4+Jv6c+2oEiPnCHwO1RBKLpHidI?=
 =?us-ascii?Q?PeOfF04D+b2qPWrlSxnOl1a2V4p58jS+ZsGG8/b/eTaW1M7Zi53toVu9O4p7?=
 =?us-ascii?Q?b/hpUeulcNB5PT/I6dpNz7CY7ydhei1wbRTuDtmFgzrzVQ0oLau/O4RuXj/u?=
 =?us-ascii?Q?ZzJCBc3NRmnShKiUPCy5cqP5vcyousJlo0zNH6nJeWj06drR0qtKvJpxlVJ5?=
 =?us-ascii?Q?YhDkM1tPwCjDrktdFQrO6R0QjoNuezC02Zj4DtimCS1oHw1UzeEqyPjf3vB1?=
 =?us-ascii?Q?KyOpwhrpDXOdUdjvL/n33i2zGUvhoxIiZML0RYBK9F91LoM91HRJgS36a2wm?=
 =?us-ascii?Q?1I88sgsO1ZoeE631YkjMX9DVOsDrr3PQD+LJkaBrcHzN6rMzOLFoLXN59e1Q?=
 =?us-ascii?Q?GZKZOR+qNuhGL/tpryaqgUGFpkkB9BfU+6I3jsEYRgWUqdc4IA0yCpsE3aiP?=
 =?us-ascii?Q?AMVSpVlU/8R1b2aGLDs2eDePuXI435EFOOSWrIfBPp4r9JnodfCm/e7gP1LF?=
 =?us-ascii?Q?VX08EoHfB+sciSFnNuNsyWYRQk5C5lMsgUZXtzcJOaFVrn5Jgu0hQZEUf3gF?=
 =?us-ascii?Q?PDrnQrU6SA=3D=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e2fb40bf-a4bc-42bd-fa54-08da43e0d822
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jun 2022 15:10:20.6440
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3laY3KUza2fbKe0ybzsXqfmpefefCU1rEeUX56pVZB2aE891CfYYVgHZV0ghNot1s8dbK3NhThB5gKNfRTK/iw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR04MB6295

On 01.06.2022 10:17, Roger Pau Monn=C3=A9 wrote:
> On Wed, Jun 01, 2022 at 09:10:09AM +0200, Jan Beulich wrote:
>> On 31.05.2022 18:15, Roger Pau Monn=C3=A9 wrote:
>>> On Tue, May 31, 2022 at 05:40:03PM +0200, Jan Beulich wrote:
>>>> On 31.05.2022 16:40, Roger Pau Monn=C3=A9 wrote:
>>>>> On Fri, May 27, 2022 at 01:12:06PM +0200, Jan Beulich wrote:
>>>>>> @@ -289,44 +290,75 @@ static bool __hwdom_init hwdom_iommu_map
>>>>>>       * that fall in unusable ranges for PV Dom0.
>>>>>>       */
>>>>>>      if ( (pfn > max_pfn && !mfn_valid(mfn)) || xen_in_range(pfn) )
>>>>>> -        return false;
>>>>>> +        return 0;
>>>>>> =20
>>>>>>      switch ( type =3D page_get_ram_type(mfn) )
>>>>>>      {
>>>>>>      case RAM_TYPE_UNUSABLE:
>>>>>> -        return false;
>>>>>> +        return 0;
>>>>>> =20
>>>>>>      case RAM_TYPE_CONVENTIONAL:
>>>>>>          if ( iommu_hwdom_strict )
>>>>>> -            return false;
>>>>>> +            return 0;
>>>>>>          break;
>>>>>> =20
>>>>>>      default:
>>>>>>          if ( type & RAM_TYPE_RESERVED )
>>>>>>          {
>>>>>>              if ( !iommu_hwdom_inclusive && !iommu_hwdom_reserved )
>>>>>> -                return false;
>>>>>> +                perms =3D 0;
>>>>>>          }
>>>>>> -        else if ( is_hvm_domain(d) || !iommu_hwdom_inclusive || pfn=
 > max_pfn )
>>>>>> -            return false;
>>>>>> +        else if ( is_hvm_domain(d) )
>>>>>> +            return 0;
>>>>>> +        else if ( !iommu_hwdom_inclusive || pfn > max_pfn )
>>>>>> +            perms =3D 0;
>>>>>>      }
>>>>>> =20
>>>>>>      /* Check that it doesn't overlap with the Interrupt Address Ran=
ge. */
>>>>>>      if ( pfn >=3D 0xfee00 && pfn <=3D 0xfeeff )
>>>>>> -        return false;
>>>>>> +        return 0;
>>>>>>      /* ... or the IO-APIC */
>>>>>> -    for ( i =3D 0; has_vioapic(d) && i < d->arch.hvm.nr_vioapics; i=
++ )
>>>>>> -        if ( pfn =3D=3D PFN_DOWN(domain_vioapic(d, i)->base_address=
) )
>>>>>> -            return false;
>>>>>> +    if ( has_vioapic(d) )
>>>>>> +    {
>>>>>> +        for ( i =3D 0; i < d->arch.hvm.nr_vioapics; i++ )
>>>>>> +            if ( pfn =3D=3D PFN_DOWN(domain_vioapic(d, i)->base_add=
ress) )
>>>>>> +                return 0;
>>>>>> +    }
>>>>>> +    else if ( is_pv_domain(d) )
>>>>>> +    {
>>>>>> +        /*
>>>>>> +         * Be consistent with CPU mappings: Dom0 is permitted to es=
tablish r/o
>>>>>> +         * ones there (also for e.g. HPET in certain cases), so it =
should also
>>>>>> +         * have such established for IOMMUs.
>>>>>> +         */
>>>>>> +        if ( iomem_access_permitted(d, pfn, pfn) &&
>>>>>> +             rangeset_contains_singleton(mmio_ro_ranges, pfn) )
>>>>>> +            perms =3D IOMMUF_readable;
>>>>>> +    }
>>>>>>      /*
>>>>>>       * ... or the PCIe MCFG regions.
>>>>
>>>> With this comment (which I leave alone) ...
>>>>
>>>>>>       * TODO: runtime added MMCFG regions are not checked to make su=
re they
>>>>>>       * don't overlap with already mapped regions, thus preventing t=
rapping.
>>>>>>       */
>>>>>>      if ( has_vpci(d) && vpci_is_mmcfg_address(d, pfn_to_paddr(pfn))=
 )
>>>>>> -        return false;
>>>>>> +        return 0;
>>>>>> +    else if ( is_pv_domain(d) )
>>>>>> +    {
>>>>>> +        /*
>>>>>> +         * Don't extend consistency with CPU mappings to PCI MMCFG =
regions.
>>>>>> +         * These shouldn't be accessed via DMA by devices.
>>>>>
>>>>> Could you expand the comment a bit to explicitly mention the reason
>>>>> why MMCFG regions shouldn't be accessible from device DMA operations?
>>>>
>>>> ... it's hard to tell what I should write here. I'd expect extended
>>>> reasoning to go there (if anywhere). I'd be okay adjusting the earlier
>>>> comment, if only I knew what to write. "We don't want them to be
>>>> accessed that way" seems a little blunt. I could say "Devices have
>>>> other means to access PCI config space", but this not being said there
>>>> I took as being implied.
>>>
>>> But we could likely say the same about IO-APIC or HPET MMIO regions.
>>> I don't think we expect them to be accessed by devices, yet we provide
>>> them for coherency with CPU side mappings in the PV case.
>>
>> As to "say the same" - yes for the first part of my earlier reply, but
>> no for the latter part.
>=20
> Yes, obviously devices cannot access the HPET or the IO-APIC MMIO from
> the PCI config space :).
>=20
>>>> Or else what was the reason to exclude these
>>>> for PVH Dom0?
>>>
>>> The reason for PVH is because the config space is (partially) emulated
>>> for the hardware domain, so we don't allow untrapped access by the CPU
>>> either.
>>
>> Hmm, right - there's read emulation there as well, while for PV we
>> only intercept writes.
>>
>> So overall should we perhaps permit r/o access to MMCFG for PV? Of
>> course that would only end up consistent once we adjust mappings
>> dynamically when MMCFG ranges are put in use (IOW if we can't verify
>> an MMCFG range is suitably reserved, we'd not find in
>> mmio_ro_ranges just yet, and hence we still wouldn't have an IOMMU
>> side mapping even if CPU side mappings are permitted). But for the
>> patch here it would simply mean dropping some of the code I did add
>> for v5.
>=20
> I would be OK with that, as I think we would then be consistent with
> how IO-APIC and HPET MMIO regions are handled.  We would have to add
> some small helper/handling in PHYSDEVOP_pci_mmcfg_reserved for PV.

Okay, I'll drop that code again then. But I'm not going to look into
making the dynamic part work, at least not within this series.

Jan


