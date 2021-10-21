Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 57FD64365E7
	for <lists+xen-devel@lfdr.de>; Thu, 21 Oct 2021 17:20:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.214518.373085 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mdZrB-0002W8-IR; Thu, 21 Oct 2021 15:19:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 214518.373085; Thu, 21 Oct 2021 15:19:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mdZrB-0002T7-EB; Thu, 21 Oct 2021 15:19:49 +0000
Received: by outflank-mailman (input) for mailman id 214518;
 Thu, 21 Oct 2021 15:19:48 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=FF+c=PJ=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mdZrA-0002T1-BN
 for xen-devel@lists.xenproject.org; Thu, 21 Oct 2021 15:19:48 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.109.102])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 530884d3-3282-11ec-8380-12813bfff9fa;
 Thu, 21 Oct 2021 15:19:47 +0000 (UTC)
Received: from EUR03-AM5-obe.outbound.protection.outlook.com
 (mail-am5eur03lp2050.outbound.protection.outlook.com [104.47.8.50]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-33-yNRwO1UJPOOvU8EqdHJiUw-1; Thu, 21 Oct 2021 17:19:45 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB4381.eurprd04.prod.outlook.com (2603:10a6:803:6d::30)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.16; Thu, 21 Oct
 2021 15:19:44 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::8062:d7cb:ca45:1898]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::8062:d7cb:ca45:1898%3]) with mapi id 15.20.4628.018; Thu, 21 Oct 2021
 15:19:43 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AM6PR08CA0018.eurprd08.prod.outlook.com (2603:10a6:20b:b2::30) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4628.16 via Frontend Transport; Thu, 21 Oct 2021 15:19:43 +0000
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
X-Inumbo-ID: 530884d3-3282-11ec-8380-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1634829586;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+6x5VW58fARZKv4rS4QMHhIKpTUVzW56T5bidJfnKBw=;
	b=IymwEAyIshgwSiYVKICQ/E4sulEDJzdtmkJKhgXZfyImhxTFKNHE2RLOXnyKKe26XKc4f8
	R+mePbYOVyC8g0/3VVBfbGR5tI1fkbp820DVpQdxYgzWyeo+inQYbR8ig9QgY1e3WHntGP
	tpj3D2M2kOHQlL0XXW9EwtHinhx+TQA=
X-MC-Unique: yNRwO1UJPOOvU8EqdHJiUw-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CLM8BaiU1wZcIR6VuNg6j/5jKqllf161yOaioZ1obIzj+kXy9UuVo0DDlv+8itUBJ8A0Zw84OUX/2uz2VdIYsAgJsjd0u+hMFbzMey/bEU8uZKGEk0wXQIE5XmjZdwlx68i16ays04UDIqapxYKMVbr/wJNto9H/bWgsx7SaiPqyfkR/iCH38lkwqlTNlXuTupNen1a3WoBJM+c9bxXayt+8mBu2teTKzNWjnlUL693nu5RoD+k2+d9s9xqzVi+vPtze4iW7Gfn8F1zGEkI+tZOwUqoBDhnWwO1QtWzIzgaaN4cpg8ea14zOpWFxeDdaktdqHMvzaPa/QnhTD+7x0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+6x5VW58fARZKv4rS4QMHhIKpTUVzW56T5bidJfnKBw=;
 b=hr7aqMZwajnsXrvN0da767NtFHzXyPAIw3RxYFOsqgXF5Jzcu1vQo6OzluzqAm6aUp8DpGLsgyHX0a3W+AxDR9rJh1SnmoMIPE0bUm+tMHLx3tE0zCuOb+qfPvKZd8scHkwhegvWGGnHut+zEPb/22D/+hWpNVIUBsMqEmTb8SWgovOCIjKpRg9XRJl3Em5kkARmldQmvCrgrHbn3vvcvqwOt9rrpzmowWitYUntIiEsBhcBjcJ8LX1zjchWKjXea3FrDOYpQLfBAA7Rw0GdgjbjCM0Q7hAkLcEUc6mZAvT1+FakijyitZmcuRZyc3l7aEzE+4N3lOMSshQwgKyrKQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=suse.com;
Subject: Re: [PATCH 12/12] xen/x86: add hypercall performance counters for
 hvm, correct pv
To: Juergen Gross <jgross@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, xen-devel@lists.xenproject.org
References: <20211015125152.25198-1-jgross@suse.com>
 <20211015125152.25198-13-jgross@suse.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <6570b0b9-0cde-a262-937c-b4e2e3f8e1e4@suse.com>
Date: Thu, 21 Oct 2021 17:19:41 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <20211015125152.25198-13-jgross@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM6PR08CA0018.eurprd08.prod.outlook.com
 (2603:10a6:20b:b2::30) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 25bbde04-0a55-49f2-edc4-08d994a635c3
X-MS-TrafficTypeDiagnostic: VI1PR04MB4381:
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB4381D611A3750524C4E0366DB3BF9@VI1PR04MB4381.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	0HiwwDRq0oXqXS+pQ26JsMHEX8+CrMF2gq7nI5ePzujBwB2oqEPI6Deab1hhHMcmIAQQzfifG/2xnY9ceLuVow7mv6y8PNmUWV6aJznQw57+AYu0AFPIqYMUlJMbOANzWXHP9yh8eEM7iRS/zT5QQx/vKXV8p1H7tWJ4JLK7fiUXcpfeUaXfWNtU5hgv+p+nP4q2EryIegiPtKuwk1sbRzBHTsVvP6mdcMUqor6nKFW30GIrp6bDGU5+vgpRs0ypfPywJ+bfNqvtJGQlOMdO5opLjMFgzHo0Yqat1wVs0cjpYmcDMF41QsBgOmRgRm/Ko3wiOId/AnL9MmAfzsobbevP0sAbePCw/sdwP4iKiSsB2bH9T97vkOfmAQ60E0AVAg5FxjyrhgCGgZfnWPUVzFn0RXJDZFNzvUWVt3lLAiTjd62Oa/NcephoGP5jXhV92DaBOylRqtkHiS1/Ro0L0CsIaza/cf5BT0JSVzNnEgOJzICtD7BjX1eJEB8e8xOPSlymzhgHf+xrDcBRTjVm3XACuo5PUxCxkesfiBi14N7b/YwSix2wqJV48HTuS1wEuV+tg+S7le+j+94rqOrddxJW6azPMQmPP7vqcXoC2klcJG440OlauSa8WjeWLLGb2xlo95DVJXKHKuRaQmwsih6g+VywZX8oNw8oeGXAxLpdoMk3v93pH5nz6jZQEB6neoidij/h6rIrYi/IBP/pFpfeSoRNbuQeLA3RKJNu1XU=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(26005)(316002)(5660300002)(2616005)(4326008)(38100700002)(31696002)(66946007)(83380400001)(31686004)(6486002)(37006003)(53546011)(86362001)(6636002)(36756003)(186003)(2906002)(16576012)(508600001)(6862004)(8676002)(956004)(8936002)(54906003)(66476007)(66556008)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?OWk2dlBMRzNvT0JKc2ZHUGJ5WldtM3Z0RWQ2V0g3ZGZmVmliMDFWa0QvVWZ2?=
 =?utf-8?B?L2ZWUWQrbGlHcnpVZDdUSVRZc2RwemlPenQxZ3VIU1Q5UzlpR0tRMEl5OFNY?=
 =?utf-8?B?Y1JnZTVMc1dRdGRld0ErN2tDZmhRZUU4aUxoelJobjZVNHpUUlJnUWtBQjhn?=
 =?utf-8?B?aTNKTnFDWnAxN3JMcFZWSktIWGp3L2FwOE5Qa1g2QmZjVTRja2ZpakFUaDRZ?=
 =?utf-8?B?Tko2ekFrd3JzcXIra0FIc1VlNFA1elFtT0xBTlYrSHJJZHJVK2xUMnZWc1B3?=
 =?utf-8?B?RFRHT0hzK3JrY2JlNnpGOUVkV3BwODFHQ21nSW0xMW8yWS9lcVZkQVAzamdt?=
 =?utf-8?B?ZlhOcC9JUjN3SFdnbit2UWs4bUpqMS92aWROSWZwRFhuYWlISll6NEptTUha?=
 =?utf-8?B?eW9SQmZWbzhGbVptRTlkT3FjNU54S2hpRVh2NkdjSGd2dXJ3WVlaS1FGMStM?=
 =?utf-8?B?TFhxWmdzeUx6SElJdko1WS9lZDZWSVVXV0pXK3dTQnFRcHJMUndRMTJkeEZt?=
 =?utf-8?B?WVBwU2R4MVA2MThsVURaaVVYTTljOGsvTStLSnNrb3phaUhpZUlXdnJHWlFR?=
 =?utf-8?B?a0FNSE5qRldZS3U3WERKOUJLWjZ4MVR6Y0kxcUNTL1F2UTlsUk9uMmRNdFVC?=
 =?utf-8?B?cUJ0RW9FNE9uNWRjaGJ4K1ErVnV1Y2xCVkVUZ3NYcWJOQ0xlbk52YVVGZXBY?=
 =?utf-8?B?SCtaaXpSWkh2SnZkVjYwdnl1U3RadDFkckJYdmk2ZjVRUjAxZzlKMXBremMy?=
 =?utf-8?B?SzV3QW9FZ2p1OXRYWGUrRzhGeGxXS3pJRDVDQU1OS05oRnovaUdnMEVSUzJQ?=
 =?utf-8?B?UHN1R2lIMmZyc3VBMlhsT29FUDl5eC9QbkN2Q202S3NYVnhJR1R6SE1CRGl1?=
 =?utf-8?B?a3pFTGJtQ2xxYXlmM2VnK1YvSnZiRHpLRHM4czB6bmtPTXU2ZlBMT1pmdzVX?=
 =?utf-8?B?VUR4dkhpczIrQ0I3NzJnZ21xUS9RN09BcHUrTDF4ZWpqRW80ZXlWV3pWVEhk?=
 =?utf-8?B?Ull4ZlZ3VmdmWGFaQ2Q1SWMwTTZGdXhTbXlZTjk4MENudlZ4NThoU2F2VVJL?=
 =?utf-8?B?T0xSZEpPMlFhUEtWVW9VMTQrY3N3a3pnRk9TWTZTSksxVHhUQll4ZytucG9o?=
 =?utf-8?B?cHBSZXZTeUNKOVYrQmJ4bWUyaXdGOHkzMWhqYVZKZWNvYXhVbFdDeTUzbzNJ?=
 =?utf-8?B?WnI4SUN6T3lRaStCYTJpanRDVkdCYTF2VWVLS3BPRFQ0cDZ4bHFIS1dVandH?=
 =?utf-8?B?R044cmg5ZkJmaUlwR0hLQ0ljVTVvcVIyYU1ORnphU2JBMEsrQlFURVhWRGJ1?=
 =?utf-8?B?eFFGRzFLdU1KcWVZdUluTHpmS0tuNElKa1NQRXl2eG5rM0hGZysza01FYUJz?=
 =?utf-8?B?RVZrNHd3WDFpSHpxR1dtVnY2L3FTUzZWNlJiT0V0MHNZbDdGcUk4Q2hYSHVC?=
 =?utf-8?B?aGwrODNvYllEQWpxZC9KaGFzalVmdjhHeGNUL01hTTE2UFl6em1LbVhSV0JR?=
 =?utf-8?B?T0pLelJ5UlArQUMwKzVwSy9EUnUxNUM4cEJSVlllQ2VhbzRaNk94ZmVzUGtQ?=
 =?utf-8?B?Y2RVTDFNcTFIcHdWb0pIU3Irdzg2cHQzaWVSMFBJMENXanovZUw3dWJaTEhn?=
 =?utf-8?B?ZVd2ejNKeFhxVlAyZWFMbEY2WUNJQVIyaVdsSk9uMEFab2hJK1hPdjBibzFS?=
 =?utf-8?B?MXBoSlhoaGZLUmp5WTFJNWErbEI4REpmU1dGc0dvUHh6UDhROERZY2hWeS9X?=
 =?utf-8?Q?B2SQfoE0nFu9UYm7iCVpeqJHoV/PKOs3k0/OzVJ?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 25bbde04-0a55-49f2-edc4-08d994a635c3
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Oct 2021 15:19:43.8130
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jbeulich@suse.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB4381

On 15.10.2021 14:51, Juergen Gross wrote:
> The HVM hypercall handler is missing incrementing the per hypercall
> counters. Add that.
> 
> The counters for PV are handled wrong, as they are not using
> perf_incra() with the number of the hypercall as index, but are
> incrementing the total number of hypercalls only. Fix that.

Why do you say "total number"? Isn't it that all accounting goes into
set_trap_table's slot, effectively making that slot a "total number"
despite not being labeled that way?

Also this fix renders largely redundant the calls_to_multicall counter.
Could I talk you into deleting that at the same time? (As to the "not
fully redundant": I consider it suspicious that this counter gets
incremented at the bottom of the function, not at the top.)

Finally I take it that with the Kconfig setting being under DEBUG, we
don't consider security supported builds with PERF_COUNTERS enabled.
Otherwise as a prereq I would think perfc_incra() would need teaching
of array_index_nospec().

In any event, preferably with at least the description slightly
adjusted,
Reviewed-by: Jan Beulich <jbeulich@suse.com>

Jan


