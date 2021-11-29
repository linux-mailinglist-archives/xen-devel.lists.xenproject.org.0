Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 59E444617EE
	for <lists+xen-devel@lfdr.de>; Mon, 29 Nov 2021 15:22:49 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.234585.407107 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mrhY3-0002O7-Ne; Mon, 29 Nov 2021 14:22:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 234585.407107; Mon, 29 Nov 2021 14:22:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mrhY3-0002Ln-Kf; Mon, 29 Nov 2021 14:22:27 +0000
Received: by outflank-mailman (input) for mailman id 234585;
 Mon, 29 Nov 2021 14:22:26 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=LLD+=QQ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1mrhY2-0002Lh-5R
 for xen-devel@lists.xenproject.org; Mon, 29 Nov 2021 14:22:26 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c5bed78f-511f-11ec-b941-1df2895da90e;
 Mon, 29 Nov 2021 15:22:24 +0100 (CET)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05lp2104.outbound.protection.outlook.com [104.47.17.104]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-22--ldl1ypJMSCB1RmD-_U5OQ-1; Mon, 29 Nov 2021 15:22:23 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB4847.eurprd04.prod.outlook.com (2603:10a6:803:54::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4734.23; Mon, 29 Nov
 2021 14:22:22 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe%5]) with mapi id 15.20.4734.024; Mon, 29 Nov 2021
 14:22:22 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AS8PR04CA0006.eurprd04.prod.outlook.com (2603:10a6:20b:310::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4734.20 via Frontend
 Transport; Mon, 29 Nov 2021 14:22:21 +0000
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
X-Inumbo-ID: c5bed78f-511f-11ec-b941-1df2895da90e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1638195744;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=dPfwG5bep37VB0qMY26d4FN947iRUIVyCDL6KVrRCMA=;
	b=cKm7IPFfjcxvVEyQA3QSQf/W/z5xXn2KbL7iInqSe8cZpj62RelK4XTctreqRGw+7IjbdM
	G/TIIEdehlCqo2WX8InoS6UcF1xQW4js7vSysI64SYl94LS5hBIcDYV1QAFePhUOSv9DhQ
	vTF3H8Y/Y0YF70Qfx/G906+vtB7XZK0=
X-MC-Unique: -ldl1ypJMSCB1RmD-_U5OQ-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=n8kHpprCWFjjrqRNN4LHXKbu4BogCYw85M1KPsKEGcUfzGcRlz/Xuzu5PoML15gyEj1TAd0MX7mUVm/s0o6L14wCmRDPHbNYrAvON2srBvVPO20vsszk7mgyJZ86Tphn8axPeTL/Gy3m0z0yLyPzomSuO+phsvlXLXV6ecpW5dXsS2OfHIfXL82VVgBzPvUZwPmMXXSMSsMnNpmoQ5r5JLLIACFbvJWiavuIbnATGjpq59BD4zNEo4wm/ssZcWAac5f/51zEfWa+91GKeITJbjiq5ynaQ7rVp2ZEQxdRGCa6EtzXpwJmF7n1htb9QrlorUPKVQVl1vHvijx1GzEyNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dPfwG5bep37VB0qMY26d4FN947iRUIVyCDL6KVrRCMA=;
 b=liRXls8DlBZiuvG7jiaIW+alYLF4kR6ZpnwyH9QRRgqkoijmYtQwGL+hGZlbirGXrd5KD/D5COD9li3nh5ci0vEJMZqRB4h6eb+zdlgmXwHPHtY4dujP7fFw16BmyFIdKFQWtqbiAA24UhwqEM9wAAYB57UJW0CV8aa8UyrpE1LSaO5B3NoxPrwuMuf9jxtblrfcqMZmOW338cm5p1ZJhPZKtpRUf0ynWBJuedS06wtdyMgSzkFbPFmqnMWAT9lLLV7rAa3e2pPslBBewvLq3mA+LIWn9/WJixFS8ysHj98SSSdXum1j1LZFacun4khJB//DiPYhU8bLKRo5R6523g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <be093075-204c-95e9-8506-841d9bb37aa8@suse.com>
Date: Mon, 29 Nov 2021 15:22:23 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.2
Subject: Re: [PATCH 30/65] x86/emul: Annotate fnptr targets
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20211126123446.32324-1-andrew.cooper3@citrix.com>
 <20211126123446.32324-31-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20211126123446.32324-31-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS8PR04CA0006.eurprd04.prod.outlook.com
 (2603:10a6:20b:310::11) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a2e7664d-8f9f-486b-b735-08d9b343a867
X-MS-TrafficTypeDiagnostic: VI1PR04MB4847:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB484727BA55180D79908EC351B3669@VI1PR04MB4847.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4502;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	mtg+wK9b1yVwIYfyD7vUBtuwFj7FTnmWzk9PVj+Vc5/bDMI6xJ5dvyorZP36lTEd3UdWfBd0X3xChuQF4CyTmduoQWfOjch3ldgIRsEH9/QLdhu/XVHElnEfoRTuTq0/0/GWfrpxSGZCXIgw+1CvjNX9BnFLnBrjUWE1wxMrJv/0EUGZLXh8E/dKIIIcsfq4VQdFdkocmmPzQaBfu3eq0oDGit7VWbcRTRyVG8dg4FJH7ZxBPlvIMoBTD5Kb0Zgi6z6O5dYBZuQwXd8IT6z3oVWtcT9BSDnIx4M+OhB1PTLqRWxo7tiHUiok6tvUYA0et1N90Qrq0ewUiY85MWe+rcVyycWK3bVwAEW/kBe/Sz5AY4/K3sY/uOpN7z3u0MG2cVcsCp2TIs/u8SSmanZLvOT+Loq6Hp07nPqp9YAg3J70smgXMXTBqRQV8vqLy+WJqqJW3Xalfhkt7JBVHqn6dX2m0oPQ2e0rK5hOCMjM9krN7xhSthDIhri9M6g0RnE5mtIHzAD+oJd8hl4AHtxOpI+w8tLgQbcJE9kplQ8GFvlCbwVpAJR42Ub0Hpc6Hkru8ZuC1f+agHAZYc2mOxurBfJIn1yYHshAW9yfEkPm+gmPXnb3A0hVA4w76FsDaOcjSKaFn/OH5tafbdCZtQJzY8wCRu2ol7/BKP9slMZbGpLZTrsPVI6ITvu7KC6cx9feqtxDKpFvUnvZeZaPOwO20OifSFbOIfJ0KfrIyU7PT90=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(2616005)(2906002)(8676002)(36756003)(38100700002)(26005)(86362001)(956004)(66556008)(66476007)(66946007)(4744005)(316002)(508600001)(5660300002)(4326008)(6486002)(31696002)(16576012)(8936002)(6916009)(186003)(54906003)(31686004)(53546011)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MWxibXkwcUlCLzZuK2FiKyt5bEFDVGk1cDArb3cwaEh2MDgxMnN0ZWVaZXlw?=
 =?utf-8?B?aDBxZHdOWGVWUCtGYmxDSUpyYmdBZi9RSWZTNjl3RmdCU1RlSVNNL3FQZ0dM?=
 =?utf-8?B?M2JLTzNrUGlFNzVpTndNU0JaZjMzWXJFcm9vdXl5RzluZkpMU2x2MzY4K3RV?=
 =?utf-8?B?bS9wTGJpZ2FuQm5ucE9VNHlPbTkvM1lYYlhWMXp3OVhTQ1BVV1lkSFYzT1hy?=
 =?utf-8?B?L0RkZ3l0dldQbUtkWkJNNjJ0aDB2ZHY0cXN5dmI3ekZjczNjdUU5NGNnZXpO?=
 =?utf-8?B?aHN0U0pPTVpGdWhXeXBYV0x6S055RS9yd1JNSmp1MFk1WVVJUCszVXhPQkFp?=
 =?utf-8?B?OXRCRDN0MFd1SmRjR3dhMnNGcDZBcmk4VHJHdW93WjQ5UFVQZXVXa2IrWFRj?=
 =?utf-8?B?MWlPNmhlWDJvVWs0UWVKZHBCOHRwVVV5ek9heklwVUY5bStTMlFLWE0xVlF0?=
 =?utf-8?B?bnlOVU1hWEV2ZkREcHRGVXB5TEZlSDRFa2x2VGpkWTlHb08xNGR4K3ZncmZL?=
 =?utf-8?B?UGJsS2dmUDFCTm1KQ0ZpQTdHSE44aWVyRjYycHdDSFBTUDgweDZReVFoQS9G?=
 =?utf-8?B?S1lpZkNCRHlUZjltbXNHbjg0SE5ld1htK1cyVWVPM3ljVXliTllpMWhvYkla?=
 =?utf-8?B?T1pCdDIyVDhUNUl2YkpYOGJ4UFljci9mSFY5dTJsV011UGpGVExiYStLSzBk?=
 =?utf-8?B?TUFxZStObWFlZ3U1b2N6eU84Z3JhY25jak10V2xGK0twc0l3UFhmalhFNnRq?=
 =?utf-8?B?NlRPbENZdTVwMzJCcW9NL3NRUDhZMlFJTmdHd0g2aWVIdnM2dWNlaGtic1Zz?=
 =?utf-8?B?VFlRVHQ0a1hOb1BscnlkbXJIYVhnRFdTRk95alcxTlh4andodVlNek8xYVRB?=
 =?utf-8?B?WUw0R2E3MFJIeVZsMGU4ZGs5a0swWEFxQjhNWlNubFRra1dMWWo0UlJjWjJO?=
 =?utf-8?B?cnBSNWlBdWQ0YnhOMFpYZWNBVlVrMmNRTWhTa1k3dkZFQTNyc2dKd3pSMVNU?=
 =?utf-8?B?SG1tU2NuZWdpT3grMkdSZFp0MG91UEhxVSthR3d1aHBaUm5Tb0laUDFsTkZL?=
 =?utf-8?B?TmtFK1lQOU5pL2xrN0xFdjZVUE1zc0phN3RjdjQ1R2ZPZVVuNm1STzhOdk1E?=
 =?utf-8?B?WEIzOVBZWTE2QTVvSERPNGhEOUJDemk5RVpEUUVMQ0RpNlkyUklvRFdIdFhF?=
 =?utf-8?B?cFFibllMVGJ2Wnh6SHdRS0o4TGtYbTMvQTlIeWpvRTlHSGdmTWd3UkRXVEEz?=
 =?utf-8?B?WjdZclJDekQ4K0drblljWGpIRHBrR1l3QU5jYStyenJ0QUtlTXlpYTlvT2FP?=
 =?utf-8?B?TUJ1ZVpQWkc0b3I2WDgwUmdlRjBDSGVFQnU0ajNTY09PQndBL2JYakdTeHNo?=
 =?utf-8?B?aWY2OGF3Y05PTXhxeTMyLzNRaTlla1J4RUF0c3ZXUDNFa0tSMk9FOWNaSGho?=
 =?utf-8?B?VHRtdjZlaE0yWE9KK1RsRU9uU1p4Qkw1bW50bk1jY3U3MWFMT3lnSlFuU2RT?=
 =?utf-8?B?UlBDQWxFd1NIUmEySGd3MC9uUlJUWWhNbEpwMGQ2TWRTWTZyaUh3b0JhSG4z?=
 =?utf-8?B?d1pNRHh2eVlDODlHQVA3dVY2K2ViejlGaDVUd3J1alBWdGNHdTFyZE5STG1X?=
 =?utf-8?B?eHlEeGIzR2Y1b2xldkVvRVVJMzEyQ2pJenZlMEt4MWJQYWxScHBqK1M5dm8w?=
 =?utf-8?B?b2tRMWxabWF6MllDS1c5M2F5M2xDbXlpc2dnbVJOdUI3MVNQMGlmM1o5cExs?=
 =?utf-8?B?ZDJvZWkrYitqK0FLa2Y1bG1NVGF1Q1pxZVJicWt0eTlaaVNCYnZTVGJvaHJr?=
 =?utf-8?B?RStDZzJYRWlmRDZlNFh6eGx4YVNYdDBXb0dhRGs2L2gvNHl6Ujd4NTRhdklp?=
 =?utf-8?B?Y2FzOHZGR1ZCcUNVREgwQXVnZnY3M05UTUVCODNON2ZJL1MvYi9pMGNONzF5?=
 =?utf-8?B?MGVSN3RLWEF4L3VrZ2xjcVRpbXZMbkJXdTVPaGRxQWdaTnZ1R3h2bEdZdmtZ?=
 =?utf-8?B?U00rRnR6WDRaZGhTZnQwb2ptM0prYmFVSjZBWGVQQ1htdWJnRFZRMU1TQ0tD?=
 =?utf-8?B?MWNndmdPM0xIM3NvOHpuQTlaRjhsT0JLaG85Q0pqckt0VG1GYVlPOVM0cStB?=
 =?utf-8?B?blNrOUdhcXoxR3NrR0JoM0pIZ3E4cTJ2ZlJMOUxkeWRSQkQwZXZZYVBHUmZT?=
 =?utf-8?Q?nWrEGTqZZl95eKd/SQPrS/g=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a2e7664d-8f9f-486b-b735-08d9b343a867
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Nov 2021 14:22:22.1064
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3xnR22kCgl2k5HcBH+AMWZ4ZjooSMS3vUUpiUm4LxaB33hKqlqglZhD7OLk4Cb6mC+AaAMyDspv3JpL0BA2GtA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB4847

On 26.11.2021 13:34, Andrew Cooper wrote:
> pv_emul_is_mem_write() only has a single user.

Aiui you mean a single file using it; there I can spot three uses.

>  Having it as a static inline
> is pointless because it can't be inlined to begin with.

As long as it's only used to set function pointer fields, yes.

Jan


