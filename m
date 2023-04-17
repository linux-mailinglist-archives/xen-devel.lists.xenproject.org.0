Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A961B6E4360
	for <lists+xen-devel@lfdr.de>; Mon, 17 Apr 2023 11:15:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.521873.810847 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1poKxN-00085j-Ko; Mon, 17 Apr 2023 09:15:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 521873.810847; Mon, 17 Apr 2023 09:15:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1poKxN-000839-Hu; Mon, 17 Apr 2023 09:15:29 +0000
Received: by outflank-mailman (input) for mailman id 521873;
 Mon, 17 Apr 2023 09:15:28 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=S5Vl=AI=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1poKxM-0007Tk-HF
 for xen-devel@lists.xenproject.org; Mon, 17 Apr 2023 09:15:28 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on2060f.outbound.protection.outlook.com
 [2a01:111:f400:7d00::60f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6486f62f-dd00-11ed-b21e-6b7b168915f2;
 Mon, 17 Apr 2023 11:15:28 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DBBPR04MB7627.eurprd04.prod.outlook.com (2603:10a6:10:208::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6298.45; Mon, 17 Apr
 2023 09:15:25 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::52b2:f58:e19:56ae]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::52b2:f58:e19:56ae%2]) with mapi id 15.20.6298.045; Mon, 17 Apr 2023
 09:15:25 +0000
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
X-Inumbo-ID: 6486f62f-dd00-11ed-b21e-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gnjJmB3R4AAMYUiiu7B3CnLfvFtdogY01D0Qy2yXdlJ4FeIrftT9PH2Z0K/Q1k1eQcuSGKXiA8HItqJuI8OQOrV8al3RlkUixo89j+Ylaze0iJwDx4lzGbQnjQP7rm5QktuGoMIv15yxp/hOZwA8HbZLhw9Qw9eAjf9lhWM8Kx/dxQMIS8Jo7HnNd2iuJjIZ6PwTYJGe1A9KQQjjWw1FyRggVWClxT2FHilPzZmxbmBYjazCVQXPBPKtTixX3g1wbfuSPrGV9ItFgpt2UfqeBIdtQGnzDublHML3rBP+YRQ6lJmto89HHQ6poCSmxLW7nbxsihiOcXuTOgaK5AOtUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=p4de9NDZRmdkzw9W0oswOUd/6ehBsF9MdD78XRX5yJg=;
 b=eOu4YyOe46cJgj2yOjRfqOeIA0iWZktQW77Sviuan8yfH7zagSdpWpmgv5LMNMx8daKi6K8h9NEFB1P4Xi3zQItKCbys/Glh/1xoAIv8v7Q9oqiRNqeozIDYgKIBjTkWQnKT5y/D72wet+VJYvJcCym26pK4z7LtWOyKUA4SGpjnuirp+0y5zCS9D6knpea9vswo+0vFgmnKFtPZFLrmyw4RZWH6PTm3AnFQJ7wV1EP78auXBrQROfIKjqbTHhV4zyJBxEtVOblu2hX+FLPVWT4olP8sra5bNvaax4bwnEfwMAP6rgjasz6lDbSHiVPySnyQS8sh7Yp9xC2fGxnAIQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=p4de9NDZRmdkzw9W0oswOUd/6ehBsF9MdD78XRX5yJg=;
 b=T2x///tO09NUBOu2t+VlSL0DnSG6axvj2nnz3sOt8M0dfNqWCbk3K7kKtxyRcClkBqsqmpaZyjLgFEpx/Xbe5k6wA5xgQiiDTPq9aBce5BAwNP+NSX1WyToaobf3QnWVXRJlm9fIbeg9K4FO94MwVFJyqjk7FSQ2Uus3MJRTV/WGi0knGvcviqQz/mrOl3prMkzP/XkuLY9Ed7XVhqDKMReu/rS3Q7EUgBb6xIrFwFm7ygTg9nZtLGQgY6Ph8TRMa9x+lLSJhuOpYGqafi/MmQC3li9E4hd09VooSPSPhMXT51pdM1en5m9UXQmyS1QAgtXbH56KaadhCJL/JUCKCw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <b39f263b-1bc5-89fb-6377-f2a45722fde9@suse.com>
Date: Mon, 17 Apr 2023 11:15:23 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [XEN v5 05/10] xen/arm: Introduce choice to enable 64/32 bit
 physical addressing
Content-Language: en-US
To: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
Cc: sstabellini@kernel.org, stefano.stabellini@amd.com, julien@xen.org,
 Volodymyr_Babchuk@epam.com, bertrand.marquis@arm.com,
 andrew.cooper3@citrix.com, george.dunlap@citrix.com, wl@xen.org,
 rahul.singh@arm.com, xen-devel@lists.xenproject.org
References: <20230413173735.48387-1-ayan.kumar.halder@amd.com>
 <20230413173735.48387-6-ayan.kumar.halder@amd.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20230413173735.48387-6-ayan.kumar.halder@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0012.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1d::15) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|DBBPR04MB7627:EE_
X-MS-Office365-Filtering-Correlation-Id: 411a765f-1ad1-49a2-eb8b-08db3f24473c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	DmOPhrtV11Lzl6WZXlAYsaBqV9TrlvasLq06oTq5Du7Ps4FqTJDiDoRIcQYWH3wPtglb9F9N05aXueMRGLCgjwl5RrUHXWJNAXpRl0vLDx2LniQxiMEy1osrVAWZf9nGk2KypMEYNKGeOavufAIzDWPCQcOAyaNjcmMuoLbYIHEGdoiTh/2AP1QDFbwUrxg1gpqd/9FVakz0G+Dv2B3h+oENGac3LpBzrRLBKuxRCiesiQ2mY4YTqxlaIHWm6hDYm0Be+4yEHEUYFpa+uGMRIVi6g0zum66/wews07H7TdRblUR+Bzm3oQDYZopq9lRKERdS0Xm1KJ28623zjiHhTaeLHAKcDL72cFD+bHn+eIwpMA8hpWUL0FyS6D6/oxOcLwXzgvch2DyTAY7g7UUwQl/FthMOYqyTvUhHNyQFL7cPUd4gNw461eJqaKvUr/EBEmi4vBoT47GA06m6IyHdWnAPsPAAZJyxEePQ5TUXHHA5Vo4qWlbi4R/Wc+xCY8dU/XdskZbo+q7dW5m1Lvitf/PLc1SVUq5JRpcvXBPYfRX6OV0gC6+wvE+mqJD8cs1jjqIncQJPFjQt83ThAGfTwDnIP81xVNdRFhA8CTTiyFKxpmAyqxnypjt91EkhQjW3uzPsmoXqg7YiGbY4Mre3Hg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(396003)(136003)(346002)(376002)(39860400002)(366004)(451199021)(7416002)(5660300002)(2616005)(86362001)(31696002)(53546011)(186003)(26005)(6506007)(6512007)(38100700002)(8676002)(8936002)(478600001)(6486002)(316002)(41300700001)(36756003)(66476007)(66556008)(4326008)(6916009)(66946007)(31686004)(2906002)(4744005)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZWo1dzYzZjcxaXc4NmdrV3cxbWh6ckNqQjN0T1cwN3NWNGlOd3pNVXhlQ1ZH?=
 =?utf-8?B?TlRFb3RkZGpSd2EwanNwMTdLU3I1eWQxTU0zNDFpV2kwTDRYREUvczZydCtO?=
 =?utf-8?B?MkxjQmFtNWN4d3NHMWV5NEhLME13VUdJM2xZVzhXZmdWc0pSU01senQ0U1c3?=
 =?utf-8?B?MGNpV0ZXemNiTHlXUlpORXVmdTh2Uk92ZzUySXAvYktTREp0WXRSQlFmZy9N?=
 =?utf-8?B?M2tETzA4VEQ3UXliQUttMEJhR04wRlQxdDRsRDRFWXkvYUFuN1lnWk5sR2tG?=
 =?utf-8?B?Y081UTN1aURRL2hZQTc3T2MxZ2Q2M2RDaUlNZVFQSUJwZzE3QitaYUdzK1Bt?=
 =?utf-8?B?TjdKQTliMFp4QXl4ajZ6VVU4MnFlbURKSkhOMzEwR1Ivdys2TGR0eklWZEhj?=
 =?utf-8?B?Mkg4a2I5TnhPSWxTTVA5c0ZwdVJJbEdaUGJneWd2YlpJZUd1V2pmNXdvYndy?=
 =?utf-8?B?RmpWZGlITTJZQzFxRUN4OCtMSWVWalR5VFFrYXJGVk5VSDRhaXZWR010WEZF?=
 =?utf-8?B?Wk9Ma1FrQ0xXRVZ6azJTR2dwdW55d3kydlA3S3czZVllb0plek5YbkEvbEdQ?=
 =?utf-8?B?QVorSDNlR0lYYjlCUTdSNWpCbVNUN1lxdXhUditBVW5NcmpXRTg4MWt1V3dq?=
 =?utf-8?B?VlJ4RU03MitySHAwUlBWVW5aKy91aGNiZ2lIQjk4VkhyUHlnTndMc0tPUDVv?=
 =?utf-8?B?MG1wN1pucUVOMDZPUnR0T2lldDVyUWViV3F5UGVOVDFWSFVwamtmb2ZUalY3?=
 =?utf-8?B?ejV0cEVLRXZ1ZGt5bmhjcjdWbW10Wmg4VmdVWTkyaGk5RjZSTFRqL1dSUUxL?=
 =?utf-8?B?dkxpbEpXdzJjSkxzdUFoa0o2c1NuUk50UE1hYjREZEE5cm1OV29sUTFqaEEv?=
 =?utf-8?B?eWZzMEFDSVJnZjhwT2VsUURuaFU2bkFwQVRNWmVoUFVxVjFNYm5GUzIwZTB1?=
 =?utf-8?B?UHJKay9aeU5tOEF0QUxqOEVnei9aM1c5cStnekhWQ2ZhS0dDeTBtZjB3UThN?=
 =?utf-8?B?ZDlqdUZYUk0xRlVHVnhWUmpnYzhTcXdFMzA3cExjYUtTQUM4QmxBamFnRDVh?=
 =?utf-8?B?Ymt3Uk9CS01zaGtFRzV1ZFFhQVRDbWMrZTA3TWJsRmxROUpKNU94Ym9HSmxk?=
 =?utf-8?B?ekJwbGhLaWE1eDhJLzhjdWZqVk9OKzhVOUo2d2FOZnJnaWFUS1p2bmRKRWVC?=
 =?utf-8?B?VEsrUHVac0pKOUErdTlvd2t6REErSEcvV3EvRXFXWUZjbS9Lc2xOK2VFK0d4?=
 =?utf-8?B?TCtjU09DbVIxZFpKV2ZVT0ViMW5ibGhJRWJzNWRpblhOVHM5dDkrUWpUTlB1?=
 =?utf-8?B?L3pJN3h2K2pua1RrbWV2RDA0QmNNSVArZU01VFhUTm1XQkNtTlNzWWhJaERO?=
 =?utf-8?B?cXY3MVJsU0M4a1VYeDNtNVVxQUJMV1l6eWFIcjlaWnNzNUF3bGZZWTdjUUVa?=
 =?utf-8?B?dC9sUlRLVzUvZUFtdk03THFsS2hiUnFTRG83QVZpdWtnVzNHZWtqcEJiNlR5?=
 =?utf-8?B?SkxISXJFeFlZL28xVTk4NlBvVTFhdVFNL2FLM0RSWlBRUStRcWNEU3hyUHFU?=
 =?utf-8?B?dXFwYUZxQ1dmRENjTVE3aDlaMEozVXhIWHpJN1hvSzdFWDJCNHVHT3pTNVdk?=
 =?utf-8?B?eVRHYjdjK3Y0Q0lsTVZ5S01TQTgzWkw2Y2lQN05INzhzdmNrUFQyVUxRVVBR?=
 =?utf-8?B?SlpsYVdaMmtvQUpKYm4yN3RyR1ZPZU5IRTJuOVo1aElrNmwvUVB0dTZFMTVD?=
 =?utf-8?B?QTdGUG51aDZDdjhXU3hQS3pCZWRCclcvQzhDSHFPSEJXdWk1U3UzMENVL3dZ?=
 =?utf-8?B?UHhaVkxoUGNFaXoyVUJnNE16QitRNGhlWnNxeHlvOFl6UStkR3NGZlNPdW9M?=
 =?utf-8?B?Nzd0VmtaUEhOcml4VmZabThOQjltL0UvbitGR1RBL3ZtVGkwcXVvdzdna29t?=
 =?utf-8?B?SlpSb0pHUUpVTVkxOG9CYUhTQmhNbDlTS2FJMkROaklLTU5Sc1Bsa0NZTHNG?=
 =?utf-8?B?Wm9mNDNleDIzdlRwTXNwZm5wdmRaSzdwRVRCVE4raW5IdWgySHNMWVNzYm1O?=
 =?utf-8?B?dm1RaE5tS2NCcUhKSE1TeEZPZmRDYWhXemQ4TFdhMFh1NUwyamFXV3F5UCtI?=
 =?utf-8?Q?WL6VP3dgpZMUt2iNbuh/YxMVt?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 411a765f-1ad1-49a2-eb8b-08db3f24473c
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Apr 2023 09:15:25.1286
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SUoRQKB2imTyclaf8A05YH0fIgtV3JpU5yu2FieMpmLzgWA5ustSGal2mgsQlyGwOorcroJFbzq+6yox3XmhIQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB7627

On 13.04.2023 19:37, Ayan Kumar Halder wrote:
> --- a/xen/arch/arm/Kconfig
> +++ b/xen/arch/arm/Kconfig
> @@ -19,13 +19,46 @@ config ARM
>  	select HAS_PMAP
>  	select IOMMU_FORCE_PT_SHARE
>  
> +menu "Architecture Features"
> +
> +choice
> +	prompt "Physical address space size" if ARM_32
> +	default ARM_PA_BITS_48 if ARM_64
> +	default ARM_PA_BITS_40 if ARM_32
> +	help
> +	  User can choose to represent the width of physical address. This can
> +	  sometimes help in optimizing the size of image when user chooses a
> +	  smaller size to represent physical address.
> +
> +config ARM_PA_BITS_32
> +	bool "32-bit"
> +	help
> +	  On platforms where any physical address can be represented within 32 bits,
> +	  user should choose this option. This will help is reduced size of the
> +	  binary.
> +	select PHYS_ADDR_T_32
> +	depends on ARM_32

May I suggest that "help" come generally last, and preferably "depends on"
before "select"?

Jan

