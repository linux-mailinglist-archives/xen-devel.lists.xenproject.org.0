Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 25B16495B4A
	for <lists+xen-devel@lfdr.de>; Fri, 21 Jan 2022 08:56:42 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.259259.447348 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nAomX-0004FV-Sh; Fri, 21 Jan 2022 07:56:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 259259.447348; Fri, 21 Jan 2022 07:56:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nAomX-0004Co-PW; Fri, 21 Jan 2022 07:56:25 +0000
Received: by outflank-mailman (input) for mailman id 259259;
 Fri, 21 Jan 2022 07:56:24 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=57ha=SF=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nAomW-0004Ci-OG
 for xen-devel@lists.xenproject.org; Fri, 21 Jan 2022 07:56:24 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a0a774aa-7a8f-11ec-8fa7-f31e035a9116;
 Fri, 21 Jan 2022 08:56:23 +0100 (CET)
Received: from EUR02-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur02lp2057.outbound.protection.outlook.com [104.47.6.57]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-25-OKCEDvYcN0SZ-nv6BXE7nQ-1; Fri, 21 Jan 2022 08:56:21 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by AS1PR04MB9408.eurprd04.prod.outlook.com (2603:10a6:20b:4d8::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4909.10; Fri, 21 Jan
 2022 07:56:20 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe%6]) with mapi id 15.20.4909.010; Fri, 21 Jan 2022
 07:56:20 +0000
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
X-Inumbo-ID: a0a774aa-7a8f-11ec-8fa7-f31e035a9116
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1642751783;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=YESKsxqmISkh1KsoJjCDJFI4vdBL+BU3vax+i6mSNrk=;
	b=T9HvfBdyquZMv7K0yrGd7TbRc0XUmkub6OVSz6PjQfQVEFfyUhBqt/KFTvXn6g81Zh6nrK
	f/9d972ulvNnT9cX8Rf/U8UsXW7eXjnqJ8KUIY3xdyVpbKNeUE6jocjRbwKx+/YQSgMlFv
	LEYj0qfVV4VBX9CVDUlhfIwooBkV+Rs=
X-MC-Unique: OKCEDvYcN0SZ-nv6BXE7nQ-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Q1QZcBO9ce9RqOSg4GUDPiXjEH9ljbT0hNKRayn43qWgYmvG3Z1cIS0KULofS1aja3rbE3hlVCr9t288FBAHuR0os1swPuHYuo72CUG+4nUtqv+iUw3JzbUXUdQrZRtF0hJNPF8jLrdPmmJFNoZWFgBI8pfkG7ddLrW3smyJB7j8bP92fhGg7LGL13h7eZJ7I0m7vT1Cf5arwcNEqlFSfyLywMGUIwt0O4Jo1exl+mEPZhUtK4BDptsekv6P0Es6uo553fs2YtSAMTHwYIayZSM1dMR8Y/Q3jeQvfOguA15w++x5HBOU9WG1Y+OYygNJWKnlDRH0oLxgUdgd38jnYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aOy6to8HiePAc53m7rmMNsRiypag8/GsIWYCFz1Jw2c=;
 b=XwWN5ByFXRSHJxGVSkmALeDe5LUQdRQm0LvvmbUm10s692jnPPq5gZ0dUukRfNp3DrXOFIDO5Rjulbj5eilsKDG2MfNwJwK+3eMJMK7exckFUXRO7+bkUfGH8IkElaN8+ML8hGB48tpIqp+OqiU/JoSozivrK7p8SZmAWfK4vj7c+PMm2CwDPlIZNA0uIzqlINRGIaWc6n3Hc63uK3vRwWJcN7M5Vwwspr/x/WCi0STupvbaCvO+CppmC3boNGIe6yD9x0s1IOTlUwI5NJOH0RL/5+d05ybZ9y6fK8WMiGUNh8LI0iWFumDbZajc8ZQ9jx+GJc2qqWm7ui7pi9fXZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <9d6953d9-6799-2d22-b6be-6e88b2633e53@suse.com>
Date: Fri, 21 Jan 2022 08:56:18 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v2 4/4] x86/spec-ctrl: Fix NMI race condition with VT-x
 MSR_SPEC_CTRL handling
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>
CC: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Jun Nakajima <jun.nakajima@intel.com>,
 Kevin Tian <kevin.tian@intel.com>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20220117183415.11150-1-andrew.cooper3@citrix.com>
 <20220117183415.11150-5-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20220117183415.11150-5-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AM6PR10CA0072.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:209:80::49) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 24427a4c-ca4c-4460-9f64-08d9dcb382b1
X-MS-TrafficTypeDiagnostic: AS1PR04MB9408:EE_
X-Microsoft-Antispam-PRVS:
	<AS1PR04MB940822F7F1EA92B48847AB38B35B9@AS1PR04MB9408.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Hiy0xVIfHL3TBT4LSGoU36fGlBoLW8IS/bdlAd/K2CwWSp3cH8mZTCEiVJc4rKL8XcJczV93smLekuxa5bufZEF+Kg5BAcxqMcm5JHItWmTEkTJcMQ/oGI985Nmv2IezhRVRz1MADfnUytxLyyk3JXFUrFm9yU/1I38+dlSH3NaJ5ptJgQvQBc3S1UTF2TCbRj+vTFUvOFxqE/hUcJDzec0X9ppzo29LPwLeB1Upd4Ggo6UfJ3ExBRKCyYKHXN5tnxT/f/71cioHq901ZL1przB7KVG8Aa2GOrZyhPC2MU9Tj8kt8Y/YscMNWyJYikYlU76CiwKa/MPDKhY5wZMgMbovVrb1bdZ0cziccHx07a/GD59N2PM/90nKEyhsHhaifQvFHcePvXX8ZvfEjpO5uwmk0QQ7/DvEpePP6T7G8f2w+baDXh6ybfT/gvfSW9gI333phO2dU904Za+1itbDa+H+20jpb1fm+sBnBJoJ/PakCD7vVqzu5TPNd72Sh0+Ik6GeC5UVLTU9Gj8yhCwz7KZ6W2Ca41xj2dqYHPI5IaT4/WRND+Tg1v0ydeGld8ljip/E/8/25KxhmHNViZvVZWWa/JJb1riy1Im4LDkDemVYEKs6JMrR3FZwKOC3IWCiw3cBhrOg0xdH0c21+ARP7p540Kq01cM1r/XOQjHyuzz6nTg2a05zDSwWfMeGlAePOGbufY9xHv3szCkMnDaiIYdMPUQMB+N8hbSKO4QKp5SuCyoEvP5UMcvw0LSMsknC
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(2906002)(83380400001)(8936002)(36756003)(31686004)(508600001)(8676002)(6916009)(186003)(26005)(6486002)(53546011)(6512007)(316002)(38100700002)(2616005)(66946007)(66476007)(66556008)(31696002)(4326008)(5660300002)(54906003)(86362001)(6506007)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?FKXw6EJbnhx7L39b9CcR6nXQCnRurL39BqGBNgPQa8umM5TGgmDrSyKB5T/n?=
 =?us-ascii?Q?z/F9WRliw40GbxBeJLHfRpXrmrRehXrTQ2cEy03Nr95MZPHBx+GqXYiVV1u9?=
 =?us-ascii?Q?ZVmrv71Pq5p+jrITY3zIvi1SQMKpNusI5eWjrzwPi0I7m3sYIO8HnVKew+yz?=
 =?us-ascii?Q?JulIYmt+5Y7cTV7QIlDWi2UfMV3qROCPSfibhew5vUR26UWHJ6t486mkEUe5?=
 =?us-ascii?Q?yc52LJRWNvNr+eWRa8xgv4jMOSK6gcamG0+iSfAPdlmDvhJ9/DJM+4D3jsr9?=
 =?us-ascii?Q?Re9UV9tXTS+dq95sVIqLv1L2aQxb8XL5/a0MFFePpTMlcnBfmaQcJuvoyReU?=
 =?us-ascii?Q?AvMyRBRKh2fPyseXQLcO7g8cVSpdUsXaFzZse9pdlZ3y5OKXJ9czF8VBGowf?=
 =?us-ascii?Q?+opawTJBZZ7SOSrxJRggyBL119u6LKoFZkLhKj28qq6+Wcf+DB6cEcTRkCN/?=
 =?us-ascii?Q?yQsLdoIhoQBi1zydVzF7dS9GkHiAzsF1kY7RiA8iRnLzB5JEeycq0v345LtX?=
 =?us-ascii?Q?kmaRgWYGWIiLIiwDolPEhv8YRAbDy/lfCMELA3X8lS1l2oalnYr2v00EYIVt?=
 =?us-ascii?Q?hY+d0X265NNWuHmGyVW59wX+GSt9OpCX6g4T+1MvZf5YeBmsO+z7btMhLE6W?=
 =?us-ascii?Q?29K7RKtwoD7bWWnn8nYOT6X7v5V/jP3lZ+NR1Td+CCT0zJ2p4d4FoeyjhHwI?=
 =?us-ascii?Q?AmivAWa7hdgque7itGVyeO8LD3CUd2wz9EfEuu24x1+3FI6M1LWfh9ithU0I?=
 =?us-ascii?Q?hOl9mlnnhjXoI58Ib9bVC4Ew2hXE9jWMQg/tfltXT94Ntc5UWJ3qJsC5I2i+?=
 =?us-ascii?Q?h6QVlQ0V77c25UJYMXMhYixCHsh8flKT3PewhstLhjd263STX0yrD9x0QAU9?=
 =?us-ascii?Q?KjYy+7DC1wmvU1sMVyEtyziHJkb57tndxd6yYNCsTcKXi3RTUtLj4V+HYu8e?=
 =?us-ascii?Q?JVW93qNKCQ4/HnSbghYyMYNXOVmX9Vw3DbCjW6EWLSPS8DL66l8c6jsM0LAL?=
 =?us-ascii?Q?Nlrz+DfmAVF5vfkI+UlaE5VUHwHEjH87LmyZG/fWdmrQlHxjJAP/x61MTvz1?=
 =?us-ascii?Q?kc814TZ0b9bgA98fRzVXCcUvGyDIf1ZHGlZcB9seUrDcQVpsvuhknso8SSjf?=
 =?us-ascii?Q?yusXyjGF+xj6669pMo6mBRuX3RjQdw4Tz+w3yqCzOMpeSr3gtESwOkXn65Lz?=
 =?us-ascii?Q?+7ibk6g3y2as9rHNazwX3/mNwRABzu7cE/jOz+koNgnLJhRNsGE7AGtzgehG?=
 =?us-ascii?Q?ujGrm8wdK3+PCshbQYZB7kKcYplPVlTr1wCgcE/g2FscvGGhGGy3kiS+/gHk?=
 =?us-ascii?Q?KJQ9Rm9wrxFHbaqe8YcWizYWNkKlL6UwY9LITdXeBFw5Q5Hz8u2SlOuTp1SE?=
 =?us-ascii?Q?/bMLnXhQfJjCFiwBZUpKRqroX4lnefOrVB/78r4t1c1eKCOFifFE6rjXIdtT?=
 =?us-ascii?Q?N8Js4R1+EyEmr6CMFbvHner4VY5KVotzRqNMBkH+Btw53hiL44KgOTej+kMf?=
 =?us-ascii?Q?Je+iSa9pf/IyLSrAWed+9fChv/hW6OKAWa5HDv8t2bmW//WpK2soBjuL6zB8?=
 =?us-ascii?Q?tOQistkqe6MD02u+jydEzZEUbwzJnyMHmpKd0odd68BEF6pDjC32MHQK2hXs?=
 =?us-ascii?Q?ycflt3ZZD0sktnAGqRUXggo=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 24427a4c-ca4c-4460-9f64-08d9dcb382b1
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jan 2022 07:56:20.1830
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: khzbjsRnf0KFEDVA7PFKiVN+4QSV6qpyjW6C69d1CtgB5J4Hu94bGYxRSfSahrt40Gv6s9rFcoTaGnzLMmEPBg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS1PR04MB9408

On 17.01.2022 19:34, Andrew Cooper wrote:
> The logic was based on a mistaken understanding of how NMI blocking on vm=
exit
> works.  NMIs are only blocked for EXIT_REASON_NMI, and not for general ex=
its.
> Therefore, an NMI can in general hit early in the vmx_asm_vmexit_handler =
path,
> and the guest's value will be clobbered before it is saved.
>=20
> Switch to using MSR load/save lists.  This causes the guest value to be s=
aved
> atomically with respect to NMIs/MCEs/etc.
>=20
> First, update vmx_cpuid_policy_changed() to configure the load/save lists=
 at
> the same time as configuring the intercepts.  This function is always use=
d in
> remote context, so extend the vmx_vmcs_{enter,exit}() block to cover the =
whole
> function, rather than having multiple remote acquisitions of the same VMC=
S.
>=20
> Both of vmx_{add,del}_guest_msr() can fail.  The -ESRCH delete case is fi=
ne,
> but all others are fatal to the running of the VM, so handle them using
> domain_crash() - this path is only used during domain construction anyway=
.
>=20
> Second, update vmx_{get,set}_reg() to use the MSR load/save lists rather =
than
> vcpu_msrs, and update the vcpu_msrs comment to describe the new state
> location.
>=20
> Finally, adjust the entry/exit asm.
>=20
> Because the guest value is saved and loaded atomically, we do not need to
> manually load the guest value, nor do we need to enable SCF_use_shadow.  =
This
> lets us remove the use of DO_SPEC_CTRL_EXIT_TO_GUEST.  Additionally,
> SPEC_CTRL_ENTRY_FROM_PV gets removed too, because on an early entry failu=
re,
> we're no longer in the guest MSR_SPEC_CTRL context needing to switch back=
 to
> Xen's context.
>=20
> The only action remaining is to load Xen's MSR_SPEC_CTRL value on vmexit.=
  We
> could in principle use the host msr list, but is expected to complicated
> future work.  Delete DO_SPEC_CTRL_ENTRY_FROM_HVM entirely, and use a shor=
ter
> code sequence to simply reload Xen's setting from the top-of-stack block.
>=20
> Adjust the comment at the top of spec_ctrl_asm.h in light of this bugfix.
>=20
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> ---
> CC: Jan Beulich <JBeulich@suse.com>
> CC: Roger Pau Monn=C3=A9 <roger.pau@citrix.com>
> CC: Wei Liu <wl@xen.org>
> CC: Jun Nakajima <jun.nakajima@intel.com>
> CC: Kevin Tian <kevin.tian@intel.com>
>=20
> Needs backporting as far as people can tolerate.

Besides the earlier patches in this series, are there any other prereqs
that you're aware of and which aren't there yet in the stable trees?

Jan


