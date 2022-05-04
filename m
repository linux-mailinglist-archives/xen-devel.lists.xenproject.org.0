Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D2AD6519D55
	for <lists+xen-devel@lfdr.de>; Wed,  4 May 2022 12:51:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.320579.541384 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nmCbW-00031q-Gf; Wed, 04 May 2022 10:51:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 320579.541384; Wed, 04 May 2022 10:51:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nmCbW-000301-Db; Wed, 04 May 2022 10:51:34 +0000
Received: by outflank-mailman (input) for mailman id 320579;
 Wed, 04 May 2022 10:51:32 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=IBxS=VM=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nmCbU-0002ht-Hu
 for xen-devel@lists.xenproject.org; Wed, 04 May 2022 10:51:32 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 27f8e254-cb98-11ec-a406-831a346695d4;
 Wed, 04 May 2022 12:51:31 +0200 (CEST)
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04lp2051.outbound.protection.outlook.com [104.47.14.51]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-3-tcyspo3fOrWWFoVCY0aQVg-1; Wed, 04 May 2022 12:51:28 +0200
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com (2603:10a6:10:2db::16)
 by PAXPR04MB8239.eurprd04.prod.outlook.com (2603:10a6:102:1c2::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5206.24; Wed, 4 May
 2022 10:51:26 +0000
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::5cb0:5195:4203:7c2f]) by DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::5cb0:5195:4203:7c2f%8]) with mapi id 15.20.5206.013; Wed, 4 May 2022
 10:51:26 +0000
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
X-Inumbo-ID: 27f8e254-cb98-11ec-a406-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1651661490;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=IHA+R1CLoSXosdkYvUywhpt8DKBH2xWsyr3b6c/1xvU=;
	b=NSzYc8B6/sA8KqReKPdku9lrGHPcXqmcrak9l/9UAluEip/sO7thWkMLXhMuqMMu3Q7Dig
	jBxR/JoahSzC4QFHfeCfu2K+MNyWfGqta9/S1c0OuMRt4+dshEL1srvsUmO3AONW7D6dS1
	TVqSRtb8xZQEkhVWeKubD+VF/BGCAyM=
X-MC-Unique: tcyspo3fOrWWFoVCY0aQVg-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bgoGVzG0berEc0c6nbj39pTHQ5CIbjTg88dQKp2mAEP1Q32nxDMQCieHx136OoqakbnL0AYtsu9WBSvCol8d48XAL1uIUSUcCkOcWmATkFyCc9araG1452gWDC8KfpNB5KvsR5wLEWWEyLUplMRRmfkuM/5XCHUnLo0CcsLZf8QAQD6Xp7noTkyWNKuU/+adHeXi5D14YTZKiiqkmGrjDivhFlQd74IG64QQld7m+0iD//IkLcDnNuYjIJM3PemovbBhco4ne6l4oIsZeVBgxiNsumnrB8S+5D0OtDzhDeJre7lcIOfae3gjFUA+Md0EDtrI29aBcmlrtC35tFIFFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Qswr8SjRBWKZEizsfbh4whqdiXqN2ADspLgyl7Io1AY=;
 b=hi1t+AmmLtjkjJfaa6n+bAKJL0W/VwYC/MqRJMQW4ORCyuv3xMQDsFKdrvMmOSd4UjmkYIi7t8YWu7/Y6KIMW0oO0s9O5pWX4YnmHm4Wl6eo2Zxg0LzYthxmKoG/v9yty7M+90tfT2jJm9bkYzX3F8WNMXm8EAAi5WdT9ZZ22i1DvOFD0XEZ4nM15gYXfruV8podRh36tQf8c43DdHzrqlxeCdfijQLss4aMcL6tVfdOzrnHLHDAhS48tcQnHBAXE3g7Vm2JNJuUM00rVX3YaD/N+DxMO6Mkr7NqiMoYYRfs8djRTrA0doPtWjr45jKAiHjUAaoPL3v+FL+CxftVVg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <e40d5b56-e52c-34fc-fcfb-ebf136135271@suse.com>
Date: Wed, 4 May 2022 12:51:25 +0200
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
 <6ffd48ee-9356-2f22-415e-03e172eabb55@suse.com>
 <6f45248b-2f49-0834-e801-d298ea680a33@suse.com>
 <YnJV3EYq7E+4ajPN@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <YnJV3EYq7E+4ajPN@Air-de-Roger>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AM6PR0502CA0046.eurprd05.prod.outlook.com
 (2603:10a6:20b:56::23) To DU2PR04MB8616.eurprd04.prod.outlook.com
 (2603:10a6:10:2db::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b07b2e49-2c92-4ecb-d6da-08da2dbc0993
X-MS-TrafficTypeDiagnostic: PAXPR04MB8239:EE_
X-Microsoft-Antispam-PRVS:
	<PAXPR04MB8239C828D0ED6A6CB4C393B9B3C39@PAXPR04MB8239.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	YA6P+FeczFeFTRdWYrH5C+HqDsByWVLDDixHn4aXI587nLgoBWVg7o2Nys0d2R8WCYoc4Ld68wTFecR/PSj13gZiBtY5bRgREf2aU/Asea9S5jhNkew34kFgYDnbDdzq3Rj793Exck6n4MqemdwNy/9QNMcMmFDueip45Kr/Mm0ghouICARads/HubqPjNplwVws/N4ZlpJTFhLA/1sCpW+Kx7C8bEucJAzQo+cMs3v3+KwVScOLFU+WidZ6Cz/78KpKfD+4T+GvhLf8YOtUf3/+uQ8/tvTxXCb6KtjxYfMkgFGfZLLxqpPNrOoHrmpzcJecJS56VZT7CmZHUht3cFfRW5rnpJnVihdmqZ9XBY+4ghJkkAQUL5yix6qCW8KPSNCsLQiCyZeGzvERDyiDT3R5LNUNyrK4YX7YOejsP2HJVgDdZ3AXow9w/AI/32y97D0/LD1FpcUvbzdb8oZozTZ3QBdeqb/SqZYpTEw2EccuMvJbf4nE5+Ui7wFzp9kETI+JIrZ7Y71CFdq/ucK6MH3c5mWKrXTNc9NpKkqQ1l4pUucBcmsad8WttYp9xx/AzzWl3Hb3z2z81YwosQgpK3fEmaTxCPuklsJW7lGFQncNZvEksNH0U5eI2t56YhmG6chxfO3q9syPEkr5EAdc/V/rmAsMCTd7FiMbEygZDF5468rnD4gwsqIsxXgVmow54yuxRSR+V/H5riyO/8xq0+/SDGEH6hY3naSilj2NRuw=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8616.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(6486002)(2906002)(508600001)(316002)(31696002)(86362001)(38100700002)(66556008)(4326008)(66476007)(8676002)(66946007)(8936002)(6916009)(5660300002)(54906003)(186003)(36756003)(6512007)(26005)(2616005)(53546011)(6506007)(83380400001)(31686004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?D+hHbHOYAxIBZKcvz+qcHNoaFqBBpaY+5+Wy3KbRdAqX9qwyQVHi/keElhWk?=
 =?us-ascii?Q?Xtn2cCVWn2COcSu770MK48K5OGg2ZppK+g+ip3dC+0Hd6uXpUYYN4702jvy7?=
 =?us-ascii?Q?E8vytZzJMsjEnj9GodBwcRr4EdXCd9Xwk0U1ZxiBSIkYh5OBC4hDAKQAbEad?=
 =?us-ascii?Q?LkiDTZktETouZZEH3EzeE69/Y2Qp6i1m+dM2Psp6H02GoKugZJxQz5i8zCvO?=
 =?us-ascii?Q?F7TXhI3W5MZlsHmmPOxXl+clLLyig9+200jZHggwhL5AySPRBIxgO1cYivi/?=
 =?us-ascii?Q?eXY81EFHyVS8iGP0v8VYCYZv2FBzvTWQVeiySaMyKRvBn+VSvMxhqWNO/EeG?=
 =?us-ascii?Q?AmoYvT4jMPGTVpFylkTEWVKh57LLA1JSAGnXd1yBQFUtTIaVzyNjstJassvG?=
 =?us-ascii?Q?VJ7h/vcywDNRy2Znaa+LFWsUcG6gszf3PotQGh+Biw4vkTuB7Rjw9jKOVMWN?=
 =?us-ascii?Q?gBQl52Z4qxTIvps5AScMYNFaafU5sv+s0rAXsguZu/XUpQhs1HTZjjT6mBjO?=
 =?us-ascii?Q?9j77Zu078V/Onn6b6XBTVaVbgDsEF7WXS/R6iRuOPXv2LdThZ2cBhcLNYc23?=
 =?us-ascii?Q?EB3YuECTvzlPRmp1tJgx5CRaeYL4Nk0+btI5ym/NPRTnCXQGCYRsMXE9dsql?=
 =?us-ascii?Q?a4BMjEBtsVcZiLbopfV+fSfWxSns4zlhdmtodzZGNWVpL9mPWcH8CwF0d26N?=
 =?us-ascii?Q?d1WLiSrB73POxQAHwuRuHoygHjX9VHtRB8/7Icx8p4k9S3f4UdRQ0R6+eIZg?=
 =?us-ascii?Q?ogkRhZy7Wz1w+Y4HujbATUVxO0/K9DZfjj08CjKM7zBRC/VEjX5YGuIWWbW7?=
 =?us-ascii?Q?wR4hOVszAD2td++tgR24gvhZL9udZGWEwIKP2rj/2Jq0OYc2utcDXmvyOvFW?=
 =?us-ascii?Q?2x46yCaZoTz7sLUZrT58J9BfP1jlMNyqMFh6BWhRYWHhXziYRrVn2SopWVRT?=
 =?us-ascii?Q?ZvhOl1Yq3qobG6zeQTFbIzyHjqOIIG/XYjX6/UZFS+l1tdSKouAG16DI0QwM?=
 =?us-ascii?Q?R4EHsGc2OPv4Bn9l4i7SUHTP9YZkXBv/jeQjgo9XYgm4fJGCuM4p+FodORZ9?=
 =?us-ascii?Q?MUWmXwUa852xwZCPJJNxKdFUFcq7l7EPsv6G+RUfRD6hhT2PHuOeoUOvBTvt?=
 =?us-ascii?Q?VDImAIddQ59rcJVrhmSKQ7N9u2gfXmF3yaChmncuR1uqmlkh94Ufervr27td?=
 =?us-ascii?Q?Tbde++dzIW2NBtiq9kOMkoyLo19f1USGYvtpxKlJkI5skHA0YLdteCAb/ejL?=
 =?us-ascii?Q?vbwtDeB5EutRPgCjjW1C4OXPKS3XQ/kCGG0oHFDozWfxdAshBcuJ+XsUTXE5?=
 =?us-ascii?Q?L0KoEtN8KpWOIclvW3VA/FivHOGjAah/K/81LzPCUhgDu3lleBk22YBatE+k?=
 =?us-ascii?Q?kKNPHl3Zhe7PQeF/bJ1Hf7DO9sVuKZYkGnN1CXQPKY6/AOzips4aWOcMGgEE?=
 =?us-ascii?Q?P6AoWTh3PRDCsvTujoH49C4icHtYmTkOzGEmih5NDbgepUbDA1/bXbAWyvBy?=
 =?us-ascii?Q?lXgCvc/w+XeY2YNJ53zwoe4wN+IryQifBU8z2P4w2YGlEM9RnaGkUG/I1+00?=
 =?us-ascii?Q?pGZ3w0pmbwElVlC3A41YJmlx0EF6xS9jnNVpG4TLmvsAraVWwrVfGnLtRIh0?=
 =?us-ascii?Q?Ef5QgMALe90boS/k9b6Q4AvJwpZGa9n8rEaNeCsS6LYQq2J3v3M5Jgh1ovB6?=
 =?us-ascii?Q?yesd3YwGZ+lGpdu/jj3K7cWKr5Tnci8URODkakdx+CMCgwNmOfckV0iX+yMu?=
 =?us-ascii?Q?nWPzQxY5xQ=3D=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b07b2e49-2c92-4ecb-d6da-08da2dbc0993
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8616.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 May 2022 10:51:26.5537
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tCahlXHNWWGVoXTCy9yI+1b8vi6rQSGMFxpDqOwEeyTqKb4D4IqB7153osyi7dEnykrV1VDe8nixfK+m26ppaw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8239

On 04.05.2022 12:30, Roger Pau Monn=C3=A9 wrote:
> On Wed, May 04, 2022 at 11:32:51AM +0200, Jan Beulich wrote:
>> On 03.05.2022 16:50, Jan Beulich wrote:
>>> On 03.05.2022 15:00, Roger Pau Monn=C3=A9 wrote:
>>>> On Mon, Apr 25, 2022 at 10:34:23AM +0200, Jan Beulich wrote:
>>>>> While already the case for PVH, there's no reason to treat PV
>>>>> differently here, though of course the addresses get taken from anoth=
er
>>>>> source in this case. Except that, to match CPU side mappings, by defa=
ult
>>>>> we permit r/o ones. This then also means we now deal consistently wit=
h
>>>>> IO-APICs whose MMIO is or is not covered by E820 reserved regions.
>>>>>
>>>>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>>>>> ---
>>>>> [integrated] v1: Integrate into series.
>>>>> [standalone] v2: Keep IOMMU mappings in sync with CPU ones.
>>>>>
>>>>> --- a/xen/drivers/passthrough/x86/iommu.c
>>>>> +++ b/xen/drivers/passthrough/x86/iommu.c
>>>>> @@ -275,12 +275,12 @@ void iommu_identity_map_teardown(struct
>>>>>      }
>>>>>  }
>>>>> =20
>>>>> -static bool __hwdom_init hwdom_iommu_map(const struct domain *d,
>>>>> -                                         unsigned long pfn,
>>>>> -                                         unsigned long max_pfn)
>>>>> +static unsigned int __hwdom_init hwdom_iommu_map(const struct domain=
 *d,
>>>>> +                                                 unsigned long pfn,
>>>>> +                                                 unsigned long max_p=
fn)
>>>>>  {
>>>>>      mfn_t mfn =3D _mfn(pfn);
>>>>> -    unsigned int i, type;
>>>>> +    unsigned int i, type, perms =3D IOMMUF_readable | IOMMUF_writabl=
e;
>>>>> =20
>>>>>      /*
>>>>>       * Set up 1:1 mapping for dom0. Default to include only conventi=
onal RAM
>>>>> @@ -289,44 +289,60 @@ static bool __hwdom_init hwdom_iommu_map
>>>>>       * that fall in unusable ranges for PV Dom0.
>>>>>       */
>>>>>      if ( (pfn > max_pfn && !mfn_valid(mfn)) || xen_in_range(pfn) )
>>>>> -        return false;
>>>>> +        return 0;
>>>>> =20
>>>>>      switch ( type =3D page_get_ram_type(mfn) )
>>>>>      {
>>>>>      case RAM_TYPE_UNUSABLE:
>>>>> -        return false;
>>>>> +        return 0;
>>>>> =20
>>>>>      case RAM_TYPE_CONVENTIONAL:
>>>>>          if ( iommu_hwdom_strict )
>>>>> -            return false;
>>>>> +            return 0;
>>>>>          break;
>>>>> =20
>>>>>      default:
>>>>>          if ( type & RAM_TYPE_RESERVED )
>>>>>          {
>>>>>              if ( !iommu_hwdom_inclusive && !iommu_hwdom_reserved )
>>>>> -                return false;
>>>>> +                perms =3D 0;
>>>>>          }
>>>>> -        else if ( is_hvm_domain(d) || !iommu_hwdom_inclusive || pfn =
> max_pfn )
>>>>> -            return false;
>>>>> +        else if ( is_hvm_domain(d) )
>>>>> +            return 0;
>>>>> +        else if ( !iommu_hwdom_inclusive || pfn > max_pfn )
>>>>> +            perms =3D 0;
>>>>>      }
>>>>> =20
>>>>>      /* Check that it doesn't overlap with the Interrupt Address Rang=
e. */
>>>>>      if ( pfn >=3D 0xfee00 && pfn <=3D 0xfeeff )
>>>>> -        return false;
>>>>> +        return 0;
>>>>>      /* ... or the IO-APIC */
>>>>> -    for ( i =3D 0; has_vioapic(d) && i < d->arch.hvm.nr_vioapics; i+=
+ )
>>>>> -        if ( pfn =3D=3D PFN_DOWN(domain_vioapic(d, i)->base_address)=
 )
>>>>> -            return false;
>>>>> +    if ( has_vioapic(d) )
>>>>> +    {
>>>>> +        for ( i =3D 0; i < d->arch.hvm.nr_vioapics; i++ )
>>>>> +            if ( pfn =3D=3D PFN_DOWN(domain_vioapic(d, i)->base_addr=
ess) )
>>>>> +                return 0;
>>>>> +    }
>>>>> +    else if ( is_pv_domain(d) )
>>>>> +    {
>>>>> +        /*
>>>>> +         * Be consistent with CPU mappings: Dom0 is permitted to est=
ablish r/o
>>>>> +         * ones there, so it should also have such established for I=
OMMUs.
>>>>> +         */
>>>>> +        for ( i =3D 0; i < nr_ioapics; i++ )
>>>>> +            if ( pfn =3D=3D PFN_DOWN(mp_ioapics[i].mpc_apicaddr) )
>>>>> +                return rangeset_contains_singleton(mmio_ro_ranges, p=
fn)
>>>>> +                       ? IOMMUF_readable : 0;
>>>>
>>>> If we really are after consistency with CPU side mappings, we should
>>>> likely take the whole contents of mmio_ro_ranges and d->iomem_caps
>>>> into account, not just the pages belonging to the IO-APIC?
>>>>
>>>> There could also be HPET pages mapped as RO for PV.
>>>
>>> Hmm. This would be a yet bigger functional change, but indeed would fur=
ther
>>> improve consistency. But shouldn't we then also establish r/w mappings =
for
>>> stuff in ->iomem_caps but not in mmio_ro_ranges? This would feel like g=
oing
>>> too far ...
>>
>> FTAOD I didn't mean to say that I think such mappings shouldn't be there=
;
>> I have been of the opinion that e.g. I/O directly to/from the linear
>> frame buffer of a graphics device should in principle be permitted. But
>> which specific mappings to put in place can imo not be derived from
>> ->iomem_caps, as we merely subtract certain ranges after initially havin=
g
>> set all bits in it. Besides ranges not mapping any MMIO, even something
>> like the PCI ECAM ranges (parts of which we may also force to r/o, and
>> which we would hence cover here if I followed your suggestion) are
>> questionable in this regard.
>=20
> Right, ->iomem_caps is indeed too wide for our purpose.  What
> about using something like:
>=20
> else if ( is_pv_domain(d) )
> {
>     if ( !iomem_access_permitted(d, pfn, pfn) )
>         return 0;

We can't return 0 here (as RAM pages also make it here when
!iommu_hwdom_strict), so I can at best take this as a vague outline
of what you really mean. And I don't want to rely on RAM pages being
(imo wrongly) represented by set bits in Dom0's iomem_caps.

>     if ( rangeset_contains_singleton(mmio_ro_ranges, pfn) )
>         return IOMMUF_readable;
> }
>=20
> That would get us a bit closer to allowed CPU side mappings, and we
> don't need to special case IO-APIC or HPET addresses as those are
> already added to ->iomem_caps or mmio_ro_ranges respectively by
> dom0_setup_permissions().

This won't fit in a region of code framed by a (split) comment
saying "Check that it doesn't overlap with ...". Hence if anything
I could put something like this further down. Yet even then the
question remains what to do with ranges which pass
iomem_access_permitted() but
- aren't really MMIO,
- are inside MMCFG,
- are otherwise special.

Or did you perhaps mean to suggest something like

else if ( is_pv_domain(d) && iomem_access_permitted(d, pfn, pfn) &&
          rangeset_contains_singleton(mmio_ro_ranges, pfn) )
    return IOMMUF_readable;

? Then there would only remain the question of whether mapping r/o
MMCFG pages is okay (I don't think it is), but that could then be
special-cased similar to what's done further down for vPCI (by not
returning in the "else if", but merely updating "perms").

Jan


