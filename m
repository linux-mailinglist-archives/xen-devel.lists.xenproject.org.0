Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F5156F468F
	for <lists+xen-devel@lfdr.de>; Tue,  2 May 2023 17:02:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.528708.822198 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ptrWF-0000hM-Iy; Tue, 02 May 2023 15:02:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 528708.822198; Tue, 02 May 2023 15:02:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ptrWF-0000eP-Fs; Tue, 02 May 2023 15:02:19 +0000
Received: by outflank-mailman (input) for mailman id 528708;
 Tue, 02 May 2023 15:02:17 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=OyLC=AX=citrix.com=prvs=47975177b=roger.pau@srs-se1.protection.inumbo.net>)
 id 1ptrWD-0000eD-G4
 for xen-devel@lists.xenproject.org; Tue, 02 May 2023 15:02:17 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 51e990ee-e8fa-11ed-8611-37d641c3527e;
 Tue, 02 May 2023 17:02:15 +0200 (CEST)
Received: from mail-mw2nam12lp2045.outbound.protection.outlook.com (HELO
 NAM12-MW2-obe.outbound.protection.outlook.com) ([104.47.66.45])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 02 May 2023 10:59:43 -0400
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com (2603:10b6:a03:38d::21)
 by DM4PR03MB6175.namprd03.prod.outlook.com (2603:10b6:5:39b::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6363.20; Tue, 2 May
 2023 14:59:41 +0000
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::b0b8:8f54:2603:54ec]) by SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::b0b8:8f54:2603:54ec%3]) with mapi id 15.20.6340.031; Tue, 2 May 2023
 14:59:41 +0000
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
X-Inumbo-ID: 51e990ee-e8fa-11ed-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1683039735;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:content-transfer-encoding:mime-version;
  bh=w09wlSCp9EquAfQqRS+hpjyg6dxzrD1D0xfiQn0bbHI=;
  b=Zu2mt+6DvnN6FEgS6o8X/FvpnZZTo+ylZWoNrFr52N4uZSkxj6kE1Yxn
   I5Vj3oyOoXVHkI4pkDkxEnHVsbYnl1dVOsixoqairJnfhgd48KXHdbbbt
   RI+/68HtC+sFVOW46bAZKjkt6CXAG66mBfZ2vaeW/GpfTgZbbEtTgOL3j
   A=;
X-IronPort-RemoteIP: 104.47.66.45
X-IronPort-MID: 107998060
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:W51CSaNPUDEqF0jvrR2ElsFynXyQoLVcMsEvi/4bfWQNrUpw0GcOy
 WAbXDqFOf6DM2Lwc4p+b4iy909XuMTWy98wTwto+SlhQUwRpJueD7x1DKtS0wC6dZSfER09v
 63yTvGacajYm1eF/k/F3oDJ9CU6jufQAOKnUoYoAwgpLSd8UiAtlBl/rOAwh49skLCRDhiE/
 Nj/uKUzAnf8s9JPGj9SuvPrRC9H5qyo42tF5gZmP5ingXeF/5UrJMNHTU2OByOQrrl8RoaSW
 +vFxbelyWLVlz9F5gSNy+uTnuUiG9Y+DCDW4pZkc/HKbitq/0Te5p0TJvsEAXq7vh3S9zxHJ
 HehgrTrIeshFvWkdO3wyHC0GQkmVUFN0OevzXRSLaV/ZqAJGpfh66wGMa04AWEX0rspJXpwr
 6dEET1XdVPfp+O0xu+aQ9A506zPLOGzVG8ekldJ6GiDSNMZG9XESaiM4sJE1jAtgMwIBezZe
 8cSdTtoalLHfgFLPVAUTpk5mY9EhFGmK2Ee9A3T+/RxvzW7IA9ZidABNPLPfdOHX4NNl1uwr
 WPa5WXpRBodMbRzzBLcqi3917+Xw3uTtIQ6MeLnrtVK3gKozEdDCB8Jc3eVvsCLsxvrMz5YA
 wlOksY0loAi+UruQtTjUhmQpH+fogVaS9dWC/c96gyG1uzT+QnxLmoOQyNFadcmnNQrXjFs3
 ViM9/v2ARR/vbvTTmiSnop4thu3MCkRaGodPykNSFJf58G5+N1uyBXSUtxkDai5yMXvHi39y
 CyLqy54gKgPickM1OOw+lWvby+Qm6UlhzUdvm3/Nl9JJCsgPNPNi1CAgbQD0ct9EQ==
IronPort-HdrOrdr: A9a23:/qMsLahr03lzSIjQigpdGdKEoXBQXu8ji2hC6mlwRA09TyVXrb
 HXoB17726OtN91YhsdcL+7Sc29qB/nhPtICMwqTNSftWrd2VdATrsSircKqgeIc0bDH6xmtZ
 uIFZIOauEYZmIK6/oSjjPIaurIA+PqzElrv4rjJrtWIj2CopsP0ztE
X-Talos-CUID: =?us-ascii?q?9a23=3AcU9vymg1dq0T1GPYrwYtyH4A4DJuLyP510mKeBO?=
 =?us-ascii?q?BBDxyC+G1SF2WpYJtqp87?=
X-Talos-MUID: =?us-ascii?q?9a23=3AYt4tIQ2B6+V2ni18cokrwPJS/zUjxvvxUGstz8o?=
 =?us-ascii?q?9seLUNS5vHRuzkw2Fe9py?=
X-IronPort-AV: E=Sophos;i="5.99,244,1677560400"; 
   d="scan'208";a="107998060"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fke3hhsVQYoZkWY7of+dP26OVNizg8F/s6TN5197GLmFyyOFoFQmSscbqHRFDo0122+axJtV7QW6LG/Z17rANCQKeJz996yrbvf3j84nLlMGiMwDf268OKkCWpqzHb+XxszKOyji/456g1ldjikLtc+U3MVcFZpWK9ZajQcaVrSa0PEYMSXSFNparEQDpGSvsmmThY/DKCb1cSTecif/m1AgmS3Jm7GJWWzJi1y0f7/xSJFTMxepF7Kzkm3Xiq7LKUN6wX7SUDHW2Dy0S7eZfTtORUY1xA8i8Cb9bh2mrzPs/WJmsbGc3SVUwUzRr5Bd/VVCpEjh2jpORS3Wqfg49w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Q9yYdD46obGJvl7PXXkeV3azaYqYy0EKOnWgIgsZyZ0=;
 b=MG2KD3oaXiAfG1K4iMnyoD8MJcMeZY15TE5U3dZew/1v/z5zGpgccgt3EoOqFyto4R/SAJgb+oSrlCtE0KkvnP47cfexyEu4Hf/LHv0ykFjWkvgtuoimbJAp76PpZGvoXCs4gm5JoSbdn078MVVmIRTKUxe0+X0EjR0n8fqvaarduzj41TCLzZMfQAW86bytPjdbXQ4Rhfe5kb5mALpWCA4y6KOQ/B3LEksERsi2+bgfBGuNsVJs7xhdcGi6afPZMn1GbnOBr/mEtlLIk+Wnge398XIWy4cOo/rtTYhxKT1Dqyxqh97wMOfjV1nNStFKAm+bBFkXRv3YQDhCvg+wWw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Q9yYdD46obGJvl7PXXkeV3azaYqYy0EKOnWgIgsZyZ0=;
 b=GAbjRitQaPs/RQ3B6NB4CTHQZWFPm30fMYXBD2hNvQOdjJJPr1uJ5zZAzmLSqEqX9HSpSH7ieDFeogx7xQDxDq6Di4kqqyzLENB+mmGUnvy2MnTcAx7tWR+sBB5rWOY+dXaBP3d33Zn1SU1Fg+Z2kJd3gCW+BWrHVkU7f+MYZfg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Wei Liu <wl@xen.org>
Subject: [PATCH v2 2/2] x86/trampoline: load the GDT located in the trampoline page
Date: Tue,  2 May 2023 16:59:20 +0200
Message-Id: <20230502145920.56588-3-roger.pau@citrix.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230502145920.56588-1-roger.pau@citrix.com>
References: <20230502145920.56588-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO0P265CA0005.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:355::10) To SJ0PR03MB6423.namprd03.prod.outlook.com
 (2603:10b6:a03:38d::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6423:EE_|DM4PR03MB6175:EE_
X-MS-Office365-Filtering-Correlation-Id: 17f44865-2af3-4561-258c-08db4b1ddb67
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	RaIJeM2fVvwbWRpBBpvJFlB3N+owt56dnnojhjUnrg0uEOacxQpa6ouDRK00ZEdCvREEL0ZQvkUOi/JZM9Vw6qbU2aM47Q1De6HrNF8+fhKVtNniJJVc4f5R2xFB0BdVIqIIf0TnvTxMlkQu8adnb6OuAcyxizFB9Y31wdeEsaLqeXhH5ZzCrMglINIMEsorE45a/SkI7zKJGRrR8PWy8gA/ctE9nPyyZtDuLfj00vfgJIwThpusCcNhcZIsZYc89H9FeChdz+3xZgL2pABC4zHoejHMdvUTnGGxB6Wui5NpAzJDcHwdJMEgzwPGmuxA1ThmZX5rnMQwvhFKVEbfMi3VUG+/Pmp9W5+K7eI8X+6W0t8MeOcRH2GTcc3yiIYyPd2jlxMZb2CUTOI20OGf2it8MznxUdPCC0tfyK7xBZKUoqK3d3SVC4JpTZkCc1Zb0EqLFFJcZmnRX/AmQQoXiejGUlr5ifjEeJtNfYw4uChFMDf2dvsuxMPfvqKfZdop1XiM7sAlwl5KiMHtOwLmjcMRyWkq+8e2XugkK0ZHwLZ626oTh7lcBVjQzags6MxO
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6423.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(136003)(396003)(346002)(376002)(366004)(39860400002)(451199021)(82960400001)(38100700002)(2906002)(8936002)(5660300002)(8676002)(36756003)(86362001)(2616005)(478600001)(6666004)(54906003)(6512007)(6506007)(26005)(1076003)(6486002)(186003)(66946007)(4326008)(66556008)(66476007)(6916009)(41300700001)(316002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NDhuNHNWVEZLMWZsb2tWQ3lpUTAxdmQwVWVOc3J6ZmZWd1ZRWlpTV1JFbHlo?=
 =?utf-8?B?M3dNTWxORG5QdnJMV3FmTGlLeW1hd3lhOWJITFpGNzhub0t6VkJqMTBQSzEw?=
 =?utf-8?B?WFhWMTF4OTExQThIaUZMMU1senVhKzhDTWFzWHlMeFpqOHR2UGl4V1M3Qkd4?=
 =?utf-8?B?WU5NdjdoL1lsNis1UWhSaGhGTHhLcHY3b1JhSEk4NDRFZWxWSlducVVnczFC?=
 =?utf-8?B?Sm05RjhseExMd0RuK2RTbWJ4cFJSd01JMWdYRm5SN28zYy9oVXlVT01QWlJM?=
 =?utf-8?B?K0dVL2ovWkdsdVUwK2hoYmg0N0k3emg1S3pWVmxNOHhVeW5DZXJ1MXFQcXRO?=
 =?utf-8?B?bTBySEFrcjBqRFlEUnlNei9JenFXZVcveFpnTWVWcWN4K3FCYktqTU9Uckpn?=
 =?utf-8?B?cFphV2JhcnJ3anY5eXEvdEpmdXVtcFlMY0Q1K1U0blp5d2dHVW1wZVdyckps?=
 =?utf-8?B?YXM0alQxWnZqTjczMVVCN2tMNTFVUGtJY0o2T050OUxsQ244aGJRbEk4S2p2?=
 =?utf-8?B?cGNxb1hBek1yS1U1dG5MVWtsalAxV2s5YWRYT3pXL1FxYmtoVlUxM29VdS9v?=
 =?utf-8?B?QUJrcUdkV25JOGJheitpUHZuRFBFNjcvMmNjTUI3YzVDc1RpWkVLQ21jeENH?=
 =?utf-8?B?dmtMWnJnU3RSVG1XcGlxQUtFMTFSZWdVUDYxNEdZTzdjbjcyenFJaElkcXdG?=
 =?utf-8?B?bmxZNkZSRHdjeDBaNXVrT2tURDAvSWo0cDJGS21ON2RnVUYvUEpVMTc0MTB0?=
 =?utf-8?B?U3hZQ3B1WVhQSXd1UkZNc3V5SVBhVXE0VTdoTENicnZnZ1hKZVJRckdnMFpI?=
 =?utf-8?B?YVhRWDVkdWJia0RuRml0L0UrY2JLV2hlNGFJMlV3b1lYV1lOT0RGVU41SnVv?=
 =?utf-8?B?RUZ2aldPRnpSb3hEL3MvVzZvS01RZFJEOEE2OEh6c1M2dENMb0tET0k1bXpJ?=
 =?utf-8?B?Yk1Nd3NBdGdiK1FsYVdjU1J2dkdLVkI3OWxtVXFMVUlOdVJ4VW5CK0JhSWE4?=
 =?utf-8?B?Z2lGeDJPL0ZsR3E3NW1VczExaXdBamZmTXNGdllOZHpmcW1DTXhHWFAwRlNM?=
 =?utf-8?B?bElDUDhvWWlZQy9LakhmSnRoR1NNbWw4VFRuWlNhV2h6Z0liTmVTZ0Q4SUxh?=
 =?utf-8?B?RHZxenppSnF2THZ2WG9VaXJDMFpQU2RONURKTXhPSkQxSXdReVFwajd0SjhZ?=
 =?utf-8?B?anB0T21hSTJCV3hPaHVkRTBHbndjMmJUeHhrbmlkdnZIN1A3alM1T1hwOVJX?=
 =?utf-8?B?VURQb05RL1prTklORndXd0VhcGRFRkVhNnNjTzZTSk9SRHRoWGRTaDdEYnd1?=
 =?utf-8?B?WlpDcWdBZHFVSmJqZ3Z3R05yMjJURlIrRHFneU0rQW5NTW1hY2c0VDJ1QzBt?=
 =?utf-8?B?QjhTNXVHbUJpVnh2MWthUUFFTFdNY2crV1V1eHM1Q0dNV0oxN3FwWmdIY1FG?=
 =?utf-8?B?QmdjU3VTaW1Pam9sTFJFWE9IcmhqL1pLK0crVVhXMGZPbGVVYjhSaXh3Uito?=
 =?utf-8?B?WjBHSFVMTnVheUtlcWxpZW41L0gyaGYwSGdmOGhoNnZEZGt6TU11WGxBQjlV?=
 =?utf-8?B?dnI0ZzRmck9CbENrRDRJL1hmR2NZbm81cWI4Z1pTd3QyUm1uVmY3K3BmWElo?=
 =?utf-8?B?ZmpJRjJ4aURSdlp6YjBqODVyTS9BRU8ybFlhbWhQMnFySEh1MVB1dnJaTmY3?=
 =?utf-8?B?V1NZQ1YrWjErSVkwUDdkeXhDY0RXVE82NlZkVG9LS25ENUZldnBwU29jYTZH?=
 =?utf-8?B?bXExdktxbWZXZFpoN0t2Y2dQaCtiYS9hZlo4akpLYlFhYUFVMG5Td1JaTnQy?=
 =?utf-8?B?ZFVubTZ6Z1NlTXd2NVIvNStNQnQ2VDBzUEhVOWt4TmJiQm4vbkR0U3dIaXlH?=
 =?utf-8?B?NGlrcEl0bGErcWlaL1ZZQXpsWmp4Y2FOakxNTEJUSXpqTHpEWURvZXFPR1cx?=
 =?utf-8?B?aExRMiswNDRSZkx1alBPRUdMQnRlTEU3bmh3WE1GYmpNeXNIdnUrTnpoRUpo?=
 =?utf-8?B?c0V3YWNvZEFuL1RVbVBwNkQ3SDl6Y2w3OHBKV0V1QlAxZDNZUkFyVS9CSy81?=
 =?utf-8?B?NjB0RVFNSGtWZVRpSVUyWURSWHdSdkNmQy9UNEZNd2UzN2RKb3F0aDhoUmhj?=
 =?utf-8?B?eDAyUzBKMlRyZVZPTGQ2cGRWaGd3Slh0cVY0Y1phNnRXazhUaEFHTW9LQ1dX?=
 =?utf-8?B?MXc9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	PLpHV08toh8qnxZmyT89R30wwyje0D4ymb97lqkUZczv2q2Q5qZbMDVb5Avex+q5TT5KZhUTA6yNrrMiwadQCKe3fSHa5GQADumDWZZoX8wRuhbywTUlG7959mTgWDUI6jTcL+ASDNgPMg2ffjaExggM+2v2FobrmEkHNiOinM6ebDS3qQa8EH4jpqSlCXSvD0jcpRqTr0LcnucQc7x/CgeXuNQ8FxSydlM1CR+OfS12HKNselKXSSpcHa+RMmdwLXDpz11S5xV07JsOkkKEBSmVbtz0nojSczpFKxKZ+9uugPwn/vu70P61BCf4W8jq5pPqkM1nxzXUQUqwzVEiZ1hxW1LOo0IPBhCPkLTgGoFh8jQX9dXsPkqbVhbynAdbM/5coYXXBXzxVecqcp9hAeY5N3eGh1vNGLebd1AF4TyOY3h+V9DzcsISd3RIL7KXAsLsefNVIxQgS6WkVkM+bBPbJ8VjyZO0lvQwviEHuKOi5UaCUJcXXV4qKAovDdL2lrIUnSW9HT2ToEpfckcMyFpwQjUESZ8LAzJd3LcIWccooWq4gb7pwFDIYKOPPjRuoanw1B6Qc4NHfXCVqfjD5dfFJjkFd8yeUMr9tPD+d4jg1CA+/JNkHUjsb7CgB64SmjMOvdSbVnSLyJCbxiVoClwu+0RzUDO8+SoD12/moXTRZDrEY+1sZXjy2kN7ZNoGySuBUpJ5h1CpeXS2UiFxFOmsBGbjxGbEhcabod3SKIlBi1+F58q5TyTF2BQqHXKR6deg5RTgUgb3JMu1kf7JQyVgmJTJJyAqMI6U2G5+C0UBzRTpoi049RgqgvBQpsG6
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 17f44865-2af3-4561-258c-08db4b1ddb67
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6423.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 May 2023 14:59:41.3542
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: farOd407qZUcrtAYtbDIio7yzBzSZVOF0SoMAcWNN7zkAYITpZHTI5EMsTMU9RR1Wsger1gY2vGhsG29O2Pfsg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR03MB6175

When booting the BSP the portion of the code executed from the
trampoline page will be using the GDT located in the hypervisor
.text.head section rather than the GDT located in the relocated
trampoline page.

If skip_realmode is not set the GDT located in the trampoline page
will be loaded after having executed the BIOS call, otherwise the GDT
from .text.head will be used for all the protected mode trampoline
code execution.

Note that both gdt_boot_descr and gdt_48 contain the same entries, but
the former is located inside the hypervisor .text section, while the
later lives in the relocated trampoline page.

This is not harmful as-is, as both GDTs contain the same entries, but
for consistency with the APs switch the BSP trampoline code to also
use the GDT on the relocated trampoline page.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
Reviewed-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
Changes since v1:
 - Reword comment.
---
 xen/arch/x86/boot/trampoline.S | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/xen/arch/x86/boot/trampoline.S b/xen/arch/x86/boot/trampoline.S
index cdecf949b410..c6005fa33d1f 100644
--- a/xen/arch/x86/boot/trampoline.S
+++ b/xen/arch/x86/boot/trampoline.S
@@ -164,6 +164,9 @@ GLOBAL(trampoline_cpu_started)
 
         .code32
 trampoline_boot_cpu_entry:
+        /* Switch to relocated trampoline GDT. */
+        lgdt    bootsym_rel(gdt_48, 4)
+
         cmpb    $0,bootsym_rel(skip_realmode,5)
         jnz     .Lskip_realmode
 
-- 
2.40.0


