Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E87AE773884
	for <lists+xen-devel@lfdr.de>; Tue,  8 Aug 2023 09:06:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.579274.907185 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qTGmR-0003Kq-Sg; Tue, 08 Aug 2023 07:05:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 579274.907185; Tue, 08 Aug 2023 07:05:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qTGmR-0003Ir-Q0; Tue, 08 Aug 2023 07:05:23 +0000
Received: by outflank-mailman (input) for mailman id 579274;
 Tue, 08 Aug 2023 07:05:22 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=/GY6=DZ=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qTGmQ-0003Il-Kg
 for xen-devel@lists.xenproject.org; Tue, 08 Aug 2023 07:05:22 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04on060f.outbound.protection.outlook.com
 [2a01:111:f400:fe0c::60f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id efefc292-35b9-11ee-b280-6b7b168915f2;
 Tue, 08 Aug 2023 09:05:20 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by PA4PR04MB7757.eurprd04.prod.outlook.com (2603:10a6:102:b8::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6652.27; Tue, 8 Aug
 2023 07:05:18 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e%5]) with mapi id 15.20.6652.025; Tue, 8 Aug 2023
 07:05:18 +0000
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
X-Inumbo-ID: efefc292-35b9-11ee-b280-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=g2/2rqgPHzgsYrFEseDYCrYLX61k61eehvBvsCnsvNZ58LxMGQAIjy5LVLsf8ehStI5D+tDYXz0GXxsVgFRBxYM1DXh0JvxpBhPUbcEBAmZp9OBD7S13ZM03ChIwnqNWOCycnHCRKtvdJUd7DmU1IKWAm8SmgR3JL8mmuwQTwkO39xjnf0bofkSw/T8v5R6kS2lqQ/mmtES1gpQPcQYchRX8Ti8x08B4yWekpRl6dq/FqnDwWbpmy8jq9SZyPz4tzT0zDktoYSQxib1CVG4LxD8AeOhyB2aw0G7Q9vanHB9JJkhEY/Zp9fhQKpGhwFUCRxden0se7QSVkdTfY0JFVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TkJ3g32OqlIHjrdAMHwXrRmn+rgF3dKMx4rDtU8a/k4=;
 b=EQSmMQPbE3kp+FqY4X0CBVOmDFnNTPUMvCrEqRwveKtSjon/r3ZzLZ5EwHLdQrdg/SJNZMwKXbam4D3fOkjhaRMvLmSJz4d+GBgjBQtfZKfZy5bjUn7dgtm6RsyJStQv1vzG+iHEMs52nqHh5TlQFKdlRRIgUiZkBWAp/UwuKjlA6X8qgSw4a+JFoh3RkxsYqFrz7QWvIphQDvhPvqQ3c2h6r64FCNvdTa/nslPger72tqaUxg9cIAA1QF95qEzpDwT9fSKb44iW0TSGbf7a8HmXNgdg98HEf7iHzx0KvSkDRXrjj6nCPEb1jY/Y1NNzxt5ynxSSW77GtBOg+Xcrow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TkJ3g32OqlIHjrdAMHwXrRmn+rgF3dKMx4rDtU8a/k4=;
 b=zzx+EarkrvP2pWYK/Ya/u0nuNCc9VnxQwJS5ymlRP8IKKDnqXc11A2Q2u0W+MAlskgmGseDx/2lwhIHvBLwy1973qGtGvgFDQGf3HdhJxT0j5jPesh95snHtzUhki7ZnRuxRuD2pT0Uh1ZalhZE2zJe10Uha6Vl75IglPUbrQNxXSo45TIc4KyMSU/14diAaAWdWITsMhte5QT3+ygn1qeAb4J6fhaC3kLeKeTs/AcUx73OW/5QwEDdj3XEwfvmTLHKxSr4YmJS6KMXetO0bjBYKjjxkREyNejnI0l7HXQV70Ay9zNO1KWXEwEUZJ2n3/cXXRxxXMveOz/3ekSJ+3g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <5fd0359b-fcbb-3073-6fb1-bc462eceb295@suse.com>
Date: Tue, 8 Aug 2023 09:05:15 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [PATCH v8 04/15] xen/sysctl: Nest cpufreq scaling options
Content-Language: en-US
To: Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Jason Andryuk <jandryuk@gmail.com>, xen-devel@lists.xenproject.org,
 Juergen Gross <jgross@suse.com>
References: <20230807185119.98333-1-jandryuk@gmail.com>
 <20230807185119.98333-5-jandryuk@gmail.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20230807185119.98333-5-jandryuk@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0102.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a9::18) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|PA4PR04MB7757:EE_
X-MS-Office365-Filtering-Correlation-Id: 677bec7a-cf78-4126-75ec-08db97ddd287
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	MC7gxlXMiApdw8ksmk2TDBGRsuq6t3N0dLLXLhSF40tCDatdIeTkKiPD5wSD5N/JduhmZscIOWJjvivcOc5NoL8KY65ZKXgA8EQK8uPmvWlGXGDst3j5k0b4gItgcocnUztKeeN+IfrkCi1MSmrwTKbBosEz9gzV8cbWTALUclHloeXqhZ45PTAFETRfibbrpKu819vS+GL7+8MLp8+b62aLR/IpFHdF9qrAyFWPbYo8/k9lTlbpZjaabJifyoZ0I+IgVRG9wUQx+xfkpzrBs2v0wKrLkvq3vuYhEYqex77y2AzzDCjNxg+HbYTF3A6L5fUE3XnCIF5VPWL+Un2VOZOkiiVye54HbHozFN6wAvlfWPJw961dLVbuPirw/tVOEeBMuZfIqoaFwli4RHGN3dX4otWNmAaHzpbSImBfBO01kiAlFJza89jaPSUjE8LtYGXieC8Tx7ArlXm9cgZ7UFtNQfavtZBo2nJdYmD74lYumgrcyZiN+fzeMBgqkBZq2eBoVyI4dJmBEsOpKAniyyMIn3rULdo6RDJZ2OShXy4Iiy4LHykKPV2huLrGSJr18TPKdibU4rNm87vrlPt2f3W2u2hyrhqtkQ4Smn2jNomy7cdOIsrMdbuOee4jq9jSRiWpCDqC7N5doak8VzdCAllpn+4bVfZSX5VyqJdPydthOF2OvoA9qefTwLXVOeXrIQ+HyzkC6vsgGiXfqnf/nQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(376002)(346002)(396003)(136003)(366004)(39860400002)(451199021)(186006)(1800799003)(90011799007)(90021799007)(31686004)(316002)(83380400001)(107886003)(2616005)(2906002)(36756003)(8936002)(8676002)(26005)(53546011)(38100700002)(6666004)(6486002)(5660300002)(66476007)(66556008)(66946007)(41300700001)(4326008)(6506007)(478600001)(31696002)(54906003)(110136005)(86362001)(6512007)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?L3haVDN0alU0Mk9LSTU0Qm8xRjBNRHdlanA4anh1THg1eU5POGx1VHpFampu?=
 =?utf-8?B?UzhqMWtHYTMvT1hGVFFYSDcxY0Jyc055bnIrVXBrcGp2WGtlQjZaMXBLa1F1?=
 =?utf-8?B?VzZOcGd6U25qeGNnQ2U0QXQxbkpCRHY5VE52R1o2R3hvclFYOEdMVDB6UVdU?=
 =?utf-8?B?b0YwWWZzMVhrNkxtY1VmZnJWVXJiNlRkejlUM3dLOTBibFl0WHdUd0xveDdT?=
 =?utf-8?B?Y0w0aTNLV25vSW5MQVpNNUJMUEhlU29MbGxnMnNSajVCQlNLNnZOdVp3dWJ6?=
 =?utf-8?B?MXhQbGZHbTJWSDhiempEeUVBWUhqTzlzRTVoNURMSHN0TkY5TUNEWDBrL2x2?=
 =?utf-8?B?Zm5SZGx4dUkzU21QY2FXWkgreldMcTlJTEhvaE51YjVrQ25GSXRWM1QvSHU1?=
 =?utf-8?B?US9wVjdTUU1FM3BwcXRWcTczODJOa0NGbDlFRTE0ZlppZkVJc0hxQ04rODNT?=
 =?utf-8?B?TEltMFFUMTNtV0VVUXg3ZFBpQ1BqSlRTNWVNS0orUGo0V0R1T2lPUGh5T3FE?=
 =?utf-8?B?a3hhOVFyWm5KYTNaVU9rTkg1bEhETi84YUZzZEliK0JRZGxyWGFjM1FqMWxO?=
 =?utf-8?B?ZzREMDJDVWJUV2NhZGlQSkpMeGtpRnlUYTZod2l6c1JyNitpWFdLQlBLaVpZ?=
 =?utf-8?B?ZWw4a1dMQkZCUTB1NGdaY1hpQ3diSU9pZHgybGlNL0pXSkhaenJkUEV1MVBp?=
 =?utf-8?B?RWllT1RpMlg4SWdOWFF0eHdrbnJPeUVzTTNobS90RG96VTR6Y25xaGxROTBw?=
 =?utf-8?B?MWlQK2YzYWxoZ1U2bEgxbU5CV3VwcmZ0bU1SQk9qOThubG4xVEhtZUU3ZHU2?=
 =?utf-8?B?OFBNYkIwaEdwR1ppdmdScW0vUGJta1daQjMrMEdoQ1Awanp0dlBlRHJsbGxh?=
 =?utf-8?B?T0c4NEU4V0E4bnlrTURMVGlSTDQzSUN2UmFrcTl0TTkwRjFQQU01cDRMTTRt?=
 =?utf-8?B?cENJQ3RkRHNvbXowMlh3RUVjcTc1d1lSenRBUDFhc3grZ214UWIxcVdJNkYw?=
 =?utf-8?B?blI1a0xjL2s3SWRPTUVaK0NCblJMVjU5WHMyc2hzRGVGRDlBUEM3NGp3NTNp?=
 =?utf-8?B?dG5LZE9LczZwVFRIRW9ELzMxeU9KTTVOMmZIc0tyVitmL3EwUjROaDBlTVNi?=
 =?utf-8?B?MnNFbDE4ZG5zTjg4MmVPS2xpUEJUOXZDQUFxVkxpcEFrYktSR3RkcFcxRi9i?=
 =?utf-8?B?RnY1V1NpZEkyRlBxcUFYV0ZTZk5VVjVERm42UWgvWGVTOXJBeWsraGJJNVA0?=
 =?utf-8?B?V1pmQUlrSEluOVMrOXVsdU1rcFhMckJrQnJyelhVRGE5bVR0MTlIM1c0N0lL?=
 =?utf-8?B?dmJOS1BzVnBoSS80MzltRXhXcnJkVHFUMW5FeUJ6cVRGL3Q1UGtXaHMraXJI?=
 =?utf-8?B?emNSdFlhT0xjb3FOaWt0MU9IeUV0NnMwOUl6UU5mVmE0NFE5anZwK3NrVk0r?=
 =?utf-8?B?YVA5ZjcrUlJPaU9WMGRLVGp3SDVOUk1FMVJjMXphNWV3NEdJYkZGZFk2MmZP?=
 =?utf-8?B?c2FkNUk1YjlncUp3dTBHQUNVZmttZk8wbGUvZi94NlJEUG8zR1BZMFZsYzF1?=
 =?utf-8?B?ajB2eWhPSUVlaVFNS2Z4RmFYR3gwc2R2cnVDQWN5bHhsblJ0RnZTU0tSLzlQ?=
 =?utf-8?B?bG5QOWNVaHYyaGRtbEFsTzE4c3BTYjlSMTZBbXZ2eGpiYURnSmliNkZuR01K?=
 =?utf-8?B?MXRmY3Q3ekZ0elRyTzhXUXpnaWxDd1AwTHhTWExYU05VeWpjUjB5VlVJcWFH?=
 =?utf-8?B?ZkFiL2Y5aFQzbkJaQ0F4aXcxL0ZZZVNLYnhyWHowMndNRnJzQzY0b29TZElL?=
 =?utf-8?B?VnQrbVp2R0dmc2pvQThNaWk4QVljRDVpYTRHalFPUkFZRHdDMklnR0REMm5z?=
 =?utf-8?B?dXRMd0E3Q3E0ZE0vWlJVT01xMGI2UVlISjNNcEZDRGtVai8xN2ppb2toREpy?=
 =?utf-8?B?Q1hvS1pJcGdxNTFIcC84M0RVdGpGVm9wM1hZcmJsWE03eUtOWHQwblhPa3FZ?=
 =?utf-8?B?L29qRzE3OXMyUnUzUnpwbG4wV3E5RE16MERCWjNUOHlxNW1VblBOeGhnNkdn?=
 =?utf-8?B?dW1mZG1MeHhlMitRZlpLKzd2QjVqeUYrM1pvNnAyNlQ5MjU5a3JFWVNBa1FE?=
 =?utf-8?Q?VpcuD2ZfSB64f1Si8mcE/1elZ?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 677bec7a-cf78-4126-75ec-08db97ddd287
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Aug 2023 07:05:18.0374
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: t0gbp7vuuMy5U4zzzwdeYsGRz3bC12KbOxWsgyfjY/tZoSGRz2qLgdl7H4TUZ2WHw4gDw+HJHlXdsMraO7D8Eg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB7757

On 07.08.2023 20:51, Jason Andryuk wrote:
> Add a union and struct so that most of the scaling variables of struct
> xen_get_cpufreq_para are within in a binary-compatible layout.  This
> allows cppc_para to live in the larger union and use uint32_ts - struct
> xen_cppc_para will be 10 uint32_t's.
> 
> The new scaling struct is 3 * uint32_t + 16 bytes CPUFREQ_NAME_LEN + 4 *
> uint32_t for xen_ondemand = 11 uint32_t.  That means the old size is
> retained, int32_t turbo_enabled doesn't move and it's binary compatible.
> 
> The out-of-context memcpy() in xc_get_cpufreq_para() now handles the
> copying of the fields removed there.
> 
> Signed-off-by: Jason Andryuk <jandryuk@gmail.com>
> Reviewed-by: Jan Beulich <jbeulich@suse.com>
> ---
> v8:
> Add BUILD_BUG_ON checks for structs xc_get_cpufreq_para & xen_get_cpufreq_para
> 
> v6:
> Add Jan's Reviewed-by
> 
> v5:
> Expand commit message
> Change comment to driver/governor
> ---
>  tools/include/xenctrl.h     | 22 ++++++++++--------
>  tools/libs/ctrl/xc_pm.c     | 46 ++++++++++++++++++++++++++++++++-----
>  tools/misc/xenpm.c          | 24 +++++++++----------
>  xen/drivers/acpi/pmstat.c   | 27 +++++++++++-----------
>  xen/include/public/sysctl.h | 22 ++++++++++--------
>  5 files changed, 92 insertions(+), 49 deletions(-)

Since the note in the cover letter may not be noticed - this wants looking at by
a tool stack person.

Thanks, Jan

