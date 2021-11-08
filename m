Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5604F447BFF
	for <lists+xen-devel@lfdr.de>; Mon,  8 Nov 2021 09:37:49 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.223103.385645 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mk09I-0002cx-Tj; Mon, 08 Nov 2021 08:37:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 223103.385645; Mon, 08 Nov 2021 08:37:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mk09I-0002aJ-Px; Mon, 08 Nov 2021 08:37:04 +0000
Received: by outflank-mailman (input) for mailman id 223103;
 Mon, 08 Nov 2021 08:37:04 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=NRYu=P3=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1mk09I-0002aD-3Q
 for xen-devel@lists.xenproject.org; Mon, 08 Nov 2021 08:37:04 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0b956b8d-406f-11ec-9787-a32c541c8605;
 Mon, 08 Nov 2021 09:37:02 +0100 (CET)
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04lp2050.outbound.protection.outlook.com [104.47.13.50]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-11-Z8ygnxu8P4mtLm4x5FRKrA-1; Mon, 08 Nov 2021 09:37:01 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB2959.eurprd04.prod.outlook.com (2603:10a6:802:8::25) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4669.15; Mon, 8 Nov
 2021 08:36:58 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::8062:d7cb:ca45:1898]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::8062:d7cb:ca45:1898%3]) with mapi id 15.20.4669.016; Mon, 8 Nov 2021
 08:36:58 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AS8PR07CA0046.eurprd07.prod.outlook.com (2603:10a6:20b:459::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4690.8 via Frontend
 Transport; Mon, 8 Nov 2021 08:36:57 +0000
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
X-Inumbo-ID: 0b956b8d-406f-11ec-9787-a32c541c8605
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1636360622;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=pQH+qnZWHPYSImvJ2NoTXv5Okp1TsKj16J73BtM8niI=;
	b=cXGvHnDqkMbB2Lh4LIFxblLtv8AIrnWAhSLIak04Rq72bUhPqkd45fFLcaL1sZ8Z2n31O7
	WR7PGcfVI1ojIDWOkhVZyibihe/RQaiOBq39wSEspp9gSp3SxMKFc1LgvrgQh1jImJJGpc
	XJki2i4EOUqNAOHXrtmAB0LjqFH+f8g=
X-MC-Unique: Z8ygnxu8P4mtLm4x5FRKrA-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ToWgMnaZk+dVKaVgAyQEqsGJhB+K39cXRJb8FPb9AsDuLeJ6zM+rin22UCvCEi2oxKXdmn9EVmE9lJPzrLo+wBWA2MiaCnjXBG33iz5Sjm2kMb/l3OEm4rCSDkqprkAW2O4UC2v6hm/M+V5RSEaSGKgrwvy3HWl5v2AJ9te3HMNLx5aQRPHgzrAzr5DxGq7jhODOfwIthl+BR2Otx8akJziKXyIeo2uqV3vhswOqfIFKyS9fLgGdDuDTBRUP0q+ncf2vYDnWEJAWTlEodSuiBezR9DokguXkWdcYhyJeOdn2QN5WnXYTlUypDIj54KbyDLwbhXWRLCL1Jk6GUv45Sw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=n4Xis5gh//tZd1OL25Ne0yN/fy0rOcDVpGLF3Fzq7A8=;
 b=EYKvuXtwupolFWrqYZNXWDONpnouk9sOFEXZRoa04InQaA0oZl3miiU6D7WUol0CFW7/DGuJJl7co4z7gfMT3qPl0l4BYo7cIf175e1F+MYzatk+SNejgU+kBflq80C5KKD6Ij6ywNjM4+0U/IUvLLL2wzIzE9PzcUJYKlqkh+Kt6hQ1LdmFNhjZIHsEqLQk4TXU3/qZRwYZcAB9z/rvlc1OxCn1J0j3HUGjnOc2PaQvBhGR9HkeFecl9GQ4koA9rh0J9rUgGQwuaGhEayGdn6u6vcg2EY+QJjVh1d2DZTTlgeweWcebBeZd/WjuoZJG4FcjF6wLJiK/VdnOraL6Tw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <17fdb6e6-382e-81b3-2f11-3e520e1c7ef8@suse.com>
Date: Mon, 8 Nov 2021 09:36:59 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH v2 00/15] xen: drop hypercall function tables
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>, Juergen Gross <jgross@suse.com>
CC: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, George Dunlap <george.dunlap@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Ian Jackson <iwj@xenproject.org>,
 Christopher Clark <christopher.w.clark@gmail.com>,
 xen-devel@lists.xenproject.org
References: <20211101152015.28488-1-jgross@suse.com>
 <ddde3565-de0f-f025-f762-9d3e08a5c2e5@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <ddde3565-de0f-f025-f762-9d3e08a5c2e5@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AS8PR07CA0046.eurprd07.prod.outlook.com
 (2603:10a6:20b:459::18) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7a50d381-d9e0-4d09-6dfa-08d9a292ed90
X-MS-TrafficTypeDiagnostic: VI1PR04MB2959:
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB295919F6BDE4E3CF6776746EB3919@VI1PR04MB2959.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	o7FBcqQ51sV+0gKHNAUurupcsNkHXCfwMiu1lUFz7VmPLrKbybwCTm6WdF/LjR8kaLNCPsL0y7WmGH2oqoknt4ilcT4aE3y/oWAZcAa6uTHx37ggNJo6aQ7KmWWpljtNs7+Ng3kN6qc1wZ0uwc3ZC07osR9M73INtKjEThsRLWJCS2PlTQPVYREZSWd8F+Nx5/3u9rdyNDTvR/28cpVq3qIOKws7FyRinUMgdFtIct8/AyxY0nKAWyjyRG6Z0KVfCVdC+oYv/Ehfwy9ep7/SpSSzxnzp0P5hJHMQ95xm3il4I0wUO+8XAXZ5kZvsFIghTLMrTftd8/rppcfzA1uuN402Qy8jpSUbVg2DVqjLwqgSjZS2hnzCxaHcTxIxg26RmIGU7c4X57sg6pCsPEEUoogCOUz/mhOTZTbSfo/glAlL13esEtVATLf/35OM9bRCcBnKIsvhDVIDaLsRRcEbdnqLOa12O/cjPQFzjFLl3uJ+aj4JChzBf2Bfs+GQLoTQ81mBQxINQpKOETdRpuMRnWuFDYE5DDzlZ6WLbAwLPE4+7lzH1IaaZZhVy1ChAsItfY3x+fiHjZgspPZpAqStld4ReX8uwGQoVpWJnvZuYHXZh18az0dFEs34yZ/VEbmsL5j1x+01RNu2wXkuoZbXafv5ZZJlhq8W0fXVGAmE+7ZI4EM1UinMDvBz+y26JbPfNNHHbhSLqSVESGhF967eyaAf7A4BDt3TkY3FoCxpSqxtVRvcUeZNoA6FVDISM1Zy57iRC7zSzwAVRSaugUGQ2Pwdo3PYNgodhXyCE5FDAjmmexxa8oEHTJBmN97DfJh0qXrvdDxmkoKkrejCkEjtNA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(31686004)(26005)(53546011)(8936002)(966005)(83380400001)(6486002)(110136005)(31696002)(66946007)(38100700002)(54906003)(16576012)(66556008)(66476007)(316002)(186003)(36756003)(7416002)(8676002)(2906002)(4326008)(5660300002)(508600001)(956004)(6636002)(2616005)(86362001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?7sMfZGJEjQQFyDePIXS59wa+vz5NJuWvSudzTV//hH7MJ4Zlr/KsdIK5XT/G?=
 =?us-ascii?Q?uHpUiPWNN5EGpQJLw714DWklSKyGNNcAm2uop7Aqc9Y4TmYh3voBaQt6T6ND?=
 =?us-ascii?Q?mzgqxiAggb36h7l2WHVG6BAC7fZqKfY++f8UEb6J2PtLa4d0FssdiOtWKJG1?=
 =?us-ascii?Q?YpqhWDBbwnw8ItKBO5pC4SxJfljEdO5ZYFQmvogED+QKQVPIyBExz6Ng8uSQ?=
 =?us-ascii?Q?4FJGIyMnNK/yMVorc9qsXet6/gBitqdQvRtbSpfEZqhAxrk7LvTRupGHXQOK?=
 =?us-ascii?Q?6r+9iQcLVHPURtHiGisYwFOKByLHkx5eTbxPd4D2i0uI0EQRMJ/xgW8M0+Mj?=
 =?us-ascii?Q?6DN5axz/zQEwAQCTJXqd3w4rYJBjLd7vrEryruzsOZC9Az3nFEHVXvcrLwZs?=
 =?us-ascii?Q?I0Nl4lPS+XREpHyxwOTgRB0LTEASVf+rwH2vQtZyD4bhiaKm8jvBzPYsfp0p?=
 =?us-ascii?Q?qgddi6cEttHEg16OxXz8ghscmf4b+p4naCdb837rmTlhKKKlvFC34ar64hC2?=
 =?us-ascii?Q?3bEhXjeHr426z7wPXIo7SxNkU7GMuYh5LsIZYjbKAxk1TX8oomrjRonkxzye?=
 =?us-ascii?Q?Ygx08caDr5Mepz0GEpH/SdeVAAk9nfaM0IGZ2/yiI7b/RbTmjoPIIXYfPqnu?=
 =?us-ascii?Q?tlkDx12cc7yLABxZF1fH6kGzf9jwJIotOgn+C+FL9zkm/lGxRIjat0Odh4in?=
 =?us-ascii?Q?6dXPd0U5KQ0rXT4cpqmnA81uA2CvDVAaoduXnWtV5NZZnW4DzbeLvGdMq9p5?=
 =?us-ascii?Q?LUx7KNxeTWNpPkqfVZzRczScLN01/0AybgcMwzkM1542XoDyrnuUyV2Yu9SW?=
 =?us-ascii?Q?rRlHKvhfjLfQAzyx4RJlw/HWSr9tS6Aw9rErZVtth1WWnlkiY24RhDwiUBt1?=
 =?us-ascii?Q?Unf3i716a6jEXJDuYcQO1q//r60wFuA9Hh+DpClCg4ZN9K/rs4G+sWmjzOOu?=
 =?us-ascii?Q?Jp4IpaHB3riD+XdvlnZDxelJzjWmmcDZIw14tiv2dxiqK71kA4QbEonTGZh+?=
 =?us-ascii?Q?NkNvnPNzqSCw0Ilp2LTTrYuFV1WkHR9I9/m6GDH1tUbwJidE5RgRL3tiRcbN?=
 =?us-ascii?Q?tPgtyAQ5ty4lcoexNYlqX883NifjFPWVN4Zy+92lYzOFbfFvJRZSfJnUuKy2?=
 =?us-ascii?Q?vLvsZVFOkIP6nEVV5tJOUa/LApAsqhU989ceQvjnxtJ36CE1TM9/1bJz4+xj?=
 =?us-ascii?Q?zdkS+L7qNHPdCYBgE49qL/LW8Yb98HjgFE+JzFxkoyYgBR0+xM9Aakv+Y70/?=
 =?us-ascii?Q?QcXewgxEdirW85Ti5C49AVLxppthXlWn5x+5yKbr3tP0TqC9sK3i9QvbZwdH?=
 =?us-ascii?Q?Vvxx2LwZhAp0iQnq6x+fyb/s7Rf72m7PBob3SNKeF56QNQlcu1bKbw0Pqy9t?=
 =?us-ascii?Q?AcnOn3yQUzFn8Hov9U8ZoYV302o5ahnIp5TFsl/LcUYVAWViprkCj/+eif9V?=
 =?us-ascii?Q?7Ct22Qgk5xviqKYwMbrw0slt/dnbbWrlnv+YtJz0i6NFVs24zCelrfnLbvpb?=
 =?us-ascii?Q?EaqU3Ucz+E3qxRbVIdfEESAuAAFVOYhAp7cE5LU4lwwUoD6YH1QpZ+Wd3Gee?=
 =?us-ascii?Q?PsMxP5z8A4qSZAkR4FlYXtCedbsVzJMG64Fu2B2XAbE9G3ehdhiQ+Gw8F9Hw?=
 =?us-ascii?Q?F15RyVPdXPxne2PlMlvL1/I=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7a50d381-d9e0-4d09-6dfa-08d9a292ed90
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Nov 2021 08:36:58.5385
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WKa1R8yEtHuQYgFcR0wmLDGaAzQQCCaDgfjyI3f4GNX7Ucu9y6Bk6PSpX7zB45NqHtaIFRvO5sb9XVHiHrJlaw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB2959

On 05.11.2021 15:18, Andrew Cooper wrote:
> On 01/11/2021 15:20, Juergen Gross wrote:
>> In order to avoid indirect function calls on the hypercall path as
>> much as possible this series is removing the hypercall function tables
>> and is replacing the hypercall handler calls via the function array
>> by automatically generated call macros.
>>
>> Another by-product of generating the call macros is the automatic
>> generating of the hypercall handler prototypes from the same data base
>> which is used to generate the macros.
>>
>> This has the additional advantage of using type safe calls of the
>> handlers and to ensure related handler (e.g. PV and HVM ones) share
>> the same prototypes.
>>
>> A very brief performance test (parallel build of the Xen hypervisor
>> in a 6 vcpu guest) showed a very slim improvement (less than 1%) of
>> the performance with the patches applied. The test was performed using
>> a PV and a PVH guest.
>>
>> Changes in V2:
>> - new patches 6, 14, 15
>> - patch 7: support hypercall priorities for faster code
>> - comments addressed
>>
>> Juergen Gross (15):
>>   xen: limit number of hypercall parameters to 5
>>   xen: move do_vcpu_op() to arch specific code
>>   xen: harmonize return types of hypercall handlers
>>   xen/x86: modify hvm_memory_op() prototype
>>   xen: don't include asm/hypercall.h from C sources
>>   add .gitignore entries for *.[is] below xen
>>   xen: generate hypercall interface related code
>>   xen: use generated prototypes for hypercall handlers
>>   x86/pv-shim: don't modify hypercall table
>>   xen/x86: don't use hypercall table for calling compat hypercalls
>>   xen/x86: call hypercall handlers via generated macro
>>   xen/arm: call hypercall handlers via generated macro
>>   xen/x86: add hypercall performance counters for hvm, correct pv
>>   xen: drop calls_to_multicall performance counter
>>   tools/xenperf: update hypercall names
>=20
> https://gitlab.com/xen-project/people/andyhhp/xen/-/jobs/1752237172
>=20
> Something here causes
>=20
> hypercall.c: In function 'hvm_hypercall':
> hypercall.c:174:23: error: unused variable 'r8' [-Werror=3Dunused-variabl=
e]
> =C2=A0 174 |=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 unsigned lon=
g r8 =3D regs->r8;
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 ^~
> hypercall.c:190:22: error: unused variable 'edi' [-Werror=3Dunused-variab=
le]
> =C2=A0 190 |=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 unsigned int=
 edi =3D regs->edi;
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 ^~~
> cc1: all warnings being treated as errors
>=20
> I suspect it will be "call hypercall handlers via generated macro", but
> I haven't investigated further.

I suspect that's a randconfig build with !HYPFS + !ARGO. The hypfs and
argo hypercalls are the only ones with 5 parameters that HVM wires up.
A similar issue ought to exist in PV hypercall handling though, as the
compat form of update_va_mapping_otherdomain is the only other one
taking 5 arguments.

As to possible solutions - besides maybe adding (void)r8 to the -ENOSYS
path, I was wondering anyway in how far the local variables are still
warranted to retain.

Jan


