Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E98B442D5B
	for <lists+xen-devel@lfdr.de>; Tue,  2 Nov 2021 13:00:47 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.220154.381310 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mhsSe-00088B-1S; Tue, 02 Nov 2021 12:00:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 220154.381310; Tue, 02 Nov 2021 12:00:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mhsSd-00084r-UD; Tue, 02 Nov 2021 12:00:15 +0000
Received: by outflank-mailman (input) for mailman id 220154;
 Tue, 02 Nov 2021 12:00:14 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=uxJb=PV=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mhsSc-00084h-Ao
 for xen-devel@lists.xenproject.org; Tue, 02 Nov 2021 12:00:14 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.109.102])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 6f05dbb6-3bd4-11ec-8556-12813bfff9fa;
 Tue, 02 Nov 2021 12:00:13 +0000 (UTC)
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04lp2052.outbound.protection.outlook.com [104.47.13.52]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-11-NCXDmO43MC6XJVfyz3in4w-1; Tue, 02 Nov 2021 13:00:11 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB6174.eurprd04.prod.outlook.com (2603:10a6:803:fa::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4649.18; Tue, 2 Nov
 2021 12:00:09 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::8062:d7cb:ca45:1898]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::8062:d7cb:ca45:1898%3]) with mapi id 15.20.4649.020; Tue, 2 Nov 2021
 12:00:09 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AM6P191CA0042.EURP191.PROD.OUTLOOK.COM (2603:10a6:209:7f::19) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4649.14 via Frontend Transport; Tue, 2 Nov 2021 12:00:08 +0000
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
X-Inumbo-ID: 6f05dbb6-3bd4-11ec-8556-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1635854412;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=N8UUqibQd0B156fQU9nvc/7+y8V26bmou3sTTpFX3Ys=;
	b=Hh6/F9cFqORlX6ZBt4bsYUqWZwrOorw7+L5I6ZfZX9UIPTc8GIGbo6fEY79m1sfYygIFit
	PYpj+F38JgI+3NQeOHkFTyjVVGzh72fwI3zhow76/qykQi/B7dTRCgAVkHtDm73qqwSkVl
	rnif0eDyHL8A6y+w3QV1SGhm8G6Br6g=
X-MC-Unique: NCXDmO43MC6XJVfyz3in4w-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=D6OHLmfBizm/SfcYMv7A7lJFJLWW0VBxN1BVHxaH4kDoRUBf0kEI28Dn+yr4GfWSB/VXx5rbGkwkXmhTB7DDT3v+uKcaRQt7rsGfuuW1XSMZbmRiPDeoHJPmwUqmViGyyZamkRCPVLSaHwUx1Gpe7RbSDLJPHe5o888WIyq9rUkQ24pA62zOIy8Xi/qRnRtm4orcY8Qas9o7zwsSTJp2bcGhIJYF6ehACYC3dMwvEmMBELd6xQgYiHpwpPOVCxUORq7Z2xtfbkjKuhmuAT/eqC0HOadQUJ5htsGiVMT/hvGk+d12brmcsWJhhYDc+NQaWSE9CLp8NrQA/Re9+gN5IA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xraGvvAYIxVrF7cLPhWVQFWWae9lbxBxuKE/gXvIgJU=;
 b=KT/55BhqNdli8fhAEf1r4gnT/syczeLm+oyZ9XA/BIz3oFRzjC1GcoykeuvQ27Hk3AZH5k43rMt2rCjLD57ZiU67NICDAHNaIHnCHaU0fL+jYQtZ/FVJfB66FToHPagKgecAqsxNJMA7UbkQiPS95nHE/vT/SQRuHWePGHoUtTqh+znGttNK69OrZp9EoljhKUdnX4eyArsV7s8prfOlJrOsdCne2DpmdbIbymcoRe2sAzuiEOOT4Y5HiMaw1A9vM/RiJMoFv8nfqHvrZurpXUfz0efBiYOc4617HANfIK56umyJW85uubhbyXMUJq0vJNYubCtH8Lpev/D/WPouvQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <f3fac17f-12f2-2e75-dcd2-4f2abb57d043@suse.com>
Date: Tue, 2 Nov 2021 13:00:07 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.1
Subject: Re: [PATCH] x86/cpuid: prevent decreasing of hypervisor max leaf on
 migration
Content-Language: en-US
To: Roger Pau Monne <roger.pau@citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>
CC: Wei Liu <wl@xen.org>, Ian Jackson <iwj@xenproject.org>,
 xen-devel@lists.xenproject.org
References: <20211027140050.67509-1-roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20211027140050.67509-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AM6P191CA0042.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:209:7f::19) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6087906f-01d3-43e9-75a0-08d99df8512e
X-MS-TrafficTypeDiagnostic: VI1PR04MB6174:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB617478685DFEB0E442F91605B38B9@VI1PR04MB6174.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4125;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	b7NX7/027APKl8Y//IIGFJzviXlA+QXO+OPBQT0A45m0Y/yQuUGzIWRaTJduObCot1mASjLvFe2KDb3YZ3z4eAWcGfAWpht+gKp0zUFRMbc8+fh5Z7tHIeOe2V1cY2Cdw/sytb97dZNXcyOs/zoz61WiXJAFDjKs6OHPBvwtFo+DODE5lcA/oDBHV7NhC+MP2Y9eggK2HQxMFZsv1FflZesNxWJEJK6ZVdhciMufmF8d7VQERPtUjeur+qhelQPC7jWvKTHKFymDbxdDGoRVuMjmUY9+5LdghkXbeG8zGARMNtizp0nhKMeXTaYaZ4rqUe/SczKU/Ldph0wBc4Hmku+0iD/fSxL+ufYfgOvSV9ge/lwg98dgpK1z98udFkBTGAFVal7WMF1gDlgg7QY/9S/4xd6hA/1JKkG1jU2FIOZkNgTnH8bczt2ubshUC1nFbe8hGaVL1n0mn+9h0apboxFb/ZZW7JS2C8KX1oD7jZO7tfxHJIgoLFAqroXsDbPFUOxKVru+dcmBc/cwgu9VKSm6d0Blez9KhdMVUyhknE5NxXMtT6XbwRZrUPHLy6rSie9nWsUIgEou41LuF9uIRGDYiqon3qlrcJBZ8wP9GsF6eGANKZ88DY6K96H9I/ELncAxYFrKLQw9q6abaBtkTRtGrLPpVKjjVf4t7TLOZylQFPDhjsXzWiAD8A56ls9xs0rntJljuYLuYXY47ZRcwPyJxXeEh4GNSQnweg5csJo=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(5660300002)(66556008)(66476007)(2616005)(956004)(2906002)(31686004)(36756003)(66946007)(186003)(8676002)(38100700002)(54906003)(31696002)(26005)(86362001)(316002)(6486002)(4326008)(110136005)(16576012)(508600001)(53546011)(83380400001)(8936002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?mBPMrrYPc94hvXKfshvIRgcFGtU1wvPvoYc4uD9XeRmii3goH1YI8kQhFqds?=
 =?us-ascii?Q?w/OUvXJG979gRJ71lTr5CLvK7Sz9nFzl3DVbyD3OfxbxFpXQrp/+P7kEl/Wn?=
 =?us-ascii?Q?kjAVU0DrdU2+P+TW+urf3TVzq3koRmOxOINd7uJxkyabjMGlEL+d3suYkmXH?=
 =?us-ascii?Q?c1dmfIkOY4FaQJGDsAxIzdDQCxYXdZnGbkO73vUept/RemNmWL+XFzD5+AhX?=
 =?us-ascii?Q?nFk55Z/R2NwEvaf8GyUaJmbo3glduyyVzJ1dNlodsrBykz6whgT4P8fTFlSZ?=
 =?us-ascii?Q?T4KSKciskRU4UoTx6BvsD5WXPGJVasmlpcu0iiMGYTZZdXfX1bKuYJezWxlh?=
 =?us-ascii?Q?QtmGKaoAGR+oQy1G3AI/UoYSUZJktd2i4VlAFAPptSWfqOqvJAMu5rMq45Y6?=
 =?us-ascii?Q?URog5I9RJDxM4nuRK60TRyk4/GBV8tg1Q2sT+RdEyvx5ojOxMBRvyS7OZ54s?=
 =?us-ascii?Q?Vk36FBbEgi77FkHmUk4e3LCm/jzgkkDCrGoeQ1O/MQHE78JOURDVIfbKqd+K?=
 =?us-ascii?Q?oSIkVDenu0uiZP1HdNJhUgho3KnC3IoXtUFOszt55KyFBxOfX1a6ArE5yW4v?=
 =?us-ascii?Q?JV6QazxJnPWlO5EINXHjG8rNk1TpgZ9/LAdaWUh+1FWtomuLV/I+vpDDw12a?=
 =?us-ascii?Q?1zQVjd0yElY/bpgWsshDjkgrt7XjD3l7WJLUC/RzYfRJweiurJyzessXEJg7?=
 =?us-ascii?Q?sk0IgUwyGRXxLJ1OTwpMW3Zmfdhahegce3DIIhT1+eUik+jRV6oQ0QiHg/x4?=
 =?us-ascii?Q?R6+fGqADHQkuvQ6P1TS/E5hnc4o2JEFZ3nzACAgpqXDJs4laWwXByrFAw0lv?=
 =?us-ascii?Q?Sc+XWeZ0yrvmrflpl8TllMIAtzeNODkx8tj6xgwIIPU4eVUlOfZUKwTHU+ds?=
 =?us-ascii?Q?TNzo1zJboOL87jHpHGqtqqDAuuQhwGZnGokZwryxwgIvYN/bQFiQLzwQ8Zyl?=
 =?us-ascii?Q?rg1Doo1B44bmMLKJj9afk9imRc6DTsBSBFPRQmXVZzXM20SpCemRJmDEpcw7?=
 =?us-ascii?Q?3ee6nBvQXJCBzmHekMThlaqHVcjX+Fvm32zngxIr20P047h95gybGSyqz3jt?=
 =?us-ascii?Q?rgaau9oHWqm2l7l3GjYxnzq8xRChFhugwZ50EVpJikT7KvwtbE393M+A9meY?=
 =?us-ascii?Q?AqKrY8tjx9eTjmPpaln0RD3jiOkSftPGaoehnw4Vs5yvwHpMiMJXr4wKTUSh?=
 =?us-ascii?Q?KUBoN2gvQQ1jL7jdeeKhJXeaYJ73xf7yuiWc4I+JNUgiUQRwLo5hlBkc7JnN?=
 =?us-ascii?Q?fNqMtmjrpRNCJGN0baJp+F2S3QBb/CkIoRG+H5a54oGnoKLecQc4o80WC+zu?=
 =?us-ascii?Q?U9JzFJVG5cly+oCgUqcuUOkG/QsxViNrRi4pqpM3+EWID4sIQrsMVx8QZthL?=
 =?us-ascii?Q?Ue0oXytjJpo+lvIp3TMYdMMcV6lUZHwCVO8bw5AC9trhJ0Vx8TDtc5jsOlz1?=
 =?us-ascii?Q?FsYXSsSZ44HdFlqG169G6Ag1WrkjqLNTDWDr+eDSqA9sGFP2IAG+4qHCVxNi?=
 =?us-ascii?Q?TUQq+C7a3l9nnot6ZlbAYvLmBHDF+j5u2MkHQwCI0YB7Gy0Acl/t2cpiYS8+?=
 =?us-ascii?Q?YCVv1BeN59wrVMHO+3y24xvm0vGT97pFZAyaO1j7YMkFa/MIRNocyZYc5KOe?=
 =?us-ascii?Q?ZkxGKHZ6tqqF9Lp34QSvJ4k=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6087906f-01d3-43e9-75a0-08d99df8512e
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Nov 2021 12:00:09.0214
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JUnHO+hM35ThqsQOcmM1G4lqpKZQYxCSS6Drf2312v83pgZrDTwOhg4mBznlyjj7HDo7q9TY9NvWX+RDBYqGXQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB6174

On 27.10.2021 16:00, Roger Pau Monne wrote:
> In order to be compatible with previous Xen versions, and not change
> max hypervisor leaf as a result of a migration, keep the clamping of
> the maximum leaf value provided to XEN_CPUID_MAX_NUM_LEAVES, instead
> of doing it based on the domain type. Also set the default maximum
> leaf without taking the domain type into account. The maximum
> hypervisor leaf is not migrated, so we need the default to not regress
> beyond what might already be reported to a guest by existing Xen
> versions.

While this is the missing description to the patch I had submitted
back in May upon Andrew's request, I have to admit that I don't
consider this a satisfactory explanation. Shouldn't hypervisor
leaves undergo similar leveling as other leaves? I.e. upon
migration leaves or individual bits should neither disappear nor
appear?

I continue to consider it at least suspicious that HVM guests get
5 leaves reported when only 4 are really meaningful to them. I
see this has gone in, so I'm likely to trip up on this again in
the future. Might result in the same patch again then if I don't
end up doing archeology at that point ...

Jan

> This is a partial revert of 540d911c28 and restores the previous
> behaviour and assures that HVM guests won't see it's maximum
> hypervisor leaf reduced from 5 to 4 as a result of a migration.
>=20
> Fixes: 540d911c28 ('x86/CPUID: shrink max_{,sub}leaf fields according to =
actual leaf contents')
> Reported-by: Andrew Cooper <andrew.cooper3@citrix.com>
> Signed-off-by: Roger Pau Monn=C3=A9 <roger.pau@citrix.com>
> ---
> Cc: Ian Jackson <iwj@xenproject.org>
> ---
> Regarding release risks:
>=20
> This is a partial revert of a commit.  The main issues could be that a
> partial revert could break the build or leave the remaining code in a
> non-working condition.
>=20
> Breaking the build will be easily discovered by our automated testing,
> while leaving the remaining code in a broken state is unlikely, as the
> chunks reverted are isolated from the rest of the change in
> 540d911c28.
> ---
>  xen/arch/x86/traps.c                | 6 ++----
>  xen/include/public/arch-x86/cpuid.h | 6 +-----
>  2 files changed, 3 insertions(+), 9 deletions(-)
>=20
> diff --git a/xen/arch/x86/traps.c b/xen/arch/x86/traps.c
> index a1c2adb7ad..79fd276a41 100644
> --- a/xen/arch/x86/traps.c
> +++ b/xen/arch/x86/traps.c
> @@ -1086,15 +1086,13 @@ void cpuid_hypervisor_leaves(const struct vcpu *v=
, uint32_t leaf,
>      uint32_t base =3D is_viridian_domain(d) ? 0x40000100 : 0x40000000;
>      uint32_t idx  =3D leaf - base;
>      unsigned int limit =3D is_viridian_domain(d) ? p->hv2_limit : p->hv_=
limit;
> -    unsigned int dflt =3D is_pv_domain(d) ? XEN_CPUID_MAX_PV_NUM_LEAVES
> -                                        : XEN_CPUID_MAX_HVM_NUM_LEAVES;
> =20
>      if ( limit =3D=3D 0 )
>          /* Default number of leaves */
> -        limit =3D dflt;
> +        limit =3D XEN_CPUID_MAX_NUM_LEAVES;
>      else
>          /* Clamp toolstack value between 2 and MAX_NUM_LEAVES. */
> -        limit =3D min(max(limit, 2u), dflt);
> +        limit =3D min(max(limit, 2u), XEN_CPUID_MAX_NUM_LEAVES + 0u);
> =20
>      if ( idx > limit )
>          return;
> diff --git a/xen/include/public/arch-x86/cpuid.h b/xen/include/public/arc=
h-x86/cpuid.h
> index 00926b1fef..ce46305bee 100644
> --- a/xen/include/public/arch-x86/cpuid.h
> +++ b/xen/include/public/arch-x86/cpuid.h
> @@ -113,10 +113,6 @@
>  /* Max. address width in bits taking memory hotplug into account. */
>  #define XEN_CPUID_MACHINE_ADDRESS_WIDTH_MASK (0xffu << 0)
> =20
> -#define XEN_CPUID_MAX_PV_NUM_LEAVES 5
> -#define XEN_CPUID_MAX_HVM_NUM_LEAVES 4
> -#define XEN_CPUID_MAX_NUM_LEAVES \
> -    (XEN_CPUID_MAX_PV_NUM_LEAVES > XEN_CPUID_MAX_HVM_NUM_LEAVES ? \
> -     XEN_CPUID_MAX_PV_NUM_LEAVES : XEN_CPUID_MAX_HVM_NUM_LEAVES)
> +#define XEN_CPUID_MAX_NUM_LEAVES 5
> =20
>  #endif /* __XEN_PUBLIC_ARCH_X86_CPUID_H__ */
>=20


