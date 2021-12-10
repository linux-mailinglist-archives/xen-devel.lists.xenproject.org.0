Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A50F74701A3
	for <lists+xen-devel@lfdr.de>; Fri, 10 Dec 2021 14:30:17 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.243866.421968 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mvfyJ-0001E3-0e; Fri, 10 Dec 2021 13:29:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 243866.421968; Fri, 10 Dec 2021 13:29:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mvfyI-0001BN-TD; Fri, 10 Dec 2021 13:29:58 +0000
Received: by outflank-mailman (input) for mailman id 243866;
 Fri, 10 Dec 2021 13:29:57 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=aCrA=Q3=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1mvfyH-0001BH-6w
 for xen-devel@lists.xenproject.org; Fri, 10 Dec 2021 13:29:57 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 438b8b0e-59bd-11ec-9d12-4777fae47e2b;
 Fri, 10 Dec 2021 14:29:56 +0100 (CET)
Received: from EUR03-AM5-obe.outbound.protection.outlook.com
 (mail-am5eur03lp2056.outbound.protection.outlook.com [104.47.8.56]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-35-qSQRsdS7NQSXcIJuftErlw-1; Fri, 10 Dec 2021 14:29:54 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB2959.eurprd04.prod.outlook.com (2603:10a6:802:8::25) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4755.21; Fri, 10 Dec
 2021 13:29:53 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe%6]) with mapi id 15.20.4755.024; Fri, 10 Dec 2021
 13:29:53 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AM6PR01CA0064.eurprd01.prod.exchangelabs.com (2603:10a6:20b:e0::41) with
 Microsoft SMTP Server (version=TLS1_2, cipher=) via Frontend Transport;
 Fri, 10 Dec 2021 13:29:52 +0000
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
X-Inumbo-ID: 438b8b0e-59bd-11ec-9d12-4777fae47e2b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1639142995;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=NY93VtVXiVMr71kjwcRF6uBkuR6eqCnUDvyBMThNlC4=;
	b=N37heJic6OeXPjXROT6QRSWTd0dd6eUFb8L4pPpXQ5m6xQpTru42khDWmUdg2nPtQCaGDy
	vvgFbdjY1nwxwl9KeVrk1dhSxsryMnZt5u/8yAY5TPT6vj3fBl1A9bdOXD/TLaEUteYMhG
	T904ckq8OYzk/Ti5Zna8rUuQWymFnKc=
X-MC-Unique: qSQRsdS7NQSXcIJuftErlw-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HMSL8+J/X9QfyKqyNJ3Lr4h2LLivEIduivvvMN5nbngs0omY68eohVMhtsog2JKZGCgFsiyYjevHdTkjTzjwTmvpxqVhZvP6xuUFAtkTDm26K/1aViJ27NUCRn6B0qIg34p++6/ST8eaD9tepTfsQwKMTbHxShHSJtFLKnXAvhUsLgfTftqoCwPzUl2GkazxATIV8UKgFt3wrzgckL1e92BliGTam+LL5Ed4G1Kc6EgDw2C37Yo/aTqd7ZOIQQ/SYaozMifW351cFG29yuPLB1/SZH4d1uAc3c4T/swJDI+ure4C/B4F71sR9Ob7qTXrI4X+feKg876/m6Adjrwhag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NY93VtVXiVMr71kjwcRF6uBkuR6eqCnUDvyBMThNlC4=;
 b=kVHZ9irS5KtrRpbqyH49tpYBMr6nc6B+2qKhYpfELWmNKujIvxZaLpiB9RvSZXsEZcXSyhL67k1iQ0R+5euY7Rp4iYjqUewp5WepSQwYvAb/azTDypzaBdfIOvUFHUxTlLOhWrC0J5kxppkyeY7Now0lhanX9VmEreyJxh+jccto4ZrtaVteYd0zu2s+wEM0mFyezI/90WndInsXxANcIc4GBYcYwryA3DaDLkJFG7n09mwrAvMKY9y3JEiLtEsX91BoIZgrEjk1tVexP8FqzRtNr1tFTwWQyJkmhWq6HfNV5LNPTf1nwDWREdZbNRsqSubeTPRXFLSs2zO/Lb2Qqw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <488943f5-572a-12ea-e74d-7a4baf38a94d@suse.com>
Date: Fri, 10 Dec 2021 14:29:49 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.2
Subject: Re: [XEN PATCH v8 23/47] build: rework "clean" to clean from the root
 dir
Content-Language: en-US
To: Anthony PERARD <anthony.perard@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 Ross Lagerwall <ross.lagerwall@citrix.com>,
 Daniel De Graaf <dgdegra@tycho.nsa.gov>,
 "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 xen-devel@lists.xenproject.org
References: <20211125134006.1076646-1-anthony.perard@citrix.com>
 <20211125134006.1076646-24-anthony.perard@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20211125134006.1076646-24-anthony.perard@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM6PR01CA0064.eurprd01.prod.exchangelabs.com
 (2603:10a6:20b:e0::41) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 27b521ef-38a0-46a2-ff97-08d9bbe125fe
X-MS-TrafficTypeDiagnostic: VI1PR04MB2959:EE_
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB29595DAE3B577C2170DBC261B3719@VI1PR04MB2959.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6790;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	x20k57uiyRlSXzhmIOaYCD545Z0S+mc9lWoNkzTCIlK0EiQtnNNFYEQsKNndWV7yhwHmlSM3oaZpVnh85RKakOff/CbVwkIH5Bj6ZzTECKWBFlyfj7V2UDif4ingD9FPd/3EiTRi09eqIVWvulxmv9XJU+MoZ40XJFPqeS4s4PxM9ZZLjje8U1DnTgmvwBEe/u8aycP85Fu0a2rg/PUUNRRCHMiNqUTShFbi1jwvFWzqGdi3aXRore0NOl7iTCLSYC8qjaw+Ql/ybIXa2yO1OB9PJFwWJ4H6sPyEfYlv+alzHN3Pvm9iPqvoKiZzv7tqfl28NJ5wGLHS0h80No6gjHuWEc8G7yoaLYHsIiFSdOl2cu9yC4TiwfURPK1hZA3lQekC/XSyPcsYrI+dOAviVpkb4bryOsDDZAMYfHVJFlqGAyMDsLxhU9SikolZhKk77PwHrzm53oDYPBAVpgb/UEeLge/vWLR4sNgSgzaTr3vj1WfEk9mAzuqN9H1cyyd9JVzHhwLlhNyejoOYh7A5YZ6uOpMF3K779jJTWA1mxlrCGh53DWY0lsZZoEx4y2VBbfBGnxZuHdMMJ8mIuL2KOgK584gqVUk4ldJO1kFvP3TPSwDAvPMs2BdMNS6IpnCsZKRRba9S/MP9pS8U5tCWVwlqO/rJTLNd7Ioc1xVpRp4k59HGfrclbhsZ+gTeOfu6oUKKKmDms6LNsJlO0B2S/g==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(5660300002)(38100700002)(6666004)(31696002)(6916009)(6486002)(53546011)(4744005)(66556008)(186003)(2616005)(54906003)(66946007)(66476007)(86362001)(16576012)(31686004)(2906002)(956004)(316002)(36756003)(26005)(508600001)(8676002)(4326008)(7416002)(8936002)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TERsOGlCbEUxQVloZ2twa3h4UHpiQUgyM3M2NDd4T08xYTRocXNpamlDSUV2?=
 =?utf-8?B?RTB0bk5Ua1pibGFSTkZuSldYbFhxZzJOVFRrZHFXcnIwK0x3RzlZbXJldDBl?=
 =?utf-8?B?UmlHK2xhUXlZMWNyLzhuR0VNY1FXblFZSEl1TWs0UVZzMmhMdXMxUy8zblRu?=
 =?utf-8?B?K3E3SWlBWGtnWkVONGRNTTA0dXJNeE51dU43ZFpLaXV3R2MybkNQSHYxVkc0?=
 =?utf-8?B?c3E0UWpCdFlCZzlxZms2UU5lS3dweFBLUWVmZE90bVJlam1PdkhTdzBic3ZQ?=
 =?utf-8?B?Y2NjdTU4TGR6Zjl0QTZZcFRtMll2REZkOTRqajdEN2FWVFAyVDFSY0FzVW51?=
 =?utf-8?B?QnRPZWxQalJsWWVodWV4dUhoT240OG9HVFRVWk1jNFg3YnpqY2ozdEUxMHN2?=
 =?utf-8?B?K09ZdkpJSmVoTzk0MnkzNFJGQ2d0Wk4xa2Q1NU54R21EaDQzMlpieEJlWUZq?=
 =?utf-8?B?ZzJ4QksxOGwwYnlheS9UNHBQQVlHZ0xkT29xbC9ROGpwV2FLN1U3RkVOaXo0?=
 =?utf-8?B?aTZiSmkyVjRTVEFyUFJ2K0NYbFAvWU5XY0h4ME9IeWxvSlkwVzQxQ1FneDhQ?=
 =?utf-8?B?TlltK2FZWlFFckFRU29WOUhTUlBrUVhKQ3J3QjVTM3BGbi9OZDBidnQvMkhX?=
 =?utf-8?B?VzdpSzZOdEMzaVhiNWZBaWkxMDM2TUk1bStLcHV6RnJLR1BVWlF3WGxqWWY2?=
 =?utf-8?B?dG1qa0hEKzBOQzJjaUVHYTdKdTd3T1JSV1ZBbER1anI3VU9jUmtraGxUTVNo?=
 =?utf-8?B?QUozWXJoVENyNnoxQWJUdFR1NFNteVZBdmhWam9BUHFjWVBucVVDTmJmK29l?=
 =?utf-8?B?b2MvL0tKeTFGdENZNWJLeE9IYVlDMjdORGR1TTlLc0lnSU1PTlBjWXpGaHYw?=
 =?utf-8?B?MlFJQkt5UUpWdEEwclpic25JM3IzTE5rRERhRXBvOTYzWjkrTzd6c1ZFOEw1?=
 =?utf-8?B?NHA3NWxEZmVXQlhaMEdMVE5CbVVObTExd2EyYjBWaFgxRXFXME94SWRwbmV5?=
 =?utf-8?B?UE0zeVlxVjRwbHVkRmVjYWIvLytLdHhMV1VUOWtHcUdFV2tuR2llQXhzb3BE?=
 =?utf-8?B?b0RKd1FYZDU2YUFJUjZPbDc1aUpTZ3JIRnFQTkkxd1FMcEJOUEpNTjVvZ05M?=
 =?utf-8?B?SEROMFpWRDZyMEpsMS8va3Rwc1JyVjdxWkhkM1o2eitnNzdsclFwV25lZ0Y1?=
 =?utf-8?B?RGpaL3lnUWpSZ1YzUEtveXFDblFPbnJwYTZHNzZmM1BjSUwzWm5Zb0IvS21u?=
 =?utf-8?B?VklsdjQ1dURHZjdESllIdDZ0dVlEQjFkeFVPNVJVZzh3VGZKODBtZzYzYnBP?=
 =?utf-8?B?alo2UG1wZm9oYk5vS0svYU83UEtjbldnWVdvYVBFNE9BMW5KcmVQeWRRbXYx?=
 =?utf-8?B?Z1N3VXBiQTNWY0J4MlRraDJFaXhabHk2ak9xbWJxd3orWHZ2VzM3QkNFampt?=
 =?utf-8?B?bmE3cThmemorOXlNTVFVOGdFRHE3b1lOS2lxaE5PYk91Y05GWDA0NUtkWC9S?=
 =?utf-8?B?bVNRN082N1dIcW5KelhDN01LSEJEc3NDVUo2S2ZmQlNwUHBMTzJsVFN3V3R1?=
 =?utf-8?B?cG9oNDFmcUt1UUMxUVpZQWYvdm5TWEJERzZUdUdyT1RTNWtvcU9SeGMvZnpv?=
 =?utf-8?B?b3JyWHJZZEQ4eG84Um5FOU9KR3BLcld1V1l4V1hpQ3FZNGt2R0x4REZMOXlF?=
 =?utf-8?B?UGFmSVJnNHpVMk1OUGVyNFVqQVJheVJ2L2RxNWErTVlWNlpUNWtDaUJjVFd3?=
 =?utf-8?B?aFRoYllaSDR2WTNNTHJIci9lNlplWjdXTkJrVjRoVzZDNmZLRUVERnlzTWI1?=
 =?utf-8?B?SDIrUEY3cWZuTkh2SDcwdzlnQXVHbWtSOThoWWhXYjY4NUtyQ0pFcnMwY3RQ?=
 =?utf-8?B?TjFoakE1eWdJS05wQTN6ak1NRHRRZW9JcUoyOTVwQmV4ZkpPZVBUR2F3Wk1n?=
 =?utf-8?B?VVdzcExCSnNzQWxERzdUWS92dFVKcjNGc245eGM1RDdEZzdZVXl5UnRtdEt0?=
 =?utf-8?B?ZHZiMDByckVRM2NFb1VuaUJranlUMk9ma1JTcjZXb3hkSGl6Zkx6SlNLYkxt?=
 =?utf-8?B?Y0RYaE0wbHovR3g0b3dOTGVxNmp0SmwxV3hNaEJPTkRoMHpVMWdOQTNoNDdl?=
 =?utf-8?B?bG1kazcrRzlCdUxJblFlM0RIaGxZSHRTRGdZcHUrdkMwNEVIR3oybEpVcElI?=
 =?utf-8?Q?OuabcTFI7T0taLjA+MAJn4k=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 27b521ef-38a0-46a2-ff97-08d9bbe125fe
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Dec 2021 13:29:53.0639
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hCRh1PmgCtyE7MBRg1xLgLqpZpGW77x0JCU43jMFqDnUIQD/5jETSR+40GWxsAMAdDSF5mDlBJoyS50WuhkEEg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB2959

On 25.11.2021 14:39, Anthony PERARD wrote:
> This will allow "clean" to work from an out-of-tree build when
> it will be available.
> 
> Some of the file been removed in current "clean" target aren't added
> to $(clean-files) because they are already listed in $(extra-) or
> $(extra-y).
> 
> Also start to clean files listed in $(targets). This allows to clean
> "common/config_data.S" and "xsm/flask/flask-policy.S" without
> having to list them a second time.
> 
> Also clean files in "arch/x86/boot" from that directory by allowing
> "clean" to descend into the subdir by adding "boot" into $(subdir-).
> 
> Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>


