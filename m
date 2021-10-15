Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E8A942ECE4
	for <lists+xen-devel@lfdr.de>; Fri, 15 Oct 2021 10:55:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.209966.366564 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mbJ03-0003OT-Nt; Fri, 15 Oct 2021 08:55:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 209966.366564; Fri, 15 Oct 2021 08:55:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mbJ03-0003LL-Jr; Fri, 15 Oct 2021 08:55:35 +0000
Received: by outflank-mailman (input) for mailman id 209966;
 Fri, 15 Oct 2021 08:55:34 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=FGCa=PD=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mbJ02-0003LF-Ib
 for xen-devel@lists.xenproject.org; Fri, 15 Oct 2021 08:55:34 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.109.102])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id f0b27c18-e83b-4a67-ac5d-31d813b304bd;
 Fri, 15 Oct 2021 08:55:33 +0000 (UTC)
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04lp2059.outbound.protection.outlook.com [104.47.13.59]) (Using
 TLS) by relay.mimecast.com with ESMTP id de-mta-3-zUtcuswLNzm6-lkADQC61A-1;
 Fri, 15 Oct 2021 10:55:31 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB6862.eurprd04.prod.outlook.com (2603:10a6:803:130::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.16; Fri, 15 Oct
 2021 08:55:30 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b%7]) with mapi id 15.20.4608.017; Fri, 15 Oct 2021
 08:55:29 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AM5PR0201CA0020.eurprd02.prod.outlook.com (2603:10a6:203:3d::30) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.16 via Frontend
 Transport; Fri, 15 Oct 2021 08:55:29 +0000
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
X-Inumbo-ID: f0b27c18-e83b-4a67-ac5d-31d813b304bd
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1634288132;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=OFqnTrTr94B3V0C2IJQmLJjKf3K2fOFOezVpqOUqfac=;
	b=cgquxz/qGHsyGUj764yye0wLU5P+IuNV1ANhaI7JpW9+xQawqK66GmUMgpCNHPjKMfzRUw
	lrfh7psbOJsPpQbS5diuz/71XG8PJCzqpRGoH5x/N2r0CXXwA/SY+s/3KzZVQpHNUYV5Ok
	ArGpNfXC2XDPlSSRgx1Dr7I5hpui9l8=
X-MC-Unique: zUtcuswLNzm6-lkADQC61A-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VCgY2W7nYPRMBEun16tLPOCPnW23VgsJ7FraADqDcV/KANQZKr6Nl7VX71r2tvWCn5A2wQEF8YOnxNce8KwETmUc+ByJvRxy1zCWqB/DsmjM6YZte1LM/+2threen/nnhsEvicsBkucHCp1715VbB4VTYiXGBiCN8G6ppCNjBhV1rAryw338JW/a1Azco2ih0+JbIw4QvRUNvB5jOOP0fivfDF0lR8WXvnW/s88XGNjQMFfzg7VY7O+eyiUFtPPmG91pQD6slHXFb6zxQW5slCDL6iEaoRRa6nJYbaLWAkJqZSs8dMjHk4S9yV34bV0g9xygUPQKAWiUsj7bZeBmCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fnMkFGoim2tKIuA4770PFfPAj5poJOwKX5JlA/NuywE=;
 b=OWAKleaoha9hjHBmeNDEAtPxneBusV6JK7hP0pPjxYcH+OV+ZBFaies5CZFQfKYSsyGOwlu4U7JAc//m7UYBvTL/k7AXR1EUFuYKY4Go5KwEOG55yVZ+BzpJEdgGlxS25Q0v8nQjlX1PzLuRn0Mw/lUqGpv2idU3pOUhzbcITjYvXRDaNpJe9+7F7PawgdyP3Cskh2m1QIlfnEh2Xy5BoUri9nQZJ8+RwoQI1tRnVMbjg1ztIyitQdMdOd7gViUQafphHlFt0X5hm34DFAb6dVAXif0FXuprT3dcsLnKgsADGPLzNh1qkVVnghkB0unb0lxLH54cDbrtSMsWicX7JA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=suse.com;
Subject: Re: [PATCH 0/2] x86/shadow: address two Coverity issues
To: Andrew Cooper <andrew.cooper3@citrix.com>
CC: Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>, Tim Deegan <tim@xen.org>,
 George Dunlap <george.dunlap@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <24329000-06d7-2047-b0a1-51b149d19189@suse.com>
 <ff9639f7-a853-7755-0d5b-5ccf21877cda@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <b22dc240-aa22-de03-e837-0ba82ca63312@suse.com>
Date: Fri, 15 Oct 2021 10:55:27 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <ff9639f7-a853-7755-0d5b-5ccf21877cda@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AM5PR0201CA0020.eurprd02.prod.outlook.com
 (2603:10a6:203:3d::30) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ca9e0b9b-c498-4c05-63ff-08d98fb98a16
X-MS-TrafficTypeDiagnostic: VI1PR04MB6862:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB6862242ED1BC4645D8C25BE8B3B99@VI1PR04MB6862.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	gKTja0RvbICXgEKtuikxTBi1KjeUJmEWFYQksF1CeB8XUgFLLAtsG14ZcZIOLxgky6S/qXiidq50H1eivpckeqqGRIhPuLFhdmFAIe4ApLtVJAPd5new27R0Pj9YJw144CE1Wo2Q8iofdV0UJ9jnAhVUt3pwU1P/TMlsbdgXd/aCPTOFGHnsio0T1M3NXSknruBbzyLxlVI8nDRo/pPKg1SvGb229Btpub7m/EFBRj8ZSmD7XH1b8OcFvap9xyP8ehlteCJXsc0OlGnGKUdhbhWQHJrDy1AT1iydnT6WzSzw3YazlhDgUxOXNh48RrBHWV4HWrNzsWuk/NGEQoI8MSaQq7kMJqEHYlMMZ3cYVYgHyPC5HpxnD8xTbvIruQ0m/x180Sa/LzhBcZhMT8B2GG3x8hQV/5ZW6RgVUNzjOIRIF9QGOqZ5VjGkZnMSGjcMPYxmeU8hfWyat4+eA6pGbeQxo5b9QPhNytqW53GHwaisfInhskkyo/AiXSokJBpiRwKhJN7rf+B3SP3zxpDkGTgpsx+435NF3PsvGmsRwyMGU5oZ8afM+BvNkdloDl9WwHiSBD1Br5iLY4EcXY45I4IHUWY9NwKXpvIZ4gqZI5i5WDl1q/5U2RUQuoTMBHjUcvkL6WRXP56OnmzEeV6VIqaKB6rhxcAvqWQT4hpRgFvlLLBrTPt9rrptcLtvvERMSxYhMZpmHA1JUa4aaOTmTG8pJuYuwlMSf8k9XMDYZG5TqyBryDmpIqDs8pPIrJjT
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(956004)(66946007)(66476007)(2616005)(8676002)(6916009)(66556008)(4326008)(31696002)(5660300002)(54906003)(36756003)(6486002)(16576012)(316002)(86362001)(31686004)(8936002)(2906002)(508600001)(53546011)(83380400001)(38100700002)(186003)(26005)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?27mAw6JVv61tdMDWNXg5J372iTzOoutmgnSs2r4S2kZWGsvKNItxLf/01YKg?=
 =?us-ascii?Q?SshaQQYNwWDWLNbiUxzYXMKDmklja1e510LOE0Cf/sAhdu4pUM1t1kgqyBtq?=
 =?us-ascii?Q?jF8RCC3+MLicFO78bY2WIY875f5+nSso6GN/do1hdJyxVA+850mMJFI1jyIR?=
 =?us-ascii?Q?rdFVJ3Z+vIbhkPd337Q+uXyoPGndW8iEiFxC9nURbbO8LFTFzyNBM00vdj9n?=
 =?us-ascii?Q?Hh2Llf0lX9nSVMpCKvCpes/ci4xTG5sxPbx4/CDcNh3XOY8HEWmi5g6dcqh0?=
 =?us-ascii?Q?1ty0DXqbIMYnZmYqgRXwkoYClb8UjuEDhm0z44Yq7QePsyZaGZI/4SMUXox0?=
 =?us-ascii?Q?ndp/ZHWwGLBwuNYnlK0+nOtHXeiPgXG5BZglmmqyxe4suC/YNd8C6/XOesRk?=
 =?us-ascii?Q?f6IIutvsQ7IBcYW2VgbVO8K9sAA5wgClRfJXcYILisnuI89rtBfumJ89gB5i?=
 =?us-ascii?Q?e7TMBbFhLJSU0YDv3mUKfqqNeLaT9DJ4giR+y6XQ8hzj23R6NtvOVemzb/4t?=
 =?us-ascii?Q?wvJK7QeJkf+Q/oa5bwQHb8UBsdVZmdUl0GisdskAlEy/BUbMPEWHbh7RuvJF?=
 =?us-ascii?Q?rcL5c4n3HZ3NuGaKd+GMFc24U0hS8kuiNZEwfn8j9rutBg61rp1YFfsJFg+P?=
 =?us-ascii?Q?HYLf+Z6gELszLqIQgBW824AMbVSL6sHxy2LjkuzIWMzC9Jtyz9bcliGtzRAz?=
 =?us-ascii?Q?ywox1dUhIau8KIMp56WIQ1lMuVCWkmFyd7ZoJoAc1vxpTKC3o5/9NTv8BE8e?=
 =?us-ascii?Q?YxnO+qtdmpflEwwzu018Vh9v1EsOm+iyYM4tyxa9qZVDCt6j6TeGPBbMVEwF?=
 =?us-ascii?Q?PCg20jYxzr7PpMu/EZs2+rf2R85BAQ3ZNffXexm46Lp5Dtgl3UO7EP0kKo89?=
 =?us-ascii?Q?Fox8uwsRcAizrLehkfmH00WMvpU3CBC+S9BVOk+BKrnVRb1O0k07IeRYRTCP?=
 =?us-ascii?Q?JQr2mdojDQkPhifpxSSJDhSCJ20YYChJp4Eu2lOYaYxiIKlfWi475zViRtCX?=
 =?us-ascii?Q?wwMmNvnqWLsCXLiqLivYrMv5zyIGpZZensiiZc8EdZYSBcPmY+O4p66WoTOd?=
 =?us-ascii?Q?IKdvntWMgpxUOKtQMEaU0hFXoIYICXs0XOd9QQv8/qpeqKGYsVKB6fhbC/Xk?=
 =?us-ascii?Q?9AS5FJWIi3yXGNEaWVu2I8BH2Odg5PQrhzAZX5J4VYbP07ii87Tk2G6pUsR2?=
 =?us-ascii?Q?jL1Fkuyct5cRkd69BKE8vtsztzVhXIyZFTLJQMgK4rmhZ6o7dYDhlp0mGG2M?=
 =?us-ascii?Q?AT8iSIZzWnIJBMcgf88AQ0R56Sgw73GfwDEAe9mQLdJ4QrMiU1dHCtNBJ4eo?=
 =?us-ascii?Q?PeanQNwYVJ5NR0ISx6syw63Q?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ca9e0b9b-c498-4c05-63ff-08d98fb98a16
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Oct 2021 08:55:29.9220
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3tneImEJWYh4E3H1UIn0XGtkZic6JxCLoNPr+QkiMSMSDdU0WiT7CuTtfnty2bv8+Eo7SQxZW3nBpGi8z2XRQQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB6862

On 13.10.2021 18:10, Andrew Cooper wrote:
> On 13/10/2021 16:36, Jan Beulich wrote:
>> It's not clear to me why the tool spotted them now and not before,
>=20
> Several reasons.
>=20
> The Coverity backend is a software product just like everything else.=C2=
=A0
> IIRC, it releases quarterly.
>=20
> "If something's free, then you are the product".=C2=A0 The value of offer=
ing
> free scanning of open source codebases comes from us (the free users)
> integrating a massive corpus of code into Coverity's system, upon which
> they can evaluate the effectiveness of new heuristics.
>=20
>=20
> Second, and far more likely in this case, "x86/mm: avoid building
> multiple .o from a single .c file".=C2=A0 Coverity has always choked on t=
hat
> in Xen, because it's intermediate database is keyed on source file with
> latest takes precedent, so we were only seeing the 4-level case previousl=
y.
>=20
>=20
> And to also answer your question from patch 1 here, there are upper time
> and complexity bounds on all analysis, because scanning is an
> exponential problem with the size of the source file.=C2=A0 I don't know
> exactly where the cutoffs are, and I fear that some of our larger files
> never have later functions looked at.

Thanks for the explanations. I have to admit that I would find it helpful
if the tool distinguished new issues it found just because code previously
wasn't scanned from ones that were truly introduced anew. For patch 1 here
this might mean that the report was previously put off when reported
against the 4-level case; I think it shouldn't have been ignored, but
opinions might diverge and hence there might be a reason why patch 1
isn't wanted then. Patch 2, otoh, doesn't have a 4-level equivalent so is
likely to be wanted. Unfortunately your reply didn't include an ack, nak,
or at least a vague indication towards either, so I don't really know what
(if anything) it means towards the actual patches.

Jan


