Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A8BE26BCC6E
	for <lists+xen-devel@lfdr.de>; Thu, 16 Mar 2023 11:20:22 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.510476.788167 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pcki0-0005nX-GA; Thu, 16 Mar 2023 10:19:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 510476.788167; Thu, 16 Mar 2023 10:19:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pcki0-0005kq-Cm; Thu, 16 Mar 2023 10:19:44 +0000
Received: by outflank-mailman (input) for mailman id 510476;
 Thu, 16 Mar 2023 10:19:42 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Ta6a=7I=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pckhy-0005kk-JL
 for xen-devel@lists.xenproject.org; Thu, 16 Mar 2023 10:19:42 +0000
Received: from EUR03-AM7-obe.outbound.protection.outlook.com
 (mail-am7eur03on20618.outbound.protection.outlook.com
 [2a01:111:f400:7eaf::618])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 10548552-c3e4-11ed-87f5-c1b5be75604c;
 Thu, 16 Mar 2023 11:19:41 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DU0PR04MB9322.eurprd04.prod.outlook.com (2603:10a6:10:355::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.29; Thu, 16 Mar
 2023 10:19:39 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b%5]) with mapi id 15.20.6178.026; Thu, 16 Mar 2023
 10:19:39 +0000
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
X-Inumbo-ID: 10548552-c3e4-11ed-87f5-c1b5be75604c
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=U8HlnTUYBFTqaGkUpaiLhctlZSzDaKoTubzRImluKWj++ZEJ7n92THnyvvCoLisPgyqk6tr5BOvB/Sp/0v9rJj+uqnNr0zzwdm5B+a4GkEjsS8Vh+VOwzeG78xIpJIZXBSgCd6Zh687X9EtSeMB918QFYzuq59sb/FgMhx9D2Mp7ErqR7Csssu5sahzdwZDv1EI+A3Pcdk4i2edzwScwvFznX5K5mHbTIni4BCtI4nA2pTs9jobiMn9Lo48DKlXRyHfzSFjWjL1JhRYaU7+02xFyWb8YH4063qJE/ucDDwFqBPhMvgODuKUi8kRhnmOLo+Rk1Pzaoup7+hG4h5e88A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+Bn+S/2eYfVZvHWIeQFr3qM8VkqvI7SaZtJE1PiDRQc=;
 b=Y2dQQaWz+Dus+ipvgpHUOrOxRsy+pVQg7+L0a7pDllsEATu76FMl7u+2td6+dyKisCJ3OZwrbbjtL7eJfTvrR2jpP+ZykwrRwHF0NoxqBI/jfEUKch35kIK+5AXZdwK5yTsFRi3n5Ql0xy48FFbM5DC3MLkVb2eNUgYe+DLGQrW1js0nLjS5HqqMz8xJkNm4T9aZurDkHaoYTkb01oy3m931zdOjhTvvLmKi9MAppgXo4YxBeZeHh+LBzPBCwDltsPP4eH8kI8eezLOw23CrmDFXnqiAofxhjRU6wAdlLmPv94mLi/8z9kxI2lVLKLGpkO45Grj0jfIn5hDCXAzcSw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+Bn+S/2eYfVZvHWIeQFr3qM8VkqvI7SaZtJE1PiDRQc=;
 b=rRwh9D8QCO8f9zQcxOtcszbXujEAmMYNtjiptnkU5z6yC7ykfdf4Fi79Igb/Hhf1P+JhD/F7BbgAyCpToB5ddtVj+Xy4TR5IBZN/JSD/AYvvsh1RbMb6L8C6Tsx3oO397+3ZIY4qiFL1LAQKR4BMdr+7V5tjOSheRjp6Q9vRy7K1wcVm0g+PQgpX8PSystuzV+8I3AzetDKamTjaFeInRGiBQK6FTbLuwXoAfpPF6+Ji9ut9QB88bn77W7lHzSgh6+Ub+OhX7wcBx14pHiyglIgy6FHWXORx/WhEzaInCsqNFR9Y9OMFKWxZLoTpkJahiqvaZGC26tL6EhyBHu/fEA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <fd55257e-3604-e09b-fba7-bc95d39ce723@suse.com>
Date: Thu, 16 Mar 2023 11:19:37 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH] x86/svm: Provide EXITINFO decodes for IO intercetps
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20230315221003.733913-1-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20230315221003.733913-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0104.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a9::15) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|DU0PR04MB9322:EE_
X-MS-Office365-Filtering-Correlation-Id: bec89bd7-94ea-41b1-9916-08db2607f35e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	gz2pN/c2/6RDi+felQgbvaaUgYOoOYhzMFspliLv7OeX/h8rqbt+JthWWo70MUVTlXvmvx7lp4klrllaE9kvWn67ySI3zjf9UXhgbUOwzmyR4tC5yHfwiMxBK6JTqpxJ+EiMuMU0Zq7j2xYtnw6FngQGB3VmBAa5fINri2kHLmNTRvqg/SnaDTTR+49dAwyiu0HSHAgY7hmWcTEBNDt9Tbb6hAhlnMCquiBrg6hNfYX9Waf/QfucZDsVhmaaPJ11+NJqMRQiFA3nz6tlforJ6yGmk8Mu7gp6KuQK8RbtPnx1P24gC/a32deOBbA5gFfqnpGkySmSE2lfOky/h6ogjx4giXOFgi5c+yA+N1mln008+hMueCB6a2BjS07Q1AAhbLbzZsmuOFGWmUStp1dTcjzS/0e0zVY4QSQ+mu5wlWducDDfLX9PIUKMZRtcJf7dM5X+Z/EM+a8lVYeHBsW6U4NmXMgdgEmccnZvFM2Jx2ayj/5qdtWX04YfoF6Qf0B0HNxIOAZHm+lud2dUVOmp9MhUs1JZgUoLXPsuhPnkC+XkbJ83n/GPz+UVrkwAsSPnkgfg22763cgKJec4f8MLTlE/gc8kEOOEL9QoSHV5PGf7dH5rUpntoancqtqZ7bNZxvcp9n1AFeYlshOIlV+z9s9agYnk7/0nILz5NJY5KRKbfIXnH5ztEiE2VgZnpf/SsC2wm1pJ1qjxxT1aZ30lJTY8ke/sk5zvDDJ6nvcepkM=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(366004)(39860400002)(136003)(376002)(346002)(396003)(451199018)(36756003)(86362001)(31696002)(5660300002)(41300700001)(38100700002)(4744005)(2906002)(8936002)(54906003)(83380400001)(66556008)(4326008)(6506007)(6512007)(186003)(53546011)(2616005)(26005)(316002)(478600001)(6486002)(66476007)(8676002)(66946007)(6916009)(31686004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SWVwczBWWkgveGdWTWRiWURHSlpuQjErU29UdWJNSUVGb1FFWjYxUTlmdWxF?=
 =?utf-8?B?VFlQa3M1bnlmaXhyY1kvNXQ1VlpOdUFVMmtPenVlTnFuYndDYTdyQUdKOWVl?=
 =?utf-8?B?T2hoSW1adWkwNHlya3dQeG8xTzVMZ1VyczJ6cVo1cDh0MzFtdlhhMXZwdkh0?=
 =?utf-8?B?bnpTQ3ZUWStGOVgxbGJOWVRPSGlST3ZZVzAzeXhTOWowUWU5UUYzeDBpMU9t?=
 =?utf-8?B?UmtURmxCZDdKWXdJRTFxcTByY3puOUU4ZGluVFVsVHpKQ1FUbWN4QmVaaGlR?=
 =?utf-8?B?STNDRkFOZzhZUG1SSlFxMzRsbExsNk9lRVlaaDE4WGExUXBOYkxzbTFRZEdD?=
 =?utf-8?B?WnNGVGJ0OXpWTUxBaFErK3VYL0w5bjRhSWdSeXA4MEthR3hVNTBxeHFGU2lL?=
 =?utf-8?B?SElsRnJ3MDE1TGdneE5ka1haMGVIaXlmRFdqNGtZMk5LaCsyRXlIRjBOU0I1?=
 =?utf-8?B?aU5YT21Kc2R1K0hhcDJvb21hSDBJWEU5UkFuWUgrdHBjWThsNVF5UitJSmFB?=
 =?utf-8?B?RjljTGZHWVBwa05GSlBnT1JRemE4TFByNzlLZEdvNUpLNEF3Zm1uSTIxVWdE?=
 =?utf-8?B?b2t5YnhrYUZkVlVseWtibGlwWVgxaUVQZTJLTk1FRjNQSU02TEpoeFEreDh5?=
 =?utf-8?B?cWJ1c2grSlpobmZ2ck5oczVOVTB3UXYyTGNVN1ZqcjVGSzN6RHNaS1Fjdk5W?=
 =?utf-8?B?eHNaa2VnUWx5emNKaUxoQUhEYTJaaEgvbEdSMGlMQ3gxaFl5cWhjTHlkQWx6?=
 =?utf-8?B?K0FQL1ZyaFM2MGQ5ZFBqMW9nTmlrMkZJZ1czR3VPMXlpQkJWMVEwVnEwdHp2?=
 =?utf-8?B?NDlJTmNjT2tLbXRES3ZMcXRTdFc4TmZ4Z3RWaEtNWWJmdEdiMGRTRVdDRmND?=
 =?utf-8?B?MDl5UzhDdkNoREl6clhOczNxSnZBcGJPNnphbG9yd2JCUkh4WUxMZmw2Ym44?=
 =?utf-8?B?aHUrdHI2TERwd3YrZGJQNG1qZmttazB1K1dvd3M2VGxBblJ2NFBubnVVci8r?=
 =?utf-8?B?RGkwWmVGNVpaL2h3aHlDQWpUSkpIc240YmxqU09Ld1BoanJRK09na1Jxam1o?=
 =?utf-8?B?T2dNamdIZDBjMTBBVmR2aGtXbFJ4MTk1c2FNMWtjUENNblNCbThMaFNwNUxw?=
 =?utf-8?B?KzQ5UnVkT29WMGo2MWx2MXVGcXNuaW5neGl2M0RIWEtiWEwrODZheGlTRFlT?=
 =?utf-8?B?Mm1UY0tReGhkLzBEQlpyMnljcTlmSElJakpLT3loZkdxTkxTZE5QZ2ZoWGg1?=
 =?utf-8?B?MlNWdFdad2ZaZW1yZzlHaVdjbE1PVnNOQVl5Q0hZczc0eG9JcDlhVEVuMGtG?=
 =?utf-8?B?R0NNUk05dG04RHgxSHN2Y1BSdkpIRm5LdEVTRm0rU3dLVFhrWjZmLzZxZlZ5?=
 =?utf-8?B?WHRENFBSUjdEY09jbm1Wai9yWUdQZnhBelFUd0JsK2JyUXAwTHBXdVVvbVRE?=
 =?utf-8?B?b25GbThpcitFMTNveW90MkxtUHFNMnlGRk5JMEFVUmpnT0lHV3BrYnVzY2Y2?=
 =?utf-8?B?NE0xa0tFUUxpQ3lBYTBvQ09lbEZUb3Q0RktCa2sybkI2TkZ4MkJvUi9NNnZt?=
 =?utf-8?B?VmtVOEpvR21RWUszYmNHUzlZd0J0UmtEMzNXRjcxeGo2UDhSV1hqb29HSDM4?=
 =?utf-8?B?RFZBK0I4cGtuRnYrTG5CZFdDWFZQWUxxVWtBNERneVhvNWxsemw3SUttcXRI?=
 =?utf-8?B?a1Y2VTRhU2xBa2YyN0M3bUVTcWtDRTlOTUdpL2JqcTNMQXpuaVQwOC9yYmc2?=
 =?utf-8?B?OUxUMWVnZVFLRlErd3lTQUtSaHROZHF0WU16ekNQOVpZeGlSQ1piLzV6S3cv?=
 =?utf-8?B?bk9ra0E2OWRVU2crOE11T1lNeGh6MzVLUXZvUHdRaTJuY1FyUjZ5VHlVTndQ?=
 =?utf-8?B?YnVQWXNwd1FuTlZLSU5OOFlKdGk5N1RtcmZkbG82N0UvcmFMYVZGK3JaWkZR?=
 =?utf-8?B?TWlkU3hkb0hhRjJ2NmVuVlBEektTa05qeVRDRzBWdi85L2FGWGZzK2NodHNi?=
 =?utf-8?B?VUJZUTVNSCtHbzNHVTNENUZtNTVnRHlncnFmc3pvUGVhUFJxQUtEUjBtM1FB?=
 =?utf-8?B?SzNXYUpjWi84QWNkbjkxeWoyMkpsLzdKRFFMVnpINmFxeEUrM1RPVXU3L0xx?=
 =?utf-8?Q?bfuIiYaVoLD6iTu0zgtNaO2dB?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bec89bd7-94ea-41b1-9916-08db2607f35e
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Mar 2023 10:19:39.6965
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mpaJ2Y2x12sdTw6fpUGajCp9ChbAPqGkEaXWuZrW35U5mv/N80H9wUu4eNQs8IPs2YEI1/Rhn6ugQoxH3xvoTA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR04MB9322

On 15.03.2023 23:10, Andrew Cooper wrote:
> This removes raw number manipulation, and makes the logic easier to follow.
> 
> No functional change.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>

But I have a question:

> --- a/xen/arch/x86/include/asm/hvm/svm/vmcb.h
> +++ b/xen/arch/x86/include/asm/hvm/svm/vmcb.h
> @@ -436,6 +436,20 @@ struct vmcb_struct {
>              uint64_t exitinfo2; /* offset 0x80 */
>          };
>          union {
> +            struct {
> +                bool     in:1;
> +                bool     :1;
> +                bool     str:1;
> +                bool     /* rep */:1;
> +                uint16_t bytes:3;
> +                uint16_t /* asz */:3;
> +                uint16_t /* seg */:3;

Is there a particular reason you comment out some of the field names? I
can see that "asz" might be a little odd to use, but both "rep" and "seg"
are imo fine to have a name even if currently there's nothing accessing
these fields.

Jan

