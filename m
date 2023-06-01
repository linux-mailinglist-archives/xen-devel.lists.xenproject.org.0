Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BE9F1719CE8
	for <lists+xen-devel@lfdr.de>; Thu,  1 Jun 2023 15:05:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.542473.846380 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q4hzp-0007Qy-D7; Thu, 01 Jun 2023 13:05:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 542473.846380; Thu, 01 Jun 2023 13:05:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q4hzp-0007OH-9G; Thu, 01 Jun 2023 13:05:41 +0000
Received: by outflank-mailman (input) for mailman id 542473;
 Thu, 01 Jun 2023 13:05:39 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=mSga=BV=citrix.com=prvs=509a852a5=roger.pau@srs-se1.protection.inumbo.net>)
 id 1q4hzn-000791-Kr
 for xen-devel@lists.xenproject.org; Thu, 01 Jun 2023 13:05:39 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 004cf82e-007d-11ee-8611-37d641c3527e;
 Thu, 01 Jun 2023 15:05:37 +0200 (CEST)
Received: from mail-co1nam11lp2171.outbound.protection.outlook.com (HELO
 NAM11-CO1-obe.outbound.protection.outlook.com) ([104.47.56.171])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 01 Jun 2023 09:05:35 -0400
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com (2603:10b6:a03:38d::21)
 by BY5PR03MB5347.namprd03.prod.outlook.com (2603:10b6:a03:218::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.23; Thu, 1 Jun
 2023 13:05:34 +0000
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::192:6bdf:b105:64dd]) by SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::192:6bdf:b105:64dd%3]) with mapi id 15.20.6433.024; Thu, 1 Jun 2023
 13:05:34 +0000
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
X-Inumbo-ID: 004cf82e-007d-11ee-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1685624736;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:content-transfer-encoding:mime-version;
  bh=VJSlJaIKoPPgvsYBl22uXLchS+5rz42OA2KQbvnlRFU=;
  b=YTyaouC08aSWEi161KeJYaM+lM6bhGHUoV8n5WFfEHy1o6G4mwVzUa3F
   s34ofqfeK/TiOEJgFbUwjVBiy11Esh/ZoP9760PdCSS8WkwVmMoNY1b1K
   NuMv2fU5hof7tfhT4v6lENxsrWCyRmfJ7i1DkKsLgxGOUYkNWuqSgn0OF
   0=;
X-IronPort-RemoteIP: 104.47.56.171
X-IronPort-MID: 111630301
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:6oETfaCnWmwkRhVW/w/iw5YqxClBgxIJ4kV8jS/XYbTApGgk1jABz
 mcaW2CEPKzfMTCjKowkOomwoEIHvMOEz4dqQQY4rX1jcSlH+JHPbTi7wuUcHAvJd5GeExg3h
 yk6QoOdRCzhZiaE/n9BCpC48T8nk/nOHuGmYAL9EngZbRd+Tys8gg5Ulec8g4p56fC0GArIs
 t7pyyHlEAbNNwVcbCRMs8pvlDs15K6p4G1A5wRlDRx2lAS2e0c9Xcp3yZ6ZdxMUcqEMdsamS
 uDKyq2O/2+x13/B3fv8z94X2mVTKlLjFVDmZkh+AsBOsTAbzsAG6Y4pNeJ0VKtio27hc+ada
 jl6ncfYpQ8BZsUgkQmGOvVSO3kW0aZuoNcrLZUj2CA6IoKvn3bEmp1T4E8K0YIwx89OKH1l5
 /AjFTEPVCGItuia+rCgc7w57igjBJGD0II3nFhFlGicJtF/BJfJTuPN+MNS2yo2ioZWB/HCa
 sEFaD1pKhPdfxlIPVRRA5U79AuqriCnL3sE9xTI++xuvDG7IA9ZidABNPLPfdOHX4NNl1uwr
 WPa5WXpRBodMbRzzBLcqyvy3beUxXqTtIQ6EI28z6A1jHmq2TJCMUAXdV2ymePklRvrMz5YA
 wlOksY0loAi+UruQtTjUhmQpH+fogVaS9dWC/c96gyG1uzT+QnxLmoOQyNFadcmnNQrXjFs3
 ViM9/v2ARR/vbvTTmiSnop4thu3MCkRaGQFPCkNSFJc58G5+d5qyBXSUtxkDai5yMXvHi39y
 CyLqy54gKgPickM1OOw+lWvby+Qm6UlhzUdvm3/Nl9JJCsjDGJ5T+REMWTm0Ms=
IronPort-HdrOrdr: A9a23:bBqjx6sVyPVT9PMsL7V9Apbo7skDsNV00zEX/kB9WHVpm6yj+v
 xG/c5rsSMc7Qx6ZJhOo7+90cW7L080lqQFhLX5X43SPzUO0VHARO1fBO3ZogEIcxeUygc379
 YDT0ERMr3N5VgRt7eG3CCIV+wO7fPC2pqO7N2uqEuET2tRGt1dB9ESMHflLqV0LjM2e6bQDP
 Cnl6x6T6LLQwVsUiy8bEN1JtQq97Xw5erbiQdtPW9d1DWz
X-Talos-CUID: 9a23:waFGbm2rsg0wj4W/92kHXrxfJ+kcW2H23nvrHk66M1diebe5c12LwfYx
X-Talos-MUID: 9a23:LaqLawQDt016gE3zRXTotDVbaphkx52xVhE0zJQmvcC8L3FvbmI=
X-IronPort-AV: E=Sophos;i="6.00,210,1681185600"; 
   d="scan'208";a="111630301"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=E8TAHZ56SXzkWbisjomQ8P/3nAEwLj1miAQWtQUXNMRorH1a0+GS2tnc9+tz8jjjwye/poEwdsv84m4EOiHSApv1IygsFm3m1pbY7pn9k2AuHx9QQKKfl8z8GUv17aCX67Dq+6Z7gYV2GjLhbMFaAVhseOFtKPe9E7uCBwdJxwViNE+LKUBYyjdAZkkMN7HvqQaS4+R0PnQnvtBKSmStI68iVVdkJyWASlb2/NmzfWzkDgPLzSrvTBi7bvvendmgW5Qr96CBczUYjPbYVQOQbZu6sQjWJE/TSqGayOSvLVzZ+YxFeeZJKLj1C1GZtHEnu1pqrznAL1cyHoUrx0rjpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=M7VopqNXdUxcJxKf8MHX3XuEw2geRVIEfFA9FplnD9E=;
 b=i3eDJlmPfmi201BA9ptj9OJ1kfcJ2vnv8btkaVYcuxL/sRX0CxkVbaNLCQArk1NvOJ4GgeD4TaQSuINHrjmyO71j9eYIWdp/FCVZYgxurLiVazCxHOqTstQ6j50p4Z60CpeXoIvqZk6lNLNpWHOPFv7J3op8aH3W9tGI5gQ0wUW/QkCjMzqexoWG0nPhNWUHjcPL87o0LKPdxYZio7clArNztSqges1eOXnOOsKetZIyL8winscbVakoGtsPV1CSXOA+FH5+Jtr3gpuq5h8ac7hsJnhBfgd+sCadE6AJ3Z9be/8mgABQ5S2OSnJb2opUsKtAnmJRmP1aATdSE2VTeQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=M7VopqNXdUxcJxKf8MHX3XuEw2geRVIEfFA9FplnD9E=;
 b=BewzPtr3s1eQZjAplDqsSA9q04jG45kP8W7RJ/QJvnMPN17S5fBwuHX3A0vJEGglROhuWUhYdooWk1Kb8yj0mo65UFlq7iINtkBxIBjUUUxj5Hh2UZeB2SHUZu9rtua7qUEyDoowZiU9oeDB1mKXqiXm6o62mrEn80bYfDeX1tU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Wei Liu <wl@xen.org>
Subject: [PATCH v3 1/3] multiboot2: parse vga= option when setting GOP mode
Date: Thu,  1 Jun 2023 15:05:16 +0200
Message-Id: <20230601130518.48874-2-roger.pau@citrix.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230601130518.48874-1-roger.pau@citrix.com>
References: <20230601130518.48874-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO2P265CA0122.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:9f::14) To SJ0PR03MB6423.namprd03.prod.outlook.com
 (2603:10b6:a03:38d::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6423:EE_|BY5PR03MB5347:EE_
X-MS-Office365-Filtering-Correlation-Id: f97cdd91-99c8-408e-a412-08db62a0e2b0
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	EE0MyN5mS2B7AoRGrrfpj18UFxOcObDP6OfiPqx5D7145n9oP4BzpVBecJOTMHCrU0FOSQOjpQJjXH7Wt1w8EpKVUb/qc3qM4MJUezg8i00BotiBCxgYe+yPWb0+oEQUg9pPQlGRLRZCqOXm+agxWsK3XqSHV0ZCcmwR/HSZ+vc2VEC3uQTvAEaMGjK9XdY/nf+9HFt8pQeIJxTQYYCbjZjBYZZv9r5R+ppLk3WphFtj5L1DToMxeSk7sJFsw0fu0AIx5PISEEmec8qN+qinPsHAwdSIWgIoFOiDAR8yik6R93ID9Y++OMcSh9recVYmwIKffN7G13jLf3oebSTGO+VoT2+qn1c0i/wIc9AalPS7M9ue3bJhbehqs1ThQKP0o1jt4SDd+7Qb9Mn9M3JZxTVskJHc2CsBspDfd6Tsk5qDNNoX3FlzG82i4fAUr9TLtBUgAKyIDvJJV2bVxR/5hQGQpQbMn4e91VrDpN8OzgfOW0UQp3JHXouC3mY50QyJ6ofwWITDzFMre7/+WfXnct/IUlbmmwdluqTaLY25UOC5SHO4xQc3AniRigKY6mfG
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6423.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(376002)(396003)(136003)(39860400002)(346002)(366004)(451199021)(83380400001)(66556008)(6506007)(66946007)(66476007)(6916009)(6512007)(26005)(6666004)(1076003)(54906003)(2616005)(186003)(86362001)(6486002)(2906002)(8936002)(5660300002)(478600001)(8676002)(36756003)(82960400001)(4326008)(41300700001)(38100700002)(316002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bUNXeHg1VnFVcmJ1ckpjMnpHYThvTTl1Sm9lOEY0RW9jb244QlhTVFZtSDhw?=
 =?utf-8?B?cGZONXo4M3BNOHZad2xYTHJuTDBOR1dXRjJyS3RoZ3VqL1ROOUFFN0NoeEd0?=
 =?utf-8?B?OFlhQSsyOWNHOWh5YzI1dDVlTXc1Q1V0cmdRdW8xdzFteFoyUFl6N243N2RF?=
 =?utf-8?B?M2xxMStFcnVHcE5mR2VybUk0NUVQTVUxTW1TR1cycnFuQWFwMEUxaG5OeGl2?=
 =?utf-8?B?Y0RtcVlLT2puN1NLaDNidUJjdG0zK1hDdXlhN2tNM3VFNVpFeWozWGhud3FG?=
 =?utf-8?B?YkxyOHJ6VUxRYVcydzVHb2ZUQVVrcG1oUDZHa1piQk05aW1aRkFqck8rVTJ6?=
 =?utf-8?B?NHBTbEVNY2YvVGlwSndseUFpdlFBSFZkNEovdjNkYko2R2pCYnpqZ0NtM3Vn?=
 =?utf-8?B?SFhCcE1rek5OMDkrMzdpOHcwa2F0OWlnOXh6K255QUdvSXdGa0wxWnVzWTI1?=
 =?utf-8?B?WjQrYVVMUC80aFB2cStXOG4xY1hBMUV0QXk4ZFh5TDllR2NTUHhTMUNIYnBS?=
 =?utf-8?B?SlNSUUk3cys3d3VmU0pvanFlSWd2eEJ2SE90TS90ankyOEFib2E4WWZtd202?=
 =?utf-8?B?dGZlSGtqcmt6bVRIaE8wdGNKY0VHN2lNKzFGd0V0NlpWNkV4QWxyY2ZtWjc5?=
 =?utf-8?B?TW9DL0kramRsbFRPNEdYMGJFQ0RRUllSTjV4aVZtSmNvSjNEcjBHOThiSk52?=
 =?utf-8?B?UERaWGoyZXFKaGIxWjJ0TEJxTmJ5UlY0RHNTZGxOSGVQUGpld0I3aXlQR0dj?=
 =?utf-8?B?eVdIUFdaNzVLa05GZ3o3cE5ZeWFndmhnMG80Zk9MaW1IQVJKQVAyUVFTWEl4?=
 =?utf-8?B?Vk92Ym0wcUFDMjhaOWlINHVoSXBWN2l2YkU3ekVublV2bW03cnptcnZWUUc1?=
 =?utf-8?B?SjNia21RYkNoNEhOdDBnSVRLRkFiUGJPNHVXSzJ3N0VYOGp3NjY4enYvait1?=
 =?utf-8?B?ellGMmNrbzhORG00cG00OWRPUU5NcWdMRzVCM0psZGMrY1YzWm5FQUs4K2k1?=
 =?utf-8?B?Q3paSkZTMTQ5alVENWRSblhkV1UvY3JGeGgvdkxxS2VMa1puUGx6cTFDTUFo?=
 =?utf-8?B?OS9ieDlNR3lKRHVKZ0VsNW1aZXRhRmE2QkFZbUFvRkttbnpvMVFWUDZncFR5?=
 =?utf-8?B?RkxhUm5CN1JiZXhaMUd1aTVYNGEyRDNjdG5TVDdqMXdsWURTOS8wbURoS3Ez?=
 =?utf-8?B?bCsxOE8xRDF3N2J2ZG44M2dZK0FVQ2VPU1E1c3c2WHlIVml1eWtvUkRGMTBU?=
 =?utf-8?B?enhGZ3UxczcxYVdWMHp4YldWMDZuci9wWk9ZSC8vdjRlWUp1UVRsbHBDUCtv?=
 =?utf-8?B?cXFlRUx4dENhaTFSUE9FQjhXdHkwTXhkU2s3TFp4czdaZVh0Q3U3MlRWcjJV?=
 =?utf-8?B?SnRrenFkTWVHMU9pbzEvK3pHcTVBbzQzbnFJOFI2Q1dkU1ZvSUJ3UHpZRk1X?=
 =?utf-8?B?b1QwZHNCUlIwdXhrOXBKWE1PYWZDRFIzTDk2QWVqV3NiMnA1YkpRWUp2bXk5?=
 =?utf-8?B?bkdWWS8xanE4SmdmNlhlQzlyVnRnK0w5dDkvK0NDVXE1UmVDWEFlTk1aQUt1?=
 =?utf-8?B?akhIQUgrYzB0ZjNoOVlqZHo5djltbm11cmRtWDZYejJOeFIvaFAyYzZMWjNh?=
 =?utf-8?B?K0Nldi9oeVlOd0RVckoyV3RyREpzaFFvT2NEVjRLSzFMalUxb1luWmM5NkpK?=
 =?utf-8?B?QWg0VVdVSGRJMzB4V08zRlk4LzdnMjFwQVRnSHNwZVhNS2VTNWFoTjlrUWc3?=
 =?utf-8?B?UE9HTnZmZ2dyQmhRZkp0UHlGSGhGbWRRSFpWZnVHWmZOYmUvK1g4czJGNmtl?=
 =?utf-8?B?Um1naWV6dVhjT3dSaVhHcEdKOUpWQ1l4a2IxdmY4UWVMS1IzRXQ4ZDcySzdU?=
 =?utf-8?B?bk4rNWpmMGkzMTExSUdCYS9ERDdoeXIyZlVHV1hsZ0ViSlJWNW9NNEp5djZm?=
 =?utf-8?B?cHhRa203ZUxrWkRieHVTMWhMN1RZZEhGTTJ5SjJDUGNualNnYVNyN3FqV0pM?=
 =?utf-8?B?ZExmNS9OUTRnYkhxQnhrUGozK3BmNTlaaFJoaitvOEZnYndobnBFTnpNTWxx?=
 =?utf-8?B?M1lyYTJ3MW5qNEFyVnNpMWN4SWNmdSswYnhxSDZkZ2pLb2J0OU1sMnlSNnQ3?=
 =?utf-8?B?blRTR2pKOExEd01meExNdk9rY0JiSUY2eThQaDdQYmh6RVJrT1d1M0NibzEv?=
 =?utf-8?B?NWc9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	0rBDMDZaKbfPrYQfI+FYg82aPTWcUsHFkTY/l56RquOgJPi1JBMRlnFgZMBL20lylKuxuDrwPh5ljgQRMgvN1Pcz/QroIjtxNRkG3zNvkiv7jPUSCmqzl1ysvfHD3OUQJ23tzCKcNCR0wUmwSYm17tmgEvH0zLGZuHxSgDyI4tefeS5EbPYRncWsPpVUlDEXP+EVgM5gCVFf1i0Tjx0+A+V/I+qG2t7i3KpKV0RlJIKrbR5VpBsn45BHH22ezqLGRk/5ZwgsT2qXHAXGE7qKUQbcSav2tKBS72zHLGGMYylIDH4hr9S9+iRfP2E0eG9VcKIO29CTQUxLRT2GYuqZk2zd5P+fEo8C7a90zi2L9oNJ4GeLWwumAEYjzsOM8goTxkE6JFjZT6Q8AczcSnUWtNwZW9LWVEJ00RcO+EpqGprYnRsKTOgR5XIyj/PyXb69EWznD7xi8g6iEf+vcBJWl6MRDblIWSFhRgzVjuzWvPngTw0iUF2QcdzOv4AqBwFjsVItWFebF4OZ6VHOe1zDqvVfA7ONbB9X+fmb1G116h3pvkcJFt6p/vwc/4iyHmYIXfubYz2Ls6kxyHQ27hs+KZZOM3pd7zXDnGNc847Vy0hFKwJgq8Fllrnvh/On5v1v3pXh/qb9t3js2Q8fmR6WpK/YKZccsZgAs7/n9JY7FIDJtpt6fZBR2GC71f9cB2AYUtlkEN8LfaVPvgxfufivYdE/ldU3CMdVZcjHkV8YIcsOtn2T5Kzkl4ghji5FDvGHuMCCseTDiaDFuM1IBH/w7dz8W7fL0s6AaTKw7oCOMDWW4vdO1blb99Gcrq10t7GS
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f97cdd91-99c8-408e-a412-08db62a0e2b0
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6423.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jun 2023 13:05:34.3158
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: c6aN9hYmRcqUdhOXnWkyutB9xy4vWvi2phZGfAaT3qFgYerL1SB2sUa6skhwT6/3lTazQmBrsnrcLgvReTXJtA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR03MB5347

Introduce support for passing the command line to the efi_multiboot2()
helper, and parse the vga= option if present.

Add support for the 'gfx' and 'current' vga options, ignore the 'keep'
option, and print a warning message about other options not being
currently implemented.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
Changes since v2:
 - Do not parse console=.
 - Allow width or height to be 0 as long as the gfx- option is well
   formed.

Changes since v1:
 - Do not return the last occurrence of a command line.
 - Rearrange the code for assembly processing of the cmdline and use
   lea.
 - Merge patches handling console= and vga= together.
---
 xen/arch/x86/boot/head.S          | 13 ++++++-
 xen/arch/x86/efi/efi-boot.h       | 61 ++++++++++++++++++++++++++++++-
 xen/arch/x86/x86_64/asm-offsets.c |  1 +
 3 files changed, 71 insertions(+), 4 deletions(-)

diff --git a/xen/arch/x86/boot/head.S b/xen/arch/x86/boot/head.S
index 09bebf8635d0..aa443574d26f 100644
--- a/xen/arch/x86/boot/head.S
+++ b/xen/arch/x86/boot/head.S
@@ -226,9 +226,10 @@ __efi64_mb2_start:
         jmp     x86_32_switch
 
 .Lefi_multiboot2_proto:
-        /* Zero EFI SystemTable and EFI ImageHandle addresses. */
+        /* Zero EFI SystemTable, EFI ImageHandle addresses and cmdline. */
         xor     %esi,%esi
         xor     %edi,%edi
+        xor     %edx,%edx
 
         /* Skip Multiboot2 information fixed part. */
         lea     (MB2_fixed_sizeof+MULTIBOOT2_TAG_ALIGN-1)(%rbx),%ecx
@@ -266,6 +267,13 @@ __efi64_mb2_start:
         cmove   MB2_efi64_ih(%rcx),%rdi
         je      .Lefi_mb2_next_tag
 
+        /* Get command line from Multiboot2 information. */
+        cmpl    $MULTIBOOT2_TAG_TYPE_CMDLINE,MB2_tag_type(%rcx)
+        jne     .Lno_cmdline
+        lea     MB2_tag_string(%rcx),%rdx
+        jmp     .Lefi_mb2_next_tag
+.Lno_cmdline:
+
         /* Is it the end of Multiboot2 information? */
         cmpl    $MULTIBOOT2_TAG_TYPE_END,MB2_tag_type(%rcx)
         je      .Lrun_bs
@@ -329,7 +337,8 @@ __efi64_mb2_start:
 
         /*
          * efi_multiboot2() is called according to System V AMD64 ABI:
-         *   - IN:  %rdi - EFI ImageHandle, %rsi - EFI SystemTable.
+         *   - IN:  %rdi - EFI ImageHandle, %rsi - EFI SystemTable,
+         *          %rdx - MB2 cmdline
          */
         call    efi_multiboot2
 
diff --git a/xen/arch/x86/efi/efi-boot.h b/xen/arch/x86/efi/efi-boot.h
index c94e53d139a3..003ef037bf07 100644
--- a/xen/arch/x86/efi/efi-boot.h
+++ b/xen/arch/x86/efi/efi-boot.h
@@ -786,7 +786,30 @@ static bool __init efi_arch_use_config_file(EFI_SYSTEM_TABLE *SystemTable)
 
 static void __init efi_arch_flush_dcache_area(const void *vaddr, UINTN size) { }
 
-void __init efi_multiboot2(EFI_HANDLE ImageHandle, EFI_SYSTEM_TABLE *SystemTable)
+/* Return the first occurrence of opt in cmd. */
+static const char __init *get_option(const char *cmd, const char *opt)
+{
+    const char *s = cmd, *o = NULL;
+
+    if ( !cmd || !opt )
+        return NULL;
+
+    while ( (s = strstr(s, opt)) != NULL )
+    {
+        if ( s == cmd || *(s - 1) == ' ' )
+        {
+            o = s + strlen(opt);
+            break;
+        }
+
+        s += strlen(opt);
+    }
+
+    return o;
+}
+
+void __init efi_multiboot2(EFI_HANDLE ImageHandle, EFI_SYSTEM_TABLE *SystemTable,
+                           const char *cmdline)
 {
     EFI_GRAPHICS_OUTPUT_PROTOCOL *gop;
     EFI_HANDLE gop_handle;
@@ -807,7 +830,41 @@ void __init efi_multiboot2(EFI_HANDLE ImageHandle, EFI_SYSTEM_TABLE *SystemTable
 
     if ( gop )
     {
-        gop_mode = efi_find_gop_mode(gop, 0, 0, 0);
+        const char *last = cmdline;
+        unsigned int width = 0, height = 0, depth = 0;
+        bool keep_current = false;
+
+        while ( (last = get_option(last, "vga=")) != NULL )
+        {
+            if ( !strncmp(last, "gfx-", 4) )
+            {
+                width = simple_strtoul(last + 4, &last, 10);
+                if ( *last == 'x' )
+                    height = simple_strtoul(last + 1, &last, 10);
+                if ( *last == 'x' )
+                    depth = simple_strtoul(last + 1, &last, 10);
+                if ( *last != ' ' && *last != '\t' && *last != '\0' &&
+                     *last != ',' )
+                    width = height = depth = 0;
+                keep_current = false;
+            }
+            else if ( !strncmp(last, "current", 7) )
+                keep_current = true;
+            else if ( !strncmp(last, "keep", 4) )
+            {
+                /* Ignore. */
+            }
+            else
+            {
+                /* Fallback to defaults if unimplemented. */
+                width = height = depth = 0;
+                keep_current = false;
+                PrintStr(L"Warning: Cannot use selected vga option.\r\n");
+            }
+        }
+
+        if ( !keep_current )
+            gop_mode = efi_find_gop_mode(gop, width, height, depth);
 
         efi_arch_edid(gop_handle);
     }
diff --git a/xen/arch/x86/x86_64/asm-offsets.c b/xen/arch/x86/x86_64/asm-offsets.c
index 287dac101ad4..fbd6c54188db 100644
--- a/xen/arch/x86/x86_64/asm-offsets.c
+++ b/xen/arch/x86/x86_64/asm-offsets.c
@@ -175,6 +175,7 @@ void __dummy__(void)
     OFFSET(MB2_mem_lower, multiboot2_tag_basic_meminfo_t, mem_lower);
     OFFSET(MB2_efi64_st, multiboot2_tag_efi64_t, pointer);
     OFFSET(MB2_efi64_ih, multiboot2_tag_efi64_ih_t, pointer);
+    OFFSET(MB2_tag_string, multiboot2_tag_string_t, string);
     BLANK();
 
     OFFSET(DOMAIN_vm_assist, struct domain, vm_assist);
-- 
2.40.0


