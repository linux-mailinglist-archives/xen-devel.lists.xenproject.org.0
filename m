Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D3C66A6E24
	for <lists+xen-devel@lfdr.de>; Wed,  1 Mar 2023 15:16:35 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.504079.776597 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pXNFn-0003pW-6d; Wed, 01 Mar 2023 14:16:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 504079.776597; Wed, 01 Mar 2023 14:16:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pXNFn-0003n2-3d; Wed, 01 Mar 2023 14:16:23 +0000
Received: by outflank-mailman (input) for mailman id 504079;
 Wed, 01 Mar 2023 14:16:21 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=4Y5i=6Z=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pXNFl-0003ms-T4
 for xen-devel@lists.xenproject.org; Wed, 01 Mar 2023 14:16:21 +0000
Received: from EUR03-DBA-obe.outbound.protection.outlook.com
 (mail-dbaeur03on20610.outbound.protection.outlook.com
 [2a01:111:f400:fe1a::610])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a30ef07d-b83b-11ed-a550-8520e6686977;
 Wed, 01 Mar 2023 15:16:20 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by VE1PR04MB7472.eurprd04.prod.outlook.com (2603:10a6:800:1b2::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6156.17; Wed, 1 Mar
 2023 14:16:18 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b%7]) with mapi id 15.20.6134.030; Wed, 1 Mar 2023
 14:16:18 +0000
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
X-Inumbo-ID: a30ef07d-b83b-11ed-a550-8520e6686977
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PD2zKouV/2tRNGaGhvUKuCUDUZSB6ly3AevVWsIMllMerlI9yxlcAXVLo/VeNDJUqtmx6bH2YrgDXFhIE44KPYTYQCdUq6/izcF7gXhzhlnKI8KINIduBptafvTyXDv62YBCYzw2ThQBSwxfCsz4CCSV29rEsEkUEsMJ0QKYsgn6C4DUHNZNh3BCPcUzzxjoGb1UudMkj7b8PMApzkGKyJ0CNkiwiAcvjMvroqC2FZYTA1T/Fw8xFMK1VGIcPZsDBiFmAStYXO0w3AMVft/krD1HmFw5Qz+ShTJkEUO/ifulNEoI51DxWi7OaXOvFpTAwYoF7q3X0jn4LyaxurokRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iQmpice+5sckSeA5x6akdUtFj8Q7q5+kgi6PYcZXzxg=;
 b=Qa7nF5kG6B32onb9BO9IrHH2xVKvP2eD1Om6hg+kCyCXZbEdT0TUWth9Q5EEMzOnCYyGeKHvBQE9T9rpGU3scuvBUD1k7YDB9BIv7Vpp3BSKwnPbBJ3cEF1lPd7hzcgEbQMEN3R+dc69QKvZF5BkaSD+vqrA2HQxdIE8OrURvhH9Oj14nn6lMo75+9Z4HJpdcy6dcXOGqIlbrIdDyXGArJLvP5nuuSFmn1r7vfGRviKwSm+VA66pehRHlMhc7qsqXiV/7CaiH+JKVHLsnZtxPNyJMkZjYpAxtYFA+pzmaWCf+gtpXCW8o/zQyz0Nfptsj75sy24Qlm4bn6NDnzvXGQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iQmpice+5sckSeA5x6akdUtFj8Q7q5+kgi6PYcZXzxg=;
 b=ri5sQCW0pFefj2PMqAfD7B0luPgUM+EjjvNldMa2JnG/3eDAgtk2msTBUcIQXifp5nA4Y5PoUPV8ikJuIawu+ccfM6+KM1IzDZzJxhT1AGfJXGPUJ+3asdnbvdplYSYxipMMs4eVxA7OL+H6WAivfac4O8/YKmTC6NzDNyvQHCQMjSKb0amHnybwieWPGXxey2Ei5+yKKVrb+jlZxloGc0h9my34/hTnTeSwJhkB/MfhKEaTUhiJZLe5TD+weQsp/aztTC/Lynrp4yX3DGn0ylihOyaQqZGgP0kJv4AmSwjzX0PfDy+OBokWwML1AlFWfMGiasuwOxRGoPMcVgZg4w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <763aadc9-e8f1-dbd5-4bab-edaeeb36334c@suse.com>
Date: Wed, 1 Mar 2023 15:16:17 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: [PATCH v2 4/4] x86/pv-shim: suppress core-parking logic
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>
References: <da5f5bac-6d5d-092d-d872-f1120dcd2661@suse.com>
In-Reply-To: <da5f5bac-6d5d-092d-d872-f1120dcd2661@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0190.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a4::8) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|VE1PR04MB7472:EE_
X-MS-Office365-Filtering-Correlation-Id: c6cc50b4-e4a9-4d67-81da-08db1a5f869f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	kLKJZfaCsdcyUkAYvLiNbEUAXrVBJ7IwU8GR90LCYtzWziRCga5JNT+olzoxYzeG1S2QKbrsF2Wg+N9GRM+auOzyKwpYC5KdsDiwnB7yjL8Ihu4mtXE/XxONGGqJph90enZjaAHoB669hQWbX+EXJEPK6sQ1t8W92S1yW4dk7S98y3OrYJBbiLrXwR6Uil9aK8dxqtDGbQE4OsA6zcng9xkjm2osKpbCjFh4f0QpTeZuBCA7Z6AY30h3dMrT/iTP+csm+DuLBBdqKzHEsHCsNEXdHF0mzTyo+oFr2FuXXlIdeIYP6Wred/7tp1lyXVbcwpQO3V/uGWjZ/e9yxd4oEH0cr8hE2+9VjZBxYbY9HtZhMwTi6K4XVOlCD3gULr6P5HvdFg0lYIvJFE2K3btO6/cvCXaowpLsRSbuw4nzxQkFgxhQHTAFx54tLP5oo2Sf7qhQu5gB7DqvN3eNm7BacdKDXNkq/U8AJykx8i5H6iZX2QQxWTZoEwp9L4AQE0/2l/Jg31zmWKkMxg40Iq+gbOwMxb9NesgycPMv0GWMnZSAQjwHw2mI+m7FkAG03goIeJ2dwzPoYs9DQvkU/yk00DlYcqgRK89TcmKPhnTmxjrW9aVoiFXYwLjWcnHlWiBHfGJHRFT52VZw3k0bKXD4FffWpw1BQpqmzqc1L9D7r+CM2vVQVKWqXnkipWr4faqs3nZxX2/8uT0o3VXCpttAimuzNnnGIYNkOqN++O+hVK0=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(366004)(136003)(396003)(346002)(39860400002)(376002)(451199018)(38100700002)(36756003)(86362001)(31696002)(2906002)(4744005)(41300700001)(66946007)(66556008)(66476007)(4326008)(8676002)(6916009)(5660300002)(8936002)(2616005)(6512007)(26005)(6506007)(186003)(54906003)(478600001)(316002)(6486002)(31686004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SHRYU0ZDaXJCNTk0Q2M5dnZVMEROR04vd3NFdEUyc3kwbVh5UjNMSlltOTA5?=
 =?utf-8?B?TVozUzB1ZEFoUVlNdGROdHF1eFcySXM1NDRiS0VvdEpuR0lvMksrQThlV0RO?=
 =?utf-8?B?RFlERUhjRXJxa280WU9aaUVtazRwaythYUNnazRLdjZVSUYvdkR2aGtqenRz?=
 =?utf-8?B?Z3ZtQ2xVSkR4WnRDOHlFY3d6WHVlc3lJdmZvWkRGeTY5dGZjeHkrTDUreFNE?=
 =?utf-8?B?anBjMHBXUnZtMFlMVzZOSEZGZHBxd2Y5NmdFdWZyV3lrQ1BLYmVzbXh0WlBj?=
 =?utf-8?B?YUNEcmt6dndmUnFyK0t0eGJkMkxQd1hzQ0lhR2N3N2dkTEM5NFRUWXRIZE1B?=
 =?utf-8?B?bHptVVhBZkFOVjQvT1hUZDJwdExuaVZVTzFsbXBWbm9DMTJIeFVRcm5EbEZJ?=
 =?utf-8?B?ZElCZDk4U2dXQ3FTY3pPOFM2RG5uWVFsazFaZmdTN1NtRFI1ZkdoRnV2M0VM?=
 =?utf-8?B?RnhwTmRWSUw3R3ZUYmdlY2s5Tjg0bmN2M1JxblJUdmVaMzNUVmgrbnlZUE5X?=
 =?utf-8?B?MWtlOGFWV1J0Q1hyUnhCaFBzd2E5Si9QM0NLUE9NTzRLYUVnTUc1QlNlOTQy?=
 =?utf-8?B?aFh2YjZvc3B0aSs5R2JTb0I2SnBxSVdxbHdaTGFteU5sZ2ZDdzJDbUpxT3JG?=
 =?utf-8?B?TmFwWGNlYzFrRm5DZ3Z5M2RNdWpXSWlrTWVBZ2I3Vm9ZSWJ4U2p0a3F5WTRC?=
 =?utf-8?B?ZzVNcFJZSTY3LzJ2VjA4VUl1d3pvOG9NcXRHOVdEUWFIbUtUYXdDekNWa2FQ?=
 =?utf-8?B?ekFkcmJnYkxKRzJMWEhYRUZNMDdVN3FrNmY2aXBmK1NJOUZzQ29kaHZIOWtS?=
 =?utf-8?B?L2RZczkrTS9NOXBvSVFiWE0vazU4T05TRUlYRndxdittd2RPUWNoV2YzNHY0?=
 =?utf-8?B?dlYwZWdKcTVwbGNidTU1MGFOMG9DU1lYMkQ2SFpVZ25sS1lKblVnVG8xbW1q?=
 =?utf-8?B?UUpwRkI1c3B3WkYyUlpVNjdCSTVaaUV1NjZoK1I0U3BhVGpMQTFjTTFpRVNv?=
 =?utf-8?B?L1c4NXExaE1LQ0FkZzVEaHpMTlArNGJ2eDZUWUc5L1FPREpqaHNZTExWd2NO?=
 =?utf-8?B?VUdtVGQxRUZvdFl4NmtWbFpuMFkvaDZzRGU5dHk4QktyeXcrTFg2YlJpQ0lr?=
 =?utf-8?B?dGxGbnNXS21GUE02NGQ3V1A0YTFwQkhOeTd1YXZka1c1a0YwdE1aWjc1ZVVh?=
 =?utf-8?B?cG9LQjB1TVVYdDFKMnlxdUNtMjRpNHgvS3A0T3R0QWxYaTZKLzJmcTZRWmJL?=
 =?utf-8?B?MXJsUWswUWhZMWRseVdrSTdWcmZrSTkrTmpDWnBSZFRDVFlMMzhEdFQvQk9B?=
 =?utf-8?B?cFZnSTd5Njl2RzZjTWErejVFWU52MUJ2ajhiRE9mc2dWank3K1NWZkN2bTNh?=
 =?utf-8?B?Tmx3bElod3NGSDg3SVF4SW9KMHBTQ0Nhb2NncFpQSzhZUUIrYXZJbFU5ZXVC?=
 =?utf-8?B?bEs2dHE3Q0NhekVtKzdGRldjTkFLZjI2K1lwMW41ZjVPdGZDVGU5czg3RHQ2?=
 =?utf-8?B?MFN0SlVITWxncG5Xay9SeWVyOGZuQkdJSUtVQnAveWNXZXBuR3B0dWR2MStr?=
 =?utf-8?B?anphUWpFZ25CNkFtQmVDQkY4TUpZSGpGS2xnMVd5N3dsaFNCWHdFTmJkWWxR?=
 =?utf-8?B?K01Edmh3d3dvV2ZZNm5VeHV1K3RWNUViQnBMcGNKdTB6cDNuYlorckZ3K1VN?=
 =?utf-8?B?UktGSXJiRSs4RjdNRWJSc0pCL2NzL2VyOGRTSXI2c2s0cFMycEtGQXRmRVcv?=
 =?utf-8?B?Yzd0bTlUZk9WdzRUem9OR092RkVqMkx2eXRkczNMQVk5T2cyVGloZ3lWMEtX?=
 =?utf-8?B?VlJoOUhVL2Nwb09nVjlzbkJSMHpyaUlLV1UrSzhLWlVhaHMwMHZxbU9zZmRM?=
 =?utf-8?B?a1FIR0pqelJqMjRvSlBBbW1WVnVDQVRSUXc0TVd2MlVoTDkzTkU1MGhUNW0w?=
 =?utf-8?B?VVlYcnlSR2xSMnNKM2hpMU5pcWY5cmd5bWlEaWJUYlRacUpLUDRDZ01haTVY?=
 =?utf-8?B?QWxjK00yVndSODJubHRjNGhoUS81WHc3bDhvdzBlMnBwNU54MkM1R2ZIZXpO?=
 =?utf-8?B?VkZpNEVxN0dmczl0ZERxbjAxQ2d3VVI4aVV2UlFCZ00ySEFmSjZ0SlNCeW14?=
 =?utf-8?Q?NU9+n1Axzl6a/2WrHZ2pQpP+Z?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c6cc50b4-e4a9-4d67-81da-08db1a5f869f
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Mar 2023 14:16:18.7747
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: d4da8k+CM3Iz79A8xnapDVql6kTiW3gVp+lKG5g8cVgoaL+zRidjFUqwlhI2qlTlyOhKc4qLRc/qkThezVludQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB7472

This is all dead code in shim-exclusive mode, so there's no point in
building it.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
Depends on "core-parking: fix build with gcc12 and NR_CPUS=1".
---
v2: Use UNCONSTRAINED.

--- a/xen/common/Kconfig
+++ b/xen/common/Kconfig
@@ -10,7 +10,7 @@ config COMPAT
 
 config CORE_PARKING
 	bool
-	depends on NR_CPUS > 1
+	depends on NR_CPUS > 1 && UNCONSTRAINED
 
 config GRANT_TABLE
 	bool "Grant table support" if EXPERT


