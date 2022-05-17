Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C3CA52A4DB
	for <lists+xen-devel@lfdr.de>; Tue, 17 May 2022 16:29:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.330955.554375 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nqyCL-0006VZ-NT; Tue, 17 May 2022 14:29:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 330955.554375; Tue, 17 May 2022 14:29:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nqyCL-0006TB-Kg; Tue, 17 May 2022 14:29:17 +0000
Received: by outflank-mailman (input) for mailman id 330955;
 Tue, 17 May 2022 14:29:16 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=qAxi=VZ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nqyCK-0006T5-3I
 for xen-devel@lists.xenproject.org; Tue, 17 May 2022 14:29:16 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b9d71401-d5ed-11ec-837e-e5687231ffcc;
 Tue, 17 May 2022 16:29:14 +0200 (CEST)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05lp2108.outbound.protection.outlook.com [104.47.18.108]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-22-Sm7HkiJWMSCnHT8lyxe1ow-1; Tue, 17 May 2022 16:29:10 +0200
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by VI1PR0402MB3823.eurprd04.prod.outlook.com (2603:10a6:803:19::27)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5250.18; Tue, 17 May
 2022 14:29:09 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::91b8:8f7f:61ac:cc9b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::91b8:8f7f:61ac:cc9b%7]) with mapi id 15.20.5250.018; Tue, 17 May 2022
 14:29:09 +0000
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
X-Inumbo-ID: b9d71401-d5ed-11ec-837e-e5687231ffcc
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1652797754;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=W/LuzXEtKu4iw1secfUP71mrwWuG+LY75uzglzpgIGA=;
	b=hapEkK4FGuK3F+Bz2zFlqgS36eRlcf23dOPMGISoNW2V5sd698q7tzfaeDyPQZpOfbAH0l
	dFnguhGu++MyCm50/pL4uOOSbxePVQKFKO1GJ9+2d5G8JMMcSMFm61zEJZ+6Jpafq4Ztzl
	5g5yUuebeJY+9OlCSR4dny6V8+IDmes=
X-MC-Unique: Sm7HkiJWMSCnHT8lyxe1ow-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dM95Dxu3EwwSsM8tF7P72UsPkKfh5LxIqiTQqYBh4n/Es7B94YEH2EMOedk8GL2Rtk1+73WYWag0W8guhiztjfWPPRqkd+Vxcygb/tpbjoJnadi5rmPlQkdtZWn90J98GZJG+dkCIJA4RtJW3Or+t6j2gXahLFxzVoMUlV5CBuvQmmdLwJ5kWXeFfWXAPyB7eDqKC7Hcv+ICkcB2tCv7gi+teI5LfycU1f4MHEu1bTI37CXFZRwBaYWdoFHWcu0FaUh1e0gq+PzLJk27XB0Yeaior4+8psoIQeHg4pkjHDrWYJjoOOwhUla0no1fpMGyohTJT+YcKziVPp0y5G8EyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bVi3TvLbsnmSudnG95FiDbbbRq9+n3Wg/cRuoNp7Y7w=;
 b=fvuQJPCtkZS++BnvYLl9kywOrr/AlPfd9VBYqOQCE7Si4R47unqGGYoitZD1Wp7aJcMjq6KxKLBZAGuxQJXq03cf7qFL1AwOn3h3/3nczb3GmU3HjjFx7aB7Dj3gCT8fVOZ6YHZDRQmwxsysOnQ11tMlAJuppvuQd9i14RIZ998Te+iYT2cXJHtavG69asuJP/VDjvQ3Xlv4APbuM59dPLS19oIbV4THdOBTahKQEozB/ZZa+Mx4hDXKSQ0x5hs+XU7iLwp7hgvkjvcy24Yopc273P9QPavC+U7IXQ43QSdKU4NDr45Wa1BWIw4Eo82BWb8gfChcgrgvs7dlZtxFfA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <f1887a2e-192f-eac5-1f02-5aee7a5b8cc6@suse.com>
Date: Tue, 17 May 2022 16:29:15 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH] x86/mwait-idle: add missing newline
Content-Language: en-US
To: Roger Pau Monne <roger.pau@citrix.com>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <20220516103601.25671-1-roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20220516103601.25671-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AS9PR06CA0767.eurprd06.prod.outlook.com
 (2603:10a6:20b:484::21) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: aa50b56e-9da3-4807-5149-08da38119ad5
X-MS-TrafficTypeDiagnostic: VI1PR0402MB3823:EE_
X-Microsoft-Antispam-PRVS:
	<VI1PR0402MB38233B7451CA70F97AA2FC05B3CE9@VI1PR0402MB3823.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	XChnKmYUTnVf2B2DmeOgJYeye1W3arrjN58IZQ8AmBEU+p70YewXNSaVzPVBv9nNyzkF0GPrqbPIxHb6nq0hz4hlljjXUN5AG0N5+mnnnbM/WkRdXMDaAs+7Qxxpjp39ICZm3xwuloe2Lm0o3rT+tBVTWEqjG2z5BZKUL76KUQogyGjx3HBgRUb6w1krEJ32oVjDWxhUa5t+/XvlPXMZbPBQUzz2DVbBSLn4QfPaNmwMDvo2N0mKPUaccltiz6MB+S40oBEOMKuit0HaF3fPotdoujq/v4W/FTq8/GErqlDzqaRBpbpNc7JS8hqQ4EE9vm/819gbWGfRCCWmFfJBKgm5s6YxIBH8Rfgd2jLgxjs3cmZR109slagqLeDF4kaZb1h6jkfos2KgHqp0tbcAeodkJ/1OLb4wOfaHfL22CycAjKKlq/J30iAxowdHjAZ0VcZ1vnwUAaQhwXSmjxxOMih8wjoDS0HZeG7Kitx8F4gayZANFH9xcWRIsrKxhoTcWx0IUiudc1sSvPJ0F55IxLE6aXgQQP8YNMoRRK/BldyCk4Z++gvrkDWoxs9/ubQJ9a86cEDIX7WbTbviUU72JGc/bQxcaLCmzNJd+QDAAocH/eRXxxVcc+fzM0MyYcFGgvye9Qo0P63Tw8ufhfo2/VlpPr0dLDSLhPV1cEHhbNQbNX4/8lmR2eGxVlNwJWHzBnGIODFnKr8Q7zfHz5b404KM8YqrZnFw3HNA2ph6tx/kGLkQnFc2XHyFU6+4+iewvgoz17/9bWjGYqTve3f8vBzK28LEM0JdqtqNJofuRfU=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(316002)(31686004)(54906003)(6916009)(26005)(38100700002)(36756003)(186003)(4326008)(66476007)(66946007)(31696002)(66556008)(6666004)(6512007)(53546011)(6506007)(8936002)(4744005)(6486002)(5660300002)(508600001)(86362001)(83380400001)(2616005)(2906002)(8676002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?bGJEpZR75bk0MzyWohxeptvzRHF+EryIkS7mztZRrJXqBXOmePX/RUmSXGLx?=
 =?us-ascii?Q?7vxBfuXzO4G8kFiFYdgbELJ49l6ZLoRPhYUh4hIlDv4vk3YAUW93qt1QRi7C?=
 =?us-ascii?Q?Q0QA5uJYqz5fUKYC2pF7Gx/85I87mJaMEdqSPiy56/uSJxT15Lr5ZjHRSNGC?=
 =?us-ascii?Q?yO6biwLaOX0QoTIywxnic8r6AxEwL6NvSK7M5CUZvkKXMlJn2xgR+6Na8aU5?=
 =?us-ascii?Q?ZIaHVdLFzP5zwhPqfP1LfozBS1IdIE203h4uyVFrjGP//RSuWj1GzVRG6Yu0?=
 =?us-ascii?Q?roH9qF5FYtuSzX1dzRtl2KEjFsUMeLaj0iNhcgADX8hn4yyoEYcX5D4W9E5z?=
 =?us-ascii?Q?t26NEUrfVKYh/JJyp4kx+P1fWmHaKNMIofU8GByRCwtsKZbMwT/+66K7N9fO?=
 =?us-ascii?Q?v+7BWy+QNEc2Z377JcLaND+vvjlbDevN18226TXwI8XUtN3HNvGm5DPi5MFu?=
 =?us-ascii?Q?t63bhesmUrYEz0NeaMDm/FmTljWXFMDLQg1KFASyHxtcuTg1fcLR7yt61Sw9?=
 =?us-ascii?Q?Wy/hhTgg5UxgfK3EoRhMA4Y7n/hqNs6LMI3a3f5UdxrN1ocJKp6LFngqBTXh?=
 =?us-ascii?Q?fR/MVwxlqgaC2vnos1z1C/TpZAIuwf/Vef3Lcijpa6Z03JoaVcH2kCUwcfYh?=
 =?us-ascii?Q?E7oKq8MlatHa7KyIPLkXwWKOsYTxGRn1Q3meY9fJy0vVWLuCdor3dwgN/6Aj?=
 =?us-ascii?Q?jL9H/dwshid5giw6t8xJODqViAVYzrQcWerlJwXn3icuy4Z/TFMqn1+eBp2a?=
 =?us-ascii?Q?qRPFEeLyaPUg7pLQC/k/wI6iVfoeHMr6AiqljjVlnR+XXlsUYSnKsZDoBQhn?=
 =?us-ascii?Q?52a/u3+c+BFTFfI7hytQ1YwRh+2m46heZbjKR5NRRA6wPtf3yVjFkPdX4hs7?=
 =?us-ascii?Q?dCPQhi8HueF8P4Un0Miki8z9gFlw5Q1V8zmRFz9v2j8H7BmxxChh7K9qrMgE?=
 =?us-ascii?Q?nwlLLjEXxnHhqaMH/hnximKqgHWbzoTlg3AH+Q2JaT07KMqVmx3M8qMgi0U5?=
 =?us-ascii?Q?Zu1LdXyi7dd2RpYeOsN6Cs2ZuMgLobRS63Nf7OoKiLgqUUg+WCSx7+c23kXA?=
 =?us-ascii?Q?vw3LJkyYM+N36Bdmwb+/n9x7qNTY0cAnf6Mr38xkgrBGVQgjAFg2zJycm+3F?=
 =?us-ascii?Q?R/x28uHgO7seFyNvaYBt+WSHdOkKS7rl0jBLs4LnWBiCWsh8v3vMuAGMb4Ob?=
 =?us-ascii?Q?iHq/ObwQTw6MEOTZe5o7r2bEl4162VsgSoFPWnlrqoMZEAf4NSRMj3cHvbyr?=
 =?us-ascii?Q?GSf/2pet73F2lTsCweeKjiG19RiQ6Fj6okDZ4JPLWqrIjdshxKR5FmzcnkFk?=
 =?us-ascii?Q?BHWrleLX4AMeL/R514MZ78QJ8vMpPsE/tegJyvV1pmlI+HQ4XGtTmWscfB6a?=
 =?us-ascii?Q?0GkA53uEugrfZMhG6DNfeuK+w+tpBzvHHtflxK1vtZTgbALnAQOQxq53BDPk?=
 =?us-ascii?Q?p3hQykXAIDwjB4DylnJXES0bed5Ds0Fd3TvgMSvaSZ1QonNGbxJca0l6vSKA?=
 =?us-ascii?Q?ASaAKmMfMZV4clyY6da+ejtsJQiNpOpquQs8E9V+WKWRlKyaGjIU14Ca87AF?=
 =?us-ascii?Q?RKb42qcmJTRXhiHd7b/044EDhvrlg6y/7373Eqsr3jIGXuc6+bvtPRE8ll1E?=
 =?us-ascii?Q?VuC9vkeiQCI5dXEkxWWSfkSWdBemq9A2MAdYeQ5JK8j6mnHu/oj9Zr+GgN7Z?=
 =?us-ascii?Q?UsplQOncuKG48MnW8/FvhNWdk5E5JQhhJexOJTVUHISB3NOd12tpHCa6ydAx?=
 =?us-ascii?Q?mfQdilF/MQ=3D=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: aa50b56e-9da3-4807-5149-08da38119ad5
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 May 2022 14:29:09.1492
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JWaOrxnOEVPk2dFo7jTp1oswjfLPXyyWfNTiQ7lm7IbvUCfIbgYnSW9N+P+hkyahCyNqxvxac7Wp60cpuQwHMA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0402MB3823

On 16.05.2022 12:36, Roger Pau Monne wrote:
> Fixes: 5a211704e8 ('mwait-idle: prevent SKL-H boot failure when C8+C9+C10=
 enabled')
> Signed-off-by: Roger Pau Monn=C3=A9 <roger.pau@citrix.com>

Thanks for spotting. I wonder whether we shouldn't mention the Linux
commit (654d08a42a56) which did this as a "side effect". Obviously
the fix here isn't really a port thereof.

Jan

> --- a/xen/arch/x86/cpu/mwait-idle.c
> +++ b/xen/arch/x86/cpu/mwait-idle.c
> @@ -1363,7 +1363,7 @@ static int cf_check mwait_idle_cpu_init(
>  		/* if state marked as disabled, skip it */
>  		if (cpuidle_state_table[cstate].flags &
>  		    CPUIDLE_FLAG_DISABLED) {
> -			printk(XENLOG_DEBUG PREFIX "state %s is disabled",
> +			printk(XENLOG_DEBUG PREFIX "state %s is disabled\n",
>  			       cpuidle_state_table[cstate].name);
>  			continue;
>  		}


