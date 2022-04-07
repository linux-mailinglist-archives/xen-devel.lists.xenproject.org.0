Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A3A5B4F75FC
	for <lists+xen-devel@lfdr.de>; Thu,  7 Apr 2022 08:26:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.300415.512395 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ncLbQ-0005MG-EM; Thu, 07 Apr 2022 06:26:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 300415.512395; Thu, 07 Apr 2022 06:26:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ncLbQ-0005KQ-Av; Thu, 07 Apr 2022 06:26:44 +0000
Received: by outflank-mailman (input) for mailman id 300415;
 Thu, 07 Apr 2022 06:26:43 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=/6v3=UR=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1ncLbP-0005HB-1i
 for xen-devel@lists.xenproject.org; Thu, 07 Apr 2022 06:26:43 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b03dddb8-b63b-11ec-a405-831a346695d4;
 Thu, 07 Apr 2022 08:26:42 +0200 (CEST)
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04lp2056.outbound.protection.outlook.com [104.47.14.56]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-31-ag8o-M_EOZ6b-BL2HC6C6w-1; Thu, 07 Apr 2022 08:26:40 +0200
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com (2603:10a6:10:2db::16)
 by DB9PR04MB8218.eurprd04.prod.outlook.com (2603:10a6:10:24a::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5144.19; Thu, 7 Apr
 2022 06:26:39 +0000
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::914d:e08d:7798:8476]) by DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::914d:e08d:7798:8476%5]) with mapi id 15.20.5144.022; Thu, 7 Apr 2022
 06:26:39 +0000
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
X-Inumbo-ID: b03dddb8-b63b-11ec-a405-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1649312801;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=s/hF5cU3CbhSuiIAEiiAPiAmzxHlreCDMq5HYReQQkA=;
	b=hQd1EH4j13mzk5ougBKHPFTI4i++btYry2nfCSZJ75/HJe+H/1YPbpzixQnxWYfkK9OKh4
	ny0NAfImkl9VcDcbuzUsk3S919xM75JY3w++EdQnNo12WyP8hIuVmDg+ok3SJhKBVe0DLl
	7PfdSt7uH9HQdcHELJGqi1rFZvAZ4wM=
X-MC-Unique: ag8o-M_EOZ6b-BL2HC6C6w-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WNIlmhB2YL//iCcrCicTc385HqmFcM0in4oXNvL9qZ0lWCvSemK3c/YHB6sHq+yV38/jMPUTIOX4dOENa+AUiIg3EMVvwvuf7jH/W2VAKY/ho1ztam+QxpJimPhk0heoR7j0Bn24KqseqVZp8v537gujTL9KG3BMreL94/Je55PwUqdHKiFHpSl4E7Gtak15Is2HI+9CFb64KY1UJyNNGHS7vIdOnU/nw1o/cBz9u/Y/koDo7Zgu6Yr0YLWVSv2k9gyIzs0I4jRLAMyMeSMCYEejJOg6TaEJPmiSUKJUcfimwha37KJl/xZ/JQ0JQawv+GefVlzJyirYaviRqjacjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TC9iNGShkKwJsEptMl2ysrvbuIHZi2Ew1KNOn995Z98=;
 b=lTpDD0OCT16qLnF/aauxC5oilQ5pNHBxWRcpcS34d0EHaylyEYNlJb6ucpZuXAEFLaV+LY9mwALbyVXjRvtrjmeXNeo7drtibHSaM1h8sCVS7QUwoU/iXfnmKBzwhTLLH/GtxbPADHE/1Oja6M3siPqzPI3bOdyE1TCM1v2f1l+zFdUU3b2y8LmjACdCcKB1GDGdPgQtPE+w+5DqJKgKBb4uTmK+2JMgrbHoifBNcRFxcGgVTYcGTTJWdqljjT03ys3MP1zYDiUHjVRW2SbBBfaFPm56EV1w6bMAiOnZuSwqzfttzNVR6bd2cqFT96rErd4bVUe4vrQZbsvMNjHi+g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <008be273-8730-5637-f35c-021e67d3d664@suse.com>
Date: Thu, 7 Apr 2022 08:26:37 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH] x86/cpuid: Clobber CPUID leaves 0x800000{1d..20}
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>
CC: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20220407010121.11301-1-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20220407010121.11301-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AM6PR01CA0044.eurprd01.prod.exchangelabs.com
 (2603:10a6:20b:e0::21) To DU2PR04MB8616.eurprd04.prod.outlook.com
 (2603:10a6:10:2db::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f1d6ba9f-7be8-4062-a683-08da185f9307
X-MS-TrafficTypeDiagnostic: DB9PR04MB8218:EE_
X-Microsoft-Antispam-PRVS:
	<DB9PR04MB8218A218E563449A0BB4A40BB3E69@DB9PR04MB8218.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	KVAhFFPdgcr6wAK7oly3XU268OdyF18kEptSnXGkXsx23L9hjMkFQ4wEsgSe6eNH+M1oBfeDmdcySOKyVIVk8wIdN2F2K4cmqT6DFnPskUUYZHRJ/fJOhfj7zcRjIFBlHF37bLU406QCiE25NtHdfETZnvYBHsBe1cWNIiJwbEwCR65cmLO4hL7dNB6dh5AupPL9IFRwDA9cdeIIeXbu0tX7cGgC5f1yJJ9TUWa+tu4lA64wZ1p68X1OTPD0karvmQInUWMH4TqthgKAt3o0GSwkJ+66ahzZfsTjs7L8ZJOhEw6S1xJB13Hsd9kWphf7+lsAdqzMsu4Mn0yCC0kXE+yPp5TnsL+r3p9pLRdSHkFmHWuIji/GCXcaSIrmYaDW+CMCydSBruw+IPME8jjl0ZF+E8o9KZN1jPAQwRHwKNx1t/4WH0spDqPvSmvU5XQ9UXs8QZ/x46Zi+cf1hLo4CY1yD+TTRMpTcPntWhQCMzQ2m5AOb1O6XT8DXcj2BuNpVjsDvsUuvyFXNaG5aX+Pl1C5/jEthb9B+nL+S9D+Z41llz+lLseEepoy47zyc4a/LplT6ShyiK0oH9Hi/tEXGTwH2/iYEdsofToSDWJzT8boPl2hPcXmn3qLtjdkJs3N8xCE6Krm5x6CxUlqAJAUtWDFlvcaABUHwtF+GuS3k3kgFbj0UKtqlCQNQPmPZgJymI3Z3/W9iZ3/g7HmrpeU6MHu9x6cmNp7P+eJI1Gc4alvzcVvHwf/4uWBx2yQtH28KJ1VdotWqRjdz4UAWPfRSK+kFtGCdAPnHOlpUJr8+9auYmQ5bwQgqBp0cs8qS2Mg26YIZMuFpksep0HJEZmALt2wiPwMjYlDZ26aSZWtSic=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8616.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(31696002)(66574015)(86362001)(6506007)(6512007)(6916009)(316002)(2616005)(186003)(53546011)(54906003)(5660300002)(6486002)(26005)(966005)(508600001)(66946007)(4326008)(31686004)(38100700002)(2906002)(83380400001)(36756003)(8676002)(66556008)(66476007)(8936002)(101420200003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?tXS/+9vZKLnxeXfd+OM2ON22SyaJ99ti9FK2D1UQNsAn5FModUyJsRtoQSn+?=
 =?us-ascii?Q?mGtDLwRic9iQ5O/6m4ycyzQVFrezjfuwPfXu7tOmWDYSY/MBNUSbhpRCO/mI?=
 =?us-ascii?Q?+NQvikE+m73WPcVGicdjqn120khMRxOF5ruFlEsqb8cnaXFQiHLK7/H8ftYW?=
 =?us-ascii?Q?rqECNPoiRYXe6N+FYpm/6vD5Oxgd9GLhjL5HKEt0rifWEIaG/I2/ucvuJsWA?=
 =?us-ascii?Q?vAlAVqvCirlYt7zx/7CaGq4f8GH69oWafeeeHJylzp72vCPuP4cLmV5at85X?=
 =?us-ascii?Q?pn3I7n0vg3tTlxFhGy9IuHsqNVmjUPhqndlpbZ3ukrVMAVx3QyUYTtz3Cr03?=
 =?us-ascii?Q?98nmFqPSH0Y+6/ON1r/C3Z9tKLERZ7tyRidZODFkvR9QnlzGhJpbwcL1Cfn/?=
 =?us-ascii?Q?/GpNZ0PXKGQdFZahWMXRpWN/YS6yiJ9UjXhqU4y/ZBInGrsDFL4Y8YyVq4mA?=
 =?us-ascii?Q?7TO3VF5YvH0HMig2Ch2cFwBo8gRkn1vn0cmde4aXtdg8J5ZLYJSSM0PaEu7j?=
 =?us-ascii?Q?Gq9cIN7bbPF6bFJdAflAoQmP/Wgde5mMKL0+GoGziQFlGEUvexCw8ZNn478w?=
 =?us-ascii?Q?+KIAELBBh0s+BDAoow4oKR3hYJvr0kZtUQP/auRS4V/s10SuXTpovp9dPgbm?=
 =?us-ascii?Q?z0n8EIFQ+qmjDjFhlsEel22s0rgE3z1yZlSe/5753kA9GEdCj36DzsertI/p?=
 =?us-ascii?Q?j10uxDG1NBVwnilD5OvQcdc3YwOrf8LlaFsiHPpO/K92VOxNaxvtCk83vZH5?=
 =?us-ascii?Q?6ZtJSaj3M6lQ+aYy6BWjfpqY+/mb1+xOxs5Zd5VjyzMJy535IQ4Iym4Lq0s0?=
 =?us-ascii?Q?OTAVp9ikxNKr4b337gYIDYy/EAHRnYszuRO3jjuloaXArwYxU8mdoo3zn7NG?=
 =?us-ascii?Q?D8UT8xjotd3ogoFYA5tI5KMUUrlcYdY69VefCu4rmystdtjVFBHQggCptBlD?=
 =?us-ascii?Q?RoQjZ5vC1y7IgqrOJeU6VYMnmIYqKaF7Mn34CXxOqPgjLYfLnE3NVp+pQkaL?=
 =?us-ascii?Q?XB+N8LVsJ+uVPA7TE1kCKlxyU44oXH9Gxts15njXr3NhFLGtR8lQReFDIG6J?=
 =?us-ascii?Q?QOearrchrVC1rT72DmyxZ2MY0vDLBNslJZoQu3iZRo0OWSoXY5cZHbYvEbzU?=
 =?us-ascii?Q?sFdhlzxux7pN5o/G7wKMEwNOGNOx9kS2WyqAN2wf6dNAoBRlw+C7Mtrb1tXn?=
 =?us-ascii?Q?O6/jfnA1K9uRkeW14B4QxlJrsxwI5kpBXruNZF3mhokKqdLf125knSYVVX7V?=
 =?us-ascii?Q?YpMi/KCUQGi7gPUi0l3ctwjraoR4WFzzKRSOtbcuqthcadk4lDI7F5ANnnYW?=
 =?us-ascii?Q?wzoC4ImnMnqLLVJR3qYn+XFcvObNn9cmSH9Ev3qlirvI19NaojmRLTtCxRnA?=
 =?us-ascii?Q?0Jk1HhJ3Uk7WFcXYIeqS8BZViDrkrr6Rn6FO6qEshrjUyA9g+Bx/63O1xpS+?=
 =?us-ascii?Q?J80CTeRwhhor0PK8K+07Rbl7oqbzeiO1zMQ0Hh6OlpNM1OIUxExZJkYvOPpg?=
 =?us-ascii?Q?c3b+V3j6CZBTDIHjfor6uoWdVs4jtT8QkZRKLLq2CR55WNuD6LdEOCz5Xweq?=
 =?us-ascii?Q?/d5Y61gG52WkeSXa1T/wNZ2UY/xun+avAgjG9dcR/OZzx3vF10bFVBJongJi?=
 =?us-ascii?Q?rE0iC9j3ZqVBDMqsDMDcB2/2ef+SRTDD77PO+FuYh1m775ttjTzxUcbe8zAc?=
 =?us-ascii?Q?KJib25JTqFpgMxbXHoUY34UGCJiytziaZQKSDTiyl8BNt43Hm48I88k+w4yr?=
 =?us-ascii?Q?E5s7lzhvBA=3D=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f1d6ba9f-7be8-4062-a683-08da185f9307
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8616.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Apr 2022 06:26:39.6401
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VAkY5bWSIEhwUw+EUEnQbKjMqV7y7qwSgtDyZ79VrGQXCXrb0ov+RMe8DqfiWVU9Zj3zHhZp104JYlxW8OAdEw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB8218

On 07.04.2022 03:01, Andrew Cooper wrote:
> c/s 1a914256dca5 increased the AMD max leaf from 0x8000001c to 0x80000021=
, but
> did not adjust anything in the calculate_*_policy() chain.  As a result, =
on
> hardware supporting these leaves, we read the real hardware values into t=
he
> raw policy, then copy into host, and all the way into the PV/HVM default
> policies.
>=20
> All 4 of these leaves have enable bits (first two by TopoExt, next by SEV=
,
> next by PQOS), so any software following the rules is fine and will leave=
 them
> alone.  However, leaf 0x8000001d takes a subleaf input and at least two
> userspace utilities have been observed to loop indefinitely under Xen (cl=
early
> waiting for eax to report "no more cache levels").
>=20
> Such userspace is buggy, but Xen's behaviour isn't great either.
>=20
> In the short term, clobber all information in these leaves.  This is a gi=
ant
> bodge, but there are complexities with implementing all of these leaves
> properly.
>=20
> Fixes: 1a914256dca5 ("x86/cpuid: support LFENCE always serialising CPUID =
bit")
> Link: https://github.com/QubesOS/qubes-issues/issues/7392
> Reported-by: fosslinux <fosslinux@aussies.space>
> Reported-by: Marek Marczykowski-G=C3=B3recki <marmarek@invisiblethingslab=
.com>
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>

> It turns out that Intel leaf 4 and AMD leaf 0x8000001d are *almost* ident=
ical.
> They differ by the "complex" bit in edx, and the $X-per-cache fields in t=
he
> top of eax (Intel is threads-per-cache, AMD is cores-per-cache and lacks =
the
> cores-per-package field).
>=20
> As neither vendor implement each others version, I'm incredibly tempted t=
o
> reuse p->cache for both, rather than doubling the storage space.  Reading=
 the
> data out is easy to key on p->extd.topoext.  Writing the data can be done
> without any further complexity if we simply trust the sending side to hav=
e its
> indices the proper way around.  Particularly, this avoids needing to ensu=
re
> that p->extd.topoext is out of order and at the head of the stream.  Thou=
ghts?

Sounds quite reasonable to me. I guess the main risk is for new things
to appear on either vendor's side in a way breaking the overlaying
approach. But I guess that's not a significant risk.

As to ordering dependencies: Are there any in reality? Neither vendor
implements the other vendor's leaf, so there's only going to be one in
the stream anyway, and which one it is can be disambiguated by having
seen leaf 0 alone.

Jan


