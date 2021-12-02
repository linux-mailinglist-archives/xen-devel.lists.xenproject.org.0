Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0495946648A
	for <lists+xen-devel@lfdr.de>; Thu,  2 Dec 2021 14:34:13 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.236556.410368 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1msmDK-0001Vm-7W; Thu, 02 Dec 2021 13:33:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 236556.410368; Thu, 02 Dec 2021 13:33:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1msmDK-0001Tz-4a; Thu, 02 Dec 2021 13:33:30 +0000
Received: by outflank-mailman (input) for mailman id 236556;
 Thu, 02 Dec 2021 13:33:28 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=9SUj=QT=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1msmDI-0001Tt-Lc
 for xen-devel@lists.xenproject.org; Thu, 02 Dec 2021 13:33:28 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6e071af4-5374-11ec-b1df-f38ee3fbfdf7;
 Thu, 02 Dec 2021 14:33:27 +0100 (CET)
Received: from EUR03-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur03lp2051.outbound.protection.outlook.com [104.47.10.51]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-4-8aXpN1xKNT6mOKRFS7S8nA-1; Thu, 02 Dec 2021 14:33:25 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB5469.eurprd04.prod.outlook.com (2603:10a6:803:cf::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4734.20; Thu, 2 Dec
 2021 13:33:23 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe%5]) with mapi id 15.20.4734.024; Thu, 2 Dec 2021
 13:33:23 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AS9PR06CA0320.eurprd06.prod.outlook.com (2603:10a6:20b:45b::33) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4755.11 via Frontend
 Transport; Thu, 2 Dec 2021 13:33:23 +0000
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
X-Inumbo-ID: 6e071af4-5374-11ec-b1df-f38ee3fbfdf7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1638452006;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=4pXtbJai5ps01/v4a+G8xathrB0fFKM+HskABABO80I=;
	b=EMtl/v19UNB+ZS1B7+PsxvF3hYIMANqNBMxz2VUWTDmvAgM0FyDbwEDV+yi2mQO2vlLXn7
	wr0zbE0tpjPEReZZ7w1+M3+X7kT8OM6ybk5THjFJIqIFARLzc4XmZ4MESaTL3jE8ww4hsX
	z27mPg6cxwH8f/olGiu5yte5PC5UKyI=
X-MC-Unique: 8aXpN1xKNT6mOKRFS7S8nA-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CfTt3yElQ5ybwh9f6PVzr4rr32S9u4ruWs04RRXldliNrfbRwa3HDh6WiHmoV3bpfiFV+gaJ8AIcWYGfP9DbPjhdic/RwLXUkK7doHKO4nn7Bbdr5y9zUm06Sko5t2GAd0pOx+OZBOuOE77kqeq3PONVRNCDqfQaIMIirdc1Q3AQ3CB2PDRm5BcLrznvbzQY1F9EDZa2XBT2jdLAGyiwfdXcjKqzWn0qlc+6vrmjVcum6BcPTcdHujmIWQGYgysJ1n/Wb7DTHk3Q/lEIkodPuMsKW3ue69OXg7XvoP2UQaq0ARB6KXK60FWEhb7a0mNHyyU79WTRxX8PlPthhgj3xg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2G0UFx7dbUrZfUZc/ptz5HPJR/23wF74hdc9vJm6BKk=;
 b=nj7VUanQjKBBfUhwic5TwoqDMCDh9vnh5DSSI0gRVX34t8W0ny8CwoSNZbU2zrydQcn9V8k4ANPzEGEkla/gd4980FAz5+x9iERWPiV8ETOrQLRiEhbNrcqApk02l2pdZ8d9X26/gIREZkA2pe8RuGY7gydJH5+rp2sP7hxd4QlTY2MtMt3Ywj1O6ELSy/q+hKWE6YkL3IkErhsQo6VRdRpHnU0ARBrL/FVT7ENdoYT7yAgcADds/otnciMT4pwlDwyeigSYeBwHk1nhiESxFtOnUOhpmBxGUMJOiQP11Lm58/ZyZb8iqsfno9MvX/oeysAq+Qj7zy9imRxqtPO9xw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <282f884c-834e-caf7-4e09-6c7a662c666e@suse.com>
Date: Thu, 2 Dec 2021 14:33:21 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.2
Subject: Re: [PATCH RFC 8/8] x86/boot: Check that permission restrictions have
 taken effect
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>
CC: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20211130100445.31156-1-andrew.cooper3@citrix.com>
 <20211130100445.31156-9-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20211130100445.31156-9-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AS9PR06CA0320.eurprd06.prod.outlook.com
 (2603:10a6:20b:45b::33) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 19887899-1860-4553-a661-08d9b5985021
X-MS-TrafficTypeDiagnostic: VI1PR04MB5469:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB546942C443B76203C8577DB0B3699@VI1PR04MB5469.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	iX+lKF2r3GipsEswFrk1nRgZnkEwBxEyYnXXDuhh5TpmVxUW6B/lBCUl/j93lMdxsY5T1zEqEBv3LS4JBcZkyKVY0U4ubeT5tvyxyF+Z8EgWKxdX9nhem8y5B4/22sepiYwCEjKcNB/cxSARULgJgc+HkfeCIJvnJqJTgKqj9Fx8JN5AGui95svyeIVQRgIbyZrePhj93r0wNLzAVRDqXsIKiQrES69+LczTJ4XHKDlO8jY28LWF9xsGYzKYpfbl+bEyUbwnTM39UVMLOd1JannongReWqePOE53ldqG82llzBmozWrbE0N/u2Wj9G7Nv0aEBXjmAV8Fn1HL6Dlfz9bWQH6TIxaGMR2QJCknl3BZYdjPUVRlb9YaJlcxCEC0i4UgjGg8rq58klzDw+mcEZzEv6YJtioXNFdCstG06jpB4xyvxJ33nYfwyARhNIg8nm37LJpWrzAH4I+HLiIHgENPAdbdcnSesBLrlivgNyMbvAq7tQo7nLp7/Kbpr6qchwHN//u4LOUjCbQJgfBzot2PpJR4ov13xtYYm0KUGmPgiYftrbem7+kDExTsZoc+9uWWyhWeAPmNTajGi7MC0Vl2RYQTX8I5zT9kQDuy49dXyn+7LoZhk8IRZQ0DvLnTGZp/Fib4ghlBAwiSmCcJk6oWA40OYRXgvncJJgQCiojkL0fCiRU/vqEdRsHB/LHPnQhigO37zYq6qUxZ+XfrPrMzmz9ABwZGjRIngWKhvwM=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(4326008)(83380400001)(53546011)(16576012)(86362001)(38100700002)(66476007)(508600001)(66556008)(31686004)(8936002)(316002)(36756003)(2616005)(54906003)(8676002)(956004)(31696002)(5660300002)(26005)(186003)(6486002)(2906002)(66946007)(6916009)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?+VbgIlaE0E2C9eJyItf8zf+HipQ1ZKR+CgmuGR+WUBcTG1NDnDlIX/NEr7hE?=
 =?us-ascii?Q?wSYP7VLObhoEU3TOMG+1K6U80FCpeeMLjCLrr6kKU/EFj1wZbbkrClCQ7bvQ?=
 =?us-ascii?Q?ptQ/Yf1foL2pY5icva/ckBzsq+lkEFEZYpBEdM9lkmHj8GMj+fI0WfBmV1nP?=
 =?us-ascii?Q?8+IlKnwprNq0pXoOtkAL7fkOiS8LVVjYO31l9hCYvl2l0LkNqORoy8438ymd?=
 =?us-ascii?Q?LURzqO8EuVyXKDmMZrUgO8VAb3RqZ0g+81HRHiqEV6BuhRYzQi1TL+iBw7/V?=
 =?us-ascii?Q?sTpA/x1FV5KpeJ0l2DkeuZwW/ko/qi3gslIIER4kUY3N81aYFTFxkRfPduaZ?=
 =?us-ascii?Q?O42b1kY6/KFs6VZFMG4TJAvHqnrBUwv7xJcwRUqCcYrsuR4a+UjbPXVqwV8J?=
 =?us-ascii?Q?APt0ijehOfnrugUst7koNlAJmdcIyKFogoBLkevY5ya6UaWudPAru01mNTjU?=
 =?us-ascii?Q?bgjrMhMXmND8vttQO4keL8zkTQPji62iaR/dUREGTYHnAbhlkRo7eFbn0DDu?=
 =?us-ascii?Q?w/Hv94BXk4NB8F90cs/cnXWmrLnMApRwznbj0QjqVGZF5BC604HBUZ1NYLC4?=
 =?us-ascii?Q?zRrrSawV1b5zwfr1HCi/7exYIrIx5hlbqa8fXraDzHiEAMtiXhA25oZj23lz?=
 =?us-ascii?Q?rqPebkJULOw+7x/4BnGiAeEBMPxSOvRbbHfeToViMKP97ufF45s4Z2hQrWl2?=
 =?us-ascii?Q?kfUm3Wg3kCKt+gE7RtllUnXECRU20x6HDpi4Ftp3wgpk1WQGlEsdNd1LliSj?=
 =?us-ascii?Q?rmUCzOaQwe1MMqUVAoUfW1V5Babtj7uP28eU1DN7Fb3hqLrOrF9MK2TyIs7P?=
 =?us-ascii?Q?BmTqj9u0kCUpiOdYj31TFEUEY//fHEvhd0ySvoulSAJxABJNfGGQEVeLufH5?=
 =?us-ascii?Q?DftekA7q77AL4wHw2ZVl6eSev3qnALRsbdiY3LRfGubFVlvNo3rk4KHHZjEj?=
 =?us-ascii?Q?JpmStVp1XvTjYjQr+8+8BKMc2HqC5izinvPwiPktZV330m+FNfLDYddPC1Wh?=
 =?us-ascii?Q?X0MNxk6vKxUH8xKcP6LLjP/Ue55EUccY8/XGNCqJ8hiA1cAOnkNhkBXbE8na?=
 =?us-ascii?Q?M8w33ZKrA2KGCWmea4g4aY4u4eaTdKYh7dXdLCSLzqSPjYmQU8nK5Z21bSu7?=
 =?us-ascii?Q?Hg4SH1zAYMEgeJEw9JYkit2NWXP9GdqDpc/0fFLEvU5G7L90elzWyKIAl7Ep?=
 =?us-ascii?Q?rpSj+CQTrkPQjFBurS64i6vRLGZQMjnGSQlY6EkhKf3dUBMGlPRqpYAOrDLm?=
 =?us-ascii?Q?24fdXrwumpqfFB9wPygfu032z5f2xg1K4ek63oxm1yN5sCm/JwHjbslHTrUc?=
 =?us-ascii?Q?/t6mQnRjwhK88YG0LAWPYaWCJjWYLJfEYemcLVA2QX5QSSLoIv8eRe2Mw1OT?=
 =?us-ascii?Q?E34hoVxWX6lsKd7mpOKrX8zVURWfe445Zr4aRbo4sVANnqW40VETlf1m4WIz?=
 =?us-ascii?Q?FPI0mmZZePn9WBNJQyB9tM0gCn0jJRr552Q5CljJhQLBpdVfaZRFG9wyEkYD?=
 =?us-ascii?Q?HHrlcoz1CikEm7bceKDOJnQVmFpqwz6Zm2HBxRrsUNecZxZ/6FqAk5v5D4WK?=
 =?us-ascii?Q?6Qg9skeQ6JenzU8JtMhpwy4WDN4Iqfy/MViWotKTdJgOHzZlt6Dmm3GMTEU+?=
 =?us-ascii?Q?KxNSRFd3yhq81+pcjOv/Gxs=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 19887899-1860-4553-a661-08d9b5985021
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Dec 2021 13:33:23.4794
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mpVc6D/KvphPJfZ7nRTfvjbokhp2gZpWsEdOt/SNHmm8uen/BevAJxzKsG5fZjxgmaiM+38RUm2O0PbYIsUhKw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB5469

On 30.11.2021 11:04, Andrew Cooper wrote:
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> ---
> CC: Jan Beulich <JBeulich@suse.com>
> CC: Roger Pau Monn=C3=A9 <roger.pau@citrix.com>
> CC: Wei Liu <wl@xen.org>
>=20
> RFC.  I don't know if this is something we'd want to keep or not.
>=20
> Getting extable handling working for test_nx_data is proving tricky, and =
while
> I can't spot anything that should stop the extable from working with NX
> faults, from a security hardening perspective, there really ought to
> be.
>=20
> (Spurious faults aside), there are no circumstances where an NX fault is
> legitimate, and restricting extable's ability to interfere with the fatal=
ity
> of an NX fault provides a better security posture.

Gating the extable_fixup() invocation accordingly should be possible.
A respective check could live even earlier, but the window between
the !guest_mode() check and the function's invocation isn't very large
anyway.

Since we can't have both testability and such faults being uniformly
fatal, but since otoh we use pre_extable quite sparingly, how about
forcing the fixup to take that path by disabling interrupts around
the test?

In any event this touches the insufficient selectiveness of the fixup
machinery again: Any kind of fault will be recovered from whenever a
fixup record is attached to an insn.

Jan


