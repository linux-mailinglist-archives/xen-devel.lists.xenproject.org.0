Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 74C5B557561
	for <lists+xen-devel@lfdr.de>; Thu, 23 Jun 2022 10:25:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.354583.581805 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o4I9f-0007FD-Qt; Thu, 23 Jun 2022 08:25:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 354583.581805; Thu, 23 Jun 2022 08:25:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o4I9f-0007CT-Mt; Thu, 23 Jun 2022 08:25:35 +0000
Received: by outflank-mailman (input) for mailman id 354583;
 Thu, 23 Jun 2022 08:25:34 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=uSRO=W6=citrix.com=prvs=166c34e93=roger.pau@srs-se1.protection.inumbo.net>)
 id 1o4I9e-00071z-Q3
 for xen-devel@lists.xenproject.org; Thu, 23 Jun 2022 08:25:34 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0ba0c902-f2ce-11ec-b725-ed86ccbb4733;
 Thu, 23 Jun 2022 10:25:33 +0200 (CEST)
Received: from mail-mw2nam12lp2047.outbound.protection.outlook.com (HELO
 NAM12-MW2-obe.outbound.protection.outlook.com) ([104.47.66.47])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 23 Jun 2022 04:25:30 -0400
Received: from DS7PR03MB5608.namprd03.prod.outlook.com (2603:10b6:5:2c9::18)
 by MN2PR03MB5008.namprd03.prod.outlook.com (2603:10b6:208:1ac::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5353.15; Thu, 23 Jun
 2022 08:25:29 +0000
Received: from DS7PR03MB5608.namprd03.prod.outlook.com
 ([fe80::40af:d5f4:95eb:d534]) by DS7PR03MB5608.namprd03.prod.outlook.com
 ([fe80::40af:d5f4:95eb:d534%7]) with mapi id 15.20.5353.022; Thu, 23 Jun 2022
 08:25:29 +0000
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
X-Inumbo-ID: 0ba0c902-f2ce-11ec-b725-ed86ccbb4733
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1655972733;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:content-transfer-encoding:mime-version;
  bh=MuxBZdCHcFcLAUSqULIUORd90AHHM71XIXawMiighH0=;
  b=Pbb4Or+lR1t+hsU1PGLBIIP5aYQ3zLq6YnAKQImDgB/OqqHZqoVeETWh
   Ejyq51I0GEne7NSCqB2ix9TPMLy49dEZ0MqX5eYjzuhx9FzlHQ7N+I7QU
   cOjBBs+T4ntkCucjaKh/PmOts6PImAJ/HSdQ7ISRwU7mVIof90U8P5ir3
   k=;
X-IronPort-RemoteIP: 104.47.66.47
X-IronPort-MID: 74236222
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:ajDlJayDFherKT+l01t6t+dCxyrEfRIJ4+MujC+fZmUNrF6WrkUFy
 WQYWWyPPamDZGD1L9l2Odm+9k8HvJfSz9A2GQA9+CAxQypGp/SeCIXCJC8cHc8zwu4v7q5Dx
 59DAjUVBJlsFhcwnj/0bv656yMUOZigHtIQMsadUsxKbVIiGX1JZS5LwbZj2NY224LhX2thh
 PupyyHhEA79s9JLGjp8B5Kr8HuDa9yr5Vv0FnRnDRx6lAe2e0s9VfrzFonoR5fMeaFGH/bSe
 gr25OrRElU1XfsaIojNfr7TKiXmS1NJVOSEoiI+t6OK2nCuqsGuu0qS2TV1hUp/0l20c95NJ
 NpliaSoVR4FEb/2lccbXBBkDwh3I4BoweqSSZS/mZT7I0zuVVLJmq8rKX5seIoS96BwHH1E8
 uEeJHYVdBefiumqwbW9DO5xmsAkK8qtN4Qa0p1i5WiBUbB6HtadHeOWure03x9p7ixKNezZa
 McDLyJmcTzLYgFVO0dRA5U79AutriajKWYG8gjPzUYxy3iC3DF8jeHWC9TqZPqSbtp8mGSch
 VuTqgwVBTlfbrRz0wGt4n+qw+PCgy7/cIYTD6GjsO5nhkWJwW4eAwFQUkG0ydG7gEOjX9NUK
 2QP5zEj66M18SSDUd3VTxC+5nmesXYht8F4FuQ77ESI1fDS6gPAXGwcFGYdN5ohqdM8QiEs2
 hmRhdT1CDdzsbqTD3WA6rOTqjD0Mi8QRYMfWRI5ocI+y4GLiOkOYtjnF76PzIbdYgXJJAzN
IronPort-HdrOrdr: A9a23:LVaPda/QO0JkLC82CSZuk+FKdb1zdoMgy1knxilNoENuH/Bwxv
 rFoB1E73TJYVYqN03IV+rwWpVoJkmsj6KdgLNhRotKOTOLhILGFvAH0WKP+V3d8mjFh5dgPM
 RbAtdD4aPLfD9HZK/BiWHXcurIguP3iJxA7d2us0uFJjsaDp2IgT0JaTpyRSZNNXR77NcCZd
 Ohz/sCgwDlVWUcb8y9CHVAd+/fp+fTnJajRRIdHRYo5CSHkDvtsdfBYlOl9yZbdwkK7aYp8G
 DDnQC8zqK/s8ujwhuZ82PI9ZxZlPbo19MGLs2Rjco+LCnql2+TFcxccozHmApwjPCk6V4snt
 WJixA8P/5r43eURW2xqQuF4XiV7B8er1vZjXOIi3rqpsL0ABggDdBauI5fehzFr2I9odBVys
 twri2knqsSKSmFsDX25tDOWR0vvFGzu2AenekaiGEaeZcCaYVWsZcU8CpuYds99RrBmcEa+d
 RVfYHhDK48SyLYU5mZhBgj/DWUZAV8Iv/cKXJy+PB80FBt7QVEJgUjtYkid0w7heMAoql/lp
 r525tT5cFzp7ctHMRA7cc6MLyK4z/2MGTx2Fz7GyWVKIg3f1TwlrXQ3JIZoMmXRb1g9upBpH
 2GaiITiVIP
X-IronPort-AV: E=Sophos;i="5.92,215,1650945600"; 
   d="scan'208";a="74236222"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Oz1G4NNOcg9EMpi/lxw3xgBlL/paAng0Tbluqh9tIzUbXzkAJa9o1XOYNtpTu0Uu/OY71hMPUIL69nLr9nOTzSKUTJpcFUitWaBvQvQnMYNlpQlU7TfiPwpu57oXwZ3cma3F5KpjCsJO5DArxIe/VYZLLg68ifo0Cw5M2TFjv9PB0LC6mC8twY1066sGo6KwPu3qA8DPaZ6a3Tps+14RnJbWoyL/hZjNvaNrRtFnG/fdX3Kwe6syX4YNsI9mz2kFmOoHm31adI50+vQVy2JHSTjsyHcVGuN1fTJUbgp4HEW5cRuKAR8rVYvP44oj8txqgeoUTBIZFnacWViEb5zW/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dsP+mK1T59nSfzkuyerDtNZDx7JRlt36zNeR2aRBE2k=;
 b=EJ/rCCVfICdGNnMlrMuigFdWlf5cEP7aXClTcxVf40X0n7d4yAiqjHLJXS4vrYLmM00ZI0I0gUoGBwvtauxe7vZej1PvdT7cK/JnKEfoEbn6qkbfyggh2+iQTLvqGtVGGmJjLFudmU31aEIQyDKHJOuhmOkcu2b2CtQTXzig7ZPCHpLfRUTCfz5p9Ov1KJ83dwHNb7shUdpoimDQbuX9SEPAk31jP8x+QHygzPDl94IF0IGQ0/QeBQFhEFgxz6SUC7YDczogtA82X6MA0ZufOcwn0LIIbL0I1WK0ngsa5NbdtwWSo7SexgohJmiRkK037k+nQPVwi7Vg3RUNeUP1mQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dsP+mK1T59nSfzkuyerDtNZDx7JRlt36zNeR2aRBE2k=;
 b=k46nflQk5tPwrSGJUfmRqlxiQ0f5NbQD5MUMYtVhqOeUvPyhSAGPOAk1RtgD/qi3ss8AFNGffGpC4aBaOrJrgRH4sTXSAMpQQkVbHMTrQ7daSleXUWlobn1uHhGyFnIZnYINTLqV1BY+UUC56pEZiMdTV0xt09vCZmvuGekBTIc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Wei Liu <wl@xen.org>
Subject: [PATCH 5/6] x86/irq: print nr_irqs as limit on the number of MSI(-X) interrupts
Date: Thu, 23 Jun 2022 10:24:27 +0200
Message-Id: <20220623082428.28038-6-roger.pau@citrix.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220623082428.28038-1-roger.pau@citrix.com>
References: <20220623082428.28038-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0190.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1a4::15) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a46a249c-89e5-4a0a-745f-08da54f1ee5d
X-MS-TrafficTypeDiagnostic: MN2PR03MB5008:EE_
X-Microsoft-Antispam-PRVS:
	<MN2PR03MB5008F9BF9411B98B50D751F58FB59@MN2PR03MB5008.namprd03.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	BbB50cEbad1sB4At5jrgxjLVqX5mhsCGe85ytnPyJzsfvWMg0ZEhVPnNzV5UMarMxWoZg2o1ujoX4xc7lMuEBoJxL8SjrXpntwTPG57qkft1wt+Fj6xgITaWS09ICEmu9ja+ZX9c1v5xQYX7vLV5zDNzvz+W6MjCjcAbrpUHu+gXWVKMvgExQKvWCh8u2MAsn+cILlUoVpzW80cEsOe+B7NnOMncRo8Fnkgn/vkVGUXLq3Gwxx90OOdZu+DtuUQD65ShH7MWOD4LrQfjYZCuoz9niNrtRkMq1IfWn77QV89bfTiy/zqoS1AiqgXrGkgKuIK8hbmGZL2VNFtBTttnExkiH53n4C7nfPwaRZ2e6luN1j2jV4Q/k084n/BQ7NX22CR0qSFIeOciGhLuY6/uQoYdo5SGEnm0VYpeIq5pbyG/U55skWGolEWKNArFvRm8qF5o2qMSWVFxGQ1XBC8xtvtRN/KcYaqX8PGsCThoHnhuTppbkh1aBANo2KMOX2CwxFLuV8/URxjjrjt0gkTNdCFsK2XdtVZvtD7675O77nbF5FJpdrOlz9MHp1qn5sWy+xq2TDwPW5rzWNA50A9ESkH5mhUH98MuneVCcx55nBmjBd4mlduYDvCnrmSB1mq2kLaQ/vc+tvoE2EzwBAKg6MdWLd11NQj1Dg1Pv4LbYgKAqYg01JnTmiNlJJGjv4B4JMqvUOnRR9pghWUpwoImDA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(136003)(366004)(376002)(396003)(346002)(39860400002)(82960400001)(6916009)(2906002)(6486002)(38100700002)(5660300002)(316002)(86362001)(4744005)(8936002)(6512007)(66556008)(8676002)(36756003)(54906003)(2616005)(4326008)(66946007)(6506007)(83380400001)(1076003)(26005)(41300700001)(478600001)(66476007)(186003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cnMra1V0aHNWNTNweWpGMWVTSFBSdUZlMUNqNGJjS1BqMnBqQjRidnlNVHRq?=
 =?utf-8?B?Rjc3MTNRZEdJUEY0Uk05WE9Nb3NLRnM4L1U1WGQvMEtvb2NpWkRrdEtITnBn?=
 =?utf-8?B?RFV6TlRQQ2Z5QzloZHlVbGVDUU5HK0ZzbVVYQjBucU5YRVVheDBEeWhUd2JT?=
 =?utf-8?B?L2JJdk9tZFROVjluOFJya2YzSnJxVWRaMkVoK2VCU0RaZ2JPVWMvWWJEeGla?=
 =?utf-8?B?UlBWVVNzYjJjZy92OFpySEhpOGdNSXA3U0VmaWhoSnBTUVowUDQ4VjFxckZZ?=
 =?utf-8?B?TVhsYytPejRjMEJJeksrcUdWWUhDTTM2V3NTV3FMeFZ2ZDFYV2tmNTUrWllE?=
 =?utf-8?B?TmlUMHVwcGtmQmVxemtzTGtBWmFVOUxJSVZQN3J0em51MVdmRVMwVmh3b2wy?=
 =?utf-8?B?L1ZxZEFVdUZpZ1Z2RGlYN1pjZ1lLVlRjZndXRkNiNytYRy9rSVdSbzhRYnh2?=
 =?utf-8?B?NWd4Q1VCbXQwSjhtc29SdGdCZ05TZHg3a1JzRlBKZzJFMmpaNFdKVkVqakEv?=
 =?utf-8?B?cG1scUJGNzRORi8zcFlRZEp3YVhZUU9ocUhjc3c1ajJuVC8yMmhSUStXY0Iz?=
 =?utf-8?B?elRnejU1YlBHOFJjQll4dFcxVGhuRDAram03WFZGMHIzWHhINTd1Z1huOElC?=
 =?utf-8?B?dVNPSGdiUng3ZU1xcjJpVDdGRlFsQlVxNGNWYS9LWlhPNnloRmtPcFBFMlhs?=
 =?utf-8?B?Umo4Ni9ZSWJYYUxYYzdVR0pzWUZseTJBRWY4SGV3c01WY1ZxSmM3L05sVGpk?=
 =?utf-8?B?aXIvVDNWbXBMU0F4VnVOalpRU0h4K1lUT2JwVDAwemIvcTI5bEZqWXdOUXZU?=
 =?utf-8?B?MzVCaERBZHNnUzIrQWJoZVVmYzhyN0NGWE0rSSs2RHZFbWNCZCsrQ2xNNGth?=
 =?utf-8?B?U0FmTzd1bkNHZHE4UVNyamZQU2ZPVE1VWDZnK3cxL1JSVWg4OWpXblMxZFVI?=
 =?utf-8?B?MDRndkxaVFNDVkQ4dHVISExrdjQ4VUxoYktVb0Z1MVBZR0xtK1RIU2pDdk91?=
 =?utf-8?B?TWJibG5TNjdsYXNhQjB6aU1TVlBPYlAxQjl3NDlXMDZCRzE0SEJtcllVdm8y?=
 =?utf-8?B?V0JzcU9MTmptQmpoZEI4STlHVnFqZzhnOVJNamxiT1JuZk81NHdyWEVwOFpC?=
 =?utf-8?B?bVJ3S1VCbHJCNjNHelRhb0JJRGN0RTZtTmxsWWxoQy9aQXdtc3FtOS9VY1lP?=
 =?utf-8?B?cG4xWWtwQjhZZ2hGcnAwaTh5TDcwMFRiS3FOZVBaZmFROHk0cTZCZ3k1MjZv?=
 =?utf-8?B?Mk9oNktUMDYveDRwUnFtNE05NEVqcUNPYms1OWIrUnY1cE1ZUDk2UFZGUXlh?=
 =?utf-8?B?bDNHK2I4TVFaVEp4VFNEWlhTbjlyaUM5TitoWTdiSFMwemVkMTF2MEtBTHMr?=
 =?utf-8?B?bS9OUGJDV2o2empIZDQzVkFaV2pHVTQ4OXhHZEFRY1o4TzNoKzFrTFNWQ1ps?=
 =?utf-8?B?K2J0SUN4VkdTaTJDRUxtYlgrU2VYd0oxcHowbDBuUkZpaGxIaEs5dm1UVzNK?=
 =?utf-8?B?cUVwbThPcDkvL0pGdnF0TVVPVkNCTEpIb21NVDZTS2hzRVZ4TG4zV2hQMzVv?=
 =?utf-8?B?NktjbDh3SDVNdzcvVk9NbE92MmhXenlpU0x5d3MzMUVMcUhPbzZJQ1BYSTBI?=
 =?utf-8?B?MGRlTFdZWXdSODZ5ZGlQMVorRU1RRm5mTklQbnpZclJoTlhKM2ZFZUNXS0RB?=
 =?utf-8?B?M1hWRnY0TTR1S2w5WkZIM21zWVpQWTdXUU9Oc1BQQzdaZVNYcit1aXgxUmZ1?=
 =?utf-8?B?LzlYOFBOZEx0a2dLMGVhSjBhMVJQOE54QzEyVFpQc0xoYXhLQlIwalhGSmR2?=
 =?utf-8?B?S1RvQVdsZEVPc1R6YUd5aUJ4b2tpcC9JbWpWRDBGUTY4MmI5U28zdE1EVEhh?=
 =?utf-8?B?NCtkZnVHV1o5dEJnUjJuL1RpbXREbUw4V2R3a29ycmhxV3lDQXE4QW1IbnBR?=
 =?utf-8?B?aVVMUjRFQnZhQ29YVnFmakZVR3pxMXhBd05GcERXS3VyU1NMeW9NQzh0WWw1?=
 =?utf-8?B?WEdLV1pQQ2xFVktMeGdDRmpaWE80RjRpdGZyL1lkQ2NPelBBL2p0dUFCSDdO?=
 =?utf-8?B?VDdJVUR5YjFzSVJMbjdYSENxRDNFbWZUS25qM3EwMGxUTjRORkFhV3gwdWJp?=
 =?utf-8?Q?PAQcwRIn6vufYyQW6I9XFo43c?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a46a249c-89e5-4a0a-745f-08da54f1ee5d
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jun 2022 08:25:29.0394
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hkZQeG+pQm43iOjdnZkE2hNNhiI1l3NXvNRz5XIqEXOn5s5No3Gav89F7L/0Moo8x1WspT9EI1lEe5lpCMqBoA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR03MB5008

Using nr_irqs minus nr_irqs_gsi is misleading, as GSI interrupts are
not allocated unless requested by the hardware domain, so a hardware
domain could not use any GSI (or just one for the ACPI SCI), and hence
(almost) all nr_irqs will be available for MSI(-X) usage.

No functional difference, just affects the printed message.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
 xen/arch/x86/irq.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/xen/arch/x86/irq.c b/xen/arch/x86/irq.c
index b64d18c450..7f75ec8bcc 100644
--- a/xen/arch/x86/irq.c
+++ b/xen/arch/x86/irq.c
@@ -434,7 +434,7 @@ int __init init_irq_data(void)
         nr_irqs = 16;
 
     printk(XENLOG_INFO "IRQ limits: %u GSI, %u MSI/MSI-X\n",
-           nr_irqs_gsi, nr_irqs - nr_irqs_gsi);
+           nr_irqs_gsi, nr_irqs);
 
     for ( vector = 0; vector < X86_NR_VECTORS; ++vector )
         this_cpu(vector_irq)[vector] = INT_MIN;
-- 
2.36.1


