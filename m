Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 60CFFAF8613
	for <lists+xen-devel@lfdr.de>; Fri,  4 Jul 2025 05:41:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1032698.1406157 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uXXHq-0003IE-2q; Fri, 04 Jul 2025 03:40:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1032698.1406157; Fri, 04 Jul 2025 03:40:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uXXHp-0003GM-Sy; Fri, 04 Jul 2025 03:40:29 +0000
Received: by outflank-mailman (input) for mailman id 1032698;
 Fri, 04 Jul 2025 03:40:27 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=MIza=ZR=amd.com=penny.zheng@srs-se1.protection.inumbo.net>)
 id 1uXXHn-0003GG-Fy
 for xen-devel@lists.xenproject.org; Fri, 04 Jul 2025 03:40:27 +0000
Received: from NAM02-BN1-obe.outbound.protection.outlook.com
 (mail-bn1nam02on20610.outbound.protection.outlook.com
 [2a01:111:f403:2407::610])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9c7dde2a-5888-11f0-b894-0df219b8e170;
 Fri, 04 Jul 2025 05:40:21 +0200 (CEST)
Received: from DM4PR12MB8451.namprd12.prod.outlook.com (2603:10b6:8:182::7) by
 CY5PR12MB6623.namprd12.prod.outlook.com (2603:10b6:930:41::20) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8901.21; Fri, 4 Jul 2025 03:40:17 +0000
Received: from DM4PR12MB8451.namprd12.prod.outlook.com
 ([fe80::b04e:2da5:7189:4c4d]) by DM4PR12MB8451.namprd12.prod.outlook.com
 ([fe80::b04e:2da5:7189:4c4d%5]) with mapi id 15.20.8901.021; Fri, 4 Jul 2025
 03:40:17 +0000
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
X-Inumbo-ID: 9c7dde2a-5888-11f0-b894-0df219b8e170
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=y2wqP+i4RowPXq61O6qgUiecSHg8LOwQQ8LvkS7010qCu7LxP37nOGAlhHuGRg+O08tbzbKsVRJnTB3H+7Sogu/yYHgzTDhV3yuWS0bwCnGS+cEXStEuoFsbIG+sjwgs+glqk8LL9YvQ3BUx26ACGhcW7F1ud6ohhnfp1FlmRBNhSSEjx46bIiyNkvOV9HLpeAlHqp+esiQb2VIxtAVF1RMZIi/cmX+AnDNxZWNHQEXebqnKhLkbA5kht52lnyL9v6mIIUpnJq/Bp0bP3D2ZZ6jxjhE9X62uomDE0RKtT/2OVv6oojsfQuyv62qzvYyw58V8BGMHz3Z23N3mf8oC7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=P8I4AlRl9Hg8N2gkbc45S8Pdyga0yzuwQuxrTHOK9X8=;
 b=j46QIQxJZEnaWtjtP/v+u5XhZUKpEjulJ/Ph7HUdm8EJ6sEORAvtvb0o2sX8m9v823jooUsAQ8EWkRNjPMQybMqoo6gvi2Zj1JJjesrBxCXx2soY+X7p023QOYcaYfsZQDC3dzWl26Sav29NXqdv6te9HMbMOAGU1kgfXh5ML9n0sUDHlu3MR7jSJMr0obdLeD6BeMj37KnsVf3K1kReK5FnEg3U+LhJQOScn7uX2rTcmh9RNopwSQEhgFPH40LtLwG57IXGTHMWr0VhS8JXUw4yKtJlPYzehnEEpck3WiI1eUDwyZnhvj3ycYa7U6Y37jOzh4xOGaA0dz1FyJiIiw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=P8I4AlRl9Hg8N2gkbc45S8Pdyga0yzuwQuxrTHOK9X8=;
 b=D5fH+wLwMSOg9XzFaoyj153vhqtIlcvKt7ai6F9rbWv/nDBJO2bjbQ5ztt7AbkmmB1pbzhcmleVGKq3zhJNrnAR7uKWdwnqba/XgWCoNqhtk+sql6wN4/C7JWWbqtnpr0vOEWwtN3MgY7Gw40EdFHF48gUIlMEoKLjpD30Xorj8=
From: "Penny, Zheng" <penny.zheng@amd.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "Huang, Ray" <Ray.Huang@amd.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?=
	<roger.pau@citrix.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
Subject: RE: [PATCH v5 10/18] xen/cpufreq: introduce a new amd cppc driver for
 cpufreq scaling
Thread-Topic: [PATCH v5 10/18] xen/cpufreq: introduce a new amd cppc driver
 for cpufreq scaling
Thread-Index: AQHbzuRFzooSbGuOOkWtJb1ZJ/MIx7QGEZYAgBiv97CAAB5CAIACoScg
Date: Fri, 4 Jul 2025 03:40:17 +0000
Message-ID:
 <DM4PR12MB84512DB2E098CE364A9A53BAE142A@DM4PR12MB8451.namprd12.prod.outlook.com>
References: <20250527084833.338427-1-Penny.Zheng@amd.com>
 <20250527084833.338427-11-Penny.Zheng@amd.com>
 <964dcd5e-6a7d-41f2-94b4-c07672ffdc89@suse.com>
 <DM4PR12MB8451D32EC45867F91C37F702E140A@DM4PR12MB8451.namprd12.prod.outlook.com>
 <d0b2e49a-293a-481d-8c6d-626a19513122@suse.com>
In-Reply-To: <d0b2e49a-293a-481d-8c6d-626a19513122@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
 MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Enabled=True;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_SetDate=2025-07-04T03:40:07.0000000Z;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Name=Open
 Source;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_ContentBits=3;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Method=Privileged
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR12MB8451:EE_|CY5PR12MB6623:EE_
x-ms-office365-filtering-correlation-id: 05cf79fc-bf58-460b-fab8-08ddbaac7e54
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?NVpVRk5mcFc3OUtXa2pZa0J3OEdRYzV2SUZ1Mnp3eGpmbE1iUUQrOWRwZytM?=
 =?utf-8?B?WkFLcGxxK0phYU1XWW5pL2RhcVVHanVhQVdKdXpJem5PT2xBREFZUWJOVU1Y?=
 =?utf-8?B?K21EZGdpSEZYTnJESERBM0o4aUVOK3N5RmwxNlE0b1pIaFNOY0Fib1hpeHlY?=
 =?utf-8?B?eU9RaEV0allFNzVNcjBJRHNpZzVZVHlDRFpFY2QwNmZhL1RvVFM0VW5DalBP?=
 =?utf-8?B?Z25ualFqb0ZZVTdVUFh3Vm1wMllONVYwWCtoZzNIQmQvZ3RxN0haOVI3NzZa?=
 =?utf-8?B?T1h6WUxpTGRCY1BQKyttU0twYlo1b1ByM29SZDNsZE4zOVl6V2RIVDVrMlBU?=
 =?utf-8?B?Z1o0bjBJM1RqMGNxcnJmdjNRVU44alM0WmZmcFpwd3g1SUxvOW9XZTVtQ2Qz?=
 =?utf-8?B?dXdnYkVXSkRSVWp1U1gwbUw2a09XeWhJam15bSs3UWh2MFpyc2RKeU1pQXZ3?=
 =?utf-8?B?RXdjNTNpT0d3R2NCRkErbnFaTnBlRnhmOWVnV0R3Z3dOSmZqS1lGZVFEM2tL?=
 =?utf-8?B?S3U2QWhVdFdsYUlUbTZzUXA3MkpyR0dURWtSN0NqaGY1OGs5dzdiTEhZSjRN?=
 =?utf-8?B?bGkzUy9uT3pQc3lGNkJMK2dlMlpKQ25FazNZYnBrK1BvRTNRWDNuRDI4TFNH?=
 =?utf-8?B?aS8rWmF5K0ZJMG9Ub1MxbXVTdlFxcWZOeXBvZjRDWjhwRk8wUGk0N1UrcDRl?=
 =?utf-8?B?ak9TNjBWdVptUE5CSU1hcVJPeWVFVmR5aDl3LzFVUXVnTWoxWU1ZWHpJVXdI?=
 =?utf-8?B?d2FhMTZWMWRGUDZKUG8zckZuTUIrcDVvZEZSMForclQrNDY5clVOdTBoTUgw?=
 =?utf-8?B?bkVWanp3eEZzbm9pVDRtdnU4bnl6KzlWcFc5M3BhV3NSQVFIRHhoY3RGVDFY?=
 =?utf-8?B?ZlFPc0ljakdZY2V5N2dDdXlDN0F3NTRSaUtiTTB0VGVyR05zRWRxZytiZ2xY?=
 =?utf-8?B?Q0dTVjdBQ2FjNTFkR2VDWnpLK0hjOTZOYzhmVksvaENWQ3gvSmNMT3lkYTM1?=
 =?utf-8?B?WWZ1RUlaN0lkRWRveDdkcjVDazlhU0xrbzJ0bzVEdDlBd3pGK1pvL1ZtcEc2?=
 =?utf-8?B?THpCVDRyWHZ3M3ZLZkpMNWo2dmpIdUhIVG9EUG8zZmpQY1k4a0I2QjQyZE8w?=
 =?utf-8?B?bGVQcmw2SHJmL3lQeU00WWhpTXMwb3FxNjk5VVBHMldwVWpwQ1FGdE5yb2I0?=
 =?utf-8?B?YzcxL3FHR25rdlBRTGpyK3o3amdMV1FORi9JSHRxWThKWWJrbDNzeEkwMTdX?=
 =?utf-8?B?M1dZekN2cHlNcjFUcTgvUit6V1MxL0tsaFBzc2QxK0RtWUx2QXBhZCtHNGNz?=
 =?utf-8?B?ZG9OclM4ZFZHU21uVDU1TmJKWTZteDRsTHdNeHRkdXVqOGZBeHdEMk5ML0Vj?=
 =?utf-8?B?Ymt4VGxUM2ZVUGJtQVBNYXNtaHJEZE84Y0hleldnZWZPc0t4dDhXbU9CWS85?=
 =?utf-8?B?ckpCRmVXWVNkYzRmWGlEdnZwbDRsays0Y2p4T3l0M2ZLaEhSNUJpM0grNm1y?=
 =?utf-8?B?dHNoRU51cXd4WTFseHpIZ2llem51blZ5TUgySkwyWURlR3laQXlNSE03UVNs?=
 =?utf-8?B?a013ejBzM0xWdGZHL01Tc0JjdVN1NDdoMHpDSVlDSU5pcUJQZFVTcVFuY3Rv?=
 =?utf-8?B?S3ZNY1VjdjdXdE5XdXBkdHp1NFM3TmlVc2EwLzNORFFLWldOQ2doMEtJUVA3?=
 =?utf-8?B?N0J3eEdsY3VQNSszemNidlJlbE1RYjNSalU1T0N3Q1Y4ZHNZM09WU2c5S1RP?=
 =?utf-8?B?bG5SaEZ4d3ZJcWdiVStFRlZIRFhOK2R1ZkV6ZGY0MFZhemFUTVBOUmsyWWto?=
 =?utf-8?B?dnpvbjNFTlluYzRMU0l4S2hYSjFSS1JCOVF3aE9SS2JCcDR2SG5Rd0FFeCtS?=
 =?utf-8?B?M3dERlRkSU9NWjRFay9qTGZnb0xKRGhZNzUwU1FiRU5ZMTd2Y1lWSGJad0xX?=
 =?utf-8?B?eUNXKzM4ZnZuNEtOVmxRVDhKOTZZTlcyZFc3NEFWWTErWGFmVnY1L0Y2MW5s?=
 =?utf-8?Q?84U9GRIRZKuMgr/pwZCQj+DuiAbdWY=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR12MB8451.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?VDBIQ0VLalFBV0VydnFINXd1UWwyQjQ0ZmVoTGtaL3FIbWRmWmgxQmRuZStp?=
 =?utf-8?B?UEY2Mk1mdXArRHRDbUlqazhjZ0JhVFZJRVFIZWwxRk5xSE1Nd2NiWk1LYlpE?=
 =?utf-8?B?ZExqQnNZb1hQdUk5cEpMSmJUWk5sM0J3VW96Q05KRnZHemlmWWh5R3dhMmJ1?=
 =?utf-8?B?VGVVcVg3ZUluQXlCMTNETk5hTkExb3g4bFhsVmdIOWxkYnlOVjdmUWpONHJ0?=
 =?utf-8?B?RGxaS09aOGwwT2NzT1ZST3V4SXFZRktpMXEzNTh5WkRaWm1CRngxa1htMlk0?=
 =?utf-8?B?NlhFU005RU9YVWRhNjVWa1pZODZtVjJPNldrRWMwVHMrM2UxUG96NVY3Y3NT?=
 =?utf-8?B?NHRpa1ZVOUltWnBhMm1nR0p4a1RnZkVGb0EvNGVOZDRZMVZsYm9nWnhUakFo?=
 =?utf-8?B?aDhZOTNBbFhlQlNOVGFlRzlCOCt2VDdTdXlMRnZjNDZOeTFVVm5WR1doUThQ?=
 =?utf-8?B?bEZWS2k5MEhBck1kU3A4MGpuRjRXUXB6eUp4YzBHUHJCQWw0RGhOR2RFYXVH?=
 =?utf-8?B?QWY0Szh0YjIrSzcyTmpvbDgyMG9nMEk5NGp2R0lVNlB5QVJjdU9hWk1vblJu?=
 =?utf-8?B?TzBRTXcvZmZsdmljeW5qRjlPR2ozRGJmWE1yWWN2ZGdNcndtN3JCUWJuclBI?=
 =?utf-8?B?d3hudzU2VWJSQWlGNXQrVkVmdlFFai9QWkFkZ3dsZGNnV08wb3U1a1J3ODFD?=
 =?utf-8?B?K2V4Qm9nV2Z0R2NzbG1yd0dEcDBZODZSWTZkSUk4NGtONHlINXBVVUJsbjJX?=
 =?utf-8?B?aWNKakRLRkxwZ0pPMzltdFhHRlA5K2s1Z2RqeHZzR2VhWWQrcmdueDhTcFBF?=
 =?utf-8?B?STV6WmtYazFuczBCQmhya0lSQjdNRjIzZlZtaFdtcXFyaGpEajhRSXNSb0xm?=
 =?utf-8?B?SWZlUWtUajM3OWFVSTdXZTFtWGwwWWNlNnhTLzcxNjM2WW1ZOEJ5YlphSTkz?=
 =?utf-8?B?N1hLSUxKRGZsczFxeGtyVUlmK1Bka3REZHBkNUhlSTlSelRYVk1RR3h4Mm80?=
 =?utf-8?B?ZXlOS3dZKzVubDVocUwwQ0N5b01Ub0JMSVR3SStlakczdlZSNGxWSGJsTUkx?=
 =?utf-8?B?dnhGQllNQWhaOEFiUnNWOFZWdzVQM3BjbDBKUTJqM1NZRW1HUVp4L1Ardndp?=
 =?utf-8?B?WFJVU0IySUZmKzUyZnR5U294TGVUOURjdmtDRUtLbWZwS1k2OFpoM1ZwbnBi?=
 =?utf-8?B?UEhSOU1pSW5RYnhMMkN5R3ZnckR5ZWpqYWRLaXQwdCtNQTI3TlNwaGhEVzRQ?=
 =?utf-8?B?MUFRaWNUOVJLMUptdVl6bHBEL2lVejk4UmF0WjlqM0FtbGd1czIwdVQwVk1L?=
 =?utf-8?B?WGpGRUtHVGVzakZYWGh1WmtvVkpMVWI1dEhiaHFKdjhiT3FiYk12SEIrUzdC?=
 =?utf-8?B?NFFGajcvS1k5Zk85QWJhNXQyVGhmN21CWGdGNFMwMUJqYmtYcjg3a2pnVEhq?=
 =?utf-8?B?VCs4Ylo3SVZQaTNVdVdGdlFlbDcxWDFBR2Z5RkNTY1Y3VmNGTFpLUTRGSmZj?=
 =?utf-8?B?TUJCNjl6NlVrM0I4QW1qaWVEZmJpeHZYOVF4ZDNvRFpuak1rQ2tRTmJNMmhV?=
 =?utf-8?B?WTFpR1ljMHNoUmdIdGFtNUFaVi8rU3NuMnVEM2F3Vy9kRVVva3RRVVBMZmFu?=
 =?utf-8?B?MXJhcnhmQ1R5c0xhZS9XOU1FUGxTOUVEekp1MTZrb05xNTNzZERpdkRMTVNM?=
 =?utf-8?B?eFM1Z05tRFdYam5OSjJ1QkNKUk9FbjJaTFBTYnZIeE9nVW5yVDVSaG5ML0Y1?=
 =?utf-8?B?aVRLektqZktFTGljM1BCeWREVVJidEhJR0pYRXRVOER2UTF0WGIrMHF4VDIr?=
 =?utf-8?B?K3ZudkYwVTF3VlhwTU0rcyswZXJYbW0rRnVHOFJBQnh1N1dIYzA5LzRaU2JP?=
 =?utf-8?B?bVNEbWhrdHMyWjVNVHB0d2FEL2N2blJIQnBCeTg5cUZueHpHakh1R1lkcFhI?=
 =?utf-8?B?ODRKVTcyM3FEYnZ1Y1FUdzlrbW1aTWdBTkdRT2E0cnpFTkZNTkJuWFRoMWRr?=
 =?utf-8?B?d1J2ak80b2ZPQlZiaGxFNER4NWN0RkZacUNsTWtJVUFHbXNqK2N3Q3h2S1Q0?=
 =?utf-8?B?bmt5eXVBQTZmUjVsWXJLeFp6WmdibnI3U1FHMXJ2ZUU1YndldUJROGVqOHcz?=
 =?utf-8?Q?ddJ8=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB8451.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 05cf79fc-bf58-460b-fab8-08ddbaac7e54
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Jul 2025 03:40:17.2909
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: USZjRHc4qp6IOMrwvxGRPWfhdLQ4z0ALYCFfIKNFCvChy3cH1nOPB/YJoMKqH/VzA45QSQNU2mvnl0PN98VGyg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6623

W1B1YmxpY10NCg0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBKYW4gQmV1
bGljaCA8amJldWxpY2hAc3VzZS5jb20+DQo+IFNlbnQ6IFdlZG5lc2RheSwgSnVseSAyLCAyMDI1
IDY6NDggUE0NCj4gVG86IFBlbm55LCBaaGVuZyA8cGVubnkuemhlbmdAYW1kLmNvbT4NCj4gQ2M6
IEh1YW5nLCBSYXkgPFJheS5IdWFuZ0BhbWQuY29tPjsgQW5kcmV3IENvb3Blcg0KPiA8YW5kcmV3
LmNvb3BlcjNAY2l0cml4LmNvbT47IFJvZ2VyIFBhdSBNb25uw6kgPHJvZ2VyLnBhdUBjaXRyaXgu
Y29tPjsgeGVuLQ0KPiBkZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZw0KPiBTdWJqZWN0OiBSZTog
W1BBVENIIHY1IDEwLzE4XSB4ZW4vY3B1ZnJlcTogaW50cm9kdWNlIGEgbmV3IGFtZCBjcHBjIGRy
aXZlciBmb3INCj4gY3B1ZnJlcSBzY2FsaW5nDQo+DQo+IE9uIDAyLjA3LjIwMjUgMTE6NDksIFBl
bm55LCBaaGVuZyB3cm90ZToNCj4gPj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gPj4g
RnJvbTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPg0KPiA+PiBTZW50OiBUdWVzZGF5
LCBKdW5lIDE3LCAyMDI1IDEyOjAwIEFNDQo+ID4+IFRvOiBQZW5ueSwgWmhlbmcgPHBlbm55Lnpo
ZW5nQGFtZC5jb20+DQo+ID4+DQo+ID4+IE9uIDI3LjA1LjIwMjUgMTA6NDgsIFBlbm55IFpoZW5n
IHdyb3RlOg0KPiA+Pj4gLS0tIGEveGVuL2FyY2gveDg2L2FjcGkvY3B1ZnJlcS9hbWQtY3BwYy5j
DQo+ID4+PiArKysgYi94ZW4vYXJjaC94ODYvYWNwaS9jcHVmcmVxL2FtZC1jcHBjLmMNCj4gPj4+
ICsgICAgICAgIC8qDQo+ID4+PiArICAgICAgICAgKiBXZSBkb24ndCBuZWVkIHRvIGNvbnZlcnQg
dG8ga0h6IGZvciBjb21wdXRpbmcgb2Zmc2V0IGFuZCBjYW4NCj4gPj4+ICsgICAgICAgICAqIGRp
cmVjdGx5IHVzZSBub21pbmFsX21oeiBhbmQgbG93ZXN0X21oeiBhcyB0aGUgZGl2aXNpb24NCj4g
Pj4+ICsgICAgICAgICAqIHdpbGwgcmVtb3ZlIHRoZSBmcmVxdWVuY3kgdW5pdC4NCj4gPj4+ICsg
ICAgICAgICAqLw0KPiA+Pj4gKyAgICAgICAgb2Zmc2V0ID0gZGF0YS0+Y2Fwcy5ub21pbmFsX3Bl
cmYgLQ0KPiA+Pj4gKyAgICAgICAgICAgICAgICAgKG11bCAqIGNwcGNfZGF0YS0+Y3BjLm5vbWlu
YWxfbWh6KSAvIGRpdjsNCj4gPj4+ICsgICAgfQ0KPiA+Pj4gKyAgICBlbHNlDQo+ID4+PiArICAg
IHsNCj4gPj4+ICsgICAgICAgIC8qIFJlYWQgUHJvY2Vzc29yIE1heCBTcGVlZChNSHopIGFzIGFu
Y2hvciBwb2ludCAqLw0KPiA+Pj4gKyAgICAgICAgbXVsID0gZGF0YS0+Y2Fwcy5oaWdoZXN0X3Bl
cmY7DQo+ID4+PiArICAgICAgICBkaXYgPSB0aGlzX2NwdShweGZyZXFfbWh6KTsNCj4gPj4+ICsg
ICAgICAgIGlmICggIWRpdiApDQo+ID4+PiArICAgICAgICAgICAgcmV0dXJuIC1FSU5WQUw7DQo+
ID4+DQo+ID4+IFdoYXQncyB3cm9uZyBhYm91dCB0aGUgZnVuY3Rpb24gYXJndW1lbnRzIGluIHRo
aXMgY2FzZT8gKFNhbWUNCj4gPj4gcXVlc3Rpb24gYWdhaW4gb24gZnVydGhlciB1c2VzIG9mIEVJ
TlZBTCBiZWxvdy4pDQo+ID4NCj4gPiBJZiB3ZSBjb3VsZCBub3QgZ2V0IHByb2Nlc3NvciBtYXgg
ZnJlcXVlbmN5LCB0aGUgd2hvbGUgZnVuY3Rpb24gaXMgdXNlbGVzcy4uLg0KPiA+IE1heWJlIC1F
T1BOT1RTVVBQIGlzIG1vcmUgc3VpdGFibGUgdGhhbiAtRUlOVkFMOw0KPg0KPiBJIGRvbid0IGxp
a2UgRU9QTk9UU1VQUCB2ZXJ5IG11Y2ggZWl0aGVyIGZvciB0aGUgcHVycG9zZSwgYnV0IGl0J3Mg
c3VyZWx5IGJldHRlcg0KPiB0aGFuIEVJTlZBTC4NCj4NCj4gPj4+ICtzdGF0aWMgaW50IGNmX2No
ZWNrIGFtZF9jcHBjX2NwdWZyZXFfdGFyZ2V0KHN0cnVjdCBjcHVmcmVxX3BvbGljeSAqcG9saWN5
LA0KPiA+Pj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgdW5z
aWduZWQgaW50IHRhcmdldF9mcmVxLA0KPiA+Pj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgdW5zaWduZWQgaW50IHJlbGF0aW9uKSB7DQo+ID4+PiArICAgIHVu
c2lnbmVkIGludCBjcHUgPSBwb2xpY3ktPmNwdTsNCj4gPj4+ICsgICAgY29uc3Qgc3RydWN0IGFt
ZF9jcHBjX2Rydl9kYXRhICpkYXRhID0gcGVyX2NwdShhbWRfY3BwY19kcnZfZGF0YSwNCj4gY3B1
KTsNCj4gPj4+ICsgICAgdWludDhfdCBkZXNfcGVyZjsNCj4gPj4+ICsgICAgaW50IHJlczsNCj4g
Pj4+ICsNCj4gPj4+ICsgICAgaWYgKCB1bmxpa2VseSghdGFyZ2V0X2ZyZXEpICkNCj4gPj4+ICsg
ICAgICAgIHJldHVybiAwOw0KPiA+Pj4gKw0KPiA+Pj4gKyAgICByZXMgPSBhbWRfY3BwY19raHpf
dG9fcGVyZihkYXRhLCB0YXJnZXRfZnJlcSwgJmRlc19wZXJmKTsNCj4gPj4+ICsgICAgaWYgKCBy
ZXMgKQ0KPiA+Pj4gKyAgICAgICAgcmV0dXJuIHJlczsNCj4gPj4+ICsNCj4gPj4+ICsgICAgLyoN
Cj4gPj4+ICsgICAgICogU2V0dGluZyB3aXRoICJsb3dlc3Rfbm9ubGluZWFyX3BlcmYiIHRvIGVu
c3VyZSBnb3Zlcm5vcmluZw0KPiA+Pj4gKyAgICAgKiBwZXJmb3JtYW5jZSBpbiBQLXN0YXRlIHJh
bmdlLg0KPiA+Pj4gKyAgICAgKi8NCj4gPj4+ICsgICAgYW1kX2NwcGNfd3JpdGVfcmVxdWVzdChw
b2xpY3ktPmNwdSwgZGF0YS0+Y2Fwcy5sb3dlc3Rfbm9ubGluZWFyX3BlcmYsDQo+ID4+PiArICAg
ICAgICAgICAgICAgICAgICAgICAgICAgZGVzX3BlcmYsIGRhdGEtPmNhcHMuaGlnaGVzdF9wZXJm
KTsNCj4gPj4NCj4gPj4gSSBmZWFyIEkgZG9uJ3QgdW5kZXJzdGFuZCB0aGUgY29tbWVudCwgYW5k
IGhlbmNlIGl0IHJlbWFpbnMgdW5jbGVhcg0KPiA+PiB0byBtZSB3aHkgbG93ZXN0X25vbmxpbmVh
cl9wZXJmIGlzIGJlaW5nIHVzZWQgaGVyZS4NCj4gPg0KPiA+IEhvdyBhYm91dA0KPiA+IGBgYA0K
PiA+IENob29zZSBsb3dlc3Qgbm9ubGluZWFyIHBlcmZvcm1hbmNlIGFzIHRoZSBtaW5pbXVtIHBl
cmZvcm1hbmNlIGxldmVsIGF0IHdoaWNoDQo+IHRoZSBwbGF0Zm9ybSBtYXkgcnVuLg0KPiA+IExv
d2VzdCBub25saW5lYXIgcGVyZm9ybWFuY2UgaXMgdGhlIGxvd2VzdCBwZXJmb3JtYW5jZSBsZXZl
bCBhdCB3aGljaA0KPiA+IG5vbmxpbmVhciBwb3dlciBzYXZpbmdzIGFyZSBhY2hpZXZlZCwgQWJv
dmUgdGhpcyB0aHJlc2hvbGQsIGxvd2VyIHBlcmZvcm1hbmNlDQo+IGxldmVscyBzaG91bGQgYmUg
Z2VuZXJhbGx5IG1vcmUgZW5lcmd5IGVmZmljaWVudCB0aGFuIGhpZ2hlciBwZXJmb3JtYW5jZSBs
ZXZlbHMuDQo+ID4gYGBgDQo+DQo+IEkgZmluYWxseSBoYWQgdG8gZ28gdG8gdGhlIEFDUEkgc3Bl
YyB0byB1bmRlcnN0YW5kIHdoYXQgdGhpcyBpcyBhYm91dC4gVGhlcmUgbG9va3MgdG8NCj4gYmUg
YW4gaW1wbGljYXRpb24gdGhhdCBsb3dlc3QgPD0gbG93ZXN0X25vbmxpbmVhciwgYW5kIHN0YXRl
cyBpbiB0aGF0IHJhbmdlIHdvdWxkDQo+IGNvcnJlc3BvbmQgbW9yZSB0byBULXN0YXRlcyB0aGFu
IHRvIFAtc3RhdGVzLiBXaXRoIHRoYXQgSSB0aGluayBJIGFncmVlIHdpdGggdGhlIHVzZQ0KDQpZ
ZXMsIEl0IGRvZXNuJ3QgaGF2ZSBkZWZpbml0aXZlIGNvbmNsdXNpb24gYWJvdXQgcmVsYXRpb24g
YmV0d2VlbiBsb3dlc3QgYW5kIGxvd2VzdF9ub25saW5lYXINCkluIG91ciBpbnRlcm5hbCBGVyBk
ZXNpZ25lZCBzcGVjLCBpdCBhbHdheXMgc2hvd3MgbG93ZXN0X25vbmxpbmVhciBjb3JyZXNwb25k
cyB0byBQMg0KDQo+IG9mIGxvd2VzdF9ub25saW5lYXIgaGVyZS4gVGhlIGNvbW1lbnQsIGhvd2V2
ZXIsIGNvdWxkIGRvIHdpdGggbW92aW5nIGZhcnRoZXINCj4gYXdheSBmcm9tIG1lcmVseSBxdW90
aW5nIHRoZSBwcmV0dHkgYWJzdHJhY3QgdGV4dCBpbiB0aGUgQUNQSSBzcGVjLCBhcyBzdWNoDQo+
IHF1b3RpbmcgZG9lc24ndCBoZWxwIGluIGNsYXJpZnlpbmcgdGVybWlub2xvZ3kgdXNlZCwgd2hl
biB0aGF0IHRlcm1pbm9sb2d5IGFsc28gaXNuJ3QNCj4gZXhwbGFpbmVkIGFueXdoZXJlIGVsc2Ug
aW4gdGhlIGNvZGUgYmFzZS4NCg0KDQpIb3cgYWJvdXQgd2UgYWRkIGRldGFpbGVkIGV4cGxhbmF0
aW9ucyBhYm91dCBlYWNoIHRlcm1pbm9sb2d5IGluIHRoZSBiZWdpbm5pbmcNCmRlY2xhcmF0aW9u
ICwgc2VlOg0KYGBgDQorLyoNCisgKiBGaWVsZCBoaWdoZXN0X3BlcmYsIG5vbWluYWxfcGVyZiwg
bG93ZXN0X25vbmxpbmVhcl9wZXJmLCBhbmQgbG93ZXN0X3BlcmYNCisgKiBjb250YWluIHRoZSB2
YWx1ZXMgcmVhZCBmcm9tIENQUEMgY2FwYWJpbGl0eSBNU1IuDQorICogRmllbGQgaGlnaGVzdF9w
ZXJmIHJlcHJlc2VudHMgaGlnaGVzdCBwZXJmb3JtYW5jZSwgd2hpY2ggaXMgdGhlIGFic29sdXRl
DQorICogbWF4aW11bSBwZXJmb3JtYW5jZSBhbiBpbmRpdmlkdWFsIHByb2Nlc3NvciBtYXkgcmVh
Y2gsIGFzc3VtaW5nIGlkZWFsDQorICogY29uZGl0aW9ucw0KKyAqIEZpZWxkIG5vbWluYWxfcGVy
ZiByZXByZXNlbnRzIG1heGltdW0gc3VzdGFpbmVkIHBlcmZvcm1hbmNlIGxldmVsIG9mIHRoZQ0K
KyAqIHByb2Nlc3NvciwgYXNzdW1pbmcgaWRlYWwgb3BlcmF0aW5nIGNvbmRpdGlvbnMuDQorICog
RmllbGQgbG93ZXN0X25vbmxpbmVhcl9wZXJmIHJlcHJlc2VudHMgTG93ZXN0IE5vbmxpbmVhciBQ
ZXJmb3JtYW5jZSwgd2hpY2gNCisgKiBpcyB0aGUgbG93ZXN0IHBlcmZvcm1hbmNlIGxldmVsIGF0
IHdoaWNoIG5vbmxpbmVhciBwb3dlciBzYXZpbmdzIGFyZQ0KKyAqIGFjaGlldmVkLiBBYm92ZSB0
aGlzIHRocmVzaG9sZCwgbG93ZXIgcGVyZm9ybWFuY2UgbGV2ZWxzIHNob3VsZCBiZQ0KKyAqIGdl
bmVyYWxseSBtb3JlIGVuZXJneSBlZmZpY2llbnQgdGhhbiBoaWdoZXIgcGVyZm9ybWFuY2UgbGV2
ZWxzLg0KKyAqIEZpZWxkIGxvd2VzdF9wZXJmIHJlcHJlc2VudHMgdGhlIGFic29sdXRlIGxvd2Vz
dCBwZXJmb3JtYW5jZSBsZXZlbCBvZiB0aGUNCisgKiBwbGF0Zm9ybS4NCisgKg0KKyAqIEZpZWxk
IG1heF9wZXJmLCBtaW5fcGVyZiwgZGVzX3BlcmYgc3RvcmUgdGhlIHZhbHVlcyBmb3IgQ1BQQyBy
ZXF1ZXN0IE1TUi4NCisgKiBGaWVsZCBtYXhfcGVyZiBjb252ZXlzIHRoZSBtYXhpbXVtIHBlcmZv
cm1hbmNlIGxldmVsIGF0IHdoaWNoIHRoZSBwbGF0Zm9ybQ0KKyAqIG1heSBydW4uIEFuZCBpdCBt
YXkgYmUgc2V0IHRvIGFueSBwZXJmb3JtYW5jZSB2YWx1ZSBpbiB0aGUgcmFuZ2UNCisgKiBbbG93
ZXN0X3BlcmYsIGhpZ2hlc3RfcGVyZl0sIGluY2x1c2l2ZS4NCisgKiBGaWVsZCBtaW5fcGVyZiBj
b252ZXlzIHRoZSBtaW5pbXVtIHBlcmZvcm1hbmNlIGxldmVsIGF0IHdoaWNoIHRoZSBwbGF0Zm9y
bQ0KKyAqIG1heSBydW4uIEFuZCBpdCBtYXkgYmUgc2V0IHRvIGFueSBwZXJmb3JtYW5jZSB2YWx1
ZSBpbiB0aGUgcmFuZ2UNCisgKiBbbG93ZXN0X3BlcmYsIGhpZ2hlc3RfcGVyZl0sIGluY2x1c2l2
ZSBidXQgbXVzdCBiZSBsZXNzIHRoYW4gb3IgZXF1YWwgdG8NCisgKiBtYXhfcGVyZi4NCisgKiBG
aWVsZCBkZXNfcGVyZiBjb252ZXlzIHBlcmZvcm1hbmNlIGxldmVsIFhlbiBpcyByZXF1ZXN0aW5n
LiBBbmQgaXQgbWF5IGJlDQorICogc2V0IHRvIGFueSBwZXJmb3JtYW5jZSB2YWx1ZSBpbiB0aGUg
cmFuZ2UgW21pbl9wZXJmLCBtYXhfcGVyZl0sIGluY2x1c2l2ZS4NCisgKi8NCitzdHJ1Y3QgYW1k
X2NwcGNfZHJ2X2RhdGENCit7DQorICAgIGNvbnN0IHN0cnVjdCB4ZW5fcHJvY2Vzc29yX2NwcGMg
KmNwcGNfZGF0YTsNCisgICAgdW5pb24gew0KKyAgICAgICAgdWludDY0X3QgcmF3Ow0KKyAgICAg
ICAgc3RydWN0IHsNCisgICAgICAgICAgICB1bnNpZ25lZCBpbnQgbG93ZXN0X3BlcmY6ODsNCisg
ICAgICAgICAgICB1bnNpZ25lZCBpbnQgbG93ZXN0X25vbmxpbmVhcl9wZXJmOjg7DQorICAgICAg
ICAgICAgdW5zaWduZWQgaW50IG5vbWluYWxfcGVyZjo4Ow0KKyAgICAgICAgICAgIHVuc2lnbmVk
IGludCBoaWdoZXN0X3BlcmY6ODsNCisgICAgICAgICAgICB1bnNpZ25lZCBpbnQgOjMyOw0KKyAg
ICAgICAgfTsNCisgICAgfSBjYXBzOw0KKyAgICB1bmlvbiB7DQorICAgICAgICB1aW50NjRfdCBy
YXc7DQorICAgICAgICBzdHJ1Y3Qgew0KKyAgICAgICAgICAgIHVuc2lnbmVkIGludCBtYXhfcGVy
Zjo4Ow0KKyAgICAgICAgICAgIHVuc2lnbmVkIGludCBtaW5fcGVyZjo4Ow0KKyAgICAgICAgICAg
IHVuc2lnbmVkIGludCBkZXNfcGVyZjo4Ow0KKyAgICAgICAgICAgIHVuc2lnbmVkIGludCBlcHA6
ODsNCisgICAgICAgICAgICB1bnNpZ25lZCBpbnQgOjMyOw0KKyAgICAgICAgfTsNCisgICAgfSBy
ZXE7DQorDQorICAgIGludCBlcnI7DQorfTsNCmBgDQpUaGVuIGhlcmUsIHdlIGNvdWxkIGVsYWJv
cmF0ZSB0aGUgcmVhc29uIHdoeSB3ZSBjaG9vc2UgbG93ZXN0X25vbmxpbmVhcl9wZXJmIG92ZXIg
bG93ZXN0X3BlcmY6DQpgYGANCisgICAgLyoNCisgICAgICogSGF2aW5nIGEgcGVyZm9ybWFuY2Ug
bGV2ZWwgbG93ZXIgdGhhbiB0aGUgbG93ZXN0IG5vbmxpbmVhcg0KKyAgICAgKiBwZXJmb3JtYW5j
ZSBsZXZlbCwgc3VjaCBhcywgbG93ZXN0X3BlcmYgPD0gcGVyZiA8PSBsb3dlc3Rfbm9ubGluZXJf
cGVyZiwNCisgICAgICogbWF5IGFjdHVhbGx5IGNhdXNlIGFuIGVmZmljaWVuY3kgcGVuYWx0eSwg
U28gd2hlbiBkZWNpZGluZyB0aGUgbWluX3BlcmYNCisgICAgICogdmFsdWUsIHdlIHByZWZlciBs
b3dlc3Qgbm9ubGluZWFyIHBlcmZvcm1hbmNlIG92ZXIgbG93ZXN0IHBlcmZvcm1hbmNlDQorICAg
ICAqLw0KKyAgICBhbWRfY3BwY193cml0ZV9yZXF1ZXN0KHBvbGljeS0+Y3B1LCBkYXRhLT5jYXBz
Lmxvd2VzdF9ub25saW5lYXJfcGVyZiwNCisgICAgICAgICAgICAgICAgICAgICAgICAgICBkZXNf
cGVyZiwgZGF0YS0+Y2Fwcy5oaWdoZXN0X3BlcmYpOw0KYGBgDQoNCj4NCj4gSmFuDQo=

