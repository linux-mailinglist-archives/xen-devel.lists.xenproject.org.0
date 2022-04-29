Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F40D514AAC
	for <lists+xen-devel@lfdr.de>; Fri, 29 Apr 2022 15:38:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.317329.536613 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nkQp5-00069J-N9; Fri, 29 Apr 2022 13:38:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 317329.536613; Fri, 29 Apr 2022 13:38:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nkQp5-00067S-K8; Fri, 29 Apr 2022 13:38:15 +0000
Received: by outflank-mailman (input) for mailman id 317329;
 Fri, 29 Apr 2022 13:38:14 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=iTs9=VH=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nkQp4-00067M-Ej
 for xen-devel@lists.xenproject.org; Fri, 29 Apr 2022 13:38:14 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9db34165-c7c1-11ec-a405-831a346695d4;
 Fri, 29 Apr 2022 15:38:13 +0200 (CEST)
Received: from EUR03-DBA-obe.outbound.protection.outlook.com
 (mail-dbaeur03lp2172.outbound.protection.outlook.com [104.47.51.172]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-9-OFwDRiO0M3GtGmiGOlPZpA-1; Fri, 29 Apr 2022 15:38:11 +0200
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com (2603:10a6:10:2db::16)
 by AM6PR04MB5400.eurprd04.prod.outlook.com (2603:10a6:20b:9d::29)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5206.13; Fri, 29 Apr
 2022 13:38:09 +0000
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::5cb0:5195:4203:7c2f]) by DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::5cb0:5195:4203:7c2f%8]) with mapi id 15.20.5206.013; Fri, 29 Apr 2022
 13:38:09 +0000
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
X-Inumbo-ID: 9db34165-c7c1-11ec-a405-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1651239492;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=MonGnlx51ZfJ/X86MVmN17LvmvRMBIkCORuGQAAP7+w=;
	b=Dj7PjQ991VoYfZgR68sGv0JmSFCZiJRt1sp/jkncYHnAYfRfoFqvjdQIUyW+Fc8PIIhNEF
	HArgMEL8GWY+eEJ8W8SAJprtASNaFqGVjitG53jj9mRfq9l8RFLGr0gsnxGbdd7hHNl73I
	90+K2zcTmYGVsxBxZjcgAF/zi4rCI/I=
X-MC-Unique: OFwDRiO0M3GtGmiGOlPZpA-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aw1dc7VUzKQxZjMAxGuA3clnUxdEDK6NILKtfxCFHVqHg82L9U7rRbPjtpLrVuqF3yrcLTV+ODjkQwHR51L1MgCBh3u/yLEirfsKhu8PBMpFD/W9kekEvgT/CcNjwnNZzKy36vS7YoN1JgSlrbYKqMhcEaiuzlP93ml8+LZkhtYzL1gc3dPbYcS1HjSbo+J0hV8uJ87MOg3iLOzHSe4GQcJgT8MnSB0GgB4jMiaKhuykAg2Px0bdyqfqCkynsbn8qUjPLJqIwrRR5GLseotbmyCpaKL7BrGs3WnG6JgUWtiSzImBQJRtob+FY+O2XVuyNb244zzMhkXy3yGL3DBZJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ASbVOOqJ46tYjj2FWN5KqziuUCuTnjB+Pfz6dFMuL9o=;
 b=dq2Lq5/wIshBndVTKideIdeSvkyRT3zIQRYiiUJg5SNAKdWpzMVthUHhoark3refqt3y6Me7VFWNv+IPb7SqCpcaoEqUGiXx/allwxVsBlTXnFJsjiLYS6R9somwnqC9dtDVDejM7DqFzF7psPau0DIY7YWuFcezP1QpIstz3LgJKSJoLKIwOJ8TKH+K69AMKaKoMsrvjIWcTKARkVXpIT87nvsjaYJvgdZdOqj4Za7WF0Cbp5rmGoRayjjFr0IuqTcVlmHoE5y0iofRNNRHh3KH9FY3vGHaY17MHqcyEMOUuC1AjTc1aHfNMsTeKOjJ5zYK1Qf+7qLs/GUrto5Srg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <21005eb6-0520-a09f-662e-d893ebd9d964@suse.com>
Date: Fri, 29 Apr 2022 15:38:08 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH] x86/mm: slightly relax TLB-flush-local check again
Content-Language: en-US
To: Andrew Cooper <Andrew.Cooper3@citrix.com>
CC: Wei Liu <wl@xen.org>, Roger Pau Monne <roger.pau@citrix.com>,
 David Vrabel <dvrabel@cantab.net>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <ad64e3c6-9f89-c0ea-05a9-cff995ac200f@suse.com>
 <2e0c3b57-5117-e222-587a-b2261101bf58@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <2e0c3b57-5117-e222-587a-b2261101bf58@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AS9PR06CA0412.eurprd06.prod.outlook.com
 (2603:10a6:20b:461::6) To DU2PR04MB8616.eurprd04.prod.outlook.com
 (2603:10a6:10:2db::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0c9a30dc-067a-4767-18f9-08da29e57fe0
X-MS-TrafficTypeDiagnostic: AM6PR04MB5400:EE_
X-Microsoft-Antispam-PRVS:
	<AM6PR04MB54001042FECB23667D166739B3FC9@AM6PR04MB5400.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	gCjBwzFpBWwyq2aSI8E1+sKCkeXNhb750Nb0pOOH7vMlt6LXn3J1UdjWnpXpXN7fpGm5dAaYTO7xcf9iKI/wcBB55xh6VSMZqv55WGmTYilwx+NKh3NKsxBMm12fKJuiyTU7z5n8PYMSaW+Y6+QRzGFa+l5u578Tm5deezyf9l4p4vcxfhBIUiJvyGcJA1ZIljzAhsh9eRByG3jiS9jsF6muznCVACqofcjERlS1UWVUUzdCjiKF3CSgwk9TGnmjlFl4VlYcoI+vD6Hw/CxgHN2YnrCIcEkzjEmuo8xN3o9QmHCQqyVVrByBoI9B5czqJw9SEdfQoRAtHdEnQ8+M/VwiZBWN48PT8Vmw0UCtMYa9llcmy5VGnawmEL3GAGhk1/TZTAyZqDoTMNazpQKXhIDSmY4amm3GSXZS+Er7uKdaUI/iMr5ImzQ7nqWj9bx55zYibJd4+uYqE+pOE/f9XlU64gZQ3mA5c/8RJuRiJcfiFT8OipV1VXFpE+FyUHxe7OQazdr3+em7ZMKDQGwZWo6GsXK3Jk4AV3rrBY3BtuDhjjJPwUmRD9M5dKiUi9/Ufu56H4GxChaKXcNx1uBlM0MYQeSSsK5TBeQiv+bZB+cidc1Wefy4nsOaf3p0ITr8DJe9ApdkZ8IbIq6tJPJX14Gl+oxrPaMdFagOm/1eFjiH+2vSG5eMDWGYZ0BzUQBaNStALQ/fRmQKLhJW28wJTbdVPTAgufAyqT7eR/CYIfQ=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8616.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(2616005)(6486002)(54906003)(6916009)(86362001)(6512007)(66946007)(66476007)(66556008)(8676002)(31696002)(4326008)(26005)(508600001)(36756003)(83380400001)(5660300002)(316002)(38100700002)(2906002)(8936002)(186003)(53546011)(31686004)(6506007)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?rM5/Q0Xh60uheW688aJr4r8nkOTM7sOrPCwNR6CJrWZonSiiQIPW0Hatg60+?=
 =?us-ascii?Q?Rvs5prIDQ/gFxtIPC3/ai+ynQf9sJTVWtNL0JoFNTbF09bdoV0IOQyCIP2eg?=
 =?us-ascii?Q?jN2Wji0FCQi9phClDVLrXE48qcIriQ6kWBbEmQ3Bkpm94suNrJAmiT+b3GBX?=
 =?us-ascii?Q?uGt0YefKuDrg+hbS/dvRxc3+B3/5+4b8uH/Jnn3XykrQTCJMRE3JpQ3IOryn?=
 =?us-ascii?Q?x/v/iYhFqfTmgFESbMhfGQrmAC94zo//AFBFMECWn1fMsjAKa5aESEm9TwHP?=
 =?us-ascii?Q?5U0QKrVPHhgpKBVc4KkWOmBawrIlJzAjLbZbv4f7wxk4MjBWD8LsPsqIKVAe?=
 =?us-ascii?Q?YaXagdvWKXrfx80cOkskQIQgW3Xdw8LXnCoFY429LW9lONK6W7QBJGhd2s4j?=
 =?us-ascii?Q?14CQGLutIoaHvTRt5lf/pGruuMmPJekOTIG6oWMiy09TqxSL4y817FPKFrmN?=
 =?us-ascii?Q?Bp5TCOpGVNFasgt+ZYD5kDf5EkBmVZkuDbK2sS3F3eaEziS0SYAMPk/mQe3X?=
 =?us-ascii?Q?C/a0x/rg4FG1/WlEsqvtOH2eXkr+SwDn3aR23ZO7hPyC7MPWWj+ftTRSAtII?=
 =?us-ascii?Q?4nHv8VrlKFCkcyDa3F6N5GVN1ojF2LNd9T0h8fMcSmmH5N2D7PjC1F5vQV5g?=
 =?us-ascii?Q?X1pM3RsRhnrrkGGikUZL/VNUwICVd/868sGYNLVLH0shDF0zsH+tHLpM4Tja?=
 =?us-ascii?Q?I0aoS0rhzTwbgk79lDY5GQLcXhlEVQ9qanO27qyfu2O5/WN4ESaGHcqAJPXB?=
 =?us-ascii?Q?6n4XwmcGjllSdLggC10eZbH/pZl+QSWrFSq2uB0QXRs+LiPKXoDbQ8JeUQRC?=
 =?us-ascii?Q?bO9sr3sYDAiLAdOQLaknOvg3pGsjDu6wdkoPYSuuV6jnJDyGzQyOSzLwxOLF?=
 =?us-ascii?Q?Ap8kxjKBIBc7eruKY8Z+X60Bv5zAgjc34tNfWy+qWG1aQEKr7rX4fec6ncTf?=
 =?us-ascii?Q?RF1joMNAWu+NrA+bOzGdSOM18zL4/OT88XxRKz/5DZ5VfBcT/YcfDIQNdHH4?=
 =?us-ascii?Q?oT5f4n2ds5DV9oGHY5Q4YuOiADdzcly8pgwF6QOugwFG5TafpA1XarLofMBS?=
 =?us-ascii?Q?eiEtaAi6ItjFS1aZOtPpjHwFROgip6ALt0HAeF7zFMtsrYXnRrtuYQFZj8GR?=
 =?us-ascii?Q?56t+nvD1FbSbr6Tj6mOJ/2DHakrQnbWA81Pfs8JWxLLd1JE/YWI0diCY6rJj?=
 =?us-ascii?Q?kJZd4tQKCYm06GNMgIgAHyHM8GAx6WkVIiMcfzTpe2CN0qTpUf3YoOEQAxFf?=
 =?us-ascii?Q?Q1Qp14wL1SeDTebfgKdXN9wPBNqfalwJ62+gmmaaLU3aC0uTlVoJ0cCrpBCr?=
 =?us-ascii?Q?a5yKjUbEN+UYMukQicr7KyGboOB3iJl/3jsfUikqh7tXRuV+OjnKFQ2oeGKT?=
 =?us-ascii?Q?w5Lfhjgcj3UY1IpTFn/2NZ0Mju3F+7mwMJMIX+zrx587oz+qbiXEOKjenGIO?=
 =?us-ascii?Q?tIfP08/4fF9jMYut3RW1B9da8zLkWupP9YVRtX9hJxEcFfIKzl9QgvaWEoCV?=
 =?us-ascii?Q?hnyRACjnXAGRAs+RC8Fd5IbDykGKq1cgcTT04bisgBJHRDBpLsj0f/Y+eU2f?=
 =?us-ascii?Q?7ndVvEecbReNfYG8+U15oNXVMrKphtHQIZWNDWZPtifKn7GbDz4dEP1+jKxU?=
 =?us-ascii?Q?PkwXYjqFlvCAXHB4dVV62O1ktjCwstA5IEAu8E5psMieWdyRjsxiDq31PNnq?=
 =?us-ascii?Q?f+qZ3ZAyIguKC1JxrBH0WsCDW5iAucQ/DCdgZnIeHumttaofMJt+z7IdCBRq?=
 =?us-ascii?Q?l+DNYVsuyw=3D=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0c9a30dc-067a-4767-18f9-08da29e57fe0
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8616.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Apr 2022 13:38:09.6926
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +PETu9AioAHja80wWlwXNNHeSGwD6y0CR2E+T67+m1VO8VA5H/hqT+yu9KeHgzfKKkChqAB7pCASErr7LzFs0A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR04MB5400

On 29.04.2022 15:32, Andrew Cooper wrote:
> On 29/04/2022 14:20, Jan Beulich wrote:
>> system_state changes to SYS_STATE_smp_boot before alternative_branches()
>> is invoked, yet that function, with CET-SS enabled, needs to invoke
>> modify_xen_mappings(). Convert to check for the number of online CPUs,
>> just like was done also in 88a037e2cfe1 / fa6dc0879ffd ("page_alloc:
>> assert IRQs are enabled in heap alloc/free", both instance of which
>> needed reverting for other reasons).
>>
>> Fixes: 78e072bc3750 ("x86/mm: avoid inadvertently degrading a TLB flush =
to local only")
>> Reported-by: Andrew Cooper <andrew.cooper3@citrix.com>
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>> ---
>> Only build-tested, as I don't have suitable hardware at hand.
>=20
> I'll give it a test in just a moment, and while semantically I think
> it's probably right, I don't think we want to express the logic like this=
.
>=20
> num_online_cpus() is cpumask_weight(&cpu_online_map) behind the scenes
> which is obnoxiously expensive for what we want.
>=20
> For cases where we care just about UP vs SMP-ness, can't we just have an
> bool which is re-evaluated each time we take a CPU online/offline?=C2=A0 =
That
> should be far lower overhead.

Perhaps, but then I'd immediately ask: Why boolean? We could then as well
have a variable holding the count, such that num_online_cpus() wouldn't
need to invoke cpumask_weight() anymore at all.

In any event I view this as an orthogonal change. It's not entirely without
risk, as all updates to cpu_online_map would now also need to update the
variable. There shouldn't be too many right now; my main concern would be
with future additions.

Jan


