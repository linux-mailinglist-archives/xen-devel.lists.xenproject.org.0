Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A1AA14D1846
	for <lists+xen-devel@lfdr.de>; Tue,  8 Mar 2022 13:51:02 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.286817.486475 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nRZIU-0003bi-DE; Tue, 08 Mar 2022 12:50:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 286817.486475; Tue, 08 Mar 2022 12:50:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nRZIU-0003Yz-9o; Tue, 08 Mar 2022 12:50:38 +0000
Received: by outflank-mailman (input) for mailman id 286817;
 Tue, 08 Mar 2022 12:50:36 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=KW+D=TT=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nRZIS-0003Yt-LK
 for xen-devel@lists.xenproject.org; Tue, 08 Mar 2022 12:50:36 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 589a358d-9ede-11ec-8eba-a37418f5ba1a;
 Tue, 08 Mar 2022 13:50:35 +0100 (CET)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05lp2105.outbound.protection.outlook.com [104.47.18.105]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-24-vATR96WNN2aNRBwzcqpWtQ-1; Tue, 08 Mar 2022 13:50:33 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by AM4PR0401MB2404.eurprd04.prod.outlook.com (2603:10a6:200:4b::26)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5038.18; Tue, 8 Mar
 2022 12:50:32 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::d479:b728:345c:bd65]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::d479:b728:345c:bd65%6]) with mapi id 15.20.5038.027; Tue, 8 Mar 2022
 12:50:32 +0000
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
X-Inumbo-ID: 589a358d-9ede-11ec-8eba-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1646743834;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=7SblrfZY2acWsqUY/KahSUzXx1gRY6ivrQqQpdsqMms=;
	b=nCkpefFyKx7YN5DWxJUaYQTwhcJfAd9AFuvTxB347Abkad7icGa8aP3QhHLOHWQ9MXdduD
	KFULR8wMbx1am6HdDW7VPTCCnfZvZUGOSrL27BNFphAdawaX8DG1c2Sv34vf2bZDG77/kv
	Yz20+STLrJdZge13TBC6ufN4B8CbFG0=
X-MC-Unique: vATR96WNN2aNRBwzcqpWtQ-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XUXO6Z1K5q12jN6ITC4BonkRV2iUcE2+zgk3pR9mIqtFM2WdPRKMwaxjFNyeUVXFknW1yu9tWcv8UtyBNFBRF6RrcBdU/WWLKGBTd36A7P2rvR7ldX6AXKz1dV21i2SAMTpA4ZXeF+z2d//uBiml+RwmbgZEhBgX0vdGZp10QD9CryCGEOnCK0/Okhh7/YbBTjkcnucccIYO45ZNXSIYO6AiT4JHBYOca97SG7JDFTILVVqCsaZrtyYtzemdbj107Ab7QHzV+I+i/IxA3UrNbsJ3khe6XjNgYyRn0ezrpCnFEsYqZnPpahHsR0hBuoV6nva0i1o936D7HO0YUYn/0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=43TsMcYIYFxlhUVO9Ze7uUWegEX8/4VzMzZawsv3Cns=;
 b=E/xlEDNh1BfDla6YhnpuJP1YBuN8LQVtKE5wh4XtGBFFhXBky+Pw8qSS6WG9MpW0jwxuTMkvh7S8N1mIoSai0Bid8IeBY1t/jm3MqQcC7FCm4uIwqqDbYCf0EdIzErmgIgh9x42sMWZnjDd9iczYVjrztiWJpaVj3xtT4BqiNHilzRNtRAAMUnxzYY/xWm466TUdx7x6V42ZzdV+uRKS2wkzvidOvOGotExQhdCgzfO2YcxcvBJJBYHUE+sButkPNLvxGKurlm2JpyKpKkVXr9VnpaKyf/p7QwM3qQgVFzLieKWlf5maJDS25/rKYQfB5AdcCLFZ82tgDbmZbSyNeg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <cc6c9782-fff6-1832-0c25-d8fd38ed1c1d@suse.com>
Date: Tue, 8 Mar 2022 13:50:30 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Subject: Re: [PATCH v3 00/13] xen: drop hypercall function tables
Content-Language: en-US
To: Juergen Gross <jgross@suse.com>
CC: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Christopher Clark <christopher.w.clark@gmail.com>,
 xen-devel@lists.xenproject.org
References: <20211208155606.20029-1-jgross@suse.com>
 <0ec9f176-1108-e1ac-a250-5ab9d151f7a8@suse.com>
 <4ac7c2ad-a600-f817-3b69-af0c1a47f4ac@suse.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <4ac7c2ad-a600-f817-3b69-af0c1a47f4ac@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AS9PR06CA0341.eurprd06.prod.outlook.com
 (2603:10a6:20b:466::14) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c4b7e7a5-04e4-42b0-52a9-08da01023b3c
X-MS-TrafficTypeDiagnostic: AM4PR0401MB2404:EE_
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-Microsoft-Antispam-PRVS:
	<AM4PR0401MB2404DA7AC4B4642770DB57D0B3099@AM4PR0401MB2404.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	EeRayK+2jKGxHkjeGZ+njVidkEfDwlSIFo7sLX8rrusj4hq1f8VzGJaSBCUH4JBUJE05nsciLK/kMnzW+TRHwcf1wtUifDwoMLY20LeqQntNOaVqX8IS2DrG4PO7ASJJ4UCHpDoyXGJ/N7VMNzERMdAxIC4Zn4qjm+fq7NUEm6QKNb2bsvI4NM5k5orbBSnPbvEicKeWZ7purpIdwvWZMPbwAnvY9unJ/2MxemgBEIW0yIklAxucMMktE955JX0yXcXcjJXoWFG27dfrc/rB38/2Rb3QxY55LzPcGG9Suc1jOnrzYfafLBcbknCi+UWxRLtIga5QbEMYZSAP8swI1VEiwwMCq+G7VZs2hZxgP5djeFNWyRVmqGVbS8kmQYew+Y28V5UrvqYjbHhku4Qd8L8H2iTgMJX/A0FxEe1M5T698TWpPzo3018tLFiewgQ1u12nzCqz7NDk6Ubitz7p1Tgd2W66I8D14GVKvRhVK7X5dIgm9cOevktLP13NB1G6r8/WIhD0PtvF/cqb/9Oi9WNTaf7lQ97mRpLwW7TsHBX9JLkGjRx+T9UguxW/0+u96yWGXkfCWKIV6Fk2UfkHg4z9LjMo71lrTVVcMcnVDoGFkxr3vHAUT4cdYfNS9EEAuEv4yiET8r6mwwtRqHYeRDXbPhDoc3AVAdeVlzbl9tYbPUUMkBNAjEsuhFLKsQKHZnPZXSWh3PKElU8GkKhirK/k1BUW3Q2rjjLdlVfOKX8=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(6512007)(26005)(186003)(316002)(31686004)(6506007)(5660300002)(8936002)(7416002)(6486002)(508600001)(36756003)(6636002)(38100700002)(37006003)(54906003)(8676002)(66946007)(66556008)(66476007)(6862004)(83380400001)(66574015)(4326008)(2616005)(31696002)(86362001)(53546011)(2906002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?EmHMnMtjUPc4PPGbSNrmDAitf4Yhyvl0VLbKOM5L5O3YsIRsw0A6Y+Fg4oNb?=
 =?us-ascii?Q?CnudSjTn2bCTZ/vxEuqU0ocYZT4pPKwHxEl7axXDoSsOnkBj+Dof6wIcr2f/?=
 =?us-ascii?Q?l0Afud5WUzwJDcANm/w5RKB+ZympTmONl54n5aghn+3XGV0KSGrtTi+vEkfm?=
 =?us-ascii?Q?Brss4CCGKFHr6yQEXWhc7rwKavyoRhT+/ALynjGxLHmbgghDJjbjOOwsp9OJ?=
 =?us-ascii?Q?epDlgjV4XsTdNccS11nDckmUbNJ35vItte7icp4N8mf5K2ufawGpZNbkgnRU?=
 =?us-ascii?Q?lI8NT5TQmarbVKK9qWIRgVGeAKAP5UNwlRH0MRGIo4GaowsCw/OnjlALe1yV?=
 =?us-ascii?Q?gZCFDBZ+hNKhr+q1aDk8aQL7uVH8OO4CmHTdcyE/20/i/yrt+YjgZXCUvvPJ?=
 =?us-ascii?Q?PxSWnrLC4yzg2QNnOeRN9h69tMfp22urqgZBwr49fRuAuKIHFBvKtdtLGO2y?=
 =?us-ascii?Q?k6FLJ+JRSuYbvYD+tWCK50vCiPJkvxLNrXJrvKwGTjBGLN1sjyiyGfWTxKR5?=
 =?us-ascii?Q?evch6QvCa0Ydx8lHRZIRw5bDxllyCTvVcxXUF4ghRwCkMZHyuLjyP7FD4rwS?=
 =?us-ascii?Q?2qQjBlzBZZZ3zuexhNgam1eC3eGPr4/t+oxISqfqd5/WhsDW4/dnycZweZCY?=
 =?us-ascii?Q?j+74MNfTnZgQZlCjHkwtZfJ0uR+/AfBTDn0m6Z0pb3MSdmR7+iR3WId6Rjbd?=
 =?us-ascii?Q?7hbslQq7wsxXjjERk+tz9VdpkL2QS8kFYCXMMfy91ZQGZP07V3U/lVim7B22?=
 =?us-ascii?Q?ciSXx3qIz2KbtYLY37X1kheDUaHzwrC2C2h7yDisOe/9COOQqCPeRvQJR5H9?=
 =?us-ascii?Q?BIGjDWHo8PMRmXUKBwol3xe4zq0/dWV39y5nPT5H8cQ6cfkOp40msIdozYu5?=
 =?us-ascii?Q?ND3VuhFTWlzmiCaRJeTzFi6LSjdmhM7ErQkp7vL0lsCCyJan8CemQ8bDmpTm?=
 =?us-ascii?Q?YkT2F+IIL/4hjz0AdIUhs0JNSQ4wy7Snte9VmNcPhc0O9EokUZ+2KlIOieuG?=
 =?us-ascii?Q?tl0CfFJppqDqvBWAPvkT46Qg8G7wUJkW244cHuRsatl9STsmdjCyLJkEbkNX?=
 =?us-ascii?Q?mJ1dWSjWAj3r3bwialT0DT/bnvuzsvPdC2j6158uueETsCE52BWOIwQDeaj+?=
 =?us-ascii?Q?jb6kCSdRVNCGkG9E8yQxfZSBTkbMMFLjrX+g41HqoZI0A74tDsa5oX1cTGUY?=
 =?us-ascii?Q?CjffgdwBDKiKaVxl4IZyCSKwkQEqJOmuYEbQSZxznpsEgfntwgRsOhbw3DLw?=
 =?us-ascii?Q?8tfqQ7Ghd98AkzMsbAOU8oyxfHmpJVsmGQgwn2b5bm5u1TzMzVVskvRpybSV?=
 =?us-ascii?Q?7ZD/kkax9gupnMv+kBFV+Yu7FwwHlxcMS6fq2xXUspis1Mq1IgSkz/0oO+3l?=
 =?us-ascii?Q?v9VOA9OOMESDkArvNTInIfwtyrsKzxgScSO67eQ0iV8OuNy8kCPUmN11OttT?=
 =?us-ascii?Q?O18A5GtJSA3vtqo8PZXN7txQKN8V8Pr/K507vi+HsilKbe7ShaeC76ijb7dD?=
 =?us-ascii?Q?2zjHNosFi7QT6lJMedAiWDHIxUBDhWd2C/XhKQ7lFFZ2zIZtnx6RC6JZAHoY?=
 =?us-ascii?Q?qbktOe7Hnp3sPRQ3VoyhNpkhsYu2h2w/+RpJ5iG2B5M6Hwrvcgkbllsv/PSa?=
 =?us-ascii?Q?oT3npSxOxnwu+CV0tx7N9Ho=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c4b7e7a5-04e4-42b0-52a9-08da01023b3c
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Mar 2022 12:50:32.3280
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ST0a9Dg3MvGWkkarn5spYTdpNbi5xzsPZrSPWaCo4IjwHMohdqAsfqYfwz/h+TcQXWv1uy8ujFpDYuO5pP+VVA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM4PR0401MB2404

On 08.03.2022 09:39, Juergen Gross wrote:
> On 08.03.22 09:34, Jan Beulich wrote:
>> On 08.12.2021 16:55, Juergen Gross wrote:
>>> In order to avoid indirect function calls on the hypercall path as
>>> much as possible this series is removing the hypercall function tables
>>> and is replacing the hypercall handler calls via the function array
>>> by automatically generated call macros.
>>>
>>> Another by-product of generating the call macros is the automatic
>>> generating of the hypercall handler prototypes from the same data base
>>> which is used to generate the macros.
>>>
>>> This has the additional advantage of using type safe calls of the
>>> handlers and to ensure related handler (e.g. PV and HVM ones) share
>>> the same prototypes.
>>>
>>> A very brief performance test (parallel build of the Xen hypervisor
>>> in a 6 vcpu guest) showed a very slim improvement (less than 1%) of
>>> the performance with the patches applied. The test was performed using
>>> a PV and a PVH guest.
>>>
>>> Changes in V2:
>>> - new patches 6, 14, 15
>>> - patch 7: support hypercall priorities for faster code
>>> - comments addressed
>>>
>>> Changes in V3:
>>> - patches 1 and 4 removed as already applied
>>> - comments addressed
>>>
>>> Juergen Gross (13):
>>>    xen: move do_vcpu_op() to arch specific code
>>>    xen: harmonize return types of hypercall handlers
>>>    xen: don't include asm/hypercall.h from C sources
>>>    xen: include compat/platform.h from hypercall.h
>>>    xen: generate hypercall interface related code
>>>    xen: use generated prototypes for hypercall handlers
>>>    x86/pv-shim: don't modify hypercall table
>>>    xen/x86: don't use hypercall table for calling compat hypercalls
>>>    xen/x86: call hypercall handlers via generated macro
>>>    xen/arm: call hypercall handlers via generated macro
>>>    xen/x86: add hypercall performance counters for hvm, correct pv
>>>    xen: drop calls_to_multicall performance counter
>>>    tools/xenperf: update hypercall names
>>
>> As it's pretty certain now that parts of this which didn't go in yet wil=
l
>> need re-basing, I'm going to drop this from my waiting-to-be-acked folde=
r,
>> expecting a v4 instead.
>=20
> Yes, I was planning to spin that up soon.
>=20
> The main remaining question is whether we want to switch the return type
> of all hypercalls (or at least the ones common to all archs) not
> requiring to return 64-bit values to "int", as Julien requested.

After walking through the earlier discussion (J=C3=BCrgen - thanks for the =
link)
I'm inclined to say that if Arm wants their return values limited to 32 bit=
s
(with exceptions where needed), so be it. But on x86 I'd rather not see us
change this aspect. Of course I'd much prefer if architectures didn't
diverge in this regard, yet then again Arm has already diverged in avoiding
the compat layer (in this case I view the divergence as helpful, though, as
it avoids unnecessary headache).

Jan


