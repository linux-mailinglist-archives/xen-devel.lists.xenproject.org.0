Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EF12368FA0
	for <lists+xen-devel@lfdr.de>; Fri, 23 Apr 2021 11:44:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.116001.221374 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lZsMD-0002Wy-2h; Fri, 23 Apr 2021 09:44:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 116001.221374; Fri, 23 Apr 2021 09:44:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lZsMC-0002WI-Uw; Fri, 23 Apr 2021 09:44:16 +0000
Received: by outflank-mailman (input) for mailman id 116001;
 Fri, 23 Apr 2021 09:44:16 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=zio3=JU=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1lZsMC-0002RM-65
 for xen-devel@lists.xenproject.org; Fri, 23 Apr 2021 09:44:16 +0000
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 8517dd16-bee2-4053-b086-7e8bf9ae4ba5;
 Fri, 23 Apr 2021 09:44:12 +0000 (UTC)
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
X-Inumbo-ID: 8517dd16-bee2-4053-b086-7e8bf9ae4ba5
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1619171052;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:content-transfer-encoding:mime-version;
  bh=txr0Xq2jIf0c1V7u4B2HWZXE37t+65cPgbnp6nuNQCY=;
  b=ijEZXpWDJSbYkeFp9TNGSsXy43ctHpmxfMLoGBUSIETy+CS/Idpw8jG4
   swo59iySGhXxZ4i071MLHtW0jLOeCxn7XV4AtePS0RcJp2SlftPJXEadn
   Fc4AAKWXUCTQ32zPgi0mMjnR92VjFKGZ8z8Tz2ByEAz7F9WZKiYaAF8NX
   c=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: exNR0PxsW6DKeEBq/HHBm9A4okOgtm7uawSYq4kdXEZvpGZc2rVWOOY1n+FHMkO8DgJSA7z1yF
 ec4BhlJoHCefK5k7/dulFnUo/J1Q93/Jzu3bXAtJj9UeWyoB/fVp1BlQlWlp0wNVNUuz//ZJoH
 6iUiRLJfObrO9zJ3SRkJpZvesNh/U/bgDPw5FDCJB+RTZAo1kmsW6VfM+cswOtgDqkN3iGZDr7
 7ISkwi3Aexh6wR9C2bW/m1n0G//mgiYHqct6pyzoSiYTWoovTzDw/B5VovAwEcxLO/nmwpG6CE
 hTI=
X-SBRS: 5.2
X-MesageID: 42256107
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:GYMTTqqWqq/s657go10yM34aV5uuKtV00zAX/kB9WHVpW+SivY
 SHgOkb2RjoiDwYRXEnnpS6NLOdRG7HnKQb3aA4Bp3neAX9omOnIMVZ7YXkyyD9ACGWzIJg/I
 9aWexFBNX0ZGIWse/T/BS4H9E8wNOO7aCvgqPkw21wSBxxApsA0y5SIG+gYylLbSNBAoc0E4
 fZ29FOoCCudW9SQsOwAHQEWOarnay2qLvNZxkaCxk7rDSflD/A0s+GLzG0/Dc7FwlOz7Ar7H
 Tfn2XCiJmLnvmnxnbnpgnuxrtMnt+J8KogOOWtjYwvJizomkKUYu1aKsa/lRQUhM3q11owit
 nLpH4bTrROwlfcZHu8rxeo+ySI6kdW11bYxVWVgWTurKXCLVpQYaox5vMqTjLj50Utp9162q
 5QtljpzaZ/Nh/cgD/7o+HBShACrDvEnVMZjeURg3ZDOLFuD4N5kIp3xjIxLL4wWAj+6IwhDd
 B0CtDd6Pt8YTqhHg7kl1gq79q2UnspGBCaBmAEp8yOyjBT2Et01k0C2aUk7zs93aN4b6MBy/
 XPM6xumr0LZsgKbZhlDONEZcesEGTCTT/FLWr6GyWpKIg3f1b277Ln6rQ84++nPLYSyoEppZ
 jHWFRE8UYvZkPHE6S1rd122yGIZF/4cSXmy8lY6ZQ8kKb7XqDXPSqKT01ru9e8os8YHtbQV5
 +ISdNrKs6mCVGrNZdC3gX4VZUXA2IZStcpttEyXE/LjdnMLqHsq+zHYNfeLLfgCl8fKyHCK0
 pGeAK2CNRL70itVHO9qgPWQWnRdkv2+o81MKWyxZlX9KE9cql39iQFg1Ww4c+GbRdYtLYtQU
 d4KLT71oeypWy8+3f0/3xkUyAtSnp90fHFaTdntAUKO0T7ffIooNOEY11f23OBO1tZQ97JFh
 Vc43B647i+IZDV5S1KMaPoDkuqy18o4F6aRZYVnaOOoe3/fIkjM5ogUKttUSPRFxJ0ng5ugH
 xZaBANQ3LeEj+Gs9TnsLUkQMXkM/VsigaiJsBZ7VjFs1+HmM0pTnwHGwK1XdWvmgYoTTpMjl
 hX+6sS6YDw3gqHGC8auqAVIVdMYGOYDPZjAB6ebItZoLztZTp9VHyHnzCclhE1dFf77kl6vB
 2TEQSkPdXwRnZNsHFR1ajntGl5cWiQZGpcQHF3u48VLxWMhl9DlcuwIoaj2WqYbVUPhtwHOD
 beeD0IP0dF3NasziOYnz6ECFQrzpgjJfbmEbwmar3fs0ndbrGgpOUjJbt57ZxlPNfhvqs3Su
 qZYRaSNy69JOUz2QCZz0xVThVcmT0Bq7fP1xLk5mTjgyJ6LvrWPVh8R7YUZ/ub9HPpQv6U0J
 N/yfI51NHARlnZW5qj8+XwaTUGFzb45UiRZMssoYpPva0zuKBodqOrGQfg5TVi5lEGMMzwlE
 kiW6x177DKB593c6UpCldk12tssO7KEVAivQP3CNIvZF0Bj3fUONWS/rrDwIBfdXGplU/VMV
 mb/zY1xYa8YwKzkZobAbk3O2JYdQwV72lj5vqLc+TreU+XXtAG2FqxKXmmdrBBDICDBLULtx
 5/p/WFhfWeeSa9+Afeu1JAU+9z2lfiZcO5GwSXH+FUt/S8JFSXm6OvpPeJsw2fc0rzV20owa
 tfdUIRacxfij4tyK0PuxLCNZDfkwYCiFtR4TZui1j3/JOpiV2rRH17DQ==
X-IronPort-AV: E=Sophos;i="5.82,245,1613451600"; 
   d="scan'208";a="42256107"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IfhHdFTe/Vlsx6/5DlRnAHm/NiyuatQY4jepKVeGyB2L97bacT+NrG8u3StjKMl6/tqC9h/GdTB+8DcjnebJqP51oCpv1ZkAdAnThBKmh6wl2TogCpnREB7Zb+EuAbpihRkEylV4LxivTbWkzhg+8hZUQl945DziwMVf1LhJ7Ai6wdMjCIcNPpvH2u061f2ChEZfDqWeC6s261SZiUXNBwTL+wampF5bpscddcfdqgLxjO/rKjFAbd2pLZX5OFMDq3aRjGr4aRO+1lhQMl4TI50Yss4x9JSx9FPQKbTbcIaORJqhCFE74j5O0sIs9pyqiw11WeoZCJD/hWagmaICZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PRE8OuYK7Uh2ACUdejo4vbT6G8Eip5cPiUQoM26NonA=;
 b=ZFoT/Os76Fhk2kvb9f50tmlGUBSbOusgDKOx20W3sWk23mfm41eD7TY1HYr5o3bWuLYdAHbB4SHp7QRn3VtPm4OpGdJEuh1ZP03966E1eLOhaWaTvzoNs7QWJ9K/ywZh973HKPe/6ShnxZOpZbONWagUUdDI7Sc4rdXAh42h7cHZMM0If2GGfePvx/KbXJlrjvEMYaL9PX2Rmfrr4wYvN3RWB3bFPDHBAT2pGaVVg42biVmEZb8SUSPoSiG2vrzNDNKeMog5K/S4B84vZyYZhnOhNEQey/gn7BJMU5Uc/jonYuiO2hyhwTgADbHc3XaeXXOCRkjKPOFoNuxtjD+P9w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PRE8OuYK7Uh2ACUdejo4vbT6G8Eip5cPiUQoM26NonA=;
 b=A/iTW1ucOAQ0fCe1ELe90WziJO18roYskwDFXtFyVFqG2inB0q2XFbpfGQl3eEk7TjI41Z2UugMyUVPwQFWFAJcArEOLRiK74Clt8uMcizxfw/IPPTE4YZN9l4CLjPC0fkiI+E538WVkzevZ54+PQj47c6d7Q6YXXXLXrgH84M4=
From: Roger Pau Monne <roger.pau@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Roger Pau Monne <roger.pau@citrix.com>, Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>
Subject: [PATCH 1/2] x86/oprofile: fix oprofile for clang build
Date: Fri, 23 Apr 2021 11:43:42 +0200
Message-ID: <20210423094343.5850-2-roger.pau@citrix.com>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210423094343.5850-1-roger.pau@citrix.com>
References: <20210423094343.5850-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MR2P264CA0169.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501::8)
 To DS7PR03MB5608.namprd03.prod.outlook.com (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 958b50ce-b40b-446a-6e3c-08d9063c5892
X-MS-TrafficTypeDiagnostic: DS7PR03MB5591:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DS7PR03MB5591E17AF6984D7635EBBAA38F459@DS7PR03MB5591.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:538;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 4zWS/YI9JSs7ILhmuAHOmsIWaV6U1QCGttKMR/vDYP+g+o0nFZ6FuzN27OyvGG8C8mSObDJ5RIq/2clWpKN1aYMwPSBHXCdf5hH+IDIP0hM27ENLeqRkQKfkVkjPqGvic9fu0gl8bB4i7iQWVsI5Ig/dWpYc5vZCdr3qz56kfbnC8R0NmCoR8/riwIuq10EacQhoc9zCKqPkh7EIvdQiE3NbqPbYLRDN+i9UZUyacyyFhVH+EDDN7vvVtEbdMvq46biMImJyIDpkFoHbg2wms+Y3tlEIP3uRD6Mz01Zd4ZI8rZLRdcncxa/nu3GpX+nlTBO342MXTlE+zophRs7hqk0jrmB++f94b4GCT60uSoqGQCsbc7ETgbfrITDxajs6dr6CuwLcRa3ncvYOslM4A87cZ5fhsbukCqUUDNk+9tIeoXgZNnm4iKJnyDMGKR6IkqVCE1EnjW7xtgr3+qG5OZuHvbxT4McjYNPrh7ozHwzvIlGQrQZJ8BltBG/pguSgAn+dCjjZO1roiyPtksXmMwybedpZuzdYRifz03d8n8Vzajuc8Of87lkXXuHyyn82Bw+l/w/22tl+YRxbji5c+u80r+i8kBNpjTucKdcxpBI=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(136003)(39860400002)(366004)(376002)(346002)(2906002)(2616005)(26005)(66556008)(66476007)(16526019)(186003)(956004)(38100700002)(4326008)(316002)(6496006)(8936002)(478600001)(54906003)(66946007)(86362001)(6666004)(8676002)(1076003)(6486002)(36756003)(5660300002)(6916009);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?SWo4emlwN0Q5WGk1RnVsdktqamJsS1FpVkVuK3NhUE1yTlM1T1lmaEhOaklW?=
 =?utf-8?B?RFdrSi9Gck82SFNKc2pJcGttZWdudDVWdHRqZUNMUUNGaFVpTTFBanYvUWgy?=
 =?utf-8?B?b1VkaHIzVFhLUWFxTzBwSGEzRHMzeWxSYW4wajNkUFdwb0NtRzBPTWp4aHJH?=
 =?utf-8?B?TkZCU084cHptVUVUbmdQdEJSNE4zcm1WSUZERHMxWThMZmJwOFdvVnNoaytM?=
 =?utf-8?B?UG1NVTBrZldCVHRWM1k0Q3BLSkxuV3ZzMzQ2R1psNnJxc3J2Wk5GSmJQUUtP?=
 =?utf-8?B?WjY3Ky9uc2lvOHptRVlTeStBTmJSc09yYmJncGt4ekVsVHd4THNpWnZwY1p1?=
 =?utf-8?B?dW9YTVU2UnI0NFB1amV0a1J1cmFpUzFZUForQmtGbUJJWWt1NXFlUkJiUmd0?=
 =?utf-8?B?K0xXSlN5L3Y2SDZzdm9CNWpGaTZ4T2IyQ1ZCdFZVbWk5REdoMzRXT1NFcVY4?=
 =?utf-8?B?d25ldE1LTCtMck13R094dC9GRWxZb1VHYUlST0U3d3d6ZXo5empSekwxWGY1?=
 =?utf-8?B?L0RqQWlVdEUxalZBR3FrZXBGMkgwelM1MTBMUzZaUHJZeVhuY2xUczFsNVI2?=
 =?utf-8?B?ODA3UXhXclFWRXBNTEVRS0U5cUkzaFd1OEtlOEJVWFAra1F5cWFuQmhBdVNp?=
 =?utf-8?B?NjF6TlZKeE5QbTlhSHNLSVVIZll6aDE4Y2dSRWE2Z3NTVnNUcU1NWVRBRlJn?=
 =?utf-8?B?alovdGlGY3RuZkkvQmtIRU5RZkNZcFM2Tlk5dDlRQnYzZkhKbXJJNWsvSm9X?=
 =?utf-8?B?bEF5R0RzdGM5amdXSEVlRzJvUjJXOEhEQXErb3B3U1RyM3EwaWM2QjlvT2ZC?=
 =?utf-8?B?VFMzdWh1UEU3MXdSc1BaWjlIZUlycmxNT0l6T3RUZkhyby9venQ4aC9lZEN3?=
 =?utf-8?B?ZUVmREtSelVoUHNjbkRJTjFyOTJUTEZxUXlScVBZVmdBWFJPYWZKMUFibkZs?=
 =?utf-8?B?dWVCRDl1WVZyaXdncUxjc3FidjhLMnl3Q20zMmFEWnhpWmNWTXhoYXErd2hp?=
 =?utf-8?B?YUZHazEvMGpmL0pqZmFsNHZDTHI0aUk5ZjF5OFdCcWZORE51YXlyTkx1UlJk?=
 =?utf-8?B?bTlJTHVaRTRQYUNkSStsQjBxeU92YkFVTUZWNWdGZ1VpcWhLejBXUG9IbTY0?=
 =?utf-8?B?UXdNQ3JsSm8veXRSbCtjNTEwS2h3bGVYSTMwZ1cvTWFkTmZDYTBkQlFyQzZs?=
 =?utf-8?B?NHUwOVFud2FQQkhQSEk1M3NNdFhXQll1TFlGM2RsWTJ3MGZ5b1FKYmRxa25p?=
 =?utf-8?B?UzF4Zjd6aGVzSWZsUmFIUzdCVTRnTFZJTElyaFBGRGtCUFNhWXJGeXpSM3NP?=
 =?utf-8?B?OTJwWFJXU2IwMmhPaUR0Nm9paUk2WFBRUFFJWkF5NG9tY21iTWpVcXNrYkp0?=
 =?utf-8?B?ZW5COFZYRXNOTytTclZrVnozVnMrbzBjMWs1QncxQ042eC9Hc09UM1hETm1Y?=
 =?utf-8?B?akFNdG1CN1R1U0FzeFR5bGYyRmV3NU9LNWt0YTJsakR5VWUzVG91ZnpZUXcz?=
 =?utf-8?B?VzFtemd2N0V2RTYraFU4OEs1UkpFdHBHblAzOWlNV053NHFPMERKMU5ZQzhk?=
 =?utf-8?B?WUNSUUk5YzRQVEIyV29Zc0oxSHlHL2tabGxYbFVZbGJVb21FY04wQWErYmcw?=
 =?utf-8?B?SVRva0FUTGRRNmcyUEZyb21yb0NzUzNSTGJlOVIvSkxNcTBVOTh4MGdNb0lP?=
 =?utf-8?B?andmZXp6N0JqRTE2bUFHSS93VFdxWU1KTVNvdFRoMXEwMHduVFNuamV3M2E2?=
 =?utf-8?Q?9GS6TD8qRJHOWocVUpqyTkpAEvFQaBG9XbACM75?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 958b50ce-b40b-446a-6e3c-08d9063c5892
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Apr 2021 09:44:10.5701
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zw1XT4KtSWKT6Dgb/vgD7wU8P+q1Y9VHrp1rPMep3S0ecGXCUfHGVoNqRcoex0Za2aHSRh7A+vAys19aDh4YIw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR03MB5591
X-OriginatorOrg: citrix.com

Clang complains with:

backtrace.c:46:19: error: unused function 'is_32bit_vcpu' [-Werror,-Wunused-function]
static inline int is_32bit_vcpu(struct vcpu *vcpu)
                  ^

Fix this by guarding the function with CONFIG_COMPAT, as it's only
caller is also doing so.

Fixes: d23d792478d ('x86: avoid building COMPAT code when !HVM && !PV32')
Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
 xen/arch/x86/oprofile/backtrace.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/xen/arch/x86/oprofile/backtrace.c b/xen/arch/x86/oprofile/backtrace.c
index 929bf51a408..bd5d1b0f6ce 100644
--- a/xen/arch/x86/oprofile/backtrace.c
+++ b/xen/arch/x86/oprofile/backtrace.c
@@ -43,6 +43,7 @@ dump_hypervisor_backtrace(struct vcpu *vcpu, const struct frame_head *head,
     return head->ebp;
 }
 
+#ifdef CONFIG_COMPAT
 static inline int is_32bit_vcpu(struct vcpu *vcpu)
 {
     if (is_hvm_vcpu(vcpu))
@@ -50,6 +51,7 @@ static inline int is_32bit_vcpu(struct vcpu *vcpu)
     else
         return is_pv_32bit_vcpu(vcpu);
 }
+#endif
 
 static struct frame_head *
 dump_guest_backtrace(struct vcpu *vcpu, const struct frame_head *head,
-- 
2.30.1


