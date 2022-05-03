Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 124BE51873D
	for <lists+xen-devel@lfdr.de>; Tue,  3 May 2022 16:51:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.319714.540061 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nltrZ-0006ab-FC; Tue, 03 May 2022 14:50:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 319714.540061; Tue, 03 May 2022 14:50:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nltrZ-0006Z4-Bk; Tue, 03 May 2022 14:50:53 +0000
Received: by outflank-mailman (input) for mailman id 319714;
 Tue, 03 May 2022 14:50:52 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=YfIj=VL=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nltrX-0005pg-NS
 for xen-devel@lists.xenproject.org; Tue, 03 May 2022 14:50:51 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6c8ad055-caf0-11ec-a406-831a346695d4;
 Tue, 03 May 2022 16:50:50 +0200 (CEST)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05lp2107.outbound.protection.outlook.com [104.47.18.107]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-10-yFakTHKzPAWYuFRyQP-3DQ-1; Tue, 03 May 2022 16:50:49 +0200
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com (2603:10a6:10:2db::16)
 by AM0PR04MB7122.eurprd04.prod.outlook.com (2603:10a6:208:19c::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5206.24; Tue, 3 May
 2022 14:50:49 +0000
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::5cb0:5195:4203:7c2f]) by DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::5cb0:5195:4203:7c2f%8]) with mapi id 15.20.5206.013; Tue, 3 May 2022
 14:50:48 +0000
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
X-Inumbo-ID: 6c8ad055-caf0-11ec-a406-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1651589450;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ezJo7YDgknkq7vhqbpS9obSKpnX7KAvezgl9XgxGlHU=;
	b=H23haPd5wAGNO6ylLEv7hAEe6Prxkn1x0F+E8f3ycw2R0CepZfQCcRsg7iJHT/99kfCVTA
	dKuTAKmfdI/QTE/aamQBJQHYP+WrKefnaBHPciqeQV3YKcrTKAaM0KiF6RZTJ1ErjseGYE
	RVHXrwd5imuftQZz4/mroIm3ki6xiHY=
X-MC-Unique: yFakTHKzPAWYuFRyQP-3DQ-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=leNfv2hcFwoa3eebkiecZA3JSqe0zlQYuP4BV0TQJ8eDStlbnTyCU5SnkZwnpuxCIZDchYYVPZetS6YrR+d47O6qZLI+ieq0jygQjN97XPPW7QYdqzaqXXaP5+rpv/SHdEMP9cNHoVpp+qmG6qnSOI8TzA+P8aeVFX5+rNunxBaSPx5gP7oDaHUe99pbAzdsG1SDXcJzaHBp434NE9cADmE1dVo/sk2VzeT2vV06rmU9FzW8sPMq6Lh9vKXK1DEAgKJ+5OKejjJhd6hM7bwlSNDQt639+oGIYFxM0VAIZtyKBpUuewARti1McHdG0EIdScIlw1Y0XoJHcijPolvofg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gWGdVFOWyKkjmpReZGRkKTWPXr9heReK4U68dZjHxO8=;
 b=JnDboInax8O1WwjqjFA2Xx7JsZwEkH1d8dbVv7St6nOn3PTSggX48yMXx3mMIXMSbv1CawRxNNrtpnGxrSZZu3FIcmXksOcso47CGM4OOmo+Zy4z0omcxiqxginq3zmZmU+8SJuDbrqMylUWFf8u6023zVqsN9chXi5Edgu62r+TCfNam3FFNHezxI/4rSzUoW6VAZmc+n6e7sUd7al2GKyg0Kyl69XE/O89MvN1j4AuB8PDcZa688OiVBr9yQpyFv6rz3zqaBnpOVwStPVQ4JnMhfNLcC01Pgp5qkduDWyFgVQfV8pfG5tr+lUIrEl+4aUhCR5zJtKKmKbl71sThg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <6ffd48ee-9356-2f22-415e-03e172eabb55@suse.com>
Date: Tue, 3 May 2022 16:50:47 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH v4 05/21] IOMMU/x86: restrict IO-APIC mappings for PV Dom0
Content-Language: en-US
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Paul Durrant <paul@xen.org>
References: <b92e294e-7277-d977-bb96-7c28d60000c6@suse.com>
 <5cb4dc1b-f6b0-89cc-e21c-a27a5daf0290@suse.com>
 <YnEngsDG9BiiyzXj@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <YnEngsDG9BiiyzXj@Air-de-Roger>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: FR0P281CA0068.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:49::13) To DU2PR04MB8616.eurprd04.prod.outlook.com
 (2603:10a6:10:2db::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3adf452e-60e0-49d1-cd0d-08da2d144fb5
X-MS-TrafficTypeDiagnostic: AM0PR04MB7122:EE_
X-Microsoft-Antispam-PRVS:
	<AM0PR04MB7122F422016E254C0D77D886B3C09@AM0PR04MB7122.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	L5fGZx1v2HDYzqge9HsOEk0P7vbQu+yt5btCT/hXU/H+BHX1MKZxBQ9b7TH9CVaOEajzkbEBu27RkWb7HMmbt1R8E2m6JXFGlvYUvfocVBW+c5msmSG253WihCSKU7xS9TVNEC00D9z6eQ/h9pI95TrPjnubwIiCY/j5TmkJItrKPBoe2TMcrWgkO2IeAss8HSVPZgC+3RdhB3r0iouvb+ic37IiM9ZERCQJdvSL42v65Mv7E2oyrNhvO5ycqUSuIehJu7hfctueckZJJkUZ8YSR/mlZfOHyZdYKd7VupKLksD3nbfvMGN4QwlwPvILzNjrV/i4W0zxCOYqCUv0S8xiZRXQu2pn/UAAq7AoxOz7kxzdVD6k6YZ3PSo6NXgGWmF+UlOIGQ6Th1jodaF2jetHcBtCGLwJngeUe2+liK1Lv580XfTESKZiLoMetbHzyjtUP31pMZM4vaij/Va8FO0hQdzb8yShUN4KIf80CqbtodoogS6Z8McoQfIqq8ZAujov+NwQJ5WVCA0N2LtQ/fZ78obCZBoeNZT7waoROzOCwnJJf6aQELfnK1mlnyR6wg6+42npaHfexVIUnt7PO9NWC58cOHM8UpOuCSD18S1NBoQvQXyAW/awl6itrFpUcU3F7htmEURVrJc5WbG1NOBLSxjKvLLiNwYUsX2+8L3YnjIBgshQ9vcjPX6Ba1fAVLjFmC9A1hVtkm9drLNeg/x/W9uaIasqNpJ9KO1MrDlJX42lrxLhVu6bRjwOvpLks
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8616.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(36756003)(6486002)(54906003)(4326008)(508600001)(186003)(6916009)(2616005)(86362001)(31696002)(66556008)(66476007)(66946007)(5660300002)(8676002)(38100700002)(316002)(26005)(31686004)(2906002)(6506007)(83380400001)(6512007)(53546011)(8936002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?1yHtJokUi/V7OnTp17zyOCPLDF9hhoXuHHdU949W9qZUCyrYuStUL+HbpkHs?=
 =?us-ascii?Q?cOKUXvejKInZps68w1gt0Tq5jV/IoV+STaua+C1vQpy8Muh3CbJa0dyJL5bm?=
 =?us-ascii?Q?Of4Qv7RbCrxyCkJsPhrgBjSj0u1TusvRl3HTddoiXWW+JhbjG7synW1HoKve?=
 =?us-ascii?Q?dwL9QGwXsdcOnTAgn4EKf4v61ot7EdIZu8yfhwY78t2XP1SJBOjnkKUQemsV?=
 =?us-ascii?Q?TIxVnpDTdQI/rK50zWqCvUhINs3XYM5kwb3VBtVPdRCTyUhD8r2teRXO0xU7?=
 =?us-ascii?Q?99+W29pXB69BRXyum0IE11iy8yO/pqqmrhsbwdbVWrLNL3otTokkyZffELvE?=
 =?us-ascii?Q?SZlJsl3G2Y1c43xJPZGM2WXpUMNOOTndnXpdKDxL6+qS0WJJ/NJwUeNzRzb2?=
 =?us-ascii?Q?xLumTCuJpo2EnfbFm8kfeWQi2HNjQUJb8tdSOvVwF9lJsUkx0sFN8IO/1ILr?=
 =?us-ascii?Q?ly6oFhW/FyA4U364wTwS/L7a5rMivBsmGQOPoqJHO1oq/AlH9wViyZHpLxME?=
 =?us-ascii?Q?6IZEk1OvpouqBP48cSkx9V+KgGeTFSPsosVsTI3nlFwn4jIbWAeCD+e8BS6S?=
 =?us-ascii?Q?dfiemwduKOLMuTqt1nmUre72pOGQLyIQy961U27XsomlyUn/x5fdTWInvsCt?=
 =?us-ascii?Q?6BxpqaIQdBE0PJreVlmQ0Y3JXQM9p1UYgG3E8WneHY6IOcue8Jd16z2PX1OF?=
 =?us-ascii?Q?44O1mGzPJcmJOkng9ZWBZSgsIuwAf6rEqjYO/f3nOwloEaha8JuttLHLCYjv?=
 =?us-ascii?Q?Sk0J19Z/+pLrmA0P309ZM7jkvanz67kEDupEjdrAUe0XZJ0LrCKy9NpqoPcy?=
 =?us-ascii?Q?D6mO1+pPYFJNpDoSQmZatvNRGc3aDf3AqHFXIsYDIRU2i1uMnf5eRGFDxXfV?=
 =?us-ascii?Q?6r4h1+vPP5RR8BNzcDkpSUtnXaVcanPBefFcYTG6iyW9XdsBufUsBbLnrs8L?=
 =?us-ascii?Q?tOb1siubC/Wu/IA9JC7AWBgOmyFxZCMNNpMm9X3KQSbupcE85+Zq4KiBwV3T?=
 =?us-ascii?Q?pJ2e0IqM9+jE9Zl3QEpBfBM2iWsScYATEsdLVAUJWHBYOBrOgLZIN2rr6XBz?=
 =?us-ascii?Q?nNnRpBqHLm04X0zSNj7Awi/lPIVwaLbPO8tqzuEmsLUYWqO6ft9mnDuZpzCk?=
 =?us-ascii?Q?LnR2YEcDDGiZnxYGYvP0Q91Uubz5PkOTxf9rVRGqjy0Ae4ajWOUqwoHwPPpd?=
 =?us-ascii?Q?O621iAtTh9IV83bo6X9c0uhmi4cC4hffaAMWempVBw+Rf4Wor9sKfWQSEuVZ?=
 =?us-ascii?Q?X9O1VlF3+m82/5IpZHB7sxkU1VRIRU46iiayADYI+u96pMJ0OhUPzyXHt9yl?=
 =?us-ascii?Q?WJocxBoYN+wEOeprr+ZdklV61ZDVUTM7/z02ttjEQNcFHN/prug60wcZp6D8?=
 =?us-ascii?Q?5DKkjEdXNGwFXsRdWg7riz+gBkMjflMcepuydUgEbnZFSM+6dTWPit6eY3wQ?=
 =?us-ascii?Q?AYoBV30waLbPblQDz6SIjmKkljk0DYXtmDHf3OeKw4PjJc9nRAbCEGM9f0Fg?=
 =?us-ascii?Q?3k6WwAUTxij85Qx0DzrSWkQ+skSST0n+34MU6D6QdKmvpqLM3rUm0yp7Bxvc?=
 =?us-ascii?Q?gGSiH7CnarPX2MzzyxzU35EUE/0+DA5iMnAjcgj5M2cRNYrQJC9aOE92B2x4?=
 =?us-ascii?Q?YIWUMh/rqs4RdTzeVoBiRqnWykYRGyzEUgVcBTnTe6YynHAvvPjidPXOSyG1?=
 =?us-ascii?Q?9Q2xZi0HC5BWz1uRlQNs+vrIiqLAvkeeh0yiwj+rmw8mWDQIDKL0A7k+JY2Z?=
 =?us-ascii?Q?bjdshEcluQ=3D=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3adf452e-60e0-49d1-cd0d-08da2d144fb5
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8616.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 May 2022 14:50:48.7350
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GFDFCfyXS+Lgxg2jBwvCcLhB8egAOY5kAAMtH+YKDqMDQqw6pooF8Wn7cFP7UObcNu4PGZjN4C1mU4hQUvgL7A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB7122

On 03.05.2022 15:00, Roger Pau Monn=C3=A9 wrote:
> On Mon, Apr 25, 2022 at 10:34:23AM +0200, Jan Beulich wrote:
>> While already the case for PVH, there's no reason to treat PV
>> differently here, though of course the addresses get taken from another
>> source in this case. Except that, to match CPU side mappings, by default
>> we permit r/o ones. This then also means we now deal consistently with
>> IO-APICs whose MMIO is or is not covered by E820 reserved regions.
>>
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>> ---
>> [integrated] v1: Integrate into series.
>> [standalone] v2: Keep IOMMU mappings in sync with CPU ones.
>>
>> --- a/xen/drivers/passthrough/x86/iommu.c
>> +++ b/xen/drivers/passthrough/x86/iommu.c
>> @@ -275,12 +275,12 @@ void iommu_identity_map_teardown(struct
>>      }
>>  }
>> =20
>> -static bool __hwdom_init hwdom_iommu_map(const struct domain *d,
>> -                                         unsigned long pfn,
>> -                                         unsigned long max_pfn)
>> +static unsigned int __hwdom_init hwdom_iommu_map(const struct domain *d=
,
>> +                                                 unsigned long pfn,
>> +                                                 unsigned long max_pfn)
>>  {
>>      mfn_t mfn =3D _mfn(pfn);
>> -    unsigned int i, type;
>> +    unsigned int i, type, perms =3D IOMMUF_readable | IOMMUF_writable;
>> =20
>>      /*
>>       * Set up 1:1 mapping for dom0. Default to include only conventiona=
l RAM
>> @@ -289,44 +289,60 @@ static bool __hwdom_init hwdom_iommu_map
>>       * that fall in unusable ranges for PV Dom0.
>>       */
>>      if ( (pfn > max_pfn && !mfn_valid(mfn)) || xen_in_range(pfn) )
>> -        return false;
>> +        return 0;
>> =20
>>      switch ( type =3D page_get_ram_type(mfn) )
>>      {
>>      case RAM_TYPE_UNUSABLE:
>> -        return false;
>> +        return 0;
>> =20
>>      case RAM_TYPE_CONVENTIONAL:
>>          if ( iommu_hwdom_strict )
>> -            return false;
>> +            return 0;
>>          break;
>> =20
>>      default:
>>          if ( type & RAM_TYPE_RESERVED )
>>          {
>>              if ( !iommu_hwdom_inclusive && !iommu_hwdom_reserved )
>> -                return false;
>> +                perms =3D 0;
>>          }
>> -        else if ( is_hvm_domain(d) || !iommu_hwdom_inclusive || pfn > m=
ax_pfn )
>> -            return false;
>> +        else if ( is_hvm_domain(d) )
>> +            return 0;
>> +        else if ( !iommu_hwdom_inclusive || pfn > max_pfn )
>> +            perms =3D 0;
>>      }
>> =20
>>      /* Check that it doesn't overlap with the Interrupt Address Range. =
*/
>>      if ( pfn >=3D 0xfee00 && pfn <=3D 0xfeeff )
>> -        return false;
>> +        return 0;
>>      /* ... or the IO-APIC */
>> -    for ( i =3D 0; has_vioapic(d) && i < d->arch.hvm.nr_vioapics; i++ )
>> -        if ( pfn =3D=3D PFN_DOWN(domain_vioapic(d, i)->base_address) )
>> -            return false;
>> +    if ( has_vioapic(d) )
>> +    {
>> +        for ( i =3D 0; i < d->arch.hvm.nr_vioapics; i++ )
>> +            if ( pfn =3D=3D PFN_DOWN(domain_vioapic(d, i)->base_address=
) )
>> +                return 0;
>> +    }
>> +    else if ( is_pv_domain(d) )
>> +    {
>> +        /*
>> +         * Be consistent with CPU mappings: Dom0 is permitted to establ=
ish r/o
>> +         * ones there, so it should also have such established for IOMM=
Us.
>> +         */
>> +        for ( i =3D 0; i < nr_ioapics; i++ )
>> +            if ( pfn =3D=3D PFN_DOWN(mp_ioapics[i].mpc_apicaddr) )
>> +                return rangeset_contains_singleton(mmio_ro_ranges, pfn)
>> +                       ? IOMMUF_readable : 0;
>=20
> If we really are after consistency with CPU side mappings, we should
> likely take the whole contents of mmio_ro_ranges and d->iomem_caps
> into account, not just the pages belonging to the IO-APIC?
>=20
> There could also be HPET pages mapped as RO for PV.

Hmm. This would be a yet bigger functional change, but indeed would further
improve consistency. But shouldn't we then also establish r/w mappings for
stuff in ->iomem_caps but not in mmio_ro_ranges? This would feel like going
too far ...

Jan


