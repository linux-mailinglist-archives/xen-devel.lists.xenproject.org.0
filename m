Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E2D2D722A87
	for <lists+xen-devel@lfdr.de>; Mon,  5 Jun 2023 17:11:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.543769.849019 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q6Brg-0003G0-AU; Mon, 05 Jun 2023 15:11:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 543769.849019; Mon, 05 Jun 2023 15:11:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q6Brg-0003DA-6s; Mon, 05 Jun 2023 15:11:24 +0000
Received: by outflank-mailman (input) for mailman id 543769;
 Mon, 05 Jun 2023 15:11:22 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Ryrp=BZ=citrix.com=prvs=5133587e0=roger.pau@srs-se1.protection.inumbo.net>)
 id 1q6Bre-0003D1-BN
 for xen-devel@lists.xenproject.org; Mon, 05 Jun 2023 15:11:22 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 38d7b75a-03b3-11ee-8611-37d641c3527e;
 Mon, 05 Jun 2023 17:11:19 +0200 (CEST)
Received: from mail-dm6nam10lp2104.outbound.protection.outlook.com (HELO
 NAM10-DM6-obe.outbound.protection.outlook.com) ([104.47.58.104])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 05 Jun 2023 11:11:16 -0400
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com (2603:10b6:a03:38d::21)
 by CH0PR03MB5988.namprd03.prod.outlook.com (2603:10b6:610:e3::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.33; Mon, 5 Jun
 2023 15:11:14 +0000
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::192:6bdf:b105:64dd]) by SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::192:6bdf:b105:64dd%3]) with mapi id 15.20.6455.028; Mon, 5 Jun 2023
 15:11:14 +0000
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
X-Inumbo-ID: 38d7b75a-03b3-11ee-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1685977879;
  h=from:to:cc:subject:date:message-id:
   content-transfer-encoding:mime-version;
  bh=/6Fy/CR/gCTKW7EKi0nwjvcVr524gOlipwpOajEqaSY=;
  b=N3VORuKDA0ncSoz22TKAL3vR6J7z2u9kwpyC3rX2oCM17H4ReqAIadDo
   2wWDVRGN6cAwDiJuEX4yvYKnWbJSxk+SCMCiZkpUmp0PNWWbmXo3y7KcH
   gpXITY83yNaFZ6mpOB03RrRBdBWj0wpwNEv7KzcBh/0sH6AC69bI7wuDE
   w=;
X-IronPort-RemoteIP: 104.47.58.104
X-IronPort-MID: 110393904
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:Rapl6K4K6bgNucL6LS4OzQxRtPbGchMFZxGqfqrLsTDasY5as4F+v
 mUfXGrSPv+MajT1fdt+bYWz9UgPvJCAmNVkQABpqCozHi5G8cbLO4+Ufxz6V8+wwm8vb2o8t
 plDNYOQRCwQZiWBzvt4GuG59RGQ7YnRGvynTraCYnsrLeNdYH9JoQp5nOIkiZJfj9G8Agec0
 fv/uMSaM1K+s9JOGjt8B5mr9lU35JwehBtC5gZlPa4T4AeH/5UoJMl3yZ+ZfiOQrrZ8RoZWd
 86bpJml82XQ+QsaC9/Nut4XpWVTH9Y+lSDX4pZnc/DKbipq/0Te4Y5iXBYoUm9Fii3hojxE4
 I4lWapc6+seFvakdOw1C3G0GszlVEFM0OevzXOX6aR/w6BaGpdFLjoH4EweZOUlFuhL7W5m1
 vIxJWAcZyq4qcWd3K6Hcepjot8sI5y+VG8fkikIITDxK98DGMiGb4CUoNhS0XE3m9xEGuvYa
 4wBcz1zYR/cYhpJfFAKFJY5m+TujX76G9FagAvN+exrvC6OnEooiOSF3Nn9I7RmQe1PmUmVv
 CTe9nnRCRAGLt2PjzGC9xpAg8eWxHugCdlDTOHQGvhCx2aQ2E83CgUtBXSU8PihtVymZ95UN
 BlBksYphe1onKCxdfHtUhv9rHOasxo0X9tLD/Z8+AyL0rDT4QuSGi4DVDEpQN4sudIyRDcq/
 kSUhN6vDjtq2JWKTVqN+7HSqim9UQAXMGsDaCksXQYDpd75r+kblQnTR9xuFKq0iNzdGjzqx
 T2O6i8kiN0uYdUj0qy6+RXLhmyqr52QFgotvFyPAiSi8x9zY5Oja8qw81/H4P1cLYGfCF6co
 HwDnMvY5+cLZX2QqBGwrCw2NOnBz5643Pf03jaDw7FJG+yRxkOe
IronPort-HdrOrdr: A9a23:gm4HwqOQcXy+JsBcT6r255DYdb4zR+YMi2TDiHoddfUFSKalfp
 6V98jztSWatN/eYgBDpTnmAtj5fZq8z+8N3WB1B9uftWbdyQ+Vxe1ZjbcKoAeQZhEWiNQtsp
 uIGpIWYLOQMbETt7eB3ODSKadE/DDoytHKuQ+IpE0dNj2CJpsQmDuQTW2gYzxLbTgDIaB8OI
 uX58JBqTblUXMLbv6jDn1Ac/nfq8bNnJfGZwdDIxI88gGBgR6h9ba/SnGjr1wjegIK5Y1n3X
 nOkgT/6Knmm/anyiXE32uWw4VKlMDnwt5jAtXJrsQOMD3jhiuheYwkcbyfuzIepv2p9T8R4Z
 HxiiZlG/42x2Laf2mzrxeo8w780Aw243un7VODm3PsreHwWTp/UqN69MtkWyqcz3BlkMB30a
 pN0W7cn51LDSnYlCC4w9TTTRllmme9vHJnu+8OiH50V5cYddZq3Poi1XIQNK1FMDPx6YghHu
 UrJMbA5MxOeVffVHzdtnkH+q3fYl0DWjO9BmQSsM2c1DZb2FpjyVED+cAZlnAcsLogVpht/Y
 3/Q+tVvYALavVTQbN2Be8HT8fyIHfKWwjwPGWbJkmiPL0bOkjKt4X87NwOla2XkaQzvdoPca
 n6IRNlXTZYQTOsNSTO5uwHzvn1ehTyYdy3ofsupaSQudXHNcnW2GO4ORUTevCb0osi6/3gKo
 qO0a1tcoDexBPVaOB0Ni3FKuxvwColIbkok+d+fW6yieT2DaCvntDnUZ/oVcrQ+HAfKynCPk
 c=
X-Talos-CUID: =?us-ascii?q?9a23=3AHEft72nUYT0+cx8DxshU4IfN9wbXOV7T5XqAMka?=
 =?us-ascii?q?CMkhOY6GJdWST94d/nMU7zg=3D=3D?=
X-Talos-MUID: 9a23:gzwfKwnBjQgncROxcFJ2dnolD8R2wICsEHtdvrpXutG7JzRMNzyC2WE=
X-IronPort-AV: E=Sophos;i="6.00,217,1681185600"; 
   d="scan'208";a="110393904"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JBRlWh/haWJbHKLzYQCcxaTqL4A6Xs9n4JaWktWhgRJqDZQrdy7QEjdkis4BktwlnX44pjutUtspNuAoZdQRpmCvfOBkLnzaBFsc5BNxVUqgXehs/kWqXfGWbGB4R4CQmy1tHVxSuajRkdFryp+3JmexPlaWmsVWRWYxxgeCZXUZewOAU3nay50emAAB11VaXaI2qpES9qJmx1fKVYl82F1twlqbc0SU5URUkGGxx8eK7kOOUu6Q+21UDy1rMgLmHz1Wk2d4Q7hpbuJIirrYKpqOxxfKxZvte8luDwmVlZAOQHbQdWfAE7MtF/YOf/3OCyAvwjIL2n8+Z2Ip/tE5xg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JONrvYVMHp1sBRPD1gxzmVo7lye+rsEHxAYvDe4PyeM=;
 b=WBXJFXXtJ1jPbtYB1qT9q8ZFZJvV1Swu8MtQEwpw6f4/N2A/7+kBPQvlxfvnr0ZxjAvxxKUHWJBnRIUPv6fuo1jh9OnKHFDpctU6dG/Hy774Kt8ZWTmigzbLQMzr8V03kX75k+U1SPaKw+JJF/M1DCKL/3Eqet5s1Jq9eoEV5AwM0UCjL2l9ithGS2/oExM9zaM9dLH6CVOIsssrzmtdYdpGqLSVl+xWyrO+pyiW8H7n5TbDz/zKAHuKa+Rpqq6AwpLXnG6m3Gs7SzaObGORDsunNS1LeJYuKYtT8iGGlPu3LVpDzk4kdZgetbcvT7+T6FbciLIqM+dWcqZknQg8XQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JONrvYVMHp1sBRPD1gxzmVo7lye+rsEHxAYvDe4PyeM=;
 b=kEMjBqvxF9s50IohxED/gi5utfftjdZDoPctOhXaOq6Kus9fAPgbK6BiyQ2iVqpB1R+UB3i2d0hxWZEL5nb6qYZppFhydeCCBsYqs3DJZcvX/FeTe0SY5+v34yqMjDe0JPY7SNnUlZask/kUsyqCdEO9OhlePv4tFYfluMWF74M=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Wei Liu <wl@xen.org>,
	George Dunlap <george.dunlap@citrix.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH] amd: disable C6 after 1000 days on Fam17h models 30-3fh
Date: Mon,  5 Jun 2023 17:10:36 +0200
Message-Id: <20230605151036.18085-1-roger.pau@citrix.com>
X-Mailer: git-send-email 2.40.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P265CA0175.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:312::14) To SJ0PR03MB6423.namprd03.prod.outlook.com
 (2603:10b6:a03:38d::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6423:EE_|CH0PR03MB5988:EE_
X-MS-Office365-Filtering-Correlation-Id: 421cb925-0e70-445e-c9e5-08db65d71a4c
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	hUMqNMab775tz8tw0dYeSALbzZcmi3ymcnbgH7C3Kcz4BW12toojayqfphSes3LnKgSasFwDmDH8tzcjeDFH1llIueRRz40EDoM/qyuvnKZZIECjANnYHPlvc8Ai+5+sU9V6LVyznGE5WRBwIlrAIAvcU5+0EN+kl4EVeD6S6kvlBi7xA7HLip1g82/Gbfwfm9VtsYiPfLPLuq2loPIm6JeJtQrTzMScM9xU0Uz3HYCzpDFHe/ejPm4Hg3UoGcVG38th94OckdCM8Ohsg3P8Ci8Dj0v07qyF4msh44OA3axn0hpecjE8rtzQV2d53kp/te3kp80jaUYhsYvwmsgdUogZNLyYPp8hH7//YbWBxKbu/FYW0aqreh+mRHbl3bRaMkGAd8yvKqS/H393ZImwtk/PATgwaVpjAN6IkmueG9GmR2Ke7Iav12tB8TAVy9ioiMndVwULKgke6PdTdmLAlILJB1HX6xpwerdDGa6To7VXVc6kztRnCixWl8bE2Vqi6LGYvo1JnAliAcU9upbaBepyiRZDldnyiMmcG4Cb7oAN6BjtuCE8SS/V0rDCXkxn3jsJtRxxgRXchNhRUqEebkbuv17/y98nzhFUy4ufiSK6bY52m+IL5qnOi57M2S8H
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6423.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(39860400002)(366004)(396003)(136003)(346002)(376002)(451199021)(478600001)(2906002)(36756003)(6486002)(6666004)(2616005)(83380400001)(186003)(6512007)(6506007)(1076003)(26005)(86362001)(82960400001)(38100700002)(316002)(8676002)(8936002)(66946007)(6916009)(4326008)(66556008)(66476007)(5660300002)(54906003)(41300700001)(221023011);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?YnF6T2Z6NWtTRUNqS29vZkJRVTNSZWRWbWlMY3VrUzRpRThBek9hbWZ3L3RG?=
 =?utf-8?B?NXorbWh6NUMxVUpUN1UzQisxaFdhNEllWmlJbWEwZW9CeUJvQTBWWFVkN2Ew?=
 =?utf-8?B?SkFKZEI2bzFqZWYzOVpHUFZYZTdWSlgwdE43UHE2SEFKS2xTMWFWeWx4bmFl?=
 =?utf-8?B?YklzTmZ6dnBjdVpoZ2F3TlEyWTRaUytLVkE3Tm9kWWoyOEJQZjgzVG5EMXND?=
 =?utf-8?B?RzFRcFhPY0haREJ6a3FtS0VHbE9NRElFcTAybnl0bnpNYlVuRmtUdlFpcTFO?=
 =?utf-8?B?N05VQ3VsYjltTWh2MUIzaWN4MTlPVTBtb2s0TnlmUU9nekJubU9CMGNRSU4z?=
 =?utf-8?B?TDJkWDdRa2xEZWQ0K1UrVDZEU25xYmZnSko5NWJ6aWpvOC9rcWdwU3lCWWZ1?=
 =?utf-8?B?SDR2YlVnckd1S2JRNmVPZ1VQekNjN1RWcko4Vjhhc2Q2MWpHV0xvYTVpdVBs?=
 =?utf-8?B?SHl3K3NsaGZTUXlyTE5PUUFuckdrUVZ1OCtxT3BGMlRRdFZFRkFpMU5Gd2Fa?=
 =?utf-8?B?d3MwbEwwaW9PRnZwdnZrVTJHdW1OMm5jOTVycnJFaFU1MHFkN2lNTTZicVlE?=
 =?utf-8?B?NDRuME5EUVNsRERKaUF3bHV4eUtBdzB6WWFackJ3alpJOHA3NHJwMTFSemFw?=
 =?utf-8?B?aWVuN0hTMHgwdUliUmdyUmhFUVRVSU0zVUV3alJSd2pjYllDYkN6dHVTQ3Vq?=
 =?utf-8?B?cUNTSnlnSnZMVUM3K2UyeUEyN3NySU9pTHJESEFTV2ZpdXJsb2xIMkRWSDBa?=
 =?utf-8?B?c2lHa016SE41ZVlPZnduWklBTGZ4WjU4YzhRWEtDOUU5THZiK1NBSi9kcXdt?=
 =?utf-8?B?eGFwalIxTDVQMW5nSWtZeTNIWFQwS2xTcXNBNjRVVlEwY2txUUVmWWs3U0wy?=
 =?utf-8?B?RjJIUXp4THBKajJaaU94Yi84SFZyWmpFeWVIYTRPRFBkYWhFSjQrM3A4WW0v?=
 =?utf-8?B?clI1V29XV1ZyQUJSK0g3cDNQVGkxanZTUGVpam1VcG0xb0dsTk9zRXhRN0pU?=
 =?utf-8?B?amp3UVV0ZGpDM3RkR0ducnFWYkcyMU52UzBDMUZBanRLdTh5OEI3allOWFJC?=
 =?utf-8?B?eEx3TWI4eDJadDFuWmcrSEhkT0JOa1E1NnBFYjRkb0VsQ01WUVYxZlFmU0J2?=
 =?utf-8?B?bWc2WEREeUlEb1JTOEJ5QzgyeGFKMDI1eE1nOC9YQUZJRGlsTEFUczZhT2Q0?=
 =?utf-8?B?dVFPZFc5Y2lJVmJYUm5MQkJHZ1p0M3VXcWFiRkU4MEk5TjZGUlQzZ2toQUpv?=
 =?utf-8?B?NE16Y2gwZitZTnRVbkhES3RFcHVIU0oyVUxNL0g1Y1p1cjF0K0dxTk5BZm94?=
 =?utf-8?B?cyszVXRiYVpvcTkrTy92RjBsU0FsamRsUDE5d3pOSUhQZzg4aVE1bWxjUzFO?=
 =?utf-8?B?Vk9sUC9ReEFBWkgzdVpzV21ScEpoMFZ1QVJYM3RXb3Q2YStvcEJQWDJ3OGV3?=
 =?utf-8?B?SXYwRWlnVlZGMVBzb3dNRjBLU1BzellWa29SRkJxYXlBbWovVm5xa2V6Qkxq?=
 =?utf-8?B?TUhXQ2ZjK2s5MEJiRmdidEtGOUVsb2k2MVl1ZXM0OUNjSnl3UmdRNkltYVZm?=
 =?utf-8?B?MjhmTlZHcWxpalp4Q0VHbFEzelR4ZG1oNEQwKzFOUVJlaW1PK2ZPS1E5dkpI?=
 =?utf-8?B?NDE2TW8yd3g0RFp0U3JCWkkzSjZxSVNtWE1KM2RZT1ZEL0RpN3M4RVNvT3hx?=
 =?utf-8?B?K1FUUmpjVXRGd05DUjdUbDI2NWd5aHZUMjRIT0RPYXdhZ0FWTmREdlExZ3Er?=
 =?utf-8?B?eU1DZE1hSnkwSmUrdWJzTDhEbUgrWVdNa1RrSTR6cE4yMnhQMjRncWxaSjBE?=
 =?utf-8?B?Vi9WVmNlaTh4WUQza2s2WFAzT2hyUDl2NGhuRTZSNDMzaHE3dmNLdHpNOS84?=
 =?utf-8?B?Sk5ZWlcxZDdhUy9DSjR2MytZWGE1ZkxOQWliR21lcEZBM2JCS3ZES052UnVw?=
 =?utf-8?B?YzZqMUpZb2dRTHZTUGtZZmxNWlFaWVlwMkFjZFF0RFJYdUtXVS9IQjVGenps?=
 =?utf-8?B?ZmVMNkFna1pGSEFSQS9yT0VWWWZSeC83cWlCRUFKTlFmSlpVQU1nRDc2WVk4?=
 =?utf-8?B?V2ovNE5VRFJ0Mk02T2s0SFdYTDR4NmFxTnNxc0IwL1NTK2o4bW1Fc3N5VHU1?=
 =?utf-8?Q?noyqChFmYUO/2UbqkrgWL0k5m?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	e5HiWATqrdM+4Rc2oHLCLTYmQMOWrC9Ly2+iGCPu02BZA2MHW9O825Tvq7pd0uvGWHHS5YIEEyrL3rpEySep2pJHL1QPhPHlSaGY6P4osBnqQGSHu2MPZ6mAQmBz/UvF8GJAG4bzUXBvlrA7EvkbVhsiu9lcNEgTkjB/KbtbIrXSsZnf1Uw+ymuxFlVgzMT2jUvxTgcXpC/bK+aZrAC0e3e8lVwj3+P8PoOhyUHNFabyfokl6FI6uclkp2i7tK1oUlKea2HxtiZCvS7s8dqMwW6UrSNzg6LEezXoQKO3UbSyuIJaw3ApEpyaaNmSXuD9OJECNY22Xz6ZO8wbLfuhQL8ufLhAQwcrCjgqRoNGH0x9NoSTyM9KMZjNRvUpHTFSMz7vPd0DYyYarWK2iYAbstlTZkmiDy+B9OkVKCtqYegq+l6b0+jX/QIGkWg2kLgdIm+5j7P8AOd5itfK3vWZ4QZp2bJVm2jjHSMDCOtiaBfOmefiNkKQrIzDzYSYuPgfBNmK9laTV33HydDgOigiX9vsvEHVUS4NBJ9CItfp9z9l8wym33MwZPTj/lWc0dyczZnxFECj/uEvi1DxMtr4wC8hi3Vf0uZUdNzU1SnzAMjiZCVfh1BimLMTD6fo5v0vxy4VYDuAONwNE5FEXCRt9FCXyUrQSpabmuplxcYb8MSxon14/tXRzNKUcCRI0luRPBMsJq1lIfipKx7lb7BZR9GCGwWP9Ro/bMrlbNhQ3590/eNVNhLnBC3wc9lNF1L1RKIgwMui/oEjzMdVfAn66c3X5kYyMEgfsup2dLp0OlLRa5jVcgZa2sdo5w3uEn/nlB+QRq5UyXAvDXHuPIuZtMRAh/ViCHRm67y3KMNx21s=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 421cb925-0e70-445e-c9e5-08db65d71a4c
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6423.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jun 2023 15:11:14.0552
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: u9AVHQ/pDg0HB8/RCSwopIIhlYOzhzjnroFr1Eb2ZcHgSsYb0LVbpMFlSDa8sDFzabfVTMW8YwmYHNVsrUJukQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR03MB5988

As specified on Errata 1474:

"A core will fail to exit CC6 after about 1044 days after the last
system reset. The time of failure may vary depending on the spread
spectrum and REFCLK frequency."

Detect when running on AMD Fam17h models 30h-3fh and setup a timer to
prevent entering C6 after 1000 days have elapsed.  Take into account
the TSC value at boot in order to account for any time elapsed before
Xen has been booted.

Print a message once C6 is disabled in order to let the user know.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
I think the only 30-3fh model is 31h (Rome/Castle Peak), but I've
coded the check as to allow the whole range.
---
 xen/arch/x86/acpi/cpu_idle.c   |  3 ++-
 xen/arch/x86/cpu/amd.c         | 42 ++++++++++++++++++++++++++++++++++
 xen/arch/x86/include/asm/amd.h |  2 ++
 xen/include/xen/time.h         |  1 +
 4 files changed, 47 insertions(+), 1 deletion(-)

diff --git a/xen/arch/x86/acpi/cpu_idle.c b/xen/arch/x86/acpi/cpu_idle.c
index 427c8c89c5c4..452cba3fb953 100644
--- a/xen/arch/x86/acpi/cpu_idle.c
+++ b/xen/arch/x86/acpi/cpu_idle.c
@@ -50,6 +50,7 @@
 #include <public/platform.h>
 #include <public/sysctl.h>
 #include <acpi/cpufreq/cpufreq.h>
+#include <asm/amd.h>
 #include <asm/apic.h>
 #include <asm/cpuidle.h>
 #include <asm/mwait.h>
@@ -643,7 +644,7 @@ bool errata_c6_workaround(void)
                       x86_match_cpu(isr_errata));
     }
 
-    return (fix_needed && cpu_has_pending_apic_eoi());
+    return (fix_needed && cpu_has_pending_apic_eoi()) || amd_disable_c6;
 }
 
 void update_last_cx_stat(struct acpi_processor_power *power,
diff --git a/xen/arch/x86/cpu/amd.c b/xen/arch/x86/cpu/amd.c
index 0d3143031b5b..728fa61a54bb 100644
--- a/xen/arch/x86/cpu/amd.c
+++ b/xen/arch/x86/cpu/amd.c
@@ -50,6 +50,7 @@ boolean_param("allow_unsafe", opt_allow_unsafe);
 bool __read_mostly amd_acpi_c1e_quirk;
 bool __ro_after_init amd_legacy_ssbd;
 bool __initdata amd_virt_spec_ctrl;
+bool __read_mostly amd_disable_c6;
 
 static inline int rdmsr_amd_safe(unsigned int msr, unsigned int *lo,
 				 unsigned int *hi)
@@ -1189,3 +1190,44 @@ const struct cpu_dev amd_cpu_dev = {
 	.c_early_init	= early_init_amd,
 	.c_init		= init_amd,
 };
+
+static void cf_check disable_c6(void *arg)
+{
+	printk(XENLOG_WARNING
+	       "Disabling C6 after 1000 days uptime due to AMD errata 1474\n");
+	amd_disable_c6 = true;
+}
+
+static int __init cf_check amd_c6_errata(void)
+{
+	/*
+	 * Errata #1474: A Core May Hang After About 1044 Days
+	 * Set up a timer to disable C6 after 1000 days uptime.
+	 */
+	s_time_t;
+
+	if (boot_cpu_data.x86_vendor != X86_VENDOR_AMD ||
+	    boot_cpu_data.x86 != 0x17 ||
+	    (boot_cpu_data.x86_model & 0xf0) != 0x30)
+		return 0;
+
+	/*
+	 * Deduct current TSC value, this would be relevant if
+	 * kexec'ed for example.
+	 */
+	delta = DAYS(1000) - tsc_ticks2ns(rdtsc());
+	if (delta > 0) {
+		static struct timer errata_c6;
+
+		init_timer(&errata_c6, disable_c6, NULL, 0);
+		set_timer(&errata_c6, NOW() + delta);
+	} else
+		disable_c6(NULL);
+
+	return 0;
+}
+/*
+ * Must be executed after early_time_init() for tsc_ticks2ns() to have been
+ * calibrated.  That prevents us doing the check in init_amd().
+ */
+presmp_initcall(amd_c6_errata);
diff --git a/xen/arch/x86/include/asm/amd.h b/xen/arch/x86/include/asm/amd.h
index 09ee52dc1c09..c54bc6a8903f 100644
--- a/xen/arch/x86/include/asm/amd.h
+++ b/xen/arch/x86/include/asm/amd.h
@@ -157,4 +157,6 @@ bool amd_setup_legacy_ssbd(void);
 void amd_set_legacy_ssbd(bool enable);
 void amd_set_cpuid_user_dis(bool enable);
 
+extern bool amd_disable_c6;
+
 #endif /* __AMD_H__ */
diff --git a/xen/include/xen/time.h b/xen/include/xen/time.h
index b7427460dd13..99a91579438e 100644
--- a/xen/include/xen/time.h
+++ b/xen/include/xen/time.h
@@ -53,6 +53,7 @@ struct tm wallclock_time(uint64_t *ns);
 
 #define SYSTEM_TIME_HZ  1000000000ULL
 #define NOW()           ((s_time_t)get_s_time())
+#define DAYS(_d)        ((s_time_t)((_d)  * 86400000000000ULL))
 #define SECONDS(_s)     ((s_time_t)((_s)  * 1000000000ULL))
 #define MILLISECS(_ms)  ((s_time_t)((_ms) * 1000000ULL))
 #define MICROSECS(_us)  ((s_time_t)((_us) * 1000ULL))
-- 
2.40.0


