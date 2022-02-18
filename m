Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A8474BBABC
	for <lists+xen-devel@lfdr.de>; Fri, 18 Feb 2022 15:35:15 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.275512.471450 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nL4LS-000153-L3; Fri, 18 Feb 2022 14:34:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 275512.471450; Fri, 18 Feb 2022 14:34:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nL4LS-00011J-Gv; Fri, 18 Feb 2022 14:34:50 +0000
Received: by outflank-mailman (input) for mailman id 275512;
 Fri, 18 Feb 2022 14:34:48 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=YtLv=TB=citrix.com=prvs=0411da6ea=roger.pau@srs-se1.protection.inumbo.net>)
 id 1nL4LQ-0008Sp-Ey
 for xen-devel@lists.xenproject.org; Fri, 18 Feb 2022 14:34:48 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id eb23284e-90c7-11ec-8723-dd0c611c5f35;
 Fri, 18 Feb 2022 15:34:47 +0100 (CET)
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
X-Inumbo-ID: eb23284e-90c7-11ec-8723-dd0c611c5f35
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1645194887;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:content-transfer-encoding:mime-version;
  bh=NkHFymHkeKgIK++83ZytrpXL1OQuo5Mz+mG7P3n6lX8=;
  b=eYr40jb/Q4yoOV2Aiqy7dZ+RgYsjMOt+5L6kFyJFuKN7FWgMv1q0bHkS
   yBNY1LrQYpsYiMWod/LOclTA5IYH9ch/67hggz4pG9lA7pyS11A/q18UY
   hJqGUO85ti+kvVEh3CMsZrqEogGuSHhMikiRvVxtwRgAt0OOkgI47zd9c
   I=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
X-SBRS: 5.1
X-MesageID: 66766320
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:2ooFoKlhSxozIqs+EIFfKXno5gy+JkRdPkR7XQ2eYbSJt1+Wr1Gzt
 xJKWj/VPfeDZmHwcoh0Ot7i/E4AsMfUn95mTQdkrng2HiMWpZLJC+rCIxarNUt+DCFioGGLT
 Sk6QoOdRCzhZiaE/n9BCpC48T8kk/vgqoPUUIYoAAgoLeNfYHpn2UILd9IR2NYy24DjWlPV4
 7senuWEULOb828sWo4rw/rrRCNH5JwebxtB4zTSzdgS1LPvvyF94KA3fMldHFOhKmVgJcaoR
 v6r8V2M1jixEyHBqD+Suu2TnkUiGtY+NOUV45Zcc/DKbhNq/kTe3kunXRa1hIg+ZzihxrhMJ
 NtxWZOYcl4HYYLntL4ndUdCPyslPqx85r/7GC3q2SCT5xWun3rExvxvCAc9PJEC+/YxCmZLn
 RAaAGlTNFbZ3bvwme/lDLk37iggBJCD0Ic3oHZvwCufFf87aZvCX7/L9ZlT2zJYasVmQ6iBO
 ZRCM2IHgBLoXC1RAhQFI9UEntiv2VT1SA1KkQu2qv9ii4TU5FMoi+W8WDbPQfSIWMFUk0Cwt
 m/AuWPjDXkyL8eDwDCI9natgO7nni7hXo8WUrqi+ZZCn1m71mEVThoMWjOTsfS/z0KzRd9bA
 0gV4TY167g/8lSxSdvwVAH+p2SL1jYeUddNF+wx6CmW17HZpQ2eAwA5oiVpMYJ88pVsHHpzi
 wHPz4iB6SFTXKO9ciuzqZi/gWmIH3YPAWVZZi4+Uws52oy2yG0stS7nQtFmGa+zq9T6HzDs3
 jyHxBQDa6UvYd0jjPviow2e6964jt2QF1NuuF2LNo6wxl4hPOaYi5qUBU83BBqqBKKQVRG/s
 XcNgKByB8heXMjWxERhrAjgdYxFBspp0hWA0DaD/LF7rlxBHkJPm6gJsVmSw28zb645lcfBO
 hO7hO+ozMY70IGWRaF2eZmtLM8h0LLtE9/oPtiNMIYTO8ItLF7bong0DaJ144wLuBF9+U3YE
 c3GGftA8F5AUfg3pNZIb7x1PUAXKtAWmjqIGMGTI+WP2ruCfn+FIYrpw3PVBt3VGJis+V2Pm
 /4GbpPi40wGDIXWP3mGmaZOfAtiBSVqWvjLRzl/K7frzvxOQzp6VZc8ANoJJuRYokiivr2Wp
 irkAhcAkjISRxTvcG23V5yqU5u2Nb5XpnMnJy08e1Gu3nkoe4G066kDMZAweNEaGCZLl5aYk
 9Ftlx28P8ly
IronPort-HdrOrdr: A9a23:/8CnO6M7cd3fvcBcT1v155DYdb4zR+YMi2TDiHoedfUFSKOlfp
 6V8MjztSWVtN4QMEtQ/uxoX5PwPk80lKQFnbX5WI3CYOCIghrQEGgP1/qG/9SkIVyFygc/79
 YRT0EdMqyJMbESt6+Ti2PUYrVQouVvsprY+Ns2p00dPD2CAJsQiTuRZDzrdnGfE2J9dOQE/d
 enl4B6jgvlXU5SQtWwB3EDUeSGj9rXlKj+aRpDIxI88gGBgR6h9ba/SnGjr1sjegIK5Y1n3X
 nOkgT/6Knmm/anyiXE32uWy5hNgtPuxvZKGcTJoMkILTfHjBquee1aKvC/lQFwhNvqxEchkd
 HKrRtlF8Nv60nJdmXwmhfp0xmI6kdm11bSjXujxVfzq83wQzw3T+Bbg5hCTxff4008+Plhza
 NixQuixttqJCKFuB64y8nDVhlsmEbxi2Eli/Qvg3tWVpZbQKNNrLYY4FheHP47bWzHAbgcYa
 pT5fznlbRrmQvwVQGdgoAv+q3iYp0LJGbHfqBY0fbllwS/nxhCvj0lLYIk7zA9HakGOut5Dt
 L/Q9NVfYF1P7wrhJ1GdZI8qLOMexfwqDL3QSqvyAfcZeo600ykke+C3Fxy3pDtRKA1
X-IronPort-AV: E=Sophos;i="5.88,379,1635220800"; 
   d="scan'208";a="66766320"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=emWtRwsxU7T1YMq73bIaGzJPvnSVff4MgVOJ12ttDX0iLJUiwMGEIxm/dJhkSkYiDgPpFjLcSp+T5jRrb5B1eLXywsKHcl/L698FajttlBMKCP4Jhhpp7JYaqpluzqd2FY2BIXAgKs6An24etLVZlJdP+ql6whfZRcxkE0yNp9LYZDtgiPIE8AiKEsEetgimCULRXFkxfNMz6Vwsrd6bhwgxm5ecHho+z6JjnrbmJ4H6Lhx11uHKHE37k9lgW3tm6u5Lbw9u1CCjBUBG3LeDfAxv2lBVAEYLleziAOWpmVH1m3K6mRNuXmZjJ6OAa1v5FkdabRN9ssugkEkygDJMMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wycz5DnGVIywU467a7gmql8uL29FYGmIDOKp8zvRFgg=;
 b=CWzoWqGcBUOfARhVL9hJFFlgYUq0hlf7yf27x4m11i/0Z8IIevFDMnwds7BkkkFtHwO78XCBKJQTKvsY4gaY0Rpt9bPOrLSq4gcNMSSp8sstAmqXcStNdMCASWpdG9Mbugcp1lJ8YMdR+u9MkdSRIR/psl6eaJLWFPD4Xi49a+qiWw2LuoN8Z8sgB84Vpe/Eh/cu93VYETdDdPwj82EhlCofpsZ8CSPl5LKKi6D+j2yb1t5cWZbF4i685b7YhaEj7fW5+G59yRUQGP+c9V3/zkF0CNvBK/C16jgdIBRxHQ+ovWEZmf0MBth24RPG3EmRbvL6e2ByleJka+3cHUBG+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wycz5DnGVIywU467a7gmql8uL29FYGmIDOKp8zvRFgg=;
 b=o30pPP/T9AT+7fPAjAGOnK9z4Ku7naPI+SNVlxoapVk5buIFfAyn3zs3ozLyuJZJqKqI73BzYVLNmmLOaR7youE5e8g4fsfTIjCKDnZpuZ6LKZJXHO6n1Bb8fkYUyDGesa2U6VKljquO1A7T2r170xQnolMo8v9aVZ+wJKjR8fM=
From: Roger Pau Monne <roger.pau@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Roger Pau Monne <roger.pau@citrix.com>, Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>, "George
 Dunlap" <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>, "Stefano
 Stabellini" <sstabellini@kernel.org>
Subject: [PATCH v3 3/3] x86/Kconfig: introduce option to select retpoline usage
Date: Fri, 18 Feb 2022 15:34:16 +0100
Message-ID: <20220218143416.34475-4-roger.pau@citrix.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220218143416.34475-1-roger.pau@citrix.com>
References: <20220218143416.34475-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0260.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:194::13) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 53b7cb76-8d17-4e83-7eae-08d9f2ebc9a5
X-MS-TrafficTypeDiagnostic: DS7PR03MB5543:EE_
X-Microsoft-Antispam-PRVS: <DS7PR03MB554304D47216A2FD6ED186958F379@DS7PR03MB5543.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3968;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: TyQkV81lnCAkpdI5B+Z8R7wYQFiYppun/JrNeq+P67tgyWk0Z9yCPiciyvIBy+UjbbeacuBrFjUrKkcIkNpy32gWNJk9vswWsu+uZ2Bfa5PZfBC/DAItgZeh4YwzhoUayYY2WnLPrC8a2cOAPKAdBdCWhJ9HMUuqO6u5I6qx0LAYYnt0dW+rGKdZ9dnAlNWWmC+ZKCwdshaJ36GNhfN+HKnPOHK94YIrsN+klxfEYJaVjOUg6fJl6xK6t1s+EXCyLt/xH9QAFAH7ghpZYnnArokq1rNHPj8ymTg3xq5gZa8ktdWUQ75cTB/FLVpumXNauAjxYGCxzEwSEqDFKhpmFYBe0AtFgkw+9AN9enm/U3SsmkATUDNtvXu277KmeNgSWBQW9YMcEg1A+33YQnQ/W58LlH7A9HkSIVh/kI2jTELeo4i4zY6i2b1r01nwRGbDjOUuWjG7wkNmPXWkczvaX5UnHs6jl9Re1PTCjibVfIxewVrGFyg7/+8vX7Lnamt77ENyZioE9/IiCsMVPqIWOq2v2Gunx+cz0Cp9oH8Ll+b+VjF3cV08g82k4XKew8hIEGZOzY6ZgoRNmFe8u29mKYuh1izvBuYcL2HZdEeJXwmjy8DV+XYRUmo5nt/SOaihYyaUKr6Yc5gzH1RThvQeYQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(86362001)(6512007)(36756003)(82960400001)(8936002)(26005)(1076003)(6486002)(8676002)(6666004)(6916009)(2616005)(66946007)(5660300002)(2906002)(54906003)(66476007)(316002)(66556008)(83380400001)(4326008)(508600001)(6506007)(186003)(38100700002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Tjg1b3orS1lMSGZ4RzBuRFg3amNuZXVxZWRZYlJ2VXpWS2xKTDZMRGI0aFhs?=
 =?utf-8?B?MGNXMHNDY0pFYi9kRUNhUXprV1k5U0VPUkxiTHpTbUlLelUvbHl5MUdaKysy?=
 =?utf-8?B?YnFWSWIvZTdFNkl5SjVodHI2dmFRYjVmVWEvUDBZWEIxbGpXZ05HMCtMSVpQ?=
 =?utf-8?B?aG9zT0lwMmNyRDY3K252bW9lOW1ZN3IzQjJGN1k3L2FEbXNvV1JEbmtmU1Zn?=
 =?utf-8?B?dXdUa25XaVRVMmxsRTQ1NUMxREphQTBvZVZZT3VLSk9BNG9jenVQTlQxU0xY?=
 =?utf-8?B?NFQ0NGhqenowUHhva1gvUE84dDJkbk1URlNmRVJ0dG1vQjhCNFlLTEdocmkv?=
 =?utf-8?B?MnJlWW9jSGphNVl2ZlI0eDZmYXVId0t1ODdTakFtYVNkcS81M3VqQi9pcTRq?=
 =?utf-8?B?Nm92c0V1YUdZTld2TGt1OXk5SklPRmUrVHZmOGpyd3BCRkVQQW5XRjdjeEtp?=
 =?utf-8?B?MDY5amV2RzEyQmJ6QkxpUEt0TXdvcU1lWWNjQUR6VFRxMDlyNGV5c1JERzFj?=
 =?utf-8?B?Q050T0gxQ0lHdmNhRFZrQVd3azZPd0dDWkNkWlIyK1pyWWh4VmpLSHJ2Q0RG?=
 =?utf-8?B?aUZxYmpZZlBmVkVZb2ZpQThIODBLRFA4ODQxelJUUldGcm15TENrNy9iZlNE?=
 =?utf-8?B?NWEvblpiSW5BSTBWM2JoN0IvQ0JWU0lOVDNEU3dTbWorMmRqcDE1bnBJNktL?=
 =?utf-8?B?QjF2OEtEcFBxZ2F1NWlmWmpTWVpud2Q5YlVndU9kb3NjK0ROR29iNWFjT1NZ?=
 =?utf-8?B?TmlZM0lGYXZ0MGJ3aHRMSnVWUWRyRm5zZjlOV094eDE5MzA3ajVUeDhuYmlN?=
 =?utf-8?B?MGRyejN6UUdNMkJ0US80R1Jsb1QyWkpzVFN3aDNYR2JRdDVMNzE2UXdKb2FS?=
 =?utf-8?B?Z3dEZzJ3Ky9pQmVzTU4wZmkrL3NGTmpGUWhqMjIrVlVmTzVTdVh6T3lXRVdn?=
 =?utf-8?B?ZDFHQm9mdWR1VGFKVGNFZ3A3RGo1NlhFL2RPV2lkVGZJQzZxVmRNUkl6UjV1?=
 =?utf-8?B?cHp1c2ZDb2NKY3FqeU54TCtwZ0RWbUJKUlhTbzEvdU5iUGNoTWVVelYxeWdP?=
 =?utf-8?B?WWdMZVp4RFNwRlFBZHlHaGJpK1crOENiODI5VHBBeHdWYUczR0psK3QybGNE?=
 =?utf-8?B?UzNoclJ0VmRFVE4xQTRnWFdtU1d6d2svM2tVSHpCVTQxWjBCam8rUzYySEdr?=
 =?utf-8?B?MWdaYW5DTWtzSTEvSFltQ2w2UHIvam9BOVZoRUpOMWpkUGtrM1BpT1dPQTlW?=
 =?utf-8?B?UWExSEpSa3dpLzV4OXBBWXVFOVRMQzdaaGM2VmxmZ3hQR3lkUTlmRkZkWVgy?=
 =?utf-8?B?QStyRlRDdFFpOUZjeVZsb2lvSXJ5UXlNQWhTeUJKZmtYYk5Xc1dvMk80TUVK?=
 =?utf-8?B?MzhPRUVnd2dPdGlxMEJ6L0ZOakorZ3YwNGFUK0U4ZmI1UUpMK0JydWNGK0Zq?=
 =?utf-8?B?OC9BQ3F0aE9FRytJcTI3T0N1K2lTbVY2NlZiYjYrd3pKRVhySkRvRzE5amg2?=
 =?utf-8?B?OWNRQ1VWZFBzV2ZSS2VpQ2U3aE8xUDlpd2IzMTJSWFJUdFFScTl1bUVySlZk?=
 =?utf-8?B?eG1zdWRjeHQ2dHBDK2RKVzFpS2N3cHpmWnB6QmQydHRmYWhhMFdHekplTExk?=
 =?utf-8?B?VURuNmNIVzNJL1JUelViKzM4R1VXdE12S28wTm5iT2diM0RSc1YzVDNXNDl2?=
 =?utf-8?B?SkxrQnJiUmMwamlwS2M4Qy9RbUVyb2VhNDlvd3NYczByajA2NHpIenRBaStJ?=
 =?utf-8?B?dFVmajFQSlFLMG53REJnNDZnbWpBcWRyWmlXbi83WkcyQnpTNDg4LzVKS2lz?=
 =?utf-8?B?OXhhcXE2RlpvZmVzYk5tREduUDcvOVJGMzBqRGJjNWJoaXlNSCs2Ky9wM21X?=
 =?utf-8?B?c1JTRmlDVDJtN2h1OW1nSEZhbi9mbEFpVjBNOU1XYnVzRWpFNWZPQTZnZWc4?=
 =?utf-8?B?cXZBK3RaYkRkWEFMYnhWL3ZXU3NTdnRqZ3lZeEk1N0pVbEk2K3RLOGwzWWRM?=
 =?utf-8?B?dXVqWXlSUmo0MDk0ak14Y0pTUndxSEM3VyszMEQzeXlVcHc5a0RzWXNMY0NH?=
 =?utf-8?B?NFNKSDBzQndaZ1gwUXF3WlphWFFKMVlVRlJTUFJSR0ROM0laMkRwaFpFNHlr?=
 =?utf-8?B?ajJLYTEzdmpKcWYzV050c0NQdDlQTXZ2NldvdGhhOHVXM2VWVnZhU3hNczhR?=
 =?utf-8?Q?RKwyVlX99s/eqoDfspJOZcE=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 53b7cb76-8d17-4e83-7eae-08d9f2ebc9a5
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Feb 2022 14:34:36.7843
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 734ro5G1d620ojDR8cd6Qn96yFTe1tRmMMeyd1kNENBudn6iOvgy0NwEDUBnO0RFf/VZCa3apAmZhbOQwdm+qw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR03MB5543
X-OriginatorOrg: citrix.com

Add a new Kconfig option under the "Speculative hardening" section
that allows selecting whether to enable retpoline. This depends on the
underlying compiler having retpoline support.

Requested-by: Andrew Cooper <andrew.cooper3@citrix.com>
Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
Changes since v2:
 - Place first in the section.
 - Remove "If unsure".

Changes since v1:
 - Fix description of option to use indirect branches instead of
   indirect calls.
---
 xen/arch/x86/Kconfig |  5 -----
 xen/common/Kconfig   | 14 ++++++++++++++
 2 files changed, 14 insertions(+), 5 deletions(-)

diff --git a/xen/arch/x86/Kconfig b/xen/arch/x86/Kconfig
index f8dca4dc85..eb4d1a949f 100644
--- a/xen/arch/x86/Kconfig
+++ b/xen/arch/x86/Kconfig
@@ -36,11 +36,6 @@ config CC_INDIRECT_THUNK
 	def_bool $(cc-option,-mindirect-branch-register) || \
 	         $(cc-option,-mretpoline-external-thunk)
 
-
-config INDIRECT_THUNK
-	def_bool y
-	depends on CC_INDIRECT_THUNK
-
 config HAS_AS_CET_SS
 	# binutils >= 2.29 or LLVM >= 6
 	def_bool $(as-instr,wrssq %rax$(comma)0;setssbsy)
diff --git a/xen/common/Kconfig b/xen/common/Kconfig
index db687b1785..533b8f33e6 100644
--- a/xen/common/Kconfig
+++ b/xen/common/Kconfig
@@ -85,6 +85,20 @@ config STATIC_MEMORY
 
 menu "Speculative hardening"
 
+config INDIRECT_THUNK
+	bool "Speculative Branch Target Injection Protection"
+	depends on CC_INDIRECT_THUNK
+	default y
+	help
+	  Contemporary processors may use speculative execution as a
+	  performance optimisation, but this can potentially be abused by an
+	  attacker to leak data via speculative sidechannels.
+
+	  One source of data leakage is via branch target injection.
+
+	  When enabled, indirect branches are implemented using a new construct
+	  called "retpoline" that prevents speculation.
+
 config SPECULATIVE_HARDEN_ARRAY
 	bool "Speculative Array Hardening"
 	default y
-- 
2.34.1


