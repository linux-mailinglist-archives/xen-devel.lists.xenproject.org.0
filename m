Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8341B32B5E9
	for <lists+xen-devel@lfdr.de>; Wed,  3 Mar 2021 09:26:22 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.92735.174759 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lHMpT-0007n3-NS; Wed, 03 Mar 2021 08:25:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 92735.174759; Wed, 03 Mar 2021 08:25:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lHMpT-0007me-Jw; Wed, 03 Mar 2021 08:25:59 +0000
Received: by outflank-mailman (input) for mailman id 92735;
 Wed, 03 Mar 2021 08:25:58 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=7pqQ=IB=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1lHMpS-0007mZ-8d
 for xen-devel@lists.xenproject.org; Wed, 03 Mar 2021 08:25:58 +0000
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 1e8b35b7-cbda-4c28-8aea-f25211b8e4a6;
 Wed, 03 Mar 2021 08:25:56 +0000 (UTC)
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
X-Inumbo-ID: 1e8b35b7-cbda-4c28-8aea-f25211b8e4a6
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1614759956;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:content-transfer-encoding:mime-version;
  bh=hcHZxn/yloaKbz4HuwpCWh+4xZp5v7qk/JNM42WjKUM=;
  b=A+A7KVXTah75pfvdVrR8+UEMouN6ZAZfeH3Z8ddOKKPz+jgynurD2+32
   xg+PInDXURWf/bhcCDOAix0ZM8Iq2NBTyq7+m+E5RfsiJan4RDce96kQb
   j3Y2V1JlGWnAeiKhrwduSQbzT3HQjCMzuyo1Bq83/Hs//g4rjT8rrbzcu
   I=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: uuDwz1FAh/1liOX7d3IO6wd6A601A9bFGNqAWHQumTENTR3oijsFFN3IjwFUQDqexZunHBCc+3
 aXYtyba1A86TVLfu1e3RTbL5s5X0wazbqHAedmj+VtSJ3Q6vhtBCCTpgIF3ROBrdTO7vTr05yK
 DcTGz9sypdBWVksQwLTXaoeL+EtNJw6X6VNRCr/nYW1+VNN4/yvYH8CML8V8T1pNhjxp8KtGQY
 45S70QbX0S0p3WL4W76y1ThBYgVKrPQo6LQ+YhykN5A70l2cCeyaPSDu38p79EXcSaL8WjF7U/
 AXU=
X-SBRS: 5.2
X-MesageID: 38330489
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.81,219,1610427600"; 
   d="scan'208";a="38330489"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Wslo/jYulT38fjCMMRYcjaQZOXzGADBtOzZ2slI1zBGNpEEgK/n5wdEntKPnKjG9B7QmArM0jIGi9J2XpGs1ce+coAc/ugg1utrlgPo0mednjyC2x88jOh3TPCJbctRXTqxS4+0946lC5hL8aH2kn0Dl8wbgsYjtCzh9p7lygEBYrnAFuruJydhfvjZBiop7JGAFqV4CnBZEuSfYJRrHmwFmF5kyx1osj5POWCOXqPUiF1c5ieEO3tT9bI+hv3WfbZLOztTixFVz949lhr07rLLxiWMqyI/h0GIBuZCBCWnxI1WTmTNpBsff87R7YBQQkzniVmijs/+HHylIRl2fZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cydJsAIez600M/vb94JozzdggeHZXjVoZDJiSVI8vdk=;
 b=PV8ve0gKJVXuIlXMjXjO2WRoD0Pb3w3j5oOe5LtHkJ11aQkFtMkM6D98FnJVgpKkVv+Y16YXYI6MOhfbZSF1p4LGcr9Z/KPptC5t3PSLKmJnT7l/NPkHbV5Gm0NAW8YnkfD/DUtGKJcJ6IEYPej6s3UIdJnlfh65kGBcV7j2qFt02eOden8Q90BcsEdmLXQhycSrgUIZeAxUigpRPfUljvt+yZEB4VG5EKjDw6cEpgVDQu74wwqPfUeFTs4XqH6jzciLnTqvlm8QXgClmE/GqdptagLzdblRT7arNXOUQgJKlpN0H5a/9BxW7IM1E5oLE0f0CYGGTJGOBQau2cA3+A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cydJsAIez600M/vb94JozzdggeHZXjVoZDJiSVI8vdk=;
 b=PnOZaKCvkWYceAxyGtSN5B/MlnWQx7tpjJKsIZfiP1C+rokJtIcuARsyWfRWBgGZHS84fqJf4XM0GVXT5D0wZQQFVtT6wEcnwdQb7fjH26lZO7w8tA17NwCI/B5EiTz0BTwzc3ma//eMk+UyBWeJ4mWl2xOXZGumi9FE7C74BJU=
From: Roger Pau Monne <roger.pau@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Roger Pau Monne <roger.pau@citrix.com>, Doug Goldstein
	<cardoe@cardoe.com>, Ian Jackson <iwj@xenproject.org>, Stefano Stabellini
	<sstabellini@kernel.org>
Subject: [PATCH v2 for-4.15 2/2] automation: enable rombios build on Alpine
Date: Wed,  3 Mar 2021 09:25:14 +0100
Message-ID: <20210303082514.8859-3-roger.pau@citrix.com>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210303082514.8859-1-roger.pau@citrix.com>
References: <20210303082514.8859-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MR2P264CA0105.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:500:33::21) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4af0a248-ee6c-41ec-0bf4-08d8de1dedcb
X-MS-TrafficTypeDiagnostic: DM5PR03MB2971:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM5PR03MB29714B7D1FE23773986B2F1F8F989@DM5PR03MB2971.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5797;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: nLQlb27M+mENG/MRuNEDHtPzNx/lMn9A4ZWtgHK1XaeB/gWUTcEk4dnNe5a1AteUaKlaDUl4nrs5p2Hu0xpDN4fraSKqixRatBQMJLIcvCYST5jWxPjsm8URQgKahlcusB0AUlIZarneM7Qs0szMk1M+2MaL2IpRCoh9pMv+Uyk0zrsXnyGQW9s1pF+ETbujtWZOTNt7dC38vArSIIs0pOZoiKuI61UKLn4N+BIBHCgGWWk4lA7abu2ZOgXEEjlawssu/IT6/xKDa+QjpQAyVtAvro6RyrLaEU9DYEAkfj7xB7/K86F/O5E01RPsyoOKH8dvN0EhV4hUiVbiKKhjo3GO42f3hthMhThA+P2QdDp08izbXH0TRh26aoqA6Mw3daJK50jqVJ/IhUcmFilw2FVcFGc8g0TECYrkVoPkV0bDgyksBqHr0IxwNRsrOw8rXznE8+OIzPJ/EeTxi1GpTZkc2df3Drz/rRRtCN+onJsoAqjT93VSKZuC9BjkRBvnMZO0xF11nY6drUwYmxYzPw==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(366004)(346002)(39840400004)(396003)(136003)(83380400001)(316002)(16526019)(186003)(6486002)(4326008)(6916009)(1076003)(54906003)(26005)(66946007)(36756003)(478600001)(86362001)(4744005)(6666004)(956004)(8676002)(8936002)(2906002)(66556008)(2616005)(66476007)(6496006)(5660300002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?S29aM0x5QWx0WHVRMzJWNEk1UnBYR1hHeUQvdkFZQ1QrVU5ZNTlqSmVkMFFo?=
 =?utf-8?B?djNLK1o3S0dRZDN0K3NtL25RWEZLczdYL0hJV0tLRkJ1ZE1ZRnVFeXUwRnE4?=
 =?utf-8?B?bkF6Ykd6WG4vMTYwWnUzOG9NK2lJVzVlaUdtaS8rdlNhY1FyZ1hIQkg2cVMr?=
 =?utf-8?B?NC9HZmo4VElxcERlYWxkZG9UVTU4ZjQ5ZDFLMUtMNVExWDE5ZTlPb2RQb1ZH?=
 =?utf-8?B?S1V1TXFXUitad2FQOXYwQjJoMUN4ZlYrTmp5Z1R4WHFmNlhxUDBVR0l1N3NO?=
 =?utf-8?B?eHM5M09LSnBrVWd0KzBVTkduTEorQzNQYXY3VXFBc05aRDM5YVBIV1ptbjJR?=
 =?utf-8?B?WnR3eWQ0UmJQdFQ4WUdUMWZua1hReTZLaEhraUorZmFoRE15a0paMDhIMDdM?=
 =?utf-8?B?K3pJMjdXeUh5L0w0K2d2U2xCN1VXNW4vdGFUbFdWYU5hVHpiS2hzNDZuMGRG?=
 =?utf-8?B?UDRLM2dZeDl4UkQwUjRIY2l4bVhRTVVCM0R2NHZtbE52ejYxVjVRVUFhNDNU?=
 =?utf-8?B?NHhwK0lLSC9lU0JhTjhxQ1kwa213NE1wVGxWc2Q3WTIzSHVLbnR2ajBJekxz?=
 =?utf-8?B?L3daNXRpcUMyT29LNWZRTlVGb2RhTXR1Ym9ZWFhMUFJPTS9hQXZ1QjBuSHc0?=
 =?utf-8?B?QzFqTWQ4TzQ5c0JBKy82T2p0cnJEQXNhNUVjM1lIR29XZzF3R01LbUFSbGZj?=
 =?utf-8?B?WjMwQTc2bXZLZ3AraVR3cGFSK2pENzExWjFOR0IzOUdHeXlHZ1JJVTR4R2Zj?=
 =?utf-8?B?ekVwNnJ1M0IyMkRrUXJGTHIwVXNXUzQ4Ylk3NVV0OHNpZ1RQeEU1RVljLzJE?=
 =?utf-8?B?cFhvUE5FVDUrbzE1RE9LR3AzMWNCY1lqZzAyUFpwejhqc0JBdXYvcXNvTzRl?=
 =?utf-8?B?eGVlS3p2QnpIamQvcHh2endyVXFxN2UxN3JrWmFnV1BQQ2tuRlNpM1gwNGZU?=
 =?utf-8?B?RlZjYm8ybExpU0NEdzlpOW81K2NiSTdMWFJKTThCV1BSS1M2QXZQU1czMjJs?=
 =?utf-8?B?TW1zSktuOEEwY1ZvU21oNnp3TXFyMnFVRHRlUUc5a0JKbEN4VlRwcnN5dWZu?=
 =?utf-8?B?Z1dBQkJaSHBzTC9kOThhOTdjdnFxRndiTDJ4a1ZGN25RL0EySHV3aldGOGNn?=
 =?utf-8?B?a0wvRVZsbTF4UHh0N01pY09uOTB5ZHlpUGFvTWlPdkhhNE40NUZNY1FlUkF6?=
 =?utf-8?B?SnRkM0FGeHM3eVV0cmR6cW5yNE53WGNmbWp2ZlZtbnU2dG51TStET0xmQ3c0?=
 =?utf-8?B?U2RuMDNpOE0ySkNEQWpGTm1vb0VvTjlvWnlNY2RSaFlOS2tBb0Z0TW9jdmF3?=
 =?utf-8?B?UGZodmVVZmY2SnFBb2lyOEZQNmZxRUJoSXpsRDhUNW5tZDZCNGROK1daYzVR?=
 =?utf-8?B?YkZMNWRRbmhUV2dsUTJVc2Z1VWZxZVNQNko2aU9SVStJVlNTbklrb01oUm14?=
 =?utf-8?B?SEljbndLWU5xekJlRkhib2d5YnlhV0UwWkFGWEIraU80SW1JSVUxTkhreU54?=
 =?utf-8?B?ai83dnBOTDFLbEV4RFAzdEpWcndlTnp6TGovZ3ZHam4xVmxhNjY0OS9OaTQx?=
 =?utf-8?B?NFlKbW5XOFVjUVpueGlPYlk1QjAvbFFDdTQ3R3NXWFEwQUxuTGJydWI4SGQx?=
 =?utf-8?B?cHozVDdRQTZuMDJhaUNmS2pLU0l4QzgrOElvQmxxMnZSM1lyM0hDdEFha1Bq?=
 =?utf-8?B?aStVWlZRUWpxTFZ1UFJRRzdnWS9uNjhEbEJDaTdVOXMrWVI0dlJ3bkR3UlA5?=
 =?utf-8?Q?UUfb+UTRKeE9RwAL0d6LQE4xYL9i6at8c2Lo18S?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 4af0a248-ee6c-41ec-0bf4-08d8de1dedcb
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Mar 2021 08:25:39.8865
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9kP0Ep7J5+sFpHypHBp1gzAkJWI1UOz+hrsCA9NfhZwctBF+rGz5wUkkuhltRqLUJZbkAlCiWALCD8BNSrx9wg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR03MB2971
X-OriginatorOrg: citrix.com

It's now safe to enable the build of rombios on Alpine systems, as
hvmloader already builds fine there.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
 automation/scripts/build | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/automation/scripts/build b/automation/scripts/build
index d8990c3bf4..87e44bb940 100755
--- a/automation/scripts/build
+++ b/automation/scripts/build
@@ -31,9 +31,8 @@ fi
 if ! test -z "$(ldd /bin/ls|grep musl|head -1)"; then
     # disable --disable-werror for QEMUU when building with MUSL
     cfgargs+=("--with-extra-qemuu-configure-args=\"--disable-werror\"")
-    # hvmloader doesn't build on MUSL systems
-    cfgargs+=("--disable-seabios")
-    cfgargs+=("--disable-rombios")
+    # SeaBIOS doesn't build on MUSL systems
+    cfgargs+=("--with-system-seabios=/bin/false")
 fi
 
 # Qemu requires Python 3.5 or later
-- 
2.30.1


