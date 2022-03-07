Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BBF24D041E
	for <lists+xen-devel@lfdr.de>; Mon,  7 Mar 2022 17:28:49 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.286291.485760 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nRGDi-0005eK-RI; Mon, 07 Mar 2022 16:28:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 286291.485760; Mon, 07 Mar 2022 16:28:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nRGDi-0005az-O1; Mon, 07 Mar 2022 16:28:26 +0000
Received: by outflank-mailman (input) for mailman id 286291;
 Mon, 07 Mar 2022 16:28:24 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=XxC1=TS=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nRGDg-0005at-JY
 for xen-devel@lists.xenproject.org; Mon, 07 Mar 2022 16:28:24 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9b437db3-9e33-11ec-8eba-a37418f5ba1a;
 Mon, 07 Mar 2022 17:28:23 +0100 (CET)
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur01lp2057.outbound.protection.outlook.com [104.47.1.57]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-18-OwQ_D9Z9M7aFFwXU-fD6oQ-1; Mon, 07 Mar 2022 17:28:21 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by PAXPR04MB8654.eurprd04.prod.outlook.com (2603:10a6:102:21d::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5038.14; Mon, 7 Mar
 2022 16:28:20 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::d479:b728:345c:bd65]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::d479:b728:345c:bd65%6]) with mapi id 15.20.5038.026; Mon, 7 Mar 2022
 16:28:20 +0000
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
X-Inumbo-ID: 9b437db3-9e33-11ec-8eba-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1646670502;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=3hxqySCM0l5eg/V8RCuBROwKqZKolZuN/8KZRb8qhB4=;
	b=QxUj8HmAGcj+h+JlhzREBDivThHrQUH3QG6qLbdXqFtYiESURGIdy02SKnVX70PitYl9bX
	9FsW5SXL757I3qOWsjvyuC8FQZcyW+ivIQis215048K/yRmfJjXEojrSeDN6yji3zLdnMX
	1RMgbl09W0Vj0VUF9CEZUPOORofSgF8=
X-MC-Unique: OwQ_D9Z9M7aFFwXU-fD6oQ-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dtM2MT61SVVqllOv5v32ALrUpAR+zioBTQ9PxKWXwzeWlefp4AIh+FnE2S/INeAcGZ3j7QvNCKicjnfxM+sz8DB84PbD6h8sVsl0tQGD3v63e5CB+B8O0eb1qozPsjzStRS3bfKABJ0ZscnnKWE8tOvT4Ymb+P5/OZHrmgviUL/w12cK5L/6btP+f408k/l61EhUUwbeODlTSJDTPysXrGsuSEqDGHKTeW7zV17b9gxBh9kpxuLaSgJJNkTFX3eJqoN1PIUVwHY2SC7W69SWouwqSbVdiYnwkFZcTEoQelo4hDuVZFkf7P6b04rSWUA77uhAndklKLmErgAsF/Xaag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TpZmy+WckZWHPjdugwBIWtrS8HJyTvdknliRjg0Fh5E=;
 b=bxw3D5unEnq4iSS7Pr4KS8WctYcZ7pZnb8f9zJDDs+D/LNzV2RigfCK941XWLl3nm3ezMjFA1hit5Xj6hSLj7YCRYC+za5my7ia/w/UjE+nMDW5eNXHKelg056fSgHNpupEhaJ9IWfmHnQCD1PjZuHF2qeudgLPPvGapQvqChasvFVWTmqVN/v5ET6Sg7gJxApuKbZbJh3zX6mGQvSqSZNlxpY/uA9vs6CIduk3RAFyu8hswKRIZgxVjQ9K8v1faZZUGSBS1ehio0le/Qh5/dX40ja/qgJmgSw8EFJMZYJO/r7/OG/LTgnewYPN5AVZMz026hRmH9FbrcznA0BxI/g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <984284e3-c423-16ec-5ad7-c4211ebddb70@suse.com>
Date: Mon, 7 Mar 2022 17:28:20 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
Subject: Re: [PATCH v2] livepatch: set -f{function,data}-sections compiler
 option
Content-Language: en-US
To: Roger Pau Monne <roger.pau@citrix.com>
CC: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 xen-devel@lists.xenproject.org
References: <20220307155558.72876-1-roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20220307155558.72876-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AS9PR06CA0169.eurprd06.prod.outlook.com
 (2603:10a6:20b:45c::33) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 200217cb-8ea2-4cdf-7a15-08da00577da2
X-MS-TrafficTypeDiagnostic: PAXPR04MB8654:EE_
X-Microsoft-Antispam-PRVS:
	<PAXPR04MB865426C13B7A859B5BEEB5BAB3089@PAXPR04MB8654.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	hrqiHVOWojYdNEsrfG8Yc4eu8gfDfEHufjhow06HR8w4NsGnxZiMC5LihM9sm9bBBWasfQa8bf5VSOUR8Fxg3oesCSnDafjN0LOn3FBuDvrOCPp6F8RjCJoBIy+WA+EgaghMMZfIoOBSW5L8TmxUu0nPh/zXCvUxW3+oUPITRmtvYby21CucGxMQJK1UK3+1G7y8gWZCcRCA3ojVYjBzaRmd4+vVX7p5QKWr+NKwrfD9dI4MSPhH/VEP/lDvxrgSWYppZdlGrSmfAoRr+WoPdbduiwkuxb0zif13jMuw0RJ8KTUp+yK4VOE3ZAENGDrGgp/AU2zDfKI0/LgsS0zL4nlbMunwT7glIeHlO8ulbUURuRnOHL7XhG0vNigOHQtCc9qlvSN5zGtUQ8074L6o6JCkuPXyvkSXFnm2JwpWhkqOCq4Df4tlsBgAS29LeWtCSjruds1Pdk7pWWyKOoY1iktUVRy+FtJa1wmZJVYyrjzbn7VSL8k2mz2CbItEXl8bPlT1KMVKIU2WP6yRVfFgBeSvs/So6PwxbSeaTNwH5PN3LaROs7HQHL3GV+WZvzK0ZNDNDJm5gQV2r6TLLLIw9L5bIHN1QyQxh+50XU0VqrLiCFNcGWX9ma1CdGGeZxhaZJBWkWRB3OltyXLNv1fL2CN04wWPi+Tr6bTAZs/39vnv8pCgY0tzpfFZeT+x4+Vs6ggKTFMt9zUIua42gHwx28jJXiuazWzWjr6UZgNwZPI=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(31696002)(8936002)(38100700002)(6506007)(53546011)(8676002)(86362001)(4326008)(31686004)(36756003)(316002)(66476007)(83380400001)(66946007)(26005)(66556008)(2616005)(186003)(5660300002)(6512007)(6486002)(508600001)(54906003)(2906002)(6916009)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?IrTpwh7mF0iEopD+WFFD7up/Fs3ddkIFUIVlc3VXxOMt015xUECpLH8+psd4?=
 =?us-ascii?Q?rPhjcAvXYG1JYoXXnegW/pBRLxw46Bz+Wkd9I0hPEGREUCnU7LEetYYNb82S?=
 =?us-ascii?Q?fDvtuNB9R7HH4WX08vxzt8o4iEm1QjVHxBSwovTxjTyH/EfW7rd4hiepwUqH?=
 =?us-ascii?Q?stwiXAnTb5b657ZdM7CTR5ZSxJ6j4TyLsYP3ZR5rnR/2PoRGW3iqPXsKzYnj?=
 =?us-ascii?Q?2FSmgOOwbrr7kmdA/1ALLKGOlVpmaNUpqdUaBY7NutU6pE/ZXTovmW7X9se3?=
 =?us-ascii?Q?tJGOclUXrC/qqmYf9jGhxK6kb2nH7ax4gVbF157C8/n0klXJuMmZpaHNnY5i?=
 =?us-ascii?Q?oGSmKp1cGcIVr/BE1hDwhWcl2KR9u4LeyhXVnsyje58tJgtkHGYm2SfVsMq1?=
 =?us-ascii?Q?nP3xOpC02VJXzGQWhSqpqE/6I2mZfhAdujonL8lb3WC+ljlM2T5AOMQw7/d1?=
 =?us-ascii?Q?8gvQeNXI8KHm4fFB/jsOaSXqloieL6xGRuyJhFZD/R1hXgslqsPUom2bE0+K?=
 =?us-ascii?Q?vTI15mFuIYmpS2N8zrbliuHxYV+Q70TA2sA0qgjFR5q6d7EYpbvh7P5aogPz?=
 =?us-ascii?Q?4aQPS+ajjI5yTzpmiuAWXb8/ao0NQ4w4tAYxXayvJLnnPSS91Jy6qd1wrXOT?=
 =?us-ascii?Q?ocBHs58F9FHRthq3sa3CwEp0BAAOFweK608JQ9Ii7ThXzHbGVzMO41F1rEHV?=
 =?us-ascii?Q?wfWxTOlmfoqGdTPleY0tSAv1F9Qq3ZPCsqQXrkaFtEkMlavEgLf4n7SVKVtI?=
 =?us-ascii?Q?IZ3Q6AR8Pl1s9v1IyaXZHDmxaAfGQQdngr7ns+eJKJicxQYzoosERTT71P/I?=
 =?us-ascii?Q?mTBzl4W3yve2R2WBjFrdlLKN2ULqppjja7Vk/LT10j5V1U0wcIAB1byYiHBD?=
 =?us-ascii?Q?6BmU2dn0PFzbpW8u5YXsrCMP31gTo0cOJLbm42GwiITfz7Ys/+w+YygfqaKk?=
 =?us-ascii?Q?aF3b/7WxD0jm16gLqQjA0Gb9I0d5g+djhdBZOdhvspNJyzQJ2h0sG4xzpgks?=
 =?us-ascii?Q?oj7ct9v8/DoEwTqpu0CIjbYa8AlGaB6bLwR+xmX2lN3twX0sNUXP4VqadJ/F?=
 =?us-ascii?Q?L3SkrbpFQtpfaveIYtj7CQ25HChlXpTZvNMLyShLgyyjz+KH5Z+cnZgoTCnC?=
 =?us-ascii?Q?dku0CQqAOgz0ZLgLYDUa2NI6ynZUupFXLKXL3qz2XKrTgwNmxHg1ooHbr0cH?=
 =?us-ascii?Q?CMkJYiUjtw7Ev2RFrhVJkQKJh/dC6M9dP2o4ENavZspfaigyTPppPzo3sDjB?=
 =?us-ascii?Q?s0I9ddbke77uwWsB+bWBSxY3P/h2cpm6e4Yq07LOsAmrA50mG5dfJcxUBnYT?=
 =?us-ascii?Q?zyFQ8IqnQ4hZS6G78wIraSo7VglF+aYFG+YipbJ/XtIgv9ozAXelfbzTNjGz?=
 =?us-ascii?Q?hIZDXhYK4Ln6a+CsWro8otKiF7Tm4tSLJAJECZNBCZ1J/jXLI3VKdkkKbKuU?=
 =?us-ascii?Q?a3aAkDm94rJ/qD5jffg/fyBPI1yHhq1RXBz8yuisrdBVSAj0vglm1Y2R/4VI?=
 =?us-ascii?Q?6BCZog7WgkOfrWXnbc4Gfv2AJSirxdZ8ySTdY41Kty31qv3IJ8YvJkBYTfzN?=
 =?us-ascii?Q?WKAQ7wUk0p+VAwv8tqGngsp0anNi2epQHcsE9hrLU07T3bszCNYKgGpn3Aua?=
 =?us-ascii?Q?h95SPlmk/5PL7smNenr+KLQ=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 200217cb-8ea2-4cdf-7a15-08da00577da2
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Mar 2022 16:28:19.9738
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mUNWY/xye/cgF9yILxFtmIPSBS/3txGJI4V/nsrn/ekOm8KBmazYPIQQZd1PumISfWDfV6x7q5YHNGXJZ3ecCw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8654

On 07.03.2022 16:55, Roger Pau Monne wrote:
> If livepatching support is enabled build the hypervisor with
> -f{function,data}-sections compiler options, which is required by the
> livepatching tools to detect changes and create livepatches.
>=20
> This shouldn't result in any functional change on the hypervisor
> binary image, but does however require some changes in the linker
> script in order to handle that each function and data item will now be
> placed into its own section in object files. As a result add catch-all
> for .text, .data and .bss in order to merge each individual item
> section into the final image.
>=20
> The main difference will be that .text.startup will end up being part
> of .text rather than .init, and thus won't be freed. .text.exit will
> also be part of .text rather than dropped. Overall this could make the
> image bigger, and package some .text code in a sub-optimal way.
>=20
> Note that placement of the sections inside of .text is also slightly
> adjusted to be more similar to the position found in the default GNU
> ld linker script. This requires having a separate section for the
> header in order to place it at the begging of the output image,
> followed with the unlikely and related sections, and finally the main
> .text section.
>=20
> On Arm the .data.read_mostly needs to be moved ahead of the .data
> section like it's already done on x86, and the alignment needs to be
> set to PAGE_SIZE so it doesn't end up being placed at the tail of a
> read-only page from the previous section. While there move the
> alignment of the .data section ahead of the section declaration, like
> it's done for other sections.
>=20
> The benefit of having CONFIG_LIVEPATCH enable those compiler option
> is that the livepatch build tools no longer need to fiddle with the
> build system in order to enable them. Note the current livepatch tools
> are broken after the recent build changes due to the way they
> attempt to set  -f{function,data}-sections.
>=20
> Signed-off-by: Roger Pau Monn=C3=A9 <roger.pau@citrix.com>

The x86 part of this looks fine to me, just one other remark:

> --- a/xen/common/Kconfig
> +++ b/xen/common/Kconfig
> @@ -350,10 +350,14 @@ source "common/sched/Kconfig"
>  config CRYPTO
>  	bool
> =20
> +config CC_SPLIT_SECTIONS
> +	bool

I think this wants to live higher up in the file, perhaps between
ALTERNATIVE_CALL and HAS_ALTERNATIVE. (CRYPTO, as seen in context
here, imo also would better live higher up.) Or alternatively it may
want to move to xen/Kconfig, next to CC_HAS_VISIBILITY_ATTRIBUTE.

Jan


