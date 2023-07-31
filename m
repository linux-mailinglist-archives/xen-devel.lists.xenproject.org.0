Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9147D7697E9
	for <lists+xen-devel@lfdr.de>; Mon, 31 Jul 2023 15:46:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.573078.897421 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qQTDL-0003dr-BR; Mon, 31 Jul 2023 13:45:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 573078.897421; Mon, 31 Jul 2023 13:45:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qQTDL-0003bj-7E; Mon, 31 Jul 2023 13:45:35 +0000
Received: by outflank-mailman (input) for mailman id 573078;
 Mon, 31 Jul 2023 13:45:34 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=IyhG=DR=citrix.com=prvs=569984122=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1qQTDK-0003bd-4T
 for xen-devel@lists.xenproject.org; Mon, 31 Jul 2023 13:45:34 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8379be3f-2fa8-11ee-b255-6b7b168915f2;
 Mon, 31 Jul 2023 15:45:31 +0200 (CEST)
Received: from mail-dm6nam11lp2171.outbound.protection.outlook.com (HELO
 NAM11-DM6-obe.outbound.protection.outlook.com) ([104.47.57.171])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 31 Jul 2023 09:45:06 -0400
Received: from BN7PR03MB3618.namprd03.prod.outlook.com (2603:10b6:406:c3::27)
 by PH0PR03MB6939.namprd03.prod.outlook.com (2603:10b6:510:16d::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6631.42; Mon, 31 Jul
 2023 13:45:03 +0000
Received: from BN7PR03MB3618.namprd03.prod.outlook.com
 ([fe80::8f94:c73a:ffb7:d5e2]) by BN7PR03MB3618.namprd03.prod.outlook.com
 ([fe80::8f94:c73a:ffb7:d5e2%5]) with mapi id 15.20.6631.026; Mon, 31 Jul 2023
 13:45:03 +0000
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
X-Inumbo-ID: 8379be3f-2fa8-11ee-b255-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1690811131;
  h=message-id:date:from:subject:to:cc:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=R2/p3morXLi5OMERD87Xiw1CiGbYNz0MxzK+LmrO2Fg=;
  b=Zx6GY2aDR9+IHALBz28GxKBTsPihvfvPr6l5JNrBJqC7OQCem0AcGvql
   ZOA1xm4SxciP8Gea1wGvD7O1DxmfixuEKM81kQRB3PFyAnyvQ7cZWoxTp
   pzcvqtcEnoSGvDJ8EvbmPW33Q3UHEuOH6satXGKqgw4N859LkRK8tXzuy
   w=;
X-IronPort-RemoteIP: 104.47.57.171
X-IronPort-MID: 116682672
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:hfmt46BwmQjkqxVW/+jiw5YqxClBgxIJ4kV8jS/XYbTApDsl0jQOz
 msaWW2EO/yIYWH9eIslPNy18BhU6sTVztNlQQY4rX1jcSlH+JHPbTi7wuUcHAvJd5GeExg3h
 yk6QoOdRCzhZiaE/n9BCpC48T8nk/nOHuGmYAL9EngZbRd+Tys8gg5Ulec8g4p56fC0GArIs
 t7pyyHlEAbNNwVcbCRMsspvlDs15K6p4GxD5wRnDRx2lAS2e0c9Xcp3yZ6ZdxMUcqEMdsamS
 uDKyq2O/2+x13/B3fv8z94X2mVTKlLjFVDmZkh+AsBOsTAbzsAG6Y4pNeJ0VKtio27hc+ada
 jl6ncfYpQ8BZsUgkQmGOvVSO3kW0aZuoNcrLZUj2CA6IoKvn3bEmp1T4E8K0YIw5swmBzpc0
 OcjFwsBbjvb2v+uxoihRbw57igjBJGD0II3nFhFlGicIdN4BJfJTuPN+MNS2yo2ioZWB/HCa
 sEFaD1pKhPdfxlIPVRRA5U79AuqriCnL3sE9xTI+uxuvDG7IA9ZidABNPL8fNCQSNoTtUGfv
 m/cpEzyAw0ANczZwj2Amp6prraWw32rAtxNTtVU8NZ1hnu2zWkuDCYJWGW8oNunlBSbf/9Qf
 hl8Fi0G6PJaGFaQZtv3UgC8oXWElgUBQNcWGOo/gCmdx6yR7wuHC2wsSj9adMdgpMIwXSYt1
 FKCg5XuHzMHmKKRYWKQ8PGTtzzaES4UJmgGbGkaQBcf4t/iiIsugQnCSNklG6mw5uAZAhn1y
 jGO6SQ72bMaiJdS073hpA+exTWxupLOUwg5oB3NWX6o5R94Y4jjYJG07V/c7rBLK4PxokS9g
 UXoUvO2tIgmZaxhXgTUKAnRNNlFP8q4DQA=
IronPort-HdrOrdr: A9a23:fFlSXKinTSXBkYxamkL6Lau0oXBQXtQji2hC6mlwRA09TyX4ra
 yTdZEgviMc5wx/ZJhNo7690cu7IU80hKQV3WB5B97LNmTbUQCTXeJfBOXZsljdMhy72ulB1b
 pxN4hSYeeAaWSSVPyKgjWFLw==
X-Talos-CUID: 9a23:USK6927G80V5+gBZ6dss6GRFHJs3V2bm80zcI2TgVHtxToePRgrF
X-Talos-MUID: =?us-ascii?q?9a23=3AyEHrGQ/jP2EzLSl6Pk3cakWQf9huxYGlDX0Jqoo?=
 =?us-ascii?q?Lhc6FFzJuYRK5oTviFw=3D=3D?=
X-IronPort-AV: E=Sophos;i="6.01,244,1684814400"; 
   d="scan'208";a="116682672"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=l5y7SvaBVxzrisDMsSN3HHkmB63BjWhFSDazRYoQAZIhnUWIq1hh5WKu7ZtV71oT27z/AGrGS+gigGm6/+gMt8Q4l+ICjKmmPUzJ4vBGtixwjdD/MtddiFO6UZHze/Q00RfsGVknLvyYULCEJuTDsogF+PtDIg4pu/cd7Dm/K03ONt4WpSOg0ASP7Nb/xZ2hFcaIuYL3r7/iEnOMNffyiT6+zelQSHg2WdO4u/pQXMcf4uE8BTnv1ZsNPqRbJL/yeIbXO7+kxjxSTxuEzIkJwJKNIOD1XFUFH/gf6NLfS5gWF2Rxwk9Z+IL46zUbGg01y/u4Q+u//ddM1iXhGJE/Wg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2V8uDiiJjUf8iU0IlQh22JLq6X9j3X/svHUk6kdvPDI=;
 b=LkBFG/aD49ho759DRgtCiDK5Dm4CIN2LnTVbsJwccymJwVzCKpIzClbvKQNiQFLOrR7Bbfz6NyG6gNzRfnFG3VeFuutLsYUj9viqCWXjwAIFD39J5uDAinT8VAGgYliYNBP47SUpxBu+whN9mz9B8tfwQCfF3HyNTJB4kW0/wIC2JO10EHF58g7RpoHN7z2mpmrAx6Wckg/rFG7ArwU5Le90bNYDWMzbxhtvkQvXe7Zoolz4LN+wQNtvCu75pc7l0YGOoAzWF0mbTm9W6HvAh8vd2XeOHfwVt9GlmXEPG95HU32kL9CxI/dpboyY2W3OA0WinW9JTCLTpABjLoQY3w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2V8uDiiJjUf8iU0IlQh22JLq6X9j3X/svHUk6kdvPDI=;
 b=CYrFwXJ02297zk/Xr41M21beVFa6IFi+5VBO0UHPrGP2whMT8vPNkZTmo7aKqDLuWzl0jwbHbOB97D9zRQ3ffZ7UhCNpPORyepMtHohXkjg/l8jUrkEFX4SUeewxKjGGh+MMu6kVx/a7EV1hcm3IhOFbxXHCK51rHTE5vfJnCxs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <12030ba7-2ac5-072c-baf0-a3bbe71f8c28@citrix.com>
Date: Mon, 31 Jul 2023 14:44:48 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH] x86/HVM: tidy _hvm_load_entry() for style
Content-Language: en-GB
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>, Nicola Vetrini <nicola.vetrini@bugseng.com>
References: <e9035197-b329-af2e-65ed-af31cd0375c2@suse.com>
In-Reply-To: <e9035197-b329-af2e-65ed-af31cd0375c2@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P265CA0095.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2bc::19) To BN7PR03MB3618.namprd03.prod.outlook.com
 (2603:10b6:406:c3::27)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN7PR03MB3618:EE_|PH0PR03MB6939:EE_
X-MS-Office365-Filtering-Correlation-Id: f55bea33-85cb-435b-b3b2-08db91cc57bc
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	9B0s+c2no2P32y58ZR2lxE1ukFL2ZnJ6p3ANMQPwMxv1oj3AHgaVieYizYNsDW6E1/bVC/VuxRMTkGTMfcDdHLTc244qaJoETRSe+NEDXste6W1weEIWlXbZFeajyAXFlYt7jmaH0FrqyzPkqPpzHgIh/sGTJZS8J1QXQAeLRpsjPA21ox6n/zKPuN93Z/Pt/G2MN0sJUicRfh/1p62WGpAoPOMNDBsBLUjH8itHAoNlaF8iqB2iG1ImZYIiMdgcxcMRg/LBIa1wDUjIMyZG0ga/slZzWZrD8QbeA0l6XK0r7uMbthhrppFfx6zt+02FjPeHSJzddGqebheDQnyM9b1fvGhPILwGgvXFwiUrBl39jf1tXjxftxzMPTYO9FaAjxshEzRzOJMHq7fDSOS4G1zV+7ka2iwkuFlhZcCzFLEDXUmkvv/vH5lNx+OZTrebyFfxToO7F435rFP3lDYiGGruAoekp8PFUD6fuQqErn8bz2f1kBQN3FlIfZPJM8/Ick54Im5GXkvuVCOyoEWDU0KCgXa/5HGhb3CepzdZoc5SSTj2/+X51BuKm0WE9+mt+iFt1yVQ4x/FLD/TVTCD1BxoW6hXhe86OKQzkyVYfbGclRKPYYBDNq9CC0jWSWonczgckqwhejOtNag+IYWnnA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN7PR03MB3618.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(136003)(366004)(376002)(346002)(39860400002)(396003)(451199021)(5660300002)(2906002)(66476007)(66556008)(66946007)(4326008)(316002)(31686004)(110136005)(54906003)(41300700001)(2616005)(6486002)(6666004)(8936002)(6506007)(26005)(8676002)(53546011)(186003)(478600001)(82960400001)(38100700002)(36756003)(6512007)(31696002)(86362001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?eTcvVldGM2pReTl5OEV6TDZmU0NRcGgvZlNJdkpJdHE5TmxLbmF2R2RUb3R4?=
 =?utf-8?B?RzArMWFBYzc4SHQ5emR2S2pmTVZ6aE5CaWpTalNsODBRSElQY1JzQ0RqYXNy?=
 =?utf-8?B?TFZId0NJRHZJSTVBTWNDVmorUENpY0J5eDVzOUxRN3p0RWw4b0VzTTdIenRr?=
 =?utf-8?B?cStoekkwb0MzZ2JBbVhqTGZxejlzUzZGRHFDbHM0SmRXYkNaRi9idjA4eUxO?=
 =?utf-8?B?bndiMjNqMVZ6ZVAyMHh3dkYreWxSbGw2SGxJVk5RdDFaK2xGWEdKbEpSWHht?=
 =?utf-8?B?c1JvU1dkYXZoK043cDVlbHp3Zms0TXhuMXkwbzNFenF1UDB5M1NLS05nVXZi?=
 =?utf-8?B?RG1pa3JsWHlDcUdLOXdnam1YM3J4QXBpRm5hWWgrc3p2T1kzaGFFZVNWZ0Vn?=
 =?utf-8?B?K0s5NkRSd2NWQVY0QmtIK05EQVJLTGZwWDNGeS8rakl5ZmQ2a2dCcXRVM3hL?=
 =?utf-8?B?VExnNDRNU1hBaEJMU0FjSURva2dlQURNdXc4SnRQK3FvZElYYUV1TW1HTlZI?=
 =?utf-8?B?ZVZodUR1VmVidTdqK0JEREFNYUZJRDNLWEcrZWZpSUp5RUdsWEp5NU1OaG5x?=
 =?utf-8?B?NlFlTnpiMkl2MEplVVV2NE5pWTczTWxQVFQ2RGVjL3JZMXYrZnpZVXNVcUNv?=
 =?utf-8?B?YkZIRFBHUkdzT0p4ZTc4UFpyeVIvemZ5eXRjODd2NG94Y0VXQ0VjMGN5MWFB?=
 =?utf-8?B?Q0FBU0owalZvdW5RWUczVkY5ZFJ6SG5DNlJMUWhrZWgrVFhMYncwM3JzRno4?=
 =?utf-8?B?NkNIR2N0cW5HNklmN2VrRkd5NlpHd0FicjFoWjN3YWJvV3Y3RTdVRGJiYms2?=
 =?utf-8?B?R0V3MTFmbFY3SHNVdG9aYU5HOXYyazE1dGc5YVhFQnh0VlVxNi9VWlFKalA0?=
 =?utf-8?B?MjFCcXZaQndnbFUwRUZTblJOMi91TlZKdGFvTFFQSkxobWU2bHBxVmJiRlgw?=
 =?utf-8?B?YjM3d29WTVoyUDRmOTRuMDZXZGFNSDYzOWkyNXhwZnVlcVF0ZWp5a0thSnE3?=
 =?utf-8?B?SGJmNWdSbVN6M0l6K1BQSElVNlVwckVrUXpzdGJLNDdCc1ZPQ0gwcUc5dy9s?=
 =?utf-8?B?ai9VUkpiQXk4TEpBRisrOVVNYitWQTU2Z3VpYVRxRWVEdWRjM1ZWdHdxcU5l?=
 =?utf-8?B?cVVwaXcrUmFiZk4xM250T0dXSkZyd2NzZjhCTDBZWXhvMzNwL2NBZWE4ZzVo?=
 =?utf-8?B?a0Y4ZkdpMUcxVkR6MG14aGhxY2hQUG00aDROKzB0N2hpM1dOUW1WRnEyaEFF?=
 =?utf-8?B?YUZMbjJYK1NraUE3TEVxcEc1SjhLMTJWeVlwMzMzRVJBcERVZ3JPRVRic0tp?=
 =?utf-8?B?UE8xWVVZOTlnMkpqcmdocjhnZ0tNalJzaVlZV0twVSt1QndQS25obGlXeXZY?=
 =?utf-8?B?bThldHp1NUowTmV5d2NPQ1hJcVJqWFVLQzNZbFloOXA2cjczRmVkN1NIN3hx?=
 =?utf-8?B?aWV5ejNXMDQyVDlQWkFPU2R0YnhFenNYVXBucUphQUM2d09SU3NpQ1ZMbzNH?=
 =?utf-8?B?S3FlcjExQnE0eGNoQ3ZaM2VncmpPempVRDVsSVZDOW5KL1NIM3ZWU3c3bWwz?=
 =?utf-8?B?aFVWdGdteVhSb0FyOEVCcnVrQUsyUEZjM3l6cENoZitsTldrQ3ljcDRrTlBS?=
 =?utf-8?B?OGhOeU5DdVBiQ0tYSUltelpWV0crb2RmS3ZlQk1tbXZER1lyWkhMTzBTMVZM?=
 =?utf-8?B?QkwrZEFHdnBjVlFWM2ovMHAvd21MenJwelUvK3pQSGp2eEdrcXl4WmVURkQ1?=
 =?utf-8?B?VmlpelJqMlZ0RG4rZE5YdkZiZUhQQXV3dXV2NUd2MzI4aW9QVlpqQ2JJaHh0?=
 =?utf-8?B?Sjk5a3lvMzZWc0ppN0NoTjlyc1dpV1RFSUFud1ltL2k5Um1PUnRLcUFHaER3?=
 =?utf-8?B?UkZ6eTBzWnFjN1orUXZMUkpmVC9nYWN0bFJoelZnUkpUL1RYTjczaG1BZDVO?=
 =?utf-8?B?S0ZPZXMrZE5QU0tkdS9iakJrQk5NVmJmc3o3MUUxU1RPTkN6Zi9rTGo3MEZN?=
 =?utf-8?B?QklCZkJhbHBYVC9ubHdLak5Yak9DTW1sUVhjSGFSMXJ0TGIrNklja3dweWY3?=
 =?utf-8?B?bGZGVnRoRXBEdmN3UGxDYTE3UGU4cnk3eVlBaHpxaERFam1PeGtuZ1RDaE4x?=
 =?utf-8?B?c041LzJYTHFvY2x1WWZ0cUZTR1N2VDRWREp3cUxvbEppYkJuSXdzazBFSVg0?=
 =?utf-8?B?V2c9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	T91qf4oMONU13ie2zc16yZTdhZBXPDyXPoCU+dkl68YLBRyRtXS/zDFBmGzI5V95f0C2njfbOoLNWX8bTckKNipmtKGf1G/GrwleYr9PNS6w0w4W3mF3V4n8DvZp3IRfcJQexk7ic6xovg646L64Z8pxChwHCYmzUvOhKrwnul1V9nCyKzWC6MfZ/0oeT4LvZMcLOOy9q2v1ZMly8hvM1z5izKY1IJUtdT9HIKQE7rVFiPQtRhheou4BANUhZkCJ1dGpag6JQrrPPitWlGlXSM0gbh22pLJqgmQILTKRfKfDX9usYjPyjwnk48Q2uJ6wGY81N3DYkBxL8prUxZ0viO7NYCheA1QDLLvp8isazGekCzWKh6FKzK6l/UsIQGsocuJb9vpKKAkOclKOF8L387is2ORQQUsfEcrp4meu0rvq5liD/aq9IRSsQxMuQ6qo9C37hoE+CZScfql49WNw3dOKKBsvEE1cbbz6Qq+rdlgLpN7t9U+jG3pD+AaAwxrBJ7LpBqOr1GglVW/BA1Bi4oEuD09GKuP3ZsP4BBHWzZYatvNHZ8C+XWAsr2RcBuNU5UjKzKNXUZsuXQw3EdgKFTMRxqAPOHrmZbsLFzV8Bz0VoNY2/6AE6sCUQTZdiY6U6TtLD/WuM5YMWiyt0MbJ81XJgq5x7A8P5zDuobXeQ6n33ixQK/PS8kFyJPuQwOQMmAsIunfp4ehKzeyENiFa8347Mw+CUgxMASxlgy0eH0IfqonR6tG6knllHD3dDNLhzFPYFEWvSX5lFiNf5US2yCCL/nhTFohd8RzbkUIuDPdYqBCXucAl3ah6eqg2LH9vwFc0uPCePMCVfaEsWqFCiIfoB7kKiG7mBpk3gGeRkJc=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f55bea33-85cb-435b-b3b2-08db91cc57bc
X-MS-Exchange-CrossTenant-AuthSource: BN7PR03MB3618.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jul 2023 13:45:03.6560
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6+rF2WBFnPOdrytY6rawcc+XxNCcMGXQEDExE9HfrqkOr+Jcjb2iRxPUuPxA8Zmz+XBpe7J/kUete9t8qysDKLBWgm03ImhA4efAu0XuEL8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR03MB6939

On 31/07/2023 2:31 pm, Jan Beulich wrote:
> The primary goal is to eliminate the Misra-non-compliance of "desc"
> shadowing at least the local variable in hvm_load(). Suffix both local
> variables with underscores, while also
> - dropping leading underscores from parameter names (applying this also
>   to the two wrapper macros),
> - correcting indentation,
> - correcting brace placement,
> - dropping unnecessary parentheses around parameter uses when those are
>   passed on as plain arguments.
>
> No functional change intended.
>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>
> --- a/xen/arch/x86/include/asm/hvm/save.h
> +++ b/xen/arch/x86/include/asm/hvm/save.h
> @@ -47,30 +47,32 @@ void _hvm_read_entry(struct hvm_domain_c
>   * Unmarshalling: check, then copy. Evaluates to zero on success. This load
>   * function requires the save entry to be the same size as the dest structure.
>   */
> -#define _hvm_load_entry(_x, _h, _dst, _strict) ({                       \
> -    int r;                                                              \
> -    struct hvm_save_descriptor *desc                                    \
> -        = (struct hvm_save_descriptor *)&(_h)->data[(_h)->cur];         \
> -    if ( (r = _hvm_check_entry((_h), HVM_SAVE_CODE(_x),                 \
> -               HVM_SAVE_LENGTH(_x), (_strict))) == 0 )                  \
> +#define _hvm_load_entry(x, h, dst, strict) ({                           \
> +    int r_;                                                             \
> +    struct hvm_save_descriptor *desc_                                   \
> +        = (struct hvm_save_descriptor *)&(h)->data[(h)->cur];           \
> +    if ( (r_ = _hvm_check_entry(h, HVM_SAVE_CODE(x),                    \
> +                                HVM_SAVE_LENGTH(x), strict)) == 0 )     \
>      {                                                                   \
> -        _hvm_read_entry((_h), (_dst), HVM_SAVE_LENGTH(_x));             \
> -        if ( HVM_SAVE_HAS_COMPAT(_x) &&                                 \
> -             desc->length != HVM_SAVE_LENGTH(_x) )                      \
> -            r = HVM_SAVE_FIX_COMPAT(_x, (_dst), desc->length);          \
> +        _hvm_read_entry(h, dst, HVM_SAVE_LENGTH(x));                    \
> +        if ( HVM_SAVE_HAS_COMPAT(x) &&                                  \
> +             desc_->length != HVM_SAVE_LENGTH(x) )                      \
> +            r_ = HVM_SAVE_FIX_COMPAT(x, dst, desc_->length);            \
>      }                                                                   \
> -    else if (HVM_SAVE_HAS_COMPAT(_x)                                    \
> -             && (r = _hvm_check_entry((_h), HVM_SAVE_CODE(_x),          \
> -                       HVM_SAVE_LENGTH_COMPAT(_x), (_strict))) == 0 ) { \
> -        _hvm_read_entry((_h), (_dst), HVM_SAVE_LENGTH_COMPAT(_x));      \
> -        r = HVM_SAVE_FIX_COMPAT(_x, (_dst), desc->length);              \
> +    else if (HVM_SAVE_HAS_COMPAT(x)                                     \
> +             && (r_ = _hvm_check_entry(h, HVM_SAVE_CODE(x),             \

&& on prev line, and an extra space before HVM_SAVE_HAS_COMPAT()

With that, Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>

This code re-enforces my firm belief that this has no business living in
the hypervisor at all.  All of this can live in userspace, with a
slightly improved hypercall interface.

~Andrew

