Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FA4A44636A
	for <lists+xen-devel@lfdr.de>; Fri,  5 Nov 2021 13:36:08 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.222284.384412 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1miyRn-0003lj-Ks; Fri, 05 Nov 2021 12:35:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 222284.384412; Fri, 05 Nov 2021 12:35:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1miyRn-0003jT-Gf; Fri, 05 Nov 2021 12:35:55 +0000
Received: by outflank-mailman (input) for mailman id 222284;
 Fri, 05 Nov 2021 12:35:53 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=mr/O=PY=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1miyRl-0002QJ-ED
 for xen-devel@lists.xenproject.org; Fri, 05 Nov 2021 12:35:53 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e9f5122a-3e34-11ec-a9d2-d9f7a1cc8784;
 Fri, 05 Nov 2021 13:35:52 +0100 (CET)
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04lp2054.outbound.protection.outlook.com [104.47.13.54]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-31-sK78T82QPKu0O40-FE22LQ-1; Fri, 05 Nov 2021 13:35:51 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR0402MB3935.eurprd04.prod.outlook.com (2603:10a6:803:1f::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4649.18; Fri, 5 Nov
 2021 12:35:48 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::8062:d7cb:ca45:1898]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::8062:d7cb:ca45:1898%3]) with mapi id 15.20.4649.022; Fri, 5 Nov 2021
 12:35:48 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AM5PR1001CA0039.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:206:15::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4669.10 via Frontend
 Transport; Fri, 5 Nov 2021 12:35:48 +0000
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
X-Inumbo-ID: e9f5122a-3e34-11ec-a9d2-d9f7a1cc8784
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1636115752;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=GaKPFWGowONl59x/p9INNuBefQFrOkbIUigpYW5UB78=;
	b=jpDv+1t9V6au1XkzNCNxEWsx0uQD2mFWvA4ALnNkWA6Eg431sPyib5m2EcqkkJ3NRjVjzT
	W5iZ2McdmRLA5xXKdgT9pSvuFvZSwJZZ0Mk9+jGHySRfywl09ZeJZXpgkDJYMnGaLCKtPk
	KhA8rvGTYZzzzsYNvTZuY+M41uZ7Owg=
X-MC-Unique: sK78T82QPKu0O40-FE22LQ-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bT3g1O2fjo3w8l5wh/07F87aPjFggzh5gYjJXRk7PgzOS0Dz1un/TunethOuQlWtPl0o6tELzta21QFCv58eQP/TEzm45+EkGHJWCwL/cYK51QA2aUdBXSgYPmGb05zACJlmfYFh7QQg5SaoWI0SuREHnA60fvhkHUqme89zR/rtX6NmZvxXO7jDAtg1AzYr3d4dL18t7+6hAnn/KJYrlyphRSoZq8LuoniZJm7s7wg4QM1ttDe+P+6WDlfMGnT90bIzlIPIMgn8HgpQWgZai8u2GFrmqi9gO40XRToZPjb2CetQTJ6qtNprfEmaOKpvSLaf4twSMSerjaEkQLvbNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GaKPFWGowONl59x/p9INNuBefQFrOkbIUigpYW5UB78=;
 b=FFDhcp2ltYwTcaetsNR3PrymCj21o3jdsoZb2XI+Gv4gwce9pMXz8dzYxZFJU2ll1Y0h9+AuUE5NoFKQtnLIlNqOdFoMX9WYpU8ARJfT6WTyUEUiyP8o324BgwthL5ZxruZ4AvIX1VfxRY+lkwrXdiykPyr0vvayw7O9CQZO6I6bxwZIe7yhg2v0aczYu5LcjfjmvRUrzZ3Mlj6PJk6TogI+Nd+Q+qyIQRX9Zd8aeJu1NIwDRKZ/37baK3heSsyhYDz55vTmq4pXmAaQS0renYmLulcuU03ArjjqVVAs9uyOlUKypa657tpSPeZk5d2H6tZZ0ohLQgAdo8mAId5SjQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <45034389-b5d7-4679-7874-9bdd6aeeb100@suse.com>
Date: Fri, 5 Nov 2021 13:35:46 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: [PATCH v2 6/6] x86/ACPI: drop dead interpreter-related code
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <d88cfda3-54e4-2323-f536-547879380815@suse.com>
In-Reply-To: <d88cfda3-54e4-2323-f536-547879380815@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM5PR1001CA0039.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:206:15::16) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: bbcf815f-05c6-4daa-a991-08d9a058cb9b
X-MS-TrafficTypeDiagnostic: VI1PR0402MB3935:
X-Microsoft-Antispam-PRVS:
	<VI1PR0402MB3935FBEA2A4F92C7AEE9736DB38E9@VI1PR0402MB3935.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5516;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	e/K3/w+7I4iNhEGIZi5ZbGpTopqz4C36hivas3uU7R6j371MmCK9C+kl9So0QUTZ8R45FQWWRuDksq2vbnYy6UHcB3xsWkZKG1xY3PYEPznz5UjEppug4PyuShYqFpijoZWEA+eOGT0Hqmrk+n6pZ2ftwMoZJOZe/NEO9FMROUrDN9eHQFR773ryWVdOaxv1PWe8VOjywELm0UaP3dPnZ9c8ZLOzn4mvf1H3uRXNI7/y+ze3v2X9qlmJxnZ6ygOgWabfO11tyt2kOE/7Mwrjg/Iz9U4VWri8bgNpB2cP7+dfn34op4JT5qGlljCfB5iMFcCyJAIepbwKUzDSWLjPasNMX4m0t+tdnJKNTdsd5ugfv9h6+Fs3olEscZnUCjDMRjGn/Zk4b6U7TIOXuejYi2VxIwpKHVYiHu0UjrIqpRPEXbGOuRzevd1oWHrI1XSaTMdyMPBIzOf/AlH2cDaC84JYd0Mh6qdi5rPdQ5mMtgTCj4t0rnx7Gy0vouWHetG0kf+hByZhO4t7m0hqotVm+ud8ijNmEMQjlh2obTStoMvnYw/jFecZbgSWrnXzlCpaoV5sZHlrCL7jrEQUuc1pAlmJpRPFW3z84cPfij9lW2WUmWEVuLEeZ1c9nGnud59vxYmABFhcyPtPnk2iUDoBM1V9fREP/GzauZouy9PsHlmZyOO/bb7iKEdGh8jb9fixg8uLSfT6f7HLmS2/6VLzyOw+Ke9WnVM2xhIXpk4ETUM=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(508600001)(2616005)(5660300002)(83380400001)(8936002)(6486002)(4744005)(956004)(186003)(36756003)(54906003)(31686004)(26005)(8676002)(66946007)(86362001)(6916009)(38100700002)(2906002)(316002)(66476007)(16576012)(31696002)(4326008)(66556008)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cU53MGVkMG9TLzFTQ0xWcDBNa3RueW16NUhUcEIvbUJoZ1VBSE1uR2pSOXd6?=
 =?utf-8?B?VWFCVG8rZy94cllnOEtKNzNDU3VjbHk1UXpOTStuT3hIeGxrTUR2aUxENHZz?=
 =?utf-8?B?RFFwZWdYcXpJOExsdnJKcW50VVVnZTZyOHNUSzlJSFIyVERWdjlaSmk4a3E5?=
 =?utf-8?B?R1gyV2h3c2ZIRWtKbmVNRGNsSUQ3VkVKdzRrbWYyYnJZUEY2Q0tld1VLaWF4?=
 =?utf-8?B?VkRXMTFTdUVLbjFaTDM5L1ExdXNoWFBieExSdFJGWTlTNFhFblBHZzFTUm9C?=
 =?utf-8?B?dWtTQk1nWWZVU3U1Y1l6djR0M1g0K085ODZxaDFCbWtkai9KRTV2dDB1azhL?=
 =?utf-8?B?N0xkSngrWHp0RzdOWFhZOEJkYmdJb3hGN2Y3MUJpcTlaWkZ0ZmlLby9GVU1P?=
 =?utf-8?B?WkhRejgrc0dhQnIzRnhnazgvV1N1Y0hnb2x2SktBRnkvT0cwcCtGVWJxSUxS?=
 =?utf-8?B?Yzh5b2xveHhTODhUZDNuT20xdXBBMHZXOUdLQktBMHBkOFp5dFlpT0JxQ2po?=
 =?utf-8?B?cVk1YkJEL0kzbXdJOGc0Yk1UZlU3TllKL1pMT3N0c0hQaFZvN0NFQjczOSth?=
 =?utf-8?B?WmFHOG1jZlFyQ1F3RzhJQ2FVZ3Zsajl1ZnhneVFYbnc2OHZzVkVFY2s5ckxw?=
 =?utf-8?B?a1ZVT29GLzNWbmtnVTFJV0JkMzF4VDZKbzEvZnNWUTREaS9sc1MrOFhsUTJJ?=
 =?utf-8?B?K05lTHJkcjBDYkk3d0FRT2xYWjBNdjFNYjMwMkp4ek9DL0F0ZkE4cDJPSG5E?=
 =?utf-8?B?VC9tN0tseHFKYUlYNkd5SC8vN3J3YWdMS3ZTdHVWUUJ4eDZpNkcvYmtCdkVL?=
 =?utf-8?B?ZXFoVjBJU0JhRUx4WHpEYnJxT0N0R3ZNb0FSYnhTRkw2TnhiZ0s5OGdCZkJN?=
 =?utf-8?B?bkgzZXBuQ1RCTFQ1VWdjSzk3RUhmK1N1N0hyZ0F0VnR5d2NGbWJiMGxUNmI5?=
 =?utf-8?B?VG1ZQTJPckN2dTFFd3lrbktxRXY1dkNmdHlvSDZjYm9NYnN4ZzZCMm1uY1NT?=
 =?utf-8?B?NnVYcm1rajg5QkJuRmEyRERhN0VkSEl4aUJBZk5kN3EvU21SOWRkYnFJa2NI?=
 =?utf-8?B?eHQzbWFHa0kyVWY0Y3BPbmxnbEh4Ri9ZTzVEZnlTcHBROW9IQ292TEZobFE1?=
 =?utf-8?B?ZEpvSTY4RjV5em9jYVVRbW9UTzZVUkZSUG9VOVRZUk9uOTcrMGxaTVR4a2U2?=
 =?utf-8?B?R1dxMkRUd2txLzZUcXdDMnJLVzJtcU54cTFxSWQ1UGtvazlzV1h4SHNNYmJr?=
 =?utf-8?B?Nlo2eW5wbk1rRzExeE5JU2JXckdjb2k3eUljYzI5Wit0U2ZabGtLUjQ0aWIr?=
 =?utf-8?B?MmdaNjJ6UDhZdnh0ZEZsNmNSN3Z0WnA5N1Y0WFUyRkhJUGxuRXV3SUxhSEhS?=
 =?utf-8?B?ME5oOXg4QnZXektxSGhNYU54OFYyVmJLRDNrWUM4b0dTR3lFdGlDUWNVbk9z?=
 =?utf-8?B?UXdHZExnREhxUXE3WVQrbVZ3MStlTFZoNFpncXBPcngvdFk0MUhVdDBzUUdC?=
 =?utf-8?B?K1BPT0pyM0ZOOTR5ZzZGbGhrb1F6OEdIdmovQ0hDL2QzWXUzeWIzQXI2UC8x?=
 =?utf-8?B?WURqazFwMmZxY0hncGZaTnJUeUxvSmNyb1A3RFBDdXRFYjVJZ3prMXQ1bGI4?=
 =?utf-8?B?RzhZZHk1RG5lT1Bwd29MSzl6cUVtMWp3ZURLQTVtMlhQOUhiZmN2SFV6ejhB?=
 =?utf-8?B?eDFFKzVDNnZwR0VwZ09BUTQ1N0hudU81QVROaHZJSFN5eURLUktyUnlIUVhQ?=
 =?utf-8?B?S01hbGFqcjlVZlQrQmlCSi9LcTNlakxnT1JMR1U1a3YzSVdBaDhNSDAxaFo5?=
 =?utf-8?B?NFd0ZUdGRFZscTZkNi81TklJN2xEaDN4VXFzWm13b2R0MUFXOWRmeXI4UG1o?=
 =?utf-8?B?WUR1Rng4cDhBcDJPSG5idzBWSVUxK3A4TXZzYTZrYWVyZVR3NFNNSElvbG5j?=
 =?utf-8?B?K1F2VVg0M3NUdzh1dSszQ1JTWXRFQVNQbVd4R3A3eXFwRVNHd2xobVl4cXJL?=
 =?utf-8?B?OWY1eUF5MzdhT3JiMFM2bWdsc3M3RXl3aHFObE1PRjgvcEttUkpaemVQWGhQ?=
 =?utf-8?B?TngzSnR4Tk56VWhuY3Bmd0RvcE1TRElhUnpuKzIwak5vN3krMkpwZFZTMEtL?=
 =?utf-8?B?NjVyWUlFSjJXSDVPUE1taEorZUJBNmE1T3pOTzRiaEh3RHovU2dwenVCN29a?=
 =?utf-8?Q?9AkN7A+z9I8ClB//yYTYM2o=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bbcf815f-05c6-4daa-a991-08d9a058cb9b
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Nov 2021 12:35:48.4317
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: y7rchkhi7sRSe5kpm8nw5Pihx0R7322KDZ9gBBNcpY+oC7MlR9/tHlZMjBS8BRUwLW+gyqK3EGUAISJreLgdgQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0402MB3935

CONFIG_ACPI_INTERPRETER does not get defined anywhere, the enclosed code
wouldn't build, and the default-to-phys logic works differently anyway
(see genapic/bigsmp.c:probe_bigsmp()).

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
v2: New.

--- a/xen/arch/x86/acpi/boot.c
+++ b/xen/arch/x86/acpi/boot.c
@@ -477,16 +477,6 @@ static int __init acpi_parse_fadt(struct
 	const struct acpi_table_fadt *fadt =
 		container_of(table, const struct acpi_table_fadt, header);
 
-#ifdef	CONFIG_ACPI_INTERPRETER
-	/* initialize sci_int early for INT_SRC_OVR MADT parsing */
-	acpi_fadt.sci_int = fadt->sci_int;
-
-	/* initialize rev and apic_phys_dest_mode for x86_64 genapic */
-	acpi_fadt.revision = fadt->revision;
-	acpi_fadt.force_apic_physical_destination_mode =
-	    fadt->force_apic_physical_destination_mode;
-#endif
-
 	/* detect the location of the ACPI PM Timer */
 	if (fadt->header.revision >= FADT2_REVISION_ID &&
 	    fadt->xpm_timer_block.space_id == ACPI_ADR_SPACE_SYSTEM_IO) {


