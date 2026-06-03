Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id ajBENIM5IGpSywAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 03 Jun 2026 16:26:11 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 354B16388CE
	for <lists+xen-devel@lfdr.de>; Wed, 03 Jun 2026 16:26:11 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=citrix.com header.s=selector1 header.b=xAH3jPQN;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=reject) header.from=citrix.com;
	arc=pass ("microsoft.com:s=arcselector10001:i=1")
Received: from list by lists.xenproject.org with outflank-mailman.1326578.1591994 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wUmXe-0004jA-2M; Wed, 03 Jun 2026 14:25:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1326578.1591994; Wed, 03 Jun 2026 14:25:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wUmXd-0004gg-VI; Wed, 03 Jun 2026 14:25:57 +0000
Received: by outflank-mailman (input) for mailman id 1326578;
 Wed, 03 Jun 2026 14:25:55 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <bernhard.kaindl@citrix.com>) id 1wUmXb-0004bd-NJ
 for xen-devel@lists.xenproject.org; Wed, 03 Jun 2026 14:25:55 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wUmXa-00GFcI-SM
 for xen-devel@lists.xenproject.org; Wed, 03 Jun 2026 16:25:54 +0200
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <bernhard.kaindl@citrix.com>)
 id 6a20396b-2eae-0a2a0a5409dd-0a2a450c8092-30
 for <xen-devel@lists.xenproject.org>; Wed, 03 Jun 2026 16:25:54 +0200
Received: from [52.101.62.66]
 (helo=DM5PR21CU001.outbound.protection.outlook.com)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <bernhard.kaindl@citrix.com>)
 id 6a203971-62f1-0a2a450c0019-34653e421431-3
 for <xen-devel@lists.xenproject.org>; Wed, 03 Jun 2026 16:25:54 +0200
Received: from LV3PR03MB7707.namprd03.prod.outlook.com (2603:10b6:408:28b::21)
 by LV1PR03MB989608.namprd03.prod.outlook.com (2603:10b6:408:3f5::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.7; Wed, 3 Jun 2026
 14:25:51 +0000
Received: from LV3PR03MB7707.namprd03.prod.outlook.com
 ([fe80::97e8:ef9c:9031:e2bf]) by LV3PR03MB7707.namprd03.prod.outlook.com
 ([fe80::97e8:ef9c:9031:e2bf%4]) with mapi id 15.21.0092.006; Wed, 3 Jun 2026
 14:25:51 +0000
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
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lTVEu08hWrlQI0Vr/HKROsxqeWbcHi03GJQI/P1fsqm7QOEHV5KiwMVUiScynwlN+co6KidTpeimKhJI0/ZRZyIcwXOBCMyKEqMnsbCzUSXmQuaV2I4QUnPDOKv1KnmNcLydpGQssTjOqsllpEWTUES3t17dirIzzITT63pfB4d4OfMNRqEj5Go4AcoUoXiX6AtmRM/trNtztSUzzJ83qCCO2zq0RINNTnNynLGsqY8j7gMxU1nbHx6QtVp43/oXQeoBO6gQ6HgWFqKIZIUue5oADkhsO37fTm93qJnHO/JfxwxsfyCTEzSgremiyxsE+BATbm9dgEIKrvd/j8sltg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uTzEC9YnJUSm335s/FAurfidP0Px5xZwFO3J7JzfFlk=;
 b=CWNpbnGUfS9MY12K/woVxEAtfFYV3JbB1rxYhsg4DGhqNL+5FJ4Q0/7/A1iWqy/ttUgK4R3XcPjZoThkV22ZDbPNWdXVxRJzPveO/4bsbM0S7z0YzSmgmnlFrn6sEPfg/JSxNhxDAsrsZ1AXFtpsQG+/R1QEgLyJJrMCYwu5C8aNdIVyWv9b3Ti9Z+HH5IgyRJDrA47Yt0ytxamtf5B9n5YNVSy1YJS1SnaUF33EuaPoT0BY8dpKx6HlTdAmlL1Bd+DU/BhOISQaIy8rygwestINzW/PD29zQ303S/NYAOWsWDodbFe3erN0tRU1D6UE6OTXtSWeCa4ad5HlwyPgAA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uTzEC9YnJUSm335s/FAurfidP0Px5xZwFO3J7JzfFlk=;
 b=xAH3jPQNC6KLH62a9TsrzEjEefcGQTnjc6cEZjDxFjW3FFxsUUzO+cfRsZXg0IO2xdO38uwQRZkQ0ATYJn5wPZQAcbw77Yvlv1cyDrgl43TWa4alYJCC9cckxQarf531qzY2BkN9rM8Tiz5F+TdrZM1T3ZSZwN9xsimb2PEk4bs=
From: Bernhard Kaindl <bernhard.kaindl@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Anthony PERARD <anthony.perard@vates.tech>, Andrew Cooper
	<andrew.cooper@citrix.com>, Michal Orzel <michal.orzel@amd.com>, Julien Grall
	<julien@xen.org>, Roger Pau Monne <roger.pau@citrix.com>, Stefano Stabellini
	<sstabellini@kernel.org>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
Subject: RE: [PATCH 2/2] xen/mm: Fix off-by-one stopping tail merge in
 reserve_offlined_page
Thread-Topic: [PATCH 2/2] xen/mm: Fix off-by-one stopping tail merge in
 reserve_offlined_page
Thread-Index: AQHc7rJm4c7CmMD34EmD9nfdurc6wbYrXvCAgAGNBGA=
Date: Wed, 3 Jun 2026 14:25:51 +0000
Message-ID:
 <LV3PR03MB77075021D89384D783865E7687132@LV3PR03MB7707.namprd03.prod.outlook.com>
References: <cover.1779980089.git.bernhard.kaindl@citrix.com>
 <b177222a50bb11647589f3143b8ba9771535b7d9.1779980089.git.bernhard.kaindl@citrix.com>
 <1110e571-db6e-4443-aa8d-6676d5b1edef@suse.com>
In-Reply-To: <1110e571-db6e-4443-aa8d-6676d5b1edef@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: LV3PR03MB7707:EE_|LV1PR03MB989608:EE_
x-ms-office365-filtering-correlation-id: e48c19de-858c-4e8c-3597-08dec17c03d2
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|10070799003|1800799024|376014|18002099003|22082099003|4143699003|11063799006|56012099006|38070700021;
x-microsoft-antispam-message-info:
 sExu7gqTj3/MtCWMzWbT86wIeQEJYMt2uqy8i8Dacyj5jYPGL3KQGAlnvtze1ovdvAEi7IDE/SSweBwT077DpDBaAysYDhVWWtNNpyy2uJqYYayWwHl9DPSiElMbRbfDV1a0/5F6RZswD3P/5wzfWkIWwD9BEPlH3joGCfMIcfq4QTh4tpXvZlLiwwECnfmYnms7OE3PpW3goOpqLxv7foibKZdd+3BecUJwr0oWRkr/aypYQYJDF+6x4p6Ic456XBvUBZ6/gvm2e/JFKbeHY3qyrW04xy5qfq2rabBGnDVhsE9tHtJh9EiNI72vMsyRZFepl2FaTLWMl6D56qJy3jCQbgHGxOHC9HQhLvad40aVDVzwO9uct5pEJ37nMEgLOpSo2mVtaXgj8w8NCzckTbI4QmKwM5TOji5P6giJkgl3S7DvLa+CVxHdA4SjUB+jW3jT24a2ER1J85T6Yd7wGRfh6OOaNpBOg0hH/5SS8ClrBubyimpC6cpH5b4o/yCo8o/eahmk7sj9QGySLT+KOT4+we484w45B5ejMqU6Maz96BZhd0bmCCw5hCXa74gJdM2GLf42Ztk5I77b0i9enEDTbYBCktK8tT32RgfErHuVglQSLetheOVUOPoTfeikiERJenGaRXxY4rwcBUyjfu0AG3mV5e1qEuN5bjeVtnC++CDxWXKFPPtesBVhFSz/Ogc7UtAcoiy9CiguioSegmBxEgmi8Vw3pSliRFAGgDQ8dFQ2HDvLd02IyMlc34ca
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV3PR03MB7707.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(10070799003)(1800799024)(376014)(18002099003)(22082099003)(4143699003)(11063799006)(56012099006)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 2
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?dnVLbFZnVEMrSjV0WElqMVE1dkdUbjBQTVJRZnltc3lZR0Z4RTVZbkxPMitr?=
 =?utf-8?B?WnVHdFkvRWh2dWVobWczNUFkV2FQdUdSa1pkbTlLZ2NQaFJSMDRFRDFBL0kr?=
 =?utf-8?B?VWFWL2ZTRFd5Ni9RWGFJZkpPV3NUUklnc3F6MGZicnlKRk9GeGN0RVEwM2Zs?=
 =?utf-8?B?VlpLMGszMlliSUcySXNTNGRVS0dkS2VISXNEUkNYazZTdlB5cnZVd3pZbVZW?=
 =?utf-8?B?Ymp0WGdjS2dJTkR3ekU3ak5oSVhaOFo1b2d0cGJtQUNoNHNxcndZOG5FUHRP?=
 =?utf-8?B?czFvMnlVdW1mdUROeDlwT2VMUjRlV2NUVk54TWRVT2pEUEhleWJkRWVVSm5x?=
 =?utf-8?B?bC9WTzQ0WWo0K1Z6SXRSV21tc1dLeGZQSzBkbHU5VG5GZTZMeVl4enpZbHN6?=
 =?utf-8?B?dHFScVJCMUFPOGdmelplQ2NtU3lJMm0zYXF2N3FXVXlpUFZORzlsUXhiY2xT?=
 =?utf-8?B?RE1wODJSWlZrTThhWmZ1TlRSQ01rSlgrZFEzQ1B5ZkJodzNMNEFGa01FUTRD?=
 =?utf-8?B?MWRVQm5KTlZRREMxR0o1TitsSE5VS2h3VG1FcW1ieERaQ1FPSytmY3E2YXBz?=
 =?utf-8?B?WkxvSlg2d2REWlRpZWQ5UmdVa1BqY0RNR3lSc1hmWGdMOTBLM3JLYmxFdzlv?=
 =?utf-8?B?dDhUNlovc1k2WktoQXp6OFZHNUw4RVkwdm11MC95M1NCMnAwUTZLR042MFB0?=
 =?utf-8?B?WjFUWHVOT2RNc2VMNUZhbDJTRzBmTE5OSlJuemJZazk5NVo5bk1WdmNldHFo?=
 =?utf-8?B?cVRUZU5FazNzZFRVNVduaE5kV202aDcwKzZqZDh4bnFTK0NXM2VuUzNvSFJB?=
 =?utf-8?B?bzQybDQ3UG94SG5vR2dDWVFuc3pSQlVqQVBoTWY2Q3h4elJTTmdrM0cvYzdM?=
 =?utf-8?B?Z2RkYlRQZHI0Rm4yVGRvd0ZxTVk0RW1WUnI2QXRsWmhaMXRnOXlXb0FhMHdz?=
 =?utf-8?B?ZmxvcjR3M0NpQkdSOEw5U2YxblNwaTJxeThES0w0dFIzWDRtbExiR2lLMjdV?=
 =?utf-8?B?WXUweFhmVDNqVXUyYnZqRys1NmdvMWIrSjRPTVBUWlk5UktyQzJuNE5CSUNs?=
 =?utf-8?B?SEl6TFp2NUhoclU1eDNGNDMzQVJ3Y1o2MnZpUlpZV3hLMHcwZ3l6SHdHTk12?=
 =?utf-8?B?Qm8rUGxqTWxnOGZrM3BWNnVWTW9YRVlPbytBR0dneWc4b0w0S2M3dWRWb20x?=
 =?utf-8?B?SUtIdFRIQjk2OGhwT3RaWVFXTFpCWThPa2tJWDNycjQrMFVhdXpoWW4rbTZ2?=
 =?utf-8?B?Tkt2eSttWEZTS3hVSWZUMk1Lb2hvM2xYVzVHTGpuQ1RaZ0FPdlFVYUhYUmVY?=
 =?utf-8?B?UVlDUGowQnR3c1JrdDIyUHdvenQ4RzVjdDZWdWhWWmhCa2hTVHJUVzJPYWR5?=
 =?utf-8?B?S0EvcTcwWWFDK2pBYWNBYk1Xc2tJTmdud0IyamtxSE9oNEROcE11SjdaV0RU?=
 =?utf-8?B?K045ZFpMUFl6Y3NJSnV2UFVkd2NncnpMcVk5WVFzL3VTWTFJVzNKWDlmRVg3?=
 =?utf-8?B?SWx2TmxjSjNBVHlPZU4zYm50Qy9iVDFMaiszRER0WFBpZW1POTZMcjdGK2lO?=
 =?utf-8?B?dzJiRDJRYUNKaG9CVnN1cW56N2tHNmh0bXhRbVpzczFEMnBjakMxL3lUMXFL?=
 =?utf-8?B?THIzWmFKck1SUmtOVG9xQTJta0oyTm5FUE5SSDI3SXNjWk9GR3lBOGJ0THIv?=
 =?utf-8?B?Nm8xc2wvWmxXcSt1bGk5Rlc0VEJBOE5LUWdEL3JzRXZhR3dEUGhHNHdOSmhN?=
 =?utf-8?B?L1lKUTVtakRpMHZkZW9uM2NCRFEzOU9vM3NDVFNuNDY4M1VGYnZvNDRZYzBs?=
 =?utf-8?B?MzNkMzZkQ1VOV3NaVEVFR3dlVjB4S3lFcFNFR2cyREczazBiOEtVTzRuT3Uz?=
 =?utf-8?B?elpNWkprQWs3YTMrVXZhSVpQOW0vdStzUzVqcFRhRlc0TWRhdmFjeDhpVXJh?=
 =?utf-8?B?dGlSVEJEQWEyRzRwSlBxb2pQdVovQ01Ra092MmNOWlFTVW9vNTI4cGtCdWFu?=
 =?utf-8?B?UEVxamg4UEYwNmtxTnVIbkNKYlBNN0JzaCt4dFNhcnh6V0lGZXZsVHdia2hs?=
 =?utf-8?B?NjJtdGVVTVFNRWtuaFFmbER0MmV5OG15a2sxQnovYmhieFVEZ2hpaDV1QWVn?=
 =?utf-8?B?TUdIdTFsY1RPTGJPa1ZIS2ZUd1ZoL2xERlpSRWpuSG1QM0V6M0dVUWlScjNv?=
 =?utf-8?B?c0ZtM2Zna2R6KzhmK0liekF3MVp5QkNlSUtBTWtOWFdIZnkxRU9MeFEwOXA0?=
 =?utf-8?B?R2dGdkk2TzFvL0hjU0pSUG9FS2hGanpRbndXcThtTVFQWFRBUldaQm44KzJQ?=
 =?utf-8?B?Nk5pYUY2d21oZFBHUXl4SlhEc2E5am9HcENYaFpScThxWmZHWVRxd1dQV3pl?=
 =?utf-8?Q?+dWsczPtadZh0X1Qr6EGYVWxwwghUN8VQWY2noTi/rQAo?=
x-ms-exchange-antispam-messagedata-1: C0E5ZQq660iXMA==
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: LV3PR03MB7707.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e48c19de-858c-4e8c-3597-08dec17c03d2
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Jun 2026 14:25:51.6797
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: vrplA8QmWL3m+AoW0U7EJCxigV59XTkyt6plSTxeMXJouPxs/yWegxvnGm8t7MG1rxDUKJT8CkrLQ80GgXahK5E3lxXpXI9s/e5O9VzNdGs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV1PR03MB989608
X-purgate-ID: tlsNG-d25034/1780496754-DBB7CCF5-F5FF83E4/0/0
X-purgate-type: clean
X-purgate-size: 630
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.08 / 15.00];
	MIME_BASE64_TEXT_BOGUS(1.00)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	FORWARDED(0.00)[mailman];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER(0.00)[bernhard.kaindl@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS(0.00)[m:jbeulich@suse.com,m:anthony.perard@vates.tech,m:andrew.cooper@citrix.com,m:michal.orzel@amd.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,lists.xenproject.org:from_smtp,suse.com:email,citrix.com:from_mime,citrix.com:dkim,LV3PR03MB7707.namprd03.prod.outlook.com:mid];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[bernhard.kaindl@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[citrix.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 354B16388CE

Wy4uLl0NCj4gTXVjaCBsaWtlIGZvciB0aGUgb3RoZXIgc2VyaWVzOiBXaXRoIHRoaXMgY29taW5n
IGZpcnN0IChhbmQgc2VwYXJhdGUgZnJvbSB0aGUNCj4gbmV3IHRlc3QpLCB3aXRoIHRoZSBzdHJh
eSBibGFuayByZW1vdmVkIGZyb20gdGhlIGxpbmUgdGhhdCB5b3UgdG91Y2gsIGFuZCB3aXRoDQo+
IHBhcmVudGhlc2VzIGFsc28gYWRkZWQgdG8gcmVzZXJ2ZV9vZmZsaW5lZF9wYWdlKCkgaW4gdGhl
IHN1YmplY3QgKGxpa2UgeW91DQo+IGhhdmUgaXQgaW4gdGhlIGRlc2NyaXB0aW9uKToNCj4gUmV2
aWV3ZWQtYnk6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4NCg0KQWNrLCB0aGFua3Mg
Zm9yIHRoZSByZXZpZXchDQoNCkknbGwgc3VibWl0IHYyIHdpdGggYWxsIGNoYW5nZXMgYW5kIHRo
ZSBzdWdnZXN0ZWQgdGl0bGUgaW1wcm92ZW1lbnQgbW9tZW50YXJpbHkuDQoNCiAgIEJlcm5oYXJk
DQo=

