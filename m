Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 172B45186C1
	for <lists+xen-devel@lfdr.de>; Tue,  3 May 2022 16:35:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.319690.540018 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nltbu-0002Ez-39; Tue, 03 May 2022 14:34:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 319690.540018; Tue, 03 May 2022 14:34:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nltbt-0002CY-VB; Tue, 03 May 2022 14:34:41 +0000
Received: by outflank-mailman (input) for mailman id 319690;
 Tue, 03 May 2022 14:34:40 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=YfIj=VL=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nltbs-0002CS-GD
 for xen-devel@lists.xenproject.org; Tue, 03 May 2022 14:34:40 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2949d0dc-caee-11ec-a406-831a346695d4;
 Tue, 03 May 2022 16:34:38 +0200 (CEST)
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04lp2056.outbound.protection.outlook.com [104.47.12.56]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-13--9XlBZ2QO6ityAiK7iXnZA-1; Tue, 03 May 2022 16:34:36 +0200
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com (2603:10a6:10:2db::16)
 by AM6PR0402MB3639.eurprd04.prod.outlook.com (2603:10a6:209:19::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5206.24; Tue, 3 May
 2022 14:34:35 +0000
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::5cb0:5195:4203:7c2f]) by DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::5cb0:5195:4203:7c2f%8]) with mapi id 15.20.5206.013; Tue, 3 May 2022
 14:34:35 +0000
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
X-Inumbo-ID: 2949d0dc-caee-11ec-a406-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1651588478;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Id/gGQfzxOdjNxz48+0puEPHm748yeLpkCxCB/6G4ac=;
	b=Fr6yhet8dOL/MvdheNGcGwyeU9J4LQZ5iIntNhp3miH+QdxOQTPY6l0Ee7mTLfczWoMv09
	9M9Q3zCiQETuy1XnmMVXDCd0Rb4j//uScvd5Y+8yMm8Zgq3pA2GYYgVQIoXVaXlnFdrqwA
	0dijFvNMas9JaDLNsGaN/9eG9yzUeio=
X-MC-Unique: -9XlBZ2QO6ityAiK7iXnZA-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LvvcIBRk8BitzEoQfQsF6rq3a1rc9aFLKEQwM+DCBbMNlBg5kf1gfBHC6oK7bY4EDZjNP40Uk/6krkHxSbx00YXYKaCWPfzeb8hVJcQSdeXXpH+GSKiBDZGNkQrGYKMXCEb2cLEQDTZrNHUL7a5mg1Y4HiV/DP/QsEt5KWrE4WsQ0kUn4gV4YAdBk4oFsFyeykszoI51Al+dtZ9cFjr10BlKQeNd48rBNpP3kUtI0gjXwPEDTe1GVpfpBHpi2/frRT+eefmljUJn5YyEszBYjI4NIYeqZscboABMlaU+Gn7ztSPQkenEa1mCbLhWUTm3XeLQZ4lVgSdhnXmHC+B3gw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ORzGMUqT0Fv8u+AtgY9rL8u0IqW8rFi2nntxokHzZ8E=;
 b=FBNpNTbj9Olq0U4nIFT58ctqu3kTJtZl2XszRh/Z2uEhptPyLq/iYVClij2x86DuLDMqUeoj0MnS06g6NCGi9moOvsiaYsicI6fyDsoq/2wEJk7EBsUkkJwNox8CMDzTvbJhySJnUvj5OeH6ri4WTtAYL4DgpDevn/1gMysHXFZltZl7ukKhn6jC73rCCjHQ1yqXULMCh7XC4UDPke5Ixug2Co02pCOz2EfH3jpup2kTyCVZWVhOArgfYsEN6/QA6uV3rIBTUL2OQFxPXZVkrX4TQ1on6v1PEt4Prw1ZMNqtLbPLaSNH2pRaRz+ilgHf/2xWPI+V2iZKlFydLVcweQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <3ddf9998-45ce-962c-37bd-5c202a5f6279@suse.com>
Date: Tue, 3 May 2022 16:34:33 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH v4 01/21] AMD/IOMMU: correct potentially-UB shifts
Content-Language: en-US
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Paul Durrant <paul@xen.org>
References: <b92e294e-7277-d977-bb96-7c28d60000c6@suse.com>
 <0dec8285-a348-53d4-f9fa-552c7c1c405f@suse.com>
 <YnD/or3VoM1ZvnxY@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <YnD/or3VoM1ZvnxY@Air-de-Roger>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AM6PR10CA0067.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:209:80::44) To DU2PR04MB8616.eurprd04.prod.outlook.com
 (2603:10a6:10:2db::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c2ab3bbd-a7d1-42dc-39d1-08da2d120b52
X-MS-TrafficTypeDiagnostic: AM6PR0402MB3639:EE_
X-Microsoft-Antispam-PRVS:
	<AM6PR0402MB363948A28E5F393B6606504AB3C09@AM6PR0402MB3639.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	9kuNQwhxJ4AX3jl5UwJ5PFJzvvZTHJ8KT2fMlCjXIV+YCXz9SdBZGnmbTv+yJ2WaEmugncEHG1Fr8SQCmaJAAi7cbWi3UFjMxrwYC+mExHYwFOjCqZFlYnkW5QoDBK8acMq2oW1p7DLDuGGQKtGltui2pf+0DKxC7auNPfqzXKmwTJnBbPAOdo52EmbDguxz2yvCjioML0X2LOaMm2KCplmK7xVYFqULn3Mt8N3aUyCu4kSvHsEVhzlJWLCiI8jvDiQkIAcU2oSQzJw0DUUTM3QT89DwASNVqOEjEl+ZNH/oiyiPNTJezyS2cuTECMtibASFGjWo4QFDSfyYf7J1aVsZzDKOGU2jhwI/ZfR580wHv5kG5iJIV9RIhuD7FZNOe5pAsOJDfhn+hByefvooxyh0TfnR9+x5J7Km90MsdbhsS2ktbR0Rc/8VXT3bZuucplb3wYnMzt0LilRF/1PVti4VsWdRlmxSWjB47qKDZ0NP+k5KSWmn8aeakpQ/OmNSQuxnSrBXje6x+8Kw9xwGvv+V819LcOTgFgBuVi8bWbLDR5HakUvUksBXRMsnE5zT4y6iVlFHB0xYc5S0ZtdRUkFvgMKSkoIILQrUbtdq7GcMdTKklsm/D14oUGjE/i1+Bw9HwRIj9qNtfEilg50KJrdGWToMjmVkbc4f/e5JfsfXJEwn6PDr37J1xCLGE9Xj92AHsaZL/EQGFLW4a0DW/W39pF30TfN+JKh3QXJbiZE=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8616.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(5660300002)(6486002)(36756003)(6916009)(38100700002)(31686004)(2906002)(54906003)(8676002)(66946007)(66476007)(8936002)(66556008)(4326008)(53546011)(6506007)(83380400001)(316002)(186003)(31696002)(2616005)(86362001)(508600001)(26005)(6512007)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?ZWTq1H+e9ZBMk3rdYImRARbqPlCPwNMYzXlyAxFaRcxEIZ9x6gXiOZCSPAoD?=
 =?us-ascii?Q?OsPgBTK4966PLYXGnII1sJA7bnSotktGC2u83jdHZxApKgHNMFmDTYbkkbv0?=
 =?us-ascii?Q?APaQt+pyycfFBcNMsoy0BlhcDvB3FHraNJIARfpRCwtJDEmb4Sx1Gr7TTerf?=
 =?us-ascii?Q?mbVeBwfpXzfMh6wcP4o0IleZERSVnjbqczNjXhxIw7rphjZHjqaE7bjKE34M?=
 =?us-ascii?Q?wSWYzEJDfbs8nVACbRtH3Bp5Kd/Tei6mRZrkKrL+H4S59hKTq8hBWk9xV3gf?=
 =?us-ascii?Q?6YmVaC2IL1qLaZ1Vywlr5uNzb2QivXWLZjc32ESY+D1b9SfmDroP0D4Y2RoK?=
 =?us-ascii?Q?1+tnc83uGGdisX95zLTqY+KdXZyyhmMqUmFcPSOkcKMhCD0TwUQ0TFaMG4Sr?=
 =?us-ascii?Q?5JZ22tS8/MfHV2OlUzBn7zw5/tUysX22tJ4hMxnKgxMaZi78GYku2NizDhB5?=
 =?us-ascii?Q?OAxCnxts54rBfLFz/KCUpdwz2n6DjbMgZ96kDIEWCitAxZMwPHpmbkDFUOZr?=
 =?us-ascii?Q?jG4apMfl5NyF5zOhUL/ySEfiTRPoDnLgFG+9H4gDTG0BgN7JbdwMfDJBmz2f?=
 =?us-ascii?Q?xOqBHrrTxpDFb3ANzrCxaFpsg4i6CahRQrux0bSnUBxD7TQ5zohaVzKofwZA?=
 =?us-ascii?Q?9ujDA4NPdUYG3zWeEeyYgH8si3dtzlLQtI6yC6QkNaF8w2RBdm+9YafzhAit?=
 =?us-ascii?Q?S6IqbTNxDR4oDH+ySkr15VwpzbkKa1/x2QPNw52UP7PHZ5bhJuSeeUodmF7a?=
 =?us-ascii?Q?RguoDaIzxMFDTVBhDz8jzjB2MWa0WgFHxcIjS/5RLeVElV0h/4eiZ9Q88Jxe?=
 =?us-ascii?Q?HeL7N9kmiOQNQgPZ1eVcCoG/ooGcwzoUeQkWcWO4FasgHu7mcSiOIJaFPp9R?=
 =?us-ascii?Q?cIBNIxtJtUqgvd/vCpxNmHFwdAf7u5gH6jXzkium/HFTR2S1Q4eska4yeKGq?=
 =?us-ascii?Q?sos2W9TtgSfMwvs2i72OeGQ8sIFu5SJr1M6JMOnhCYUr0luChsYF350L2ZVU?=
 =?us-ascii?Q?ocMZVzuIpvaGb7nL25Bg8lUqIk82sxdmoPlYuEzkIFvhqOQ907cddRLpOWmQ?=
 =?us-ascii?Q?5Y57FNN+pbHTwH/Ty63QmrDtmhNE/XuvTuNVu8VZNzNN4yCJZPXGoUdR74X3?=
 =?us-ascii?Q?0zpWVDiBL1v4Kz0sKnjwZAWNOJHlgEE5ibRqXHiE06R3r87g2s/Y9N0o0sw/?=
 =?us-ascii?Q?Fz5WuFYDN5DwR93iflFZRBLJA0asRNrWcbS2907SQV6iIVpixMSW6aryIQxw?=
 =?us-ascii?Q?1veemb8k6jOvs3BgA88ITRG1GAktq+Lnoaq5dx3BLpwFXnHKG5dVRPNwKHri?=
 =?us-ascii?Q?V3F78XiaVaVSKJsKODN0en8rYFq6VANa+lhbq2GwCVNop2l/T2Gf/1WykZeA?=
 =?us-ascii?Q?tFxYBJuOK7xic2YEav4z3QsGBWpiKHu+eHbAAYtN+xZ+FVLHMLp4lwhvJVef?=
 =?us-ascii?Q?4OyY3l08VTHvm35NVrNFD7LZSG+KTJFs86tooemuFPvg5j056/ciIFup6Yf3?=
 =?us-ascii?Q?NtGn5F0WSmeyZ0BwbvmvlShZo5nI6+5zZUwSER5BhLro0VpcrWLeQ/u27slg?=
 =?us-ascii?Q?hMfQB9gFDg5SRkRq30C81WENe4ST5laQeptXuROxpAy3YSW1bcjZzDyPaPrD?=
 =?us-ascii?Q?WJiPtloFWx1Y4+z2kWmZomj4pDEcKW4gO/Rfzd1BvXkyBEPlWF5o+em5zliI?=
 =?us-ascii?Q?w8ydqTIoE9lwvRUk6Se5eG25oMw8Gy39CadmuoJJNAqvi28e5zA8ympXEoKo?=
 =?us-ascii?Q?DIkYMTs/2A=3D=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c2ab3bbd-a7d1-42dc-39d1-08da2d120b52
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8616.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 May 2022 14:34:35.1445
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2CXP3FSCnEzlTkbXGRiFAWTPbdHTJQiRK/hy0aRBzXgsxK4Ls89KYcgwOKZPHz3xsjam1Hzh93z2Uo6iRpMzWw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR0402MB3639

On 03.05.2022 12:10, Roger Pau Monn=C3=A9 wrote:
> On Mon, Apr 25, 2022 at 10:30:33AM +0200, Jan Beulich wrote:
>> Recent changes (likely 5fafa6cf529a ["AMD/IOMMU: have callers specify
>> the target level for page table walks"]) have made Coverity notice a
>> shift count in iommu_pde_from_dfn() which might in theory grow too
>> large. While this isn't a problem in practice, address the concern
>> nevertheless to not leave dangling breakage in case very large
>> superpages would be enabled at some point.
>>
>> Coverity ID: 1504264
>>
>> While there also address a similar issue in set_iommu_ptes_present().
>> It's not clear to me why Coverity hasn't spotted that one.
>>
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>=20
> Reviewed-by: Roger Pau Monn=C3=A9 <roger.pau@citrix.com>

Thanks.

>> --- a/xen/drivers/passthrough/amd/iommu_map.c
>> +++ b/xen/drivers/passthrough/amd/iommu_map.c
>> @@ -89,11 +89,11 @@ static unsigned int set_iommu_ptes_prese
>>                                             bool iw, bool ir)
>>  {
>>      union amd_iommu_pte *table, *pde;
>> -    unsigned int page_sz, flush_flags =3D 0;
>> +    unsigned long page_sz =3D 1UL << (PTE_PER_TABLE_SHIFT * (pde_level =
- 1));
>=20
> Seeing the discussion from Andrews reply, nr_pages might be more
> appropriate while still quite short.

Yes and no - it then would be ambiguous as to what size pages are
meant.

> I'm not making my Rb conditional to that change though.

Good, thanks. But I guess I'm still somewhat stuck unless hearing
back from Andrew (although one might not count a conditional R-b
as a "pending objection"). I'll give him a few more days, but I
continue to think this ought to be a separate change (if renaming
is really needed in the 1st place) ...

Jan


