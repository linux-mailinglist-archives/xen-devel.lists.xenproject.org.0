Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AFCB2697F85
	for <lists+xen-devel@lfdr.de>; Wed, 15 Feb 2023 16:31:36 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.496066.766602 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pSJkH-0000PQ-0M; Wed, 15 Feb 2023 15:30:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 496066.766602; Wed, 15 Feb 2023 15:30:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pSJkG-0000NH-Tv; Wed, 15 Feb 2023 15:30:56 +0000
Received: by outflank-mailman (input) for mailman id 496066;
 Wed, 15 Feb 2023 15:30:54 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=7OvG=6L=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pSJkE-0000NB-ME
 for xen-devel@lists.xenproject.org; Wed, 15 Feb 2023 15:30:54 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on20627.outbound.protection.outlook.com
 [2a01:111:f400:7e1b::627])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b93d7709-ad45-11ed-93b5-47a8fe42b414;
 Wed, 15 Feb 2023 16:30:49 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by PA4PR04MB7584.eurprd04.prod.outlook.com (2603:10a6:102:ed::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6086.26; Wed, 15 Feb
 2023 15:30:46 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e138:4fc3:705c:d178]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e138:4fc3:705c:d178%7]) with mapi id 15.20.6086.026; Wed, 15 Feb 2023
 15:30:45 +0000
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
X-Inumbo-ID: b93d7709-ad45-11ed-93b5-47a8fe42b414
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=G+bJBoOae6PHeb/sivNiouEfZrXFht4cJLmigpHGIVtxM+4G/wE3oez9km/06DZA2pYGSk8stihVEx81xJwexHUt8BIEslW6ISReZBRBiblZIOApcSjOPQw2rSFOjD/ZnAQN1wNhSABLKp8i0DnEJUCMuok+I/YPwnWEr6Us6kS1la3A2FfJfG3Sc+e75ciIYl1RngLZmeJAJ4JLpuHLfFpbuy1MjOH3SmaXAR6DoO8BOXM2R6QR8bdvXMZgfLUaTw/rhlH4b6IUmnSAVfaijXHQ4E79sCBGVGcrSKahG5tNmFlXrI9gfGm3kVzfQverUe0T4NjtUjIcf9oetN9Gwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5E/eOlr4+msGuMlFNU60Z+RfH2+XGcrIuK0FW39cbHA=;
 b=PyVrIdhRiHfjf31JV6VtYPEPmFLnSWsB9bZGJLVae13w1eHm6/jvSsonLEw0ycvAUIP/8zyO6lV/rRa0MmhpsSf8Ur9I3S/q4FuvgROOVGX0YmR+WWk8ZPY432hZir7evzvAyEKAdvrldcHBqpF5pGy+ZW/rRrOTy2bfFBUkOQhqiciX3o8Z6zF6KwL+6LVSlF8uebr9sFwdDr1rMG9DlG2ARkUNIVcc8wtUcpvWphMSiJsqj/tsGX1jYLpBZE8HDUkCM3rJ0TPLivFJOa+BjmaEdTd7l1fyvhrtCXuF7pNw2dtGWcu5159uwcy+hQ5c1QQn4tHx1iCDru0MeqnsRA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5E/eOlr4+msGuMlFNU60Z+RfH2+XGcrIuK0FW39cbHA=;
 b=HpjseEOChpgqMn+zFbiPPyjd9JvQjqKSSnqBdGq/BvjQfOBAbb9UaQu+NwQeMhvgghLWxSt5Nrz58JkFpnmjjg27ApbFxR4fo7VJ5Md7R2K65tQrJAm4PVk2SsXKrgz/OAgIJSPE73BzbUGOc2vLRvBITj0adHS0zPW6cc0rxRe9PjI5kUeW422/2S3GcFqgFi12gP0kTMbvw2IDeTy93O4Na3H4KLibeDLUEiavEsm0xKXfSsurgb32zVWW0eVpim0DjH9qwI56gCNPRNkkeSNMU36BDrhzD0MvzPgUJoBgIOzlNAwbWlFyPzp13D4TwJn6xYPWn/eDSv58rus70w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <b105cc38-315a-f3f5-0f8e-f3501d31a76c@suse.com>
Date: Wed, 15 Feb 2023 16:30:43 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.2
Subject: Re: [XEN PATCH] libs: Fix unstable libs build on FreeBSD,
 auto-generate version-script
Content-Language: en-US
To: Anthony PERARD <anthony.perard@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org
References: <20230215152111.51218-1-anthony.perard@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20230215152111.51218-1-anthony.perard@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0074.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9a::16) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|PA4PR04MB7584:EE_
X-MS-Office365-Filtering-Correlation-Id: e269693a-3d61-42b2-e6fe-08db0f699b46
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Avy44ceVgXZSTqW8AqE3mQQ2ObWqJvgwOcvrhqxxgyV7PJQsILXmyYlpovJKFFmVZTQrv0HPNtrP6MrfODzpTxfJAF1UULIxXzsXZY2gg114Kb3+9G5zQkL+ncvlWbRMB5KWx5NeUQHAmeghxbG3vh7k5lfz3syONidXJ+WTcQ0Y3py9nyPCdUIi52/6Ko8z3e492QqyoXe8DR1uknHVFW3ItlhRL8jWSlY7XzN787s7cWCumNiUemP4flyu47sCV/whlTU3MtEvNi8R9xTUjQAsbH6smN9hI+EWcthrPGrRovbjcpfrZc32EGACdwrd0Oz5BLClRgby64S9CdOhFg2JloYg0JzE+4wA4eAqqzg6SoNEnNW5RF7IZHyTOb3OMhHtvvir2p613aKAHGDXBPT0MjG4ImfIuPrU38kaHS7U+5cfVhsxQGu7YaznwikYHhEfivYL/7+0B2Rnb9B7jgILQj1i3knJimN7C8oEOTGMLyupQ4Z/V4Mx4Pg2Qi45EEGL3wTs0ckotilgOfM8MzgPDX2qRditlntb6AccDFh9bVbXm7RHwreN6XhXLEI8z+3Oz6rgNH5LtM8VEbyWCXTrvC3hnppSvoS3s1APOg00gyO80MAKHQAl87O10nG14qd25Owix2XMDRmEhp00Fw2zq+WRo0c5qX+vOlVEUVhfMgu0XvWA2Yq5PZjrvy7l7/nshrt4qP7oDqRgcMZAaHBev6YrUGTjF/q+z9AfC4o=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(396003)(39860400002)(346002)(366004)(376002)(136003)(451199018)(53546011)(6506007)(54906003)(8676002)(86362001)(8936002)(41300700001)(478600001)(6486002)(38100700002)(66946007)(36756003)(2906002)(26005)(66476007)(66556008)(6916009)(186003)(6512007)(4326008)(31696002)(2616005)(31686004)(316002)(5660300002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?K0R0bmtKMmt4RHNEWEpYUnI4TkVMUWxkd3JnY2ZIQkVVTUdtU2o3QThPMkVB?=
 =?utf-8?B?V3p5M3VhZGpNZXpMMFMvcktZS0ZuYkU4bFh3d01Ka0xMNHA2Zm9DWCt6cTFx?=
 =?utf-8?B?RWNqWnAxeVllbDhMY3hiMDFwRXVvbGlhb25CbVl3TWg0ZEF0M1pMUTBXb3FF?=
 =?utf-8?B?Tkxjc29qT3BKUi91dWliRDN3cHNuZEgvZEs4ZTQ0UGZ0VjJzR0hTTFAyeGxP?=
 =?utf-8?B?R0lOT0NHYXMxOFZxaG0xUWtHZ2dWendDeVREM2J6MDQ5TlltMGl4TWtNSjNW?=
 =?utf-8?B?RGtmVlpWdmtxcGlodEtJeVJCNnFaVm1PUEoyUlFvRUYvTDYwR1Z4Qy9rVVY3?=
 =?utf-8?B?dnhtWW13VlByZkNjOE9TT1JuY21qeXI0NWtDOTFNS3kxejc0Z3JsYUNseWxv?=
 =?utf-8?B?dllDaU8zRVRIaTdmTTBNM0p4M04wMkV3Q3h2bWZiMVdPSDJMeW1tVk1vaDZQ?=
 =?utf-8?B?TFZkVWl3QkdvNzBwY2xMdXduelNIR0gwdWNueUpMcngvTEVZZUlmTm9TbEQ0?=
 =?utf-8?B?emRieFJVekgvSEhGem1IdTF2Zk9CTTJEWDF0QXRHejdVYkdFVS8za3NXR2ln?=
 =?utf-8?B?YW9jaklHSy9STHNRYXFiM1FJNzZ1bndWWG9STzlOSktwTlptRHNMcDNwOFhW?=
 =?utf-8?B?d21za2VEOUNpTzlmV1pOaHF1cGJmbTRRMFV6cHF3RzR4Y2lnL0FFWWR6ZmZm?=
 =?utf-8?B?dkpHd3Y0ZzVrYU8rTnRwOGlML2Q5dGQ4MlU2RWdTMDFxOUxlTzdhVW5iQTUv?=
 =?utf-8?B?Y3RZRXhmVHdCZEMzSEZSQldDMm9JaExCQllCQjRQSDBVKzVZV2drTVdpbmx0?=
 =?utf-8?B?TG4xTHVXbTdPYnoxdmRkRDJ2eUdmZEFYSWtvM3VHZTNVUEhHYjJZaDJiMW9h?=
 =?utf-8?B?VkNlS0hKeGR3TGtpVEtpbHFPN1FDZndYRmdzZU9LaWJ3a05WQjRqUGczL2dC?=
 =?utf-8?B?eE1WMFNLdkdmRlNiR1FtZWw1TG53SlAwUE1QTkxjT1l4S29NYjlkeVp6SElS?=
 =?utf-8?B?cG05UU9DQThqUFV2U1dSamVYa1Y0a2lPRkNVMXI1M095Tjk5L2RiN0hmbmU1?=
 =?utf-8?B?Mmk3ZUZad09icy9saTJsckxJMTN1SEIxVHNYSDhrWCsvSjl5RFpLL2dFdTlM?=
 =?utf-8?B?Rk1meGJWTHBqWVBrUjFJdGMrRm9ERkdxWlNjWi9XVjFTK3VKelN5akJ0cWJO?=
 =?utf-8?B?S0NZdFF4MHlJc05ob2JLMXNKSzFnbzJXbi9odGxOQ21NMjhtS0pTUmczd3o5?=
 =?utf-8?B?dFNhaU1vRFRrQWFRaEJwNHRTeDJJRTBwZjRUSGtUcG9PSlZLUWRHTldiV0Ry?=
 =?utf-8?B?RjdySThyNVpwMlVMTTJVR0hEK1VmS3crTFF2SWJwL293elFHdld2Uld4SVQ0?=
 =?utf-8?B?MDJHWWQ4OElFZlAwN2xxVm9kZVRnQzdGRlhoNXc3bDRTZDgvRmtWVlhGQmFD?=
 =?utf-8?B?S0JndkxIbGUyVHVQOHhaWk1nUlc2aFZ0QVpoSXR5RDB5ZkhOQk43c2ROTE4x?=
 =?utf-8?B?U2xwQTBTQnFBamRtT25lb1RESGxTelhFS2kzOW5xbGVTeGhudDgrNzRVVTlF?=
 =?utf-8?B?L0tuVkVzUU5jYXlIL3htRUFFNC9HVVo4S3cyTmdMcjdZMzdTejBvQWpheDJk?=
 =?utf-8?B?RVdqU0tPYkxTK1dpZ0JEU2RDaHVzU3hXR2Jod25xMEd2SFdVbnFTam5kWVJa?=
 =?utf-8?B?ZSthV01BdTcvd2RtVkkzQllSdUhGNFNXNWptRGFSSWorS3BVQ01RaVpTOWd1?=
 =?utf-8?B?L2tiYVZad3pRMXpDOHZNVm1sNW9SK3k3UktIU3BvcllYNVQ5YmtaYm1pUkFY?=
 =?utf-8?B?emtPaXFEdDFCQ0dXWUlwMEFVV1B6bUxSODRqRFQ1S1BCNGpQVncxNC9pQUdR?=
 =?utf-8?B?T0E4RGp0ek9tYW10QmhVeEVmbHZZK0hlS0pIaTNvTnBUeXJMUUhmcldSSlVt?=
 =?utf-8?B?Z3MxRHNGV1Q1OFZ6UmkxdmpSMlM5TDc2SW1xRjVmNUQ5S0JlajI3bnVBcTNM?=
 =?utf-8?B?cE1jcitaZW56a3l5VW5SMzlKSTl0NVNsL1ZqZy9uWjdZd0hSU05aS1ZPcHZ5?=
 =?utf-8?B?YzJoc1U3YWxncTJJb0xBQ0EzdldlbVBQM2NFM3ErZ2x2K3Q4Mm5TVm43M1da?=
 =?utf-8?Q?InAbv4pPiSqBi044nn8oyIQ7N?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e269693a-3d61-42b2-e6fe-08db0f699b46
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Feb 2023 15:30:45.5873
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: f2U7K5yUUPrbLJr2nkUzNzmE8pT6Cg04Etgf/OcHFGHlKjesPvtDMxfRt362+Pzj51B2PfwFHbOOssf9IoiLCw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB7584

On 15.02.2023 16:21, Anthony PERARD wrote:
> @@ -13,6 +14,10 @@ MAJOR := $(shell $(XEN_ROOT)/version.sh $(XEN_ROOT)/xen/Makefile)
>  endif
>  MINOR ?= 0
>  
> +ifeq ($(origin version-script), undefined)
> +version-script := libxen$(LIBNAME).map.tmp
> +endif

Such a use of $(origin ...) is pretty fragile. Maybe better use ?= ?

> @@ -72,6 +77,10 @@ headers.lst: FORCE
>  	@{ set -e; $(foreach h,$(LIBHEADERS),echo $(h);) } > $@.tmp
>  	@$(call move-if-changed,$@.tmp,$@)
>  
> +libxen$(LIBNAME).map.tmp: FORCE
> +	echo 'VERS_$(MAJOR).$(MINOR) { global: *; };' >.$@.tmp
> +	$(call move-if-changed,.$@.tmp,$@)

Isn't this going to get in the way of your "build everything from root"
effort, where $@ will include a path? Also do we really need .tmp.tmp
files?

>  lib$(LIB_FILE_NAME).a: $(OBJS-y)

Seeing this right adjacent in context - any reason you use libxen$(LIBNAME)
and not the same lib$(LIB_FILE_NAME) for the base file name?

> @@ -120,7 +129,7 @@ TAGS:
>  clean::
>  	rm -rf $(TARGETS) *~ $(DEPS_RM) $(OBJS-y) $(PIC_OBJS)
>  	rm -f lib$(LIB_FILE_NAME).so.$(MAJOR).$(MINOR) lib$(LIB_FILE_NAME).so.$(MAJOR)
> -	rm -f headers.chk headers.lst
> +	rm -f headers.chk headers.lst libxen*.map.tmp

If I hadn't checked, I'd have assumed that *.tmp are removed without
being named explicitly. So yes, I see the need for the addition, but then
I wonder why you don't also remove the .*.tmp.tmp file, which may be left
around if the build is interrupted at exactly the "right" time.

Jan

