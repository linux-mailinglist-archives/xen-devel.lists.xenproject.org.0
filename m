Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AA258C850E
	for <lists+xen-devel@lfdr.de>; Fri, 17 May 2024 12:46:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.724027.1129216 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s7v5m-0002RB-T6; Fri, 17 May 2024 10:45:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 724027.1129216; Fri, 17 May 2024 10:45:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s7v5m-0002PZ-PH; Fri, 17 May 2024 10:45:38 +0000
Received: by outflank-mailman (input) for mailman id 724027;
 Fri, 17 May 2024 10:45:38 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=UPUr=MU=amd.com=Jiqian.Chen@srs-se1.protection.inumbo.net>)
 id 1s7v5l-0002PT-OL
 for xen-devel@lists.xenproject.org; Fri, 17 May 2024 10:45:37 +0000
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2060b.outbound.protection.outlook.com
 [2a01:111:f400:7e88::60b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 96c0423a-143a-11ef-b4bb-af5377834399;
 Fri, 17 May 2024 12:45:35 +0200 (CEST)
Received: from BL1PR12MB5849.namprd12.prod.outlook.com (2603:10b6:208:384::18)
 by PH8PR12MB7280.namprd12.prod.outlook.com (2603:10b6:510:220::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7587.28; Fri, 17 May
 2024 10:45:31 +0000
Received: from BL1PR12MB5849.namprd12.prod.outlook.com
 ([fe80::b77f:9333:3a5a:d285]) by BL1PR12MB5849.namprd12.prod.outlook.com
 ([fe80::b77f:9333:3a5a:d285%6]) with mapi id 15.20.7587.026; Fri, 17 May 2024
 10:45:31 +0000
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
X-Inumbo-ID: 96c0423a-143a-11ef-b4bb-af5377834399
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kUuW+ytr87E0V+/Oi+Sk3PlMKGU3crhODDs07VlzSOB5ApqUV2xDtWZqtdede4etCfzvCnJDbr5Zwxzt1mIRlUsvBmtPTgv+W83l470EkLjnLsAREteb5EZvJ4lNWk3Puucv9mifhTh2vS/YUvgA3qbe2CiU4eHS5yBkOnCbagjr90ikiSG73F6mzrsRRv1d3Yt2jFh9g+mQiVdyj0JTfNvwX+/zfR0OiWbISikv89r9aLDOxDnrhFmAFm9zfD0hqz83dT2BGy5yl1yP+Fxi6eQXar0GK+h7jqCceoVHxii0rAaaqn+AWSTTIQxxXpAkORGyqYMzd3fzYRkIreQZ3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KbFX44emBKD3eyLevuU6FiqZZ0xQP9oMRE4uPdIl4Ko=;
 b=kKPgoN+PKRbQj188Hz9SxSQsgubxYgjkDTKi70FkeRz6vS5s4bUL11M25k4qG++RL++ZT2YhONQx6yafKVZqz8zBa6W3FNVrkDFgAUzvdcsKHO/klOiVuJnwzcztyN/Ovusd4IRScBhRqxtXw5kiNHCUgDv7/CI2/Hp+2+Gq4SIAyJoqAOGljnVpqjm3t11wcXuH/UMKdEApBoTmMfgOnaVh6juU0MiQp5YaArNfwgfXc29M5Zd1mDQg0nl2aRzV7GKWURprY8C01ixpyH5MpBlTZ5TgUA0abelIgF5Qp/PCVGA96uaptqc4+SlGPzVZjjNxVbN6xVXq/+jHlHl8pw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KbFX44emBKD3eyLevuU6FiqZZ0xQP9oMRE4uPdIl4Ko=;
 b=LcYvv0FzLygmARHHHMZmyjFV4J3s+zaggVCXZI35mZJjGLko6H8j2c8HRKTjx5hCreIDTKqrepzfzI7Ol8EBxaUxwGSS9FvyzMxaPHACXNotENuZPNzvLsBl8BEMTS/tbDzjkdKvyzSCcUSmJ9cJCiGunwkiswMGUqKq4zyL88o=
From: "Chen, Jiqian" <Jiqian.Chen@amd.com>
To: Jan Beulich <jbeulich@suse.com>, "Daniel P . Smith"
	<dpsmith@apertussolutions.com>
CC: Andrew Cooper <andrew.cooper3@citrix.com>,
	=?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>, Wei Liu
	<wl@xen.org>, George Dunlap <george.dunlap@citrix.com>, Julien Grall
	<julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Anthony PERARD
	<anthony@xenproject.org>, Juergen Gross <jgross@suse.com>, "Hildebrand,
 Stewart" <Stewart.Hildebrand@amd.com>, "Huang, Ray" <Ray.Huang@amd.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, "Chen,
 Jiqian" <Jiqian.Chen@amd.com>
Subject: Re: [RFC XEN PATCH v8 5/5] domctl: Add XEN_DOMCTL_gsi_permission to
 grant gsi
Thread-Topic: [RFC XEN PATCH v8 5/5] domctl: Add XEN_DOMCTL_gsi_permission to
 grant gsi
Thread-Index: AQHap3bgiER4vYjwvk2+R5oTa8V63LGZ5EYAgAHVa4A=
Date: Fri, 17 May 2024 10:45:31 +0000
Message-ID:
 <BL1PR12MB5849EB5EE20B1A6C647F5717E7EE2@BL1PR12MB5849.namprd12.prod.outlook.com>
References: <20240516095235.64128-1-Jiqian.Chen@amd.com>
 <20240516095235.64128-6-Jiqian.Chen@amd.com>
 <9652011f-3f24-43f8-b91e-88bd3982a4c4@suse.com>
In-Reply-To: <9652011f-3f24-43f8-b91e-88bd3982a4c4@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-exchange-imapappendstamp: BL1PR12MB5849.namprd12.prod.outlook.com
 (15.20.7587.026)
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BL1PR12MB5849:EE_|PH8PR12MB7280:EE_
x-ms-office365-filtering-correlation-id: 8dd0abd7-8a0c-4a83-5580-08dc765e794d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230031|1800799015|7416005|366007|376005|38070700009;
x-microsoft-antispam-message-info:
 =?utf-8?B?VVFEVncyZUtiU2hMK1ZJZVZTRm1yaEdDZVR5MFI4dUZ6NXJzRUx5OStHRkZM?=
 =?utf-8?B?U09qYXZGekJHbG5DL1k1elpRSFl5QzdlZUV3R2FiZVhZeDlFdzRyTWhEemMv?=
 =?utf-8?B?NlBwM3NjWFRTbGczRGdDdnlTZW1CeWt1VHZzMFBOYTlqSW9qUUF3Vml0UlF3?=
 =?utf-8?B?cFNDcHM1RjBXMHEvZ0NXTlNmcXk4S1JxQVdLOHBNY2wveStGdVZCMWlQSUNa?=
 =?utf-8?B?UHZXZHNiYm5QaGJVTEo3Ris4YkdhY0tHYTlLSS95K0MyOWg4U1ZGOXFLeFRF?=
 =?utf-8?B?WEpPTCt5SUhOUzFTS3RnZG1RQzBrRFhDdWNIY3JCb2tzQ0xHQzhGaGtSdFBj?=
 =?utf-8?B?cjlsNnZjQUN6TS94UVkveXpJbmtRYkc5ZGlNVUt4bElFb25qUGZyMGVzZFIr?=
 =?utf-8?B?WWE5MGZlY2M2bE0vSTB0R3ZlTW1jMUZna3I1TTB6M1ZiOXBQUWIrRHhGSkVE?=
 =?utf-8?B?UkRBYWFJaWlxcGlFZmMrQTM1NkV6TzVPU2M2Y1RMbXZUQ1psYnI5VTdJanRs?=
 =?utf-8?B?TkUrZStYdDkxZ3RrL1VXWkgxVGN6UmQxUExnNS9lZWJBTGtkeGo3eTArSU96?=
 =?utf-8?B?RGRlZ2NjUFRhZDkvRjYrcktGYU16TUNyN0lDZWEzaktiQ21ZSEVWUW4zbm40?=
 =?utf-8?B?UFIzRjdiU2JZbERXWFRZcGRaTWpyUFdZd0ZTMWt3clRSQnlqdVFPT29ucVNX?=
 =?utf-8?B?Vm1tYi8zRXFZN2VPaHJaNkVnTHN1S2dFdkExYTlHY1A1VlU3dFlydWpkYVpu?=
 =?utf-8?B?Y1N2d1RxU1EvTGJmaFFickJOcE1BdFdmOEo0NHlRVlFUTzl5bnVjMFNMeDFH?=
 =?utf-8?B?SGlFczFaVFN0ajBqSW5zenFXOXQwREdzeE9sYWhmcVdYclN2UEMxRmh6emg3?=
 =?utf-8?B?d1JXR2Z5bWlQbmw4RTdoNWlPcjc3QXdGc3NVK3Q2ZEh1LzJoWnBYcGhBcjRo?=
 =?utf-8?B?a3E2amJoM1oveHo0eVBuUTNySjlIQXRUNlMrQXl2MlRlS3FUM0JTa1BreUtJ?=
 =?utf-8?B?K25USWJYeVRlcHZ2OGkzZndHUVNCclZNWWY3ck9tZGZOTFQ5eXRiU1NUQXc5?=
 =?utf-8?B?NW54SlczVmlGTlJLN0VFbmhHWWpmNHBKWHZLRVFRVmt4RStzbm94VUd1OThU?=
 =?utf-8?B?OU5zSXZNVU5LckJhTEExeHlNTzkvdmpFQUpCRDRBZDR4OWc4L0wrc1VacjZ4?=
 =?utf-8?B?eTQ4QVBMYVFwYVBkWHJGM3RhdEZETzQ0dHp4Z0huNmN2Tk0wTk9DcSt2N1d0?=
 =?utf-8?B?Y05ZejJmYVZRdFk1VUpiTThNc284anltaDM1N3RXVWxGZ0hLWVpyY1BlZ0ht?=
 =?utf-8?B?QTBJckNTN2hscWNVdjdxWVNHb1JBQUxzT0ZhRWF4YjZGRXpoalBNa1FsTi9r?=
 =?utf-8?B?djdhRlB3UUZ2N0ZqZmRucG9LUkREemoyYzUyTmdCNU9YcVd3OWs4eWlyTmN0?=
 =?utf-8?B?RGdhbjBtZndLdm5RMVM5dWE5RWthVzdzTEFEVEtWb09wdHdwWmFSZnBGYzI1?=
 =?utf-8?B?N3p4SXg2NTRoU2drK2hoNEo4WjgwQ2x2dmVHYTg4UTVtcWNuUXdQQk1LQzVu?=
 =?utf-8?B?bW8yNmNFQ0J1VGwvRWgwRFRicEpqa0NNVTI4RVpGdlFmcU5XUzBrVWs0RU9Y?=
 =?utf-8?B?V2tSOEU2dGpJb0Nodmh5SXF5emsvd3Nyc280L0Zmd0lCMFlRaUprNkd6SXFE?=
 =?utf-8?B?T2prQWdIWGx5TjY3VjVlVWZhRUh4VTNGd0lLNmZLVU5hZTE1cmFqRGtFLzdV?=
 =?utf-8?B?aldUZE9vYktjSUlLR3o3Ums3alR6OXUwbkxyMTVLOTAwV052TkFIRVBJaEdp?=
 =?utf-8?B?NW1aTmcwNjF5d3Fwbmd6dz09?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR12MB5849.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(1800799015)(7416005)(366007)(376005)(38070700009);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?a1JkdDlKazBNQ3RjUTdOUGJ2M3ZMb3k4c2plbjJ2ajh6MmRwc0ZPbFpSUVZG?=
 =?utf-8?B?UDJOVGpCV0NLcFZ1K2dVam94MnBNdnJ4bXNKUXVHRWVaNG95dHlNejMvc2k3?=
 =?utf-8?B?WlMzVUpyeVZPVTFNNHdkUlRTSzlzQ1ZoL1BGQStiZ0JNUksvMFVJWk1RNlps?=
 =?utf-8?B?dGM4Y1F6QjcxQ2ZlbURodDRLeTFOaHB5ZzhEOWIzZXFWWDAzQ0FUL1FLd29K?=
 =?utf-8?B?RUhmMEd5KzhQd3ZjNHcxc0xLRi9odzc0VDdxYnhqbzNXM3RBaCtXQVh6RjFB?=
 =?utf-8?B?eHhqZHkySmFxRmpPMXN3ckRhR2FDbnYyTFRWL1A3QjY0Z1JxQ1NJR2tzREFW?=
 =?utf-8?B?ZTZ0Z2Fmdy9adUNMZWFWcWdTOE5lY3JIcENuL3grSXpzdTRhRFplYmVBQkp1?=
 =?utf-8?B?N0NxS0lJVnZ2T1YxOE53YlVEamYzbVpiUkl2SVM2WWJKUzJDY29YNy83aVZS?=
 =?utf-8?B?K3BDKzUxZVI2QTRuT2ZSMlcySGE3cjJKam9RMWFoenlCaEMrSXVvR2JCakFJ?=
 =?utf-8?B?bWd2Tm9mMm5FVUppTlhRV3FIUzVpaDJUNFVENkpmU1dyTjA3d1VUeGh2cEdG?=
 =?utf-8?B?WmZXWHpodmxCZm5vdTRNMTZaNDNlRzdSeGs3Sk1WSVdiS0ZFbkNZbUpsQm8v?=
 =?utf-8?B?ZGRzYjVwYkNURU5XYVA2dTFYTi85UWFSc1ZBbGFjcHFOdWxibzhPSGJIYi9q?=
 =?utf-8?B?UlhjbUhmZS9ubDFoOUl4cDJ6WEhJK0JZRFVIZ1RKbHpFcnNyUDdLYWM3OEor?=
 =?utf-8?B?Y2ZpQ1pId1RodVhWVklqcXM5aGJEcnhrZUFSSDZ2Qi9XRFNVclU5RmljMUNk?=
 =?utf-8?B?N01lZXFxUG5FTWdCbUE5UThNekpiRUFiUmJaQ05wS0NUUndIZE5XdjE4OU1H?=
 =?utf-8?B?cjF6R3VGVWdWUUZ5eVN1QUdrZ2ZSekVDUzZPbGZFZHozaVVwN0FFN0ZjWXQ0?=
 =?utf-8?B?d3FnVFRCOFdybGVwL3ZvNnNIb0pNcjRkSW5jV3F3ZWpFTVJURXIxS2REbVlH?=
 =?utf-8?B?VzI3Vk4wSm5wWVBiVjJsUHZ6L0pKblV6c29BcnpYUTU0YjI2Z2YrRVlqb1Uz?=
 =?utf-8?B?ZHlPdklETk9Gc3BwWjZMbDRDcktCcU5vazZaWGZ5L3kxN2s2bUN4d0dvTENu?=
 =?utf-8?B?SXdtRUlWUHlPYSsweGVaQ25iZjI2dzB6ZlYxYWowUXc5ZTE2S25WRXRCem8v?=
 =?utf-8?B?cU5La2VkSnB4YlNJMDlYb1FZTU1sSC8xRWpUelRPejRENm41VC9BM1lsUDNU?=
 =?utf-8?B?SVgyS0g3SndtOURXUkJXNXdLODZtdmpUR3kxby8vTDBzcmlrOTVUVHZSclVT?=
 =?utf-8?B?d3RFTmswMkZ6cWFzK3NzTUtvbERDeTdIN3NSUGNmcU9YYVhENnFwalRkNVVF?=
 =?utf-8?B?aXVsZlBUTkRUVU1wZUFqZDl1VGt4ZWdsZ0htUkVGVXAwVjhyQ3h1N05EVWI1?=
 =?utf-8?B?VTAwSjVpVTZrSGFmcUN5NERvYUN6VFErVjhyVUZNQUZ1MHgzNGcwblNtNGxh?=
 =?utf-8?B?UmU5K1dsVW5RdE1LVzhxSmpzVjRVdEJIOENKV2ZqNS9yVGEzMHZkdzVyY1Bw?=
 =?utf-8?B?NkI5SGpjU0FXaWNGUkpMNXFRcEovdW1EVnZSa0xUVTZhYXJyQzJOMVJsYjRN?=
 =?utf-8?B?blRjazRMM1dXV1Yrd1VxUVY3NkMrZTJPWGJRd1FPWksvZERKN0FXQnAvUTdQ?=
 =?utf-8?B?d1pSOUUyZmU0SXVEY1hHaGVEYjdlRWEzSE5BT0h5MjVXWUtzVFk3Q2xqRzZr?=
 =?utf-8?B?RGQwcThldjRIS2xlNWZudDI4aGFpRldPeDVZdW8rOTFaaWgxbnptYU1mblFr?=
 =?utf-8?B?WCtydkZFS2w0bW4weW8xK0ZPb1FOWHMrRzM4Q2pkYnNBWDdPaFQ5QzFydkZ6?=
 =?utf-8?B?NERsaGpxc3M0alMwUEF6MndBTE45WHFBenZMNE9QeC8veVppVjk3cWhWeDRK?=
 =?utf-8?B?Sy9kVjJQTThqQnpMd2YwUkUydTljM2dQZFY1V3JLRXVTTmFGTDAyZTJsM0hO?=
 =?utf-8?B?UFplR0UwK0pZaVVMTFhLaG1kRW1ZWE40S0hnY0RrN0k5KzkxTTRCZUNwbjdm?=
 =?utf-8?B?Um5oZE5Za2RNdmtMTFdvRDNKU2k3T3JxQ1lvdlNvNWNKT3ljSi9JbWZIeHZ5?=
 =?utf-8?Q?5B6o=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <F6A69957F123574CA7D320559B46C539@amdcloud.onmicrosoft.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5849.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8dd0abd7-8a0c-4a83-5580-08dc765e794d
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 May 2024 10:45:31.3747
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ua+UOsQ5afVTh/cMCJqn9TKWqTW6nDvNK9x4h38wCPCTaWsuxB9ux+G9+cKLAIGv80QUoh5irxc/4R5BAukf+Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB7280

T24gMjAyNC81LzE2IDIyOjAxLCBKYW4gQmV1bGljaCB3cm90ZToNCj4gT24gMTYuMDUuMjAyNCAx
MTo1MiwgSmlxaWFuIENoZW4gd3JvdGU6DQo+PiBTb21lIHR5cGUgb2YgZG9tYWluIGRvbid0IGhh
dmUgUElSUSwgbGlrZSBQVkgsIHdoZW4NCj4+IHBhc3N0aHJvdWdoIGEgZGV2aWNlIHRvIGd1ZXN0
IG9uIFBWSCBkb20wLCBjYWxsc3RhY2sNCj4+IHBjaV9hZGRfZG1fZG9uZS0+WEVOX0RPTUNUTF9p
cnFfcGVybWlzc2lvbiB3aWxsIGZhaWxlZA0KPj4gYXQgZG9tYWluX3BpcnFfdG9faXJxLg0KPj4N
Cj4+IFNvLCBhZGQgYSBuZXcgaHlwZXJjYWxsIHRvIGdyYW50L3Jldm9rZSBnc2kgcGVybWlzc2lv
bg0KPj4gd2hlbiBkb20wIGlzIG5vdCBQViBvciBkb20wIGhhcyBub3QgUElSUSBmbGFnLg0KPiAN
Cj4gSG9uZXN0bHkgSSBmaW5kIHRoaXMgaGFyZCB0byBmb2xsb3csIGFuZCB0aHVzIG5vdCByZWFs
bHkgbWFraW5nIGNsZWFyIHdoeQ0KPiBubyBvdGhlciBleGlzdGluZyBtZWNoYW5pc20gY291bGQg
YmUgdXNlZC4NClNvcnJ5LCBJIHdpbGwgZGVzY3JpYmUgbW9yZSBjbGVhcmx5IGluIG5leHQgdmVy
c2lvbi4NCg0KPiANCj4+IFNpZ25lZC1vZmYtYnk6IEh1YW5nIFJ1aSA8cmF5Lmh1YW5nQGFtZC5j
b20+DQo+PiBTaWduZWQtb2ZmLWJ5OiBKaXFpYW4gQ2hlbiA8SmlxaWFuLkNoZW5AYW1kLmNvbT4N
Cj4+IC0tLQ0KPiANCj4gQmVsb3cgaGVyZSBpbiBhbiBSRkMgcGF0Y2ggeW91IHR5cGljYWxseSB3
b3VsZCB3YW50IHRvIHB1dCBzcGVjaWZpYyBpdGVtcw0KPiB5b3UncmUgc2Vla2luZyBmZWVkYmFj
ayBvbi4gV2l0aG91dCB0aGF0IGl0J3MgaGFyZCB0byB0ZWxsIHdoeSB0aGlzIGlzDQo+IG1hcmtl
ZCBSRkMuDQpPSywgSSB3aWxsIGFkZCAiIFJGQzogd2FpdCBmb3IgdGhlIHRoaXJkIHBhdGNoIG9u
IGtlcm5lbCBzaWRlIGlzIGFjY2VwdGVkLiIgaW4gbmV4dCB2ZXJzaW9uLg0KDQo+IA0KPj4gLS0t
IGEveGVuL2FyY2gveDg2L2RvbWN0bC5jDQo+PiArKysgYi94ZW4vYXJjaC94ODYvZG9tY3RsLmMN
Cj4+IEBAIC0yMzcsNiArMjM3LDM3IEBAIGxvbmcgYXJjaF9kb19kb21jdGwoDQo+PiAgICAgICAg
ICBicmVhazsNCj4+ICAgICAgfQ0KPj4gIA0KPj4gKyAgICBjYXNlIFhFTl9ET01DVExfZ3NpX3Bl
cm1pc3Npb246DQo+PiArICAgIHsNCj4+ICsgICAgICAgIHVuc2lnbmVkIGludCBnc2kgPSBkb21j
dGwtPnUuZ3NpX3Blcm1pc3Npb24uZ3NpOw0KPj4gKyAgICAgICAgaW50IGFsbG93ID0gZG9tY3Rs
LT51LmdzaV9wZXJtaXNzaW9uLmFsbG93X2FjY2VzczsNCj4gDQo+IGJvb2w/DQpXaWxsIGNoYW5n
ZS4NCg0KPiANCj4+ICsgICAgICAgIGlmICggaXNfcHZfZG9tYWluKGN1cnJlbnQtPmRvbWFpbikg
fHwgaGFzX3BpcnEoY3VycmVudC0+ZG9tYWluKSApDQo+PiArICAgICAgICB7DQo+PiArICAgICAg
ICAgICAgcmV0ID0gLUVPUE5PVFNVUFA7DQo+PiArICAgICAgICAgICAgYnJlYWs7DQo+PiArICAg
ICAgICB9DQo+IA0KPiBTdWNoIGEgcmVzdHJpY3Rpb24gaW1vIHdhbnRzIGV4cGxhaW5pbmcgaW4g
YSBjb21tZW50Lg0KV2lsbCBhZGQgaW4gbmV4dCB2ZXJzaW9uLg0KDQo+IA0KPj4gKyAgICAgICAg
aWYgKCBnc2kgPj0gbnJfaXJxc19nc2kgKQ0KPj4gKyAgICAgICAgew0KPj4gKyAgICAgICAgICAg
IHJldCA9IC1FSU5WQUw7DQo+PiArICAgICAgICAgICAgYnJlYWs7DQo+PiArICAgICAgICB9DQo+
PiArDQo+PiArICAgICAgICBpZiAoICFpcnFfYWNjZXNzX3Blcm1pdHRlZChjdXJyZW50LT5kb21h
aW4sIGdzaSkgfHwNCj4gDQo+IEkuZS4gYXNzdW1pbmcgSVJRID09IEdTST8gSXMgdGhhdCBhIHZh
bGlkIGFzc3VtcHRpb24gd2hlbiBhbnkgbnVtYmVyIG9mDQo+IHNvdXJjZSBvdmVycmlkZXMgbWF5
IGJlIHN1cmZhY2VkIGJ5IEFDUEk/DQpBbGwgaXJxcyBzbWFsbGVyIHRoYW4gbnJfaXJxc19nc2kg
YXJlIGdzaSwgYXJlbid0IHRoZXk/DQoNCj4gDQo+PiArICAgICAgICAgICAgIHhzbV9pcnFfcGVy
bWlzc2lvbihYU01fSE9PSywgZCwgZ3NpLCBhbGxvdykgKQ0KPiANCj4gSGVyZSBJJ20gcHJldHR5
IHN1cmUgeW91IGNhbid0IHZlcnkgd2VsbCByZS11c2UgYW4gZXhpc3RpbmcgaG9vaywgYXMgdGhl
DQo+IHZhbHVlIG9mIGludGVyZXN0IGlzIGluIGEgZGlmZmVyZW50IG51bWJlcmluZyBzcGFjZSwg
YW5kIGEgcG9zc2libGUgaG9vaw0KPiBmdW5jdGlvbiBoYXMgbm8gd2F5IG9mIGtub3dpbmcgd2hp
Y2ggb25lIGl0IGlzLiBEYW5pZWw/DQo+IA0KPj4gKyAgICAgICAgew0KPj4gKyAgICAgICAgICAg
IHJldCA9IC1FUEVSTTsNCj4+ICsgICAgICAgICAgICBicmVhazsNCj4+ICsgICAgICAgIH0NCj4+
ICsNCj4+ICsgICAgICAgIGlmICggYWxsb3cgKQ0KPj4gKyAgICAgICAgICAgIHJldCA9IGlycV9w
ZXJtaXRfYWNjZXNzKGQsIGdzaSk7DQo+PiArICAgICAgICBlbHNlDQo+PiArICAgICAgICAgICAg
cmV0ID0gaXJxX2RlbnlfYWNjZXNzKGQsIGdzaSk7DQo+IA0KPiBBcyBhYm92ZSBJJ20gYWZyYWlk
IHlvdSBjYW4ndCBhc3N1bWUgSVJRID09IEdTSS4NCj4gDQo+PiAtLS0gYS94ZW4vaW5jbHVkZS9w
dWJsaWMvZG9tY3RsLmgNCj4+ICsrKyBiL3hlbi9pbmNsdWRlL3B1YmxpYy9kb21jdGwuaA0KPj4g
QEAgLTQ0Nyw2ICs0NDcsMTMgQEAgc3RydWN0IHhlbl9kb21jdGxfaXJxX3Blcm1pc3Npb24gew0K
Pj4gIH07DQo+PiAgDQo+PiAgDQo+PiArLyogWEVOX0RPTUNUTF9nc2lfcGVybWlzc2lvbiAqLw0K
Pj4gK3N0cnVjdCB4ZW5fZG9tY3RsX2dzaV9wZXJtaXNzaW9uIHsNCj4+ICsgICAgdWludDMyX3Qg
Z3NpOw0KPj4gKyAgICB1aW50OF90IGFsbG93X2FjY2VzczsgICAgLyogZmxhZyB0byBzcGVjaWZ5
IGVuYWJsZS9kaXNhYmxlIG9mIHg4NiBnc2kgYWNjZXNzICovDQo+PiArfTsNCj4gDQo+IEV4cGxp
Y2l0IHBhZGRpbmcgcGxlYXNlLCBpbmNsdWRpbmcgYSBjaGVjayB0aGF0IGl0J3MgemVybyBvbiBp
bnB1dC4NClRoYW5rcywgSSB3aWxsIGFkZCBpbiBuZXh0IHZlcnNpb24uDQoNCj4gDQo+PiArDQo+
PiArDQo+PiAgLyogWEVOX0RPTUNUTF9pb21lbV9wZXJtaXNzaW9uICovDQo+IA0KPiBObyBkb3Vi
bGUgYmxhbmsgbGluZXMgcGxlYXNlLiBJbiBmYWN0IHlvdSB3aWxsIHdhbnQgdG8gYnJlYWsgdGhl
IGRvdWJsZSBibGFuaw0KPiBsaW5lcyBpbiBsZWFkaW5nIGNvbnRleHQsIGluc2VydGluZyBpbiB0
aGUgbWlkZGxlLg0KV2lsbCByZW1vdmUgb25lLg0KPiANCj4gSmFuDQoNCi0tIA0KQmVzdCByZWdh
cmRzLA0KSmlxaWFuIENoZW4uDQo=

