Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ED99D78E960
	for <lists+xen-devel@lfdr.de>; Thu, 31 Aug 2023 11:29:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.593562.926564 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qbdyj-0003zB-Sl; Thu, 31 Aug 2023 09:28:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 593562.926564; Thu, 31 Aug 2023 09:28:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qbdyj-0003wN-Oa; Thu, 31 Aug 2023 09:28:41 +0000
Received: by outflank-mailman (input) for mailman id 593562;
 Thu, 31 Aug 2023 09:28:40 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=xL7T=EQ=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qbdyi-0003wH-5A
 for xen-devel@lists.xenproject.org; Thu, 31 Aug 2023 09:28:40 +0000
Received: from EUR02-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur02on2060b.outbound.protection.outlook.com
 [2a01:111:f400:fe16::60b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c3d282a2-47e0-11ee-9b0d-b553b5be7939;
 Thu, 31 Aug 2023 11:28:38 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by AM9PR04MB8603.eurprd04.prod.outlook.com (2603:10a6:20b:43a::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6745.21; Thu, 31 Aug
 2023 09:28:36 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::f749:b27f:2187:6654]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::f749:b27f:2187:6654%6]) with mapi id 15.20.6745.021; Thu, 31 Aug 2023
 09:28:36 +0000
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
X-Inumbo-ID: c3d282a2-47e0-11ee-9b0d-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=n7DF6LsYalU+nuqcyeNaETMtNr2NBDRwRqvygTCnp6AruVGtkn259KevQ4BgRTAJq7wjorlWAPrrHlGf7Ztvvtuwn9iu+zzc1R7nuOhnszGJ5KUYcmYPBOPwlhBAgZJnpP+m41OxrCxXMNE3xrlQjxR+7D7MEhnIbQVmm0ST9DoFBfGzLfKtvBtZ/WigHCJ2ER0P6mHX00GGXKhXeF+j97H2cgknNeEGx9mXn0fNW3Jw/Xfn+9DD9iBjVunLrtyWegMNELynhkgSg7nck0czB0ZXVkO3EkKa3oClsf1cgAgB58zqQYcvYPHjlIhrxnDC1mur61fVGYizMEA5qdi/dQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2QUAgFrJtAGTeOb+9lVw09OYL1UkH/W5XKr1yWb31sU=;
 b=ZsGBjsMFyawXkBdwZYJVJAKZ/H3NvRayY3sIBUkuEOU0Ef5qpJTvkwOJWL+Kl/tHWNykRWsT75udpTr+j5QMSrT3i7uQ51su4/p1sd7UTRm71YecMVl6mFmgA2xJ58GHUvPGwCUCib0tov6XDaJc/faYv5AAVXg37nX4z8zHwks1sCazyCEWsmzIP9XrnnmptahlsKCFl5m9SdDTdFO9lZBK53AGhmDSLyATZaVq7l2n/UDBO3FpgkpLLA4Y8zq39xbmXIor8zyFBXF+yl1KbcSnWYXgNHCzt3LBjUwEm6XSsqBis2qV5kNNTcRRYvwXJJMJkZtsg8EAUoVxwSdkMQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2QUAgFrJtAGTeOb+9lVw09OYL1UkH/W5XKr1yWb31sU=;
 b=eMl4sopjs16ATZePEoiAb4wSCshlVw/OCHUiPqQGumOpkp2rqsWKF+9oqirrEgwTSEmiazdMnqKrlZlqRF14/Ss6CmqjNI9H8egJQrtVObVCgIa6O6k5cSrEbhpsje7bU3344/QlmmgqkQ6OEGnzrUT0cnqHSICTaJWIj2IKr9ERh1vTLEk4lZUD4Ozqa1tx+xe8bcKL1CfWX0f/YG8JLoZtoCMjssQ3TJ9g75tJ1otiGH+lpPkdfCy+8fGBmYtAjrbvk0DJBU9ihg9KOQDsPB/gA8IMVqRc4hDHV4XyE83T1S7zyGdWGGnUEdJ5oiud1CQFpL0O6HmTBSp6FD4iOA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <58f72b39-701f-6f7a-eba7-fa685d35b8cd@suse.com>
Date: Thu, 31 Aug 2023 11:28:33 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [PATCH v2] docs/misra: add 14.3
Content-Language: en-US
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: andrew.cooper3@citrix.com, roger.pau@citrix.com, julien@xen.org,
 george.dunlap@citrix.com, bertrand.marquis@arm.com,
 roberto.bagnara@bugseng.com, nicola.vetrini@bugseng.com,
 Stefano Stabellini <stefano.stabellini@amd.com>,
 xen-devel@lists.xenproject.org
References: <20230831015316.531167-1-sstabellini@kernel.org>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20230831015316.531167-1-sstabellini@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0113.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a8::13) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|AM9PR04MB8603:EE_
X-MS-Office365-Filtering-Correlation-Id: 1376e15e-85e5-4c6c-86a5-08dbaa04a6dd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	pH8gFnIBvRRjBlDDr3jc2VBpIF6hIpfrkJfVoaqBNwcTmZOIBLwKxZiiJ9Q5XYO7Z+FfJLd6jFiyY/rYHkI4C8EjpdxWzYkS4vlCihiy8XFjQ/DDXl3Xurr8zx8Ws9/UeOfYFjYsRRrxvS4mF3nhJ6wCpR2cqp0cWBCA9HJ5Ql2GH0KIfoKBPPvAsa9Pn54EXgKwiw+mfA3t0K3NZsPXNyYp/S2dpKCnYjknk+Ge6U8bhfZW+MDcHbhlpXV/8AAZcNDt6vFmRTIdHx3v9v6NVpJyMcBKr/kbI2EwDSxeELRG6E0gpt+wSpyCVPUVcez934el2PvIj9wNCapKOYByfNqeSMqV938pi3QUyKAhVtTpaZsOuX0v59PmHxv7uVeJr+UKtrGYkxW02FuhhlDWcl9G84ftJAruQFI+dIG7kC/u5mseKDvvup2qlfW5g0ujTAuEb8/zjLLYQTzPIrhg21o/wXRJNRzQaNTK3WY6659XmN5YqFkXp+53Hzq0TiryZveuh5gVRUibLD4MwruAiHmDF4N05d3Q+JI+TbQudJVP2m01QVJrhnOU6w4p79tTTDNeCWcRH+/wFN6gbmo/+Inf754ZkEhlU5r4mALaibD+l6vQbZVyKTs2/G/kYrFZQRzA9NtxJ7PVviccI0YSwA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(346002)(39860400002)(136003)(376002)(396003)(186009)(1800799009)(451199024)(6486002)(6666004)(6506007)(6512007)(53546011)(478600001)(83380400001)(4744005)(2616005)(26005)(2906002)(7416002)(6916009)(66556008)(66476007)(41300700001)(66946007)(4326008)(5660300002)(316002)(8676002)(8936002)(36756003)(86362001)(31696002)(38100700002)(31686004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?eDMxOHNva3hMNytwV1dCd2lJYWhRWlZwQkN3UmkzZEVvamRnaEw2Rld3VDFy?=
 =?utf-8?B?d3FPdWRZV1I1Nk5WNythOXhWQWtZMjNtNHREbjJEaG9wZ2VGYXRZYk9FZHRB?=
 =?utf-8?B?NFA5Vjl6MXp5VTdaRXk3aXlLZzJZRU5aQ2UrU2NrTkxVOHZvd3BiMGFMZHVi?=
 =?utf-8?B?eHZ2TFRCWmlxVHZianAzbTR5NHl4SnR2RjA0TTd5eS82My80QzNUc1RCVlZI?=
 =?utf-8?B?K1JBNC9rbXBSRkhhUGs4dFhVZnh0MDFEZ0VFWG5FVDNrcTFVWE85emJ1eFhm?=
 =?utf-8?B?L0x6UlJ6OGkzT1N1bm50NEdQRGRwc2hTeEhtR3RvdjhEU2YwbzRTaDZiSVZr?=
 =?utf-8?B?SXRzN0dBZWc2cnhzTHlmengxbFkwSW8rbkVHcDdscnBnMnpkWjJlWEErckpT?=
 =?utf-8?B?T1JHY1ZpbUU5alBQdGpWNjNrUldWNndPZWxHbkVpR2VCM0VBTXhFMWpoUW5U?=
 =?utf-8?B?OW9taE5ScndVTUxUWDZtMTloY0RUL21mSDVnOTJLSHh6OFczb085VlA5RTBt?=
 =?utf-8?B?WXZtbTl4d2tHa3gyZmwycHR4ckpoRHJZQVZna2dXMTNrTlp4QWpNVkpGaDJD?=
 =?utf-8?B?dXZwdk1xQUxHTHRtK1dRNDVBMWsxRUFIZ09xU1lrTXVqeHY3aWlEZ3loaFZY?=
 =?utf-8?B?Y0dVTTBlbUtITHdhb0FmWHJUSm1ZdjVONzNyN1U2UE9RaHBrcDdVd3hERW5F?=
 =?utf-8?B?MEJkV2k3dGwwdHhkTkxHMFhxMDZxYUNxeHExaExrSEgvcnB3OWZJbUE1RU9M?=
 =?utf-8?B?S1pnYmsvVGlWSmZjZVd6WWJMdW53OThNLy9pWmpsbSthZnB4bloyUm9BRXU2?=
 =?utf-8?B?MEQwVmF6TnhzWnFrbThEWlRkTkJmY3prM0lKMG4vUXFFampRSE8raytIbHJT?=
 =?utf-8?B?YUhXdFhiK21nTFk3MmhUbG9ZVjNJQUFlay9uRDEzOU1DNkozTFlEa3ExcXF0?=
 =?utf-8?B?QlRhUUNEV1dVb1ZpS1BnQ0NnNkYxRUxuZ0hmTGxNRzNvRG02aGZSeFFveERR?=
 =?utf-8?B?dWlERmhEWkZOMzlMZnRnaGhPTlNwMHdxWm1YNm51S0Q4MDJNOVZDbmhQYjM1?=
 =?utf-8?B?YXNGOEdHb09meEk5ckJvdjNlZVhhWVQvcUlmWmNhQmluWTNocHZJOE05QkVn?=
 =?utf-8?B?VHZuUWlwZFlUdTNPeUFOQTJRWFNSVE1wWllQdlcxeVZkaDN2a1BOVFRJZWla?=
 =?utf-8?B?WmlQOHhOTzZrSFQ5VnBjWVJJa2x2WXZHOEhNdHlFRjM2cXBVRTdKVEVjb0RM?=
 =?utf-8?B?WVZMcURtT09wZExYc2lIK3RJUkpoSmR3U3UvMVBFOVhJbGVweVgzL0pmR2R6?=
 =?utf-8?B?b0xycUJiZllNcE1SWVNONktONXdhRGtUdlppazlGWnR1RUZLKys1VlBheDN3?=
 =?utf-8?B?RXdYQnFWeVlrZ0xpWTdWditibU5xc2F4TDM2V3g0dGxNWUhjanMzOVNPMC9H?=
 =?utf-8?B?cisxRUg1YnhzNjc5YmU1d3RyM3dleHhubDdSMmQ2ZTlQQlNMT3RvZGRmYXN4?=
 =?utf-8?B?ekl4SjVjNzRvdERPdHR5NlFOK00vWEdSVlRUVFVxbTRXaWM3Ym1HbXp3cEdh?=
 =?utf-8?B?bkJQc3JuM2ZoWGlvUG9lL2NYT2J4djhqQjVJd3Z1SzVzaTVid3ROVTkrQnR6?=
 =?utf-8?B?Z0J2SHNKTWtNSWc4aG5ISnQ1aHNScGFnNFhXb1VtQ29wVEljVHpqVE1DajhI?=
 =?utf-8?B?UUZTL1lTUGxRa3hYU0J5dVczZkwvenJhRzU5cmcvaTNKWWk5bGhZTFdWK1pP?=
 =?utf-8?B?eE1OY2ZEVVBrS0pENHEvUzFHRVJZcW5XRmw2Mld2SkhGWHFLcHZ6bmJsUU1o?=
 =?utf-8?B?VE15c05wUWJmWjlVN3JoZXhhcUpKZ0tyeFFSb2N6NXNMUHJEVURqM01WTXAx?=
 =?utf-8?B?Z3JtZjcrQVVnVUlGZFNOMERuZVZZclA1a3ZJU3JHOS9FSXVlRXRrUVJZVnZo?=
 =?utf-8?B?TkNrdDNSZzJzdkh5d3lvNjhCcDZvK2tqbjVQRzVQb2VXTjdTSHNIUm5vYXpm?=
 =?utf-8?B?dTN5bmFBNCtnTElSNDZYdGlFZWwrWmI5NUhHbDdSQkUxa2lVQlhiSnd0RDVW?=
 =?utf-8?B?bklIVndUdzY0dENQS1NaYk5iM2tvZVRmUkFqS3MwRmRhZjJORFZVa2pzL2Vu?=
 =?utf-8?Q?cTyUJxiz4pN1m7qdRN/JNePeV?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1376e15e-85e5-4c6c-86a5-08dbaa04a6dd
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Aug 2023 09:28:36.0314
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qBdnXI3O4rnX5d8Cu8wShGM0p9WnX8WSI3vzJ8gQD4x0LmOrNYrApfxG1WBSkjOnC9gcVvqbEksrtayQIs+0iA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8603

On 31.08.2023 03:53, Stefano Stabellini wrote:
> @@ -332,6 +333,17 @@ maintainers if you want to suggest a change.
>       - A loop counter shall not have essentially floating type
>       -
>  
> +   * - `Rule 14.3 <https://gitlab.com/MISRA/MISRA-C/MISRA-C-2012/Example-Suite/-/blob/master/R_14_03.c>`_
> +     - Required
> +     - Controlling expressions shall not be invariant
> +     - Due to the extensive usage of IS_ENABLED, sizeof compile-time
> +       checks, and other constructs that are detected as errors by MISRA
> +       C scanners, managing the configuration of a MISRA C scanner for
> +       this rule would be unmanageable. Thus, this rule is adopted with
> +       a project-wide deviation on if and ?: statements.

As before - switch(sizeof(...)) and alike also wants deviating, imo.

> +       while(0) and while(1) are allowed.

... and alike ... (to also cover e.g. while(true)).

Jan

