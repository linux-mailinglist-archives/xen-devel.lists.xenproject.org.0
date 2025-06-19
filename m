Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 77A82ADFDE2
	for <lists+xen-devel@lfdr.de>; Thu, 19 Jun 2025 08:43:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1019720.1396243 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uS8zk-0000Tb-I4; Thu, 19 Jun 2025 06:43:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1019720.1396243; Thu, 19 Jun 2025 06:43:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uS8zk-0000RV-FN; Thu, 19 Jun 2025 06:43:32 +0000
Received: by outflank-mailman (input) for mailman id 1019720;
 Thu, 19 Jun 2025 06:43:31 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/xoG=ZC=amd.com=penny.zheng@srs-se1.protection.inumbo.net>)
 id 1uS8zj-0000RO-3O
 for xen-devel@lists.xenproject.org; Thu, 19 Jun 2025 06:43:31 +0000
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on20614.outbound.protection.outlook.com
 [2a01:111:f403:2414::614])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b4ff71d5-4cd8-11f0-b894-0df219b8e170;
 Thu, 19 Jun 2025 08:43:29 +0200 (CEST)
Received: from DM4PR12MB8451.namprd12.prod.outlook.com (2603:10b6:8:182::7) by
 SJ2PR12MB9244.namprd12.prod.outlook.com (2603:10b6:a03:574::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.29; Thu, 19 Jun
 2025 06:43:25 +0000
Received: from DM4PR12MB8451.namprd12.prod.outlook.com
 ([fe80::b04e:2da5:7189:4c4d]) by DM4PR12MB8451.namprd12.prod.outlook.com
 ([fe80::b04e:2da5:7189:4c4d%5]) with mapi id 15.20.8835.027; Thu, 19 Jun 2025
 06:43:25 +0000
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
X-Inumbo-ID: b4ff71d5-4cd8-11f0-b894-0df219b8e170
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KGw70z7erNUIoe3mKVpqMseyCC5Nk4+r+nK0B4Hk+qxbFyOwOBQn2s5leQSRi7FU2BIdCaiQqhC/HvOabOoOCOZhUIe0xcQzQFK4aTMkf4O7FU+5uR6cbjHgwl9xHZh/L549Iilcc6qnZUDZHZEYr4HWcvYFYSNDw6phjnPS8TZmYES/Tl+c9BvQNLXRnT4YW9Lra6hG5wIll/1+OHMlwdKp4hMY66daV9uLY0q/8+9CmoxwPLCYK2gjGBmObUE8GpAwnIWWPUfQut331kQ+vtUr0DDveIRsOMjX8ZfB2G20UFVIlo0EIEgCEG194H+Kaxl2Ag8wVPxhjuq+xoDlvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9cQfdXGWrWvKYP7dnRjl1AHQe9WtEoBo755K0lNV97w=;
 b=szV/IZParAXvuYfL45XJ+tv+0ZkZ/6r9VZl/yP1ObJcPsJf1MjtduQaafa1+vaFJ9ChZScWuaVC4E+sNCzn2wCJIzvpP0hFia+ETXtsJdmeEliu3MrfSsgij6EV05j4nEXt3iSRsK+ODYvOElsrLGIXqEUktcsMQ8mo6KgBXIVUrOneQnGj1aMLMSDuVn7sUM6mwNfiqfuNPWKD9JznqDuudpEujg8Dz061dDK07MtQXLdW3po9Ur+PKte2AmMdzBUN4g+NP2GAExcT6DFxD2XEbtAMg6fcihBrXlcOj7ALjvENN52pcleILHlHh8VATaj7jmI4ioSF3mtD9QsDvBQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9cQfdXGWrWvKYP7dnRjl1AHQe9WtEoBo755K0lNV97w=;
 b=iLWfUjPGqcjZKWgfqbnfFkbZ+Sqrmy6PsaK1sFIqBjLPGUrwJzl7FMyjXbwqJcYtU+2LUJXp8LOLmt9sM6dJVY0/QpZvzjJtKWm6tA7j9cAT8x9PIRG6oredNSXnbaFD0IwUsL1Pgy76V9/5TvsmtCIQwAbyg4TIqEfJWww7us4=
From: "Penny, Zheng" <penny.zheng@amd.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "Huang, Ray" <Ray.Huang@amd.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?=
	<roger.pau@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>, "Orzel,
 Michal" <Michal.Orzel@amd.com>, Julien Grall <julien@xen.org>, Stefano
 Stabellini <sstabellini@kernel.org>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
Subject: RE: [PATCH v5 04/18] xen/cpufreq: introduce new sub-hypercall to
 propagate CPPC data
Thread-Topic: [PATCH v5 04/18] xen/cpufreq: introduce new sub-hypercall to
 propagate CPPC data
Thread-Index: AQHbzuQ+jriHLS/NnEiww9yxRz3NOrP+OOqAgAvzMpA=
Date: Thu, 19 Jun 2025 06:43:25 +0000
Message-ID:
 <DM4PR12MB845119472EAA75DC986868B4E17DA@DM4PR12MB8451.namprd12.prod.outlook.com>
References: <20250527084833.338427-1-Penny.Zheng@amd.com>
 <20250527084833.338427-5-Penny.Zheng@amd.com>
 <0de0ea5c-64c9-4ac8-8e76-750cb3036419@suse.com>
In-Reply-To: <0de0ea5c-64c9-4ac8-8e76-750cb3036419@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
 MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Enabled=True;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_SetDate=2025-06-19T06:43:16.0000000Z;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Name=Open
 Source;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_ContentBits=3;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Method=Privileged
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR12MB8451:EE_|SJ2PR12MB9244:EE_
x-ms-office365-filtering-correlation-id: c3be0b72-3bb4-456c-027d-08ddaefc978c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|376014|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?TVlTYnBLZ0lweGs5aFhGM0VYeTRDUFRJS1lBQ1JxcG1KSjhNWnZROEIwZXhh?=
 =?utf-8?B?QmJXNTFaalF2L0x4Um1CelFzL3g4L0VDSk5WcFJxcWR6aG5FUmwrY2RrSzFL?=
 =?utf-8?B?UnpGZTJtQWZJRWJkdlZ3STgwK2NKQVVha1Rxd3lYRjBaZWxoSGk3elJybWZU?=
 =?utf-8?B?dkJmMk44UWVhRXVPemlLMlozL1FnemVKeFM0TnYzU2Rybmc1L1BsbHpIM1lT?=
 =?utf-8?B?VUp4RDdWbVZTYmM2MC9ILzlxQ2RoYlIvckdqalFlSFQycmhtZS9pYUhtbG9j?=
 =?utf-8?B?VE1VSmN1UUFuU1VtTlhNZTBzTDFGeXZkTDJUeE1nMUFXVGM1TGxYV2hNMzNx?=
 =?utf-8?B?a05JY0hhdUp4bU5BYy9STndWSnFqRm5wL0gxcjJLRzNDUy9iOUtUT1FVNEN0?=
 =?utf-8?B?Y0N2VXVsUDljSDk2VnJ2K3pjU3RRSERHQ2kxR00wbUFCZHJOVDd2SHNrVXlV?=
 =?utf-8?B?Sk51OFVJRGdkTjJrc2wvY1padUdvSW9ZSy8xKzdIczY0ZFNMZVBYMDhraTNs?=
 =?utf-8?B?dlhLZjlRM244TFFrZkRVZVAvV2RzdVRYUU00WWxBTEhzeUdHeURFYmhtM1FZ?=
 =?utf-8?B?SlBDenZYZGw1ZXRiK0lrYmtPb3crc29tTGV0Zk9pYjFKNVFua05KbFYzOWdS?=
 =?utf-8?B?K2tJSHhSQ3c4bTg2Vy9UQWVTL3QwY3Njck5FM21vdXppUXNETUlZeDZ5QUVv?=
 =?utf-8?B?QzU3TzdMclVRTlQrYnFyV0Z2K3Bpb1owK1M2dDdYSmV3d3pQVit3bE9RR0Z2?=
 =?utf-8?B?NTZ2TFlncTd6LzN2dFdUV1N6Y2lKd24rL0Y3MWFNZTJ5RnlpNHl6MVJkMVRz?=
 =?utf-8?B?MWtmU2ZDRWxnZklRNE9iUkdtL1pqWlRTSXVDak1iSTNhRWhRZmk2NDl1WXJs?=
 =?utf-8?B?UzcyQ1ZHSjdPNTRESUc2UCtyMExKMkpxeGFqeEZMRlVhQURwa0dBaDNFVngw?=
 =?utf-8?B?Szlmd1NKQ3AwUmhHQWxaemF2M0NFVnFBNXo4NjN0SmdRQ2hKazZSS25GYlgy?=
 =?utf-8?B?YVlTbHNUK3dkSTFuWDR3K3p3Q0sydzZ3Q1d1TXdqT2NxbldkOC96cEtQZHNk?=
 =?utf-8?B?UnJlVXB1ODFkanhJeitXdVZ5TDR4bnArVDVYalJzazVRR1hJak93cXF4cFZZ?=
 =?utf-8?B?aVR5THBKZnVHTEJ4SGd5c0I4a1dBY2VRK1VKdFNsUU1kNi90dWVBY2NucmNy?=
 =?utf-8?B?UTVqdkF0OWxEWlBFNXRlZDJXNlREeXY1Q0gwWUt3MXlQeFlLQzV6VHZQL1pM?=
 =?utf-8?B?SXJqV29PY2JLOExLWEJKaEM5a2Q1ZHVKNnZhdWtEUEhPNkJCZm91U29FNUMy?=
 =?utf-8?B?YmJ6UktOcmJiMnFNV0lLZThXRVpteTM0S2htcEp6TEpIRUZrSkFjTDVzOHNB?=
 =?utf-8?B?K2grMUphbFhaU3F5anFNU1JNYjc2L28rWDVORjhoeUVSbmI0NDBsTWhRR1hR?=
 =?utf-8?B?NzBNT09lN1hRTy9MdXBYN2FIWGd6WUlCWm1aYTFQdHhwMDNmVXE2d3JTaDR1?=
 =?utf-8?B?ZzBnLy9NRDNwNnJYR3lUK0c3S04xKytyeFA1WFFrZk9xWmZXMnVhQmx6Mjdx?=
 =?utf-8?B?aXExNzEzb3ZEZkU0ODFjR1ZBcTB5WHFxbnpwK2ZFdysrS3VaZVd2dE1Cb0t0?=
 =?utf-8?B?Sk41cWZmaUorYVV0VUVHZ002MElCRHp1QzR2UUVXV3kvbDNkTVJMK2ZlZlpz?=
 =?utf-8?B?aDhrOU5XM1YwSEE2c2JDLy9nZWxTWlZsTWZ2Ky90QlUxVlEyNDV5b2kzbG4w?=
 =?utf-8?B?SklONHlTWjdDbFBUN29ubll3dnlWREo2ZU1KUEpxVEtTWEJTV2pWNHJ1Wnkz?=
 =?utf-8?B?MmxuMEo3WkZCbFRTSDNtdEcxYnhqWjJ2emVwaEZPcXVRYUpzNGU3R080N3ZR?=
 =?utf-8?B?SUtmUTZJRjFVRms4WC9vVmVPTEwwVEhVTEpGakt3TlVPeG9ESkErSGdLQ2cw?=
 =?utf-8?B?dXo1eE41WmpsRWJkVHYwRmhQSFd5RjVLZVhYNWIyeTdDOXFvRWlTSGhmY2lB?=
 =?utf-8?B?QllWeTFkZHN3PT0=?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR12MB8451.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?dkRpT0VHWU1tUmhCaVdKbzNLRWxSVDhFRURYblk5a1FQMVJMbWR4VlRMdkRi?=
 =?utf-8?B?V0U4NktIRFVkajJsOUw4ejZ0S1hXaGdBQ296WEZJdFY4VE5JTms2VDFUU1lL?=
 =?utf-8?B?UGVFN2pjUXpGMk4zU3VvdWExMk9qSzZhTGV0RUNFR0FRQzloak9iUmczczRo?=
 =?utf-8?B?cUR5QnlUTnNSREpYbTZUdGVuWHorZkZSdGV1Y3JuYzluczJFb1FRcHhkdXVq?=
 =?utf-8?B?dllRT1ZXbFpRNTkwNFYrdi9sMGt3eE5mUGVaUzVnOGNnZ1NwMVVrTmc3VUNr?=
 =?utf-8?B?YmFUSXorNkwycmxIbnlreXFVTnJ6am03OVg0TGFZeStxQVlOQmxURzhGU2Vy?=
 =?utf-8?B?a0NZRnRVNWM2QlpUREwyaElEelhScE5tWXJRZDVkaGJqZzdsSDJDcU9RU2xC?=
 =?utf-8?B?MXpaaFc3dTZIQmNLcnpFL244OFg1MGhTQjczUS9BcmlBOVR6QVlNSEVWZnlx?=
 =?utf-8?B?cWwzVTNaaWRFVGlOdmt2bEtNbTFydm5hUlpLWWlqR0tKUUlIb2tiL0xmbXpF?=
 =?utf-8?B?dk5zV1haUkhLOG5Gc3pYdUplSE9lYXhHbjQ3djlVWWNYc2MwUHdDcHhNQTNI?=
 =?utf-8?B?NW9ra05Eb25lS1lkV2pTdHJIbm1aZHZVTUlJMVE3SDhSb3FucWpsUkllTlBl?=
 =?utf-8?B?VUtvT3ZrS3pyTHVkOGhKcmpPQXdtYXpSLzdqUWIwcllaTkVqSkl6bzVnUWhu?=
 =?utf-8?B?MWRkYzNGUmQ2U1JVSjVJZ2xiVWg0N2RqdFd6Q0YyTXdzSkI3SitYV3FPWkpK?=
 =?utf-8?B?ZlNNcFk0TVpvVENKUzlJYUl3aHdzMitPWE1SeUljSVMxdi9xeEQ3WWx1VlZV?=
 =?utf-8?B?Slhac1ZhUDVtVkxEeVBjclhRV0ZTZHFUdmxDUkpXckhhRlNXRUIrTHYxaCsy?=
 =?utf-8?B?bkhyV0VUNlpvc0hrOTFFSHVyYjNHdldtc3dRc1dwWHNHQ0MvN0Y2aTMyMERP?=
 =?utf-8?B?YjNrckphQ05TYm9zL2U5cjRzQWQycHdDcWpNVWtNem9yQUI5Q2o1N1YrVjZI?=
 =?utf-8?B?citYSy9EYWo3dit3R3ZhcHIveGQ1dk02RHlNYmNNdjQzOWg0cncvU1ZVYThv?=
 =?utf-8?B?c2JQRjVMeTFZWkQ5ZDFwK0dvTkQ4SUk1c3FBOXo2QkpsNGFrYmRtV3NWTjVp?=
 =?utf-8?B?T3ZyaW43YytqU3lzcEdWb2lkV25ocWNBQktiWDhURW9OdFgvRy9SQ0RHNjM1?=
 =?utf-8?B?TTBpVGVKemU4S1VUTXJVUDBKRU41Q2tXZVJ4L215TzdHb0hLZ2c1ZTRtSVN2?=
 =?utf-8?B?T21zcTFHVDZoWFVxMGJNNm9QRmorclZ6NmlVOVdWc0VBM2prRmdkbEM1bXA3?=
 =?utf-8?B?Sm9iOWpkbFl4WThjbDBRRDhuRXlLMjFacnhCTHdvclg3eEV0SmlZeEdZQzlV?=
 =?utf-8?B?d3F2MG9lL293dlFaOHQyUGI0Tjh5UXA1bGxka3lvWWVjZGNneDRWeEFpSkFh?=
 =?utf-8?B?NFhSdndJZHVjK2JuRmpYell5d0E4Q2NKS09XME51QTRPTUNhSzI2MlBtM24z?=
 =?utf-8?B?WnNma08vRlQzMlNSVVFkZjFSZmhHRVkrY3cxOWNpZFNvS3NqMmVFZk10MGVv?=
 =?utf-8?B?cXJGVEhacXVuWmY4alVzTDMvTlhsT0x5UWNzTTdraHJjNDlUZXdnSklkZHl2?=
 =?utf-8?B?WlhxbkgxbWl6QWZ2V0kvV1hUU1hTOUQvanNVaGN6WjU4ZWpKQzBSS2dtdkFP?=
 =?utf-8?B?NmMwb0hnWGhqb1liZmwzdHBhZGFMOU1mUGJJWmNPUnBKTG4vajNlOFp3N1pv?=
 =?utf-8?B?c1NQY2lMMmtQdVRGNlhRM0RKMUJ0bjhoYm0wc2VMMjdZUEhTaWZuL0lTWWsr?=
 =?utf-8?B?R2hIdUVuQ2p2L1l1ZUl0V1B3ZXVPMm5sQlAyN2cxazFZTlNNK3V1Q29XQkJ2?=
 =?utf-8?B?SXMxMmduZG43RDhmREJpaWdpU3hQU1M0cVk1YnlKdjRrNnltc2FYbXlWMTNm?=
 =?utf-8?B?YUdSQmw3Q05Ua1Q1ai9KQjdoUUZzUHVqUDI5TCtZUUdXdU4zaStPZGpnVVBF?=
 =?utf-8?B?b01BRDl6WjBNc1JSOWFLU0tLVFFCaDdaUlBZQ0g2TkYrQ3VHS1JUVDdqb2lk?=
 =?utf-8?B?RjlYdTdaUUxnSTRocWtBMk1HOTlOMjJNc0U4YlR6VWNYNGJ5c1BaeVQybnBP?=
 =?utf-8?Q?L8Io=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB8451.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c3be0b72-3bb4-456c-027d-08ddaefc978c
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Jun 2025 06:43:25.3477
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: YHV0f7TqV8etxwZRKP1IviZar3ohO4nP1k6av4jq6+7X6v0omaDyZ6yo/4Lm2cIx7qgGTku8neqTnX1V1pidGA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB9244

W1B1YmxpY10NCg0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBKYW4gQmV1
bGljaCA8amJldWxpY2hAc3VzZS5jb20+DQo+IFNlbnQ6IFRodXJzZGF5LCBKdW5lIDEyLCAyMDI1
IDEyOjEwIEFNDQo+IFRvOiBQZW5ueSwgWmhlbmcgPHBlbm55LnpoZW5nQGFtZC5jb20+DQo+IENj
OiBIdWFuZywgUmF5IDxSYXkuSHVhbmdAYW1kLmNvbT47IEFuZHJldyBDb29wZXINCj4gPGFuZHJl
dy5jb29wZXIzQGNpdHJpeC5jb20+OyBSb2dlciBQYXUgTW9ubsOpIDxyb2dlci5wYXVAY2l0cml4
LmNvbT47DQo+IEFudGhvbnkgUEVSQVJEIDxhbnRob255LnBlcmFyZEB2YXRlcy50ZWNoPjsgT3J6
ZWwsIE1pY2hhbA0KPiA8TWljaGFsLk9yemVsQGFtZC5jb20+OyBKdWxpZW4gR3JhbGwgPGp1bGll
bkB4ZW4ub3JnPjsgU3RlZmFubyBTdGFiZWxsaW5pDQo+IDxzc3RhYmVsbGluaUBrZXJuZWwub3Jn
PjsgeGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnDQo+IFN1YmplY3Q6IFJlOiBbUEFUQ0gg
djUgMDQvMThdIHhlbi9jcHVmcmVxOiBpbnRyb2R1Y2UgbmV3IHN1Yi1oeXBlcmNhbGwgdG8NCj4g
cHJvcGFnYXRlIENQUEMgZGF0YQ0KPg0KPiBPbiAyNy4wNS4yMDI1IDEwOjQ4LCBQZW5ueSBaaGVu
ZyB3cm90ZToNCj4gPiBAQCAtNjM1LDYgKzY0MSwxMjQgQEAgb3V0Og0KPiA+IC0tLSBhL3hlbi9p
bmNsdWRlL3B1YmxpYy9wbGF0Zm9ybS5oDQo+ID4gKysrIGIveGVuL2luY2x1ZGUvcHVibGljL3Bs
YXRmb3JtLmgNCj4gPiBAQCAtMzYzLDYgKzM2Myw3IEBAIERFRklORV9YRU5fR1VFU1RfSEFORExF
KHhlbnBmX2dldGlkbGV0aW1lX3QpOw0KPiA+ICtzdHJ1Y3QgeGVuX3Byb2Nlc3Nvcl9jcHBjIHsN
Cj4gPiArICAgIHVpbnQ4X3QgZmxhZ3M7IC8qIGZsYWcgZm9yIENQUEMgc3ViIGluZm8gdHlwZSAq
Lw0KPg0KPiBBIGNvbW1vbiB3YXkgb2YgY29tbWVudGluZyBvbiBzdWNoIHdvdWxkIGJlIC8qIFhF
Tl9DUFBDXy4uLiAqLy4NCj4NCj4gSW4gYW55IGV2ZW50LCBoZXJlIGFuZCAuLi4NCj4NCj4gPiAr
ICAgIHVpbnQ4X3QgcGFkWzNdOyAvKiBwYWRkaW5nIGFuZCBtdXN0IGJlIHplcm8gKi8NCj4NCj4g
Li4uIGhlcmUgKGFuZCBvZiBjb3Vyc2UgYW55d2hlcmUgZWxzZSkgLSBwbGVhc2UgYWRoZXJlIHRv
IGRlc2lnbmF0ZWQgY29tbWVudA0KPiBzdHlsZS4NCj4NCg0KQXBhcnQgZnJvbSBDYXBpdGFsIGZv
ciB0aGUgZmlyc3QgbGV0dGVyLCBkbyBkZXNpZ25hdGVkIGNvbW1lbnQgc3R5bGUgaW5jbHVkZSBm
b3JtYXQgbGlrZTogSU4vT1VUOiB4eHg/DQoNCj4NCj4gSmFuDQo=

