Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 211663E8A22
	for <lists+xen-devel@lfdr.de>; Wed, 11 Aug 2021 08:17:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.165517.302470 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mDhXk-0003t4-MR; Wed, 11 Aug 2021 06:16:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 165517.302470; Wed, 11 Aug 2021 06:16:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mDhXk-0003q5-JI; Wed, 11 Aug 2021 06:16:48 +0000
Received: by outflank-mailman (input) for mailman id 165517;
 Wed, 11 Aug 2021 06:16:47 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=fjOV=NC=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mDhXj-0003px-0a
 for xen-devel@lists.xenproject.org; Wed, 11 Aug 2021 06:16:47 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.111.102])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 9f1d0e5e-b8ad-4bb0-9822-7e91c7923711;
 Wed, 11 Aug 2021 06:16:45 +0000 (UTC)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05lp2172.outbound.protection.outlook.com [104.47.17.172])
 (Using TLS) by relay.mimecast.com with ESMTP id
 de-mta-22-pAUCYfZDNm-c84JK49XLzg-1; Wed, 11 Aug 2021 08:16:43 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB3117.eurprd04.prod.outlook.com (2603:10a6:802:6::32) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4394.15; Wed, 11 Aug
 2021 06:16:42 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::99d3:99cd:8adf:3eea]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::99d3:99cd:8adf:3eea%5]) with mapi id 15.20.4394.023; Wed, 11 Aug 2021
 06:16:42 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AM4PR0501CA0052.eurprd05.prod.outlook.com (2603:10a6:200:68::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4415.14 via Frontend
 Transport; Wed, 11 Aug 2021 06:16:41 +0000
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
X-Inumbo-ID: 9f1d0e5e-b8ad-4bb0-9822-7e91c7923711
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1628662604;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Vtf+G9h18jZ0Ox4t/rWCng9TsUpKErcqgvQ4mj1kl48=;
	b=J9kwzkhTwKt9kRzzWQnpTIPs6/8WPpBtSty8e5SKi3Uv6HRaSLVB2n1HbXeJmzPF1Y0KwD
	mNa6GyUQ4BxnFFTcKfhmbAkp5tIOcyWSSfyjHCnTsZ9wxnwZ5FbPOBY8QoQFR1n+7bWVYl
	xnZBAQ1rRDNTavRaZkdgGdD7JrJ2sro=
X-MC-Unique: pAUCYfZDNm-c84JK49XLzg-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YKRsVzAggej5OU7Kyi+6/NQKtU5CpSmjWF0Txctr06AiO+uxNRTrs/Zt9GYNbMspwnF6IZov/kL0YJNODIe0yYXznusvHpZachTpeH/vcvbRNmkh3GPi1kG51EBrHZ4quYE367HOvvEifv1N6JhpXh84v9OanujxpUNe9cZ/iWo//HGvN8SHm8pat5y35s91gEPL9bJcHewpZ2jt3GF9J7LNF3SBS15pN/3fS2Pi5ZUd6J3qMeYa9APVvYWKcc7w+6vapiZebVLJ6Bv13bghFQBJazUpcQ4v1M3MG4eL1yyKNGl9vPqFS3VgeBoorYDd4+pwM84sGBQecP8V7qtF+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Vtf+G9h18jZ0Ox4t/rWCng9TsUpKErcqgvQ4mj1kl48=;
 b=hgmUaV5OEAyem7hJ8ZdjHKK2vqNlXSIz414uG0u7UL1SoerhE+vvXuCroTZbhEk0iRzV/3OjFkH3oKqgt1ZSpfXHoE9OEpE2lPS07ZQ5j4ddkJuUPrIPEbLk79+Mn4YG+Aqe3GGrG4CSX6G87v3UrgML3DCKl1V+/93paXJYXZ83Rfa9ffeLe7uuAsR9oWmcy/pi44q1caGwU2cfHEpII1cNWqaSQwGxZl6VlRjDxd+7tt+0Stap5ktg2nxEiaf5EOZldcmC/0PR7CsuVCAtICd0TnTM/h0fosvlKYsla1i8VTRo4P7Qog4TNLgwVE+QtoZyzKAxZeuVxSWhV+C6RA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=suse.com;
Subject: Re: [PATCH 2/2] x86/ioapic: Remove use of TRUE/FALSE
To: Kevin Stefanov <kevin.stefanov@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, Kevin Tian <kevin.tian@intel.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20210810174907.56426-1-kevin.stefanov@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <5f0bbf4f-933d-1485-674d-771688fdceea@suse.com>
Date: Wed, 11 Aug 2021 08:16:40 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
In-Reply-To: <20210810174907.56426-1-kevin.stefanov@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM4PR0501CA0052.eurprd05.prod.outlook.com
 (2603:10a6:200:68::20) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 14d51794-af8a-4cbc-fa5b-08d95c8f966b
X-MS-TrafficTypeDiagnostic: VI1PR04MB3117:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB31179B3AF7F91A933DDF1B87B3F89@VI1PR04MB3117.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6790;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	TQDo6ml8fHQ13TBbBo6QYiH/R4GYa59Wj4szb0JONWFCr6XUONAIQcn7KMIZV9buHS7h9FHQhi7cBov48bFil9286ZvyjfUZDB2nOgujQb8jCjHEHIvdgTBNISc8Ykn/QoK60KugUe3lAWEljFDVz5BMKC1ihrIx5LNkEHOmYw/g6aX9IeoKOWduqBp6Ocbo3tVDdod+NGtoKcUeJF7BpAU8CDfQd/a/lircs+IgsQYWszTY4WB2UDaDzXh0SnzNxoWWDzq/f1Fwoz/FnPu8OcMO857Z8FiIyf5Sjx0BTlBRJ8sN4uwbdr0perzRxaAb/H4AQXpg3V/XJha8z8sZQeFR0EjSJ3PmDgMDhLQPRpwvOlGmiDt7LcBZX2S2hGD0m+tA92cxudOPxSXHMOB3IycMZ4z4hDMU4UKmgPsluujLcDCNdQlmSRmG34qQRyG4Ntwi1pAd1EZPmYQ+8ODXig4dcOL8EyyBEWvxV7ocVb5WQkSbAfmOV0iVz6a577Hjqg+iGlh+JBdHkm/awkClHsmWO5rwWRSejGrB6M3EEMpLD73zcer0Dgr2D2eq6F1XKIWSIRXlA10nOTOHS3uKcrwMv4eosQh8Xd08Jwvr2O1lf06P8U0Qw15qunK9R/ojDAdNkp/uTG/l07rNjK/I/Ayj3niHXch5IJ6EwZj2/sWnIpccXopeZihtrn+z/nmgMMGQL7kim/MjGV8GQRVpZvHIvwCn4pMJanYEx+HyY5I=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(2616005)(8936002)(316002)(54906003)(26005)(4326008)(36756003)(53546011)(66476007)(86362001)(66556008)(31686004)(2906002)(6916009)(16576012)(4744005)(8676002)(508600001)(38100700002)(186003)(5660300002)(956004)(31696002)(66946007)(6486002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cnFQd3BDdU1rb1o2dUw1c1ZHeDZQSnNUdHkxcnhjOXpBTTY3U04wZW5ERUt4?=
 =?utf-8?B?Myt1MlE5YTVnaS96a2lsOHdVazltclI4WS9oS21HaWtqOURwdFBPWTFLL09U?=
 =?utf-8?B?Q0dZN0RQdWlabHg5ZXE0azdGeVlhUmF0ZnlBVlVGOVh6MmN1b3hOdVBLWEVq?=
 =?utf-8?B?ZC9jaTdFbkordXRzakp4N0xiOTMyOGRibTFnZGdZQXVRVGRPdGUyY0pGQnBa?=
 =?utf-8?B?VTF6Y3hIVG5ZcnAvMHNwYTcrRDBCQ3BpUVY2SU9TTjJ5QURIUCtsWGVpVlRS?=
 =?utf-8?B?TEJsQktvQ0Z3NU1pTEJrQ216MDk1RjVycGkxU21GSVZvaUFBUTJiMUY3cFE3?=
 =?utf-8?B?TTVVbi9xVGt6UElLT3BtM3ZjVW5nV1d6NmFSNHhPYUIwakpEK3FKNTVIdzcy?=
 =?utf-8?B?dWdkVkpyaTBHOWZPcUxkSnNROFIzeTZhT01aaUVsOFVkNDVpdkxVbzZpc0wx?=
 =?utf-8?B?cEJKSkNkcjRhSXJkWUVnOXB5d2dnRURiektWa2J3OVRmQmZaYUFMckJJeWNH?=
 =?utf-8?B?ODlQa255TnZHbjJRc2x0VEhtVHR1TTRISDI3emM2U01JeE9VcTlQc2FMTjNI?=
 =?utf-8?B?LzhrUnJ1RlBSalBIL0dyY2pNaEZjdnYzWm1kVzZLSUJ5UERpaENWVDhtdG1z?=
 =?utf-8?B?eDJoVFFCdnJST2IyaFZGMXBPSUprd1hYc3VEYkFua1NQcWwwVjlWNWx4Q2p4?=
 =?utf-8?B?M2xDTDFBdGxhRW5jeVNDTkZEV01xODFCbHp4MGlzQ3d5K00wQllFK09TK3FS?=
 =?utf-8?B?L2QxWS92UEpXU2NxeDBsbVpyMEkwWUJrNk1zMk1QV2ltVHc0N29FVmoyU1hR?=
 =?utf-8?B?TFRHeURBMEIySStNOG9TdjZuT3NJUTBtcGFDbEE3a3RkalV3S2VCZlZkZzJr?=
 =?utf-8?B?QzhIeE90WElkK1NTejlsS0xqaUNVYnYwSEN3TnR0QUtiMVZCZ29ieG5ROEZa?=
 =?utf-8?B?TnI1SitZQjMrQXg1N2hMTG9sUXhZUWJQUi9WQ2pBMUlvRFFNQnh3RFVvTDNS?=
 =?utf-8?B?c0FEdlBOYjhTbFJPRXFqQTZzVlZ4STZ3OGE2VUxjUDZ3NGZURUhLVUFQQStt?=
 =?utf-8?B?ZWp0R0tBR3FoeWtnRGlnSkRDQmZCREI4WWxsYldnV0NLbkJ1VXZxeVJaelJ5?=
 =?utf-8?B?REVpTWI1c2t4a2ZDc1JsVG1mb25WU1ZIdDRma216SUVnNERjQW9qWno2Y09s?=
 =?utf-8?B?WDVidld0WUdoM01LRzQ1NGZSVXBRLy9mZGNtcVVZYVMvNVo0UW1ObTlxNFFa?=
 =?utf-8?B?ZWJHOTAzYjhwQmlvZDVlYWNIR0NEcFBsU0lpdS9sS1BDWVJrdDhncERyZFZD?=
 =?utf-8?B?a3A4T0xoNVFxTEdVNHQyWGx4VXI3V3FiTDRJZkJROGs3RzBJTk9ZYlc0UnJx?=
 =?utf-8?B?RjVpU2FMZTVTR3lreFZMelZhZXlnVytZQUVOVHY4WitGN2JXVFlaK0M0YVd2?=
 =?utf-8?B?WnFLaE5VT1ZaU2Y0blhQV2xOamVtUitQajY0VEs4WnFnbm12VGFmOW5tRjJM?=
 =?utf-8?B?alUycm1BdCsxRTE4L012VVJkY3hqcG92MXBiU3FLT0RDSnBuQ2daVDJ5VXpH?=
 =?utf-8?B?c3dpYTBhK1gwM1hUdy9TZTh2REJCTlpFNkNYaGRrbklOd25IT1d6cnV1QTk2?=
 =?utf-8?B?S25ZYmpMdEY4blorc3NhRFdjZFlKMzN0Q2ZrTkJIRWd5S0swSHZzTk5pWnc4?=
 =?utf-8?B?UGpRSnFaUXJEdEc1bVAyUkszY0x5N1BWa2hFRDdhUWhlaXZicHd5RlA4d0dH?=
 =?utf-8?Q?0zWhDmtJjAMkmQOn/suYLZpHybHt6G220Q6MCRn?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 14d51794-af8a-4cbc-fa5b-08d95c8f966b
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Aug 2021 06:16:42.4852
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YioYNQqajqVYFcA0t5RkN160NNBgISNhhKy8yfaO2C/AY+TiHiKfy5S+QbRKSGRIcbgol/V2b2wu0JfZJ90rTQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB3117

On 10.08.2021 19:49, Kevin Stefanov wrote:
> Also fix stray usage in VT-d.
> 
> Suggested-by: Andrew Cooper <andrew.cooper3@citrix.com>
> Signed-off-by: Kevin Stefanov <kevin.stefanov@citrix.com>

May I ask that along with replacing TRUE (there's no instance of
FALSE that you replace, so you may want to adjust the title) you
also replace the uses of literal 0/1 passed to
{,__}ioapic_{read,write}_entry() while at this?

Thanks, Jan


