Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 967D2753F7C
	for <lists+xen-devel@lfdr.de>; Fri, 14 Jul 2023 18:06:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.563700.881109 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qKLIU-0003RP-2e; Fri, 14 Jul 2023 16:05:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 563700.881109; Fri, 14 Jul 2023 16:05:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qKLIT-0003PA-Uo; Fri, 14 Jul 2023 16:05:33 +0000
Received: by outflank-mailman (input) for mailman id 563700;
 Fri, 14 Jul 2023 16:05:32 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1dmA=DA=citrix.com=prvs=552b8e743=roger.pau@srs-se1.protection.inumbo.net>)
 id 1qKLIS-0003P4-69
 for xen-devel@lists.xenproject.org; Fri, 14 Jul 2023 16:05:32 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3fbd6038-2260-11ee-8611-37d641c3527e;
 Fri, 14 Jul 2023 18:05:29 +0200 (CEST)
Received: from mail-mw2nam10lp2106.outbound.protection.outlook.com (HELO
 NAM10-MW2-obe.outbound.protection.outlook.com) ([104.47.55.106])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 14 Jul 2023 12:05:26 -0400
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com (2603:10b6:a03:38d::21)
 by SJ0PR03MB6438.namprd03.prod.outlook.com (2603:10b6:a03:396::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6565.30; Fri, 14 Jul
 2023 16:05:23 +0000
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::e14d:fb6d:9e52:1524]) by SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::e14d:fb6d:9e52:1524%4]) with mapi id 15.20.6588.024; Fri, 14 Jul 2023
 16:05:22 +0000
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
X-Inumbo-ID: 3fbd6038-2260-11ee-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1689350729;
  h=from:to:cc:subject:date:message-id:
   content-transfer-encoding:mime-version;
  bh=8lGIoVSmbQI3geIM7K6Dw264tZPPYS+3vpWdBhSRTXQ=;
  b=WL5DnF3IVWt0QQXj2kM/aAYukuHw/bbL6zyPKpHvWRugtP67JBIPEukw
   vm2GJzLyPbzDVBmz9BlTDBZHLgX5MiWzI1Ypo/J4xDsvIoLxmamDJ5gZL
   dRGR/fyCj2hsDG1bErz1FWiG2RATatPPbTHF6ecFEjNDyuFh/XZuAyn5a
   w=;
X-IronPort-RemoteIP: 104.47.55.106
X-IronPort-MID: 116129626
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:/sAoCqrSOYlCzPfFZOdsVEj32AteBmI+ZBIvgKrLsJaIsI4StFCzt
 garIBmDMvbeZjP3Kt12Pdi+/EJVvcLdzIQyQVQ9rik3QSlB85uZCYyVIHmrMnLJJKUvbq7FA
 +Y2MYCccZ9uHhcwgj/3b9ANeFEljfngqoLUUbKCYWYpA1c/Ek/NsDo788YhmIlknNOlNA2Ev
 NL2sqX3NUSsnjV5KQr40YrawP9UlKq04GpwUmAWP6gR5weBziVNVfrzGInqR5fGatgMdgKFb
 76rIIGRpgvx4xorA9W5pbf3GmVirmn6ZFXmZtJ+AsBOszAazsAA+v9T2Mk0MC+7vw6hjdFpo
 OihgLTrIesf0g8gr8xGO/VQO3kW0aSrY9YrK1Dn2SCY5xWun3cBX5yCpaz5VGEV0r8fPI1Ay
 RAXAA8zdh66h/qE/IqiRMUxns0KcM71LoxK7xmMzRmBZRonabbqZvySoPpnhnI3jM0IGuvCb
 c0EbzYpdA7HfxBEJlYQDtQ5gfusgX78NTZfrTp5p4JuuzSVkFM3jeWraYKLEjCJbZw9ckKwv
 GXJ8n6/GhgHHNee1SCE4jSngeqncSbTAdtMTefpqKQ06LGV7mEhGh8RWnWUmsC0kFGCYo9zE
 g8ruQN7+MDe82TuFLERRSaQsHOC+xIRRddUO+k78x2WjLrZ5R6DAWoJRSIHb8Yp3Oc0TzE30
 l6Cn/vyGCdi9raSTBq16bO8vT60fy8PIgc/iTQsSAIE55zmv9s1hxeWFtJ7Svft0JvyBC36x
 C2MoG4mnbIPgMUX1qK9u1fanzaroZuPRQkwjunKYl+YAspCTNbNT+SVBZLzsZ6s8K7xooG9g
 UU5
IronPort-HdrOrdr: A9a23:Qr8lta9v/i/aHU/zVhtuk+DiI+orL9Y04lQ7vn2ZKCYlEfBw8v
 rEoB1173PJYVoqN03I+urhBEDjex3hHPdOiOF6UItKNzOGhILHFvAE0aLShxHmBi3i5qp8+M
 5bAs5D4QTLfD1HZBDBkW2F+n0bsbu6zJw=
X-Talos-CUID: 9a23:hZh00WDDivK2bXH6ExZZ7EAtGtgXTkXEwluNO0aRVWF3WrLAHA==
X-Talos-MUID: =?us-ascii?q?9a23=3AE6eZag3QsMVkYRQ9GPm3Nr/9GjUj7pa8CkcCv7o?=
 =?us-ascii?q?9gsSeKhBJZhukzwv0a9py?=
X-IronPort-AV: E=Sophos;i="6.01,205,1684814400"; 
   d="scan'208";a="116129626"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SbJRsZ1iWIKMEs6Hzs1m99fFoRs8lsvKI5UkquTFzrXGqpnStfi+Tp6uXFco+o4fwccjbcm0KNiq9C73tNxXaYm2cDdLDgzv2blvkVj2PV5W48GjT2oAnz1szoK6tsFwY1HypMC64usRa5hp/bwvgkvKuIn6+mAjAJ59150h4MeB4d5FoBEtsMQj12XpkDbeztyp+pfLLZ/9YJuRsloN2Pc37fEDYU+m2hlluNswJ9IAnwPwgptvg52XWSFyp9AiCXMtWn7mLYsboOfQpZQ9dbCbxOx0JACZAFdN32ewo/zC99Yi1C6YggrK0D/8lDJSQjRlytV0EEuzjUkx5c39nw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=U0HISuVX845kGAG0SnJ2bfw4WW7gmh3amQHJcMNwxgY=;
 b=Y1MKUdRewjpzoatITmVojdMZMhayWZn5vGWjIM8EV72P73XquaH8e+DCkX+WKbK28WpH/GtD4/KNsNdJMZ4fG1dIRSednL5r2kCrrDWjKU7+WKw4IhNHA3P3CN3SKiC0N4gLrKA+OoNttGqU4rOkULrvxBdXQqtI/4TzZ1GNAbGvKiytHm3vgv7Y9JADt/idv9ddjkSII5UWQ2FKrTy6PR/EZRCpyYUd2CNZ2WAvEbdey/AYY8cu47xjAWBPGZKZIBRhggiLFt0rQ6vj/H+Zd9Od4GsBAJmoM+Hv8s5dELXg0+2nL64y5WEkSeD23/Z2B0+aVLECRMczhIOmstsJxw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=U0HISuVX845kGAG0SnJ2bfw4WW7gmh3amQHJcMNwxgY=;
 b=Oxfdk0Ff7FNZYinozYlzdIU6l9y1p8I6FlijUcqqDf827tKxSsqUoAd3cFKd3IK1JZdIzD4ZKuB9rfJLQkEkMVLGh0a0lFu6h1T0eHReR118L0tt+90FCX2yzDpjhqGDPMt62+3cPnUlctsiDY8h7+680OhHaxjRzdUwdlKAoRo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Wei Liu <wl@xen.org>
Subject: [PATCH v2] x86/ioapic: sanitize IO-APIC pins before enabling lapic LVTERR/ESR
Date: Fri, 14 Jul 2023 18:03:14 +0200
Message-ID: <20230714160314.71379-1-roger.pau@citrix.com>
X-Mailer: git-send-email 2.41.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO6P123CA0050.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:310::6) To SJ0PR03MB6423.namprd03.prod.outlook.com
 (2603:10b6:a03:38d::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6423:EE_|SJ0PR03MB6438:EE_
X-MS-Office365-Filtering-Correlation-Id: ae3b6e55-3f9f-404e-9053-08db848420af
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	zxhYJlJ0wX5nHxR+WP0OaxosPNpO7oEOlYZvXcve82C3o0788jTOox7SEB+kAE5xi+0hsYOFS27EVux/KL9i+fygMd17Ymb4EsqpKoDe/hd7fl9qEPY26EbUDOttP9yvcf5msMJGdUr7H024sPa2gJI5obLQFHvPH8wVwR+6rtXK/f93bumatr/NMWXjEL6wfcqAvkkC89/hrdSX0u1mzPxvfSJGs00RONsA27K5AbTSniQzNJBEBm5hh2HmTZ7/vQ5h/uUUarC/CIfGega1NtRoI/sFUr1jSkyicagm0QWH9pY+miieBzqIEpaw9MMKX2qoEqh/mqu4vZYJc0R1VAja/FDTrB83HLd27C4Tah4lVwInhGKqlT0qAF/krzxiuDO4rozox7jaczTF4LoMcIOwrDvIGSWIqgTCPJHl99RXU+774VWqAOjgCAPKFmHShfs+K42yf3179u/ga27iPsqsbVGDh3v6Q1bbgSFVtCBa5jkMccn2XC7QYUFRas82elWP7lHZwUO22zDJtcQX4KMS1OG9axIKe0H9L4ArCPu2K3EHD+C1aPtcNCOdEMwM
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6423.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(39860400002)(376002)(136003)(346002)(396003)(366004)(451199021)(186003)(1076003)(26005)(478600001)(6512007)(2906002)(2616005)(83380400001)(4326008)(41300700001)(66556008)(6916009)(316002)(5660300002)(66476007)(66946007)(8936002)(8676002)(6486002)(6666004)(54906003)(36756003)(6506007)(82960400001)(38100700002)(86362001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WHhmb2FKWHZrTkpiOFR4dy81TzBtTXV0dXVKU21rb0tuU1E4R0tyN2hValJB?=
 =?utf-8?B?YzNmWGFCckhhNnBtRkVwc3JnZ2g3M2RFR2ZoZHZoWGp3RzVRbm1ydkg2WmJE?=
 =?utf-8?B?TTJJenBLR2xLbTc5U2N1ZGlRTVV4UnVMZjVzUmx5dTE4YkE2cXdtTEl1d1Qx?=
 =?utf-8?B?RFJwMmx4RWZBYlZYb1g2QkF1NTVyYnFHVGdDcFRUNUc1dU9XMGhkemhjTTQr?=
 =?utf-8?B?WUpNK01HdE1LcSsrZW4vWktCTzFkMnlMc3E0SE5qN3FiTkpqbkNjWDgxY0lZ?=
 =?utf-8?B?MHd0L0prMVhhZVJFQUdITG4xYUNUblJjazVCck1uTUVUOVRuOHJSREdUR3B6?=
 =?utf-8?B?SWZuY2kwMUdTZDB3dEU0WUNNVS9zWmtibCsxaC9rYkJVSnNyRzVKUnlYWEFE?=
 =?utf-8?B?ZWY5N0xZYndORFhQNDdmSVFGUWxPZHpHU1ZmNE1DTUpnZFdVdWJLWm5YWTN0?=
 =?utf-8?B?Wm9NK1RzY05ub0JDL2ROZ01YZ3dhSVFPWFFHWGVSdHZQTkQ5UGxIYXVPTk9z?=
 =?utf-8?B?RlpjR21GVC9rRjRGbTFMbzhMQlMvVTE3cnc2bVI4YmZQRDhEUVZPeHRmN2RE?=
 =?utf-8?B?d3V5UDdRQzMrZmVFaXJYaktMV29YM3JuNHNyTmhKRnB3cG96cktRdXFVY1VB?=
 =?utf-8?B?eG92MFJyY1YwL1ZxK2EvcWpDdk5tZEdtV1J3VGtpUWJOeTU3ZklYRE5HeFFw?=
 =?utf-8?B?TFptUlNtWHdPRjVvakZQUTlHNDE4Um5EdTJ5Mksxb0xJdkxXcms2T2RCY2Iv?=
 =?utf-8?B?R2hOYVd3WlIwbVFZWlFCYnN0Mng0MndPalVTRXRIT1kzTG40RE9kYlM5dFpX?=
 =?utf-8?B?RDJ6ck5MZFpyVTM0OUhkTklJWHlWZnpuUFBaN1M4cGFSNE14QjNFS1BYTS9w?=
 =?utf-8?B?TDJaLzJBdk0yd3ZXK0RYREhoM0ZTTDlHeEV0TlhrOC9PcGc2eC9oZU5taldO?=
 =?utf-8?B?RkFZZjdHU3cveU5Rb1FhRFBQUlh4a1BJblBiMWNwVmc3TTI3UUpXNnlpRlJj?=
 =?utf-8?B?ei8vWENlQURrSUp4SlFzSFd0L1ZYbGk3Tit3WUQ0eSt4RmNFQzA5OURBay9a?=
 =?utf-8?B?aFE4b0xVZWxsbXRpTm5TRkRIcTBZM3p5Vlg4bVZvRkszN2pDd3ZoejlXRklY?=
 =?utf-8?B?eDdSdXZUalhhVDdFb1RJTXMwd0JTVUtiUzFlS2NLaGpBZGZBd3F1UFM0aVJ2?=
 =?utf-8?B?Y09abWh6aGZqa0ZlaVo2SXZsR21pWGV1QnRWVDJBQzh0ZENyNmhEdW10S1Mv?=
 =?utf-8?B?bGJCWlJpclpOaE96WUxzTFR2ek5WQml3VTc3RjZONnB1Ulg0S2Y0bWNCYnIy?=
 =?utf-8?B?TnFGSW5YUkRQRUIrZmJUMElQaGpNMzhnWDIva1ZOOUhwWWk4WllDU2ovMmlh?=
 =?utf-8?B?aUlKcnRhOWFqS0QvKy9vWlNWR2VEYlkxdXFZRFpiTXkvbmpwV1RqQm92TWVW?=
 =?utf-8?B?UVZKdXdjS0dMZnF0cW5EcWxwUitYbGdFYUtQSTFrUGxJVTdHSFJFVG5yelh4?=
 =?utf-8?B?SnBLclEzL203Nkw1bkNFM2tzWCtVenR3MDJodXNCUnVmeHVKSFBhbUNkOVVD?=
 =?utf-8?B?ZkRhYU5yQWp5RnNRUXUyMm9RcDVSaE5sZlpzMDlLNFhZdFU2NnU4M3EyZlpa?=
 =?utf-8?B?ejREZzlobG8wV2xjY0dlVlBXNzFFd3Z2c1lLclhOVGVDdXNobEZGc0dhYnY4?=
 =?utf-8?B?ZjRMRkhzUkt0VmpjWlhDc2lTY1BvQURKVkZSR3FyK0RRUE5lOHNIeXNLYTNW?=
 =?utf-8?B?d1E4cWZtV05CclJZZERmeS9vZm5XeVIwa0pjYisrVnFScEZHeWQ0bzF3L3k4?=
 =?utf-8?B?QlB4THRwOEVMQkU3bDFzYWJTSlJEbFRBVlBZL0hyMjRJYjlFaXpDVENFQnd5?=
 =?utf-8?B?VkEvaUhubW1yVExMbzh2NjdzdHI4Z1FzRFBuVkFHWDhMZCtaaGQvamt6U3hu?=
 =?utf-8?B?S0JnV1BIeFM4dkhTOHVsSlhFQ3lmZC9Jc1IzWFIxeWF6REJmRm9LeFBqTWI5?=
 =?utf-8?B?SzczR3pVUnFWa0o5NHdDZVBxWEwrVHlvNVZ6Z3o1NHhtWDZ6NVN0QUwxbGV5?=
 =?utf-8?B?d3g3U3NyK043VnRuR3h3TXBOVjB3UUJ1QTRFRXVCbDRKWDlVYWdmUkYyTUFU?=
 =?utf-8?B?UUpXcjdnSjhnOGRKQ002SVl1YTVlZktRVFQ3UVNHWEtVNlI0bSt1VmJEVUdz?=
 =?utf-8?B?TGc9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	+qwxGZ0lqbOyNZcG/1sIVc6WYYZ+82sRC8RG07EO3B9tHAs/fsE2M1WAvDo+06+vE5BsFt2eGAaBNMRPGlbQ2s6i7atCrnfsYh8xAo/nKHvx+cVcGWta+7tE/T38hvi19DoOYEalo4EtlS4VpsavEztSMc9h0D16GMOerIpkkx7Qq8Ad1KXvMTR5OBbh3pF9RPAA3immhvj4XR+CdDG/LZN7j4CPZreyJT6qo2ZCanRr0AGjCPfukl7jH+zZETOpUvq0CTK0knnjLf8SChoospzWnJZG3nkPeh0Yy54VgAfUjfpC8wHrgXJe91Z8UTtGL4q9OItK/o7CVkWL30ULVxfjewriSmPJ7R6g0f2VbbntI73OuEyYLZgK6ESuAKJOF2ZhXBTmQ4iIn3Q9H4k15OspQ/C3cZ/xQ/vKIRL5qVBtC5XjcP4RN3gRL0iJ4ZJT+jv2QEVv3LEScHbXYkcPUXkn1jWxUKbUXv7bdgOg/Mk7ztmEKU//5yFvJKXeGT2fSLhVvIEC7yyvWF9dw7e5AvXw/TFQeQs7gdjTgyXQV8AZqVx/RFrBt4/pTpOGIKASQS3Gh0JQtiVppd4UV33vlYTknn/Haqm4pPw4un84bBEruTiVo66P0YZIkHnJy5BsOUvqPABF0UV00BS/tCdP6YyzlKVkcxRC788GITm9SbxS4iThwMXsbYGwQVG8L+HxtOv1JtcmALJfl+MhTO8OHyVYOVcftCQ9MHeLaqJqMVJU9AVZ5pJk/eDp7qaDASjma6psGPEzkUAyNjNowoVvqUz2UoQNVIUuq88cED65cZMansp00gJOfxV7gR4iD4r+
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ae3b6e55-3f9f-404e-9053-08db848420af
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6423.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jul 2023 16:05:22.4905
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OMvpMDBPfO0NzD1w1YeRu8oKdaLyp7wkfPvSBJxqErLh0es6BjDmpbVpJn6orSlBGE1jVwG1bm5B2/VecZrCyA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB6438

The current logic to init the local APIC and the IO-APIC does init the
local APIC LVTERR/ESR before doing any sanitation on the IO-APIC pin
configuration.  It's already noted on enable_IO_APIC() that Xen
shouldn't trust the IO-APIC being empty at bootup.

At XenServer we have a system where the IO-APIC 0 is handed to Xen
with pin 0 unmasked, set to Fixed delivery mode, edge triggered and
with a vector of 0 (all fields of the RTE are zeroed).  Once the local
APIC LVTERR/ESR is enabled periodic injections from such pin cause the
local APIC to in turn inject periodic error vectors:

APIC error on CPU0: 00(40), Received illegal vector
APIC error on CPU0: 40(40), Received illegal vector
APIC error on CPU0: 40(40), Received illegal vector
APIC error on CPU0: 40(40), Received illegal vector
APIC error on CPU0: 40(40), Received illegal vector
APIC error on CPU0: 40(40), Received illegal vector

That prevents Xen from booting.

Move the masking of the IO-APIC pins ahead of the setup of the local
APIC.  This has the side effect of also moving the detection of the
pin where the i8259 is connected, as such detection must be done
before masking any pins.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
Changes since v1:
 - Remove the smp_found_config from APIC_init_uniprocessor().
 - Adjust commit message.
 - Move the IO-APIC sanitize call just ahead of setup_local_APIC().
 - Keep the enable_IO_APIC() function name.
---
 xen/arch/x86/apic.c            | 4 ++++
 xen/arch/x86/include/asm/irq.h | 1 +
 xen/arch/x86/io_apic.c         | 4 +---
 xen/arch/x86/smpboot.c         | 5 +++++
 4 files changed, 11 insertions(+), 3 deletions(-)

diff --git a/xen/arch/x86/apic.c b/xen/arch/x86/apic.c
index f71474d47dd1..cf1d012841e6 100644
--- a/xen/arch/x86/apic.c
+++ b/xen/arch/x86/apic.c
@@ -1491,6 +1491,10 @@ int __init APIC_init_uniprocessor (void)
     physids_clear(phys_cpu_present_map);
     physid_set(boot_cpu_physical_apicid, phys_cpu_present_map);
 
+    if ( !skip_ioapic_setup && nr_ioapics )
+        /* Sanitize the IO-APIC pins before enabling the lapic LVTERR/ESR. */
+        enable_IO_APIC();
+
     setup_local_APIC(true);
 
     if (nmi_watchdog == NMI_LOCAL_APIC)
diff --git a/xen/arch/x86/include/asm/irq.h b/xen/arch/x86/include/asm/irq.h
index 424b0e1af8f4..3f95dd39b7b9 100644
--- a/xen/arch/x86/include/asm/irq.h
+++ b/xen/arch/x86/include/asm/irq.h
@@ -118,6 +118,7 @@ bool bogus_8259A_irq(unsigned int irq);
 int i8259A_suspend(void);
 int i8259A_resume(void);
 
+void enable_IO_APIC(void);
 void setup_IO_APIC(void);
 void disable_IO_APIC(void);
 void setup_ioapic_dest(void);
diff --git a/xen/arch/x86/io_apic.c b/xen/arch/x86/io_apic.c
index 9b8a972cf570..25a08b1ea6c6 100644
--- a/xen/arch/x86/io_apic.c
+++ b/xen/arch/x86/io_apic.c
@@ -1273,7 +1273,7 @@ static void cf_check _print_IO_APIC_keyhandler(unsigned char key)
     __print_IO_APIC(0);
 }
 
-static void __init enable_IO_APIC(void)
+void __init enable_IO_APIC(void)
 {
     int i8259_apic, i8259_pin;
     int i, apic;
@@ -2067,8 +2067,6 @@ static void __init ioapic_pm_state_alloc(void)
 
 void __init setup_IO_APIC(void)
 {
-    enable_IO_APIC();
-
     if (acpi_ioapic)
         io_apic_irqs = ~0;	/* all IRQs go through IOAPIC */
     else
diff --git a/xen/arch/x86/smpboot.c b/xen/arch/x86/smpboot.c
index cf9bb220f90d..3a1a659082c6 100644
--- a/xen/arch/x86/smpboot.c
+++ b/xen/arch/x86/smpboot.c
@@ -1224,6 +1224,11 @@ void __init smp_prepare_cpus(void)
     verify_local_APIC();
 
     connect_bsp_APIC();
+
+    if ( !skip_ioapic_setup && nr_ioapics )
+        /* Sanitize the IO-APIC pins before enabling the lapic LVTERR/ESR. */
+        enable_IO_APIC();
+
     setup_local_APIC(true);
 
     if ( !skip_ioapic_setup && nr_ioapics )
-- 
2.41.0


