Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D8F1C90E2BF
	for <lists+xen-devel@lfdr.de>; Wed, 19 Jun 2024 07:36:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.743401.1150292 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sJnye-0004IP-IA; Wed, 19 Jun 2024 05:35:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 743401.1150292; Wed, 19 Jun 2024 05:35:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sJnye-0004Gu-Dv; Wed, 19 Jun 2024 05:35:24 +0000
Received: by outflank-mailman (input) for mailman id 743401;
 Wed, 19 Jun 2024 05:35:23 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=WeeD=NV=amd.com=Jiqian.Chen@srs-se1.protection.inumbo.net>)
 id 1sJnyd-0004Go-K2
 for xen-devel@lists.xenproject.org; Wed, 19 Jun 2024 05:35:23 +0000
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2062f.outbound.protection.outlook.com
 [2a01:111:f403:2009::62f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b67ea022-2dfd-11ef-b4bb-af5377834399;
 Wed, 19 Jun 2024 07:35:19 +0200 (CEST)
Received: from BL1PR12MB5849.namprd12.prod.outlook.com (2603:10b6:208:384::18)
 by SJ2PR12MB8062.namprd12.prod.outlook.com (2603:10b6:a03:4c8::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7677.30; Wed, 19 Jun
 2024 05:35:13 +0000
Received: from BL1PR12MB5849.namprd12.prod.outlook.com
 ([fe80::b77f:9333:3a5a:d285]) by BL1PR12MB5849.namprd12.prod.outlook.com
 ([fe80::b77f:9333:3a5a:d285%3]) with mapi id 15.20.7677.030; Wed, 19 Jun 2024
 05:35:13 +0000
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
X-Inumbo-ID: b67ea022-2dfd-11ef-b4bb-af5377834399
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hTUN2cFhEsz4SI+0crkDGxaXLq6OtAewgtEegpS8COX2lkIbKHQegBoK6WyPEIh3ZwIe2fs2/0ESznaFIZ6vh78bpBN0F5k5nldNjGLfMwB4oeMBXNIwo7YgPZNxdZZDX9Mr8WdHur0vNMcWHXI4+r1XhEjSzTiDc2rWAKfEqFF0j8QuZRzBGOrhHcattUlWXjaCuKfulLqn+7URLxrOEaFnhpYVKwQUYSvW8NHLzsACAgh+8ofDBcl/TCO+H8j0JLVUG0oscX5x8ySz1XUVOFEUBd0vX26znWOxZsGPznD+EPhKp6WyD3q4mVoAUHKWYvQVYhlb/v0XdSHuRqjigQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CzMA9lz9iA2SZWyeRQmXvLtV+c5nHm2p5SDzuMVJGM4=;
 b=BWFagARvK9kZf5vwLUxohHoUJSce4G2P1KYZprlWLZmfy1JvKc33FDcANKiZ1t7elFi1Ouw4MXfP7ltH/CeTnrRYhCFkN+WpVgXa7ZT0FUbR8exH00G0nmzwrF+tlWDKbv1dNBedUn//4jLL7QzASUAnhs/lhzp5o/JFkaJPwNSYLE64rHWjUsAzERc+UtnREabu3vf8BMpdMWPA8bUgT2PMiTLYUxlfWM8qw3FtmEES2kcpGBeFLlSaG3sxz43x6GLLtJUQRqIbzH1UNSuRqxe7NWCP0RX846JNHOsqo0+/VK8PjQAYAzXhC6WSjpfsTrgwcUAz7xPJISGtCxXPCQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CzMA9lz9iA2SZWyeRQmXvLtV+c5nHm2p5SDzuMVJGM4=;
 b=n2KX4LsorOgDXgm4KyYBxwU54lfK5SA5FCthhBZfPD0U2ZzG7FvWGB6LuzoBAjbWTGnLRFoeh4UGZamDk8/BvGXWmvB0+ulZUn2qeuMeNzzsJd4Uk4Ckx09gaEnRnNjR/GHbVBK7VswPrJjNsMrA+WKM0eylluf3TWFCrvlxUnI=
From: "Chen, Jiqian" <Jiqian.Chen@amd.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Andrew Cooper <andrew.cooper3@citrix.com>,
	=?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>, Wei Liu
	<wl@xen.org>, George Dunlap <george.dunlap@citrix.com>, Julien Grall
	<julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Anthony PERARD
	<anthony@xenproject.org>, Juergen Gross <jgross@suse.com>, "Daniel P . Smith"
	<dpsmith@apertussolutions.com>, "Hildebrand, Stewart"
	<Stewart.Hildebrand@amd.com>, "Huang, Ray" <Ray.Huang@amd.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, "Chen,
 Jiqian" <Jiqian.Chen@amd.com>
Subject: Re: [XEN PATCH v10 2/5] x86/pvh: Allow (un)map_pirq when dom0 is PVH
Thread-Topic: [XEN PATCH v10 2/5] x86/pvh: Allow (un)map_pirq when dom0 is PVH
Thread-Index: AQHawJTj1WGIKHaz7U+FK+dQX59GpLHMCLWAgAGOVID//52wgIAB5DMA
Date: Wed, 19 Jun 2024 05:35:13 +0000
Message-ID:
 <BL1PR12MB58494E4BAEDA35E24329432CE7CF2@BL1PR12MB5849.namprd12.prod.outlook.com>
References: <20240617090035.839640-1-Jiqian.Chen@amd.com>
 <20240617090035.839640-3-Jiqian.Chen@amd.com>
 <cb9910cd-7045-4c0d-a7cf-2bcf36e30cb2@suse.com>
 <BL1PR12MB5849FC16D91FADD5B7D30A63E7CE2@BL1PR12MB5849.namprd12.prod.outlook.com>
 <c41031f9-bf3f-472e-82be-c1efea07c343@suse.com>
In-Reply-To: <c41031f9-bf3f-472e-82be-c1efea07c343@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-exchange-imapappendstamp: BL1PR12MB5849.namprd12.prod.outlook.com
 (15.20.7677.026)
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BL1PR12MB5849:EE_|SJ2PR12MB8062:EE_
x-ms-office365-filtering-correlation-id: 4200681d-8699-4553-d860-08dc902197b1
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230037|376011|7416011|1800799021|366013|38070700015;
x-microsoft-antispam-message-info:
 =?utf-8?B?MHl1eWgzRWxEdlhPUlJpNE9xMURSdWZZbzhITDFHL28rdmovcklGSXM2cjM3?=
 =?utf-8?B?KzVaQmRTdHhzK1B4ZGZWREk4bW1DYXRUY1Q1YnJ4a3VOUEpkcGRHWGEyMHlI?=
 =?utf-8?B?NWxXU0FON3EzVjFYWnBxSjBJd25QaXFZSzJrSG9WVjVUbEEyRjFCTE9lUkJs?=
 =?utf-8?B?Yy82bWpsRnlJQzlMVjBjdktGbHQ0b2N1QVYzRVR0YmpNdHpaQXVqZDJFTW82?=
 =?utf-8?B?V2pwbHBxS3V3QlpwNExDV0tOQ1VUai9qZS9TUXZscVZoMHBOV2hZZE10S0gw?=
 =?utf-8?B?cG12NzZFckpGRGJtem94RFFzN2RzSCtpWURWV2svemc5bkZZRFQwS2hiT1FF?=
 =?utf-8?B?RE5YbmJha0ozMEZLNUtsaTRJMmVOVkxFcEh5UE1KQnNXWkFoOHZwNWhmRi9t?=
 =?utf-8?B?THVlV2dmSFJKUmhHMWVPVkF0Z3BMNG1sbnN6ZVF6OVZlNmNjc1FHeUNuOGJL?=
 =?utf-8?B?T0ExWXFwK1BZRkw1aE9uMWZkYW1wbWhraXl3WVd4U3RiUkt4d2wzQXUrcXBP?=
 =?utf-8?B?c1lRWkNjb2JEOGI1ZHQzY0FmWnBQT0NFN0hFTFZnSUVpWFMwTVVOSzhSaURN?=
 =?utf-8?B?TmFRWHdKdk1ML2pWQ1pLSkxmTm5LVndTaHZQVnRVdnVqV09zTVl5YW5hYWth?=
 =?utf-8?B?a2JTY0NXcm1rdmVzN3ZYV2V4cW8zZ3lXWXRNWm4wOVB1Y1dlOWFkZklwZDhF?=
 =?utf-8?B?N04zRnJTT3pEaW5Ed2NVWldhM2cvTnJpRzdpbXBhQ1BlcDc1T0toSDJIZEE2?=
 =?utf-8?B?bVlEVHE4LzZEZ2IvdmtJS0l1S2pONFBPM3RZZzZHVUFwWDBteFAwQjhMckhu?=
 =?utf-8?B?OFloYVBxUGNWTzFtYUtHaUEyQ21LaGp2WGFkWmZTdUhaT1R5d0JyMFRyZVdx?=
 =?utf-8?B?TVpmTDlyaWhQejhydE5FN2JJQ3g2TUx1Wi9nWGZ0MWtsUU1pVGxKemhKK1hL?=
 =?utf-8?B?dEhRbHg0Wmh4eUZCRUozZWNBSXZGZ2xLeXVJZTEvOGlEbHpSK2hRMzlIZURT?=
 =?utf-8?B?eXhqc1dDYm9CaFlzQm44YWZwd08vbU9QU2RLcld5NDRyUlpHZXVLWms3QjFo?=
 =?utf-8?B?d0UxbXdrYUpuNUR3SG5kaFEraTFHTExwdjRaWHVOOVlabXpZdlBJd2FpMU5E?=
 =?utf-8?B?MmtzR1BUUDVnUUFuZFBOZ3kxZWgzTjNxbWR2N3J6TzVEWWZ1SHRjSE9PTVZ2?=
 =?utf-8?B?WWVEUkt5Z081VEo0Y1NrOEVGNmh3Znh5eDRHcDcxYTArNGp4d0crYzZuSFg5?=
 =?utf-8?B?T2VDU1hHU1RVVUl3MWllTVJDbnNPc0RvbHdBUS85SXdBSlFnZXVENHlxUGhU?=
 =?utf-8?B?SzFMei9sMkdzaEhzdHRhSm5kREpWbEVUenZldW9GK01raWxzcStoNyswN0N0?=
 =?utf-8?B?VmhWZzlJOUpxUjhEYVcvR1lRL3dOR29xbjN2UXFBdWsvZ2V3dk9kT0IyZS9J?=
 =?utf-8?B?TzhYa2s1SlFOa0NPaFlkUTZ2WHlLVWtUWU5idzB1eUJCb2kwY1NORFc1UEVB?=
 =?utf-8?B?WVZVTXFOMGE5eEpuWjcxbzNLL3AwRE9FN1duS1U1WEJyMnJWbFdWSFo5WXNl?=
 =?utf-8?B?SGJmbHdSck1FNmI4UVVrb3RYeTM0TElBYmJTTnZ5cW5UZStvQU1NWXpIQ09G?=
 =?utf-8?B?QVgwa1hwRlV6WnhSQWs0VC9sbUpzWEJwSzVESXJWUGJOdFdCKzJYUjdoUUNQ?=
 =?utf-8?B?aVViamZ5QWMzUnNwN0c4TWRXZmhxd0l4R29qYjdramluSkxYUlhySGs3U3Vw?=
 =?utf-8?B?ODcwZ1pxSjdocS9rMzIyVE1xODZZK0xpS2x1cTVuWjFkQWxHZTRrSWlBQlBy?=
 =?utf-8?Q?TWPfjR6XfHgeacW9wObqYWqDAa0aQKqf/lcIU=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR12MB5849.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230037)(376011)(7416011)(1800799021)(366013)(38070700015);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?ZU83clFWUWVMNzlGM0MyVFpXK05MTTJPQS8ra0RQZVpoa0hwRnhBK21yV1BR?=
 =?utf-8?B?em5iQVlVREhsajIrRFI0R2RQREdjdjRPQk9xVlVTK3ovZkQvVUZtdHlsMzBr?=
 =?utf-8?B?cU00QjV3bFE1T2NWcVhOc1U5Qi9wNWVGMlRMMmtwVDlOQ3JwWkc5WGZrMVhx?=
 =?utf-8?B?SXVGeWo1Tk9uR1pUU21EekZRVWpVRFYrVWtTSEZvMTdTeThHakplSVl4cmQ0?=
 =?utf-8?B?ZTNxaVlJTkhpcjZRYUdnL2xTNGpVbE4vZzQycGhnUHJCblNYN2VqTlNPbnlI?=
 =?utf-8?B?ekFnd0M0VUZoY2FDUGM4eTRPU2QwT2FFSmR2RCs0dXZnL0ZKSTR3TUdVQWs3?=
 =?utf-8?B?ai8rSlJranBwQ3Vaams0Zmh0ek54MWI3N2tqOXdzeVVsOFA1YkVnZGxmRGFj?=
 =?utf-8?B?MXQrQWk3dXRHMkd5b0tRa0VDZDUzYU9FQWgzbGdvTG1LUWVad0pqdjFVYXF6?=
 =?utf-8?B?VFBEN1hvWTkwVm9aaDlFcm1JUGlxTmpjeVNmTVN4dUZmcllFYnBUTjQvVVlk?=
 =?utf-8?B?VE40Q1Z6eUNqT1puaHAzWE9ZbWt5RDVHcU1ZSHViMkRqOWZTelBoeUcxMDlz?=
 =?utf-8?B?WWhWeVIyb3RUVko4Rm5DbTdIZWJmYXk1YmRqWEhFRWo1ckF6LzBUNFRJM0dy?=
 =?utf-8?B?UjNkdjFYWFBtOUV3M2lpb21LajJ3akZFVHV5ZzZoNE8zQXAwcndiaTQweFow?=
 =?utf-8?B?dm5jSnBHcjk5Q2ZDcmNxc1FKc1ZKQWlldWRtSTdISENZQlpXVGQ4MlJvZ0pK?=
 =?utf-8?B?RGpKODFBaFV2Skh3dFI0azN1RGhWQTcwb25yZTcwUnZaOFlGUVFOWmk0TGln?=
 =?utf-8?B?d0JWR0ZYdE1raHc1MUdBSU9lc1RMZlZ2TUx6NWlFbndBLzJIRW9iSXNlbVAx?=
 =?utf-8?B?V0FiOWxKV083aWdaQnF6U3NrbzhCaFFNa0tFa1JKeWVYeXUwcksyYXdkZWJG?=
 =?utf-8?B?czE2Y2FkaXpSbURDWTdJRFlCUXZzNVNNc1RzOFN1NWdrQ1dndWpqZnVOOXBO?=
 =?utf-8?B?ZGVFRkF3ODVKMktxU0FDOTFiUEViTTBHYmszSmp4dGdobHo0VGt5emtScjY2?=
 =?utf-8?B?QkZsQ0lwTjZYc3Q2SzhUMW1HOTBrRzBFQ3ZkeUYzZ2tDaXhqUXhOa2xhdGpX?=
 =?utf-8?B?aklkTWpkcG91K1EwamhqSmVtOHVlUndqV01WZkhaSjFoQ0pwdFp1R1hub01E?=
 =?utf-8?B?Qi83d0tNUCtoUTlMK3prL0hFdVJjcHhCRXUrQk4xaWNsN3hheXA3MVg2bzBt?=
 =?utf-8?B?T2lFdmJjVkpvY05KSEgvbU9MOWR5UXh6bXhFMXZZcGJoODV6aFhMV0pOdi85?=
 =?utf-8?B?V0tjajZZV296VFczb2JTc09xaDR4R0tPSjROU2pVdmpPVmlWR2k4QXVkK29G?=
 =?utf-8?B?dVlHZVNtb21oOHo0dG9Idkp2MFhQeVZQNElDbHdyNmNsVG4rZ3NENzRlS3FB?=
 =?utf-8?B?NGFCaUJlQisrTEljbHlJUXRGT0FNaGhyWm9tMzN6Kzd5VVM5TFdZL2xCeUVj?=
 =?utf-8?B?ZkZ4WjB6eFgyWWxDVGNMMDVjUzQxZXoreGR6VzlFYXhCRnI2U2xHSStjODJl?=
 =?utf-8?B?Si9oR2U1MFVYQW1renJndUcyMXNOQ1NVVlZmTGNiWVNzaEhQcEpFcEs5QzR2?=
 =?utf-8?B?SGFYTlE4MlVrOXJJVnUrRkxKWmlndjZibGgzSTVFUEtNQ3ZrV3VXbHQwR1BN?=
 =?utf-8?B?a3k3NjI0Q0lkYk1SMUFtcGhKTFdFYVdXR0NVQ0lXYkxtNGtBdndlLzRYa0FE?=
 =?utf-8?B?QjdCRms4a3lnZ3hzVXBSakJINzJJTnQrVmNyQi9iOUVvR0tPVVpya2tQTVhz?=
 =?utf-8?B?Y25McGtmajZEeHNCWTZzNm44bk5uTUtEVE04ai9kYnRNY1FSeE8waHNGYUw2?=
 =?utf-8?B?YlZpWE9CSzhHT0FvVW9iVzNrTzIxaXpHckFRcFZic0wzeVNMekYxNWpscTFw?=
 =?utf-8?B?dWlVSHVqREJOTENVQmVkdlBOVzFNaUZsc1krcE81ZE8rRXljNTJ3RVdOd2x0?=
 =?utf-8?B?aEFGZXZPYVo5aWV4U3k5cTZkZkloWjFOcmo1Ulh2dnFlbmNkczdkZEx4Z3Mw?=
 =?utf-8?B?Wk5zazBBZUxUUDhxQ2swaVdZWmxEaURvTTJ1WENNREwxTkVIODUyWjBYVnZM?=
 =?utf-8?Q?FT1Y=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <2C803258AA12A647BB381ABCB163D2F3@amdcloud.onmicrosoft.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5849.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4200681d-8699-4553-d860-08dc902197b1
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Jun 2024 05:35:13.2485
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: EQToiEf8Y1SpL89jRpuoDDvGEenIA176lzoMUD5n/Hp5V6vInwK7ALIwnjDGHDyJQvto7ZamxQv2JI6FsiAZGQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB8062

T24gMjAyNC82LzE4IDE2OjM4LCBKYW4gQmV1bGljaCB3cm90ZToNCj4gT24gMTguMDYuMjAyNCAw
ODo0OSwgQ2hlbiwgSmlxaWFuIHdyb3RlOg0KPj4gT24gMjAyNC82LzE3IDIyOjQ1LCBKYW4gQmV1
bGljaCB3cm90ZToNCj4+PiBPbiAxNy4wNi4yMDI0IDExOjAwLCBKaXFpYW4gQ2hlbiB3cm90ZToN
Cj4+Pj4gSWYgcnVuIFhlbiB3aXRoIFBWSCBkb20wIGFuZCBodm0gZG9tVSwgaHZtIHdpbGwgbWFw
IGEgcGlycSBmb3INCj4+Pj4gYSBwYXNzdGhyb3VnaCBkZXZpY2UgYnkgdXNpbmcgZ3NpLCBzZWUg
cWVtdSBjb2RlDQo+Pj4+IHhlbl9wdF9yZWFsaXplLT54Y19waHlzZGV2X21hcF9waXJxIGFuZCBs
aWJ4bCBjb2RlDQo+Pj4+IHBjaV9hZGRfZG1fZG9uZS0+eGNfcGh5c2Rldl9tYXBfcGlycS4gVGhl
biB4Y19waHlzZGV2X21hcF9waXJxDQo+Pj4+IHdpbGwgY2FsbCBpbnRvIFhlbiwgYnV0IGluIGh2
bV9waHlzZGV2X29wLCBQSFlTREVWT1BfbWFwX3BpcnENCj4+Pj4gaXMgbm90IGFsbG93ZWQgYmVj
YXVzZSBjdXJyZCBpcyBQVkggZG9tMCBhbmQgUFZIIGhhcyBubw0KPj4+PiBYODZfRU1VX1VTRV9Q
SVJRIGZsYWcsIGl0IHdpbGwgZmFpbCBhdCBoYXNfcGlycSBjaGVjay4NCj4+Pj4NCj4+Pj4gU28s
IGFsbG93IFBIWVNERVZPUF9tYXBfcGlycSB3aGVuIGRvbTAgaXMgUFZIIGFuZCBhbHNvIGFsbG93
DQo+Pj4+IFBIWVNERVZPUF91bm1hcF9waXJxIGZvciB0aGUgZmFpbGVkIHBhdGggdG8gdW5tYXAg
cGlycS4NCj4+Pg0KPj4+IFdoeSAiZmFpbGVkIHBhdGgiPyBJc24ndCB1bm1hcHBpbmcgYWxzbyBw
YXJ0IG9mIG5vcm1hbCBkZXZpY2UgcmVtb3ZhbA0KPj4+IGZyb20gYSBndWVzdD8NCj4+IFllcywg
Ym90aC4gSSB3aWxsIGNoYW5nZSB0byBhbHNvICJhbGxvdyBQSFlTREVWT1BfdW5tYXBfcGlycSBm
b3IgdGhlIGRldmljZSByZW1vdmFsIHBhdGggdG8gdW5tYXAgcGlycSIuDQo+Pg0KPj4+DQo+Pj4+
IEFuZA0KPj4+PiBhZGQgYSBuZXcgY2hlY2sgdG8gcHJldmVudCBzZWxmIG1hcCB3aGVuIHN1Ympl
Y3QgZG9tYWluIGhhcyBubw0KPj4+PiBQSVJRIGZsYWcuDQo+Pj4NCj4+PiBZb3Ugc3RpbGwgdGFs
ayBvZiBvbmx5IHNlbGYgbWFwcGluZywgYW5kIHRoZSBjb2RlIGFsc28gc3RpbGwgZG9lcyBvbmx5
DQo+Pj4gdGhhdC4gQXMgcG9pbnRlZCBvdXQgYmVmb3JlOiBXaHkgd291bGQgeW91IGFsbG93IG1h
cHBpbmcgaW50byBhIFBWSA0KPj4+IERvbVU/IElPVyB3aGF0IHB1cnBvc2UgZG8gdGhlICJkID09
IGN1cnJkIiBjaGVja3MgaGF2ZT8NCj4+IFRoZSBjaGVja2luZyBJIGFkZGVkIGhhcyB0d28gcHVy
cG9zZSwgZmlyc3QgaXMgSSBuZWVkIHRvIGFsbG93IHRoaXMgY2FzZToNCj4+IERvbTAod2l0aG91
dCBQSVJRKSArIERvbVUod2l0aCBQSVJRKSwgYmVjYXVzZSB0aGUgb3JpZ2luYWwgY29kZSBqdXN0
IGRvICghaGFzX3BpcnEoY3VycmQpKSB3aWxsIGNhdXNlIG1hcF9waXJxIGZhaWwgaW4gdGhpcyBj
YXNlLg0KPj4gU2Vjb25kIEkgbmVlZCB0byBkaXNhbGxvdyBzZWxmLW1hcHBpbmc6DQo+PiBEb21V
KHdpdGhvdXQgUElSUSkgZG8gbWFwX3BpcnEsIHRoZSAiZD09Y3VycmQiIG1lYW5zIHRoZSBjdXJy
ZCBpcyB0aGUgc3ViamVjdCBkb21haW4gaXRzZWxmLg0KPj4NCj4+IEVtbW0sIEkgdGhpbmsgSSBr
bm93IHdoYXQncyB5b3VyIGNvbmNlcm4uDQo+PiBEbyB5b3UgbWVhbiBJIG5lZWQgdG8NCj4+ICIg
UHJldmVudCBtYXBfcGlycSB3aGVuIGN1cnJkIGhhcyBubyBYODZfRU1VX1VTRV9QSVJRIGZsYWcg
Ig0KPj4gaW5zdGVhZCBvZg0KPj4gIiBQcmV2ZW50IHNlbGYtbWFwIHdoZW4gY3VycmQgaGFzIG5v
IFg4Nl9FTVVfVVNFX1BJUlEgZmxhZyAiLA0KPiANCj4gTm8uIFdoYXQgSSBtZWFuIGlzIHRoYXQg
SSBjb250aW51ZSB0byBmYWlsIHRvIHNlZSB3aHkgeW91IG1lbnRpb24gImN1cnJkIi4NCj4gSU9X
IGl0IHdvdWxkIGJlIG1vcmUgbGlrZSAicHJldmVudCBtYXBwaW5nIHdoZW4gdGhlIHN1YmplY3Qg
ZG9tYWluIGhhcyBubw0KPiBYODZfRU1VX1VTRV9QSVJRIiAod2hpY2gsIGFzIGEgc3BlY2lmaWMg
c3ViLWNhc2UsIGluY2x1ZGVzIHNlbGYtbWFwcGluZw0KPiBpZiB0aGUgY2FsbGVyIHNwZWNpZmll
cyBET01JRF9TRUxGIGZvciB0aGUgc3ViamVjdCBkb21haW4pLg0KT2gsIEkgc2VlLCBub3Qgb25s
eSB0byBwcmV2ZW50IHNlbGYtbWFwcGluZywgYnV0IGlmIHRoZSBzdWJqZWN0IGRvbWFpbiBoYXMg
bm8gUElSUXMsIHdlIHNob3VsZCByZWplY3QsIHNlbGYtbWFwcGluZyBpcyBqdXN0IHRoZSBvbmUg
c3ViIGNhc2UuDQoNCj4gDQo+PiBzbyBJIG5lZWQgdG8gcmVtb3ZlICJkPT1jdXJyZCIsIHJpZ2h0
Pw0KPiANCj4gUmVtb3ZpbmcgdGhpcyBjaGVjayBpcyB3aGF0IEknbSBhZnRlciwgeWVzLiBZZXQg
dGhhdCdzIG5vdCBpbiBzeW5jIHdpdGgNCj4gZWl0aGVyIG9mIHRoZSB0d28gcXVvdGVkIHNlbnRl
bmNlcyBhYm92ZS4NCj4gDQo+Pj4+IFNvIHRoYXQgZG9tVSB3aXRoIFBJUlEgZmxhZyBjYW4gc3Vj
Y2VzcyB0byBtYXAgcGlycSBmb3INCj4+Pj4gcGFzc3Rocm91Z2ggZGV2aWNlcyBldmVuIGRvbTAg
aGFzIG5vIFBJUlEgZmxhZy4NCj4+Pg0KPj4+IFRoZXJlJ3Mgc3RpbGwgYSBkZXNjcmlwdGlvbiBw
cm9ibGVtIGhlcmUuIE11Y2ggbGlrZSB0aGUgZmlyc3Qgc2VudGVuY2UsDQo+Pj4gdGhpcyBsYXN0
IG9uZSBhbHNvIHNheXMgdGhhdCB0aGUgZ3Vlc3Qgd291bGQgaXRzZWxmIG1hcCB0aGUgcElSUS4g
SW4NCj4+PiB3aGljaCBjYXNlIHRoZXJlIHdvdWxkIHN0aWxsIG5vdCBiZSBhbnkgcmVhc29uIHRv
IGV4cG9zZSB0aGUgc3ViLQ0KPj4+IGZ1bmN0aW9ucyB0byBEb20wLg0KPj4gSWYgY2hhbmdlIHRv
ICIgU28gdGhhdCB0aGUgaW50ZXJydXB0IG9mIGEgcGFzc3Rocm91Z2ggZGV2aWNlIGNhbiBzdWNj
ZXNzIHRvIGJlIG1hcHBlZCB0byBwaXJxIGZvciBkb21VIHdpdGggUElSUSBmbGFnIHdoZW4gZG9t
MCBpcyBQVkguIiwNCj4+IElzIGl0IE9LPw0KPiANCj4gS2luZCBvZiwgeWVzLiAiY2FuIGJlIHN1
Y2Nlc3NmdWxseSBtYXBwZWQiIGlzIG9uZSBvZiB0aGUgdmFyaW91cyBwb3NzaWJpbGl0aWVzDQo+
IG9mIG1ha2luZyB0aGlzIHJlYWQgYSBsaXR0bGUgbW9yZSBzbW9vdGhseS4NCk9LLg0KDQo+IA0K
PiBKYW4NCg0KLS0gDQpCZXN0IHJlZ2FyZHMsDQpKaXFpYW4gQ2hlbi4NCg==

