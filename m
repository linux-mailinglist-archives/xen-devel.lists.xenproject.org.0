Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 299B4719CEA
	for <lists+xen-devel@lfdr.de>; Thu,  1 Jun 2023 15:05:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.542474.846391 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q4hzv-0007kP-RP; Thu, 01 Jun 2023 13:05:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 542474.846391; Thu, 01 Jun 2023 13:05:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q4hzv-0007hO-NK; Thu, 01 Jun 2023 13:05:47 +0000
Received: by outflank-mailman (input) for mailman id 542474;
 Thu, 01 Jun 2023 13:05:46 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=mSga=BV=citrix.com=prvs=509a852a5=roger.pau@srs-se1.protection.inumbo.net>)
 id 1q4hzu-000791-TG
 for xen-devel@lists.xenproject.org; Thu, 01 Jun 2023 13:05:46 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 04ac05f0-007d-11ee-8611-37d641c3527e;
 Thu, 01 Jun 2023 15:05:44 +0200 (CEST)
Received: from mail-co1nam11lp2175.outbound.protection.outlook.com (HELO
 NAM11-CO1-obe.outbound.protection.outlook.com) ([104.47.56.175])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 01 Jun 2023 09:05:42 -0400
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com (2603:10b6:a03:38d::21)
 by BY5PR03MB5347.namprd03.prod.outlook.com (2603:10b6:a03:218::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.23; Thu, 1 Jun
 2023 13:05:41 +0000
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::192:6bdf:b105:64dd]) by SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::192:6bdf:b105:64dd%3]) with mapi id 15.20.6433.024; Thu, 1 Jun 2023
 13:05:40 +0000
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
X-Inumbo-ID: 04ac05f0-007d-11ee-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1685624743;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:content-transfer-encoding:mime-version;
  bh=2n4arSTk5wOc7VPil1Qh67QOY54kclXss/Gd1eaIT84=;
  b=HlUFtaGJGvRgRZWVHAA3HTH9Iv7o0U0r0yDTSKyRHRzeyXR+LZzv1Twy
   REWeNSXWQ2gQES1ek+PquAvt5S9g2AQk+cmtoue+4ZSdmkV/UdvNuKDU9
   wH3UgsZ7a9jdEuKJRiCDJiGT/84INuSJFdbBau1MrCLVcGPAA7gDlFSx7
   Q=;
X-IronPort-RemoteIP: 104.47.56.175
X-IronPort-MID: 111630318
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:NIAHTqzQXJ+7ggatqHN6t+cRxyrEfRIJ4+MujC+fZmUNrF6WrkUFy
 mcdD2nSbP7ZNjP8KtoiO9zl8RkCuZ6BnIVqSQA+qCAxQypGp/SeCIXCJC8cHc8wwu7rFxs7s
 ppEOrEsCOhuExcwcz/0auCJQUFUjP3OHfykTrafYEidfCc8IA85kxVvhuUltYBhhNm9Emult
 Mj75sbSIzdJ4RYtWo4vw/zF8EsHUMja4mtC5QRgPakT5zcyqlFOZH4hDfDpR5fHatE88t6SH
 47r0Ly/92XFyBYhYvvNfmHTKxBirhb6ZGBiu1IOM0SQqkEqSh8ai87XAME0e0ZP4whlqvgqo
 Dl7WT5cfi9yVkHEsLx1vxC1iEiSN4UekFPMCSDXXcB+UyQq2pYjqhljJBheAGEWxgp4KUwS0
 fcjNT8zVDqoo/iy7LSrZK50ne12eaEHPKtH0p1h5RfwKK9/BLvkGuDN79Ie2yosjMdTG/qYf
 9AedTdkcBXHZVtIJ0sTD5U92uyvgxETcRUB8A7T+fVxvjaVlVMsuFTuGIO9ltiiX8Jak1zev
 mvb12/4HgsbJJqUzj/tHneE37aWw3ijA9tCfFG+3sZxo0WOnCs1MhkLCX/8h76AiVa8Y+sKf
 iT4/QJr98De7neDXtT7GhG1vnOAlhodQMZLVf037hmXzajZ6BrfAXILJhZDYtE7sM49RRQxy
 0SE2djuAFRHr7m9WX+bsLCOoluP1TM9KGYDYWoPSlID6ty6+YUr1EuQE5BkDbK/icDzFXfo2
 TeWoSMihrIVy8kWy6G8+lOBiDWpznTUcjMICszsdjrNxmtEiESNPORENXCzAS58Ebuk
IronPort-HdrOrdr: A9a23:U1H52K/Rb0+nZ4nv6sZuk+C7I+orL9Y04lQ7vn2ZKCY0TiX8ra
 uTdZsguCMc5Ax6ZJhCo7G90de7Lk80nKQdibX5Vo3PYOCJggWVEL0=
X-Talos-CUID: =?us-ascii?q?9a23=3AXJ8zdmvdWRy9gSpIsYDcSOnG6IsILlnW92rfHXW?=
 =?us-ascii?q?SIkJzTJGTWXHX4LhNxp8=3D?=
X-Talos-MUID: =?us-ascii?q?9a23=3AiD3Hiw0VmtDthnDaEU/45BrWzjUj27+NEF1X1rM?=
 =?us-ascii?q?8v9TYEWtWfA6elDaPe9py?=
X-IronPort-AV: E=Sophos;i="6.00,210,1681185600"; 
   d="scan'208";a="111630318"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZdFP7Y4KfV+NDzPLGrYPLd3tIQIw9IhQg3Yt0C2jGP7Hi8sdafseRjTGTiVl7NfuxYYqYBwuTMgr4Am769ufQ4wrwf+HO+wD44d/3BX7QG6YdAjgsIk2qW7oIWBxCnDGJCecAEOyFyT3u1jNgQeMcQdfzRQR6GpmiWJ2R4gcYdNrB74qfsm1mNid/DSU39+4izrFHOMuex06IHmxfAJnpo8lNCgyqifgQhK/iRzMLqgpk0b6JDaW5n0CPx9zF7KBOmtNtNgww8CbAnEL753EXy/FR3sqFayWAPaL7sCCSzouv49HB+7P1xeGZ2/ycgn668ZyoAOpHEGmBuOswsp7EQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=acbPmQOHVXpOvt2zjOfNJijiZJW8uhg4HOcOyYQ+YRY=;
 b=UaLR9SfeSKKw0YbAec20gg/R/NGc5xZKGYgSnj5y1Rxag7tuGs3v0FER87TpePVPbzgfxu9dZP0I4FFgJUcJcQh5x20svgcB7aO8cz1r67quAasVZf5qE4CxErAkGgr4slIaihjcHG5fBHAjmDZK7tZxfoNSZz1Jfo+1oCDpTUHSz2xtcVFd3Jj+in46dQNvrOGoNzzTkz4KiMzgl+yy0CdxNzIzPB/VqDjdoLqdHy1hY4cyw4PLHqBWcwqVgOxjt1ITbQY8BJRwKAIhwqwhNl5D/1o0JQ9DRYRpzTb7MNLF8xoKArqpUESoWKjmEEzk8PojR1YEZI5umEzIp/W1OA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=acbPmQOHVXpOvt2zjOfNJijiZJW8uhg4HOcOyYQ+YRY=;
 b=YNh3q+3stYWEbKxGJlxFnptpKng2ulBvt4icQN/t8ZhKEPWa6BSlwjOHVgmu1v8+2CBa/z+rXeepxPQ3ycrRMXwlm3nbUqlqp40jzVWn6caHsmF+l45ZLXfRLcti5M7ykOUlLA0nvZH7bgFt1Hr6Q+bHulS5Sl5NTwhr67+fX1g=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Wei Liu <wl@xen.org>
Subject: [PATCH v3 2/3] multiboot2: do not set StdOut mode unconditionally
Date: Thu,  1 Jun 2023 15:05:17 +0200
Message-Id: <20230601130518.48874-3-roger.pau@citrix.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230601130518.48874-1-roger.pau@citrix.com>
References: <20230601130518.48874-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO2P265CA0274.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:a1::22) To SJ0PR03MB6423.namprd03.prod.outlook.com
 (2603:10b6:a03:38d::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6423:EE_|BY5PR03MB5347:EE_
X-MS-Office365-Filtering-Correlation-Id: 13ae71b5-56d6-459a-ee07-08db62a0e630
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	63UdwiJ1BfwMcMUnQegRv/Yzb4xrnaM2F+VGfruMePiq1PRQxr+YuEZKbV4Ac/5V7AMYxXFEGX3WJnOi9OFEaX7Us0LNTaMbOyNilc/Xbt/13Md1sBkxaDOyp7KzPYVg59g2k9wx89VXHmeGOkBc77JCjqH9Q4vBw7b43JN17RoDTBA0YQBNJtOjk5PH7ZQxM/oVSXGO9N4VJ0zTD1zsU20Q9TtXuUwRGjqEXurQdR1iJKopAQnyk1GXH63LDw1lzpdLlGG/+Uz4zpJbE4LJ2SjoSpEBbzvZDaPRDr5no0x71XlOSWDJ3wIgucTOAS9kexck0cZ0OuRI4cea5rBdioNoxr0ppp0tSDHrz1EAJEIf7pmLJKy/Ou/HiTvJbaXE8TIm3kZUyLjibqviXmHPpAMHtaDDTXmatwhf+mpwaCPJBoBkUR3rMoQwzT11/V8P5nT71qRTp+7iSH6lrYOdAG2MulTDcgSmMGSCsbAX2e+aTaWxrzJE+A9Je1MIQN0pUvBvVuFHwnvxw73hVBCBfpssQFN2GEiHSqWUqVNuFFd6Yut3SkEMRQP2x0uoKe4J
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6423.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(376002)(396003)(136003)(39860400002)(346002)(366004)(451199021)(83380400001)(66556008)(6506007)(66946007)(66476007)(6916009)(6512007)(26005)(6666004)(1076003)(54906003)(2616005)(186003)(86362001)(6486002)(2906002)(8936002)(5660300002)(478600001)(8676002)(36756003)(82960400001)(4326008)(41300700001)(38100700002)(316002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VU9EbnZCdlM2WmloNjFKQ3FyekI2MFpINEV1c3hjYWpvNjZGdTBtN2kzNk5u?=
 =?utf-8?B?MHZyZUtwamtPRTVyL1FZb1FCVzRjbzRKSEt3Yk5hTjl6NVQ0eTR3eVcveGNB?=
 =?utf-8?B?MTV6UDZaaDJleUdvSk1mMkg1ZzRxM09GLzJXNFJDaEZTb3RFN0xVbTR6UDAv?=
 =?utf-8?B?V25OWmVrOG1jZE9DUU4vUlR2SWhZMVZLZ0J5WUt5ZGpyUi9zc1FVei85ODBn?=
 =?utf-8?B?Y3pkdEpZem5CWUtwcUI1RkVsUmJRQllSN3RaUG90M2RtZno3aVh4Vzlsclhw?=
 =?utf-8?B?U2lnZ0FWY1lVNTRlOVdCSjBGQm53OU1YTFBmM3AxK0VveXBPbUgvNlJkMEdI?=
 =?utf-8?B?RlFTM1RubEZ1NGNOR1R0SmU0TmRseWRVNEZNVlBET1J3dFZlYnVPRm1nUGoy?=
 =?utf-8?B?VjJQMEJ5WGpXakVWdE0wZEJDaE9adlFMTXZWYVZaUDlvbE8za1ZXY3lRMkx3?=
 =?utf-8?B?UlRPaUtjVU9PdDBPQU1LNzJjOCszZmgrbUNjM0Z4c0hPd0lSQTFORTU1L01Q?=
 =?utf-8?B?Vk1zRGNRS0JBam5aaDh5WFJmbk5lazFNMy8zdldodHhQb1AwdXFJdm8xbFRB?=
 =?utf-8?B?R043L25Fb0ovOEo4OEljVTJMemVOOVlYU0hUa285T3RYT2Y5WmR2UlRzMWtl?=
 =?utf-8?B?WllCbytYbU4ySWtDNzlycWtMSWU1TEVOUVNObER3ZW5WS1FpeVo0dHJxSnQw?=
 =?utf-8?B?cUhJMDRSQk5oQ0QvVmFhckRZY0Qybmt5Z1ZNdUl1aENzM3JEbmJHa1Q4M0NJ?=
 =?utf-8?B?MUkwbDNmaDcyelFBcHd1SXdaS2ZObUlWdU8zdGJTTG51VG1zUnNzVFVpVU9F?=
 =?utf-8?B?R3hwUzNrOUUxc2w0Mlh4NEt2cDYxUVBaaFk5YnlabWJnT2o4WWJPMThkVWhO?=
 =?utf-8?B?eWNrYWxuaGpiOXFyR1NzK25zbXI2M3RGbFZoZFZ4QzVzT3dmS1hEeVJhdzNr?=
 =?utf-8?B?UFZSOXIxbmJjdFozenpuQlpkVC9RVXFob1VMYkxJaDhzOGRVa3RkblptZHhL?=
 =?utf-8?B?dmQ0aHlQUG9KVFRWK2wwbTdTSjdhRVY2SFRlUExoNW4zNW9NSHVoMzlhQ1dw?=
 =?utf-8?B?dVpvSmpoMEk3NndsSHpmSjd2UjYxNXlVUkgvY3R5RVh6YnJqb2cxZUxSOTEv?=
 =?utf-8?B?V0JnTEY3WVRVRnpHdjVwWHA3ZzJuY2o0S0hsMEdYSHdSY3hONW1wSkhlQ0xN?=
 =?utf-8?B?T0tzY3JEV0JTczd5RVFtS2Z0VVBkNk5JdXJ4V2pvd0UwSlhtKzFtMGpxbmJk?=
 =?utf-8?B?azA5UU45azNEbWlFM002dUcvSzBhK1hBRWpQeWlZMFZBWHV4OG1JeThZNHB5?=
 =?utf-8?B?MmVCRktCYVdLSC9NakZyQnhTT2VEQ0FMWkJ6dHZvMnh6Q0pxdTlmWWxZbitX?=
 =?utf-8?B?ZmdrZ2dDa29kM0Q1N2JuMDc2KzBCb3NvbDZRMlBCdTBRd3N1R1dDQUt5Yld5?=
 =?utf-8?B?bUl2QVE3WEhpVTlJMzdLakRJNFcyNUNkNTMrV2l3NFFhRXI0cUJ5WURwMHY5?=
 =?utf-8?B?cWd2dCtxR3BJdy8rOFdvY2o5NVV4aStmelhsejZOK3IwMW9uUjMwbHhzaW4y?=
 =?utf-8?B?M0ZlQ1RXUUxjd2NqTFBZRDdHZHJaZytRSllsMHIrRXlQeTQzZHR3d0pJd1Z3?=
 =?utf-8?B?UmlSUThieTVlWktma1FCVUk2SGdWYjZPZkR1anBBQ0ZjUHNwVjVZNjRsVXNQ?=
 =?utf-8?B?N0R0aldUeGU5a09aQ0J1QmRCWTVTVm1lYmswSVBLR1ViVVpXNFE5SHpsY2pE?=
 =?utf-8?B?Rk1naGpIUlBja01jNlhUZkpNQmpjSDRPbUVaSU9LYmN1Ym1LSS9Ma3FPSnlw?=
 =?utf-8?B?WjFXMVgxRmorVVM3S1BDaElpWXEvTmNDaVVPSjA4NFVTQUNBUmxkNFlGY1hK?=
 =?utf-8?B?OVQ0b2dSOGtveDMrT2w0YWJSanlLSDRIdGw4WC8xMnRKeVFSZzcxNURFaTEx?=
 =?utf-8?B?M25ITjVmNUl5WXdFc203Nzlab09PdkNnWWJxa1Z2S3YrcWc5bGJPODV2cGZL?=
 =?utf-8?B?YWFZaElHWG1pd21OZmgxYmJHSlRFRHgvV2hObUhMNDdZeFZiN0RmTC9hclBR?=
 =?utf-8?B?alNneGpvOXJOTWo5Njh2T2d5ekZDVmVlTlduNzRzL1BpYWgvUUpBZkZzSFRr?=
 =?utf-8?B?bGkyNmRPN0l1OGcvbGs4bDBLeWprU294bm00T2ZUVEV0VHA3RFZTa00rUmVm?=
 =?utf-8?B?TWc9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	vHlw5jpgioz598SzX6YV7Qvz20IQ7BBIxFEn/HYVXsTL5FWfjLu15x9Pgv8zAOFBdsO4TijaCtzK/336rnh4VWt7btMpD2Cf15pOMkRob+O8biLGZIoZCCPbDurmnwTfVFC7oWdgLyfDCGBFiRshdoOzKImgdtfQDngiuinrnxbgoL0m8q+MUmT350KExhgZaNiajQgSu+2W46bOQUu7WyvfquBm1pYGgLh/vdbs6nC/tDJUnb37owNNjn2gQoXr/+8/8p5gf9KOPZUrBFCHP9o/+oCS2SVszqQffKJS0OqX9UgCzsPhb6ZNqZ+IN+jgqq0nx2qh1eu5PxYrpFXQOluRCVQLCoEctnbQnhSmrEns/yKfgyMXsa4MPXd+WOEiJFWhiInythg25k27lcCxMZcrwaY8xOzf6v+DbTBmZWJUNM7LaXRTdjnYVoyMfQ96E50hVyvdg5PUWT8CJKLdp2jedSLxT/Os0hpEMAOGqfNb0W8UkVHMO/RF6LKvfYAFoklzqezNV9TivBIb6qxmkh+g/BW8XgfFIo5PbxAh5SJgqpBjqltg46LHlabMevEM7wcnzpBn5jI12LekWD7t9slyYp0n3TEiPvxeVToiJBT/koeSF9BZN+fAD9kpQh5FCQiWy6AjgXntI2ThbKdMv0Hc1ga/oYSYy4PBzXzbzx2f9B/0M9l4dvKzbCMNm3CSddYAiB2um6wDHJsPmGHUAbysZiInRUQUxus/fTNQ+ixljlXeIkogcrLTzWC7b2mRX0rHSDSYUBzjQMYGVZ4f0VXarbQuCaVZe5ZBbqKOmMZYk/6WPfSkjskK/H8NMpYN
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 13ae71b5-56d6-459a-ee07-08db62a0e630
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6423.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jun 2023 13:05:40.2056
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xRY98+i0MpgKWAaI4sHeg6W1oeMN3t8NFgssOeX5Ooy/Ow3AtNRBezt4DM5zWz5rRWeW3ZhzLqQ3g7ixCYv/rw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR03MB5347

Only initialize StdOut if the current StdOut mode is unusable.  This
avoids forcefully switching StdOut to the maximum supported
resolution, and thus very likely changing the GOP mode without having
first parsed the command line options.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
The code is very similar to the approach suggested by Jan, please let
me know if you would be OK with your suggested-by tag added.
---
Changes since v2:
 - Use approach suggested by Jan.

Changes since v1:
 - New in this version.
---
 xen/arch/x86/efi/efi-boot.h | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/xen/arch/x86/efi/efi-boot.h b/xen/arch/x86/efi/efi-boot.h
index 003ef037bf07..5314f4293b12 100644
--- a/xen/arch/x86/efi/efi-boot.h
+++ b/xen/arch/x86/efi/efi-boot.h
@@ -820,7 +820,13 @@ void __init efi_multiboot2(EFI_HANDLE ImageHandle, EFI_SYSTEM_TABLE *SystemTable
 
     efi_init(ImageHandle, SystemTable);
 
-    efi_console_set_mode();
+    if ( StdOut->QueryMode(StdOut, StdOut->Mode->Mode,
+                           &cols, &rows) != EFI_SUCCESS )
+        /*
+         * If active StdOut mode is invalid init ConOut (StdOut) to the max
+         * supported size.
+         */
+        efi_console_set_mode();
 
     if ( StdOut->QueryMode(StdOut, StdOut->Mode->Mode,
                            &cols, &rows) == EFI_SUCCESS )
-- 
2.40.0


