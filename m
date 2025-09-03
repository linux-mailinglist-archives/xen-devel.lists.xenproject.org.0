Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 41F01B412D4
	for <lists+xen-devel@lfdr.de>; Wed,  3 Sep 2025 05:17:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1107758.1458030 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1utdzQ-0003k0-LX; Wed, 03 Sep 2025 03:16:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1107758.1458030; Wed, 03 Sep 2025 03:16:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1utdzQ-0003hB-I8; Wed, 03 Sep 2025 03:16:52 +0000
Received: by outflank-mailman (input) for mailman id 1107758;
 Wed, 03 Sep 2025 03:16:52 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=4MrA=3O=amd.com=penny.zheng@srs-se1.protection.inumbo.net>)
 id 1utdzQ-0003h5-0o
 for xen-devel@lists.xenproject.org; Wed, 03 Sep 2025 03:16:52 +0000
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on20610.outbound.protection.outlook.com
 [2a01:111:f403:2009::610])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6d9a9e58-8874-11f0-9809-7dc792cee155;
 Wed, 03 Sep 2025 05:16:49 +0200 (CEST)
Received: from DM4PR12MB8451.namprd12.prod.outlook.com (2603:10b6:8:182::7) by
 DM4PR12MB6232.namprd12.prod.outlook.com (2603:10b6:8:a5::7) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9073.27; Wed, 3 Sep 2025 03:16:46 +0000
Received: from DM4PR12MB8451.namprd12.prod.outlook.com
 ([fe80::b04e:2da5:7189:4c4d]) by DM4PR12MB8451.namprd12.prod.outlook.com
 ([fe80::b04e:2da5:7189:4c4d%7]) with mapi id 15.20.9052.019; Wed, 3 Sep 2025
 03:16:46 +0000
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
X-Inumbo-ID: 6d9a9e58-8874-11f0-9809-7dc792cee155
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=k5Dlr+a1cpKF4zqvwow11H4lhwMh64Pg8DZPRme+0PxPcCdyyF819Yx/e3S42uUVHtCjZOQ161jAaXIV12QtuZoSpP//nMeq20ygn7+AfyNyqJZX/5iCzcaBnlX5obIyXQLnj/SQ6mTe691r3idd/5z3wQ0ktGvu9xdTmDcYWOgWBtoooc/MzaLLDAz+PSooCol8LtdVX/g27kWglJ2nA+2ACK8+Kn10Adz+WsDPQRYruDgFI6ohzDFT+TmOGMpXkwtkIUhTy2uSANPip9cWviLsmS3VSMpBHcilxZ65af/O5ey75kaeHLJFBnaNxJ/AA6SvmjCTS52AOKlPqdxccg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3MKx7kjQDyAnmV3fL3rzYARSgLguR1FN9t/RRvMOIP8=;
 b=qbcqddfGjrwYiQdXh9oMxbnNA85+GsM/fJZ5xbJQkiH4ZxJPvt5qSadsSeTQtHrVOPGnjBRRU5EEQ+7Nes2LAZ/yeFSQmi+BScVfA8zGuW03IotzxnMO4JT53OO9hfRzYkMA/Onj2Jh3qnkSkWeIUi1+eRIUXEAKM5OjrjOSY9ucBz+JxxoJN1doNuMi6DVWu9Gr36Pk3h7zvBeksXHf67cBQEIUNe85NwbEg/nAa54OdYJyeti52btuGCXosnf99GlLSGZukPd1WpBX+prz+g+EM7GWJKWvQeVdT2y30Ooja0eUaCJ7aih1y7hmP3+KIf1Yah1K5zBfW9UzN3XmCA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3MKx7kjQDyAnmV3fL3rzYARSgLguR1FN9t/RRvMOIP8=;
 b=FpdPoADAWfoCZl+x8xYNxawHSnGVwo6tKaRO4JGWK8hizELcXR4XNZRwDg7IJkOfixqPUiUwB/i1VFIffuaqUM7kZ76kYyoYlBAgYaBWvdpgfawJPVbGVY1Z5zmPFu1KE4oIu5bT3ZJWNGdPrG0WwAVAjOxT2cqxgmVqH3UxG1s=
From: "Penny, Zheng" <penny.zheng@amd.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "Huang, Ray" <Ray.Huang@amd.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?=
	<roger.pau@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>, "Orzel,
 Michal" <Michal.Orzel@amd.com>, Julien Grall <julien@xen.org>, Stefano
 Stabellini <sstabellini@kernel.org>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
Subject: RE: [PATCH v8 1/8] xen/cpufreq: introduce new sub-hypercall to
 propagate CPPC data
Thread-Topic: [PATCH v8 1/8] xen/cpufreq: introduce new sub-hypercall to
 propagate CPPC data
Thread-Index: AQHcGAMFn6LyRgMx2kqwcXFBCS++s7R4BJqAgAjNW6A=
Date: Wed, 3 Sep 2025 03:16:45 +0000
Message-ID:
 <DM4PR12MB8451A3BB721E24CB0D4DDC62E101A@DM4PR12MB8451.namprd12.prod.outlook.com>
References: <20250828100306.1776031-1-Penny.Zheng@amd.com>
 <20250828100306.1776031-2-Penny.Zheng@amd.com>
 <00e4af60-6916-4a71-b797-757c1163579a@suse.com>
In-Reply-To: <00e4af60-6916-4a71-b797-757c1163579a@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
 MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Enabled=True;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_SetDate=2025-09-03T03:16:40.0000000Z;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Name=Open
 Source;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_ContentBits=3;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Method=Privileged
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR12MB8451:EE_|DM4PR12MB6232:EE_
x-ms-office365-filtering-correlation-id: 96bebdb9-4047-489a-18ec-08ddea985052
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|376014|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?N0hya29IRklTTmZaTDJJbFZYTFJIYS9PUUZjSU1CTUpjWlVZNGkvTDl5aFAx?=
 =?utf-8?B?bDNhdkE2ZEJ0ZUtlUG4vcWc2d2lrMm9VbHkvMFlnZXd6ZmppOE9pUllUbCtJ?=
 =?utf-8?B?ZWhZVGpwZklaWkw5enJtQ0hEV2JXT3FCWS83bVI2OUVUYlVBRXhsYmV6aFpF?=
 =?utf-8?B?cjI5NnpDclJCQVhVNTQxTlB0Nkl5bVdRL0RoRGJiRWpPc0d2ZVViOTBUM1ls?=
 =?utf-8?B?MFNvMFV6UGpzOFZvNkh6R0dsNVdrdXY5emxTNXF1dEZQeDhCZzlTQzJLT2FU?=
 =?utf-8?B?R3h0NTNudk85VEZPNVArNHMycGFWUjMzKzFwU0lBdUNYWjNzR1pRWHBPNHhn?=
 =?utf-8?B?YkJ0cFAwK3Y0VXBjRTlZM3U5ak54U2VlTmg3UE8wN3p6ci8zUFNOdDZlQmV4?=
 =?utf-8?B?Mk5TQ3QrM0dMejYxRVRTVTFDZDUybHpubFI1OEVYRmw3cXgvLzFWYmpXY2tz?=
 =?utf-8?B?T2FMbGM4YUNxNEFsRktwR2hZQUpjbjlYTHJoR21ia2liMFBmRmdhQ1VnVHZn?=
 =?utf-8?B?L3VQTXE2bExBR3VxL0VGWE16VXl2YkhSTkZkQzlmMmJEYTI3dEE1by9lSWdx?=
 =?utf-8?B?RXR1Tk5mclU2VDR6WDNUYlhZeTZ1VDZQekRocWhFbE9rZVRLUkFBKzkxMm5P?=
 =?utf-8?B?UW1xV3RaUWk1amNLSjFOV1B3V3o3WDU2Qkk3M0k4SkYydThPTUVlOFNxUlJz?=
 =?utf-8?B?VDN4Vlo1TEJVcGRybjZ3RlgwZU5jOUxFNkN3M2c0VlRzOWFValhEOXVQY3Zn?=
 =?utf-8?B?dTZJN0VTTkhQZVdZd2FTdHVqeWdQYkUrck8vaEVCSnRTMVQyaXV0Y3BtUGdD?=
 =?utf-8?B?QTNvYmdFd3J1Q3l5SUJtYVBJNnFXQ201cTF2YUNZMitzZ0VGem1vVlg3L3Yx?=
 =?utf-8?B?NENYQlFtaVo2Mit6UHBqaXdPcXo1V3VLYjl3a1dXU1RLUFN2QW1YVWZhZnU2?=
 =?utf-8?B?U0FOMGphS1k1OG04eUNQcEhlMTlhbTg5RnIvQnJ1QlErL3g2ZDloQ0lLNjl3?=
 =?utf-8?B?VnZXZm5tUms2aHhrM1M5RTdYNkc5ZGhpSzNTVDhYNmdHYjI0U3p0Z3NheGxE?=
 =?utf-8?B?VVAxK2ROd29HYmJMWFMvZDVha1pzbUxIRG51WTVaWUxMb2NVeXE2WjluNEg3?=
 =?utf-8?B?RCtqL2xFd1BpdS9mTWlkd2R6RS9IQ0VsdXhtQm1CMVJITytnWTVjbW5KQ1Ir?=
 =?utf-8?B?Zkw0aU5DU000ampBbUxzY3M1MEwrNFF6Zm1NdWFQUlUxaWU4a2tLNzJ5RHRF?=
 =?utf-8?B?L1dGeWk5Q1ZQcUFHYWg3VjdCZTVCWW1SOE91UERHUE5VS2w4L0Fxd0JmK1k3?=
 =?utf-8?B?bkhmOW1Ha0hLV3lsc2hhaENhcFJLMWFucWwwMG0wdjdtanp5NG9FYmtuL2Jv?=
 =?utf-8?B?TDB0QUZ2SFBRRjlSN3h4MmJuNmxUckNKVmxib0wxeUZ6UUIwaG5maUszUE85?=
 =?utf-8?B?N1V6TGgrdWxENXNjL3hOdjVxRWowR2NiTjJRNzM2cWZ1akNKMHhJRThJdUZP?=
 =?utf-8?B?dmtxUHlTTERpcnpmeVg3d3JOU1hpZnlWNHVQbWlSTHdsL2FhNjdnTWpOQllC?=
 =?utf-8?B?NXREYlNrNGc3QVBTUDNUZDFYTXpSNC80Mmg2bFd5cldUMU1sUXlRd1NKTHpW?=
 =?utf-8?B?Qy93WmwzU0xtaENHN1pUcURIQ3R4VldtbnUybXllRVQ3d1dscGp2ZThuclRa?=
 =?utf-8?B?VFpOSHBRSE9WNmI4TytQc28xa25SeENiQndjMVczZXBlNWhzeWJ4NFBxamF1?=
 =?utf-8?B?Z0VYbEVFeVJNbjJWU2F4MzJLam1UYUpiQjlYNmtBRktDOWpiK3FFdWZkYkNo?=
 =?utf-8?B?UUJ0cWM3bXJadFQ2UG5DYzVreXd1SklBK0N2aDRoajZTRnkyQlpUNnJ3NDRn?=
 =?utf-8?B?cU5helByVFFVZTdHYTZ3VmxEeFN5anJJQmpJeTBTTGdwSTRSZFFGM0ppQVha?=
 =?utf-8?B?eEFIN1AwNXJ5ckhyd013SWllU01Mc1NEam1QbFFZa05vbnJYUlZ6amUrTWh3?=
 =?utf-8?B?Yjk4K1psaWxBPT0=?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR12MB8451.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?UHdkL0RMZVE3cDBVZFpydEpkelpraUtkSTFJY1pNSW1WNU1CekVnSUhaZ1Iy?=
 =?utf-8?B?bnVpd2dYWWtJV3B6YTAxUzBYT0VlTEJkbWVPYXRrMU9pVGtER0tGTGdhSExp?=
 =?utf-8?B?UE90ZUcxRUJIQnM3TG1VTjl3YWZ1aythN3BKVmR2dXo5cGZLRGJ5WVRCTDBN?=
 =?utf-8?B?WkN4dmx0cnZDcnhZR1h5ckRRT0RPaGlyK1d3RDMrT1JHYndSb1VtNFcrMmxB?=
 =?utf-8?B?TnRTRTFGZDlhckViemJOdWIrY1AwUjgrVnhZRk9zUUxYQkJSN3Z0bUtWVVI4?=
 =?utf-8?B?VTJNeWdCRGRnRzhNUGdiMVlOdVZPNFJ3VzJ6QjdHcXpxMDNmVzNBQmJQRTVx?=
 =?utf-8?B?UmRRN0NYci8xa0RGQWRJRGhJYWkyWGFWYndjeXdqaVEvMm4wMitSR2MyWkpN?=
 =?utf-8?B?WWd1dk1maVNVbXVvL1NFWU5COFhrZ210OElXYXdpUmdOQU8yY1FWVzZRcDgr?=
 =?utf-8?B?OG15QjN6WmNERE43NGpoMmZTY3A4ZEQwK2wrbVJtMStURW5jZ1J4aThoOEN0?=
 =?utf-8?B?RGFQRWs5OGEwU3IxSzRvOFZYWEFRS3FVOFgvYjVsZWJMWEJLSTFXa093Y1FC?=
 =?utf-8?B?TFhqZmRaWVMwR0JhQThBbTRwS0JmaFV0OGZnSnF4QnJHbkk2MSsvMHZiTWhq?=
 =?utf-8?B?emczcnYxL2J1bzd1bm9oczczbVJhKzRpRWY5SEtwVFRDdjg5bXoyakozLzBL?=
 =?utf-8?B?WkMyOUF5clFtbGVUMDhzVWlkZ1UxWGxnRVJmZFlVVU1GdFlyaFJzTzNsSTQ2?=
 =?utf-8?B?TkhUUGtudUQ1SWdFbnFNK3BGNytZRGMrbS9UUzZZZjZabWUrV2QwemtkQloy?=
 =?utf-8?B?TVplSVJmZU80TEFCWStnU3VhVFQ1MFN2TzhrdzFwWjBtUzRYRW82bEF1eCtv?=
 =?utf-8?B?VzBWVWNKZS80OUhibzI2Tk51QlpIKzdTUFh4U1cxUjk5cE51djlFcDdEMUoz?=
 =?utf-8?B?THNFdzJqbm9hemsrYytaRUtkazFzU2g0ZUwwbUdVQWRHZ0FpYjVudUhoUExz?=
 =?utf-8?B?MHNIUklRY2wrNFhzSWdSb1ZWYXFvcmRhaHJaL0FrK09RbmpVNXJONEo1YmlU?=
 =?utf-8?B?b3NLU1Nxc1p5Y0hJaTlVTmJKM0dRYXRHVFljY3NFMXF2NnFmMldCci9DbXdJ?=
 =?utf-8?B?M0x6WjlaT3VZTmdLakNjdFdoTWpJZlZuNlJjaHVubVVZWTRsdlpaNFNzTm9X?=
 =?utf-8?B?UkpVZVdaS3ltMzlSOXVNOXRLWFp5TFZlOHhqa2IrR3BTQmdhMkdaWlFUYVV6?=
 =?utf-8?B?cWJ2WUJhTUl5Sk5veEdjelNLR3lYQ0RSbEpPcGlDc3A1MUVMQmNYdGR6NDBB?=
 =?utf-8?B?SFFFQ1ZCN25LakpKUkZzcVpRVVo5cTg4K3VCZTBLc3VlckpJazJRNjJDcnpP?=
 =?utf-8?B?U2hWU1c0NTB5TzB0eXpNTmMyUlNtU2lkK09sNXg0Ky9pd01hSkp6QzV4ZXhj?=
 =?utf-8?B?K3pZcU53eVk1ZHZjZFZON3ZQYk9BUjdkYlcvdkNtb3VBNGlIU3VxRkNlemx6?=
 =?utf-8?B?WDZpZ3hrckh4MWE3NUNwc1JVbDRmVkIwUnB3dmpSc1kxNlV5VUttNDRmMG9n?=
 =?utf-8?B?R2hMVnNTL3BDa1R1MnEzUjZ3UE9TZ29ETDdndlc5aEh3aW1yVmQ1UG8zSWVi?=
 =?utf-8?B?SXpjU2daR1RVc3BESlVtZ2x5elpEeVhMY0FaTzhTNFZjT0lYQlFHYWJlbnNH?=
 =?utf-8?B?OWc5dTZ5VVlFTzRyU28vSWIrbzN0aWducklqd1FzSkVEbmljNVh0eTc1dkF3?=
 =?utf-8?B?d0ZDS2VNQjNIekQ2R2xCZWg2N2RTTjIrYndNNXlQclpjQVJ6UWpBREo5Z2tP?=
 =?utf-8?B?NGtyY3R0cE5xY3owTXZUelhlbEJhdWhNR3h1R0x6SkdVbC9QclN2U3VaamJa?=
 =?utf-8?B?QWovYTVGMktHUmx2L3JjZVRpSUNoc1B4NGNSaXIxKzhZK2FFdm1wbnZIQXpz?=
 =?utf-8?B?RFNydk5KZ1NSQ2hvSmNIdzYxbE9pZFdjUGlzVkVLemVBODdUaDNITUdoU25N?=
 =?utf-8?B?dXVhMWRydDlRMkIwZEp6R1h3QW5iN3VuOVd2ODl5RXc0bTdCOVVwTnVUQm0y?=
 =?utf-8?B?andMM1oyZ09iSkV0TDRCajFFVVRCSWRFZ04xdkt2d2hVTjgxeDlJdTV3aTAv?=
 =?utf-8?Q?qfFw=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB8451.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 96bebdb9-4047-489a-18ec-08ddea985052
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Sep 2025 03:16:45.9929
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: xyNyFMEX1xrggic0KJ5BWGJ18BA/wRhOZ8tmllqerpPhDFdcCtg/tfwx1eDRrmW8CB6egn5lN08gMBZsn0CSAA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6232

W1B1YmxpY10NCg0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBKYW4gQmV1
bGljaCA8amJldWxpY2hAc3VzZS5jb20+DQo+IFNlbnQ6IFRodXJzZGF5LCBBdWd1c3QgMjgsIDIw
MjUgODo1MCBQTQ0KPiBUbzogUGVubnksIFpoZW5nIDxwZW5ueS56aGVuZ0BhbWQuY29tPg0KPiBD
YzogSHVhbmcsIFJheSA8UmF5Lkh1YW5nQGFtZC5jb20+OyBBbmRyZXcgQ29vcGVyDQo+IDxhbmRy
ZXcuY29vcGVyM0BjaXRyaXguY29tPjsgUm9nZXIgUGF1IE1vbm7DqSA8cm9nZXIucGF1QGNpdHJp
eC5jb20+Ow0KPiBBbnRob255IFBFUkFSRCA8YW50aG9ueS5wZXJhcmRAdmF0ZXMudGVjaD47IE9y
emVsLCBNaWNoYWwNCj4gPE1pY2hhbC5PcnplbEBhbWQuY29tPjsgSnVsaWVuIEdyYWxsIDxqdWxp
ZW5AeGVuLm9yZz47IFN0ZWZhbm8gU3RhYmVsbGluaQ0KPiA8c3N0YWJlbGxpbmlAa2VybmVsLm9y
Zz47IHhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZw0KPiBTdWJqZWN0OiBSZTogW1BBVENI
IHY4IDEvOF0geGVuL2NwdWZyZXE6IGludHJvZHVjZSBuZXcgc3ViLWh5cGVyY2FsbCB0byBwcm9w
YWdhdGUNCj4gQ1BQQyBkYXRhDQo+DQo+IE9uIDI4LjA4LjIwMjUgMTI6MDIsIFBlbm55IFpoZW5n
IHdyb3RlOg0KPiA+IEBAIC02OTMsNiArNjk5LDEyMCBAQCBpbnQgYWNwaV9zZXRfcGRjX2JpdHMo
dW5zaWduZWQgaW50IGFjcGlfaWQsDQo+IFhFTl9HVUVTVF9IQU5ETEUodWludDMyKSBwZGMpDQo+
ID4gICAgICByZXR1cm4gcmV0Ow0KPiA+ICB9DQo+ID4NCj4gPiArc3RhdGljIHZvaWQgcHJpbnRf
Q1BQQyhjb25zdCBzdHJ1Y3QgeGVuX3Byb2Nlc3Nvcl9jcHBjICpjcHBjX2RhdGEpIHsNCj4gPiAr
ICAgIHByaW50aygiXHRfQ1BDOiBoaWdoZXN0X3BlcmY9JXUsIGxvd2VzdF9wZXJmPSV1LCAiDQo+
ID4gKyAgICAgICAgICAgIm5vbWluYWxfcGVyZj0ldSwgbG93ZXN0X25vbmxpbmVhcl9wZXJmPSV1
LCAiDQo+ID4gKyAgICAgICAgICAgIm5vbWluYWxfbWh6PSV1TUh6LCBsb3dlc3RfbWh6PSV1TUh6
XG4iLA0KPiA+ICsgICAgICAgICAgIGNwcGNfZGF0YS0+Y3BjLmhpZ2hlc3RfcGVyZiwgY3BwY19k
YXRhLT5jcGMubG93ZXN0X3BlcmYsDQo+ID4gKyAgICAgICAgICAgY3BwY19kYXRhLT5jcGMubm9t
aW5hbF9wZXJmLCBjcHBjX2RhdGEtPmNwYy5sb3dlc3Rfbm9ubGluZWFyX3BlcmYsDQo+ID4gKyAg
ICAgICAgICAgY3BwY19kYXRhLT5jcGMubm9taW5hbF9taHosIGNwcGNfZGF0YS0+Y3BjLmxvd2Vz
dF9taHopOyB9DQo+ID4gKw0KPiA+ICtpbnQgc2V0X2NwcGNfcG1pbmZvKHVuc2lnbmVkIGludCBh
Y3BpX2lkLA0KPiA+ICsgICAgICAgICAgICAgICAgICAgIGNvbnN0IHN0cnVjdCB4ZW5fcHJvY2Vz
c29yX2NwcGMgKmNwcGNfZGF0YSkgew0KPiA+ICsgICAgaW50IHJldCA9IDAsIGNwdWlkOw0KPg0K
PiBFY2xhaXIgZG9lc24ndCBsaWtlIHRoaXM6DQo+DQo+IFJlcG9ydHMgZm9yIHNlcnZpY2UgTUMz
QTIuUjUuMw0KPg0KPiBzZXJ2aWNlIE1DM0EyLlI1LjM6IChyZXF1aXJlZCkgQW4gaWRlbnRpZmll
ciBkZWNsYXJlZCBpbiBhbiBpbm5lciBzY29wZSBzaGFsbCBub3QNCj4gaGlkZSBhbiBpZGVudGlm
aWVyIGRlY2xhcmVkIGluIGFuIG91dGVyIHNjb3BlICgxIG9mIDEgdmlvbGF0aW9uKQ0KPg0KPiAg
dmlvbGF0aW9uIGZvciBNQzNBMi5SNS4zIHVudGFnZ2VkDQo+IHhlbi9hcmNoL3g4Ni9pbmNsdWRl
L2FzbS9wcm9jZXNzb3IuaDoxMzAuMjAtMTMwLjI0Og0KPiBub24tY29tcGxpYW50IGZ1bmN0aW9u
IGBjcHVpZCh1bnNpZ25lZCwgdW5zaWduZWQqLCB1bnNpZ25lZCosIHVuc2lnbmVkKiwNCj4gdW5z
aWduZWQqKScgKHVuaXQgYHhlbi9kcml2ZXJzL2NwdWZyZXEvY3B1ZnJlcS5jJyB3aXRoIHRhcmdl
dA0KPiBgeGVuL2RyaXZlcnMvY3B1ZnJlcS8uY3B1ZnJlcS5vLnRtcCcpOiB0aGVyZSBpcyBhbm90
aGVyIGlkZW50aWZpZXIgYGNwdWlkJw0KPiB4ZW4vZHJpdmVycy9jcHVmcmVxL2NwdWZyZXEuYzo3
MjYuMTgtNzI2LjIyOg0KPiBub24tY29tcGxpYW50IGxvY2FsIHZhcmlhYmxlIGBjcHVpZCc6IHRo
ZXJlIGlzIGFub3RoZXIgaWRlbnRpZmllciBgY3B1aWQnDQo+DQo+IEknbSBmaXhpbmcgdGhpcyB1
cCBmb3IgeW91LCBidXQgSSBoYXZlIHRvIGFkbWl0IHRoYXQgSSdtIGdldHRpbmcgdGlyZWQgb2Yg
ZG9pbmcgc3VjaA0KPiBjbGVhbnVwcyBmb3Igc3VwcG9zZWRseS1yZWFkeS10by1jb21taXQgcGF0
Y2hlcy4NCj4NCg0KU28gc29ycnkuIEkgd2FzIG1pc3Npbmcgc3VjaCBtaXNyYSBDSSBpbiBvdXIg
aW50ZXJuYWwuIEknbGwgYWRkIGl0IHRvIGF2b2lkIHN1Y2ggZXJyb3JzDQoNCj4gSmFuDQo=

