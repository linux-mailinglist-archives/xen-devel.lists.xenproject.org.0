Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 61789727C18
	for <lists+xen-devel@lfdr.de>; Thu,  8 Jun 2023 12:00:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.545231.851548 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q7CQz-0006bP-2y; Thu, 08 Jun 2023 10:00:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 545231.851548; Thu, 08 Jun 2023 10:00:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q7CQy-0006ZP-Vz; Thu, 08 Jun 2023 10:00:00 +0000
Received: by outflank-mailman (input) for mailman id 545231;
 Thu, 08 Jun 2023 09:59:58 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=VlTS=B4=citrix.com=prvs=5169c035c=roger.pau@srs-se1.protection.inumbo.net>)
 id 1q7CQw-0006ZJ-Ng
 for xen-devel@lists.xenproject.org; Thu, 08 Jun 2023 09:59:58 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 37b6fec9-05e3-11ee-8611-37d641c3527e;
 Thu, 08 Jun 2023 11:59:55 +0200 (CEST)
Received: from mail-bn7nam10lp2105.outbound.protection.outlook.com (HELO
 NAM10-BN7-obe.outbound.protection.outlook.com) ([104.47.70.105])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 08 Jun 2023 05:59:53 -0400
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com (2603:10b6:a03:38d::21)
 by SJ0PR03MB6375.namprd03.prod.outlook.com (2603:10b6:a03:399::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6477.19; Thu, 8 Jun
 2023 09:59:49 +0000
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::192:6bdf:b105:64dd]) by SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::192:6bdf:b105:64dd%3]) with mapi id 15.20.6455.028; Thu, 8 Jun 2023
 09:59:48 +0000
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
X-Inumbo-ID: 37b6fec9-05e3-11ee-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1686218395;
  h=from:to:cc:subject:date:message-id:
   content-transfer-encoding:mime-version;
  bh=sB+gFOPOK+7Cs0Iq/Lgo4Ursr0hs7/vKTpHzBmsolDw=;
  b=F4gS4DZtp5Ewlbv8JweGi8VTZ4D9/5+XIJZFJhgUs1HYh/pd6H72rDeY
   qtjxQzgImtBaLB6ds8v7B6VuKqJE1PbEkwx9mpVJ72APdVavw1W0KdWQ0
   pYiRGx5w8nI1tXVBk1zU2GPHBxciZg2DX0yHTvsgfeUYhC0BHeu3skyQG
   w=;
X-IronPort-RemoteIP: 104.47.70.105
X-IronPort-MID: 111368200
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:tOajGqqP4iDlJmlmjx8ilNV90P5eBmI+ZBIvgKrLsJaIsI4StFCzt
 garIBmOa63cNDH0f9wlYNm2804F7MKGzddqSFRp/HhhRS4X95uZCYyVIHmrMnLJJKUvbq7FA
 +Y2MYCccZ9uHhcwgj/3b9ANeFEljfngqoLUUbKCYWYpA1c/Ek/NsDo788YhmIlknNOlNA2Ev
 NL2sqX3NUSsnjV5KQr40YrawP9UlKq04GtwUmAWP6gR5weAzylNVfrzGInqR5fGatgMdgKFb
 76rIIGRpgvx4xorA9W5pbf3GmVirmn6ZFXmZtJ+AsBOszAazsAA+v9T2Mk0MC+7vw6hjdFpo
 OihgLTrIesf0g8gr8xGO/VQO3kW0aSrY9YrK1Dn2SCY5xWun3cBX5yCpaz5VGEV0r8fPI1Ay
 RAXADIjVzmnhKXq+52QFMdVgpwKAPu6E5xK7xmMzRmBZRonabbqZvySoPV+g3I3jM0IGuvCb
 c0EbzYpdA7HfxBEJlYQDtQ5gfusgX78NTZfrTp5p4JuuzSVkFM3j+CraYKIEjCJbZw9ckKwv
 GXJ8n6/GhgHHNee1SCE4jSngeqncSbTAdtLT+PorKYy6LGV7jIZFDJNdVq5msW0iWWYcoxuF
 nJM4wN7+MDe82TuFLERRSaQsHOC+xIRRddUO+k78x2WjLrZ5R6DAWoJRSIHb8Yp3Oc0TzE30
 l6Cn/vyGCdi9raSTBq16bO8vT60fy8PIgc/iTQsSAIE55zppt41hxeWFtJ7Svft05vyBC36x
 C2MoG4mnbIPgMUX1qK9u1fanzaroZuPRQkwjunKYl+YAspCTNbNT+SVBZLzt56s8K7xooG9g
 UU5
IronPort-HdrOrdr: A9a23:NKQWO6wMbXbs+JOL5id4KrPxrOskLtp133Aq2lEZdPULSKGlfp
 GV9sjziyWetN9IYgBapTiBUJPwIk80hqQFm7X5XI3SFzUO3VHFEGgM1/qE/9SNIUzDH6tmpN
 9dmstFeZfN5DpB/KDHCWCDer5OruVvsprY/Ns2pE0dLz2CHpsQizuRfTzrd3GeKjMnObMJUL
 6nouZXrTupfnoaKu6hAGMeYuTFr9rX0Lr7fB8vHXccmUWzpALtzIS/PwmT3x8YXT8K66wl63
 L5nwvw4bjmm+2nyyXby3TY4/1t6ZTcI5p4dYKxY/ouW3XRYzWTFcdcsnq5zXIISdSUmRcXeR
 /30lId1opImjfslyqO0GbQMkHboUoTAjnZuBKlaDLY0LPEbSN/BMxbiY1DdBzFr0ImodFnya
 pOm3mUrpxNEHr77VLADnfzJmJXf2eP0A4feNQo/gtieJpbbKUUoZ0U/UtTHptFFCXm6Jo/GO
 0rCM3H/v5ZfV6Tcnic5wBUsZSRd2V2Gg3DTlkJu8ST3TQTlHdlz1EAzMhamnsb7poyR5RN+u
 yBOKV1k7NFSNMQcMtGda48aNryDnaITQPHMWqUL1iiHKYbO2jVo5qy+7kx7PHCQu188HLzou
 WybLp1jx9DR6u1M7zx4HRiyGG9fFmA
X-Talos-CUID: =?us-ascii?q?9a23=3A5XQEZWn6x8QbqWqWMxd+c9vH4e3XOX/z9V70IAj?=
 =?us-ascii?q?kMklCFpOsTQe51JE1vNU7zg=3D=3D?=
X-Talos-MUID: =?us-ascii?q?9a23=3A+1vBfwzhEYjGmqgjE0YoExYDDbiaqPqkFG9WsZQ?=
 =?us-ascii?q?EgPWJNgdWEmmssQrvW6Zyfw=3D=3D?=
X-IronPort-AV: E=Sophos;i="6.00,226,1681185600"; 
   d="scan'208";a="111368200"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ut/dSEyGJx6CNhFvGTMJ9mByaoGwcoEMURae76dK9pEXalx6kp/K4HuxNgr19Wobgg22+gRxOEI9RoQc+ZQnN3KUYuRHvm0nZhQDM8KPUP6c2Y/ilmL3nrDh6GlLynevDjnRd9G3DXV+d74SPxXVbbrnYdDdBKEjSOhEygSoQyimU1GCOTneEaBnekMk/NP6QKsx54uBvruYLcfxjyW+yz9kUtZcV/bOhNJSlPYsLrbNT1LQ7uv+lc76hDZUgdkCz678VvrZjodMztQYOHn5HTmeVrfxtey6MinPjDzCnaUwEKcvTgIeV+EWNBgncAYQRRgZi19GdQh0IrvYJhXVSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=e1QU0dYzulxauBxU4qhjBQFTkxKTkA1hhqxS4oXfsBw=;
 b=iNJJdeAd5zpL0/S0XiAooXl2hXs9HmNS08uIGRmnnCRMx6lp9UXDD8TdqyRuix3XJEFvwf5Xp5iE6KVSyPIHL+RRAYzhlVdCcLSXLBJCkC8pNiBQMtgBEL9C3c3Zxza6U2MBTUFy/v6MwDE/MDfub5W5R3RI8n2aQajOAsveB2lE3mBQitJNsMX2CnEGlqfaOcSs5AWGfHkGr3VCBHj5Bejmnkf4rRUyxBy6pthR6VE57OuY43XnhtxccrDSv9DI4afUWDbrQ8uzK7BAdw4To2RV/T7T/CsDBvEWWyJ538pEnTFmAcg/uRUh7vifGxABJ3RirhvT2L5/Uw0kJpBj5A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=e1QU0dYzulxauBxU4qhjBQFTkxKTkA1hhqxS4oXfsBw=;
 b=pbdOyqVjgeXSpofL0tVRqav9MlKTzYv3eTZkdwNG1/RT7HuAneGqnIOyFOy8mt8/E64rpI75RuDZAp7X6DZy3wTSnd45SOljyuotE78V8rCl2H6WZnV36qQh/tmOi28doXY2l2gcqjtzlqYv41Hr/QToxYhLdhxew/Hm7vnXq0U=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Wei Liu <wl@xen.org>
Subject: [PATCH v2] x86/hvm: print valid CR4 bits in case of error
Date: Thu,  8 Jun 2023 11:59:39 +0200
Message-Id: <20230608095939.67105-1-roger.pau@citrix.com>
X-Mailer: git-send-email 2.40.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P265CA0232.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:315::14) To SJ0PR03MB6423.namprd03.prod.outlook.com
 (2603:10b6:a03:38d::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6423:EE_|SJ0PR03MB6375:EE_
X-MS-Office365-Filtering-Correlation-Id: 45fff010-a833-4842-e4c8-08db68071822
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	0JVvwd31+6gBVGbJybPMOSqAyHqdV+h8MEP0hCh5hdc4AqHeonpqwX2/86uYlLNQqsong3xS4cLDWvNRE6X4vSjiCsSKXqpeuMrV0adpTLPZwT1JX/ondT4oWwHezt1R7B65BXrwX3FqiJkAJhrCpR5Xbh996pt+RHDU/oLVBqRPVuhtVT5S45yhDokKEw+/6nIPT0JG3hSQeJeBe6CoXNgk0NXA/6+7oZDGFMkFd859j0KXrCGP8VQ57XNotLhCFnbjwG+FQzCHJVs017x2EfB/BfRyFWpabfoegiv13sXtDIt+UeaSd5S/Hr9pWj6+CLhvev2A9vA0uD/Jc6dK5NHAOCWs1HnXaXoC/fENH+p/OZpAFulhvaur2trTFGIjT8aQYCNaTj08AOZ7YqkPuRpm3A1v2Ep7UPEtEyWgouW4sJyO3+bdENFaHbiDrJVjhzUUWXyQcpN1yZOBYqao5Ndq0cnXLJvZedIc81aZxdcQu760d4wrpK/weVojt+DVUHvJNnUkocgkwIlnfn4Pxd5CQaSEwTLj0NRIKrnk0ry8aia8uPpYz2yGhp69vmcL4rsZX0spxcG17jIex87hsz0lbN1qhMprsUSAt8C4AbE=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6423.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(39860400002)(376002)(346002)(396003)(136003)(366004)(451199021)(6512007)(1076003)(26005)(6506007)(38100700002)(41300700001)(6486002)(6666004)(83380400001)(186003)(2616005)(478600001)(54906003)(4326008)(6916009)(66476007)(66946007)(82960400001)(316002)(66556008)(5660300002)(8936002)(8676002)(86362001)(2906002)(36756003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?a0lQZGlvLy83Qm9RdFo3YUdiZEgvSkoxTFd3OHdXckVGd3d5RFdoSi96aVhM?=
 =?utf-8?B?WE90OEtCMFV4OEkvQXhZVVZzYnl3S2pYdTNWMTFOZVpnc0EzWHh5alU4cktC?=
 =?utf-8?B?N0JraVhVcnlKaU5WcFRVRjJHWFpRb3ZwZUtaWDBxZUZYRWQ4dXlJSHY4bHdQ?=
 =?utf-8?B?Tk4wZTJaQnZiTmowNkJRM3EzWXFtUU9IYmZBaDdFTk1mR3Mxb0dpTVgzSWF2?=
 =?utf-8?B?T0V5QXRnSTJCd3VDUU1oaVV6UFdHVmxIYzI4WHp1VEJ6SFk0Z0hYc1JVbld3?=
 =?utf-8?B?WDlqU0ljZnBTVU1zMVl4cDBWV1V1bEZwdUhWQWJvVExXVENyQVZTNlhQZHpK?=
 =?utf-8?B?bTZjSEczSGY2OU5HU0twQVd0SXl4OXltaCs4YitWb3kzNTJ2eW5OcDJnZld4?=
 =?utf-8?B?aEtGYkZxT3VVVFhmWmRuWkFIdURQNzdDQlJzUzErNVBaVTRuS2l0Wm5JREEv?=
 =?utf-8?B?cUlJaWIxSUhyUk8rVjVxQm1UVUFOMHluc0xKdjF1cTRaYmxYeWVTRTlKbXZG?=
 =?utf-8?B?cUNSTDRXNCt3elAxSXdTZ0FqbWdTQ1kvaVRGTjMwSUluSEFablVPUTY0MFds?=
 =?utf-8?B?NWU4YTNwd1piVXAyZ3RZd3FpeFdHUXl6eFFLU00zTzhrYWRuWFFadXdtdGdU?=
 =?utf-8?B?cFdxME53THdKUndRUzVBT2hJVDEwbnJCT1JDa0c5ZlFSOGlWUUpwbDFhbHM1?=
 =?utf-8?B?YlA4b092TVFLbGhwQWZnczJTQXJjdDcwUjVjeGlES0NnRmlwaUY3QVdMT2dF?=
 =?utf-8?B?djNZRzhyaHBPRDlxY285MzhxU3FpUkFRME5lVlgzby9VOVBuUGl2OVlGVWtG?=
 =?utf-8?B?N1g5TVNOYzFOYzB3a2FnbDdiUFpqTE5Nb1VRckN5OVNFYUo5VVdKb0MwZUtk?=
 =?utf-8?B?MjNuR2lGUlNhK0lrWVkrc3k3UkVMb2pITldTRE1iUE9rVlJaRzlydk5jNFRs?=
 =?utf-8?B?S1daQm45UlZLZlNFM1ZNek4xVDIvcjY0QjJ0d0dGNkhRWFYvektNbldEUWZ3?=
 =?utf-8?B?S1E0TktRajA2RjdBOW56YzZtMHlNTlZXc2hnSHNJc1RjRENBWHZaZ3RTbExY?=
 =?utf-8?B?RnFZSDN0cHF0ejI4SGF1VjI5TGMxSkRaUXJYTXRCemxaVkVyQTVFanMxSjIr?=
 =?utf-8?B?Y3BXWWdtRmJDbDZWbjg3WWhwQUEydnpBdlR3Vm5DL2M3cm8yd0lvKzJaVkUv?=
 =?utf-8?B?d2NXaXhac3F6T2lPRGRWNVZMWkxQQ1UxTm5wWW1GOW80emVYR25vbktvNUl2?=
 =?utf-8?B?SGh2L002dmtCN3k2bE1CT2JhSHI4K0E1a3dTZlNLdTdiUUtFKytvamJVL1Ry?=
 =?utf-8?B?Yi93N3BhU2JEZjJZa093QkRPR3k2cUg3cCt5K2lTcVVGV2RmUlJyTEEyNEFm?=
 =?utf-8?B?azNtV2tNYm1NR1pQcjdkem85ZG9sSEV1UzVpUGtlSFptWlN0UmI4TU9vSTQx?=
 =?utf-8?B?Zit3QXJ3SlEwc1RQNkhibnhXcjlCZDVnWlJzQk5OVXlqdTFQZkhMT1phNkRX?=
 =?utf-8?B?bDlxOWhOSlpEVk9PNVhzeERuR3hsZ080N0NrL1BYWFJrVytlOUZ0dkdSUlZZ?=
 =?utf-8?B?RTkxbFdXUUg0bGRxdjlKYzdXdUZuemtmcFlsdlBiWDhGdkdTUy9KWVlvR1R2?=
 =?utf-8?B?VG1NeGVvaTBjaUw2VzdjL2llc0VpcXZ1ZFh2SzFhRXFueTlLcWs3VjBQOVVZ?=
 =?utf-8?B?Zlh6cTJYRzRNL3ZDMGlOYVNmLzJqYmxLSHIyTVdZaW82SFVNWDVydWc0cWZa?=
 =?utf-8?B?UFhnREtGWXpCZElZbmkyWlY3UFJuN01Ec1k0T1djcytrTFB4QTNIK2VOaHJ4?=
 =?utf-8?B?UHJrSlFkaHFPU292ZkxRN3lIeU1GVG8wSkxoUEFZZWdSUkIvL2F1bys0SXFL?=
 =?utf-8?B?WXRCdTdEc0poRis4R1ZTZ0lBY0hJWkRIYzU2R2xUTlNhTVZTZTd3aUp1ejRx?=
 =?utf-8?B?MnB1eEtEY3hoRW5VVEVhczBZYjhoWVFVRXJnOGxTeURYd0VpUUMyMzAzTmta?=
 =?utf-8?B?RHhEcE1zWEYzOWJ5eVloZ21Pam5PZ3BrMFhlQTNMY2hSZ2dsWStoR00ycith?=
 =?utf-8?B?ZGJKeGdjQlVNS1lJYldJRjJDSzRIU3BVbmZEL2JKQ1BYQno1SWZCelp6OW5U?=
 =?utf-8?B?VkhtUVZkL2lwSFpDdCthUkxTSWp4MzhKRFIrMkI3dlFNRnpycmplZUQ0M0FE?=
 =?utf-8?B?VHc9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	BMgj/eNBAYn+tcef4Un8nkh8WYvmEVYu6QDbRXnfPdPG5puQ2M38ftYTey43m2k5OSUN42F21eugGdRYsrBs+v3R0/yjXsGcOIZzjoZGnQ/bSPSbp5VfFkCQvM41BDw1fnNOUzP99Sb8WcW43BbJ70geD24lWuVYqQn6iPLyfCXAe4RmVX6Flo/duCIKWxc6DVcLwD+Udvnz12VA6psS+vN119+djd+06UUrPlr1eNj5iSCyfecviaPZg5uryhVWingE8cyYdJwVEoYW7uMwzhMq10iFSaZ/N5lPNuWuMiDBwYgU9M9q4KsuHst0ahJQ92mpuODA6JFrshN/cJ77mIB8qs6HELoswv44Ltq4FPyFHK71gM2OHiEZtOddUbs9i30YW9pKlG28YRfZbDAxxiW+WEd/AqE4dgvjKsPbcyEOdL631xQEpon2S39n6hxKaoRkKVmcLh79VTPbrfXUwfDgCqb33nyeukUCCEct+3vTYYfo+Tmu2eP05UGBExSeI49RLwg3yZFxL/s7hE4gDocoP5Wz+I6uGzfSL8Q8KaVhQxQizpX2EDgcsyREZtmMqY1NuJ/0gY2V1ydlHF9Xi7YEx1ST5CdqKfvVbfrxdHRorI9j31aBRHM71vPTjw5fO0UrrzlxBj4rH1l0r93iEuxF4YS10XJynaeSv4hErODVkBn6UT8jVO/9jzDKxzD4XEG+oMj6sJtyJ1IacaSTKUziYsee7zJb3HCR35BWQdXlUclPMfHAWyTDfnRid7rpuoTxO7mxEvqYUW8AE/rXyCfQ5tJm6xU6VlPQ8Im/CWSnzcnDYdBRJdUhyEDrMp6d
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 45fff010-a833-4842-e4c8-08db68071822
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6423.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jun 2023 09:59:48.5453
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7umhWsisWlCNSoWv2y/HkQXTVBEHhTU0YYR4pXiNW5iLOPTMp/dTFQrtS80Y7hTD3RSS6pXQQBMUf52+ofUotA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB6375

Some of the current users of hvm_cr4_guest_valid_bits() don't print
the valid mask in case of error, and thus the resulting error messages
are not as helpful as they could be.

Amend callers to always print the value of hvm_cr4_guest_valid_bits()
together with the rejected bits in the checked value. Also take the
opportunity and adjust all the users to use the same print formatter.

No functional change intended.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
Changes since v1:
 - Use %#lx formatter uniformly.
 - Print rejected bits together with the valid mask.
---
 xen/arch/x86/hvm/domain.c       |  9 ++++++---
 xen/arch/x86/hvm/hvm.c          | 16 +++++++++-------
 xen/arch/x86/hvm/svm/svmdebug.c |  4 ++--
 3 files changed, 17 insertions(+), 12 deletions(-)

diff --git a/xen/arch/x86/hvm/domain.c b/xen/arch/x86/hvm/domain.c
index deec74fdb4f5..efee7fab3e19 100644
--- a/xen/arch/x86/hvm/domain.c
+++ b/xen/arch/x86/hvm/domain.c
@@ -107,6 +107,7 @@ int arch_set_info_hvm_guest(struct vcpu *v, const vcpu_hvm_context_t *ctx)
     struct segment_register cs, ds, ss, es, tr;
     const char *errstr;
     int rc;
+    unsigned long valid;
 
     if ( ctx->pad != 0 )
         return -EINVAL;
@@ -264,10 +265,12 @@ int arch_set_info_hvm_guest(struct vcpu *v, const vcpu_hvm_context_t *ctx)
     if ( v->arch.hvm.guest_efer & EFER_LME )
         v->arch.hvm.guest_efer |= EFER_LMA;
 
-    if ( v->arch.hvm.guest_cr[4] & ~hvm_cr4_guest_valid_bits(d) )
+    valid = hvm_cr4_guest_valid_bits(d);
+    if ( v->arch.hvm.guest_cr[4] & ~valid )
     {
-        gprintk(XENLOG_ERR, "Bad CR4 value: %#016lx\n",
-                v->arch.hvm.guest_cr[4]);
+        gprintk(XENLOG_ERR, "Bad CR4 value: %#lx (valid: %#lx, rejected: %#lx)\n",
+                v->arch.hvm.guest_cr[4], valid,
+                v->arch.hvm.guest_cr[4] & ~valid);
         return -EINVAL;
     }
 
diff --git a/xen/arch/x86/hvm/hvm.c b/xen/arch/x86/hvm/hvm.c
index 2d6e4bb9c682..6fa7046835cf 100644
--- a/xen/arch/x86/hvm/hvm.c
+++ b/xen/arch/x86/hvm/hvm.c
@@ -991,6 +991,7 @@ static int cf_check hvm_load_cpu_ctxt(struct domain *d, hvm_domain_context_t *h)
     struct hvm_hw_cpu ctxt;
     struct segment_register seg;
     const char *errstr;
+    unsigned long valid;
 
     /* Which vcpu is this? */
     if ( vcpuid >= d->max_vcpus || (v = d->vcpu[vcpuid]) == NULL )
@@ -1016,10 +1017,11 @@ static int cf_check hvm_load_cpu_ctxt(struct domain *d, hvm_domain_context_t *h)
         return -EINVAL;
     }
 
-    if ( ctxt.cr4 & ~hvm_cr4_guest_valid_bits(d) )
+    valid = hvm_cr4_guest_valid_bits(d);
+    if ( ctxt.cr4 & ~valid )
     {
-        printk(XENLOG_G_ERR "HVM%d restore: bad CR4 %#" PRIx64 "\n",
-               d->domain_id, ctxt.cr4);
+        printk(XENLOG_G_ERR "HVM%d restore: bad CR4 %#lx (valid: %#lx, rejected %#lx)\n",
+               d->domain_id, ctxt.cr4, valid, ctxt.cr4 & ~valid);
         return -EINVAL;
     }
 
@@ -2456,13 +2458,13 @@ int hvm_set_cr3(unsigned long value, bool noflush, bool may_defer)
 int hvm_set_cr4(unsigned long value, bool may_defer)
 {
     struct vcpu *v = current;
-    unsigned long old_cr;
+    unsigned long old_cr, valid = hvm_cr4_guest_valid_bits(v->domain);
 
-    if ( value & ~hvm_cr4_guest_valid_bits(v->domain) )
+    if ( value & ~valid )
     {
         HVM_DBG_LOG(DBG_LEVEL_1,
-                    "Guest attempts to set reserved bit in CR4: %lx",
-                    value);
+                    "Guest attempts to set reserved bit in CR4: %#lx (valid: %#lx, rejected %#lx)",
+                    value, valid, value & ~valid);
         return X86EMUL_EXCEPTION;
     }
 
diff --git a/xen/arch/x86/hvm/svm/svmdebug.c b/xen/arch/x86/hvm/svm/svmdebug.c
index 7d6dc9ef47db..de046ed929a8 100644
--- a/xen/arch/x86/hvm/svm/svmdebug.c
+++ b/xen/arch/x86/hvm/svm/svmdebug.c
@@ -124,8 +124,8 @@ bool svm_vmcb_isvalid(const char *from, const struct vmcb_struct *vmcb,
 
     valid = hvm_cr4_guest_valid_bits(v->domain);
     if ( cr4 & ~valid )
-        PRINTF("CR4: invalid bits are set (%#"PRIx64", valid: %#"PRIx64")\n",
-               cr4, valid);
+        PRINTF("CR4: invalid value: %#lx (valid: %#lx, rejected: %#lx)\n",
+               cr4, valid, cr4 & ~valid);
 
     if ( vmcb_get_dr6(vmcb) >> 32 )
         PRINTF("DR6: bits [63:32] are not zero (%#"PRIx64")\n",
-- 
2.40.0


