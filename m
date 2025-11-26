Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 65283C8A44D
	for <lists+xen-devel@lfdr.de>; Wed, 26 Nov 2025 15:17:45 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1172925.1498031 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vOGKh-0003zG-Jy; Wed, 26 Nov 2025 14:17:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1172925.1498031; Wed, 26 Nov 2025 14:17:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vOGKh-0003wS-HD; Wed, 26 Nov 2025 14:17:23 +0000
Received: by outflank-mailman (input) for mailman id 1172925;
 Wed, 26 Nov 2025 14:17:22 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=fSqE=6C=citrix.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1vOGKg-0003wK-8o
 for xen-devel@lists.xenproject.org; Wed, 26 Nov 2025 14:17:22 +0000
Received: from SN4PR2101CU001.outbound.protection.outlook.com
 (mail-southcentralusazlp170120001.outbound.protection.outlook.com
 [2a01:111:f403:c10d::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9c26f077-cad2-11f0-980a-7dc792cee155;
 Wed, 26 Nov 2025 15:17:17 +0100 (CET)
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by CO1PR03MB5889.namprd03.prod.outlook.com (2603:10b6:303:6c::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.11; Wed, 26 Nov
 2025 14:17:12 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::b334:94c2:4965:89b8]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::b334:94c2:4965:89b8%5]) with mapi id 15.20.9366.012; Wed, 26 Nov 2025
 14:17:05 +0000
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
X-Inumbo-ID: 9c26f077-cad2-11f0-980a-7dc792cee155
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=P6FvVtPnCD0e82nilnm1yq7uUdtT3mb6rkjYsTtXIjbBwMlBs3Ky8LRmik9bzlD3WvpSkmONPIxsJo0/IDGgYE7eB/KPt0TAexBrUWzFweXTLbsEgOpWsoeiH35YC4wvQ8pC6xqh2wID/L2jwhrRIXlKkqJOc4Zf2j26VMhsIDCGK89D0Wzy6BEZ/77E98ucpWYAlJAm24lY669R0IO8GkPNKVPqTm/wfJPuDv6rVhSg+Pi3Ews4Sua1miXkeA87euNkOggy05l5yJslEoy0UXuDT0OOKcpgMeZiEkIRpVq74+lKdoWHpt9vYWT80eF3t/xYujFhxHxsh4BB8h7vag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MPjEHo0+iKEOOjqbZ3qrrvW/GyACnB49peB6V6Ghifw=;
 b=rQ3jSej12L4LtaL+I3m1KZql4VapBtZkhf72th6XtyrvQ2UY0McaQKmkOoCSJ3u/HNsMAbgXWr/E8/qTQgrFIekr+rDVBEorVs2mVzn7XVAYqtgwUQyZrcMsYidL+HOz9UafO3cLL895xnTSO5Rj56WZmFgpl0fnF5X9tpeHAfkyj4NmfHvZK7UjXHE1SF7MsxRtjxhGAS1aCC2AHfC+CiEesF/nEJNEupWTGhMZ1svKxA7DQclyVmio8nl0+99MbhuE+2kfR24hmKqAECC0ndhU6xq56/wXlrQKaiIk1LRJfQTCW/3EyYdVr6fYYO6Z2Eg8tyM7J0kYb2GC2bgSbg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MPjEHo0+iKEOOjqbZ3qrrvW/GyACnB49peB6V6Ghifw=;
 b=Pel3tRW5nZuWx3dvSsiPMXo28TKVTsa5kj6oX0StOTy2RAy/ju7jFflokzRvO7LOQzVNb3u3SO9TJHOkDa9mYui/0JcwbAUDDFKaS2yRaUuj6qRIiQ8xfkY7Pz5UejDf5rBxyoXnI5rzMI4yxGDgAXHKXIpfQGdGae3sLVodyrk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <ca6d6c10-f757-4abc-9884-ca283a0a9197@citrix.com>
Date: Wed, 26 Nov 2025 14:17:02 +0000
User-Agent: Mozilla Thunderbird
Cc: andrew.cooper3@citrix.com, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH 1/2] x86: move arch_generic_hweightl() to arch-specific
 library
To: Jan Beulich <jbeulich@suse.com>
References: <245fbc16-924b-4fd9-8cbc-a539b569edac@suse.com>
 <76f2d454-ee2b-4aba-a6e5-974b1b2dfbb3@suse.com>
 <859d60ce-165d-416f-a1f1-89ba11de2839@citrix.com>
 <3e6d9b74-f606-4774-8767-c71391b9c741@suse.com>
 <afb03d32-c723-457f-8a29-fd2f6c9c69f2@citrix.com>
 <0c0cb917-ae36-48c0-83cd-80764a01587b@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
In-Reply-To: <0c0cb917-ae36-48c0-83cd-80764a01587b@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0052.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:152::21) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|CO1PR03MB5889:EE_
X-MS-Office365-Filtering-Correlation-Id: 104f1593-1837-4a5b-73a8-08de2cf67a4c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?MWVhR241WnZKZURwZm56MEtROCtpaVUvWHVpa1h3Ny9mdVpwb2VGQmsrcU1p?=
 =?utf-8?B?TFp3bFl1R1RaODRkdmJQcGJsQU1KbHV3c1ZiMHFBeFIrL1JrMXVuY0dvVUIw?=
 =?utf-8?B?ME92alBhSG5LeGJ3QVNmbklPU1pibkhTN2MxOE1JL1g5RU12RCtMU1psL3lJ?=
 =?utf-8?B?VGxSS2hQWVVRRDdjYnBSNytOa3RVUEhvclFBTUxEbkZxZUdYZGFxSmZVdHJa?=
 =?utf-8?B?VjV5L3ZtaTRFWTZucGFpM0g5ZHJpaDYrbzhKM0R0UUNIMjdCU29hVGpKMktl?=
 =?utf-8?B?TnJyQWd1WUpIZXBob1JESWpXeTBOcGFqUDRmSUFCRHZsamlBZVBXT2Z5allh?=
 =?utf-8?B?QTBxUXZ5UEw5NUdwc0VybmdHRklJSGZJNWRtOFR4WHptZktGV2FEUnBzTkFD?=
 =?utf-8?B?T296dkRNYWNGZEpEN1dQRVF0US92WlZjbUgwWWdZS0JycEhBTG1xMkpnYzFk?=
 =?utf-8?B?bnZsM2h4UXpweUcrY1d5RTJURTZPeUJIMVlmNEpybm5HWTlCbnJRRDdOMkR0?=
 =?utf-8?B?Y0ZhK2hYN21PTFN0SUpZdThIQkxsMXNwT0VvTkVLQ3BpQXFuV2IyY1NDOWVs?=
 =?utf-8?B?aWsyb0tpdmE0OStJWmNFLzNUSlp4bi91R1VGMWExUUZwaHhKMHdPV0RrUkxs?=
 =?utf-8?B?K2VDckw3SGltbUdmMG1kSzBtVVdMQ2pUakR3Y0VuRisxYWZ4dGJwUk81MW43?=
 =?utf-8?B?US8vWjJWQ3pNTDJRRTZUMjlUbGpRVU14Z3MvTkpWUkdldGtobXZoanFRemhQ?=
 =?utf-8?B?L0g1L2tLZ3ZWemVmaXViUXpsTlB6SFJxbDhnSTRFTSt4bU5jTk1yOFBScUVZ?=
 =?utf-8?B?NndsMVFJenlCUW10aG8rTUlxOGNOek1vTWRESTQyZmpyWExldmlJaGFtWEZF?=
 =?utf-8?B?UXhJTVlhSThFWkRLZHJFRTRqS1piRXJOTmN3ZnVxa1ozd0xNNXZ2a0ZOZk9n?=
 =?utf-8?B?OGdhcDdKOEQ2L1pTRTJxSndCMmJLTzl2MUE4Y3RDTWovRHZkUC9waVZuQnVq?=
 =?utf-8?B?UU1oTHg2WWp1d1VNRGtMM3pqVm8zUW5FazA4Q3lSZm1rWnRudXVRVVcyUmNF?=
 =?utf-8?B?dVhZNCt1NzBXRzNadnFPM2pzKzhNNFNrQWxRTkJQWndQOVpETDNxSURxbklH?=
 =?utf-8?B?bHhIZVA4aHJnNE82aXJWWnpaNHJxVENFVVJoZzBSUklWV0dRdUxHa3RrMDZp?=
 =?utf-8?B?M2Z2TkVmSm9GVlFML2FqK3Z1K0RoSUhaNDlKVThsRzRJTE56TVMvemRuODBG?=
 =?utf-8?B?OFRYVm5lNkorSlBPZEYwNkFWZmFZOHVxczhOOXRoTTdTbWhBZHJsVXRnY1NC?=
 =?utf-8?B?SHhHaFpQN3NWdFp5OHNabFc0T0NsUHlhb29wUGNnNUUzV1VVZmdKZEJJUzNp?=
 =?utf-8?B?bjZuc0dnbWFkVjVTVUsvUWkyQjl3NGtmU2xwU0d3WE1qczJCK1lYbFFBVGIw?=
 =?utf-8?B?SGRPL2FCcHV4Y003QmJDVG1DeHJqRlpxZ00wVVY0Ni9TbGw3SlpsTm5Uc2xm?=
 =?utf-8?B?Y0U3dC9meFhjTGdTTVpvWStzM3VrVVNIVFNzMnNVSGdGQk5OVndoR0lrSVJN?=
 =?utf-8?B?Mld3K1BVOXBrOFcvd25xZkVCQVYrdzJLcU05RW1VSDVCd2NtaUkvalNiSUVR?=
 =?utf-8?B?bGlFL0JEQ1N0Vk9CWkpQR1hORTZWM1JhVG8wSWsxRk8zVEcyQW8xTHFScmFZ?=
 =?utf-8?B?OUFMTmhHZGk5TVNVS0RRWkt3Tm45bTgwNEhaMEtyT0VGNVhIdyszNTZJdDNW?=
 =?utf-8?B?bHArYlEreDVRMzU5ZU9PNUNRUUJ3dFJtL3JGak1NTkV6NGM5Y0xqd3RCaFM4?=
 =?utf-8?B?YlNaNlVJWEk5MENZME4wdVdJMHFRUGIrcTBSejU4RVltQW5KU3o5OWNySTlm?=
 =?utf-8?B?L2pNdWdtVUNFajlpbGtqblhFQVZWTnZVcThOeDViS3F1UGFuWW84VnJVSkh2?=
 =?utf-8?Q?+iMjVyePQ4DMxKlAWqt/HvAvsxeBLbGr?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?YzlyR1kyMGRQYlBubDlnckswZXB4dFJoZlVDSmJzamt0NXNyRER4d2dDRkJE?=
 =?utf-8?B?T3JDNlpOY2EvTVBMbnEybmdFNjFjQ2J5MzJLMlRpY2N2VkdwTWZJelVqV2s1?=
 =?utf-8?B?MzVOY1FvTFVrMkFXcUYwbE9WaGVDWEhRTzA1L09EbnhtN1R3RE1xUkt5RHJE?=
 =?utf-8?B?em9vTUUvQnZzS1JQSWZ6c0g3NXlpNGFtRlg4SlVoTWVnS1BxUkZrenAyUUNN?=
 =?utf-8?B?N2wwY1ZJQTVCWHhEcFZZSmxLZlgrVHZoU0twL0RLK255RHdKZVFLTWxNakQz?=
 =?utf-8?B?Q080MmVhOGhUNkp2bFFYbnNxOENsR01YLzNFaXlyTTFBZUtOYVg2ejd6TjAw?=
 =?utf-8?B?dW5GdENFVUJMNGlwUlByVUt5SHpIUmxrRytFaGxYcTYyb05QaExOOW1OcDNr?=
 =?utf-8?B?bXdWaXhJa3hQUDQwVkRTeTJqQlJBNEgxV0cycUlnZWc5amJnTnJnTUdNZzEx?=
 =?utf-8?B?MU1ZVSttM1g5OEZQZVQ2ZE1GSHdSYTZQYUx1UzNBZEcvOWJRbUFhZ1p1KzJH?=
 =?utf-8?B?aDU1aHBLR1JvMlJrWHFmQkx6bUVmSWo0TFNGUEZjVVNPZ2RjUklIS2ttSktS?=
 =?utf-8?B?b3dvV3VjUFA4OFBwbmVPakZ1dC9lVlN3R0g5ZkJjNkxLdDNpTk0yTHJ5SVRI?=
 =?utf-8?B?dkNNTFBZOC9QbUpweWpxeFpRMXVoWWp1K1RESitDNWpFSld6WVlCbHM1b0hL?=
 =?utf-8?B?TmtkakFYd2VZdytHUlBEaXh2UmRseGtDWndoOWUrQTBLOGFlNWluYStuL1Z3?=
 =?utf-8?B?MkRTblhZNkJNMjVKZXVxSWNrdTVQN2hFL2p2TC9td3UvekY0TjdLSmpsWWZq?=
 =?utf-8?B?OW5HV2RqbzNISnNSN0U0S2pwaTFYeVJpaDZqUjZKZ1lGd0VjTFYxeFNXUTN2?=
 =?utf-8?B?enhRQ0lHNldXeExYNzFEbU13aGtTVDdnVW9tZlpWWjhndWo0UjBVeVVTa3Ba?=
 =?utf-8?B?YWgwbkRNUjZDZ2xxWmNhSENmNUF4U3FaeGZrZzN5S3doR2RuL0RQZm45TnVv?=
 =?utf-8?B?M0JkeVdWN1JYUCsraHpkSnY1eGJpUDR0TWh5S3dnWWt4WlFyUFVYeFdkcHlr?=
 =?utf-8?B?QjYyTFRkd2pVa1NXeVNFNytLV0V1MC82SmlCcWNDY0pkL3Y0eGhXZ290TWJu?=
 =?utf-8?B?RWU1dmRxRldVU3kvckwzeWFqYy9JckUrZ1dZSitMem5RdUlpRDIxZHdsT3N1?=
 =?utf-8?B?WTRQOTRXem1mL2srM3E3SEZYcytXVjg5OTgvT2NaZno2ZjNDRjFHVWk2WnR6?=
 =?utf-8?B?eWx4ZjR5eFBqZEpxMzJsbk0xK0s3QTM0VVQ5QytWQ3pwNG02OU01RWU5UXRF?=
 =?utf-8?B?ODZxckpmeGtHa29VcG4wS0llRkZmcWdlRDdZVERWWmFZUjh2MlZjZVlhTDl3?=
 =?utf-8?B?ZTQyRmgvYk5KNnYzb25nRFhxRzhlR3UvQXRrTnpjQ1ZIYk1BdDZycDRUeFRC?=
 =?utf-8?B?V0tFMlZ4NEtuS1YwTnh6aWFORzdDUi9JL2MvVytEa082blhhSGtlUDRYSERP?=
 =?utf-8?B?b2lyTlg4YjNpZm9DOHF4TE96ZFJxeXZlVVVnZm1RN0RqMW1xZjVZME9KbEdj?=
 =?utf-8?B?SC8wMnE4dHA3dzJ2OTIxUlNxd2E4SHdQdW1qYlZuVWZzTW5qVW11ZjJDMDI0?=
 =?utf-8?B?RlRGYWN4ZUM1TFY3STVSYkpmTS9uVkU3dm9EdTBRa0F3L1I5YVZobWM5ckgy?=
 =?utf-8?B?QzdXa3VDS01sMVVzR2IvM28yOWFRdHJyL01wUUFHeXdmRHAzd1hEMEkyMzQv?=
 =?utf-8?B?d3Y4QWhCQTlGcWpIVjZLa3ZpN0NlZVhYNVhMb3p4ZDdIbVlWKzJVNHRnMURZ?=
 =?utf-8?B?VDNxMnRTRDV6ZG5FSEVudEtPQmJkL0dIY0k3STQxbThETDVKRkVpb0ZmdlEw?=
 =?utf-8?B?dkRBVnV1MWZiRytaS3ZQZDNWL0dzVGhwaklwUGlwUmljOFp2WE1EVFQ0M3Zz?=
 =?utf-8?B?N1MzZ1RoUjFLOExKSTZueFhrTndHdFhTM3J0QXB0S2dEQUtRVnJsZmF1SmM0?=
 =?utf-8?B?cm4zMjg4dFFRdnBibzRIcHo3T0NsamdpSmd0bG9uSWVLMkcwN2JobEZtVzRn?=
 =?utf-8?B?QStyRFJBMUxROXZ6bkFlRTVhczFGQWlFci9qbDQzVTZZN1N1MnRGcSszaW1R?=
 =?utf-8?B?dUJxVXhMYkJ2c3hhL1dtRUxaMjhzT0o1N0ptbGUwTVNWSFI5czVzbjMzVFJH?=
 =?utf-8?B?MXc9PQ==?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 104f1593-1837-4a5b-73a8-08de2cf67a4c
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Nov 2025 14:17:05.9229
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7lY0NOv6z+1qG7QgtMwSQU9sh8u0JIbKiD3svy8eQb5IoLsMzxrVjXLnlGH3dyMz/c6g7c1g2qoAa/8vV9jco2FF1LQQjj07c7Vjr9tGcSM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR03MB5889

On 26/11/2025 2:09 pm, Jan Beulich wrote:
> On 26.11.2025 15:05, Andrew Cooper wrote:
>> On 26/11/2025 1:58 pm, Jan Beulich wrote:
>>> On 26.11.2025 14:51, Andrew Cooper wrote:
>>>> On 26/11/2025 1:24 pm, Jan Beulich wrote:
>>>>> diff --git a/xen/arch/x86/arch.mk b/xen/arch/x86/arch.mk
>>>>> index 16368a498bb7..a0ee050c931b 100644
>>>>> --- a/xen/arch/x86/arch.mk
>>>>> +++ b/xen/arch/x86/arch.mk
>>>>> @@ -3,6 +3,8 @@
>>>>>  
>>>>>  export XEN_IMG_OFFSET := 0x200000
>>>>>  
>>>>> +ALL_LIBS-y += arch/x86/lib/lib.a
>>>>> +
>>>> Oh, I'd realised it was this easy, I'd have done so straight away when
>>>> adding x86's custom arch_generic_hweightl().
>>>>
>>>> I assumed it was going to be more complicated getting the order of the
>>>> arch specific lib correct with the generic lib.
>>>>
>>>> More concretely.  Given an x86 lib, we should move things like
>>>> arch/x86/memcpy.S to it.
>>>>
>>>> Therefore, when we have common/lib.a and arch/lib.a, do we guarantee to
>>>> have arch/lib.a with higher precedence so for matching functions the
>>>> arch specific one guarantees to be taken?
>>> Not with the change above, it would need to become
>>>
>>> ALL_LIBS-y := arch/x86/lib/lib.a $(ALL_LIBS-y)
>>>
>>> to achieve that, requiring that ALL_LIBS-y won't change into a lazy-expansion
>>> variable. If that's okay (please confirm), I can adjust the patch.
>>>
>>> Things would be yet easier if every arch had a lib/lib.a, as then in
>>> xen/Makefile we could simply have
>>>
>>> ALL_LIBS-y                := arch/$(SRCARCH)/lib/lib.a
>>> ALL_LIBS-y                += lib/lib.a
>>>
>>> Alternatively we could move the setting of ALL_LIBS-y in xen/Makefile to
>>> after the arch/$(SRCARCH)/arch.mk inclusion. I'd be a little wary of that,
>>> though, as it would then be different from ALL_OBJS-y.
>> I think this would be better handled by common code.
>>
>> Arches are going to want a lib.a eventually.  ARM even has
>> arch/arm/arm{32,64}/lib/ but like x86 they're just simple obj-y += at
>> the moment.
>>
>> However, arches shouldn't be forced to make an empty one simply to build.
>>
>> Does this work:
>>
>> ALL_LIBS-y                := $(wildcard arch/$(SRCARCH)/lib/lib.a)
>> ALL_LIBS-y                += lib/lib.a
>>
>> ?  If so, I think it's the nicest option.
> I had thought of doing it this way initially, but on a fresh build
> arch/$(SRCARCH)/lib/lib.a wouldn't be there when the Makefile is read in.
> Whether switching ALL_LIBS-y to be a lazy-expansion variable would work
> I didn't try; I'd prefer not to change the kind of variable that it is.

Hmm.  What about:

    $(filter arch%,$(ALL_LIBS-y)) $(filter-out arch%,$(ALL_LIBS-y))

in the link, at which point it doesn't matter about the exact order in
ALL_LIBS-y?

We do a similar trick with UBSAN_FLAGS to force the ordering of -fxxx vs
-fno-xxx.

~Andrew

