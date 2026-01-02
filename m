Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 319C3CEEF05
	for <lists+xen-devel@lfdr.de>; Fri, 02 Jan 2026 17:03:06 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1194953.1513080 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vbhbA-00086y-C3; Fri, 02 Jan 2026 16:01:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1194953.1513080; Fri, 02 Jan 2026 16:01:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vbhbA-00084S-8n; Fri, 02 Jan 2026 16:01:56 +0000
Received: by outflank-mailman (input) for mailman id 1194953;
 Fri, 02 Jan 2026 16:01:55 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=A6FO=7H=citrix.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1vbhb9-00084M-8r
 for xen-devel@lists.xenproject.org; Fri, 02 Jan 2026 16:01:55 +0000
Received: from SN4PR0501CU005.outbound.protection.outlook.com
 (mail-southcentralusazlp170110003.outbound.protection.outlook.com
 [2a01:111:f403:c10d::3])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5a046546-e7f4-11f0-9ccf-f158ae23cfc8;
 Fri, 02 Jan 2026 17:01:53 +0100 (CET)
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by BN5PR03MB8109.namprd03.prod.outlook.com (2603:10b6:408:2a9::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9478.4; Fri, 2 Jan
 2026 16:01:48 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37%4]) with mapi id 15.20.9478.004; Fri, 2 Jan 2026
 16:01:45 +0000
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
X-Inumbo-ID: 5a046546-e7f4-11f0-9ccf-f158ae23cfc8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pYsL3SCApt9VcA+kE+J6TeCTKTJwEaWPPDF+5nHx6N1AZhbhgKSuTp/LVkc2c9FpEtzQS7qb7DDCVnadxicZm33iw5S9TgmoO+iNX73e+ggQFifO5051c8K4+o6E9tjD/vMvzB/LPHny43frC2rpjpVuSDCvWNVQYz+Zoc5ICOzLr5xJOr4XKK2l8GlrLXkZT/ah//16Ds5UnUa4sNj1n+v9ryYXGlA18eE4fo/g9CbbtLIGghS5/XDeJL9REZ0Teg9lMOkNzL0eAhiBqMqlYB0bmURdeN5PMr/vZTf/Y2U3PeuJMtigotTBN6YzreWu5S8FZR38/2w12ZnytZISKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xi7j5Av3isY9OR8MmPvCD7mWUjoTgiijQ5dtf6qQSCE=;
 b=iejWT7+2oRs37O7cA7Ghj4wb9Egw+y5VM9FDtNieXxS+g8i3JDSyMpwdnz+Hvv5igEhkxkleMVVif9+FFmQV7cU60NOQ//DJsxE8rHhY5/jimue/pFUBA7XrLxSfZ8aWB2tuOypPOl5nbJHPxsBa95Xui9AH2infxETPAOE+dHAVVY48nwwJds3hiMsdANKKY7hFRarMWUSiKmXBfJdSRQSzTJevd54IrcMToABHLcfm/785+RqBPWMg22Q5iOoAMj+ESbrYDsKjeRS9J9wFnx/p2eh1c8VhY3Cve6Cj4xAXgze0IzepyVj4Nymq4t5jtBzV4EYWkIQMe958aYl09g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xi7j5Av3isY9OR8MmPvCD7mWUjoTgiijQ5dtf6qQSCE=;
 b=vfM5VXL/8vORw6CigVll0AOn84RwGHnEmAC65OTAtuZ6N/yvq2HrErrNcgCZJKzICqBjsVqukH89pPC++Iv9rA19202eZfWePyLIFHcN0RQWw/M2bhK/p+nXMSmNdCa46GldRqpBXpdZF2ObwldsaC6OKfWjSjEEjATEVVKsKbI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <5b49e965-7e1a-4b04-baa9-c14e2de2e247@citrix.com>
Date: Fri, 2 Jan 2026 16:01:22 +0000
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
 <JBeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Subject: Re: [PATCH 2/4] x86/xstate: Rework XSAVE/XRSTOR given a newer
 toolchain baseline
To: Xen-devel <xen-devel@lists.xenproject.org>
References: <20251230135427.188440-1-andrew.cooper3@citrix.com>
 <20251230135427.188440-3-andrew.cooper3@citrix.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
In-Reply-To: <20251230135427.188440-3-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO2P265CA0510.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:13b::17) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|BN5PR03MB8109:EE_
X-MS-Office365-Filtering-Correlation-Id: 58667c5c-5130-40d9-67c5-08de4a18315d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?Z1pSYktqa2w2c01iNS9sRXdrcWhEZFgrRGtlMkpyWlkzM1prQ1NBVXkxRVBG?=
 =?utf-8?B?SUQ2bzYxaElMa2lFWTVPNkRTTHZNbk5yL0lzMk43MEt5bkVFak1nYW52Rjhq?=
 =?utf-8?B?cU1rVlIzUDJoOXlLYUcwejJkcHM1dW80NTZuNmM3Z2NYekU4K2VJVjhQbG0y?=
 =?utf-8?B?ckhnOHVYUEx6SWJnbWhTYTQ4WFVrNnh1VVd2RnVBRVd4WnRPaVNtNXpwazBk?=
 =?utf-8?B?VmhFK0lUTTRPeXpGMWo0aHhtc2gxSjNiWjVzVzMzb0RoTG81b0dsb3lVZlpl?=
 =?utf-8?B?NWlUcDlOaDlYTWNWYlozbHVSNnZZa3p3Y2lrUVRYb2pvNmtGK1JQMHB1b1B3?=
 =?utf-8?B?b1Z3a25JY1g4NmZtR3NrR1ZZS0Z5bHJyd0g2Sm1wMENhM003bms0Mzk2WnlW?=
 =?utf-8?B?STZKK3p2ZUxzOCs0Ukxud1JpSlVNdGhOUjhKQ24wNEZSdEVNN3ZXU1Ixbnp5?=
 =?utf-8?B?NmYrYkpMRDlGMDFXaHhZbEszeXhXenVNSGdtNE44VURwWmcvdHhVZXRjNDFj?=
 =?utf-8?B?QjgzcVJwa0NCY3dNemlpRXYrQmltcTJxc1hSK1c3M1BNVVplMTE5NzR1aW0w?=
 =?utf-8?B?c0ZCSktzVDAwNEhMVjA5QTVOdVZ2WHB0WEZYV1JmUENCZGRSRzl4OS9qWjlH?=
 =?utf-8?B?MmoyN1hnaWZHQlNhR1R2aC9uL3lHVTRuRHRiZHFDZzZCZjY5Y3JwandHNWwx?=
 =?utf-8?B?WFY5RldSTHpoc0tDT0NoWDFJdzlMSlNERHlxR0NtWGhEbm1ZTG1TZ2Zkc3la?=
 =?utf-8?B?ZW9YTGU3T2hhVGpQZGNEUTVBbU8rckEvbEFyaS9GYS9CQzZEcnpRajJGRS8x?=
 =?utf-8?B?Z0VFMk5CT3dXUzFCYy9TcWVybkxSM2kzNmxmc2FnQXl3aVNOR01ERHpPdi9U?=
 =?utf-8?B?VXNmRFZoOXkzcjlxUUtPTFRiVW5OMHlBaERrRkNiZ3JOU1BYVUVJbURaT0Jy?=
 =?utf-8?B?Ukx0OUFHOStaMFpaRGJZLzc3eFNHbTBUVklpUFVnR0ZQRkloTXhGVndva3p5?=
 =?utf-8?B?eDU5UGtnR2VlampjTllsc0RxMjVXNSszaFoydTltaWxmSUM5VytFZTlxNUdH?=
 =?utf-8?B?NEU1U1hXY3I5dlA4TmQyNHQ5WUpaVm8ySHRSZEFNNlA5OU13bHNPREo2aXhP?=
 =?utf-8?B?bmRqd3JZSG5HTlkzNmZVQWJ0d0hEcGVGaGkxTDQwNHlIOHJ5UWNlNjJFellH?=
 =?utf-8?B?d0pHR2lMOFdZSVpKRnVaWDhCeEV0dnFtUnZWSkt6am9ObHR3eHRRSEtlcUpx?=
 =?utf-8?B?Wm8wcHhhbXNCL0F2N2dTZXB2dzQ1cVo4bjRsU0FEallhcVplbjhBdWJwVk1v?=
 =?utf-8?B?RmlBQ0JHZjd2WnVEU01haFVCS2xzYkQ2cGFRV2FoK01hTFcxUmYxZXFWa2Yw?=
 =?utf-8?B?OGtuQjI4cVhVb3ZsWlNQOU1RdEN5aFc1UTBpQkhLWWEybHF4Mjk0M3FMRUVU?=
 =?utf-8?B?SzFEb3ByR3RmU3ZjOW5GQkNtTHBvVE1pOUZsWWRDZ3U2S2JtdUFGNENaZC9F?=
 =?utf-8?B?OUpTUDdlMXA3WjVsU2JpN1dpRHczeHNLbVB0aEpUWFdpY2JPSDF4ME1KYnpr?=
 =?utf-8?B?dkszOHZtMERaS3hPajE3ZFBDMUY0QVdmSXRlVEgwTWlVNGY5THMrL29TQXNi?=
 =?utf-8?B?U3Z5TTI2cDRXTWNPaFdEVDNuNUxORkdNNzM5NXZmS3VxdU9XUmlTU29haFQ5?=
 =?utf-8?B?VzlyWXphVWhOWXNvOHQrRlBBSUcxb3NEUXNZSU9DaC9raWFWYTBHMk5rNVJU?=
 =?utf-8?B?Z3M1Ly9sQkVKeWZ3L2tQMk1pSlBINlFtMlBwYnUxTG1PTWEzdU5XNkg1MmZC?=
 =?utf-8?B?RjBSTTFaTC9Mb09ZWkRHVTJxR3dUU0xpMEc3TXpZRzJGcTRJNWNZcGROVm12?=
 =?utf-8?B?K0o1Qmwrb0g1ckd1UElqUkEvb2hGeFFXcDR2UTdDZ3U4STA1dlorRXcvZElD?=
 =?utf-8?Q?lajxzG57nnjQQbvjU7lTCqoHqYdvotpe?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bUU1cVR0czBQR1RqbHlBdGowZGgxa2R1VmhTdkpTdDlWSjVleERrMzc4MUdQ?=
 =?utf-8?B?M0h5L1h0b01yZWl0aWs3YkhhaWQ1U2kxcmJnN0Nvcy9wWUVidytIbkljZzFV?=
 =?utf-8?B?Nm9nN2VQL2lKOVZQcnQ2b3M3eVBsQVl4eWwwcGEzY3NydklSRFFZV05GSDlC?=
 =?utf-8?B?WWVyeEMzNFljV2R1V3QzdzVVTEQ4RE9wRjllTFBRVXdoT2c5TFNEZ0pENGYw?=
 =?utf-8?B?cTBjT0VBdWJhZlp3Tm95NC90WXdXVDNFaVNBZnBzMlp6WkJVbHFUc2hlVlFR?=
 =?utf-8?B?U2RXb2dRQWQ0MVYzams0blMzQ1VEUklWMDNTcXhrMGF2c0EydGJERFUzb1Bn?=
 =?utf-8?B?eHFPSXdWUzNyNGNscFkxZzVHbzliU3dCajNCZWdZUnJ0MWZnMXNSdER4cjhT?=
 =?utf-8?B?NWducng0SzhwSHkzdVhuT0dnajB4WFJRRThkbkxKeVpvNFZueG80VTh5ZmJh?=
 =?utf-8?B?MkZWZzM0VlN5MEdFbmhRYWZUVjJSQmtPblFBMnNoV0x3ZmNCMk1XYzJZTDBq?=
 =?utf-8?B?SkhoQ055WURhT1dxck5FNVhZUnFkdlQ3VU5XeW51WWxRcmxEWnhQR2k3YUF0?=
 =?utf-8?B?NnlMZmZIOFpkUGhpNkdyRTFWZ0lkTlFQUzhaMXNucXFDQVNwcjRmb2d2KzRS?=
 =?utf-8?B?U0t3b1BTcjBvNW9abXoyMmJoZ1R6bzViOXZiRzl1VHBWUWRVWnhNR3pOUFBv?=
 =?utf-8?B?OVUwWXZjZFd2UVBGMVViQnJ1TUYwa2NJcUE2ZWtaVkw3aktwSnFwanZzT2ND?=
 =?utf-8?B?M1BaWFdIWVhHTUo1NGtpVTMvZlByclRaQkVCUG5zUlFVaExveU5odG1HRlJW?=
 =?utf-8?B?RE9zSjZybStLK2d6TThhdjlUZ1NaTUJQTEJJbWg0QmxGRHhRWGpUYzRDQWtP?=
 =?utf-8?B?c2Rjay9vUjBlQ0lSbldmQkQ5U0lRVXc1S2ZaMmRBUVpWTWVLWjNLRUtHc2J0?=
 =?utf-8?B?NGhOZkJWUzNmWkFtd09iaW1vNit2Ny9xeWh6NGV1c3RybzFjMks5SHA3K2kr?=
 =?utf-8?B?L0k5ekFnd0JsTTZxVWFjZDZoelFheDYxYTJpYTViRFF4djg3bzg2bEdZU25B?=
 =?utf-8?B?aXJHWDVJVDVhNzBZTzhZeUgyQzlodUNQM3RWTXVDY29ucDc0RGlmdml5SVNM?=
 =?utf-8?B?RXFteVhUZVJRZE1GYWVzd0JZOWpqcFVTNnpjbk1DbFRyV0kzQ0F6aXBZbjRr?=
 =?utf-8?B?QTI0Q1NDZnhyUDdCdmJzNnVYdk9VcE9vL0YxNlY0QWJXNlBYa2ZLSys0QXRK?=
 =?utf-8?B?NXFjdjNPNVFKcVFNcFlZa3hzWm9aQ1pkdUZnejlnVkg3aFgwQmtLZHRkOUMw?=
 =?utf-8?B?SVhJQTBhNlFXektVZUhxQ08wS2RqREtaUml3anBHa3EyUU0xOE44Vk4wcmFB?=
 =?utf-8?B?c0RFajhEVFdDTm1oa0FWSitQeG8vZDk4Q21VcEQrWG9ib0J2M3EyeHhWYmNZ?=
 =?utf-8?B?UWFTNVc5N010K3B3cVZDRXVpdHpaNDRubnlNc296TExHWFZ4dXRxbDZZTWhV?=
 =?utf-8?B?WkpmWlh1eXovblJJSTh0a3o5dWwrYjZ0d3pKR212UnkyN0NQR0dETndlUmVJ?=
 =?utf-8?B?NUdDd0RJRWhHYVFZM1dOb3pLejJuM1hmNVJQV0xuOG9Ka0p2a1R6ZUZWejRm?=
 =?utf-8?B?RjhERXBjTzhybkRCVGhlVys4Nm9PTDdnZ0hEcUFiaC9oK0dqVFZYVGZaRGJ1?=
 =?utf-8?B?YUhONy9RV0hqTmZPM1Y3R09aemdKR2xaengwTjc0WHduVXhXejZXQTdhWUk4?=
 =?utf-8?B?V1o4NlNCQW5Cb3UrQXdjWEhZY3cxYVNoN3ZaQ1Q5d2ozUkxncFNkZFROaERz?=
 =?utf-8?B?d1kwbEp4MEl1YjJ5TitvL1RCQ1B3Y2YzL0N5TmM3QVRFMTN1N2xTSXJwcTEw?=
 =?utf-8?B?ajA2eEdmcGZXK2lCMGRGSDEwU2JoOEtJOE4yajZhZDN6TnNXdHN6WmxCakx0?=
 =?utf-8?B?MG0rYU16V1VHQmlGcUdFSUhwZjgzcDlndDluckZhWjRRWjI5VFcvTWFOUXpH?=
 =?utf-8?B?Z0FYc0hpcnRYV3FYMkswRGpLbkt0S2hJcVY5Q3BSNFV0RXFaSmx1Z2NCa0ti?=
 =?utf-8?B?QkJLbVNkVWlNcHdVc0s3c2NidHdhdGNBdXdaWmROV240WUtWNFpmZFU4UStV?=
 =?utf-8?B?RTlXbW00dHFsQ1hBZE4vRjZ5YzNYSVdzdlp3N3hJRTdiYTRwTzdrajdCMkFZ?=
 =?utf-8?B?cnFhT0dRU1o4bXJwdnZJUTd4TlZ5aWZoMk54elIrb05ldWZTdW8yNUxTd1ZI?=
 =?utf-8?B?dTk2amJRUUVnRktZMjBGNytHaWhqSm5ubkE3cU9kait4Q0YvSmIyNXBYVEhm?=
 =?utf-8?B?SGZ0Zi80aW5hdlZ2ZC9oWDJNcjVGTUUxVllYZ09TVUlIczRJeEh3MFdtVFFx?=
 =?utf-8?Q?YcVovUMd3CdhLu4E=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 58667c5c-5130-40d9-67c5-08de4a18315d
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jan 2026 16:01:40.0089
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: woIm0/bp9n+/g/Tygse2US7FDunMk1GK1clhChhdi2qAfSYygJ4T19cIYZVzpWedWk/L7nLsRSNTOf13SHKXALeAs7HxFCOVcpMHvgRHYr4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN5PR03MB8109

On 30/12/2025 1:54 pm, Andrew Cooper wrote:
> diff --git a/xen/arch/x86/xstate.c b/xen/arch/x86/xstate.c
> index 384f78bd5281..4215a83efefb 100644
> --- a/xen/arch/x86/xstate.c
> +++ b/xen/arch/x86/xstate.c
> @@ -310,21 +310,21 @@ void xsave(struct vcpu *v, uint64_t mask)
>      uint32_t hmask = mask >> 32;
>      uint32_t lmask = mask;
>      unsigned int fip_width = v->domain->arch.x87_fip_width;
> -#define XSAVE(pfx) \
> -        if ( v->arch.xcr0_accum & XSTATE_XSAVES_ONLY ) \
> -            asm volatile ( ".byte " pfx "0x0f,0xc7,0x2f\n" /* xsaves */ \
> -                           : "=m" (*ptr) \
> -                           : "a" (lmask), "d" (hmask), "D" (ptr) ); \
> -        else \
> -            alternative_io(".byte " pfx "0x0f,0xae,0x27\n", /* xsave */ \
> -                           ".byte " pfx "0x0f,0xae,0x37\n", /* xsaveopt */ \
> -                           X86_FEATURE_XSAVEOPT, \
> -                           "=m" (*ptr), \
> -                           "a" (lmask), "d" (hmask), "D" (ptr))
> +
> +#define XSAVE(pfx)                                                      \
> +    if ( v->arch.xcr0_accum & XSTATE_XSAVES_ONLY )                      \
> +        asm volatile ( "xsaves %0"                                      \
> +                       : "=m" (*ptr)                                    \
> +                       : "a" (lmask), "d" (hmask) );                    \
> +    else                                                                \
> +        alternative_io("xsave %0",                                      \
> +                       "xsaveopt %0", X86_FEATURE_XSAVEOPT,             \
> +                       "=m" (*ptr),                                     \
> +                       "a" (lmask), "d" (hmask))

This loses the pfx.  I've fixed up locally and double checked the
disassembly.

~Andrew

