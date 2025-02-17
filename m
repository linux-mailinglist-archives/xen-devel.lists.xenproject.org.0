Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D13DA37C0C
	for <lists+xen-devel@lfdr.de>; Mon, 17 Feb 2025 08:21:06 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.889720.1298767 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tjvQg-0004AS-MR; Mon, 17 Feb 2025 07:20:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 889720.1298767; Mon, 17 Feb 2025 07:20:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tjvQg-00047m-Jg; Mon, 17 Feb 2025 07:20:34 +0000
Received: by outflank-mailman (input) for mailman id 889720;
 Mon, 17 Feb 2025 07:20:33 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=eS2x=VI=amd.com=penny.zheng@srs-se1.protection.inumbo.net>)
 id 1tjvQe-00047R-IA
 for xen-devel@lists.xenproject.org; Mon, 17 Feb 2025 07:20:32 +0000
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on20601.outbound.protection.outlook.com
 [2a01:111:f403:2415::601])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a9eb4ef9-ecff-11ef-9896-31a8f345e629;
 Mon, 17 Feb 2025 08:20:29 +0100 (CET)
Received: from DM4PR12MB8451.namprd12.prod.outlook.com (2603:10b6:8:182::7) by
 SN7PR12MB6672.namprd12.prod.outlook.com (2603:10b6:806:26c::5) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8445.16; Mon, 17 Feb 2025 07:20:26 +0000
Received: from DM4PR12MB8451.namprd12.prod.outlook.com
 ([fe80::b04e:2da5:7189:4c4d]) by DM4PR12MB8451.namprd12.prod.outlook.com
 ([fe80::b04e:2da5:7189:4c4d%6]) with mapi id 15.20.8445.017; Mon, 17 Feb 2025
 07:20:25 +0000
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
X-Inumbo-ID: a9eb4ef9-ecff-11ef-9896-31a8f345e629
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=F7HXGWjRQe6nQtg7QmaytU2HejAroWMnJPtUKSJYui1AiwWlg3P0ydSrcQyB6TUe3ZkiJEr8L324ym/6awbxjq5hKLt19s5GdZiRwghaCPQ4FtpPtSPlH+Dd4wdI58ZExoZaAPGBsvL/MUM9iYLqVu0NHRWrap2aR0c4ME+GIyMNEZGrvsybMlwHCP3Jq6PgfVcl4Odp0h1MVjW9fZQkEu5Nhk2GLxll3w0PlE9hqhfnBqOTcK19s+ivrIkmu/dvuXyzZPvrOuIrhOhLTaXR3kh+VSuiXZAZ0usLO+UUCWcnQUU3VtJzDI4QU7SxRoXD3xkV2aULF0KN4QJeAVGR9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=A4tPE/2EUEHa2uRIx1pH0B5mjbU6MmEVTnwVpS3f2cs=;
 b=VDfwQQhf3XEN8v+uVp180nB+ejcyFiQP79QZviBwgyvpriqy+bxRBCjTp2yU0i1aMLTy9Xh8ekAO2A1ifRmqmCFMhE/n2fC48CFCVnmgTlLuQqPXHtB4RnGpCzfK8c6laBvUfUMLS8HOfQqfH6I2UjF/U4U3oALRxsFcQCGwt7D3uETautzsr2PwKK6n/HY0/vKdqPQs000ntnFKuc5EKLRk4Nf5Hab1OHOaHKeaDrH/biOsu3vQ3hfwJOPjNsdjaOxHPQ9C5TDgcv3fjz/UM0Y/e3kGat5ZM7cfYCTuvZtQGyKjT+ndCxnwArJ2NgP8ibUAMSYWZrn32NVgzpE8jQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=A4tPE/2EUEHa2uRIx1pH0B5mjbU6MmEVTnwVpS3f2cs=;
 b=lOXdUNbS/VpepRf3wzrKxm74nQnJdym1F93srlLWle/nyIKZS6hith6uNLISXWIrxuXa9BLvx/0EbkkzJp2p6Gv2sgYRD2ZeT0yAmZf7uK6cO/A958r+65EWa4/Vv5puVYKGYVT6k/3K2oRp9nBO4hkV5kY83sig2eR8WlIolQo=
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
Thread-Index: AQHbeHHLxWVIgPijWEedM19MLd/Q4rNB+imAgAj8gkA=
Date: Mon, 17 Feb 2025 07:20:25 +0000
Message-ID:
 <DM4PR12MB8451A5DC8E389ECA2D8A3E1AE1FB2@DM4PR12MB8451.namprd12.prod.outlook.com>
References: <20250206083255.1296363-1-Penny.Zheng@amd.com>
 <20250206083255.1296363-3-Penny.Zheng@amd.com>
 <d3198e8c-2723-484c-b305-822a681d544b@suse.com>
In-Reply-To: <d3198e8c-2723-484c-b305-822a681d544b@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_ActionId=ab1f372a-c186-4f49-b62d-3d11421aa028;MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_ContentBits=0;MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Enabled=true;MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Method=Standard;MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Name=AMD
 Internal Distribution
 Only;MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_SetDate=2025-02-17T04:24:05Z;MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Tag=10,
 3, 0, 1;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR12MB8451:EE_|SN7PR12MB6672:EE_
x-ms-office365-filtering-correlation-id: f016e1fc-9965-48b7-66c3-08dd4f238ca8
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|376014|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?SXVDYVZ5TXZXdzdCdlFFTHRKaHptYysxY2ZVVGw2d0lBM011ZGhLOWg2NHd6?=
 =?utf-8?B?K1lDN0VSTGFKZWlmb3YzUjYyeDNOWE8velNYdEFzUmhVcnFVbFp4aFNqbk5h?=
 =?utf-8?B?Nmo5UUtJZnppWWsrS2ZnU2U4UU1ydHBOR3gyeUpjOTB6NW1Yc0NJa0lJR2ox?=
 =?utf-8?B?aXVIUHU5MXVtZDhrMko2U2xzSFp3WFE3ZmNLYVU5TE9ZanlxVnpKa3J1NVNL?=
 =?utf-8?B?VmlWUkFMK2xQYjh5RFdkazN6Y1RyMFFOUlFGMUhQSEJxZis5TUgveVd6NllF?=
 =?utf-8?B?cDBhL1FxeU5teGJkd1JJWWxERG52Szh2Ni9TbStaYzE5d3NjYUJzR296Z3Vh?=
 =?utf-8?B?VnN1VXg0ZnBHSkFDU0Z4RHl2SFFaQjdBTllWQkRoUUgzNHlTZkJQTGdVeHNs?=
 =?utf-8?B?bFJEYjZIUHViUnplditRaldFZXMvWGdGdGo3aG5wY2pZMmVqUzFoZllGcGky?=
 =?utf-8?B?OUFabGZwWjV3YVhjakhqVElqZWJJMVJsN3Q4WVVMNDdsSTQrcWRkbWpUbngv?=
 =?utf-8?B?NDRINGMxSmxySmlzaDd4bjZJOXVlSzFBUEx0eWtNelN0NVpwb0hYeTZ3YTVl?=
 =?utf-8?B?ZmhORkNsdFNic3B3RHQ1YWdmaTVIUS81dXlDell1a2V4UGlzSS9tZzR2ZTlz?=
 =?utf-8?B?SVNpc3VFbTkzM3B6ZVZEMXk1dXhONmJxZDVKTmVMRGJqQzlmYjdJaGxTeDNs?=
 =?utf-8?B?cFdNRVFVQ3pDZ2k5cm1mVm9yaS9wSDg4U0RwSXdydEVHWFNRaDZmYk9iSnVz?=
 =?utf-8?B?YjIvcU5jNUgrSDZMVEdoWGhlNENINXJlWlhOMUE3dlBvVnBVeXpOaXlyZExU?=
 =?utf-8?B?alNiRnJWUU5BVncxUHlPUE1RSFhQWmw3K2hLcEp4UGhXOGNST1l2dTFvTXM3?=
 =?utf-8?B?Q1ZvVHZRUEo0V3dXMnhjZWxiY05OS1p5QWJZZisycCtzQ0EzU3FpUW9zdGhi?=
 =?utf-8?B?S2dyaERoNXo2dTU5eTgreE5WSjdkNWhMdTVBdGJ5bGhDaGNFWnU3bEpjZmsy?=
 =?utf-8?B?S0FaS3ZjTHZSWVovb1RaOGZ0SzVnSjhhWHR1amtFTnUraVJ1My9nM1RnR1hq?=
 =?utf-8?B?cTNnZmczdW1MbWw3dUhSN2E3cnl3Vm8relN1dEVNU0FjRjRlUXprdkRKa1E1?=
 =?utf-8?B?TDhYakNvcUxqeWhnM0Q3dHNhbzZFckh4dnlUaTcxYlg4OXdZSHBYdVhzV1kr?=
 =?utf-8?B?ME9MQy8yakRZNUJ5OGZHb0ZsQW9OTFRGTk1WaFBoQTYybHdjRmdVenpVVFRj?=
 =?utf-8?B?TmM1cjlncWVRbSs5VTZMbkI4dktsZHlpeUZ6bHhyK3lRL0xpb3pYenBoMktp?=
 =?utf-8?B?RlJSZmVwMzgzV3JrY3pna0tza2RlMlpiNmFiM1h4dUNrSUxyeDRkY00yQWg5?=
 =?utf-8?B?MWJydFRDa29HN3pCMTVQK0hlSkcxVytPaFByeTJ3ZkxSeThwYnJNM0hONVF1?=
 =?utf-8?B?MUpieUhzUTcyTGZCS3hsV2hKYi9rdSs2aUhvWldsNW5yYmdGZTRPcjIwWFBy?=
 =?utf-8?B?ZzdHTFNpVklQUHlwc2x6Y1p6UllUSkhMbDF3YVAvMXNITXRNUk81QnRGUmV1?=
 =?utf-8?B?ZUNSN29JMFg2QUtwaUUwTDFEWjNmZ2RHY1daamhtWGJ4SnhUcXFmQ1pMeGkr?=
 =?utf-8?B?MUFuWEFzMU83Sk1SWDJXN3lNZHkwNlcvY0FTTms4YU15aW5hMzdaVnRHYVFK?=
 =?utf-8?B?REtHTHY3aDQzRmdiMUEwOFVVVGRjUFJadlROLzNCOStVclhLQzZQbFRHZXlJ?=
 =?utf-8?B?Rk9pZkFaQU1SRVFreVVzTmJ0VDRSZ0R3Y2NPek80Z1QyRmllcDVLdFdIaXJz?=
 =?utf-8?B?cmJUTVdFSnV3dkUyVVdhcWtHazRKbmZuVEVrVWhCQjgvOUZnY1p0UDB5RHh5?=
 =?utf-8?Q?4djDrkeiNLhAF?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR12MB8451.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?M1hMRUxsTURzN1QzWkp2VFU2d3NnT2lYUlk5RG5rTkNCQ2p6Vy9iVml1WjdM?=
 =?utf-8?B?RVVxYnhjL2FZZDFja1lXR0o2TGdCeG95SlhSaHVTbWFMMXcyZDQvU2Q5ZjFz?=
 =?utf-8?B?SmI0NWRXRmFlUC9La3dMWmhtbC9XdmNnbXZwQWd2dVZnSW5XTzZURmJIb3hP?=
 =?utf-8?B?Yjg1RU0xb1NDNE14SE40OUJrZ2RiL05YSWY4Nmw5VDk5b1lJTWtqWE1lWUsr?=
 =?utf-8?B?TnUwWDBMM2wxMThZNzlVa3Znbm9RQkJUZTRpT0lQOHhwbE43cmphL1ZSYzI4?=
 =?utf-8?B?S2taNGZLUzBXM2NjOWJyalhBWGozN0VlMmxmU2hQRGtoclAwbkc5NzRTL3o1?=
 =?utf-8?B?VDQ3TG5hbytJZHQ0MlNXRU5XRUpuRGVYWHVpb0puUTJyVUhlMHhxejB6THZN?=
 =?utf-8?B?TGo3L2pMTHd6ajNoR1Z1YjErQXRNdXN5dGJnZCtzNGczRERQVmpSYnlSTUN0?=
 =?utf-8?B?UFM2anFNMkZIVEsyOWdsOFc4Q0haU25aNjlCd0NJRnBUeVBuZGtPRms0LzRM?=
 =?utf-8?B?cENwYmJ0ZlFGYzdyN2tqaFVKMmlITjNIcFpDRnAxanJnVDQ2M3Fkd3Rpdjkw?=
 =?utf-8?B?VVRIRTJYSkk5NExxTmtvYmhZUEJpUVpiM2RNWXdnTU9IUHZnNlhKd0UvM1Fu?=
 =?utf-8?B?SDZhNWNFU3VlZ0JYMTh2QTUvMTgvQ2Q0akxhZmsybUJnUWVPNFNjM3BlUStq?=
 =?utf-8?B?N0plYVZrQTZmVjIzUTVDL0w0Y05HK3B1eHg2Smtqa0NrcGQxTkFEcmlyOGVW?=
 =?utf-8?B?OFdnYS9Wb3pQRGkydjlMV3kvMmdYbzRWTmlHMmk1b3A0SVVwdFMwNUM4YWhv?=
 =?utf-8?B?b1dzZDQ4R0M5Y2U5aG5JZXpib2ZqTE9VYk1yVWMrWlRHSXRtYmRmcDRXbnNw?=
 =?utf-8?B?cVJMZStiKzdWSTNOSkhIL25HQzNsNnhHcHlyYkdUZU0rUUFXRnhOQ1VFRWlj?=
 =?utf-8?B?K3dWSjJNWTFwakJaRTBOQnkzdTlrRW5RYVh1V1orbUlmU3VSY2FuU2VtQkpR?=
 =?utf-8?B?eUpkQXhNSStaQ2Y1L1U5dGxDa1FIbnhTTStpa1RzbTRxa2l1NUtrYVY1bXV0?=
 =?utf-8?B?UzRqeXdLc05DckF6dXRuUEYwTU43UFFBd3RBQ1l5YndDMElwM0hoSnZVK1NW?=
 =?utf-8?B?ck9kRm5lQzJybnRTZ2x5L3JFVzQ0eWxHNjljSTdvUk4wZnA2QXM5RTVvYTN0?=
 =?utf-8?B?emRqSkhNL2IrMXpHd2l3OE5aWFJSYmIzejExdHR2S0dLUXlyZ3FiRFRpNE1L?=
 =?utf-8?B?REtYazBkZ0w0Y09FY2drRlU4aHpPRmgxbndLYVFRT3lpNVVTWHMvVDRHQUVp?=
 =?utf-8?B?Wmwxc3plTmJpN1pFd3JsdWlNRGRjWGRocHZlMlU1RG9JSDBBZkRJWENiQ29B?=
 =?utf-8?B?anJuQXRMdzNjTU0xb3hjNUFsZldPTUZ1N3pHc2g3ZGxZZ2JJTVg1U3R4RVdL?=
 =?utf-8?B?RnZvaFVsQVlXczZRVnpUcFBndlYvczZsaVJja1JjcFAvTmswVEMxb29jeXI5?=
 =?utf-8?B?Wk5LNTZ1MXNYYkZNNW5BREhHMVZLUTJPeGZ5Uk5scFlCWTBObmlyb09Eczlz?=
 =?utf-8?B?akJYYzZLY2pzeEI2Q1drYy9va1ZkVm11SlRreEI5eG01TS9HdWhHbHR1UnFr?=
 =?utf-8?B?THRhQ2Z1NUJrTStZRWRHejRzbEwrVVh5eDY1bCtwblpvYnNZTE5TNXBnd3RF?=
 =?utf-8?B?VmJTT21idTVTQ21BdmxhTFpqVHZDdTZWcGZpaXhKK0YvMEtmeDB3bnpjT0Mr?=
 =?utf-8?B?KzAreVZNSzZkb0pLOGRMd2ozSnNUOGRmVm5IMERXanNoZ1ljang5UTRoQkp3?=
 =?utf-8?B?ck1qeFZ4ZkZiR1dVRktpaDZXSFNIQlViSlMvRFplR2FDREJna3FDRG1VZGpB?=
 =?utf-8?B?QkMvK2FYUUc2UVg5TEd6a1ZxZDRpWCtpZkFYRmVRQlh6UVpNb2plU3k5Ylp0?=
 =?utf-8?B?M2pMbnQxTm1wUFJyZTMxZHQ5MzlCaTFrbjdPNUxUU2R4Z05VLyszTGhsaDI0?=
 =?utf-8?B?c0Q4NlN3cko1NHBlR1pscmRqWmtqTXdrNzlpdFdWU2xOTk80MnFSRnJ2WHdC?=
 =?utf-8?B?d0dwM2p5WmVCUUtvRWh0SUh0c2cwMjQvQ0paZ2sxSVg4cGI5SElKSklRZnQz?=
 =?utf-8?Q?D/BM=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB8451.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f016e1fc-9965-48b7-66c3-08dd4f238ca8
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Feb 2025 07:20:25.8711
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: X6Kiakm0P9lXj0esAYsf601Ps0JMpnHjcp+ywX3numTC/G8UDiz44lIbSJAzAVY17JP3BgGEPLPxvpgrJ9KEYw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB6672

W0FNRCBPZmZpY2lhbCBVc2UgT25seSAtIEFNRCBJbnRlcm5hbCBEaXN0cmlidXRpb24gT25seV0N
Cg0KSGksDQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogSmFuIEJldWxp
Y2ggPGpiZXVsaWNoQHN1c2UuY29tPg0KPiBTZW50OiBUdWVzZGF5LCBGZWJydWFyeSAxMSwgMjAy
NSA3OjEwIFBNDQo+IFRvOiBQZW5ueSwgWmhlbmcgPHBlbm55LnpoZW5nQGFtZC5jb20+DQo+IENj
OiBIdWFuZywgUmF5IDxSYXkuSHVhbmdAYW1kLmNvbT47IEFuZHJ5dWssIEphc29uDQo+IDxKYXNv
bi5BbmRyeXVrQGFtZC5jb20+OyBBbmRyZXcgQ29vcGVyIDxhbmRyZXcuY29vcGVyM0BjaXRyaXgu
Y29tPjsNCj4gUm9nZXIgUGF1IE1vbm7DqSA8cm9nZXIucGF1QGNpdHJpeC5jb20+OyBBbnRob255
IFBFUkFSRA0KPiA8YW50aG9ueS5wZXJhcmRAdmF0ZXMudGVjaD47IE9yemVsLCBNaWNoYWwgPE1p
Y2hhbC5PcnplbEBhbWQuY29tPjsgSnVsaWVuDQo+IEdyYWxsIDxqdWxpZW5AeGVuLm9yZz47IFN0
ZWZhbm8gU3RhYmVsbGluaSA8c3N0YWJlbGxpbmlAa2VybmVsLm9yZz47IHhlbi0NCj4gZGV2ZWxA
bGlzdHMueGVucHJvamVjdC5vcmcNCj4gU3ViamVjdDogUmU6IFtQQVRDSCB2MiAwMi8xMV0geGVu
L3g4NjogaW50cm9kdWNlIG5ldyBzdWItaHlwZXJjYWxsIHRvIHByb3BhZ2F0ZQ0KPiBDUFBDIGRh
dGENCj4NCj4gT24gMDYuMDIuMjAyNSAwOTozMiwgUGVubnkgWmhlbmcgd3JvdGU6DQo+ID4gLS0t
IGEveGVuL2FyY2gveDg2L3BsYXRmb3JtX2h5cGVyY2FsbC5jDQo+ID4gKysrIGIveGVuL2FyY2gv
eDg2L3BsYXRmb3JtX2h5cGVyY2FsbC5jDQo+ID4gQEAgLTU3Miw2ICs1NzIsMTAgQEAgcmV0X3Qg
ZG9fcGxhdGZvcm1fb3AoDQo+ID4gICAgICAgICAgICAgIGJyZWFrOw0KPiA+ICAgICAgICAgIH0N
Cj4gPg0KPiA+ICsgICAgICAgIGNhc2UgWEVOX1BNX0NQUEM6DQo+ID4gKyAgICAgICAgICAgIHJl
dCA9IHNldF9jcHBjX3BtaW5mbyhvcC0+dS5zZXRfcG1pbmZvLmlkLA0KPiA+ICsgJm9wLT51LnNl
dF9wbWluZm8udS5jcHBjX2RhdGEpOw0KPg0KPiBOaXQ6IFRvbyBsb25nIGxpbmUuDQo+DQo+ID4g
LS0tIGEveGVuL2FyY2gveDg2L3g4Nl82NC9jcHVmcmVxLmMNCj4gPiArKysgYi94ZW4vYXJjaC94
ODYveDg2XzY0L2NwdWZyZXEuYw0KPiA+IEBAIC0yNiw2ICsyNiw4IEBADQo+ID4gICNpbmNsdWRl
IDx4ZW4vcG1zdGF0Lmg+DQo+ID4gICNpbmNsdWRlIDxjb21wYXQvcGxhdGZvcm0uaD4NCj4gPg0K
PiA+ICtDSEVDS19wcm9jZXNzb3JfY3BwYzsNCj4gPiArDQo+ID4gIENIRUNLX3Byb2Nlc3Nvcl9w
eDsNCj4NCj4gTWF5IEkgYXNrIHRoYXQgeW91IGluc2VydCBiZWxvdyB0aGUgcHJlLWV4aXN0aW5n
IENIRUNLXyogcmF0aGVyIHRoYW4gYWJvdmU/DQo+IE9yIHdhaXQgLSBtYXliZSB5b3Ugd2VyZSBh
aW1pbmcgYXQgc29ydGluZyB0aGVzZSBhbHBoYWJldGljYWxseT8gVGhhdCB3b3VsZA0KPiBwZXJo
YXBzIGJlIGZpbmUgdGhlbi4NCj4NCg0KWWVzLCBJIGludGVuZGVkIHRvIHNvcnQgdGhlc2UgYWxw
aGFiZXRpY2FsbHkNCg0KPiA+ICt7DQo+ID4gKyAgICBpbnQgcmV0ID0gMCwgY3B1aWQ7DQo+ID4g
KyAgICBzdHJ1Y3QgcHJvY2Vzc29yX3BtaW5mbyAqcG1faW5mbzsNCj4gPiArDQo+ID4gKyAgICBj
cHVpZCA9IGdldF9jcHVfaWQoYWNwaV9pZCk7DQo+ID4gKyAgICBpZiAoIGNwdWlkIDwgMCB8fCAh
Y3BwY19kYXRhICkNCj4gPiArICAgIHsNCj4gPiArICAgICAgICByZXQgPSAtRUlOVkFMOw0KPiA+
ICsgICAgICAgIGdvdG8gb3V0Ow0KPiA+ICsgICAgfQ0KPiA+ICsgICAgaWYgKCBjcHVmcmVxX3Zl
cmJvc2UgKQ0KPiA+ICsgICAgICAgIHByaW50aygiU2V0IENQVSBhY3BpX2lkKCVkKSBjcHVpZCgl
ZCkgQ1BQQyBTdGF0ZSBpbmZvOlxuIiwNCj4gPiArICAgICAgICAgICAgICAgYWNwaV9pZCwgY3B1
aWQpOw0KPiA+ICsNCj4gPiArICAgIHBtX2luZm8gPSBwcm9jZXNzb3JfcG1pbmZvW2NwdWlkXTsN
Cj4gPiArICAgIGlmICggIXBtX2luZm8gKQ0KPiA+ICsgICAgew0KPiA+ICsgICAgICAgIHBtX2lu
Zm8gPSB4dnphbGxvYyhzdHJ1Y3QgcHJvY2Vzc29yX3BtaW5mbyk7DQo+ID4gKyAgICAgICAgaWYg
KCAhcG1faW5mbyApDQo+ID4gKyAgICAgICAgew0KPiA+ICsgICAgICAgICAgICByZXQgPSAtRU5P
TUVNOw0KPiA+ICsgICAgICAgICAgICBnb3RvIG91dDsNCj4gPiArICAgICAgICB9DQo+ID4gKyAg
ICAgICAgcHJvY2Vzc29yX3BtaW5mb1tjcHVpZF0gPSBwbV9pbmZvOw0KPiA+ICsgICAgfQ0KPiA+
ICsgICAgcG1faW5mby0+YWNwaV9pZCA9IGFjcGlfaWQ7DQo+ID4gKyAgICBwbV9pbmZvLT5pZCA9
IGNwdWlkOw0KPiA+ICsgICAgcG1faW5mby0+Y3BwY19kYXRhID0gKmNwcGNfZGF0YTsNCj4gPiAr
DQo+ID4gKyAgICBpZiAoIGNwdWZyZXFfdmVyYm9zZSApDQo+ID4gKyAgICAgICAgcHJpbnRfQ1BQ
QygmcG1faW5mby0+Y3BwY19kYXRhKTsNCj4gPiArDQo+ID4gKyBvdXQ6DQo+ID4gKyAgICByZXR1
cm4gcmV0Ow0KPiA+ICt9DQo+DQo+IFdoYXQncyB0aGUgaW50ZXJhY3Rpb24gYmV0d2VlbiB0aGUg
ZGF0YSBzZXQgYnkgc2V0X3B4X3BtaW5mbygpIGFuZCB0aGUgZGF0YSBzZXQNCj4gaGVyZT8gSW4g
cGFydGljdWxhciwgd2hhdCdzIGdvaW5nIHRvIGhhcHBlbiBpZiBib3RoIGZ1bmN0aW9ucyBjb21l
IGludG8gcGxheSBmb3IgdGhlDQo+IHNhbWUgQ1BVPyBTaG91bGRuJ3QgdGhlcmUgYmUgc29tZSBz
YW5pdHkgY2hlY2tzPw0KDQpZZXMsIEkndmUgY29uc2lkZXJlZCB0aGlzIGFuZCBjaGVja2VkIEFD
UEkgc3BlYy4gSSdsbCByZWZlciB0aGVtIGhlcmU6DQpgYGANCklmIHRoZSBwbGF0Zm9ybSBzdXBw
b3J0cyBDUFBDLCB0aGUgX0NQQyBvYmplY3QgbXVzdCBleGlzdCB1bmRlciBhbGwgcHJvY2Vzc29y
IG9iamVjdHMuDQpUaGF0IGlzLCBPU1BNIGlzIG5vdCBleHBlY3RlZCB0byBzdXBwb3J0IG1peGVk
IG1vZGUgKENQUEMgJiBsZWdhY3kgUFNTLCBfUENULCBfUFBDKSBvcGVyYXRpb24uDQpgYGANClNl
ZSBodHRwczovL3VlZmkub3JnL3NwZWNzL0FDUEkvNi41LzA4X1Byb2Nlc3Nvcl9Db25maWd1cmF0
aW9uX2FuZF9Db250cm9sLmh0bWw/aGlnaGxpZ2h0PWNwcGMjcG93ZXItcGVyZm9ybWFuY2UtYW5k
LXRocm90dGxpbmctc3RhdGUtZGVwZW5kZW5jaWVzDQpTbyBDUFVzIGNvdWxkIGhhdmUgYm90aCBf
Q1BDIGFuZCBsZWdhY3kgUC1zdGF0ZSBpbmZvIGluIEFDUEkgZm9yIGVhY2ggZW50cnksIHRoZXkg
anVzdCBjYW4ndCBoYXZlIG1peGVkLW1vZGUNCk1heWJlIHdlIHNoYWxsIGFkZCBzYW5pdHkgY2hl
Y2sgdG8gc2VlIGlmIF9DUEMgZXhpc3RzLCBpdCBzaGFsbCBleGlzdCBmb3IgYWxsIHBjcHVzPw0K
DQo+IFdpbGwgY29uc3VtZXJzIGJlIGFibGUgdG8gdGVsbCB3aGljaCBvZiB0aGUgdHdvIHdlcmUg
Y29ycmVjdGx5IGludm9rZWQsIGJlZm9yZSB1c2luZw0KPiByZXNwZWN0aXZlIGRhdGE/IEV2ZW4g
aW4gdGhlIGV2ZW50IG9mIG5vIGNvZGUgY2hhbmdlcyBhdCBhbGwgdG8gYWRkcmVzcyB0aGlzLCBp
dCB3aWxsDQo+IHdhbnQgZGlzY3Vzc2luZyBpbiB0aGUgcGF0Y2ggZGVzY3JpcHRpb24uDQo+DQoN
CkkgaGF2ZSBjaGVja2VkIHRoZSByZWxldmFudCBzcGVjLiBpdCBzaGFsbCBiZSB0aGUgZm9sbG93
aW5nIGxvZ2ljOg0KYGBgDQpTb2Z0d2FyZSBlbmFibGVzIENvbGxhYm9yYXRpdmUgUHJvY2Vzc29y
IFBlcmZvcm1hbmNlIENvbnRyb2wgYnkgc2V0dGluZw0KQ1BQQ19FTkFCTEVbQ1BQQ19Fbl0gKGJp
dCAwKSA9IDEuIE9uY2UgaXQgZ2V0cyBlbmFibGVkLCB0aGUgcHJvY2Vzc29yIGlnbm9yZXMgdGhl
IGxlZ2FjeSBQLXN0YXRlIGNvbnRyb2wgaW50ZXJmYWNlLg0KYGBgDQpIbW1tLCBJIHNoYWxsIGFk
ZCByZWxldmFudCBjb21tZW50IGluIERvYz8NCg0KPg0KPiBKYW4NCg0KTWFueSB0aGFua3MsDQpQ
ZW5ueQ0K

