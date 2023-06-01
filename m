Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C7B39719B26
	for <lists+xen-devel@lfdr.de>; Thu,  1 Jun 2023 13:51:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.542425.846271 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q4gpK-0003b1-4e; Thu, 01 Jun 2023 11:50:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 542425.846271; Thu, 01 Jun 2023 11:50:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q4gpK-0003Yj-1B; Thu, 01 Jun 2023 11:50:46 +0000
Received: by outflank-mailman (input) for mailman id 542425;
 Thu, 01 Jun 2023 11:50:44 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=mSga=BV=citrix.com=prvs=509a852a5=roger.pau@srs-se1.protection.inumbo.net>)
 id 1q4gpI-0003Yd-5i
 for xen-devel@lists.xenproject.org; Thu, 01 Jun 2023 11:50:44 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 88b7fdd6-0072-11ee-b231-6b7b168915f2;
 Thu, 01 Jun 2023 13:50:42 +0200 (CEST)
Received: from mail-dm6nam10lp2108.outbound.protection.outlook.com (HELO
 NAM10-DM6-obe.outbound.protection.outlook.com) ([104.47.58.108])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 01 Jun 2023 07:50:40 -0400
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com (2603:10b6:a03:38d::21)
 by DS7PR03MB5478.namprd03.prod.outlook.com (2603:10b6:5:2c7::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6433.24; Thu, 1 Jun
 2023 11:50:39 +0000
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::192:6bdf:b105:64dd]) by SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::192:6bdf:b105:64dd%3]) with mapi id 15.20.6433.024; Thu, 1 Jun 2023
 11:50:39 +0000
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
X-Inumbo-ID: 88b7fdd6-0072-11ee-b231-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1685620242;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=kIIX5L576OT6ux2p/dIWfslNIOHQfxGlkj91okEyvIQ=;
  b=a3eycGApy3LsFENeBq4zdXKHjQRijQx96ZUsF3GKcvPe38ky3EzjWn4Y
   IRBgQI+fOm6SE6NYEbIC0PcmRcWNDkKw/E3maqWvWTMg7mIQDd2RY5A4i
   ot6K4b9pAorbsXWIT/GJU2EAhWHuCQeNc+nr6WI3qx3q2F9oKAzul/Jip
   E=;
X-IronPort-RemoteIP: 104.47.58.108
X-IronPort-MID: 110541988
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:46KQPKpnNHV6mmGMx+izx1jvV5BeBmI+ZBIvgKrLsJaIsI4StFCzt
 garIBmHbPqIZzT1KI9/bYvl8UhTvZ+GydIyTQtspSwwHitApJuZCYyVIHmrMnLJJKUvbq7FA
 +Y2MYCccZ9uHhcwgj/3b9ANeFEljfngqoLUUbKCYWYpA1c/Ek/NsDo788YhmIlknNOlNA2Ev
 NL2sqX3NUSsnjV5KQr40YrawP9UlKq04GtwUmAWP6gR5weAzyBNV/rzGInqR5fGatgMdgKFb
 76rIIGRpgvx4xorA9W5pbf3GmVirmn6ZFXmZtJ+AsBOszAazsAA+v9T2Mk0MC+7vw6hjdFpo
 OihgLTrIesf0g8gr8xGO/VQO3kW0aSrY9YrK1Dn2SCY5xWun3cBX5yCpaz5VGEV0r8fPI1Ay
 RAXAD8sagKGhNuO+fWmE7g8o/QBFcfCOoxK7xmMzRmBZRonabbqZvySoPN9gnI3jM0IGuvCb
 c0EbzYpdA7HfxBEJlYQDtQ5gfusgX78NTZfrTp5p4JuuzSVkFM3jeiraYKFEjCJbZw9ckKwv
 GXJ8n6/GhgHHNee1SCE4jSngeqncSbTAdtKSeHhp6466LGV7lEYTxpRegO4mOCgzWygQOMHE
 WYk3BN7+MDe82TuFLERRSaQonSJoxodUNp4CPAh5UeGza+8yxaUAC0IQyBMbPQitdQqXno62
 1mRhdTrCDdz9rqPRhq16bO8vT60fy8PIgc/iTQsSAIE55zvpd81hxeWFtJ7Svft3pvyBC36x
 C2MoG4mnbIPgMUX1qK9u1fanzaroZuPRQkwjunKYl+YAspCTNbNT+SVBZLzt56s8K7xooG9g
 UU5
IronPort-HdrOrdr: A9a23:RKGPNKyCB5U+F5OlceE9KrPxS+gkLtp133Aq2lEZdPULSKGlfp
 GV9sjziyWetN9wYh4dcB67Scy9qFfnhOZICO4qTMyftWjdyRKVxeRZgbcKrAeBJ8STzJ8/6U
 4kSdkFNDSSNykEsS+Z2njeLz9I+rDunsGVbKXlvhFQpGlRGt1dBmxCe2Km+yNNNWt77c1TLu
 vg2iMLnUvoRZxRBf7LdUUtbqzmnZnmhZjmaRkJC1oO7xSPtyqh7PrXAgWVxRAXVhJI2PMH/X
 LemwL0y62/u7XjoyWsmlP73tBzop/M29FDDMuDhow8LSjtsB+hYMBMSqCPpzc8pcCo8RIPnM
 PXqxktEsxv4zf6f32zozHqxw78uQxeoUPK+Bu9uz/OsMb5TDU1B45ogp9YSALQ7w4FsMtn2K
 xG8mqFv94PZCmw1xjV1pztbVVHh0C0qX0tnao6iGFea5IXbPt0oZYE9E1YPZ8cFGbR6ZwhEs
 NpEMbAjcwmOW+yXjT8hC1C0dasVnM8ElOvRVUDgNWc13xskHVw3yIjtbgit0ZF0Kh4Z4hP5u
 zCPKgtvqpJVNUqYaV0A/pEaderC0TWKCi8cV66EBDCLuUqKnjNo5n47PEe/+exYqEFy5M0hd
 DoTE5Yj2gvYEjjYPf+kqGjyiq9A1lVYA6diP23v/NCy/jBrfvQQGK+oWkV4oudS651OLyeZx
 6xUKgmdsMLY1GeXrqh5DeOK6W6GUNuLvH9hexLKm5mgvi7XbEC5darBsr7Ff7KLQsOfF/ZLz
 8qYAXTTf8wnHxDHEWIzCTsZw==
X-Talos-CUID: 9a23:1HG7NWMLmXMZj+5DVwhj5ksXI/gcNWCEnSf1E22BB09vR+jA
X-Talos-MUID: 9a23:jHBPgwunc3aIMg6TCM2nuTolM4BHu6eXEVlKs4sdipG+HxxWAmLI
X-IronPort-AV: E=Sophos;i="6.00,210,1681185600"; 
   d="scan'208";a="110541988"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AYulKnFJaXQ9AokybLzD+MUTal5zhcKOIz7xbSAzCdr+s28EiltV3MSiAPoyt9LK6k5w5nB3stbeyvt45KJsQdi3c2ZVrSVhWahX0ONP0xTkcTEUJIQ2rnc+L8QFKJDAV6QSJOkcfx5Sawg8WQJesCyqmmJO3QTuxmwJre8HPiL8UL2jULoT70Ks8pC+nIzOa/ompz9gEIAql5KlWFdBZ0KQnZIBm29oxIQU4ZmiYOwM90dOHCTCkw2b9So/ghKnlQJQ0wajyUTBTTgUoaqAjev4CpBrXM+dpgJ/uYll4HeaP2j6xp5TqQJQI40z9RM2tYZXaC2w8V8hWVSLE3jhug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xGzawwoC9UY5qFe214NgHVjE2gGttr1uXclxyjAc6rU=;
 b=KMXRQPqP6RTlnrvgnx/5iV7oeIbkKaJmbb9GC9Xh9K+AzF5zdDXemB832cYFY+2FD5hq4ABsQDjRnhQcASbu078RL2ZRnGZLfxDyQC4Z6JsxDZ4pnF4cBOK4Gv33QOPBMLoQIiwb5GZwPA4VGbt03zwXyptUotQVXSJQZoHS4iHh37eWfpzACLfUjNilU8mOSSUYrrGFyZ8fHTPEUj10cvaINy1UTObQaA+0Mldw0+LjzJ5RSB94zo9OR9DsoYW1MQ7xHERma7n0jYr21oZ6ubGu1sBtyEEQzIi7pU4Sd940s8ZcmvwtiVhl2dFYLKvis1vP3+dG+4gAIe0dfpJE2g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xGzawwoC9UY5qFe214NgHVjE2gGttr1uXclxyjAc6rU=;
 b=LJBXWakY8Snvo/2NWov4ELf6yvVuEZNPezQJSkqDp+vq/zDa7er1fiV2m1lotzZFGsuM2XEaW2jWbu3/ru9NF8FNAtMeKk6o/nUA47ueplBiPP9YG1A9InDLVOn8agKo9nZulEet7T6GFFJQM4qkpPYqcCIcZhJvJENk51+Tjts=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Thu, 1 Jun 2023 13:50:33 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH 1/2] x86/vPIT: re-order functions
Message-ID: <ZHiGCblQD42qfoY8@Air-de-Roger>
References: <fd113adc-6d66-5a4f-78ee-766c197ced93@suse.com>
 <b6cbf871-53a6-15ee-99d5-0ad2ab9c8b80@suse.com>
 <ZHhiLgI0oL7jvKNc@Air-de-Roger>
 <cf17abea-0ca2-5794-aa29-3d9c91355d4f@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <cf17abea-0ca2-5794-aa29-3d9c91355d4f@suse.com>
X-ClientProxiedBy: LO4P123CA0352.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:18d::15) To SJ0PR03MB6423.namprd03.prod.outlook.com
 (2603:10b6:a03:38d::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6423:EE_|DS7PR03MB5478:EE_
X-MS-Office365-Filtering-Correlation-Id: 8972d64a-337d-4841-c18a-08db62966b49
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	lHKbjYe4x2KHdRdotR6qcbpcCuubbCjmH8cfB+yBnT5kKqImATJvBjInL/5+Vp4RVLx3EUoHVA5p2pxvbEzV8IjhcQBx8+PMcXtugQM4GKP4tIuipKkpLYW0qBSJ+yBoBwYAwFN32yLlhKFzS0CMdCENGdaVpDu8017yYHRgBr3keVP/oEbHLxJNTqQxupuj4w3Kb4ijRWlmtlz/WU/1iVX1FQPAtekeSRgJof8cWNp6LoqFFfFjLc6ualr9scp1Yn88O8QQCixl2+0CZDeENhjBd66VPiI+pa/xbkusp4O+814ckVA+Sydxv0Yrwcl1YGVqNTnSJF1q0JW+ZMtjqW7a058XrxWkpDhk6p/iH8rISr6hKdw2BOl+yzDsgPpS89gWjZcXRGF3hbSztzmsFWOkJzEHL8P8ACE1S+3D+YwENMF9886F3t4X80uoGtxDczEdOPT2gerdp7zknitF5yzuzNzaJnmmzZpycXXm5GG9YYCoOaTuLy/zF8uVNN76S/uhFSC+kVJrXnahgHUyxQY9CimhnBxUl3kaEZg6SPQpZJZ9Gw8u2S1rm9EDtRVsagCI5t5l/FcLmctnPczbBfpaATyS+CP/pXhJw4wcKqg=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6423.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(7916004)(346002)(396003)(366004)(39860400002)(376002)(136003)(451199021)(83380400001)(33716001)(85182001)(4326008)(82960400001)(41300700001)(38100700002)(316002)(8676002)(6666004)(53546011)(66476007)(9686003)(6506007)(6512007)(26005)(66946007)(6486002)(6916009)(66556008)(86362001)(2906002)(8936002)(54906003)(5660300002)(478600001)(186003)(169823001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MVFaMS9oSkFOdjRiMFN0OGFjSVFvb2dHejc4Q0RKVTVZY05jTWpNNTNub0tR?=
 =?utf-8?B?ZWN3NkR6Z292UVJ1VE8yV0JtWGcvbDlrZVBMU1g2bUVTdWhCWWloRHo4SVZ4?=
 =?utf-8?B?Rks5R3hrWEcwblpqa2kxcjl2UUdOVFo4by9iOXNva2tCc0JkRjZWQmNNV1px?=
 =?utf-8?B?U0d1NEc1SDJqM2I5akQ2SjRpLy9rckpJYXpKdlpNZDlpR0pJcXB2WEVqQWRY?=
 =?utf-8?B?UHVoc3czMEhHUURwZ3dISnFMNjBFOGgyQXB1SGsrblg3cnpsYWxQeTh2M2lq?=
 =?utf-8?B?M01zS3ZQeEplOEFaZmxLKzlJU0lQQmRrZ3NhbHlodkdKZFBnclAzeklkV08w?=
 =?utf-8?B?VSt3Ty9OR2plejYwS1hKTUp2bHAycHV4cDYwbUsxU0FPZDBoMXdIYUp0V2ZT?=
 =?utf-8?B?WlUxem1mTSs0V3Y3UzJRbWEzNkpRNEQzbllMR0EzTTNBYmgzL0gvQmVjYzgw?=
 =?utf-8?B?RW00VEVEdSs1NkFLd2hLK0RnN1NMa3VKWDhkd1V0Ujhzd1hmVHhFVDByU2M1?=
 =?utf-8?B?REc4Yk4vbm5YK09wa0xsQjQwdFVZWm5xRUxlcGFna0dWam9ucDFESEdybWpa?=
 =?utf-8?B?WW0zZUQwemIweC9oTHVBT21wUFh4K1kxL01xV0xZeENqT0M3c1l3MkZqNkth?=
 =?utf-8?B?OUVuQmJKWTRwbVRNdGplelh2dnJDYlBHU2s1dnlYK0YyejhQU3dNaHBnOFow?=
 =?utf-8?B?SFliRFVBVW9DOWZYTkpIdnRGZzVXbDFvQXNmeFVBODYzWE5wd2t6Y3ZoSVFD?=
 =?utf-8?B?MGw0WVRsZTNTdE1CMWJFRzNBa1NjbDh1WHA4RGJuNGhqUVlNV1dSa2RvWjNo?=
 =?utf-8?B?VEN0NzhWNWZYNk40dzMzRUpjd0RMWk9jUWUwdmtPblFZb2dRQ1N5a0VlcHdS?=
 =?utf-8?B?REVGQzdDYjBsN3lobHZwU21qSjM1c1F4VWhBSmhndXY5K2RCN3lMY3ZNY0M1?=
 =?utf-8?B?TVlIdGlJQTVTL2dpOERxaVJnc1VYeDh6VFZBcG5HbUdiRUJtY2NBZUVzbWVz?=
 =?utf-8?B?Z1NVdnJsbS8vNWZXRzVmL0hFV3NaTVd1WlpiU25ZRTJIay9NMStLUTlQNUk3?=
 =?utf-8?B?VDVtY09PZlcwc0JtSnpraXdWZUpOVUtKQVlmNGJoelVEYlZ6ODM3a1ZNMVEy?=
 =?utf-8?B?TnV0dXdrRU1PQWl0L3psd0tHRXhmYlliK0lPWFFCWlNobHZwdzhyVmxwL01U?=
 =?utf-8?B?RC9JYWREcmZ4WmlsRWdHMk5sT1htQUFOdDBHZnpPTkdIZnovSDVwaVNFQysz?=
 =?utf-8?B?TCtnVm1OWE1raVl6VHRwVzlyeHN4WHd6V2NoRk9rdXRUN1NhSHh2VnRKcmFv?=
 =?utf-8?B?YmFNZVdZRXYza2FsZFgzazZHUm02RHB1Q1lxUWFidVNaSUJrTFFBV3dBczgx?=
 =?utf-8?B?UW0yZnJVcU5aY0tiK0NuQndIVnhBZzdxbDZvNGRpbEpuWExyYitocmFPU1dV?=
 =?utf-8?B?S2JhaGdDZ2ZlS0UzdTU5RXV4Z3RGZzliK05vQ0IxYzFtUXBFMWN3WVJLa3Jw?=
 =?utf-8?B?VUR5NG9kU2xkRlBlQksvMFVuTFhWTUFSLzVFb3g5aG9ZZzRpRThSQXozaFIv?=
 =?utf-8?B?dTd2MjduTG9BYnhNMzdPcW8xUGFkZGlobU00VEN3Rlp2dzVUN211YkF1cVVY?=
 =?utf-8?B?YXYvZkE1NTcwZHZxc21lR3haSE1TQ2V5N2pGbm9PQ2N6Vm5aeVE0QnlZcnpq?=
 =?utf-8?B?eEJBNkx4bTF4MUZqOG01UmxWbGhRdU9iWVFWaGpYUncya3FZTmtLVXRJa3F3?=
 =?utf-8?B?dUorcFR2U1BUVUpGWnpZYUNadTBTb240a2hobjc5cFltKzc3RlNvSzlOVXZW?=
 =?utf-8?B?UnZCRzRKbDdtYWZtRjc4NGRQdWF5bGVJbTJMdnVPNFUrQ2p0UlcveFFVaUJv?=
 =?utf-8?B?blFtODdxbjFwWXJLQVBtVGNIdnVlL1ZIS3pJUkxURWdVWFF4bStyR1hkSktv?=
 =?utf-8?B?em1aM0xpU0dtNGJBczVLY0tGdVROR3phV1U4MXByMmx0Y3NrdkgvOGErM2Jo?=
 =?utf-8?B?WWhtbVB6QkYwb3YvMGt1VkpUOTJwMnl3YTdqbGtidlRjUTc0Vk1RMmR5RVRE?=
 =?utf-8?B?RC9PQ2FBZVliQjhJQ2RJbHc0TkIwdXQwaVMyTnV5M1pwbVlUeStiYmFxMHov?=
 =?utf-8?B?bUFLa2JEZFVIMk1tcnJwdnNlS3BUVlRzTTNLczJpTUsyVGd1dzcwTlBxMWVY?=
 =?utf-8?B?TWc9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	9CwwbUxEcwWwumHmaN9pYGWzwbP34NTKAB1oqqbDxDwBfcX8LfcKFFSPxe34Rg0JfB2ENdSuFqU0XOEPhX3eWXtiYn6i0Ss0nrO1o9LWV8cSr+UWThoPYutDhQBXjxANFDHDK1BhM1gW4iAloqzI90AqlylWfUmNeYzOk2/5H4iX9KwMcvTNzd46bzyYeD5W9VH+B/yo85ids8+ZLQoGTHYatLR4Q2v71BMZCyT1fp/gO8feffP0ny/6MKRB67EpGNGf1YUmhnVOC/p5w5lMs9/FLz98neS/Npr0CdgF2BFYBx3VTkShohV4PVaKGW2H5avg/6MKKZ+F+uxwCLluqaFcvOyeV+f/vROfyATeoavA7ACGLWXYsEBBbQZAyAQ1B168Imn5Rsjid+uRzgls97hf+7Wrh/zcJqB32R/ecIiMd8pNM+eBJn3jiEftLRTNbvYQt8t2xvVU6huNZku989E4yZQX2BGhg7paMEefb2TzmKLYfQp4oIcvgbZDlgeBdQdqQr3XZd2Huiyf+711rbBtI+ulK018rcrZeII1WTg9KQLTvccowd1VHNRMDB5sibPPL+vwhTW1uK0a98babUUVNYpb56tFQOOWHalyVKMTP6CpgGW6wCs9TzIrHb9YGr9uuKFilAiCqJobZD4qVUDMSVmaGwV+E+DtTf3RhjD+Gj8r6tfAsKZjl56Mpx8vONObBjaZw5tgsMAz5CYrnZMBbDf+R14+aLPbZKcRSzz+mW9VUpGNADsw+OpXV9Rxc7K/mZFgBI6CJfxrFdBtV0j9bPfG7lN0Q4J8bdJ3jQxqn0odkLT0FC1w0HfEjVSo
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8972d64a-337d-4841-c18a-08db62966b49
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6423.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jun 2023 11:50:39.0241
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /flM1lcXoiL1j6nS9cYEUUf9EJdPjNUow+qrrcyNSAzDDXHQKZraxUR0armQ7BRP6/hRKS4KFD1f2ki00devQQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR03MB5478

On Thu, Jun 01, 2023 at 11:56:12AM +0200, Jan Beulich wrote:
> On 01.06.2023 11:17, Roger Pau Monné wrote:
> > On Tue, May 30, 2023 at 05:30:02PM +0200, Jan Beulich wrote:
> >> To avoid the need for a forward declaration of pit_load_count() in a
> >> subsequent change, move it earlier in the file (along with its helper
> >> callback).
> >>
> >> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> > 
> > Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>
> 
> Thanks.
> 
> > Just a couple of nits, which you might also noticed but decided to not
> > fix given this is just code movement.
> 
> Indeed, I meant this to be pure code movement. Nevertheless I'd be happy
> to take care of style issues, if that's deemed okay in a "pure code
> movement" patch. However, ...

It's just small style issues, so it would be OK for me.

> >> --- a/xen/arch/x86/emul-i8254.c
> >> +++ b/xen/arch/x86/emul-i8254.c
> >> @@ -87,6 +87,57 @@ static int pit_get_count(PITState *pit,
> >>      return counter;
> >>  }
> >>  
> >> +static void cf_check pit_time_fired(struct vcpu *v, void *priv)
> > 
> > Seems like v could be constified?
> 
> ... the function being used as a callback, I doubt adding const would
> be possible. Otoh ...

Oh, I see.

> >> +{
> >> +    uint64_t *count_load_time = priv;
> 
> ... there's a blank line missing here, if I was to go for style
> adjustments.

Sure.

Thanks, Roger.

