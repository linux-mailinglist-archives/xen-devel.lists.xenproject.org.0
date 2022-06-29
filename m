Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A2DE355F685
	for <lists+xen-devel@lfdr.de>; Wed, 29 Jun 2022 08:29:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.357567.586194 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o6RCI-0001sY-7s; Wed, 29 Jun 2022 06:29:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 357567.586194; Wed, 29 Jun 2022 06:29:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o6RCI-0001qj-4j; Wed, 29 Jun 2022 06:29:10 +0000
Received: by outflank-mailman (input) for mailman id 357567;
 Wed, 29 Jun 2022 06:29:09 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=NFaf=XE=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1o6RCH-0001qa-4P
 for xen-devel@lists.xenproject.org; Wed, 29 Jun 2022 06:29:09 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-eopbgr60083.outbound.protection.outlook.com [40.107.6.83])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c78e3522-f774-11ec-bd2d-47488cf2e6aa;
 Wed, 29 Jun 2022 08:29:08 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by VI1PR04MB6144.eurprd04.prod.outlook.com (2603:10a6:803:fd::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5395.14; Wed, 29 Jun
 2022 06:29:03 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::dfa:a64a:432f:e26b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::dfa:a64a:432f:e26b%7]) with mapi id 15.20.5395.014; Wed, 29 Jun 2022
 06:29:03 +0000
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
X-Inumbo-ID: c78e3522-f774-11ec-bd2d-47488cf2e6aa
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VhpZ/qMHIzmCzTZVeVWM6zSb8O3JakJB0CK6IW0ekbaZ4IAen2aYkoeCiQsHJXcULc4ak9B/d/yonKV28TWgSTnLNGnCsE757RM1JEzjZx6NRQhKxrUoWwC3GKKsvCHekqmMJ6C5TEQVc9kHidw6m/nFKWD7nYFs562Fs+xt2BSiZ4p8jWS/1jsMox9HFO38Ttzyr0QcdV/qIiB6R0YQeJT/W/4seF8f/IzxcfjffoaWGvorRmAx5bEVBVvUWSScUDL151Iw1X214OYr4PimxH/6EErwSXv8Ri3pqgQPbtqMFW1ldIveKV5Xxp2WasdNlq4OkA0oZj4y02TmPagw/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ogcTZpmZMCofwVYSyIvnrE9+Xp50lIbVwPYp8yzvc0g=;
 b=eOw+i6+qfym8fNZJNG3sh5RfrvPCsWhBYb3U5igkvco5LqmGu+gEnPKiWL3T4oqOwTRvLaY+pTtHc/huqDeM0qN0cl/BamDNE9WuhYd8lt/OmUUi/3sqcclFWuczQgt2s/WSZ18W1dk20q6VIeBG9mqsVq7zTOreAQO8YipChB5EKuHXoG4v4fbhEvzLZUghTjx+0hs3uTxyK+HT4Vm/5R4jkz0an6AIKc3EJU5Y7ptZWBeNs/SdAau9z9oQwlF3qSkBt3pdjDNRH+kOxLuTbytczYdBrBGP/Hm4AP+x/8N3M27HKSemlZwBJwNqgjekvf0IF8EmeDVDCmDIODdB4w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ogcTZpmZMCofwVYSyIvnrE9+Xp50lIbVwPYp8yzvc0g=;
 b=LZ66FsHdW1weLt/lG/ncpww7GR+/O0jl6ARUKxchmb/5XvZlA6v9icQ1x3CvEo0znzgspIZCRM1YTea7Zk6alvu6KMaSnvQ8bcMx01exDIHA8azZ4nashLxmw8pyH7f54+fGWMk2YprHkKHyyQ36SZf3Y9JFD210OHJMP5jTaaktLMxH+Uwu1Yb9qRDFN96tb3KGknGDnNJaPLzDsS+8jsEc8DlLXD+2H1pM74XfI+xhju/+ki8S7Dc8dd8/90TzLVL5/FAnLU094uybLvVHSXbQe+PfSamcsZDXCr3UJ0fMMH7cbTo5OsndqvNQgs1huvdn9x+Xp5Eh/1DTw/+nEQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <ca75ce19-7fea-68c2-f046-0bc2abb3d5d2@suse.com>
Date: Wed, 29 Jun 2022 08:29:02 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH] Fix compilation error with gcc13
Content-Language: en-US
To: Charles Arnold <carnold@suse.com>
References: <46d17735-e96f-2eee-5d24-fc3d15526c6e@suse.com>
Cc: xen-devel@lists.xenproject.org, Anthony Perard
 <anthony.perard@citrix.com>, Juergen Gross <jgross@suse.com>,
 Wei Liu <wl@xen.org>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <46d17735-e96f-2eee-5d24-fc3d15526c6e@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0067.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:4b::14) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 345ed50b-ae78-42bb-123c-08da5998a941
X-MS-TrafficTypeDiagnostic: VI1PR04MB6144:EE_
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	JQV3tasFuLmk9CRADQrihweGGdJM/sW3wl0GGrSfw3NSOpgaNKIkgfUBO0YYijbF1it/Lm8sKifVjqTI1Y/wTXvW3Rupmum2/sOV/mVHcOaQwg0FXlRU/cLlu6hGGazx2t66gLv4FHGufScuYKiW1pzHP5YKD+X7QBTXkngcud2ZfwHY4iLjMHKdpH7dAwh/3jxBbL5WMdanL8hRf8N6P36VN1I3q+zVlwcbNAb6rQ3tSaxkN3nYKSEwO3xZX0rus4+QAQEu+k6bBekbGlnEDahJT7n93e59XOk3HCrgk+Z18OqUnY/ulc5pkgRZqHKtUsnI9iUj6fwUeOA6AG63wQtd8jXnsRwP1LzlBWd3tomf6hmFbK3PoXYcNkLn4PlCE/7gjZS9qsoQsevRCzr3YyQbT5ncWI7qTasA4dO0lMF67Avs9TRqYPWwyudOECLavKXW85Lg9fDDr1fTPo9efkwEhvx+jzSe9+HWcF+32IsJykKIjhbfbEebOOALnRDNxr28B644D6h1ut07VJQEJMq6huYWdl4NyjP6uP3q/pWjhOL0Ss3KbqFlcTyNppkDen39BzXqCdnDmh4kz1rASyeVbicbkdv067NFiuti8eTxvpN1tm42t/+ddzNrQAOWkRSA2l3GHBlY6zFFchenStmN9rllrrU7ZMNfeoZ8Bes0Bx7hOnM43iLh5COj/QNLcgTOLuJIG+qlLQN/asmhHSBCV3naWOhet1DVzAQONFgGspLHN8sMOhOgEJKA/CR97bF0TFZiiVhVB/Pj4t9MiyGljg2ruoRQOzttB4c0NfsD5T22h8YbZ3R4iLf/V/8HiOJ3DtYPltFjXFdwXJA9BQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(366004)(39860400002)(136003)(396003)(376002)(346002)(6506007)(53546011)(31686004)(41300700001)(36756003)(186003)(478600001)(6486002)(66946007)(2616005)(6512007)(2906002)(38100700002)(26005)(37006003)(54906003)(316002)(4326008)(8676002)(5660300002)(66476007)(66556008)(6636002)(8936002)(6862004)(86362001)(31696002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MThQTC9wL1hlMG5pSklQcDBSemsyT0xhb2hwaUNPaURCWHY0eWRpWjFvZVR5?=
 =?utf-8?B?MDE1Ujh0V2dEdm52a2d1cWpJZ3Q0NXVsQ2NRdFlyNUVrR3BrZnI0QVczSEJJ?=
 =?utf-8?B?VElhZkdQd1RDd0hqWUdWMVlTNzJZeFo5aWxmblFVT0VzVS9OUTczZU5wUFhh?=
 =?utf-8?B?SEdGNE1FVGNLbWkraHgrbFZUZVVWQ1JVR1RSSmZ4ZVhpSTlpc1RqN3V6VHZ4?=
 =?utf-8?B?UVRxSWZrcm5sRGpwaU5Ec1Z1T1F1N0E5a29HMWxUbzdIRDNOLzZRU3gvRzRM?=
 =?utf-8?B?bG5jWWVSUElnUUNJVGcvUWFKai9VdTVzN3lzN29wU09pd245RXhyV0ZCMXBz?=
 =?utf-8?B?TDZBSjRtWDVXTVNIcnFYVDh0aVp6Y1VRYVZxZkxoYzVDYTE0OHVUTTJ5bnpG?=
 =?utf-8?B?R3d4WFNCRTBtck9BdlVxZ2d5TXJxbHZwZFNwTnhGcmZGL3diUFhzUzQzbVlF?=
 =?utf-8?B?eG1xN3JQVnlKSitoKzE4ZkM1Sk1acjA2bnpjZ3o3WUFhc0ZvN1h2QlZ0cTFi?=
 =?utf-8?B?L1cxZm9nbVFXdmxoZ1lpaW9wdWt4Z1phTFFzMHY1VFR5TVpyRURMd2xXSllJ?=
 =?utf-8?B?QUpYRWZuOEptWkpaZG1PSFE0RWY5UUJCZTdmUnprSzJkb2Z0WVhhdUlhWnZn?=
 =?utf-8?B?MlYxVW5ERWxPN2trcHBNcG1xSzloNHkvSndnQjRUSU5WYjJiMHA2ZDlKd3lL?=
 =?utf-8?B?SXpKSnVhSEk5ZkttZmowVmREK202UWJ2TGpycVFjSkVvMG9jT2xmMDc0Mno1?=
 =?utf-8?B?UzhVUzB5OG05djNPNkhCVi9WZEpwVHdsZmFIajFsaWxJWU95dlNuSGFzSjBY?=
 =?utf-8?B?ODRqWWo5ck51ZHBXTllqTWpDcExDKzY3WE1WT01SYUk2WHM0Z3drZzBZbENj?=
 =?utf-8?B?QVRiSStONVB3dkxYL3l2ak9wUXlHZGpsR3dLM3Zmd3NjVnN5cHA1T2c1YjU2?=
 =?utf-8?B?RkpGc3orbFEycHQ1WFhqM0hGejZ2MkNpL0NMMWxVMU44TDVWS3NBREZoT21S?=
 =?utf-8?B?TTFKeWFySnBMK0Y0YmNYKzlWcFNXbjdZZTRoSGZVMGVZRTdmWlZkUnR5ZEd2?=
 =?utf-8?B?a3RZbS9XZFdZR3pQcXVqVzg5ZzBmSEUxSVBvZXBsVlp2d3h3MzZjUDdhM1hY?=
 =?utf-8?B?L3hJVEZnZ0xFdzduMmNZdVZkOEdiUzY4YjBPMmx5SmRsQlF4VUlUbWw0ell5?=
 =?utf-8?B?a3dZVHhWRG5kRy9qYlUzdkhJdkI5eWdqSGhJc1pzZSsrRnJwd1FjeXV4N1I4?=
 =?utf-8?B?Y2pOZUplNkxoWDJlV1ZDMGhYM2ZwYXBBVnBwVnlHbkVyV1BhckltT0Y4T1ZH?=
 =?utf-8?B?NXJWa3NEeHViZjV6Q2FiQ2ZDaFkzYXhQUWk4VS80OVl4dXRrNTJaMEt0aWk5?=
 =?utf-8?B?RmEyRXBuNVpHa1BPcC9oQVQvZ3VQMjk2cHhWS1FDK1Q0eVFqZys5MTluWlZu?=
 =?utf-8?B?d0NrR21ydGNnSVNuUGQ0WjkyNHpVNlpDRE55dXZld2ZTUXJ0V1pWOGl3OXlk?=
 =?utf-8?B?N0pDaTRiN2xZSkJhVzNUOWFJcVQ3SmpLaXE1V3FlUmI3bjlJdDhLWG5LZTh2?=
 =?utf-8?B?TGF4dmhYY0JBVHg3SGcxU1pZSzV6SVJEWUZlQW9WejFRektnQnVMM1psQWRD?=
 =?utf-8?B?SzdWaHhQSXlONXVPaWJ4aytvMUVqeGFzd2NyQ0pJQkpxV2hPeTRYa1ZzU2l5?=
 =?utf-8?B?WmcyaytYUmtIbVB1U3l4by9rK2Y3NDMydnlybmtIUFEycWFIV1orODd2eC9D?=
 =?utf-8?B?NitSQml1a1FlVUo5N2pxek54aDJyQmJqTE4vbGNiak5hbXE1R3pESzFaRkJu?=
 =?utf-8?B?VElLUHV3dmNaVTdPUGlOUXZvbWo3WE9nZ3A0OWZhSHhDRlNObEZNWGluc1px?=
 =?utf-8?B?eTNIeFRsQzhCenJ6VHI2N0dxcUFDUU5LWThRQ3RpYTNKODlNV0d5Y2Q5b2p0?=
 =?utf-8?B?NmN2bzhRci85SjVXNXVMODNnZ2w5RmV3OEhYNGlPYTJoNzNPYjNudmlXNUhT?=
 =?utf-8?B?WXBmS1I5d2hnaU9NNi8xTHBhWHAyVXNBSmFpdDFzTmN0ZWZGMUx1MkVpYU1R?=
 =?utf-8?B?emhWYXVPQWpBWXNxT1prNHdnNDVmYzZiTmZmWERnMDhpNnZaS2lTL210U2ZI?=
 =?utf-8?Q?PSSkCx+1LFkXBQFUWLc8g95D+?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 345ed50b-ae78-42bb-123c-08da5998a941
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jun 2022 06:29:03.6955
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: l2rUf6A1pvBpCwozh8ZYtc2k8JYWo4uqP4zE81uKpKapOzMrWf7fwEWm+PXyG6HSSizl2wZJbQiIRSfSbJcsgg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB6144

(Cc-ing maintainers / reviewers)

On 28.06.2022 18:09, Charles Arnold wrote:
>  From 359f490021e69220313ca8bd2981bad4fcfea0db Mon Sep 17 00:00:00 2001
> From: Charles Arnold <carnold@suse.com>
> Date: Tue, 28 Jun 2022 09:55:28 -0600
> Subject: Fix compilation error with gcc13.
> 
> xc_psr.c:161:5: error: conflicting types for 'xc_psr_cmt_get_data'
> due to enum/integer mismatch;
> 
> Signed-off-by: Charles Arnold <carnold@suse.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>

The subject would benefit from having a "libxc: " prefix, to know at
the first glance which component is being touched.

> --- a/tools/include/xenctrl.h
> +++ b/tools/include/xenctrl.h
> @@ -2520,7 +2520,7 @@ int xc_psr_cmt_get_l3_event_mask(xc_interface 
> *xch, uint32_t *event_mask);
>   int xc_psr_cmt_get_l3_cache_size(xc_interface *xch, uint32_t cpu,
>                                    uint32_t *l3_cache_size);
>   int xc_psr_cmt_get_data(xc_interface *xch, uint32_t rmid, uint32_t cpu,
> -                        uint32_t psr_cmt_type, uint64_t *monitor_data,
> +                        xc_psr_cmt_type type, uint64_t *monitor_data,
>                           uint64_t *tsc);
>   int xc_psr_cmt_enabled(xc_interface *xch);
> 

The patch looks slightly garbled, reminding me of how things looked
for me before I adjusted TB configuration accordingly. I'd be fine
hand-editing the patch while committing, if no other need arises for
a v2 (and of course once a maintainer ack has been provided).

Jan

