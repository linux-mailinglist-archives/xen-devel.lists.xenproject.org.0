Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B0B26FC422
	for <lists+xen-devel@lfdr.de>; Tue,  9 May 2023 12:43:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.532088.828094 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pwKnx-0007ds-4d; Tue, 09 May 2023 10:42:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 532088.828094; Tue, 09 May 2023 10:42:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pwKnx-0007b9-1R; Tue, 09 May 2023 10:42:49 +0000
Received: by outflank-mailman (input) for mailman id 532088;
 Tue, 09 May 2023 10:42:47 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=7D+C=A6=citrix.com=prvs=486391a49=roger.pau@srs-se1.protection.inumbo.net>)
 id 1pwKnv-0007b3-Aa
 for xen-devel@lists.xenproject.org; Tue, 09 May 2023 10:42:47 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3a491814-ee56-11ed-8611-37d641c3527e;
 Tue, 09 May 2023 12:42:44 +0200 (CEST)
Received: from mail-mw2nam04lp2174.outbound.protection.outlook.com (HELO
 NAM04-MW2-obe.outbound.protection.outlook.com) ([104.47.73.174])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 09 May 2023 06:42:38 -0400
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com (2603:10b6:a03:38d::21)
 by LV3PR03MB7479.namprd03.prod.outlook.com (2603:10b6:408:194::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6363.33; Tue, 9 May
 2023 10:42:36 +0000
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::b0b8:8f54:2603:54ec]) by SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::b0b8:8f54:2603:54ec%4]) with mapi id 15.20.6363.032; Tue, 9 May 2023
 10:42:35 +0000
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
X-Inumbo-ID: 3a491814-ee56-11ed-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1683628964;
  h=from:to:cc:subject:date:message-id:
   content-transfer-encoding:mime-version;
  bh=6mjw9wOt/hp89bIP9Ja/Gt+A7Z/6HALaO2DsquhDAKI=;
  b=TXW59u7+S456AelzxW1okh+Ksb0p3ALKDv0f3ysE2tI4hmcp1drlkF5E
   jkCYiCAYHlDwsC3SchpzJZzck11rYYmPSJArcHJzJJ12hYsd/5SHBcc1D
   Lu4lEqxloumVr7veheGXx1/pwwk/ZGNsSIjIk7D747gX84LsaAb5cUdpw
   4=;
X-IronPort-RemoteIP: 104.47.73.174
X-IronPort-MID: 107702724
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:SM/4lqDwdovhahVW/wHiw5YqxClBgxIJ4kV8jS/XYbTApDMi3zxTx
 zAWCzvXaPjbYWX9e9skPdizp04PscTRmtY2QQY4rX1jcSlH+JHPbTi7wuUcHAvJd5GeExg3h
 yk6QoOdRCzhZiaE/n9BCpC48T8nk/nOHuGmYAL9EngZbRd+Tys8gg5Ulec8g4p56fC0GArIs
 t7pyyHlEAbNNwVcbyRFuspvlDs15K6p4G5A7wRnDRx2lAS2e0c9Xcp3yZ6ZdxMUcqEMdsamS
 uDKyq2O/2+x13/B3fv8z94X2mVTKlLjFVDmZkh+AsBOsTAbzsAG6Y4pNeJ0VKtio27hc+ada
 jl6ncfYpQ8BZsUgkQmGOvVSO3kW0aZuoNcrLZUj2CA6IoKvn3bEmp1T4E8K0YIwoKEoGzpp1
 7siLm4CVBCto6Wd/baSRbw57igjBJGD0II3nFhFlW2cKMl8BJfJTuPN+MNS2yo2ioZWB/HCa
 sEFaD1pKhPdfxlIPVRRA5U79AuqriCnL3sE9xTK/uxuvDS7IA9ZidABNPLPfdOHX4NNl1uwr
 WPa5WXpRBodMbRzzBLcqi3z3rWQx3+TtIQ6Jf7p8P1nuASomVcZUBNRTQCa8PycsxvrMz5YA
 wlOksY0loAi+UruQtTjUhmQpH+fogVaS9dWC/c96gyG1uzT+QnxLmoOQyNFadcmnNQrXjFs3
 ViM9/vqCCJutvuJSHub3raSsT62fyMSKAc/iTQsSAIE55zmv9s1hxeXEtJ7Svfq0pvyBC36x
 C2MoG4mnbIPgMUX1qK9u1fanzaroZuPRQkwjunKYl+YAspCTNbNT+SVBZLztJ6s8K7xooG9g
 UU5
IronPort-HdrOrdr: A9a23:v9WbYqkc2iR9NRWw2eeIGvicGgDpDfIa3DAbv31ZSRFFG/Fw9v
 re5cjzsCWe4gr5N0tNpTn+AtjjfZqxz/NICPAqTNSftWrdyQ2Vxf9Zg7cKqgeIcxEWkNQ86U
 4KScdD4bPLbGRSvILQ5hW+Gdpl+dGb8cmT9ILjJg9WPGZXglZbnmNENjo=
X-Talos-CUID: =?us-ascii?q?9a23=3AH95+72ik+oYnJccBkO9UYZj1UDJuKDqC1iz3AQi?=
 =?us-ascii?q?CDzhmcr27bRi7xadNnJ87?=
X-Talos-MUID: 9a23:3hAYXAi4kaixHyOSasunlcMpBYQ55aejMBk2zq4M48fDLXdRajK4tWHi
X-IronPort-AV: E=Sophos;i="5.99,261,1677560400"; 
   d="scan'208";a="107702724"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GC96wJaru1eV7ZjTFEQc46cXB+LXG/HX8QrlFRaOuO5kEVzDmqgE3k3Kf4NHRRr057oLi1CLJ+mP8Pt8UCTp8AX7CTAbrTlL0XAbXLtNudz0KIatVGVdhT3aD2Yplwf8yqmeD3F5OVuhgi3OiwypT6Tijeo2xXLG5wU1vA0Bm8N8R79zwVXWyqTsiIsr+zJab933WooCZ5w1zW7La6chGCV0v/z0R4e2Lc5q30PlJwWx2kxaFcsv8KFU0SrRwPzR3wqdXflp0UXJoU/C9atJu+VhTZRXDZKQRI1mcVThGh1HxurZsjLZvy4HsIDYd6ajurLYDTl//bjI96bexvM6ZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+/6g8tjSBTZthJRn0IsH15R3+4hN4TP9sKJX1WwKJX4=;
 b=Jj4j2GAIjCplvGD9cemopphdDpWLSArcM2qdtAo1Ys8u9ANO+Rp77Ga+yD1YAK/CAIxZu+x+2U7eq3SboPauc2iNjgNaDzWnprGuh3m/EERXhV6LNhos/n1sMtAKTreb/sERHA8dFFeMLR0f5Mi3OmAk04XMoFqre77p7Hx95j/EcSDSbKZA9DEcGITDyyk30KEy7NfbPoVe4JRZNqeU0ZBOSo30SK164pSVanDfGYmBbO3maEIHZcBPZd8o1fCNCrWl6cZVtYyqsMJiWZTqdQBIKnQWBu4qdTFXxy0aCkf4OT27k31OZFpiU8h2WdZGF6UxlnMnLH6ywRqqbLJyrQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+/6g8tjSBTZthJRn0IsH15R3+4hN4TP9sKJX1WwKJX4=;
 b=hd+UHp8NK6f/JP5O8uy6bUOFv5UYsiwLppV2Qzn1W1iYJmyYSEzIphUG0U5ggyPHIgBmaryiMfIs3tGQoUbTMnmZBXMeUyevjb/lTbqTAx6rAV0BQjMn9h9lO3F7sDXwTAf7KtaowEnRBboukn5AOaz72J416hZXxsbAhXAl/24=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: jbeulich@suse.com,
	Roger Pau Monne <roger.pau@citrix.com>,
	Kevin Tian <kevin.tian@intel.com>
Subject: [PATCH] iommu/vtd: fix address translation for superpages
Date: Tue,  9 May 2023 12:41:46 +0200
Message-Id: <20230509104146.61178-1-roger.pau@citrix.com>
X-Mailer: git-send-email 2.40.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P265CA0180.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:311::11) To SJ0PR03MB6423.namprd03.prod.outlook.com
 (2603:10b6:a03:38d::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6423:EE_|LV3PR03MB7479:EE_
X-MS-Office365-Filtering-Correlation-Id: 8eebd26c-88d4-4399-0ead-08db507a19d6
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	7kPK9gyzBNtOlaYx/lTtz9cm5KCjYVzwOn729pJmuI9QctnmhP64TQitzf7mcGEKh9vEjM2CRh8yf/IrJA6FLgaQcHpsp04hWst7CkyGB7MtzLMLeTWy7it3ra1odGpfGbLaL7/esLKrj94msrmiz5Y7DeGupeSwM+SihIvurJ/vumEpFL3jtLs2SHsxTEHZnfqSWDG9lqoxmQr7uRAk+r6hkx8deGYT2FuNTXZc2h3bjYXI6Mvm0qn0kDGX8M4E0xm0QEmKAmligCrCidcd+iPLdd8UcWzKcM0h7tIlPQyLM0FDqEDpNSa4tS5K89SkDoy62Bv6kK39pAqRs8Wl4dbq6wRMNiQVoIKJF/bo55vh3aFqZMXiLkvbH6pTaokXJxxbFBWnCfEgk1MD86GgRYYRVvDGR7TRWJW1q7yRYFwY5BsGTpd2ERRdEi8+2BHNqXZu9erl+0CYvltY3I3iGzqJyJQFGWVZVeNm2wE2eyPbMWkKx4IOdHyV523MgKRoo7dRADyCWiHgCG7Q9WqtLC5TUF61jBgD529PlZbmAZORfozBjyh1l0r1bt/VNr2k
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6423.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(366004)(396003)(376002)(346002)(136003)(39860400002)(451199021)(4326008)(6916009)(66476007)(66556008)(36756003)(2906002)(8936002)(86362001)(8676002)(5660300002)(316002)(41300700001)(66946007)(2616005)(54906003)(478600001)(6486002)(6666004)(186003)(82960400001)(26005)(1076003)(6506007)(6512007)(83380400001)(38100700002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Y3lKKzdDNHVkNzNXdHdRSnJDSHpPMytsL0l0b2YzMFpFSXhWaEl0ZDN1MUV0?=
 =?utf-8?B?bG85ZlkyQXNiRFNEa01XdFY2RmlKTmF6MjZEYTdLRTdZcStsbGp3cnlmV3Iw?=
 =?utf-8?B?OXFTckhsd2x3eVN5OUZscVdzR2pyZGtRTE1JVFNtd1FpbVBYVHl0ejNmZlZm?=
 =?utf-8?B?VGo2ajBHQ0tRSFdFR01ZdTVDYWZ0SE1wSHYyNFhWQjhzQmJkTUQxZTlYNU81?=
 =?utf-8?B?Vnd2NEhYZldaVlZQbSsyWVFaa090OVRPSVgrN1hnKzRQK293K3VPWjYzYm12?=
 =?utf-8?B?WVhKNzNhd2RnKy9sc0VLcTA2SDE5MWk4TUpSQmx4blRLSi9hUzFhbmM0azli?=
 =?utf-8?B?WWJ0eWhCS1A0b0NVODFxZFlDQU15cDloN0pZRjlELzU0d3RRbTlTU2FaYkFL?=
 =?utf-8?B?VlQ2cHQrY0MrNjR3YWpPU0FibFVQOWZnczJjSXc5eGJYbDcxbDhSWGZKOXJC?=
 =?utf-8?B?YTlMRzZ1SlE5K1RsRVdqaENQN1VkcmxkS2dwT3NnWjVPWFdCSk5tYnhmc01W?=
 =?utf-8?B?ZzdLSm5KZEpNQkpXeXZjMnBUUHBQTzdWTmNvOEJLb1plL01XUXpLNjhzZVh1?=
 =?utf-8?B?SThVcU1FWm9lYjV2S2MwQ3FpNFRHUXhEcGM0dFVzYmZHK2VpRzVKNXhac3R4?=
 =?utf-8?B?K2kvVk90OStHeEQ3dmt0bmVsZkhBdmZya3NkUWJGWC9uOFUzNjFOVUY3QzdL?=
 =?utf-8?B?R3VJbGNnM3RZT2N6T0U2cGR6V0NLVng1QnZOd2RidWZrVnhuNitoa1haKzVG?=
 =?utf-8?B?OE5mZmxRVzRIT0toa25GejRITDFoUHl6cVNzSVRYdExtd0JMbUVEQXRIQm14?=
 =?utf-8?B?bkhRcmFPRS9KS2U2UkpHcmsxeTcrMGZzM1kzcWJ2blZ3bjhCNzRrWXhqUXpt?=
 =?utf-8?B?K3FqWTFCS0lNLzBUQzhjUWlibm9iaFhWbWI1NXdMdEtBM3dRY2N2cDVuRlVx?=
 =?utf-8?B?MTFPWm4wWk5CZkJEeHdIY1ZPaU9tRU0rUHd3NFhoc0VWbjI0S1NENnl3Yjlo?=
 =?utf-8?B?eWNoNjc0R2NDdjlNRGFwd3UwV0RsSE9DdVo4M2wrbWlVM1F6Q2oyVlU2Umc1?=
 =?utf-8?B?ZXkyYkhaemR2NUc0ek5NWCsrTFNDbDdXVVFqK2VVWVJjZmZMWmZPSGtTcG1Z?=
 =?utf-8?B?SGlRT05GZWh4dkhrV016ZG9zRXdVM25JcUtXSlozTDVTdGg5SWRyZ0hYMW5l?=
 =?utf-8?B?Z2ZMR1B6bTRzS1U2S3NGRjU1bk5QN1dqS0Nrd0dHTExWY3NnWlV5Z0ZhN1ZJ?=
 =?utf-8?B?UWErVGRpRHo0ZytGTkg3VkZyZUpCODVoUGlFamgwa01OUU5JVmoraGx0UFhr?=
 =?utf-8?B?TEhKZnlIbTlOYVBUenRZKzFub2pCSkpaeXBGN3RFZlJ4R1c5YXhUbjd1U3JP?=
 =?utf-8?B?VUZVL09VQm1ZbzEvblA4bEtTeGhKNVpaV0c1T3MydDJBNlpsUFN3aFB6WTNO?=
 =?utf-8?B?ckVmb3ZpTVUzNys5Z1lBM0h0azRPeTBoMjdtS0h1WkQyKzR1RzdJR1l1UzQx?=
 =?utf-8?B?NnR0c0dWYk1pM0szV0NWZ1RKeEFoQUNyV0c0Mm5ndVk1SWFLcDhwV1dzVHNS?=
 =?utf-8?B?RGpKQ0FXd08wdllKenJMYUVJOGNUdGRFT0RuRmw2M2l6aWVXY1U4Q1R6UmI2?=
 =?utf-8?B?N1BjZmloTGE2bVJXT2F4SWFxclA3RlFIbXV0Z25TTFoyMTd1dXJrUmQ5SThB?=
 =?utf-8?B?RUNZZStoSUhwNUs1TGx1WHJwYnJaQlRjVnVDcWNHNWJVRGQ2dDEvQTdDRks3?=
 =?utf-8?B?M0xlcHBlKzMvTUtiSlU1cWt0cjVmNEw4cStCYlhJb09vb2Vra1NyUGYrVEZz?=
 =?utf-8?B?TEF1UGRmL05kVVZzaUgreUh4TVRFbWdwdHEyWENwd2ZBRUc2bVZMekcwUEI5?=
 =?utf-8?B?R0U0cVdvancxYWlLZWkyMUdHK2hqY1cvTmJlRTF5ZWxaeFE4WnB3NE1tdHIw?=
 =?utf-8?B?VTVxRXk3cVNGTnl4K1k5dFFvQklqRzJ0aDIyKzZsTmg4d3RxZ05Tc0NyRXA1?=
 =?utf-8?B?bllJRDZxYk56akR1T2JoZHN2d21LdWptNXBpaDdZYndlcnREQ2sxVTMwS1N6?=
 =?utf-8?B?a25JZ28xL3dSTXhCbmpxMGRHWWxiTWQ3ZHEwWEoxd0NpZTBmSTN6R0RmM0xj?=
 =?utf-8?Q?OM7D48KI7kd/zw4/TIGLrLauz?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	UFEXoX//Yr9BrELCI9MOnXpwOr2iWcdWkFpoUJCQ2FKDjwLpE4ZGwJ7F3gsXdV7MTl4vGp4OxmSd1Un+W3jazLCyepakEsm+a4uBWVlr8U7OUhq7wfm1EE3QQmPBeMzNLe/Vd9VdjqszIS8FeklBH6vG9QPSw/KzFxoINMaFhY4F0FZcjCa3SiX6gQzGfVomtoSgOP11UMo9Fclxf5U9RcVyqV4TT7bDnGK4o84j1nmQJJp6ljeTY5NluniFQpRdE423Yisi5KgztLhSxZvxNNdGWXh+DXmgftS6ZsW01wTss7mzJheEmtLESfHumEaZkaorDZfMlpesuNJ7yg7x+YUTLxrmA7Ix6viSz/IoBNOhtKR7AEfEgbJRugHN05PBFBjBQrr8paPDDV97qThju5wxdmWR7+gbieZKXUB3IrV4Eu8BDXC3/sX4ZSEmVtMK1OjZruuXeCSf7iMBQulvmZ9V9PPN8qzNfu/v2S5wUGBwjhGsa9zHqRjOnWUmSv1hvoWnhixgw+wnOmH6kagQALLzXHB0xQNXCsVwG7j+2ap/HqA8YxCn4KeNRNnnQzgzedVuzPS30cBHF0ftvWDhmT5G/gZun374sVqMKhvN54sGEPqpgl02QAe78JL8MqEEIqSm1P9j5QzSVUDwJwPbbknTC8TezI8BsIjoFrxntWYmPtb1IPJnS8fkkwI/eLZpduNuXs6ZwxkDmVOV4wpveyJO1tQJgb0sk0VNO7ehuXSA99CjfuzX6KTA9J0srcjyBYi2yil+6PweENDyEJ6hxJVKYxSdLBN/IF5QiAvt+gm7FEQqGbJRnTanEYY/Sa2RqY9sDnHdtNmL8qbWUgMG+A==
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8eebd26c-88d4-4399-0ead-08db507a19d6
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6423.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 May 2023 10:42:35.5515
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: v4QsFod0aNlCtmtBlg7COCGFPE7msPXDKyCe444zTDkB+0NOAohcD0uVWkm5RE9CYnvsvJDwP9hQ7G6yBc6vgg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR03MB7479

When translating an address that falls inside of a superpage in the
IOMMU page tables the fetching of the PTE physical address field
wasn't using dma_pte_addr(), which caused the returned data to be
corrupt as it would contain bits not related to the address field.

Fix this by re-using the value of pte_maddr which is obtained using
dma_pte_addr().  Such change requires adjusting the previous error
path to zero pte_maddr.

Fixes: c71e55501a61 ('VT-d: have callers specify the target level for page table walks')
Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
 xen/drivers/passthrough/vtd/iommu.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/xen/drivers/passthrough/vtd/iommu.c b/xen/drivers/passthrough/vtd/iommu.c
index 130a159cde07..819e996e6269 100644
--- a/xen/drivers/passthrough/vtd/iommu.c
+++ b/xen/drivers/passthrough/vtd/iommu.c
@@ -359,16 +359,18 @@ static uint64_t addr_to_dma_page_maddr(struct domain *domain, daddr_t addr,
 
             if ( !alloc )
             {
-                pte_maddr = 0;
                 if ( !dma_pte_present(*pte) )
+                {
+                    pte_maddr = 0;
                     break;
+                }
 
                 /*
                  * When the leaf entry was requested, pass back the full PTE,
                  * with the address adjusted to account for the residual of
                  * the walk.
                  */
-                pte_maddr = pte->val +
+                pte_maddr +=
                     (addr & ((1UL << level_to_offset_bits(level)) - 1) &
                      PAGE_MASK);
                 if ( !target )
-- 
2.40.0


