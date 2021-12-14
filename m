Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B19B24741CB
	for <lists+xen-devel@lfdr.de>; Tue, 14 Dec 2021 12:48:46 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.246629.425330 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mx6I9-0000VD-Ju; Tue, 14 Dec 2021 11:48:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 246629.425330; Tue, 14 Dec 2021 11:48:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mx6I9-0000TB-Gp; Tue, 14 Dec 2021 11:48:21 +0000
Received: by outflank-mailman (input) for mailman id 246629;
 Tue, 14 Dec 2021 11:48:19 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=pVj/=Q7=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1mx6I7-0000T3-Ml
 for xen-devel@lists.xenproject.org; Tue, 14 Dec 2021 11:48:19 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id babf688f-5cd3-11ec-9e60-abaf8a552007;
 Tue, 14 Dec 2021 12:48:18 +0100 (CET)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05lp2107.outbound.protection.outlook.com [104.47.17.107]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-30-HzB61-XBM0W81qC_G7eLdA-1; Tue, 14 Dec 2021 12:48:17 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR0401MB2605.eurprd04.prod.outlook.com (2603:10a6:800:57::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4778.17; Tue, 14 Dec
 2021 11:48:15 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe%6]) with mapi id 15.20.4778.018; Tue, 14 Dec 2021
 11:48:15 +0000
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
X-Inumbo-ID: babf688f-5cd3-11ec-9e60-abaf8a552007
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1639482498;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=BugTkLTEJlKSxiIgc+A8/d8cFrXcOUFQgSoTo2Y8818=;
	b=Lhatn6esLwJSFd4HYgMlYPEMstxbO3i80KwsucWgGLZBNJIGDkmMWQTfJAvtJzzSg4D6gQ
	QFr35vtcMN63Uy5et5C+7jiHA77OObGy4TfZMlZJOPdHaAnrDQMgq0GUGYX6oEv/zlFXFK
	x9RFATepK/l6YbdZLhEg3vzu/dJ7aa0=
X-MC-Unique: HzB61-XBM0W81qC_G7eLdA-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=frW9FvbfUyxc5QuRRwMwPjpsQmRxeN0doA3VrkWeuNa/APIspT6dQLeJLhc+bPlK9AMA4IOWZG7NwkuoCsa4AyzanvJ5NljIEFINwLzsuPrBZ9QzAXZVPhk0uTFtc8NIXyvvUE5dhN+w0DJS4GbWJI7EqdtZ3XappazlBrKCzWExaRPXuKDMDqmUuVZNU/66TO3Cd6YxHAYGyepGQxG9BIQlRlcZkwSe/xy6wg9qtvCQqDXktOshm3Xn/+TVIrhqRZeq8KmPkNdWFPuKoy2qdh+1BaxeH8waq+ERfXQPkogOr3zSgYNTTkQE3JnLY6RhjfBV1E57Ftys0qbwJ/JZGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8tD7mjhLgKjpYmDK84hJGLgP69zuLm9AE3WnkKlb3PA=;
 b=H5X056fsDlNYU2vmR2oc32OIptpT+s4CEmAxYiYLYjtKwZ46CpNONZ4107uuFmZkejIvT2ygPXtbAEcHC7sHyjegmNO76pkrBc/HT2v2YlXgrgYCeN04tMBMJvvoWqRyKGgueHrByi93gI26/mKd+XTC+FwVQIJtB/yPhxD0T7rvo3Hh4qQbg3umKuzY8eNXcdSKhMl6MnACXPjcsLVCCwKd9w+jjmzzBNig2zkc2Kt01+9hV60VdTHefTOyTzj2elHXN46l3iaIrg+ZnI0bVAWziYgJujuwkEuSRGv0FBhjHu/CPuFVvj40tZ/S5hykNAYI5uc7CceukitDtIe3yw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <ebd3797c-fe3b-abcc-bad7-7abd5fd5fd2f@suse.com>
Date: Tue, 14 Dec 2021 12:48:13 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH v2 15/18] IOMMU/x86: prefill newly allocate page tables
Content-Language: en-US
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Paul Durrant <paul@xen.org>,
 Kevin Tian <kevin.tian@intel.com>
References: <957f067b-9fe1-2350-4266-51982f09d3a9@suse.com>
 <2656844d-47cc-70c3-d7ce-7d83967d576e@suse.com>
 <YbdsAy0huMXBjJe/@Air-de-Roger>
 <265f07b5-03e0-a8a1-a665-1fe35436f7a1@suse.com>
 <YbiC2m4d+2OvK57J@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <YbiC2m4d+2OvK57J@Air-de-Roger>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AS8PR04CA0051.eurprd04.prod.outlook.com
 (2603:10a6:20b:312::26) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d3a58d64-78a5-42bc-fc29-08d9bef79d1a
X-MS-TrafficTypeDiagnostic: VI1PR0401MB2605:EE_
X-Microsoft-Antispam-PRVS:
	<VI1PR0401MB26059FA2F40C086B1FE1DECDB3759@VI1PR0401MB2605.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	0lGjKfHPP6Ate4Whv879A4w/UbzbIh6T2NX4NAEGnY0otC74jogOEGV+r8MzWMsU2Ww2qPpVBYnOWp7DcitWU2sED1YN8Uh+PHtIrpVdSbfNTYTKq41j3AlYgx/Q6Qb0bq3hacPfHOUahrtD19+20Ug4rKlujn+wm8HPgjYrRdQZ3J5C+E1nNQJfxkcApIhGxHZjZj9bGw0OLIUaYYfgJEMScUSoJx80zKqx0nGmgQWJTRqtXcTCqc4kA1btuI+F5Nlzce7YdG7NhNxnzJnlWjfcs84168UnjFYiFOBwiVDqQOrJnYA6JxPYbegYTmH1pUGmzBMY/HKOgewkkVhh9TF6GdaTMYfD6DfkmpxPh4ecYqvpGV5oYwweuNaY4klIiZJvMOZMCiBKx7pcYdExm6Pi5uG6igaFC2/HgmQ4xI09TjAYeCAXoA8PUB5JFSlGU/db1A3CANTPUEJu+z7qJxMuZNWWU5Wm6Q/tOOyMjvetC9yUR+HFUYeTOtvYDHeHEWh7cexYxux/EPhiQm7uEG/cJ6XQbwbJxY1m/a2DVRSRe8Y2O2NGalUUz03fxX7gNZxKiwFoJ1E0ib5UDKaboBStcXHKOCeGGumP6EdMIcDM1w6o2/MDzbn1iHlbiS5RO46MGC6oqLBWH5vS6X1VZ2BnvEDi1do9cB94OOpkGkAS+zyySRBSU5GatsQQ3qauoXsRKhoEI4E6j+MmIsClsEh+HP04LlJFdDTgJZjcHtI=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(6506007)(53546011)(36756003)(2906002)(38100700002)(8676002)(83380400001)(316002)(6512007)(31696002)(508600001)(2616005)(31686004)(54906003)(6486002)(4326008)(66476007)(6916009)(86362001)(66946007)(5660300002)(66556008)(186003)(26005)(8936002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?APErmRyeBvRZUENliOdSJnzQHcikHkJOexIGeSbfuNFb3CrwUaGiHGNfbiR5?=
 =?us-ascii?Q?PyJreLtAqf6HYubGc0Ttav3v4z1cWa0BPc75QzyBS5iOgSbAlOmrECSta3Dl?=
 =?us-ascii?Q?N0FWpNgrrSYooLo4YFLSM57s8nqvhhbFmkqDOlh8xQJ3NFEiawp908FTZrII?=
 =?us-ascii?Q?2K+SpD7UMiWMBE36FURsR/VzCXFInYdAUDdekx3iB+p+GcmP99oveTVVrW/R?=
 =?us-ascii?Q?Tl/ZgI1alXyejQyvtS6plLrZlV3XOWCXdpFdgV7xdVovDqwdVOT1zFkM6+Dq?=
 =?us-ascii?Q?9lVfn+UKRZn2VfEMVUjaA3SLAzC6gnl7HdNRfURTaoGDCSCgkgw8/Ps9PVfJ?=
 =?us-ascii?Q?PCbYzS5RURSynS0J6DodnAnhQm8XlP8ZNkFKIrcODaXErgOcd8757ot2yfYY?=
 =?us-ascii?Q?rC2DUlW6wVT+Re7QV6FzyWs2OTMcJlOLeZc2O21q0tY5aPdqK93rDwvG5Own?=
 =?us-ascii?Q?Nhch5F4DY5k2arMnJ/XIvP612OeHj4tsanGYdTmJis75d91IRdiTjHzA9IqC?=
 =?us-ascii?Q?pA7Yeo1v89Jx/huGZNbkBKr0rs4nSkGp9XT7/gImcJyGZMTosj4abcl8cjR9?=
 =?us-ascii?Q?5k7z6o5nmVQP7YInoJ/LbmATsyk4YnJyUvF8Hl63wJIAU3uoSJjHzb1hWqpF?=
 =?us-ascii?Q?LXKuwluKEs/9MuJlyHv5RZHqd0uopop4hKYHEG16jerRv6nlt8duIYDYXexl?=
 =?us-ascii?Q?5Xai8MhsPe69fGDeW6ho+02ljrQwlLZJouKm6W5RrCNKadhzusYT61mUIQvR?=
 =?us-ascii?Q?JU9CX4VyJilDdl/xZbcbr37q6f94lNTY9XILnA9SrHG7UGCtkFixpsa8Iafn?=
 =?us-ascii?Q?4f2IYKOPH0kbXX81poMh/8dJg+j3sWyi5gX2zq72FNoqHOG775LPI7/f3beo?=
 =?us-ascii?Q?TqxzYvSbevKIcf+reDY5NO2kX5jo23KfUOSpbyDP661Wk1qxanrKqU+i/a6A?=
 =?us-ascii?Q?E+pISH+TWoHNbOg8Aot5WzzzZ9kLqeTaJE71Oae6XsNOvnGbdRmA2Zn7BpRw?=
 =?us-ascii?Q?VjL4ae+eRGS0D/gUs4j+1p/7aLCcJf/CxQXCM2OeQEI4AC9CQjoKSkvvIdDB?=
 =?us-ascii?Q?0t7oO5MZ3ODGD+Sr58RmvJ8S9NGlthX3yjQvi75If6qIQFAWbB1Z6YKOGGxk?=
 =?us-ascii?Q?1klzo3m1/3w6EUXHyUGEiYDlwE+n2Zs/vt0V2ZMvH9YS3JX7LDnI9mAyCrKk?=
 =?us-ascii?Q?3Vt0Rvwkw2FT4eV30GF5KI56f1aICKwr0eU6ee58f8RJm15qM+KE03GT/noK?=
 =?us-ascii?Q?FdNaKRYugz5or0GBBWpQsi3Nkrg5R9f/Dmuw4ai6BS4XT6GwDHqQXllyIQNK?=
 =?us-ascii?Q?vQ7zJXbYR7AlqKjGGjgYWCF1Eto1A8dL4ay2avYi9ug8jtsWH8M1bMr6gzZx?=
 =?us-ascii?Q?NCKkB+wy5XEN3oeIWXm84b+WfI+KZVAHlyBshX3PYTnOihO/bJQxn8WBdbtB?=
 =?us-ascii?Q?neXQaHat9ip/cjND9EAZCm6ZJ0W+tA/kJiSG0DGNWTz9oj1lHLsjBoYk7KXA?=
 =?us-ascii?Q?yMKQYM7kc0b60JIsb/nL7ujCHOh6MInFjIvFpxyjV73tcA931/wi54/VjTGj?=
 =?us-ascii?Q?UyIClRSGry9bY9KfQ0W/mWj4QKdH+gmb8e+bfT/y3KJ1u8NJpJQaiRsqnPC8?=
 =?us-ascii?Q?AJmei4cKoIrbeYLld2dlVjI=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d3a58d64-78a5-42bc-fc29-08d9bef79d1a
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Dec 2021 11:48:15.3355
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: y1VTIq5Tu1+hjZ0i3RrjruU7OLfZZgF39kQiBDQMZJGNe5oZcCFBLoiKHVpBWyWUNmEorn2gxQ/hQVZERknBJQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0401MB2605

On 14.12.2021 12:41, Roger Pau Monn=C3=A9 wrote:
> On Tue, Dec 14, 2021 at 10:15:37AM +0100, Jan Beulich wrote:
>> On 13.12.2021 16:51, Roger Pau Monn=C3=A9 wrote:
>>> On Fri, Sep 24, 2021 at 11:54:58AM +0200, Jan Beulich wrote:
>>>> Page table are used for two purposes after allocation: They either sta=
rt
>>>> out all empty, or they get filled to replace a superpage. Subsequently=
,
>>>> to replace all empty or fully contiguous page tables, contiguous sub-
>>>> regions will be recorded within individual page tables. Install the
>>>> initial set of markers immediately after allocation. Make sure to reta=
in
>>>> these markers when further populating a page table in preparation for =
it
>>>> to replace a superpage.
>>>>
>>>> The markers are simply 4-bit fields holding the order value of
>>>> contiguous entries. To demonstrate this, if a page table had just 16
>>>> entries, this would be the initial (fully contiguous) set of markers:
>>>>
>>>> index  0 1 2 3 4 5 6 7 8 9 A B C D E F
>>>> marker 4 0 1 0 2 0 1 0 3 0 1 0 2 0 1 0
>=20
> Could you expand bit more on this explanation?
>=20
> I don't get how such markers are used, or how they relate to the page
> table entries. I guess the point is to note whether entries are
> populated, and whether such populated entries are contiguous?
>=20
> Could you provide a more visual example maybe, about what would go
> into each relevant page table entry, including the marker
> information?

I'm not sure I understand what you're after. The markers say "This
2^^marker aligned range is contiguous" (including the case of
contiguously clear). And they go into a vendor dependent ignored
4-bit field in each PTE. (Obviously odd numbered PTEs won't ever
be updated from holding a zero marker.)

An intermediate page table is eligible for replacement when the
marker of entry 0 is 9.

>>>> "Contiguous" here means not only present entries with successively
>>>> increasing MFNs, each one suitably aligned for its slot, but also a
>>>> respective number of all non-present entries.
>>>
>>> I'm afraid I'm slightly lost with all this, please bear with me. Is
>>> this just a performance improvement when doing super-page
>>> replacements, or there's more to it?
>>
>> What I wanted to strictly avoid is to have to scan entire pages for
>> contiguity (i.e. on average touching half a page), like e.g.
>> map_pages_to_xen() and modify_xen_mappings() do. Hence I tried to
>> find a scheme where for any individual update only a predictably
>> very limited number of entries need inspecting (some of these then
>> of course also need updating).
>=20
> Thanks. So there's some extra cost here of having to update those
> markers when a page table entry is modified.

Well, yes, in order to re-coalesce _some_ extra cost is to be paid in
any event.

Jan


