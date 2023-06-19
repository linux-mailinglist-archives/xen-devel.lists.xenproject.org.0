Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F6CC73597A
	for <lists+xen-devel@lfdr.de>; Mon, 19 Jun 2023 16:25:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.551135.860492 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qBFnj-0001zS-G1; Mon, 19 Jun 2023 14:24:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 551135.860492; Mon, 19 Jun 2023 14:24:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qBFnj-0001wu-DA; Mon, 19 Jun 2023 14:24:15 +0000
Received: by outflank-mailman (input) for mailman id 551135;
 Mon, 19 Jun 2023 14:24:13 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Jerb=CH=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qBFnh-0001wY-7Q
 for xen-devel@lists.xenproject.org; Mon, 19 Jun 2023 14:24:13 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on2061f.outbound.protection.outlook.com
 [2a01:111:f400:7e1b::61f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f5830b97-0eac-11ee-b234-6b7b168915f2;
 Mon, 19 Jun 2023 16:24:11 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM8PR04MB7858.eurprd04.prod.outlook.com (2603:10a6:20b:237::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6500.36; Mon, 19 Jun
 2023 14:24:08 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e442:306f:7711:e24c]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e442:306f:7711:e24c%5]) with mapi id 15.20.6500.031; Mon, 19 Jun 2023
 14:24:08 +0000
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
X-Inumbo-ID: f5830b97-0eac-11ee-b234-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RrmrC4d3K3jqkYazA5EnTP7urMStpngsaJYWVMfsAvGxP5tp8Iy6tgitZInVMG44tepAXMoL5ONySbPefp6XOpL/9QJhPWTbDgz21huRnDZBF49UJoG1jzQgm1NXBUr9HwBUwDjycXYR8yjmP0dFsh6LJMq03H0KcXLQRvoSkiSZrcwFPN5T3DZcdM1M6wk33JhlZ2W4WtcuxLBLe5rZHHTW78FAnBEVXaRDxnSx9/m0iNbhx83ShAwTlnntAqcPEDDkmzCCs5XSNrN3/IA/JvzhWcSZvCWh6SmgMnON+MuIgxGsgJa0v2cyuGiphnnNS3a6zBib8uAm6y6lE/71vw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qT40wJLYp3ezauBE8MN5z89mZSNmTTiea66kSv/E8tg=;
 b=OjZdVXAIW/QTfdWJkMK+seyCe5MHEwFp2O0fH2UAkLZn7dRl8VP3AWA6Io2GTCFe2otnjCWv1zSBqD3OlVLaCx+ONMU77eCmUemj0te1Udm/YfbdNPiyEgTtOiDwYUGBn68k/KBduxvQKGbleRUDpqaaLsViLyIG5rq9gS4ij2X6zmwk76XYxQxjHcc9EGyJijYjXOsGyhrFkB8loWATIHnJxoP+idd2PfwmQJLb/L4OegZUHNlTjCrAllVkzwZq9V1k0V6rAKNhFdUoOAIpTq2yJXv0ThTXR3KBXTX/PeY+a/j72gRz8SbgALRJn/2Mpf7c8D7LZ7/ojgHUU8NOJg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qT40wJLYp3ezauBE8MN5z89mZSNmTTiea66kSv/E8tg=;
 b=YsEOGhSPrUPw5eLaS2MsP6grI1IEQ2svzXf3TBs2T/jR5pRX+UX/2qFPEoFPnaYFpdyXmMjjFanNV1hboct9BRr7jZ3TN7+ZyhaanQ183tfqo06p2i/Y2LQI13bwX+4LKHpEsvaEoQIExW9gMoINFFjxQxiw+C5Hd0++fETmIIOCm+8kxKHgKmYUlWgXm2oFhVcwVe+9uWAOl6EsQR0v4QO4z50ycLiM4SG+K/UZ/Ur994Q30OiVhdHoHXNtBG1rQ0+k/HRT/piWmXPGnFlQ2NeNZIWUnV7kIaRsVt5QLnZ84JQbmibkE0uWUMXOx8cBNAGsaEtRQ7mG2auo9TuDBA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <791bf505-7335-d16d-617d-ec19dc637ea6@suse.com>
Date: Mon, 19 Jun 2023 16:24:09 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v4 09/15] cpufreq: Export HWP parameters to userspace as
 CPPC
Content-Language: en-US
To: Jason Andryuk <jandryuk@gmail.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, George Dunlap <george.dunlap@citrix.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 xen-devel@lists.xenproject.org
References: <20230614180253.89958-1-jandryuk@gmail.com>
 <20230614180253.89958-10-jandryuk@gmail.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20230614180253.89958-10-jandryuk@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0153.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a2::11) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AM8PR04MB7858:EE_
X-MS-Office365-Filtering-Correlation-Id: 5aa92702-befe-4616-23ab-08db70d0d7aa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	WG8hGkMfUpNlHlE4wBZyA8z2CUCjxJQW6NKDNxeHXGE+GvrB0lCOJmWbKiTnN3DlErnFrg7gKY6kVDvIIU8kwYr1Y/A69ARhGaOncMGVeK67Eir7kYPVgqAqXaHehzDh4aMvjQV4xmvjc/8FVngTBx9mSLY0rA/tXRPOmhfCqW+QupIl4cOhOeeL5+D6lirQZhv0u9F2X66X6aDa6X3rvVXof2pD/1zIuKHJJXq1fx7ooNvXpPFPUUkPrwOvu2zJ9T5VE0TH9dDnEFj+HS0QkuF4rV6L/nZTRRUyKzT5RnPYLZh0l2EHqGYHiIROmoS3I2kH0TuUyyfbl0AKnW0DSpAqkMCDr0SOFOSSabsMlZJQcx7MCh6qJ1HXFBvkoJ+Bzaz4xlz/Sid1zLPy67szXQFS1yxIomEnf66hLsI4hCbo4TpUoMyvOO37wSGCKH6TPAlbCy/7X+XWikqy7y1Zpu+a0T+Cq7WbMAiP0mlompns6gLSVvpXrc1ZKRuuPv4xmwbVM3OD84C+QaLIUnNtQlej1dj4JT6x5v8Ss9emOkHvEZmhcvzpUytoDauC+CnKcNIPFm4q0JdPnMh0J+n0DYZm1+d6PAcsyaL2p6zasn+IRI4F5EozVqQNQu8U09X6GPfmwrK42fBQmwMYRv3GJA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(396003)(376002)(346002)(366004)(39860400002)(136003)(451199021)(86362001)(31696002)(41300700001)(8676002)(8936002)(5660300002)(66556008)(66476007)(66946007)(316002)(6916009)(31686004)(2616005)(38100700002)(83380400001)(186003)(36756003)(26005)(6512007)(6486002)(6506007)(53546011)(478600001)(4326008)(54906003)(2906002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bmc0Si9hZmd2VlZCNmViMHh1Q3pYK0N5bjBGTEV0ZnN2bUNHUDJVR3oxNjA5?=
 =?utf-8?B?NlRXQS9WVUtnQUZVSzBrZ0tZTWwyVVk5cjZpWDVBRmZsaGprYU96V1Jqc1Fw?=
 =?utf-8?B?RFZ6WTM1MEtWdzU3RzV3MFlCbGcwM3ZLVFlSekdiYWFGTWpiVHkzbjVva0NR?=
 =?utf-8?B?dFgvRURBR05jYW5TYWk3WmRGVjd1c1hHdU4yYjBhcVhrRXFzOTNndW5XMjQr?=
 =?utf-8?B?U0Y1VHFuSm41aTBBTThPQXFEZUxWMTNJYVpQUTNGRkxEdmt0cnNRV09ibmlH?=
 =?utf-8?B?N2RjSTBkc0NBTmRjZ0F5MzA5cFpBdFdtRXNvMzRMS0xxbU52QUVXT3VaeS9F?=
 =?utf-8?B?aWxtN2k1MzlSZGgvTGxnSjluY3l1RGRFeXBMUFU3Rkw3TW81Sndub1kySlV3?=
 =?utf-8?B?TmRZd3daUWxMendBbFFjM3hCeWk4L0xhL0Q3alhEWFpuTEVMaTVzai9JMG5P?=
 =?utf-8?B?RFNTa2Z3SlczYVBIWWRSZFVWUm9ZdkN2eGE1ajBoRXg3dW53aHloalJJQ0wv?=
 =?utf-8?B?cWlZcUg3a0U1dzIydjhLUUl3NHptTEZlTnQvMndLdmJiVlBzcFlzSDhJSkh3?=
 =?utf-8?B?MVlRcmFEa2FibWpvT3BjWTQxdU0xbER4N0ZMY3VnMXU4Y3o1WXIxU1pxVFpl?=
 =?utf-8?B?QjRZaVRlZEljZkxkUEh2SHRBMGRZdUN3UFE5SWliYlZrSldyWlc4bnNieUNQ?=
 =?utf-8?B?ZWNkU0R2RUZiVWg0WmVQdE13RzE5YVl5L0ZIcGtYQ0pFNnhIYVYySDhIc29a?=
 =?utf-8?B?ZHNjc0FPVnVMVk5XMncveTBGOUV6MFFZMTkvRllXeCtlamZXTnk4UU4rQ29q?=
 =?utf-8?B?eW03VFZYVnBJU2NGSHRZWFNYZWs3K0d0eFR5dGdQMERPaGRoMy92cWhHd3dj?=
 =?utf-8?B?SkMvRUJCckJCcTZQV2hENm4zSWlwVHorKzN1OWM1MTZIeGhtTFNqUC9DdVR2?=
 =?utf-8?B?ak1mMzgrN3hPSS8zeTQ5L3FnbXNOSjRpa0FsSlIyamROSllRZG9FbmZ6bmli?=
 =?utf-8?B?QnJUZmw0UG1OVUlIMDRzZ2VRTUxRdkdsQ29UQ1NDVldMb1g3T2MrYUlFNzBk?=
 =?utf-8?B?aTdGbTNYcHRzblh5WThtTCt5WUtYOVVmc0VoeEREUnA2TzFGRVpVa1pxK2xz?=
 =?utf-8?B?TnlaSGxEZURvMEJsVzJVTXI5MWFNbVBEUXhOK0tBaUNGQ0FIdDNvemxoWUVN?=
 =?utf-8?B?bzBGYzdMelZ0V1hDYlhXT3lNdEMyNWJwaTErQjRYUGpXOUFCOTUyOThML1lu?=
 =?utf-8?B?bzNzVGVqVC9zSmVFQzdrQ20yQmEvR2crclk3KzgvUmZDaHMzQVRzWFIwVmZz?=
 =?utf-8?B?RFU0QW9NLzJ4WEJiaENGQ0hiNGJQTmNQRzNpTm12SXFDUi9QU3VDdjhHMjU5?=
 =?utf-8?B?RzRaK21uMDdIeFBKRmpaUWR3MisyeG96T1JPSGxwNUJyY0NPaFQzZWVHTlcy?=
 =?utf-8?B?NE1rekRTb2tHSWFqT2lrNlJkVHdsN1UvSCt1ajFpYUthaEpKTDNmYkZWc0ZR?=
 =?utf-8?B?TzIvbjZ3bXRuS015V2loSTRKQ0RJai9GMWtvUTUzR3lrYW5CeVRKMjY5SzlL?=
 =?utf-8?B?N05qSkNnbTREeUc3K2hpNmNPdzMwTkhaOVVqenNxalVINVRkREg3eEZaNm5h?=
 =?utf-8?B?VlhYU0dQQmRJUHpNMUgrNnBpWlRlZWJtWXNpVGJreFp0eHh1Y2lHR2p6azFN?=
 =?utf-8?B?S21XbU5lRTZITm9kWVhORmdVUEt5SGV0NitUaVFJZ1EwOVdFdnRia1VZVjNE?=
 =?utf-8?B?RHBhVWllemI3NGZZSG5wN3VZeUkycWNxQ0kybWxLTWxQcWM0bVJNNTB3RlJn?=
 =?utf-8?B?MGlBbFMwS1NJdlcxemQ4eSt1N2FLUHIrNHl0N2hQVVptVndnekNxdG5xYmZm?=
 =?utf-8?B?TDdNTEFpVjI5OGlQU0VqYmc1Z3BOMWdlejdVTncxR3JGZDZ6MHcxWlJtMCtY?=
 =?utf-8?B?SnZQVzNFeXdXcXRERlFTTHEwMTJ4TE82c095bE1MNXRJYWpyK25ZdkRtbnJM?=
 =?utf-8?B?THRsQks5UUhYaThYalBZdXN5azR1STBabjg5V2hEbyt2a1RIUXVHendqcUNj?=
 =?utf-8?B?YmpSaW1CVTRVR212NGZtcTFIQUJ4NHVXQjN0SGRBRjcwRnZXYlAwS2k0eTVT?=
 =?utf-8?Q?nWcMzSbOxwP12RW7fUoUujTZB?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5aa92702-befe-4616-23ab-08db70d0d7aa
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jun 2023 14:24:07.7867
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SIoEoPpMmc0mfulgXQwzCRJHlnzI9qzU3oRb+ECYoACCRy88+CyUb6jw69NtfMHBqXr7lGQiiTeYq31o5bgotw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR04MB7858

On 14.06.2023 20:02, Jason Andryuk wrote:
> --- a/xen/arch/x86/acpi/cpufreq/hwp.c
> +++ b/xen/arch/x86/acpi/cpufreq/hwp.c
> @@ -537,6 +537,29 @@ static const struct cpufreq_driver __initconstrel hwp_cpufreq_driver =
>      .update = hwp_cpufreq_update,
>  };
>  
> +int get_hwp_para(const unsigned int cpu,
> +                 struct xen_cppc_para *cppc_para)
> +{
> +    const struct hwp_drv_data *data = per_cpu(hwp_drv_data, cpu);
> +
> +    if ( data == NULL )
> +        return -EINVAL;

Maybe better -ENODATA in this case?

> --- a/xen/drivers/acpi/pmstat.c
> +++ b/xen/drivers/acpi/pmstat.c
> @@ -251,48 +251,54 @@ static int get_cpufreq_para(struct xen_sysctl_pm_op *op)
>      else
>          strlcpy(op->u.get_para.scaling_driver, "Unknown", CPUFREQ_NAME_LEN);
>  
> -    if ( !(scaling_available_governors =
> -           xzalloc_array(char, gov_num * CPUFREQ_NAME_LEN)) )
> -        return -ENOMEM;
> -    if ( (ret = read_scaling_available_governors(
> -                    scaling_available_governors,
> -                    gov_num * CPUFREQ_NAME_LEN * sizeof(char))) )
> +    if ( !strncasecmp(op->u.get_para.scaling_driver, XEN_HWP_DRIVER,
> +                      CPUFREQ_NAME_LEN) )

Mind me asking why you think case-insensitive compare is appropriate here?

> +        ret = get_hwp_para(policy->cpu, &op->u.get_para.u.cppc_para);
> +    else
>      {
> +        if ( !(scaling_available_governors =
> +               xzalloc_array(char, gov_num * CPUFREQ_NAME_LEN)) )
> +            return -ENOMEM;
> +        if ( (ret = read_scaling_available_governors(
> +                        scaling_available_governors,
> +                        gov_num * CPUFREQ_NAME_LEN * sizeof(char))) )

I realize you only re-indent this, but since you need to touch it anyway,
may I suggest to also switch to siezof(*scaling_available_governors)?

> +        {
> +            xfree(scaling_available_governors);
> +            return ret;
> +        }
> +        ret = copy_to_guest(op->u.get_para.scaling_available_governors,
> +                    scaling_available_governors, gov_num * CPUFREQ_NAME_LEN);

Similarly here: Please adjust indentation while you touch this code.

>          xfree(scaling_available_governors);
> -        return ret;
> -    }
> -    ret = copy_to_guest(op->u.get_para.scaling_available_governors,
> -                scaling_available_governors, gov_num * CPUFREQ_NAME_LEN);
> -    xfree(scaling_available_governors);
> -    if ( ret )
> -        return ret;
> +        if ( ret )
> +            return ret;
>  
> -    op->u.get_para.u.s.scaling_cur_freq = policy->cur;
> -    op->u.get_para.u.s.scaling_max_freq = policy->max;
> -    op->u.get_para.u.s.scaling_min_freq = policy->min;
> +        op->u.get_para.u.s.scaling_cur_freq = policy->cur;
> +        op->u.get_para.u.s.scaling_max_freq = policy->max;
> +        op->u.get_para.u.s.scaling_min_freq = policy->min;
>  
> -    if ( policy->governor->name[0] )
> -        strlcpy(op->u.get_para.u.s.scaling_governor,
> -            policy->governor->name, CPUFREQ_NAME_LEN);
> -    else
> -        strlcpy(op->u.get_para.u.s.scaling_governor, "Unknown",
> -                CPUFREQ_NAME_LEN);
> +        if ( policy->governor->name[0] )
> +            strlcpy(op->u.get_para.u.s.scaling_governor,
> +                policy->governor->name, CPUFREQ_NAME_LEN);
> +        else
> +            strlcpy(op->u.get_para.u.s.scaling_governor, "Unknown",
> +                    CPUFREQ_NAME_LEN);
>  
> -    /* governor specific para */
> -    if ( !strncasecmp(op->u.get_para.u.s.scaling_governor,
> -                      "userspace", CPUFREQ_NAME_LEN) )
> -    {
> -        op->u.get_para.u.s.u.userspace.scaling_setspeed = policy->cur;
> -    }
> +        /* governor specific para */
> +        if ( !strncasecmp(op->u.get_para.u.s.scaling_governor,
> +                          "userspace", CPUFREQ_NAME_LEN) )
> +        {
> +            op->u.get_para.u.s.u.userspace.scaling_setspeed = policy->cur;
> +        }

Would also be nice if you could get rid of the unnecessary braces here
at this occasion.

> --- a/xen/include/acpi/cpufreq/cpufreq.h
> +++ b/xen/include/acpi/cpufreq/cpufreq.h
> @@ -248,5 +248,7 @@ void intel_feature_detect(struct cpufreq_policy *policy);
>  
>  extern bool __initdata opt_cpufreq_hwp;
>  int hwp_cmdline_parse(const char *s);
> +int get_hwp_para(const unsigned int cpu,

I think we generally avoid const when it's not a pointed-to type. It's
not useful at all in a declaration.

> --- a/xen/include/public/sysctl.h
> +++ b/xen/include/public/sysctl.h
> @@ -296,6 +296,61 @@ struct xen_ondemand {
>      uint32_t up_threshold;
>  };
>  
> +struct xen_cppc_para {
> +    /* OUT */
> +    /* activity_window supported if 1 */
> +#define XEN_SYSCTL_CPPC_FEAT_ACT_WINDOW  (1 << 0)

I think 1 isn't very helpful, looking forward. Perhaps better "set" or
"flag set"?

> +    uint32_t features; /* bit flags for features */
> +    /*
> +     * See Intel SDM: HWP Performance Range and Dynamic Capabilities
> +     *
> +     * These four are 0-255 hardware-provided values.  They "continuous,
> +     * abstract unit-less, performance" values.  smaller numbers are slower
> +     * and larger ones are faster.
> +     */
> +    uint32_t lowest;
> +    uint32_t lowest_nonlinear; /* most_efficient */

Why non_linear in the external interface when internally you use
most_efficient (merely put in the comment here)?

> +    uint32_t nominal; /* guaranteed */

Similar question for the name choice here.

> +    uint32_t highest;
> +    /*
> +     * See Intel SDM: IA32_HWP_REQUEST MSR (Address: 774H Logical Processor
> +     * Scope)
> +     *
> +     * These are all hints, and the processor may deviate outside of them.
> +     * Values below are 0-255.
> +     *
> +     * minimum and maximum can be set to the above hardware values to constrain
> +     * operation.  The full range 0-255 is accepted and will be clipped by
> +     * hardware.
> +     */
> +    uint32_t minimum;
> +    uint32_t maximum;
> +    /*
> +     * Set an explicit performance hint, disabling hardware selection.
> +     * 0 lets the hardware decide.
> +     */
> +    uint32_t desired;

"Set" kind of conflicts with all fields being marked as OUT above. I think
the word can simply be dropped?

Jan

