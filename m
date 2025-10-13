Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CC66BD2F11
	for <lists+xen-devel@lfdr.de>; Mon, 13 Oct 2025 14:18:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1142326.1476516 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v8HVD-0004Ee-I2; Mon, 13 Oct 2025 12:18:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1142326.1476516; Mon, 13 Oct 2025 12:18:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v8HVD-0004C6-F7; Mon, 13 Oct 2025 12:18:11 +0000
Received: by outflank-mailman (input) for mailman id 1142326;
 Mon, 13 Oct 2025 12:18:10 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=KIN4=4W=citrix.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1v8HVC-0004Bz-BQ
 for xen-devel@lists.xenproject.org; Mon, 13 Oct 2025 12:18:10 +0000
Received: from SN4PR0501CU005.outbound.protection.outlook.com
 (mail-southcentralusazlp170110003.outbound.protection.outlook.com
 [2a01:111:f403:c10d::3])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id aa09c4c3-a82e-11f0-980a-7dc792cee155;
 Mon, 13 Oct 2025 14:18:03 +0200 (CEST)
Received: from DM6PR03MB5227.namprd03.prod.outlook.com (2603:10b6:5:247::22)
 by CH0PR03MB6034.namprd03.prod.outlook.com (2603:10b6:610:bd::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9203.10; Mon, 13 Oct
 2025 12:17:59 +0000
Received: from DM6PR03MB5227.namprd03.prod.outlook.com
 ([fe80::c9a0:563d:c344:aec2]) by DM6PR03MB5227.namprd03.prod.outlook.com
 ([fe80::c9a0:563d:c344:aec2%5]) with mapi id 15.20.9203.009; Mon, 13 Oct 2025
 12:17:59 +0000
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
X-Inumbo-ID: aa09c4c3-a82e-11f0-980a-7dc792cee155
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=X+R2ZTZFEJPj8cZKvvUe8gDL3iZbTF/V/TYK1aSNE6RClKJ6+Z7j+We08JOzekaUb5SaIN6lGizRQ1Vugep4SC2xR1lPpNpgdPgnXSuFJayGZdzVw2cQzkL+BoT39TCodvcwQwumRCfzrEcNNEtE464GgxB5FfYb2daazjJV5hbSODg+5y7wp017ULlL3F/+6VzYRRH5xM3EPj0+dbaBQZwg6YHArvh7bHAPrylj9BP3YjJ/Zv1iMaGY4HlPSUyrVdD/9ZpMiKL0NtgaEf+8cZhlMUXZgpkW23cMx3fggyslFg/e2gmaGBGn5hkH+hXvD8GSbtEYR3jNIj/DE4Y4qA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VAieG4/Xjh5kpeI8cRoPY1l6WT4vJQBOu5HqLbP+wTA=;
 b=bjCWOU7FeKNnuZXNOxFViZ8VUGxh9rL5Ux33fh6jtp0RMtAR35KvBSbKJpa9Zk/SAd7FXe5fw+0RN9D8b2DZmIlef/bnfVB71ZZusZC6PG/F55/hKbKUYwrhmtCBgU7RcG1yTSJFLdJlWeS5kMri62LO0sVclAz23xWdVQTH//Jhy1Mr1XGpauoTKSYQORCgGfAtdRO9KKImRtkmnkD8OPK4GBk9ru7BtzsjpIPua/VEU8TkAXEMDQslUaydQX9ymLrqzgr9H/u6Q5bYSoSvcNO06XMqDZ0rfef/AhwWRuRpXYoYfQ69jI870oE8+iHl0CvMOLbaDkrzpluIWoRX2w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VAieG4/Xjh5kpeI8cRoPY1l6WT4vJQBOu5HqLbP+wTA=;
 b=l6N4dKNtXSSYUcqZ30eLTO6jZ2HFa0JkPxx+crIJnUUgxOW4xym6xZSaFNc7wiSB6J5B6OBuUJKALiFzrjVfemIpbM5+YDmvqtxmrSC4kYJYoNSNbcuIp8Cdt/AUKRs09XtMV0Cvgz6rpw4NgiSuls6z0bvGnpcAVrLxp18tTQc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Mon, 13 Oct 2025 14:17:54 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Grygorii Strashko <grygorii_strashko@epam.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Sergiy Kibrik <Sergiy_Kibrik@epam.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Paul Durrant <paul@xen.org>,
	Alejandro Vallejo <alejandro.garciavallejo@amd.com>
Subject: Re: [PATCH v5] x86: make Viridian support optional
Message-ID: <aOzt8gfxkdQXZ6O1@Mac.lan>
References: <20250930125215.1087214-1-grygorii_strashko@epam.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250930125215.1087214-1-grygorii_strashko@epam.com>
X-ClientProxiedBy: PA7P264CA0004.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:102:2d3::10) To DM6PR03MB5227.namprd03.prod.outlook.com
 (2603:10b6:5:247::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR03MB5227:EE_|CH0PR03MB6034:EE_
X-MS-Office365-Filtering-Correlation-Id: 79a6adf9-a359-4759-cf28-08de0a528c3c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?d1RKNjZ6Z2FUSWFPWkUzSkU5UnFGTzVQdElVa0hhVVNoNEFDQ2drWVQxWVNy?=
 =?utf-8?B?LzdwanRodGFQNTE4bno0WlQzc1dQNHMrRWRqOGRORnhFaUY2dFlLbHJVdUNk?=
 =?utf-8?B?bW5FZW1kVFZCaHpkUXo1Z1lOdTQ3UllhUnNQa0h0OTA0TS9CVHlmVUt1SEND?=
 =?utf-8?B?bmZJT3JkaDFTdGpBTzVSc0plelY2cE9BbFJidmpRRUhtQVQ3VTRDMGp1US8v?=
 =?utf-8?B?ajg4OFpQUExuTE1UVnJ0MWZYYTFvTXdFYUdacFlkUkFyMm5JNUQxZExWRWtX?=
 =?utf-8?B?ZS9iWWhWU3c1MmErOXRKYXJvZWJLbFVIcEZFMDBoSlpTWmI5NWVXTnJ2UUNT?=
 =?utf-8?B?V29IZnluNzFxaFRtRFRjc0wvekJkZUZUSStFZTcxT3czekEydHBqZEI0bHAr?=
 =?utf-8?B?eWh6N0NPb1l4TCtHWEl3b3hhMWxIMnQ2NHpQeFdLcW1qMXkzNHZhdXZSV2Zt?=
 =?utf-8?B?dkl4cEttaDNkSkhyenlRekVtTVJKVGRqajlkWU9ibjFMM3daQ0MvUUllYm1i?=
 =?utf-8?B?eGF5aCtXTVRPQ1kzOHozUm81MFFoR2l3eFpScjFNeHpFcjJBWUs4YWYwdmR3?=
 =?utf-8?B?R1A1dVkxWnZ2bUs2dE9abHo2TjBuaGYrMzgweEpVT05oS2FQYUh2c2s3aURT?=
 =?utf-8?B?WTNDQWFUMzJvZlVkbkZoK1ZkYnM3L0VtZm9TZllYbWlzajArM3lGSnRhNVM2?=
 =?utf-8?B?SW1QWDZlWm1Pd3RSOHdCUlRTd2wwekxESXgxSVliSEZ6N2FqbzFDc0ZMbStv?=
 =?utf-8?B?bW1SamdKTDJzZUZnc1oxV3pOT0YxZEgvRFJmMm1sYWM0eERpcFRmOU4wbjAy?=
 =?utf-8?B?TUg5Uzgvc3Zvd1hGNGpTM2lTZVJvQ040TUNSbE9nWmg5UHJ1MCt2Wlg2VVhx?=
 =?utf-8?B?Ymh4M2x0eVBQZVJZNDREM0ZMdnZjNGluMG93VG1mT3RhYXl3U0kzamM1SWdY?=
 =?utf-8?B?ZlRrcHJuUDg5aEoxOVcxSXJ5SjhGMEEvZElHZmpqLzQrVmNTaHBvVmZkV1N1?=
 =?utf-8?B?QzJIZkRDS3FpT3hsNCs5aEVYejZNT2F5UlIxVEk5NjVLWWhzcTdGQ3lrdW10?=
 =?utf-8?B?ZjdCSERRaDZENEpSa3JDekhJUzZQajJCc3pDOXRnZXBldlV2NWdHY1BtSFpt?=
 =?utf-8?B?RTVwRmNGdVhFdlFlRTdZSzVBRGNCbTJ6bm95M1VQcUZmRHlqYXoxREFJWEpG?=
 =?utf-8?B?MVhkYm5MSE5CMlpvM3pBTFhwYkF2bXpZUzBlM1crQURMN1pHR2FJeHlobzZH?=
 =?utf-8?B?OGNPQm50cndHQ3NFMzZ2SFZlcWRZNTFHTnhINk03SHJjZTRkYlVkaUJVT0hv?=
 =?utf-8?B?VFlidzhYTDdIN1NhY1o1WHZ2WjFoOVgwSm5icGNRcW1lR3QvQ29CZjl3TTFx?=
 =?utf-8?B?dndWUmNheUZsdnJHVzJ2YXJEb1hvMk8xcDJPSndHL1JDRVVkWE1QS1hMVVZu?=
 =?utf-8?B?bTdEcE5IejhkK1VkeWEzTEFxTlkxLytjTHFzd3pRNEpTQ0JwdmNnSCtKMSts?=
 =?utf-8?B?aDNzcnZEUk9ZYktCQ0ZYQkF3ZzBCSzgrdHJ4b05ZSENZR2FycXhiTGtnY3Vu?=
 =?utf-8?B?ZCtReUZHSzUwTFJOdjlERFBJVDM1dnErKzFVcXF4Sy9FRVJzKy9TNXJiODE4?=
 =?utf-8?B?eFBZeFdCbGpuTjNqbzJxakQyMC9KbmE0c2xjZEszZ2JBRE1GK2ZsamlqMjk4?=
 =?utf-8?B?bXR1WlpHamEvMDNydGlmQ3hxVlhFVU9PMVhrcDJvZk9ZNXdSekl2RXYwVVVm?=
 =?utf-8?B?L05MS2tya29KcWRZUU45eWpVMmFaMVgrTUNQVHBlQXkxcit6dlIxaW84QjZO?=
 =?utf-8?B?ajNaaXliV01zakhqWjVzQlNYK3oyZ01ZQ2ZlMkR1SE54UDk4ekxGcWc1RjdD?=
 =?utf-8?B?dWp6NGJtNnZKNHFMbkZHV2Q0ZUFOalVXcjdKdFVCYjNXUlE9PQ==?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR03MB5227.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZUg2dW9JSFR5aGcwWTFaMmhyVXVvV29LTzlaa3dYR05WOWFBSjhEc2M4M0ZL?=
 =?utf-8?B?YUNmSXRkMnduZVQva21oM0Nnb015OTQwMnhVOVVuYnZkbVQ4R3JBR05XREdD?=
 =?utf-8?B?WjZ5QzY1RTFMbzh4dldINlVWRUN0MFBpaTRtTzVxT1kvamFreHBET0YvSk93?=
 =?utf-8?B?OHM4NzhBMXNTeFFNRUlLRU9jSGdjWmQ0NHRLeE83ckdENDBKK3FtTUUvNXYr?=
 =?utf-8?B?NkRZSGd6QzUxbzdPbnczbWhrUE0wN1dseTBrRHp5MG44RjZMNFhDdzNoRVVx?=
 =?utf-8?B?WFRBMWdKek92MXVqZEFiZlRtcUFzb3luQURLMGJ2Z3V5WUprOWRhRWIrZTJ6?=
 =?utf-8?B?eVFOSHluTTBYL2NSMmdIakVTR2pFaS9aZGg0eGJGakJicjhENElXTXZXQnV1?=
 =?utf-8?B?dWFocVVXdEl4UWV1NjlHMDQ2OC93QmRtb1o1VkVWUENEYmxlOFllM1ZHLzZm?=
 =?utf-8?B?QlphTkZmNkJoODNVQmpiRFBtNkRtZTN5alYzdm8zeTV2VmRTaVExTEdyRE5l?=
 =?utf-8?B?UTNPQmZzbFE4UEp2UzFDWFlEMVkyZC9yQ21zU2hRWFkydTVBSC9kOHI3ZFlG?=
 =?utf-8?B?S3Rqd2JzRkdOZldVbkhvWGcrNWRuTVlvVEFMeDhNbmcxUitEaUVJdDBSbGNH?=
 =?utf-8?B?b0ZKbEd5Y0ZIeXFybDFZUXI3SUJTWUhXMG5EWjRpajlMYzM3TythWDJ5VEU4?=
 =?utf-8?B?MjA5NksyOGlFcHo1dG1BUXhHZHF6WGJNc1N0Njd3bEZHNkQ0R3BZMGZPbzYw?=
 =?utf-8?B?Y0RmcnhHQVd4VUVZZC9qS2VHcXJDSmplYzlvaENUajZQWmJ5VHcraDRMN29m?=
 =?utf-8?B?V1ZTWUN0dzVxRjdOS21PbTFKcGZrUDhDSUJjV3MrdWF0RlpReENlL24yTHky?=
 =?utf-8?B?SUtTelNDdzB1TWwrb21uYXlWa291SW9nTTJmald5T0ZKZmpSSllKaHRyakFj?=
 =?utf-8?B?aXo0S3NiWWdiWU1zSTlEQTJEcVZpUXExbmVacGFPenhNSSt4eHZOU1lnRUVn?=
 =?utf-8?B?OFdsQ2Z0MlJjY3BHM1RvRWJQczdZbjZNdWtxNkxLRE1HSlBQSkFWZmVCL21s?=
 =?utf-8?B?NmxmaFQ0SnRqUlNuQlBEZ1JKdGIxRVpWbVFiRS9va1RRWitKckRyOHFIQ3k4?=
 =?utf-8?B?SksvYUoyaGtEU1NJVm0ramVRQlcxdzZKU2NaK0NIeWNKTHNXYlppQXdibjlF?=
 =?utf-8?B?ZW12ejZ1Vms2YjhiblRpcGxGa1NkL1lpZHNWMnJRUjdjVEo1SHVJdlVHRXIx?=
 =?utf-8?B?bitReVRvMG5OQkk1elVwenVSTC9QQzg3OVlHcEpTbzZBcWVrZGRscEMvSlFs?=
 =?utf-8?B?ZG9VcnI1bEVFd0pQQmFvVG5jTkZRcUNqdzBPZ3AwWVZ6Nlk3MTdUa2FKQ2Qx?=
 =?utf-8?B?TlU5dEVJZEZFaFhNSHNhWHNOSVpuTHlGdkVlS1JhSnh5M01kZGVtMGlNS0VH?=
 =?utf-8?B?TmxwQWI1aTJJYTM1cGdvT0ZqeVJacjk4a01VYXFkWGloTnIvNldBUXhDc1hi?=
 =?utf-8?B?aElrcTR4SHhtS1F5QlAwOFFsKzJTNlBNNnJWYW5XTllkTktCQ1VJb2RxL0ZF?=
 =?utf-8?B?NHgwZUZwQ1BLUlhZeVlLSWZCUEJyUno4Q3RwVmdwUlJOVGJNWlZsSklZVWNu?=
 =?utf-8?B?OXVtUk5teUhzS1lJZExvcTVvczNqYmdYbmdxT0RPbnVzTmRpZFc0UlNaNWtU?=
 =?utf-8?B?NEJON1NOTE80c3RyelJTNzNHOHpPMWJOYVl4T0dzenNXOTB1RjhxMm9oQlpL?=
 =?utf-8?B?ZXVCUXlYWjZaR1NlczQ4SHVxeE1kYkh2c0pGRE5jZHNncVNMUThSUWxwN1Zj?=
 =?utf-8?B?QXFFQlhDSHRoamd6VWt3WExncG5BcHJJckNGWVgvZU1sQTU4M25PVEtxdHUz?=
 =?utf-8?B?RkxURG5jdFNKU3VDWUI4ZENZc0NyTUhqTVdKSnRhOFpEaThtMFhVVndJbERa?=
 =?utf-8?B?OXd4Z2wwcEw4ZGRpcDl2cjU0dkhYRzduaFNWRG1qNTM2NkxRcFVUelJEbzAv?=
 =?utf-8?B?VDZyYmFqakpwU2lSUWV5Mm5JMHNhZHZmMXpIM0VxM3orTmRKcGRXVHRLRkUy?=
 =?utf-8?B?QnJFdmZZdXdpMko3ZEZyOE9jMVVtT2hsaEY5YlgvWkNDSnJNeTMyUUxrT2R4?=
 =?utf-8?Q?W3MeolGF+k3/bUC0BtMkrBUW3?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 79a6adf9-a359-4759-cf28-08de0a528c3c
X-MS-Exchange-CrossTenant-AuthSource: DM6PR03MB5227.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Oct 2025 12:17:59.2506
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jK5XfpLhyc2hwGy7nzjAolMaYTiZpHPV1pLO+PqY2Qhb8nFcrV2mV5Rpdi6oYUUHzlkMoezq6JtTyu4YZkdM0w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR03MB6034

On Tue, Sep 30, 2025 at 12:52:16PM +0000, Grygorii Strashko wrote:
> From: Sergiy Kibrik <Sergiy_Kibrik@epam.com>
> 
> Add config option VIRIDIAN that covers viridian code within HVM.
> Calls to viridian functions guarded by is_viridian_domain() and related macros.
> Having this option may be beneficial by reducing code footprint for systems
> that are not using Hyper-V.
> 
> [grygorii_strashko@epam.com: fixed NULL pointer deref in
> viridian_save_domain_ctxt()]
> Signed-off-by: Sergiy Kibrik <Sergiy_Kibrik@epam.com>
> Signed-off-by: Grygorii Strashko <grygorii_strashko@epam.com>
> ---
> changes in v5:
> - drop "depends on AMD_SVM || INTEL_VMX"
> - return -EILSEQ from viridian_load_x() if !VIRIDIAN
> 
> changes in v4:
> - s/HVM_VIRIDIAN/VIRIDIAN
> - add "depends on AMD_SVM || INTEL_VMX"
> - add guard !is_viridian_vcpu() checks in viridian_load_vcpu_ctxt/viridian_load_domain_ctxt
> 
> changes in v3:
> - fixed NULL pointer deref in viridian_save_domain_ctxt() reported for v2,
>   which caused v2 revert by commit 1fffcf10cd71 ("Revert "x86: make Viridian
>   support optional"")
> 
> v4: https://patchwork.kernel.org/project/xen-devel/patch/20250919163139.2821531-1-grygorii_strashko@epam.com/
> v3: https://patchwork.kernel.org/project/xen-devel/patch/20250916134114.2214104-1-grygorii_strashko@epam.com/
> v2: https://patchwork.kernel.org/project/xen-devel/patch/20250321092633.3982645-1-Sergiy_Kibrik@epam.com/
> 
>  xen/arch/x86/hvm/Kconfig              | 10 ++++++++++
>  xen/arch/x86/hvm/Makefile             |  2 +-
>  xen/arch/x86/hvm/hvm.c                | 27 ++++++++++++++++++---------
>  xen/arch/x86/hvm/viridian/viridian.c  | 14 ++++++++++----
>  xen/arch/x86/hvm/vlapic.c             | 11 +++++++----
>  xen/arch/x86/include/asm/hvm/domain.h |  2 ++
>  xen/arch/x86/include/asm/hvm/hvm.h    |  3 ++-
>  xen/arch/x86/include/asm/hvm/vcpu.h   |  2 ++
>  8 files changed, 52 insertions(+), 19 deletions(-)
> 
> diff --git a/xen/arch/x86/hvm/Kconfig b/xen/arch/x86/hvm/Kconfig
> index 5cb9f2904255..928bb5662b89 100644
> --- a/xen/arch/x86/hvm/Kconfig
> +++ b/xen/arch/x86/hvm/Kconfig
> @@ -62,6 +62,16 @@ config ALTP2M
>  
>  	  If unsure, stay with defaults.
>  
> +config VIRIDIAN
> +	bool "Hyper-V enlightenments for guests" if EXPERT
> +	default y
> +	help
> +	  Support optimizations for Hyper-V guests such as faster hypercalls,
> +	  efficient timer and interrupt handling, and enhanced paravirtualized
> +	  I/O. This is to improve performance and compatibility of Windows VMs.

I would leave "paravirtualized I/O" out of the text, as the hypervisor
Viridian extensions don't provide anything related to I/O.  AFAICT
that would be the vmbus stuff, which I'm not sure is supported when
running as a Xen guest, and would require QEMU to emulate such
interfaces?  IOW: the paravirtualized I/O part is out-of-scope for an
hypervisor-only related config option:

	  Support optimizations for Hyper-V guests such as hypercalls,
	  efficient timers and interrupt handling. This is to improve
	  performance and compatibility of Windows VMs.

Nit: I would also drop the "faster" prefix for hypercalls.  Without
this option enabled there are no Hyper-V hypercalls available,
neither fast nor slow.


> +
> +	  If unsure, say Y.
> +
>  config MEM_PAGING
>  	bool "Xen memory paging support (UNSUPPORTED)" if UNSUPPORTED
>  	depends on VM_EVENT
> diff --git a/xen/arch/x86/hvm/Makefile b/xen/arch/x86/hvm/Makefile
> index 6ec2c8f2db56..736eb3f966e9 100644
> --- a/xen/arch/x86/hvm/Makefile
> +++ b/xen/arch/x86/hvm/Makefile
> @@ -1,6 +1,6 @@
>  obj-$(CONFIG_AMD_SVM) += svm/
>  obj-$(CONFIG_INTEL_VMX) += vmx/
> -obj-y += viridian/
> +obj-$(CONFIG_VIRIDIAN) += viridian/
>  
>  obj-y += asid.o
>  obj-y += dm.o
> diff --git a/xen/arch/x86/hvm/hvm.c b/xen/arch/x86/hvm/hvm.c
> index 23bd7f078a1d..95a80369b9b8 100644
> --- a/xen/arch/x86/hvm/hvm.c
> +++ b/xen/arch/x86/hvm/hvm.c
> @@ -701,9 +701,12 @@ int hvm_domain_initialise(struct domain *d,
>      if ( hvm_tsc_scaling_supported )
>          d->arch.hvm.tsc_scaling_ratio = hvm_default_tsc_scaling_ratio;
>  
> -    rc = viridian_domain_init(d);
> -    if ( rc )
> -        goto fail2;
> +    if ( is_viridian_domain(d) )
> +    {
> +        rc = viridian_domain_init(d);
> +        if ( rc )
> +            goto fail2;
> +    }

Are you sure this works as expected?

The viridian_feature_mask() check is implemented using an HVM param,
and hence can only be possibly set after the domain object is created.
AFAICT is_viridian_domain(d) will unconditionally return false when
called from domain_create() context, because the HVM params cannot
possibly be set ahead of the domain being created.

If you want to do anything like this you will possibly need to
introduce a new flag to XEN_DOMCTL_createdomain to signal whether the
domain has Viridian extensions are enabled or not, so that it's know
in the context where domain_create() gets called.

Given that HyperV is available on arm64 also it should be a global
flag, as opposed to a per-arch one in xen_arch_domainconfig IMO.

>  
>      rc = alternative_call(hvm_funcs.domain_initialise, d);
>      if ( rc != 0 )
> @@ -739,7 +742,8 @@ void hvm_domain_relinquish_resources(struct domain *d)
>      if ( hvm_funcs.nhvm_domain_relinquish_resources )
>          alternative_vcall(hvm_funcs.nhvm_domain_relinquish_resources, d);
>  
> -    viridian_domain_deinit(d);
> +    if ( is_viridian_domain(d) )
> +        viridian_domain_deinit(d);
>  
>      ioreq_server_destroy_all(d);
>  
> @@ -1643,9 +1647,12 @@ int hvm_vcpu_initialise(struct vcpu *v)
>           && (rc = nestedhvm_vcpu_initialise(v)) < 0 ) /* teardown: nestedhvm_vcpu_destroy */
>          goto fail5;
>  
> -    rc = viridian_vcpu_init(v);
> -    if ( rc )
> -        goto fail6;
> +    if ( is_viridian_domain(d) )
> +    {
> +        rc = viridian_vcpu_init(v);
> +        if ( rc )
> +            goto fail6;
> +    }
>  
>      rc = ioreq_server_add_vcpu_all(d, v);
>      if ( rc != 0 )
> @@ -1675,13 +1682,15 @@ int hvm_vcpu_initialise(struct vcpu *v)
>   fail2:
>      hvm_vcpu_cacheattr_destroy(v);
>   fail1:
> -    viridian_vcpu_deinit(v);
> +    if ( is_viridian_domain(d) )
> +        viridian_vcpu_deinit(v);
>      return rc;
>  }
>  
>  void hvm_vcpu_destroy(struct vcpu *v)
>  {
> -    viridian_vcpu_deinit(v);
> +    if ( is_viridian_domain(v->domain) )
> +        viridian_vcpu_deinit(v);
>  
>      ioreq_server_remove_vcpu_all(v->domain, v);
>  
> diff --git a/xen/arch/x86/hvm/viridian/viridian.c b/xen/arch/x86/hvm/viridian/viridian.c
> index c0be24bd2210..1212cc418728 100644
> --- a/xen/arch/x86/hvm/viridian/viridian.c
> +++ b/xen/arch/x86/hvm/viridian/viridian.c
> @@ -1116,14 +1116,14 @@ static int cf_check viridian_save_domain_ctxt(
>  {
>      const struct domain *d = v->domain;
>      const struct viridian_domain *vd = d->arch.hvm.viridian;
> -    struct hvm_viridian_domain_context ctxt = {
> -        .hypercall_gpa = vd->hypercall_gpa.raw,
> -        .guest_os_id = vd->guest_os_id.raw,
> -    };
> +    struct hvm_viridian_domain_context ctxt = {};
>  
>      if ( !is_viridian_domain(d) )
>          return 0;
>  
> +    ctxt.hypercall_gpa = vd->hypercall_gpa.raw;
> +    ctxt.guest_os_id = vd->guest_os_id.raw,
> +
>      viridian_time_save_domain_ctxt(d, &ctxt);
>      viridian_synic_save_domain_ctxt(d, &ctxt);
>  
> @@ -1136,6 +1136,9 @@ static int cf_check viridian_load_domain_ctxt(
>      struct viridian_domain *vd = d->arch.hvm.viridian;
>      struct hvm_viridian_domain_context ctxt;
>  
> +    if ( !is_viridian_domain(d) )
> +        return -EILSEQ;
> +
>      if ( hvm_load_entry_zeroextend(VIRIDIAN_DOMAIN, h, &ctxt) != 0 )
>          return -EINVAL;
>  
> @@ -1172,6 +1175,9 @@ static int cf_check viridian_load_vcpu_ctxt(
>      struct vcpu *v;
>      struct hvm_viridian_vcpu_context ctxt;
>  
> +    if ( !is_viridian_domain(d) )
> +        return -EILSEQ;

Nit: we usually use EILSEQ for unreachable conditions, but here it's a
toolstack controlled input.  Maybe we could instead use ENODEV here?

As it's not really an illegal restore stream, but the selected guest
configuration doesn't match what's then loaded.

Thanks, Roger.

