Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E659C75F526
	for <lists+xen-devel@lfdr.de>; Mon, 24 Jul 2023 13:33:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.568813.888845 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qNtoT-0002ft-Gz; Mon, 24 Jul 2023 11:33:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 568813.888845; Mon, 24 Jul 2023 11:33:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qNtoT-0002ce-EC; Mon, 24 Jul 2023 11:33:17 +0000
Received: by outflank-mailman (input) for mailman id 568813;
 Mon, 24 Jul 2023 11:33:15 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=vJ35=DK=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qNtoR-0002cY-N8
 for xen-devel@lists.xenproject.org; Mon, 24 Jul 2023 11:33:15 +0000
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur01on2077.outbound.protection.outlook.com [40.107.13.77])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e05fde7c-2a15-11ee-b23a-6b7b168915f2;
 Mon, 24 Jul 2023 13:33:14 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by DBAPR04MB7446.eurprd04.prod.outlook.com (2603:10a6:10:1aa::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6609.32; Mon, 24 Jul
 2023 11:32:45 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e%5]) with mapi id 15.20.6609.031; Mon, 24 Jul 2023
 11:32:45 +0000
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
X-Inumbo-ID: e05fde7c-2a15-11ee-b23a-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Fsr+W/tYae4RsrzHahlYMdAq/t1N+WH1yEgCsei3DcP5Ez7v98+spthHUh1BPFvGuM0tc6phLBziAvCMVyX2JQj/vdj+d39NJmk1GhjJAQZLRwJUuRx/Mx8pt/vqCs+SOJdYH5OK6laxqYj/1OS/8j8OcdH57E4StOcoR4eTCGEuoIiuGnmIF3AQfpCXBlej6aq69r7FPghCpj52ZL8qxMilgOV2i8JmR6pvLBbH4ehxf29nnbIPB0ZBlCm/Z1EpmmTRN8uIZVZu+6Y+sDVlL6sivLSpHs5aALQVnQqcuQvuEzHdRyPp077C7u4eqeOLCjFLGVAV2NnUghrx6zQCbg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=j0nAmOsuSQru7srNN+gQZnvtGlciALlomqRWS0jt6go=;
 b=m93c2nDo3p2AyMHbs+CaTpszr4+iNPoC9GkpUcYjK19b/h0MXvMNYOWpL3AZGVs4P5a4nImE23OCFep5+tPXS7BCkfXJkOZ9a1C2bPbFPVuKeZ8EykGpdceWdx88ttYp1SCU9fwapETiiRHk7oF2BJ/p74G2D0CVclGbU5TePN5bslAqmE9DHRMw7gj92g+H47esg8J7voDpS7UMuEJa+XNDuUR7gtxlmdcDcxAkMJQfTtvxo2yzdYKEqAub0r9XVRYuYstE27XlJ0PG7upNXfQa8sRjKRey9cOo240IsncoG+aWt+QhsjSMG13SO/vjD+Zn4bbEvsUNStU3mvxDiQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=j0nAmOsuSQru7srNN+gQZnvtGlciALlomqRWS0jt6go=;
 b=v/v6tN1tUkMcGiNkhXxooup4rIjdaDT/imlB1uNP88V0cMzYVP4yr8YgkDn0PTxiwNmeV83pyR7i+jBZECNuosoORxxVU6xgAkGkkcCC55/tjwYVxdZer6zoJKYeeixkZly/fPPMB28ub0TcRMYKybN7orNgLdKRGLVHIS0Ke8Sb66dxbPwiz+q+E6TY21VxZdY8WWZRmXG0E0hlmbw6azsQhw/ZXZZN+xfn4k0koBUPR6K+vFRq9W9R7GuGwEj1A9Kdbi3UlUxs88/zhkZMIgrw62TrdiQDKtJTsH8xTDn1gaUPC3/dlOw/wgP67I5WFJKzimstj5ymTLHVyTS1tg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <adf14f28-a3ea-1ed8-4b41-24b8caa93f94@suse.com>
Date: Mon, 24 Jul 2023 13:32:45 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v5 2/4] xen/ppc: Set up a basic C environment
Content-Language: en-US
To: Shawn Anastasio <sanastasio@raptorengineering.com>
Cc: Timothy Pearson <tpearson@raptorengineering.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>,
 xen-devel@lists.xenproject.org
References: <cover.1689958538.git.sanastasio@raptorengineering.com>
 <27548375e29c56d87f08be800e38fb85c650568a.1689958538.git.sanastasio@raptorengineering.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <27548375e29c56d87f08be800e38fb85c650568a.1689958538.git.sanastasio@raptorengineering.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0007.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:15::12) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|DBAPR04MB7446:EE_
X-MS-Office365-Filtering-Correlation-Id: b49781aa-f249-4d41-7829-08db8c39b33d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	niG+ii2lV9qM8eWkmyYrdzZ4DnovvblNncknXiTq30UkwhJmsflgOG23h2gP2pF0/vgQ0EIoaxDTYQyw/dfoRby9mp1Qfhe4r1RBmvLXDgISDsvuAhOziCG1lgflshu9TjpDUoVwnf3aEk/RxOfmlsYFpgBS/Fj/ddUhLfSK7jxtatgqMDfCjoNZOe2MsPItT9viVCQq3B2utjRs7P9SGutjHJB/ns8g1Py4napdnlOo4f9emo0Pliiid8S92pRgyK2VqpIu/s9bJcQpvTZr4aaO0WKExhovzRsuwycbyFERerwfKTeptOQ5mvlvylM6HO04BuUdKuM3s77zbzkfzmoYGXbFqDix7pTMwc2m8nIVgeDn0Rvq5uFWf0XgdMIYk2fpfk4JY+k3lS50agYAv8pOL8gkKjpc5C+Kvan+9KlyXUkdJrSLCJip8uwewmkKxPhTRPDXvsdH2aJTf73LcC2/8ObDMIRVVHvIoy+FFRjZuTlWWIIozEwWgY400d642ZdsRR6xTjLcBYkSBe0fNaM41hfbXKeVfoAAIG7RIRZmXiZTyWsWPC4Xp6o7ZQ/jsotMmQHsk7TAx8ykd194t15HQzT0OHTNu9Ox5jFXl0QRJ/JxBVN1+xM/tm7wG3QzT3VMOVJJqUgK57PaNRCPiw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(346002)(366004)(376002)(136003)(39850400004)(396003)(451199021)(38100700002)(36756003)(53546011)(2616005)(83380400001)(8676002)(8936002)(5660300002)(478600001)(54906003)(66556008)(316002)(6916009)(4326008)(66946007)(41300700001)(26005)(186003)(6506007)(6486002)(6512007)(66476007)(4744005)(2906002)(31686004)(31696002)(86362001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MGxRUkNISGc3TjVoNnRnMFpyTld1dXFNUjNHM3ZFSkJ5UW1qR0loS2JJb0lQ?=
 =?utf-8?B?bGN6MUFVSXlYUkJWaGswSzBzMzA3TVY2aXdHalJ1bWd5YU10NkRFT0RqTkN0?=
 =?utf-8?B?WmNFdWF2Z3czZHZWS2I2bmJDZUFOMVlVZWhIRlFlQWl4N1VtZGIydXhhQ3Fh?=
 =?utf-8?B?dUg0d05LV1R3VGkyclBYRmtMN3dzV1dzei9nek5KajZZRWUxYXlpa3lRR2xM?=
 =?utf-8?B?emxjbldMWVU2OUhpYU8yNEk1cnJIRnpzdlI5bjZyWk15TFJuTklxc2xXRzlX?=
 =?utf-8?B?RUNDQ3lleWk1MUUyRVhxWXZqT3FRdlU0Rk5HRnhsQWdrL3U5a1ZMNFlsT2pI?=
 =?utf-8?B?dkxIQnVjeXo5UXpZaUlGMGZidHBseU5kSnBiRldhM3YraGpiTzFvc0VTUVFu?=
 =?utf-8?B?SzZuc2JNK0srNHpodFdjY0lPUDB1R2RuS243aEhDVmZHMS9VK0praDVzTzNT?=
 =?utf-8?B?QUJDWjhwdUZZd05XRW9HYVdCeGd4VUxuWHdQQnBTQWcrYlJHN1owRDFWbVBE?=
 =?utf-8?B?aEE3OXJ4VkI1NXVBT1I5WUs2bVlTQnAvS29Dc21CZkJvN24wVmIrNlNWZHpK?=
 =?utf-8?B?V1VKd2JwVEVlekhBYlJIM3pQWUFwUmlscmxPZ3VXeWxqaTIxaDlaR1lXcWYw?=
 =?utf-8?B?RHlzMUV0TGdZdDlEa2ZVb1k0eE9TdmtiWGk4eDNKK1BtNHJSa3VuQkZNZ1FQ?=
 =?utf-8?B?KzBldEdrMkgraDBsUHA3K2NFY0FQcXl2UGpnNUo4d3AydjVMK3UyUk1oQ2c4?=
 =?utf-8?B?NUdyMWcrMlp0Z0FmbXpnVFZuTG51ZnkvYVdrYjBPWFZkcG9teDhnTzhSeHBF?=
 =?utf-8?B?MXF5VHhiS05KV0J0T255U2VhaGU5aTZHdkx2U0tVSGY1T2ZDWG1FWlZQWTQz?=
 =?utf-8?B?OFNSTHdTVTFXMW5xaktROC94c0drUTVqa0g1K3pTY1pWeEZYcktLVFoxSzVv?=
 =?utf-8?B?alYwc2N3Q0FCRWR5L1MrSWlQajFtVCt3eE1IV2tBaVZNMmVjSVNBbmFVWHFP?=
 =?utf-8?B?dEFpT3ExajFGcmR1SmVXaWNNOWJMNlJvZ2RQVThrbU03Z3NsaldtUU1jUWVE?=
 =?utf-8?B?TEFSN3hWNlZsL0t5TFArZGIvSlEzYzR4ZmExdFhMUTdlbmhQbllERUs4SHNx?=
 =?utf-8?B?UkZmd1RtZmRDWm1Ya1NSc05qNGlIbGoyenBjZmhLOGdHTHVOZUFUL3ZOdUJU?=
 =?utf-8?B?eDh1bG5PcTYySVJQOFVxajJScVJnOXZWRDBhV0JGUnBmWVFSMHZ5N1ZEcjZ6?=
 =?utf-8?B?azFpUG1iam9XMjdTemQ3bUxWd1k5V3NncThyNFRNWTd5b1dCc1ByZkJOMUs0?=
 =?utf-8?B?eFhBanNrYW14N1VBYnUyeTZndHNFNjB6SlJRMTJKKzVYR0xCR21UWU5mN0tu?=
 =?utf-8?B?bXMxNkxjR2RJZ3FETDdLdU9na3pzNG9oVzlHTFl5OEo0OVpWa2lMMUt2V3RY?=
 =?utf-8?B?WitqQWZ3ZVFLSXorNTJBQ2tiNHVzQmFjTTZmM3g2N1dyU0s0Q2psU2lvaTUw?=
 =?utf-8?B?bEQ0MDlXN2FIWC9JT0FHOXUwWHV5NVdabjhVLytyV0M0YWd6NW9Sak5MMG9K?=
 =?utf-8?B?R2Ntckl1UEdZUHF5U0VUaExTZGFubXJwczM4L0Y4dzJUWlc5Z1hZOEI4V1Ir?=
 =?utf-8?B?S1BleDlPN2RyRzRMeUlTSHNkMFY5S3B4YlVVUXh3TGpzQWgvc3p0RTMwUEFh?=
 =?utf-8?B?Wm1BNGxZSHhpVDhIaTJyR2QzU01DbWN6MWZLVGJRVHljdlNTL0diMHRTbFpW?=
 =?utf-8?B?RVFGQ1phSjI2MFludTdWdUdkNmJRVHB5VmZCRWVqR1BjejcrOWhtWHErbXRY?=
 =?utf-8?B?aUlLYkg4SE56b2JGdVVpUE1LbXJBQ2MxRWVVRUxmYmF5elBVcEJPZnhnNlcx?=
 =?utf-8?B?R2RBK1pua1hDQ3g1UDRsTUVCQXVCS2hRcERTeFlJM3FCb2h5endCYVFwQlNL?=
 =?utf-8?B?R2xPVkdNN3BRejI0KzErbTgzRXFXUjMyZllGMnR2WHlEYTBCVUxjU3JEb3Iy?=
 =?utf-8?B?ZGVRRHg2eGE2SDZmczRkcituWGd6WE9BQVBiTWVqdis4NEVtek12bVRGdkFw?=
 =?utf-8?B?ZUdxZVAzMFJJRm80S0UxbWxDajdiMXlwRFY3NkFEYi9TWGp5S0JRZ2NXYmNm?=
 =?utf-8?Q?YtMmWsqyRIdY3DXu4zJz19mkP?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b49781aa-f249-4d41-7829-08db8c39b33d
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jul 2023 11:32:45.2335
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pKPSKyo6rb6fs/JCWMa7/ZXZ8J5GZ+eM8+4n+5QiSje24Dk6NRydIZcNKLOMEWkx3dvdtOt3cKFfzP9i5a0q1g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR04MB7446

On 21.07.2023 19:02, Shawn Anastasio wrote:
> Update ppc64/head.S to set up an initial boot stack, zero the .bss
> section, and jump to C. The required setup is done using 32-bit
> immediate address loads for now, but they will be changed to
> TOC-relative loads once the position-independent code model is enabled.
> 
> Additionally, move the cpu0_boot_stack declaration to setup.c and change
> STACK_ORDER from 2 to 0. For now, ppc64 is using 64k pages and thus the
> larger STACK_ORDER is unnecessary.
> 
> Finally, refactor the endian fixup trampoline into its own macro, since it
> will need to be used in multiple places, including every time we make a
> call into firmware.
> 
> Signed-off-by: Shawn Anastasio <sanastasio@raptorengineering.com>

I don't think I'm qualified to really give an R-b, so
Acked-by: Jan Beulich <jbeulich@suse.com>
will need to do.

Jan


