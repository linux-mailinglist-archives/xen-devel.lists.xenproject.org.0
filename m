Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 21E5751D916
	for <lists+xen-devel@lfdr.de>; Fri,  6 May 2022 15:26:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.323127.544700 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nmxyD-0001on-2P; Fri, 06 May 2022 13:26:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 323127.544700; Fri, 06 May 2022 13:26:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nmxyC-0001m4-VP; Fri, 06 May 2022 13:26:08 +0000
Received: by outflank-mailman (input) for mailman id 323127;
 Fri, 06 May 2022 13:26:07 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=4KMJ=VO=citrix.com=prvs=1183625ce=roger.pau@srs-se1.protection.inumbo.net>)
 id 1nmxyB-0001ly-GA
 for xen-devel@lists.xenproject.org; Fri, 06 May 2022 13:26:07 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 14011e30-cd40-11ec-8fc4-03012f2f19d4;
 Fri, 06 May 2022 15:26:05 +0200 (CEST)
Received: from mail-dm6nam12lp2174.outbound.protection.outlook.com (HELO
 NAM12-DM6-obe.outbound.protection.outlook.com) ([104.47.59.174])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 06 May 2022 09:26:02 -0400
Received: from DS7PR03MB5608.namprd03.prod.outlook.com (2603:10b6:5:2c9::18)
 by MW4PR03MB6668.namprd03.prod.outlook.com (2603:10b6:303:123::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5227.20; Fri, 6 May
 2022 13:25:59 +0000
Received: from DS7PR03MB5608.namprd03.prod.outlook.com
 ([fe80::5df3:95ce:4dfd:134e]) by DS7PR03MB5608.namprd03.prod.outlook.com
 ([fe80::5df3:95ce:4dfd:134e%5]) with mapi id 15.20.5206.027; Fri, 6 May 2022
 13:25:58 +0000
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
X-Inumbo-ID: 14011e30-cd40-11ec-8fc4-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1651843565;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=6O4CAnYwv9/djAWOzx4n9NDXRVzdkRxyrdTNyMCykpQ=;
  b=SIh3rYwEiG/qmwv6MRp7ZthEcPxc8h1miEtDkwbPEbVqlpH4Lrvy0Id6
   cIxCWjEcy8BxsadLFhwZW3zPfMXiO3/6XHfgs8VmHwRx4YumjDm2AI1+V
   MWayOShGRoHX8UElQ/AHmbjBPh+mvOF3MCfQLADuiwPuOYdCShcC9DWi0
   M=;
X-IronPort-RemoteIP: 104.47.59.174
X-IronPort-MID: 70735659
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:tQsa3a2GSaHLeBRA5PbD5alwkn2cJEfYwER7XKvMYLTBsI5bpzZTm
 zBJDTjXOvfeY2HwKosgYYW+8BtT7cPcxoVgTwM+pC1hF35El5HIVI+TRqvS04J+DSFhoGZPt
 Zh2hgzodZhsJpPkjk7xdOCn9xGQ7InQLlbGILes1htZGEk1EU/NtTo5w7Rj2tMw34Dga++wk
 YiaT/P3aQfNNwFcagr424rbwP+4lK2v0N+wlgVWicFj5DcypVFMZH4sDfjZw0/DaptVBoaHq
 9Prl9lVyI97EyAFUbtJmp6jGqEDryW70QKm0hK6UID66vROS7BbPg/W+5PwZG8O4whlkeydx
 /0O6r2wVl4PEJfu2/k/cDx+OQR/HZx/reqvzXiX6aR/zmXgWl61mbBCKR9zOocVvOFqHWtJ6
 PoUbigXaQyOjP63x7T9TfRwgsMkL4/gO4Z3VnNIlGmFS6p5B82SBfyVube03x9p7ixKNezZa
 McDLyJmcTzLYgFVO0dRA5U79AutrianLGYF9g/EzUYxy2fZliJw25bxCcGLRdOgBsdexkm6+
 H2TqgwVBTlfbrRz0wGt8Hihm+vOliPTQ58JGfuz8fsCqE2ewCkfBQMbUXO/oOKlkQiuVtRHM
 UsW9yEy668o+ySDVtDgWzWorXjCuQQTM/JPF8Uq5QfLzbDbizt1HUABRz9FLdAj6sk/QGVw0
 kfTxoy1QztyrLeSVHSRsK+Oqi+/MjQUKmlEYjIYSQwC4J/op4RbYg/zc+uP2ZWd1rXdcQwcC
 RjTxMTir93/VfI26pg=
IronPort-HdrOrdr: A9a23:DPIzDKDZbZ0RreDlHej0sseALOsnbusQ8zAXPh9KJyC9I/b2qy
 nxppgmPEfP+U0ssQIb6Kq90ci7MD7hHPtOgLX5Uo3SJTUO1FHYTr2KjrGSjwEIeReOjtK1vJ
 0IG8MVZb2AbmSS5vyKhDVQZuxQpuVvh5rY4ts2oU0dKD1CWuVF1UNUGwybGkp5SE1tHpwiDq
 eR4cJBun6JZWkXRt7TPAhLY8Hz4/nw0L72ax8PABAqrCOUiymz1bL8Gx+Emj8DTjJ0x6s4+2
 StqX222kzjiYD79vbv7R6R031koqqi9jKFPr3ItiEhEESttu9vXvUkZ1TNhkFznAjl0idWrD
 CFmWZdAy000QKWQoj9m2qS5yDwlDkp8HPs0lmenD/qptH4XiszD45biZteaQax0TtpgDjS6t
 M444u1jesgMfr7plW12zEIbWAeqmOk5X451eIDhX1WVoUTLLdXsIwE5UtQVJMNBjjz5owrGP
 RnSJi03ocdTXqKK3TC+mV/yt2lWXo+Wh+AX0gZo8SQlzxbhmpwwUcUzNEW2n0A6JU+QZ9Z4P
 msCNUiqJheCssNKa5tDuYIRsW6TmTLXBLXKWqXZU/qEakWUki93KLf8fEw/qWnaZYIxJw9lN
 DKWFZVsmM7YAb1BdaP0IcO8hfWXW27Vzioysw23ekJhlQ9fsueDcSuciFcryL7mYRhPiTyYY
 fCBK5r
X-IronPort-AV: E=Sophos;i="5.91,203,1647316800"; 
   d="scan'208";a="70735659"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BIpGKkLojpeMOsI+/KTWkKuK6nj4CPvPJBO5v0/MXr+hAllNYuYBjCHpTtXzUwvaZS249sw3eN3HHI+cgFEuuWPOJi1mbFQZ6T73Qx0/FoVByICx7mm6rejZp2Hr/QG5GFx4ti1QnpRoZkSlvXkZ/oLU9570iitIzwJ7XumSDQVBkYhRKBV8CyuJ08S+lXNYUIQF9BiI5p3WXMW57SW/bNS4IIH5QvTssR8dm4+Gg7YiNVd11fD1MDnjBT0UqBab3+U5ZGrQYVBwqpsE9dbtMNsOy2zwituLrVGzesf0qKpL8iv8O3GazmySwIZRV9F6Az7xgcaQtxgzG07XYh30Cg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=U0zNji4fmI6m8Qd0nVtMxOFicFEkdsmHD2NrHiaWTF4=;
 b=aFzFvM2nPAARL0/Df77scVcCG/ywaDPhuI5kBhE1Rl67ZSfGaEl7BX1vJUGUARYepHPYNfbby+AIs+a7xKrTZJZtrvwzCGLtZen7kg2Dbd7licmDyYmc0UkTMK0zrIOAZyhduqgw/JXfXfHul6g6TQ++D3qp7odMp5knPN1lYrAi5P/785dnJtEtBmoHRcIHL3htO7G6SRhpGShURmjXwW32q/riZY6hVj9CyVMLqEl9sdXhbNj9LPNSq0v0HlUOwh5bWhVSQNZECKMzXQyNVvD0rkb8vOo6NfrdXaLbvVn5j96ECW7NEqZB+F3Grg3SIyq7Th6kTc67GPoXTnlKNg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=U0zNji4fmI6m8Qd0nVtMxOFicFEkdsmHD2NrHiaWTF4=;
 b=e8J2aoSP/DTJoaPZHvqd9bl06qHUToL92sNvaxz6r6OjCUw1C7C7e+3EKPbKYLQRAwzoAXB3NvLk2xRX08j4TxhnQfsYtQ/8HP8BzGWjzZvlpyTOjYcI65xC23VGCY+iVWCGzPwoKRVTkiH5wDdtUoTS7POtKniVBDwPrzcWhfY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Fri, 6 May 2022 15:25:53 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Paul Durrant <paul@xen.org>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH v4 14/21] x86: introduce helper for recording degree of
 contiguity in page tables
Message-ID: <YnUh4ZbDMZZdCw9w@Air-de-Roger>
References: <b92e294e-7277-d977-bb96-7c28d60000c6@suse.com>
 <fedf7224-8023-275a-843c-1a5753c20ded@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <fedf7224-8023-275a-843c-1a5753c20ded@suse.com>
X-ClientProxiedBy: LO2P265CA0245.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:8a::17) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5f6ed142-21ba-4d78-6b08-08da2f63f519
X-MS-TrafficTypeDiagnostic: MW4PR03MB6668:EE_
X-Microsoft-Antispam-PRVS:
	<MW4PR03MB66688ECFC1A1E9DE7942E7CA8FC59@MW4PR03MB6668.namprd03.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	IK0HLrVlcmj54jX/h7YFlPfNfzRYxxBnKkcHHXetOqpEZ2rwuLJ5Wcl9qwQ2WF9HAkHBQgSNRlTbBo7bcLDjqvH4F4MMnS9eAsysfuwPAMM8nvz60+co/KuWt7+rYotJRfutoXZE3b46jLukCs56gfcZ7G6FqDfPb60mwiTZc9TayqCCXHR7ccGgvBYV5CRHMuHqmixnntCV50Ev4Cco2MJJ/ymQd4o0PEB8VjgZjP3cvGikcz4TfD07PqNaJ522MTNOw2NTeE/jz1bIY+bVTAEqTsU7NqSGPT6PWUmEAFRoJSVom/mqyykGn1se0pOcrkmyDI0id+BR6dr8VzgnQNNdMafnlkrW5oHk6cxyExYSPCzySm6EzESnjx6jwvUmxVUYBAZcJKEF6Nlq6RZv95bwT+/3Yql58ArEHSRhPVEtEzf2PNhaH70aaywruEOt23JzAraXTecmYeMSDXjVef2Miegk7XH6sp6J3Q+FVEw5G1C8SbraLdhU9aSXfUwXlGaDc0kk8Xu6voMuQ2NjIp8HTjSPBnrGKCfAuZq9WCk+TDg6511OX1nU+mIxGVoWGEwltziJobQQyKwlg/ALdPfwPS6SGukZ5JqAsZ9/N4rDX3xMmyFmgUUE2RW76LQHB7P5RfXrfIlYkfSgLD3BCw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(7916004)(366004)(5660300002)(6512007)(38100700002)(6506007)(6486002)(83380400001)(85182001)(26005)(508600001)(9686003)(54906003)(2906002)(86362001)(316002)(6916009)(6666004)(82960400001)(186003)(4326008)(8936002)(8676002)(33716001)(66476007)(66556008)(66946007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cmdOeFErNHd5aTZLMjlzY09sd1RKdlgvY0JuUXRJb1lrSjVkQnBXdGtqbmpO?=
 =?utf-8?B?SDZMMjFvclRLdkl0SnRiQUxDc1hHR1YwbExEUzcvZ3RUT25vZGxoZkg3WEZV?=
 =?utf-8?B?SG1qdy9iMms2K1B0VlNNcnVzNG54RnBFRWxkWTl4aXYrK0pYc0dlUFByMk5j?=
 =?utf-8?B?c25SNVY1Sk1xc2c2VkhUSDYzZm84UXA5NkVacTY5NXpSYllJdzRKUEZCNUZN?=
 =?utf-8?B?ekpibXNpQjM2ZDB0WVVtWUdnWnVZejhFZzUvWGlkSERzQjFraFBYeXJDaU9V?=
 =?utf-8?B?bWhGK0ZWd0wzZXlDTkhiNTZjelc5S0JpN29jSEpQMGhKRitHZEpBa0pTSGZn?=
 =?utf-8?B?S2xJWjJ0NmdsVVBUdHNoOFRQRVRtRUhuRjRDOVJnMGhFemJMOHljbVNuTkFy?=
 =?utf-8?B?ZnJPMEwweEltaDN3QVJaQVpSYWR4clBRbzJIZFhpYkMwL1lITHdBZi9VSkhk?=
 =?utf-8?B?ckpJdk5tYnk2UU0xbnBoUEdEaGNDcjdFRnQ0T3o1RzVpT1FULzlMazNWSVJh?=
 =?utf-8?B?Mmd4dDh1c1FTUXJIeTlZdkM5bE5udDh6TW9LRks0UjhKazBtU2d2Qkt5bFlE?=
 =?utf-8?B?OG1Fa290Uld4YmVTaDNsVmgvbDdSdklXZ3UwaVh1eDlsV0xBdzlRZlJvZXBW?=
 =?utf-8?B?bi9JcUdDbkFNZ1J3d2NhamdSVHZLamxnRXY5Tzc3WUlHcGZDMmF5aTVaeHZl?=
 =?utf-8?B?MWpxMWovWGRpZjZnM0FkTXNNTEVkb1lkeW5MOTMrR2kzeEhWUjY3WU84SGxZ?=
 =?utf-8?B?TkpxbnppcXJwMWZXTlVjWmYwSTJWcFdDMFJrNE50aVJtVnlQeHo2QTY1Qk14?=
 =?utf-8?B?dWtyZTdIYjh0bjVDVEtjemk2VW5BU1g0QlJ4Y21UZDU0ZUlreVBmNEptTmQz?=
 =?utf-8?B?MHdnYXdEdTY2NElMb25reFlwbDNTY05FeWVNdU1XZVFnLzl0eTZ3MzFjZnFi?=
 =?utf-8?B?VGY1dlU4am9XR1pPdVJLc0hSamlZNkc0Z3FFSFNsaXFIWFZ2RHBvUGlqY0Nj?=
 =?utf-8?B?eHBJMTh0cVA3L1NjZllWOGdFVXh4WTA5QjlHdVVrK2piVzYrOHZrYkFaK01x?=
 =?utf-8?B?dFBxbEdqWS9PNHpyZlZBaU5MOVp6cTVxcjJwbTExUXluY2ErS3M2VXAvMVVV?=
 =?utf-8?B?NnB0RmlHRDQxWi9JUjQybnQzUzhqR0oxY0tqRThKdlFUK1Y3dmpFU3FFRWRW?=
 =?utf-8?B?cnhScmYzRHl2cllQaWFxazJuekVNb1B1TVgrZDE3MnlSNjVEKy90eGVFNGlB?=
 =?utf-8?B?eTBDK3l3TlU1TGtvSVhqcFNoZ0FxMG5KYk94YnoxMW0vaGFRdnhrR2JNd1JX?=
 =?utf-8?B?RVl4OXh5SXdkdjJMd2FmTWk4RjlOaW4wRXlnWjh6UmxGRnBBU25La05PNnZk?=
 =?utf-8?B?TjhEWkRLRzFYMVJRSnRRS0JzSGVMeUJiOU82M0hQdEp0U1UrRC9sUlBMUVlS?=
 =?utf-8?B?cHZqNkVlckh5K00waFZiYVAwWkxBUGRNUHR5bmZBemhweCtjZzErSUMzWm45?=
 =?utf-8?B?M2lVTmk0U0FJTmlidUVWaFVaNjNvWEZhMThkR2Zub1ppQVZyT2pJaU1nUStI?=
 =?utf-8?B?RmRwT0dVd3BKUVEzK0tOM2ozeTdxc0FwVDVramxLTUJFVkN1YlVtK3AzRkow?=
 =?utf-8?B?MVlMT1VDSDF0cGNjRXRqMDRHZVE3ZkhhdjhIVHc0cWNKQ2M3MDhpN3E3cml2?=
 =?utf-8?B?Umd0Wm1USEd2K2Jaa2FVZlNUU29yd1BzajNoWVU0NDN2MGxjaEdXMHBsV3dW?=
 =?utf-8?B?cWllY1RUOHFYb3Yrcm9LMy9oc1A3eWNNYzJQR28zd0drSGtZZFczVTZuNWJv?=
 =?utf-8?B?d1A4YWI3RXZrZVZvYjZvTjdXRlRKT1R0TmtvL1k1blBqWGFWNHVLazVsUWJs?=
 =?utf-8?B?bWlZR2tmYzZjRGErMGJWUjF5SWozSkZ4WE02RGNnYXZsR1ZackZPaXNBQW9J?=
 =?utf-8?B?Y1o3N29VYUVGYWZSRXMzM050cndlS2pPUmpXbE9tSWl6bnZLaEk2MTVTK0x2?=
 =?utf-8?B?ZUhCOUZ2M05iMnlTVmtaOGQvV0NyeGlzMWEvUXQwbnJ6U0ZZR05ETG1KZHRO?=
 =?utf-8?B?clF5Z3ZzcHE5RFBhRTVkRGZTTjk0QjdmYjNHek91bVBXODBVTFprblJ4a0tj?=
 =?utf-8?B?c3Rzb1JKUzBnRG5keEY0aEhoNXJCaHU0ZkxXM3l1eHVBV0FoV3FMdTJkZVhG?=
 =?utf-8?B?L0JUWVF2M3Rya0ljTG5PSGdXUVF3M08xZ1REaE9tWWhvd1NsUjZ5U0daNmhY?=
 =?utf-8?B?cnZRSEFGZSs4Mno1OEwxcWE1SW9KQVh6c3V3ODNSeVk1N2VHdU96ZlBLYVNS?=
 =?utf-8?B?V2JyMFNMbU5RZ2RXeXdkOGZaZ2FVT0h1aGNBWVZ0bGJCMC9zRzdQNUpSTEpW?=
 =?utf-8?Q?we05s3DyRKmDHN2A=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5f6ed142-21ba-4d78-6b08-08da2f63f519
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 May 2022 13:25:58.8416
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zAazuu2GtxJprTyQeY91/j1nfZX04g0w4SLdryuvTkVnTPkPizS8rZHZyKV1WPUy5ns9S7cQHWuiom4st3XqDg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR03MB6668

On Mon, Apr 25, 2022 at 10:41:23AM +0200, Jan Beulich wrote:
> This is a re-usable helper (kind of a template) which gets introduced
> without users so that the individual subsequent patches introducing such
> users can get committed independently of one another.
> 
> See the comment at the top of the new file. To demonstrate the effect,
> if a page table had just 16 entries, this would be the set of markers
> for a page table with fully contiguous mappings:
> 
> index  0 1 2 3 4 5 6 7 8 9 A B C D E F
> marker 4 0 1 0 2 0 1 0 3 0 1 0 2 0 1 0
> 
> "Contiguous" here means not only present entries with successively
> increasing MFNs, each one suitably aligned for its slot, but also a
> respective number of all non-present entries.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> ---
> v3: Rename function and header. Introduce IS_CONTIG().
> v2: New.
> 
> --- /dev/null
> +++ b/xen/arch/x86/include/asm/pt-contig-markers.h
> @@ -0,0 +1,105 @@
> +#ifndef __ASM_X86_PT_CONTIG_MARKERS_H
> +#define __ASM_X86_PT_CONTIG_MARKERS_H
> +
> +/*
> + * Short of having function templates in C, the function defined below is
> + * intended to be used by multiple parties interested in recording the
> + * degree of contiguity in mappings by a single page table.
> + *
> + * Scheme: Every entry records the order of contiguous successive entries,
> + * up to the maximum order covered by that entry (which is the number of
> + * clear low bits in its index, with entry 0 being the exception using
> + * the base-2 logarithm of the number of entries in a single page table).
> + * While a few entries need touching upon update, knowing whether the
> + * table is fully contiguous (and can hence be replaced by a higher level
> + * leaf entry) is then possible by simply looking at entry 0's marker.
> + *
> + * Prereqs:
> + * - CONTIG_MASK needs to be #define-d, to a value having at least 4
> + *   contiguous bits (ignored by hardware), before including this file,
> + * - page tables to be passed here need to be initialized with correct
> + *   markers.

Not sure it's very relevant, but might we worth adding that:

- Null entries must have the PTE zeroed except for the CONTIG_MASK
  region in order to be considered as inactive.

> + */
> +
> +#include <xen/bitops.h>
> +#include <xen/lib.h>
> +#include <xen/page-size.h>
> +
> +/* This is the same for all anticipated users, so doesn't need passing in. */
> +#define CONTIG_LEVEL_SHIFT 9
> +#define CONTIG_NR          (1 << CONTIG_LEVEL_SHIFT)
> +
> +#define GET_MARKER(e) MASK_EXTR(e, CONTIG_MASK)
> +#define SET_MARKER(e, m) \
> +    ((void)((e) = ((e) & ~CONTIG_MASK) | MASK_INSR(m, CONTIG_MASK)))
> +
> +#define IS_CONTIG(kind, pt, i, idx, shift, b) \
> +    ((kind) == PTE_kind_leaf \
> +     ? (((pt)[i] ^ (pt)[idx]) & ~CONTIG_MASK) == (1ULL << ((b) + (shift))) \
> +     : !((pt)[i] & ~CONTIG_MASK))
> +
> +enum PTE_kind {
> +    PTE_kind_null,
> +    PTE_kind_leaf,
> +    PTE_kind_table,
> +};
> +
> +static bool pt_update_contig_markers(uint64_t *pt, unsigned int idx,
> +                                     unsigned int level, enum PTE_kind kind)
> +{
> +    unsigned int b, i = idx;
> +    unsigned int shift = (level - 1) * CONTIG_LEVEL_SHIFT + PAGE_SHIFT;
> +
> +    ASSERT(idx < CONTIG_NR);
> +    ASSERT(!(pt[idx] & CONTIG_MASK));
> +
> +    /* Step 1: Reduce markers in lower numbered entries. */
> +    while ( i )
> +    {
> +        b = find_first_set_bit(i);
> +        i &= ~(1U << b);
> +        if ( GET_MARKER(pt[i]) > b )
> +            SET_MARKER(pt[i], b);

Can't you exit early when you find an entry that already has the
to-be-set contiguous marker <= b, as lower numbered entries will then
also be <= b'?

Ie:

if ( GET_MARKER(pt[i]) <= b )
    break;
else
    SET_MARKER(pt[i], b);

Thanks, Roger.

