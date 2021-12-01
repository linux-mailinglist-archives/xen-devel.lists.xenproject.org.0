Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 04B04464C02
	for <lists+xen-devel@lfdr.de>; Wed,  1 Dec 2021 11:52:18 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.235844.409077 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1msNDX-0000Rj-Ay; Wed, 01 Dec 2021 10:52:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 235844.409077; Wed, 01 Dec 2021 10:52:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1msNDX-0000Og-77; Wed, 01 Dec 2021 10:52:03 +0000
Received: by outflank-mailman (input) for mailman id 235844;
 Wed, 01 Dec 2021 10:52:02 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=gc09=QS=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1msNDW-0000Oa-2H
 for xen-devel@lists.xenproject.org; Wed, 01 Dec 2021 10:52:02 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b61a9747-5294-11ec-976b-d102b41d0961;
 Wed, 01 Dec 2021 11:52:01 +0100 (CET)
Received: from EUR03-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur03lp2053.outbound.protection.outlook.com [104.47.9.53]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-23-quA_WWHXM-efxKwWBjNEsw-1; Wed, 01 Dec 2021 11:51:59 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB5741.eurprd04.prod.outlook.com (2603:10a6:803:df::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4734.23; Wed, 1 Dec
 2021 10:51:57 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe%5]) with mapi id 15.20.4734.024; Wed, 1 Dec 2021
 10:51:57 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AM6P195CA0030.EURP195.PROD.OUTLOOK.COM (2603:10a6:209:81::43) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4734.22 via Frontend Transport; Wed, 1 Dec 2021 10:51:56 +0000
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
X-Inumbo-ID: b61a9747-5294-11ec-976b-d102b41d0961
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1638355920;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=FRIcTDqJo18dQVBKsA8aCIXEn1TmFyexAhKNAsbcwak=;
	b=Slzl0bqYb+xkvUndD2G5zjwG2rvZ/YXC8dJOvxnoDpTgBAOoTKf+jGqdGGC54i0DMWIQgH
	IfVH3leThAQ4ZUOAhjiuEs2DUKJ2vQYyxRZCOjLO+HCdc8P3iXxxLHVafeocjnPuvUShuD
	THJOnGYqpazx0JOT1hcXspZ6QapUv0I=
X-MC-Unique: quA_WWHXM-efxKwWBjNEsw-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Kbk+TDhAwYv21be0jdrUxwcDSu797KinzykaabOFg66sfvxrR76mXDzQZ6nilgg1l7UWV6BZzDY7Xl7GHHXss+WvB3sHMO6WwlfrfeV0g7/PNc1tXJjA3IZa7ZSslyLX5E2sh1aIDCqDTENhv3g7CMhw5esdZjA7h+p5wH6dCxE5UHbtyIXzJ7mnMAEc9UFeg4kis+lF6JjyZ6PTf0mZkEBB7kKNSbs/hA/pAfGrUdUWgG5lob36z087GWqp3eEJ10No83HAsCpc3ZL/jZotgYk37yUSf3cuDExOZpC7Y1vWa/rAuwX8Khdnov5iEOo3kHfRpH6SJLyJDEdkHTzEdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FRIcTDqJo18dQVBKsA8aCIXEn1TmFyexAhKNAsbcwak=;
 b=V4jBTjqmGxHZCq87mN0kLfjoGOlhFH2U/iGfyMkoq99r/DlcO59z0iXA++wI0IzGq1Cnu681JAEACktP1VQaa7uQOedL91dViKrt9jpugV7ikIck5I2IlKFrOkH6vxd9CyJUBtYE9ZM7vbQdKF6SmVvIdeDwR0u97LSSoZiZpRK2ZRxMXhr12zHg5kpHuPvY7l5qwBcVikBOQv45pZUT7rsxOaSrLsRrYGc81Hyxt5+of+Vdy/4soMUJdNC2NRTNUOPJZM2i8/HBXnj9I274wyuAvyoAPT+IzKVz/+zwFsZlbI0L+3LSkwUXPhM995ggtx1cATZJ/LIb4EEHgUWbwQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <21148e89-4750-3112-1096-36119be96c7e@suse.com>
Date: Wed, 1 Dec 2021 11:51:55 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.2
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH 0/4] x86/mm: address observations made while working on
 XSA-388
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM6P195CA0030.EURP195.PROD.OUTLOOK.COM
 (2603:10a6:209:81::43) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c51c22dc-7302-4f80-cf49-08d9b4b89864
X-MS-TrafficTypeDiagnostic: VI1PR04MB5741:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB5741160C737783E6F0F85A2DB3689@VI1PR04MB5741.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3631;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	BylqDAnlF+c24U2SPMqPD+yZvHrk0fhLE3kdwRSi5L7BhLghIMjZOhSxJfXf9Yf5uAgTzDRV0BHAuES6AkiHlT9x/1M97Zzbkv34lxw8ObMBNk/zrCG9DprTXoVXCtpfgW7Mp/1eivYvupv0IlkE9J9qUATEvwx6YzKGsdIQHPWfTptl9w9ewTJDyaGgAcoztTTg0bX5rJysY/oItF+jUn2e9V+VGQ5w42NYpjoU+eCpAw6H1TzwVu1Hg/MnqlvwRbxcrXX2DiHcDFR21kOGgxT2WGFyH7RCM4wlGeulJuwTUZoG6YaU2I1CKxLq7zGavA236VRK16Wm2f56wcM+iTVrcmVzIYsRwx4BsGhCT9obWTxGreXRdeKYyoxlkPzu94h5zqcF2mJs+Sa8m1uaEgZ6o5FXOQSyHMNFwvRBO41s6wLzJHraMCjFWYrM89vybGPAuuwDK8g6m2Irxg/T5gwONV9vMW2UU3adUndx5ZLeAyvo2Q3bONb6bo/V0QB7tADVOuTfdxTwqVHxa+Ht1qT/MQP0/uBAXGxw0z/DRq4CHMhg1Ssaf9FT9QrqF11KoczxsrefPZXg/eI0R/OZUSdhrl7ePxteO1CQ+9fxnhACxgnPgew0wrNzfpoyTr8Ed9ouT17vqwrMV0Z0R4FQdAyUyDgyx/W7V8bPisVYV2ma1nbB4k9cdvbmsn7rEqMdu+s3xJ1UDqsPOInVlmczb3gCFTwaQZG+kA3uR+8J3jQ=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(186003)(508600001)(66476007)(54906003)(2906002)(6486002)(5660300002)(66556008)(66946007)(8936002)(38100700002)(36756003)(2616005)(31686004)(26005)(316002)(31696002)(4326008)(86362001)(83380400001)(956004)(6916009)(16576012)(8676002)(4744005)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Q1d3TmdGUmpIZFlpaDc2WG5KM3BUbFJ3YWJOQ2dVN1phcEw0VTIvekNFZno4?=
 =?utf-8?B?ZEpnWm94ZGF2eng3TTBiMjc5Y2FTU3hRMzVyK3RNU2RNTnljeTVLendpTC9v?=
 =?utf-8?B?UE53RXlxUXJYWFNWNitqUTJaMnNxK3FNanRadHFFd1U4U21TRmZna00vU1R5?=
 =?utf-8?B?cVZBZ1g1VURYMUdlbS9RSWJXVnc2SWpYdTlBNktwNC9JZi9KRzJwSTNJT0J2?=
 =?utf-8?B?NFZaNE01N2QrOG1HdGQwOW5ZQklyVzlwUEhhYkFiVSt0OGZIeWlENUduTUlB?=
 =?utf-8?B?WU9ZQkNRZ2s1VCswZDdVTTV6YVZxQjdxZnFHeUpTL0p3RDZ0SEFaTWY1d3Rp?=
 =?utf-8?B?NS9ZWkUyZ3czQXJJNnhSTW9mVTZXWEtBL2hFVEFDS3J3Qm1rbk44RTBQeWN5?=
 =?utf-8?B?c0JIU1hJZko0NzFoL01BVnZNSEhSemYwclVkWXhlUy9lVDFCMnFyZnoyYm9W?=
 =?utf-8?B?OVlPUzJyV2Y4cjhpeSs1RXpFa1FnWGhHdnNjMWw4eDI0T2xxSlQ0ZVZDRk1M?=
 =?utf-8?B?WklJRFRBQk4xVVNDRjBRK280aDMzbk9haExFenZyWnY1dFdmWkpSM0NaYVZj?=
 =?utf-8?B?VXZicjh1OWttSXdzQ1FrNkRXRlFLbmVuQTVtRGxwbTJKVmNPTHZrNXhjTUVM?=
 =?utf-8?B?NW9mM0UvWGQ2NDhxL2pDRlplSG4xUFIyVzN3Q1prN2ZWY1BkSU5sYVY4THM1?=
 =?utf-8?B?Ynd1Znl3ZmFqMTRHVkNuSWFvaVJ5WDdRRjNZdmNiMGRFdjBDdEZiYmlmK3ly?=
 =?utf-8?B?QjhQTWdObFpiNXQ3RHAxdmRrSDhzc2s2NXU4NjcvV0M2dVA0bHRXdmI5YWJk?=
 =?utf-8?B?VzJCcmVXa1NlL2E1d29zaWVPZjZiTFYyc2xjcTlMZitzeHQ5djlEYmVNQ0hQ?=
 =?utf-8?B?Nm9KUE5zUm1CU0lkMlpGU1h6eWUwRzJWMjd5ZWh3RXdlUm5QRjdibHBqQW9W?=
 =?utf-8?B?eWdxdzdFYW14VTJEaFpBZHlsR2QycFN4b2szL1U5MEIyTFdNcHo3Y3JBK2dK?=
 =?utf-8?B?M25tdlJ4SGIyL3V4OWtyRlpzZXYvME51clZjRW5pNXdXa0hwVkV1Vy8rOHk0?=
 =?utf-8?B?YXY4WityM1JEQ3Jadkw3MWJYYWJ0TkZnbnErTXorVENBVkhwek9pQ0o4cDcv?=
 =?utf-8?B?aFZpZk1tRzBxaEhXY0hyUWxYQUltdzkvQ2VIQnF0SkdkdW5pbUljSWUzY1JR?=
 =?utf-8?B?TEVESnd5cDAvekZrZG1LUmY2Z2J0dXI4VE56OEdBajRGYkxBZDExNjRvTW9a?=
 =?utf-8?B?MWplaXF5WWVOc3puQ1FKVlBoMDdFNnRXSld0d2dIUzRzNUdrclNBdHF4aGNL?=
 =?utf-8?B?NHJaTXJuc1ZUMWVWV0FZVGVrM1EvVFRzK1Qyemo1Wi9zclVZekdYZ3k2ZU12?=
 =?utf-8?B?cWtwOXFzYkFvSEdneHJiZ3BsNVNWUmlkZVFucm1qeXJrUW82bkxaeVUyei82?=
 =?utf-8?B?RU0wT3R1MndHakQzM2R5ZzV6VVIxa084UFVjMzd3SE1ZN0t2V0U2VE9jMkMy?=
 =?utf-8?B?WitOejdNVFhQbHlHUGZHWFQ2aDJEVkxJbTR1bXhVd2ZaTDJPeHgwWHpsYXhJ?=
 =?utf-8?B?dkNvenc4LzAxbndSTzVuSVVtMXhXY1hwaSttMlZtYzZlZitYU0NoOGVhSGNh?=
 =?utf-8?B?TFNHb1k3VStJaUt6VGE5d0FMcktXbCtGK3VBTm9VNzdoOWZkRlVIL0xWTGp3?=
 =?utf-8?B?L1p1dnd1dFhNSWNzYitjR280dTRxN2NWZ1RHRnBIMUMzWGI0SGgrSnBWTEll?=
 =?utf-8?B?REd2ekJlYlFSRG9Kd084cGNpUWNpNjk1RXJUTFBjblRwdm5kSytpcEQ3RFI4?=
 =?utf-8?B?UkN0akVMaGQvbGdmY1VtN21CU2w3cFZ3Unp1c1lkTllESTl4V3FneDlXdXd0?=
 =?utf-8?B?ZldFRGdmWFZjKzdqYUI4K09wZ052ZEZCYjd6ckVncCtsV1UzQ1FjVVEyUnlM?=
 =?utf-8?B?c3V5bHplQjNlU09oM2Vtd1BsRmhYZEppdStPVWJndGtHbEtqSXBlVitxK2VT?=
 =?utf-8?B?WlhjVCtqSy9CYUtzazVzWlNNODVpV1A1OEdzSEhOdGVDQTlzZUJDUThsWU5E?=
 =?utf-8?B?RWRtMWpRTTVFSEdjdTJOdHpCRVR4WnNRMXVpWDNINTY4c0FKclRyMEszZnA4?=
 =?utf-8?B?djhSbEVMNE1jZnRFRVZYNzFZejRucENnY0NkRHdIWTZ2b2ZqYjZiZTI0Q0w0?=
 =?utf-8?Q?nmlvmv06Xk7EDT7YXWBnDn0=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c51c22dc-7302-4f80-cf49-08d9b4b89864
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Dec 2021 10:51:57.4690
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vXPem6IhOSPjDaJsgwxF05ACsVUjjiPJZ9IcQtWWzehFHkZ+uFj7m5LfDdWoeAEOhwPn94Z0eJ8oFb/+SjQCBw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB5741

1: PoD: simplify / improve p2m_pod_cache_add()
2: PoD: HVM guests can't pin their pages
3: altp2m: p2m_altp2m_get_or_propagate() should honor present page order
4: altp2m: p2m_altp2m_propagate_change() should honor present page order

The last one is RFC, as there is an aspect I can't make sense of.
See there.

Jan


