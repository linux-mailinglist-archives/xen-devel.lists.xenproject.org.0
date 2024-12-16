Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D2CFF9F2A9A
	for <lists+xen-devel@lfdr.de>; Mon, 16 Dec 2024 08:04:30 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.857536.1269770 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tN58E-0007ec-1t; Mon, 16 Dec 2024 07:03:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 857536.1269770; Mon, 16 Dec 2024 07:03:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tN58D-0007bv-V8; Mon, 16 Dec 2024 07:03:05 +0000
Received: by outflank-mailman (input) for mailman id 857536;
 Mon, 16 Dec 2024 06:14:46 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Kj6j=TJ=eviden.com=clement.mathieu--drif@srs-se1.protection.inumbo.net>)
 id 1tN4NR-0002OY-Ns
 for xen-devel@lists.xenproject.org; Mon, 16 Dec 2024 06:14:46 +0000
Received: from smarthost1.eviden.com (smarthost1.eviden.com [80.78.11.82])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0949d2fe-bb75-11ef-99a3-01e77a169b0f;
 Mon, 16 Dec 2024 07:14:41 +0100 (CET)
Received: from mail-db5eur02lp2108.outbound.protection.outlook.com (HELO
 EUR02-DB5-obe.outbound.protection.outlook.com) ([104.47.11.108])
 by smarthost1.eviden.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Dec 2024 07:14:22 +0100
Received: from AM8PR07MB7602.eurprd07.prod.outlook.com (2603:10a6:20b:24b::7)
 by AS8PR07MB9068.eurprd07.prod.outlook.com (2603:10a6:20b:569::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8251.20; Mon, 16 Dec
 2024 06:14:17 +0000
Received: from AM8PR07MB7602.eurprd07.prod.outlook.com
 ([fe80::fbd7:ca71:b636:6f9d]) by AM8PR07MB7602.eurprd07.prod.outlook.com
 ([fe80::fbd7:ca71:b636:6f9d%5]) with mapi id 15.20.8251.015; Mon, 16 Dec 2024
 06:14:16 +0000
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
X-Inumbo-ID: 0949d2fe-bb75-11ef-99a3-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=eviden.com; i=@eviden.com; q=dns/txt; s=mail;
  t=1734329681; x=1765865681;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=KcM3qu6wrUbpXxioCKYw1IyCE3cff/1SziVQFXEGa5M=;
  b=CsxyfBJg7B7JNZgDe2KvjWl/v8QCTCFiJ4aEzkDuorqPY8S6TYK6mr0R
   UaZGdfG2UMdqM8quGJv3KzAZDoMJpxF/w0dmpLvQywyJfPdq4yuSrwWyq
   gOLVpFgXYnc+RFX4yEYjNGPK+OmsEjSUSbkxLMYFiwBl3VnQIuTJZZNm1
   OjHu/etRvI7mPYvBKCBhFt71e9yD+ZW2pxfZSOLuieZVZervBYAAvUqEA
   TjMYmo1Z0VLkl/QAV3GLdrlJX6/5VScxf3YVCe88v8t0rQ3Hj9pTdU0Mw
   diDkmB96xdiIN7p0npirh7haEG4eZiKYuHl7F613meTYPVMWHIKJCsGjy
   w==;
X-IronPort-AV: E=Sophos;i="6.12,237,1728943200"; 
   d="scan'208";a="26812121"
X-MGA-submission: =?us-ascii?q?MDF17JqH3VGSMNv5KrwJYdcOJp3fyfa92bmcjC?=
 =?us-ascii?q?32xrvjtveokzliE2SgKgYZ8fJm0W8jc+95IRvOiIgyMqHTRf1aSDa1FP?=
 =?us-ascii?q?VpPIJgePTmgGQBWqj51NGeMhDUTOCKlXmrZiSTnLtqcZ3iwYzq+a7VT6?=
 =?us-ascii?q?Azv03manBU1bfDfRvBzOaNBg=3D=3D?=
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fINMuMroT7fBB7t16IQxx6w9fRrZbNSKpidTDbyVcKcBBIHloKhbuB1NWVuKGOCpoe0L3LqhYzw6Zmeyy9SR5JncHFqTR/3ZLzKUK/MLaSbi5SYD9cmNoR73pbdoJQT3e0rh6PhEWV1MEfT+6+b0EM6XF2sNrt3Q2YzEMZCcSM5qeXfNv7GNRLuHkuFMom55A4qOoYUjFd+haoymg4yBS7AMxBAVnsJqNnpRlBctfLEXFTtZzcvYxx05sLm/RyIvc+3V6DqUkyPz0xbCm/uf8Vg94IemfaS7Z/bTIHPOzB6YvQmAJm/tCD+UrRJ0/tl+f26nwMmQ2ilmKiXcGz3AFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KcM3qu6wrUbpXxioCKYw1IyCE3cff/1SziVQFXEGa5M=;
 b=JIELYCoVVU36JaYfN+bH/c5rytv79Z7/gUya8yDYf9gC0bNuW2GwUNf9xP4utpDXRgzO6uHQeE0/uT8rky6ikan+289xdVJpsqdUdF/yyLc7wwMXgNvrAb9TaN3QRusUlGnTXSKKU4YSYI4XoGdQ/6qhtQpTs+4pTjdSu0mObsApQZ2IJ7dghAwEcBX2nkQUcSvGiWSZT6wbEUqwpmcNrmpYMdCHdYJ3fTz9HqU3bSWOPV32a24Dzl2zwH3WKScA3sIuS2BdPMDZex32BrD46eVMRrYn5OLe1hUCi1XXhuK+lkHPcK2E3gwUTJODZoADHa455zlOz4OiS97zPzj/kg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=eviden.com; dmarc=pass action=none header.from=eviden.com;
 dkim=pass header.d=eviden.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Eviden.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KcM3qu6wrUbpXxioCKYw1IyCE3cff/1SziVQFXEGa5M=;
 b=D2DIKbJ/9aYDJklH1H+XOalP06XslkXr4ZUW+Yql98OOEOJr/VMz51VMbxjspQO605GZ4uBsYKV8fDZRh5/ezFfzgJRMfuzkZb16DaNZq2tSOLcoExdk1WC7PrEDUQRTOTOGlsocUQe0VJxY/p8+ZDPL9sx0d/zAUnU3Y5KqLzm54JLblBn29m2SnZFro9By86RdVaN50Ywvh7f4QkMtiyL3/Oyk2Memn13Z+2tNdG3a0jPEpzfI4XFFbSx052KNgyReeLFfHCYimZRZf0Cj2Dno5Byfy5BkXNEWsMPQXZMKsKUKzgaNW4IM3V361jwTZsRQrhd/Nt1mty+gjuhJoQ==
From: CLEMENT MATHIEU--DRIF <clement.mathieu--drif@eviden.com>
To: Richard Henderson <richard.henderson@linaro.org>, "qemu-devel@nongnu.org"
	<qemu-devel@nongnu.org>
CC: "Michael S. Tsirkin" <mst@redhat.com>, Marcel Apfelbaum
	<marcel.apfelbaum@gmail.com>, Paolo Bonzini <pbonzini@redhat.com>, Eduardo
 Habkost <eduardo@habkost.net>, Jason Wang <jasowang@redhat.com>, Yi Liu
	<yi.l.liu@intel.com>, Stefano Stabellini <sstabellini@kernel.org>, Anthony
 PERARD <anthony@xenproject.org>, Paul Durrant <paul@xen.org>, "Edgar E.
 Iglesias" <edgar.iglesias@gmail.com>, "open list:X86 Xen CPUs"
	<xen-devel@lists.xenproject.org>
Subject: Re: [PATCH 29/71] hw/i386: Constify all Property
Thread-Topic: [PATCH 29/71] hw/i386: Constify all Property
Thread-Index: AQHbTZKuMX5TQ4/Qd0KDE8iIYBLMC7LoaEWA
Date: Mon, 16 Dec 2024 06:14:16 +0000
Message-ID: <774bd939-8015-47c2-910d-f36c44bc0379@eviden.com>
References: <20241213190750.2513964-1-richard.henderson@linaro.org>
 <20241213190750.2513964-34-richard.henderson@linaro.org>
In-Reply-To: <20241213190750.2513964-34-richard.henderson@linaro.org>
Accept-Language: en-GB, fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=eviden.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AM8PR07MB7602:EE_|AS8PR07MB9068:EE_
x-ms-office365-filtering-correlation-id: 5f7a7b0e-23d3-4fec-0f47-08dd1d98ded9
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|1800799024|7416014|366016|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?Y3U4WkRuUVByYjJ6TWZ5MGM5dnF3a2cvRXgzVi9jNndLZC9QSmZ2YnBnMWNo?=
 =?utf-8?B?TFJDWkl1aVQyTzNYTnAzTEpVLzlKVFhtOTIyYzNGVXIyWDRKUXJaSmlvWWQw?=
 =?utf-8?B?bWQ4bUtNVnVRU0NxMVR1NzNSVG9FSU5YZ1hDZU1QcFlYN09HYkRsVGExbTVW?=
 =?utf-8?B?RzhWaER2MjUyYTdLWEZSRFVHVm8wMnorZEg3NEVMQmpJMVlZTGJQZW5yS3Rm?=
 =?utf-8?B?eTRQOTlZdWtEWlhCZ25FR1dzalhqUVZZZUEveElGdWVvaG9qYWkwTXBieWFh?=
 =?utf-8?B?NUlGRW44QXhlRUFYSlVIUTdVMWtWRCt1Zm05MXhSeWthYSsramxxQitJUHJt?=
 =?utf-8?B?WG9kS21aeU1Uem9EZGtLWEw4RFhZOFlDQStWTEJjMkg2Q1IvOUNoZU1XdlJr?=
 =?utf-8?B?TlkvbHFsN0NrWDRnaGkvUDZMQTNDNGQ0ZkNVQjdtendhaXhGM2xnZ29pa2M0?=
 =?utf-8?B?bWxRcEFpQjZvWVFXWVNNNkh0RXVTK3NzMFZva0FzUThaSStEOERZME1uR1kz?=
 =?utf-8?B?Y3ZhTmlOeDRsb2FQNmpTVVJ2R0diVm5GZ01NNWFXT3VnUzcyalhEb21tTlBn?=
 =?utf-8?B?azRVZi9jeFN0Q2x2WlZoR0NTRklML1hNakF4aEw0c1F4SGZhSlYyVDJlVE8w?=
 =?utf-8?B?TSsxNU9lNlNEUHFVVS9XdG9Id1liRUhnOVQ0Z2krSEIwbjRGL25BL2JCdGZN?=
 =?utf-8?B?QlNteEhuaC94QTRjLzVFNWlOYmh6QnlOZTZ4Nm1SZ3VRekk0VldSbG50dHEz?=
 =?utf-8?B?T0pTR1hmMFhLcTJKdDg0SEJuUnQyUDB3Y1c4RFVQUHk3UVVtT3BJVEtyR2ln?=
 =?utf-8?B?MGxvZWl4K1grdTl3ejhURTJ5VGlqL3ltTUh5RldTWXBnUmJXUmV0eTNHVm44?=
 =?utf-8?B?ODVXYnFnWXRRM0cvajAveXRVWG4vMGRTQjlDTGo5SkVxcXFYekN3NmJzSWlw?=
 =?utf-8?B?bzdhTE9jM2RsYlpiem5QWkRKSzdjSXh1ZmdvT0dMZ3lhajBGanBqYk00QWpl?=
 =?utf-8?B?VUl3ejdKRW9XaUVSMG8zd2ZuSjJSR0NjMExWWmtIQmZ0ajJDMHRjMUcrTzV0?=
 =?utf-8?B?enZqRWJ1ZmxkY2pCRFdoQm9SaWpNMlZHbkRFK0NTQWh6bitEUURrRm1ndTlR?=
 =?utf-8?B?ZXZsNEQ0dWN6QURtQmErNlAxT0dEWWtHMG85bVdhY2pTVTh6Q2g3OWltMi9k?=
 =?utf-8?B?QTYxUnNtWHRGNVZEemlyckVnLzdkYmZVcGVUQmZ1TmZRUy94L3dIZVdDVllU?=
 =?utf-8?B?TE1LL3lqNnM0bmU5Wm9VSWducldxekFXaFhZeldjeGIvZmtwQ1JHZ2tDdDVT?=
 =?utf-8?B?UjFtcFdaOWg5T1pKUjB0RnF4ZXNjZ3d4Z3FXelp6aXhBZmxmRDh0RSt4bkpl?=
 =?utf-8?B?U1lyYUhkTlZLWFVySFM4c1pNbzFWcDJzN3BUc0lIbE0waFV0VU13ZkMzeURW?=
 =?utf-8?B?VmhvbUhTQ2FiSkZNU3psT3oybzZaTTVvRzZPYU1aNUlkQ1owZUVwZXZpZFZM?=
 =?utf-8?B?UWZBS0VDMWU3cm5iM2gvVEk3WnRWYlk5Nm5lZ21WT3ZyLzFoZTdqTlE5V2tk?=
 =?utf-8?B?V3pDR2xrNmNqMkk2TDNsVEJoZzIwVmRiZ2FPNG5CVU5HckZpcW1rVHFGMlFV?=
 =?utf-8?B?TVBwWUFIL1JscUV6RkFGTlJ2SEFWQzczcytsUGd4RWwyTVpHT21JZ0o1NXZW?=
 =?utf-8?B?S3ZaL1JSWURWSGVvQmw3bkN3elRKMmtWZkNwMXZYZGNlRUhSclhYYmdLTWtE?=
 =?utf-8?B?a01kLzY1L2JXTEJVNFprcnl6OE16REwvWE9yOGIyZk1FTHJZSVJyVVdOMFAx?=
 =?utf-8?B?L3lsRXN2eEd3UjBDZ1ZEKzNkR0FKcGNvWG5uT1lmRVpzSE1qZFhNbDVpZGhz?=
 =?utf-8?B?VUFOdzZ3RFVkNmpnc1F5VFNQT2NTV25oUWphaCtZKzRtL1lCNE51VDZqQmJB?=
 =?utf-8?Q?gRZiCUUSHwDy5DumCkz36or0GrQ3Tt6G?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM8PR07MB7602.eurprd07.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(7416014)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?UDZGUkFnVkprK3hsRnBJRktOV2J5bEF4ekJaU2R4QTEvTStyMm9HaWNwc1Ux?=
 =?utf-8?B?M0RNb3hmMnRiSzNKendTcG5acXRad25TYlJ4dHN5Y0FaZXpobmo2SUFvMFZu?=
 =?utf-8?B?ZjZrdHdoY2RjVG56WXZuNTUrbE5pa2NVcit6ZWN0Vnp3bE1pN3Z3b2Uwc1hP?=
 =?utf-8?B?Q0tXd1Y0M0NwR01vWGFTZkFNRmRNb2g4U1piUnZmR25GcWVOWFg1TEptM2ZB?=
 =?utf-8?B?RkY1U1lUcVhMei9NZDE5VVV0dUhYaFZScmpKSGd0dHlrTlZYNy94bm94dys4?=
 =?utf-8?B?eXV2RGNRWUdoR2RXS2pkTXpyNW92QXRWekt4N0J6SElGejFzN011alhKK0dv?=
 =?utf-8?B?Y3ZYaUdTWHI2bFV3NmF2QkM1dzR4cEZuWTQvTXdrUkp1U1daZERJUGpFbjNo?=
 =?utf-8?B?YTB4ZHp1ZHZVM3JEWnZOYjN0VXduaFNMVWVaQmE5Sm5IMk1DVGV0ZzAydkpD?=
 =?utf-8?B?WE5iTVUzSlRreDU5ekRHN0ZaV2FESjBLTklUZ1BYazV3a1FCWGVodWFmYXhS?=
 =?utf-8?B?Qmp3MzkvN1RwZVRiYVVhblF5R1RHVXdWcCtzZDhTc3c4eUtKRnBPREgyOGh2?=
 =?utf-8?B?TE5NTDQyMDN5NGwwMlBRRktWSnN1c3J6SlpnSk5jWWpTN3pqdFdQL1pNSWtm?=
 =?utf-8?B?SndlVGVQWGZ0bFpQU2JveU9LVldPbjBBbU1scjlVZGlvbTdYNXRRY0pFQ2RC?=
 =?utf-8?B?b1YyUXZOekZGamkzenc2RWs4MXhneUxqelY1cU1wZi9Wb1d3MEl0SmlYSWt2?=
 =?utf-8?B?NHBuZ25GeVlBbm9yQkJuTE1MeU5Ea1FwYWxJUWNMRXhaejRFaXZYTVdrYWtI?=
 =?utf-8?B?VVZHQ1NlZmpyNzkrMFR3NitQd29JM3VFNjVtQitycnhvOFVQZ1VCL1pYeXc3?=
 =?utf-8?B?b3ZZUTFZd01KdWd4elZ4WGc5UjBzeWxGRlVqZXBEeG0zaW9yTHBpcm83aXZR?=
 =?utf-8?B?OWFBVEFUdVFkTFMxdVV5ZURkNW9SVlcyNTlZMUN4ZDlPVkREL2N3SUxrMTFF?=
 =?utf-8?B?UW0wNFNnUHh0N1hTbUw0T0U1N1FJaHdoM0tFZE4rU1VoN1JrWWg0Q1FTcUNl?=
 =?utf-8?B?U2xYSEkzM0gwSmNVKzdOZVZlbWhINFoybTdNeWp2WHJlUjZMczBXQ0JNaVlL?=
 =?utf-8?B?WjBiSFZvdTQ4OVNNUnJzZ3ppLy9pendHNFk3SEc4dHRpdjUvQW12S1BuTzZE?=
 =?utf-8?B?K0tCZEtXVFRmWkQ3WXU1QVQzelJkOWxGWFpPSnVqeGxJNjZYZ0NMK1Uva3g1?=
 =?utf-8?B?ZnNSODF1Rmh2OWN2WTl6Uyt5eksyRmFXWmlrVkdBNzhjV1dvbFo3dWxZdFp4?=
 =?utf-8?B?YkNlN1VZYVRvMVAyaElGd1JBbldhSTB5MlpCVkhucU1HQk9WZ0E4VTV0bGpU?=
 =?utf-8?B?Y0ZydHhGL0lXNytNZUVvRnBzbXpGZldKZ2xwNGRvZ04ybWFLcWROWkk2SVgw?=
 =?utf-8?B?Q0lHNzNkT0JuT3ZTbEhFUUtYaFhZWVU4TkVsNkZLa0lyc2dHSSsrM2JjZklr?=
 =?utf-8?B?RWtaRnlBNGJlR0ptS2tKYXFFelFlR083UTZqd1NSMlNjQ3pVVlEvYmNsd0Jj?=
 =?utf-8?B?UytEUUlveW5RNnQvTWJ4bzJlZllWWGFGR0JRWkxYRWFMdTZhTklpTnpPUm90?=
 =?utf-8?B?OWNZT1pzbzl2NDNkTk5vdldkVGoyYTBDd1F3YThGTkhRSTJZRFdRS3VHOE53?=
 =?utf-8?B?eHlEay95NFZPUUhJWVMrekdFRU10RHZBblc4NzFEVTNROWZGSTUyZ3pkcXFE?=
 =?utf-8?B?N2p0WVBLM0JUZEJtOWRFM0ZqMXFwVDJEYWpRQzhSa0RlN01leTNrSmtCNE9t?=
 =?utf-8?B?Q3BjOWpSQ0djMFVyQXpWa0ljRjQ3OW1Yd0xhbHRjSDNpUXN3OXFDNTcxZVNF?=
 =?utf-8?B?aERFdmdOSzF1QlBPQjRFRnFLY1pGWi9KOGRUaGlseXlOcGpBSE9NQVFqRlNN?=
 =?utf-8?B?bE5ua3pXWWpobnkrdWc4VFZZR2FycVgvZlNTcjZNWkgxQmJoQjh3YXBuQWJ6?=
 =?utf-8?B?bTFFQ2w2eWgwZDJGWGdQRzkvQi9wMFdsa3N1ZlVXWms1dDg0OVJ6NW5Ta2NW?=
 =?utf-8?B?cDlyN3l6aGNZNE5adEVyT2prTEgwNUs4VUZwZTdUd1V3T3JkZE5rbFlCd3Ji?=
 =?utf-8?B?amtCSzhLZHE0STBmRTNkOG9KbGthSkg5UWJzTVlVdFFLdmVxQzhvT3o2UW9M?=
 =?utf-8?Q?t0u293gx+oyaxMi2M7YONWg=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <65718DAC884D734985E2BC933C356A9B@eurprd07.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: eviden.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM8PR07MB7602.eurprd07.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5f7a7b0e-23d3-4fec-0f47-08dd1d98ded9
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Dec 2024 06:14:16.7239
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 7d1c7785-2d8a-437d-b842-1ed5d8fbe00a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: AQtkFe7vRLLiYHGuG51H9j0F0cp5xdINTPFTYEle+2wlNa8+CRzlaGj1RZpSQan0I0z2aJmSC1tSroD6LJcWm8TQqhpjvzeSZKEMM9EOSYjtZu/WlSXn1NGWe+m4nbzr
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR07MB9068

SGkgUmloYXJkLg0KDQpHb29kIGlkZWEsIExHVE0uDQoNCkp1c3Qgb3V0IG9mIGN1cmlvc2l0eSwg
d2hhdCB3YXMgdGhlIG1vdGl2YXRpb24gZm9yIHN1Y2ggYSBwYXRjaD8NCkl0IGl0IHNpbXBseSBh
Ym91dCBjbGVhbmluZyB0aGUgY29kZSBvciBpcyBpdCBpbnRlbmRlZCB0byBzb2x2ZSBhIGRlZXBl
ciANCnByb2JsZW0uDQoNClRoYW5rcywNCmNtZA0KDQoNCk9uIDEzLzEyLzIwMjQgMjA6MDcsIFJp
Y2hhcmQgSGVuZGVyc29uIHdyb3RlOg0KPiBDYXV0aW9uOiBFeHRlcm5hbCBlbWFpbC4gRG8gbm90
IG9wZW4gYXR0YWNobWVudHMgb3IgY2xpY2sgbGlua3MsIHVubGVzcyB0aGlzIGVtYWlsIGNvbWVz
IGZyb20gYSBrbm93biBzZW5kZXIgYW5kIHlvdSBrbm93IHRoZSBjb250ZW50IGlzIHNhZmUuDQo+
DQo+DQo+IFNpZ25lZC1vZmYtYnk6IFJpY2hhcmQgSGVuZGVyc29uIDxyaWNoYXJkLmhlbmRlcnNv
bkBsaW5hcm8ub3JnPg0KPiAtLS0NCj4gICBody9pMzg2L2FtZF9pb21tdS5jICAgICAgICB8IDIg
Ky0NCj4gICBody9pMzg2L2ludGVsX2lvbW11LmMgICAgICB8IDIgKy0NCj4gICBody9pMzg2L2t2
bS9jbG9jay5jICAgICAgICB8IDIgKy0NCj4gICBody9pMzg2L2t2bS9pODI1NC5jICAgICAgICB8
IDIgKy0NCj4gICBody9pMzg2L2t2bS9pb2FwaWMuYyAgICAgICB8IDIgKy0NCj4gICBody9pMzg2
L3NneC1lcGMuYyAgICAgICAgICB8IDIgKy0NCj4gICBody9pMzg2L3ZtbW91c2UuYyAgICAgICAg
ICB8IDIgKy0NCj4gICBody9pMzg2L3ZtcG9ydC5jICAgICAgICAgICB8IDIgKy0NCj4gICBody9p
Mzg2L3g4Ni1pb21tdS5jICAgICAgICB8IDIgKy0NCj4gICBody9pMzg2L3hlbi94ZW5fcHZkZXZp
Y2UuYyB8IDIgKy0NCj4gICAxMCBmaWxlcyBjaGFuZ2VkLCAxMCBpbnNlcnRpb25zKCspLCAxMCBk
ZWxldGlvbnMoLSkNCj4NCj4gZGlmZiAtLWdpdCBhL2h3L2kzODYvYW1kX2lvbW11LmMgYi9ody9p
Mzg2L2FtZF9pb21tdS5jDQo+IGluZGV4IGFmMGY0ZGExZjYuLmNhM2U2MmEyNDQgMTAwNjQ0DQo+
IC0tLSBhL2h3L2kzODYvYW1kX2lvbW11LmMNCj4gKysrIGIvaHcvaTM4Ni9hbWRfaW9tbXUuYw0K
PiBAQCAtMTY2OCw3ICsxNjY4LDcgQEAgc3RhdGljIHZvaWQgYW1kdmlfc3lzYnVzX3JlYWxpemUo
RGV2aWNlU3RhdGUgKmRldiwgRXJyb3IgKiplcnJwKQ0KPiAgICAgICBhbWR2aV9pbml0KHMpOw0K
PiAgIH0NCj4NCj4gLXN0YXRpYyBQcm9wZXJ0eSBhbWR2aV9wcm9wZXJ0aWVzW10gPSB7DQo+ICtz
dGF0aWMgY29uc3QgUHJvcGVydHkgYW1kdmlfcHJvcGVydGllc1tdID0gew0KPiAgICAgICBERUZJ
TkVfUFJPUF9CT09MKCJ4dHN1cCIsIEFNRFZJU3RhdGUsIHh0c3VwLCBmYWxzZSksDQo+ICAgICAg
IERFRklORV9QUk9QX0VORF9PRl9MSVNUKCksDQo+ICAgfTsNCj4gZGlmZiAtLWdpdCBhL2h3L2kz
ODYvaW50ZWxfaW9tbXUuYyBiL2h3L2kzODYvaW50ZWxfaW9tbXUuYw0KPiBpbmRleCA0YzBkMWQ3
ZDQ3Li5hNWIyNjgzNDJmIDEwMDY0NA0KPiAtLS0gYS9ody9pMzg2L2ludGVsX2lvbW11LmMNCj4g
KysrIGIvaHcvaTM4Ni9pbnRlbF9pb21tdS5jDQo+IEBAIC0zNDA0LDcgKzM0MDQsNyBAQCBzdGF0
aWMgY29uc3QgTWVtb3J5UmVnaW9uT3BzIHZ0ZF9tZW1fb3BzID0gew0KPiAgICAgICB9LA0KPiAg
IH07DQo+DQo+IC1zdGF0aWMgUHJvcGVydHkgdnRkX3Byb3BlcnRpZXNbXSA9IHsNCj4gK3N0YXRp
YyBjb25zdCBQcm9wZXJ0eSB2dGRfcHJvcGVydGllc1tdID0gew0KPiAgICAgICBERUZJTkVfUFJP
UF9VSU5UMzIoInZlcnNpb24iLCBJbnRlbElPTU1VU3RhdGUsIHZlcnNpb24sIDApLA0KPiAgICAg
ICBERUZJTkVfUFJPUF9PTl9PRkZfQVVUTygiZWltIiwgSW50ZWxJT01NVVN0YXRlLCBpbnRyX2Vp
bSwNCj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgT05fT0ZGX0FVVE9fQVVUTyksDQo+
IGRpZmYgLS1naXQgYS9ody9pMzg2L2t2bS9jbG9jay5jIGIvaHcvaTM4Ni9rdm0vY2xvY2suYw0K
PiBpbmRleCA0MGFhOWEzMmMzLi43MTE1MGVkMmUwIDEwMDY0NA0KPiAtLS0gYS9ody9pMzg2L2t2
bS9jbG9jay5jDQo+ICsrKyBiL2h3L2kzODYva3ZtL2Nsb2NrLmMNCj4gQEAgLTMwNSw3ICszMDUs
NyBAQCBzdGF0aWMgY29uc3QgVk1TdGF0ZURlc2NyaXB0aW9uIGt2bWNsb2NrX3Ztc2QgPSB7DQo+
ICAgICAgIH0NCj4gICB9Ow0KPg0KPiAtc3RhdGljIFByb3BlcnR5IGt2bWNsb2NrX3Byb3BlcnRp
ZXNbXSA9IHsNCj4gK3N0YXRpYyBjb25zdCBQcm9wZXJ0eSBrdm1jbG9ja19wcm9wZXJ0aWVzW10g
PSB7DQo+ICAgICAgIERFRklORV9QUk9QX0JPT0woIngtbWFjaC11c2UtcmVsaWFibGUtZ2V0LWNs
b2NrIiwgS1ZNQ2xvY2tTdGF0ZSwNCj4gICAgICAgICAgICAgICAgICAgICAgICAgbWFjaF91c2Vf
cmVsaWFibGVfZ2V0X2Nsb2NrLCB0cnVlKSwNCj4gICAgICAgREVGSU5FX1BST1BfRU5EX09GX0xJ
U1QoKSwNCj4gZGlmZiAtLWdpdCBhL2h3L2kzODYva3ZtL2k4MjU0LmMgYi9ody9pMzg2L2t2bS9p
ODI1NC5jDQo+IGluZGV4IGJhYTRiMzk1ODIuLjI5MzNkM2Y0NTggMTAwNjQ0DQo+IC0tLSBhL2h3
L2kzODYva3ZtL2k4MjU0LmMNCj4gKysrIGIvaHcvaTM4Ni9rdm0vaTgyNTQuYw0KPiBAQCAtMjg3
LDcgKzI4Nyw3IEBAIHN0YXRpYyB2b2lkIGt2bV9waXRfcmVhbGl6ZWZuKERldmljZVN0YXRlICpk
ZXYsIEVycm9yICoqZXJycCkNCj4gICAgICAga3BjLT5wYXJlbnRfcmVhbGl6ZShkZXYsIGVycnAp
Ow0KPiAgIH0NCj4NCj4gLXN0YXRpYyBQcm9wZXJ0eSBrdm1fcGl0X3Byb3BlcnRpZXNbXSA9IHsN
Cj4gK3N0YXRpYyBjb25zdCBQcm9wZXJ0eSBrdm1fcGl0X3Byb3BlcnRpZXNbXSA9IHsNCj4gICAg
ICAgREVGSU5FX1BST1BfTE9TVFRJQ0tQT0xJQ1koImxvc3RfdGlja19wb2xpY3kiLCBLVk1QSVRT
dGF0ZSwNCj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgbG9zdF90aWNrX3BvbGlj
eSwgTE9TVF9USUNLX1BPTElDWV9ERUxBWSksDQo+ICAgICAgIERFRklORV9QUk9QX0VORF9PRl9M
SVNUKCksDQo+IGRpZmYgLS1naXQgYS9ody9pMzg2L2t2bS9pb2FwaWMuYyBiL2h3L2kzODYva3Zt
L2lvYXBpYy5jDQo+IGluZGV4IDI5MDdiMDgxNjQuLjIxN2ZmNDNiOTggMTAwNjQ0DQo+IC0tLSBh
L2h3L2kzODYva3ZtL2lvYXBpYy5jDQo+ICsrKyBiL2h3L2kzODYva3ZtL2lvYXBpYy5jDQo+IEBA
IC0xMzMsNyArMTMzLDcgQEAgc3RhdGljIHZvaWQga3ZtX2lvYXBpY19yZWFsaXplKERldmljZVN0
YXRlICpkZXYsIEVycm9yICoqZXJycCkNCj4gICAgICAgcWRldl9pbml0X2dwaW9faW4oZGV2LCBr
dm1faW9hcGljX3NldF9pcnEsIElPQVBJQ19OVU1fUElOUyk7DQo+ICAgfQ0KPg0KPiAtc3RhdGlj
IFByb3BlcnR5IGt2bV9pb2FwaWNfcHJvcGVydGllc1tdID0gew0KPiArc3RhdGljIGNvbnN0IFBy
b3BlcnR5IGt2bV9pb2FwaWNfcHJvcGVydGllc1tdID0gew0KPiAgICAgICBERUZJTkVfUFJPUF9V
SU5UMzIoImdzaV9iYXNlIiwgS1ZNSU9BUElDU3RhdGUsIGt2bV9nc2lfYmFzZSwgMCksDQo+ICAg
ICAgIERFRklORV9QUk9QX0VORF9PRl9MSVNUKCkNCj4gICB9Ow0KPiBkaWZmIC0tZ2l0IGEvaHcv
aTM4Ni9zZ3gtZXBjLmMgYi9ody9pMzg2L3NneC1lcGMuYw0KPiBpbmRleCBkNjY0ODI5ZDM1Li5j
MjMyZTgyNWUwIDEwMDY0NA0KPiAtLS0gYS9ody9pMzg2L3NneC1lcGMuYw0KPiArKysgYi9ody9p
Mzg2L3NneC1lcGMuYw0KPiBAQCAtMTksNyArMTksNyBAQA0KPiAgICNpbmNsdWRlICJ0YXJnZXQv
aTM4Ni9jcHUuaCINCj4gICAjaW5jbHVkZSAiZXhlYy9hZGRyZXNzLXNwYWNlcy5oIg0KPg0KPiAt
c3RhdGljIFByb3BlcnR5IHNneF9lcGNfcHJvcGVydGllc1tdID0gew0KPiArc3RhdGljIGNvbnN0
IFByb3BlcnR5IHNneF9lcGNfcHJvcGVydGllc1tdID0gew0KPiAgICAgICBERUZJTkVfUFJPUF9V
SU5UNjQoU0dYX0VQQ19BRERSX1BST1AsIFNHWEVQQ0RldmljZSwgYWRkciwgMCksDQo+ICAgICAg
IERFRklORV9QUk9QX1VJTlQzMihTR1hfRVBDX05VTUFfTk9ERV9QUk9QLCBTR1hFUENEZXZpY2Us
IG5vZGUsIDApLA0KPiAgICAgICBERUZJTkVfUFJPUF9MSU5LKFNHWF9FUENfTUVNREVWX1BST1As
IFNHWEVQQ0RldmljZSwgaG9zdG1lbSwNCj4gZGlmZiAtLWdpdCBhL2h3L2kzODYvdm1tb3VzZS5j
IGIvaHcvaTM4Ni92bW1vdXNlLmMNCj4gaW5kZXggNzYxMzBjZDQ2ZC4uZGE5YzM1YzFlYyAxMDA2
NDQNCj4gLS0tIGEvaHcvaTM4Ni92bW1vdXNlLmMNCj4gKysrIGIvaHcvaTM4Ni92bW1vdXNlLmMN
Cj4gQEAgLTMxNyw3ICszMTcsNyBAQCBzdGF0aWMgdm9pZCB2bW1vdXNlX3JlYWxpemVmbihEZXZp
Y2VTdGF0ZSAqZGV2LCBFcnJvciAqKmVycnApDQo+ICAgICAgIHZtcG9ydF9yZWdpc3RlcihWTVBP
UlRfQ01EX1ZNTU9VU0VfREFUQSwgdm1tb3VzZV9pb3BvcnRfcmVhZCwgcyk7DQo+ICAgfQ0KPg0K
PiAtc3RhdGljIFByb3BlcnR5IHZtbW91c2VfcHJvcGVydGllc1tdID0gew0KPiArc3RhdGljIGNv
bnN0IFByb3BlcnR5IHZtbW91c2VfcHJvcGVydGllc1tdID0gew0KPiAgICAgICBERUZJTkVfUFJP
UF9MSU5LKCJpODA0MiIsIFZNTW91c2VTdGF0ZSwgaTgwNDIsIFRZUEVfSTgwNDIsIElTQUtCRFN0
YXRlICopLA0KPiAgICAgICBERUZJTkVfUFJPUF9FTkRfT0ZfTElTVCgpLA0KPiAgIH07DQo+IGRp
ZmYgLS1naXQgYS9ody9pMzg2L3ZtcG9ydC5jIGIvaHcvaTM4Ni92bXBvcnQuYw0KPiBpbmRleCA3
Y2M3NWRiYzZkLi5jYWI2ZTcyMDg5IDEwMDY0NA0KPiAtLS0gYS9ody9pMzg2L3ZtcG9ydC5jDQo+
ICsrKyBiL2h3L2kzODYvdm1wb3J0LmMNCj4gQEAgLTI1Miw3ICsyNTIsNyBAQCBzdGF0aWMgdm9p
ZCB2bXBvcnRfcmVhbGl6ZWZuKERldmljZVN0YXRlICpkZXYsIEVycm9yICoqZXJycCkNCj4gICAg
ICAgfQ0KPiAgIH0NCj4NCj4gLXN0YXRpYyBQcm9wZXJ0eSB2bXBvcnRfcHJvcGVydGllc1tdID0g
ew0KPiArc3RhdGljIGNvbnN0IFByb3BlcnR5IHZtcG9ydF9wcm9wZXJ0aWVzW10gPSB7DQo+ICAg
ICAgIC8qIFVzZWQgdG8gZW5mb3JjZSBjb21wYXRpYmlsaXR5IGZvciBtaWdyYXRpb24gKi8NCj4g
ICAgICAgREVGSU5FX1BST1BfQklUKCJ4LXJlYWQtc2V0LWVheCIsIFZNUG9ydFN0YXRlLCBjb21w
YXRfZmxhZ3MsDQo+ICAgICAgICAgICAgICAgICAgICAgICBWTVBPUlRfQ09NUEFUX1JFQURfU0VU
X0VBWF9CSVQsIHRydWUpLA0KPiBkaWZmIC0tZ2l0IGEvaHcvaTM4Ni94ODYtaW9tbXUuYyBiL2h3
L2kzODYveDg2LWlvbW11LmMNCj4gaW5kZXggNjBhZjg5NjIyNS4uMTU1ZjYyNjJlYSAxMDA2NDQN
Cj4gLS0tIGEvaHcvaTM4Ni94ODYtaW9tbXUuYw0KPiArKysgYi9ody9pMzg2L3g4Ni1pb21tdS5j
DQo+IEBAIC0xMjUsNyArMTI1LDcgQEAgc3RhdGljIHZvaWQgeDg2X2lvbW11X3JlYWxpemUoRGV2
aWNlU3RhdGUgKmRldiwgRXJyb3IgKiplcnJwKQ0KPiAgICAgICB9DQo+ICAgfQ0KPg0KPiAtc3Rh
dGljIFByb3BlcnR5IHg4Nl9pb21tdV9wcm9wZXJ0aWVzW10gPSB7DQo+ICtzdGF0aWMgY29uc3Qg
UHJvcGVydHkgeDg2X2lvbW11X3Byb3BlcnRpZXNbXSA9IHsNCj4gICAgICAgREVGSU5FX1BST1Bf
T05fT0ZGX0FVVE8oImludHJlbWFwIiwgWDg2SU9NTVVTdGF0ZSwNCj4gICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgaW50cl9zdXBwb3J0ZWQsIE9OX09GRl9BVVRPX0FVVE8pLA0KPiAgICAg
ICBERUZJTkVfUFJPUF9CT09MKCJkZXZpY2UtaW90bGIiLCBYODZJT01NVVN0YXRlLCBkdF9zdXBw
b3J0ZWQsIGZhbHNlKSwNCj4gZGlmZiAtLWdpdCBhL2h3L2kzODYveGVuL3hlbl9wdmRldmljZS5j
IGIvaHcvaTM4Ni94ZW4veGVuX3B2ZGV2aWNlLmMNCj4gaW5kZXggZWQ2MjE1MzFkOC4uZTcxNDgz
ZTZlMyAxMDA2NDQNCj4gLS0tIGEvaHcvaTM4Ni94ZW4veGVuX3B2ZGV2aWNlLmMNCj4gKysrIGIv
aHcvaTM4Ni94ZW4veGVuX3B2ZGV2aWNlLmMNCj4gQEAgLTExNSw3ICsxMTUsNyBAQCBzdGF0aWMg
dm9pZCB4ZW5fcHZfcmVhbGl6ZShQQ0lEZXZpY2UgKnBjaV9kZXYsIEVycm9yICoqZXJycCkNCj4g
ICAgICAgICAgICAgICAgICAgICAgICAmZC0+bW1pbyk7DQo+ICAgfQ0KPg0KPiAtc3RhdGljIFBy
b3BlcnR5IHhlbl9wdl9wcm9wc1tdID0gew0KPiArc3RhdGljIGNvbnN0IFByb3BlcnR5IHhlbl9w
dl9wcm9wc1tdID0gew0KPiAgICAgICBERUZJTkVfUFJPUF9VSU5UMTYoInZlbmRvci1pZCIsIFhl
blBWRGV2aWNlLCB2ZW5kb3JfaWQsIFBDSV9WRU5ET1JfSURfWEVOKSwNCj4gICAgICAgREVGSU5F
X1BST1BfVUlOVDE2KCJkZXZpY2UtaWQiLCBYZW5QVkRldmljZSwgZGV2aWNlX2lkLCAweGZmZmYp
LA0KPiAgICAgICBERUZJTkVfUFJPUF9VSU5UOCgicmV2aXNpb24iLCBYZW5QVkRldmljZSwgcmV2
aXNpb24sIDB4MDEpLA0KPiAtLQ0KPiAyLjQzLjANCj4NCg==

