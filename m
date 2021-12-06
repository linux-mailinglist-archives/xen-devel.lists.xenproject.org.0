Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 07B4A469907
	for <lists+xen-devel@lfdr.de>; Mon,  6 Dec 2021 15:32:02 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.239138.414510 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1muF1b-00089i-1X; Mon, 06 Dec 2021 14:31:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 239138.414510; Mon, 06 Dec 2021 14:31:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1muF1a-00086i-U3; Mon, 06 Dec 2021 14:31:26 +0000
Received: by outflank-mailman (input) for mailman id 239138;
 Mon, 06 Dec 2021 14:31:25 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=0GdR=QX=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1muF1Z-00086N-C9
 for xen-devel@lists.xenproject.org; Mon, 06 Dec 2021 14:31:25 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3011950b-56a1-11ec-a5e1-b9374ead2679;
 Mon, 06 Dec 2021 15:31:24 +0100 (CET)
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur01lp2054.outbound.protection.outlook.com [104.47.0.54]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-27-vKjMIHPFNFOZNicTD4E6yA-1; Mon, 06 Dec 2021 15:31:22 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB5469.eurprd04.prod.outlook.com (2603:10a6:803:cf::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4755.21; Mon, 6 Dec
 2021 14:31:20 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe%6]) with mapi id 15.20.4755.021; Mon, 6 Dec 2021
 14:31:20 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AM6P191CA0004.EURP191.PROD.OUTLOOK.COM (2603:10a6:209:8b::17) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4755.19 via Frontend Transport; Mon, 6 Dec 2021 14:31:20 +0000
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
X-Inumbo-ID: 3011950b-56a1-11ec-a5e1-b9374ead2679
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1638801083;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=3iuR0Zr9QGdCrW4Jn4AhEG3vUxn77hkSa8XImjiKQ+0=;
	b=Q/DA5Km4z7prTNv1oP8rZorD9rz7YrcFQLi9uj2WXiXAhhzbzJ0dkwy3/eTZaqBbPEXubW
	Lizc3UJ2S1uUpIu0071i2H8HX1ki5NPc7Qem7G3BxAd38/QAnxf3xseVvLeXY2HLBoD2jV
	oNu/XyzO9/HK/HBCiHY2I/LwvDi8BZs=
X-MC-Unique: vKjMIHPFNFOZNicTD4E6yA-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MiysS4r+ig1Sa5w9nLkVA1NNj3B+DEpwxLKYCNPNrjOxdEexdKqIMA1ATIuBukLOPI5eSjgsgFoQsf5skOax+RYyVS1TQHhRILq0mayecu7At2/SRe7Vxjgh7p2n93r/2vn9vWlQfeTmz7ql1eTsKiAk0ric0+Z2w7F9xwgddiS+FFmhzleUnKi0yx30wKSCXJYLpGyG+Q3/Nn0UzQ8wLriXsZezRl5Y4CCQBMX1b1CTUh87O1SBf87gK5qzdACglFUqMUtdIpgj3cwB9X4WZJyjk/5Va1Q4Cyp91iy1sK0cvZ5mGVAdP1ksjWWpgqW7Fh3Aq1mAtFu6foJ98nLquw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fORdP+BzeerQGMsb/wiYQImQtw7HqY0znJ8TJp8Yr4M=;
 b=A60TpJxqwgFoB2nO2M8YZKXeHAkaMnwKxKO0GGkvN6DVH9wVbhnoi8aaNND5Ze3fEzZs4PhlkicwYfvwYjqJbG1jiFMGdzvCDKcSZSOM568eZUBj9ui2GI1/S+/wLGUVHUTYTUkxmo55pujwPt+LZjsOHuVA5FlTr6xd2/4nXJm/iVt4QQAE3Chl3yNBzYrby0SOI3edAeua/bSU9oC/AM6SbuAaeOP+1KPEOlzXLQPj35jqMGXmbaoVoYeY7AVgUw1COanXMsfKcU+VN0dVE8Y+EF5Kz6LjPYSPg+C2dGVf3gcvVlb6oK1smBG5Vhym1OHqyyoLyT8DTfedWh86Lw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <21dc2bb1-4f8a-ac58-7573-4138969034a8@suse.com>
Date: Mon, 6 Dec 2021 15:31:18 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.2
Subject: Re: [PATCH v5 02/12] libx86: introduce helper to fetch cpuid leaf
Content-Language: en-US
To: Roger Pau Monne <roger.pau@citrix.com>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 Ian Jackson <iwj@xenproject.org>, xen-devel@lists.xenproject.org
References: <20211129153355.60338-1-roger.pau@citrix.com>
 <20211129153355.60338-3-roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20211129153355.60338-3-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AM6P191CA0004.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:209:8b::17) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9c130141-2eb4-42a5-dc0b-08d9b8c5125d
X-MS-TrafficTypeDiagnostic: VI1PR04MB5469:EE_
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB54698CD059493AABFC94E5FFB36D9@VI1PR04MB5469.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	3BrSNkK71+juYn4kt8F+71voEPdlAcD/QVw/hi9d8l9Vh4ohr4g/jb4bU/jo9fCLp5Xfdm4FmwaFsc+2L+vGt7faHvFoZ+QvrdYz3v3GAK4rguVrVYYmp6PqpWvNxz8eXwyDhKlEZVZmUJl3VBfaXVTJz5+uWr427XF1b6iL0van0hINkAJ8gMwX7AXjWOQVN86KI86swlAgmh6Fy2L1nx7K4r8asDCwQMt2amqCIZuzQB4FS/+3XT61ztiwmvAq3Ov4+f6c/ZpaN7gWckMn62d6aPi6YAbEeTsDB1dea9kdyHiThrru6FnSBGvaOpqYd8DHMkefdApIYRFnKivRm96rXqN7tyLttLkSKD8EzXBHP3Pq8veUifAdrjoNOcoJYsw43DH3G8LOROJFulKZljZ+7wNRjBIRwbmIpaynk1alE/dWguEIgyk2f8SuhEComxCKgwUwtaJgRc/hfbf5YCCYqXdRfysQk5LXDZpVzTYrqpNyDpUDYbtdx9Q6e8STRbaDA29qzfCbP/pAKucBJKV4hTaRfV1Dg3R4SKJvzTIAZL+n6vnrMmDQBxbU+nkPP/zP/m1L+mLymUxr7oOhXkR0U4rZ6/SGwL58ymC9TaMOxLnD7dNJ6u6nKfr9KYoFQolxx0RTQ8nhQWel6Ij3gyPgBL6l/WBp1q0BexzIpqnYsuqeekuGSkqblNjLzJjhmZrvlw3dhLCcH5W/xY36/v6My3ZuBjlZ14jZh1J0+ec=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(38100700002)(956004)(186003)(5660300002)(16576012)(8676002)(53546011)(26005)(6916009)(31696002)(36756003)(2616005)(4326008)(83380400001)(316002)(86362001)(31686004)(508600001)(6486002)(54906003)(8936002)(2906002)(66476007)(66946007)(66556008)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Vp6DFeBK2q0CDFrsvht7gLWMKDqBARCakhqQDVDchAwc3innA5/Oq9gdkxbq?=
 =?us-ascii?Q?K5rIZ6KJ9Sd65rZk1TBpjNODl6Mv48bYT4Zd1Zsylh7TBMAu6pKWsNmGRZ8S?=
 =?us-ascii?Q?Z31Eyqk/kFYj/jxT+WhilanAOIdBWomY7GV4FSjDRU/k+nWgr8pHsaZST/Wh?=
 =?us-ascii?Q?aOHFn5k66IZR4E4UMFkaij+ilRe+7Srrv95oUG19GynYnc0brL5KFBFPNYLf?=
 =?us-ascii?Q?UUrFpAZXI7m/HGWzLqM9jAijOlTubA7vU4kvyYMW+kbMdCJ94e9oqV+0o3jF?=
 =?us-ascii?Q?rUJErpdzm23+44JD4Ka//JKTbHMb6X51UQ6hjPtDl6mUqM9QT9FDb3tLdI70?=
 =?us-ascii?Q?KRHSeR3rCEHC9VXIlIdbtaRIBLFsiEsXeOz1H0SG1cuDNpzoVEzUGy1qW+h6?=
 =?us-ascii?Q?RcQmEA0hKgTMOJXoYJorGMyuPdy8r7J6OEEuMGa093MpUGxYEdZp1hxKD7ai?=
 =?us-ascii?Q?mOdCsNfK6q7rm3pwun6aY3OCVD+4YwdIfzJycHq6ZhA+EUEtondzhHQXYpk3?=
 =?us-ascii?Q?bpWvsIZTG9cOlNYKAVuKaXp1OU4v8VSbw0RRl4/QaorZZtXJur5CDzGBRFKN?=
 =?us-ascii?Q?pUDFG0sfy+dbPG1o1rLlA8u/IxWHBlx9ygUelwRTMs6cAOSPhWJs8v61rjdd?=
 =?us-ascii?Q?9gAvpx2CW4NddPGypxwXGpelH0nXWasHdX6Zgm7PukW4WxvrH9+Y/Mlu0nKN?=
 =?us-ascii?Q?71NMWrfMx0sc1PHkj6WqPp4Ynm+v3pz819euF0FbfsALWlD6QceecpZKliyu?=
 =?us-ascii?Q?PYRCrDyyNCo7R2PsLareyW0lQqEPpy/JZXDDOeSYH/BVi/uW/ojuiFpFG8Xw?=
 =?us-ascii?Q?Y1O1Ko4gVeAKdmYzY6MLNujT8XAKol+L4AZu6Kvdu19ig6KIaMqaiUKVagk4?=
 =?us-ascii?Q?1BKWIZr74Goeb+iH84MlA5XCSAglYQHou6RCGX3wkwetFYteSyb5t8KPlrTa?=
 =?us-ascii?Q?Vv25YG3diUXvw3tBbmjfX54ZnYK1XNOhylba/13Obat9Bk9TRdbqj43/K3S/?=
 =?us-ascii?Q?FyKul18Pwb+o9Jx1v9xO7ZroTCT0CGFT5GyGy93y1ZhDQp1x8SYYmLpw5dma?=
 =?us-ascii?Q?PDKzgE7qkWpvIf2MeNiz0JogaIKNB5X/X199lHoPiMjqGwPhAcVHk2DWzVZh?=
 =?us-ascii?Q?v4P94y6mUjSfhAZiguaMvQTsdRthoR0ggjdVaJV5q3e0h0witvkFyOnkeqiJ?=
 =?us-ascii?Q?J76jBxbC3l8sRHmJKUIrCfiESv/p7OeBcWoDXZc4jNdcI6vOJKGyWbfihSiT?=
 =?us-ascii?Q?HN6nZQHQkDBLbp2jaJ9TRiwoj3qw0+yW04Vf/lbE2UqYHSzfYR2D9Uxup754?=
 =?us-ascii?Q?w/XUKdeKovnr6Rh69Qim+Tx7GhCG4uuxK9MXwTvQDaPkUS7LJ0SmlG8NB4nl?=
 =?us-ascii?Q?RHqQVVQiG6AzV4wLXNTh1SZo4UTlbjXA2cRSkVPGkYjSOIgGDf/sxSF5FkEC?=
 =?us-ascii?Q?zIAa0VcXYnOQU2b9+YMfLbsx5dobJsV8cgZhAu1g8zVnxhwtwE42QgBjQ1O5?=
 =?us-ascii?Q?n2xl3UlRAPStPlEek2UHrxvVhEoGORiK5FiP02sEYTh3tubXbRPgrccn2fRF?=
 =?us-ascii?Q?Atye1F/Ad0TIYLuEX2kzXalekD89m2uAo6C+7nFqr7idZWmiPjXvJj84vF5h?=
 =?us-ascii?Q?EX3Zgt9YWuvT5WNjhqJJu3g=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9c130141-2eb4-42a5-dc0b-08d9b8c5125d
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Dec 2021 14:31:20.7673
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 64qs1zXK/sKKaJejksJKjJtKz2IzxDgNvDTmFDt5+S9q8TBC/H4XUo1r5e3Ltk1m6PxhuyPj8GoETIZTYT32rw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB5469

On 29.11.2021 16:33, Roger Pau Monne wrote:
> Introduce a helper based on the current Xen guest_cpuid code in order
> to fetch a cpuid leaf from a policy. The newly introduced function in
> cpuid.c should not be directly called and instead the provided
> x86_cpuid_get_leaf macro should be used that will properly deal with
> const and non-const inputs.
>=20
> Also add a test to check that the introduced helper doesn't go over
> the bounds of the policy.
>=20
> Note the code in x86_cpuid_copy_from_buffer is not switched to use the
> new function because of the boundary checks against the max fields of
> the policy, which might not be properly set at the point where
> x86_cpuid_copy_from_buffer get called, for example when filling an
> empty policy from scratch.
>=20
> Suggested-by: Andrew Cooper <andrew.cooper3@citrix.com>
> Signed-off-by: Roger Pau Monn=C3=A9 <roger.pau@citrix.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>

> ---
> Regarding safety of the usage of array_access_nospec to obtain a
> pointer to an element of an array, there are already other instances
> of this usage, for example in viridian_time_wrmsr, so I would assume
> this is fine.

I wonder what it is that you think one might be concerned about. Such
pointer retrieval is no different from an actual array access imo.

Jan


