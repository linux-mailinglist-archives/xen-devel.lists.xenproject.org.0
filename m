Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4199550E20B
	for <lists+xen-devel@lfdr.de>; Mon, 25 Apr 2022 15:40:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.312980.530413 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1niywz-0006Ts-DW; Mon, 25 Apr 2022 13:40:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 312980.530413; Mon, 25 Apr 2022 13:40:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1niywz-0006RE-AN; Mon, 25 Apr 2022 13:40:25 +0000
Received: by outflank-mailman (input) for mailman id 312980;
 Mon, 25 Apr 2022 13:40:24 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=OfhB=VD=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1niywx-0006R4-Vz
 for xen-devel@lists.xenproject.org; Mon, 25 Apr 2022 13:40:23 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 416cfc23-c49d-11ec-8fc2-03012f2f19d4;
 Mon, 25 Apr 2022 15:40:23 +0200 (CEST)
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04lp2052.outbound.protection.outlook.com [104.47.13.52]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-9-zCGxp_kVOSelJhb4C6iAXA-1; Mon, 25 Apr 2022 15:40:19 +0200
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com (2603:10a6:10:2db::16)
 by AS8PR04MB8277.eurprd04.prod.outlook.com (2603:10a6:20b:3fc::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5186.21; Mon, 25 Apr
 2022 13:40:17 +0000
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::5cb0:5195:4203:7c2f]) by DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::5cb0:5195:4203:7c2f%9]) with mapi id 15.20.5186.021; Mon, 25 Apr 2022
 13:40:17 +0000
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
X-Inumbo-ID: 416cfc23-c49d-11ec-8fc2-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1650894022;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=q6YyUpGFd6NHtkrn3PKi5UvcIQfaq414X/N9X/i5nDk=;
	b=mGufJvg7O4Yv8L3gJFhs/jSovr10vFqmZQvxB1GXEW8etBjx8/fr6gYLelYLu+4k7O7azA
	b+dBMo4lhGEkKo3FicDZEVvO/ZpMZDzZQwncZd3pWqsEwDXUwmrMsPQXgF+y5ELFHEjkQY
	xX+YnLU5m8AXJGIdbheUtM+EwB3rBSg=
X-MC-Unique: zCGxp_kVOSelJhb4C6iAXA-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=l3alwh2IHvYTowJvtRTeAgoVDfcGHFCMHfDpCXnYt5OlBEAzn8bNrpFGKLGblbrIGnp5bjweWp++c0CGZQiAIYbEohj00g2tAwKRom7Imj3KmnKZ9AoFeS9rtMXLYVWgLPMe4GfrGjdM9A4i4DG4sCwhdk8DG0NpL3RS13Vj3moAw8jwzNKC0M0eqSLmr3xLcYpSgCX+h3bwVbkGJHjAANf/Zod8k4V0LE+/mVwoNOyXYxX12JwowmJe0p9iEqphom1XHmbwVYyCdjBrABdLGfvCNmGmlK62rMXcwt6krpCdvZiqSP5Nq8wg3zg6CWmdF7V/kJMcaBCs2yvGdBrzhQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QnDgujrzOyfv1pJFIwtkjskpKyMN9g/CFoxbb1Ik1a0=;
 b=M45mMG7IJ1s4iXoZS+Tmu1eTql7xmellqSwlUrg3oaWCDjCLW+aR9nL56gAUq+7Pef84MjY5hB4VVeHZHuU5mIzHL3I1E6xkW8/rmDe5RbJ9kiHxhUt+GPz/TcViuGgv4vjiXIBKw406qI1E1Ic8PPxmaCPCAWmCgk+Fm/J9LWjadRCciVIt0LWEZ67E5nBJw1JFI5wMvAURC5NGQlSMJFleRcU644HEtklEQeYTsQDQlVu3388FPg3p9XzoGJrl03Fb3EQQfaThBkeURTdt9gQXxhHsjAGpM9AiOf1l0ujQKhOuJWFT6ro/ULGq0e9dkGWpXtcaJa5J3bgqlh2HGg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <601b900b-daea-93be-ae7d-f2cbe956a973@suse.com>
Date: Mon, 25 Apr 2022 15:40:16 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH v5 2/6] x86/gdbsx: Rename debug.c to gdbsx.c
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>
CC: Bobby Eshleman <bobby.eshleman@gmail.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20220420141307.24153-1-andrew.cooper3@citrix.com>
 <20220420141307.24153-3-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20220420141307.24153-3-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: FR3P281CA0068.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:4b::15) To DU2PR04MB8616.eurprd04.prod.outlook.com
 (2603:10a6:10:2db::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 53c0600d-44fa-4b9d-e1e7-08da26c1227d
X-MS-TrafficTypeDiagnostic: AS8PR04MB8277:EE_
X-Microsoft-Antispam-PRVS:
	<AS8PR04MB82777346FD58E9B87576718AB3F89@AS8PR04MB8277.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	IQK6mEGvIAu95RuN40u3W+jRVJgaUUotxLWmKo4j3khNBny5m+zjv4E7/aze9FQQ6xUL2100e+pqob3WsIBD4YyQYz2lUP/U3Mge2/2kKvuK7Nz3t6JRwP3RPFOVlRSSQtFG6ccAcqNiIk6k2oZZ+ADrshnX1RklQ4xz7FXvv22aGQlEQZ8tQsaxx19ml6NlcAXwCtLPoBf0x+APCmw9uez9LDblPeLScW1rJiTbpyMphgb9F5yE8VFeiNY+PpJlwLJAzedqu/TB9mKwBItgfLrLS6kuAVk43i/JTjd7D8xmHaMxAmAj+6uCYUQb8ghV1++ConwbHi/9wKTnJYMpBEQQRWB/x2/U1jq2kt65bGafkgQzSdVxX3tpp4NKAYrFAKLWS43W8S8QMeRKhPsL6VNy5WziyGMfCSAiouqZjTbUe1tEj8/MUL0Ip85rCTO2WH55Xx5yv+R2k/AS7E3dUxEh/8CYlcyw1bA+4XYBnjhwdzNkdJ2+4tGc8cKYonY8RGZF+/jdVNeHIFGBxkJ9V+UwfyLp9WAjWPxAA5L20Xiks0nyJFt8qKjE4CbvDDjwfEF/cajcyQf5f+iH7JW9UzDTLXNWvH7l1JtFYW+LEQOLahN1R3Ly0ogeY0mJPBE9bqeMAOPD/Ai0mElsrgcuBaKnuEJPhEax+mTRHAQBeFwgwuHJf9Mw2nAa6/QOhUHhRt69Q7cV6cFoXga20xhY4DocCSIbxqnpyMiMIZotm6GfQxT/Q/jhNqD2SQkUvChK
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8616.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(6486002)(66476007)(4326008)(2906002)(508600001)(31686004)(8676002)(5660300002)(53546011)(2616005)(186003)(83380400001)(38100700002)(86362001)(26005)(6506007)(66946007)(8936002)(6916009)(36756003)(66556008)(316002)(31696002)(54906003)(6512007)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?+SuhSw6//hTi9rUYn61OIQoc6nTHKI49uSAU3T+4CTB0qVPjoXbeNDJO6cen?=
 =?us-ascii?Q?QWRda2CmbAkHjgnVLcC/yGvOsd7Z1T2dWpyxNRiIwGpqhFMA42pgIWEPd0m1?=
 =?us-ascii?Q?XkDI1k6bwyqercG0NQ33n78UXnk4OD2hJoD7Av/u8nXQNNcwWrB7aSxINxJJ?=
 =?us-ascii?Q?WIj54UTHaLU7/8ZDH5ifBKBpsHAuekKnZUfP/hy7NsqsswIf9V6cHjQexoBF?=
 =?us-ascii?Q?yPLJccVADLb71kutJLEX+vhC7AnFLE2xS0iM7FLiS8NWY5pNYpnVFUkxRocZ?=
 =?us-ascii?Q?Jk/b1adH4yc8O7K7dwVriNBXdJS1zTsl/nTWPoU7K0xDSAPATi4iE8uwq5X6?=
 =?us-ascii?Q?DYCqoPfdL1lzLZ9HkPUuETIOqkr/7VKA0expAsu09bmqUwyZu0wXalGOEdbz?=
 =?us-ascii?Q?kTOfWdGJ/RKXDTyxcJ1o4YpaAKWot+OuEvTb37q4RgH6aUBso8ARBHW45VKH?=
 =?us-ascii?Q?2XQevRWSN9CAynFfFrwZX8fKd9GA9Q6xADw35ZwgS8Kld7HreVrc4FHXVodP?=
 =?us-ascii?Q?BcUkrWbyFgbELTa++L9471AqbFsERUjweM97C4iXJflJJkjQNiSrQ5b/CtEx?=
 =?us-ascii?Q?9FRAc+JlfaCi+a8pHH9uEw07zugaguPDgYBIupelN+yjOKpwuNDjuSsBVq6f?=
 =?us-ascii?Q?bSOuoK5yQPqx16oQWbfY2yFOlhYOl1uk2MBnHypN2i00iV5XGTXR/fBMCSwj?=
 =?us-ascii?Q?/9Xd23A3ZS2bvUrZEvsvApM+7C8J5g08fDIaevlOPqND/5X2Kj9bCWKvGilx?=
 =?us-ascii?Q?4YCnDGx5Zsjxr9Vy7bCsWbAIUBbWDhT8KRibYDaUjtZBQvjd3kwqGJdnNLSP?=
 =?us-ascii?Q?wu9suv+wuJ/VMYHOzMP0g3IGyIYW6zc0YZp+KEKaYzBIIlyeqMkpKthOkPhA?=
 =?us-ascii?Q?SsZSmsF0Ne32GrZ7Ry/hx2J8vxOIUXhQ6PEU4sUfILE61plBqL+SENRpSlFv?=
 =?us-ascii?Q?e2aD897qoHHKzwLz9ICoFH2Kz1XYnntyyHvqJIW0GFv6Dsz0g10fyGTWM5iP?=
 =?us-ascii?Q?ECDKMUJlpHlZ+S7uxzBxKwEqymQ7qgVQcVZjRdv4o8NWGOadQld5rgkFE4zt?=
 =?us-ascii?Q?I0pZxF/XJM/+WsBlmu/MlZFSZ8iJVGfQcIU6G2WZKDaN8AiB+b7LhXASY2X4?=
 =?us-ascii?Q?vBfyYev3pNLFYtTU6EnZm6lFQKb5ffwCVldpMxHPgONDl1vZfCOF+bbBLQ0m?=
 =?us-ascii?Q?JArfnppm/tznnIAyCpViZ0ssFdetqs/W3Pbdzp4NJVGCaNvBpv7Dw3NLQhYQ?=
 =?us-ascii?Q?kOqXG78MNM5eRnmB4dNiWV0tC+Qkf5dRYzRkZOHuQMWGj4w9cY8m8eauLffM?=
 =?us-ascii?Q?GznU0vSz+/HYTmvWYkdtbjtoR8MpeYOe2U+Ch8ahVmwnp+VLha1w/pLVamnD?=
 =?us-ascii?Q?QAVK4kNciYy5nSrDz/eBFl4OxGD+qINiYhqDci4mOXEGV8h1kKlT3VKH+sBY?=
 =?us-ascii?Q?kb3PCxXRvrr5ykmhvzokzhIDKQUPL/65c8M6PfASQjZTnib0io3/jK3TjRk1?=
 =?us-ascii?Q?6j5tBAdGXh9ereu75zpaSUZ+5pOe3MOfr2f7VZssej4sNz1ed+fZooziFQfR?=
 =?us-ascii?Q?nG0BfeHD9uWEibG1g/73YFdIemXG052qYg4orLnWAaMloHJIWrGDyIsjc0QJ?=
 =?us-ascii?Q?lwx3TfP9vLsy3gUvuaL5ynHzgvXk3f/mTVuz0oxWJQTq8Be4+KUKbhZBNU49?=
 =?us-ascii?Q?p02L6ZpR7cVPVPk2wCPtp+/eQDY+4vNzLOgGa8HiHTEuemF53FwqWuTm27fJ?=
 =?us-ascii?Q?OY4XyrzkSg=3D=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 53c0600d-44fa-4b9d-e1e7-08da26c1227d
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8616.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Apr 2022 13:40:17.7139
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HsqusbgknzfqYw167MvudIPMNcudWVswGvlXo89R8TpO8403/w/NJDdhQNzeNlKufjM8pCh0O641FS8JApypdw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8277

On 20.04.2022 16:13, Andrew Cooper wrote:
> From: Bobby Eshleman <bobby.eshleman@gmail.com>
>=20
> debug.c contains only dbg_rw_mem().  Rename it to gdbsx.c.
>=20
> Move gdbsx_guest_mem_io(), and the prior setup of iop->remain, from domct=
l.c
> to gdbsx.c, merging it with dbg_rw_mem().
>=20
> Signed-off-by: Bobby Eshleman <bobby.eshleman@gmail.com>
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> ---
> CC: Jan Beulich <JBeulich@suse.com>
> CC: Roger Pau Monn=C3=A9 <roger.pau@citrix.com>
> CC: Wei Liu <wl@xen.org>
>=20
> v5:
>  * Consolidate hunks from multiple v4 patches
>  * Rewrite commit message
>=20
> The semantics are rather broken.  XEN_DOMCTL_gdbsx_guestmemio only sets
> copyback when there's nothing to copy back, and skips copying back in the
> -EFAULT case when the iop->remain field is relevant.  Furthermore, it can=
 be
> asked to move up to 4GB in one go, with no continuability whatsoever.
> ---
>  xen/arch/x86/Makefile               |  2 +-
>  xen/arch/x86/domctl.c               | 14 ++------------
>  xen/arch/x86/{debug.c =3D> gdbsx.c}   | 23 ++++++++++-------------
>  xen/arch/x86/include/asm/debugger.h |  6 ------
>  xen/arch/x86/include/asm/gdbsx.h    | 13 +++++++++++++
>  5 files changed, 26 insertions(+), 32 deletions(-)
>  rename xen/arch/x86/{debug.c =3D> gdbsx.c} (89%)
>  create mode 100644 xen/arch/x86/include/asm/gdbsx.h

As I've realized only while reviewing your newer gdbsx patch, this
should have come with an update to ./MAINTAINERS. Quite possibly one
simply deleting the entire entry there.

Jan


