Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 288E04C6706
	for <lists+xen-devel@lfdr.de>; Mon, 28 Feb 2022 11:19:41 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.280345.478259 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nOd7f-0007Ma-Kz; Mon, 28 Feb 2022 10:19:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 280345.478259; Mon, 28 Feb 2022 10:19:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nOd7f-0007KO-GE; Mon, 28 Feb 2022 10:19:19 +0000
Received: by outflank-mailman (input) for mailman id 280345;
 Mon, 28 Feb 2022 10:19:18 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=A4HT=TL=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nOd7e-0007KG-2S
 for xen-devel@lists.xenproject.org; Mon, 28 Feb 2022 10:19:18 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e24c069f-987f-11ec-8eba-a37418f5ba1a;
 Mon, 28 Feb 2022 11:19:16 +0100 (CET)
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur01lp2059.outbound.protection.outlook.com [104.47.2.59]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-23-pTnm0Q0FN2-aBKV6C8k_Rg-2; Mon, 28 Feb 2022 11:19:15 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by AS8PR04MB8118.eurprd04.prod.outlook.com (2603:10a6:20b:3f2::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5017.26; Mon, 28 Feb
 2022 10:19:13 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::d479:b728:345c:bd65]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::d479:b728:345c:bd65%6]) with mapi id 15.20.5017.026; Mon, 28 Feb 2022
 10:19:13 +0000
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
X-Inumbo-ID: e24c069f-987f-11ec-8eba-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1646043556;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=AQkt4G9qJAq1JOtf4RGwi8Cs2gY6dB57H2P0CheBc8k=;
	b=RCenuOoyiwwQVO8D6Vt3vCsDFWDSZcPT1u8PUCfdFGx+UPnheKpAIQ4/MMskPHUyWlXdl9
	VqQ7IGrEdNBBQcEnDKaaDhnIVSY5bbINw959/2rTo6eKnJEQ51dV7SM0vOUJgoAYqtU5dC
	b3iJbEfBEAOZmoH2YLvwiE8lj2aTwvc=
X-MC-Unique: pTnm0Q0FN2-aBKV6C8k_Rg-2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BtVcu7HYXGn1KdwK7+FUH2+q27N/YeXYy2eQ0GS7MfbicVaUusywG3PtYNwFcF1oCEUvl1cp4seKXLQDsFgTjfXjD37V+nDOVOo6nwqBEQd0lXh0bPAUGUcyR5xyIxrbCCsN9Ph8zOT30jzbVOGt/12bRIR5K3UwlcYucyPVhmDJ/EFLyzscHQXrDEMCu4NdWhqEsQyLFiILk189Nzjep4VRPVh7ydqFbTMvHMx7gSz5MqGEJZILv/uq5kUUkQdE0VBKjBmu5iP0EQf3e7ed+8GjPnfPsqJNuJP7mVCJFpLq3vED3JF15cRkSh3tqwSYJR+5Lw/Ck1MaQGfX5PO+aw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AQkt4G9qJAq1JOtf4RGwi8Cs2gY6dB57H2P0CheBc8k=;
 b=Ar4JeWMgvmeijYbBsPHjgBkYK57TTbtJHfJXoXzWv+jkWdwyqcIGwh7objOse7Wg0g2wHW7GQ6VGc3/TLt5k2YN2CC/FYj87BtuJDN8+XrcYiVY3ZyFQz8ugM5T1A11nzDaJqANMVP2+sjlLLiyJrg6MD6lzkzz5c+IFYcFybHZYXROn8J7HYLCkv8UUw4A0MSJ02PrLdtK9pEH1ljxOB5cDKRBzwy7lDwGCRx9A7qbtA2rbJkgBtQJPeAz3To5yHpMJTQ5J2lhPk2xRpN7hqEVZ0lVMJ3GiXj0kelXYD4K/9Y02rPWe1qyBUnEmlywbABlcpE8h7SB68jKAFhBN0A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <3cc8bfca-be9e-cde8-c481-657ef33de7f2@suse.com>
Date: Mon, 28 Feb 2022 11:19:11 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
Content-Language: en-US
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH] docs: correct "gnttab=" documented default
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM5PR0602CA0001.eurprd06.prod.outlook.com
 (2603:10a6:203:a3::11) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c3ab7e48-751d-47a7-fdbc-08d9faa3c477
X-MS-TrafficTypeDiagnostic: AS8PR04MB8118:EE_
X-Microsoft-Antispam-PRVS:
	<AS8PR04MB8118CA743A26FE6C9A2E23BAB3019@AS8PR04MB8118.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	nNtfc2+5nLEYFCAZ88MKW3ZZYJ/nWo/BTN44XpHylLtOWMcPloD0xovSnP96+Gpi0r6hoed0mdkKZf8M161riQQcjeOXVanOa+hHgDENrWEm2AuCqc970/LjFbRH5TUgx9jTHb/y8fMn+548/Q4QR/0/oenE+cVHYSwM0ZgvhUZuc4qObu5AeR1U2u76LwUjFRnxybf4IWMRIicZgK+494mfB1CuO5lfKoFVZM97YaQY7/ECR0ayfrdLnnAdmGVXTNV4L5R/NllwQKRJuiJW1yQMVi50KPCfNxtxSyD6gcF2BcY6wEFaW/ZQvqLfAKMrRj9w2kt5tH2mBYwx82/QjiFwN5v+ii2WwDQGHcgiNCoqRKKQ3F/kVWSHjllsofVNJ3G20cCL9joPlRATHegYLRiz1LEmvhrrZwE8VVWitzjLa7kC+ZaOHFaD4LCsVEABJRZTioY84nXs9MndZu/zl0FGXmLsMqc7wHhL0vVQoCScYLMuM/tlsORh+QBgICyY+ySmI5c4yZeKjlJOYHsohnfQk6eXp+WD7wfCF9XE10QIzLjq9q+Pm4iDbBIaqBcawS7dZKvPbziG0EwyCmEddCNnQKJgSkTm6G+jRJjUCKm0gec7Vtq113rBjaGkKbNtKHA+S+6LLby8lyb4cOhy54mC89/l6umhJF7dSEOray6QIOFvaRFdox90Q/Khu4iLPbb2DaLjlKbdtRKNpVKe6to2wQU1XEF4Cn8y16tuZdFoFLCyB5ir4Xq/iyxW2At5
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(2616005)(6512007)(83380400001)(186003)(26005)(6506007)(36756003)(31686004)(508600001)(6486002)(6916009)(66946007)(316002)(8936002)(54906003)(4326008)(38100700002)(66556008)(66476007)(8676002)(86362001)(2906002)(5660300002)(31696002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?clZsSUZDUFBob1hZNkdINFB0a3lEWlhQdVlHRkcvSzNBMzloZkN0QU5ua1Fo?=
 =?utf-8?B?UmkyazNNSEFtWWNzdWthKzNOSXJRYzhaOW9WbGVIYmdoUk1sL2pQdVU2NGd0?=
 =?utf-8?B?enc1Y1ZBbHUxU1hWYVRmSk5jcWwvS0p0cTAwOWFHTnJiU1BLeGNMQk5YTERi?=
 =?utf-8?B?dEE3ZzR6eE9IU1hBN3JtVlVYMWM1T3V5Y284bEJTMnVwL2VGQlBsbkxkT1ZN?=
 =?utf-8?B?Z1REVlBiYWo5eUtmNDF1SGxYQXV6bWtJcVVPMmdGZkhlWGVBUUlKNUVGOHpC?=
 =?utf-8?B?RnhPbzNTelA1S3JSOU91K3lpcHpCbGZXTVpCaGZKKzVaMVhSUVZxTnZrMzlj?=
 =?utf-8?B?dEN2bkUyTC9uQjdxL2ROZjJOejRmQUlLaVdlYmV3Y3dEYzVNMmlQdURaWVhH?=
 =?utf-8?B?Z1dOcGt4N3YwRUFhcURsL0FXeVYyQ0VKWHJBVDZjcnRQZ0hQeHVLckpHRE81?=
 =?utf-8?B?Nk9HNGFyc1ozRU1KT21hR1I5MDl0UWFRREdRZU9BUkNaYzV2cEU4aFpqWm5T?=
 =?utf-8?B?L0FEWU9uMWhKZFpJbFEyTUdHVWRidDFPRStzaGt0K2JDd0k2eWlDVmh4NWdG?=
 =?utf-8?B?eXhuSGhZWkcwTWFHdGJJNHNpV0xBMzBMa00xUzNlRXNVdjZNTWxNcjRqdzVG?=
 =?utf-8?B?dHh4OFhEMUZleEtMVDd2T1R4UU5GTTEwTDU0cXZaMmdNRmszV1pzamM3VW0z?=
 =?utf-8?B?RFl1ZEx1c2JIN2M0RnBYMXh6aU9SS1ZYL1lvRHIzM0wzd2xQazlaR3BwWXZR?=
 =?utf-8?B?WjFadkNTZnUrR2tPSzR0anJ3cWJtbmNDWDdhSVhuZ1VsWTJCbXlXNWpLNWpD?=
 =?utf-8?B?WGIrTmhoczZldFZWcEMyOCtzZno1K1dyVmdjTGNBYUhiUnJKL3Bsc04zZlJH?=
 =?utf-8?B?NXQ0Q21QQjRKdXZGTmNtaXBMYXRtRUR4N1Y3T2pwZzdRTDc2NlRrRE5FTXlF?=
 =?utf-8?B?RFF6Nmd0MGFKNmxqWFp4SHc3QUx6bE9mRWozWUpEQUJKYWMxa3gyekxWUXE3?=
 =?utf-8?B?VFI3TnBYTlZnTVAxN29WMzJqOU41bGVuRVRKY2JkY0k0dGQ4cUVKVkg3M2JU?=
 =?utf-8?B?THFlNmp4cGc4dnR0MTZwR2lJNEFEMDROa1NtRTY3OHJzaUkwblNBSktjTFQ4?=
 =?utf-8?B?b1RhSkRFQm5LMGxncTl0MW5sTmpJMVFMZG9VanIrUGtSMUIyeDBqZjNuM0dC?=
 =?utf-8?B?VU9wejhRYXdFQUNtMzRUM0FOaURmRElQQmpGUlcranRITjMwYlU3bk5zTjBy?=
 =?utf-8?B?T0Rib0IxRzM3Vnc3MkJKd3FUMmt5TG4wYkxZMnBGT0dSTmZYS3ZMOEVKeFQ0?=
 =?utf-8?B?Tm9yaGk1RDhQL2tud3NFRDQxNEpKWnFrWTY5Y3orMXk5TDd4RVUrZDZEWTZ0?=
 =?utf-8?B?b29PeGZrb1hpUGhIYlZTYlM5OHhqN1pNKzhya3R6RFNUNTlPMTV3dWJsR3JT?=
 =?utf-8?B?dStaU1ZtYjVzQ2VLNndLclFRVCt0MUlWM2RrTmQxaUNJSGhqUnpQWlQ2WjF1?=
 =?utf-8?B?dTdBcVNGcGxNRVBHaEpvRmpsUmpmSTVURk9ZSGU1OXF6THY4T2VYL29pcUVa?=
 =?utf-8?B?SlBlSkNNbmZpMmdFWXBZOUx4MVVFd1pJN0tDWk1zcmlqbjZyMTNJV0RXVi9p?=
 =?utf-8?B?bG5ONVNhTGsvR3ptQloyMGt3anZGdW1SZWZWSGRsRncvQms5TzUydEFSNVp6?=
 =?utf-8?B?dFVNNzVHazBtdVJlQytCb2hJTjRiYkVnT2RLck0yUTVsZDc3K0NJTU5odjgz?=
 =?utf-8?B?STh6Qkg5RDdybllMdU1lOWVSSzRwaVVTWmUzYlJHSjV2OVdPSElhUzdLcDVz?=
 =?utf-8?B?dXV4Zm9lUDg1S3BQU1hvSkFEWEpsbDVHQnU3cWU2T3ZUVEgvV1VURFgwQjRU?=
 =?utf-8?B?cU1ZVWJibkZjeEZMRDRPQUVvbUhOakVkcFdWMmlCWVNMYXIzVXEzTXlOZEtr?=
 =?utf-8?B?VkM1UUVzTDFXVFB6RUF0YVFPQy9Ta0hEc2ZtOG9tcmN5K0N4Z1l1Vk9xeWEv?=
 =?utf-8?B?eTB0YW5WcHdWem56U0JUWFl0V29idm1tU1loS3E0UWFUejdrSTJnOFo0RjBY?=
 =?utf-8?B?aW44V282RU9mVXc3NUxjdWpLQnFkbjNDODV3RjVsVmNNNjI5cldBR0lHbzlO?=
 =?utf-8?B?Ny91UFlsRzl1cElDUC83Wmw5aVRIUU9NWW10M2l6NXNCQ0xEU1o2cVpmWkoz?=
 =?utf-8?Q?4qtmHZ66Xk08GPUCR+5DsjA=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c3ab7e48-751d-47a7-fdbc-08d9faa3c477
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Feb 2022 10:19:13.3540
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KRHKqhgCFbuqx+eABHn9CDWR/g1TKl+bYO0v0d/hhWx1D8DPJcCjNjdd6f5CqQUov4P2WWHgIQzEatUGghOL1A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8118

Defaults differ for Arm and x86, not the least because of v2 not even
being security supported on Arm.

Also drop a bogus sentence from gnttab_max_maptrack_frames, which was
presumably mistakenly cloned from gnttab_max_frames (albeit even there
what is being said is neither very precise nor very useful imo).

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/docs/misc/xen-command-line.pandoc
+++ b/docs/misc/xen-command-line.pandoc
@@ -1177,7 +1177,8 @@ Specify which console gdbstub should use
 ### gnttab
 > `= List of [ max-ver:<integer>, transitive=<bool>, transfer=<bool> ]`
 
-> Default: `gnttab=max-ver:2,transitive,transfer`
+> Default (Arm): `gnttab=max-ver:1`
+> Default (x86): `gnttab=max-ver:2,transitive,transfer`
 
 Control various aspects of the grant table behaviour available to guests.
 
@@ -1217,8 +1218,6 @@ Specify the maximum number of frames to
 maptrack array. This value is an upper boundary of the per-domain
 value settable via Xen tools.
 
-Dom0 is using this value for sizing its maptrack table.
-
 ### global-pages
     = <boolean>
 


