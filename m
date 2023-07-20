Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6035375A93C
	for <lists+xen-devel@lfdr.de>; Thu, 20 Jul 2023 10:27:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.566472.885334 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qMP0K-0003Wq-GX; Thu, 20 Jul 2023 08:27:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 566472.885334; Thu, 20 Jul 2023 08:27:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qMP0K-0003Sm-C6; Thu, 20 Jul 2023 08:27:20 +0000
Received: by outflank-mailman (input) for mailman id 566472;
 Thu, 20 Jul 2023 08:27:19 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/JYs=DG=citrix.com=prvs=558be806a=roger.pau@srs-se1.protection.inumbo.net>)
 id 1qMP0J-0001O5-3I
 for xen-devel@lists.xenproject.org; Thu, 20 Jul 2023 08:27:19 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3bbd46d0-26d7-11ee-b23a-6b7b168915f2;
 Thu, 20 Jul 2023 10:27:17 +0200 (CEST)
Received: from mail-co1nam11lp2175.outbound.protection.outlook.com (HELO
 NAM11-CO1-obe.outbound.protection.outlook.com) ([104.47.56.175])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 20 Jul 2023 04:27:14 -0400
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com (2603:10b6:a03:38d::21)
 by SJ0PR03MB5760.namprd03.prod.outlook.com (2603:10b6:a03:2d3::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6609.24; Thu, 20 Jul
 2023 08:27:12 +0000
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::38aa:4814:3c7b:78ea]) by SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::38aa:4814:3c7b:78ea%5]) with mapi id 15.20.6588.031; Thu, 20 Jul 2023
 08:27:12 +0000
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
X-Inumbo-ID: 3bbd46d0-26d7-11ee-b23a-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1689841636;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:content-transfer-encoding:mime-version;
  bh=hoBKfo+TVeXY+Ru/Ne7C1tp93GStY9RqGnNdAfAsbTI=;
  b=dBdQOsY/2aLw9hemL5ispWK3r5U0KeYva90WpemlpK/P5S+VvtEuI3ee
   UQD7BKAh5qtclbSoEOA5vri32cTz/om45nL1SA8g83beSrAKH+kAWMQQZ
   0qN/qJ/aNHQ0cPLJovWYfi4u2DoFIlm59tacgnrhhllQrJ0zgimX+Y7n2
   g=;
X-IronPort-RemoteIP: 104.47.56.175
X-IronPort-MID: 115539014
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:bd1aqa7Djx95XB4ddkH48AxRtBzGchMFZxGqfqrLsTDasY5as4F+v
 jcZWWmCbqnYYGCkL4gjYYjloBlQvsfSzYRlSlA+rS5mHi5G8cbLO4+Ufxz6V8+wwm8vb2o8t
 plDNYOQRCwQZiWBzvt4GuG59RGQ7YnRGvynTraCYnsrLeNdYH9JoQp5nOIkiZJfj9G8Agec0
 fv/uMSaM1K+s9JOGjt8B5mr9lU35ZwehBtC5gZlPa8R5AeH/5UoJMl3yZ+ZfiOQrrZ8RoZWd
 86bpJml82XQ+QsaC9/Nut4XpWVTH9Y+lSDX4pZnc/DKbipq/0Te4Y5iXBYoUm9Fii3hojxE4
 I4lWapc6+seFvakdOw1C3G0GszlVEFM0OevzXOX6aR/w6BaGpdFLjoH4EweZOUlFuhL7W5m8
 s1ENgkzZwy5mM3rw4njEOVGnZgSFZy+VG8fkikIITDxK98DGMmGaIKToNhS0XE3m9xEGuvYa
 4wBcz1zYR/cYhpJfFAKFJY5m+TujX76G9FagAvN+exrvC6Okkooj+WF3Nn9I7RmQe1PmUmVv
 CTe9nnRCRAGLt2PjzGC9xpAg8eWxH6mA9NKTeHQGvhCqmSrwFIZMkIsbVKBofXot0CeWdZFN
 BlBksYphe1onKCxdfHtUhv9rHOasxo0X9tLD/Z8+AyL0rDT4QuSGi4DVDEpQMMinN87Q3otz
 FDht9HmHzt0q5WOVGmQsLyTqFuP1TM9KGYDYWoPSlID6ty6+YUr1EuQE5BkDbK/icDzFXfo2
 TeWoSMihrIVy8kWy6G8+lOBiDWpznTUcjMICszsdjrNxmtEiESNPuRENXCzAS58Ebuk
IronPort-HdrOrdr: A9a23:ldhHZ6vtSEF9aMqCJf3pHwlj7skDddV00zEX/kB9WHVpmwKj5q
 eTdZUgpHnJYVMqMk3I9urwW5VoLUm9yXcX2+gs1NWZLWvbUQKTRekI0WKI+UyEJ8SRzJ846U
 6iScRD4R/LYGSSQfyU3OBwKbgd/OU=
X-Talos-CUID: =?us-ascii?q?9a23=3AtTtJAmjLgJVb3BN7g+LBUGYE/DJudUyB0k7uKlO?=
 =?us-ascii?q?CFkk0S4bNE1O64/9Vqp87?=
X-Talos-MUID: 9a23:tpfqDAsNb6SjIEj78s2nrghaMvli2fuUMEk3kZlXhsekNyhqJGLI
X-IronPort-AV: E=Sophos;i="6.01,218,1684814400"; 
   d="scan'208";a="115539014"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TMjjG6dTRwA2mOQPmxcTsZSbAP6OaTYtCfTE5hpLj6wBBNIQn6QIBpWI6+ZC2g58Ht+caQigl1dA9rxZpFWoCKefkiaq6VroVHa1IEOvvgce97R2bIpQ0Vmdzv9YTzABH4nQE/+WRc732y1HAg092ctYZWTMOLsGLq9fB7aZJY4dNZvki6g4l2oCvcmXf1+2mdiOV4do6aSULjgbuZWP91mcJt1rVXNhAQtlb0Ha/S7Oy5e/fKIuGOJ0gRT6uDQOG3PUBr3e6nmb+v8UqmqeMDXOS6eMq2ct4YLgE8UAFLP9jZ5t+j/hRJtmqbW0EQNZ74R5KEqPkjYHqVbQQ+ujrA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Wr+vnLcTbPIrPgM1brYLYBaOkRLAS+kv/AjEfRMs/yA=;
 b=HBmXjtECMkpoM7Y81HgRtHNb4nyuoA0rpVaCAonA8fNfW7oxw3/py5r53oYHC5cpQoX3G7ExSBj+8dMq7x1kXON2N+fn8hr9UKmdsS0oROqAJ8JqtX4keT/snX27S5iMoLd/95XBKvCl3vxBsXIs2laU9ij2/k/CW+9E7OLS06DTSWQ6NGfS8eMo//xRCVi+0Vm3oi6abMMjn82pevJdAYOvMyQHnahfVpNehAaPOnG+7+9H4LeQ7OSJEaolqmeEuJsgx/gEBRY0Gb2lgriNLJ3wLJOz7IRIk1u6RLoPTPchlMECNgTpVjD+i9fmsWRBN+fpfSgFioShadmvymVE9w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Wr+vnLcTbPIrPgM1brYLYBaOkRLAS+kv/AjEfRMs/yA=;
 b=Pq316CvbQUt1kwRczptQJR5fwzW0b4Uh/mJ3Utd6Eg6gfMiRGv2xxQ5ivxSjpLB9W9ezuBl4XfkEHumL3NopDZPT+Q9KyXEjcVZDzDL5pINu+aH30Wbekv4fkR931OUcNJBhTM2bwCiX+/Lm6C+8Nb3r0URcsQQrP9BJ0fo1OJ4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>,
	Juergen Gross <jgross@suse.com>
Subject: [PATCH v3 5/6] libxl: use the cpuid feature names from cpufeatureset.h
Date: Thu, 20 Jul 2023 10:25:39 +0200
Message-ID: <20230720082540.69444-6-roger.pau@citrix.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230720082540.69444-1-roger.pau@citrix.com>
References: <20230720082540.69444-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO2P265CA0005.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:62::17) To SJ0PR03MB6423.namprd03.prod.outlook.com
 (2603:10b6:a03:38d::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6423:EE_|SJ0PR03MB5760:EE_
X-MS-Office365-Filtering-Correlation-Id: cf93da26-1f04-49b6-6aea-08db88fb1dd3
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	rMPDAU2mXHxOgRO6AcOxA65zM4UiKlggjYK2jmqgsc6i2vSRqCa9sH3gmNFHZi8xc+b2AuUPFsmMoXSqyk/7tgABtvXNh+rxv1BdyS4/oijboymruxa+im7rhCyaSt4ELM/vYgRoKlqr9eme149/38g/+gahCswmRR5R4Ynns5PLFZ/FBfkJ9o5Q8tI6cZAnqusGF1W7JjJQd6W9gpID6lq6wpPw0KlJHedfTc30JocDA0t8YpWEOtckF4X3gstPCqrOoqO+l8URQKGx9liqFJrKtlfG/Ro99jauX9hULTXRp3DGT/hi1q+oukYlcbqPbsoaeqpuzqtHe9h7f0zTAUleX7SPIwA+Y6VyVAfFqtiUyiFU3RhWS8eD2HkxP4i1K3JZIa7aDPVob8GIEGV5RqVHJbV9WcQ9GiFP0vMLndyj0NpbeX83sliCgzsoc92U2ptGi87LdrxjWK6bgkjF8dojibuxXKHMf9Uuhsae8VxO7FURjmgZc0Il77p/lgDNOFx8rW5ZswWxR12epEuYqlK/5nD2lNCYybtEyQDssS4iFFjVCx/ImxzA9Zg4JLjbZN+nn/y24wsp8dKBwUOZsQCob7PBM+KbbTgayy5fbjU=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6423.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(396003)(39860400002)(346002)(136003)(376002)(366004)(451199021)(86362001)(478600001)(83380400001)(1076003)(186003)(38100700002)(41300700001)(26005)(30864003)(54906003)(6916009)(8676002)(8936002)(316002)(2906002)(4326008)(6512007)(66556008)(66946007)(6666004)(66476007)(6486002)(6506007)(82960400001)(2616005)(66574015)(36756003)(5660300002)(473944003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UldmQUdJZkhEOVEvRHJ1TmUzVytmZHB5bFVmWmFJRkpHdmRaNFMrZ2lqK2pS?=
 =?utf-8?B?MC9PVXpzWDRiK1pNSllFZG9CeUFCUGpobSthd1JjRVRSMnNTb2VNQjdsZ0tP?=
 =?utf-8?B?dW52akNKV0dBb1NUOWxxVktXWU8xWlg2QkVqZWZjZkh5cGptckN4QnpmMVow?=
 =?utf-8?B?NlJwU1J1VVNndGh6R0c2K3JTOVNndWJrSmJQSUZDSDFKQW9MdlVBSzhaalNF?=
 =?utf-8?B?NnlkdEl5bnFaRENWTWNiNzA0aHpBUHdrZi9PV0U4TXFUbm1mL21velh3QitZ?=
 =?utf-8?B?dEFKaUNDSXVIeThNVC9ET2VJVnFQVkRXOFJPY1hXSXlmVFNodUxvL1huc0V0?=
 =?utf-8?B?WExLUmhyM2xwMHJRWVgxcXhYbG5YVFE4UDhZM2FtTkhodStJZGpiTnVZUFNm?=
 =?utf-8?B?dUdobnNiU0MrV3Z2Z2RVVlpvKzJkbUo4TnF0VzVtaTVKYU9Vejdxa0diZHY1?=
 =?utf-8?B?aGJocjRaSDJWQk5pNXFpTGFPTEFrem1qMXRiUExIaDhqemtPQWFMN1k0VklR?=
 =?utf-8?B?dTBrbFo5V2ZUOWZJSHFuMHlweTQ0S1dma21QQzluTFQvUlU2dEl4U0pLcS82?=
 =?utf-8?B?M3dtZFhqeldJUk4rbEs0Z1p1N2szVllRZVNXVVZ4Y3F0OFFwWTVQamJGSmxo?=
 =?utf-8?B?dUZXYzZSRjIyWDdjTm5rVEhMazQ0a2draHlxUjY2TnpIa3lteHcwU1h2cGx4?=
 =?utf-8?B?V1h3cE13bU8rTnNnbXIxNDRld2J6WGlTWU0xWVVDRzFIWTJqbXNiYTd6M3NW?=
 =?utf-8?B?TXQ4WmpOQ25aQlg5ZFU1MXhMVWZnd1U1ZVVWLzFYOURGbVVGQ0MxR3BqbCsv?=
 =?utf-8?B?bW44Yk9TczVxT25oMi9KU2lLalg1WS9rMXd3YlZKajlHNnF3eXF5UEdzVEMx?=
 =?utf-8?B?ekM1eWY2Uzlic0Z2SVc0NkxUVUJOaWFYcHdYUjJadGtYbXVLVGNtcEcxdC9M?=
 =?utf-8?B?SXBEOUErK0k3Ylg3RlB2WWxuRFVpTkFNcUJzSDYzSERXYmltSXpNcXB3R0dk?=
 =?utf-8?B?WWdxcEl5VjJsM3NKSmdBc29QNDFBMmtSWEFGRVlQcEhwdUF1ako2azNoV2sy?=
 =?utf-8?B?ZURWbzkwT25wa1gzeXFaN2p2MU1yRUlCT2FQN3lPazRjekhVY2RPbVZTY21S?=
 =?utf-8?B?K0ZobDArcVBIYzF0eUZsU29XOGFXeXkxalRMOU9oNm9maWw1RldQOUpHRmdm?=
 =?utf-8?B?WndMM3NSMUQxYlBhV0lWSFJGUVRjNXZJWEN6UWhuQ0V6RkF2aS9XL1R2enRT?=
 =?utf-8?B?NjRpZWd4MFZOMXI5S0p6TVZ5Vi96ZmN1aXZEb3dvU3RSbGJaZ3NYNjdXTWpa?=
 =?utf-8?B?cGEvVTlGMTRzbU9vWnhvcGpJYXc3bXpkOVVVakxvaWdaNTdLeEF4NHlXZzZM?=
 =?utf-8?B?RFdLOGhmQ0VxVkYzcnRUc3hXejVxR2k0THRuSlRJT21NZlJ0WitoWlJUS05Q?=
 =?utf-8?B?T1FIZHFQeWx3K3VITzlER3AyWSs4cUpoRWFqR0ltOUdPanNBVnJQSTJjY1Q1?=
 =?utf-8?B?RjFEMUhaOFE3dFB2bkNJWjBMZjQ5QnA3Yks0cDFlVWhTZ0wxbU5GVmQ2VENV?=
 =?utf-8?B?dHRtaTFxazlNOU5LSWUwdUVsMjhCTDVmWHg0YlEzb1Z0L2dXdlJvUURQQnAy?=
 =?utf-8?B?RzJ1STFqcm93WVB4b3gzSDJzY09VY3VUOEJBK0dWc25CdENBWHZpVSsza0xU?=
 =?utf-8?B?Yk9HLzJhUDJya2RVbWp5Q3FoOCs0Zy9Vc1VNcUx0MU1VdTdMb1Z2RFpUZCt6?=
 =?utf-8?B?Z3pJTzdQTklGMk1hYW9NblFXM3Y5YXRjelVoMVdIQ3B6Q2lETXQ4RENaK25h?=
 =?utf-8?B?RTRWYzhLV3JYODRxR2FlY0c4eHlPdEEzS0RZQk9DSGpxdVRUZUE2UWtFUDF0?=
 =?utf-8?B?RXVMVEhRbS9Ma1B2OGhYTDdTTmpJOGFFZmVWWFBjTkRxWVhmbGU5cmY5aUpv?=
 =?utf-8?B?VjNBTkt6OHQrOThOYTB4N0tLYzY1QTRPem1mOTFpQ1dqVFZyWTRFYUJvTVRV?=
 =?utf-8?B?cUtieXFVT0NYSGIxU0tpNFlhZXNENzFGUysydmhBNzBuNzBvUlFsa2hpVUN5?=
 =?utf-8?B?cStsbWF0cWE2YVNOdEN2c0VMUmsrQVBLSEtSMlNHT0poaUlqRWdyVFhBcW5j?=
 =?utf-8?B?Wkh2aDhLWHFNbEtuUWFHSGFPdm1xblozbU9GU3lZdzlsVjIxVFAyTEhLa0tZ?=
 =?utf-8?B?c2c9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	NtDCClPxn7dlSDJanOvuS7SIU6a8NFLARc1fYnnvUPUDotZ6PNYIYqvKhuRTxDi0VcV/8GNa3hY1o/crz+wCIM/oFjDn0UeoMAQnUMx3CjV43DiUtwNgTbj5WsjnoamioUDmq/3iOIvN1fEYMHFzhEYwjq+d8zRTcULC9ORnTBeXXoJczhDqEaDE107HjvUEgaNb4qwABQyOqFp4Xb7SJuKezeK6otyc97r1pgfAi19iiNWKzAjPQk4agOeMpARkhgjJ4nEVpGh/UfOpmZ7bIw8QhTlKq7O+kNz66KmSv49jbzoDkrERgrueApfSNqhADzSA87B4jytxVgoVy5nbC1v9dX1wHbwtboeRHQed/xZH6rii+4s8qeOKtwxIrqklBZorQtEIkDJ58csAshcELjNGE0j5KPOjXhHiZnVw/tFcT4RVnGjKHNJOGnhgsgbgSP8yR1uv8gU9RPDHCOSzD8pFvclROEoSVDamQDIvNlRCsRXfEExvJias54NoD9dCkB+qVANqvQ2aQYzYQ2c9q8eiZt3TwY8dVGogiyF9d09LB0ic5StEGic1mx7NpTWSiL3aJhNmCwbRnMktHYDRC/FYtQ9AXRLsHyVtKTWDr/VjEqeXBgLt7jMb5KERrhP74SEHCBLX20NjMrBdduYdpX7iDEtkquWkWSDmY2Nl4M84+dxxILdPHgxDqbQ2+P/9XQBZ2KyhvfaIdfckKf0/3qTckOe23eX1Yubm47xx5RT4h4DfVmuqBAUstXvHP/ZHJ/123I166ymDmzWYO7xFY3lOY9cno0NCXkylkwlwkRgYdWGCilZOP7sFYmP5ZFib
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cf93da26-1f04-49b6-6aea-08db88fb1dd3
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6423.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jul 2023 08:27:12.4568
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GjMrPipxEm6LBF+8vqa5pwhUxuBukPU1O4GedNm9ih7x8Q+oNWHYTMKzZT1GPokV+Hr/OO7gNh9T3XxYZUGdmw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB5760

The current implementation in libxl_cpuid_parse_config() requires
keeping a list of cpuid feature bits that should be mostly in sync
with the contents of cpufeatureset.h.

Avoid such duplication by using the automatically generated list of
cpuid features in INIT_FEATURE_NAMES in order to map feature names to
featureset bits, and then translate from featureset bits into cpuid
leaf, subleaf, register tuple.

Note that the full contents of the previous cpuid translation table
can't be removed.  That's because some feature names allowed by libxl
are not described in the featuresets, or because naming has diverged
and the previous nomenclature is preserved for compatibility reasons.

Should result in no functional change observed by callers, albeit some
new cpuid features will be available as a result of the change.

While there constify cpuid_flags name field.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
Reviewed-by: Anthony PERARD <anthony.perard@citrix.com>
---
Changes since v1:
 - const unnamed structure cast.
 - Declare struct feature_name outside the function.
 - Use strcmp.
 - Fix indentation.
 - Add back missing feature name options.
 - Return ERROR_NOMEM if allocation fails.
 - Improve xl.cfg documentation about how to reference the features
   described in the public header.
---
 docs/man/xl.cfg.5.pod.in       |  24 +--
 tools/libs/light/libxl_cpuid.c | 267 ++++++++++++---------------------
 tools/xl/xl_parse.c            |   3 +
 3 files changed, 107 insertions(+), 187 deletions(-)

diff --git a/docs/man/xl.cfg.5.pod.in b/docs/man/xl.cfg.5.pod.in
index 3979be2a590a..55161856f4c7 100644
--- a/docs/man/xl.cfg.5.pod.in
+++ b/docs/man/xl.cfg.5.pod.in
@@ -2010,24 +2010,16 @@ proccount procpkg stepping
 
 =back
 
-List of keys taking a character:
+List of keys taking a character can be found in the public header file
+L<arch-x86/cpufeatureset.h|https://xenbits.xen.org/docs/unstable/hypercall/x86_64/include,public,arch-x86,cpufeatureset.h.html>
 
-=over 4
-
-3dnow 3dnowext 3dnowprefetch abm acpi adx aes altmovcr8 apic arat avx avx2
-avx512-4fmaps avx512-4vnniw avx512bw avx512cd avx512dq avx512er avx512f
-avx512ifma avx512pf avx512vbmi avx512vl bmi1 bmi2 clflushopt clfsh clwb cmov
-cmplegacy cmpxchg16 cmpxchg8 cmt cntxid dca de ds dscpl dtes64 erms est extapic
-f16c ffxsr fma fma4 fpu fsgsbase fxsr hle htt hypervisor ia64 ibs invpcid
-invtsc lahfsahf lm lwp mca mce misalignsse mmx mmxext monitor movbe mpx msr
-mtrr nodeid nx ospke osvw osxsave pae page1gb pat pbe pcid pclmulqdq pdcm
-perfctr_core perfctr_nb pge pku popcnt pse pse36 psn rdrand rdseed rdtscp rtm
-sha skinit smap smep smx ss sse sse2 sse3 sse4.1 sse4.2 sse4_1 sse4_2 sse4a
-ssse3 svm svm_decode svm_lbrv svm_npt svm_nrips svm_pausefilt svm_tscrate
-svm_vmcbclean syscall sysenter tbm tm tm2 topoext tsc tsc-deadline tsc_adjust
-umip vme vmx wdt x2apic xop xsave xtpr
+The feature names described in C<cpufeatureset.h> should be specified in all
+lowercase letters, and with underscores converted to hyphens.  For example in
+order to reference feature C<LAHF_LM> the string C<lahf-lm> should be used.
 
-=back
+Note that C<clflush> is described as an option that takes a value, and that
+takes precedence over the C<clflush> flag in C<cpufeatureset.h>.  The feature
+flag must be referenced as C<clfsh>.
 
 =back
 
diff --git a/tools/libs/light/libxl_cpuid.c b/tools/libs/light/libxl_cpuid.c
index c62247f9bda7..f8b2e45ee681 100644
--- a/tools/libs/light/libxl_cpuid.c
+++ b/tools/libs/light/libxl_cpuid.c
@@ -14,6 +14,8 @@
 
 #include "libxl_internal.h"
 
+#include <xen/lib/x86/cpu-policy.h>
+
 int libxl__cpuid_policy_is_empty(libxl_cpuid_policy_list *pl)
 {
     return !*pl || (!libxl_cpuid_policy_list_length(pl) && !(*pl)->msr);
@@ -60,7 +62,7 @@ void libxl_cpuid_dispose(libxl_cpuid_policy_list *pl)
  * Used for the static structure describing all features.
  */
 struct cpuid_flags {
-    char* name;
+    const char *name;
     uint32_t leaf;
     uint32_t subleaf;
     int reg;
@@ -153,7 +155,19 @@ static int cpuid_add(libxl_cpuid_policy_list *policy,
     entry->policy[flag->reg - 1] = resstr;
 
     return 0;
+}
+
+struct feature_name {
+    const char *name;
+    unsigned int bit;
+};
+
+static int search_feature(const void *a, const void *b)
+{
+    const char *key = a;
+    const char *feat = ((const struct feature_name *)b)->name;
 
+    return strcmp(key, feat);
 }
 
 /* parse a single key=value pair and translate it into the libxc
@@ -176,208 +190,42 @@ int libxl_cpuid_parse_config(libxl_cpuid_policy_list *policy, const char* str)
         {"proccount",    0x00000001, NA, CPUID_REG_EBX, 16,  8},
         {"localapicid",  0x00000001, NA, CPUID_REG_EBX, 24,  8},
 
-        {"sse3",         0x00000001, NA, CPUID_REG_ECX,  0,  1},
-        {"pclmulqdq",    0x00000001, NA, CPUID_REG_ECX,  1,  1},
-        {"dtes64",       0x00000001, NA, CPUID_REG_ECX,  2,  1},
-        {"monitor",      0x00000001, NA, CPUID_REG_ECX,  3,  1},
-        {"dscpl",        0x00000001, NA, CPUID_REG_ECX,  4,  1},
-        {"vmx",          0x00000001, NA, CPUID_REG_ECX,  5,  1},
-        {"smx",          0x00000001, NA, CPUID_REG_ECX,  6,  1},
         {"est",          0x00000001, NA, CPUID_REG_ECX,  7,  1},
-        {"tm2",          0x00000001, NA, CPUID_REG_ECX,  8,  1},
-        {"ssse3",        0x00000001, NA, CPUID_REG_ECX,  9,  1},
         {"cntxid",       0x00000001, NA, CPUID_REG_ECX, 10,  1},
-        {"fma",          0x00000001, NA, CPUID_REG_ECX, 12,  1},
         {"cmpxchg16",    0x00000001, NA, CPUID_REG_ECX, 13,  1},
-        {"xtpr",         0x00000001, NA, CPUID_REG_ECX, 14,  1},
-        {"pdcm",         0x00000001, NA, CPUID_REG_ECX, 15,  1},
-        {"pcid",         0x00000001, NA, CPUID_REG_ECX, 17,  1},
-        {"dca",          0x00000001, NA, CPUID_REG_ECX, 18,  1},
         /* Linux uses sse4_{1,2}.  Keep sse4.{1,2} for compatibility */
         {"sse4_1",       0x00000001, NA, CPUID_REG_ECX, 19,  1},
         {"sse4.1",       0x00000001, NA, CPUID_REG_ECX, 19,  1},
         {"sse4_2",       0x00000001, NA, CPUID_REG_ECX, 20,  1},
         {"sse4.2",       0x00000001, NA, CPUID_REG_ECX, 20,  1},
-        {"x2apic",       0x00000001, NA, CPUID_REG_ECX, 21,  1},
-        {"movbe",        0x00000001, NA, CPUID_REG_ECX, 22,  1},
-        {"popcnt",       0x00000001, NA, CPUID_REG_ECX, 23,  1},
-        {"tsc-deadline", 0x00000001, NA, CPUID_REG_ECX, 24,  1},
         {"aes",          0x00000001, NA, CPUID_REG_ECX, 25,  1},
-        {"xsave",        0x00000001, NA, CPUID_REG_ECX, 26,  1},
-        {"osxsave",      0x00000001, NA, CPUID_REG_ECX, 27,  1},
-        {"avx",          0x00000001, NA, CPUID_REG_ECX, 28,  1},
-        {"f16c",         0x00000001, NA, CPUID_REG_ECX, 29,  1},
-        {"rdrand",       0x00000001, NA, CPUID_REG_ECX, 30,  1},
-        {"hypervisor",   0x00000001, NA, CPUID_REG_ECX, 31,  1},
-
-        {"fpu",          0x00000001, NA, CPUID_REG_EDX,  0,  1},
-        {"vme",          0x00000001, NA, CPUID_REG_EDX,  1,  1},
-        {"de",           0x00000001, NA, CPUID_REG_EDX,  2,  1},
-        {"pse",          0x00000001, NA, CPUID_REG_EDX,  3,  1},
-        {"tsc",          0x00000001, NA, CPUID_REG_EDX,  4,  1},
-        {"msr",          0x00000001, NA, CPUID_REG_EDX,  5,  1},
-        {"pae",          0x00000001, NA, CPUID_REG_EDX,  6,  1},
-        {"mce",          0x00000001, NA, CPUID_REG_EDX,  7,  1},
+
         {"cmpxchg8",     0x00000001, NA, CPUID_REG_EDX,  8,  1},
-        {"apic",         0x00000001, NA, CPUID_REG_EDX,  9,  1},
         {"sysenter",     0x00000001, NA, CPUID_REG_EDX, 11,  1},
-        {"mtrr",         0x00000001, NA, CPUID_REG_EDX, 12,  1},
-        {"pge",          0x00000001, NA, CPUID_REG_EDX, 13,  1},
-        {"mca",          0x00000001, NA, CPUID_REG_EDX, 14,  1},
-        {"cmov",         0x00000001, NA, CPUID_REG_EDX, 15,  1},
-        {"pat",          0x00000001, NA, CPUID_REG_EDX, 16,  1},
-        {"pse36",        0x00000001, NA, CPUID_REG_EDX, 17,  1},
         {"psn",          0x00000001, NA, CPUID_REG_EDX, 18,  1},
         {"clfsh",        0x00000001, NA, CPUID_REG_EDX, 19,  1},
-        {"ds",           0x00000001, NA, CPUID_REG_EDX, 21,  1},
-        {"acpi",         0x00000001, NA, CPUID_REG_EDX, 22,  1},
-        {"mmx",          0x00000001, NA, CPUID_REG_EDX, 23,  1},
-        {"fxsr",         0x00000001, NA, CPUID_REG_EDX, 24,  1},
-        {"sse",          0x00000001, NA, CPUID_REG_EDX, 25,  1},
-        {"sse2",         0x00000001, NA, CPUID_REG_EDX, 26,  1},
-        {"ss",           0x00000001, NA, CPUID_REG_EDX, 27,  1},
-        {"htt",          0x00000001, NA, CPUID_REG_EDX, 28,  1},
         {"tm",           0x00000001, NA, CPUID_REG_EDX, 29,  1},
         {"ia64",         0x00000001, NA, CPUID_REG_EDX, 30,  1},
         {"pbe",          0x00000001, NA, CPUID_REG_EDX, 31,  1},
 
         {"arat",         0x00000006, NA, CPUID_REG_EAX,  2,  1},
 
-        {"fsgsbase",     0x00000007,  0, CPUID_REG_EBX,  0,  1},
         {"tsc_adjust",   0x00000007,  0, CPUID_REG_EBX,  1,  1},
-        {"bmi1",         0x00000007,  0, CPUID_REG_EBX,  3,  1},
-        {"hle",          0x00000007,  0, CPUID_REG_EBX,  4,  1},
-        {"avx2",         0x00000007,  0, CPUID_REG_EBX,  5,  1},
-        {"smep",         0x00000007,  0, CPUID_REG_EBX,  7,  1},
-        {"bmi2",         0x00000007,  0, CPUID_REG_EBX,  8,  1},
-        {"erms",         0x00000007,  0, CPUID_REG_EBX,  9,  1},
-        {"invpcid",      0x00000007,  0, CPUID_REG_EBX, 10,  1},
-        {"rtm",          0x00000007,  0, CPUID_REG_EBX, 11,  1},
         {"cmt",          0x00000007,  0, CPUID_REG_EBX, 12,  1},
-        {"mpx",          0x00000007,  0, CPUID_REG_EBX, 14,  1},
-        {"avx512f",      0x00000007,  0, CPUID_REG_EBX, 16,  1},
-        {"avx512dq",     0x00000007,  0, CPUID_REG_EBX, 17,  1},
-        {"rdseed",       0x00000007,  0, CPUID_REG_EBX, 18,  1},
-        {"adx",          0x00000007,  0, CPUID_REG_EBX, 19,  1},
-        {"smap",         0x00000007,  0, CPUID_REG_EBX, 20,  1},
-        {"avx512-ifma",  0x00000007,  0, CPUID_REG_EBX, 21,  1},
-        {"clflushopt",   0x00000007,  0, CPUID_REG_EBX, 23,  1},
-        {"clwb",         0x00000007,  0, CPUID_REG_EBX, 24,  1},
-        {"proc-trace",   0x00000007,  0, CPUID_REG_EBX, 25,  1},
-        {"avx512pf",     0x00000007,  0, CPUID_REG_EBX, 26,  1},
-        {"avx512er",     0x00000007,  0, CPUID_REG_EBX, 27,  1},
-        {"avx512cd",     0x00000007,  0, CPUID_REG_EBX, 28,  1},
-        {"sha",          0x00000007,  0, CPUID_REG_EBX, 29,  1},
-        {"avx512bw",     0x00000007,  0, CPUID_REG_EBX, 30,  1},
-        {"avx512vl",     0x00000007,  0, CPUID_REG_EBX, 31,  1},
-
-        {"prefetchwt1",  0x00000007,  0, CPUID_REG_ECX,  0,  1},
-        {"avx512-vbmi",  0x00000007,  0, CPUID_REG_ECX,  1,  1},
-        {"umip",         0x00000007,  0, CPUID_REG_ECX,  2,  1},
-        {"pku",          0x00000007,  0, CPUID_REG_ECX,  3,  1},
-        {"ospke",        0x00000007,  0, CPUID_REG_ECX,  4,  1},
-        {"avx512-vbmi2", 0x00000007,  0, CPUID_REG_ECX,  6,  1},
-        {"cet-ss",       0x00000007,  0, CPUID_REG_ECX,  7,  1},
-        {"gfni",         0x00000007,  0, CPUID_REG_ECX,  8,  1},
-        {"vaes",         0x00000007,  0, CPUID_REG_ECX,  9,  1},
-        {"vpclmulqdq",   0x00000007,  0, CPUID_REG_ECX, 10,  1},
-        {"avx512-vnni",  0x00000007,  0, CPUID_REG_ECX, 11,  1},
-        {"avx512-bitalg",0x00000007,  0, CPUID_REG_ECX, 12,  1},
-        {"avx512-vpopcntdq",0x00000007,0,CPUID_REG_ECX, 14,  1},
-        {"rdpid",        0x00000007,  0, CPUID_REG_ECX, 22,  1},
-        {"cldemote",     0x00000007,  0, CPUID_REG_ECX, 25,  1},
-        {"pks",          0x00000007,  0, CPUID_REG_ECX, 31,  1},
-
-        {"avx512-4vnniw",0x00000007,  0, CPUID_REG_EDX,  2,  1},
-        {"avx512-4fmaps",0x00000007,  0, CPUID_REG_EDX,  3,  1},
-        {"fsrm",         0x00000007,  0, CPUID_REG_EDX,  4,  1},
-        {"avx512-vp2intersect",0x00000007,0,CPUID_REG_EDX,8, 1},
-        {"srbds-ctrl",   0x00000007,  0, CPUID_REG_EDX,  9,  1},
-        {"md-clear",     0x00000007,  0, CPUID_REG_EDX, 10,  1},
-        {"serialize",    0x00000007,  0, CPUID_REG_EDX, 14,  1},
-        {"tsxldtrk",     0x00000007,  0, CPUID_REG_EDX, 16,  1},
-        {"cet-ibt",      0x00000007,  0, CPUID_REG_EDX, 20,  1},
-        {"avx512-fp16",  0x00000007,  0, CPUID_REG_EDX, 23,  1},
-        {"ibrsb",        0x00000007,  0, CPUID_REG_EDX, 26,  1},
-        {"stibp",        0x00000007,  0, CPUID_REG_EDX, 27,  1},
-        {"l1d-flush",    0x00000007,  0, CPUID_REG_EDX, 28,  1},
-        {"arch-caps",    0x00000007,  0, CPUID_REG_EDX, 29,  1},
-        {"core-caps",    0x00000007,  0, CPUID_REG_EDX, 30,  1},
-        {"ssbd",         0x00000007,  0, CPUID_REG_EDX, 31,  1},
-
-        {"avx-vnni",     0x00000007,  1, CPUID_REG_EAX,  4,  1},
-        {"avx512-bf16",  0x00000007,  1, CPUID_REG_EAX,  5,  1},
-        {"fzrm",         0x00000007,  1, CPUID_REG_EAX, 10,  1},
-        {"fsrs",         0x00000007,  1, CPUID_REG_EAX, 11,  1},
-        {"fsrcs",        0x00000007,  1, CPUID_REG_EAX, 12,  1},
-        {"wrmsrns",      0x00000007,  1, CPUID_REG_EAX, 19,  1},
-        {"avx-ifma",     0x00000007,  1, CPUID_REG_EAX, 23,  1},
-
-        {"avx-vnni-int8",0x00000007,  1, CPUID_REG_EDX,  4,  1},
-        {"avx-ne-convert",0x00000007, 1, CPUID_REG_EDX,  5,  1},
-        {"cet-sss",      0x00000007,  1, CPUID_REG_EDX, 18,  1},
-
-        {"intel-psfd",   0x00000007,  2, CPUID_REG_EDX,  0,  1},
-        {"ipred-ctrl",   0x00000007,  2, CPUID_REG_EDX,  1,  1},
-        {"rrsba-ctrl",   0x00000007,  2, CPUID_REG_EDX,  2,  1},
-        {"ddp-ctrl",     0x00000007,  2, CPUID_REG_EDX,  3,  1},
-        {"bhi-ctrl",     0x00000007,  2, CPUID_REG_EDX,  4,  1},
-        {"mcdt-no",      0x00000007,  2, CPUID_REG_EDX,  5,  1},
 
         {"lahfsahf",     0x80000001, NA, CPUID_REG_ECX,  0,  1},
         {"cmplegacy",    0x80000001, NA, CPUID_REG_ECX,  1,  1},
-        {"svm",          0x80000001, NA, CPUID_REG_ECX,  2,  1},
-        {"extapic",      0x80000001, NA, CPUID_REG_ECX,  3,  1},
         {"altmovcr8",    0x80000001, NA, CPUID_REG_ECX,  4,  1},
-        {"abm",          0x80000001, NA, CPUID_REG_ECX,  5,  1},
-        {"sse4a",        0x80000001, NA, CPUID_REG_ECX,  6,  1},
-        {"misalignsse",  0x80000001, NA, CPUID_REG_ECX,  7,  1},
-        {"3dnowprefetch",0x80000001, NA, CPUID_REG_ECX,  8,  1},
-        {"osvw",         0x80000001, NA, CPUID_REG_ECX,  9,  1},
-        {"ibs",          0x80000001, NA, CPUID_REG_ECX, 10,  1},
-        {"xop",          0x80000001, NA, CPUID_REG_ECX, 11,  1},
-        {"skinit",       0x80000001, NA, CPUID_REG_ECX, 12,  1},
-        {"wdt",          0x80000001, NA, CPUID_REG_ECX, 13,  1},
-        {"lwp",          0x80000001, NA, CPUID_REG_ECX, 15,  1},
-        {"fma4",         0x80000001, NA, CPUID_REG_ECX, 16,  1},
         {"nodeid",       0x80000001, NA, CPUID_REG_ECX, 19,  1},
-        {"tbm",          0x80000001, NA, CPUID_REG_ECX, 21,  1},
-        {"topoext",      0x80000001, NA, CPUID_REG_ECX, 22,  1},
         {"perfctr_core", 0x80000001, NA, CPUID_REG_ECX, 23,  1},
         {"perfctr_nb",   0x80000001, NA, CPUID_REG_ECX, 24,  1},
 
-        {"syscall",      0x80000001, NA, CPUID_REG_EDX, 11,  1},
-        {"nx",           0x80000001, NA, CPUID_REG_EDX, 20,  1},
-        {"mmxext",       0x80000001, NA, CPUID_REG_EDX, 22,  1},
-        {"ffxsr",        0x80000001, NA, CPUID_REG_EDX, 25,  1},
-        {"page1gb",      0x80000001, NA, CPUID_REG_EDX, 26,  1},
-        {"rdtscp",       0x80000001, NA, CPUID_REG_EDX, 27,  1},
-        {"lm",           0x80000001, NA, CPUID_REG_EDX, 29,  1},
-        {"3dnowext",     0x80000001, NA, CPUID_REG_EDX, 30,  1},
-        {"3dnow",        0x80000001, NA, CPUID_REG_EDX, 31,  1},
-
         {"procpkg",      0x00000004,  0, CPUID_REG_EAX, 26,  6},
 
         {"invtsc",       0x80000007, NA, CPUID_REG_EDX,  8,  1},
 
-        {"clzero",       0x80000008, NA, CPUID_REG_EBX,  0,  1},
-        {"rstr-fp-err-ptrs", 0x80000008, NA, CPUID_REG_EBX, 2, 1},
-        {"wbnoinvd",     0x80000008, NA, CPUID_REG_EBX,  9,  1},
-        {"ibpb",         0x80000008, NA, CPUID_REG_EBX, 12,  1},
-        {"ibrs",         0x80000008, NA, CPUID_REG_EBX, 14,  1},
-        {"amd-stibp",    0x80000008, NA, CPUID_REG_EBX, 15,  1},
-        {"ibrs-always",  0x80000008, NA, CPUID_REG_EBX, 16,  1},
-        {"stibp-always", 0x80000008, NA, CPUID_REG_EBX, 17,  1},
-        {"ibrs-fast",    0x80000008, NA, CPUID_REG_EBX, 18,  1},
-        {"ibrs-same-mode", 0x80000008, NA, CPUID_REG_EBX, 19,  1},
-        {"no-lmsl",      0x80000008, NA, CPUID_REG_EBX, 20,  1},
         {"ppin",         0x80000008, NA, CPUID_REG_EBX, 23,  1},
-        {"amd-ssbd",     0x80000008, NA, CPUID_REG_EBX, 24,  1},
-        {"virt-ssbd",    0x80000008, NA, CPUID_REG_EBX, 25,  1},
-        {"ssb-no",       0x80000008, NA, CPUID_REG_EBX, 26,  1},
-        {"psfd",         0x80000008, NA, CPUID_REG_EBX, 28,  1},
         {"btc-no",       0x80000008, NA, CPUID_REG_EBX, 29,  1},
-        {"ibpb-ret",     0x80000008, NA, CPUID_REG_EBX, 30,  1},
 
         {"nc",           0x80000008, NA, CPUID_REG_ECX,  0,  8},
         {"apicidsize",   0x80000008, NA, CPUID_REG_ECX, 12,  4},
@@ -391,17 +239,63 @@ int libxl_cpuid_parse_config(libxl_cpuid_policy_list *policy, const char* str)
         {"svm_pausefilt",0x8000000a, NA, CPUID_REG_EDX, 10,  1},
 
         {"lfence+",      0x80000021, NA, CPUID_REG_EAX,  2,  1},
-        {"nscb",         0x80000021, NA, CPUID_REG_EAX,  6,  1},
-        {"auto-ibrs",    0x80000021, NA, CPUID_REG_EAX,  8,  1},
-        {"cpuid-user-dis", 0x80000021, NA, CPUID_REG_EAX, 17, 1},
 
         {"maxhvleaf",    0x40000000, NA, CPUID_REG_EAX,  0,  8},
 
         {NULL, 0, NA, CPUID_REG_INV, 0, 0}
     };
+    static const struct feature_name features[] = INIT_FEATURE_NAMES;
+    /*
+     * NB: if we switch to using a cpu_policy derived object instead of a
+     * libxl_cpuid_policy_list we could get rid of the featureset -> cpuid leaf
+     * conversion table and use a featureset directly as we have conversions
+     * to/from featureset and cpu_policy.
+     */
+    static const struct {
+        enum { FEAT_CPUID, FEAT_MSR } type;
+        union {
+            struct {
+                uint32_t leaf, subleaf;
+                unsigned int reg;
+            } cpuid;
+            struct {
+                uint32_t index;
+                unsigned int reg;
+            } msr;
+        };
+    } feature_to_policy[] = {
+#define CPUID_ENTRY(l, s, r) \
+    { .type = FEAT_CPUID, .cpuid.leaf = l, .cpuid.subleaf = s, .cpuid.reg = r }
+#define MSR_ENTRY(i, r) \
+    { .type = FEAT_MSR, .msr.index = i, .msr.reg = r }
+        CPUID_ENTRY(0x00000001, NA, CPUID_REG_EDX),
+        CPUID_ENTRY(0x00000001, NA, CPUID_REG_ECX),
+        CPUID_ENTRY(0x80000001, NA, CPUID_REG_EDX),
+        CPUID_ENTRY(0x80000001, NA, CPUID_REG_ECX),
+        CPUID_ENTRY(0x0000000D,  1, CPUID_REG_EAX),
+        CPUID_ENTRY(0x00000007,  0, CPUID_REG_EBX),
+        CPUID_ENTRY(0x00000007,  0, CPUID_REG_ECX),
+        CPUID_ENTRY(0x80000007, NA, CPUID_REG_EDX),
+        CPUID_ENTRY(0x80000008, NA, CPUID_REG_EBX),
+        CPUID_ENTRY(0x00000007,  0, CPUID_REG_EDX),
+        CPUID_ENTRY(0x00000007,  1, CPUID_REG_EAX),
+        CPUID_ENTRY(0x80000021, NA, CPUID_REG_EAX),
+        CPUID_ENTRY(0x00000007,  1, CPUID_REG_EBX),
+        CPUID_ENTRY(0x00000007,  2, CPUID_REG_EDX),
+        CPUID_ENTRY(0x00000007,  1, CPUID_REG_ECX),
+        CPUID_ENTRY(0x00000007,  1, CPUID_REG_EDX),
+        MSR_ENTRY(0x10a, CPUID_REG_EAX),
+        MSR_ENTRY(0x10a, CPUID_REG_EDX),
+#undef MSR_ENTRY
+#undef CPUID_ENTRY
+    };
 #undef NA
     const char *sep, *val;
+    char *name;
     const struct cpuid_flags *flag;
+    const struct feature_name *feat;
+
+    BUILD_BUG_ON(ARRAY_SIZE(feature_to_policy) != FEATURESET_NR_ENTRIES);
 
     sep = strchr(str, '=');
     if (sep == NULL) {
@@ -414,6 +308,37 @@ int libxl_cpuid_parse_config(libxl_cpuid_policy_list *policy, const char* str)
             return cpuid_add(policy, flag, val);
     }
 
+    /* Provide a NUL terminated feature name to the search helper. */
+    name = strndup(str, sep - str);
+    if (name == NULL)
+        return ERROR_NOMEM;
+
+    feat = bsearch(name, features, ARRAY_SIZE(features), sizeof(features[0]),
+                   search_feature);
+    free(name);
+
+    if (feat == NULL)
+        return 2;
+
+    switch (feature_to_policy[feat->bit / 32].type) {
+    case FEAT_CPUID:
+    {
+        struct cpuid_flags f;
+
+        f.name = feat->name;
+        f.leaf = feature_to_policy[feat->bit / 32].cpuid.leaf;
+        f.subleaf = feature_to_policy[feat->bit / 32].cpuid.subleaf;
+        f.reg = feature_to_policy[feat->bit / 32].cpuid.reg;
+        f.bit = feat->bit % 32;
+        f.length = 1;
+
+        return cpuid_add(policy, &f, val);
+    }
+
+    case FEAT_MSR:
+        return 2;
+    }
+
     return 2;
 }
 
diff --git a/tools/xl/xl_parse.c b/tools/xl/xl_parse.c
index f036e56fc239..7bf587455d08 100644
--- a/tools/xl/xl_parse.c
+++ b/tools/xl/xl_parse.c
@@ -2620,6 +2620,9 @@ skip_usbdev:
                 case 3:
                     errstr = "illegal CPUID value (must be: [0|1|x|k|s])";
                     break;
+                case ERROR_NOMEM:
+                    errstr = "out of memory";
+                    break;
                 default:
                     errstr = "unknown error";
                     break;
-- 
2.41.0


