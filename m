Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C3F92450345
	for <lists+xen-devel@lfdr.de>; Mon, 15 Nov 2021 12:17:59 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.225788.389991 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mmZzM-0000sQ-Ao; Mon, 15 Nov 2021 11:17:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 225788.389991; Mon, 15 Nov 2021 11:17:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mmZzM-0000pX-70; Mon, 15 Nov 2021 11:17:28 +0000
Received: by outflank-mailman (input) for mailman id 225788;
 Mon, 15 Nov 2021 11:17:26 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=uxYG=QC=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1mmZzK-0000pP-N6
 for xen-devel@lists.xenproject.org; Mon, 15 Nov 2021 11:17:26 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9c805e68-4605-11ec-a9d2-d9f7a1cc8784;
 Mon, 15 Nov 2021 12:17:25 +0100 (CET)
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04lp2056.outbound.protection.outlook.com [104.47.14.56]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-38-0YXHJMKXM4C7K-FAksd0uw-1; Mon, 15 Nov 2021 12:17:24 +0100
Received: from AM0PR04MB5587.eurprd04.prod.outlook.com (2603:10a6:208:125::12)
 by AM9PR04MB7699.eurprd04.prod.outlook.com (2603:10a6:20b:284::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4690.15; Mon, 15 Nov
 2021 11:17:23 +0000
Received: from AM0PR04MB5587.eurprd04.prod.outlook.com
 ([fe80::387b:e76e:f981:f670]) by AM0PR04MB5587.eurprd04.prod.outlook.com
 ([fe80::387b:e76e:f981:f670%7]) with mapi id 15.20.4690.027; Mon, 15 Nov 2021
 11:17:23 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AM5PR1001CA0056.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:206:15::33) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4690.15 via Frontend
 Transport; Mon, 15 Nov 2021 11:17:23 +0000
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
X-Inumbo-ID: 9c805e68-4605-11ec-a9d2-d9f7a1cc8784
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1636975045;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ZJW83aJbUaqBjmdn56EQqm/Dr1O1eulsphlMqmmf6dc=;
	b=LoHGyxyHF45PSsVAyUSKORpBDFUy7CarWLP5EtXBLccjP/d2/ijuo7h3prFEWqXombp/i2
	2ICvRa6l/YWQ0KEEGZUbxEfuTz8kveRz4mfWrUQs/flJpBr0h3pI5dDcIKSTQXr0rWO46+
	jzXweAFJSdY2pptLsEt6Mna0eq2KZ+M=
X-MC-Unique: 0YXHJMKXM4C7K-FAksd0uw-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PLHsaQskDkxjIcjP/uisBHTccgICPav05vU/aLLqBmANHDwRJT2CkvrHPl/lU/mHqXzS14yRWEiUpObfC53QMWlVd7mMwP2Hm4bOIGWq0cJoqV2EM19MWjcCCOnorw0Pt5GJpYrFqYBQ0qi4TIC4b70SmvCqh6mlFpwTicSYORStvTAfH+O2pGd8ojSMaWMn4XgP3pzgEfhvjqpJhDZCewGPjzQ3xEjT9gp3/mkl8gYB8w0mMztXq96YAPW/9MZbCFbFljPjcyo0XG5e6JbiPS+nr+6N4cw9bXG5SnawNnnwnc6cwhAZyg3l5/P4ZFoi5an71NVrRFrp93LwnDrO1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZJW83aJbUaqBjmdn56EQqm/Dr1O1eulsphlMqmmf6dc=;
 b=i0j4bvUnXXAWF50ZxhpNmZVp1xx2VSKpZTz2rhGL6Y0cVCIAPfi6bEMpP+akZeZF0wl/jFy83ccVzNL5aleMOFYXQQ7I8c1rkdn3N/HPeZnc7YMcCjTgaWAxqr+xWNgVx0hRFf/zfgobPYRNNsjIu0um0i0yWk5mDvC9PJ0gc8iU9Re88dML9S2J6HECIoJ4/JreKTQAdO1uheNwYiVpRD/517zWKTWo0baL55ITcGIxoOjmn/UEbeBsc8k6J+EP2ypkVGhasz1whCENAuVIxRvdslo6P9K3MLbC2yp/8c4vkR7boEJdVkeor/JOiks5HqNg7s9KRAKLTDHu2cywcw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <b0bdf368-36ad-a282-b22a-19702de75672@suse.com>
Date: Mon, 15 Nov 2021 12:17:23 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH 1/3] x86/cpufreq: Clean up powernow registration
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20211112182818.30223-1-andrew.cooper3@citrix.com>
 <20211112182818.30223-2-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20211112182818.30223-2-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM5PR1001CA0056.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:206:15::33) To AM0PR04MB5587.eurprd04.prod.outlook.com
 (2603:10a6:208:125::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b7fb1eb0-2c60-42af-e14d-08d9a8297f46
X-MS-TrafficTypeDiagnostic: AM9PR04MB7699:
X-Microsoft-Antispam-PRVS:
	<AM9PR04MB7699D50961F0147411BFA3C9B3989@AM9PR04MB7699.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	kfE+cWJwfoUO4s4xv+uqz3ZkCCn74hfl4g+v2VwHt8vXbxETULjZOaS5vNpUs6leUVoBW/WDxMi2tSf0n736qsZoYp6X23rFs1cMc62eL81oRDDmqokoKZrWfyMvu597W2wbZSLeM4oXkxlhAoL4uadh/eHZtkH3ktU9mQF3DV+dcjktrrGNnQSFLUdcA/nFaI9xbmYXpyhQ6Izu+PmaxLu0Kh9lECQiKRJ3REKd/VMLNlXdVAWBn1IRcHUkqSBQoRgXViLt57ISVs2drAhPrzdguEC54tjrc/I8/0DXxn6AymKfk1xXZKJrT/syJMpFrfju4mVDp51hJfaBccRoox8jZxZy5j4/qUVgk5mUvE0apS/b+ukrpONbH2e+gta793914tOcabgw7HNI8ytOx5TS0HZMosvQ36S1a9g/N3a+EPPypuLBmRWev04hTCrlmp/kUwzi8bm6OvmsQIxtSonPwUWTEaGyXv42jnZeYGbCn4Njy3R00rKDXY/WSWnAtKJseL169dm0lX92+daNYzCtaZvoHhn6QFHxVZBQBk4wGzcfWcWL1o1SJ13QKXO08uYuuUgr6UTQLgpGzvx+1saZchoPN1o/sMi4gD/0+6BAdDQ1yFYUKb4iUmGtqEss6J/HB1v+E1nQzJ8Z5LVH1YaOsBQHrLmmgq6QYXLhZvJM7qlNUSOxIUGTg8dpQ/SW9rOK0Mqwh4lmPYU11DCAJkdrrbkyyijZHKD3I2jNI3nVRKkdlaCUwAqefl9yVuyW
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR04MB5587.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(31686004)(86362001)(54906003)(16576012)(2906002)(316002)(4326008)(66946007)(5660300002)(83380400001)(66556008)(66476007)(508600001)(53546011)(6916009)(6486002)(36756003)(38100700002)(2616005)(956004)(31696002)(186003)(8676002)(8936002)(26005)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?S0FMa0tWUGkxQ3gxWXQ2aHhMZU1lWkt3NmtUajQyekpoTnMxRE5kVnRUbW9m?=
 =?utf-8?B?K296a20wSkFMWnJ1L21WS0QyY0c5NnBKNXhrYjRTRTdnblI5a2NiTnVTaHEr?=
 =?utf-8?B?RDQrWWpsbGNmUHl1Qm8zUzlheXc5SHdkUE9NbXN0MnJza3lrS2lrN3p4aVhr?=
 =?utf-8?B?RmYvUkRnRm5HYU1QS0ZrN21SVm9LYVVSU09HYnVhSVZuNEVQU1hOWkZtUEdJ?=
 =?utf-8?B?N1Y2NFNIUlpTRlhXQ3pNcGMrbkFBK3E1TnRnMU0zR2g1NkxVc2FmYUlkTExX?=
 =?utf-8?B?Sk9oazU3U1dicFJ5SytIUFdpRm5SYWg0Z2pIQjdlRi9xL1YwdFcybzM1Skh3?=
 =?utf-8?B?SmJQcEoyNTJxY2M3K0NQaVRYSkl6dDRON3dELzBiRHhJWDdHcXZJVld6bnBO?=
 =?utf-8?B?cGdhQ0VXNnBicXlRdm1ybE4rTTZSTGNsODFaRWJjV1dvQzloV3p2MVp6dnRB?=
 =?utf-8?B?Wm52bVFVa29WalBNZUZjUi9QcFpmeFJ0aVRpTGNxWkJXYzZKYVhCVm9vUkVE?=
 =?utf-8?B?akZrbDFwWUFnRUh6OEpZb0hmK0JHQXZMbVFEZ3dqdHZMME9SYVpmMDUyWFp2?=
 =?utf-8?B?aEYrUG01cDlXL1BUZmlVaVF1N3VVNXRjMXhDVUF1OUt6S1U0TmJtTXpuZ2tm?=
 =?utf-8?B?R2JQb1NZZHNrUjIzR3JKeHlvYTRIUVFRaXprZHh3MGg0SGNUMituL2dXaFRO?=
 =?utf-8?B?Z0kzSWhEeWZabnBiRjA1QnNwb1FGVTVWN2haYmc5elZmTXpwMk1tNzJ3WHdD?=
 =?utf-8?B?Sy92YUV0MzArbzY1dHBOaWhCeWtpWjlrQ2ZVQkQ3dTNlMjh0dzJDUks0eWUw?=
 =?utf-8?B?dFFhQTRBRVpFazBKaDdVWHpjNEJmVmRNazlzTWl3SkhzbnBwdmFXUlJjMlgy?=
 =?utf-8?B?cHVoS1VvNytNS3R6Snc4RnVFejlpRzRGeGFrM0dqNGFlMHY3Q3JlTFkzYWMy?=
 =?utf-8?B?QzBqcjJNVE95Q3ZEZGV1RnNSN2FNUkFJRExLY3A5QmplOUNMYXd2VmpQZDVD?=
 =?utf-8?B?M1M0elRYNnhYOEZWL2lXbHF0Sm0xRHgwTVZ0UVJzVFlLNE14NXJ5ZjBQUkd1?=
 =?utf-8?B?dVdCT3hvS1BsQ3lqYWluYWsvL0tFUEl5ZXVPTGpnVW5YL3Q0Z2twdHZYUkx4?=
 =?utf-8?B?S2pIVG80aFdPWi9zNjNDcjFkendQdi92UldIU2ZPUDdmVkJpemJ6QUlKYXQ1?=
 =?utf-8?B?U0VGK0lqT044NmFBSmNheFNtNk5zWGN5TXJlQXpjYTBneVhNQldwcEtSM0h3?=
 =?utf-8?B?Y3o0S0piOWxIM3E1dUpTRmlUbnZBNVZvdHVUYWZUcnFHeEIxVlBLcXRBeWNT?=
 =?utf-8?B?Qkx0cUJxV2NzelJOdHJ4Z09TQ3djTUJ1ekZnSCsxVDBWNDJIUHdJYzgwRWd2?=
 =?utf-8?B?TXVqSkpxYVlpZitEZGxvNjUrWjNGMVNsdWl2SkpxTXVEcytGTGVJRjZJT3N4?=
 =?utf-8?B?RzBYV0wvMnl3cWZZR1c5S1BiWnlJajZnTHpwOUc3a1BBL1A3aWlTK0wwbUFk?=
 =?utf-8?B?ZFc0S203R0NoVEd2eWZPejhxWEdnUVE3S2ZiQU5MSzR0Z0ZpU2VvaFRvV043?=
 =?utf-8?B?VEJaMng5ZG02c0lMWHp1M24zNGFuMTZBMFlJQUxGNUtwK3VnZFB5cXBpK0RI?=
 =?utf-8?B?Q3BoaG9DYzY4QXZIc1ZBMFZrWmtmS3FSOTFyRUFQYWdNenZ2bGcwaVJOcVNx?=
 =?utf-8?B?cjRDM24wUjgyc29JUFVkc1VuTkpMRjMxNFBabnVYcjRQaEVaUGcrU3pZWlg5?=
 =?utf-8?B?b1JHNHlOOGZ3VVgxQ1BzZjAxNStnenZmY1kvc0hGU0xMWHo0cFFXeWhqa1Y1?=
 =?utf-8?B?MW1xZ1JzamNjRmpKajFMVnJGKzR4dzdrUlE4VnEzUU0rZjJlNEVray9TNzQw?=
 =?utf-8?B?NmlzaTJCeEZVd2VFOHdRQi93bjhyUzQzNDNHRm05WGQ3SVVpSEZrSzBKRlFr?=
 =?utf-8?B?enRIcGxKbmJXck9mZTRjdWpDd3lkY3dtaFhuN0tMYld5MmUrRXlwNTVlT2JW?=
 =?utf-8?B?bFFxWWZManozN01ydWV1ZWtYRUVCb1VBR0pwNkljbXZVN2lTaVVEUVVzdjNI?=
 =?utf-8?B?a2N5L2x0TFBDQU5ZWGlWNFArZFRqK01iUDJRN3BjMFZhQWgvNE1BVGM5ekVK?=
 =?utf-8?B?T05WdnN4ejFFMHR4cEk2OTMwaUZYRnFxUS95OGJGNTJEMzMxUm54K3phYkRJ?=
 =?utf-8?Q?95JgVXNHR7dg9++izYWffUY=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b7fb1eb0-2c60-42af-e14d-08d9a8297f46
X-MS-Exchange-CrossTenant-AuthSource: AM0PR04MB5587.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Nov 2021 11:17:23.3022
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cK7F1h/N9Se02zFV3RvRO2kG7rkR7LlUEqtQSn4OSUg1ufCyfkIeFuHkpKRC0Mk5k+y7rumlv2EWIGvVH2OJrg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB7699

On 12.11.2021 19:28, Andrew Cooper wrote:
> --- a/xen/arch/x86/acpi/cpufreq/cpufreq.c
> +++ b/xen/arch/x86/acpi/cpufreq/cpufreq.c
> @@ -640,13 +640,19 @@ static int __init cpufreq_driver_init(void)
>  {
>      int ret = 0;
>  
> -    if ((cpufreq_controller == FREQCTL_xen) &&
> -        (boot_cpu_data.x86_vendor == X86_VENDOR_INTEL))
> -        ret = cpufreq_register_driver(&acpi_cpufreq_driver);
> -    else if ((cpufreq_controller == FREQCTL_xen) &&
> -        (boot_cpu_data.x86_vendor &
> -         (X86_VENDOR_AMD | X86_VENDOR_HYGON)))
> -        ret = powernow_register_driver();
> +    if ( cpufreq_controller == FREQCTL_xen )
> +    {
> +        switch ( boot_cpu_data.x86_vendor )
> +        {
> +        case X86_VENDOR_INTEL:
> +            ret = cpufreq_register_driver(&acpi_cpufreq_driver);
> +            break;

I've been wondering why we continue to tie this to Intel. I don't
think there's much Intel specific in the ACPI driver, so I wonder
whether this shouldn't use "default:" instead. But I can agree
that's likely better to be done in a separate change.

> @@ -353,25 +349,13 @@ static const struct cpufreq_driver __initconstrel powernow_cpufreq_driver = {
>      .update = powernow_cpufreq_update
>  };
>  
> -unsigned int __init powernow_register_driver()
> +unsigned int __init powernow_register_driver(void)
>  {
> -    unsigned int i, ret = 0;
> +    if ( !(boot_cpu_data.x86_vendor & (X86_VENDOR_AMD | X86_VENDOR_HYGON)) )
> +        return -ENODEV;

Ideally with this dropped (and of course with the issue pointed
out by Roger taken care of)

Acked-by: Jan Beulich <jbeulich@suse.com>

Jan


