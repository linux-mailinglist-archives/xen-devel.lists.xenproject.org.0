Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B4D65605EBB
	for <lists+xen-devel@lfdr.de>; Thu, 20 Oct 2022 13:22:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.426611.675163 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1olTd4-0002RF-2a; Thu, 20 Oct 2022 11:22:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 426611.675163; Thu, 20 Oct 2022 11:22:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1olTd3-0002Od-Uo; Thu, 20 Oct 2022 11:22:25 +0000
Received: by outflank-mailman (input) for mailman id 426611;
 Thu, 20 Oct 2022 11:22:25 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=VPXW=2V=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1olTd3-0002OX-9l
 for xen-devel@lists.xenproject.org; Thu, 20 Oct 2022 11:22:25 +0000
Received: from EUR03-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur03on2046.outbound.protection.outlook.com [40.107.103.46])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 78393b02-5069-11ed-91b5-6bf2151ebd3b;
 Thu, 20 Oct 2022 13:22:24 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DB8PR04MB7020.eurprd04.prod.outlook.com (2603:10a6:10:126::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.29; Thu, 20 Oct
 2022 11:22:22 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2459:15ae:e6cb:218a]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2459:15ae:e6cb:218a%7]) with mapi id 15.20.5723.035; Thu, 20 Oct 2022
 11:22:22 +0000
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
X-Inumbo-ID: 78393b02-5069-11ed-91b5-6bf2151ebd3b
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=O20KOlbyPRwfySBklhLspJls//aZTO0OqOyW8tV08c3hZQpI+hZnOc3C9YrV81Hsr05LLUsPJEc4uAHBx9Xw+nGNVyqxJ0hCEAZibw7a3lgd44O4Fx5ADp4s8TZCCS0N+iwVBM33MqJt62lmTIREirWc68dT6n/Zzdl1/KkbToetTfs1AsDXE4DLwRRmTzj/dfoNfkZGkuFqdskrjph9EttQdBPkQ9VEIIT5KIgAf7baQFGuxfOVSZH4bK0+R3Qn35IyEsy5r3WhTNPj8RWe8ATeEWamyoiSFkQ3supcfGPiPnU9reQHbynyDi6gfDjt1HE6FZ0j8FSXu9LD2oeuXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SzHEfeN0eWADFmzOSEdVxajkOuBplALvwDC3lhdlDe8=;
 b=Ri6tS93IhKJKeKFNDaDvI6gYAaan761rpYbVOwyMnpvp78p+MJf8DS+oyW6FIymbSgTweWf4pC3dyINIoHNRse2ndPbqrzj2+O5iSjRxe3yw7kXCXBL4ZbBZ3rlwdFrcdsh1B9IWrotpWn0NVzR1Yx5JAHJxFcKXTAt5m6yKresJIoO53OC0TkHJYveZvOj6PoMPR73BKXE5ujw48oueJeP3J/Tj9GwtVSIqNVGofa2fWQePcQbEx1nVs/5bwMjlNKUJpDOFPusDmu1yOQMCbidltST8+UiAVl0oY33G2NM4kN3CTTAKKLv+PE4qPWDMGIGSj9ph/qQjyRL1Y9gEWw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SzHEfeN0eWADFmzOSEdVxajkOuBplALvwDC3lhdlDe8=;
 b=ZuLbmrA5PC7hm2B/8IqAP71dx4E+VpZtgv/ci1gTRMicLBTqgvFahvFGu8CbL+6/n8R1FoeRBj4VriBTKAhuYsZmOVeKUYKCKVIu4x/lxEAR+VZ90qVBlNVrJ9UQeRxZ/mCNWIjYgwKYHsQtLZ4gKHVuTjo7p5FAyjjcL4ot5vzALPOes/otniDERpFZtXQqdwluUnOYRJe52HvBB4S/KxLOdXFXlhp0uXtifRMZGbwT7wilfXG8uaTYJ7dvJT3kmmNHXGvXwUwbS2TSKQeiFDkVWdyYmgK2AxrV1/Q0KdwQeZdgzqiMV9WIEAQwGyqC5DpN2SPFuGHYlAvu2NJzYw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <2f5ec31e-2ac5-2b22-8801-9ebdc4946962@suse.com>
Date: Thu, 20 Oct 2022 13:22:20 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.3
Subject: Re: Intended behavior/usage of SSBD setting
Content-Language: en-US
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
References: <Y1Eqk6D0dBDR4m4u@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <Y1Eqk6D0dBDR4m4u@Air-de-Roger>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0145.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:95::8) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|DB8PR04MB7020:EE_
X-MS-Office365-Filtering-Correlation-Id: e3da713e-cce5-459f-10c7-08dab28d5b75
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	1hLFkxzTqNWUcx7K4BMITx5kVEE1Ap6p2YWphvcWXjIt42qYD7LyFj3S881RxBpDLmZPkb3vS+fZ3Vgb3L7UI2FlGc6L8EN0NwXAXbPfcVFsUvoNk3s+1hw/CvgbBmVdyZjidGwc3JN8czBPxRTRecXNnYrXq4bWvk/1FseYmhUThmWkZQLmjVkQq10QPscK56XGjygJDhi+h/VI7UkcEAi25e/ZQheq8Gv7FDSHRCe+8kg9SAYmuqncH8Bpe44v6ZAYsPrkYwTnBA9v6v/5E9whPfINGa1/baH9yaV2hXgF58GKLXlyXiYDpR8dJ1+FA4A3SPEjEgS4GZGhxA9wtl1mXwcXtpbU2lvCNyZwTnnVec3J8zVC+tJQP/Q/tHAXEyza/lmiIdb095z2n5IhAMbp2pbarBZzX5CQKw17Ay2s+4wj3YVHskvtotiCfLrfdCrwmaGYJdqPh/aY6jU+W6qgXGFYxXhMb0xpJg31ebsf0M9EK/676p7qxOrGrK9xSM7CjtP2+Wzuo3EyZPPBCN+ZEQnqJKtFwZnjgOE2FJpJPjKNENLwNWHZFG8DUOX2KzCG3SFH7IBLQMPPIV4goiif806uIPVYSpZ+MWB8J4Ll1u+FtceD/90Q/Dl/8quHoTe4q6I7dgYTOKU1yjUGgUhBTux4iD+c0NUGTVubJ8L5salf08E/zwJRJerCTksL9HxORFWPSZJ+NdAowzdLcoj/6J/Ah9v7d8qlr7M5T6ici02LE3xl5DV6Du8Qy6IaLSYDs0InGF73xXZ+kju88CGCeospj0HaRyhmpd2nmqo=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(366004)(396003)(346002)(136003)(376002)(39860400002)(451199015)(36756003)(83380400001)(2616005)(31696002)(86362001)(186003)(38100700002)(8936002)(31686004)(66899015)(6916009)(4326008)(5660300002)(66476007)(66946007)(316002)(41300700001)(478600001)(66556008)(8676002)(6512007)(26005)(6506007)(6486002)(53546011)(2906002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SE1TMXZTbnV4YkhkNFY2MTY2UWsrejBMcDBGU3JCTUNWWEdMQ0hIK1hCNnFy?=
 =?utf-8?B?VU42MXUvQXI3VGhOejY1SHRBcGlUUkoyNEYzTVRjT0U1d0lTOEZJZlpvOGpP?=
 =?utf-8?B?ckdnMzdTNUVzTm5ZTVFESXh2ZHZoZzM4SmFRMk5XVTlnVFZkM1FmZ3NWbldV?=
 =?utf-8?B?NkJqY2EvY3YwM0Q1RzNuOWgxdDE4cmV6eHoxWHd2WFNkL205TzB1NVJFODRx?=
 =?utf-8?B?MmVVdVgzV2VJTzFML1orRGI5djcwT0xSMmlubkFXV0FWbGFDVlZGYkhQVlN0?=
 =?utf-8?B?L3Z1bktqdlFKdDUxZnFPTDJobHpveXZhd3MxQlBLTWZqT1dqaWRNY0dIZVl0?=
 =?utf-8?B?TjdMTVNjdUV1V2hTY1lUaFZQOUQrVVBNb3dUMHhmcXl5YUdBSUlzQ3BhMHQ5?=
 =?utf-8?B?dDc4emdENWFQSjBZQWE4aG9Gb3UwNit2ZWlHcnpJNzBBRXFvNFN2My9ySlE5?=
 =?utf-8?B?QWlRenNvMHV2MmFCUEMydnBOdTB5VFVsSFgycE9kU1JhTjFCYWtlakpCbm5j?=
 =?utf-8?B?aFYxUFUySTNiNHY3d1UrVXpkUHFqVlZlQXB4b3c0R0lld09LY3IrKzFYSUha?=
 =?utf-8?B?eUQ5azM1M2J2WklVeVQyR2dGK0czcHI1VC9BbmxKUklqc2YvMzdzSmtZcjZU?=
 =?utf-8?B?R0VWd0FxUGVSdWRYWThtM2lpMnRwbVJHTlVvNCtGd1Q3SlNOc0ZGVzdCWFJ1?=
 =?utf-8?B?eVdlMTU0cmxHTUlYeEY1Ty9oVVR1Slp0aXc2V3pRbmhaOXM2QkhiYUc3eU1a?=
 =?utf-8?B?WFI5R3psWHEvdkRsQi9yRWdyN0t1UytvamtnKzRLQ0MwZlRYcDVUMEJDUHRD?=
 =?utf-8?B?VTM4eHZVU21XeE9SQzNBZHlqN2U1TzY1bG9lUjhLbWtOUnR1Q09tMnh1OVVy?=
 =?utf-8?B?c1ZnYkdkajB1bFNDK0tiWUk3MjhLNk8rblhJRWRXKzJMS1JFVFp6b1Uzenpr?=
 =?utf-8?B?d0U5MDlBelY4d1kwVGExKzEzTVVhK3dGbWVDR01FMERXWmkxNXIxbFhpOUlZ?=
 =?utf-8?B?OEl6OUVtdmZOUk0wbmh6b05PRkVhTGdCTXNhZDVTWWxkanYyMnFPY0lKMmxL?=
 =?utf-8?B?L1FFdkxxdCtEYkRaNm0zanZkSjcvR1BhdnBocDEyYkw3VEFvQzJUeWdJcUY1?=
 =?utf-8?B?SUFhWW5vR08yVlRORlVNZ0NQT2QvSnQ2cGlPbExXd1pBRGtkYTNlbklSbGFR?=
 =?utf-8?B?V3JIRmxFQWZQVTR0TzQ2NkxFS002eUE4UmhuUjBrV0pwRUlGV0xkRW4zM01i?=
 =?utf-8?B?NTkwUVRpWFdid3psblRKTWJrRXRoM1orVHpIY0FwN0tDZjRqUHR6SEFDc29F?=
 =?utf-8?B?UjB6WVpkUHYrMGpYT2VXL3FNeTFhZDNXMjFJUGwvU0FPV0VFak9pQWU5WW9X?=
 =?utf-8?B?RHZnanlwbkY5ZVQwTStkVzBWUmpzdStlZnUvTjF6aW5HNE1ma1ovV1p1OG1V?=
 =?utf-8?B?anVkYktOQnVzVGdNN3F1c0pBWHVBNEpsMnErQzZ2amFPNUxaVGxwcWxyaG9F?=
 =?utf-8?B?RUtld25YdUhxVkFjMHJ2blRRUmttQTN2WHdaTnp3Nk1XV3hFT3gxZ3ArdFRP?=
 =?utf-8?B?VjI5b21aNExUQnRQS2ZCQWwrR05HZVRHM0FFQjVTZW9WTjlqMHpvZTVrOWJk?=
 =?utf-8?B?NldqdjN0NVBwTWFqQ1U5SFd6Tjd2OEtFdWJTL25xTEZmVzAzSXhteDNDZFlR?=
 =?utf-8?B?Mkxjb1BTdDJ0c2lpRlA1SXc1V0RqclI1OERVQTRXQTlqQVNldnU2NUw1SlAw?=
 =?utf-8?B?OExzNHNKOExrSUdwbnEzTXlDM0QxekhRVmlDR256YXZCS256Zk11Mm03MGhs?=
 =?utf-8?B?R1FpWi9Lek9VR0pwakpCSytzSlpJYTJ3azhXZTEveG1NMmVRMXc4Mm9NTTlL?=
 =?utf-8?B?QXBtTlFlN3U4Q1Y1Vm5Ja3hVb1NjUnk4ZVc5RmhlVG5Pc0xDVWJyaFVWeUNq?=
 =?utf-8?B?cEhjUzdhaWZxcVY4bU0wTzdIVTdncVVVdEJPajJYdzR6MmNud0N0azVvRWVk?=
 =?utf-8?B?WVJqblVZMjJCVHJYdU0wd2VoZE84Rmo3SE11ZVFST3lpNlVEY0VxTWNtRUtF?=
 =?utf-8?B?enlmOStUUTJodVYzc0lML3JsdzFEY3g5K0wvYTJ4dXlreXhkMkE1K2kyLytZ?=
 =?utf-8?Q?4JIeL9YjgGRDZjprwl75mNAQF?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e3da713e-cce5-459f-10c7-08dab28d5b75
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Oct 2022 11:22:22.2127
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EujMuxE7uhWY+AH9J4OmzrGVWuc9BrFt69BmsZ5sfPBQz/0l120oMmgKB7phh2bUHK68XpvZvW8PyJB3sHP6Cw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR04MB7020

On 20.10.2022 13:01, Roger Pau Monné wrote:
> Hello,
> 
> As part of some follow up improvements to my VIRT_SPEC_CTRL series we
> have been discussing what the usage of SSBD should be for the
> hypervisor itself.  There's currently a `spec-ctrl=ssbd` option [0],
> that has an out of date description, as now SSBD is always offered to
> guests on AMD hardware, either using SPEC_CTRL or VIRT_SPEC_CTRL.
> 
> It has been pointed out by Andrew that toggling SSBD on AMD using
> VIRT_SPEC_CTRL or the non-architectural way (MSR_AMD64_LS_CFG) can
> have a high impact on performance, and hence switching it on every
> guest <-> hypervisor context switch is likely a very high
> performance penalty.
> 
> It's been suggested that it could be more appropriate to run Xen with
> the guest SSBD selection on those systems, however that clashes with
> the current intent of the `spec-ctrl=ssbd` option.
> 
> I hope I have captured the expressed opinions correctly in the text
> above.
> 
> I see two ways to solve this:
> 
>  * Keep the current logic for switching SSBD on guest <-> hypervisor
>    context switch, but only use it if `spec-ctrl=ssbd` is set on the
>    command line.
> 
>  * Remove the logic for switching SSBD on guest <-> hypervisor context
>    switch, ignore setting of `spec-ctrl=ssbd` on those systems and run
>    hypervisor code with the guest selection of SSBD.

* Give the guest the illusion of controlling the behavior, but run with
  SSBD always enabled when "spec-ctrl=ssbd" is in effect.

* Give the guest the illusion of controlling the behavior when
  "spec-ctrl=ssbd" is in effect, running with the OR of guest and host
  settings (switched, if necessary, as vCPU-s are context-switched).

Jan

