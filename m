Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 491E449F3F8
	for <lists+xen-devel@lfdr.de>; Fri, 28 Jan 2022 08:05:26 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.261874.453703 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nDLJU-0001N3-Mr; Fri, 28 Jan 2022 07:04:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 261874.453703; Fri, 28 Jan 2022 07:04:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nDLJU-0001KS-Jm; Fri, 28 Jan 2022 07:04:52 +0000
Received: by outflank-mailman (input) for mailman id 261874;
 Fri, 28 Jan 2022 07:04:51 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=B5aJ=SM=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nDLJT-0001KM-CG
 for xen-devel@lists.xenproject.org; Fri, 28 Jan 2022 07:04:51 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 94e9012b-8008-11ec-8f75-fffcc8bd4f1a;
 Fri, 28 Jan 2022 08:04:50 +0100 (CET)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05lp2111.outbound.protection.outlook.com [104.47.18.111]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-25-E4mCGSWFOIuQWkLPmPXZ7w-1; Fri, 28 Jan 2022 08:04:47 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB5199.eurprd04.prod.outlook.com (2603:10a6:803:62::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4930.17; Fri, 28 Jan
 2022 07:04:45 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::a1a4:21a6:8390:b5d5]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::a1a4:21a6:8390:b5d5%5]) with mapi id 15.20.4930.017; Fri, 28 Jan 2022
 07:04:45 +0000
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
X-Inumbo-ID: 94e9012b-8008-11ec-8f75-fffcc8bd4f1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1643353488;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=O4KbgNdbWRWQ0Bif5DjjCwVdhYV5B3pXcN/a8dARgZ4=;
	b=OwudvltccxCbgZlWdpzLM/8NCDokQX7amqibqEPvOxATqwGUYdYBWiF2KQE0FRDiSAy7zd
	HUZyrxqrDngP0CQOAB+alw71jv63ko3vvSX1qLzlRfRQ8bRVlDjeF8s/IvoQ7CmFSebaeC
	MbL3jtYg1UBefu8aJ6pHM8Z0x0JXjog=
X-MC-Unique: E4mCGSWFOIuQWkLPmPXZ7w-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SYiodU8KMPFpt1USZW9CvZ2HdsUfBaeggw9U4U3GqQ3xfhp55Ctq24Cr/SrmZTIpZ86peQqSNm0AqugNc8b16Rp/5Vc8po9oF1xy43A51T4gTHvHiJbCnVF0UT1Yl9Ht+bDGSYhNyKNRud3fgM0fMa0kcfOJLpHZ++GwixA8Zt7XeYcHWI0zHxVKbIKavLlBLlBpNJEQGri4aBQwjwaWW/Ee8XddB506uxyvtcgrtN9VBTzxC9KzCZ0LngVEo0nF0tXt+gaTqsHQBHskl1jSS8o22GlYx6aJp0FAHQzhCamWaVzgZ85oXvhu+mpADfYG/hxUUB2cCavLXf21x2feog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=O4KbgNdbWRWQ0Bif5DjjCwVdhYV5B3pXcN/a8dARgZ4=;
 b=Pk1NaWYLnhGKhNnP2U+IVlJRC/UZ5Y1w3fdzG85OqsNIbsyX5gIpLzM0M/pJNR2Q991osw6eQddwq/yNdVtYe1UhAJeCBMbq+wOP1Ad6wCYr0o+TuGJuHHo3/DfAZv2JUjKDvZaaKg+dRQcJVUmfuW895J8O/jMbmOZU+uZLXMnrNQZLaWPci2CLabggTSeVp6J/OfPFoxpJetwdq0EwrtB8a3mFGKoWWZu49DTWzkOQu0sGne3mtZXvzMqczkRg0bBaeEtzOsL3TX1rggmn1XBIZiDbwUdfRErwfbR0Fsstj/+y0Aj2/530sXvmtcEJIVaMrFDfjPmfNXPTaJfkrQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <8bf1f314-c1ba-eb8c-460b-d385a794b2b8@suse.com>
Date: Fri, 28 Jan 2022 08:04:44 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: Debian Bug#1004269: Linker segfault while building src:xen
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: Hans van Kranenburg <hans@knorrie.org>
Cc: xen-devel <xen-devel@lists.xenproject.org>
References: <2a095341-a727-23d1-2dce-dd9caa72c920@knorrie.org>
 <798c8459-7f28-c081-15bf-04ea94e8b711@knorrie.org>
 <9497ff64-8fe3-5d5d-303a-2d9f8709ade3@suse.com>
In-Reply-To: <9497ff64-8fe3-5d5d-303a-2d9f8709ade3@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM6PR01CA0050.eurprd01.prod.exchangelabs.com
 (2603:10a6:20b:e0::27) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7535ee87-6c6b-47cd-b863-08d9e22c772b
X-MS-TrafficTypeDiagnostic: VI1PR04MB5199:EE_
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB5199F223C40C2D0EE757E8BEB3229@VI1PR04MB5199.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	mjPBzNbKkY8CT0g2YenlMsw1CE3Zg9cLlh3g4xgauXQ/RJSXXzuySJYIyssgPw/nE/6684suPqIyze44gigurt5t+VOZnLmKEiePaV6NeYnUP/oACkXGuTgl32eK44R7pTOtbS4OFuqvYvQxZHvJROUj7JSzWQ+lEQsSMBRovhIQIATfMzb8PeUkKpkVl8KWi/4saT3ii6g9nAYssmVjjJxtrkERPN7fKclShZlw8IRZYtFj4suB0XbVb3zbgFWmPdm4VcqdMbCBpJcGYDW89pPseQilkytq7t+ryajktTe0vBW5O1wrIYf1BAOjgYLXN3h/tCfU0X3r54qFOudKwCZD7iYoBms65po7eOFAjQx5FnWqC/IwBik5I3e2HyfYOt5DHig+5sTzpne/akAoPbH77sOBOl5UoAoT71JvqorQ/lrlEy/DkxMjxV41MgnsAEYI1uGOMrt9FAPaOA3Uws1zy+u65b6AZD8EPKXUb5sWAj2Jx8QJi7+hzEktWnkQ0Ozmmpy7YMnPBVvhlpk5URkdKCdr/weNETCw9cyCceeaAr5v/XUWRJ34aIujiox5t58IAKKjf91p4UPlV56AMyjiJTgSFIa5V8UAkXUC3/7GBNlgwuM/2buF2h2vfDJHly5VoUShVPGXRxmk2Oj0nCF6vkNP+iGT5PhqSV9fmVwfzAUb8enVL3RPiAuO1PVywlbTtcCqT58w5KP0jv7kwDFgdGAfqkg+Vz7sKiVzAFcB7Wf7TH76taeCGcLieGKKwahmpSDMTbyZhGNvIFS/kGsZDvRgY3oSH8KZ3kxlqU09/tuhXZSGqFpezW8uW9AK
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(6486002)(31686004)(186003)(2616005)(26005)(36756003)(4744005)(6916009)(966005)(86362001)(38100700002)(31696002)(6512007)(316002)(508600001)(8676002)(5660300002)(8936002)(66476007)(66556008)(66946007)(4326008)(6506007)(2906002)(53546011)(43740500002)(45980500001)(20210929001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?YUE0eFJlcnc5bWF4UFZxZDZzYTg0a1RSdlZ4dEdMaU9ONSs2c21yOWRMZnJN?=
 =?utf-8?B?TnkrNFJQbWExT1F6R0ZlOW9hcVFQWmt2Y1ZHNEY3MndUMlZYeVpMaU1sRkVv?=
 =?utf-8?B?TGlPT0o1QXQ4c1FaR0lXRFk0b1NxTVRucUhTS1VlRU1KTlYvSmx3ajBDd2gy?=
 =?utf-8?B?S3FOUTYxL21NcUE3OGFCc0RvTmhxQkZRcW5TODhpaTVvbm5vcFI2YXJzV0pO?=
 =?utf-8?B?VjVQMW81aEwrOG1XWG9sbm9BbERPdDNLaTFMRGQxS2JaVkFzcjhTSnVtYlBw?=
 =?utf-8?B?Mm5BSnBzQSt2REl2Myt3aHJFWk1mUHdlZ3AxQlhHUldOWFNiemxWdlZ5MytT?=
 =?utf-8?B?TEVSMFZMRFV6S3pDZ2p0VGQvVEp0b21EZWVseHN2U3pZeWdMZXBUM0FqRW5x?=
 =?utf-8?B?UlN3WWlXQzJJdmlzako5dkNMQWcyMVZ4ejVTRDUvMmc0YkxlUVdKR3FWTXVG?=
 =?utf-8?B?NmN3amxSV2NTdUFPeEpvcjFyWWk5ZHlnMjBMdlR2MFIreFl3bGFnSVRaUXdU?=
 =?utf-8?B?ZERNRm5LMUFxRUJLNFN1aUxrRlE0TWlFa1RlK3MrVWI5YzNYbzZnKzRqdDV0?=
 =?utf-8?B?bE94c2t4TVZUZThiVFdzazVET3NMMCtkT2o0RjIxTHZRL1N3WDY3SzlFWDdp?=
 =?utf-8?B?aEkzMEdWbGJTZ3p6bzNVb0dXK2pQYzM3UWhTcHg3YWVtaUxiVWI1NFVTN2l0?=
 =?utf-8?B?cnZ0ZzJnRENCWmpUOTVPdnJyV2dBWFo0bU1sWC9sblpHS3ZYVmRxNndCU0xi?=
 =?utf-8?B?THljYkszWStnSXFESGwrbFhhUk9taVdNQXR3K0JPV1MrcERhK1ZaT2FzVnI5?=
 =?utf-8?B?MDBibVRseno3Q2RBQzRKMGxTM3h5WURHRWkvNFRoSTFkZkR4eXNSNitIZGkv?=
 =?utf-8?B?MTB3WDlvZWhrOEZFZ294LzUwZjh3dWdiMlZzdFlxNUlVeGJBY3p3QkVuVUpR?=
 =?utf-8?B?NzBIYzE2VDlnV2NMaTNaR0VwVlBJOFVCMVlweGszSzFNclVjdnk1cGlCUk1V?=
 =?utf-8?B?elpIS0lzazNXR0RPQXg2clpUQWJDQlJwY01MQ3F5aFdXWUNNT2ZzSEFBQ2xr?=
 =?utf-8?B?bktoejZtN1JscXlmbHA3M2l5VEpKeVI2NW5LZUZRcjhwekxjcGVpMnZqU1E2?=
 =?utf-8?B?dEZpaTFYb2Q4cDNGTmREc2FCWURZdmE4T1VGV2gxVHRNQ1hNK3l0VlUyMGIv?=
 =?utf-8?B?eFduSldGSTByR2Y1YVFCUm1yakpIbkwrNUZTOEU2bGl6ai9vQXF2VXZydXNX?=
 =?utf-8?B?dFlOZnAzaWM0NWFKUHFTRzBpQ1g5SkJRcUFDZVFZUEZhQVpDcTRvRlRRVTly?=
 =?utf-8?B?aVZSOEd2TXJWblJwcTE3VER6dVZnV0ErYS9rTC9XWkM1TVVYaXA0YU83OHI1?=
 =?utf-8?B?b0ZzUjNyQy9XWDhoZUIvVnRsaG9wMnBnV3lHdWxPNWpJNDU4cVZnZXYxMzhU?=
 =?utf-8?B?YkJ5bUNkYzY4blRvazJPdUU0dkJmb0JtNWdIZUs0NDlJdEEvNVRaTG1ueGUy?=
 =?utf-8?B?QzlveUxXK09kZHlwYWdLM3QydkdLY3B1SzVpTU1SWGFaa1dCRjFVQW9zamNG?=
 =?utf-8?B?NFFxdDhyVjQ4a3h5STdQemdJbWgweTNkWTVJdFJURzJuQzZCdFJ1QnFUTXBo?=
 =?utf-8?B?aUFkT3VDaVJhNnJuUW1hQ0VJekRidkMrOWJ3QnhVS0xIYksrbEYrOXZINWdu?=
 =?utf-8?B?N0hYMndhZmZNSDRJUDlMWm5vTEd5Rk8xb1I4dkFRdmMrL2p3Nlh2dmtVcWxy?=
 =?utf-8?B?eHFHS2FlbnFUVFhNZFBxZ2ZvY08zVGZZaDZXVFZSL292UHB2K1NOdHBOR1lS?=
 =?utf-8?B?N0FNblJOdFZyVnU2OXIrcGE1MDhlQis4RlZ5MDN4L0U4TUI4eWo5KzB1bUMv?=
 =?utf-8?B?TThGZXo3K29MMXl2czAwQk4yb1h0YVRUQnl1VEVOcFR6M25vclFoZXpLcEhh?=
 =?utf-8?B?NzI3TjNINEpYN0lHTU05YmZZZzhST2dTUXBySSsyMW1IY2pjVTdIaVczTGVD?=
 =?utf-8?B?b1RVVEF3NUk1L1R0R21DdWVzSFJEcm5PS2NXVnVjRlUrUVdhMFJ3dzVXNllh?=
 =?utf-8?B?cXVSRDNWNng5YXF4clZuY3IxNDdKNytRRGhUWlg5U2c1d3ZicURncmFHbUZH?=
 =?utf-8?B?bnFIUHByU29lUTFQOXBpc0xmRXJVNnBSWm15VkgwdGR6RHh6T1BnWkRHZXd1?=
 =?utf-8?Q?O4yqoOeOSNz9yuEgg8ZVzsU=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7535ee87-6c6b-47cd-b863-08d9e22c772b
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jan 2022 07:04:45.7303
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: P4XrctsIIBi22iCJ//7lLTaEQkIdn0pdKHhQPtipDW7ZHXngyorAiWcIAnEiHTO2Fl8fQlVkkG8snnUAhZxsNw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB5199

On 24.01.2022 09:40, Jan Beulich wrote:
> On 23.01.2022 22:52, Hans van Kranenburg wrote:
>> * Any suggestions about what we can do to help figure this out?
> 
> I'm pretty certain this needs debugging from the binutils side, so I
> guess you will want to report it there (even more so with 2.38 around
> the corner). I guess it's actually debugging ld or bisecting which
> provide the best chance of figuring out what's going on.

For the sake of xen-devel, this looks to have been fixed in binutils:

https://sourceware.org/git/?p=binutils-gdb.git;a=commitdiff;h=07c9f243b3a12cc6749bc02ee7b165859979348b

Jan


