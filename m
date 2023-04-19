Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C62396E7B75
	for <lists+xen-devel@lfdr.de>; Wed, 19 Apr 2023 16:03:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.523513.813623 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pp8OY-0002CB-Nk; Wed, 19 Apr 2023 14:02:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 523513.813623; Wed, 19 Apr 2023 14:02:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pp8OY-00029Y-KR; Wed, 19 Apr 2023 14:02:50 +0000
Received: by outflank-mailman (input) for mailman id 523513;
 Wed, 19 Apr 2023 14:02:49 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=8hvW=AK=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pp8OX-00029C-BE
 for xen-devel@lists.xenproject.org; Wed, 19 Apr 2023 14:02:49 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04on2054.outbound.protection.outlook.com [40.107.7.54])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ddba33fa-deba-11ed-b21f-6b7b168915f2;
 Wed, 19 Apr 2023 16:02:48 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM8PR04MB7202.eurprd04.prod.outlook.com (2603:10a6:20b:1da::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6298.45; Wed, 19 Apr
 2023 14:02:20 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::52b2:f58:e19:56ae]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::52b2:f58:e19:56ae%2]) with mapi id 15.20.6298.045; Wed, 19 Apr 2023
 14:02:20 +0000
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
X-Inumbo-ID: ddba33fa-deba-11ed-b21f-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fhOfWiZ/3HtBYYoDpahJtM8x2WbssuwxV925G9gt4Se+D64+GISNk1rj3Ut9sf/F8Bu9dpZs2BveMdnRrTNs7RKJdiyCZjP5vvBy8JEDHtLIE3bUtKbfoBZqldDBa8+BIFCE8CaXicQZjXAD10243piYc/6n1c5Bf3CX9nqL3Czr7yzB6Bre08xOwr7JLkpZuoIvuy7mmtwtPkC24Cm8fr05pktklM52kcsMebtOM293Pjrbm4+j45MlKVeE5MhqBC2z38dB/9lZgmHGuSyGzlhhgziKwoCFIiV+dmM0wfogQRcmMV1kTqQj3tDYNuOaJZx5knpIhjKia+eAvdG9bQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5t8N/uqflNeiN+ynmSj7yMfbYyfzQzjkJvfO6pvU/os=;
 b=kjMtIGOS8s+XNd9NNkFjDYprwcbqIe/Eg2w+t8tghL9rq541kXQ42SZ4VV8E9BTToTuTUYgJCuStcRkzXvscFoIFvV2sfpDvWrmQpALaO3+c4RUIJucgC5Mw68mjMcsq5HbJglhJ7A/xbMUvCbqbDJra3oZfz291/P5AyteMo2CdRMxgqcBKBRTcPM01eGoFVb464MJSxbiVSUl3nMSLyBoPxuHFdvKjq2+/p6SlU18B36WHKxgXFVZ7jEqaKwYSYIFRgtxFQhrUpiTM4fcsgjyxXwRomKZyfWIW4VEQm+E3lIZZYtC3CknhGM42Z1T48jOGZDWNeD5j60hIErKOlQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5t8N/uqflNeiN+ynmSj7yMfbYyfzQzjkJvfO6pvU/os=;
 b=xeMkQS64vNEySKqp3jnAVDmhK7MVi9R6xRsB/AZK3va0YBvjSmSNUAJdB+OQkQdEGRRoKZkVZLNTj/nZU57Zd5Q6fdyaYbcbedzzZE+bitiZnmwFWCqov8bs8hzxszT5TyOPT/qpAyDaaFDN41WCDWbzCxnkCdfCA0bYjrTJeNToGU6UUG2/0op/JQ08xkbKixExr+a8E2C93V747naVkHB4lPXxYgIJ5GMqkFEiCwHlyjSPzWxFbnZJxYA9zRRCq6+9gQflweTGyK4Sd1ioegdiqt0mkPy8qcCFxrSYY9biI0nVmc36L3vnbNuDWrZvHgUl36QUpHkYlaKxpzN2vQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <c18daf62-47be-8f17-7e18-4dc8952fd5b8@suse.com>
Date: Wed, 19 Apr 2023 16:02:16 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [PATCH v2] xen/vcpu: ignore VCPU_SSHOTTMR_future
Content-Language: en-US
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Cc: Henry Wang <Henry.Wang@arm.com>,
 Community Manager <community.manager@xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <20230419114556.34856-1-roger.pau@citrix.com>
 <e27c6431-053f-924e-27c4-763b3c45fdc2@suse.com>
 <ZD/q/3yI0+8gfJ0g@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <ZD/q/3yI0+8gfJ0g@Air-de-Roger>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0159.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a2::19) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AM8PR04MB7202:EE_
X-MS-Office365-Filtering-Correlation-Id: f6475e78-c0da-4917-c267-08db40deb0f4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	HCJa3UsXAxtU0nsF6lSmePw23vUlppJi4DJav6P6C8nywysYTc5tn2VSjxqnbYPpfDJ9yrrew1VCERPWYUs5pE6LUg2OO4vo9e7dyvm8RGVbQHkZ1LJEYokaQ3NjR0Q17qwzTPwWT+lykMmo7kSro4ibJwwFFSU0hhQjYEHRDcMvUunl6w7vckWuba7xnoD+IqLqeZNKxiQ2YZ1v1CIIwGB+z/qUgGscfoa79fr52OOMeUdDvH3OYY1zMfvq2x6f/eFLL42cgrtHMLUPPN4dHWp/+m9T4UpSc4gv9EnL22tl6ubHwbYIaPDice8IlxAFNZmvLkU+utTc92E7j/JtKmBe6AFWYNVWFwyTPg239cGSjFX2BiTENHi7VgsVUd2vv5oXyody1hNY9PxwqO2srZP0CPdH6Qo9sLVx4KJq95DZO7G+D+yRxJa1z4/VhN8Jq4Js7v2tNqFDZ52qgNFyGIAQtH1d3pje7OoeVglwhzGDpO3EKDIYRO7FQvs9tVd3KibNY18I+IVbP3EIcgkGkpDcTkNbQMfoVqbDqQtaSu1lDxweoZsv03jXhaVcbo/lthQI40kJ+SPCjnmKDJGhbFycjExbo+WYLdr/9NGI45CH4lx+id56MWA6V0IP+9HGT9PV9oD8+AxlH9zVp9zCow==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(376002)(396003)(136003)(346002)(39860400002)(366004)(451199021)(31696002)(38100700002)(2906002)(31686004)(478600001)(6486002)(6666004)(2616005)(83380400001)(26005)(53546011)(6512007)(6506007)(86362001)(186003)(36756003)(41300700001)(316002)(5660300002)(8936002)(8676002)(54906003)(66946007)(66556008)(6916009)(4326008)(66476007)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NC9xL1BJT3FzSTZUUG5JNDd6UjlaZlJpaDZCMldmQVJmd0tCM0VnbkFmakpG?=
 =?utf-8?B?WkZNTUxyKytOckY2WWpxTkNGQU82RUpjOERESFZVUStNYjd1K1UxSldQMTMr?=
 =?utf-8?B?V25IQm9mblpNN1krWUpXU2FSUnl6ZSsyRmpQWGRTUHM2NGZKTVNzaTI0cXlG?=
 =?utf-8?B?dDlIOHl5SVYvNFB0NXRGdUFjcXp4R09GYzIydkRBMld0ZzgyZzNzVmtoaStG?=
 =?utf-8?B?VUJEdCtUcWc2S3RmVHpsWmxFcHBldWsxc0Y2NkNGd3YxekUybTJwS0pjVm4x?=
 =?utf-8?B?Y1kyTGZqL2FoNy9tUkozQTZFNWJPYll0anhrd21NYjFxenBMaEd2bnQvdDhm?=
 =?utf-8?B?NnBQWHFEN1paUEJHV3FNS2MrYmlvQktaQndvQXhqRnkyZ0Ftc0czQTEvNWk3?=
 =?utf-8?B?cVByTVc2SE40Y0VpdVphWlIrZm14bkR0VkcwR3plOWgrQ0tHSkFtNmh6c3FW?=
 =?utf-8?B?S3NVWC8xZGZPVUhyKzZmaWNzWDQ4TVFlZm81ejRGUXlBNUliMUNqRWtMZ1Ns?=
 =?utf-8?B?Vzh1UHZzRmdVKzlOQjRIOE5FengrVlBRdzYzVHdjbkxsVmtuaGM2eDJKb3Rm?=
 =?utf-8?B?Y1cvYjU1VEg5b09JRWR4TjE4VVk2YlZyTWJ2Q2Z1aW9uUjJyOFlldVVWL1pR?=
 =?utf-8?B?akNwQnlUaGlqMis5VWlLejBuQ1lqNUpzemxzWlpRKzVmQ0V0eFJUTHY0bGRu?=
 =?utf-8?B?S0grbkFLb29YeGpNZjZURVEreDgzdmp1b3VJVGZnSS9UdzZBV21VWHM1S1Iv?=
 =?utf-8?B?SzkvNWFpTmNZVVRVYzdHdEJrVlJ1M3AyUGtqaXZpQVNZY2FMdkZmU3JSSDd1?=
 =?utf-8?B?M3dtc0tKWVJTWnhUQzZBcXlpOWNrbzJpNWhhZW1hU0dOTUo2V0JNcjh6Q3l3?=
 =?utf-8?B?bys3dUhjbnFSM1RTWW5SK3hMY2FDSjVveElWei9aa3d1NGlwWTJkOHdPS24r?=
 =?utf-8?B?SmFDSHllY005dlFRVWkxNjE4aU9RTjh3Uy9CM2I2WncrOU5zNUhUcHZjeHZq?=
 =?utf-8?B?V012T0JTaWRTaDJqNHdsUmU5cHpTUWFnSEVnaVJVRWthKzRjcCtlc3haUk5X?=
 =?utf-8?B?L1N4d3VtSUMyYlY4ZWRaRjBzTVdYQXhRbkhjZ0RSQTNENW5BWldzWGNXM1ZH?=
 =?utf-8?B?RkRjT1FobG93T3ZZK1FlaVNFb2pTKzhuMURMWDREMFdITXFZc0V6RmVTM1M1?=
 =?utf-8?B?OTM5T29ZZmxOTjk1YXpVbW1GTEt0b3FRd0dBRHYyY0c1OXpHL0tvckgreCt1?=
 =?utf-8?B?emQrVnhFOXpNY3JNWmo3NkRONGt4aWltd2M4UmNIM0Y3WENja2M4Z1NIYkp2?=
 =?utf-8?B?S3dqSWdlaUtRTVAwT0FsK2lLY1RidTk2amxXdjl2YVh6ZlhwMDhQNGhtYjZR?=
 =?utf-8?B?d2ovbXdGYnpjWDhyUEtzOTVxdVQxL0U3WldkblJXSi9qQkJncUNyOGxaT254?=
 =?utf-8?B?d0Z0VWl2NmRHdjJ0VWNnakdjaDh6UUQ5aU92VW1hNFVQVVJnSzJ5U29OYTdI?=
 =?utf-8?B?eHRwZXRpdjhWMTNrOVQyZVJ6dTlpTDRqSGlFK3lGR0Y4dkRIUi9JNm1PMlli?=
 =?utf-8?B?QjQxQkovcUtLN1VPN2w5M3lnNzltZUhBSkR2Q0xkRTVsUG1zbS9zKzdqWEVP?=
 =?utf-8?B?d3dmNlZqV05tMnJGNHRmSDFUWWJ4bUc5Sm9NV01VVk5GRVVWdzRFeHV6Q3A1?=
 =?utf-8?B?d015QlR3Umh5aWZjUzIwQmpISXEwSjJKSmx2M2J0Y1RDc2VvdHhGVDk3MDRp?=
 =?utf-8?B?YTdmcjBtZEtVeXFQWjQ0c0owZUZCRldpaHRVSFBSdjNXc0NPNitoTHJMUE16?=
 =?utf-8?B?ZFpJMTZtdnEyaldWVlc1Z0FnRHpSbmNhamlXdzNCMGZRM2kzbzBlcWNNeVg1?=
 =?utf-8?B?dldWWjBKTzBsZkZONTFQK2J5NDNyM0Q3alRtSHRFbHRFNTRockMwTmFTSHg0?=
 =?utf-8?B?MGI2dnA1ODN1VDhJYnBjNUpHd1Y5MnQ1cU5CTkNYSjJHMlFuWUplKzJlT25W?=
 =?utf-8?B?bUkyZjlDRlU4YSt1cHo1RUNlNXVVd21WaU5uUzZwSXNGbk8rUXpRN1ZyYlJm?=
 =?utf-8?B?RDE0MTNWOXQrM3NzVEVBUnF2cWRjKzdSU29NbmdNZUFlZk1ZRnR4QXd6eCta?=
 =?utf-8?Q?yJH1ChJv1RyzL//ddN0TTICMT?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f6475e78-c0da-4917-c267-08db40deb0f4
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Apr 2023 14:02:20.0276
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8JVbfBopvZEDNIozbeypmgBZ2mzNnxRtck2fW8gCTo8iufis2wi5mhV+5JkMpNBtSUFO+pUD2iw/+vXus85Hqg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR04MB7202

On 19.04.2023 15:22, Roger Pau Monné wrote:
> On Wed, Apr 19, 2023 at 02:14:44PM +0200, Jan Beulich wrote:
>> On 19.04.2023 13:45, Roger Pau Monne wrote:
>>> --- a/xen/include/public/vcpu.h
>>> +++ b/xen/include/public/vcpu.h
>>> @@ -150,7 +150,7 @@ typedef struct vcpu_set_singleshot_timer vcpu_set_singleshot_timer_t;
>>>  DEFINE_XEN_GUEST_HANDLE(vcpu_set_singleshot_timer_t);
>>>  
>>>  /* Flags to VCPUOP_set_singleshot_timer. */
>>> - /* Require the timeout to be in the future (return -ETIME if it's passed). */
>>> + /* Ignored. */
>>
>> I think this could do with something like "as of Xen 4.18", as the public
>> header shouldn't be tied to a specific version (and then perhaps also
>> retaining the original text). Arguably mentioning a specific version may be
>> a little odd in case we'd consider backporting this, but something would
>> imo better be said.
> 
> Hm, at least for XenServer we will backport this to 4.13, other
> vendors might backport to different versions, at which point I'm not
> sure the comment is very helpful.  It can be misleading because it
> might seem to infer that checking the Xen version will tell you
> whether the flag is ignored or not.
> 
> What about:
> 
> /*
>  * Request the timeout to be in the future (return -ETIME if it's passed)
>  * but can be ignored by the hypervisor.
>  */

Would be fine with me.

Jan

