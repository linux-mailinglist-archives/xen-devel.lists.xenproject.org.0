Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B62E77636DA
	for <lists+xen-devel@lfdr.de>; Wed, 26 Jul 2023 14:56:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.570451.892221 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qOe3A-0001Ff-9Q; Wed, 26 Jul 2023 12:55:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 570451.892221; Wed, 26 Jul 2023 12:55:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qOe3A-0001Cb-5i; Wed, 26 Jul 2023 12:55:32 +0000
Received: by outflank-mailman (input) for mailman id 570451;
 Wed, 26 Jul 2023 12:55:31 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=CD/9=DM=citrix.com=prvs=564dce665=roger.pau@srs-se1.protection.inumbo.net>)
 id 1qOe39-0001CQ-6L
 for xen-devel@lists.xenproject.org; Wed, 26 Jul 2023 12:55:31 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b0912e93-2bb3-11ee-8613-37d641c3527e;
 Wed, 26 Jul 2023 14:55:27 +0200 (CEST)
Received: from mail-bn8nam11lp2169.outbound.protection.outlook.com (HELO
 NAM11-BN8-obe.outbound.protection.outlook.com) ([104.47.58.169])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 26 Jul 2023 08:55:21 -0400
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com (2603:10b6:a03:38d::21)
 by BN8PR03MB4964.namprd03.prod.outlook.com (2603:10b6:408:7d::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6631.29; Wed, 26 Jul
 2023 12:55:19 +0000
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::2e0e:5665:96a7:5767]) by SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::2e0e:5665:96a7:5767%3]) with mapi id 15.20.6631.026; Wed, 26 Jul 2023
 12:55:19 +0000
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
X-Inumbo-ID: b0912e93-2bb3-11ee-8613-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1690376128;
  h=from:to:cc:subject:date:message-id:
   content-transfer-encoding:mime-version;
  bh=vgqRWK8tfo9aj9a9p03VkjdiV16dejpwJLjBoq41gu8=;
  b=V6zjRx8xeg12up/aOoWOgkOqeRF7tkHNv2hDKDyY6ImFu5OLDd3KFL8A
   yBsBfQaysFNw/fu3U7fYuH3WcSsJRalhiO4/MzaEEBUimos1vlNCVeA86
   qo/mrTu55nP8wT+EAhTqhvOM0GvqKwW/YBUWf+HxQAVBhnwE8x4LqXAlR
   c=;
X-IronPort-RemoteIP: 104.47.58.169
X-IronPort-MID: 120127588
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:NuKOsqzm9QTAwKTDWOF6t+f1xyrEfRIJ4+MujC+fZmUNrF6WrkUOm
 mYdXDyObPvZNGP1edp+aN+z80MO7Z/WyN8wTQVq+SAxQypGp/SeCIXCJC8cHc8wwu7rFxs7s
 ppEOrEsCOhuExcwcz/0auCJQUFUjP3OHfykTrafYEidfCc8IA85kxVvhuUltYBhhNm9Emult
 Mj75sbSIzdJ4RYtWo4vw/zF8EoHUMja4mtC5QRhP64T5TcyqlFOZH4hDfDpR5fHatE88t6SH
 47r0Ly/92XFyBYhYvvNfmHTKxBirhb6ZGBiu1IOM0SQqkEqSh8ai87XAME0e0ZP4whlqvgqo
 Dl7WT5cfi9yVkHEsLx1vxC1iEiSN4UekFPMCSDXXcB+UyQq2pYjqhljJBheAGEWxgp4KX4W3
 +A1BxQNVSGaiOOZway5V/Rvqf12eaEHPKtH0p1h5RfwKK9/BLrlE+DN79Ie2yosjMdTG/qYf
 9AedTdkcBXHZVtIJ0sTD5U92uyvgxETcRUB8A7T+fVxvjiVlVIguFTuGIO9ltiiX8Jak1zev
 mvb12/4HgsbJJqUzj/tHneE37WXxHmkBdJCfFG+3vw6kUOc3kcfMT4TSgWEitTgpkznZesKf
 iT4/QJr98De7neDXtT7GhG1vnOAlhodQMZLVf037hmXzajZ6BrfAXILJhZDYtE7sM49RRQxy
 0SE2djuAFRHr7m9WX+bsLCOoluaOiULLGlEeS4NSyME5cXupMc4iRenZs5qDaqdntDzXzbqz
 Fi3QDMWgrwSiYsB0fW99FWe2ja0/MGXH0gy+xndWX+j4kVhfom5aoe06F/dq/FdMIKeSVrHt
 38B8ySD0N0z4Vi2vHTlaI0w8HuBvJ5p7BW0bYZTIqQc
IronPort-HdrOrdr: A9a23:EshOta5Vcb4Ca1RpagPXwOTXdLJyesId70hD6qkoc20wTiSZ//
 rDoB1p726StN9xYgBapTnuAsm9qB/nn6KdpLNhWItKPzOWwldATrsSjrcKqgeIc0bDH6xmpM
 VdmsNFZ+EYeGIasS+M2meF+rgbreVvu5rY49s2h00dND2CRZsQlztENg==
X-Talos-CUID: 9a23:Mt9VOm58YZD4pPTJ4Nss6xY+Bu0KVn3m/W7fImC5F2R0Vb66cArF
X-Talos-MUID: =?us-ascii?q?9a23=3AnEp/xQzAiep/pW8pjoOGXievCemaqKb+GV4Cib4?=
 =?us-ascii?q?KguqBKnJPEBrEoDbufLZyfw=3D=3D?=
X-IronPort-AV: E=Sophos;i="6.01,232,1684814400"; 
   d="scan'208";a="120127588"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ekE9ZPfTSMGRoqn9tpy3J1VtC886DfN/ZiIXIClea0wc6ERZHC8bZ1/JAZttTCUSI+Ob3epaIDzJWUMhF/V93MjQO5hAny8VD3RwUKohkLn7QjY9l49f4gjOPTOjOyNCejdMIA1k/A0gL22Cuoh7WqP40wZKdAkTNqJSWsD73mM8IlsRbChHrnsZkka816BKItE4ebtlYi7x+EmlWOLxn4EVjwQD5GkPsNZKOK1en1sRC9p0v8wnOxpRtstXQHkIz1zmjRv2Gf9dMaVHpOd73dGkSCgEYx5twW665O7Q3T4P5YboSOu8douMHR19tLt5Elbl9nqVI0KE+MgZTd708Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=941+6Z5AEQVFDdrwbl2Gn52ILruhhjASKWT6E8DQ61Q=;
 b=b/KDyKUcl8gG7ODXTw8Z+RuPDLgUGsfMWiZtijC/3Aqaw01WitSVR0XEwX0oCCfUCTqXuMNNFCN8zkJTZsxxUrxbtxIHq8kmeG6JydZ7Td84Y0FwGKKZLABEUqruMRIESu085j9Snb/c17OlCIZ5SEvRWbSf307g2amH3fgbhFmazYLI34TJzus2efyPuajfPwq24Ht0ufV2SOf8ZaHEELi42APWgkZEFzQ5Yi5GZPnDjptyU9rpQcAmYKCD1bNke8xXIVBF1Vfb2VyeOE7ZYKPPJjdhVFuNGN5L+DPSH9KRKsZO/saFp80hVFWhqgfLj3UjjaakryCM4f51H7Omcg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=941+6Z5AEQVFDdrwbl2Gn52ILruhhjASKWT6E8DQ61Q=;
 b=gGPDcTaU5IWKDW9FTeGSntrJTjYPuc2EyZYxNf3Urf7YIzB9zisDlzQGuKXF8aQJjS6ldkVeHdVqqSpHSiZWy5JTg3l1slRtcII9CM28qyIgE0/Et5HRR6UJEcrOFTRcOJX78ptkAudR4SW8FmXFRXp7gCOghaOBMFrky3gcQQQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Wei Liu <wl@xen.org>,
	Kevin Tian <kevin.tian@intel.com>,
	Paul Durrant <paul@xen.org>
Subject: [PATCH v3 0/4] x86/ioapic: fix edge triggered interrupt migration
Date: Wed, 26 Jul 2023 14:55:04 +0200
Message-ID: <20230726125508.78704-1-roger.pau@citrix.com>
X-Mailer: git-send-email 2.41.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0368.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:18e::13) To SJ0PR03MB6423.namprd03.prod.outlook.com
 (2603:10b6:a03:38d::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6423:EE_|BN8PR03MB4964:EE_
X-MS-Office365-Filtering-Correlation-Id: b0cca426-8858-471a-4a51-08db8dd7907c
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	2dewUWWefGGV7TShxJOes85JiwfYurrcT56tA8lo+v5jvcmOKMD6ZGtBNEyFpv8MX2jIcfmaN4f3aO/SivOWZeLNIJcXcLPbVgeGVMjzyb7MCljU8g+QcYS4cO/lHDWwrjgY2cHeBkZJJ8tx9H2mJ4hZXGoOCu1UVSfUyuSvu4yQDhMInYHbCERTdwcyUEJeRyoJAEaTwoTYZ4khL1mXECB+XrPM1xOB0CMWBlBoR3hOedOt4vZpFSXz0A3ghBwisSfV0jEx2v63bMDacxXCTfQoh3LGOUeTBgROx63mq0RfONWyFl0Rslsl8u/bWcOPs95402/e4+znf/24RLg0orpjM9O9dLNpbo2Om/SP7Zn5XPhHYcygnAz5+AsEJvJVK3JdmR2Pu0W/xImhc1TqUw+k7FDJTFUP9rgfCdR0xOVYjSrU4St85Msrbn6XWW7AmZKp7rPhLpFG+N7IvSQOsL9TePmBrE7G7tbdKTnPvJWNnmJdIBqyynZSJd2kd0kHo2P3p9C3PzvcuNqIqOgKlAjRQbTnRTAK1JP0qZThbIEKtIpBGjJUBhqYNnWW4oPa
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6423.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(376002)(39860400002)(136003)(396003)(346002)(366004)(451199021)(41300700001)(26005)(6506007)(478600001)(38100700002)(6512007)(86362001)(36756003)(6916009)(4326008)(8676002)(8936002)(186003)(316002)(66946007)(66476007)(66556008)(5660300002)(2906002)(2616005)(83380400001)(66899021)(54906003)(82960400001)(6486002)(1076003)(6666004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VmtjU3ViSGlpYWpFMjJtaXNWRllUeDlEcy9yWExpQ2VneWx5TFF6S0ZkUVpn?=
 =?utf-8?B?S2VzVnBzNHJ4YjJsN0hnMzB6M1NDbkFPLzdJQ2VKTUZjRlRqbUY3ZGxBY1Ev?=
 =?utf-8?B?RzZnNVNidnVCWHY5S1BPWXE2NUdIQWdGdFNDQjVrZmZjWjNncEN3K2Z4cU12?=
 =?utf-8?B?ZmFTZTVoWHRtaEpsZE1wMzJacXpFckVqaitRNVgzcGp4UkFlcUlMZDRLOUNq?=
 =?utf-8?B?U3hwVmthaXNDTU1PNnJ1Uk9qbHpsZEs3eFZYNEErUklaWUU0cUEvbzVwRUJu?=
 =?utf-8?B?eXd3UFRXNmlRYTlKc2hsN29OTEhXdkduSHI3ZVpHVTlLaGtjYTJLUEZlN2V1?=
 =?utf-8?B?RHVqOFNrdlF4Y0NvVnhHb3VYQm1DMDdrK3p0b1B6cnpqRXBhK2J6SnRoRUFn?=
 =?utf-8?B?VkFHc0VmTUtWakpmRlFpejVwTkEzSGpGa1pnSkFtMll1NGtIV3hLY0NrbEpa?=
 =?utf-8?B?TXdUQ0MrOG9qYkRpZUNwVHgxQnd1UlMzRlA1K0oxa1FsSVVjdmJyUU9TUzdt?=
 =?utf-8?B?OVcvU1VRQmVxdVhEQU5JeUxIOGVxN3YyYlM5ek8rRk1tZUFDZG9naGxYWXkr?=
 =?utf-8?B?VEN5dVkrVjlOYUtuSG5VUjR2dEo0VE9DcmsxNUt2c2ZxYU96bk5nVFdxWUlm?=
 =?utf-8?B?R0JsYmYxSk50MFJWNXI4YVlZQjVoQVJUT2JVMzBHWjIzYXdWQUVGV3Z2VnV6?=
 =?utf-8?B?a1UxaTE3elBXdTBFUEhIakQvdDF5cWtsNVQ1ZUt1K3ZicUFiRk8rbjRPaTM0?=
 =?utf-8?B?Z242NzM4bitVQVpkVyt0eEp3MTlKNE9pUC9iNjFJTTVrbHBuL1I4Q2RDTFBQ?=
 =?utf-8?B?dEJyc0lFN1k4RmJPZVpkL3hrcE16MEovSjVJQ2VQc3MxaFI3d3dnK0xSWUdy?=
 =?utf-8?B?ZEVzbFMrSDQ0aUNvUksxUDJGcnJ5UHlJQ0ZDU005TlljK2hxbVVzUFBIM3Yy?=
 =?utf-8?B?c2ZCRXFvKy9XblR3MzNkQVFJbk1pRmRWT29ROUttV2U2V2ZzNU8vTmMzWjdk?=
 =?utf-8?B?REpxOU5LcmZ1dzVyNVlETlBaWWdIRmZuZmZxSGh0RUpmaUpsby9KbWh3UEdy?=
 =?utf-8?B?bE5CTXBjNllKMVpNNkxEb1BzRmdmbUgvTDBJQTlRQjhoMlAzQ3VtVjZIOCtS?=
 =?utf-8?B?dUdTM3J3NVNkSHhJNHNxR2dUMDBGYXY5ODRRNkcvbHE4UVVhaUg0dEh0WVhq?=
 =?utf-8?B?TG93YUdqZmJpWmV2QWVmaGlzZDB4cGJQM3F4NkVxWmd2UXNzejhZcmErYjNm?=
 =?utf-8?B?NVNmSmI4UUFveU8xc0owVkkzOGhiMVpKeTRobkZkQW1wbzJoRkd6WWc3bEV3?=
 =?utf-8?B?TmNVL2EybWtMOHVwK0Z1QkNkS1I1N2FrczJEM0JlRzcwbkZBYkMwMmpGVzB4?=
 =?utf-8?B?YVFkMnhZcXBPNVdsR3M4OWNDdlVCYXNmYm94Y0w0emMzZ2Y2ZUd3bGhDbldK?=
 =?utf-8?B?RzQyVU96MHhRaGt3Vmg0QVJjODMvelZCNjRUeGQvT2pBbjR3anI5RStaMmZ6?=
 =?utf-8?B?MGFraGI3SnZXN1ZZZi9WUHJJL3lQd3JYWDhrSEw3OFo0dFFaS3JwRE1TZ3pv?=
 =?utf-8?B?alI2UG90VUlIL1YrdnFuVlhrcnBiRGJ3NXdSdHRXVzNxcG03TUtXbFlQWU5h?=
 =?utf-8?B?SnRlT0s3SE9ZaVdPSkNtaWNvN041dGlxaWd1RjhlQytZVU9XTUtWa1hOL2hH?=
 =?utf-8?B?NHFuOHFmRjdXYjh3QjU1SzZGcHEzWnlvRVU4MUJWMURrY3A5QXBTT3NrdUJm?=
 =?utf-8?B?d1QydnI0aE5Dd1ZXQzAwQUhKWEM3bUQ4SldSdjd0ZEthOTJBck93cmhWM1Aw?=
 =?utf-8?B?NHlOL1VKdGtYNEdkZzA4RTZpZHpaM2JsMVVTSXhHZ0xQR00yYU1QUGRBUVVr?=
 =?utf-8?B?SnEvRG9mOFF1ZGtnb3pLUCtYSTN4R2Y4NmVEYVhvdCtqUDB1bE1xRy91aDJs?=
 =?utf-8?B?WmE1VGx5WFVDamJJbkczZzk5R0greTlmWCtQbnRRbkF0RVV6OVRiZlRlb1Iy?=
 =?utf-8?B?MmpWUkhnWmZ4T1daejNybFppUENtNldWSkkxZU85SzFGTkFTNFpNbGRWdXds?=
 =?utf-8?B?T0VFc0lQODE5ZTkvYXNDS1NzV3B1MHJOU1p6RzIyTG0rQ3FVTEFoQ01CcmR2?=
 =?utf-8?B?ZXltSGxHRk9FMTlXQmtwYURPWjc4WUlLcmpkODRRK3BEVFI5Z1JqM3d5MVQ1?=
 =?utf-8?B?TkE9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	ykXLoesWO+3G5KGDd2r0vMbANdY2U7wHGtT25sy5AfRdAgcZtm/QbXsIYyeXVzpUqNTajGppS43p979L7ODsKeIQVCa+5jk8jWg6KvSD9tnZg0AYiKct6BO8P4PIpcXcQZnw/BzRSYa9soOb5Us1cgyDvSVTPO4PL+BwnlSArQiaNwalyW5pvCPHotBpzzJeypyYR6jbhWIwDXAeiC4FdxGSE4i/dx8ZvXPT/Yeaer/1QBLCvcXyKnLJw/mjkx9SUKApDDYbFHwnmjeGBgYAT6yB/J+9CStIoZ1ztkmpjK/S1QgcQmypSA919WndWtatNO7Um4KHbXISsOkFP5M7DXMSrMooxbOR2k54Wd0+ol3q/7F3QVuPQIFu0QseobQbUZbj89m2K1RLV1O+7vfx5A9ozuozQfoepHnKprkcn06XMogiEbFV5ctxpNwfCpMP9JiA7KSAdnh2u04B2V9uaP5uL44MVd6CgxwP5n0XJ7THTx5fx0YZxkz6YaIck4YmXV6JPDImjSeR8kHNtW5oxvzEDK7sEtY2xqxBiCPDxuFPArSHofDfoWvYIcl98UnLiR5shbE98cxPiH3YLSp6izJbp3+G6ABcfrgFYo0v6QLeztOpY+dh98HubyoTNiTM1bZnUyekIexfcEbIumznpZf5q2o+1h2w6+ZnR46peES8FDftolKsrgUOJDMuMciA+F8HGFSvOkpBc4dlRoDPOeiSiRAmtMmU5EO3BD/R1NNxAEwaq7mTUfhCU6HqQl923DCa/WyKSY6tLByu7JNJcyLchAMtsi4PBiM+dAhStYBf8lIFx/TN0Qwqppc6qHGSxVSX07FSJEg5reRnPjAhIHohEBPz7b42VFpIcK0lZj4=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b0cca426-8858-471a-4a51-08db8dd7907c
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6423.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jul 2023 12:55:18.7542
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EPG3siw1JzIGY74DcHeovQ6niTGjN9ydVeZ4voGRJUywCuyb/SJfZwahxwsR8rvNiI2Vhgejg/yjdsuOVCESWQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR03MB4964

Hello,

Following series attempts to solve the issue with IO-APIC edge triggered
interrupts seeing an inconsistent IRTE when injected while being
migrated.

It's been simplified a bit from the original RFC, and does make the
logic in the IOMMU RTE update handlers cleaner, as those get passed the
full RTE.

When not using interrupt remapping the logic is left as-is.  One further
change would be to mask edge triggered interrupts, as destination and
vector cannot be changed atomically when dealing with plain IO-APIC
RTEs.

The previously final patch to switch AMD IOMMU to use atomic RTE updates
has been drop pending feedback from AMD on whether that approach is
suitable.

Thanks, Roger.

Roger Pau Monne (4):
  x86/ioapic: add a raw field to RTE struct
  x86/ioapic: RTE modifications must use ioapic_write_entry
  iommu/vtd: rename io_apic_read_remap_rte() local variable
  x86/iommu: pass full IO-APIC RTE for remapping table update

 xen/arch/x86/include/asm/io_apic.h       |  65 ++++++-----
 xen/arch/x86/include/asm/iommu.h         |   3 +-
 xen/arch/x86/io_apic.c                   |  46 ++++----
 xen/drivers/passthrough/amd/iommu.h      |   2 +-
 xen/drivers/passthrough/amd/iommu_intr.c | 106 ++---------------
 xen/drivers/passthrough/vtd/extern.h     |   2 +-
 xen/drivers/passthrough/vtd/intremap.c   | 140 +++++++++++------------
 xen/drivers/passthrough/x86/iommu.c      |   4 +-
 xen/include/xen/iommu.h                  |   3 +-
 9 files changed, 142 insertions(+), 229 deletions(-)

-- 
2.41.0


