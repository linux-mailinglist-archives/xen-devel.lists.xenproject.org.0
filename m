Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 22CCB469913
	for <lists+xen-devel@lfdr.de>; Mon,  6 Dec 2021 15:34:44 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.239143.414521 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1muF4T-0000Lx-GB; Mon, 06 Dec 2021 14:34:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 239143.414521; Mon, 06 Dec 2021 14:34:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1muF4T-0000Jp-C3; Mon, 06 Dec 2021 14:34:25 +0000
Received: by outflank-mailman (input) for mailman id 239143;
 Mon, 06 Dec 2021 14:34:24 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=0GdR=QX=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1muF4S-0000Jh-Ah
 for xen-devel@lists.xenproject.org; Mon, 06 Dec 2021 14:34:24 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9b0959af-56a1-11ec-a5e1-b9374ead2679;
 Mon, 06 Dec 2021 15:34:23 +0100 (CET)
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur01lp2056.outbound.protection.outlook.com [104.47.2.56]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-17-pNUOgj--NyGazL-3bkn5XQ-1; Mon, 06 Dec 2021 15:34:22 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR0401MB2448.eurprd04.prod.outlook.com (2603:10a6:800:52::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4755.20; Mon, 6 Dec
 2021 14:34:20 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe%6]) with mapi id 15.20.4755.021; Mon, 6 Dec 2021
 14:34:20 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AM7PR02CA0017.eurprd02.prod.outlook.com (2603:10a6:20b:100::27) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4755.11 via Frontend
 Transport; Mon, 6 Dec 2021 14:34:19 +0000
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
X-Inumbo-ID: 9b0959af-56a1-11ec-a5e1-b9374ead2679
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1638801263;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=DDU6h2HZbLdF/32bzQjhs6Ad2vWnmia5jq3SOr8EQGw=;
	b=DpBixOMZAjbBcNe1RkIaGnptvp6zQMFbGk909zVI8Q/N4r5zHmxxNWcS63W4hXTP/C2wFk
	aITp6quX6moCAkbLW/Q3cwvuyN+k0TCebj1WqmP41auNzjono9NPAW/kGVY2Cs+H0AFg6T
	D37E4H9RTNBs4Ho+ejdUYv/+XINHrG0=
X-MC-Unique: pNUOgj--NyGazL-3bkn5XQ-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Q4AZKy15E+JiLI6bjJBPEyIeipuVUsbRS8zKZsylDOI8iZoJ2GlN5GR38hhF/yDFTca0K0/B4I4CIiElPWrou24BD+R+xPmKeMwgX12MyBYQnw5bCJbKne8YYntBgtFfL50UPmUBXPjHn32Y5jDQPFrlLpOz1RweJzQnDlS6tXW5B5I+L5hLuCwA3foi/XSoVbdFARTUoF+2mtpwKQglgDlzE+CN+cFrFK7jdgPlQhpejVs2B+soS600axhqaXJqIXpjsgLC4M/f4K+Vdsn+yJtNSYNgmlMYzNwb6aLcYo5jFjNVupi/Fl13q3lNFGK9Mz4z0n7GjYxLvLDDqX8lHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DDU6h2HZbLdF/32bzQjhs6Ad2vWnmia5jq3SOr8EQGw=;
 b=hckkX4bAmAzgv1kBjH1OvN0AIa0YwZ1o8L1wFpBYjV1Xsq/DRmIcvsc8ZOoD4iEoKMpyT/7fIkK/xvV77VCftOH0CvIrISqnokqnE9fDE73+6yajU+YEwU5zx8FsjRGOH6A23A+qwiruymLfSvO+RYRwSBecDjXhohjpKyCa6QQuTjPh9H0yq5qYF2aqq4ai13XLMMrOKGQ2VoxxYv7NusxjrNssUrYMC7tOBPRLgSEeyGc0Cw9Lddw0FdSe9P/A6L2s5dxn5i9pDvtcAX2bb8lrzsSg2HhXw9Dwlc0McIU4Sgtk+UhpYPSLQDIKV7dHXOQcxZ4Iwj7QUDLGl05mwQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <545f5185-9cd0-63cb-3519-470d587e12ea@suse.com>
Date: Mon, 6 Dec 2021 15:34:18 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.2
Subject: Re: [PATCH v5 04/12] libx86: introduce helper to fetch msr entry
Content-Language: en-US
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 Ian Jackson <iwj@xenproject.org>, xen-devel@lists.xenproject.org
References: <20211129153355.60338-1-roger.pau@citrix.com>
 <20211129153355.60338-5-roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20211129153355.60338-5-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM7PR02CA0017.eurprd02.prod.outlook.com
 (2603:10a6:20b:100::27) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: daacca21-a662-45a2-b6da-08d9b8c57d7a
X-MS-TrafficTypeDiagnostic: VI1PR0401MB2448:EE_
X-Microsoft-Antispam-PRVS:
	<VI1PR0401MB24484097ED49FA24D11B3764B36D9@VI1PR0401MB2448.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3968;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	9dnt4JdDPs9cbTNdcXk9/o1wWqC0PF2o3In5YDpkHJj5nFn2HkR3qENXMnAg65m7YNFjX2vscte5nOfisP/vqxOloMWU81gkfqbPV8igPA46baiIQq2q+XTv4jTfN/6psSxA6uuBZo6BelAsvvtx+7SJohZEy9L2DmHSDm5pI+uwzoTxZf/1CBf7xb9X84a2nbDxUlcEaj4eNhPg4jVJV4y+SCqqh7JPPou9q2IvxlYdVP2a4fqOYvWgrfYS/6MBRprbE/mvc7CYZuwda0Ze5c1l3IxfWOi+ckpB3+d32c+tywnEXQwxskl0ZzT6S3ZEMMqnEbakvGhdghAp22wfQupeQ9uQFi7YZhDntcxMNv5H4JYGxGN7x1Kpid/haygoCbzZminzpU0XwdKEXWEGIT4Nh1EWdH/GICFWmVgALbbP7eUPmxF5PJ2qAYPJhmJxeYfOe/JLLqtPpsRNJOVWgq4c8FQccSMwF2xZSlk6oVjnG7mvK7TSiQEnAq7HexXvwhWgoym3f1t5QhiMUDCUp0aDIf0yHSTFMlV9aD7k/dInAbGpn+pe2r5NOJgbTMHUlwNAqXQ0kRLbyagNp+QD1pAtvzWYr3k7TVyP+Z1CCGYusl9K2IEVL5S5XMyzY9z74i75zG5XwfRBGiL9Gkqd4WvGSOiGJaKmCVkfetJT4sy1quOGcte5dKK4NQ6mVP4YkwuO7WGQzOmW6VBdBowCm2TLPptJrflfxD2tPM9yl84=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(31686004)(5660300002)(6916009)(4744005)(8936002)(66946007)(53546011)(8676002)(956004)(2616005)(66556008)(66476007)(26005)(6486002)(36756003)(508600001)(31696002)(316002)(16576012)(54906003)(4326008)(186003)(2906002)(83380400001)(86362001)(38100700002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?U2JZUlQxOUV6ekRCa1MyeDllaTBYU3VYWXhzTG5yL09jWG5WY2FtTnM5cVI5?=
 =?utf-8?B?cWFmMUF6UGY4ZG90Q01lTG5DYjh1V25JNmd0bituWFBoeHdOa0k0aVM4c0hM?=
 =?utf-8?B?M0RTZEdZaC83Nld2T1M0eWJCa05WcDJrQVFucFhPd2lsdjh1L2dBOGZhdWov?=
 =?utf-8?B?cVBDTU9NTW11Q3JiZjRCZkR1ZDE4U1lxd0l5TE9maHRZOGNnZ21nN0RmM0Fs?=
 =?utf-8?B?YkFiVUxQaTBmN2VKb0lvQkFSVmlORHVFcUpwcFE3aXRteUMvRGQrelZQQUM2?=
 =?utf-8?B?ZTRXaHVhMVBNWlhyZzZOY0ltQ2c0aXN4RmZpTkNlTTcyem9lTjJiUk13cXNx?=
 =?utf-8?B?MXh6UVRiREVRL3FzU0ZKcUNRdWtWR3ltdHhOcXdtZU4vaEt4RmlxaUtMcjh0?=
 =?utf-8?B?SFNaOGJzVkloNzZKK2FjRVdXQ1V2anVQVlBUOXIvN3NkS2llb0lncmc5aTUv?=
 =?utf-8?B?QklvMGc0L2pvWHJZVVN1RTVSdGxad29nOTd2MHNReFFoMDlVM1U0cmRDNXht?=
 =?utf-8?B?VE1lMkNiVVdSbjJWWEVkU1o5cU1IOEhzVlI2dzg1NlZ1Z0s1MUJ2aGVFNnc0?=
 =?utf-8?B?dlcva1BZNWQ4cmJkUVQySjNycTY0RC9FZlFqTUc4b0EvdzRHY0d5ZHY3QzQx?=
 =?utf-8?B?THRDUENPc0JEWUpCZnl3OVI2R3huQlQ3WGRlakRQMk9jZU00YTRIbGhUd0I3?=
 =?utf-8?B?NGYvdWZ3N0paT1N4VEVWdXlWYTVGb0dkU1lHTmI5cmwyeVdtT1krVUlIMWdR?=
 =?utf-8?B?RE1BMTVWVzEwYWVMZmdFdm8zcDd5Rjdzc01xUGJsRnVQZUo3V240VU5aVHRS?=
 =?utf-8?B?SVZ4WUdvc1RuRUZFelMvdmUvQ0V1TC9od0MyTXN0VmNIWVArMHIwYlFKVFJK?=
 =?utf-8?B?THA2TzltekVJTXV2NGF1Uk42R2RVS1M0Yy9abzJ6K1Q1UzRjbWFreC94V21B?=
 =?utf-8?B?b3F2K3h6eTJFR3N2cys5Q3JpeDZCbHhSbVIyN3o5QTFWTjhERXhxOHZlMTg2?=
 =?utf-8?B?ZE1PNDNzak1VbHlGaElVVmxzb2FWM3dySnBWeFA0OVora1luSjF5bFRXYkdL?=
 =?utf-8?B?aDNTYzdWUnp1T2VSY0dpU29GNVJ1V1BTOUpPS2tMYkJuZWoxUWNZTHJrckE4?=
 =?utf-8?B?VnZodlR3WGVjSlIzSEtjTVRlRTdnZEdIV1ZlQzdZWGEvK3ZCY3NYQjFJU1U4?=
 =?utf-8?B?c3FZWnV6WG8yVDBkMDJNUXdjUGVHU1FSYU9YN2xkSnVZTm1KVW9WU3FFck1l?=
 =?utf-8?B?RGNicFhLZnFVUTZSUHVhWkZOSGZGcW95QkdIL0xkZk02ZWc0VFlIOWhZMkg1?=
 =?utf-8?B?Rk51SjlEM0xydU94SUExZjFybi9CMmVxQTlaMGsxTXhGN3VDMUpDU1VrMzdI?=
 =?utf-8?B?NmpGMkQycDlLOXBhL2RRMFVlMzN1cUdjbDZNeWFiV2RpNnFleVUzWmJISS9P?=
 =?utf-8?B?TEZGMzNpQTdhOXEvWnh6YUJNY0E1TTdaejV5WGZaK3hXWUFyN0lwYjY0ZDBz?=
 =?utf-8?B?U0EwTGpKbisrQjlxaURKN2FGd28yNjh5T252MzYvS2xjMlFMYUN4c3ZaZS9J?=
 =?utf-8?B?a0o5d0p3WjFOMTRiWEdkTjJYWWRKTTlSOHFWR2dyanhpNlBmOGpLQXIxelI1?=
 =?utf-8?B?T2tFYzZkd0p2UUlXMlR3d2dJNHA1QkQ3ME52QkgycFJIQm1rYVNUV05GbGFU?=
 =?utf-8?B?N3Z4NEsyemVXZS93WUZBeHErUWJFVHV1RThvbGFvd3dpWUV6Y0V5L01DR3Z0?=
 =?utf-8?B?b1hyMkI4VjZVNTJ3RzcrVVNLd2lqVysxR3FWNjZFN1duYlgyN0R2NVVhMVl1?=
 =?utf-8?B?U09jODFLNzJzRUZ5U0Y5RVVCb1htaGNMRHFTY0ttWm9DdWhLREFRdzhFekQy?=
 =?utf-8?B?blFkWXk2UVJzaXBMYnJ3ZzZ0R0JjTTRGUkpuZ3BIMkxuNVZYYTZyMWgyOVVN?=
 =?utf-8?B?dml2YUxoZVZIMndrL1dEaHdrWDZYNms4djQ1VTJWeFBUSEFuRjdtN0FTL2FX?=
 =?utf-8?B?UHRRbENZTml0aW9rQWQxaFdLNXhlTEJORjRUajE4Njlmbmt0NGVqczdjeUw0?=
 =?utf-8?B?ckx3d29abmVMSFNIeGg1Q2drVEJEOTZMeTI2Zk93YkFUK2JVWmo1OWttVmdh?=
 =?utf-8?B?M3k2blRId2Rydmk0cDFKd0o5MUsrWi9NeHlBZU9VQ2VvUGVJK1JvRitCZ3Ry?=
 =?utf-8?Q?Ir7u5Wz5qLbo6jikGMzP9Qw=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: daacca21-a662-45a2-b6da-08d9b8c57d7a
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Dec 2021 14:34:20.4457
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RwVoEPIW4eVxlgpCtQSWp+CWZ0wioh2bh2tz0UjrYy7JyrBAvzcmgt955dqWWPAxlDpgcSCCuJRQjT7Drqpw+w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0401MB2448

On 29.11.2021 16:33, Roger Pau Monne wrote:
> --- a/tools/tests/cpu-policy/test-cpu-policy.c
> +++ b/tools/tests/cpu-policy/test-cpu-policy.c
> @@ -386,16 +386,6 @@ static void test_msr_deserialise_failure(void)
>              .msr = { .idx = 0xce, .flags = 1 },
>              .rc = -EINVAL,
>          },
> -        {
> -            .name = "truncated val",
> -            .msr = { .idx = 0xce, .val = ~0ull },
> -            .rc = -EOVERFLOW,
> -        },
> -        {
> -            .name = "truncated val",
> -            .msr = { .idx = 0x10a, .val = ~0ull },
> -            .rc = -EOVERFLOW,
> -        },
>      };

Why is this removal necessary? I don't think any of the additions further
down actually replaces these.

Jan


