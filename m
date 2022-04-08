Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A1BE14F9146
	for <lists+xen-devel@lfdr.de>; Fri,  8 Apr 2022 11:02:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.301246.514069 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nckVM-0007G1-Kh; Fri, 08 Apr 2022 09:02:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 301246.514069; Fri, 08 Apr 2022 09:02:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nckVM-0007Dg-Gj; Fri, 08 Apr 2022 09:02:08 +0000
Received: by outflank-mailman (input) for mailman id 301246;
 Fri, 08 Apr 2022 09:02:07 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=tFry=US=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nckVL-0007Da-AF
 for xen-devel@lists.xenproject.org; Fri, 08 Apr 2022 09:02:07 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 904cae19-b71a-11ec-8fbc-03012f2f19d4;
 Fri, 08 Apr 2022 11:02:06 +0200 (CEST)
Received: from EUR03-AM5-obe.outbound.protection.outlook.com
 (mail-am5eur03lp2057.outbound.protection.outlook.com [104.47.8.57]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-25-KDQrQwzHP9CC9fudRQ8qOw-1; Fri, 08 Apr 2022 11:02:03 +0200
Received: from AS8PR04MB8609.eurprd04.prod.outlook.com (2603:10a6:20b:424::9)
 by AM0PR0402MB3843.eurprd04.prod.outlook.com (2603:10a6:208:12::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5144.22; Fri, 8 Apr
 2022 09:01:48 +0000
Received: from AS8PR04MB8609.eurprd04.prod.outlook.com
 ([fe80::48e:2a59:a71b:d6dd]) by AS8PR04MB8609.eurprd04.prod.outlook.com
 ([fe80::48e:2a59:a71b:d6dd%8]) with mapi id 15.20.5144.021; Fri, 8 Apr 2022
 09:01:48 +0000
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
X-Inumbo-ID: 904cae19-b71a-11ec-8fbc-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1649408525;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=2l5XVfc3HnYN8zk/7bqg4CjtKczWdpVE3hLQeczu80Q=;
	b=aHWaqS5jtBsEeBvTetIfzNygJxKc75n3nfJDHuxHFXaPRtJ3IbFzpUTdYU/OVrDxIQkL+j
	yrrjddVRbtlZFTGaHMqIQNsnZqMusyG2VmJOtLSlPWUa3mc+nqO+VEdM6EFsjr88VXL0jn
	a9BAo/irn5Arq4RytD5r0EoeOKtLCzI=
X-MC-Unique: KDQrQwzHP9CC9fudRQ8qOw-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kUd+0J/HFdQRI2AGQ+s2o6fIerCPFwAVWHthepyg9s6FfBJz9mPIwRu/V1kGtgYe9QH7YZGP4vqkZwOTvNJW95nTrlEVluOAgzO44kdcHmV4abmEFlZfMABkkD3DZ273ULgbJClCdO6PjoVe5AFsymVMv7lD6z15ukne9XTKCozypn45yoeEwt8+6bBUg0iwxyTUtNXvIiSgk2e08KVo+r+irALJoSyIqo905NxtOQpg+TgCgluQbBV1OcE5QaXch/NLcle/7E8/caP7Pnl+/CKfRRKWPhF0/sVKXahYQqtWa7O2eEmZXbPySM43cHP4x4y0l/C4dFPgmfMxGQiP2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2l5XVfc3HnYN8zk/7bqg4CjtKczWdpVE3hLQeczu80Q=;
 b=fpOExsJSSI1nd3sMf1qsfxm/GIqskvsRSNcJCuBVgdhNeXs+0jjMeY/2KOHP87fWOok23npVPPBWq3bs7LOkNtnYrem0U60Lbd59vhu5MCskIZzemvLoSWRwvb6u+ZaXG8kyxEz7D+Odj6iLLMlkVMqBL7VFnt0yIGtH5G6gPGy/2iFPoMvyZ0otvoCqYoHm/RukkpEvGfYpumPWdJjb53kdx+pT4sszxlDCB7sq1PEXwMeLUnxClMR8UNFnAbhMcGWykNBNbKJE0nFhB2NqNikErdKvUpJR/MdaG0JCDTcy+PglSOvQyMsFybWZEQZXh4NBPYgobAn8rK0LfHSTXw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <93aac581-8105-c8e5-f7c9-fca850667f33@suse.com>
Date: Fri, 8 Apr 2022 11:01:46 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v6 4/6] xen/cpupool: Create different cpupools at boot
 time
Content-Language: en-US
To: Luca Fancellu <luca.fancellu@arm.com>
Cc: bertrand.marquis@arm.com, wei.chen@arm.com,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>,
 Juergen Gross <jgross@suse.com>, Dario Faggioli <dfaggioli@suse.com>,
 xen-devel@lists.xenproject.org
References: <20220408084517.33082-1-luca.fancellu@arm.com>
 <20220408084517.33082-5-luca.fancellu@arm.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20220408084517.33082-5-luca.fancellu@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS9PR05CA0024.eurprd05.prod.outlook.com
 (2603:10a6:20b:488::23) To AS8PR04MB8609.eurprd04.prod.outlook.com
 (2603:10a6:20b:424::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e413d31b-f42c-4ecc-86bd-08da193e6a03
X-MS-TrafficTypeDiagnostic: AM0PR0402MB3843:EE_
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-Microsoft-Antispam-PRVS:
	<AM0PR0402MB38432B79045EA7788A511751B3E99@AM0PR0402MB3843.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	3zAQgUvsl/d4woB/4S/WW1DvGcLKmegrKxR6j9F8eDbQIUI3ei+17fQ40zhjaE7u8aj11xzAZnTjtx4gQPvHEyHe+mZkSCk6odVzj+BqaXNCUiwWYiTpkXOBYaoUVz61bcJ3JWpXKFbHFLFdHTI5Xv6kJHMoMm1i4XTimWCuxk4URaNS5j6/JubyHbwr6AHIKkbpnABwQfDOd6EtXC2KFQ71m2qwZBMJNncooR9XDBEG4nFxQif5LBNYa8KZqrz8i8fn/aTw0TbQMIDaG6n6+YLAna9oEmhbZ9uJAEWkhDqBtfgx88yPPjk8s9G5I/c4FQf9jaCFlzO4EEmeEhdsj78/U5WsqNZq5jBsDeJb2tF1fR5RqhOs4cwBO3FiMozEtj+vwSzN0TFLgmFNVZNgDILv01Kkv9KCvXylJYk7nOChJ89rN4M5tT9aSZSKa+b3J/KD98lqhBpqUl4WTbfbuqyZhcznpqp8wV07TdeA8NCAm/z+yOTG+fFqBZrx2+7X7M1A6DJzVlzzrIyB0Tc4G1vDrg4Bofkh2DU0dtW/ycsccN12t80evHc4OZ2X2ILw1THPZpbypNiIvNhJXFJbPU6SXkULIgTqQ+F1R/PNU737PTSHDoUJH65L+xmc4GdY+TM06XU5LVZIBewoudJrvb4G19X8a0GrggvCsVwySKpk1ylGQR+7+/NYFAdMr0+HKyNgZJK7WvRUQR8DpLIWVD85R2qFluzM7L/eGQliv+g3uos+jQ6sWRRrCuPtw6BG
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8609.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(31696002)(7416002)(83380400001)(31686004)(316002)(2906002)(66556008)(6512007)(36756003)(66476007)(8676002)(4326008)(38100700002)(66946007)(86362001)(6506007)(53546011)(5660300002)(2616005)(6916009)(54906003)(6486002)(508600001)(26005)(186003)(8936002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?YUsydU4yVVdrOGo4UGVMOVlnQmN3a00yUGdRTjhzYXdPOFduK1VRaHY3c1Z1?=
 =?utf-8?B?WGEvVWxrb054MWV5L3FlUG8xRjNaWHVXSU1NYWkxcGNTZ2tKSjg5Z0xPckJW?=
 =?utf-8?B?OXc1bktVZzVXSEpKNkw3OENLQS91RVB2U1VrcVlLb0tHWisxdGZYS3hsNUg4?=
 =?utf-8?B?SHhTWWRsNFUwTk5CYWQ5SUtwS3pzbHBmOXZCYnlDSXhHOGlVNk12OWJzMjRu?=
 =?utf-8?B?c2ZVRFdjVTRsY2JNUHJnMUZxdFl3Z0lhenVwNk9CN1VZazhzUEQxNzFFcXE3?=
 =?utf-8?B?RzZCTmcweVAra29OUE9ScU1nSExMVTc5OC81Q0FqUmJMZUdScXVWUjVrUnJO?=
 =?utf-8?B?N3Z1SXBRL0NuOEE3RGdmK09LbEw4T0RnWFpwRUJSZWVEUDQwUE4vVWh1Mnpo?=
 =?utf-8?B?WjhFQ2Q0dFduUWRnNjNsZXNEaytiekFXaXYrK3FFR3R0Rnc4Qzlkb1JEelB6?=
 =?utf-8?B?Rm5OaVgwQ3piQXhMd1YyaVEvTVZ6a1JFUjVnRkpxd0pDWi9nSlhiejNUMjcy?=
 =?utf-8?B?anFDb3hTUjdTWkppTUZYQ2ZRSzJCNU9hWmRaaDNKbW11V2ZUOGIwTzhlWUVl?=
 =?utf-8?B?QU8rM2hMaWJSY3JLSUIwT0NVMktQT0xjdHF5aWNJcE9vZjVFYk1sZFF5Zlpu?=
 =?utf-8?B?ZXpOUmdZMnhJU2IrWGh4Z3Zaa3QrRHlVekgzSmZ3VVljK3k3VXN1MzlYN1NM?=
 =?utf-8?B?SE5SOHVFUmZWNVR2QjhvUDhyYUJvZG1YZURUTVI3QTQ4UEpUb2ZLWUlaTGJH?=
 =?utf-8?B?dmdoQ1ArZFczeTJVSDVCYW1ZSUR0cTFlRnZFOFc5Z25WV0srMHE0NEIvWCt4?=
 =?utf-8?B?TTk3WmUxNVQwakljUkxRVmorTUtlMlVTaGs2VmYrVEVXQXNJNFpvcTNHdmpE?=
 =?utf-8?B?R1JsMWxJcS9rdDV0K0xGdGY3d3JjcWVPYUVTcnh3ZDZrQlhSbjcveTVCQisr?=
 =?utf-8?B?c2UrazAyM05OYVNTRjZoaXRKWDc3eVo2TEw0TmltaGp5VEhUeFZwUGRqUUpP?=
 =?utf-8?B?aHFHYmVtdUdEdzRTRHJVTkhFM1BxQUJ4UTNwL3p5QUNoQVlkZE5GNXJtUS82?=
 =?utf-8?B?VDFDN0NNZEQ3RE5ueDdPNThXY1g3UUV2c0puTjZqalBmZlZGeDE5ekZLVDE3?=
 =?utf-8?B?WFJVWVRUMTExdjJRdThpQjVBSTE5N3lQdVhQVCtHZGdjTDZZRm9ra2ZiOUxB?=
 =?utf-8?B?Mm9WNHdMWWdtTlIzQXZXZU9Ba0ZtT0crc21PQ1pKMlRGN0F4Yjl4UGxzb0FD?=
 =?utf-8?B?SkVtMWxmU3FPekM3NGYrTGxjUlIrbWFzZUJYdUtoRFJHVjdJZWdHM2h1Uklh?=
 =?utf-8?B?aEsxZTRLRlhhMzYzaVZ1U0R4V3R6cUZLQ2lNVWd6YTJjV2k1RFZwa1dFWUZp?=
 =?utf-8?B?RHlVNmlTN1hFZmNYWFl1SS9aUWtidms4NVpVTE95L2tuTlZaRzRkeUQ4d0xi?=
 =?utf-8?B?bEpNMXV4akNpQ1BpSldtVkJsYklRai9GMUIveUJmb0hiNnkzUFVpSHQzWElL?=
 =?utf-8?B?TkxYL1VHMVdXQWROR09PUHRzb01pNHNVQkZvMGRyYXpwMWRuOWtxR21sSDZX?=
 =?utf-8?B?ZXc1OG1FLzJBS3Vmbm14b3dESFdmcDhqV2M5OEs3K09NM1VXeC9KdDJZS3g1?=
 =?utf-8?B?b21jcU5ETWpXb0ZBbkNrek5VaENoWmczRFo0WThnTlNwM1kxY1Exekd2UFF3?=
 =?utf-8?B?SzYwMjRYMnpuM0M5Z3I4b0Y0SHE5ZXVjdkpTVUZEUSt6MlZWai9ub3hSODkw?=
 =?utf-8?B?czErdDRSOE9RbzZZSkVxdW5Sczg1UWRzamJQc1U0WnJudVp2cHBIMW05NmVk?=
 =?utf-8?B?QkUzcS9HY1pna0tTZzUwM09mWHkzV1VleGtpelBUQUkyWkl1M0FIbmVLZHZ2?=
 =?utf-8?B?aGI3VTY3anlncDhpY1dSZng4K3VYYVcyN0xFN2l3RXg3Nm9YUEtFM04vWkov?=
 =?utf-8?B?QVlXWlBkemZQaDhzeXMwbTB2dUk1YVZUM0ZnZzlKREpCcks1RkNzMUNaQm94?=
 =?utf-8?B?M0s5UjBhc3VqUXZjdjY2Yi9PWG40WFllOTJ2dzgzVWpIamVVMVRQWTk1YVZO?=
 =?utf-8?B?dyttNGY2K1hyNVQyMHN3aTlpdHkvM2hJNGhQT1JSNnZFNE05SGpMbEl4aEhU?=
 =?utf-8?B?STJDWGc0WjVRcERJUFZ2MUUxRTMxK0toSHh3NlRJaVFSYTRXSjJaelBOMVNv?=
 =?utf-8?B?elJBMDZXYmNaL1N2azZwRnU5L0tQQlQ5Ykt0WDNZMC9zT2lDcGprVHdGODc2?=
 =?utf-8?B?emlJZXA3N3hhTm9SZnZMYnpYWjIzRWVDMk9vUjcrR3NmQnpldm40bjNYZ3do?=
 =?utf-8?B?d3hpcm5Ec3pHazBKaFRkaDV0MFFDWlJJNTRSeWM4NEJ5MXZJQzN0UT09?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e413d31b-f42c-4ecc-86bd-08da193e6a03
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8609.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Apr 2022 09:01:48.4566
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: E0y/SimX5E+fGKTYRFw8zA4VmeKWkLVGk2XdxNd16jf4Nx9cXqKPR39dlYTuWuu9Lm2dnXJkTyWxZr/wMiCncA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR0402MB3843

On 08.04.2022 10:45, Luca Fancellu wrote:
> ---
>  docs/misc/arm/device-tree/cpupools.txt | 140 +++++++++++++++++
>  xen/arch/arm/include/asm/smp.h         |   3 +
>  xen/common/Kconfig                     |   7 +
>  xen/common/Makefile                    |   1 +
>  xen/common/boot_cpupools.c             | 207 +++++++++++++++++++++++++
>  xen/common/sched/cpupool.c             |  12 +-
>  xen/include/xen/sched.h                |  14 ++
>  7 files changed, 383 insertions(+), 1 deletion(-)
>  create mode 100644 docs/misc/arm/device-tree/cpupools.txt
>  create mode 100644 xen/common/boot_cpupools.c

Under whose maintainership is the new file to fall? Without an
addition to ./MAINTAINERS and without the file being placed in
xen/common/sched/, it'll be REST maintainers, which I think would
better be avoided. Would it perhaps make sense to have this as
xen/common/sched/boot.c, allowing other boot-only code to
potentially be moved there over time? This would then also avoid
me asking about the underscore in the file name: Underscores are
a somewhat artificial thing for use in places where dashes can't
be used. Yet in the file system dashes are fine, and dashes are
(slightly) easier to type.

Jan


