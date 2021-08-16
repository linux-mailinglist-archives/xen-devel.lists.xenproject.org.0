Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 62A3D3ED83A
	for <lists+xen-devel@lfdr.de>; Mon, 16 Aug 2021 16:00:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.167360.305484 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mFd9k-000059-Oo; Mon, 16 Aug 2021 14:00:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 167360.305484; Mon, 16 Aug 2021 14:00:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mFd9k-0008Uy-Jf; Mon, 16 Aug 2021 14:00:00 +0000
Received: by outflank-mailman (input) for mailman id 167360;
 Mon, 16 Aug 2021 13:59:58 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=3tuO=NH=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mFd9i-0008Uo-LP
 for xen-devel@lists.xenproject.org; Mon, 16 Aug 2021 13:59:58 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.111.102])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 3d3af945-fe9a-11eb-a45e-12813bfff9fa;
 Mon, 16 Aug 2021 13:59:57 +0000 (UTC)
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur01lp2052.outbound.protection.outlook.com [104.47.0.52]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-36-tRxGcTbJNVqLB1wqMl_ArQ-1; Mon, 16 Aug 2021 15:59:55 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB7149.eurprd04.prod.outlook.com (2603:10a6:800:12e::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4415.13; Mon, 16 Aug
 2021 13:59:53 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::99d3:99cd:8adf:3eea]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::99d3:99cd:8adf:3eea%5]) with mapi id 15.20.4415.023; Mon, 16 Aug 2021
 13:59:53 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 PR3P189CA0019.EURP189.PROD.OUTLOOK.COM (2603:10a6:102:52::24) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4415.16 via Frontend Transport; Mon, 16 Aug 2021 13:59:52 +0000
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
X-Inumbo-ID: 3d3af945-fe9a-11eb-a45e-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1629122396;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=nHGdIT/k1e3/378aeJhojl4+/o0GWC7nFlC5UmTd7mw=;
	b=XF+tMNm6umNMi3hm0MfIY3JoxoimrH1+FAEoUZtG8QHcBh6O79edcpfxScD+t8+1tU+NX9
	oYf3E/DY8XEniJwzp37DIw7VRY3nXqfL+Eg9TNQ1epuigvv97MvyP712EwIVq0X8nD9j7G
	yTLT4/Pc/qrMCgyK8iXH/ixMKi/gR2A=
X-MC-Unique: tRxGcTbJNVqLB1wqMl_ArQ-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iI9zSKteAAlV9q45p2g2Gb2xs79c23cncpkmX6sUhC+JBikmQL7eMyBgwKj4z+rMcu3t2g2eKj/Jc1ZLYfIinloEQPom2/2UjvJBZDEUV6T3As9qJcTdpKnb5H+O/KI6tGbmL9BVQt656q8Z5HdjrmqZM6OL3BzsO8WpbMa6fuTljzI8qOb3F3nkPLzNycBO6C+AqJkBhnVEy87WiX/1aTQzLO3y4PI2UyoOvgXfMWMXvCf9s/1mn25DWIxYw6KBPZV5bQlACi28oi1DFJXQK8dB1ZvnAKd9lbB+9QMKp4zIfDrz7Stu01leFlPZc0xYYvqrui17n8OrPZXgvZPq9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nHGdIT/k1e3/378aeJhojl4+/o0GWC7nFlC5UmTd7mw=;
 b=G5ldgVK/B5UaemBRuqajOXd3IBcYP0jRmWA9GLNkPmLDNKHk3eirC/slzQjJa2gidBEt5zxkEmx8QUjuuaWrIrWon4EmhCr/DdGOEg7UxgPETJ+W0a78lkqvJJJS/z+WX5mqUEgUFfqY4rnzR/MN6VZaO+l7TKvIp9Ll9AEDBKOeOXug5jIfcd/dhkRK6AbbpNDYnRgt5Qlr3medXYptlBgzGw1os26K1V7WNxAo3mDUs+c0h6oSDZoXhbpfiIypXv3BWe14rtOxv1tB3vu9QQ3KBFtGI456iQDfBo/zSXiR0DnHBiZLwRis4QbeR7s0WoPBeyL7ga6lkCDdRK2O2Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=suse.com;
Subject: Re: [PATCH] x86/ACPI: Insert missing newlines into FACS error
 messages
From: Jan Beulich <jbeulich@suse.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20210816133505.32484-1-andrew.cooper3@citrix.com>
 <72a41c5c-5d4e-ed4f-dd3a-e41d13447000@suse.com>
Message-ID: <0c4c8d8d-c42c-968a-7d4b-5a8700c4fc68@suse.com>
Date: Mon, 16 Aug 2021 15:59:52 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
In-Reply-To: <72a41c5c-5d4e-ed4f-dd3a-e41d13447000@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PR3P189CA0019.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:102:52::24) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f37593f2-440b-4058-60f6-08d960be1f2e
X-MS-TrafficTypeDiagnostic: VI1PR04MB7149:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB7149B6C04904807310C9BACAB3FD9@VI1PR04MB7149.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	QwjDyI2/ZyTzWwdVqOIBgcMZjYAG9OhgT/BHJxSKxeWr1QnfxFuHpkQ8qQ5XlWL+o9Xer+s8Ax7NSSi+l6HWQcsBh1WYN37/EnhmzfcHmp1mwA/lZAiAMfmNJAEkSbb1w3PKHiPmnnQtrQl0XrQ469xuIvJ3NEsmtw/mHpMV/L1vH/7ozePK57drSRn9aYNNc5MoplRK9pyGI6rzsEG053wVFnNsDbFf7UG93hiashJH7cUPZo8azC6wXXv+DVThDK778DAv+rzmT+tuF+JdddycQvtneQXfia9LoVCA3iU1EO1up3QEP5Cp+5V27opQSnrpwofzWE9wMdrHxrX+9rT7p80dg6zpOG22fcjkqQgX8LXK2mvANNHJ8S9KprD/rE6cKwgDRrwsTsRSnyFBVvgKfGcEMBk3oQjAjPehu7qhapLvMaSdJhaaB0DW7137msOytMb2JWybOTrKNxlCDZGrPard/VP1hrH0fq5J8VMoojmXFwlnMceafyg2kvFPeOqgqMle5RSpLL3ngIKOiPOBaX6votiCXYV0PGezamvEL4OyAc98tfHrzOuKfeUfj7MBQcNRteQmRPM26+IdmxvuIlz86aVnepiu2l8+EbHiWoh9I9HJCbmZbF96sdWH+I6mnJuExas96FVlxUuyz/TeIbExRgAQbRsTbHQiF0UvByupokNLrBmyXUylL3KEHYFi1YjBYPI83vHFuO96omGf2gW0rDZh+NJqXyKBpYk=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(8676002)(186003)(83380400001)(6916009)(508600001)(36756003)(53546011)(6486002)(4326008)(54906003)(15650500001)(956004)(316002)(8936002)(2906002)(26005)(38100700002)(86362001)(16576012)(31686004)(66946007)(66556008)(31696002)(66476007)(2616005)(5660300002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UzQ5Y0k3L3ZlNnRIZlNmbFJXM2tKZitibVdQYlJZcTF6REV0d25NV3BlR0NH?=
 =?utf-8?B?NzIwM05HUS9wci9INmRUeENPc1VHQjhQTXhxV21jOHRGUHlnV2xxOE9kejBO?=
 =?utf-8?B?bDVuYm9rTGxMUEFGWmU3TzZUc213UlpoZ2hyKytYVGw4aHJrMFdTQXphMGRZ?=
 =?utf-8?B?UXJiTXhVTEFWOW5ob21SZXR5Q1VyTWorUkhRZWJMWG8wQlcxNlBUS1RJczhN?=
 =?utf-8?B?MWlZbzlCUS9OYmFFbnNmUzdQVlZ4eEVBb0dpeVJjWUdlNEdEVWVoeVh6eE9P?=
 =?utf-8?B?OVE5blBGeldQeGZQUDcvMnFOa3JoYWhsRVV3K0NBNlphR2syYWhkaWc3UzY0?=
 =?utf-8?B?REFNRmNZQndUMG56cmM4aVp5NTJYVEZQOVliY2FuZnlRU2pyT0E0dFdGMU13?=
 =?utf-8?B?cDV1cVE3blVkREk5L0x5WG1MbTI3Q0RIMDZGdEJ4cnh4YkhvaVBoOUFHdHR5?=
 =?utf-8?B?ZzlPWm1jZUcyMnlBbDNyU2tGTjZQR1dhbzBEMUJITDkwNitSUlZYZFhSQmRG?=
 =?utf-8?B?Vk1uZUpiV0dvdDdSRW1tYUhiaVdVUFFpTUJ6WUs1aEtPemdyS3NvQlJBZkpI?=
 =?utf-8?B?QzViN3NDN3VtZVVuQ3NkMVIrTHZxWGNreHQ5ZjJmWUlqNVpjUVBIdFMyRkJ2?=
 =?utf-8?B?TnR6K1F1MlJzb3Q4aThXbXF2VGpqMmhJbTZnMXhieSt3Y21sMmJiT2JibExQ?=
 =?utf-8?B?R2RJZG5NS0doQ29kVmZMenRyVlRINDBua2hoWWhDdXo5Vkp2aU12TGV5bjJW?=
 =?utf-8?B?eDlTaDNuRmppZS9iWktIaDkyVFppMm56M0E4VlUyY1RrR1RhcFlxZ29TODJ1?=
 =?utf-8?B?RFROenJjMWQ1aHpMT0hXTGlTWHA5UldTZmM2dE4yeDdDWW50L3hleWR3UFNh?=
 =?utf-8?B?TStTL2thQldYQ085QjJiTitLQW5xeWRBTW04eDhmR0VYUnV2ekREMUxPUTZi?=
 =?utf-8?B?b1ZJY0lDWXE1bjNSVHhJbjZvTGc2a1pFbmhXbFVVek5mYTJoNVk2Q1NRN21n?=
 =?utf-8?B?ZTRJa2l3WTlvZkNDRVR1a2VweDNReGlrdVNNUzdXeXYzc1JhQXZDeU1iWWk1?=
 =?utf-8?B?WkIxNnBvY1ZJb0lQSklpcTlmS2hsOEs3dlFpdTlsT0QxdjlQSGpVaHF4eXAx?=
 =?utf-8?B?U1Bobmtibi96WldLLzlsZDZRa0tXVFBEOVVRWXkvc2dlWm9aemVtS1Btcmsv?=
 =?utf-8?B?R3FmVHJyQTZKLzRHVVZrbkdvYklyc2svZzhHK0JlOFJzZUs0QW43ZGJPdWI4?=
 =?utf-8?B?b3FmUDd1TnpkZXR5MXRxUnhVWXVOR3lJS1lseG5IcXBHYlJ0UUUvWElmcVRx?=
 =?utf-8?B?czRUQ1plZXpMTXdNRG95RXVLSDh3UmFLTE1oSDVUZDVDUU5HMHBRUnZhelox?=
 =?utf-8?B?UHBlazFXcTBPU1BoVmhSZ0tjY2dtQythZER5WVlKQzZxODR4cUNLb1ZoMEJW?=
 =?utf-8?B?RVBHUGRFMXBTdDhUNGoxMHFjWUI2LzUxeUdFK081aG1vcUh1bmN6OUhDY2lk?=
 =?utf-8?B?VGkvM2NoNjBuem1KSGRPQlRLZGMvSjhzWkJEZDFHdDhOYk1DTkVNZ1dnaXdZ?=
 =?utf-8?B?d0FubUIrN1pWcnRTaFEveGxxWG00S3B4VmhSYjVqeGVjU2hhbHhwaXNoeUE1?=
 =?utf-8?B?UUsxeGZyNDZiYnZsaFJhRkU3SXMxK1FCQTExMnZVa1J3ZWcxdVNKcmx0UmtM?=
 =?utf-8?B?aXZzQTBWYldVdEN4M0tENmhnQ2c2Qko0RWQ1a0FTYTNnd3cwYWQrWnJuRUhp?=
 =?utf-8?Q?UtOe/jFzc5I4GxLc3rEkeXLEHj65vi1x1w5CObx?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f37593f2-440b-4058-60f6-08d960be1f2e
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Aug 2021 13:59:53.4011
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: w0W7CjQeRUK+WT5bgWL3WyKH1ADWlfCNGLhfsTyFvlESACOuaJ/g+8dZD96L3gZ8+3vsn1czF74Xxs4CI9h5bw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB7149

On 16.08.2021 15:58, Jan Beulich wrote:
> On 16.08.2021 15:35, Andrew Cooper wrote:
>> Booting Xen as a PVH guest currently yields:
>>
>>   (XEN) ACPI: SLEEP INFO: pm1x_cnt[1:b004,1:0], pm1x_evt[1:b000,1:0]
>>   (XEN) ACPI: FACS is not 64-byte aligned: 0xfc001010<2>ACPI: wakeup_vec[fc00101c], vec_size[20]
>>   (XEN) ACPI: Local APIC address 0xfee00000
>>
>> Insert newlines as appropriate.
>>
>> Fixes: d3faf9badf52 ("[host s3] Retrieve necessary sleep information from plain-text ACPI tables (FADT/FACS), and keep one hypercall remained for sleep notification.")
>> Fixes: 0f089bbf43ec ("x86/ACPI: fix S3 wakeup vector mapping")
>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> 
> Acked-by: Jan Beulich <jbeulich@suse.com>
> 
> I'm curious though how you came to notice: I hope there isn't any
> hardware/firmware actually triggering emission of these log messages?

And actually you answer this in the first line of the description,
while when reading I skipped straight to the quoted output. I'm sorry.

Jan


