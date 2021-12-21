Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 298BB47BB7A
	for <lists+xen-devel@lfdr.de>; Tue, 21 Dec 2021 09:10:09 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.250167.430815 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mzaDa-0006Tf-5R; Tue, 21 Dec 2021 08:09:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 250167.430815; Tue, 21 Dec 2021 08:09:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mzaDa-0006QE-12; Tue, 21 Dec 2021 08:09:54 +0000
Received: by outflank-mailman (input) for mailman id 250167;
 Tue, 21 Dec 2021 08:09:53 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=GYHQ=RG=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1mzaDZ-0006Q7-7z
 for xen-devel@lists.xenproject.org; Tue, 21 Dec 2021 08:09:53 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5fcc4f2e-6235-11ec-9e60-abaf8a552007;
 Tue, 21 Dec 2021 09:09:52 +0100 (CET)
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur01lp2058.outbound.protection.outlook.com [104.47.0.58]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-19-jRZnuuPwMMKwVGZuZ8UMrw-1; Tue, 21 Dec 2021 09:09:50 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB4608.eurprd04.prod.outlook.com (2603:10a6:803:72::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4801.19; Tue, 21 Dec
 2021 08:09:44 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe%6]) with mapi id 15.20.4801.022; Tue, 21 Dec 2021
 08:09:44 +0000
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
X-Inumbo-ID: 5fcc4f2e-6235-11ec-9e60-abaf8a552007
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1640074192;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ZcZJS2DqiqSY74zAjJMQNy4+WSwKJpRUuf/kySVUBJ0=;
	b=AOlbr8LEap05D/4s3ObBD6wJy629Yvb4r4ihPJTIx4uSv0Fg1wLVtILXfeAkAz2R5irgJ1
	tmrBlN3d/ZWGLrKHBowQhRh0ACDncQrR2FR5UvErsJU4Z/zdCn/z5EVZmN0DFaxO0AijeE
	vLl16P0yC4frwqyOsvoVrv/jrENwCJw=
X-MC-Unique: jRZnuuPwMMKwVGZuZ8UMrw-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=idDmd6rZe4Qa1m2eUGo36rhGMgCNFVXLre9wq7YFjNYqut3vkbFtsSQVW1k3nd5p4cRadlDDLDnFx1RMSj/x0XKksNKcC+ThCvZaed9QtIjOgCA2YEQLTnOYYohPWoctR+Kf4e4IGwJ51s6jIvwzGTk/vNLUT2iqzhn9tADevPkp0fDozQCwZYz1QC1ZXDeXNQJiIE/kO2/tlKGwUMC/uDvytm52Qd7zzqOesyw2EavzAu8mTKqgt0v6zkCT8fQTQqqSMAvg24TpX8jZVmqluXFc3CF4K5hF+g8/LCkJzAyBh9ugDMy+H+3uD4mRK6LO6Fs4LLxvebp7mz+wMVgzyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+x8nwd/UVS8jAWrbfjVyyVlkE1kxDCyYdnZrzNLbIb0=;
 b=WfCttmnt5fQreJ6IEmzvIPQUS6bq/JHlz7cc5bP60GRHANhDWcFZCXWwxNshi2RJnPuXeaQHcsHNTxk8RvrkileluD5ihrWLsxocATHyVeIhXUigK+hkU1cNDY5WDK0/UWgpYbinUzNjOLleK4U1BswL+6zvz3Vl4F72nn3kO/idJ3XLOeafl6ghH54GhKA99eBQxL6rhD+YlJRJvYGlhmP14JCV/dVr8AfkVFRDRtmKK8m3cAt4Ombj9B5+Oa7yt7yahr71EY/3198ifdckqroL7ZO+MkNObxeXDMCs6sgz+rxJOoVLIkO6oSbp6rTDyLaALQa4l5vYVcpk1cFiFQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <d85733fe-2ab1-086e-15cc-e4ef68be4596@suse.com>
Date: Tue, 21 Dec 2021 09:09:45 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH v2 16/18] x86: introduce helper for recording degree of
 contiguity in page tables
Content-Language: en-US
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Paul Durrant <paul@xen.org>,
 Wei Liu <wl@xen.org>
References: <957f067b-9fe1-2350-4266-51982f09d3a9@suse.com>
 <aab0b88b-7643-cc08-756b-0684f93be257@suse.com>
 <Ybn0LaRuFpUfcmoU@Air-de-Roger>
 <bbcbd938-170d-94dc-4fa3-49766fb2a9c3@suse.com>
 <YcCgV/o+1I0qry+q@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <YcCgV/o+1I0qry+q@Air-de-Roger>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AM7PR02CA0024.eurprd02.prod.outlook.com
 (2603:10a6:20b:100::34) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c6b9f46a-145e-4fdc-4819-08d9c4593f3a
X-MS-TrafficTypeDiagnostic: VI1PR04MB4608:EE_
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB460861CE7209685CA0B1ABD9B37C9@VI1PR04MB4608.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	gCIkzmx8xzhsy3KhSZ0WAusB/DwHwk5QiDt0yaywQDtQYENw6Iqa4nphPX8dJCk6GAoeS55DnyvXRbvxW25f4JmX90x/aldA/FMrie9kUNrbEUpp1ZNgthf6Pdt01zbSX1xJKEypWL1PHyrFy9ljF/LubzPv6OTY774JA8piW+7WuhKKO5HP8YVsdFQDRITLUtRMwfBg/oTmQKhcHAF4UXkc8xRA6VZPkg3uTsfi5ociFgbb+J0BBIWlcfYkCLhsCyRnG3W7FeWfOUff8vXP01olyMckKvPl71UsMlnVyXV2XfhGi3Fv5U+EG6vXJ03U44GtsJ+A+19D38eZgRGotXfYFDsbHK4qrF88aphOZhWSi6FQ4TuMUiP/cbT8Kejll4EklQqh7gPR1crNPBvvj2fYzy/6Xz6qwgMIr8IZWxwXbJEm7wB8oa2nMlYCqNuDk2jDhsV4YVISRGlMOMyZv3R4J9asORxQeIigWIzLG1nOJsSDdO3c79Awy01MfkhuODQ+x0DO5hWonc627ZNwENqPD1VUSsUTUZImKEFO7IGqsY1qtIAwjhJ4xq9wDRZPtzCwxx05iI2GeVe1uA3KO9wdxKiA8tl5ekh6JufjKZmohmefBiDerKlJjTjaNnEaMq0UR0FiGHA7tgRiOndlD3LIUiIJiuWpSOr41W97RrXF8zCnB5THzyUKSOdmiqzdRF2TvMqnvutGOxOIjeS+aSXo68QXbIo2KTTOX0lrKMM=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(54906003)(83380400001)(66556008)(8676002)(31686004)(5660300002)(4744005)(66476007)(66946007)(6486002)(26005)(2906002)(86362001)(6512007)(8936002)(4326008)(2616005)(36756003)(38100700002)(186003)(53546011)(316002)(6506007)(508600001)(31696002)(6916009)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?rIfPwlNX9y2zI6TgNBK/S6khECQduZpi6X76qmffod72UG1Avf/NfTcoN0aj?=
 =?us-ascii?Q?eL7IHP1mUo5y6WSuBpl1f/boswnCRjUdVBoGUqwvIqXA2ItpnF078NhtPPzT?=
 =?us-ascii?Q?U9gyaGxmNTa2+RxSRO8dDrhfrHUaMFGg2PFbZt5vm+CobvoR73KJ+/d+FlRt?=
 =?us-ascii?Q?dyfERvUPagv3p9BzBp9N4vrkyIryWlrq4DRqi44dRRq/8q5yVzSg8Gb5nwsO?=
 =?us-ascii?Q?OrbntEvH7Wok0gWXpRKLfAfDEtBZCSjFZRL7CupJXaa7lBswvDslIkDySzbS?=
 =?us-ascii?Q?MSJoITOcfLApl8QROjeyJQv+rgNv05xi7MtO8hwn/9fjcX17ydm4D+HyPBeL?=
 =?us-ascii?Q?YmVKTdvFoFj6H+rtAdBnRaHE+vhe5Wd2SSZoB+3mWPBJ7VpwUnG10K3auI89?=
 =?us-ascii?Q?PK0eq5Dnt/lE2lrnb9tKd/Q7HwbeDb920/DWN3kozOVgnwkdmahu9Vwm5Cws?=
 =?us-ascii?Q?M1dngehyck0GxnPMGNf+4NaUOdo2eEZLQESe/6/s4d6t3b32TCEPbzGM8I0R?=
 =?us-ascii?Q?4YX+0ZtAzJWm+TisKxBHGOaTBlcfRD72GWVSpdPzZhFwnHdPbD2Lq5yjmfAB?=
 =?us-ascii?Q?tMo3FXDMxPzTEFPcjEKBmq429L6GsUDEUQYTSfXOZZU1HrKTKIxaNUBQWf+3?=
 =?us-ascii?Q?qpriF5KfgjmzUSaGDWtyPl6Dt8LqhlwLsWhrNj62t7ng0CushdPuQs2ujoY3?=
 =?us-ascii?Q?/FoFPpFW5W78QLR0zFE7x8xk0F1yLM0eYcO94dJ+brcaXHcAukPqRXWx36JG?=
 =?us-ascii?Q?gBNbpSypI0hkxJcHnc+fPSt0hchr8HHL5I5bJQUzJeybxdRuYMXADKonGG4G?=
 =?us-ascii?Q?TKKTvcqKKmU79AzXQ27sWBDxH7XEx4BPWHBgAJl8bfgFsqf7RB27w5bKhAoM?=
 =?us-ascii?Q?1FlvhiX+gRn7hZurDAyu54vLUmdtOxxKWjoKn804j38GB8kEAg5WQ6N1e6mZ?=
 =?us-ascii?Q?b8VG34nC4n4D993uwDmPUqdixaCJHNClndHzZdztccTulQV44VIk3m9quAjv?=
 =?us-ascii?Q?vvr48NMemWf3iYUt+KkU0K4wPrRsPEtptUEZJej2eV2zZRf++x1dvgnjhNZN?=
 =?us-ascii?Q?4ysTlCdWi68SSd7SaowmFQQufT+EVwH2Bp7k7Xg4TSHaNU7rWy882sMqUaOk?=
 =?us-ascii?Q?pYZzY2HwaW7K49ggSyVZKvQKXx2v0UXrkcFZkAU1e1EL6kJbf4Bu5L4Vd3QU?=
 =?us-ascii?Q?M5UKFreG+G3lmmsIl7JbQRMaVUwEl50FEh4ow0MXgkWsGAsoSIOTr9xc4pdi?=
 =?us-ascii?Q?IDM8Cs2aRK0LjwqjNl8jhPRn+25UnV5SwknCvTb9ECil9Q0ZiPOTNYSJOtgW?=
 =?us-ascii?Q?V5KGqsI2sVnYyQovk5gwYBkR9PRxsj30o3KP0GJM6x/IuflBhwTOvK5zp2GY?=
 =?us-ascii?Q?4GsMxfYl/L2Cu2tM2CRyMmx8LOt15//j7sHniFX9l/KcuPzZGFQDtDcuvMBq?=
 =?us-ascii?Q?Tbqrgvqq2m451L77xUS80iBixvkRtKPdhGMMNT5tSWPWizWphT/EnAoIc5be?=
 =?us-ascii?Q?FvD3ElNV9l5vEu4YsG/6/aB3yomZ1tr8qfoVkuvEMEyK8XeE0zVWBdNA5wAG?=
 =?us-ascii?Q?F16MvzFAoMVyeI//Y4paUNgD0Xg6aTsaLB2klv0z0voJ9GZAdeRKc4J9FFVN?=
 =?us-ascii?Q?wgTRqQS+ZCgjeUVZ1aU+I9M=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c6b9f46a-145e-4fdc-4819-08d9c4593f3a
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Dec 2021 08:09:44.3162
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mJcdfl2JlHlxHbtF6rW3cbuolkRRPRBUQDBqOyDy/iLfWt82j86+7dc3FFiS8TJt65i1dNsZFYOGP1IZO+2zfg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB4608

On 20.12.2021 16:25, Roger Pau Monn=C3=A9 wrote:
> I think it might be interesting to add some kind of unit testing to
> this code in tools/tests. It's a standalone piece of code that could
> be easily tested for correct functionality. Not that you should do it
> here, in fact it might be interesting for me to do so in order to
> better understand the code.

Actually I developed this by first having a user space app where I could
control insertions / removals from the command line. Only once I had it
working that way was when I converted the helper function to what's now
in this header. But that user space app wouldn't directly lend itself to
become an element under tools/tests/, I'm afraid.

Jan


