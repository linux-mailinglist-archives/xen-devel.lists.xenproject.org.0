Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CBAB14D1180
	for <lists+xen-devel@lfdr.de>; Tue,  8 Mar 2022 09:03:54 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.286571.486129 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nRUoQ-0005Mp-RW; Tue, 08 Mar 2022 08:03:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 286571.486129; Tue, 08 Mar 2022 08:03:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nRUoQ-0005Jx-O8; Tue, 08 Mar 2022 08:03:18 +0000
Received: by outflank-mailman (input) for mailman id 286571;
 Tue, 08 Mar 2022 08:03:17 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=fWwI=TT=citrix.com=prvs=059ab6e88=roger.pau@srs-se1.protection.inumbo.net>)
 id 1nRUoP-0005Jr-J1
 for xen-devel@lists.xenproject.org; Tue, 08 Mar 2022 08:03:17 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 33a3510f-9eb6-11ec-8eba-a37418f5ba1a;
 Tue, 08 Mar 2022 09:03:15 +0100 (CET)
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
X-Inumbo-ID: 33a3510f-9eb6-11ec-8eba-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1646726595;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=U/uzF/sWVA17YsRRFwGtSih04Zj8zWp/OGJVaVdK8R4=;
  b=Y3hG59NbMLdRmQDgZk+Ge6eOjgfR51OQgkbfZi4aTOGmSg1TJwMQeBfR
   /Z4gsTnejNMXIh3cXumcbvwAWE1g2izMLPtFRmVnmX+bKqpHBayt/XhlW
   p57LZ8qC8iMgj8vLMIJIKVb8iYBfHm5f3ZEkqeqeZTPoRLJz4hcx9PHXv
   g=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
X-SBRS: 5.1
X-MesageID: 65159904
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:dTNgp6hO4hWK2XosOgYmwIXUX161lBAKZh0ujC45NGQN5FlHY01je
 htvDWGPOqzZa2SgeNx3YIW2/RwHuJTUzYU1HQFvr3g0Hnkb9cadCdqndUqhZCn6wu8v7a5EA
 2fyTvGacajYm1eF/k/F3oDJ9CU6jefSLlbFILas1hpZHGeIcw98z0M78wIFqtQw24LhWFvS4
 YiaT/D3YzdJ5RYlagr41IrbwP9flKyaVOQw5wFWiVhj5TcyplFNZH4tDfjZw0jQG+G4KtWSV
 efbpIxVy0uCl/sb5nFJpZ6gGqECaua60QFjERO6UYD66vRJjnRaPqrWqJPwwKqY4tmEt4kZ9
 TlDiXC/YTwHLKbRtP8MaUAGFytyEqtc5Y72fXfq5KR/z2WeG5ft6/BnDUVwNowE4OdnR2pJ8
 JT0KhhUMErF3bjvhuvmFK883azPL+GyVG8bkmtnwjzDS+4vXLjIQrnQ5M8e1zA17ixLNaiDP
 pdIOGIzBPjGSx1BNnYIGqtgoMC5hCDzUBNIiXHFlKVitgA/yyQuieOwYbI5YOeiT8hPglyRo
 G6A+m3jGwwbL/SW0z/D+XWp7sfxmif8VJMXBaeP3Pdgi12OxUQeEBQTE1C8pJGRmkO4Ht5SN
 UEQ0i4vtrQpslymSMHnWB+1q2LCuQQTM/JPF8Uq5QfLzbDbiy6bDGUZSj9KaPQ9qdQ7Azct0
 zehnc7tBDFpmK2YTzSa7Lj8hSipJSEfIGsGZCkFZQgI+d/upMc0lB2nczp4OPfr1JuvQ2i2m
 m3U6nhl71kOsSIV/56V71varym9nMGXSgQ5yQPNQ1OUsgwsMeZJeLeUwVTc6P9BKqOQQV+Ao
 GUIlqCi0QweMX2evHfTGbtQRdlF897AaWSB2gA3Q/HN4hzwoybLQGxG3N1pyK6F2O4gcCShX
 kLcsBg5CHR7bCrzNv8fj25c5q0XIUnc+TbNC6i8gjlmOMEZmOq7EMdGPxb4M4fFyhRErE3HE
 c3HGftA9F5DYUid8BK4Rv0GzZggzT0kyGXYSPjTlkr7j+TBNCPOEOdYazNii9zVCove+205F
 P4Fa6O3J+h3CrWiMkE7D6ZJRbz1EZTLLc+v8JEGHgJyCgFnBHsgG5fsLUAJIORYc1Buvr6Qp
 BmVAxYAoHKm3CGvAVjaOxhLNeK0Nb4i/C1TAMDZFQvxs5TVSd30t/l3mlpeVeRPydGPOtYoF
 6lVIZvRWK8TItkFkhxEBaTAQEVZXE3DrSqFPja/YSh5eJhlRgfT/cTjcBep/y4LZhdbf+Nny
 1F8/ms3maY+ejk=
IronPort-HdrOrdr: A9a23:uA6ah6M0unYEeMBcTyP155DYdb4zR+YMi2TDiHofdfUFSKClfp
 6V8cjztSWUtN4QMEtQ/uxoHJPwO080kqQFnLX5XI3SJzUO3VHHEGgM1/qB/9SNIVyaygcZ79
 YdT0EcMqyAMbEZt7eC3ODQKb9Jq7PmgcOVbKXlvg9QpGlRGt9dBmxCe2Cm+yNNNW177c1TLu
 vi2iMLnUvpRV0nKuCAQlUVVenKoNPG0LrgfB49HhYirC2Dlymh5rLWGwWRmk52aUIE/Z4StU
 z+1yDp7KSqtP+2jjfaym/o9pxT3P/s0MFKCsCggtUcbh/slgGrToJ8XKDqhkF/nMifrHIR1P
 XcqRYpOMp+r1vXY2GOuBPonzLt1T4/gkWSvmOwsD/Gm4jUVTg6A81OicZyaR3C8Xctu9l6ze
 Ziw3+Zn4A/N2KOoA3No/zzEz16nEu9pnQv1cQJiWZEbIcYYLhN6aQC4UJuFosaFi6S0vFqLA
 BXNrCc2B9qSyLbU5iA1VMfg+BEH05DUytue3Jy9PB8iFNt7TJEJ0hx/r1qop5PzuN5d3B+3Z
 W2Dk1ZrsA/ciYoV9MOOA4ge7rANoWfe2OEDIqtSW6XYZ3vfUi976LK3A==
X-IronPort-AV: E=Sophos;i="5.90,163,1643691600"; 
   d="scan'208";a="65159904"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Dl0NFvrb4R8O8ie18g0jTW7a7thuWIfeYI4nx1FcnLmwWR2OICz2XlQm0SbRQ03piUD12KSgsIzC46eD8zE+cZucVXmlMpRDvoV8uphiDHN3m0ksKzIU4GNnlc+ylrtiKo35slo3TGcvFSn7ljH/u/d2vtDKgiobX7NwLgBaz5XrMJQesGjUYpbN58oSVM7RPYnITNeUaCg58awG1uh1m78sTSjFzdKbX7tETSlNNwCRTserXlBxmIeik2gtXSHixWVENdc+G+aLxhWRRjO/B7ek+DzPEJlHVHro87Ut43PQte/Vu5Bl/0j9JxHsSamIab01Q3u/5j9k7MIyHTqSmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=v6I/KiQ/hLtiHfnmA3YIwNigA+yWpv/hHVyNtWTppkA=;
 b=VHwnwGCBt11ZweqrS+81HAtUXMkOepjKelug2n6Kb41VlxI1DIZ5GTurQcavBBdZNd818ta+J80OQxG+ifFi5vVXZSTFJ7rTsti27UG58mL1nen05TOECJavTpL49Q3zEiLbvbBEFc5kn7MSARZFBFFIPkrHMPyCEx1/ayUqNye66tTYNRciJFnsK8qD+ZsayvOXqXqXLRkiF4sYG3arardY2M+qSGT4wyRFwLP/B8Awz9y3HIL5mrXoS70CnHR0uThSniGlFZXY2Gc0uAzAehgPu3kz087iAXxHTYTTvlgct/Z9j9S+QHXLYKHnb0EexHebUvlPLv+uuQMLaPuV8w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=v6I/KiQ/hLtiHfnmA3YIwNigA+yWpv/hHVyNtWTppkA=;
 b=JpjTdnCPtdfpKCKOXauHkHAnya9EvI49O9Z0YEf1J9jIq39flz3a6jgEyRLkyEjoYbkmtlK/Bv6Vb9Nu+TO2pm4zf4phJakmhUITRpQHetUVd1asMi96PVMgyFzC0/8z01YRksTs1vWNAPzmtcsobEfn838j27tzLaxkSlxlw3s=
Date: Tue, 8 Mar 2022 09:03:04 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap
	<george.dunlap@citrix.com>, Julien Grall <julien@xen.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Wei Liu <wl@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	<xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v2] livepatch: set -f{function,data}-sections compiler
 option
Message-ID: <YicNuCDYIr6dZMFN@Air-de-Roger>
References: <20220307155558.72876-1-roger.pau@citrix.com>
 <984284e3-c423-16ec-5ad7-c4211ebddb70@suse.com>
 <YiY0jMinvZf8sBaK@Air-de-Roger>
 <c5623c11-cccd-c74c-6ebd-ada9885216e6@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <c5623c11-cccd-c74c-6ebd-ada9885216e6@suse.com>
X-ClientProxiedBy: FR0P281CA0084.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1e::23) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 61984c41-68bb-4f16-ceb6-08da00da15a7
X-MS-TrafficTypeDiagnostic: MWHPR03MB2623:EE_
X-Microsoft-Antispam-PRVS: <MWHPR03MB262383DFE4FC68F28DE353B08F099@MWHPR03MB2623.namprd03.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: VNrb8rei3oYL/pR7BS3mbZVtFj+/JemEBWYkUTZkbvUGNWWjh4Gj+752Q1vjzKTcl6tN7LEFK31y7kSWiu6T12wMpo3xOqL9CuwZxk6u4PUBliQLk4ZlAjFrv0j0JR4N2Ua1T9In8a6x2E+4c5V1knh18MbiS4iJUuo5ptJxRDEXEwJjOUwV3QeNdkdDpUTJMlm2UoQcY5zsY2qMHTSaHuVpnOH12djA6C290jC7hpzuOcrg2/7KXsK7PY3n8fUHuR4JPhmaAY7Gz2sPIYIUi2ICyEJmUh4kdu1ExGSrO/47IpmxNgDTQV1AehTP5eTcwQQkdRbQtrih167sNJYZ1aIU0T1KnQJsoqHiXtdVY/L04OaGtWZ4w65VC9RsWovyVMQVVTfVrfgrLpwu33Y2/c5DIDlsRQOksI43tbjEztzbHLp4E0HDj5J7bmOTPdQKcBMCEnj74dh4oVsYw30rNOv/gsAeliA/EZbA1DjLpUgGNjAePqc2HGiYnzZN4QDoEjOU3WTnyyC0hjynxAp0iF7GlZiOG5lrRh9Z/0FWEPXr9iRLS2ULSfmoc+EUzQ1R28zHxghzVjyXlOzUGTjsJ393Q30Lw6dWWhN3dtiUf87eqKqg4KlF/c6bahNWbPfRMEG0utnBLHwzqtte4e3J8A==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(7916004)(4636009)(366004)(8936002)(6486002)(82960400001)(9686003)(6512007)(53546011)(316002)(54906003)(6506007)(6916009)(85182001)(508600001)(6666004)(83380400001)(86362001)(33716001)(66476007)(26005)(8676002)(66556008)(4326008)(66946007)(5660300002)(38100700002)(2906002)(186003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RUNBMUg3OWN1Y0w5eWordjJwQ0FjN013V2Noa1h4YUdoLzdDeVJ2OExOMzVG?=
 =?utf-8?B?dUdSTHozOU4yWktRc1V4a1ltTDJ3NS9MSnYrcHNqdzZlR2daTUFTZEZFR3Qw?=
 =?utf-8?B?d0xidUFtOEVWNHRhb1BHVW81WVFrMDhKam5IdGhBSFJHeHNHTm55U081Q2xB?=
 =?utf-8?B?WDhxZWo3bVdPdzE4VkRESnkxbElueEFTUENNS0c0Z0FrSEZmeHdSYjM4V1Zl?=
 =?utf-8?B?Z29NSTdhaEtON25RYk90czNNTTZTbGJBT3B3STBHV1g2cG1aR1pjVHNrQzFY?=
 =?utf-8?B?Sm1GWCtGVVVmKzNBTWtiNlB5Vk1hREZCZWZ6UlB2M1NpeUVGTDlWdWhMdUVL?=
 =?utf-8?B?Rk1TSmM3L2ZWTUQ3VjN5VjNvS28vMktySk9aMVBYNkczYktObEVaL09Yd1BM?=
 =?utf-8?B?d1VudGdzVy9lemEzSURCRkpaZTM4cTRua2NsellKZktFK2gvNFNyYlk5bFph?=
 =?utf-8?B?V1B2bUwrVUNCSGU1bjBHNlZqQXBHeWxibGhSYzVJdDhPZ3B0Q1BTUGwvS3RQ?=
 =?utf-8?B?SzNXc1owcTdHd3FNV2dXNTZpYnBaSXZQeEJ4MjhPNFNRVHVhdDFlOUtFaCts?=
 =?utf-8?B?OE1UR2Z3ckc1M0MwZk5RRVZlcEdJd2k2MytCK1FGVVJuUmRFdmU1WTdiM1Va?=
 =?utf-8?B?VTFFSUhIQ2pFdGtLZnd0aG5XMXhiNStzUFJ6NUNLQ3I0Wk5yOUNUcmtDd2Nj?=
 =?utf-8?B?UldvTmNPdi9GaUUvekUrV3BvNG9ubHd5aWZnRGRzZE8zYkpkQWEwZ29EaWw0?=
 =?utf-8?B?RGF2V0NDc2NrNFRscWJsOVZnb2xkUjRrelpHbHZoL1Z0aHpBNDFPR0I0YWpT?=
 =?utf-8?B?R0pwc2ZjdVpITzNDazM0b0orakd0MEFjYkdlMzlvMmNacUZZeUMvTGVVcVlH?=
 =?utf-8?B?dEpSaFVPTUM1dHp1anlxMHBmd0toSzRhU1c2WnFOZ0ZuaVZLdmcxc205K1c3?=
 =?utf-8?B?Nkg5RFpGdjJ3dkFEWDdweHdQMHBrNjh2VmpOMzhlaG1OUmNIc2tUYTQ0VW5Q?=
 =?utf-8?B?UTNISHc2QVRXTnRXSUc0U243Ulo2dVRQZHVydjV6MktBdjBrMk15eVNJamJX?=
 =?utf-8?B?RlNvNTRrdUZ2U3o2TW1VQVZOQ3V3dzRwTUd3Yms4QUdVcFNWd3F3aklGZTNN?=
 =?utf-8?B?c3AxQUx6aEZIZjEvZFZZTDZVUFRrME4xSUZWVUd2SFhwMUxLUlMwelhYaTR4?=
 =?utf-8?B?bm8wZXVzU1JxMldCdk93dTk4dW0rNW1RaFk1Z2E2eURCUy9LS2NWMXlUdzY0?=
 =?utf-8?B?UDVuWTRvaUJ3VXNPakdSaFU5OUFYUnZKU1NYQWhFN1M5bmZ2N3E0RDBhMnJv?=
 =?utf-8?B?VVVWU2ppd1NNRFZUUTNWUDFwaTJ0TGVjckZrME5SczlSZGs4NkNQb1V1bDFa?=
 =?utf-8?B?b2YwbkoxWTA1ak0weFhtMTRUaEdMZXkySGE1QXc5bEpOSnU3VmUvSXNpYS8z?=
 =?utf-8?B?dEpwK2JZQWlGQW5VMDAwVllGdk5WajJ2aXpKT1M2YmFoSjk2SlMvWWRBMlE5?=
 =?utf-8?B?WnhVNEwzOWNZWm5YVzFMRTMvakduUmQ0bUZpRW1EUGJSb29PSWFxd0lRNXQx?=
 =?utf-8?B?YXhTT2tFVnBTbU9BSWFYT0thSjM0YVBXTGVMMStSUVcvNkkrakNuYjRoaGx0?=
 =?utf-8?B?WXd5QURsUkpLQlUwVWtEZGNTNnlRY2ZTbEJadHBnT1NLRktEbEJLVVBjRWhk?=
 =?utf-8?B?WHhjVUpkeDBET2Z6SVFpNkZmN1Q1MDdmbDNNVU9LakllNXJmMkRZY1ZORGdv?=
 =?utf-8?B?NTRwaW9pVElVWEFUaXhiSUtnYnVUTXpPM0E2cTdUOU5UK3FLLzBUQTRNWmZY?=
 =?utf-8?B?L2g3OWV2ak8yWmdaUllaNWtGZnd5WS85VG5rOWdUZTdqMHZnSFVyZU1jSWZH?=
 =?utf-8?B?VG9TbWY1OVlWaDVkelVrQXl4VUloamsvVWgva2RJbVJZa0tJeXE1UmVJNENH?=
 =?utf-8?B?WFEyc29pdVFRYm5ldEhWMTE1aWttdlNQclE1ZXE1bXIrUWFhT1gzSVpYN0RR?=
 =?utf-8?B?MEtWUkRUU0dsaDNSUUFXaHZyYzBnRWRkZHhzWlh3U01OSExIdGE1RkJBandY?=
 =?utf-8?B?dnN4ME8wdWhGTWtMYzhHMjllOXpPV00vZUJ1T0FtWDZnYnN3TEJvMDRvbWty?=
 =?utf-8?B?eHJ1OW40UzROcmVoZEVaVlczbHhpbXdNM2tPQzRMM1NDdFlHbityVVkwNnUz?=
 =?utf-8?Q?siS9ilL72RaF8PFOmdWXyM8=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 61984c41-68bb-4f16-ceb6-08da00da15a7
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Mar 2022 08:03:09.4566
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nEmWI+E9US+wgn0+XnD6yDkvo1GNNUQjDAAyB9Glnxm4PBRcWAOPveS+mXl7oda8Tj8cPhWoSozlaDH+CfULiA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR03MB2623
X-OriginatorOrg: citrix.com

On Mon, Mar 07, 2022 at 06:07:00PM +0100, Jan Beulich wrote:
> On 07.03.2022 17:36, Roger Pau Monné wrote:
> > On Mon, Mar 07, 2022 at 05:28:20PM +0100, Jan Beulich wrote:
> >> On 07.03.2022 16:55, Roger Pau Monne wrote:
> >>> If livepatching support is enabled build the hypervisor with
> >>> -f{function,data}-sections compiler options, which is required by the
> >>> livepatching tools to detect changes and create livepatches.
> >>>
> >>> This shouldn't result in any functional change on the hypervisor
> >>> binary image, but does however require some changes in the linker
> >>> script in order to handle that each function and data item will now be
> >>> placed into its own section in object files. As a result add catch-all
> >>> for .text, .data and .bss in order to merge each individual item
> >>> section into the final image.
> >>>
> >>> The main difference will be that .text.startup will end up being part
> >>> of .text rather than .init, and thus won't be freed. .text.exit will
> >>> also be part of .text rather than dropped. Overall this could make the
> >>> image bigger, and package some .text code in a sub-optimal way.
> >>>
> >>> Note that placement of the sections inside of .text is also slightly
> >>> adjusted to be more similar to the position found in the default GNU
> >>> ld linker script. This requires having a separate section for the
> >>> header in order to place it at the begging of the output image,
> >>> followed with the unlikely and related sections, and finally the main
> >>> .text section.
> >>>
> >>> On Arm the .data.read_mostly needs to be moved ahead of the .data
> >>> section like it's already done on x86, and the alignment needs to be
> >>> set to PAGE_SIZE so it doesn't end up being placed at the tail of a
> >>> read-only page from the previous section. While there move the
> >>> alignment of the .data section ahead of the section declaration, like
> >>> it's done for other sections.
> >>>
> >>> The benefit of having CONFIG_LIVEPATCH enable those compiler option
> >>> is that the livepatch build tools no longer need to fiddle with the
> >>> build system in order to enable them. Note the current livepatch tools
> >>> are broken after the recent build changes due to the way they
> >>> attempt to set  -f{function,data}-sections.
> >>>
> >>> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> >>
> >> The x86 part of this looks fine to me, just one other remark:
> >>
> >>> --- a/xen/common/Kconfig
> >>> +++ b/xen/common/Kconfig
> >>> @@ -350,10 +350,14 @@ source "common/sched/Kconfig"
> >>>  config CRYPTO
> >>>  	bool
> >>>  
> >>> +config CC_SPLIT_SECTIONS
> >>> +	bool
> >>
> >> I think this wants to live higher up in the file, perhaps between
> >> ALTERNATIVE_CALL and HAS_ALTERNATIVE. (CRYPTO, as seen in context
> >> here, imo also would better live higher up.) Or alternatively it may
> >> want to move to xen/Kconfig, next to CC_HAS_VISIBILITY_ATTRIBUTE.
> > 
> > I was tempted to place it in xen/Kconfig. The logic for the current
> > suggested placement is to be closer to it's current only user
> > (LIVEPATCH), but I'm not opposed to moving it somewhere else if
> > there's consensus.
> 
> I guess the main question is whether this option is intended to gain
> a prompt. If so, xen/common/Kconfig is likely the better place. If
> not, I think it better fits in xen/Kconfig.

I think it's unlikely for it to gain a prompt, other options selecting
it is what I would expect.

Will move to xen/Kconfig unless someone objects.

Thanks, Roger.

