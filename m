Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C66AB0F7DE
	for <lists+xen-devel@lfdr.de>; Wed, 23 Jul 2025 18:12:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1054495.1423288 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uec4i-0006TE-Mk; Wed, 23 Jul 2025 16:12:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1054495.1423288; Wed, 23 Jul 2025 16:12:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uec4i-0006RE-JT; Wed, 23 Jul 2025 16:12:12 +0000
Received: by outflank-mailman (input) for mailman id 1054495;
 Wed, 23 Jul 2025 16:12:11 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=VoQP=2E=epam.com=dmytro_prokopchuk1@srs-se1.protection.inumbo.net>)
 id 1uec4g-0006R8-R3
 for xen-devel@lists.xenproject.org; Wed, 23 Jul 2025 16:12:10 +0000
Received: from DB3PR0202CU003.outbound.protection.outlook.com
 (mail-northeuropeazlp170100001.outbound.protection.outlook.com
 [2a01:111:f403:c200::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c85d8277-67df-11f0-b895-0df219b8e170;
 Wed, 23 Jul 2025 18:12:08 +0200 (CEST)
Received: from GV2PR03MB9572.eurprd03.prod.outlook.com (2603:10a6:150:da::5)
 by PA4PR03MB7214.eurprd03.prod.outlook.com (2603:10a6:102:104::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8943.28; Wed, 23 Jul
 2025 16:12:05 +0000
Received: from GV2PR03MB9572.eurprd03.prod.outlook.com
 ([fe80::edd1:842f:9b14:509e]) by GV2PR03MB9572.eurprd03.prod.outlook.com
 ([fe80::edd1:842f:9b14:509e%3]) with mapi id 15.20.8943.029; Wed, 23 Jul 2025
 16:12:05 +0000
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
X-Inumbo-ID: c85d8277-67df-11f0-b895-0df219b8e170
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Qpu8dddIoxGdKJNa/rIh7qX9y/PGlyPINaLpnLCFwgg2uahgL/tU+eGvtk7cXoD1dmQ5fEE5FWO8kYAgXvi+uLH259CjAC4BurWn9nQ1wlGXedLPfZbgNMjawYYP78o4494Lir2Fznudc+iYmJTLjiFXC9f1LLAFxl5TMQbj9j1ModLtXkVWknLea1089IRoYbR4WmA5QUYfoMhv9zNfSEL8A3hYQ+puk9Zs0TgGcxTK0DtSSWTZMKccFcq4BxY+hBLIDYy8yLi7GiiSrHpuhzb3GgLAPu9+pU0Clrqgef7K6qDr84S/EfISzqSJWnb5GP+vfHAStqTMR2VfWF14+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MLh1dGGLYLcLhk1sRAUQlbdvOEev5FKCjLUCZJatP/s=;
 b=nKPPZIN/gQMO443aKzAvHvf865GsXfpBACBhTXorZ1JNdwOV4iGpGbocnxcl61miHGgzdYMpNCZb2ONBSsd+3AsUX1LeAPnqRcOys9sDI6WP6sFfVjvPREMyxxmYzfD2vBuW7lPO+phMbi+rdfQRX9ix8IRj0ssj14GZfx5tM0Ov+D6QvmXKSS0F+Nz46sm33UfIKnmN1gg9PZ+k+GMX2W9Z9R499wI5hN/nz0Twrq8mgsOvMLj0frg5E/qR5owzV5wsszNlDGrRd+c3p1LNxoxW8LndFmSyKohi24icqHEAeh9ZPu3qdDQOE0WOhJbmftd6GDrcsvUKbsUlvBL0bg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MLh1dGGLYLcLhk1sRAUQlbdvOEev5FKCjLUCZJatP/s=;
 b=KA+E3z01IXQBtl3SD8n942UEpXWEiRV+vSAbQGlvnfvN8tQC1IfTIA1lfpw+K/m4bSZVxiV8YcETos7V6/AOnyKQ9Ftx2OmZbLxXuijCRxPO+N3xwW00ZpNsS4QbUaVFm0Zc1LNrpcKW4CsXNM0IclL0J/jhVIVvMkKa5iFL/f0glLyz4X/IXRE0I4CwVx3Efxts5sITseqUUBedBTLsdnCffuLXkbhGHw6+yZ3CpRr6hxGQJ5BZ2Zde/SHUPcEGaktPDaOdC5OuYcDfM5cwPkouKQXfRxWVSWGKVyj4jDw/muDzuXf9HuCNpNX4yR7LeGhgZCtDUPJbTOvNZNMNyQ==
From: Dmytro Prokopchuk1 <dmytro_prokopchuk1@epam.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Nicola
 Vetrini <nicola.vetrini@bugseng.com>, Doug Goldstein <cardoe@cardoe.com>,
	Stefano Stabellini <sstabellini@kernel.org>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
	=?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>
Subject: Re: [PATCH] misra: add deviations of MISRA C Rule 5.5
Thread-Topic: [PATCH] misra: add deviations of MISRA C Rule 5.5
Thread-Index: AQHb9nyfKWuy2uMkq0ebdJsomrMUprQ8ZyYAgAACDQCAA4LiAA==
Date: Wed, 23 Jul 2025 16:12:04 +0000
Message-ID: <726672c2-1846-41e8-a5ce-5cbce8d1fb73@epam.com>
References:
 <7e1c381d6fab6d38bb2a5484d5fac5e863ba135f.1752689112.git.dmytro_prokopchuk1@epam.com>
 <69b7ea65-c69a-4184-b4d1-0664282ab849@epam.com>
 <a5d97ba5-9450-455d-972e-181e179f7ca0@suse.com>
In-Reply-To: <a5d97ba5-9450-455d-972e-181e179f7ca0@suse.com>
Accept-Language: en-US, uk-UA, ru-RU
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: GV2PR03MB9572:EE_|PA4PR03MB7214:EE_
x-ms-office365-filtering-correlation-id: afc10609-190b-4983-f322-08ddca03aa73
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|42112799006|1800799024|366016|7416014|376014|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?VTJtZCt4UjZKM2MvZVNSSys3M0FiSVV5UjNzejQwMkxkUWJkVE9xWVdLdWtO?=
 =?utf-8?B?dHRLNW54ZU93OVdBZXJ4Zmt6OFhUckpMQ3VkbUxJS3BEN1FkSlhqaEFyaHlL?=
 =?utf-8?B?eXgzd0lhQ1Z6OERPUDNmOEJiZFBOcklQaGVITlNlb3lqTi9vUWpBaWd1SDlm?=
 =?utf-8?B?U0lNaXdxeXNQcUprV3A1SVJTTzkvd3BUVFJKdHNFWU5Hampiend4MW1XSHFL?=
 =?utf-8?B?M3p3b25pTkZFM0RhblhVWGJQM25IQXNlYmx4VVVwaUwvaWF1enpWNUsxMDN0?=
 =?utf-8?B?WE5ZR1VvYmtXazhJNTB5emFyYnlWNnhMRC9Qcm1EWVV2eEJRL29HRnNXUHRy?=
 =?utf-8?B?V3BqTENKRW1aQ3FJK0tSVnlmT25OdnFQU1JBZlFVSnZxa1hRN3QxcG5NdEcx?=
 =?utf-8?B?djdBOTJvK3FqQk9sQVE1b1o1bjh3VVBSMEI4YUxGV0xmV1dXU2k1ZElPbXJr?=
 =?utf-8?B?U3FtdFl4dEkxVVdvdG1VZXlxeFlTY2N5K3VFQlR5dFpveVZER25lc09laS9h?=
 =?utf-8?B?UzlPdEV2VkpoN05MaHRwdUc2ZWgzaWozUU5ISEhIbHMrV1hqMzhPNUk4YlI0?=
 =?utf-8?B?d0xyY01qUjREWkxqYmlLdFhaeEtDZ2N5Wk5zNTlLTzR3SXEya1U5OVgzM3Jr?=
 =?utf-8?B?bmtHOHdHKzNRek5EYXpXb1YxNE5BSVhNclQ4Zko3T2FWRzVSTzZNb0NHVHVP?=
 =?utf-8?B?WkE2MkQ0TUpxYnMyaU5DSHN3YUZCYVhrR0JFbkV6ZXZHRGx1S2JVeDM2OUhS?=
 =?utf-8?B?a0E4YjFWZkJLWTNxMXliNXFlclJ2bmlSZncyWlpYU2ZFTXVwNk1zUzB2TEZG?=
 =?utf-8?B?cmMyc0Faam9KKzVnblR4LzVnMGt5VXY3QzBNVy8vTU1wNWtTN1p0Y3NiNFJP?=
 =?utf-8?B?aDdQYVVtVGJPZStNdHBaZlNRUjR1ZGgxNGxVRWZpRnBMRHNBMnZmcEJ5MFls?=
 =?utf-8?B?cU9UTzJVUHd2MlgwS1dteXIrN3h0L2NBLzI4V3FERnpEMGJEVkI4LzYrVGVD?=
 =?utf-8?B?WmUwOXFvV1JUSGVySE1TWkhqT3dwd3JZM1JhMGFCV2wvdG42YWF4ZnBzQ2Zu?=
 =?utf-8?B?NDNONnRKeVpIdkRWWFlndloybFIzY0s1VVR3c3FyQVJKZE15TVVPaXg4Zncr?=
 =?utf-8?B?emFTbVBaMnVRQkY3UXhoV1NaK0pkalE0ZEN3OTlPT1Y4L1ZkZ1dlbEVkYTh0?=
 =?utf-8?B?S2F6bStHTWkyd3lUYW9CZFh5UTVYcThScW0wbG1nQXMwMDhreGdIZEhnZHAw?=
 =?utf-8?B?WFFrTFlZaHNjcG0vS1g5NGR6MmFDSktWcWRBTytOQzQxNFV6cmI4MFZFNXNy?=
 =?utf-8?B?KzVXL200UnFRRHFRdE1RVHhuT0FsN2h6dWZ3b3lzdjJmcjg5MmhrQ1c5U0dL?=
 =?utf-8?B?dHZlN2ZSU1QxOFovc1ltSVpTREpvcHNtM2JicXI0U2ZsTjA3SjljWjhMeXM4?=
 =?utf-8?B?RFM3MHpsbEpZcmhHbDFaeTdPL1NwRWFvbTlTT1h3QksxdWVaSXNhNDBUKzdM?=
 =?utf-8?B?ZmFoSGFrWFhTT0VMYnArNmdrTWZ4R1RMNDMyckJEWlJGZG0wQ3BKZUxSLzB0?=
 =?utf-8?B?RlBUVlR2NWlGbk50SVByYnl5YTFGdTZwaFRFcVZUVCsvVTVpUlVuMVpYakU4?=
 =?utf-8?B?aU1yOGRSeFJTT09NZkVkSjFtcFhZQ28xYXdkVDZUMExYT2lRU3hSQjJJbGd4?=
 =?utf-8?B?MjM4YjZSYnFlb1RodVNuZElEMTMvTkhUNzZGcVpoaWEwRnJjcUE3Y2NjRnJR?=
 =?utf-8?B?ekI4VWJjZlZEa0VwSGJXcGF4eUZuRUdKT2NGYTRoajhkL0djNEJHdnpVSVdz?=
 =?utf-8?B?UUhhdXFxdDRoblNsS2VFV2s2MFozN09zZFNNZUh5L0dFYXdpNXlQQkJNNkNz?=
 =?utf-8?B?eWlPV0Z0eGExSktwS1R1TVdJa00yR0dFN0dzZ3BNc2xraWNlL3hlR0RESmlM?=
 =?utf-8?Q?JKiDgTITVDI=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR03MB9572.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(42112799006)(1800799024)(366016)(7416014)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?bUhuaEhscUlvQUdpVnlwY2VFUFJzamtkV2ZqZE1ZZkp2RWpqQ3BoOG9KS3Vx?=
 =?utf-8?B?QnoxMllyQmxPem5GTkVvWmwvNzNQTytzQU0raVRBdm5zU0pRY2s2ZEdyUXNQ?=
 =?utf-8?B?RVJ4UjNNbkdGeGtENDVxdVZheVBaKzlUOU1RTmhUbUlJM3Jmc0pMelI3TWEv?=
 =?utf-8?B?TG9ZaW5JNG5sbEtUeXRHQVBQaVhOUk5OOFJndHk1NG9ETFR6ajV0WXpZanBo?=
 =?utf-8?B?MjJlWUxpWkh1WXhZUDRHMFk4d0VycWN2Y0Qza1VBRjcwUlBINnJjR2dNWnJI?=
 =?utf-8?B?TlBiZjFWM09hQ1dTbkJndnBBTU5xeGZhRElXZUl0ZFFkOTNrQUw4MzZiZ2lQ?=
 =?utf-8?B?TDAwUnZhN1ZCd0xmelg5Nm1ad0RGejNCZ3NWSXg4bDlWczRPY2JCclRzUEVz?=
 =?utf-8?B?WlRuT2FpNFMwdnlGQXd5dStSeWJmRkZCY3NVSENBNXIwRXBRV1JHd2dxQTV2?=
 =?utf-8?B?TkNjUjUzZWZwWjJHOWEyR2p0dzRKSWF0elFkZmxQdElsbUp2bWN3T2R5VVNu?=
 =?utf-8?B?S3llTy9UK21NR3J2OHhZSzVzV0RKai94STAyTnRwSStheDJEbEVoNkIwNDRj?=
 =?utf-8?B?ZDE5d2FuRmRRanBPdWh3M2pBUGwrM005NDRiMVIzYlFOb2tHajl5K1Y0NVBu?=
 =?utf-8?B?Y0xzZ0JSOG0vUkwwMkpSR0NZdTVBNDI2cW1kTWxiYmNtMGFHcEh3QWdyMkJY?=
 =?utf-8?B?VDlDaTB0S1VMa1k3WmxNN3RtSlYvVnl0Q2N1VEMyQWg2UEt5ZEhaeXRtUEZU?=
 =?utf-8?B?bzdwZHdvOENRVDFpdDhiZnFKZlU4S3Z2bm95cjlGV3RhTVp1V2NpUnJJUnRU?=
 =?utf-8?B?NktVZFgxRlZtb21tSjdCc2R6STVoUEhVNUhITkxwbEpXUEJXYWM5ZWU1dnU0?=
 =?utf-8?B?VWhJUEp4ckUyMnAxN1lNNjlHOUpNcERGekgxWmJTS1dvWkFnWm1KcG05Nnla?=
 =?utf-8?B?Q2N4N05JdnZ2VjU0S2JRRVhJWjhFd0c4QjdUUkxVd0ZPeVdJWmZHTFFBTWxn?=
 =?utf-8?B?VlVSa21lREl0azB5MW9ZdGJ2aUlvZm9tTU8zV0lGRDFaemYyM1VpbjBQeU0r?=
 =?utf-8?B?Q1czOFg3NlZkUlJyQTB0ODQ3OG00M3BjS2pJa2ZlSGVVZXk0cXozcVp3NWZC?=
 =?utf-8?B?c2YvdHloU05IVVhzOTd1VmlxQlBJcW5GV0RsUlkzUy9WVm1jckR3SnlhTjlF?=
 =?utf-8?B?QUR3WlZpRXE1aVQvUVpJQnV1Si9MdC8ybUJXR0hRa3IxUGFvdU4yU2pINitx?=
 =?utf-8?B?T0VjdGN6cTMwQk9BdXJkRkRyVUJjaFFJMDFXWkU2YndHRVVlS0VtQUlkUmVt?=
 =?utf-8?B?SXlVQnUvRjBIQjhidEpwWFVBU0F3NzBEMmtpUExBZWJtWTVpK0wvRHdPZkdB?=
 =?utf-8?B?c1RQb1hkakRzcld0UnRNa2I0OFlaNTRUa3l1YmJ3Um5pV2pTeGIwekMwL2Ez?=
 =?utf-8?B?bWV5T1BBWURkVERyVEhLYzl0S2lLSDQ5UXZvWEV0clJ4VFAreXhzbVJZejBu?=
 =?utf-8?B?WDFKZ1c1R0UxUEpYQWY4TEd1SnQrcXFuU2ZxMGFNbGNrM1BPaGppVU5oUWdu?=
 =?utf-8?B?d1lmZ2xhVzArQ3VzNUl5NThrajJMbVEwc0lFZG5SS2JObUNGUXBiM0NRQnhj?=
 =?utf-8?B?WEo1OUxQZ3hMZHpKdlpSeFB2T2M4WmEvbEZwSWttSFFGOW81Nm04WlhVeWF6?=
 =?utf-8?B?d1ZVL0VvbzZsREJGVm1RY3Q2eUl3dlh1bnEzTlpuT3hBaFVhL2s4ayswWFVo?=
 =?utf-8?B?ZnZ5bDhJb25tcVVNT0JxMDFyT2doczRYaGVOazJXZ3dTUzlQdTRubEk5b3By?=
 =?utf-8?B?dVNOV1RDTHJ0NXpKaHZ3TUhnL2F3L09OZnBsbUJYM29hZG01K0dzYUNqVEpU?=
 =?utf-8?B?OHpRejFkakdrcTdLWmVTSm44ZzFiU2VVZGhUTExPdEhja3Y1cjdyWVFGMWV0?=
 =?utf-8?B?cEZhUzFPUllTSU9kLzJlb3BOOFBOVk1YamxUK0FDTll0eStsRjNvRnZOVW9t?=
 =?utf-8?B?cGw0SmlGemxZdWFYRFBOcVErR1lzU2pvMGxoWmQrV0xBblZaU0VJYjJoU3dH?=
 =?utf-8?B?Z0lNTXZ4WDYxb2QwSW5IZ2xJQWl3ZitUMjFpbDJtRHp4WmZpdkFxZGpEYlYw?=
 =?utf-8?B?VkIrNVI2WmtDa3hzd0Q0NWVHQVBnTlhkRmVFd2c1Q29hV2lheFQvTkQyK1lk?=
 =?utf-8?B?ZkE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <5C6BDF47834F1A4EAD81156109E2746E@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: GV2PR03MB9572.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: afc10609-190b-4983-f322-08ddca03aa73
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Jul 2025 16:12:04.9724
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: vArBqLa05aTGnVKPDSLy6O89kHaRqbMezvnPPgCvOg9XXBF3JKlld92Qz6bD+bYZkET2k7R3dJB7HpfEGz5u433ZaScPi2tVWnYZQEVp1iw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR03MB7214

DQoNCk9uIDcvMjEvMjUgMTM6MzQsIEphbiBCZXVsaWNoIHdyb3RlOg0KPiBPbiAyMS4wNy4yMDI1
IDEyOjI3LCBEbXl0cm8gUHJva29wY2h1azEgd3JvdGU6DQo+PiBPbiA3LzE2LzI1IDIxOjA4LCBE
bXl0cm8gUHJva29wY2h1ayB3cm90ZToNCj4+PiBNSVNSQSBDIFJ1bGUgNS41IHN0YXRlcyB0aGF0
OiAiSWRlbnRpZmllcnMgc2hhbGwNCj4+PiBiZSBkaXN0aW5jdCBmcm9tIG1hY3JvIG5hbWVzIi4N
Cj4+Pg0KPj4+IFVwZGF0ZSBFQ0xBSVIgY29uZmlndXJhdGlvbiB0byBkZXZpYXRlOg0KPj4+IC0g
Y2xhc2hlcyBpbiAneGVuL2luY2x1ZGUveGVuL2JpdG9wcy5oJzsNCj4+PiAtIGNsYXNoZXMgaW4g
J3hlbi9pbmNsdWRlL3hlbi9pcnEuaCc7DQo+Pj4gLSBjbGFzaGVzIGluICd4ZW4vY29tbW9uL2dy
YW50X3RhYmxlLmMnLg0KPj4+DQo+Pj4gU2lnbmVkLW9mZi1ieTogRG15dHJvIFByb2tvcGNodWsg
PGRteXRyb19wcm9rb3BjaHVrMUBlcGFtLmNvbT4NCj4+PiAtLS0NCj4+PiBUaGlzIHBhdGNoIG1h
a2VzIE1JU1JBIFJ1bGUgNS41ICJjbGVhbiIgZm9yIEFSTSBvbmx5Lg0KPj4+DQo+Pj4gV2FzIGFn
cmVlZCB0byBuYXJyb3cgZGV2aWF0aW9uOg0KPj4+IGh0dHBzOi8vcGF0Y2hldy5vcmcvWGVuL2Nv
dmVyLjE3NTIwOTYyNjMuZ2l0LmRteXRyby5fNUZwcm9rb3BjaHVrMUBlcGFtLmNvbS9lNDdkMDhl
NDQ2NWY5MTNmMDMzNDg4MzA5NTRlODAwZjQyMGM2NTJkLjE3NTIwOTYyNjMuZ2l0LmRteXRyby5f
NUZwcm9rb3BjaHVrMUBlcGFtLmNvbS8NCj4+Pg0KPj4+IENJOg0KPj4+IGh0dHBzOi8vZWNsYWly
LWFuYWx5c2lzLWxvZ3MueGVucHJvamVjdC5vcmcvZnMvdmFyL2xvY2FsL2VjbGFpci94ZW4tcHJv
amVjdC5lY2RmL3hlbi1wcm9qZWN0L3Blb3BsZS9kaW1hcHJrcDRrL3hlbi9FQ0xBSVJfbm9ybWFs
L3J1bGVfNS41X2RldmlhdGlvbl9maW5hbC9BUk02NC8xMDcwNjQ1NzU5NS9QUk9KRUNULmVjZDsv
Ynlfc2VydmljZS5odG1sI3NlcnZpY2Uma2luZA0KPj4+IC0tLQ0KPj4+ICAgIGF1dG9tYXRpb24v
ZWNsYWlyX2FuYWx5c2lzL0VDTEFJUi9kZXZpYXRpb25zLmVjbCB8IDcgKysrKysrKw0KPj4+ICAg
IGRvY3MvbWlzcmEvZGV2aWF0aW9ucy5yc3QgICAgICAgICAgICAgICAgICAgICAgICB8IDcgKysr
KysrKw0KPj4+ICAgIDIgZmlsZXMgY2hhbmdlZCwgMTQgaW5zZXJ0aW9ucygrKQ0KPj4+DQo+Pj4g
ZGlmZiAtLWdpdCBhL2F1dG9tYXRpb24vZWNsYWlyX2FuYWx5c2lzL0VDTEFJUi9kZXZpYXRpb25z
LmVjbCBiL2F1dG9tYXRpb24vZWNsYWlyX2FuYWx5c2lzL0VDTEFJUi9kZXZpYXRpb25zLmVjbA0K
Pj4+IGluZGV4IDg1MDRlODUwYzEuLjM4OTUxNDg0NjAgMTAwNjQ0DQo+Pj4gLS0tIGEvYXV0b21h
dGlvbi9lY2xhaXJfYW5hbHlzaXMvRUNMQUlSL2RldmlhdGlvbnMuZWNsDQo+Pj4gKysrIGIvYXV0
b21hdGlvbi9lY2xhaXJfYW5hbHlzaXMvRUNMQUlSL2RldmlhdGlvbnMuZWNsDQo+Pj4gQEAgLTEx
Nyw2ICsxMTcsMTMgQEAgaXQgZGVmaW5lcyB3b3VsZCAoaW4gdGhlIGNvbW1vbiBjYXNlKSBiZSBh
bHJlYWR5IGRlZmluZWQuIFBlZXIgcmV2aWV3ZWQgYnkgdGhlIGMNCj4+PiAgICAtY29uZmlnPU1D
M0EyLlI1LjUscmVwb3J0cys9e2RlbGliZXJhdGUsICJhbnlfYXJlYShkZWNsKGtpbmQoZnVuY3Rp
b24pKXx8YW55X2xvYyhtYWNybyhuYW1lKG1lbWNweXx8bWVtc2V0fHxtZW1tb3ZlKSkpKSYmYW55
X2FyZWEoYW55X2xvYyhmaWxlKF54ZW4vY29tbW9uL2xpYmVsZi9saWJlbGYtcHJpdmF0ZVxcLmgk
KSkpIn0NCj4+PiAgICAtZG9jX2VuZA0KPj4+DQo+Pj4gKy1kb2NfYmVnaW49IkNsYXNoZXMgYmV0
d2VlbiBmdW5jdGlvbiBuYW1lcyBhbmQgbWFjcm9zIGFyZSBkZWxpYmVyYXRlIGFuZCBuZWVkZWQg
dG8gaGF2ZSBhIGZ1bmN0aW9uLWxpa2UgbWFjcm8gdGhhdCBhY3RzIGFzIGEgd3JhcHBlciBmb3Ig
dGhlIGZ1bmN0aW9uIHRvIGJlIGNhbGxlZC4NCj4+PiArQmVmb3JlIGNhbGxpbmcgdGhlIGZ1bmN0
aW9uLCB0aGUgbWFjcm8gYWRkcyBhZGRpdGlvbmFsIGNoZWNrcyBvciBhZGp1c3RzIHRoZSBudW1i
ZXIgb2YgcGFyYW1ldGVycyBkZXBlbmRpbmcgb24gdGhlIGNvbmZpZ3VyYXRpb24uIg0KPj4+ICst
Y29uZmlnPU1DM0EyLlI1LjUscmVwb3J0cys9e2RlbGliZXJhdGUsICJhbnlfYXJlYShhbGxfbG9j
KGZpbGUoXnhlbi9pbmNsdWRlL3hlbi9iaXRvcHNcXC5oJCkpICYmIG1hY3JvKG5hbWUoX190ZXN0
X2FuZF9zZXRfYml0fHxfX3Rlc3RfYW5kX2NsZWFyX2JpdHx8X190ZXN0X2FuZF9jaGFuZ2VfYml0
fHx0ZXN0X2JpdCkpKSJ9DQo+Pj4gKy1jb25maWc9TUMzQTIuUjUuNSxyZXBvcnRzKz17ZGVsaWJl
cmF0ZSwgImFueV9hcmVhKGFsbF9sb2MoZmlsZSheeGVuL2NvbW1vbi9ncmFudF90YWJsZVxcLmMk
KSkmJm1hY3JvKG5hbWUodXBkYXRlX2dudHRhYl9wYXJ8fHBhcnNlX2dudHRhYl9saW1pdCkpKSJ9
DQo+Pj4gKy1jb25maWc9TUMzQTIuUjUuNSxyZXBvcnRzKz17ZGVsaWJlcmF0ZSwgImFueV9hcmVh
KGFsbF9sb2MoZmlsZSheeGVuL2luY2x1ZGUveGVuL2lycVxcLmgkKSkmJm1hY3JvKG5hbWUocGly
cV9jbGVhbnVwX2NoZWNrKSkpIn0NCj4+PiArLWRvY19lbmQNCj4+PiArDQo+Pj4gICAgLWRvY19i
ZWdpbj0iVGhlIHR5cGUgXCJyZXRfdFwiIGlzIGRlbGliZXJhdGVseSBkZWZpbmVkIG11bHRpcGxl
IHRpbWVzLA0KPj4+ICAgIGRlcGVuZGluZyBvbiB0aGUgZ3Vlc3QuIg0KPj4+ICAgIC1jb25maWc9
TUMzQTIuUjUuNixyZXBvcnRzKz17ZGVsaWJlcmF0ZSwiYW55X2FyZWEoYW55X2xvYyh0ZXh0KF4u
KnJldF90LiokKSkpIn0NCj4+PiBkaWZmIC0tZ2l0IGEvZG9jcy9taXNyYS9kZXZpYXRpb25zLnJz
dCBiL2RvY3MvbWlzcmEvZGV2aWF0aW9ucy5yc3QNCj4+PiBpbmRleCA2MjBlOTdmMGJkLi44NGJj
OTMzY2JmIDEwMDY0NA0KPj4+IC0tLSBhL2RvY3MvbWlzcmEvZGV2aWF0aW9ucy5yc3QNCj4+PiAr
KysgYi9kb2NzL21pc3JhL2RldmlhdGlvbnMucnN0DQo+Pj4gQEAgLTE0Miw2ICsxNDIsMTMgQEAg
RGV2aWF0aW9ucyByZWxhdGVkIHRvIE1JU1JBIEM6MjAxMiBSdWxlczoNCj4+PiAgICAgICAgICAg
bWVtbW92ZS4NCj4+PiAgICAgICAgIC0gVGFnZ2VkIGFzIGBkZWxpYmVyYXRlYCBmb3IgRUNMQUlS
Lg0KPj4+DQo+Pj4gKyAgICogLSBSNS41DQo+Pj4gKyAgICAgLSBDbGFzaGVzIGJldHdlZW4gZnVu
Y3Rpb24gbmFtZXMgYW5kIG1hY3JvcyBhcmUgZGVsaWJlcmF0ZSBhbmQgbmVlZGVkDQo+Pj4gKyAg
ICAgICB0byBoYXZlIGEgZnVuY3Rpb24tbGlrZSBtYWNybyB0aGF0IGFjdHMgYXMgYSB3cmFwcGVy
IGZvciB0aGUgZnVuY3Rpb24gdG8gYmUNCj4+PiArICAgICAgIGNhbGxlZC4gQmVmb3JlIGNhbGxp
bmcgdGhlIGZ1bmN0aW9uLCB0aGUgbWFjcm8gYWRkcyBhZGRpdGlvbmFsIGNoZWNrcyBvcg0KPj4+
ICsgICAgICAgYWRqdXN0cyB0aGUgbnVtYmVyIG9mIHBhcmFtZXRlcnMgZGVwZW5kaW5nIG9uIHRo
ZSBjb25maWd1cmF0aW9uLg0KPj4+ICsgICAgIC0gVGFnZ2VkIGFzIGBkZWxpYmVyYXRlYCBmb3Ig
RUNMQUlSLg0KPj4+ICsNCj4+PiAgICAgICAqIC0gUjUuNg0KPj4+ICAgICAgICAgLSBUaGUgdHlw
ZSByZXRfdCBpcyBkZWxpYmVyYXRlbHkgZGVmaW5lZCBtdWx0aXBsZSB0aW1lcyBkZXBlbmRpbmcg
b24gdGhlDQo+Pj4gICAgICAgICAgIHR5cGUgb2YgZ3Vlc3QgdG8gc2VydmljZS4NCj4+DQo+PiBD
b3VsZCB5b3UgcmV2aWV3IHRoaXMgcGF0Y2g/DQo+DQo+IEkgZG9uJ3QgdW5kZXJzdGFuZC4gSSdt
IG5vdCBmZWVsaW5nIGNhcGFibGUgb2YgKGZ1bGx5KSByZXZpZXdpbmcgY2hhbmdlcyB0bw0KPiBh
dXRvbWF0aW9uL2VjbGFpcl9hbmFseXNpcy9FQ0xBSVIvZGV2aWF0aW9ucy5lY2wuIE5vciBhbSBJ
IHRoZSBvbmx5IG1haW50YWluZXINCj4gb2YgdGhhdCBmaWxlLiBBbmQgdGhlIHRleHQgYmVpbmcg
YWRkZWQgdG8gZG9jcy9taXNyYS9kZXZpYXRpb25zLnJzdCBpcyB0b28NCj4gdW5zcGVjaWZpYyBm
b3IgbXkgdGFzdGUsIHlldCBJIHRob3VnaHQgSSdkIGJldHRlciBub3QgcmVwZWF0IHRoYXQgc2Ft
ZSBjb25jZXJuDQo+IG92ZXIgYW5kIG92ZXIgYWdhaW4uIElmIG90aGVycyBmZWVsIGxpa2UgYWNr
LWluZyBpbiB0aGlzIHNoYXBlLCBzbyBiZSBpdC4NCj4NCj4gSmFuDQoNCkhlbGxvIGFsbCENCg0K
U2luY2UgdGhlcmUgaGF2ZSBiZWVuIG5vIG5ldyBjb21tZW50cyBzbyBmYXIsIEkgd291bGQgbGlr
ZSB0byBwcm9wb3NlIGENCnN0cmFpZ2h0Zm9yd2FyZCBzb2x1dGlvbjogcmVuYW1lIHRoZSBtYWNy
b3MgKHRoYXQgdmlvbGF0ZSBSdWxlIDUuNSkNCnVzaW5nIGNhcGl0YWwgbGV0dGVycyAodXNpbmcg
YmVzdCBwcmFjdGljZXMgZm9yIG5hbWluZyBtYWNyb3MgaW4gQykuDQpJIGNhbiBwcmVwYXJlIHN1
Y2ggYSBwYXRjaC4NCg0KVGhlIG1haW4gcXVlc3Rpb24gaXM6ICJJcyBpdCBwb3NzaWJsZSB0byB1
cHN0cmVhbSBzdWNoIGNoYW5nZXM/Ig0KT3IgaXMgdGhpcyBpZGVhIG5vdCB3b3J0aHdoaWxlPw0K
DQpEbXl0cm8uDQo=

