Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id nZuVKPo0KGqYAAMAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 09 Jun 2026 17:44:58 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 47DB5661EC4
	for <lists+xen-devel@lfdr.de>; Tue, 09 Jun 2026 17:44:58 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=citrix.com header.s=selector1 header.b=nAfNXfqL;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=reject) header.from=citrix.com;
	arc=pass ("microsoft.com:s=arcselector10001:i=1")
Received: from list by lists.xenproject.org with outflank-mailman.1333566.1596659 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wWycr-0007fj-Jy; Tue, 09 Jun 2026 15:44:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1333566.1596659; Tue, 09 Jun 2026 15:44:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wWycr-0007dp-GT; Tue, 09 Jun 2026 15:44:25 +0000
Received: by outflank-mailman (input) for mailman id 1333566;
 Tue, 09 Jun 2026 15:44:24 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <kevin.lampis@citrix.com>) id 1wWycq-0007dj-1M
 for xen-devel@lists.xenproject.org; Tue, 09 Jun 2026 15:44:24 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wWycp-006Yeq-7E
 for xen-devel@lists.xenproject.org; Tue, 09 Jun 2026 17:44:23 +0200
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <kevin.lampis@citrix.com>)
 id 6a2834b0-2eae-0a2a0a5409dd-0a2a450bebda-36
 for <xen-devel@lists.xenproject.org>; Tue, 09 Jun 2026 17:44:23 +0200
Received: from [40.93.195.71]
 (helo=SN4PR2101CU001.outbound.protection.outlook.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <kevin.lampis@citrix.com>)
 id 6a2834d5-212f-0a2a450b0019-285dc3473267-3
 for <xen-devel@lists.xenproject.org>; Tue, 09 Jun 2026 17:44:22 +0200
Received: from BY1PR03MB7996.namprd03.prod.outlook.com (2603:10b6:a03:5b2::8)
 by CH7PR03MB7785.namprd03.prod.outlook.com (2603:10b6:610:24f::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.13; Tue, 9 Jun 2026
 15:44:19 +0000
Received: from BY1PR03MB7996.namprd03.prod.outlook.com
 ([fe80::5068:e1b5:b478:8d07]) by BY1PR03MB7996.namprd03.prod.outlook.com
 ([fe80::5068:e1b5:b478:8d07%3]) with mapi id 15.21.0113.011; Tue, 9 Jun 2026
 15:44:18 +0000
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
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=e4x4V4aHBbvqb530XTcsuAK2eaEn6sb5WF6Gz+elxNeWUArv+b5kP5BOVEOnV/R50qjDx+9TJ9UIemIMOiVaiiX5jIh9fALlmNYp2FkGm8Kz8Gm+wl3RXokbhB6CneOF+bEhky5uF7oNefRgVGQNGfeyQY7PoApG399uF5jhHfxZjeLaTBKs2KexhtwQw3S9UubbyPPgvdiUbLHodkweCXWqW6XrA0BFvG+4d07X/JTJk5pHFt0NQAxwuhBPOevhJ8lDw8SvSrLU8tNevKS5OgS+5dav4sGG7eVw7tm0TvPErLZL2EcuZ0DK/nvBbbcSaazNgMaNizgzXYAmX/Bu9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eRrdUcuadOfoHibR0ucukc4XtiXuGrxKG+qQVPAVGt0=;
 b=UKOP33xvGXAXDWeFmAueO6nEE6jR8BYG7HosEHG0i4eQtPyLNYOkBO6YIDgvx/ir+7d61Ia1334NecqRbMHw45wnBYel43bX+XDUOSwbAx5e8gzbd7EuOmaVqouhWrN+Cmu3yYDnAUc7EUB9DzDjIPAbJyUBYUE11AM8/mcmeLUZb2Asbj09ApRIXa0X3JWKnLiw66bSIk1Q468x3GxNGZCVCjH+ogRkwA6gUMGEqzrlX+ooc/RGWfeSP7kKZpYUoL6fVQc/ioESb9Q01g2kopNvkNiT/LMwZXIIA/g7px87jtTaD+JARtqI41FNigxs3JRADq2rh+4nbDyJ4PNaBw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eRrdUcuadOfoHibR0ucukc4XtiXuGrxKG+qQVPAVGt0=;
 b=nAfNXfqLJoU1ZV40RYiX1LQr0DNY9TLW8z3lyoG8E6cBA1Cu3GmwzFhfUpMezZM737tkqIPPFYPkH5V8Byz+6rb32uLg1OlXqDe5i+itoGWIrW3aXfdFA0EKpqmriq0MvVwfa+O+jzoQ4EKvh+PlS4waGW0N6GTVDd2kwUbHNrY=
From: Kevin Lampis <kevin.lampis@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: jbeulich@suse.com,
	andrew.cooper3@citrix.com,
	roger.pau@citrix.com,
	Kevin Lampis <kevin.lampis@citrix.com>
Subject: [PATCH v2 0/7] x86/kexec: Secure Boot support
Date: Tue,  9 Jun 2026 16:45:11 +0100
Message-ID: <20260609154518.779757-1-kevin.lampis@citrix.com>
X-Mailer: git-send-email 2.52.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO4P123CA0400.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:189::9) To DS1PR03MB7992.namprd03.prod.outlook.com
 (2603:10b6:8:21b::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY1PR03MB7996:EE_|CH7PR03MB7785:EE_
X-MS-Office365-Filtering-Correlation-Id: 21a85d90-6486-4bca-b1d5-08dec63df69a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|366016|18002099003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info:
	VE8kvUIrecOq8o2aAl/QnLDiRbU3wVKsvghlUE+gmYjD058KwtOnte5qCRXVuw5NZGE2J9RhJWjJylkefgUwmARgLU797+GeParpaMOG9bVwhojfnKKItPIM/frOsnkFtuiRaHG3brG6mYgmp8Flfjj2KNxt0fmsdQmvjYI/BROxJJ9KZ3+PqndBLJMK9y+lO6AT6jHu6VVT5KGsngRkGJXx7W7Lo9qSbiu10Y0X6gXaHl/1P90z3npwvEwSPnoZrOwxr5poB6pBl+3FUcqNbucIPYPBgC7/W727S3FsvdKynTzTDNw+skNEAy1oOngZxshEILnYNd0z8QCDmcYJJ1oL+a2ZSU+RrYJGPlGjqtUdTzuTmYnPgzvA/3cbZwRlwSvzvjGKrPpmyT88d71iQUTBHJaaU86Cc7g771d0eC7Qifour5HY14qPi+hYNm7z4BNcXMP5zX6Z1aWbHntcBPtKbROXs6dwLcCl1K1O9xg299obbPcZmAxDVIBT3bry/TKdl1WsYwwlUQnpZiwhQhIPnr6S9ymOnNt71fesfUs0YG1ya+p5aRwFl7R5hk5IvYAW/6sFrDlkfdbsr06MmJUWl53Opmqm71CXzzJOoEbwrBqLAE9nRB45/lvrN4WZoFzs9+vmULg8uGOSd8sH+fWGBbJw4Y+KKzSPCu20RCGsvhBNgrshNZ0ObMmuGiluwi70eWKHLJhx6L5plHNidg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY1PR03MB7996.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(18002099003)(56012099006)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?bUzBPo/2TX1SNnY5j6JDs8G/76YAfu2D/lVL4caSB/V4hJxR2+a4nfCKj5q7?=
 =?us-ascii?Q?JLTvxYxSTcilCO8qTOYEYqO/9JxmP93bawkNKBd+flMj9sy1ckvm/hYK2T8m?=
 =?us-ascii?Q?owgTFKuz2pe/hF11HG0kW9ZHKIK0iSFfSQJAvZWSnin+54SbJ0srfL0YhBgU?=
 =?us-ascii?Q?3BQXWiH919k0vuYtmToiPbqtp7ZlggJrrVxQMsT85J0ULU+/i6ul6tBcfBZL?=
 =?us-ascii?Q?KqY7yCecbXD6IvSLHvXvBFvJjfBkuG3ef/gIJdMgVcRdALhylVxa0HhnN0zI?=
 =?us-ascii?Q?j9DMyike2VOB8uFKR0snAxCdnYnc/+MePwz5MQC3u7zhDXfwgwzvu5EeCstP?=
 =?us-ascii?Q?6WmCC9Ur3h6ew6y6LHekBz7ZNzdn7Io3KNQJ1nI+ZKTXDGk5uiW2Lb8z+XEk?=
 =?us-ascii?Q?XBqAJGdPaBsAmC07ZInWyBOwEmIfLJP1Qv/BEymvSYpyyeuds4hOnAP2GoYf?=
 =?us-ascii?Q?3XOI5G65zBGII8nCcV8YgL3XCYDjhSx+bdoX03BbiVa48/SJk4Ls2gOYLxeV?=
 =?us-ascii?Q?EiynosH+HzYitmTBn6idGcDM1YqNo44N7xcWTMy8dWpNFTHEE7brWHke3JoL?=
 =?us-ascii?Q?KFGyADF1AtiGZxnyOe/vdaE/wJ4RoEJ0JGM1LmwKvCsmM6LwFlOP5v8QfIa+?=
 =?us-ascii?Q?ZiSXxuoQakPj/hb4N2cu/i/wLjYpDR1dF4my838eCIm/ZQpACcxjqJ2Flucx?=
 =?us-ascii?Q?5FMZjcSSOgXqc2pOJiLkGc96WguzmNWgzBCNhHPH1IjJQrJONmnSVvHzmoCY?=
 =?us-ascii?Q?O7wm9PmofVYRPOpFc6wldi4+3ohIchu2kng6KdBK4/4WncTVNMPj9x5oIO45?=
 =?us-ascii?Q?yEKeDjgbDpw0xpA2fxXfXwR0QcbEhr68ceq4i5iKYlmifaH0bdbsfjwu66Rb?=
 =?us-ascii?Q?bdHHXKBvtWLnpVpD97upEePudVDNgWko37T9OMzWih32NjzDJ+H3M545FmQm?=
 =?us-ascii?Q?PUqIhXGhZFoplZHatsndkndShmwOx4eIM33/lZaM/Aljac5BmtFQ5WpWbYtU?=
 =?us-ascii?Q?kh0RhEgcLrkiFoIWriX0gfGEi48r33ECIBFvlKoBGgUv2CPaBwjpJ+WDPXRk?=
 =?us-ascii?Q?2/JY2anE3yYzcwuG/WGJsWePUsffeIgfFe1EazlQBiz/sFsgHq78xwo/kU2C?=
 =?us-ascii?Q?+zCiQX6zjGuixiy/8TUcXQYSRe6AHz947Ozhqky04FEWH1oyyjnWVUWcF4e4?=
 =?us-ascii?Q?/6dF7SQkA6bSMoBoEFGXeBkBooNfN7WNRuYxtGgs3/I3ylYqJcvgn75cKCSr?=
 =?us-ascii?Q?nkIpwIDdkp1QK1h0PXm2zfe8n1v8Vyu1H9kjh/KahDhgl+OLE+/3jHrpElQk?=
 =?us-ascii?Q?4qlV2116nJAq/vFt8J7+gqeJ/K2EOl78f/IvtjfyQUSe95LqulKezlMZWZih?=
 =?us-ascii?Q?YbWfKCSk98tsYAdp9NfJ+Tkg5Mbhm//r275CdsOo8k3oOFDQMDSD1TMLFlmb?=
 =?us-ascii?Q?S+ywrIIuLu6nAbE2rHQRZWXHlPDFzNiGHiGxLRBwpU9yGknu7YAI0anyU5vm?=
 =?us-ascii?Q?7xAIBKgpGymBDlbTkQ40/bGIGcILkope3OkojuWKiIJ0WKRHu1/xJoxw3o+1?=
 =?us-ascii?Q?HJGHFCahuFtUrxFdKx+9yIlKamXw5E+pJiR96+B8MpKSPprmJKocFEsXWyWu?=
 =?us-ascii?Q?nhV1vM1X0GoNUUwWH7+cBcHRTrG+4jkx0J5fgnwMlruy2zCTMyE1cLFKhVbE?=
 =?us-ascii?Q?OPKcaxhd3Q+heC01ZckenM/fxjDwQm1g8HYXBNgscZvCjrj3ZsOQo4u/QREU?=
 =?us-ascii?Q?J9aN0JtBVw=3D=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 21a85d90-6486-4bca-b1d5-08dec63df69a
X-MS-Exchange-CrossTenant-AuthSource: DS1PR03MB7992.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jun 2026 15:44:18.7240
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: J3iJ5AF5HGbL9s1GS30JMSv1jeLB28IlmDv+evwy+gUT1Zuze4yzbASOOa7d/gpL+6DKRC87MPVzOlVIBSU7Lg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH7PR03MB7785
X-purgate-ID: tlsNG-42698a/1781019863-18F66F3B-CF9DC29E/0/0
X-purgate-type: clean
X-purgate-size: 2402
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.69 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER(0.00)[kevin.lampis@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:jbeulich@suse.com,m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:kevin.lampis@citrix.com,s:lists@lfdr.de];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,lists.xenproject.org:from_smtp,citrix.com:dkim,citrix.com:mid,citrix.com:from_mime];
	FROM_NEQ_ENVFROM(0.00)[kevin.lampis@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[citrix.com:+];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 47DB5661EC4

These changes allow loading and booting an EFI kexec crash kernel.

For this new EFI kexec type, userspace won't provide purgatory code.
Instead Xen jumps directly to the new kernel.

Signature validation is done by the dom0 kernel. Xen then calculates a
digest for all the segments stored in memory. This digest is verified
again during execution. This digest check obviates the need for Xen to
verify Secure Boot signatures directly.

Link to v1: (I should have changed the title and/or version sorry)
https://lore.kernel.org/xen-devel/20260602164911.2684471-1-kevin.lampis@citrix.com/

Changes in v2:
- Removed dependency on lockdown mode
- Split work into multiple patches
- Move setup_header to appropriate header file bzimage.h
- Renamed setup_header to less generic name bzimage_header
- I couldn't find a way to use the EFI header instead of setup_header
- Extend digest check to non-EFI crash type
- Do digest check earlier for cleaner failure path
- Print expected vs actual digest on failure
- Swap xen_kexec_segment_t to struct kimage_segment in separate patch
- Plumb boot params into assembly code in separate patch
- Rename rsi parameter to arg
- Remove references to "EFI" in boot params assembly code
- Move %rsi assignment earlier so it is valid for the 32bit path too
- Zero general purpose registers in separate patch
- Zero 32bit version of GPRs for performance and correctness
- Zero GPRs on 32bit kexec path too

Ross Lagerwall (5):
  x86/kexec: add digest checks
  x86/kexec: rename setup_header to bzimage_header
  x86/kexec: add new struct kimage_segment
  x86/kexec: Support non-page-aligned kexec segments
  x86/kexec: Implement new EFI load types

Kevin Lampis (2):
  x86/kexec: Pass boot params directly to new kernel
  x86/kexec: Zero general purpose registers

 xen/arch/x86/bzimage.c                   |  47 +---
 xen/arch/x86/include/asm/bzimage.h       |  44 ++++
 xen/arch/x86/include/asm/machine_kexec.h |   2 +-
 xen/arch/x86/machine_kexec.c             |   3 +-
 xen/arch/x86/x86_64/kexec_reloc.S        |  24 ++
 xen/common/kexec.c                       |  42 +++-
 xen/common/kimage.c                      | 268 +++++++++++++++++++----
 xen/include/public/kexec.h               |  11 +-
 xen/include/xen/kimage.h                 |  23 +-
 9 files changed, 363 insertions(+), 101 deletions(-)

-- 
2.52.0


