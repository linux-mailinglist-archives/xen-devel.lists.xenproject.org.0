Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DA61B7331E7
	for <lists+xen-devel@lfdr.de>; Fri, 16 Jun 2023 15:11:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.550168.859096 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qA9EP-0002G0-7A; Fri, 16 Jun 2023 13:11:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 550168.859096; Fri, 16 Jun 2023 13:11:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qA9EP-0002EE-4B; Fri, 16 Jun 2023 13:11:13 +0000
Received: by outflank-mailman (input) for mailman id 550168;
 Fri, 16 Jun 2023 13:11:10 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=uwsx=CE=citrix.com=prvs=524b7acb3=roger.pau@srs-se1.protection.inumbo.net>)
 id 1qA9EM-0001xG-Pd
 for xen-devel@lists.xenproject.org; Fri, 16 Jun 2023 13:11:10 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 419748da-0c47-11ee-b232-6b7b168915f2;
 Fri, 16 Jun 2023 15:11:09 +0200 (CEST)
Received: from mail-sn1nam02lp2045.outbound.protection.outlook.com (HELO
 NAM02-SN1-obe.outbound.protection.outlook.com) ([104.47.57.45])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 16 Jun 2023 09:11:02 -0400
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com (2603:10b6:a03:38d::21)
 by SA1PR03MB6547.namprd03.prod.outlook.com (2603:10b6:806:1c6::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6500.27; Fri, 16 Jun
 2023 13:11:00 +0000
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::ab2a:a298:bacb:db47]) by SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::ab2a:a298:bacb:db47%2]) with mapi id 15.20.6477.037; Fri, 16 Jun 2023
 13:11:00 +0000
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
X-Inumbo-ID: 419748da-0c47-11ee-b232-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1686921069;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:content-transfer-encoding:mime-version;
  bh=VVZh+dgSVSe07XE3ToIkuC1ghXLj6DzyVNrGoP3ERmg=;
  b=ZJMmhsxz7HthTcW1nbambwrY+xwefIYrcyolsDSznSO7mPmeHqA4PD7b
   r3/DllHCHyYp7k/hBXdwPQApY70c0nf/QVdxmLvddJb9LLYg1jNCQa45i
   vIu4MQbqusroCARLrT71ZQMsIslHQrB+65wlrB7HavIgnrdkULITwJPnW
   k=;
X-IronPort-RemoteIP: 104.47.57.45
X-IronPort-MID: 111813000
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:ol6CxKCmgIxQPRVW/wziw5YqxClBgxIJ4kV8jS/XYbTApDMm0WEBz
 WobC2GPP/+LYGCgc9p0b4W29BxSsJDRzdZkQQY4rX1jcSlH+JHPbTi7wuUcHAvJd5GeExg3h
 yk6QoOdRCzhZiaE/n9BCpC48T8nk/nOHuGmYAL9EngZbRd+Tys8gg5Ulec8g4p56fC0GArIs
 t7pyyHlEAbNNwVcbCRMs8pvlDs15K6p4G1B4ARkDRx2lAS2e0c9Xcp3yZ6ZdxMUcqEMdsamS
 uDKyq2O/2+x13/B3fv8z94X2mVTKlLjFVDmZkh+AsBOsTAbzsAG6Y4pNeJ0VKtio27hc+ada
 jl6ncfYpQ8BZsUgkQmGOvVSO3kW0aZuoNcrLZUj2CA6IoKvn3bEmp1T4E8K0YIw2sUsHmFD7
 cwkARMGKT+Fmsyy2omCc7w57igjBJGD0II3nFhFlWucNtB/BJfJTuPN+MNS2yo2ioZWB/HCa
 sEFaD1pKhPdfxlIPVRRA5U79AuqriCnL3sE9xTI+uxrvgA/zyQouFTpGMDSddGQA91cg26Tp
 37c/nS/CRYfXDCa4WPcqyL13beXxUsXXqojHeCIy8R6uGa02082OicxWlqZ+MeQ3xvWt9V3b
 hZ8FjAVhbg/8gmnQ8fwWzW8oWWYpVgMVtxICeo45QqRjK3O7G6xGWwsXjNHLts8u6ceRzMw0
 USSt8j0HjEpu7qQIU9x7Z+RpDK2fDMTdGkLYHdeSRNfu4W+5oYukhjIU9BvVravicH4Ei3xx
 DbMqzUig7IUjogA0KDTEU37vg9Ab6PhFmYdjjg7lEr/hu+lTOZJv7CV1GU=
IronPort-HdrOrdr: A9a23:U1b0UK0/IkiRgDlMBhVIAAqjBH8kLtp133Aq2lEZdPU0SKalfq
 eV7ZEmPH7P+VQssR4b9exoVJPufZq+z+8X3WByB9aftWDd0QPEEGgL1+DfKlbbexEWmNQy6U
 9hGZIOcuEZDzJB/LvHCArTKadd/DGemprY4ds3Vx1WPHlXg6cL1XYfNi+rVndYaSNhHpQDGJ
 +V9qN81kGdkSR+VLXcOpEdNdKz3uH2qA==
X-Talos-CUID: 9a23:lZ14xmxNz7SmkZjwEh55BgU0OZs6cnDF/Ev5AET/JmB0ZrmPcmaprfY=
X-Talos-MUID: =?us-ascii?q?9a23=3AIGLbTA2RwbzH3TOmDExKlSS3/TUj0q3zOH03ga0?=
 =?us-ascii?q?9nNSnEB5KHDicrm2Ja9py?=
X-IronPort-AV: E=Sophos;i="6.00,247,1681185600"; 
   d="scan'208";a="111813000"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dkI5xGdv0NbGyVtksVHPFKqv8BUC9eRA6oRC2oL6jWGcZQRKcMX9HgHpxKi0kT+syeztVE7kARDP7pNYp6jp/l8MbTrh6HxVGrRc1ZYo/rHabRZZIDmceG3i788bAkCgoKGPl9QfFnXSVdOBInwzgLD/UW6WYDQMZFnGnYY0WgAmOG+ITjGHtBi5+Y0vH6wdl4aUuHK68UQ0r0V4+o/OhziM/PtpzizlG8wt6jLvnUlWXvUvLsR2KNjWtiHMGqQkGsWkIcRulgMSZs5yey8KDjr0qogpCL1rijcBV5nmp4ZnM1Sz/nMw06JKtnD+NagvASuaG1FK2ni9qKyRWSF1UA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mEbdhEtUGe5VZzMlFSg0aCuqqcHueFD8gRJQ93XBhdU=;
 b=ckbFGY9iBiBFqSTA6BVTyrVEXofYlVtVivJmG8OqQTzLNcIGOkEzOFi1drqatIJ00TXyDS4Mj6+7q3YHRfErXOI1Pxo1irrw8W42sptd0xpXJb6dZ4BDK7IwJtNMHyl7WzeLZD/S/tyOIIuAB8jQQ+TluaVZtYP4/dOt5XwpkmEgeQYb08n8+bdWanEuWNBWuXFiMYCEZgPoUUy6J5ZWI/R0TH1KVArE6ft2a5WTr9ECXGl08ADnsAtJ3uVub4cfSdXLc8WMQQGrRD4RFiyjnjT4rKKgr1Wg+tj+z/3T/ck1bgH/Wx8WZoVDF2agBzu+OdVWWtiNwfQsKuYQe2/qiQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mEbdhEtUGe5VZzMlFSg0aCuqqcHueFD8gRJQ93XBhdU=;
 b=ajoO/lOHGyoY7ESMSC4B0p7an5b+Aq4gGpDVvugp7SkIN5rY1RhSiZaXk6xQTKf4fDbsRxOoXBoYFhKDrKj5dUjxZOlN6hTRV0OwDbih/6eNdi3t0oNunSSsX4gv/YxSBzzLIhP2IpVX3K1LaYHp4ibpQH4DS49odHU2DkyzLEk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>,
	Juergen Gross <jgross@suse.com>
Subject: [PATCH 01/13] libs/guest: simplify xc_cpuid_apply_policy()
Date: Fri, 16 Jun 2023 15:10:07 +0200
Message-Id: <20230616131019.11476-2-roger.pau@citrix.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230616131019.11476-1-roger.pau@citrix.com>
References: <20230616131019.11476-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0507.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:272::17) To SJ0PR03MB6423.namprd03.prod.outlook.com
 (2603:10b6:a03:38d::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6423:EE_|SA1PR03MB6547:EE_
X-MS-Office365-Filtering-Correlation-Id: 20f7d8d5-c85d-48e8-55e8-08db6e6b215d
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	dlbjJVXfHqMLGeEyGIi32Q3z8USYVioebmIbJ+WXwACh67PfGS2kVkbw1TOAW9Wn3m3/1uOqsO7PX1aVdHOODaZhNnYpr/7jfAgm7Ln1BneogWI89gdQBN2d4Tk+v7sBPNa6PpcMEiuXlJ06DmeiUsquU8lIGd6KzjucsJAARDVAnZsPyocVyko4cYe+4wmZnKSalGC6YgTnFqRvkr3uo9CtpQjR4VqFhj9wvJjLeHSiNpILn8gunLmfOCLOMprSFKgxAwWqz6N6CW7KcXfdAz6t2n/K/nPpbcx9jDyEwlLnIYNMv4XeV2/r9pa1Koagx8CO/pabqu6Q/dVtMtWi/0xo+zNt/fFRgXvX08Le9dzbiSaZVbw4aDLNKfLcwd5TB7t3uFkgCj4gdhCV3j134g/Nnn1ILQBsdWOIiZ7SzC9jDR6RtA1VNE6517A9/LZJWxJrAA9f8qjr/cQDAo3vgnk8TdlphHwO0UQO6Wr4JmZZivdIDlKxWpuVdLO0Cl9MGdPf6s3JJF1XmVmo+x0Gc5u0E0YT6Pem38hx4RMEgPGUVzniQjOA1+gPOQvpc27P
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6423.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(366004)(39860400002)(136003)(376002)(396003)(346002)(451199021)(86362001)(38100700002)(8676002)(5660300002)(82960400001)(316002)(8936002)(41300700001)(66946007)(66556008)(66476007)(6916009)(4326008)(54906003)(83380400001)(2616005)(186003)(36756003)(478600001)(1076003)(6512007)(6506007)(26005)(2906002)(6486002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?aXZVdVhHVnZiWjd0M0svaS82TGxPbDRnZy9NZnlIWDFqNFA1SXpJNWZDV2lj?=
 =?utf-8?B?eklzbEMyOUdKWGhnUUhLbytHT1pYYUZ1blE1dWNOdytKL0Y5cVMrc1RmNHhV?=
 =?utf-8?B?RnpvRXRTa2pnTk9ESXB4WFVmMEdXaWVtTHd6U3JoSWxrM2lRejFvUUxtUTk4?=
 =?utf-8?B?bTdxYUg2ZVBiN0MwL2Y2cFNrdWhxRUtVbXJTSThnZFRqNHVCT3dyVGhzeVZn?=
 =?utf-8?B?K1VBWnJ0Tm02WFRnMTdmZzJJeFFhck9weVB0UjlqN1dGUTI0cC8xakt3aGxr?=
 =?utf-8?B?Z29TRmhIM0g0UTdpN1FIek1vbVg2UjE4dktoUFhrTkxOdC93NmRaaFIxTzAx?=
 =?utf-8?B?bEVoeDdxdlF6VkFyM0RTRDE0QjhOL2MvYVQzZzBBNmhYaXBDV1JXMmJhQjJG?=
 =?utf-8?B?c1gycmdJalhnQWRLM25TcktyVVRQYjNDMkc5NmhiOVFsWWo4aXVuMkp3N1Qr?=
 =?utf-8?B?enRnbTZQbkczOUo5WWVQekZ2aDE5S3cwSFFYTE9zbWMyRldudmkyMlNNR3hB?=
 =?utf-8?B?MHZocHB0NXMyRXhyY3VYUW9yVHhxSkRUTEQwdjFkVzluN0pWdHZPa1pDYjlG?=
 =?utf-8?B?UHVHMUhSRitYcFNJWkpoZTdXQi9nVEY4S3puL2MzeFZVamVvdFBTUWczb0lS?=
 =?utf-8?B?Y3B2TWlVUDQxM0hheDBFbXNHYjgvRjdoK3BTZVAzVERLVk9HZTRvVE1MOHpw?=
 =?utf-8?B?RmFyUDdPUE9nalJ6Yk9jbDBHQmJndG13cTFmRCs2QS9BZ2NmM3NraGJINTNn?=
 =?utf-8?B?ZnlaTjV0S0VTcTV5bUNrVmZ0VGxKRW1TTjgvb1RyS2wzeHFEY1JXK1hLWTZV?=
 =?utf-8?B?LzdrYW5YSU00OGovNFBxaDlkOW5TZ3VBRVIwblk4NExhYWFqNHRnVFAxNEVm?=
 =?utf-8?B?N042OE1GVlEyK0oydkNwWFpVdHkyVHJSbW0xNitjcTVNNW5Oa0lucTIxdGxB?=
 =?utf-8?B?N0pud0dPeWRDekJ6SVVSS3ZVOTZ5QWd6bEtLZ0xXd0tzYUlTV2ExcWRWTmI0?=
 =?utf-8?B?WDk0dGV2RnIvUnhpMkFMeDUxYmpqUkxTZnlIeHNLTVNFYXlQS2paQjlTVmhy?=
 =?utf-8?B?RXhjWFBsU2djQitkMUVlVGREdEI4d3ByMWlWbEZ5czIvTzRzbnFja1RRUUZM?=
 =?utf-8?B?MFp6S2F5OFRGWXZYOHpOYnhUS0lNL2I2WTZFdWU5ZmhOOXpTdlhrYUxyNGdH?=
 =?utf-8?B?YWpFQUQ4a1ZZSUtsaE9nTnJRQndkazkybDFBNWQxREtyYXl5Wk1lYWhRUFJH?=
 =?utf-8?B?RXVRMktBSkM4UlFzdUJIR0xZV2czUGFlRlViTmowRHFFcEd5bjJ2M016bFZa?=
 =?utf-8?B?VnFnTTkyWEF2MzJ2b0VYMjlmK0dyVGR2cnNsSHNHajluM0VEQW5ZMEJGMFdS?=
 =?utf-8?B?T21UN3VkNVMvMGNlcHJZZXRrbkc1Q1FKRlptTjRGaUI5ZDhhTU5VT0NpcHBI?=
 =?utf-8?B?eDMvRzNMNzE4dEIvZ0xtRGFTUUJxM2tCdk93RXE2MUQ0ZjduL0xDMFd4WTll?=
 =?utf-8?B?RkJzcEJGZ2FMbC8vaDltWEVibGVDNlZoV3p5R2x2d2ozTk1YU1Y1MjVIYlFE?=
 =?utf-8?B?TVh4OUYrc0tUVjFmbU9PRVdGQU9TK0c1WldVNE1aYWQvVEVKWmg3RDhEUmhv?=
 =?utf-8?B?WEhXd0ttVks1RThYRTROSDAxaFJCRG15dzJmZEMzekM5Z1d1S1Znd0ttYXNx?=
 =?utf-8?B?TGFNbU8zQlJCeVQ3N29kQjJhSlA2VloyejdlNWszNkJGaXJaL1haWERacll5?=
 =?utf-8?B?a0lCS2Y1eVpTejdlTWpFdmN6d2dDRXdkN09vaFpIU2ZGNmFWeDlsTHhjSlUw?=
 =?utf-8?B?cGJIeEI2RlcvakVuZjQvb3JDbDdHK0o0QXk0Yi8vWitpVlBMMThkOWw3TWI5?=
 =?utf-8?B?eEs1d2FpME5uTHcra0xqWEk0dUw1K3JUNldkWEx0TDRlTGdPdU5YN3Qxd1VJ?=
 =?utf-8?B?M1FyVmNxbUU0a3NxZG5hVVI4VHQ3S2ovTUFEU1RWVGpzOG13TllxQkVDUkJ2?=
 =?utf-8?B?V1VOcFROVm5rVnJuYlk4TUIvUDhublFTRVd5MXJwVXl1ZENYRi9qbzVsdjY5?=
 =?utf-8?B?bmxuc0ZZMk1XUzA0K3phSFZUdXdFaVBoVmJqWnhJZEI0VW9hS1VCS2g1SU5X?=
 =?utf-8?B?YWNlaWppQnJkZHg2VE9weHlqNjNLWHFpcWNET3FoZk5yckJ4RmR4Q1pBTWVl?=
 =?utf-8?B?dmc9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	4lGw7q33OkS3ecxKh8xGZu8+QsZSwLjxNyUEdm7tNXqUtuaRF6Ubl22qztVAfV9BOJT0zL4gkAQZbCeIKKnv6xygJQExM3NKKmn83wyVfgKtqdjUHnHmUQRZYO8Gg9Yy7lgiaOdT+CgyidsGorotRrLOWWer51G4oedWJEzoUu4YCZsUTwiTBulnb40kquV9v4eKg3fg69QPukksn5Ixocq5COKfy2iqZhU2UuSZSwAgxkN+LFoSmYr5hW9P2969Fe9ZTp0w1ErD7U8j/j3hO3jSHU5DMrFmU2HrTI/1kCXyQkVOCuMKmioEUpyAgB3SQhR3C267EGoq2loq61RJF7MBUVm3wsTxClVrrEDk9hmnY+zQSQAgecYE99mPOLZblJ4w1+lNM1tTPHmFcquL2On4X4hD1rm6gee3gjfLO/vsCKIradVZqjH9Ee0GUAkb8Px7FGR/AE656AunUjjJAghTKTqrOx6ecOdXsA5vz9GK5f+wdej5ur71vL4E5MytaHGwdC4gd//qeMRe2iM1YV/S7O8C7/hnZgxKe2ER74/ujVj+PqtJr87YNoUulWv2b9OWYX+peU7hJesR9tccLLY+cWVhMFM+sVh0wYvtaJ1Pj2FFTk3JvtyUphvRb63iYpftjg6I/y/2WvC/cinduG8CLG1Si4DpHHTgh3YiREpGVWq2KSEQViu7PMK7PB1umjRndkvsuAHU49oQpkv2JGRU0keU4Q0bGh6zwtip2abBUStQ3xG0izX5JdXHsbIs66IOEIVw3FKp6KjPqyouZxcWQMFFb1i41LCqkZQx6/yP05LZhvlWysdxz8r+uCZV
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 20f7d8d5-c85d-48e8-55e8-08db6e6b215d
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6423.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jun 2023 13:11:00.5840
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2GIA6ZLfY9G1TYjPOQpQmFiGtpA6e+T7AaySNbkFEwfLoQLghYJPFnSbQQW9TxIl+tvliIF5HumtovwU68n17Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR03MB6547

Introduce a local xc_cpu_policy_t and use it to simplify some of the
logic in the function:

 * Populate the introduced xc_cpu_policy_t with the current domain
   policy, which will already be the default for the given domain
   type.  This avoids fetching and processing any default policy.

 * Use xc_cpu_policy_set_domain() to apply the adjusted policy to the
   domain, thus avoiding open-coding the policy serialization.

Note that some error messages are removed, as the newly used
xc_cpu_policy_ functions already print an error message themselves.

No functional change intended.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
 tools/libs/guest/xg_cpuid_x86.c | 51 ++++++---------------------------
 1 file changed, 9 insertions(+), 42 deletions(-)

diff --git a/tools/libs/guest/xg_cpuid_x86.c b/tools/libs/guest/xg_cpuid_x86.c
index 5b035223f4f5..67e0dc9b4ad2 100644
--- a/tools/libs/guest/xg_cpuid_x86.c
+++ b/tools/libs/guest/xg_cpuid_x86.c
@@ -431,10 +431,9 @@ int xc_cpuid_apply_policy(xc_interface *xch, uint32_t domid, bool restore,
     int rc;
     bool hvm;
     xc_domaininfo_t di;
-    unsigned int i, nr_leaves, nr_msrs;
-    xen_cpuid_leaf_t *leaves = NULL;
-    struct cpu_policy *p = NULL;
-    uint32_t err_leaf = -1, err_subleaf = -1, err_msr = -1;
+    unsigned int i;
+    xc_cpu_policy_t *policy = NULL;
+    struct cpu_policy *p;
     uint32_t host_featureset[FEATURESET_NR_ENTRIES] = {};
     uint32_t len = ARRAY_SIZE(host_featureset);
 
@@ -446,17 +445,8 @@ int xc_cpuid_apply_policy(xc_interface *xch, uint32_t domid, bool restore,
     }
     hvm = di.flags & XEN_DOMINF_hvm_guest;
 
-    rc = xc_cpu_policy_get_size(xch, &nr_leaves, &nr_msrs);
-    if ( rc )
-    {
-        PERROR("Failed to obtain policy info size");
-        rc = -errno;
-        goto out;
-    }
-
     rc = -ENOMEM;
-    if ( (leaves = calloc(nr_leaves, sizeof(*leaves))) == NULL ||
-         (p = calloc(1, sizeof(*p))) == NULL )
+    if ( (policy = xc_cpu_policy_init()) == NULL )
         goto out;
 
     /* Get the host policy. */
@@ -470,26 +460,14 @@ int xc_cpuid_apply_policy(xc_interface *xch, uint32_t domid, bool restore,
         goto out;
     }
 
-    /* Get the domain's default policy. */
-    nr_msrs = 0;
-    rc = get_system_cpu_policy(xch, hvm ? XEN_SYSCTL_cpu_policy_hvm_default
-                                        : XEN_SYSCTL_cpu_policy_pv_default,
-                               &nr_leaves, leaves, &nr_msrs, NULL);
+    /* Get the domain's policy. */
+    rc = xc_cpu_policy_get_domain(xch, domid, policy);
     if ( rc )
     {
-        PERROR("Failed to obtain %s default policy", hvm ? "hvm" : "pv");
         rc = -errno;
         goto out;
     }
-
-    rc = x86_cpuid_copy_from_buffer(p, leaves, nr_leaves,
-                                    &err_leaf, &err_subleaf);
-    if ( rc )
-    {
-        ERROR("Failed to deserialise CPUID (err leaf %#x, subleaf %#x) (%d = %s)",
-              err_leaf, err_subleaf, -rc, strerror(-rc));
-        goto out;
-    }
+    p = &policy->policy;
 
     if ( restore )
     {
@@ -643,19 +621,9 @@ int xc_cpuid_apply_policy(xc_interface *xch, uint32_t domid, bool restore,
         }
     }
 
-    rc = x86_cpuid_copy_to_buffer(p, leaves, &nr_leaves);
-    if ( rc )
-    {
-        ERROR("Failed to serialise CPUID (%d = %s)", -rc, strerror(-rc));
-        goto out;
-    }
-
-    rc = xc_set_domain_cpu_policy(xch, domid, nr_leaves, leaves, 0, NULL,
-                                  &err_leaf, &err_subleaf, &err_msr);
+    rc = xc_cpu_policy_set_domain(xch, domid, policy);
     if ( rc )
     {
-        PERROR("Failed to set d%d's policy (err leaf %#x, subleaf %#x, msr %#x)",
-               domid, err_leaf, err_subleaf, err_msr);
         rc = -errno;
         goto out;
     }
@@ -666,8 +634,7 @@ int xc_cpuid_apply_policy(xc_interface *xch, uint32_t domid, bool restore,
     rc = 0;
 
 out:
-    free(p);
-    free(leaves);
+    xc_cpu_policy_destroy(policy);
 
     return rc;
 }
-- 
2.40.0


