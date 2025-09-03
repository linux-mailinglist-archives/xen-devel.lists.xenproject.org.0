Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 43039B412D2
	for <lists+xen-devel@lfdr.de>; Wed,  3 Sep 2025 05:14:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1107734.1458010 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1utdxH-0002dL-Sj; Wed, 03 Sep 2025 03:14:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1107734.1458010; Wed, 03 Sep 2025 03:14:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1utdxH-0002ai-PJ; Wed, 03 Sep 2025 03:14:39 +0000
Received: by outflank-mailman (input) for mailman id 1107734;
 Wed, 03 Sep 2025 03:14:38 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=4MrA=3O=amd.com=penny.zheng@srs-se1.protection.inumbo.net>)
 id 1utdxG-0002ac-8d
 for xen-devel@lists.xenproject.org; Wed, 03 Sep 2025 03:14:38 +0000
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on20622.outbound.protection.outlook.com
 [2a01:111:f403:2412::622])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1cf8b2fc-8874-11f0-9809-7dc792cee155;
 Wed, 03 Sep 2025 05:14:35 +0200 (CEST)
Received: from DM4PR12MB8451.namprd12.prod.outlook.com (2603:10b6:8:182::7) by
 DM4PR12MB6232.namprd12.prod.outlook.com (2603:10b6:8:a5::7) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9073.27; Wed, 3 Sep 2025 03:14:29 +0000
Received: from DM4PR12MB8451.namprd12.prod.outlook.com
 ([fe80::b04e:2da5:7189:4c4d]) by DM4PR12MB8451.namprd12.prod.outlook.com
 ([fe80::b04e:2da5:7189:4c4d%7]) with mapi id 15.20.9052.019; Wed, 3 Sep 2025
 03:14:29 +0000
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
X-Inumbo-ID: 1cf8b2fc-8874-11f0-9809-7dc792cee155
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WxAwGY0JVmx1t9w6esGLnhpOJlKt/CE4IY60921/uYCzxfOzB7EJ58f3kRzMVjYn5TSkWYd2bmHSKpcmTS5pDiOG5s+XWosn+MUTvQk/gmTcABuvLovwMK07AKHk1Y7hb109/w3Szxv5iVYsKDmW4iqYs/bWK1oMdpSFNrRgO6fcx2UxbubaI2M3YKWxsxTcHfUs093TmZCioUrb9YEaALw+IXBBbgzSU33xU2Gtf98lid/iLjvpgDktH5zgQfGEDmnc4JJcl2Kxs5Ml3T/b9aAxFJst8u7NPVpDWl3hyPFCNnzu8zWoqxv1SY5DyI2/tMewPyRBM8UihmXK/kIJrA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BAK7DeDIBY+h+qJnlFV1ONcfRP4n13DLZB6paRwZT9k=;
 b=X1DoNasP6LqHOYnlGRKx6EquvB3vHAd0bbCbG2H8Dxd1A41pendeFXLLCWraYZt4BX/3Tq1BFLh5CF6Lw8ynpvzat1Ul0E7rVSPhThEG7R0FdQgmTs45zP/BAwErcPVMWZjJSO1Iba12ryz6MqoyZh39IJDwhoEEm+gQNRESSP6mWczS7IXI3uCVzFhROvg/c/GFwrCq+QFKzD+ohkmnTqpwpNXxpZuXbKdpKK/6jR/L4OS5trFmbEUCgj9RNBOUmi6mpRmWzQdARFuYvMmCWFCAzH8XkqizSX/TI2q1nRg36jsuWcjjXxFqDtJFnpsxfU5r+KkNX4kexVLZaTpOGQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BAK7DeDIBY+h+qJnlFV1ONcfRP4n13DLZB6paRwZT9k=;
 b=aYq7jVYjOc4W0I8M5jeWVV0gxD9ZoI+VRJXQf1IyETbS9L5jn1r981x9Zn4XRdWHYKLhTLUR09buL1D4DwAGk5ZJeqv4/ExXFiWiYU9e7PXifXS6d9SQZ9Y0h2WwJaXXjkbZ6teMTisgMEZa7dINnJonKh+pHv9byxp1i1DDLfg=
From: "Penny, Zheng" <penny.zheng@amd.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "Huang, Ray" <Ray.Huang@amd.com>, Anthony PERARD
	<anthony.perard@vates.tech>, Andrew Cooper <andrew.cooper3@citrix.com>,
	=?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: RE: [PATCH v8 8/8] xen/cpufreq: Adapt SET/GET_CPUFREQ_CPPC
 xen_sysctl_pm_op for amd-cppc driver
Thread-Topic: [PATCH v8 8/8] xen/cpufreq: Adapt SET/GET_CPUFREQ_CPPC
 xen_sysctl_pm_op for amd-cppc driver
Thread-Index: AQHcGANplGdEMGicVkezx0Fs9samVLR357kAgAjockA=
Date: Wed, 3 Sep 2025 03:14:28 +0000
Message-ID:
 <DM4PR12MB8451C7146814C9C359B078B5E101A@DM4PR12MB8451.namprd12.prod.outlook.com>
References: <20250828100601.1777197-1-Penny.Zheng@amd.com>
 <a855a0b4-21dc-4f63-9849-6e5c7ec2e6b3@suse.com>
In-Reply-To: <a855a0b4-21dc-4f63-9849-6e5c7ec2e6b3@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
 MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Enabled=True;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_SetDate=2025-09-03T03:14:22.0000000Z;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Name=Open
 Source;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_ContentBits=3;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Method=Privileged
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR12MB8451:EE_|DM4PR12MB6232:EE_
x-ms-office365-filtering-correlation-id: 9a585bfa-c7d2-4035-70cd-08ddea97fea8
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|376014|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?dHV0NEVOc3pCdTQyTFh4b011L0RCSG9PeDI1dFFDRmpYaFcrTE1ra0ZJcXdQ?=
 =?utf-8?B?aExxMVc0bnM5aGlmaDV5aTNENlBjNmlhOHBaZ01TcXF5VXJSbHlCOW9jeWpa?=
 =?utf-8?B?VzZhdnpuT2xhMms5OCtKMjB5RTEwQ0NzcmNXREdsbkhDclFLcjFkbHdNRk81?=
 =?utf-8?B?ZVhmdzdRb0MramRkd0JZYURPSDBoVDYwRXNSelBUTDB2R0NHNVNiZENUVCti?=
 =?utf-8?B?UEg2NUNldzRibXpia1dsNThtOFlTY1MwM1hQei92dTl3cnBsN0JBQzdidVAx?=
 =?utf-8?B?aUF0bW5lVnN3VjVIa3JDaklZdUJYK0tqOHBGeUhDR1ZmcGFybUVQS1VsVG1Q?=
 =?utf-8?B?TDJnVXZzVzZsZGE3azdiR1Q4UUh4MUxkWlBGNElBRnB1bUhWNE5OL2orOTJk?=
 =?utf-8?B?WE9Xa2dDa05aTFR2VzZ1OFU4UVFtZ2xqYXQzSGdubGZyYTE1TFR3N01mZUx0?=
 =?utf-8?B?R1M1bFE3NlN4NStPNURyOTlYOVlZM05rbzRRWnBKWHNmNjlvOXVkamJWc0pm?=
 =?utf-8?B?L3FWeE9rdDJ2T0V4SWNRbDd1RmZFTVFZQzMxNWtFeDR2TjhjdHJsMDBnTmxK?=
 =?utf-8?B?ZkRHOEVkUUFiTE9LSlZneHVVSEgwS0VlQks0TFRyLzFvbjBrWkw0R1laaDBl?=
 =?utf-8?B?YVV1WmVvK1V0a3lWdkp6azg3OVlkUTU2VktxMWtJWW1neTRTMEJxbStjTUhP?=
 =?utf-8?B?Sk1sSjZXb0oxNVo3UnBtWi9BVHFVd2dkbDRNMWFXTEhxcFZxbk9DSmRYSVEy?=
 =?utf-8?B?Z0JBOEZlY1dIR0FpTXlmWUN3QWRjNzhqOHNycWtPZ0I1WnI0RXBiSGRyMlNq?=
 =?utf-8?B?eTA3R0diVHJuVXJEN1gyM1Bsem15d1RJVFhMTzVoQjdzU0lPTEdmWXM3RndW?=
 =?utf-8?B?bG4waGRESmJWVFlqaXAzb1FNcW82bWxwaG1EN2pWcHZycHFxTTlETkNvUEx6?=
 =?utf-8?B?SUhzMnlGZU1RVTF2VjNjcCtialM1c0xvcDFiSWs4WWpITGZxVFBIbEJwb0Zz?=
 =?utf-8?B?eTBkTUQ4cm54NHVMMy9WeTJSM29wbUNQVmhIbldGaDVSWis5VnNMeXVDVHkv?=
 =?utf-8?B?VW05OUdsK2hHbEFxQ1RmNUZDN0ZWcjcrOVhWb1hIY2hnSUhKNWlkVlc5aU1h?=
 =?utf-8?B?NC83YXJzM0liT0IwQXA3VUt4cWxCbHhZQTBpYkFtNmg5SWJabE8ybjFFOTEx?=
 =?utf-8?B?SU1FYmk5MVNlNk9OQkRNeWxCU0M1LzhUc1lKZ3VlYmdxSVNQM2g1alMraEVz?=
 =?utf-8?B?VG52MkZySDVkSFh4OHBLbkd3c1VJR1d0dS9QMWh4czNzZnVCb0JMYmI3OHQr?=
 =?utf-8?B?R1lhSEkwT1lUQWZkaHVPNWlGTCthNURLQm9PMjRoa1NmUEIxcDA1QVlzWWNn?=
 =?utf-8?B?L29ZWXhvSnF1SG1jWnhnY1Z0YzVtWlVScldoQXpCb1FGZUhYdlR2aVduVWNJ?=
 =?utf-8?B?ZkJPRjV4ZUZnMEtrVC8yNUdUckM5aGJWQjVqMTgwYS9qOE5ZYkhreTVvWWty?=
 =?utf-8?B?aGcrbHdNcTB2alpQN2xUS2VHeVBSR1lMYUhFUkdBYTI5dytFbUt3OE9nb0s5?=
 =?utf-8?B?NzBVaWN6bDBQdjJiWjE1bTN4SEt2V2NvYzU2eXdMWFptNUVZMWpJUnhwRjVj?=
 =?utf-8?B?S1lia2hBUnFxQ1ZZMEhaeml1MmJBUVpiTE5jOW5YSzVEQml6dy9IdlhEVkFZ?=
 =?utf-8?B?WWQ3NWw3TEg2TnZvcXp3VXdYSUpWZGx5c3RmSXB0eW1ZZ25iRk5USms3dDJ5?=
 =?utf-8?B?Y3d0OFZmSHoxNzVNQ0xYeVBSNmhCR3RlTnUvSHIzaVE1a1ZHY08zWVN1RjhJ?=
 =?utf-8?B?MmtDTFRjVy9oMjhDVzVSNEIyNCt3aTg0RytoY2IvQjVOMkdRVTZqM2pJNXZn?=
 =?utf-8?B?OWRqYTlyQ2oycDQ3a0NUS0Y5QXp6blhIY1kvY29UajZ5em00eFFuTElPNVJu?=
 =?utf-8?B?Lysxa21UUVhMSXNhN2xXV203NmhuV3ZVZDFjR25HU3o1QmViTmxFbGlSQmFM?=
 =?utf-8?B?T3pZSmsvdHN3PT0=?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR12MB8451.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?MHRCRFlWMHdFbFh6Y3BSdElKbzlYczdGRmpNcTRSWE9iUjNuNUpaR3ZybjFM?=
 =?utf-8?B?d0VtcHJqb0pHdFg5NEFxOXFMQUJDVGpGUnkza0lUNzRFWlhjTk11a1JjTURG?=
 =?utf-8?B?aG9vMTB0YmhyTVFBU05BRHRaZVVrOWJYeDk2K1crLzFmQVd5cnBScU9UTGZl?=
 =?utf-8?B?aExXUFRBUlpWdHpGN1pSdk1ZR01ueTFxb2xOZzhrWk9MRlpncXh3NmVLMWhZ?=
 =?utf-8?B?VmpkRUdnd2VzZUtMckZCd0tUMXhyNGZJSDFtTjV2bUhkajRoQU0vc1Q4d3FD?=
 =?utf-8?B?UGR4cG14MEg0T2ZXcUFnb1dLNmVPTU5ETEk5dUE0NEF3bnNXYjhxODlpSnJI?=
 =?utf-8?B?ZDRwSkF4d2h0Q1BIKyt2empndDRROHBMWXIzZllsSVZsb3ZwcGtmRldwTUNT?=
 =?utf-8?B?TXYvblo2M0Y4bHQ0MDhlbGdtTksrbks3ekFVbXZCczlpbndDc3k2SWdCcXNk?=
 =?utf-8?B?UWtHV1QwN1VGV3dRQWxQSnVtVjRwdnRHcVd3TTFMY012czRXVm1QN2hUSWND?=
 =?utf-8?B?WDcxUVB3bjlxNHlNVjU1ODFTRkhuVFFzTm0rb2pOVklCSUdGSVR6MEREeXNL?=
 =?utf-8?B?eEwvWUZjSGhidEJTcTkyNGFWc2ZwWDFodUw3bHpOczJTNDhRL2d2TFZtR1Ev?=
 =?utf-8?B?NGhzVG1xanErZ0Z1aFFQLythOFpHNE9aWEZndG8yYVQzYUVXczJRQVh2dnJt?=
 =?utf-8?B?NXJEc3VJOHMvNFhrTmF6Tks4ZStFdEVVM2hyZCtJNlJiL0t5SGRIbjNZckZS?=
 =?utf-8?B?Zm9xN1NZNGd6OHc0bWVVWEdDQW5RdmVsNjMxMmpjdDA3MllrV0dlMENSa2Zp?=
 =?utf-8?B?ckFiQ0M3VWo5dGRJYTNDQXdlNEJ6Q1FEUHhIdnI4d2dKM3dVRG13TFVsVmtN?=
 =?utf-8?B?allSeXBleUhqelhRQVpMV0k3SUFMeE9WUm9pVkp4Mk1Xelg3MHRIeXFLWGV1?=
 =?utf-8?B?Vzljd2w1MW8yd2d3dW5vcllkR0xvd05xNUdXWjc1cHdsUlFIQWNMK01PSnhI?=
 =?utf-8?B?Q2JnWXNGL2thNWZpTFpxQjhVckZ6ZGV6R0JpUERyZHZVemtCY0ZwdzlEZ00y?=
 =?utf-8?B?bmE0UFgyd1hSTXZuMFNGRHBPUW9tRDVzemxxcmozU2RDQmcyd2VpYWNQTVNF?=
 =?utf-8?B?T1h1SFBtZ2c3QkptdkxFdFMrb1YrWUNaQ2lrKzVVUlBxeUlGMEx5R3RsVDM4?=
 =?utf-8?B?bFRVc1FLM0RPU1o1NmlxNEErRERCWGs3dm9sQkt5ZGYvNFVhL0VTbHRHYnlW?=
 =?utf-8?B?K3U1WGN3TkdLRWFwd2hxUkdjM05tWUVYa0poenFDTmxsN3NnRmhJQTlpWm5m?=
 =?utf-8?B?Q0tnV1Ntd05jVVl4M0RjNXBJL25mR2pTeEJKZWI4SEpwQ1RsY2R5QVZGbUw2?=
 =?utf-8?B?blg4VzcwRncvY2grN3lzV3F3WWN3aTgvc3M1T2NkdmYyckN1S2daLzBzeUh0?=
 =?utf-8?B?Z1hwMXlrTEpCYU95c0hnc0ZaeDl1QWFkb25lTnlCdEZrRGlDR21sc0lzbnJV?=
 =?utf-8?B?M0licSszQUMvaGFoRms4WDcrVlUyc3R1d29vcUFyakFuK2FiVGVXK1lhR2ZY?=
 =?utf-8?B?NDJSV0E4NDlscC82cHJzWnhHWmY3a3VBUGhEU3l0ZnNxb0xOVkhDK0ZlWTll?=
 =?utf-8?B?YndjRW9xQVFKS0hRUkZveTBjcUNYdUdLNG1OdWUzRklXcG01OTBuNHF5YWd4?=
 =?utf-8?B?OHJGNGRwVUFqUlVXVXV5d21RMXAwMk5PdXdBMTlsYWVUQzBSTkN4NW03Q1ZS?=
 =?utf-8?B?c1pOWm1vY3NmMmsvblFVTGFWUm9INy9PYTAwZXdrNGQwczFlQk40RmYrZVFD?=
 =?utf-8?B?aGxpWEoyQWZjM2Q5S0hFQmxuN3ZNN2kzK3JBem5GN1czZU5BQ0JkYmpvSGp1?=
 =?utf-8?B?b0JFb2p6T2VUcUxhTUFHd3hrWnpOTmZJK05pWDQxRjRkNEFNdlkvMDdOZHRN?=
 =?utf-8?B?U0lGeThDdkprWjRRYXdzdHNpekpyWEowSktZbmh1Tm5xRlIrcGhnSE9QM0JN?=
 =?utf-8?B?NW1SaGQ0WlZPcFAzS1o0R25mNGNPb0N3eHZ0MlJ5dTVDYUlabDhrQkRWaWU4?=
 =?utf-8?B?WHJaWFM0RHNkVmpxK1ExTFErY0sxMnZTbVBXa0ZrdUlBYmdBdEg1VVRqZVlv?=
 =?utf-8?Q?yoX0=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB8451.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9a585bfa-c7d2-4035-70cd-08ddea97fea8
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Sep 2025 03:14:28.9819
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: xVS6a0FxeWkvJ2/CWs+W8Dd+UhVAYjZz0yT5TFfJZ6sOFCGWA7wb7Y9Etm5qg58mm1TObIQWH10i6rDcQLwI8Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6232

W1B1YmxpY10NCg0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBKYW4gQmV1
bGljaCA8amJldWxpY2hAc3VzZS5jb20+DQo+IFNlbnQ6IFRodXJzZGF5LCBBdWd1c3QgMjgsIDIw
MjUgNzowNyBQTQ0KPiBUbzogUGVubnksIFpoZW5nIDxwZW5ueS56aGVuZ0BhbWQuY29tPg0KPiBD
YzogSHVhbmcsIFJheSA8UmF5Lkh1YW5nQGFtZC5jb20+OyBBbnRob255IFBFUkFSRA0KPiA8YW50
aG9ueS5wZXJhcmRAdmF0ZXMudGVjaD47IEFuZHJldyBDb29wZXIgPGFuZHJldy5jb29wZXIzQGNp
dHJpeC5jb20+Ow0KPiBSb2dlciBQYXUgTW9ubsOpIDxyb2dlci5wYXVAY2l0cml4LmNvbT47IHhl
bi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZw0KPiBTdWJqZWN0OiBSZTogW1BBVENIIHY4IDgv
OF0geGVuL2NwdWZyZXE6IEFkYXB0IFNFVC9HRVRfQ1BVRlJFUV9DUFBDDQo+IHhlbl9zeXNjdGxf
cG1fb3AgZm9yIGFtZC1jcHBjIGRyaXZlcg0KPg0KPiBPbiAyOC4wOC4yMDI1IDEyOjA2LCBQZW5u
eSBaaGVuZyB3cm90ZToNCj4gPiBAQCAtMTU0LDYgKzE1NiwxNyBAQCBzdGF0aWMgaW50IGdldF9j
cHVmcmVxX3BhcmEoc3RydWN0IHhlbl9zeXNjdGxfcG1fb3ANCj4gKm9wKQ0KPiA+ICAgICAgZWxz
ZQ0KPiA+ICAgICAgICAgIHN0cmxjcHkob3AtPnUuZ2V0X3BhcmEuc2NhbGluZ19kcml2ZXIsICJV
bmtub3duIiwNCj4gPiBDUFVGUkVRX05BTUVfTEVOKTsNCj4gPg0KPiA+ICsgICAgLyoNCj4gPiAr
ICAgICAqIEluIENQUEMgYWN0aXZlIG1vZGUsIHdlIGFyZSBib3Jyb3dpbmcgZ292ZXJub3IgZmll
bGQgdG8gaW5kaWNhdGUNCj4gPiArICAgICAqIHBvbGljeSBpbmZvLg0KPiA+ICsgICAgICovDQo+
ID4gKyAgICBpZiAoIHBvbGljeS0+Z292ZXJub3ItPm5hbWVbMF0gKQ0KPiA+ICsgICAgICAgIHN0
cmxjcHkob3AtPnUuZ2V0X3BhcmEudS5zLnNjYWxpbmdfZ292ZXJub3IsDQo+ID4gKyAgICAgICAg
ICAgICAgICBwb2xpY3ktPmdvdmVybm9yLT5uYW1lLCBDUFVGUkVRX05BTUVfTEVOKTsNCj4gPiAr
ICAgIGVsc2UNCj4gPiArICAgICAgICBzdHJsY3B5KG9wLT51LmdldF9wYXJhLnUucy5zY2FsaW5n
X2dvdmVybm9yLCAiVW5rbm93biIsDQo+ID4gKyAgICAgICAgICAgICAgICBDUFVGUkVRX05BTUVf
TEVOKTsNCj4NCj4gSXNuJ3QgcHVsbGluZyB0aGlzIC4uLg0KPg0KPiA+ICAgICAgaWYgKCAhY3B1
ZnJlcV9pc19nb3Zlcm5vcmxlc3Mob3AtPmNwdWlkKSApDQo+ID4gICAgICB7DQo+ID4gICAgICAg
ICAgaWYgKCAhKHNjYWxpbmdfYXZhaWxhYmxlX2dvdmVybm9ycyA9DQo+DQo+IC4uLiBvdXQgb2Yg
dGhpcyBpZigpJ3MgYm9keSBnb2luZyB0byBhZmZlY3QgSFdQPyBJdCdzIG5vdCBjbGVhciB0byBt
ZSB3aGV0aGVyIHRoYXQgd291bGQNCj4gYmUgZW50aXJlbHkgYmVuaWduLg0KPg0KDQpIV1AgaGFz
IGl0cyBvd24gdW5pcXVlICJod3AiIGdvdmVybm9yLiBTbywgaW1vLCBpdCBtYXkgbm90IGFmZmVj
dC4NCg0KPiBKYW4NCg==

