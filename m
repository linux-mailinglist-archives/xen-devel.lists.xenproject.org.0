Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 18CB8A6E8CF
	for <lists+xen-devel@lfdr.de>; Tue, 25 Mar 2025 05:14:12 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.926028.1328884 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1twveu-0001lH-4E; Tue, 25 Mar 2025 04:13:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 926028.1328884; Tue, 25 Mar 2025 04:13:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1twvet-0001iu-VG; Tue, 25 Mar 2025 04:12:59 +0000
Received: by outflank-mailman (input) for mailman id 926028;
 Tue, 25 Mar 2025 04:12:58 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jPfX=WM=amd.com=penny.zheng@srs-se1.protection.inumbo.net>)
 id 1twves-0001in-EB
 for xen-devel@lists.xenproject.org; Tue, 25 Mar 2025 04:12:58 +0000
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2061a.outbound.protection.outlook.com
 [2a01:111:f403:2415::61a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 67cce8b7-092f-11f0-9ffa-bf95429c2676;
 Tue, 25 Mar 2025 05:12:47 +0100 (CET)
Received: from DM4PR12MB8451.namprd12.prod.outlook.com (2603:10b6:8:182::7) by
 PH7PR12MB6657.namprd12.prod.outlook.com (2603:10b6:510:1fe::7) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8534.42; Tue, 25 Mar 2025 04:12:43 +0000
Received: from DM4PR12MB8451.namprd12.prod.outlook.com
 ([fe80::b04e:2da5:7189:4c4d]) by DM4PR12MB8451.namprd12.prod.outlook.com
 ([fe80::b04e:2da5:7189:4c4d%6]) with mapi id 15.20.8534.040; Tue, 25 Mar 2025
 04:12:43 +0000
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
X-Inumbo-ID: 67cce8b7-092f-11f0-9ffa-bf95429c2676
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kFC1iwh+mqC0N1XTsz4ybmnaCQrWbRCB2EMJIenIegubiuKYs3Ph9/UoXSBJBxoCiXwQE1rVgaJ4LsO1nIM1FfpB0y/SSKBfyXRK4lhg4fJ/zcjBMr+fEOhW9q9l8kXgHQ33lmLbH95a+hVVYGbQx9U0Ri8JhQbEpFcuSvQmzk9CmxLeJH405T0ZVey3/GjMDmf2W9TDOQ+mfN1OcQbCw9v8RLdrLkpkar0tsFkWIk+uyv/3AI/VwpKKmlJIrF7F8SsWz4Li03SGj96LiNnC9TeK8Q++GpyZ2RRtjaDvo4rd3liTSNNu/cALqlrspTgKeErOzQM93vlBeojSg0by+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pS9Eecvai0patCO1u5P34W5vISWfUZJbOeqFwydXJG0=;
 b=AxH5LjzO3bA/SDLJr6fhvcWI8wQdXD9GtbSvLX3V8HWWKcKpq42ZUUDkx5lFtuEGdNYqPukVV0Ayb/46j+WYm1RXpG9lPoJKT4aPHYkx+fOHEmFPEp0EFQaXo4u49IXaFLlrxOZDYTThcXGTA2NzuEOlNZFyJLHRBweQTfRyaOje28BgaWGfBFw98cgXbVXuPg9OQCheWSxkyFiu+hhbWqnNtUI5jQliJVLK622tl5r19GgEL2yGOFoq2xGLsJfC4egnIeYPz2fPdAc/gOHD63apq4HKVIA8++5/2gGAFRacug0TI5N2XT8nOChoTnETx03ZVddj6zNfwwSiHvP+6w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pS9Eecvai0patCO1u5P34W5vISWfUZJbOeqFwydXJG0=;
 b=mZLPnY+Yw5IrxRN5NCtvdrOV9hEj5pEKkzc7PKXbBLqk3s1waKCYi6vdCgN7UgO24Pu1jYxJuZAuTwxRHXUA7CLeegCX5Oji3LL7QxA7WNmS/nkq2V9L6jRAVt1+7rf8lCxHEYc0hWDxtcYX/KAjquZdBQwNzSXREYTWw9b19/8=
From: "Penny, Zheng" <penny.zheng@amd.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "Huang, Ray" <Ray.Huang@amd.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?=
	<roger.pau@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>, "Orzel,
 Michal" <Michal.Orzel@amd.com>, Julien Grall <julien@xen.org>, Stefano
 Stabellini <sstabellini@kernel.org>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
Subject: RE: [PATCH v3 02/15] xen/x86: introduce new sub-hypercall to
 propagate CPPC data
Thread-Topic: [PATCH v3 02/15] xen/x86: introduce new sub-hypercall to
 propagate CPPC data
Thread-Index: AQHbjnNoHifd0xPBh0uO6pYxtSnz1bOCdRiAgADdX2A=
Date: Tue, 25 Mar 2025 04:12:43 +0000
Message-ID:
 <DM4PR12MB845156C8C25495D7DB396ED9E1A72@DM4PR12MB8451.namprd12.prod.outlook.com>
References: <20250306083949.1503385-1-Penny.Zheng@amd.com>
 <20250306083949.1503385-3-Penny.Zheng@amd.com>
 <19cab53d-3edc-4900-95f1-6d5d81e0ecac@suse.com>
In-Reply-To: <19cab53d-3edc-4900-95f1-6d5d81e0ecac@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
 MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_ActionId=5e067145-076b-4c82-bced-00d63b9ba6bf;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_ContentBits=0;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Enabled=true;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Method=Privileged;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Name=Open
 Source;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_SetDate=2025-03-25T04:12:35Z;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Tag=10,
 0, 1, 1;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR12MB8451:EE_|PH7PR12MB6657:EE_
x-ms-office365-filtering-correlation-id: 169d3606-ae35-4dcb-e212-08dd6b534a71
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|376014|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?S1hGMlN4VUVkRkNyaGxzbVE3RnFxbytnM3crOW9TeDJNWW1Sbk4yMWl4YjA5?=
 =?utf-8?B?SUVEQXhVS2dKdEx5K2ZBdkljTmczZHRqYThGNllPUDR2MXluMFJxbllsU2ww?=
 =?utf-8?B?NEp4OXdFREV3L2lUcTFaWXY5ajlBRnE1TkhoQTBWTDBsWGF5YXlGanBLQUFW?=
 =?utf-8?B?aDFDekhlUGJQTnFXSHQ3dG9jR3B4c3MvYkNHbWEvbDd3eHV4QlZ3dEZtRkJ1?=
 =?utf-8?B?dm5vTnJ4NmlXOVBTM0ZCTlZSUkVLL0orTkEvRU1MV2plNVJrTmNEdWFSRTIz?=
 =?utf-8?B?ODZUalhOMURkazhJb0hNNU1pZDlZMWhieDNHaGVEOGpwc21HL1JFOWJmOStM?=
 =?utf-8?B?b3kwaGlTd2RadVpLS0o5a1ZZbEVUV01reGhvS3JuUVZhbnQ1M0Y4YlBwTENt?=
 =?utf-8?B?TEEzck9XZ1FZWUZMRXhVeis1OXZ4TUUzaHM5bDR1WjlUVmZyYndKR0psUnQ1?=
 =?utf-8?B?eXBDYllCclYzZll2TG9ZZnZERHhaVHYzZWcxU1V3S2J1dW45NXlvZFpYQ3c1?=
 =?utf-8?B?eHJhcmhwQ01uTzBQVVY1eWZEcWVBOWV1Tmg0QW4yZWptMXF4YUdmRTVQcWdY?=
 =?utf-8?B?MlRIUU94RjhsUkFLUFNGYitveW1ZbkVKWjRIWWxxZDA5TU9pSHJxVEt4cmhR?=
 =?utf-8?B?clNadnRmbEl2dlB2ejl5SDZFUkJMekZSL2lYdUFURTNGeXZ2MmtQS0s4dG5I?=
 =?utf-8?B?RWpMRFZaTkVPMTd6ZWpvZnFBSDY0TFRnQWVrZ1l1ZjEyRHJQMmgxa3IrSita?=
 =?utf-8?B?T0QyTVc3Qm00ZDNyODI0TnJqeTUwSGlTSFFhbUtmbUw5Z1VJZjBnOE5FVmZ4?=
 =?utf-8?B?UnFJckdQcXJLTlVzSHkvQThEdkxFb3RNeHBKbzBDeTlVS1BVT1cxWnBZVS9z?=
 =?utf-8?B?YzU4WkZXOSthbkJjU0Q5ZS94S0RiakJ2M2JPSnpMLytLSWxzNzNzenYxWFM4?=
 =?utf-8?B?cEZlSjBKYnVVeGEvT3hmVnBHTDhnb0czMkhPSHl0R1ZoOWhiRkNiLzdoOEFS?=
 =?utf-8?B?b2pwcHd6SkNkNnpKYUk4OFgrL04wd3owcDhIM2lnZG53SFBTclhlVjMvWnB5?=
 =?utf-8?B?N2FMNGtyUXZRYjRvWGxDQ0J2N2QxUzJ0Njh0bGhwOEhvZElONkhUL3JEa1Fx?=
 =?utf-8?B?SVIzWllpdE9iM1VUQUdPMmxNR3ZhbmlPeFc5SHRzOWdpMWhRMS9hN09jU29P?=
 =?utf-8?B?N3VwWmRxU0kzUVFjM3pwVzZrZkpPOWNLOU1iOFdjVXdra1FpZ096UDdxcXB2?=
 =?utf-8?B?RDQwV3Z0R0NUdXdlc2pXOHNWYTR1KzEwSG1aSUt0UXpLZUVXT1dyanVQNVkz?=
 =?utf-8?B?bkNxZ0ZDaEg4N2MzVm9NTGdjU0lvQXFOdW1pK1BCQ2hkWWRVQjV2Z1BsYVFP?=
 =?utf-8?B?cGxPSTV2NXZ2ZnZFS2o2VVNvZGhKNnJtNVRhY3pWRUkrbCtnOUV5Tkc1Y1hz?=
 =?utf-8?B?QXhiNGEwa1lzdzBzU2lMT2hQaDFDcjF5Rk5KbExwSFlrTEg4cWtvMTExY2pH?=
 =?utf-8?B?Z1d6TG5ENzJyMDdBSGFoSFlYYjNWNkVaRWF4OXRjbUdqODJYVm1DRFJ0aUhG?=
 =?utf-8?B?ejBHd1RyN1NHUnF0MWtPTXZGOXMyUWIwMkVRWGtPTWdTRFJnSTBiRGxBYkNH?=
 =?utf-8?B?bnpJQkVuSmJway8rNlloSDJsSU9GTjJ6RFdPOHQ0V1I0M1NwOEEzK0ZkWDc3?=
 =?utf-8?B?ek5sRzR5WUpibTNjdmcxRDluSnQ2RThmcUJuWmRLRHRFVTdOTkxIUC85bFlD?=
 =?utf-8?B?RkI3SHNrWWNaemhjTmNxd0lSUDBDc3hSVkhIV01kR3ZWd2Rwc3ZJQmFtQzNU?=
 =?utf-8?B?aWxKS0dBVXFHRHAyVU5pRFFkYmltcnFObTBqYmFNaWJjTGVaVFhQbWFLZG0y?=
 =?utf-8?B?cUVSTE9WaEJGeUlzVzlGcDg5T1ZKdFRQTWZHU2tpWW1UZ3BlY3FNSGVlaGZU?=
 =?utf-8?Q?33FjgfPxtUdb/B3MFlTR2gUtrysKPtHg?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR12MB8451.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?UFdCb2xRUnEvNEtSamVvZEtDOVNHU0xxUVpxaSt0Vlk3Q244Z0wzNzZlS2NI?=
 =?utf-8?B?K3cySGpQS2dDVmdlb3h6RzJEQ2ZkUldKTGdYTldmSDRvcFBoclR3UDRhTEJ4?=
 =?utf-8?B?WmRON1FDZmUzOG55cHJYS0F3WS8yTitBUWNzbjFscnJsZ0UwMGk5eFoyWWdG?=
 =?utf-8?B?Q00xWkNzQWVtVG1WcHk5U2MrZXdYY0sxNnVTYVY4SFBKRjZwdFR6YVFKcFBi?=
 =?utf-8?B?dFRUM2I1bjM3V0ZzWkY1UlpqNjcrWkUvUlF3MzNtYWpSdDkySUExaHR0RERq?=
 =?utf-8?B?dnd1UVBuNXN2OUJCbkFrQ0dadDFDSVZTZ1RneU9BdkNndmRqZVF5aDE0SmVB?=
 =?utf-8?B?T3lxc3hkTXZSc1VLY3BKMXVGL3JNQXBaNE1uZXl0R1djdFlLSjBSRzRXRkFw?=
 =?utf-8?B?bW0zay9laWloVCs2aU5YUGE1SlpRaHZDaHhLMC9lVHZ1bVNUSlJPVlE5aG9F?=
 =?utf-8?B?eCtnRFlOQWVSNGhaMk03eXRTVjhwSnpiUzJSM0ZzREJkRkJYNzRkUmpkZkxt?=
 =?utf-8?B?Q0ZsYUppUmlWZC9kL0ZTdEtBd1l4V1hsVStZN1h6ZnRVejRwM2RqcGJYdFRq?=
 =?utf-8?B?OCszUkFZRGRnakRTaFZ1NXJxL2cvK2dudUdmMHpiYVdXRm0wanp6bU14YlYw?=
 =?utf-8?B?Mnk2ZThWaFRZaUsxY0J4NXg0TjVzeW1HL2FuVUJFaEl3ZE9aU3hhaGZyYUFv?=
 =?utf-8?B?N1phdXlZWUtDSkFTa2tZK01DT0xlbHZJUFVxeWxzSFlUdDZHaFRaZXk2bi85?=
 =?utf-8?B?YmxUdXJHNXVyOGwvbmlEb0RJZkxNOFFZYUxBS1NnQ2V0dmVPZUExNUxNdjJ4?=
 =?utf-8?B?TlZqQWIxcWExQUkya3pLS0JFUjdHL3lkREN2eWFrYk9ob3hscCtreU9LVUJs?=
 =?utf-8?B?M1QwQVN6TmYvNnREQkhMcWd1ZDdjYkJLSUhKcWJKUnpiNFhoaWxucDFiMEw2?=
 =?utf-8?B?RHdMNWlZbit3NGtuakJBRmZEOVJiS09QOWJLeFN1eHdrVzI1ZWg3dC9FTUNx?=
 =?utf-8?B?bDZEUzZIQ2ZxZkNUN2ZJS3ZLL2I5RjZZcXlJcmU1d09ROGY5WHUzQnhsTzVD?=
 =?utf-8?B?Yi9aV0YwQ0F4RDlmY2R5L1E3c3VmdWQ1TTl1RjY3TG1wWnZXbG9jMFJld3Zv?=
 =?utf-8?B?dnQvYzhYYUdPaTRCcjJvM0lUblVMdXF4a3VRaTAwd2RkblpLM1FPM3hoQXRT?=
 =?utf-8?B?QXF1RGp3cVlyOEFhcEhRWHEzZzNZVHNpNmVwWjZKSXYyTCs1a3k4dXo4V2Jy?=
 =?utf-8?B?cUFTZE12T2RhYVVIQzR2ZkZMWWdoaE80d3NYZmRubUhjWUhPWkhpc3kyRHRr?=
 =?utf-8?B?MWs4M3dZd0czWUw4WDVQVWU3b0IzdjJzbzMvWkNVaDc0dm1MMk95QkNxejhG?=
 =?utf-8?B?U0FEbGxPdHIrUWVCV1Q4Tjl0V2wvUGVFcmh5THVsYlJxQTZSRTdGYy8rOHdY?=
 =?utf-8?B?VUhKNk9JUTRpYklHYlhnbmJmU3gwN3BMcXoyMjVOaU9UdEs1TjdKT2hMSlJz?=
 =?utf-8?B?R2NURDZDazBlVzVRTGN6THVrNTBNY2d3RlNBajl3c3FjdThLMGRYOHl4Tjdp?=
 =?utf-8?B?NHpkbTl1M0Q2YldtcHl5elozamdaRjN4VjZ5NjgzZ3l5Qy9YTjB2QTRqZWhy?=
 =?utf-8?B?aDZPNjZSeU1ndXZ4dnBsWEc4Mi9kNGp4Uy9kOWVLeHdaSkFXd1IxRGdrdno4?=
 =?utf-8?B?dEdwVXU1NVd6YjBjQzh6V1pXa0ZPVGUwekpVNWpSaEJldVZnWnkxTVQ2Z0RW?=
 =?utf-8?B?VDdvSVhYdmpYNmRuK3pBVlFuNXFSalREaFpaSU1FQ0RnczcvckUzYlZQYVYz?=
 =?utf-8?B?UEdXWWMxLzdrZXVXamc4Vnk2QlJ1TGFxK1Vzb3VOT1hLOVZHVkxHODlMVjVJ?=
 =?utf-8?B?c1pmdVBLbU0vMEw1c3RkUUhJMlVDY3lYaUxUc3EwdWRGMnkzbER2ZjdaVE5I?=
 =?utf-8?B?NGx1WUlCamZLd2VjSWlNbXhSUkZadEVSZkM3U3ZqZG5nOVl5ZFdxNy93b0dS?=
 =?utf-8?B?RTFIUE12ZDNBVVlWT2h0UTJ5WFVnWFhmbDg5Y3RuNk9oNDRyVWtlaHpJVE91?=
 =?utf-8?B?azZkd0pSR296bzRGUTYyckl5UXZMNVNlcHMwc2VlNHRvcEp0NTExanpjckp1?=
 =?utf-8?Q?KgYY=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB8451.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 169d3606-ae35-4dcb-e212-08dd6b534a71
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Mar 2025 04:12:43.1530
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: HGR2wxdYIEqZKi3dlOkfi6rpC8PpIFB5tAwAUVpEz16VVuDMP8uzdHOJyoQl6dp2X2hFJTVIGjMVUpc486iP2Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6657

W1B1YmxpY10NCg0KSGksDQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTog
SmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPg0KPiBTZW50OiBNb25kYXksIE1hcmNoIDI0
LCAyMDI1IDEwOjI4IFBNDQo+IFRvOiBQZW5ueSwgWmhlbmcgPHBlbm55LnpoZW5nQGFtZC5jb20+
DQo+IENjOiBIdWFuZywgUmF5IDxSYXkuSHVhbmdAYW1kLmNvbT47IEFuZHJldyBDb29wZXINCj4g
PGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+OyBSb2dlciBQYXUgTW9ubsOpIDxyb2dlci5wYXVA
Y2l0cml4LmNvbT47DQo+IEFudGhvbnkgUEVSQVJEIDxhbnRob255LnBlcmFyZEB2YXRlcy50ZWNo
PjsgT3J6ZWwsIE1pY2hhbA0KPiA8TWljaGFsLk9yemVsQGFtZC5jb20+OyBKdWxpZW4gR3JhbGwg
PGp1bGllbkB4ZW4ub3JnPjsgU3RlZmFubyBTdGFiZWxsaW5pDQo+IDxzc3RhYmVsbGluaUBrZXJu
ZWwub3JnPjsgeGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnDQo+IFN1YmplY3Q6IFJlOiBb
UEFUQ0ggdjMgMDIvMTVdIHhlbi94ODY6IGludHJvZHVjZSBuZXcgc3ViLWh5cGVyY2FsbCB0byBw
cm9wYWdhdGUNCj4gQ1BQQyBkYXRhDQo+DQo+IE9uIDA2LjAzLjIwMjUgMDk6MzksIFBlbm55IFpo
ZW5nIHdyb3RlOg0KPiA+ICsgICAgcG1faW5mbyA9IHByb2Nlc3Nvcl9wbWluZm9bY3B1aWRdOw0K
PiA+ICsgICAgLyogTXVzdCBhbHJlYWR5IGFsbG9jYXRlZCBpbiBzZXRfcHNkX3BtaW5mbyAqLw0K
PiA+ICsgICAgaWYgKCAhcG1faW5mbyApDQo+ID4gKyAgICB7DQo+ID4gKyAgICAgICAgcmV0ID0g
LUVJTlZBTDsNCj4gPiArICAgICAgICBnb3RvIG91dDsNCj4gPiArICAgIH0NCj4gPiArICAgIHBt
X2luZm8tPmNwcGNfZGF0YSA9ICpjcHBjX2RhdGE7DQo+ID4gKw0KPiA+ICsgICAgaWYgKCBjcHVm
cmVxX3ZlcmJvc2UgKQ0KPiA+ICsgICAgICAgIHByaW50X0NQUEMoJnBtX2luZm8tPmNwcGNfZGF0
YSk7DQo+ID4gKw0KPiA+ICsgICAgcG1faW5mby0+aW5pdCA9IFhFTl9DUFBDX0lOSVQ7DQo+DQo+
IFRoYXQgaXMgLSB3aGljaGV2ZXIgRG9tMCBpbnZva2VkIGxhc3Qgd2lsbCBoYXZlIGRhdGEgcmVj
b3JkZWQsIGFuZCB0aGUgb3RoZXINCj4gZWZmZWN0aXZlbHkgaXMgZGlzY2FyZGVkPyBJIHRoaW5r
IGEgd2FybmluZyAocGVyaGFwcyBhIG9uZS10aW1lIG9uZSkgaXMgbWluaW1hbGx5DQo+IG5lZWRl
ZCB0byBkaWFnbm9zZSB0aGUgY2FzZSB3aGVyZSBvbmUgdHlwZSBvZiBkYXRhIHJlcGxhY2VzIHRo
ZSBvdGhlci4NCj4NCg0KSW4gbGFzdCB2MiBkaXNjdXNzaW9uLCB3ZSBhcmUgZGlzY3Vzc2luZyB0
aGF0IGVpdGhlciBzZXRfcHhfcG1pbmZvIG9yIHNldF9jcHBjX3BtaW5mbyBzaGFsbCBiZSBpbnZv
a2VkLA0Kd2hpY2ggbWVhbnMgZWl0aGVyIFBYIGRhdGEgaXMgcmVjb3JkZWQsIG9yIENQUEMgZGF0
YSBpcyByZWNvcmRlZC4NCkN1cnJlbnQgbG9naWMgaXMgdGhhdCwgY3B1ZnJlcSBjbWRsaW5lIGxv
Z2ljIHdpbGwgc2V0IHRoZSBYRU5fUFJPQ0VTU09SX1BNX1BYL0NQUEMNCmZsYWcgdG8gcmVmbGVj
dCB1c2VyIHByZWZlcmVuY2UsIGlmIHVzZXIgZGVmaW5lcyB0aGUgZmFsbGJhY2sgb3B0aW9uLCBs
aWtlICJjcHVmcmVxPWFtZC1jcHBjLHhlbiIsIHdlIHdpbGwgaGF2ZSBib3RoDQogWEVOX1BST0NF
U1NPUl9QTV9QWCB8IFhFTl9QUk9DRVNTT1JfUE1fQ1BQQyBzZXQgaW4gdGhlIGJlZ2lubmluZy4N
CkxhdGVyIGluIGNwdWZyZXEgZHJpdmVyIHJlZ2lzdGVyIGxvZ2ljLCBhcyBvbmx5IG9uZSByZWdp
c3RlciBjb3VsZCBiZSByZWdpc3RlcmVkICwgaWYgYW1kLWNwcGMNCmJlaW5nIHJlZ2lzdGVyZWQg
c3VjY2Vzc2Z1bGx5LCBpdCB3aWxsIGNsZWFyIHRoZSAgWEVOX1BST0NFU1NPUl9QTV9QWCBmbGFn
IGJpdC4NCkJ1dCBpZiBpdCBmYWlscyB0byByZWdpc3RlciwgZmFsbGJhY2sgc2NoZW1lIGtpY2tz
IG9mZiwgd2Ugd2lsbCB0cnkgdGhlIGxlZ2FjeSBQLXN0YXRlcywgaW4gdGhlIG1lYW4gdGltZSwN
CmNsZWFyaW5nIHRoZSBYRU5fUFJPQ0VTU09SX1BNX0NQUEMuDQpXZSBhcmUgdHJ5aW5nIHRvIG1h
a2UgWEVOX1BST0NFU1NPUl9QTV9QWCBhbmQgWEVOX1BST0NFU1NPUl9QTV9DUFBDIGV4Y2x1c2l2
ZQ0KdmFsdWVzIGFmdGVyIGRyaXZlciByZWdpc3RyYXRpb24sIHdoaWNoIHdpbGwgZW5zdXJlIHVz
IHRoYXQgZWl0aGVyIHNldF9weF9wbWluZm8gb3Igc2V0X2NwcGNfcG1pbmZvDQppcyB0YWtlbiBp
biB0aGUgcnVudGltZS4NCg0KPiBXaXRoIHRoaXMgaXQgYWxzbyByZW1haW5zIHVuY2xlYXIgdG8g
bWUgaG93IGZhbGxiYWNrIHRvIHRoZSBsZWdhY3kgZHJpdmVyIGlzIGludGVuZGVkDQo+IHRvIGJl
IHdvcmtpbmcuIEJvdGggdGFrZW4gdG9nZXRoZXIgYXJlIGEgc3Ryb25nIHN1Z2dlc3Rpb24gdGhh
dCBpbXBvcnRhbnQNCj4gaW5mb3JtYXRpb24gb24gdGhlIG1vZGVsIHRoYXQgaXMgYmVpbmcgaW1w
bGVtZW50ZWQgaXMgbWlzc2luZyBmcm9tIHRoZSBkZXNjcmlwdGlvbi4NCj4NCj4gPiBAQCAtMjcs
OCArMjgsNiBAQCBzdHJ1Y3QgcHJvY2Vzc29yX3BlcmZvcm1hbmNlIHsNCj4gPiAgICAgIHN0cnVj
dCB4ZW5fcGN0X3JlZ2lzdGVyIHN0YXR1c19yZWdpc3RlcjsNCj4gPiAgICAgIHVpbnQzMl90IHN0
YXRlX2NvdW50Ow0KPiA+ICAgICAgc3RydWN0IHhlbl9wcm9jZXNzb3JfcHggKnN0YXRlczsNCj4g
PiAtDQo+ID4gLSAgICB1aW50MzJfdCBpbml0Ow0KPiA+ICB9Ow0KPiA+DQo+ID4gIHN0cnVjdCBw
cm9jZXNzb3JfcG1pbmZvIHsNCj4gPiBAQCAtMzcsNiArMzYsOSBAQCBzdHJ1Y3QgcHJvY2Vzc29y
X3BtaW5mbyB7DQo+ID4gICAgICBzdHJ1Y3QgeGVuX3BzZF9wYWNrYWdlIGRvbWFpbl9pbmZvOw0K
PiA+ICAgICAgdWludDMyX3Qgc2hhcmVkX3R5cGU7DQo+ID4gICAgICBzdHJ1Y3QgcHJvY2Vzc29y
X3BlcmZvcm1hbmNlICAgIHBlcmY7DQo+ID4gKyAgICBzdHJ1Y3QgeGVuX3Byb2Nlc3Nvcl9jcHBj
IGNwcGNfZGF0YTsNCj4gPiArDQo+ID4gKyAgICB1aW50MzJfdCBpbml0Ow0KPiA+ICB9Ow0KPg0K
PiBUaGlzIG1vdmluZyBvZiB0aGUgImluaXQiIGZpZWxkIGFuZCB0aGUgbWVjaGFuaWNhbCBjaGFu
Z2VzIGNvbWluZyB3aXRoIGl0IGNhbiBsaWtlbHkNCj4gYmUgc3BsaXQgb3V0IHRvIGEgc2VwYXJh
dGUgcGF0Y2g/IFByb3ZpZGVkIG9mIGNvdXJzZSB0aGUgbW92ZW1lbnQgaXMgc3RpbGwNCj4gd2Fu
dGVkL25lZWRlZCB3aXRoIHBhdGNoIDEgcmUtd29ya2VkIG9yIGRyb3BwZWQuDQo+DQo+IEphbg0K

