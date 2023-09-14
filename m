Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 87F7C7A08F4
	for <lists+xen-devel@lfdr.de>; Thu, 14 Sep 2023 17:22:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.602487.939155 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qgoAF-0007oX-4w; Thu, 14 Sep 2023 15:21:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 602487.939155; Thu, 14 Sep 2023 15:21:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qgoAF-0007mb-0H; Thu, 14 Sep 2023 15:21:55 +0000
Received: by outflank-mailman (input) for mailman id 602487;
 Thu, 14 Sep 2023 15:21:52 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=J3lF=E6=citrix.com=prvs=61487cf85=roger.pau@srs-se1.protection.inumbo.net>)
 id 1qgoAC-0007mU-Oi
 for xen-devel@lists.xenproject.org; Thu, 14 Sep 2023 15:21:52 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6bf98d61-5312-11ee-8787-cb3800f73035;
 Thu, 14 Sep 2023 17:21:50 +0200 (CEST)
Received: from mail-mw2nam10lp2108.outbound.protection.outlook.com (HELO
 NAM10-MW2-obe.outbound.protection.outlook.com) ([104.47.55.108])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 14 Sep 2023 11:21:36 -0400
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com (2603:10b6:a03:38d::21)
 by PH0PR03MB6706.namprd03.prod.outlook.com (2603:10b6:510:111::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6768.34; Thu, 14 Sep
 2023 15:21:34 +0000
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::cfc3:da2b:a0d3:e744]) by SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::cfc3:da2b:a0d3:e744%4]) with mapi id 15.20.6792.020; Thu, 14 Sep 2023
 15:21:34 +0000
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
X-Inumbo-ID: 6bf98d61-5312-11ee-8787-cb3800f73035
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1694704910;
  h=from:to:cc:subject:date:message-id:
   content-transfer-encoding:mime-version;
  bh=ApwKoNNOtFUz8QZiqkTK4w6qOreJTxdoKMEyf6BcTzU=;
  b=LK9mRGNKjeZNr6P3vCtUvbpQObcCcYwRrcpVlLNyERzbRcX+iwwYW4o+
   pT0OCZfYnHDOAWdtr7hmixg0TxhVbjLIpTI3HS9YeYAWIhdKhh3/Z7/pp
   zjiW+Bjc6xHRzhxZJlqna6xoQm6I9vNHbUGglaZvSvBlb+NKa9k0LGRkn
   s=;
X-CSE-ConnectionGUID: HmN5eX0AROiU7u0sUFud/g==
X-CSE-MsgGUID: YuIH9o0TQrykJwXFtYfeAg==
X-IronPort-RemoteIP: 104.47.55.108
X-IronPort-MID: 125376988
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
X-ThreatScanner-Verdict: Negative
IronPort-Data: A9a23:HW98x6CjgKCzhBVW/w/iw5YqxClBgxIJ4kV8jS/XYbTApG8mhTJVx
 moZWD+DO/bZYWSheI1+bN/i/EkGv5/Tyd43QQY4rX1jcSlH+JHPbTi7wuUcHAvJd5GeExg3h
 yk6QoOdRCzhZiaE/n9BCpC48D8kk/nOH+KgYAL9EngZbRd+Tys8gg5Ulec8g4p56fC0GArIs
 t7pyyHlEAbNNwVcbCRMscpvlDs15K6p4GJB4gRlDRx2lAS2e0c9Xcp3yZ6ZdxMUcqEMdsamS
 uDKyq2O/2+x13/B3fv8z94X2mVTKlLjFVDmZkh+AsBOsTAbzsAG6Y4pNeJ0VKtio27hc+ada
 jl6ncfYpQ8BZsUgkQmGOvVSO3kW0aZuoNcrLZUj2CA6IoKvn3bEmp1T4E8K0YIw2uNRXGx+r
 dUiDzEwMQ3bnN+Y3b78Rbw57igjBJGD0II3nFhFlGmcKMl8BJfJTuPN+MNS2yo2ioZWB/HCa
 sEFaD1pKhPdfxlIPVRRA5U79AuqriCnL3sE9xTI+Oxuuzi7IA9ZidABNPLPfdOHX4NNl1uwr
 WPa5WXpRBodMbRzzBLcqC/32bGezXOTtIQ6JaCZ1q9t2GGq3H0QKgIme0eKr/SQhRvrMz5YA
 wlOksY0loAi+UruQtTjUhmQpH+fogVaS9dWC/c96gyG1uzT+QnxLmoOQyNFadcmnNQrXjFs3
 ViM9/v2ARR/vbvTTmiSnop4thu3MCkRaGodPykNSFJd58G5+dljyBXSUtxkDai5yMXvHi39y
 CyLqy54gKgPickM1OOw+lWvby+Qm6UlhzUdvm3/Nl9JJCsjDGJ5T+REMWTm0Ms=
IronPort-HdrOrdr: A9a23:zqqQpKuEUk4fEBGbsNyNLXkP7skDstV00zEX/kB9WHVpm6yj+v
 xG/c5rsCMc7Qx6ZJhOo7+90cW7L080lqQFg7X5X43DYOCOggLBQL2KhbGI/9SKIVycygcy78
 Zdm6gVMqyLMbB55/yKnTVRxbwbsaW6GKPDv5ag8590JzsaD52Jd21Ce36m+ksdfnggObMJUK
 Cyy+BgvDSadXEefq2AdwI4t7iqnaysqHr+CyR2fiIa1A==
X-Talos-CUID: 9a23:Lt5NSmzMTEt8Gn6bTuUuBgU0H+Z4f02F5U33InLnFD5ydZOIRRifrfY=
X-Talos-MUID: =?us-ascii?q?9a23=3AFW1NYw16Vk/DbAYO65ghnczO5TUj0rmPKBEKyak?=
 =?us-ascii?q?/odiHFzNAFSusgjmeTdpy?=
X-IronPort-AV: E=Sophos;i="6.02,146,1688443200"; 
   d="scan'208";a="125376988"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oLvj0+BlPy77MHsSeWdkGBami3Z+PpZ1qa9TCHibUuH02Jyq/hme+evcIrBkbQAku4G8JhfM2PNtJlTiNhmEospI9RnXkby+4JNmr0YN8Hvu/QzE1TqoY6CkgVjexxiPM/bIwepS0GCDglV+Wes8ouZ0ZTAjpkohZaEoLm0wyy1fPpUd0IiILqTAPsd38oO5IhSG0yxp7KiZrEL+nfbGKXVFc5tb9OB3E6nj+WJV/B7j1btEryJDmvmgFrKCWpPWjufFMHgyYYKbsDWfx4n0jZNexyUz7JBkMbAwmXaeNClljxphUdgIlyw8TT4V+Cn9bmP75+t3AxbsReaCuTzk6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7VuvDmGAdv8kGvu2/DmpPoCvk4JMkNEUCn56eOzkNXk=;
 b=Yaxl+RRzu38YplQXMS55XecrizghH7pfz5UcDjdTs95LrFDwa9T35++GwcU19ztERdqVJ0Dt6qBPcck+JacJiLeHEoyRuBFlmwW5L9tL68Qa+qUXuJZe3QDOT/a/f/IKCfn+AtSCJ3Ha5Wc0KXSEocdJq34lKVbDzxdk7TnDT7txSpdPuaYsI1cnX6b2jgl7scTLGQxq9LqOY+dYm96LrJTwhkeb2k9SR8TBBHYdqmDrOOpj57tXz+uRXAxpiGFiFYPvgIan8PpsO2Xkh4XNMNTgSq3KCz9GesmsVo4wgbwg/T5gLhYzeIsnWyzXlLFXdqXjDtLf8wwnyTkrqdIp8Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7VuvDmGAdv8kGvu2/DmpPoCvk4JMkNEUCn56eOzkNXk=;
 b=Z13yte965XXAlrsu/+jvf/3cW8MYjEKqZJy6zgQhVZrqBGJ11JcmBsxAFqnPwyp2cN5PGjqtDkwGK5m0RiqWtw4u9+QsJPmWc5AjlH4X1Lgr4RkfBl4TmSCxwCiWMEhQ//HrCsZsZQztZySA1p50POM4kcZPPcOheUTX6iK6YFg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Wei Liu <wl@xen.org>
Subject: [PATCH] x86/shutdown: change default reboot method preference
Date: Thu, 14 Sep 2023 17:21:20 +0200
Message-ID: <20230914152120.92696-1-roger.pau@citrix.com>
X-Mailer: git-send-email 2.42.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO3P265CA0008.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:bb::13) To SJ0PR03MB6423.namprd03.prod.outlook.com
 (2603:10b6:a03:38d::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6423:EE_|PH0PR03MB6706:EE_
X-MS-Office365-Filtering-Correlation-Id: a526d4be-1b33-4581-2605-08dbb536481c
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	5+OffV0FpKoXMf7uKXKpbkXNqsrOlaIWmpZaBV+zFA3ty9d9NmJDkeb3QD71Podx5BXKMq2+FbZynG5fgiH7soSaK0MZwvNkHLbb8I0bSpClrmv/FDS+OY+z+90ylz8lus5Kg6dO8S/5i5m3WLkaSDZsd8YyoCF3tbwQamN2bT4eOH3ZB09ZEmoBBzJICqTh5d6cfjZq2fg959qSjNAxSr4HSb+XYv9KPkcn/cK8/5w/PGwzHs6bvZ+7tIoE4fZbNFG08lBxRie9Gvct1yMZj9Jnp+xu0ObmtFJHPvhIPzMFX1QirTj6aS57HedwH45DVGcTbfADP53FiOTromwjq/vPh8q3jeU4xkQPuvgJ9edHMUvgwDLaqcWB5JdLwzwWyt8TYddfP4du1vla6JblvJSItagqh01V5CnlRDJYplbn1i6wnOEdeJHnNpAAgHXe006HhU5kyRWb21zvqyK3+q3o4X8Qw4IPz9N2PFjgZodhMtld6557cSKNpocUYVVyvF+ibDAoMpAo9YBA4QsZEEPPNSqG/ja++HeqpzWX9ZOMDUKwiEbaFfrEfqqo4DyS
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6423.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376002)(366004)(39860400002)(346002)(136003)(396003)(186009)(451199024)(1800799009)(41300700001)(6506007)(6486002)(6666004)(86362001)(38100700002)(36756003)(82960400001)(2616005)(2906002)(5660300002)(6512007)(6916009)(83380400001)(66556008)(54906003)(26005)(4326008)(478600001)(8936002)(8676002)(1076003)(66946007)(316002)(66476007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?YUk2eXgxU1hLUTIzNHMxNHFrdGhMOFFwQkVPVllFYm9Mb3BrcXNyL1FPck5N?=
 =?utf-8?B?bjB5WjZUd2lGWVhGL3ROUjcyUjE5V1hqWTE4WUlLeTRuMlBrSklReFMxK3Bt?=
 =?utf-8?B?RDZ1Q0VualZDVWZxSlRuUlJHM282ckt3TzQveUtWWnlmZnY3YmNTUFZ0U0xs?=
 =?utf-8?B?Sk9oejdQdndlbmJSM3JCMmdPSmZuZ1I0RzdtUGU0c0Q3YzYwWGdTQi95di9n?=
 =?utf-8?B?VzJ6YzFwUUtJR2xlZ1ZZYXZUQThYRi9oZkRyeU9yeUFhSThBdVcyWUplNmgv?=
 =?utf-8?B?TG45N0xidjJPUURGV2RMamdCOHdjRU0zQ1lJRkl1cGdTM2FpUUI3cng1NjdI?=
 =?utf-8?B?KzRjOHkxTURpRjByeDNyYzV1R3pQVFlyazFZNlVYSWhEZ1h0cHRnVkhWWkg3?=
 =?utf-8?B?ZHlxU0JZWVpSbk50NWpBM3J0YW1yNVJaaGQxU0t0NUY4ODlxdVRvL0IvbTE5?=
 =?utf-8?B?Wkp3ZWp0Y1daUWNLMjVnWWhZdFVvdjJqUUNOVm1TY1ZZejJQdVJ6M21XR2tR?=
 =?utf-8?B?YnhFZExqRHFJc1pmVm9nTlBPZjNiUUQxN3lHY0RzN3hWdFF4SkZaUnRoV1Z0?=
 =?utf-8?B?TExnaUZLT1NLWnI1RkRUMTM3NGtmV05Hd3RPWTdWdkVhYkZjN0syWnI5aHB4?=
 =?utf-8?B?ZWVOZ1NXNVFyT2FMNFVobGVlM3FKLzhHUlNickRadWZSTVhHZVIzNTlBYkZj?=
 =?utf-8?B?QzlMVHFXRVJFRnVsb0prTm1GMkRQV3F0bkNzK2xpVmtSMHIrMlRTNGRDdCtw?=
 =?utf-8?B?QTlNc2h6UVA4a0hUVHBER01STnV2VXdlbmw1U0hYOGNZWXJ0Z2hPTnpWZWtZ?=
 =?utf-8?B?MjJIY0JTZjRnbTZyNTNVM2x4VVJPVWZXK0JXOXBOa3F5UDBNNkc5c0FzNVBT?=
 =?utf-8?B?R2h3Rm1pYjh3Yk5vNGN2anR3Q1lCa2tOZnlCcHJvcXhxTXRJYlplMjFTM3Jv?=
 =?utf-8?B?R0dSSzRTcGFXSlNWSlJ3UGJYczEyam5oQXRhT0RxRldaMHk2Ylc3UERBL0FS?=
 =?utf-8?B?ZEpuUlpnUUpnNmhTVTZadWV6MnVJL09xakduZFBTcU1FNFpGakYvS2RMR29p?=
 =?utf-8?B?QUdXQ254YXV5ZGMyK3lQSFlFY3RvSGhuRlVsZ2R6L1MxelVUaXhjUkZMdTdZ?=
 =?utf-8?B?b1JRYUNrM1REV0tZVFh5c3JWWUc4K2FGcFp6djBUaG10QTk1aStNaUE3R1Iv?=
 =?utf-8?B?THkxdGpaTHZTbE5VWTJKd3R2TTg2R0F6SGNLOW9od1haTWNJQnBUQ2lVU0FS?=
 =?utf-8?B?RmYzVzJnYWNnUGVKZ3FSQW41WTN1UHM4UVhZdGllcUV6MjBHaWpNKzh3VlFa?=
 =?utf-8?B?MHZRbUtFZFRsUUFJTmdPc2dZd0t4dkd6cFpORVM1ZG5sWGJFdjhub1pITGZ4?=
 =?utf-8?B?UzBsVldxWEpVQ1lNZTJIeVlHV3NFUVc4aUdmcmJFUjVjUWJzbHJiVjQ2M0hz?=
 =?utf-8?B?NnB1RlBsNFZyQkMwMmVSZXZ2NzcyODIyZVdFSW43VkhQbnBLMEpzQUYya1Jj?=
 =?utf-8?B?TS85d0VrVkt3a2VYMnJoRlVDbExhUFJXMjNvRXZqdFVyTldycGYrZkdmQW14?=
 =?utf-8?B?ODFGZnFGbUpiZ3ZmK2N2ZlNGV0dtMUQrdkZlY05aSFpuemRyQXEzNWs0NVlo?=
 =?utf-8?B?bEhyMTliNTBhdTVKVW1mTlVJNUkzT0Nxajg3V0hiSjdwd0xtQTJFdEN3MVE4?=
 =?utf-8?B?S2ZOMnZBdWxGdmZlMTRCMmlIdU5JTFJMWDhVNld0akFCS1FQR1kvOFNmMWxM?=
 =?utf-8?B?R0J6NlFKRUJiN2dRdEN5TTJ3bXBxbEdkb214RDNHSk5KeDJTUU5FYUY3MUdM?=
 =?utf-8?B?bkhsOGVWamtyOW5rYXlCTlNDUnBjNjBkQVk0cmFQMUlOci9KbmZ1LzdXTk1R?=
 =?utf-8?B?R3lOa29GOUtDZFQvRmxQUjVpR1pBSElUU2R3VmNCQzV2QnRha1dZSlZGbjZw?=
 =?utf-8?B?QlFBa2NQMnkwL3htYUlBcmZWbDYwRk1MZEpxOXd6cFRzQ2lyeEJKVWxjMFhB?=
 =?utf-8?B?WHdLbVFNd0ZwMytEdmptMnpOUUJZMjBJeDJkekEyNXoxcVRqUXF1UUQyakRx?=
 =?utf-8?B?bTZpNUsyc1Z5eUh3VXMyV2VjYkVlRFlUL0JiWlVnb3BOZ0ZxUVRrVDdMOU8v?=
 =?utf-8?B?UFFGNGpwcU53U3pmeVRoa3lBNGI0WkFOcE5DTFRTUHJtemIxdlB0dUd5MHdq?=
 =?utf-8?B?Vnc9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	RNwG1mp9pIVVbOIK8wUZee8xbskUoP8MCtgIqBXL8Ubdo0KMwa07YEHwLvCYd6w+S34G+7z5wUsaMV02qnD23hMmyq7aYsf1q9+ipKEKyFPcoYluGzyJlP0L6JJDBjLQ85HOuv3Pun5Xci8H5+UsfBb30Wh70QPT9PWI4H52UyM6CL4TDOYCzrqvOQ4XYfXQOWLq4+RwMBU1PLvmkcSd0/TIfcFJF8qgS01SXp0Z9aClNzmxH3JU3JVoz90Kd57SXSJ/nMrKxW6+dSxywgP/2tY9zSfxeHVMUQlZanpSYjP7uzHRsw9Cir2kTJ6+DSpFjGLRQ84OBm3O9wzcR8GmW0Jaqt2IkFAN6/LojdUp5Y9BRhuGH9i/zZDPX16m93k0aJF+p+l2BiuBtYA5NsEWx5fom0GDLimJfLvlJ4R9MISorbT8PyjrCzr5VXtaGItptSkbja736unSO4lTnIoPD7QhbqsIdJXyIQgG/nXK+A9nSwNPuBhVYW81ois0JvjUWm9FU//htnTghgCdUh6ShJ+tEyq1JThNhda51RxUPl+kbop10jv1tXjpjREslVq/cpRyR+kE04q+7OXKkzV7Y5n7vg4iR6yT2yzRgbJ/g/n/StkMtbkKtpj/0cRyLkLRZLTKXKXNMm6Fyd651hinQT3QCBbQhbKcLP0sfMXQ/9b/32nUZTR8OIwWA98BOwzpI4OwrR93VK3Xy+lB5HrKWT0Y6W0QRkYh4aeFceJsFnvrbBnNlJY3McZk3SOq0cESJDKaO7FuMpopqwjeC8RdZwkc4cdaZp9Askrx42+SPXQmnfb6Bs9vZuODvIgh6HjW
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a526d4be-1b33-4581-2605-08dbb536481c
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6423.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Sep 2023 15:21:34.7629
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kgArpH0ZIICxrYXoeIxVTRh5DyLuCd6N3A5POb0vsrpIjQ9Cwu8lxHXyvqKy4vO4F/a+nwr0dR/Bdwhw2RFx9w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR03MB6706

The current logic to chose the preferred reboot method is based on the mode Xen
has been booted into, so if the box is booted from UEFI, the preferred reboot
method will be to use the ResetSystem() run time service call.

However, that call seems to be widely untested once the firmware has exited
boot services, and quite often leads to a result similar to:

Hardware Dom0 shutdown: rebooting machine
----[ Xen-4.18-unstable  x86_64  debug=y  Tainted:   C    ]----
CPU:    0
RIP:    e008:[<0000000000000017>] 0000000000000017
RFLAGS: 0000000000010202   CONTEXT: hypervisor
[...]
Xen call trace:
   [<0000000000000017>] R 0000000000000017
   [<ffff83207eff7b50>] S ffff83207eff7b50
   [<ffff82d0403525aa>] F machine_restart+0x1da/0x261
   [<ffff82d04035263c>] F apic_wait_icr_idle+0/0x37
   [<ffff82d040233689>] F smp_call_function_interrupt+0xc7/0xcb
   [<ffff82d040352f05>] F call_function_interrupt+0x20/0x34
   [<ffff82d04033b0d5>] F do_IRQ+0x150/0x6f3
   [<ffff82d0402018c2>] F common_interrupt+0x132/0x140
   [<ffff82d040283d33>] F arch/x86/acpi/cpu_idle.c#acpi_idle_do_entry+0x113/0x129
   [<ffff82d04028436c>] F arch/x86/acpi/cpu_idle.c#acpi_processor_idle+0x3eb/0x5f7
   [<ffff82d04032a549>] F arch/x86/domain.c#idle_loop+0xec/0xee

****************************************
Panic on CPU 0:
FATAL TRAP: vector = 6 (invalid opcode)
****************************************

Which in most cases does lead to a reboot, however that's unreliable.

Change the default reboot preference to prefer ACPI over UEFI if available and
not in reduced hardware mode.

This is in line to what Linux does, so it's unlikely to cause issues on current
and future hardware, since there's a much higher chance of vendors testing
hardware with Linux rather than Xen.

I'm not aware of using ACPI reboot causing issues on boxes that do have
properly implemented ResetSystem() methods.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
I haven't found anything in the UEFI spec that mandates to use ResetSystem()
when booted from UEFI, I've only found:

"One method of resetting the platform is through the EFI Runtime Service
ResetSystem()."

But that's vaguely a recommendation.

I've found a lot of boxes that don't reboot properly using ResetSystem(), and I
think our default should attempt to make sure Xen reliably reboots on as much
hardware as possible.
---
 xen/arch/x86/shutdown.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/xen/arch/x86/shutdown.c b/xen/arch/x86/shutdown.c
index 7619544d14da..81d8eda64a41 100644
--- a/xen/arch/x86/shutdown.c
+++ b/xen/arch/x86/shutdown.c
@@ -150,12 +150,12 @@ static void default_reboot_type(void)
 
     if ( xen_guest )
         reboot_type = BOOT_XEN;
+    else if ( !acpi_disabled && !acpi_gbl_reduced_hardware )
+        reboot_type = BOOT_ACPI;
     else if ( efi_enabled(EFI_RS) )
         reboot_type = BOOT_EFI;
-    else if ( acpi_disabled )
-        reboot_type = BOOT_KBD;
     else
-        reboot_type = BOOT_ACPI;
+        reboot_type = BOOT_KBD;
 }
 
 static int __init cf_check override_reboot(const struct dmi_system_id *d)
-- 
2.42.0


