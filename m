Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D2436B41569
	for <lists+xen-devel@lfdr.de>; Wed,  3 Sep 2025 08:47:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1107869.1458070 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uthGc-0004dc-EQ; Wed, 03 Sep 2025 06:46:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1107869.1458070; Wed, 03 Sep 2025 06:46:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uthGc-0004c5-Ad; Wed, 03 Sep 2025 06:46:50 +0000
Received: by outflank-mailman (input) for mailman id 1107869;
 Wed, 03 Sep 2025 06:46:48 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=4MrA=3O=amd.com=penny.zheng@srs-se1.protection.inumbo.net>)
 id 1uthGa-0004bz-7v
 for xen-devel@lists.xenproject.org; Wed, 03 Sep 2025 06:46:48 +0000
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2062c.outbound.protection.outlook.com
 [2a01:111:f403:2417::62c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id bff887ae-8891-11f0-9809-7dc792cee155;
 Wed, 03 Sep 2025 08:46:43 +0200 (CEST)
Received: from DM4PR12MB8451.namprd12.prod.outlook.com (2603:10b6:8:182::7) by
 CH2PR12MB4229.namprd12.prod.outlook.com (2603:10b6:610:a5::15) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9094.16; Wed, 3 Sep 2025 06:46:40 +0000
Received: from DM4PR12MB8451.namprd12.prod.outlook.com
 ([fe80::b04e:2da5:7189:4c4d]) by DM4PR12MB8451.namprd12.prod.outlook.com
 ([fe80::b04e:2da5:7189:4c4d%7]) with mapi id 15.20.9052.019; Wed, 3 Sep 2025
 06:46:39 +0000
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
X-Inumbo-ID: bff887ae-8891-11f0-9809-7dc792cee155
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BIYq2OW5mV/GkYcNzIEzxpIBXnFqCbAAcWUAOiF+eDXSWyCC08quilTHs9qdXdx38Pfjue6hbV9Bcdo71oRGHdOjD/yKNYvccDCw+tIdi+pw2AaxEGc/q5TJr24EnVrA44K7zIv89SulsIBMCBJ2UafCnSjZzRTqla/xaXHM6vvwA+VuPlB4NE2T5lAk4iPHdRiVN98vZpdltTENwogz8Tw5QkF3cTC2PxsiCiE2nAXt5Drzv9JK0ekUyQ26pl+zw9vld5j9udY2dFonjYKeeoYOPd2tIHJJqoWdkLrcRbSK/72XJkQ4CmK8XejpFWr0emT61pahFBMpUEHkY2PbmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=g+bmyhh5rFnQXPoR57LllCgtHVYqY+F3Q8Ycl/WVPUU=;
 b=B23K2ZuurWYZf9Kmupazu1SyJ9lfJHcUyGb0miM5zAEI/lXg/Ut81xzZRmjKRIdOMBOtGz1pCtHsZys6TXBFwWr3gQvYR/ZlfLwKiryIi6/dEBF5BElQLk6gOZ9oOss8hu9ZSpheQIe3TP9W+LaNdOeuoRly8c23qo5WxuiF6aFFRHW2EBkH2lkFO+VLfa3jPlpDzhrdJ5fuMCVWP6v2U75zBV9NvxhZZvg6HjFXSHjURCgxFbLqKNoN9T68cU7HcAGbxWalnWETVNQaIVfw8RJCTFbFSLYJ8GSum5YkrpF7A8N4UjUIAXd186vuNH18g3WYZVGt9yU+bSrIYRDV5A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=g+bmyhh5rFnQXPoR57LllCgtHVYqY+F3Q8Ycl/WVPUU=;
 b=beGzoOPe2FigZnOeZ55+rEtb9yXTGe5dwyNs246vv+s6SI7QjHOK0yzCcSM4281lkGKdDQX4/fGfdoDFX8mj0vqzHMDIkE/0NLqkvcwGfeSidk9T9NQ+bvfnlSgH9M0D7F3aEtIyKhYExOu27/5d3kiGmmUkzceGI6XA1fNqhLM=
From: "Penny, Zheng" <penny.zheng@amd.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "Huang, Ray" <Ray.Huang@amd.com>, Anthony PERARD
	<anthony.perard@vates.tech>, Andrew Cooper <andrew.cooper3@citrix.com>,
	=?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, "Andryuk,
 Jason" <Jason.Andryuk@amd.com>
Subject: RE: [PATCH v8 8/8] xen/cpufreq: Adapt SET/GET_CPUFREQ_CPPC
 xen_sysctl_pm_op for amd-cppc driver
Thread-Topic: [PATCH v8 8/8] xen/cpufreq: Adapt SET/GET_CPUFREQ_CPPC
 xen_sysctl_pm_op for amd-cppc driver
Thread-Index: AQHcGANplGdEMGicVkezx0Fs9samVLR357kAgAjockCAADXaAIAABi1w
Date: Wed, 3 Sep 2025 06:46:39 +0000
Message-ID:
 <DM4PR12MB845194FD2BDFA3930CA066E5E101A@DM4PR12MB8451.namprd12.prod.outlook.com>
References: <20250828100601.1777197-1-Penny.Zheng@amd.com>
 <a855a0b4-21dc-4f63-9849-6e5c7ec2e6b3@suse.com>
 <DM4PR12MB8451C7146814C9C359B078B5E101A@DM4PR12MB8451.namprd12.prod.outlook.com>
 <7ec5e23e-2415-41b7-ab3e-7b0a7007bd1f@suse.com>
In-Reply-To: <7ec5e23e-2415-41b7-ab3e-7b0a7007bd1f@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
 MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Enabled=True;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_SetDate=2025-09-03T06:46:30.0000000Z;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Name=Open
 Source;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_ContentBits=3;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Method=Privileged
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR12MB8451:EE_|CH2PR12MB4229:EE_
x-ms-office365-filtering-correlation-id: f059fcb0-0a65-46b6-56eb-08ddeab5a2e0
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|366016|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?eWVhN0xmQ3lOZXFwc0daTk1IdVg5U2paYWMwSnQrN2xPVWhNYWs5QlBDN3hN?=
 =?utf-8?B?OE9lOEVZUWxQODhSTHVtOFFHMlJGZWFPb1c5VXp3TmtLQTVqd2NBQ0daNjVw?=
 =?utf-8?B?TnVXeURlc0xvcmszb0NNci9QdHlkNU1md1VlbkxFeG8vT2Z4eXVlYjZvM3N0?=
 =?utf-8?B?Z21uMjl6d25rUDdiZHRNQXlCZkFhM2x6Q2JVRGg2cE9hd2ZNRjBOdkJXT0JG?=
 =?utf-8?B?VDZnc2xkUWF1Z1RZMmxEa3dicVRLU2dXeVZLenM1K1lJYVZiWWZpTWhWU3Fk?=
 =?utf-8?B?cnFiK01EUG1CUzhJY0U5VFo3eDNtSDNPUFpJY2FncUUwc0RMbkdjOWdTWnMv?=
 =?utf-8?B?bm1JTzlWb2pDajl1cE05NmJqU3lpbHJrVlU1VWVzWElzTmdjckhsVjJydUxj?=
 =?utf-8?B?VEg4UWdiaURoV0lCRlVqOUY2aHpaeFhkUFZZekRobGk2b0VIcktQVDdNQXln?=
 =?utf-8?B?ckxIcFpSSUNlMmhYa3h1S2dPMEM3dVdPNER2S2VuN0hCb2ZrL0ZKTUFweEZk?=
 =?utf-8?B?ZHpSZnlySlA3aDJSQ0hVa2hHekZ4T3NHeFVPcEhIeW1jQ29Da2xKd0dlRzV0?=
 =?utf-8?B?T3ErT2V5YUJzdFd5cko0TGtrL0xiRFI4YlFlYktvbncxcHFlWU1mT2xkMnhl?=
 =?utf-8?B?NDNSY2JuWkNPRTU3RmUvVFBWSWltWnlwT1IreDZPR29HWHM4cEVvOG02K0k5?=
 =?utf-8?B?Zi9jSUphUU01TXRBVUlSaWxqNjlHaHRRNXNHYW9JMVhpZmFOaE55YkFDc3lI?=
 =?utf-8?B?LzVUanpEYWdGWUNpd0tjdG41eS81VnRrWG5XVFRiOGJ1SGNwL1ZSenpMdlFG?=
 =?utf-8?B?MXQwemFMZUJybDl3cS9PUXhObERPR3ZSbjFSUUhTcmN3TXd3MTlYcEZrK0Vw?=
 =?utf-8?B?R0hPNXRtT2loZmZlYWJtYythbG1PK3RQVWZJdjgwOUJESVhoSi9PQXYreDVR?=
 =?utf-8?B?ZmROMnV4V1g4NXQ1b1RLQ2NiKzJYQ3hrVXdMeURWU01lVmlPVkJkSytsa2dG?=
 =?utf-8?B?d1lDQ0tjSmRIUGQ0U3dQV0ZodmVLaWhRVjZzUmg0NVdjc3FXSUZRTmxJdVVX?=
 =?utf-8?B?R0ZmeUJGMDBMbStRU3B0eUhJeUpnS0xGSzB1ODVRQVZDaFkvQ1F1SldWbUlk?=
 =?utf-8?B?Y09aTE5Vb3FFQTdsMzhvbEcwaVE3T1k0NjIrclJqSGRGb0x0UmJLYjlOblMr?=
 =?utf-8?B?aXRMWXRrbFdqMXV2VElRcEJvMmRlbHMwUVFuK1Y2UVVPY0JOMjNJOHZidGFk?=
 =?utf-8?B?dXdzN3JJYXBiUFZ3RU44TEp4VG5LWjZVcitYbkNUamhiUDJ0bHJhODZ4a1Zh?=
 =?utf-8?B?MmJVTEc0SThqQk45c2MydmZxU25wTmxLbVAxMy8xQ3M2TGNmZHJNZTQ2QzZO?=
 =?utf-8?B?T3pETUdkcXEwS1BuS3ZTOFdqQzJTMENlci9jVUcyTjE3N3N4L0NyQUxQYmF2?=
 =?utf-8?B?Z09oNG91NUJ5cmN2ODBJdkRrdmo1MHBBdFA2eE9idlBhWDhUQ3lyT2pOb0Y0?=
 =?utf-8?B?dlFpZ2U5aXZKZ0JzRVpscmFZOFN1bkFDVkFKelBIRGhXbEZ4NGVJR29PR2Np?=
 =?utf-8?B?bFg1U0E2TVJUYzdIdGFraHQwOVFhSEc0L1F3UDJoNEkvNHVKQnhiYXZtZ1ho?=
 =?utf-8?B?Rk5oZkYrZ2V5QTJqd2x0T2NwREpmQWtYVTNsWng3c0l2TUFQWUFycGlNRHhz?=
 =?utf-8?B?TTJ0aVI0TzczUmo1ZlJPNURBNnBEdHpMQVdrREkzNmZjNWQ3Y0E0VDlOWlNM?=
 =?utf-8?B?d1V4cEJJRUIrTm16SnJobnJ4VSs3UUlsVm13czNOazVRamdIZUhKa0pqZmJD?=
 =?utf-8?B?cm9TRmttQm1LMnBna0dycWZ5MmtEZ2prUVhjNjJtYVgrNmowNTEyL2F5M3kr?=
 =?utf-8?B?K2RZdjc4Y0pCVXo1bXgxOXlwMGROVmV3djlNWFdjMVJnYks3dEdNbERWZGIx?=
 =?utf-8?B?eEtFLzhtZWcrU25mN1N0bWE4dlNCb3VRRjVENzhMRmJpQ1F5UVN6YTNHa2Rt?=
 =?utf-8?Q?mChscxSelcnLY41UXL9fwNEkFOaRPQ=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR12MB8451.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?d0xOZlNtQ2g0VWF2VUt2dldEZ0lSSWlPSTcvbE1zZkQ2UE9sTzJVQ3dGZTV1?=
 =?utf-8?B?SWpVV1FUdUhTaUJPbmhvK0xJNTNKaWJJb2p6aWM5R0tzdVl4NWhMbG1VRU9k?=
 =?utf-8?B?TW1WbDN2TkltK2VWSUFFVmw0Z3hURGpIWkRULzBraHh4eWZNSEJwa1ZMdCtK?=
 =?utf-8?B?V3ZNQzhWdzgwRHRUb3JtdW5OYVZ2Q3RwWXlFVTV0eWl2M0xSUzN5M3pnTGJa?=
 =?utf-8?B?VUxCcE4vOHlLajBKeDBtWkYza2JqMW9qSHUremlPcHp4QUFZb2l3czd5UGR1?=
 =?utf-8?B?VENXUXlLcCtZWjQ3ZWEwM0tSM3F1QlVCNWRFM2R4Rm9PaElMMFZPZ2ZkNzVS?=
 =?utf-8?B?bWh2eTBFYzlGOTF3S2UrcFhnN2FsV08rSUpyU0YyWmVGQzYxMW9EcStERHNI?=
 =?utf-8?B?RTQwZG9kM3NoTWF3cUprU2pQaEdGMUZYSjVWb3FKdnZmaWVZMWtHakd1SEpD?=
 =?utf-8?B?ZjF1andyYWxLVU1mVVkvSm5tS1VKTkVDNjlSVlF0dmNFK0J3S3BJRzNRV3Va?=
 =?utf-8?B?TW13c3ZxMWxGVDk4cElmU1RhVm5VbnBkSUlpMWJxWFdzcE14dzJMbFlJOElP?=
 =?utf-8?B?UGp1Qm44bHZUeGRLYTlYZDN6MjJuYk5JN0pmYWt0U2xaU3pBQVRPVGpuSEw1?=
 =?utf-8?B?Rlhzc0lCSWdpNHNEWFFSMkpZdm1OQ29iZEVVak85QWZLRXZNdlRmWHdiYlVu?=
 =?utf-8?B?QmdxNVRuL1NTdy9mQXN2NlZSOWYrbTJOa05CTzgzWEZlUmNuNTg0NnllSWJS?=
 =?utf-8?B?bVB4Wm1UbWM2ZzRqRFpjOElPdzN1eENRZDgxbkxybzJQSkRaK0hTOUFaQTFE?=
 =?utf-8?B?L1NoemtsVmM0TWhEWW93Nmc1d0FuZVVkY3RPN0doemE4SitSSy9MZGQ4QW81?=
 =?utf-8?B?Um4vQnFaYWFwMXh5bGxHRWJvNlpGTFQ3RWhJVGNVSEljK0lvL1pnNjVreUFS?=
 =?utf-8?B?OXY5MGxYMmUxTWdlYXlNanpzdnFNK0lsejdCZTlGUDNzU3FKV1p6NnF0Qlo5?=
 =?utf-8?B?TmFEeVNFUGROZVN4T29QeFc3VHdEMGJnWWhsdkNVeFBjOVE0TFkxNWhXVnBB?=
 =?utf-8?B?aXdjUy92N3pkaVUrc0VlT0Q2RkpGUGNCR1h5bmRJQ1ZJNzNISmlhTGJPMTlE?=
 =?utf-8?B?dFJ2U3FuVklDQ3VGTlZZQnZEdkl1TFFQa2lPREY4WndrTmRMc05vTlJJV0U5?=
 =?utf-8?B?amRKYk9DR2xGRm80c0pVYUI2WVFiZHErYUV6NjBQZVBOU1RodVhENTZaM0JR?=
 =?utf-8?B?Rmk3eElpc0hNbVViWDdBUVZMTjNCLzBockNvZWF5OFNGanYrNkFQZlR1WVFZ?=
 =?utf-8?B?NWZTalpmWTM4bHRVQnZiSHVVVm8rTmpWZ0tsaVVnVDQvY25LSmpDZmo4cjYv?=
 =?utf-8?B?MStDUkZZZDRqZllxTURVeEJub1RFWHp1SFNZVDl4TTMyMXhOZDExeFNMZ0RQ?=
 =?utf-8?B?SGswSit2bktzY3JKNUVnY1k2dkJtdlU4VXFmU0E4SG5UVDFuR3EwYXQ4OGFE?=
 =?utf-8?B?cDZxSGRiTE5tdlZOOUlSRE96bDdEYUF2Wi92WHJFZkY4Z2ZjelRmcEhIZGRa?=
 =?utf-8?B?UjRucFN0eGpNczhOTVVwUHJ6VUZ2RU04b0dUVmRGVXJma1NIOGlDelhhUktU?=
 =?utf-8?B?WkQ3VEljNU9QOG9jcG1yUnNkWkVZT1Jya0ErMUN5WkRNNFZaOFZUME1qc0lK?=
 =?utf-8?B?K1NCSVhjK05uYVZiSnU0dkU2MTE5T002dVVHVzRhMzVuTTd0ZFNmcTlhdHFJ?=
 =?utf-8?B?bnpUT21qampWWk1LVjRaNit1eWJweDh3c09YZUZjUDdvYkVYMHZtZlhNS3RB?=
 =?utf-8?B?b2ZRRGR3YU55TWpaS0gvV3FwUWJYZU1hT1l4K1hmYk15bE14Tmd1OHlwenNK?=
 =?utf-8?B?TE1mRG4zWStHa09lbjFpWVFaS1pQT05yUGIyTGg3WUxvOE13d2xIZ2h2cits?=
 =?utf-8?B?cXN4Y2tlSzBDSjFpWHlPbnMvdEZlQ3MycmdiUiswQVQ4WkEvcE5IUUhyZktU?=
 =?utf-8?B?L0p0SDZ6NTd6Q2xyUVEyM05jTUk4NVhKeWxCZ0xtTGtwRnY1UjIyL1VOTXBm?=
 =?utf-8?B?RGdvTWM2NnM0dExQekpGbXN0NjdvQkRyK0VXQVRaditUb2NLbnVlYzJzMTY4?=
 =?utf-8?Q?6ZPA=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB8451.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f059fcb0-0a65-46b6-56eb-08ddeab5a2e0
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Sep 2025 06:46:39.8821
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ZH0upONjrG9nu3DPz+t1yTeePKbsi+QxXuQQFp/euxxkJ3yuv+Wryhz2jIoxcOyTpdiquHBjyIqcomE6qgwWqQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4229

W1B1YmxpY10NCg0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBKYW4gQmV1
bGljaCA8amJldWxpY2hAc3VzZS5jb20+DQo+IFNlbnQ6IFdlZG5lc2RheSwgU2VwdGVtYmVyIDMs
IDIwMjUgMjoyMiBQTQ0KPiBUbzogUGVubnksIFpoZW5nIDxwZW5ueS56aGVuZ0BhbWQuY29tPg0K
PiBDYzogSHVhbmcsIFJheSA8UmF5Lkh1YW5nQGFtZC5jb20+OyBBbnRob255IFBFUkFSRA0KPiA8
YW50aG9ueS5wZXJhcmRAdmF0ZXMudGVjaD47IEFuZHJldyBDb29wZXIgPGFuZHJldy5jb29wZXIz
QGNpdHJpeC5jb20+Ow0KPiBSb2dlciBQYXUgTW9ubsOpIDxyb2dlci5wYXVAY2l0cml4LmNvbT47
IHhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZzsNCj4gQW5kcnl1aywgSmFzb24gPEphc29u
LkFuZHJ5dWtAYW1kLmNvbT4NCj4gU3ViamVjdDogUmU6IFtQQVRDSCB2OCA4LzhdIHhlbi9jcHVm
cmVxOiBBZGFwdCBTRVQvR0VUX0NQVUZSRVFfQ1BQQw0KPiB4ZW5fc3lzY3RsX3BtX29wIGZvciBh
bWQtY3BwYyBkcml2ZXINCj4NCj4gT24gMDMuMDkuMjAyNSAwNToxNCwgUGVubnksIFpoZW5nIHdy
b3RlOg0KPiA+IFtQdWJsaWNdDQo+ID4NCj4gPj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0N
Cj4gPj4gRnJvbTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPg0KPiA+PiBTZW50OiBU
aHVyc2RheSwgQXVndXN0IDI4LCAyMDI1IDc6MDcgUE0NCj4gPj4gVG86IFBlbm55LCBaaGVuZyA8
cGVubnkuemhlbmdAYW1kLmNvbT4NCj4gPj4gQ2M6IEh1YW5nLCBSYXkgPFJheS5IdWFuZ0BhbWQu
Y29tPjsgQW50aG9ueSBQRVJBUkQNCj4gPj4gPGFudGhvbnkucGVyYXJkQHZhdGVzLnRlY2g+OyBB
bmRyZXcgQ29vcGVyDQo+ID4+IDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tPjsgUm9nZXIgUGF1
IE1vbm7DqSA8cm9nZXIucGF1QGNpdHJpeC5jb20+Ow0KPiA+PiB4ZW4tZGV2ZWxAbGlzdHMueGVu
cHJvamVjdC5vcmcNCj4gPj4gU3ViamVjdDogUmU6IFtQQVRDSCB2OCA4LzhdIHhlbi9jcHVmcmVx
OiBBZGFwdCBTRVQvR0VUX0NQVUZSRVFfQ1BQQw0KPiA+PiB4ZW5fc3lzY3RsX3BtX29wIGZvciBh
bWQtY3BwYyBkcml2ZXINCj4gPj4NCj4gPj4gT24gMjguMDguMjAyNSAxMjowNiwgUGVubnkgWmhl
bmcgd3JvdGU6DQo+ID4+PiBAQCAtMTU0LDYgKzE1NiwxNyBAQCBzdGF0aWMgaW50IGdldF9jcHVm
cmVxX3BhcmEoc3RydWN0DQo+ID4+PiB4ZW5fc3lzY3RsX3BtX29wDQo+ID4+ICpvcCkNCj4gPj4+
ICAgICAgZWxzZQ0KPiA+Pj4gICAgICAgICAgc3RybGNweShvcC0+dS5nZXRfcGFyYS5zY2FsaW5n
X2RyaXZlciwgIlVua25vd24iLA0KPiA+Pj4gQ1BVRlJFUV9OQU1FX0xFTik7DQo+ID4+Pg0KPiA+
Pj4gKyAgICAvKg0KPiA+Pj4gKyAgICAgKiBJbiBDUFBDIGFjdGl2ZSBtb2RlLCB3ZSBhcmUgYm9y
cm93aW5nIGdvdmVybm9yIGZpZWxkIHRvIGluZGljYXRlDQo+ID4+PiArICAgICAqIHBvbGljeSBp
bmZvLg0KPiA+Pj4gKyAgICAgKi8NCj4gPj4+ICsgICAgaWYgKCBwb2xpY3ktPmdvdmVybm9yLT5u
YW1lWzBdICkNCj4gPj4+ICsgICAgICAgIHN0cmxjcHkob3AtPnUuZ2V0X3BhcmEudS5zLnNjYWxp
bmdfZ292ZXJub3IsDQo+ID4+PiArICAgICAgICAgICAgICAgIHBvbGljeS0+Z292ZXJub3ItPm5h
bWUsIENQVUZSRVFfTkFNRV9MRU4pOw0KPiA+Pj4gKyAgICBlbHNlDQo+ID4+PiArICAgICAgICBz
dHJsY3B5KG9wLT51LmdldF9wYXJhLnUucy5zY2FsaW5nX2dvdmVybm9yLCAiVW5rbm93biIsDQo+
ID4+PiArICAgICAgICAgICAgICAgIENQVUZSRVFfTkFNRV9MRU4pOw0KPiA+Pg0KPiA+PiBJc24n
dCBwdWxsaW5nIHRoaXMgLi4uDQo+ID4+DQo+ID4+PiAgICAgIGlmICggIWNwdWZyZXFfaXNfZ292
ZXJub3JsZXNzKG9wLT5jcHVpZCkgKQ0KPiA+Pj4gICAgICB7DQo+ID4+PiAgICAgICAgICBpZiAo
ICEoc2NhbGluZ19hdmFpbGFibGVfZ292ZXJub3JzID0NCj4gPj4NCj4gPj4gLi4uIG91dCBvZiB0
aGlzIGlmKCkncyBib2R5IGdvaW5nIHRvIGFmZmVjdCBIV1A/IEl0J3Mgbm90IGNsZWFyIHRvIG1l
DQo+ID4+IHdoZXRoZXIgdGhhdCB3b3VsZCBiZSBlbnRpcmVseSBiZW5pZ24uDQo+ID4NCj4gPiBI
V1AgaGFzIGl0cyBvd24gdW5pcXVlICJod3AiIGdvdmVybm9yLiBTbywgaW1vLCBpdCBtYXkgbm90
IGFmZmVjdC4NCj4NCj4gSG93IGRvZXMgaXQgbWF0dGVyIHdoYXQgKHVuaXF1ZSBvciBub3QpIGdv
dmVybm9yIGl0IHVzZXM/IFRoZSByZWxldmFudCBhc3BlY3QgKHRvDQo+IG1lKSBpcyB0aGUgIWNw
dWZyZXFfaXNfZ292ZXJub3JsZXNzKCkgY2hlY2sgdGhhdCBwcmV2aW91c2x5IGd1YXJkZWQgdGhl
IGNvcHlpbmcNCj4gb2YgdGhlIG5hbWUuIChJdCB3b3VsZCBiZSBhbm90aGVyIHRoaW5nIGlmIHRo
aXMgd2FzIGJlbmlnbiB0byBIV1AsIGJ1dCBzdWNoIHdvdWxkDQo+IG5lZWQgY2xhcmlmeWluZyBp
biB0aGUgZGVzY3JpcHRpb24uIENjLWluZyBKYXNvbiBqdXN0IGluIGNhc2UuKQ0KDQpTb3JyeSwg
V2hhdCBJIG1lYW4gaXMgdGhhdCBIV1AgZG8gaGF2ZSBhIGdvdmVybm9yLCBzbyBzdWNoIGNvcHlp
bmcgb2YgdGhlIG5hbWUgc2hhbGwgYmUgYmVuaWduIHRvIHRoZSBIV1AuIEknbGwgY2xhcmlmeSBp
dCBpbiB0aGUgZGVzY3JpcHRpb24NCg0KPg0KPiBKYW4NCg==

