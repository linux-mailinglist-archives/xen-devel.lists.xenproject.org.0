Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B67097CAC43
	for <lists+xen-devel@lfdr.de>; Mon, 16 Oct 2023 16:52:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.617686.960537 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qsOwx-0000EL-9S; Mon, 16 Oct 2023 14:52:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 617686.960537; Mon, 16 Oct 2023 14:52:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qsOwx-0000CE-6Q; Mon, 16 Oct 2023 14:52:07 +0000
Received: by outflank-mailman (input) for mailman id 617686;
 Mon, 16 Oct 2023 14:52:05 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=BBjo=F6=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qsOwv-0008IR-On
 for xen-devel@lists.xenproject.org; Mon, 16 Oct 2023 14:52:05 +0000
Received: from EUR02-AM0-obe.outbound.protection.outlook.com
 (mail-am0eur02on20615.outbound.protection.outlook.com
 [2a01:111:f400:fe13::615])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 91cb530a-6c33-11ee-9b0e-b553b5be7939;
 Mon, 16 Oct 2023 16:52:04 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by AM7PR04MB7157.eurprd04.prod.outlook.com (2603:10a6:20b:118::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6863.45; Mon, 16 Oct
 2023 14:52:02 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::d9c0:d907:4d2d:15b3]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::d9c0:d907:4d2d:15b3%6]) with mapi id 15.20.6886.034; Mon, 16 Oct 2023
 14:52:02 +0000
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
X-Inumbo-ID: 91cb530a-6c33-11ee-9b0e-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IMICnmuZNA5O4ir3ZPrn6G14rjz/v3/Xi796ko7to4ZHdB+62LrqaxA9YDu/JJXKKlH9qvf2yT90MTfTGbCmt3UQP5rPRBsXuwoRv2ZyPXv9aMsuXQQC5CxPMmtioASf41/zSRVnEHgegqxxwaKp/7DPPrchiuap3KApZZ26GbrBZFIxYUK5Gd0O6zJFX5cWnAJqTQdNpfpYX7nPAMCguMEmPZEE5ewha33f/wK6OcdywQaVg2H5QVN1geZ49vxWfoz1GpjT7UjPaSMSEVQh/343G78xZzHWC+KG1O4WTXiMdbYuwQwS/wfpMOChc7FxQQs38Y2HMsJ7pizvl80uag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0PEBTswjW8DSv6/BhWUXIMgtJF1yVHvu7t12DDK24AM=;
 b=DAKqVlNxwf/bkLBo6IXnSaVKUrHNtbJ1iqf2UHbEg3MZVLLixXOpojUMDrzv6pFTqg7Qdvk+fjXkG2qBoPy+JPFX0KUSpH6qIQTnotHslxgZ7YTqWKjL9YJABp5LiOaWZmst5zymyuLnVIgCCnPXnqaPlZ+05hFMOKWiv5TayZmfGT8i4bG5Zv+wX/nXiWYvjLZhETATytesNbsnSwp9o05+ec7m6MsNZh8sAFKrUf9vDF8OXq5BQCJQKPDECR/PtD8BwEYj/sWIPCYB+a/1jX9P43eCNN7UllH2p5eEPpp6Csdy048MMPCZRWfPh9DzbmIWtFGVOS2WIqHHFdO20w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0PEBTswjW8DSv6/BhWUXIMgtJF1yVHvu7t12DDK24AM=;
 b=N2Ez7CgjfwAHWdlgl0Y6rpjxEgTYQzcqgDAAqdh3S8Bfe0o/uNDfLuZy/j5GyJ4XDgOLMhPiF4tvL6clYeXUJoyWlNRin3FDsogKkEDx4WxfcSB0OTlP1m3wFoD3nXXKGGQfzgXQMfJ63MLnPy9ID0KLuJeOkznFIZqEgW6vJLTy9toxO6Q2H74Kn1MVzldOLhZm4n1UGc1Xgkc9cBwQ18aG/Getj2WtWRyiR86RVoLAN1nc+lBblzpbK6ygvnqVhFjsljO83et/dBxttTd20APAs4ZfmQu5k9fvSOY/6I9VNhJz7kBofhPpaorhnH2NYrxSoE1hr54jm5KE1ISY3A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <5cad5cef-27b7-58ef-42f1-8c4a83497f4b@suse.com>
Date: Mon, 16 Oct 2023 16:52:00 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [XEN PATCH][for-4.19 v2 6/7] xen/console: make function static
 inline
Content-Language: en-US
To: Nicola Vetrini <nicola.vetrini@bugseng.com>
Cc: sstabellini@kernel.org, michal.orzel@amd.com, xenia.ragiadakou@amd.com,
 ayan.kumar.halder@amd.com, consulting@bugseng.com,
 andrew.cooper3@citrix.com, roger.pau@citrix.com,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, xen-devel@lists.xenproject.org
References: <cover.1696833629.git.nicola.vetrini@bugseng.com>
 <6ca7d9834079b7824f9432799cce2308aa88d159.1696833629.git.nicola.vetrini@bugseng.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <6ca7d9834079b7824f9432799cce2308aa88d159.1696833629.git.nicola.vetrini@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0183.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9f::19) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|AM7PR04MB7157:EE_
X-MS-Office365-Filtering-Correlation-Id: 4050441c-69f0-46c4-f7cf-08dbce5774f1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	ZQW5BekNsNMcBN/kq5z3F9noTktTG/96fOLbWGwuZCEAQA727tvedPmP2jy/gT/Pa5ZM50mtlc8oCfdzH3A+drvYNcssj/G4ZsljnwxgdMy3oKDtfutL2ob4a9q96m6QQWZd42H9hX9D1/sq/zdY8/2ywoafyVz1BfadgxfaGX7ecZ+WFwZ2ZpTKx1zFQ9il62tfEJUPL6hIA7KSGNEUREnqFwtfqRzqCLv4ExGJeQAsFyHScQkTUZaNjkVHXqEBKbE8aOR/CqyABeS7kSURyy8gbamVmvXIKo4Z3lrPX1MLerWT4zHqeqjwmwJo5PfSw3n5Sr3KQ0YRj5L8b0k6xSPXoVHS2C8bjqNLDQPhlt2FGvyYnoe3C8P8T50gojltw1kLKCMz0lTAW9pqt1Hy9g4okhOaxe0dXpiGYu+KUHA+oTNmMErNk7C53DY9yFXtOgT8fkEx0m8lNC758292JYB3nD1Ztg55eN/LfbCEduS9I2GaCBTWFNBZU2PSWVkPiCC6thd4FhZgBOZxvsZOh7W3vyDM6x/hDSK44jIv4t5gC77fJ9/Z/sdwlbvEZO28VbK/U+qrsiuqGcP0RJdoNEf7iz6ygOs6iZqQTs3xWmEX9AhRT2bIy23otaBIWE+J3M2qGoDkep9rCSisU72Wow==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(39860400002)(136003)(376002)(346002)(366004)(230922051799003)(1800799009)(186009)(451199024)(64100799003)(2906002)(5660300002)(8936002)(4744005)(8676002)(66476007)(66556008)(6916009)(7416002)(41300700001)(316002)(66946007)(54906003)(478600001)(4326008)(6486002)(31686004)(6512007)(6506007)(2616005)(26005)(53546011)(36756003)(38100700002)(86362001)(31696002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dTdVZUVKNTl6OEZsYVp3MlRja1ZMZ2dDMGY3Q1RLUnZ5K1lMeWlUamwrOEFY?=
 =?utf-8?B?TTlYQW9FVzBwVHpKWlVVakwxVnFtTlMydnAzbW9HZk9lSm9mRVY4K2VaZjRU?=
 =?utf-8?B?ZytXNDMwUC9tSTVDTG9sRUNMcXdKZCtjOEFFWEx1V3lzUzFLeGRxNGF0YWtI?=
 =?utf-8?B?dE5RcFFERU85RkhqVmNCekVGQ2hFalhHZUgrcjhOZ0dPRzFVVlkrcFl4K3pU?=
 =?utf-8?B?Mjg1NGZzS3NkQUx1OE5CZ0U4Q1hkWHI4NlRReFNhOHZBdVc2cW5CT1k3VHM2?=
 =?utf-8?B?NUFGbVYyRFhiK0gralQ2Z29nQ3ZYNzJTS3RIRmFNVzRDem8rWEwrSWtTb255?=
 =?utf-8?B?MXNSenYyekJLVTRZazdHOXpsTlZkSHd5K1ROVUlEamtXN3ZLc2g0RGRUYlo3?=
 =?utf-8?B?RnF0QmI1QWQzdGU0VGdLcEhTUDVFVUdjR3dhc0FDTEk4RXorZGNoZGpqNTkr?=
 =?utf-8?B?RW9BTlNNd0gzYUMxUlVUb2J3OGlzemdhNHNYMTUrdE55UDFnd0x2TjR5VTZC?=
 =?utf-8?B?NmpPM2NSMnd3Nm91OUtmTnA3Q3hDcGRIZnErT2o4MnZoQkVUYm9zbUVDdGRl?=
 =?utf-8?B?b3pGTnVkczdUU0c2bitqT3ZHdHlvQUpYNGtmU3ViWWVOOVlkclY5eXZpbktH?=
 =?utf-8?B?Mng5QVhxeUlWQXdlbUJ4ZjBpaDlmUFV2WjFjaXlCc1BNNy9BcmlBUCtaWkdw?=
 =?utf-8?B?S05KL0Y4Y3k3VEFOVVBjVkpHbmpUTUJ2VDBzTVhyZzJYNUF5MTcyeS9JVTlQ?=
 =?utf-8?B?bVlvWndxZ2F5anNBVnlpdEVzWEtQbWp0aDhxTEJMRDBSMVBjdHJvQUNtQ2h1?=
 =?utf-8?B?VTBOTEp0RlpxTS91d0NhaGJWdmx6ZnZrQzRnNmJLQnFtTHlxdnFFQ2hUM0VI?=
 =?utf-8?B?U0ZGL1BkZDFkZEV0am4rWnBCT3VZalVES1lPOG1Td2VaRFNMdWNqaytWcHJv?=
 =?utf-8?B?N3pqaldDckMrWWRBb3RTdlBiNHI0M2pkVzZiYTUxa01XNlVYV0dadWhjZUVI?=
 =?utf-8?B?Wkp5TVpuTVNhTndWdGgzK1pUVEk4U25QSkYxSlYrdmVnMzhwVlNxVndxdjhy?=
 =?utf-8?B?ckh0d1RYL0RaeHRVM0VmS0YwZVhaSTBJUHNVTGRCOFJzc1JqbkpXa1gxeEoy?=
 =?utf-8?B?a0tuYmU4SHVqWFYyb2JrVW50a0I0aEdXaVBBbWcvaGdOcVVFeXkyVzVyaVNZ?=
 =?utf-8?B?SHMvRE41SVM4WWhjSC9GUVc1MzlPVXE0c0dYR3g1bkJmTHUyMERjYmRNZDB3?=
 =?utf-8?B?QitvUGhLMTkvZ1BmbmVXbGhjWE0zSEhiZ0g1YzFTdFlkNkVKRi9OVVBwMVZu?=
 =?utf-8?B?SnFpRFFGb3Q2MDFxbldlMkFweFptRWhqSUZDR3ByYThKWHV2VGRHR2R0dlNh?=
 =?utf-8?B?TG9VODdjMG1DeWVLcHIrQ21VWGpZQy9TS3BBeUlwRmJPS1lydXJKdFBVV0hn?=
 =?utf-8?B?cGYybTV4R1JiM0ZnVFhMU0tzSjRsQmpBOVc4b25TK2I0UUlRWXVaS05Eazhz?=
 =?utf-8?B?MXMxM3ZOMEdXaXFMZ2h2eG5vVW16OXlINVZGMzk1L0RVcXlnZDNjcjRORGND?=
 =?utf-8?B?N0VkWFZBbGlnblI5UnNWaXQ2ZmxsV0hwNUx4NDBtVG9BTUE2dTZ5UW5SUEFx?=
 =?utf-8?B?V0Z1UzhYaGNPMkY3L2cxbEU2eWFIVEVmZkpNSXd0eitoQkIyZ2lZWXpmV1gw?=
 =?utf-8?B?TnNXZGZSUEdZdXZzUGEvc1BIeWpENE1LNytVUm1aWjhGZ3RKLzVMSmVzUmgw?=
 =?utf-8?B?OGxRMXhONFUvZGRQOW9GWG5WK1RLUVUvQWhzRmF5alExeWZpVUtiWGJaMmp0?=
 =?utf-8?B?dndna1VlYnl5SEdkRXVCSmM2dDV6WVQ4MlFqekZSN2gzMXI3M09GbmpmNWpY?=
 =?utf-8?B?dzY3RDA1U0tMMXJjUysraWRSK3RpTEZiVnMwQnFBWm9wSTd3SVZ4eGVNWFJN?=
 =?utf-8?B?T0c1NTM1dVJnN2ZIQUV5SEI4Z1BrbEYyTGN2OEVBc05JQ2hpZzBQa2NXSmd4?=
 =?utf-8?B?MDdsam9qUmd4YllkVTdhUU5nWEdOcU84WTBFWHluc3lHY3gvUlJQNmROWHh3?=
 =?utf-8?B?aGFXeHlSVzhlMHk4eEgvRFpsTE9ZWEZsdFFUd2JtZW91MWtMVU5RY3p2d2k3?=
 =?utf-8?Q?ZUQ7YbCIRm1HvN/5E3E3ebh8w?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4050441c-69f0-46c4-f7cf-08dbce5774f1
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Oct 2023 14:52:02.3792
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NpuEIE171aoyF7T4O/Zx0E0caFhXLE0Xkg02AbnFCUkbtEFP0ubtKQmjWZIL4jCghqZFQtMya4YE/KNqf2+L7w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR04MB7157

On 09.10.2023 08:54, Nicola Vetrini wrote:
> --- a/xen/include/xen/consoled.h
> +++ b/xen/include/xen/consoled.h
> @@ -12,7 +12,7 @@ size_t consoled_guest_tx(char c);
>  
>  #else
>  
> -size_t consoled_guest_tx(char c) { return 0; }
> +static inline size_t consoled_guest_tx(char c) { return 0; }

Why inline? We do so in headers, but we generally avoid "inline" in
.c files.

Jan


