Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 90C726D1D89
	for <lists+xen-devel@lfdr.de>; Fri, 31 Mar 2023 12:00:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.516965.801902 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1piBYQ-0000zN-P0; Fri, 31 Mar 2023 10:00:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 516965.801902; Fri, 31 Mar 2023 10:00:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1piBYQ-0000wM-LC; Fri, 31 Mar 2023 10:00:18 +0000
Received: by outflank-mailman (input) for mailman id 516965;
 Fri, 31 Mar 2023 10:00:17 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=uTo5=7X=citrix.com=prvs=447f045ac=roger.pau@srs-se1.protection.inumbo.net>)
 id 1piBYO-0000wE-UT
 for xen-devel@lists.xenproject.org; Fri, 31 Mar 2023 10:00:17 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d1fbc074-cfaa-11ed-b464-930f4c7d94ae;
 Fri, 31 Mar 2023 12:00:12 +0200 (CEST)
Received: from mail-co1nam11lp2173.outbound.protection.outlook.com (HELO
 NAM11-CO1-obe.outbound.protection.outlook.com) ([104.47.56.173])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 31 Mar 2023 06:00:02 -0400
Received: from SJ0PR03MB6360.namprd03.prod.outlook.com (2603:10b6:a03:395::11)
 by DS7PR03MB5557.namprd03.prod.outlook.com (2603:10b6:5:2d3::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6254.22; Fri, 31 Mar
 2023 10:00:00 +0000
Received: from SJ0PR03MB6360.namprd03.prod.outlook.com
 ([fe80::48a7:d1ab:897:acda]) by SJ0PR03MB6360.namprd03.prod.outlook.com
 ([fe80::48a7:d1ab:897:acda%6]) with mapi id 15.20.6178.041; Fri, 31 Mar 2023
 10:00:00 +0000
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
X-Inumbo-ID: d1fbc074-cfaa-11ed-b464-930f4c7d94ae
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1680256812;
  h=from:to:cc:subject:date:message-id:
   content-transfer-encoding:mime-version;
  bh=6dCMfhL/hEOv75UU34Rk44CzQCk3O+XuawbTHRORqCA=;
  b=Ei8+u4xbUW3uPlWj4MJppVk38gSEEW0/xadkvozsvKJB3I4+yPKM+llh
   nsse9kknPgy21gePkcSfKKgmLSTkH1/zoPnUJ9jFIQOG2yXqrRYB3ANYp
   aHP1D4bgLe2PS3iZ2qlEKhVdJwdooNoG1CjvSy6UNSPMItZafd6zZt2uD
   4=;
X-IronPort-RemoteIP: 104.47.56.173
X-IronPort-MID: 103170684
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:84d3O61a44C/ATqLp/bD5fVwkn2cJEfYwER7XKvMYLTBsI5bp2MFn
 GEYC2qPOqnZNmf9edl3Yd+28U1UvJ/Ty4BqSApvpC1hF35El5HIVI+TRqvS04F+DeWYFR46s
 J9OAjXkBJppJpMJjk71atANlVEliefTAOK6ULWeUsxIbVcMYD87jh5+kPIOjIdtgNyoayuAo
 tq3qMDEULOf82cc3lk8tuTS+HuDgNyo4GlD5gdlPKgS1LPjvyJ94Kw3dPnZw0TQGuG4LsbiL
 87fwbew+H/u/htFIrtJRZ6iLyXm6paLVeS/oiI+t5qK23CulQRrukoPD9IOaF8/ttm8t4sZJ
 OOhF3CHYVxB0qXkwIzxWvTDes10FfUuFLTveRBTvSEPpqFvnrSFL/hGVSkL0YMkFulfBFF1z
 b8yLAA0c06cuuuJ/rTjW+JnmZF2RCXrFNt3VnBI6xj8VK9jareaBqLA6JlfwSs6gd1IEbDGf
 c0FZDFzbRPGJRpSJlMQD5F4l+Ct7pX9W2QA9BTJ+uxqvS6Kk1cZPLvFabI5fvSQQspYhACAr
 3/u9GXlGBAKcteYzFJp91r13rSWwnulCN56+LuQrMBYn1iX4TYpKzIyT3vro/O1ul/nRIcKQ
 6AT0m90xUQoz2S7Q9+4UxCmrXqsuh8HR8EWA+A88BuKyKff/0CeHGdsZjxLZcEitcQ2bSc3z
 VLPlNTsbRRwtJWFRHTb8a2bxQ5eIgAQJG4GICQDFA0M5oC6pJlp102UCNF+DKSyk9v5Xynqx
 CyHpzQ/gLNVitMX06K8/hbMhDfESoX1czPZLz7/BgqNhj6Vrqb8D2B0wTA3Ncp9Ebs=
IronPort-HdrOrdr: A9a23:CvdseKvnn0Dyq+gN+/OJ57h77skDgNV00zEX/kB9WHVpm6yj+v
 xGUs566faUskd2ZJhEo7q90ca7Lk80maQa3WBVB8bBYOCEghrOEGgB1/qA/9SIIUSXmtK1l5
 0QFpSWYOeaMbEQt7ef3ODXKbcdKNnsytHWuQ/dpU0dMz2DvctbnnZE4gXwKDwHeOFfb6BJba
 Z1fqB81kedkXJ8VLXCOlA1G9Ltivfsj5zcbRsPF3ccmXWzZWPB0s+AL/CAtC1uKQ9y/Q==
X-IronPort-AV: E=Sophos;i="5.98,307,1673931600"; 
   d="scan'208";a="103170684"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=C1FHA07wi4bwXlN5833NcEaeRIg/ymSKWJxQvwtp9SqXg6+NncxJ5KhL7Ipg7o0yewcs/i5XFm3beoSNEJir5ksJqpcJ7Cp+Smy1pCTV0Cq97RYdn6TpBH0nO0knC8ZcRImq02QKtgJBNySt7yFRtAggJAlks9Yhb0eCGn5hkbBZePg/SrzULvzk/EBZcaBoxEgse9uezmua8fmid4ebrlF7jo0AoTh9nzSowAcr8x3Z+fLVp6M1uW0JBeqeA5aCOrgG9jLzJtSbb1aZzHG0DcpPUTbEuzdvPzMMXZbAxtZwDnc2GRDdKnLqx6oezPNypkUa5jqBNDJ5IcidXw6QSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jeRkSMfeNtcpfu4Pt7FDwXFNss6b/EzkGQuEwiSMQnI=;
 b=TwCB+rgKByMA/TtBcaE22oJQy2rCxYQ2MWpWYh5KnChy0NJiyVyhOnU6jU7pV2LGF8USrdq7tTxPco2TQiTeH/iF5cM/zobvyQp94+nfdNI8brkgOSRQULUsNzCLyB+VneqJwIUSvZ9S/GSFjZbhr9Elul3+5bmSaDJEFz9sOuCxIK31wPwlSetzQXrPhm49DL0aTE+HE/lndgJKBlj33pZb7k1Zu3x8pnGWjXPpxRT5sOo3y3fajuDxqlUWUqXraZNHf8NizqZK8WnartYRzkvEFhv83KwcVppYtYZ1p6k4e8w+jKmL+TXPLhEBfVgoNP1QBnNEsuvimS6iCaaI2Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jeRkSMfeNtcpfu4Pt7FDwXFNss6b/EzkGQuEwiSMQnI=;
 b=WfyQIDDqi0vReQDA6jr9RHZ6UzjqWoG/q6Kn18sMHdo2qhMVP19ozP7DXYHq/Nji4IZWK8ip6JoVCwrSYiyPDWNAf9EbcNK+SwEHxQg1LrmzrfkuOwbO2az3AmIa5sRy9101WtSyToSnvFS/t3IsdjivFeckHoysxjegca8mabg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Wei Liu <wl@xen.org>
Subject: [PATCH v2 0/3] gfx: improvements when using multiboot2 and EFI
Date: Fri, 31 Mar 2023 11:59:43 +0200
Message-Id: <20230331095946.45024-1-roger.pau@citrix.com>
X-Mailer: git-send-email 2.40.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO2P265CA0164.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:9::32) To SJ0PR03MB6360.namprd03.prod.outlook.com
 (2603:10b6:a03:395::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6360:EE_|DS7PR03MB5557:EE_
X-MS-Office365-Filtering-Correlation-Id: 9bee647c-1ed0-4fa5-52f4-08db31ceb0ad
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	UrX72c6PxcxaTaerZDL7tr2o0V53Uy38/mghUyyalDIvWE3kmMUOxaB26K/UV4D3M9SXtGtYstp471BBzlXEsUEtRV3F8UqEB+a7+jf3pyAsLaO2JTbDb01kGZ6bkrXChRPpZQfWDpGOGtCPgneS3T8KnvCEQpRLSqqJV/SWQPIb2nXVgtZuzcS/SIbBwWWqmu8J2q1qQzqXJZT/TJhM1kT5icHLhvEPjfB0cdiKnbH3pQM64nHhVethvvGL1uHlYVjwhARwQpHMiIjNp7x/pRRyqN4Rjx0m/Ezwx11WHuTPlovkdyimKxm1TRUabaf9ALFJIhhh6S1B/rtGIH5OY2oM77c1dD5LbtD9s5gBbuz4Hx4wnfwM+YI+jpUNkbMP/JHjAwt++ncx4Sp20tmxPjoyu94Y+JyqjCI6oCsX8/WP+bN+sZ/uDQbyzkOvZe6v9GyTpDMN2MCPqJjz1a2fp9YWZjoBXHe0Q38z/C2BR2J2wDBxy5f0jv4XB191x0WPIWWjbw/UZ4AoOmVhPqc7FPA5PKV2vT2W6eNy9k+R0Pf+4lkBH6OINbDfqCpDmqDBZZYSqUeOKjI+B61KgD5XeCLG8e1xnZny01BHQkJzPLg=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6360.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(136003)(396003)(346002)(366004)(39860400002)(376002)(451199021)(478600001)(4744005)(41300700001)(82960400001)(66556008)(66946007)(66476007)(83380400001)(2906002)(36756003)(54906003)(8676002)(316002)(4326008)(6512007)(86362001)(8936002)(186003)(26005)(6506007)(1076003)(6666004)(38100700002)(5660300002)(6916009)(6486002)(2616005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RWRiQzBJY09kTDgrSE0yaytWUzZHMVFWaGxLVUVuSjJFbmY0QWpUNm1xOFcw?=
 =?utf-8?B?WEpHbFg3RHprLzNybmIvRk1jNUxxNWxtVVdwdFcxbitrUjM5enVaSGdXTW9a?=
 =?utf-8?B?WmNmVjFKMEpaenIvN3FJbzJXbG9iZUcrcGxCQ1JuanR1MkpRaWRtcEJQTnBZ?=
 =?utf-8?B?V1R1Vm96OXk2ZkU1TENhdTU3bWsvcjJLMDhGQ2VDRnpxMTJBTGFEVU82SGpE?=
 =?utf-8?B?bitHWWJSQmcxeEpmWm9vUTJ0dDhKcENSNWtoTDBJSFJZM1J6dzVGOWQ1SkhD?=
 =?utf-8?B?bjFobUt3SlNaZ25nZU1FYStxb3dsd3RwbFZTVnVwZjB2UlZ5dVhTYnBxM2p5?=
 =?utf-8?B?NVJzT2MxdEp3Y3l3MlBlRTR2U0pmcU02cEtpSndLeUM3MjV5ZEl2MEw1bVgr?=
 =?utf-8?B?NVRaY2dVR0Q1MFd3UkY2WWs0dG10S2ZTYTBWSVdDMUhXdFROa1d6SzdyZDV0?=
 =?utf-8?B?UFNUTjlSN3o0TDFKM1ppY3A4SFFrMjhBWEMyYXdBejZicUI5a0ExK2ZsT3lQ?=
 =?utf-8?B?MnVreTQ5MWMxYTJRWHJQRTFUOEhSUGh3elJuTFlHS3dxUnNLa0xHSDlWMjds?=
 =?utf-8?B?UmJEYm15ZnlUbHRzSWlyVXRIb0lBbXpTZDJYMWx2S3NIQUU5MW9OVHhHYlli?=
 =?utf-8?B?L3NTUWFCMzVWWXFkY2VIV2lDYUt5TVlpSUVUV016V0Z3QTZ1UE5xa3VVMlpt?=
 =?utf-8?B?NUxSS3VKa3JSbW5ZYWpLZWJtTXp6emVZMkZVVFoxZVZpdXJuRzUrbFkzUkxB?=
 =?utf-8?B?TFlTZm9pNFAvN21GWFJWaEExVUx2OEUyL25PUjNBUGxYT01OOUFiVWxIbWE3?=
 =?utf-8?B?UFRFTWVWTW1UNW1LVWllZlBrNnpIMVdhUSs5ZDNkL3JITklVNU1iQlRTOEFa?=
 =?utf-8?B?dWw5MG5nNnlldU45YkpkR0d3a1labDlyNDVQZldKNUIyUm5QNXZlck83NG1M?=
 =?utf-8?B?NkZQUllVRUdwNnNwQkswa0dyaXZDcXgxQ2hXZTRYenE3WEoxNWZVYjNHaHNl?=
 =?utf-8?B?S1Q0NnltL0RsMFVOdTB0YUdMRmplK3l3M2tLT2IyaEFLWlpxWTN4eFRFNGQ2?=
 =?utf-8?B?aGRlKzVkT1lJbFR0R0NiZjZ6OVJ4ZTBnd2NtRDF5ckViT2JNS2xFVlQ4TzZa?=
 =?utf-8?B?dXNWNkpaRXYzK1dKdVQxdnIyRGg2SnhWWDdkOTl5a3FMYUJOSU1UdHpCL1ZY?=
 =?utf-8?B?RFphWERPRjJhRjZQNVQyQS96WDMydFIvNFhhM1JaMHlLUUFWbVlOUVRUYTF0?=
 =?utf-8?B?bEtlTmlzU1BsQTRiUTZGejVhem8vWUNZdkROL3RXbVJuNXpDMngzcWpVSjcx?=
 =?utf-8?B?U2hTdWt4K3FyZkRKR3pXSnkvL3JSZ2VvN3lQVkhTMTdqVEVwd203aFNoS1BU?=
 =?utf-8?B?M3pwRlhIVFljN0dRU2tCR1RlOE42cG1GZDJRNktCb211L1dWL3p0Ry9yc21R?=
 =?utf-8?B?S25sMDEyM1llcG1wWXZKTytGVlhJZ29QbFNVK0ZGRmU1YWVjS3B0ZktlMm9o?=
 =?utf-8?B?RXJIN3ZZWlJ1czNxZHBDQjdVaStWSEVHR2x4aFpKMEhIUGRES0Q2TGxIbEFQ?=
 =?utf-8?B?cXV6SHFVcFBIOXdzcjRqOTNrRkJ2Y0p6N1hDRUtLTU1NakFwa2lsalMycHha?=
 =?utf-8?B?emhtZ0lJV002ZDFZRmIyb3VJRWlUbWl4TmpwV2t6cHptd3FTbFd2NHEwZGoy?=
 =?utf-8?B?NjdHRG1QdzBKd3BpQWpmY1k0Z3RGQUxjRVUrZFJPS0YrbzI4bXpsZU5MT1NP?=
 =?utf-8?B?Ty8yMGE1UmFkcGwvK2JKMWg5bUdLRzR6WEkzdFRIOHpqNmwzRDN3T2I1K01m?=
 =?utf-8?B?bGdWYjU4R2hVQ3FnbExkbG9QZkdyT1BvalVUWW1keWlrM2trY0ZteGw0NFor?=
 =?utf-8?B?MmRnOUpVU0NkRC9xaS9TQW9hY2FuNEo2c2J6enF2THlMZHJMdGUvdmx3Ujdr?=
 =?utf-8?B?M1RBUjZZSmc2RFRqQmlVUnQ0Q0MyeG02R2VweE02ak4zbTVpQzFEU2RpRzJj?=
 =?utf-8?B?TEFNNHM2dXcybEQ5b1Z0eWt2MlhrejNCbEx4N0phZGd6M3hkK0tUbG5MS0Nn?=
 =?utf-8?B?bFJSZ2Y1QzQ1RWNzSStGMmtDVFRSQzhSLzhyODFjR2lOaHY1MGJKSlFyMHZx?=
 =?utf-8?Q?4xvhs5UDAbnmLagc9zvAY26zt?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	DlywWMIStnnJfHnGNVjNjtxC9mhQWQeO4Nam1+1IfMYlBeVN2jTqtRVT5jE5He47JCBI4AiYgmI9KyuAesxmYl3U/MTZZdADbU6qRjQFYnae1qkpr+ovoJKd1NUGKXKvLlG7yGMdYSI1CwL+//5gFOMsN6KagVfGE73Oqn6dmBAzakHIRezR+ncjOTUml0yBUI8BjFRw1HFIMqlK+oIzToZHu06eMSbxoZn06jBkaBLz26Tc4m+ailUzeiselaWJUbyW61Rwgmvs3y0U7pjWZy3P9BdRcUTscG9wxTWNf7KaGSxY4qFnIytv8ZD3ECUhPe/D2PqlDoN/3If90L2J/H248aI+zyCm4djjmAAxBN4f+XSWKOPUJfFWnVtSrmCKuqLwn653glWyEIPo7YrJ0+0+bT4ZchXoh8I6jkSX6S54edz+HgNACzEahC3GfLGTIu6sqQ+dE6rSVBC0brv+qgmdomMmigG9HFOBW2eYZgZ9dXfP0x7BunFc9344GvzF/OHOvFF1+xCi2GIY+CW/ITgmoz21ZM9je63uLp2x8wLTTZrTpcTxQVqVDgtnODvTql45RP/ddl48wegju8BqBl3HJ8IxZ1pjj1JSS0vlZGhDpGvEBC6W7jkji0v+KlgQN33CEko+g7JVgz3plYsKm5B7otzHEyeXP2BOVUSxxiXyvdmDeXKQLIc91q8tJo3LQOxGneTgsI2wheaEV5xrhQK0prOmcrDVKbPsCZT1Q1RUO6G8V95q7vJ/mdxM+rxFxFdu+OERYlDi1JWul1hqCpo3RRUtorPCGz9bm5vrl9BL9f8abZSAAw7KAwrKdDr75huoFGOV/KK4tAAg1bqkLA==
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9bee647c-1ed0-4fa5-52f4-08db31ceb0ad
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6360.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Mar 2023 10:00:00.1792
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mph9AgWIvcwP/EDIh0wjcsoCEeCb2aXAdC89PHl3bX1d7/ygZehuPf7Q8iICB/R9MQpoDIuTnE6zf6Aju/6Fjw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR03MB5557

Hello,

The following series contains some fixes and improvements related to
graphics usage when booting Xen.

Proposed patches fix some shortcomings when using multiboot2, mostly the
ignoring of the console=vga (or lack of) and the vga=gfx- parameters.
It also switches default Xen behaviour from trying to reuse the
currently set GOP mode instead of attempting to set the maximum
supported resolution.

Thanks, Roger.

Roger Pau Monne (3):
  efi: try to use the currently set GOP mode
  multiboot2: parse console= and vga= options when setting GOP mode
  multiboot2: do not set StdOut mode unconditionally

 xen/arch/x86/boot/head.S          | 13 ++++-
 xen/arch/x86/efi/efi-boot.h       | 95 ++++++++++++++++++++++++++++---
 xen/arch/x86/x86_64/asm-offsets.c |  1 +
 xen/common/efi/boot.c             | 21 +++++++
 4 files changed, 120 insertions(+), 10 deletions(-)

-- 
2.40.0


