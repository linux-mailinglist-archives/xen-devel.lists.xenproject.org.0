Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 23BC3539DE9
	for <lists+xen-devel@lfdr.de>; Wed,  1 Jun 2022 09:11:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.340259.565246 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nwIUn-00085k-V8; Wed, 01 Jun 2022 07:10:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 340259.565246; Wed, 01 Jun 2022 07:10:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nwIUn-00082S-RA; Wed, 01 Jun 2022 07:10:21 +0000
Received: by outflank-mailman (input) for mailman id 340259;
 Wed, 01 Jun 2022 07:10:20 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Z6G0=WI=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nwIUl-00082M-Rf
 for xen-devel@lists.xenproject.org; Wed, 01 Jun 2022 07:10:20 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e388aa7d-e179-11ec-837f-e5687231ffcc;
 Wed, 01 Jun 2022 09:10:17 +0200 (CEST)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05lp2109.outbound.protection.outlook.com [104.47.17.109]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-15-48F42lHkNu2MmscvYnc9sQ-1; Wed, 01 Jun 2022 09:10:15 +0200
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by HE1PR0401MB2522.eurprd04.prod.outlook.com (2603:10a6:3:85::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5314.13; Wed, 1 Jun
 2022 07:10:12 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::dfa:a64a:432f:e26b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::dfa:a64a:432f:e26b%7]) with mapi id 15.20.5314.012; Wed, 1 Jun 2022
 07:10:12 +0000
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
X-Inumbo-ID: e388aa7d-e179-11ec-837f-e5687231ffcc
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1654067416;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=0/vn2ED/lmZHSy+xmKFBuIZFr4oZAzv/EUr+To+dfdw=;
	b=F+0dTIPrXrtIevoWlfvNq9vPaDucyl4VrsTVUDGu7Opm9MR7nAjAlqQbfjA3t9xeQHLjct
	xyJjOvidgNx1WLaBkfkHiDakBvtlakfphxpmqFbG1rJAGLgWZ8CzdSpv9lONKLctKl6vq7
	WyVHxVQOwICrmbhnwWsRHR23y7htXxg=
X-MC-Unique: 48F42lHkNu2MmscvYnc9sQ-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ly99rhbvyOXaEqKHZ6ltHiVeKaty5tz86ROkQEDeWptadNvcEmqUctYUaPvCqs3eeyygybOCR1SfLKriq6rfsoGMFCVSOqkHj8UtCLTO5mRJxMIH5zjfflL2x9PrpSiMwuyRa3iXtAWYMbbs13KlfO9Cy3syNAP9my2cYPcGMwKQxW2oXVQlftB6sT/6kLBPix80vHH3CKLGo7rRfYB0gUvepZYxe9NLt2o7uTzM5l03NwT4kq88UpdIGhr3QErEt0TxsUHyYq9EOj1Oc4vGmyDRobXj+Yb/Z6FZeI1m9mOTRfNGzVvfLWtSTkq9Y5XnC0SkUwkNHMlrll+9j4LvTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AGvCWGR54srS7h0Urr6RfkCGQ5gQN6PcDE+q4zaskx4=;
 b=VCf8C11vLBvgIFtCo2ulygQgUQRVS58dPizA8UXAk1+mnUTIcfh1e8Nf/C+KWZZdRmlYFH2C5/DH1Zbts1op0uHOZYXN0ki1yPDTinQb5WvTSGTNYnGZlJEzGxerXt8EZStEbrfcMo8s9HgpNqdfJGwV+WBpVESVh8PFAD3QCW5ymX0gSKXdAFzfgJUOBv+JzUQtm1c/n8MAQEauXj+uZq6ZWWCgXYhEWHJ5MFbeD/OTw4tsqM47YQnl3HwOKR05EzWj89tpx9ShapcUNRU+HAt/hTFQEJya/ySp71LlmTvLIc20rpzaG0RzibG5R3UzYsRMVXOBU/Tl9Z7S4CCagQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <e5bc83c8-3962-4d43-4ef1-f338ca2fb782@suse.com>
Date: Wed, 1 Jun 2022 09:10:09 +0200
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
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <YpY/Pm43mMJFGYql@Air-de-Roger>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AS8PR04CA0010.eurprd04.prod.outlook.com
 (2603:10a6:20b:310::15) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b2825051-8673-46b3-9e18-08da439dc4ea
X-MS-TrafficTypeDiagnostic: HE1PR0401MB2522:EE_
X-Microsoft-Antispam-PRVS:
	<HE1PR0401MB2522473EC7CAA009656C7BADB3DF9@HE1PR0401MB2522.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	at51WHrONGdzYtqrgSWdeLnTvXh+pI7zxQJDIyw7yD2DIm+Bsg2tXi22Bj/LbkQhEJKEDa13y/ls6d8FUz1vfwCMKYoJIwK3hK6kvg/tvrKwfcYv+OpSe3iMRdJODTp6X1xRn2vMmqUFIjMGaMC4Cv3PSXKvJ9c+Jm4aaM42/+3K6s44mvXViJYtGvDvQvV6mJfM2cfOoPRSCoHRoBZggx/x3iFA79QMqboFcLNTpHFNGQPAQqWk4xyEdDnr3U8af37ObFCyHl1d99WxTkO4i99UdU9vSLl7oR4m03Ln461s2MuYyR+bY+UZ+l+uBvmEXljYZ6dH83TrEyS0Mv8NZYwz9frYagoObdnJv1p0Jb8k/fQdKnkQXLv1dINh2HV8lC3Hp++mIFMx/VWzmXbPI99HrUnVBMEqZill2nds6Bnu101l+yjGFSZB59R7V2SYtuWR6+zxJsUtmwVcyieEfY4KdYrT79TMUSYzvcqdWz+jeuQRHeDRR1AxZaTHEBA2U7NUEPnd6tGjPqxgjqGlE2LBo85pzxcl7mTV0guffhZY79fUTwVJSV6afk4nwmb1n7hNnCEipVIn9LRphQY6vqq/94B2QnhqyK9u1HgfVvcyejG3DQ3hkbIKwfOt40MVhe2LA4y2mdyr+iLsia9vwgLfJs7cVyxB5b9THJVwFszg12Fsi8djeRBctu9Vb0hdhjJGuVbfwvMlvT1Sxk+iM7knSKkk9QGOoTPUPXRNuPNSXv+ZHT7OM8A0uAoT6ZmW
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(2906002)(31696002)(86362001)(6666004)(8936002)(186003)(38100700002)(6506007)(508600001)(5660300002)(6486002)(2616005)(53546011)(6512007)(26005)(31686004)(66946007)(66556008)(66476007)(4326008)(8676002)(36756003)(316002)(54906003)(6916009)(83380400001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?oE79vqkRR8E9osAbYXws+yRv+tAbP8qNLB/oY1+uKzJeLm8u97G3tgYTBBDK?=
 =?us-ascii?Q?M9zwu2C/cKfMxFtHY2iIpgCWjbnzWCLCT/tOFl4/lFQibor21CwFndXXOsht?=
 =?us-ascii?Q?TYw1Ua8X/VFxFvKaaIXIs/asUkLczKuUp5Ik5+oeiUsaWgv3mxI8k/QX8rP1?=
 =?us-ascii?Q?UIzvh0D+qFek9mP0+M2d2TkRzbNStjw5p75akeScHEZ7Tx1vAEDyO3dJzwqH?=
 =?us-ascii?Q?FMMH3Omuqh0iAofvL1UsoT7BG2ppRfg1TIRb+pZvZghN28r5K3RaJWwJcTPC?=
 =?us-ascii?Q?J3SFGLsz7izT6BHDsUbZ1LfU/k/NbEKFcTOacw7QuVv0Es8s6Bq/Vr+9uFAQ?=
 =?us-ascii?Q?EgoIxOADEzECYabQ0ZWClDMPHexx1Uw1B3ynbTqOWOX2Wy23xcCK6mYs9eEI?=
 =?us-ascii?Q?H7458QrYZxoHqZTMenVwt57rpY9Q5PpJM/u/qORT87ylJWKFSM6HyJQmYjOI?=
 =?us-ascii?Q?IyUdqPQIY7I2dyVRSEEGcpJycvVULk95d2grRPcoW2Om1nXjhizFfPqyXBzb?=
 =?us-ascii?Q?gBFbpiO2qyYyVVjhWHncO5qOa9pzOFMvBDyfRHFV95eCU+XB4lFGhYjwBX3W?=
 =?us-ascii?Q?uC4ZOT9TNmv6wCzN4chIeMg/BRb3KC6xux/flqzbFxhaYzACO2rbTnoVzsSR?=
 =?us-ascii?Q?al6JNnxNtsoFtIxD6oPAA01Dhon7nCgy3wKtkOAUJMXzGHWw6cfqrEo9eiZX?=
 =?us-ascii?Q?izDxas0ZQ9CKF/cLtFFtZX+xAufYilWtFCLFY69hbzQVLLjH3KI6HbXOfZGX?=
 =?us-ascii?Q?DeG3rZJTdSG7kkUagspn5nW4tNrprEOGa7Zv0ghIFY6RN6REWe29FbyQRB7q?=
 =?us-ascii?Q?sLGrCk0RZqtzmyGQo2cJfHBA9x/p+BVIg5w/Sx1efZYvFaIGuHJtf4i5T5Lu?=
 =?us-ascii?Q?xVgDrXi5cV8RVIV5m+icXxel7u/mQFhkWGquthcqiZDN8I/XnTS33k47GslM?=
 =?us-ascii?Q?O1rRZoPFCswOHOcblnBGY51eh5lQ/QJ5LqVvBlTupWx3wdlrrSBM7MVBQ/w+?=
 =?us-ascii?Q?B9KBOOSpF/gFLyGNxRvqIjWxLWe+4n/uxciaywqsLKAO0cc0JJosOjdzoNIq?=
 =?us-ascii?Q?+Ad9+i5JVIr+2DLgCQxcDc7akjob/fIDbNxxH21zm/td9JqFSyhdPmvRCJTt?=
 =?us-ascii?Q?3aZidwuEzOgsDmmP59/QfilzYPYtT2igczW6QX4o2eQJRMLwntJ0wySrIfZ+?=
 =?us-ascii?Q?KlgCBGRn/HMaVN31iy0bozFh1KUWC42xVOk4PB8ze1f46YzXcgMaE050g4Nq?=
 =?us-ascii?Q?arBeSwqD7IPKZ9bXHYVUubOZBXlaX6iC+O3urLvl43+xgnaoCZBMubiLckdf?=
 =?us-ascii?Q?82kqyZvhD1CfOA7VWufM2y1eKu9mEebNsJfMqKWpTb9W4JjBDln+AwWs/Etk?=
 =?us-ascii?Q?qt56mf3E9paX4zP5Q2MCBKTvIQAcUQPRBg8elxC+VvWH2jfcTi9WzOwJ2Wph?=
 =?us-ascii?Q?5Zn3VXkKt3ChZIA+RqtYiq+LkBQja01Tton8YJNGmy12DLziz3SbYcags0Bj?=
 =?us-ascii?Q?wtCI1K+UB0u9tjVXsEZoKeOol+3DOzMskGaQ7/cr/5VeAlxLwGhfsBhLIinz?=
 =?us-ascii?Q?crEv0eF0PLSIE3Qdr8JdQscl31L2VDWv3xCPRFdFwfUoFqgF87eSR3FLrcqu?=
 =?us-ascii?Q?XB7PnSMuRwB55LGoGAs/zaoxht0cakykR0CfuEW3Ko1Jueek7RW2O3FJUjPO?=
 =?us-ascii?Q?Bvxhmcu0KMoh7b+RCVMahyggGmQfvB1ZrBxbHOdac8DQIfK3AJOYriWhNtUP?=
 =?us-ascii?Q?hd3nDy2sMg=3D=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b2825051-8673-46b3-9e18-08da439dc4ea
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jun 2022 07:10:12.0233
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tnZtkBQ4AIpqlcM2zDs1BiOGgKri4CeBEX4mR9vJkw0W9lVqjvhh6k/LhUd0EJnrDe9shTT3dBQQK3eOSsqP2A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR0401MB2522

On 31.05.2022 18:15, Roger Pau Monn=C3=A9 wrote:
> On Tue, May 31, 2022 at 05:40:03PM +0200, Jan Beulich wrote:
>> On 31.05.2022 16:40, Roger Pau Monn=C3=A9 wrote:
>>> On Fri, May 27, 2022 at 01:12:06PM +0200, Jan Beulich wrote:
>>>> @@ -289,44 +290,75 @@ static bool __hwdom_init hwdom_iommu_map
>>>>       * that fall in unusable ranges for PV Dom0.
>>>>       */
>>>>      if ( (pfn > max_pfn && !mfn_valid(mfn)) || xen_in_range(pfn) )
>>>> -        return false;
>>>> +        return 0;
>>>> =20
>>>>      switch ( type =3D page_get_ram_type(mfn) )
>>>>      {
>>>>      case RAM_TYPE_UNUSABLE:
>>>> -        return false;
>>>> +        return 0;
>>>> =20
>>>>      case RAM_TYPE_CONVENTIONAL:
>>>>          if ( iommu_hwdom_strict )
>>>> -            return false;
>>>> +            return 0;
>>>>          break;
>>>> =20
>>>>      default:
>>>>          if ( type & RAM_TYPE_RESERVED )
>>>>          {
>>>>              if ( !iommu_hwdom_inclusive && !iommu_hwdom_reserved )
>>>> -                return false;
>>>> +                perms =3D 0;
>>>>          }
>>>> -        else if ( is_hvm_domain(d) || !iommu_hwdom_inclusive || pfn >=
 max_pfn )
>>>> -            return false;
>>>> +        else if ( is_hvm_domain(d) )
>>>> +            return 0;
>>>> +        else if ( !iommu_hwdom_inclusive || pfn > max_pfn )
>>>> +            perms =3D 0;
>>>>      }
>>>> =20
>>>>      /* Check that it doesn't overlap with the Interrupt Address Range=
. */
>>>>      if ( pfn >=3D 0xfee00 && pfn <=3D 0xfeeff )
>>>> -        return false;
>>>> +        return 0;
>>>>      /* ... or the IO-APIC */
>>>> -    for ( i =3D 0; has_vioapic(d) && i < d->arch.hvm.nr_vioapics; i++=
 )
>>>> -        if ( pfn =3D=3D PFN_DOWN(domain_vioapic(d, i)->base_address) =
)
>>>> -            return false;
>>>> +    if ( has_vioapic(d) )
>>>> +    {
>>>> +        for ( i =3D 0; i < d->arch.hvm.nr_vioapics; i++ )
>>>> +            if ( pfn =3D=3D PFN_DOWN(domain_vioapic(d, i)->base_addre=
ss) )
>>>> +                return 0;
>>>> +    }
>>>> +    else if ( is_pv_domain(d) )
>>>> +    {
>>>> +        /*
>>>> +         * Be consistent with CPU mappings: Dom0 is permitted to esta=
blish r/o
>>>> +         * ones there (also for e.g. HPET in certain cases), so it sh=
ould also
>>>> +         * have such established for IOMMUs.
>>>> +         */
>>>> +        if ( iomem_access_permitted(d, pfn, pfn) &&
>>>> +             rangeset_contains_singleton(mmio_ro_ranges, pfn) )
>>>> +            perms =3D IOMMUF_readable;
>>>> +    }
>>>>      /*
>>>>       * ... or the PCIe MCFG regions.
>>
>> With this comment (which I leave alone) ...
>>
>>>>       * TODO: runtime added MMCFG regions are not checked to make sure=
 they
>>>>       * don't overlap with already mapped regions, thus preventing tra=
pping.
>>>>       */
>>>>      if ( has_vpci(d) && vpci_is_mmcfg_address(d, pfn_to_paddr(pfn)) )
>>>> -        return false;
>>>> +        return 0;
>>>> +    else if ( is_pv_domain(d) )
>>>> +    {
>>>> +        /*
>>>> +         * Don't extend consistency with CPU mappings to PCI MMCFG re=
gions.
>>>> +         * These shouldn't be accessed via DMA by devices.
>>>
>>> Could you expand the comment a bit to explicitly mention the reason
>>> why MMCFG regions shouldn't be accessible from device DMA operations?
>>
>> ... it's hard to tell what I should write here. I'd expect extended
>> reasoning to go there (if anywhere). I'd be okay adjusting the earlier
>> comment, if only I knew what to write. "We don't want them to be
>> accessed that way" seems a little blunt. I could say "Devices have
>> other means to access PCI config space", but this not being said there
>> I took as being implied.
>=20
> But we could likely say the same about IO-APIC or HPET MMIO regions.
> I don't think we expect them to be accessed by devices, yet we provide
> them for coherency with CPU side mappings in the PV case.

As to "say the same" - yes for the first part of my earlier reply, but
no for the latter part.

>> Or else what was the reason to exclude these
>> for PVH Dom0?
>=20
> The reason for PVH is because the config space is (partially) emulated
> for the hardware domain, so we don't allow untrapped access by the CPU
> either.

Hmm, right - there's read emulation there as well, while for PV we
only intercept writes.

So overall should we perhaps permit r/o access to MMCFG for PV? Of
course that would only end up consistent once we adjust mappings
dynamically when MMCFG ranges are put in use (IOW if we can't verify
an MMCFG range is suitably reserved, we'd not find in
mmio_ro_ranges just yet, and hence we still wouldn't have an IOMMU
side mapping even if CPU side mappings are permitted). But for the
patch here it would simply mean dropping some of the code I did add
for v5.

Otherwise, i.e. if the code is to remain as is, I'm afraid I still
wouldn't see what to put usefully in the comment.

Jan


