Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E64160CF76
	for <lists+xen-devel@lfdr.de>; Tue, 25 Oct 2022 16:45:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.429878.681189 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1onLAn-00042c-4M; Tue, 25 Oct 2022 14:44:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 429878.681189; Tue, 25 Oct 2022 14:44:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1onLAn-00040D-0s; Tue, 25 Oct 2022 14:44:57 +0000
Received: by outflank-mailman (input) for mailman id 429878;
 Tue, 25 Oct 2022 14:44:55 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=bJBo=22=citrix.com=prvs=2902c4af2=roger.pau@srs-se1.protection.inumbo.net>)
 id 1onLAl-0003SJ-3n
 for xen-devel@lists.xenproject.org; Tue, 25 Oct 2022 14:44:55 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 955942b2-5473-11ed-91b5-6bf2151ebd3b;
 Tue, 25 Oct 2022 16:44:53 +0200 (CEST)
Received: from mail-co1nam11lp2174.outbound.protection.outlook.com (HELO
 NAM11-CO1-obe.outbound.protection.outlook.com) ([104.47.56.174])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 25 Oct 2022 10:44:48 -0400
Received: from SJ0PR03MB6360.namprd03.prod.outlook.com (2603:10b6:a03:395::11)
 by BL1PR03MB6118.namprd03.prod.outlook.com (2603:10b6:208:31c::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5746.26; Tue, 25 Oct
 2022 14:44:46 +0000
Received: from SJ0PR03MB6360.namprd03.prod.outlook.com
 ([fe80::9f90:6ba5:5b44:c254]) by SJ0PR03MB6360.namprd03.prod.outlook.com
 ([fe80::9f90:6ba5:5b44:c254%3]) with mapi id 15.20.5746.028; Tue, 25 Oct 2022
 14:44:46 +0000
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
X-Inumbo-ID: 955942b2-5473-11ed-91b5-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1666709093;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:content-transfer-encoding:mime-version;
  bh=kZ1OYvSe2vZ67jkOMLmPoYcVQSX4fKFKr8Ey1iCTYIQ=;
  b=hOMjDavmMX9lGIlCXK0oWZGzhViGr1dc6P8/6lv+FC473HW0p+x1DHxz
   jJKqX47RGWue+JBhf7JJnoUbJWqmwxVgEahj6M+trRhHF4N6sxhhPSFii
   uCFNje6Cs/2llnYAMJbLGy0Lgn0mBLy5Prp9dgLDW7qVvr+DgC6WCK2ah
   k=;
X-IronPort-RemoteIP: 104.47.56.174
X-IronPort-MID: 83085556
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:xOH9Xqo5/MKMidM6h63nSCxLRvxeBmI7ZBIvgKrLsJaIsI4StFCzt
 garIBmHaKyNNmL9Kdh/YYu0ph4C7MWAzdIxHgc6rXw1FH8Vo5uZCYyVIHmrMnLJJKUvbq7FA
 +Y2MYCccZ9uHhcwgj/3b9ANeFEljfngqoLUUbKCYGYpLeNdYH9JoQp5nOIkiZJfj9G8Agec0
 fv/uMSaM1K+s9JOGjt8B5mr9VU+4ZwehBtC5gZkPKgR4QeE/5UoJMl3yZ+ZfiOQrrZ8RoZWd
 86bpJml82XQ+QsaC9/Nut4XpWVTH9Y+lSDX4pZnc/DKbipq/0Te4Y5iXBYoUm9Fii3hojxE4
 I4lWapc6+seFvakdOw1C3G0GszlVEFM0OevzXOX6aR/w6BaGpdFLjoH4EweZOUlFuhL7W5m+
 a0hDxNSURC6uOuN7L/mSK4rl+c9FZy+VG8fkikIITDxK98DGMmGaIKToNhS0XE3m9xEGuvYa
 4wBcz1zYR/cYhpJfFAKFJY5m+TujX76G9FagAvN+exrvC6Okkooj+SF3Nn9I7RmQe1PmUmVv
 CTe9nnRCRAGLt2PjzGC9xpAg8efxnurBd9PStVU8NZ730KdxTcTAic5bgKgm9qdq3GXAOBAf
 hl8Fi0G6PJaGFaQZsnwWVi0rWCJujYYWsFMCKsq5QeV0K3W7g2FQG8eQVZpSNEgrt5wejUs2
 XeAhdavDjtq2JWXQ3+A8rafrRupJDMYa2QFYEc5oRAt5tDipMQ4iUvJR9M6Saqt1ISqRXf33
 iyAqzU4i/MLl8kX2q6n/FfBxTWxupzOSQ1z7QLSNo640j5EiEeeT9TAwTDmATxode51knHpU
 KA4pvWj
IronPort-HdrOrdr: A9a23:B2essq6eqLyaBZfNoQPXwVOBI+orL9Y04lQ7vn2ZFiY5TiXIra
 qTdaogviMc6Ax/ZJjvo6HjBEDmewKnyXcV2/hrAV7GZmXbUQSTXeVfBOfZowEIXheOj9K1tp
 0QDJSWdueAamSS5PySiGfYLz9j+qj+zEnBv5aj854Hd3AOV0gP1XYbNu7NeXcGOTWuSKBJYq
 a0145inX6NaH4XZsO0Cj0sWPXCncTCkNbDbQQdDxAqxQGShXfwgYSKWySw71M7aXdi0L0i+W
 /Kn0jQ4biiieiyzlv523XI55pbtdP9wp9oBdCKiOISNjLw4zzYLbhJavmnhnQYseuv4FElnJ
 3lpAohBd167zfrcmS8sXLWqnzd+Qdrz0Wn5U6TgHPlr8C8bik9EdB9iYVQdQacw1Y8vflnuZ
 g7k16xht5yN1ftjS7979/HW1VBjUyvu0cvluYVkjh2TZYeUrlMtoYSlXklXavoJBiKprzPLd
 MeTf01vJ1tABOnhjHizyNSKeWXLzsO9kzseDlAhiSXuwIm7kyRgXFohvD3pU1whK7Ve6M0md
 gsDZ4Y5Y2mNvVmC56VJN1xNfdfWVa9Ni7kASa1HWnNMp0hFjbkl6PXiY9Fl91CPqZ4h6cPpA
 ==
X-IronPort-AV: E=Sophos;i="5.95,212,1661832000"; 
   d="scan'208";a="83085556"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AG5xutlvRldI7Rvf6M+d+N9NmqH1+K1cHsck6v7k3Owuz/OreM7V4m0775B1s1/TuDrs6JkhBd9dFK0HmEUwsVH5FOmxM52668eA/UnL0gC6ED7Lt9i2UbBYlNj8vtOtDavmUK+bJuZiaHAaN6QV1aUMEF6zdR9GO2AFIYwJSVtwdj6N9JfObSNlwxFh6ZOKB1Iz73jAU5kcll8DUwrO0MfcbHoKZIJH+FFPhFW+kH6ULS8lry4cqEVEe9w4MQHVpOtpy8mqxYz4G1zZYUayLAKJdWyAAsfegAEY6HQXIb213durgHYZtkLw8HSGCok7KVQzrxeLfOMk8EcztoowYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0Y6+G/P0SSRWP2XYjLdchAyuuRyJ+VKYBcPw6vHLtIQ=;
 b=I8B+zYP/nl/9JGepU4yBqnHhlAtE6w/Q2X0HtQdQDsp3wdMbX1NTU+GpRiKDAW7UA2KRtHEwLJOzFiTL4bUNyIH4pq03X4PlyXI7dKit/HLVivuGYqS+TqNKnsM/KVGn2LAMePWbGQO9e+ZYWUib35vzaet6TvDu1u3GMZpd7EYkcH3YlRSWN2cCLfxp2GBpQAvxIqqmtLyDSxV4pl9I65b+5ja0EXP8h2St+j7EmwdmIAAXijladLhIz47AZaBQxgzC/hi8novzofelfXidRT8OS767O3yxmVM0WtxzFd0TOQBvNJGPunG/+XiSHEiq5iiuVoFAglkLmVh7fTqwAA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0Y6+G/P0SSRWP2XYjLdchAyuuRyJ+VKYBcPw6vHLtIQ=;
 b=BN4MFw96t7OvEu429E3dwdQU1qc6FCMSCfWLlPRcjAOLTYtwWdAjohhOInNssx9MpZOie00tahKRtgS9xNSngANK42aWBaoL4PgBq79QfXaEo+Rd2odxk0H7n+grSRoFiydbyCsrNdJTHgbVaeHDEuftU+URasNNmLHNBzxFEZA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Henry.Wang@arm.com,
	Roger Pau Monne <roger.pau@citrix.com>,
	Jan Beulich <jbeulich@suse.com>
Subject: [PATCH for-4.17 v2 2/5] vpci/msix: remove from table list on detach
Date: Tue, 25 Oct 2022 16:44:15 +0200
Message-Id: <20221025144418.66800-3-roger.pau@citrix.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221025144418.66800-1-roger.pau@citrix.com>
References: <20221025144418.66800-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0563.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:33b::11) To SJ0PR03MB6360.namprd03.prod.outlook.com
 (2603:10b6:a03:395::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6360:EE_|BL1PR03MB6118:EE_
X-MS-Office365-Filtering-Correlation-Id: fbf9dd58-09bc-4ab2-cb1f-08dab69775f4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	ICAfH3NlN7QfGZyxH56JPVtR0KHNRF/YaHkOW+V+WJ+acK7vAWr8JTZXdD11wWJ+WpFESNxaXKG0dYGb1PJI86BjpXbf+x974czLU3E2yK16b7YuWTu+ijB8eg4cs6z9y7sJiNz+wS/hkujK6fK2amqsPdAFb1bCqmy5q45mfRscFhkXN/+YUJ68WH5XZIm2TkNre+40W7ly97Fo9vE1CEJHX/rpQtlVTHufRmGAvtg/Z1ZDwloOCDMshPIAwE7uX9Kd09kAtpRRZhlKHUKEuXAQ6KKK+HdYWGR9vTN7LuCyaE//gXE8zjEQhRDEcKkizAcLZ7OL5dYGQtkk8sAr4kETljrgUIlGhVj+NKuC/UZwtMxjgN42EWzAdsGHKrN4EkxKvYen2LaYRCCfhYw0tJ4hqow8tvIGR6ylB/nWWvqA79F/otI7vzbnjxuSEA61Jy6Oq4tLtR1doXLIl1KQA4XCJldJlsfUKaKEM3gVXRANIzXhxlUqd8lPYDtEow8a0Uh24KTcrSC9/jMFM7AKyT0f9I0zTw8VozTOOBNnOfS+KS+ofk1rZOKOb1BQCSXJ2gwrdVZG44U82SI+ZVZNVdf4VQb3tiQaqSwfnx3H2GeRrWSemtev7nszmTmd98GKcwYU9WvNGxdP18E8C6y3RdEZKZeBl1khr8d7IyWVtfyx581QXANLVxoeutRNtmjwiED4UUqNjEWIjrnDXssmbg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6360.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(376002)(346002)(366004)(136003)(396003)(39860400002)(451199015)(36756003)(66946007)(83380400001)(316002)(4326008)(66556008)(6506007)(66476007)(8936002)(8676002)(54906003)(6666004)(6916009)(2616005)(1076003)(186003)(26005)(86362001)(6512007)(5660300002)(41300700001)(2906002)(478600001)(6486002)(82960400001)(38100700002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Mlg0V0dBTG9QZ2ExbDNjT3lzeHVtYTJqUVhSU0JMMUMzYm41b1AyQU9UYjBS?=
 =?utf-8?B?UktWWTNwT0QveXNiUmV6bWM5bzBMT0FhZ2I3QzFQeHN5cVJ2REhwNHN5UTNX?=
 =?utf-8?B?dC9GS1lPT1o4OUlhM1pZQnlwVzhhN2p6aTRTU09XSktVdnMyZ3B4ZDRqUkd4?=
 =?utf-8?B?ZFM0VndEU2VnTmpxSzhJbDRkMkFZelNVVG1aRGcweDJ1eGJidDNhUXNMQVAy?=
 =?utf-8?B?dFRvblpudS9LUzhjb25TODJsR2dxMyt3WDc0SUJkVTJGS2F2ZU9MV1RKREV1?=
 =?utf-8?B?WTd2SlBvQkM1S2VhV0tpanNjaTcvSFJpdjE1Q2U3VllvYk80bEU2US82Qnow?=
 =?utf-8?B?YWc3czNteDkzbzBlMGlFOTJtRGhyOUc2NDJ5OEdGYlpTRTVHT21hdlJ4eWtN?=
 =?utf-8?B?bTdINnZHWnJON2NEMzJuRkF4V2hRc1NSdjVvaHIwWGlQcTd2ZGxsclBGRDdF?=
 =?utf-8?B?QzhhdklKR2VWT0JHWERIWU1iWlB5d0cxNjI3MVhQT0pRMWRSa1dIeFFubUg4?=
 =?utf-8?B?NWVuaFBkRnRvTVYrdkVDeHVQVGZrYWR1V1VsWjI4VFFibldQT3Y4VEZldnpW?=
 =?utf-8?B?VTVpS1NkZG9Fa3NhS1ZoUWhIK3c0M2EvTkZyM2IzTTAxMjBJL1VvdnRkZXR6?=
 =?utf-8?B?Y28vUmtUR0NIQ1I1enlNcmhJOVR2Wk1yNHlwWU84S1JPcjdoUWpjVkxZdFV2?=
 =?utf-8?B?dDB5cE5wREJjRzdOcWdRcTVsZU96TWcraWVxdWx1UGxUL0NJRUQ1dWtYclQz?=
 =?utf-8?B?anBtcEdCNjQzS1ExSC9TTER4Y1c0aCs0Tm5rWnlZVkU1UXhmcFNzaDVVaE5I?=
 =?utf-8?B?NEExN2FQY1MxdnNsdUVGZFRtUWFTQmxZdEpUMk1NZ29tQmtjZmZNNmNRMDV0?=
 =?utf-8?B?QmRyaXBpbzZ6MWpMMlVEZEl4dlc0RFZWQ0FsRTlWd1pTd21GaXB4Rkpkc0cr?=
 =?utf-8?B?TDlUR0pRL0FQTVdjcHI3cDdjNElmS1lxOE5LaUpJWVFUeHBzWUZRMEZSNExD?=
 =?utf-8?B?dW1kdFJRZDBqV2JtbXJyVkF0TkdUcVUxb0ZqRkdGQTNXSGo4b3lWNG9kengy?=
 =?utf-8?B?Y25GbEhzV3JiVjRrdHZOSWF1bnd5Tm94YkF1UEg4LzZta0Z3RWIzUTVPVlVh?=
 =?utf-8?B?aUtiNXFXVjJKMHZzejd3c2wvY0w4bEZ5MjhlNURiaFg0TXhNNWY5M0V5a2NK?=
 =?utf-8?B?L1ZFWkN6K0pmcXUxWW1nSGVRS0xzTlJyMGpRRlNCM2FJZDh5YkVHYUUzWE96?=
 =?utf-8?B?SXNaazVwSmhhTkd4czdyc3MwQVUxQzlVenFpeTUxb29lT3gzSC9JbHQzblJv?=
 =?utf-8?B?STB0TkVjclkvZHJTdmxtbkNTUk5MUlMxbmtsVEpodmJqdUdxdzVHZFQ5ZklJ?=
 =?utf-8?B?Ylc3blRHbEVuNTB5TGtXZk1DcjdMWTBERUdjT1BvRlliWjI1NGJGZ2NaZGNo?=
 =?utf-8?B?eFNOYXgrTDNvMjBhTkh6OFRUV2g0YTNQd0g4OXBBWmVQVmY5WEpWekd1WmJ1?=
 =?utf-8?B?Rmx2eUEzbldDM3cxUEQvbGhSMXN1VjJlSGN2MGJDT2ZJaFlzWGNkZi9SbjZJ?=
 =?utf-8?B?eUVkV2NrNWh3cEVkUzA3ejNiTU92MkVhdW5QQkt6NnVUaDZxZkRWQ2ZsVG0r?=
 =?utf-8?B?UkN0SzVoRmdDeXpkOEpUSWhiekpNOG9zVDlrRXo1a2k4MU5KaGRtaDlYRnNC?=
 =?utf-8?B?bUNlYm5pNCtoSWtLMlpHWGhxVEJCWWZ0NENxYjZXNXNwcWY4UW5wemk2bnJx?=
 =?utf-8?B?MGtKY2xLMHJzeEFkMCtIdmhDSnVTWjR3K1lwMGxkTnhUcjZPWXRqMmVCR3Zn?=
 =?utf-8?B?N1dsMkFjYTFGb0MxN3Y3WUp4S0RXTWF3WlJwd3p3Q2Fjb1EyL0NwWHloM2hp?=
 =?utf-8?B?RlRabzRLTzJ3VFhLVFhhVzFuMFJZWmU4TVlJbDZTQndJUHFmR2ZMdWxFZitJ?=
 =?utf-8?B?b3JzMkdCN2dKOVY2U0ZYWnpkdTRUMGJIckFWT2ZaNUZoU0NiekMwWjR1VTd0?=
 =?utf-8?B?SVp3aWdBM016RWJZZXI5czc3RFJTRzRJTFNjMlgwV290dUVVbm1Ob1AvcnBI?=
 =?utf-8?B?cDN1ZEFsN3FjbFZaaG5nTk4waVBDSlJmNkY2UWl5M0ZuTWprMTRxSllQUHZu?=
 =?utf-8?B?S0h2b0Y1RVQwRnVrUTlBc1VaLzVQb2daZXB2c1l0RE1CcTQyQzJqcWhWdGQv?=
 =?utf-8?B?QXc9PQ==?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fbf9dd58-09bc-4ab2-cb1f-08dab69775f4
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6360.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Oct 2022 14:44:46.4296
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BhSehKPihtWP5topdIBJlsD38OihTVkZOWKAlPs8lPiTuS9lJ4z2kdUODIOtsIDvuElaedzzaLElIdT4cekIjQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR03MB6118

Teardown of MSIX vPCI related data doesn't currently remove the MSIX
device data from the list of MSIX tables handled by the domain,
leading to a use-after-free of the data in the msix structure.

Remove the structure from the list before freeing in order to solve
it.

Reported-by: Jan Beulich <jbeulich@suse.com>
Fixes: d6281be9d0 ('vpci/msix: add MSI-X handlers')
Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
 xen/drivers/vpci/vpci.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/xen/drivers/vpci/vpci.c b/xen/drivers/vpci/vpci.c
index 647f7af679..98198dc2c9 100644
--- a/xen/drivers/vpci/vpci.c
+++ b/xen/drivers/vpci/vpci.c
@@ -51,8 +51,12 @@ void vpci_remove_device(struct pci_dev *pdev)
         xfree(r);
     }
     spin_unlock(&pdev->vpci->lock);
-    if ( pdev->vpci->msix && pdev->vpci->msix->pba )
-        iounmap(pdev->vpci->msix->pba);
+    if ( pdev->vpci->msix )
+    {
+        list_del(&pdev->vpci->msix->next);
+        if ( pdev->vpci->msix->pba )
+            iounmap(pdev->vpci->msix->pba);
+    }
     xfree(pdev->vpci->msix);
     xfree(pdev->vpci->msi);
     xfree(pdev->vpci);
-- 
2.37.3


