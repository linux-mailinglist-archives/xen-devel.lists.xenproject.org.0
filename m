Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DF1DAEEF53
	for <lists+xen-devel@lfdr.de>; Tue,  1 Jul 2025 09:02:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1029397.1403140 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uWUzG-0004G0-HW; Tue, 01 Jul 2025 07:01:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1029397.1403140; Tue, 01 Jul 2025 07:01:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uWUzG-0004Dl-DN; Tue, 01 Jul 2025 07:01:02 +0000
Received: by outflank-mailman (input) for mailman id 1029397;
 Tue, 01 Jul 2025 07:01:00 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Z0vH=ZO=amd.com=penny.zheng@srs-se1.protection.inumbo.net>)
 id 1uWUzD-0004C6-Pj
 for xen-devel@lists.xenproject.org; Tue, 01 Jul 2025 07:01:00 +0000
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on20615.outbound.protection.outlook.com
 [2a01:111:f403:2413::615])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 21aa605e-5649-11f0-b894-0df219b8e170;
 Tue, 01 Jul 2025 09:00:56 +0200 (CEST)
Received: from DM4PR12MB8451.namprd12.prod.outlook.com (2603:10b6:8:182::7) by
 MW4PR12MB6707.namprd12.prod.outlook.com (2603:10b6:303:1ee::9) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8880.30; Tue, 1 Jul 2025 07:00:51 +0000
Received: from DM4PR12MB8451.namprd12.prod.outlook.com
 ([fe80::b04e:2da5:7189:4c4d]) by DM4PR12MB8451.namprd12.prod.outlook.com
 ([fe80::b04e:2da5:7189:4c4d%5]) with mapi id 15.20.8880.030; Tue, 1 Jul 2025
 07:00:51 +0000
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
X-Inumbo-ID: 21aa605e-5649-11f0-b894-0df219b8e170
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Dcp1T7gdUk4pFG7fvEGpvi04SrOu9je3lbHAhPHWKhBacYQWexVWe8gHLE4ntbpciMVkqwQ8uVx3qW+gVpWF7m7Bu4QIsX3NjLg07vNGhtRQkVEcabcsV2js6jfR6O3s5+aX4wBqx7Aiv+oPCaGTi3lllW+WqNqI4UG1dCxfx8z7qkPMH33kx+hShx8tDbzce4PTPdM01zccd/y9iUiAsH/QRqdxmb81+eV2w2HF39wPMX8wVxIhP9vB3iqemDk424BYS7LTwhE1rgavwj/7jlHABZWW2gaEZbL9jolRmZa88hGofX74FJEwMIXr5PBrp3cE95lIqSUwTYp0xm2MfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kEUv1ZWIeGGooNj2uDNlrgXHGb6w/npkf1K6iJxpjog=;
 b=oZzLlKD9UGoZ8pe5q2Q+6764u62jXE71LZVpFhKBQn7Xx7MMLwTUDDjCHkgSfAu+2G91MjoIFIpq+RlYAJsZk7KgdeJ65pPQzeQGVTTBCawaVfPKWoz7USxcnnNwmB3TiAN/HTKpxl8pQMFtvOzYDlHjFk7NOu2rVxAHbsr+R4sU66mo9Eq1sY3ORL0p5ahKaxWggmyaLRcxZSDlS+2WH2HawupOn3ROal9xcZ18XveIZvlIwr57BYDLtwumTZmW0HPemlnBLcAvIK75bPIvfLTlOOXlc0QE7S6iK4xilkMm8OEr9bes9TIESsNHMtrts9+HFRPyKPVkeybD1Ka5Tw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kEUv1ZWIeGGooNj2uDNlrgXHGb6w/npkf1K6iJxpjog=;
 b=r8h4yF/9M6Cl6LfaKw1VZroeCYvz6d81jDJprjoK6OVPLEdGPlkz/VUH+ZVeM973fdkmOKomaLRJoFL38fHXKUlsNjmF08Q5ihTE6urUheZGpgNVF7v7+TcBfbtppQxxcVGyqaWn1kkOAPYspRu8ua5qOI5XXG2xVrH+rcyvTHI=
From: "Penny, Zheng" <penny.zheng@amd.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "Huang, Ray" <Ray.Huang@amd.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?=
	<roger.pau@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>, "Orzel,
 Michal" <Michal.Orzel@amd.com>, Julien Grall <julien@xen.org>, Stefano
 Stabellini <sstabellini@kernel.org>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
Subject: RE: [PATCH v5 01/18] xen/x86: remove "depends on !PV_SHIM_EXCLUSIVE"
Thread-Topic: [PATCH v5 01/18] xen/x86: remove "depends on !PV_SHIM_EXCLUSIVE"
Thread-Index: AQHb3onGLG6LJWqQlUiKXaQTdnvWjrQbcqIAgAFvnXA=
Date: Tue, 1 Jul 2025 07:00:51 +0000
Message-ID:
 <DM4PR12MB84515AB588A2DF0C6AF451E7E141A@DM4PR12MB8451.namprd12.prod.outlook.com>
References: <20250616064128.581164-1-Penny.Zheng@amd.com>
 <20250616064128.581164-2-Penny.Zheng@amd.com>
 <a4244940-8c03-4391-8078-7308d6a3fcca@suse.com>
In-Reply-To: <a4244940-8c03-4391-8078-7308d6a3fcca@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
 MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Enabled=True;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_SetDate=2025-07-01T07:00:41.0000000Z;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Name=Open
 Source;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_ContentBits=3;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Method=Privileged
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR12MB8451:EE_|MW4PR12MB6707:EE_
x-ms-office365-filtering-correlation-id: 067aa518-419b-4390-84cb-08ddb86d03f5
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|376014|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?alZVa2dUV3Nsc3dTNFlvU21oR2UydjhINkpzcEUrMktVekJiWlpEanhaUXgv?=
 =?utf-8?B?bVo4am0vQzV1bXBRQnpETlVtcnFkR0ppa1hJWGhJTWJFc2w4dHFjMWF2VDlI?=
 =?utf-8?B?THZTUUZOTTNIVGcrRGdpQW9raFFKT0ZNeVljYVc2TUU3U016cXJjQWxJOWtI?=
 =?utf-8?B?ZEh2QytQbHU4RHRKcVFFc0htUXllMURubEF6V3lxWGFGUWxjUDA0MXJYVkVr?=
 =?utf-8?B?OUF2YVdKQXVRdFhhUDFoTUhtQ2kyY3ZjaGtzZXRCNHdmZ1M4bnlkZ3FUcko4?=
 =?utf-8?B?UnZHdWRwck85VVFCUVBOc2IwUW1UVnRtVUZnRjVkNzVCam9NUjJ6RDFMTENs?=
 =?utf-8?B?VGJQZUlzYmRTZ2FiOGNEeENCSUg0YWUvQUkxTGtoM0d4YTVrbjdFSkxqS0ZX?=
 =?utf-8?B?dG9VTDAvaVN0ZjNaUlRBTkc0ZG1pR2kzZUVFQllGU05DV0hCcUdnYU1LbUFR?=
 =?utf-8?B?bGpndkZZelRvdHV2QTlPMHdIS1VQcWNaYm1HTm5Ka0IvdmRlWUIwaTFGL0sv?=
 =?utf-8?B?dVpZWnJtRloxZldqSEMvb2FSaHpDNE9GclhadHhhY2IvODNvY3ZCcUtGcVNG?=
 =?utf-8?B?Sm5LaFc2ZUttaWFPM1hoQ3hncHRvK1FvNlJpdEk5V2hHckoxRlpEbkk0WGJI?=
 =?utf-8?B?OXo3OUZBNDRwT3IyVmdrWEVZSEJyanJ1R3MxUEFtbE1OUDRQQ1owbk1BYnFY?=
 =?utf-8?B?d2huNDVpeVhrcldjbTFvR0Q1eWxQc3NDKzhvZThTS3JucFQ2eDZqU0ZiWG16?=
 =?utf-8?B?Tm1YUEYyRlB3czRKbTIvWEg3dTdpdWFvWnl3NTBlcnBnZkxncVRmTjNLeEh4?=
 =?utf-8?B?MTlQeERpMldZSFJUVzMxNnZQZXhneXVSVnVKYXdJU21SNlBuNVY2MVl6NitF?=
 =?utf-8?B?Ym1hZ1hSTVhVdGNDczA4UXVYbU9TTFBFSWRJVXJKT3JQNWFoVFhUaGw0SW1S?=
 =?utf-8?B?U096aGFyWksvNWdVYjFQMURyaGdOVE9Uamw3bkVuOEREdmR1VFpDWU5DbjRK?=
 =?utf-8?B?ZXMzc2NoSGhlUHllUUdjZE9PeWdaS2JCajQrTzNlenYzczlsZUxxSmhnbCtC?=
 =?utf-8?B?UHdwcEZpNUlzd0VhMUNXVFlFY2tOWksrZWpmTjNCSlM1SnJNd2R6aThHdE1M?=
 =?utf-8?B?emwwRGR0Y1dSc2tuaVJacWNVV1NPZSt4L1cwOTRkRjZ5Sld4QjZ2bTJhQWJz?=
 =?utf-8?B?V0JSUUExTSt4YmU5em9mMzJKYlpXOTJPS2JldE4vb0tjUGZBRDZmSDU3T2xp?=
 =?utf-8?B?M2RZOXlCczNiN0FCSDByWVlubklQcmhMaXZtNjNiaDBLbThnd2ViQXVNN2JJ?=
 =?utf-8?B?Z3JiRG5GOENucTB5SFRpOEpiTFFTWFoxbEJsTDNRZnhBT2pIclRRMW1qQU5B?=
 =?utf-8?B?YmNvVjUwT1lsWVc3bk9KWTlNcDdOVzlzd2c1V1A1ZzdBK0tzR1ZzeUIvUkNu?=
 =?utf-8?B?alBNb05SK3hkYVkvTkNzUVFxV3ZTWlNVRWwrVm05ZU93R0g0VlhFS0JyZGVr?=
 =?utf-8?B?WDV0a3MvUzJuaTIzWFNvUHIxMk15VWhRVWxsQWFlK1ZLbFg4TG1IWGYyRjNE?=
 =?utf-8?B?bXNGTHR3Vi9lb2dlalJkS3hzMngyaEdXVzVldTdXVmxwekl4RXVhQitRYlZz?=
 =?utf-8?B?UUY5TS8vODd0Vlo1ZW12T2xiQk84bXk2Y2ovVHpzWGUxcTErNkhucEZtd052?=
 =?utf-8?B?N2NvQzlxNU9NRHl2S0hWajZhckpIY0ZQSmxZUUtYOFhRd05SUzZNTTVVb0ZW?=
 =?utf-8?B?aFdJenBaaHZjRGhsTVo1dzFiV0Z0Q1RndUJWM2RpWHQwRzBXbU53NW9vMDN6?=
 =?utf-8?B?Y1I1b3RobkVPaFg5UDRCeW9HbUMrZGFWdm5zSjl3YVRhSXpVRE9BVGNxYndq?=
 =?utf-8?B?QkNESjZDWEplSHkrZXN3aVBWVHlReUpDS0hTNllRZVIxaVVha3FBc1c2L0l5?=
 =?utf-8?B?Yy9zaEpqZU9lb3hBdEZERnRIWmFVQjYxTTRmNW1IOWRoODNEVFp5ZVF3Qko5?=
 =?utf-8?B?dk1BV2JBZHR3PT0=?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR12MB8451.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?SGNTUXZ2czVUY3IzbEYrMHhPeGZianVCMU5oS2xqNjNJTmhjSkdxSm5BdmtU?=
 =?utf-8?B?NTdicWhuZzBRY1BWUVJwMHB2MUZTcHlVSDhQRXllZGZtd2Q3Rjk4Yk5pb0lx?=
 =?utf-8?B?V1BZNXFEd2VVd3pQWlQ5Umx6K1lLc1M0TC9qcHJlWEFpcWZGL2Riam0wb3dS?=
 =?utf-8?B?anhGNE1wZC9pbFgzdSs2SWFsMjdacG0wUE1RUFdOdWZCZE11K1RvOVdjR0Zy?=
 =?utf-8?B?Z1FUY3IvUlVxQzVjQjFmUzZUb09kc0dnaENFK00yOURzZWpSY3I4ZzRaT1Vh?=
 =?utf-8?B?MVJPZ2ppSVc3eFRhUXVrV1k1a1NIZWl4MGdHRm1aSFlmNFdpNFB6dU1tQWht?=
 =?utf-8?B?bVhQZXBpYmtTakprem8yczNDZzFGcW80MjhmaE1pUkVnSG1Ta1J3MGdsWCt0?=
 =?utf-8?B?bndVS0wzYWJBWXJveFlkZnAwT0tGZmovei85cjNKdTBSTi8zdW1YNkVyR2lS?=
 =?utf-8?B?cFRoZTR5cWUwMDRSZXFxdHh0ejltbzdaVFJEaTZOT0Qxb0t5cXgwWjBoSTNJ?=
 =?utf-8?B?WWxpWkNyWlRsS1FETG5ublgwdzlueXVranEzMGdqQzNJOVRFTFY1MDdDNHk2?=
 =?utf-8?B?NVRmdWVtVkE5Uk5ueW5jVi9NcUdlRmY2VXZxdE5icHJqMGR3WVZCSWJaNW4z?=
 =?utf-8?B?K2Z4ai9qY21hdjFtSWl4aWtiNkMzR0pScjc2eGQ4VHFQNmdjTWxoZDhoU0oy?=
 =?utf-8?B?OXh3L2VuemVNWEoxbDZjZW1penEyMHo3WnBld0wzY3FsVjhsME11QWZhVmd1?=
 =?utf-8?B?dWZrbWpkcW9DYlFFenFnYThBelg0WVBKN2RGVWhlaGVsVVhXaXZlaG9EQ0JQ?=
 =?utf-8?B?ZzEwd3kvZmJucklNOTQyZ0VsMUFCL0hVV1FhYlNIbUhHVWpzWkhnUm13aEVp?=
 =?utf-8?B?RjVKTGdiZGlmSkJvRWczZFRpbGg1Uk5tTGhBYnFBbEJYd2FXeml0Z3hTaU93?=
 =?utf-8?B?UXhMWnNDaEVxYkpTcFV5U2xla0Ftb25MYkhYQjJ4TE80ZU01dzhuc3d5aHNn?=
 =?utf-8?B?NUFPWWJ0RDZoR3Q0bndBczVQSE1wVVl5UGtuZ0tSTEFuMlQzcEVIMnRtSnp2?=
 =?utf-8?B?LzZQckpXR0ZSYkg4dU84aWkrdzRCekpCS25yZGJTRWl0aE9FY0Q0MVhWSXV4?=
 =?utf-8?B?R1o5Syt5d1BEQTI5a1N6MlVkVXowcjZtWlNyYWFSNFlSRE9QaGlmMWxWTFo4?=
 =?utf-8?B?S2YxVXpNTFQrcTBqUzFBYWtBczU1OXBxa2kxY0I3TzUwWWt1MWdUZFpBdVFD?=
 =?utf-8?B?Ykt4V3M4MS9DaytadVduSkhuakt6VmdjU0ZQWmRzdXBoS1lVMDd5Qk1uTjhh?=
 =?utf-8?B?UTFtUE1hWDRIdXJmbHZNaHVKSzlWMnY4RXFwTUVyNDV6REl0Qk1MOUV2akY3?=
 =?utf-8?B?am5iZVVObVNOZ0phY3VyOWZMTE9DWXhTSHh3cndxNXI2OWNvdi94SGFEcmVh?=
 =?utf-8?B?MDNLUTJmR1FCVThpWlJTU3MvOWFQa2hzakRMYUcrb09iODFDMkpXUlZ6eEpi?=
 =?utf-8?B?aHpVN2ZuMktTOGtDbUZQeld0WUl3QTVJNDRqMXNZMFZwK2RTbktDUlZrN1B3?=
 =?utf-8?B?c1doL2hpNHJ5bmhKOG1nek5kUCtLMlRFWmJUMFN2RWxQZ0F6REQ3VlkydWZ1?=
 =?utf-8?B?SHNTSnhqZlhSQXMxZ0VvY2krbGV3WkNHUjU3VEl2VFM0NVR1VlI2WDd1L3Iw?=
 =?utf-8?B?M2hKY3F5aUdBekRCNExZV01IbkZzOGp6WURFelYzRHQ3UWh1aVB6bGFhSkxv?=
 =?utf-8?B?K3ZaTkVLQVdKSG5xOFhVdm84Sml3VWhqeGdaRm95NDVOSE5sK1A1aWdkOXIr?=
 =?utf-8?B?VFJHTjBQbVE0Nm1ERTR6YW9tck5JVXl6azVTbVNxNmFna1lKaFVDbHd4TW1x?=
 =?utf-8?B?TlNUSEhOKzAxQWVSTFgrelJHZ2tmRGlROUc5T1paSVp4UlNHNDZleWNsazJz?=
 =?utf-8?B?WHJoK1JvQnhuWng3RmtsNHFzY1J2WW8rd05QNG1GQUJGZHllZmxRSk5LNmg3?=
 =?utf-8?B?VVA2SFNLMzJMTTdqNEFBcVQwbnlpSmQ5TysybDRQRExWQ01MUUFPUWRaWk5x?=
 =?utf-8?B?Q0JjdnpTSktOeHltWmhuMzI2RlFYaE10VUpsbi9VY202KytGeGgzSHdudWRF?=
 =?utf-8?Q?++/o=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB8451.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 067aa518-419b-4390-84cb-08ddb86d03f5
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Jul 2025 07:00:51.3495
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: TxacbBrm0roWCLNqESsn/YEfgpxxkWydbx7csaTg3yiw6nr/Z6d34BVu3A9pfScE0GrN7MUe0Hz9K47iK+oJRA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB6707

W1B1YmxpY10NCg0KSGksDQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTog
SmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPg0KPiBTZW50OiBNb25kYXksIEp1bmUgMzAs
IDIwMjUgNDoyMSBQTQ0KPiBUbzogUGVubnksIFpoZW5nIDxwZW5ueS56aGVuZ0BhbWQuY29tPg0K
PiBDYzogSHVhbmcsIFJheSA8UmF5Lkh1YW5nQGFtZC5jb20+OyBBbmRyZXcgQ29vcGVyDQo+IDxh
bmRyZXcuY29vcGVyM0BjaXRyaXguY29tPjsgUm9nZXIgUGF1IE1vbm7DqSA8cm9nZXIucGF1QGNp
dHJpeC5jb20+Ow0KPiBBbnRob255IFBFUkFSRCA8YW50aG9ueS5wZXJhcmRAdmF0ZXMudGVjaD47
IE9yemVsLCBNaWNoYWwNCj4gPE1pY2hhbC5PcnplbEBhbWQuY29tPjsgSnVsaWVuIEdyYWxsIDxq
dWxpZW5AeGVuLm9yZz47IFN0ZWZhbm8gU3RhYmVsbGluaQ0KPiA8c3N0YWJlbGxpbmlAa2VybmVs
Lm9yZz47IHhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZw0KPiBTdWJqZWN0OiBSZTogW1BB
VENIIHY1IDAxLzE4XSB4ZW4veDg2OiByZW1vdmUgImRlcGVuZHMNCj4gb24gIVBWX1NISU1fRVhD
TFVTSVZFIg0KPg0KPiBPbiAxNi4wNi4yMDI1IDA4OjQxLCBQZW5ueSBaaGVuZyB3cm90ZToNCj4g
PiBSZW1vdmUgYWxsICJkZXBlbmRzIG9uICFQVl9TSElNX0VYQ0xVU0lWRSIgKGFsc28gdGhlIGZ1
bmN0aW9uYWxseQ0KPiA+IGVxdWl2YWxlbnQgImlmICEuLi4iKSBpbiBLY29uZmlnIGZpbGUsIHNp
bmNlIG5lZ2F0aXZlIGRlcGVuZGFuY3kgd2lsbA0KPiA+IGJhZGx5IGFmZmVjdCBhbGx5ZXNjb25m
aWcuDQo+ID4NCj4gPiBTaWduZWQtb2ZmLWJ5OiBQZW5ueSBaaGVuZyA8UGVubnkuWmhlbmdAYW1k
LmNvbT4NCj4gPiBSZXZpZXdlZC1ieTogU3RlZmFubyBTdGFiZWxsaW5pIDxzc3RhYmVsbGluaUBr
ZXJuZWwub3JnPg0KPiA+IC0tLQ0KPiA+IHYyIC0+IHYzOg0KPiA+IC0gcmVtb3ZlIGNvbW1lbnQg
Zm9yIFBWX1NISU1fRVhDTFVTSVZFDQo+ID4gLS0tDQo+ID4gdjMgLT4gdjQ6DQo+ID4gLSBleHBs
aWNpdGx5IHN0YXRlICJDT05GSUdfeHh4IGlzIG5vdCBzZXQiIGluICJwdnNoaW1fZGVmY29uZmln
Ig0KPg0KPiBXaGVyZSBkaWQgdGhlc2UgY2hhbmdlcyBnbz8gTm90aGluZyBpcyBzYWlkIGFib3V0
IC4uLg0KPg0KPiA+IC0gQWRkICJkZWZhdWx0IHkiIGZvciBTSEFET1dfUEFHSU5HIGFuZCBUQk9P
VA0KPiA+IC0gcmVmYWN0b3IgY29tbWl0IG1lc3NhZ2UNCj4gPiAtLS0NCj4gPiB2NCAtPiB2NToN
Cj4gPiAtIEZvciBub3QgYnJlYWtpbmcgYWxseWVzY29uZmlnLCBjaGFuZ2VzIHRvIGRlZmF1bHRz
IGFyZSBhY3R1YWxseSBub3QgbmVlZGVkLg0KPiA+IFNvIHJlbW92ZSB0aGVtIGFsbA0KPiA+IC0g
TGVhdmUgb25lIGJsYW5rIGxpbmVzDQo+DQo+IC4uLiB0aGVpciAoY29tcGxldGUpIGRyb3BwaW5n
IGhlcmUuIEFpdWkgb3ZlcnJpZGVzIGZvciBhbnl0aGluZyB3aGVyZSB5b3UgcmVtb3ZlIHRoZQ0K
PiBkZXBlbmRlbmN5IChhbmQgd2hlcmUgdGhlIGludGVuZGVkIHNldHRpbmcgZm9yIHRoZSBzaGlt
IGlzIGRpZmZlcmVudCBmcm9tIHRoZQ0KPiBnZW5lcmFsIGRlZmF1bHQpIHdvdWxkIHN0aWxsIGJl
IG5lZWRlZCBoZXJlLg0KPg0KDQpTaW5jZSBJIGNoZWNrZWQsIGJlZm9yZSBhbmQgYWZ0ZXIgdGhp
cyBjb21taXQsIHJlc3VsdCBvZiAibWFrZSBkZWZjb25maWcgcHZzaGltX2RlZmNvbmZpZyIgZG9l
c24ndCByZWFsbHkgY2hhbmdlIGZvciBhYm92ZSBvcHRpb25zLCBzbyBJIHJlbW92ZSB0aGVtDQpJ
J2xsIGFkZCB0aGVtIGJhY2sgdG8gZW1waGFzaXplIGludGVuZGVkIHNldHRpbmcgZm9yIHRoZSBz
aGltIGlzIGRpZmZlcmVudCBmcm9tIHRoZSBnZW5lcmFsIGRlZmF1bHQNCg0KPiBBbmQgdGhlbiB0
aGVyZSdzIHN0aWxsIGEgbm9uLSJkZXBlbmRzIG9uIiBjaGFuZ2UgbGVmdCAuLi4NCj4NCj4gPiAt
LS0gYS94ZW4vZHJpdmVycy92aWRlby9LY29uZmlnDQo+ID4gKysrIGIveGVuL2RyaXZlcnMvdmlk
ZW8vS2NvbmZpZw0KPiA+IEBAIC0zLDcgKzMsNyBAQCBjb25maWcgVklERU8NCj4gPiAgICAgYm9v
bA0KPiA+DQo+ID4gIGNvbmZpZyBWR0ENCj4gPiAtICAgYm9vbCAiVkdBIHN1cHBvcnQiIGlmICFQ
Vl9TSElNX0VYQ0xVU0lWRQ0KPiA+ICsgICBib29sICJWR0Egc3VwcG9ydCINCj4gPiAgICAgc2Vs
ZWN0IFZJREVPDQo+ID4gICAgIGRlcGVuZHMgb24gWDg2DQo+ID4gICAgIGRlZmF1bHQgeSBpZiAh
UFZfU0hJTV9FWENMVVNJVkUNCj4NCj4gLi4uIGhlcmUsIHdoaWNoIChhcyBpbmRpY2F0ZWQgYmVm
b3JlKSBpbW8gZG9lc24ndCBiZWxvbmcgaGVyZSwgYnV0IGF0IHRoZSB2ZXJ5IGxlYXN0DQo+IHdv
dWxkIG5lZWQgY292ZXJpbmcgaW4gdGhlIGRlc2NyaXB0aW9uLg0KPg0KDQpIbW1tLiBBbHRob3Vn
aCAiIGJvb2wgIlZHQSBzdXBwb3J0IiBpZiAhUFZfU0hJTV9FWENMVVNJVkUgIiBkb2Vzbid0IG1h
a2UgQ09ORklHX1ZHQSB0aGUgb3B0aW9uIGRpc2FwcGVhciB3aGVuIFBWX1NISU1fRVhDTFVTSVZF
PXksIGl0IHN0aWxsIG1ha2UgaXQgdW5jb25maWd1cmFibGUuIFNvIEkgdHJlYXQgaXQgZGVwZW5k
ZW5jeSB0b28gaGVyZS4uLg0KTWF5YmUgSSBzaGFsbCBhZGQgdGhlIGZvbGxvd2luZyBpbiB0aGUg
ZGVzY3JpcHRpb246DQpgYGANCkFsdGhvdWdoICIgaWYgIVBWX1NISU1fRVhDTFVTSVZFICIgZm9y
IENPTkZJR19WR0EgaXMgbm90IHRydWx5IGEgZGVwZW5kZW5jeSwgc2V0dGluZyBQVl9TSElNX0VY
Q0xVU0lWRSB5IHN0aWxsIG1ha2VzIGl0IHVuY29uZmlndXJhYmxlLiBTbyB3ZSByZW1vdmUgaXQg
aGVyZSB0b28NCmBgYA0KDQo+IEFsc28sIGp1c3QgdG8gcmVwZWF0IHdoYXQgSSBzYWlkIGluIHJl
cGx5IHRvIHRoZSBjb3ZlciBsZXR0ZXI6IEltbyB0aGlzIGNoYW5nZSBuZWVkcyB0bw0KPiBtb3Zl
IDJuZCB0byBsYXN0IGluIHRoZSBzZXJpZXMsIGFuZCBpdCB0aGVuIHdhbnRzIGNvbW1pdHRpbmcg
dG9nZXRoZXIgd2l0aCB0aGUgbGFzdA0KPiBwYXRjaCAod2hpY2ggeW91IHdpbGwgd2FudCB0byBw
dXQgaW4gYXMgYSByZW1hcmsgdG8gdGhlIGV2ZW50dWFsIGNvbW1pdHRlcikuDQoNClllcywgSSds
bCBtb3ZlIGl0IHRvIDJuZCB0byBsYXN0LiBTaGFsbCBJIG1lbnRpb24gIkl0IHNoYWxsIGJlIGNv
bW1pdHRlZCB0b2dldGhlciB3aXRoIC4uLi4iIGluIGNvbW1pdCBtZXNzYWdlIG9yIGNoYW5nZSBs
b2c/DQoNCj4NCj4gSmFuDQo=

