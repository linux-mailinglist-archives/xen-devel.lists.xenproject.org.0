Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AEB4B3BE8B4
	for <lists+xen-devel@lfdr.de>; Wed,  7 Jul 2021 15:22:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.152236.281272 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m17VM-0000L5-4d; Wed, 07 Jul 2021 13:22:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 152236.281272; Wed, 07 Jul 2021 13:22:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m17VM-0000Hf-1L; Wed, 07 Jul 2021 13:22:20 +0000
Received: by outflank-mailman (input) for mailman id 152236;
 Wed, 07 Jul 2021 13:22:18 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=lj3M=L7=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1m17VK-0000HJ-7t
 for xen-devel@lists.xenproject.org; Wed, 07 Jul 2021 13:22:18 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.109.102])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 7b84e6c8-62dc-42f9-ac14-821e335fd29b;
 Wed, 07 Jul 2021 13:22:17 +0000 (UTC)
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur01lp2057.outbound.protection.outlook.com [104.47.1.57]) (Using
 TLS) by relay.mimecast.com with ESMTP id de-mta-9-dODoB0YhOwmibbreY6eeJQ-1;
 Wed, 07 Jul 2021 15:22:15 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB5744.eurprd04.prod.outlook.com (2603:10a6:803:e4::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4308.20; Wed, 7 Jul
 2021 13:22:14 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::99d3:99cd:8adf:3eea]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::99d3:99cd:8adf:3eea%5]) with mapi id 15.20.4287.033; Wed, 7 Jul 2021
 13:22:14 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AM9P192CA0015.EURP192.PROD.OUTLOOK.COM (2603:10a6:20b:21d::20) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4308.19 via Frontend Transport; Wed, 7 Jul 2021 13:22:14 +0000
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
X-Inumbo-ID: 7b84e6c8-62dc-42f9-ac14-821e335fd29b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1625664136;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=fo3qeA+6UmJlxNh6K9+yjBGqnUH5uGZG6DVR676Q2CE=;
	b=i0ppTXcY9MmRfXOMKCQnX6iPoOKvY6qN1z/jsCn3k/ch+Vdm4t1XXE0XzCKQWyaDO0zdo7
	WTOsUEidXo50YoYdffM0WyokiTqbQkc5Mk4K/4kglYzTMkBkc8T9Sv3S/uvIEdUZEhBj0k
	n36WHytkZMxOLMcVOlpuK0NejpE9rW8=
X-MC-Unique: dODoB0YhOwmibbreY6eeJQ-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EhK8/vFZxcHG9PmUDWPLbTepv6fUYY+Wtwgpibx6jsnSqJy8hIU7ugcXrxqE4Ep347TfS3M9R7MzugH8KhLs1q6oBm2KMfbQ/e1plx17iEgNM5K5h/WqcD3zOddKQdDGcGFa/hrG2PZAnzompNfCBAqAb90rpWmtKRIp0H1eY4bQ0NLTSaeO4EHBrlukPZvrdt1ydHYaardFCsMrwlco4AUwT6qFlgwxrlM5m54Kz7MroDMOOXsqhlX12M04UheNADdJYEnfan0rnqbP8lOBDFpvX7i1xdlZ6Hgj1ZXI/6it/onASrXnxYP7OugQDZPW7dfjeaLm5sHI9TY9xDzz3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fo3qeA+6UmJlxNh6K9+yjBGqnUH5uGZG6DVR676Q2CE=;
 b=Hb8M3PNkyoLcNCALNGgByS91R6ILmUQWgkZcxRrbi2CW//5ZKKNyWj/CVl7T7GDVnG6UtfAVgJzctnGru2CnXCVYNivz0InkSCJo7Leny1+c0Q5sftqGeUkJcy7XEDdxtvJGuqDlsHyj6u2xw+jOq0ZwmQXP73QaU/grZJ+WajFv88GdECzgxx+L6vhZ5DENGe16gH/jkOPhs0y//CBC0TuEkIKwFU+rYuaZ0Jd+JZHjgf1K7u4w7Oa0824UbUGCF6eDfzibjHK/5cZm7JN/6Nin31iaKcb2BzM+F/010LqmafDRwBxqR3Ae/Vhy/D8Ox2AeTFEmGGU0ly/mFTpfoQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: citrix.com; dkim=none (message not signed)
 header.d=none;citrix.com; dmarc=none action=none header.from=suse.com;
Subject: [PATCH 2/2] CHANGELOG: record changed PCI device quarantining default
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Paul Durrant <paul@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>
References: <95ceeea0-5623-952e-00c9-2c7f1a3459dc@suse.com>
Message-ID: <79d35b3a-4f13-fd5b-91db-2805c999b36d@suse.com>
Date: Wed, 7 Jul 2021 15:22:13 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <95ceeea0-5623-952e-00c9-2c7f1a3459dc@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM9P192CA0015.EURP192.PROD.OUTLOOK.COM
 (2603:10a6:20b:21d::20) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 79070728-01d0-405e-281a-08d9414a3c80
X-MS-TrafficTypeDiagnostic: VI1PR04MB5744:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB5744DDE115D8E7EAB53EE640B31A9@VI1PR04MB5744.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1850;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	qW/IvKQKY53j/iy9GqPJrZCwO00vJt2EpIuh6B1ZXqgYUBnIL0bX+DK9DHjMmvnTdaQc9Vlg1XH7xmP3P7TAXpbL8IFJp52DZWcL5uIG2Wg5xdGDQcg1o7ho9TfO8GTLJ/vGtZ0rnFln79Z8D4p3bok3QLmLY/gAH73wXFyrNHIUyrt9b74zAg2dbyXQ6N9xBIcKS9Q4CqKZaGsTGTGRaGwfQvguKKDp5/0ujb28YSlDbS0or+hKprCD6fFpueuwAYoSO7/rwM+V2p738taNnL4+qL2ilBLTt7Z+B63NXgDyfuiIdh3llym4eWWf8rhO9prKkW5X9pEd9/QqAnmp56Bq57EmFZ2oTZoYOD+r8bRLMcIkZ5XSHFogcTetJHpqY5e+40t9uPRMcbY/ucKe7MjYSYuNhpdpx+uKL5sB2TubJv3TNMVVtYOhtQgy/2WBikk3rqdaFIn5WT4F9/1PNL7JoCztfeFLtCLPXPsVDHeC3K6hOHbdvtGmC69DsLu4+uz9iUgyzcyOmNDHmhkSRB31aJikRi/L7qQVzTSTc7/nKCRRtLdeFsZezCP5vbPSc0FErvOdxysoXF4oWpSQ8QI7z7LxVfYuwLEbTaiGNa96/e6wrdy8MiN/Y/AZ/+NVx0L96xINZJ6LUjs/OWScnhO9eS3ylDpdE5lP3GAmyfz/xHdyataGZP53ttMuATYe161tqApYkqooFu+HfGJmuooS8ywJ+09LJMXoikxvY9Oq9p2FlI9c52ocGXJaIZ9/rVKSvtAufu41hjuqMOe/nKSv9JBccwrciqhOSsu51LwhNiNEGMGBjN0sdQir5jb1sVEtHAxkbiRvyfDpY3J71Dye9qJxWwtF0lxe1LQpHqOuZMHbFK4rVN9TtMD3PHwdByHHoOxfba1MMyeBDEwybQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(376002)(136003)(39860400002)(346002)(396003)(366004)(316002)(2906002)(86362001)(6916009)(36756003)(66946007)(66476007)(6486002)(31686004)(66556008)(8676002)(4326008)(54906003)(186003)(83380400001)(956004)(478600001)(26005)(2616005)(31696002)(8936002)(38100700002)(5660300002)(16576012)(4744005)(59356011)(219803003)(207903002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?YXlBRHV6Tk52MU1QQS9IdHhSbWI4cFI4dkZyNGp0ZWV3b2kzKzlpQlR5N0NU?=
 =?utf-8?B?Z2xjNmNTTThwNzFkVWVCTjE1RnU0eFg3VDV3T3V4ZytVbkRUR0xKU3Mxb3dr?=
 =?utf-8?B?Q1B0dTBJM25YKzFSNlJwWVJMUm92QmNpcWJSRE5oV3FuajBRSkhtNVQzSEc3?=
 =?utf-8?B?L3RTRTJ4TGhyODNwemRnTDBvaU15aFhDRFp0eXNveHB0VkJwaGdIUWFxYmc0?=
 =?utf-8?B?UlhJUTlPN1pXc2pibFJvT20zOTVzNzRZZHhBZU9DY1praWlWYlZabzhiTE9K?=
 =?utf-8?B?ZGNhYWJqQ2lML01oRmVXbFZReklidjVvcWVnMDF0RGgyc0piNkJBd0xUR0cw?=
 =?utf-8?B?Z0oxZEJBUURLZHpHTU5xekhsRkMxZDRHRnlteTVoZkkzeVlrcFB0UDhLbDdq?=
 =?utf-8?B?bllRdSs3UjhJWWJ2b3F4RzJhRzVBY2FFQVE3blhXVFh4TURsa0hmemxxbE1t?=
 =?utf-8?B?ZG9BNXUxcE9zR1ovc2NlRlBOaGRpU3piM2orbUdaVnp2Q2d3azBOYlZPMUZw?=
 =?utf-8?B?a2hESEJFeTZ0NFgxMjBabG1ZRVRVNGZEcW02MGNqaEFnZHg4V0p6QzRvTmRX?=
 =?utf-8?B?ZHByWEM4YzdFcC9pV3YrbG00ZHRVWWJYcVM5N3M2a2V5ckMxYXZYNHl3MmRF?=
 =?utf-8?B?czhiNkVycWEzbVZCNEZtRXY1eEd2REdPSTlTWFZXTXJlbUdHL1VmWjZ5Z1FO?=
 =?utf-8?B?NGhWUHQ2alVUdnNjT2JxamhqZytDRmkzQkZYd3VUVkVHdHpzdy9ybVFzVmtx?=
 =?utf-8?B?TU1GT3hDVGIyODZOdzJRdHcrWXByME9xUjYxZzJ4QVkvbU5wampZenlidWc3?=
 =?utf-8?B?b2tuNlRiYVVVV3JLMDdvSHl5b0ZNWTJ4SFZLU0Y0NEJqK3EyU2tsUXIvc0o4?=
 =?utf-8?B?Z3dJQU5ZUDhQdkU0WWU4K0hqUlFjd3AxZDRjSkl4TjJBdXFrenVMc0l0Qzdh?=
 =?utf-8?B?NmRzQnpKRVllOHgzdHhERWs0SlR2dmNUc29KdGEwNnorbGh1THc4eFRXRFlO?=
 =?utf-8?B?aFRMTlZnRllSd01SNWVuTzZPRnI4R1ovcm1naEVpRGFoUjZBdmplRXJQczNk?=
 =?utf-8?B?cU1LQjk4S2haU2R4ZUhyODA5Wi8ySUQ5SzFLWk1KQzE3OWU4U2h2RzI2QXhK?=
 =?utf-8?B?YjNpM3ArNkNCQ0l1VVRzM013NkkrN2V4QzFOSjgxcnljZVF3YU1oSUlsSktR?=
 =?utf-8?B?UDhDdFFiUHlGRjZoUHBoYTkzR3I5YjQ4VDNzMFpUanBqWnZSa0lqWDFjbVBZ?=
 =?utf-8?B?NnczYXFLZ3pvUHRXRU0rVGY0dmxJeHM2bnlwUExHMmRwSjVHaUJtU2R4bHlU?=
 =?utf-8?B?V21nYlRtSWR6MjBDOWJwYlo4Q3UrODQvdjB0ajBWbkprUDFXS1Y4S0RJSEJV?=
 =?utf-8?B?ZzkrVHNXN2lKczZyZ2xyTWhCdTFtK2hjL1Bhd1Q3dXlYUWFjYmZVTDBINisw?=
 =?utf-8?B?Z0YxSEdQd05qVzA2Nk8wRzVBRC9oY1BWc3JJV0V5anpMdUxOaGFSYVdkeUdo?=
 =?utf-8?B?WHlOeGx1OGc0UVIrRjlxMXg2QnlTcyt4YmxJc2cvMWQrbkJ6eUQrK1BJenFZ?=
 =?utf-8?B?ZkwvL2x4eDhEVHhpb2habkNVbHorcnFraWtaSE1QL0NGNWQyd3ZKd0FFOEQ2?=
 =?utf-8?B?a284OExTVHl5V1BVWEZCd1B2c25paFZRNTNVVDVZTHRrVklYQUUzMVgvdUNV?=
 =?utf-8?B?RUpIeWRYejZVZmFZTEU0ZU52Y1ZEcDFReEk0c2xKR3h5dFQySi9CUXVHaUhD?=
 =?utf-8?Q?wjp3E4IX87iQrWcUtxeprxVr5FYiZInL5vEP/NS?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 79070728-01d0-405e-281a-08d9414a3c80
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jul 2021 13:22:14.9182
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4dizkaLkMzYLOY49eYw8GhBOP+tJnf5BrqB33o/1E9Oww9KKOscVkhmS4nbkzHJyB3BrniVcjlA1298cdsIoCQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB5744

This amends commit 980d6acf1517 ("IOMMU: make DMA containment of
quarantined devices optional").

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/CHANGELOG.md
+++ b/CHANGELOG.md
@@ -10,6 +10,13 @@ The format is based on [Keep a Changelog
  - XENSTORED_ROOTDIR environment variable from configuartion files and
    initscripts, due to being unused.
 
+### Changed
+ - Quarantining of passed-through PCI devices no longer defaults to directing I/O to a scratch
+   page, matching original post-XSA-302 behavior (albeit the change was also backported, first
+   appearing in 4.12.2 and 4.11.4). Prior (4.13...4.15-like) behavior can be arranged for
+   either by enabling the IOMMU_QUARANTINE_SCRATCH_PAGE setting at build (configuration) time
+   or by passing "iommu=quarantine=scratch-page" on the hypervisor command line.
+
 ## [4.15.0 UNRELEASED](https://xenbits.xen.org/gitweb/?p=xen.git;a=shortlog;h=RELEASE-4.15.0) - TBD
 
 ### Added / support upgraded


