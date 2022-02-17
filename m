Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3691F4B9BB9
	for <lists+xen-devel@lfdr.de>; Thu, 17 Feb 2022 10:07:49 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.274549.470051 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nKclH-0004ER-MX; Thu, 17 Feb 2022 09:07:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 274549.470051; Thu, 17 Feb 2022 09:07:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nKclH-0004CZ-IT; Thu, 17 Feb 2022 09:07:39 +0000
Received: by outflank-mailman (input) for mailman id 274549;
 Thu, 17 Feb 2022 09:07:38 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=xzkl=TA=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nKclG-0004CT-ON
 for xen-devel@lists.xenproject.org; Thu, 17 Feb 2022 09:07:38 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0d4aad8b-8fd1-11ec-8eb8-a37418f5ba1a;
 Thu, 17 Feb 2022 10:07:37 +0100 (CET)
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04lp2050.outbound.protection.outlook.com [104.47.12.50]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-12-i3SFe0FyM_KYYRiD4UznMQ-1; Thu, 17 Feb 2022 10:07:36 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by DB8PR04MB6523.eurprd04.prod.outlook.com (2603:10a6:10:10f::26)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4995.17; Thu, 17 Feb
 2022 09:07:35 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::d479:b728:345c:bd65]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::d479:b728:345c:bd65%5]) with mapi id 15.20.4995.016; Thu, 17 Feb 2022
 09:07:34 +0000
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
X-Inumbo-ID: 0d4aad8b-8fd1-11ec-8eb8-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1645088857;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=qxR+U81+Bws88LV73ylkbssUV3f2VX9Dxi1UEzAImpM=;
	b=ak3haw/vH1p3b3n6+0tzhKU7khytfGvtaTQxVEgzCrk9K9/1h1qEznA7ZcIAJ6Khcq87k6
	zaE/O9xI1faqpbfPTl80O+I+3kW6H+QkbxGiFyPPGDTFlSpVRau9li2eATz/Ij4oXG54IK
	99LHsnRSoAHjpy56VXfNEJ5Zdy7SOGw=
X-MC-Unique: i3SFe0FyM_KYYRiD4UznMQ-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mjfnYvqna72/HdXYEDsZy16Z7H8AA3lWlGvKenld8wymHpAB8kbug3kvkIqBTFXbLii6MIVO1j2a8sL3eFsoFtE/0JgoHHAPbYX1skJplRWpDOIx+yvUuAJsecmSMYyoZLZvXOOx6zF8MbDvGe0lmL1vqMBayu84e2vK/egCDtdifMRNIkW3ur3oSv2BmgyS3CU5kSNSUvormwk0iFD72Df+2UdJQHRX30CcseU8yGUaXN5jtlVHc6D2k1EnuUPpZbDNIyiVJmFJyUkJXvVhhSTNpOm2ZpE/Ipfa4/ycKqiaa6yPDN+HJFJby7bXOG556ydxdaR87UoIRwsiHSKZGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ktT5ySOkV2vsUa2J2WMDpKrja6GG5Cten5+0rHeuU1A=;
 b=e4BAZCiAfbmsUvB6QXP8hgFsynkfR/l0m+FI/vqOOLRV0OVoZdhGGtYajT18YMoT2xESy68BTlSAon5COcxHkHMxeLPibGAkPIB2i09H85vZ9kDKgGHJC6Hw3bUCN/Wzf2LEJnZcFY4ReMeTMC82z7/Dy5ILXxob/sMIwsZrq0wDngsSjt+rlshwbSfTX6CZUAPxTZjU5ZnXVtgE7h3/CSJx8LX7zxyryosyiifH+UdKgl0uXFZe40bwpAtk7Lr27va6ezzb0d8klQ0LB2FwF8QW3CWkcysPv7fYS/Gh9RL+A3sFtPrjK5I2Wkziu6O9vTc8SC5jQLMK+XMEF8T5MQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <b6dc1214-4f1d-f7df-50c4-d357a2380b30@suse.com>
Date: Thu, 17 Feb 2022 10:07:32 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
Subject: Re: [PATCH v2 3/3] x86/Kconfig: introduce option to select retpoline
 usage
Content-Language: en-US
To: Roger Pau Monne <roger.pau@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 George Dunlap <george.dunlap@citrix.com>, xen-devel@lists.xenproject.org
References: <20220216162142.15384-1-roger.pau@citrix.com>
 <20220216162142.15384-4-roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20220216162142.15384-4-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AM6PR0202CA0060.eurprd02.prod.outlook.com
 (2603:10a6:20b:3a::37) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6c89ca2d-cd6f-4572-408a-08d9f1f4efbc
X-MS-TrafficTypeDiagnostic: DB8PR04MB6523:EE_
X-Microsoft-Antispam-PRVS:
	<DB8PR04MB652307C24BE4DB1474FBD405B3369@DB8PR04MB6523.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3173;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	MQMVsWUbYsSea1TApuD+agfnsr0ahZWHIrjKZQzh2X4uItf2TYGe2o+yYmjw5a6SR8EeQPxtT8av0tP/L5rht+ToPHMJ4gu8Tlj7RUW5hPSCwp6R8TXyDEaXMR9aNY26hGbCfoegltGSGJ1kKCaSX/QWgGlnpibHU8VOiO9DDMPlSJW7+yDW8ZtxriXW9c663PXobEXWvZDGZAAepo39mNXZDX8EzFQcOBcHUPkLlppP7FqWgXQ5mD3U32jORWXp22WXHNwj2f5cCQUcDGMi+8zFgUSRGNWSnDCzlwp871/5Q9MrN0HydGVba68Nx+clCcevcNNG0PU5aM0CiEEjyN4DC6PlG7JnzE02rmPMgQPj/3u+ZmJpOtiZldSD8pFufWQGNXBommf7TfHvLhnjBM0VeP+85g5MqL/5GU70sTuP062ZRIWAHWXcrpAy227VV7kD+JHaVhyCbVtyFf25ZaAIOXEhLor/Gr5I/twS7h8M8GCO6T0IX4RIGaNjkKNu29HtgXqUG9TDEX4wIs4GThg57MuVOEEJhF/LllhQ92KmpragNAEFibJk44JQL4jrgTGy8hEEzS09D5/Jw6gPAouulcTqFTcvm7HRdp/229ipQ3IuaX/9PN92/j9DiJtZbjVurpfhRk2rbUpCOMdoe3AhNm0cnSz1Jw84I/F+cIh/DseqJ7zL3znynq6RuCUwsQ65Td1C5IeIcJJ9GI5uNkGE/nUcakHvv6X0Ury9LMWn6qV1h70Cp8yWVyKhT5sX
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(83380400001)(66556008)(110136005)(54906003)(2616005)(4326008)(8676002)(66946007)(86362001)(53546011)(316002)(66476007)(31696002)(6512007)(6506007)(5660300002)(36756003)(31686004)(508600001)(6486002)(186003)(26005)(38100700002)(2906002)(8936002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?+D01LgujGN3Ywbg5Ou8jgmReo91dVKKxYkDeWG16k7bapHg3YgeOTOZnWPpB?=
 =?us-ascii?Q?dpuFal7kJ2pwipYITWz53IkRceFYSE1D9jVHCREmStIliyo2hLVPJonJF8kO?=
 =?us-ascii?Q?wobZhA1Id36ZdPiKM3a9QKGDGYzpuadELrdwujMFCFd0YPpZLseTERMSiC1K?=
 =?us-ascii?Q?5+BwMN8uPKJVwAAfFsv3JFCmTv1TZAWFYjXzjXHkxdLqx6EHHjcK6M5BqIbe?=
 =?us-ascii?Q?y5ziIiMUVKL+7pob7yZgKqcrUZmc9RDddtLygUqgVnbrzAKeZhw3utdessAy?=
 =?us-ascii?Q?rQhG5Vy5Ne+HBwNRXafcxNt3e/CgIpm+t+FV3OJ+AMatinJ7YaKn7ZrPiA1n?=
 =?us-ascii?Q?y3SJgo9S65NasSM0ybCtndZ12PYZySdq7Ehe/fJkHnMsCROz2NVH7WQRU3/w?=
 =?us-ascii?Q?ue/qwcfF8qSHZffrVfgSRBtmh4T3uRlMBu/1RWsF0wj2mCqpQVj2ah094YNC?=
 =?us-ascii?Q?82pHYOHgMVQy6t1WFOTAhFRK000oLyy4jo8HT0+CSMfhhu6G/hUVtfNdxJSk?=
 =?us-ascii?Q?iElfyKFbpbMPHFDdWHA3IGVxe7BjUJNO1JgU+DV4c4JROlWLuTdTG99oTKeB?=
 =?us-ascii?Q?w6LAyuax2jgx1pm/gMgNPmfJavmxD8WoG6ypt9IqT225vYTbjD27IpRnmVgq?=
 =?us-ascii?Q?KhQ+S9QALODoWNFqNi9I9ooIFuYO9kXtG+UOYkS1vVd5FnwUMgEfJu1pU+XT?=
 =?us-ascii?Q?SXZ+Jl+eSSOUK1FRoHm2n2duJxVw8qUMXQsM0INsnqQYuy4KwREI3xfUXPPU?=
 =?us-ascii?Q?lpFXwu4Hlommc84A96IbJWehL+x9fCyg11UtR/1VUM0ydg4UO87RJ161pvEv?=
 =?us-ascii?Q?pVOvEDKSBuTU/3M4VR371mHSP1sauQ3PD4qlzhu+f7LlOln2KXSmeqH0AEuE?=
 =?us-ascii?Q?4MVR/HZNBHb7uHWfZxo/exIKuntOYO0p5QLNcu7I9vVqGGXKvkZPnSaEMSkX?=
 =?us-ascii?Q?7XtwkWSXyo9N7qPJMs8Fx0FBUr1nit1vZvJ9OTXGJtlVjHA/bdenFAsM2xvp?=
 =?us-ascii?Q?1uwe4x6X3ypb+iZchSLIgfedgSIHVdxUS9+5EhwnKolFIl+THcw4IMFaCZ1a?=
 =?us-ascii?Q?X60ZTuSB02mUAJhlAHZPbjvV+N9h+vNg+M8tO14dgcjCLd1+TSsZEc94vHsY?=
 =?us-ascii?Q?0axFwnudO3FNAiZbM0rqb8+xIq9ZL1mXJC4XAaTDEOyHyP6pUby6X1Ai58XY?=
 =?us-ascii?Q?vLvVSXZdJ8VTU8cXEjRfeXcCTPNcSSjjxUhLZd5CgZJTHY5WePPeJjeA+RZV?=
 =?us-ascii?Q?MBWxcbVDnsp2xilYbmA0DYEnw1xwNK2w+prIhyWzsJOiaTc3yIu0eusQ9lnE?=
 =?us-ascii?Q?OiW/QrbyBfUSEyeWGAvEv1Q4sO8mbeLW1OrVzE4KKUz/cChzsG7fWMWeLusV?=
 =?us-ascii?Q?kIqIbql8YmX0qpdM9pyoV/UxwCI/aPNQ5MnngYqOcHpipBUSqGGyuxICat32?=
 =?us-ascii?Q?xFScreDiJ3pJp7wWZPfSJy/NVhMoxrZwijxnggj42ZNvgOyLDyutX9qYiC7K?=
 =?us-ascii?Q?DiEaBHk4n9ANs1ZaDfgflkwRk+dNq3g6ap+Cgb5/1kKyTEwjnXmXk89+5YvS?=
 =?us-ascii?Q?NsLErzC01I0NXSHn9AFhweZ22QcZStuy0Daw9tABTm/yhocprbnhpQ5lOG8O?=
 =?us-ascii?Q?1iHUUZ8bzIukgzLZZX/wkdI=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6c89ca2d-cd6f-4572-408a-08d9f1f4efbc
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Feb 2022 09:07:34.7604
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0SZUkzxq66LG5IzmSlErUSvN8M1pRKedN6FgRR565l2WNRgGdFwHKjEPSOhw8IP+uDebRqbIBo44eb4EPHtDUg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR04MB6523

On 16.02.2022 17:21, Roger Pau Monne wrote:
> Add a new Kconfig option under the "Speculative hardening" section
> that allows selecting whether to enable retpoline. This depends on the
> underlying compiler having retpoline support.
>=20
> Requested-by: Andrew Cooper <andrew.cooper3@citrix.com>
> Signed-off-by: Roger Pau Monn=C3=A9 <roger.pau@citrix.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>

There's one aspect though which I would like to see Arm maintainer
input on:

> --- a/xen/arch/x86/Kconfig
> +++ b/xen/arch/x86/Kconfig
> @@ -38,10 +38,6 @@ config GCC_INDIRECT_THUNK
>  config CLANG_INDIRECT_THUNK
>  	def_bool $(cc-option,-mretpoline-external-thunk)
> =20
> -config INDIRECT_THUNK
> -	def_bool y
> -	depends on GCC_INDIRECT_THUNK || CLANG_INDIRECT_THUNK

Moving this ...

> --- a/xen/common/Kconfig
> +++ b/xen/common/Kconfig
> @@ -146,6 +146,22 @@ config SPECULATIVE_HARDEN_GUEST_ACCESS
> =20
>  	  If unsure, say Y.
> =20
> +config INDIRECT_THUNK
> +	bool "Speculative Branch Target Injection Protection"
> +	depends on X86 && (GCC_INDIRECT_THUNK || CLANG_INDIRECT_THUNK)

... here despite being explicitly marked x86-specific looks a
little odd. Since the dependencies are x86-specific, dropping
X86 from here would make my slight concern go away.

Jan


