Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 67CA4735768
	for <lists+xen-devel@lfdr.de>; Mon, 19 Jun 2023 14:55:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.551069.860383 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qBEPJ-0003pK-7S; Mon, 19 Jun 2023 12:54:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 551069.860383; Mon, 19 Jun 2023 12:54:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qBEPJ-0003nW-2W; Mon, 19 Jun 2023 12:54:57 +0000
Received: by outflank-mailman (input) for mailman id 551069;
 Mon, 19 Jun 2023 12:54:56 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Jerb=CH=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qBEPI-0003nO-0W
 for xen-devel@lists.xenproject.org; Mon, 19 Jun 2023 12:54:56 +0000
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur01on0613.outbound.protection.outlook.com
 [2a01:111:f400:fe1f::613])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7c23b19e-0ea0-11ee-8611-37d641c3527e;
 Mon, 19 Jun 2023 14:54:54 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by GVXPR04MB9996.eurprd04.prod.outlook.com (2603:10a6:150:117::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6500.36; Mon, 19 Jun
 2023 12:54:48 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e442:306f:7711:e24c]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e442:306f:7711:e24c%5]) with mapi id 15.20.6500.031; Mon, 19 Jun 2023
 12:54:48 +0000
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
X-Inumbo-ID: 7c23b19e-0ea0-11ee-8611-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=THHkCYYqN9tI6wnBkJBPQWVe5gezbsb0DyIHFx8oFx4ceCaWOYadiRSuSm+7hfNDEUgAmnqMROFWyFG6VmvCsoTt0VHVRRTe96hodM/z5NNl8uRF9/uXrrT4NxOXseMCMS3VQTfGm9APcUsakEWIAWSKzmUkngfj18du6NdC+RCc+5n50neuMeKJHEjwgQlpHxLwucDOrasmVv+krB4WDWk/g8yxfTtsAguKZLC/aphOivAfvOW4JY83ki9q3KNcN7kBWbo6Nmwvs3AWYKLJ3wSr7NwSLQkEtLTexcQkgt9G9xceQuQabIOxRdboUxskiH4XZkCPd2xuZsgksAUmpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZFawNDIY5POqWBGLOlzpdsXinNZKlA9OPYPE3hCCqWo=;
 b=WhlCPaPOkknhjpixEB2At3RcMbu6adXfxWlH5ZU8xrpGGTefdHEhXbVvOvOCRXg1hbRHFnUKDeLwWdVRqEbWV93XCu/xJczH3qS+KhN/cuCVDvYifsWsK9EiyqdCPQuBsRETFp0Wl+DgkcGLyrhf2ejT/N9rk9AdIjZpXGGvDigrvfB8g3KZox3l7AsFhb0ktwqM8WbIzqEi3Ajbo52FKbQ+sBqHT2FvBPVqnMWd04HZ9lF+IoNWHsrJGxwvyQE7mUzemRqgXvKtgE8T4ZR85beXU62TDoEk1KoEiz6Z8ASuylzHd58kD82YWfqhdKb1dNwLbevbzJjIeoa16Akafw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZFawNDIY5POqWBGLOlzpdsXinNZKlA9OPYPE3hCCqWo=;
 b=4qeJM/5K5yL7VxdGz4ru4VoRPOw4rT3iTe9nc9POZXWQV2dn0ZgG7MGGl3M5E9alPdMzWS9zOCaPJYmdkMGHdErO7OthujJryzBfgJKPrGQ+liCUVFjIkRk1f8idM4BV+dk1hM+285YEO2kb1vzG8ZtB2KTCQPBHNMH/9LIEjpVeTO4VbSxg2KFaAVNbf7/sOOHxbKQNhuma89X2HB6urIkDgwuFwupVG8INE0sCY/1XymAeDnmCYvL8MxxL69ET2FYr4U21QdF9jw+0FzdR5GXk7BhqNaFl5XItgFnXr7ia2S+FRfS+ebuYwZNvxl9jOHNCcqWesRtbih+fE3pcrg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <3b174185-c625-f1f5-5567-f7d083709f79@suse.com>
Date: Mon, 19 Jun 2023 14:54:49 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v1] xen/trace: remove trace_will_trace_event
Content-Language: en-US
To: Olaf Hering <olaf@aepfle.de>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, Jun Nakajima <jun.nakajima@intel.com>,
 Kevin Tian <kevin.tian@intel.com>, George Dunlap <george.dunlap@citrix.com>,
 xen-devel@lists.xenproject.org
References: <20230619121817.21969-1-olaf@aepfle.de>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20230619121817.21969-1-olaf@aepfle.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0209.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:ad::6) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|GVXPR04MB9996:EE_
X-MS-Office365-Filtering-Correlation-Id: 159072dc-520e-4d43-1e9f-08db70c45cde
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	97SCPotXIjwbt20wDqlP/AoVE+ktgaXkALZVkimJ8RP2jZ4qwSpzHqmXrnnFzXnkWOlWK9eymsfmHSZWqeLyiDX7tvREsXS142JdMIAw4U1Mqk34dnS2ng9PeEh08wAzn97VOf6jEq5oWD0IAZt/EOm0RL8wvzV0qgYQUgGWUSAH07DqMgMBVrjdIgYMkigVIM/wDeaUhY6apSTboSe87BEEWUi9k4v8aC5LzDiCBmTj9X/Z9kIgB9O0mmvkTkSQFIFQE3CbYaMniJ8ZhZFS4FsExro2aIf5HwNW/qPN+sdpw9u2n+rABCMQ4PAhmeqMCt7QRs2FDcGE37mxzgGvUw/2edvjt4O2d4iRK6pevTX3AlqRxk5fthVGHAdTdD0eE5tlbBdYfkRe8+FCE/GbJcCAxPu/CmER5Px0RpIw1fdGx51E7v+Yl/5VoIdkdqI14i0lvw4968HvVi0YbphjoLRBAJWqBJODfg3ln2joAb9l8gbb2LgsKV8Z6fGBQXn1xJhoY7s2XyQJG2B3q+SoS9GpirwncRq5dK2J4YOgVYdSlutVdTYMCRipD6FURokT5wEDJ7dFadCufAKMttctFCO1BfkXZbBjZzWETniNoKl1qStRquLC2rB/7o/3T3jXHXUupwwRYz0aagPk1msymQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(376002)(136003)(39860400002)(366004)(346002)(396003)(451199021)(31696002)(478600001)(2906002)(4744005)(54906003)(6486002)(2616005)(86362001)(36756003)(26005)(186003)(6506007)(6512007)(53546011)(8936002)(8676002)(66476007)(66556008)(66946007)(5660300002)(38100700002)(316002)(6916009)(4326008)(83380400001)(31686004)(41300700001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?OGNHa1c0OHpzdnQvc0Ryb09LVHcvZ0RjRVdJWU14Q3lTL21MOFhpRy8yWXQy?=
 =?utf-8?B?MGsvZkNIMW4rL1JDa1pKczgrUWtiZHZ6NWtVYllWTFZhN1k1Nm92T0x6VDFK?=
 =?utf-8?B?ZjJTYjR5d3JvTlh0N1pWNjd4ODl3Ykp3c2hXdG9KbEhOeVJjUGpyUmwyajdU?=
 =?utf-8?B?UWh4ajVpQ1dJWTg2MUdkK1NRVTNjTnE1VjBKUjNUMkIzUWtVRXhsRXA0SFZY?=
 =?utf-8?B?SUxXMHpiTXlkdmRUZVFHcW1Xb0Y5SjJ2NHpSS0s3azNKdXFDQmlhclBsc01q?=
 =?utf-8?B?REhYcjJnNjJmbnlXZTZjenI1Q3k5N05EbTcrdlNPbHBiNGZTdHJ5clFZanNR?=
 =?utf-8?B?bmViNmlIUUZqL0UrZ0tWbnFETjhQTXB4MUxUem85QWNjUERKZlY2UzJEZm1z?=
 =?utf-8?B?aUJrNnpoVmNYZkNxYTBlaEdmdVdzMTlZQjlLTURHR0F5RkdreGdIOUx2bTZq?=
 =?utf-8?B?c3RGQjloQ28yQ0c4RzBBMzNjVGZzQ1d2RHlMNXZEazRVZUtTVXVzUWk1eDhJ?=
 =?utf-8?B?cFdTRmJKZG1VZnZtY0paOVZxZWVqM1NkeTZaZHh5S1VNMzhiZEt4cS81N1RC?=
 =?utf-8?B?bEhId1dzN1huRks3SUhyVVdZVFA5RmQwOHdTYkZCazA3NHlJMENIMU9yKzlv?=
 =?utf-8?B?MERHZStZdW90V0ZxZWgrL2QvVmZWUEJsR1BIRFZsVTZSM0tsdmlyQjRYTll5?=
 =?utf-8?B?MFNXSkpiQTFDVWZUd1NFMVNKMVNjTWdTcHo5ZXFPMlVVc1J2ZTRLU2FwMktI?=
 =?utf-8?B?cWtHNXkzVU11SFV5c2M0QkgxUVp1dTNFaTVNRWxhaEMvR1BMN0pqTGhYSHBV?=
 =?utf-8?B?Ync2LzF5T1B3T0lXb1JHbm5FUFBDY2hQUklZNElYNjl6dEZZWHJGVGZFMW9M?=
 =?utf-8?B?UnUvaDZTUS8xSXJ3R3BYdDlJRm1Ya3c3U1gvdGxLNmhDbFA0MHQ1YStFdEl1?=
 =?utf-8?B?djVDaE9FMExMRmdGUlFjRGp3MzdkcWxPR0c4ZCtNMEtGQUIxUHY3U0VkdktM?=
 =?utf-8?B?OGFmUXhiMlVTSVJ0MjJFVlhHN2ZhNUN3MldOajIrOTZTWVZObEY0bEtsdzRW?=
 =?utf-8?B?TkZmMkFUYzZWZmlINUk4bm5wYVgwbS91aXVXUElEdlF5YUlnb1ZIcDAxZXRq?=
 =?utf-8?B?N2poU20vNkZoVUMzci84WGtQakFqZzQyWVpmbHVxNU9IZ2xqWmczeENrWGJp?=
 =?utf-8?B?TFVlanpZOVo1d25QYys4Nkk4YkVmMXdGSE1nOGNaS3BJK0JPS3RpSE03Rk1J?=
 =?utf-8?B?elNTWEdsNlBmVVJ5bDVPUWhJRGJhc012d054c2JDNVFZdWpvY0JJUmJkWU03?=
 =?utf-8?B?Q1ptdmVOb0ViS3lScnJqR2FEUjJLRTBna2JBdDlNUGt4L1p2eEFYZ2x0aVBs?=
 =?utf-8?B?Tzl0aFFxMFFzaHRqRnMxMWh3ZUVxclhJWkEwNG5aZ21YS2pOaE80SHpwRkhH?=
 =?utf-8?B?TE04Y2UvcFFMTnd5Tlo0bjZ2Z2laNjVpVTlnRzUrV2I5RVFQeXg5T291Vmxy?=
 =?utf-8?B?eW81dnNoRVNCUjNid2xYZERoY0hqa3FxWk04aXZMbzdkSU5vYnZ5NHQ2MGVX?=
 =?utf-8?B?Uk83NW9aczIyajV1cjgwVXlOYW9Zei82cERIaHRTaloyOTBNUEZpM1NrMklF?=
 =?utf-8?B?bGJYYkpyTGlqbk9qYlRweXpHRXovUWxWR214OHlxSHlCc0pQSjVBRXVETnYw?=
 =?utf-8?B?bkl4dys5YkNoNUZWbHoyZENULzNkY3haVHRBOTI0MFp1VldRemVFaVFNeHRn?=
 =?utf-8?B?MlFVdEdxOEE5WFgySlpTZE04WFJKQS83MkNWdzA4Ry9NZXo4bW9UZDRRS3NO?=
 =?utf-8?B?OW5LdXd6NjMzVG9WaUhMZVpRTi91QXE1RlhFdGEyZjJjSUpNYXBkcEtTUUJ4?=
 =?utf-8?B?NWVWczJqK204MUpUVUd6QTNRbFFQeFNta0FkeGlIait4YUZyMG9mcnVsd0ky?=
 =?utf-8?B?NjdpTEY2M1pCZWZQV1dZdVowdnNtVm5LS09tc2NzRXBiSGE2UUtnRXNDMGkx?=
 =?utf-8?B?QUFrKzBCMW8xSzlscHc1blAvT28xamduQ3ZzdUJXeGcwL2ZpYWJiUFRBWmxx?=
 =?utf-8?B?T0YxSzk1S2d0OEl4THMrK21UVmVDQU8xa1VZOHNuanpxRHhqVGlIS2FXengw?=
 =?utf-8?Q?AAq/r+d9cBfGHySmJwiz6MTYN?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 159072dc-520e-4d43-1e9f-08db70c45cde
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jun 2023 12:54:47.9649
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1ZciGGvd9k1/+ZrZjadbrGI/HqHolnLM8FOLCMzN+nozxYpZ2SkCDN5X2QJcBrkWlbEF1eMKCRYwEd6TE12MqA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB9996

On 19.06.2023 14:18, Olaf Hering wrote:
> There are just two callers of this function. It is identical to the
> checks done in __trace_var.

But it's used differently.

> The commit message of 9a86ac1aa3d2ebe1be05dc7fe78dd6759aa3241d
> ("xentrace 5/7: Additional tracing for the shadow code.") gives no
> indication what the benefit of this function is.

My understanding is that its purpose is to avoid excess tracing, i.e.
when shadow code already traces the event (in greater detail), that the
more general tracing isn't needed / wanted. Note specifically how ...

> --- a/xen/arch/x86/hvm/svm/svm.c
> +++ b/xen/arch/x86/hvm/svm/svm.c
> @@ -2812,8 +2812,6 @@ void svm_vmexit_handler(void)
>  
>          if ( rc )
>          {
> -            if ( trace_will_trace_event(TRC_SHADOW) )
> -                break;

... this is _not_ "if ( !trace_will_trace_event(...) )" (and the same
on the VMX side.

Jan

>              if ( hvm_long_mode_active(v) )
>                  HVMTRACE_LONG_2D(PF_XEN, regs->error_code, TRC_PAR_LONG(va));
>              else


