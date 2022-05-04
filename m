Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2873051A021
	for <lists+xen-devel@lfdr.de>; Wed,  4 May 2022 15:01:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.320698.541556 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nmEcx-0007Z4-DE; Wed, 04 May 2022 13:01:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 320698.541556; Wed, 04 May 2022 13:01:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nmEcx-0007WK-97; Wed, 04 May 2022 13:01:11 +0000
Received: by outflank-mailman (input) for mailman id 320698;
 Wed, 04 May 2022 13:01:09 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=XlRM=VM=citrix.com=prvs=1169e63e3=roger.pau@srs-se1.protection.inumbo.net>)
 id 1nmEcu-0007WE-Vh
 for xen-devel@lists.xenproject.org; Wed, 04 May 2022 13:01:09 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3e5fb5ce-cbaa-11ec-8fc4-03012f2f19d4;
 Wed, 04 May 2022 15:01:02 +0200 (CEST)
Received: from mail-dm6nam11lp2176.outbound.protection.outlook.com (HELO
 NAM11-DM6-obe.outbound.protection.outlook.com) ([104.47.57.176])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 04 May 2022 09:00:58 -0400
Received: from DS7PR03MB5608.namprd03.prod.outlook.com (2603:10b6:5:2c9::18)
 by PH0PR03MB6638.namprd03.prod.outlook.com (2603:10b6:510:b9::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5206.13; Wed, 4 May
 2022 13:00:54 +0000
Received: from DS7PR03MB5608.namprd03.prod.outlook.com
 ([fe80::5df3:95ce:4dfd:134e]) by DS7PR03MB5608.namprd03.prod.outlook.com
 ([fe80::5df3:95ce:4dfd:134e%5]) with mapi id 15.20.5206.025; Wed, 4 May 2022
 13:00:54 +0000
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
X-Inumbo-ID: 3e5fb5ce-cbaa-11ec-8fc4-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1651669262;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=CDoiQVZPuhqD8N8J+i75fs3R+yfTIdF9pOhQKig9Haw=;
  b=OhAL7EXn1OrEpZDWr+1+vL7FXl8ffiLT0VULuKg5r9sfLyr7PUeOCBVz
   rcGkVSHP4TQDPlcjBHjKYM9db+V9kGQneETTRwkw/mzZKlLqxg+aWuSzB
   BSro+VbZE+NO4ZOQP6QKJewreVouTl5BPThG5RXh76iMMojIuLkhHed8l
   8=;
X-IronPort-RemoteIP: 104.47.57.176
X-IronPort-MID: 69945112
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:51ebkK3FpDvlifgOl/bD5aVwkn2cJEfYwER7XKvMYLTBsI5bpzUBz
 GdMWzyEOvyLYmP8e4h/bYSzoU9VvJTXn9RmTAZvpC1hF35El5HIVI+TRqvS04J+DSFhoGZPt
 Zh2hgzodZhsJpPkjk7xdOCn9xGQ7InQLlbGILes1htZGEk1EU/NtTo5w7Rj2tMw3YDja++wk
 YiaT/P3aQfNNwFcagr424rbwP+4lK2v0N+wlgVWicFj5DcypVFMZH4sDfjZw0/DaptVBoaHq
 9Prl9lVyI97EyAFUbtJmp6jGqEDryW70QKm0hK6UID66vROS7BbPg/W+5PwZG8O4whlkeydx
 /1cnKyfZSYoYZf2kb1McQB0PmYkBPdZreqvzXiX6aR/zmXgWl61mrBCKR9zOocVvOFqHWtJ6
 PoUbigXaQyOjP63x7T9TfRwgsMkL4/gO4Z3VnNIlGmFS6p5B82cBfyVu7e03x9p7ixKNezZa
 McDLyJmcTzLYgFVO0dRA5U79AutrieuImEF8QvPzUYxy1LZ/S5I1ebBDODyVvuPSusKu0qbv
 FuTqgwVBTlfbrRz0wGt8Hihm+vOliPTQ58JGfuz8fsCqE2ewCkfBQMbUXO/oOKlkQiuVtRHM
 UsW9yEy668o+ySDVtDgWzWorXjCuQQTM+e8CMU/4QCJj6bRvQCQAzFdSiYbMYN48sgrWTYty
 1mF2cvzAiBiu6GUTnTb8aqIqTS1Om4eKmpqiTI4cDbpKuLL+Okb5i8jhP46eEJpprUZwQ3N/
 g0=
IronPort-HdrOrdr: A9a23:cBscHqpzY1w2WE/wRWCWhCoaV5t4LNV00zEX/kB9WHVpm5Oj+v
 xGzc5w6farsl0ssSkb6Ki90dq7MAjhHP9OkMMs1NKZMDUO11HYSL2KgbGC/9SkIVyGygc/79
 YsT0EdMqyWMbESt6+Tj2eF+pQbsb+6GcuT9ITjJgJWPGRXgtZbnmVE42igcnFedU1jP94UBZ
 Cc7s1Iq36LYnIMdPm2AXEDQqzqu8DLvIiOW29IOzcXrC21yR+44r/zFBaVmj0EVSlU/Lsk+W
 /Z1yTk+6SYte2hwBO07R6c030Woqqh9jJwPr3OtiEnEESvtu9uXvUlZ1S2hkF0nAho0idvrD
 CDmWZmAy050QKqQoj8m2qR5+Cn6kdj15aq8y7mvVL4vcL2SCgmB8d2jZ9FehHZ70Ymoedn3L
 hQ32SfgZpbZCmw4BjV9pzGUQpnmVGzpmdnmekPj2ZHWY9bc7NJq5cDlXklWavoMRiKn7zPKt
 Meev00JcwmAm+yfjTcpC1i0dasVnM8ElOPRVUDoNWc13xTkGpix0UVycQDljNYnahNAKVs9q
 DBKOBlhbtORsgZYeZ0A/oAW9K+DijITQjXOGyfLFz7HOUMOm7LqZTw/LIpjdvaMKAg3d83gt
 DMQVlYvWk9dwbnDtCPxoRC9lTXTGC0TV3Wu7VjDlhCy8jBrZbQQFy+oQoV4rWdSt0kc73mcu
 f2Po5KCPn+KmarEZpV3mTFKutvFUU=
X-IronPort-AV: E=Sophos;i="5.91,198,1647316800"; 
   d="scan'208";a="69945112"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CoK9AtcXuWTDbWNVxgkMslLc6kGt3eCUS3FDCzIHUMm7ad8r7e5BxFP5nT8BIY+J311aTmNvD1a67yl1L2ZjjfHXzuKe8f8h4PsND+VLoaSPMeJBD+J76/9eBcSA4X/ExdGJL1xcl5Go/XR+ndmdqakF5CUEwa2Xy6AOXQncQTxad1g6cFlskXFiyObWKRoSchs7tIOhjVCII5weSYECF1MPNXuu/AjNtRoIzvcTjbjj8RVp9Ip75nqs6BP7F8yERiNRY1MnrH3ob3gNdjV9Xj9lEUrcmLbXB0DvhSeMJ+WyeaKeAUqp2gCJa9RpiKFxq1QfVbf0i1OOSNvncyaRwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qG0gipfkVcrI0mhGWOZpx23SXCCFHD+LFN5z/Mlkfkg=;
 b=j9rjxB6mapJvFp43AjNItRzO4RofaCEIRQ/oHQxNcbEGojKy27yQc4k7OIPPs+EKV4FRZOaqUhbH/UVaF3IxES2ZoETISANvJT+C3MAe8qrFbxpPpIJRUtPqI2JQspfxE8nXRLFcprxHHG8cIxmD1qqkRfwCNX6DsyGmVB3qOvB5dxyqqW1ZeihXLceCYBUPvRY5bW5iySHtnSv1dQTwsZt7l6IlMvWIqnJA0OpyEcxh79YpTJHQCsV1H4STaPNRucyd+E4hBmP9empyrQTbWwz7zeC6GuOUagIOFEWOqsn6bDfWE4vFwKfx+2cxmQP9o8PW1IZKLcYXLRNaH5U+Kw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qG0gipfkVcrI0mhGWOZpx23SXCCFHD+LFN5z/Mlkfkg=;
 b=pBTEm2lopVxJgSZXFUOyiPpDVbClO0ZqOn3ztoC7CQycttI8DY2zKUcOu3oKAh8O2gjId5w+Z8FHZyYIcj1Q71S5GxkWiq/Z0tjKNmWTRM3qLQf3POHHdeo6UiW4NWxCwq+esjcIHR3U4F6iK4q0d1Zlop4rLodS3DJFWcHa4gg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Wed, 4 May 2022 15:00:49 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Paul Durrant <paul@xen.org>
Subject: Re: [PATCH v4 05/21] IOMMU/x86: restrict IO-APIC mappings for PV Dom0
Message-ID: <YnJ5AeB0k4SQ4hhI@Air-de-Roger>
References: <b92e294e-7277-d977-bb96-7c28d60000c6@suse.com>
 <5cb4dc1b-f6b0-89cc-e21c-a27a5daf0290@suse.com>
 <YnEngsDG9BiiyzXj@Air-de-Roger>
 <6ffd48ee-9356-2f22-415e-03e172eabb55@suse.com>
 <6f45248b-2f49-0834-e801-d298ea680a33@suse.com>
 <YnJV3EYq7E+4ajPN@Air-de-Roger>
 <e40d5b56-e52c-34fc-fcfb-ebf136135271@suse.com>
 <YnJrBNkGl8Em0gTN@Air-de-Roger>
 <fa6e35ac-66f9-76f2-1dd7-f1175c65e3cd@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <fa6e35ac-66f9-76f2-1dd7-f1175c65e3cd@suse.com>
X-ClientProxiedBy: MR2P264CA0006.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:500:1::18) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1e16e0af-9b62-48c4-c158-08da2dce1f59
X-MS-TrafficTypeDiagnostic: PH0PR03MB6638:EE_
X-Microsoft-Antispam-PRVS:
	<PH0PR03MB6638D1BE0DC0D06D22414ECA8FC39@PH0PR03MB6638.namprd03.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Rk4eMg5sfZCw4HGv+WbI0CnutQi38jZsNb9Kbk173GFcyfdi3OFZBF8MrneCZblBe6VBA/FCAOt18/2uYmyEclLCGy2soqEL/fktJuaPbWSb2KWM8G7i0lsE6YRs646zAXkSyLaGf6unKNcz1y04sHl1xnb85RsyuAps0xyGrFyAff1wBk7jKBH37m+OlNOjJYKdjVp3N+eHo7lye9g6Q33xFi5cksHqctr05lTj8IDOoDdqBf1xLtxFUczpl3VtM1PO7Y9xgkfBT7CnYsJKcxaVveEB1D7z5Yv/0nJIHLomfMStNhM9qvxECSqLI3EZmB7sua9iUoviEcEs6ZQmC1lVa42q7dDt3S3geuiswAzNmi4Hi/swbY64dCgnov1Mk7nYwAcwTAL73B5RTHz2vJnHFg5YjuqF2yx5K1oaMOWkh9tMsuURzQLDhT9M4UoyiJtBuZ1bp1S28RIJzJ6V55nGXTMHiGhuvVdW8xVYjCHLbjCwhezKqmgRUSdivBDk18Yz9jT6Qu1d4gaWXCXqvLDPdo8mXcXnbuta4Dgqn1Fyt9cT61iOY14gXAmfJBKnTeBHyURBbperNnYWWqgZE80p5v2I+vC0qaYRnmASkkB4T1Y3xi6ccoSkmS0KrnhNKI2buMGB+iWNk4fJIMhJbQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(7916004)(366004)(5660300002)(85182001)(186003)(33716001)(26005)(9686003)(508600001)(6512007)(6916009)(316002)(54906003)(82960400001)(8676002)(66476007)(38100700002)(66946007)(6486002)(4326008)(86362001)(66556008)(2906002)(83380400001)(8936002)(6666004)(53546011)(6506007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Q2txUnlnYTVKVk1lTHk4M1BwakdUZzJVUlhzSHIzd000NTNyY3dpTjZxdkRQ?=
 =?utf-8?B?c2tOY045SytZRTZsZlVUTHV1VE53elEzWlpscklsaDdpRkc2Tk5nNWJrMVNS?=
 =?utf-8?B?TVZMMW9nbjdzN3d5TEdYQ3BFS1E3ejZIcmFJSExaWEFDeWliUEFubWZveEEy?=
 =?utf-8?B?Kyt3LzBlcGtHOVFCYWRrUXEwOHVnUlZlZ1pqYnFZL1E3WFk4K3ZQeVkyc25E?=
 =?utf-8?B?d0poN0pnVk51N0RQUExBZytFQndGNkNJWnQwRkltd3hyVXc1cGI2Q2F2MG5t?=
 =?utf-8?B?N0V1a2Y3ZmVhTjE4dGJxNEU2RVlpT0wyaXhXcGdGeVFKL0tRM3FISXpvUnJT?=
 =?utf-8?B?ajBOdjBqbFJtaElHTUJBWW5sVTVOcEpZUG5TMk9FRzdHdWRwZmxHUjlsdHIv?=
 =?utf-8?B?c3NVTlRWRmFMWGVkOHVEdmxGbjgrU2FvN3dsVTAzcWhTMDgyeEJiNHpLME1h?=
 =?utf-8?B?Ly9xSjI4KzVtTC9qa0xaTjRBQWk4VWdoS2lJK05qeU1mMnVXWHFEbFM3LzZH?=
 =?utf-8?B?SDJoOW5pMGhwdTJNMTJxNjRJWkJtQWRjdzVDbWpxZ2FmL050b1lObmgrdTFR?=
 =?utf-8?B?b0o4a1RmU1FHUElqcDl6YzBlcmQ2L3J6ZzBhVThzV3RMdGhHRHdxNFgwVWVR?=
 =?utf-8?B?djdNeFY2bnJmZzBwWkszSDQrWjI4eUFpeVM1a1pYcGVBVk9wZFhmVzFXd21J?=
 =?utf-8?B?b1ZUQVozZkFaZVlzanhTQ3FpNFFDQ0oyVW8xWHJWVUFsaDJIR3RCUWxDQ0I3?=
 =?utf-8?B?WEhvYm9BQnN2OUxVa1pweVJqY1hxV3BJRTc1elpTZm83T1pSOFFMNVZjb3dy?=
 =?utf-8?B?azRZYmlBYlZDckZiZThhQktISGZucDd6UnpkcFRuaTlheE5ib1dZS2Y4eWdU?=
 =?utf-8?B?anNHZG5DN0F6d21MaWZhZVpOeXduU01VVk1nT3MzMFl0NWRXN3JLZEppZysw?=
 =?utf-8?B?Tm9wZXoyWWoyMGdCOXJSejBHeXhvN005cS9IMVNvRmRrbTcyOVpHYmsvNVlw?=
 =?utf-8?B?Q244bkdDdXNTaUhnWWZVM0cwMGlHenpoUUJqM1RMTmMyTXN1b0Y3NVloYlRS?=
 =?utf-8?B?R3lleGpERUFFQ2lyRWx3NVZGQk1LcTJ0S0owZGJTNmV1OUJ1aU1rVzl2U1Fq?=
 =?utf-8?B?aDlkczJOYzRrYWxLZXlPMndpOUtCSHpOakNlMEF4cE91Wkc3Rkx3RDZSMU1v?=
 =?utf-8?B?cTNidmRXMVR4c1NobXRjdjd5dTBWTVY2R1dQRGFoNSs5T2Qrc2dQY2JZWXhM?=
 =?utf-8?B?S0daamJRVDZhU1UxZ0xTMFVHZXBUd1NmczBoaTRvamUvdnFEWEJSSWEzTjBF?=
 =?utf-8?B?VllJYktPMTZ0REQvTTNIMk5rdzU0VnhRQXp0OGVTZG9maEJkVGhIbXVaVU5z?=
 =?utf-8?B?ay9pRmVta3FKOVNWWGdOYW5iL3JvQWdoOUZURTZLeXkyRHFTQTUrZTA2U0Fx?=
 =?utf-8?B?RWhkSnRaNWdzMXFoU2VYbEd5WG04eFplT2RlZXZsZGFzUlA0dTFkemkreVBQ?=
 =?utf-8?B?OSs2aTUzRGVMcGFzZDdtYUdiVmV4MXlpRFBDR1A1ZXFRRW1VL3lZOGNTTVo5?=
 =?utf-8?B?ZHQycGhZVkJ3WTVUamdrRUozK3llQkhVc3I3YTQ2WTlMVWtPdjFadE9zTFpo?=
 =?utf-8?B?b0pSSXJLalBERWh5N1BiaUZidHRnTGxvMG5LSGdLTUdDTk9OQWFGb1NYeHhz?=
 =?utf-8?B?SHc0UUtGeFJNQUgvVndaTVFIOGR2UW1hbSswVU9KRUg3ZTFmMFdKUXR6Vmhl?=
 =?utf-8?B?a2pqMC9vQ281eXNGbCszU3RzSytQb0U1MnNtYURhRUxZb3pyT0RLczFyRkhC?=
 =?utf-8?B?SHdFWktYTHllUGJubnQraGR6eldpbDZINHVBRXVxUXJGV09HYVFSR08wWDhW?=
 =?utf-8?B?ajdhTHk3L0pHcVBBN2FwaXN3V3NTMzBvRk5raHpwdmFMYlEySlF5WERMZDFI?=
 =?utf-8?B?Q3Q4alRkUklEcnBrSnAvWHR1cUgrNU5FTnhRTUowczF2UGtQVXVTQWVnREMy?=
 =?utf-8?B?QUFMdTdPandZQ2grUjJ4OG41Y2xHN0ZCMHF4MUY2M1B6S3NYRklKY2FZMFJw?=
 =?utf-8?B?OUhqOWRhUDhCQjR4SVgrdi9oL3FJRU40TWRoSDc1cHJmZmE2dm9HMmJIYmtY?=
 =?utf-8?B?Z2R4czd2akNVUEd0akdwZzNGb0d2SFp5eTRqODRNRk1nM0ZVcnlwcmxVM0VL?=
 =?utf-8?B?UUJYM1JOamFlUE1TQjZlWGxodVIwOE0wV21yNnlIVUprWGZoNjBBODQwbkFT?=
 =?utf-8?B?M2N5Wnd4UTV2M0t1N2s3OWNKL29DQ1ZrV1F4MEFXT0NVUDhoS1J2czc0NjZN?=
 =?utf-8?B?L0FaQ2tuM1JROEF1VXRaT2VtYjVXeDF4RGp1c2dCcWFlMEIreGRrejFiYWxZ?=
 =?utf-8?Q?43ENXPCvHuTfI+wc=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1e16e0af-9b62-48c4-c158-08da2dce1f59
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 May 2022 13:00:54.2584
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HWcuRPMAltfZG57d+9OHudr/zktRhhPjiIWPJWl8Hv0MakNkXSjpdWJtoiMp4FVacShWmYiJOAJTTIBAnyrxEw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR03MB6638

On Wed, May 04, 2022 at 02:12:58PM +0200, Jan Beulich wrote:
> On 04.05.2022 14:01, Roger Pau Monné wrote:
> > On Wed, May 04, 2022 at 12:51:25PM +0200, Jan Beulich wrote:
> >> On 04.05.2022 12:30, Roger Pau Monné wrote:
> >>> Right, ->iomem_caps is indeed too wide for our purpose.  What
> >>> about using something like:
> >>>
> >>> else if ( is_pv_domain(d) )
> >>> {
> >>>     if ( !iomem_access_permitted(d, pfn, pfn) )
> >>>         return 0;
> >>
> >> We can't return 0 here (as RAM pages also make it here when
> >> !iommu_hwdom_strict), so I can at best take this as a vague outline
> >> of what you really mean. And I don't want to rely on RAM pages being
> >> (imo wrongly) represented by set bits in Dom0's iomem_caps.
> > 
> > Well, yes, my suggestion was taking into account that ->iomem_caps for
> > dom0 has mostly holes for things that shouldn't be mapped, but
> > otherwise contains everything else as allowed (including RAM).
> > 
> > We could instead do:
> > 
> > else if ( is_pv_domain(d) && type != RAM_TYPE_CONVENTIONAL )
> > {
> >     ...
> > 
> > So that we don't rely on RAM being 'allowed' in ->iomem_caps?
> 
> This would feel to me like excess special casing.

What about placing this in the 'default:' label on the type switch a
bit above?

> >>>     if ( rangeset_contains_singleton(mmio_ro_ranges, pfn) )
> >>>         return IOMMUF_readable;
> >>> }
> >>>
> >>> That would get us a bit closer to allowed CPU side mappings, and we
> >>> don't need to special case IO-APIC or HPET addresses as those are
> >>> already added to ->iomem_caps or mmio_ro_ranges respectively by
> >>> dom0_setup_permissions().
> >>
> >> This won't fit in a region of code framed by a (split) comment
> >> saying "Check that it doesn't overlap with ...". Hence if anything
> >> I could put something like this further down. Yet even then the
> >> question remains what to do with ranges which pass
> >> iomem_access_permitted() but
> >> - aren't really MMIO,
> >> - are inside MMCFG,
> >> - are otherwise special.
> >>
> >> Or did you perhaps mean to suggest something like
> >>
> >> else if ( is_pv_domain(d) && iomem_access_permitted(d, pfn, pfn) &&
> >>           rangeset_contains_singleton(mmio_ro_ranges, pfn) )
> >>     return IOMMUF_readable;
> > 
> > I don't think this would be fully correct, as we would still allow
> > mappings of IO-APIC pages explicitly banned in ->iomem_caps by not
> > handling those?
> 
> CPU side mappings don't deal with the IO-APICs specifically. They only
> care about iomem_caps and mmio_ro_ranges. Hence explicitly banned
> IO-APIC pages cannot be mapped there either. (Of course we only do
> such banning if IO-APIC pages weren't possible to represent in
> mmio_ro_ranges, which should effectively be never.)

I think I haven't expressed myself correctly.

This construct won't return 0 for pfns not in iomem_caps, and hence
could allow mapping of addresses not in iomem_caps?

> >> ? Then there would only remain the question of whether mapping r/o
> >> MMCFG pages is okay (I don't think it is), but that could then be
> >> special-cased similar to what's done further down for vPCI (by not
> >> returning in the "else if", but merely updating "perms").
> > 
> > Well part of the point of this is to make CPU and Device mappings
> > more similar.  I don't think devices have any business in poking at
> > the MMCFG range, so it's fine to explicitly ban that range.  But I
> > would have also said the same for IO-APIC pages, so I'm unsure why are
> > IO-APIC pages fine to be mapped RO, but not the MMCFG range.
> 
> I wouldn't have wanted to allow r/o mappings of the IO-APICs, but
> Linux plus the ACPI tables of certain vendors require us to permit
> this. If we didn't, Dom0 would crash there during boot.

Right, but those are required for the CPU only.  I think it's a fine
goal to try to have similar mappings for CPU and Devices, and then
that would also cover MMCFG in the PV case.  Or else it fine to assume
CPU vs Device mappings will be slightly different, and then don't add
any mappings for IO-APIC, HPET or MMCFG to the Device page tables
(likely there's more that could be added here).

Thanks, Roger.

