Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F088ABACA84
	for <lists+xen-devel@lfdr.de>; Tue, 30 Sep 2025 13:15:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1134203.1472187 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v3YJZ-0004kK-TU; Tue, 30 Sep 2025 11:14:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1134203.1472187; Tue, 30 Sep 2025 11:14:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v3YJZ-0004hS-QN; Tue, 30 Sep 2025 11:14:37 +0000
Received: by outflank-mailman (input) for mailman id 1134203;
 Tue, 30 Sep 2025 11:14:36 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=7Niv=4J=epam.com=Oleksandr_Tyshchenko@srs-se1.protection.inumbo.net>)
 id 1v3YJY-0004hK-8Q
 for xen-devel@lists.xenproject.org; Tue, 30 Sep 2025 11:14:36 +0000
Received: from PA4PR04CU001.outbound.protection.outlook.com
 (mail-francecentralazlp170130007.outbound.protection.outlook.com
 [2a01:111:f403:c20a::7])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a4af18b1-9dee-11f0-9809-7dc792cee155;
 Tue, 30 Sep 2025 13:14:34 +0200 (CEST)
Received: from AM9PR03MB7025.eurprd03.prod.outlook.com (2603:10a6:20b:2d7::20)
 by DU5PR03MB10443.eurprd03.prod.outlook.com (2603:10a6:10:529::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.17; Tue, 30 Sep
 2025 11:14:31 +0000
Received: from AM9PR03MB7025.eurprd03.prod.outlook.com
 ([fe80::bdd:3097:e48c:6c4b]) by AM9PR03MB7025.eurprd03.prod.outlook.com
 ([fe80::bdd:3097:e48c:6c4b%5]) with mapi id 15.20.9160.015; Tue, 30 Sep 2025
 11:14:31 +0000
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
X-Inumbo-ID: a4af18b1-9dee-11f0-9809-7dc792cee155
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=a2Rh4jyAixlqgiWxkuzDU0bOzYW9504fPVi6HZZZ3eXPQilskEVfxZHG55F3V0t3XQP+wvQZR8KOl7/pGe0DJ+5CHi/V4J6eSp/R5mrufYfcHNW1cdpMWkDXAnp82B9505p+g1ctvBXwBnJuUjXt23Z43gEnoCv75lMabqGdwUF/Hqv9UJSc/ZaaUj16iOnRAft75/MbXfEiwgBbmOyHPkRn35eDAza+EUp9IdgiDxDr6udN8MLSJjvLlEJF6iDQA2HRHzg2NdmVd+uYZrr144fyEUCmVLUnKxPDqzpDxQQq5AmqrN1rRdicvImO/b8QwpoJjf0aKKiW8rcDd32wTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=65wjWuXOlos3TOjUeQMwqMqa73uDqsM0o+Naw9dYmjA=;
 b=lv4CdCCbqm/0fqoZDl6xMrqm2W7HBNp22CDUwEEpobby2KjZyeBrtyZUu1mhYu6jHBm8aqbYARjq8t4hLKRu+zwapPuNtJ6gLRw/2zhK7QSJzboHIbrJ9NDFv0/oUv6MSdbHnK/QuvHfbqsPxOHoR375+R1MmmUwuctVJc3NsuKzRtfHZQ+k2j5RNzoPfFD+bZckktQS4vRPg8yYLaJvPJFjRWpRcTkTIyvH1l+XNLllNDNw5muWKt+N5347IBxAL/H5KbnWLS4NepfnbaQmxypTI9PSsLFmOogtlPfnCwD7M8O9CM2vc039q3c+6x/Y7z9DT1nzeWMxqYKRYyCk5Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=65wjWuXOlos3TOjUeQMwqMqa73uDqsM0o+Naw9dYmjA=;
 b=hK4Vvin6ZpmBtmrDc3ZjidgEoeCiwYLkAqRvBUw0Ysp4ygf44qCdqCnBP6pH/Tt0c9VdUypseyDL4EJLXflkK7R9otrFj5ISs649z70WLy/IEHBxPG/5jDl31oYbD6wt5rUqsv5zORP4dhObHJygjFUsj6ualxAP7ggb9fNc7LgwNIwmpbBhJkGVlZT1nqzy6iUh7IXsxzzx7I2gQ1wcQ1i7RMKPu4OHdJQGDfHgE23v/yo2altSm6fua893fyZuQjbkS0pCplONfMZk42CM+eXOeIq1OWCRz0+QQW7b5170/odNcNnoM1mOwxFzIkSJYr5bIUDEeI4R6OgfUHTC1Q==
From: Oleksandr Tyshchenko <Oleksandr_Tyshchenko@epam.com>
To: Stefano Stabellini <sstabellini@kernel.org>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Michal
 Orzel <michal.orzel@amd.com>, Ayan Kumar Halder <ayankuma@amd.com>, Stefano
 Stabellini <stefano.stabellini@amd.com>
Subject: Re: [ImageBuilder] uboot-script-gen: Add ability to configure static
 event channels
Thread-Topic: [ImageBuilder] uboot-script-gen: Add ability to configure static
 event channels
Thread-Index: AQHcMWv1PEvr31auREGXSWhX8dEo67SqknQAgAEBdwA=
Date: Tue, 30 Sep 2025 11:14:30 +0000
Message-ID: <562778be-c915-4122-a0b4-5c99c0ff726c@epam.com>
References: <20250929180746.1881872-1-oleksandr_tyshchenko@epam.com>
 <alpine.DEB.2.22.394.2509291238340.937823@ubuntu-linux-20-04-desktop>
In-Reply-To:
 <alpine.DEB.2.22.394.2509291238340.937823@ubuntu-linux-20-04-desktop>
Accept-Language: en-US, ru-RU
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AM9PR03MB7025:EE_|DU5PR03MB10443:EE_
x-ms-office365-filtering-correlation-id: 54bb312a-9767-49de-3f25-08de00128739
x-ld-processed: b41b72d0-4e9f-4c26-8a69-f949f367c91d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|42112799006|376014|1800799024|366016|38070700021;
x-microsoft-antispam-message-info:
 =?utf-8?B?aEJOVmhRbTdQTk9UcUUzNDNOSU1iOHRSMG1renMxbEkxQlJSbzduaWVaYmZL?=
 =?utf-8?B?Nlkzd1ltbjZ2cUVhVU11NllFZng1U2RxZm1Qa1owMHVncWxFQ1pwZ1VtMng1?=
 =?utf-8?B?ZjAvN09NYWM0NjhTa2hodzhqdFdIZmc5TE1Ya0Jna2JaYUN5dk9LK3ZLQ1RZ?=
 =?utf-8?B?V2xneHZabzF4bVdVZzJZbSs4R2hwK1dCaTMrdlpvZlRKWUxFUkx4aXArUVV5?=
 =?utf-8?B?M3JaTmMxblZvU1IveVpiTXRORkFRb1d5QkcrSm9vYlJiMXNVQkh2MTZTZ0Rq?=
 =?utf-8?B?N0RkOUFuRVlTdVhnaDhkZ3pBWlRRWGUwRFhoZFpJbGV1Z05OZ1JUd2taTTNL?=
 =?utf-8?B?Mk4zdXlkRnMzUEF4K2YyNVE2Y3F6Ly84SXR2T2plK29jNy9lT0JxaFNmd2Ra?=
 =?utf-8?B?RUZYdUN1alAwYW94cXc1cENWbmhoUTUyUFkwa0xWR1FpVkhaZTNIY1UvRi9E?=
 =?utf-8?B?UGYrY3IzR0J2WmZIV2o4QWZpN1lBNGp1ZGlSUmZqMXBKRldrOTFLcFlzaGMr?=
 =?utf-8?B?MFhPc01uY2NkQzdFTkM1TzFlVk45a3hEcjFDMHJaQjhVL29mbG8yQVRIRHNX?=
 =?utf-8?B?UE5xZlFjODd1bmUvRnozVmJGN041Uzc3YUFCVXMrVjRNOVpYVDZNakhZeEFG?=
 =?utf-8?B?Tm9FY1RhQUJRZzVCbzVNN3JTQkE4dCtYL1BZYWJqZFVwQUpZZEJCdDBYRSs0?=
 =?utf-8?B?dWxPZG9JZUJJWVM5SVVpODhyZmdDWXliKzdyanc0S0ZsOHlPUC91clptbXN1?=
 =?utf-8?B?eCs5a1gxZk81RzhKNWtaOGptNUhMUDVPbE54N3VtWDF6ZFlxNDBVNXRPdW1S?=
 =?utf-8?B?WWVmalZpUm0wUERzUEJJb2NjSDJwUWR2SXMvcmltNEw5TStMUXNZbEZXMnd4?=
 =?utf-8?B?WlpEVUVjV0NDNWw4TTYwbWEyMUwxRTRVNlhINWRsTjRsaldqWFAxN0QwTzVE?=
 =?utf-8?B?WVRNRDJFSExrdE4zNzVidTliMDZRWk8wTmNyWU41S3lSZzJsU1VMb1o5R25E?=
 =?utf-8?B?QzVxb0hDMzF6MytGaU9seW1Kd0RnWjNrV2drRFpicUlhbVpORjNZN3VOUU8v?=
 =?utf-8?B?N2xlSkRFb1dJR0ZMZm4vS1JCUHhtK3F3U21POVM4TU1PODZabU1yN3Y3eW1s?=
 =?utf-8?B?SFFDenJIYmpqR3Q2V0U4UktTbHRPSndXQnlYWklQM0RpeTB6MFUyT3FYdGlC?=
 =?utf-8?B?YjlwQnpCa1AwSDJQZHpSaXhqM25YRW5TdC9hVU4wL21lNDhDR2ZXWXVyYzhN?=
 =?utf-8?B?NkR3YlEyM2M2ejVsSlg1ZjJ3dGJJeXFrbnlTOHo3Y1JEK0J4NnIxb0N0MDRD?=
 =?utf-8?B?WmowZVBCZy9Iby9IN3dZbldSL0I4anJUM09ZbWlSdlVUTHZJTENTR2FlZWFm?=
 =?utf-8?B?WXpOSlcwNUUyUWtsNUpEOXAzVHhDYTduS0FaS0ZNYnRwWXE2SndZTlRXcmVj?=
 =?utf-8?B?cDRacmc1bjVIZkoyRTI0SWVObEhCcHB4b0dZaWhubzcxb3FYQlRtTWViWlpp?=
 =?utf-8?B?bHZxeVo1UGFBM3J2T2piV0R2MEVsUGdjdW5lM2FrY2pZa3JwNXNOQW5aazF3?=
 =?utf-8?B?ZXMzS2o3NjdLT3UrdUQyRVc3TmlxV1I4V1JsMlVJbEJJcFR2WTZPQUZKY2FD?=
 =?utf-8?B?aFozZkpEYVpmbHI4RktKOU9lWFNMcis1bEk1VktSRUJBTE1IM2VURTJxTE8r?=
 =?utf-8?B?RUh0UmFTVkNiL2RrY0cxOTlTMWVpSW1kM05xSERhb2xZeWxpRk1GYTdITXRs?=
 =?utf-8?B?OERHNlBaZUp6aWYrMTJRSzE5M0FzN0Ewb2tTN0IyOGhHcDdGTEQ5NlRFcWZL?=
 =?utf-8?B?cWJGSUdkU3pzUElkcld3VndnT254ZHIzazJNYmJDcXJqQVNhd0ZXMkFCTS9E?=
 =?utf-8?B?ZTZTRkNzMTFjTFVzZU9QVklMcUtBRnRhYTA0MDFCNHRUVjlUM25BdVVYUTZP?=
 =?utf-8?B?Yngzdmt5S3dHSitpZmtMclNXVE9GcjcvSHYraG9sSXM5ZHpzaTVSU1NLY2F2?=
 =?utf-8?B?ejVLa244WWN5VUVRMHZXaTBWNDhnOFA5NDBuUkJVRGgxMVVodzJHQVg3UVc3?=
 =?utf-8?Q?YrYybL?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR03MB7025.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(42112799006)(376014)(1800799024)(366016)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?NFNMd2t1VnpScnVWQ09pTlFKeE9lNzVYYlJVRUdFcXcwUldNRFVmQ1piRjJ0?=
 =?utf-8?B?V2hSYlVBV0RRenQ5b1lnczVHM1RZVGE0Ynp5Ly9DNVM3Mm9VRWFmbnB3Wmlt?=
 =?utf-8?B?SWJpbmpJeHVIUE1PWkdQQ0RkMnFtMVFDMHVPN3E5NWVZWEswTHF2aHN4YnZR?=
 =?utf-8?B?cjVvanZtdEduZlppSzc0QVkwOVR5eTZxRHovNTBoOW0rTlE0aTlSTEdLVUJG?=
 =?utf-8?B?cFo0MkJjN1I0WlFIZ1d2N1hYYWl5ZFJOMWJCdHFMNmQrbjIyM0szbkJySndn?=
 =?utf-8?B?elI2a0c4eHhJS2xoVys3L3pCcTBpTkNHMGFkSjFUWFAyYnRHNmtpYjh4ODcy?=
 =?utf-8?B?NXorRGFwTkhNK2cvZWVsYWlPNUk3MFBmMjVmMCsxd3krYkNPWEpvRW9GK3Vs?=
 =?utf-8?B?K0VEeXluek52eUhQbDlLcGlyejB0TFo5c1lJbFpSdWNKbmVXc0hkNmw5S015?=
 =?utf-8?B?ZDFUK1BDa3RXdXZTZmpLQnB1OGhzSXRyWFZheGtqQ1hYRTZkeVE2d29oR2pE?=
 =?utf-8?B?NWZUOXp5b1NjRTl2L2hZWWcwVHBCZ1JrREJ3dXczM1JrRVhFUGFBSXF4anM0?=
 =?utf-8?B?QnoxWFJmWU14eVJIaXZxZkNGNTh1bFdQdVErdmdyNjlVN2R6YlZSVVpKRDRH?=
 =?utf-8?B?RVFhT0tDNktqZEkyYkxoeVJiZTB4YjRhUTFKUExmSUpiS0RIV21KaWxiL3dS?=
 =?utf-8?B?T0JVZmhYRC9IdXp5VmNHUFNlTzF5NUM1RXZ3YkxJaUFtSlZqT0FwMU00dHgy?=
 =?utf-8?B?M3p1UkN2M0JUaVRjOS82dTZSeHoyZVRYQjhTUS9EaXU4a0MzVzZJTVZTWUJ5?=
 =?utf-8?B?ViszdkJ4ZHlmdTlva09JTndsdzNnbGc2Sld2SmUzazFvWnliMTZhL283bDBa?=
 =?utf-8?B?SUxjMjRnQXp1TXdqZVR0elZjQ2RqZk9RbHRJRVZMVXVwV1hSckQxb01kNVow?=
 =?utf-8?B?SE5xak5DYWsyUFRCTEJQMldqS1dUbFNGZ2VsVWJoajRrODFwRlAzWGEwQVNa?=
 =?utf-8?B?c1krQWQwMUk3ei92WnZiZFFEaG9LbVRDb1VpQnpJU0ZhSjZiQ3VpTXFVbmNm?=
 =?utf-8?B?RzBpeGpYRFNXRDVmMEF0dXdIQzdWNHdnWlh3RUhYLzUwT01DZXQxQytaMWkr?=
 =?utf-8?B?VURqRkx2WEhPZURLU2NzVE5mL3YvTjJGRmhQRkNNVER2NjZJdkRnczFGQlRE?=
 =?utf-8?B?QUNkNUtKT2Q5YnAySCtiT3RGazV2SWk5NDNMZURMYTdaSUxxWG1CaGhRUlB6?=
 =?utf-8?B?Z1lhNHczb0dRNGZSZjRmR2xmdEhaN3NOZEF2R0JpczFDd3VDWWZ1MXlUWVp0?=
 =?utf-8?B?UWNoVzkwM29Da0FUR01ISGtIL1pRd3VSeEh5cStSeWhiTGFCazgrMHhXbVJP?=
 =?utf-8?B?cUZzVThRQzU3TDRkNDRFWXRXbE9mdHFzdVkzUjlvNGsrNENZRVhOaHQra1dP?=
 =?utf-8?B?WWRYUTNSb2dHTnFpKzEvMzJOZkZSTXVWL0MwQ1kzSHVGU2FFbG05clcyZkox?=
 =?utf-8?B?aDRRQWFGRnRBMnUyNUxXSU9KSUxhRExoQkY3U29rQVJ0aFVML2xPRU9TdWhp?=
 =?utf-8?B?STN3bzlxelFueEc1Qll4RTdXb05wR0p1S2s2bGUyZzZRZnBYVlNoRkVZWlJM?=
 =?utf-8?B?K0JCdVFIc1JnL3krdzNFMjZWUkdNbGxPa3RDZEFvbCtEM1ByKzdJUFNjYmox?=
 =?utf-8?B?bW1XUUtqZU93aDVpSGlWN1hjem9ZRTRITXp1cTF3QzExZUJ4dGlUdXJyaTRT?=
 =?utf-8?B?dm5tSXpkZTBPYkdVaGdMWmhPOFhmWWNnVHM5QlJoS1N6WWNDNnkzUUVST0px?=
 =?utf-8?B?Y1N0TlE0S2tQNFVlOUh6QWk3ZW5yUzBNU1pCT3ZKZ2tuTzBlSnVudFdHOVBK?=
 =?utf-8?B?TVZDRFdCaVVUWm9obEp3N3REYXdLY2paOU84QWRaeHpsTnBlWTdYQU1uT3B2?=
 =?utf-8?B?SURsclhFbnhtZ2FURUc3Sk9lakRMbmxKWjY2aUt3akdqVWQxR1BPdFVsaWwv?=
 =?utf-8?B?NlVLbk1YSkljZ0FmdGtwR21wZmI0OVlvSW9oRGRnN2tUZnVCZ05rbDZ5Mk9y?=
 =?utf-8?B?MGgxSXRmUldKWmd1VVFydWF6UVB6elByUHJ3ejdTbzFPWUVFdmY1OGlOMms2?=
 =?utf-8?B?Vmo3TjZWWFR5N3dZelhpU2YybWM1cW5uTXg1R2lKelBrMjVOMzYranlLT3N2?=
 =?utf-8?Q?6Q4YXkk9gvZ9bYe/vYh6jw4=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <48E21748DECE694B96D819D90F6751A1@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM9PR03MB7025.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 54bb312a-9767-49de-3f25-08de00128739
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Sep 2025 11:14:31.0284
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: uTXzH5m4NAWBcON5D/IPYR+FJaLjENVyeFA2FEz5YqhL+beFGMnNhwgUEOlXI5bnn/y3kfM5FHp1n0EoiOaKOEOEGuxEVkcCU9b0rTVD40Q=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU5PR03MB10443

DQoNCk9uIDI5LjA5LjI1IDIyOjUyLCBTdGVmYW5vIFN0YWJlbGxpbmkgd3JvdGU6DQoNCkhlbGxv
IFN0ZWZhbm8NCg0KPiBPbiBNb24sIDI5IFNlcCAyMDI1LCBPbGVrc2FuZHIgVHlzaGNoZW5rbyB3
cm90ZToNCj4+IEFkZCBET01VX1NUQVRJQ19FVlRDSE5TW251bWJlcl09ImxvY2FsX2lkIGxvY2Fs
X3BvcnQgcmVtb3RlX2lkOyAuLi4iDQo+PiBjb25maWd1cmF0aW9uIGZpbGUgc3RyaW5nIG9wdGlv
biBzcGVjaWZ5aW5nIHRoZSBzdGF0aWMgZXZlbnQgY2hhbm5lbA0KPj4gZGVmaW5pdGlvbnMgZm9y
IGRvbWFpbi4NCj4+DQo+PiBUaGUgYnVpbGQgc2NyaXB0IHVzZXMgc2ltcGxlIElEcyB0byBhdXRv
bWF0aWNhbGx5IGFuZCBzYWZlbHkNCj4+IGdlbmVyYXRlIHRoZSByZXF1aXJlZCB1bmlxdWUgcGhh
bmRsZSBudW1iZXJzIGZvciB0aGUgZGV2aWNlIHRyZWUuDQo+PiBUaGUgdXNlciBvbmx5IG5lZWRz
IHRvIGRlZmluZSBzaW1wbGUgbnVtZXJpYyBJRHMgYW5kIGRvZXMgbm90IG5lZWQNCj4+IHRvIG1h
bmFnZSBjb21wbGV4IHBoYW5kbGUgdmFsdWVzLg0KPj4NCj4+IEZvciB0aGUgZm9sbG93aW5nIGV4
YW1wbGU6DQo+PiBET01VX1NUQVRJQ19FVlRDSE5TWzBdPSIxIDEwIDI7IDMgMTIgNCINCj4+IERP
TVVfU1RBVElDX0VWVENITlNbMV09IjIgMTEgMTsgNCAxMyAzIg0KPj4NCj4+IGl0IGdlbmVyYXRl
czoNCj4+IGZkdCBta25vZCAvY2hvc2VuL2RvbVUwIGV2dGNobkAxDQo+PiBmZHQgc2V0IC9jaG9z
ZW4vZG9tVTAvZXZ0Y2huQDEgcGhhbmRsZSA8MHhmZmZmZmZmZT4NCj4+IGZkdCBzZXQgL2Nob3Nl
bi9kb21VMC9ldnRjaG5AMSBjb21wYXRpYmxlICJ4ZW4sZXZ0Y2huLXYxIg0KPj4gZmR0IHNldCAv
Y2hvc2VuL2RvbVUwL2V2dGNobkAxIHhlbixldnRjaG4gPDEwIDB4ZmZmZmZmZmQ+DQo+PiBmZHQg
bWtub2QgL2Nob3Nlbi9kb21VMCBldnRjaG5AMw0KPj4gZmR0IHNldCAvY2hvc2VuL2RvbVUwL2V2
dGNobkAzIHBoYW5kbGUgPDB4ZmZmZmZmZmM+DQo+PiBmZHQgc2V0IC9jaG9zZW4vZG9tVTAvZXZ0
Y2huQDMgY29tcGF0aWJsZSAieGVuLGV2dGNobi12MSINCj4+IGZkdCBzZXQgL2Nob3Nlbi9kb21V
MC9ldnRjaG5AMyB4ZW4sZXZ0Y2huIDwxMiAweGZmZmZmZmZiPg0KPj4gLi4uDQo+PiBmZHQgbWtu
b2QgL2Nob3Nlbi9kb21VMSBldnRjaG5AMg0KPj4gZmR0IHNldCAvY2hvc2VuL2RvbVUxL2V2dGNo
bkAyIHBoYW5kbGUgPDB4ZmZmZmZmZmQ+DQo+PiBmZHQgc2V0IC9jaG9zZW4vZG9tVTEvZXZ0Y2hu
QDIgY29tcGF0aWJsZSAieGVuLGV2dGNobi12MSINCj4+IGZkdCBzZXQgL2Nob3Nlbi9kb21VMS9l
dnRjaG5AMiB4ZW4sZXZ0Y2huIDwxMSAweGZmZmZmZmZlPg0KPj4gZmR0IG1rbm9kIC9jaG9zZW4v
ZG9tVTEgZXZ0Y2huQDQNCj4+IGZkdCBzZXQgL2Nob3Nlbi9kb21VMS9ldnRjaG5ANCBwaGFuZGxl
IDwweGZmZmZmZmZiPg0KPj4gZmR0IHNldCAvY2hvc2VuL2RvbVUxL2V2dGNobkA0IGNvbXBhdGli
bGUgInhlbixldnRjaG4tdjEiDQo+PiBmZHQgc2V0IC9jaG9zZW4vZG9tVTEvZXZ0Y2huQDQgeGVu
LGV2dGNobiA8MTMgMHhmZmZmZmZmYz4NCj4gDQo+IEknZCBsaWtlIHRvIG1ha2UgYW4gYWx0ZXJu
YXRpdmUgc3VnZ2VzdGlvbi4gVGhlIHVzZXIgc3BlY2lmaWVzIHRyaXBsZXRzOg0KPiBET01VX1NU
QVRJQ19FVlRDSE5TWzBdPSJsb2NhbC1pZCByZW1vdGUtZG9taWQgcmVtb3RlLWlkDQo+IA0KPiBU
byBnZW5lcmF0ZSB0aGUgZXhhbXBsZSBhYm92ZToNCj4gDQo+IERPTVVfU1RBVElDX0VWVENITlNb
MF09IjEwIDEgMTE7IDEyIDEgMTMiDQo+IERPTVVfU1RBVElDX0VWVENITlNbMV09IjExIDAgMTA7
IDEzIDAgMTIiDQoNCkkgZ3Vlc3MgYnkgc2F5aW5nIGxvY2FsLWlkIGFuZCByZW1vdGUtaWQgaGVy
ZSB5b3UganVzdCBtZWFudCBsb2NhbCBhbmQgDQpyZW1vdGUgZXZlbnQgY2hhbm5lbHMsIHJpZ2h0
PyBJZiBzbywgSSB3b3VsZCB1c2UgbG9jYWxfcG9ydCBhbmQgcmVtb3RlX3BvcnQuDQoNCg0KPiAN
Cj4gSSB0aGluayB0aGlzIGlzIGJldHRlciBiZWNhdXNlIGl0IGRvZXNuJ3QgcmVxdWlyZSB0byBp
bnZlbnQgKHVzZWxlc3MpDQo+IHVuaXF1ZSBudW1iZXJzIGFzIHJlZmVyZW5jZXMuIEluc3RlYWQs
IGl0IGZvY3VzZXMgb24gdGhlIGRhdGEgdGhhdA0KPiBhY3R1YWxseSBtYXR0ZXJzIHRvIHRoZSB1
c2VyOiB0aGUgZXZlbnQgY2hhbm5lbCBJRHMgYXQgYm90aCBlbmRzIGFuZA0KPiB0aGUgZG9tYWlu
cyBpbnZvbHZlZC4gVGhlc2UgYXJlIHRoaW5ncyB0aGUgdXNlciBtdXN0IGtub3cgYW55d2F5Lg0K
PiANCj4gVGhlIG9ubHkgY2F0Y2ggd2l0aCB0aGlzIHN1Z2dlc2lvbiBpcyB0aGUgZGVmaW5pdGlv
biBvZiAicmVtb3RlLWRvbWlkIjoNCj4gaW4gcmVhbGl0eSB0aGUgRE9NVSBhcnJheSBpbmRleCBp
cyBub3QgdGhlIGRvbWlkIGluIGRvbTBsZXNzIHNvIHdlIHdvdWxkDQo+IGhhdmUgdG8gY2xhcmlm
eS4gTWF5YmUgd2UgY291bGQgZGVmaW5lIGl0IGFzIHJlbW90ZS1kb21haW4taW5kZXggb3INCj4g
c29tZXRoaW5nIGxpa2UgdGhhdC4NCg0KSSBzZWUsIHllcyByZW1vdGUtZG9tYWluLWluZGV4IHNv
dW5kcyBjbGVhci4NCg0KDQo+IA0KPiBXaGF0IGRvIHlvdSB0aGluaz8NCg0KSSB0aGluaywgaXQg
aXMgYSBncmVhdCBhcHByb2FjaC4gSSB3aWxsIHRyeSB0byBpbXBsZW1lbnQgd2hhdCB5b3Ugc3Vn
Z2VzdGVkLg0KDQoNCj4gDQo+IA0KPiBJbiBJbWFnZUJ1aWxkZXIgc28gZmFyIHdlIGhhdmUgbm90
IHVzZWQgc2VwYXJhdG9ycyBsaWtlICc7JyBoZXJlIGJ1dCBJDQo+IHRoaW5rIGl0IGRvZXMgaW1w
cm92ZSByZWFkYWJpbGl0eSBzbyBJIHdvdWxkIGtlZXAgaXQuDQoNCm9rDQoNCltzbmlwXQ==

