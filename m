Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8ADC97E9B39
	for <lists+xen-devel@lfdr.de>; Mon, 13 Nov 2023 12:31:31 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.631537.984932 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r2VA3-0000fS-MJ; Mon, 13 Nov 2023 11:31:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 631537.984932; Mon, 13 Nov 2023 11:31:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r2VA3-0000dm-JQ; Mon, 13 Nov 2023 11:31:23 +0000
Received: by outflank-mailman (input) for mailman id 631537;
 Mon, 13 Nov 2023 11:31:22 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=OC0U=G2=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1r2VA2-0000cQ-ST
 for xen-devel@lists.xenproject.org; Mon, 13 Nov 2023 11:31:22 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on20608.outbound.protection.outlook.com
 [2a01:111:f400:7d00::608])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 29b0cd31-8218-11ee-9b0e-b553b5be7939;
 Mon, 13 Nov 2023 12:31:18 +0100 (CET)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by AM9PR04MB8324.eurprd04.prod.outlook.com (2603:10a6:20b:3e2::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7002.17; Mon, 13 Nov
 2023 11:31:17 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::eb8e:fa24:44c1:5d44]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::eb8e:fa24:44c1:5d44%3]) with mapi id 15.20.7002.015; Mon, 13 Nov 2023
 11:31:17 +0000
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
X-Inumbo-ID: 29b0cd31-8218-11ee-9b0e-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=W0cAGeBtX/AR5mWyV+octlza6VmCmWWLeyFgUqf+yb1FDJKCOoIR7uA8rTTPD3UF/+z97yp+WbmrHekJw8VQRG9noh5rr+wz4Z/7pS89vtnk7ebdRXMnkh+/S3WT93kkj0j5BBC9+GRVtc2dB5HU/ozCvvWY96tIWXpqDLUQ3GBjhj5dOrCw5SXnTnwSkr083T62QWI2UlnBm2oFdi65eqW9q0pbN13DOVVn2VtDVydxUU2BPahyjvIKizAZKyUyk8nueu/2NysoOe2YD6fE58lFfTWu4mZCWnAmSYwgrBF2JiJ84xMBatBuZiRt0Rkmc2p6mVZsOhE5cZuvj3NmCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VciW1wMCTPrNcx+mUZ72APLBp/8hE3KE65xZRlN17nY=;
 b=JyihWftlm85Exk39xjzs9ZHN9ARWh17EGSKYgvYUpbU0yaFiHdzRIRB0wRxkrTu3Y8B8NRQoE439GJotW76ksO36qf1u5NKRQlhz270NyULCTrXhDajeJjHZz4WWBcefTq76LxndWJhMn6bE3dcgZvshxmHlhGBrqJB7481Qkp2HFUnPMMshTLZm5pdlzI/HN/7CSRRm0DoCmE4DFL6zVFXtBWgqFugirhla8dEKfiV3DHRH7qa0tQP66Ex+snSPOZBfs7M4vrXtjTGNP5hTuAySKw6N+69hJ76zuNJ3VEaVkDJ9597DSbAYP8MnaLsEmYNv+VHhNS9ynob+8whxxQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VciW1wMCTPrNcx+mUZ72APLBp/8hE3KE65xZRlN17nY=;
 b=LWnNuWbRuJMTDv2OKVC/aJ03y3jykrmwfEq4gUaBROi7p3KRMo5ceRRbIOPcatM3dCYuJVl9CUSPUycX2d2uc9fM/AkmDC8AUiI/j+P8GlXq+2FZVTPgDFMM+FiDcgjdhCelTc3J7797mJE8t2Eb370KnbVsovoBUXT1ioQTVIfWsKiLGurvz3JtH51pQw+rmeJq07pxTsN7KTk0VB7cpYovTsGAZYVDIVfo01q9+u6HpZ3/yCGHOOkJFmRbn9UZCp6ALf+c1h+GFmTxw+nuUfTJ7vsH6Ig1RNbLXqKBlyBM5pTOVSp+Ar9gXMWeXr1cl+iHIGkaqTdHjOdJVC8Uog==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <930d7aa7-7573-97d2-e146-ebe68214c0aa@suse.com>
Date: Mon, 13 Nov 2023 12:31:15 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: Clang-format configuration discussion - pt 1
Content-Language: en-US
To: Luca Fancellu <Luca.Fancellu@arm.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <Bertrand.Marquis@arm.com>,
 Michal Orzel <Michal.Orzel@amd.com>, George Dunlap
 <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <174FCBBC-3C2F-47E9-936A-F1399DD9AFFB@arm.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <174FCBBC-3C2F-47E9-936A-F1399DD9AFFB@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR4P281CA0378.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:f7::16) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|AM9PR04MB8324:EE_
X-MS-Office365-Filtering-Correlation-Id: b5e32af1-39fa-49d2-d13a-08dbe43c0d11
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	8nYhA8Q86sj2dYY88NR5LmJhmZdMyjuyUHcuon6I82Im4qFQjsioi/njoFIBm6bGJD4Gd8F6RImChSrCs0eBGX2TFHLU+X/HPYyfphNeRCH/TuYvsKoVVPX7OTyJppgFXyNiHa7TT4Tj0dH5300jNyunn9slXICUI6f1ImoI85CxxCCKGNPEqd2S34WShDN1ZRNQ62dPxpI5ugGjeVfCLn6emCe9FDr7CF0ejjfrfdnVyQ5HxkxuH0v+tOSiRVuKlnmijh8HHGeSuxQwbZc5cdhQ4QdCnJ/B9dXAPgDdXdgpAtSOCenBSzED4ln+pdqnLuwFL0K0aQmnjwp38wZ6EMp53EwXGsO7Mh62R/xA+/CW7/wriOHro0V2a0u0S1duqcOGA/Evy0XqqjLoSq/u/d7hq4lCJu+Vq8tOQLsRP5yOz/xQRrX3DENrPouQJ16jODtKMNve3uQ8WKFNApPgevjjrsP6XvNxofDIaCL6BUwta/RztQAXqPpLwR+PHWIT7VkadlOq1TtKekSvjtnpHO0KrLZwNN6ebW0sc3KBHb/ruYg6fPpLQiVNI+iFhNNEDVTDfzgaWb3pb0nRVaf4pz7fTAa7lq4Qw/4gNkacrxN7VUws2/YeUK353RLTiX5Om+WEjIM62AYD9A33Bt/9jQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(346002)(376002)(39860400002)(136003)(396003)(230922051799003)(186009)(64100799003)(1800799009)(451199024)(31686004)(2616005)(5660300002)(6512007)(26005)(7416002)(41300700001)(66556008)(66946007)(54906003)(36756003)(316002)(6916009)(8676002)(8936002)(2906002)(4326008)(53546011)(6506007)(478600001)(31696002)(6486002)(66476007)(86362001)(38100700002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?b3FGOXpOS2VjVnN3dkNjNlozVTFyWnp3dC9sNW9aMm91KzZ6TnpXZmFOaU82?=
 =?utf-8?B?ckFRRnRaOXNCZ2ZUM1JIM1BmcmhubHFzTGpGVVlnUUZLSlZDNnQ5dXgzQS8x?=
 =?utf-8?B?NDB4aU1BQnNZMjE4V2RRVGhyVmhXMEkwazVsWng4VW1xKzF4dTZHSTY0TmxJ?=
 =?utf-8?B?Ylh5aWdqU1lZVkYxejlkSGZSTkpDcmt2MFRmSEp2dUxIVSt6djEzYVhzZ1dR?=
 =?utf-8?B?R1RCT0VDRjRqcjA3Z1VEZmJ4Q2dlbWJTaDcvMFhNa2I1SXFMRDNqcXRFcS9j?=
 =?utf-8?B?TWw0YlJGUm9EaXlIamNJTThCQkh3ejQ4eW1Dallrb3BPbTlsVWV6NFE2enRn?=
 =?utf-8?B?N1ZHWjJOWmw1UHd4RUw4M053OXBuMlZqSDlnTFowMWRSWDVLWE5Dd0tBZ2RD?=
 =?utf-8?B?VDBOTDdMR1R2dm1BZEJsdjUrZFluaVlxTkFoSE9VR2Vuc2c3MWZYODVEN2py?=
 =?utf-8?B?U2UxZG8yR3VCUmFWSThPTFBzZXNaamhDT3kyQmdURFIzM0k1dUJDcjFualJU?=
 =?utf-8?B?RUd1ak1UVzNVK2JCQzR2QWpzT1pmZU94QmZvbDFHcm1SQjNKZFlmNEI4LzBs?=
 =?utf-8?B?K3p5NE9RTHFlamp3MSsvVzVCQWNETy9ZNDcvd1hBMkxGMTJIbXp2UnRTeGtY?=
 =?utf-8?B?WWhmeTFFVHhxSDFiYURDZ3VSMG81VkVIV0FWTlpmUVpVdWUrZjEweFBxY0Vl?=
 =?utf-8?B?YXExajVmM0pGUGE0eEVhU0tNY3RjOFRTYThlU0JLTlhzVWpYRjRqK012UUtN?=
 =?utf-8?B?WVp2K1A4cEZJMGY2YXI4eFEzSVRPdGxqTVMvZ2dFcU51UEU3MzhyN2lmb0d2?=
 =?utf-8?B?MjZyNTFvNWM1NS9Kek5McTBsQUNiVjFDOTNUMUltUG9jRzdvcitLcUJqUUY5?=
 =?utf-8?B?bm1ENkRsUzM2b0VyZWp0MVZvcEdWc2pNd3Z6ZGhyWlV6TXZoa3hwUy9LY25w?=
 =?utf-8?B?c21PcWhrQ0UyQm11RThQM1VNZCtCanljZHJwK2k5S0Z0RnJQVXJXZW5wUDFQ?=
 =?utf-8?B?ZTNQTk1aUERSWlZmSkdGT29ocEp6Tk9OdFFnbXgrb2kxUGpnUXVPQnNqNkJE?=
 =?utf-8?B?L1h1S3BkNFpxTnpDVjk1Y1kwVHBHRDhOdHY4UStFRVJieUNUL09EMzFCOGd1?=
 =?utf-8?B?ZzVWUGRlRGVNbXNxYmNQYTBPZjN1R2JZY0FmUXZTMW13T0tNYm51UTh6UmhO?=
 =?utf-8?B?ZEdtc0JlYXpFZ3NzWVV1bnZsWnpSWEpuZDFrY3lOWVcxN3Qrdm5Rc3A2T3Fy?=
 =?utf-8?B?MGt5cWpOOUVxZzBnVkRRMmFIMnhpZ2JZbWwwNk03SkFvZ1pkaG9rQ1luWXZy?=
 =?utf-8?B?NEx6TWIyb3hmNTU4bmNUSHRwYUh2WWRRYnMwK3Q2R2Z5Qy8rR0ZRcmtuT0cv?=
 =?utf-8?B?czcxdzVMdm9ibTlxQmFQUUhJLzFlT3VRb0xoQVNqa0tESStRRkREaHBkTVhi?=
 =?utf-8?B?dVRldCtTVHpWVk9SdHA4TGVWeWJXcldQNXliOTR6VjVRV2dPNnFhR2QvanVu?=
 =?utf-8?B?UUtJOUlNTHlnV2hKSVNuclNPams5YUE4NDlOa3lZTE1JMHIvY3VrQkg4SGVL?=
 =?utf-8?B?aWhReXFId0NUeUczSEN5TlYxeG00NmEwTzJIbWNURXBuUnpOWGVPZkRDOEI4?=
 =?utf-8?B?eFRvSFlWZHhCYU40bXU5aEZxQmRRWGdWejVPR0RRbFRBTHFYREtlRGZoL09i?=
 =?utf-8?B?ODJqbHlDaTJ3SjdyUWkrWG0rQ051ZVBSZXQxWXpGVmdxM1B1VGVFT2wra0o0?=
 =?utf-8?B?VW9DNFBnUE53Rm82dFkzc3pMYVo1VW94WDFGR054Rytid2ZUZzVxdi9lOEFZ?=
 =?utf-8?B?YURrNmFzTHc5eHB6N3Y1U2hmcWR0bWU3UGk1ZGt1YzUyR0x2RE9tOXhDeDRI?=
 =?utf-8?B?Z05EN0VtaENNL2pDZGVxK2tzWXhyYWtYeW1mNit6RFpFWDJFUG1VcytVYU5n?=
 =?utf-8?B?Z0ZEVzQ3eEFmTFhQNGVoeU4xbVd0c1JqYUdsSnRGNTlpY0pDcmxINFlBYVZK?=
 =?utf-8?B?dTJUNUpHVUNUOWl0L2pnd2NLa25nL1dpVW9nSStIR2lRaXNhOC8vRU50OHBn?=
 =?utf-8?B?OHZWRGp4WkEwOEdvVlE0b0xzS1hFVndTTFM4UDZJanRUdE1iSEg0OEZrTEpB?=
 =?utf-8?Q?RpaYzqn0DAFLGYsPxS2eJdkYL?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b5e32af1-39fa-49d2-d13a-08dbe43c0d11
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Nov 2023 11:31:17.2750
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oSjUpUb/VZi3ARG9SqJ1EMAlxv3JnADTtvTYtp9dqgX0G7f5aFaO29QTVHO1lHQ1qc4D+YRt8AnGbrjYu+ggVg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8324

On 08.11.2023 10:53, Luca Fancellu wrote:
--------------------------------------------------------------------------------------------------------------------------------------------------------------
> 
> Standard: C++03
> 
> ---
> From the documentation: Parse and format C++ constructs compatible with this standard.

Since I continue to be puzzled - iirc you said this is because of lack
of availability of "C99" as a value here. What's entirely unclear to
me is: How does this matter to a tool checking coding style (which is
largely about formatting, not any lexical or syntactical aspects)?

> This value is used also in Linux.

Considering how different the two styles are, I don't think this is
overly relevant.

--------------------------------------------------------------------------------------------------------------------------------------------------------------
> 
> AttributeMacros:
>   - '__init'
>   - '__exit'
>   - '__initdata'
>   - '__initconst'
>   - '__initconstrel'
>   - '__initdata_cf_clobber'
>   - '__initconst_cf_clobber'
>   - '__hwdom_init'
>   - '__hwdom_initdata'
>   - '__maybe_unused'
>   - '__packed'
>   - '__stdcall'
>   - '__vfp_aligned'
>   - '__alt_call_maybe_initdata'
>   - '__cacheline_aligned'
>   - '__ro_after_init'
>   - 'always_inline'
>   - 'noinline'
>   - 'noreturn'
>   - '__weak'
>   - '__inline__'
>   - '__attribute_const__'
>   - '__transparent__'
>   - '__used'
>   - '__must_check'
>   - '__kprobes'
> 
> ---
> A vector of strings that should be interpreted as attributes/qualifiers instead of identifiers.
> I’ve tried to list all the attributes I’ve found.

Like above, the significance of having this list and needing to keep it
up-to-date is unclear to me. I guess the same also applies to a few
further settings down from here.

--------------------------------------------------------------------------------------------------------------------------------------------------------------
> 
> StatementMacros:
>   - 'PROGRESS'
>   - 'PROGRESS_VCPU'
>   - 'bitop'
>   - 'guest_bitop'
>   - 'testop'
>   - 'guest_testop'
>   - 'DEFINE_XEN_GUEST_HANDLE'
>   - '__DEFINE_XEN_GUEST_HANDLE'
>   - '___DEFINE_XEN_GUEST_HANDLE'
>   - 'presmp_initcall'
>   - '__initcall'
>   - '__exitcall'
> 
> ---
> A vector of macros that should be interpreted as complete statements.
> Typical macros are expressions, and require a semi-colon to be added; sometimes this is not the case, and this allows
> to make clang-format aware of such cases.
> 
> While I was writing this, I’ve found that from ‘DEFINE_XEN_GUEST_HANDLE’ until the end of the list, probably I
> shouldn’t list these entries because all of them end with semi-colon.

Ah, just wanted to ask. I agree that we'd better have here only items
which truly require an exception.

Jan

