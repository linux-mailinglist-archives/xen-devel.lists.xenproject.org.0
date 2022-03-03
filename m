Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 948444CBC1E
	for <lists+xen-devel@lfdr.de>; Thu,  3 Mar 2022 12:06:55 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.283151.482075 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nPjIA-0000QG-3H; Thu, 03 Mar 2022 11:06:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 283151.482075; Thu, 03 Mar 2022 11:06:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nPjI9-0000OQ-Vp; Thu, 03 Mar 2022 11:06:41 +0000
Received: by outflank-mailman (input) for mailman id 283151;
 Thu, 03 Mar 2022 11:06:40 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=NyQH=TO=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nPjI8-0000OI-09
 for xen-devel@lists.xenproject.org; Thu, 03 Mar 2022 11:06:40 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ff8fe02b-9ae1-11ec-8eba-a37418f5ba1a;
 Thu, 03 Mar 2022 12:06:39 +0100 (CET)
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04lp2058.outbound.protection.outlook.com [104.47.14.58]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-32-v9GA_SjHPfCx6F4ABtZbsw-1; Thu, 03 Mar 2022 12:06:37 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by DB3PR0402MB3660.eurprd04.prod.outlook.com (2603:10a6:8:c::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5038.15; Thu, 3 Mar
 2022 11:06:35 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::d479:b728:345c:bd65]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::d479:b728:345c:bd65%6]) with mapi id 15.20.5038.014; Thu, 3 Mar 2022
 11:06:35 +0000
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
X-Inumbo-ID: ff8fe02b-9ae1-11ec-8eba-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1646305598;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=tT9BHcrKds19YE+LvXeXhXPPBFmWvhX6Zmof90GvHzQ=;
	b=fLdq5P4vIgG+JZkEaT8KrHr4IlPu6y8aiMRWFpE6aGJcHmOyUD+9Yezp/83qpLcyROa2Fo
	+XFhZU14kaT9U/QDXdIfjWARBrK2geXTppjBOfwO1ACCje9NE/ewX/XvidHMLa5uriNEda
	KSy9P8qUV2idTy+RtU7aUmU/i82T7hY=
X-MC-Unique: v9GA_SjHPfCx6F4ABtZbsw-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hxyWRIu91EVtDnfFD51+gA3KlwwusHz+9XAtqOz0JaeouQRqIxM26YXwOiOnqUdE019C9fowM4obbFNVgoUA3POZ91s07WPBaKXiLk96PzFBaL81yV7ZSueUChhiDOpGTm4u4jkz7k1SlSZbeF257DESzb/dRCyL4uPEQPXQ2ja9pWKh6qX16m/sB64AvFg21e9vWwX4FIiV7U+ThS9sfjvXibQ7UP1UqDv4u8ZiCvN8mDwTxwHQpt+4ldBSJjb4dYdDiWag8FrYoc+bCKd/03aWKe79H3BJC+gqaetOcfb1PeLqg2ghVGt9vHXVsXEj/F1tUjuFkQFTGAqGPuNz6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tT9BHcrKds19YE+LvXeXhXPPBFmWvhX6Zmof90GvHzQ=;
 b=BxOBg7PKwNCwDyuzJaK+YKCCUXtj5oepmOLyEDbLZAzh8DUhHUq7E0L4oWGJ0Dsb5tuTh98qM2hJEfavHcqz1KmIC3oz6gkes8BueDWRLElX6cYP5zEdSFY+T0ycyr8wLrIbHElWLkcYOcM3Uo/lQxwpRwj6XCRgz+Jt1214zISiYzT5St8OhZdqF3BxmJBfxnAoVf1W5SiiB7szgWYTn4KQxwdc10jn114rpc09dLkkVN2ll8env2UiTNQ/+LJvbDRuhivFv6DTCJ2RUGemEIzzr76NSdR2AppyVn1rJHqnj2tqriczB61RqQrrfwklYPNGyRDoEioKpoJ0W7E+4A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <fa5f2f3e-5ad0-134e-e57c-5d115702f1f7@suse.com>
Date: Thu, 3 Mar 2022 12:06:33 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
Subject: Re: [XEN PATCH v9 29/30] build: shuffle main Makefile
Content-Language: en-US
To: Anthony PERARD <anthony.perard@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <20220125110103.3527686-1-anthony.perard@citrix.com>
 <20220125110103.3527686-30-anthony.perard@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20220125110103.3527686-30-anthony.perard@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS9PR0301CA0037.eurprd03.prod.outlook.com
 (2603:10a6:20b:469::22) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: bca96449-0d53-473c-309e-08d9fd05e1d6
X-MS-TrafficTypeDiagnostic: DB3PR0402MB3660:EE_
X-Microsoft-Antispam-PRVS:
	<DB3PR0402MB366057A6D190DDB047452AA1B3049@DB3PR0402MB3660.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	fD0IZhI6DZmBQ3CnHE54QbR6Bzz4Fc4lDjYMvJVCh2/PDvTzyp2tnFXK5Dpv27FKw51Hx5/0BRaA4wP71wUlfGT0w4iKNPgBwZRibpI/VIfhzMTBuzzNgy+sVQyCYFNcE19tH6r/kZzZQMGzcC8emSxlUjB8OzBPLssEDGi7mjNJNaRhzP5WAJVfAxdDnSTwABBiEwYYBaGiM3o+fykfZgqI7q7X+Cui7g2/m22WLNWthox7vrAVyWTCqwOUUQWMq38UkP/00iqsCjoQf3HrV1VIzQ6K0wnyUQOke5s/ViEJyZGwkX47hPbJmr7UDRhz5cwuAyKJ2dE10Q+FRiVfHlchetyFnsEFONbkTFqsfvM3hWspuo7rPuZBoB7PTuSXGHt8LalpD2mypvdPRR0ezTYp6ydA9pbWnc6LZVAZrDGcjSgc5lapZFq8bw5/vONNoZxfyC1JSFEeSEPMZoo6aJZRT1SVEmtpZFnbPnzM3HzCrHXs4g2HksUWvvAQmLFzZZbMMbpOPTCuOb1A52GWNoQyw7cjBn91BWJFHMH2j2RT3CoKr3Pv6iGr2mkgGkM3mmTUWTgnGsvo5ecA8d4qHpfyyjs6hlMUlY5ML0LSnEH9R4SN4bjYy42DQcxNm2kt3c8/fVSBZcTinmpkEYHW9pErSG4hFthW3zYM+SqF35l4/DIajuhdnoBW9mMeNCTwN2KNX17uDv9kG+4xryA1AUbPWWMRIIDUiK8N6UA1tUY=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(508600001)(6486002)(316002)(66556008)(66476007)(66946007)(31696002)(86362001)(4326008)(8676002)(2906002)(38100700002)(54906003)(6916009)(36756003)(5660300002)(4744005)(6512007)(31686004)(6506007)(8936002)(26005)(186003)(2616005)(53546011)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dzFxdjZjSFUyb1BkQXZmL1BXSHp1RDJGMll4cllTcCtpYVA5WG9Cc0FWdHk5?=
 =?utf-8?B?Y2p2MXJvV1NNMS9GRHgrQ2o0eWJybzZQVFpjMG1kMmxybFFVajMyVTBPTnFP?=
 =?utf-8?B?K2V0MjZpVThmQkYybDlhZndZTWNNQmlyT0djY2VDeVpGcTZmQnhLSVpPaE15?=
 =?utf-8?B?MGFtUDl2K0w0OWVMeE1lTU9QMmltK0h2MTZheTBydHpJT3dab2JMVEJGNk1r?=
 =?utf-8?B?dEpFMlVIREg0cktCQ1p1S2pSVFd5NjFXWU0yZVpRVS9UODNnNEJjVHZrajR5?=
 =?utf-8?B?ZDloMDgySHBzWmlXTGxKeHFVenJaNU0wNzkzQUppOGU0M0x6RHlKeWRKMFE1?=
 =?utf-8?B?NDlDanM0MlRqQjZjVnBnWW4wV0t6cWtvTnFVSUpQNDBKTktjS29WdFlKeDFr?=
 =?utf-8?B?blFWYm9MVHNHaXVWQWJFVUJaWWdzNktQdEFkblhzUm1kSlJaRmROODZJWXor?=
 =?utf-8?B?TFQ2VlpDN2hIblEwYUNBYkI1S29HUi9WWVZWNkdKUEoxR3UxYkRqb0YxQTd1?=
 =?utf-8?B?cFlVVHE4dnE1SmJVRnZ5VWdsV3F0YUxWKzFGNzk1d3dsZVNKZlR0V2NKVE05?=
 =?utf-8?B?YXdZNUtQQTJGVFh3NVFUR2IySk5Da3BrZTdTM20rSC9GSEwvZmZBWFZ4QW01?=
 =?utf-8?B?MllhajZZYnZPazRhT2twOHkwY2tnem5TV1ZNZ0V6QmUweVplR1BUVm9FM2lG?=
 =?utf-8?B?SThDRndaa0VIcFlkTDNocHhQaWczcEN5Qy9yd1Z3Q0ZadUNZWXoxM3RVME9k?=
 =?utf-8?B?bEhxZkNqS3l6dEhxeVFzVFNoaGhTaE14c1dIR1hrWE9KNHR6dWwxNWloYitx?=
 =?utf-8?B?aUN2R3p5bVIrVTF5aFlsYWxMMGhJa1hob1h0bkZSUjd2VlFMektvdXAzK2l2?=
 =?utf-8?B?cE56SXNsT1FWWGlpUzRFWEc4bDlLWXRIN2NVYWQ0SzEzVDNHcG9EdXhwYWYz?=
 =?utf-8?B?MUNONG0xc0U0U0U2RUF0TFEwYkxoK3hwOEtCNkNjaXBGbzB6YTNmM0tKaU1x?=
 =?utf-8?B?dENrc0ZlZ1NzbXIxNnBma3gySlFyeUN4dmphd0JWMDJRRjYvRFQ2cm9GMEVT?=
 =?utf-8?B?a1ZqbDNwaTVYY2dWMHRhMi94UE11T2pibVNDbU1MV29vKzlMSW5rMWQ3SW9B?=
 =?utf-8?B?WWtTRU9uazBieWJDdUFkMGtFL0Z6cHNueHhJR3RiSmxPMGM0b0hIMXlFakhz?=
 =?utf-8?B?aWZ5M0IyVko1RTVJeTROWmdFSmNuMlFoNy9NVDZXMlRKeHNhcDNjN1ViUEhS?=
 =?utf-8?B?SFIyK09Pa0xKak51cnZZY0gwS2tXMGhjS2YyMzRhWFQyZFdhVlR3S1p5Z3Zl?=
 =?utf-8?B?NzFQWTRHbHBzdzNRMWhXZW54OWNQenU4RDZYQ2YyZ3h3S2w5VlQzVHk3Y0Rv?=
 =?utf-8?B?ZDVyREFnLzZHaDJwUFBySEJpbG5pZWhYNUFqTU5xRHVGME9xZ2NnTWI0S0w4?=
 =?utf-8?B?cXZDU2hRbUVwcFBMWmFnWThyQXFSWmVXcmZsNnZkdGVEZFhLd0tXT0NMYmhF?=
 =?utf-8?B?MlhTL21hOEM3MHZmUWlkaFhzOEw0ZlNLN2RnbXVKaWxEdVg5QUZMY2s3YW5U?=
 =?utf-8?B?QnZvRFRKS1hMeThnRkN3aEFPN1lNTDFieWpFUVgvMXg5TXo5VW40eHFQL2gr?=
 =?utf-8?B?WGJPRCtDUFFOdmdIS3NmamJib2tnQm1weU4xYVBJcHI2aEkxNEhvSDJlMGwv?=
 =?utf-8?B?YjMrbzJaYkpaeTd1VkpIUEY5WUZ2T0V2RDg3N1p6RnBGNzRjZnJIeUVhcUpN?=
 =?utf-8?B?OTgyRTFyYmZUYkdSeDkxSlg1c2RJVnBWZEc4eGpLOWFVa3pvR0dTSml3cTZ6?=
 =?utf-8?B?K0toamx4L0dPWHErek1oRi9VZDR4NTYxQU8wc2hDb2hyclk1WE94di94KzAw?=
 =?utf-8?B?aG90d09xWllrV3ozY2lyWk9EdldTT0o4cnZKeksrdWFiNzNWUURnZklzdGR2?=
 =?utf-8?B?U2l2L2lnd2JQSEF4K1dQTlRWTVV1YTV1WTRaMHpqeFp3VWxNbE5QVkFjUjRB?=
 =?utf-8?B?Vlc2MjdGN3ZYTm5raGQyRU1nV2oxMjhaSWpSbW5tNzdIQU9Gb0ZmYk9kZURh?=
 =?utf-8?B?ajZWV2xiWlRTVUhFR1cxY2o3M2RiYmdIUmR1S25wcHg4N2ZLR2N0M3VLVmtH?=
 =?utf-8?B?Um1veENLRkRaTlU3eTljckZHYTA3SUE5a0x3U3BnRTh1M3Q0QW5WMEVGSFdU?=
 =?utf-8?Q?cy4FMevBS/6mFVbDlr1V7cw=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bca96449-0d53-473c-309e-08d9fd05e1d6
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Mar 2022 11:06:35.7397
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ftz0hlqYQzrB+IoNm7hIp6qlOg2DYkTFDhHz35on1Z1tXIKKVie/bW/gGt/DdRc4VFZe8IN7TB5poWmhmP0SKg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB3PR0402MB3660

On 25.01.2022 12:01, Anthony PERARD wrote:
> Reorganize a bit the Makefile ahead of patch
> "build: adding out-of-tree support to the xen build"
> 
> We are going to want to calculate all the $(*srctree) and $(*objtree)
> once, when we can calculate them. This can happen within the
> "$(root-make-done)" guard, in an out-of-tree build scenario, so move
> those variable there.
> 
> $(XEN_ROOT) is going to depends on the value of $(abs_srctree) so
> needs to move as well. "Kbuild.include" also depends on $(srctree).
> 
> Next, "Config.mk" depends on $(XEN_ROOT) and $(TARGET_*ARCH) depends
> on "Config.mk" so those needs to move as well.
> 
> This should only be code movement without functional changes.
> 
> Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>

Acked-by: Jan Beulich <jbeulich@suse.com>


