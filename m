Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D8E843BE9B2
	for <lists+xen-devel@lfdr.de>; Wed,  7 Jul 2021 16:26:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.152310.281397 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m18Uf-0003mk-QY; Wed, 07 Jul 2021 14:25:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 152310.281397; Wed, 07 Jul 2021 14:25:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m18Uf-0003kQ-Mr; Wed, 07 Jul 2021 14:25:41 +0000
Received: by outflank-mailman (input) for mailman id 152310;
 Wed, 07 Jul 2021 14:25:40 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=lj3M=L7=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1m18Ue-0003kJ-8r
 for xen-devel@lists.xenproject.org; Wed, 07 Jul 2021 14:25:40 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.111.102])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 33560fe8-df2f-11eb-8502-12813bfff9fa;
 Wed, 07 Jul 2021 14:25:39 +0000 (UTC)
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04lp2059.outbound.protection.outlook.com [104.47.12.59]) (Using
 TLS) by relay.mimecast.com with ESMTP id de-mta-2-jGaDMz67MuKIlWGp_yfgRA-1;
 Wed, 07 Jul 2021 16:25:37 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR0401MB2448.eurprd04.prod.outlook.com (2603:10a6:800:52::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4287.22; Wed, 7 Jul
 2021 14:25:35 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::99d3:99cd:8adf:3eea]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::99d3:99cd:8adf:3eea%5]) with mapi id 15.20.4287.033; Wed, 7 Jul 2021
 14:25:35 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 PR1P264CA0028.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:19f::15) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4308.19 via Frontend Transport; Wed, 7 Jul 2021 14:25:34 +0000
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
X-Inumbo-ID: 33560fe8-df2f-11eb-8502-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1625667938;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=r3rh64MjpZjPhmlcc6u0Bx17Oku/17RC5NcEjFP3oNY=;
	b=DK9qGbhP4mhD/ZuujfXEc5IELqkpn3y6fO9bLriArfFzwaR9fkfHRQR7+3nAVdc2nhuH6L
	5CTc/L4PCzwIdp1Z8rn+qIKlhKF0IdyHVtoJCdxZftr1O3+mXJF/ROpu1WaYAgBBbampLz
	KFOCybuEMvXImzohYXCDcOfYypY4p34=
X-MC-Unique: jGaDMz67MuKIlWGp_yfgRA-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ogja5LL0LNw6156S5atIajdyDOgmQpF1MX/8ExM1k/YpVpmIAAtjewcm2qErYBKrHiGM0ncEpsijiAViu0J3CheqKSxzks/Xx/FGMUqVRXfpfKRvc5R3oC0Vd6L7wDv1axHaJdgEvHBeLX5lkuK8xQt1ba8/ARKYGwoUQ/ctgvseIAJVi8UZE9MXl8wMsb9+3yT2ctqJKMnb7YkwrTZXxP/tKdlJwRQp1S5zGktiuSbUPCyAgKvRx+Ww/FuxwPE+4Mm0rFubO2M5JVlH4TVwCo9fcBRS21olH3HGSsr6GEcZ1sZkEY1NHCZ8N/306fi+tgv5maLqEZCXGhtxOB5mHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=r3rh64MjpZjPhmlcc6u0Bx17Oku/17RC5NcEjFP3oNY=;
 b=BcpzLyH84htpYGhBhj1E96pI+z/Oj1IL4gnWVDP7UiXGfogNq0CPo5kn5/4PjSHlvI9R8Ba6veEubNxCmqEPsVMvK9LCFsamuAIdLzDsbPZFnMf4hUPTw31ngr9WNRgN8ZvXl2c3nuzyBNeLAoDTtBNAPtpeZ4HyTJNHuFpGs8xIamPbUPhIO8/sD2in+et4qy0c5TwYhzrGDbOfoP3t8PEMruXmwboRO5PLAsEdVG5CXjV65OM+gC8YHa7xYpH1FYfgaA2X7+02k8t+0lkyBuUFyx6bnlGs76360tkNWc6FWRKmhR34DTGc900HIPISUhko91Bqb47P8u/y2GHFIw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=suse.com;
Subject: Re: [XEN PATCH v6 05/31] build: factorise generation of the linker
 scripts
To: Anthony PERARD <anthony.perard@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <20210701141011.785641-1-anthony.perard@citrix.com>
 <20210701141011.785641-6-anthony.perard@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <5a9f0468-7ef6-eebb-cebc-492050ed7e8f@suse.com>
Date: Wed, 7 Jul 2021 16:25:33 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <20210701141011.785641-6-anthony.perard@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PR1P264CA0028.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:102:19f::15) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: bb2632e1-375e-49aa-f788-08d94153159b
X-MS-TrafficTypeDiagnostic: VI1PR0401MB2448:
X-Microsoft-Antispam-PRVS:
	<VI1PR0401MB244852FBBC4BE7A7348E89BAB31A9@VI1PR0401MB2448.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4502;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	2TiAAe8686jdv4H5HngMrWZvcHb4mNQ8mDud9BJpDOT7cL3QdnBL/QiCGH64fPsp6om12kGiUCjWnw9oxvW4Sufy9hMemKqmL1jL+DxdU9xBEiktDD3i1BDCXKM3o+FlBZ+kFHrri4KS0GonttUkloSwc60UhL7gShs13TtdTkfz8DvAnR8GruK3WGp5BeMUQZII1DSlucjF4rvHbxGBPFypXmWfZkhMA+GZF4uc++qqmExIw5w0SADE5V5aaBlwsmKHlNIDVTd+OBersN8vK9xqTu4S3QYB97AsrMwOghcnORPXRcSvLKXB3zI/zfvgf14BElWtVhk4wxqUhnbYUmyh0vvArfYtCaFnKc2fDqURlb7OSr0r3fLQz43zxaLCqvLuZoBi7ypot/7SNvVuyb9lobwbU/H5rs8dYyRf5qwYxRLbfba6CM2e3kvAxZ820YllNp6To3gReO6USEpll7G1cwr4CtkGcCCugTB0qS8RXbhWahplgnF+9Ehm7cijkXZmJBLsiV3UNI3q2Ngef2hc2rpYVEMJu8QPF5WZiEsyof58QpUzwEiVTIR9cwU3hhIvzqE6ydrQirt1X31VLLw1VhmauyN1NB2ginJtaabAZRv6MF4FgP9A5Vh1S8BHXBqSLrFwckwO/mGWTJPiBVEyFUtYQpER1vENI1v1+wqSmX2/A+Tm9hMfgf+aaHBrT+1cZ/Drt3slZq+wGLTB/Vr8sgunLp45KitDA8DGuyPXTUeRxLt4YqVVvk5KDQMG
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(346002)(366004)(396003)(376002)(39860400002)(136003)(54906003)(5660300002)(66556008)(16576012)(8936002)(4744005)(8676002)(956004)(7416002)(66946007)(2616005)(66476007)(316002)(36756003)(86362001)(186003)(38100700002)(26005)(31686004)(2906002)(4326008)(6916009)(6486002)(53546011)(31696002)(478600001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?OHFycDhNb08zbGpGcEpsNjVOTFVVbHNPbTZTVWNzMWhDYndGNms3eWpRZElt?=
 =?utf-8?B?ZWg4WFhpRWtJeUgxanZwU0pqZ2UwVE9nWk5EZnRWRkxvRmduRlV5dGQvSVNO?=
 =?utf-8?B?aGtJaEN4YytGYUk1TlFvQ1Rhd1BaNCt2WVBCUlBzYjRmSlhGYlZPRDBOWC9h?=
 =?utf-8?B?ZFpUQ0ZiR3BNYmZTb2pKbzM3elBKSUl1M2dtRnN6Nnp1aWpPbG4zUWpaSXQv?=
 =?utf-8?B?dmNnR2F3RStMU1BlOWtzOW9LNE5VVmkvNjh2L3l5QWF0YVYwVVJMOHU3aVdv?=
 =?utf-8?B?Qjdaek5pNHNBKzdoSnJDYXEvZ3B0UE9yUmRKWHVNYjFZV01kTmFOdlJOcWNM?=
 =?utf-8?B?dzgyWTkrK3RlUzM1TjFxNFMvSzI2ZDdKZEJIZm40L1NaU3R0UExyb0tQeGJp?=
 =?utf-8?B?VElocTAwWTBvczdiQ2dPdXRsZkJqTVdDeGk2VmhqWGY4OCszWEtraDZFd3pR?=
 =?utf-8?B?OFhTMzRvWmhnU2VGTXBSeWRrbVVqa05BVnZqdUdsMVFMN1h4ZGJNMEZaTFRl?=
 =?utf-8?B?dTNINm15elJ0ZzRkQ0J2RlJWWnJBaVpYQUxna3ExY1J2SGVJSjVFSm55blVR?=
 =?utf-8?B?S2ttaU9JNXNBemlCNkZVU2NvUDM4MXNnTDhPdE1PWlZFemtvbG5BZWF3M1pG?=
 =?utf-8?B?TEhMblFFREp6RzZpcHU1NG94R2o3bGFKUkpldSthSit2cXFHSXJhYWUxZjU5?=
 =?utf-8?B?bHZwcjl6Y3A3alFjU3czQmFqczFzOE5GNVJyeGc0VytqT004dWNMVFJKWUpN?=
 =?utf-8?B?K1hvL1NueWFZSEtBOEdmMnN1Y21xWEZ2emIvZDlTNmlSZE5GZUZBNElTSjBr?=
 =?utf-8?B?NXpOSitGbjNpaFZLWGx3b0F4K1NFY2VFYUg5akhBTysyNFluTWh0VUZsL3lQ?=
 =?utf-8?B?SXRuSENZZG5Ma2VES2FnVWR4NmJSalcyT2R0ek13aXNyYVkrS0NIeXJaUFd4?=
 =?utf-8?B?K2NXVUR0bFF2TW55MmhWZ254MWNrR2k1akVaSUw4R0o0MTJVQktvUXIwZW5S?=
 =?utf-8?B?ZVhwbEtLWjZlVWpFR2swSGR2N055d3JqQk1VNjBCMmM5VVFoNTd6dlcwODZB?=
 =?utf-8?B?TG53K2FZQlZCRTJjTHhZYTg1VkxKYTNJTmVMWU9xUFM5NU14R24yNzk4bWNx?=
 =?utf-8?B?MDMrRUR3TGlZcjZoVmE1aExkdTRQand1SGNNa1BDbjNubGdqQ2JlRGFYdk5V?=
 =?utf-8?B?b3EwNnFMWWpmMW16akttM0srbzZTRm50N0N0bEtOMjJERWppMWlyTWtNajNj?=
 =?utf-8?B?QjloUHhpZmRmZ0J5NkRzWFRDSGpxTUxLL2Npanp0VXRveWY2RE4vYUxrT25X?=
 =?utf-8?B?MDMzQ0NwNGRtc2thVjJkTDI5VjFUcVZZb3pQNy9mYlg5Tk5kUWY1c0ZZS2Y5?=
 =?utf-8?B?MFd3S1BIY1YrNE0xMlNXWlU0azlxcjF1M1RsVlV6b2EvWndxQ1lSV0x4bmQ2?=
 =?utf-8?B?MlNFS29LU2JIdTBiRVEwTkRGTFBnNXdqVlBvdUsydFRCVUlhaEl6V2hmV041?=
 =?utf-8?B?Q3JIMjRpQnNCWUIycHZEaDJURjY1aDVUaHltWWtWUk54eFNLMFFMdWJrU1Vv?=
 =?utf-8?B?NzN2TzVRQ3lMeUhFRVB4cUZEWGJlb2ZkSlcxdzBscTR3N0tQYmZHcis0VmlW?=
 =?utf-8?B?Q1lON3hhSWl5aXREeHlrLzdZSjRuMDFKTUs3VjQ0U25NL0c0a2NVSDlDNXph?=
 =?utf-8?B?QmphTnBjbGYwVjIwLzg4ZE02NXg5bmFOSE5Na3B3V2xyaXhjV05vbEFBN0NN?=
 =?utf-8?Q?qvUYIgidjj8Ucnr6p+RufpdCNN+4tXMXQVkG1q5?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bb2632e1-375e-49aa-f788-08d94153159b
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jul 2021 14:25:35.1589
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: z276m7enxTIZFwwa6UDhZaeDIIC1g0ZBJLyD/Bpzozh2jTDesJRtF7ZLbyres7RTn5GdGGiE+DNNcE8vWOo38g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0401MB2448

On 01.07.2021 16:09, Anthony PERARD wrote:
> In Arm and X86 makefile, generating the linker script is the same, so
> we can simply have both call the same macro.
> 
> We need to add *.lds files into extra-y so that Rules.mk can find the
> .*.cmd dependency file and load it.
> 
> Change made to the command line:
> - Use cpp_flags macro which simply filter -Wa,% options from $(a_flags).
> - Added -D__LINKER__ even it is only used by Arm's lds.

I'm not really happy about this, not the least because the symbol's name
doesn't fit its purpose (we're not linking, but producing a linker script
at that stage), but well ...

> Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>

Jan


