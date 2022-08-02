Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 90952587E7D
	for <lists+xen-devel@lfdr.de>; Tue,  2 Aug 2022 16:58:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.379381.612796 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oItKO-0001Gh-T1; Tue, 02 Aug 2022 14:57:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 379381.612796; Tue, 02 Aug 2022 14:57:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oItKO-0001De-PF; Tue, 02 Aug 2022 14:57:00 +0000
Received: by outflank-mailman (input) for mailman id 379381;
 Tue, 02 Aug 2022 14:56:59 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ix6t=YG=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1oItKN-0001DY-B6
 for xen-devel@lists.xenproject.org; Tue, 02 Aug 2022 14:56:59 +0000
Received: from EUR02-VE1-obe.outbound.protection.outlook.com
 (mail-eopbgr20072.outbound.protection.outlook.com [40.107.2.72])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5a984234-1273-11ed-bd2d-47488cf2e6aa;
 Tue, 02 Aug 2022 16:56:57 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM6PR04MB4901.eurprd04.prod.outlook.com (2603:10a6:20b:1::32) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5482.16; Tue, 2 Aug
 2022 14:56:55 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::1959:dab4:15f1:4acf]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::1959:dab4:15f1:4acf%2]) with mapi id 15.20.5482.016; Tue, 2 Aug 2022
 14:56:55 +0000
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
X-Inumbo-ID: 5a984234-1273-11ed-bd2d-47488cf2e6aa
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RQT5ishN34BZE+t1P8buFHyh1Ab6Gs43Liy9994iRu5Iz8nIS4felnXXF9OP/pCpoOw+4cMh4Fd/vinmBZP9MUHgBeqkJyzLensT9yK2gpEcv5TcZAEyKRaXb1c2vi0gsou+oAsfcE04efv8kuf+Xl48LH8ZEhGNo6t8rkw5N0LSA4ILEeDigeCB0iZctF/8zH35QpdF5H4MHkUqtPChPAJMFHgdhNxOEEhAHckqmNlgjGWGB5N76hmSQMCVnm9GCbohBn7DaYdvUoQXNV7MWC6QRTZ47PX5Kge8bxetWAYFTYuz7fsjkhEQlPvD+0v/Lhh45Ud7mipB1ERoQdjW6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=t22pg2WEGbx9CTK1hnS8nq8iEi7EGiN8CNppeN4TCEY=;
 b=IvSywDL3Jb7Y1SPotq3eY4yZKODSSXd0WsP4AIB9I4bRW918nQdnbLc/tIVwUHoFSwrDdYw3aNgq8g19pDAAkknhxTnAH7LGMPE0fKte7jdm9DUaC64C9wFfIKrcxcLyHXMcRiHnalje8HBgtFz75JEu9aboRb8bEko9sJa0oq8mLsQCL2JFlSIPd72cyHkDK/EvL6kfIzGNkxccCFj0ombrQmReVbiHuE8f1SYTZCY/COzcZVf35At+kcTkyRF3/Oe/4I38KpGYpZx87SdNnXvXF8hzJfq15cvLuGpYvvvrWbhfZAvqd7jdudR9X7Tpu10BsDnR0t26a44CrTU/bw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=t22pg2WEGbx9CTK1hnS8nq8iEi7EGiN8CNppeN4TCEY=;
 b=BjqRkcBIkIsDP107akfBeVV8Ykpl8G+186gB74AmWZrxmlyj4I3u8PRKttAW2qtO1EjOOIRbZjsf/gtR0PVIz/CYNLbt3Gm6XXiUa4DPx/EWDantLBe+1vfAIg59g95BRkdwp74VfUevz/MSYdfhxslYO1XrmAJrGVSnXCmqF0IwvgSlk8XuAFDWaldkcMPPzo5YaaMjbaRRlrzconvz1yk14gqqW9hqnzYy8+UP5MCM+/HYwI+lUpf8SMSPoJ0BKiUGu9UjQTzdq6btpwIP+72MeQEb705V8tXc6vhqfnQfWwL6dO2CfAdmwi/EHLt75Jz5/0IoxyG2VT2ilhGPwg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <473a337f-3211-c588-9398-b9f9a18926e5@suse.com>
Date: Tue, 2 Aug 2022 16:56:53 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 1/2] xen: sched: dom0_vcpus_pin should only affect dom0
Content-Language: en-US
To: Dario Faggioli <dfaggioli@suse.com>
Cc: George Dunlap <george.dunlap@citrix.com>, xen-devel@lists.xenproject.org
References: <165944775952.3531.14547627248752689801.stgit@tumbleweed.Wayrath>
 <165944829054.3531.818489021551433260.stgit@tumbleweed.Wayrath>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <165944829054.3531.818489021551433260.stgit@tumbleweed.Wayrath>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM6PR10CA0013.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:209:89::26) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: cae440e1-2a48-4cba-935d-08da74973da8
X-MS-TrafficTypeDiagnostic: AM6PR04MB4901:EE_
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	JOChJ1C8VFV5Ch22+IBYgW94+5toEasOh8HH1L+Fi+lp77CyH7weIqSaiOTAUitFvH/ktXMCtz1cmKQgxjEUFv3yGLEMKyJzbcxSf+w6JAWpyZnJ31LyZJE+jxKvqHgReA4jt6nxzCuSuxTVRCQvkVc00VreoN6f6zvzBjdSNIFLnPdlwvQJRQFbis0BgONkrEk54PVbLHGPc03bIgxAUDIkEgBcsxL2AS8WKzh4FAZK+gL41A/zmK2m/lvURLVUWbyF0Hnz4cP9+ckZjqtfq2G1ovY8N1m4RJhzvxqNWCksEUxlYfYTvyDOZWCRXEczDUOgWYvmjLT/MVjulsWjeumBvCRNnRCk74JFVkZHSjCyaspTr7DXJSpFszYh6FK2+UtWLdOx++59WFlpneSmsF7AAzbtTM9B1HFMY0qwU1uFUQr3yL+zhttuM9iF4Lvqlc06fUw21KrjsygTlRf4Lwem2DCQwMmcko+8NYKoCLtM4y0L+2A7NfFzLZ+PDELsLf/BuZtq/4KS/0FEATDh8N6ZZ/qCFhDTSvSnI+tHZ0uvGV/WeO7uCvx16s62NTyYn8/KdOJntWwBLArN3/yAuplSU1MZ0kY9phXsSnra9siAMDE+tJBV1JQ/DB0BncsOdd6zzECBbyEYEXgllw/ZBp3sbIR58cdGLsvdd71j5CycT0YHBrslMzimFTHb+EGgyb5ptWWWF/+W5chg8BDuxgH5EHpCwkfmBNIg7QMlEn5f0LdZnGkRd7pxCay/IILt5EqXGpmcUwy1i83VGCgVfoxMK69rvRrUgG+1cz0Pp2fDVhwOfxkvkOH2HY2rb3tbzGBi/YwQPKqhNlVX94ddUQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(346002)(136003)(39860400002)(376002)(396003)(366004)(26005)(186003)(86362001)(6512007)(478600001)(31696002)(38100700002)(6486002)(2616005)(8936002)(6506007)(53546011)(2906002)(41300700001)(6862004)(5660300002)(6636002)(31686004)(37006003)(4744005)(36756003)(316002)(8676002)(66946007)(66556008)(66476007)(4326008)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?amVKQnhWY1RiYjUyZTFEeFJLRzJMdDdxWnVaeVBpdEFtM09oNnhMaFo2aWZX?=
 =?utf-8?B?Y1dWQzBVclNpamxlZ3c2RFpZVk1uSDNBNWQwdmhUT1d5ZWxxNi9TbkFnWnpt?=
 =?utf-8?B?TE4rVXFEWGtVOTNHVjJRMW1EdXFUSDBhUTFkKzJXL2szaE1paUlhS2RxSDJy?=
 =?utf-8?B?K1RUYzh1WXNENlE1dENuZmtLT0VnSTFMeFlmUEsrTngvNnVSTmFBcExTZVBE?=
 =?utf-8?B?UngwOFRFdW4ybDdyRDh2VUl5L3hGSnRIaXpmbjJVTnJUT3Z4VnBhUmpUdEt1?=
 =?utf-8?B?cFE3bDRkOUxkbkZndGF1aFFxSmc0NXVJWlNqZkxCYzJZVjZFQ1l3emJmV2ht?=
 =?utf-8?B?b1pkQU53aE5YamdjRzhadFNYMTFMY280OFpTY1pVcmZrTU1nTDRsNHdjT1Jo?=
 =?utf-8?B?RlVJd3BRUkJPMXI2Mi80MXlFRytyVWdXKzZMZXNpdnpKbVNjcXM3cmxDbnBZ?=
 =?utf-8?B?dWY3WmlHUThOOXFPckZkWElXTVRZOTFWSjNJRUZpKzd1b3pxZ0RETlpoVWdi?=
 =?utf-8?B?QU1GZlM1WDBMdWV0Y2FDNjVlNVhmdmc5YnRqclhRWHhmbzJFU1ByM2pJaWJr?=
 =?utf-8?B?QURZRi91Ukl5ajNMVWxsRnU5VlJCV0s4YnRNc0d3SGhsRXlZWUZNUEVJNHV6?=
 =?utf-8?B?bXBHU2NmRTRjNzBtYTFXejNBRVhSM2hCNzJYSjYydFo0dFJXS1dwQlkzYTJi?=
 =?utf-8?B?WXJVTHpGRkMvN0dQM29BYWFieUpYT3QvKzV6ems3MHNOTklNOFQzdGNBRGc1?=
 =?utf-8?B?N1JGRkdMeFUzSDYvRUFuRkhCRjU0a3E4bTFXdjYxVTlqTEFBNS9iYW5zQWhW?=
 =?utf-8?B?enlMZDNhb1AyV1BFQkt4bStnbVNHclRhNjlxV1JHZWRzMWVGWEpwTllQWUhp?=
 =?utf-8?B?Q1JjcEhXTU9tSnpnemNCaXNSVjF4WFlnWkNMd2ZyVjlsSUpQKzd5YVZ4Uisv?=
 =?utf-8?B?KzY2eUVZc3d3eFZkMk1DeXkwYmxGSmNZenNiVUtNa0hBTTROUzhNM1dnN3I5?=
 =?utf-8?B?cDRScDZOQUxhTE5HQ0VIOEM4VndBMjYzK1I5aXM4RmEwWDhQTjgzYU5rclBF?=
 =?utf-8?B?WFBxSU0yVXVaVmhCdHk0ckltSkptK0huY0RGWE9OS2tERGRNVVBHeXJwTk9J?=
 =?utf-8?B?YmdwTU1hM1dEcXNPY1U5Y0YyUXg4NHltZEV4aytSWjcxUzdadEFvYUk1YVB2?=
 =?utf-8?B?VEt6bmlDcmg4b0s5RFNodzVmS0FuZXJYRnpnWk1FbjlnaEp2cGI3aEZ5RFl4?=
 =?utf-8?B?WlFmSHl4ZE5NNHRqSkttOER1QmZGVEJ1Q285azRPdVAvSjRJRmhVcklsY2dH?=
 =?utf-8?B?d25lSFpzM3U3K05lTFhabnEvRGZHcnJlTk14SDA1T2NnMC9Rekhad2ZrdHB4?=
 =?utf-8?B?ZGZmclB0SXRIZEJhSDV0VXVMYVV6Sm51UUhvNk1qMDJVMHdtSmNoc3Bwb3NZ?=
 =?utf-8?B?c1J3NGs3N29Kb3hha2tCMVBUZmhKT2grMm14SXRoVSt0UHljUW1QQy9mYk1m?=
 =?utf-8?B?cHlZUVR0ZFYwdWxQWkJsV2lMUjNUS3FwaWQvcjh5ekhjQTdxUzdxNzJlSldw?=
 =?utf-8?B?VkN2aVN6OHpKNzdHMTZnaVFHV0NsekFUOElwZ21pNGhJN1c5K0hLM3J2K095?=
 =?utf-8?B?a29sSndZcC90S0JyR1k5dnpOMDVNblNjWDYwRktUT25wcm81S2pVcGhHL2M2?=
 =?utf-8?B?c1pYc21NVnJyOEU5RExqSE5Sdm90a253UlhlMEZPYy9DMTdleGk4dU1kc1lT?=
 =?utf-8?B?UURDV3VkbjdCTXpiekk5SGpvbVdaZ1R2TmpteFNiRWFTNE9FeFZXYUo4V0tJ?=
 =?utf-8?B?VElxZUZ6cnFxd01vMm5VRzhzSW91WlpPcE0vbkF1SEcrdGNJeHdUT3ZmYmEw?=
 =?utf-8?B?Qzg5MkFyMXJEcmErZ21UUzNGV25XZGVxVUx4VGdZU2J0ZGM2aXNIdnBwMllP?=
 =?utf-8?B?b3Q0WER2aTlCbVZzOXZteGh5RTFSSm1FU1BTWHpOb1FGTVV6MGRqWklMbDNW?=
 =?utf-8?B?cytOZTZIVU1vNVRUUmFXV1pEbGpZVGhtb3VLMHYxQUV1T2pESGVwM3NlOWJC?=
 =?utf-8?B?MHZhV0w0V1BzZHpqamprWUMvUDBPeVdQRFBKL0owNlJLQ1Nlc3JhaDFKTnVs?=
 =?utf-8?Q?2J0+UGqdgsA5pLS/8fZZRTIHA?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cae440e1-2a48-4cba-935d-08da74973da8
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Aug 2022 14:56:55.1250
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nzRXBxP+X57mHbbTXhOQTe7RvVuUiog5TccjXVbl6GHZeqPpEq1YJrWROvCmrkni09WpY6FrmRRiX8Vi/7EoKQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR04MB4901

On 02.08.2022 15:51, Dario Faggioli wrote:
> If dom0_vcpus_pin is used, make sure the pinning is only done for
> dom0 vcpus, instead of for the hardware domain (which might not be
> dom0 at all!).

Hmm, but the control domain may not be either, as it's derived from
d->is_privileged. I think ...

> --- a/xen/common/sched/core.c
> +++ b/xen/common/sched/core.c
> @@ -575,7 +575,7 @@ int sched_init_vcpu(struct vcpu *v)
>       * Initialize affinity settings. The idler, and potentially
>       * domain-0 VCPUs, are pinned onto their respective physical CPUs.
>       */
> -    if ( is_idle_domain(d) || (is_hardware_domain(d) && opt_dom0_vcpus_pin) )
> +    if ( is_idle_domain(d) || (is_control_domain(d) && opt_dom0_vcpus_pin) )

... for it to be strictly only Dom0, you want to check d->domain_id here.

Or else I guess the description wants adjusting.

Jan

