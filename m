Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 73FA978A9B2
	for <lists+xen-devel@lfdr.de>; Mon, 28 Aug 2023 12:15:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.591432.923833 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qaZGn-0003Hv-47; Mon, 28 Aug 2023 10:14:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 591432.923833; Mon, 28 Aug 2023 10:14:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qaZGn-0003FU-1L; Mon, 28 Aug 2023 10:14:53 +0000
Received: by outflank-mailman (input) for mailman id 591432;
 Mon, 28 Aug 2023 10:14:51 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=EvBp=EN=citrix.com=prvs=597328b26=roger.pau@srs-se1.protection.inumbo.net>)
 id 1qaZGl-0003FO-2v
 for xen-devel@lists.xenproject.org; Mon, 28 Aug 2023 10:14:51 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b65c469c-458b-11ee-9b0c-b553b5be7939;
 Mon, 28 Aug 2023 12:14:48 +0200 (CEST)
Received: from mail-bn8nam11lp2169.outbound.protection.outlook.com (HELO
 NAM11-BN8-obe.outbound.protection.outlook.com) ([104.47.58.169])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 28 Aug 2023 06:14:40 -0400
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com (2603:10b6:a03:38d::21)
 by BY5PR03MB5127.namprd03.prod.outlook.com (2603:10b6:a03:1f0::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.34; Mon, 28 Aug
 2023 10:14:38 +0000
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::7b93:d9b3:b043:8c8a]) by SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::7b93:d9b3:b043:8c8a%6]) with mapi id 15.20.6699.034; Mon, 28 Aug 2023
 10:14:38 +0000
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
X-Inumbo-ID: b65c469c-458b-11ee-9b0c-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1693217688;
  h=from:to:cc:subject:date:message-id:
   content-transfer-encoding:mime-version;
  bh=RM3JJYLAwCt9s1inxB9kM6Gmn0yTZt0dWasVu9CDpwM=;
  b=S5u6Ela7LoH9mtFhJpU/OidOaYde+zdiJEAL2qJ8e8EXNHBFL7tcNs5c
   xJxrpIwxkWbXjv5aS8RSIj3iLFsuPUhJ0h90kMKKPPgVOem0HETM6S04N
   cfboBTXbt6j1JBqO/hwruZEUNkGPev5QJuQCYPZS9GwhugWv650WqpxZV
   M=;
X-IronPort-RemoteIP: 104.47.58.169
X-IronPort-MID: 119507280
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:2gsgRqt+1LAeFXxUWI3YFGFEl+fnVHBfMUV32f8akzHdYApBsoF/q
 tZmKTyCPaqPYzPyf9ogYIi+9hsB7ZPTx9JjSAo9rCkyFHhD+JbJXdiXEBz9bniYRiHhoOCLz
 O1FM4Wdc5pkJpP4jk3wWlQ0hSAkjclkfpKlVKiffHg3HVQ+IMsYoUoLs/YjhYJ1isSODQqIu
 Nfjy+XSI1bg0DNvWo4uw/vrRChH4rKq4lv0gnRkPaoQ5A+ExyFMZH4iDfrZw0XQE9E88tGSH
 44v/JnhlkvF8hEkDM+Sk7qTWiXmlZaLYGBiIlIPM0STqkAqSh4ai87XB9JFAatjsB2bnsgZ9
 Tl4ncfYpTHFnEH7sL91vxFwS0mSNEDdkVPNCSDXXce7lyUqf5ZwqhnH4Y5f0YAwo45K7W9yG
 fMwNQ4fbTen1seNx6+HbNl0tsEpa8+6I9ZK0p1g5Wmx4fcOZ7nmGvyPz/kImTA6i4ZJAOrUY
 NcfZXx3dhPcbhZTO1ARTpUjgOOvgXq5eDpdwL6XjfNvvy6Pk0osgP60bou9lt+iHK25mm6Co
 W3L5SLhCwwyP92D0zuVtHmrg4cjmAuiAdNPTOLipqYCbFu74ksdJiw7a1SBgfSTtGe0d9tmO
 XAs9X97xUQ13AnxJjXnZDWorXjBshMCVt54F+wh9BrL2qfS+xyeBGUPUnhGctNOnM08SCEu1
 1SJt8j0HjEpu7qQIVqC8p+EoDX0PjIaRVLufgcBRAoBptPl8Ic6i0uWSs45SfDkyNroBTv33
 jaG6jAkgKkehtIK0KP9+k3bhzWrpd7CSQtdChjrY19JJzhRPOaND7FEI3CBhRqcBO51lmW8g
 UU=
IronPort-HdrOrdr: A9a23:aWvuzqASgG5Z88flHelo55DYdb4zR+YMi2TDt3oddfU1SL38qy
 nKpp4mPHDP5wr5NEtPpTniAtjjfZq/z/5ICOAqVN/PYOCPggCVxepZnOjfKlPbehEX9oRmpN
 1dm6oVMqyMMbCt5/yKnDVRELwbsaa6GLjDv5a785/0JzsaE52J6W1Ce2GmO3wzfiZqL7wjGq
 GR48JWzgDQAkj+PqyAdx84t/GonayzqK7b
X-Talos-CUID: 9a23:+qVw+m8iWvvmazqstPOVv1MqCMMCViz493DNH2mIEVZsQvqTGEDFrQ==
X-Talos-MUID: =?us-ascii?q?9a23=3AapAxqA8x+uzQWVbRYM5uNPWQf+NP7YqfJX4Cq7U?=
 =?us-ascii?q?LkfetPwB5AiWhtDviFw=3D=3D?=
X-IronPort-AV: E=Sophos;i="6.02,207,1688443200"; 
   d="scan'208";a="119507280"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=I5wkLuybbZLGFaUfNlqU4tNuTpMC3Po3DPncBaCQD2zDmFCg7n6Zzh5nS6NjX7E3kiKeXWtgUcKYjMBPaM+AjI/FxI/ggAuw42iZdjS7a23QDO8nVJqBhAp+B1ANUK7J6mvHlFoXtvaF4u7LaphrkO5JovJlUkO0C0nI5RIIGAqCSmJL6pVIQj8gcTd7SHVn12Hdompy6+wonPjpeNLtI7ARoBWN7yPwCnbE01ow49g0CV4KWAFnGPUsHVrQnlgEkByYDR3T+C57Bk5SD/ea5B0N/5TYddnD/OWMyFyW2EmF8BS5QK3fQ7zvM0IK3H6Fo11hfD6AmkuLvXQCf85sWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5irB92Gz/kcvpAShOyJkwSI1E6gMkky+BAEgmvv+xlQ=;
 b=QpbYogUfCe5s2GI6tgvKg+LMWOo8wbAwdFnxOcoOKpxroTGdInKqWPSXaSUjYER9Uk4SNUtfDT+kZp7brkWfqgPC1GoPXDimjdKfXcPmDeBH9R8e2hbLZvPyNptY/2wtcsLihY5seqzmIy6dVGDjyw9F47FFBpw9IbcofYFG3U9jp7HVPoM80FMxRYIkKrWxTQM3fqBTH/LSGPgU1cTw2lYjA2BJUqET1Izl+MH6RvOJZQydrpP3fZg+AVfl8oxDG6LHgtHfGPlCb/k+vIUzJAbrByaT7wv99OHQuksDWJAhq8DZQ0YJlAb2FgPXJArw0dDS6/RLeSIHqxMoXT9VMg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5irB92Gz/kcvpAShOyJkwSI1E6gMkky+BAEgmvv+xlQ=;
 b=N0cfpqpRsrbkIo1dwgfUS2pE6/Jts/VTw2BN0lfqRyUSiwBP23ul//E6sq2xvwNxs+mzNTerwZ97DJfutYPeynhWiOSJRM008qqa+oVDzrs4TkRUn86nwXtLkhSWPaAcDooPCwDJgyTWXbNhdY5fm3ke1nSUPnkWPxtgWR8l1Ks=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Wei Liu <wl@xen.org>
Subject: [PATCH] x86/irq: fix reporting of spurious i8259 interrupts
Date: Mon, 28 Aug 2023 12:14:27 +0200
Message-ID: <20230828101428.23579-1-roger.pau@citrix.com>
X-Mailer: git-send-email 2.41.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P265CA0120.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2c6::7) To SJ0PR03MB6423.namprd03.prod.outlook.com
 (2603:10b6:a03:38d::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6423:EE_|BY5PR03MB5127:EE_
X-MS-Office365-Filtering-Correlation-Id: 60909be5-3350-4b0b-7da4-08dba7af95b5
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	FFdAvxOgQQbdetw5BGINnxXPajBeaMMA1/ZX+OYovMIUbqNfnYg0JuKrdTaDZhifgaEV808vJbjJlybbOWi+0RBEa8xbW04UYiMpRDrJx8fDI0t+bYHk3y/yHK14MUgr9T7TcSornP4R4DhMexpUzQVCBAAgsm2q5MgvtinAvZv2Cyt++RH7Vn9cLa6NtJ82YFJA/wUBAnBnHReVJ0hHfH8YSvCSA7a31eDlfBkMtqsaHPZeS2TT4qzLYevUHsNDQfvrBTGoP2jrVJrCHJgjj+Hm38UDo2v1ZRvqsN+XzJdBI6QogSp6ciGECT5ZPnNdV6eAvYrPRXJCxzJ9/0UJJd4vXmslTklIKTc65DAnYPEkaXcKMmqL5NqrFEiOletFJu+4YJnNYF4SALarsnYe2wg0kjCKJfCNIiO6XmR+DIxkMFmbgEQGxrZ5V7oD72GA1kqwrrr+Yu1bsRddabisf5d/Sg63JFH0jqXT8qg0sUr7jdmJFYMhEeRPL0/AqDS6OprVAL41Mi+iNtpWBlrtVRupV0uWzIhKrxm63nDibKXD+ciQS6aA04lRGl+/rduL
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6423.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376002)(39860400002)(366004)(136003)(396003)(346002)(186009)(1800799009)(451199024)(6512007)(6666004)(6506007)(6486002)(2616005)(1076003)(2906002)(5660300002)(86362001)(82960400001)(4744005)(6916009)(4326008)(8676002)(8936002)(54906003)(66946007)(66556008)(36756003)(66476007)(41300700001)(316002)(38100700002)(478600001)(83380400001)(26005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SSsvV1lFVjM0cWRKaDBUNVpFQXlzZld3T3JhSlEyL1BnMkxPUTIzNHBDb0cx?=
 =?utf-8?B?V1d5UG5qWUlLOHpFV3RzUzQ0eFVkeTZvQ1J6T1dPajUyQVVaMnF0dFhIRjE4?=
 =?utf-8?B?Ty8vcEE2WU9qYkQ5MWU4U1U1K1RBbHNTVUwxMGlkYmRwTWN0TThiOC82S2Np?=
 =?utf-8?B?cWN3K0dlejNqNjA5dHZCSW82NE5DV2ZOYjFiVEk1TnB1SWNGSTdJSVpUR1BP?=
 =?utf-8?B?bzdEdFVLUkFxYllMNDMrY1dmdEpMTW5hZEEvQmRTRWViKzcvVElLS1c3ODdC?=
 =?utf-8?B?emVaOXZkS2oxQXF0WEdmRlExREJvY2tZQ2NTRENlMXNhSnA2dWdORjdVSy85?=
 =?utf-8?B?eXFkeGQxcXBkREZ6aGlZUExBYTJmMWlDb28zamVtVUx1eGRHTUU0QTVOKzRu?=
 =?utf-8?B?bjcxWFp1MTV3dm9QMExWY1RlWkhDWnp0U2tUR1ZwcldWQmRKajZHdGlHRmg5?=
 =?utf-8?B?OU9hK245RlhQSnNMT0JJdFNIbHpwbjhXR01IL0hjYnpXd1F6RFY2VzRmVkgv?=
 =?utf-8?B?cktHODgwQ1IzSHplN2tYR2JiLzJ6V2s3SGUySGVZdEFWdjBrc1IxbkNhTXVq?=
 =?utf-8?B?ZWVhVllNYllkTllOVVJhbjZMTjlMNzRvRWtBMHgxZlgxdklXeCtBU1lzekN5?=
 =?utf-8?B?NXFxdlNxWFZUaUJlWGRucWc0azJLSU1VNHRwSDBhcFBZa2RSTlJ5dkJyc2ZW?=
 =?utf-8?B?eTEyblJnRUpGTWRWOU5mcGpJa3BWb0RjUmhEckZQNytDK20yVGM0V29LR0NS?=
 =?utf-8?B?OTdHZ1JLOEQ0K2NXNHowWUlqcFkxNmFYdGRyV3VmWElaTFJoalAvbjBpby9G?=
 =?utf-8?B?bmx0RzNpaW14ZlRUSVFYL21pbWUvVmtxSm5NekZjbFBlUjFwOER3UVlaUkZs?=
 =?utf-8?B?bCt4bVBwSVZQb3FpUHpzS3hWckxlTzdlVHE3K1BDT3ZDQmtuRWVKL1RhVkds?=
 =?utf-8?B?bDZaTDVQcTBDbUxmMlF5aVM5R3ZYY3k5aUxCZmQxN2hQa3hNQXBQRzRVdm5r?=
 =?utf-8?B?OFI1NXVSbVpobldGTjIxYzVyQzh2bXRaQmxDWnJQY1VudTFwWXVsREtmK1kv?=
 =?utf-8?B?Z3I4OW5WcjBzUmZ6WTRBanREb2tYZFNQRE9WajlGcHRwSXVGZW9lM3ZoUXc3?=
 =?utf-8?B?bjNuTUF6UFpWeGViaVBNN09ZN2ZKSU9ZTXZLYVBNeGZBRkhZMG83ZlUxUGJQ?=
 =?utf-8?B?YTExSXB5MXN0eXJGZTlVeGY2L29uZ09VVDlLZEhVT2Z5NHlkaTZ3eWRaNUpw?=
 =?utf-8?B?NkVVU0FRUmVSN1cyVzE4SWd2eUNoOU5CYm1GdkxUMEE2N0JIT2ZVbkZlU3BX?=
 =?utf-8?B?NVd2SVEvZ20vV2tPamxCVVhiRzBBVitnQ25DT255S2k4TFh0amlJKzdPZEN3?=
 =?utf-8?B?TXZpMVFHN1p6eWt3aHVGbXgxWWp4RTcrbFRIVUVINTBmRVlhNkpycWo1b3lL?=
 =?utf-8?B?L3dLNzFaZG1pR0JjeXJnR1VpekpuVndBK0pqNUlCWVhjR2JNUWMzNTNzUGk1?=
 =?utf-8?B?YUFKb0xCS2JjZjJ0TUF6UzlLME5pODZCY1BLTHNhM2J6cDNjNW5TUG9iZ292?=
 =?utf-8?B?aVFHSWs1MzJ1VXNPdGd5WHlrbHUyenhBakw3a2JYUjFjSjJFcGc2NGdnRSt4?=
 =?utf-8?B?VXJwNGFlUXJCVm0vSkxQNVJ0VU40ODB1RUhuMS9iTmRZc01wQmVlR2VVc1Vs?=
 =?utf-8?B?TjNxMTVOUHBXR09BV0lQczExUDNvRmVrbk9WVmVlR3VtZk1RcUY1MEtTWDVG?=
 =?utf-8?B?eHhRTW1Vbi9KRXMxQmFmK05PZkpzaXNqbHpob213RXc5Z0lpRitVRG52Tlpa?=
 =?utf-8?B?eFlUUUZvTTFjTE1vbE1PYjA3b1orQTIwSnR2RlZIcWVYU254L2ZkUFkzYVhp?=
 =?utf-8?B?RjdhaGlXR3JsTU9zVXY3bUdLYWFHdE0yNXlXSXBLSFdGdlNPY1dzYXFKM0da?=
 =?utf-8?B?cng3bXUyR2pTRVpMM3IvcThTeFR3SGFzdzRZeUFVM1ZldTI5c0FUYS9KT1F2?=
 =?utf-8?B?VlpkN0xoeTRqUWpEWDdna1JjTGhKYkY0T2Rpak8xVzh3eUtoa3k0YXozS3F4?=
 =?utf-8?B?anVLM21IdnhwdGpZcDJGcFhHWUlmRFVZRXRJRzJKSzl1SHhQQTJFUlk1N3Fh?=
 =?utf-8?Q?mRYbsypnmSCvHYQZsvbsXdDzG?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	zh69TyflqLfMPQjy1w0ox3K2qafgu1qvaLgVRcmR00deFB3gm1qITqSqFwphkXhwi+D4V3FomofTKldYfq2RvI/yjOUjfklXGanLgbA7Vh2N2aRUjq8Bz3dW1Y8ywQy+OanyZom1NmJMmCe8/Q/9i9ENqsDyR5fNW+GsHk947u94MDQAYRS4Hp/dkkEJuw8NNzwkDt63CJho9aQNtJ+o9LHG/bz2gih6hIhFIvhO1WKdzTgb6GrjGaGNYO+w3aUjVBaBHfJjnlM5/gdjnuG4z13ywa0H63tZgDkvM+3RYbEpSBzqK44ClMahKM2gf+jZ+2bLFjgkM4PeRR5WyCAeED5JwQm9ZJJ4oDjMG5ahfjWmvyTRDwdT7gZcmYF+9dt/jue67ECoW796n6a9T23jzP76V0JTmQplqTtL6t1bs6CqPHQIVdJJ2yfr9i96jI2wsEudmcV0ga8R2Gz7VNwY4mJ6WeLwHkAVHM3fyxE9ArINuefPx1Bk2StMC7ZfRZiGxmb3M7Hx4P7tMmDijrqUQwZucjpaC5mDLwZFe6puKGBP85Ygj9j0Mw7W31n2Om8J5NXwNtQP08UEnwPGRBtFMS+77SRu2/C0GsF6X58GyIOVfPtBI4bkyi4xq95nyr4mj6J+nTEpiZezl7xqAESv9Mcok986cW8TKWYEjyaMTCL1HZcYMeozUu1h56vHvyUSSV8zJVrfpvdLr5woyIhYbdLYEbnUJkd1bguPDrx4NmqVlRI3uSYvR2e3uusk2EXUf8ODsOARTVxexq6Ujbwna4aaoC4gp+XyYQ+qflRO/oB21u+qZyqvukJmp1wEgfMRr/btesui80RAldSi1vzz1g==
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 60909be5-3350-4b0b-7da4-08dba7af95b5
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6423.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Aug 2023 10:14:38.1163
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7WoFEIUpm/kjhER0uHAdBLzTfzJqoZ9u+jKaS1NOnOiouBKm50g9/ugnzUg8Z7eFHtLfFMloOqQzCeZGwyYk0w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR03MB5127

The return value of bogus_8259A_irq() is wrong: the function will
return `true` when the IRQ is real and `false` when it's a spurious
IRQ.  This causes the "No irq handler for vector ..." message in
do_IRQ() to be printed for spurious i8259 interrupts which is not
intended (and not helpful).

Fix by inverting the return value of bogus_8259A_irq().

Fixes: 132906348a14 ('x86/i8259: Handle bogus spurious interrupts more quietly')
Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
 xen/arch/x86/i8259.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/xen/arch/x86/i8259.c b/xen/arch/x86/i8259.c
index 6b35be10f09a..ed9f55abe51e 100644
--- a/xen/arch/x86/i8259.c
+++ b/xen/arch/x86/i8259.c
@@ -37,7 +37,7 @@ static bool _mask_and_ack_8259A_irq(unsigned int irq);
 
 bool bogus_8259A_irq(unsigned int irq)
 {
-    return _mask_and_ack_8259A_irq(irq);
+    return !_mask_and_ack_8259A_irq(irq);
 }
 
 static void cf_check mask_and_ack_8259A_irq(struct irq_desc *desc)
-- 
2.41.0


