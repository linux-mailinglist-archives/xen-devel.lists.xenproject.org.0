Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D7B1539427
	for <lists+xen-devel@lfdr.de>; Tue, 31 May 2022 17:40:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.339819.564725 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nw3yf-0002Eh-5q; Tue, 31 May 2022 15:40:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 339819.564725; Tue, 31 May 2022 15:40:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nw3yf-0002C0-2o; Tue, 31 May 2022 15:40:13 +0000
Received: by outflank-mailman (input) for mailman id 339819;
 Tue, 31 May 2022 15:40:11 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=B8C5=WH=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nw3yd-0002Bu-HM
 for xen-devel@lists.xenproject.org; Tue, 31 May 2022 15:40:11 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f43aa6fd-e0f7-11ec-837f-e5687231ffcc;
 Tue, 31 May 2022 17:40:10 +0200 (CEST)
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04lp2050.outbound.protection.outlook.com [104.47.12.50]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-43-UG1w__QZOhSNoXeAGfW0kg-1; Tue, 31 May 2022 17:40:07 +0200
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM0PR0402MB3843.eurprd04.prod.outlook.com (2603:10a6:208:12::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5293.19; Tue, 31 May
 2022 15:40:06 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::dfa:a64a:432f:e26b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::dfa:a64a:432f:e26b%7]) with mapi id 15.20.5293.019; Tue, 31 May 2022
 15:40:05 +0000
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
X-Inumbo-ID: f43aa6fd-e0f7-11ec-837f-e5687231ffcc
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1654011610;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ZFGT0bpgc4mcISyhFAvxLZl2rXWqtez4FRysOjQtK9s=;
	b=emUTFxWH7COd1TFRaozItxYTapngziTmS+96EYApqKewRzrg4GFOeS2WWFxBantaopLrrB
	ws3ewK6E3xmaki5ao/jjmOEexmCt00A8Ask3FTJol6z6O6tS6Vr64vWPVhAdfBa4W4b+tG
	GpYSCGU2DfQv34PlRti9Qzhu01DCSaY=
X-MC-Unique: UG1w__QZOhSNoXeAGfW0kg-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HR+OBMvvbIfgohbkHci23Y8qYwz7OkQFYkFlKEnbz+ZFAInQlr7c8hbooTkWTb/bMEHOhUGYsmCzrwZAlj+IRqFeHlio9yHIE49kabTuv6uYk3qp9sIWbscg4Ih6aEPZJvnkXuTrmHDoJBi6d5g59AsPnK7A0G6PGLCl8UufWQXM/vel25R+zKGY/zm2v9qphr0gJpnlTwOlmTwNc1O5Vr7K4Gsl39kJn+PbjhlCJWSUiudUrTBYPjYSJwiLIEeFK0GpeusJGUxFvNhO4mJav047TCrZlqI25ToqGYbRJ/pN4l/ZgIpA1SCzp1EGapa9/7U8MuUsZ3UJBbFMPyHEuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iXxV7bJ6vjyzQILnL6lUhIakTT67DbLkDsIxoJtck5s=;
 b=JgJ8cRDOqYS34XyRdMf4Qtnw6PPQYEv7zERc9OkDd/4KM6fmBWQCMnz1XCX48N04aTGk9sWYT0G9gIZ3Qc1WcJMsmOJEClgRJKWBHaFgzJyBOfzrEsNkkP+ZWRNrl+2QpY9rr3eB5MvMhm+9V0MOee8At3gdjO02nV0zEJE9HmmOJ3HRmAWc5V7GJSFleHcLGlyO0ViZ4AMin4ncTTCC4wPBBm51QNX0dlXrw40kXrOB4MSX9AaWhvxD4qEsYeD10WLBqmoTldzw2WZZbeOY0AV96Vc0t/Tk8zonHFBqYerOPkLRO8AOfCJcWUiMxIxXyTyBehj8IkavZN8/DmMVHw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <22d2f071-4046-52c6-6f11-23fb23fb61c1@suse.com>
Date: Tue, 31 May 2022 17:40:03 +0200
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
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <YpYozCRkfs1KdBus@Air-de-Roger>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AS8PR04CA0085.eurprd04.prod.outlook.com
 (2603:10a6:20b:313::30) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 846b18c2-2e07-4712-1693-08da431bd5df
X-MS-TrafficTypeDiagnostic: AM0PR0402MB3843:EE_
X-Microsoft-Antispam-PRVS:
	<AM0PR0402MB38430B35987A7E83282029E1B3DC9@AM0PR0402MB3843.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	gObI+APLp8ZE9mHLGUROT4FbYQ4GK+2s+MzgYNbBS0YbF81zq8Xmb6aMrN40ZiY8E3+w/+yDnKyaqV+R/NnurNWmq/em6a8KsCzRF2rICnke+pzBqIDFmAcyRxB5wEHn0CDU8DXgzW8P+9Gi+7lBFbityksajgaXq5UbSFDt8GCfkEZhT73gqxloAXkwLa7VdRj/dZXAWqkIVk8ldadB7cONofDSW9TG97+yiiVrNb00aRiV2V10DW8Wb878nPS9neYGOncke5XpMP5aU75KGCdSN8L0L5XHr17kAvwlOZaLrZDA+suwFCKOmZEJIhxli1i0kxPRn+r/08BBuYTSgrthvM+w5wMm0xkaH7mgNVeRwZwcA8j1+SxrEpaafS04qZhKGCSARlVi6gu+5xtfbD2nNk2ga9JCfGyd4prbAZefEBkVeUF5coDL/RgbSbuSv9OuVRm9uR5ciUvhVjUcAJhG4J6NcK2+3Qaa9+OQKJs8Z9PsFVm51feaag+gJNVNO0Yhp27vb22mtr1S5DUqLwFO9GmCe70ROoJ3fpK8HvrY6LdqoaqJSS3f/I1p+ioi5pYnnGcq6mHLDHdAQlmQ6Sp3tIr/mkjqldUwGf4Q7SLYxhhz86wZwOs3piZM97waEK6FfAt63UUEp7VTBTogzY9QwlG6EC4MBw8Tr9WQdHXzYzpfNFmjFiwVW7nzspGaypour2hVxLUEY/NfhuUjNoUqQAXlrkEv0XQrkYjyRMU=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(8936002)(6506007)(5660300002)(4326008)(83380400001)(26005)(31686004)(8676002)(2906002)(66946007)(66556008)(53546011)(66476007)(6512007)(6486002)(38100700002)(31696002)(508600001)(36756003)(6916009)(316002)(86362001)(54906003)(186003)(2616005)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?ZHZISIVLUxHxniY6200fwiQyRRL/2diBDqTbKS6X2MNI129mPVDQpbMoMDGY?=
 =?us-ascii?Q?F3pLKXPBzwrbFGo4lx8/rlc+ylUfspoEo1ughkTxOsTeDtw2Q8Nfz2xq7HWW?=
 =?us-ascii?Q?v+aZPMwW5Xcs9d6k7Snj27FokKL0+i6WYaQjLpvp3Mc59lCDkkpqfgt0qlXS?=
 =?us-ascii?Q?jK155thz2UjwgmrwGVnJDENF7eqeCw5TvnV9A73xXyRjtH96SYkIBcDOYu5k?=
 =?us-ascii?Q?DJcylc5r7kG+ovkP77i7dL9Tek20U6y7O32YQ93bXzhYwxLNf+IRf4oenqe/?=
 =?us-ascii?Q?3Cv6SVGrdR3FHKZRzrQpLZjhsoDPkDZONedLvi2jxyxFAX/dsHizo5+llnJ2?=
 =?us-ascii?Q?AkMcl/vY6K4QIcgF7iTi+CngnBhCda9oWtmCArlrP2+mHjL3Y/xXL2dKQ9UI?=
 =?us-ascii?Q?Fchqc/0DhvwkEakxbY8229SLAf6seCd1OR2bsr4S0uMaMn29w+XJnGXLg4yF?=
 =?us-ascii?Q?tnALyO/ALh8iffDNssSPbuDIE6QXBLXdmWBWZTKKZ5oFQQ3nefBdcQtC/qdF?=
 =?us-ascii?Q?64l+ih0BcZf2hDctrDYVmMdjCCqUltFzi0Zdjw16jXimGNqaGue4WJ+ofU8O?=
 =?us-ascii?Q?7W20FD8kjqzmO3RNcFy8jWs8sJEgLkUzt+YNK6GLIatKHgSOBVuTMNOuuAfw?=
 =?us-ascii?Q?W5bXmzRSNH1wZ1S86BFcqppXQ3EMQ3oK4/Yl9cqJOkOxe8LLaL2V3UDkhYn0?=
 =?us-ascii?Q?A8qm9RQB9fqV+g5skxrnoQuV88KLzyS3ASD3LHrHgZEHJfyslKGys6xN3NVe?=
 =?us-ascii?Q?9s0Hd6qHeCZv34PDXHVMByursRtxJ+A80oFupmO0icImsZq+cV10bQf0Azk2?=
 =?us-ascii?Q?h1522uy3q+96LB/+A2LgBNQ+767ETcVBNfa+x/ikNUDz9/yn+TH/6IcmLVqI?=
 =?us-ascii?Q?CfCFbOOGLBiGHnzHk3MVfLFHm/Za5iv49jwCWqDrOyQeyzLdVJZpkzuD6wsL?=
 =?us-ascii?Q?hFvN+fSmqWToXNfk4icb48TB6rhJkB5JbiLysRego+TjRXgv2iAmcRr2NVPe?=
 =?us-ascii?Q?0MWDrhLPGo9/MypKaYYfWkQWrZPXCbaFhnxqvsHzK5iCFe1mRbgbhD0OyvcW?=
 =?us-ascii?Q?dhZlcF5l90WtMovA7iiFyFFkDsTkA50qv5XuuSf9EOU4nHuB5d3FWObNWKhx?=
 =?us-ascii?Q?oK9ydCWvcv+0Rb5THFTMHhX1CF0+bSWEhZAfvnsX9Llayclk6/80y0ZmiuMV?=
 =?us-ascii?Q?Pci8Z67Jec6Wq6VHMhalECEs90rxxiRCx/ZhfbCcwPCi7EvejdKu/4/ZJyGR?=
 =?us-ascii?Q?BL9LkSlA2/l2rcr0BxQADsvUMh0mEWoDtsEb8usdVn3RfmRwsrVgPKy7Oyj0?=
 =?us-ascii?Q?QQD6q/ByPYo/IiSgOwnROVK+AlCG7rw8CzsKxrFSOi8B1ukncG3QXYBN0v9A?=
 =?us-ascii?Q?z7UTNhrJkZfZQfdGEUew5yCskZ5o0SMMB/lFvBNcBcCAFJy7VJvzTpOrEKbw?=
 =?us-ascii?Q?1AAy9LfNW4A1ejU7NCD744HFtIyg/2XCSHD66KE2w+TmcOqc8S3SnG4F8PHQ?=
 =?us-ascii?Q?xNM4TmTm79gFqep6FiQwERIwNWcwtTQmRKIM4uwlh/dBCZDEqR/tb9AUDZUQ?=
 =?us-ascii?Q?/f3UflwCCT78V6ytOdFrgSUXgX4tT0GgiZl+KydkIYXQMJwXQo94HKjXClhM?=
 =?us-ascii?Q?qXjBipjytxhJ51+C/4aaYcPhcmMby/z5YXzdTi26PfkbsHwUdjS1qGMtma/e?=
 =?us-ascii?Q?MyXLNflM5lSfvkf+tLKgi33nFINdfDfeTFdcHvipL5Jpop8WUiY2N7miY9ij?=
 =?us-ascii?Q?fxDP0nGMTg=3D=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 846b18c2-2e07-4712-1693-08da431bd5df
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 May 2022 15:40:05.8629
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hAq6hW1HyfaVf4I8iQFt8/ItlVFtRQSA7alagxaxF0fgItD0dksJYgYHnuxsEIK7BKw8yjHMFtnYXDy1uVxbEg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR0402MB3843

On 31.05.2022 16:40, Roger Pau Monn=C3=A9 wrote:
> On Fri, May 27, 2022 at 01:12:06PM +0200, Jan Beulich wrote:
>> While already the case for PVH, there's no reason to treat PV
>> differently here, though of course the addresses get taken from another
>> source in this case. Except that, to match CPU side mappings, by default
>> we permit r/o ones. This then also means we now deal consistently with
>> IO-APICs whose MMIO is or is not covered by E820 reserved regions.
>>
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>=20
> Reviewed-by: Roger Pau Monn=C3=A9 <roger.pau@citrix.com>

Thanks.

>> @@ -289,44 +290,75 @@ static bool __hwdom_init hwdom_iommu_map
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
>> +         * ones there (also for e.g. HPET in certain cases), so it shou=
ld also
>> +         * have such established for IOMMUs.
>> +         */
>> +        if ( iomem_access_permitted(d, pfn, pfn) &&
>> +             rangeset_contains_singleton(mmio_ro_ranges, pfn) )
>> +            perms =3D IOMMUF_readable;
>> +    }
>>      /*
>>       * ... or the PCIe MCFG regions.

With this comment (which I leave alone) ...

>>       * TODO: runtime added MMCFG regions are not checked to make sure t=
hey
>>       * don't overlap with already mapped regions, thus preventing trapp=
ing.
>>       */
>>      if ( has_vpci(d) && vpci_is_mmcfg_address(d, pfn_to_paddr(pfn)) )
>> -        return false;
>> +        return 0;
>> +    else if ( is_pv_domain(d) )
>> +    {
>> +        /*
>> +         * Don't extend consistency with CPU mappings to PCI MMCFG regi=
ons.
>> +         * These shouldn't be accessed via DMA by devices.
>=20
> Could you expand the comment a bit to explicitly mention the reason
> why MMCFG regions shouldn't be accessible from device DMA operations?

... it's hard to tell what I should write here. I'd expect extended
reasoning to go there (if anywhere). I'd be okay adjusting the earlier
comment, if only I knew what to write. "We don't want them to be
accessed that way" seems a little blunt. I could say "Devices have
other means to access PCI config space", but this not being said there
I took as being implied. Or else what was the reason to exclude these
for PVH Dom0?

Jan


