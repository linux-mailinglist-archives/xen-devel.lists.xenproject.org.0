Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B81C950A09F
	for <lists+xen-devel@lfdr.de>; Thu, 21 Apr 2022 15:22:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.310171.526864 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nhWkz-0005qf-7X; Thu, 21 Apr 2022 13:22:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 310171.526864; Thu, 21 Apr 2022 13:22:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nhWkz-0005nS-3c; Thu, 21 Apr 2022 13:22:01 +0000
Received: by outflank-mailman (input) for mailman id 310171;
 Thu, 21 Apr 2022 13:22:00 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/1dP=U7=citrix.com=prvs=1038dedf8=roger.pau@srs-se1.protection.inumbo.net>)
 id 1nhWky-0005Gk-73
 for xen-devel@lists.xenproject.org; Thu, 21 Apr 2022 13:22:00 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 047f6c89-c176-11ec-8fc2-03012f2f19d4;
 Thu, 21 Apr 2022 15:21:57 +0200 (CEST)
Received: from mail-bn8nam12lp2174.outbound.protection.outlook.com (HELO
 NAM12-BN8-obe.outbound.protection.outlook.com) ([104.47.55.174])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 21 Apr 2022 09:21:57 -0400
Received: from DS7PR03MB5608.namprd03.prod.outlook.com (2603:10b6:5:2c9::18)
 by BN7PR03MB3649.namprd03.prod.outlook.com (2603:10b6:406:c9::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5186.13; Thu, 21 Apr
 2022 13:21:56 +0000
Received: from DS7PR03MB5608.namprd03.prod.outlook.com
 ([fe80::5df3:95ce:4dfd:134e]) by DS7PR03MB5608.namprd03.prod.outlook.com
 ([fe80::5df3:95ce:4dfd:134e%4]) with mapi id 15.20.5186.015; Thu, 21 Apr 2022
 13:21:56 +0000
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
X-Inumbo-ID: 047f6c89-c176-11ec-8fc2-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1650547318;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:content-transfer-encoding:mime-version;
  bh=rBuBPJq4cctWRyDQOnxPt77RLOb1g9ofZ5nVo86zj30=;
  b=QdoELDoFyDiU6D76i0oVUyTu8gW5zas6oyiWAV1YuMkU53or3bhMGwmu
   L4m7TVhI98YEMavxZkzRyTR8Yia3Nje3MFxJQsbsdOfMdTSbd3hPxL6HI
   YC/7D0HR3fLbXYlpiRDpWVyd1k82dP/CwU5P8XzBXDS+/TxeIlMFKnRRI
   w=;
X-IronPort-RemoteIP: 104.47.55.174
X-IronPort-MID: 69628152
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:NEa5sajQCi2aL4yeUsQ07/xlX161FBEKZh0ujC45NGQN5FlHY01je
 htvCD+Fbv+CMTH3edAnPIXl80wD7JGBxtFhHgI5/3sxRX8b9cadCdqndUqhZCn6wu8v7a5EA
 2fyTvGacajYm1eF/k/F3oDJ9CU6jefSLlbFILas1hpZHGeIcw98z0M78wIFqtQw24LhX1nU4
 YqaT/D3YzdJ5RYlagr41IrbwP9flKyaVOQw5wFWiVhj5TcyplFNZH4tDfjZw0jQG+G4KtWSV
 efbpIxVy0uCl/sb5nFJpZ6gGqECaua60QFjERO6UYD66vRJjnRaPqrWqJPwwKqY4tmEt4kZ9
 TlDiXC/YTwTAJzugNlBaAZdKB9VEvZF0aLte1Hq5KR/z2WeG5ft69NHKRhseKc+qqNwC2wI8
 uEEIjcQaBzFn/ix3L+wVuhrgIIkMdXvO4Qc/HpnyFk1D95/GcyFH/qMuIIehWhs7ixNNa+2i
 84xcz1gYQ6GexRSElwWFIg/jKGjgXyXnzhw9gPL//puvjK7IApZ0L38EPbJdN2wQPpcjgGfm
 XLh8GL8DURPXDCY4X/fmp62vcffkCW+VI8MGbmQ8v9xnEbV1mEVEAcRV1awvb++kEHWc9BVJ
 lEQ+yEuhbMv70HtRd74NzWnpFaUsxhaXMBfe9DW8ymIw6vQpgyfVm4NS2cbbMR87ZBqAzs3y
 lWOgtXlQyR1t6GYQm6c8bHSqi6uPS8SLikJYipsoRY53uQPabob1nrnJuuP2obs5jEpMVkcG
 wy3kRU=
IronPort-HdrOrdr: A9a23:epGMUaP281xqXcBcT1P155DYdb4zR+YMi2TDiHoddfUFSKalfp
 6V98jztSWatN/eYgBDpTnmAtj7fZq8z+8P3WB1B9uftWbdyQ+Vxe1ZjbcKhgeQYhEWldQtqp
 uIDZIOb+EYZGIS5aia3OD7KadZ/DDuytHVuQ609QYJcegFUdAC0+8vYTzrb3GeCTM2TKYRJd
 653I5qtjCgcXMYYoCSAWQEZfHKo5numIj9aRALKhY74E3W5AnYo4LSIly95FMzQjlPybAt/S
 zslBH43Lyqt7WexgXH32HewpxKkJ/Ky8dFBuaLls8JQw+cwjqAVcBEYfmvrTo1qOag5BIDl8
 TNmQ4pO4BJ53bYbgiO0G/Q8jil9Axrx27pyFeej3emi9f+XigGB81Igp8cWgfF6mI71esMn5
 5j7ia8jd56HBnAlCPy65zjTBdxjHe5pnIkjKo6k2Ffa40Dc7VcxLZvsH+9KK1wXR4S1bpXUN
 WHVKrnlbVrmBKhHj3kV1BUsZKRti9ZJGbFfqAA0vblpgS+0koJinfw//Zv70voxKhNNaWs2N
 60QpiA7Is+KPP+TZgNc9vpEvHHfFAkf3r3QRGvCGWiMp07EFTwjLOyyIkJxYiRCe41Jd0J6d
 78bG8=
X-IronPort-AV: E=Sophos;i="5.90,278,1643691600"; 
   d="scan'208";a="69628152"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LqIbDiD/126uVBnMNLYUdgTHzjzQvvsXUWaM2bYsmfJ4Ov4bVdHwHGq31lvS3m+tFRFiBKtr+86nEgJAq9bvfhGBvyqULNdHcoIsjw0ZaPPdFcMLZVdln9DHIyyIT+BECeh/19issIBWrYYf1sWLz6RD1+ONwHKauZFY8jWSELdtOxnwpndd2o2wPeUS0Kg0lYUi7Z9x7ThQ2Ai4MqnVrdJzWWt0JUpQvN7zQPv12JfCD4f9bs3MElpXNAV06a7LPEJyf2Xti8MXzFwqJby6GFTxJfV6I9qzYGklq+JvyFHo4+IC+XFIFPEYlmjXeL8DF9Vuzy0+8VrfcX+fQ9x1RQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eiYpcvR4fTeX/RmTQ4OuGBZuZs0rA/Bk5WTNjAu5kLw=;
 b=RBRK5bkT/6FugdxcT9Qdcz5P6V9N2i43KFr2OWNvB1QEGipphggTUL630VanrnJLD0AqfUsTinuImIS3JVTigU0rbaPORr5NJbHWli5nKdKqIvFpmBZ58Yqidaf1E8dGB8iAjka4kzqSFRLQBWR9faBryE/wOSfgNdlnDcIvIxFln4cDT6lVmc3WJEo9e/egrKmH7LlEa8qVhhHVM74kPE5ikkWv3i4s1MOW0Ev8ahx+WL7OY2eZdsHPHFP14C83t70/VeJoYkFfijwuhf3rCoDLvM/Bz2dozzTXDO4GyosonEuXs3iLhnpBmT7KgWRFG1Ud/Rh4qDeO3rlQSZZH6A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eiYpcvR4fTeX/RmTQ4OuGBZuZs0rA/Bk5WTNjAu5kLw=;
 b=BZnR8j+wTbUSDmrMjx1v6jV8rrPxLDi26B5aucr9rECPaioUgEJMZrrwgPajEE8onlJXgyPeKaSqD1JXjTneCjW+aJI4pYqBzW5HnTcgEIUkrnhdLOEWM3Xv2G+0aYTnYkhiFr21ykTI48l+GPDdrccq0wYpzFhM6b/N9n3G6e4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Wei Liu <wl@xen.org>
Subject: [PATCH RFC 2/6] x86/ioapic: add a raw field to RTE struct
Date: Thu, 21 Apr 2022 15:21:10 +0200
Message-Id: <20220421132114.35118-3-roger.pau@citrix.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220421132114.35118-1-roger.pau@citrix.com>
References: <20220421132114.35118-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MR2P264CA0078.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:500:32::18) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1f8a5b20-5181-49f1-393e-08da2399e882
X-MS-TrafficTypeDiagnostic: BN7PR03MB3649:EE_
X-Microsoft-Antispam-PRVS:
	<BN7PR03MB3649A5410ED746917C5107A78FF49@BN7PR03MB3649.namprd03.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	BIxTxl1TZLD0KfAr435cOtkIF8VQSB6smlc03bb5GFbKrNZqJtu0jZB7XPXOFtQkBlv6UIUMCpinETwgzZCrhfyJhs3WTMfzmNs3MOlBFOKwIIN9JciwJQX/mkvN9ofVw16EtyB4Spud9U7oKgwYe7BDFNBY6w5+sUcxfao/Ev9rPBuYJbOew9vfkGMp0Mxaxi21DxfBu8eDd+sGM6hgSPWp06Q3XAHYds2T971X3mCoJMDLeIFXZs1Bo/HIKug5/9KRqsN4H3pWozqApwPET/KXgjCtuO3ZQBgnTcA+c1ik4qXKDEFYjvwmzYZrbyS/VpQ8a7WbD4L7qkSrw4hjXnLMfX0pjPksViadyf/JTGMTQGYJN4Yg7goMk+cbYbouFyEZjmYIn5QOs/+aEfrIXm7oFEZJxg7oMpifu6SKjmxUaa03ScwzkNHS0gHWm5Y/C1LHxZk0Sm+1zYsluB1xlZH97v5I7B11xegti3coCBhoRPZiZ26GX3LX5/DQ1MRRQgD9RwWYYyiTtrwR8qbcQNYD99h/Be9PPCQc13m3ID71Jra+dOyTN7I/U551r1NAuE/n/gPEwI3ULI5jtiJeiDqP7Bg2R8o2kuFPSKx5Cthndj0qhQxTKBrgjmqcP9Wc+gwMm3nz5JSTYkfbj9USUg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(186003)(6666004)(1076003)(6512007)(316002)(26005)(36756003)(54906003)(6916009)(2616005)(2906002)(6506007)(8676002)(4326008)(83380400001)(38100700002)(82960400001)(8936002)(66476007)(66556008)(66946007)(86362001)(6486002)(5660300002)(508600001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Tjd2V25Xc252UEJnVHVSMUd4bkgyaG9yclJ0T0lzaTdDQmFvVTA2aEpwVjVI?=
 =?utf-8?B?LzlTZzJ2OSs1dVFqVmthbFd5VTNPK0ZINU5TT0Y3UEFpSHp3dzdFYmNiLytP?=
 =?utf-8?B?R0IvRUR4bmhPY3lLazBXRkVKLzEyTzVEYlVxZVZ4bUhqa2dmUmJ1aCtFT3pL?=
 =?utf-8?B?OVZLZS9wV3BpVjVMN3FMNFN3cHk0YS9ENkg1b3VHT0ZWV1p6bUFpNDE5TjBq?=
 =?utf-8?B?NlpiYzFtOUR6ZUZ5Z1hLYWVQZEpRQmQ0TEIwZEswL1hlREpVZjZnTnA4RTMw?=
 =?utf-8?B?cjBLN0pmdnRrbUhBdTJHUUlYZTJyWUN4MkRWdWl1L0hPNWhBOXI0SHFXKzBB?=
 =?utf-8?B?Qm8wSmdHOGx5cWFSaE5saDViNEU0d09SNlArVlhPSXc3bVNMK3hQUTFaZHgx?=
 =?utf-8?B?K3d2Ym1rRFljaUllWDdwZHhvbkZabUJQbGRYK2pWTStPVmVmQUR6R2hac1BU?=
 =?utf-8?B?Z3ZUdndIQXM3TDlhazBKK2tBOTFvVVMzRzUyMU5UUlVzZ1dsZjRiSXA1c2hv?=
 =?utf-8?B?UDllZGhIb0lGUVM1OXBUS0lzaXR5V0N1RmtMclBXZWdmVW9WcHpCU2I4NmRO?=
 =?utf-8?B?U1NudDRYb3JRUEJ0WEF4eFZuelJpdlV1UTRqM1ppUkYyaDlMSlR5dEN6MTZy?=
 =?utf-8?B?akFTeGVEQUR0TFFRRnFEanY5S3pkQW8yYzZFRVhYdlkySE1zR3BpcnRoSUVR?=
 =?utf-8?B?UmV2V2c2MWRvekVzbUc0dGkwVE85NnlUbXA1S3FwbmgyNDZRMUtWbk15cGNu?=
 =?utf-8?B?TDc1aEZqVDZKaFZ1K2NCYnlCV0VMLy92aytDUHVtQjRjdnUrSW1GaDZQN0E1?=
 =?utf-8?B?K3QrVXNNaHFIY21uVnFtRnB5ek50ZnJ5S0RyUlJYK3l4UU0raTkwUTFnV0V3?=
 =?utf-8?B?ZitqejhhWG8yOFBLSlAzMjI5dmcxNnc2em9aY2dJcXhPa0JXakZBcE9sbVJi?=
 =?utf-8?B?TzJDZ3NHajlndUpzbmpodm5sS3ZzZFVtVkVrLzdzaTJndDVEMjEwN3hzRXVw?=
 =?utf-8?B?VVM1RS9CYXNNMWxvdTFaRHZaYmRyNWpMa2hIL3BMY3lFREl1ZFhrN0RTMnYr?=
 =?utf-8?B?QmhyV1VxdFBsdjlHTzRqUlBjY0szR2RiV1g4U2dzT0VkTDh0TVRXYThlQlpM?=
 =?utf-8?B?bFF4K3pHYzhWL2ZMWmpvQ1UzZ1l2SStJeUdyWUpZMTVzOXJSSXkraTV0dlg1?=
 =?utf-8?B?UkR0dlJSdWhIZjJuZlZqWHRnVEw5eXNwZ2xPSHllNHlKbW5oQi9NelhPSnRh?=
 =?utf-8?B?SmgxVGtCTDBsUTZDbEkyUnZONHQ2ZFF1dTVWaGhXd091N1lOVTIxelk5MVhu?=
 =?utf-8?B?d0Ird3puUDlGNWNqVjJyWkdWeXk3Qzdjb3FyWDRHaEdERDd5YkZJNkpSTWVE?=
 =?utf-8?B?RHBuWHhlZlZIUXNRZm9sUlVRN25Vd1pTeERHMXhIUmU1L2RjTklIK0Vmck02?=
 =?utf-8?B?cnp3R2hWTXpLN282ZXdOTWwwamZrQWFGQUYzR0RDTGpuR3NpSjdiWk1GazZF?=
 =?utf-8?B?eUNlczhOZ2F2eGEvSXNMc0ZkV3NGQ1Q5a2hnU0VWYUd5c3grYnpSRnJzQ2JF?=
 =?utf-8?B?T09uNCtjVC9QSjZyNElIQ0gxL25zaThlcURGWTRyZEFNS3Q1YzlSaWI0NTBJ?=
 =?utf-8?B?TzBUdWF4TmhIMlJJUEtIVUhLLzJwR3ltQXh5eTl5SnRtdzdaVFc4ZHJ0dzFW?=
 =?utf-8?B?OHpvNHhmSVdkeEplaitRbGZqK3lTQ0VJSmdYZEk4Y2J2d0pudm9EME9wVXd2?=
 =?utf-8?B?Unh1RWg4S1NmdHN4WkF2eGthY2prNEVsR2l4VUZaaUFwVFA1alpvRGNhYXZa?=
 =?utf-8?B?Y0xQSUk5bEp1aXJRNFNMUEFoUUxGSzRXSk9CUjJGOHhJdmVPMi9SZzA4dmUx?=
 =?utf-8?B?WjBzbU1HVG5Tek12eUFHeHFEdWlzWVVibjJYL0Z1YzlWSm9ZOTFiZE5STkNk?=
 =?utf-8?B?NmtEbC9MdWR3UjlFU3pDQlpjNFRoN3BwbEhZb2czKyt4bXYyRkQ1TGZ4cHly?=
 =?utf-8?B?Z3gyemlPTG1TaXdMVFFsM2xRTnVicTkrdHhOenNyOC9SbVp3SVZyNmUvVyt5?=
 =?utf-8?B?UDFzdzh3QjYyRk1zRi9MTDBmeXRxUFRSTTNrT1hROEhrSXlSdHJtWUVtYXpi?=
 =?utf-8?B?dXdkMXBXNGdjanUvT2lxTUlmMjFWdWtkaFFVTnNsV05YNXh2Si9rQ3pSK3RQ?=
 =?utf-8?B?YkpqekpxaE5sOGNsNnhxMFpqa3gydUlvNE5pbHFoWTBBWjlITFBqZ0MxWE1C?=
 =?utf-8?B?Ym9walQxU0xidGhSSUhhbVRDTkNCMUpBaXRtaXpJSG5uMWxmVWhGTmczS2tB?=
 =?utf-8?B?ZUtEcnJndlFVNm5JaDVHY25jVkVDdmZLN25OTnhvSWdLbHFWd0h3dDZXU3I0?=
 =?utf-8?Q?4+IceP+3E0t3Sth4=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1f8a5b20-5181-49f1-393e-08da2399e882
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Apr 2022 13:21:56.5256
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YrJ4HswcJObdlM1qjxqQIKvi+hiCYD9/aBN4S4ECZO4pEwxmNsywssN5QibGjgvKA2s7rhs/rrL2Vk4qT5m4uQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN7PR03MB3649

No functional change intended.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
 xen/arch/x86/include/asm/io_apic.h | 57 ++++++++++++++++--------------
 1 file changed, 30 insertions(+), 27 deletions(-)

diff --git a/xen/arch/x86/include/asm/io_apic.h b/xen/arch/x86/include/asm/io_apic.h
index ef0878b09e..a558bb063c 100644
--- a/xen/arch/x86/include/asm/io_apic.h
+++ b/xen/arch/x86/include/asm/io_apic.h
@@ -89,35 +89,38 @@ enum ioapic_irq_destination_types {
 };
 
 struct IO_APIC_route_entry {
-    unsigned int vector:8;
-    unsigned int delivery_mode:3; /*
-                                   * 000: FIXED
-                                   * 001: lowest prio
-                                   * 111: ExtINT
-                                   */
-    unsigned int dest_mode:1;     /* 0: physical, 1: logical */
-    unsigned int delivery_status:1;
-    unsigned int polarity:1;      /* 0: low, 1: high */
-    unsigned int irr:1;
-    unsigned int trigger:1;       /* 0: edge, 1: level */
-    unsigned int mask:1;          /* 0: enabled, 1: disabled */
-    unsigned int __reserved_2:15;
-
     union {
         struct {
-            unsigned int __reserved_1:24;
-            unsigned int physical_dest:4;
-            unsigned int __reserved_2:4;
-        } physical;
-
-        struct {
-            unsigned int __reserved_1:24;
-            unsigned int logical_dest:8;
-        } logical;
-
-        /* used when Interrupt Remapping with EIM is enabled */
-        unsigned int dest32;
-    } dest;
+            unsigned int vector:8;
+            unsigned int delivery_mode:3; /*
+                                           * 000: FIXED
+                                           * 001: lowest prio
+                                           * 111: ExtINT
+                                           */
+            unsigned int dest_mode:1;     /* 0: physical, 1: logical */
+            unsigned int delivery_status:1;
+            unsigned int polarity:1;      /* 0: low, 1: high */
+            unsigned int irr:1;
+            unsigned int trigger:1;       /* 0: edge, 1: level */
+            unsigned int mask:1;          /* 0: enabled, 1: disabled */
+            unsigned int __reserved_2:15;
+
+            union {
+                struct {
+                    unsigned int __reserved_1:24;
+                    unsigned int physical_dest:4;
+                    unsigned int __reserved_2:4;
+                } physical;
+
+                struct {
+                    unsigned int __reserved_1:24;
+                    unsigned int logical_dest:8;
+                } logical;
+                unsigned int dest32;
+            } dest;
+        };
+        uint64_t raw;
+    };
 };
 
 /*
-- 
2.35.1


