Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BBA927FC03B
	for <lists+xen-devel@lfdr.de>; Tue, 28 Nov 2023 18:23:46 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.643381.1003541 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r81oA-0006Sb-E1; Tue, 28 Nov 2023 17:23:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 643381.1003541; Tue, 28 Nov 2023 17:23:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r81oA-0006Qu-As; Tue, 28 Nov 2023 17:23:38 +0000
Received: by outflank-mailman (input) for mailman id 643381;
 Tue, 28 Nov 2023 17:23:36 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=xcZ5=HJ=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1r81o8-0006Qo-9s
 for xen-devel@lists.xenproject.org; Tue, 28 Nov 2023 17:23:36 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04on0617.outbound.protection.outlook.com
 [2a01:111:f400:fe0e::617])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id dc2bea01-8e12-11ee-98e3-6d05b1d4d9a1;
 Tue, 28 Nov 2023 18:23:35 +0100 (CET)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by DU2PR04MB8982.eurprd04.prod.outlook.com (2603:10a6:10:2e1::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7046.21; Tue, 28 Nov
 2023 17:23:33 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::eb8e:fa24:44c1:5d44]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::eb8e:fa24:44c1:5d44%3]) with mapi id 15.20.7046.015; Tue, 28 Nov 2023
 17:23:33 +0000
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
X-Inumbo-ID: dc2bea01-8e12-11ee-98e3-6d05b1d4d9a1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=n8qqrHwfdSvUW6y9ssgwRPurom0pulHr3QQjC+d67ODBdCJTDal1ZgMFUaml7P2VNQUF/KQfIlOE9p67f8FEJ4p6kh5fsMVTuooMQPJ59qI8HFbW+UDamT40i1Jm+YgKX6b+EwqX1nxBzOnNsA/Rk1RqST2r2Y8uckWUl+j//3adaXyTzlHhEd7oPyf6H8GrO5YA1+4x+3EZX2WAhZFAeMHN0D3S7eUOjKsGSnru/yzMMdwgJf8WAtrYq+lH6R7EifVFfqcHDuE2DjKAOUqeaJacJ5j+i+CGzrzGlbCrpbcjMtdeSRqB9lbOmJCyFoz4a82xCjEkUub7ldIBX2DOrA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kQrJpH3LvwigCPumaZeQGBpThzaUpAoBzz7FkFxm4Vo=;
 b=DSSVUh/Wo5nOiE+hU0G80YaiQ3LsxXeHucgTPL4QKQc53aIR85hcLN2iT619TsQO1JEaHkmQnT90boMNLDNq6vh5e75GHtW7caZrby/aEcOByRh2SDEWK+bruwA/j0To9WCD8kt779n3hM9szRZJg93QNOmMTvkxB3lnyhYwqSFI5uuNlCVrvY+wczzRO8MCs2a8k/2lUAJqe9K7t183yIfTLrBpYLVrKs4WfTR5X/I92T0c7+TE3z+IFjlNOfJ+Z+a5DvUZs1tex12n6BlIYbU7H3r/YPRAzfE5phlGbMRQ29YgECN8+ZejApyirFH2kdCAHxRczQgKmJOTiqWsEg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kQrJpH3LvwigCPumaZeQGBpThzaUpAoBzz7FkFxm4Vo=;
 b=LimHGWBQYsgeneRNbykKgsR4831p/6OU+5Xyn0kDBP9x86JxAy8pDfizpGqsj8JFw1GCTCrXC5KvnLeE7QQhgCGzlIk+2nhQBY/Xcwsd81meSUCPru9psxB3RG2jWEL4rlNXrfddbKsGEKq1cd6iP9tro39XnBN3U/lG7HR6ddlkSvlwDBQGfzPn1AIjs5+cziOhpL6nNC3tToWD1zhCJQkqXHt17AdFRHQJDwT1WrteAlwFvB/ySkGEjjVUPuUTFPQ7OTA/hU8/9OHiHNh6T/0pGLFS+EaVJ++AjMPkV4CFJwXIzJB2ZRgsM0rKifprxDkj/yBKduF9+43l/iBGiA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <87f53b71-7e76-48b7-b0df-f49360686701@suse.com>
Date: Tue, 28 Nov 2023 18:23:32 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH 02/11] xen/aclinux: address violations of MISRA C:2012
 Rule 8.2
Content-Language: en-US
To: Federico Serafini <federico.serafini@bugseng.com>
Cc: consulting@bugseng.com, xen-devel@lists.xenproject.org
References: <cover.1700832962.git.federico.serafini@bugseng.com>
 <98eabdc58a458188157765fd9ca8c9d4d4f6b11c.1700832962.git.federico.serafini@bugseng.com>
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
In-Reply-To: <98eabdc58a458188157765fd9ca8c9d4d4f6b11c.1700832962.git.federico.serafini@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR4P281CA0371.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:f8::7) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|DU2PR04MB8982:EE_
X-MS-Office365-Filtering-Correlation-Id: 4875f1c4-bb1f-4ca2-479b-08dbf036bf5e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Oa7kZz54hcEwSA53YUEPG5zIwbDy/uvxE4rOnO3IM9yZjtPcA9vgptqtKrKS/e47isGV3fJ+e6mm8SvFW0ClPtoEl1oa7AmiYBULRogPFn4TiQ6uDRLnzRD9Hp7FkxXIfhLzz+lvPd/TrBeGE20j+aGQR5GH5bo7TYLQBNJk8M6Ve6y9gxNr51Tk/2oM8FBaiThOiK8rZZ9oAvtl6G0rsdpS2NRAgXEO0y0DUJFtmVeH0+0lv1Zwd4YJ1+tm4KmNH5np1r41/mETkFNXAimBe/J6bQUHCyguBhcuLmsfDR9x8B+cb37lNouPau+3w+Mg5FL6pInKTxeHICKXLn92AWJTZgGhw9hSp2QzkWz+s4kPnAmrGegb5BS9iOphzexQ2zi19I+gB3OwMH5ZmSHA2YSMMaDzCm55COrnwg4Q6wxgHQJkeIce5dtGnC379qen8YlJ+SmrPSh5Ucygt5j4dseR8ssnWkfHMHi4EpXCB5Z9gBCRWSxhLZrV2a+MF44cj9n440nJ86U1KJ+1+6Lcj2mNUGld3tHvLKxcdMzbS2yCGuel9zDZ7t25sGa0SttSeHkl8PAPml+KTqBkqfz9s46X0uF/vp1RPEF/4Ta0OxkipCO4hI55sx4oIkxuWQJIyOD6hqt2R/F5GECtCzhAOQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(39860400002)(136003)(396003)(346002)(376002)(230922051799003)(451199024)(64100799003)(186009)(1800799012)(6486002)(478600001)(5660300002)(4744005)(2906002)(316002)(66946007)(66556008)(66476007)(6916009)(4326008)(8676002)(8936002)(41300700001)(31696002)(86362001)(31686004)(38100700002)(36756003)(26005)(6506007)(53546011)(2616005)(6512007)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?enc5OHZ0UXNtaitTOFRFV1V4K201R2lIR01nN00rbnJXa3dTTDhicHBQdStG?=
 =?utf-8?B?eStNRFdXQU0wNUtwR2pVUjYvQWFwU3BFWGQzSXpvNHFsc3lud1RjbjZhWlV5?=
 =?utf-8?B?ZUlpbVZYSnlmK1hNZmpHdVJmejZaeUNzOHBaT3NLdDNvTTBlSDZoSlpDbFBC?=
 =?utf-8?B?MTZnenU5bU8vRUdtVkRjT0NjbkFDcStKT0FRQmtuKzBRY2FRYkNiV3ZlZExV?=
 =?utf-8?B?YzFvVGpUMlBidERRTUpTSm1WdDJuL0hMM08wN01hSjdUMkVSeGRVbzB0OWcx?=
 =?utf-8?B?Q0thRSs2SnViV0xwNVJTckgzVjR4V2s1SDdYSjV5MGUvaE4yV29rbjY5Z2h2?=
 =?utf-8?B?d2xHbFVkTlU0Z1YzMW5IV0p4dHpCWEdVZm14LzBWeG92Nk05M2JDcVpwVGts?=
 =?utf-8?B?eVYxSEN3YXhrV1ZNcE1XY1FSbWx2b1NZc1I1OWNKTStMN1NiRU1XKzg3ZXpG?=
 =?utf-8?B?ODJOd21lZ29jRllEM1l2MmlvR3M5M1A5RlNjMEVWeTREOEZhYWUvbkRHTDhr?=
 =?utf-8?B?TjdSU25JWXFXRTdEVytPU3NETU9vdCszcFFrZldsdlBtSVc3bE15OHhaVncz?=
 =?utf-8?B?WGRtalB6YzhQa2dLL253MFBPT3hsaWY3S2p6ZDJhUkZSNFZuUXJtQnVhZVVM?=
 =?utf-8?B?VlZjSWNQenQxZzhheVdXUXhDVzloSG8ycVpoOWxhUTBRS1I4T3hUK3lWRmE2?=
 =?utf-8?B?dlBBQ2VYZDdHTVRvLzEwTnNTbkhyYnB5NFl3blcyajZ0WTFRNFh2QzkzNERy?=
 =?utf-8?B?SlZqOXJrVDFtNGwxV3pid3FRZVJ5RXhrTi9UMUF4amhPZTcyYUMxQUZ1QVBx?=
 =?utf-8?B?cTM0OENOOVZOMnpTNVA3dTdjZFRocmlyZWNGVHppSWFmTjQxaDFrWVBNczdp?=
 =?utf-8?B?OWJ4cVp5VStNSzZ4M0xwRW1SZVNYUUp1bUJUOXBjUWJLTjc4bkkxR0ZtamZj?=
 =?utf-8?B?c1VnOVNXZ0N2blZTbFBUQkFmOUM2Y1NydDZlTXYvSW01bU4yY3haK1dYSUxw?=
 =?utf-8?B?TGxKNU9HUUoxV1p3MEJLZ1VuelFjOElsQ3VsMUZFYU9vSlA5NmlaY0JkelNB?=
 =?utf-8?B?UXM5UEJKVGxicDU0dXgyR2RSSk9tZDJjT2tCUHJITnFNdmxRRUZsdDliS0hi?=
 =?utf-8?B?a3p3YjRzUWIxR1VpdG96NzZMSzZQZHMyT2FmZ0dHZ1VWQXNXK2lwTDRpNm1G?=
 =?utf-8?B?Rk53RU9NR3RlVk96RXd4RkoybE01MlhIeG1PemRmdU00MTBsU2RIUmZNZFBm?=
 =?utf-8?B?MlBhU1BzRCt2SUkrbUxuTXkvY2s2SjVGMVBaNnRLV2phNGNSek00Z3RvN3lL?=
 =?utf-8?B?N0M4SlZ5SUFkS2dvU08xbTZlSnJONE5BbFp4cHlIRUNNbVNCNFBZWW9nS3lp?=
 =?utf-8?B?K1crZUZ6UUhiZ041cCtTS2tZM3FEa3FxQndYc3lPV2syVW9LSFBNRVE3VUxu?=
 =?utf-8?B?OG8zWmNKektMOHNIRkd6Z1p1NnRFQnk5VGhORnVESTZCWjZualQ3VVM0TU9R?=
 =?utf-8?B?ekwyTmdIcE5JWWpPbGtMOG44UzFUNmFjMi9VMk9OUzlGa2w3UnZyVWt5U1ZM?=
 =?utf-8?B?enBvOGpkdUsvYkszRThLNUIvdWEwMG5aUEFuL2dIWWo5Yndkc1VGRGVER0VI?=
 =?utf-8?B?RjcxQlgzM0Z5RlJKQ09WU2VXdDZta2F4QWVmNG40N05JMXl4SzNkTlJteVdK?=
 =?utf-8?B?dks1eUxBanpiWi9mclM1UlI1ZjVrT0Y3WDQ4RGlqc3VmTnh1Z1Zpckd1NnZ4?=
 =?utf-8?B?alROQURkRWdQdWJxZnJiR1pRTHJ1djBaUzNEZHNpNTh1SkQ5NlpYeTRDTWIy?=
 =?utf-8?B?UVM0aXdXTTdnL3ZlTTN1eEtObDJPMURzdGtyYkgzVlZkUGF3YVcrUHFoNUtC?=
 =?utf-8?B?YVVqUU90MWlEYVhCdzNSR0JKNjZudm9KRjl6OGlaUElWcUhRQkY3STJPamt5?=
 =?utf-8?B?Mkh2N1FzWkkvYUd2eDFZUU4xZTJkdmNObWd6cWxTRm1aRG5XVFJId01zbEx0?=
 =?utf-8?B?bzVGbWY5NlFSYWlSRmZRZ1h2WmNzZ1BQdy9KZDlyZnlXaDFLTUk3OWhyR2lv?=
 =?utf-8?B?cUZmWDVlbEtyMVhzQ2J2VlA5Q1NmTnE0NlBTN2Nxd3JHekVPd2RBSmVaVGpE?=
 =?utf-8?Q?hS5IAU9cbRSGv3lTX9u3zTDIW?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4875f1c4-bb1f-4ca2-479b-08dbf036bf5e
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Nov 2023 17:23:33.3609
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xdzM6mZO787su9hBewHV2IXDouT5bVAKLPnl3psUqgfE0IwQz4rgtEwOEbjSc2uscC7/oXhGK+/Djt5tkzJ33Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB8982

On 24.11.2023 15:03, Federico Serafini wrote:
> Add missing parameter names. No functional change.
> 
> Signed-off-by: Federico Serafini <federico.serafini@bugseng.com>

Acked-by: Jan Beulich <jbeulich@suse.com>

Albeit as to the subject: There's no component named "aclinux" in Xen.
I think this wants to be "acpi".

Jan

