Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CA16C3B089A
	for <lists+xen-devel@lfdr.de>; Tue, 22 Jun 2021 17:19:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.145913.268407 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lviBY-00018D-Vr; Tue, 22 Jun 2021 15:19:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 145913.268407; Tue, 22 Jun 2021 15:19:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lviBY-000151-RQ; Tue, 22 Jun 2021 15:19:32 +0000
Received: by outflank-mailman (input) for mailman id 145913;
 Tue, 22 Jun 2021 15:19:31 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=RtyV=LQ=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lviBX-00011D-0m
 for xen-devel@lists.xenproject.org; Tue, 22 Jun 2021 15:19:31 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.111.102])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 1552bf0d-5e04-4f1e-bb80-8d5d36dee918;
 Tue, 22 Jun 2021 15:19:30 +0000 (UTC)
Received: from EUR03-AM5-obe.outbound.protection.outlook.com
 (mail-am5eur03lp2050.outbound.protection.outlook.com [104.47.8.50]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-36-EjaQGootNOWTr-Qsi8WUZQ-2; Tue, 22 Jun 2021 17:19:28 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VE1PR04MB6478.eurprd04.prod.outlook.com (2603:10a6:803:12a::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4242.21; Tue, 22 Jun
 2021 15:19:26 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::f06c:6f5d:34d2:1c36]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::f06c:6f5d:34d2:1c36%5]) with mapi id 15.20.4242.023; Tue, 22 Jun 2021
 15:19:26 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 PR1P264CA0002.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:19e::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4219.22 via Frontend Transport; Tue, 22 Jun 2021 15:19:25 +0000
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
X-Inumbo-ID: 1552bf0d-5e04-4f1e-bb80-8d5d36dee918
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1624375169;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=n+RA79yrrkoc85+kR+9lxbJJZIXFoICggX2gAQT5Oiw=;
	b=YYEPU0t9ETg/l0xQXtmuQgkK8xujZ+5+wzJOxuFrlvAWn/HosTobkS5GA8jVDEZml5d6hK
	jqoUdlTTIWqb/nLjobrcKpSeaAyfbjnnKfkhxXCLHjfhwvRmKjiApbWNqfCwbQLqmKftXM
	qAqOIA60zkKAf8X5X5Akpkfx32YLI3g=
X-MC-Unique: EjaQGootNOWTr-Qsi8WUZQ-2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QR5lT6eN8nUgwo3hqeFyOU/uZJt4Jxyd+J+sHKY+lXml3CtPfL2Pc1t4j2kV/ulsCVWdXhOGM6ExbrYR0bTR4CPbIekrzN9QP5ansZfnuLnjQvJJq1Wsj5l/L3qlVGQXtIRB1hkLrUBplKtPF1+qyh0Um4QaHLpS4Ek3I6TO3JCrUYTzgOFK0thKLOAmXcyeXXOAhq5rIHz/KB8Xy8+AWgXNO6Xas18xmA4QEw+D/CbRde3qZHFT3ixnshqy92SCcoQ51Q27POI7ye5Cz9tua4BVVt4TjeHSsClPgGEoR05sSZ8gBVjT8jXh/K6A0ViLJ6b8lYV+8v+0TDZlJ7lPdg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=n+RA79yrrkoc85+kR+9lxbJJZIXFoICggX2gAQT5Oiw=;
 b=lljFb9IhQ0FZ6QZBKE7bmgXYuvWIqLgIHcED5GOJvI6Sg25/Mo9U4N9Z6v2iGtcjOIVaWJTQvVuv6RzFUQo9IHGsxz4jnpS+ejZSsoRdO9fkrBvOJRtO7wU5L4I5yK/APsz7fh/VmKBRNxlSjSH1mOFQ/EGP8otMiZEWlDQlnePTsw2XEmjNMVBKZGSyygPnwZHj3gJWsG53a8a6oAjE0OUvvOzW0tjP6dSN+BAtxSRkmo0NGi0Kzm9Ne5r7bFuYmnU7qeE1GFLNxpZZUAmzZuaHeVQm/Av3nXVVCpmYyISr2xNcG3rUbad1Ld/vtloGuDgboebBXRtGo/XdrqolUQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: suse.com; dkim=none (message not signed)
 header.d=none;suse.com; dmarc=none action=none header.from=suse.com;
Subject: [PATCH v2 5/6] libxencall: drop bogus mentioning of xencall6()
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Ian Jackson <iwj@xenproject.org>, Juergen Gross <jgross@suse.com>
References: <6c532607-c2a3-d0ab-e4e5-428f85f4a045@suse.com>
Message-ID: <1792bdfc-7510-6628-e63c-aee2c7d2cab5@suse.com>
Date: Tue, 22 Jun 2021 17:19:24 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <6c532607-c2a3-d0ab-e4e5-428f85f4a045@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [37.24.206.209]
X-ClientProxiedBy: PR1P264CA0002.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:102:19e::7) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 466f75d3-720c-4221-a87a-08d935911f51
X-MS-TrafficTypeDiagnostic: VE1PR04MB6478:
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS:
	<VE1PR04MB6478597A97DF07B454702078B3099@VE1PR04MB6478.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	V5no5adaQmJmsYZYJWWP+tX6bD5MiRu9+RVS8jMO/dLCxb8BVK6jcBGin4wLhpB5B/SA5cjLvkZSx235bnbunTDOWy/NNGT97DQjxzokwtpd38d1lKv/SFCFYZ8zsVKfvtT/a7JgdHEqWbXHL2QFnMMBeKACYpOOv8gWEiP78OR6ktnDm0vC7GcJVu3vItk3/Ceb02R3JVWShhZYHvEePGaNb4ZbbOSM6fXjHdFKmvmyU5+09YqZKoyGY9t/QWIeupOmqjAy3ClrUMLO/P2ljW6e6tg4Bs3aILjx8ry5/bXE14JnXiNZeOdQm4lxdF7cJH1pVxNWQ8IWRDotoUaS8E1QYhlnTsZirM1TMqolN2bkCc9AVZeNHpyXeXccVHO7yZseRisBPwIz02tgcuvWpF/DlZb/NiNTh6Sz1MrsaEq/Qm/lttM4SjBy+oCalwfs8zxy2pzl2KATJrBUUNIgjWiwfVqm6M7wyTAKr7STmZ6jRPW12YseW3hSSOD2n0THE31YYmcxfEC1NK4K/4MjNvxz/kgHfJDYN1q+TfEIs2g9SJAEfAA3crue9WE1F7GuCh8HXIO6ounIek8A21OeX12IjCr5UoW2nY/xL9MaJDN9tuf4M4Ziepo6Jzwr582rp8R5jr7sqI/F16Mz1LgNP9ieC+UF8MaJ6WA+kHWvkWZNHbaQxwRuz/qIVq/7MnrC
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(136003)(346002)(39850400004)(376002)(396003)(366004)(26005)(186003)(5660300002)(4326008)(16526019)(36756003)(38100700002)(2616005)(107886003)(4744005)(316002)(956004)(54906003)(16576012)(2906002)(31696002)(66946007)(8936002)(86362001)(6916009)(478600001)(6486002)(8676002)(66556008)(66476007)(31686004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?M3ZEZHpFTlNLT2FPaEZxTzd1Wm9KUU5jNXFhUHZ4KzREZUVPUUVDNmpuZkJl?=
 =?utf-8?B?ZGs4U0FyNWNod2JVTDYxM0k0b0ZYOHlDNzhGY0hTVHlrU3M5akwyNzYwL2JW?=
 =?utf-8?B?Q1hnanRCOFpXQlhEOWI2YUd6T1N5TkZocElYL1RTVmwrVGMwMC91MXUyVmlT?=
 =?utf-8?B?UmQzR2dVN2RqeDVReVlhcHpBVDQ4MFA1b1ZiMi8vaWZ6bXNoZGtvY0NXdExq?=
 =?utf-8?B?MytFN0N3LzVOZStnbzZTc1ZENlNsWEVBTjFSTkNiNHdmbmluMGh0KzFFejJt?=
 =?utf-8?B?R1lFbUlaLzNVVXFIbXA5MFZJUmR4UmdEQ3lvWnI0b1U0cnpDVzllSGxwTnli?=
 =?utf-8?B?NlpldWxZak9DOG9aZisrbWNkZEJqNFB4ZVBraWt4VFRRZGxRYkNMM1VsWXBr?=
 =?utf-8?B?ZVBDNWd3d01HVUJhRURxd2Z2b3Rwc0w4R2p3d2JDbFNYTTN3TURxMEhnWXdU?=
 =?utf-8?B?NTRzblFTR1lTbHgyTUgrdjRMQkQwczh4c09BWUwzMnZ2MXY3WWtnTEMxZmtI?=
 =?utf-8?B?RGZXVnRPSWw0SVpEYmg4OUorcW5NWWJELzZaWnV0STZnRFBJUzY4VStUcGVU?=
 =?utf-8?B?eU5STEIyLzUwdXNDVDBjdjJPaVJneHRqalJSREVRYmp6SkE3amNqMnBJeGZ5?=
 =?utf-8?B?UjljYVFhN1ZtVmQ4UlVmMlFqMWRuM2xTNUVCWmppQnlremsveGpuTTVHdXRR?=
 =?utf-8?B?d1dQYWhZWXFaL2Y3NkJhSHFVRjJpdE0wWGtuTFhZU3gxbTdMNzF2OU94ZEVv?=
 =?utf-8?B?VUtHQUZWcnV4c1g0UERicjA3dHlUaHRCUnpJZUdPVCthVVBDRUp3NkF1Zyt3?=
 =?utf-8?B?cEYrcDEvTWdpRm8vNWpzUWRhM1l1b1ZhWUlpd3BBaXRnVnBNbGhTV2VFL0Yr?=
 =?utf-8?B?V2pZdVpWeXpOYXZNSmQvVHR3T1JtR0lJQjlWTEE3c1pLTlVoc2JsQ1NQVEd1?=
 =?utf-8?B?OWxWV05sRjFXcGhzeXZPam5QZVExNTRRUTNQMzBSbFhvTmpTOFhkcjU4Zm9p?=
 =?utf-8?B?OXorTGtETGkzWnFGOEkyTC9vZjBHVDdsMW5TVDgveWNGTERFclRmRWEyWWll?=
 =?utf-8?B?Vy9pVzFHbXd3Ykx0dU95a3V0Z3BqOGRneHhBcS95c001Z2hteFpzalAxeWZp?=
 =?utf-8?B?YTdtOEZmdjJTM2JHbzI2VzJtbGIyaVRWQUhFT2U1ZDFONVRjT3IwSktJaHAz?=
 =?utf-8?B?T1lsZWNQczhwbS9HMVV1L2NWNkh1R1FrOWttMHUzbldIMllsQk9rUWJ6WEI3?=
 =?utf-8?B?ZGRLeXF5c0E1bEV3K2tIdW9BbWhOWjBmRzM3Q3ZuOUl0N0ZGbVRFVGpEbFdt?=
 =?utf-8?B?c2pjZXA2YWZpdVZKSEoydmdlVDJzNjRUcXA4NE9uZG5ST2E3UXpiRUZDckkx?=
 =?utf-8?B?ZExySmhTMmFSOEpjeEdHVFpzRXlkemRqRnByNVBCOUJMbUpHRzB2MG9mKzdU?=
 =?utf-8?B?OW1sYlBzekxRbnQzVHdGcS9PMzNUWHpZTXpQV0d1d0lOam90QXY0YitMZUlG?=
 =?utf-8?B?T0JXaDV4NWYrdGx2MTFXTTdsUWJUYkFXYXQ2blNJWkdYYmRBbVdHcWdGbzRi?=
 =?utf-8?B?UjI3MzZXb0lIK1F0VjhBL1hhVSsrdDZndUdjLzJlbStLbDgwZm9UT3oyYnlB?=
 =?utf-8?B?SGtidWxSSEN5YWVIaFFWNzJiQ0VPK25USitjTks5K0REMmdWZFl0dUlYSDNw?=
 =?utf-8?B?ZTdVMmV6cXRBV2dBSzZvbmJPL1JrU3VuTkJrRU9TQjlVclpkaTUzQW0wTE1t?=
 =?utf-8?Q?I8fXkiX6ZE0NBjUsXo6S8pGm30Vwfj9Roj3PVDf?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 466f75d3-720c-4221-a87a-08d935911f51
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jun 2021 15:19:26.2670
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: W28wX9AKm0/AP/3oHofUSx4d/CxK07IYcK3tWNxf5oDOuVzPz+GRpfXczKuizrNeem6pN1ykKWFasQJ7uyxDAQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB6478

There's no xencall6(), so the version script also shouldn't mention it.
If such a function would ever appear, it shouldn't land in version 1.0.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
Acked-by: Ian Jackson <iwj@xenproject.org>
---
v2: Split out of earlier patch.

--- a/tools/libs/call/libxencall.map
+++ b/tools/libs/call/libxencall.map
@@ -9,7 +9,6 @@ VERS_1.0 {
 		xencall3;
 		xencall4;
 		xencall5;
-		xencall6;
 
 		xencall_alloc_buffer;
 		xencall_free_buffer;


