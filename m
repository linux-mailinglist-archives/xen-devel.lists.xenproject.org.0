Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 40F6F452B70
	for <lists+xen-devel@lfdr.de>; Tue, 16 Nov 2021 08:16:32 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.226136.390701 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mmsh7-00040S-Bd; Tue, 16 Nov 2021 07:15:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 226136.390701; Tue, 16 Nov 2021 07:15:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mmsh7-0003x3-7c; Tue, 16 Nov 2021 07:15:53 +0000
Received: by outflank-mailman (input) for mailman id 226136;
 Tue, 16 Nov 2021 07:15:52 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=5Shi=QD=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1mmsh6-0003wx-5n
 for xen-devel@lists.xenproject.org; Tue, 16 Nov 2021 07:15:52 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0743b29b-46ad-11ec-a9d2-d9f7a1cc8784;
 Tue, 16 Nov 2021 08:15:50 +0100 (CET)
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04lp2056.outbound.protection.outlook.com [104.47.13.56]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-23-Yd3SrmEpPFSnazXZAqrjxw-1; Tue, 16 Nov 2021 08:15:49 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR0401MB2447.eurprd04.prod.outlook.com (2603:10a6:800:53::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4690.26; Tue, 16 Nov
 2021 07:15:47 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::8062:d7cb:ca45:1898]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::8062:d7cb:ca45:1898%3]) with mapi id 15.20.4690.027; Tue, 16 Nov 2021
 07:15:47 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AM5PR0101CA0013.eurprd01.prod.exchangelabs.com (2603:10a6:206:16::26) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4713.19 via Frontend
 Transport; Tue, 16 Nov 2021 07:15:46 +0000
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
X-Inumbo-ID: 0743b29b-46ad-11ec-a9d2-d9f7a1cc8784
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1637046950;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/vGvseAI65bUvbGhMv5fuW5MzvhiHtpP1y1aNVYnVxg=;
	b=J4LHjVU43NIytB8vHjV0dvMyKDqXH78QR2P+ksMG2UaEJECxYNWZEN3WmPHLlu88UNHwlE
	MoConahOaEhlLObNxH9rWLdJHk7dDY4qG+osCkyb6hT9mBzSO9KR4vfJxNA5xaVtGgwZdf
	MMH+FWdQ0pAIl6VxwdXXOEv6Xiauhww=
X-MC-Unique: Yd3SrmEpPFSnazXZAqrjxw-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=S4LyZNf/yt57DekwMwZFS6YYkZdFo6rvWvZK2mNOPxnmcjoEn+hLFm+feaap3HmE3Uuae2vlFWkI+YVighvkSn6eKF6q+Z8ih2vF2cz8aV0GNgoTE8NEuK0+IFTat1D61BNZ9RDJdzjo5R0CYrlsooqWqXjHMZJhTEMH2GD0q5yp0Uis95pCSfXTGnZ7MrOYq8yl77KsMVoINhY6RoXSv5ApNyeLiiCTYJlWB3PLnbSOCk2lmOMbMz+W1r3bgwDJuUK+vZ9UmQiPvXlNwOnG2g5MGhqpArUHdV7H9D7VgWi1BVUca/S07f7JxOFQBS82nV/drjf4VbAnW2ei9VlOQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/vGvseAI65bUvbGhMv5fuW5MzvhiHtpP1y1aNVYnVxg=;
 b=fL8JBLh48vKZ8pmmV7VgSkjWNvwS7DaCJIRvVwqIrT+ZDgaVM4Qgb+pa9yBAAwtKReL5sDHVUMiRjrrhRgqLItaMzs+JYTaar7rN1/dcL675lDjtpog6enIuy68g62N/a8TCGTkJPa0Mzwvoa1KUPv9/g1f3uyQYRxKxPIwavR6inCGpMnLj0BIJa42VB70r8oFIFF7Nj24MatFu54XCXh5TMGCAf6vroXfODFBFaPMlbdqQS+FwQTs39yW2KGeJf+EKwRHpEBcwPIynEvZO7Y9XIHk95DmhgMQy6eHYJkvKdxUrTDYabmGkYgaqG1Ijarsm1Z60J1Upi1S3GfS3ZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <1955289a-03d3-389b-1a4d-905d6c708ccb@suse.com>
Date: Tue, 16 Nov 2021 08:15:45 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH 1/5] xen/domain: Remove function pointers from domain
 pause helpers
Content-Language: en-US
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: Bertrand Marquis <Bertrand.Marquis@arm.com>,
 Xen-devel <xen-devel@lists.xenproject.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, Julien Grall <julien@xen.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>
References: <20211111175740.23480-1-andrew.cooper3@citrix.com>
 <20211111175740.23480-2-andrew.cooper3@citrix.com>
 <D0965ED8-C1FE-473F-91C7-3EE18ABAB3C4@arm.com>
 <a1b2aa1b-7d8a-4ab6-cde5-25581ee9841c@suse.com>
 <C3FB48C2-F619-48A2-9268-F0938405133C@arm.com>
 <fc9fd8d6-7461-367c-01c6-f4c852e13f54@suse.com>
 <alpine.DEB.2.22.394.2111151637330.1412361@ubuntu-linux-20-04-desktop>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <alpine.DEB.2.22.394.2111151637330.1412361@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM5PR0101CA0013.eurprd01.prod.exchangelabs.com
 (2603:10a6:206:16::26) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: daae3473-571c-4ce8-3fc7-08d9a8d0e91e
X-MS-TrafficTypeDiagnostic: VI1PR0401MB2447:
X-Microsoft-Antispam-PRVS:
	<VI1PR0401MB24473BA8A6E8DA4942F60692B3999@VI1PR0401MB2447.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6790;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	H7XF3JIIH560R/RiW19Kl7nw1nsRvSypxfCp/Ys3l5tX7KNCanO7Db/pJHpNinCFSSejmV5s555aIvyBSWHPC/t6uv7u9wIPsc4cvjiAo+IjqeODGdlnYY3X9ZwU5MuDHMPmFASv+iooR4gq1qZffUj5rxjCwnPAmCF23nSXv0yYgHsQYiAC3OVruH+uQRxPSUBz4AlfpBI7t5Qcuqm/p7c0dkjXIShdxqVUcd4PmZpvniMxBDp0K2DB/zWvSZDcxeH1I/g5WHcy0PZOpl6D/srOc0f6nLof0Y687HchdGcxD9OhUiFolCT7iXX0/G9iLWAHzFwwbQGB+wY3a9JeU9NXMEDVLnSzC1IBWACtEDZGk/pLirccxC225JaH53HnDydv15PVuLjaP57voS8whlv+ipzVQKtWxjVWUMsDIfREg/DNZcqE914tOMzTEiccA0ornBowKwtQyMC6V7/PCZgF01wAB8me5H014NaVrhE62YwzvZSlL3Sphq4mWE/uU/rhrXqBiUmRzu1j1NT914Iixwz2q5m1o162J6h6ZPFVQzKYbXvO4DJsOQTgXg3OKnUPSWIUC4Gljy8Q93PPid4dNT/C2Xof0M209y1QdafAZEwXsdp9YrFQTLk4BjlfSMAMC01n11LTuF8gfCjbccZRdMT1lUAdfNzWhVqCl8TTrS1i9KDdUbJUieurIZQo744AXxndYH9+caZcoc1jhg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(31686004)(956004)(2616005)(508600001)(316002)(36756003)(4744005)(66476007)(66556008)(186003)(6916009)(66946007)(86362001)(16576012)(54906003)(31696002)(4326008)(26005)(6486002)(5660300002)(53546011)(2906002)(38100700002)(8676002)(8936002)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RDNUclMzdGJ0VnVWNStGb2lSajgzMEt3bUpJSVhJK2ROYzhqKzhHWDJ1R3Zr?=
 =?utf-8?B?bzh5Q0VNU1FzcTcrSXFvZi92YytleEU0a2VWeFZnNzB6Q3J0NVVIUW0xVWFs?=
 =?utf-8?B?OEJIcWFmL3BRT3h1RFBIWVdDaUtaK1k3cjBIRlQ0R1lPbzJ0MkNPTnNSc2ZZ?=
 =?utf-8?B?WHV6M20raXFqeDRIdFVtc1paUnlFTGJTSGVrSTUrNFdacnR5djVLZXdXZ3lE?=
 =?utf-8?B?T0VHaUJqdTN6bEY2NGZvcVI0Rm5GM3JqeVpNYXA4OW1PVmc3Zy9LbURyTVZI?=
 =?utf-8?B?d1gwWjRyVU9IbVYvRUU0VllwMU54bHpkNi8xc0lQeTllT2gvbGQ0UlpmWVhT?=
 =?utf-8?B?RHFzN3lpLzFkcWFsenNDeVIxRjdncjRESzhFanRtSWRTeU5Ibjc1c2JMcXpr?=
 =?utf-8?B?MGxTSmJNcE5YQnZwZEV0c0xvMEl6UmxNSTFvVEo3VnkvUWJQY1lzalNjbytz?=
 =?utf-8?B?bUkrZ25XL3o4YWxzbmozUW5pSkx1TEVBZWlVTEhMTXMxUko2alZvYVdwUE5W?=
 =?utf-8?B?ZEZKNS9wRjRXY3poRXJkWXV3M0ZGUEdKc3hGRVVYMFh5eUxTZGpUS01KN1N4?=
 =?utf-8?B?ZmpGamowZXVzUVZESzQ1MVVDU1FDZ0VRSFk4VG9QQTZKSnlDekRlcDBvTk01?=
 =?utf-8?B?azY4dVhHSnUwdXJVcFFnWm9zU3ZqSWhvUVFaQlg5Y0VNbVIxSWNRQm94akQ3?=
 =?utf-8?B?RTJURVBISkhxRW0yaW41c1ZqejlKMGpGd1FmUFNiM2MrSVhCakR2Um1mTUIr?=
 =?utf-8?B?UlMyVEI0ZGFoMDlORndMbUhBZUpUMEVOQUdodWhsMzJ6TUJFWUt5d2hZOWRq?=
 =?utf-8?B?LzlyMWdNTkFyaGYwb0RjcXRIZGt1ekZxOE9MYkc0cWdrVGUvWGwrT0ZuQSs4?=
 =?utf-8?B?K3ZuSzI3QXdFUFZwZHBzbVhPdFgrYjByajBjcWJxL3dZSmNOUkM2a3J2Mzhn?=
 =?utf-8?B?ZVNJNWpKL0VkUVRvNVFlZkh4QzY3dTJwbWN6ZGliK2VsMzd0MDlWOXEwUlAy?=
 =?utf-8?B?cHdiRENJd05yaElheThDc2UxZ2RPeHBzbFpkVGE3ZG1KSmg3NTVRMTNEL3pH?=
 =?utf-8?B?M3JEcE1qNkVvNWNSZ1pZd1RqMGJFVGZmWktETlJsT0c1Nkl3M0hlWXYrTUFx?=
 =?utf-8?B?RnVaYzFIeDdEZUlFUUtyTjJYcXlEb3dSOUl2UWdUYTBGUWZBRmpJWDE4OUY1?=
 =?utf-8?B?T3V0ZG5vQ0N5aXI0ZEh5WjM2TWoxWHFkZWRSbDZCcmJUbWNUZXlxRFVFS09M?=
 =?utf-8?B?TlpBblRpYWw4Si9qN0lwV3BwLzNXZHlhTTJSakxjc0kxVTFhVmk5MUQwdXdM?=
 =?utf-8?B?YVNUZXJHQmVjdGFSM1RhMlltaU14bXRpbGlkcUpTMDN6NWE3YUdiTDdtdDdR?=
 =?utf-8?B?SkZJdUVtRUkyd3hDY0FuVFA5YjJWSVhQcHM0MVg2bmVvSVFhdDIvZmhHZ3lo?=
 =?utf-8?B?cFJ3d1VYdVoyald3dUxodmtJMG92NE9IQzZTUnoyaTRwTlhRUHQ5L2EwblBr?=
 =?utf-8?B?MWE0WnMyZ1kzczNwQUV6M3d2dUN1V3BIdUFHSG5UUjBLSDRFU1NnVVoxYmQ2?=
 =?utf-8?B?bXBudXdRNGd3MkRKUFFna2dYWHVSbnA0V3BIZFZZUmxkQlIxS3lrb1E2SWZn?=
 =?utf-8?B?WEFkU0VZL0pRaGU1OUQ2MHFKanlhR040c3RTYzdDclFucFJ2a0xnOWd3UjlB?=
 =?utf-8?B?YmNmK2Y1WWpnTHc0UXJxL2xOVUFtOXJIOC9zSkhkT05zWmN3THNpV01lanFl?=
 =?utf-8?B?UnNSZXN2SWFCdFB0MC95SWdPRUtOc2toNkxEQ1FJWUpUOUZ1Z0orY096SGZM?=
 =?utf-8?B?UzFzREJzaU4xVGwzUlM1eWwzZitvM0k1bmpzODhKQit2MU5PaUdORFdITlRE?=
 =?utf-8?B?NlNnZFpKYTJ5NkE0RVlzRG1pT0hFZVl2QzFhc3ZWVFUyU2lQVzFpa1pFTExs?=
 =?utf-8?B?UUNBQW45Ym1FQ1E2eUpwMFE0MzdBdk1zaFIxZTVCNGw1M2FLS0pxeGhDN3B5?=
 =?utf-8?B?NmU2dmozbmk5ampYbWNyeE1kREJoVUUzZjNHUThUdG5ITjc0TW95clY2ZERu?=
 =?utf-8?B?RlRvQ01PT0RKMzNMOWhlM1VsSm5XR01iL1lsNlRYK0o4SHRLc0RHMEZLbGwr?=
 =?utf-8?B?QVV6YU1UOTNESFdtL013YTltanBSNVhPRVhVY201N29BWTMxcjJURElRZGQw?=
 =?utf-8?Q?flLlhKV9wYv7NAVnt4piXuc=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: daae3473-571c-4ce8-3fc7-08d9a8d0e91e
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Nov 2021 07:15:46.8492
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fmUzZz6lLKJqp5s5rB8cxmZ8mq6HGzAA/U/G5bWbnAxMYoaNXZtftuHCsghiq4sWGigIw5Ezfd4WojlN//5EGw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0401MB2447

On 16.11.2021 01:41, Stefano Stabellini wrote:
> Bertrand's comment about MISRA aside, this style of comments doesn't
> seem to be covered/allowed by our current CODING_STYLE. It would be good
> to keep the CODING_STYLE document up to date: not only it helps us
> during reviews, it also helps contributors making sure they don't
> violate our guidelines. Moreover CODING_STYLE will certainly turn out
> useful when we are going to have MISRA discussion so that we can have an
> up-to-date reference of what we currently do and support.

Well, yes. My track record of getting changes to this file accepted is
so poor that I'm afraid I'm not willing to make a patch.

Jan


