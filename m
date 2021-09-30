Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D8A0541DCE2
	for <lists+xen-devel@lfdr.de>; Thu, 30 Sep 2021 17:00:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.200034.354409 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mVxXn-0005ge-Sq; Thu, 30 Sep 2021 15:00:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 200034.354409; Thu, 30 Sep 2021 15:00:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mVxXn-0005ei-Pp; Thu, 30 Sep 2021 15:00:19 +0000
Received: by outflank-mailman (input) for mailman id 200034;
 Thu, 30 Sep 2021 15:00:17 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=lHSZ=OU=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mVxXl-0005ec-Pe
 for xen-devel@lists.xenproject.org; Thu, 30 Sep 2021 15:00:17 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.111.102])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 1edfcf3e-21ff-11ec-bd52-12813bfff9fa;
 Thu, 30 Sep 2021 15:00:16 +0000 (UTC)
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur01lp2055.outbound.protection.outlook.com [104.47.0.55]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-36-t-qMvoq3PmGQuy9JxWWLKw-1; Thu, 30 Sep 2021 17:00:14 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR0402MB3535.eurprd04.prod.outlook.com (2603:10a6:803:11::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.21; Thu, 30 Sep
 2021 15:00:11 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b%7]) with mapi id 15.20.4566.014; Thu, 30 Sep 2021
 15:00:11 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AS8P250CA0020.EURP250.PROD.OUTLOOK.COM (2603:10a6:20b:330::25) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4566.15 via Frontend Transport; Thu, 30 Sep 2021 15:00:10 +0000
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
X-Inumbo-ID: 1edfcf3e-21ff-11ec-bd52-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1633014015;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Daebu7f1lPHNMtBuyqaM6U+dABWfR56uw/7u819YTzI=;
	b=Vg4FpHZMN2lSWOzviGpNB4FB51bxu8afVV+K3zwvWLVugT33jhox2B9XqoBKFo8j6aqtRA
	7o/YkhDMh35SE3A1dbVcl150qYnnv8sthkx+kYIoN2NMFYXPTslkaXZcPUZ0dNAFdghi94
	Z1j9gV27gZ3b/OTYzbW6VkCi8B2UVw8=
X-MC-Unique: t-qMvoq3PmGQuy9JxWWLKw-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Q1C191YB2oUUzayy8aN88Ww275t/hl+vldKdITU0K3+8q8fYaNql6Rb5/u5MZALZg7qvSO8hJpfYmPoHzirj/yYhP61ntJf/z6bU0/LAi9xUXAaRQpUipKr3ioCxraUkDsvB18QNftkkB1cGkAFJosY+F+2IagPIoLs47dKfN6mvwNKSpqtezXoB6NTLfnz6yzU/HasGwLgT7ffHQf0+ZQkyeySaDDEHPpofsmZOyptKx87HOnl1469RlYeAmQabWL7D36XLPiejWfmtv9tRUISq7OwQAQoq+aScrIp008xfmVXdLX4MQhVnDMiR0+Ywo+Qg5Jrs1i0l1QMHp2Lizw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=Daebu7f1lPHNMtBuyqaM6U+dABWfR56uw/7u819YTzI=;
 b=XVh2xZLiGYAr7pttPJXQ01ASAHzHMsKi2qngs8yxQ84ZKLBV40DEHm76xTR2XoyolJEegiSMxkjlOzok+JZwl8oAMBiu1k7X1QxLyxzgc7SoeRiO4Pil/UrVMXCeG2WNC34KIODe5+qA459BYcq54lPcVCR3B926cE3/mWC6Z9ws1nlcjQxmn3Zz+/K/AGIY+QxaIKJWu7FptJoDAYLgzvM02OGJAywsQDH+0FuI3oiBcaftp6ZyvZ+wY/WScxgvQGAg+ZWQWCOdXK7oAiXZmwgpLAiV6Zq81wrFE5CdsEyMwFFGgdmv2S7s7XYeNxTQrrl8Rx9MhbzL9CVg+e/Ffg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=suse.com;
Subject: Re: [PATCH v3 10/17] xen/arm: Add cmdline boot option
 "pci-passthrough = <boolean>"
To: Rahul Singh <rahul.singh@arm.com>
Cc: bertrand.marquis@arm.com, Andre.Przywara@arm.com,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <cover.1632847120.git.rahul.singh@arm.com>
 <edd6689cc977292fa874059861474993e5819c14.1632847120.git.rahul.singh@arm.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <8b9dc108-c20a-bce3-42cf-18a44e369776@suse.com>
Date: Thu, 30 Sep 2021 17:00:08 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <edd6689cc977292fa874059861474993e5819c14.1632847120.git.rahul.singh@arm.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS8P250CA0020.EURP250.PROD.OUTLOOK.COM
 (2603:10a6:20b:330::25) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 13af75ac-ed47-43e9-57d6-08d984230031
X-MS-TrafficTypeDiagnostic: VI1PR0402MB3535:
X-Microsoft-Antispam-PRVS:
	<VI1PR0402MB3535B0ED91584D25B3245D93B3AA9@VI1PR0402MB3535.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6430;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	KaOm52H7PHdPm9uELuix4Xbajge9Fk8fNAT/CLGiv4G3IypSAHJ/d4BaDP5vsk1hL91Xn30bdEIuLkwhpdcc2Od1TDwyNWzJXKe7o9vDaPEnfwP1yNJZivvJsMllmbaE/MXzfZvgP+/WG9E8jL7epnfBKDYhF4qGrIyqHydHHaLuqJSe2GLtSmFsmpaOTR2C3IpkHBUUmRbgGImO6uo1qTfs97eh1J3KJyqRFhCkp3OfWqeeaQZRZe9cXRnoGrHlXOSFeZcGCperbsXCu3m0D4+SsFDzyhKqF/MXljW3jcFy4s1PJ6qufNKshrIamGZ+Q+eq/pVnw335G+SXW/pKpiVwRuk2Z43sJTdERbatClQY2FXJ5hfnno7nlBxcmHlh/ppo/i/0H5SIgg9KodcLLE/xOlRDUlHyRJlTLjfqI1Vd9X5B8uZBFXCrIbe8d9PYY1f010qoMXeOh75dFXp4C3aoCJ1wM3nPVW/AtonMr7kQJ4zCN3zduNdFP/hD/pgENh1ABtIXC5EIQPtWlUfVzDh5jfs8UeWG19GRT6juBnfGFPjJlrWlLaPwRPprlpRt1bVndGVrkphE/BZVJhgNGZxtxJu+qs2cH7lyqhHPNLQKTdPJQqwCs2zYO4YenWAlzwz/3SVbBgXo2zKFdO6kgTP0IAjHKIPQQLBaPvJRZLtbjup9cpMeZ0kc4wWmb/8smfyMb0l56VawIkA3UEnej/ApZUhUOohQHDSk/elC5Mxh6W6tglNTmi9ZhsNF+SSp
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(83380400001)(26005)(8676002)(66476007)(66946007)(6486002)(66556008)(4326008)(186003)(508600001)(53546011)(6916009)(2906002)(16576012)(31686004)(7416002)(54906003)(86362001)(36756003)(8936002)(38100700002)(31696002)(5660300002)(2616005)(316002)(956004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?YkJzS1EwbEF5a0FpL3YxTlIwQ1kvL2xvODNIWVRYanA4Q0NlLy9RK0UvWjFU?=
 =?utf-8?B?emJNYnc5azZ4bmtZVmRtd0FHZGVSa1VtVkYxRjdPVGVQTGJqVGtFRlQ3ZE92?=
 =?utf-8?B?TjNkWTVGZStOcWZiYzB6UzFhUW5jNnpMbE82Z0doMmNhc0NTeGpUNjZKZHFD?=
 =?utf-8?B?MHdScElEdjJvZGwrZGM4cVd0dHNub3U3bXFiM0dvSEZMbWZySVREMXd6bTdD?=
 =?utf-8?B?Nzg5MXB5alpENGpDcnRuVUkrdDhPWUF5ZHBCYUFqU0JKaUd5OFkybkdETHRM?=
 =?utf-8?B?ZTY1YiswaHVRa0lIUEFHNU9IZDh1SFBNVG5QdEdvVmlweTVSMmlST1BjV25D?=
 =?utf-8?B?b1lJZjRkSzhSOHZmaGYrelhJS1Jvb1JvalJMMmdhRktwOVBnOWZ3N3JDZDl3?=
 =?utf-8?B?WWhLUlpqclNBMTlQSnRCSC9kOFFMcmluaHdmcnkvU0gwbnlTR0kyaGRpNi9Y?=
 =?utf-8?B?L0hQSnIxK1kzdDlBU2VrVFNYNW1GWTZDbDFORWJMUTFTNmhodm5oMnE3YTgw?=
 =?utf-8?B?VER6Q1prK21MMmhSSndDZ0UyWS92UFRDam5ZZVM0T0NrNk5aa1dyK2JRR1Ni?=
 =?utf-8?B?VDJId2N5SDg0eUFaejNGK1Yvc0tuUTBQVGlMUTRTRkNydkVOQmFLT0JyY1ZB?=
 =?utf-8?B?b0JVWU1XVHVCN1R6MDU1d2ZVVEJhOTRrV0R0MWNZUmRHakJvRzJqb2dWUFMr?=
 =?utf-8?B?b2xCSnFVN0dEdGQ2aUF0Q2hSSllzOXh3RGhnd2hhN3Y3MWZEUXhpUHR1U0xw?=
 =?utf-8?B?eXpYSFhFNGZXbWFpbnFvczRjdWVwRHJrcXMwTkxOaVRJSXNkU01qRUNLdUxL?=
 =?utf-8?B?ejVvM3c3MUN3aytVU2hPdE5EajJLRnYrTlVUZVpNcDV5SElyUytkN0U5VEp0?=
 =?utf-8?B?eGhOMVo1bW90Y1N6UkVVTHpoTEQvT0JUSmtwZGlxZWwySUJrL1pxay85YWE2?=
 =?utf-8?B?d051QmE2TC9XTHR5WkhIMzRld09nSE1XQVBOK25WY1ZQVmExdlA0S3cwN3F5?=
 =?utf-8?B?SHBWVndMMVFTa2dLN1hXUmwxRDM5bmN6SHFhZTNLb3RnNTFDVE1XUUp2QjZH?=
 =?utf-8?B?d1dYMTc4VHRmUEJjVHF5SnYxMDJPWUNMMnpXU1FiUzkwNW5LNFNjWUtzTUx6?=
 =?utf-8?B?ZVhqdEQza2JVLzJGSUhjaUlFUlNQUGs3YzFMSWdDU1M4L3AyT2dSSHZiUXJB?=
 =?utf-8?B?eUtVczVSczBXUVVsMGZMNjRMMkY0Qzh0a014ZDM1V2pGZHJ1L1F5dmtvQmg2?=
 =?utf-8?B?cVkzTi9XWGI4MmNrZFhreWIwMW16VTZSN2Y0K2hUTjFMak1NaTBIVjE0WjRZ?=
 =?utf-8?B?c1d3M2hxUWIxVGhSeVFaR3c3MVRGL2FPd2VuWkNYaGZ0TU9NZTM2d3hZc3Uw?=
 =?utf-8?B?aDE2TzVQUDR4WUFGR2ZPSi9jQUUrZW1GbDYrSHk1S3JsdlRHbGRYajk5MmNQ?=
 =?utf-8?B?NS8wT3lYWWx5dlY1NVFpWVFqQTM5ZFJPeDJlYzdMcW1nMmFJWkpGaEp1eFBh?=
 =?utf-8?B?QVFnRHgyZkhlcElDWk5ndm1KVDFtbEhoRjFqNiszVXFIZE9BQ1gybEZLS2Fq?=
 =?utf-8?B?Qm9OWXZSMzhBNTJqbXd4djBGZGVUSkZMMjlZTmZpOURaejNCWnVUeGViTTFW?=
 =?utf-8?B?cWVDbHdKdHhrWTJocmdVYW9xYTlWSzlNeENKNmpNSVcvSUExVk5VbEZkell6?=
 =?utf-8?B?RGpjN0hPNk91SnFQQW5CbXlyTEh1dE8yZFQ2c0xrMHd4Q1pUNnViTjZCaDRz?=
 =?utf-8?Q?W7J1u9t0v/a01QT6PCXHArzISJbOBmoTdlAPwxr?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 13af75ac-ed47-43e9-57d6-08d984230031
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Sep 2021 15:00:11.2520
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JY85OKEw7xxOAGDyrMwihQNG1TiVMbFSG0V/ZyLs/gHsLH0oZyMbY4oWmIADTE/QUNYvEh0JMAcISkA8ruYlDA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0402MB3535

On 28.09.2021 20:18, Rahul Singh wrote:
> @@ -62,8 +63,21 @@ static int __init acpi_pci_init(void)
>  }
>  #endif
>  
> +/*
> + * By default pci passthrough is disabled
> + */

Nit: This is a single line comment.

> +bool __read_mostly pci_passthrough_enabled = false;

Nit: Unnecessary initializer.

> --- a/xen/common/physdev.c
> +++ b/xen/common/physdev.c
> @@ -19,6 +19,9 @@ ret_t do_physdev_op(int cmd, XEN_GUEST_HANDLE_PARAM(void) arg)
>          struct pci_dev_info pdev_info;
>          nodeid_t node;
>  
> +        if ( !is_pci_passthrough_enabled() )
> +            return -ENOSYS;

Here and ...

> @@ -54,6 +57,9 @@ ret_t do_physdev_op(int cmd, XEN_GUEST_HANDLE_PARAM(void) arg)
>      case PHYSDEVOP_pci_device_remove: {
>          struct physdev_pci_device dev;
>  
> +        if ( !is_pci_passthrough_enabled() )
> +            return -ENOSYS;

... here -EOPNOTSUPP (or any other suitable value, which -ENOSYS is not
from all I can tell) please.

> --- a/xen/include/asm-x86/pci.h
> +++ b/xen/include/asm-x86/pci.h
> @@ -32,4 +32,12 @@ bool_t pci_ro_mmcfg_decode(unsigned long mfn, unsigned int *seg,
>  extern int pci_mmcfg_config_num;
>  extern struct acpi_mcfg_allocation *pci_mmcfg_config;
>  
> +/*
> + * Unlike ARM, PCI passthrough is always enabled for x86.
> + */

Nit: This again is a single line comment.

Jan


