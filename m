Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 515EC557400
	for <lists+xen-devel@lfdr.de>; Thu, 23 Jun 2022 09:33:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.354472.581584 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o4HKm-0000Tz-QV; Thu, 23 Jun 2022 07:33:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 354472.581584; Thu, 23 Jun 2022 07:33:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o4HKm-0000RV-Ne; Thu, 23 Jun 2022 07:33:00 +0000
Received: by outflank-mailman (input) for mailman id 354472;
 Thu, 23 Jun 2022 07:32:58 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=CRa/=W6=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1o4HKk-0000RJ-Se
 for xen-devel@lists.xenproject.org; Thu, 23 Jun 2022 07:32:58 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on2046.outbound.protection.outlook.com [40.107.22.46])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b3cc18f5-f2c6-11ec-b725-ed86ccbb4733;
 Thu, 23 Jun 2022 09:32:57 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DBBPR04MB6073.eurprd04.prod.outlook.com (2603:10a6:10:c3::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5353.22; Thu, 23 Jun
 2022 07:32:52 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::dfa:a64a:432f:e26b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::dfa:a64a:432f:e26b%7]) with mapi id 15.20.5353.022; Thu, 23 Jun 2022
 07:32:52 +0000
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
X-Inumbo-ID: b3cc18f5-f2c6-11ec-b725-ed86ccbb4733
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=E9krQ9/WU5DwNVJjXALtiErkJFB6TrXiC8TDJOiyC/IOxV6cjM+ydUrzzV23Qdndcr5iu57TArpVAW0MxFOemtWkFO0MRfEXjW7gSaF8ZdeFr8MMZJ3R7SiLdCLyy/OkyTPayKcpVRQiaeG/ATyLKVbS1FLT6ERDGuQqbZd5B1We83eJC02rLczHlLg63+gaxbSOKt8J1cBSTjqWEbq0pTWjeyz4G4qpmPFXbm4+HStoK5SLgFSjzPJU4B28B8q5n1Yd5ITmijSB9vtBLtMLdrLoGiH3PR/Xs8cHh5fAZ2tpvpPkkonQMuiPuMUs03lt32OaYlOu2nntZyQJRXTuPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5b3Ww6RDJ86vfpNsdUp4sKDWUbLmUiZLD1rFJ+Awy0Q=;
 b=hdy7k9hxHd1u0CaHsf3MRLH+ZkCUX7BPHHwXqGOb1gT+35zEXuMBeqthj/Y2M3xfD4j7W+Py15eePaH3zxLZlJroLHfvvRsmnozfW//R+nHnJIxi1iTXiyuWNkJICL8v69I/4YmmBKWo0djM2ab8UEPLvIDe6W72LFWFBlHlyfQUbgjr9+hJBeYFUONKn+ItwJOu9GVtjPrQgbCgftM8Nplp67Vh/4lMqJstXZTLAsEi3+KR9fPqxFnEbmOiwvpGMaesDtGo9idULb+A9CjQolDEhdDmKXtuXzTFpCxKd+kW09AmicESAN+u/4crtUPY/ioqxczOwbiMV8FFIe+yPA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5b3Ww6RDJ86vfpNsdUp4sKDWUbLmUiZLD1rFJ+Awy0Q=;
 b=aYYlS8/FIukdJRsx3vVnrm6EReMj2f4X6J+UV32TxxhuPA4Qri83OMJjr8OwFguuiVSvkj0GZpUB30qIhkz8fG5FDZN0Pu8TryKr1uUlMUJHboeUBOFrUsX+hvomWHyT8aIRlqtEocRMf+dyuyKtXCkT23KxHJ7KCPuwGVhHW8HIAx0eFKqu6rOPt/QxFAUAfbZsB7uFDNYc7DEcOEEr4H1/bpG7Ji4sWC9tyPNjAgns10x/p3KprMVkKQvP7T3HDYOn7CBKJKOHTKN+YUI6YL7FPHQtU7C1wQT/aFTUiA8FM7WdIqu5KHnX/QoJ7PuD5nhnItBZkMNeRtIDrUxybQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <e6c10adc-27a8-2f31-7d84-6aee916c56bf@suse.com>
Date: Thu, 23 Jun 2022 09:32:44 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH 0/9] MISRA C 2012 8.1 rule fixes
Content-Language: en-US
To: Stefano Stabellini <sstabellini@kernel.org>, roberto.bagnara@bugseng.com
Cc: Bertrand Marquis <Bertrand.Marquis@arm.com>,
 Michal Orzel <Michal.Orzel@arm.com>, Julien Grall <julien@xen.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>,
 Juergen Gross <jgross@suse.com>, Dario Faggioli <dfaggioli@suse.com>,
 Daniel De Graaf <dgdegra@tycho.nsa.gov>,
 "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <20220620070245.77979-1-michal.orzel@arm.com>
 <dd016e82-2480-0e1e-6286-18b2f677dd65@suse.com>
 <74ec2158-3d19-3b2c-1e8c-fb5b30267658@arm.com>
 <d91bb4ea-41be-225e-e2fe-1b03aa06c677@suse.com>
 <C45BA6EE-6294-4C6F-ADC4-3DE7C8DA866F@arm.com>
 <68d7fb35-e4c5-e5d2-13a8-9ee1369e8dbe@suse.com>
 <BE80A241-7983-425F-9212-0957E29AA5C7@arm.com>
 <7a8d70e3-c331-426d-fe96-77bd65caade7@suse.com>
 <alpine.DEB.2.22.394.2206221212510.2157383@ubuntu-linux-20-04-desktop>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <alpine.DEB.2.22.394.2206221212510.2157383@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS9PR06CA0033.eurprd06.prod.outlook.com
 (2603:10a6:20b:463::25) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5967c2d9-456c-4149-8bc8-08da54ea94e2
X-MS-TrafficTypeDiagnostic: DBBPR04MB6073:EE_
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-Microsoft-Antispam-PRVS:
	<DBBPR04MB6073E63B445925015E907890B3B59@DBBPR04MB6073.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	IDbrkb4cvJIxw9hjpnHXyrxKHnVUcGHFtULvQNBAtbmyKYehpL1vGQVp6DiUxcmcM68NPk23uj4MwElteqQ/UEnCGqzLzNrPUa91pwzAdi7TYMR45deuEyZCLwf8/TPrkIUSku28fvt82sFN7PE65J3ihrwvB9tqWIF/Wd4tFHWKB6Y7cb5OZfTfDT0pJSrdSMaDQtf/wwx8VZ8y/YBsETA0NCOKyGks9mh8/6n6w7YG/KzreTO4GxHMkDXVCh+jVEHhXdzluaAc2bGPISFXuLvXHidlOJEf4kjmHSwOAiUbFZRhPTpVh6OPy3AeO6gsPthCDTmXEQHncciog9+vq4a+Wy5PzTY9lcuTznLKfY5BvFFoEqL1RDDs5cKNU1lwkq+mcyCbMtfBLFM8/cU77dGt/mhZn9TQa08SGEs2UH1sfwsgSVbeePGcoKE1/+j1VDijBc4Pb5edlW/SqJjG7MtW1VV6TKuuegWJvzNyxkifob7jLYxWXsS89UGqwPl/FGyXwyRKzFFT8lWF9DyWtUpM4nE2SIhhyeThtwJFcvZp+ZGmXh8+ID08ZzZrpVNpu8A/b4IeYrckEv9QNo5IkoQrvCIEnyg9Z4XUpqFwMEImfLyw6GIabULCKrFNvHaeusM1leNDw+8hOapSp3LzzNQT6Uv0/FkKr+gxDq2CPsDun8Vaga8Q7JdiVi5vX+EmJ43He3AjVSHJqmHkC4BwH2kYvSUzo8NIKmmkNoPwngbB832gL9tEDfmH+1+IDw0xpabpFxBL3iWw9WjJSAI34B9G5ILc0eyivsrw9/lLaptPFIiaGH53S8OU3oNnPOx5
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(39860400002)(136003)(396003)(366004)(376002)(346002)(66556008)(8676002)(66476007)(316002)(4744005)(86362001)(5660300002)(4326008)(31696002)(31686004)(36756003)(66946007)(54906003)(7416002)(2906002)(8936002)(6512007)(6486002)(478600001)(26005)(966005)(53546011)(38100700002)(6506007)(186003)(41300700001)(2616005)(6666004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?QjdXclU5a09oYkdWUHRTUFRpUlc3S2xCS2I1dG1GdTQ5UnIxQnc2aHNkK0Ez?=
 =?utf-8?B?SDAwazluRk9TUy9pdmYzTGltN3Zua2o3M0YvM0wyN25TN3ZFQkZFdUlGSVla?=
 =?utf-8?B?ZldXKzIrdzdNcmFuaE93TW9GU1AxeEVaMjNOYU5qRkduM1lIdEpCWEdqWHlL?=
 =?utf-8?B?UkFuQldPNk1mblBwUW1iQXlrYWZxcDJpSjVIT1B5ejlEMlRBMHJtK1BFK3Js?=
 =?utf-8?B?M0NZV2tiNnUwU3ZXTzZ0bHVzZ3lZOEFnUWNjSUpkTWpwUnVUSjdOaHNBcUVm?=
 =?utf-8?B?WllCUHRQT1dFVFVEN2tqOENwbE1STENxWDVnL2lnVXV3dzgyYjZnSXhUQWtn?=
 =?utf-8?B?Y1I0RWxWOUVIcGdWS2dNaExFUVJBbzBlckdaSEd6aFhSL2R0MGRtdHUvbUtN?=
 =?utf-8?B?eXdxQ2lEQkY5bW80QlVxSm1PdDNEcEk3dmpBYWdoeWRYT25SeHlxNm1SNXZh?=
 =?utf-8?B?YW1UZmhrOWhPTUROWnNiYzJ1Vkd0RThqN0k3dVA3dFYzR1lkWU1BOWVJK2oz?=
 =?utf-8?B?VGNaN3RYdER1UGxLWjh0YWZncW4rcG5XR1dFYlVrQytjNldqVktEQ3k3ZWlG?=
 =?utf-8?B?RkR5L2JYdUhtK28zQjRCdGhxTC9jdmZkZUpJc0szQUVUWGdoejRtNnhpa0hT?=
 =?utf-8?B?VXZsZTJqMkhGRnhwSS9sa0htc0hJOC9HUGdJNG9rSFU2Q3VPbDh1KzZLUk4y?=
 =?utf-8?B?WkJ6UTA4dnpmUGhjZVR5Q0hmQ2I3WWVQTUI1VFhaSFE4ZytiRWRvMENUOVlz?=
 =?utf-8?B?ZkRSSTFaV2V0Sk4xYjNWdjFoNGVZQUhCdHpiTlhQakYxcHRFazRiRVpTalpG?=
 =?utf-8?B?WEJBZzV1NzZvelhLVkNLNHpMWllFS0E2RTFzL0hBcVhBb3pRaWRhUzhUNXNL?=
 =?utf-8?B?QmhERzV3bGpUZDZTWE9VSVVPTENnMXhyWHRoa3ZYUzVyeUVSK3VCTjhocER1?=
 =?utf-8?B?Y2dPSHVIbmdBYmh6akwzUmxpdlpjZUI4VWZkQlhxUzVjL2hxa2ZoankvSUJz?=
 =?utf-8?B?b08rcVF6QnJUalZsNXZsaGtNdVRGaWhLY2JteVRKeGFNa0MyVHpNSEQxVVV0?=
 =?utf-8?B?SHR0QXoveXBYZy9ud2szcjd4aW1ZVTZDcWw3OWU0WHRRSTJQbG52TnFiM3lB?=
 =?utf-8?B?c3ZtSTl0LzlVS1dwNFczZVYvZ044b2hzczBPUk95WGZicURpV3g2Qk9wWkRT?=
 =?utf-8?B?bFd4ZUZOZDVmMTkybnB4VEsyKzQ5N2xrSEt5NzlOWi9mZWhDbHQyOWp6TkUr?=
 =?utf-8?B?N2lhanFUZ29vb0hPTEg4RWFzWHVWQnlRZ2dGbDZnZ3NJeGNhOGZpemZ5cFhX?=
 =?utf-8?B?VmFpaVJxVnhOcjRjOXVjZVhhZEJIUlBIL0cwSkdsaWVsUTFqOXBtNFFoamlB?=
 =?utf-8?B?bHBRNHkxazFLVVJtM0YwOFdhWW9PTXUzc0FRd0x3andCMzRqa0dkamdTYXBS?=
 =?utf-8?B?MVdwejdWKysySExHWWp1NFU0UGcreW9QVExKc205TVlDK0FQRmNxei90KzhT?=
 =?utf-8?B?WWk4QjRCRTFhK01OK3hMWTNCRndTcnNTSW4wZU4rb3VFUmRkeXF4aE9iNkRk?=
 =?utf-8?B?YzBPcG1IbnozQ2I1WFNaWnBzYTE4bnpSKy9kWW5JamRjTjgyS0toNERidTlh?=
 =?utf-8?B?UFZ1aUpwYXkxaXhETUVTbFFnSEFLQk9YeStneXJ3bnFOWE1OMXBabThHQkR5?=
 =?utf-8?B?cVFUZWUxYXZ5N0FrWXU5SUQ3YktmVTErU21ZamFDcjlEekZrckRRNEVRZnhi?=
 =?utf-8?B?Y0lSS0MzZ09PUGcrSjFrbjBMbnZYWVRYSWJ4WkFIQ2JSTUsraUt4bGZpUlQy?=
 =?utf-8?B?R0pSb0xIYUN6WkpENWxqdU1QNDZLeko5cHFRWFg1ZU5GTXd6RGxkN2V1Y0RY?=
 =?utf-8?B?NU42UERpN1pUTUlSYkVpbjArR01DRmlWZWxSeGNza1grNmYzM2ZKL3ZBcXJv?=
 =?utf-8?B?WlFSaENDRUNCb3pya3Z6ZlVZb3k3ZlhXNk5QMkhuUTA0S1lYTnZUUzFIYUMx?=
 =?utf-8?B?V2JGdEtLZnJWSkNWU2tHUkVQeXdnZzF2dStOUjNtSHp3bjFMTkk2V0QwL0Jo?=
 =?utf-8?B?WXE5dG1MU1g3MnVQbWNUdXJNTGYvK2NaRk1sbkloZ3dSd1g3dFowZjMxN2NY?=
 =?utf-8?Q?wE/2HRIOA4vdJQ8+sSl6XDlyH?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5967c2d9-456c-4149-8bc8-08da54ea94e2
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jun 2022 07:32:52.4707
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cyB7iBGc43d1owNBPyzwuQ5zyjU2cpDZ6TWyalEUJOxv0uWVM8iW5oR2Vi4b7KhAm0TU14Mp/CfJZfcilfHekg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB6073

On 22.06.2022 21:23, Stefano Stabellini wrote:
> A quick question about Rule 8.1.
> 
> 
> Michal sent a patch series to fix Xen against Rule 8.1 (here is a link
> if you are interested: https://marc.info/?l=xen-devel&m=165570851227125)
> 
> Although we all generally agree that the changes are a good thing, there
> was a question about the rule itself. Specifically, is the following
> actually a violation?
> 
>   unsigned x;
> 
> 
> Looking through the examples in the MISRA document I can see various
> instances of more confusing and obvious violations such as:
> 
>   const x;
>   extern x;
> 
> but no examples of using "unsigned" without "int". Do you know if it is
> considered a violation?

And if it is, by implication would plain "long" also be a violation?

Jan

