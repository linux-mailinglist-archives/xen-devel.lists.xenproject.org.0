Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 85FEBA774CF
	for <lists+xen-devel@lfdr.de>; Tue,  1 Apr 2025 08:56:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.933528.1335459 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tzVY0-0003ID-1v; Tue, 01 Apr 2025 06:56:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 933528.1335459; Tue, 01 Apr 2025 06:56:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tzVXz-0003GT-UJ; Tue, 01 Apr 2025 06:56:31 +0000
Received: by outflank-mailman (input) for mailman id 933528;
 Tue, 01 Apr 2025 06:56:31 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=FaGF=WT=amd.com=penny.zheng@srs-se1.protection.inumbo.net>)
 id 1tzVXz-0003GL-2g
 for xen-devel@lists.xenproject.org; Tue, 01 Apr 2025 06:56:31 +0000
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2060a.outbound.protection.outlook.com
 [2a01:111:f403:2416::60a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6e4e2baa-0ec6-11f0-9ffb-bf95429c2676;
 Tue, 01 Apr 2025 08:56:28 +0200 (CEST)
Received: from DM4PR12MB8451.namprd12.prod.outlook.com (2603:10b6:8:182::7) by
 CH3PR12MB8972.namprd12.prod.outlook.com (2603:10b6:610:169::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.44; Tue, 1 Apr
 2025 06:56:23 +0000
Received: from DM4PR12MB8451.namprd12.prod.outlook.com
 ([fe80::b04e:2da5:7189:4c4d]) by DM4PR12MB8451.namprd12.prod.outlook.com
 ([fe80::b04e:2da5:7189:4c4d%6]) with mapi id 15.20.8534.045; Tue, 1 Apr 2025
 06:56:23 +0000
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
X-Inumbo-ID: 6e4e2baa-0ec6-11f0-9ffb-bf95429c2676
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=q1ayL4C4gNONe/yptG1Ev9KFLlMnQRfn/Bfj+4soMUEHI5vjuspcaN3/ZXNRq/I971yVGpISriMybLahpxX9s4NQecil59rtvq2+g8s2FPgiyAddGNXgSNoepaP6XbgRSlHbvzwz48eq+eVFHO7B1SfvJCgi6iGE7OT3T+R4KzMey+hlXNI/3O1N4RTJunzyS1e1EMtWlzllbbbfohj3tCVuvzk+xvU33J+I38RmXTYCMCqcL89iwKeyJxFlmXenA+meymxKRcj6KpuXYEo3adyt9kdNCav4Hf99sXsnC+Bwb1Puw36NXazyRWqsVfYopKA76GkbYKy3936LSWyoTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CqKJxW773laYA185KmgpNmCsZnZzyhTG+MZ0a0K4jlU=;
 b=boz5DCL9JqUxYG8Eg2BZsLwVzhl/vqBMbq8yAHx2yJns0vsM5snXuedWBoxyGO1uNYlicTQK3BkXPsYNz4mwiIa00xuuZL0lB1elCV3I4jTqw62OLqMQl3WmU+oL83Eg4sXKPbU4GNlQ3ZO9PD7lsf17xwBbDAONax+axc3bexl3jL4iyww7BHmtfjhkv31DtgQNM0C1EuptKtKjp7HLg4kEF9+TW/1dtj9LTAS0nrfUVOgXWRPxjJuB+Yyuvpm0j29XEMxQj+lKjGdjaG5qQsxS25DXk4Yz2mnFKjPWySA/7b0yT2LroWAdvbsKpjFjtDjjR1Qg3gGjHJH6nHsjjw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CqKJxW773laYA185KmgpNmCsZnZzyhTG+MZ0a0K4jlU=;
 b=dRBnBNo/vKxygGxBnJROxcoWuPKj8OGXidZ5rENbTjlogtvRJvTf0t0iWZJZOiFohwHwszco6DCUEUukE8Uej0OvML3TB/S96nr4t/jU5SxgnysYAOn+OVJPESJ1E2Dh8miMY/orCWS9MPY9Q4HH9lTOVTKAzK4oMUA3JUg3atM=
From: "Penny, Zheng" <penny.zheng@amd.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "Huang, Ray" <Ray.Huang@amd.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>,
	"Orzel, Michal" <Michal.Orzel@amd.com>, Julien Grall <julien@xen.org>,
	=?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>, Stefano
 Stabellini <sstabellini@kernel.org>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
Subject: RE: [PATCH v3 03/15] xen/cpufreq: refactor cmdline "cpufreq=xxx"
Thread-Topic: [PATCH v3 03/15] xen/cpufreq: refactor cmdline "cpufreq=xxx"
Thread-Index:
 AQHbjnNpEkvZJyYnHka7avkYmH1MUrOCfisAgAKWJuCAAEZ9gIAJF6sQgAAR7YCAAATs8A==
Date: Tue, 1 Apr 2025 06:56:23 +0000
Message-ID:
 <DM4PR12MB8451185E36A580EEA21E9B28E1AC2@DM4PR12MB8451.namprd12.prod.outlook.com>
References: <20250306083949.1503385-1-Penny.Zheng@amd.com>
 <20250306083949.1503385-4-Penny.Zheng@amd.com>
 <80963bfa-a19e-49a7-8de2-0d8508af450f@suse.com>
 <DM4PR12MB8451F07287ABC9BB683D7BD3E1A62@DM4PR12MB8451.namprd12.prod.outlook.com>
 <94160460-357a-4852-b56d-3d89febd0e68@suse.com>
 <DM4PR12MB845172547933E0618DC27EEDE1AC2@DM4PR12MB8451.namprd12.prod.outlook.com>
 <3cd17873-5905-4d2f-86cb-9875edd8025f@suse.com>
In-Reply-To: <3cd17873-5905-4d2f-86cb-9875edd8025f@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
 MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_ActionId=71d6ac26-92fb-4575-84da-b463158c0210;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_ContentBits=0;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Enabled=true;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Method=Privileged;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Name=Open
 Source;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_SetDate=2025-04-01T06:56:14Z;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Tag=10,
 0, 1, 1;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR12MB8451:EE_|CH3PR12MB8972:EE_
x-ms-office365-filtering-correlation-id: ccfbd063-68b2-4d03-a0d0-08dd70ea50aa
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|376014|366016|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?eW8wRFdzT0FUbHJhcENJRHV6WnQ0dFo4aUhvcjhPYjZPNjhLSHJEbjhZV3Yw?=
 =?utf-8?B?REdHUlBSaXdDY1d1dmJlOTJnNVM4ODN0VUtBNVVqV243UmxPaUNCQTFBUjdJ?=
 =?utf-8?B?MzJJalhoenZHS1o3c1BMNnYwenFqM3A1cUhrVERQVTVFd0NUdWNVWXptaDB0?=
 =?utf-8?B?VWNDcThhUW9zOFJBY0F6VmpZUnV5a0haenEyNktONnNMaHhRZi82OTY2U3Ux?=
 =?utf-8?B?MGUycW40R3pxWUJLVUhEaEV2cHoyR1k0WWllc0VUWEloV2xyblVBMThtOUpN?=
 =?utf-8?B?TVNmYlF6TDlZMzZ2YW1QdlJRaWQ3TEZsS2NOOVlSTmlRd0Q0VWZiVGxDNXRX?=
 =?utf-8?B?aFRUbUJxU1pmMlgwRnJWQ0M1MG12bERaay9QL2k5QkRqK3BaQkNaQmFqQi9X?=
 =?utf-8?B?WlZOYW1DSHBSV1NqTFg4bXNWODUvS2V1NElORkZtZENQMUZMaEJHTUtMRlcy?=
 =?utf-8?B?OE03b3hlbE1idmk0dUxlOGF3TUtpMjVUS1k0WXpFaHJOeFdVenpwV0VtWU91?=
 =?utf-8?B?UFl0MnAzVWZkN2RhSENVL0NBYU9mYUFEYTRZWDVvcjdvcTh3TlRTeFg4dVFJ?=
 =?utf-8?B?Q05Sb2Rqc05NQU1BSjlaT1l6bk94cm1YNThuL0cvWWJyRTZBb1RwZXBCTjV6?=
 =?utf-8?B?OEFQTEVLeTZOeU14d1Fsc2lDV3d4TDY4YmhMNVgrTENvTVNmQ2lkTW83N0dC?=
 =?utf-8?B?Zk5pbUF5dEVNM1BNUHhmcDdiOENsN3pKWDVEOVR3aDlNV3V0SStHbnc5eUoy?=
 =?utf-8?B?NWRmVnhMM3BienQ2aENzVjlRZDMyMU5oTkswVFYvc3NUZG1XTlN2QVVDTXcr?=
 =?utf-8?B?cVpvak1IUlFUZThMaHNKVjhXbWZ2c3pXVWpCYXRsUVFDSEJhSHMxeW9sMDBy?=
 =?utf-8?B?MHdFdmdnZDVMK2ZsM3NyYUFvYjc1cUZtQkZGblllMk92cVkwNVA0b2xOcWEz?=
 =?utf-8?B?ZUZZTEplSi9UUW95UStGbUJDMDVIeFpLWHpYUWdzSCtpNTI2OXdhaUNCODdJ?=
 =?utf-8?B?TDFDaWx6Q21teE5ZYmFuVWw4VmgxaGdMUk9xR1dYVlJnR2s2VWpPK21GcE1u?=
 =?utf-8?B?YzltaC8yWXRKcjl6cVJqZWk0ZmRweGtabk5mRXU5eHVpMlpOc1AyK1hac1Fq?=
 =?utf-8?B?RWZqek96SHl1aWFCaTZuOWUvUmVJbDNrZFJvSDk3T0JpYTV6ZitJaWU5eEFZ?=
 =?utf-8?B?VW9pR3cwS2dHemZiWnptTkRwR1U1N3BFY3BiQWZ2M1Q3TE1za2hqbS9CNWVz?=
 =?utf-8?B?VUtWQ1h4Vks0Y2J3alFXRnpQV1RPUlRZT3lOcHFQRmlUZmJqOU41Q1ppRkNN?=
 =?utf-8?B?bkMzTDZiellKTmU0SDdXUys4V21OakdrWU9pV3VyeWpQYjlsSlIvODhBV0JC?=
 =?utf-8?B?WFlpWkowTHFQemY2TEs5WENRbzJ2NXA3RzFMdmwxYjFSUS9Qcm9nMEt5UEZs?=
 =?utf-8?B?TVpCSGpLV0tmaVcyNzlNcWNSMTlFZUw1MkRjWjByTmxaU09tYkVHNlgrMUYz?=
 =?utf-8?B?WHJuQW03UDNDd0ZERUJCNHdZTll6eUNnWmQ3YTgwRVEwMVlZUG4xYmJCWFZk?=
 =?utf-8?B?YVE1UzVVT2ZBS25GUlBUSy9INVAvUnA4ZVFGT3M0bmhNbWZ5aktjRHFEc0Z1?=
 =?utf-8?B?UCtkWHZIVUNSN01MOVJneWR4R0hXL3ZtRFNnbHZ2aW1DVnBkRExUT1NKd0g5?=
 =?utf-8?B?TFJlaEdoMzljbS9sMFJNcDRrbG85eHJCSVZYbENUS25pQUY5bjBYM2RjV0lI?=
 =?utf-8?B?aFpVL0RMQmpEMDM1cWFjSCs4akI2cHRGOWJkSEFmQjRmZEt4Wlh0WDZoZC96?=
 =?utf-8?B?TUFibER3L3lwSXVVd0ZzMFQwMW9xQ3N6b0NxLzFPWlIxeFhkYWhWVlY3Y29p?=
 =?utf-8?B?OXJpRldBTmtlRXZSQVRRYkxIZmgzcXFDWGhUY2UxK0Y5dWx2ajdCbnpxbjh4?=
 =?utf-8?Q?FMpRB35VNCiM73spLquipZvrU8t/Yzb7?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR12MB8451.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?VEZTQStHQ0dhcG5Ca0Fyc1FONFVoM25PYzB4YkFpZWJ3RzROdlMrZ0pEZGhH?=
 =?utf-8?B?bTErODQ3M0pQTVRnZStDSUQwRTVjVmVJTGUvem1oVExzdDhhT2VSOVJhc3NZ?=
 =?utf-8?B?SS9YeU1veGY2V2NISXdkZ254elB3V2dhd011ZWg1Y3ZLam1kYWpHQk01L2U4?=
 =?utf-8?B?a0I0VzFzb1hrWkVadmZvNnRvSHpRTWtaY3NCZ3VPL2pwUFdzbjV5U2FuZ2Ro?=
 =?utf-8?B?SXp1bzNteE1yZndCbGJTTVU2cmtyN2VuNWNaaWhETkUyY2Q4NkdoNE56WUd1?=
 =?utf-8?B?SXpIZTlVc09Sc2xMYkhVbnFhWU9jcmhmNmlEQmp1em5hblBZYVRDZjkvQXY5?=
 =?utf-8?B?YkVNKytKYkUvRTRHdTR1NjQ0SkhGSTlQRUwxcW5DSTBXOGN1M09lSVBtUHFl?=
 =?utf-8?B?RytxdjV0SjZISkMvMmhvZC9PLytHbmI4R0U3RnhrREVPNjg5WFZaZ21jUzlv?=
 =?utf-8?B?bHQzN1U1alB5Q0ZCNTZDamFUeWJvNlF6ckQ4QzB3YXcrNWtFRG5iRVFrd3lu?=
 =?utf-8?B?UmlPL1JEN1AxTm9mOWpiVU45NVVtZEtoSFQyRUp2UUV2K1BUSE1MVnBIQkE5?=
 =?utf-8?B?S1lGUUs2dmNGTytaalRlLy82R0REUGFhM1lSMkEvdWF3b0hsbDhEL2RmZVE0?=
 =?utf-8?B?Q1lGKzJvcWwxNjZjeFNXKzJTYkMzZit6M2IzaFNhVmp5N05IcjhnSkVYaUNB?=
 =?utf-8?B?VCs3Y0hqc282T1drQzNWMTk2TzgvOXF0Rm93TWhyTW13cUFBRXR2Rng2b2U2?=
 =?utf-8?B?dS81QVhucUlXSXFVZ3YxS0VUZVNmOGcvQ2UyQzlnazltRG5KcEtFeWhvUVpK?=
 =?utf-8?B?VE1ZaTlYdkk0UFFXZjRsSDZKengrNGhPS2RGb1ZTbTRieXZmNXRFeWVvcDdC?=
 =?utf-8?B?emVBekV0OFljSFBocENWemlpckp3QVNxS01RaENKbnlWK2N6K01xZERncFdJ?=
 =?utf-8?B?Q2dLKzJpV1FTOVRUcndqVDZVRW9rLzRYVU9lUzVSd0F6T0RpakZPZjdPOG9J?=
 =?utf-8?B?NzZaTlYwLzA0bHMyRmFmeHRCanJJaEZTczBzeEZrOXVqb1hiZzduZGZvZ2Vi?=
 =?utf-8?B?L2pOS3lidUtUUkM4MGVLSHVMMFFINmgyN2Erekhwa0RrSXVIVlBpYWJ1anBs?=
 =?utf-8?B?N09zbEVlOXlDeDVqeEczaVVkRGgzd3JDWG5iOG1JeHZQNEdrVVBKakhteE94?=
 =?utf-8?B?UlJQZGpmRldEdmtTdjNhcjFuYzZSSjFyVXdPd1o1aWhiTHRYc2dyS2VIeEZm?=
 =?utf-8?B?bUhRUCswbkU5Y2lsK2puaWFzOGIxRnZaenJKUkR1TWFkTk00d2ttZHVZZ1Iz?=
 =?utf-8?B?a3h0QUh2SGJrekU3b1hMQUovaHVvVDZ4aFN3RWJLUS9jREhqelRXUnFNVlJL?=
 =?utf-8?B?Tm05Wk5xZDM3OVNxdlFOaTJIaE5XbFkrUDNOVmRtZzJsMkdadk56UlE1bklI?=
 =?utf-8?B?Z0FqSk5VWFZjT3RBam1rbVJxYitnQ3AvUG9yTnBaUHBLWG5FK2JrdE1YVHlR?=
 =?utf-8?B?TjBndkw0TjZybTQrOU1HdFNYUlhlVkdDUGVhLzkrS1BFQlVSMk1vTlFsZWxk?=
 =?utf-8?B?SHp2R2dxczQvdTNmaGkyRm9JNHIrWVBEaWN0bXhjUFRBdWVpcnl5LytKUFpL?=
 =?utf-8?B?dzU5bEhsR2wwdXhCMytpZEdZSno3cVQ2K1ZBYzMwMXhMd09wZnlYempQeDlS?=
 =?utf-8?B?U1JhdzYrcEhmbmhuRG1XbjhraW44ZlcyL1grbWtkMVAvemJBZUJ0ZHI2aEZv?=
 =?utf-8?B?UE42dXhOWDQrMGtLanRHV2dZU2syRlZ1SjdvT01YYWlSWlNTdWhqSFJ5NVNL?=
 =?utf-8?B?V3ZJTWFrckx4T2ZrV0I5d01JbWRuZUc4UDArV0JYRmF2TWlJcUxhQUpqVG5Q?=
 =?utf-8?B?b3hsMW13TXRiWHBWQnhoUDQ3Z1ZNTExjREdLSjE1UmYvSXZZdkZoMklncnE5?=
 =?utf-8?B?WGRNb0pxbzlobU4rOUpuOERiYXRqZ0JZZ2lOR21RMTl6eDBocGI0RWlQT1J1?=
 =?utf-8?B?Ulg0R1lYZHNKS0U4TWE1b2QrV2E3c2lJbUtweGg2TDI3NmNZOXJDTTNHZnBE?=
 =?utf-8?B?bmtJb2NWZm12Zk9OT0h4bWlCWFBKbUNDeEEyVGNiRWpvWDlVOGROcU5TYjZp?=
 =?utf-8?Q?3U28=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB8451.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ccfbd063-68b2-4d03-a0d0-08dd70ea50aa
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Apr 2025 06:56:23.4448
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: nmGQOoAr5e8pK8SDcwsEyod91ATBTVw5Ss+z+/ZEjjjICuuRLs7SDReEbjXN9PyEzt6kRYFuHICNSkv0q0HMIA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8972

W1B1YmxpY10NCg0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBKYW4gQmV1
bGljaCA8amJldWxpY2hAc3VzZS5jb20+DQo+IFNlbnQ6IFR1ZXNkYXksIEFwcmlsIDEsIDIwMjUg
MjozOCBQTQ0KPiBUbzogUGVubnksIFpoZW5nIDxwZW5ueS56aGVuZ0BhbWQuY29tPg0KPiBDYzog
SHVhbmcsIFJheSA8UmF5Lkh1YW5nQGFtZC5jb20+OyBBbmRyZXcgQ29vcGVyDQo+IDxhbmRyZXcu
Y29vcGVyM0BjaXRyaXguY29tPjsgQW50aG9ueSBQRVJBUkQgPGFudGhvbnkucGVyYXJkQHZhdGVz
LnRlY2g+Ow0KPiBPcnplbCwgTWljaGFsIDxNaWNoYWwuT3J6ZWxAYW1kLmNvbT47IEp1bGllbiBH
cmFsbCA8anVsaWVuQHhlbi5vcmc+OyBSb2dlcg0KPiBQYXUgTW9ubsOpIDxyb2dlci5wYXVAY2l0
cml4LmNvbT47IFN0ZWZhbm8gU3RhYmVsbGluaSA8c3N0YWJlbGxpbmlAa2VybmVsLm9yZz47DQo+
IHhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZw0KPiBTdWJqZWN0OiBSZTogW1BBVENIIHYz
IDAzLzE1XSB4ZW4vY3B1ZnJlcTogcmVmYWN0b3IgY21kbGluZSAiY3B1ZnJlcT14eHgiDQo+DQo+
IE9uIDAxLjA0LjIwMjUgMDc6NDQsIFBlbm55LCBaaGVuZyB3cm90ZToNCj4gPiBbUHVibGljXQ0K
PiA+DQo+ID4gSGkNCj4gPg0KPiA+PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiA+PiBG
cm9tOiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+DQo+ID4+IFNlbnQ6IFdlZG5lc2Rh
eSwgTWFyY2ggMjYsIDIwMjUgNjo0MyBQTQ0KPiA+PiBUbzogUGVubnksIFpoZW5nIDxwZW5ueS56
aGVuZ0BhbWQuY29tPg0KPiA+PiBDYzogSHVhbmcsIFJheSA8UmF5Lkh1YW5nQGFtZC5jb20+OyBB
bmRyZXcgQ29vcGVyDQo+ID4+IDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tPjsgQW50aG9ueSBQ
RVJBUkQNCj4gPj4gPGFudGhvbnkucGVyYXJkQHZhdGVzLnRlY2g+OyBPcnplbCwgTWljaGFsIDxN
aWNoYWwuT3J6ZWxAYW1kLmNvbT47DQo+ID4+IEp1bGllbiBHcmFsbCA8anVsaWVuQHhlbi5vcmc+
OyBSb2dlciBQYXUgTW9ubsOpDQo+ID4+IDxyb2dlci5wYXVAY2l0cml4LmNvbT47IFN0ZWZhbm8g
U3RhYmVsbGluaSA8c3N0YWJlbGxpbmlAa2VybmVsLm9yZz47DQo+ID4+IHhlbi1kZXZlbEBsaXN0
cy54ZW5wcm9qZWN0Lm9yZw0KPiA+PiBTdWJqZWN0OiBSZTogW1BBVENIIHYzIDAzLzE1XSB4ZW4v
Y3B1ZnJlcTogcmVmYWN0b3IgY21kbGluZSAiY3B1ZnJlcT14eHgiDQo+ID4+DQo+ID4+IE9uIDI2
LjAzLjIwMjUgMDg6MjAsIFBlbm55LCBaaGVuZyB3cm90ZToNCj4gPj4+PiAtLS0tLU9yaWdpbmFs
IE1lc3NhZ2UtLS0tLQ0KPiA+Pj4+IEZyb206IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNv
bT4NCj4gPj4+PiBTZW50OiBNb25kYXksIE1hcmNoIDI0LCAyMDI1IDExOjAxIFBNDQo+ID4+Pj4N
Cj4gPj4+PiBPbiAwNi4wMy4yMDI1IDA5OjM5LCBQZW5ueSBaaGVuZyB3cm90ZToNCj4gPj4+IE1h
eWJlIEkgbWlzLXVuZGVyc3Rvb2QgdGhlIHByZXZpb3VzIGNvbW1lbnQgeW91IHNhaWQgYGBgDQo+
ID4+PiAgICAgICAgID4gICAgICAgICAgZWxzZSBpZiAoIElTX0VOQUJMRUQoQ09ORklHX0lOVEVM
KSAmJiBjaG9pY2UgPCAwICYmDQo+ID4+PiAgICAgICAgID4gYGBgDQo+ID4+Pg0KPiA+Pj4gICAg
ICAgICBGb3IgdGhlIHJlc3Qgb2YgdGhpcywgSSBndWVzcyBJJ2QgcHJlZmVyIHRvIHNlZSB0aGlz
IGluIGNvbnRleHQuIEFsc28gd2l0aA0KPiA+Pj4gICAgICAgICByZWdhcmQgdG8gdGhlIGhlbHBl
ciBmdW5jdGlvbidzIG5hbWUuDQo+ID4+PiBgYGANCj4gPj4+IEkgdGhvdWdodCB5b3Ugc3VnZ2Vz
dGVkIHRvIGludHJvZHVjZSBoZWxwZXIgZnVuY3Rpb24gdG8gd3JhcCB0aGUNCj4gPj4+IGNvbmRp
dGlvbmFsDQo+ID4+IGNvZGVzLi4uDQo+ID4+PiBPciBtYXkgeW91IHdlcmUgc3VnZ2VzdGluZyBz
b21ldGhpbmcgbGlrZToNCj4gPj4+IGBgYA0KPiA+Pj4gI2lmZGVmIENPTkZJR19JTlRFTA0KPiA+
Pj4gZWxzZSBpZiAoIGNob2ljZSA8IDAgJiYgIWNtZGxpbmVfc3RyY21wKHN0ciwgImh3cCIpICkg
ew0KPiA+Pj4gICAgIHhlbl9wcm9jZXNzb3JfcG1iaXRzIHw9IFhFTl9QUk9DRVMNCj4gPj4+ICAg
ICAuLi4NCj4gPj4+IH0NCj4gPj4+ICNlbmRpZg0KPiA+Pj4gYGBgDQo+ID4+DQo+ID4+IFdhcyB0
aGlzIHJlcGx5IG9mIHlvdXJzIG1pc3BsYWNlZD8gSXQgZG9lc24ndCBmaXQgd2l0aCB0aGUgcGFy
dCBvZiBteQ0KPiA+PiByZXBseSBpbiBjb250ZXh0IGFib3ZlLiBPciBtYXliZSBJJ20gbm90IHVu
ZGVyc3RhbmRpbmcgd2hhdCB5b3UgbWVhbiB0byBzYXkuDQo+ID4+DQo+ID4+Pj4gSW4gdGhlIGVu
ZCBJJ20gYWxzbyBub3QgZW50aXJlbHkgY29udmluY2VkIHRoYXQgd2UgbmVlZCB0aGVzZSB0d28N
Cj4gPj4+PiBhbG1vc3QgaWRlbnRpY2FsIGhlbHBlcnMgKHdpdGggYSAzcmQgbGlrZWx5IGFwcGVh
cmluZyBpbiBhIGxhdGVyIHBhdGNoKS4NCj4gPj4NCj4gPj4gSW5zdGVhZCBpdCBmZWVscyBhcyBp
ZiB0aGlzIHJlc3BvbnNlIG9mIHlvdXJzIHdhcyB0byB0aGlzIHBhcnQgb2YgbXkgY29tbWVudC4N
Cj4gPj4gSW5kZWVkIGlpcmMgSSB3YXMgc3VnZ2VzdGluZyB0byBpbnRyb2R1Y2UgYSBoZWxwZXIg
ZnVuY3Rpb24uIE5vdGUsDQo+ID4+IGhvd2V2ZXIsIHRoZSBzaW5ndWxhciBoZXJlIGFzIHdlbGwg
YXMgaW4geW91ciByZXNwb25zZSBhYm92ZS4NCj4gPj4NCj4gPg0KPiA+IENvcnJlY3QgaWYgSSB1
bmRlcnN0b29kIHdyb25nbHksIHlvdSBhcmUgc3VnZ2VzdGluZyB0aGF0IHdlIHNoYWxsIHVzZQ0K
PiA+IG9uZSBzaW5nbGUgaGVscGVyIGZ1bmN0aW9uIGhlcmUgdG8gY292ZXIgYWxsIHNjZW5hcmlv
cywgbWF5YmUgYXMgZm9sbG93czoNCj4gPiBgYGANCj4gPiArc3RhdGljIGludCBfX2luaXQgaGFu
ZGxlX2NwdWZyZXFfY21kbGluZShjb25zdCBjaGFyICphcmcsIGNvbnN0IGNoYXIgKmVuZCwNCj4g
PiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBlbnVtIGNwdWZyZXFf
eGVuX29wdCBvcHRpb24pDQo+ID4gK3sNCj4gPiArICAgIGludCByZXQ7DQo+ID4gKw0KPiA+ICsg
ICAgaWYgKCBjcHVmcmVxX29wdHNfY29udGFpbihvcHRpb24pICkNCj4gPiArICAgIHsNCj4gPiAr
ICAgICAgICBjb25zdCBjaGFyICpjcHVmcmVxX29wdHNfc3RyW10gPSB7ICJDUFVGUkVRX3hlbiIs
DQo+ID4gKyAiQ1BVRlJFUV9od3AiIH07DQo+ID4gKw0KPiA+ICsgICAgICAgIHByaW50ayhYRU5M
T0dfV0FSTklORw0KPiA+ICsgICAgICAgICAgICAgICAiRHVwbGljYXRlIGNwdWZyZXEgZHJpdmVy
IG9wdGlvbjogJXMiLA0KPiA+ICsgICAgICAgICAgICAgICBjcHVmcmVxX29wdHNfc3RyW29wdGlv
biAtIDFdKTsNCj4gPiArICAgICAgICByZXR1cm4gMDsNCj4gPiArICAgIH0NCj4gPiArDQo+ID4g
KyAgICB4ZW5fcHJvY2Vzc29yX3BtYml0cyB8PSBYRU5fUFJPQ0VTU09SX1BNX1BYOw0KPiA+ICsg
ICAgY3B1ZnJlcV9jb250cm9sbGVyID0gRlJFUUNUTF94ZW47DQo+ID4gKyAgICBjcHVmcmVxX3hl
bl9vcHRzW2NwdWZyZXFfeGVuX2NudCsrXSA9IG9wdGlvbjsNCj4gPiArICAgIHN3aXRjaCAoIG9w
dGlvbiApDQo+ID4gKyAgICB7DQo+ID4gKyAgICBjYXNlIENQVUZSRVFfaHdwOg0KPiA+ICsgICAg
ICAgIGlmICggYXJnWzBdICYmIGFyZ1sxXSApDQo+ID4gKyAgICAgICAgICAgIHJldCA9IGh3cF9j
bWRsaW5lX3BhcnNlKGFyZyArIDEsIGVuZCk7DQo+ID4gKyAgICBjYXNlIENQVUZSRVFfeGVuOg0K
PiA+ICsgICAgICAgIGlmICggYXJnWzBdICYmIGFyZ1sxXSApDQo+ID4gKyAgICAgICAgICAgIHJl
dCA9IGNwdWZyZXFfY21kbGluZV9wYXJzZShhcmcgKyAxLCBlbmQpOw0KPiA+ICsgICAgZGVmYXVs
dDoNCj4gPiArICAgICAgICByZXQgPSAtRUlOVkFMOw0KPiA+ICsgICAgfQ0KPg0KPiBBcGFydCBm
cm9tIHRoZSBzd2l0Y2goKSBtaXNzaW5nIGFsbCBicmVhayBzdGF0ZW1lbnRzLCB0aGUgaGVscGVy
IEkgd2FzIHRoaW5raW5nIG9mDQo+IHdvdWxkIGVuZCByaWdodCBiZWZvcmUgdGhlIHN3aXRjaCgp
LiBUaGUgPHh5ej5fY21kbGluZV9wYXJzZSgpIGNhbGxzIHdvdWxkDQo+IHJlbWFpbiBhdCB0aGUg
Y2FsbCBzaXRlcyBvZiB0aGUgaGVscGVyLg0KPg0KDQpVbmRlcnN0b29kIQ0KDQo+IEphbg0K

