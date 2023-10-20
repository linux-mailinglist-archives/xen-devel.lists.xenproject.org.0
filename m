Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FD767D0A5D
	for <lists+xen-devel@lfdr.de>; Fri, 20 Oct 2023 10:16:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.619695.965201 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qtkez-0005kS-8R; Fri, 20 Oct 2023 08:15:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 619695.965201; Fri, 20 Oct 2023 08:15:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qtkez-0005hW-4a; Fri, 20 Oct 2023 08:15:09 +0000
Received: by outflank-mailman (input) for mailman id 619695;
 Fri, 20 Oct 2023 08:15:07 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=8lwx=GC=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qtkex-0005hQ-JO
 for xen-devel@lists.xenproject.org; Fri, 20 Oct 2023 08:15:07 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on2061a.outbound.protection.outlook.com
 [2a01:111:f400:7d00::61a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c5dee71b-6f20-11ee-9b0e-b553b5be7939;
 Fri, 20 Oct 2023 10:15:04 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by AM0PR04MB7172.eurprd04.prod.outlook.com (2603:10a6:208:192::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6933.9; Fri, 20 Oct
 2023 08:15:02 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::d9c0:d907:4d2d:15b3]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::d9c0:d907:4d2d:15b3%7]) with mapi id 15.20.6907.022; Fri, 20 Oct 2023
 08:15:02 +0000
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
X-Inumbo-ID: c5dee71b-6f20-11ee-9b0e-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YnXZkcWF7dxyHHu/A1NIIZZatPMFMqm5letch04W4b3LD5OO1kk74sYZ1Zng6ZcnFQItnqjDs8ZOm+1G+LixDaMZ4A4WpU9xQo6A6Hs9blij4H+HAvIsjHzo6tSI2wACh6bmJwosTpVItqW3NDWRgAKV0QoVqkOkgdj2MJ+/UgnG07n6Tx0A6A59waFby1syqOEMnj13amIQr/qrLxBeR0hNh6xT+vMgj8FYA8CPFSBI/rLP6v0UsLZOY4tj+Olxy0xZiDC0yyrTK7xzW5+6iWMfFgzG27qNbqxHkcRSzcQ7IGIElOmUNTR4xrSMckPkvEEIugBNuJRR4BYhqHkxgA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=g7e6faYY5qsFFYwPchkqZU8nY2l000lqM7mdgCaXUcw=;
 b=PXEiLSVVphThqADxDGshLbYIzqKdPAJ1dm2Qwc8oNRMzjuhOmdUHXPfYRPBwOo7K8erXUz2q4O0BObwi4DACagDfQCtMm5xTANIgjP+aolcHy0MeUYznxApkNs9j3yBDcek7Mmaj69d/qoUk2koODbakKz6i3ExSktfOV7tdI0wFm96ntHVDdOLfEKKnfy4onPrjuXombO+CEZQe4EdtpUByqJbQ0EYMVCinl3b2ih6KBZB1VcVPeJbftf2+bqCvZy+9dRZwS6Yn8CotVn7x8wNR6fRCI2tG5zOPt6rFwXEr3xlts82mtSistXjtVbIcqRXVutmYN6o5/dOfM0oGQg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=g7e6faYY5qsFFYwPchkqZU8nY2l000lqM7mdgCaXUcw=;
 b=WWliqg9ZxGlMMGFqXAOiRIkpJA6JU7Pn1EHwH2flZgIRmRhLc7NERZe3vjEu3IC5zXlbam+n6psaD3lKA+arL9H1cD1qSBsCe4F/c7W8FR5v7GVt0pCPV7rRRYs4FQ2HU8hZ2yiUCBWESirno01h2wjPQhSbHfeUjX3/KcqSYIPU5+4PLV5h+ATT6+5Vilf6WzeuoreGB8FkWKxWXzrBc+ftmkiQIVgnxqrlNcnjTMYUj4eDvhkHZwTUbCywuZNQDjusAghEVmo4asJ8w/QJbK0Tr9A/FhpYkQzxkVEms5fhYAZf3TJzjuZETAASPOU64V9dxLKQbS6WbXHYCp9HMQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <d53d59d6-1d00-fefa-cbbb-0d2730e96d41@suse.com>
Date: Fri, 20 Oct 2023 10:14:59 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [XEN PATCH][for-4.19 v3 1/8] xen: add declarations for variables
 where needed
Content-Language: en-US
To: Nicola Vetrini <nicola.vetrini@bugseng.com>
Cc: sstabellini@kernel.org, michal.orzel@amd.com, xenia.ragiadakou@amd.com,
 ayan.kumar.halder@amd.com, consulting@bugseng.com,
 andrew.cooper3@citrix.com, roger.pau@citrix.com,
 Julien Grall <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <cover.1697722648.git.nicola.vetrini@bugseng.com>
 <4d419cbffc84e0f9934794d105705ac64094a54a.1697722648.git.nicola.vetrini@bugseng.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <4d419cbffc84e0f9934794d105705ac64094a54a.1697722648.git.nicola.vetrini@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0085.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1e::9) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|AM0PR04MB7172:EE_
X-MS-Office365-Filtering-Correlation-Id: 0807de1d-d0a4-458f-76e7-08dbd144a8f3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	NB8SyHykl8+8DYcOPZlFBH+6UCaZyt03rrDdeXUpLPkt07baYdB/71CJaP55LHxzFXdfGAc141qYvX53k+XVEX0dXgjTif1XLNKONy1cDwn5WXWcJ92RmJAisjMq+11mLasBUCPdk4UrjASystndrwldltb0/XR42i7tgbKFdZHqhgDy/RvMZ/ejTD87UK+8TRzckq8iF8Z3ffk2mvh5bZk3oa+TtGbm40Q+CuernnsfcW9I2LwGdTqQnbqpmjBfZ7fArz/fnghMLrLiQTYAwQQT2rsqg8yi/O1buiTHUPnyGQfcRM96ypsrY0CAgc6eEvTX/tzwQ/vf6/gZk5hyuvnBfm2P2E4QdZvlwS9cx0FlnVVJvM543e2azvkpoJF8KBf3+Z/jdVrdfMzdsrJkCCupNCFpvN9pi/lbfgDz2RVHnpTKDdXRllKVMMXEWxe084MbzxxIwyQqYJHXl/HpF2WVSNVFfYbsL3nL8789qrV03k8zwf1fY4AXTK8PXPhWg1ZHgMZ0DvkfPdoLh68M2I+VPK2jGYIDcxJUjmAl1TkMVeRMQpnYYwYWTosFRRxBLPgwPpFm1UvEoXa6hxTnrKR2HWWyJ3q21VUQB5xfUeq1rrHlmftbrkgYITNdlPbxh3AWnkdV3m2Yj4uYbYcBTQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(376002)(396003)(366004)(346002)(39860400002)(230922051799003)(451199024)(64100799003)(1800799009)(186009)(6916009)(4744005)(2906002)(6506007)(53546011)(6512007)(2616005)(54906003)(31696002)(478600001)(6486002)(86362001)(66946007)(66556008)(26005)(316002)(38100700002)(7416002)(41300700001)(66476007)(8676002)(4326008)(5660300002)(36756003)(8936002)(6666004)(31686004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?QzZKeFpGMmxWbFRvRTBPNC9EYlJ1NmNMSnZ4ZkFLTlpGbUlIVkMzL05JVGRw?=
 =?utf-8?B?blR1TitBNVFpVzI5NU5DdVB0RGU1N2JNcVUxWGFlVTluVTlwUitDeFNmM3Y5?=
 =?utf-8?B?WFExUHhuSUppbU9aQTlwOWNsMmFaUXVYdGNpaTB2WVpaWTBFS250WlF0MUw0?=
 =?utf-8?B?THlYVUxjMzYyeHRrdWpNbnBodkp1Z1J1VTRTVkdabXN3U3krblNybUxnSXBR?=
 =?utf-8?B?Q0h5azI2SCthSGlDeDVkZ0VRYzF4eDYzNEs1c2t0d1drNlJBMXpVeEgxNzh6?=
 =?utf-8?B?SVFJYXVtZnhkay93ODB1aWxrRURVNTZYd2RjRkVaVXo1eWJYeGhGdTRxTGxI?=
 =?utf-8?B?Q09Wc1gvL2xLQTF6SnJrT2Y5dldDS3NtL3dwWkx3QytmZmdWeVNEQ1Z2USsx?=
 =?utf-8?B?UkpWbDJ5R2dQSS9WZEp0emFSOUxPNUVkSFNqUTB2cFZVUkM4Mk41SldnYStS?=
 =?utf-8?B?bTY4MG0zSWxIYjNIQ3JFTEd5R1FBeU9Cb0VPaVU4NXdxRldLdEdkNm1JZ095?=
 =?utf-8?B?TGNVcndKTzgvTkRra0JlQ0tCRHdiZENTNUdyTWZ1eWZyU0c1WkViRXNBVVNJ?=
 =?utf-8?B?OUduUVBNN2toUkVlMTM4NER6MUhmZStPU1BFbW9wMjhOTWdZRjhVMlNDb3VD?=
 =?utf-8?B?N0xhZkFJQ2x3Snc5b3ljUDV4aWs4aVlNMXVnb2VHbW00cWNJVmEwa01rbm9E?=
 =?utf-8?B?bWZFc1g0ZW5KQ1ZtVDdJbytjWmI4ckh3WkNpN25IczV1K1YyUG1RV1FjMWdl?=
 =?utf-8?B?YTV3V1BTcTBVWXJEMFMrdVZWY0lTNjdUQ0ZSRFZIYWRyNkE4WE1rV2dqOTk4?=
 =?utf-8?B?aVRXU05hVWZBSHVXU1czZWVWQndBTjI3cGpXSi9wYkJoVkpoNFZCKzZTR1Jz?=
 =?utf-8?B?QUFrTllNR2grc3RMQ0ttb3kva0VOZC9BLzhRdEsvTzVNenRSWTJzSmtLUlVF?=
 =?utf-8?B?QThjVlRsaTNiQ0daUjBDc292RHVTOUIzZ1VYM3ZycVIwc3FMdUxEMDlPUkU2?=
 =?utf-8?B?M21CUlFOMHBhaHJieUZvY0J4L2RpeVVDcU1wWS9tanhJNjNzRWEvcnMwNlNw?=
 =?utf-8?B?YlNKM3MvZU0rcFpzRmFQUGQ3R3RUbGYwc3FkcnZsb2dGeEU5NllKcGszMURr?=
 =?utf-8?B?Q1dCdGNhY255SHlXOGxPOXVNcUlPTGUreXhocXFudzdBaWJ2ZVVCN2xwOXBD?=
 =?utf-8?B?MW9KbkllODcvSlJlZ0E0aGRJL01vNHpNeVRYR056MEdOZ0U3dzBDQ2FFRUlk?=
 =?utf-8?B?TE5HV2QrSDZHajBJK2lvT0hxMEVLNk4rQzFUMkFMdDBJSk55N09odldkaDMx?=
 =?utf-8?B?WEJjcGticEdmdHdqa1B5YngvSDNwN25PcDFTemdKS2FrN1lvLzgzdEs4Smkx?=
 =?utf-8?B?ZStSekFoOVFuelplMDloblJBSzk1ZGRkRm03Uml4YlZVV2pIeks3N1Arb09l?=
 =?utf-8?B?Mis0RVVrZXJuS29rWkpETHBtUEY0T0NnM1NmTVZYNWdZL1JWeEc3Ty9wK25P?=
 =?utf-8?B?VUFwUk9iQSsxWFgvV0xsV1h0RUQvRnRIUTNsQ3VNeHNjOUV0TXFrRnhvZXNB?=
 =?utf-8?B?N1ZWZW82MnR4U1ZuUnBRcGRRNnIyR0VrODVZMzhWanV0SzBFMmNZRWdJdkQz?=
 =?utf-8?B?RGZvRkpCbXhIdUI4clNESjRuU0FGYnpLWEhxSlpxYWVnWWhyMFVOeUhWSC9t?=
 =?utf-8?B?MXU3alNrbWh6OW9YcGJIOGFYKzREaENoMXBYek5rY3M1TDIxdi9iSzY2dzdT?=
 =?utf-8?B?aFlyRnRmUWVwd01pYW81aUFlc3VRc3BOdE9DeXB2TURqd2JzcGM5aUNzWVRF?=
 =?utf-8?B?VXdFNHN1V3ZYSC9xTzl0U3FDZzJId3NEVDNnZEFQT3hNQ3RSUFVYZ3ZkcFNV?=
 =?utf-8?B?MWlQdVI2K0lYcXNMWE1RUUV5ZncyZ05tTnhBYjBHSXo5eEFZbGZZVks1TjJY?=
 =?utf-8?B?MHdPRzZPMW1JVVNXT0x3UVRLVDhHK3VueWxOTXcwM2ttMmh2Tk5vQ2ZJdk1o?=
 =?utf-8?B?S2Q0Y1k0MW12Sld0bGhjaTNOYlBCWEZqUjRtVFBPZzBHMG1zZ3h4VjBkTk4w?=
 =?utf-8?B?bW1kQm5EcGFCVlUxVUdOemdLMWR2a2k5RGY0Z3FMVzZJVThsRitjZmtSd2R1?=
 =?utf-8?Q?sQc8BXwK/7OWijRlE6hATojx4?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0807de1d-d0a4-458f-76e7-08dbd144a8f3
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Oct 2023 08:15:02.6837
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7eTrGA4DPu9JkEn7/cGeXGXaEDM4atyoNvqJmOWabKAoG5Mv51frbpesgl1BD+FtzUHH1lK+utXZ6JMcnNPW+w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB7172

On 19.10.2023 15:39, Nicola Vetrini wrote:
> --- a/xen/arch/x86/cpu/mcheck/mce.c
> +++ b/xen/arch/x86/cpu/mcheck/mce.c
> @@ -1682,13 +1682,13 @@ long do_mca(XEN_GUEST_HANDLE_PARAM(xen_mc_t) u_xen_mc)
>      return ret;
>  }
>  
> -int mcinfo_dumpped;
> +static int mcinfo_dumped;
>  static int cf_check x86_mcinfo_dump_panic(mctelem_cookie_t mctc)

While there, please also insert the missing blank line between the
two entities.

Jan

