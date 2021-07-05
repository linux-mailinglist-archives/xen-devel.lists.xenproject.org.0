Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A7873BC160
	for <lists+xen-devel@lfdr.de>; Mon,  5 Jul 2021 18:08:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.150456.278195 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m0R8c-0004vg-DA; Mon, 05 Jul 2021 16:08:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 150456.278195; Mon, 05 Jul 2021 16:08:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m0R8c-0004sh-8j; Mon, 05 Jul 2021 16:08:02 +0000
Received: by outflank-mailman (input) for mailman id 150456;
 Mon, 05 Jul 2021 16:08:01 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=HGaV=L5=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1m0R8b-0004N0-5v
 for xen-devel@lists.xenproject.org; Mon, 05 Jul 2021 16:08:01 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.111.102])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id cf0e1f0c-2eb6-4f86-8953-b58e1e1eba0c;
 Mon, 05 Jul 2021 16:07:59 +0000 (UTC)
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04lp2057.outbound.protection.outlook.com [104.47.12.57]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-14-rkRy333JM72jeNLP9nOx8w-1; Mon, 05 Jul 2021 18:07:58 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB3293.eurprd04.prod.outlook.com (2603:10a6:802:11::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4287.32; Mon, 5 Jul
 2021 16:07:56 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::99d3:99cd:8adf:3eea]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::99d3:99cd:8adf:3eea%5]) with mapi id 15.20.4287.033; Mon, 5 Jul 2021
 16:07:56 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 PR1P264CA0035.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:19f::22) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4287.21 via Frontend Transport; Mon, 5 Jul 2021 16:07:55 +0000
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
X-Inumbo-ID: cf0e1f0c-2eb6-4f86-8953-b58e1e1eba0c
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1625501278;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=iBgTpLP5pTg+FKHioK50yatmWjfVI9UtWtf8wOQ70wI=;
	b=K7KvQTg6U6OrJEVA9Ft7OMY1HxBM0pQA4xTLPR79LnvTUc6gbX6jo/sBVNzx1OSIaPaE14
	baX+5kEBUqJW3bGldyNix0nvxGCXa6xw4ieYQy02d+s1BuczjDNoz0xAoWpi3pIUi5/Kxv
	1Aw4wYEt35iB2lNYE9CnC6bQypl6FVg=
X-MC-Unique: rkRy333JM72jeNLP9nOx8w-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BMC15kGCXhT9hkXmzZrqZbdMMLUTcMWIyIJRugT5zBPY2WFHm1+B7IqLN9ElHrQVY7P/QomXet2w37hG51d6wE8dHHsM0vdmoqFdsnYf7DY4IQ+4/alAh2aQdtc9ZCwAKiaUNXRpKZh5DZjgX1AQzrO/QwpYxTo9dA9jm0pHIBkQ/f/XQpIxyOZ9rrvfe0JyuzrgErA0jpYa53T6aEdccZMaISohsVlzdBliHJ0F+1kU6zzsyKhPedV+p7wVw7o4HsE+iQbh+p6BkU2NFTUSkXDmsxDvYggda37GBFgYkhb4L9fw8OafnsBRiSjf/YjhPfTJ5HjuR1dwoQjRRsFO3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iBgTpLP5pTg+FKHioK50yatmWjfVI9UtWtf8wOQ70wI=;
 b=ZM9dNWbE52xCj3hzUh2UcNng0J9gZwOle5sGqabVrpHVZT7DUuU1yhc/uQjm3tB6BxN19k6Wh8G+gH9gRbhERaY90dx/ccrFui2Ri+i7oFz4jAmNC5niakQhZah299jW19zz4W788QT9r6JNRyNllMnkthNn/Fde5jFZqLNgS3vveTFYTfHp5cuJgVUdDbmOlTGVP3yWJF68Nqck1cy8DZ12yQA1xJKemocxeuE5N/qjxWsahB7LtL0btYe2s5X7vrBiQJ34o4uBSTZhraO0SIH3/9x6/0IUkScUpImi9w3q3T+qBDwKbFdjIvdPwzm2QktGdl1zZlsDKq/gFBF8Zw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: citrix.com; dkim=none (message not signed)
 header.d=none;citrix.com; dmarc=none action=none header.from=suse.com;
Subject: [PATCH 06/16] x86/mm: split set_identity_p2m_entry() into PV and HVM
 parts
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>
References: <d1fd572d-5bfe-21d8-3b50-d9b0646ce2f0@suse.com>
Message-ID: <90ea840a-0966-0cf8-39f0-f8ef3fb45786@suse.com>
Date: Mon, 5 Jul 2021 18:07:54 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <d1fd572d-5bfe-21d8-3b50-d9b0646ce2f0@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [37.24.206.209]
X-ClientProxiedBy: PR1P264CA0035.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:102:19f::22) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 94d23ad7-b080-4da9-8869-08d93fcf0d6d
X-MS-TrafficTypeDiagnostic: VI1PR04MB3293:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB3293B225BD9EFF22D12E036DB31C9@VI1PR04MB3293.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	CfLZqNR+sLYyKaAeTcrafHeyxWKK2aZnizw2lElQWJtWKfz8IZaUamD/3uSev0XkEvtVBT2mwmEva79roXsAZ7vT4ULJoVKyeIHw4mjX6kqu27lpO5nKG+BGkUimHHPPtZeDADb6AYg3eH87Rd9H69OP4wJ/VgI+cJkuYigkFWNcTRrlURaJzLLIxRblRXbwrpUbtN4qv3gEvHtNjYXo0l/VX65FhDLBL2rsdHyRbyocRicYSyxeP0lS2AK5eVpfP+m+MHFWOLn2mBAGkG11CQvUCrZH7cMmhM06MHJKqUtQDgVXmQgiKuet9UtSx8yv55bpyTNJH1vT01e7JTp96Z212A4zH/bOCIsmoiV/nRIAdQ41U9V8gpGQMlz/5C5SK+VWr1Wj7085VPkq6TqqjdktXlh6Wr6+YO/YtFEhFV24uFq6GS4afPpzl1P789YcA+gINUydgEMpdUS6kgZSPa0pdcDHfjuR4Rjggq0oEXxmDVFNkP/lsWRBHN5nbe+wTrmQ4NMRH5G6Fn8i9bUN3nKE3WFArBlX+1QTJMAXVZcUvxNauLUiVyG9pR+RX6aGeLG/fCUqMXifH7JywlAP6WyyTORQTL/BkA8XOOQljDWN5WkX/AxUnET+tD55gKoQIwJbnW6xkoUmhCa1A33LV9Q3mueqH9c7WIuD9s7bBT1PPSONSVJKTQEZG6cVE+oqUG16UBaYY54Q0FOZ0vWNNr9YsRKD0nIq1asEZJHV1gJN5f6eN2lfR3OkV+lUFSHmfpAPX+exDcH4x+t0I3bTbcctzINtS+ULZllZ38mJYEOnw9X7Swkx7Xl4snkYtXjH7Ojj2/tj7nUZYOST6EQ2ied0fMndBMi2Z2bxsgsvPc2Kof9uejDY5dIU75ma/VwZ
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(346002)(396003)(136003)(376002)(39850400004)(5660300002)(316002)(956004)(66946007)(2616005)(16576012)(26005)(38100700002)(186003)(66476007)(66556008)(2906002)(36756003)(16526019)(86362001)(31686004)(6916009)(54906003)(83380400001)(31696002)(4326008)(478600001)(6486002)(8936002)(8676002)(70780200001)(2004002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?a0pPZW8rZUFRdHJaL0s5dnNGYkVTakFEelJ0VTA2U1lOdUorL3VBS3ZBSWd0?=
 =?utf-8?B?ZkxLRStjU2RvaThoazIweU53TS8zaUp4ckZqYzVrRjFLcU94TFpJSWp4a3Nz?=
 =?utf-8?B?SXUrRXVLVnYyMFBvWFZsSnAycDNxcXBTbVFtV2hCdE95MlB3WGxtbUprWDBs?=
 =?utf-8?B?ajd6ZlNpKzFNWFZmWnZwcXBqQTVHaXhDZXpwVWViRFFjdWwzRTRDM1ZlbWxl?=
 =?utf-8?B?cUZmTFNXTWxTb1p3SGxmVFYyYlV6alRZZm1Rd1NuYjYzVG1jM1B5WnpFb2JE?=
 =?utf-8?B?UkdIVDdpajhsUkVoR0FNUHNhQ28wZncyZUdiU0Z5QkxjK0ducEUxQUpMc3ZJ?=
 =?utf-8?B?R0ozdjlWalN0d2k3RHZtbGZ6MDNNUlE3bzZ0ZGhxenpTM1Y3NVlBbmJEeXkr?=
 =?utf-8?B?WmRlWlB5QTB6ZzJBVkJ2Yys4TjJnajlGT3dadmtFNG43bEVnOFdpa1RQdENa?=
 =?utf-8?B?eXJtbFNGWWw5WXZVb0todHpUandIU0wwNzBVSnRiRjg2YnplRVRzeVhNblN0?=
 =?utf-8?B?MWRmZGJEYmpaNW8rU1NBR1FDMG55MHBsZUxSYVV3OURoUnJWSGd6NW1rK2x5?=
 =?utf-8?B?cG5YZkM1U25hT05WNDUwQWhFRDhVZ1o4YVZ3eGhUZEp3MlpTMGttVHU1cG9Z?=
 =?utf-8?B?dndnc1lXMmk1R3I0QkN4eU83SVFNbExjT1pvazFVbWE5NzZzYjlFcWRxMCtG?=
 =?utf-8?B?TDdMc2o2YTlFRlJ5dzROVGhSYXp4MG1MR1JMSWhsT2RtRUhvWTRwaDZXbHFi?=
 =?utf-8?B?RnhCMXhuN0RSRDgva3o1b1lvd3cwR1E4VnFtMmtvME8wcFJWSHNpZmJNcVZu?=
 =?utf-8?B?MEYyS3k3L2RNYkNwSzdUaTZBWEpXblVmenhJTnFLSTVIb3QxaVRFNEgxbzZW?=
 =?utf-8?B?UlZWbDJwZXhuQk5NRkcweCtSSEVGVEIwTDFycEM4VExtdThQT3ZMS2tmYVlt?=
 =?utf-8?B?cVhPRWpaeWxlQVFsWStkQlRPQkJQejlUMi9ySHFXbmdBU05hSDh0NGRMbEJR?=
 =?utf-8?B?bnJFbUNGOGI3NndGc1ZMbm5XK3FSNkZEd2M5bVQwTkZHdlZkSWhwQTcyOWpM?=
 =?utf-8?B?QXE3TXJEY2pBSU14YU1xYWxOamZmSS9oNFhadjdXUGdwVWtieE1xbWlVWjRF?=
 =?utf-8?B?bklRK2NHaGRIODI3d3kybENTVmJIZFdaWkdwSEZQZFZ6WUhBKzJaSkc3ZGxH?=
 =?utf-8?B?V0lBT3RQT3pTZi8zbnlPbmRtWVNhZVA5V2srMDd0UTZiV2YwYVR5OUliTjM5?=
 =?utf-8?B?WTdUSno1dDdJb2xMOXNtN0ZpR3hiZnRQUnV4d3A0QW9NeVBHbnFWUU5pRHVZ?=
 =?utf-8?B?UldyTVVUd2I0eHI2MG9qbkFTYnRWM01BeXBUSjgrMU53SmY1SHZ6eEdobDY0?=
 =?utf-8?B?ZDQzdm9KY2tuTng5clVRaHg0NXQ0N0d0cFQ3Z29BaktnMk50Uk9hVG5nRy9i?=
 =?utf-8?B?cTZWNDZDeml5aUl4Vk43dC80bmdoamoyQXN1VXVWSlhWeDdkUHp0MFNyYVNr?=
 =?utf-8?B?TUd5Yk9YejJrT0lLMXJyQjQ5V0lZNmNqdWRFK0FyU1A2TTlrTmtBMXVXS0RH?=
 =?utf-8?B?dFArV21iZDVLUlVHeHdOTHd5NHZCY2oya1BGODR5ZGdQTE5GT0RzQWZEQVJh?=
 =?utf-8?B?MldLUHAzcnNPYWREaGRmUGtnL25sQ0tLZldnTDRDa2ZzTm1oQ01iU2NLQkdR?=
 =?utf-8?B?RFBQVUw0bmNNZHpXUnVvTGdNUHkydUtHMXNYckg2dVJmNlZGN1pjcFZXSVd0?=
 =?utf-8?Q?kdeZRDiI7tf1w5EJhqySFOKpuZEJBvMohnIEoXs?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 94d23ad7-b080-4da9-8869-08d93fcf0d6d
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jul 2021 16:07:56.6877
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: k0BhAxqtwXUW3Pl4iH3u4Vo/tiJUmvQBiNG4eqtaZ6NHK07tVBGKO9ST7zN8LLVNjvwShUDMpEurWxsxeBE93Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB3293

..., moving the former into the new physmap.c.

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/arch/x86/mm/p2m.c
+++ b/xen/arch/x86/mm/p2m.c
@@ -43,6 +43,7 @@
 #include <xsm/xsm.h>
 
 #include "mm-locks.h"
+#include "p2m.h"
 
 /* Override macro from asm/page.h to make work with mfn_t */
 #undef virt_to_mfn
@@ -1366,12 +1367,9 @@ int clear_mmio_p2m_entry(struct domain *
     return rc;
 }
 
-#endif /* CONFIG_HVM */
-
-int set_identity_p2m_entry(struct domain *d, unsigned long gfn_l,
+int p2m_add_identity_entry(struct domain *d, unsigned long gfn_l,
                            p2m_access_t p2ma, unsigned int flag)
 {
-#ifdef CONFIG_HVM
     p2m_type_t p2mt;
     p2m_access_t a;
     gfn_t gfn = _gfn(gfn_l);
@@ -1381,13 +1379,8 @@ int set_identity_p2m_entry(struct domain
 
     if ( !paging_mode_translate(d) )
     {
-#endif
-        if ( !is_iommu_enabled(d) )
-            return 0;
-        return iommu_legacy_map(d, _dfn(gfn_l), _mfn(gfn_l),
-                                1ul << PAGE_ORDER_4K,
-                                IOMMUF_readable | IOMMUF_writable);
-#ifdef CONFIG_HVM
+        ASSERT_UNREACHABLE();
+        return -EPERM;
     }
 
     gfn_lock(p2m, gfn, 0);
@@ -1413,12 +1406,10 @@ int set_identity_p2m_entry(struct domain
 
     gfn_unlock(p2m, gfn, 0);
     return ret;
-#endif
 }
 
-int clear_identity_p2m_entry(struct domain *d, unsigned long gfn_l)
+int p2m_remove_identity_entry(struct domain *d, unsigned long gfn_l)
 {
-#ifdef CONFIG_HVM
     p2m_type_t p2mt;
     p2m_access_t a;
     gfn_t gfn = _gfn(gfn_l);
@@ -1428,11 +1419,8 @@ int clear_identity_p2m_entry(struct doma
 
     if ( !paging_mode_translate(d) )
     {
-#endif
-        if ( !is_iommu_enabled(d) )
-            return 0;
-        return iommu_legacy_unmap(d, _dfn(gfn_l), 1ul << PAGE_ORDER_4K);
-#ifdef CONFIG_HVM
+        ASSERT_UNREACHABLE();
+        return -EPERM;
     }
 
     gfn_lock(p2m, gfn, 0);
@@ -1454,7 +1442,6 @@ int clear_identity_p2m_entry(struct doma
     }
 
     return ret;
-#endif
 }
 
 #ifdef CONFIG_MEM_SHARING
@@ -1499,8 +1486,6 @@ int set_shared_p2m_entry(struct domain *
 
 #endif /* CONFIG_MEM_SHARING */
 
-#ifdef CONFIG_HVM
-
 static struct p2m_domain *
 p2m_getlru_nestedp2m(struct domain *d, struct p2m_domain *p2m)
 {
--- /dev/null
+++ b/xen/arch/x86/mm/p2m.h
@@ -0,0 +1,31 @@
+/******************************************************************************
+ * arch/x86/mm/p2m.h
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License as published by
+ * the Free Software Foundation; either version 2 of the License, or
+ * (at your option) any later version.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ * GNU General Public License for more details.
+ *
+ * You should have received a copy of the GNU General Public License
+ * along with this program; If not, see <http://www.gnu.org/licenses/>.
+ */
+
+#include <xen/mem_access.h>
+
+int p2m_add_identity_entry(struct domain *d, unsigned long gfn,
+                           p2m_access_t p2ma, unsigned int flag);
+int p2m_remove_identity_entry(struct domain *d, unsigned long gfn);
+
+/*
+ * Local variables:
+ * mode: C
+ * c-file-style: "BSD"
+ * c-basic-offset: 4
+ * indent-tabs-mode: nil
+ * End:
+ */
--- a/xen/arch/x86/mm/physmap.c
+++ b/xen/arch/x86/mm/physmap.c
@@ -21,9 +21,11 @@
  * along with this program; If not, see <http://www.gnu.org/licenses/>.
  */
 
+#include <xen/iommu.h>
 #include <asm/p2m.h>
 
 #include "mm-locks.h"
+#include "p2m.h"
 
 int
 guest_physmap_add_page(struct domain *d, gfn_t gfn, mfn_t mfn,
@@ -75,6 +77,33 @@ guest_physmap_remove_page(struct domain
     return p2m_remove_page(d, gfn, mfn, page_order);
 }
 
+int set_identity_p2m_entry(struct domain *d, unsigned long gfn,
+                           p2m_access_t p2ma, unsigned int flag)
+{
+    if ( !paging_mode_translate(d) )
+    {
+        if ( !is_iommu_enabled(d) )
+            return 0;
+        return iommu_legacy_map(d, _dfn(gfn), _mfn(gfn),
+                                1ul << PAGE_ORDER_4K,
+                                IOMMUF_readable | IOMMUF_writable);
+    }
+
+    return p2m_add_identity_entry(d, gfn, p2ma, flag);
+}
+
+int clear_identity_p2m_entry(struct domain *d, unsigned long gfn)
+{
+    if ( !paging_mode_translate(d) )
+    {
+        if ( !is_iommu_enabled(d) )
+            return 0;
+        return iommu_legacy_unmap(d, _dfn(gfn), 1ul << PAGE_ORDER_4K);
+    }
+
+    return p2m_remove_identity_entry(d, gfn);
+}
+
 /*
  * Local variables:
  * mode: C


