Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 71162B259BC
	for <lists+xen-devel@lfdr.de>; Thu, 14 Aug 2025 05:14:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1080615.1440922 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1umOP2-0004FG-U1; Thu, 14 Aug 2025 03:13:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1080615.1440922; Thu, 14 Aug 2025 03:13:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1umOP2-0004Cl-Q1; Thu, 14 Aug 2025 03:13:20 +0000
Received: by outflank-mailman (input) for mailman id 1080615;
 Thu, 14 Aug 2025 03:13:19 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Ppuf=22=amd.com=penny.zheng@srs-se1.protection.inumbo.net>)
 id 1umOP1-0004Cf-CU
 for xen-devel@lists.xenproject.org; Thu, 14 Aug 2025 03:13:19 +0000
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on20612.outbound.protection.outlook.com
 [2a01:111:f403:2412::612])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9e583138-78bc-11f0-b898-0df219b8e170;
 Thu, 14 Aug 2025 05:13:17 +0200 (CEST)
Received: from DM4PR12MB8451.namprd12.prod.outlook.com (2603:10b6:8:182::7) by
 MN2PR12MB4142.namprd12.prod.outlook.com (2603:10b6:208:1dd::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9009.21; Thu, 14 Aug
 2025 03:13:12 +0000
Received: from DM4PR12MB8451.namprd12.prod.outlook.com
 ([fe80::b04e:2da5:7189:4c4d]) by DM4PR12MB8451.namprd12.prod.outlook.com
 ([fe80::b04e:2da5:7189:4c4d%7]) with mapi id 15.20.9031.012; Thu, 14 Aug 2025
 03:13:11 +0000
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
X-Inumbo-ID: 9e583138-78bc-11f0-b898-0df219b8e170
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QJTXOaFoQEFUsAnqWx1mdqCHFftnfoBDHqeWauYTuupvyeYC4ii1Z4sFACJ4zcKcV0ZBoo0AZ0rGFXlDI+ALf8QcmSqxqQ/PUdvuzfHGvqhyF3360beiZNlykK6w0RGtG4SpSZKuw/5svWslT+c+If+6MVD+aV6iLxgjnPcaMBFNCs24iZ/MqT5H4ezuRR9KVR1vwHoQ/jwwyHW1o6/tgduGem23r5oR3rxpct03MnbE/Hogh5KAKDGXW7i4kCSbDWCAUHUmyjvCq/jZzP8cAXfS3plCGcuiMc/iJNzIOT/ADx372Fl2SaJwXeVzHFV2a0fVgQl5ZkBYh7vheYq66w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ubZMbdr4PUHDB7jBLe6yqtwgS6zNBrz+/3WKcqZRQIA=;
 b=sAwS4tQH8Ryie6UfVnnS+IyZS80r0fJbh3zoO0aTwREArG9QBwbBI3iAuozAUutCdyo+JCz1pEdvQKGPBGXGb6upIFPeUuIC2B1wGzUyJN/jJJ/lEueFi2QVLfmF2TUYrjEcgM6YMFYcpsJN+xUZTW/T/2m3y1WSJPQ0pAY7jRyWIGhgZ/zW5sbTIlcmX985JO23jebqlVEnuBKR5uSvhrcwenxDN6lPKmz0rUU9yojTtb7pEMqLG63+oEs7/iTcZlKKkFiKlRzHAOwa0OxpJCe7rsODY7JjN5B4GbWG7hSjQxuqXtmlLDsc1Psff9X7pkKI1yllisKOAkH5QTHqXA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ubZMbdr4PUHDB7jBLe6yqtwgS6zNBrz+/3WKcqZRQIA=;
 b=c+neqlkjaKy/sAYZ+EoK6lQ9h5gzg3kAfRnoueFq8xRl1nLhVUZDCnmxyPjkzwE/GAvS5Z+W3pN+IW3MlMJO4UOLg6D6jWHIQFOn+w4e3CFUvC7csODfXBkvj/CY9RNBFD2m0d87eD7UATwCZV+BZTzsbDPAk4B2AVwuwDdJrJw=
From: "Penny, Zheng" <penny.zheng@amd.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "Huang, Ray" <Ray.Huang@amd.com>, Anthony PERARD
	<anthony.perard@vates.tech>, Andrew Cooper <andrew.cooper3@citrix.com>,
	"Orzel, Michal" <Michal.Orzel@amd.com>, Julien Grall <julien@xen.org>,
	=?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>, Stefano
 Stabellini <sstabellini@kernel.org>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
Subject: RE: [PATCH v6 19/19] xen/cpufreq: Adapt SET/GET_CPUFREQ_CPPC
 xen_sysctl_pm_op for amd-cppc driver
Thread-Topic: [PATCH v6 19/19] xen/cpufreq: Adapt SET/GET_CPUFREQ_CPPC
 xen_sysctl_pm_op for amd-cppc driver
Thread-Index: AQHb8hcuzjUv9QY8PkCazI2v8DQHmbRBbryAgCA3tFA=
Date: Thu, 14 Aug 2025 03:13:11 +0000
Message-ID:
 <DM4PR12MB845131A7E81BD54B0334E3B2E135A@DM4PR12MB8451.namprd12.prod.outlook.com>
References: <20250711035106.2540522-1-Penny.Zheng@amd.com>
 <20250711035106.2540522-20-Penny.Zheng@amd.com>
 <796a9251-8b4f-4266-a31e-828d4da29f54@suse.com>
In-Reply-To: <796a9251-8b4f-4266-a31e-828d4da29f54@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
 MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Enabled=True;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_SetDate=2025-08-14T03:13:04.0000000Z;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Name=Open
 Source;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_ContentBits=3;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Method=Privileged
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR12MB8451:EE_|MN2PR12MB4142:EE_
x-ms-office365-filtering-correlation-id: 618fb6e4-183f-4e3c-8dfb-08dddae0806a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?TFBSREVEbmZxSTJzWmlXNEdmSXh3bXJtbUs0MFVJQys2TEpmQUN1N3oyMVVv?=
 =?utf-8?B?dEJvZnplUlN2MVpqT1hRWERsanRFdkFMdmZ5YXEvb2FndlQ3MHAySjZONXha?=
 =?utf-8?B?bTdxM1EzcTJlNllzaWk2VDJIRDVBbW1mYi9jbS9kY0l4aWVlUDZMNnNCeW9t?=
 =?utf-8?B?MmFuZjhSZXhtRUV6MWpyRk05aDFsWlhXZUV3Ynh5eFVLcHNNNmh2RklXeWpW?=
 =?utf-8?B?ODlHd2FVZXVncXNmOURnT05xYURwTzFnWkdoc2NGYzljUm1GaDdBaUgwTDdi?=
 =?utf-8?B?eTdPWUU3NklRai9FVXpJR3NXamplWlZlQnRKaEg4VDRMVTFiSzRGKzBtTmM3?=
 =?utf-8?B?Qks4b2VPY2x6cUZuaHpVMURmdlhpV256S1hOYWxjTXlPZk0vclpZZzNvTjBQ?=
 =?utf-8?B?WTQ1bkNzUlZrcEFsT3pVTno1Y0xMOWJsTWFVRGVYU0orMm8rSGlwTFVMQnlM?=
 =?utf-8?B?RWFuc2k5d0FYd2FoUk1xSy8vVjZ5dGJvZjF2YVl2MG5NenpxWEtWRkFqSHA1?=
 =?utf-8?B?Zk9pb3docWQ2ajJDM1pWNWxQOFUzOTE2cTV6YzJ6aEhkeldIWnFWU1pJcllr?=
 =?utf-8?B?VUNNd1VxeUZrK1JYSlpwYkhVaXZKUTJGVWtLdzZjaklXNVgzVDRId0lGVkRN?=
 =?utf-8?B?cWRPV2o2WXdKeWZQVHR0Z1FvcldXZFNTTG55UmFNYUhJdE1RMlJ6NDMrckdN?=
 =?utf-8?B?SzBnWFVMN1YwcXB1UTRpNys5T1gzWk1BWUdXK3V0TVBoQVZ4NktsVVUvbWdE?=
 =?utf-8?B?QmNQWFVOMEZuOHF1dW1qMS8zMVdDMDZ2cE1lSU9va3E5UmZSOWRHTG1lSHZh?=
 =?utf-8?B?ZVZRdlB3QkxmckFGOVlvTTAzWHZFSi9hM20veFZjTDZ5MkFvRU1xUGFnYWZm?=
 =?utf-8?B?OVFBdVNnYTJuMC9Rb2xiR3BEVDFzNkxNNVR1RzF4b2tDSXQ1TGF6eUVaeVl5?=
 =?utf-8?B?UkJCMUNWcDZlblBqWjA5TXRNZUJaSlJRWDFtVXJSOU5LWm1ObU5XTUFLLzI1?=
 =?utf-8?B?Z0txd29LakRud3J5VzluRUxJeHBQc1RjQ0ZlWTlPMVBWWnVCYlBkb0tnejU0?=
 =?utf-8?B?bkFYUmdINC82bEJobjJ4RTZpTWpZYnBaeC9IT2pCLzVQUHdGTXJ6TUl1OFJl?=
 =?utf-8?B?YW95cUtiMCtrZFdqdHVvdnV1b05TVVlXQTh3aWUwU2VOOHRveU1yNGNWMG84?=
 =?utf-8?B?b1l4Qjc1VHF6REhWbmJtQVhnOWNPNUxqNkNNNXFMb2VjQzI1VUJSbk5vMWhp?=
 =?utf-8?B?S2JIc05xVVhNVGdFQWtPb3dhZ1NsVWdGaVEwYXpoTzhxTjRTeS9QbVNFelhj?=
 =?utf-8?B?TzVDaitpeFBSSWFNcGFPY3RoVFRlWU5BYXhYM25uNGVmZ3lVYndoeFl2RTZt?=
 =?utf-8?B?MDVKVWtab3NRMGY2RG5aSE9QZVZCMUxUUFU3dUVGQVFRQ1JMWEJwY1RBNGlv?=
 =?utf-8?B?c2JadmxsVzhMZXAxZDZWSDFEMVFOaUNlV256Z2ZLQWhVL1F5eXFBSVNQeTZN?=
 =?utf-8?B?QUVGQTRkZ2QxbUk0L1NZNHpyT3daZUgwSDI5K3l3YjFhZklHU09XTDM0ZDJp?=
 =?utf-8?B?ckdWN0EvSXI0d0g2M3RNbmkzcVJqR0VRZ1ZUMjdYbzBmWFIyczNMVE1odENj?=
 =?utf-8?B?SjhpTGtRNmY3QXdmWFc1cm5QVis3MFdLU2RYcVdNZk1YS3FUOHg5bTNMTDBF?=
 =?utf-8?B?a1FDbHlxNGsvNkcyVUNnN01GRUFKQ29SOWVKS0FBSXFhWWhZWWlVRmxSSi9z?=
 =?utf-8?B?TWt1RkE0VFRjdWdFMGc3NHdNKzByMVBZRlFXYmRpbTg2UFZncXRDSHp3bWFW?=
 =?utf-8?B?dU5pTUNPWDB0UFY3SE5NeU5lZi90ZVRpQzBPT0gzbFJmUTFQM0lKSy9VZUE3?=
 =?utf-8?B?c1NMamxiWVRkYVIzR01MU1pucG5icUZ3eGRFK1NHZVFWTFBqWnVReVNXdjh5?=
 =?utf-8?B?R2dKbG1DYWZjSkhmQ3I0ejY5WlRjQ3JQNXNCR1RoNngvc2tkb0IvUHpuV2RQ?=
 =?utf-8?Q?EieQCAKLzAu21SfjJ1roBGvUeU2n7A=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR12MB8451.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?dVcyOGdiLzQ4Qmh4QllLVUFEOHZLT2xqMDhqbU1jdGx5OUMxZW9hWE9LMktK?=
 =?utf-8?B?UDJuUnRiSkkzL0c1VW1TYzBuZTBvcHVWWjFsZGsrZDVWR216SHJqVk92MmJJ?=
 =?utf-8?B?NUxWVkN3Vno1UlRWblZMWU5LN0J0VEFjZ2dDVXpETEZpaWVYbWRkT0Nua0ND?=
 =?utf-8?B?d00xTVVoOEVjd3QzMmVSU09Wc3hxZ1BWY0NHMFFjTEg2V2NKdXVpMitEWlVN?=
 =?utf-8?B?dFhxa0JaNm1FQWgyb1ZPaTVrRlJqOG5FTjRXWjFxWmR0NkdlTGJoaXhQek5k?=
 =?utf-8?B?VWw3bHNZem16R2FaTG1RQ3VnQnRQRk9GcnNaanoyNysrUDdpSW14akFPUUsy?=
 =?utf-8?B?MWFPTFJQdzZ6Q2o3elU5WkV0am1KWXB1S0hNQ1RoSWJqSERaWU8xQlVDOHpO?=
 =?utf-8?B?SnZ2RE9pc0RoUEhGL1Q4aFJsNUdwUm1yZEFhUnlkN2NkQmMwUUFyTldINlBM?=
 =?utf-8?B?ZWg5RkVKaDhlZWtEWStIUURwZ05nRThCeDNQWWduL0ZsVkZYYm1rT2lOWE50?=
 =?utf-8?B?UkhDSDI3c1hNOWF2UlFkeXhDci9TOW8vQUJJbUUwTit5ZzlMMUgzZHczdkFn?=
 =?utf-8?B?YWZVT29obEpwbmh1YmE1QktPdWJYczRZck0vVVRSSkpWNWpWT1JsdDJOTjNZ?=
 =?utf-8?B?UXA5MldQbVk3YkUxTFJad1MvYmk3czM0WW9kTVRBbTMybHFSc1lKaURrNFlj?=
 =?utf-8?B?VExML00wWWNFeS96N1NBQW5KY3djOEpLZUQzbGRFQ29udGE0aEhLUmgzS1ZL?=
 =?utf-8?B?VkRuUGZzSVZNT2w1L2U3L2hHVmt6b2dmU3ByMk1QK1dkWjZ2YktlNXJJMnNp?=
 =?utf-8?B?emJMdjgyKytDKy9YdS9mVDZPaGxaUWV0MnFkeWc2a3ZweVQ5V1F3UkM0MDR6?=
 =?utf-8?B?SGRuUjFjSk9aS0lvcVd0cnZOTFJnZmYwZE5QeGNUV0JKTytUcWIxUlNDdDFl?=
 =?utf-8?B?Y21sVllML2FiNDd0ZGRCa1NPeEF3bGNSM3I1NHhmZkFCSS9hV1A2dzZzRDBR?=
 =?utf-8?B?NmxhaGNWa05xV1B6OVg5b3hpSFpMMDMwQ0s3bXpobVlDaFlkVkg2WnlER0VO?=
 =?utf-8?B?cFZwQzJuTU5UQ00rb05NVlNRdDRoWXVYRlRXMnJQajBoNFVvQVJnRzB1QWV3?=
 =?utf-8?B?TDUyeE5DTGxFSmx4Z0tNZlFCK016UkV5RTRvVmFxVGYzbngzTUoySTR3Z1la?=
 =?utf-8?B?bVZNNWhtTG9UMVRUcUI1LzUvMmRPZm56SU9nandPSXZSSUkxSkdTZ21tcHFO?=
 =?utf-8?B?MnljTzVuTU4wd1BrdkUydi9qbUVXTGRVd1hKWjBHVlZlQmhhN09hS211NWpT?=
 =?utf-8?B?bjFMNjBJbElBQWV4ak1rdWoxSW5sbHBRK0cwL1ZrWEdzYklZZ1BFTDdXaklh?=
 =?utf-8?B?cHBpTWlVQXIzOXN4dHFSSmw4Sks2UkZER3BqV0ZxUE1nM2gxVnVTVmF3NDNJ?=
 =?utf-8?B?V1RmUU9rSWxxVkRMY1VpeGpzdzdUNHV1cW84ZWJhRlFTc3BUSFNlTnU1NGVQ?=
 =?utf-8?B?NUFRNzgyYUttT2M5YkR5MkV4aXhFdlEvU1ExcW9SWlVPZktIcUdnbVBzbGhm?=
 =?utf-8?B?dGdMb3NhcjJNS1l2VzZPakF1Mi9XVGxHUEo1UFljQ3dpTVBKbHprejU2OU1L?=
 =?utf-8?B?ZTFQQkpaTS9iOTZjZGdDcWUweTF2QmJsY2FtMG83RGNCVWgybVQ4eWh6cEc5?=
 =?utf-8?B?akNKZTZaeHBqUUtpZkNTdDIrbGh2UUlzU0tJWkZrQWZYeUVXeXlPQ1ZJZjM3?=
 =?utf-8?B?VHBpeVN5SWpnOEZod3ZTS2NyWUtsYnFiay9QcEx4dnc3T1Z3ZnUzc1poTENC?=
 =?utf-8?B?QlFtTkFkNUE5a2VtVVVkalIrbloyODVXV2NCVUdaS2pJaHBvaGRBaWFJUHp6?=
 =?utf-8?B?MmY0aVBacEZBUmRCRUNrRFR6YUlzRTliUXVJdWFUSTU0YjEveWpBL3F5VXhY?=
 =?utf-8?B?L2hrakwxYTZUMHNFT3B6enh6bHkvdG9ocXIvT3Nvbk5UQlcrQU1XWXpNblJH?=
 =?utf-8?B?KzdkdVJnVkszdTlLNTJ5MFQ4d2ZRbk5yQkgzbkJlTjhBZWt3WUFGZXNFQnlT?=
 =?utf-8?B?ZjQ4OE5uVXV6M3gyQmNCV2VYc2loMkRCMVVIcDlRdkdVanJ4NVNmRS9iK1FI?=
 =?utf-8?Q?adcQ=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB8451.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 618fb6e4-183f-4e3c-8dfb-08dddae0806a
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Aug 2025 03:13:11.7990
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: py1QPwDQLcvoHcc0Tz+VjaZaylsnqNQrhxCkyWOpyLuW8NAOaDjPbg0P6/s7VLPVsTcUiLmWda+Q0FfLV4vvyg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4142

W1B1YmxpY10NCg0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBKYW4gQmV1
bGljaCA8amJldWxpY2hAc3VzZS5jb20+DQo+IFNlbnQ6IFRodXJzZGF5LCBKdWx5IDI0LCAyMDI1
IDEwOjQ0IFBNDQo+IFRvOiBQZW5ueSwgWmhlbmcgPHBlbm55LnpoZW5nQGFtZC5jb20+DQo+IENj
OiBIdWFuZywgUmF5IDxSYXkuSHVhbmdAYW1kLmNvbT47IEFudGhvbnkgUEVSQVJEDQo+IDxhbnRo
b255LnBlcmFyZEB2YXRlcy50ZWNoPjsgQW5kcmV3IENvb3BlciA8YW5kcmV3LmNvb3BlcjNAY2l0
cml4LmNvbT47DQo+IE9yemVsLCBNaWNoYWwgPE1pY2hhbC5PcnplbEBhbWQuY29tPjsgSnVsaWVu
IEdyYWxsIDxqdWxpZW5AeGVuLm9yZz47IFJvZ2VyIFBhdQ0KPiBNb25uw6kgPHJvZ2VyLnBhdUBj
aXRyaXguY29tPjsgU3RlZmFubyBTdGFiZWxsaW5pIDxzc3RhYmVsbGluaUBrZXJuZWwub3JnPjsg
eGVuLQ0KPiBkZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZw0KPiBTdWJqZWN0OiBSZTogW1BBVENI
IHY2IDE5LzE5XSB4ZW4vY3B1ZnJlcTogQWRhcHQgU0VUL0dFVF9DUFVGUkVRX0NQUEMNCj4geGVu
X3N5c2N0bF9wbV9vcCBmb3IgYW1kLWNwcGMgZHJpdmVyDQo+DQo+IE9uIDExLjA3LjIwMjUgMDU6
NTEsIFBlbm55IFpoZW5nIHdyb3RlOg0KPiA+IEludHJvZHVjZSBoZWxwZXIgc2V0X2FtZF9jcHBj
X3BhcmEoKSBhbmQgZ2V0X2FtZF9jcHBjX3BhcmEoKSB0bw0KPiA+IFNFVC9HRVQgQ1BQQy1yZWxh
dGVkIHBhcmEgZm9yIGFtZC1jcHBjL2FtZC1jcHBjLWVwcCBkcml2ZXIuDQo+ID4NCj4gPiBJbiBn
ZXRfY3B1ZnJlcV9jcHBjKCkvc2V0X2NwdWZyZXFfY3BwYygpLCB3ZSBpbmNsdWRlDQo+ID4gInBy
b2Nlc3Nvcl9wbWluZm9bY3B1aWRdLT5pbml0ICYgWEVOX0NQUENfSU5JVCIgY29uZGl0aW9uIGNo
ZWNrIHRvDQo+ID4gZGVhbCB3aXRoIGNwdWZyZXEgZHJpdmVyIGluIGFtZC1jcHBjLg0KPiA+DQo+
ID4gQWxzbywgYSBuZXcgZmllbGQgInBvbGljeSIgaGFzIGFsc28gYmVlbiBhZGRlZCBpbiAic3Ry
dWN0IHhlbl9nZXRfY3BwY19wYXJhIg0KPiA+IHRvIGRlc2NyaWJlIHBlcmZvcm1hbmNlIHBvbGlj
eSBpbiBhY3RpdmUgbW9kZS4gSXQgZ2V0cyBwcmludGVkIHdpdGgNCj4gPiBvdGhlciBjcHBjIHBh
cmFzLiBNb3ZlIG1hbmlmZXN0IGNvbnN0YW50cyAiWEVOX0NQVUZSRVFfUE9MSUNZX3h4eCIgdG8N
Cj4gPiBwdWJsaWMgaGVhZGVyIHRvIGxldCBpdCBiZSB1c2VkIGluIHVzZXIgc3BhY2UgdG9vbHMu
IEFsc28gYWRkIGEgbmV3DQo+ID4gYW5jaG9yICJYRU5fQ1BVRlJFUV9QT0xJQ1lfeHh4IiBmb3Ig
YXJyYXkgb3ZlcnJ1biBjaGVjay4NCj4NCj4gSWYgb25seSB0aGV5IGluZGVlZCBoYWQgWEVOXyBw
cmVmaXhlcy4NCj4NCj4gPiBTaWduZWQtb2ZmLWJ5OiBQZW5ueSBaaGVuZyA8UGVubnkuWmhlbmdA
YW1kLmNvbT4NCj4gPiAtLS0NCj4gPiB2MSAtPiB2MjoNCj4gPiAtIEdpdmUgdGhlIHZhcmlhYmxl
IGRlc19wZXJmIGFuIGluaXRpYWxpemVyIG9mIDANCj4gPiAtIFVzZSB0aGUgc3RybmNtcCgpcyBk
aXJlY3RseSBpbiB0aGUgaWYoKQ0KPiA+IC0tLQ0KPiA+IHYzIC0+IHY0DQo+ID4gLSByZWZhY3Rv
ciBjb21tZW50cw0KPiA+IC0gcmVtb3ZlIGRvdWJsZSBibGFuayBsaW5lcw0KPiA+IC0gcmVwbGFj
ZSBhbWRfY3BwY19pbl91c2UgZmxhZyB3aXRoIFhFTl9QUk9DRVNTT1JfUE1fQ1BQQw0KPiA+IC0t
LQ0KPiA+IHY0IC0+IHY1Og0KPiA+IC0gYWRkIG5ldyBmaWVsZCAicG9saWN5IiBpbiAic3RydWN0
IHhlbl9jcHBjX3BhcmEiDQo+ID4gLSBhZGQgbmV3IHBlcmZvcm1hbWNlIHBvbGljeSBYRU5fQ1BV
RlJFUV9QT0xJQ1lfQkFMQU5DRQ0KPiA+IC0gZHJvcCBzdHJpbmcgY29tcGFyaXNvbnMgd2l0aCAi
cHJvY2Vzc29yX3BtaW5mb1tjcHVpZF0tPmluaXQgJg0KPiBYRU5fQ1BQQ19JTklUIg0KPiA+IGFu
ZCAiY3B1ZnJlcS5zZXRwb2xpY3kgPT0gTlVMTCINCj4gPiAtIEJsYW5rIGxpbmUgYWhlYWQgb2Yg
dGhlIG1haW4gInJldHVybiIgb2YgYSBmdW5jdGlvbg0KPiA+IC0gcmVmYWN0b3IgY29tbWVudHMs
IGNvbW1pdCBtZXNzYWdlIGFuZCB0aXRsZQ0KPiA+IC0tLQ0KPiA+IHY1IC0+IHY2Og0KPiA+IC0g
cmVtb3ZlIGR1cGxpY2F0ZWQgbWFuaWZlc3QgY29uc3RhbnRzLCBhbmQganVzdCBtb3ZlIGl0IHRv
IHB1YmxpYw0KPiA+IGhlYWRlcg0KPiA+IC0gdXNlICJlbHNlIGlmIiB0byBhdm9pZCBjb25mdXNp
b24gdGhhdCBpdCBsb29rcyBhcyBpZiBib3RoIHBhdGhzDQo+ID4gY291bGQgYmUgdGFrZW4NCj4g
PiAtIGFkZCBjaGVjayBmb3IgbGVnaXRpbWF0ZSBwZXJmIHZhbHVlcw0KPiA+IC0gdXNlICJ1bmtu
b3duIiBpbnN0ZWFkIG9mICJub25lIg0KPiA+IC0gaW50cm9kdWNlICJDUFVGUkVRX1BPTElDWV9F
TkQiIGZvciBhcnJheSBvdmVycnVuIGNoZWNrIGluIHVzZXIgc3BhY2UNCj4gPiB0b29scw0KPiA+
ICsgICAgICAgICAoc2V0X2NwcGMtPm1heGltdW0gPiBkYXRhLT5jYXBzLmhpZ2hlc3RfcGVyZiB8
fA0KPiA+ICsgICAgICAgICAgc2V0X2NwcGMtPm1heGltdW0gPCBkYXRhLT5jYXBzLmxvd2VzdF9u
b25saW5lYXJfcGVyZikgKQ0KPiA+ICsgICAgICAgIHJldHVybiAtRUlOVkFMOw0KPiA+ICsgICAg
LyoNCj4gPiArICAgICAqIE1pbmltdW0gcGVyZm9ybWFuY2UgbWF5IGJlIHNldCB0byBhbnkgcGVy
Zm9ybWFuY2UgdmFsdWUgaW4gdGhlIHJhbmdlDQo+ID4gKyAgICAgKiBbTm9ubGluZWFyIExvd2Vz
dCBQZXJmb3JtYW5jZSwgSGlnaGVzdCBQZXJmb3JtYW5jZV0sIGluY2x1c2l2ZSBidXQgbXVzdA0K
PiA+ICsgICAgICogYmUgc2V0IHRvIGEgdmFsdWUgdGhhdCBpcyBsZXNzIHRoYW4gb3IgZXF1YWwg
dG8gTWF4aW11bSBQZXJmb3JtYW5jZS4NCj4gPiArICAgICAqLw0KPiA+ICsgICAgaWYgKCBzZXRf
Y3BwYy0+c2V0X3BhcmFtcyAmIFhFTl9TWVNDVExfQ1BQQ19TRVRfTUlOSU1VTSAmJg0KPiA+ICsg
ICAgICAgICAoc2V0X2NwcGMtPm1pbmltdW0gPCBkYXRhLT5jYXBzLmxvd2VzdF9ub25saW5lYXJf
cGVyZiB8fA0KPiA+ICsgICAgICAgICAgKHNldF9jcHBjLT5zZXRfcGFyYW1zICYgWEVOX1NZU0NU
TF9DUFBDX1NFVF9NQVhJTVVNICYmDQo+ID4gKyAgICAgICAgICAgc2V0X2NwcGMtPm1pbmltdW0g
PiBzZXRfY3BwYy0+bWF4aW11bSkgfHwNCj4gPiArICAgICAgICAgICghKHNldF9jcHBjLT5zZXRf
cGFyYW1zICYgWEVOX1NZU0NUTF9DUFBDX1NFVF9NQVhJTVVNKSAmJg0KPg0KPiBIbW0sIEkgZmlu
ZCB0aGlzIGNvbmZ1c2luZyB0byByZWFkLCBhbmQgd2FzIGZpcnN0IHRoaW5raW5nIHRoZSAhIHdh
cyB3cm9uZyBoZXJlLiBJbW8NCj4gc3VjaCBpcyBiZXR0ZXIgZXhwcmVzc2VkIHdpdGggdGhlIGNv
bmRpdGlvbmFsIG9wZXJhdG9yOg0KPg0KPg0KPiAgICAgICAgICAgc2V0X2NwcGMtPm1pbmltdW0g
PiAoc2V0X2NwcGMtPnNldF9wYXJhbXMgJg0KPiBYRU5fU1lTQ1RMX0NQUENfU0VUX01BWElNVU0N
Cj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgID8gc2V0X2NwcGMtPm1heGltdW0NCj4g
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIDogZGF0YS0+cmVxLm1heF9wZXJmKQ0KPg0K
DQpUaHgsIHVuZGVyc3Rvb2QhDQoNCj4gV2hpY2ggYWxzbyBtYWtlcyBpdCBlYXNpZXIgdG8gc3Bv
dCB0aGF0IGhlcmUgeW91IHVzZSBkYXRhLT5yZXEsIHdoZW4gaW4gdGhlDQo+IG1pbmltdW0gY2hl
Y2sgeW91IHVzZSBkYXRhLT5jYXBzLiBXaHkgdGhpcyBkaWZmZXJlbmNlPw0KPg0KDQogbWluaW11
bSBjaGVjayBoYXMgdHdvIGJvdW5kYXJ5IGNoZWNrLA0KbGVmdCBib3VuZGFyeSBjaGVjayBpcyBh
Z2FpbnN0IGRhdGEtPmNhcHMubG93ZXN0X25vbmxpbmVhcl9wZXJmLiBBbmQgcmlnaHQgYm91bmRh
cnkgY2hlY2sgaXMgYWdhaW5zdCBkYXRhLT5yZXEubWF4X3BlcmYuIEFzIGl0IHNoYWxsIG5vdCBv
bmx5IG5vdCBsYXJnZXIgdGhhbiBjYXBzLmhpZ2hlc3RfcGVyZiAsIGJ1dCBhbHNvIHJlcS5tYXhf
cGVyZi4gVGhlIHJlbGF0aW9uIGJldHdlZW4gbWF4X3BlcmYgYW5kIGhpZ2hlc3RfcGVyZiBpcyB2
YWxpZGF0ZWQgaW4gdGhlIG1heGltdW0gY2hlY2suIFNvIGhlcmUsIHdlIGFyZSBvbmx5IGNvbnNp
ZGVyaW5nIG1heF9wZXJmDQoNCj4gSmFuDQo=

