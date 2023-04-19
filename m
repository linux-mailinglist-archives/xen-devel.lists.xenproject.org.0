Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 850CF6E7CBB
	for <lists+xen-devel@lfdr.de>; Wed, 19 Apr 2023 16:32:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.523527.813654 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pp8r9-0006mF-LV; Wed, 19 Apr 2023 14:32:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 523527.813654; Wed, 19 Apr 2023 14:32:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pp8r9-0006k4-Hc; Wed, 19 Apr 2023 14:32:23 +0000
Received: by outflank-mailman (input) for mailman id 523527;
 Wed, 19 Apr 2023 14:32:22 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=WAk3=AK=citrix.com=prvs=46623c849=roger.pau@srs-se1.protection.inumbo.net>)
 id 1pp8r8-0006jw-3q
 for xen-devel@lists.xenproject.org; Wed, 19 Apr 2023 14:32:22 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id fbeb6f4d-debe-11ed-8611-37d641c3527e;
 Wed, 19 Apr 2023 16:32:19 +0200 (CEST)
Received: from mail-bn7nam10lp2104.outbound.protection.outlook.com (HELO
 NAM10-BN7-obe.outbound.protection.outlook.com) ([104.47.70.104])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 19 Apr 2023 10:32:09 -0400
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com (2603:10b6:a03:38d::21)
 by SA2PR03MB5884.namprd03.prod.outlook.com (2603:10b6:806:f8::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6298.45; Wed, 19 Apr
 2023 14:32:05 +0000
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::48bb:fedd:a394:9f39]) by SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::48bb:fedd:a394:9f39%5]) with mapi id 15.20.6298.045; Wed, 19 Apr 2023
 14:32:05 +0000
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
X-Inumbo-ID: fbeb6f4d-debe-11ed-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1681914739;
  h=from:to:cc:subject:date:message-id:
   content-transfer-encoding:mime-version;
  bh=+cZqqRjoP/N1+XErZEgvp63Q1BcuHi5fGFvgZGYAYi8=;
  b=JjPJ/tMeXdNiFrKVEy9NVUUdXd9R/A/hepEvYTkogl3Rl/br7E/sy7nm
   946Xyi/huad3vgILss9dEff6KPlSTEvPfJ81SLMrmsKXdNsde+Q4CBMSR
   X8fhm0ET2R2XksK3OvnYiDgGcEX8sl2MfmoVguCfE1DKIbVQi692z7ieb
   A=;
X-IronPort-RemoteIP: 104.47.70.104
X-IronPort-MID: 108550460
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:+lbQSK1CHmI7NE9BafbD5Vdwkn2cJEfYwER7XKvMYLTBsI5bpzEBz
 jFLD2mAOfeJZjT0LtFwPoy+/EsA6JLWn9diQAo5pC1hF35El5HIVI+TRqvS04F+DeWYFR46s
 J9OAjXkBJppJpMJjk71atANlVEliefTAOK6ULWeUsxIbVcMYD87jh5+kPIOjIdtgNyoayuAo
 tq3qMDEULOf82cc3lk8tuTS+XuDgNyo4GlD5gBnNKgS1LPjvyJ94Kw3dPnZw0TQGuG4LsbiL
 87fwbew+H/u/htFIrtJRZ6iLyXm6paLVeS/oiI+t5qK23CulQRrukoPD9IOaF8/ttm8t4sZJ
 OOhF3CHYVxB0qXkwIzxWvTDes10FfUuFLTveRBTvSEPpqFvnrSFL/hGVSkL0YMkFulfXEpA0
 eYJdG83YzuPqPPomKy8E9VKmZF2RCXrFNt3VnBI6xj8VK5ja7acBqLA6JlfwSs6gd1IEbDGf
 c0FZDFzbRPGJRpSJlMQD5F4l+Ct7pX9W2QA9BTJ+uxouy6KlFAZPLvFabI5fvSQQspYhACAr
 3/u9GXlGBAKcteYzFJp91r13r+SwHunBtp6+LuQ9NNz2kO1/0IqBSJKEkKbgOSYgUu0VIcKQ
 6AT0m90xUQoz2S7Q9+4UxCmrXqsuh8HR8EWA+A88BuKyKff/0CeHGdsZh5MbsY38vA/QzMC3
 0WM2djuAFRHu7qQTG+b96uF6za7PyEaIHUqdSICVREC4dTovMc0lB2nZtRpHbOxj9b1MSrt2
 D3Mpy87750RkMoK2qOT7V3BxTW2qfDhVRUp7w/aWmak6AJRZ4O/YYGsr1/B4p5oM4KxXlSH+
 n8elKCjAPsmCJiMkGmHRroLFbTwv/KdamSE3RhoAoUr8Cmr9zi7Z4dM7TpiJUBvdMEZZTvuZ
 0yVsgRUjHNOAEaXgWZMS9rZI6wXIWLISLwJiti8ggJyX6VM
IronPort-HdrOrdr: A9a23:0yhEoqsA8plkXFWcn2tZV1jl7skCYoAji2hC6mlwRA09TyXBrb
 HXoBwavSWVtN9jYgBmpTngAtjHfZq4z/VICOYqTNOftWXd1ldAabsSlLcKoAeQbREWlNQtsp
 uIGpIWYLedYmSSz/yKhjVQeOxQo+VvhZrY4Ns2uE0dLz2CBZsA0+/VYTz3LmRGAC19QbYpHp
 uV4cRK4xKmZHQsd8y+QlUVQuTZoNXPtZT+JToLHQQu5gWihS6hrOeSKWnR4j4uFxd0hZsy+2
 nMlAL0oo2lrvGA0xfZk0PD8phMn9Pl691bQOiBkNIcJDnAghuhIK5hR7qBljYop/zH0idirP
 D85zMbe+hj4XLYeW+45TH33RP77Too43j+jXeFnHrKu6XCNXgHIvsEobgcXgrS6kImst05+r
 lMxXilu51eCg6FtDjh5uLPSwphmiOP0DcfeK8o/jBiuLklGfFsRL8kjQJo+VA7bWLHAbUcYa
 ZT5QfnlbVrmB2hHjLkVyJUsaeRtzwIb227qs9ogL3Q79CD90oJinfwgvZv1Uso5dYzTYJJ6P
 /DNbktnLZSTtUOZaY4H+sZR9CrY1a9NC4kn1jiX2gPOZt3SE4lkaSHkokd9aWvYtgF3ZEykJ
 POXBdRsnMzYVvnDYmL0IdQ+h7ATW2hVXC1o/sukKRRq/n5Xv7mICeDQFchn4+ppOgeGNTSX7
 K2NIhNC/HuIGPyEcJC3hH4WZNVNX4COfdlzuoTShaLuIbGO4fqvuvUfLLaI6fsCy8tXiflDn
 4KTFHIVbV9B4CQKw7FaTTqKgzQkxbEjO9N+YDhjpQu9LQ=
X-Talos-CUID: =?us-ascii?q?9a23=3ArAdNyWqr3Av8yEdgkV64a9nmUZ0OfFnH3SuPGUK?=
 =?us-ascii?q?TBUl4FuWLTgas3rwxxg=3D=3D?=
X-Talos-MUID: 9a23:iI5UdQulxcAfTt2qo82nhhx7btlO2oqXBX9R1owmmtSlPil6NGLI
X-IronPort-AV: E=Sophos;i="5.99,208,1677560400"; 
   d="scan'208";a="108550460"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FTFHBd25KYuz5FpXNgfT0MHtdG8XrxA5w2yOpH9WEPYbJiZIB6Vm3DYGpFUusff2nfre0TnrGHlr/X1myOvgRsBS4CLBFwsbY4abYVPrU0u0irY5Ix/a6VkTGjj7n2paIoAqcpdtsZFpVgEHwnw6M5HalDmovC9/Mlsne3lNPEz+GwGfR3cR75B2XYBle3FKyBb5VzZyUY2d00UBlSqmoPSEMX2/dlbz7EPtU+gtMJlzGk4phbjSlpOQw2aY3PIKAeJrkA1x+YQj346w9CoWQJLav8okdmd2k+fDKaqoebokXVPapK9ynDBJD78WGfk7FctB0WFguW27ZbKjSBUUaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Lj4RJ6agQM5HczTdtZAY9gfemG/J0BB2RY0p7h0DKPM=;
 b=KPZs+JfClQ3Mi95dnqne6t+2T2qJwVQ9uXmzS/8iYqpAYibNgSnyXvDJFld+yyfhwAe0sCZf3CsjkkIapUssI1GnlRJSct4t1aNjsv34oQzvhqjI5j8T952fq9nPh3xrCqs5u47aMwbcEpFsKGUqFErztuEJaNg8MQokEkqI0YwGpgH9fOACQHC6Zrof3++wFpsnTwPabwsi8Q5BaaGVWMH6XxM34+H3kU1sjbKCQbSyvnP0oMfji9mSiwT/NTTuqxV/Jl1mMUkYI+PK18pDIOMfM3rk7Ro5CwSeuVlaGTR5QBoZZycdXHY1u/LNnc0TJLOihsXaQK58Q3WIJaNRKw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Lj4RJ6agQM5HczTdtZAY9gfemG/J0BB2RY0p7h0DKPM=;
 b=GVf4y30En45axHcCnIWTOAx6NNAGjDgU/tqBRllDf1oLjCiFX+TuutXh/n1APehtZY7Mq48WjMmaedSUPu7iBWPWmnFTlmed+X0xOWSFWAXPN8MC/1ezC/Cf8JkuohxgSMWOXenteOyX2ifPOFQPpBv7AqL6+2h4T8XIFRj+ZRo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Henry Wang <Henry.Wang@arm.com>,
	Community Manager <community.manager@xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>
Subject: [PATCH v3] xen/vcpu: ignore VCPU_SSHOTTMR_future
Date: Wed, 19 Apr 2023 16:31:55 +0200
Message-Id: <20230419143155.36864-1-roger.pau@citrix.com>
X-Mailer: git-send-email 2.40.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0440.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1a9::13) To SJ0PR03MB6423.namprd03.prod.outlook.com
 (2603:10b6:a03:38d::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6423:EE_|SA2PR03MB5884:EE_
X-MS-Office365-Filtering-Correlation-Id: bde78113-365a-40db-6247-08db40e2d8c7
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	LNpQwg36wjEBorcQ6NusEDUB2HdasU0qHwQ7wmyqA6J6+bAmZ3onrBgBUVX6vPKRLwRsBHzN7VAjGBC/o9xH4R1E/oCKN/3Vdlpe1po8GHmQ+m/nym9Hi7CN+A7fJw3PQVYsvSM/ixUfWYbP1JkgW9svvIj+YlzoB75nJY/lgTZr1YEpUd4bPBxxBJAZF0On+0ShjvPrAC22/Yn8o7cveb04UhAe18f1aUPUgt3hd6O3TA03oTn5D2XraIOWSlxhmgk1KsEi0qfzk5ZGbLRAOknxfzonNVN9AZS72qLms+UkrPiw1a/u8MU6ExoPH3PGsv+tsIHKgvPnV1XpuwKF9MpTOpyVcxpKa1eJv3xQgR8DyDjDTjzkXYvfbfAfEXr0fth1Za5ua/pa7GGy7HqxNfYgu1glfF85CHGJr4PUDYTyvGrPuaFQKrP1l1OOl/bnhLCvtJhodIJhhSwu309l7FvM+QnkMX6352jdhE8LcMHAAC9erbWs5yPDNmMuYLkmSR8/EGlQPvAoqm9QAxfLhz7JvJu3jzIcgM4+4LJw4hI=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6423.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(39860400002)(136003)(346002)(376002)(396003)(366004)(451199021)(8936002)(38100700002)(36756003)(8676002)(7416002)(2906002)(86362001)(5660300002)(478600001)(6486002)(6666004)(54906003)(186003)(2616005)(6506007)(1076003)(66946007)(66476007)(6512007)(26005)(316002)(82960400001)(6916009)(83380400001)(66556008)(41300700001)(4326008);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WTRFOEJ5V25vTW45N0g3d1BOVUxETkFuSllMQVIwL2VQbEZaL2tsbUxZYzBa?=
 =?utf-8?B?dGg2UEt4eXAwRGtibU4xWWV3dGE2MjdLVS9DSEZ2TkxMQ2pNdDk2MEdOakF6?=
 =?utf-8?B?VlUzYnhaOFRRc1Q5MzZmRHQ5UTRNUXRGdzgyVHlQM2ZFVmkwM0VxZjl5TGZM?=
 =?utf-8?B?M3p3MVdlb2Y0ZjIxWjdzRmpEUWZJZWNrWVNTb2ZaaGxRTkxwRmxlNUFtYU5u?=
 =?utf-8?B?cENVWUdVcXhlWDZWV2Nvd1NVdVRjd0Nxa29xNjJURzE4OWI3K0lGa0pRcE5s?=
 =?utf-8?B?V1FBaThFakV0YnNyaE1WYVY4aCtVQlY0M3JKb2MxUEZreDBlU3RaSS91OG1s?=
 =?utf-8?B?RDNVYXliLzZZalhsNDExbmlNaDJRcElxSFhYWUVnNFVjSzJZVFZaN1J0dEpi?=
 =?utf-8?B?ZjJVSUNzOUQxZ1FFekpaa1ExVldCdFk3SnB5TSswUVJiS0VIT2kvdndVYlly?=
 =?utf-8?B?NGhaVG5hcjhWZy9xZ1UrMWZvODNkWmltRVZ4d1dRdjRKVlpvYzY1b3RReDda?=
 =?utf-8?B?TENOQWZiZnB3R2dJSjh4OWVFZXRRMHNZMGc1V0taTnBYYUZWZWFiSGp3OWlS?=
 =?utf-8?B?YThLNmg2R1JUeHJYd0Q1SDFqQ3dqOVJoMVAyRXNNYWwwL0FiRjhCNGpEUmFB?=
 =?utf-8?B?bm82SS9wMXFSd1FQM2NWL0hXd1U3UGlKckl0eXJtaGF1eUUyQTRyQi9KdWtv?=
 =?utf-8?B?TzAzSlBJS0R6ejZrd2NPdlZSb3kvalJnMUVORjM0RGx4djJ4ZENBaWxjLzBp?=
 =?utf-8?B?UDhUbTFSNDZsNlRSYVVJWFpGTGFESmE3UVdTUkVjUkZtdXIzTzdFa09Sb1NN?=
 =?utf-8?B?NDgxZTByb1daYi82UytBdDBWSXd3clBReWx3aDlydHl5S3lacVFiZUxiWkxs?=
 =?utf-8?B?ZmVIVXJNY0ZVQmVwYlB1Qkp1c0JNc2IvVHY0V1RGUGFYTkY2WjNXUzNiUExO?=
 =?utf-8?B?YWlDa0FIWW9XK25DdkZSRElVazN3enBWR1JBOXVDWVB5WWdiTS9ldkNsa2Nk?=
 =?utf-8?B?R2tqWXQwd0R3Y3l4SDNVb1F5OXNCSEp1aW5PNHZaclFwVHkyVExBRlJHMXpL?=
 =?utf-8?B?alRBY3RySnREY1NmK0YyTCtWSnNoY052OXpFNzhUU1BkblVSSmx4Z3Izczkr?=
 =?utf-8?B?c0tZaGp5SFc5NXJmM2ZmaStTejdhL0EzMnE2b3ZSYjVWVjdLSkFwYkcwNjZY?=
 =?utf-8?B?L2Z0QUZNMmFjbXBlK2pmTzVRS0xnbVJKRmNEc2pKQXVwR2VkYzE3WmQrdTJl?=
 =?utf-8?B?SmhhZGoxek9WdDFxVk5aaGZtd25QMjEvcklUdnd2MlNxcHJubndROUFRK3lj?=
 =?utf-8?B?Sk9XcGd6eGNTRDI4bHdqdUdkTm1lTWFGeWZzNzFCQTVuV1pFcnhkdysyNnNZ?=
 =?utf-8?B?T1RTZDhFUjNjRlhlb2k1V3BZVTRkWnVGSTN0eVpXVnJXeHJMWHFaWWJ3eWp0?=
 =?utf-8?B?WldybXU0OW5qS1NESVFKeWV4cUNJQjZjREpZZUFkS2VzK3U4YytRalczayti?=
 =?utf-8?B?WExKd2xoZXRYWjRVNFpReXdLNWROQWFhTXVpSS9aQ3VUZmx1NWdUMHBYUlZP?=
 =?utf-8?B?eEJSMTVWWS9veUdsMUR1TGNPNHNlVjZsYVhKZWNzeks4OGFSSkpUS1YxMjJK?=
 =?utf-8?B?dmM1SXluaC94SG9leDJMTkI4MUFRc1cxK2lnSFo3MytZNUJ1cVBaQ21lUVlu?=
 =?utf-8?B?UXZaQWRxSnB1U0p5NGxlWG5UR1VJTzcra1MvSERZZnRObnRpUnBrYnZVclJv?=
 =?utf-8?B?cS9aMjFnMUQxZFAwditWMlpOcjlWSG5XSVp1Mm1GdlZHMlRnazVoZEhnRWFZ?=
 =?utf-8?B?dU1xZlFFdlJLQWFXZm5TOFlTaExCaThhUXhLK0NrVzR4TUx6MUFCSGsveWpR?=
 =?utf-8?B?NytrNVJaeFAvQ0tRNmJHbFZlTWdmMjJIajNuNGVheW1HOE92SmJ6WW1sZVQx?=
 =?utf-8?B?TkZJR0RLZlh2dlhRSmN3cjNtMUlxano0NVJiVDhVbEp1YmF1Q255MTdGVkta?=
 =?utf-8?B?T2QvNUFGZCtYUlphWi9NWUxKTDgyQS9Oam8yVit6MFZnZ0MvWjZtZVFQR0Na?=
 =?utf-8?B?VFZnTXRydjFFSVBJUG1xSFB6MzB1NXlpUzFYWnhCNXlPaXZvZWRsZlQrNFcv?=
 =?utf-8?B?MVZDdDNCTkZianRmekJnNS8va0FlSjlTNkljaWxaV01mU2RvL2tiSVVNb2Rl?=
 =?utf-8?B?aGc9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	n/zM06wXCBt7fEuTq5/JQCZQAwWkRHF3JL1x+qgRZmfcigwR68oFFx36t5B+bMAEPlDugeuIpdnIbMIQzG/5JbjNYtMpoK9IDPfXvgaJ8DeucbRNzQBUqdbKZ1KcG+2UFcj1QVjkjTWufmetYXGh6jM6xcuDz7duBAl8xbn+F9XgdbZ5FS3tdTwu+IHjAI4sCksIQKdnVfyj/wbwTDkp3SEKQWgqKkY4W/cl68RddRRDuqkMshaiUbSu69hntN0U2V3ra5wOA/j7Cas5BZCH8tJyKy4pKBw2tZSjd+RnkE6FIWEEX7j50sgBdM9gWCySblg5/oiD0HEdgqcfAXVehP17Aa7VnahWKvRkzoSlMyRY1UbtMRGu1o7tFAmC3NrvzLlvCp3U3Z4onWhvJSNeYYu5Ev0oLqipH6mR3QbPucj5ubuGSxCpiUhoCFzeszXvffgQAnyiuXVXrJ60Rgxw1qfItsuAPapFHtg7kO9AIPOCOSViw5+nhryIGeAkzgIaEQy6JWIPexpBcPpPO1RZaARMBqqMC0he9d6Tu/PO0A4VFLqe2YJsVFE+PcA092HNXcR1mLAreNt7Un0S4yiWdTRCFYDXG3Auh4gpOb4JXjpXRxopV713LqMdKo3cNuq8XdAM3a3jHFEw3uaNlVxcaQnkUEjnU3STHBzgEu0IwTO56uzpC1Z1XjlMMDFK7R0KGmujMNC78dLz+9rJefve5HA0SAIYU7K1mWxBl+BkwLkm/IgWUes7u9MMb8miC9V7igpcA4C6aIJAw4Z1PyoUZ87rvehgq5qUVCL+rFC5RYA6D6JtIombPms6wpsg7x0BFRZZZO65V9BIibiSyI4WIwx7Qq4Dw51CAsP48lGiZjzaFNS7o2q/YeiNtNChBUL3ybap6aAEzlb2JZ6o5g3DhrATnH0xu5R02tOO7Nwfqzs=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bde78113-365a-40db-6247-08db40e2d8c7
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6423.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Apr 2023 14:32:05.0101
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ALceAurmeDXYJKM4kV4/onJL78f166YK0d3a+9rNtMQDgcbq3v8J7hQd0tyA0r0jOQGckxZX4ktVO0JCUnhTVg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR03MB5884

The usage of VCPU_SSHOTTMR_future in Linux prior to 4.7 is bogus.
When the hypervisor returns -ETIME (timeout in the past) Linux keeps
retrying to setup the timer with a higher timeout instead of
self-injecting a timer interrupt.

On boxes without any hardware assistance for logdirty we have seen HVM
Linux guests < 4.7 with 32vCPUs give up trying to setup the timer when
logdirty is enabled:

CE: Reprogramming failure. Giving up
CE: xen increased min_delta_ns to 1000000 nsec
CE: Reprogramming failure. Giving up
CE: Reprogramming failure. Giving up
CE: xen increased min_delta_ns to 506250 nsec
CE: xen increased min_delta_ns to 759375 nsec
CE: xen increased min_delta_ns to 1000000 nsec
CE: Reprogramming failure. Giving up
CE: Reprogramming failure. Giving up
CE: Reprogramming failure. Giving up
Freezing user space processes ...
INFO: rcu_sched detected stalls on CPUs/tasks: { 14} (detected by 10, t=60002 jiffies, g=4006, c=4005, q=14130)
Task dump for CPU 14:
swapper/14      R  running task        0     0      1 0x00000000
Call Trace:
 [<ffffffff90160f5d>] ? rcu_eqs_enter_common.isra.30+0x3d/0xf0
 [<ffffffff907b9bde>] ? default_idle+0x1e/0xd0
 [<ffffffff90039570>] ? arch_cpu_idle+0x20/0xc0
 [<ffffffff9010820a>] ? cpu_startup_entry+0x14a/0x1e0
 [<ffffffff9005d3a7>] ? start_secondary+0x1f7/0x270
 [<ffffffff900000d5>] ? start_cpu+0x5/0x14
INFO: rcu_sched detected stalls on CPUs/tasks: { 26} (detected by 24, t=60002 jiffies, g=6922, c=6921, q=7013)
Task dump for CPU 26:
swapper/26      R  running task        0     0      1 0x00000000
Call Trace:
 [<ffffffff90160f5d>] ? rcu_eqs_enter_common.isra.30+0x3d/0xf0
 [<ffffffff907b9bde>] ? default_idle+0x1e/0xd0
 [<ffffffff90039570>] ? arch_cpu_idle+0x20/0xc0
 [<ffffffff9010820a>] ? cpu_startup_entry+0x14a/0x1e0
 [<ffffffff9005d3a7>] ? start_secondary+0x1f7/0x270
 [<ffffffff900000d5>] ? start_cpu+0x5/0x14
INFO: rcu_sched detected stalls on CPUs/tasks: { 26} (detected by 24, t=60002 jiffies, g=8499, c=8498, q=7664)
Task dump for CPU 26:
swapper/26      R  running task        0     0      1 0x00000000
Call Trace:
 [<ffffffff90160f5d>] ? rcu_eqs_enter_common.isra.30+0x3d/0xf0
 [<ffffffff907b9bde>] ? default_idle+0x1e/0xd0
 [<ffffffff90039570>] ? arch_cpu_idle+0x20/0xc0
 [<ffffffff9010820a>] ? cpu_startup_entry+0x14a/0x1e0
 [<ffffffff9005d3a7>] ? start_secondary+0x1f7/0x270
 [<ffffffff900000d5>] ? start_cpu+0x5/0x14

Thus leading to CPU stalls and a broken system as a result.

Workaround this bogus usage by ignoring the VCPU_SSHOTTMR_future in
the hypervisor.  Old Linux versions are the only ones known to have
(wrongly) attempted to use the flag, and ignoring it is compatible
with the behavior expected by any guests setting that flag.

Note the usage of the flag has been removed from Linux by commit:

c06b6d70feb3 xen/x86: don't lose event interrupts

Which landed in Linux 4.7.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
Acked-by: Henry Wang <Henry.Wang@arm.com> # CHANGELOG
---
Changes since v2:
 - Reword the comment about VCPU_SSHOTTMR_future being ignored.
 - s/ENOTIME/ETIME/ in the commit message.
 - Reword changelog message.

Changes since v1:
 - Just ignore the flag, as there's no ABI breakage.
---
 CHANGELOG.md              |  2 ++
 xen/common/domain.c       | 13 ++++++++++---
 xen/include/public/vcpu.h |  5 ++++-
 3 files changed, 16 insertions(+), 4 deletions(-)

diff --git a/CHANGELOG.md b/CHANGELOG.md
index 5dbf8b06d72c..5bfd3aa5c0d5 100644
--- a/CHANGELOG.md
+++ b/CHANGELOG.md
@@ -9,6 +9,8 @@ The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/)
 ### Changed
  - Repurpose command line gnttab_max_{maptrack_,}frames options so they don't
    cap toolstack provided values.
+ - Ignore VCPUOP_set_singleshot_timer's VCPU_SSHOTTMR_future flag. The only
+   known user doesn't use it properly, leading to in-guest breakage.
 
 ### Added
  - On x86, support for features new in Intel Sapphire Rapids CPUs:
diff --git a/xen/common/domain.c b/xen/common/domain.c
index 626debbae095..6a440590fe2a 100644
--- a/xen/common/domain.c
+++ b/xen/common/domain.c
@@ -1762,9 +1762,16 @@ long common_vcpu_op(int cmd, struct vcpu *v, XEN_GUEST_HANDLE_PARAM(void) arg)
         if ( copy_from_guest(&set, arg, 1) )
             return -EFAULT;
 
-        if ( (set.flags & VCPU_SSHOTTMR_future) &&
-             (set.timeout_abs_ns < NOW()) )
-            return -ETIME;
+        if ( set.timeout_abs_ns < NOW() )
+        {
+            /*
+             * Simplify the logic if the timeout has already expired and just
+             * inject the event.
+             */
+            stop_timer(&v->singleshot_timer);
+            send_timer_event(v);
+            break;
+        }
 
         migrate_timer(&v->singleshot_timer, smp_processor_id());
         set_timer(&v->singleshot_timer, set.timeout_abs_ns);
diff --git a/xen/include/public/vcpu.h b/xen/include/public/vcpu.h
index 81a3b3a7438c..a836b264a911 100644
--- a/xen/include/public/vcpu.h
+++ b/xen/include/public/vcpu.h
@@ -150,7 +150,10 @@ typedef struct vcpu_set_singleshot_timer vcpu_set_singleshot_timer_t;
 DEFINE_XEN_GUEST_HANDLE(vcpu_set_singleshot_timer_t);
 
 /* Flags to VCPUOP_set_singleshot_timer. */
- /* Require the timeout to be in the future (return -ETIME if it's passed). */
+ /*
+  * Request the timeout to be in the future (return -ETIME if it's passed)
+  * but can be ignored by the hypervisor.
+  */
 #define _VCPU_SSHOTTMR_future (0)
 #define VCPU_SSHOTTMR_future  (1U << _VCPU_SSHOTTMR_future)
 
-- 
2.40.0


