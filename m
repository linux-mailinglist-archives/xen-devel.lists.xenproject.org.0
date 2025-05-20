Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 51219ABD398
	for <lists+xen-devel@lfdr.de>; Tue, 20 May 2025 11:39:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.990596.1374539 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uHJRc-0002HQ-VV; Tue, 20 May 2025 09:39:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 990596.1374539; Tue, 20 May 2025 09:39:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uHJRc-0002EQ-RZ; Tue, 20 May 2025 09:39:32 +0000
Received: by outflank-mailman (input) for mailman id 990596;
 Tue, 20 May 2025 09:39:31 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=EAyu=YE=amd.com=penny.zheng@srs-se1.protection.inumbo.net>)
 id 1uHJRb-0002EA-DP
 for xen-devel@lists.xenproject.org; Tue, 20 May 2025 09:39:31 +0000
Received: from NAM04-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam04on20605.outbound.protection.outlook.com
 [2a01:111:f403:240a::605])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5316e509-355e-11f0-b892-0df219b8e170;
 Tue, 20 May 2025 11:39:28 +0200 (CEST)
Received: from DM4PR12MB8451.namprd12.prod.outlook.com (2603:10b6:8:182::7) by
 SN7PR12MB6910.namprd12.prod.outlook.com (2603:10b6:806:262::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8746.30; Tue, 20 May
 2025 09:39:24 +0000
Received: from DM4PR12MB8451.namprd12.prod.outlook.com
 ([fe80::b04e:2da5:7189:4c4d]) by DM4PR12MB8451.namprd12.prod.outlook.com
 ([fe80::b04e:2da5:7189:4c4d%4]) with mapi id 15.20.8746.030; Tue, 20 May 2025
 09:39:24 +0000
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
X-Inumbo-ID: 5316e509-355e-11f0-b892-0df219b8e170
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=khpucjU/1tw+VdX57xl6BzsNWGejTFZ4ysonXrwRRgy9SER9nAJ5o2jaO5vJgamzJAXVwo/GypvC/13VjxfjG5uGFt/Lc1kYS2tOYevwOpaxPJZwXN+w1RJ07oHK0HrmtFgPILpH8FDT3UdWkfE3V8gVN0kCbvTeATLoNoI6CUhZOnN9PJdWMY3iS949GozbUYamsLtIitMM8/RzZuApa08D13e8fqvngljXMtsbeDEMGQEvKsOKXIfdqp/WXkOcRG4dHzy11RyqqZ9NQMmJqOZlhId+xx2QlEUC3WJgpDb/urRFckRd/GGHTqCDxWJEydrhspfhKEbchC8bNHdu8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=W7cIxaU2MzYQ8UAcknvikbu/La2Z5BfuQvvrMNXyH70=;
 b=Gt67cVwfqkVYOZIsmEWKSCcoY2gj5laoJGiWOZU2zuC8OiNqCOsKx16aNynoiGhOdzP93e0i5QkeacqydZJ1m/RDcc47gi40WuCnxUSbGwh6PmnbCOm5CPsCObk8X1P1QxzLPECmq9pcsT/LCK+B1WEZPs4edg6Nt19sTbOLV/xIBXsbze43J5NIaTzJaTj+mh+tknvVrLlbwM558G63U5JZwPWR/ruLTQ5gLl/TF4FrPud7H4KAnyRbUojFS0fazhyl1uiaWPG6gXM/8BxKXCm2Zo8U+ZsS3tGmzeui3OQMnR7WuIBsE5cdgVTwiyo5RetTnihwkAByMLnGyRIllA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=W7cIxaU2MzYQ8UAcknvikbu/La2Z5BfuQvvrMNXyH70=;
 b=eJg4dF1D7LyF1TJaSJJFPsPS79MJ6EEjV39XOOjeg8hexxKnew9un9Z9ok5wLhssAXll7hn41BKffrF6MXGnJzhKAAVArlEJbm3TSoBf04/BUiAz7Qpo8idhvW6nVJqzQUuZYIwxh97PosCmjVNg/sy5oX8Zq3KokxVHnJu+LwQ=
From: "Penny, Zheng" <penny.zheng@amd.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "Huang, Ray" <Ray.Huang@amd.com>, Anthony PERARD
	<anthony.perard@vates.tech>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
Subject: RE: [PATCH v4 12/15] tools/xenpm: Print CPPC parameters for amd-cppc
 driver
Thread-Topic: [PATCH v4 12/15] tools/xenpm: Print CPPC parameters for amd-cppc
 driver
Thread-Index:
 AQHbrRCuBHJz/5ZpqUqHhc0gdq6hGrO8VLYAgA1zbxCABpifAIAK/PXggAAYTwCAAAAz8A==
Date: Tue, 20 May 2025 09:39:24 +0000
Message-ID:
 <DM4PR12MB8451127E82594867B6EDAD61E19FA@DM4PR12MB8451.namprd12.prod.outlook.com>
References: <20250414074056.3696888-1-Penny.Zheng@amd.com>
 <20250414074056.3696888-13-Penny.Zheng@amd.com>
 <63b3b016-551c-4201-a3b3-db19b27ea649@suse.com>
 <DM4PR12MB8451F0794ED87DE6F9E5F2A3E18AA@DM4PR12MB8451.namprd12.prod.outlook.com>
 <75679a60-7ca0-41da-b542-c5b9d5efdfbe@suse.com>
 <DM4PR12MB8451E0A93F3F45229B8AD900E19FA@DM4PR12MB8451.namprd12.prod.outlook.com>
 <4a5580aa-2a2a-4b67-9bea-1c53fa5639e4@suse.com>
In-Reply-To: <4a5580aa-2a2a-4b67-9bea-1c53fa5639e4@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
 MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_ActionId=76eb52f0-92d7-4b33-b17a-a123cb5fdf07;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_ContentBits=0;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Enabled=true;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Method=Privileged;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Name=Open
 Source;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_SetDate=2025-05-20T09:34:01Z;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Tag=10,
 0, 1, 1;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR12MB8451:EE_|SN7PR12MB6910:EE_
x-ms-office365-filtering-correlation-id: 00298ac0-a14f-4af9-3e3c-08dd978234cb
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|376014|366016|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?czBMN1BDeVdMYkxpTmhZTUVJR0NDdnpVNTYwSGdrU2RYQTU2WVc1Z2dDRW5h?=
 =?utf-8?B?SG9GL3hGR1NQdWZGZEtLeEsrcU5Yb3l5Mk9ZRlp1RmZQdVlaQWh1enMzSzY1?=
 =?utf-8?B?cFBYM0xvaUVuL3VRSVFvQzI2OXhXSjM3TmlHbkFMNmhPQVlEbE9jQVlkNnAx?=
 =?utf-8?B?U2g0aU9WVnRzWENTa04xZWxycXBqYnBncDVnZkdFSUNORndKaGhSbkJYdzNO?=
 =?utf-8?B?Q0JGcWlRNmg1R0lwYUppb1dsNGcwNnVPcWwyZE0xdWRRL0swSTVheERraktp?=
 =?utf-8?B?L1pUeE9lcEpuSU5HdjRxWnplVWdra1M3M2QyaUUwRVprVTgrM28wOFFBRFg4?=
 =?utf-8?B?NVBpL0JVeVRTMG1GbXFRRmNqVURSam1mRkJHM2ZvZlhyQ2FMM3c0RWsySk1z?=
 =?utf-8?B?V3JaMjFzeURVUTBkRWhLYldwVngwc0g4S2ZrbFVJY1ZFSC90S2Zlc0Zvcjh6?=
 =?utf-8?B?MTdaaE5FbDFnNEpSL05sSkhpYi9DWmh2bDI5bnE4cGdDQlA5cFJwWTBaNU1N?=
 =?utf-8?B?MWxRM0MzbHdkR2hZWmMyTWtzSjhrUVdISTRVTXBJT01DeVN2WnZxQVRaWjJp?=
 =?utf-8?B?OVY3U1dPZ1pHV05PVWhLb3Z2V3BVWDZ4Q1VnNmRrUHRsMEY1dkRHSm1zWjRj?=
 =?utf-8?B?YSt5YUxSdGtyZUJHaXlrRXI5S0E3c1hSODFBbXhydE1DZUJVdFdqdzFoMFND?=
 =?utf-8?B?VlFkOFlSMTkveG1nd3IvenhLTTBEYnYzMldQQ3c4NHR1OS9PUmRNSVk0VkF1?=
 =?utf-8?B?Rm4rbWt5bTlaMHAzeHhMaEk2cG8rWVkxSnBRYi9TdVg0bFlSdzQrZ3krcjJG?=
 =?utf-8?B?SGlyMU5zMFcyOGwzZStyeXZPb0V6RDUybVV6WExXZ1NvZElyMmtEcUlSZVBm?=
 =?utf-8?B?bnhCbkV2V1duUnRjaTF4UDcrVWJZeTZOcUhpTW5FeVFXVWkyRTM2WkU0NTNE?=
 =?utf-8?B?eGxtVUhkb2NqdlI4cGE2KzFhRlMrQUpGaHQ4V2tSeDgxWERlQVJQQzV5Y2Zp?=
 =?utf-8?B?b1BLSGhCUHMzNG9pUk0zeTNybHZkOU1zb09ucW54N29LbFdNS1BoamhkMyt6?=
 =?utf-8?B?dkZxZXNVV2U4c2NOK1IyNEt3a0Z0ckE5WXlRZWc1YmhoWW43Ky9HbGxOMmtD?=
 =?utf-8?B?Tm1FdkNyR1ZSSVNicCtXbWhJTE5zcTl5bVRCN1lkSmd0VUltMHdvYWpzSUV6?=
 =?utf-8?B?SGJMWCtwV1dISjZaT1ZNZ2xTVWYvaXlWU0M3VFR2OWhjUyt4aXJqMGI1WU5l?=
 =?utf-8?B?VG5oWmhZOVc2ZnkxU3R6djFpODUrdHlVN2R4Z2xDRkRuYUZSQ3BlZnBaT0hU?=
 =?utf-8?B?M3Fha05lOWhNQlhEUnlBb0dtWEZCclVBNnlVeWVCTVk1cjBIQjNUc04rUHYv?=
 =?utf-8?B?S2d2YUx4N3FoUUJ2MkF2ZjVKZGJyL2t3dXZtb0FWM3ZhMDROMkpGMzNodjBa?=
 =?utf-8?B?a2VJMjNKVmtzbHVCSkpoR0hZeWgrZVZVd1BzR2lidTdqSGg2MlY5clBGUmgz?=
 =?utf-8?B?NFFWUkZoMnRMNHJtSG9OcGFpVGlCTEp6Vm1iRUI5bmt1TWNwUXFaakx1amlw?=
 =?utf-8?B?eGFVaVlXNTBLZ0Fzbmx6WXdqK3ZsVFJ6a2RDVXYzZjJNejZKYkxhdlBMUlRP?=
 =?utf-8?B?NFM2K2NZR0U5MTJmNGxuV3VQcThLb0U3UXQ0VTdsc0FFcTdtamRDelZkTXUw?=
 =?utf-8?B?dlYwcCtKOCtlSnNoN2E0K2t6blRHVnZkK2pKNTFpUVJsbDRFL3Z2UVVIZzZ4?=
 =?utf-8?B?TTllUEQ0N1Fudksyc3FRcDFaYkQ0aEh2SnVnRG1DV2s4NzlSRCtDMStxVzEv?=
 =?utf-8?B?R1VlN2c5a3J2UUFFS1dMT0Rsb3FhMlB6MkxGVGZ6Wjk5SEtXS2NhQWRuc1RB?=
 =?utf-8?B?Zi94Y1NYVzlhNllvNlZKL0JJNUlPZGJrOTJVdUV6ejhiUjlBKzg2aEFDNVl2?=
 =?utf-8?B?NmpHbWx1SDlqV2FkUVdKdjN6YzVxQU96MjJYUEZBR0R6V2ZrZFY0VjBPRDl0?=
 =?utf-8?Q?Nkfpg5i3XgKzvytjLq1itsNaQWIkOE=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR12MB8451.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?R1lYQWcrK01peXJwUlg0NTk2bHN4SUE0TlFGcC9NQ3IvSWFhOEVMZzhPSWg2?=
 =?utf-8?B?N2dIb3NrUmhkWWMxcmhrN3ZzUDlVbzZ2RzkrRzlCNVRqbzhIcEdEOHBCUFgz?=
 =?utf-8?B?QU94VDY0QzFWZHpNc0Zza0pGVTNLQjdFWEtwVlV4MFg3T29oRGk2RnY1OG52?=
 =?utf-8?B?TGVJeGxxMktFWkluRDlXL0ZuU2t6R3JVUG9rZm9RT2hyUVVUb3hzaUtVRVlF?=
 =?utf-8?B?VExqQWJhUEVEQlBuRG1GeFZIZ2kzekl6TGJsRytsTXR0LzBZKzNZQUFuWVBS?=
 =?utf-8?B?RzdaaHFiZlo1bDJZWHJKYXdZY3h5a3pKWGlqWXJBN2phUVB3R0wyYWc5Mm8y?=
 =?utf-8?B?UStTWm1HRHJqVFVQWmpwbDJCRGdCL1BLUFZBUm13Z1BBNjdKbDlKS3JqN0M2?=
 =?utf-8?B?NlhQZEpVREFHWXhxSmxkNmZ0WmlGektTYk03QjJSdVd4dkFhL2p0TjlCZHVE?=
 =?utf-8?B?MVVLVFRRSFdGVmJCaU9FRlp5SUxhRjNoeFJ6K2dzK0tLUG9UZnZIRkhuZ0xn?=
 =?utf-8?B?NHNQcE5QOTFkNW5QeGJoV3ZpcVh5S2J1VDdkVkR1KzA5UmdrMXJ5QTdDa1Nk?=
 =?utf-8?B?eGZZTFNBTGdLMTZWbzU2eGpETkZFNnNnblhVRFg1UFBSdGExZFBJTHo3TU4x?=
 =?utf-8?B?enp1V2NrL1lJOFdzNGIrTngrUHJvOHdUVHBnU0t2dHh1bFdqdTdnZ01oZ2lP?=
 =?utf-8?B?N2NXdk4xN0JKQUZUbm1tUHVqUHZSUmo1aTNvZHEyVm9rWEo2M0J3azRvM3NS?=
 =?utf-8?B?MnMyNFNtVDdPNWwxajhFSUpVUU1xeUJiSkFNYkRZS3FLZ1JTb0R2ai8rbmox?=
 =?utf-8?B?SFFwSmNzVUo2eG5yRzhQK2ZHTFd3blNLanRTTWFrMlk0YWNJaHlLb1gwemNl?=
 =?utf-8?B?UzFER0M4d0FrMERIUlBGOUpYbnVCbit3eklGMnpJNW8zL1RFcGp2c3QxM2p0?=
 =?utf-8?B?cjlQbGp4eXo2VEQvUmtIUmVkNVN3cjFkNjBoTHYxaXkvai8zcklIdGZsb1pM?=
 =?utf-8?B?eVl0M3h1NlJnNEdNU2p1NkJ6MVo3RmhRbHhGYmpuRStFTlY2SWFuNSt3QTZH?=
 =?utf-8?B?V0Y1TkduSW9qdytUU1hSQ2ZIZXF1R21lQkptQzhTbFJtcmVrMThuTGc4OWdS?=
 =?utf-8?B?Q01ocXlDTkp2S2RnUlJuQnowSU9VUS9qNGduZEJOZjFOZkRDN3RLaXJrRmJC?=
 =?utf-8?B?MnlYUnZ6ZWNsenhQd2hHM21nZ3UzYXZ0MWNwT0IvSEk1WG5uVXNMOGtBZ0dY?=
 =?utf-8?B?OTArZDRVWktQV0liblJJOHVjWENYR3QyQXd6VnBVdEdOQWJqanJKZTc5cXlu?=
 =?utf-8?B?TWJ4Um9Gb0lJZ2FaWWNhNDNneTF2Kzk2QW1XdHo2OFdRS0V5cFd1bzJRRkpW?=
 =?utf-8?B?MjNmRVBHK0NqYm9qcmp2eUVpOUtwZHEyUWhiSWRSREdrRGRtdXRsZ3BBOXpK?=
 =?utf-8?B?d3cySTZMOHZ0RSs5cWVpUlhzUEZXWE5SclNtMW1FTTA2dWQ3TCtTR3hsd3FV?=
 =?utf-8?B?MTd1eVMzVVRhWTF3a1U2amlMTDlMMUhkQ0Nwd3dOeDBrZFRYdUFaTWpTT29j?=
 =?utf-8?B?bFF3RmpOYmhFK0hFa2ZUbngwVVE5eVNjdHFoZmhtN0RaUnhQM3YrcEdqMDdH?=
 =?utf-8?B?Rk0yUGN2WC8xb3NON1JHbTNtWmpKNjMxS1Bpck1PTWdNVnBWaHpoNlYzYVNa?=
 =?utf-8?B?akpkazNkdWorRTdFeWU2RjZFUEhCckpWTStlSnQ2N1dSV0hPYkx6M3ZyR2Nj?=
 =?utf-8?B?MCtqSmlKenE4Z2gyd2xSWWIzN0NwK1E3NG9lVWZCb29SbU0zS2U4bXFHUURu?=
 =?utf-8?B?STY5Mnc0dUdYd3VVVWRRUklPUnJQS3hLcXhEelpsWWlNOFdWUGQvbTVMandU?=
 =?utf-8?B?aFdTNmRDL2ovbU5vSzNySThNZDVNcUwzREwzT000RGVZb3RtTXNUUnhwR0xO?=
 =?utf-8?B?czA2dHFTblNYZ3lMWktvcDhSZUdqV2h2YUtWWUR5UlRlWUxBaHNacTVTV1Zn?=
 =?utf-8?B?MmZqVTBSYktWVVdiWW5YZ3dyWS8vdjBEaGhHVUZUeWVySThqRjUyK3VXbTFs?=
 =?utf-8?B?aWJqNHNUcVFlR01IRmduUnFDWE5tYklSMlg0Nkl6OUpsZTJUS0JURno5K25q?=
 =?utf-8?Q?gVBs=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB8451.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 00298ac0-a14f-4af9-3e3c-08dd978234cb
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 May 2025 09:39:24.3289
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Knt4Yh/Br0l0IoKziUIgOUyXaRcnQ0Wx4iLpGsF7//VwZfXtpw40uDmSubdGXEbCPLq3vX+bu4wVlVR/KGMBlw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB6910

W1B1YmxpY10NCg0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBKYW4gQmV1
bGljaCA8amJldWxpY2hAc3VzZS5jb20+DQo+IFNlbnQ6IFR1ZXNkYXksIE1heSAyMCwgMjAyNSA1
OjE4IFBNDQo+IFRvOiBQZW5ueSwgWmhlbmcgPHBlbm55LnpoZW5nQGFtZC5jb20+DQo+IENjOiBI
dWFuZywgUmF5IDxSYXkuSHVhbmdAYW1kLmNvbT47IEFudGhvbnkgUEVSQVJEDQo+IDxhbnRob255
LnBlcmFyZEB2YXRlcy50ZWNoPjsgeGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnDQo+IFN1
YmplY3Q6IFJlOiBbUEFUQ0ggdjQgMTIvMTVdIHRvb2xzL3hlbnBtOiBQcmludCBDUFBDIHBhcmFt
ZXRlcnMgZm9yIGFtZC1jcHBjDQo+IGRyaXZlcg0KPg0KPiBPbiAyMC4wNS4yMDI1IDEwOjIyLCBQ
ZW5ueSwgWmhlbmcgd3JvdGU6DQo+ID4+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+ID4+
IEZyb206IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4NCj4gPj4gU2VudDogVHVlc2Rh
eSwgTWF5IDEzLCAyMDI1IDQ6MDMgUE0NCj4gPj4NCj4gPj4gT24gMDkuMDUuMjAyNSAwODozNiwg
UGVubnksIFpoZW5nIHdyb3RlOg0KPiA+Pj4+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+
ID4+Pj4gRnJvbTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPg0KPiA+Pj4+IFNlbnQ6
IFdlZG5lc2RheSwgQXByaWwgMzAsIDIwMjUgOTo1NSBQTQ0KPiA+Pj4+DQo+ID4+Pj4gT24gMTQu
MDQuMjAyNSAwOTo0MCwgUGVubnkgWmhlbmcgd3JvdGU6DQo+ID4+Pj4+IEhXUCwgYW1kLWNwcGMs
IGFtZC1jcHBjLWVwcCBhcmUgYWxsIHRoZSBpbXBsZW1lbnRhdGlvbiBvZiBBQ1BJDQo+ID4+Pj4+
IENQUEMgKENvbGxhYm9yYXRpdmUgUHJvY2Vzc29yIFBlcmZvcm1hY2UgQ29udHJvbCksIHNvIHdl
IGludHJvZHVjZQ0KPiA+Pj4+PiBjcHBjX21vZGUgZmxhZyB0byBwcmludCBDUFBDLXJlbGF0ZWQg
cGFyYS4NCj4gPj4+Pj4NCj4gPj4+Pj4gQW5kIEhXUCBhbmQgYW1kLWNwcGMtZXBwIGFyZSBib3Ro
IGdvdmVybm9yLWxlc3MgZHJpdmVyLCBzbyB3ZQ0KPiA+Pj4+PiBpbnRyb2R1Y2UgaHdfYXV0byBm
bGFnIHRvIGJ5cGFzcyBnb3Zlcm5vci1yZWxhdGVkIHByaW50Lg0KPiA+Pj4+DQo+ID4+Pj4gQnV0
IGluIHRoZSBFUFAgZHJpdmVyIHlvdSB1c2UgdGhlIGluZm9ybWF0aW9uIHdoaWNoIGdvdmVybm9y
IGlzIGFjdGl2ZS4NCj4gPj4+DQo+ID4+PiBXZSB3YW50IHRvIGhhdmUgYSBvbmUtb25lIG1hcHBp
bmcgYmV0d2VlbiBnb3Zlcm5vciBhbmQgZXBwIHZhbHVlLA0KPiA+Pj4gc3VjaCBhcywgSWYgdXNl
cnMgY2hvb3NlIHBlcmZvcm1hbmNlIGdvdmVybm9yLCBubyBtYXR0ZXIgdmlhICJ4ZW5wbSINCj4g
Pj4+IG9yIGNtZGxpbmUsIHVzZXJzIHdhbnQgbWF4aW11bSBwZXJmb3JtYW5jZSwgV2Ugc2V0IGVw
cCB3aXRoIDAgdG8NCj4gPj4+IG1lZXQgdGhlDQo+ID4+IGV4cGVjdGF0aW9uLg0KPiA+Pj4gQW5k
IGlmIHVzZXJzIGNob29zZSBwb3dlcnNhdmUgZ292ZXJub3IsIHVzZXJzIHdhbnQgdGhlIGxlYXN0
IHBvd2VyDQo+ID4+PiBjb25zdW1wdGlvbiwgdGhlbiB3ZSBzaGFsbCBzZXQgZXBwIHdpdGggMjU1
IHRvIG1lZXQgdGhlIGV4cGVjdGF0aW9uLg0KPiA+Pg0KPiA+PiBUaGF0J3MgYWxsIGZpbmUsIGJ1
dCBjb21wbGV0ZWx5IG1pc3NlcyB0aGUgcG9pbnQgb2YgbXkgcXVlc3Rpb246IElmDQo+ID4+IHRo
ZSBnb3Zlcm5vciBpcyByZWxldmFudCwgd2h5IHdvdWxkIHlvdSBieXBhc3MgcmVzcGVjdGl2ZSBw
cmludGluZz8NCj4gPj4NCj4gPg0KPiA+IFRoZSBvbmx5IHVzZWZ1bCBpbmZvIGluIGdvdmVybm9y
IGZvciBlcHAgbW9kZSwgSU1PLCBpcyBpdHMgbmFtZS4NCj4gPiBJIGRlZHVjZSB3aGljaCBwZXJm
b3JtYW5jZSBwb2xpY3kgdXNlciB3YW50cyB0byBhcHBseSB0aHJvdWdoIHdoaWNoIGdvdmVybm9y
DQo+IHRoZXkgY2hvb3NlLg0KPiA+IElmIHVzZXIgY2hvb3NlcyBwZXJmb3JtYW5jZSBnb3Zlcm5v
ciwgdGhleSB3YW50IG1heGltdW0gcGVyZm9ybWFuY2UuDQo+ID4gSWYgdXNlciBjaG9vc2VzIHBv
d2Vyc2F2ZSBnb3Zlcm5vciwgdGhleSB3YW50IHRoZSBsZWFzdCBwb3dlcg0KPiA+IGNvbnN1bXB0
aW9uIEkgY291bGQgb25seSBwcm92aWRlIGFwcHJvcHJpYXRlIGVwcCB2YWx1ZSBpbiBhYm92ZSB0
d28gc2NlbmFyaW9zLg0KPiA+IG9uZGVtYW5kIGFuZCB1c2Vyc3BhY2UgYXJlIGZvcmJpZGRlbiBj
aG9pY2VzLCBhbmQgaWYgdXNlcnMgc3BlY2lmeQ0KPiA+IHN1Y2ggb3B0aW9ucyBpbiBjbWRsaW5l
LCBJIHNoYWxsIGdpdmUgd2FybmluZyBtZXNzYWdlIHRvIHNheSAgdGhhdA0KPiA+IGFtZC1jcHBj
IGluIGFjdGl2ZSBtb2RlIGlzIGdvdmVybm9yLWxlc3MsIGFuZCB1c2VycyBjb3VsZCBzZXQgZXBw
IHZhbHVlcyBvbg0KPiBydW50aW1lIHRvIHNwZWNpZnkgYmlhcyB0b3dhcmRzIHBlcmZvcm1hbmNl
IG9yIGVmZmljaWVuY3kuDQo+ID4NCj4gPiBJZiBhYm92ZSBpcyBtZXNzeSwgSSBjb3VsZCBhbHNv
IHRvdGFsbHkgZm9yYmlkIGdvdmVybm9yIHRoaW5nIGZvciBhY3RpdmUgbW9kZS4uLg0KPiB3ZHl0
Pw0KPg0KPiBUaGVuIGhvdyB3b3VsZCBvbmUgcGljayBiZXR3ZWVuIHBlcmZvcm1hbmNlIGFuZCBw
b3dlcnNhdmU/DQoNCkluIGh3cCwgd2UgZGVmaW5lZA0KIg0KI2RlZmluZSBDUFBDX0VORVJHWV9Q
RVJGX0JBTEFOQ0UgICAgICAgICAweDgwDQoiDQp0byBwcm92aWRlIHRoZSBiYWxhbmNlZCB2YWx1
ZS4gVXNlcnMgY291bGQgcnVuICJ4ZW5wbSBzZXQtY3B1ZnJlcS1jcHBjIGJhbGFuY2UiIHRvIGFj
aGlldmUgb24gcnVudGltZQ0KQW55IG90aGVyIHNwZWNpZmljIGVwcCB2YWx1ZSwgdXNlcnMgc2hh
bGwgcnVuICJ4ZW5wbSBzZXQtY3B1ZnJlcS1jcHBjIGVuZXJneS1wZXJmOk4iIHRvIGFjaGlldmUN
CldlIGRpZG4ndCBwcm92aWRlIGFueSBvcHRpb25zIGluIGNtZGxpbmUsIHNvIEkgdHJpZWQgdG8g
cmUtdXNlIHRoZSBnb3Zlcm5vciB0byBhY2hpZXZlIGEgZmV3LiBobW1tLA0Kbm93IGl0IHNlZW1z
IGl0IGJyaW5ncyBjb25mdXNpb24uLi4uDQoNCj4NCj4gSmFuDQo=

