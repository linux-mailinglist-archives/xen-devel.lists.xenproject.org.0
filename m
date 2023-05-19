Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7224D7091BD
	for <lists+xen-devel@lfdr.de>; Fri, 19 May 2023 10:33:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.536758.835418 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pzvYJ-0006rD-6A; Fri, 19 May 2023 08:33:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 536758.835418; Fri, 19 May 2023 08:33:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pzvYJ-0006p7-20; Fri, 19 May 2023 08:33:31 +0000
Received: by outflank-mailman (input) for mailman id 536758;
 Fri, 19 May 2023 08:33:29 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=TMQ+=BI=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pzvYH-0006oy-59
 for xen-devel@lists.xenproject.org; Fri, 19 May 2023 08:33:29 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04on062b.outbound.protection.outlook.com
 [2a01:111:f400:fe0e::62b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d3622b08-f61f-11ed-b22d-6b7b168915f2;
 Fri, 19 May 2023 10:33:27 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DBBPR04MB7835.eurprd04.prod.outlook.com (2603:10a6:10:1ea::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6411.21; Fri, 19 May
 2023 08:33:25 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e442:306f:7711:e24c]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e442:306f:7711:e24c%5]) with mapi id 15.20.6411.021; Fri, 19 May 2023
 08:33:25 +0000
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
X-Inumbo-ID: d3622b08-f61f-11ed-b22d-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gpkGAt8Mhi898t1IkGT6F6u3iJWxj4wPb17mtztAA3nqjjs448Ul98ZljC6YnEhFfoyunH/68AwdVA9rY32JsWrmuSwbeZUuQpK5BFzAoA03rK8hjnYDUx9LTazWj5xIjXh2QohzMWgKM/yhielYb7XWC0UYVSAuAUTcb+XMz0rNjcvkt1lLmHhHrWJ6Svk5+6t91riwlMZcvlu8ejoQJWKMGglXdFLwbkSYnA6pFtGLGxReV5u1dmLsPB83CU5l/j2H3gEwITF54VAIwakaFkf0AOSbcZ/QKHmTv9vh1uPR6joECLRx0gnYYD4+9gLH4Ac8IQikDYTyUBiICggyFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QI7nFyGxmmFoMXbiNr4biDnPFS64C3AU2e1jSgYKMu4=;
 b=ISwlaSISVbaGhjeDmOOOz+4yeOIBtckJmVvZYuwySQdtoWH9Gs3DzidOM1/Gz+2X6Qed5HlPRAxxKr2DpAWeWiG0jnfPD2c7Sah7LXuf1DOvW6SH+UFNAdeoEP3VPR77E7xzVUjzk/FpV90sxrTfTeBxpuWUx9iR9DgkLEkesAb+xCPTvldMNYBW/v+4VvwpS05tJn8MfseV5Ag4zypeW2Q6RVej3eXqvXx47JlcVN+JzH6aw36pGcFg0dgWZkls8mQHwBa58J2zUZ4wRdST0X/zYpVvF3TSs9ausTGU11dUyWGmhMyQ9emnBAjsIrQy73gbX4hVZ0/fjiny3AazAQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QI7nFyGxmmFoMXbiNr4biDnPFS64C3AU2e1jSgYKMu4=;
 b=5M4xcnuEKCU9BrIH/1AoMftnDLwAwRB35kyG4TwZ4F4Zpex2x1+yqVx1u4YQiJzJecFy3ECndTLIYUQQaQh6GKnAojK2czqLNQAi3FzVcaXj9i3JLzhqLYn2qZO1N3PoqZSgc5xeF1Hx9bkeLamGnegLD+Gr21I8iAMOsNCujSRhJD/uvdMUI/ziRtU59k2BwnnAe4tXS06UdE9ArO8k/XQlz64wLnMMzi6M8FkvB/idhUtkaNV8bFbiCwFiN+8JXVHsHFM1QmRB0iVO90wzFweFX5agwNxRyXhfXofFmBXHY/xgZl0El7Vf8JoQDjks2cEakL4TJJ5gPDhwUx7qBQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <b563dbfc-e7dd-9ae2-01c1-2e0c7251a550@suse.com>
Date: Fri, 19 May 2023 10:33:26 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
Subject: Re: [PATCH v1] xen/sched/null: avoid crash after failed domU creation
Content-Language: en-US
To: Stewart Hildebrand <stewart.hildebrand@amd.com>
Cc: George Dunlap <george.dunlap@citrix.com>,
 Dario Faggioli <dfaggioli@suse.com>, Juergen Gross <jgross@suse.com>,
 xen-devel@lists.xenproject.org
References: <20230501203046.168856-1-stewart.hildebrand@amd.com>
 <30246788-c90e-e338-de4b-e7bb2e440f4e@suse.com>
 <93adef92-90fb-80de-c6b4-b41872b74682@amd.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <93adef92-90fb-80de-c6b4-b41872b74682@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0066.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:4b::17) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|DBBPR04MB7835:EE_
X-MS-Office365-Filtering-Correlation-Id: 4bd282a2-61c5-4efc-a526-08db5843b6ae
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	5AfS6sruAHreoDwCJykhUj64W/EIAMqSG6wu4olxOgqqawGizDNg4V5J7XxHppJqptySw8+nkBCMFID0jUhsmIxJVBmR3xD2OTp9m1guVNgQ0tUxRPz7Unt0x2XYoqD4PbrXOLRtTkMiJD9k8UzRR/iJsKp+NpOTaoexcBQM7+chI96vG+2xF5b1tCgh2igtL0ppnDaz07AC7oEpIDE6Tt/yuZMHkEVZmfms31gTscmQCP67URvwj1lZR25vPqM0GeCL9LO5CYfjmPRhNzkZMnPrv9uZFIAdR2B5elzlCgMP1SgJePchE9w/T0f15m5i9uhocFhHeNfQzW4so6jlZZh/woim5uaSscSyvPJqOwyYIdDxmjOYXK7cKw6vz+aeaXzpceZhAGiISsn/gCU2flIpfVlD5FycZ+yOlkS67jp5p7AvLckY0ryx8nnep6kXDPMLphVzcaqDIN7eA8noEi0KgQVs+G1bcAOUVj/OeCO43+2FiRL5LQ7pZ4YzlorqWbhp2QISHG00D5BQgUBRSrWgKZhmpjajkI/Q41MKJs8DcixDUjn8jraaQoSx1DPJz5EytPGn5q+3ZJSXAdm2tvQUWCisVKfuKp7lC78OzPtKwI/0MAxzac9d/XImOiu55aMs6AvOr00EkgqPJjyOMQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(39860400002)(396003)(376002)(136003)(346002)(366004)(451199021)(2616005)(53546011)(41300700001)(83380400001)(316002)(5660300002)(4326008)(54906003)(478600001)(6916009)(66476007)(2906002)(66556008)(186003)(26005)(6512007)(6506007)(6486002)(38100700002)(36756003)(31696002)(86362001)(8676002)(66946007)(8936002)(31686004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?a3dZSnd1WVIyZDNSM3FES0doVTZrdHJta0E1QW1LV295K2F5dWJSQ0ZpcEdk?=
 =?utf-8?B?bFdMQUt4Tms2azR3SUxqZ3FIM3BXTkk4b2lhR29Memh3UmpGQ085VGdoWmVN?=
 =?utf-8?B?Ly9pVjV1WlVOKzZYejg3dXJacXBDSXVxQ3NRMmtKN285SXQyYVBqYWNTRHZ0?=
 =?utf-8?B?YUJkNDBsYmJJelQ4dm9lSWtSS2locVM3aWkrcVhXQlpINmwrRC9OMXJIU2hk?=
 =?utf-8?B?Qml5NU1pa1RtSWdEU3dteCtiMTZqMmdhNldGdmVjVGVFVXo0aGs1Z2VOdVU2?=
 =?utf-8?B?TXdTcndFS25Bd2FyaGk3dVlPL1NlVktQRHFjOEdQWGczSlF4WVRqRjc1dnlS?=
 =?utf-8?B?ei9BSDQ2MW5ITXFZRms1OWpEV0tnakV0cGN2SlVQZ1Q0OGlLeTdyQWpGMTJK?=
 =?utf-8?B?cTFNVmw3MmJGSmlRczMzUEdoaTNKYjVUTUQ2SUtxMUtka0svUTFhMEpFZUlO?=
 =?utf-8?B?OTYzOWZIZEtPTVNGWTdrZzBuQ0dTV0pUeW43QW04YnBmeUpLOEZDbnVSUHVO?=
 =?utf-8?B?UU9CS3l6aVNNNGozMzJpb0UxMERDR056aCtuN05TdXpsV0ovcUp0ZkZpOFd3?=
 =?utf-8?B?ZElwUTdJWnFqY3lEa3kyMzc0T3lJc2t3cjBuUVpRY1RzTXZzU0hyYXVQUE9O?=
 =?utf-8?B?RU8vK2lELy9oclJjeHhKNkVWN3ZOd3g5d1lXYURMRkRXbjNKdS9QaUMrMXlW?=
 =?utf-8?B?Q3V3MitSNElmdWN6bkd6VU1GTFllbW5Zd2RqTU1NczhHSHE2d2Y2VXRNWGFq?=
 =?utf-8?B?b2tpaUtDcCsyVTBrY2IrK3VYcVhnZzVYNVJaTkJLSFNaY2d5QmQ0cU52SDJw?=
 =?utf-8?B?TmJ4QUc1WmRXcTdwUkZGZWhHVTdJZFlURWwwV1VNSThKM3Y2dkJYU0NGWEtE?=
 =?utf-8?B?K1NBM1FRVm1DMXdBbjczTWMwQjFnOEJiQXpnSk1RbVlkdFg2cUNDN0k0Ym1D?=
 =?utf-8?B?UWtwY2ovSGdRa2lhZWs2R2JDY3AyTzIvTC9VZE80MXB5T0NrdmlONU5YbDha?=
 =?utf-8?B?d3pPRDFudk1vOFczcE5nSXZsOHp2RjRLVEQ1RHlPcElpTklBT3R2TUFWRGJE?=
 =?utf-8?B?MERqQkxmOGhpbGpLVFNYNDRFMjR3b1dFblhzY09pa3RaWTcreGR3ZndRMTVC?=
 =?utf-8?B?WjR4dXlhdnprNDRnU1ZwK2JTKzZSRFdUakkxRlQvcUNXSTE1QnN4OFdoM2ky?=
 =?utf-8?B?WDlDRUcwZHI1V1NMUzJXbUJTN1lDdm9pYXVjTFk4V3NBNVBPdDY0Sy9KVW9K?=
 =?utf-8?B?M2txRm5vKzlVcHlzdDI1dklxMGtCRW44MUFEZ2NOcGwyUXE2YXBJVHpjZlVk?=
 =?utf-8?B?aWNVZVo5WFhVUTNVYmtiYlcvQ280L05WWG1pMXdGZ2NGd2VhTFFjRENIKzAx?=
 =?utf-8?B?cTBwQVVUekZEYlRQTm5yK3N0V0VwQjRBUEVXN1RJaXlkcmRSU2xhNzRYcDky?=
 =?utf-8?B?UmppbTBKMGhqdW5sc3JKcFFQNi9qRjQ1bnhLajJvUGpRZkNwZlhyeWM5Nnky?=
 =?utf-8?B?ck4wM0NNcGU0azlzdjhZNVBib3NxY2NaZ2dha0Y5Uk1qV3hEaTNzWjJteTd6?=
 =?utf-8?B?TlNKN25XaDBUa1JoaWdQU0lmeS9WS3pJUlRVWk5VenBPTnQ0VkNaTkpEdWE1?=
 =?utf-8?B?Yll0UUl3S3FFMU4vQmV6YWsyWWdrNm1qbG1RYk54am9qWHpZd2pTM25uM0Fl?=
 =?utf-8?B?a3BTbkU3a1pYaHB6ZEFYZWYyYURsYW04TUhOKy9QL2xPc1lybXExM0UzWjNa?=
 =?utf-8?B?VCtLR1dYaWNEVExHS0JYS1NYRnBndldCSHd5TnNOa2VSQWkzcDUreFBOVWhm?=
 =?utf-8?B?MnNKS3BRajFWLzF2T1lObWwvZzl4emNsTGhYNXF5bWFhWlFNY1dDTDE1UU9U?=
 =?utf-8?B?V1k1V2NXaGF1SklQZk1BRnBRYVJyWVgveCtPRDNad3hVQlpuTWpyREs3ekNz?=
 =?utf-8?B?czZURllTS3psRDNUazA3OXAyNFlSK2hDdHMyRDJod0Q0ZzYzdHY4dnQ2UzZm?=
 =?utf-8?B?OFFPWVI0cjZjaGJ1aVZIRG9XTEpuYldiVmpRQmpKWEpLRno1SDJseVlib1J2?=
 =?utf-8?B?WDJXazVaa1ozMHdueWEwdllkcVliVEZPeGozV2JBZWI3OVFRQkdzR2dZa2Iv?=
 =?utf-8?Q?bQ5blKz5olZTswg8Z1CvvjIfE?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4bd282a2-61c5-4efc-a526-08db5843b6ae
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 May 2023 08:33:25.5870
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: w0eb9at3TkWKpRP5UlBeKz6j9KsZldPF401d4JPin9aJActhIQzYHJEWr7JEMwPHLc1EdUom/sWid16BQbP+Bg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB7835

On 18.05.2023 23:27, Stewart Hildebrand wrote:
> On 5/5/23 01:59, Juergen Gross wrote:
>> On 01.05.23 22:30, Stewart Hildebrand wrote:
>>> When creating a domU, but the creation fails, there is a corner case that may
>>> lead to a crash in the null scheduler when running a debug build of Xen.
>>>
>>> (XEN) ****************************************
>>> (XEN) Panic on CPU 0:
>>> (XEN) Assertion 'npc->unit == unit' failed at common/sched/null.c:379
>>> (XEN) ****************************************
>>>
>>> The events leading to the crash are:
>>>
>>> * null_unit_insert() was invoked with the unit offline. Since the unit was
>>>    offline, unit_assign() was not called, and null_unit_insert() returned.
>>> * Later during domain creation, the unit was onlined
>>> * Eventually, domain creation failed due to bad configuration
>>> * null_unit_remove() was invoked with the unit still online. Since the unit was
>>>    online, it called unit_deassign() and triggered an ASSERT.
>>>
>>> To fix this, only call unit_deassign() when npc->unit is non-NULL in
>>> null_unit_remove.
>>>
>>> Signed-off-by: Stewart Hildebrand <stewart.hildebrand@amd.com>
>>
>> Reviewed-by: Juergen Gross <jgross@suse.com>
> 
> Thanks for the review. Does this still need a maintainer ack?

In principle yes. I might be willing to time out at some point, but
not before at least one ping was sent (and some more time has passed
afterwards).

Jan

