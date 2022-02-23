Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 809914C164B
	for <lists+xen-devel@lfdr.de>; Wed, 23 Feb 2022 16:15:12 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.277419.473908 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nMtM6-00020L-NM; Wed, 23 Feb 2022 15:15:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 277419.473908; Wed, 23 Feb 2022 15:15:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nMtM6-0001z4-If; Wed, 23 Feb 2022 15:15:02 +0000
Received: by outflank-mailman (input) for mailman id 277419;
 Wed, 23 Feb 2022 15:15:01 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=DZ7u=TG=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nMtM5-0001xo-Gc
 for xen-devel@lists.xenproject.org; Wed, 23 Feb 2022 15:15:01 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5e46f61d-94bb-11ec-8eb8-a37418f5ba1a;
 Wed, 23 Feb 2022 16:15:00 +0100 (CET)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05lp2174.outbound.protection.outlook.com [104.47.17.174]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-27-QyKErOFPMvuwCLrVRxdJrw-1; Wed, 23 Feb 2022 16:14:59 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB4624.eurprd04.prod.outlook.com (2603:10a6:803:72::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4995.26; Wed, 23 Feb
 2022 15:14:57 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::d479:b728:345c:bd65]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::d479:b728:345c:bd65%6]) with mapi id 15.20.5017.022; Wed, 23 Feb 2022
 15:14:57 +0000
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
X-Inumbo-ID: 5e46f61d-94bb-11ec-8eb8-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1645629300;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=st09De5AhrTxtdqW5QYgoa+DjF7F0kOPM0aXdyBYarM=;
	b=VhLilorMbEjZS+D/HH82XbAqqEHEm6pdaxtdFHnsK05Wx15gC8tFD8Gqyb8dL42l5/8CE+
	KMGWScs7HlZa1XUyxCBKdM6w+4yjSsVk1RpYkfGyqJa/LYQ/33r/lusJlJggfsqJmDfOrN
	V1wH1a6Elt0tHQ4KbSpx5j3C4j05Cbw=
X-MC-Unique: QyKErOFPMvuwCLrVRxdJrw-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JIfAxmIMAJeqOtVHyS5LYz9eBwzWXekExKRqJizoEc7CGUnEHjcFrbyBcmLf997yA1OiIQgayPxpAvMtx3fWFdLNge82iWHEL7+mWOa+JWU5tLGAEIxmKU9Y0EXqS5mmSBCjQIMymDhXBofTRUzZUb9dCnSfy6YCOEZFxenpnZpR/9WmtxjE4OhlgzAa9stVd/6qWCzIUqbtqDCbyGk9VreJqwLUB5+2QkpiLszL+j609ziZ1nYx9U2ywLMj6rEqAyGKcMMxdHh6QFb3DYyWbVMn8R0g67H11tN3GB1A80CmIm1xAQq/yV4oBKtlnQPy5x9jrONnBLq0GYzupT0sqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=st09De5AhrTxtdqW5QYgoa+DjF7F0kOPM0aXdyBYarM=;
 b=HSj84r02CbY+xmuKm5mTllNjAIX1oF5YfGBA8oP6/ZSFRSmbT0Qk8NkfIGdYIpgRoa2kiNmNx4e1lAgeBwlJIDrjdnqVEhvM1Y4FIeDd9imkO9ztWpOdYnUvvm2vHf8FDZizdo9BeB5UpgqP3UZy74NNCWSU+sLwlE5lob0WXdNb5kmeQZlGKS4txWZrcUxFUYS6DdckVPAPoeMeAX4+qe0f/93m1DKMVr0lGBpumayoDUsKywY4C73jPCU9KpjsN0MgRRrMo+k8lM85pl/RB/PD7QPxpV4qI5KtIjBgBglJhLOg338xWgnHf+XDQAITROv6KtsxqUWA/PvHChGESQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <5a8c1f9e-e91a-a7f5-8c8a-025ab6a39908@suse.com>
Date: Wed, 23 Feb 2022 16:14:55 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
Subject: [PATCH 1/2] x86/p2m: make p2m_get_page_from_gfn() handle grant and
 shared cases better
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Tamas K Lengyel <tamas@tklengyel.com>
References: <32526b73-25f7-e6b0-208b-669a7648ee44@suse.com>
In-Reply-To: <32526b73-25f7-e6b0-208b-669a7648ee44@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS8PR05CA0015.eurprd05.prod.outlook.com
 (2603:10a6:20b:311::20) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2f341c8c-ac06-4f8e-6496-08d9f6df40cb
X-MS-TrafficTypeDiagnostic: VI1PR04MB4624:EE_
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB4624166E13ED5046976D52DBB33C9@VI1PR04MB4624.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	LENeZugZTYcDC8iqmEYrWAdyiPRXg6/a4IwqZnesTjxQ1cJiEpFDvG7gTdsE+05hFmiYoyPB2qdye3gaNHzBaehykW5w9iR+JpbexDHwk7bASKXosjAOAeALzyY873Wwb8pOiWGQkQt8T/OAyF8hyeyFqLCclikb7Imqjp2iDy7GmYjIbjQrpKq5Gg8GHUpe3e2eUb0ixlRKGpB4a5XoDy5N1MbIjCyN5s5HMuwU9rx1rllW48XgYApbZ9s+JKSdoo0kEEyUlKlq71lQrCwXUekd4qh6SbgL3wQVHyo5ntJa812FPlM5fjt793q+kzAbTELwxRWdxhvRM/M9zQxMZaD81XwmCpV/YTAjwSlEMrfmKaAaSiirVVs9J6BIPOzeQUCdf8slVBtqhaF5OJRhrUA+gHjZiXtMc8atKSdjdLG9udeWoSa0U8FctzyaLHd8H6bAlla5Cvr/6Q3j5qsQvhAEV1NkAe5dpaQoi2jr7nSpj6eq7bWJuC3f3vKFOG3oBDCcYvEx0f5RXdzL6fjwnmuSQYPRcJdufJPAG57Kc5zooIPK/MiK3mjrQ7caaGck9Pw4kWuCmj+E9zhBE967N0rWY17HJDfxcEHINnb6Htu0Nmlrs41ZmabwlU8xqEmcwaWZZKTz0Q3d95Lhz+wzqxzuqEwqgG+ya7bqYk1kXEKul2kPr6pYPQwAyL2wpHmiqtH1TJhuj9u1GR12ro2E/VyQDD4ejiBdgNKpQdd4M2qaQZG7DOKvfXbwLWyYasyM
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(186003)(2616005)(38100700002)(26005)(86362001)(31696002)(83380400001)(54906003)(5660300002)(8676002)(316002)(6916009)(66556008)(66476007)(66946007)(2906002)(4326008)(508600001)(31686004)(6486002)(36756003)(6506007)(6512007)(8936002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UmNaYmdscHJmNzFnNkk5YlRVb0NOV253VklNTlRsaXIvMDR0YkRYZExCdkVU?=
 =?utf-8?B?dUVuWmU2RTl4ZmpBeHI4RTUvR1B2TXFRM1hjamlpWnlFOEtaNDB0WHFQQzhl?=
 =?utf-8?B?cDdPM3VDQlpLUUJrM3RoYk91VnFRazBFclBNNG5ITWhzWHg4azgxNGY0Mk0r?=
 =?utf-8?B?aGJFR2l3R1V0WWkvNmhqTW41MDZUdDNmQTNaVWtOZDBjUFdvRjF0bExJT0ta?=
 =?utf-8?B?eXlqWUdMdkIzbVV3aERGbGRSeS9RM0lKTXVYbkJtL3dRKzVZYmZjc0QySUlj?=
 =?utf-8?B?RmhJOTI5bDkrRkdxdmN6cFV1TTQ2YmNQQVFjYmIzNWJ5OE1pcHVKSWNrMTRz?=
 =?utf-8?B?aWYyZExRMm9rSmhwRGd2WUoxZWlKbHNvdVlYcENyOWRialp4cmZrVE1BaW41?=
 =?utf-8?B?VTlFbjRXTU9CS1JndVQ0V1A3ZnllejMvY2FvbkhKMm90SmxsaFpJN3N1K2RY?=
 =?utf-8?B?UnlCMnVFVWRaalMrVDYweGlQTVNIL2hIWk42aUF4R0tXNjJnSVpZSzZGZ2Ez?=
 =?utf-8?B?amx4dGdVUGpScmE2TCtNeXJoNm5vYXp5MEpGVEJGUFdvR2hqMTNpL2YvTDJF?=
 =?utf-8?B?YlNocVB3QXMzOHB3N0xZMElSZ0xQK01LTE5RRk5jeUVPaTMrdXpNNk9MajNG?=
 =?utf-8?B?a2p4Z3RLeG5rUmJIeGtjQUk5OGtRL3FpR3FSKy81NWt1RDEwcDRtckNmQWlO?=
 =?utf-8?B?SU10YW9oTU5PNEdIT292UDhCQXJqZTdzUXJ4NW1oMk9mZ0N3TWtWdS9QOGlS?=
 =?utf-8?B?U2dPYzlaSzN6R1QybWZybVJ0bElKUGZrNmgyNmNtUmQ2UXFZOVJCNnhRNW9j?=
 =?utf-8?B?b2I4WVpLWmhlWU1mTW95TXVqSnVTZlpBQ0hZempiem16T1ZJbFptcEU4YitK?=
 =?utf-8?B?NXZaOXlSLzBaVTE5b1c0WWVPQ3plQUNUS1NpZFd5UXJLc29oUDR5aytWdENW?=
 =?utf-8?B?TWdhRnI3ODl0L3FPcnRXbktkZlZ0OW5YWmVPc2JCd0xiZWlSZGhTZlBZdGdn?=
 =?utf-8?B?OEhPYkpTdmpJNXlST01QVG9iTERjSEZTTUVXZ2NGd1Fud2RHVzNVSkFvaWNF?=
 =?utf-8?B?aTN0dzR1aGt5UE9nWm1HVUYxRmdBU1lPT1Erd2tLMFk0OWF1b2VZeURIakZG?=
 =?utf-8?B?UTBmMFVpbXF6eW9jWFJKbjFJVDFXUGFIMnZPVHNHNnVNVkd2bFRYVEFDZWtI?=
 =?utf-8?B?WlhBTjZHdmhuL2hrRGNkOVgvSzR5L2sraHJod1BvSFY4N09ZZ2tDTDhEQVFB?=
 =?utf-8?B?c2t5S1V0d0V0SkFKOWRadXR3QkIveDdxQ1R2RWFQbmlBb1RLSFFFUCtMWkt2?=
 =?utf-8?B?dWxzWWFubnRpSDlxUVNrSkM3SllaK3ZjVk51SVRNQ3I5TlNuUFdXMlZrUHUy?=
 =?utf-8?B?YTZLQ2RNYVJscjNITG90a3cxNDYwdkQ5ZERmQU4vVXdoRkkxN24xWVJVckRv?=
 =?utf-8?B?NGVJRDY2VlpjbGZHd1VHdW1JNHlSMy8xRkI4c0hBNmxEMk1nY0dVbW1GR1Ay?=
 =?utf-8?B?TzZJeXJRRkljSjAvd0ppKzJOVHFSdkRUa1VCeGpzU2ZWMXdsbzVOTkJBV3Qv?=
 =?utf-8?B?djdOWm5EcDVSRGQ4djNlZ2JZcG9kYnBBQyt1NXY4L3cvYkVnOTlLMDdOTzhI?=
 =?utf-8?B?KzFBQ1U2WTkzMTA4RjNPVUdLc2RROUtiS1RiNU1Bd2RwQ2xidHk0Ly9mM21n?=
 =?utf-8?B?TGFQcnVwbzdKekRwSzVXUEx3ZHBQUlJaaVNYUmkzRTloUkNJcDA0cGlNV2ow?=
 =?utf-8?B?d2kwVGdycEVYdFRnaGpxTWVlQXVyMzZzZkRXbWVyMVViMVJVZmpWK1YvL2dN?=
 =?utf-8?B?d2JZckJUREV1UTZKc3F5MFpmQXhiaW1GQjV6VkpmcEV3YXliUHNPMjBxUDdO?=
 =?utf-8?B?bXRneEVjb1o3MTZUbHcrcFFDMDRVeDhDbm1BQWNHckkwdUZxSVZEZUNHU3hk?=
 =?utf-8?B?MFVmUzJvS2dMOFNuQmtWQmxyVkJjVzZNa3RINFVzaGRieHdZZmYvR0NRU0NR?=
 =?utf-8?B?NVhKNW1EaFkxb3Z1NnI1UXovZytSZ2JRNEthOFNva3E2ei91bWdidXNoby94?=
 =?utf-8?B?SHg1WUp0K2p0QmFkSVFHRUV1dk4xT0ZhWExwZUZUazlFcUdBWW5JM0xaM3g4?=
 =?utf-8?B?UDU3WUoxY2w0cjg1Y2w3dUN5N285d203SHV5ZzhLZVVZK2JQY2ZaYkNVQnh1?=
 =?utf-8?Q?vobZ6as4bEMPjhEBtUzxXs4=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2f341c8c-ac06-4f8e-6496-08d9f6df40cb
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Feb 2022 15:14:57.6097
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 22Upqrmy8rnUs+MW3vAIqtXHIZbXBNwnk3dZnYBHTi3OnGbmvxuj8ezLzNAYq9pde8ygFlfegoWh0WoSd8YhwA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB4624

Grant P2M entries, which are covered by p2m_is_any_ram(), wouldn't pass
the get_page() unless the grant was a local one. These need to take the
same path as foreign entries. Just the assertion there is not valid for
local grants, and hence it triggering needs to be avoided.

Shared entries, when unshare is requested, would bypass the retrieval of
"page" and thus always take the error path rather than actually trying
to unshare by taking the slow path.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
Using | instead of || helps the compiler fold the two p2m_is_*().

--- a/xen/arch/x86/mm/p2m.c
+++ b/xen/arch/x86/mm/p2m.c
@@ -584,11 +584,11 @@ struct page_info *p2m_get_page_from_gfn(
              && !((q & P2M_UNSHARE) && p2m_is_shared(*t)) )
         {
             page = mfn_to_page(mfn);
-            if ( unlikely(p2m_is_foreign(*t)) )
+            if ( unlikely(p2m_is_foreign(*t) | p2m_is_grant(*t)) )
             {
                 struct domain *fdom = page_get_owner_and_reference(page);
 
-                ASSERT(fdom != p2m->domain);
+                ASSERT(!p2m_is_foreign(*t) || fdom != p2m->domain);
                 if ( fdom == NULL )
                     page = NULL;
             }
@@ -607,6 +607,7 @@ struct page_info *p2m_get_page_from_gfn(
 
         /* Error path: not a suitable GFN at all */
         if ( !p2m_is_ram(*t) && !p2m_is_paging(*t) && !p2m_is_pod(*t) &&
+             (!p2m_is_shared(*t) || !(q & P2M_UNSHARE)) &&
              !mem_sharing_is_fork(p2m->domain) )
             return NULL;
     }


