Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EDB3B667284
	for <lists+xen-devel@lfdr.de>; Thu, 12 Jan 2023 13:48:25 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.476132.738146 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pFwzx-0002Dt-UV; Thu, 12 Jan 2023 12:48:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 476132.738146; Thu, 12 Jan 2023 12:48:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pFwzx-0002CF-Qv; Thu, 12 Jan 2023 12:48:01 +0000
Received: by outflank-mailman (input) for mailman id 476132;
 Thu, 12 Jan 2023 12:47:59 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Lmgi=5J=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pFwzv-0002C9-Sl
 for xen-devel@lists.xenproject.org; Thu, 12 Jan 2023 12:47:59 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2081.outbound.protection.outlook.com [40.107.20.81])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 579c3eaa-9277-11ed-91b6-6bf2151ebd3b;
 Thu, 12 Jan 2023 13:47:58 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DB8PR04MB6940.eurprd04.prod.outlook.com (2603:10a6:10:11a::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.19; Thu, 12 Jan
 2023 12:47:57 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2991:58a4:e308:4389]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2991:58a4:e308:4389%7]) with mapi id 15.20.6002.012; Thu, 12 Jan 2023
 12:47:57 +0000
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
X-Inumbo-ID: 579c3eaa-9277-11ed-91b6-6bf2151ebd3b
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XkXJKszHgtwScjrSDfu1kesMGdUZT17Z1KT5a404LKcOKJE7BUk5FtxtPckmWJbOSjErs44bmzOXiuVFCd6Qmfe+UUuFzC8TTfLxbUJfZxGWriK6Dys/c1bYNBfdTArwiIhHoSREEPTF30QBowpmBW4o/ZbdhVemufEOlra29UxW+zF+ijDIi1EwslRgMVDGcsv4U4cgUtP6Qw1zMIGXcJ+Mjlhk/RHMUQ09ez/WNZAUh425WRF3ObJMAb3CZYqYHJcfNbuNb5BkTqx4fSaJp1hU91RYB20v58sDSUFMZJvCVV3c1QMo+9jwK8D/TiQG9wvyzE3dR6VOoQCiPIQ86A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+5nq5y+s6CvaJEydMt/0aW9bpCFjZb/jW5gJ8rxtVn4=;
 b=Zpc83K78loaQ81jVqnhR3/txwi9hJ+sTdGZlkzAEZNzKsFIRHQQkMdXo4JwtoZNP4+Mw72GuU+7Ukq9ktxbyqv9PpEQ4n+AYgkj+d4AcgNst/QZxCQ0o9Uo9f1KHjdSyP8PAUewlJ0hgcRjVoOyRKeEEpMPHytmX3IPFO7Op5X3gXMxq4ZWHynJ112RY0Yy2Y1gZYZvp6KkU2BK6RdRSH18SVqFpgvvNm5hbiHVfGUnwKGENjasAtJg70CQmAgi5IxHG5SNQmVEJRjrUUmEl2m8Xo87rCHksyUcMPyU0mxcnYKAsYI3AMn1G/UceAllN9y8lei+ZNU784HuPUP98cw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+5nq5y+s6CvaJEydMt/0aW9bpCFjZb/jW5gJ8rxtVn4=;
 b=MC0W8ulI+5baRyVmOgIiHEmjiZyZ9YmjmP1KUkBExzDxHeiYOHWH+yBfgXGxm+JzRKQ29UqmQlhU2Ew+9XrUECZJgrAa3zBLVhH5HSGbm+ZPMaiHAsFSQt3HVt6+Nnw2+f1qYe4WMWoYAfRAbCHV/zUmeBwFaH5hpQ886sPpWhbk/W09vsM/L1c8TSwoxwfwvuyC1uiK49BGHN9Dgs2XoE4QDto8yoPH0nbxCBgJQoo3EhZITvfjllhidm6PohMWkJV3ejIFKNTnLFUbExLQr8mAo+KSr81FQgsJ9uOIQygaih4jPSJBtFAvRhSpl4dF8X1Mc73s8uPfPr0F/t+bBA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <27d830b1-a32b-1368-3c0e-e5de15da5000@suse.com>
Date: Thu, 12 Jan 2023 13:47:53 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v2 1/8] x86/boot: Sanitise PKRU on boot
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20230110171845.20542-1-andrew.cooper3@citrix.com>
 <20230110171845.20542-2-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20230110171845.20542-2-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR2P281CA0030.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:14::17) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|DB8PR04MB6940:EE_
X-MS-Office365-Filtering-Correlation-Id: a73ac689-367b-43e0-2b90-08daf49b3aa6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Nl9RnMG1iwqpukWCqXYM1+zj8qTYEug5ifEc+dVJF2WU+5EC0wnPuJ+FmGkX4SGyaQ6+yZwE6Pie8RPCt2Si61iwj+if/dixJZHK908Dd1W+eOVW81J/oTwOO7h1YJ+IBqBpuZcl8dcP/3e3AmFICnAPJFZczfeutciJz90HTO44wyHmXm4bNxy5+BjjzmJIJWxYHRk7Ako/8K+MxkDTbCDSS0WH4zxVQC6QrrPf1o4SMjxbNKODWT3kCm1LtE0wc0w/PJs20lbLZYEx6I69MEKYcsmOGUTbkzJhHPpXY0Wdm2A1yBGCp8IehEtz7NYYIG9e6cWW8fYkL3pBq2CPzExjacBRMC+0ODoLByNLdPzOqY7OPyTA0ytb14uGO0dfVpff9FBmLZokLlH+msEu1iOUiFhKT2FAC07j6vpctmkql8A0uSbr3BYt+As6LJlVmKJYMiS3t+4Y8tVzDF1ZLKDfRKNKbp6iEkJ9FoMQKiEgZp3PLyAblg8iPHH7fPIgXCZCHmUVnXrpzgMHxQpVixQLhMNHgaObTuNIvN2vtTbCt6K3zN/DsPjvFwnLXRegAVUpLtf+LjzWTXPeNJmFsKIIrRDRBE1Gz2l7QnuOsYyy3tXbHRIatoxN7TtM+cOZ19Hci+eAEE+Jmp0jVszd0SFdzy/N03R4GW3Nrg48zYOyhrfEKbOqnAxcvhPv46AN2EC9qgZQ/EEQZ3f1d2I2nAHGIQZ2EdPMLo1U2rTPdKg=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(39860400002)(136003)(366004)(376002)(346002)(396003)(451199015)(53546011)(186003)(26005)(6512007)(6666004)(2906002)(6486002)(478600001)(6506007)(31686004)(66556008)(66476007)(66946007)(8676002)(316002)(2616005)(6916009)(4326008)(54906003)(41300700001)(36756003)(8936002)(86362001)(5660300002)(38100700002)(31696002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?T05kQkN3cWd5cVd1RDlsQVQvaGdRMjRNOEFnL0lmbHFvMmthSTFNU1E4alRt?=
 =?utf-8?B?ZENNMnhKdVczWmV5NUtaZ1d1YjI3TWtPYzZKWi9yaG45eWIxYnVSWjQrR3Js?=
 =?utf-8?B?YmY1bnU0anY1VFlvNEhyY29XUVFBSzd0OHRUZ010ZEtnOUgySzBleG5yelhD?=
 =?utf-8?B?UDlyRTdLdXltb3hidWVUQnVPQ2llWDJ3U2ZXajdzU1lNaWZ4WG1NNURQTVVT?=
 =?utf-8?B?eXdMaklwdTdPYWZvZUNsZ1NZRHZxTVpJVC9tL2l2K3VxMU1MNElWQitxQU1I?=
 =?utf-8?B?dnVaZ0xwajFYa3VOeVJadVQ5cVBBTHZJWUJYdXcwTnJwUENMaDRyK0tkbXdK?=
 =?utf-8?B?WEtGbkltTDJsQkIvZ1VjWGFrcjJtUVlkTFdac0VSclRmVk5PaTBzV0x6SS82?=
 =?utf-8?B?cWtqVzA3UUNUdCs1TEJBVEI0UDRFWEMxVWRIcmZJTFozcWNXdGtLVG9ncllY?=
 =?utf-8?B?d1VPRGcrekJROElyUVFJRzJKd3ZEcll5bVNGRlVwSjNQYUxacGtqcjM5MVVv?=
 =?utf-8?B?M2xtTFNhckFwZDFxK2VucUZEQkFHTWJNS3BQbGxENGFNNW1UKzBjeVNBb1hQ?=
 =?utf-8?B?dTFUOTFDRUpubmhzamo0WU12bXNOWExaVy9OT084YVcrcUo1YngzOTJRS2Nq?=
 =?utf-8?B?bmdQZjVjQkx4dEt1S2lsUjhUU0ZLY2s5d3d4MkgwRTVQbHpKMytsMzNUSmgv?=
 =?utf-8?B?d3cwdjVaeHFrVW1NNEpWL25pMTY4OE1MRktUQUFVZkhZRldvQm1oL1U0R1hC?=
 =?utf-8?B?WmQrdElKQzBaSHRGbjI1RTN5eUFxRDUvaHZzaUpta1E0S1NaMUxIRHRYRVJW?=
 =?utf-8?B?U2xZVnRMR3ZOMGdUTWl0VDZOMkZ2TTB2aW9VVTJJWENJQXpBS1NHb2hrMGpM?=
 =?utf-8?B?QnZsdE03U0hUWXk2MkdtMmNSbEduUVVteW41cUl4bDg3TUxncnRNaFB2WTZC?=
 =?utf-8?B?RDBnRGNoeklkcmdxNWhQVVQzR0M4QUY3SGlTZk5VK0huQ0p3cmFsQ2FwSjBr?=
 =?utf-8?B?bWxETERuRjgzV1lVUmY5U0ZZR3dXeTJUNzVMQ1RkYUs1WjBhNDcrUHAva0xR?=
 =?utf-8?B?REdvelJRdDh6NnNtejk0NWZGcGEweHJZRHFNZk5GRXEvd2wwcHBTM1NBVTI4?=
 =?utf-8?B?cnpmMFhvUmtOaGhhYnd2dTd1ekY3M2pkTkswbStqMmRSSVZ1cWdJeWVUWVcz?=
 =?utf-8?B?U3Vrb1JDRHg1ZjlPTytpM3hndkNHaGZWWC9oL0VsdVFQb0JFdlhYalgwaWpr?=
 =?utf-8?B?cVJNdHZCYjB5QkpGWHBUTDJxNG9UNmY2ajJ3VEtDZDIwU2IxWjdJcTRaRVNN?=
 =?utf-8?B?SlhRRUptZWZXeTNOZVgxSVBSNmNob2NKUkQ2Y282RjN1ZGliL0Zkc3RIYlJ6?=
 =?utf-8?B?d1lrT200UFN2NkdNTk93WFZzdlh3dWl2MTRCaGNlRTF5d1g3MEo1TjVlR0xt?=
 =?utf-8?B?RjZkTVlyQ0dGSTkrZFUwZUtwUmV4UXpwTVRZOTVKbHpFRi9vQUNUVzZCTlpp?=
 =?utf-8?B?MGU0c3IrSUZ2azlFSWwwMGxhYzNJRXdpdEgxZW1QQ01hOC9yR0hYaHZHMFc0?=
 =?utf-8?B?eUFTV2NvU0U5RXdCVUtVK3lxWk8xeC9vZWxuK1VGOVBJMXRpUGxodEZyc014?=
 =?utf-8?B?WnQ0VXEwSkxpanVpc2FSbGxnT25VV3kxV1kyKzIxU25FTmduYzJRcStCRWN0?=
 =?utf-8?B?RHBKR2VBdTlvM1lXcUJWYTFOWkJ4QjVNR2xhejZORVhtTkFnREpOdDZ5L0RG?=
 =?utf-8?B?SmlXMGh6MHhvU3Q2OEduK1RLcU1YelZkUTNSNFVlVWJIMGEyRERhZHpCem1i?=
 =?utf-8?B?V3pPQXdubGwvSDZNVnJTUjM4S1BKVW1ELzYvTnlGbGRSQnZoS09QSDIrajFW?=
 =?utf-8?B?SHYvN01QaEEwNnc4Z0dpcVZmeElQV3Z5aFVMTWFKelpPWEtBWGdRNVJ0WCtD?=
 =?utf-8?B?TXRnN0IyNTBEZGJpL2R6Z2J6VmFBSy85OEdTUFdZU0gzeS9FSWNVdkFYYis1?=
 =?utf-8?B?dUVCb0luaU5NWmdpd2RhK0JkY1NndFJLdG9NNGxrZUZoakh6am1XbTgxQjI2?=
 =?utf-8?B?dDhZazBFTmVqMlBudjBiZE5EaHd3K3FROGVzdjZNT0hDd1NsTEdDYnh5R3JS?=
 =?utf-8?Q?elIyX32zyS9bS2AT7cuPH3P4s?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a73ac689-367b-43e0-2b90-08daf49b3aa6
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jan 2023 12:47:56.8985
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gfXggpVTfweQlmHh47YLjNXDQJeTvFqfa3hvz4Vr0eNwEDZoixkX+EO06dzur1QYSUIOOeN5YYJMZvfxhTYIlg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR04MB6940

On 10.01.2023 18:18, Andrew Cooper wrote:
> While the reset value of the register is 0, it might not be after kexec/etc.
> If PKEY0.{WD,AD} have leaked in from an earlier context, construction of a PV
> dom0 will explode.
> 
> Sequencing wise, this must come after setting CR4.PKE, and before we touch any
> user mappings.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> ---
> CC: Jan Beulich <JBeulich@suse.com>
> CC: Roger Pau Monné <roger.pau@citrix.com>
> CC: Wei Liu <wl@xen.org>
> 
> For sequencing, it could also come after setting XCR0.PKRU too, but then we'd
> need to construct an empty XSAVE area to XRSTOR from, and that would be even
> more horrible to arrange.

That would be ugly for other reasons as well, I think.

> --- a/xen/arch/x86/cpu/common.c
> +++ b/xen/arch/x86/cpu/common.c
> @@ -936,6 +936,9 @@ void cpu_init(void)
>  	write_debugreg(6, X86_DR6_DEFAULT);
>  	write_debugreg(7, X86_DR7_DEFAULT);
>  
> +	if (cpu_has_pku)
> +		wrpkru(0);

What about the BSP during S3 resume? Shouldn't we play safe there too, just
in case?

Jan

