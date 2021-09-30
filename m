Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B7FE41D718
	for <lists+xen-devel@lfdr.de>; Thu, 30 Sep 2021 12:05:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.199702.353922 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mVsw1-0007Mg-OC; Thu, 30 Sep 2021 10:05:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 199702.353922; Thu, 30 Sep 2021 10:05:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mVsw1-0007Kp-LG; Thu, 30 Sep 2021 10:05:01 +0000
Received: by outflank-mailman (input) for mailman id 199702;
 Thu, 30 Sep 2021 10:05:00 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=lHSZ=OU=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mVsw0-0007Kj-En
 for xen-devel@lists.xenproject.org; Thu, 30 Sep 2021 10:05:00 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.111.102])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 2a30a6f4-99ea-410f-8841-f2324c449a9c;
 Thu, 30 Sep 2021 10:04:59 +0000 (UTC)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05lp2113.outbound.protection.outlook.com [104.47.17.113])
 (Using TLS) by relay.mimecast.com with ESMTP id
 de-mta-32-zTB6YbDsM2yxp_3Zqz9zFw-1; Thu, 30 Sep 2021 12:04:57 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR0402MB3535.eurprd04.prod.outlook.com (2603:10a6:803:11::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.21; Thu, 30 Sep
 2021 10:04:50 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b%7]) with mapi id 15.20.4566.014; Thu, 30 Sep 2021
 10:04:49 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AM6P194CA0086.EURP194.PROD.OUTLOOK.COM (2603:10a6:209:8f::27) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4566.15 via Frontend Transport; Thu, 30 Sep 2021 10:04:48 +0000
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
X-Inumbo-ID: 2a30a6f4-99ea-410f-8841-f2324c449a9c
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1632996298;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Z2azI78UXlA9qvJuwaLYSaRqihayGVHtBo94uTNyiMI=;
	b=ilZQ8iwNk2+MDdAb22LybO30qlatEDVnnvOdJo1LAOOUSmrzvROwKYqBWCjHmdTJBFvxIP
	9Ls26joPTcm8nCC3CEYYMdKfmLKqolzsddrxt3G2le7Kee7TbM+0Gb3vIgce/7l5v7KMq7
	bHCFBsk8TIg5C9yCmfphuHiJ1e/TW5w=
X-MC-Unique: zTB6YbDsM2yxp_3Zqz9zFw-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NSgOz4yMaUoKI6Cy4DOmYzno8X8mu7VUljZ7x8WeDY4VrI/sRoHnwKwd9DYu3bUM3RnsvhBlUvz3c3uz9VxSkbQJp6+M9FFE0KeALqhP98ypa4eiAvVDAgN78TQWcmHul3JyyFo6xFIgJu/YSUMJ4aZohzqhZs4z/y5cf2lDjyFGw4UwYwD4XHwjtjwSLyxqlaKim3rDxTrolgMCJYTkmIA1r7iuMrWZNhlPuP+IdyQZYlhxYXVw6Q9zxANVkyJH6IOTYJa1JYSHFWZFEWoM/WDatAa4Eq2/Rrgz2wYvbcPQN+WyZ2RmzXbEnxDxfbUnSyE/wb4+3in8yFGZDFz5PA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=Z2azI78UXlA9qvJuwaLYSaRqihayGVHtBo94uTNyiMI=;
 b=JDoxVNeVR7tyEYyt0AN0alSrAO50vM7l7C3QO0EG7dtjs2B4JINvNP7lKfytVDX8t5kp8gMD6goo+M7PqQU3NJ86AW3r8SfR5oBhutasihwG1UZgiZpuFZXKjYsXrbxO+x1ohe74LTIkiE6MA7dIQ4paVINALd3g0KH0yHrY2DpEBUOT+jlI/uoUzDWmYmltPaxhVAtIlcTgPGw1Ez3nTrF0biclkKc40ac8gQK3lWcAJOX2vWvgp81xDN0IvkPNWTeAbuYTQxhwCQ7lXEy6Hkkizc+JFehZlxD+XIiphb0mlxw0kzs3Rq60QH4Zqssl5dHNs/w4IgZxm7syCs+jmw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=suse.com;
Subject: Re: [PATCH] xen/arm: Expose the PMU to the guests
To: Michal Orzel <michal.orzel@arm.com>
Cc: Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony PERARD <anthony.perard@citrix.com>, Juergen Gross <jgross@suse.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, bertrand.marquis@arm.com,
 Julien Grall <jgrall@amazon.com>, xen-devel@lists.xenproject.org
References: <20210930092651.1350-1-michal.orzel@arm.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <1e37a54c-3937-4400-b126-31115da00df6@suse.com>
Date: Thu, 30 Sep 2021 12:04:47 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <20210930092651.1350-1-michal.orzel@arm.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM6P194CA0086.EURP194.PROD.OUTLOOK.COM
 (2603:10a6:209:8f::27) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4f7aaf7c-e690-476f-5553-08d983f9bd70
X-MS-TrafficTypeDiagnostic: VI1PR0402MB3535:
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS:
	<VI1PR0402MB3535ACE7EBD58503C89F32CBB3AA9@VI1PR0402MB3535.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2331;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	VXd86F34NWAsUlicjRYoBwMi7jBpKDYNHuFnO8OE/5sgwni4wev7eOzAFVHDD+nxPDD3cXQIRuhOKXb/qnR8WMRI5UAqifsNmlO/z+YDS8Ri1CNaVS2ZlzC3f2C46WM7tWGmDjc264E6gXivziLIXy6YSU3k5Xl1Mw+ESWVtQHlQ2Rg5KthzfJLcqkL2ko6iEHWwiTT4Lcklh44OeFscuMJDfvAWxLF6KzaIaIhIbTCWyn+T7ldSivfa4xZHxm3EcHgVV3DJR5gvWs/wy+eeJGhwR0lfmE0vFOriXR7G8Hk7k4w35oBYg37cubBgVu3sWPq+2I2Gvj4HdWkVnI8Zh5Rsb+zsJBZ+mHZHpNL8OcIWPqCWroKwYOIqN9+XqblbDPGRdNHDIY/3jHFxZ9VP+09WHF571R8BR4rjHvza254YJITK7TD1OzgqcvDfypKOthe1b0H8nxPIsRHhlkazEtoJkWPG8QqdQs7zOur9ENnDjxdrO2YKrC45bfv4mKlzh/b/8Xx5SodDDb3DfYD6RNisiq4V7flKV/uBGmrQL5kzyyPUZptf4YaBIrg2FEnbKJz8O2v2oYRoq4vDHetcXEjV3pT6CVJpc/HYBaqjJ4NYQMnWahlMMVlzeOeJs5ePbWbxMRMPQkRGYVFt7FtNITaIWcIRGf8vjdFHS/VWscnhDS+x1Zsg5rVgVQMxmOJ4mK9gUAP2RlxR1W7ClktB3Skudf5gagxic2jH3K97U1k=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(26005)(8676002)(508600001)(53546011)(66476007)(66946007)(6486002)(66556008)(4326008)(186003)(2906002)(38100700002)(31686004)(7416002)(54906003)(86362001)(36756003)(6916009)(8936002)(4744005)(956004)(31696002)(5660300002)(2616005)(16576012)(316002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	h16bUuVCCNbjhik8sIgWgEEwVLtLZv97oJ/wd75XpO/RHy/RVrmYUYFzMQMrEs1nA7XPoQIXigNI21UAyMW0qOhnVcgPmBIUjIPW5exSSlvgraGn6JTXJYstzoFmf+/Z13x8FqOdFe+BBYjiFXx4uQqnvg+3Ep0gppzIztcB7NL9oVvU9+uCFYqS7pxSsVFEzlqbdurM3P0yh44FalePT8IPAQyT/uMu/Hol7VCBy4CqWrIPCy0qXBojuGIXuTX8F1wxjTneAlw4otZh/oUuBvaCJkVzMmBlZ7yTrC0/aaNPh8yTeuiHSGdo/5RxIImmELMcGctatgMhhydik7rS9BmD07TDRfwTJAHa6Prb6eAwYWjTFIMGqjr6beDbZAImAVi6O2n+TS8DIsbpyK8645SsWE11GFom9iq/EdhhxftluHXKfRqpanF9VAzg4EESYPoI58ZuyXtPnT/nGYhPH4/B3szdZjn3n4SjY2MMVXBQQPWfHhQ2fSzrTZdQqcbLVtfTsPYqN7Ch0pTLdlglnDOUqBxrjhMYEaB2ecWnBCH0Mm8OBLqM2mAnFs95GfDQ/4RDjmNUskN7MqP1hJFZk2MMi5T2LiSbh3WWmaltucIB2pkQ66JkUn4fsUyg9oQKbAA0B6hnHKo1vrF7hr3VkeW+Agg+khlAEGPGiB0AeSo54RUg5TnTGHFlP1neh1YUxXaxChoBgZyqOI4tvvOTMbui9qSUWXpBQNadRSJuEA3H8IJmzb2iphlLm331kQPG
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4f7aaf7c-e690-476f-5553-08d983f9bd70
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Sep 2021 10:04:49.9016
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /eo6qeGfj7IPFAiWeqIybz6FDVcZEba7J1crAnoZPBbi+6dXispCY14fEzDfct8uF8ba0yi3Qenk6ZD3UNjVNg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0402MB3535

On 30.09.2021 11:26, Michal Orzel wrote:
> --- a/xen/common/domain.c
> +++ b/xen/common/domain.c
> @@ -483,7 +483,7 @@ static int sanitise_domain_config(struct xen_domctl_createdomain *config)
>           ~(XEN_DOMCTL_CDF_hvm | XEN_DOMCTL_CDF_hap |
>             XEN_DOMCTL_CDF_s3_integrity | XEN_DOMCTL_CDF_oos_off |
>             XEN_DOMCTL_CDF_xs_domain | XEN_DOMCTL_CDF_iommu |
> -           XEN_DOMCTL_CDF_nested_virt) )
> +           XEN_DOMCTL_CDF_nested_virt | XEN_DOMCTL_CDF_pmu) )

Alongside this I think you need to reject the flag in x86 code.

Jan


