Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 47B16A1190D
	for <lists+xen-devel@lfdr.de>; Wed, 15 Jan 2025 06:35:35 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.872160.1283113 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tXw2V-0007mc-VF; Wed, 15 Jan 2025 05:34:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 872160.1283113; Wed, 15 Jan 2025 05:34:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tXw2V-0007jV-SL; Wed, 15 Jan 2025 05:34:03 +0000
Received: by outflank-mailman (input) for mailman id 872160;
 Wed, 15 Jan 2025 05:34:02 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=9Lts=UH=amd.com=penny.zheng@srs-se1.protection.inumbo.net>)
 id 1tXw2U-0007jP-9e
 for xen-devel@lists.xenproject.org; Wed, 15 Jan 2025 05:34:02 +0000
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2061b.outbound.protection.outlook.com
 [2a01:111:f403:2417::61b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 517b03be-d302-11ef-a0e1-8be0dac302b0;
 Wed, 15 Jan 2025 06:33:59 +0100 (CET)
Received: from IA1PR12MB8467.namprd12.prod.outlook.com (2603:10b6:208:448::9)
 by CH3PR12MB8281.namprd12.prod.outlook.com (2603:10b6:610:128::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8335.18; Wed, 15 Jan
 2025 05:33:56 +0000
Received: from IA1PR12MB8467.namprd12.prod.outlook.com
 ([fe80::1633:cc45:8177:a91e]) by IA1PR12MB8467.namprd12.prod.outlook.com
 ([fe80::1633:cc45:8177:a91e%4]) with mapi id 15.20.8335.017; Wed, 15 Jan 2025
 05:33:56 +0000
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
X-Inumbo-ID: 517b03be-d302-11ef-a0e1-8be0dac302b0
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pusByhohct6tRpMjzJpj485YPg1W4pEr/tMTgo0XNCoR6y+pFitnbsyxZTd3Bj8q6uvTAJ1JCJygGLeqGYInY4AkOpORsxwOP8qa+rmMi8WW56abfMPMwlj1N3F7+bLmpBHqHvIvB6SWF9WWpcYQWoKxOS+qvfF6QDm9KkQSOXV5bbVSTFGtfUC4YL+qjYBseQ9HR3boT+qtQuDCrT/rkU/nNjA2Qk9fl//IJamWaLS+QSqcmQA89UjE+BZCjjUp8EHH609qhuMku0RS0a7wYga264KdLPTe3wOrfYtUZHDZyJW4GX4w8qWcw4yhyDDavbGa7jyJtcbc4NCIMugr2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GmBL8C0qz1FweHezhzswXvl8N3X3qqe7gyaWPaO8p4c=;
 b=SDIGtHq9qHUHUdYCA+21xA67wpozR8wvSUxueBZNucd/HIkDQMz0WGKjVs6vv0gaIXx93YETzdADsVj1QpZWD8YBkVAu1UEzS8e7INbFJav8ejQ4rrDZ2DXV5kgEF6ZNCc3aD/fSw3qPfLCZRMi7XhotjyB+KU/dqt7f9GA97R2UByL9T2T14Wt+6hlaxcVcEMvQhgyziq8SYhPoFBvEh1MQM4HBSxuvA4dUfw0Qajo/zJmSfG6vBq16fuGbsfILtzrheeNrD0w8wLuOASgtbnnqEE/8UTpFlwrwvZy55cBHynx6RFBnFgaTp2MCoUN+Gjl+5ldTH2PuuPerOt8mVg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GmBL8C0qz1FweHezhzswXvl8N3X3qqe7gyaWPaO8p4c=;
 b=mHyJQZl7yZgv2CNWpeXP84XahdrkWyuESWed0SOdt8T9bPpw4SKOT2emPD/uOD3WpPj2zRYG4DLyK4uPZBySn1WXqxWj+3Wt0H9wV+0E4DEbTG1NwrnFN0is8pF4vadfn8HDWYlzPsBKE/pf4DxZbug1VVIIfPfBnQE1lTnPK48=
From: "Penny, Zheng" <penny.zheng@amd.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "Stabellini, Stefano" <stefano.stabellini@amd.com>, "Huang, Ray"
	<Ray.Huang@amd.com>, "Ragiadakou, Xenia" <Xenia.Ragiadakou@amd.com>,
	"Andryuk, Jason" <Jason.Andryuk@amd.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?=
	<roger.pau@citrix.com>, Julien Grall <julien@xen.org>, Stefano Stabellini
	<sstabellini@kernel.org>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
Subject: RE: [PATCH v1 02/11] xen/x86: introduce new sub-hypercall to get CPPC
 data
Thread-Topic: [PATCH v1 02/11] xen/x86: introduce new sub-hypercall to get
 CPPC data
Thread-Index: AQHbRVx2Xy1QS0W8Lk2Jl10Jg0sbebMOa8AAgAEtx8A=
Date: Wed, 15 Jan 2025 05:33:56 +0000
Message-ID:
 <IA1PR12MB84679A0D60CD4219E9C1A01FE1192@IA1PR12MB8467.namprd12.prod.outlook.com>
References: <20241203081111.463400-1-Penny.Zheng@amd.com>
 <20241203081111.463400-3-Penny.Zheng@amd.com>
 <95183589-1a83-4c99-ade4-d37873b85e0a@suse.com>
In-Reply-To: <95183589-1a83-4c99-ade4-d37873b85e0a@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_ActionId=ac772a5a-ee3f-4b7f-b727-a76e3ee3232a;MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_ContentBits=0;MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Enabled=true;MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Method=Standard;MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Name=AMD
 Internal Distribution
 Only;MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_SetDate=2025-01-10T03:45:44Z;MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA1PR12MB8467:EE_|CH3PR12MB8281:EE_
x-ms-office365-filtering-correlation-id: c5983e2d-f26e-47eb-f837-08dd35263488
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|376014|366016|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?K3Q1aTRpRUxTNjR4Vm8wRUJCN0lDbnRJNkNqaFpGa0RKWU9VVzV1Um8wS1NP?=
 =?utf-8?B?OXhYV215cUd5c3ZsMkVSYjNYWVdjZDlmSnZVRjEvTklzYUw2ZEFkS2tkZzdl?=
 =?utf-8?B?V0t4ZC9LQjkzRllCaGZ6ZnBHR1JaWVNMTGUxVGVORXltbUJkanZMMEVSemtv?=
 =?utf-8?B?NFJrcnQ3SXhacVJmTzdKL2lCVFJicFRkMGNYV0xEQlFabVUwQjcrODNaMzBX?=
 =?utf-8?B?Z0JBWnNBSGJod0FJTXBPeUh2bWliMkRub0NIbkdYVDBqczZPYi9nQUwwSlBH?=
 =?utf-8?B?ZXhLdTN3N3JUUmhacGYrQkFPTGgwT29kTGRGMWtyV1Q0V1I2QVZWVlMwUG1s?=
 =?utf-8?B?aUUvN3RJU25NVXEwK1BRQUJNM0l5ZlcyR2JXTkNGS1IrMVRPSWpjZWIxZk5Y?=
 =?utf-8?B?MG04a2NITTZNVjFvNTVOdmxRa2dHYUphWEordzBoQUhRazBOZ2c4OEpYRUg5?=
 =?utf-8?B?U0Y0SkYvMTJMQ3RGMWMrVnhLRVpjQ2x0NXVsYnZOTVF2UC9xMTl0V2RHRDNu?=
 =?utf-8?B?ampueGNwU3ZyMU1uRUtnbzJoUVpZNCtRMnN2RnYxMFJYcHZkZkJXdllIdXJq?=
 =?utf-8?B?Sk4wWlAwWGN6RUJWcGs4TXB6VW1CVHhaK1pldjlKT2xnbm1pTjc5cW5DbFM1?=
 =?utf-8?B?WEVxT2doNllocWZ5eUhBTU5tMGRYbnZEN0lhVmZxekIzK25CSlhKUjBmRkhN?=
 =?utf-8?B?NHVkanVMK3FydWUxTUdEZ29QYkR0ZXJEMzZ6cE9VUllSamFqMzV4SVllR2t1?=
 =?utf-8?B?Q0xZcW85MWlSOFVmaFJDOE1ydE5LeVU4Y2tHN0JLQWJTeG9jL25sM05wMUw3?=
 =?utf-8?B?Yk5Ed3BnZTV6R0VQMW43OUZ2VWxaN0p3T05zWFdWSWlnS1A1MkRmN2NFd2gr?=
 =?utf-8?B?S3UxNlBSY1pPVmpiYkNiWTlhNHd6NjltbmdYU3EwRG1pRGFIMmsxZHdKWjdj?=
 =?utf-8?B?QkhwZHFEM0xFS0RoNHhRckEvWkNlak1ER3dna3kzMlZhTndiNVB0eGF0VE12?=
 =?utf-8?B?bWxOT25Qb250Y3JCMmtnajd3bVVQUFZSQ2lKL2xMQjZXQjlSK0h5VTFYbkYv?=
 =?utf-8?B?VEhmQUF0d09lMU9zL2drN0xQUjBIOGxYMG8vZHEwSEd4NjY0MldtSVVNZjFa?=
 =?utf-8?B?Q0NNcG90VmdDckxDVGlGK0thU1o1eENRa3BhWXVlNjJIU1J3OFlGME90clQy?=
 =?utf-8?B?NUhTNjhwMHVoTThPNDJxelByVUU4eG9Wa3AwaG1LTGttbGxtYlhmVnlEbUx4?=
 =?utf-8?B?Mi8vQmt0RWh0RmRqUnovdnhWT1Ywb1JPbGtpejVmZ0FtVmFGeHcvOXBwOVdx?=
 =?utf-8?B?ZWh2TFEvRjRWUnVKSTdiUHErdFZtaG81U2p0K2VSS1h4OGYwWktsUDBjMkZ2?=
 =?utf-8?B?WFBNU1M3REQxWDlxNHhLOEQvdGVJSGZTZXEwL2NzZDZFMEtBQkRTQUM2UVpN?=
 =?utf-8?B?RTRsNnBnRWtjMDBoRWZNckJ4ZHFtYXV6SEd1K0RHSVlnVTlKTkNaMzJyK3V2?=
 =?utf-8?B?OVVRcjZjamQxRlRzN3k5UU5jeFFhTEp4OFBZSlRybUZBMkxFd1owQm9xY0ti?=
 =?utf-8?B?d3k1VndPUlYra2J2RC9RRFNiVS9aL3czVnpsVmFpbytvdzV1N2JSSmtQZGlV?=
 =?utf-8?B?TGdIQytTR3BaOTVBUEQ4R2pLWE44eHp2RHRqSHA1NzdRZm50RDhNUTlJVVY3?=
 =?utf-8?B?MHRhalN1K20xK2JXdFBlTnExRll3VTRsWTBhdkxxRUJZMHY4cmF1T25Iemo0?=
 =?utf-8?B?TVMra0JWeExSWVVCc01wVCtVVzV4eU5tNEtETnpVdmE5dUt0K2ovNDNxUGZV?=
 =?utf-8?B?MFVIYXdVOEI5anQwb29mbVFEYnhlZ3lJZFVJNWc5WEJCdjBES1pOYTZWNW9J?=
 =?utf-8?B?ZWZIekw5ZEhtL3VWNzVxcGVtV1BFYXdMeit6b29aQUt1S3NSeFM3UDZpT3hx?=
 =?utf-8?Q?zRIIpzld0PZe3VQvApKnhBsKiw/8MG5D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA1PR12MB8467.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?UUxIemJIOGpFOVpjMnJQUW82ekN2SWFjcUlHdDZ2YlUrWHhtbDJTKzRhWk1J?=
 =?utf-8?B?bG05Smgwa0FDVTFJall2SW0xb1M4aEhCdHAzanBIbC9qV1Yvdy9YSDBwNTVE?=
 =?utf-8?B?VnlxS2NrZEFvWHYwVGY3ZlBmTk56Y3NtL2RDUDd4MGMrcnpod1Jab1lOcW5t?=
 =?utf-8?B?RkVSQURtNVJtYWlIeTkwVFJDRFBIajVpWG1HT3p3bjA4bDZhVXVEWDZ0WWJ5?=
 =?utf-8?B?VDh2dGwxOTBXb3FhbjEzaXZKeVNWdE1VdTNXOTRWS2hVaDdEQXJSQUVGMVIv?=
 =?utf-8?B?L3VKR01lRlZldUlTeG0rMWZ6OUl5Um0zUTY0b0NmeXgwNTRQL3hQa1pIUmdC?=
 =?utf-8?B?dXgrYXdZUFhKYXpZY2swcXoxQ2l2cDV6WlByM1ZiOVJPcW5tMmYrTFJGTnRn?=
 =?utf-8?B?OUpQS05MM2JzRzNUZkRFRjhUZWxsVklhUkdQYVVDU2xZZ0kwdEZlZVFvakVr?=
 =?utf-8?B?dFd0bHpoV1BGMm03OVhPOWVmWWMvU3AwaUt2b0R6L1ZmMlR0b29JTDlVZDBG?=
 =?utf-8?B?Rmowd1BFSEtUUEdqSHFDNlFHY2VVOHdqQ1UrcUxqT21ySy8zTkhFaG5PcTU5?=
 =?utf-8?B?Tnk4VG8xWksxaE5wMUNoWFJtcHNscTFCeHRhMlBYeE13bzl5MlpEaW9BQ3Mr?=
 =?utf-8?B?OGMvYXVOTW0zMlF0VWtWcmt3STA5a3BzbzlFR0VYQzlqT2U1N2g2MlB5MUgx?=
 =?utf-8?B?YjBjMEVURnV0WDBNTmZndjFtajE1NFd3VU15YTJYaXUrRUpRUHFwYjVNWEVZ?=
 =?utf-8?B?Q2ZpdDhtdU1xNU5GZHAyeXNNeURUTm5NWVd6bGpjOFEyVmdXTXNMNDVVMmZm?=
 =?utf-8?B?dVpmRW1Tb3dqZ1RqY0Nlem1FY3NDTEtISUtMbUpHc3FBdmk0cGE5NE9LMUZB?=
 =?utf-8?B?RnJZOEhsMkovRDlrTElzSmIyN1NCNHRDWGE3VHpuVURONDNjMEtOMVNQZ2ZG?=
 =?utf-8?B?Vi80Rlc1aTBxSnVRUzUvZmcyWnlUUU1sM1RDR2Z2Ykt5RGEremhrMVl2UjRi?=
 =?utf-8?B?U0VkLzM5ZjZKbjFaOVlWL2VoVndITStSV0xSbkNzREpoL3RLMzBQTVJkeWls?=
 =?utf-8?B?UVM1M1BqQ2dxbXNYK2VucUhueGl0T01BeFhQZWdqUVpOdVYvVTA4Y2Z0b2l6?=
 =?utf-8?B?VmIvMUZnYkQ4MmRsNUNxUDduaWJkMWFYRnJjMmxHemtoK1lJTzdsYXBHSnRU?=
 =?utf-8?B?eC9YdG9XVkl3elBUM1pwVUdqMXkwVG55eU5xdWozcE9CQmYvVWNMeDZNcTNS?=
 =?utf-8?B?ZnlSRGFINTRtRUlMcTlWd3VpWWdIMzVJT3U4MUlOd2FYQ3lzNE5paHI3MGhE?=
 =?utf-8?B?WG1oc1VwWW1zTVNrdUp6MEpadHIxWjdRRHRLNE5qd0QxY2l4LzdWbUwzWW9v?=
 =?utf-8?B?U2JsSkpmOFhjelVValdSU0ZUWkRGUWdWM2JSNFJKbVgrb3VjdUp3Q3Z1c05C?=
 =?utf-8?B?NFFIVCtSSmhUU1F1RmcvaXdvNXNGaG5SckhpRW5JTmE3NG9jYUlGVWt4RU1W?=
 =?utf-8?B?Z2lTRlFVRWVYQ3doR1U5ZkhBZmpsYjRMN2ZTb0JTWDZodGFqTHFsU1YreU1n?=
 =?utf-8?B?M2xodnZzb1FWZmtGZTNrM09UNWl3eUtmT0tLK3NJMFdXdHA2VzY3aG5DbEUx?=
 =?utf-8?B?dVZEaE5sLy9WbTlETktycFVDT1ZaaS9Ga0VMOTNLYVlKcE15RkhTNm5OdnVH?=
 =?utf-8?B?VFE0NC9qT2Rub0h6U09WTkJvSStwUGF5MXpIcHhDU0U2VXZYUjdhNU9qT0ta?=
 =?utf-8?B?WW5mU3VlaXI5cEVUM1JuR2lVYWJ1VUs2S0E4dU45eXVPeXB4VCtQclpieTZU?=
 =?utf-8?B?RG53djJCYkovZDlVdWRDWE81R1ZCOERZMnpqZVNKZTNURDExYzJncTZKU0RG?=
 =?utf-8?B?YjJEOWpYMXV3SDVzbGFuUk5SNTJkNW1EMjJEREFRK0drbjRDNTFsMVJudENs?=
 =?utf-8?B?c082YTB4U0h1RnR4U0plYkt0UlJrT1B0SC9SenU3dWtYN0hzNlA0MDlKWjBa?=
 =?utf-8?B?MGRxbHVjaFBzNmxkWWdzU09UbURTZysraDRCTVRNdVZuYmFBNno4VjdBYkZi?=
 =?utf-8?B?SmpOUmlrT2FZSTlMbDdiLzU0ZEp6YzVHMmprLzFiYldtT21sNkFUZzhEbklt?=
 =?utf-8?Q?makk=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA1PR12MB8467.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c5983e2d-f26e-47eb-f837-08dd35263488
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Jan 2025 05:33:56.2280
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: msJkVMj6t/GvDZxOaBTvCDwPtqdDRXA+hjKmx+p2F0FnPO3vEQE3HnusMg7SnUFOZhENDoh8ovDsmpAsqe9ANQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8281

W0FNRCBPZmZpY2lhbCBVc2UgT25seSAtIEFNRCBJbnRlcm5hbCBEaXN0cmlidXRpb24gT25seV0N
Cg0KSGksDQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogSmFuIEJldWxp
Y2ggPGpiZXVsaWNoQHN1c2UuY29tPg0KPiBTZW50OiBUaHVyc2RheSwgSmFudWFyeSA5LCAyMDI1
IDU6NDYgUE0NCj4gVG86IFBlbm55LCBaaGVuZyA8cGVubnkuemhlbmdAYW1kLmNvbT4NCj4gQ2M6
IFN0YWJlbGxpbmksIFN0ZWZhbm8gPHN0ZWZhbm8uc3RhYmVsbGluaUBhbWQuY29tPjsgSHVhbmcs
IFJheQ0KPiA8UmF5Lkh1YW5nQGFtZC5jb20+OyBSYWdpYWRha291LCBYZW5pYSA8WGVuaWEuUmFn
aWFkYWtvdUBhbWQuY29tPjsNCj4gQW5kcnl1aywgSmFzb24gPEphc29uLkFuZHJ5dWtAYW1kLmNv
bT47IEFuZHJldyBDb29wZXINCj4gPGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+OyBSb2dlciBQ
YXUgTW9ubsOpIDxyb2dlci5wYXVAY2l0cml4LmNvbT47IEp1bGllbg0KPiBHcmFsbCA8anVsaWVu
QHhlbi5vcmc+OyBTdGVmYW5vIFN0YWJlbGxpbmkgPHNzdGFiZWxsaW5pQGtlcm5lbC5vcmc+OyB4
ZW4tDQo+IGRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnDQo+IFN1YmplY3Q6IFJlOiBbUEFUQ0gg
djEgMDIvMTFdIHhlbi94ODY6IGludHJvZHVjZSBuZXcgc3ViLWh5cGVyY2FsbCB0byBnZXQgQ1BQ
Qw0KPiBkYXRhDQo+DQo+IE9uIDAzLjEyLjIwMjQgMDk6MTEsIFBlbm55IFpoZW5nIHdyb3RlOg0K
PiA+IEluIG9yZGVyIHRvIHByb3ZpZGUgYmFja3dhcmQgY29tcGF0aWJpbGl0eSB3aXRoIGV4aXN0
aW5nIGdvdmVybm9ycw0KPiA+IHRoYXQgcmVwcmVzZW50IHBlcmZvcm1hbmNlIGFzIGZyZXF1ZW5j
aWVzLCBsaWtlIG9uZGVtYW5kLCB0aGUgX0NQQw0KPiA+IHRhYmxlIGNhbiBvcHRpb25hbGx5IHBy
b3ZpZGUgcHJvY2Vzc29yIGZyZXF1ZW5jeSByYW5nZSB2YWx1ZXMsIExvd2VzdA0KPiA+IGZyZXF1
ZW5jeSBhbmQgTm9ybWluYWwgZnJlcXVlbmN5LCB0byBsZXQgT1MgdXNlIExvd2VzdCBGcmVxdWVu
Y3kvDQo+ID4gUGVyZm9ybWFuY2UgYW5kIE5vbWluYWwgRnJlcXVlbmN5L1BlcmZvcm1hbmNlIGFz
IGFuY2hvciBwb2ludHMgdG8NCj4gPiBjcmVhdGUgbGluZWFyIG1hcHBpbmcgb2YgQ1BQQyBhYnN0
cmFjdCBwZXJmb3JtYW5jZSB0byBDUFUgZnJlcXVlbmN5Lg0KPiA+DQo+ID4gQXMgWGVuIGlzIHVu
Y2FwYWJsZSBvZiBwYXJzaW5nIHRoZSBBQ1BJIGR5bmFtaWMgdGFibGUsIHRoaXMgY29tbWl0DQo+
ID4gaW50cm9kdWNlcyBhIG5ldyBzdWItaHlwZXJjYWxsIHRvIGdldCByZXF1aXJlZCBDUFBDIGRh
dGEgZnJvbQ0KPiA+IGRvbTAga2VybmVsLg0KPg0KPiAiZ2V0IiBhcyB1c2VkIGJvdGggaGVyZSBh
bmQgaW4gdGhlIHRpdGxlIGlzLCB0byBtZSwgc29tZXRoaW5nIGFuIGVudGl0eSBkb2VzIGFjdGl2
ZWx5Lg0KPiBYZW4gaXMgZW50aXJlbHkgcGFzc2l2ZSBoZXJlLCB0aG91Z2guIChSZWFkaW5nIHRo
ZSB0aXRsZSBJIHdhcyBmaXJzdCBhc3N1bWluZyB0aGlzIGlzDQo+IGFib3V0IGEgc3ViLW9wIHRv
IGdldCBjZXJ0YWluIGRhdGEgb3V0IG9mDQo+IFhlbi4pDQoNCkhvdyBhYm91dCAiYSBuZXcgc3Vi
LWh5cGVyY2FsbCB0byBwYXNzL2RlbGl2ZXIgQ1BQQyB0byBYZW4iPyBvciBhbnkgYmV0dGVyIHN1
Z2dlc3Rpb25zPw0KDQo+DQo+ID4gLS0tIGEveGVuL2FyY2gveDg2L3BsYXRmb3JtX2h5cGVyY2Fs
bC5jDQo+ID4gKysrIGIveGVuL2FyY2gveDg2L3BsYXRmb3JtX2h5cGVyY2FsbC5jDQo+ID4gQEAg
LTU3Miw2ICs1NzIsMTIgQEAgcmV0X3QgZG9fcGxhdGZvcm1fb3AoDQo+ID4gICAgICAgICAgICAg
IGJyZWFrOw0KPiA+ICAgICAgICAgIH0NCj4gPg0KPiA+ICsgICAgICAgIGNhc2UgWEVOX1BNX0NQ
UEM6DQo+ID4gKyAgICAgICAgew0KPiA+ICsgICAgICAgICAgICByZXQgPSBzZXRfY3BwY19wbWlu
Zm8ob3AtPnUuc2V0X3BtaW5mby5pZCwgJm9wLQ0KPiA+dS5zZXRfcG1pbmZvLnUuY3BwY19kYXRh
KTsNCj4gPiArICAgICAgICB9DQo+ID4gKyAgICAgICAgYnJlYWs7DQo+DQo+IE5vIHN1Y2ggdW5u
ZWNlc3NhcnkgZmlndXJlIGJyYWNlcyBwbGVhc2UsIHdoaWNoIC0gb25jZSBkcm9wcGVkIC0gd2ls
bCBhbHNvIGNhbGwgZm9yDQo+ICJicmVhayIgdG8gYmUgaW5kZW50ZWQgb25lIGxldmVsIGRlZXBl
ci4NCg0KVW5kZXJzdG9vZC4NCg0KPg0KPiA+IC0tLSBhL3hlbi9hcmNoL3g4Ni94ODZfNjQvY3B1
ZnJlcS5jDQo+ID4gKysrIGIveGVuL2FyY2gveDg2L3g4Nl82NC9jcHVmcmVxLmMNCj4gPiBAQCAt
NTQsMyArNTQsMjEgQEAgaW50IGNvbXBhdF9zZXRfcHhfcG1pbmZvKHVpbnQzMl90IGFjcGlfaWQs
DQo+ID4NCj4gPiAgICAgIHJldHVybiBzZXRfcHhfcG1pbmZvKGFjcGlfaWQsIHhlbl9wZXJmKTsg
IH0NCj4gPiArDQo+ID4gK2ludCBjb21wYXRfc2V0X2NwcGNfcG1pbmZvKHVpbnQzMl90IGFjcGlf
aWQsDQo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgIHN0cnVjdCBjb21wYXRfcHJvY2Vz
c29yX2NwcGMgKmNwcGNfZGF0YSkgew0KPiA+ICsgICAgc3RydWN0IHhlbl9wcm9jZXNzb3JfY3Bw
YyAqeGVuX2NwcGM7DQo+ID4gKyAgICB1bnNpZ25lZCBsb25nIHhsYXRfcGFnZV9jdXJyZW50Ow0K
PiA+ICsNCj4gPiArICAgIHhsYXRfbWFsbG9jX2luaXQoeGxhdF9wYWdlX2N1cnJlbnQpOw0KPiA+
ICsNCj4gPiArICAgIHhlbl9jcHBjID0geGxhdF9tYWxsb2NfYXJyYXkoeGxhdF9wYWdlX2N1cnJl
bnQsDQo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHN0cnVjdCB4ZW5f
cHJvY2Vzc29yX2NwcGMsIDEpOw0KPiA+ICsgICAgaWYgKCB1bmxpa2VseSh4ZW5fY3BwYyA9PSBO
VUxMKSApDQo+ID4gKyAgICAgICAgcmV0dXJuIC1FRkFVTFQ7DQo+ID4gKw0KPiA+ICsgICAgWExB
VF9wcm9jZXNzb3JfY3BwYyh4ZW5fY3BwYywgY3BwY19kYXRhKTsNCj4gPiArDQo+ID4gKyAgICBy
ZXR1cm4gc2V0X2NwcGNfcG1pbmZvKGFjcGlfaWQsIHhlbl9jcHBjKTsgfQ0KPg0KPiBXaHkncyB0
aGlzIG5lZWRlZD8gVGhlIHN0cnVjdHVyZSAtIGZvciBub3cgYXQgbGVhc3QgLSBjb25zaXN0cyBv
ZiBvbmx5IHVpbnQzMl90LXMsDQo+IGFuZCBoZW5jZSBoYXMgaWRlbnRpY2FsIGxheW91dCBmb3Ig
Y29tcGF0IGNhbGxlcnMuDQo+DQoNClVuZGVyc3Rvb2QuIE5vdCBmYW1pbGlhciB3aXRoIHRoZSBj
b21wYXQgZnJhbWV3b3JrDQoNCj4gPiAtLS0gYS94ZW4vZHJpdmVycy9jcHVmcmVxL2NwdWZyZXEu
Yw0KPiA+ICsrKyBiL3hlbi9kcml2ZXJzL2NwdWZyZXEvY3B1ZnJlcS5jDQo+ID4gQEAgLTQ1OCw2
ICs0NTgsNTYgQEAgc3RhdGljIHZvaWQgcHJpbnRfUFBDKHVuc2lnbmVkIGludCBwbGF0Zm9ybV9s
aW1pdCkNCj4gPiAgICAgIHByaW50aygiXHRfUFBDOiAlZFxuIiwgcGxhdGZvcm1fbGltaXQpOyAg
fQ0KPiA+DQo+ID4gK3N0YXRpYyB2b2lkIHByaW50X0NQUEMoc3RydWN0IHhlbl9wcm9jZXNzb3Jf
Y3BwYyAqY3BwY19kYXRhKQ0KPg0KPiBQb2ludGVyLXRvLWNvbnN0Pw0KPg0KDQpTdXJlLg0KDQo+
ID4gK3sNCj4gPiArICAgIHByaW50aygiXHRfQ1BDOiBoaWdoZXN0X3BlcmY9JXUsIGxvd2VzdF9w
ZXJmPSV1LCAiDQo+ID4gKyAgICAgICAgICAgIm5vbWluYWxfcGVyZj0ldSwgbG93ZXN0X25vbmxp
bmVhcl9wZXJmPSV1LCAiDQo+ID4gKyAgICAgICAgICAgIm5vbWluYWxfZnJlcT0ldU1oeiwgbG93
ZXN0X2ZyZXE9JXVNaHpcbiIsDQo+ID4gKyAgICAgICAgICAgY3BwY19kYXRhLT5oaWdoZXN0X3Bl
cmYsIGNwcGNfZGF0YS0+bG93ZXN0X3BlcmYsDQo+ID4gKyAgICAgICAgICAgY3BwY19kYXRhLT5u
b21pbmFsX3BlcmYsIGNwcGNfZGF0YS0+bG93ZXN0X25vbmxpbmVhcl9wZXJmLA0KPiA+ICsgICAg
ICAgICAgIGNwcGNfZGF0YS0+bm9taW5hbF9mcmVxLCBjcHBjX2RhdGEtPmxvd2VzdF9mcmVxKTsg
fQ0KPiA+ICsNCj4gPiAraW50IHNldF9jcHBjX3BtaW5mbyh1aW50MzJfdCBhY3BpX2lkLCBzdHJ1
Y3QgeGVuX3Byb2Nlc3Nvcl9jcHBjDQo+ID4gKypjcHBjX2RhdGEpDQo+DQo+IFBvaW50ZXItdG8t
Y29uc3Q/DQo+DQoNClN1cmUuDQoNCj4gPiArew0KPiA+ICsgICAgaW50IHJldCA9IDAsIGNwdWlk
Ow0KPiA+ICsgICAgc3RydWN0IHByb2Nlc3Nvcl9wbWluZm8gKnBtX2luZm87DQo+ID4gKw0KPiA+
ICsgICAgY3B1aWQgPSBnZXRfY3B1X2lkKGFjcGlfaWQpOw0KPiA+ICsgICAgaWYgKCBjcHVpZCA8
IDAgfHwgIWNwcGNfZGF0YSApDQo+ID4gKyAgICB7DQo+ID4gKyAgICAgICAgcmV0ID0gLUVJTlZB
TDsNCj4gPiArICAgICAgICBnb3RvIG91dDsNCj4gPiArICAgIH0NCj4gPiArICAgIGlmICggY3B1
ZnJlcV92ZXJib3NlICkNCj4gPiArICAgICAgICBwcmludGsoIlNldCBDUFUgYWNwaV9pZCglZCkg
Y3B1aWQoJWQpIENQUEMgU3RhdGUgaW5mbzpcbiIsDQo+ID4gKyAgICAgICAgICAgICAgIGFjcGlf
aWQsIGNwdWlkKTsNCj4gPiArDQo+ID4gKyAgICBwbV9pbmZvID0gcHJvY2Vzc29yX3BtaW5mb1tj
cHVpZF07DQo+ID4gKyAgICBpZiAoICFwbV9pbmZvICkNCj4gPiArICAgIHsNCj4gPiArICAgICAg
ICBwbV9pbmZvID0geHphbGxvYyhzdHJ1Y3QgcHJvY2Vzc29yX3BtaW5mbyk7DQo+DQo+IFBsZWFz
ZSBiZSBhd2FyZSB0aGF0IG5ldyBjb2RlIGlzIHN1cHBvc2VkIHRvIGJlIHVzaW5nIHh2bWFsbG9j
KCkuDQoNClRoYW5rcyBmb3IgdGhlIHVwZGF0ZS4NCg0KPg0KPiA+ICsgICAgICAgIGlmICggIXBt
X2luZm8gKQ0KPiA+ICsgICAgICAgIHsNCj4gPiArICAgICAgICAgICAgcmV0ID0gLUVOT01FTTsN
Cj4gPiArICAgICAgICAgICAgZ290byBvdXQ7DQo+ID4gKyAgICAgICAgfQ0KPiA+ICsgICAgICAg
IHByb2Nlc3Nvcl9wbWluZm9bY3B1aWRdID0gcG1faW5mbzsNCj4gPiArICAgIH0NCj4gPiArICAg
IHBtX2luZm8tPmFjcGlfaWQgPSBhY3BpX2lkOw0KPiA+ICsgICAgcG1faW5mby0+aWQgPSBjcHVp
ZDsNCj4gPiArDQo+ID4gKyAgICBtZW1jcHkgKCh2b2lkICopJnBtX2luZm8tPmNwcGNfZGF0YSwN
Cj4gPiArICAgICAgICAgICAgKHZvaWQgKiljcHBjX2RhdGEsDQo+ID4gKyAgICAgICAgICAgIHNp
emVvZihzdHJ1Y3QgeGVuX3Byb2Nlc3Nvcl9jcHBjKSk7DQo+DQo+IFdoYXQgdXNlIGFyZSB0aGVz
ZSBjYXN0cz8gQWxzbyBwbGVhc2Ugbm8gYmxhbmsgYmVmb3JlIHRoZSBvcGVuaW5nIHBhcmVudGhl
c2lzIG9mDQo+IGEgZnVuY3Rpb24gY2FsbCwgYW5kIHBsZWFzZSBzaXplb2YoKmNwcGNfZGF0YSku
IFlldCB0aGVuIC0gd2h5IG1lbWNweSgpIGluIHRoZSBmaXJzdA0KPiBwbGFjZT8gVGhpcyBjYW4g
YmUgYSAodHlwZSBzYWZlKSBzdHJ1Y3R1cmUgYXNzaWdubWVudCwgY2FuJ3QgaXQ/DQo+DQoNClll
cywgaXQgY2FuIGJlIGEgKHR5cGUgc2FmZSkgc3RydWN0dXJlIGFzc2lnbm1lbnQNCg0KPiA+IC0t
LSBhL3hlbi9pbmNsdWRlL3B1YmxpYy9wbGF0Zm9ybS5oDQo+ID4gKysrIGIveGVuL2luY2x1ZGUv
cHVibGljL3BsYXRmb3JtLmgNCj4gPiBAQCAtMzYzLDYgKzM2Myw3IEBAIERFRklORV9YRU5fR1VF
U1RfSEFORExFKHhlbnBmX2dldGlkbGV0aW1lX3QpOw0KPiA+ICAjZGVmaW5lIFhFTl9QTV9QWCAg
IDENCj4gPiAgI2RlZmluZSBYRU5fUE1fVFggICAyDQo+ID4gICNkZWZpbmUgWEVOX1BNX1BEQyAg
Mw0KPiA+ICsjZGVmaW5lIFhFTl9QTV9DUFBDIDQNCj4gPg0KPiA+ICAvKiBQeCBzdWIgaW5mbyB0
eXBlICovDQo+ID4gICNkZWZpbmUgWEVOX1BYX1BDVCAgIDENCj4gPiBAQCAtNDMyLDYgKzQzMywx
NSBAQCBzdHJ1Y3QgeGVuX3Byb2Nlc3Nvcl9weCB7ICB0eXBlZGVmIHN0cnVjdA0KPiA+IHhlbl9w
cm9jZXNzb3JfcHggeGVuX3Byb2Nlc3Nvcl9weF90Ow0KPiA+IERFRklORV9YRU5fR1VFU1RfSEFO
RExFKHhlbl9wcm9jZXNzb3JfcHhfdCk7DQo+ID4NCj4gPiArc3RydWN0IHhlbl9wcm9jZXNzb3Jf
Y3BwYyB7DQo+ID4gKyAgICB1aW50MzJfdCBoaWdoZXN0X3BlcmY7DQo+ID4gKyAgICB1aW50MzJf
dCBub21pbmFsX3BlcmY7DQo+ID4gKyAgICB1aW50MzJfdCBsb3dlc3RfcGVyZjsNCj4gPiArICAg
IHVpbnQzMl90IGxvd2VzdF9ub25saW5lYXJfcGVyZjsNCj4gPiArICAgIHVpbnQzMl90IGxvd2Vz
dF9mcmVxOw0KPiA+ICsgICAgdWludDMyX3Qgbm9taW5hbF9mcmVxOw0KPiA+ICt9Ow0KPg0KPiBf
Q1BDIGNvbnRhaW5zIGEgbG90IG1vcmUgZGF0YS4gUGxlYXNlIGNsYXJpZnkgb24gd2hhdCBiYXNp
cyB0aGlzIHN1YnNldCB3YXMNCj4gY2hvc2VuLiAoS2VlcGluZyB0aGUgY2hvc2VuIGZpZWxkcyBp
biB0aGUgb3JkZXIgX0NQQyBoYXMgdGhlbSBtaWdodCBhbHNvIGJlIGENCj4gZ29vZCBpZGVhLikN
Cj4NCg0KSSdsbCBjb21tZW50IHdpdGggIg0KLyogU3Vic2V0IGZpZWxkcyB1c2VmdWwgZm9yIENQ
UEMtY29tcGF0aWJsZSBjcHVmcmVxIGRyaXZlcidzIGluaXRpYWxpemF0aW9uICovDQoiDQpJJ2xs
IHN0YXkgdGhlIHNhbWUgb3JkZXIgd2l0aCB0aGUgX0NQQyBoYXMgdGhlbQ0KDQo+ID4gLS0tIGEv
eGVuL2luY2x1ZGUveGxhdC5sc3QNCj4gPiArKysgYi94ZW4vaW5jbHVkZS94bGF0LmxzdA0KPiA+
IEBAIC0xNjYsNiArMTY2LDcgQEANCj4gPiAgISAgcHJvY2Vzc29yX2N4ICAgICAgICAgICAgICAg
ICAgICBwbGF0Zm9ybS5oDQo+ID4gICEgIHByb2Nlc3Nvcl9mbGFncyAgICAgICAgICAgICAgICAg
cGxhdGZvcm0uaA0KPiA+ICAhICBwcm9jZXNzb3JfcGVyZm9ybWFuY2UgICAgICAgICAgIHBsYXRm
b3JtLmgNCj4gPiArISAgcHJvY2Vzc29yX2NwcGMgICAgICAgICAgICAgICAgICBwbGF0Zm9ybS5o
DQo+ID4gICEgIHByb2Nlc3Nvcl9wb3dlciAgICAgICAgICAgICAgICAgcGxhdGZvcm0uaA0KPiA+
ICA/ICBwcm9jZXNzb3JfcHggICAgICAgICAgICAgICAgICAgIHBsYXRmb3JtLmgNCj4gPiAgISAg
cHNkX3BhY2thZ2UgICAgICAgICAgICAgICAgICAgICBwbGF0Zm9ybS5oDQo+DQo+IFBsZWFzZSBv
YmV5IHRvIGFscGhhYmV0aWMgc29ydGluZy4gQXMgcGVyIGFuIGVhcmxpZXIgY29tbWVudCBJIGFs
c28gZXhwZWN0IHRoaXMNCj4gd2FudHMgdG8gYmUgdXNpbmcgJz8nIGluIHBsYWNlIG9mICchJy4N
Cj4NCg0KU3VyZS4NCg0KPiBKYW4NCg0KTWFueSB0aGFua3MNClBlbm55DQo=

