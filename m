Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F0963519C38
	for <lists+xen-devel@lfdr.de>; Wed,  4 May 2022 11:47:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.320501.541266 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nmBan-0007lx-Su; Wed, 04 May 2022 09:46:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 320501.541266; Wed, 04 May 2022 09:46:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nmBan-0007kJ-Oi; Wed, 04 May 2022 09:46:45 +0000
Received: by outflank-mailman (input) for mailman id 320501;
 Wed, 04 May 2022 09:46:44 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=IBxS=VM=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nmBam-0007kB-6n
 for xen-devel@lists.xenproject.org; Wed, 04 May 2022 09:46:44 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1a6097ef-cb8f-11ec-8fc4-03012f2f19d4;
 Wed, 04 May 2022 11:46:42 +0200 (CEST)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05lp2111.outbound.protection.outlook.com [104.47.18.111]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-16-a0v6ymhzNW2VSgq_7wn2Gw-1; Wed, 04 May 2022 11:46:41 +0200
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com (2603:10a6:10:2db::16)
 by GV1PR04MB9149.eurprd04.prod.outlook.com (2603:10a6:150:24::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5206.25; Wed, 4 May
 2022 09:46:39 +0000
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::5cb0:5195:4203:7c2f]) by DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::5cb0:5195:4203:7c2f%8]) with mapi id 15.20.5206.013; Wed, 4 May 2022
 09:46:39 +0000
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
X-Inumbo-ID: 1a6097ef-cb8f-11ec-8fc4-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1651657602;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=cK6OCi5oWKM6GuPQATG/SVn9ENc8ADMMZC2dCddWQTo=;
	b=e+q1CScv0sBCXGUEDJj0RLBIhrzwsEn/Iz40z0nQivHONlkVKku/rRKXHf4GSIhp/5ff7Q
	UyzeN4+7XMjMe9FOA8QBpZ0gGKJd9I7NFx/Af+R7pXVrGLcTw2CqPypLpmPvqqYKlSlcCU
	lAN8LdemP64v8e9FFmpzOWUE+kMhjQk=
X-MC-Unique: a0v6ymhzNW2VSgq_7wn2Gw-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=B7Q2kE9ZdQP7BjyrzhLGcGS2KEP/GK0wvps1g7Zb5v0vxq8BpiMPNctO91imkU7RYCgm8BW16nr990m9dczmOxLH0M9fruDnekV4sIg4XFMxGuSNFMHvof8OPHN2lu/XctNLzDF1AIRXzFQm1IhytCQZDbyQnA8sNMVVxbeB75vonhW394ffeVuxPkvcjah2HiN4aiY1eAAjawuX4Lhq8snaE1n/BEsZW9Yw5tpVdppARP0AplT8YvR2atzpYvMZBxTbybasldu3LwZfiA5omb5MqyqdHOHSkgV9w0tNv6Jt2EhpJ7Ju7G7xjQPvasMhD2MGELlDKRiCQHAjF7pzlQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vuvmrCTvQYgpXyhHw0y7zflM6sqF8Uc+05hhmG/uaiQ=;
 b=P2d+GK04/1mhEY1O1BJZ0Yv8Rra6r7JPGxnq1sI3RXcclPZBBNsmNSarFxVbiXQfVDY8kmRaYrvvy4AVRcja2zhGMBnnhFNhw36FAuYfC+E2L54kGMV2lBfIwWtMVLUbe0paCIQdx75X41alANnxklOwNEHpHxsm/ymLEtVHWSK1x1EBSm4wu9WCDXN7b5QhCjSE+z9Kcoa4VLJM/7RS/LsHCogSpxQgxkQHa/BWJvrj79YAZ1l5Tj78SYzfvhpII3HeEPEdyWq34rNc9IBndtm4zTIgNkQL+DvWcH8hiZwYRCpkfan4WP+8Cnis2kfJ/d3VeXLkr8oEX8TlB4StLg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <73aabaf9-4509-53f9-8af4-354fd3d13fb3@suse.com>
Date: Wed, 4 May 2022 11:46:37 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH v4 06/21] IOMMU/x86: perform PV Dom0 mappings in batches
Content-Language: en-US
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Paul Durrant <paul@xen.org>,
 Wei Liu <wl@xen.org>
References: <b92e294e-7277-d977-bb96-7c28d60000c6@suse.com>
 <f85a5557-3483-8135-ff47-a15474aaebb4@suse.com>
 <YnFBDsEdaMiMv+8O@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <YnFBDsEdaMiMv+8O@Air-de-Roger>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AS9PR06CA0320.eurprd06.prod.outlook.com
 (2603:10a6:20b:45b::33) To DU2PR04MB8616.eurprd04.prod.outlook.com
 (2603:10a6:10:2db::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3d945f9e-5a1b-4887-7745-08da2db2fc90
X-MS-TrafficTypeDiagnostic: GV1PR04MB9149:EE_
X-Microsoft-Antispam-PRVS:
	<GV1PR04MB9149A9687B4E690C126AACB4B3C39@GV1PR04MB9149.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	o5QLrOEoQhI9EQCeHXbEWUSGdE2wwd+KwYzC3nvf+Ctn5T0gbl0fu3S/SRhy2CsyBFdasy+jy6c+WRC2qQX+iQtYmMDRCFtcnLp/x605q3vFo4J8Jw+dKsfmzl41/qz0/IiRQgotY0e+I5lNwUfEpxTOVzzUB9S6kc2ZKRQxehdzmXMvwT3IDUwMbKg2MkalluUPHYgi8BwfQARMOvvZPW8nEdIogfyXNJrP7M4dLdNJn1FJMPOEvUQCX0f+hkKGyXuOFLbTu8L7iC4dOQA7mQ0IhBwnplRpQes+zL9P49Bi0Ei4+/31eruSiUvIFUfr1XKQ1W393u2N96JjLP8okMEQtfk6GT2qZLxa2d7/TQZcjOh0CqMu080+f+cOtHSy6fbhInJfSMDScjjMftHxkUNnL9ASUc4WZ0XQqGyf1P2RxLsNtkyLJYJF3KAqnbVjrmFkW+9udP6kVZU8Hmn7595NG5XGCzqjgmJCBgmppCZPcRXBPKNv5piy32XGRTRymH38ywCnld6yNojRkcPhLzwCL55xDRokFoX2W9dm3lcJU19sdkQzNdjtsLK1fuyFE/swXLEkTu1t9Ci4rMzwPKnSWrbsXOEAToQvJ3UAAwOJkJcuNfKfBueHeYfuoK39CB6V7QlEDH8OR7TRwdnMqNnbyAk6K0TjHhD4CvGdSWgRpcE7Poh4zBDqirhPmndOMbIcXitymqzVCztJMqb2nNANxYdrlgsGGtKPdKnK5ts9b6CLAVQFJlUKtHPB9sqG
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8616.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(508600001)(54906003)(6486002)(6916009)(38100700002)(2616005)(5660300002)(186003)(36756003)(8936002)(86362001)(31686004)(26005)(6512007)(6506007)(53546011)(316002)(2906002)(31696002)(83380400001)(66946007)(66476007)(66556008)(8676002)(4326008)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?oHFvZAVenJ33GwUcKlGQ9WG9eYcnoAx26a0YeDY+9b2Me6qg2hmBgy/z68i6?=
 =?us-ascii?Q?kd92XgyF2w7RdjV9eQ62qwz7yaQMUdNbSMyQzAlj4Xr6Mf6vV2qhiHLLC04m?=
 =?us-ascii?Q?1lrXs4Xun0XyYXg2iQXGvGH+Z7xDuB+umK1gA/gB2Vx7QT3f7PiiNy7jYb56?=
 =?us-ascii?Q?lJQdagMEZ8599aoJvKC4dRbvdo8sfheo1B56dJogadY5XC4/iJc/+SqS4o5m?=
 =?us-ascii?Q?FQ6GGM5fG2MUJKf18Sf7knyXOGUVQ99Ad61NB2FZwj6Vj4LklsHFpf7b3pT0?=
 =?us-ascii?Q?csShMZ3jxlJrJOuOavA8e98mFYDwWrqIkbQWRVjFGXtIQxRptuEPX0DfDhvd?=
 =?us-ascii?Q?MC/ba568gn7dqSAJcCJ87DFjJAIj3jV/Ts+BEgIynJNf4LWTa2Lk0nm5sqQv?=
 =?us-ascii?Q?8Y1hwW3a5HEl11at7jSOlCNA6hJ74kLkM1ejLhd4SB6xz2XCysn2po8OqmBi?=
 =?us-ascii?Q?kknRsa6lGLakJIUIGEkQ4OSZaJk+hRgbhJeDku/yU1hqh/VZyA2b7sK2qSoX?=
 =?us-ascii?Q?wUn+UUPUshQm4dulboYbQVYobI2nnwCKGvlRGUcqD8o1OEGlLv1B56dENRan?=
 =?us-ascii?Q?1lchDbLxGg8aiUD16B6d5dyAlOOkxXF7bVjfbhKLl153FWsaO2x8mBvK/px+?=
 =?us-ascii?Q?FRu0e2ZQPLAP0pXtN5LXTqZ8sNwIGtcVEQ+9UV049oytt2teQkL8r0GAW7Ss?=
 =?us-ascii?Q?7GvVCOFQXQG8rdrxjn3iDD8nIHbtTLbBVhLCmmNjubDs6im+FTO+CsX5f0Fz?=
 =?us-ascii?Q?AgJlgiVm8g6WFtXRfWia76fkkJL2UCIqzRgW9fEm/ykQYHtIQhX2QeObemI4?=
 =?us-ascii?Q?awmN3iPEd2VpPuLJGI4MEycEQyEwiBhhwdydrYwuL3n2Ab+vFrF5LffD5Kud?=
 =?us-ascii?Q?c6H4hAxnSORbTKYK4L2bCCaiyRQzCDhY4MiTuC3HTy9R7wEFLHG2obu4uSJj?=
 =?us-ascii?Q?SD3hOFTYTCFrRl9wnam5rUQsKdpqZcCX98bOzcpEcSrkZ6zDpfdORklqWxR/?=
 =?us-ascii?Q?3S6clX3RBXLeC7NXkv3G3Yq9xQ8BZmUkPyXl18NuKV9aa1msnZhxAbDMTJa8?=
 =?us-ascii?Q?E4yDDHwuIXkA1E6qyCTJYL/hKKEbyrk9kNI7GOVJYeFO17KJIUJzseBRbT1z?=
 =?us-ascii?Q?nTr5qOy1k5neX4bLQYXqyOjYxq8yLJRKUUEgbiHG1AmHUkAdPm3aZMVCayoS?=
 =?us-ascii?Q?/a7ueQeI0bbpQqGvnrgUJ2O2UxWSPVWvznW3/dY3U7dmq20d69ZSFEM1m6KY?=
 =?us-ascii?Q?42apgD5aViOgBygklf2C9KUdM7AJDXc9MxbhaZGyvL8WzlwzL1VVagkNvPIn?=
 =?us-ascii?Q?8lObAGmCfGSrjki/ZEJ34S68NAqPeZ6RzBENd3qc1YdDCBqSBwRDS6WxQKYQ?=
 =?us-ascii?Q?XH53pxaJtoqlTJ4AV564jGMNDVlNKarjYxdtxiyDnuoQDnRXJ4gGEiM23I5e?=
 =?us-ascii?Q?SOZF0As7lAdunxrcRtJYUKigFBTwEU6YOwoyINIeuRb3wPFpYMS52SdfSVSf?=
 =?us-ascii?Q?QLyW7WAPX2mym5+o5OSSRb+DGkBR14SnEpFGFx0XvEd3SWP6T4TnU8WXeW5q?=
 =?us-ascii?Q?T0+/6b4yvOo4G79kjK+fmNn86EfUowtTCJm91ITVsU2F/RyeDeG2hil6g3c6?=
 =?us-ascii?Q?MaxvtYTKA/h3VWw7Pu8QT4HphKNbhLxQkambRz1DnvPMI6X4rGmDEH7w5CKN?=
 =?us-ascii?Q?nmfejltGBdRgjfSVoUyvliUxrGLdXaKaSd/ZYjgRp2Ah7aEo768EKCIVUazh?=
 =?us-ascii?Q?g52w6VpcnA=3D=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3d945f9e-5a1b-4887-7745-08da2db2fc90
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8616.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 May 2022 09:46:39.2038
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: g7EI0Gg7w9lFpa4Lr/63j3fAZ7zWsR0Rl2k6+FDqXZ4u5s7L5MbyOKBSGjo1nDsUHyYYbxT0LHuDiaLbwmCxSA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR04MB9149

On 03.05.2022 16:49, Roger Pau Monn=C3=A9 wrote:
> On Mon, Apr 25, 2022 at 10:34:59AM +0200, Jan Beulich wrote:
>> For large page mappings to be easily usable (i.e. in particular without
>> un-shattering of smaller page mappings) and for mapping operations to
>> then also be more efficient, pass batches of Dom0 memory to iommu_map().
>> In dom0_construct_pv() and its helpers (covering strict mode) this
>> additionally requires establishing the type of those pages (albeit with
>> zero type references).
>=20
> I think it's possible I've already asked this.  Would it make sense to
> add the IOMMU mappings in alloc_domheap_pages(), maybe by passing a
> specific flag?

I don't think you did ask, but now that you do: This would look like a
layering violation to me. I don't think allocation should ever have
mapping (into the IOMMU or elsewhere) as a "side effect", no matter
that ...

> It would seem to me that doing it that way would also allow the
> mappings to get established in blocks for domUs.

... then this would perhaps be possible.

>> The installing of zero-ref writable types has in fact shown (observed
>> while putting together the change) that despite the intention by the
>> XSA-288 changes (affecting DomU-s only) for Dom0 a number of
>> sufficiently ordinary pages (at the very least initrd and P2M ones as
>> well as pages that are part of the initial allocation but not part of
>> the initial mapping) still have been starting out as PGT_none, meaning
>> that they would have gained IOMMU mappings only the first time these
>> pages would get mapped writably. Consequently an open question is
>> whether iommu_memory_setup() should set the pages to PGT_writable_page
>> independent of need_iommu_pt_sync().
>=20
> I think I'm confused, doesn't the setting of PGT_writable_page happen
> as a result of need_iommu_pt_sync() and having those pages added to
> the IOMMU page tables? (so they can be properly tracked and IOMMU
> mappings are removed if thte page is also removed)

In principle yes - in guest_physmap_add_page(). But this function isn't
called for the pages I did enumerate in the remark. XSA-288 really only
cared about getting this right for DomU-s.

> If the pages are not added here (because dom0 is not running in strict
> mode) then setting PGT_writable_page is not required?

Correct - in that case we skip fiddling with IOMMU mappings on
transitions to/from PGT_writable_page, and hence putting this type in
place would be benign (but improve consistency).

>> Note also that strictly speaking the iommu_iotlb_flush_all() here (as
>> well as the pre-existing one in arch_iommu_hwdom_init()) shouldn't be
>> needed: Actual hooking up (AMD) or enabling of translation (VT-d)
>> occurs only afterwards anyway, so nothing can have made it into TLBs
>> just yet.
>=20
> Hm, indeed. I think the one in arch_iommu_hwdom_init can surely go
> away, as we must strictly do the hwdom init before enabling the iommu
> itself.

Why would that be? That's imo as much of an implementation detail as
...

> The one in dom0 build I'm less convinced, just to be on the safe side
> if we ever change the order of IOMMU init and memory setup.

... this. Just like we populate tables with the IOMMU already enabled
for DomU-s, I think the same would be valid to do for Dom0.

> I would expect flushing an empty TLB to not be very expensive?

I wouldn't "expect" this - it might be this way, but it surely depends
on whether an implementation can easily tell whether the TLB is empty,
and whether its emptiness actually makes a difference for the latency
of a flush operation.

>> --- a/xen/drivers/passthrough/x86/iommu.c
>> +++ b/xen/drivers/passthrough/x86/iommu.c
>> @@ -347,8 +347,8 @@ static unsigned int __hwdom_init hwdom_i
>> =20
>>  void __hwdom_init arch_iommu_hwdom_init(struct domain *d)
>>  {
>> -    unsigned long i, top, max_pfn;
>> -    unsigned int flush_flags =3D 0;
>> +    unsigned long i, top, max_pfn, start, count;
>> +    unsigned int flush_flags =3D 0, start_perms =3D 0;
>> =20
>>      BUG_ON(!is_hardware_domain(d));
>> =20
>> @@ -379,9 +379,9 @@ void __hwdom_init arch_iommu_hwdom_init(
>>       * First Mb will get mapped in one go by pvh_populate_p2m(). Avoid
>>       * setting up potentially conflicting mappings here.
>>       */
>> -    i =3D paging_mode_translate(d) ? PFN_DOWN(MB(1)) : 0;
>> +    start =3D paging_mode_translate(d) ? PFN_DOWN(MB(1)) : 0;
>> =20
>> -    for ( ; i < top; i++ )
>> +    for ( i =3D start, count =3D 0; i < top; )
>>      {
>>          unsigned long pfn =3D pdx_to_pfn(i);
>>          unsigned int perms =3D hwdom_iommu_map(d, pfn, max_pfn);
>> @@ -390,20 +390,41 @@ void __hwdom_init arch_iommu_hwdom_init(
>>          if ( !perms )
>>              rc =3D 0;
>>          else if ( paging_mode_translate(d) )
>> +        {
>>              rc =3D p2m_add_identity_entry(d, pfn,
>>                                          perms & IOMMUF_writable ? p2m_a=
ccess_rw
>>                                                                  : p2m_a=
ccess_r,
>>                                          0);
>> +            if ( rc )
>> +                printk(XENLOG_WARNING
>> +                       "%pd: identity mapping of %lx failed: %d\n",
>> +                       d, pfn, rc);
>> +        }
>> +        else if ( pfn !=3D start + count || perms !=3D start_perms )
>> +        {
>> +        commit:
>> +            rc =3D iommu_map(d, _dfn(start), _mfn(start), count, start_=
perms,
>> +                           &flush_flags);
>> +            if ( rc )
>> +                printk(XENLOG_WARNING
>> +                       "%pd: IOMMU identity mapping of [%lx,%lx) failed=
: %d\n",
>> +                       d, pfn, pfn + count, rc);
>> +            SWAP(start, pfn);
>> +            start_perms =3D perms;
>> +            count =3D 1;
>> +        }
>>          else
>> -            rc =3D iommu_map(d, _dfn(pfn), _mfn(pfn), 1ul << PAGE_ORDER=
_4K,
>> -                           perms, &flush_flags);
>> +        {
>> +            ++count;
>> +            rc =3D 0;
>=20
> Seeing as we want to process this in blocks now, I wonder whether it
> would make sense to take a different approach, and use a rangeset to
> track which regions need to be mapped.  What gets added would be based
> on the host e820 plus the options
> iommu_hwdom_{strict,inclusive,reserved}.  We would then punch holes
> based on the logic in hwdom_iommu_map() and finally we could iterate
> over the regions afterwards using rangeset_consume_ranges().
>=20
> Not that you strictly need to do it here, just think the end result
> would be clearer.

The end result might indeed be, but it would be more of a change right
here. Hence I'd prefer to leave that out of the series for now.

Jan


