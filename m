Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A3C35A7E085
	for <lists+xen-devel@lfdr.de>; Mon,  7 Apr 2025 16:08:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.940194.1340047 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u1n8o-0000b5-Me; Mon, 07 Apr 2025 14:07:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 940194.1340047; Mon, 07 Apr 2025 14:07:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u1n8o-0000ZX-Ie; Mon, 07 Apr 2025 14:07:58 +0000
Received: by outflank-mailman (input) for mailman id 940194;
 Mon, 07 Apr 2025 14:07:57 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=xyMQ=WZ=amd.com=ayan.kumar.halder@srs-se1.protection.inumbo.net>)
 id 1u1n8n-0000ZQ-7E
 for xen-devel@lists.xenproject.org; Mon, 07 Apr 2025 14:07:57 +0000
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on20623.outbound.protection.outlook.com
 [2a01:111:f403:2418::623])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ae1c3b51-13b9-11f0-9ffb-bf95429c2676;
 Mon, 07 Apr 2025 16:07:47 +0200 (CEST)
Received: from PH8PR12MB7326.namprd12.prod.outlook.com (2603:10b6:510:216::7)
 by DS4PR12MB9658.namprd12.prod.outlook.com (2603:10b6:8:280::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8606.34; Mon, 7 Apr
 2025 14:07:43 +0000
Received: from PH8PR12MB7326.namprd12.prod.outlook.com
 ([fe80::6d76:9c33:d230:8264]) by PH8PR12MB7326.namprd12.prod.outlook.com
 ([fe80::6d76:9c33:d230:8264%5]) with mapi id 15.20.8534.045; Mon, 7 Apr 2025
 14:07:43 +0000
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
X-Inumbo-ID: ae1c3b51-13b9-11f0-9ffb-bf95429c2676
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ly9wwJBc0GmW1dR9ZbBVr0RooX9HYL2DhjWvs9MARYQV06NqkCZIiY1V6I5Op9Pjr5/P6Ef2dvcG4GEnwGGJU3/+Nt6hNnvTEDdIBsQfAZVAGfWQwzbFi7wodMCJ43/MzJss7lHXOv/jv6d+ihrtAA+e94YktYTaL1UvYqI7DHU9OvqV2oGel7/kJjCc7Eo5TPJ/+26oOJ0plD35pURR7SrwKX8x6AlhA6UEzKGnEZqHs9kVw0j0KJd3iqx98WA2tUzgjj7kpUKhlx+41sFTU+h2w8c8GpDro9HqCV4K9awF6/b3gjSJwhOPMSAcuKN4ua2h3Ydmh1CSNDQJlgwrZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pJtNDAXxMGk19V9Jad22uspR6AzaHK6S4wYHXiJ0EDk=;
 b=tNCEjf0sygohjBupV+dMl0Kk554L5USD9qOBgdOImSZp3JVg6f2C8GpVEciNcjoJPLF9SpW4HEuzxbi2V2+Bg2iosLilCuWpevv6xGXhaNxBBkt4PrY1X6jqfvxXp+liGMWbTDE5HVwrjhp3w/OQymz0jjSh2EYznSZqkQCPT6T10aDKrNU63T8L7CsdO15oy+ha21OWXiVLh4oZ5btU7e4Zo3zJEampl2x3qSKJmy4QTopLnbHiyMzCrdfEU5GiaThcJsVuKta2t6DlcW3djvJKaoqse1wL1dvv6rkKeZ7E69uz/3+AXuboU4X8rqGnk2qUMjmK52DCP6ysNbcu/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pJtNDAXxMGk19V9Jad22uspR6AzaHK6S4wYHXiJ0EDk=;
 b=NGKhkx/E1kzEEHGUoxuRRmkemfAvpbubbTKJk5hga3OuQzSHAWFB7pL401D+UDyOiIptGkXiKdCZrWTeRzkBOrzrgozza5U9W5ptJaVPykPV2U0YBlON7T/bxPVX0/dRAcsvqJb9Li5UQZJrxnTOovxv2Q8EHxveB/iotPs6/sg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Message-ID: <4a88cea0-83bc-40ab-bd95-4acd2ce4ede5@amd.com>
Date: Mon, 7 Apr 2025 15:07:39 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/3] xen/arm: Move some of the functions to common file
Content-Language: en-GB
To: Luca Fancellu <Luca.Fancellu@arm.com>
Cc: "Orzel, Michal" <michal.orzel@amd.com>,
 Ayan Kumar Halder <ayan.kumar.halder@amd.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Bertrand Marquis <Bertrand.Marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20250403171241.975377-1-ayan.kumar.halder@amd.com>
 <20250403171241.975377-2-ayan.kumar.halder@amd.com>
 <45d47205-409c-492a-9841-3b162c05ec09@amd.com>
 <0ed34b41-0cf8-4bab-9304-d6c3f2ec276d@amd.com>
 <8C708752-ADB1-4904-ACCF-FDDAD965FAE3@arm.com>
From: Ayan Kumar Halder <ayankuma@amd.com>
In-Reply-To: <8C708752-ADB1-4904-ACCF-FDDAD965FAE3@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO6P265CA0010.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:339::7) To PH8PR12MB7326.namprd12.prod.outlook.com
 (2603:10b6:510:216::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR12MB7326:EE_|DS4PR12MB9658:EE_
X-MS-Office365-Filtering-Correlation-Id: c5a375e3-ca8d-4867-950f-08dd75dd9095
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?a3BITlFodldXUERGSmdkSFZqb1cxTFpxS3NxcnMvdGthcnZxcnp0WHJMM2VH?=
 =?utf-8?B?TjBZV0IrWGk5RTVwbXVZUjBUWFNRN21BanZJSkFmQ0hiNVdzekN3V01zT3Bt?=
 =?utf-8?B?aDdPcVE4cFBwbWhJdWljcVdLTDVzNE5oTUNUVG1UYXZMZDRaUFE3eHlaQ3Fu?=
 =?utf-8?B?d1lwK3NuL2h6T0RJczRHSUVZVTh4Ly90KzZRL1dVR094U2FaMXJoeHhTdHBa?=
 =?utf-8?B?Tk9MYU00TkJXT2xGUTlLWDFkZytiZzQwbEdGeTZwYUZvTWovdTBkNW1kdmE4?=
 =?utf-8?B?QlI5TEwxdFdHOTNiS0RGWEpUU0xUU0Jvbk03RHdHWlpLMWFhZFc0VlBCK2dN?=
 =?utf-8?B?bmtldHFuYjZXd2pIQS9OKzZkeW5GY1U1YjFzazdBbmhEYmdveGZBUUtxSi9F?=
 =?utf-8?B?NWpQOC9lM1BMVHhkZnk0WWMrZmEzUDVhQjVVblUxRWtjdnVZRkoyb1B0WHZu?=
 =?utf-8?B?YldRbDVRbzZwR0kyMU9rMkpiQ0VVZ1RKb1hvNHRPazVEeWZ5MTh4bEJjbjVo?=
 =?utf-8?B?OHh2U1I5bVV1ejluaHROMUxDcDdtSWtHQ3NxWE5FQ1lhd01ueTV6MWJFUmRP?=
 =?utf-8?B?VGhsbW4yakt6VGYwTlgzbjExOUwvMjZZSXR3NGh6QnYyUUF3T1FaeEZRM3Ir?=
 =?utf-8?B?elpVVFNhYkl2UGlWZE9RYU1tQUxuQW9HSWZORkZrQm9rWnFNWWFjVExZcnYx?=
 =?utf-8?B?UDVLTHNTRDg0OUhXMUV6QS9ySUhDSDFOZk0vNEl0YmpVOEZCM1lZcW1yOE1H?=
 =?utf-8?B?MXZEUFZ5dEJaS3RMaHc0TmNEeHQ2U3daVWVpdmNZcHNnYjFTVHVxZEZZSkxY?=
 =?utf-8?B?aWxCeTVoTUJmc2U1c3U2VnorZXZiZTNtdmZpR2RscUxZNFNYNjR2YnRWUjk3?=
 =?utf-8?B?am5QS29yZkJvRnBQU1N2R3I5U0xzOFZJL3FzdWJNOEN4MGNWYkJjU0YyUFVH?=
 =?utf-8?B?eGFpVGRIeVNkQXo2d3dNemZIVmpjQlZlKys5dE41MURFQmZMQ0NnaHgzdVd3?=
 =?utf-8?B?NGFrclRmdmlxbmVSQ3A2bTBXeEp6MXNVZGNoVmRicFB4cTVzeVp4RitETlNR?=
 =?utf-8?B?aytQMlgrN3pMQ1BNdnZweERGZ3hlVlBZaFBGTU5jZm9kLzFwYkNjbXFML29S?=
 =?utf-8?B?eGt2V0JNYUc0OVRZYjNJUHIzbG9ySjJsNFRsOUVyUjZibFdBSldsK1l2VDNO?=
 =?utf-8?B?QmhhY2wyckNjQlBMYjdJTEhxMkkydnBqU0R4aldKOHREWWNlNEFJWEdiT1pW?=
 =?utf-8?B?V0c3QTJpcFMycW5INEk0L0g5dVIrR0RxbTFnQlFZN1ZnN0JDYWErQUNsL1Iv?=
 =?utf-8?B?dlNDZFY0NEFoTzBBQklORWl0OTFicjlyTFVOY0svVFVKd0Y0bGF2a2M0b09R?=
 =?utf-8?B?RFZlN2FBbVNocUsxTkw1cEREbDVFRUJsb3NpT3BwVWlGaEx3bFpqMlNQanpF?=
 =?utf-8?B?bVdGbEZXQ3UyVGNVMVFqQ2h5SDlEZThXRFRkQW5Ua09hMVBzaENjaVhQcWVp?=
 =?utf-8?B?VFVMNUprbFZwbVRFb2xHUE5vd1J0OGM0Z0lIVkRjNjdBM0hnZXFjOFBiNE1F?=
 =?utf-8?B?aURLRWpTclBQdXRtQW94anJFdXRMQU9DNzBOSTFTdjFtd0V1WU16VjRicGR0?=
 =?utf-8?B?NFd3TmhkZzFEVk5idkRUak8xRG50SXg0bWRvOVpJNmF5d3FkV0gwNnpiMW9j?=
 =?utf-8?B?ZEQxaW9YNjY2TjJwUGVON2c3RFN0Uk16L2g2UENUMjBnUTg1TzQrVnBCVUpS?=
 =?utf-8?B?cnZHcGx4emQrNlZBaXdycFJ0U2crOS9pYjRtYjN2aEpveVlFZlljNEIreWZN?=
 =?utf-8?B?bkFXRElPZXk1R25KM1JjWFV0cDd2enVwTjl0VkwzM2k1SXI5bzFqc2EwNmRt?=
 =?utf-8?Q?U7ubnugCKhn0J?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR12MB7326.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?R1BydWhXcFZFd3V2RHlCdXJqb0lGT1pBcXdzVTZ1MnFPZXgydHBuK3JlcjZI?=
 =?utf-8?B?WFhDQ1Jkb0xaek80dGxVMnhUMUw1d0pTVmkwQlFVdjRhaFMrWTZwS3Y1QnRO?=
 =?utf-8?B?VUlpZHhrKytXb3ZVNVphemNYTHpZRDJGY1UwclpIWkNhanFzUTUyeFlQTnhl?=
 =?utf-8?B?S1h4R0didHRrd0xjdWdLQzRGdHhrc2xGNlZkRVhVUDFpWENlbVFIYUdZRDNt?=
 =?utf-8?B?SjJET2ZvRTNPTnVhUmpTTlphcEJLLzR0VnJLVmZibXBPRFNJempqR3pwTElh?=
 =?utf-8?B?dGQrQTMxSlU1Y1FFVkdUS0VKc0VJZTMrTWpTSk96UWRaR0Rob1RVUU1wRy90?=
 =?utf-8?B?WnI0Y28xYmF0S0JoU1h2dFZJcTJRTmdVQ0RtWFp2UFJBOWlIQ0xPSnNDbXdZ?=
 =?utf-8?B?R0NHMHJlSkFWNFgyMlc4VmFLM3VUYWRZemt2YUVBWUF1MVcrNmdyS2FKQjhX?=
 =?utf-8?B?SUtRWllvOUl2bGQwSGh4SHBzTSs4cnhCQVFLN0dqdE9iRnZBWXFXMHFWelVQ?=
 =?utf-8?B?djR1dXpEMEhubHIzbVl6VHlBZ1loc0NVZEN6eUE5MXpTRUoxZDlHWmF5d0Vl?=
 =?utf-8?B?ZHpMZ3JYMHZNdFNNQXR3NnV0dEpKUFg0UG5xS1FrYVY5ZDkxWVpXUDlWdmQ4?=
 =?utf-8?B?U29OSHhrdk1Vb2NERWNZbFc4ajJrb3Fkbkt4VmI3ZmZPNklLMWJteVZJZHRP?=
 =?utf-8?B?MjcrRXJ1bFRjeUNGUDdwZ2Rpd2VjWkxWRCswdFgwWVJHV2p2Nk1HOGZ4VUNJ?=
 =?utf-8?B?QmZVOVg1S05HaFRyNEJkYURKZXlaT3ZuaVR3dE42WEM2eUsxc2t0U082cjdS?=
 =?utf-8?B?cHBwa3o1ci82b3RZeWcrZVJUYlhnV0FSLzFGVzFySFBsdEw5Tk1PS2Qvb0xR?=
 =?utf-8?B?Vkl0c05mVzFCR3VacHptNk5VV1VoenBxWVVFbldXRENpTFZmS1Mvb3ZDMjdX?=
 =?utf-8?B?aCtUZzFzSUlwcXIrYm9sbHBVZS84dUwrTmRQUlVqSERBNW1nS1hFdUJWeEZy?=
 =?utf-8?B?cFhsUXVXK3lhWTNFVCtiNEkzRmlrMnZPOTRtR0I4RHBkaEFxMVluTmovNnhy?=
 =?utf-8?B?aW8vY3lveEhtWHAxbEFJY2ZoQjJqNHNIY3FaSVNYb1dxZW1MaFB1SzJXVkJ0?=
 =?utf-8?B?bkFZL2V2bE1DMHBieTFDREZ3aEs5aVF3RE1WZXNod3NocFpTS0Z6dGJTcGNZ?=
 =?utf-8?B?TEp6M1FtSG9xelYwWWVEckE3QTRjZmdkRXhQWWxmM2Z5NlN5T25iNWkwYVZT?=
 =?utf-8?B?QUFuSHdBZ05wUVFiT0sxWjFCWTN6ejJ4WXV3d3RhSFJzWnB2WWZkcnJNWUM2?=
 =?utf-8?B?ZkVhYVlVVzFiL0g1dlNBWnFDeCtwdktZb3JoNEVSWFF2anpWeVZMRjNCUlFx?=
 =?utf-8?B?K3NvbWRzdDJmL0N0blR1bHQzSkM2SHFTNXRETUYyeHIxcHZkUDlabWN4Q2pP?=
 =?utf-8?B?dEhBWFQ0Q25GRmlKMTRVQjVsdlkvbGc4Ky9GV3lHOXc5OFZwamw3cWRNV0NY?=
 =?utf-8?B?Vlo3MUFhZTEwNUNzeFY0SE4xMWN5akJrdkhqSHM4azdTYklQeS9acUhObEJM?=
 =?utf-8?B?WXE0TkFRS3l2aWZvNlhYckt1WHM2T0FWZUR1NEE5YlQrbENPdzF0TEh3V1BO?=
 =?utf-8?B?b0U5ZnZkcGZ6MjhQczNzaUdaSnk3UUtuOW1WV2h1MEdKZU13ejZWc0J2a3JN?=
 =?utf-8?B?NmxoN3Q4UFlpR3gvMFduQkRpZGx5Z0FMa0VWUXBEUS9Nd3Z5R1hKekRJWmx0?=
 =?utf-8?B?UFpoZzcrdlUrbmt2WjZSemdMVVV4N0JScDhQZ0crSWh6NGY0Yjd0MFdhODNl?=
 =?utf-8?B?SHZ0dHU0alZDRkNFTUhMV29RV3N0Y2dJS2NMQUt5YWl4OXRGYmdlanhqdGFR?=
 =?utf-8?B?M1dRdDJvWERuS3RoT25BbzBMSWxXVDBYSGNSNk9oWFV5Z0MvbytlTjhITDZv?=
 =?utf-8?B?NW5seklJLzVlZzNDOEtCOUttWWVZNDc0SzRKYnJlQ2ZGK3h0K3lRQU9FbzU0?=
 =?utf-8?B?VVFobUpHM0NQMjc0ejkzWGk0MzRNT1B4bUJKTURySTV2bkN0emgyd3BQd21Z?=
 =?utf-8?B?RkNZc2F3UVpGVHV3enBDMHJhZVFXbWV4UFlHMGVCcExCTHB0bXgxYS9EVG02?=
 =?utf-8?Q?r+CLZ4bw2znPWsLyobsNbyj9i?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c5a375e3-ca8d-4867-950f-08dd75dd9095
X-MS-Exchange-CrossTenant-AuthSource: PH8PR12MB7326.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Apr 2025 14:07:43.2765
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0bJRsUwPdOxYJgTmF6WJs8q6ktctusIAry0V4wzeVChrPm7Aa4pkzJHVlSj3Gij3Nx04HIQjb0x2keU1g08inQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PR12MB9658


On 07/04/2025 14:31, Luca Fancellu wrote:
> Hi Ayan,
Hi,
>
>> On 7 Apr 2025, at 14:18, Ayan Kumar Halder <ayankuma@amd.com> wrote:
>>
>> Hi Michal,
>>
>> On 07/04/2025 10:04, Orzel, Michal wrote:
>>> On 03/04/2025 19:12, Ayan Kumar Halder wrote:
>>>> Added a new file prepare_xen_region.inc to hold the common earlyboot MPU regions
>>>> configurations across arm64 and arm32.
>>>>
>>>> prepare_xen_region, fail_insufficient_regions() will be used by both arm32 and
>>>> arm64. Thus, they have been moved to prepare_xen_region.inc.
>>>>
>>>> enable_secondary_cpu_mm() is a stub which is moved to prepare_xen_region.inc as
>>>> SMP is currently not supported for MPU.
>>> This does not sound right. If you want a place to keep some common MPU stuff
>>> between Arm64 and Arm32, you need to come up with better name for a file. SMP
>>> has nothing to do here with preparing regions so it feels odd to have
>>> enable_secondary_cpu_mm stub there.
>> Can I rename prepare-xen-region.inc to mpu.inc ?
>>
>> Julien/Luca - any thoughts ?
> I would say we leave the SMP stuff out from the common file, at some point we could start working on the
> SMP support and maybe there would be difference between arm64 and arm32.
Do you want to duplicate enable_secondary_cpu_mm() in arm32 and arm64 ? 
I am fine with that.
>
> what about common-cpu.inc?

Sounds ok.

Michal or Julien should comment as well.

- Ayan

>
>>> Also, new files should use dashes '-' and not underscores '_'.
>> Ack
>>
>> - Ayan
>>
>>> ~Michal
>>>
> Cheers,
> Luca
>

