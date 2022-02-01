Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 62A904A5E6E
	for <lists+xen-devel@lfdr.de>; Tue,  1 Feb 2022 15:38:41 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.263623.456411 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nEuI7-0002rz-Fb; Tue, 01 Feb 2022 14:37:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 263623.456411; Tue, 01 Feb 2022 14:37:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nEuI7-0002os-CU; Tue, 01 Feb 2022 14:37:55 +0000
Received: by outflank-mailman (input) for mailman id 263623;
 Tue, 01 Feb 2022 14:37:54 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=0oSv=SQ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nEuI6-0002oW-5G
 for xen-devel@lists.xenproject.org; Tue, 01 Feb 2022 14:37:54 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 89439bac-836c-11ec-8eb8-a37418f5ba1a;
 Tue, 01 Feb 2022 15:37:53 +0100 (CET)
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04lp2054.outbound.protection.outlook.com [104.47.13.54]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-23-KHbQsY6PNamjA-zoFb01qg-1; Tue, 01 Feb 2022 15:37:51 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by AM0PR0402MB3617.eurprd04.prod.outlook.com (2603:10a6:208:17::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4930.22; Tue, 1 Feb
 2022 14:37:43 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::7cc2:78a3:4d40:9d45]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::7cc2:78a3:4d40:9d45%6]) with mapi id 15.20.4930.022; Tue, 1 Feb 2022
 14:37:43 +0000
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
X-Inumbo-ID: 89439bac-836c-11ec-8eb8-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1643726272;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=s1lSl2incW1W5x6++9gPN/yuxYcUETd9XkmHejYJidU=;
	b=TW8SKFgFy1hx9BDauzBHXTKf6fSfLoTt8WTvsUw10oR9lJAOaYLtnNenWaW7TyWP+TEAEV
	+Ob2rtn2YdXljXR094HlWgiKSB1pTc5so2P1/Fm2UtDUxQevXzAbFfAw8grESH4s7XuDdX
	JxJTOqAPA/f3qcV6Ku9UmVFyNwBb+7c=
X-MC-Unique: KHbQsY6PNamjA-zoFb01qg-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Z/ltG9BtnSzzDmlj+F5MwZE2jtHqUKRk0kgbritXeq0PTJtsinKCvstNjmORUjJXlknXVapB7LzKLWFmIyKme1hxFVKDTGQ/cCSBhygYj0E1WgrhTjeUowJLvuidoImqwwPss5xU+Lu0pLeL2PlsKIKOGdio81rCR+PHT0zyihY+jBl0ApI0gCFp+kwMxINxHnt/bkIsxGSbLWj0z4d2cOW1OSzvFOcyMZOz6cXprhX2A8w3NEuuChmR5L3mKUglGYn8LQcPdIWuAVKM1n/tT5jvS7QaTL3zSTlarjJgaU3LWZZdCLGp/7yyul9NjA5unxQKmxH/PfthUSYh8LRABQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=s1lSl2incW1W5x6++9gPN/yuxYcUETd9XkmHejYJidU=;
 b=VIR8t/kPinQ9nWiQrqC6Rb55+RyOTTU5qTDTfTurXWPJR0YmRcBLhd7m+aipoKWWO95zak0Ag9cwH4Ua3bB76WB0qRqdSZfo516dnBLHBuQ2X8b843mpRtu6Tvm6FHYirj4bEoNuFWHZTo6sC74YjWv/ESILtTp7nYXj1GY2lDe38v9bq1pXwyTqmocgROQlT7iax6JyDbs8hWzxlM18TfRVIIlyCTIoPdPVJ4Mg1M/qMK6BGDG3LZJAs4RmQyodBjVuihVtPW0Mpq8FVVZ56MsDaXRIN+Qe3PRDVWkjJGNSUyM+TNayzVc2j/EpOizle77ogBNgYiAcsoU5XmX5KQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <5f8ce615-c3f9-4f02-e547-223b775f70ff@suse.com>
Date: Tue, 1 Feb 2022 15:37:40 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH] x86/vmx: Drop spec_ctrl load in VMEntry path
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Jun Nakajima <jun.nakajima@intel.com>,
 Kevin Tian <kevin.tian@intel.com>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20220201134117.13612-1-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20220201134117.13612-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM5P194CA0003.EURP194.PROD.OUTLOOK.COM
 (2603:10a6:203:8f::13) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: cee30734-ec5a-4215-fece-08d9e59067e0
X-MS-TrafficTypeDiagnostic: AM0PR0402MB3617:EE_
X-Microsoft-Antispam-PRVS:
	<AM0PR0402MB361743426309F08B6CF9798EB3269@AM0PR0402MB3617.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4125;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	TuTLG3zljumOTNEP0lEALXnwd6ZZyXfPMDhiwNoc/dliyVW0usEkjqeaol3xk+3gcu9inXjrFaWNS4Nyu+RA02YI65QJBOJhtXX+LsdQzN/T21bstfGzRSIeGjzlBHwYY/3ffam4t0ncxbP+elXzPxhPBbD+42t97kj4y0t0qqV/ITxwDRMjzJbPTRvm8MkrXNFWds/J0lTPV73pOS+QXrObHpa10yAxumSbmfS9I34fTLZB3+n8TefM2BvT0utB0gJc/dFFiGeLuw8Pg5haOHqYmPT5X2XepA2BEr90od4vlo6hGQ77bKkWkhnmGyyH9snhH9USVjFu7rUtvmB0bcA5G3d4Uosw5MEZaPDWSnxWXfOoM/RukaLvfAkmMsncCKgQ+Td36aFVRbuIhtWjFK3ZWeugs/aYcLVkGH9JQWyJfJTCeEEhirRks8JhdQ6YO6fcdrE27+9U1floPSWgZW/ygD6cgigOFvK/KmsXwPDyz/PvpJZ2DMnwGClSqIduiy1K+pGzL6msVSn57KM8IKPliU4Z/rvVk41/pQVQk/nGVmpOwAcGEpNqM3/tPDWFravX74/LlSFZB3uWF+IiYIii1JO9nQYvZsQZ8oV1x6W4K3zGXLOWpkOkBWvxqLPxu4FjF5/INtCs0V7srHoaUOiUtCmrjatXd5O2IPOt5PnhnntIkj2mIWL8aUEcDJsspCZ75uDMxXlkfokVlvp7LP12am1IfHZa88B7/UNwxXk=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(508600001)(6506007)(53546011)(5660300002)(8936002)(8676002)(4326008)(4744005)(66556008)(186003)(66946007)(6512007)(66476007)(26005)(2906002)(31696002)(2616005)(6486002)(86362001)(38100700002)(54906003)(6916009)(316002)(31686004)(36756003)(43740500002)(45980500001)(20210929001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?c0ZoSlg2OVRyMUN3WGZoNC9kd0xlOEZKQzhYQjZoaDFmbEcyRjNyZ2ZISFRP?=
 =?utf-8?B?d0E0OUt5R01lOW9BWHZNczNudnNCdzVrOUkvbmdSSUFxazU2OEFWZm03MEpO?=
 =?utf-8?B?dGFnYVNwNDNIN1dGck4rbG9vUk9VeEZrVnRBc3hUL2tFS0t5eHhzMHAyRlFZ?=
 =?utf-8?B?WnpJTlp6Qk5UWmVuNW1aaUpOeE9ocnNLL0dGaTFyTHM1aEptUm5JUnp4S1dY?=
 =?utf-8?B?NG1YVzZMQllIZzdxcW1nM0NiKzcySkJEa21USllQWnVEL0x6VUZPK2ZuSHZX?=
 =?utf-8?B?em1Cb1RpMnUyQTlOakppOURJL2Nnd1FkaEU4L0pnaDRwcHNwMTQ0U0lrVGsv?=
 =?utf-8?B?SWVLVzZjeE5GL01rNGlrekJEQ05DUnFjUk9vRmlkTm0zK004SmNDTFBwNHZX?=
 =?utf-8?B?R3NSelJRMTV2VUJpSUpXS0FaS0pyd25wcEZuSkNScnU1WVhsOHNjZ1ZHcm56?=
 =?utf-8?B?emc2cWlXL3U4RENzRkNXai9zZzlqRVp1TGNsbHhveHJzT295bWs5K2dEdnJE?=
 =?utf-8?B?eUp4ZFNkYzMrTUIzb2syczlTU2hRM3M0REkxUzNhbHJZR0p5MUNpMmpUaUg1?=
 =?utf-8?B?T1d6NmJvWXdhR2JJNkMzVFlMWXVCY2dSTTVlYTBuRW5tZjJKcy9NdlFvNitZ?=
 =?utf-8?B?YzlKU05GeWIrSHdTSjdkb3RLR3VYTnpJeE5MV1QxQWxNTEduYktrNFBVZUxT?=
 =?utf-8?B?djVObWlTaFUyUW9XU3lVVStTVjkyb0U4UlZOY2VpYkIzdXFKZGV0UjBiRzVr?=
 =?utf-8?B?aFovVHEzRVliS1hPVzJXWDNZbDZISU5ZZ1F0SzIwbkpGSGN5b1FPVzNCcStB?=
 =?utf-8?B?YTZ2anVSUlZIY2dzTk1pZDd4SmtJUGN0cTd1dWJLRUczb3ozaVhNUEwxRjl5?=
 =?utf-8?B?NGpjbE4yV0hjTzE0R2w1bStqMFgxVHZRdlRIeVRnMVdzdjJkVTlVU1pyZVlq?=
 =?utf-8?B?MHZ1TGFJRENzaDh1UDZ0dE5tdzFuQ1hIZmJZc1UrQzZQdDFGQTV3VCtOWTlv?=
 =?utf-8?B?dG9tMThCdS9HalcwTnA0TStIQlpGcUIxNGZWZnhLNGRQOVAxWlR4dnRyaTM3?=
 =?utf-8?B?TEUveUZBZEhkUmdpekRxY1lEVEhDNERlUzMzTldVQnhLdDFDMHpOT21MNzNX?=
 =?utf-8?B?elZWNkxvaEVUUTNlRGlwY0hWQkNPWHVyenZDT2NKeXozeG1mbk9UUDVTUXVi?=
 =?utf-8?B?WUNVcGdxMDFOSmxpczlxdG9CS1lDekhIc3RjcHFXMytQazgrTW5JZjkwSkwx?=
 =?utf-8?B?NEl0YkNPcHNXamwySmdERU5jdFlmVnNyS2gyMnZSUlN6Sm10WTVTcWovc3VL?=
 =?utf-8?B?bzNWdmhabUo1QVZGSVJaZ2RCcGF5Yjk3cmhxUWQxaGhzY2xJOG5tRTRjSFBK?=
 =?utf-8?B?L3A3QUsyQmlwQjJYVHh1aDdNWDZVcGFyM0R3V2dacTN5akM5T3YrUEVCdnkr?=
 =?utf-8?B?Q0ZoVll4NmJkZUo3aHRkcXVUaU9TTjQ2ZW5vR2JwaHJXNXNoQkZOYnd3NWVk?=
 =?utf-8?B?dFVUYng5REJzZ0RKTnVid0ZJckhab1RWQjBkV3o4SnJuajNaUnBuaVhKNEVh?=
 =?utf-8?B?VWg4RUxCUU5hL0ZIYUJlcWJnSHhpSHI1K09oRVRjL3BlVmowTTFQQW11UVVa?=
 =?utf-8?B?T05FaWpURTdRNklPZXhaRWNxcFBTd3hTSnZOeE1vaTFuVVlXUi92U0h6US82?=
 =?utf-8?B?OHdnT3NlQVh2Q0FWRmR0VHI2Y01MZDJ2eVFuL2J0NG5mdThRYzJRKzgwMmh6?=
 =?utf-8?B?Y0lac29JdkkvMXNmc3pJb3lidXlxWDI0Ui9PVVNOSGRCRVhvS3cxQy9aam4v?=
 =?utf-8?B?cHVUQWZxZE9PTnhLZjd4cmhXaUdxRWp6c0E4ZXpOWU5lUVN5ODBWQUY4NVlM?=
 =?utf-8?B?eE5TTUF6TldTTTFoS2JoeE1UY2NwQkNGVjdpRmtFNnA3Y24rUjJ5bE1paGh5?=
 =?utf-8?B?TjR6ZGRKWU5FMjZwUitkZWc5cHQzb0wrUkxDV2hYWDEzNzRxS2x4UExPellF?=
 =?utf-8?B?cjlWbGtrVW4yWmZ2aXRDdkpsaDdIdm02dmd5ZTJsRW04aklWRHFPUDgybm1j?=
 =?utf-8?B?dlI4Z3dIcXVkZnYwaDZMd3VjNmFQNHJldHN5UjJ3Q09OZC9sQmM5bWhPSDVK?=
 =?utf-8?B?UkFYY0dLZm9CWmhMbUEwNDhVNW1EekdOckNGSzdHa21kNEVkT2orYzRyemlK?=
 =?utf-8?Q?Iw46yyfJINh8jSdyzxjOtGU=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cee30734-ec5a-4215-fece-08d9e59067e0
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Feb 2022 14:37:43.2204
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: R4wXcgJZs9rHDYFSP0+roPY1g4KZV5OTyZSaAX65r4WWJ5b63vcbdTv2wJg0nqQidn0AOs82edGV7AxtW7/fAg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR0402MB3617

On 01.02.2022 14:41, Andrew Cooper wrote:
> This is not needed now that the VMEntry path is not responsible for loading
> the guest's MSR_SPEC_CTRL value.
> 
> Fixes: 81f0eaadf84d ("x86/spec-ctrl: Fix NMI race condition with VT-x MSR_SPEC_CTRL handling")
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>


