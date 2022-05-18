Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CB39B52B7C6
	for <lists+xen-devel@lfdr.de>; Wed, 18 May 2022 12:41:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.331944.555580 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nrH76-0003kl-K6; Wed, 18 May 2022 10:41:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 331944.555580; Wed, 18 May 2022 10:41:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nrH76-0003io-Fv; Wed, 18 May 2022 10:41:08 +0000
Received: by outflank-mailman (input) for mailman id 331944;
 Wed, 18 May 2022 10:41:06 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=hW4D=V2=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nrH74-0003ii-Sa
 for xen-devel@lists.xenproject.org; Wed, 18 May 2022 10:41:06 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 05007d30-d697-11ec-837e-e5687231ffcc;
 Wed, 18 May 2022 12:41:05 +0200 (CEST)
Received: from EUR02-AM5-obe.outbound.protection.outlook.com
 (mail-am5eur02lp2051.outbound.protection.outlook.com [104.47.4.51]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-15-ieELDBSmPr6ZexYzmEP7Jg-1; Wed, 18 May 2022 12:41:03 +0200
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by HE1PR0401MB2314.eurprd04.prod.outlook.com (2603:10a6:3:24::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5250.18; Wed, 18 May
 2022 10:41:01 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::91b8:8f7f:61ac:cc9b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::91b8:8f7f:61ac:cc9b%7]) with mapi id 15.20.5273.014; Wed, 18 May 2022
 10:41:01 +0000
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
X-Inumbo-ID: 05007d30-d697-11ec-837e-e5687231ffcc
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1652870465;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=2zUV2LAAnja/OWPTOsm2RC3+RN5iYLFD5o30dAUcg4c=;
	b=Nq89BswF0Zki4yFYct+1GeXZPfLEVNo5W4mwI97Y5cI43IWIfHbGFYEUvWlLoHlL1NZMcP
	0HLBvNN2ueWyhaDgowH0ug+lW0S+0IVcHcfLXNmXzUTW9ALrB2RVVoFEhcun8q9HCfoQPz
	toTOdBL1A57Cb6AOiTPL1IObiyl0zlE=
X-MC-Unique: ieELDBSmPr6ZexYzmEP7Jg-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WnsJoqm0kueRWLuhupJefE0rg07bV0EtmUFYa03sno7nUzylr5fqUoLswqPDyulAZCAKTmOFmQNWyVUIEZmjabHiEdTyvcYgIeU+NHSMCPsNJGssIxqVqhMrXEybq4qkcaJk+R2E+0d8nu5rzeTq2eqHWV8YB5dqBwphblmB4rtt3L6JU4rl/DmIVax5PuvGAsfI6hUJJqYEioXp8JEEeLcNHN/BgAHR7chyRbC5Md4AjbnDnA9nOaNO2OvskRCx+WHk9cncD0QAZMGeF9Kg9brIguuUREh2b56iU9CGivxEzSDHJII85i1I2lFbp5FaL8DwqFry/nnvc78pNeDUHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EdH0keCRnrVv4uaQo/ur6zD6UHS4DcgosJK3el563VM=;
 b=YZtgAXYf2phPqjysxFghKtpK1k0JBb5WLA8evj7qTSK+7WxEdrDsurZGT/E/LXQ2wTMG9/4EaYbR7pJ8Faj8MAfNsopi9NN3z4PsyiEDttR2rymlnNSx42vMGnv26azCXQ8nKR49sZXhUwFgP+pFRG8XnXPEyDAqDSl3IcWkeinIGNpg54O/10u5bKDnHeNFLT+1c9C2q6TbiJ/sEiCENfdyKWdypV77huhu4MN4RPJGijXsz3p2md6x6Yl08VmGL/KVUgqXulaUG6tIP9TUYmVCl2+aMm/LBTlXd/VCzhNtNj3UBschzj4AInQmTxSsgnOvCTZgP18JM25uXVN9mw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <eb173596-b0c9-e404-0d69-dd089ab16db0@suse.com>
Date: Wed, 18 May 2022 12:40:59 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH v4 17/21] AMD/IOMMU: replace all-contiguous page tables by
 superpage mappings
Content-Language: en-US
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Paul Durrant <paul@xen.org>
References: <b92e294e-7277-d977-bb96-7c28d60000c6@suse.com>
 <e0e2d865-5ac9-d7ac-c763-f4b99b699224@suse.com>
 <YnqFSWXRh+TEO9mZ@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <YnqFSWXRh+TEO9mZ@Air-de-Roger>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AS8PR04CA0133.eurprd04.prod.outlook.com
 (2603:10a6:20b:127::18) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5a347760-8da0-40f5-aa98-08da38bae6c1
X-MS-TrafficTypeDiagnostic: HE1PR0401MB2314:EE_
X-Microsoft-Antispam-PRVS:
	<HE1PR0401MB231401470D1BCB1AD35AA0F1B3D19@HE1PR0401MB2314.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	SOJ+2jZvqoHJludgT9NJWFp/u2BlGU+YXd69gAotYr78emgATW6POjKk4p6Bfzcj0zPSeRbUgc+KuuInDh7nPx7m5AfeRt08GADWhEHIyY+8Yz7e5YYEnULuH/wWVewqmMU0SXNm3Y0xk0pShQo1fkyWgCX1kLL8L6mRRUUm8Z+dqx25IVJGLLPAWE9YsotoT/OVKOyKpReVSI2GMb5u5zP2TCgZI4E+ujYyZBx8NVIrMgfv+F0L5J09zPeZ402ux9lAsEHEYeXnigdCyZC9An7NKVNhhrpyE3g4CZmDgnP/n0ebDAXeif5LPmi5qzs0GNAGUL/qpz73JOUaw1km447RNhqHe1JrXerNe1yJnxhf2YWg5kh7lnRdusVX//zzNMOEQu8c1A6jzkfLclkWg6FsKaEoHTEZz4M89aJN8R7Nyi6PmrqB4yi/5ovN2H72zY/mAoAUyc7RTVuUEhTCvqRAPwcIfPo5KtghwZvaAX0IGCpKHPMhxCDvG0NGyGeWVFUuxaCfXPzTzOtsDfvoCROBHnBPjYNSABrCEoVfPl7oQRTFl4Zarc5Q/V6NMsmlJsUAAYbOgfCaXWr0QMpU517rQfGYXi+cBJzpywVwWpLpvuGedlex3GmsidMMIkpt+F06KanxSAvYy+PX02w7XvlWzbE3r1mVsG1e6pzXs7ODKQVtGN6qALWQVaWzrxD6oHN+iWqU9dUDL0ZA7ZzKJKsA+5u7BCjubfdrXZvZWZRg6p9PKWxelRLwz2HJWEzw
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(31696002)(31686004)(83380400001)(54906003)(66946007)(4326008)(66556008)(86362001)(36756003)(5660300002)(2616005)(53546011)(6506007)(38100700002)(2906002)(6512007)(26005)(186003)(8936002)(508600001)(66476007)(8676002)(6486002)(316002)(6916009)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?5JF0DvQZWZhGQ+oW6hzs8bmipE14FlEnTj7ZGKmNIw1duZ5W8OyhEfjza3sy?=
 =?us-ascii?Q?W7cKi5LAA7JiiuFK30HiAbTQU1D+w6dkJLoaFApkMRLiuEVMxNBuWpyqS15C?=
 =?us-ascii?Q?w//eCiDYSOiAXCYJZCj7Dh7gqbYbVQOuwhnneowuV0x/Wop0KsdzPxhwKLSH?=
 =?us-ascii?Q?+cN7iqDvNVb5uuyauPn9dgaNVZ6WKmgDr+ka3v7Q1Osna7n3Gak447ff8xhX?=
 =?us-ascii?Q?VAoXXPm7gCk517sO/2POd1I5s/WilBQCqY9fGr4ns1VPWDu+m5KBitJKZrYU?=
 =?us-ascii?Q?1v1rS8cxsZj1z9HGej2865dRsNgelrUugTqvQbDdRpu1SzInWotRRV6ssTHd?=
 =?us-ascii?Q?ZdNOtj4/3S0Jt+jxTgAyRaXu4rDoOrXvuF864KOc5LHyPH/HmJR16X6AulWh?=
 =?us-ascii?Q?m2NJx2i0q0nQY+byRqxvfyuSHm2i5alhcrm82yhMgjH1RLa39s2ukEHzPZJP?=
 =?us-ascii?Q?G91LjShqm50jfzs30PN8N1L9m+R9yfw75OLde7d9zWvdmPa53Lrn6TelgBUB?=
 =?us-ascii?Q?l9Tkv0bHC1ZuNLWQfYmhhpuKqyPkg7Tl+M4mprnoyrXy46sGCd3bwAI0z1x1?=
 =?us-ascii?Q?WhCBg5dvJ4C34EXqXmFRDB5Yzscjz2fsT/wwt3Ns1Dlp+VH3bNykzdefEye2?=
 =?us-ascii?Q?L5Fp3IfGgeXIpbLTlJXmJ/1Zy865X+fMza86ndzmj0QrR2rz5plIpoBonGet?=
 =?us-ascii?Q?NosNhMMRaqH+xl6DbgP8lp9VChWV7ijPHsCPfvJzftJKHGYld+N8KNr2E9Dw?=
 =?us-ascii?Q?G02BOFJ1edjH/uEcxwR+LzBcfuafpIFKdRhu8U+avLqimd/qIDa7UUoQB3FS?=
 =?us-ascii?Q?EQYuurWVPM77VWzXdyL8zOvtXrFwsciKkRpb8HWxTPlXUGmPIvzrZStZD1XG?=
 =?us-ascii?Q?dDBih7lL7JBzdpFAsLQTWuAENyWrPqfVMyunoC8xU4JkZcexCLeF7Lk5R2XT?=
 =?us-ascii?Q?n9GYzkDsxCh40GLG+3RHux1Exxf5QOKJquUMAHk7aiu2kiLS1eV2KDHBtWEm?=
 =?us-ascii?Q?1FSG1U6rEmVt2vROKGFeNzKGmmWFWvsQl1ZBMl4xBopJ44zxkDP9TdWCzAKm?=
 =?us-ascii?Q?J9x2N+yWDo2ZSL6SrfkUu/AchIhiv+5S99zCf6fFlrW07hVYoiJbVZ1El4l8?=
 =?us-ascii?Q?8QCtB/F6KSJd6d5+y+IkVPwo6fsw6eaJtcZYcHj2BhAiQPFEa8uZIJ0Am2uO?=
 =?us-ascii?Q?tPwnDAgoQG22qNjcOo3Vy5u876kCDRYE0eDMbyvQ8P7T48s4caIMx6hjTDlY?=
 =?us-ascii?Q?bDG7l38X0T1/iUBs3gz6frPAVYy0tXVFcXD0755/zKpSxtEonVBR4RDpi7Yj?=
 =?us-ascii?Q?MQ/U7Aq/uzISITB2E5J/Mcacf1haF4AqVswliGD/lc+zKlj1uJN19xJ5bF2K?=
 =?us-ascii?Q?VyyjeUG90+2QObmggxDbW566LJGweQwYwsUcDgmGgLH91owkKlLCOWmz++OJ?=
 =?us-ascii?Q?PhZhY6VLGkp0WHVxYv+IVtWYURLVPjslDCpsdMb8oDpCfNXyuKETsv1QRfmv?=
 =?us-ascii?Q?bk3oxRnUUf+UH0pJwXIdp0/Bc2AFdebY1bv+xGFUWQbIpEvpjpJU7+Wisp0C?=
 =?us-ascii?Q?Ue8GKaE39DC527KgcVNZyL8yP4pqT+hHpWEy94+gBSzAM2JjThIkZMFPIizg?=
 =?us-ascii?Q?jo5qfhWNUinHffv6JG6STF4MoS1nA6tM/9XXzWwKFIyMfSySahJ/x6CiDWfx?=
 =?us-ascii?Q?IDaR+T8M6LFIC7U2Z6AKek9sjpDoGPIzaznUtB9UG2Hxihqs8FSzujKUBFHL?=
 =?us-ascii?Q?NIrEGOPn8g=3D=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5a347760-8da0-40f5-aa98-08da38bae6c1
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 May 2022 10:41:01.4745
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ObTgSnpH0LASmrA7je6z/RSBpWLd0rJjpdU0P2A8PSi36ZcrtpeRGSlht0fsi6nqL/aIypU4HiSLkn/Nz0JI0g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR0401MB2314

On 10.05.2022 17:31, Roger Pau Monn=C3=A9 wrote:
> On Mon, Apr 25, 2022 at 10:43:16AM +0200, Jan Beulich wrote:
>> @@ -94,11 +95,15 @@ static union amd_iommu_pte set_iommu_pte
>>           old.iw !=3D iw || old.ir !=3D ir )
>>      {
>>          set_iommu_pde_present(pde, next_mfn, 0, iw, ir);
>> -        pt_update_contig_markers(&table->raw, pfn_to_pde_idx(dfn, level=
),
>> -                                 level, PTE_kind_leaf);
>> +        *contig =3D pt_update_contig_markers(&table->raw,
>> +                                           pfn_to_pde_idx(dfn, level),
>> +                                           level, PTE_kind_leaf);
>>      }
>>      else
>> +    {
>>          old.pr =3D false; /* signal "no change" to the caller */
>> +        *contig =3D false;
>=20
> So we assume that any caller getting contig =3D=3D true must have acted
> and coalesced the page table?

Yes, except that I wouldn't use "must", but "would". It's not a
requirement after all, functionality-wise all will be fine without
re-coalescing.

> Might be worth a comment, to note that the function assumes that a
> previous return of contig =3D=3D true will have coalesced the page table
> and hence a "no change" PTE write is not expected to happen on a
> contig page table.

I'm not convinced, as there's effectively only one caller,
amd_iommu_map_page(). I also don't see why "no change" would be a
problem. "No change" can't result in a fully contiguous page table
if the page table wasn't fully contiguous already before (at which
point it would have been replaced by a superpage).

Jan


