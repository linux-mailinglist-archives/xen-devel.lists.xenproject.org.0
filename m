Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B26754B8DC6
	for <lists+xen-devel@lfdr.de>; Wed, 16 Feb 2022 17:22:41 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.274291.469719 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nKN48-0004UO-5o; Wed, 16 Feb 2022 16:22:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 274291.469719; Wed, 16 Feb 2022 16:22:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nKN48-0004PY-0V; Wed, 16 Feb 2022 16:22:04 +0000
Received: by outflank-mailman (input) for mailman id 274291;
 Wed, 16 Feb 2022 16:22:02 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=oYE0=S7=citrix.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1nKN46-0004NT-Mm
 for xen-devel@lists.xenproject.org; Wed, 16 Feb 2022 16:22:02 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 916820ed-8f44-11ec-b215-9bbe72dcb22c;
 Wed, 16 Feb 2022 17:22:00 +0100 (CET)
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
X-Inumbo-ID: 916820ed-8f44-11ec-b215-9bbe72dcb22c
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1645028520;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:content-transfer-encoding:mime-version;
  bh=JHqA1stN/h7CkLREvasdTybcxRF2lyYLB/1/bAsoRGo=;
  b=CG7Jkn/Z9mEGgT+r8WvO3T1/+5pGNnJIxpIAwGyaDm22+Bgg/DO6orNx
   EXE8hOf8d/3fl1/dLmxpxagkZ7tGGPzMKeQ5FVV40wT8rbxxSrIhXC44y
   cpxFCOjOfaEK9TNGIxWCredYRAHL/pJ/k/W/Pv0AemO3nc65HPTv4vZoR
   0=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: LtBb+DVRLzoTfbdBNP60pqhrCZqUsiy1PUemff9wYnqeTFlBBaMXu3QXdvatExslLtS+GsIgdG
 NOtxvNCTcwZ9FW3sQojB733CYrZdJW9G73ELYnEXAyvyl0EMMw6wv1crZYefKfhSLP/q5aQ1r6
 UdEhVcdYVb0JYRV2R6PXviXnyYzpdx5F4htu3WVtAHpa9Q42aC3UG6GyHu6n57feLpK+def49P
 uuxsZ/GM/dsIC9MmXRKBJxRI92vobPkB34xQIaCW/1HDfEpv8I0IGSNsChcrYpwxkXd5WVonhd
 BW/NopGiUVJHZkEnovXU9WRi
X-SBRS: 5.1
X-MesageID: 64256048
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:KDx1Na6lPxdl9F6X0BcIwQxRtOTAchMFZxGqfqrLsTDasY5as4F+v
 mUbCjuEO6uCYjT2etx1Ptm0809QusfWm9ZkTANl/Hs8Hi5G8cbLO4+Ufxz6V8+wwmwvb67FA
 +E2MISowBUcFyeEzvuV3zyIQUBUjclkfJKlYAL/En03FV8MpBsJ00o5wbZj29Aw27BVPivW0
 T/Mi5yHULOa82Yc3lI8s8pvfzs24ZweEBtB1rAPTagjUG32zhH5P7pGTU2FFFPqQ5E8IwKPb
 72rIIdVXI/u10xF5tuNyt4Xe6CRK1LYFVDmZnF+A8BOjvXez8CbP2lS2Pc0MC9qZzu1c99Z+
 YwWqLqdEggQLqTItORCUyYEFQddFPgTkFPHCSDXXc27ykTHdz3nwul0DVFwNoodkgp1KTgQr
 7pCcmlLN03dwbLtqF64YrAEasALNs7kMZlZonh95TrYEewnUdbIRKCiCdpwgmtq254WQaa2i
 8wxdDdCTEvKbBB1F3Q3Gq8lwvuSiDryWmgNwL6SjfVuuDWCpOBr65DyNPLFd9rMQt9a9m6ar
 G/b+2XyAjkBKceSjzGC9xqEluLJ2C/2Ro8WPLm57eJxxk2ewHQJDx8bXkf9puO24nNSQPoGd
 RZSoHB36/Fvqgr7FbERQiFUvla150UBffcLHNQq4QWhyvXU3FqfIEstG2sphMMdiOc6Qjkj1
 1msltzvBCByvLD9dU9x5ot4vhvpZ3FLcDZqiTssCFJcvoK9+N1bYgfnE447eJNZmOEZDt0ZL
 9qiiCElz4segscQv0lQ1QCW2mn8znQlo+Nc2+k2Yo5Hxl4hDGJGT9bxgbQ+0RqmBNzEJrVml
 CJZ8/VyFMhUUfmweNWlGY3h5o2B6fefKyH7ilVyBZQn/DnF0yf9IdwBvWgkdRY4a5xsldrVj
 Kn74145CHh7ZiXCUEOKS9jpV5RCIVbISbwJqcw4nvIRO8MsJWdrDQllZFKK3nCFraTfufpXB
 HtvSu71VSxyIf0+lFKeHr5BuZd2lnFW7T6CHvjTkkX4uYdykVbIEN/pxnPVNbtnhE5FyS2Im
 +ti2zyikUUPCravPXOOrOb+7zkidBAGOHw/kOQOHsarKQt6AmAxTfjXxLIqYYt+mKpJ0OzP+
 xmAtoVwkjITXFXLdleHbG5NcrTqUcotpH43J3V0b12px2IiccCk66JGL8k7erwu9epCy/9oT
 qZaJ5XcU6oXEjmXqS4AaZTdrZB5cEj5jwy5ICf4MiM0eIRtRlKV94a8LBfv7iQHEgG+qdA6/
 ++7zgreTJdaH1ZiAc/aZeiB1VS0uXRByut+U1GReotYeVn28ZgsICv016dlL8YJIBTF5z2by
 wfJXktI+biT+9c4qYCbi7qFooGlF/pFMnBbR2SLv6yrMST6/3a4xdMSWui/Yj2ABnj//7+vZ
 LsJwqikYuEHhltDr6F1D61vkfAl/9LqqrJXklZkEXHMYwj5A79sOCDbj8xGt6kLzb5FowqmH
 EmI/4ACa7mOPcrkFn8XJRYkMbvfha1FxGGK4KRnOlj+6Q924KGDABdbMBS7gSBAKKd4bdE+y
 uA7tc9KswGyh3LG6DpdYvy4I4hUEkE9bg==
IronPort-HdrOrdr: A9a23:pvIjl6rfanF8uPK3pFo3lxwaV5oXeYIsimQD101hICG9Ffbo8/
 xG/c5rsCMc5wxhO03I9ergBEDiex3hHPxOkO4s1N6ZNWGN1VdARLsSi7cKqAeQeREWmNQ86U
 5ISdkGNDWuZmIQsS+B2maF+nwbsaG6GduT6dvj8w==
X-IronPort-AV: E=Sophos;i="5.88,374,1635220800"; 
   d="scan'208";a="64256048"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HhO8ffn98OsJYe7Vbfje5Sd2hy1/bzrzNRago4iq018a8Yhr1dxnOveI3KzMkJuoJ3QZkDb89a5hALzvvsoxYQ1/MEWTwrvSnoIaHXLuOw92l5sLfvBa3rWA6Lj/HwqMRcMsIz0az3Shs62p8ZmiH1I/ti+huF2PPwSi/kZ8QqiAfZVY0U5bkU2wRyCSj3C5aj7Syh81G8rxl+Wh6eCHbTaTY00+fkP8uYXEBKKjRsanwaCE2Z4O54wADuDVKy522Ru5tA/RBbZzkmEGf4JUnOZFj8bDUnjmPeI9yvrwJUNRMUz1183r7BWZZ5KwbF5ucPmgpAdC4PsqQGyCkg2SHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=J/c6eVyHYJXVUlazWNeV+ylcxSqZ5nGqV/mmllNoyMw=;
 b=av1yU3eMMX5oMtJjsffdN9h1A+PThG1Eh/A+mehnlrTgIZXeOHDOl3QW48/XQVCRr9juOYy6N6y8w3OlMeJNb1zXqNB0pDBSr5ln0zE0eitbYwGXX/qh4y48VARb476AAKhs35H/Wn8lv2AadaMSEKjqFdobJKcdd9qyWNzMgnmiSJWyzwZyZ6CYNlnChL+KHQNkZqOxjQlIeaktbWlztzH5KK2IDWG+0J4pg8ByxoB6E09/NtfSnsIprk5Io+w7/0u/a8KuYChTmIuleZM8DezPtS1aq0kLxoMU0svwJwbOt6oQe3nMTK2nLMRB2eYNRyvWDcZ5lhxZkV8DcuVRYQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=J/c6eVyHYJXVUlazWNeV+ylcxSqZ5nGqV/mmllNoyMw=;
 b=AMUoVtDGYiFfPg6nKjX5uFKnVUpIwfQA8RYaAA5I5drOQH+UPE8w+qP/ScjA1jN5HPIDoYml9JYjiEpaeSUFlpUz1qNOsQ1FJepfn4I0xCsuTUFzVP667ofcInK33ZVot0tPnzpMSYSt/1itwnseTU9JIkY2prQ3joAcBOx6tnQ=
From: Roger Pau Monne <roger.pau@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Roger Pau Monne <roger.pau@citrix.com>, Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>
Subject: [PATCH v2 2/3] x86/clang: add retpoline support
Date: Wed, 16 Feb 2022 17:21:41 +0100
Message-ID: <20220216162142.15384-3-roger.pau@citrix.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220216162142.15384-1-roger.pau@citrix.com>
References: <20220216162142.15384-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO2P265CA0220.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:b::16) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 00291384-75d3-4571-d4ba-08d9f1687419
X-MS-TrafficTypeDiagnostic: SN6PR03MB4143:EE_
X-Microsoft-Antispam-PRVS: <SN6PR03MB4143CDCF381A1DBD7F93195D8F359@SN6PR03MB4143.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5797;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: lNYh/dr0P2vrPoR+Bd9L+NCodfTQb5J5TTxMBo0Briyz28YMxEe1YkJONZjZkINFnghOqlw85EUlGr6LAirxHLS1Hra7Jsbq6Th7NGmRqNK4ZdRwewTuZQ4qpxV31CuoR2jKRtRpQIkGZttIgPXr1rwjDd3xASeFjW2jxnBOi/wjOnVejrQ+fWt9aCvFmuY1qFQ9l8nGee4J9gPFDI2w8JdGzABB/5bL01ElSYQkGnoP/LSMOIqUI7h7sE+E/H8iep/cxcv7pdCFOS5R8US2LdBaXz5xffoHLMpAHHAWHq/3OCTV6DnU36v1cRap/XYccSV2xrn3jvVXALqRyeh33FDzQFt7jFo7pBaTFHlHMGd3HdgXrEVdgezR0pPRj+JXQwqCn9zT+K23yWfOfgJqXeDItjqz5P94t5UcZACcFQUeFplB1gsaCQQu2bdEzJe8it77ymOLHQB917lxTRCKRJJUu9xh+b9Yk4bGVzlOjyVlKBG2qqFf6kqMeNoX43WPfA2fUzOAG835gqMuFRHzV4qBhAAe/E/ftNJ4NknEXI1b+Y7AWjL25wqHjll4IlLpkQ4OLEJp2MJNx5jq5cqH8jLZtdsspwUP9n8xQ1oYnCSIncB1+h8C+BeLeR/ia0MGlLvhU0xM+WQ0QdMpfXhukw==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(6916009)(508600001)(4326008)(86362001)(1076003)(186003)(6506007)(316002)(8676002)(6512007)(66476007)(36756003)(2906002)(54906003)(5660300002)(83380400001)(6486002)(66556008)(2616005)(66946007)(26005)(6666004)(8936002)(38100700002)(82960400001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?L1dwSllLNjQwSjUwdXJCNEJ1SUFFWnZ5ellSYWs5akY5RHhsOHRMd0NBaG16?=
 =?utf-8?B?OVN0Z3Q0Wlkyb2k1a1dFRlhCcnRJaEg4clhndnJ3U0FxTyt1UGtTQ1N1K25R?=
 =?utf-8?B?cm9wVzI3dUxIYWFHN1IwOWl4ejlWbVZKWDNFdkhsOEd5YlJJRXo0YjJWeEVV?=
 =?utf-8?B?U2VIRW1pd2pHVDRPWm5zTFd4L2NRVGQ3NUZpTmxHdmp2UElxNk1vMEtjYzVC?=
 =?utf-8?B?Ylg1T0dKcTRhNUFqMktzc3Jha0tJQ2JPbUhQRFNVdUtCWlpFMEJNQlY1d1ZN?=
 =?utf-8?B?WHJndmhsTWZZczFuMTd3c1pKZ2RZK2gyc1VTMDQzSnpRM3NaL29sUjY0QWpY?=
 =?utf-8?B?VDFNTWFYUUVWMzlKdGNhUitwV2tPVTVUUFZEMUttbTB3bjFsK0hTT002MmlT?=
 =?utf-8?B?elZwUldPM1FUWk16VXdqWkNDMWhCT1haa3IzMTJzazJSWmp5dEU1eUFDZ2Fy?=
 =?utf-8?B?RVNGa3JkSDZCa1lEenIxbkZxckV5cHRaRnZ0aGRWbngvRWNVaS9tUUhNWlZu?=
 =?utf-8?B?djFnRmVyYkgxY0tiZXFJUW5rRElYVWVUN0o5TnpFUVFWQkNZanpCVVg5TFNq?=
 =?utf-8?B?bUhZZUN6Tm0vN04zWXNaNzloVXdNQjQ3UTBtUVVKOVRmendDeW0zWTcyZCsw?=
 =?utf-8?B?R1duN2drMFBwQTFwS0g3U1lGTC80dytrVHZFVE5Rbi9VSGpvQWxvdWlmN2hh?=
 =?utf-8?B?N3NLMm5odTVQaFJpUkxGc2pNRlVBL0tUWTNZSjY4cDhlU1U2c1RITGhpbldj?=
 =?utf-8?B?V1kzWFZzUU5JSTg3ZUNGZi9wQm9jRDlYNlViamVjY1U4OTQrbks1eHVmbEFz?=
 =?utf-8?B?eDlTZC9OSXBlUmdLb0xCNFAwdjhEdll5T04wK0dZYkVyRnNDVXU2dktyRHc4?=
 =?utf-8?B?amN3TGhyV0g2OU9rL2VLZlFvc3pOM0NDaXJkVDRPRko1RXdoNk5QN2NLRC8v?=
 =?utf-8?B?b3k5UmFRWExvQ09EWEQyYzlFcFBFZEkxU1dQU0VOOGZlV285aDFDc2tRNUlX?=
 =?utf-8?B?M05FUmVIcjY4eUx3djRaOE01S25tanc0UnJoVG1hQkl5dlQyajQvQUdFcFhO?=
 =?utf-8?B?WWVLTlFOQ2RUR0srME9mT2tyRkZxdXpudHhaVnpFMzdCQTZQVWdDVlBwWERK?=
 =?utf-8?B?THRZOW51Q1dweVlYL3hiM05odmdRRmRNSndLdGd5OWdLcHBQYUx4bk12dk9U?=
 =?utf-8?B?YWJMS1NreHIwR05TcnJSQ2pmaWk2bU5GZUxNTjBRbmZ6aGVoYW5VbzBvNE5D?=
 =?utf-8?B?MXJSdjhrbXR4bFdwbG1xNjZWSWJRYXRIeTBkaXlaZXUwV3h2bjJYbElPYUZu?=
 =?utf-8?B?SkhEcTBGZTR6UWVvTUEyVUtTWGllbXBHc2RnRnVsWm5HNHBiR1QvdkZZT2lE?=
 =?utf-8?B?OE9taGh5V1dHT09aTXIrK0g4b0NmU21PYUo3WHF1eU53c2F4NVY2UXNFM2FV?=
 =?utf-8?B?MGl1eVpxdlEvRitWak9KVzZaYmgyRllCK0sxV1RxWlllR2VTc0piQVU3ZzdF?=
 =?utf-8?B?S1U5d3g2MTJKL3dMeUdWUm4xSzJ2bzh4dldXM2VUZHJTemhJY2Urd3VHSUFB?=
 =?utf-8?B?bVFkTWZtS3RuV0owTE5Pb0t1bWZKMHpNdWlCaDdTdWtxd1E4SEtMM29qQlVi?=
 =?utf-8?B?NlJWS0YyVHZCRThHem9aUW9xbnZnNkdkbmxhTVAxT0dJREhrdXUyNVhSR0Nw?=
 =?utf-8?B?ckZ4MVA3WmwxWmFGMWo4WDdEeHhWNDdRSW5YZEF2WERKSEFUV2tLQ1l3OW8w?=
 =?utf-8?B?YWtxZFYvNm9RTS9Cbzk1cWtObUhZa3BWZlBsZWJIOG9nOTN3RkZTelQvNlZx?=
 =?utf-8?B?dm1hWUpzb01idURreUNjRXo5TTZhM284R3lLVzVocHczekRheXpBQ09HeGwr?=
 =?utf-8?B?OXVQSURseWZvZjFJQ2todHo3bXFzWlA2RXVyV0JFdlRZNDBZSEowZVFlRFRk?=
 =?utf-8?B?TEl3TDJZQ2RZQWJjaW1MMGhNWjBEK1Y1MWcxZUF5RGdlVmh3ZElQblZubHZD?=
 =?utf-8?B?alRYR05oRVV3SjJ1TkxHbVR2ZWIyUmZnQ3pZZ0ptQW1HeW5SS0ZlSHhXSGFj?=
 =?utf-8?B?TThSQ3kvYXRWZlRGaGJOWmlqOFRTdjRWTzliUGk5SjFMVGlsM29kZGFtOExp?=
 =?utf-8?B?NllaM2Z3WU1oUmhRbDFXM0xHODZuN2FBZGRTVkgzOEpoN2JTcFJrTHNwYmEx?=
 =?utf-8?Q?roT3Psx1YWUlIYBt2PLk8yw=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 00291384-75d3-4571-d4ba-08d9f1687419
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Feb 2022 16:21:57.8878
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8hxIRmJ60n3eWgB12EXULdL9jqvJEI+yOE5c2uS1nESGqNK9fGGM1477MdlnZlsr2pWUYoPSEzyH2131NNKecg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR03MB4143
X-OriginatorOrg: citrix.com

Detect whether the compiler supports clang retpoline option and enable
by default if available, just like it's done for gcc.

Note clang already disables jump tables when retpoline is enabled, so
there's no need to also pass the fno-jump-tables parameter. Also clang
already passes the return address on a register always on amd64, so
there's no need for any equivalent mindirect-branch-register
parameter.

Reported-by: Andrew Cooper <andrew.cooper3@citrix.com>
Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
Reviewed-by: Jan Beulich <jbeulich@suse.com>
---
 xen/arch/x86/Kconfig | 5 ++++-
 xen/arch/x86/arch.mk | 3 +++
 2 files changed, 7 insertions(+), 1 deletion(-)

diff --git a/xen/arch/x86/Kconfig b/xen/arch/x86/Kconfig
index 219ef9791d..2fa456292b 100644
--- a/xen/arch/x86/Kconfig
+++ b/xen/arch/x86/Kconfig
@@ -35,9 +35,12 @@ config ARCH_DEFCONFIG
 config GCC_INDIRECT_THUNK
 	def_bool $(cc-option,-mindirect-branch-register)
 
+config CLANG_INDIRECT_THUNK
+	def_bool $(cc-option,-mretpoline-external-thunk)
+
 config INDIRECT_THUNK
 	def_bool y
-	depends on GCC_INDIRECT_THUNK
+	depends on GCC_INDIRECT_THUNK || CLANG_INDIRECT_THUNK
 
 config HAS_AS_CET_SS
 	# binutils >= 2.29 or LLVM >= 6
diff --git a/xen/arch/x86/arch.mk b/xen/arch/x86/arch.mk
index 2da4bdb1ed..f2aa2a515f 100644
--- a/xen/arch/x86/arch.mk
+++ b/xen/arch/x86/arch.mk
@@ -47,6 +47,9 @@ CFLAGS-$(CONFIG_GCC_INDIRECT_THUNK) += -mindirect-branch=thunk-extern
 CFLAGS-$(CONFIG_GCC_INDIRECT_THUNK) += -mindirect-branch-register
 CFLAGS-$(CONFIG_GCC_INDIRECT_THUNK) += -fno-jump-tables
 
+# Enable clang retpoline support if available.
+CFLAGS-$(CONFIG_CLANG_INDIRECT_THUNK) += -mretpoline-external-thunk
+
 # If supported by the compiler, reduce stack alignment to 8 bytes. But allow
 # this to be overridden elsewhere.
 $(call cc-option-add,CFLAGS_stack_boundary,CC,-mpreferred-stack-boundary=3)
-- 
2.34.1


