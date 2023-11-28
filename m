Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CE0F7FC036
	for <lists+xen-devel@lfdr.de>; Tue, 28 Nov 2023 18:22:39 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.643379.1003531 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r81mu-0005wh-3j; Tue, 28 Nov 2023 17:22:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 643379.1003531; Tue, 28 Nov 2023 17:22:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r81mu-0005uC-0s; Tue, 28 Nov 2023 17:22:20 +0000
Received: by outflank-mailman (input) for mailman id 643379;
 Tue, 28 Nov 2023 17:22:18 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=xcZ5=HJ=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1r81ms-0005u6-8I
 for xen-devel@lists.xenproject.org; Tue, 28 Nov 2023 17:22:18 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on20616.outbound.protection.outlook.com
 [2a01:111:f400:7d00::616])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id adae0d25-8e12-11ee-98e3-6d05b1d4d9a1;
 Tue, 28 Nov 2023 18:22:17 +0100 (CET)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by AM9PR04MB8651.eurprd04.prod.outlook.com (2603:10a6:20b:43e::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7046.21; Tue, 28 Nov
 2023 17:22:14 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::eb8e:fa24:44c1:5d44]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::eb8e:fa24:44c1:5d44%3]) with mapi id 15.20.7046.015; Tue, 28 Nov 2023
 17:22:14 +0000
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
X-Inumbo-ID: adae0d25-8e12-11ee-98e3-6d05b1d4d9a1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iWCNO5WcDjGZVUGFKvlfuNYVT4/O9D5sDWA6VcCztvMIRzfxdbUtJMKuKmXEnh35wCrnxFJ0xg9bqcBK7DCYWCRtDJAvbyOIXui+MhLYKMRN2W5jDuSrk5cWXYv7HGFQDX1DHkRtSBixccKyxGu9+CyjUJceaYsqA4k1zCZQrwvakHs6QBZOha8rAbcILvP3aEv8lkESTWvJoeAcfwbcgtTmjr1+PCLuUKpEKTsAOxbfDbJoSWV8+CzS8f3UljFkMwSHAdWyDx3XJDMk9N4RZ3Braaw9n9K+5PAdD6qQMr3S5me/1zPE6Cwr/7XrYfDFnuBHoBc52dOZ3aUNo/0snw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vPAnAkPuF+r9vh72RFbq6quMYRHsEkj7B9nvnGNJ3Js=;
 b=IFFP4fvxtGd5Sun6EGQb/+9pmEKIeuf1MHlz8V6mWg/jfCeikL63iBWp4AGseFo5y2KpgXPEtl57oP75Smh5Xr1JhKpWeIO6n32pegyV47XidRDuuDNkExy1s4Inuq0jwrKA3JbMdvaRnU+VX1S6tb2zqX8JnxcG4LL/EGC2xPm+AorZoAKjfph5fZe+uYB+2S0Bnd25FoaVXbcNlv5f08LIagTaJSb0YxPwYE00qPCJ1+za3Tk/hBk5+ot3VS7A4Sofe47mqInPYnc+bx8+451Mkd6pNoPCURr0QUGT4NOepo5MnhmhzNJeuiukPMc6TuWOfsgmV43xYZep0zOGgw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vPAnAkPuF+r9vh72RFbq6quMYRHsEkj7B9nvnGNJ3Js=;
 b=fFBExEVYurUdMGmuFv9S+kLMQzdDHaTFn+1kI0Wotk+gO2NtUHLpzesRsSLsQ1OhJ0yQEzLGUlzWpFCgNEmo1BfpiunpDe9kq2qqXC+smBlqkBwlOoYwcnE6Ouv09xftPcHHxx9R0iYJXZpUIczN6dtlPhbkQk3yhVbbdFlP+P736gTDna+5WWcyV65gJIm3dod5eLWZZx30DE2kuLYrW0daSTrH1kCqGAz5reVefLaXqNZW33o3mBfhQ1ZgkC9Chy4ebIGZzGXJ+H1HC2duPx/A2eZHUXMN1n1XJxkv2Ll2CzW0havuVv1SfB1h67bXWihCTEUZFTykPPgqD86vMw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <34e6477d-5f1b-4956-a9d2-a1858bfdc902@suse.com>
Date: Tue, 28 Nov 2023 18:22:12 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH 01/11] xen/console: address violations of MISRA C:2012
 Rule 8.2
Content-Language: en-US
To: Federico Serafini <federico.serafini@bugseng.com>
Cc: consulting@bugseng.com, Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <cover.1700832962.git.federico.serafini@bugseng.com>
 <c79bcd4dd33cd448e5eba21defff1c928f064079.1700832962.git.federico.serafini@bugseng.com>
From: Jan Beulich <jbeulich@suse.com>
Autocrypt: addr=jbeulich@suse.com; keydata=
 xsDiBFk3nEQRBADAEaSw6zC/EJkiwGPXbWtPxl2xCdSoeepS07jW8UgcHNurfHvUzogEq5xk
 hu507c3BarVjyWCJOylMNR98Yd8VqD9UfmX0Hb8/BrA+Hl6/DB/eqGptrf4BSRwcZQM32aZK
 7Pj2XbGWIUrZrd70x1eAP9QE3P79Y2oLrsCgbZJfEwCgvz9JjGmQqQkRiTVzlZVCJYcyGGsD
 /0tbFCzD2h20ahe8rC1gbb3K3qk+LpBtvjBu1RY9drYk0NymiGbJWZgab6t1jM7sk2vuf0Py
 O9Hf9XBmK0uE9IgMaiCpc32XV9oASz6UJebwkX+zF2jG5I1BfnO9g7KlotcA/v5ClMjgo6Gl
 MDY4HxoSRu3i1cqqSDtVlt+AOVBJBACrZcnHAUSuCXBPy0jOlBhxPqRWv6ND4c9PH1xjQ3NP
 nxJuMBS8rnNg22uyfAgmBKNLpLgAGVRMZGaGoJObGf72s6TeIqKJo/LtggAS9qAUiuKVnygo
 3wjfkS9A3DRO+SpU7JqWdsveeIQyeyEJ/8PTowmSQLakF+3fote9ybzd880fSmFuIEJldWxp
 Y2ggPGpiZXVsaWNoQHN1c2UuY29tPsJgBBMRAgAgBQJZN5xEAhsDBgsJCAcDAgQVAggDBBYC
 AwECHgECF4AACgkQoDSui/t3IH4J+wCfQ5jHdEjCRHj23O/5ttg9r9OIruwAn3103WUITZee
 e7Sbg12UgcQ5lv7SzsFNBFk3nEQQCACCuTjCjFOUdi5Nm244F+78kLghRcin/awv+IrTcIWF
 hUpSs1Y91iQQ7KItirz5uwCPlwejSJDQJLIS+QtJHaXDXeV6NI0Uef1hP20+y8qydDiVkv6l
 IreXjTb7DvksRgJNvCkWtYnlS3mYvQ9NzS9PhyALWbXnH6sIJd2O9lKS1Mrfq+y0IXCP10eS
 FFGg+Av3IQeFatkJAyju0PPthyTqxSI4lZYuJVPknzgaeuJv/2NccrPvmeDg6Coe7ZIeQ8Yj
 t0ARxu2xytAkkLCel1Lz1WLmwLstV30g80nkgZf/wr+/BXJW/oIvRlonUkxv+IbBM3dX2OV8
 AmRv1ySWPTP7AAMFB/9PQK/VtlNUJvg8GXj9ootzrteGfVZVVT4XBJkfwBcpC/XcPzldjv+3
 HYudvpdNK3lLujXeA5fLOH+Z/G9WBc5pFVSMocI71I8bT8lIAzreg0WvkWg5V2WZsUMlnDL9
 mpwIGFhlbM3gfDMs7MPMu8YQRFVdUvtSpaAs8OFfGQ0ia3LGZcjA6Ik2+xcqscEJzNH+qh8V
 m5jjp28yZgaqTaRbg3M/+MTbMpicpZuqF4rnB0AQD12/3BNWDR6bmh+EkYSMcEIpQmBM51qM
 EKYTQGybRCjpnKHGOxG0rfFY1085mBDZCH5Kx0cl0HVJuQKC+dV2ZY5AqjcKwAxpE75MLFkr
 wkkEGBECAAkFAlk3nEQCGwwACgkQoDSui/t3IH7nnwCfcJWUDUFKdCsBH/E5d+0ZnMQi+G0A
 nAuWpQkjM1ASeQwSHEeAWPgskBQL
In-Reply-To: <c79bcd4dd33cd448e5eba21defff1c928f064079.1700832962.git.federico.serafini@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR4P281CA0371.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:f8::7) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|AM9PR04MB8651:EE_
X-MS-Office365-Filtering-Correlation-Id: 56f084d4-84aa-40b8-59c8-08dbf036906d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	pATi0XkM8NpW+nci/1uZ3zmmmz0sKsM+WnWa6kIuFSXHvHEa7sQFJl6UvkqrrugIb0bEGpRP9Nz3AlowpJVwzJa+OEbjaESY5VXFk1ONJ/s38gNjIec7IcQ9/Ty2cFtastcZMGYS7re8yCcF+ES1w++UqQfYdR8zvROdD7/bbZUNOIasdNrvYJdKAb4lDj74oR/EmvNVXA5wROMXXVqNrgm4pXz5LxIlOhsVdx4g2FqTh4R+qn66FvT2K9r+0tKK4ytRkfyVgifNlb298dA/Ico34P3w1WoJ9aI7pwFRGeWdmS7rqobx+9OlvX4EFmduEvGSSCCFG8NseubTiXj0h6XdRNZLN0q20CfNi8HwSD/28p9hiLTZ1qP4P/W6UZ7x+hsYa2edSME23wP1X94n3u04LlxGEpltXmOrqCYhdwuMA1dHGXXJ+Glx78cnbDGQmLldT2qOnGsOIogl2x3GmjB2Lb1bXBqhJisEvH7oXM+TRm+5GHvFmySV0LolVdGv/QcWMZKmWY1Kzv8FLKdoqHC452UXNqOIP0HZQDQOq+mU/1an1SMaIupw1Hw5oRz8HECs1ycZ5JCzYxoRBpT3oPqlHAWdyBuJ0h4pFdxB3l0qDVKgdV1+3xksRT/+nevk2fhPWo5bZrCjmSrsRPru5g==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(39860400002)(366004)(376002)(346002)(396003)(230922051799003)(64100799003)(186009)(1800799012)(451199024)(53546011)(6512007)(6506007)(6486002)(2616005)(478600001)(5660300002)(2906002)(66946007)(6916009)(316002)(54906003)(4326008)(66556008)(8936002)(8676002)(41300700001)(66476007)(38100700002)(86362001)(31696002)(36756003)(558084003)(31686004)(26005)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WlM1VUpRSFA4Y1MrditxOUhmK09KdldzZGltUTVOZVRpelBuZGRsM1lqSTRr?=
 =?utf-8?B?cWhJZTdLZlRNWnZVSHNiTGcwN3ZIc01ySkxvbGFEZEZwMlY2ZXBtY1NDSUtH?=
 =?utf-8?B?TlpBUGJXdXFQQmVQM1hyWUJEWkRnQUk1ZVdreXROYXNxTTJ4VkhPQVRFVmJt?=
 =?utf-8?B?R0tYb2NScEEwZjV0VXlmZ1NEYmljN1ltZEQxQzZDYzcwL1RKTm9nWjNEb05s?=
 =?utf-8?B?ZnphbTYxa3QyWUlLeWdnZ2FTYlNRQnVjUGhINW1Za2NSeHR5NmpuclU1ZlFM?=
 =?utf-8?B?MEhBZmZKYnl3ZXhNY2lheW91Uzc3SVp1UHRELytqQ1RlbndCdEhOVllkRXcy?=
 =?utf-8?B?NFhoSDlZUU9Jcm9na3BlY25ya051UDZac2hRcy9SOFB5RmhNcGw4NER4THox?=
 =?utf-8?B?MU94Ty9uNWIxek1Wc3lEek93MG9IdEFsNFlsRURkRUlubVhwcmJFUjlBcXVO?=
 =?utf-8?B?UnI1ak9IaUhmMEFaZ2hqeFFJalFEeHNVLzZmS1FlZmZSM0phY001OWNFWDBv?=
 =?utf-8?B?MCtYcldDck0vNEc3UFhaU1FUcHRFYTJHZW90QjdWWWk5bzBnNGNCc2l3OWFu?=
 =?utf-8?B?UGFBOW1lRHRLdVBMQkx1NU9lZERWeEZXVlQ0SWZxRHg4Sk41OGpoSC9XTlJE?=
 =?utf-8?B?ZnUreVl2NytpSUp6ZzVJcG85TVVoNUVhYmp4Rkl3VDB1RlgyTzdJYkhkb212?=
 =?utf-8?B?NTF4TlR0ajF5NU9IYzg5TTdkclVjLzAyL3hoblFzWUdCTGVNTGtoYkMwQ2px?=
 =?utf-8?B?MjErRXNNZE1UalhucDhja3NObTdMcnowNmJLUkdqYmhGWnJ1b1FSMDJZYW5H?=
 =?utf-8?B?RGs4TmZCR0V3dkorTkd3MVAwbVlrZGtvMWdnakw2RGYrNHVLZ3VOVVNmVUlP?=
 =?utf-8?B?QzR5cWJ1amEwRUV2WnU1akNQbXpuckw0eW1UbkFyMnMyQW9BY1R2YVNHVUZ2?=
 =?utf-8?B?akJIVi9zak56OUxCMzRlV1NIYWlLTW1ock0xQTl3QjJJbXZlaFFFeEw2K2t0?=
 =?utf-8?B?Z1U1RHh3YlRib1puRzRPTndmS3BnS0daYUcxSXZSMEE4ckpHdzl4WFNDWDdH?=
 =?utf-8?B?REx3b3lXK0d5WlluYUJIbmFQNU4zVSt3dGFVNWR3VHdTdmJVUFp4TlpkQktl?=
 =?utf-8?B?U3VCOGZsdlFQaEtFeUZNR3N2SGNsWTV3WFhmaUJKRDFqdHBIc0NCRDI2dUx2?=
 =?utf-8?B?S0ZhQVlTWFhtV2xacjVpUjlxZllEbllIQzVGcmZuOWpNWEhOQ3hpNUhvVVky?=
 =?utf-8?B?eTBwRG92elBDaURTZ1BuR0w4QktUYmNvOU1WNWRlVFI4MFV3WllpTjJHZFZM?=
 =?utf-8?B?UTJmN0s4c1Vud2drczZIdEhtNFAwNFU0Zzduc0JDSDNVNE5OUDZpM2FlOFhT?=
 =?utf-8?B?cUNZZTdBQzhoRjU3M01VNTBBN3kwUjRhVzBZSWJwZWZvcC85aHA4YW1LS0Zq?=
 =?utf-8?B?SWdOVnczV3NyUmpvVlZ3WURLK3piWW1FeWlkcXVyTG1jWU1qeDFvWk1pb1Zm?=
 =?utf-8?B?YnZ3VEgyNFF4UzUxemk0MEZVZ0lRTWxFVjJzOHBTaEQrNmxkZVcwWUg1QUs2?=
 =?utf-8?B?bzVrOUc5TlpwSEpHQzl0WnNYYkVvRkhSWnAyQ1hmUGVmVnBMcm9OV0EvallQ?=
 =?utf-8?B?cEhUVVQwQ1FCSTJDWEgrOGF4WXNJb1llZklhaUtucXNwZnRVYk4rUXJVcGR0?=
 =?utf-8?B?U3FpeGtlbVhubXFZRFd6WjJ4NUtGSkgyd0JLa00zNXB0U3lCQ2gzV1BEYkpJ?=
 =?utf-8?B?ZllEYlQwaWpYaERvVTkvRG9DRnl5VWJra3pXK3pWdmZHdFRDRk5KdVhkMDUr?=
 =?utf-8?B?SnBLbFpicXp4TUp6VXJIVEZCSS9QNTZiT2cxdHJxenNLbmo2L2NDKy9neWJr?=
 =?utf-8?B?WllucWNnUzZYTlFJV0VlMzMrczdoN3o5cHRrRTNCTld5L2Q5R3ZpbGRWckdN?=
 =?utf-8?B?eW9Ub0F5R0xVbDFVRUdTcFEvcFo2MHJXa2VUb3JFTmpYa3VOdHlsRDR3TVds?=
 =?utf-8?B?UWhQY1MvZFZCV3IvS2JndkVqZWtheE9YNld4UUk5MUgyd2owajFBd0FRWFpw?=
 =?utf-8?B?WWxxZHgzTUhkRlE1WVAwdlJONlFZR1ZMWDE3R0ttWTAzVklnNHZoVTcxZnIy?=
 =?utf-8?Q?pgzOBmshiFcuknhT3dYQ5zL0h?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 56f084d4-84aa-40b8-59c8-08dbf036906d
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Nov 2023 17:22:14.6069
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GvaypK45VpDHH3R0DPAENadScBmEf5294o5wrWlFVuXkXdmKl5TpY5GePMP46LCuGKJ1oUteeV4rR1s/mdsWqQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8651

On 24.11.2023 15:03, Federico Serafini wrote:
> Add missing parameter names. No functional change.
> 
> Signed-off-by: Federico Serafini <federico.serafini@bugseng.com>

Acked-by: Jan Beulich <jbeulich@suse.com>



