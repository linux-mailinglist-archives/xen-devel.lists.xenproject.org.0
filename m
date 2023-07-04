Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 337A1747421
	for <lists+xen-devel@lfdr.de>; Tue,  4 Jul 2023 16:30:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.558413.872487 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qGh2U-0003LT-5f; Tue, 04 Jul 2023 14:29:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 558413.872487; Tue, 04 Jul 2023 14:29:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qGh2U-0003Ix-2n; Tue, 04 Jul 2023 14:29:58 +0000
Received: by outflank-mailman (input) for mailman id 558413;
 Tue, 04 Jul 2023 14:29:56 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=D/z2=CW=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qGh2S-0003Ir-Rd
 for xen-devel@lists.xenproject.org; Tue, 04 Jul 2023 14:29:56 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04on0620.outbound.protection.outlook.com
 [2a01:111:f400:fe0c::620])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3e3eb0ed-1a77-11ee-8611-37d641c3527e;
 Tue, 04 Jul 2023 16:29:54 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by DU0PR04MB9299.eurprd04.prod.outlook.com (2603:10a6:10:356::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6544.24; Tue, 4 Jul
 2023 14:29:53 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::9bd3:48c9:ff58:9880]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::9bd3:48c9:ff58:9880%4]) with mapi id 15.20.6544.024; Tue, 4 Jul 2023
 14:29:53 +0000
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
X-Inumbo-ID: 3e3eb0ed-1a77-11ee-8611-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nLORJO8KQhFzUMU6iyoUEt+duBdecNw6+ExxS1fylfUnoBqQB2ldQ3CD6PnEApRbuDUwT5rnlGsh2cBN7ujLivgaSksh9a4bWVVUkQGIU514n1F9bkMVC9EoWFVQdRCUYVbWtl8Ox3OX5LAdr1YlXlX9l+sanKlHFJPaIX64ku1qyBEDBTBjCO49zFl/Gw/jLhHq9+5AiX5AcZpdVXZdSXAeqW0vPZnvVZ/l7DcvAdDCL/4pltlCMEhEScLfuiRXwDOHyKf2Lulk1QxV7y/SkKyANEkpLnhh083R6GWY+gmmPfuEpGbBYLpFEQVYx5F1HKsKP3jK91Fiklsw6VQpgA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qUo9VbqK1E0QofwcLeUuuaBC3c3sbvfQKGI0IvuYq8o=;
 b=Ipo7NSUySHIhs5FK0Av7vGAppBDsHSclIq8VSlEhf55YvC3TBiB7rAuYvFHcN5MKyCoITXUeo01nGro1IXeTa4RYeDa99ejaMZbsy+Ecv6WHxChOaBGF/FWyif3E3jg8IW5WuI/V7SeJohCJJk/PSskalZUHBQI6i6gg84it+s0IqkicFuzkQ/4VwLIy9O3di+sJ1QlEkpuPdNtR2BksdSEMFJWizrFFUCbh4+ttkrP/Pj5BMO68DNoiUpGIaNVCQi01ducFnh2VKQsWuMUSS8kGldLhAIwCUqZqjdu/M/f0TiNMQ0S/HRolJxVt+kDTmuwEs2BAMDWLs07SuxRurQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qUo9VbqK1E0QofwcLeUuuaBC3c3sbvfQKGI0IvuYq8o=;
 b=gCnhK+loOeY6iByxOiZCghwIYpmxSMcxvXarUAQ58TEML9MJKNVDCSbVVbmrhEXrdhU9C5OJOorecdVbLHtqaNWDGoTJUJeZUe5c3+iuG7hc/ESTltDyIDgP4wF7QR4O5KMvIIbA9YN9Kng8wZ6BfhRskLtvlfEfy8cRyKJTx8qjdqx84HvEYlPGyCMMVrtRZM1JqIQ3hgtrVrpyMlTdAyN23OdSxwf5TH10Qz+vADlZq/J/CadAgU06irkwAOYkdhbx7AV2C4gHgVnjnr90ml0CZvbTw5CYd3oS9ZDZiWZfCwW6L+C7rgbIkOsmJcTDZ6vwtPdm/iR9U848r4h59A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <e85c73ae-aaba-a649-6bf5-5528b4cf6e95@suse.com>
Date: Tue, 4 Jul 2023 16:29:59 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH] x86/asm: Introduce a tailcall pseduo-op
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20230630152057.2944373-1-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20230630152057.2944373-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0206.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a5::10) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|DU0PR04MB9299:EE_
X-MS-Office365-Filtering-Correlation-Id: a92b2d95-9150-4494-faa5-08db7c9b21a4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Pg6Ej38RxcLjEQUbqMgOzF+NxhsOiUfn2zLGSGpZMNps2ENLcIJkM8bCepCbzDGbEzuMOCDMmP54t7h9hlKS436DjFFJqvLjt9sL8wz6t0LIwGH6H3ByjLwk2h1Cf5buZ20AVob45Kicn207dub1oh559jpgr8/Qgmeq2v+a17YS9Qjm16agRltu3w4JEHY3MOPncwZVSFBLrmogiTg/LVK8b2u01zGrcTdtCW615gGLOesWZ+gkbP8g0P8VGcn5fpodbKbWcXGAlDwapygdmIHarUZ2e5mLqk04/THYlKg3NZ+0PeEu60AjFTkuVyGNl/zGTKizZpqwe3dqKijFVlz3zMqcbtQcobWfTvjm4mLqJQpppSb4rRnjxyhZk3xIVCxpelGJ0g5ZkoqzB1kuOZ6+Lm31qnEhNcTX2UZCggwHWzxryTRRDVFZyyQN+BA8j6bRnInElRbBVLqEwW7MwaAaVC2vszkCxHpZZFdR+lNKnwm7jRPwYNG1WFndMLI2lnpuHmbDNCQt2LCSi5wfzPnvDDXHXXZftwvUmSuW+q3gj7lamhRCyASS88Hje5aGD1F10go9OcO3dXYyhDEP+9ShwdXK+zPiwdFodGF1uil3RBp0TeY84DmDqF3PKHoFT0YvFAwwpuPPdwNFKfhA/A==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(39860400002)(376002)(346002)(396003)(136003)(366004)(451199021)(31696002)(41300700001)(86362001)(38100700002)(4744005)(6486002)(2616005)(186003)(6506007)(53546011)(26005)(6512007)(54906003)(2906002)(478600001)(36756003)(316002)(66476007)(6916009)(4326008)(66556008)(66946007)(8936002)(8676002)(31686004)(5660300002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?V0VXaDc2TkplajVRSHJwYlp4T2F3VUNzWnFkTWdyTnordkJrVk5oT2pJYW5V?=
 =?utf-8?B?aGtYeGpCWnUvSEVoSmIxYnRsdE9qZUhRcUw2MHF6bkpxUDVFUW9yRWxMRnBH?=
 =?utf-8?B?SFI0R2t2UVFXTHJwZ2VHallYZm9CUkdKNFFOVDlPbzVIaUV0dEFRRGJRdHpL?=
 =?utf-8?B?SnhoMWhJUkl6QUpLQTVMSDFCMm9KTlRlb2lPOFdZRFZqS0drRHVVaXZYV01v?=
 =?utf-8?B?TmwxSUpTWE9veFJZakV0enhBWWgzaTJHV3YzN3IvdnE4SWF6aUJyT0owd2Rn?=
 =?utf-8?B?b3RCZVQ3RzJRTnJ5dk5jSmdXYkVGKzlEM0hxM2wySEJHWUFFSnhxeFlPV2M1?=
 =?utf-8?B?T05mMEZpdTZPWWM1V1NVOEl4UGhGekszRk4zTkZYUnpKRUhqa3VtdmhkQnFH?=
 =?utf-8?B?bzd4TlRyN2dFTlhtYmd4YTE1NEFoUCtqZnlrbDBxc3dNOVRZQWhLSzducTYy?=
 =?utf-8?B?M1NsUk02UlVWRDBVNHg5MnN0ZW1Ccml4UjcybXhxMVFCTjA1SlFqZTM1NFVz?=
 =?utf-8?B?RHpmQnVVZ1Vvdjlydm5JRkNsMWdIQ25zM25jQ0Z4TlNESzZCNTRlS0ZuMndJ?=
 =?utf-8?B?NW14VHgyRHZ5TkdQMVdKTW9LSGZkSDdxbU5IOVREMERzaGtSeFlZTzBmaDcy?=
 =?utf-8?B?dVNNbVowYzVtaDdUQmpJK2dPOC9pdThwZER0amxrMkR6QUwzWkdoS1B1VmR0?=
 =?utf-8?B?cnFIeTBwM3BQZFZUQXRpeWl4NnNpeWNHY2NkZG1ON2k1azJSWmx4eS9qUXdM?=
 =?utf-8?B?VVY1b01JK1BoZjIwc1BDR2FBZmFySEludDlMZjk2ckZMMWo4L3dQamVMRXFW?=
 =?utf-8?B?ZHVLaFZrS1RIRGRkamllYVJBZDg3bE9oWm1zVm9ObmlMR0Y0c1dGTklleXp6?=
 =?utf-8?B?RUpvc3RnbnMvekpmMGRxRVpvTnBzWERsYmNVMDR2eFVTTjNXRmpJcEtKWWFj?=
 =?utf-8?B?N3BrVG44UGx6VG9NMkhRZVhtQmp1K1F0czVXbVRMQ3JiTjRNa3RGTFFsczVj?=
 =?utf-8?B?UlR4eTh5T0o0Rml0UGozNXZ2UmdRWC95UklyZlp1WEpVbUFYKzB0am5vL05G?=
 =?utf-8?B?K1FZRUZ1ZXZZbGx5T3NGekF5cXQ4WFo1U1FKaG9wUm96ay9YU0R2VFl3V1V6?=
 =?utf-8?B?c2xsa2kraUdmaHY5N0kyYmlnejE3RXorWGp6VnlNTDFDYlIxVTZMZ2RHazFh?=
 =?utf-8?B?RG1pbnlzZFRCS0htR3oxRisrZ3FPYWcvT1RPWE9ENlo4RXAyenM3cURJYU5L?=
 =?utf-8?B?QVRLU3d0RmlyQlMyeWtvQ3AxU0R1TmZ6SDNpUGlEa1l1a3I0SVZER0h6Qm1O?=
 =?utf-8?B?eXdlejByaDlwbENOODBKUGh4VGtXaHhOOTF3eTBtVDFNa2M5SEZwcmRsLy9l?=
 =?utf-8?B?MlJFV1B6SGVjaGhsSjdYR24xZ2xLb3NWUDZxOWhsREJMTGdSdmpuTkk3WGlN?=
 =?utf-8?B?ZkZXeEtBWWpPeFV0Umx5YUIwK1hkOFNBU293eGd4Y3RCOStOakFNemQwaTBX?=
 =?utf-8?B?cTg4VGhyWTFyRGlIbW9sK1FDdUJPOTFaMWtoazZReVM1MnFRQjhlMWh0aDRN?=
 =?utf-8?B?Nk80YVVxMVNZeURFSEVtY3FOaDBHUWo1UVk3VVNWMjN3dk9vZnNoV0Yyam4x?=
 =?utf-8?B?S2I0VkdTYThtZHlPOSs3eHhhelJYdDRJTmhZOEtEdmE2a1pLMHlrbnlWRUEv?=
 =?utf-8?B?bEFEbTZzaUltRE9EbHhzOE1TYkhlRTREcXZ5dndKOWF2dHA3akw2VE1PQWxO?=
 =?utf-8?B?YkNEM3lzRmZpVS9jblprU0RNVWdjYUpmcHhCMUtCTDl6OWpMdndUbW16cTlJ?=
 =?utf-8?B?bjZWTHNTa2U4MitZb3hNTTlabDRXcGZ2S3hqRU5CY1FBQ2xveWcwZm1ja0xi?=
 =?utf-8?B?YkQxMXg1UFFRbTkwMzlVVVJwTDBhWGFFdXB2UTdldkVyTmcxeGRQVUZxOVVU?=
 =?utf-8?B?bmtncUJ0bkNqNVlwOEJ3endHakF0Qjc1ckx6aG1zK0VUWkNvV3A5WDZkMWtt?=
 =?utf-8?B?SlJRazl3aDhHdHV4anoxV2pPSGwrcFMrV2xaTnBhaklVR0RaTGdnd215QjJW?=
 =?utf-8?B?T0FvMDlmRjY4MG5ZQlpPNjVuVjZId2lncFF1NUxVdDFvdzNpbVNFU3M4ZXN6?=
 =?utf-8?Q?5M106qqXZJapn1bSRY+m3avdp?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a92b2d95-9150-4494-faa5-08db7c9b21a4
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jul 2023 14:29:53.0155
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8I1iGq/27FE3U4PtDMbH+EBs57VUZwGbqYAgEjsEvFsgOqEUD4KzyRxU37XiUkFiA27wyCUva4ifIyIZdZzcxQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR04MB9299

On 30.06.2023 17:20, Andrew Cooper wrote:
> It was previously noted that CALL/BUG is a weird combination, but there is
> good reason to use this pattern.
> 
> Introduce an explicit tailcall macro make it clearer in context.
> 
> No functional change.
> 
> Reported-by: Jan Beulich <JBeulich@suse.com>

Did I? Must have been a long time back, as I don't think I remember us
talking about this.

> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>

> ---
> CC: Jan Beulich <JBeulich@suse.com>
> CC: Roger Pau Monné <roger.pau@citrix.com>
> CC: Wei Liu <wl@xen.org>
> 
> It would be nicer if tailcall was shorter, but that loses clarity.  RISC-V has
> 'tail' as an alias for 'b', but that looses the call aspect, and tcall isn't
> sufficiently recognisable as tailcall IMO.

I agree with all aspects you mention here.

Jan

