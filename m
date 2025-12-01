Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1060CC95EF0
	for <lists+xen-devel@lfdr.de>; Mon, 01 Dec 2025 07:58:31 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1175541.1500179 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vPxr8-0000YB-Sk; Mon, 01 Dec 2025 06:57:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1175541.1500179; Mon, 01 Dec 2025 06:57:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vPxr8-0000VL-Q4; Mon, 01 Dec 2025 06:57:54 +0000
Received: by outflank-mailman (input) for mailman id 1175541;
 Mon, 01 Dec 2025 06:57:54 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=isLO=6H=amd.com=penny.zheng@srs-se1.protection.inumbo.net>)
 id 1vPxr8-0000VF-2z
 for xen-devel@lists.xenproject.org; Mon, 01 Dec 2025 06:57:54 +0000
Received: from CH4PR04CU002.outbound.protection.outlook.com
 (mail-northcentralusazlp170130007.outbound.protection.outlook.com
 [2a01:111:f403:c105::7])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0b425368-ce83-11f0-980a-7dc792cee155;
 Mon, 01 Dec 2025 07:57:48 +0100 (CET)
Received: from DM4PR12MB8451.namprd12.prod.outlook.com (2603:10b6:8:182::7) by
 PH0PR12MB8032.namprd12.prod.outlook.com (2603:10b6:510:26f::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.17; Mon, 1 Dec
 2025 06:57:43 +0000
Received: from DM4PR12MB8451.namprd12.prod.outlook.com
 ([fe80::6d8e:2499:8a0a:7eb2]) by DM4PR12MB8451.namprd12.prod.outlook.com
 ([fe80::6d8e:2499:8a0a:7eb2%2]) with mapi id 15.20.9366.012; Mon, 1 Dec 2025
 06:57:43 +0000
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
X-Inumbo-ID: 0b425368-ce83-11f0-980a-7dc792cee155
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=D9em1INpZLZKdR/eLoQNAet6dmmk4SoUyjcItGrQBzzdU16mQKrLbRp+y+mSFCuGKH7YC+ujCkE3WEFqwhAPNFN+X+5USHD3xaeA5JDWInrnzeJSlDgYkLcUW/3lrn0Afq6cDwN52TGb46ZsG5xzp3EnbtI0F97Z4i6AAXZu/yfGGSXbUAaDh2mdLJDT0YIvs/RhPPOuw+CXSBdD0ROhBlPqli3d/0l3Fe2cxPz96liG2vFnZrHovVftv1OHNj9ptJ3c1G1jjBfuUNwcU0d7+8AJTlekFrawtBx0B+0R2koxUHCTmYa7oqM4vfKcLZZB7u2RqygAEU2cirjbBYNx+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ikCrHwEAtMLGWs5s6vKBbLSifaibZtqb/LLPbUMjgkc=;
 b=qMQzUO3mvcgLhmRVvMsTgAVIvS7qOyGeK4b1rn1fiUYR7lZBY4Jhkiz/lztFnAbA9kwCX09j/dftyJObQ/mDSoXCBstS8U423hJ2LlAq0k4rPCtotv19wi6QDKuaL798GcpXE1KWMHlwFJFs5lh7rZWtp7pX1OsuWzqls8KsBmsMudd+h25NO/FEQ8y3PbZ5rMNyvw8Am2KF2ehXki88zJLb1JI4S1pfZc7m6mSjYWBBJ9Uq8O8Vc3SQ6OxbSNg7QtjVgrop/Dw0vm951Hyi2QQvh76rcUPdnM1ezeX1l1w/8OItsFRrJGQlEt/odjSs6j3PUq1EvU4v0jqs2teoqg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ikCrHwEAtMLGWs5s6vKBbLSifaibZtqb/LLPbUMjgkc=;
 b=HZyV4PSz80Ah67Rspf3qv7gQ+PQD5Au32dhI/Sn9JdPnnuKRyeNHyNHMncPE6ZP1s0fNwtlM+/Oq7ecf2FA5zArziZZjSegDKQi5vODKfC3EI/HxuGHzaAKk9kyHZrpYOzi7RPz59IJwaTVYIMthS1AuZzi6+cBGugciJQwfbqA=
From: "Penny, Zheng" <penny.zheng@amd.com>
To: Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>
CC: "Huang, Ray" <Ray.Huang@amd.com>, "grygorii_strashko@epam.com"
	<grygorii_strashko@epam.com>, =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?=
	<roger.pau@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>, Juergen
 Gross <jgross@suse.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
Subject: RE: [PATCH v4 02/24] xen: consolidate cpuid library
Thread-Topic: [PATCH v4 02/24] xen: consolidate cpuid library
Thread-Index: AQHcWtXJjf66LsUGrE2uxhJqk+lJcbUC9piAgAlt5QA=
Date: Mon, 1 Dec 2025 06:57:43 +0000
Message-ID:
 <DM4PR12MB84515C97AE3F68E676FED174E1DBA@DM4PR12MB8451.namprd12.prod.outlook.com>
References: <20251121105801.1251262-1-Penny.Zheng@amd.com>
 <20251121105801.1251262-3-Penny.Zheng@amd.com>
 <6781dbd7-ddce-49c1-a359-0910e91bda43@suse.com>
In-Reply-To: <6781dbd7-ddce-49c1-a359-0910e91bda43@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
 MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Enabled=True;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_SetDate=2025-12-01T06:57:35.0000000Z;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Name=Open
 Source;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_ContentBits=3;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Method=Privileged
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR12MB8451:EE_|PH0PR12MB8032:EE_
x-ms-office365-filtering-correlation-id: c9c6b72e-d2ef-4f32-d497-08de30a6ed61
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|376014|38070700021;
x-microsoft-antispam-message-info:
 =?utf-8?B?MWtNQzNXbGtLMVZINjRZNE1ISjZFUzZ4aXY3K2k0STNVYzhTY3BhMWtSTnQ3?=
 =?utf-8?B?L0pxRXB6WFZIRFo5VEQ0WE9XRks4Qkp2cy9WR2M1Q3hLYW9kdHpxOEVPSTlz?=
 =?utf-8?B?Yi9mTVZ1ZmZoVytHeElSdFpXUW5BM0lBYUNBQ3J4b0lPbTJYYWVYS2lZUC85?=
 =?utf-8?B?VkE1ZlEwMjl4dzJqSjlZQmhNN2locG5OaERBcno3dEVCOGI2WUoyaDdFcmJG?=
 =?utf-8?B?cHk0ZXVGVmR2L29BNDNCdC9rSDg3anlNMUJuckx2Vm9TQ3ByZ2VGN1R5em1z?=
 =?utf-8?B?N3EyeW9mb2NEcmdTSkFZVktZUytNM3NsamRpM3YrQmFQRWlOaHMrM3NVRXpu?=
 =?utf-8?B?K2Q4K2w3Ym1OenQ5RmUzOFN3WDVYamdWN2IyNDFlNkRCWDdFOTBNTjBZcnFr?=
 =?utf-8?B?ZlpsempKUDRUQUZ3b2gwbnp2ZWI3L1Jmc2xPY2FqU3JkZXVkWWNFc2RNQkJX?=
 =?utf-8?B?dmY4cHkxby9kVXBkTm9vMUFHWXhhTWhxTU8xcTVkRFptbS9sdkNvbXhQYS9a?=
 =?utf-8?B?ajdJaVViUTlROFhyVCtiNjd4TUw3STJGVWJrbmFTMkFwa0pSUTJCUjMzYWVs?=
 =?utf-8?B?elJWdWpCdldZMUtQWENKSEkya291NjNpMlFxbkFXb1krVFlWSFdnQ1VSUkNS?=
 =?utf-8?B?NlZ3ZnhzV0d0UVMvTjhaT1l3SE5pSW5Pc1JURUthZkQ1UXIwTk1PWGdsWmh6?=
 =?utf-8?B?QktMZVNUNDJ5dEVnNnVlV2daaDJMak9pZ1lCU1hWWlY3WS9NblhFVTFpcEJD?=
 =?utf-8?B?b3RyMm9RRHUraE0xQXU5YjFpdC9uZytybFV0NUJOc3MrUU1qOGozTEY3eEUy?=
 =?utf-8?B?ZmMwWFJ0ekV0MDkxZXdjZGxOYUtleW1oSGFDNjZWME5PVE1EOVdlNkN2Uks5?=
 =?utf-8?B?enhQbGQxb2Zwb0t3MllwUHhMV244VkZjdmRRNXo2a3BFcFF2V3Z4REZHUmlJ?=
 =?utf-8?B?UVR0c2dXazlSK2pQc1dzWXIwY1pzK0pJSXJ2RjhJTmMwdGpMZTlURjlTcEow?=
 =?utf-8?B?cjA2dE5TMzBoNFA2d2ZBbVRDUHVobTFscFY1WVltM3RIaTJKS1R6d2ZUNW1o?=
 =?utf-8?B?cWREYlpRVmFNcUdlNStNTXAwc3ZndTFSU21DblpaOVlMeC9BK05LZzhGZ21B?=
 =?utf-8?B?THYvd2dyeFptWFRrYTNxYWpuOURRNGJGM01EaFVvNC9XU1QvcW1OVG5QRU1i?=
 =?utf-8?B?YVRSeXNHcjZHMEtHUE15UDRWVWRHYUpoMjY5SC96WWRQemVVd1kvc2ZqdEVR?=
 =?utf-8?B?YXlKSUFudit5Sm5KL25pNlVlRWZhdk5KMnI2bWJicExKUUY5STZvSXBXaTY4?=
 =?utf-8?B?SUMvZnRKMlliaGliOGNMYWpQdUtTaDlxT1l6T2ErNGZWYXpQSC9SbkQ4Skdj?=
 =?utf-8?B?cUg2U05wNVlOWWQ1REl5TlZ1U3UwU2twUmRiQitoOU9Ob2hoOHBJbjNwVFpC?=
 =?utf-8?B?MkdaVFVPYmpwd05pS3FBNk1sZlNQYlNNTnA4U2JlaHl2R1g0YXF0VUVraExz?=
 =?utf-8?B?aHlKNTdWOXNHMVYvdU5IT0h1RHpKWVVsUStDWThrWmZVRjVBd0ZoVVFkODlR?=
 =?utf-8?B?Zzg3VktreDJJZ1gzZS93Qk8zVnJCbDZXZ2FvYkVIK1Z5a3lpMjN0SHYrdUVB?=
 =?utf-8?B?MFhXMVgxdEh2aXlYY0liNFliUTEyYko4NE5HWDBQcVdzaXgwZnJhdzRLQ3dt?=
 =?utf-8?B?VnNRdUdTWlhvMW5GNk12RGEzS2NKNktWRHpaY2M1ZGhMWlFkVkxsZktUWGg1?=
 =?utf-8?B?YVAwaTlpSzdvbENNTk5uMi8rNXpqbTMybWZuWmk5ampaemhmVTQ3R2Y0WEcy?=
 =?utf-8?B?Y0VKZXlDaS93MkJibmludkF6OGcrRWRmdEgrQUNuMlVmb0lDcWVBVnVaTWI0?=
 =?utf-8?B?RjRET1BQbEZlemZ4Y045a0lLT3BqRTE2RXZMU3NLZitlUW1Pa1JKeWp2dFR0?=
 =?utf-8?B?T0FyZElpUFowTGF3RTRrUU0yVzdSamMzNEZST3BaV3I0T3JhUXlqSXdGOHVh?=
 =?utf-8?B?ajRsRmUxblN3dUVIMWIrV1hxVGNVUXZacmJscVlxUlo1V0RocTRSTkJkU1Rh?=
 =?utf-8?Q?Y9NG+L?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR12MB8451.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?d21NRGppRlNCYzZPUVJjRGNjMFJmemt4TG03emlndlM0d0EvcWlLd3B2bnpi?=
 =?utf-8?B?YnFYNHFpQkg4RGttYnNkNldISHdvcVBJOWRiWGljV0pxZVNyTnkrZDNIWENO?=
 =?utf-8?B?WGxCNW1FbytzWDg3bFE1MlpKR3FWWmZQc3VldVBQM2RYazN0MG15bkdvU0dO?=
 =?utf-8?B?TlZCNk9FaFhJSGlwNlBWbCtDQURGRVp6Ky84clhhTWVzWnUzV25Kd3VpQmc4?=
 =?utf-8?B?YkhVYVkzTUVVYkxJVDdQNTZHL0YwUE1CWW9KK01NQlh0RWlWcG5LVmE1eTB0?=
 =?utf-8?B?VlNZZ1c3bGlOTkhUcys4cEN3NjhFdE1zNXpVN2FPbXpFTVZPY3E3TDhGRmpn?=
 =?utf-8?B?WXE4MmtlaXlFc3E1ZlpCRFVrYkpOdXFvcmpPNkMzVUFLc2ZPeUdnU0EyTXZQ?=
 =?utf-8?B?SmJheGc2UkVoMEVVWVdDUjVVZncrd0k3RldoVkZ0VVl2SWlIWlI1YzFpWkVM?=
 =?utf-8?B?WklvVWNYV1lqQUw0V2dHV1ZzM0ljeG10WXlGTGhqS1A2U0FwMTJFUktuSG8z?=
 =?utf-8?B?c2lReUNUbStWTG12dWxXVmJzVFNtS0hmamZwcDRVOVNGNGYrWXFrOEJoWDJl?=
 =?utf-8?B?L284UnZlNUdVdWtxeDBSeENhMjB2aU9KT1Vyc1FzL1ZnNkJlSmpBQTZDVnVR?=
 =?utf-8?B?cDhjdEtVY2NXRDdteGg5MTVqNFB0eWx0dmpnR0dMVEtvNlhML0F0eTcyakhv?=
 =?utf-8?B?eGF3cVExcFBac3hzdktXa3hISmdmWVRNb2JGMnY3NlBYaGRQTVZsc2hVRzRR?=
 =?utf-8?B?SzBLSGlqRzIxWnJwWU1SR3kwOHBrc0s0NnU2WDc5K09PMFpiNnI3eUhkd1V2?=
 =?utf-8?B?aFBMdWk2dDRkSmJ4dklFTng1L2Y3ZVUwMkwyd2ptRkdqQzZuNzJMdGpoSEJp?=
 =?utf-8?B?UW1iQ1ZQNkdlZUdDTnY2eWlWajR0eDB6M3J0SGRLRGZWZlVpdisxNjM3c3Zw?=
 =?utf-8?B?NTlGMWRDSWI2bWJieGw0YmltaWlHdzR5MlZTWkh6R21vaE13cUZ6UWpXWVNG?=
 =?utf-8?B?bHI4aFUrUWRmNEtkbkRXYkN5RG5iRGU0bktnUmZ5cjhuZmJIOHYrTSszZnlX?=
 =?utf-8?B?S0JSampqTGR5L3RtZ0poMDVkNWJsc1kzT3hSU1NUanZjK0V6cHV6Y0ladjR3?=
 =?utf-8?B?THlnUWNiaWp3U1luM0JPbkplT2o3N3lHNEU2OC9RakJuS2pMRkt5YVlEOU1j?=
 =?utf-8?B?YVBTT040OWlGbGxBd2xvYWo0YnV0VTFRMEpRdGY3MS9JQkRQVnlJVlpKNHhr?=
 =?utf-8?B?KzNZZFdUcEJvMkgySXlYeFdCMU1vTVVPUEI2UHlNN3o2V25ydm4ydjN1QmZa?=
 =?utf-8?B?Snc1cFRlVEdSdWwzejlaaUxwTnRxdUt0T3l5QWExcTlWeUZSVlhNdXkyNWtv?=
 =?utf-8?B?c09JNkZsNTltdjZXV1pQZmV6QzNwOUdobTBuR01MYlNLZ1BjMDE3Y0xNZjNk?=
 =?utf-8?B?Qks3emlXYjQ0YzdheTdVeWRHZm5OVVJxTjRwdVFneklpeDZ0MlRIQ1RCejZG?=
 =?utf-8?B?RnNrT3dodnltWHB0RmNkTG8xb2Z5SmQzM25LQWd0Zys5N05Za3VFRVc3WDdZ?=
 =?utf-8?B?UjF4QlVBWXUvMGU1bUc5T2tFeHJCeE5ydk9Ed2NWQ0orMlp6d2Z1UWFHUFov?=
 =?utf-8?B?clRBS3RVYWZudGpmRTdYRmY4d2dRT3ZYSmxzK3FZY3V3eUc2MDVWa2E2M2ZS?=
 =?utf-8?B?RGdIR0RCeldvWURJT0lNeWtDR3MzbHVVU2hkUmhPRHRLSmI5cHNPakRiSlRs?=
 =?utf-8?B?bVpQTUszNjlXMU1JbUk4ODhGNFdnTGFyL2dOTGlUYzlmK3V0R1B4NC9TWnFJ?=
 =?utf-8?B?aDViVHh4NW51bVJhTGptTnh3dzJIMGxDRTZmNWpGYk81MU84SjZCS2ttM2Rw?=
 =?utf-8?B?Zmg2RHA0YTF0Z2VGNm5hbDFGSklwZVljTGJrZzNUR05wb3Azdzcvdy9CN0Jp?=
 =?utf-8?B?aG51aS9iczc3bVVWTXNmTTltWVl6VzdEN3FmTm9uTVNaWVMrVDQ2ZzVuZEJu?=
 =?utf-8?B?eTZXNWUwUy9VMEZON2lLZDFaV2s4Qlp0d2hDQXRTd2F4VWRLSElVNnZadm9W?=
 =?utf-8?B?bTZTUXRXRHU2alB0R2syVmRNSXRFaHpvdTFxTDNXYmJ5RGtRYzRmY1lwREw4?=
 =?utf-8?Q?H6Fc=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB8451.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c9c6b72e-d2ef-4f32-d497-08de30a6ed61
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Dec 2025 06:57:43.8255
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: J/3IVROYTywTxQ32e7PmpJnFvS/RwmqFOYdJQPNBHVlAluMvuawkK0z9lnVbahS73waav89J3uFs26LOZdRJTg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB8032

W1B1YmxpY10NCg0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBKYW4gQmV1
bGljaCA8amJldWxpY2hAc3VzZS5jb20+DQo+IFNlbnQ6IFR1ZXNkYXksIE5vdmVtYmVyIDI1LCAy
MDI1IDI6MzkgUE0NCj4gVG86IFBlbm55LCBaaGVuZyA8cGVubnkuemhlbmdAYW1kLmNvbT47IEFu
ZHJldyBDb29wZXINCj4gPGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+DQo+IENjOiBIdWFuZywg
UmF5IDxSYXkuSHVhbmdAYW1kLmNvbT47IGdyeWdvcmlpX3N0cmFzaGtvQGVwYW0uY29tOyBSb2dl
cg0KPiBQYXUgTW9ubsOpIDxyb2dlci5wYXVAY2l0cml4LmNvbT47IEFudGhvbnkgUEVSQVJEDQo+
IDxhbnRob255LnBlcmFyZEB2YXRlcy50ZWNoPjsgSnVlcmdlbiBHcm9zcyA8amdyb3NzQHN1c2Uu
Y29tPjsgeGVuLQ0KPiBkZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZw0KPiBTdWJqZWN0OiBSZTog
W1BBVENIIHY0IDAyLzI0XSB4ZW46IGNvbnNvbGlkYXRlIGNwdWlkIGxpYnJhcnkNCj4NCj4gT24g
MjEuMTEuMjAyNSAxMTo1NywgUGVubnkgWmhlbmcgd3JvdGU6DQo+ID4gVGhlcmUgYXJlIHNvbWUg
Y3B1aWQgbGlicmFyeSBmdW5jdGlvbnMgb25seSByZWZlcmVuY2VkIGluDQo+ID4gWEVOX0RPTUNU
TF9nZXR7LHNldH1fY3B1X3BvbGljeS1jYXNlLCBhbmQgc2hhbGwgYmUgd3JhcHBlZCB3aXRoDQo+
ID4gQ09ORklHX01HTVRfSFlQRVJDQUxMUyBsYXRlciwgb3RoZXJ3aXNlIHRoZXkgd2lsbCBiZWNv
bWUgdW5yZWFjaGFibGUNCj4gPiB3aGVuIE1HTVRfSFlQRVJDQUxMUz1uLCBhbmQgaGVuY2Ugdmlv
bGF0ZSBNaXNyYSAyLjENCj4gPiAtIHg4Nl9jcHVfcG9saWN5X2NsZWFyX291dF9vZl9yYW5nZV9s
ZWF2ZXMNCj4gPiAgIC0gemVyb19sZWF2ZXMNCj4gPiAtIHg4Nl9jcHVpZF9jb3B5X3RvX2J1ZmZl
cg0KPiA+ICAgLSBjb3B5X2xlYWZfdG9fYnVmZmVyDQo+ID4gLSB4ODZfY3B1aWRfY29weV9mcm9t
X2J1ZmZlcg0KPiA+IFdlIHNlcGVyYXRlIHRoZXNlIGZ1bmN0aW9ucyBieSBtb3Zpbmcgb3RoZXIg
ZnVuY3Rpb25zIHRvIGEgbmV3IGZpbGUNCj4gPiBuYW1lZCBjcHVpZC1nZW5lcmljLmMsIGFuZCBt
b2RpZnkgcmVsYXRlZCBNYWtlZmlsZS1zIHRvIHJldGFpbiBzYW1lIGJlaGF2aW9yLg0KPiA+DQo+
ID4gU2lnbmVkLW9mZi1ieTogUGVubnkgWmhlbmcgPFBlbm55LlpoZW5nQGFtZC5jb20+DQo+ID4g
LS0tDQo+ID4gdjMgLT4gdjQ6DQo+ID4gLSBuZXcgY29tbWl0DQo+ID4gLS0tDQo+ID4gIHRvb2xz
L2Z1enovY3B1LXBvbGljeS9NYWtlZmlsZSAgICAgICAgICAgICAgIHwgICAyICstDQo+ID4gIHRv
b2xzL2Z1enoveDg2X2luc3RydWN0aW9uX2VtdWxhdG9yL01ha2VmaWxlIHwgIDEwICstDQo+ID4g
IHRvb2xzL2xpYnMvZ3Vlc3QvTWFrZWZpbGUuY29tbW9uICAgICAgICAgICAgIHwgICAyICstDQo+
ID4gIHRvb2xzL3Rlc3RzL2NwdS1wb2xpY3kvTWFrZWZpbGUgICAgICAgICAgICAgIHwgICAyICst
DQo+ID4gIHRvb2xzL3Rlc3RzL3g4Nl9lbXVsYXRvci9NYWtlZmlsZSAgICAgICAgICAgIHwgICAy
ICstDQo+ID4gIHhlbi9saWIveDg2L01ha2VmaWxlICAgICAgICAgICAgICAgICAgICAgICAgIHwg
ICAxICsNCj4gPiAgeGVuL2xpYi94ODYvY3B1aWQtZ2VuZXJpYy5jICAgICAgICAgICAgICAgICAg
fCAyNzMgKysrKysrKysrKysrKysrKysrKw0KPiA+ICB4ZW4vbGliL3g4Ni9jcHVpZC5jICAgICAg
ICAgICAgICAgICAgICAgICAgICB8IDI2MCAtLS0tLS0tLS0tLS0tLS0tLS0NCj4gPiAgOCBmaWxl
cyBjaGFuZ2VkLCAyODMgaW5zZXJ0aW9ucygrKSwgMjY5IGRlbGV0aW9ucygtKSAgY3JlYXRlIG1v
ZGUNCj4gPiAxMDA2NDQgeGVuL2xpYi94ODYvY3B1aWQtZ2VuZXJpYy5jDQo+DQo+IEFuZHJldyAt
IHdoYXQncyB5b3VyIHRha2Ugb24gc3VjaCBhIHNwbGl0PyBQZXJzb25hbGx5IEknbSBub3Qgb3Zl
cmx5IGhhcHB5IHRvIHNlZQ0KPiByZWxhdGVkIGZ1bmN0aW9ucyBiZSBzY2F0dGVyZWQgYWNyb3Nz
IHR3byBmaWxlcy4gVGhlIHNlcGFyYXRpb24gYWxzbyBmZWVscyBwcmV0dHkNCj4gcmFuZG9tLCBw
b3NpbmcgdGhlIHJpc2sgdGhhdCBsYXRlciBzb21lIG9mIHRoZSBjb2RlIG1heSBuZWVkIHRvIG1v
dmUgYmFjay4NCj4NCg0KUmlnaHQgbm93LCBJIGNvdWxkIG5vdCB0aGluayBhIGJldHRlciB3YXkg
dG8gZ3VhcmQgeDg2X2NwdWlkX2NvcHlfZnJvbXssdG99X2J1ZmZlciB3aXRoIE1HTVRfSFlQRVJD
QUxMUyB3aXRob3V0IHNwbGl0LCBhbnkgYmV0dGVyIHN1Z2dlc3Rpb24/IE9yIG1heWJlIEkgY291
bGQgYWRkIHVwIHNvbWUgZXhwbGFuYXRpb25zIG9uIHRoZSBmaWxlIGNwdWlkX2dlbmVyaWMuYyBo
ZWFkIG5vdGUgdG8gZXhwbGFpbiB0aGUgZGlmZnMgYmV0d2VlbiBpdHNlbGYgYW5kIGNwdWlkLmMs
IHNvbWV0aGluZyBsaWtlOg0KYGBgDQpUaGUgZGlmZmVyZW5jZSBiZXR3ZWVuIGNwdWlkLmMgYW5k
IGNwdWlkX2dlbmVyaWMuYyBpcyB0aGF0IHRoZSBmb3JtZXIgY29udGFpbnMgbGlicmFyeSBmdW5j
dGlvbnMgdGhhdCBoYXMgb25seSBiZWVuIHJlZmVyZW5jZWQgaW4gbWFuYWdlbWVudCBoeXBlcmNh
bGxzLCBzdWNoIGFzIHN5c2N0bCwgZG9tY3RsLCBldGMuIFNlZSBjb21tZW50IGZvciBNR01UX0hZ
UEVSQ0FMTFMuDQpgYGANCg0KPiBQZW5ueSwgSSBhbHNvIGRvbid0IHRoaW5rICJjb25zb2xpZGF0
ZSIgaXMgd2hhdCBpcyBoYXBwZW5pbmcgaGVyZS4NCj4gUGVyaGFwcyAic3BsaXQiIHdvdWxkIGJl
IGdldHRpbmcgY2xvc2VyPw0KPg0KPiBKYW4NCg==

