Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8320B926DDE
	for <lists+xen-devel@lfdr.de>; Thu,  4 Jul 2024 05:04:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.753399.1161633 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sPCl5-00062k-Ht; Thu, 04 Jul 2024 03:03:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 753399.1161633; Thu, 04 Jul 2024 03:03:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sPCl5-00060Z-F1; Thu, 04 Jul 2024 03:03:43 +0000
Received: by outflank-mailman (input) for mailman id 753399;
 Thu, 04 Jul 2024 03:03:42 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=IA8J=OE=amd.com=Jiqian.Chen@srs-se1.protection.inumbo.net>)
 id 1sPCl4-00060T-LG
 for xen-devel@lists.xenproject.org; Thu, 04 Jul 2024 03:03:42 +0000
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on20601.outbound.protection.outlook.com
 [2a01:111:f403:2416::601])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 02f4b065-39b2-11ef-bbf9-fd08da9f4363;
 Thu, 04 Jul 2024 05:03:41 +0200 (CEST)
Received: from BL1PR12MB5849.namprd12.prod.outlook.com (2603:10b6:208:384::18)
 by DS0PR12MB9348.namprd12.prod.outlook.com (2603:10b6:8:1a0::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7741.25; Thu, 4 Jul
 2024 03:03:33 +0000
Received: from BL1PR12MB5849.namprd12.prod.outlook.com
 ([fe80::b77f:9333:3a5a:d285]) by BL1PR12MB5849.namprd12.prod.outlook.com
 ([fe80::b77f:9333:3a5a:d285%3]) with mapi id 15.20.7719.029; Thu, 4 Jul 2024
 03:03:33 +0000
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
X-Inumbo-ID: 02f4b065-39b2-11ef-bbf9-fd08da9f4363
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RdW1GDJJb99V8mQtbx/VAq7Tx1vWoYMydRH5Ybg/3qdqe2isWQ5XPO1zkbxdVJKD8yIDN3o0pXUWJ10qyWMNdDxIVFXu6tjmgdd3XA6X3YewEbtkQrX8pc50BgvRTE3vpsmCdYnrpnoM2y+ugOIvX5Nr7SGut4zw0puIpROzsqSrOQCiqH+LfN+Z1+V3TZIPW09mzGgoQVYr4dth4r2hAhVLR0rn7n7wttSNICSCRUAGWeonA8oLO0uWKSEp2+L1FDdlW4LH0m5hWzM3DoxSyemju3SF+fn4dzQnXFndaWU1DTYzdzIBenRF9MtWb+F6AY5cPPAStpr854gpcWyc8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0ZYjynGsoSFoz0htLmbACSNtfQnTyz8AgRZKLv/fBn4=;
 b=COBGS/mG7eFBEypceJaritB9OJ2/vCbc4fGAjrTyIxyjpzr2jlvGmDbEbyuN7jfNyIhJdWzbHgypfogZ6wyrV1Snw2BYilbzsTK9FDObhGOjkPS4bHRd5VwMrDPt8AHRwCuBGNGAftESGABsttNtJDwTZpCS8/UhaZnLPPECp478PNibqMzovi7S+dEdBkJ7xzDEk98OZ3mXC7ZlaE+XM1Ng3ACfoTaurpfNVxOn9woGPJGfHxbqnjVoD3W7pppWBWa875a0iZ0Er+hX+JhVkt3+vs/o9e2v01ZCVT+/30JEuaCeBRYXEKvB9iXns/AhANdVXzKVwPw37grQlv360w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0ZYjynGsoSFoz0htLmbACSNtfQnTyz8AgRZKLv/fBn4=;
 b=4SqdZohyI4WFJGlf2A60MK9BeTk/q1Q19uj9o8+38hzMa57vnfgKkHY5G8oLJuSqZgBIsKCkl0xCq6nh1msaxZaZwwwNtbfJkZ6jzFxR/7FWu8qUS9PDGXik++zmmw9gaPGvxHtuHP8eJ8lNCJt1ICwk+8NZf7gL/pqlIRbIovo=
From: "Chen, Jiqian" <Jiqian.Chen@amd.com>
To: Anthony PERARD <anthony@xenproject.org>
CC: Jan Beulich <jbeulich@suse.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>, George Dunlap
	<gwd@xenproject.org>, Julien Grall <julien@xen.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Juergen Gross <jgross@suse.com>, "Daniel P . Smith"
	<dpsmith@apertussolutions.com>, "Hildebrand, Stewart"
	<Stewart.Hildebrand@amd.com>, "Huang, Ray" <Ray.Huang@amd.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, "Chen,
 Jiqian" <Jiqian.Chen@amd.com>
Subject: Re: [RFC XEN PATCH v11 7/8] tools: Add new function to get gsi from
 dev
Thread-Topic: [RFC XEN PATCH v11 7/8] tools: Add new function to get gsi from
 dev
Thread-Index: AQHayundYHEz4Kn0sEizSQnui4wvzbHhe8EAgAHYIoCAAxhTAA==
Date: Thu, 4 Jul 2024 03:03:33 +0000
Message-ID:
 <BL1PR12MB5849FCBC958FA5F52262489EE7DE2@BL1PR12MB5849.namprd12.prod.outlook.com>
References: <20240630123344.20623-1-Jiqian.Chen@amd.com>
 <20240630123344.20623-8-Jiqian.Chen@amd.com>
 <ff827def-743c-4312-88fb-dbd1b87bb85d@suse.com>
 <BL1PR12MB5849626196B8DE37E0BA4F20E7DC2@BL1PR12MB5849.namprd12.prod.outlook.com>
In-Reply-To:
 <BL1PR12MB5849626196B8DE37E0BA4F20E7DC2@BL1PR12MB5849.namprd12.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-exchange-imapappendstamp: BL1PR12MB5849.namprd12.prod.outlook.com
 (15.20.7719.007)
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BL1PR12MB5849:EE_|DS0PR12MB9348:EE_
x-ms-office365-filtering-correlation-id: 2374e4f0-fb58-4323-19ed-08dc9bd5e40d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|1800799024|7416014|376014|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?Y2w2YjIrSHpqYlp2ZndydmZXWWNJZDJTTnlUa3MxM3JTSEhWaE4yNTFYSEVK?=
 =?utf-8?B?RFlSYVFkZEZlaGZFTFNzMitxb2NNMklpTHdSRkE0Z2oxa2t5akxyYWZESjkx?=
 =?utf-8?B?RGhTVEZ0d3BET0ZPaVFoUzR5SG1rOExpZXZROFlFblQ1WjVGcmluVU9QRzl5?=
 =?utf-8?B?MlRJR2VWMUZYQXZiWkhwWHBrL2F4N29rdXJYN3NoRjNRa3B6Q0pIRU9JbE8x?=
 =?utf-8?B?aGVXMHhGOGJWa3pYZzVlWHA4VjBiQ2FuaXVtZ05IY2VoZFEwWWNVMmFhTmp1?=
 =?utf-8?B?WDJmTFhSZitBeUZTMGlicW1RbUJ6My9nTm9ua3N3Tk45RkNtd2hCS1J0S3Ft?=
 =?utf-8?B?YVdoM1hERmY2UE9oSGFjMHF4OFhVTHRBOVRhNDdtMDhMd1BXd3A3Wk45K095?=
 =?utf-8?B?RkJCSTh5dXdJd3N5c1dBUUEyYVQwSHdaOTlNdFh3QVJNejZoZGFvK2VhaFpi?=
 =?utf-8?B?dDRzS1czbDNmWHB5OVIvVFNwTGJjTGZkcjBzVDU3ZnE2OTIzbjdRMVVoUVpt?=
 =?utf-8?B?UUtheXBKL0NPN3pHKy9GcW9MUGh5d1F2Z2dqUUdKNHljQU1EVTNMbUxlNmZm?=
 =?utf-8?B?L1JjLzVvT21FbkRBMmtUbDZ3WEpWL3N5aCt5ZVhsZjlmNjN0UWZQQThQek1X?=
 =?utf-8?B?ME1sUm1BV3AwbmRkK3VpeW5MOS83R1ZTTGN0R0EzVEJhUXM4Nk5BbWNDemMx?=
 =?utf-8?B?ekQ0QitPNkgvUXVSb0xWY0NMMzBRcTlra3JYM3YwSlJ6cGx5UERUKzVmUHJP?=
 =?utf-8?B?aEpLOTk1WjFXOFRRUXBlUFRJaHQ2bTZLVGc3eVBYMTBmY255eTdySkxsSzRB?=
 =?utf-8?B?R3JNRU9lWElNTElaZkZQQ1Fpb3NCdEhSRVpQdDJwSHlUK0VjZ1AzVURrTCtz?=
 =?utf-8?B?UEpFQ0RNb2JVRmcyelAxTlBrd0pLeG9EclpoUXlwTnlmeFlGTmtQUEVleDFF?=
 =?utf-8?B?bG9HRjh4R3J4SEtQZ0VZNHBiNFVmRHkzc3U4UGpuMDlkUUdLMU4xRmZwdHl1?=
 =?utf-8?B?eGhVRFl0ZTdNLzgydzNDYzZWYVpwMGZvS0JTdkJoMVZIWElQeFYxUVlNMjIv?=
 =?utf-8?B?KzkyNDhYdlBEZm12TFZkZXN6UDZ1VGRDaHZiM2xhOHVJVGVCeFhNMHBlclIv?=
 =?utf-8?B?VWYrMjgxSDlldkM1UEFWaERja1VYTlFyNHFOSk1QZnZJd0I3M3Z6eW5KOTJP?=
 =?utf-8?B?M0pmVHpZOTlKc3VBNmFwVWJzK2M0bDA2akZ2ZkczN0NFWXV4V1RySWkwRDFR?=
 =?utf-8?B?TllJVUxRZVVjbFpGTUM0Yk5EbHZkaW9tOTVtK0RtUTFzbWpSRmxnUW84VGI2?=
 =?utf-8?B?NkVjZDM5L1VLQ3RGR2NlbmZqV0pLNXJmUTRZUEx2SVAyS29iQVZvbzhSTHFa?=
 =?utf-8?B?eFhPelNBUDRSSGx1QjlhWmZheDUyT2NjcUE4SzZuNU96L1drWTBUOUpZQTJt?=
 =?utf-8?B?WE5sK1B4NkZlOFpTeUt1dVJlUXV0NFM2Q3BOZURQQUxCay85QUloRGlyNTk5?=
 =?utf-8?B?R21MUUNCUGQzWG1kRGZtMDRmaGhNQjRiNFA1cGhqdnYxeEdlaFJRQ09lYThB?=
 =?utf-8?B?TmxPVkJsSG9KUFVRMjBIYUNTMnc4dUVaVFlDZm9FbW1HUFVTbnVDWEdzL2E0?=
 =?utf-8?B?RURDSE1ocThseldVN1kyTWlmdm40WWdNUTNaYUw0Vkp6NVdLcXBVelIwMW5m?=
 =?utf-8?B?M0gzV3E3Z0pHZXZ2Q1JRWW9iNzZSNnNJR1RmZ3lqUEVoaTJoVWwxcW10dUlT?=
 =?utf-8?B?WU1udG52RE1TY1Q0Qmh3NHZTeVFHc1pyR1ZjMmk1TTZndXh5V0JZUkt3eVJl?=
 =?utf-8?B?bkkxTzJ3b0Y3QVRkMUFqaWJidVU4c0NlTEgrRnYyNXRoa2V6blI2czlIc3k2?=
 =?utf-8?B?eDZzY1pJb0d2Qzl4SXN6Q2UwditpQVBLNy94V3A3Qjhucmc9PQ==?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR12MB5849.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?TVI4MndlVjBMVVJHNlZIa29mamRmZnBBa2U5U2xnSk8vMlVVNVg5YVdHbWxs?=
 =?utf-8?B?WWExcDN6UGF6Q21VWloxcDlGTjhTRHR0YXNEMXRscGRqVGthbTN0enpOVDhC?=
 =?utf-8?B?MzIvWFdqYldsRG1XVjZNWFlWa0Iwb3cyREFpTWM1RTByRVBMdWxnblh0RWtD?=
 =?utf-8?B?U3g2bzhlV2pIc3ZrNmNLYVNRY0dwc3BZVUQvcHV5T0ZyV1pIeGM1MDJnaVI3?=
 =?utf-8?B?bG1tdERROGJWSmkrVlBUTDdlTm5ISU85VHB3ZXpxaUoxTWd4NUUxRWFMMnBT?=
 =?utf-8?B?VVBEUUlmaU03akRqN005SDBHMTVvWGtqQWl3ZTUxa25ZaGx6UXdkSURmcFdE?=
 =?utf-8?B?Q0l1N2htcFNCVmljZjhnT0V0Sm1NdTdXanRsVGp6TkVEa3Bwb3lSVVI5b0ps?=
 =?utf-8?B?Nm1WbUtuNlcrZ09oUjVJbkJDSGw3czhFekhVaHBuQXZwOE5rQ01sTXoxS3p5?=
 =?utf-8?B?U2hXOEdLTmpvWEZuMk91TVJmaVNlWTVOa2l4ZElINTFrc1p5SE9ISm85enBZ?=
 =?utf-8?B?K0RtSHIyV2VHaFY4cXFCMGorMDU1MTVPcktDZFJWMGk0S3pRd3dsa3czV1Nr?=
 =?utf-8?B?QkF4aVZoMmljWVBBRGVZelN6K0VIanZDYXlKMXhEeUZjemZ5QmxsZHhiL3hP?=
 =?utf-8?B?TDZkaUl2cDlkOW42MytqZDJlY0RseTBSdmFxemR0ajVXZ1FPOVBOR0hlOGNu?=
 =?utf-8?B?c3BBNngyWXlyTlluWkFDcGx6RThUcC9CUWoveGh6NHJSRm5rSFNzQzA4RDdG?=
 =?utf-8?B?cjcrTGl4b3RZVGNmOWxZMklqNGVTaUVYV1ErdEhSdnFNUFZ3aGNNQ2VTa2Fu?=
 =?utf-8?B?clUwam83REZ6dUtJNW1kRU1NMEloY1F6elpYK2h2blJCVWxQakRseERaZ3pC?=
 =?utf-8?B?YjhKZ0Q0VEI4VzhVVEpLdjkxMTlxZm5wWFZiTU9RNUZJZ25ONTU0VVdPSmFh?=
 =?utf-8?B?SWdjcFZ4QnIzVTNDRzlVSld4bWc2bGFTZzNzekFYdzl6Y1VoM3lqbWFJQzBs?=
 =?utf-8?B?dmFOTzZYWHQ4aVNoN0c5ZEw0b2NDUUtKQzVpT1laaFN2VVBTZFA5bFlVQkhU?=
 =?utf-8?B?cFc0bVpZbGloVjBvdGpzMVZoYTlmVmdUNUZQQ0hvNW5GMmF0YzlDQ2k5eFcv?=
 =?utf-8?B?Yi9ueURNU0ZNWnFVZ25VOFp3UVNabTB6RTlIWm04NFJUYTRNM0ZjWC9XWUx3?=
 =?utf-8?B?V1kxM1lvK1ZhNHpCVTNMZGUvSVdLUEJvRXQrdjM4akRwRlRJZnNtVjVPYVhG?=
 =?utf-8?B?akFFZFZEdHhSWllNZmQxUEQzd1o2UEtzQW5jTVpmdXA5TzRuOExDK3pDbGVs?=
 =?utf-8?B?SXRiUk5aei9OQnROaUdKTkFRdExteVlGOTdUaVc3VEJtN2hhVVVJa2NieWFx?=
 =?utf-8?B?bmMzd29ScEZWS2FxSkNyODI4cHpXQ01Td0szWFdvV1FPbEdOUlMyN1N1TGZT?=
 =?utf-8?B?M09zbmxQbk00eTNaQ3hxNmhOdUJCNFU5UW5jdExlaUdZNW9DYVJtT1Z0SzRt?=
 =?utf-8?B?amszNVdRR2djTkkrYm1oM2hmaWR2dndVWUNjN0RpVmk2dE9aZzhtRkF5ZXpH?=
 =?utf-8?B?bGFDWDQzZmhIcXQ4MHNDci96MHlnQmk3dEhyNGlsTDBmRWlUVklrV1U5aHdF?=
 =?utf-8?B?SDBvQU1ralRrTkNrbkV3bndUMStuVmZpaGJsTEJPNDUzMCtTRms5REdnekpj?=
 =?utf-8?B?cUVsSlRrZEZMamRkaVk0YTM0SWVpTkZYdFI1cnkwcGY3Njd1ZElOZTlVYnVz?=
 =?utf-8?B?cnIvVld6Vk9qYzB3ell4RDZ1ZkQvTmlIeDRqbHNqcjNtRDk1VFZTWUZCbDlW?=
 =?utf-8?B?cmpudk9OZUVUWmpHUGdNS1hWQldBOFBhUHphaXZoWmxlNERDN1JETHRCYkJa?=
 =?utf-8?B?Z0Mxd2VWbGxFSFhTOGFCWmNCZ2R5b09UenBXdThJbmtaWE96WENpYU42Nlc1?=
 =?utf-8?B?T0Y4dllQSVB1c2lJQW84aVNWeWtqRyt3MTVMNU5reHBySzhzU2QxNXRhMElZ?=
 =?utf-8?B?cjRtdHBLSjVPR1hrTFA5a0ZMQm4xQUFFNW5ML0RnR3J6OStlTEU0UzJuVy9n?=
 =?utf-8?B?Ti8vaUx6TnVmV0I4bU9QYU91dWUxU1lNVFZrZVJxamwyMDdNRHA0VmxjZ09C?=
 =?utf-8?Q?SaUM=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <29D4B964F6996D48AA4B356CC950C41D@amdcloud.onmicrosoft.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5849.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2374e4f0-fb58-4323-19ed-08dc9bd5e40d
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Jul 2024 03:03:33.5896
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: aRVsE/VVldAg3ViCG3GfX1Tny54Q21pcCJ7cr4Kt7cWkGxrtOXo95EX6CE/+j/+05DRx5lN0iCIg4gZm+sejgA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB9348

SGkgQW50aG9ueSwNCg0KT24gMjAyNC83LzIgMTE6NDcsIENoZW4sIEppcWlhbiB3cm90ZToNCj4g
T24gMjAyNC83LzEgMTU6MzIsIEphbiBCZXVsaWNoIHdyb3RlOg0KPj4gT24gMzAuMDYuMjAyNCAx
NDozMywgSmlxaWFuIENoZW4gd3JvdGU6DQo+Pj4gLS0tIGEvdG9vbHMvbGlicy9jdHJsL3hjX3Bo
eXNkZXYuYw0KPj4+ICsrKyBiL3Rvb2xzL2xpYnMvY3RybC94Y19waHlzZGV2LmMNCj4+PiBAQCAt
MTExLDMgKzExMSwzOCBAQCBpbnQgeGNfcGh5c2Rldl91bm1hcF9waXJxKHhjX2ludGVyZmFjZSAq
eGNoLA0KPj4+ICAgICAgcmV0dXJuIHJjOw0KPj4+ICB9DQo+Pj4gIA0KPj4+ICtpbnQgeGNfcGh5
c2Rldl9nc2lfZnJvbV9wY2lkZXYoeGNfaW50ZXJmYWNlICp4Y2gsIHVpbnQzMl90IHNiZGYpDQo+
Pj4gK3sNCj4+PiArICAgIGludCByYyA9IC0xOw0KPj4+ICsNCj4+PiArI2lmIGRlZmluZWQoX19s
aW51eF9fKQ0KPj4+ICsgICAgaW50IGZkOw0KPj4+ICsgICAgcHJpdmNtZF9nc2lfZnJvbV9wY2lk
ZXZfdCBkZXZfZ3NpID0gew0KPj4+ICsgICAgICAgIC5zYmRmID0gc2JkZiwNCj4+PiArICAgICAg
ICAuZ3NpID0gMCwNCj4+PiArICAgIH07DQo+Pj4gKw0KPj4+ICsgICAgZmQgPSBvcGVuKCIvZGV2
L3hlbi9wcml2Y21kIiwgT19SRFdSKTsNCj4+PiArDQo+Pj4gKyAgICBpZiAoZmQgPCAwICYmIChl
cnJubyA9PSBFTk9FTlQgfHwgZXJybm8gPT0gRU5YSU8gfHwgZXJybm8gPT0gRU5PREVWKSkgew0K
Pj4+ICsgICAgICAgIC8qIEZhbGxiYWNrIHRvIC9wcm9jL3hlbi9wcml2Y21kICovDQo+Pj4gKyAg
ICAgICAgZmQgPSBvcGVuKCIvcHJvYy94ZW4vcHJpdmNtZCIsIE9fUkRXUik7DQo+Pj4gKyAgICB9
DQo+Pj4gKw0KPj4+ICsgICAgaWYgKGZkIDwgMCkgew0KPj4+ICsgICAgICAgIFBFUlJPUigiQ291
bGQgbm90IG9idGFpbiBoYW5kbGUgb24gcHJpdmlsZWdlZCBjb21tYW5kIGludGVyZmFjZSIpOw0K
Pj4+ICsgICAgICAgIHJldHVybiByYzsNCj4+PiArICAgIH0NCj4+PiArDQo+Pj4gKyAgICByYyA9
IGlvY3RsKGZkLCBJT0NUTF9QUklWQ01EX0dTSV9GUk9NX1BDSURFViwgJmRldl9nc2kpOw0KPj4+
ICsgICAgY2xvc2UoZmQpOw0KPj4+ICsNCj4+PiArICAgIGlmIChyYykgew0KPj4+ICsgICAgICAg
IFBFUlJPUigiRmFpbGVkIHRvIGdldCBnc2kgZnJvbSBkZXYiKTsNCj4+PiArICAgIH0gZWxzZSB7
DQo+Pj4gKyAgICAgICAgcmMgPSBkZXZfZ3NpLmdzaTsNCj4+PiArICAgIH0NCj4+PiArI2VuZGlm
DQo+Pj4gKw0KPj4+ICsgICAgcmV0dXJuIHJjOw0KPj4+ICt9DQo+Pg0KPj4gSSByZWFsaXplIEFu
dGhvbnkgaGFkIGFza2VkIHRvIG1vdmUgdGhpcyBvdXQgb2YgbGlieGVuY2FsbCwgeWV0IGRvaW5n
IGl0IGxpa2UNCj4+IHRoaXMgKHdpdGhvdXQgcmVhbGx5IGFic3RyYWN0aW5nIGF3YXkgdGhlIE9T
IHNwZWNpZmljcykgZG9lc24ndCBsb29rIHF1aXRlDQo+PiByaWdodCBlaXRoZXIuIEluIHBhcnRp
Y3VsYXIgdGhlIG9wZW5pbmcgb2YgL2Rldi94ZW4vcHJpdmNtZCBsb29rcyBxdWVzdGlvbmFibGUN
Cj4+IHRvIG5vdyBoYXZlIHlldCBhbm90aGVyIGluc3RhbmNlIGluIHlldCBhbm90aGVyIGxpYnJh
cnkuIENvdWxkbid0IHdlIHNwbGl0DQo+PiBvc2RlcF94ZW5jYWxsX29wZW4oKSwgbWFraW5nIGF2
YWlsYWJsZSBpdHMgZm9ybWVyIGhhbGYgZm9yIHVzZSBoZXJlIGFuZCBpbiB0aGUNCj4+IG90aGVy
IHR3byBsaWJyYXJpZXM/IA0KPiBIaSBBbnRob255LCB3aGF0IGFib3V0IHlvdXIgb3Bpbmlvbj8N
CldoYXQncyB5b3VyIG9waW5pb24gYWJvdXQgdGFraW5nICIgb3BlbmluZyBvZiAvZGV2L3hlbi9w
cml2Y21kICIgYXMgYSBzaW5nbGUgZnVuY3Rpb24sIHRoZW4gdXNlIGl0IGluIHRoaXMgcGF0Y2gg
YW5kIG90aGVyIGxpYnJhcmllcz8NCg0KPiANCj4+IE9mIGNvdXJzZSB0aGF0J2xsIHN0aWxsIGxl
YXZlIHRoZSBpb2N0bCgpIGludm9jYXRpb24sIHdoaWNoIG5lY2Vzc2FyaWx5IGlzIE9TLXNwZWNp
ZmljLCB0b28uDQo+Pg0KPj4gSmFuDQo+IA0KDQotLSANCkJlc3QgcmVnYXJkcywNCkppcWlhbiBD
aGVuLg0K

