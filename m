Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C78693F8520
	for <lists+xen-devel@lfdr.de>; Thu, 26 Aug 2021 12:12:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.172861.315422 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mJCNA-0007Js-V8; Thu, 26 Aug 2021 10:12:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 172861.315422; Thu, 26 Aug 2021 10:12:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mJCNA-0007Hf-RY; Thu, 26 Aug 2021 10:12:36 +0000
Received: by outflank-mailman (input) for mailman id 172861;
 Thu, 26 Aug 2021 10:12:35 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=HXzX=NR=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mJCN9-0007HV-JL
 for xen-devel@lists.xenproject.org; Thu, 26 Aug 2021 10:12:35 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.109.102])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 2f1fd858-d782-4e57-83c1-6fb5779a5a37;
 Thu, 26 Aug 2021 10:12:34 +0000 (UTC)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05lp2113.outbound.protection.outlook.com [104.47.17.113])
 (Using TLS) by relay.mimecast.com with ESMTP id
 de-mta-33-92vAv6KyNS2Uz6pOeRxxYg-1; Thu, 26 Aug 2021 12:12:32 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB2960.eurprd04.prod.outlook.com (2603:10a6:802:9::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4436.22; Thu, 26 Aug
 2021 10:12:30 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b%7]) with mapi id 15.20.4457.017; Thu, 26 Aug 2021
 10:12:30 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 PR3P191CA0058.EURP191.PROD.OUTLOOK.COM (2603:10a6:102:55::33) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4415.22 via Frontend Transport; Thu, 26 Aug 2021 10:12:30 +0000
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
X-Inumbo-ID: 2f1fd858-d782-4e57-83c1-6fb5779a5a37
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1629972753;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=n511EYtA/tuzfF5bwcNyYouo2stCQAhoLR2Fuecv68g=;
	b=ghQ/zqMAY7NCWPAytXYFKkLEe2JpRqS9dtJLvl3TAddmfkoX5kMeyGqaZqBNxrWp9taoC2
	Bvog2bBwgV30nz4a6sfFPF1Q07aVN49AiUK7Uoedq4DIcPrAP7mu5c0wyTpWHui/zxZYjb
	h+Zr69FI6TGI6TshQa9RfJInfHQIbro=
X-MC-Unique: 92vAv6KyNS2Uz6pOeRxxYg-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=H8dlbC1xlTkq+gHEWIliCvGjfcFEqkjMQbWbVLRaXjtvDlJrpqvnDasy/sXsXgcL33IqEZSiO7yAKkeQmR1NHD25Ek1bz1HGFS+0R90L8WHMKs9WNzdy9bpZNrAxiRXPE3ob0dYD8Z9lY03AhXk+kYQuj0iETBmw+tBUl0Xi3npn5s6ToD+3+dJzch7e6gZzdzcQSdqcfo9jqXKXxj7yiKVpYq/Z1PdgnalVU+LOQt86QlSX5GxY8GUJYqxeMs+fSplrxv7jxIHFMtkaIO60bHHdUHyN1Z+DMfeV3glS9+Pyh2B2UdIJJXN2t33J5uuAWCuT5UM+KQAsXa8yBdp5vw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=n511EYtA/tuzfF5bwcNyYouo2stCQAhoLR2Fuecv68g=;
 b=KkDAe3TgRj6svqMhTPTZmnF2gLxpuPhDuXd22E5uqrNhDaN25TdVUIqIoU9RngSDmnyAAxkfUMBK4NL7qGd510bpeiIdEJBEalWtVcbO3VIZIe+zaqbC9J0GKAxxbdFd978gVJuOhWPTwmtodsnbZIl2h1Y+Umeo00bvdKQEjtxexDqdZGbdThurxPpHr2tLJWfijvf9ublTiOO76+iqkvRpI4BRFx7G1OxkjzAAajyXrAgXok8t4LX6lbKicEcenJGNl0O45dPb1gq0QYKV0StwyY1c9ilVbTAqhHJdtMKKVvAFoMeHoVjI2DMDuvM56HRkvg6+Z7sQg8a7TnIw1g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=suse.com;
Subject: [PATCH 3/9] gnttab: fold recurring is_iomem_page()
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>
References: <eb7bbd51-1da3-9a7f-27c7-49dea1a41488@suse.com>
Message-ID: <06eeea76-adf8-4f40-eced-57db1526eba8@suse.com>
Date: Thu, 26 Aug 2021 12:12:28 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
In-Reply-To: <eb7bbd51-1da3-9a7f-27c7-49dea1a41488@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PR3P191CA0058.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:102:55::33) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: fcf7903d-93b6-4ca8-5f47-08d9687a03aa
X-MS-TrafficTypeDiagnostic: VI1PR04MB2960:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB2960A218D17CC0FD02CE10D2B3C79@VI1PR04MB2960.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	m1CKLJm7h43mW9/c3UNqJeJnWhSWB7APyaH+0wZlUL7hCxtnuEVTS9xfhyAMMr/TabaR8rP8elwgBzasxjegWYQjfQWjBLyA1+6RODcViRwT6IgkMu4eahWGTEO04T7fgWovgApa/PcCAn04JiQ+3qMC3NwIkhMjs2PDi/PkKrhXifi2CL8iNXMfZCQShdIMcoINrxjZFZST/ikOK48aHWENoU47ZwrMdgvFzGpZWchGo+OKQyE/fAQwNWh6WBJcnZIcC/v7EBXwrkWlAIAXc5NXMYqlhcwFRc9aCe1XI3BCcNPIywxmM9z+0TxMeHtkY3IDEDsPxu7NRxlNlWojcruXZqN/c/DYq6JKNer2M9XAwS1R0NJTRnxeF5m/ypEKpOpK8LfKs6IUMj24OB7eqeFBoC9J297/6QhyOFkVVC2OxWJbe9mX20Ab+gh8BIAEvSXPnJbFdydhkogMV6wunofJOgRqxL5Mp/N8+/EmHl3VjJws9d5CfZOoRnlndm+oTzeXp8QThY0stnran6qi7b/xcas1UmBQozDKag1JQs5sRI30nR/+aJsPx5QVH1mb6p3WTPsMfHosB3fTx3cZp7EUdrPUrz4fvavBOPoMz+YX+lK/UV4I5LgGCeEyWYDirvAvI5y+dP+dTmF8+BuyNfAt3c66TrRT8iTAhMtnXTJunJubINMPWj7U5geaCawaO2MJ+poSVWL59NfBx9uADCuCAgBLUprl3Y5XsfDQb3A=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(39850400004)(376002)(396003)(346002)(366004)(136003)(5660300002)(478600001)(31686004)(956004)(2616005)(8676002)(6916009)(2906002)(4326008)(36756003)(8936002)(6486002)(31696002)(186003)(26005)(38100700002)(66476007)(54906003)(66556008)(16576012)(316002)(66946007)(86362001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?eDJpWUtOQk9jS1RTMUdsUnBsVkxjbW85R2ZzZUsrNDZOV0dPOWN4bGVNdFNi?=
 =?utf-8?B?a1pNR3VoL1ViZFU4OHovQkRxS2JMbngvYzMxRy81bVpkcVIrZWtJcGs2MVB2?=
 =?utf-8?B?MndqM2RKaWVlYVdwV1VnNnV2K3Q0aTl3dnRtKzIrN0ZmT2I0NjRwUll1Q1Vp?=
 =?utf-8?B?YkhxSUZja0c5dlFvTVJoS2hyN3BIQ2FIQlRvQnR5WWRqd2Z3cVFaYVVXS0Nz?=
 =?utf-8?B?ZXhheDFvVFVIR3lrbVArMS9lKzRUYmpFbEptVG5saTdvUFExTGRGVFRmVVFW?=
 =?utf-8?B?NTRYeGRwWWdqZldkK056Y0xnM1VXaFIwT0IrOWV3ZFBDUm0wNzN4V0NmSjdG?=
 =?utf-8?B?dThHdEV3bEVCOHA5b0xvaW1SNGJGanB4YlNZMFF1MGdJb1g0QWM3RjNPSnpt?=
 =?utf-8?B?ZTNjZ2xJcXlkalJCOCs2WjQrcWdNRDlvMUZBcjhNZ3piMGQ0NittTDZoKzhs?=
 =?utf-8?B?RmtKSFJlclpsajE3ZWNXUk1HZW8zZFJjeHBHMXZuT2hJcUxlQ2QwV0djZkll?=
 =?utf-8?B?OUhIcDFaRGxBYjZKUTVRaTdCbGlGMWlBNTNrYWY2WnN2L3pQNUJScStYOStY?=
 =?utf-8?B?aTRUNm5iVWVkbDRaSkQzeUE1cC82WXdYT3p3WlU1dW1LYmUxYVBFN3dTNEcw?=
 =?utf-8?B?RFl3czhOdDl4N1duTHZpallJMm5HT0tkUDhJdXVnN2V2WExaQ3BNKzErTk5D?=
 =?utf-8?B?Yy9JemVublptaEQvTWFLR09qVWkwUEpOK05pdjFYcDQ5SVZqR1I2SEtLV2Rn?=
 =?utf-8?B?R08zZ1JTcE5HaFdyYXY0ZlVsUlZnT1NiZkoxWXhub2VGdmtCbXkrTWJURTlM?=
 =?utf-8?B?U2xtWnY4S2tsSnRMSFk3QklIRDh5V0VveVViUjh2M2FLNU0vOEpmMERqQ3NT?=
 =?utf-8?B?R1cyRnF0UEUyUlNqRXpmaEdkbzF1REpHWUJObUhaVTBLV0gzVHZWbGlBUnJB?=
 =?utf-8?B?bytJZytEcmVscVh3NjhvUXVrb2d2SndCOXRhVkc3a3diRzRaWmVJUFZNbnNL?=
 =?utf-8?B?Ym5sNGQvZnh0UFZ4VXBObHROdW55Qi9sdldXY2xodVBLSXVhSXk0K3phQXFB?=
 =?utf-8?B?Q0dsWHl3Ry9BRXpkYkUwZFhOVFg4aWpuZUt6L01YQ3hrWUxEeThjMS9NZVVV?=
 =?utf-8?B?NDlDN2dZaHZGLzRyZFVyME1TcG8xenhOUXJhOGM1TGRDQWhURWlDN091VDRs?=
 =?utf-8?B?cTg4L1hMdjVGVzVIR2NpckJnZjBPbi82M1VuQS9QRzJ2bUFKdGprS015OEp5?=
 =?utf-8?B?VlJCRWxrWXFSNnlaSE5MTnpkcEVmWHZjRXA2R3dFd29pdnV6NUxjM1c4QnVJ?=
 =?utf-8?B?NWd6YkloRmZPcDNPUUJQMEN1Z3V1OGNRKzhETDlONklqdEUzcWMwVk5RZDlI?=
 =?utf-8?B?YVVDTjJZbUF3KzhPTGYvOFA0OWxRL3VrVDB1a0FYaE5YVnAvZFRZUzZDWTU1?=
 =?utf-8?B?QUVSdVJHUE8yOHpUeHR5YmZaMVhncVIxamNZdjAxWVhaN0tic3BDdFRvWXRu?=
 =?utf-8?B?ajQwdVA0ZVptTUZzSmsxaUIxbGZEamNmdE50dzhWeEFTaUxaNnhSVFZGTW9o?=
 =?utf-8?B?RmpXT2lCOURxRWp2dVRwZ012c0VJc0ZCYTFRbmlXNU1PVHU2OWpoMkUxd3Vl?=
 =?utf-8?B?bUNndFpsMjZob09DVy9KbnZnWWZBTFhEMXZWOEZRakgwZTE5a0QwN3V0UXg5?=
 =?utf-8?B?S0ErZnBBZU5rd1Z6dVZQQTQwR1NYdmhLS2FtZGIyS2FFUms0Q2F4eEZ6c0lG?=
 =?utf-8?Q?5RgWY7GqdQCJMzQtPFumhZ9QJ3RbQT1D/FBDqNo?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fcf7903d-93b6-4ca8-5f47-08d9687a03aa
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Aug 2021 10:12:30.7401
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rPx5JV2XfFgziElHeQ+KMNADp5jtp8kgtNM+O80FnSQ1XJt8WqDrDrFBYlR7BjTBHi4NRHGfdX9Zywr/pgb4WA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB2960

In all cases call the function just once instead of up to four times, at
the same time avoiding to store a dangling pointer in a local variable.

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/common/grant_table.c
+++ b/xen/common/grant_table.c
@@ -1587,11 +1587,11 @@ unmap_common_complete(struct gnttab_unma
     else
         status = &status_entry(rgt, op->ref);
 
-    pg = mfn_to_page(op->mfn);
+    pg = !is_iomem_page(act->mfn) ? mfn_to_page(op->mfn) : NULL;
 
     if ( op->done & GNTMAP_device_map )
     {
-        if ( !is_iomem_page(act->mfn) )
+        if ( pg )
         {
             if ( op->done & GNTMAP_readonly )
                 put_page(pg);
@@ -1608,7 +1608,7 @@ unmap_common_complete(struct gnttab_unma
 
     if ( op->done & GNTMAP_host_map )
     {
-        if ( !is_iomem_page(op->mfn) )
+        if ( pg )
         {
             if ( gnttab_host_mapping_get_page_type(op->done & GNTMAP_readonly,
                                                    ld, rd) )
@@ -3778,7 +3778,7 @@ int gnttab_release_mappings(struct domai
         else
             status = &status_entry(rgt, ref);
 
-        pg = mfn_to_page(act->mfn);
+        pg = !is_iomem_page(act->mfn) ? mfn_to_page(act->mfn) : NULL;
 
         if ( map->flags & GNTMAP_readonly )
         {
@@ -3786,7 +3786,7 @@ int gnttab_release_mappings(struct domai
             {
                 BUG_ON(!(act->pin & GNTPIN_devr_mask));
                 act->pin -= GNTPIN_devr_inc;
-                if ( !is_iomem_page(act->mfn) )
+                if ( pg )
                     put_page(pg);
             }
 
@@ -3794,8 +3794,7 @@ int gnttab_release_mappings(struct domai
             {
                 BUG_ON(!(act->pin & GNTPIN_hstr_mask));
                 act->pin -= GNTPIN_hstr_inc;
-                if ( gnttab_release_host_mappings(d) &&
-                     !is_iomem_page(act->mfn) )
+                if ( pg && gnttab_release_host_mappings(d) )
                     put_page(pg);
             }
         }
@@ -3805,7 +3804,7 @@ int gnttab_release_mappings(struct domai
             {
                 BUG_ON(!(act->pin & GNTPIN_devw_mask));
                 act->pin -= GNTPIN_devw_inc;
-                if ( !is_iomem_page(act->mfn) )
+                if ( pg )
                     put_page_and_type(pg);
             }
 
@@ -3813,8 +3812,7 @@ int gnttab_release_mappings(struct domai
             {
                 BUG_ON(!(act->pin & GNTPIN_hstw_mask));
                 act->pin -= GNTPIN_hstw_inc;
-                if ( gnttab_release_host_mappings(d) &&
-                     !is_iomem_page(act->mfn) )
+                if ( pg && gnttab_release_host_mappings(d) )
                 {
                     if ( gnttab_host_mapping_get_page_type(false, d, rd) )
                         put_page_type(pg);
In all cases call the function just once instead of up to four times, at
the same time avoiding to store a dangling pointer in a local variable.

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/common/grant_table.c
+++ b/xen/common/grant_table.c
@@ -1587,11 +1587,11 @@ unmap_common_complete(struct gnttab_unma
     else
         status = &status_entry(rgt, op->ref);
 
-    pg = mfn_to_page(op->mfn);
+    pg = !is_iomem_page(act->mfn) ? mfn_to_page(op->mfn) : NULL;
 
     if ( op->done & GNTMAP_device_map )
     {
-        if ( !is_iomem_page(act->mfn) )
+        if ( pg )
         {
             if ( op->done & GNTMAP_readonly )
                 put_page(pg);
@@ -1608,7 +1608,7 @@ unmap_common_complete(struct gnttab_unma
 
     if ( op->done & GNTMAP_host_map )
     {
-        if ( !is_iomem_page(op->mfn) )
+        if ( pg )
         {
             if ( gnttab_host_mapping_get_page_type(op->done & GNTMAP_readonly,
                                                    ld, rd) )
@@ -3778,7 +3778,7 @@ int gnttab_release_mappings(struct domai
         else
             status = &status_entry(rgt, ref);
 
-        pg = mfn_to_page(act->mfn);
+        pg = !is_iomem_page(act->mfn) ? mfn_to_page(act->mfn) : NULL;
 
         if ( map->flags & GNTMAP_readonly )
         {
@@ -3786,7 +3786,7 @@ int gnttab_release_mappings(struct domai
             {
                 BUG_ON(!(act->pin & GNTPIN_devr_mask));
                 act->pin -= GNTPIN_devr_inc;
-                if ( !is_iomem_page(act->mfn) )
+                if ( pg )
                     put_page(pg);
             }
 
@@ -3794,8 +3794,7 @@ int gnttab_release_mappings(struct domai
             {
                 BUG_ON(!(act->pin & GNTPIN_hstr_mask));
                 act->pin -= GNTPIN_hstr_inc;
-                if ( gnttab_release_host_mappings(d) &&
-                     !is_iomem_page(act->mfn) )
+                if ( pg && gnttab_release_host_mappings(d) )
                     put_page(pg);
             }
         }
@@ -3805,7 +3804,7 @@ int gnttab_release_mappings(struct domai
             {
                 BUG_ON(!(act->pin & GNTPIN_devw_mask));
                 act->pin -= GNTPIN_devw_inc;
-                if ( !is_iomem_page(act->mfn) )
+                if ( pg )
                     put_page_and_type(pg);
             }
 
@@ -3813,8 +3812,7 @@ int gnttab_release_mappings(struct domai
             {
                 BUG_ON(!(act->pin & GNTPIN_hstw_mask));
                 act->pin -= GNTPIN_hstw_inc;
-                if ( gnttab_release_host_mappings(d) &&
-                     !is_iomem_page(act->mfn) )
+                if ( pg && gnttab_release_host_mappings(d) )
                 {
                     if ( gnttab_host_mapping_get_page_type(false, d, rd) )
                         put_page_type(pg);


