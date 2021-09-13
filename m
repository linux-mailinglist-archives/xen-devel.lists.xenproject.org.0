Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 103944087A3
	for <lists+xen-devel@lfdr.de>; Mon, 13 Sep 2021 10:55:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.185549.334251 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mPhk4-00078F-I7; Mon, 13 Sep 2021 08:55:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 185549.334251; Mon, 13 Sep 2021 08:55:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mPhk4-00076H-CO; Mon, 13 Sep 2021 08:55:08 +0000
Received: by outflank-mailman (input) for mailman id 185549;
 Mon, 13 Sep 2021 08:55:07 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=NzTd=OD=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mPhk2-00075p-Vo
 for xen-devel@lists.xenproject.org; Mon, 13 Sep 2021 08:55:07 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.109.102])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 4a235426-1470-11ec-b3a5-12813bfff9fa;
 Mon, 13 Sep 2021 08:55:06 +0000 (UTC)
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur01lp2056.outbound.protection.outlook.com [104.47.2.56]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-15-b7UMIKwYMS6mcn0437Yr1Q-1; Mon, 13 Sep 2021 10:55:04 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB5328.eurprd04.prod.outlook.com (2603:10a6:803:59::25)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4500.17; Mon, 13 Sep
 2021 08:55:02 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b%7]) with mapi id 15.20.4500.018; Mon, 13 Sep 2021
 08:55:02 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 PR0P264CA0120.FRAP264.PROD.OUTLOOK.COM (2603:10a6:100:19::36) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4500.14 via Frontend Transport; Mon, 13 Sep 2021 08:55:02 +0000
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
X-Inumbo-ID: 4a235426-1470-11ec-b3a5-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1631523305;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=mAW0Q6nzFqwulvGL5+AZVzIb3y8lJv2Qg+rTIb8bmww=;
	b=bp/pQcDwd/snhriSba8gydy89PwhgQAJQuXKCzLeWrqpDGtvP6IozPPnPIyCEVJoEWzNCm
	u4uw/lQ667QB8in+/BSfU9maUiU10eGoeCCcAL17n4TdHwXFzUpOMIKJGsG9QaGOy5oY2F
	BcjhDydX+0HVmQhfF/czd0mU4yUEX68=
X-MC-Unique: b7UMIKwYMS6mcn0437Yr1Q-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=j5vFjLf9VENQaEl5bObryAsq9mabmwyvgU68rDdIuQr5mdfBnaIKKE63kqYF0rshhVlriU+OsktgxxAnfV6TEpQo4CVeittuctSvMvE0LcqBN3gM2vnRp0usnr4OwCoXEyK17CECr4cV5F3K3e02TxV5cKMfz9jW7kLY4/vbpn2oEQ8HAaBRK75RUg/dSOnz/39drX/OrhmTcLZAQxt4fyg7kJgU5ywXG3bqPzf98/tOiXfIZKhmZPTO9uMYfSeztRIqzb7a9UwMtB0enTbosBq9Ym57SahAeWQdly1/NbT8VdtGRT9yEV5avyGO4Zj6kffLSrlAMqEm3tgPyBoD1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=mAW0Q6nzFqwulvGL5+AZVzIb3y8lJv2Qg+rTIb8bmww=;
 b=FTaYeiVAAqCGf6NlyM7KEOPn+BJAyOZCm9YY3v0Ug8EoaZL2W69C7YIDOadm5osjBbrQg3Pc+yWD/iqOb3AtbJwx0Ef+PpBGEuvrefn9W5OrHnf/f2lOyZciYyvIDskiA1b7jVFip4a7JihFvq1nhhkOqa8u7w92gbm9838r/iU6GhKX6tatKdd4sG1JZtRkdhyBJmqQ/Y/dO8b9nNhZqZbWeGM4eNjXcUkDPq7R1Uo+b5j7w8b9/8xOpXbLtv9MvJtVF/YpK2amUbM8P9HpeuULNHhFL20uOUDKu8HYRazDw+WKnG7cVBTxeeWEFNOFRP0fKX/nHDdQAPJkqgD5Vw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: citrix.com; dkim=none (message not signed)
 header.d=none;citrix.com; dmarc=none action=none header.from=suse.com;
Subject: [PATCH 1/2] x86/mm: tidy XENMEM_{get,set}_pod_target handling
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>
References: <ff324215-ccad-bb05-e36e-d711ff7c960f@suse.com>
Message-ID: <34f6a6b7-1ffb-5820-afcb-bc1ded0f0005@suse.com>
Date: Mon, 13 Sep 2021 10:55:01 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <ff324215-ccad-bb05-e36e-d711ff7c960f@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PR0P264CA0120.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:100:19::36) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: beef266e-f1a3-49a4-1c27-08d976942ccc
X-MS-TrafficTypeDiagnostic: VI1PR04MB5328:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB53285CF5C6B56B470FB1BD82B3D99@VI1PR04MB5328.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:497;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	nw18n9qxx2l8WRPohFgunh+3gyO7cXwomClp1ZyMHOlikh8V+XU9IbPiD4kbZqaQKDiDRieZnJnlSyNUKU9+/v3eV2Gq5h5FgidpCigUBoM/nipZ/QaQiJmbQNn4tp+v4x/PjpyYHMKZ9Au/BvLtrfJYLRf0DNhJlNifL5AS7sR0rqtH4fB7+0Mza72Zo5w8Sd2DHALjNmibpjrq+PqvQ1aBijih8fxvCbv/7DDQMjV3vfDSVWd0+6nDZSsbNQpXG8cM5nJw1Eh+lvAC9igMSAYcOzxN1EOuX/r57TQmrxLAVPRH8/9pNPYBTn0QoObHY3Z6IYxclan2kcZP/IaKwW+RkBYra8iPDM8zqxAOzXaQE9eVi1vaQuM/8SYupqxZt6/Dqf78JSz5IxIREylvcdYNA6f4kLWuqJIibAHoAFL49KasMd+xcGeKZlE8RLQU1o2uyMVzgxTDyCu193oAa3+ccBVWClYk/nuW0dCQVv7CFWhnVbHMRiriQOwIWdjADShG+ujwJIPVGI+y2Nt3pTI1B2/GXPISmhWml/5E3eguwjwFxhsz0yDqAoknImkiFjNnAkI7nrGD9gcxQW4hzFLq2MCABGB1f3bDGZtXOlSiarukJWtKtfPSNs654SJRSSOWE2KZ48jbcyH+RzP/ok83Ap1JmCTDdUXiE7JUIluyzsv0RDrVRzL4kA1X26AKrPXAsgRW57c4eZr09xrFlWU037kZLGSQziAvKqZ5078=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(136003)(39860400002)(376002)(366004)(396003)(346002)(8936002)(86362001)(4326008)(316002)(31686004)(31696002)(16576012)(38100700002)(2616005)(26005)(956004)(2906002)(36756003)(6916009)(5660300002)(83380400001)(8676002)(54906003)(478600001)(6486002)(186003)(66476007)(66946007)(66556008)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bUx2anM1aFdCOG1RaFhHVFhVcnA4QmNTTEdoZ21IUHJVWkVHWTBoVjkxVU9L?=
 =?utf-8?B?VE5sSTVEL2FpOXIvRU82RGhHM3hSbk9NcWlIVUxmdTVuSTRObDc4NENjSlpZ?=
 =?utf-8?B?S1lYdWtaVVpsa3g4Y09pakRXbTM3dWZNbEM4VTlTc3hWZnNWODhaeGVrNjUy?=
 =?utf-8?B?bVo4NXJnZmJuSTJKVzd1dTZjN1F6a29UNzRYNGZ6Q05IKzQwSmZXcW9WQ1pH?=
 =?utf-8?B?QWEwV0QzWktwSFJ2cmJ2cnRKMlhOemZqVXN5Nnk1YmZ0NjNBbU5oa29uZWNn?=
 =?utf-8?B?bkozRkZBTDRpNVI5SFFRZUdYczJFeE1UK1ltU0svVDV0czdYbzZQOGpia3FT?=
 =?utf-8?B?b0Q0cDNRZEN3RjR1VkNyNk1MRmJmRDl1MXljWTJydTA2MWdvSE5lYXU2VFBH?=
 =?utf-8?B?ekVDRDAwV2p4cVJVS3RPVWdIdjNLSnhoclRJRUgvcGFZd2lESkh6SE0zcEE5?=
 =?utf-8?B?L0RkZ3A3bXMrdjd4dlN3aHhFdVZUZ2M4dWk1bzZDeGlrdEdGVFo5Rll1N0k4?=
 =?utf-8?B?dUtMVzQ2dHpRQ2tBbXpCWTJnMmwvb2poNlhkTndVZ2lTV1BkZ0ZrTDQxVnRY?=
 =?utf-8?B?ZENYZkZONVNFUHZNd2ZDUEplOW1qRWN5SnRxVkNza0hsK3h6ak9TbE84YllJ?=
 =?utf-8?B?NFR0aHJMT3paVGY3MzRzeHo4UWpRNVJtYlk4QkdTbmluUFBPcnpqdTM2dUtj?=
 =?utf-8?B?SStnQ0tuUUIrUjE5OVBSa1dQbXZlSVNqTVA4cTFVTWQwY3FsS1Y4d2xhcHc4?=
 =?utf-8?B?aGJsU1Yxa0lIamp4encrTWtsbmxEZkw5RW1aTzgwcTFEMXRiWExkLytVUGNU?=
 =?utf-8?B?NklvbnA2M1RobHRCU0pqL3J0K2NwT3l2QVlnYlNVT09seG5uR2NOdURvRzlk?=
 =?utf-8?B?SUNJRzVMeGI0R3d0UHZVeWFWbzFyOFh3U2JtVm03UVV0ZFZvTUxZdUVRSjhi?=
 =?utf-8?B?b2NtN0swQkdFUDZ0UFFmUmY4VzRHb1dCQ2tIMWlDQWtrSExpSjA2dkM4L3pr?=
 =?utf-8?B?K1FxR3FZME5GUHNmTkVsVjI2TjRWSURpeW9TejRGSm93NXZSMndrSlZ5azVw?=
 =?utf-8?B?WHpkNDh6T3pZQjhEaUd1UlhwYjNzczJmRGxSVEJIZDYrcXQ2aDZmMU9sbnBy?=
 =?utf-8?B?bGo2L2llM0ZqQUdOVTA0WGFoMnBMWDE0dU8zN1d1S2UxWEJSa2tqN3JROEVX?=
 =?utf-8?B?VnByaFNnb0VHL2ZpeENVem1VanI4SVlpeGw2NS8xQVNET1IydDEwdkxNMVRD?=
 =?utf-8?B?UERaRTdzNjhzMTMzY3ZidDNVZk9teGxWWW5Xd1pWNlF0TzJjdnJ2Y0pkZ3J1?=
 =?utf-8?B?dGFPMXJGUzZ5Z0gzN1ZRMld1L0xPMUZJSjBLcG9mOUtQNjVBTlRPVnY1cTBp?=
 =?utf-8?B?bFRSV1R3WTNQcktEMCtLYWlLQjFIOHMwMXdiZzBVa2pIYXh0czNHS0NzVDNt?=
 =?utf-8?B?UW1TdWJwdHRMTG9ZNndVVFk1LzZaVFhybjQ2cVVaakxZV1kvOEpDTExDZGxj?=
 =?utf-8?B?M2dabllmR002WG4yVUcwazRaZGRtT09ERHhNSjBNUlVnQzhNVXMwWVU2WUtL?=
 =?utf-8?B?dUNoUnJwcjBGRlZzN0M2S2RqcStLZ3JtNnJHVEFYOUUyTGQ1RDUzSkNxcmRt?=
 =?utf-8?B?Y0lyOFdRWnJZZVZhVFp3L1JDdnJoT1JmUmhYNjdma01ZSnVGcDhVVDlIVmdR?=
 =?utf-8?B?bVk1OVIxOU1Db0ZZZkVGYXdUK256TnZhQ2d0UExsZngvM1B4RnlGTU1iTmll?=
 =?utf-8?Q?wZLtZtYr5Dh9Q4YQt+ItCeao+Zp6d0e1XvfP4qi?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: beef266e-f1a3-49a4-1c27-08d976942ccc
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Sep 2021 08:55:02.9086
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mJTQyc/e+fsxVPRs1UDiZVhOrNf131cW931qdOrcMspCFwHQ9GxZEALd/JZYzl3nVYWei5aFW/ibPHesGrbYFQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB5328

Do away with the "pod_target_out_unlock" label. In particular by folding
if()-s, the logic can be expressed with less code (and no goto-s) this
way.

Limit scope of "p2m", constifying it at the same time.

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/arch/x86/mm.c
+++ b/xen/arch/x86/mm.c
@@ -4777,7 +4777,6 @@ long arch_memory_op(unsigned long cmd, X
     {
         xen_pod_target_t target;
         struct domain *d;
-        struct p2m_domain *p2m;
 
         if ( copy_from_guest(&target, arg, 1) )
             return -EFAULT;
@@ -4789,23 +4788,17 @@ long arch_memory_op(unsigned long cmd, X
         if ( !is_hvm_domain(d) )
             rc = -EINVAL;
         else if ( cmd == XENMEM_set_pod_target )
-            rc = xsm_set_pod_target(XSM_PRIV, d);
-        else
-            rc = xsm_get_pod_target(XSM_PRIV, d);
-
-        if ( rc != 0 )
-            goto pod_target_out_unlock;
-
-        if ( cmd == XENMEM_set_pod_target )
         {
-            if ( target.target_pages > d->max_pages )
-            {
+            rc = xsm_set_pod_target(XSM_PRIV, d);
+            if ( rc )
+                ASSERT(rc < 0);
+            else if ( target.target_pages > d->max_pages )
                 rc = -EINVAL;
-                goto pod_target_out_unlock;
-            }
-
-            rc = p2m_pod_set_mem_target(d, target.target_pages);
+            else
+                rc = p2m_pod_set_mem_target(d, target.target_pages);
         }
+        else
+            rc = xsm_get_pod_target(XSM_PRIV, d);
 
         if ( rc == -ERESTART )
         {
@@ -4814,19 +4807,16 @@ long arch_memory_op(unsigned long cmd, X
         }
         else if ( rc >= 0 )
         {
-            p2m = p2m_get_hostp2m(d);
+            const struct p2m_domain *p2m = p2m_get_hostp2m(d);
+
             target.tot_pages       = domain_tot_pages(d);
             target.pod_cache_pages = p2m->pod.count;
             target.pod_entries     = p2m->pod.entry_count;
 
             if ( __copy_to_guest(arg, &target, 1) )
-            {
-                rc= -EFAULT;
-                goto pod_target_out_unlock;
-            }
+                rc = -EFAULT;
         }
 
-    pod_target_out_unlock:
         rcu_unlock_domain(d);
         return rc;
     }


