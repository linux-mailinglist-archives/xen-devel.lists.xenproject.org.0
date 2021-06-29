Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 52A783B7593
	for <lists+xen-devel@lfdr.de>; Tue, 29 Jun 2021 17:37:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.148051.273446 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lyFm5-0002SU-Hn; Tue, 29 Jun 2021 15:35:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 148051.273446; Tue, 29 Jun 2021 15:35:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lyFm5-0002Pa-Cl; Tue, 29 Jun 2021 15:35:45 +0000
Received: by outflank-mailman (input) for mailman id 148051;
 Tue, 29 Jun 2021 15:35:43 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=wA62=LX=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lyFm3-0002PU-6s
 for xen-devel@lists.xenproject.org; Tue, 29 Jun 2021 15:35:43 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.111.102])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 98e0d57e-69ba-4c6e-b300-c5d2d22cfb0e;
 Tue, 29 Jun 2021 15:35:41 +0000 (UTC)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05lp2113.outbound.protection.outlook.com [104.47.17.113])
 (Using TLS) by relay.mimecast.com with ESMTP id
 de-mta-6-YjG3iKdGMHOGk3lTp28SGg-1; Tue, 29 Jun 2021 17:35:39 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB5328.eurprd04.prod.outlook.com (2603:10a6:803:59::25)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4287.22; Tue, 29 Jun
 2021 15:35:37 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::99d3:99cd:8adf:3eea]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::99d3:99cd:8adf:3eea%5]) with mapi id 15.20.4264.026; Tue, 29 Jun 2021
 15:35:36 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AM0PR01CA0170.eurprd01.prod.exchangelabs.com (2603:10a6:208:aa::39) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4264.19 via Frontend
 Transport; Tue, 29 Jun 2021 15:35:36 +0000
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
X-Inumbo-ID: 98e0d57e-69ba-4c6e-b300-c5d2d22cfb0e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1624980940;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=URLnnwCsKBkaRrg2bq5VfQAyb6TPlECEcaLBS5kAmfk=;
	b=N1qvcKvCN1eBN/NfutIVaDVBzupOF4UXjPHDO25psYlEUTEGjCbf7M31H9rtJfEn5Ody5o
	gsqTgUXK/WAM6UQAHQdzMM6BjsbegWhPIyv92IJK9n0kXAZ3lm+5L11f8LRbAF8D3l1jif
	0cuh0z6mQEvoH+z+Ms9yxW+vCTvX48A=
X-MC-Unique: YjG3iKdGMHOGk3lTp28SGg-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=c/nmr1M9CAjlFApM2wA59xlBntQaL1gMFhkf9i4Cuzz+cEKaGAAXtjrszCHvolkVpWedDWj2cgWESe2UhnFFstJG0vJQhBITz/6nBB9YcJzEW5gZMdovxD42x4lsZTH1z9El9DLu8omX5k8VGnswypJUJYRd9vUmmFpF35zxLSbcy/T3niQFKq0wK2JD2g5865pzq9Zw6DPvZ+Erg6r7qBa1lRB7dKQN39YqeqO0+cvmhvv7gKZfaMUwXBR/aL/hIUfefs8sB+oV7sUPcgr2jTFUDIjDafqSVpefXQNE3IQ87jfDFw5JwD6Oo0jmERXX7OEHDIpXluTseyt14OpcrA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=URLnnwCsKBkaRrg2bq5VfQAyb6TPlECEcaLBS5kAmfk=;
 b=LK55jjbtBR5qqBocSQzRBHERZTkj8t7aaagFlhXsze1gYibGwFD8ULPDZ+i1B+DyuZAmzwKXKNzzw73NIP849bBNtvFiT6iNlsnlVfnCBq3Cp2FkYtb23Ig+LxwN8fpjsA5VXkbsZwXG22bJVtQxEbSGhLzLy4jbjA3wjDQSxslPrgQeEijX1X7kHSD/TbyyNj+/LM2+6Q7l8ERs6nE4NUBt10DS3X26ABv98ZBGxtD2PQHMwcBr4S7omFmIsX2tgD2TDmLlJ5jekduRF0eX0VV7fQT0N2bprvZJ5KaqnpwB0XvqNdmB97lMTn3E3YmUc3A0ISzDJleVn3r/ihacCA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=suse.com;
Subject: Re: [PATCH v2] libx86: Introduce
 x86_cpu_policy_calculate_compatible() with MSR_ARCH_CAPS handling
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20210628150011.13106-1-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <44f88dea-f39b-d6a9-acd3-dc1aa12bf25a@suse.com>
Date: Tue, 29 Jun 2021 17:35:35 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <20210628150011.13106-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [37.24.206.209]
X-ClientProxiedBy: AM0PR01CA0170.eurprd01.prod.exchangelabs.com
 (2603:10a6:208:aa::39) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4e7f9df0-8bcd-49b6-c4ac-08d93b138a9f
X-MS-TrafficTypeDiagnostic: VI1PR04MB5328:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB532835B201BD7365548CAF0FB3029@VI1PR04MB5328.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5797;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	KPLHLHGUDG4Xo/SO+KR+deYpSG/yiHyMqbjJWAqkqQe4Yn2KMqkB7SZesAnXc1U+kOPDqJzAmQhWZo45f3A6CJnseuUTUCBRfMNoXhRrFp62ivzRV+lkCX3paWOLcaAQoa78fsPNxe0kgUco/ACwdyo+U+s4tLl6Wc68zoOV8Alk5O86hGiJD4xvKCW/LPjBkLqqvBe6Avh+zb+aAl0RfpJ1jofQ4bNkwXQ9aYGlPgJobXwsJXMnqwkJlkKJ6raxY0aq7XVjTt7moRlMvqM3aUXoON6TXSA64GLH7/NzVaq/8robQ9bv+XZUDHKCfY3qCkZMUNYUaqmo5LGot23dSxJvmF4CpVdvIliKjE5ruFGx3mmTtdvZrPkGbsCgHRji1rCNne+bV31qEySJ9NR4egtl6j+uDoTM1taXzjiqTnpN+33jZ0knVEirPl+/zsMQmmLz9sdHPZThRFpFX/EiTuD6IFMYwAKIcBH+ayvouEAlQbQCdbQI4D/hXrSdigy7VXUUSFLzu51DivWQwDuQ0BD9L6BOAMCNfq1wdz1yIY6nF3rm+LMzjgPkEdddnQKq34XWAa4Xt1PWwsoZ7Ymz5XvmOypQIxk4s1EGXD2Fmc5QIOZ0xyerInpcv9+YF7bciqFbHStEahdYVB9M0szcLXbEASwCPJt1/ym1yZ1LNYOZlcsVAAfUxM8k2G1ah1Uj3lTrwmpyWYUwAQPRffOYbQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(346002)(366004)(396003)(39860400002)(136003)(376002)(31686004)(2906002)(316002)(16576012)(53546011)(4326008)(8676002)(36756003)(66946007)(8936002)(54906003)(83380400001)(66556008)(66476007)(16526019)(86362001)(2616005)(38100700002)(6916009)(186003)(956004)(6486002)(31696002)(5660300002)(26005)(478600001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VjAzVDlFd2JqLzdtRFVINWg5MFpnUVlSVWQrenFteFZodzZrVlp4a3RTT25Y?=
 =?utf-8?B?NlAwY3Ryc0ZuWVVDUjNMQzBzOVZUbXg1Y1NwaWhGMXpSL0pRd3hVaWh1azFE?=
 =?utf-8?B?QUZlUHl1T2JLRlM5bCtmaHJ6ZEtESHlRYkZLbHVYWXFHbTRHUG5WRS9HV0xI?=
 =?utf-8?B?YUVJMFZ0c1RHeldyei9GdzI5ajBreWEwcU9CWlVod293ZVBwWnNrcmpWSE00?=
 =?utf-8?B?Ums3OUtOSCtTS0xFSjZ5MlVvTGl3a3d1a2lPR294YXJQZExsTktudHkzeDNh?=
 =?utf-8?B?SE9MREo2RGhlekZLeGdrVHowY2NyemUyS1ZNVjBvaFJWbDcwSEo5NGp2aTVI?=
 =?utf-8?B?L0wzQm9tU0JIKzNobWVQd2RvSldmM3FvWEt3ZVFxNU01cUVvdENmcUJkWWVl?=
 =?utf-8?B?VEpOYnIrd1JsUmFTMmp2RW1QMlNsakRqNlVEak9QMHdLOWlnNkhoU2daeFBB?=
 =?utf-8?B?VC85SktVMVVZa0NuVCtvenVZNndxZ0VSZG5hUWI0Y2M1SzBFMlR3ZWtrWU5z?=
 =?utf-8?B?ZGQ0eGNvMlVtcXVRZ2t1S25UQnlFaThqSFNYVnZTc052OGtTNGdka0FVOHU2?=
 =?utf-8?B?dkdjZFlXcXo1Q0h0RTUrUnBTNkxiRk12Tndpcy9uMDNjYWY0V3dYOUY5N0tj?=
 =?utf-8?B?YlYvN296QWtIZlBoczYzM3JZck1wREJDdDJQZTh0ckVub2FCRFEzTkZJaWdT?=
 =?utf-8?B?U290dXRuWlh0MUFzQUdlN0N1UjFsMmFnVGt3Y3FWeUN0RWYyKzVnRU5mZEo2?=
 =?utf-8?B?a3dmRUErV2JjbHYrUnd4K3hienFmYURTVTFtck9lTlJxRkR1b0ZrSFdSbEhv?=
 =?utf-8?B?VjVldy96Sy85cHlSWFNkTEFKbERVTlF4QWsrWElOQ2JaWDhSR1h5Q2ZpZ2R6?=
 =?utf-8?B?SXVQR2ZqWjhMT05qQjdjR0VNUFJXamdvR05rRkFQZzVtdmJmTEJBbk5TZU13?=
 =?utf-8?B?Tkh6U1BycHdEdzEzWnJtQTdodHU2TUxPS0ZjMy9UTG9sb1VkbitSd0U1Yno3?=
 =?utf-8?B?SnF4aU9XdDUyKysvcEFINUExZ1FHWld0ZVBxRGIvY0d3STJLN3BvK0JrNjdZ?=
 =?utf-8?B?UEVTbkZHSk9jMGpoQjdBczNaeWthcENiakNNcHQ2YWJEZlkwZTBKbVpqTm1W?=
 =?utf-8?B?MGtQRmwrdUV3Wm5HRVo1Y1BJK1RORG9ib1E1NTJDaENBMGI1Qk90Rnp3OUt3?=
 =?utf-8?B?dUg3ZFJMeU92NHRDV1B4bjEzdzFqdDVacGpmSTFzMzkzV01KY01FSGk3YS9u?=
 =?utf-8?B?cnVpZTgzTU93TDdYcFBmWlovajVyc0VDS084VmNJNmROSU9HdXRONWJrZmZ2?=
 =?utf-8?B?UlJPd1c0Vm5QMzRDRDB1RkFEbzd4a2dnOC9CU3hMNSt5aGFUVWpINnN2TEpN?=
 =?utf-8?B?dWxFdGJWQVhuMGtsN2YyeE16MzZ2Yk0reVQxNVM4aTZHZkN6SnJnc2VSUmJE?=
 =?utf-8?B?Z29nY1BWWENhTFVGTFc3U1Y0K0dCaU85eXNCdHE1SSs4aGw5QlZpZ3BRNmJi?=
 =?utf-8?B?YlRJcURlTW8yekNDYzU0SzE1V2oxZ1RyRC94N1hwYmFkMCtTamJGWEkrb3Qw?=
 =?utf-8?B?M1J0Rk5zMG9WQ2RXWEo2cmtEbDN2K0VyTEJseGtHdStFdVY2OTBYbnk1c3JE?=
 =?utf-8?B?YXRXd0xXc3pNUlhucmZjMnpUd0wwUllYdzV1QnZCK1k3bnlwekwxZ1A0SE9a?=
 =?utf-8?B?U08rcFV3Skxnbk13K1VFNENFak4vbEhjb3drNVdQRUkyc0NDYmo5cjlySGhn?=
 =?utf-8?Q?W2QIxFReOr7qojCVdR4uPJKEupwaaYhktuHnNQf?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4e7f9df0-8bcd-49b6-c4ac-08d93b138a9f
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jun 2021 15:35:36.8038
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rLg7GkbGJ8oO5qxDHnrlFuJ94CYcNQKdNtJ5Iny+WflgWBM7+rnf4PH1einECAwsf2M3P6zwinCHJhIFOQgjsg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB5328

On 28.06.2021 17:00, Andrew Cooper wrote:
> --- a/tools/tests/cpu-policy/test-cpu-policy.c
> +++ b/tools/tests/cpu-policy/test-cpu-policy.c
> @@ -775,6 +775,154 @@ static void test_is_compatible_failure(void)
>      }
>  }
>  
> +static void test_calculate_compatible_success(void)
> +{
> +    static struct test {

It's only testing code, so it doesn't matter all this much, but
elsewhere such static struct-s are const.

> +        const char *name;
> +        struct {
> +            struct cpuid_policy p;
> +            struct msr_policy m;
> +        } a, b, out;
> +    } tests[] = {
> +        {
> +            "arch_caps, b short max_leaf",
> +            .a = {
> +                .p.basic.max_leaf = 7,
> +                .p.feat.arch_caps = true,
> +                .m.arch_caps.rdcl_no = true,
> +            },
> +            .b = {
> +                .p.basic.max_leaf = 6,
> +                .p.feat.arch_caps = true,
> +                .m.arch_caps.rdcl_no = true,
> +            },
> +            .out = {
> +                .p.basic.max_leaf = 6,
> +            },
> +        },
> +        {
> +            "arch_caps, b feat missing",
> +            .a = {
> +                .p.basic.max_leaf = 7,
> +                .p.feat.arch_caps = true,
> +                .m.arch_caps.rdcl_no = true,
> +            },
> +            .b = {
> +                .p.basic.max_leaf = 7,
> +                .m.arch_caps.rdcl_no = true,
> +            },
> +            .out = {
> +                .p.basic.max_leaf = 7,
> +            },
> +        },
> +        {
> +            "arch_caps, b rdcl_no missing",
> +            .a = {
> +                .p.basic.max_leaf = 7,
> +                .p.feat.arch_caps = true,
> +                .m.arch_caps.rdcl_no = true,
> +            },
> +            .b = {
> +                .p.basic.max_leaf = 7,
> +                .p.feat.arch_caps = true,
> +            },
> +            .out = {
> +                .p.basic.max_leaf = 7,
> +                .p.feat.arch_caps = true,
> +            },
> +        },
> +        {
> +            "arch_caps, rdcl_no ok",
> +            .a = {
> +                .p.basic.max_leaf = 7,
> +                .p.feat.arch_caps = true,
> +                .m.arch_caps.rdcl_no = true,
> +            },
> +            .b = {
> +                .p.basic.max_leaf = 7,
> +                .p.feat.arch_caps = true,
> +                .m.arch_caps.rdcl_no = true,
> +            },
> +            .out = {
> +                .p.basic.max_leaf = 7,
> +                .p.feat.arch_caps = true,
> +                .m.arch_caps.rdcl_no = true,
> +            },
> +        },
> +        {
> +            "arch_caps, rsba accum",
> +            .a = {
> +                .p.basic.max_leaf = 7,
> +                .p.feat.arch_caps = true,
> +                .m.arch_caps.rsba = true,
> +            },
> +            .b = {
> +                .p.basic.max_leaf = 7,
> +                .p.feat.arch_caps = true,
> +            },
> +            .out = {
> +                .p.basic.max_leaf = 7,
> +                .p.feat.arch_caps = true,
> +                .m.arch_caps.rsba = true,
> +            },
> +        },

For RDCL_NO you go through quite a few more variations, and given
the accumulating nature of RSBA habing a similar set for it would
imo be quite valuable, not the least for people like me to see
clearly what behavior is expected there.

> +    };
> +    struct cpu_policy_errors no_errors = INIT_CPU_POLICY_ERRORS;
> +
> +    printf("Testing calculate compatibility success:\n");
> +
> +    for ( size_t i = 0; i < ARRAY_SIZE(tests); ++i )
> +    {
> +        struct test *t = &tests[i];
> +        struct cpuid_policy *p = malloc(sizeof(struct cpuid_policy));
> +        struct msr_policy *m = malloc(sizeof(struct msr_policy));
> +        struct cpu_policy a = {
> +            &t->a.p,
> +            &t->a.m,
> +        }, b = {
> +            &t->b.p,
> +            &t->b.m,

Hmm, I guess these two struct instances are the reason for tests[]
to be non-const. I vaguely recall discussion about having a const-
correct variant of struct cpu_policy; if you don't think this is
warranted, may I ask that you add a respective brief comment to
tests[]?

> +        }, out = {
> +            p,
> +            m,
> +        };
> +        struct cpu_policy_errors e;
> +        int res;
> +
> +        if ( !p || !m )
> +            err(1, "%s() malloc failure", __func__);
> +
> +        res = x86_cpu_policy_calculate_compatible(&a, &b, &out, &e);
> +
> +        /* Check the expected error output. */
> +        if ( res != 0 || memcmp(&no_errors, &e, sizeof(no_errors)) )

While this memcmp() has precedents, ...

> +        {
> +            fail("  Test '%s' expected no errors\n"
> +                 "    got res %d { leaf %08x, subleaf %08x, msr %08x }\n",
> +                 t->name, res, e.leaf, e.subleaf, e.msr);
> +            goto test_done;
> +        }
> +
> +        if ( memcmp(&t->out.p, p, sizeof(*p)) )

... I'm worried that this and ...

> +        {
> +            fail("  Test '%s' resulting CPUID policy not as expected\n",
> +                 t->name);
> +            goto test_done;
> +        }
> +
> +        if ( memcmp(&t->out.m, m, sizeof(*m)) )

... this may (down the road) suffer from mismatches on uninitialized
padding fields. Otoh I've meanwhile found that the new function
clears both output buffers first thinhg.

> --- a/xen/include/xen/lib/x86/cpu-policy.h
> +++ b/xen/include/xen/lib/x86/cpu-policy.h
> @@ -37,6 +37,34 @@ int x86_cpu_policies_are_compatible(const struct cpu_policy *host,
>                                      const struct cpu_policy *guest,
>                                      struct cpu_policy_errors *err);
>  
> +/*
> + * Given two policies, calculate one which is compatible with each.
> + *
> + * i.e. Given host @a and host @b, calculate what to give a VM so it can live
> + * migrate between the two.
> + *
> + * @param a        A cpu_policy.
> + * @param b        Another cpu_policy.
> + * @param out      A policy compatible with @a and @b, if successful.
> + * @param err      Optional hint for error diagnostics.
> + * @returns -errno
> + *
> + * For typical usage, @a and @b should be default system policies of the same
> + * type (i.e. PV or HVM) from different hosts.

Given this property, what use do you anticipate for the new function
within libxl? Or asked differently, where from would libxl obtain a
remote host's policy?

>  It does not make sense to try
> + * and level max policies, as they contain the non-migrateable features.
> + *
> + * Some data (e.g. the long CPU brand string) cannot be levelled.  Such data
> + * will be taken from @a, and the content in @b will be discaraded.

I'm afraid I can't spot this "taking from @a" in the code.

Also, nit: "discarded"

> + * It is possible that @a and @b cannot be resolved to migration-compatible

Nit: Missing "a" after "to"?

> @@ -43,6 +46,52 @@ int x86_cpu_policies_are_compatible(const struct cpu_policy *host,
>      return ret;
>  }
>  
> +#ifndef __XEN__
> +int x86_cpu_policy_calculate_compatible(const struct cpu_policy *a,
> +                                        const struct cpu_policy *b,
> +                                        struct cpu_policy *out,
> +                                        struct cpu_policy_errors *err)
> +{
> +    const struct cpuid_policy *ap = a->cpuid, *bp = b->cpuid;
> +    const struct msr_policy *am = a->msr, *bm = b->msr;
> +    struct cpuid_policy *cp = out->cpuid;
> +    struct msr_policy *mp = out->msr;
> +
> +    memset(cp, 0, sizeof(*cp));
> +    memset(mp, 0, sizeof(*mp));
> +
> +    cp->basic.max_leaf = min(ap->basic.max_leaf, bp->basic.max_leaf);
> +
> +    if ( cp->basic.max_leaf >= 7 )
> +    {
> +        cp->feat.max_subleaf = min(ap->feat.max_subleaf, bp->feat.max_subleaf);
> +
> +        cp->feat.raw[0].b = ap->feat.raw[0].b & bp->feat.raw[0].b;
> +        cp->feat.raw[0].c = ap->feat.raw[0].c & bp->feat.raw[0].c;
> +        cp->feat.raw[0].d = ap->feat.raw[0].d & bp->feat.raw[0].d;

Is there a particular reason to not handle this in full, i.e. for
all of the subleaves? If there is, I'd still have expected you to
at least handle _7a1 that we already know about. Failing that I'd
have hoped for a justifying comment (or maybe a TODO item beyond ...

> +    }
> +
> +    /* TODO: Far more. */

... this one.

> +    mp->platform_info.raw = am->platform_info.raw & bm->platform_info.raw;
> +
> +    if ( cp->feat.arch_caps )
> +    {
> +        /*
> +         * RSBA means "RSB Alternative", i.e. RSB stuffing not necesserily
> +         * safe.  It needs to accumulate rather than intersect across a
> +         * resource pool.
> +         */
> +#define POL_MASK ARCH_CAPS_RSBA
> +        mp->arch_caps.raw = ((am->arch_caps.raw ^ POL_MASK) &
> +                             (bm->arch_caps.raw ^ POL_MASK)) ^ POL_MASK;
> +#undef POL_MASK
> +    }

Related to my respective request on the set of tests performed, this
really is partial accumulation, as ARCH_CAPS are still taken as a
prereq feature. That is, one host with RSBA and another without
ARCH_CAPS will result in a policy without RSBA. Is this really what's
intended?

Jan


