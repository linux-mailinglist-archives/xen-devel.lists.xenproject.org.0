Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DED9376C9B3
	for <lists+xen-devel@lfdr.de>; Wed,  2 Aug 2023 11:44:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.574817.900404 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qR8OG-0008HP-LT; Wed, 02 Aug 2023 09:43:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 574817.900404; Wed, 02 Aug 2023 09:43:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qR8OG-0008FH-Ii; Wed, 02 Aug 2023 09:43:36 +0000
Received: by outflank-mailman (input) for mailman id 574817;
 Wed, 02 Aug 2023 09:43:34 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=j9Om=DT=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qR8OE-0008F7-Mm
 for xen-devel@lists.xenproject.org; Wed, 02 Aug 2023 09:43:34 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04on061a.outbound.protection.outlook.com
 [2a01:111:f400:fe0c::61a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 095db98b-3119-11ee-8613-37d641c3527e;
 Wed, 02 Aug 2023 11:43:31 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by PAXPR04MB8960.eurprd04.prod.outlook.com (2603:10a6:102:20f::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6631.45; Wed, 2 Aug
 2023 09:43:27 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e%5]) with mapi id 15.20.6631.045; Wed, 2 Aug 2023
 09:43:27 +0000
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
X-Inumbo-ID: 095db98b-3119-11ee-8613-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kW/1+cr+StnCQmI79Z9amuALg8WIaLckvPDrgw5Sazr1eD/0QJzgkXX7Ccl11ZMS2SfZfkO/IYASKGB2w0cGQxX1L/S1fWhVr+eJY0S1l2yNpyFBxY4G4gvZk8a3tozdMMCADDw4b+QkZ3qSm2K/L7Wz4S77FkVwXOXC99WONXEkxIEmOooi1WPmZ/3IW6Uod7xa/nnP3WZ2DaCsKShY97a8qV2QtNZkJx/xfASBfDexh7zth3h4Hs4DiJUH8mvl0AnVBeMPw2OjHN5nM8UfNEuovUIaI/BKIlvHBhucG8uuL5hzp3vpzg6OnHra56LSL6ZU7a7LpEWzcaBQBA6RFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xmAn4ea9Ft5uLOmWRqAcascwlZgYJ3Ef4JqGmYRj/ls=;
 b=CrBsktgy4/bSypTGE8TCqftG1qwthlux49uOqR/ldqHKREWfpjVKkoy4cwKaAvhHx4i2RAU36FOA260gvT2GVQZK91XVkOdswfEpjjzPBIa0VZKf8QcRAUfCcOfgoMczAvhDqECmG5/dM+L5Oa9LZr1nIslQD20RtmsK1BitZj1AN1mmCaurcl53+q+TGUv7OY5AwqFv8tpv1wcxdzpiERXKsbcXMHNbdJPKwBwOXp6vOt6ez+QSV6GDUuMJdiSJIZTqu7j72c/BwUUUuW1OP+N32D4jbSKNkXAyG1zTZIE49IR+K48/KzZQIyBVOXXvY8hDNbySMjze6z4nWeU16A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xmAn4ea9Ft5uLOmWRqAcascwlZgYJ3Ef4JqGmYRj/ls=;
 b=47AINLJg5MSJmgKS4NoNG2+L8GrlT80UgTpOL4XDHMBFJZd+c32gXKT6TeS7VVPhO3SgP7+0GK6vHyUmkaEszadxPIptQCYLuyve7p1KJ+Vhi7Z9lDxc4pmHPgS/Ji4B05CHyljstIoXZjy8cfuw6j0tavBwu1Ug4DDaxFk5hHPH85Y/YMLTksHlm87YYEQbpGmt/Ru0kNsg6XssviSBTIlMRBzWUIdZl62mZ3IqTjjtShOrW8+ixmoGuRx31MGGSxTs//bCIBwISU0uSOeb8K6gUbk3dbhdgJl8YQ3XcxF/0gig374GMJaK3mbNGMDUDTKBYicc0kIDuuSICPlmqA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <fd774c2f-d69c-85c4-db0c-b666b7608272@suse.com>
Date: Wed, 2 Aug 2023 11:43:25 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.1
Content-Language: en-US
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Nicola Vetrini <nicola.vetrini@bugseng.com>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH] x86/gen-cpuid: avoid violations of Misra rule 1.3
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0015.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1d::13) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|PAXPR04MB8960:EE_
X-MS-Office365-Filtering-Correlation-Id: 2aa002f1-9978-48be-df23-08db933cec46
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	kyyTl4anwRVoN+WjSnoW+BlMYSrhPFGEuppZIVMLdqC6F2IR+PU0MznfUEwRrObnMCAK6I+3u/pYJpfhrtI43E1q1OttxJUVfXFivWHxdJmnMN3iz3ZzS2d3A+LuA7UlpVZsJFn/bqDTYNfPLkasYgUiou/NO6KTm/xI4uq+urSt3u8MGZYAP0hHKBShhU3Z0J/PsNhp9306bDZ5beECD97eQzoEWcDW8/1FpmBQ/fNQo9N53UqEiO44Xi8O2XASzs+JZyftETO/MfAXnTJWS746wS+KtyNBRNd4zIw5PaFOOOTZ/TRsZKhVkMVuTao0NjsAzQbydgC0TTHLPl665BncuksolXIfmVjtpEZTo5DU/anLhk5nBIabwHj0et4SUm/9uqnYhBkQGSHqPguq4fQaA5vqWTe+O/2gcb3L5tD9J0RDuvzNmKyM/oruNIaSM5foQ9/3CvjLZWnh+wNEwbRY+PMU6EulS20ax4G0V7Z60xVLYDNL22cO+vTXClc/GX6yYmiaAY/gxTuDVZfnJxNHqgUSeSYfMkn0i3BCcxHM+gmnH7why/Kma5p0xdVFAX0+EuOLlbzRVNp0I2EE2Qigp5G/+ZNceHFb3wj/9RTioxadV9B8gFXxtUeoyzRTAEG2IzCG6UwZP7I5Vg/tRw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(346002)(396003)(136003)(366004)(376002)(39860400002)(451199021)(186003)(8936002)(8676002)(26005)(41300700001)(31686004)(2906002)(5660300002)(2616005)(86362001)(478600001)(54906003)(316002)(38100700002)(6506007)(6486002)(66946007)(66476007)(66556008)(31696002)(6916009)(4326008)(6512007)(36756003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VFBCTkl6NTJTOFM3OElFWHExZUdINW1sWXZjNVpwRnFQUERhb2lZVFdndHl4?=
 =?utf-8?B?WVdmU29oQVRCNllYbFdINnVvYjRmM3ZtbkxDSzA0Z0NRSDBJNTNZT2sybmtE?=
 =?utf-8?B?N0dTWUlFR3JGZ3ozOU5mZjcycDh6V0Rwd3BCeWxiUWh5NVNDckppNEV1bitV?=
 =?utf-8?B?Mjl1ZlhHd3dGS2ZaSmRVVS8zeTd2aktVSXo3V2xCbDFMb2xKcmZodFFFNFJF?=
 =?utf-8?B?TFhzRTB5NXIzazIrYTdBWFhEV3Nqbjl3d1RscDMwQWxTOUVsUUxRbmtVVGMv?=
 =?utf-8?B?bi9iVmlBUHJQODVTTkNyd2lSa0o5SXVOVFlQWXE5YTZiM1dWbElFdDU1QXo4?=
 =?utf-8?B?eG1WaEkyTjlvZDNBV2ppTXBhTnpldDNpRmFoOE9YcWJxY214RnM5SEJDS1Nk?=
 =?utf-8?B?djBrbjF2L0NMTExzZGNwV0RaR0RSdVNXcnFRd3Q0QzBuUDVKV1FiUUoyVUxN?=
 =?utf-8?B?UGFzdU1sd0FXYVRWZWd5SC9NNFV6dWhxdXBORVlMeUtzYXJTV2JaUkN0MmdU?=
 =?utf-8?B?T0pBdTNqN08ra1JiNUV2cTF3Q0gxNGlFOTdEUWZ3RnYrRUxrTHRaQi9FMnpL?=
 =?utf-8?B?dkJ0OGM1eFpsMXc2TEtDdmd2ekhwRDF5cUI1c0pwRnBrWHZITUdNTnJiRlp1?=
 =?utf-8?B?MU9NbndqejlQcW83M2VWVmhReURHejZSUm51TW54UHdQYnVJdVVCbFpPSkJY?=
 =?utf-8?B?NUF5a1lwZ1dadUhDaHlMc2J0MURMNUVUT0lWM0YycWwrdXhtdXlMM0tNTEZi?=
 =?utf-8?B?ekZEbzYvRVQvQWQxN1FubG1CUjAwcGsyVVJsUGk5QlZrMnBlRHlyMnl6blhz?=
 =?utf-8?B?bXVDL1l6UzlnaXRCVVpEYlNnMXZvK1hNdU94L3VaZE5QQnFWY2V6VGtiZ2pP?=
 =?utf-8?B?VmNKSnZSQ1gwSit6SGs3M3czSWRhMCtBSWpuRXpCeml0L2VPVHZwdGFJYnFs?=
 =?utf-8?B?QThjWEU4bVpIdmUxTk9XcEFZcFk0WE9CaVVtZzZxSTJaM0hmNm9waTE0ZzJI?=
 =?utf-8?B?b2t0Z0g3SVdlZXhFMGJNaWdTWXI0RUhoQkRXb2hnUjhsQk9lTFd1aVZ4WXhz?=
 =?utf-8?B?Tk0wSEQ0cWtNZmg5WWI5NUhSbFVjcVBlMzJEWHhGYlVVS3RycHBzZDQzNC8w?=
 =?utf-8?B?YVUwVGVUL2F2b2xvSmtmWmZuazQzZXhwWXhvam5UK05RbHVoSmZJV0crcWsy?=
 =?utf-8?B?V1pZTWZTaTVRakhzQ0kySUI4YlEyZnBsM3BUalZhd0NFTmVxemZ6YmQ0WGJ5?=
 =?utf-8?B?WkliQlVTa3Z6T3BaZ0llOU1laU5ibVg4blNWRGlMVk5KUkNhZGU1YzFCbmNq?=
 =?utf-8?B?WkphcTVOdSs5MG5RaytKZW85WDl1UVRwMjI3dFhDSnV6dW8yZ21Kd0RFdTAw?=
 =?utf-8?B?RE1HeVpOTlJxTEVZNWpIdFJGeU44THNtandkZUh0T0hQaWtyTnpFOUtCWm1h?=
 =?utf-8?B?eHJ6SmthRWVIbGdqZUYzNEZ3ekw2NTRFSlRVdmJXZEJmRE44dHp2OU1WUGNU?=
 =?utf-8?B?MWg5bEpWVVVGRlo1RCtENmIzajhFSS9iU0RsRGUvMjRIVW9jOWIrQ3VBR244?=
 =?utf-8?B?UnJ4bk5xZ3E1VlpuLzFZRUo3ZTcwNEozeG5KaGJoOTZMSEhLQTg0Qm9rT2Mw?=
 =?utf-8?B?OVhBRS9vTnFmZDEzV0VtWkVVVExxRmJDbmxiZ2c4akhBMUFVTFlaQ2ZDekM3?=
 =?utf-8?B?L3hNUDJzRGVMTGlYcjFLTU1ldWp2Nmd3SVI5OGZZVUJpWUVPRDdnODFTbzV2?=
 =?utf-8?B?VHlxdGFGVmpZNDBVeG1SN1pGaUVqQit4WkRBdWRlRi8raERCNjZNWE96YUFS?=
 =?utf-8?B?Wm9zNTNudG04SkkrbGZyUlFpRUpFREUvZ3QzRm1vUHIwYytYM3NEZ1Z4ZThr?=
 =?utf-8?B?RVZHeW5kMFVmVlBpSnRDSmVNWTc0UkVaWStabldjYlJBWGJTZjZQOE9kV0tJ?=
 =?utf-8?B?L3RSdUZMTU1ERllIRWZKSDZjMGF0aFNuY2xPTEd6QVR5bzZtcWdSamlIL29G?=
 =?utf-8?B?VzVEZ21lUW8xdkxwT0lZSUdKaHFWRE1DeHEzOVIvamdCWDAyQ2VEb0QwL2VV?=
 =?utf-8?B?OTBaTmU4YnFCRW00TTVJM0J2bnJ3Rjdob0JEZmFJYnJHcjlCa0Zhb0RZZGVV?=
 =?utf-8?Q?yMICvfgpJ162KU94HeqevrJag?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2aa002f1-9978-48be-df23-08db933cec46
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Aug 2023 09:43:27.5893
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GQrTKhFo8drt6AymAjNymJfszicIf+gdGYjpBcmaLaR9zuUcQPRqdjw0T5q36w/7qdvbgax27eU6tMh4MSZIPw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8960

Structures or unions without any named members aren't liked by Misra
(nor the C standard). Avoid emitting such for leaves without any known
bits.

At this occasion also add the script to the X86 section in ./MAINTAINERS.

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -601,6 +601,7 @@ F:	xen/arch/x86/
 F:	xen/include/public/arch-x86/
 F:	xen/include/xen/lib/x86
 F:	xen/lib/x86
+F:	xen/tools/gen-cpuid.py
 F:	tools/firmware/hvmloader/
 F:	tools/firmware/rombios/
 F:	tools/firmware/vgabios/
--- a/xen/tools/gen-cpuid.py
+++ b/xen/tools/gen-cpuid.py
@@ -367,6 +367,7 @@ def crunch_numbers(state):
     for word in range(state.nr_entries):
 
         names = []
+        empty = 1
         for bit in range(32):
 
             name = state.names.get(word * 32 + bit, "")
@@ -380,9 +381,15 @@ def crunch_numbers(state):
             if name in ("APIC", "OSXSAVE", "OSPKE"):
                 name = ""
 
+            if name:
+                empty = 0
+
             names.append(name.lower())
 
-        state.bitfields.append("bool " + ":1, ".join(names) + ":1")
+        if empty:
+            state.bitfields.append("unsigned int empty_" + str(word) + ":32")
+        else:
+            state.bitfields.append("bool " + ":1, ".join(names) + ":1")
 
 
 def write_results(state):

