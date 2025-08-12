Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CEA28B223CE
	for <lists+xen-devel@lfdr.de>; Tue, 12 Aug 2025 11:56:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1078528.1439564 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ullkE-0006F3-Fb; Tue, 12 Aug 2025 09:56:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1078528.1439564; Tue, 12 Aug 2025 09:56:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ullkE-0006Bw-By; Tue, 12 Aug 2025 09:56:38 +0000
Received: by outflank-mailman (input) for mailman id 1078528;
 Tue, 12 Aug 2025 09:56:37 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=54Z7=2Y=amd.com=penny.zheng@srs-se1.protection.inumbo.net>)
 id 1ullkC-0005LM-TE
 for xen-devel@lists.xenproject.org; Tue, 12 Aug 2025 09:56:36 +0000
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2061f.outbound.protection.outlook.com
 [2a01:111:f403:2413::61f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9ef28e7e-7762-11f0-b898-0df219b8e170;
 Tue, 12 Aug 2025 11:56:31 +0200 (CEST)
Received: from DM4PR12MB8451.namprd12.prod.outlook.com (2603:10b6:8:182::7) by
 MN0PR12MB6030.namprd12.prod.outlook.com (2603:10b6:208:3ce::6) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9009.21; Tue, 12 Aug 2025 09:56:27 +0000
Received: from DM4PR12MB8451.namprd12.prod.outlook.com
 ([fe80::b04e:2da5:7189:4c4d]) by DM4PR12MB8451.namprd12.prod.outlook.com
 ([fe80::b04e:2da5:7189:4c4d%7]) with mapi id 15.20.9009.018; Tue, 12 Aug 2025
 09:56:27 +0000
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
X-Inumbo-ID: 9ef28e7e-7762-11f0-b898-0df219b8e170
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FaVxNmJV1YVzQBB7fglqiqNP4zTSSEpIS6f0D4Lw9V4bQbYvwNRXcYBL7SReU+tFsFYo6OJ9J2taY+C8v4rQWFRrY1QX+56vFy+Q8axMO/3ZtwBpbGZOJ2b6bWyzK1pWYDdDEoxbzX9l6yCaRUb4Zr4Qg+3Tw1rc+tl7O9ADQTa5e2RnHQjx1S0edniRSa+r2t8WvY8aoo71csy6VidQb2iO4uUq8LPRToKNWvUR1R9q0XQS5AVpr8PlJ1Tok8Hi2J48SMtrv9O5AO0yDBrfD8EXwQ/xOWBZ1Kqk4syizzNYCItwq/wcuQ2K1NKanqms6mRnoP3ayFdI2e1y3iBlEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1WbWwBizKLr6sfHMYIQ0EX8TxERuC1qyHK2ECAKPHag=;
 b=pNyLfo/OGspUAl6QXV3hvUEbjrELg0CP2emXNh2wqVSlYty5Edhv75aOZMuHZWQAxusrb1xrC8ionLq+CpO0iUSTLPyH03uyyLXShYtQ2aZteSCVQSC234aKTozKrnoN7Xe41U3E14HVl4T2L1uooCKYYlUk5zd/fX1b8pBXtfGHBRZfinY6chqVSCFHNa91bhxCTTDrB7rmzA311QzaSGOADFvfQAmC2oaL0DAKIWEbD0YdbaVAwTRL4HqXqL+KRGclyhxxg6RXQaxmAbf/opvDvxoXSdJnl8cddQgXnDHCLAN6lat6CGFLaSA80G09cUhu9D6oKBp9AI7TmAp7MQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1WbWwBizKLr6sfHMYIQ0EX8TxERuC1qyHK2ECAKPHag=;
 b=rfOBtywXdn3vQwblMBnKmJe7dwU/kwgKzSYjN3P56IVzIgBuAnFjuJ/0pPhyIj195dk7eeCbXHmbrZKkIMFeIPFAv2C2JtjhhCbu6h3sUUQSl9TzsPvYTNZDLMBA5zMvHO5tPvbEEIoS1soLmE4Kos7I8I8WRMm8hR5pckLSMhA=
From: "Penny, Zheng" <penny.zheng@amd.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "Huang, Ray" <Ray.Huang@amd.com>, Anthony PERARD
	<anthony.perard@vates.tech>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
Subject: RE: [PATCH v6 15/19] tools/cpufreq: introduce helper to deal with
 CPPC-related parameters
Thread-Topic: [PATCH v6 15/19] tools/cpufreq: introduce helper to deal with
 CPPC-related parameters
Thread-Index: AQHb8hcn+tWFoATVBE6qNhfRcQLSnbQ/8H0AgB8IiuA=
Date: Tue, 12 Aug 2025 09:56:27 +0000
Message-ID:
 <DM4PR12MB845130C5A928F8B36DA5C4F9E12BA@DM4PR12MB8451.namprd12.prod.outlook.com>
References: <20250711035106.2540522-1-Penny.Zheng@amd.com>
 <20250711035106.2540522-16-Penny.Zheng@amd.com>
 <9df16790-268b-4221-87ec-829ab4446872@suse.com>
In-Reply-To: <9df16790-268b-4221-87ec-829ab4446872@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
 MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Enabled=True;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_SetDate=2025-08-12T09:56:16.0000000Z;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Name=Open
 Source;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_ContentBits=3;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Method=Privileged
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR12MB8451:EE_|MN0PR12MB6030:EE_
x-ms-office365-filtering-correlation-id: c245680e-2f30-4764-ea4a-08ddd9868170
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|376014|366016|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?d0xlcnB5OUl1VmxrYWN5OEZTNE0zUE1PN3hUZFFJY0d1TUhwdUhCWUNGMDZo?=
 =?utf-8?B?em9LbUVsUTdEVzVNVUZycG8wRFo0NkRmRnMxYkRUV096MXJsaElPcVAveVk2?=
 =?utf-8?B?OHhlZGl0Ym9hMmw1STlTQWduQzg2NzZ6STJVQUtrRk9xRzV5ck5mQzU1bE1C?=
 =?utf-8?B?a1JFR1kxcjc0UzdDZkc1eWZScFUyUEVKWWFUdVYvSmRuaEJpYllaVE5ma2JB?=
 =?utf-8?B?bkp5MnVUU3lJOGY5WW9oc0V6MlVIZnJ4bVVnM2MwdVV4cm45VDk5Y3BKVGYx?=
 =?utf-8?B?TWoycGVTVHhyN2syaHpXeDVmL0RjL3ZzQjFGT2plV2JMd0ZSVnozRGJoWER3?=
 =?utf-8?B?SjF4bkl3YjRUaVdrMkw1VlFpRkFSbTRSa0ZqTkZGdWxpVVprT2txYnBQdlZq?=
 =?utf-8?B?TEwyeUpFSGdrbHFLek9za05NNGNkdzZnbGhVdTV5RWFET29zK0Z2WGk2TEZY?=
 =?utf-8?B?K0liLzVMZkU1RG9zNGNkZWpYMk5rYS9kN2ZVZzZxQTJjdG91NVpIaFhvRTlm?=
 =?utf-8?B?TlpwbjhySU9iWHJjWVZadnBTeGhiVm5KbUZQVWRpYVRDNUtjc0hVdHo1cGhT?=
 =?utf-8?B?TkNSOStraE5mMmFwNUhxSVh0TFU1aG1NdFVsM1NxU2UvTFFQOTFyM0RIbjlR?=
 =?utf-8?B?bzlqWTd1NlJkbHBYb1NvcmRSaTl4VWQvUTFSZEI5d2dDb0Y3WlFYYjJHdmtw?=
 =?utf-8?B?Q3hHTzAzSzlpaENmK2dCWGl2WnRhL01uOVNFdWoreHdmczl5NFN0QnRLTFFG?=
 =?utf-8?B?L1BLOFVTTWhldEZVTTNMRVZxQWQrTDNmS0I5OEV5dGh1UlkwcWh4WHVBdzVU?=
 =?utf-8?B?TmI0Yi9xdWNKc01QSWdlVnQ4bnBJbnlTL3prYStpRldsc3JPSkN2d0RxUjY2?=
 =?utf-8?B?bUdRaC96cWoxK0Y3dllHQlNybnZ1RGQrMmp6U29qWkk5dmNpdmoyZTdHVWlw?=
 =?utf-8?B?T3BvbGhDWW5KbVZ3OTR4S1hCRFNadWhpTFg5TmxpcjNBUnFJN0NzTzU1K1k4?=
 =?utf-8?B?M05iZUxYK3JId1kvQmh4TS95dzJ0eFlFUk9TMUFwdTZjaTBaZTdaR1dpVElJ?=
 =?utf-8?B?dTgrZTVPZHl6R3ZKTEpGRnJTWGhDdzY0UVNLZXVzTUFlbGpXd2hKb2dsVnRX?=
 =?utf-8?B?eTJEZmYwNW93UUFxM0Z3czJQU0tzQ1k2bkNNME1BOVlhS3VpV0wyKzBGTUhn?=
 =?utf-8?B?UFUzbzU0UStJQU91RDNlMytRM3JsQkhpelJkTDJKT3U3THNDSUZET242ZlNp?=
 =?utf-8?B?a1JmR0VRRGV6djRpbGF0dDY5WVVCL3NTUUdjcmJNdHp3Q2J5KzNLMk1yNE9m?=
 =?utf-8?B?M0FoWjRXLzBZVmxWRi9BOVZjMGZ5dURSV0RES0MyS2poaDlGcVFhZitsei82?=
 =?utf-8?B?aEJWOHdNc1J5QWc0OHgxZERER0tIdVRLY0tFMGxSc0l1NlVoNFVBZVFyYXpr?=
 =?utf-8?B?djYvZGwwaVQ0bnZCOUVXcEpvUzQwdmloZ2RZc3hKNk00Ky9HbXJkZWdPMWlN?=
 =?utf-8?B?NlQ1TVoyUmZQR3BwMmYxTFUxeFFTUjhCbHJrUHlNRHZlOEI0MzNrMFJxUU9x?=
 =?utf-8?B?VnJnNnhWdjFkUVpwUDZCYjBMNHJZSWh2M2JPU3RxWlQ0ZVcwMlJpbStlMTJK?=
 =?utf-8?B?eVBsaWVQR2dubXdSUEtjZC9uSVByUG01Zm83RFhkNUp2amJTYy81dkk0bFhr?=
 =?utf-8?B?YTFiMlEvc3JpMjVvV0NDdUhSVnRvSHMvVWk0dlpiUWpyZkh1Zk5NaEtEVldn?=
 =?utf-8?B?WEFnaXhsdHFyczdRT0VIUnp3KytvYUx6NlphTFRGSXcvUUlkUkRVYVBsRnlV?=
 =?utf-8?B?Qy92Tm82Nzc3end0enlUNHFkZ25QL0lNWjVncHBsZ0NVOWpsL0x6U0Q0anAz?=
 =?utf-8?B?MU0xRjRpNmFOVVhLNjR4MDI3ZFA4cmpZWG9DY2ZDb1ZYSkZNMlZkckZTdHIy?=
 =?utf-8?B?L3lJY3BaaEhIWmNCMHdPdUFDdDJrMXBOcGI4TWluRjJpOWNXTDBLdVR5byts?=
 =?utf-8?B?bDFxelB6MzJRPT0=?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR12MB8451.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?VVNNcitkQ2EzRGVXT1owOEQvWDJEd2loeWVaeXVOeXFFTnpPdFVOKys3WFhs?=
 =?utf-8?B?eEpIb1hTdEVuZTZsbnE3d0lGenE2SG1xMU8rOWF5eVRVaExiSmdtd1pRUVk3?=
 =?utf-8?B?eUZucHNtT3JtRC9obTJobVpHK3pMZEJHdUJ1MEIwbSs3L0c2SFc3Wm9RdW94?=
 =?utf-8?B?QzRYNnNkZlJqZ2N3azlSWDJGaFBqVVUwTncydU15OTl4akluOStmc09iVWc3?=
 =?utf-8?B?ZWF5SlFGNzdKTlJYVm5hTUgwUHlJaHZ2ZFpTR3lqWDV0NHgvcjhPb1R4dFdj?=
 =?utf-8?B?ZWJsSW8xQVpURkh1cjlaZ1hxN0N2M2llSEkvS2pBNXpxZWN5VkozK2JCRUdM?=
 =?utf-8?B?eEszbWNuUHd1RWVtWmdPUWc1dTMxUmlLYnlRcnd2akJ6Um5ZblJGREFVUGl0?=
 =?utf-8?B?aUx6Q05uQzZ5czJ1VDhxSWFrYWxZOEpBYUo5ZVpPb3AvNzBvNzRBSjJkODJm?=
 =?utf-8?B?ZDBkRDdsRXE5bXd2ay9jZkJYdTltd1VFSi9lVXNTc2h0U1RUTk93eE9BM0ow?=
 =?utf-8?B?T1JqYzVZVUNTSGk1cTdyM1ZUWDdIVGJ2aW51SUVWNjFhS2lZc3lUblBiMnMw?=
 =?utf-8?B?MWQ3aEdYdEs0NWU2TC9iM0d5eTl2UUR5UzhkaHFUbHNHZFc2ekVCUi9zWVRE?=
 =?utf-8?B?Y0U2ejd0cHl3TWh1eDJ1NVhSenhTSnF4S1M0WXZHR0pDbXBUMVhCMEQwTWth?=
 =?utf-8?B?WDhSbnlEUjNzRzBDTWdGTTFHL1BJYzNLOE5IR3BiOHE5RmNTYjF2VDkvTVNW?=
 =?utf-8?B?RmxDWnduT2JBOXJsSzVIVzRJcmFXOWVCSnpJcDMrQUlpelRJL0lGakhqTzgr?=
 =?utf-8?B?ekRGVldqMVM1RFlVaHhqb1M2WmR4M1pKZWJXWE9wOWRWRUxNOUR1S0RRRXll?=
 =?utf-8?B?U0UyazErODlscDl6S1ZsNUk4WlNZVXl2NXgyUkY4K3ZGU1JLMTUvV1hPZG9Y?=
 =?utf-8?B?TkFLQnhmWklMZlpEOGw3T1NHRXVzVlN0ai83Q2UxMXJUeWxrVkRTRUdJWkMw?=
 =?utf-8?B?bjdPV29Rb2hFSktGTjBhMnk0dHc5U2l1OGY3T1BaZW53SHhhZ2UrMU00ck1T?=
 =?utf-8?B?eHFaOVZZTW9KT1k2K2pWOC9BbUdOL1lGTFlHYVpyZ0NWcFZwamFLbzl0ZjlJ?=
 =?utf-8?B?c2ZVSnNsYS9CbzczdVlKVyt3bk15bnhOazJVcVNhMVNxdjJTamhOeE9KUXo3?=
 =?utf-8?B?NHkrclQrQVlXdmY2YklCRFB4aWlhU21YeHJGNDVGVDZFbDJseS9KY1lKOVkr?=
 =?utf-8?B?NktvWTZnQjRza0FINXd1WEVUbXoyZWVhNUJkMjZIWW1KRXFwdnJoU3hNc1lJ?=
 =?utf-8?B?aFBCYmRVbjdFK2FKVDFjK3lpeW1idXphTHNyOVBHZXJDR2dpdFR5VDRSbktX?=
 =?utf-8?B?Rk8vN0JZRVV0MlJVUHhoU2Z1VVJKcjFhS1FiTkxnc0xsYUt2QTlKdEMwYzVL?=
 =?utf-8?B?NTBrTHJIbDlremRJRm9pTE5WVzhnL0ZzZ091eWh5RmNGY0NiaUptdHk1MERL?=
 =?utf-8?B?U202SzZnbWZEbWdTMVZvNWtFbXFJK3VMZmZJMFRSMG1jY0lVbU10U0RuUWV4?=
 =?utf-8?B?dXJ5cDhmbG1JRUxmazlRRDEvSndRclJSMDNzRGYrMHJVaUxnK0QrYlMzVVlV?=
 =?utf-8?B?bFErbTNkREpiYTR2S2h0Qk5ZN3NMSUFaNy9mK0w3ekZXeE9seVNNYmVjR2cw?=
 =?utf-8?B?WGhSeU1HdXdYdXFaNU1Ick5GWlJ5d0RPZWpkMVJyakY3UmIwL3Q5SzhRWHRH?=
 =?utf-8?B?UWw3c3RWUnNVaDk3R0dkNURMa1Ava3BHQTIyVEdUUVpmNERST2F5OXB4SUtU?=
 =?utf-8?B?ZGIwdEUvbXU1SzM1K0tTUVBIc2hPOGlPeW9IYm5HZ2I1c3FvL0VsVWNmaDBp?=
 =?utf-8?B?V0F1dklEYll2YTFTcnJmNTFmZnBLNXdOT3MwVVVNUmVMM29tMEprNzlJYnVM?=
 =?utf-8?B?cHE5dFN5ME9ONDJ4UjhvT1ZXcnRyWmJXRWVGVE0wbHE0ZjN0L2ZPbXBlbEdo?=
 =?utf-8?B?MDZVTXh0YTFudlYwWklaZ3RjMnJJT2JMRVpBRTNLK3VxYWo1N01UVUtyV1lo?=
 =?utf-8?B?MUJFS0JlTC9CZFI2aEdod2ZFalNPM0RHL1FJNm9XMElDcVdrL1NzZ0J6SXRC?=
 =?utf-8?Q?Yg/o=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB8451.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c245680e-2f30-4764-ea4a-08ddd9868170
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Aug 2025 09:56:27.6717
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: f/xbUWU6uyHui+babAe0N3EiLiUsVMcWAykn2d6MUyrezgoA9d74xv8+KnK0sUFYToIajK4vgwQAupca3bqOJA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB6030

W1B1YmxpY10NCg0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBKYW4gQmV1
bGljaCA8amJldWxpY2hAc3VzZS5jb20+DQo+IFNlbnQ6IFdlZG5lc2RheSwgSnVseSAyMywgMjAy
NSAxMTo1NiBQTQ0KPiBUbzogUGVubnksIFpoZW5nIDxwZW5ueS56aGVuZ0BhbWQuY29tPg0KPiBD
YzogSHVhbmcsIFJheSA8UmF5Lkh1YW5nQGFtZC5jb20+OyBBbnRob255IFBFUkFSRA0KPiA8YW50
aG9ueS5wZXJhcmRAdmF0ZXMudGVjaD47IHhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZw0K
PiBTdWJqZWN0OiBSZTogW1BBVENIIHY2IDE1LzE5XSB0b29scy9jcHVmcmVxOiBpbnRyb2R1Y2Ug
aGVscGVyIHRvIGRlYWwgd2l0aCBDUFBDLQ0KPiByZWxhdGVkIHBhcmFtZXRlcnMNCj4NCj4gT24g
MTEuMDcuMjAyNSAwNTo1MSwgUGVubnkgWmhlbmcgd3JvdGU6DQo+ID4gTmV3IGhlbHBlcnMgcHJp
bnRfY3BwY19wYXJhKCkgYW5kIGdldF9jcHVmcmVxX2NwcGMoKSBhcmUgaW50cm9kdWNlZCB0bw0K
PiA+IGRlYWwgd2l0aCBDUFBDLXJlbGF0ZWQgcGFyYW1ldGVycywgaW4gb3JkZXIgdG8gYmUgcmUt
dXNlZCB3aGVuIGxhdGVyDQo+ID4gZXhwb3J0aW5nIG5ldyBzdWItb3AgImdldC1jcHVmcmVxLWNw
cGMiLg0KPiA+DQo+ID4gU2lnbmVkLW9mZi1ieTogUGVubnkgWmhlbmcgPFBlbm55LlpoZW5nQGFt
ZC5jb20+DQo+DQo+IEFja2VkLWJ5OiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+DQo+
DQo+IEkgb25jZSBhZ2FpbiB3b25kZXIgd2hldGhlciB0aGlzIGNhbiBnbyBpbiByaWdodCBhd2F5
LCBhaGVhZCBvZiBldmVyeXRoaW5nIHRoYXQNCj4gd2FudHMgcmUtc3VibWl0dGluZy4NCg0KVGh4
LCBpdCBjb3VsZC4NCg0KPg0KPiBKYW4NCg==

