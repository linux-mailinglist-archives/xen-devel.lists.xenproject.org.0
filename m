Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 408043BC169
	for <lists+xen-devel@lfdr.de>; Mon,  5 Jul 2021 18:11:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.150484.278239 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m0RBN-0008DI-0O; Mon, 05 Jul 2021 16:10:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 150484.278239; Mon, 05 Jul 2021 16:10:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m0RBM-00089r-RH; Mon, 05 Jul 2021 16:10:52 +0000
Received: by outflank-mailman (input) for mailman id 150484;
 Mon, 05 Jul 2021 16:10:50 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=HGaV=L5=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1m0RBK-00087t-Qq
 for xen-devel@lists.xenproject.org; Mon, 05 Jul 2021 16:10:50 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.111.102])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 9020949e-ddab-11eb-844d-12813bfff9fa;
 Mon, 05 Jul 2021 16:10:50 +0000 (UTC)
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04lp2057.outbound.protection.outlook.com [104.47.14.57]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-36-WAMpp5DhNx27jnfXsMFRrg-1; Mon, 05 Jul 2021 18:10:48 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB3293.eurprd04.prod.outlook.com (2603:10a6:802:11::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4287.32; Mon, 5 Jul
 2021 16:10:47 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::99d3:99cd:8adf:3eea]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::99d3:99cd:8adf:3eea%5]) with mapi id 15.20.4287.033; Mon, 5 Jul 2021
 16:10:47 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 PR0P264CA0119.FRAP264.PROD.OUTLOOK.COM (2603:10a6:100:19::35) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4287.22 via Frontend Transport; Mon, 5 Jul 2021 16:10:46 +0000
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
X-Inumbo-ID: 9020949e-ddab-11eb-844d-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1625501449;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=i9R/6Ft2bTf/P4epKQB2jkiAfHntWtgxvduuxZdy6KA=;
	b=csSKZ2BtAzIys36u08vh4Zdbq+O/l0+7y3P4ItTrECM5Wlejp+T6KI7mIc9B3EZEryuzgx
	Qc4P2auiBT+Ibf0KdzjGVtsdBXZ5CvWsko8Pcgd0X0MVnf9UbN9SVO6Daq7rhzlwKaH0WL
	cEse4B4Ys5q4HAgSBqW21tS0xeQHfC4=
X-MC-Unique: WAMpp5DhNx27jnfXsMFRrg-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=N3RLa/lS/jUuwexFDHRCc4dhS5f+h1wERt3i8vwwSrbH9hcRd3+F7s6uB0KUZmOoa1HtPzbZinYixFl9ZONIZOb12i84iQaGzYkujD3Dk2/ezMkl6mPypD1p1W44DB24q5gcOWaLfHRYx9kC8WTC1eyp4UpOW9JAO+Z6cqdDD3wcQYk+v6SV/D3aMVNh0OgKg78MaepauQAZx/0aetipCLS8mCvpOtEGBP7egWjLTqpFi55jNnh5SgzhE51kttXvzpJRgx7PEqvvA/B7tcmEs3RumIDrtB/Wv6UV0iItu8Y2kLTQYpZHr/wfHfp5sio96409l5YFym9noRLdlG01IQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=i9R/6Ft2bTf/P4epKQB2jkiAfHntWtgxvduuxZdy6KA=;
 b=YkOfDEK1Y6rFYnfacNP6UVJjXegz99vLF85wsbRjkoGahpPNLLODWnpCq3fOzptS0elicVIA2ufj/gLqlWtVIOzPZGQtg54hG6CcrOULLCt7IG5KLUA+5d2zmvOufJ1O8brGT7jBSZKz9cUkhX72dbTncm8HU/X6df+ZShBNzJgMfqGDaHwd9xYNi4mO2IuuhQNQdZsWjAPzKbI5LFNhCJy5NjNsSu3hiuHSqfRKaEvF8IjhtvadvJeMptfp/VxuAYWwb223aUCg+zaRwWl8rZmWnFocLI/luoDuE0qRvjpLNB7ufer/Gcqx0L/TLfKggXX6A5+lmToT1qjNZy1VqA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: citrix.com; dkim=none (message not signed)
 header.d=none;citrix.com; dmarc=none action=none header.from=suse.com;
Subject: [PATCH 10/16] x86/P2M: p2m_get_page_from_gfn() is HVM-only
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>
References: <d1fd572d-5bfe-21d8-3b50-d9b0646ce2f0@suse.com>
Message-ID: <06063948-65fb-1839-c10b-7cfb53d22b3b@suse.com>
Date: Mon, 5 Jul 2021 18:10:45 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <d1fd572d-5bfe-21d8-3b50-d9b0646ce2f0@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [37.24.206.209]
X-ClientProxiedBy: PR0P264CA0119.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:100:19::35) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0f935a50-a862-4d9c-7e89-08d93fcf731c
X-MS-TrafficTypeDiagnostic: VI1PR04MB3293:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB3293B6E222AD4F4265AC0045B31C9@VI1PR04MB3293.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	NAl7gvd9jZB8zVzfxQhfMMgH2M92pYPtkSto0zSWbLAAAjiD6iLmtPEHH8TA/1vTUWhofxo4qHN8w6aAzvPaNy5LguRN/wEW4z4goWgmO/VGVRCHkWuIK+oM3TZTgMrknLAm+o7cBdvba5FO5Kd79iuA95VezZUAZusLWOv7/WNI1mCMPDFrTtA+Dj/wps2znoKgtixC9F5KEiGRa/xMhsJEEvMf2mH/vaisErHpYGXwdvWnsjCLNR1rpU0Bez2l8685Kw4z6K4WnuEe5m0W/Cxa/wM4nLonVzTn6MTrUoS0+jJYnQji90dWpDdYfXbRqdHd4WYhZ9E/lM3uO7dTVkez7oSh6ZFmRv/SiQUdtolCQcIqrBJLolF+gw7f7HiSnX80p/3Oz4l8W1ZDiMstrtA2w1karSTwiwl9eXEcSEL/qIjGhNH5TxowHPlVpg9Z8et+yRQRLYBmGwQ7V73oqC1W4t8P+B8rGqPCGPVbOoffuB5Obp8pm5SBKI79nB5IJNmxl7GiRbLX6ehk+AzAipWAzDzA/IT78iFscPYiyI/F3JqkLvEUZsd/0YvpV27i+mFda01nr9AYdh2VWk16QIWapTPYg95F4BMC5ha3M0DAyFyjRKkXJHs9CktkK31yQGgSMdp1/hcusKop4dRvoN/NUAHDwaVMSstMqCGUNoy41jQLit/9R0XosewshyLLHvDK0Xr4WIaCVqC7cZ180NadUd3fD7sBEDFdVqEU7PE=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(39850400004)(376002)(136003)(396003)(346002)(366004)(6486002)(478600001)(8936002)(4326008)(8676002)(38100700002)(66556008)(186003)(66476007)(66946007)(5660300002)(316002)(956004)(16576012)(26005)(2616005)(54906003)(83380400001)(31696002)(16526019)(2906002)(36756003)(31686004)(6916009)(86362001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?OGlyOXFIejdMOHlZWXdsMDluSlQ2dzBBNzQ3VXY2Zkw4bWdYVW44dUJGSXdU?=
 =?utf-8?B?dzNhKzFhcVFYTmZYKzE0VTlnTitLRk04dE9Sd2xRYmhDRTZLZ1hBMGFhOUZ3?=
 =?utf-8?B?NnBtNnI3RlV0TW04VzNzbEZuMGZEL2tGUE9yeWtsNndLV0UrRWsyNys0Tm44?=
 =?utf-8?B?UUhiT0NJN09qNDB5MnE2Nm1yanRMVVRkVU9oSmNudnZHU3Q5V05rWHM4VW1m?=
 =?utf-8?B?clB4YWZodHpPN2xFUGs4YWVwcTA4UGVtMjhuWFdUYnMwT1Q4Y0pNQU9IRm43?=
 =?utf-8?B?WUt4WXIyZTVPWldCcHowQ284VUE2eis5Z3BqME1zV1VORjQyQWFoV09UU1RW?=
 =?utf-8?B?cGRRVks4VUtwTnBUME45ZUNaUS9QWkl6UG9JdUJLR29VSWRiRXAxRjlMNU5u?=
 =?utf-8?B?a2xGanhNQkhKaXFyOEY4WEozcHR0MFZNVkNyS2FRZlVyQytXc09oOUtDQ0li?=
 =?utf-8?B?dHAvTFVMaFBoM2F4eU9kVXVERFFUQzloc0xYY0pTWFAzejFHZDl5SE9CdzJQ?=
 =?utf-8?B?MGRkOGNaT1lNNWkwU3BadUNjTWU4WGRkTjBrbXE1RHRBMGpHSTltMTBBVTda?=
 =?utf-8?B?YnpVY2x4WWhIT2VjUXd5cmRHRHFMalFSazZpdVB1cDdHZWR2eTg2dG1HWHFk?=
 =?utf-8?B?TFBXS25UeEw0aGN6ZEtFaTBYb3o2NHdpS1lKQ1pWS2Q2NjExWUpoa1FSUWZq?=
 =?utf-8?B?SHpwdGt0cWNwMTZSZHhORmNwZGoreE15eERtRklaQnBNVjQ2QWhCUCtzRjNa?=
 =?utf-8?B?Z3p4ck9Td2tnamxUcnFMUkNET2tyOEZnWUVoZ0FNTHUxS2l4NW5QQjh1RzEw?=
 =?utf-8?B?T3Bmb0VkaUtJdnNQRGRoVUlKOStOWUxKRUxoWENQdmpEa3QraXhMMExjVE1S?=
 =?utf-8?B?azZHT0xKdjZpVW93aXgxcTh2c2ZOMHg5ckVHeFVWYzZkdGZwZ0JCVlZUUFJv?=
 =?utf-8?B?b09JTGJkWkk1Y3p4Q1R0NEVXNW5Ea25DUTdzNG5NQ2g3Y3A4RDlKcithVW8y?=
 =?utf-8?B?Z1BOam5mRzVSNHd1MnI3UmRBbmhpQUdEUFRWQnJFcGNNcTJJdUdvK3ZJTHM0?=
 =?utf-8?B?Z2VVTHkweXhydVdkUnZ6TXRYdG8vYjR5Yy9nV2tIL1FzQTVFK0pxSEdrRVhF?=
 =?utf-8?B?RnIzUlJFSlZicmQ1aVhVWFlwdWovZkF1NXJ0NFA5MGJzOVhBdFJVSkhIMFhF?=
 =?utf-8?B?Y3BtZkxuOUVIWENjTGYwWGJ4Z3UxWkNWWHdDWCtKY21TTjVuTEVNdHFld0lU?=
 =?utf-8?B?SEZLR0R4eWJINFZCcnNMZ2piOWhtM20rTlNMWVpiejA4WVg1UnplSGE5VHF5?=
 =?utf-8?B?c2NYalc3YzhMemt1cXd2YzJjWHhJRHRyRUEyU0Roa0hWMDUwbW9ENTNEc09B?=
 =?utf-8?B?UlQ0Z040QVB6dm1SZjJlSjNmbnpvVjdrV3JBUmZpdlV6STAvbEhEZ2Zrc1ZR?=
 =?utf-8?B?REFtc1FTRmhQcHNQTi9CMVlkaEhDOTJBOWx3dFFMNnRzSkFFM0RUNjFSZWxV?=
 =?utf-8?B?TitHNGxsUUhxS3R6K3FBUnFHQVoyN0xvcDYrRXpaaFRDbHFzNGMyUWdPKzBk?=
 =?utf-8?B?bW1XK1hycmNpYnhZaXFVaE4wa1NKZmIvN0x3cTY2Kzhnei92UVlBRDduODZI?=
 =?utf-8?B?eFRML2hYQkhsOHVvaWpQbm92NDZFRlFMdWsvQ2ZIWHN1blppRVFyMk1NYUNF?=
 =?utf-8?B?cCt0TS9lZUJlRXBQWitpaHp2eWVnVHBzb0UyR0ZLNjdmQVQ4ZmVDeHFxL2VQ?=
 =?utf-8?Q?Ld9Az+yUHqv6xJVUDCQN7jP8GjLrfA/6WptrYmj?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0f935a50-a862-4d9c-7e89-08d93fcf731c
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jul 2021 16:10:47.2722
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: K6U4W2LSsEUU2+K4JAUl3QQbGK6ATD4sgFF88hGy50ZKVAqDonmprsTx8t7O+mWmjsmnWT6QDiwoosFN616d0w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB3293

This function is the wrong layer to go through for PV guests. It happens
to work, but produces results which aren't fully consistent with
get_page_from_gfn(). The latter function, however, cannot be used in
map_domain_gfn() as it may not be the host P2M we mean to act on.

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/arch/x86/mm/guest_walk.c
+++ b/xen/arch/x86/mm/guest_walk.c
@@ -554,7 +554,9 @@ void *map_domain_gfn(struct p2m_domain *
     }
 
     /* Translate the gfn, unsharing if shared. */
-    page = p2m_get_page_from_gfn(p2m, gfn, &p2mt, NULL, q);
+    page = paging_mode_translate(p2m->domain)
+           ? p2m_get_page_from_gfn(p2m, gfn, &p2mt, NULL, q)
+           : get_page_from_gfn(p2m->domain, gfn_x(gfn), &p2mt, q);
     if ( p2m_is_paging(p2mt) )
     {
         ASSERT(p2m_is_hostp2m(p2m));
--- a/xen/arch/x86/mm/p2m.c
+++ b/xen/arch/x86/mm/p2m.c
@@ -357,6 +357,8 @@ void __put_gfn(struct p2m_domain *p2m, u
     gfn_unlock(p2m, gfn, 0);
 }
 
+#ifdef CONFIG_HVM
+
 /* Atomically look up a GFN and take a reference count on the backing page. */
 struct page_info *p2m_get_page_from_gfn(
     struct p2m_domain *p2m, gfn_t gfn,
@@ -422,8 +424,6 @@ struct page_info *p2m_get_page_from_gfn(
     return page;
 }
 
-#ifdef CONFIG_HVM
-
 /* Returns: 0 for success, -errno for failure */
 int p2m_set_entry(struct p2m_domain *p2m, gfn_t gfn, mfn_t mfn,
                   unsigned int page_order, p2m_type_t p2mt, p2m_access_t p2ma)


