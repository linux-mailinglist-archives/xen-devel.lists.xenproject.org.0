Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B3274B9B9B
	for <lists+xen-devel@lfdr.de>; Thu, 17 Feb 2022 10:00:29 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.274507.469983 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nKcdt-0000e5-Fy; Thu, 17 Feb 2022 09:00:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 274507.469983; Thu, 17 Feb 2022 09:00:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nKcdt-0000bM-Br; Thu, 17 Feb 2022 09:00:01 +0000
Received: by outflank-mailman (input) for mailman id 274507;
 Thu, 17 Feb 2022 08:59:59 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=xzkl=TA=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nKcdr-0000YO-He
 for xen-devel@lists.xenproject.org; Thu, 17 Feb 2022 08:59:59 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id fb42625c-8fcf-11ec-8eb8-a37418f5ba1a;
 Thu, 17 Feb 2022 09:59:58 +0100 (CET)
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur01lp2052.outbound.protection.outlook.com [104.47.2.52]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-41-qrhNlcobNSaFFLNtp9pmPw-1; Thu, 17 Feb 2022 09:59:56 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by AM9PR04MB7681.eurprd04.prod.outlook.com (2603:10a6:20b:286::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4995.17; Thu, 17 Feb
 2022 08:59:54 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::d479:b728:345c:bd65]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::d479:b728:345c:bd65%5]) with mapi id 15.20.4995.016; Thu, 17 Feb 2022
 08:59:54 +0000
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
X-Inumbo-ID: fb42625c-8fcf-11ec-8eb8-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1645088397;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=0kSekM1LszJuw8C4+D+KVcAZC+OFUak0kpiGLwXtTU0=;
	b=XmP3yICYON2wzQf3cP7osmEE1ZJGtrlstarJgvwaEsMS9f6g8ku9USe6p4Wo8Y63aHtjdT
	B/HMzQx2YknABufqWtzbIQ+cYxh/UyP/6XPTMSEZa1C7AKjoKQPkzmQpziVxGMuDq7Yq9c
	IBTndTvxU0+TYZ9DYyEJ3zmVWnybiXM=
X-MC-Unique: qrhNlcobNSaFFLNtp9pmPw-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=R6O8ADVm8RSaGrbcycxBD7f+hOPB0B+4IElp4e9r8Md362Nnu1lPV4g4t6Qy5iBBygb/UUkTdyjrOBTxM8cxqENuaPzspAtNrM0Hode816Z36nsUPWrSNUgdfl416bAAt/8oOrylfKx1pVfU0icamMu7ghJmV6OPJoAU39UAW8pYW2ZnSpr9hRPTV0WK7NUDMBbfTSUzKXsZ6iOSUcuQts6BGpjkkb/M9dr37p7+8tYnlgVfhIiyMP7vrA0Wd72elDtEh24mrNGqIyX1s5h9+LJ/tRE0HYHkt+aN4QHKvsfJ5hMDERbaNDWGnVopTSf6nOFmbmhvvDgcFxf73z8tsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UA/k/Mxh1ePla6moqwRTP2hCd5vGqy6eR507Pa1dsr4=;
 b=FuuPOpgZuw2SCd0QB93XbCrUxtVgKy7xuQMFpDNJkrGzPR4V0HhE+hfuuiCHVvCQa/6f+DDZ0F1HZSu53mX18ySPSXVyNVBAAupLqjHG5Xs1za9/p+XCjbJX78s9As5hyj4bQS+ic+xtT35YBf/9X36M2o0E/01zHtGebMnd1duDBopTQhUy03ElDDaL+5h05owviaTsTyIBAkCiDVKLE30Z04M2F6BHhZK/mewcnMMqTsZjEkq0snmLxN9NARmMeX2Y71cbND+MqDfoW64qidCnbeTms69ATEdK7+LXmsiNOBaoIpm127ht75v8o26v0+wBx+6Gz3EeK/iEbIt5WQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <7e5f721c-9771-bf35-8b94-f7fec7cd6eeb@suse.com>
Date: Thu, 17 Feb 2022 09:59:52 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
Subject: Re: [PATCH v2 1/3] x86/retpoline: rename retpoline Kconfig check to
 include GCC prefix
Content-Language: en-US
To: Roger Pau Monne <roger.pau@citrix.com>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <20220216162142.15384-1-roger.pau@citrix.com>
 <20220216162142.15384-2-roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20220216162142.15384-2-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AM5PR04CA0020.eurprd04.prod.outlook.com
 (2603:10a6:206:1::33) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4c341f14-d6e8-4bc9-4758-08d9f1f3dd73
X-MS-TrafficTypeDiagnostic: AM9PR04MB7681:EE_
X-Microsoft-Antispam-PRVS:
	<AM9PR04MB76817A0D9AC34EB42C028F37B3369@AM9PR04MB7681.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6430;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	vDUdYgfM9pu6u210LTIi73l/d5ISpS6jjcRN8SJVYVTAVpuac6IZ4WLDs5bMS8iywhL9MOWq7J4oUVPGVrEsGHmllPIDRSA/8UkLL0uGhCEtmNIrJPDsVrtVf0SEKLNwe7mkhDFFV8i0sUNPnhh+lb6hacCKY9185agaEXGGMGdPzoo0t3LIWJ4W0D+4g8szbhdmP0iFWdabyZ39pr6DNjo7VGLm+I8eDKsgSfAx0Kw2fnkgdzfXfM6zbQUHpQyybHm29gPgy3wa+xYlAXKySOdGgI6qQopY2Vl1MRKwJc5RfGAjqmEUg8AJD+Qcgh4JODjcg0RaPbNtCpO+S2YFuP/yaaYxa4ZHwhOGeNdKEBFPKYEjftJftcNj1Z6lIxXoeufqr07KaxVvrQYc+7iyij2ZxX23B2N749QGF4geb4MdvxYdIaH8xGD2p1yKXYL6DU9f3/JUmpGLGkG1ocNacGQhQKZ58l6A0Vbn6ezkyLQFu0GXI6Y0XKKcM41p0Xmv5DQqIryfY7Dtdsdl5dyZeA6xUkAHfkD5ZU1aJ3KQVR6v1I0Combiel6Ox75IngjHYKnn/QSuBlE0dpdEyt41U7w4Pigaobrq0vLssi5aTuncGpinQQZLFXKU0VJTMG0LMFiA0H+TUMyOdau8xbHrKVmZm9kTfZblHdYjs+0BDlq/XxdrU9PtKYLXcLHjPX+uAW74p56nRkLtR/KlTBf/V1g0pyf84xgcmtsV6t1TJp/ZkpBnyf4YcYgNVX1bo9cv
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(5660300002)(38100700002)(8676002)(2616005)(4326008)(6512007)(66476007)(66556008)(53546011)(66946007)(6506007)(2906002)(8936002)(86362001)(186003)(31696002)(26005)(316002)(6916009)(6486002)(36756003)(31686004)(54906003)(508600001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?F9QHRyffy5/+J1ukqait9lDebMtrJA7PucyI87N40wqDKNJXPEPhm6fDxPUe?=
 =?us-ascii?Q?7cklTmdFHDW1vmnjxfWZmhoo2AAOrmm3HI0KDqL2IDL1WkPiLr6fSyJF7RQm?=
 =?us-ascii?Q?0VagoUd/DyLtU0SqwA9PiufzpwEntVsuo08Ay+9o6vEWZJj5kxNQ3CaV7AK2?=
 =?us-ascii?Q?bbfOrkfdAF3BQYQv35Ovp1JlhXBFR8qHIx1XI3xJRuEhkRAlconsDs8n+4K+?=
 =?us-ascii?Q?nYUHdMsJPTc/wHm/fgj4qxi2cjy7N3SJrjDi/HgFDDQ8RaX5zxITQ8GrYrpm?=
 =?us-ascii?Q?DatlcUZe+6aAYAMx7cEwCElrgqvhBG0zinI2eNs8P7ugDvXA/o0DTQ8YDj5u?=
 =?us-ascii?Q?onkEscRuu79J1Y/msuld0x5KxbEU9Xv6FxHuxOX49fDrl2Ao3VQgVp/4gFtN?=
 =?us-ascii?Q?A3C2nIif4dwFNApsj7Q+MpjURabLgKxc+yofWo3rdBJRJxtEhpOJ+5fcV1Te?=
 =?us-ascii?Q?djMcMBJ9aQIWVfxYkp8lFjVI2VClEZyfFyc9347NIEVWEh+7Cq/1skT4+MY/?=
 =?us-ascii?Q?9ziX2ZGZ9daiyxCoGpfpehqgxR9FAihC8p0cjjFHcIR1kQcnfsXLThScsy6t?=
 =?us-ascii?Q?VdiOPOIpnL21ABQkjpMt7Ftpn2c0wOS7wXFMC66Z9WUacuu0Dp1D/2xl6rKg?=
 =?us-ascii?Q?xSt35d70cXihKeMHtnJ+U+U4xNcFNWRI0N3nHqoFw/WtQiYSO7YRnQbH4G18?=
 =?us-ascii?Q?Ci30Ite3fyvZrpHfqYq7l792aYd8IUJX57Rv8BZqThxbzl97OBKL14Q4CO9R?=
 =?us-ascii?Q?dUZQ402CZx6Vgc/eEPNbqwYY5LHPjMaarGOdCwYeqhw0XzXrbafXa6emp7bK?=
 =?us-ascii?Q?DN5JJACqfn/rSTfW65W/QuVj0SttPtt9smT+qsFX56aGPEJs2hVjphgljQLn?=
 =?us-ascii?Q?15koKgciVyNsjnnwvAXTXjb051+I1KMmFzTMay/x9yWFJTSO9h1Q0PQ0RbH+?=
 =?us-ascii?Q?Z9Ju8sBVfPE2RPofIUb4+8MZHq9BBYK/h2iLsoYBDan/38OcyPUcYcQwA3VJ?=
 =?us-ascii?Q?KGA2gwxVazn2KVQ0scHN6RRgpGTauuZ38/dPAo2uleCb07p21VZjOOFW6VLO?=
 =?us-ascii?Q?M+5S1ra8we0JUFibZNL+KOTg36YyO8doHTZr7JKcPjBkwAxJQLaSHn+4ZKh2?=
 =?us-ascii?Q?bu4TRfovhAnq3plRl21lS4G+5SPxiyI57ehns6PtqwOGcZrSP65M8aK3TUz8?=
 =?us-ascii?Q?U8ugMInh6dH42V3wY8BGZ9q8PzJrvnYHtXhVXeOBB7kr1O+VOuIyviT7xI14?=
 =?us-ascii?Q?MvlFHVCNPSjRpXooQRZo8XTox8WgQiHjnC9Ks2xArc790mpaUzNa5d492kyk?=
 =?us-ascii?Q?2bROmmx/8ElYJVFky3sFFlzUNkkITzmOOa9q87mYg/JiR4Th4eHDbz84QXJd?=
 =?us-ascii?Q?SbpN2xipjWFw/H23J3hP72+AOKoQV+0+9fa8JWWjNaG3K5oow7xIHwTwbyHx?=
 =?us-ascii?Q?4SSLHnpx3EnjceGMd346QAL+ZLqoBHezGPcu0ZlTRHfX3lsK9V3a3TA3LnbM?=
 =?us-ascii?Q?A4cxE74TR7ddZ1DCsNTCOKi/b8pwBbebR/1qJywkIe7hVMKDpkTNr7pQNwnJ?=
 =?us-ascii?Q?trh/cEbYUnSEGh0T5OyO+e3Ff78WE7xiZTCWMQg72MFQwaeSJfG0uEPxo/HC?=
 =?us-ascii?Q?1jeePpUhMGjZowNRbIIBZCQ=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4c341f14-d6e8-4bc9-4758-08d9f1f3dd73
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Feb 2022 08:59:54.6489
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LRERGViv871beSguKJaqSn+3IKDP09MONNW+PemoairLn8ja32PioYP8mQlLc+uWgpM1n3AsWQh0Ob4vaLjwoQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB7681

On 16.02.2022 17:21, Roger Pau Monne wrote:
> Current retpoline checks apply to GCC only, so make it obvious by
> prefixing the Kconfig option with GCC. Keep the previous option as a
> way to signal generic retpoline support regardless of the underlying
> compiler.
>=20
> No functional change intended.
>=20
> Signed-off-by: Roger Pau Monn=C3=A9 <roger.pau@citrix.com>
> Reviewed-by: Jan Beulich <jbeulich@suse.com>
> ---
> Changes since v1:
>  - Put def_bool before depend on.

Just for the record: A slightly shorter alternative would have been ...

> --- a/xen/arch/x86/Kconfig
> +++ b/xen/arch/x86/Kconfig
> @@ -32,9 +32,13 @@ config ARCH_DEFCONFIG
>  	string
>  	default "arch/x86/configs/x86_64_defconfig"
> =20
> -config INDIRECT_THUNK
> +config GCC_INDIRECT_THUNK
>  	def_bool $(cc-option,-mindirect-branch-register)
> =20
> +config INDIRECT_THUNK
> +	def_bool y
> +	depends on GCC_INDIRECT_THUNK

config INDIRECT_THUNK
	bool

config GCC_INDIRECT_THUNK
	def_bool $(cc-option,-mindirect-branch-register)
	select INDIRECT_THUNK

A more appropriate thing to use for "depends on" might have been
CC_IS_GCC. With the next patch in mind this would then avoid
potential confusion if e.g. Clang folks decided to (also) support
the gcc style command line options.

Jan


