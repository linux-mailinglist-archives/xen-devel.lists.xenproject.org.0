Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D19776E368
	for <lists+xen-devel@lfdr.de>; Thu,  3 Aug 2023 10:44:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.576096.901857 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qRTvw-0001Ps-Ul; Thu, 03 Aug 2023 08:43:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 576096.901857; Thu, 03 Aug 2023 08:43:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qRTvw-0001O3-Rs; Thu, 03 Aug 2023 08:43:48 +0000
Received: by outflank-mailman (input) for mailman id 576096;
 Thu, 03 Aug 2023 08:43:47 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=VY8U=DU=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qRTvv-0001Nx-7d
 for xen-devel@lists.xenproject.org; Thu, 03 Aug 2023 08:43:47 +0000
Received: from EUR03-DBA-obe.outbound.protection.outlook.com
 (mail-dbaeur03on20620.outbound.protection.outlook.com
 [2a01:111:f400:fe1a::620])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id dbb06ce8-31d9-11ee-b268-6b7b168915f2;
 Thu, 03 Aug 2023 10:43:46 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by PAXPR04MB8333.eurprd04.prod.outlook.com (2603:10a6:102:1c0::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6631.47; Thu, 3 Aug
 2023 08:43:43 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e%5]) with mapi id 15.20.6631.046; Thu, 3 Aug 2023
 08:43:43 +0000
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
X-Inumbo-ID: dbb06ce8-31d9-11ee-b268-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WQ1SLYyj7jEm3ynpPOMAF2rCMRh3VH/WuEtnsNEaWqpNM7xvS1adCsihGJJxej+Jgt6+c6wpVHLXqM3jGzgRUe0Egnh/UJjon6zSVUP5wT0PPrh+WGb841RY85T56GAcYVG0ogb0nlVVOhpEWwL7WwmfFtbXSxVBXFoPdjJ779jmDrerdgcPBH9RsHN6Ff/FilitPHmg8uplzyITxYjZxfWdaA2kVdJlpasfEG4qdSHSQ7AJI3vW0GOPAcMRu0tT1iTdoWKVOkRlAQHNuVyshB4GnkqN9I+c7qH1jsK2gJ7DHjWpnMYmZm6ACjH7HDcSTf1CUnpJ9YJ7Co8Fa9YOvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0+U+7andq4PMomAokpMT4FjNJbi+2tsGvsddXhjZ8fo=;
 b=Aywp4c9NIEiybV8Ge18wJ6h4c5dyXZtUrkd/+y9rZGV5IY4rx//xmE8vp/BGfbIqYP2EUk7EJYsV2dzD9uM/s/x4clFv2ehOCp3ukch3LEkwkseQajUdt7usPhX6SZCsF3nQ49gnCSpNAlcBcAUrrZ78m0PchbSCRTANoo2y2fVeiSqRJOFMoswmc35i24nLlqlsSuyXlNdrdxnlFmQXQdD2fY39AIemASlbDtPNzUSe8m79Vl9mOpbnASRm4C2ZLjAqcmIlVkmHMOb61CPewmdX634V84uf0ueYOI/HnYkfN90f/RHiQxAZ912JY5X1mY1CGHRUPb5+kpBjZtkEWg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0+U+7andq4PMomAokpMT4FjNJbi+2tsGvsddXhjZ8fo=;
 b=GyKdc2NQkzuQKosPW6MTRP0u+X1e+unh6aRSLYEwJ5Ee6pK4q++WD3mDytjG0fpwpGNDsz0JAbsz2FFTVIMIeInfDZzCI3naqlBTcuMEuOFy+SJs/qB6GFKn2AgRRp8Cx8vGkcTVJxulFuWvuceGsbm8vVVjjVx6Nxq1gW8rGuYgc1hofNTB/5xMiSa4RAS12rGkx+x2rakdItb4xsYxE2RXyTNrxaNyUG/O0LmoOUOHDiNq6kmEHNYpbiXSJFBCIiXCMH24gCdCjfRwgfkKvhd0pbh9SpuL2J5P3FZtvg4IeZCA0gaVwkGk/RRUtGWu/qQasbYLc+9QLBl6c3fnmw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <9e89a09e-ed5e-5322-2b94-4547d930ac7f@suse.com>
Date: Thu, 3 Aug 2023 10:43:40 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.1
Subject: Re: [XEN PATCH 3/4] x86/irq: rename variable to address MISRA C:2012
 Rule 5.3
Content-Language: en-US
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: xen-devel@lists.xenproject.org, michal.orzel@amd.com,
 xenia.ragiadakou@amd.com, ayan.kumar.halder@amd.com, consulting@bugseng.com,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, George Dunlap <george.dunlap@citrix.com>,
 Julien Grall <julien@xen.org>, Nicola Vetrini <nicola.vetrini@bugseng.com>
References: <cover.1690969271.git.nicola.vetrini@bugseng.com>
 <af52de5af977362330680707e0acf890e3cb0995.1690969271.git.nicola.vetrini@bugseng.com>
 <alpine.DEB.2.22.394.2308021900030.2127516@ubuntu-linux-20-04-desktop>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <alpine.DEB.2.22.394.2308021900030.2127516@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0111.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9c::15) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|PAXPR04MB8333:EE_
X-MS-Office365-Filtering-Correlation-Id: a12debc3-1298-41b7-eefd-08db93fdbe7c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	/Bb3q3dhpnI0uRrD2oF3I4MW7hyOoNwW1NVhg0N2CYMtJgRsJ3oiSRCQI+Urawgd2JsnjnA3gTB5NI4Ox9MGEcsJloo/DTA5pg5LbWd9a57M/KvoJatCGKXVQXQDqfjaCAWTxesq5si+QjUQy3QUsIb5QdIWRWsFclJWLJkfxJzMd9w40qgx4fqf+USf9HWsfcfjOUlb1FBaKcc77zj0EeE7cgFCHY4RhXsAoqhxLUmzP5JxTh4n454gCIVk5TRyjX8VA4qGZvqRSDHer+n/5rcaU5YconQwXezBmr5ggsfyBcL+jiYdmwMLxJchXB6dZVdvIzlhI74WbFGjxuiF4ObzFzNp0aH/5vtIKR0RwQiLuh7yR//WRtHOMun+PLzkMVe6VtQuY5MIuh9KOJ4Eluf3oIRzJF6u6pbkXiG3/V+9SYbcEb96x75Cn7YUtNpA/KdkR2BhbHbLvggUtOO76o8pgGrJm2IGvk7oikxKRrEAvrQa5oq8GfrtaMNkLC/pg1OqQWmCKGDE7X00RBKEPafS4uLYlJtqCxmRebpwG6JoxbpGh9/d6ln19VccZHPKBIfSAxDt+s2O+ocQWk2+6u0Y0Y9BBVO6KKiB2w6g2OyyNERROh5yRaWnNZLW8kI4m63UwHXBKaLGYgZk33bfjw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(136003)(396003)(346002)(39860400002)(366004)(376002)(451199021)(2616005)(53546011)(6506007)(26005)(186003)(4744005)(316002)(2906002)(66946007)(4326008)(66476007)(66556008)(5660300002)(6916009)(7416002)(41300700001)(8676002)(8936002)(6486002)(6512007)(54906003)(478600001)(38100700002)(31696002)(86362001)(36756003)(31686004)(66899021)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TmNPM0JralEvcGtOS093YlR3bzYraHdDazlDUitKVEdNRDBLem5pMVlQb2dV?=
 =?utf-8?B?TDBhZGFYeEhDYjJnSlIyaS8vVnB6NzlpdWxFcFlGTjRMTCtoZ3Y5UEk2K2s4?=
 =?utf-8?B?ajE3YjVlUWwyWnpraVlJMTFRNUozSEJJeVdoWG5ZeVNWbmhyK2VzeU1EeERE?=
 =?utf-8?B?Y05FcmxXWFNJZWJsVHdXbVlER20rL0N5TkFwazhDNE02MGdvU1NjajFaMlpu?=
 =?utf-8?B?OEZZWWFUd29vZG1WaFl6SDRBZWhFcjdWZkZYWjFURmIvMUxFbFRtbEIrbFEw?=
 =?utf-8?B?SDZjUlU5MUZWRndZR1RZTTl1UDlrU0JnUXJ2SWlUcVZHQi9Ba1BTL1JpbDN4?=
 =?utf-8?B?OHNibU9BS3ZQZjUvb2tDSzNEWVlTaXVkTzNZd2dMVk4rekYxdi9YbXZwQTFJ?=
 =?utf-8?B?NGFBRE8yUVpXQzd0UGVUK0hTZDZmdlN6Y0F4SVBvOUd6SjdhdTBXdndVaGd1?=
 =?utf-8?B?ekRQODZMQVNDR2NWM3VDdGk1VlQ1ZTZIci9XaVdrdEJGbWphOHUzeHREL1JR?=
 =?utf-8?B?Rms0WE5ycDdwa1dyVFpzSGJLaXdCUkJJeEdQanpLSlJUc0lwSFlCa0dmTGJI?=
 =?utf-8?B?dUh3cC94cjRUUXI3V0duK2VxQllyMGRYSEtFTVNWMjRsNnlHMEFRdXE2ZnlN?=
 =?utf-8?B?cTZhRzRFbm90bGNRaE5qZlYwd2R2MGwyZWsyYjZFL05mL2lreHQxK25Wc0Zm?=
 =?utf-8?B?UVFwVjhZMjd4Wk5nc25RNmtQY0FNNFdlcklUUk9SS3ZoOGVaS2VFRk1iQ3dT?=
 =?utf-8?B?akp2NjhuVWVJZGQ0T3VnS0Vld0pIUUpWR2VBaWwzbVMwUDV3RElEZkhlSERm?=
 =?utf-8?B?Mmc0SFZjM3dkbmo0Y0ZRYm1VWk50UmJWQzhPZWd1LzFNdVRYZ0tES1hNcWJ1?=
 =?utf-8?B?Z0h5dHpjSnJxZ09HWEdtZm5GYlpCTTBXM2liRHZBbjdzcGtMVWkwc2hrR3JJ?=
 =?utf-8?B?bXVWYnZ1RVBOd3VaRUxMU1ZhRWU4T2JCd3BNWE5nTy9Sb0hTWVR4dkRwc0sz?=
 =?utf-8?B?dFZvZTRycjM5TWljR3RubmVWcG5MYVJieXdZN050NjFjWmZnN0QxTTBMSy9n?=
 =?utf-8?B?S0NSQVlPZEl2dWhEWGdyUGovU3ZDTGNjS1JRbktBNk9mOGM5eE1yZ2k3Z3hF?=
 =?utf-8?B?UzlRdWJMMVZlK3ozOTU2d2p4UGtQV29HTFVVSmVJcnFVU29kVUZyOHdMVG5Z?=
 =?utf-8?B?K1VRZCtmMkZRWjBYczhKWStjTnVNcXRnSFdBN0pzbzloVmsxTUloNXduYnZv?=
 =?utf-8?B?S0pJWU9TQzdjZjM4UjNkS1pYS3Aza0JFUEdBZlg1WVIyZElyWVJIVTRXSUUz?=
 =?utf-8?B?S0ZOdlJ1UnFZWkFnK1hSQmEvWE5sblNhSlNHS1E1T0xuaFNiQTZGZDJxamVR?=
 =?utf-8?B?MWlwRGhIQkdpd1BESDFCZ3RLWk5RVXExaWR0NE4zS2Z6MWpseEhFOFY2YkFW?=
 =?utf-8?B?RnFWYS9OTW5oNUdSZnpjMWFpbVlBREtDNDdBVWZGZjZsZmdmMEJDejdsaVZF?=
 =?utf-8?B?QWtKcWlQSS9HMFVXeFpwMFhTdGJyQU5xOThXWk5UeTFHQmRuNWtYRmRRNUFh?=
 =?utf-8?B?SUJqcnNsZldRRFQySGRNbG44dGM2Z0QrbGhGVHZjN1l6VFR2NGtvcWFVYkF2?=
 =?utf-8?B?d3RjeFcrY1MrbktTRUNSRndBVW5YcUFUTVJ1OUxnV1JHaTZHaGNHdG5wZm5j?=
 =?utf-8?B?V29wK0hjUVlKRGFGZlRwRkUrenl0TTFEYlBDWWFLeVNuV2ZtRjI3ZVBML2lo?=
 =?utf-8?B?dkl1ZWltcThRTHJQWHlzNWEydW44SHJlT2dGUG90aHBSaVhwZktyQ3FXS1NO?=
 =?utf-8?B?OFlwTWN3d1lHQjBxdlEvMnQ0M2k1bWxRYUVzOFdhNjd2MlBJTEU4NWdBNG9P?=
 =?utf-8?B?TXdtRXg2T1RqeFg3VTQxYndPTnQwT0hnZ1ArUEpuL01ydkgwOG5HNFV1RkdF?=
 =?utf-8?B?anBYUXdpaHA4Z3lTNFdWRzJqRi82bk5UeVhvcE1MSkFtc2d6aWxEdDNZdWlj?=
 =?utf-8?B?dzZUK0JMZEswZUlycUlRTVl2VERmVnUyd0ExYmh6Tmo3SlJIQnVKMC9sWjAr?=
 =?utf-8?B?MHp6OVFpcXFlM1k5VzNxeFJydGxLUFQ5bDdmVS9BZE5yS2cwcXlFeGRFL29l?=
 =?utf-8?Q?gmFRzoBiJxWj50Fu9ny1fPNDA?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a12debc3-1298-41b7-eefd-08db93fdbe7c
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Aug 2023 08:43:43.7664
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: I377kftQ2fYXwC5ibwuo202sAtBAOBn6MJWLFRmT7C3ftn6dcRPK0Dl/QSdpNpL/GmKkKOx/UBcecKahcXMoSg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8333

On 03.08.2023 04:00, Stefano Stabellini wrote:
> On Wed, 2 Aug 2023, Nicola Vetrini wrote:
>> The extern variable 'irq_desc' defined in 'irq.h' is shadowed by
>> local variables in the changed file. To avoid this, the variable is
>> renamed to 'irq_description'.
>>
>> No functional change.
>>
>> Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
> 
> Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>

Btw, Stefano, could you please trim context when you reply to patches,
and when you add no other remarks besides offering a tag?

Thanks, Jan

