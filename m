Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E5A23F7818
	for <lists+xen-devel@lfdr.de>; Wed, 25 Aug 2021 17:17:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.172482.314743 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mIuds-000713-W0; Wed, 25 Aug 2021 15:16:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 172482.314743; Wed, 25 Aug 2021 15:16:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mIuds-0006zI-Se; Wed, 25 Aug 2021 15:16:40 +0000
Received: by outflank-mailman (input) for mailman id 172482;
 Wed, 25 Aug 2021 15:16:39 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=5IQt=NQ=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mIudr-0006zC-Kj
 for xen-devel@lists.xenproject.org; Wed, 25 Aug 2021 15:16:39 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.111.102])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 702caf23-05b7-11ec-a96a-12813bfff9fa;
 Wed, 25 Aug 2021 15:16:38 +0000 (UTC)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05lp2112.outbound.protection.outlook.com [104.47.17.112])
 (Using TLS) by relay.mimecast.com with ESMTP id
 de-mta-38-CPkWjHHANxuCD7AxyGetyg-1; Wed, 25 Aug 2021 17:16:36 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB3120.eurprd04.prod.outlook.com (2603:10a6:802:e::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4436.19; Wed, 25 Aug
 2021 15:16:34 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b%7]) with mapi id 15.20.4457.017; Wed, 25 Aug 2021
 15:16:34 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 FR3P281CA0072.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:4b::23) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4457.8 via Frontend Transport; Wed, 25 Aug 2021 15:16:34 +0000
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
X-Inumbo-ID: 702caf23-05b7-11ec-a96a-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1629904597;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+8tyB8WblkCc2TfmASl9M6/QXpNZ5gexPCeAFiF8rHo=;
	b=MlaXOXi5j/WUOsI302SbUECMmgVQTbCjKbF01/mOLuxfoEkEyZoiDB6/xIa2qJFaf3Gm45
	21k981jCM/5bi8U0sKhHd2YR5ySSJJwX0MinufSl9MbRwWIEgOhgoqIAVXGduKfVDnaZRW
	Y+aNmi9XvOJaBmyfIZV+oVbpG+7SElU=
X-MC-Unique: CPkWjHHANxuCD7AxyGetyg-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Y9myRUvIVsEaws9PeBrm8GgZdwHWt9wifkeyX7Lh122x6G1OAzPu5cWKqz51C10PvlWM2ebYMglDJSohFUI74yTWmRpIppzImqkz1jclRGBsIFnWFnUJhk2BxL4q2ISsgGtlAs0J7cm3cODNoLRB07kFewqfh0PYl4YjMfzuu+DS6XuyvfK5khZZsZplex5ItC2dxjdxF+M3ydhAstKkFzdov79tJbILaTZkeNz5hZSdHQil5Q+jhD8yebmNOUK6p9SYDkED/wLtjhWmqS3bhuXIgBTPr29HLajX3OUNMqRuHvKF/3FRJkMxNRSKUCJIOUYXPLWnEQ+6CdYQBx8x4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+8tyB8WblkCc2TfmASl9M6/QXpNZ5gexPCeAFiF8rHo=;
 b=St6X+tT715luZ9tcgCe30RE2rxbJIz6lZaAGb449HNvkPUx31ksljf2VhaSi/QQquYTvZg1Dsrd8whzz7puggCtcdM3g9Rxx0neg3YVDIPR1g2CEFIDHjVHcvh3upH+aNgY3wG86msSiB877PK79J//WbQyuBtDEWLnFhCrmJs8yfmfnXflfJxZO6UZOCtmSRyiKEs0gBz109t78DGAPdZ0iU7k3X8FhnOwcFRDRgW4vbr4AcHmkbYon82Z72FL2h4uaq0dU5e0z5K7LrI6g/E2kNfkJZ6ZeMHY3RRlOaTSIKkyDqPzzI98kw3BqZgR0xlq/rBy0BfKM6OmzhI02Ug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=suse.com;
Subject: Re: [PATCH v3 3/7] xsm: refactor xsm_ops handling
To: "Daniel P. Smith" <dpsmith@apertussolutions.com>
Cc: Daniel De Graaf <dgdegra@tycho.nsa.gov>, xen-devel@lists.xenproject.org
References: <20210805140644.357-1-dpsmith@apertussolutions.com>
 <20210805140644.357-4-dpsmith@apertussolutions.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <572bfa5c-154f-8fe5-7693-75919949835e@suse.com>
Date: Wed, 25 Aug 2021 17:16:32 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
In-Reply-To: <20210805140644.357-4-dpsmith@apertussolutions.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0072.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:4b::23) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: aef42afa-812f-4965-f62d-08d967db5351
X-MS-TrafficTypeDiagnostic: VI1PR04MB3120:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB3120DD36D93B824AAAB84A62B3C69@VI1PR04MB3120.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2582;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	9mAfejqhhzSyufemhqs9F3nUQkUokQPDgJaRGmTTupfzyvRRGFqgPEYyXznvbwVOONXnLHm569uAbAFwu4YnitZFB7UAmWRp7c2KnB5DAP1OWeGdZlg3GbnIdOVQDnZXM+D0esz0Hx0hV+PBEl18v42hJ2YxdOCwVwi97Jp4F3V7ZSwk0LEOPJm4teY2JO5j7jKMrTmOrm1A0dxP97JCxNDrlFXcwHn7cN5gKCbi3NOOHzVGV35hMDMY1TPyUFCFhoDqVMZaKhKTxWt5p9S0Pz9akCZBim1pafo2q6+1YZVqZWHsOh5HbIH8/ZxT17jj4yjzQptDZs0l3DNpWE1yqgE05BpL6z9/xZxoqJNQZTsa8LnDEHika6JHTrl3UWnUZoS6EWBVe6GYUU6yFYD5XPhyTUkmH5AVwV9dpQVwrGdkkTmSprZm6H2Y4F69NPgnUB4j8r44pP9HsVSNi083OkLsvihtRWUUBx8WBnuLYYR9ZaBFYkpT4r6pqBRR/8PJSEHnGXYINZ9VWzC+zepGw17A+zzrK2PMDYu3SjP05idaxiNyOyhEe6LsTDcGf+Lu/mGSSQSFPVGE72TQLPrkc2qzJd5D4qHWffsvFB20ogOeERlbtzTIjZgLxIpl0PPzBG+P/qKWx+fVngQ5lXeIrcV9/UhtUl8H08S7hYIe0A+GJt9htl08x5mvXnyPt6V7wOpADgSoYty2S4FIFrePZar22FXBKUGDUgvKXH4w0NU=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(376002)(136003)(346002)(39840400004)(396003)(956004)(6916009)(8936002)(8676002)(36756003)(6486002)(66476007)(38100700002)(2616005)(66556008)(31686004)(5660300002)(2906002)(66946007)(53546011)(16576012)(26005)(316002)(186003)(4326008)(31696002)(478600001)(86362001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bUFrc25qZlYrVzNuU3Jjc1JTMTlYemgySHZIQldDVEdVK3hRbnlHeVBKSmpI?=
 =?utf-8?B?OUNZVlJxODIxck1qb0JtRTM4R1ZWcXlvdms1Y2lGL1l4aGVYakRuNm1kRFZx?=
 =?utf-8?B?VUtMdmk4K3FmVzdyR3lRdTBqWHBIRnhnalZwSGlHb2o5akhhNnVDd3dKSndv?=
 =?utf-8?B?V3VKWnVyMWcyZUZuc2MwTGFsd3dkMUJ6SnNQN2hpeWtoNForS3RXYmJQMTZS?=
 =?utf-8?B?cjJickpzRlAvUjJIaDBuRVZReXJjMk5VOUlnMkYza0U0WGlURjd2eWlJcHlF?=
 =?utf-8?B?aFU0c2MxVXlnbFJDNXR2dmRPT3owdFE3eGxMbWh0Wis3OXdsZTFycDRMTEx5?=
 =?utf-8?B?Z210K1QyNEtmZ1oyU3hVRTRPdUk3c1lxQmwxWFNXMzd5T09vUHBkNDFmY0Er?=
 =?utf-8?B?dFRUbTZzWXA0VjRMT3RhQWZvU0M2akMrSzhNYlkySyt5L3hRUHFPbCtJT0RV?=
 =?utf-8?B?VEJwamRXSU8wMWJyZjY3WFBoQ1VTWmNvWVZxNjBYeFZBaFVHanRDUExPWXFq?=
 =?utf-8?B?cGlwZ3E4T1dzOVlmcm4raS95c1FsdnJ3QUFHeXNkMGJTckhoODRSck5rZ0xY?=
 =?utf-8?B?VkZpRnhQUTlpMExQbFkwRnZBdFFuRWJEemxqdG9FN3FjcXlXZ0IrdWFSMllJ?=
 =?utf-8?B?RnlzbTVoZytJc0RRRWU0aDV6MXFwVjFsdlNrRENEc0pyQVpoWGxtdE04L0Vr?=
 =?utf-8?B?M0xxd3N3THdGUTF3VEM5QjBCM3I1MEI1UzVhUHZOa1ovc2REVzN4djFXbGlw?=
 =?utf-8?B?L1FiU2F5MXpweVlLcEFRbzJtN1Z5NVFiR2I2VTk0ZUhVamR3SEwwM0tzaEVs?=
 =?utf-8?B?NnpvYnRrVE5PejlTUlZ1OW05REhsVFVTSEtMOUZEWkcrQmMrT0FMQU1tQnJI?=
 =?utf-8?B?UHZ3YzM4bHRyMzFMUkxDbzVtem5XdENMMXYxNjVmQzdVSzh2Tk8ycC9hU2FG?=
 =?utf-8?B?VzlubGp5UzNZOG5aU2pwU3J6aUttc29NUWVDVXdjblJlcjF1M01hWjczZWha?=
 =?utf-8?B?b0dEejdBOXZtT05UTDUzZGhmMVA3SFdVa1NZVnZhUUl0cG5uV3lhZmRVMytD?=
 =?utf-8?B?UUtpR3NTTlpxcU9NS3NMajJXZUZ2dG9WWkQxYzFmWGJnbFJ4aVA0eWlmN2JQ?=
 =?utf-8?B?b1JDNGdhdm8zaDdpbU5Ca2NWMGk2d2NrKzlBeVFUNFpDazJuVjR3M21QemtV?=
 =?utf-8?B?ZGFhZEVIRU9aZ1AxSGx6KzRHblRINnFoWklDWi9VaitrbTVFc0xwVkhRU0VV?=
 =?utf-8?B?cWtMZkxYZDZWQjk2US9jZVVBMGE0eFIxL0U3TUtsM2hrR3FtM3RManNHcFoy?=
 =?utf-8?B?NWJNUis3amFhN1I1U0FjRGk0OUNaaldFcWdOT1lDK2gxb2F6Y2drUW5adnR4?=
 =?utf-8?B?cnVVakVGS3hWcWVCME9nTDRxckNvaml1V3AvTVNDWGJGc3VpZi9uUkJpaHRD?=
 =?utf-8?B?L1g1S3o5TUpzQUhwSGZ3Q1I0SHQvKzlsT3lOcnR4eisxUXc2cG5qTkZieGlS?=
 =?utf-8?B?a2pjdkVPejNSbkViSERBb3hHb1d6U1hpTjlEV2hEUEFUZUJPeXJxeHNMclVE?=
 =?utf-8?B?Vk12anlRNXNEbWxuZUl5ZmxwdEx6cWFndHJnOXJON0l4WGVqTlF2SkpQclFh?=
 =?utf-8?B?VkQ1VStFMUovdDlXNzRMT2EzaW5PWDBRSkpoOXdTRnpYc2EwMEVOcWhIdHRP?=
 =?utf-8?B?alFvK1V0WHNzTXQvZk5lbW5DNHF0YWhnRDZKdlMyKzV1RDBQUFdSRnc0YmQ3?=
 =?utf-8?Q?yfyU7+dhB/WLQKAhJ4RbmDotJDioHl7md9RqYy0?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: aef42afa-812f-4965-f62d-08d967db5351
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Aug 2021 15:16:34.4464
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: N1luk67+VpE+4zxKV7dv+cDiv4+LF1UgzK4vGbpOd8HcFFDnd5aLjEHwJ4expJKNyhoCc37DmBBI6VfKKrhx6Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB3120

On 05.08.2021 16:06, Daniel P. Smith wrote:
> @@ -747,16 +747,16 @@ extern int xsm_dt_policy_init(void **policy_buffer, size_t *policy_size);
>  extern bool has_xsm_magic(paddr_t);
>  #endif
>  
> -extern int register_xsm(struct xsm_operations *ops);
> -
> -extern struct xsm_operations dummy_xsm_ops;
> -extern void xsm_fixup_ops(struct xsm_operations *ops);
> +extern void xsm_fixup_ops(struct xsm_ops *ops);
>  
>  #ifdef CONFIG_XSM_FLASK
> -extern void flask_init(const void *policy_buffer, size_t policy_size);
> +extern const struct xsm_ops *flask_init(const void *policy_buffer,
> +                                        size_t policy_size);
>  #else
> -static inline void flask_init(const void *policy_buffer, size_t policy_size)
> +static inline struct xsm_ops *flask_init(const void *policy_buffer,

Please use const consistently between real function and stub.

> @@ -766,9 +766,12 @@ extern const unsigned int xsm_flask_init_policy_size;
>  #endif
>  
>  #ifdef CONFIG_XSM_SILO
> -extern void silo_init(void);
> +extern const struct xsm_ops *silo_init(void);
>  #else
> -static inline void silo_init(void) {}
> +static inline struct xsm_ops *silo_init(void)

Same here.

> --- a/xen/xsm/flask/hooks.c
> +++ b/xen/xsm/flask/hooks.c
> @@ -1745,7 +1745,7 @@ static int flask_argo_send(const struct domain *d, const struct domain *t)
>  long do_flask_op(XEN_GUEST_HANDLE_PARAM(xsm_op_t) u_flask_op);
>  int compat_flask_op(XEN_GUEST_HANDLE_PARAM(xsm_op_t) u_flask_op);
>  
> -static struct xsm_operations flask_ops = {
> +static const struct xsm_ops __initconst flask_ops = {

__initconstrel please (I thought I had pointed out the difference
already during earlier discussion). Same for SILO then of course.

> --- a/xen/xsm/xsm_core.c
> +++ b/xen/xsm/xsm_core.c
> @@ -28,9 +28,17 @@
>  #include <asm/setup.h>
>  #endif
>  
> -#define XSM_FRAMEWORK_VERSION    "1.0.0"
> +#define XSM_FRAMEWORK_VERSION    "1.0.1"
>  
> -struct xsm_operations *xsm_ops;
> +struct xsm_ops xsm_ops;

__read_mostly?

Jan


