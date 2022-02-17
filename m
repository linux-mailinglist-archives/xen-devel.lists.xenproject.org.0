Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EE4F4B9AEF
	for <lists+xen-devel@lfdr.de>; Thu, 17 Feb 2022 09:30:14 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.274491.469961 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nKcA1-00056y-Ks; Thu, 17 Feb 2022 08:29:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 274491.469961; Thu, 17 Feb 2022 08:29:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nKcA1-00054c-HB; Thu, 17 Feb 2022 08:29:09 +0000
Received: by outflank-mailman (input) for mailman id 274491;
 Thu, 17 Feb 2022 08:29:08 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=A/h9=TA=citrix.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1nKcA0-00054U-Gt
 for xen-devel@lists.xenproject.org; Thu, 17 Feb 2022 08:29:08 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id aaae141d-8fcb-11ec-8eb8-a37418f5ba1a;
 Thu, 17 Feb 2022 09:29:06 +0100 (CET)
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
X-Inumbo-ID: aaae141d-8fcb-11ec-8eb8-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1645086546;
  h=from:to:cc:subject:date:message-id:
   content-transfer-encoding:mime-version;
  bh=3wEtOBKwmOfozVUjF0JPZjCv/ozkDpH90hBgaJa3VwA=;
  b=QFg0Syd+mM0Sdi7bqnlO4uu4tIg/YAmtFC2uzLZNhThQLmWhbamrnln6
   1j5A51RsC/OdRFw4rwU09+YLU9cKMf8suJVCDWaM3DvvbpkU/dWtoFCPL
   9ZB+YvIRJAKXH9+xSynI3jC1dYLF3LFVoQwTME5UYA/jPnH0N5hsfPJQl
   4=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: kRvO8hK4rZi+6g7zv2Ldz3cL3nG+xIo1TFjFtknMf0leHAYxDsfZmGMkDgDIGHq+nnZuLOTeon
 bF/BOM2n8P8rOzT3ofKM06VjfS1zFypqivd3m/YyE+iVpFmNCBkfeyWuHdZNCtg0ZCgKbLysxZ
 VilB78YNE/GLm8SakR5mopxZ/Ktyd+87AQLLYtqyFvhk7GMUCrJy22fEBOLBQogXzk8GY8snTw
 L3i9dEfVk3+PhG9qbbRLCbL1EM9lSzsrtGJUJ5wF/ymYQi/FupnPuG9WKifP7OMtYSH/dPkiia
 2/Hs7KsiuT/f+qhwwu00PsE1
X-SBRS: 5.1
X-MesageID: 66651923
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:+SZlmK7UyO9zYa5Uk6TtNQxRtLzAchMFZxGqfqrLsTDasY5as4F+v
 mJMCDqDOarYZ2qgKtFzaNi/8xkBupCEz4M2Gwo4+Cg3Hi5G8cbLO4+Ufxz6V8+wwmwvb67FA
 +E2MISowBUcFyeEzvuV3zyIQUBUjclkfJKlYAL/En03FV8MpBsJ00o5wbZj29Ew2LBVPivW0
 T/Mi5yHULOa82Yc3lI8s8pvfzs24ZweEBtB1rAPTagjUG32zhH5P7pGTU2FFFPqQ5E8IwKPb
 72rIIdVXI/u10xF5tuNyt4Xe6CRK1LYFVDmZnF+A8BOjvXez8CbP2lS2Pc0MC9qZzu1c99Zx
 fEc5KDtVjYQHIL0hfkaUjhXNRhHIvgTkFPHCSDXXc27ykTHdz3nwul0DVFwNoodkgp1KTgQr
 7pCcmlLN03dwbLtqF64YrAEasALNs7kMZlZonh95TrYEewnUdbIRKCiCdpwgmlu25kfR622i
 8wxeDhyYkjSXj9zJWwFKpMkgfWjp1/iWmgNwL6SjfVuuDWCpOBr65D2K8bccNGOQcRTn26bq
 3jA8mC/BQsVXPSAzRKV/3TqgfXA9Qv5RYYTGbuQ5vNsxlqJyQQ7GBAQEFe2v/S9okq/QM5Eb
 VwZ/DI0qqo//1DtScPyNzW6qnOZuh8XW/JLDvY3rgqKz8LpDx2xXzZeCGQbMZp/6ZFwFWdCO
 kK1c83BCBg+4YHIVkOk1JissC61OAkaC1Y7enpRJeca2OXLrIY2hxPJa99sFq+pk9H4cQ3NL
 yC2QDsW3OtK05NSv0mv1RWe2m/3+MCVJuIgzliPBgqYAhVFiJlJjmBCwXzS9r5+IYmQVTFtV
 1BUypHFvIji4Xxg/RFhodnh/pn1tp5p0xWG2DaD+qXNERz3pBZPmqgKvVlDyL9BaJpsRNMQS
 Ba7VfltzJFSJmC2SqR8fpi8Dc8npYC5S4i4DquLMIYTOccsHONiwM2ITRTPt4wKuBJx+ZzTx
 L/BKZr8ZZrkIf8PIMWKqxc1juZwm3FWKZL7TpHn1RW3uYdyl1bOIYrpxGCmN7hjhIvd+V292
 48Ga6OilkUOOMWjM3K/2dNCcjg3wY0TWMmeRzp/LbXYfGKL2QgJVpfs/F/WU9c0xfsLyLaTr
 yrVt40x4AOXuEAr4D6iMxhLQLjuQYx+vTQ8OyktNkyvwH8tfcCk66J3Snf9VeBPGDVLwaEmQ
 v8bVd+HB/gTGD3L9y5ENcv2rZB4dQTtjgWLZnL3bD86dp9mZgrI5t67IVe/qHhQVnK65Zkkv
 rmt9gLHWp5fFQ5sO9nbNaC0xFSrsHlDxO8rBxnUIsNecVnH+ZRxL3Cjlec+JswBcE2RxjaT2
 wuMLw0foO3B/908/NXT3PjWpIa1CepuWEFdGjCDv7qxMCDb+EulwJNBD7nULWyMCjus9fz7N
 +tPzvz6PPkWp3pwstJxQ+Rx0KYzx9rzvLsGnA5qK2rGMgawAbR6L3jYgcQW7v9RxqVUsBedU
 16U/oUIIq2APc7oHQJDJAchaejfh/gYliOLsKYwKUT+oiR24KCGQQNZOBzV0H5RK758MYUEx
 +Y9uZFJt1zj20RyatvW3DpJ82msL2AbV/R1v54XN4bnlw43xwwQepfbECL3vMmCZtgk3pPG+
 dNIaH4uX4hh+3c=
IronPort-HdrOrdr: A9a23:hhT56a4sg3T3K7Ux0wPXwAHXdLJyesId70hD6qkoc20vTiSZ//
 re/8jzpiWE8gr5OUtQ6OxoV5PwJk80maQV3WBVB8bbYODqggCVxeJZnPvfKl/bakvDH4dmvM
 8NHMZD4Z/LfCFHZK3BkWuF+qMbsb26GdeT9ILjJhlWLT2CbZsL0+6aMGum+wZNNXR77NICZe
 ahDtwunUveRZ04VLXEOkU4
X-IronPort-AV: E=Sophos;i="5.88,375,1635220800"; 
   d="scan'208";a="66651923"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hg46y3+IoV2Fk8yNMRHFuCL9m5Iy8oMnVmgD6yPsS5ZVMScHyMFhqSmuAbjB5wV96z4T8Cnfmme8JCxEXowYoBGJxg62dd9/PwNzk4RtBwcXzDQM/d8F3p0b6X7jgSUR5neGcDAMCrSgsn+YVmBJ043hnFtFw9yzlW7u0YCCkiypYYcri1kj+Kw/AVVTTotYK93H8drCNslebH9hemFNUQpxsDahdxFY0IRc5pj4KnhSZneeSBn5l09s1OdxeOIZY5lHh8QUJrZnGzChVdGF8S3QTGVfc77H/S5KGE3+3or2G96EHMzmBro8ChZZZUm7eDJoPeOdvFtz+tTEmL/OAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6YwBQuVDpFFptRjvFrPgL/9F6Jj/+r12HgrhapdGMXU=;
 b=e7MMxR0ubb6Dplrdi4XMCKIWSt0MljvBykuWEM12y5MkC4QY6Z33vpQYuNAEQsi1/YProvJ8oNY46QgcEWyU/0zHE7zARJFIhQiuWMBlGJWUpHGiJ0eOuON1yvJfOxc+io2UBrgVYCIFdtwddltP28vDdpovbOYmDIMcPR0OY79Pee3j5f5ng+Tqc3Eumo/IOUh1tj0kgf5IHIAx8ADxKGOfeIjHI8PihAmlo4WS3eKlNqlSMFeQHetiqlAXMgYNeiuarhcOPLunpQUGRcr4ZJVM0auhnvUAeFAueiRrNkILo7QrImzKpowe2UfxxaJQdbvcZpjwlJARMWED7WnShQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6YwBQuVDpFFptRjvFrPgL/9F6Jj/+r12HgrhapdGMXU=;
 b=T+9zZZmSEsG6libs9M0xGuH3k+XRPrpTawCcuy6620d7pIStUSAMa2Uig3rS0YTPbi/qfSyxIztEzOstcrD//vARgDGDOuoabFGjc+PsMoboBa/V4t1eE0Umtc57orlwrwe4EW1eNdPlhTZR1wDMSkENaJ5hm9ctjoRjjdOAkQs=
From: Roger Pau Monne <roger.pau@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Roger Pau Monne <roger.pau@citrix.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, Jan
 Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
Subject: [PATCH] x86/console: process softirqs between warning prints
Date: Thu, 17 Feb 2022 09:28:50 +0100
Message-ID: <20220217082850.19407-1-roger.pau@citrix.com>
X-Mailer: git-send-email 2.34.1
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PR3P191CA0029.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:102:54::34) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 05242b17-9990-439b-e1f9-08d9f1ef8b5d
X-MS-TrafficTypeDiagnostic: MN2PR03MB4768:EE_
X-Microsoft-Antispam-PRVS: <MN2PR03MB4768C803F21D459E43D372498F369@MN2PR03MB4768.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:107;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ++tTkbKeDYe3jBhw0WUrRQ+u3L6gPYJ/QJXQjfE1bPJOwXBi+T2q0JM8PAExKVaCtRJy79r1089QGTqtUFAR38Riv5/hf24Ns5zJXdBb1ofmMHcd3BY45oBlHdBaqRMMTLIaAaBzbxg9i56VVZxNNxxvMGMMoyvp7yTWL/GRIZCAiRqqo7mCMbd4uXm5afSKvPED/ogW35JPG46aEP5pFCtbyOQ7p169qGj1o7crhNS8MCoMDL6986tvaK4Axk5JSKeM2UtsItLAgBbpjBKrdpdXCToNmLKQUZjtasaxtc5ZGYAzhkJRYZX8bb2jhykdlGtNYKNpDn0IgwpCYeyoi7fZTaChGjdIsQYwHEux/E+Q/thYpnrlzrvpH3/ZTsjuTpbO9R++hMqfHOgpZSoqm9+p8vsx5UXDP/yDNqb1ji48EaZCpCmmMeqAf4cMcaTOIUyoH93RAIkcDC07l45GzRtiJR0NDGVsXlZSYzCo0OQ6zsf91lSGrupOaCcbqmlp7luLGckgUftzopgzz0vEGpkvmAsyxfDZbDHpxov8ubi9FwpXiv475IdYpPTf5Hdin9cGm4lg1eMha5RPo0ayR622X0aE3z74CsRy/xvqh3Iwj5Ucjn77aCUQrdLN5jHTMKNF7KfIQ5F0swVeMnxTqg==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(6512007)(8676002)(4326008)(508600001)(6486002)(38100700002)(6506007)(66476007)(86362001)(66946007)(82960400001)(6666004)(66556008)(316002)(54906003)(6916009)(1076003)(2906002)(186003)(36756003)(26005)(8936002)(5660300002)(2616005)(83380400001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZFhqZjJqMTJoYW52eW9Mb3VWQWhLcVgrYWZaK1VkeG1GZFZpbDlYTDRlNHds?=
 =?utf-8?B?TEwxWWdCUUJ4cFdJUzBlS2VlUEFHdnVRd25TWm04aVpDdWpySjhRTFEybks3?=
 =?utf-8?B?TXNUdlhnQ2thVFZ6cGEwaDhmWDU3R28yT1lSenphb0ZNYy9LTktqR0srdnY3?=
 =?utf-8?B?VmVnK1pGa3FsbTVjOERjVEl0ZDNSMVhLcjRCNVJOZUExWk5TKzMzTXVjdnpv?=
 =?utf-8?B?R2RQc3cvc1Q4RThlVStoaWhPS1pmL0pZK3BLWXZSSDVFSkVFTkNBZ25ESkRw?=
 =?utf-8?B?Qy9COE5WODZtdE0rR21UcmxoQUs2TGFKRUZEMEVpdlBDd2h5d3cxZjVpeVZ1?=
 =?utf-8?B?QzJtM3hUOGVEejBhdUtiWmNpdWhhTk1GR3NMajlPVVcyV0FINXhtRjZqb3Jm?=
 =?utf-8?B?NXFqYmZ5OEVZelVLY3UvRlRaN0lLYzBCWVI1Y3BsQk8xdVJ6NjBhcVo0L0hF?=
 =?utf-8?B?b0JyRzZIdC9zYm9Ndm5QUWFSdXY3c0JGdkFtREhHVlI3UW1KbWl1U0UxR2Nu?=
 =?utf-8?B?dTBkbUhHd3JBeWNPNW56RGhMaG5ZQ1REK05NcUcrNEQrTWwybUJJbFp1cmRw?=
 =?utf-8?B?cVRKUHpFMzBGVWh2REJBd3VYTGYrUVV1T0h6R2xYejduRlI4cGRSb29rU1BX?=
 =?utf-8?B?d2RQOGFJSDBYTkVIYmlSMm9QUGtoQldPN0lzTmJ5YkVrdjA3SFJhcGdCaEtD?=
 =?utf-8?B?V3ZhSkZkZGV6UkhXTU4xODhGdzYzZDgvRkpXeklYT2x5YXZ2di93SDdqaTVr?=
 =?utf-8?B?ankrZUVicmllSnVjRjhVYUJ5SjhxclBtdnpVamI5MEp3RlRlZmt3b3N3V0ZG?=
 =?utf-8?B?RXpzTGpGQ3NzNmRUNEFyMnhnbjVaTzVFbFNMbEV0c3QrcFh1QkRXKzFqMVlp?=
 =?utf-8?B?aWdGN0NxRkRvSmpNSEZ0bG8zUlBaWXNsT1k1Qm5hUlVtODlxdmM1b1k0ckJh?=
 =?utf-8?B?OEhvRitOcTRQK0tnTG5wRG9ZSXhpbkdlbHhtMUxod1Fob3RhcHpjNGJzTUd0?=
 =?utf-8?B?bjBEbGIzbERkTmtSVWJRZTUySElFRGRpY2lMTjcvUER1dHl4MWJBOVo3RTVj?=
 =?utf-8?B?cW5Ua2NjMlYrRzBhQ0E1REZxUFlaNGhwbXlkZXhMQTRMZkh3OStaY1Z6SXls?=
 =?utf-8?B?aVRvaU4xaER2aDhVL0hndUg1VjhjdXRHYjRBZ2FoVW1tVkxxallsM3BIMkUr?=
 =?utf-8?B?ZTM5d1ZURzB4Yi9yemVwNXJhc2NpaWM1M3dOU3o2STJpTjBITmUvZzJqQ0U3?=
 =?utf-8?B?N1Z3L01vU3B3QS9pN1BrN0t6S1BaWEI2WVpaRGZFWk1DclcxT085UEVWK1NG?=
 =?utf-8?B?TEZZdWZmOFE0djFqNklHMnY1UHM3Njk5ejMxZW96QlZYNG5pdzAvTk1WdXNJ?=
 =?utf-8?B?NnVyTURaald6d00xcmNuTUlkWm9weXduMUZsZ0RQTUFmYjJOQ1hJeno3VHda?=
 =?utf-8?B?MHcrYlgvWHhweHVnOExraUorRGNFdGJndjlvSkU3NnZEWFFFRG5laXRMQlFC?=
 =?utf-8?B?TnBoMFhnMm56cU5MUjkwOEZhN3VKcHZEb1dkbFdqRXB0R2k4bFBERStLQU0r?=
 =?utf-8?B?UUwzRVJBaGF6c1UxckdzbjdLT3ppUjNROGlvRW5OR2tyaWEzeG44dXlOajJn?=
 =?utf-8?B?QllMcENwMDllcGFQRUU3cE1oRFQ0c2hTbUwza29aZ3FUMHV0UUtQM3J2bTZ5?=
 =?utf-8?B?THNuS25pajZXaGV5LzV2WnhxNHRabEhCUllXQVo3ZExMRG1wWjRWdTlQUnd3?=
 =?utf-8?B?UHJ5SFliaFhhaGdqZjZvRENjSVZ2clhhbW9SYXNnZjRkYjRzUVRReFpGVW44?=
 =?utf-8?B?dUxpUEdQaUhYS2dVRFpwL3JNczdrU2VUNEplQll4Zk1obkw3OFlvSXFTaWt0?=
 =?utf-8?B?NFp0dHVhWWtRNzBVNXZ0SkNzQ3IyeFowb0VBa0MrbmRJSHdJRVg1M2ZpMFVs?=
 =?utf-8?B?cWtYRjkrVkdCdnBIYm9sYUNVeGxWcmhKdFBmVjZaaUxUWms1NTl1R0oraExm?=
 =?utf-8?B?eHdBQlg3T0NoN1A3OERic3Z6bStxaGkrVEVkZER4UERpdU4zeGZVdzVKN21G?=
 =?utf-8?B?K3JmbkFjV0pWcGFyR0ZYVS9Ubk4xcjNhaXpoeFNYSXVkY0IwUDB3enl0cnZl?=
 =?utf-8?B?UTRKT2ZnaGtCaS8vUGNBdVlLVDZOTnZyN2lDQ2Faa1JtbFd2MUk2SE1NZEhW?=
 =?utf-8?Q?cXNYNlvsGwp5cVGqY8iZD5A=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 05242b17-9990-439b-e1f9-08d9f1ef8b5d
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Feb 2022 08:28:59.0268
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5sUCZq4Vv1AzaWFUiCHNfmMRjaKgc7TeLNNqtkXfkAUTEgc1tyNQsMu9dcHcHMnpBc9ekJeybKPYHr7bey05nA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR03MB4768
X-OriginatorOrg: citrix.com

Process softirqs while printing end of boot warnings. Each warning can
be several lines long, and on slow consoles printing multiple ones
without processing softirqs can result in the watchdog triggering:

(XEN) [   22.277806] ***************************************************
(XEN) [   22.417802] WARNING: CONSOLE OUTPUT IS SYNCHRONOUS
(XEN) [   22.556029] This option is intended to aid debugging of Xen by ensuring
(XEN) [   22.696802] that all output is synchronously delivered on the serial line.
(XEN) [   22.838024] However it can introduce SIGNIFICANT latencies and affect
(XEN) [   22.978710] timekeeping. It is NOT recommended for production use!
(XEN) [   23.119066] ***************************************************
(XEN) [   23.258865] Booted on L1TF-vulnerable hardware with SMT/Hyperthreading
(XEN) [   23.399560] enabled.  Please assess your configuration and choose an
(XEN) [   23.539925] explicit 'smt=<bool>' setting.  See XSA-273.
(XEN) [   23.678860] ***************************************************
(XEN) [   23.818492] Booted on MLPDS/MFBDS-vulnerable hardware with SMT/Hyperthreading
(XEN) [   23.959811] enabled.  Mitigations will not be fully effective.  Please
(XEN) [   24.100396] choose an explicit smt=<bool> setting.  See XSA-297.
(XEN) [   24.240254] *************************************************(XEN) [   24.247302] Watchdog timer detects that CPU0 is stuck!
(XEN) [   24.386785] ----[ Xen-4.17-unstable  x86_64  debug=y  Tainted:   C    ]----
(XEN) [   24.527874] CPU:    0
(XEN) [   24.662422] RIP:    e008:[<ffff82d04025b84a>] drivers/char/ns16550.c#ns16550_tx_ready+0x3a/0x90

Fixes: ee3fd57acd ('xen: add warning infrastructure')
Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
 xen/common/warning.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/xen/common/warning.c b/xen/common/warning.c
index 0269c6715c..e6e1404baf 100644
--- a/xen/common/warning.c
+++ b/xen/common/warning.c
@@ -30,6 +30,7 @@ void __init warning_print(void)
     {
         printk("%s", warnings[i]);
         printk("***************************************************\n");
+        process_pending_softirqs();
     }
 
     for ( i = 0; i < 3; i++ )
-- 
2.34.1


