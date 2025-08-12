Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 40BB8B21FB5
	for <lists+xen-devel@lfdr.de>; Tue, 12 Aug 2025 09:41:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1078341.1439329 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uljct-00046z-Ao; Tue, 12 Aug 2025 07:40:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1078341.1439329; Tue, 12 Aug 2025 07:40:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uljct-00045W-5a; Tue, 12 Aug 2025 07:40:55 +0000
Received: by outflank-mailman (input) for mailman id 1078341;
 Tue, 12 Aug 2025 07:40:54 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=54Z7=2Y=amd.com=penny.zheng@srs-se1.protection.inumbo.net>)
 id 1uljcr-00045L-Sd
 for xen-devel@lists.xenproject.org; Tue, 12 Aug 2025 07:40:54 +0000
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2062e.outbound.protection.outlook.com
 [2a01:111:f403:2412::62e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a905cbd6-774f-11f0-b898-0df219b8e170;
 Tue, 12 Aug 2025 09:40:48 +0200 (CEST)
Received: from DM4PR12MB8451.namprd12.prod.outlook.com (2603:10b6:8:182::7) by
 CY5PR12MB6527.namprd12.prod.outlook.com (2603:10b6:930:30::13) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9009.22; Tue, 12 Aug 2025 07:40:42 +0000
Received: from DM4PR12MB8451.namprd12.prod.outlook.com
 ([fe80::b04e:2da5:7189:4c4d]) by DM4PR12MB8451.namprd12.prod.outlook.com
 ([fe80::b04e:2da5:7189:4c4d%7]) with mapi id 15.20.9009.018; Tue, 12 Aug 2025
 07:40:42 +0000
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
X-Inumbo-ID: a905cbd6-774f-11f0-b898-0df219b8e170
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=x9fm/B2ZS/EPiJt0RKoqP4BfKQxOnPt+AUbmnjdnHg5j2OnziWK3CiEvBMRbBL210eBRdwRUSGlOjOv65CDx+WvSondFw3w1t8X4lb4qPzUKCm9OFtzxEVpgTT9o+RKFfzgomSiUCXDPc7VaJPEqdYHZ0J84UXSDuxnU7N1mXFBQWTj9lsctLxVSG5DJGj13tCQqu2zC1JRiAXGotztOfncDV9JbJk2KSsdFxwBCBVujV/Ct2F+ElSIWojaHhwtIieUES8yZRdxbtdmRB2myxCvHOGTL9vAY0DONW6of8p7FLTku+Nxn/J1GckB6GP7TTqxTYma0+ID8DDO6v757MQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=94GFRl6vDBzhaG+VQ56YZWeSzXoVvOZFtuq3AOheERw=;
 b=d/yUqokR6DIRvvfj9TbE0rAenWBAHOP0utSEnVDHQJCWIAZ63uv+gSJpdtFVAk1XjHs4HUV0NSNlctV/biGIm8v2oU2PIszN6DixSxqFPacCXMOKSVvq2LnwgLzobKJvFOIzDwC3dmv+izKJIfDUioOn0ZHZIHs3AFM+ON4jbi7/1RZCMe7UefXXetUaxLrY03cXeocdQy37gS8QThF75S8fV7LTDe5zj7HikqkfeNKcWebdiNqa+0m2I36O1YC33fnh8rjbDfvom03wF50cDs/hOMR9qoM8xSTQVkQZ0IXeIw5PlTbvTnMGR/xnu5w/0rxqiXXDN79D6MjLZ7y1Fw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=94GFRl6vDBzhaG+VQ56YZWeSzXoVvOZFtuq3AOheERw=;
 b=SqelxCnu7bAFCDWq+ErYChnl2MQ6lUcyDN8ncCBl0vViVEfoWOdlViOy2o6CiBPJBhnBpHneaT2U7EH4/Vx4Y45DWqPSfHQmWyiC1e/Nu3uukW3jmK68WVvvwJEIvqhgQIjlo71A8gGR5JzVMtnX3a4FTIUV3sF9RaTpNBLt/Zo=
From: "Penny, Zheng" <penny.zheng@amd.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "Huang, Ray" <Ray.Huang@amd.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>,
	"Orzel, Michal" <Michal.Orzel@amd.com>, Julien Grall <julien@xen.org>,
	=?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>, Stefano
 Stabellini <sstabellini@kernel.org>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
Subject: RE: [PATCH v6 13/19] xen/x86: implement amd-cppc-epp driver for CPPC
 in active mode
Thread-Topic: [PATCH v6 13/19] xen/x86: implement amd-cppc-epp driver for CPPC
 in active mode
Thread-Index: AQHb8hcniovO//xAlkude/GkR6xpVbQ2WzUAgCh1DAA=
Date: Tue, 12 Aug 2025 07:40:42 +0000
Message-ID:
 <DM4PR12MB8451095ABD4E238701839776E12BA@DM4PR12MB8451.namprd12.prod.outlook.com>
References: <20250711035106.2540522-1-Penny.Zheng@amd.com>
 <20250711035106.2540522-14-Penny.Zheng@amd.com>
 <cc8f85f6-8c22-411a-bcba-085cf51defb3@suse.com>
In-Reply-To: <cc8f85f6-8c22-411a-bcba-085cf51defb3@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
 MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Enabled=True;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_SetDate=2025-08-12T07:40:34.0000000Z;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Name=Open
 Source;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_ContentBits=3;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Method=Privileged
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR12MB8451:EE_|CY5PR12MB6527:EE_
x-ms-office365-filtering-correlation-id: 3df246a0-0570-4f1d-6809-08ddd9738a89
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|376014|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?VFJmMjByUlZjMHpMSFYrSjNxWFN1ZUpIeDJjeFJQRVB5U2c5MDU2NmhZTDNQ?=
 =?utf-8?B?NGQ0QUViQ2dlWUdweW96MUp3ZmRsKzdBVGVkVE1yRTFlcCtQT2h0dnRpWkp2?=
 =?utf-8?B?N2JBdjJPbm05TTAzVTlTcWFiTFc2NHhmNHg1NXNkNFYzckt2NEFWbkFoWjVj?=
 =?utf-8?B?UlV1SUFaTGdqbkdmQTRZazdLZmJjbForcldPUVhLNUdWTVN1OUE3YnVCRVg3?=
 =?utf-8?B?WG9ERy93YUw1NVRwbGQ5V1pkaGVjRk5OUUp3SUJuOWU0UEFaRFlPMG5ZbEc4?=
 =?utf-8?B?eGhpT0FoYldOTlFxZmVIWER6RjB1Y0YyTWo5MEpvSzVKTHJnQ2VScUd2SGhV?=
 =?utf-8?B?Q2p6cUxIbUdmbFlOSEhnNElYMlN0UXJoelVzUEdHaDVDUkJCaFdLQkFCdzhl?=
 =?utf-8?B?WmswNGdBYWYrUnpUMmpFTzJTZ3JrVTE2dlFXeFNFTlBEZ3pRQnRUL0wxTDhk?=
 =?utf-8?B?VnF3OE1sUFNaNUtQVENLeXg0R3NpTzg1bTUwZ1Y5VnZ2SDM0NG8xQzUwRzMw?=
 =?utf-8?B?eG1EeXZGMXRhWkVWRFhSdXMvUEVSOWRjamE4S1Z1V3piYmhZV0Q3ZVJuZzVI?=
 =?utf-8?B?ZXVnK1hJQzZVcjJpS2xBaWp5RU5pYzNQZnBMK3NrTzkrMTRNQVhvdUtPcXVL?=
 =?utf-8?B?eU81ME1rQkZFOURiRkdITHE4Z3VDSU9TWkRLNDdoVFVyZU9BWkdubVVHSWYy?=
 =?utf-8?B?RElzT1NueFZHbmdtR1NXdzNBV0FJZ0Vodk9zQlNScXV3dnN2MGVtN0k1cjAx?=
 =?utf-8?B?N1VBMzA5aVpieDA1bnE5V3VqNUlMUEh4cnA0NC9uV3cxWjZMc3pBWGtxdUt3?=
 =?utf-8?B?UjBuaEpQZm9GT21SMk9ibFByMHJJOTZTdzV5L0ZtR2hZZ0poVnNpWktPUE9y?=
 =?utf-8?B?UDA4RWlsNWJYcTZJcUhrRjZpT3A1aGl5c1Q2YU1qWE1GRjZXSFJRcmdUTTRN?=
 =?utf-8?B?eVJTR0d1S1BkQzRjNFcva3dSWmN1SnRhYUZ1YXA2ZXc3V3RjREtiS3lPZXpp?=
 =?utf-8?B?RGZuTW5JRUhUdkZ4Zkg2blMxMlA3MlZrTm5XdzlxQ1JLSUxRSmlGQVBWd0Vj?=
 =?utf-8?B?WnoyK2YxbjVMcm00OSt1OWtyQ2dHU2J0ZklCWjFaMDBHNFE5dGo2Q2pLNE4v?=
 =?utf-8?B?NjJiZFJkNWltdFg3Sy9rMkpQYXlNZzdBMEZoWlZyeE93V25oQk1UdGlQeTcx?=
 =?utf-8?B?clBFMVFhQ3MzeDNRbDA0ay9peU9VZ2hWNzZKd0RUUGRLTEpxRHlzd01ZWllK?=
 =?utf-8?B?QjB1TExXZzlxekcxWXBhc2ZSZUcvbDkzMjEzaUVMSWtwTDI3RlRaeWNjVHRw?=
 =?utf-8?B?d3VsZElpY0NnV3lUcW1KMkJ2c084MmxWS1dyMnRJQTFZUHM2M3BwWXdlTGEr?=
 =?utf-8?B?bnF1bjF2dkYrOVRNUk5aQVlyQ2VxenQwdXJoSUcwWGc3Sjc0bCtPQUVQL3RC?=
 =?utf-8?B?UWRWSWZOck42Lzl1eVRyQUxzcm1SOFpiTzY0N1YwdmUwUk9aaWo0UitPbkk2?=
 =?utf-8?B?UDhMcXVXWE5WZnBHVVc2ai9jcFNXQzVLRElWbXIzYXppQ21CR2VVb0k3aEJu?=
 =?utf-8?B?TkczL21XL3dGRnptd3dmSGNDUnZuZEdoN281Vm9qbTl3ZXVueHkwSElZL0Fj?=
 =?utf-8?B?Z2sreFgxVER2UWY1Q0FRZUJHRDZMcTQ2ODZsN0NyMUtpdXg0Qm42czRTY0x2?=
 =?utf-8?B?Qk1USDBKc0hNUHZRTnRXT1JhSnVCeksvU3pXaHJveUU4WGt3TERMcitBd0dw?=
 =?utf-8?B?Tk8yWE4xRFByYmFUNWp5ais0WDdCMEJMZFNlTVppY242WWp4d0Nid3hRRm4z?=
 =?utf-8?B?aTNBNjV5SktMeVRRZFZXZGRyVUhmam1iNk4rN0dNMnlJeHBuV1pMLzAxK0hV?=
 =?utf-8?B?YU5RejRFT0ZrVUpiQm9tVFBRTHFmQjRrU3JSNUhubmszZ2ZrRllqNFh6SDBr?=
 =?utf-8?B?a1hVL0IzRWswYU9PVTdZeDI2cnVEUENIeStQZmU5TDdnTjhiTE1yMkg5eFNh?=
 =?utf-8?Q?sYMoEgXMUGVQUQkvQRy+rDR6fUeR5E=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR12MB8451.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?SEhGVlBZK2tGcUt6ZURzNExjV2xyNWozdWxXcEk5OVQrRGJSekJ3K3dXT1Jt?=
 =?utf-8?B?UkZPY3hZZ1hadzM1a1FtSUZ3NHJQdEtjVWU5dHRteFJlRkxSS0ttNGY5b1hG?=
 =?utf-8?B?N3o0Vk1VbExrbnlNeGZhZzhyWjlLRXZ2anJTUFJrSEw4Zk5oT0NtZ1N4VEFv?=
 =?utf-8?B?S2V5eGtnbG5NaGpTYkd2azJmN0NjTldsQ0YvNU9WU0R2alEvaWV3QnF0Sk9i?=
 =?utf-8?B?ZVdWL2lpVFRXWVF2UTRPRUNuSk1vd0tVMmtGUWcvNEF2N1NORUdZcTlLWWR2?=
 =?utf-8?B?cVVkeitZRmV2OEJVM3AzaFRVQnk1bUZmb0xvc3F1Y2U3TkZLRk1TOFBrc0M1?=
 =?utf-8?B?VWNBU2ZHUlN3NWNZVWlWZWhaemtVSFd0VHVXT3hnODVkRnJFQmNSZFZ0cE5s?=
 =?utf-8?B?MUo2TGVUaHk4SnZidkxPdUE3THpDS3JleXpRSU82ZlU0cHVHdVluNThYbVln?=
 =?utf-8?B?YVppd1FMZ29UNjlIV3ZuMk96V01nS2k4M2R6dzlDUnBEcUtaeGh2di92dU1s?=
 =?utf-8?B?VlJhNGFNQStmY2EzODYyS3JYeGVEQnFjMEI0ZTBScjl0QnU0V0RXdUYxcnVF?=
 =?utf-8?B?akpWcHQ1dG9BZm5XeFkxRU96a1BGb1hwL1plWTJNVDFiN1E4N1ZDWkRqbUgv?=
 =?utf-8?B?ZFVHMGNEOVM5bG5tNFcwa2ZNdjFTWTRjM3orWTJpVjl5TjJWT29DOFJBU3Vm?=
 =?utf-8?B?MVkweGExc2lad1UzN0VRZGlBenJZR0h2TDlRWGZaTVlUQzVqLzU5RVNFam53?=
 =?utf-8?B?V3A2QlB2TEtHTEJLbmMwUC9nSHdQYzExaHYzc3BBWlZEM3N2TGtLbUNuZUFt?=
 =?utf-8?B?SlZidi96TmZ2WE9JQVhzdmpFeW14NDhmckVmT0NZaWFxbXhXWmRCeTI5OTZP?=
 =?utf-8?B?cDM3bk1EZlVtbS9kWmdqYzdGY1d0eGdvNGFiK3hmQUZvT284c0RTWUpyVkl0?=
 =?utf-8?B?OXhvTnJjUDlRRmhZdk1lMkhUbURiMXFTVlRBQkE3S2lFb1pyVDFkTEhxUi9E?=
 =?utf-8?B?VmMxeFlJTnhoSnhXOHRVaVVoU3ZNYnNqZHc0L3pOUCtjM3dGemFxeUVreC9U?=
 =?utf-8?B?VWdGcy9OZGxNaGFlenVJTXptVU9kRklYamlvNElzVENUajZaSnk0UktxbTc5?=
 =?utf-8?B?a0VMYkxsMXNzeHV6Vi83ZzFLeS9YZWlEY2hMNExBcGpicHpTSnRZMnZ5dzA5?=
 =?utf-8?B?RlIxT2NnQTRSZ2lwbHRuNXVPaTc3cjlsQzUrdE9MUk82OC9NVkd3c28wcTd4?=
 =?utf-8?B?VWE1QkJucmxNVnBDQXFCaDZXQ3ZKU3J4bVREOVZJMWxyZy9QM2o5WmhYeHpp?=
 =?utf-8?B?WlV3cVF3alcyODMxMzQzNDVMd2w1bTBETXg1eWJIUGR3OFJrQzRZaWowN1lp?=
 =?utf-8?B?TjJtRTZ5SlRicUd2U2tqK3c4MC9tbVE2NzVLei9GaTdsWFJoc1pFUzBCLzB5?=
 =?utf-8?B?Z0wrVGxoUUhrdDFkalIyajlKYXNoemRyWWZSYjRqa0J2VEc0eHh0d3RKOHBS?=
 =?utf-8?B?eEdhSkt4Y0hkRE1tTG5WZmt0eFc5aGtDYy9HZFpEbXJGMlJNci9CNTdIVmNO?=
 =?utf-8?B?bms1blpwRnBlVFpJWGcyeGtBaGF0SHQ4M3F1d0gvbjEwZ2pmTVBNSHJpK0Rp?=
 =?utf-8?B?REUydVRYVkliSXkyZm1kVUdrZDRpamoyNXRNR0tIUnRDUDZ5Z1FjeE9WSEtu?=
 =?utf-8?B?QWc3d3d5N2xHbXVSZWNEUC9Xa1o3ZjI1SlAxZWNLYTBVeUE4blJQYndtcUpr?=
 =?utf-8?B?QlJSa2xIQkZyVmdHTDVnVHc3V1VIMEpSZGxweEFEZUN2elczdHlZVVZDbVlC?=
 =?utf-8?B?T1ZheHdPdThxeCs1NUUvWmh5SXdLaVNheWR0U1VoVEs2T3NaMHk0VEduMHYy?=
 =?utf-8?B?aUdWdTNuaWVqRjd0Rlc4NGYya1U3QTlwR3M5RXBtWVhaRyt6cDE0b2dUY2VN?=
 =?utf-8?B?a1dqeVI4NmIzWGYzS1JITWVZZ0lzclhlR1JicENHcWxaNkt0ZEw1VXErY3JM?=
 =?utf-8?B?VFJldUdJd01EcjJaWmlZRnI1YWt4ZitFYWRyaGZCb0NqUXZ2Q2ptcXJxbGVU?=
 =?utf-8?B?bDZxMHNsL1cwQnVRcU4zSldRS2wwdlRKRTB5dGpLQUdCQVpZSC93OHhZenNB?=
 =?utf-8?Q?IpjY=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB8451.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3df246a0-0570-4f1d-6809-08ddd9738a89
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Aug 2025 07:40:42.4786
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 8E2I7JTkOFyIs29XrLjs8nN1RR9/WUHehvBGK+4W+iK82/n4SO6s+j7zvjyfAJd1QVYuD2HLjtB7VH/bpJHABA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6527

W1B1YmxpY10NCg0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBKYW4gQmV1
bGljaCA8amJldWxpY2hAc3VzZS5jb20+DQo+IFNlbnQ6IFRodXJzZGF5LCBKdWx5IDE3LCAyMDI1
IDk6MzYgUE0NCj4gVG86IFBlbm55LCBaaGVuZyA8cGVubnkuemhlbmdAYW1kLmNvbT4NCj4gQ2M6
IEh1YW5nLCBSYXkgPFJheS5IdWFuZ0BhbWQuY29tPjsgQW5kcmV3IENvb3Blcg0KPiA8YW5kcmV3
LmNvb3BlcjNAY2l0cml4LmNvbT47IEFudGhvbnkgUEVSQVJEIDxhbnRob255LnBlcmFyZEB2YXRl
cy50ZWNoPjsNCj4gT3J6ZWwsIE1pY2hhbCA8TWljaGFsLk9yemVsQGFtZC5jb20+OyBKdWxpZW4g
R3JhbGwgPGp1bGllbkB4ZW4ub3JnPjsgUm9nZXIgUGF1DQo+IE1vbm7DqSA8cm9nZXIucGF1QGNp
dHJpeC5jb20+OyBTdGVmYW5vIFN0YWJlbGxpbmkgPHNzdGFiZWxsaW5pQGtlcm5lbC5vcmc+OyB4
ZW4tDQo+IGRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnDQo+IFN1YmplY3Q6IFJlOiBbUEFUQ0gg
djYgMTMvMTldIHhlbi94ODY6IGltcGxlbWVudCBhbWQtY3BwYy1lcHAgZHJpdmVyIGZvciBDUFBD
DQo+IGluIGFjdGl2ZSBtb2RlDQo+DQo+IE9uIDExLjA3LjIwMjUgMDU6NTEsIFBlbm55IFpoZW5n
IHdyb3RlOg0KPiA+IC0tLSBhL3hlbi9hcmNoL3g4Ni9hY3BpL2NwdWZyZXEvYW1kLWNwcGMuYw0K
PiA+ICsrKyBiL3hlbi9hcmNoL3g4Ni9hY3BpL2NwdWZyZXEvYW1kLWNwcGMuYw0KPiA+IEBAIC0y
NTksMTEgKzI3NiwxOCBAQCBzdGF0aWMgdm9pZCBjZl9jaGVjaw0KPiA+IGFtZF9jcHBjX3dyaXRl
X3JlcXVlc3RfbXNycyh2b2lkICppbmZvKSAgfQ0KPiA+DQo+ID4gIHN0YXRpYyB2b2lkIGFtZF9j
cHBjX3dyaXRlX3JlcXVlc3QodW5zaWduZWQgaW50IGNwdSwgdWludDhfdCBtaW5fcGVyZiwNCj4g
PiAtICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB1aW50OF90IGRlc19wZXJmLCB1
aW50OF90IG1heF9wZXJmKQ0KPiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
IHVpbnQ4X3QgZGVzX3BlcmYsIHVpbnQ4X3QgbWF4X3BlcmYsDQo+ID4gKyAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgdWludDhfdCBlcHApDQo+ID4gIHsNCj4gPiAgICAgIHN0cnVj
dCBhbWRfY3BwY19kcnZfZGF0YSAqZGF0YSA9IHBlcl9jcHUoYW1kX2NwcGNfZHJ2X2RhdGEsIGNw
dSk7DQo+ID4gICAgICB1aW50NjRfdCBwcmV2ID0gZGF0YS0+cmVxLnJhdzsNCj4gPg0KPiA+ICsg
ICAgaWYgKCAhb3B0X2FjdGl2ZV9tb2RlICkNCj4gPiArICAgICAgICBkYXRhLT5yZXEuZGVzX3Bl
cmYgPSBkZXNfcGVyZjsNCj4gPiArICAgIGVsc2UNCj4gPiArICAgICAgICBkYXRhLT5yZXEuZGVz
X3BlcmYgPSAwOw0KPg0KPiBJbiBhbWRfY3BwY19lcHBfc2V0X3BvbGljeSgpIHlvdSBwYXNzIDAg
YW55d2F5LiBXaHkgaXMgdGhpcyBuZWVkZWQ/IFdpdGggdGhpcw0KPiBjaGFuZ2UgZHJvcHBlZCwg
b3B0X2FjdGl2ZV9tb2RlIGNhbiBiZWNvbWUgX19pbml0ZGF0YS4gKEJ1dCBvZiBjb3Vyc2UgeW91
IG1heQ0KPiB3YW50IHRvIGFkZCBhbiBhc3NlcnRpb24gaW5zdGVhZCwgaW4gd2hpY2ggY2FzZSB0
aGUgdmFyaWFibGUgbmVlZHMgdG8gc3RheSB3aGVyZSBpdA0KPiBpcyBhdCBsZWFzdCBpbiBkZWJ1
ZyBidWlsZHMuKQ0KPg0KDQpUcnVlLCB0aGUgaWYtZWxzZSBzZWVtcyByZWR1bmRhbnQuIEknbGwg
bWFrZSBvcHRfYWN0aXZlX21vZGUgX19pbml0ZGF0YSB1bmRlciBOREVCVUcNCmBgYA0KICAgICAg
ICAjaWZuZGVmIE5ERUJVRw0KICAgICAgICBzdGF0aWMgYm9vbCBfX3JvX2FmdGVyX2luaXQgb3B0
X2FjdGl2ZV9tb2RlOw0KICAgICAgICAjZWxzZQ0KICAgICAgICBzdGF0aWMgYm9vbCBfX2luaXRk
YXRhIG9wdF9hY3RpdmVfbW9kZTsNCiAgICAgICAgI2VuZGlmDQpgYGANCg0KPiA+ICsgICAgZGF0
YS0+cmVxLmVwcCA9IGVwcDsNCj4NCj4gQWhlYWQgb2YgdGhpcyBwYXRjaCwgYXJlbid0IHlvdSBt
aXMtaGFuZGxpbmcgdGhpcyBmaWVsZCB0aGVuLCBpbiB0aGF0IHlvdSBjbGVhciBpdCAoYXMNCj4g
eW91IG5ldmVyIHJlYWQgdGhlIE1TUik/DQo+DQoNClllcywgSXQgd2lsbCBhbHdheXMgYmUgMCBv
ZiBpdCBpbiB0aGUgcHJldmlvdXMgY29tbWl0LiBJIHNoYWxsIG1vdmUgZ2V0dGluZyAicHJlLWRl
ZmluZWQgQklPUyB2YWx1ZSIgZm9yIGVwcCB0aGluZ3kgYWhlYWQNCg0KPg0KPiBKYW4NCg==

