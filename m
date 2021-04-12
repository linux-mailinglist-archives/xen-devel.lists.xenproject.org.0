Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D02535C8AF
	for <lists+xen-devel@lfdr.de>; Mon, 12 Apr 2021 16:27:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.109242.208525 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lVxX6-0007xU-58; Mon, 12 Apr 2021 14:27:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 109242.208525; Mon, 12 Apr 2021 14:27:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lVxX6-0007x5-1w; Mon, 12 Apr 2021 14:27:20 +0000
Received: by outflank-mailman (input) for mailman id 109242;
 Mon, 12 Apr 2021 14:27:19 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=w1kd=JJ=bitdefender.com=aisaila@srs-us1.protection.inumbo.net>)
 id 1lVxX5-0007x0-38
 for xen-devel@lists.xenproject.org; Mon, 12 Apr 2021 14:27:19 +0000
Received: from EUR03-AM5-obe.outbound.protection.outlook.com (unknown
 [2a01:111:f400:fe08::710])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 1d084c0d-8312-48f3-ba4a-b9b40a1db3f8;
 Mon, 12 Apr 2021 14:27:18 +0000 (UTC)
Received: from AM0PR02MB4419.eurprd02.prod.outlook.com (2603:10a6:208:ea::27)
 by AM0PR02MB4242.eurprd02.prod.outlook.com (2603:10a6:208:e1::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4020.22; Mon, 12 Apr
 2021 14:27:16 +0000
Received: from AM0PR02MB4419.eurprd02.prod.outlook.com
 ([fe80::ec4d:d9b4:af06:3958]) by AM0PR02MB4419.eurprd02.prod.outlook.com
 ([fe80::ec4d:d9b4:af06:3958%5]) with mapi id 15.20.4020.022; Mon, 12 Apr 2021
 14:27:16 +0000
Received: from [192.168.1.109] (86.122.210.79) by
 VI1PR02CA0052.eurprd02.prod.outlook.com (2603:10a6:802:14::23) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4020.16 via Frontend Transport; Mon, 12 Apr 2021 14:27:15 +0000
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
X-Inumbo-ID: 1d084c0d-8312-48f3-ba4a-b9b40a1db3f8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gLBQbJ580TEyLTkt7ZRqOfV8hpI3INsfiEgUmxUQIG6OnBQlhJIe9DYoN8cxWA40KGovbwASXmX3EqrRgHLUXO3/Oau7hcuS0Tm5yyWQQCrT2Y9T/9JvDR42NfJcb+ONAPatyrhSH+b34TwXhHfhtapXMiFSYSqJwVSI+Bxu1CivPxApYj0OHWnnzeKao4fevaSJv8n60l0kp+wYyyxgmFih8AyuRjxP0wR3lx77qLI5+UB/uAt4or//BObkrk4GbhZ5B41+ZP48neRG0W9Z6aJde7e7qkSSEJjPKPTu5ULheJ+KjUczuqBxAXzifLELt6VmIEqR8Unr+Nb/zapTxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FnkxHMDWbJZFV0zyqBwEpD8xmSirVNxSsgefIWVMTc4=;
 b=esmI0glkyjZ4CKO2kRUdfCvA8SPjU3e4yiReXaGWfc067tMF2Z/Iw5k/UnOg3X3LQ4qWWILOi6UxHJ4tTDqB+GDHgEGAGCTYaazjezucpT5pQsPmh12sxBMCLrULAmOG8Au7bwl3ZxXO7ejFF+pRTT7BhVULoWadGnPnRr9gK/PUyoJFXWOmsRVHgRW4Bs2ixIkPk8xuoz2Cxup6/t5HId0aE0dbjUtsXcs1vmOI1cnnNXad6PAhFczp/382MXFQ2/x77pCkNnKFIN+R8JQso/eXvIDnrbKLTwSqGqRb6ovnyxgZitmkcRz6nrkwK1Fieg6Rt7QPIN3jl1+g53w2LQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bitdefender.com; dmarc=pass action=none
 header.from=bitdefender.com; dkim=pass header.d=bitdefender.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bitdefender.onmicrosoft.com; s=selector2-bitdefender-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FnkxHMDWbJZFV0zyqBwEpD8xmSirVNxSsgefIWVMTc4=;
 b=RlsKyRAgvygH09RkrGmsL6oZcl4EdaFb0EhpugItcpv9L3Q/sZJ0xPTaIepwy6/UFQo8JMFP1jUoRwMGCn5/YHwRuXGa/vM9AIyWZCKzdGluy9nlia4rXE+P5AraqCOpuNip6MAwjaLvr1tDu/dOK+mcGuQUPiII/xAFSYVhCPY=
Authentication-Results: bitdefender.com; dkim=none (message not signed)
 header.d=none;bitdefender.com; dmarc=none action=none
 header.from=bitdefender.com;
Subject: Re: [PATCH v2 09/12] x86: make mem-paging configuarable and default
 it to off for being unsupported
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>, Daniel de Graaf <dgdegra@tycho.nsa.gov>,
 Paul Durrant <paul@xen.org>, Tamas K Lengyel <tamas@tklengyel.com>,
 Petre Pircalabu <ppircalabu@bitdefender.com>
References: <3cf73378-b9d6-0eca-12b6-0f628518bebf@suse.com>
 <26dae9ef-5fcb-f806-059d-7cdd2974ad40@suse.com>
From: Isaila Alexandru <aisaila@bitdefender.com>
Organization: BD
Message-ID: <28057a1d-9a82-502e-662b-619ec08860c6@bitdefender.com>
Date: Mon, 12 Apr 2021 17:27:14 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
In-Reply-To: <26dae9ef-5fcb-f806-059d-7cdd2974ad40@suse.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [86.122.210.79]
X-ClientProxiedBy: VI1PR02CA0052.eurprd02.prod.outlook.com
 (2603:10a6:802:14::23) To AM0PR02MB4419.eurprd02.prod.outlook.com
 (2603:10a6:208:ea::27)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8d99e960-cf35-4f92-a8f8-08d8fdbf127a
X-MS-TrafficTypeDiagnostic: AM0PR02MB4242:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS:
 <AM0PR02MB424249BEBD8B817A66C8DB3DAB709@AM0PR02MB4242.eurprd02.prod.outlook.com>
X-Is-Junk-Enabled: fGZTSsP0qEJE2AIKtlSuFiRRwg9xyHmJ
X-MS-Oob-TLC-OOBClassifiers: OLM:751;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	BMeY0LiHEB+i12o6lDSqFA55FY8lJivuqPbxTBw2YXtXmPO0ODNgQbXpVjOPwbfWwHtpq7DFG4S//lgR8ZhmY0CE90C4kvrewmt/bNxQJRU/nzWiES/hjOEFHAiFjho9aoOAu5ySvj3OSfWZvUE6mRM8xG+46M/yghKWaGjBLG1zI9cazAhgTZg/xR9MP1lsbPi4sf/4CSOY5JSlF0DO8qWuhOdfE3Mm9Vj/4sov1xknRPL+hS8Ccvq4MjE/umkR4b4JDiJQ86AjJPFr/X4tUmdiUUfLdaRJlLu91cWwpZDBu5qhHVZUJCMvs2THuRrIWX9WCnD9xZUz6PtDIkQQXQ7uvZBzxnG+UVQZaGf3C8wX02xtUg9cIXVycKAwI7tsx/pPPuk5t8QUWG123wTr404tfR9x04pGnZfgAT41Uliya1N3O/fs8N+hJH2QWV9JpoYuBK80HHLA4ap390EDK2InrZC0o6u8zA/vAcmyV6xeiQ6HqQkJdwwLCokElD0IIyrC9qwuqxMqpT1KW5oLyrRVLWU1uw3viV81YkPJ/54Wr/EVhRmlD0xXKE1epSi6z4fBEa85pEKTClF8fHoxtbbBmLCKfsdZ1oFlwxXLdXiBm3FRvrkZwzKgg6KfWYV4mBzFwL+L+Kv8cs3a+JxhDZhAyqdPqbqf1APVKgpzs/2WzVlNC4GqOTMPkNzfPJuEbXcf9GbnjRHyIszqkdPjqg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR02MB4419.eurprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(376002)(346002)(396003)(366004)(39850400004)(136003)(54906003)(4326008)(5660300002)(6486002)(16526019)(26005)(8936002)(110136005)(2906002)(38100700002)(478600001)(38350700002)(36916002)(66556008)(107886003)(16576012)(316002)(8676002)(66476007)(4744005)(956004)(2616005)(31696002)(31686004)(66946007)(186003)(53546011)(52116002)(36756003)(86362001)(43740500002)(45980500001);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData:
	=?utf-8?B?ZHl0eGdmMnpiOXFIdkZ1ZjZENVhSeFpZMjVIT3Jza1hGZnVIUExLSHhLSmZ5?=
 =?utf-8?B?RkJPbVFQcDExU3Q5ZXRlL2p0NFZ1c084N3JzQXNXOTd5MkNRRUVyeUdNbFY2?=
 =?utf-8?B?TlJSZm5LaTBXeTdoRFNHNVBOK0MxY1NVN1NRc2FCcmtjRGtTU0l4RU55cFdu?=
 =?utf-8?B?RTkrNVM4a0pLbjBRc01qSVdVWmVIYTZKNTRRSndaYWpYNmNWRTJ6SVhJR25J?=
 =?utf-8?B?OTJmUkMvUWNadWpSZVFocUFvd1lmcWVYWVAyUk1KeGtKNDI0azQ0VWZZNVV2?=
 =?utf-8?B?YnJMSFlhNmwwZDlmMnhWVG5YTjV0enRjanUvTHRNZjV4Sk41eENmWHdlTllo?=
 =?utf-8?B?Z3BaQkNaRjB0M3JFWU94Q3dQYko2RnNEZ2xwb2ZVZ2U3SW1pYm1WWThzNFlz?=
 =?utf-8?B?RjVnTVJoYWJzdytuMkU3TGs1WjNrbDlJNTNqNHBaT2o1NmFlbFNZTEFEU1Nj?=
 =?utf-8?B?bFFzd28zM0tORWdZclJWQTRiOFRuTmRnYy91Y1dyZlcrYkJVV01VZkhLaUp0?=
 =?utf-8?B?LytkZGNia1E1akNSdjJucXBzclRLK21zMGZ1ZllpcllCQk1qcW9ySktIM3hi?=
 =?utf-8?B?NFZuRFNybzd4QWQzMVRaM3J3b0VSNENlM3dJSlk3T0hONFZIcFZDU3Fza21E?=
 =?utf-8?B?UlJWaytGYUtqaXhNYTJmbkNHaU0yeThtZjU4WUpFQmdVSDNQcTRBcDB0UEhq?=
 =?utf-8?B?QmszR0ZST1NzTEp5YXVIOHRzZlFiTUZOMGlYdnZXd3RVenh4dUFoektYaHpk?=
 =?utf-8?B?SWNGaGVJVHhEbUR1M0RYcmpwejBGSmtiU01qRkxmVSs3R2QxWDJZU1YxZ3Zy?=
 =?utf-8?B?WTA3eGM0ajJ4S28wOHIzcC9BSkQxaThYWXdUZkNScDUzbkRORFpTYVdWUWhN?=
 =?utf-8?B?bDBodVQrd0crWnRtUzJFaXdqT3pockxJUnU1M2JBUjV2UkU2cEltS096cUhQ?=
 =?utf-8?B?T1BFWkExdmZkTStsSVR3MVRPWHMvTkZWa2xZM2dFcHpqNnQ4ajNJRkQzbEFD?=
 =?utf-8?B?a2c4ZjU0V2VvMHN0bXd2ZjFEaEhKS2o0cHJpRGdpQ2w2N0Z0ZTJ3a01Rd3Vh?=
 =?utf-8?B?QytoZkRQQ2o1TURGZGpWa1RFTUk1SnFtNVJjODVYc0YydE1neGJYMXYwWHJN?=
 =?utf-8?B?cTRxWVFxcEpuc282TnhtYWk4c1pGNStKcCt4RGdrcGR4Y0NrWlB2RlI4UE5I?=
 =?utf-8?B?cnhjbXlwWnl5UktuQlFIUVBpeTlORzc3NXJUSk54eEE2dnMyanRuaE5SMjRq?=
 =?utf-8?B?V3VLYXIxdkJZQVRaWkJ5alB2cG9pazBYYy9LSzJXS1NIeVNMRjgrbTUvZ0VZ?=
 =?utf-8?B?cW5ZQmlna0xLTlpHTFBWSHZMa1EwTDdCb1dGNHRPMEE3YlJlQzZtUkY4TGh0?=
 =?utf-8?B?eXRhaVlzMXVGbnI4R2ZlbHNiRUFjMjhmK21qY1AwS1pXaTFzcHJ5a0tkT2sw?=
 =?utf-8?B?RWZGTmY2NUtSRncvbEZ0enBCb2wxVGRiWDhaaXJBMWZiU2FTdGQvVUtCWDFj?=
 =?utf-8?B?WUwvUE50WjJJQlBzUEszb0UrSXBObHk2aGM4Z0Q5cFNKaDJrcWNEbzk2S25L?=
 =?utf-8?B?Zmc1WS9YUThaYVg1WktDRXJTWThKQlhIV0pNWGxNeXZjSUZFMWw2STZHZ3NU?=
 =?utf-8?B?MjBOZ1JiVEdxMHBUZmttelRCOTRFRkhxMWxHaXZDeDlVSTMyMTR4MXJrU21k?=
 =?utf-8?B?dWtXTU5HRlhnbW1ZbzhPdTllWURuaSt5a0N4Nmt6ZittcW9oMkc3cC9kUHNw?=
 =?utf-8?Q?mcfBjHzumQYvOcEjkCNV9D/C2JbuWSAWOtC7uPq?=
X-OriginatorOrg: bitdefender.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8d99e960-cf35-4f92-a8f8-08d8fdbf127a
X-MS-Exchange-CrossTenant-AuthSource: AM0PR02MB4419.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Apr 2021 14:27:16.5223
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 487baf29-f1da-469a-9221-243f830c36f3
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rWdaBUo2+mBp5RZcqPqm764KN2CnSYoABhRWTD1YUVXbsn3AcCr6uw9uTOCuuixj3zdWnnFdEYL6M2Wfsm2kEYaM2Xc7isiN0gSptt0Rci0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR02MB4242



On 12.04.2021 17:12, Jan Beulich wrote:
> CAUTION: This email originated from outside of our organization. Do not click links or open attachments unless you recognize the sender and know the content is safe.
> 
> While doing so, make the option dependent upon HVM, which really is the
> main purpose of the change.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Reviewed-by: Alexandru Isaila <aisaila@bitdefender.com>


