Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F108D477665
	for <lists+xen-devel@lfdr.de>; Thu, 16 Dec 2021 16:54:42 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.248055.427823 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mxt5Q-0003j7-3J; Thu, 16 Dec 2021 15:54:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 248055.427823; Thu, 16 Dec 2021 15:54:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mxt5P-0003fg-Vc; Thu, 16 Dec 2021 15:54:27 +0000
Received: by outflank-mailman (input) for mailman id 248055;
 Thu, 16 Dec 2021 15:54:26 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=VxGf=RB=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1mxt5O-0003fX-3v
 for xen-devel@lists.xenproject.org; Thu, 16 Dec 2021 15:54:26 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 711da740-5e88-11ec-9e60-abaf8a552007;
 Thu, 16 Dec 2021 16:54:25 +0100 (CET)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05lp2112.outbound.protection.outlook.com [104.47.18.112]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-5-4wkPwgemNEKDhlmW7MGbFg-2; Thu, 16 Dec 2021 16:54:23 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB5168.eurprd04.prod.outlook.com (2603:10a6:803:56::33)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4778.18; Thu, 16 Dec
 2021 15:54:21 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe%6]) with mapi id 15.20.4778.018; Thu, 16 Dec 2021
 15:54:21 +0000
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
X-Inumbo-ID: 711da740-5e88-11ec-9e60-abaf8a552007
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1639670064;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=EAekPYbp9sH2QX5o7Ez5afHWt/ZrWPM/Zx0fWwm3C24=;
	b=XVlBmqfTsIJ7Nhztg2VVZ5VMsHU1Uk0eA6T0wd5/QhJKQtELZ6k3RPEGgwle5J1sOY5mND
	oIDLJUpMUbC5bzM4ufc1F1RJ3R7ssrZryPKvobscE5QsM+uQJkPacVNghL8uWZUEgog9Ng
	xoSH8oJvR7iUK5dQtLP2C17cXmmicwc=
X-MC-Unique: 4wkPwgemNEKDhlmW7MGbFg-2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ByVTBbdTT04RIZkR7YsM4oSymkybQu6dgl8Byh9x7yOcXk/X0DdEJTqbcZvyhlKKhfzpUjiLL7IENvo4jXNn2mzvxNCH4OXoLv8levCdHFLNyg5TuPXjo8LaVg0sSyZHPNeR5w/nf5ae8in8PzRSZTO8d2PMOOHDj9hRhhj+tAihTukISq8a3RbRq1kjIqVVGL2GHoXK6bPPYQe1BfKUhsxrTUBYHjKMkCft+o2zmjdw7+qfsqwEA6wz4b2IyDKrVNJ3ggJI3c7YU+UWFLfIT4l0r5Pz/+fd0Qft/unqgJt/RjszX5RiQRFogJetSSYtac0GY09Ij4Ei7RjGy24R5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kolHVCKRISc55qMUa98tPsqjb33uk16OcDO37vM/GuY=;
 b=RiwoAiNy9orVKZzZycPsO8a4B9b4MbLnS9BO31JwRaKS+WDwIRhyOcO6w2X6K+IB5eRB8fa0kX0URhWXBfNDZ77eIlvblWcplmjIRnHg61Hudq2TSknirbeVZXAjPPDhdTlJcmiTDsOCsJOetPEQJsR6fU4BBZLRC8/by4JHXeEIUHS1WVeiAgrBhhQ0uBKMnvFLIApbLXOgKDXhfq2tICtpRGBME/t+LMGWAp1kYYr7SpMM/DdwyA5j5crpIpZdFa5tVdkl+P9Ueh7v9uw4q0NQ8HrsU6sSC6JpTcpnQWOxXGENwRBXiBdFAB8DUfTLTOS+kAely5PGD/HbspQQVw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <bdf38cfb-2de6-7443-33b4-11f0a135ad49@suse.com>
Date: Thu, 16 Dec 2021 16:54:19 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH v2 17/18] AMD/IOMMU: free all-empty page tables
Content-Language: en-US
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Paul Durrant <paul@xen.org>
References: <957f067b-9fe1-2350-4266-51982f09d3a9@suse.com>
 <ef31b6f4-09f5-cded-a235-5dce3c5399ce@suse.com>
 <YboGXiHaAO1cuUnd@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <YboGXiHaAO1cuUnd@Air-de-Roger>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AM5PR0601CA0051.eurprd06.prod.outlook.com
 (2603:10a6:206::16) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ef667b80-26ba-4090-3d31-08d9c0ac5328
X-MS-TrafficTypeDiagnostic: VI1PR04MB5168:EE_
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB51687128BD2AA329F9469F33B3779@VI1PR04MB5168.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	yp54cAxJC5iz7qi+dHLTPzht2cyJ6kEf20v0S3TNn3+IyR7qmpU8q56xtjduQJURhaW8gBBd/qUP6YnhbGBqNi18fL04qVeSgPBDUJ4rM/nhA0HkFH7V8qJr/zgC4+4OvYePYvJvhwQCjIkdL5IxgP+mA37REifOFHUjLEQGKXgixstvmBC78kaYrPFa54uayQdwAlX6qRg7UVWDMYM33C5+neToY24DUEo8TTG9SmNWK84oowJm67VGr4aKiduonmYnjPOvbp9MtAegHKfVkgA8vFKAKHgnDeepmQFkZdMjqeF0TEYXU+ZajXRJItW5yVFstmkmvfsfuV2a5VW6JXGURcTDa9Twu9tYAKQthcR2stuS5U2yQ6+oHMoSwTbaijZzP2NlcidpvA5x2/s/S9EsImeUp8lku9ebhTWXr6tW84lDdWKcbdqvB8ZYAiDI6Ml5U/TKv9apOXBN+IaLtA1TIdzWaugRV6T4D6BYzdUVY6KAgh8PFreJVBrQ/RKjo+tEc5sVcmEQh7q7PNxs1UfxS9Ol/XvWep2xlOFBN4HkUyR/LgPkZPJ8o6EPcy/mTrInMhgKzclsQiS954EIEOVf6RUEL+puQrjcJ6f+hCGnsnlx/0barfVIHTWNXPBYhYUO3tLxBH3GEC+NWU49PGWL1AWl8Rmi+bJ4RJR4+4/jH/vQxpB1M2jYoTx+l9In7qoKUrzr9aD3Km2CROOURETX8VJ71ryQmvtC3FwsO5o=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(86362001)(508600001)(6916009)(5660300002)(54906003)(66476007)(2616005)(66946007)(316002)(6486002)(66556008)(53546011)(38100700002)(36756003)(31696002)(2906002)(8676002)(8936002)(26005)(83380400001)(31686004)(6512007)(4326008)(6506007)(186003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Yu0mKUTz10Y0xEDSuMjHGx1zyuYYW5nNLM+g5jXOjdMiQt0wP/9rkuqA9I3n?=
 =?us-ascii?Q?KO0DbBG0VGFjDXsvaT73uyUlZJNRhDzDNU38EAKbr8oODVpDQzJuOjj2AiPl?=
 =?us-ascii?Q?b7v+L7BzCP/5SnMPfFk4NlhJbYHDOzY3Mds3IrVAa/mglNLRSI4ke9ow10NE?=
 =?us-ascii?Q?m83YuwASBA2vgbD68cSOBBGwxk0wsuisV+Z6iow2TP0tjfH26UuGLklnQram?=
 =?us-ascii?Q?z4QOWPmn3YQYJsaqyn7aTTXXNhIjmMT7enlRZItM++u6fiZDplbstYedvBq+?=
 =?us-ascii?Q?mtU8cMtegUM+h22UxdMFZJqsRiUOeRoAHWf6U5EgwChGXWpLCdvEXjYGQJcD?=
 =?us-ascii?Q?xkctcrtHWT6hBz+LXsLHa1xSvpGGFTZHMRagapvXngd/QJYuD6JMh6kbxv7K?=
 =?us-ascii?Q?4mCtTFaTE8KiRnCdfS1lghdXXpCcewCdt20Dzodlf3kfnXw+bqwUMCG4ZJtf?=
 =?us-ascii?Q?H6ZUKwnHKAug8Wf3kYspql/7blnqHn8p8HSjZ+AB5A4PvQElMS8+0RcyD5VZ?=
 =?us-ascii?Q?6O00M+H+74rLrO/h/OIk64+EretwEazxIkN0lEvNXCG0r/6Eyv4tgR7EYQJG?=
 =?us-ascii?Q?GrqgeH2GkaSH5Y5Q0nfyPsG0k6FngdJobjnK26Vnxmpk4sGmf7w9v1imVfRe?=
 =?us-ascii?Q?xgmEDhgm1zc9pHM8DRJdLypU/YHGSEKRQkVi35iEoncsWVB8NuGe8F4vSWGJ?=
 =?us-ascii?Q?6GKbzBt8uQv9c2Jci1iBTJzWkl82oQzsI90uwacAHnRl2/R6WTHSVGlFBIk4?=
 =?us-ascii?Q?qLYJQgMxXtk8GZxs9AHG9Vkw1pfJ0Yk5egsiaonICAIwxOH2Q2kQD3vaDwxY?=
 =?us-ascii?Q?ffGBO9bS5xxtpDzKZMUJVMpL76oGeY8wg3lW57N3D+9x0rdAXmvTWfBPJa0e?=
 =?us-ascii?Q?HMk64mtyduIJIMJZj9GiV+ldCnoaX2HGkFmv1+vSEoTsZIsDXDGxdC71Ce6e?=
 =?us-ascii?Q?/eR+vpSTzb9f6mmaIiHAO7GOD/bCf/3b0gsHbxHndAww5RlFPVSCXqpnxPAy?=
 =?us-ascii?Q?c6KRcucDDW7A0wIeLBmGU3QbQRXB8yNbHaTpS4VKU0fLA3bBqhpXjhI26oZc?=
 =?us-ascii?Q?i4+d4mMcAvv8DyrtqYF8LrS2xze6kWjJtTZufsyIj5GlQtriFHS5q0J3mjtC?=
 =?us-ascii?Q?uihneiwxHW/WqNjSt1tlHpcu299jXNuFQN4SQ3BKgEJuSu+S2SMOVpnz4/KH?=
 =?us-ascii?Q?biIwpJfclEgmQw6Lvq5tIaOrLPxx5fipcJkmqzAQeo0Nd/rswlmc6qz6pY3I?=
 =?us-ascii?Q?RgykrQiHPqvn4w/+H6uIwHDquAz3WttaU27gdz+sc/MHdkFKQYsDv9gzMpk1?=
 =?us-ascii?Q?i82ATQ8ekJk12Y4tmapC/a2PrhdrZrjqwkQgyERkQqftzY+fIRjhfqiYHsuS?=
 =?us-ascii?Q?KHpKABSpCcLH9DUlN+7HVEZLBfuNOV9lnJhIRatoBcsoeIaZw61kSHvFSAEE?=
 =?us-ascii?Q?PmQzjAajn1VhFx5qfYV/KfPB9a9QS6Y6ITEigGPPL4HBoGNSYBogcqhrTwVI?=
 =?us-ascii?Q?Det6tJ49A8uihM0MIrStClGxY/3r1e2/lcT4vi39qdeySL1O6+UfYdG/J6Cb?=
 =?us-ascii?Q?tDvCLqcD1A8EweTBe0WsrZGkpnMD0Waoxn/V3561EZoK6ExkbKH8Dh4i4xbO?=
 =?us-ascii?Q?Yl+bdkOtNUhVukLfS7ASIqI=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ef667b80-26ba-4090-3d31-08d9c0ac5328
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Dec 2021 15:54:21.3148
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zuBCc+1StfDnAmWQXNBuxGGk0eNJ8z3OexGeQN7hNrvwVZBScoeUkn4KjaTBNynnUIzeMiVzgFtlXZNQJBz9bw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB5168

On 15.12.2021 16:14, Roger Pau Monn=C3=A9 wrote:
> On Fri, Sep 24, 2021 at 11:55:57AM +0200, Jan Beulich wrote:
>> When a page table ends up with no present entries left, it can be
>> replaced by a non-present entry at the next higher level. The page table
>> itself can then be scheduled for freeing.
>>
>> Note that while its output isn't used there yet, update_contig_markers()
>> right away needs to be called in all places where entries get updated,
>> not just the one where entries get cleared.
>=20
> Couldn't you also coalesce all contiguous page tables into a
> super-page entry at the higher level? (not that should be done here,
> it's just that I'm not seeing any patch to that effect in the series)

Yes I could. And in v3 I will (but before getting to that I first
had to work around what looks to be an erratum on very old VT-d
hardware). See the cover letter.

>> @@ -33,16 +36,20 @@ static unsigned int pfn_to_pde_idx(unsig
>> =20
>>  static union amd_iommu_pte clear_iommu_pte_present(unsigned long l1_mfn=
,
>>                                                     unsigned long dfn,
>> -                                                   unsigned int level)
>> +                                                   unsigned int level,
>> +                                                   bool *free)
>>  {
>>      union amd_iommu_pte *table, *pte, old;
>> +    unsigned int idx =3D pfn_to_pde_idx(dfn, level);
>> =20
>>      table =3D map_domain_page(_mfn(l1_mfn));
>> -    pte =3D &table[pfn_to_pde_idx(dfn, level)];
>> +    pte =3D &table[idx];
>>      old =3D *pte;
>> =20
>>      write_atomic(&pte->raw, 0);
>> =20
>> +    *free =3D update_contig_markers(&table->raw, idx, level, PTE_kind_n=
ull);
>> +
>>      unmap_domain_page(table);
>> =20
>>      return old;
>> @@ -85,7 +92,11 @@ static union amd_iommu_pte set_iommu_pte
>>      if ( !old.pr || old.next_level ||
>>           old.mfn !=3D next_mfn ||
>>           old.iw !=3D iw || old.ir !=3D ir )
>> +    {
>>          set_iommu_pde_present(pde, next_mfn, 0, iw, ir);
>> +        update_contig_markers(&table->raw, pfn_to_pde_idx(dfn, level), =
level,
>> +                              PTE_kind_leaf);
>> +    }
>>      else
>>          old.pr =3D false; /* signal "no change" to the caller */
>> =20
>> @@ -259,6 +270,9 @@ static int iommu_pde_from_dfn(struct dom
>>              smp_wmb();
>>              set_iommu_pde_present(pde, next_table_mfn, next_level, true=
,
>>                                    true);
>> +            update_contig_markers(&next_table_vaddr->raw,
>> +                                  pfn_to_pde_idx(dfn, level),
>> +                                  level, PTE_kind_table);
>> =20
>>              *flush_flags |=3D IOMMU_FLUSHF_modified;
>>          }
>> @@ -284,6 +298,9 @@ static int iommu_pde_from_dfn(struct dom
>>                  next_table_mfn =3D mfn_x(page_to_mfn(table));
>>                  set_iommu_pde_present(pde, next_table_mfn, next_level, =
true,
>>                                        true);
>> +                update_contig_markers(&next_table_vaddr->raw,
>> +                                      pfn_to_pde_idx(dfn, level),
>> +                                      level, PTE_kind_table);
>=20
> Would be nice if we could pack the update_contig_markers in
> set_iommu_pde_present (like you do for clear_iommu_pte_present).

I'm actually viewing things the other way around: I would have liked
to avoid placing the call in clear_iommu_pte_present(), but that's
where the mapping gets established and torn down.

Jan


