Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A4A1461B0B
	for <lists+xen-devel@lfdr.de>; Mon, 29 Nov 2021 16:35:41 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.234633.407185 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mriga-0004DO-VU; Mon, 29 Nov 2021 15:35:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 234633.407185; Mon, 29 Nov 2021 15:35:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mriga-0004Ao-Rn; Mon, 29 Nov 2021 15:35:20 +0000
Received: by outflank-mailman (input) for mailman id 234633;
 Mon, 29 Nov 2021 15:35:19 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=PMap=QQ=citrix.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1mrigZ-0003uH-9R
 for xen-devel@lists.xenproject.org; Mon, 29 Nov 2021 15:35:19 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f37ff202-5129-11ec-b941-1df2895da90e;
 Mon, 29 Nov 2021 16:35:17 +0100 (CET)
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
X-Inumbo-ID: f37ff202-5129-11ec-b941-1df2895da90e
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1638200117;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:content-transfer-encoding:mime-version;
  bh=ph/X2ZwqZu0ieAmEwiGCwAGLojJcuNIfdJOJKGHvGLA=;
  b=Cv7BLeJf0fjIlkFUdyezehX4GqeOS+CKTFuSwQb0JAd0++IwB3BFaxA9
   FljazwUSBni2J2hnJJL8v/yDWINfNLds5rsI/SaqnKddjO3akJa6KeBzi
   8yAMLquUBywjP32yW+QzYJ7quIDuWHHtTrN4np4/AA4NEovUimLQ+Jybd
   E=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: FCqrLPBAUUqUqD8x0Ab7jEpcsbXT8FNNTM5AFyCa5dWpK1PbZKn+SC+i3qbSwvmufAMhFoYwyU
 7JCRfahQDeWMrrOqvthF5DDVjqZgGHjZNpBbGSgptWNxJFfnttjrWSzLcCQf836AE47v6nXGUc
 AOlB8zBuizTsRnyoyKmPX5eS1FqFkk3B/6zyg041+ZlK17reMNSk8sw76q/VkWxb/ZeOablK+Q
 rem0IjiUnbGfr91u9x3F38+kTb86FUH84++IqSfZvzkKSqs5zGJ9s2e4DPVeluwR39g7RY9wcu
 qlWAW8b9U9UKJ2upcBwmBfGE
X-SBRS: 5.1
X-MesageID: 60839634
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:10kzG6lYj5VJT3wv2iDYuxHo5gx9IURdPkR7XQ2eYbSJt1+Wr1Gzt
 xIfWmqDb/6MNmanfNt2YN6wpBsBucDWnIVkS1ZprihnHiMWpZLJC+rCIxarNUt+DCFioGGLT
 Sk6QoOdRCzhZiaE/n9BClVlxJVF/fngqoDUUYYoAQgsA187IMsdoUg7wbdg29Q52YHR7z6l4
 rseneWOYDdJ5BYsWo4kw/rrRMRH5amaVJsw5zTSVNgT1LPsvyB94KE3fMldG0DQUIhMdtNWc
 s6YpF2PEsE1yD92Yj+tuu6TnkTn2dc+NyDW4pZdc/DKbhSvOkXee0v0XRYRQR4/ttmHozx+4
 PVSpc2iEwIyBZHJmscFEB1FTGJDHpQTrdcrIVDn2SCS50jPcn+qyPRyFkAme4Yf/46bA0kXq
 6ZecmpUKEne2aTmm9pXScE17ignBNPsM44F/Glp0BnSDOo8QICFSKLPjTNd9Glo1psfQ62CD
 yYfQQBddSnDQSF3AX08AsMwkeO0r0XVLjIN/Tp5ooJoujOOnWSdyoPFMtXPfceRbd5IhUver
 WXDl0z7CBwHMN2UyRKe72mhwOTImEvTR4Y6BLC+sPlwjzW71mEVTREbS1a/if24kVKlHcJSL
 VQO/SgjprR081akJvH8QB+QsHOCpgQbWddbD6s98g7l90bPy1/HXC5eFGcHMYF48p9tLdA36
 rOXt/P2FW196riOck6Y9JSM7jevZmsoDlZXMEfoUjA5y9XkpYgyiDfGQdBiDLO5g7XJJN3g/
 9yZhHNg3utO1Kbnw43+pAma2Gz0+vAlWyZsvl2PNl9J+D+Vc2JMi2aAzVHApchNI4+CJrVql
 ChVwpPOhAzi4HzkqcBsfAnvNOzxjxpmGGeF6bKKI3XG327zk0NPhagKvFlDyL5Ba67ogwPBb
 k7Joh9275ROJnasZqIfS9vvUJRzl/S/T4+8Bqy8gj9yjn5ZLlXvEMZGPxD44owQuBJ0zfFX1
 WmzLK5A8kr2+Yw4lWHrFo/xIJcgxzwkxHO7eHwI50/P7FZqX1bMEe1tGALXNogRtfrYyC2Io
 4c3H5bbkH13DbyhChQ7BKZOdDjm21BgXsuowyGWH8beSjdb9JYJV6WMnOh/ItM9xMy4VI7gp
 xmAZ6OR83Km7VXvIgSWcHFzLrTpWJd0t3UgOiIwe12v3hAejUyHtc/zrrM7Iusq8vJN1/lxQ
 6VXcsmMGK0XGD/G5y4cfd/2q4k7LEanggeHPiyEZjkjfsE/G1yVq4G8Jga/pjMTCieXtNclp
 +Hy3A3sXpdeFR9pC9zbaazzwgrp72Qdgu97Q2DBPsJXJBf36IFvJiGo1q03LsgAJA/t3Dyf0
 wrKUx4UqfOU+90+8cXThLDCpICsSrMsEk1fFmjdzLC3KSiFoTbznd4eCL6FJGmPWnn19aOuY
 fRu48v9aPBXzkxXt4dcEqpwyf5s7dXYuLIHnB9vG2/Gbgr3B+o4cGWGx8RGqoZE2qRd5VmtQ
 kuK99RXZeeJNcfiHAJDLQYpdL3eh/Qdmz2U5vUpOkTqoiRw+ePfA0lVOhCNjg1bLad0b9x5k
 btw5pZO5lztkAcuP/aHkjtQpjaFIXE3Wqk6so0XXd3wgQ0xx1AeOZHRB0caOn1Uhwmg5qXyH
 gKpuQ==
IronPort-HdrOrdr: A9a23:jYAlqK+95H6T19H9+81uk+FCdb1zdoMgy1knxilNoENuHfBwxv
 rDoB1E73LJYVYqOU3Jmbi7Sc29qBTnhOJICOgqTMqftWzd1ldAQ7sSi7cKrweQeREWs9Qtrp
 uIEJIOeeEYb2IK9PoSiTPQe71LoKjlgdCVbKXlvg1QpGlRGt9dBmxCe2Gm+yNNNWx77c1TLu
 vi2iMLnUvrRV0nKuCAQlUVVenKoNPG0LrgfB49HhYirC2Dlymh5rLWGwWRmk52aUIC/Z4StU
 z+1yDp7KSqtP+2jjfaym/o9pxT3P/s0MFKCsCggtUcbh/slgGrToJ8XKDqhkF5nMifrHIR1P
 XcqRYpOMp+r1vXY2GOuBPonzLt1T4/gkWSgGOwsD/Gm4jUVTg6A81OicZyaR3C8Xctu9l6ze
 Ziw3+Zn4A/N2KAoA3No/zzEz16nEu9pnQv1cQJiWZEbIcYYLhN6aQC4UJuFosaFi6S0vFoLA
 BXNrCe2B9qSyLZU5iA1VMfheBEH05DUStue3Jy+vB8iFNt7TREJ0hx/r1oop5PzuN7d3B+3Z
 W3Dk1frsA4ciYnV9MPOA4/e7rDNoW0e2O1DIuzGyWuKEhVAQOHl3bIiI9FkN1CPqZ4iqcPpA
 ==
X-IronPort-AV: E=Sophos;i="5.87,273,1631592000"; 
   d="scan'208";a="60839634"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BWweiMqyZGFoe0KTPIbvfFBn3y25soiScgrZ2gTYrQUE1G4KZ8aka5eREK+fJQhYNLDJJZ4lMmh2B4TqhMPPhYsS/oxkgggmLejKbwsshQFcKfjaZ9/AwPJZkdKL1FlfiJcfmv6qLEvFvZEthrwKfYayxGvOVRHfxKHDUAjiMI0IwNboYpQPCmpmP8Azm/b62WIqsyx3GbH7xSTnqdo5mRrfN7nnKh5dPWJAEFW8DD6tMEHBxg8aMi84p/g6aOuQxdxRvuHAv6QRSIaD8pa2z3ZYpNRx3DxR3oIlAegEZSDLvi0XDmiNtAQ3vz0vGeDR/XPEKLsqwxGupzqmQLFItA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=81CFV+SYBzukKNB1TyKMFdrip578PFrTXbUhz3TDIu4=;
 b=mRahXzvniGc6Lp/J6oWiSuKRJRbjh9yrmENYPXOKV1B8/8+jCz/1awQ+woGR8SAn+MpjnuYDOiSrKzvFsvLaSTcdw983TurXwVuXsCc7t4VxIN8rK9BK7eqyMiPTcOGlkUdjnq5luAFyGHJXfWZ8ePfcp+SWBPxIUgnF3wTQfD2w/I3hpqACnkazFdLMQC4EKiRGbn8ssjtBdvl1R8xu4IY0QuPVavU+OSUPPzu/knkQK160J8LbAdGpYK66ObYjfWhKWPD0spqImUUYsw4L6VDql1iYZVbe48haw2boVEMdtg/0AHxfEKS8e/+c4XaLlzJBdXDA3Oa6qzZbD5MY1w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=81CFV+SYBzukKNB1TyKMFdrip578PFrTXbUhz3TDIu4=;
 b=PhnnU5tl++bbDdVKAbIvIEHUZuG4NAYdiRPT9j5fUTxq77YMdXqSxLx1MhoyWHCC5n9W5v45bK1EflP5rNoqMYQuAm2kVmA7x8Z2SWsngxD8M9UGxcdunTK3IWdECwCkRORp0ijJcmHaXQnfFVE1lDZ/0aI5UCupvnIUIcLY9L4=
From: Roger Pau Monne <roger.pau@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Roger Pau Monne <roger.pau@citrix.com>, Ian Jackson <iwj@xenproject.org>,
	Wei Liu <wl@xen.org>, Juergen Gross <jgross@suse.com>, Jan Beulich
	<jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>
Subject: [PATCH v5 01/12] libs/guest: move cpu policy related prototypes to xenguest.h
Date: Mon, 29 Nov 2021 16:33:44 +0100
Message-ID: <20211129153355.60338-2-roger.pau@citrix.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211129153355.60338-1-roger.pau@citrix.com>
References: <20211129153355.60338-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MR1P264CA0078.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:501:3f::24) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b34530db-09ce-4af1-d692-08d9b34dd4eb
X-MS-TrafficTypeDiagnostic: DM5PR03MB2842:
X-Microsoft-Antispam-PRVS: <DM5PR03MB2842851B1CBE9A9F0B2E4E778F669@DM5PR03MB2842.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5797;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: T6OWHDQ6MxqSELy8v6zjIkJzKUpfTjRJUDlBFMVguAT9SUKPTmf4N9CsOvBxBMX7E8Vwz0bjd6/PGGfzjgWRup2kk/E4rvqjzyFOQmacT7QBndIvZZdygXpOT/qJlBDKFB37he3FUCvo4+XWtclFgp92QcZ/EVsiL8VGyF8v7yyVg5a3BbdTDTFCkHSZGvAZzKeiSke/cpT31BpyVaySk0yJn2IjBZ3nwi5l9SDdE8fbE8t+yEaAI816Zd26mFhQsjNragq4MKSnd3nG1MvoQoegW9naK8Irc+MH0HPxPW8eA9zY5booAfD9dfTO+YD2dU1TsIlEHtX7iPo9lzWPTAVMHZaIAVj4zfz+my4GwOyome/ep3SWzQCamK/YaGf/T5ER6s8cyH+EU/kTdmkhYfUoA64rAs39u3NVMD2yl/5JG7T9bxT+lwtwuYnWKzd2uA7J3S9lkEWbbEGxVzKXIwrj9WHTpyw3Lbs1TFmWrlCFRJvpH/52Z4xKkWVf63YsKJU1sg48Xe5EeQyPZbC5CE+V+uQztyqW+VbH+SMEGUdIiqSN+NsjnZoFhhJhQXqTrjPLEopk11YOR1bfhOXDJ+pz19LpDM9n7v99O1Vn/OnxCa8XbjfwCfoAgpctg1H1UxOTqjBBtGKS+UdJE5WHCQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(5660300002)(86362001)(54906003)(8936002)(107886003)(2906002)(66946007)(6486002)(316002)(8676002)(956004)(6916009)(82960400001)(4326008)(6666004)(66476007)(66556008)(186003)(83380400001)(38100700002)(2616005)(26005)(508600001)(1076003)(36756003)(6496006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TkVHenh6cXRUT0RJQzh0QkVkUGNBSHkwREc5UGUyRStQZmZnOW9wVy8vTjFY?=
 =?utf-8?B?VDgzdmNHcVBKam1CN3M4S3ZWaE15SWx4UGZ5dEJIakptd1pmZDdSTmhBWDJS?=
 =?utf-8?B?ZzA2UTdBWnl5VzNJaW5WM2pBNWRwUnE1blp5ZTZZekt2Rkd1WDNpeWorRlRn?=
 =?utf-8?B?R3ZxYmtyc2VVZnhhbVhuNG95d0Q0a2FNdW54dmw3TTY2ZkRjUkRWM2FXcy9T?=
 =?utf-8?B?VzFCRnpEZHZmaTBOYkZVaVF0cWVDL05ValNXU3VlWFJUUUlvUENKczRJMmZK?=
 =?utf-8?B?WFlvUi9xZjV6dlI4eGwwckNCNnJzMXRvejNSQ21YT1B3OUtTQ3d4UlhoT1Vk?=
 =?utf-8?B?ekp6Z0RzRFFEMmZUN2pLcURQNjB6SEt3VmVwK0R6RC8zWFJIOExOd3ZCUWtq?=
 =?utf-8?B?WWc2Zkg2RUR4MW8wQUc1dnE3LzQwZDZ4dVFNa1FCVVpJRU1SQ2ZDMFl1TitN?=
 =?utf-8?B?MmF5VmJNZHBackZyTlRTSko4QnNGQlJ1Z01ZZmtsOVZHcWM1dDVKUVBTOC9C?=
 =?utf-8?B?Zk1RanpkcW8rRkhnaHlaTzNMTGFXMFJ2OTF3dTUrSXJ5YUFRWFhkQUN1T0NI?=
 =?utf-8?B?L1NGQzNWYkNhR1pmV0ZGQjNNbHc4U1c2dForbVNPYnhBUEs2Q1d3M0d3ekJH?=
 =?utf-8?B?b1pvLzhXVkw4ZERpMlFDTFRNc01xZTdhU3JyMkxjVlk4L1lEQU1HbWVkeFo3?=
 =?utf-8?B?NFovSEJYR0ZEMkpLdkllWHZwbTIvK3FVdVp0UjNkbkhlaEdjOHMzWS9qdHgy?=
 =?utf-8?B?aWNBczA5cHlxWUVpVlo1OFlPR1pMWG9oNEpPeEY2cG93ZXUzZjBGTTZqWktZ?=
 =?utf-8?B?dC9vWGtqSytKSnhjWXN5dEJDVG9qQmJVbS91R1JZM2JwVUlySUJqangzOU8x?=
 =?utf-8?B?YmZOeHRodSsxVWpPZk1WbVNZdHQ2R0luT2tMdnlrUG9ISU5IWEZRbXUxeDFs?=
 =?utf-8?B?dUxHNXNaQ1p1NDdMdXFuWlV3RzV1QXU2VW1VS2Y1d0V5OW8rTHU0cTluY00y?=
 =?utf-8?B?NTBrWi9uZzQ0bHNpOVhJN0FJOUJpU0tOQ01hZElEQnZTYmFmeDRxbHFpS3hM?=
 =?utf-8?B?Yk43ZG05MzlCdDcyM0I2QU01R1BQd0RxaEVUUWxHa21sQXJRei81MmFwME5F?=
 =?utf-8?B?NlhtWmxDdDRVWFJFWml4dlZzQVAxRmFSMGl1cGE5TWtKWjJ1ZnlzZjhYVUZi?=
 =?utf-8?B?YzR4QmEwM2djM0ZyaTZJdlNnK1U2aWNNSkNsaUNMenpLZXNudEJyaWRtYVV5?=
 =?utf-8?B?MnRCb0R4Y01WbzlLcWo2dWxacHVMWCtWajN0NGNsY0w0d25SNlNrS3pFVzRm?=
 =?utf-8?B?UTJtbUZQdHBvMzdPTXo2aUVPT1VSRWc0dlVmd3RPTGNibU5SZXVxR3NkVGVS?=
 =?utf-8?B?STUvWXAvMWJIcmwrVi81YW8xTmpiTS83cWdLRk1UdmUzZ3ZxalYwMmtqMU5L?=
 =?utf-8?B?eGlobWxtZnBQQUVENWgvNzNUWHFEaE5vOGhyK3RncExteHdNcEZJbUJmZUlw?=
 =?utf-8?B?NXU3ZGNrNkM4MFZPNTBkMVVHaUdyemFyOWpMMWtwRmZWSmtGZGxNVkw4QWp3?=
 =?utf-8?B?eWxiWHIyWUlwZTBENG1KSGhNY0lERzlNdlcwUWRQcEVEbFFDblpzKzlYaHUw?=
 =?utf-8?B?L2gvKy83R053VnM2YWlhREVRUjdNME9MWGZNYktwTTNpSXRFU1phY2lGRG91?=
 =?utf-8?B?ZjVmOGhaUVlvbzF3OVRFazlKYXJHaU16WEZjOW9QRGlva2h4V29ZUG8xeEJm?=
 =?utf-8?B?NmhPTWpBanJtbHVnNWd4NVl4a3R1UmVEWmRsTzkwWUhxY3ZnVGVHY3BpcUJL?=
 =?utf-8?B?Tmd5OFdoWXNvZ2NUc2RwOTFMWVNlMDZLQnRkbzBiVXE2RURNcEIwSnVPQnlP?=
 =?utf-8?B?N3BuQk1zRkZONWJoNDBFdGNQejIycGh1Qi8rRndlalRDOWluVFRnOWtGWXM0?=
 =?utf-8?B?UWtremVXWXlNa1JNbDZNTUwySnMxNTRNcnk3WUIvalBHVkEzdjNUQUtLRFJT?=
 =?utf-8?B?ZHdRRHFqRktQOVhNY09sblozT3dFYjhKdjlvMGZ1TGlPdUM0TGJTVkdrU0s4?=
 =?utf-8?B?WnVBeUhhdzVqdE9Bb2psTlVnMDFrK2xBbmJkZm5DNndMSHRpSXRNOXBxRGc0?=
 =?utf-8?B?dTFxcFpTK1NwekphbFhNUSs4Mlh0NHNvNHJVVW94TkN0UG0xdHB6YlVNS0JL?=
 =?utf-8?Q?qXDn/6APQqFflncAOclrd1U=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b34530db-09ce-4af1-d692-08d9b34dd4eb
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Nov 2021 15:35:11.7029
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OpFF6AL3L5otYcMR+oLn/2ngNk1aRNbE34g47graF+BQpezel0XIQoLQE2w8tH98e1pez/camWMBnvqUKDD/Dw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR03MB2842
X-OriginatorOrg: citrix.com

Do this before adding any more stuff to xg_cpuid_x86.c.

The placement in xenctrl.h is wrong, as they are implemented by the
xenguest library. Note that xg_cpuid_x86.c needs to include
xg_private.h, and in turn also fix xg_private.h to include
xc_bitops.h. The bitops definition of BITS_PER_LONG needs to be
changed to not be an expression, so that xxhash.h can use it in a
preprocessor if directive.

As a result also modify xen-cpuid and the ocaml stubs to include
xenguest.h.

Reported-by: Andrew Cooper <andrew.cooper3@citrix.com>
Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
Changes since v1:
 - Include xenguest.h in ocaml stubs.
 - Change BITS_PER_LONG definition in xc_bitops.h.
---
 tools/include/xenctrl.h         | 55 --------------------------------
 tools/include/xenguest.h        | 56 +++++++++++++++++++++++++++++++++
 tools/libs/ctrl/xc_bitops.h     |  6 +++-
 tools/libs/guest/xg_cpuid_x86.c |  1 -
 tools/libs/guest/xg_private.h   |  1 +
 tools/misc/xen-cpuid.c          |  1 +
 6 files changed, 63 insertions(+), 57 deletions(-)

diff --git a/tools/include/xenctrl.h b/tools/include/xenctrl.h
index 07b96e6671..95bd5eca67 100644
--- a/tools/include/xenctrl.h
+++ b/tools/include/xenctrl.h
@@ -2528,61 +2528,6 @@ int xc_psr_get_domain_data(xc_interface *xch, uint32_t domid,
                            uint64_t *data);
 int xc_psr_get_hw_info(xc_interface *xch, uint32_t socket,
                        xc_psr_feat_type type, xc_psr_hw_info *hw_info);
-
-typedef struct xc_cpu_policy xc_cpu_policy_t;
-
-/* Create and free a xc_cpu_policy object. */
-xc_cpu_policy_t *xc_cpu_policy_init(void);
-void xc_cpu_policy_destroy(xc_cpu_policy_t *policy);
-
-/* Retrieve a system policy, or get/set a domains policy. */
-int xc_cpu_policy_get_system(xc_interface *xch, unsigned int policy_idx,
-                             xc_cpu_policy_t *policy);
-int xc_cpu_policy_get_domain(xc_interface *xch, uint32_t domid,
-                             xc_cpu_policy_t *policy);
-int xc_cpu_policy_set_domain(xc_interface *xch, uint32_t domid,
-                             xc_cpu_policy_t *policy);
-
-/* Manipulate a policy via architectural representations. */
-int xc_cpu_policy_serialise(xc_interface *xch, const xc_cpu_policy_t *policy,
-                            xen_cpuid_leaf_t *leaves, uint32_t *nr_leaves,
-                            xen_msr_entry_t *msrs, uint32_t *nr_msrs);
-int xc_cpu_policy_update_cpuid(xc_interface *xch, xc_cpu_policy_t *policy,
-                               const xen_cpuid_leaf_t *leaves,
-                               uint32_t nr);
-int xc_cpu_policy_update_msrs(xc_interface *xch, xc_cpu_policy_t *policy,
-                              const xen_msr_entry_t *msrs, uint32_t nr);
-
-/* Compatibility calculations. */
-bool xc_cpu_policy_is_compatible(xc_interface *xch, xc_cpu_policy_t *host,
-                                 xc_cpu_policy_t *guest);
-
-int xc_get_cpu_levelling_caps(xc_interface *xch, uint32_t *caps);
-int xc_get_cpu_featureset(xc_interface *xch, uint32_t index,
-                          uint32_t *nr_features, uint32_t *featureset);
-
-int xc_cpu_policy_get_size(xc_interface *xch, uint32_t *nr_leaves,
-                           uint32_t *nr_msrs);
-int xc_set_domain_cpu_policy(xc_interface *xch, uint32_t domid,
-                             uint32_t nr_leaves, xen_cpuid_leaf_t *leaves,
-                             uint32_t nr_msrs, xen_msr_entry_t *msrs,
-                             uint32_t *err_leaf_p, uint32_t *err_subleaf_p,
-                             uint32_t *err_msr_p);
-
-uint32_t xc_get_cpu_featureset_size(void);
-
-enum xc_static_cpu_featuremask {
-    XC_FEATUREMASK_KNOWN,
-    XC_FEATUREMASK_SPECIAL,
-    XC_FEATUREMASK_PV_MAX,
-    XC_FEATUREMASK_PV_DEF,
-    XC_FEATUREMASK_HVM_SHADOW_MAX,
-    XC_FEATUREMASK_HVM_SHADOW_DEF,
-    XC_FEATUREMASK_HVM_HAP_MAX,
-    XC_FEATUREMASK_HVM_HAP_DEF,
-};
-const uint32_t *xc_get_static_cpu_featuremask(enum xc_static_cpu_featuremask);
-
 #endif
 
 int xc_livepatch_upload(xc_interface *xch,
diff --git a/tools/include/xenguest.h b/tools/include/xenguest.h
index 61d0a82f48..e01f494b77 100644
--- a/tools/include/xenguest.h
+++ b/tools/include/xenguest.h
@@ -782,4 +782,60 @@ xen_pfn_t *xc_map_m2p(xc_interface *xch,
                       unsigned long max_mfn,
                       int prot,
                       unsigned long *mfn0);
+
+#if defined(__i386__) || defined(__x86_64__)
+typedef struct xc_cpu_policy xc_cpu_policy_t;
+
+/* Create and free a xc_cpu_policy object. */
+xc_cpu_policy_t *xc_cpu_policy_init(void);
+void xc_cpu_policy_destroy(xc_cpu_policy_t *policy);
+
+/* Retrieve a system policy, or get/set a domains policy. */
+int xc_cpu_policy_get_system(xc_interface *xch, unsigned int policy_idx,
+                             xc_cpu_policy_t *policy);
+int xc_cpu_policy_get_domain(xc_interface *xch, uint32_t domid,
+                             xc_cpu_policy_t *policy);
+int xc_cpu_policy_set_domain(xc_interface *xch, uint32_t domid,
+                             xc_cpu_policy_t *policy);
+
+/* Manipulate a policy via architectural representations. */
+int xc_cpu_policy_serialise(xc_interface *xch, const xc_cpu_policy_t *policy,
+                            xen_cpuid_leaf_t *leaves, uint32_t *nr_leaves,
+                            xen_msr_entry_t *msrs, uint32_t *nr_msrs);
+int xc_cpu_policy_update_cpuid(xc_interface *xch, xc_cpu_policy_t *policy,
+                               const xen_cpuid_leaf_t *leaves,
+                               uint32_t nr);
+int xc_cpu_policy_update_msrs(xc_interface *xch, xc_cpu_policy_t *policy,
+                              const xen_msr_entry_t *msrs, uint32_t nr);
+
+/* Compatibility calculations. */
+bool xc_cpu_policy_is_compatible(xc_interface *xch, xc_cpu_policy_t *host,
+                                 xc_cpu_policy_t *guest);
+
+int xc_get_cpu_levelling_caps(xc_interface *xch, uint32_t *caps);
+int xc_get_cpu_featureset(xc_interface *xch, uint32_t index,
+                          uint32_t *nr_features, uint32_t *featureset);
+
+int xc_cpu_policy_get_size(xc_interface *xch, uint32_t *nr_leaves,
+                           uint32_t *nr_msrs);
+int xc_set_domain_cpu_policy(xc_interface *xch, uint32_t domid,
+                             uint32_t nr_leaves, xen_cpuid_leaf_t *leaves,
+                             uint32_t nr_msrs, xen_msr_entry_t *msrs,
+                             uint32_t *err_leaf_p, uint32_t *err_subleaf_p,
+                             uint32_t *err_msr_p);
+
+uint32_t xc_get_cpu_featureset_size(void);
+
+enum xc_static_cpu_featuremask {
+    XC_FEATUREMASK_KNOWN,
+    XC_FEATUREMASK_SPECIAL,
+    XC_FEATUREMASK_PV_MAX,
+    XC_FEATUREMASK_PV_DEF,
+    XC_FEATUREMASK_HVM_SHADOW_MAX,
+    XC_FEATUREMASK_HVM_SHADOW_DEF,
+    XC_FEATUREMASK_HVM_HAP_MAX,
+    XC_FEATUREMASK_HVM_HAP_DEF,
+};
+const uint32_t *xc_get_static_cpu_featuremask(enum xc_static_cpu_featuremask);
+#endif /* __i386__ || __x86_64__ */
 #endif /* XENGUEST_H */
diff --git a/tools/libs/ctrl/xc_bitops.h b/tools/libs/ctrl/xc_bitops.h
index f0bac4a071..4a776dc3a5 100644
--- a/tools/libs/ctrl/xc_bitops.h
+++ b/tools/libs/ctrl/xc_bitops.h
@@ -6,7 +6,11 @@
 #include <stdlib.h>
 #include <string.h>
 
-#define BITS_PER_LONG (sizeof(unsigned long) * 8)
+#ifdef __LP64__
+#define BITS_PER_LONG 64
+#else
+#define BITS_PER_LONG 32
+#endif
 
 #define BITMAP_ENTRY(_nr,_bmap) ((_bmap))[(_nr) / 8]
 #define BITMAP_SHIFT(_nr) ((_nr) % 8)
diff --git a/tools/libs/guest/xg_cpuid_x86.c b/tools/libs/guest/xg_cpuid_x86.c
index 198892ebdf..b9e827ce7e 100644
--- a/tools/libs/guest/xg_cpuid_x86.c
+++ b/tools/libs/guest/xg_cpuid_x86.c
@@ -23,7 +23,6 @@
 #include <stdbool.h>
 #include <limits.h>
 #include "xg_private.h"
-#include "xc_bitops.h"
 #include <xen/hvm/params.h>
 #include <xen-tools/libs.h>
 
diff --git a/tools/libs/guest/xg_private.h b/tools/libs/guest/xg_private.h
index 28441ee13f..09e24f1227 100644
--- a/tools/libs/guest/xg_private.h
+++ b/tools/libs/guest/xg_private.h
@@ -27,6 +27,7 @@
 #include <sys/stat.h>
 
 #include "xc_private.h"
+#include "xc_bitops.h"
 #include "xenguest.h"
 
 #include <xen/memory.h>
diff --git a/tools/misc/xen-cpuid.c b/tools/misc/xen-cpuid.c
index 37989e4a12..e333215dce 100644
--- a/tools/misc/xen-cpuid.c
+++ b/tools/misc/xen-cpuid.c
@@ -8,6 +8,7 @@
 #include <inttypes.h>
 
 #include <xenctrl.h>
+#include <xenguest.h>
 
 #include <xen-tools/libs.h>
 
-- 
2.33.0


