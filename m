Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A7269A39352
	for <lists+xen-devel@lfdr.de>; Tue, 18 Feb 2025 07:06:53 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.891076.1300171 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tkGjp-0006Vm-QC; Tue, 18 Feb 2025 06:05:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 891076.1300171; Tue, 18 Feb 2025 06:05:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tkGjp-0006Sg-Mh; Tue, 18 Feb 2025 06:05:45 +0000
Received: by outflank-mailman (input) for mailman id 891076;
 Tue, 18 Feb 2025 06:05:44 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=6odE=VJ=amd.com=penny.zheng@srs-se1.protection.inumbo.net>)
 id 1tkGjo-0006Sa-MY
 for xen-devel@lists.xenproject.org; Tue, 18 Feb 2025 06:05:44 +0000
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on20615.outbound.protection.outlook.com
 [2a01:111:f403:2416::615])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6090b9a2-edbe-11ef-9896-31a8f345e629;
 Tue, 18 Feb 2025 07:05:42 +0100 (CET)
Received: from DM4PR12MB8451.namprd12.prod.outlook.com (2603:10b6:8:182::7) by
 DM3PR12MB9434.namprd12.prod.outlook.com (2603:10b6:0:4b::18) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8445.17; Tue, 18 Feb 2025 06:05:36 +0000
Received: from DM4PR12MB8451.namprd12.prod.outlook.com
 ([fe80::b04e:2da5:7189:4c4d]) by DM4PR12MB8451.namprd12.prod.outlook.com
 ([fe80::b04e:2da5:7189:4c4d%6]) with mapi id 15.20.8466.013; Tue, 18 Feb 2025
 06:05:35 +0000
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
X-Inumbo-ID: 6090b9a2-edbe-11ef-9896-31a8f345e629
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OIqG+aq9rFSRU2vi1CdCtPnnhfv+rfej7iY4RDw21eTaeDAscCwco6buu1S4coQx2udnUiY9xBm6/+HEQqKa++AkRlUbUkQG3OPCyOns7C2CTtid/XWv/D+MXjmkL5dUmsnUSm3L0057UB5tQ6Jlywg+7vU3yd8ctNcVQPtg7CFeI1RVb060UKUfAjUD/UOUShkbjgfCWI5Cq7yt+JAWe1LM7L6STBh3g5SzqSUfyYTxkgPDiGhXjtov0mAsZ9AnfBFhMOP6gTpESrk8kyeeV3RkOJwEm6tHYW+vTfx0I5KxXkzNanueY+b4KFnfOC5Zd/0iQQHjPnfnB8MHHAsuWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6wfnrR9qiGmzla7EwUMwRyS4D956Ad31v7W4hJf5TU8=;
 b=A48lUWHmEZon14BdwxegwRGs/VIRegsHf7lSMwByqEl70gPDUTTgGjDspPfw+vlWsnlntO8IroJ61btpWgLqgU/NcUgnpJKpi6DJTw6iRmZE5P1sebkFt+NcKBiN23TsBhxbLbjOByx9Wtvbo8KW8b8YimTL8EmuZMQnMRSuejlhDB8ma3X/rPhQuhWHVb+VddmxEi2Kogsajifm03E++cFIonFmKrA5QxiDV475FzF2xCc4sg5Nvdhvh+SBx/dgt4kmngdWBRyDFgRDhEJ84rsVVztmx5kQqTyHdOFBtbiGAlfSjjswAuMFUwqxE0uie2mFmkUytGQEEGBD0FDVxg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6wfnrR9qiGmzla7EwUMwRyS4D956Ad31v7W4hJf5TU8=;
 b=NjeMun3j/hBZb1OfN+X3yOIFm0wfWVtxaQLYI4pGCOksGCDw9PtGw8TNL8kSc6XwpNraL1PovvnSYyeTbZGDvWr7Iuk8UFGbjuzRvLfq4wZE6fkv1J3ORvNJzaxY1xc0d2RxSaVK0zuWv+tiB+6Nxw22UnicHByzMVbxUWZ6YR8=
From: "Penny, Zheng" <penny.zheng@amd.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "Huang, Ray" <Ray.Huang@amd.com>, "Andryuk, Jason"
	<Jason.Andryuk@amd.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
	=?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>, Anthony PERARD
	<anthony.perard@vates.tech>, "Orzel, Michal" <Michal.Orzel@amd.com>, Julien
 Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: RE: [PATCH v2 02/11] xen/x86: introduce new sub-hypercall to
 propagate CPPC data
Thread-Topic: [PATCH v2 02/11] xen/x86: introduce new sub-hypercall to
 propagate CPPC data
Thread-Index: AQHbeHHLxWVIgPijWEedM19MLd/Q4rNB+imAgAj8gkCAADZUAIABdSLg
Date: Tue, 18 Feb 2025 06:05:35 +0000
Message-ID:
 <DM4PR12MB8451E14BD7539A3A2C565C0DE1FA2@DM4PR12MB8451.namprd12.prod.outlook.com>
References: <20250206083255.1296363-1-Penny.Zheng@amd.com>
 <20250206083255.1296363-3-Penny.Zheng@amd.com>
 <d3198e8c-2723-484c-b305-822a681d544b@suse.com>
 <DM4PR12MB8451A5DC8E389ECA2D8A3E1AE1FB2@DM4PR12MB8451.namprd12.prod.outlook.com>
 <7a0d4cab-188d-41de-ac32-b307109cb0dc@suse.com>
In-Reply-To: <7a0d4cab-188d-41de-ac32-b307109cb0dc@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_ActionId=ab75d253-a6a3-4cda-9baf-a13be9f151c4;MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_ContentBits=0;MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Enabled=true;MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Method=Standard;MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Name=AMD
 Internal Distribution
 Only;MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_SetDate=2025-02-18T05:54:01Z;MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Tag=10,
 3, 0, 1;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR12MB8451:EE_|DM3PR12MB9434:EE_
x-ms-office365-filtering-correlation-id: a5341640-0a48-4782-7b5e-08dd4fe242a3
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|366016|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?eHNWb3ZvUFZseXF4OFZyb3FWbGpjcitRMnlVVy9jSGk5SEthVXJBbFZNSFdr?=
 =?utf-8?B?T1NRRGxZOE1vcGxoSENSWEQxV1dYWm1RR05MVWY2VkJ1Y2RyNkQ5Z0JzV0Nm?=
 =?utf-8?B?UzFMc0Z0V2dIZ3lBTzZYSHJ1d0wwL0N4S2dQVUlXdEF4UE9xZDRibXhhK2Q3?=
 =?utf-8?B?eVp6bHRBeVh2TGlFU2lzbDRLWnM4c2toSWZTWWtiN1hZck9oWEU0VTNLOUZK?=
 =?utf-8?B?YmZDclo4T1Q1UW1Zc2dOSTcxTzRQK2Rwc01ISDM2emlCNVE1VHlaRm11ZkVw?=
 =?utf-8?B?OE0zSTZ0SWRHZDRQQUpBRTNWdzlYVzhrMVFCZzVvcm5VelJFR3REeWJGYmpj?=
 =?utf-8?B?RFd6TG9ET3RPTTFEUkx0REFnb2RFM3c0RWVVamJrcTdvSUUzekxaRFFhR1NN?=
 =?utf-8?B?Q2UwSnZQRjhBMGtQeTR4dVdGZXhqZnhFZXhWQmFJNG03aXRkeXR1UGhXMnRB?=
 =?utf-8?B?eFNNQXBMSkNTcVZwTlc2dXRoL1B4TEI4VUlLdUFNbldXWDVOOENLRXRjaFYv?=
 =?utf-8?B?eG80cVJsRXJ1Y2xydkdNczZYaXg0cUNjejh0V1daZnJ3akk0dFdwTzNKYUE0?=
 =?utf-8?B?MWdnb1lUcGlLOUY1TGNqVStIeVpMek1GWEhKbkxESjduR0lxSnYwTDhBVUVz?=
 =?utf-8?B?cVZzS0JlQXNRUVlWSzdNZzN0bkN6K01BSnNteXhTVnEzTEZpdEpiZzBCTFV1?=
 =?utf-8?B?NVJBWjlRbUsvMUplQVdGTXF5VTJpSnJTWVdONjdxZzdFdkQrTTZEeWxJd2ts?=
 =?utf-8?B?cENRSW14WFo2NzlUZVB1U1JJU2pzWjlWK3NjR1A2NldTRzF1QkhORW1XdGF1?=
 =?utf-8?B?T05MU1ZMMzdETVlYU29waWFCYVQ1ekJLMElYN01Sb2hEWjRpMzlCd2wrbG9y?=
 =?utf-8?B?c294S1ZBaGhQcnNkV21BUURGYVFncnArOElhWHZYaVhMRTBmcXBway9DTkxN?=
 =?utf-8?B?N1hWdU84dVJ4Y3ErdERiTkxyMjdLSWZkbGZUbmhJaDlPOXBxY3Y5KzdWM3U5?=
 =?utf-8?B?VTRrOEc1QVIxK09OSVpvTHZOWUd2aEVGb3ZDQWVIRXMxUDVKb2R1RzZIa2xX?=
 =?utf-8?B?U21LY041S0djVWo5YXVPK3g1T0VmYnI1Y2pmVGY5WFJNUHY0NTAzVURSRlpn?=
 =?utf-8?B?Yms5TVVQMXV4TzlxbzZhRTY4eE1OelRaZ2pRR3orZERNWUZPYytIY1ZiVEFo?=
 =?utf-8?B?cUxxdkd0Skk0c3RwWWx3S2JQUHd0MXlyYUhvSW45Q040cEN1WEI2OHA1TW5a?=
 =?utf-8?B?emJkS3RFcTlkSExQL29rYkVxbnJ5SU5peit3QWYrblltL2hPTVdJOUFuTmZO?=
 =?utf-8?B?dk1SdWRhZFFqdUhiSEpOemo4ZGVkMFkwVEUvQzFuTlh0YThCQmF5THlTTEJy?=
 =?utf-8?B?b3JWdGZ6SWRtaE9CUnUvQnR3TDJxVkVyNWpyTVk4UGVLSVBHZnB2NXUrQjhs?=
 =?utf-8?B?VHJuY2kyUE44YzBweEtRNkdVK2YyKzR0ZTgwc091N0lBL1dTWkVRVThvTzRm?=
 =?utf-8?B?TFhDVjdQQ3pnZ2c4bFFnNXpNZHA2dVNMNmgxT2h1eFN2QzVzUnRJSitkWDdl?=
 =?utf-8?B?RTdlMjNuZnEyMTZ6NE9NVHJ2MmFDaDYxSVNQdHFWL3ZSbnR3cEk4NGtlMkVN?=
 =?utf-8?B?RVYwZlFUcit2THQ3aWpSTmhkS3YxNVhkL0tEamJFLy9DRU1lcWwxUUJsemw2?=
 =?utf-8?B?VjFvd1pnV2ovY3ZrMUgyYitsWHZDSlRQUllSYlozT0tmaVR1UDR4SEp3aUVs?=
 =?utf-8?B?aldGQUUyUXlEVDhmQXZCMmNDYVdYbVNFOUJxcmk0REJHVnFnR1psVUswdk8x?=
 =?utf-8?B?eTFZcVRldUhjY2dlUWM0TVZRZHk3QlBCbUZlZ0p0bmsrMUVnbmNpTE5haDNR?=
 =?utf-8?B?VmpCaS84WHVkN1JkOGlCYkd6WEprdUtaNFpaS3ZOK0lUYnc9PQ==?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR12MB8451.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?SHArcVZaQ0ZZLzF2dVhMd0tZMnlmOGR0QXBHQ00xTEFZSlBUbkx2Rks3Z1Jl?=
 =?utf-8?B?UXR1ck9xMGVjQXFmWnJPamtXbmJFTC8wZ0dyaTJ3eTN3K1Q3Q0NYWHZPSm9G?=
 =?utf-8?B?elNDNnRjMzZsQXJKYVJaMnhYTXNkRVlsODZPc1JKdU9SM28rd2pCOEJKV041?=
 =?utf-8?B?SCtrVTU4ajR2Z1AvV1R5SkNwVHBRdkFSM3QzdzB2dWZmcFlQYlk3WFkxU1dF?=
 =?utf-8?B?VjhHdnR3RTlsRnVPTGJib3U5emtHaUlQUWFkclh3ODl0c0lya1JvVy9zYzRh?=
 =?utf-8?B?T3huNGU0Zy8rNEJuR3NtZTRsMGhXaG5Id3l4N0tpWUVmL2h0TVpQaklmcjEr?=
 =?utf-8?B?bzlPNk5xaThtd3ZzbTdwSUkrMktYRzJka0tibE1TT1pmWm00RVYvU25ZbHor?=
 =?utf-8?B?ejI5SG42alE4MEJkM1BRTndBZkpOeGk0K2ljb1g4YzQwWFJwZkgwMVRXaTNC?=
 =?utf-8?B?WXV6YnEybkhwUjV5aEFFZWhwL2VJdW1CTXhlUEdmRXBtalRKY3RoY0psMzk2?=
 =?utf-8?B?d0c3VjU0TFpvb2pteFdmK2ZnZ0dVSEtuQ3VxRFMvMDhFTjVWMWNaMEZFdHdT?=
 =?utf-8?B?VGM0c2QxS2pZMmxMREk1a3p1amY0aTVWMEFxdFNYTXVVVnpQMkxCRy9BVkNL?=
 =?utf-8?B?T1AxSXlkNWtHTWJSMTVQejQrYjgrL3RkSlJRT2hGaXpDeGdIV2VLa3Jhb2pM?=
 =?utf-8?B?QjdVYkJRTW9DUmlwK0w4Z1hXOFBJdEZteEN3d0lIWC95TlR0YlBoRWtxeVRl?=
 =?utf-8?B?SGd1YUtCWGVYdXJWR0QzQysxR0wrbTNTWlp0eEtPWnlsekJIell2b3l3bGha?=
 =?utf-8?B?Q2VaVHNJNGdXQndONnFleWVOeUdMTVhxdUdYOUd4dzRWQUdUTGZhZllzM0Vw?=
 =?utf-8?B?UWNZeXFVbWF2enkxcUFkM3B3bEt3QTdDSjhObUZmYnl4b09iZFJVR1ArSGNa?=
 =?utf-8?B?ZWdkYUxVaEQwWjNDVkxYdlZaSVU2L0ZyWlo3azg5UDUwRzVUT0ZFc0RiQlBi?=
 =?utf-8?B?VTNiK1hOU2hUalE4RVowdXNJb1M5ZWJ5bVBkTzZlWWlwR1RqcGZEVXJwRTAv?=
 =?utf-8?B?MHFBYmZOYVFXT3d0U0JjMkpTRXRHMnkwWktXQitrcmNzWUZjVU5WWS9wd3ZM?=
 =?utf-8?B?aHd2RWRlQTZVZCtqOUJ1T3V6MWk2ZUI3YkdtamViWUlvZ0YzU1BieHFPeXRO?=
 =?utf-8?B?ZU96TDYyMVI4M090MWlycHpZakJXamFueUlacWtnd2hWUkZuNFdVOVJacjhi?=
 =?utf-8?B?SDBEOHNud3NhT2RKK2RJV1VVaXdPRmhpRnBNd28rcnp2eFBDRFlSKzJ6UlVX?=
 =?utf-8?B?RDlLOVdxSmRmVCs4RUlzSU5sNkplQktvWUhWS1NaendKYWVFYjdEVzg2YWZW?=
 =?utf-8?B?YmdwR2tSVThUcHFVN01sMGl3S2M1RENWZnVYaWlRckIzbDhXUFlKSEViMUNk?=
 =?utf-8?B?anlrMWhuZlJPZ0l1Zk03RiswQi9tUlJWRktVVHM0aGQ3WEhsbnJiR20wQndB?=
 =?utf-8?B?RVdZQk1yQkNwZ3BNcDJOT2ZpMXcxUmtrUjBpSGxHYWNtaEc2aVRoWlR5UFFz?=
 =?utf-8?B?MzBySWsvbzI2VFBHTHRKajlIZHZSS3hLdEUrc09zdkhuMWJPbE5rbS9tMzBy?=
 =?utf-8?B?cXNGSnN0L0w2VXpuMzEyZDBweSs1Ri9FdTFmSVFIbUdibjE0UWZXVGVUZzhw?=
 =?utf-8?B?aFZwS2ltVC9zQk1wSlhPcVZpYXJUK0plVzhpV3locXYxWUl4dEY3RG53WkVZ?=
 =?utf-8?B?c01mWWVDdWpoWXBiSENsZW9oUXoyVllVTDZ3Z2JhakxNNVYyU3FSNkx3d3FJ?=
 =?utf-8?B?OHBIb2FuenpsRDZ1S2NpbUIrNWZyTUJJUmhGY2lYKzg4c3ErTU11cWdZd3JQ?=
 =?utf-8?B?eVI5VzViUUdOWGNIL1I0K0pqV2lvKzV3NDRMckIzZ3lzSzZ6ZjVaQzJKR2oy?=
 =?utf-8?B?c0N0MTVmYXMyZEdKWUxhNlp5a3NiUzhIbmZpWlhQak5JWndFaEhNWVBoeUF3?=
 =?utf-8?B?WDRGbThIU2hRRFc3dmJZOHJ1OUZVNUlqSGdXSEh6cEtGc0luclNOaHU3Yjlx?=
 =?utf-8?B?Ymp4UDRHK04yS2lqN1NHSWQ5bkV5T0pNbmdHTmFDamhrdVBySFlGODZ1Y0Z3?=
 =?utf-8?Q?z9/o=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB8451.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a5341640-0a48-4782-7b5e-08dd4fe242a3
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Feb 2025 06:05:35.5144
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: EYOrrrsPlE/K34oyrTmEB4VopOPpaqHtEE4AhgUJZ/YG4Com0SVkJnTpmXRmQLUwGCwhnkWf2lf2clR7Ib2kXw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PR12MB9434

W0FNRCBPZmZpY2lhbCBVc2UgT25seSAtIEFNRCBJbnRlcm5hbCBEaXN0cmlidXRpb24gT25seV0N
Cg0KSGksDQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogSmFuIEJldWxp
Y2ggPGpiZXVsaWNoQHN1c2UuY29tPg0KPiBTZW50OiBNb25kYXksIEZlYnJ1YXJ5IDE3LCAyMDI1
IDM6MzkgUE0NCj4gVG86IFBlbm55LCBaaGVuZyA8cGVubnkuemhlbmdAYW1kLmNvbT4NCj4gQ2M6
IEh1YW5nLCBSYXkgPFJheS5IdWFuZ0BhbWQuY29tPjsgQW5kcnl1aywgSmFzb24NCj4gPEphc29u
LkFuZHJ5dWtAYW1kLmNvbT47IEFuZHJldyBDb29wZXIgPGFuZHJldy5jb29wZXIzQGNpdHJpeC5j
b20+Ow0KPiBSb2dlciBQYXUgTW9ubsOpIDxyb2dlci5wYXVAY2l0cml4LmNvbT47IEFudGhvbnkg
UEVSQVJEDQo+IDxhbnRob255LnBlcmFyZEB2YXRlcy50ZWNoPjsgT3J6ZWwsIE1pY2hhbCA8TWlj
aGFsLk9yemVsQGFtZC5jb20+OyBKdWxpZW4NCj4gR3JhbGwgPGp1bGllbkB4ZW4ub3JnPjsgU3Rl
ZmFubyBTdGFiZWxsaW5pIDxzc3RhYmVsbGluaUBrZXJuZWwub3JnPjsgeGVuLQ0KPiBkZXZlbEBs
aXN0cy54ZW5wcm9qZWN0Lm9yZw0KPiBTdWJqZWN0OiBSZTogW1BBVENIIHYyIDAyLzExXSB4ZW4v
eDg2OiBpbnRyb2R1Y2UgbmV3IHN1Yi1oeXBlcmNhbGwgdG8gcHJvcGFnYXRlDQo+IENQUEMgZGF0
YQ0KPg0KPiBPbiAxNy4wMi4yMDI1IDA4OjIwLCBQZW5ueSwgWmhlbmcgd3JvdGU6DQo+ID4gW0FN
RCBPZmZpY2lhbCBVc2UgT25seSAtIEFNRCBJbnRlcm5hbCBEaXN0cmlidXRpb24gT25seV0NCj4N
Cj4gQnR3LCBib2lsZXIgcGxhdGVzIGxpa2UgdGhpcyBhcmVuJ3QgcmVhbGx5IGxpa2VkIG9uIHB1
YmxpYyBtYWlsaW5nIGxpc3RzLCBmb3IgYmVpbmcgY29udHJhcnkNCj4gdG8gdGhlIHB1cnBvc2Ug
b2Ygc3VjaCBsaXN0cy4NCj4NCj4gPj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gPj4g
RnJvbTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPg0KPiA+PiBTZW50OiBUdWVzZGF5
LCBGZWJydWFyeSAxMSwgMjAyNSA3OjEwIFBNDQo+ID4+DQo+ID4+IE9uIDA2LjAyLjIwMjUgMDk6
MzIsIFBlbm55IFpoZW5nIHdyb3RlOg0KPiA+Pj4gK3sNCj4gPj4+ICsgICAgaW50IHJldCA9IDAs
IGNwdWlkOw0KPiA+Pj4gKyAgICBzdHJ1Y3QgcHJvY2Vzc29yX3BtaW5mbyAqcG1faW5mbzsNCj4g
Pj4+ICsNCj4gPj4+ICsgICAgY3B1aWQgPSBnZXRfY3B1X2lkKGFjcGlfaWQpOw0KPiA+Pj4gKyAg
ICBpZiAoIGNwdWlkIDwgMCB8fCAhY3BwY19kYXRhICkNCj4gPj4+ICsgICAgew0KPiA+Pj4gKyAg
ICAgICAgcmV0ID0gLUVJTlZBTDsNCj4gPj4+ICsgICAgICAgIGdvdG8gb3V0Ow0KPiA+Pj4gKyAg
ICB9DQo+ID4+PiArICAgIGlmICggY3B1ZnJlcV92ZXJib3NlICkNCj4gPj4+ICsgICAgICAgIHBy
aW50aygiU2V0IENQVSBhY3BpX2lkKCVkKSBjcHVpZCglZCkgQ1BQQyBTdGF0ZSBpbmZvOlxuIiwN
Cj4gPj4+ICsgICAgICAgICAgICAgICBhY3BpX2lkLCBjcHVpZCk7DQo+ID4+PiArDQo+ID4+PiAr
ICAgIHBtX2luZm8gPSBwcm9jZXNzb3JfcG1pbmZvW2NwdWlkXTsNCj4gPj4+ICsgICAgaWYgKCAh
cG1faW5mbyApDQo+ID4+PiArICAgIHsNCj4gPj4+ICsgICAgICAgIHBtX2luZm8gPSB4dnphbGxv
YyhzdHJ1Y3QgcHJvY2Vzc29yX3BtaW5mbyk7DQo+ID4+PiArICAgICAgICBpZiAoICFwbV9pbmZv
ICkNCj4gPj4+ICsgICAgICAgIHsNCj4gPj4+ICsgICAgICAgICAgICByZXQgPSAtRU5PTUVNOw0K
PiA+Pj4gKyAgICAgICAgICAgIGdvdG8gb3V0Ow0KPiA+Pj4gKyAgICAgICAgfQ0KPiA+Pj4gKyAg
ICAgICAgcHJvY2Vzc29yX3BtaW5mb1tjcHVpZF0gPSBwbV9pbmZvOw0KPiA+Pj4gKyAgICB9DQo+
ID4+PiArICAgIHBtX2luZm8tPmFjcGlfaWQgPSBhY3BpX2lkOw0KPiA+Pj4gKyAgICBwbV9pbmZv
LT5pZCA9IGNwdWlkOw0KPiA+Pj4gKyAgICBwbV9pbmZvLT5jcHBjX2RhdGEgPSAqY3BwY19kYXRh
Ow0KPiA+Pj4gKw0KPiA+Pj4gKyAgICBpZiAoIGNwdWZyZXFfdmVyYm9zZSApDQo+ID4+PiArICAg
ICAgICBwcmludF9DUFBDKCZwbV9pbmZvLT5jcHBjX2RhdGEpOw0KPiA+Pj4gKw0KPiA+Pj4gKyBv
dXQ6DQo+ID4+PiArICAgIHJldHVybiByZXQ7DQo+ID4+PiArfQ0KPiA+Pg0KPiA+PiBXaGF0J3Mg
dGhlIGludGVyYWN0aW9uIGJldHdlZW4gdGhlIGRhdGEgc2V0IGJ5IHNldF9weF9wbWluZm8oKSBh
bmQNCj4gPj4gdGhlIGRhdGEgc2V0IGhlcmU/IEluIHBhcnRpY3VsYXIsIHdoYXQncyBnb2luZyB0
byBoYXBwZW4gaWYgYm90aA0KPiA+PiBmdW5jdGlvbnMgY29tZSBpbnRvIHBsYXkgZm9yIHRoZSBz
YW1lIENQVT8gU2hvdWxkbid0IHRoZXJlIGJlIHNvbWUgc2FuaXR5DQo+IGNoZWNrcz8NCj4gPg0K
PiA+IFllcywgSSd2ZSBjb25zaWRlcmVkIHRoaXMgYW5kIGNoZWNrZWQgQUNQSSBzcGVjLiBJJ2xs
IHJlZmVyIHRoZW0gaGVyZToNCj4gPiBgYGANCj4gPiBJZiB0aGUgcGxhdGZvcm0gc3VwcG9ydHMg
Q1BQQywgdGhlIF9DUEMgb2JqZWN0IG11c3QgZXhpc3QgdW5kZXIgYWxsIHByb2Nlc3Nvcg0KPiBv
YmplY3RzLg0KPiA+IFRoYXQgaXMsIE9TUE0gaXMgbm90IGV4cGVjdGVkIHRvIHN1cHBvcnQgbWl4
ZWQgbW9kZSAoQ1BQQyAmIGxlZ2FjeSBQU1MsDQo+IF9QQ1QsIF9QUEMpIG9wZXJhdGlvbi4NCj4g
PiBgYGANCj4gPiBTZWUNCj4gPiBodHRwczovL3VlZmkub3JnL3NwZWNzL0FDUEkvNi41LzA4X1By
b2Nlc3Nvcl9Db25maWd1cmF0aW9uX2FuZF9Db250cm9sDQo+ID4gLmh0bWw/aGlnaGxpZ2h0PWNw
cGMjcG93ZXItcGVyZm9ybWFuY2UtYW5kLXRocm90dGxpbmctc3RhdGUtZGVwZW5kZW5jaQ0KPiA+
IGVzIFNvIENQVXMgY291bGQgaGF2ZSBib3RoIF9DUEMgYW5kIGxlZ2FjeSBQLXN0YXRlIGluZm8g
aW4gQUNQSSBmb3INCj4gPiBlYWNoIGVudHJ5LCB0aGV5IGp1c3QgY2FuJ3QgaGF2ZSBtaXhlZC1t
b2RlIE1heWJlIHdlIHNoYWxsIGFkZCBzYW5pdHkNCj4gPiBjaGVjayB0byBzZWUgaWYgX0NQQyBl
eGlzdHMsIGl0IHNoYWxsIGV4aXN0IGZvciBhbGwgcGNwdXM/DQo+DQo+IE1heWJlLCBidXQgdGhh
dCB3YXNuJ3QgdGhlIHBvaW50IG9mIG15IHJlbWFyay4NCj4NCj4gUHJvcGVybHkgYmVoYXZpbmcg
RG9tMCBzaG91bGQgcHJvYmFibHkgYmUgcGFzc2luZyBvbmx5IG9uZSBvZiB0aGUgdHdvIHBvc3Np
YmxlDQo+IHBpZWNlcyBvZiBpbmZvcm1hdGlvbi4gWWV0IG1heWJlIHdlJ2QgYmV0dGVyIHNhbml0
eSBjaGVjayBfdGhhdF8/DQo+IChJIGRvbid0IHJlY2FsbCBzZWVpbmcgTGludXgga2VybmVsIHNp
ZGUgcGF0Y2hlcyB5ZXQ7IGlmIHRoZXkgd2VyZSBwb3N0ZWQgc29tZXdoZXJlLA0KPiB0aGV5IG1h
eSBhdCBsZWFzdCBwYXJ0bHkgYWRkcmVzcyBteSBjb25jZXJuLikNCj4NCg0KSW4gbXkgbGludXgg
cGF0Y2gsIGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2xrbWwvMjAyNDEyMDQwODI0MzAuNDY5MDky
LTEtUGVubnkuWmhlbmdAYW1kLmNvbS9ULw0KSSBvbmx5IGRpZCB6ZXJvLXZhbHVlIGNoZWNrIGlu
IHhlbl9wcm9jZXNzb3JfZ2V0X3BlcmZfY2FwcygpLCBEbyB5b3UgdGhpbmsgaW4gdGhhdCBwbGFj
ZSwgSSBzaGFsbCBhZGQNCm1vcmUgc3RyaWN0IHNhbml0eSBjaGVjaywgbGlrZSB0aGUgcmVnaXN0
ZXIgdmFsdWUgc2hhbGwgbm90IGJlIHplcm8gYW5kIGFsc28gbXVzdCBzbWFsbGVyIHRoYW4gVUlO
VDhfVD8NCk9yIHdlIGp1c3QgZG8gdGhlIGFib3ZlIGNoZWNrIGluIFhlbiBwYXJ0IHdoZW4gcmVj
ZWl2aW5nIHRoZSBkYXRhPw0KDQo+ID4+IFdpbGwgY29uc3VtZXJzIGJlIGFibGUgdG8gdGVsbCB3
aGljaCBvZiB0aGUgdHdvIHdlcmUgY29ycmVjdGx5DQo+ID4+IGludm9rZWQsIGJlZm9yZSB1c2lu
ZyByZXNwZWN0aXZlIGRhdGE/IEV2ZW4gaW4gdGhlIGV2ZW50IG9mIG5vIGNvZGUNCj4gPj4gY2hh
bmdlcyBhdCBhbGwgdG8gYWRkcmVzcyB0aGlzLCBpdCB3aWxsIHdhbnQgZGlzY3Vzc2luZyBpbiB0
aGUgcGF0Y2ggZGVzY3JpcHRpb24uDQo+ID4+DQo+ID4NCj4gPiBJIGhhdmUgY2hlY2tlZCB0aGUg
cmVsZXZhbnQgc3BlYy4gaXQgc2hhbGwgYmUgdGhlIGZvbGxvd2luZyBsb2dpYzoNCj4gPiBgYGAN
Cj4gPiBTb2Z0d2FyZSBlbmFibGVzIENvbGxhYm9yYXRpdmUgUHJvY2Vzc29yIFBlcmZvcm1hbmNl
IENvbnRyb2wgYnkNCj4gPiBzZXR0aW5nIENQUENfRU5BQkxFW0NQUENfRW5dIChiaXQgMCkgPSAx
LiBPbmNlIGl0IGdldHMgZW5hYmxlZCwgdGhlDQo+IHByb2Nlc3NvciBpZ25vcmVzIHRoZSBsZWdh
Y3kgUC1zdGF0ZSBjb250cm9sIGludGVyZmFjZS4NCj4gPiBgYGANCj4gPiBIbW1tLCBJIHNoYWxs
IGFkZCByZWxldmFudCBjb21tZW50IGluIERvYz8NCj4NCj4gTWVudGlvbmluZyB0aGlzIGluIHRo
ZSBkZXNjcmlwdGlvbiB3b3VsZCBoZWxwLiBZZXQgdGhlIHByb2Nlc3NvciBpZ25vcmluZyB0aGUg
b3RoZXIgUC0NCj4gc3RhdGUgY29udHJvbCBpbnRlcmZhY2Ugc2hvdWxkbid0IG1lYW4gd2UgY2Fu
IG5ldmVydGhlbGVzcyB0cnkgdG8gZHJpdmUgaXQuIEl0IGhhcyB0bw0KPiBiZSBjbGVhciAoYW5k
IGF0IGxlYXN0IGhhbGZ3YXkgb2J2aW91cykgaW50ZXJuYWxseSB0byBYZW4gdGhhdCB3ZSBvbmx5
IGV2ZXIgdXNlIG9uZQ0KPiBvZiB0aGUgdHdvLiBNeSBwcmVzZW50IHJlYWRpbmcgb2YgdGhlIHBh
dGNoZXMgc3VnZ2VzdHMgdGhhdCB0aGlzIGlzIGFsbCBpbXBsaWNpdCAoYW5kDQo+IG1heWJlIG5v
dCBldmVuIGd1YXJhbnRlZWQpIHJpZ2h0IG5vdy4NCg0KVW5kZXJzdG9vZCENCg0KPg0KPiBKYW4N
Cg==

