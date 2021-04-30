Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F2D3236FE1B
	for <lists+xen-devel@lfdr.de>; Fri, 30 Apr 2021 17:54:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.120621.228156 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lcVTD-00017F-PA; Fri, 30 Apr 2021 15:54:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 120621.228156; Fri, 30 Apr 2021 15:54:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lcVTD-00016a-IN; Fri, 30 Apr 2021 15:54:23 +0000
Received: by outflank-mailman (input) for mailman id 120621;
 Fri, 30 Apr 2021 15:54:22 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jCGG=J3=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1lcVTC-0000lG-K5
 for xen-devel@lists.xenproject.org; Fri, 30 Apr 2021 15:54:22 +0000
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 1068a7e3-4ec3-4342-bda4-5b4644f72d2b;
 Fri, 30 Apr 2021 15:54:18 +0000 (UTC)
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
X-Inumbo-ID: 1068a7e3-4ec3-4342-bda4-5b4644f72d2b
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1619798058;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:content-transfer-encoding:mime-version;
  bh=yCoyPCVGCFESZfxZk+zm8lKADgKfPH1an+DD+K5jasU=;
  b=Sa36rw0cD1LSYyV4X6Abdt373uNDniFNsBXcBmkBAr+8xA+slxsUlZg3
   mqGgHPf8zgZLCRzprPs3nQuu3PnEu/b8r4OwUrw0i+EkdzBL/NaP0jNoX
   ZfG4dHL9RkpxLo2/naNliNS0NdwAal/r+dkFe6pW1mPju6IsFOyJfBLue
   A=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: H0k3LhR/vJx7/Lnl4HN4xlu6fAWOYGa8wdMDQ3zlbYoQALrKsctKSvEl/6uL4WRfs/nx3DqSte
 Qfoi/CTCPDGvbUJpV+B10xrEuqxnXQi0otSqrvt98ucr54b2jX8SFn9p31fGEckYEbKJYS52hS
 EC9zzYNmGP3/vHsbsiGDGY6iHY1WsvlHPcUtlI0mMwWqJI8heJ+PSuaQXION31LxXlUpSpFgBq
 ldsRGtQc+rcOflbMeWYS48ivwZ281YliPGC4Mwmg8ViXkQRummvQ3XgCfT2M9NfYcfolv0iijo
 g8k=
X-SBRS: 5.1
X-MesageID: 43199272
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:e9XNhKi8I2ic2ZpxYRQOxFmxJ3BQX0hw3DAbvn1ZSRFFG/Gwv/
 uF2NwGyB75jysQUnk8mdaGfJKNW2/Y6IQd2+QsFJ+Ydk3DtHGzJI9vqbHjzTrpBjHk+odmv5
 tIW5NVTOf9BV0St63HySGzGdo43Z2j+Kenme/Rwx5WPHhXQotn6Bp0DRveN0VwShVPC5ZRLu
 vl2uNsoT28dXMLKvmqH3VtZZmJm/TnnI/rCCR2YiIPxxKJiVqThoLSMx/d5RsGViMK/LFKyx
 miryXcxoGO98620QXd0Wi71eUdpPLExsFYDMKBzug5Qw+c7jqAX4hqV72csD1dmojGhDkXue
 LBrBs6M8N452m5RBDTnTLWxwLi3DwygkWD9XakgGDuqcG8ZDU2B9spv/M6TjLl6lEttNw57a
 RT32jxjes1MTr8mk3GhuTgZlVPrA6ZsHAimekcgzh0So0FcoJcqoQZ4Qd8DIoANDiS0vFqLM
 BeSOXnoNpGe1KTaH7U+kN1xsa3Y3g1FhCaBmAfp82u1SRMlnwR9TpW+OUv2lM7sL4tQZhN4O
 rJdo5ykqtVc8MQZaVhQMAMXNWwEW6IZR7XKmqdLRDGGcg8Sjzwgq+yxI9wyPCheZQOwpd3so
 /GSklkuWk7fF+rBtaJ2JFN7xDRUGSwVTng0ahllthEk4y5YICuHTyISVgoncflie4YGNfnV/
 G6P48TA/KLFxqsJa95mynFH7VCI3gXV8MY/vwhXUiVn87NIor28ujScPPZIqvxAS8pM1mPQE
 crbXzWHoFt/0qrUnj3jFz6QHX2YHHy+pp2Dezd5OgcyI8EM4VWqQgLgVGl5sWGQAcy85AeTQ
 9bGvfKg6m7rW658SLj9GNyICdQCU5T/fH9SX9QvBQLNEn1aL4HvN2adQlprT66Dy46a/mTPB
 9Uplxx967yEoeZwjo6Dcm7dkiAiWEImX6MR5AAu6GK6Mv/YKkkBpI+VKEZL3SOKzVF3SJR7E
 ZKckstW1LWHDKGs9TfsLUkQMXkM+RarCjuC8hOsn7bvVibvqgUNwEmdg/rd9WWjwYoTydTnX
 tr/cYk8fe9sD6yNGoyh/k5OlVQaGKRRKlLFhiBeZ88oMGXRChgCWiNnjCUkBc1Zy7j8FgTnH
 XoKWmOdejMGUc1gAEQ7o/6tFd1fH6aZUR+dzRztpB8D33Pvh9IoJi2T7v212uacV0ZxO4BdD
 nDfDsJOwtrg9S6zgScljrHFXIowPwVT5rgJaVmd7HYwXW2LoKU0akAAv9P5Z5gcMn0rfVja5
 PtRyaFaDfjT+850Q2coXgofCFytXk/iPvtnBno9nKx0nIzCefbSW4WD40zMpWZ9SzpVvyI2J
 J2gZYusey8Pn74Z9SGxavUBgQzXi/7sCqzVaUluJpUtaU9uP9vBJHdSyLPz2wC0xMkLsv4/X
 luMJhT8fTEIMtocMMTcS4CoQZsm9SLMUcxsgv5RuU5ZkoginfHP9WPp7rEwIBffHGptU/1Ix
 2Y9SYY4vLOGy2E3rQeA7grIWtXZFMngU4Sid+qZsnVEkGya+pH/FCmKXezf79WVbidFdwr32
 lHysDNm/XSajHx1w/RtyZqO65C826oRsWpHQKHcNQ4guCSKBCLmaul4Mm6kTfxR3+6ci0j9P
 F4XF1VaNhfgT8/i4By2jSuS8XM0zAYr2c=
X-IronPort-AV: E=Sophos;i="5.82,263,1613451600"; 
   d="scan'208";a="43199272"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ojt4ltiOBhCVhLDbT0cNZUsJFhC6jPvTAD6k8OEsueM3tfJmo3mzS9Ayn2zhs78lfqZLORL+ZQ1KowmA9rAeD4B37l3lkXxHTESArur9jMup0S1h3dwuzJM3K97ygC8O4TnlQxuORl3WPpeAwEekyf2zB47nIxB+OePOp05rmQGX6sJzy0OHGqudt3vrwGgF1iIb/sC/kIJjIx/qgKvapKXRBkyr3T9izSfx+zm4OAk2KLYEh846nvhnLUrjSQTmsIzC2KrZaQu6v0LpikB9P7lDmganP1rQy2kmdYsXWDlIE9zc1vmZsdGkUX6IRsNLN/pN+/JNUWim53KKNKhimw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bSU9iAR9gJn2F5NIkLs9bGfJT3MYOFmgJtTRnRYEooQ=;
 b=oQj8IoWi5UigYuNu9u+X1w9pXAKIR9JEbRhGsN0hyEvs4sgTLgjNuytjxcCk2R8K6LOZJWqnZo4cb1o0RlhSwlaH5S/zIn9W5oszvIrEfTcL+k+v2SUnjD+2WHub03yQuKp/t/N9CYjesweYy4P/nyoJF2VKC0SLRLjm5MjOVp6WchZ4TXo6pVrTHrx2soLBX6gwspnwkHmpmUKWHGpS+qmDUUMcm1mJgG4a5p3kilD9+DPbVGs1JD1KTeZHEn6RJdmW3ypHBg1tUPkrRz4+CiM2By6rKtnb8fx7ZIm6/REEBWaN8rG2rmiu1UTvABdNtVB6MFFyTdiP7GyEntdFFw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bSU9iAR9gJn2F5NIkLs9bGfJT3MYOFmgJtTRnRYEooQ=;
 b=UB9wij/eUsGk5BbRFCHdvk8/qFa0Y1U3rX067cYOtRsGRavu5ixZbxXNM0YPMOAMBHzNNh9OomcQAW4zq6Y/2xdOcENpNM6m+qh3eWnbVYW46x4v7hZSOW0jYCtbz+Lk0/E2+1rprpUYP2CNDe2B+a3BNSGSyq6gBrWOP9P2Gro=
From: Roger Pau Monne <roger.pau@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Roger Pau Monne
	<roger.pau@citrix.com>, Ian Jackson <iwj@xenproject.org>, Wei Liu
	<wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>
Subject: [PATCH v3 07/13] libs/guest: obtain a compatible cpu policy from two input ones
Date: Fri, 30 Apr 2021 17:52:05 +0200
Message-ID: <20210430155211.3709-8-roger.pau@citrix.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210430155211.3709-1-roger.pau@citrix.com>
References: <20210430155211.3709-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MRXP264CA0007.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:500:15::19) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 74d06c06-1b48-457f-ad0d-08d90bf034a6
X-MS-TrafficTypeDiagnostic: DM6PR03MB4218:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM6PR03MB421802AE3363ED3D4A68E3768F5E9@DM6PR03MB4218.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 8Iwq4PLJdAehNBIAdgRq8Z1my3MLt6sw4qV21KwlrVDlCLHoYSKoS2/6ayN8BpVkjeKx7r95x6EllVdbIwu479Q/rxL3W6/U2F5MCU7A7Pt0Coe/5oN9k9YTyKh1iGTyfO/nS19hZ2j19a/wmp6CkbEMaNq+SEkq5DxOxJZ6ez4vj8MK2oB332GF6NMxO6LU6nHrYGuwOWkEFY3BfI7nFqAYKtJQcMR8ErgbyLDsGibpH7P5zuA5VNekzNCA+U77iCjXwdc7eC/YwKUu0YQubyYxBXNLNyQMFgD+KuYGnahOcNoXeRtYn8zi2OrnyoMnpxiVbAKcbT2vw3wIzTO+ec4Zpjg4JPTKI4s/3MsNPe/k0uKUgySXa2HnFSEHL0QB2atYqIJMS0uWLiCCVSnckIZbfavZlGmqxVB5ht8mnPY1R2zp+29tEotsNQYOI3nTF9pS0bPHqYGWOR078Uw1jsf2OdEoPTMONpZXAM5sYNwLdf9DRUGb2Pt2dR94NwDi00tg9/q4y97UclTV5KOhxgHPpOEiBZIgeB8s1644WlbCBspP9U63HNmyQAaI+8vDOlS25eBSCWmfW00z2HDyKoiu7WaIb8m4TqJuH3O4qUg=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(366004)(136003)(39860400002)(346002)(376002)(478600001)(54906003)(36756003)(316002)(186003)(26005)(66476007)(6666004)(6496006)(4326008)(83380400001)(1076003)(2616005)(66556008)(107886003)(2906002)(8936002)(66946007)(38100700002)(6916009)(6486002)(956004)(5660300002)(16526019)(8676002)(86362001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?UDBPaHdXQ3R5ZEp4N0xhRkJ4bmRBZE1lY0h6dXJpVkhnK0JNOVQyZ2VDbDI0?=
 =?utf-8?B?NVhyaXJPaURENjVJcjlibkRWSFdFNzZqRFRMNS84V05zSUl0VzJEU2FUQVZw?=
 =?utf-8?B?K1ArSTFXLzNjNS8yUnVlWkZzTTRWYzNXaGJmRC9WdGVQVisyVkZjQnhFYklC?=
 =?utf-8?B?SXkrUnNxMlRhQzgyZjVTenRkdjk3S2N1TmtrK3piQ3FLbWxpN0NLd3VuTkJD?=
 =?utf-8?B?NGNBUGtVZ0NoYVNNK09KWU4zRlVWV2lzRnViN28rU2toS2ZoTXFFQjVJT1BB?=
 =?utf-8?B?eC9OamY2V1N0QklWY05yNkdxVzdQazBZcHc3Z2NFamc4NGxNQVRQNk9BSlYz?=
 =?utf-8?B?aXNSdktxcGkzOTBYNi9IdUJEWGptTzZhQ0tWbEFEbE9rZE91K2dpSGdybW1z?=
 =?utf-8?B?QUx1eGtabHJEbm9jY1ZIUTRNeitmYW4zd0crbDRHdmVUbzRCeExPZHpMMm4w?=
 =?utf-8?B?THR6cEN2TitDTzJQdHJ4aTdUZHNCQTBPeGhFRTNpUzBHeVlURHFIeFdVc241?=
 =?utf-8?B?Nk44eGZEcHFYcTUyVnp4cFdjL05pbVBmK29KMi9OMGJTNlJ2SlpldEt1a3V3?=
 =?utf-8?B?ZEJRRElkVFFyWUZtaFR5NlJySzlvcDlvS3VRWElwRG5yRkQraTFHOHlPRnBS?=
 =?utf-8?B?cVB0MXhrL0hER2pKTVR5cXlvWUN0b2p3cWpPbUdUcVZheHA0Qm5OeEttajJS?=
 =?utf-8?B?ZWUzUjUwc1pTVXdkSjkvTWRRYzgySFd6ck1ZNlQ0cWhOSEtOL0ZsajlFYlRY?=
 =?utf-8?B?cHNtYUNHdXIrL0hyS3o0MEV2RFI4QzI3eXkzYUZSMkIvLzNzdXl6dzhGcUlG?=
 =?utf-8?B?WWQraEtiSWxGamZUTE9oQkpjeUE3bWk5MFhPQ2tqckFlTE1wajN0QzRyRlNM?=
 =?utf-8?B?aFQwck1aUUNKbU9zOTZMVytncGI4U0xJR3ZUVVBCYkdyWDMyN3dCU2VXVVV0?=
 =?utf-8?B?OW1QL2Y2dkpHeWtTSnkxN2w3Qk81Zm1LeGN6RTlhcjNRSGl5eTdUa0hUcHlW?=
 =?utf-8?B?bER4K3lMRWJ0MUdZUGs2WVVzWWlhYXB5ZDdKSmJqOFdTT3I5YjNvS084WUIv?=
 =?utf-8?B?MFNmMDM1OStVT09VZnVnSUg2djdGaDNVYkozSHJPR1JiT1drcWtoUVZjRFRC?=
 =?utf-8?B?S3UzWjJkcHBRN1JJSFl3eUxTcjFDbGVRSTA4QkN0a29FaCtOUTgxVWxrYTVN?=
 =?utf-8?B?eUQvZmhwV1BCYXpnckdTUlcxUWFDaG5DSXNRQWx4VVFhZmNOUlNHazBmUHFn?=
 =?utf-8?B?d04vZmhsZGhhWWdVM3FERUNEZ0x2VVJBcFEya1lmL05rMi9KYzdmeGpKTitI?=
 =?utf-8?B?c0FySU80RjhEVFRORU0rZDZPZlYxbVlDbk9iUmNCV0dNTWZXU1ltQWZ1Tlo2?=
 =?utf-8?B?dHBKZTI1amxGN2VrNEl0d3E0VEFSWGJzakJxcUMvU1QwYU94YnRvMGgvNnRs?=
 =?utf-8?B?d2NERmg4VXVRMlpWYi9nVE9MR3hoaGlxQzB0UHhaaHZUNVVXYnhJNU5RZFhU?=
 =?utf-8?B?Ym9GT3R6Q2RJZTNtKzQxRE1tSWNhd0huZ1pmakhYVi9TQ3JoUDdMK2puc1lW?=
 =?utf-8?B?NkphVCtZMDdrM3RMM0xVV0pnZTFwYW1VTThMRHhDSkx2K1pHSy95TEllUE84?=
 =?utf-8?B?NjF0ZVRxMkdPL1ExckpUaXpack1GZUJrTlJEMGtzakpCcm5QMHZUKzVKRVNp?=
 =?utf-8?B?VE9zS0xwcG1lVS9TR21UZnVvMjRJUjFuNG1xcy9kMnBUbE9yUzU5ZmlzTXZL?=
 =?utf-8?Q?3fgn3D2Fk1NxcKVqKcWYfOv6s/GGntsHcvrIkyM?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 74d06c06-1b48-457f-ad0d-08d90bf034a6
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Apr 2021 15:54:15.4205
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5mnHnpc5o5PaY7FJNs+9MVJ6I4Tmvrv0Wzq1DmrTNgDM1h8y4MKSQyrfI4KrwRzhlGloiCpzUtCp54leFtqZgQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB4218
X-OriginatorOrg: citrix.com

Introduce a helper to obtain a compatible cpu policy based on two
input cpu policies. Currently this is done by and'ing all CPUID
feature leaves and MSR entries, except for MSR_ARCH_CAPABILITIES which
has the RSBA bit or'ed.

The _AC macro is pulled from libxl_internal.h into xen-tools/libs.h
since it's required in order to use the msr-index.h header.

Note there's no need to place this helper in libx86, since the
calculation of a compatible policy shouldn't be done from the
hypervisor.

No callers of the interface introduced.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
Changes since v2:
 - Add some comments.
 - Remove stray double semicolon.
 - AND all 0x7 subleaves (except 0.EAX).
 - Explicitly handle MSR indexes in a switch statement.
 - Error out when an unhandled MSR is found.
 - Add handling of leaf 0x80000021.

Changes since v1:
 - Only AND the feature parts of cpuid.
 - Use a binary search to find the matching leaves and msr entries.
 - Remove default case from MSR level function.
---
 tools/include/xen-tools/libs.h    |   5 ++
 tools/include/xenctrl.h           |   4 +
 tools/libs/guest/xg_cpuid_x86.c   | 137 ++++++++++++++++++++++++++++++
 tools/libs/light/libxl_internal.h |   2 -
 4 files changed, 146 insertions(+), 2 deletions(-)

diff --git a/tools/include/xen-tools/libs.h b/tools/include/xen-tools/libs.h
index a16e0c38070..b9e89f9a711 100644
--- a/tools/include/xen-tools/libs.h
+++ b/tools/include/xen-tools/libs.h
@@ -63,4 +63,9 @@
 #define ROUNDUP(_x,_w) (((unsigned long)(_x)+(1UL<<(_w))-1) & ~((1UL<<(_w))-1))
 #endif
 
+#ifndef _AC
+#define __AC(X,Y)   (X##Y)
+#define _AC(X,Y)    __AC(X,Y)
+#endif
+
 #endif	/* __XEN_TOOLS_LIBS__ */
diff --git a/tools/include/xenctrl.h b/tools/include/xenctrl.h
index 5f699c09509..c41d794683c 100644
--- a/tools/include/xenctrl.h
+++ b/tools/include/xenctrl.h
@@ -2622,6 +2622,10 @@ int xc_cpu_policy_update_msrs(xc_interface *xch, xc_cpu_policy_t policy,
 /* Compatibility calculations. */
 bool xc_cpu_policy_is_compatible(xc_interface *xch, const xc_cpu_policy_t host,
                                  const xc_cpu_policy_t guest);
+int xc_cpu_policy_calc_compatible(xc_interface *xch,
+                                  const xc_cpu_policy_t p1,
+                                  const xc_cpu_policy_t p2,
+                                  xc_cpu_policy_t out);
 
 int xc_get_cpu_levelling_caps(xc_interface *xch, uint32_t *caps);
 int xc_get_cpu_featureset(xc_interface *xch, uint32_t index,
diff --git a/tools/libs/guest/xg_cpuid_x86.c b/tools/libs/guest/xg_cpuid_x86.c
index 6b8bae00334..be2056469aa 100644
--- a/tools/libs/guest/xg_cpuid_x86.c
+++ b/tools/libs/guest/xg_cpuid_x86.c
@@ -32,6 +32,7 @@ enum {
 #include <xen/arch-x86/cpufeatureset.h>
 };
 
+#include <xen/asm/msr-index.h>
 #include <xen/asm/x86-vendors.h>
 
 #include <xen/lib/x86/cpu-policy.h>
@@ -949,3 +950,139 @@ bool xc_cpu_policy_is_compatible(xc_interface *xch, const xc_cpu_policy_t host,
 
     return false;
 }
+
+static bool level_msr(const xen_msr_entry_t *e1, const xen_msr_entry_t *e2,
+                      xen_msr_entry_t *out)
+{
+    *out = (xen_msr_entry_t){ .idx = e1->idx };
+
+    switch ( e1->idx )
+    {
+    case MSR_INTEL_PLATFORM_INFO:
+        out->val = e1->val & e2->val;
+        return true;
+
+    case MSR_ARCH_CAPABILITIES:
+        out->val = e1->val & e2->val;
+        /*
+         * Set RSBA if present on any of the input values to notice the guest
+         * might run on vulnerable hardware at some point.
+         */
+        out->val |= (e1->val | e2->val) & ARCH_CAPS_RSBA;
+        return true;
+    }
+
+    return false;
+}
+
+/* Only level featuresets so far. */
+static bool level_leaf(const xen_cpuid_leaf_t *l1, const xen_cpuid_leaf_t *l2,
+                       xen_cpuid_leaf_t *out)
+{
+    *out = (xen_cpuid_leaf_t){
+        .leaf = l1->leaf,
+        .subleaf = l2->subleaf,
+    };
+
+    switch ( l1->leaf )
+    {
+    case 0x1:
+    case 0x80000001:
+        out->c = l1->c & l2->c;
+        out->d = l1->d & l2->d;
+        return true;
+
+    case 0xd:
+        if ( l1->subleaf != 1 )
+            break;
+        /*
+         * Only take Da1 into account, the rest of subleaves will be dropped
+         * and recalculated by recalculate_xstate.
+         */
+        out->a = l1->a & l2->a;
+        return true;
+
+    case 0x7:
+        if ( l1->subleaf )
+            /* subleaf 0 EAX contains the max subleaf count. */
+            out->a = l1->a & l2->a;
+        out->b = l1->b & l2->b;
+        out->c = l1->c & l2->c;
+        out->d = l1->d & l2->d;
+        return true;
+
+    case 0x80000007:
+        out->d = l1->d & l2->d;
+        return true;
+
+    case 0x80000008:
+        out->b = l1->b & l2->b;
+        return true;
+
+    case 0x80000021:
+        out->a = l1->a & l2->a;
+        return true;
+    }
+
+    return false;
+}
+
+int xc_cpu_policy_calc_compatible(xc_interface *xch,
+                                  const xc_cpu_policy_t p1,
+                                  const xc_cpu_policy_t p2,
+                                  xc_cpu_policy_t out)
+{
+    unsigned int nr_leaves, nr_msrs, i, index;
+    unsigned int p1_nr_leaves, p2_nr_leaves;
+    unsigned int p1_nr_entries, p2_nr_entries;
+    int rc;
+
+    p1_nr_leaves = p2_nr_leaves = ARRAY_SIZE(p1->leaves);
+    p1_nr_entries = p2_nr_entries = ARRAY_SIZE(p1->entries);
+
+    rc = xc_cpu_policy_serialise(xch, p1, p1->leaves, &p1_nr_leaves,
+                                 p1->entries, &p1_nr_entries);
+    if ( rc )
+        return rc;
+    rc = xc_cpu_policy_serialise(xch, p2, p2->leaves, &p2_nr_leaves,
+                                 p2->entries, &p2_nr_entries);
+    if ( rc )
+        return rc;
+
+    index = 0;
+    for ( i = 0; i < p1_nr_leaves; i++ )
+    {
+        xen_cpuid_leaf_t *l1 = &p1->leaves[i];
+        xen_cpuid_leaf_t *l2 = find_leaf(p2->leaves, p2_nr_leaves,
+                                         l1->leaf, l1->subleaf);
+
+        if ( l2 && level_leaf(l1, l2, &out->leaves[index]) )
+            index++;
+    }
+    nr_leaves = index;
+
+    index = 0;
+    for ( i = 0; i < p1_nr_entries; i++ )
+    {
+        xen_msr_entry_t *e1 = &p1->entries[i];
+        xen_msr_entry_t *e2 = find_entry(p2->entries, p2_nr_entries, e1->idx);
+
+        if ( !e2 )
+            continue;
+        if ( !level_msr(e1, e2, &out->entries[index++]) )
+        {
+            ERROR("Unable to level MSR index %#x", e1->idx);
+            return -EINVAL;
+        }
+    }
+    nr_msrs = index;
+
+    rc = deserialize_policy(xch, out, nr_leaves, nr_msrs);
+    if ( rc )
+    {
+        errno = -rc;
+        rc = -1;
+    }
+
+    return rc;
+}
diff --git a/tools/libs/light/libxl_internal.h b/tools/libs/light/libxl_internal.h
index 44a2f3c8fe3..5709bcb93fa 100644
--- a/tools/libs/light/libxl_internal.h
+++ b/tools/libs/light/libxl_internal.h
@@ -126,8 +126,6 @@
 #define PVSHIM_CMDLINE "pv-shim console=xen,pv"
 
 /* Size macros. */
-#define __AC(X,Y)   (X##Y)
-#define _AC(X,Y)    __AC(X,Y)
 #define MB(_mb)     (_AC(_mb, ULL) << 20)
 #define GB(_gb)     (_AC(_gb, ULL) << 30)
 
-- 
2.31.1


