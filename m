Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 10F8B4908AF
	for <lists+xen-devel@lfdr.de>; Mon, 17 Jan 2022 13:29:20 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.258163.444285 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n9R8J-0004NZ-AU; Mon, 17 Jan 2022 12:29:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 258163.444285; Mon, 17 Jan 2022 12:29:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n9R8J-0004LE-78; Mon, 17 Jan 2022 12:29:11 +0000
Received: by outflank-mailman (input) for mailman id 258163;
 Mon, 17 Jan 2022 12:29:09 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ZUQe=SB=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1n9R8H-0003oj-Ky
 for xen-devel@lists.xenproject.org; Mon, 17 Jan 2022 12:29:09 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 11705d8d-7791-11ec-a115-11989b9578b4;
 Mon, 17 Jan 2022 13:29:09 +0100 (CET)
Received: from EUR02-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur02lp2053.outbound.protection.outlook.com [104.47.6.53]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-5-2R3h94AoMpSqoaV1X-SxtA-1; Mon, 17 Jan 2022 13:29:07 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by DB3PR0402MB3724.eurprd04.prod.outlook.com (2603:10a6:8:5::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4888.12; Mon, 17 Jan
 2022 12:29:05 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe%6]) with mapi id 15.20.4888.013; Mon, 17 Jan 2022
 12:29:05 +0000
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
X-Inumbo-ID: 11705d8d-7791-11ec-a115-11989b9578b4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1642422548;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=gCmxGVbIXxPvDpmfAy3Iy8sAtMPrVrIZDTvqXcFswYg=;
	b=UyT31jPBzMKsfyvoNujsh/jTdWq497nlF3JuQ+cg/KPtWI8SrZAJASPZMnG+GNI+72SMmL
	twX2sM0lqTW9uZ7ZhOUuzPlMOZGSeKNCYSu9zw+GcKIiQTS2uH1brkl9ixrx2xP2iemaFI
	a+7LCL8kFwVXxEByEi8+jwux8icNOCI=
X-MC-Unique: 2R3h94AoMpSqoaV1X-SxtA-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=N5t4rlqx2DK+MU2OAwuOKewWYaHHa+CLuwkNQ6GaWkoVzlInUYB2nAMhiCJsaEpKTMOo3npQyTEx4pIJcsQJ0KwWXQq8FYUYY+Q9o7V9NvxZllyvIYrAGi7w9IEf5/NcZjQv5lTS+nLp/jnP/923S2ONVEWS1AsODPxaVFNofQtnjrkp+LDJOR1a174HP1CH7hBjLJPDmJSMMPIwdeNoDakfcHfA0YclvkcQm7J+vg3Q5l3+KaPJL5gsR3IWIoRMtarW3us2iWB68CYywIO5iN4e6o4KAtR2ROFaUr8wzvfkB7ulNDGcuvBVT2TnC9j/dH4a0SZKoA83ZC3ZMuWilw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=G4wOsbXbPrlEBX5rLLoH2v3oYlqloQo3nYvo1wOAx/s=;
 b=SS6nfx3bxt5GAKv+1mG1NovnuoJW74jdgdvyNOVhJ5+H9sKxPd6cS8SS0IcHY2u/y2WbeZvSCsXjc/XRL8P/5TRARJz+48qUkPVoDuRCXuLFCK2OBIdRsnn5GtNFHkWL5L0UCtq+cPxm/a7keoOO4uWUSK8KbJff+hAbcBaY9TBNvO8WrLHjikbgVWaq48ZqShB4E+kfoqOlQ5S6TDgBVDmSZ9dqIJkYVGJqEyCJucfsN67hOfQoTxPTIKsKcwaJPsr5PLeTXAamo82OJGvsdW1fPwci6HlY/5tuVVLtmAPK0fVnhfz+RL4XAShvMLbiOdS4zvmgiuKZ3zF/WpNZAA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <782353d3-9f6d-b21e-7ef3-00bc204f11c7@suse.com>
Date: Mon, 17 Jan 2022 13:29:04 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v6 05/12] libs/guest: allow fetching a specific MSR entry
 from a cpu policy
Content-Language: en-US
To: Roger Pau Monne <roger.pau@citrix.com>
CC: Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>,
 Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org
References: <20220117094827.16756-1-roger.pau@citrix.com>
 <20220117094827.16756-6-roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20220117094827.16756-6-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: FR0P281CA0052.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:48::20) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7b00f976-1c28-4f91-6d35-08d9d9b4f379
X-MS-TrafficTypeDiagnostic: DB3PR0402MB3724:EE_
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-Microsoft-Antispam-PRVS:
	<DB3PR0402MB3724220FA8A1B77544A91B80B3579@DB3PR0402MB3724.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6108;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	hYpY5iQo5AJdxlAt3lySvyNoC5q/HTn7YSPFDfaQc/48Y9flRA+lFCSDQBgvPVx6h82ICeOfpqPlX/NO2oNEBh9jjQkMWB2Ga/CWM8hKsLFmCeQ671TF3z/yqjLftiQXv6UeN1aKj8hpoKt0dUUQjk6ZUmrwmtIRb2KwttXAHai93T1JznAqVv2ywt8trLJyBhldD/cea2jDERVpi9/msFzXIqaEwxZqK7xkY59d/uYPlHsymho10MvYFgQhCkk3mSqBQptPVUn5mZ7VTIhhwMW+QlNdIFdQV9AvHawvxxYRi51XS7GCwo3oomc66YkBFvGgScbMQtvlTCQah+8xh6Imqz6M2RluRAMRu5Ek5h2QdDK4GTY67QysSXmC8bEqy7PNoXYPtMkPJ8AjMfhwCoAyjvZ1xED4Y5UTp6BoRQ9hFU/+puF42vvIdoKRgnJqsk0aFTjfG22zsERbKu/5Jlshk2MmqI+2Zl27KKTOyKFQ81IARLAwvajAGKqUA1kr8UcF5JUGHMDVXA8KvjzM1FhVyN9Im32nkdXbchgdw+LWK2262f6JBpxJk1ceC/jrlmnBPJmAS4Um6O7tIqMnMpC6yvICAPBErrnDDlc4esGis1fb5Xpwny1QiIzVaUvZBq16sQZplmsFaUK9xGwR8Das9YOwtntL630hzy+HOtiHTOUGkAS8s+M/TPB28uyGKfk1m251oo+jQi9g2k/Jb4LyvrebJCCS4FosW4rF9DM=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(8676002)(86362001)(31696002)(508600001)(6916009)(6512007)(8936002)(6486002)(36756003)(4744005)(5660300002)(31686004)(38100700002)(54906003)(6506007)(2906002)(316002)(53546011)(66946007)(2616005)(66556008)(66476007)(186003)(26005)(4326008)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?mhhEzb9aalxBhj91w20fTZgRKtTFAOGpFOi6WkKkwU6iY/REkUZxI/anOJBj?=
 =?us-ascii?Q?FnaEi3jGTSPadPusn/INt0YvR6g+nIPIxJXi9Dmu0XHIFMOqT2wHoBzAju5y?=
 =?us-ascii?Q?/yhw/tObQ29PKSRnz6Ir3IGS9xuOrcE745J/WNGIu6rHRIlOkpO/F93Mn7lV?=
 =?us-ascii?Q?bTTFZX3RxxWsxHGQJBZG5YgxCKS4+EzFcxrYeQuaJHTtfzk4k782AhVlp7GU?=
 =?us-ascii?Q?0lcWSLZ6lagSQvPQt0UHmV5e1Lmq3JRK9/+e9eTyjuQ8piHavqkquCEJMEbx?=
 =?us-ascii?Q?KfdeuHjnXXQWiQJ53NyQ/s39S8stzhN8fzKUKnbmhj2HbPJm7Zv4gkcSN7V/?=
 =?us-ascii?Q?sSTbw/8735hCdZ+6727I7FJoc22gyFDiuq1pqcIQ2ouQcWzFDJaboYa//iR7?=
 =?us-ascii?Q?pREDz2in0fYB0oqFPi7yrerb50jQTha4NtmhTfMHB95PTInkmPMxPtd7AaqI?=
 =?us-ascii?Q?lPd3tmbcfvTGNWLgO6rpFVLc3EbBkv/cHgmkSY/+kSYEqk4ZO51naOVdGAUJ?=
 =?us-ascii?Q?x/HqoOK6ILii7Z+reo7VzvVt+beN5pPAzv6YpIse2MPj4yXopTNYqm29A+0h?=
 =?us-ascii?Q?vpSFXrb3p32NvyprRYTudcGKutph0De3kKIlUKTVPet2T0Xj6lMyN0US7n6X?=
 =?us-ascii?Q?SbeP6hcyTelPjRi5ufKwlrn/BEarFdlnc5oQGxbR3Cbhz+bTXFhJsJl1kuO1?=
 =?us-ascii?Q?5V4ayuBOgidDaaHQx1EtHAIXD4ieID37bjX+LFfPeF+eHShKEfvKiJuTf49r?=
 =?us-ascii?Q?ZtcG0rT2FlO+B0sJRefpeejRfBShIpe+7NpJLHBC9wCOlTQGBmVwqw1TEtg8?=
 =?us-ascii?Q?4pAQnWhbgpzbTvaQEF/lgiMGlBdm/1umm+VLp6ZXeT47JoL/RizX/Tkev0yw?=
 =?us-ascii?Q?oYNn5AFUEhN3VyW7QvC9MN6vKa+2RGh0ocKwQAt8RslRqLcf9ekCTnq8TGQN?=
 =?us-ascii?Q?zXcRfWQH+b5azIEJ0FcsSzBAKIMX4JWaqnxew023GCJ2NA6FzoUNJW0lgUtf?=
 =?us-ascii?Q?unhxuFL3Zi9n5qkK0SfNwOqSDUWl+Svl1318gSkr/7XrVtjKctYzMIWgZRmR?=
 =?us-ascii?Q?VG8ML4qLiPyT2A/VjTw0Yp4Q6ul/0Ut1DuWaNhejgxYmpxI6YCl6blXvFSce?=
 =?us-ascii?Q?K0z5A6jw0hATFlWzftmKeGhA38ylLUZwGaGik5xPltZIQ91ftaODEVKNBfCJ?=
 =?us-ascii?Q?CWMDdvzEwliIWEc2rdkeh5mppxSjXUx/c5UxxCHtd6/ZTJ6mFVrtU2WEydAm?=
 =?us-ascii?Q?q6AGkIUl4/+173C08+Okob8LWCcyx7+3FMIizhR0S6KlB6HCF2s6+RXnhhJx?=
 =?us-ascii?Q?+dYeQIyzKn2PoKRsaFjjHcNk1aKAWUKHGs/k3d2RZSK0HgDa4/lrlCVEqghh?=
 =?us-ascii?Q?muv7R/GSY8ShEI6GW92Lg7kvRzAtheq8CNlT0dY9iwJY34OLu+yA8/JKVqdX?=
 =?us-ascii?Q?o6gVkP+Gwn8gDzyGfAJQRQNdLQ0LvLT3gYiFG6c3CaYCwRPzepQsZIRvM3jb?=
 =?us-ascii?Q?X+xiUC3pTCCtiMdMj6FEWtrvwYoyEmSeGHfs12TXoAyawlbakDea6royutfv?=
 =?us-ascii?Q?Pf/86h4y41WRSJtCu+gM7NruIzHC4ugUSqoOfN7vUaJA6u9iVbgxIzsRZwTf?=
 =?us-ascii?Q?gI8n1uO5u3EK39Mn6xRrUt4=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7b00f976-1c28-4f91-6d35-08d9d9b4f379
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jan 2022 12:29:05.3017
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QZQ4cuGcz4ujRbLtkeCmp03/HE8zKRz/J8wPRRua/FprdpnlNF/j9C8ZVT+JOCE+Tr9KQRYY+2LBIwbPbeqM3Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB3PR0402MB3724

On 17.01.2022 10:48, Roger Pau Monne wrote:
> Introduce an interface that returns a specific MSR entry from a cpu
> policy in xen_msr_entry_t format.
>=20
> This is useful to callers can peek data from the opaque
> xc_cpu_policy_t type.
>=20
> No caller of the interface introduced on this patch.
>=20
> Signed-off-by: Roger Pau Monn=C3=A9 <roger.pau@citrix.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>


