Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A239A76113
	for <lists+xen-devel@lfdr.de>; Mon, 31 Mar 2025 10:14:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.931982.1334168 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tzAHS-0007fh-1S; Mon, 31 Mar 2025 08:14:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 931982.1334168; Mon, 31 Mar 2025 08:14:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tzAHR-0007dJ-Tx; Mon, 31 Mar 2025 08:14:01 +0000
Received: by outflank-mailman (input) for mailman id 931982;
 Mon, 31 Mar 2025 08:13:59 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=S+FP=WS=amd.com=Jiqian.Chen@srs-se1.protection.inumbo.net>)
 id 1tzAHP-0007dD-HA
 for xen-devel@lists.xenproject.org; Mon, 31 Mar 2025 08:13:59 +0000
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2060a.outbound.protection.outlook.com
 [2a01:111:f403:2413::60a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 15497d0b-0e08-11f0-9ffb-bf95429c2676;
 Mon, 31 Mar 2025 10:13:54 +0200 (CEST)
Received: from BL1PR12MB5849.namprd12.prod.outlook.com (2603:10b6:208:384::18)
 by CH2PR12MB9520.namprd12.prod.outlook.com (2603:10b6:610:280::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.50; Mon, 31 Mar
 2025 08:13:50 +0000
Received: from BL1PR12MB5849.namprd12.prod.outlook.com
 ([fe80::b77f:9333:3a5a:d285]) by BL1PR12MB5849.namprd12.prod.outlook.com
 ([fe80::b77f:9333:3a5a:d285%3]) with mapi id 15.20.8534.043; Mon, 31 Mar 2025
 08:13:50 +0000
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
X-Inumbo-ID: 15497d0b-0e08-11f0-9ffb-bf95429c2676
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hIMT3gj4VDyQAITtM78PC/47oh7AxO/VCzYobtI/7GW++teYr97XPXZeTRvWgXa2RKJHPq/iTr8hJaVrWHXqSjjQuCg3fZ4l6t+RX8wlz10enoJ2qRA2PO2zSi+fUo60hllt+HoJiHlaxeQiKJt9b01lnQWoyUtlQefuRJSaaF7OaMPYP4k9/uIp7J8VapXsf9z2vhkwLZOEpIVIgXquYgr+7I+oGOMcUcIfbRMrqancKG47ZHUCwuooyX3aQ1LLIchopr1A2OejvUpg4Ew5oyG8KRIvL0qRZmyziJI1Tcg3qHm3QsN4ng4vwhsiomBhZyKYd1/X5r9gzrP3oonr1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rvMtCXFensaksRYH69qmqAM3YwAAJ7nQEU36S55nvlU=;
 b=M/+FSjRh9cVFVpIdv6q2JTyCnfyfjnscmQe49Hj0phCgWU2NRNJTP1RGDIUkgLmzeaim6t19Xz2XIPQW3cMX2A+wIFELVwxJD1WFBi8Wpr9K3Omr8aEFTA2PSLnQr2MzHtrS0nPUqhIxr4HkHDtGGvfRsYQgc5sQyenTbUUe05NS4rmYJ9K3GaM54aGOJjGPstyv2Uvl9Q8Zj0xFDT9kuWzgUCi3nbwQ10Sj7CTdFl+61oQE6OuQQmbTDZQOxOsgLldL3s2c5hr6TUHY8Zptn714C0dXV+kTm0JElr9Z2vx4D+8oh46i2OK6I06H0EFcoAjpbLK1u/4+SbZ+d9qahA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rvMtCXFensaksRYH69qmqAM3YwAAJ7nQEU36S55nvlU=;
 b=5ExI95Tc3ff2CWPpVCKcSF0VxOupZVWBZXd764TOGmUh0jQSwaV+YsBv4tB4z9k6vdtL28+EpJTbTZmo6wXVBHhwCIDtbuaxKwx6UUjUUhg+/5say3O034I/CEkgdGaL7tS+Lk+dQuymVc6KgX0k6QX+PwlcJJqTXmbhUIJrilI=
From: "Chen, Jiqian" <Jiqian.Chen@amd.com>
To: =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, "Huang,
 Ray" <Ray.Huang@amd.com>, "Chen, Jiqian" <Jiqian.Chen@amd.com>
Subject: Re: [PATCH v1 3/3] vpci/msi: Remove registers when init_msi() fails
Thread-Topic: [PATCH v1 3/3] vpci/msi: Remove registers when init_msi() fails
Thread-Index: AQHbnup+4g7LdxtjbkeTZtpJleytN7OG7gUAgAZ9hYA=
Date: Mon, 31 Mar 2025 08:13:50 +0000
Message-ID:
 <BL1PR12MB584905BC9966EF9742FF4472E7AD2@BL1PR12MB5849.namprd12.prod.outlook.com>
References: <20250327073214.158210-1-Jiqian.Chen@amd.com>
 <20250327073214.158210-3-Jiqian.Chen@amd.com>
 <Z-VIFo7q7-UNsLCt@macbook.local>
In-Reply-To: <Z-VIFo7q7-UNsLCt@macbook.local>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-exchange-imapappendstamp: BL1PR12MB5849.namprd12.prod.outlook.com
 (15.20.8534.033)
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BL1PR12MB5849:EE_|CH2PR12MB9520:EE_
x-ms-office365-filtering-correlation-id: ab6d1f75-b0b6-4d75-0eed-08dd702bf7dc
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|376014|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?Vml0OU1iKzhaYXZoWmtDWmRUTFNocWtybkdwR2Z2UzkzSjR3WU1OK2NyRkkw?=
 =?utf-8?B?NkR1ZDlZSW5ocmJzRGw0T2Nrb2l3U3IvUWtFclFOekZFczRPdUxrSmZpUm82?=
 =?utf-8?B?NDd2Zk4xbGFjN1c3eHdwWURydGVNYmdBVmNGLzR2WWVtNDl4MWtSdFFUVlVP?=
 =?utf-8?B?dTRQM2FwZXhhY0RGanQwSXBRaFMzR1JveXZIOC9BSkNZR01kWk5FYUtRODB3?=
 =?utf-8?B?VzZTMFZna2ZmcFQ0VXVuUTcwZmVCZWZxQzBxWGhvbkR2dnZlRkVxT01vTUsy?=
 =?utf-8?B?c3dlYkt0NkR3S3FGakloU1hBWFE0d2hDZXJLQzNiek92T3pJSktSc0RSdGs1?=
 =?utf-8?B?OWRNaElCQnVBdGFwVWVCQTNXd09HQ2ZsMlAxcVhVMjhIdVNCU3BxR1NRdW1p?=
 =?utf-8?B?eDNNN0lWbkRDblFqMVRqS01pVm81VmRCeXA2dHZpclpZQS8zb1hBWWQzR1ZR?=
 =?utf-8?B?eUVGTHJmenYyQmlUL05UTzVqdDZpNGZKTEl1SHArVyttK2JaaktFMHlMazNm?=
 =?utf-8?B?VFZIWDZ3Y3pDY0NBVmREN0U2ZWZ4UVJ6TklXQmZtemIzcU5yaCtXZVBDVzFq?=
 =?utf-8?B?Ujd3ZlpZdUU0TFBjdlFPTjBhMTlHZ3BMajVtUjJ1ZHo5dmNXOW4wVEMvNjF4?=
 =?utf-8?B?dGFXNWV2ZHAreUFHak5IZDNNU1BsRE1iTFNSMnRJSkF3RTlNUUprY0c0RlhC?=
 =?utf-8?B?Nld5QldnNFdIb1FSUEdhbTM2SmlwM0xzaTdUdlNFNERxZk1yamRPcXMzRG1H?=
 =?utf-8?B?L2h4ZEx2MEU1WlNIWGIraGFzQUZQYUhLYUZJL2UxQTdNZnUveWlCbUc1bjJ2?=
 =?utf-8?B?R1hGSENMUUNOcFVZaU52WWJsUXJMbWgrK25QcXJJRDV1Nkx1MC9nbnhtY25U?=
 =?utf-8?B?MkZwMVM4Q1BrYlFOd2NmcW1mdndCYVZNTE5HL3Iwb1ZqcVZCOFRZNmFxMlBB?=
 =?utf-8?B?SFRPZ2cwNmFTL3VncXpZeFZSN3VYT1ZTQ21RY250WGxXZVFUUmkycEM4Ui9i?=
 =?utf-8?B?OUF0SER2L0EyVHRPMTBsRFpobHpwY2pKeVVnbWRMd3VUS1E5dGN5UExTSnYy?=
 =?utf-8?B?cUt5VjFHazZrWWVVWE9TajVkc21EU1BsWmdPeURUUEJhUTJLdkJIUENUZTRv?=
 =?utf-8?B?N3g0M281empQcVhnc1U1VWpDU2VJODNQTDdLMldoNGhCczYvK0JtU1N6QkVa?=
 =?utf-8?B?bkY0cWo2V0xaZTVEeGg0STB4bkFIamVvbmVlOXFUcnJ1eGU0d1BSMVBlSWNq?=
 =?utf-8?B?a0doUjRBSnlFb1lubkRidm8vSm9FWmo3UnhIWWpKWldKaTFZaXpvVVZuZjZQ?=
 =?utf-8?B?SlBDazVKd3E3L2hMOVhJbC9RdUV5L1JoYWw0RkRSbXJCZFhYUXFNVFlqdDA3?=
 =?utf-8?B?MWZTODBiRGx4QXpPZVc5NHJubGYwSmxlVkJ3RXhZVzM5ZWU5WTVFRVM2V3Vm?=
 =?utf-8?B?MUFPdFJNOWZWd1ZjN2FHZHZIRnBOMFpnSGVxcWFIKy9lTnJRbVVXY01Ld2No?=
 =?utf-8?B?NHhLSjUyOGdYZlhwQnBTbjFkRHJGVVczU3dnOHlhTHRrWllzMitNTEhMcU5B?=
 =?utf-8?B?anRiWXdvT3lUM3Z0WDRXbXMwMVdQTjBxZ1ljVEFnT0o1S3lNRGdwYlpqaFBU?=
 =?utf-8?B?a3hwMjVXTDhSUUV4ZnpXbkZuYlpwZWVEZ2JubG5XcXdNVkNFZ3dVQjlRVVJ3?=
 =?utf-8?B?NE02Q3RLRmcwZTYxU25yWDA2dGFNcVBLNTRXbHE0N0JsbjRDVERrL3N3RVhB?=
 =?utf-8?B?WU52dDZ2ZHdMakdCZkhHdlcwMWo3QWlUYWovaFZGR1YyRHVsZnNNenpSdnVn?=
 =?utf-8?B?WlNKTStrTDlVZmdwN3diZzhEamxYcStwR3ZIeVVIYzR3TnhjMlBmVWg0RG94?=
 =?utf-8?B?VmI4QWhvWWgrcFFMbmJEYm5aYW9pQ3dWeHkvTllzWUJGUVVKV05tWDVrai9k?=
 =?utf-8?Q?O9FKfJBT0qZVhwfXCCRay0QiMKXT8eOm?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR12MB5849.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?THVqNytiYzlra0c4elNxMDdqb3d3VDlnSmlDcUlVcVRBNDd4MFdhMThtOFU2?=
 =?utf-8?B?NHVrekdBWHhVdS93SFEwNzllWmRZZ1UyRnJ5SnhHK3Blek5wYUNJM3liRC8r?=
 =?utf-8?B?YmxKLzJaSW1NL09Fb3VqT3lMQmhJR2FSMHFndGFYVDJ4YUt4akVjVDh1NFhV?=
 =?utf-8?B?LzFTZ2M1MHJrM0dIdXNpeGlleFZZR09GMGF0WmZPcDc5YXpPb2Q3dnRMYjVz?=
 =?utf-8?B?Q3NZYlo2UHIrMXRXQ0NRTXF6bDd1dGg5Y2h2aEJUeEYwK0ZkaDFWM0VzN29l?=
 =?utf-8?B?RzRFQjQyYzJldVBLSFlvNmFhVW9yVkJyQzV0R0w4bVNXWlpQVHNrM1B0NURS?=
 =?utf-8?B?OTU4Z3AvY0pidzZscVRjMFlYeFpoUTdxVldvWEd2bmpKRGZKMVZxOTdkRGNG?=
 =?utf-8?B?N1o2S01LT2dIOHp2RThGNlp2czlqNEVmVnUyaCtabHNtcXpNT2FCNFpydG5s?=
 =?utf-8?B?N2s0QUNWbVltRU9KQXZveXIwQmszdG10TTVzcUVpK1JNY2VHb3VlUmw0MkJM?=
 =?utf-8?B?ZFVYQlNwYmJQTmtDbVhUcjU1MzhrVCt3QU5rU1dXYTJFbVBXS0tMcW94K3B4?=
 =?utf-8?B?UHVHZ0Uva3hGNjBSYmlhK0orYWNFc0VVWkdhaE5MTFNmaHMvTmJCTE5CaWVM?=
 =?utf-8?B?ODRlQ3RMby90SGQ0L3Z1YjZzSXhRTlgrSUllSVVKR0drV2UwZFB4RDBlTFNT?=
 =?utf-8?B?ZWdySnRyMVNwSVdHRnNuQlRSTHVsL2dQNlYrVE9kdXpvbDIzNHliM0xnaTZo?=
 =?utf-8?B?M211UjhCNDBrOUlrMW1lRzhFT2x1dkNiRVNhS2cyU2lJaGpONXV4RmQvcUQ2?=
 =?utf-8?B?eDlzQnhyYXMvVWh6OFIwRGNmZ3dDdGQ5YmE4M0pnUTVZMS9TSG5JSllyaVow?=
 =?utf-8?B?dnNaWkMvTnFRUExVMmcvTFUySDR5NGk2NkFjVGVPYWVDTWpnamFidmtxSVFN?=
 =?utf-8?B?VlFSbUVKc296UGh3SHE3S2hCM3dtbjZaUVdHZjB2cGE5NWhpUFdDeGRHYU4r?=
 =?utf-8?B?b1M1ekp0K0ZwRjh3ZjI3Wkd2OVhLYnV5aVI2OXNkakljQ2Z2YzN0MHNvWnlv?=
 =?utf-8?B?NmFaT3BNd3hUT21UVm43Q2lTTkhhUmJOaWZZcFo5aWl0UC9EcXZSS3Z5K3J5?=
 =?utf-8?B?ZUowOWdycGNkald5WE5IQTJhRGtzQ0ZZdkRSZnhqOU9BTkQweFlzMmlIb24z?=
 =?utf-8?B?Tk9nSll5ZGdYSGl0T1g4Vy9IWEsxbGtSZGI5MWNsTXB4bU9pdWNQMGJXaU0v?=
 =?utf-8?B?M2gySDljbWorYVNkT1FRUXd3a1pSQ3hkUURMZWNVT1dEci9kUER2WSs4aWdF?=
 =?utf-8?B?bUhOQzNVY05ZSzVyZzdXSlhqN0JtbW4rRXFWZFRNWFNiYjJpRUgxS3ZEVXpJ?=
 =?utf-8?B?dEtOZlNzUXJrVTkxbVk5REZlUCtORXJ5OGxqVytoYW9Zck9TQ2J0aDlVdElU?=
 =?utf-8?B?alRvOUkzVW5TSFVhQTFMWDlVVTc5Y2dGZGVTNFJ2cFhJZEFONkpuZFBqem03?=
 =?utf-8?B?RnpKUW9pbldvV0grWlBBZjFGNVdsb3h1WGdueU9MZkt3c2ltVU1IVkt4dVEr?=
 =?utf-8?B?WDd4R0NGWWRXNkJiYzNuMGxvOEkwd1lrbHVxRDlsOFJUenNHM0Z4VFJsWHo4?=
 =?utf-8?B?SXM3T3IvYWUxa1J3SXk4R25sYkRwTTREZEZ6MkJFN1paM2dzcDFBOXhiWDJa?=
 =?utf-8?B?ZExJVGFnMktodWI0QTkrUWtSOXFneHU1S2pYV3lWOWhyOFd3SUhINlcyVllo?=
 =?utf-8?B?V2hLNHZuM2lZK0VFOTVZVXZPZDBBeHRVV2gvUVl6d1AvbGM2eDk5dVpNVzBz?=
 =?utf-8?B?ajlnNVg0Zk4waWVVY21mRG05UDBaOU5WWUFVeE9BSEFMRG9Gem4xckM1alor?=
 =?utf-8?B?QTJWVHhsTjVvQzAwNTFVdDBhS2lFdisrd00ycjQycTZtVTR4dXV2M2hkWkx2?=
 =?utf-8?B?WDJ5clJTZUg2Z1hHSWdVTzRCN1hQSjRtdHpCTGdRMGpJdW0ydzE0SnY3bGdJ?=
 =?utf-8?B?NmRjUS9nTG8xcXdicER2ekVUa0RPbzhaenN1dTBaUEc0bDNkWjZETVk2NXox?=
 =?utf-8?B?Q3BwQUZqVCtnaUdSTkRFVXgvZHB6WXVhajBSY2VLUUc0TmhGY1hSSFNHZXZh?=
 =?utf-8?Q?nSiQ=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <AF6A387C88B41F429600221E87FFED25@amdcloud.onmicrosoft.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5849.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ab6d1f75-b0b6-4d75-0eed-08dd702bf7dc
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 Mar 2025 08:13:50.0723
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 4u6XzQtgzeiina+29LF/Njv4Gn1H+J8u4VT3QsQUvh1OwRxHG8Z3/Cqj96o6BLxFybUleppjeAeP6m7GemAV1g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB9520

T24gMjAyNS8zLzI3IDIwOjQ0LCBSb2dlciBQYXUgTW9ubsOpIHdyb3RlOg0KPiBPbiBUaHUsIE1h
ciAyNywgMjAyNSBhdCAwMzozMjoxNFBNICswODAwLCBKaXFpYW4gQ2hlbiB3cm90ZToNCj4+IFdo
ZW4gaW5pdF9tc2koKSBmYWlscywgdGhlIG5ldyBjb2RlcyB3aWxsIHRyeSB0byBoaWRlIE1TSQ0K
Pj4gY2FwYWJpbGl0eSwgc28gaXQgY2FuJ3QgcmVseSBvbiB2cGNpX2RlYXNzaWduX2RldmljZSgp
IHRvDQo+PiByZW1vdmUgYWxsIE1TSSByZWxhdGVkIHJlZ2lzdGVycyBhbnltb3JlLCB0aG9zZSBy
ZWdpc3RlcnMNCj4+IG11c3QgYmUgY2xlYW5lZCB1cCBpbiBmYWlsdXJlIHBhdGggb2YgaW5pdF9t
c2kuDQo+Pg0KPj4gVG8gZG8gdGhhdCwgdXNlIGEgdnBjaV9yZWdpc3RlciBhcnJheSB0byByZWNv
cmQgYWxsIE1TSQ0KPj4gcmVnaXN0ZXJzIGFuZCBjYWxsIHZwY2lfcmVtb3ZlX3JlZ2lzdGVyKCkg
dG8gcmVtb3ZlIHJlZ2lzdGVycy4NCj4gDQo+IEFzIEknbSBqdXN0IHNlZWluZyAzIHBhdGNoZXMg
b24gdGhlIHNlcmllcywgaXNuJ3QgdGhlcmUgb25lIG1pc3NpbmcNCj4gZm9yIE1TSS1YIGF0IGxl
YXN0Pw0KTm8sIGJlY2F1c2UgaW5pdF9tc2l4IG9ubHkgY2FsbCB2cGNpX2FkZF9yZWdpc3RlciBv
bmNlLCB0aGVyZSBpcyBubyBuZWVkIHRvIHJlbW92ZSByZWdpc3RlcnMgd2hlbiBpdCBmYWlscy4N
Cg0KPiANCj4+IFNpZ25lZC1vZmYtYnk6IEppcWlhbiBDaGVuIDxKaXFpYW4uQ2hlbkBhbWQuY29t
Pg0KPj4gLS0tDQo+PiAgeGVuL2RyaXZlcnMvdnBjaS9tc2kuYyB8IDU3ICsrKysrKysrKysrKysr
KysrKysrKysrKysrKysrLS0tLS0tLS0tLS0tLQ0KPj4gIDEgZmlsZSBjaGFuZ2VkLCAzOSBpbnNl
cnRpb25zKCspLCAxOCBkZWxldGlvbnMoLSkNCj4+DQo+PiBkaWZmIC0tZ2l0IGEveGVuL2RyaXZl
cnMvdnBjaS9tc2kuYyBiL3hlbi9kcml2ZXJzL3ZwY2kvbXNpLmMNCj4+IGluZGV4IDlkN2E5ZmQ4
ZGJhMS4uMzBlZjk3ZWZiN2IwIDEwMDY0NA0KPj4gLS0tIGEveGVuL2RyaXZlcnMvdnBjaS9tc2ku
Yw0KPj4gKysrIGIveGVuL2RyaXZlcnMvdnBjaS9tc2kuYw0KPj4gQEAgLTE5NSw2ICsxOTUsOSBA
QCBzdGF0aWMgdm9pZCBjZl9jaGVjayBtYXNrX3dyaXRlKA0KPj4gIA0KPj4gIHN0YXRpYyBpbnQg
Y2ZfY2hlY2sgaW5pdF9tc2koc3RydWN0IHBjaV9kZXYgKnBkZXYpDQo+PiAgew0KPj4gKyAgICB1
bnNpZ25lZCBpbnQgb2Zmc2V0Ow0KPj4gKyAgICB1bnNpZ25lZCBpbnQgcmVnX2luZGV4ID0gMDsN
Cj4+ICsgICAgc3RydWN0IHZwY2lfcmVnaXN0ZXIgcmVnaXN0ZXJzW1ZQQ0lfQ0FQX01BWF9SRUdJ
U1RFUl07DQo+PiAgICAgIHVuc2lnbmVkIGludCBwb3MgPSBwZGV2LT5tc2lfcG9zOw0KPj4gICAg
ICB1aW50MTZfdCBjb250cm9sOw0KPj4gICAgICBpbnQgcmV0Ow0KPj4gQEAgLTIwNiwxNSArMjA5
LDEzIEBAIHN0YXRpYyBpbnQgY2ZfY2hlY2sgaW5pdF9tc2koc3RydWN0IHBjaV9kZXYgKnBkZXYp
DQo+PiAgICAgIGlmICggIXBkZXYtPnZwY2ktPm1zaSApDQo+PiAgICAgICAgICByZXR1cm4gLUVO
T01FTTsNCj4+ICANCj4+ICsgICAgb2Zmc2V0ID0gbXNpX2NvbnRyb2xfcmVnKHBvcyk7DQo+PiAg
ICAgIHJldCA9IHZwY2lfYWRkX3JlZ2lzdGVyKHBkZXYtPnZwY2ksIGNvbnRyb2xfcmVhZCwgY29u
dHJvbF93cml0ZSwNCj4+IC0gICAgICAgICAgICAgICAgICAgICAgICAgICAgbXNpX2NvbnRyb2xf
cmVnKHBvcyksIDIsIHBkZXYtPnZwY2ktPm1zaSk7DQo+PiArICAgICAgICAgICAgICAgICAgICAg
ICAgICAgIG9mZnNldCwgMiwgcGRldi0+dnBjaS0+bXNpKTsNCj4+ICAgICAgaWYgKCByZXQgKQ0K
Pj4gLSAgICAgICAgLyoNCj4+IC0gICAgICAgICAqIE5COiB0aGVyZSdzIG5vIG5lZWQgdG8gZnJl
ZSB0aGUgbXNpIHN0cnVjdCBvciByZW1vdmUgdGhlIHJlZ2lzdGVyDQo+PiAtICAgICAgICAgKiBo
YW5kbGVycyBmb3JtIHRoZSBjb25maWcgc3BhY2UsIHRoZSBjYWxsZXIgd2lsbCB0YWtlIGNhcmUg
b2YgdGhlDQo+PiAtICAgICAgICAgKiBjbGVhbnVwLg0KPj4gLSAgICAgICAgICovDQo+PiAtICAg
ICAgICByZXR1cm4gcmV0Ow0KPj4gKyAgICAgICAgZ290byBmYWlsOw0KPj4gKyAgICByZWdpc3Rl
cnNbcmVnX2luZGV4XS5vZmZzZXQgPSBvZmZzZXQ7DQo+PiArICAgIHJlZ2lzdGVyc1tyZWdfaW5k
ZXgrK10uc2l6ZSA9IDI7DQo+PiAgDQo+PiAgICAgIC8qIEdldCB0aGUgbWF4aW11bSBudW1iZXIg
b2YgdmVjdG9ycyB0aGUgZGV2aWNlIHN1cHBvcnRzLiAqLw0KPj4gICAgICBjb250cm9sID0gcGNp
X2NvbmZfcmVhZDE2KHBkZXYtPnNiZGYsIG1zaV9jb250cm9sX3JlZyhwb3MpKTsNCj4+IEBAIC0y
MzQsMzMgKzIzNSw0MiBAQCBzdGF0aWMgaW50IGNmX2NoZWNrIGluaXRfbXNpKHN0cnVjdCBwY2lf
ZGV2ICpwZGV2KQ0KPj4gICAgICBwZGV2LT52cGNpLT5tc2ktPmFkZHJlc3M2NCA9IGlzXzY0Yml0
X2FkZHJlc3MoY29udHJvbCk7DQo+PiAgICAgIHBkZXYtPnZwY2ktPm1zaS0+bWFza2luZyA9IGlz
X21hc2tfYml0X3N1cHBvcnQoY29udHJvbCk7DQo+PiAgDQo+PiArICAgIG9mZnNldCA9IG1zaV9s
b3dlcl9hZGRyZXNzX3JlZyhwb3MpOw0KPj4gICAgICByZXQgPSB2cGNpX2FkZF9yZWdpc3Rlcihw
ZGV2LT52cGNpLCBhZGRyZXNzX3JlYWQsIGFkZHJlc3Nfd3JpdGUsDQo+PiAtICAgICAgICAgICAg
ICAgICAgICAgICAgICAgIG1zaV9sb3dlcl9hZGRyZXNzX3JlZyhwb3MpLCA0LCBwZGV2LT52cGNp
LT5tc2kpOw0KPj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICBvZmZzZXQsIDQsIHBkZXYt
PnZwY2ktPm1zaSk7DQo+PiAgICAgIGlmICggcmV0ICkNCj4+IC0gICAgICAgIHJldHVybiByZXQ7
DQo+PiArICAgICAgICBnb3RvIGZhaWw7DQo+PiArICAgIHJlZ2lzdGVyc1tyZWdfaW5kZXhdLm9m
ZnNldCA9IG9mZnNldDsNCj4+ICsgICAgcmVnaXN0ZXJzW3JlZ19pbmRleCsrXS5zaXplID0gNDsN
Cj4+ICANCj4+ICsgICAgb2Zmc2V0ID0gbXNpX2RhdGFfcmVnKHBvcywgcGRldi0+dnBjaS0+bXNp
LT5hZGRyZXNzNjQpOw0KPj4gICAgICByZXQgPSB2cGNpX2FkZF9yZWdpc3RlcihwZGV2LT52cGNp
LCBkYXRhX3JlYWQsIGRhdGFfd3JpdGUsDQo+PiAtICAgICAgICAgICAgICAgICAgICAgICAgICAg
IG1zaV9kYXRhX3JlZyhwb3MsIHBkZXYtPnZwY2ktPm1zaS0+YWRkcmVzczY0KSwgMiwNCj4+IC0g
ICAgICAgICAgICAgICAgICAgICAgICAgICAgcGRldi0+dnBjaS0+bXNpKTsNCj4+ICsgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgb2Zmc2V0LCAyLCBwZGV2LT52cGNpLT5tc2kpOw0KPj4gICAg
ICBpZiAoIHJldCApDQo+PiAtICAgICAgICByZXR1cm4gcmV0Ow0KPj4gKyAgICAgICAgZ290byBm
YWlsOw0KPj4gKyAgICByZWdpc3RlcnNbcmVnX2luZGV4XS5vZmZzZXQgPSBvZmZzZXQ7DQo+PiAr
ICAgIHJlZ2lzdGVyc1tyZWdfaW5kZXgrK10uc2l6ZSA9IDI7DQo+PiAgDQo+PiAgICAgIGlmICgg
cGRldi0+dnBjaS0+bXNpLT5hZGRyZXNzNjQgKQ0KPj4gICAgICB7DQo+PiArICAgICAgICBvZmZz
ZXQgPSBtc2lfdXBwZXJfYWRkcmVzc19yZWcocG9zKTsNCj4+ICAgICAgICAgIHJldCA9IHZwY2lf
YWRkX3JlZ2lzdGVyKHBkZXYtPnZwY2ksIGFkZHJlc3NfaGlfcmVhZCwgYWRkcmVzc19oaV93cml0
ZSwNCj4+IC0gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIG1zaV91cHBlcl9hZGRyZXNz
X3JlZyhwb3MpLCA0LCBwZGV2LT52cGNpLT5tc2kpOw0KPj4gKyAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgb2Zmc2V0LCA0LCBwZGV2LT52cGNpLT5tc2kpOw0KPj4gICAgICAgICAgaWYg
KCByZXQgKQ0KPj4gLSAgICAgICAgICAgIHJldHVybiByZXQ7DQo+PiArICAgICAgICAgICAgZ290
byBmYWlsOw0KPj4gKyAgICAgICAgcmVnaXN0ZXJzW3JlZ19pbmRleF0ub2Zmc2V0ID0gb2Zmc2V0
Ow0KPj4gKyAgICAgICAgcmVnaXN0ZXJzW3JlZ19pbmRleCsrXS5zaXplID0gNDsNCj4+ICAgICAg
fQ0KPj4gIA0KPj4gICAgICBpZiAoIHBkZXYtPnZwY2ktPm1zaS0+bWFza2luZyApDQo+PiAgICAg
IHsNCj4+ICsgICAgICAgIG9mZnNldCA9IG1zaV9tYXNrX2JpdHNfcmVnKHBvcywgcGRldi0+dnBj
aS0+bXNpLT5hZGRyZXNzNjQpOw0KPj4gICAgICAgICAgcmV0ID0gdnBjaV9hZGRfcmVnaXN0ZXIo
cGRldi0+dnBjaSwgbWFza19yZWFkLCBtYXNrX3dyaXRlLA0KPj4gLSAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgbXNpX21hc2tfYml0c19yZWcocG9zLA0KPj4gLSAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgcGRldi0+dnBjaS0+bXNpLT5hZGRy
ZXNzNjQpLA0KPj4gLSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgNCwgcGRldi0+dnBj
aS0+bXNpKTsNCj4+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIG9mZnNldCwgNCwg
cGRldi0+dnBjaS0+bXNpKTsNCj4+ICAgICAgICAgIGlmICggcmV0ICkNCj4+IC0gICAgICAgICAg
ICByZXR1cm4gcmV0Ow0KPj4gKyAgICAgICAgICAgIGdvdG8gZmFpbDsNCj4+ICsgICAgICAgIHJl
Z2lzdGVyc1tyZWdfaW5kZXhdLm9mZnNldCA9IG9mZnNldDsNCj4+ICsgICAgICAgIHJlZ2lzdGVy
c1tyZWdfaW5kZXgrK10uc2l6ZSA9IDQ7DQo+IA0KPiBBcyBjb21tZW50ZWQgb24gdGhlIHByZXZp
b3VzIHBhdGNoLCBJIGRvbid0IGxpa2UgbXVjaCB0aGUgdXNhZ2Ugb2YNCj4gdGhpcyByZWdpc3Rl
cnMgYXJyYXkgdG8gc3RvcmUgd2hpY2ggaGFuZGxlcnMgaGF2ZSBiZWVuIGFkZGVkLiAgSXQNCj4g
d291bGQgYmUgYmVzdCBpZiB5b3UganVzdCByZW1vdmVkIGV2ZXJ5IHBvc3NpYmxlIGhhbmRsZXIg
dGhhdCBjb3VsZCBiZQ0KPiBhZGRlZCwgd2l0aG91dCBrZWVwaW5nIHRyYWNrIG9mIHRoZW0uDQpN
YWtlIHNlbnNlLCBpdCB3aWxsIGluZGVlZCBiZSBzaW1wbGVyIGlmIGl0IGlzIGZpbmUgdG8gcmVt
b3ZlIGFsbCBwb3NzaWJsZSByZWdpc3RlcnMuDQoNCj4gDQo+IFRoaW5raW5nIGFib3V0IGl0LCBk
byB3ZSBtYXliZSBuZWVkIGEgaGVscGVyIHZjcGkgZnVuY3Rpb24gdGhhdCB3aXBlcw0KPiBhbGwg
aGFuZGxlcnMgZnJvbSBhIHNwZWNpZmljIHJhbmdlPyAgSSB0aGluayBpdCBjb3VsZCBiZSBoZWxw
ZnVsIGhlcmUsDQo+IGFzIHRoZSBzaXplIG9mIHRoZSBjYXBhYmlsaXRpZXMgaXMgd2VsbC1rbm93
biwgc28gb24gZXJyb3IgaXQgd291bGQgYmUNCj4gZWFzaWVyIHRvIGp1c3QgY2FsbCBzdWNoIGEg
Z2VuZXJpYyBoYW5kbGVyIHRvIHdpcGUgYWxsIGhvb2tzIGFkZGVkIHRvDQo+IHRoZSByZWdpb24g
Y292ZXJlZCBieSB0aGUgZmFpbGluZyBjYXBhYmlsaXR5Lg0KQnV0IEkgYW0gbm90IHN1cmUgaWYg
dGhhdCBoZWxwZXIgZnVuY3Rpb24gaXMgc3VpdGFibGUgZm9yIGFsbCBjYXBhYmlsaXRpZXMuDQpM
aWtlIFJlYmFyLCBpdHMgc3RydWN0dXJlIGNhbiByYW5nZSBmcm9tIDEyIGJ5dGVzIGxvbmcoZm9y
IGEgc2luZ2xlIEJBUikgdG8gNTIgYnl0ZXMgbG9uZyhmb3IgYWxsIHNpeCBCQVJzKS4NCklmIGEg
ZGV2aWNlIHN1cHBvcnRzIFJlYmFyIGFuZCBvbmx5IGhhcyBhIHNpbmdsZSByZXNpemFibGUgQkFS
LCBkb2VzIGhhcmR3YXJlIHN0aWxsIHJlc2VydmVkIHRoZSByYW5nZSBmcm9tIDEzIGJ5dGVzIHRv
IDUyIGJ5dGVzIGZvciB0aGF0IGRldmljZT8NCkkgbWVhbiBpZiBJIHJlbW92ZSB0aGUgcmVnaXN0
ZXJzKHdpdGggcmFuZ2UgMTMgdG8gNTIpLCBpcyBpdCBwb3NzaWJsZSB0aGF0IEkgZGVsZXRlZCBy
ZWdpc3RlcnMgYmVsb25naW5nIHRvIG90aGVyIGFiaWxpdGllcz8NCg0KPiANCj4gTGV0IG1lIGtu
b3cgd2hhdCB5b3UgdGhpbmsgb2YgaXQuDQo+IA0KPiBUaGFua3MsIFJvZ2VyLg0KDQotLSANCkJl
c3QgcmVnYXJkcywNCkppcWlhbiBDaGVuLg0K

