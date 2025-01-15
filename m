Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 41E94A11C16
	for <lists+xen-devel@lfdr.de>; Wed, 15 Jan 2025 09:34:24 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.872227.1283183 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tXyqj-00031x-TY; Wed, 15 Jan 2025 08:34:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 872227.1283183; Wed, 15 Jan 2025 08:34:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tXyqj-0002zT-QL; Wed, 15 Jan 2025 08:34:05 +0000
Received: by outflank-mailman (input) for mailman id 872227;
 Wed, 15 Jan 2025 08:34:04 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=9Lts=UH=amd.com=penny.zheng@srs-se1.protection.inumbo.net>)
 id 1tXyqi-0002zL-PN
 for xen-devel@lists.xenproject.org; Wed, 15 Jan 2025 08:34:04 +0000
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on20605.outbound.protection.outlook.com
 [2a01:111:f403:2415::605])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 797360ef-d31b-11ef-a0e1-8be0dac302b0;
 Wed, 15 Jan 2025 09:34:03 +0100 (CET)
Received: from DM4PR12MB8451.namprd12.prod.outlook.com (2603:10b6:8:182::7) by
 MW4PR12MB5642.namprd12.prod.outlook.com (2603:10b6:303:187::9) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8335.19; Wed, 15 Jan 2025 08:33:59 +0000
Received: from DM4PR12MB8451.namprd12.prod.outlook.com
 ([fe80::b04e:2da5:7189:4c4d]) by DM4PR12MB8451.namprd12.prod.outlook.com
 ([fe80::b04e:2da5:7189:4c4d%4]) with mapi id 15.20.8356.010; Wed, 15 Jan 2025
 08:33:59 +0000
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
X-Inumbo-ID: 797360ef-d31b-11ef-a0e1-8be0dac302b0
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KNGq1jYmAJPfCpPkG7MGHWPDJ91q27EORSGzBhxKDu6uQnW8uiAksh0yKNanl1dUbPZ9a6kQM/44l60IauQhHH6xKWYPNm1O+125Iy2w8a+SRx5NWRvtcfs2KvJHVxePKPu/ahyaFSt8l/25F+1w0RLuE/NmYEVq+zhgiqj6p3v1CcndxAxUZp+2jeDx2hQpqzow66SMxzIRbZ6zhzY7JW6DkaWUOEhEb0WlCXdFt9PIgMF74LYTW47VF2aYTFB7F4AGadjFdptoL2+aCp8SlzbYTbUurP1CXfHhF4TR7NIZmlbdulAQAD1yf3i0U+P2wnXcTD2dg2x+0GI952F1yg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Btj5LjQxhrhR8/qfl/ax6KRztoFP6CkgKvKhOv3tAfI=;
 b=driehf/hxvDhOhzS4kmxctiePN4h2A64Pcqmloq86Y62EX6rXAuxHNnszRF9u2O7Bsa1fh8pUM4I9CuD3ICcjJTXWk7L4scGHkVhuHLeSCGCFIuoUg7cHN2YwQTPNCoqLgBd/qYi7sTGu3xHGbhD0y2eg6uNgFOUThjPmumluy5EoYaBaO4JBdUwL7dSMU2Sb4vZjFU/OmGMuP6Xxblr2KScBg3zmxJCSoLa9cIPrI19wYZqt4di0HzPNxMusYQI48tdMXnL+ry+nAY+eg1zA/xftSghNmU+xQ4H5AinyLtwLo5L7hlcslCP3Rvf40MN2kNsa2/Ooh4SDkuNmorRDA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Btj5LjQxhrhR8/qfl/ax6KRztoFP6CkgKvKhOv3tAfI=;
 b=zYhOSX8ReNmgoClGZM2zsOqwnmvvKaUWhZSotuoI1PhAd7tUrQYgAv2Uoi02MssJ+QPnjKEeMtk/H8owLWYN9FwoZHzY66NcoFazVWgp+r5+PLF9JXFTPM9k76IHLOBVV4SgRxp66MOsxsig2Ub0NDCkdgSQkW3ZD4f8PD9hj1o=
From: "Penny, Zheng" <penny.zheng@amd.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "Stabellini, Stefano" <stefano.stabellini@amd.com>, "Huang, Ray"
	<Ray.Huang@amd.com>, "Ragiadakou, Xenia" <Xenia.Ragiadakou@amd.com>,
	"Andryuk, Jason" <Jason.Andryuk@amd.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>, Stefano
 Stabellini <sstabellini@kernel.org>, =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?=
	<roger.pau@citrix.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
Subject: RE: [PATCH v1 03/11] xen/x86: introduce "cpufreq=amd-pstate" xen
 cmdline
Thread-Topic: [PATCH v1 03/11] xen/x86: introduce "cpufreq=amd-pstate" xen
 cmdline
Thread-Index: AQHbRVx5dnEd/G58t0eEMeNox50YY7MOb2uAgAksanCAACl1AIAAADlg
Date: Wed, 15 Jan 2025 08:33:58 +0000
Message-ID:
 <DM4PR12MB8451D50371F83C20123F4636E1192@DM4PR12MB8451.namprd12.prod.outlook.com>
References: <20241203081111.463400-1-Penny.Zheng@amd.com>
 <20241203081111.463400-4-Penny.Zheng@amd.com>
 <e7f1b3c3-dce4-4a0e-b1cf-c6ba8af95290@suse.com>
 <DM4PR12MB8451AF14F5B8609E54312F8DE1192@DM4PR12MB8451.namprd12.prod.outlook.com>
 <af88f6db-f8db-4a2c-b6a7-7955071dd10b@suse.com>
In-Reply-To: <af88f6db-f8db-4a2c-b6a7-7955071dd10b@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_ActionId=2345f288-ffe9-442a-bbb2-449ebf3f8be9;MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_ContentBits=0;MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Enabled=true;MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Method=Standard;MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Name=AMD
 Internal Distribution
 Only;MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_SetDate=2025-01-15T08:33:14Z;MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR12MB8451:EE_|MW4PR12MB5642:EE_
x-ms-office365-filtering-correlation-id: 3239d0b1-3a92-4589-f87c-08dd353f5b72
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?M1VyU1lQQVRBQXMvdUYwNllvUll3RENhZjh3bVhXby9ldFVjV3JtSUhxLytE?=
 =?utf-8?B?Y1hJQUJXdDA0Smx0NGNuSGkyRnhuTC9kdWtZekZ4RWtPTVVia1Z3a1lQaFlE?=
 =?utf-8?B?YXF3QUMwUmU2YjhMaVRLZnNOQjFSZFlmZ0Q2NVNlaG4yeXYrRmppdVA5OFpr?=
 =?utf-8?B?MksyL3RxR2tEcGxCU3lURzM1dENSUjVFRnZmT1Q4cXBFSHhWc0s1b0V4ZXo1?=
 =?utf-8?B?dVFneEFJRU93L2JIYVExdXE0anJWeVpqcEtvK3dTNUZBMUpCQm05ZERqNm9B?=
 =?utf-8?B?dTFubWxlWTJhZkY1MWJ1Y3BvV1B5aVhIbWluLzVLa2VhWVdGbGJZaVNBL3FT?=
 =?utf-8?B?aitkNkFSeXkyN21BR2gvQmJKRE5WeElTOGFrWHdRZ25USnZmUFdKQkJYYlVh?=
 =?utf-8?B?UVVteDNVWWNYeU1XRkxjamJqQTVjZGJDOUJlTjR4UDMrcm5UaTlvYnQ4cVo0?=
 =?utf-8?B?ZjlzN2pBNkgyUGgvRmxudDBhbVoxLzJ6eVd1ZXlEenJMTDhVSm9wdEJpRU1j?=
 =?utf-8?B?SXN4TUQ5cE9obVJpSUZlUVZabkxNK3M1cGEzOHh0N1RRYUN4QWd5V2lreHIz?=
 =?utf-8?B?TmNDWGYzK1c5ZjdkQ0hURGJ1UVVzMXh5Q0MrOXZFQkZ3ZkZ3cGZ0N2hya0li?=
 =?utf-8?B?SkoyK2w5U0wvL1l6TVY1eEFoNEI1MlpsUXc0VXE1YURBNnkwQ1BUZGplWVE3?=
 =?utf-8?B?NFByVDFvc2lwWm1CeS9Iaml1NldxR2lES3czSnJGbUdZS21XSDdJU1ZsZzdH?=
 =?utf-8?B?K3YyZ0g2N1BIVHBmd1ROV3IzcFhmcnJNVHo0eFhaM3dsK2F5cGhWVkZUdmFI?=
 =?utf-8?B?NmxMRmFBVTl5TmpVN29yMVRURHR0NTB3anFudEhwazVMUVc0c1k3Mmt1c1p4?=
 =?utf-8?B?d0Z6bWw0WnRGQXFFUzRuRmhoVW9WRHY0dHR4bldqcDRGb1pWb1oxT29jSGtL?=
 =?utf-8?B?OTR5aVM1Uzc5cHBQU0QrQ0RTMG9Fb1MwcW5zRFN3dGVadUtzWDBiQWhVTHRP?=
 =?utf-8?B?ZjBHOFFEMVltUGNUVW4xN1BpOTVvRVZzVklONHNPUUFZMy9TNUJmOUdCTXdS?=
 =?utf-8?B?UFNsdFlVM1RKb3BjVGZNR09ieS9nWDZ3dEJVSjNBa1kzTlBPeFN6Und4TUgv?=
 =?utf-8?B?N3o4NFNTcGlvcjBqZXdaMFFiNTVpY0x5cWFhd2doYXk4dEU2aDBhOWZXdTBr?=
 =?utf-8?B?S1oySWp6YW1DREk2by9QcjJ4Q21OZ2hjMXFIMktQdm9QVzlTbDFTRGFVTDRw?=
 =?utf-8?B?Zjgrekl4N01VUjlQc1B5Mm5YOENlUXZpc1B5MkZ5dU9uLzlUTGk1eHVPcFlU?=
 =?utf-8?B?TzNnNXpBblNFbEdFbzZnYkJhT0JjKzBncnF6QTY3LzhteThCZXA1cHZ5WGtC?=
 =?utf-8?B?WlcvbHNJay9hNEoyNVJUT1c4WkpGekV1TFRhb2N0amlJZXNrY1pnVnJraXJm?=
 =?utf-8?B?WVdnSksyZ0VkeWN5U1QvM3FrNERKZG1lNDZERWNCSlprNlBPeGxGTkZKZURP?=
 =?utf-8?B?RXFEeXE5c0s1VmVSL1piNXQ1Vmc0Rlg4TnVGd3ZQRm54T1RBanIwNWRyVmVT?=
 =?utf-8?B?UExmaWRYaVE0TjBuT2IweEhOZVlHeTUzU3pCWjJaTXI0ek55Qm9LUzNRcnJq?=
 =?utf-8?B?RWhPNGZONFNoejVlVHpDVmg1L002Q3ZtRWpWS1YxUHVwUS9hQitTYnhJR2hP?=
 =?utf-8?B?QUtzV2JYZW1uSTcrS2JHWHhxWGlFVjVqa0ZrRTdZNmhEN1hwaFFRNHduZEtm?=
 =?utf-8?B?OGhCKzloaEJWL1l0UFpsa0IwcTRpcjRuQ2RodG5ZMTRqQTA3ajd5VGVqZ3lm?=
 =?utf-8?B?dlBWTUhaUXFxRWRYRlIyWkZlQlNSZElEUWE3ZVIyR0w4QXJZR1FLR0JoajZk?=
 =?utf-8?B?Ni9lUm5aOTdjaTZrRXJvOHNpZWYyS2tVZE8rUWt4VU1PUktBNmF3TUVOZlFY?=
 =?utf-8?Q?Wk0O18CMv6B7voNUThp4EYIIrtB00pV+?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR12MB8451.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?Y0gveWtoS3FDbHVGOXFKQ2k2UXBxdkFycGY1OHBoeW5ST3V0aUZzTVp2NlFG?=
 =?utf-8?B?UWFCTWtML09XOE9DczFaRGhhOVVJaUh2dHIyKys2aGQ2bytZSTJxWWZGVVox?=
 =?utf-8?B?anpIQ25vN3Voa2c2TEc5WXhlajV2b3kwRnVuUFRMUkJaNWY0R0h2SXVvdy96?=
 =?utf-8?B?a0oyeEhWNzhmZi9CMFFxbmJDemd1dzFMY2kwbTBORStqUkl0ejhBSVJqVUNQ?=
 =?utf-8?B?d2RDa1NrcVE4VW05YVpLSHU0bTMxd3NFdGxjQmwvU3duWUlCUkJLSHEzYUt2?=
 =?utf-8?B?UERYNW9JQk9YMk1WSk1MSExKOEc3RHY3dXpEazd0WG5pMHBGYWxRYndzMXVI?=
 =?utf-8?B?SDhsNzJKWkxKSVlPQkdTQ1hBQTNJbVQ4Z1RPWVVBVDQyd3VmbExUdHJzOVNO?=
 =?utf-8?B?U29sSjdYeVQySVRSSDlJcVk4a1N1alRtR2V0TWdtekNDbC8xMW4zN3JiU1V5?=
 =?utf-8?B?Q2FKdVhFb3pUZ0toNkhMNjlibW0rTlVUUHp6MEVZUkhxL1N3WjcxYlU1SUV6?=
 =?utf-8?B?OE5SR3k4R2JVVm5xaVI0SzR5ODA2dllLUGJXWlBaR1gwcEJ1VGVodlQ3MFBC?=
 =?utf-8?B?QlhJM3htNW5GeENFS1FKWUJBaUI0NVpFZ1ZiakoyaWorcmFLWEtPWHliM012?=
 =?utf-8?B?cS9CVVQvSGlRZUEzQmZwL3ZHdlpITU9OaHVoVitPVzZsZmJHTk9FMERLWDJO?=
 =?utf-8?B?c0RaTTc0YkxaWjJrRFBDcTFoV0ZoREk4cFdFeDlPWENUT0dwWk40R0N2Nm5B?=
 =?utf-8?B?dmxtMEpnZVlYVHJVTmpkdmxjMitmUFh0SGhwZnVMcC9RUU5FWWo1Q2tvdGw4?=
 =?utf-8?B?K2J0VGErWEk3QW1rYlF3Q242WGhBODBFakppNzlkV3NVTjhmR1JvNVNjRGFJ?=
 =?utf-8?B?WGUza0dCaW9sTWliTitzVDJqTmlCMHIwZUp3M1hXUU1BWWhZUmhHNkZxaW4z?=
 =?utf-8?B?THBYTE13TTE3NmlRM2JsQ2FQRnczU2p6dTJqd2d1YWdmYXI0MkFKVk1ZSU5K?=
 =?utf-8?B?VnRNZkZudk91OUhlRFp2K1F1aTk2STdDRjRkZytFNXNPeGRrQ2k2Mm5sMjdP?=
 =?utf-8?B?aHQzNzhUbFI4ZHRHS1lNZ05KTDk0eDczOVNaZXFLNnZiK29IWTErUEJaSHJl?=
 =?utf-8?B?eGNGbVMzMmNwenl4b3IxaEo1cDJFbXVZR3hjTXRyM1VleWc1R0xtREFxSElx?=
 =?utf-8?B?S2ZUNXpuVkh3WkxHdDRSS2FzUFFZbDk5Y2hNcWo0VC9jSmJoQXZ2RHU1WSsy?=
 =?utf-8?B?VnN0dGRQWUQvRHF4bmdmd3BEdVh4MFkvSzV0VmNwSU5GajhadHNVY0JYcHNN?=
 =?utf-8?B?eXpLQUl1dDZqQ05IWFBBQ0pJR2w5VWRNWnFnRmxUUHJ0cWNjbWoyQ3lpdC9D?=
 =?utf-8?B?K04yWDVLSHNlTExLNzYwTE1DOEN6eko0NE4rVzJkSTY3N3JKTjVaa0pWRURC?=
 =?utf-8?B?TkNVYVhxKzRIOEV6UTVQK3M5N1lHWi92eUJ2anliQTNTYjhrbFIzaUJvSzVh?=
 =?utf-8?B?M0NzK3pPTzNQcUxsZ3ozR2Q1S3RtUW5JZFowY2E0TWI3cTYrd0dKVE9zcHNt?=
 =?utf-8?B?dkVHcU02L2ZWeEQzNHoxRWRRd01HU3RxVEUzdDdqeEZ5SVY4R3hhK2hpUFNF?=
 =?utf-8?B?a2hhbmYvY0hUQlZENDIrSlcvOCtxekh1OFZGTTdHYmF5Z21IWmx1enpncTRz?=
 =?utf-8?B?RzdtWHdieHo5U3lKOTNOVGJ5aWJXRGh3RncyeGQ5c3FZbGd6b0g5OHhXZXdP?=
 =?utf-8?B?SVhaSjhVQkxIV0lxTjY5dVRtZTFrOWt5aTErQUp3S0pwNUY5MmRnQi9SNHVG?=
 =?utf-8?B?UVZacXpSaUxWTHNkMzZXNTlPN0F4b0p3VDNJdEo5MVZwZEtKdmlNZ0tOS09R?=
 =?utf-8?B?Q1FnMDRsenNkQkJiQ0pEVUhNOWw2TzYvZjFYNVFVSkhIVUNOeWVjV05LZEx1?=
 =?utf-8?B?bU5CNjlNbENSVnVrR0xNWFRQek1SUFZHZkZwelltS2lSQjYrdWcrZ2RLWlNl?=
 =?utf-8?B?Qk1PQm5UVklnZ0NmN05ITEVla2dUcnF2TXZZd0RiVlVvM0s1UjdCSkdiZDhT?=
 =?utf-8?B?dTJSTkJaN1JEQ3kyQURsbS8rYXVWSzVEa24zakNOLzZrdnc3US9meEw3dEo1?=
 =?utf-8?Q?6RQ0=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB8451.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3239d0b1-3a92-4589-f87c-08dd353f5b72
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Jan 2025 08:33:58.9418
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: HKltqlwq0/20LrsfeuqiV5grC00Yd07bbXXU1gXOpWdRxBgLhZhFSVfQe9Ot97ULYrSihtKLMwY3H8O+h+itsg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB5642

W0FNRCBPZmZpY2lhbCBVc2UgT25seSAtIEFNRCBJbnRlcm5hbCBEaXN0cmlidXRpb24gT25seV0N
Cg0KSGksDQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogSmFuIEJldWxp
Y2ggPGpiZXVsaWNoQHN1c2UuY29tPg0KPiBTZW50OiBXZWRuZXNkYXksIEphbnVhcnkgMTUsIDIw
MjUgNDozMiBQTQ0KPiBUbzogUGVubnksIFpoZW5nIDxwZW5ueS56aGVuZ0BhbWQuY29tPg0KPiBD
YzogU3RhYmVsbGluaSwgU3RlZmFubyA8c3RlZmFuby5zdGFiZWxsaW5pQGFtZC5jb20+OyBIdWFu
ZywgUmF5DQo+IDxSYXkuSHVhbmdAYW1kLmNvbT47IFJhZ2lhZGFrb3UsIFhlbmlhIDxYZW5pYS5S
YWdpYWRha291QGFtZC5jb20+Ow0KPiBBbmRyeXVrLCBKYXNvbiA8SmFzb24uQW5kcnl1a0BhbWQu
Y29tPjsgQW5kcmV3IENvb3Blcg0KPiA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT47IEp1bGll
biBHcmFsbCA8anVsaWVuQHhlbi5vcmc+OyBTdGVmYW5vIFN0YWJlbGxpbmkNCj4gPHNzdGFiZWxs
aW5pQGtlcm5lbC5vcmc+OyBSb2dlciBQYXUgTW9ubsOpIDxyb2dlci5wYXVAY2l0cml4LmNvbT47
IHhlbi0NCj4gZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcNCj4gU3ViamVjdDogUmU6IFtQQVRD
SCB2MSAwMy8xMV0geGVuL3g4NjogaW50cm9kdWNlICJjcHVmcmVxPWFtZC1wc3RhdGUiIHhlbg0K
PiBjbWRsaW5lDQo+DQo+IE9uIDE1LjAxLjIwMjUgMDk6MTgsIFBlbm55LCBaaGVuZyB3cm90ZToN
Cj4gPj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gPj4gRnJvbTogSmFuIEJldWxpY2gg
PGpiZXVsaWNoQHN1c2UuY29tPg0KPiA+PiBTZW50OiBUaHVyc2RheSwgSmFudWFyeSA5LCAyMDI1
IDU6NTkgUE0NCj4gPj4NCj4gPj4gT24gMDMuMTIuMjAyNCAwOToxMSwgUGVubnkgWmhlbmcgd3Jv
dGU6DQo+ID4+PiAtLS0gYS94ZW4vYXJjaC94ODYvcGxhdGZvcm1faHlwZXJjYWxsLmMNCj4gPj4+
ICsrKyBiL3hlbi9hcmNoL3g4Ni9wbGF0Zm9ybV9oeXBlcmNhbGwuYw0KPiA+Pj4gQEAgLTU3NCw2
ICs1NzQsMTIgQEAgcmV0X3QgZG9fcGxhdGZvcm1fb3AoDQo+ID4+Pg0KPiA+Pj4gICAgICAgICAg
Y2FzZSBYRU5fUE1fQ1BQQzoNCj4gPj4+ICAgICAgICAgIHsNCj4gPj4+ICsgICAgICAgICAgICBp
ZiAoICEoeGVuX3Byb2Nlc3Nvcl9wbWJpdHMgJiBYRU5fUFJPQ0VTU09SX1BNX0NQUEMpICkNCj4g
Pj4+ICsgICAgICAgICAgICB7DQo+ID4+PiArICAgICAgICAgICAgICAgIHJldCA9IC1FTk9TWVM7
DQo+ID4+DQo+ID4+IEVOT1NZUyBpc24ndCBhcHByb3ByaWF0ZSBmb3Igc3VjaCBhIHNpdHVhdGlv
bi4NCj4gPg0KPiA+IEkndmUgbWlycm9yZWQgdGhlIHJldHVybiB2YWx1ZSwgc28gbWF5YmUgLUVJ
TlZBTCBpcyBiZXR0ZXI/DQo+DQo+IEdlbmVyYWxseSBtb3N0IHdyb25nIHVzZXMgb2YgRU5PU1lT
IHdhbnQgcmVwbGFjaW5nIGJ5IEVPUE5PVFNVUFAuDQoNCk9oLCB1bmRlcnN0b29kLg0KDQo+DQo+
IEphbg0KDQpNYW55IHRoYW5rcywNClBlbm55DQo=

