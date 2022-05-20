Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 739B952EE2A
	for <lists+xen-devel@lfdr.de>; Fri, 20 May 2022 16:29:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.334328.558333 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ns3cT-0002mR-3k; Fri, 20 May 2022 14:28:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 334328.558333; Fri, 20 May 2022 14:28:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ns3cT-0002kQ-0n; Fri, 20 May 2022 14:28:45 +0000
Received: by outflank-mailman (input) for mailman id 334328;
 Fri, 20 May 2022 14:28:42 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=cXjj=V4=citrix.com=prvs=1320720ca=roger.pau@srs-se1.protection.inumbo.net>)
 id 1ns3cQ-0002kK-FV
 for xen-devel@lists.xenproject.org; Fri, 20 May 2022 14:28:42 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 23686f80-d849-11ec-bd2c-47488cf2e6aa;
 Fri, 20 May 2022 16:28:40 +0200 (CEST)
Received: from mail-bn8nam11lp2172.outbound.protection.outlook.com (HELO
 NAM11-BN8-obe.outbound.protection.outlook.com) ([104.47.58.172])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 20 May 2022 10:28:23 -0400
Received: from DS7PR03MB5608.namprd03.prod.outlook.com (2603:10b6:5:2c9::18)
 by MWHPR03MB3103.namprd03.prod.outlook.com (2603:10b6:301:42::25) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5273.17; Fri, 20 May
 2022 14:28:18 +0000
Received: from DS7PR03MB5608.namprd03.prod.outlook.com
 ([fe80::5df3:95ce:4dfd:134e]) by DS7PR03MB5608.namprd03.prod.outlook.com
 ([fe80::5df3:95ce:4dfd:134e%5]) with mapi id 15.20.5273.018; Fri, 20 May 2022
 14:28:18 +0000
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
X-Inumbo-ID: 23686f80-d849-11ec-bd2c-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1653056920;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=2w4RLP7PAuMHYnk5gbClU9CSyGtXvMeJSmZw0B74V3E=;
  b=YpM02l4AiyeinJVMHC8qIDSLAMDXy8LcXp8w06kc6WPtx506SVTxLfHB
   u8zPEydCcLPwQRkeKTmpwyXV9djOtowcQIb7eLxF/SZbvSRlWzC2ATGYH
   B9POV9/rDq3huZ0VNhuR6yOOJLhvMrUh4TLm9qgKE9fLZtXpG+vMpnBhY
   k=;
X-IronPort-RemoteIP: 104.47.58.172
X-IronPort-MID: 72195138
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:0mLJdK/ZDavLoybUdBrWDrUDhX+TJUtcMsCJ2f8bNWPcYEJGY0x3y
 2YZD2+COPbfZGXzLdojYYq/8RlV7ZGHm9JmTgRl+SA8E34SpcT7XtnIdU2Y0wF+jyHgoOCLy
 +1EN7Es+ehtFie0Si+Fa+Sn9T8mvU2xbuKU5NTsY0idfic5DnZ44f5fs7Rh2NQw3ILhW1rlV
 e7a+KUzBnf0g1aYDUpMg06zgEsHUCPa4W5wUvQWPJinjXeG/5UnJMt3yZKZdhMUdrJ8DO+iL
 9sv+Znilo/vE7XBPfv++lrzWhVirrc/pmFigFIOM0SpqkAqSiDfTs/XnRfTAKtao2zhojx/9
 DlCncWtVxdzL4fQo9giXBIIPCFSPJdE4ZaSdBBTseTLp6HHW13F5qw3SWsQbcgf8OsxBnxS/
 /sFLjxLdgqEm++93LO8TK9rm9gnK87oeogYvxmMzxmAVapgHc+FHvWMvIACtNszrpkm8fL2f
 c0WZCApdB3dSxZOJk0WGNQ1m+LAanzXLGcB+Q/M/vpfD2770zR7jJ6zN//vQp+kHf8Erh6zi
 EjL1jGsav0dHJnFodafyVqujOLSmSLwWKoJCaa1sPVthTW71mEVTREbS1a/if24kVKlHcJSL
 VQO/SgjprR081akJvHlVgC8iG6JuFgbQdU4O/I+wBGAzOzT+QnxO4QfZjtIadhjvslmQzUvj
 waNh4mwWmYpt6CJQ3WA8LvStSm1JSUeMW4FY2kDUBcB5N7g5oo0i3ojU+peLUJ8tfWtcRmY/
 txAhHFu71nPpabnD5mGwG0=
IronPort-HdrOrdr: A9a23:KMLlNqNlmYTwDsBcT1P155DYdb4zR+YMi2TDiHoddfUFSKalfp
 6V98jztSWatN/eYgBEpTmlAtj5fZq6z+8P3WBxB8baYOCCggeVxe5ZjbcKrweQeBEWs9Qtr5
 uIEJIOd+EYb2IK6voSiTPQe7hA/DDEytHPuQ639QYQcegAUdAF0+4WMHf4LqUgLzM2eKbRWa
 Dsr/Zvln6FQzA6f867Dn4KU6zqoMDKrovvZVojCwQ84AeDoDu04PqieiLolSs2Yndq+/MP4G
 LFmwv26uGKtOy68AbV0yv2445NkNXs59NfDIini9QTKB/rlgG0Db4RE4GqjXQQmqWC+VwqmN
 7Dr1MJONly0WrYeiWPrR7ky2DboUITwk6n7WXdrWrooMT/Sj5/IdFGn5hlfhzQ7FdllM1g0Y
 pQtljp+KZ/PFflpmDQ9tLIXxZlmg6funw5i9MeiHRZTM83dKJRl4oC50lYea1wUB4S0LpXUd
 WGMfuspMq/KTihHjPkVyhUsZGRt00Ib1m7qhNogL3W79BU9EoJunfwivZv20voz6hNOqWs19
 60TJiAq4s+PvP+TZgNc9vpEvHHfFAkf3r3QRGvCGWiMp07EFTwjLOyyIkJxYiRCe41Jd0J6d
 78bG8=
X-IronPort-AV: E=Sophos;i="5.91,239,1647316800"; 
   d="scan'208";a="72195138"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NeaoHCV8SrcOxLCs9qgG/Pxw4+e51B1VYbwsfU3KVhFOaIjOzXD8gwMXCe6HkmeQBxMPubfSKMdzJjTXhpOEF122y2AMQq6Sgxpq2sLZ94veIiXSF1YMbLRlZ24D+io7gO4i/I1gR4zvx6+IPXKcsN7Frw0l962q1X9rTIQtiHap93/Oz+8zs6GHqrdtpCxP4CE0WDvNTLgXSzl70LYc94ZUNH0qGYmBtaZC8pxR3U7GWq6ig5S9KO5iRCS0D/hTSE/1h9bBl4I9FQdFeWXFcucgWOXtGGOacKpWceRD2+1Qfg4oRI8zjD/mNN1BSKBfYvXWJ0cHmUdeTOncRFDivQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kt+KUfPjvmjzDzkwzedVyLrFAfbLyn16qUQ4UXrAOg0=;
 b=oW3fJA+BaAgF5LuBqr+fCxh/E+WMnqXBkhbUpID8DYes3czzbmU94lZfv7Ssf8gSNuik/Yqr+2QyqoUo/x7QO6a/y5rtGqDZXY1FVX1CiPzC5QY8V3GuHmrcGW/B/mIT5CqAFPsR/6RugZCMCepl+sG+A3XwUU569P+tqHxdVGNzF6vMtda7EPJPrC0cdGLnOuCKtr2udP1iyaOeSRWDnVQRpP0P4e61rpdpIuOjhlOiF10FD5N0PX5rh5g3j0s9ep73OBU9UIvGp+RCgtE3ETX0Y7mL+x4izxRYWfB1mlCgZ7uyZTktVWHeDpGsMXXNuvGfkh0Ejj9IEa+PW83p1A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kt+KUfPjvmjzDzkwzedVyLrFAfbLyn16qUQ4UXrAOg0=;
 b=JLB0AjRbI231oLSpwJu2osGgktu4Y7qKzzH13RiIc9Ji/5Is36Sm6iIJhpoOG7sBvJN+ZkI7QrJpohTT5yo0UUIQdpw2v8a2vrOabVTpA6GuYluGSHfZsWMyK8gPC+ou+24gVvBYJaAtuWlB3k/++dM/wVnjwtCGZjaioaRBoUw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Fri, 20 May 2022 16:28:14 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Paul Durrant <paul@xen.org>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH v4 13/21] IOMMU/x86: prefill newly allocate page tables
Message-ID: <Yoelfhe5wLGy2cfd@Air-de-Roger>
References: <b92e294e-7277-d977-bb96-7c28d60000c6@suse.com>
 <9d073a05-0c7d-4989-7a38-93cd5b01d071@suse.com>
 <YnUDeR5feSsmbCVF@Air-de-Roger>
 <6666ab70-b68a-eac5-a632-893f950a984a@suse.com>
 <Yodx21zhWtZCV2dY@Air-de-Roger>
 <600c894e-a35b-e27c-898e-8f1cf3ea0ee4@suse.com>
 <7163fdba-c128-1226-e1cc-d210c5db06ad@suse.com>
 <YoeH+9eMU0ui68Mn@Air-de-Roger>
 <ae722d7b-a958-1927-abfd-43c04bc6b369@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ae722d7b-a958-1927-abfd-43c04bc6b369@suse.com>
X-ClientProxiedBy: LNXP265CA0013.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:5e::25) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: aa762711-d4e0-4292-79df-08da3a6cfbf4
X-MS-TrafficTypeDiagnostic: MWHPR03MB3103:EE_
X-Microsoft-Antispam-PRVS:
	<MWHPR03MB310397E839E68404FBD621EA8FD39@MWHPR03MB3103.namprd03.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	GURCitgcIer31dK1XTgqqHRx8T++aRfD/4MyFhE1gSrj/Tj1FdyK1bv0gN4he30KZvooL+V9ZU5mvfrcZow1/6cDmaD64mwk7WuZH6oNUo7PQVCnXSWpv04513xeZ4bB1B/1FFhi++arm895n9+eTrIEmNlYoYQq781yFH+vMg3A2JANvXb4TaqHHyAUb46nklbySXOW1dHBNeF5ZOeIsbAhQ1qOTZgijMcNW5kP/8Ha3rq2iO4dvSLVmGN8EmJx0WxJg7XM9OZvpsulDHMUr0VR5IsSHJ66quDORHap8wT4PrVFS0mG6NF5dsOekb/WlyCNSPaZl5iJdv+r5NFbqVgXGGqIiAd9BGropAI3puzMNiV6Cn1JVGzJ8OTZfa5S0TGb08TupdNdxELabyOxHBT8pNt8YHMyMP4t3SnLjDGl0DgXSpEXvfhFIFzWfODm01buUzWmWxfeJThHRbRVcJ6wwOn14WQ7stCCxxi2nGyQAsAzB11eWJX1YGMw/ffTUq/5NobqYV/vy70R+7apRpl2Zwd+7GltwEjIdOW/7TmdJvYPDdkXtOtMnDEMIg79Qp5eylaxpOXYe/C6ctLeCdxa3zI+1c/M6OTy3NWIEX27cUyDrPe5l0N0n3YsI6Lo1NsglZY4mOG0KYTkkIGnwQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(7916004)(366004)(66946007)(5660300002)(53546011)(38100700002)(8676002)(8936002)(66476007)(6506007)(9686003)(2906002)(26005)(66556008)(83380400001)(4326008)(85182001)(6512007)(186003)(82960400001)(6486002)(6666004)(508600001)(86362001)(33716001)(316002)(54906003)(6916009);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RFUvcy94RDY5Ty9uZFVsd09JQkRXem8vdHZCNnBBaEJkOGFvOTFKQnByWmdX?=
 =?utf-8?B?a3pLRnBUWnFySHh5OTBvSjBjc2ZOWXpTeHVoUGZRa2FKTDhaWWdpYkltY29o?=
 =?utf-8?B?c2cwYUJiOG50bVJGVVJOcVRLM29HNFRnVEpaTnNVVWVUSWJpVHFlb3dtaWE3?=
 =?utf-8?B?ZTUwUHhzS3VlTlpTUXlVWHlwVkxuQkZNNGp3UzV5OGxEbXUvdTdINTgyRk5V?=
 =?utf-8?B?N3BxL2Z4c0ppaXAvWlJoeXFvVGpkam1acG9HSFFuQ2hob0orTEViMnJTR0Nx?=
 =?utf-8?B?SDYyNEE1aTN3Y0I2c09LMXh4c3dVeHZFVDlLMFQ3UkN4QlhjeGZocFBNWVV1?=
 =?utf-8?B?V3pTZmdKdGl3OEpEUlVaWEc4RUlYdHpLaEszM1pocWlHeHVNaDVNMGpmNlRM?=
 =?utf-8?B?NnpCeXQ1dWhVcm81OGEvdmNNaEJDN1FMdW9KK0VMbkhCYjlSUXh3VFZWRUN3?=
 =?utf-8?B?K1hZeXRTNzF3VjJLbG1iRzNnaE14eURScHp2bmgydXNHZmtPTGw5ZG9jRTFs?=
 =?utf-8?B?b3dCRkxacVFxRVJEd2tpb2d1OVlrSkc0K0Z6ZDdCeThmRjdYQ0QvRXo1dXNJ?=
 =?utf-8?B?eDdXMnFkVGtseWNmNFBBdVVyK3Q5WFBEdnRFS2NPdGlwclozUDJ1QmJQeHlp?=
 =?utf-8?B?eFdGN0k1dFV1ZlI5Sms4cVBMTWJHVjVFYUIxUWwyNmkzTjJ5TkdjUXZ2SGlP?=
 =?utf-8?B?bUJqUlJYQWJtSEl3dFA2RlFXOFNEeDlhaUxweHFZcitBbXFOclFNbDNyMVhE?=
 =?utf-8?B?bUhtRWY1anRiLzlaSlJGMXYzMEU3NUFyaVNSQ3ovQWFRblFBS0ppV0dLcVFQ?=
 =?utf-8?B?dlkyM0JNVllqM29VZllubXp3ODhrdnpwM1o2MDh6R2Q2TG44ZWNVQ0xWTmta?=
 =?utf-8?B?RU1TSlFVMTcwMlVFWFU5d3FvN3F1Rm9NbU9WaXpPUG03QUJRbS9JUTY1VTlU?=
 =?utf-8?B?Y2lTSXBKMTZpY0MzUnB1ZlMzNkU4TzRUd21JRmU3bGE3NEkvMlpXMVpqVTJt?=
 =?utf-8?B?UUt6YlMxSXN4V3hWWlNyRitvakMrQjFHUWNqUlFjbGtac2dieGVralAralNX?=
 =?utf-8?B?bVc5SEhueWZTbVVteDV6V3haTkVXMndqNWdzdDRreWpIbFlzdTM2VjZjSTVW?=
 =?utf-8?B?NFZFenIvSXNReWxhMk5NTnMzY1JnakE2WlZRLzFXRVQxbjFFT2NDQ1FMZ0Iz?=
 =?utf-8?B?Wm1HOE12cDJkSFdoSkFXRTFQdlVSTHFmV3VvRVh3UThraFRRWjl4bDRzMmFK?=
 =?utf-8?B?TDZFYmpyNmpwMVNrYjgydG9zMkFtKy9Oa0dRM0YxUTllMGRMUWhoYjl3Znp2?=
 =?utf-8?B?WnhWYy9hTmRCMXVhYytTUnhPZnNBTjJpSkQxUW9vWHRKMjNWdTFIZnJjMkRS?=
 =?utf-8?B?SHY1ZWFKNjI1MDJOMnFTeGo4THAzRlRpUmsxWWY3Q29RRmI3eUFmQkhzQjRG?=
 =?utf-8?B?QnQwNm15QXpLR1BHNFpRaWlTYVFVTlBuWDJlSE4vWW43RHFmRDl6b1Bjb2hm?=
 =?utf-8?B?eFA5aFNKbkFFVTJLYzM4OFlMZTRwNXkzTGN2VVNmMUVFTXFBODFLbkJ4TXdZ?=
 =?utf-8?B?czZ0Q2d0NkVjWUlIdUxsbTVUWXhyWDRhempFWHN4dXY1WlJPcGw1cENMb0Rp?=
 =?utf-8?B?dkl4cU5TMHJGdE1GT0JJY1pmbnFzZU11QmVHSG1adG5KTVZtcGtZcTlhSFIz?=
 =?utf-8?B?Rjl1UnNwRkZQak5NeW1URmFldVVtMS9zc29TYTR0ZCswWXNMckl5M2xrRHc0?=
 =?utf-8?B?dmZ5bWs0TEIrL1daSnpiVnVVSzlwUExsUG1FY003c0pJQ1gzdkIyb1BLcVhN?=
 =?utf-8?B?Qm13TjJZb2orUlBCMmV2Mk80RkNkUCsrMEoxY3VJS09QOXN3Vmt6WFJaMHVw?=
 =?utf-8?B?VUpPZko2clBaeFF1MFFOYkpIQ0lwbElDQ0JlVXdVb2ZIa0VzcVZkRnAxNXg2?=
 =?utf-8?B?NUxNRTdGbjNOYmphYWlibXZZYmZoRzZHdFREYTRET2Z1Sk90eVpxa00yNVY0?=
 =?utf-8?B?c0NRSVNaRU8vaGt1djlDVWJqZ09zeG5NbXRZL2crM0g2OXJKUGJOcEdqMWZD?=
 =?utf-8?B?Z1lOVndvTVhYVDluUTk0RmlRM2xZKzFVUWNZT05zcmxPbDNRYzl4RG13c01v?=
 =?utf-8?B?aVh5Y25lemNQMit3VElzVkZHNjRoVXZIeFUrRGV6RHhRcXhxZ044eVhLQzN4?=
 =?utf-8?B?eitOQjYxVzZ6RWpxa1AzbGRPcHViQUVEVzJHOWJYYlFBZHNGZEZxQlZXRVB2?=
 =?utf-8?B?ZHp6TlljT3NiczhaSWJpYnh1VmFQVXE4OTI2ZXlad3pvR1Y3NVZYOVRzaGs5?=
 =?utf-8?B?QWxvSFBDQ2RzV21hZXE2MWNyNnNVczQ4MWdFUmE3Y1A3Z1FSZE9oUEYveVlx?=
 =?utf-8?Q?fMdf7ilzZUnWP/PU=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: aa762711-d4e0-4292-79df-08da3a6cfbf4
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 May 2022 14:28:18.5890
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: C8MuEhLTQCjcLLcrBovyx6RF75rB8EAQRNfzz94PMX+LbstfHJHuMPGXjXXuJTU0gkSmBYv1xJefu3vhSY+mjA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR03MB3103

On Fri, May 20, 2022 at 02:36:02PM +0200, Jan Beulich wrote:
> On 20.05.2022 14:22, Roger Pau Monné wrote:
> > On Fri, May 20, 2022 at 01:13:28PM +0200, Jan Beulich wrote:
> >> On 20.05.2022 13:11, Jan Beulich wrote:
> >>> On 20.05.2022 12:47, Roger Pau Monné wrote:
> >>>> On Thu, May 19, 2022 at 02:12:04PM +0200, Jan Beulich wrote:
> >>>>> On 06.05.2022 13:16, Roger Pau Monné wrote:
> >>>>>> On Mon, Apr 25, 2022 at 10:40:55AM +0200, Jan Beulich wrote:
> >>>>>>> --- a/xen/drivers/passthrough/amd/iommu_map.c
> >>>>>>> +++ b/xen/drivers/passthrough/amd/iommu_map.c
> >>>>>>> @@ -115,7 +115,19 @@ static void set_iommu_ptes_present(unsig
> >>>>>>>  
> >>>>>>>      while ( nr_ptes-- )
> >>>>>>>      {
> >>>>>>> -        set_iommu_pde_present(pde, next_mfn, 0, iw, ir);
> >>>>>>> +        ASSERT(!pde->next_level);
> >>>>>>> +        ASSERT(!pde->u);
> >>>>>>> +
> >>>>>>> +        if ( pde > table )
> >>>>>>> +            ASSERT(pde->ign0 == find_first_set_bit(pde - table));
> >>>>>>> +        else
> >>>>>>> +            ASSERT(pde->ign0 == PAGE_SHIFT - 3);
> >>>>>>
> >>>>>> I think PAGETABLE_ORDER would be clearer here.
> >>>>>
> >>>>> I disagree - PAGETABLE_ORDER is a CPU-side concept. It's not used anywhere
> >>>>> in IOMMU code afaics.
> >>>>
> >>>> Isn't PAGE_SHIFT also a CPU-side concept in the same way?  I'm not
> >>>> sure what's the rule for declaring that PAGE_SHIFT is fine to use in
> >>>> IOMMU code  but not PAGETABLE_ORDER.
> >>>
> >>> Hmm, yes and no. But for consistency with other IOMMU code I may want
> >>> to switch to PAGE_SHIFT_4K.
> >>
> >> Except that, with the plan to re-use pt_update_contig_markers() for CPU-
> >> side re-coalescing, there I'd prefer to stick to PAGE_SHIFT.
> > 
> > Then can PAGETABLE_ORDER be used instead of PAGE_SHIFT - 3?
> 
> pt_update_contig_markers() isn't IOMMU code; since I've said I'd switch
> to PAGE_SHIFT_4K in IOMMU code I'm having a hard time seeing how I could
> at the same time start using PAGETABLE_ORDER there.

I've got confused by the double reply and read it as if you where
going to stick to using PAGE_SHIFT everywhere as proposed originally.

> What I maybe could do is use PTE_PER_TABLE_SHIFT in AMD code and
> LEVEL_STRIDE in VT-d one. Yet I'm not sure that would be fully correct/
> consistent, ...
> 
> > IMO it makes the code quite easier to understand.
> 
> ... or in fact helping readability.

Looking at pt_update_contig_markers() we hardcode CONTIG_LEVEL_SHIFT
to 9 there, which means all users must have a page table order of 9.

It seems to me we are just making things more complicated than
necessary by trying to avoid dependencies between CPU and IOMMU
page-table sizes and definitions, when the underlying mechanism to set
->ign0 has those assumptions baked in.

Would it help if you introduced a PAGE_TABLE_ORDER in page-defs.h?

Thanks, Roger.

