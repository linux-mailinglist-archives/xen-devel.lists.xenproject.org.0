Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E22714B84B1
	for <lists+xen-devel@lfdr.de>; Wed, 16 Feb 2022 10:47:06 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.273885.469177 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nKGsl-0007xB-8T; Wed, 16 Feb 2022 09:45:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 273885.469177; Wed, 16 Feb 2022 09:45:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nKGsl-0007uy-4t; Wed, 16 Feb 2022 09:45:55 +0000
Received: by outflank-mailman (input) for mailman id 273885;
 Wed, 16 Feb 2022 09:45:53 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Gpsw=S7=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nKGsj-0007us-DL
 for xen-devel@lists.xenproject.org; Wed, 16 Feb 2022 09:45:53 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 38faa90b-8f0d-11ec-8eb8-a37418f5ba1a;
 Wed, 16 Feb 2022 10:45:52 +0100 (CET)
Received: from EUR02-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur02lp2054.outbound.protection.outlook.com [104.47.6.54]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-25-gdtPNhHsMpy0fClBHjhEEQ-1; Wed, 16 Feb 2022 10:45:48 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by DB7PR04MB5994.eurprd04.prod.outlook.com (2603:10a6:10:89::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4975.19; Wed, 16 Feb
 2022 09:45:47 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::d479:b728:345c:bd65]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::d479:b728:345c:bd65%5]) with mapi id 15.20.4995.016; Wed, 16 Feb 2022
 09:45:46 +0000
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
X-Inumbo-ID: 38faa90b-8f0d-11ec-8eb8-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1645004749;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+B6fulqIq0gSa8+v+CdeOQX6FEgAQGL8lG+xGt35K7A=;
	b=frfS9MitowSF53/mrjnMTMCYY8h4ym+2wQkSIs/rHC2blq1YZySDOBRghPaRmuFEW2l/6/
	IOdbHLbembVR0cqnCgt92TyiSntCDIURCr6XnfqnuVBLJ8wTFwxyZdgeMM9OFlusnNz/J8
	soFDSU6fCc1YecQu7lp2PBn1+AwIjd4=
X-MC-Unique: gdtPNhHsMpy0fClBHjhEEQ-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iln5nIa5IjawOsXcfGkITsZrUv3DvhpqrURR9iUHdYMBtUNPdFYJk8qWCNWP/0tf1wJkiEFdgC8JQ9ctjctvLDMp2I+FZwMK45yffbDzbylRtU7gE/Lg5XlgV6wMvXxLhF0Ewi47cHqP8QfP5FlAoTnbKfZhk9hlyeoBo44ZlXUHdhjkKzgC2ZsGIMLkAzaSrDqWtUrWSErRviiApeES0gnTMZw13Z7VZ9Z5Jwx8ylvWuCq7IRGUGJErUQKgGwdKzjAFER8pddjqTCCXJf53144EPCQfa4ZzskNt2/C1dvkZzA5XJK/ESMZV1nyr7jM8qMw+KBwskCweZ2isM1ZnVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oAiZpV8gHbcsIUNxUGTOnA8YjcbALk4FxFPOjUWWkp0=;
 b=au5voNi0ujQPdfta/eoLsDQ3Ao6hnEDytpyD6pvU+BsjMAjenv/5k7gGBjfSLTaPdMQv23X/xZJ6g+xZkPvMa/v8RwcPIanz6wcJWVOBUIk7wooUhDR7i3LI0hZ75yGTd2olLrYJRftgi2YtfuuTNlDZBgZEAOciE856lXbGSlA49hCGkBbXP91XjmR2dh4/Kly54+1dwYeXcADdC1PsSp76mqldaoXzyxMfoTj1tVFcugYTzhPkFRYb4t9Ub4cDjTC4ebhCKhk2pnfZ082d0WhVtqYNjp1xP6E25GuBoL53evWZtv/uZII3T+gnS4X6WSCAeHUCQzNL+tlR7sGcoA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <51341b6d-c58c-585d-4ff3-68076604e255@suse.com>
Date: Wed, 16 Feb 2022 10:45:45 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.0
Subject: Re: [PATCH 1/3] x86/retpoline: rename retpoline Kconfig check to
 include GCC prefix
Content-Language: en-US
To: Roger Pau Monne <roger.pau@citrix.com>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <20220216090300.9424-1-roger.pau@citrix.com>
 <20220216090300.9424-2-roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20220216090300.9424-2-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AM6PR0502CA0064.eurprd05.prod.outlook.com
 (2603:10a6:20b:56::41) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7b8895ed-8842-427b-c9cb-08d9f1311b8d
X-MS-TrafficTypeDiagnostic: DB7PR04MB5994:EE_
X-Microsoft-Antispam-PRVS:
	<DB7PR04MB5994E39D5A50BC132EABF7F5B3359@DB7PR04MB5994.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3383;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	OG25gxll29c5ejVozUFvoRaIFeUJSgpmHlCtpdeqc+sFtQwejzHTkJzaMGbYEfvmxkRCho6hUyJ8UQht26SMAG6f8GlWZPxYoeUDdGlpN14/6rHHNOJ8+OfQ9ozUaT+JfbT/J+JQ+6HRVj7rj+EMKaYvnirxSrTebg5XwWNMcXdxs1Y6g79ZDZwAb/l4kDX/4NbplNJNV4CV54wiKb5dl3vOTMyvmxi1eUI/7K2yyywltBcOwxTPglp5HvCelATBkbejV8a574UaHAioWa+DQhlCC5pEkismwU7skecbs3ndBSPVyEodlzAmpxK0gn3q025cM1wyLCFGdC7HeoQWQwE+kIeMwCz8Fyi7ECwdvqOvZnxdRH3syZW/DLjDs7AV423+6vRq25AGL3thC3jUCt3r7UhVh3zuTDqd2N0xCuhKDcS3kp1pUh+XR+SC+BkKMoVVTs/c9pWIf5Up3dtFO0nQDgwN65GQaARzlYhZAnc4vajnbeedk+3OxXuJKOqA94lYcz19SUkICI4N32swK1/dB0BrTP9rxO/nN8Zg3oPeieOVlA3bPTmKBCUoAS5geEDRfebc4bFl3g/JOHXVT+zDRTgy4/p7KZ+Qe/EB3fDj5V1JB2MGQE1HZaRZ9camgvsjFp4JMLxL/5A1wLdr9KyuZTpqn4mtGSArnsl/dcPwbKCAOkxEx6d2SJ5r9H44J0q7+/DCeA22Ak3DSapPKvKT5AJ1kY9Ao1xEE4AGRJ/dj2Xtvdad0w2oDUC5hrNf
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(38100700002)(2616005)(6916009)(54906003)(508600001)(316002)(36756003)(6486002)(186003)(6512007)(26005)(6506007)(31686004)(53546011)(66946007)(4326008)(66556008)(66476007)(8936002)(8676002)(4744005)(31696002)(86362001)(5660300002)(2906002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?VVa+cDjosqd53zHB4ESbb2V+OIf9ennKxUx2D08b3Nnvy3qd9QU5yzIikINH?=
 =?us-ascii?Q?MRqCKdLt01fE8meZUKs6XEwZBlYk2Iq29aDZbptAwn2cL4xnLJj2MJZ43jtb?=
 =?us-ascii?Q?Nq6NO7x3zoFouCkfWpDLVAgz/F/CSrql4JCTc4gP/7wXOFUhvOmGnC4wJHXm?=
 =?us-ascii?Q?l2H3VRuRGvFEASJZBAnKAwT61Y/FPg8EEdDoBFa/RSTLsS5yi8rl7Y2bOndX?=
 =?us-ascii?Q?kM0M0hhwmh1PhDVflq+9pt5CNkjTmC8aBtrJmCisKWm/Hf3M8fAWehLkvWEw?=
 =?us-ascii?Q?GJCXt6mc16Bgda7NhS31fWlFkH6CtVPXyY4RUsCCv0U035mHQXGSL/TOPLM4?=
 =?us-ascii?Q?6Pqy+NvavvWMnvr3rI0tSJYCsDWwE8gyWkxeIri0vzXK2ntcpJSixF3y7QZ7?=
 =?us-ascii?Q?i9MWA+tQ/mc49mgSL8jGageF5B/8VvPCRD2FaI3PMrnv64Jisd/Y+6jnZTT3?=
 =?us-ascii?Q?3rDXlAvTcRE8YROtrnne2BJoKDRjL7POxLRN1DF5eOFoNIElDqmuvOZJULVG?=
 =?us-ascii?Q?3xcHkzAJabYto+ICPJduNYPMH30p2aSaneJXR1iIP46MQ945tcUXjUkKp/Wk?=
 =?us-ascii?Q?O+LQKvYE/jUR+3lAvtAu8XOHzL7Az428A52Jmu5NwZ4scAwfc3evHWlcqwop?=
 =?us-ascii?Q?/Ke6+QyTqpxZcdT7roYYa4NTxqHKlq4ARqp0I80dNjdfHGHHQx7Ic+Y0+any?=
 =?us-ascii?Q?hR9ub03WUSBecQHMCyrr74DFFOcc/22pyBC83bNDcfBLCXqw6yR+d9fuZ/VB?=
 =?us-ascii?Q?QshohLREgkp/ZLJ19jh0IyZGScIKlshtrhqVLYemhOP/5tGsMtPWtBrBPVH9?=
 =?us-ascii?Q?9w0IMdT4tDVGVu3ctuURCLsywqR/XrTKlw/Pq2IEgf7yNH6v7Q8biGiKtMfZ?=
 =?us-ascii?Q?SeOEREOWrB8PIgKjkj/z+v8iOi+nOCGveFE06wvipChiZGHxiQNUWiYNfbZk?=
 =?us-ascii?Q?vUdNhjtqpTZVh4l5VJHGKeZDFBybCffXguBXFXH+xnJ9Kdv1y4OIwGoH2ppT?=
 =?us-ascii?Q?gPOqa2zCJJBY7Fxj6uTgW4SJK3q70mLK8sa2fRzEdFtdAXldSt4hrfvinNYf?=
 =?us-ascii?Q?3B33ZpQTReytKWXuI2XMXPgLGh+w/ayt4rjpLQv82EpVKUOjCbua7UO6X4Oy?=
 =?us-ascii?Q?/CRX5R/nCsvgOuGFXOI4HvypjUh87YV6pGoFbNorpOisyPBmOoKQjGpAc2aC?=
 =?us-ascii?Q?Fih0qXEuoLUVlTuGvCdeaTdOqvB67IJEtqoRSVCsx3KRQ7eM7VoIPCSO3EcZ?=
 =?us-ascii?Q?EamHImWpewBEy0UnD3TD3gbsezovoj8QqBg4ejC2fXULJ4SvM+cfjg6xKKPl?=
 =?us-ascii?Q?U5Z/t1PzCuTeK/9riZtRsHFXitSEf/B94FvOTERTyPYZoe6F6PICDhcHW1RI?=
 =?us-ascii?Q?BgdDtNrCdMWgZ7a7X5ZbjKPGwUOnd7fQ569udz5kYeZYwf+HvOI1nLUGBuHN?=
 =?us-ascii?Q?TRHSpGOrBgm9WK0k03I8UtavTnK20JyDuZsKXFUPTwmtKm32SypBHe4DpF9g?=
 =?us-ascii?Q?/rPF64hYz6OjEd6uYGlNH5YUKKkea4FlxfF0bkZr6quAFLyPuw8ivaKNjBSP?=
 =?us-ascii?Q?RcOBPMdIni5EeNfEr/XXlGA4FUaWrHL4ry8VsqqGaGGdipz0ZEdVSdguW0d7?=
 =?us-ascii?Q?qzBgqJ8G3AzgEDdP4sQnf0Q=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7b8895ed-8842-427b-c9cb-08d9f1311b8d
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Feb 2022 09:45:46.9010
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PD3nxSQzNlB8zknCcfeqhoWl16xfOJsQdhNSbjxk9R+sHe2LBWxseyKa06GS8SCtTMjLX3ibhHTovb+nbv70Gw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR04MB5994

On 16.02.2022 10:02, Roger Pau Monne wrote:
> Current retpoline checks apply to GCC only, so make it obvious by
> prefixing the Kconfig option with GCC. Keep the previous option as a
> way to signal generic retpoline support regardless of the underlying
> compiler.
>=20
> No functional change intended.
>=20
> Signed-off-by: Roger Pau Monn=C3=A9 <roger.pau@citrix.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>
with one remark:

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
> +	depends on GCC_INDIRECT_THUNK
> +	def_bool y

I think it is more logical (and more consistent) if "depends on"
would come after the basic type (i.e. the "def_bool" here).

Jan


