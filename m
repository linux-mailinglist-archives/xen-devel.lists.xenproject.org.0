Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ED9EA467227
	for <lists+xen-devel@lfdr.de>; Fri,  3 Dec 2021 07:42:24 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.237142.411292 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mt2GW-0000NK-Ac; Fri, 03 Dec 2021 06:41:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 237142.411292; Fri, 03 Dec 2021 06:41:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mt2GW-0000LW-6d; Fri, 03 Dec 2021 06:41:52 +0000
Received: by outflank-mailman (input) for mailman id 237142;
 Fri, 03 Dec 2021 06:41:50 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=EuM9=QU=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1mt2GU-0000LP-9V
 for xen-devel@lists.xenproject.org; Fri, 03 Dec 2021 06:41:50 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 16f8e077-5404-11ec-b1df-f38ee3fbfdf7;
 Fri, 03 Dec 2021 07:41:48 +0100 (CET)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05lp2112.outbound.protection.outlook.com [104.47.17.112]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-29-GfOO8NatOfqKnJUZVhENoA-1; Fri, 03 Dec 2021 07:41:47 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VE1PR04MB6669.eurprd04.prod.outlook.com (2603:10a6:803:125::33)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4734.23; Fri, 3 Dec
 2021 06:41:44 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe%5]) with mapi id 15.20.4734.028; Fri, 3 Dec 2021
 06:41:44 +0000
Received: from [IPV6:2003:ca:b71a:8998:d194:2575:a6a8:6413]
 (2003:ca:b71a:8998:d194:2575:a6a8:6413) by
 AM6P194CA0096.EURP194.PROD.OUTLOOK.COM (2603:10a6:209:8f::37) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4755.11 via Frontend Transport; Fri, 3 Dec 2021 06:41:43 +0000
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
X-Inumbo-ID: 16f8e077-5404-11ec-b1df-f38ee3fbfdf7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1638513708;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Bgd2EIlSJpwXYbDVd+GAtaOdlLwkOLlaCmopKLRT11E=;
	b=ZWU64Ta+art83810+Qnq7qw4roz5+D+G9Ox/bD0edDf0Eio9SHJ04Yodkds7UlkPBgR96+
	rXgsUDkct+yQ5cmV5FGpB23xPxXY/XZvx4Sy9LVeLBccxXYkpWhALfDM0c7XDBXapLi2wG
	NOKLABxin1oB+EEcr1BLeLPINmUgshQ=
X-MC-Unique: GfOO8NatOfqKnJUZVhENoA-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=T1mQHwNNG/SS6ugzI5Xda1cx+7tfMwQltxnMCN8QHRi/TvrA/p8hl2Mu166BY/rnMoKcvpVowSxOc6wYRoTNRmvNL62Fep5sp6zE8FXXJ1rlPsLYGm5HqfemnDxYQneNOFoW1zCv/vRryjbKLeyI4DvIsUlsOtcIkrN+qmCQmtlYzB/UNnYP62HhaM5sBNOblzDELAKsbhkkD1BjkqxgBeC9PseeJtT4XTghx165e6TrhUnd2Yv02Y+grWjhhCkgBMJHhESp19WF5qPnu6Rencc/HG9nP2O08U/B+Wbzq8nZGPA4+p5e4U3fbNz93ROSNwdIA9Z6WLfFFbPeCNOSHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YEC8C36ucthq1KVn9e+D1mZNV5qqS3WzoDe4M8yJiC4=;
 b=MoPaawlA5ne696cd1eMVvMDaRGWiyL35jhcVNPeDv0fZ+IO8ONf+2PNghcrBilxyMda5umtGTucPLWg5whTarabv1/+2tCGJBbtKdew5d6lUwajDJot6G8AU6AATMyz+oiQqHdfLyHX3FzBMSeCFiEzcHnbee4JyHXcTWs6VQ5ntVq8T1J8zjGhFT55eMh9kLNVUFs4JnoC7OETgz24RxXdUMZXitzbhYicJWiNkzQIyHNJ+WMpzS+yxJXjpzzNdvGl7D9sS4UnkSdczR16wjihP0CjD4913fWUS6Syw92ROQuTU0oI0bIKgubBy0eH65/pwdgW/tvdNYC2J+tjwWA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <259bb05d-b227-03e1-1342-a50241c51088@suse.com>
Date: Fri, 3 Dec 2021 07:41:40 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.2
Subject: Re: [PATCH v2 06/18] IOMMU/x86: restrict IO-APIC mappings for PV Dom0
Content-Language: en-US
To: Andrew Cooper <amc96@srcf.net>, Andrew Cooper <andrew.cooper3@citrix.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Paul Durrant <paul@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>
References: <957f067b-9fe1-2350-4266-51982f09d3a9@suse.com>
 <f66b6403-13dd-cb05-7411-20efd7364b08@suse.com>
 <Yac7uLaQ1+YdCqtW@Air-de-Roger>
 <fd5ff1e0-88f0-3fba-4573-b007afdbb3a5@suse.com>
 <YadPLZqfN2pu5SeG@Air-de-Roger>
 <8b2c09f5-1f64-9754-17a4-936f1e496a82@suse.com>
 <YajiQeaPx7KcL0Tw@Air-de-Roger>
 <49991d39-f976-af50-b203-152564fa458e@suse.com>
 <09a1961b-2647-f25e-f028-9e398fa2c83e@srcf.net>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <09a1961b-2647-f25e-f028-9e398fa2c83e@srcf.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AM6P194CA0096.EURP194.PROD.OUTLOOK.COM
 (2603:10a6:209:8f::37) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 71255f5e-2f44-4375-e336-08d9b627f879
X-MS-TrafficTypeDiagnostic: VE1PR04MB6669:
X-Microsoft-Antispam-PRVS:
	<VE1PR04MB6669088CA1011643BA1A571DB36A9@VE1PR04MB6669.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5797;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	u65JvZEgPJVt2q2ch+FtVRCaA2ujEzuzVdfFpstqKRMnBj3vQkXH1R1+EpSAXKd5x/fClT8wkpXKRSoojRYdkvxVQbwjGWO9EE4bFxho3FK1oEHgvfvn8qKy3GSxiaV9Pd+Q8cx2eoO6pInyZ2o0mgAYCJzlpvm4+wEKf6B3qyNFT9LxsfAPNJpaOlRcD2Ls5LVYaRn68p8ga4NbIYIEJdW3/TroQID0TL5OKheJRiEiVDkHYZO8Iyi9UeAPnpmMxxLtFcFIkq9w2tI2rrcObiluXSOy+x85C8ENf98IB7nMz32hKSSQsejp7AQ4EXyWNC5VeKDfDZtzpw++2wZx6nW77Jpjiw1qBc9UOzqukLcdLFtMvy22EpbzZsm9gAOjpONZQaMXeNBU4B+aIwgwi5UDNj0pDqRcRsOzOogsXfro/SykvmngdXodEh8GzEEZR/pCVnFSW/BONeGPBvrG/4wPBrlsEVrew4u3HaN/UIq1JHHxpic2YdX393T4UDzBS6poAf+GFXjGagFz9VKUR0HUaxm54hw1/zosf0wQu0xygue/GkTHyB5H1z/dPUtOTOnrxf51NGavUC+TUgxqvITx+wpWNF9g2lworRxkNr2pad0sXwfBYh2bvRqhKslkbonxB0ScMoyw8UypCN+UjE03kb03jroQWl87VFUBQMGcQAggWAJ0voJQpKbIuQ9TXa3U44sBHDe9WcsH4OrlKpegv+Ic7h5MNYtbEBtaUfQ=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(508600001)(38100700002)(66946007)(8676002)(31696002)(86362001)(6486002)(53546011)(110136005)(66556008)(66476007)(2906002)(54906003)(83380400001)(36756003)(4326008)(316002)(31686004)(186003)(2616005)(8936002)(5660300002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?UYOeB22lrl1+QennLpUKgVujXqjX7IwMrN681fDhziKWUy4NBfD8LHyQuBMT?=
 =?us-ascii?Q?tFwzXDi1snVrlOn5CctxA/3GLb+V2fscTfuTU7SM4Y/9jX3f2tMkKSse/zRo?=
 =?us-ascii?Q?Bsf52PTb32TIh4fHlxwHrMhOAWThNfdfGNXHByvQKmyxRkYLXoenQd0WfIz0?=
 =?us-ascii?Q?WP3h661neHBTPFkWhui7cJLLdDS0xheumvCdI/QfyJ5g0cs1qHVpJzLPqJYf?=
 =?us-ascii?Q?8ztHdABYXexWyLlak6BVvQVyScjfN/ufFdRo8JH7BoSwiZuRAQSvC19KXAy6?=
 =?us-ascii?Q?Y7xv52W+SLxkAqWK3GntZ1I2YwX5gH59qW1OklfirtLxzAKvPCw+FzwNPOJ3?=
 =?us-ascii?Q?WWZFa1/tiQAFraj4TclYn1xn/p/UJEJ6sY7Aje2DeefePpX9XBHxv9fT0YCB?=
 =?us-ascii?Q?sKeGR6iPALdLWNrt+5uVcTfK2KzWy+DAoZx7A1S0950lBhUFTWjLvOCu/4O8?=
 =?us-ascii?Q?Qx7qUOQW6giMolRJN961Zq3GDNBFfphexKTICWUI6RErI+QlYgxZqBhzvLlr?=
 =?us-ascii?Q?js7CWNOaw7dONqHykxwVAFM0Tzi164CTSi5MU8Hsi5u4zYbUllV9NzBhSu0R?=
 =?us-ascii?Q?truBWAs21W2Y9yBOghesdrSfOi5NbabAQiUON9eeECkHgGTgtK3HI7gdb7Md?=
 =?us-ascii?Q?spaoUZGSsbzdboip3k6PsXBuiIS0kTzptAvCsfZlYCYoPsjpXo6r18XL4Y2k?=
 =?us-ascii?Q?UnGuxzboqgprNZJA+AK5mkcSiakUm2FLiaIWwn2MJ9hBSFodmlazA40D1nmL?=
 =?us-ascii?Q?lMYZM2jOihZD2YMZgLGKVSRKck02huhgfhmVlxHhOVJD3CEMpcOGX598YmEm?=
 =?us-ascii?Q?w0mKtBhcDHEWy4E+4RgfoMEiCD0anSW7gCnv8d39cdbyL9EL8DZuteTuogXD?=
 =?us-ascii?Q?DuCjBLAZ11OtBl+C4mrRKimXj33POU2XEN/59sAaXLHmLVl1BEVHxdBlOctm?=
 =?us-ascii?Q?BwdFReHA87a6Vfwy6a/vbMiDzHM7HBkuj6LqbqG0xTM3wRfN/xHm6u/vp7cg?=
 =?us-ascii?Q?j6H68FbGntLm4ZVnR6UoSi/M0/02mTytzwWXv9eb8f4jPqiQ7AphAkYBWy8u?=
 =?us-ascii?Q?gEmBUV6ah4vvsCsSYcsE0ICerEtgPWkfapN2dsyOpk7mmumCb5rBDWQxvBf7?=
 =?us-ascii?Q?YvDWhMrqz+hk8BF+rQnx+kymEtUDfTq2Bdj+ASb7C83+5DF75xU/y9yETX8U?=
 =?us-ascii?Q?6q5VWqtNfkjsjPcBxhFglbPGsCTklIxzOgP7ER12Yl0o2ayEHAsXO8JJwKDL?=
 =?us-ascii?Q?GlVFWpn8p7RAuRTEMVBblf+Jscks+WkzNw90D1l9UfDLrUdaizIAGNo3vs50?=
 =?us-ascii?Q?B/eHkAFdeayxsKibS+C0nw3qROptKIo2uGeKCNtE8Y51+HlKNcNUAHCNb/km?=
 =?us-ascii?Q?qHeNnmP7IiT5x67tfVRDc+K1tXhNEBaFL4hVokspLqtEycP99FJ8l2439rwz?=
 =?us-ascii?Q?mrn1WoaU7jp3pEGvLNz7TeAae2xNcb4Agbmfu1oEZn5X6esphfaviFtUvvQV?=
 =?us-ascii?Q?pVJcA4P1wpH5d8I+waEkaqSeMfs59RvepZOrqs85ETYiw/5AFNFtPRl2aA9R?=
 =?us-ascii?Q?rS74xDhSt1B6cBD423BfCZxWCZmnMDUm7ds2mXZBTdErcDVyMB2r/gXv2g8q?=
 =?us-ascii?Q?ihWqSTjZKKCd9EmPpLxnMfQ+fa1IxYAcfRfolMPGAFyaQWi9v7+KMcUyDVez?=
 =?us-ascii?Q?fp6hi+4XDR4TMIj9Nf915isi+sY=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 71255f5e-2f44-4375-e336-08d9b627f879
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Dec 2021 06:41:44.2580
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: URYljO/yPN85FlC16y6bMtJBAJ/BBZ/2XT64RPWG+Ypro8eUj7Yv4FvGuPdiEWmvEhm9DXL5TApH3Q7t271RIA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB6669

On 02.12.2021 20:16, Andrew Cooper wrote:
> On 02/12/2021 15:28, Jan Beulich wrote:
>> On 02.12.2021 16:12, Roger Pau Monn=C3=A9 wrote:
>>> On Wed, Dec 01, 2021 at 12:45:12PM +0100, Jan Beulich wrote:
>>>> On 01.12.2021 11:32, Roger Pau Monn=C3=A9 wrote:
>>>>> On Wed, Dec 01, 2021 at 10:27:21AM +0100, Jan Beulich wrote:
>>>>>> On 01.12.2021 10:09, Roger Pau Monn=C3=A9 wrote:
>>>>>>> On Fri, Sep 24, 2021 at 11:46:57AM +0200, Jan Beulich wrote:
>>>>>>>> @@ -267,44 +267,60 @@ static bool __hwdom_init hwdom_iommu_map
>>>>>>>>       * that fall in unusable ranges for PV Dom0.
>>>>>>>>       */
>>>>>>>>      if ( (pfn > max_pfn && !mfn_valid(mfn)) || xen_in_range(pfn) =
)
>>>>>>>> -        return false;
>>>>>>>> +        return 0;
>>>>>>>> =20
>>>>>>>>      switch ( type =3D page_get_ram_type(mfn) )
>>>>>>>>      {
>>>>>>>>      case RAM_TYPE_UNUSABLE:
>>>>>>>> -        return false;
>>>>>>>> +        return 0;
>>>>>>>> =20
>>>>>>>>      case RAM_TYPE_CONVENTIONAL:
>>>>>>>>          if ( iommu_hwdom_strict )
>>>>>>>> -            return false;
>>>>>>>> +            return 0;
>>>>>>>>          break;
>>>>>>>> =20
>>>>>>>>      default:
>>>>>>>>          if ( type & RAM_TYPE_RESERVED )
>>>>>>>>          {
>>>>>>>>              if ( !iommu_hwdom_inclusive && !iommu_hwdom_reserved =
)
>>>>>>>> -                return false;
>>>>>>>> +                perms =3D 0;
>>>>>>>>          }
>>>>>>>> -        else if ( is_hvm_domain(d) || !iommu_hwdom_inclusive || p=
fn > max_pfn )
>>>>>>>> -            return false;
>>>>>>>> +        else if ( is_hvm_domain(d) )
>>>>>>>> +            return 0;
>>>>>>>> +        else if ( !iommu_hwdom_inclusive || pfn > max_pfn )
>>>>>>>> +            perms =3D 0;
>>>>>>> I'm confused about the reason to set perms =3D 0 instead of just
>>>>>>> returning here. AFAICT perms won't be set to any other value below,
>>>>>>> so you might as well just return 0.
>>>>>> This is so that ...
>>>>>>
>>>>>>>>      }
>>>>>>>> =20
>>>>>>>>      /* Check that it doesn't overlap with the Interrupt Address R=
ange. */
>>>>>>>>      if ( pfn >=3D 0xfee00 && pfn <=3D 0xfeeff )
>>>>>>>> -        return false;
>>>>>>>> +        return 0;
>>>>>>>>      /* ... or the IO-APIC */
>>>>>>>> -    for ( i =3D 0; has_vioapic(d) && i < d->arch.hvm.nr_vioapics;=
 i++ )
>>>>>>>> -        if ( pfn =3D=3D PFN_DOWN(domain_vioapic(d, i)->base_addre=
ss) )
>>>>>>>> -            return false;
>>>>>>>> +    if ( has_vioapic(d) )
>>>>>>>> +    {
>>>>>>>> +        for ( i =3D 0; i < d->arch.hvm.nr_vioapics; i++ )
>>>>>>>> +            if ( pfn =3D=3D PFN_DOWN(domain_vioapic(d, i)->base_a=
ddress) )
>>>>>>>> +                return 0;
>>>>>>>> +    }
>>>>>>>> +    else if ( is_pv_domain(d) )
>>>>>>>> +    {
>>>>>>>> +        /*
>>>>>>>> +         * Be consistent with CPU mappings: Dom0 is permitted to =
establish r/o
>>>>>>>> +         * ones there, so it should also have such established fo=
r IOMMUs.
>>>>>>>> +         */
>>>>>>>> +        for ( i =3D 0; i < nr_ioapics; i++ )
>>>>>>>> +            if ( pfn =3D=3D PFN_DOWN(mp_ioapics[i].mpc_apicaddr) =
)
>>>>>>>> +                return rangeset_contains_singleton(mmio_ro_ranges=
, pfn)
>>>>>>>> +                       ? IOMMUF_readable : 0;
>>>>>>>> +    }
>>>>>> ... this return, as per the comment, takes precedence over returning
>>>>>> zero.
>>>>> I see. This is because you want to map those in the IOMMU page tables
>>>>> even if the IO-APIC ranges are outside of a reserved region.
>>>>>
>>>>> I have to admit this is kind of weird, because the purpose of this
>>>>> function is to add mappings for all memory below 4G, and/or for all
>>>>> reserved regions.
>>>> Well, that was what it started out as. The purpose here is to be consi=
stent
>>>> about IO-APICs: Either have them all mapped, or none of them. Since we=
 map
>>>> them in the CPU page tables and since Andrew asked for the two mapping=
s to
>>>> be consistent, this is the only way to satisfy the requests. Personall=
y I'd
>>>> be okay with not mapping IO-APICs here (but then regardless of whether=
 they
>>>> are covered by a reserved region).
>>> I'm unsure of the best way to deal with this, it seems like both
>>> the CPU and the IOMMU page tables would never be equal for PV dom0,
>>> because we have no intention to map the MSI-X tables in RO mode in the
>>> IOMMU page tables.
>>>
>>> I'm not really opposed to having the IO-APIC mapped RO in the IOMMU
>>> page tables, but I also don't see much benefit of doing it unless we
>>> have a user-case for it. The IO-APIC handling in PV is already
>>> different from native, so I would be fine if we add a comment noting
>>> that while the IO-APIC is mappable to the CPU page tables as RO it's
>>> not present in the IOMMU page tables (and then adjust hwdom_iommu_map
>>> to prevent it's mapping).
>> Andrew, you did request both mappings to get in sync - thoughts?
>=20
> Lets step back to first principles.
>=20
> On real hardware, there is no such thing as read-only-ness of the
> physical address space.=C2=A0 Anything like that is a device which accept=
s
> and discards writes.
>=20
> It's not clear what a real hardware platform would do in this scenario,
> but from reading some of the platform docs, I suspect the System Address
> Decoder would provide a symmetric view of the hardware address space,
> but this doesn't mean that UBOX would tolerate memory accesses uniformly
> from all sources.=C2=A0 Also, there's nothing to say that all platforms
> behave the same.
>=20
>=20
> For HVM with shared-pt, the CPU and IOMMU mappings really are
> identical.=C2=A0 The IOMMU really will get a read-only mapping of real MM=
CFG,
> and holes for fully-emulated devices, which would suffer a IOMMU fault
> if targetted.
>=20
> For HVM without shared-pt, the translations are mostly kept in sync, but
> the permissions in the CPU mappings may be reduced for e.g. logdirty
> reasons.
>=20
> For PV guests, things are mostly like the HVM shared-pt case, except
> we've got the real IO-APICs mapped read-only, and no fully-emulated devic=
es.
>=20
>=20
> Putting the real IO-APICs in the IOMMU is about as short sighted as
> letting the PV guest see them to begin with, but there is nothing
> fundamentally wrong with letting a PV guest do a DMA read of the
> IO-APIC, seeing as we let it do a CPU read.=C2=A0 (And whether the platfo=
rm
> will even allow it, is a different matter.)
>=20
>=20
> However, it is really important for there to not be a load of special
> casing (all undocumented, naturally) keeping the CPU and IOMMU views
> different.=C2=A0 It is an error that the views were ever different
> (translation wise), and the only legitimate permission difference I can
> think of is to support logdirty mode for migration.=C2=A0 (Introspection
> protection for device-enabled VMs will be left as an exercise to
> whomever first wants to use it.)
>=20
> Making the guest physical address space view consistent between the CPU
> and device is a "because its obviously the correct thing to do" issue.=C2=
=A0
> Deciding "well it makes no sense for you to have an IO mapping of $FOO"
> is a matter of policy that Xen has no legitimate right to be enforcing.

To summarize: You continue to think it's better to map the IO-APICs r/o
also in the IOMMU, despite there not being any practical need for these
mappings (the CPU ones get permitted as a workaround only, after all).
Please correct me if that's a wrong understanding of your reply. And I
take it that you're aware that CPU mappings get inserted only upon Dom0's
request, whereas IOMMU mappings get created once during boot (the
inconsistent form of which had been present prior to this patch).

Any decision here would then imo also want to apply to e.g. the HPET
region, which we have a mode for where Dom0 can map it r/o. And the
MSI-X tables and PBAs (which get dynamically entered into mmio_ro_ranges).

Jan


