Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gN2CGvqck2kM7AEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 16 Feb 2026 23:40:58 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B4018147F34
	for <lists+xen-devel@lfdr.de>; Mon, 16 Feb 2026 23:40:57 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1234566.1537780 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vs7Gq-0002oS-Ep; Mon, 16 Feb 2026 22:40:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1234566.1537780; Mon, 16 Feb 2026 22:40:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vs7Gq-0002mV-Bz; Mon, 16 Feb 2026 22:40:48 +0000
Received: by outflank-mailman (input) for mailman id 1234566;
 Mon, 16 Feb 2026 22:40:46 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=aABt=AU=citrix.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1vs7Go-0002mN-NX
 for xen-devel@lists.xenproject.org; Mon, 16 Feb 2026 22:40:46 +0000
Received: from DM5PR21CU001.outbound.protection.outlook.com
 (mail-centralusazlp170110009.outbound.protection.outlook.com
 [2a01:111:f403:c111::9])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 87aeaee2-0b88-11f1-b164-2bf370ae4941;
 Mon, 16 Feb 2026 23:40:45 +0100 (CET)
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by DS7PR03MB5608.namprd03.prod.outlook.com (2603:10b6:5:2c9::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.16; Mon, 16 Feb
 2026 22:40:42 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37%6]) with mapi id 15.20.9611.013; Mon, 16 Feb 2026
 22:40:42 +0000
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
X-Inumbo-ID: 87aeaee2-0b88-11f1-b164-2bf370ae4941
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ab42uvZD+yIpts01eCNdZZQ6b33NVhvqeCG37eCRG99Z977ODCbbd+3/PkbBfsnOZAZZ5xGTuZoZ3qaSxJISrUhIr7KEoeNKygiDqijltYWYVAmO/3cdS7mThmCIjHVlToNr5aZ21F2l0GKXXYObksOoe5fnpT2wqkYcPjLTo3tTowxhK9X+MnpCJjMTAIwNoel648PhRA8kMC8iuDJ/7R6VMxMUUMLFcLML4/aJm2xpqOYRCUFysmGcjV7dZM0zfCcFPrZyyl+8SHfeauCADpAOiVmsGLBDt0ICxf69N+lfIQCirw7/7ovWYbRB2iXDk3zRuzFQjQTuJ9vZicZHGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CCyj+0dMbRlPT1FanqzDv8gxTeACmdkaogxjs3IUObQ=;
 b=YCJrfBbmGpqC6tV0EbUsBBp8cyvBHeR8BdRr2j71BU+2eQPB0mjoCSNVhW48BpxIftiCFTL1LjFDe2HPy6vQMwmMnkGPP4dn8XXCrmb5Y0jYPOE/ysuxU06LWfKJfNbKbA1Y/Cr7Nm+YiZNb9sj331kIyyw+6iI/ZpjIreqQLaPBdaP/1oEcKTa0SL/UXJpCdyswpwV1AY0keNsoeuPMXT9NwBH0mB99VjXRlK4wpnirgxArLxkI9A562tgu95CFktmdcit8qa2akrJ5UzTMdPh4Qf9/bgBAtvVKfeijp1gRzz1Dz3YtExYZHeXXix1Z5GsV1yAUfhf97uPhFnnHAQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CCyj+0dMbRlPT1FanqzDv8gxTeACmdkaogxjs3IUObQ=;
 b=m+UmHRU6wHdQhLZRmMACZvPFoQ03JDhu5tPAtXdsCbH9I08GzNiRadN+ASMDVsN22/aL2dG8YPm0+3e6sV/ptV3RWgYezsuss3mrHMqtOnT6cC93UgMaMHy9yANEnAjqAoHRuEhRpQ/EqicVEnelNyQPQE+QFbwySSK+r6lbaaQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <e61c00fb-05cd-40bf-9aab-1b6281399bc2@citrix.com>
Date: Mon, 16 Feb 2026 22:40:38 +0000
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, roger.pau@citrix.com,
 Jan Beulich <jbeulich@suse.com>, Jason Andryuk <jason.andryuk@amd.com>
Subject: Re: [PATCH v3 2/2] x86/svm: Use the virtual NMI when available
To: Teddy Astie <teddy.astie@vates.tech>,
 Abdelkareem Abdelsaamad <abdelkareem.abdelsaamad@citrix.com>,
 xen-devel@lists.xenproject.org
References: <cover.1771177081.git.abdelkareem.abdelsaamad@citrix.com>
 <ccd7d351fcf47e6a74bd6bdfe3fe8bc9f5023e7e.1771177081.git.abdelkareem.abdelsaamad@citrix.com>
 <c0c2e0cd-173a-496f-a643-7d19c9418a2a@vates.tech>
 <ea21a66e-a4ab-41f9-92af-0111292ecb3a@citrix.com>
 <626c3f3b-9176-493c-9d96-e2a5344e7100@vates.tech>
 <518e7576-a88d-4172-bf93-f6a368c173d0@citrix.com>
 <87801307-0c7e-4d34-9f14-645c1cd73426@vates.tech>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
In-Reply-To: <87801307-0c7e-4d34-9f14-645c1cd73426@vates.tech>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO3P265CA0033.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:387::16) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|DS7PR03MB5608:EE_
X-MS-Office365-Filtering-Correlation-Id: 66a1f2a5-923f-40b7-dcf4-08de6dac6a69
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?dmpheG53RVNSUm1ncUl4V3RRMkw2c2wrUXJiZnE4NG1xLy9TQWVBNm94Ym1W?=
 =?utf-8?B?VDlLSjM4aVhvN3RBUStjcksvOVNXK3UyeXhTd3pTWVdPdmFhOUVPakhBTitM?=
 =?utf-8?B?SGQvaE42Z1ZLUW8wUGtyVVBzb2E1ejFEZHBJZnJrQi9ST3VaUThlUG9RaC9L?=
 =?utf-8?B?TEhxSGZOSmYyRkpFVmRCOWJSV3BvQkJNck9CbVVlUUV3UysxVWZpNTVzWDBw?=
 =?utf-8?B?UVpnUloraUk0V0NsVVB3bHFXeTJMbXYyWmtaN0RsQnVYbWJTNGI3ejhBQmFI?=
 =?utf-8?B?dzhTcnFlUGI4T1p4SEJLcUdUdzNERG5WcjRZRWdWeE5TTUlsSndDUHRiSVYx?=
 =?utf-8?B?a2ZNVDVjRklEb0NzNHVRUG1LcU9aWDBQRkZCeGxrM2JYUjFNMG93eEc2Z3pS?=
 =?utf-8?B?WGlPaEtrVXZMblZSa0l1Y2pLYVFOZ1o5RUZyWTBDK2VONk9YeVNsNjN0Vk9L?=
 =?utf-8?B?ckwvM1ZXMXlwTmxSUlpqTmJ1aElNSXE4Q3lVVzNEdCtqNmVyWXFHVzdHbGJD?=
 =?utf-8?B?ZnZZTzlvYVZiTDJ4Nm9hVnEyMGx2N1JGZk5Dc3g1Y2tIL0ZLYWNMRVBNcWc4?=
 =?utf-8?B?d3JtN2FSK1p6bGRSVERXSDR0Z1hUQ3pRdUJkYVV0bndyVmxSdmdXYzY4NlJH?=
 =?utf-8?B?SExFcytqUHVJaFpZTG1CTmpWcWRLR1U1NzlQTjZYeUdnMlhBREtlTXVEb3kw?=
 =?utf-8?B?dnVUMUV5cjdYemF0dTlNVmE5OUk2Umw1RVpwRlBoZlJKK04xMlFUUnhHWG9n?=
 =?utf-8?B?Wi85Z2QzOUQ1WFpOZ29IWEt0OWlyZWZ2ZlZNMzRHK212eFdlbWN2M1grT04x?=
 =?utf-8?B?RFhiODN5TWdEU0hHZTBvODUyb0VOT3VyNk12eEVmbFppdmI5THJ1M0tkc0VU?=
 =?utf-8?B?bTBxNEM5d0U4ellXRDRwQ3NaaUNQcTRBQkhiaGdqNGdwN3RuNTJLME15Q282?=
 =?utf-8?B?MWpIbUJzVWVZUHNDaXlxRTJaT2VHa0V4Yk5oeDlPcG1RdzFOUmQ0NVk4TEN5?=
 =?utf-8?B?M1lKY1RQWUZlNXFYVXZkQnVTN2FQY1AwOFg4TzFGNkIrak84VFRDS3pZd0NP?=
 =?utf-8?B?UlladnA4T1lmaUlWSHpONm1adlNYeHBQWjhaeHcrVlpZYkZtYlFsWS9tSDJh?=
 =?utf-8?B?QVp1aUwvMVA5ck5FSS82dWxHU1FwSWV4SG1ITkorblkwT1YvQ3ZLRitkek5X?=
 =?utf-8?B?a1owMTJIbXNReWdSVWhuQnFMNjlWS3RnWGlBNm9melRiVWg0bVpNZ2VJWWhi?=
 =?utf-8?B?ZHd2dVZBdEgxYmtCMEZkbjYwWGFDN1BVSDRoL3NSS2FQK1JacWpZRDV4MytW?=
 =?utf-8?B?SmtBN0ZuTDJJRGNXbGFUQWRwdG1mS1R4Y1FnYkdPZkUwRDdPZHJ0K0d6WnFT?=
 =?utf-8?B?dGQ3T2VXSHhWVHhnZHhxRHZZUlRKeWI4c0NrcjQzWXh0S2UrWDdYRVA2ZXdi?=
 =?utf-8?B?SStYSkpPbVY5cGlSamlRRWREUjdwcEg1RVJucGNpdFp1elhaNWxveEpnZ0lU?=
 =?utf-8?B?b2Y5TEo4V3kydEEzZkxjZktKc2ZvYWc3OXRBdzVPZEZhMmxwTi9DbmhxMTNX?=
 =?utf-8?B?d3RVNGk1Y29XdVh2dXljUEtmRWhadkptWTBNRXdZdGVZQnF4QjhpZUZXKzVF?=
 =?utf-8?B?TGYzYW55U1FjRjgrQWtaV3JGZmhkczByUVFzUUt0UTNQNS9XTFBZVEFydUxk?=
 =?utf-8?B?Z3BYb2ptRHd4NkJ2VFFCcVF2YXlMYW1sU09CZWlzVVFwdlhKMEdSY3hSVG9V?=
 =?utf-8?B?TnFUTjdwR0JYNEFUTXJ4SGVJUUIzSHNvNkdwS0R2eEp1TUE3dGNmT1ZOc1JT?=
 =?utf-8?B?TGk5WlFudnc3WkRHNldQbnZaM0dGNlJrNmNNSnJYemJZbXQzR0xxT1VCN3Fa?=
 =?utf-8?B?cldJMkFtQjB0RHFIQWR1NTg3anlWN3NQTVBuZlNCNW92a2FkcEkxTUpqVmJr?=
 =?utf-8?B?UFovRWpqMVZRdUdSeHFXTGw5WldtTlRWays3ald6aTEyakxxWWtJcDlvVXZ4?=
 =?utf-8?B?dTFlZmJUVE5VUEwrZTRIeThOeEJHYlF0MEI3ZVJ1OEJsQ2xvN0M4cE55eC9N?=
 =?utf-8?Q?CZmiQs?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NnpwOTJ1dDdpeWJHaS9raUd6YndnN0hSSlA4a2tFS0dXQkFxem5xYUZETkt1?=
 =?utf-8?B?SVlNKzBDNHRTYkNXazQvMnBPd0g5Q0F5ZFFlblR1MmtacVdPME5lVzdycGNp?=
 =?utf-8?B?V05BZE95ZkorZWNBcVBrWE5KL0tvWkZUUGhCbkZtTnVNVjJ3eWNCYmhMNi9p?=
 =?utf-8?B?WXVSQmVWRW9SRkxxQnpoSGRTM1RxbDdzUjFLVjZHWmVZV05XRkZSSDI3SVgy?=
 =?utf-8?B?VWhVWExPSFpkR3JqMWdsb1hteUVxd1h3K3ZURUpNbXd5ZndRSjhqSDFwejNZ?=
 =?utf-8?B?emdXYUdyOVk5amErS3orcW5KY3pKcFVFUDYxMTBZMjBMZGlIN1ZUVXgwV0Rv?=
 =?utf-8?B?OGliTWx2SnVQc3d2UzdYbFI4enoyU0c5TlpVT2dpUnA5R0djY1h2LzhKUG12?=
 =?utf-8?B?eFdIUFY1T1MvbmN4WFh5aUVsOHRBcElhVGNuQUFLRHR5LzlYWURTVUZnVW43?=
 =?utf-8?B?azFuRXNGRXMwNElDRkRRWE5mWE5WV0w3MVUxWkpKWWJKdlpRcm1WMzZrZ011?=
 =?utf-8?B?RDkxRzhGY1hDeHliZDcvMTd4dnNyNjBYWkVEdEF3TTA1NUFoYjR0dFVvSWZQ?=
 =?utf-8?B?K0lsTjM0STRkbElUNjIvTkJkVDdITUhhNHRucVhIVmxHZStlcVlxdlFEemZ2?=
 =?utf-8?B?WjZkb2dHVVREM2RkdkdkMUFQdlhxTW9hRkl6K2JtMTlmSHBNZlFuNUxJbDlr?=
 =?utf-8?B?K2pCZTBqRUNNOGtlZkJ1U0JlS1hMYTZYOVY3aWtkdllpbnU2MTBBM2RKNTgy?=
 =?utf-8?B?Z3N5RjNidHBVaVJud09oMDdXN05SZU5semFsSGhkMDI1cGZmNFNmSnlucnZy?=
 =?utf-8?B?R2dwTDVXTE1XN2FKZTFlWXlzUjlibktzNjVDbVZIRzZ6SWdnY3hEcEpGY1BC?=
 =?utf-8?B?bktWVlhiYjZ5dUlHa0hRcEUvSjFXTEd4eS9hYXF3akVCb0tPYmswNXlzMXBx?=
 =?utf-8?B?Z20rQlE4WGJWRmt2S2hPWU9TY1dPc3dHWldOSGZKdjdaRHUxUDRZaVBxNEM3?=
 =?utf-8?B?RDdoVnhHQjlUUTRGYm5ta1RtY1N0YW96S2NSUFJ0NS91cVJ6cnhjYXdxdEx4?=
 =?utf-8?B?Uk9odU5ycmFGamFEVUFBbkZEcmRoUzZ0YkxJdzJCYkkzR284eG5BU0N5ejM4?=
 =?utf-8?B?cXJwVDNnbStUOER6d04yTDJYa2tBV0JjemFXdExLbEVJbnVRTGdsMW9XNUVm?=
 =?utf-8?B?SVlRUEdXbXpqUEtoM25yUGxPVTNzZDlhVVlkTkRDZFJMS0RLOWZZVVRtNzBD?=
 =?utf-8?B?U0tReEUyWUthVnVTWmwva0wyb2cxSjRYTXRSYUNrVGNOV2w1T21MYXZYVnVE?=
 =?utf-8?B?anZrR0JaOHdpQno1NmtRc1VkdEJvelAyS3dXS29nNStkMGsra3JsdlFMTHZQ?=
 =?utf-8?B?dm84bVpSdXkwWGdFOG5wNHdDT0lST3plb0xRM0tTVGxsUElrRzg1T3BhdUM3?=
 =?utf-8?B?RUthNFExVHBOQTdqSzdEZ2pJS1k3UTZWTExVVFQrZW5Qa01IcmRWNzJGR1dq?=
 =?utf-8?B?djJvTzBaVW8xQWNsalQ1M3oralJIK3l5dDY0MHN3elZFTC9oZVpxVTN3KzFs?=
 =?utf-8?B?dWtzVGxLMTNYZEMyQzgzL3YxS0Q0TXB3YjIxSUU3U0dmZC83VzBmY0MwL0RT?=
 =?utf-8?B?ejk0OG9vdVowYjRkQnNLYU80NURjVzBpakR1emIxUWRDejNjcGJWZWh4bzN4?=
 =?utf-8?B?K1hsaiszQWZzTlkyL3hpOHlZK2ljRWVTQS91YkV5SWFUUjZnem5nOUFITWR4?=
 =?utf-8?B?T1dmTTZWMlNuUnhEY0I5dGVnOXBJeWZ6WmRrS3dSMXpFc0lIN1E0TXpOSnlW?=
 =?utf-8?B?eE5LbmFTOXNoM3Z1S1k1YnNBWktMc0VkWStKY3BwL2hzUFNKQmRQdk0xckxI?=
 =?utf-8?B?Wnlnd3QzSW91amxFYXBMcEQ0VXcxN3crLzNzYVFlNWZvNjdKeUs1a0pEVnpC?=
 =?utf-8?B?K0pOc1VQS1ViUjlpbzZOZFRYdXNEa2swaFZ1YzUxQmpFTGZkR1o4NUsrWkdU?=
 =?utf-8?B?QUQ0d1Q1MjhqSVJOVjhpeC9hVDkxdGpPcloyaFhOZmF4NXMvTmR6TGdVYUF5?=
 =?utf-8?B?UmM1OTBGcWgzNGRJSHZUdENMWmRMaG1kb083V1o5bTd0WVIzZkYwNGpERi85?=
 =?utf-8?B?ckczZW05ZmhubWFFbDZuRmpNaTBISnpJUHR6Q3pJdTZRQ1o1L1FIblF6UTQw?=
 =?utf-8?B?Q2RSWVY0SHVNaHZHcjQyaGtYV0lSbWMzeUh6NkFkblFadHZ6RFBtSVkyTGs2?=
 =?utf-8?B?NHZ4UWQ4b21wZXNCZDh2c2R3Z3V5aDVjOGZJR284dCtzdFlVNUpsczJJNmZT?=
 =?utf-8?B?ZmdUdmptTkt6ejcyMDdrSC9NNjJnVHhTMENnczRpejZ5cXRCWnh2bmxoVmtB?=
 =?utf-8?Q?07mV25+eJd01Zbxc=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 66a1f2a5-923f-40b7-dcf4-08de6dac6a69
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Feb 2026 22:40:42.0904
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: f3xWfZ0ywFiiKCaJfVSRFojzIP5S5UOvuqkDQRkhRH3PDlQJ+w5LIbAQyB+WJfeIJcLX55vtvtUXAy6myGOE34yKS2UCD5iUGPFwcRqq2c0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR03MB5608
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:jbeulich@suse.com,m:jason.andryuk@amd.com,m:teddy.astie@vates.tech,m:abdelkareem.abdelsaamad@citrix.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[citrix.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: B4018147F34
X-Rspamd-Action: no action

On 16/02/2026 1:10 pm, Teddy Astie wrote:
> Le 16/02/2026 à 12:47, Andrew Cooper a écrit :
>> On 16/02/2026 10:46 am, Teddy Astie wrote:
>>> Le 16/02/2026 à 11:16, Andrew Cooper a écrit :
>>>> On 16/02/2026 10:07 am, Teddy Astie wrote:
>>>>> Le 15/02/2026 à 19:24, Abdelkareem Abdelsaamad a écrit :
>>>>>> With the Virtual NMI (vNMI), the pending NMI is simply stuffed into the VMCB
>>>>>> and handed off to the hardware. There is no need for the artificial tracking
>>>>>> of the NMI handling completion with the IRET instruction interception.
>>>>>>
>>>>>> Adjust the svm_inject_nmi to rather inject the NMIs using the vNMI Hardware
>>>>>> accelerated feature when the AMD platform support the vNMI.
>>>>>>
>>>>>> Adjust the svm_get_interrupt_shadow to check if the vNMI is currently blocked
>>>>>> by servicing another in-progress NMI.
>>>>>>
>>>>>> Signed-off-by: Abdelkareem Abdelsaamad <abdelkareem.abdelsaamad@citrix.com>
>>>>>> ---
>>>>>>     xen/arch/x86/hvm/svm/intr.c | 9 +++++++++
>>>>>>     xen/arch/x86/hvm/svm/svm.c  | 5 ++++-
>>>>>>     xen/arch/x86/hvm/svm/vmcb.c | 2 ++
>>>>>>     3 files changed, 15 insertions(+), 1 deletion(-)
>>>>>>
>>>>>> diff --git a/xen/arch/x86/hvm/svm/intr.c b/xen/arch/x86/hvm/svm/intr.c
>>>>>> index 6453a46b85..3e8959f155 100644
>>>>>> --- a/xen/arch/x86/hvm/svm/intr.c
>>>>>> +++ b/xen/arch/x86/hvm/svm/intr.c
>>>>>> @@ -33,6 +33,15 @@ static void svm_inject_nmi(struct vcpu *v)
>>>>>>         u32 general1_intercepts = vmcb_get_general1_intercepts(vmcb);
>>>>>>         intinfo_t event;
>>>>>>     
>>>>>> +    if ( vmcb->_vintr.fields.vnmi_enable )
>>>>>> +    {
>>>>>> +       if ( !vmcb->_vintr.fields.vnmi_pending &&
>>>>>> +            !vmcb->_vintr.fields.vnmi_blocking )
>>>>>> +           vmcb->_vintr.fields.vnmi_pending = 1;
>>>>>> +
>>>>>> +        return;
>>>>>> +    }
>>>>>> +
>>>>> I think you need to update the clearbit for tpr (related to vintr) for
>>>>> the hardware to know that you modified the vnmi_pending bit.
>>>> What makes you think this?  The APM states otherwise.
>>>>
>>> The APM state doesn't appears to state regarding this;
>> The APM does state what is part of the TPR cleanbit, and vNMI is not
>> amongst these.
>>
> APM doesn't explicitly state that; though KVM assumes that it is and 
> sets the cleanbits [1]. I think we want to have some clarifications from 
> AMD on what's actually required here.
>
> [1] 
> https://github.com/torvalds/linux/blob/0f2acd3148e0ef42bdacbd477f90e8533f96b2ac/arch/x86/kvm/svm/svm.c#L3707-L3708

I can see at least 2 bugs in that function.  AMD tentatively say that
vNMI is not subject to a cleanbit, but I'm waiting on some other
clarifications.

~Andrew

