Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 364463B444B
	for <lists+xen-devel@lfdr.de>; Fri, 25 Jun 2021 15:20:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.147196.271166 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lwlkY-000143-6t; Fri, 25 Jun 2021 13:20:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 147196.271166; Fri, 25 Jun 2021 13:20:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lwlkY-00011Y-0e; Fri, 25 Jun 2021 13:20:02 +0000
Received: by outflank-mailman (input) for mailman id 147196;
 Fri, 25 Jun 2021 13:20:00 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=JBOo=LT=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lwlkW-0000y2-HW
 for xen-devel@lists.xenproject.org; Fri, 25 Jun 2021 13:20:00 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.111.102])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id b1d4cd40-0721-436b-9954-39d18df7b62a;
 Fri, 25 Jun 2021 13:19:59 +0000 (UTC)
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04lp2055.outbound.protection.outlook.com [104.47.13.55]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-22-GVjm8HHUOPqADXMl-wDJhA-3; Fri, 25 Jun 2021 15:19:57 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB5901.eurprd04.prod.outlook.com (2603:10a6:803:e9::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4264.19; Fri, 25 Jun
 2021 13:19:54 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::99d3:99cd:8adf:3eea]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::99d3:99cd:8adf:3eea%5]) with mapi id 15.20.4264.020; Fri, 25 Jun 2021
 13:19:54 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 FR3P281CA0043.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:4a::15) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4287.12 via Frontend Transport; Fri, 25 Jun 2021 13:19:54 +0000
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
X-Inumbo-ID: b1d4cd40-0721-436b-9954-39d18df7b62a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1624627198;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=9zqPlZFqr+nDgrvYU7y3XbcPEkd6sL5MQWdO6KTLw4I=;
	b=kQ+5S4fbktn5D9dIG3btbwKYDcv2rZKIUgJpL3tiOzPun4akv8W3PvVgaqW4MZG2a5arCu
	dP2bgjQw7d0+vvdDBoGALZZYbmMAUZnnaSxuoa9tXUEWW9DeTxhDWd0ZkDHFrfNBJ+QPaO
	ee9ocL5O+YXeFyyYxrI9E3ock8zwVJs=
X-MC-Unique: GVjm8HHUOPqADXMl-wDJhA-3
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gsyO5B1COetqzUbnhFXW+RCXm4MpeHr0u9CQWP++e1cEjWKWVvbSSaW0FffII3FAo6vMbZDS50JrnwcivJkt/5/u0IcGNNDHcXY6/RcYQ7uIT0jfKAFgWkfis1jgaHgMLxdtsGDu6vtFsdcxFeQ8WlwPelhY16G5UvBdVQ/LnJSFjT/4o/4QS/Lmcd2LeKSTknW8iUMe81itNQWJzY0as0shmfemhJgMR+iaog5Tgikf9uMxZ2IHgxb8soVqdumE+dTiOemdZHk12j190C1h+dkhX6iJ46rDkJkP4L7YupI0ZmJeNwsI8rr3IskRlI7wK0U5DPKLOCMidzNPVs7Oqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9zqPlZFqr+nDgrvYU7y3XbcPEkd6sL5MQWdO6KTLw4I=;
 b=kkHK65kpjSGbcm2k3oXHF9vpeh6xQWDguQ+yfQOPY8UG2OFejkHattHa7AmYZMU8C9dCFF/kMzrS9ZAEuMVMwKGo7exYS0B0ZM8QK6JCBbU3ejDN+XtBTWP1tnka5FMl1zRQTOg5v9sPlvkyR2r4g+K5M3KGLXm4ZjLFueOfFca9hny1KiQ4ibtI3tlWwM13Gpx/WCyfJvR29Tl9/kNRQcsmRRG1fqCODk5wyLjSF9C4MdcKXjyrA/ye2QEHT8T/nnXrhwJkEbIX0cBRWoVtXFZ+pLqcHiV2p+lsNi548RZvQgorVsLBMjv26RSLlFel7cUV6NtEpZ2I4fygQjT9ew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: xenproject.org; dkim=none (message not signed)
 header.d=none;xenproject.org; dmarc=none action=none header.from=suse.com;
Subject: [PATCH 05/12] libxenguest: complete loops in xc_map_domain_meminfo()
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Juergen Gross <jgross@suse.com>, George Dunlap <george.dunlap@citrix.com>,
 Ian Jackson <iwj@xenproject.org>
References: <912fa390-f9e9-198a-9aee-39fdb9a28fcc@suse.com>
Message-ID: <0d824d4b-0696-baca-a3ef-95ee641e4d08@suse.com>
Date: Fri, 25 Jun 2021 15:19:52 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <912fa390-f9e9-198a-9aee-39fdb9a28fcc@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [37.24.206.209]
X-ClientProxiedBy: FR3P281CA0043.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:4a::15) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8ad4c409-5c68-4ba6-bc58-08d937dbebf2
X-MS-TrafficTypeDiagnostic: VI1PR04MB5901:
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB590179424D1738105594287CB3069@VI1PR04MB5901.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4941;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	OmBp+abpP/PW4LCuRDxkI6PIjJXcEHZTVkJPfCAgqu7KViI8JpuPXHEsdFJILcUyPGH+J+mEdXJs0AEO4rW+cbtKzuwUfZ/1/IaTfkQrGCgitXGc7rM0h6vaOehYmHsc0EqjzlvTSSUVKjOhxYFfzFZfM+cv1PLPP4fAvm6IXc//FhoaISUrT+h8jfVtp+x8sE6lqtykRGOCe01vKN2sUPNTz5Lnhbpkt/Hc8cTQ0uVzU+PqHfQlWXE8Bw9WW6i6rI8wnh9dZE7iLNlpkYseYKIclIYctJWVkeWKUEt13KTn7rJRZhCKH1E20rWMwBRIXoTr7823HZVAWiMQ0jLTbgp+M6bYlPAmGjNTq2JirG7sAApR517xXwllPNqGihI/3rZl1jNZL6X/Q/xRlcCjsipI04sWbDOgmtQbc/eLVSkNzrkgE9tosIvzkzTXx5jamRwNuvmh6aIBTH9P764WLxCYmY4F2tL3Gvy3PBcXoq0zU4E8JhrQAaCC5vYu9+WikKXklgCW4Job3eoOy+oLB4rX2SxmKBzxu3YdvTYyVcrEHhFk0Ish/queYsrJomwtiRn2h/hl15l0kGUsrxyQ64bWA1NvaQqaamsL75gzEW9xihuvJ6ByEOp3LwU6kkxk1TtIMQkdTmzlz6SzsoR1bp/xLEC+XInAx/WwidFSH2t+FCkB0oqX4UgGWp+avENC
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(346002)(396003)(366004)(376002)(39860400002)(136003)(2906002)(66556008)(66476007)(2616005)(956004)(31696002)(86362001)(31686004)(66946007)(36756003)(186003)(16526019)(26005)(16576012)(316002)(8936002)(8676002)(6486002)(6916009)(5660300002)(478600001)(54906003)(38100700002)(4326008)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Z21mU09aT3RBcmo4aDU1ZHFuMGkyNnljYjlwbXFUWnoweXhGNmFhRWpaTWQx?=
 =?utf-8?B?cDBVaE4wZTE3TUJrdzBqbEhXTUNQRHA4TVdSNC96OVhtQXZXTFQwL3dLdkwx?=
 =?utf-8?B?M1BjTUQ0b3VFaXVPNGZOL25UWkhnSjFWZ05ZVDNtOFAzVzN6MEpiZ1VkdGNl?=
 =?utf-8?B?eW9tUEhyeEprYzdFcG0yRVJnaHAvUEJOVFlralNYRVJrellrdHFjMmZkTVBr?=
 =?utf-8?B?M3FHU2xiSmdEVVhvQUNXS1MwNDF4M2ppYWNYNkVvaUptdjFRNXk1VEhmRGFm?=
 =?utf-8?B?ZDFjeEJUQXI5RlBlb0FlRVRrajBscHRZQmUxQy9pb3llN0JBY1hSWm9IeS85?=
 =?utf-8?B?M1JhbUNUWlVZSnBENlZjdzhrS0l6UVo4bWp2TE1HcW82WE9USVpwZ2xxK1U4?=
 =?utf-8?B?UUxxTXc3Z0Iydk5Ic0xFcStveGlVbEYwMGlrTE1pQTNrWURVd1FHQmpuUE5n?=
 =?utf-8?B?V0FjSlFRMkMzV2VhbiswNUxZa2lOVTgvTG11eENhM05rR2NqbmtZT1NnV0E5?=
 =?utf-8?B?c0JUMi8xanZFalJmVFNhMXg3dkkxcGdPeXpuQU1nZ1VMakNPcjFTK2FLUjVt?=
 =?utf-8?B?NStUY2Nib0JBYys2MFFsMFQxTjhEZWdVYlkvUzNYYTJPYUhPM0NQbjJMNENK?=
 =?utf-8?B?M283TUt5OHZHMzR3NTdIWUVNL3lFd1lnbkNmZG5ZeXR3dEtzRUg4NDVDN0h3?=
 =?utf-8?B?clgzNkVGWnl2MkFVZEhHa0ZsalkzdnRYZFpvZld4ZFVxMXFEM05XQlc3cmhp?=
 =?utf-8?B?TEs5cjBlamZSTC9LUmZ0V1ZpOU1USHJ4Q1BBbkFVQWFvNnBzNGRSZWp0d2o2?=
 =?utf-8?B?V09tdHdtTnA1V2tVcFJwaEdocU9VaFUrYzRIbEhxWVJTQWhuMm9VRWx1Nmt5?=
 =?utf-8?B?R3AydUhWNGp6R3I4SlBYdlJKWk5QaDlPRWx0dWpTZUdxa2d1d2h1MHFHeGVV?=
 =?utf-8?B?enRvWXhsNW94NVJIREgycWQxSTlqUXlGMEx0QmVEbjQzQ1BaTkkwdm1rK3U3?=
 =?utf-8?B?S0ZBU1dlSUUrUjdjclRSTnY4YXVxT2MxSExMdTVUekdja2xyRDg1L241Rld4?=
 =?utf-8?B?WVNMSGx3c1VTeEU5MnBOUi9zTUEvTXJpSmxWQVJseXBEcG55TmxIcWJWRzVL?=
 =?utf-8?B?ZU5wZk94ZWpkcmVUWlh3d1Y2T3EzeCszUDgrZ2crVWRGM01MSzBCMTNZRnFS?=
 =?utf-8?B?dDZ2bnR6ZTZqTS8zcXVuSDV6MkZ4R0N4NElGS3JOR3M5aG1IQ051MXFGY0Va?=
 =?utf-8?B?TDRiMVNla2pHeHdRdVljZWRXT0xBOStseEc4Y2FZcDZVV0VzbCtrNWlpUHI2?=
 =?utf-8?B?cHM3TGxPUjlMTFQ3dGNBMXNEYWptaCszNXR4UnlXTmEvN29YelR4RmtMVVhv?=
 =?utf-8?B?UUg1RzNqNFl6UFhtM2grdWVocVJ0M0VpL21lNHJENzNpUTJzV2dIWXVERGta?=
 =?utf-8?B?aWFzK0c4VEVXWlYrS0VzbEMxSHdHRDRGWDB2Qk1FYmk4M0prVUxnU05YY1E1?=
 =?utf-8?B?QkhQNHdXdzRzRmRrVVNMTG0rS3NLc3hiSEUzUit0SEpPNVN1eXA5N29FMXdx?=
 =?utf-8?B?enhBa1pvK3BaL3JkaytIak03Qm5meHF1OGJmVGpyR0x0Wnc2OGY3S2x6TjR5?=
 =?utf-8?B?WVpvZDlRWWpLRUM0THpLdk9pNVArZDhBSU4zTjVlYUFsSjhrTmRLcnAvTExq?=
 =?utf-8?B?bitFT3lveU8rZFM2N01FZm9YMDFORjFFd3RRRGJlUUYzaEZBUVhuSjFvd0dx?=
 =?utf-8?Q?lqX/uIyARa+jtuL5+5DjG0eMtSoGX1SKrbR7gRX?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8ad4c409-5c68-4ba6-bc58-08d937dbebf2
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jun 2021 13:19:54.6634
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NMs4bjWCSPWU6l3uyeS2bMqBFpdwDJiKjouNJXO3uU7Id+hmoXvTvPKWovCvwLrhRfJ4kQ3QnkjR3E6QiBR9KA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB5901

minfo->p2m_size may have more than 31 significant bits. Change the
induction variable to unsigned long, and (largely for signed-ness
consistency) a helper variable to unsigned int.

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/tools/libs/guest/xg_domain.c
+++ b/tools/libs/guest/xg_domain.c
@@ -40,7 +40,7 @@ int xc_map_domain_meminfo(xc_interface *
     xc_dominfo_t info;
     shared_info_any_t *live_shinfo;
     xen_capabilities_info_t xen_caps = "";
-    int i;
+    unsigned long i;
 
     /* Only be initialized once */
     if ( minfo->pfn_type || minfo->p2m_table )
@@ -116,12 +116,12 @@ int xc_map_domain_meminfo(xc_interface *
     /* Retrieve PFN types in batches */
     for ( i = 0; i < minfo->p2m_size ; i+=1024 )
     {
-        int count = ((minfo->p2m_size - i ) > 1024 ) ?
-                        1024: (minfo->p2m_size - i);
+        unsigned int count = ((minfo->p2m_size - i) > 1024) ?
+                             1024 : (minfo->p2m_size - i);
 
         if ( xc_get_pfn_type_batch(xch, domid, count, minfo->pfn_type + i) )
         {
-            PERROR("Could not get %d-eth batch of PFN types", (i+1)/1024);
+            PERROR("Could not get batch %lu of PFN types", (i + 1) / 1024);
             goto failed;
         }
     }


