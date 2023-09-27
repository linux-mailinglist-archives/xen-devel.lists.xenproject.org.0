Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EFB1D7AFB5A
	for <lists+xen-devel@lfdr.de>; Wed, 27 Sep 2023 08:50:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.608684.947330 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qlOMT-0004I9-QN; Wed, 27 Sep 2023 06:49:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 608684.947330; Wed, 27 Sep 2023 06:49:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qlOMT-0004Ep-Mv; Wed, 27 Sep 2023 06:49:29 +0000
Received: by outflank-mailman (input) for mailman id 608684;
 Wed, 27 Sep 2023 06:49:29 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=3bhA=FL=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qlOMS-0004Eh-VS
 for xen-devel@lists.xenproject.org; Wed, 27 Sep 2023 06:49:28 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04on061a.outbound.protection.outlook.com
 [2a01:111:f400:fe0e::61a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 00067f2b-5d02-11ee-9b0d-b553b5be7939;
 Wed, 27 Sep 2023 08:49:27 +0200 (CEST)
Received: from AS8PR04MB8788.eurprd04.prod.outlook.com (2603:10a6:20b:42f::21)
 by AS5PR04MB10058.eurprd04.prod.outlook.com (2603:10a6:20b:683::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6813.28; Wed, 27 Sep
 2023 06:49:24 +0000
Received: from AS8PR04MB8788.eurprd04.prod.outlook.com
 ([fe80::afae:3fda:c84d:bcdc]) by AS8PR04MB8788.eurprd04.prod.outlook.com
 ([fe80::afae:3fda:c84d:bcdc%7]) with mapi id 15.20.6838.016; Wed, 27 Sep 2023
 06:49:24 +0000
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
X-Inumbo-ID: 00067f2b-5d02-11ee-9b0d-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ncj9VNDKkD2DKGCv9p2TAIOJ5Jims03UbiNeMq0OHi3KPP088vsRdE2oAJklCB9HN8RLHRx7gc3VKo4bwvWqoK0jNUHKn5fN3mXkH1gQiz05k3wzADdD43Q+DZhd5LYFUu5lpcyj5/Zhz7b4JrwbghqLEByRknQUd4hDebohOq6Dy8r8PyIJ8B0JT+Zzlx1hRPhc72x4fF1BzSBQFWTScDI5T5rcLVtayl1XFj57YBOQ302XNFWU12bUJCerWWXoFW7NbT+fB8DQ6ajjUi8PEX0iPYyxGWS3TEBo4bx9JFb2cAxhMn2ti6UlhNw/583wK8VQSJ6hFlIzybtKoR2BTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=33J9bd4saBmDWBBk74RotF6uYAB8GSLBHMP6UltEAwA=;
 b=D506As/HEH4cGntQJnmho7iq66TLgFFuseOE1ShW88nL5ewKbU3pl4FuD8gB5ZNctTgaviAXxmF4BGhC/BOnnUo10Pohi3+YHzHnbDqh92UN8yiBE34ab9DudMKV7+1vJG+oAhAKnwDf/Llbekuu9clHzPR77yDzW0EPHg8CYmrPk+63z0hmt8dxhdKb07OX3HRRwSDBXjoPiN+ZdgBC+qpdO9/DJMPrVzopLi7np4JlAflzQ1RYx1ReGvcVxHAgZcHAAzIhOWSpz8Ov6gPvTC2N8cnxgrsKhGUn6aIgtVvrgg36gMmtq2r0qeUUw5AqRc2o2k0LCMge7OdKGVpn/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=33J9bd4saBmDWBBk74RotF6uYAB8GSLBHMP6UltEAwA=;
 b=JRVVmxbjEte+2m/nhXwqCk4qyQzBDc0VsIk8da+cZvv6hq0mgvHc1gb495hRVm7odCEhMSz2qNqYpsd7wLVdYh6TVRuamanf94QIHlM0Jgd4IbCenkC9K/tnyz86tO6o5hyTbQK4kKvYzp97L2EYCC5vWbpTlIgRDwtgyluFxB4j8PyQGFZSUaGiCskChgYlr16w0oI/gtTpsp5mF+8daH859OYH+I+1QEoiZ2WvfU/QClhNz810v1bdMHzTvBRYnfTg8kwzRs75mO/JGOjhrHLCuPJ8anJIC/GbL+LRucudaWEfM+JTsyS9f5HURLru8TZRWGAUO+JlYfwcFWNzMw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <aeafe32d-f128-43e3-cf94-1f50b1b6754f@suse.com>
Date: Wed, 27 Sep 2023 08:49:22 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH] docs/misra: add rule 11.9
Content-Language: en-US
To: Stefano Stabellini <sstabellini@kernel.org>, roberto.bagnara@bugseng.com
Cc: andrew.cooper3@citrix.com, george.dunlap@citrix.com, julien@xen.org,
 bertrand.marquis@arm.com, roger.pau@citrix.com,
 Stefano Stabellini <stefano.stabellini@amd.com>,
 xen-devel@lists.xenproject.org
References: <20230927010538.1778201-1-sstabellini@kernel.org>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20230927010538.1778201-1-sstabellini@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0149.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:95::20) To AS8PR04MB8788.eurprd04.prod.outlook.com
 (2603:10a6:20b:42f::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8788:EE_|AS5PR04MB10058:EE_
X-MS-Office365-Filtering-Correlation-Id: c30d85fd-91f8-4b17-1bda-08dbbf25e2d9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Qtkv+Tg42R7tlPlEDdJ7B34MjISo/Xcqh79KfH6KzFMVkSxpTS5xsJd0cuhSDIUA2R9qBSNFe8U0/N8PucldHWFSBxtyNoq5IImdCWZnm1f0zQ82mKif/uNOGdCKEuuPiJL6gF0LV23QL65v+eCxBRhqWPgjmcxA/40Jzpv+RALJjP/IlpCbEuH1DMB2P+e+3Q6YvvuU/pTTSCFcQpvhC+sLcOBYI0hD54WHIdHT/uT4rf7U2QQfswFIHt/8/kNk81Omqt+02KbDsN2QFoToDwMJLWPUMzO1QQ9q6ArGRNiUfYxC519DizRk/fs3z2LTJzJSh2mF/Z5TD+k+oPWzqx/lxGN4I+tDpJQ8IIKp9HAxdRafWoRzzk2/fp8rmsaZpgFoEJEq/wOIWBke3Z9lb4Gw24oEATGEX6M9SmcrNbyoCW6B5112RNz2wVB2x2hAGgfcH91DWgJ4R5s0LbC19SgniZKpXKbrNlGtUbqSmdaND7XTkysl7+JA0O5CIRq9AVzYfK+RKEigUB6Vvxneo1CN8kB/xDFGNtUqTqqjSEtEhBOsahFHyIw3OD+NGMAq1/jc76a9ckIqyMZztXJ7B1CBp8n1Z/zJttwMo4Hj5P1VQhCcWB5qoBkz2TAxrWrGDpS2jxfzoQaj5MvGaNxoHA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8788.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376002)(136003)(396003)(346002)(366004)(39860400002)(230922051799003)(186009)(1800799009)(451199024)(26005)(66556008)(6486002)(6506007)(31696002)(2616005)(66476007)(53546011)(66946007)(86362001)(6512007)(478600001)(38100700002)(2906002)(5660300002)(8936002)(8676002)(36756003)(4326008)(316002)(41300700001)(31686004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ajNyY2lxeVE4Y2hnYm5vUXRJV0w1eVI2NG9YOUM0aTZVNmRXait2Nm5HdWpT?=
 =?utf-8?B?UFVadHlOeUJSeDZPZFRLWk4zdDROQ3lrOTF2R2g1Nk9NaWd2VUVQM3NIUmtP?=
 =?utf-8?B?b2NTRmtCMG9vZFpxTStrck9Ka0tKVnFZY2Z5cFg1UGRPVTl3VStJYmN4Vm1P?=
 =?utf-8?B?YWZITkNQdlJ1RTZ2QW5WRlBsR0NUU2lCM1ZFWTVPRzI0Wjl0RkErNlBRRmsy?=
 =?utf-8?B?aG83M3hEREcrTWh0dGZpczQ2MjM3cHZIYjdhMGdRZURTY2djYWJtV01FWGt3?=
 =?utf-8?B?cnFmTng5K0tQZ2s4OW9oT3BSRXR2V1R1dm4yNXkzM3ZXcmpSa3d3M1lCSUJ1?=
 =?utf-8?B?azBIMUNkRG9Cd0E3WGVKY2doOFp1ZUNJeTlXNC9IaXRJWjE0aHRlaUo1VzN4?=
 =?utf-8?B?ZzcvQkdHd25Yek5zZTlXQXNIajd3NHI1ZlE4MjhRcTYzQXNTN2srMnd5WVdL?=
 =?utf-8?B?MjlQV0s4RUtzMkVHWnBaaUE2ajlyaXFJNXZ0RXBQSm9KcDlmSFI2RzNtQ0JI?=
 =?utf-8?B?eTlva0Uwd3VUa3JoSXJ1SmJqNDFkUmNDNytTa1FweVdOazJENjZhRWtNZlN0?=
 =?utf-8?B?M1hSbWowSXhPZ2tzbVJaZ1VCRWttbGVtRm93eXh6Yk1xVlR3WnByanNSOHIx?=
 =?utf-8?B?bU90ZGdodmRmWkw4ZnF1NVc2Z3BSMDFKbDNYdWxwOERGT3BicjJrTEVOSWth?=
 =?utf-8?B?d2MzaUJ4ZWVMNGdwQzVkcXgvNkhIL08wWmRtOUFHYjZ3am5iRisra0hNZFA2?=
 =?utf-8?B?SnUwajJZMmM4bTBQNEcrajBZTFFmWGlUckpxbmJ6RWZMbXR5VjlBdnB0eUM3?=
 =?utf-8?B?L0FrcHdqSVFPSDlhV2NvYmZob3V4cExrUDl4YUpQK3VxM3NXV2V5MnR5bmRG?=
 =?utf-8?B?TGc0QS93V3AzTjg3WU5PUXdNRnY0ZDdNL1NNRWU4ZGt3a3ozNWcyRmJXNzRR?=
 =?utf-8?B?UGdjeHh2NmZDeUZNYS9JaEpBRmhqdE5QMUpPMTZ5Q3lMaXZRN3JLRXNhSTds?=
 =?utf-8?B?Sm8xUlNoWkdSVEFlUVNvUGgzWEVBM3JGL211NDFUa1J1a1lLM3I4RVc2dVpI?=
 =?utf-8?B?dlpYUkw3Y1VIUGY4YVcxcFJmcHNmSjFXSERsOEhYbHNpWlQzVmhMWmMvTFFJ?=
 =?utf-8?B?UGI5d3dnWXY4Y2U5MFc4ZmtqNG9wYUNOOE5yZ2VMWXM0SmIrOHlsdkpPTGph?=
 =?utf-8?B?MldsaVU2SkVhZERzT1c4MXdlM3JlVU5mZkNnekdHd25VcStFWWpIblBjZXV4?=
 =?utf-8?B?ZE02VlpqU2tBRC9FTEVWU2xzRnpHM2hQYWFFMGNWcmJodnZHQ0NwNXFQa2tu?=
 =?utf-8?B?em9BWVBKZHNwZEEzaFk3d05mejg1alF4OXJTZHlPVFhVdnoxa2djSTIrSFJa?=
 =?utf-8?B?M0xMQWs4NmZTdGtpM3FvdCtSWjhlcC8zZUo3enh2S25CVnVKVlpsTEd4djAr?=
 =?utf-8?B?M3BQT1RsOEV5bVhOclduNnNFUXQ1V3VIR2w1c1FVK2NnTzRxUFQ1enFtalR4?=
 =?utf-8?B?MVdINlF1eUxSVzEzYXEvTlN1eDFJOXZlTlhTcDI3bGh3MmorNjBxWXI5M0NV?=
 =?utf-8?B?U3Fla1IyY0FQYWhJTXdiOWNVNEdPc2VEZVJSajBqUFpUSGRwQ2dNWHhPN3pi?=
 =?utf-8?B?bmNUVjBGUDJXazlQaW5td3hFdmdZczk0aWJOQUlzQ0FRT0tvbHZJQVZPcG1Q?=
 =?utf-8?B?b0dqeE14SnkrUTRUeERrSTdPMGhYUEVmV3JveFBuRWxKckFWS2FHbUE0djVS?=
 =?utf-8?B?SWorSjlTSEF0VUdYNVVnK0RUYWVkdlZId1lJZ1liS0diMXJESk00eDBuNzda?=
 =?utf-8?B?QUp5QldOVkRTYjJCM3BTL0VtbFp2d2I5UFhEK1FhZW5HdEs0cXBtSE1ON3Vz?=
 =?utf-8?B?WUhyNWYzbE1QdjVTQ1ZPT3FHME9mQU5PT2kzaEJCb2VRalR2MTE3dGQxeDBk?=
 =?utf-8?B?cmhlQUw3cFVqUndTa3hUbjB5YzJWZVlTMC9FWldxZ1E2a0V3bWtpak1mU2pP?=
 =?utf-8?B?Z2VqTG9BRjFESHhkY1hkNzZjQTRNNnlOMWhyYkhFb2wxaG5ZZWxpSkoyOFcv?=
 =?utf-8?B?WEhsQ1o0UXl6bnQ2cjBFMCs3eDNJWkE5TlVld09Celkxc2RKUXk5aWgwb3Ft?=
 =?utf-8?Q?HGDolKHFQOBsCXKBGWeiw/e3W?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c30d85fd-91f8-4b17-1bda-08dbbf25e2d9
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8788.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Sep 2023 06:49:24.8369
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qzftpdKksrvHcdF/42QCupnIZD2PS81DJU90Ux2cp/YvPFGRTvfVK8+ty/oZqYgXoUyjw8wrYHVk9NGbmUbV5g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS5PR04MB10058

On 27.09.2023 03:05, Stefano Stabellini wrote:
> --- a/docs/misra/rules.rst
> +++ b/docs/misra/rules.rst
> @@ -373,6 +373,11 @@ maintainers if you want to suggest a change.
>       - A cast shall not remove any const or volatile qualification from the type pointed to by a pointer
>       -
>  
> +   * - `Rule 11.9 <https://gitlab.com/MISRA/MISRA-C/MISRA-C-2012/Example-Suite/-/blob/master/R_11_09.c>`_
> +     - Required
> +     - The macro NULL shall be the only permitted form of integer null pointer constant
> +     -

I think there's a terminology issue, which I'd prefer if we didn't inherit
from the Misra spec: NULL is not an integer constant expression. A null
pointer constant can be either plain 0 or ((void*)0); the former is an
integer constant expression, while the latter is not. Aiui it is the
"Amplification" text in the doc which correlates with the use of "integer"
in the title; since (as per above) I think the text is wrong in this
regard, the use of the word here also is at best misleading. The C99 spec
also doesn't know the term "integer null pointer constant"; only "null
pointer constant" is specified and used.

With the word dropped despite then not being in sync with the doc:
Acked-by: Jan Beulich <jbeulich@suse.com>

Jan

