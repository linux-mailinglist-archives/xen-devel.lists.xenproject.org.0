Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A5F43F852D
	for <lists+xen-devel@lfdr.de>; Thu, 26 Aug 2021 12:15:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.172891.315488 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mJCPn-0002X9-3x; Thu, 26 Aug 2021 10:15:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 172891.315488; Thu, 26 Aug 2021 10:15:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mJCPn-0002UW-09; Thu, 26 Aug 2021 10:15:19 +0000
Received: by outflank-mailman (input) for mailman id 172891;
 Thu, 26 Aug 2021 10:15:17 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=HXzX=NR=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mJCPl-0002U0-B0
 for xen-devel@lists.xenproject.org; Thu, 26 Aug 2021 10:15:17 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.109.102])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 81c9e390-0656-11ec-a9e1-12813bfff9fa;
 Thu, 26 Aug 2021 10:15:16 +0000 (UTC)
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04lp2054.outbound.protection.outlook.com [104.47.14.54]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-21-IzyJ3DauNw-cvYOKwgiq_Q-1; Thu, 26 Aug 2021 12:15:14 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB4942.eurprd04.prod.outlook.com (2603:10a6:803:59::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4436.19; Thu, 26 Aug
 2021 10:15:13 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b%7]) with mapi id 15.20.4457.017; Thu, 26 Aug 2021
 10:15:13 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AM0PR10CA0013.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:208:17c::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4457.17 via Frontend
 Transport; Thu, 26 Aug 2021 10:15:12 +0000
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
X-Inumbo-ID: 81c9e390-0656-11ec-a9e1-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1629972915;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=e6HedQ272Hp//43TliKGHrhoJiCNzxfthP7GUPhT9cI=;
	b=dzhmJWyZgTEORowpw7AukHwZDreAapKd+AqwwSL7VBZpr7Hjy7jp5Te89oyvI8fxd2q0rP
	6ZHSaXNWSY3405iRAlGzFaNhqnCv4RmYkk1ImcEwMtYVMVdivSM6nFyevhj8bpcxIoTkBG
	JbM+MEGICyzO71MxzTXtWxY+PI7irOw=
X-MC-Unique: IzyJ3DauNw-cvYOKwgiq_Q-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BSvH8K7oUPfe1XTevN+tJ9r4CogZ2pTHeJgVGZqy9Xr8XWcJUDZZa8MFtRL8IcGDFYVJiWk01tZKMJ8FpsLpK4c4Cr1CBpyn5tZfb3fg4kYcUyfA8qlF6rJ9Ied6UgUXpo1LMDLAf9w76ZQGTwygfzfth3n5b+E0C4AeQ6UWqftgLuHIFis8Hs4VyGtUG2neuDy6AGD1SUe3/BM3k/Aqf4XcdxF/dc59GfB4bGh0MFI/b+ACqvpJTHwxKzLe3yY2HLOBN+RviYxnWCmNLg8hpNjJwDZdAb6kpqokTdnoOY6g8sHTjZV2KhYiypnJ+SqEnDTvIOw1Oq/knIWkbWZZqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=e6HedQ272Hp//43TliKGHrhoJiCNzxfthP7GUPhT9cI=;
 b=lE3XO7F1fhUqoqh+3Y2exirEf7TBwopQeW9D5Uozc9psnj6C+FkgjoNwBMKoS2H09Vzy3svN8UD5c3pGSBPBoIB4Rj51HDOF8jtXGm6EHngv97z9KoSJa0EFDtJsB2ZHTKklLrnGYsGeDG9s0nI+ZQI5UJT4LZYaazA2SF7Z7cbcwr+QMcAPmgxr/z389LSfCAZ0yrwdhtV9wWzvFBGR0mKk/Ge3oaeqsmtnsTokntJp5eKSDxD2dI+gd7y2GKUlyAnLo++1JT/aTZFcvUuR39JAtSwUh55OXsG7NiAOavc+4EecD5DVXdKZAIp/tl6sZ3e+m2AqUdSVyLfRt9hQyA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=suse.com;
Subject: [PATCH 9/9] gnttab: don't silently truncate GFNs in compat
 setup-table handling
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>
References: <eb7bbd51-1da3-9a7f-27c7-49dea1a41488@suse.com>
Message-ID: <c3f4d5ce-6ac8-1d1c-eed0-704354f8a5f7@suse.com>
Date: Thu, 26 Aug 2021 12:15:10 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
In-Reply-To: <eb7bbd51-1da3-9a7f-27c7-49dea1a41488@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM0PR10CA0013.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:208:17c::23) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 740ac2c9-4632-483f-60a3-08d9687a647d
X-MS-TrafficTypeDiagnostic: VI1PR04MB4942:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB4942823F7FAE37C9078D1B1BB3C79@VI1PR04MB4942.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:854;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	VyERTY6iLDOzUKXFRg1FZdE3KCmx+jUBUtbVnIjlaM/Z3d9g1fBsd7M6J+KcoKNIwxV/WtD07Ci5gXx4fx95ZtQ7BTfxshH7vMZpmIO/o2biTsrZJrJhAyGCbeAY9b4ZFU55Q+6mZms0tigvgjvyP9wBlf0Ldyy/LAwshmDLMnXOAbWk1nm+IGaoD4+EfdMuz+gBznf09LfJAOTvPOUwLDSlZly2RX+3xUf2dqKoa/WPMHwHlPRrjNtAg/A3hh/MVIEwCe6EOgy+gnEP1dngmZCIxF4SQxoEQ+poscKGXH0FNlJBOl1EAciLQrr4RtZ3jP7q2LHnYaAaCqWb2WyrrLxs29TEl4N7MX7MZLL0CDExRVFRiM4jMtc0+WlSv8IbKn5jASzMcIwmhKkmAzNVbD047I/UghFTIvwN9NPTRc4vic6Y9aUWhz5CH4cnrJjN9NUIDOD0ALjomMTcHZBzbd6EIeHeLMytG6JSkeiJK+IVXsTq00W/mnY/9ByYlIkTqjf5Nv+JO5DeY/7qwOl2I+dPOFGYQ3mHkFdWvqqCvHxwDJXvVADZWs7+ZcAgWdA3gpqQ61qXkpG3STT2gCQzwNjP5V0sM7V30hOKqgnZGuPjEtjHaQvC92hEbi71IcyncoTTXzpKlCZwyJklBEIPToUbITnGyet29ukXJYypzkt5X+va8BLiJ+FVwuLsmkNV2FY7YgScUFyidoFhZ+scMQDTXW244mPTjLcLllbda9c=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(346002)(136003)(366004)(376002)(396003)(39850400004)(2906002)(2616005)(36756003)(31686004)(8676002)(54906003)(26005)(6916009)(5660300002)(956004)(186003)(4326008)(66476007)(316002)(8936002)(86362001)(478600001)(16576012)(31696002)(38100700002)(66556008)(6486002)(66946007)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?LzRLN2NTRlhoMWJjQTVSMzQ2VjZ2SkIza1RZbzBuTEs1RVd3OVpHS2dtSFYv?=
 =?utf-8?B?SU9mamtsYTd1UXFsdTB1QS9HRXNDL1ZNUFEwVWt0eUF1RC9wcnhSaVBaMDdw?=
 =?utf-8?B?UFR5UDNDT3dPSXRJdm5WNU8yUnBQb0VtNEZ5VExwUGJTdnJMNzRSWllwMUJG?=
 =?utf-8?B?K2FlZWwyMkZoZ3ZEcHM1ODRqZGwzNW9zRVpLaDIzOFplS2gvQytBUWVET2VN?=
 =?utf-8?B?ZG1TUEFDQzlsNFFaWXRzSDZpdGIwWmxnMWVIeUFnUURhakZyN2k1MXpWRDQ1?=
 =?utf-8?B?L3F1U0Z5WDBHbER4bkJwdnpJVTJnV0dXWWJmSVBIWEExeEVLQW83bWQvdnJK?=
 =?utf-8?B?YjlyMzRYQkNnT0llZGFxczZKZDY5SnQrbnE5MHEwLythVWhtdVZJRldLUWhn?=
 =?utf-8?B?VDRBOHd6MXNGT0FNOXVDbFE2QTZoK21aYnBJVmE4N09SQ3RlYXhTZFlWcHZH?=
 =?utf-8?B?eXV6V2k5RE50UStOUmpqWnhMNXgzM0V3Ykc1SnJpaTMxZzRid2lLZnR0RGNt?=
 =?utf-8?B?dnV1M25CV29NS0FwODRXa2lSOEFvTDBPczBLU1VJNnltZUtrYnE3ZkoxM3g5?=
 =?utf-8?B?WUdzK2RpWU9hZWRKY091d3hwSkZoNHpGem5wUncyS0loaGkrNStIL29wR0dn?=
 =?utf-8?B?Tk9tam1ab1FKaHZQQ2RJUllBaFhEM1RlUEVpdFcvYWk1TEc1OHJGTnhFMm5O?=
 =?utf-8?B?djBLbHBDM2lUd2pmMGVhL3JzTTVidGxBY01TdlVPd1FSYWpteGpqTTJqNzNX?=
 =?utf-8?B?bTlEYm9WcjRZQjczZy9xREVMR21CYjFrdXBNYlhoekRXdjgybUg0czJ4anM2?=
 =?utf-8?B?TjVkazJDa0lzLzh4MWVGaVkxOEV3RXJucEVaMHdNeXMvYlJ6U0F5Z3E4R0ZM?=
 =?utf-8?B?YmcycEM2bG9yc0pzTjdvZ2t2bkdEMysvOG1xT2FwdWN0c2tMOFNLVjNtOW1l?=
 =?utf-8?B?V0JNU0tSYWs2WXppdXlKZDFsTEZQemhsdFZrVjNiWld4NlNMK3VPK1ZJc2dQ?=
 =?utf-8?B?eTdsODBLandpRHBsTlVuUE1wZjB0amRUUUVxSEhSRWFuZ2drenZuUm9GWTZ1?=
 =?utf-8?B?Q2J2UWVyTG9zNmdhcGhKRHVFSHg2UnRYdjZNRmlBTlp6VHhWcm5vVEZwV1ZW?=
 =?utf-8?B?dDkvYy9TWkdOZ1U1cUttdis3VGdmd25xR2Z5dHFQNDlFSktPNUVJZFdxRktI?=
 =?utf-8?B?L2l6dDRCazRmQ1VieXV5LzZIalBPV2N2dmhUcm9FSEFmNGZ1YnJnSVhaVm9x?=
 =?utf-8?B?WUJzZnpZNGEzUk1XelAvaUFhaDVyZTNyV3I5cEFyVjVYYVFvbXVpYkx2dEVU?=
 =?utf-8?B?YWtPOXZSQ0plQXNzOXA3L0JBUGN6Q3N0WFRZOWZKM1BkMEhhUnhKY2I5cERy?=
 =?utf-8?B?ZktDS3gvZ0Fvak05T2ljd3Y3M3NZRkRWUHBnckVqcHU1Nk82TlJ1ODFVOTVn?=
 =?utf-8?B?UjZ3TDZaSVV4YmNWUlVIRnNVaDNqNFFDbk51VFhNYStNWitqeXlGTU1KRExC?=
 =?utf-8?B?WG9mTHc0L1JFTGlXN3IyNTZQZ21oUUhPUE5qR2Q4emNBZEc4Vzc4R01rLzFL?=
 =?utf-8?B?UDdXMEFhOEJ1a2llMFp5blBRNmFpUCtuVUo0N2NsZDVjVUZENXYzNUlxTkZy?=
 =?utf-8?B?MnlRb0tDY1RzTVI2eHJML2NOT1JHaC81dnk4bllOaXdEaWJPSWZtMUZlbmZa?=
 =?utf-8?B?NkJMT0lwdzBWL3dSTEpIUGNlZ1pmd2U2V0dQRENmK2FYcXpZOVpOMDNodzUz?=
 =?utf-8?Q?GhosKWsxA3tV3fapN5WcStyGEL0TKK8+YUxf30A?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 740ac2c9-4632-483f-60a3-08d9687a647d
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Aug 2021 10:15:13.2072
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SnDcD+rDPOrftbIpSM/CXV1f8mSwOEpxJYEyu5qWje1ubg/uQj57C5qFJ4XCte41khQVgkR1wEEPts41JTHi4w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB4942

Returning back truncated frame numbers is unhelpful: Quite likely
they're not owned by the domain (if it's PV), or we may misguide the
guest into writing grant entries into a page that it actually uses for
other purposes.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
RFC: Arguably in the 32-bit PV case it may be necessary to instead put
     in place an explicit address restriction when allocating
     ->shared_raw[N]. This is currently implicit by alloc_xenheap_page()
     only returning memory covered by the direct-map.

--- a/xen/common/compat/grant_table.c
+++ b/xen/common/compat/grant_table.c
@@ -175,8 +175,15 @@ int compat_grant_table_op(unsigned int c
                                  i < (_s_)->nr_frames; ++i ) \
                     { \
                         compat_pfn_t frame = (_s_)->frame_list.p[i]; \
-                        if ( __copy_to_compat_offset((_d_)->frame_list, \
-                                                     i, &frame, 1) ) \
+                        if ( frame != (_s_)->frame_list.p[i] ) \
+                        { \
+                            if ( VALID_M2P((_s_)->frame_list.p[i]) ) \
+                                (_s_)->status = GNTST_address_too_big; \
+                            else \
+                                frame |= 0x80000000U;\
+                        } \
+                        else if ( __copy_to_compat_offset((_d_)->frame_list, \
+                                                          i, &frame, 1) ) \
                             (_s_)->status = GNTST_bad_virt_addr; \
                     } \
                 } while (0)


