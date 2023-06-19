Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E82967355F8
	for <lists+xen-devel@lfdr.de>; Mon, 19 Jun 2023 13:39:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.551027.860312 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qBDDG-0000go-6e; Mon, 19 Jun 2023 11:38:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 551027.860312; Mon, 19 Jun 2023 11:38:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qBDDG-0000eP-3f; Mon, 19 Jun 2023 11:38:26 +0000
Received: by outflank-mailman (input) for mailman id 551027;
 Mon, 19 Jun 2023 11:38:24 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Jerb=CH=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qBDDD-0000eF-QO
 for xen-devel@lists.xenproject.org; Mon, 19 Jun 2023 11:38:24 +0000
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur01on0610.outbound.protection.outlook.com
 [2a01:111:f400:fe02::610])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ca7c927b-0e95-11ee-8611-37d641c3527e;
 Mon, 19 Jun 2023 13:38:21 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by PAXPR04MB8685.eurprd04.prod.outlook.com (2603:10a6:102:21c::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6500.36; Mon, 19 Jun
 2023 11:38:14 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e442:306f:7711:e24c]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e442:306f:7711:e24c%5]) with mapi id 15.20.6500.031; Mon, 19 Jun 2023
 11:38:14 +0000
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
X-Inumbo-ID: ca7c927b-0e95-11ee-8611-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ux5AOVhDnvb4w2AtLm+yQx6WyHaO5jaoJKES+3O+6o9Dn4r2tb+JppqBYF3rNKnKXYhL5GgRLroBZGQiy+jP0VJvsMp5NyXeLkrUbHD3lHnyzbfJCxstyvQqpZf65WDPlBcL3UXmiyxgikNMT5haGjke7i48f3z4DGIZrud3Dt2vQvIDt+zy62bplda/s52Vnf82UTvDcLcTYQabEyjfSD38KlSFs8CKISPrrCpokC6C2sEwvpZ9eynXHo62JaxA6XE0z4RUJp5j4lOlYYtGAOPKu62PGTIMMZRVwLayV68THxJpdsIw7vdGP+r19hXV0ry92sfuSL9353jr4rb3kg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=it3TDO5izUEHHb8E1V/IHsGVPvCmT2gLH0Ow3qA/DkA=;
 b=k7zh3UKkshZCSu6o6o+btPhtIVRyJb1xGwPNHiTPrP67NhtC8H+n8jkWUksbByP1qWn0DNFs9rntzKJ2Iov2dCb628lTueAqxauxIKeYeBNcYp8PEUw6p/kwGB4S5eqRFISyecWy0eNqnOhN6wNA0N547p5uYQxtzWRABBpHU1KLV3eKdc6iHI638cGaWaTD6o5RgWB138oP17z4k3vMPcuDN1A/+Xs8hH446HxM1HMaHL1iuWzTMo5MJ7iGB8IwYA0IqGL08fEZK8gwagwRSNmR0Sb/sMGL6Q+Tc3R+8VL8sJtx9rPDRqwspcjlGhOU4+6jEBC52jmivIuvSB8Qcw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=it3TDO5izUEHHb8E1V/IHsGVPvCmT2gLH0Ow3qA/DkA=;
 b=n74hiBLgzTJdgr0Gh5a8arDPoGAW7zvFhFCnSQ09sSSgwxWIYC0rfU7lid3Is90VVNIQLAeZtTvLM6+/OqfqqytJcW0EgZhiMCHBT7tfO6VjL6gDr3Bi6qlP71VfhsnlIUIzZxM2B6EcfIdqCDoPXMC83Nk1EfCWdx9mWVsRqNrV30dMYeKjc/Msv0POMEDnqaTWHuEGVeWxg0Az/l7UTZJcXfdMb6+nbvpGorM97JrbNw+9QZriNjyXBllWLPymDAeFDn4i0ifCSwGrB24kri+wo0QZvy2OiQysBbiL/o3KR5Wia3IFQ6M9eK2h7aT2HpI+c34On2GW/Sd23Gtb1g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <66771ebb-7d56-ca84-89bc-14f69fe62bd6@suse.com>
Date: Mon, 19 Jun 2023 13:38:16 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v4 06/15] cpufreq: Add Hardware P-State (HWP) driver
Content-Language: en-US
To: Jason Andryuk <jandryuk@gmail.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <20230614180253.89958-1-jandryuk@gmail.com>
 <20230614180253.89958-7-jandryuk@gmail.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20230614180253.89958-7-jandryuk@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0175.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:b4::9) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|PAXPR04MB8685:EE_
X-MS-Office365-Filtering-Correlation-Id: 9f1799e2-0414-41af-7fbe-08db70b9ab11
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	KHybwR+hfm5DY+njqhjK5tPUdofUopiHsQ5fXhCQMNBXkLf1OMV+4eu4vcNWtfXGf5uN8yq5DI+LTT3W2phwSMPIaVrjkk9hPz58mzgKhvpSdLBBRN7M90FK5QuFgouwT+EJZpmr2Rj00axFnQxrz0vw99GEOUgRz+AvNPL5mw64z+6JjwxXvxgC2xjg8NaaYXAmZ1Pkb0pjLnADOV6nnTGmPWrvUZosyT/sBK6IkFIjnLOxwMS7aV4Rdp/hAIYwSzoUChSo4mzEtalFDPY3RTM3DhLMBd0Hzgr2GKWBz2C5AOGyjDFTp6qgHVktlamEP2NhYKs+iLYDBhPbUU0hczAgnIMy3O5KaDpWPzNHXBoKdS19ZBtdRMVHoLrHHf1eTbov1VeEpKYUL2MIx0UTicplDzJCDSsCiQgtOKkZsXGVeYAkeswkVqaavWMYfJ5v2q+y6if7+GnQH+ETU7kNHdDTBV7k7wP8mc9PuFO6HrgD6NDPqnpI7avqC9ffrXIk+7m0PM/GW+hKdVdVm1+ycKF7dcRpa6MxPZmFrQ18jrVlmULYz77lRJpzl3/U0wPz+yfZQ5ob3xjiQ+kc7ox70Gjye/rK7jltxZ31lYsesSlW1/EHlxzIBJeFlWWqmOGuNxRCKzh3+gvcMmbgwNchZqIuhAIRH6Gx+8e2j1401kYNLvyZiN306/jVhoKW/zXg
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(376002)(346002)(366004)(39860400002)(136003)(396003)(451199021)(478600001)(2906002)(30864003)(6486002)(54906003)(38100700002)(316002)(31696002)(83380400001)(31686004)(5660300002)(41300700001)(66946007)(66476007)(66556008)(6916009)(53546011)(6512007)(6506007)(36756003)(26005)(86362001)(8676002)(8936002)(186003)(2616005)(4326008)(45980500001)(43740500002)(309714004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?YUNsdXc2SURXU1p0OXd5RWtUYUpGdHh1dGRLL3VWaTg3aDNCdmlLeWVLNmRr?=
 =?utf-8?B?M0F0Tkg1L0YyRkttTWtaUDNtWGRpdzFHNVQ1N2Y4Z3FhZU9oNVJ6aWpBck01?=
 =?utf-8?B?TkJmNnFZVVM5T1d2ajlidWxsaXFhTGRSS09FLzZiRnptZ2hmYlUrblgzeVRo?=
 =?utf-8?B?WTEyNFVkRU9KdWpnWFJKdVBzcFBlUEVVVTFqa2dsL2JFVXFPc1lXYy9ySFMw?=
 =?utf-8?B?K0lvTGR0eWZCVk9JRXZkSUhzb013OGdqVUJ0YWt0bTRnK1YwcGtzbDdyVjZV?=
 =?utf-8?B?bUZ4eHIrdnFzRWF0ZnBwUkZWelJSUndoUU5Jbk1sUEZxaTJGMmdXQmllc1Bj?=
 =?utf-8?B?aVlheEpmRHk3OTE3MFN0bGVobUxDWEpaQWlMSkt5UDJkUEV3QjhZejRMckQ0?=
 =?utf-8?B?bEgweWdVY0ZVQ0lVSDFmS3VTbjRWU0puNFVyemJESjY1TFcwYW1abE9hRVZU?=
 =?utf-8?B?aUR1ODhZUkMvYnR4VHN3NWhNampzNlJOanUrcVRPWldDQmlCQWZiMjV2NmtI?=
 =?utf-8?B?VVJ3R0p3N1plTnFHbXFxZ29YcUNPK2ZNZStvczdnSkVkby9rRmRldUNmR3BV?=
 =?utf-8?B?NENBWHdISjcrUGJWWlRZek5LZ0FyWWFUSkdQaFBVY3ZUTVpVS3RRckI3YUpp?=
 =?utf-8?B?YmFkbmpwSXVsVGdLQnNpdVJhbTgxM2JSYlNWd2dYVkJqSHl2Y1NkU1RIR0hx?=
 =?utf-8?B?MFNuUE85Y3IvRSs2Yy8wVnIyRkpDY1ozc2ZncnN4bFd5QkJJQzZlRVV0c2di?=
 =?utf-8?B?dmQyR25adjJYdTlnYkp6WWQ3L2QyNFJaMUlSZlZSVkhUb0FQcUEzNXRXek4r?=
 =?utf-8?B?R0Izdlk2K0I2TXdzUXR0eEM0Y1lZZWZUdUVrRkZSdGxnSktyaHRDcm5oeEcz?=
 =?utf-8?B?eCtEM2k5VTVXc2I4RXF2WVFuVEtsUnRtVjJKVmx3TldtL0JNdEtnaUd5ZHFm?=
 =?utf-8?B?MS9mZ1RmWnk5bWh5M1NrT2d3MERiWkF5Sng5VFF4Sm5hWkNmOHRZMGpXbWs2?=
 =?utf-8?B?WTc2c05Ec0NCQmt0OVU4WDFGS1hvdFFzWlZoLzJBRHE4MEpTYkpvWlNxMnda?=
 =?utf-8?B?aFozbVJUVFVlTkl1b1hKVzl2WXlxb0pRUndnM1JRYmJ6THJ6M2piTHpOV0NW?=
 =?utf-8?B?cEJNNjFtQldlNmI1a3VrSlNNdlRKUHRCdG5RM2M2KzRxVSt3bFVGcjMrcWp6?=
 =?utf-8?B?b0Z0ZnZPTnRxL21WQytSMmJ1ei9FV2MyN1M0eTRVYmlkcytjeEFxY3YvUXNz?=
 =?utf-8?B?Wm1rQnFRR1o4MWI5aFQ1MlVHRnF1UmdIRzgxbTlsQTlXSHNqWWZZVHQvT0xz?=
 =?utf-8?B?U2xuOFpoZGFOdTI2ZjM1bThCTTdJa0pqVCs2RjB4Y0VienIyRC9veHpOQ2dv?=
 =?utf-8?B?a3NKeHRCSVROMEcxaWJKNTZPT0pmU3VtV1JOTVExRWQyaS9wSEhkY2NPa2hP?=
 =?utf-8?B?L0drbUZWc2dKKzc4Y0RpNjVrVFdyTnk5NlVQQ1ZJRzNMRFdoek9iYTZHOTQ2?=
 =?utf-8?B?MkxIMytkdWRCelRUTFhVQWtwR095L2JwSFF3MXZkU1RhaVg5RFFKaUJZQ0pQ?=
 =?utf-8?B?dlFvRm9UVzlsOGlDamxvOVZmK0NNNlMwUFAzVmhPUjM3VExwTnNXaS9jWDJt?=
 =?utf-8?B?cjFndkxzaWU2K25qWk1pOFJrWEY1MCt5QmxQbVpTZ3FOMWhYL0VsZ3V4WTdN?=
 =?utf-8?B?bWpOd1RrY0NOVmN6TGd1T05YUTFYUnVwN0h4K3Judy9weDZwSDlmSDM3TWJ6?=
 =?utf-8?B?SUJwSlJqNTJRUE1ZemlZWnZucWY4Z0RLSHNJc1pJenVaTEJSR1o0b1Bvby9v?=
 =?utf-8?B?YmluWVFTMTFaMmFlMjUyQXN3TTFqaHBnMnZOQXlCRVhSWGxxNVl4aGw4eHNU?=
 =?utf-8?B?SnJvNG5vcVdRM0lwY0NXOW1FcjRnY2N2aDhiVlpBcm9UQXNiekxHTzVXTVBS?=
 =?utf-8?B?b2FSSlZoWWg2OHZ4KzhtWHo1bXhpbjZoVFZQWG9QaVp3eWRUelI2K2ptU3ZH?=
 =?utf-8?B?T2lhYW01Y1NCdVZiMXgxVWdmZDhsMUQ1UkFUd3pqOUZKelN1RGd6UW1sK3FF?=
 =?utf-8?B?bUdsRWhEM0dTbGtsREllSmMwdUs4Z2JNZkRzVGwzVHZsMDBoTWZyRjhza2RB?=
 =?utf-8?Q?3dBkgCGfghYSMnAOnXSoJGOfF?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9f1799e2-0414-41af-7fbe-08db70b9ab11
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jun 2023 11:38:14.5678
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: L79W/i3ZFTel1Hgr/qio5TD2e7p3WpHJeAsJqPnFT5Ab9C2DBp8I4GjQhgDU7UOgBYHe8uVMuSyK3uK3Yn8bvQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8685

On 14.06.2023 20:02, Jason Andryuk wrote:
> Falling back from cpufreq=hwp to cpufreq=xen is a more user-friendly
> choice than disabling cpufreq when HWP is not available.  Specifying
> cpufreq=hwp indicates the user wants cpufreq, so, if HWP isn't
> available, it makes sense to give them the cpufreq that can be
> supported.  i.e. I can't see a user only wanting cpufreq=hwp or
> cpufreq=none, but not cpufreq=xen.

I continue to disagree with this, and I'd like to ask for another
maintainer's opinion. To me the described behavior is like getting
pears when having asked for apples. I nevertheless agree that
having said fallback as an option, but I'd see that done by giving
meaning to something like "cpufreq=hwp,xen" (without having checked
whether that doesn't have meaning already, i.e. just to give you an
idea).

> We can't use parse_boolean() since it requires a single name=val string
> and cpufreq_handle_common_option is provided two strings.  Use
> parse_bool() and manual handle no-hwp.
> 
> Write to disable the interrupt - the linux pstate driver does this.  We
> don't use the interrupts, so we can just turn them off.  We aren't ready
> to handle them, so we don't want any.  Unclear if this is necessary.
> SDM says it's default disabled.

Part of this may want to move to the description?

> --- /dev/null
> +++ b/xen/arch/x86/acpi/cpufreq/hwp.c
> @@ -0,0 +1,537 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +/*
> + * hwp.c cpufreq driver to run Intel Hardware P-States (HWP)
> + *
> + * Copyright (C) 2021 Jason Andryuk <jandryuk@gmail.com>
> + */
> +
> +#include <xen/cpumask.h>
> +#include <xen/init.h>
> +#include <xen/param.h>
> +#include <xen/xmalloc.h>
> +#include <asm/io.h>

What do you need this one for?

> +#include <asm/msr.h>
> +#include <acpi/cpufreq/cpufreq.h>
> +
> +static bool __ro_after_init feature_hwp;
> +static bool __ro_after_init feature_hwp_notification;
> +static bool __ro_after_init feature_hwp_activity_window;
> +
> +static bool __ro_after_init feature_hdc;
> +
> +bool __initdata opt_cpufreq_hwp;
> +static bool __ro_after_init opt_cpufreq_hdc = true;
> +
> +union hwp_request
> +{
> +    struct
> +    {
> +        unsigned int min_perf:8;
> +        unsigned int max_perf:8;
> +        unsigned int desired:8;
> +        unsigned int energy_perf:8;
> +        unsigned int activity_window:10;
> +        bool package_control:1;
> +        unsigned int reserved:16;

Better leave this and ...

> +        bool activity_window_valid:1;
> +        bool energy_perf_valid:1;
> +        bool desired_valid:1;
> +        bool max_perf_valid:1;
> +        bool min_perf_valid:1;
> +    };
> +    uint64_t raw;
> +};
> +
> +struct hwp_drv_data
> +{
> +    union
> +    {
> +        uint64_t hwp_caps;
> +        struct
> +        {
> +            unsigned int highest:8;
> +            unsigned int guaranteed:8;
> +            unsigned int most_efficient:8;
> +            unsigned int lowest:8;
> +            unsigned int reserved:32;

... this without a name? Hardware interfaces like this one are, in my
understanding, one of the main applications of unnamed bitfields.

> +        } hw;
> +    };
> +    union hwp_request curr_req;
> +    int ret;
> +    uint16_t activity_window;
> +    uint8_t minimum;
> +    uint8_t maximum;
> +    uint8_t desired;
> +    uint8_t energy_perf;
> +};
> +DEFINE_PER_CPU_READ_MOSTLY(struct hwp_drv_data *, hwp_drv_data);

static?

> +static bool hwp_handle_option(const char *s, const char *end)
> +{
> +    int ret;
> +
> +    if ( strncmp(s, "verbose", 7) == 0 )
> +    {
> +        s += 7;
> +        if ( *s == '=' )
> +        {
> +            s++;
> +            cpufreq_verbose = !!simple_strtoul(s, NULL, 0);
> +
> +            return true;
> +        }
> +
> +        if ( end == NULL ||
> +             (end == s && (*end == '\0' || *end == ',')) )
> +        {
> +            cpufreq_verbose = true;
> +
> +            return true;
> +        }
> +
> +        return false;
> +    }

Would be nice if the handling of "verbose" didn't need duplicating here.
However, if that's unavoidable, did you consider handling this as a
proper boolean instead of the custom way cpufreq_handle_common_option()
also uses?

> +bool __init hwp_available(void)
> +{
> +    unsigned int eax;
> +
> +    if ( !opt_cpufreq_hwp )
> +        return false;
> +
> +    if ( boot_cpu_data.cpuid_level < CPUID_PM_LEAF )
> +    {
> +        hwp_verbose("cpuid_level (%#x) lacks HWP support\n",
> +                    boot_cpu_data.cpuid_level);
> +
> +        return false;
> +    }
> +
> +    if ( boot_cpu_data.cpuid_level < 0x16 )
> +    {
> +        hwp_info("HWP disabled: cpuid_level %#x < 0x16 lacks CPU freq info\n",
> +                 boot_cpu_data.cpuid_level);
> +
> +        return false;
> +    }
> +
> +    eax = cpuid_eax(CPUID_PM_LEAF);
> +
> +    hwp_verbose("%d notify: %d act-window: %d energy-perf: %d pkg-level: %d peci: %d\n",
> +                !!(eax & CPUID6_EAX_HWP),
> +                !!(eax & CPUID6_EAX_HWP_NOTIFICATION),
> +                !!(eax & CPUID6_EAX_HWP_ACTIVITY_WINDOW),
> +                !!(eax & CPUID6_EAX_HWP_ENERGY_PERFORMANCE_PREFERENCE),
> +                !!(eax & CPUID6_EAX_HWP_PACKAGE_LEVEL_REQUEST),
> +                !!(eax & CPUID6_EAX_HWP_PECI));
> +
> +    if ( !(eax & CPUID6_EAX_HWP) )
> +        return false;
> +
> +    if ( !(eax & CPUID6_EAX_HWP_ENERGY_PERFORMANCE_PREFERENCE) )
> +    {
> +        hwp_verbose("disabled: No energy/performance preference available");
> +
> +        return false;
> +    }
> +
> +    feature_hwp                 = eax & CPUID6_EAX_HWP;
> +    feature_hwp_notification    = eax & CPUID6_EAX_HWP_NOTIFICATION;
> +    feature_hwp_activity_window = eax & CPUID6_EAX_HWP_ACTIVITY_WINDOW;
> +    feature_hdc = eax & CPUID6_EAX_HDC;

Would you mind matching this line with the earlier three, padding-wise?

> +    hwp_verbose("Hardware Duty Cycling (HDC) %ssupported%s\n",
> +                feature_hdc ? "" : "not ",
> +                feature_hdc ? opt_cpufreq_hdc ? ", enabled" : ", disabled"
> +                            : "");
> +
> +    hwp_verbose("HW_FEEDBACK %ssupported\n",
> +                (eax & CPUID6_EAX_HW_FEEDBACK) ? "" : "not ");
> +
> +    cpufreq_governor_internal = feature_hwp;

What use is feature_hwp? Already its setting is a little odd (you could
use true there as much as you could here and for the return value below,
because of the earlier CPUID6_EAX_HWP check), and then I haven't been
able to find any further use of the variable.

> +    if ( feature_hwp )
> +        hwp_info("Using HWP for cpufreq\n");
> +
> +    return feature_hwp;
> +}
> +
> +static int hdc_set_pkg_hdc_ctl(unsigned int cpu, bool val)
> +{
> +    uint64_t msr;
> +
> +    if ( rdmsr_safe(MSR_PKG_HDC_CTL, msr) )
> +    {
> +        hwp_err("rdmsr_safe(MSR_PKG_HDC_CTL)\n", cpu);
> +
> +        return -1;

Nit: While blank lines often help, and we even demand them ahead of a
function's main return statement, here and ...

> +    }
> +
> +    if ( val )
> +        msr |= PKG_HDC_CTL_HDC_PKG_ENABLE;
> +    else
> +        msr &= ~PKG_HDC_CTL_HDC_PKG_ENABLE;
> +
> +    if ( wrmsr_safe(MSR_PKG_HDC_CTL, msr) )
> +    {
> +        hwp_err("wrmsr_safe(MSR_PKG_HDC_CTL): %016lx\n", cpu, msr);
> +
> +        return -1;

... here (and then again below) I think they do more harm than good.

> +static void hwp_get_cpu_speeds(struct cpufreq_policy *policy)
> +{
> +    uint32_t base_khz, max_khz, bus_khz, edx;
> +
> +    cpuid(0x16, &base_khz, &max_khz, &bus_khz, &edx);
> +
> +    policy->cpuinfo.perf_freq = base_khz * 1000;
> +    policy->cpuinfo.min_freq = base_khz * 1000;
> +    policy->cpuinfo.max_freq = max_khz * 1000;
> +    policy->min = base_khz * 1000;
> +    policy->max = max_khz * 1000;

What are the consequences (for the driver) when any of the values read
is zero? While I haven't checked in combination with HWP, I know that
CPUs may populate only some of the fields.

> +static void cf_check hwp_init_msrs(void *info)
> +{
> +    struct cpufreq_policy *policy = info;
> +    struct hwp_drv_data *data = this_cpu(hwp_drv_data);
> +    uint64_t val;
> +
> +    /*
> +     * Package level MSR, but we don't have a good idea of packages here, so
> +     * just do it everytime.
> +     */
> +    if ( rdmsr_safe(MSR_PM_ENABLE, val) )
> +    {
> +        hwp_err("rdmsr_safe(MSR_PM_ENABLE)\n", policy->cpu);
> +        data->curr_req.raw = -1;
> +        return;
> +    }
> +
> +    /* Ensure we don't generate interrupts */
> +    if ( feature_hwp_notification )
> +        wrmsr_safe(MSR_HWP_INTERRUPT, 0);
> +
> +    hwp_verbose("CPU%u: MSR_PM_ENABLE: %016lx\n", policy->cpu, val);
> +    if ( !(val & PM_ENABLE_HWP_ENABLE) )
> +    {
> +        val |= PM_ENABLE_HWP_ENABLE;
> +        if ( wrmsr_safe(MSR_PM_ENABLE, val) )
> +        {
> +            hwp_err("wrmsr_safe(MSR_PM_ENABLE, %lx)\n", policy->cpu, val);
> +            data->curr_req.raw = -1;
> +            return;
> +        }
> +    }
> +
> +    if ( rdmsr_safe(MSR_HWP_CAPABILITIES, data->hwp_caps) )
> +    {
> +        hwp_err("rdmsr_safe(MSR_HWP_CAPABILITIES)\n", policy->cpu);
> +        goto error;
> +    }
> +
> +    if ( rdmsr_safe(MSR_HWP_REQUEST, data->curr_req.raw) )
> +    {
> +        hwp_err("rdmsr_safe(MSR_HWP_REQUEST)\n", policy->cpu);

Having seen a number of hwp_err() by now, I think these are confusing:
The format string as seen at call sites doesn't match the number of
arguments. I see two possible solutions to this: Either you demand
that calling functions maintain a "cpu" local variable, and you simply
use that from the macro without passing it as argument. Or you flip
parameters / arguments:

        hwp_err(policy->cpu, "rdmsr_safe(MSR_HWP_REQUEST)\n");

> +        goto error;
> +    }
> +
> +    /*
> +     * Check for APERF/MPERF support in hardware
> +     * also check for boost/turbo support
> +     */
> +    intel_feature_detect(policy);
> +
> +    if ( feature_hdc )
> +    {
> +        if ( hdc_set_pkg_hdc_ctl(policy->cpu, opt_cpufreq_hdc) )
> +            goto error;
> +        if ( hdc_set_pm_ctl1(policy->cpu, opt_cpufreq_hdc) )
> +            goto error;

If either of these fails the very first time through (presumably for the
BSP), wouldn't a better course of action be to clear feature_hdc?

> +    }
> +
> +    hwp_get_cpu_speeds(policy);
> +
> +    return;
> +
> + error:
> +    data->curr_req.raw = -1;
> +    val &= ~PM_ENABLE_HWP_ENABLE;
> +    if ( wrmsr_safe(MSR_PM_ENABLE, val) )
> +        hwp_err("wrmsr_safe(MSR_PM_ENABLE, %lx)\n", policy->cpu, val);
> +
> +    return;
> +}

I think in general we avoid "return" with no value at the end of functions.

> +static void cf_check hwp_write_request(void *info)
> +{
> +    const struct cpufreq_policy *policy = info;
> +    struct hwp_drv_data *data = this_cpu(hwp_drv_data);
> +    union hwp_request hwp_req = data->curr_req;
> +
> +    data->ret = 0;
> +
> +    BUILD_BUG_ON(sizeof(union hwp_request) != sizeof(uint64_t));

Why uint64_t? Generally we try to avoid using types in sizeof() and
alike, and instead refer to applicable variables. I.e. here:

    BUILD_BUG_ON(sizeof(hwp_req) != sizeof(hwp_req.raw));

> +static int cf_check hwp_cpufreq_target(struct cpufreq_policy *policy,
> +                                       unsigned int target_freq,
> +                                       unsigned int relation)
> +{
> +    unsigned int cpu = policy->cpu;
> +    struct hwp_drv_data *data = per_cpu(hwp_drv_data, cpu);
> +    /* Zero everything to ensure reserved bits are zero... */
> +    union hwp_request hwp_req = { .raw = 0 };
> +
> +    /* .. and update from there */
> +    hwp_req.min_perf = data->minimum;
> +    hwp_req.max_perf = data->maximum;
> +    hwp_req.desired = data->desired;
> +    hwp_req.energy_perf = data->energy_perf;
> +    if ( feature_hwp_activity_window )
> +        hwp_req.activity_window = data->activity_window;
> +
> +    if ( hwp_req.raw == data->curr_req.raw )
> +        return 0;
> +
> +    data->curr_req = hwp_req;
> +
> +    hwp_verbose("CPU%u: wrmsr HWP_REQUEST %016lx\n", cpu, hwp_req.raw);
> +    on_selected_cpus(cpumask_of(cpu), hwp_write_request, policy, 1);

Is this at risk of being too verbose when the verbose option as given?

> +    return data->ret;
> +}
> +
> +static int cf_check hwp_cpufreq_cpu_init(struct cpufreq_policy *policy)
> +{
> +    unsigned int cpu = policy->cpu;
> +    struct hwp_drv_data *data;
> +
> +    data = xzalloc(struct hwp_drv_data);
> +    if ( !data )
> +        return -ENOMEM;
> +
> +    if ( cpufreq_opt_governor && strcmp(cpufreq_opt_governor->name,
> +                                        cpufreq_gov_hwp.name) )

Nit: I think this would better be

    if ( cpufreq_opt_governor &&
         strcmp(cpufreq_opt_governor->name, cpufreq_gov_hwp.name) )

> +        printk(XENLOG_WARNING
> +               "HWP: governor \"%s\" is incompatible with hwp. Using default \"%s\"\n",
> +               cpufreq_opt_governor->name, cpufreq_gov_hwp.name);
> +    policy->governor = &cpufreq_gov_hwp;
> +
> +    per_cpu(hwp_drv_data, cpu) = data;
> +
> +    on_selected_cpus(cpumask_of(cpu), hwp_init_msrs, policy, 1);
> +
> +    if ( data->curr_req.raw == -1 )
> +    {
> +        hwp_err("Could not initialize HWP properly\n", cpu);
> +        XFREE(per_cpu(hwp_drv_data, cpu));

Is this completely safe even in the CPU online/hotplug case? It would
seem better to me to go this way:

        per_cpu(hwp_drv_data, cpu) = NULL;
        xfree(data);

Or even defer publishing "data" ...

> +        return -ENODEV;
> +    }
> +
> +    data->minimum = data->curr_req.min_perf;
> +    data->maximum = data->curr_req.max_perf;
> +    data->desired = data->curr_req.desired;
> +    data->energy_perf = data->curr_req.energy_perf;
> +    data->activity_window = data->curr_req.activity_window;

... until after it was fully populated. (But I seem to vaguely recall
that you need to use the field somewhere in the init process.)

> +    hwp_verbose("CPU%u: HWP_CAPABILITIES: %016lx\n", cpu, data->hwp_caps);

Isn't this expected (or even required) to be the same on all CPUs? If
so, no need to log every time.

> +static int cf_check hwp_cpufreq_cpu_exit(struct cpufreq_policy *policy)
> +{
> +    XFREE(per_cpu(hwp_drv_data, policy->cpu));

Same remark as above, primarily because this is also used on an error
path.

> +/*
> + * The SDM reads like turbo should be disabled with MSR_IA32_PERF_CTL and
> + * PERF_CTL_TURBO_DISENGAGE, but that does not seem to actually work, at least
> + * with my HWP testing.  MSR_MISC_ENABLE and MISC_ENABLE_TURBO_DISENGAGE
> + * is what Linux uses and seems to work.
> + */

"my testing" imo wants replacing here by saying what hardware was tested
(not who did the testing).

> +static int cf_check hwp_cpufreq_update(int cpuid, struct cpufreq_policy *policy)
> +{
> +    struct hwp_drv_data *data = per_cpu(hwp_drv_data, cpuid);
> +    on_selected_cpus(cpumask_of(cpuid), hwp_set_misc_turbo, policy, 1);

Nit: Blank line please between declaration(s) and statement(s). Or
alternatively drop the local variable ltogether, as it's used ...

> +    return data->ret;

... just once here.

> +}
> +
> +static const struct cpufreq_driver __initconstrel hwp_cpufreq_driver =

Seeing __initconstrel here, just as a remark (not a request for you
to do anything): I think we want to finish conversion to altcall, such
that these can all become __initconst_cf_clobber.

> --- a/xen/drivers/cpufreq/cpufreq.c
> +++ b/xen/drivers/cpufreq/cpufreq.c
> @@ -97,6 +97,15 @@ static int __init cf_check setup_cpufreq_option(const char *str)
>              return cpufreq_cmdline_parse(arg + 1);
>      }
>  
> +    if ( choice < 0 && !cmdline_strcmp(str, "hwp") )
> +    {
> +        xen_processor_pmbits |= XEN_PROCESSOR_PM_PX;
> +        cpufreq_controller = FREQCTL_xen;
> +        opt_cpufreq_hwp = true;
> +        if ( *arg && *(arg + 1) )

A pretty unusual way of writing arg[1].

> --- a/xen/include/acpi/cpufreq/cpufreq.h
> +++ b/xen/include/acpi/cpufreq/cpufreq.h
> @@ -246,4 +246,7 @@ void cpufreq_dbs_timer_resume(void);
>  
>  void intel_feature_detect(struct cpufreq_policy *policy);
>  
> +extern bool __initdata opt_cpufreq_hwp;

No __initdata or alike on declarations please. Section placement
attributes (among others) only belong on the definition.

> --- a/xen/include/acpi/cpufreq/processor_perf.h
> +++ b/xen/include/acpi/cpufreq/processor_perf.h
> @@ -7,6 +7,9 @@
>  
>  #define XEN_PX_INIT 0x80000000
>  
> +bool hwp_available(void);
> +int hwp_register_driver(void);
> +
>  int powernow_cpufreq_init(void);
>  unsigned int powernow_register_driver(void);
>  unsigned int get_measured_perf(unsigned int cpu, unsigned int flag);

The existing split between what lives in which header is pretty
arbitrary from all I can tell. Is there a particular reason you can't
keep together the four declarations you add?

> --- a/xen/include/public/sysctl.h
> +++ b/xen/include/public/sysctl.h
> @@ -296,6 +296,7 @@ struct xen_ondemand {
>      uint32_t up_threshold;
>  };
>  
> +#define XEN_HWP_DRIVER "hwp"

I think this wants some addition to the identifier which makes it expected
that the expansion is a string literal. Perhaps XEN_HWP_DRIVER_NAME?

>  /*

Nit: There also wants to be a blank line between #define and comment.

Jan

