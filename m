Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EAEA33EA44F
	for <lists+xen-devel@lfdr.de>; Thu, 12 Aug 2021 14:12:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.166284.303636 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mE9Yj-00024m-9V; Thu, 12 Aug 2021 12:11:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 166284.303636; Thu, 12 Aug 2021 12:11:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mE9Yj-00022b-6G; Thu, 12 Aug 2021 12:11:41 +0000
Received: by outflank-mailman (input) for mailman id 166284;
 Thu, 12 Aug 2021 12:11:39 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=QHFb=ND=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mE9Yh-00022V-ET
 for xen-devel@lists.xenproject.org; Thu, 12 Aug 2021 12:11:39 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.111.102])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 71778148-fb66-11eb-a179-12813bfff9fa;
 Thu, 12 Aug 2021 12:11:38 +0000 (UTC)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05lp2109.outbound.protection.outlook.com [104.47.18.109])
 (Using TLS) by relay.mimecast.com with ESMTP id
 de-mta-2-xRAhhCGOOZmBBZxG3Og_Fw-1; Thu, 12 Aug 2021 14:11:35 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR0401MB2608.eurprd04.prod.outlook.com (2603:10a6:800:4f::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4394.19; Thu, 12 Aug
 2021 12:11:34 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::99d3:99cd:8adf:3eea]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::99d3:99cd:8adf:3eea%5]) with mapi id 15.20.4415.017; Thu, 12 Aug 2021
 12:11:34 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 PR0P264CA0245.FRAP264.PROD.OUTLOOK.COM (2603:10a6:100::17) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4415.13 via Frontend Transport; Thu, 12 Aug 2021 12:11:34 +0000
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
X-Inumbo-ID: 71778148-fb66-11eb-a179-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1628770297;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=2VXQ/m6HeLComOVKMfR2AcrhEukYLkAe4zniaD4SiOk=;
	b=KdGziO8vvkuIK2YMox6xap96wZWEfcsGB+GrApDOn4OAumk5N43DU3WgxX/YSI7EZah+zp
	GwPmFnsX/3hC1riRqxU7bdJtzqbXNAgpAhrbEuADJZVqhNAgRFZCrEau/vCHIfK9wlGZop
	ymDpHPLmb9t2nUIMeTuvyul1mzADraE=
X-MC-Unique: xRAhhCGOOZmBBZxG3Og_Fw-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mAb8JkeCNnh8h4Q8AldxoxdxDL8lxpKph+rXMkNGo0tWbbRDtIYhStGAaC32rB+2m/zVUEyLGgX9xbjFcHsGOJWEIeQd66JCFoATAEDeqB9x0y4tG2PB6B8DFoff8+IiH9MPyungrYyLF9SfbDiiKMCo1xmFjrftaWvwIvqOx/vvNUjZqZfRNo4s04upf6jKepI6D0T+vQ/ZjXtqwMwI1N6x1xv8UyOFV7OwsLcvFLlqT+NrQdo1cqLkGbCv3ogQBLYePKGYdQz+YSs8BqloVE0aNR0SbUAArJPmPVRpAgrJRew2sKL8/eGdyOjaLYnoYl0N0GVznD9Gbxrwwj5gEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2VXQ/m6HeLComOVKMfR2AcrhEukYLkAe4zniaD4SiOk=;
 b=dxGsYacYvU/8m5eFVXndtPL83C7jPD3jiJIcCnF+u6xeM69cR/DaK3yaHRmKs3OpOpkQDGbDI1IKlDTAuYanaIWKuQqxOKiCqpYfOG9aX4+rPOk4p7MIpwWeY2znycbOBJuwPG60HGspLbqouXhbDOKMM7oAV3nAS9pkQmf1ESsEkI9uL18jYA9zN+Y7sLEsd/LDT7lLI+MzIndMKsd6blKsR2U7fLYMUMgwXvQUEdzVmF1eh5vHjRaSmOzUCZmuNSMCkmKFfULY/8oAb1ySNqO7nqt0yZKMVPo3H+iYG/FR3VvxxEVdaWUgOod5zZzr5DdngzkC/PexQ8B0q9WTIA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=suse.com;
Subject: Re: [PATCH] tests/xenstore: link in librt
To: Ian Jackson <iwj@xenproject.org>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Wei Liu <wl@xen.org>, Juergen Gross <jgross@suse.com>,
 Julien Grall <julien@xen.org>
References: <3fe5f85c-3702-286c-46a3-d90eb094123f@suse.com>
 <24853.1273.985325.539310@mariner.uk.xensource.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <74fde732-c2bb-168f-a51c-74e2220c87c5@suse.com>
Date: Thu, 12 Aug 2021 14:11:32 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
In-Reply-To: <24853.1273.985325.539310@mariner.uk.xensource.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PR0P264CA0245.FRAP264.PROD.OUTLOOK.COM (2603:10a6:100::17)
 To VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ceeb353c-7bbe-4570-c131-08d95d8a53d6
X-MS-TrafficTypeDiagnostic: VI1PR0401MB2608:
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS:
	<VI1PR0401MB2608D367D0B0A7514DE22F39B3F99@VI1PR0401MB2608.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	LRWZ3vniRlPdIADuTiCBdwHBsTYVp6eoj812Tg8Jq1tWC4Xiq5yudQeATjmW6ayTbolrF6P4JMIJVFZPurvMMF95o646ncw4pvrfL39n1Y8S1WM6WOyoIOEFJJri8XCIxsELtOVfVoxhT/nSQQcjqdmq4QD1aHhQWLc/nQcv5MDuJ8BztOPRsotCims6NcBKKYbCO61x1Znh0Xq6AjsZK6wbmajmZeuiTpDPfM8ajaJd70FlK/PdSHXEAorEQ9wl0evXdsC/OySmtNw2UgCZL4FTO+mFfWhGL/L62aHlkCzwwlryGoSws1HsxU/dtIv6lJnz4S1P03a6bBPwAFLQ50s4Fv/8JxiCnAdylJn+QvOHXDO+bD8XHyB1xWKL+s+r+WWHB9iUUWP/3L014Hn7HhHXW8iqxsSyykrGUNjJNrzGnVDjYIAfcpYc4X2o/grTnG92OqpFNLE9ANCk4p9K/+Ffba1W05QMb4iGcgZOETYb7KenDAPS62H7wZOKIJEvKK7qgdxqftOs1WHxpOLmvTCve6FgaHEvSVqgqtjzr1ejbrDw/kymYfluVgCkkGkwUEoqrksIoiSazEnP/PaSy0RVZsgn8YCjEIpJBFc8vb+xvLjtugCwWJcdaTGMfLFQNqq8TC68HeCBzMgUrAR/60AssFtLlWO4X4pDvxGr981wbu59ZMGt+Kn7qaFauWkqdBYfveM+Y6ol0ycwDQgh0SJurq7Cf7wEnS6IHjf/zvg=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(186003)(53546011)(26005)(4326008)(5660300002)(2906002)(31686004)(66946007)(6486002)(2616005)(956004)(36756003)(508600001)(8676002)(83380400001)(8936002)(54906003)(31696002)(86362001)(38100700002)(66556008)(66476007)(6916009)(316002)(16576012)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?N0VheEhNeTkwTmdwMlkrMHNNUEplbGdEK21od0NQcG9TN09KRVFOL3VPajZY?=
 =?utf-8?B?Zzk3VWtFeWFMa2FWdVdJRU1kNzlzNW5XOW12MUt5alF6TUUwa0RFdzBIZWcx?=
 =?utf-8?B?UXN5eXJMVHh6anJGNVpKVUh6bUxjV05LeklmWjVzcjE0Sno2MC9IL2ZGYmF1?=
 =?utf-8?B?dEhMd2VHcytaMGFPekhaaC9TRDA4UXRiRjU5QkZ1WnFvVnFUbzRtVEZyL3E5?=
 =?utf-8?B?dzVoZlpEb0g1ajhuTXZ0eWdDeE5sbTVuaTlxYlFQN2pvL1Nnc1Z3cUtCN3lS?=
 =?utf-8?B?UUl4UGJYQ0t4Wlp5d3dxcFc4dUdxZzd6NXYybjQ3STAxS2tzcnBGMVZPdE9M?=
 =?utf-8?B?UVhsM1JVczZIR093ZDlzLzViK0pwVlhHNlVFMWUxM0ttVjBXNDBrOG92bmY1?=
 =?utf-8?B?VVhPdldYM0NVclpLVHNWeTFPTk9sZWtGQnppa3lVR29lQ3VDQlY3NlZCQ3NS?=
 =?utf-8?B?VG9BWEhXenFsd2MvR3ZOb1BtTnd5UFJJMDluK3ZtYjc3Vy8wMHYyMnJCVVhG?=
 =?utf-8?B?ZzZtWitQNllVU1NaWjR4bTB2Rk02c3dtU1hrYUZWcFFZZDdkMHJnSlk5YStT?=
 =?utf-8?B?N1o4OFNVVEhZWEVmdE52eUdPdC92a2t6ZzhhK1QrNVJQcFRXMHo0U1VvR1NM?=
 =?utf-8?B?VzNzQTlPNmRzU2w1SDdKanJ1V0RDNjRuZDZNVlRkeGk0WXhyMTdXaWt0dDNL?=
 =?utf-8?B?QmVwcXgxZlFLODRRdDBTWlVOb1V3bGg4WEtYNlZnMFpTUXJQYTl4anRVUGV4?=
 =?utf-8?B?YmlCVkplblRrV1B6dzY4TkxzQjdPYlRhZ3JRVzVCZE9oV3g4cm1KQ0o2YlpC?=
 =?utf-8?B?SW1GNTFlRWtDMU9NRTRWK0U0YVBwODcrblpVWXQ5SHd4UnFmM21BYXlRVGZU?=
 =?utf-8?B?K0JKaTNkQktwd0Yrb0I5d2dhM25QcFVZYVdvTXAwV3pJL3VKVzVnb2lZck1l?=
 =?utf-8?B?aEptWlVrMGVzZ2tSVmhlNlJOQ2I4RG5XMm9Ldk00UVhSNEliSHlxbU5mQWlP?=
 =?utf-8?B?bE9GcXQ0Z29aVzd6cHByRnJGK21kY0ZDSW93NXBKd3VCMTZpNWlLVzZzbTVF?=
 =?utf-8?B?VE9yc2JUbndTTDBYOWQra1BuNUZMK2VGZm1lVGkzUGl3M0QyVTVYd01CeDJG?=
 =?utf-8?B?UXpieU9zT0ZRd2hMcm1ZbXgrV2Q5cFlPUU5zdGJZL25Gb3lzaFRoRTBpaEZO?=
 =?utf-8?B?S2dwdkhpaU1Vcmt2R0x1NXhqRGlRNHpsV3pGY0FjTmdSeXVacmVnMVdYM0FV?=
 =?utf-8?B?bWNjOUphYkRQNm1YQ29oRHV3a3hYM2pGaEdISi9qZHdYaUJZSlR3a1UrZWVy?=
 =?utf-8?B?YTJoMG4wa2ZBRUpRMXZGQjZoVVRYbWMvZjgvLzhibjBsbnkyYUkvbmRqekIr?=
 =?utf-8?B?WEoreFg3MFVjRHpIT0s3MkViQWYvRUlzTWhKRlVoZDl4UzlHUmdMS2p2eXBI?=
 =?utf-8?B?QldIcWlrSnJ6YjM3VnIrYjFCQ1Fkd2Y0VXRVamozTDE5K2JYdlJMWFlqNXI3?=
 =?utf-8?B?UlVHaGNMNzMyTTd1U2dhZkJBTFA1TGVrL0dhL1FFMlBQTTM5aDBZeW5RbkFr?=
 =?utf-8?B?VHRvazJEZ0dldGdLZlREeDFockhWTURzZGZPS25VdUFOUG55Nm5CYURDbERT?=
 =?utf-8?B?TlpPbVNoTVpMVkdsdDIxb3U0RVBpVU44WEVBbDdOZDZtRmxpQnZKT1R6UHNx?=
 =?utf-8?B?MDJ3VnRWR29DU0FROXIveTVaRjJqUERJQ3o4N01UQWd2T1BTZEhuWnBLZGV6?=
 =?utf-8?Q?Ao+Gh8lFYFD21bjCczNwrB9dsVq9K6E4E0qOaCA?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ceeb353c-7bbe-4570-c131-08d95d8a53d6
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Aug 2021 12:11:34.4418
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: H8ho0MAQZjc/w1vYoXj3s7Ls+/IdACciM/Z9geKZLc0sD8hTNyJqLky4Yd7q0mEptO0N9E0EIBJ0/AFxqaVjGg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0401MB2608

On 12.08.2021 13:24, Ian Jackson wrote:
> Jan Beulich writes ("[PATCH] tests/xenstore: link in librt"):
>> Old enough glibc has clock_gettime() in librt.so, hence the library
>> needs to be specified to the linker.
>>
>> Fixes: 93c9edbef51b ("tests/xenstore: Rework Makefile")
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>> ---
>> Cc list based on the assumption that the XENSTORE section of
>> ./MAINTAINERS probably ought to list the containing directory.
>>
>> --- a/tools/tests/xenstore/Makefile
>> +++ b/tools/tests/xenstore/Makefile
>> @@ -31,6 +31,7 @@ CFLAGS += -Werror
>>  CFLAGS += $(CFLAGS_libxenstore)
>>  CFLAGS += $(APPEND_CFLAGS)
>>  
>> +LDFLAGS += -lrt
> 
> Don't this unconditionally is definitely not right.

Assuming you meant "Doing this ..." - why? If the concern is that
librt.so may needlessly get recorded in a DT_NEEDED entry, then I
can replace the early addition with a late

LDFLAGS += -Wl,--as-needed -lc -lrt

one.

> How old a glibc are we talking about ?  (I looked at the minimum
> versions listed in README and there's notthing about glibc; perhaps
> should be.)

I've hit this with 2.11.3. I guess it has been made available by
libc.so from 2.17 onwards, considering the symbol version is
GLIBC_2.17.

Jan


