Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E9D6E4E2E3F
	for <lists+xen-devel@lfdr.de>; Mon, 21 Mar 2022 17:41:09 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.293097.497852 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nWL5V-0007tf-E3; Mon, 21 Mar 2022 16:40:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 293097.497852; Mon, 21 Mar 2022 16:40:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nWL5V-0007rs-B9; Mon, 21 Mar 2022 16:40:57 +0000
Received: by outflank-mailman (input) for mailman id 293097;
 Mon, 21 Mar 2022 16:40:56 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=svEr=UA=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nWL5U-0007rm-4N
 for xen-devel@lists.xenproject.org; Mon, 21 Mar 2022 16:40:56 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ad52addd-a935-11ec-a405-831a346695d4;
 Mon, 21 Mar 2022 17:40:55 +0100 (CET)
Received: from EUR02-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur02lp2050.outbound.protection.outlook.com [104.47.6.50]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-26-_K_zkShZOEeQQiRKMQMDlA-1; Mon, 21 Mar 2022 17:40:53 +0100
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com (2603:10a6:10:2db::16)
 by VI1PR04MB6863.eurprd04.prod.outlook.com (2603:10a6:803:12f::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5081.22; Mon, 21 Mar
 2022 16:40:51 +0000
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::fc39:fd17:1086:307a]) by DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::fc39:fd17:1086:307a%6]) with mapi id 15.20.5081.022; Mon, 21 Mar 2022
 16:40:51 +0000
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
X-Inumbo-ID: ad52addd-a935-11ec-a405-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1647880854;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=JfZqOObITnHks2qi+5ymyLUquPTDq6tZg3/gvToYs6s=;
	b=B9/+LIyn8mml56EEmRlNoX9s0JjNoZKuZLd197UJ/lV74+Bq8CvXXD2vxpNtf48vyi2wgD
	pM2g+a5GWoak41IOoJiGOBwZjSyFM6vjAgRhyGM7s77EqR2zRQ6e0+jf8LnI+vaUj9RHj4
	f9FweZENWa6U7wGdTatxe2MauwvNvps=
X-MC-Unique: _K_zkShZOEeQQiRKMQMDlA-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CmW+omQ16DAlTqQhmBrxq5YGBbhVUYwnWRpLPzEHszHVgvtb4jzI5iXH9KGUjs6TsxCxbftjOSF9ogLIZstyd16mM7xQEi8f5lSq1Le6lt/0rjXurA+13nIUfL5ZEqbgocKzHh5YT131fc79rOxZXeyfSPIOqnroicv7JuWP8U8Fq4WFp3oz9w8EKSN/EPOfPG0WFuhFadf/4iuPd3QG/LA/iTaJkIyS9AAs28jZQwkhWVi99kZ0FnnJHthCW0GlKC4MsMslkYv6b4Ad+iEn31rQcyCujmjFFe18DAMNrADGocvOVtuwZOtSC18pxz1hEoQ8ZEytzsI/9X4yZ3iKsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JfZqOObITnHks2qi+5ymyLUquPTDq6tZg3/gvToYs6s=;
 b=lIX/AwzYvPaGyQ8Fer6rEQd8R+qQhq227d1QJHtVm9aFrFBPZuGJSMXChjoVREhm8hiH+J1NxriTbBji6qHZgS72npmIecLzFmIetL+upPylYzE4FAcpZRN85+/WfEnsnZuT5sTHtJ513sEpECuihl9BZrI64Vqo+tF7aIF10/3E8SFVUx0TMpgZZBrgqtbdKMtku3BeLA7St677nta7zx+X5wzbhGqwnD8unPXuPJ5cWyo93s/HMiZi0FgoUEoPL55XlyF/GHL3V5TLHeoV9d2jQwUeQMGofi+loh8BPf8KAU3Ve0JDbuSj+dVrkKRKtuIM1SXC/1qsW+J8SRBc9A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <90cf10b5-b0de-4589-f1a6-f8c392c924f1@suse.com>
Date: Mon, 21 Mar 2022 17:40:49 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v3] x86/vmx: save guest non-register state in hvm_hw_cpu
Content-Language: en-US
To: Tamas K Lengyel <tamas.lengyel@intel.com>
Cc: Jun Nakajima <jun.nakajima@intel.com>, Kevin Tian <kevin.tian@intel.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, xen-devel@lists.xenproject.org
References: <84f15b2e1bef6c901bbdf29a07c7904cb365c0b2.1647879687.git.tamas.lengyel@intel.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <84f15b2e1bef6c901bbdf29a07c7904cb365c0b2.1647879687.git.tamas.lengyel@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM6P193CA0091.EURP193.PROD.OUTLOOK.COM
 (2603:10a6:209:88::32) To DU2PR04MB8616.eurprd04.prod.outlook.com
 (2603:10a6:10:2db::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 96bcfcc9-5a08-47d4-f62e-08da0b598f8a
X-MS-TrafficTypeDiagnostic: VI1PR04MB6863:EE_
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB68633E4F882C30162465E061B3169@VI1PR04MB6863.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Cp4AggwHLBIEUr8myT9yLFNJQZdlS0QQFUKBQuDDfIruUn1hTxoQ5ERjRdFAZbHKgv6SbbhhkOT7cK1QiLqQVb5P77+J4TLYmVHKBg06Lf4ADZQiHPVe2QZgbfBhWqBTUXxmHXt+47CGwuSd2ziP6mwnZvkZW2Epup0ke21QT7q+0qzID41Ul6Z60XNbhgKA0rTCM8Ba4RmKSwC7ZWsZfa6Eg5/inCPsetPjJBnokxCfYVCiKZBzzyCtcRcjvaEw6xNDkky1tUVBDLT+rjOnnDYBpRZ0QqAtJMnk9gf4QN2EswKKPZoV0IDDf4H8g79U70ds0SyMVQ7wft9vi9bxxmLcGG3fMNmFGeC1zqxsUw+drTVqaXNaa8N2BURdjRqf80iJF8r1T2W4C8Q0Ua7JsqeZvy/7XJVWvHlMl4q+hEvlT02GurA+xKAgs3Eo6SrOQLbQ++EfNchQpzhcpPPt5Mg8kcrCcFNGHg4opvqWtDqhwYYyNUtdNKLL7QP7dYTacijN6wTW0MtIFLTW37WzAeORJU5iyB+rlwQkbQAk8zSGk4FlQS149Tl6AlN1Eq1oZWsokEsDJbzYrIwHzgv+UK4JPYUvhKxf2tTAch8qHeib9yDoEaRncBovhtU4DtKs+dAxJgAwMBg6JtQ3nly7TUhNCxr1Q8mr7QYhYCcPE0YfnOOgmlbrDq/u+AoA7Xt+RY+w1SWG9YgyzyWTHkrmSm6Z5IxhH75biz4Mv//Q1Ok=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8616.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(2906002)(186003)(26005)(38100700002)(53546011)(66946007)(6506007)(6512007)(66556008)(4326008)(8676002)(2616005)(5660300002)(66476007)(83380400001)(54906003)(6916009)(36756003)(508600001)(31696002)(8936002)(4744005)(316002)(31686004)(86362001)(6486002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VlIzQlZZREZ2ZjJvYStLd21mb0hPYTlhREtLN1I0Y3ByajNDRzR0OUZLdWhC?=
 =?utf-8?B?RTl5bHg1REZVRDVjWjFOaHlJV0w1SzBFM0VoTFlNU25tMmZpOVZURGQ4WElR?=
 =?utf-8?B?TGN2czRHTnhXYmFsUTR3Z1htZlRlZFoveXIveWc3dm1uRWhkZVZyRHpQNFB6?=
 =?utf-8?B?VG0rbmkzL2c1ZS95aWUyQmVlL2hhTU4vbXhDVU1BYlVRTE5Kc0grWStJYXJE?=
 =?utf-8?B?UTQ2ZWdYRnFlbDNPcllLNFQ0MFhNNytnS1YyeG1GS25kR3VvYWZUZ0trZDNL?=
 =?utf-8?B?NGtDa2ZLN1FJNjFLWk9vRDJOOGNXOUVpdmcraDdQVVF5UEMyZVFNOWJWVkNm?=
 =?utf-8?B?elZpVnZWd2laQndZM3VmRVp0ZFkrbXFkakpEWitxcHlnM0tENDVFVGVsQkV6?=
 =?utf-8?B?V3E1UCt6QU03dElOdklmQWFZNEJCK0NWZ3NCRkFzUzdTbWQ1c2hSdFkxQmFm?=
 =?utf-8?B?MzF6M0xIQkt2Tk8rWHhjcUVPRVhzNzVVcXBTT01XMXJxYTQxaVBrVmRwZGZD?=
 =?utf-8?B?eURKQkFuaVJkZFYwQWxtM0ovdEc1UVRWOU8wamRCbE5WdXZQZlQxUjFPYWJi?=
 =?utf-8?B?cFF0eU9acy85U3ZoNU13Ti9keXFjRUUwMVVReVBGU3BRb0FvMDJCSkFZcmV5?=
 =?utf-8?B?QnkrMWJ3MCtRWDc3ZlpaVHhHZlVyb05QQlM3RTlZZnd5allNL1ZvMm1ydmNQ?=
 =?utf-8?B?ZXRFQU1DQ1ZDVXJDTkxNYVY3SDJXUEhIY0FFeFRiZEhxeUFUbjk2OG9yRFJm?=
 =?utf-8?B?YTUzVUh1MW5vSVVKejU3UWNpWmExN3ZOL05CSitQWGtMZ3ZCMlBkMXVheVAy?=
 =?utf-8?B?dEdXSFJNZFY0TFBIZkM1alBCRGFpL1FvTVQ0STdQejJVNytFZXFNVWU5aDd0?=
 =?utf-8?B?NktRMGIxUjJEQ1dLOFFwWGMyVVFOcytrS3FRc1dwTllsTnFpZ25WVGlsZzNJ?=
 =?utf-8?B?WWtNRk90MHYxdGNGWm04dDYxTFcraHRkc3l1a0VYb1lvcnVvaW1XSmNIUnlZ?=
 =?utf-8?B?bU9tclpOak9DVGNVQUhzS1R1dWF6YXJiWm9DRFRPWUxHOEJzOHBaY091dWRW?=
 =?utf-8?B?RUtxd3N2b3FJRktPY2dncmxLdkFTekZ5Q2Y0VExIUXhHRHcvVGZQeGlpdFhV?=
 =?utf-8?B?ZU1OZVpRTXptOVl6SWhva25aL1lRaUhYVGxGUkNlY3RUcHlYZFJ0b2xXTy9Z?=
 =?utf-8?B?K003M3U1ZHllcmpNRXhEbTVRdzd3UVRZUnYyZUoyYk5XNkpsalFZZkZhaVB6?=
 =?utf-8?B?UGoySVJ2cHViclBacEVmeWlzeGZmZW53dmRNRVZNRVVtY1BQZ3ArSFdnQWhz?=
 =?utf-8?B?SjE0dnRKcGMrNldYWGgwblJjYWczVE5XWFpTbFhSa3RuZEFiSmJYd2pTdGEw?=
 =?utf-8?B?Y3FERms1RnVTa2IwMGFGVGdFTWVwbkVtZEhtekZXNjVZaU0xL2F0LzBZaEY5?=
 =?utf-8?B?SVR2dDBjSndhSW9sVkJFTFFYUndsVFMwb1VhbHJsNVNFK045cDhsbWVTc1Jo?=
 =?utf-8?B?VEpSeTRQcHZ6S2JuVW52anQ0NytrVWlxaDk1TllRQjJNZHpaOXFSSExvaGow?=
 =?utf-8?B?L0k3TVNxVUVvVjFkRjVMMnRHaGZVSUR6dWlWWXZ1SXh2eVNJcjVPY2dhK2xP?=
 =?utf-8?B?Ky9OTXRXY3lSQUl6bE5WQlVpTm11WEFzQzhtZTVORGRvY1NZekpsRGJRcXJG?=
 =?utf-8?B?Ly96ZmxQMmVTY1ZYQ2xDUjg2c0RtK0F4SkI1OERRQTFxVy9kRitIYnN1T0ly?=
 =?utf-8?B?SU13RXZpdGN4K0lZOUFzWW5xNGI5YjhMdWFqYmV6aHBEZjk0N0NnelpJZEVI?=
 =?utf-8?B?clREbnFVNUUzOENTZ1RUZ1pmSWpDbE1zRXNuVkJWYi81eDJ4SGI0c2JLeC9z?=
 =?utf-8?B?L2lSbzBsN3JnWnBjOExKYUUyWFZqQ1N0WGwrNGg4MGV1NFAwRWhOUk5jVTM4?=
 =?utf-8?Q?ERiTEUrPQ1ebJ5mm3WGB+dJw1YLU3nRW?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 96bcfcc9-5a08-47d4-f62e-08da0b598f8a
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8616.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Mar 2022 16:40:51.5527
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GEen9btvI1gSvUzNwASCBTN79MQPDL5nBEOS+fWWTMmzGa7QM+3ejrzY4MPq1lpLVMCzzYWILSwfwJ9A4MWHfQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB6863

On 21.03.2022 17:26, Tamas K Lengyel wrote:
> During VM forking and resetting a failed vmentry has been observed due
> to the guest non-register state going out-of-sync with the guest register
> state. For example, a VM fork reset right after a STI instruction can trigger
> the failed entry. This is due to the guest non-register state not being saved
> from the parent VM, thus the reset operation only copies the register state.
> 
> Fix this by including the guest non-register state in hvm_hw_cpu so that when
> its copied from the parent VM the vCPU state remains in sync.
> 
> SVM is not currently wired-in as VM forking is VMX only and saving non-register
> state during normal save/restore/migration operation hasn't been needed. If
> deemed necessary in the future it can be wired in by adding a svm-substructure
> to hvm_hw_cpu.
> 
> Signed-off-by: Tamas K Lengyel <tamas.lengyel@intel.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>


