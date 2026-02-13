Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ePlfAdltj2mYQwEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 13 Feb 2026 19:30:49 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 528B0138F3A
	for <lists+xen-devel@lfdr.de>; Fri, 13 Feb 2026 19:30:48 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1231644.1536721 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vqxvx-00023b-U9; Fri, 13 Feb 2026 18:30:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1231644.1536721; Fri, 13 Feb 2026 18:30:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vqxvx-00021L-RE; Fri, 13 Feb 2026 18:30:29 +0000
Received: by outflank-mailman (input) for mailman id 1231644;
 Fri, 13 Feb 2026 18:30:29 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Z/W2=AR=citrix.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1vqxvx-00021F-3j
 for xen-devel@lists.xenproject.org; Fri, 13 Feb 2026 18:30:29 +0000
Received: from PH8PR06CU001.outbound.protection.outlook.com
 (mail-westus3azlp170120001.outbound.protection.outlook.com
 [2a01:111:f403:c107::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 10509a3b-090a-11f1-9ccf-f158ae23cfc8;
 Fri, 13 Feb 2026 19:30:26 +0100 (CET)
Received: from CH7PR03MB7860.namprd03.prod.outlook.com (2603:10b6:610:24e::14)
 by MW4PR03MB6379.namprd03.prod.outlook.com (2603:10b6:303:11e::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.11; Fri, 13 Feb
 2026 18:30:22 +0000
Received: from CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343]) by CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343%4]) with mapi id 15.20.9587.017; Fri, 13 Feb 2026
 18:30:22 +0000
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
X-Inumbo-ID: 10509a3b-090a-11f1-9ccf-f158ae23cfc8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bh9Da2Qtb2bKijI3XsXo9fCX9fYzHnWXhQEfDHabcANQLYOK8FZEbb7Ut5l9wSSjF+aIf0G8h/Aleip2/AxvXsxK2hM9LDD7Y3WJcMbV5Q49FV37Hf0oarr0TajRG6bcDF418OzJCyIq8vbb9y26jbUdSTPJfH9ulMRo+QEG9RY9MW24FB0tS33BtHB9jiK0J6P9pgGR+8rAHBZlIjdZdBFGBfqQEnWS10OVZGWd97yaYfzseZTDLqH8sHVnk3PGwo+7Bh6V0exyVBIYwmwAQsAukHHl3/JT9XrhxGtASJCHd7YdxEM9MesZ1I58lWb+lrynC9uf+T3nzFfHEA9ZMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4vmO6QHuz+sL8Fav308qwPIEi45MlodPL7zNWc4BqI4=;
 b=RHrZTTe3lFJdAvuTd6qmXoSR9Gwse8SRO1HQNNprTx8nerf94tZ9Nz5z3l3dmK8Ghg73ddkyRswiokSZfcVsBjyqYjomYmAAOT10pjPyNZrxF2dYIGsQHcX0HfaKfSiM8OdpZwBTibxkNzbzypVnrXTZChPqBfWVPjrFkzWjHy2M0x5+Z2YaLjmhQqbzg5vdvTUXFih8Y4B9VdoFxhq+N1Txm48qBSOE1V+2fVJ8DL0/AnsjBR+6NRoC0uP/W1nJhjfPiLZdGJy2sSNWdnESxMOfUzeFP8EhwqG4oHt/6vTmCewoNGMQKK1zrqZadiWr3KD5Luc302P1YZKf04+m7Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4vmO6QHuz+sL8Fav308qwPIEi45MlodPL7zNWc4BqI4=;
 b=jLnLnhru6DKx22FN8d0yuSinT9CqnF7D+UsRqx8z8YBRwebIMqdZZ3doI8YzXg/UBEwUK/cWgWliNYWejtoeSvilIuyEIxLx5GtZrCbfxq/nR1DYrA/8NjFSoef4fnXnnRc/+xyX7DwV93Um7vOgR3H+/MgZpwrVrFLLQ3gz7Lg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Fri, 13 Feb 2026 19:30:19 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Alejandro Vallejo <alejandro.garciavallejo@amd.com>
Cc: xen-devel@lists.xenproject.org, Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH 1/2] x86: Make hvm_enabled a constant unless both PV and
 HVM are both compiled
Message-ID: <aY9tu1f6T8lsFap-@Mac.lan>
References: <20260213133732.132326-1-alejandro.garciavallejo@amd.com>
 <20260213133732.132326-2-alejandro.garciavallejo@amd.com>
 <aY80qJVIZOjjqBOS@Mac.lan>
 <DGDZWSLET8UI.3AMV83AW7Z3I0@amd.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <DGDZWSLET8UI.3AMV83AW7Z3I0@amd.com>
X-ClientProxiedBy: MN2PR07CA0011.namprd07.prod.outlook.com
 (2603:10b6:208:1a0::21) To CH7PR03MB7860.namprd03.prod.outlook.com
 (2603:10b6:610:24e::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH7PR03MB7860:EE_|MW4PR03MB6379:EE_
X-MS-Office365-Filtering-Correlation-Id: 3d0aefc3-827c-45cf-c5a0-08de6b2df269
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?NFpTeTFCVGVUYk1LY09wWlU1TTlUb0R4d2pqQk8wZ2Y5VW42MkdhZW9UdWhy?=
 =?utf-8?B?QUQ2dnFFd0Jhb2c3OWRrZXFUN0ZtNlNxRVpzeVpSRmN4ekVyZWkyWDZ0dW5T?=
 =?utf-8?B?WkJwUHNwcURIWGFneDd6eWlVTlIyRWx0WlBFUlNUdjNLWEVqem14VG5FcXpZ?=
 =?utf-8?B?Q2J4L0VvNzBEcm9ZMGFZeVBlT0lodXdNZ3hFV2tnUkNtZElCYUJFK0VTd1RO?=
 =?utf-8?B?SnNtRzZIWDlyREpoZ0NEcWxYa29UWFRJN3Q5YnpZVUhDVzEzMEx6QkxSRkds?=
 =?utf-8?B?RUI5cXNTTG1oQVFPNFNINVEwOGdvRGJhc3BudFFvdE5WcXlIUklHdWJPTSt1?=
 =?utf-8?B?dWI5SHpGbk5Hdldic00wa050S3l5UVV2cVY0N0YvZjRBWWl4VWp3a0xTdy9t?=
 =?utf-8?B?RXVoWUtZUUp6eUJrcDBrR0p6NEQ3MXFyZGMydzFQd3Q5YXhjckJSdndTcmRG?=
 =?utf-8?B?RnJaWHpPMENwc1pJakc4L0o2UWhCQk5aejIzOE5aZEk4YytLU0VUb0dGQzcx?=
 =?utf-8?B?VHBxSlJQOENxaHUrSklUQ3IxTEZVdUZscTlZREZVZ1lUQmtGWDdnMVhZbm5U?=
 =?utf-8?B?eTVGQW1HNkY1eXJuSW5wSkVzV1RDcnZ0bEJOaENlMzdCclFjaThYZ3JycHJM?=
 =?utf-8?B?YmtZZ0YxckdrSm9UbmxwanlSZ3JOTGZQVmdjY0xHKzlLazZsYlhnSVRtNUNw?=
 =?utf-8?B?M0FLNVMwbFpubGpObXdVR0dDcWlydVVsc3F0OW9Uemt2bVZEalRsNlBPc2Jq?=
 =?utf-8?B?NnpSNXBnc0hpWGFLMjltTVFaUC81K2pobTllbFVuelVPT1hIS3lyeEFiekM2?=
 =?utf-8?B?MFNuN1lFbW1CTWJ5UXJuYkovS3NJaWNxU2ZZM0VmbXIrU3c1WkdtRE9Zd0dM?=
 =?utf-8?B?VTFOSGt5T3FUM2hpMWUzbGw0QW1JTmJvRllIN1I3ZFB1bGtmbWh5Ly9kdTdV?=
 =?utf-8?B?SUpQMVh1Z0VnSjFQMGhMcG9QaXFuTDRBSEJNa3doTzJlQUdGWnNYRlZZZUxY?=
 =?utf-8?B?QXI1QUdveWVLVnlzY1JaR2JxUFNVU2lsdGNMYUtGU1UwK1ZpR0ZGZExnOHl0?=
 =?utf-8?B?Rk9ROE9tKzdiOWpKYkZmenpXRTNSajlJb01uclRoVEpFdWpiTUEwbWNMckw5?=
 =?utf-8?B?Qi9udi9RVTg2cFB5bGRGcXpLbmpENEF5dDRXRWYrOGgwajB1NW1qQlBBbG9X?=
 =?utf-8?B?eDU3TFZMMVBVNndPOThmTWJMYi9ENHJTM2hrNDE5VWdNK2JiU2thRTdMUDF3?=
 =?utf-8?B?djl6cHJxMWlMYUt1RlI2NTNpb2N5a3FvN0lHV2Z6cUM5b0t3YUxPWDVNLzQ5?=
 =?utf-8?B?N0ZzRE5qMEVPSzZCeElBbVVnZ3N0S21DRGRFeVc2UHZsN240Wmt3SDdrR3J0?=
 =?utf-8?B?Wm0vdFVxb1NoeDBGd0NqVXJWY2JyTWFNMVA1ZHVzTksyVERkMWVCYlh6MldP?=
 =?utf-8?B?K1lEQ0c3RVlEbUJtbEptUXRKVXlTSDRCTFBQbXZRckdMYmFxR1NiaVVXd25m?=
 =?utf-8?B?bExYWW5WUjdEUklwbTRsWFQxUnl4S05TVW5PbmwyN0hYQllJTGwzMk1RM3ZE?=
 =?utf-8?B?aGpoK2JoYTd4YUZYSUFpdi9SQnAyR0U1a00wK0ZMdi9NRk5yallpNCt3aG9W?=
 =?utf-8?B?bGJOZnByQlJmRVJna20zN0pBeUczaGE4dTJLTmxJUDduL0w2Q2hkTWJYeFhQ?=
 =?utf-8?B?YlUxZHBJSDhHVjNNaEFzdlk2UVBMWCtYTWtwbnBOc2ZPeVd2VklCU2t2bVd3?=
 =?utf-8?B?VHZlY205bVRuOTJUUGtnbS9TaXJjM1NQbXp4TlVzMS8wY1h1K1dhdGI1cEdP?=
 =?utf-8?B?cW5RcmtjRis3V2hSWTc4REdlbWlBV0FDdHRhbkt1cC93Rlk4OElEQ1J6cnUz?=
 =?utf-8?B?cTZBQXdBUEVJdm8rcmhBNzROTm1lVzVSWk9xRGQyQjBlY1NtUmhpckJReVNl?=
 =?utf-8?B?ZnRsbTUxM1dBWmpuUjhWTDdsQmU5WVlqWkpLeFJMUlFxU3ZZSVl2dkw1ZS9r?=
 =?utf-8?B?OURNWlJESmt0OS9PV0tPblRGSENuSDgzeGh2aXQ3UTdkNk51Wm1aUkNBRU5h?=
 =?utf-8?B?M0pPNmpvNWZjejlXbTIyVC84OHc3dFdhQXVDd2NTOHNXNTN5M1hRUW1JTkg1?=
 =?utf-8?Q?rKTI=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH7PR03MB7860.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZEZacVlOTE5iODMxckZTdmZnNEkvQ1ZSdGZYNUxFVnRHVFRsQzVWUTBtbDZ3?=
 =?utf-8?B?UGpreG5BQm9XK1VBWEg4S1pWTU9mR1l0Y3V4UjcrUVRadzRBUzdka2REZzh3?=
 =?utf-8?B?L01BZTdnOEZSNVdhTWtBQ0lHVTRqeE5XMHVWM3NwRnd3dmNPTXp3QUk0SXA0?=
 =?utf-8?B?ck9WQTgyUXFHTlREdGJjakFhTmJScnd0VnZrT3hUaXNoTWFqc1BUOEYyV0dN?=
 =?utf-8?B?MFlhSzQzVTduWDNXei8xWDdEUmpRMmVqWWVjSGE0RzAzVWI1N1NucWNwVTU5?=
 =?utf-8?B?OWpMY1dJeVZwUHhyYTVGdVdGdHlidkMxQmpmeGxDV2I5L0Z5eUp6bnVwTWVM?=
 =?utf-8?B?N3dGbVdNSEM4cjIzQ21yTFY5OTV5MnRQci9PZEwyUUl4dmhwNnp3Tnhmbjdp?=
 =?utf-8?B?QVIzNW8xeWtlQnZsdlYzeitzQS85cVRQclFvcXNqWm9vdmVNTzIvUG1iY2hm?=
 =?utf-8?B?R3JEUGRDTWU5WTE0K2VJR1R3c3l4a0lPUmw5SXkwcGxEZ25QMTF5Q3g0YUJX?=
 =?utf-8?B?ODFld3BXZ1FoUDBVc3lwTE9UeE96ZHdCNDJnVDhxc1NuOEdnNE1pQTRGU1VO?=
 =?utf-8?B?SzRrdTd6MFhtTFEvWHpOcXJSbEZaYWJ1bUZSaGRudE5qK1l4Y045a2pmU3RQ?=
 =?utf-8?B?SDh5cGVURFhzcEo3RDNxT2o0TnYybjgwQ0o2RWJvKzlIUWNLeGd2L1FPdmlw?=
 =?utf-8?B?R0FRVjkyaUprQmVBZWkrTHNkQkJXTEs1V29iL3Nwd3ZlRlVaREdRL0FZVzF3?=
 =?utf-8?B?K0hadXVOenRuU3pGK0RlQ054S0xpcmMyMStQMmtzSFlxOXR2dVRIRE52Mk4w?=
 =?utf-8?B?RWZ2ekw2TmpqbFMyRjRNVUdHakh4NHVDL0tQZ3o0K1k4MXdvcnVBTU93eW16?=
 =?utf-8?B?MWhYNHRHZzlQTVkyZzhFeGdjRWJMV0krV2lDSlZmVU9pSnJHNWF2S1cvS05T?=
 =?utf-8?B?bjN3NVdQcWxGMXpaeTM1T1hsZjJBYVNsTUg0Q3RNbFdmZUhDczFvNUV5T3VF?=
 =?utf-8?B?R01nc0Y2NXJDZ1dBcm1iMStOYmxPdWduUkRQU3ZycVFVcG1kUFJvOTYraUx1?=
 =?utf-8?B?YTNTbDhOV01NTGZlUi9vdC9rSnQ5dktEWHNTUlNSK1ErN0JqNGw5MVQxY2sx?=
 =?utf-8?B?UnVEbnJhOEUzOGRjQVBVcHVVNGJuZmFJaTN1S0dBZUxwTWN4WHplQWlnZHRJ?=
 =?utf-8?B?N2NYY1JiOHRxUUg4dC9BWHVQV2E1d0VWNGYyRVI1aDB1MlI5RUN3bEUvMjVZ?=
 =?utf-8?B?RVlac3RMU2JHQnRnTkRaNDRONml5cGVFZzR2bEt6c04yN3FOV1pLT0hxeTMz?=
 =?utf-8?B?L2w3a3I3S0VCMkdIMWpJTXZQYXZFVU5rQ1FDaTNJdWp3RCsyajBtL0U1bExj?=
 =?utf-8?B?TW1qVGJuaC8ybTdMSEhycUk5U2kvUHJsenZpQmlmS1pZL0xiT054eHRJL2xE?=
 =?utf-8?B?MDRJV0pZY09Mb1pOdUNtVHlHUHZ4YUdRaDdRM04xZkRXcHNWWTNmY211b3hM?=
 =?utf-8?B?TThSRlkrTzdlbmdFZG55TTVweXBiTmwyckxUdjlPZUNrSk5zT1JxeTJkYjlM?=
 =?utf-8?B?RVdwNEZlRWgwWUFzRGdIWXNaaUdiOUZKRnF1Q2FkYllmUzhOTmJzWTk4bkhv?=
 =?utf-8?B?TEhiOEs0aUVRbm1LVG81MjFMZ0tZRFY1OFc4QVdVVUpib0p3aTVsVVhyY1I4?=
 =?utf-8?B?dHZiRXJTMmYzSDBXRDdPMGF6UVllVGZ4S3RENTRqMnVPeGl0enJvU3Bzb2Q2?=
 =?utf-8?B?RS9wc2dlVWNic0t1QWx2ZUVjcWJTbzVkR0YyYnR2SndkeDZ3aDhHTUVTVTNq?=
 =?utf-8?B?dmVsNGpTZ1NXVWduNU9ac1JGVCttcW9rQXo2RDIyS2xXcTlBRUdsZTZLSFZS?=
 =?utf-8?B?S0o0TzlEb1NBa1p2d01JYXNLWUV4bXluSG85QlhyM0k5MnVHN29RNHJVTXpG?=
 =?utf-8?B?QkJSV3Nvei9TbVplV3dHbWNaYm1zVHJBTENoTGowOXVMcnM3LzdkcU5NSXg1?=
 =?utf-8?B?NERpYVM3WldXdkdWaFdTQ0NVU0thVWVjYTBpL0s2TFpzclJDRDMwQ1pwcFc5?=
 =?utf-8?B?N2orcDl6ZHVudjRQSyt5blJRZGliSzF2MW9VRXNaMjg5UjN5czhTUGtJTkpM?=
 =?utf-8?B?RGJ6NklUTkZFSEJRcDlzYSsyMHBnR1ZOYzlrS01LL3owbVBGajFzcjhVKzMv?=
 =?utf-8?B?RXJYckVmOFlPWHdlUGpSdys4ZHRlNkJaeTAvTzVYOVBiYmJGMlRSY3FtUG9P?=
 =?utf-8?B?SE5Zb0lZWnBscnlEMjlsWVJzYjd6RFU3ak5oZVlma0EraCtjeXkzNWJySzBJ?=
 =?utf-8?B?RHpRYzJVWEtvTW9TY0VlRGlNT2VkUXRnVmR0dVppeHk1aWtjVldyZz09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3d0aefc3-827c-45cf-c5a0-08de6b2df269
X-MS-Exchange-CrossTenant-AuthSource: CH7PR03MB7860.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Feb 2026 18:30:22.1432
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UfvE6uvnFU1Gxb5PezXI/amcXwUvSsfnLXn9Lsy6PY8caaw5zkyigl8SO5z+arQ6UrSfacxaiDN1Nei0toNfqw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR03MB6379
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[citrix.com:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:alejandro.garciavallejo@amd.com,m:xen-devel@lists.xenproject.org,m:jbeulich@suse.com,m:andrew.cooper3@citrix.com,s:lists@lfdr.de];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	DBL_BLOCKED_OPENRESOLVER(0.00)[citrix.com:dkim,Mac.lan:mid,lists.xenproject.org:helo,lists.xenproject.org:rdns];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 528B0138F3A
X-Rspamd-Action: no action

On Fri, Feb 13, 2026 at 06:04:33PM +0100, Alejandro Vallejo wrote:
> On Fri Feb 13, 2026 at 3:26 PM CET, Roger Pau Monné wrote:
> > On Fri, Feb 13, 2026 at 02:37:29PM +0100, Alejandro Vallejo wrote:
> >> PV-shim already has hvm_enabled optimised to false, but there's no
> >> reason HVM-only builds can't benefit from the same optimisation as long
> >> as we add a boot-time panic in case HVM support is missed. Many branches
> >> go away, some in the potentially hot switch_cr3_cr4.
> >> 
> >> HVM-only:
> >>   add/remove: 0/1 grow/shrink: 1/9 up/down: 1/-162 (-161)
> >>   Function                                     old     new   delta
> >>   arch_do_physinfo                              79      80      +1
> >>   hvm_enabled                                    1       -      -1
> >>   symbols_offsets                            30732   30728      -4
> >>   symbols_names                             108029  108022      -7
> >>   symbols_sorted_offsets                     60656   60648      -8
> >>   flush_area_local                             571     562      -9
> >>   switch_cr3_cr4                               311     300     -11
> >>   init_xen_cap_info                             62      43     -19
> >>   arch_sanitise_domain_config                  885     863     -22
> >>   init_guest_cpu_policies                     1270    1247     -23
> >>   hvm_domain_initialise                       1127    1069     -58
> >>   Total: Before=3797004, After=3796843, chg -0.00%
> >> 
> >> With hvm_enabled const-ified, it's fine to take hvm_flush_guest_tlbs()
> >> outside the CONFIG_HVM ifdef and remove the stub. They compile to the
> >> same code after DCE.
> >> 
> >> Signed-off-by: Alejandro Vallejo <alejandro.garciavallejo@amd.com>
> >> ---
> >>  xen/arch/x86/hvm/hvm.c             |  9 +++++++++
> >>  xen/arch/x86/include/asm/hvm/hvm.h | 30 +++++++++++++++---------------
> >>  2 files changed, 24 insertions(+), 15 deletions(-)
> >> 
> >> diff --git a/xen/arch/x86/hvm/hvm.c b/xen/arch/x86/hvm/hvm.c
> >> index 4d37a93c57..da56944e74 100644
> >> --- a/xen/arch/x86/hvm/hvm.c
> >> +++ b/xen/arch/x86/hvm/hvm.c
> >> @@ -72,7 +72,9 @@
> >>  
> >>  #include <compat/hvm/hvm_op.h>
> >>  
> >> +#ifdef CONFIG_PV
> >>  bool __read_mostly hvm_enabled;
> >
> > __ro_after_init?
> 
> Yeah, seems to have been missing originally

I bet __ro_after_init wasn't available when this was introduced.

> >
> >> +#endif /* CONFIG_PV */
> >>  
> >>  #ifdef DBG_LEVEL_0
> >>  unsigned int opt_hvm_debug_level __read_mostly;
> >> @@ -173,9 +175,16 @@ static int __init cf_check hvm_enable(void)
> >>          svm_fill_funcs();
> >>  
> >>      if ( fns == NULL )
> >> +    {
> >> +        if ( !IS_ENABLED(CONFIG_PV) )
> >> +            panic("HVM support not detected and PV compiled-out\n");
> >> +
> >>          return 0;
> >> +    }
> >>  
> >> +#ifdef CONFIG_PV
> >
> > CONFIG_HVM I think?
> 
> No. CONFIG_HVM always holds here, what we want to remove is hvm_enabled being
> present when CONFIG_PV is _also_ present.

Yeah, Andrew already noticed that.

> >
> >>      hvm_enabled = 1;
> >
> > = true;
> 
> True enough.
> 
> >
> >> +#endif /* CONFIG_PV */
> >>  
> >>      printk("HVM: %s enabled\n", fns->name);
> >>      if ( !hap_supported(&hvm_funcs) )
> >> diff --git a/xen/arch/x86/include/asm/hvm/hvm.h b/xen/arch/x86/include/asm/hvm/hvm.h
> >> index 7d9774df59..dc609bf4cb 100644
> >> --- a/xen/arch/x86/include/asm/hvm/hvm.h
> >> +++ b/xen/arch/x86/include/asm/hvm/hvm.h
> >> @@ -261,7 +261,11 @@ struct hvm_function_table {
> >>  };
> >>  
> >>  extern struct hvm_function_table hvm_funcs;
> >> +#if defined(CONFIG_PV) && defined(CONFIG_HVM)
> >>  extern bool hvm_enabled;
> >> +#else
> >> +#define hvm_enabled IS_ENABLED(CONFIG_HVM)
> >> +#endif
> >>  extern int8_t hvm_port80_allowed;
> >>  
> >>  extern const struct hvm_function_table *start_svm(void);
> >> @@ -399,6 +403,17 @@ static inline bool using_svm(void)
> >>  #define hvm_is_in_uc_mode(d) \
> >>      (using_vmx() && (d)->arch.hvm.vmx.in_uc_mode)
> >>  
> >> +/*
> >> + * Called to ensure than all guest-specific mappings in a tagged TLB are
> >> + * flushed; does *not* flush Xen's TLB entries, and on processors without a
> >> + * tagged TLB it will be a noop.
> >> + */
> >> +static inline void hvm_flush_guest_tlbs(void)
> >> +{
> >> +    if ( hvm_enabled )
> >> +        hvm_asid_flush_core();
> >> +}
> >> +
> >>  #ifdef CONFIG_HVM
> >>  
> >>  #define hvm_get_guest_tsc(v) hvm_get_guest_tsc_fixed(v, 0)
> >> @@ -498,17 +513,6 @@ static inline void hvm_set_tsc_offset(struct vcpu *v, uint64_t offset)
> >>      alternative_vcall(hvm_funcs.set_tsc_offset, v, offset);
> >>  }
> >>  
> >> -/*
> >> - * Called to ensure than all guest-specific mappings in a tagged TLB are 
> >> - * flushed; does *not* flush Xen's TLB entries, and on processors without a 
> >> - * tagged TLB it will be a noop.
> >> - */
> >> -static inline void hvm_flush_guest_tlbs(void)
> >> -{
> >> -    if ( hvm_enabled )
> >> -        hvm_asid_flush_core();
> >> -}
> >
> > Is there any specific reason you only pick hvm_flush_guest_tlbs().
> 
> I didn't try to remove more. That one was the only one with hvm_enabled in the
> static inline so it seems easy to pick apart.

Oh, I see.  That one already had the hvm_enabled condition in it's
non-stub version.

> I just tried compiling and I require very few additions to make the build
> compile without stubs. I'll send another version with the adjustments needed.

OK, I think if we could unify them that would make the header smaller
and easier to read.

Thanks, Roger.

