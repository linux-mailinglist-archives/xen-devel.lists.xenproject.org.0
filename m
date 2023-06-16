Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 108FA7331E4
	for <lists+xen-devel@lfdr.de>; Fri, 16 Jun 2023 15:11:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.550171.859116 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qA9EY-0002up-UQ; Fri, 16 Jun 2023 13:11:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 550171.859116; Fri, 16 Jun 2023 13:11:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qA9EY-0002sE-Ro; Fri, 16 Jun 2023 13:11:22 +0000
Received: by outflank-mailman (input) for mailman id 550171;
 Fri, 16 Jun 2023 13:11:21 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=uwsx=CE=citrix.com=prvs=524b7acb3=roger.pau@srs-se1.protection.inumbo.net>)
 id 1qA9EX-0002qy-Ix
 for xen-devel@lists.xenproject.org; Fri, 16 Jun 2023 13:11:21 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 47633171-0c47-11ee-8611-37d641c3527e;
 Fri, 16 Jun 2023 15:11:18 +0200 (CEST)
Received: from mail-sn1nam02lp2044.outbound.protection.outlook.com (HELO
 NAM02-SN1-obe.outbound.protection.outlook.com) ([104.47.57.44])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 16 Jun 2023 09:11:16 -0400
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com (2603:10b6:a03:38d::21)
 by SA1PR03MB6547.namprd03.prod.outlook.com (2603:10b6:806:1c6::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6500.27; Fri, 16 Jun
 2023 13:11:13 +0000
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::ab2a:a298:bacb:db47]) by SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::ab2a:a298:bacb:db47%2]) with mapi id 15.20.6477.037; Fri, 16 Jun 2023
 13:11:13 +0000
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
X-Inumbo-ID: 47633171-0c47-11ee-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1686921078;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:content-transfer-encoding:mime-version;
  bh=R/FIEqQgNYgNNHOA/C/KiytTy24Bfn6/iDD9X38QBJ4=;
  b=dDNdNAEbVokybTFUq3Dx3T5mdPGrAHVV21YzhSil51cgfpCYkhNj2zV5
   iVtd4/Vpu0WiLjZ2Zq8mvbf5SOJEaT8xHGyCG0lh/sw5DMEhpxy5dWDIP
   YHzGY8b8ms23vcB4fd4Qrpeqnx/YW37NI2xEPcnw/FdCKQI8bsewlA9pW
   s=;
X-IronPort-RemoteIP: 104.47.57.44
X-IronPort-MID: 113085896
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:ee08zK84l69rD2RZT5E4DrUDtn+TJUtcMsCJ2f8bNWPcYEJGY0x3z
 DcWXT2AO/yNYmugfd9+atmw/E0DuJ/dnYdiSAtqqCE8E34SpcT7XtnIdU2Y0wF+jCHgZBk+s
 5hBMImowOQcFCK0SsKFa+C5xZVE/fjUAOG6UKicYXoZqTZMEE8JkQhkl/MynrlmiN24BxLlk
 d7pqojUNUTNNwRcawr40Ird7ks31BjOkGlA5AdmO6kV5AW2e0Q9V/rzG4ngdxMUfaEMdgKKb
 76r5K20+Grf4yAsBruN+losWhRXKlJ6FVHmZkt+A8BOsDAbzsAB+v9T2M4nQVVWk120c+VZk
 72hg3ASpTABZcUgkMxFO/VR/roX0aduoNcrKlDn2SCfItGvn9IBDJyCAWlvVbD09NqbDklft
 vw6JRUiUSq7xP/vkK21afBMvu8KeZyD0IM34hmMzBn/JNN+G9X4ZfyP4tVVmjAtmspJAPDSI
 dIDbiZiZwjBZBsJPUoLDJU5n6GjgXyXnz9w8QrJ4/ZopTWMilAtuFTuGIO9ltiiX8Jak1zev
 mvb12/4HgsbJJqUzj/tHneE37aUxXOmCNNMfFG+3sZHskWwy2ZINBkbDXqCg/2FrBSlct0Kf
 iT4/QJr98De7neDXtT7GhG1vnOAlhodQMZLVf037hmXzajZ6BrfAXILJhZebPQ2uclwQiYlv
 neLkMnuHidHq6CORDSW8bL8hTG4NDURLGQCTTQZVgZD6N7myLzflTrKR9dnVbWz19v8HGmqx
 yjQ9HRiwbIOkcQMyqO3u0jdhC6hrYTISQhz4RjLWmWi7UVyY4vNi5GU1GU3JM1odO6xJmRtd
 lBe8yRCxIji1a2wqRE=
IronPort-HdrOrdr: A9a23:c8Yydq3Y9XGpZFbDVRaeXAqjBIgkLtp133Aq2lEZdPUzSKClfq
 GV88jzsCWetN9/Yh8dcLy7WZVoI0mslqKdkLNwAV7KZmCP0gaVxepZnOnfKlPbakrD398Y+a
 B8c7VvTP3cZGIK6/oSOTPIdurIFuP3lJyVuQ==
X-Talos-CUID: =?us-ascii?q?9a23=3AaqdKSGsLklDha+yirW1Y2UIS6Is0MX3/wVL/HHW?=
 =?us-ascii?q?ASnswGKKbakawwIhNxp8=3D?=
X-Talos-MUID: 9a23:jBmimQibAkru4YpQvJNk9MMpDOpa+4ejAhsxlZhemvCmMRBWYSy0g2Hi
X-IronPort-AV: E=Sophos;i="6.00,247,1681185600"; 
   d="scan'208";a="113085896"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=k45Z3xPR1V0NbjFdP3XaIrwitZ3hx9n/oVLM2YZLwUFGO4XmKPbdfO3YO3SZQnyjXHftJD6wp1W4DZZ6jOdkFMrauG+3fPr17vfQ6AWhtBfQw4AgCqr7Z43MpoX+O7oIbD/tbvu8VUPxSA0Mx6OvagCZImQy7Zh2dbtw3+6LY6KE3dL1aNcZjZdMKhi8U7020Ir4g9gzOg60PqoMj0YdlExVQmWelquxo8srZXefyuXjiso1lbCzaC7kHg+EmHUIeSS1H3XoY6KoIXq3tXDJDzLe6wdJQzGC1o8EcAjArS+6O5ARJ5NODdQj6GzWt+8NMC78VydAnAdlj9J52abh8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ThmNVYMmQ6VGfb+VH01B+FGJrydg+3CLS9eYmXTIbHE=;
 b=GmTp73NW93WVCaR0XGym5cBBtSwJuRuAydf5DoHLP2RAfuRjvucYWObeDiaGMRPTlYgDQplnHnic5f5tTZrTsH8xQ4+GTQnCs7uQTuYsVPWgtTYt+H1uZ51HqhdPpruxz0RKxMp0wRxjAHppqpsf4n/S1Nj64IUyvTP+ErfnzZQsapA0mH15Dnd72o5MmVhoN8+9rOZD72DkzrHWdX+JV30WL2tCMn/mc3OgCSuwsyqwIxFO0nXtIaQVk9z2J8OlSFCxcuuug+kshobIe7HlsiySXOW5j75nfUev7hWjWUN5GSgMb8gY9S+pYLIY0ce5j8qlGF632vjREJecNGHnDA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ThmNVYMmQ6VGfb+VH01B+FGJrydg+3CLS9eYmXTIbHE=;
 b=Ce5l+swfz2nQgqntYgYuH+oOGoPHGtXd3aArC/jDddjIZi1+J7xgTBxmzyDalkCv1pDX4oXfIZCb58eAAJ4W7TjtobAo+T8z73KRkOXTCRik+U4NUJkb7w0H+3lTAKD+wrpJ1tNhi0VuwvfY9ZEiO+JmZkpkmawcwMnXMpbSNxA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>,
	Juergen Gross <jgross@suse.com>,
	Jan Beulich <jbeulich@suse.com>
Subject: [PATCH 03/13] libs/guest: allow fetching a specific CPUID leaf from a cpu policy
Date: Fri, 16 Jun 2023 15:10:09 +0200
Message-Id: <20230616131019.11476-4-roger.pau@citrix.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230616131019.11476-1-roger.pau@citrix.com>
References: <20230616131019.11476-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P265CA0139.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2c4::14) To SJ0PR03MB6423.namprd03.prod.outlook.com
 (2603:10b6:a03:38d::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6423:EE_|SA1PR03MB6547:EE_
X-MS-Office365-Filtering-Correlation-Id: 41c1aae7-fcb8-40f6-d005-08db6e6b28d9
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	TAOJiPWoJjI7B61OAIHLkeMHXaJguimxC8kmlqypuaSCjjdoNpDH8tGaREbIRQRWN0ENvRcGpAlY7d1ALgONOtvc2rCmfLiF3PosXuRejBh4rcP0IpUbSIcVEmt/yKrEhQLYuoYI0C/GLy4sUFgOv1Nq7MP5g6JY+DK6eO4OQWKn5XVnBuCzdEr7sk7gKdwn1n5vCCTm5+u3Mz6//1SAdC1/03n/t9QujS8Q+1ucTZ8sQLk4wm3tWVeqXmt2yacIf+5Tx1qA45resHqXOvXb50FqZsEnBPCj0zZ0lBQhnUTYaqzeYn4icaXFxQQzC17LR1M8ra4eUfJPYKDLbcSJH6AKk1gbxxIbY1SJbIExxFQtr32rtBKw3Jwm5TD92s8pTtoAJftIdCTlaSyI8KCUA0DaNhIUe9m/At5fFhOb0ZeRvRV0pW4vtJurQ9dsqfKYw7kWK0QSRaQx2X56N+YGNMjpG1yATyjmrL3lGeEaMGE2cDNM04qByd+rZFyUvWbPGNztfhXlQVORfVVWG0U6XREzHO19f8a34ya/3Z6fAo2z0kncS1Qn1mpADuVJPmkh
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6423.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(366004)(39860400002)(136003)(376002)(396003)(346002)(451199021)(86362001)(38100700002)(8676002)(5660300002)(82960400001)(316002)(8936002)(41300700001)(66946007)(66556008)(66476007)(6916009)(4326008)(54906003)(83380400001)(2616005)(186003)(36756003)(478600001)(1076003)(6512007)(6506007)(26005)(2906002)(6486002)(6666004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WWlIcURSM0tGSHluR3lObkRKdXd6UjR3M2ZlT2x5S0tWZXNTKzgwOWFrNHVK?=
 =?utf-8?B?Znl3MjV3U1JURTZ5Q2FKMEJuWjExNTZCQm9oNjArY1padDZFMm5IclNTQzZU?=
 =?utf-8?B?ZkVJL3BCK1U2ZGhGcHdzb3FTalhVOGE2Tlkyb01KMWJYWk9RSUFFNW1ZR09y?=
 =?utf-8?B?cHFGUW1nRGNXOG05TEUrZWdadlptRVZ3cWpsOGdZTmlWRW5DRW5vdDkyVlpD?=
 =?utf-8?B?YS9lanAweG9pL1UvUFZFU2VYb1paSWxHMjJJWWtHUHQ0eTJHc29YemRjajNW?=
 =?utf-8?B?K2UvOFpLSmhzNjhVU3RJSEpxQWJJRXhJQ2lPbW5kSnNjWlArdlVoRndFbDVI?=
 =?utf-8?B?cHgySld4dDVIWkdnNW9lNmVadm4yUjdHdVhNWGVHdlBlQzdRblpxbVFaVmxU?=
 =?utf-8?B?KzB3d3k5MlJoWEx5NDVsYzJieTkxZytldytSUGdML3Z0WHZjOE9UbUhvUmtF?=
 =?utf-8?B?TnJsNkg1VmhMZ2pMZFZlYTJwRWk0UE1YT0FjVGxmbWw2TWhjTHFHZ0ZBcUMr?=
 =?utf-8?B?bDV2dUNGczhNTHRRQ1o3bGFBcjYyMVN5SWU1UlVkREhjeFVjTjdHcUFmWTRn?=
 =?utf-8?B?cWhxRk9qUTY0ZlBqaVFOWXoxM0ZUQXV4NVZWNytaT085SzFCRitmL2M1a3VN?=
 =?utf-8?B?UDlFZ2d5RkpOSURPc2RJRk92TEwyTGlma1J3WEQzUFJueExwOUNBQkRoeEc1?=
 =?utf-8?B?eGxRTlhLZDVuMlRrakdKVUp0bmtmbzhlZ2Q2M2RWdzRCbWsxbXIvK0prQnJj?=
 =?utf-8?B?KzV0UytYdFJsUXhFWmMrZDNlT1djL1N0Mi9BUEFpS0tHNWs4UnZVdTlkL1JM?=
 =?utf-8?B?cnZsRUtxVUtVRVRmakFQMndSeDZLTTBEemlQT0ZzOGJyVXdDdEsySGdNYVdC?=
 =?utf-8?B?Mi81NGFiaTlrcncxam9zcW1mWkYxaFFuS0Rrb0FrS2VFeTBhNzFRanFQU0xq?=
 =?utf-8?B?TXAzUjJCeHFJZy92SnY4Q2gveFhkTENOQ0Zxd1lsRjIzSTcySFRoc0FMNEdT?=
 =?utf-8?B?M0ljcExXaTRmbG8wSEdOZ2QxeHA0R0Q3Y3VXNU5VOHdqakVLdjFzNDNtWmtv?=
 =?utf-8?B?QmVlNi9JMDcxK2JWZy9keEJrWHdhNTNaRHE4SU9uVVFNQ1VkRUlOUVYzMXJM?=
 =?utf-8?B?Y3VCRmplSzRlN3hJaUkxUlIwaDlBbDRmS1BpaUpWRDZ2TDRORWJuM0pMbXNM?=
 =?utf-8?B?Y2IrcHl3V2dvMEp6cS9UTVlVWnE4eEVxRWJKR2NIVUxDVnVrN283bWpBdWxk?=
 =?utf-8?B?TDR2M2YwcnhPQkRsWWZwMC96NWZEaGJHS1JXbC9mNWpiUmN3L1dpUEh2blBl?=
 =?utf-8?B?S0lWMzRLelVPeVJMUmZzdzVPb3c1VjJ1ZG9BbVBWMTlvZ2NEaUdZVlZlRkpz?=
 =?utf-8?B?UU9kWEZ3bVkwVzd0Vll5THZzdjY3TXI5aGJIZjgvOEZ3a05RN0dUOWU3alVu?=
 =?utf-8?B?aFlYVGZBaDc3TXN1QW5Yc0hoL3JNbHZsM1JNOWlOdEV5eDBPK042UE9kVTBI?=
 =?utf-8?B?UythZkJBR29RTDJJYUtqSU13bFYxOW51QVRYckozRjZ2T2VsRDdHcURMcjNs?=
 =?utf-8?B?OUtxRlV4VCt1VkdIa3pVVnJOb2hRaEZVV253MTR1eFd5MG1IVjRMYk9kMzRM?=
 =?utf-8?B?c203VTR1K1FMRCtPWVQ1MWlmSjFzeUM3RHpyMXRFYmxxNzRsbEsrTmF6YUxX?=
 =?utf-8?B?ZzlCd2ZMN2NiYUllcTYveXkvZDU2eWxha3I5TzF3bHRkTHB3ZlQ4amx2QmRZ?=
 =?utf-8?B?QUNrYldJRHNHS1pmYkJyZU01ZGdxREo3QTFyTTBsbVNiU0R0cis2dXU5eDF5?=
 =?utf-8?B?ckJ1WS9DaXg2Q1hRTXdKcU42Ym05V2FySjM4aU43MFovUDFQQWtDYWNGRDVi?=
 =?utf-8?B?ZHZCRm44S0EyMmpBQ05FYi9oK2Z6SXNtalhUQU10ZUxCazYrcmUwWHMzVnJ6?=
 =?utf-8?B?ZWVvdzdhMXNYYzJndTAvUUpSRHZLeVRFdVIzSVFvUjcxa1NSTVN0cmJKVWRy?=
 =?utf-8?B?aW5UZ290NXR3NGJZQmNXbFBWZzVlTzlrSjM4eFpjOGZRbUNNUWFJT1l5NmZU?=
 =?utf-8?B?U3RoWmFBQ1Z4UG45RDZaYWdrZEIyci8wLytMa3ViaUkxaEZkN2dPUVRTbWs2?=
 =?utf-8?Q?nrMYmqki7nUCGsVOe27+BIgBw?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	15jYTJIFWTF+nunWpGLtCdm6DznMZTpeVIRXGC0no0MRyi5rXnu5O0B1ZSEotimzoy5HLMEL3Y1xz6g1Koo2zhQOTYxBcRQfB9jYSOUuqIoVL9LEXqg3opoXG3ypPue2PPAIIfFKfSwQb1uF5rQ8/8lSzVWl+U04DSlgxP/5KorGQwObUR/VN3Z1NVPhGgxP31qCEyvat+rMd6fSVWmODTaW7UDc9k5FiPy+UybdGakRtfJiRvqUg3QGmlFzjWGPaiK8V/J5rCMbD3STtGDrDlvwRa23WVjFtJO62KAE1rJ4U+abFkAJdgAidkjzg2/usWA0/XoucG4y1m4zWCEpqOfD6plHgU3KpGhheWMd6ED4Rc5I3+g5yLmCGDcxsJu15EFtECp3woApPPB2vWvMtrtagGnRPz1uG1l7akvQdM8nheAK9lAX9gTGCv4DGpFxvrFC5k4eRvQcJltS37t/IE40CWsPstZTO/0jLJ5U91mjws8h0BrBourlhTyrjXA1zlrhAhpRRpZzOQXW4+MrI2wSN0tIXzoxDeR7R5jsmR95g3Kvm5WCB7l8Jdmc9OKhx6Rw5QxBOCWxQi93lMA5iAN5OYk7QCVxtF51wV3DOiUdWIudWOWm4jqyf2uvlu4/4JyLNa2hJ4/FtiCelNg7u1LgHT2QiePT8420U/D3g46a+qHhcLLoBxTl7SReMaAuJJoNn86tAaSQyPFTT34RtUUEEtaBbRDxy18qZhD3Ifh8bUiStRLDG5R85Cv067TsJvV5mYyFLUcztRYE7QhvsSalya1IYhLSZW0VieeZPpel6wzzBpHgSGx29XcVL5SV
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 41c1aae7-fcb8-40f6-d005-08db6e6b28d9
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6423.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jun 2023 13:11:13.1907
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nXY6pgpL9+LFRHTeeaNheHPtIf8dL1N5yGvxX0kYovoxzH8xfOjWRhkNnb7hWwpFt7Dz01dlZ3Az40rqBWWapQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR03MB6547

Introduce an interface that returns a specific leaf/subleaf from a cpu
policy in xen_cpuid_leaf_t format.

This is useful to callers can peek data from the opaque
xc_cpu_policy_t type.

No caller of the interface introduced on this patch.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
Reviewed-by: Jan Beulich <jbeulich@suse.com>
---
Changes since v6:
 - Add newline before return.

Changes since v5:
 - Zero out parameter.

Changes since v3:
 - Use x86_cpuid_get_leaf.

Changes since v1:
 - Use find leaf.
---
 tools/include/xenguest.h        |  3 +++
 tools/libs/guest/xg_cpuid_x86.c | 26 ++++++++++++++++++++++++++
 2 files changed, 29 insertions(+)

diff --git a/tools/include/xenguest.h b/tools/include/xenguest.h
index e01f494b772a..0a6fd9930627 100644
--- a/tools/include/xenguest.h
+++ b/tools/include/xenguest.h
@@ -807,6 +807,9 @@ int xc_cpu_policy_update_cpuid(xc_interface *xch, xc_cpu_policy_t *policy,
                                uint32_t nr);
 int xc_cpu_policy_update_msrs(xc_interface *xch, xc_cpu_policy_t *policy,
                               const xen_msr_entry_t *msrs, uint32_t nr);
+int xc_cpu_policy_get_cpuid(xc_interface *xch, const xc_cpu_policy_t *policy,
+                            uint32_t leaf, uint32_t subleaf,
+                            xen_cpuid_leaf_t *out);
 
 /* Compatibility calculations. */
 bool xc_cpu_policy_is_compatible(xc_interface *xch, xc_cpu_policy_t *host,
diff --git a/tools/libs/guest/xg_cpuid_x86.c b/tools/libs/guest/xg_cpuid_x86.c
index 67e0dc9b4ad2..630d0018529f 100644
--- a/tools/libs/guest/xg_cpuid_x86.c
+++ b/tools/libs/guest/xg_cpuid_x86.c
@@ -828,6 +828,32 @@ int xc_cpu_policy_update_msrs(xc_interface *xch, xc_cpu_policy_t *policy,
     return rc;
 }
 
+int xc_cpu_policy_get_cpuid(xc_interface *xch, const xc_cpu_policy_t *policy,
+                            uint32_t leaf, uint32_t subleaf,
+                            xen_cpuid_leaf_t *out)
+{
+    const struct cpuid_leaf *tmp;
+
+    *out = (xen_cpuid_leaf_t){};
+
+    tmp = x86_cpuid_get_leaf(&policy->policy, leaf, subleaf);
+    if ( !tmp )
+    {
+        /* Unable to find a matching leaf. */
+        errno = ENOENT;
+        return -1;
+    }
+
+    out->leaf = leaf;
+    out->subleaf = subleaf;
+    out->a = tmp->a;
+    out->b = tmp->b;
+    out->c = tmp->c;
+    out->d = tmp->d;
+
+    return 0;
+}
+
 bool xc_cpu_policy_is_compatible(xc_interface *xch, xc_cpu_policy_t *host,
                                  xc_cpu_policy_t *guest)
 {
-- 
2.40.0


