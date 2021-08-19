Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B1B83F14CE
	for <lists+xen-devel@lfdr.de>; Thu, 19 Aug 2021 10:06:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.168427.307510 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mGd3i-000573-KP; Thu, 19 Aug 2021 08:05:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 168427.307510; Thu, 19 Aug 2021 08:05:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mGd3i-000552-Gt; Thu, 19 Aug 2021 08:05:54 +0000
Received: by outflank-mailman (input) for mailman id 168427;
 Thu, 19 Aug 2021 08:05:53 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=KGBc=NK=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mGd3h-00054u-Mq
 for xen-devel@lists.xenproject.org; Thu, 19 Aug 2021 08:05:53 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.111.102])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 456e12e6-00c4-11ec-a5c4-12813bfff9fa;
 Thu, 19 Aug 2021 08:05:52 +0000 (UTC)
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04lp2050.outbound.protection.outlook.com [104.47.12.50]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-12-YmB38p9SO4W2TO28ayXuRw-1; Thu, 19 Aug 2021 10:05:50 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR0402MB3774.eurprd04.prod.outlook.com (2603:10a6:803:1f::28)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4415.19; Thu, 19 Aug
 2021 08:05:49 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::99d3:99cd:8adf:3eea]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::99d3:99cd:8adf:3eea%5]) with mapi id 15.20.4415.024; Thu, 19 Aug 2021
 08:05:49 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AM4PR0501CA0057.eurprd05.prod.outlook.com (2603:10a6:200:68::25) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4436.19 via Frontend
 Transport; Thu, 19 Aug 2021 08:05:49 +0000
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
X-Inumbo-ID: 456e12e6-00c4-11ec-a5c4-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1629360351;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=dMci15fYzxhTs5f2mFFQLa4HsjEbVuo0tly+3SL4b+g=;
	b=nbfNssQqvCzHnJvehTPMfGEO4F7MNX+xsYeqHe+VuYKArjHSg0MVvvN6eVYRCXEpgkw6gt
	LS9LxPjijyOl8TUwE5+bJHjvkVxJMZKg7MKthYjhEH7Ig97/lGTVNJC9Lpv4pClVaxE2c5
	3B896N9mU2vrjBta1jToL2QEmaTHjTQ=
X-MC-Unique: YmB38p9SO4W2TO28ayXuRw-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iZX/Qg0Qj1NIGB1jl7/rAGcUukMg9UVdyemyUrLSkIqEeCaGjx/2zezdKwrqfxeUV41OBfDed69PJxZSPuCxgbpXeB0IUtMuiKXN8Dkr8f+MQvIh3emK4I8wQ1zFsgpIE5RT+n5cOG+iib3710ZmSKi3RxoSwgQX7uDu3vBnuEre07l6Rgn/lNH7uCADUrozEZkZox+B7oCoT79KzfgCOMWi8ckV9PedCknPn1CyTC2O478VPIFBtT5e+JEwTNPEgyzqoUFJlu7A2DVrkN+1paYbzddSU9I5CN9kGeDtzBVBQAkZ2pbBxnqJKc8JyxYlNf/RSiyvS3G9ECQJ3ZdayA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dMci15fYzxhTs5f2mFFQLa4HsjEbVuo0tly+3SL4b+g=;
 b=nZTrJjkgS5UdGyEYYj+Va4yUl360uuCAJ5CGgbYs28PA34RtRvFK/eCwDLTqZj6EyYxdSgufda7/gBgFdzyQGJFmiE6lqO0k0iuAhBi5R4in6/sORqDRy6eFSBpFTDNLxNMln09QZe4Ip12hjZpbKCF9nP2+LZwzQdlGr+m2m21UvExCViVzaDNAY4FF9Qs/qAYLwKq/ovw6GFmeblim0C9sLKVcR7rdGbG5jQYSYi6avwYAAwO4D9ieiLoRtpAs4aHbx79audG6BKaEOMpfkAg7XDShiiCFTyR+MB/1E5vM80UxMVZo1T8R5eflSMYA7tOEdXv3hvAmah/U+r0/Ug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=suse.com;
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Kevin Tian <kevin.tian@intel.com>, Paul Durrant <paul@xen.org>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH] VT-d: fix caching mode IOTLB flushing
Message-ID: <8b873e30-c1d1-3174-9e67-506887deedcc@suse.com>
Date: Thu, 19 Aug 2021 10:05:47 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM4PR0501CA0057.eurprd05.prod.outlook.com
 (2603:10a6:200:68::25) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8a3ffa86-96ce-446c-0dca-08d962e82806
X-MS-TrafficTypeDiagnostic: VI1PR0402MB3774:
X-Microsoft-Antispam-PRVS:
	<VI1PR0402MB3774BCAD74D9C171F6F30BEFB3C09@VI1PR0402MB3774.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	wfq32mlKGUp7MRqQWxBLWIZyadJhTLrWQZMhjZNIyoxk8Bg43Zul08UZoY1F7jwXLqOe/UXIFpmylhNTuCOewjs2Qi0RoQe5pkB+droZfnFyPHrGpO5UOInUGr2NXc68bf2QDcwO6gPvtNJlXH5QL19pMwuIbI8OZN4ivZBYVsyg08trISyibfzWnZFUANGGuN0Sx17uam29lTBqT5ZOgEjbabszLNDqpTFeBNk4MTbMf35ASf0itq70DvBvR6LNPbieZXLXZzEV7zrokxXtzN9ah6lyvm3wsrMq/tXZIt2LEZWhDnwukOTVvjYCatkm3ZErdxVGITIiF8mD0waIz0vURF/M+gGqO8Iyk52nkwve20iNVJzpiAfmjDigUSMeSAX0gcA6OfwcOSe7iKPLj2ejVx2nOOtiWHwwUDKxDO+H82u14CIq6nc4K23tiLrhOq1xCRXocUjA5G5efeuGYwBmTYVmeZ8/CtJwRPMqUeDMSkVn5aDjy+sP6keGb1LGfDlgmH9q0LHryOh1Gs0S/mSdeo3+l66tiUf3yRS1pbXyvN7HeyAOK9L58DfvTZMKQFYjl+9WGwUyRHx/0ndGmDcJaM5ROYRqaGT0kR+Noy9A6T1kjGT3Bd/1XEy67NUsyeQJVLbkh8q5s8M2fhiy2UyxBPilByhJX3QVd2a+vXcliNaHCdetz92TKGARyZZ2+sOvKimUl+eaVauz7p80z0V4QvaH8D8K/B+5+8gD33k=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(346002)(136003)(396003)(39850400004)(376002)(86362001)(31696002)(54906003)(36756003)(6486002)(66946007)(31686004)(26005)(186003)(66476007)(66556008)(2906002)(8936002)(5660300002)(8676002)(316002)(478600001)(956004)(6916009)(38100700002)(2616005)(4326008)(16576012)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SUZaRnp1cjhwNUM2VXFzMWNZSXVKYS81dTNQaG1CYUtINmlhK0Q0Ynp1eWp1?=
 =?utf-8?B?YzNEWTJJWlBQNWJpY0oyVllpSEM0MmNYa216RG45eWZFRWlyUm1XWjFCZ2d4?=
 =?utf-8?B?Y1RxZjRFZS8xNEgzRG1GNGZaVFV0a0FUc3ZGb0ZIRnBkVGVTZDVYemJXZTZz?=
 =?utf-8?B?Wlg2WE00MEJpbDMwSDNCWEppMUc5QU0vbzdHbWhMTEorTkduZ1RERk96SW9j?=
 =?utf-8?B?eXBnM3VNZGliajRzUzh1NjMzTXdMRVJqbjN1STRPOE5FUEM0U0ZyRUJPVDkv?=
 =?utf-8?B?R05ZSXh6S2luYVh0dHFZTTJkbXAwdThXTGZ4anFPL2tUOWl6VEU2czNZckhz?=
 =?utf-8?B?YkpiTzNnV3BDMlM2ZkZwODkxUGpVUlZIRXBMbXN6MllkQUl5THJaTlNrSGdK?=
 =?utf-8?B?d0lWdlFrU1MrOGY5bXdWdG5rc3FYVDh3dDEzeCtUY0hmbnR6cjlrWDBCM0Ru?=
 =?utf-8?B?ZXU2NURXSkVRTERzUDRWWGs2eDVQRXNwYmdqejVTdkxoSklTSnVYZUtlZ0NI?=
 =?utf-8?B?MmRERlRGUG9zK2ZHSmtpaDlCM1duc0JBaDRMbG42cCtmaGdWbFRtSFlrZ0U0?=
 =?utf-8?B?V01mTTVlZlZHcnkrOEdwYklScmQ4VGJMWXVuN1V6QzhEYmg2TkNWK2EwKyt5?=
 =?utf-8?B?Q0hyY1RiSFptMit4VFV6MThwc0JnSDVoZVY4RDFiTjhOR2dYY21WNitveFNi?=
 =?utf-8?B?SDBHd1RUbWZtd3ZST3RTcEVTdjVJOFM5WktaWGpNeWlEQk9ZVWZtdHNiYnpz?=
 =?utf-8?B?MnNZSk8wdytjR0lNZThHQlpSaVE1dDI5UStTYzl4bjlZNVpYUzZWMDJwWHQ5?=
 =?utf-8?B?U3dWeEhBY0xRaXRRSXpOaFREcGQwd0RvUkNvTSsyV2cwUHdSdzZ5VDVTc2ZR?=
 =?utf-8?B?TFp3eCtOR1hiK1dNSURmU3ZUd0NhdnRzRVlLNmVJa2ZwU0Y1S1cyc01kRUN5?=
 =?utf-8?B?VWxNUHpjR2Uza0Z2aGY2dTAydkc2MjhRRUpSSVF0YkQwbDNZYlFXODVkU0lZ?=
 =?utf-8?B?cDZPVWxJVXJZSGl1ZnRCVGJqdDZYVTBUK1U1THhIRGhxRHpwajlKOHQrRFhk?=
 =?utf-8?B?TytybmMzdU5NTDBwbGV6dndpYVllT2xuOE9YbzF5V2JqdWt5RmprN3dDeTl6?=
 =?utf-8?B?S1dBeXhhb3lkaVNraktZU1RTV3ZaelRLbWNSZDAwQ245REhTNDFTeUUvV3RP?=
 =?utf-8?B?U1ZyQnRFNHVwZUIxbEdSb3lodmtDL29JQ0puYkk3bmpkRVJ0K2ZORlZMejZR?=
 =?utf-8?B?TXhtUWErNndockNQOEgvTXFGUlBUWFg3aWRPTHpYeEFScGNKeHFMWWRZMU9j?=
 =?utf-8?B?RVlvQ3lKYjFHcVpYSVlyUG5lemtPVjd4Qy9Cajd1L3J6UWZqdGI3b1oyejFq?=
 =?utf-8?B?RitZQjR4ZEZzQURwVkFUNkszN3Y0U2t3bGZDUm5LRUlUaVhKRkVub1ltR2JM?=
 =?utf-8?B?enRqVlQzWGJtZDAzRit2eGplQmdnQWtXMDNVMGp5Y28zd3o1VzhZaEZQRXda?=
 =?utf-8?B?VFozakFLTVBCQTJlc2RtQ1poeEtvT1dqLzhlUWVWbDVYQzNNcFFnVWN6ZlJq?=
 =?utf-8?B?NTltcHNCR3EybjRZNmJOeWh4TCtPenR6WlltREhKbEdkclh4VjQ4eDh0SWda?=
 =?utf-8?B?Rlk0S1hvY1ZmN091MXhWV3pKT3dBQzJuVFlHM2FoaXlic0h3SkorbnMrWnZC?=
 =?utf-8?B?NzdqbVhoRHR2MVhmK2NhS0NISlBpdHVZbUdPV01FaUtZY0Z1d0l3MnlrcURz?=
 =?utf-8?Q?O3oSxqzqn2PLF1ahF31NMNpxFF/8sn2CAMJ/mCv?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8a3ffa86-96ce-446c-0dca-08d962e82806
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Aug 2021 08:05:49.4055
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IjA8MH+KfPEPyBPLYBDZ5JIQiuiKAogFLSSBA+IGPsyXKYQe2Bi+66YOvzcg9buH9hkfNh5HN0YfxkOAofXSUQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0402MB3774

While for context cache entry flushing use of did 0 is indeed correct
(after all upon reading the context entry the IOMMU wouldn't know any
domain ID if the entry is not present, and hence a surrogate one needs
to be used), for IOTLB entries the normal domain ID (from the [present]
context entry) gets used. See sub-section "IOTLB" of section "Address
Translation Caches" in the VT-d spec.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
Luckily this is supposed to be an issue only when running on emulated
IOMMUs; hardware implementations are expected to have CAP.CM=0.

--- a/xen/drivers/passthrough/vtd/iommu.c
+++ b/xen/drivers/passthrough/vtd/iommu.c
@@ -474,17 +474,10 @@ int vtd_flush_iotlb_reg(struct vtd_iommu
 
     /*
      * In the non-present entry flush case, if hardware doesn't cache
-     * non-present entry we do nothing and if hardware cache non-present
-     * entry, we flush entries of domain 0 (the domain id is used to cache
-     * any non-present entries)
+     * non-present entries we do nothing.
      */
-    if ( flush_non_present_entry )
-    {
-        if ( !cap_caching_mode(iommu->cap) )
-            return 1;
-        else
-            did = 0;
-    }
+    if ( flush_non_present_entry && !cap_caching_mode(iommu->cap) )
+        return 1;
 
     /* use register invalidation */
     switch ( type )
--- a/xen/drivers/passthrough/vtd/qinval.c
+++ b/xen/drivers/passthrough/vtd/qinval.c
@@ -362,17 +362,10 @@ static int __must_check flush_iotlb_qi(s
 
     /*
      * In the non-present entry flush case, if hardware doesn't cache
-     * non-present entry we do nothing and if hardware cache non-present
-     * entry, we flush entries of domain 0 (the domain id is used to cache
-     * any non-present entries)
+     * non-present entries we do nothing.
      */
-    if ( flush_non_present_entry )
-    {
-        if ( !cap_caching_mode(iommu->cap) )
-            return 1;
-        else
-            did = 0;
-    }
+    if ( flush_non_present_entry && !cap_caching_mode(iommu->cap) )
+        return 1;
 
     /* use queued invalidation */
     if (cap_write_drain(iommu->cap))


