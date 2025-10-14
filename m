Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 16C90BDAA32
	for <lists+xen-devel@lfdr.de>; Tue, 14 Oct 2025 18:36:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1142950.1476844 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v8i0g-0004Nc-O9; Tue, 14 Oct 2025 16:36:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1142950.1476844; Tue, 14 Oct 2025 16:36:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v8i0g-0004LC-Kx; Tue, 14 Oct 2025 16:36:26 +0000
Received: by outflank-mailman (input) for mailman id 1142950;
 Tue, 14 Oct 2025 16:36:25 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=MYj7=4X=epam.com=dmytro_prokopchuk1@srs-se1.protection.inumbo.net>)
 id 1v8i0f-0004L6-3T
 for xen-devel@lists.xenproject.org; Tue, 14 Oct 2025 16:36:25 +0000
Received: from MRWPR03CU001.outbound.protection.outlook.com
 (mail-francesouthazlp170110003.outbound.protection.outlook.com
 [2a01:111:f403:c207::3])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id eafcc6ac-a91b-11f0-9d15-b5c5bf9af7f9;
 Tue, 14 Oct 2025 18:36:23 +0200 (CEST)
Received: from DB4PR03MB9556.eurprd03.prod.outlook.com (2603:10a6:10:3f3::12)
 by AM9PR03MB6756.eurprd03.prod.outlook.com (2603:10a6:20b:2dd::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9203.13; Tue, 14 Oct
 2025 16:36:19 +0000
Received: from DB4PR03MB9556.eurprd03.prod.outlook.com
 ([fe80::ff66:ad9c:fa1:ef30]) by DB4PR03MB9556.eurprd03.prod.outlook.com
 ([fe80::ff66:ad9c:fa1:ef30%5]) with mapi id 15.20.9203.009; Tue, 14 Oct 2025
 16:36:18 +0000
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
X-Inumbo-ID: eafcc6ac-a91b-11f0-9d15-b5c5bf9af7f9
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=whAcFV/80+1LYnOSOLdBIz6Wobrj4s8YASw5KwB9uDmQuC9Cm71tvjh6z6HGt9r9rzHyyDWDMhErn/TaGuTdtwexpuNAFi3ttemr7lJXVlEeb55r4+FiZNNJbqjm4uuGnED7g9fE7wrJBTYakz71pJpLyAk+K8vVm5FXyEi3MM2XErRxaPmFcMejvgt5eOpfjdx5fFjpHhYhoIHuBKxy+7/WGa4uy3OFbr8YWMmcRlkez4IE0/wQ6VEls6Rxut5YLEbjqbpiHMv/NuBzRwn4DTUJTgu9Q+7mBfglbM4OF4aOU983gsHQ3rvEi0Zqs+uF68eEWKp6Bgpb63NvY6E5FA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IBRkNPWSgPH8vclCOAb0N0pom0K0OPZ5N9LX1LDkHd8=;
 b=Wza2bpzZbz+3YZzAcpTvTOBOt13KY4rZXKzn/pxRrS9MtthD4ObxK8XecUKXCymge7CVVUM2R9W2gWmk9dVI+ZfyY4Ra2VlVzAhw+4rTH9mVO3ngjRul55m7vHJa2qBnULgZDl+Fxv6P+J/lHExXoyvGGXuVnMcxwZPEEGANb+5VOxuBXtN2Kg100jyFWjMKy3pA78RcAAKWGxw2o0gn+msZ2I2xnTvPhd3njhsiED73cW0pc+1D7L+WFQq+8RsmbUM+oDgqhAUC569f9bEi+Om8rOH1tQwLXjJKzEPp0N4m4WD6zd0qxbAi1ZNJf8TIY+ZymsBjxTSfF1HjERIfig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IBRkNPWSgPH8vclCOAb0N0pom0K0OPZ5N9LX1LDkHd8=;
 b=k+wKCARd58N5i3aYuwhPhi3hjS1oHXpgx604G3rskT7gMDq1rOLbA6b4V2S9gV2bgxwSoM0jBfO5rEqYyuyF0IOgb3V3GgEwAGoxyg1dJKFD7JXX25HyWQW27HBGk6nQbm4YrLUiM2vbYn/XiiVFByp2Me9PM7bkwRRbf1j1fp7O15c8M/Y03YfM8nlR/P8w2c/i6txamxYdQhFq9rebEHUaZa+2Uxx27LZBeQJpBaFgmpC8zfeT3q9PmJlwk387kW5T6h9FqIhuRMu6OEzDnUoXbo22GIC4PM1htDxNg+zpfS7kdV10haQcPyFnCk9Kf/iRya5vsimLPZuJL/rhmg==
From: Dmytro Prokopchuk1 <dmytro_prokopchuk1@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Anthony PERARD
	<anthony.perard@vates.tech>, Michal Orzel <michal.orzel@amd.com>, Jan Beulich
	<jbeulich@suse.com>, Julien Grall <julien@xen.org>,
	=?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>, Stefano
 Stabellini <sstabellini@kernel.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Resend: [PATCH] arm/gic_v3: fix MISRA C R2.1 violations in
 gicv3_do_LPI()
Thread-Topic: Resend: [PATCH] arm/gic_v3: fix MISRA C R2.1 violations in
 gicv3_do_LPI()
Thread-Index: AQHcMXsLUvRxhyKkhUuhWVAohL+E7bTB7l2A
Date: Tue, 14 Oct 2025 16:36:18 +0000
Message-ID: <b4bc294d-c64e-483f-bfb7-89270ac6d7cd@epam.com>
References:
 <b26772df8733dbd1ce6ea14a6e8b73f278db3a3d.1759174857.git.dmytro_prokopchuk1@epam.com>
In-Reply-To:
 <b26772df8733dbd1ce6ea14a6e8b73f278db3a3d.1759174857.git.dmytro_prokopchuk1@epam.com>
Accept-Language: en-US, uk-UA, ru-RU
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DB4PR03MB9556:EE_|AM9PR03MB6756:EE_
x-ms-office365-filtering-correlation-id: 3f0694ae-4cc7-489d-296c-08de0b3fcd1c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|42112799006|376014|366016|1800799024|38070700021;
x-microsoft-antispam-message-info:
 =?utf-8?B?dUxtT0Eyc0JMVUlLcVlHOVBpeGtLcnZaUHhlWTl1bkd2Y0R5M0Y3NjByWkx5?=
 =?utf-8?B?NHZESml6U1BZaEd2dEphZG1TSGpUbC9BVUcramUzM0Rab1ZubEYyNFU2MDYw?=
 =?utf-8?B?RlFrdEsxODRvZ00weWViV0loRXpxYlN3cFkvYndTWVNKamgxTnJ5R3pFWk9U?=
 =?utf-8?B?UURYUXBGTHVGVnUzWHoxWGdyekkxQ2ZnbGJ6d0llRUZFMWNteUg1Zm1GYWN6?=
 =?utf-8?B?dldqeVR3YW9zWjBwbVZ5eFhVekhGVEZlejdPSVBWL1RMbXBrczNUSkdPQnhq?=
 =?utf-8?B?bEl5SEIwSzF0YWVGQ0RKNWpxb3VQaWFzVjZZbHcycWVEek5GRjBnL2ZpRjIr?=
 =?utf-8?B?Vmovcm5jUW1qL3l2WkVOa2daTGREa1dBT0hCQitteHkrVHljT3JlcnZOWGxL?=
 =?utf-8?B?WEdLN3VTeWlXTlpua1ZnVytlRERhV3R0WmI5ZzJBbElvWTg4WUhUd1JVUnNI?=
 =?utf-8?B?Vi9adURDVjdlWFpoYlp2SStiT3RKQ2gxTlE2UmNuQnE3UllOTU5MOVk1TEFi?=
 =?utf-8?B?V0h2b2tlV0g2VFppWEM1V0Nna2tjcHBCNHVvWlVIaENBK0t5VzJ2L1FPeHg0?=
 =?utf-8?B?YmRvemdLZXYyUDRZNS8xaUQ2enJ3VE1kMGwrWlI1ejBMMnh3dVo5S3lwb3Av?=
 =?utf-8?B?cEs5bm1xL0lnYlMvVlp6UVpab1hvOVByRzcxbi9vRUhwYnpadERHOXorWGZX?=
 =?utf-8?B?bFRwRTJZalBhcHdiR2pZWnVnUW9BY3duTkFkUTQ0QkZzTjNhZzNMNWhocS83?=
 =?utf-8?B?SFM2VmlUbExrR0cyNTg5bmV2YnM5OCtOMXlMVC9aNTJ3ZFJhQ2JoaUVQcHZ5?=
 =?utf-8?B?V0s3cWw0RDdQSGxMQ3BjczBEbklib3krejkzTVpMTWZoQUcrQWpVTjBYdDNM?=
 =?utf-8?B?c0k3YmI3VW9OMTlnUzUwTlRzUWxOeU1rRjJVM0hYOTVsNGtBVTd5NGlDVVBN?=
 =?utf-8?B?RldMUmd1WUhmaGhGMmNyVnNiakl3Z3B2blV4dWw0Y1UzSk9INDgyQURIb3cy?=
 =?utf-8?B?RWh3cVE4cXlnbWxxNmFDeDBiaXl5T2ljVVdxekZEQVhzaHBBMmtKdFhib2Iv?=
 =?utf-8?B?ZlVUT1N3OEhxMjlkaHk3UTJjaE9qTStmU2VoYlFhVkZCZnhpUHM0VnlsNkVo?=
 =?utf-8?B?UzNSK1ExOWpGZms1T1hOSzQyWDZWQUhFalYyekJCNVdhNTJPd3IvK3JhYTln?=
 =?utf-8?B?MGtlOGlOdHhMc1ZWNk4wbU4zeWJRMXRLUDZhZzd1V3Y2RlJ5NTNTMjJoRW12?=
 =?utf-8?B?MlplUGlBN3ZacVVQajNPQlk1L3hWQ1NuTXIyalF0ZkE5VXRlN1RmVS9LS2Ux?=
 =?utf-8?B?Wm5uMzVsa0Z2MmhsWnJpT3dMZmJBWkRtRXQ3cHgyTjVkMXM4YXhlMDBFYW9y?=
 =?utf-8?B?cnNGbldzT3krZGZ4YjE3Zk5KVHQ2OUtOK0hsVkdWSGx0UEtMWEowYnVvWmZh?=
 =?utf-8?B?SC9DMFJGdGZJRkVGWGZuV1Q0S0R1c0R1VzBTT3VnZ3JvRWNpclk1cENVODdk?=
 =?utf-8?B?WEJaeStHR3g4VWlqVUJ4eGpKWkFZVkNIVFdVNVYzTlZIdDEzc3NVWFNyaFZO?=
 =?utf-8?B?NFBqa2txWHZpT1NyVy9JT2lQMnlscEwzYk0rVmt0c1pJNVg5cmtvRGVjSjJD?=
 =?utf-8?B?bkNiMDZ5MkYvZUZCQmd4N0ZCU3VRYlNkNGsySkFyN2Rzc0dURGk1SHBPc1pz?=
 =?utf-8?B?Yy96RW9ZVkYwZlZEYk5KS2dQbHVLNzhibndQMTlPc1MxN3BJS1VjQ1dwTFRB?=
 =?utf-8?B?blhUT1ZQa2p4elQwMURBQnNtWFBOR1VwMWQ2dm1RUEFXSHhRRndmS2tucGpp?=
 =?utf-8?B?MXhxOUVhVWFtL0VhNzRucnAxTnYwMmJDVllKaGVoQjVNK0U1NnE1NVpNSzI3?=
 =?utf-8?B?aUFjQUlFQlBmRzBuWHFRbkh1ZUwySlIxNE5rUTJPdStxLzA3UDBwU2hKNklY?=
 =?utf-8?B?RzRNVFlnRVRYSmUwSURlMGVzU1B2aURzdDhZOHpJSjNxNndET052VmgzRk05?=
 =?utf-8?B?L1YxdUZLQ3dWb0VXSjVHUk9SNEc3R1NlWVVnYzVkQzJFR3pZNU9UZGIrTmtX?=
 =?utf-8?Q?eqBeD0?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB4PR03MB9556.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(42112799006)(376014)(366016)(1800799024)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?bGhNYjRkYk1XTklDQndCYVF1T1JpWFh5OGxQNkxzSVhiYUN2THdKN3hpYk1q?=
 =?utf-8?B?NEE4UjlzYlJZbmU5cjJTYzVZSjBTMVhvR2pUWUsxMFBDNjN1M2t6QWZQVTFw?=
 =?utf-8?B?NzMzNmJwSTdYeGxYSWVaYWxnV2VFUkcrZ0lhOEkyMkZ4Q3hweStmUUZaMXlX?=
 =?utf-8?B?WnVKRFRuUmJ1dy9vSEFlamc2TWdHY2NJSFRnZ3ZHalphRTVoYWxjbnZtelYx?=
 =?utf-8?B?NzRGc09SaUcxRjVNN1ZwNDBJZjdzTXRjc2xycFZNUDBNc0hCSyt2bGVoaGVW?=
 =?utf-8?B?UG95cEYyY1RNS2xwVHhVajR4bzVkSTNuZlQvWTVneE5NS3JFcWc5djYwQzdY?=
 =?utf-8?B?R0l2UjlCZDk1WWZSSkZIMS93VGU4MTgydUNwZkhaWXI3aG9IS3lwN2k4TDlY?=
 =?utf-8?B?WG4xZFIrczFSdGhhZktTUThRRlV0MVN6VnJ0YS9RWWwxU2F1K0JtTDdva0dx?=
 =?utf-8?B?WlFOMmpvdWxVNFlvSU1DUDlGTWVxdkpaeThPMVRlOXhCMStwUS90L3ZzNmV4?=
 =?utf-8?B?dXBGUUR1UkxzSGRCVmlSL2pxbGMrZWYwbFhLKzMrby9UdHVOUTZLbU1QVER3?=
 =?utf-8?B?NGtFK0w2N2pVaTAyamFQUGVKMTl4aG1XTHFGeU00bVBpMStlU3NvbUIyM3Zw?=
 =?utf-8?B?MzNFeXM4WGdoZ3BGLzZkUlBKUlB3MGZkOHJCUjd2S25Kd21veG5ORVk4anVt?=
 =?utf-8?B?UmhuR0FiU3hNK2NoY3EzZTVPS1hqaitMM3poSHoyams0Q1BNekY1TjA4Q2Vq?=
 =?utf-8?B?YXFYbWVWNjZrbEtwNEhLMGVaRFh1QnZBVzZKSGZKbUcycGJKUGdvYlJtR1Vu?=
 =?utf-8?B?QmZXZTM2WjNKRVpFT2ZzczU0NVU5TTBFRDFuTXpPZTQxOWpSSmsvb25pT1cv?=
 =?utf-8?B?ZThzY2VwNnZpemZuaVpQaWp3alMzOHNnTHdXTzFKNGtwSWlFaDE0SU9CYmVB?=
 =?utf-8?B?akdnR3J6QTZzSzRuWk54NVRPSzArS0ROSzlXY0RBWmdIRHpRME5SQ3ZzdmJu?=
 =?utf-8?B?OFBmRVFLd3dEM2Vjelh1UlpwMWdkeVFGeDlWUFhzdUtqV3B2WnRHQmVrSkgz?=
 =?utf-8?B?VkdpTEM2K0NhYjR6NnYvb2Q3ZEZIRVBGVGJYNXpldmRmK2EzQy9SWVd4ODc4?=
 =?utf-8?B?b0FUN1VIUGl3RGlpcEJ2OHQrT3BhN3hnYWo1cHJpbEYyOE9Vd1kwUEhXcXlw?=
 =?utf-8?B?WjJyZ05wTFdlSEFDa05GTWNBRXJVSHkvZzN3TGdFVnJPcElydzVjNnhPbUMz?=
 =?utf-8?B?eGpvRnBzSmRWM2ZKMTFrTGJ3R1NyRE5MajllMmNZckN5NnZjWjdPNGFSZ2c5?=
 =?utf-8?B?MGZoenp4bU0rTFc3OGJtOWw4aHRWdHJ3VjY4K3d2TE1lZlVtbFY2NXlPQnk3?=
 =?utf-8?B?eEk5eWZacG9uQmxhZnVCelNjYXZuaUhHQ3QreTBMaUhadEZZVnBwNklPelFa?=
 =?utf-8?B?ZmFjOWtQeDMvZmVVYkFCZ242UmsrY0lFWWcyUklrVVVoeU5uUUI2c2YyZGJ3?=
 =?utf-8?B?S1A4YngxY2Z3MmIrNTdHbFphU2tHcWZUdDdmb0llWGNIRE9lcmh4dkVmbDFl?=
 =?utf-8?B?SjA2bHJSa2h0VjJVamR5UWlOL0c4UVhQTGVHOTNkc3VnZFp5bjExYlFWY3Zk?=
 =?utf-8?B?TEtSUi9pMW9GeHBJcFJvWHJoMWNkcE40b0o2S0VnMjBzWXVLbWVGRzludi9Z?=
 =?utf-8?B?MXk0Q3RManp3dytXUWpUUTRsaHZ2cy9pazErOFhXRHZkOTdNMlB6cDJXNHda?=
 =?utf-8?B?OHRheGVqdVlZQm5YUHp6NnBncE9hTkFQZ3RWSmR5VmlUQmtyRG1ORXNkYzRu?=
 =?utf-8?B?emlkODkrcnV0dGQ5L21VSVZVOHNSSHQ0RTlpVVg2d1hmU29qOUYrWE1rVldO?=
 =?utf-8?B?UkJib241WEdDb3JEWEhjUHhrUVVCa0d3d3I0S0cwVzY0S3ZIbSs2VkVFZ0pV?=
 =?utf-8?B?Y055TDVmazFtMFdheDRjOWZiQ0xFTGNxNVcrWERLbzZpVm9GUUFJdnUvejVO?=
 =?utf-8?B?NXFsaHZQc3lra2d6MDgwWUpGVkw4djNPaHQ2UGo0RUlGQ2ZOU09TMFhCTUFn?=
 =?utf-8?B?OHU3UGtTZzNYcmNVdW9EWGxMSDlZQVdTM2tqNm5ZMEYvSkJFa0JXS3Z5L1dC?=
 =?utf-8?B?ZE1WYm93RGZoUWdJcS9qNFA0aVRaci9GVE5SOWExcVJGcU5PS2J6QXoxL3lH?=
 =?utf-8?B?U1E9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <71F7A14A763C7C4CA7B49779F812966D@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB4PR03MB9556.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3f0694ae-4cc7-489d-296c-08de0b3fcd1c
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Oct 2025 16:36:18.4652
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: d6OyAYmm8G5CnjC/KeTUnVBybjs/u+VRW5DgSm5Z6Xnvj9cUTgPL2JM+irYpk/3rg2vt9prW48qpSqddr4wW1II4euBha3IEqfg2zzjRupQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR03MB6756

SGVsbG8sDQpsb29raW5nIGZvcndhcmQgdG8gZmVlZGJhY2ssIHN1Z2dlc3Rpb25zLCBvciBhbnkg
cmVxdWlyZWQNCmNoYW5nZXMgdG8gZ2V0IHRoaXMgcGF0Y2ggYWNjZXB0ZWQuDQoNCkJSLCBEbXl0
cm8uDQoNCk9uIDkvMjkvMjUgMjI6NTUsIERteXRybyBQcm9rb3BjaHVrMSB3cm90ZToNCj4gVGhl
IGZ1bmN0aW9uICdnaWN2M19kb19MUEkoKScgdmlvbGF0ZXMgTUlTUkEgQyAyMDEyIFJ1bGUgMi4x
LCB3aGljaCBzdGF0ZXM6DQo+ICJBIHByb2plY3Qgc2hhbGwgbm90IGNvbnRhaW4gdW5yZWFjaGFi
bGUgY29kZS4iIFRoaXMgaXMgZHVlIHRvIHRoZSB1c2Ugb2YNCj4gdGhlICdCVUcoKScgbWFjcm8s
IHdoaWNoIGNhdXNlcyB0aGUgZnVuY3Rpb24gdG8gbmV2ZXIgcmV0dXJuLg0KPg0KPiBUaGlzIGJl
aGF2aW9yIGlzIGludGVudGlvbmFsIGFuZCBzYWZlIHdpdGhpbiB0aGUgc3BlY2lmaWMgYnVpbGQg
Y29uZmlndXJhdGlvbg0KPiBkZWZpbmVkIGJ5ICdDT05GSUdfSEFTX0lUUycuIFRoZSAnQlVHKCkn
IG1hY3JvIGhhbmRsZXMgaXJyZWNvdmVyYWJsZSBlcnJvcg0KPiBjb25kaXRpb25zIHdoZXJlIExQ
SXMgbXVzdCBub3Qgb2NjdXIgd2l0aG91dCBhbiBJVFMgZW5hYmxlZC4NCj4NCj4gQSBTQUYgY29t
bWVudCBoYXMgYmVlbiBhZGRlZCB0byBkb2N1bWVudCB0aGUganVzdGlmaWNhdGlvbiBmb3IgdGhp
cyB2aW9sYXRpb24sDQo+IHN0YXRpbmcgdGhhdCBpdCBpcyBzYWZlIHdpdGhpbiB0aGUgY29udGV4
dCBvZiB0aGUgWGVuIHByb2plY3QuDQo+DQo+IFNpZ25lZC1vZmYtYnk6IERteXRybyBQcm9rb3Bj
aHVrIDxkbXl0cm9fcHJva29wY2h1azFAZXBhbS5jb20+DQo+IC0tLQ0KPiBUZXN0IENJIHBpcGVs
aW5lOg0KPiBodHRwczovL2dpdGxhYi5jb20veGVuLXByb2plY3QvcGVvcGxlL2RpbWFwcmtwNGsv
eGVuLy0vcGlwZWxpbmVzLzIwNzA0NTU3MTcNCj4gLS0tDQo+ICAgZG9jcy9taXNyYS9zYWZlLmpz
b24gICAgICAgICAgICAgICAgICB8IDggKysrKysrKysNCj4gICB4ZW4vYXJjaC9hcm0vaW5jbHVk
ZS9hc20vZ2ljX3YzX2l0cy5oIHwgMSArDQo+ICAgMiBmaWxlcyBjaGFuZ2VkLCA5IGluc2VydGlv
bnMoKykNCj4NCj4gZGlmZiAtLWdpdCBhL2RvY3MvbWlzcmEvc2FmZS5qc29uIGIvZG9jcy9taXNy
YS9zYWZlLmpzb24NCj4gaW5kZXggMzU4NGNiOTBjNi4uNGMyMjdjMWU4YiAxMDA2NDQNCj4gLS0t
IGEvZG9jcy9taXNyYS9zYWZlLmpzb24NCj4gKysrIGIvZG9jcy9taXNyYS9zYWZlLmpzb24NCj4g
QEAgLTEyNCw2ICsxMjQsMTQgQEANCj4gICAgICAgICAgIH0sDQo+ICAgICAgICAgICB7DQo+ICAg
ICAgICAgICAgICAgImlkIjogIlNBRi0xNS1zYWZlIiwNCj4gKyAgICAgICAgICAgICJhbmFseXNl
ciI6IHsNCj4gKyAgICAgICAgICAgICAgICAiZWNsYWlyIjogIk1DM0EyLlIyLjEiDQo+ICsgICAg
ICAgICAgICB9LA0KPiArICAgICAgICAgICAgIm5hbWUiOiAiUnVsZSAyLjE6IFVucmVhY2hhYmxl
IGNvZGUiLA0KPiArICAgICAgICAgICAgInRleHQiOiAiSXQgaXMgc2FmZSBiZWNhdXNlIHRoZSBC
VUcoKSBtYWNybyBpcyBpbnRlbnRpb25hbGx5IHVzZWQgdG8gdGVybWluYXRlIGV4ZWN1dGlvbiB3
aGVuIExQSXMgYXJlIGVuYWJsZWQgd2l0aG91dCBhbiBJVFMuIg0KPiArICAgICAgICB9LA0KPiAr
ICAgICAgICB7DQo+ICsgICAgICAgICAgICAiaWQiOiAiU0FGLTE2LXNhZmUiLA0KPiAgICAgICAg
ICAgICAgICJhbmFseXNlciI6IHt9LA0KPiAgICAgICAgICAgICAgICJuYW1lIjogIlNlbnRpbmVs
IiwNCj4gICAgICAgICAgICAgICAidGV4dCI6ICJOZXh0IElEIHRvIGJlIHVzZWQiDQo+IGRpZmYg
LS1naXQgYS94ZW4vYXJjaC9hcm0vaW5jbHVkZS9hc20vZ2ljX3YzX2l0cy5oIGIveGVuL2FyY2gv
YXJtL2luY2x1ZGUvYXNtL2dpY192M19pdHMuaA0KPiBpbmRleCBmYzVhODQ4OTJjLi42NzJkYWU3
YWMzIDEwMDY0NA0KPiAtLS0gYS94ZW4vYXJjaC9hcm0vaW5jbHVkZS9hc20vZ2ljX3YzX2l0cy5o
DQo+ICsrKyBiL3hlbi9hcmNoL2FybS9pbmNsdWRlL2FzbS9naWNfdjNfaXRzLmgNCj4gQEAgLTIy
OSw2ICsyMjksNyBAQCBzdGF0aWMgaW5saW5lIHVuc2lnbmVkIGludCB2Z2ljX3YzX2l0c19jb3Vu
dChjb25zdCBzdHJ1Y3QgZG9tYWluICpkKQ0KPiAgICAgICByZXR1cm4gMDsNCj4gICB9DQo+DQo+
ICsvKiBTQUYtMTUtc2FmZSAqLw0KPiAgIHN0YXRpYyBpbmxpbmUgdm9pZCBnaWN2M19kb19MUEko
dW5zaWduZWQgaW50IGxwaSkNCj4gICB7DQo+ICAgICAgIC8qIFdlIGRvbid0IGVuYWJsZSBMUElz
IHdpdGhvdXQgYW4gSVRTLiAqLw0K

