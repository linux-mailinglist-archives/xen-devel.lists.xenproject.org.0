Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E7682D244C1
	for <lists+xen-devel@lfdr.de>; Thu, 15 Jan 2026 12:48:57 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1204929.1519442 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vgLqK-0001d1-L0; Thu, 15 Jan 2026 11:48:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1204929.1519442; Thu, 15 Jan 2026 11:48:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vgLqK-0001b5-H4; Thu, 15 Jan 2026 11:48:48 +0000
Received: by outflank-mailman (input) for mailman id 1204929;
 Thu, 15 Jan 2026 11:48:46 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=cICa=7U=citrix.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1vgLqI-0001Zq-Hq
 for xen-devel@lists.xenproject.org; Thu, 15 Jan 2026 11:48:46 +0000
Received: from SA9PR02CU001.outbound.protection.outlook.com
 (mail-southcentralusazlp170130001.outbound.protection.outlook.com
 [2a01:111:f403:c10c::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 231a826b-f208-11f0-9ccf-f158ae23cfc8;
 Thu, 15 Jan 2026 12:48:41 +0100 (CET)
Received: from CH7PR03MB7860.namprd03.prod.outlook.com (2603:10b6:610:24e::14)
 by CH1PR03MB8168.namprd03.prod.outlook.com (2603:10b6:610:2b0::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.5; Thu, 15 Jan
 2026 11:48:37 +0000
Received: from CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343]) by CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343%4]) with mapi id 15.20.9520.005; Thu, 15 Jan 2026
 11:48:37 +0000
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
X-Inumbo-ID: 231a826b-f208-11f0-9ccf-f158ae23cfc8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uZmpNaWM8FunqOPJd2IJANwFx2dhWgpHmcZJ2/TJCyImMX8c8p+B/4YgYX59gsYTfu26Dnt85fck/4tBKqjjtzahI4iTIaVZwGqKjTpoFFdd8fFovMuRQx3+LlOjt0UxZhgOw7iq15iSlOAwbVZBfXSRje/JiFBMNpOtex80nMAlabAdXA4FZCp8wXtqDHFBZ+TfC2+QaN+e+6yZfw3DJLkaDKn6+Sx4tOVACAYlmAzuiU6b4G549tl5ks9gxeG8G5WfojfISN5NMjYCpM4T2tGpt6dgi0WZNvjgf8/r3Cd/RX4mdQgh0Vuvv7makunL/4Wr1rePRfFVzHeMvJ7fUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zw2SFA/9uekFeQTeIzgEzl8vbJdzSOciNg4Yk3D9LL4=;
 b=bGSMQJ5DCme9Q3pdOG3DVhQbI6VYpTxvs8ZORmHqKQtRo68Ci+Irppyf53oe0HE5CAjn6q1t+lhXimU5HhQ+qq2ugPjd7I0Nbm+k3otOu1m6/YPdRV2nGQfBWkelVVHvCbcdgShzBNq6goYdVWT29Lra3ZWnju+t6uLkD12MXeq1ECoqwilhqIFV7GNTKKixu/MZM2R2jukPX88djx3F4wSAgdey6L8QOIZ2V68RkCbng7bISn0dd7HR+oGzYFexl7oQK8SDzTK7snRA4G9VLeS9LlUXzjWC0aRpHwgsCNRZcoSAaoNaIQ7mrrx0RozmSnZqY9mErN6bjW502AxkRw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zw2SFA/9uekFeQTeIzgEzl8vbJdzSOciNg4Yk3D9LL4=;
 b=LXYERUA1HEaHDQQd3N+3G5rFWgbkhTFy9XQ5krXWfed/XtY3IDFapq90viyG3hl7lwfMWwKIwK4k5CeiWSbdUUc7z4KznzBQidOpxwCE9EYVerPqzvIdq0qq3Jiry6wGH+e837lSSZvepovlZhs0cUv+pvqQrYoKIPXe72LaZzI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Thu, 15 Jan 2026 12:48:34 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?utf-8?B?0JDQvdGC0L7QvSDQnNCw0YDQutC+0LI=?= <akmarkov45@gmail.com>
Subject: Re: [PATCH 1/5] x86/time: deal with negative deltas in
 get_s_time_fixed()
Message-ID: <aWjUEsp0dHsbjhyn@Mac.lan>
References: <66a53368-9c33-436c-858e-2b2d25ae84b7@suse.com>
 <1f539879-3083-41d5-a2c5-c63c9161f0bf@suse.com>
 <aWfXJk90Sh7B-qi7@Mac.lan>
 <e9205e59-fb1d-429e-877d-28aa8cb950ca@suse.com>
 <aWikMGJKa3VPQQzi@Mac.lan>
 <49507100-faa9-4480-a534-e4bab6cecc5b@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <49507100-faa9-4480-a534-e4bab6cecc5b@suse.com>
X-ClientProxiedBy: MA2P292CA0002.ESPP292.PROD.OUTLOOK.COM
 (2603:10a6:250:1::18) To CH7PR03MB7860.namprd03.prod.outlook.com
 (2603:10b6:610:24e::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH7PR03MB7860:EE_|CH1PR03MB8168:EE_
X-MS-Office365-Filtering-Correlation-Id: 0541d5f1-bfb7-4fde-29a2-08de542c050f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?MnFSeVh5aVNobFZpTlJGN3ZDLzZUUEtvNjBUcXk3YWovVElUT3NPTVlpRnpV?=
 =?utf-8?B?RUkzckdaaW5ya01CN1dZNjhBSDMvUlFjakE4MS93MnU0ZWRCdzVFQUlCWEV5?=
 =?utf-8?B?Uk1UQ2w1VVJqQWNiVFBEOEU5WkkwbDNVOWNOK3ZFenJwZ3oySTA5VWVqMTFn?=
 =?utf-8?B?MTJrSHVSQy9tRVBEaE9vcmloQjh1cHppeWI4RGs1akM2U0laRUY3K2tYNzVk?=
 =?utf-8?B?ekhWTGdPZlY0SUdUU2JOdlNacW12TE1TV3crSEVCNGs3RmxOQWFuNHdhSlZ2?=
 =?utf-8?B?ZDhBM2NqUzh0cFNuRTl0Qi8rcjc3TG1aQjA4TWhFSURjd2ZTc2dRYjJoOVlQ?=
 =?utf-8?B?RDJqQUFYOFZtWXl3clFPYTdkQm9TcjlvUzlOaGhyVTRYTGp3cTIyZUxMZThj?=
 =?utf-8?B?eG84SEY4QnQ0SlBUVVJ0WHFLTnRrYy9OdVlTOGMxbU1saU8ybXAzNW5nM2lH?=
 =?utf-8?B?MTdJNk1CWUVnb0pRQ0E0djh4bFlCd0MyVnd6OUhLVk8xMjgvRlllVFgycy9F?=
 =?utf-8?B?TDFGT1dlZ0RYME1reE5oNS9RYWhrTk9kblVZZ2h6NThLU2U3WVp1ZzZyUUpw?=
 =?utf-8?B?VWp1N1RKcDlHUXBSWXRQTEZqMWgvZ1VkOVdZVjlNaEk3TEFwZUppUFRuaTdq?=
 =?utf-8?B?YUxxMW41ZG5XZjhrYi93SHV1ZTlaME9hWE5KL2JyeTNuTnZING4vamNiZ1JP?=
 =?utf-8?B?Qithb1RxWUxGRnJuOGlBTk5nQUxVY3dCK2oyUVBZRlpjTVhlUE5MSUdCUENz?=
 =?utf-8?B?bHkzblFwY0ViM1FrcEhFTTlrSytLRS9NOHdpaGFremdtTmtwb1NvL21uOGhC?=
 =?utf-8?B?OTFDUmxJeVpYazArS3dmRDdVOTR5TDRHSXZlNkVuOXBQQnVlNkRGaE1sYVZw?=
 =?utf-8?B?OUx5end4QWliZjJWdHZQeGpCVXAvVFBJT2RrUDQ3N1duZFA4YURHTFlXd21m?=
 =?utf-8?B?WkcrWnVzQk9hN0RlblJTQXhSbkJhMEc4SzdXSGRkbUQ0RGJCSjhEVnpjSVEw?=
 =?utf-8?B?RkVCUjlpS3lBdjZ4RjAxekZwdGh3eGVXLzdpaTZCMGlCOHFvUVYycmRrUEVH?=
 =?utf-8?B?bzVEZUNYTG9NRnJBN051bE5OczBZejRycGZIb203dkJkNWJSYVU5aWNIOHZU?=
 =?utf-8?B?R2Jmbkt6SmZMUHZYdk90bzVBTy9ycW9iMzhlSWhvb3VlUk9MeWd2UnljM2R3?=
 =?utf-8?B?NWdjS3hDMnVucXJETlR1cnY2enJaMTlGZmtTc0F2TSs4M1dYNEp6aE5RUVYr?=
 =?utf-8?B?QWthNml3S0hBeWJvb25sdXpFNEVBa2cwTzlzQXRpcWpLbmlkVGJwUDJ4ZEJj?=
 =?utf-8?B?eGx0WFVsQXdJNk5VNVpZZDROTHNNU2tqcDNUS3dJSEdsNFdndzROaU9SaUhV?=
 =?utf-8?B?QW4zeGhTeXUyTklqZUZSMnZFQXhGRmRuZG5tVGdmK1Q3TXN3RFZDTU9jZmZ5?=
 =?utf-8?B?N0l3TmovWlFRZEEyM09YNWRXamR0d0orN1V0dmc5NjhWdGhlaW1iZEVsTXFR?=
 =?utf-8?B?SVUvcWtCeWFzT0dqaHhnNFRwU1R0cEJqUll0ZTZKaDN5MW9pc2d5bm5vdXBF?=
 =?utf-8?B?ZzVrcWxaWlZka0dHR1pXRTMydk5nUmh0QTNwdFpFWlBhVDlvRlQ4QXRENXpB?=
 =?utf-8?B?a0RiVXMrQjJKZlplUTlVT0syMWVva0lVemVGZWVvOFZ1QTBNZzZpbzdtcWlT?=
 =?utf-8?B?aW1Fczd4aDNFd3drc3FqSjNVaExwRnFsOE1hQThxWHRmNnpEeWpCU2dSVy9l?=
 =?utf-8?B?UWRyZ28rT3pjcGNLa0ZkTlU3Y0RtSUc0SzJUTnB4SUltdjdFeVdTcjhGOGU2?=
 =?utf-8?B?N3ZOS3AwZ3EzZE9RM0lnampKUXFGTWF5QXBQWTA0Q2FsTUVSSnNnK3ZkTG0x?=
 =?utf-8?B?UG84dEphamxjNU1XaWZMdDV3TUFqUHRvTU8rcnlHYzJxaHBSUnFlQ2ZGOW9O?=
 =?utf-8?B?Y0RzYks0SHNuQThCS2w5MFA2RGxRclRKZHNGTjFieUk1dWhBUlhVZE00VjBZ?=
 =?utf-8?B?dnZmVFhsQmVpTTRVbVpvYzgyRFF6NEluZ3UxWC9zWlMzZ1Z0bjYxQzdYSmp5?=
 =?utf-8?B?Q0ZsTzZUUVNpbENxcWhHbVBzN3IzZFpBazRWZWxjTno5ZFM2RHIwVTNMVjZG?=
 =?utf-8?Q?vyGQ=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH7PR03MB7860.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bVorcGs3ZGZFV3dRRGQ0TGxKdE9HUzIrOW8xUTZUWUJacTFicnhEWmt1UXg2?=
 =?utf-8?B?OFNpMjJlL2RkRjc0d3VuQnFrZmx1TTErYzlQVm9vcWd2a0gvTUMvUlIwYWhI?=
 =?utf-8?B?bVZzWm5UVGIxSzVUNUU4Z1REc3daaU9Gak82TGNZVm1ORXVobFJJNldqdEdH?=
 =?utf-8?B?Yzd6WmRDVTE4NWVTQzdJaEc3d0FaTVVxeFVMQ1JaWmRnZGsvMzQ0VFVQMUFl?=
 =?utf-8?B?TlgvYmM4ZWhDS05YdVdtejlDeTF2Q2ZSOUFVQkJCaG5taGJTMlpVbkFOc0JP?=
 =?utf-8?B?L09LbTdXZTVLd1hQeGh4aXdrRmM3ekxCSVJQSzhEVnpvUEdRanJKQmtGaXF2?=
 =?utf-8?B?aWlmb1BPYVNzSVBiVUlnOW1RK2lyK3F3UkExaUlRZzA0Sy96anU3VWtqbkVH?=
 =?utf-8?B?S2RNVHBkQzhRY3M3WUdSL3Mzb2VmZGNBNWtBMVNwVjhCbHNqYjVLeGl0QmRK?=
 =?utf-8?B?QWduWnozQjlNTWwxSzY0QjFDc0g0NDVZN2lYT2o4QmlzK1oyUk1nV0V3TXY5?=
 =?utf-8?B?bnR3V2VDZ05COUNNRW5qcHJBK1NqRE81VWdOQWdxYld4NjZRUEMrTVdmRktM?=
 =?utf-8?B?eUVzRStIdmJncmF2cEZpc01wV09ib0pzQkZpSHFtaEVFaVd5ang4ZFZYK2hT?=
 =?utf-8?B?WUVmaGRpZm8zam5xUGY5Rmc4a0dNZlVQQmxXUTdSRGcwTmUybERTdTEyQW0z?=
 =?utf-8?B?VXNMWEg5Y0s1S1g4b05sT0t1VElGYk43UldrbWtRUSt5Y20yNEVhWkRvdlBZ?=
 =?utf-8?B?b0hrT2gyMGE1NjgxWGpTTndEUEtPNzd6OXZIRXJhZExsVUdGZTk4dUMrYW8r?=
 =?utf-8?B?SndhbE5sYjJ5MWhTVG5hclJraCtOZE1IdWpOVFNaQkgvR2k1a3VndkoyOWtM?=
 =?utf-8?B?TGp4L2RPQmJvOW5KeVZ4M2RNMkNtakZod2dSZkxaK2VtNWphM1poRnBPeXNM?=
 =?utf-8?B?YXpOUi9hdzZiZFArWko4MFFjR2dJVDdJUGJ4S3Z4LzBKanNkVnM3MENhanUx?=
 =?utf-8?B?YVNza0RvblhEdjNZTlVVMm94YTlGYm4vSTdmMVBBQkxidEJGUmpSTHlkd2Yy?=
 =?utf-8?B?bndEem9qY0tMNHdwYzZ4T2FQYkFZUjVyLzFQNkN5UEY1QkJFOTljWEdXbEZq?=
 =?utf-8?B?WCt1ZFR3STcwb0NlQXQvNmVLWXo1Qmg1RXAzOHlhSEdTT09mWUJ5bDBTb2x6?=
 =?utf-8?B?WWdlSVFxOHZpYnI1VmtoQlhTcnhmL0UzSWpOOVdzNWhRb3gzdzVsN3lsVW1C?=
 =?utf-8?B?V2thNnlHVHZvTzl5eXJWUnIyYjh4ZlVoODRhbVExdzUvVGRtZkRNNGdEVFBH?=
 =?utf-8?B?dVZyejArWnNYOUlOV2d1KzhIWmwxcjR1a3lIY1Z6TUozWGZUaGtMNEJEUTFX?=
 =?utf-8?B?SFljZlZaYTFaWlJZMEJwYnl2dWkxdVFad1Ivcmdaanh2Uy9oOHZ5WWdzWDB1?=
 =?utf-8?B?YmZmeHlHTmtrWjN4ZCtXTElFdU9XeVZjN2R3MjVldVZ4aU1IbDF5cTdnSWhn?=
 =?utf-8?B?cXM4MWVacmNFOStQLzd0UFJ0SE1rWmkzdkdENlpXNit1bEpCU1hqaElqZHZL?=
 =?utf-8?B?cUdmdTUyYXh0RHdSY1RmMC9IdWoxYmJ2eUhqL0p1akZnc255UW5TVFNzWDFU?=
 =?utf-8?B?MDFXQk5tWmUrYWwrUmNudC84VUdKZklDOFplaW1RYys5cTdNSll4Q2tmeU9L?=
 =?utf-8?B?LzJlT0hHSFk2TzRmNE1POGNaMElZVi96SXEyZ2NkaVhsMlduQlJwNVBjL1RR?=
 =?utf-8?B?c0k2U0RTMlV5T1YzNDhqdGJuZVdzTlpmZHg0aVNYTVkvcHNsbUY2V2VEa01R?=
 =?utf-8?B?ZG1xd2lBckVPV2tYdlFFRkw0WEdnOEVYODdGbGsySEx2SmJCUm9XemtIeWxG?=
 =?utf-8?B?ZTZxTitFK3oycHNGWUNzUHBGTU5nZHZEdDBmZ2wvbGJTM203bnRPeDZDNnov?=
 =?utf-8?B?R1c3N3Y3KzJnRm1oL3QwUElCUTk3Q3ErTmtFSHU1U0pXVWd5MUxyd2JBQzFa?=
 =?utf-8?B?MmxEQkVLR3FzRkZySVlVaUxERThQc3A0Q2RLb3VSQXhaN3dIWGNBWTI2ekM1?=
 =?utf-8?B?dkFXZ2V3T3VLRWVWNE9kRlFPaFRPeG4wOUYvbFZTcHpXeSszSTFrMTh3YUkr?=
 =?utf-8?B?TmdUM0MvNEZ0MEh5ZEppRzhmQVVwcnZRTDV3Mm5IdFFnRlpoNEp2cFVhczRz?=
 =?utf-8?B?Wm1LL2pRU2Y0a2Via09MNWhKMmdzV3ZhcjIyNUdQVWFNNXE4RUtOZ3VWc3Qr?=
 =?utf-8?B?UU90K25ITmRSTmlVcmFOL1piMERmaTc4TVNRM2RVbFJ4WlJrMW5DaTRtQWxH?=
 =?utf-8?B?NlFROXBtZGxISmU2QTdCemdoSUZBMUduSXVxS3lBRTlIdCtvLzBiQT09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0541d5f1-bfb7-4fde-29a2-08de542c050f
X-MS-Exchange-CrossTenant-AuthSource: CH7PR03MB7860.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jan 2026 11:48:37.5521
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4thryce/7U2I/1WtiEIXw89FdIjOTm+a3lp7Hm1PbFuCX+zjnpTy0/TSRmUjEpc8mx9Q91YAfBODcwNwV00zGQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH1PR03MB8168

On Thu, Jan 15, 2026 at 11:38:10AM +0100, Jan Beulich wrote:
> On 15.01.2026 09:24, Roger Pau Monné wrote:
> > On Thu, Jan 15, 2026 at 09:00:07AM +0100, Jan Beulich wrote:
> >> On 14.01.2026 18:49, Roger Pau Monné wrote:
> >>> On Tue, Jan 06, 2026 at 02:58:11PM +0100, Jan Beulich wrote:
> >>>> amd_check_erratum_1474() (next to its call to tsc_ticks2ns()) has a
> >>>> comment towards the TSC being "sane", but is that correct? Due to
> >>>> TSC_ADJUST, rdtsc() may well return a huge value (and the TSC would then
> >>>> wrap through 0 at some point). Shouldn't we subtract boot_tsc_stamp before
> >>>> calling tsc_ticks2ns()?
> >>>
> >>> amd_check_erratum_1474() runs after early_time_init(), which would
> >>> have cleared any TSC_ADJUST offset AFAICT.  There's a note in the
> >>> initcall to that regard:
> >>>
> >>> /*
> >>>  * Must be executed after early_time_init() for tsc_ticks2ns() to have been
> >>>  * calibrated.  That prevents us doing the check in init_amd().
> >>>  */
> >>> presmp_initcall(amd_check_erratum_1474);
> >>
> >> Hmm, I should have written "Due to e.g. TSC_ADJUST". Firmware may also
> >> have played other games with MSR_TSC.
> > 
> > For amd_check_erratum_1474() we don't want to subtract boot_tsc_stamp,
> > otherwise when kexec'ed we won't be accounting properly for the time
> > since host startup, as subtracting boot_tsc_stamp would remove any
> > time consumed by a previously run OS.
> 
> For both this and ...
> 
> >>>> A similar issue looks to exist in tsc_get_info(), again when rdtsc()
> >>>> possibly returns a huge value due to TSC_ADJUST. Once again I wonder
> >>>> whether we shouldn't subtract boot_tsc_stamp.
> >>>
> >>> I would expect tsc_get_info() to also get called exclusively after
> >>> early_time_init()?
> >>
> >> Same here then (obviously).
> > 
> > For tsc_get_info() I think you are worried that the TSC might
> > overflow, and hence the calculation in scale_delta() would then be
> > skewed.  We must have other instances of this pattern however, what
> > about get_s_time_fixed(), I think it would also be affected?
> > 
> > Or maybe I'm not understanding the concern.  Given the proposed
> > scale_delta() logic, it won't be possible to distinguish rdtsc
> > overflowing from a value in the past.
> 
> ... this, my main point really is that scale_delta() (as its name says),
> and hence also tsc_ticks2ns(), shouldn't be used on absolute counts, but
> only deltas. (Yes, an absolute count can be viewed as delta from 0, but
> that's correct only if we know the TSC started counting from 0 and was
> never adjusted by some bias.)

Well amd_check_erratum_1474() does want the delta from 0 to the
current TSC, because that's the best? way to see when C6 needs to be
disabled.  Otherwise we just straight disable C6 on boot on affected
systems.

IMO the problem is not about using tsc_ticks2ns() or scale_delta()
with absolute or delta values, the issue if how the "delta" passed to
those functions is calculated.

Thanks, Roger.

