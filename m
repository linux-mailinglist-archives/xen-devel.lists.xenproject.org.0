Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C8264B1103
	for <lists+xen-devel@lfdr.de>; Thu, 10 Feb 2022 15:55:49 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.269869.464007 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nIAqg-0003eo-4B; Thu, 10 Feb 2022 14:55:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 269869.464007; Thu, 10 Feb 2022 14:55:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nIAqg-0003bZ-0P; Thu, 10 Feb 2022 14:55:06 +0000
Received: by outflank-mailman (input) for mailman id 269869;
 Thu, 10 Feb 2022 14:55:05 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=4tMu=SZ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nIAqf-0003bT-0d
 for xen-devel@lists.xenproject.org; Thu, 10 Feb 2022 14:55:05 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6d79c91d-8a81-11ec-8eb8-a37418f5ba1a;
 Thu, 10 Feb 2022 15:55:03 +0100 (CET)
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur01lp2059.outbound.protection.outlook.com [104.47.2.59]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-16-2csi-2ygNsunlKZXV4y8KQ-1; Thu, 10 Feb 2022 15:55:01 +0100
Received: from AM0PR04MB5587.eurprd04.prod.outlook.com (2603:10a6:208:125::12)
 by VI1PR0401MB2240.eurprd04.prod.outlook.com (2603:10a6:800:29::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.19; Thu, 10 Feb
 2022 14:55:00 +0000
Received: from AM0PR04MB5587.eurprd04.prod.outlook.com
 ([fe80::54e:e7d:545a:da84]) by AM0PR04MB5587.eurprd04.prod.outlook.com
 ([fe80::54e:e7d:545a:da84%3]) with mapi id 15.20.4951.019; Thu, 10 Feb 2022
 14:55:00 +0000
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
X-Inumbo-ID: 6d79c91d-8a81-11ec-8eb8-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1644504903;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=ILYp4bDlGe9i0LjIfqEZ5PDhCzdc1cmW3BbGyzH4ehU=;
	b=aT6IddcK1PYVwMkpABfZPxyUUw75AkYWbebjFLa+snp+LdJBsfmtdf0vU+g3cQSRalAaQC
	Et0ZEXvCjJJxBHryWv5IMGtfvo1puZn431jTcgEFNCZoSXfxyrrXQbwLWoGR/tvv2rHs/d
	D40fHUG+aGC7sIUq5/0B2bRnFa/EY5E=
X-MC-Unique: 2csi-2ygNsunlKZXV4y8KQ-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gNga6g8je6WbHAjgtgA+T1FfSifrZrB8F7plZhbd21vA9lW9pJChuRO8feHGDXpK4oy8YSFHknHklRYhO4RRDD/I2ccq18OOvqr1/L9NafM9cS0mNkRoX9e4CqhlBJQbo8GhUhONGo3Zo0yTxRjUbLdYOcAaJnH0YVrFf8vnFb1TlradjoVrPgvmpdjmxzWQACbCnmGOHa/XB7RqiY7xLyw6CbEAmjedvZeU3nrTrpegW1SVIof3CpIgVZw8TCavxfxjRRa0IxbkqfjCMx2VDBVNDwx4x2UPeiIQxvIP15TK57oWQV6uZywM12H8CPH6mmCD7z+YWd8w8zY4X4nx0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ILYp4bDlGe9i0LjIfqEZ5PDhCzdc1cmW3BbGyzH4ehU=;
 b=Unh4kLl11DgxJOvDITls8rObDd+jzZMLgf3J7T141CGMea02WtHLFwG94XNcMKNsidZ45qm9D1wTZK5PqFUXgxd+q85CNKI791qoMavj9LVOBdj0xkNPGX1JvWbIDxLcApAsf1m0fVOZb8l9s0j2ehHvYpMm/vsP5IE3Ieec2tnF8L5p2VOci51kxGEhY/sUrIuBBqBBzgXKVNQVw+vm92xDVA3e4h0037n65B5E+ei/YFRyeGmUxwOHhU/EqAhyl6UU3ZNNvzGZc8WX2ahdvw1xduR5FvFoBuuq+Hcy2N0VHk7kVGWNIn3UI1/7xExJ0qH8JiQD8QAgitEebcYcDQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <5d275d7a-7751-af19-db4f-d91e3592d30f@suse.com>
Date: Thu, 10 Feb 2022 15:54:59 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.0
Content-Language: en-US
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH 0/3] x86/Intel: family 0xF tidying
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM6PR05CA0013.eurprd05.prod.outlook.com
 (2603:10a6:20b:2e::26) To AM0PR04MB5587.eurprd04.prod.outlook.com
 (2603:10a6:208:125::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3f7855a0-07ca-44f8-e57b-08d9eca54fd2
X-MS-TrafficTypeDiagnostic: VI1PR0401MB2240:EE_
X-Microsoft-Antispam-PRVS:
	<VI1PR0401MB2240BC54178FB338FC6D2737B32F9@VI1PR0401MB2240.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	5WgSHjDXu5yJOgKhCRbjoQlj92wwSbxaSDYawUUaRYlZNQ4YUwM0j6GdAdUT+vYHm1cTO/ILmuxfqAG3OUcMwT6/KG5tIpeWj4nZs4iiZwmx3WAt1kqHwOoYLkXMmKwUU0wxL4TAI2FpEIf9CSooB20/KZcy2CiHT4ii+fs/evLckFDiADXjGYes7N5jeX9hTPYxKq8PezVvghVbkqQmoWk4C//iKzu29IHJHla0Hdh2+1qFZTuHXEKPT/SRe+5ZUhwaw7MSUSlgDGrL5+t19FQ5epk+W1PFPxuM8NAry7hrrw/WKfCVs87sS4wkGLAJLwGYmHg0miUDT6YoHqVV9mrjIvh7xaKFYCGrhujkqX9x08DhN+olZ8vUUxRT4V62AZHDw1sajJJfmz6ObqPBq4qXOj6wNR6HKgNDD+WjFtgizaF6Mdx+FT7S/vU0q72WH5n5sYmpsgMbGS2byOW9WE6wxezuGhHgwb53C180mE9+q2iI6fQ5UlZz1h3xF2sg+PY8JR4AFT/g6zuWcU+uiWnNnEAIWDSUBvQfpqQk+b0LVuHt/7vZJgXkN/Xs5BwWTZTe/o1/GAf5DUZrmhAEkEtWoF348LIxZoK3t6qn1Ulzvg7Eos2QTp0nJ7jJ4Tkm7LDkyf0/04bIRK7FLncGcsqIt4dIvu+qOU3A8ErdT5o3I9vlrVqndvayKhtX7tAKcvcRIEsX0gP6uZo8wwmP49M9GsUyBe8/fgS843D4XicQbVoZUCiQHjpfAfaPWrcm
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR04MB5587.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(4326008)(86362001)(31696002)(316002)(6486002)(66556008)(6512007)(66476007)(2906002)(54906003)(8676002)(6506007)(508600001)(66946007)(31686004)(6916009)(36756003)(38100700002)(2616005)(5660300002)(26005)(186003)(8936002)(4744005)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UTRHZ2w4b2QxVUtlYjk3aytaVnNxbHZGZUxvaDh0NTNsY1VtR3YxUzJ0SWNR?=
 =?utf-8?B?blFTTVJBVVhuZ0FsSVVVaktRMFJlUzkwTEtDNTNibjFmRWFvUms4NU5mTnFT?=
 =?utf-8?B?andTZXhORVgyc2lnRzFOVGlSSHY1aGFUSFFqMDk0NmJIVjU3WHkvVFhtNEJC?=
 =?utf-8?B?ZU1JSzNsb29XU2ZFRGFaL2JhZWJUVi94dWN6dDQxbGZNeWtKckVBYTk5Wkc0?=
 =?utf-8?B?YTQrdjcvWExyTjYrSGlvSVJBeVYwVFlPTWg4YVlXaWtGWmtieWswVWJjUDFj?=
 =?utf-8?B?SEx3bTJHVk9qMnI5dmR5cnhacFhoYUVHeURSZEVZTlYxUnVyRzNjRWs2dkFI?=
 =?utf-8?B?cXU2TVBIMFVHRjVJQW9teTNqempWUCtqWjNuOVJKcDdNTDVOUWQ1WEdXNjRK?=
 =?utf-8?B?dzRzd1VwdVNwTmk1cVJYTDhXTWRvOGRMS2J3RGR5OXFWdC9wTXRuY25raWRJ?=
 =?utf-8?B?amYrY0Q3bVEwYkcyS2dvZHlVaHZIbHJ0WnZuT21BbThFbW91SFpFWUQySTdB?=
 =?utf-8?B?T2dJcEJUZFd4RnJtUG5EQ3FSNnRLWUlUM0N0ZVAveGt3SnlNOTJUUVZLTmpK?=
 =?utf-8?B?bnZqcGRSSm9zZElzeGJyUno3Z3dEeGp6ZWltbktCNDY3TTQ3bFFVRTJQWE5x?=
 =?utf-8?B?Y1p5ZFpZTmpiZzBkYWdqNWhva3ZzMnEzWTBiV2c4c0dpTmIwaXd5elQrRE1a?=
 =?utf-8?B?UDdxUm55UFRGQ2k4a0hwdEtlNCtTaXRuQTRoTXdnWlNndEpiOWpvcDB1aWFW?=
 =?utf-8?B?WkpOV2R1aUVkWGx1M0hXTWdxMVlYK0dYeVBpVVhVV1M2RG1JejRwMStXNTk5?=
 =?utf-8?B?WXdIazdhR3REVENCU3YyV2RRTDRQUGtUK1NDU01xeFR4cDBpY3JiYVhTZzE2?=
 =?utf-8?B?SG5ZK0d1dmhPcDQ2S2EwOUF1ZUQ0NVFGcmhWU3RRRTcrc2JLNERRd1BpL0Zl?=
 =?utf-8?B?YnZXWWFpOEU2QzVFTXNzY3RJSHVkeWJVNTFNVE91Sy9ERllEMnlZSDdDTlJU?=
 =?utf-8?B?RzIwTWJRclVlcWlrZFlnVWx3ZW9QanZOKzZkMDBpQ3R3QWEvdE8yZjN2blRp?=
 =?utf-8?B?ZWwzbEFpa2FOYkc5bnZCaHNCMlVyNVNnM2lsM3p0R3BSemFOMDBXR3ZvVVhy?=
 =?utf-8?B?eUgvVVBMT1pnZFJvQXl3NlRQaEhtNnhsUUJqZjRTeVRSdnpqbnVOUmlIazZv?=
 =?utf-8?B?WjVXOGpwMkUzc1RESm1PdFhobnBKVmVBeFhscVczWk5OWGtPTmpkNURnYXJ6?=
 =?utf-8?B?Uk9hK2hDLzNqRC81a1V4QjJIVDdKdE9wK1QxYzQ0VFh4M1BTMVR1K3I1VEs3?=
 =?utf-8?B?ZFYzb2RteU5PQjk4NnJjS2FaYXYzY0x2bDVBSVlJdFhJTHF5SHpBT095SGhW?=
 =?utf-8?B?NkxOM2xPdmhLc3Q4dUN4RHNIQW9kcjVRaE9xTEV6RGk5ejlJMGxvZSsxd1RK?=
 =?utf-8?B?LzRrU2FPZmw0MGtrTGk4ZVhwNW11NUVDSDdwbnFtdE9PVUd3OWg5eFVEMVdV?=
 =?utf-8?B?UFF6YlcvYWxOd0kwcDhyY1R1Q2lmU0RQRmVhaUUvQVhOZVRGNFhlaXRhOFJu?=
 =?utf-8?B?Y2ZWR05rN25JK3ZHWjV2TnlXWk9pMldqR1hCQ2E3WEJBNTNUUWVYVXQ4ZWVF?=
 =?utf-8?B?Q1NoVmZIYUZwa0lWeFE5M2o4eTNMZVU4QSszbXBYcjRxRThuQkZ6dEpJdXBQ?=
 =?utf-8?B?RnN4NGhYVGdaRUhGeHp3UzJmWWp6Yks3RVI0SFdwZHF6R3FYWGhha05IMnVB?=
 =?utf-8?B?a3JqTjluMDFTSlB1dFhwQ0J3eWdWRDdnYitIN2tVb1lraEQyLzZENndrazB2?=
 =?utf-8?B?QWpLNXpDaTdjM3pjLzd2RkV3ditPbDB4WWFwOWpXTmFaMUt5RHN1aHIzZzFE?=
 =?utf-8?B?alhXM0F3K2Vidm9IUGx4VE9vQVdhbm93Tm11c0dZTnAzZTBTRkdTb1RyYUUr?=
 =?utf-8?B?bC9pYmM0bmVyZWw3MUYraVZReWNza25rUnQyaTllMXY1TjVUSEZ2UHV0aHdS?=
 =?utf-8?B?dnBsb0kycHJIdjRLZWZNK3R0ckVsNXJ6NzNPQkRORzFKUzlJYVl1cEoxck1y?=
 =?utf-8?B?R2xPa2dLUlRLSUhtS2s2NnFzbHNNelFSU01uZzZSZlZzaUc1eDNXS3d3SnM1?=
 =?utf-8?B?Y2hkdlBHa0toNE9xSUN2R2hoTExaYVRaNDZvTHN1OFgrZDZlL09jREJEbFJ0?=
 =?utf-8?Q?XPCwFNFUj0aey6WeCEPBdHI=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3f7855a0-07ca-44f8-e57b-08d9eca54fd2
X-MS-Exchange-CrossTenant-AuthSource: AM0PR04MB5587.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Feb 2022 14:55:00.3553
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qLswmzQgrSLREnoh3ANEIhhBNAeRMYNnKvD3Z/6PzH+a6zMnO0fMoQgSyilAbpxpFX40SKI0iZSB3sTvgBtMhA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0401MB2240

While the first two patches deal with a long standing annoyance,
the last one covers yet another bit of information we can retrieve
and log, for reference with / comparison to other logged data.

1: skip PLATFORM_INFO reads on family 0xf
2: skip CORE_THREAD_COUNT read on family 0xf
3: also display CPU freq for family 0xf

Jan


