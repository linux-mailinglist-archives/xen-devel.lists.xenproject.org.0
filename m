Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BAF35339D6
	for <lists+xen-devel@lfdr.de>; Wed, 25 May 2022 11:21:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.337084.561583 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ntnCw-0003KZ-TF; Wed, 25 May 2022 09:21:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 337084.561583; Wed, 25 May 2022 09:21:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ntnCw-0003Ih-QG; Wed, 25 May 2022 09:21:34 +0000
Received: by outflank-mailman (input) for mailman id 337084;
 Wed, 25 May 2022 09:21:34 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=gDv/=WB=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1ntnCw-0003Ib-5U
 for xen-devel@lists.xenproject.org; Wed, 25 May 2022 09:21:34 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1144198c-dc0c-11ec-837f-e5687231ffcc;
 Wed, 25 May 2022 11:21:33 +0200 (CEST)
Received: from EUR02-AM5-obe.outbound.protection.outlook.com
 (mail-am5eur02lp2057.outbound.protection.outlook.com [104.47.4.57]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-11-myzmzlp_M4yGbMhB5r8Kew-2; Wed, 25 May 2022 11:21:30 +0200
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by PA4PR04MB9488.eurprd04.prod.outlook.com (2603:10a6:102:2af::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5273.22; Wed, 25 May
 2022 09:21:29 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::dfa:a64a:432f:e26b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::dfa:a64a:432f:e26b%7]) with mapi id 15.20.5293.013; Wed, 25 May 2022
 09:21:29 +0000
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
X-Inumbo-ID: 1144198c-dc0c-11ec-837f-e5687231ffcc
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1653470492;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=K6mMRAyFZPIyZS8j1LVxkRGwTbXHbG0OT1PgxAKolD0=;
	b=SvJqSrs8qgTx7uKnazREDYhgnW8vl8j5CkjsmtVCsum0AC4nrrYBLPrJaodUYl0KtYEK4x
	oKR1F4VlG477Xd4yt9a3c9zNm8Oep2yDAH5bYhincDRDP2rY06HISMjeEe6roTecfJ9+rW
	3+XLxm7J55IngR4MvgALf+2F82HFyMI=
X-MC-Unique: myzmzlp_M4yGbMhB5r8Kew-2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dN517Ms4UAdGLv9NYVQeDRnSpEPgzawRPstFtSeceg1WaQg2kBvkRIlro+b3yd/Zb7I1Tj7FZkayxPRvYdKKk+qSWM7o1Nr6tiWbVUWI3O/RwJFdWNVBgX3bfNYAAzCaCqGo6eC7v6hkqwWjEHipW2DSIGNfwLSUeX+mTjQ63dqT9uuBOG7r2D6eAFAUoP02bkMx1+fe2w3Bxf66blg6e6B3MHo2Th4kSTcIxEOyLQPLQZsY8ZZibkznMqS88vJBDyodzj4fOECHAuebq+4MbQDLUxoXFzJQHBQVWAFIGSzVm3g7cumB1JrnPGEQD/Uz64H0ARkSxqWB0gDsgu5yFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=K6mMRAyFZPIyZS8j1LVxkRGwTbXHbG0OT1PgxAKolD0=;
 b=NcUhEEjs+R1ifosnt+593mtlRt2Z6cCkw4F4hDy1s+U4jVq2u0VinQ2bSG+WjOig5Dh+rvmYcZDFIMGnlyri8ZNAt+9HDEHnyo9Bvb7EDvy+hfl8geKULNfqgEqayJvOoY5+Ifm9d0NVA0W+++NDscCtdtaIpEaULMZBnOKLAXAWWIQPL7Dy2BSbuLy+iKjs/jS3sLPm5cZbbNWOQaEbEYLVYUWBbJyBGVmlbqdq9ywpkNPtte0z4Xo6j/MxH00uqfYUWDWoTCSkhb7IRryo1JMQq0E2E/4Ipk63L++Z0Ec6BH0X+RVbMJNIB0Ly4WDSBcvVl3QEL0VmVXmi3IvYKA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <5835df1e-8f92-79ce-94c5-1b5df9c9ff65@suse.com>
Date: Wed, 25 May 2022 11:21:27 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH v2] SUPPORT.md: extend security support for x86 hosts to 12
 TiB of memory
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM6P194CA0028.EURP194.PROD.OUTLOOK.COM
 (2603:10a6:209:90::41) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 82bf2375-4bcb-430a-c9e9-08da3e2ff31f
X-MS-TrafficTypeDiagnostic: PA4PR04MB9488:EE_
X-Microsoft-Antispam-PRVS:
	<PA4PR04MB94882B8874753D8060BBF5D6B3D69@PA4PR04MB9488.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	GbRzK5eCyuQi0tqlxn2zHcXM55+6LO89Y7M08NUtY9noaFQxGAqzxEr8jbrFjio1mZw9WulkFP22k+2cbmfpbfEqOBDJ3OH86j9a08zQA1eotMNQRE4k3hCV+vD9dQEiba93ViO5LmTgC7e5yMAB57344YNPPOKXKG4rMzuRK3LlDKPJNj8uoQTg9LxZDe+cTEp4DujnmBkiGQw0/qnUyqVPmb0ffbkyYWwwA2aj6V6+aq5/ZhFUgjyTsv39+hj7vAUvOzlZlleeFMXZdK9jTasaR5DR14qrWrZCMIklM/TurzdA/t9Zn86oLlM02XV9YPPGJUu7pNAHUKvNwYR4VAPkOkqtfDB72upWy1bVbn2Bc2pH32YCJcSL6txi7WJlK/rlEvhQdjq797Sff8OeodCxA6yqPvFAX/psQclwUJ+Vd6OVAiKReVVAyUNT8W/XARp4VfHyDPj8+raUeZvkB4Xpa6aKZ65xxxXNwtSjp0SZ5p0h2/BosCeasJSEobg6u6RAwm3dsxjoMlofZW1e1xcY3+2+4LfqHdGzwNKY4Kac8XmeXDKcR0sUya0UPgaJ09Cu/2bqRaO8zi4y9tT3u870/pUYGspEGxX9a+3jyb9X/fD/mM1BgYE6zE32qAwDnJudnidlVuIN56UDsqwmQEYtW0NKxWEEu/se5SHEpcAFjvFFZ/+cYA2EZCzsXgwSkHPkj7XrLjnJM7u/dcYm1Ym7U/aacJzbj/HE2fNcwNtr5Nmx2t3Hr7GidW4i4MzHdy/QiqDTOkxd8WEHtcI2yYN7vih3PhzoYJvQ58CBl2nvpP3wpsRgBHIyith/Nh3s
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(2906002)(186003)(54906003)(6916009)(83380400001)(316002)(6506007)(4326008)(36756003)(15650500001)(66556008)(66946007)(66476007)(31686004)(26005)(8676002)(5660300002)(6512007)(38100700002)(966005)(8936002)(6486002)(86362001)(508600001)(31696002)(2616005)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?c3JZMmRWWEhJejIxK2VLcHYrQkRoMForRlJyWEVIQ2ZicmlNelpia3Qva0VU?=
 =?utf-8?B?cy9rd3Z4VGFQTHFnT3lUcXgzOUtGbnY5NWd4WWM3V0p2WTlFOUR0aHVCTmtk?=
 =?utf-8?B?WnBka0hDbGRHN2lhRUVGYng2SnNQSzhwa05uZlgwamdZUENPb0hPc2ZsbDRk?=
 =?utf-8?B?K3NOUzhoQ3lEc3BGNGFqWXNKQlJXWk5XajhHU0djQUV5aFRaYlhMNk5mZkhr?=
 =?utf-8?B?bkRIdUJRbUdhZVNJZUowb3h5OFRnQzk1VE1wRVR1REtsb0dNOEdtMUR4bjJo?=
 =?utf-8?B?QU56NngwRDBhSXliWTM3NWpsUnBHNEFSM2ZnZ0pXTVJHb3RIUndwZkk3SlMv?=
 =?utf-8?B?UGtLY0t5RFN2R2p5L3RTVm9zMGk1RkQ4cXk2VzNQUndPYnBLd3lRVWs4SWpt?=
 =?utf-8?B?U21LdlFLam9KckJYS3J2MTE5MkV5RnFqZGVJM1ZKZnNaVzBncjdmcllWc3JS?=
 =?utf-8?B?c21CdDVONVAwYTY0QkZEMnBKcG4xUUpod3FZSHhZUWluQUYzT0N5RmptSmtD?=
 =?utf-8?B?UHhzdkhLSTl6eEJPSGFKM252YU1URzhNZGpreU9TcUZ5d1kyOVZHUGtsOFpw?=
 =?utf-8?B?R2R6MDIvMkFPTzZOZVFCZnVWcTRXeU5YaVdiVmRDZGU0QXN2RTFVSWczQm44?=
 =?utf-8?B?VzBkNXIyQk5tMDJFQXVZeSt3dk5NSC90MUw1bnFGS1RtR2cvVjZnaUNHZElI?=
 =?utf-8?B?NzJja1QrMCtKSXRkQ3VFZ0k0eVczSkk0V085RUlFdko5YWNXaURHeUJmOGpo?=
 =?utf-8?B?ZG9Va2dRTDJoN1FMMTRqOWZkRjV3WlFQVTVQQ0JvcTROVFZFdGk1dEFNMDE4?=
 =?utf-8?B?L3doeXI2UVVVanpJaWRrUXMwREkxaW1lODBPbVlKM3FZU3BYbS8wWldQUFlP?=
 =?utf-8?B?c1NWWFlaT1ZWOHJSSFN1eDlwTklDSUtLM1oxTkEwZjBIbXA5L1pQT3kybGFX?=
 =?utf-8?B?eHFyQU45OUxtb2RaczBEcEJjSnJXQThEWjBSWnUyUzk5SlNmWWhVbVZEUDBx?=
 =?utf-8?B?bjNJZ1JIQkVSR1dCMTZwZkxRZWh0ZnVPLzZPRGp6dHlJWXZ2dnEyT0RJeTZw?=
 =?utf-8?B?VzlJMDVxdnhTdUl6YmNjcXBJeWJNang4WFNzMkt0aGplbXhjRm9VeWI2UmF1?=
 =?utf-8?B?eTIwSzlpYVRmWVdUZDJMOWk3c3JObGxEYXRRTVNpMjc3SHVKTHNUL0lMR0J2?=
 =?utf-8?B?TzRTblRZVERvOWcvRzlZSWUxSHRnRmhsdzlPSVRXOGU2Nmh4UlRkSG1Wancv?=
 =?utf-8?B?K0w4RmZHVmcybThSaTR4eCs2OEZ3QTRhTDl4VHNIaUt4cjdjQWVTNjFwS3Rt?=
 =?utf-8?B?SEo0V1ViMmsyaGh2UXRZanlLdTliOE1aUG5MRXFmN1REOFQwdGx6SmNuWVNC?=
 =?utf-8?B?YWsyOVhzMGNsNEcrZ2lSTjRWN25TL2MwYmh5SDZIbktxYVFVdlNZVjc4K3lC?=
 =?utf-8?B?ZDJ2VkR0NFNTeTVLekZyRElOVmRQWXAyTUovTm9FQVF3OGJEdHU3a3VBdFhm?=
 =?utf-8?B?OHoyVW95dFNSbWNHNFRBMmNJY2NlRmlaMElDRHJid3NoclRNakZDOWhvT3Y2?=
 =?utf-8?B?QVpvRlByQ0FoTUtGVFFxV0dxMXFXZUtKQU8wSHhOUlF0c01EZE96bUhDblU2?=
 =?utf-8?B?OENoZG9SdXRKMXJYamRwOThTK1RuTWhWdmd3cGUvSVh3ZXVJSFl5dE5pWEJJ?=
 =?utf-8?B?U1Rxc05Tb3RRSVZKUjNmaEIyL3FqZXVzcExXc1QyQUUrek5OL1BzS1BBU3Qr?=
 =?utf-8?B?SFFBbzQxVzRJWkpyTXFtK2J2TC83L1JuV3VySmNMK0dTOFpiSTlpK1M5MXVp?=
 =?utf-8?B?eHB5S3FxUmtodHBha2luUlBNU2xENW11MTBKYmFjRW45UUpwK3BwaGt5Mk4r?=
 =?utf-8?B?b2RwcCs1L3dZWEpuQXR4aXpKY2ZPNVJRV29jM2dxd1FZeHh0dGhCQ0E5UEV2?=
 =?utf-8?B?b3BtbUpVQnFPb1VuTmxCdlEvZk5mU05BRVo4dnhhdVowa2h0NGtPM1pPR0xL?=
 =?utf-8?B?c0NuMno1cDFLNFAzbVZPbjFMWXBoeG1HbTI1MlB0Szlmc0JLTFVBZmx4STZB?=
 =?utf-8?B?OEJaSDZEVGswTXNWMVNCVlB4bGJsV0E3RVcyTE9JYVB4WHQzWldxZkVmejh6?=
 =?utf-8?B?Mmx4bno1c2ozOGNEejZ4SkcwOEZKR0dVUDFlbzh3Mit3UGhBT2dwcm54Nkpa?=
 =?utf-8?B?bVNmeGlCV2p5eUFheXlOamFzQng1MkhVT3k2dGtjSy9GQTdOdkozRDMxa1lL?=
 =?utf-8?B?Qm5td1Jmek51Vi91T01SSHZCWWZxbnhPL1Jjek54anJzRUduKzcxMVc1b1hL?=
 =?utf-8?B?WXdVKzJaaHMydzZ1TkRWLzBFRitRdFR2OXZFVjMwMmN3a0JCRTZKQT09?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 82bf2375-4bcb-430a-c9e9-08da3e2ff31f
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 May 2022 09:21:29.1084
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: APBX3XOtg2RXoSs+aHRjbz7Vhjvn+w8MrKCPRW28BdQ46XqT+KldfdI8eJC+2R2S4pwvvhCc1wdMzq7V5HHwCQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB9488

c49ee0329ff3 ("SUPPORT.md: limit security support for hosts with very
much memory"), as a result of XSA-385, restricted security support to
8 TiB of host memory. While subsequently further restricted for Arm,
extend this to 12 TiB on x86, putting in place a guest restriction to
8 TiB (or yet less for Arm) in exchange.

A 12 TiB x86 host was certified successfully for use with Xen 4.14 as
per https://www.suse.com/nbswebapp/yesBulletin.jsp?bulletinNumber=150753.
This in particular included running as many guests (2 TiB each) as
possible in parallel, to actually prove that all the memory can be used
like this. It may be relevant to note that the Optane memory there was
used in memory-only mode, with DRAM acting as cache.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
v2: Rebase over new host limits for Arm. Refine new guest values for
    Arm.

--- a/SUPPORT.md
+++ b/SUPPORT.md
@@ -50,7 +50,7 @@ For the Cortex A57 r0p0 - r1p1, see Erra
 
 ### Physical Memory
 
-    Status, x86: Supported up to 8 TiB. Hosts with more memory are supported, but not security supported.
+    Status, x86: Supported up to 12 TiB. Hosts with more memory are supported, but not security supported.
     Status, Arm32: Supported up to 12 GiB
     Status, Arm64: Supported up to 2 TiB
 
@@ -121,6 +121,17 @@ ARM only has one guest type at the momen
 
     Status: Supported
 
+## Guest Limits
+
+### Memory
+
+    Status, x86: Supported up to 8 TiB
+    Status, Arm64: Supported up to 1 TiB
+    Status, Arm32: Supported up to 32 GiB
+
+Guests with more memory, but less than 16 TiB, are supported,
+but not security supported.
+
 ## Hypervisor file system
 
 ### Build info


