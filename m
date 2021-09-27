Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9705F41901E
	for <lists+xen-devel@lfdr.de>; Mon, 27 Sep 2021 09:42:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.196425.349266 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mUlH2-0004Hi-Kw; Mon, 27 Sep 2021 07:42:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 196425.349266; Mon, 27 Sep 2021 07:42:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mUlH2-0004Fy-HR; Mon, 27 Sep 2021 07:42:04 +0000
Received: by outflank-mailman (input) for mailman id 196425;
 Mon, 27 Sep 2021 07:42:02 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=xtCR=OR=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mUlH0-0004Fs-4N
 for xen-devel@lists.xenproject.org; Mon, 27 Sep 2021 07:42:02 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.109.102])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 7e446ecd-ddaa-409c-8d02-c09fe806ff18;
 Mon, 27 Sep 2021 07:42:01 +0000 (UTC)
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04lp2051.outbound.protection.outlook.com [104.47.14.51]) (Using
 TLS) by relay.mimecast.com with ESMTP id de-mta-7-zSq9vyvgOH6xtsb7zHFtHA-1;
 Mon, 27 Sep 2021 09:41:58 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR0402MB3391.eurprd04.prod.outlook.com (2603:10a6:803:3::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.13; Mon, 27 Sep
 2021 07:41:56 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b%7]) with mapi id 15.20.4544.021; Mon, 27 Sep 2021
 07:41:56 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 PR3P193CA0004.EURP193.PROD.OUTLOOK.COM (2603:10a6:102:50::9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4544.13 via Frontend Transport; Mon, 27 Sep 2021 07:41:56 +0000
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
X-Inumbo-ID: 7e446ecd-ddaa-409c-8d02-c09fe806ff18
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1632728520;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=6o1igZ1aVG15XpHjc0F0Q2prJ99ZMsbv9St3Ick7HT4=;
	b=WCHM3M9sv1nIV7CDP0Qkq832E0CRDj296L/JGc2PkH96vGzuLlB5pP8NcpAWQEQ9teVH0A
	QFGis+pNnIUplkkqoUB1vaeX5/Jmi757fNnavWUriytvTSbC/DfvIB75ssTsph7Y6yU5hd
	G2UlDT8YFpZBHMGeiuSNHvp0Oq2Ccak=
X-MC-Unique: zSq9vyvgOH6xtsb7zHFtHA-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cYEqgQ7OklhOwI64W7r5OR/2PAVFQPNbKso26H42cT0A3MtGunw5DdA2IwbvNHihsVGGzLBPH3lFhYrj6Cl/xRvLt+8jDzd2GA7Ya1uwOt87yiqXaHBi8/GMphY7AKNykWCEYRQM8bLrSttgZ73PKzzc77lOFV0PZ3WzpYsSr970fwsFC6GNF7KpHfxOD9bnNxX6TdUp4zp0t8iSQJ6/cFMfu0FYj1wmeyI4vHtsYECggwBKtga39LK3Jbw7tK+bEFypAu7ET7wYafQS2rtWiYQHx4kV/MbK0tDf0muCUokDG/nP9ZQoydS6fiXdiy7RxswaaPqXpCMHqCV+AdsDxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=6o1igZ1aVG15XpHjc0F0Q2prJ99ZMsbv9St3Ick7HT4=;
 b=ki9aPtqVyFfg0IEKp7zgQEEBtCJD4YryW2zWM7Fbavp8DRW7mQ4EAbXr2PA7M83AQRBWEVtzDDQNRCDMPnsQ7fFAQl/V7kqPxPDodzVLjE9s9F1MAl1Po9yl0LWrbNIm1HJYSQh3TqUTQ22kMq/ig7QY1pGl4cje9FJQMeHuWgDtdgHY5u94a4JcTS/ElytTY5q7fnAGp8B7xv9dFR/k8nhxJEN6he7tu4bSryAcXlYiJXzXYdWtB2eGK9NV3p27SnO9XMYyD3aRUojHA5KbEMZeix2QCPS74hj7gUPEDFJIDPw8H9yG9RI7+jFeCVgSrGwT2SRcXlBi3seFBuFqkw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=suse.com;
Subject: Re: [PATCH v2 02/11] xen/arm: Add new device type for PCI
To: Oleksandr Andrushchenko <andr2000@gmail.com>
Cc: julien@xen.org, sstabellini@kernel.org, oleksandr_tyshchenko@epam.com,
 volodymyr_babchuk@epam.com, Artem_Mygaiev@epam.com, roger.pau@citrix.com,
 bertrand.marquis@arm.com, rahul.singh@arm.com,
 Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>,
 xen-devel@lists.xenproject.org
References: <20210923125438.234162-1-andr2000@gmail.com>
 <20210923125438.234162-3-andr2000@gmail.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <278da2e5-e55b-e36e-1210-d917bb5ede34@suse.com>
Date: Mon, 27 Sep 2021 09:41:57 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <20210923125438.234162-3-andr2000@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PR3P193CA0004.EURP193.PROD.OUTLOOK.COM
 (2603:10a6:102:50::9) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9260d593-6ffd-432d-4c74-08d9818a4826
X-MS-TrafficTypeDiagnostic: VI1PR0402MB3391:
X-Microsoft-Antispam-PRVS:
	<VI1PR0402MB339176932DA0744FFB077471B3A79@VI1PR0402MB3391.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6108;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	vQUmnpCz2SdKwxEfSyZGwu4XWMt5UxNn4RxZlfA8YXxWvmJE3/7/6Dn2g8ETrYzx1NGG+7MKcQ3SG361fV2y4JL98qgv+FRVCO7rb3gsACBsI+DS4N1KB5UKgt+uWjA1JBfroMJ8YOJnVC2pdEg9v0yD76DG3dgJRGg9Eo1wb2bQxgqMsJVP5+lV9XWl/3dCqvPS4udcaVHXVDgdTOoJXyXqB0KtlLH7SMtTUAL7IYXW63Ef/Oveso1ww6+lsJTJg7HnJWWzUF5dW963hzLwjfNngwmQbvI5+PRI5GZcUGhNyPMH+MLfeCxm6cKFkocghjgJNalDzq7jXcDddTGzFNJO2/d/woWvxUfRWsu7VX/XPubSyTW6LyESyLr7eBPARuC4C61YL+q+D4PM0TEHCtU8MsTyMra9AJUo37oFVbKB2aeOSCVF4JGtkgxIjHzEpS/uFsfMLmdQawfnJra8AqMcooYn0fA3O85+t3kf73KKNI43f+k4PtHCIhnsYPcEEvtUezfj5aOfFMMaXXZOZzxvQqLfBmJtWnE+CxKSPZ/R9mr3evO7r1/Q22h0Jl2yaPY+VviJyhRDCPin6dtzFf6s8bc6LFFFTKuhnbNRZiIIHVKBk3512lPmH8He54+aGaQxI2vQOxeQBaNEOxEd1PlpYMYCVBkhr+GoazPd91l0hrnjqh7LJqaWZ10ivfBsWSzMb/T8jvfjFX8ae+4+jPnY+Z9sdAI+SjZKeF3LB4U=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(16576012)(316002)(53546011)(2906002)(4744005)(8676002)(8936002)(31686004)(5660300002)(4326008)(26005)(186003)(2616005)(956004)(86362001)(31696002)(508600001)(66946007)(6916009)(66556008)(66476007)(7416002)(36756003)(38100700002)(6486002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?U01LQmU5eWlFTnBjSGFSOHN3SEZMK3ZlVDZsTjdvbHJmNy9sWnVReUlaN3Br?=
 =?utf-8?B?T0xMQUdmOFVFWWhpUDJvVEM3T3VzdEpNUEU2b0tCcW9UbnVUVmJUYW1lR1ov?=
 =?utf-8?B?cGp6aU5DQ0ZNUnR2MW92RFpOZ0FDMGxrUU5raWpxZEdIVHJ1R2dLTVg3blQr?=
 =?utf-8?B?dzVCYnhNVlRJQ09IOGpneFgwUndjZ1g1L0NnRGlCR2xMOWpsOFUyWG44ZlVo?=
 =?utf-8?B?NXRnZ1ozcFk5WE13Z2txeVZuQi9SNDRpVG5DUTRWamdGNWh0SjZuREo1QjR4?=
 =?utf-8?B?KzBtanNkNC8yaEJicE5DeHVUaHpUQVJHdDZJbVFkUERvK2ZqYmtXSVRnMUgy?=
 =?utf-8?B?cnEvZ0hMa2E0ajM0N2hwTTUyNkhva0xpVjA2ejd5aGJadG9wVFVCNk56RnUr?=
 =?utf-8?B?TlN2MXpxb2xUK3lmSXJVOUhnYlNENVdkVk5BU2RmaUV4dWtDck9zTGhNaUc4?=
 =?utf-8?B?Tkk2V05FVHVEMlRqYVZRWFNJOTc0T1IwYmYxV3VLbnRLaklMa1M3TFh0SW5i?=
 =?utf-8?B?OVUyQ2ZrL2dPWld4VVZ3MHBRMHlZNmY4YlVFNUhUS1k5S25FNVhDT283SHB3?=
 =?utf-8?B?WmlPaEdZaDFJRG1NQ0VlSEpBVFRhYjM5QzQzQUhMM0ZkNU02VU8rUnpwU245?=
 =?utf-8?B?K3NQTmNuT3UzRkpnTVlOZG1HSzByc0FjU0hCSzkvb21TYjhDWXFqWktQOUxY?=
 =?utf-8?B?L3pyS1N1VW9SUHRsQVpHbXJmRWZtNXhtRzg5TlhBcTRsdHl5blBSRTFLNGJD?=
 =?utf-8?B?Z3kxUzZNZ3RLbDZLZ0RjdXRUSDVpTEpBK0RTS1BXZjByamQ4bHRxSXk3cVNT?=
 =?utf-8?B?cmdGZjRGdVdKa0o5KzZ1c0JTeHUvbyt2QnRVZTd2b2xBMDBNcUoveXIyM3E3?=
 =?utf-8?B?bHNCRjFySFJKNVJMa09NckxTWmRHb3pyUy9ycDY0YklkVG5TUWhoZDZKTkpn?=
 =?utf-8?B?aHoxbHBVdk43R1dNRVpUUllmQ1VMM0trVmI1M21rU05OeHd1U3lmR0dEVTd0?=
 =?utf-8?B?TWg2cWdKcXg2T1pGVTZFMWtpdFBndS9oRWNFYjlJaFR5ZkVJS3N2ZlRDQlBI?=
 =?utf-8?B?YUNDRUdPc2k4cFZFK1RDYjFZaFE5U3JhZEYxR3VoSlFPVzVqWHA2QjNsSTFL?=
 =?utf-8?B?aEE5aVJDYno1Q0lwR1dkM2YwOU56R1dUOWdaYjZYeVVvaTVuYVQySFh0Y2JU?=
 =?utf-8?B?WUp6bVlRd091Slk1Q0NRWDdUMkF2dFJYdVJIMDZ5aDUrYXhNdFlkVUZXK3VK?=
 =?utf-8?B?MndnTStsOUZaRzlVK1crMlZocmQ2bmlSZEV1dWpIZW9iN050a3F1Q0hNM0lV?=
 =?utf-8?B?d0dvL2M1Z2FpL0ZjRjN5RTc5Tzc4b2pqaS9CUFJFanZFNTh0L2U2YUYrV0V1?=
 =?utf-8?B?aFJycVhXaWNmTTBWUFJiQ20rZTNmaG9La2ZPUk1SWi9TNU9mS2p6U2pJV2NP?=
 =?utf-8?B?QUtOMWp4WmlVdE5mcTB3WU14V2MzUHBjUHZrcnd0QUpMaE05aXBLcUdjamlP?=
 =?utf-8?B?c3hoNUVOalcrd0s1aXNCdUxhMk1Td0hsUFNGQUx6dzFrZ28zY2tXeEpiaFQ2?=
 =?utf-8?B?UjgxeEdlSlVlT092dkZXZEZuVms1WDJYUG9xcFlNRWNadDdtUlV1OVdlWTMy?=
 =?utf-8?B?NnlhcnJGS1FsTlFoOWNoVkFhV0huTW9sWDlJT2NjYnlHWWJnL0FIelh6bUZp?=
 =?utf-8?B?bTRtbTdzS1djNTFBb2hyR2FQbFJDTGowMkZ0M3hHUGU3YTFsaTVGWHBLZWp4?=
 =?utf-8?Q?3GMF6ss6LuOLuapqUEs7ya8uMYP7bPJHDd+U7fu?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9260d593-6ffd-432d-4c74-08d9818a4826
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Sep 2021 07:41:56.7234
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OKdp2mP5t0Cm3tcw4fkVvhvWPXiRCSmamlNos5qG+BzrEhPUG6Z4ijMG1JEQ2abN+S1s5MnOTcJUif2P6fSmGw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0402MB3391

On 23.09.2021 14:54, Oleksandr Andrushchenko wrote:
> --- a/xen/arch/arm/pci/pci.c
> +++ b/xen/arch/arm/pci/pci.c
> @@ -27,6 +27,16 @@ int arch_pci_clean_pirqs(struct domain *d)
>      return 0;
>  }
>  
> +struct pci_dev *dev_to_pci(struct device *dev)
> +{
> +    struct arch_pci_dev *arch_dev;
> +
> +    ASSERT(dev->type == DEV_PCI);
> +
> +    arch_dev = container_of((dev), struct arch_pci_dev, dev);

Nit: This not being a macro, the inner parentheses aren't needed.

> +    return container_of(arch_dev, struct pci_dev, arch);

Two successive container_of() on the same pointer look odd. Is
there a reason a single one wouldn't do?

    return container_of(dev, struct pci_dev, arch.dev);

Jan


