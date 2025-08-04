Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 59D28B19B28
	for <lists+xen-devel@lfdr.de>; Mon,  4 Aug 2025 07:49:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1068753.1432618 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uio3I-0000t6-D7; Mon, 04 Aug 2025 05:48:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1068753.1432618; Mon, 04 Aug 2025 05:48:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uio3I-0000q5-6o; Mon, 04 Aug 2025 05:48:04 +0000
Received: by outflank-mailman (input) for mailman id 1068753;
 Mon, 04 Aug 2025 05:48:03 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=owTc=2Q=amd.com=penny.zheng@srs-se1.protection.inumbo.net>)
 id 1uio3H-0000pz-2O
 for xen-devel@lists.xenproject.org; Mon, 04 Aug 2025 05:48:03 +0000
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on20609.outbound.protection.outlook.com
 [2a01:111:f403:200a::609])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 91b02cf2-70f6-11f0-b898-0df219b8e170;
 Mon, 04 Aug 2025 07:47:57 +0200 (CEST)
Received: from DM4PR12MB8451.namprd12.prod.outlook.com (2603:10b6:8:182::7) by
 CY8PR12MB8196.namprd12.prod.outlook.com (2603:10b6:930:78::17) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8989.20; Mon, 4 Aug 2025 05:47:51 +0000
Received: from DM4PR12MB8451.namprd12.prod.outlook.com
 ([fe80::b04e:2da5:7189:4c4d]) by DM4PR12MB8451.namprd12.prod.outlook.com
 ([fe80::b04e:2da5:7189:4c4d%7]) with mapi id 15.20.8989.018; Mon, 4 Aug 2025
 05:47:51 +0000
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
X-Inumbo-ID: 91b02cf2-70f6-11f0-b898-0df219b8e170
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qPoxAldojGdiH0xBUrYHOx7Cof8F+VURFAcfPjy8rYL6frSiWcUfIQB5f/Hsts17bZiPnBGGlgrGNmBHw3FK10E43XFclpHcXOwpOdsHjbyi+5Wo0/FMtdkVh5IRCdxf4OUUlNb0XY7vVa/oNbnOISUSDd6IXeaxbj0Yt4AleuOahM7FS2vlwqfvrAPik4ygGJI+b0zXk6bBnK5VX2uaxLp+qIv/ZMzTr+VdBqUaS1r+s4AbxOw8om11QSPfmF4AOQwAad42y/5F+zF/eiQff9M2KhXqCVqouhNBaf1pCwVaB+rH61Ys9cV3TCimqiauA3MGu9YuoG6X/wcpfmdKpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZBK2kaKkvA0SGmUyLNgD1ovYSGR86Ql41qh9k1MT3Yw=;
 b=SO4CsSRSUBZcTTUwcV/zt/EzcLrJdwgjPVuscxnyD/I4cSrZUhSLdgLJXCcWfoNgPM8D9dS3X4C5yHT7/mF4p8kQkfvuDHfKtYGGAlIUnEJnQcseZ+QbAODiTQEIEdE4Nc3vDLz4/8dMS23cS4saGoXyCvcNgDYyj+FY70zwqO9inyc/J0jJPg96nKUeXQKt7pdYc4EHRfuIngCkUvBrLPQZj1w6RaEqdGC0ZUC284TgXSpVyFrKmd2PulQa/Vok1r3NX7Kq3zK4C4aDCFatqeD07/Pi1/IbCd0ONHFvSU9lYpmTUxzBdPQwRG4AodD66JmHYcC9PiiU8g4e949+Ew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZBK2kaKkvA0SGmUyLNgD1ovYSGR86Ql41qh9k1MT3Yw=;
 b=cVmWSeKmHBe+x9KkHQMsjkEmHnsmEJDlUASzrFcC5Z1atYLNSyXv6PoKibrvIQCZkyTBLyv7IXDxHF2lRBhBdavEniyV/tfvj1GItqeT2Tqq2/jXCJzPisV+sF+VcNdytswqqNjrvAZ1IbiFi7kEN+2mdFhbyV6i02PFXZi8N8s=
From: "Penny, Zheng" <penny.zheng@amd.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "Huang, Ray" <Ray.Huang@amd.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
Subject: RE: [PATCH v6 05/19] xen/cpufreq: refactor cmdline "cpufreq=xxx"
Thread-Topic: [PATCH v6 05/19] xen/cpufreq: refactor cmdline "cpufreq=xxx"
Thread-Index: AQHb8hcZyJcOgUanrEKBu4lvlAPx+bQ04KUAgB0+LSA=
Date: Mon, 4 Aug 2025 05:47:50 +0000
Message-ID:
 <DM4PR12MB8451A993F94C92ED054A591FE123A@DM4PR12MB8451.namprd12.prod.outlook.com>
References: <20250711035106.2540522-1-Penny.Zheng@amd.com>
 <20250711035106.2540522-6-Penny.Zheng@amd.com>
 <e9bc1036-2ab4-4e9a-9d43-8e11d4f67776@suse.com>
In-Reply-To: <e9bc1036-2ab4-4e9a-9d43-8e11d4f67776@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
 MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Enabled=True;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_SetDate=2025-08-04T05:35:01.0000000Z;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Name=Open
 Source;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_ContentBits=3;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Method=Privileged
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR12MB8451:EE_|CY8PR12MB8196:EE_
x-ms-office365-filtering-correlation-id: 67cfb7b7-f0be-4500-7a1b-08ddd31a7306
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|376014|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?dTdjQUx4Vm5LMjAxTk42MjczKzFIRUpqNW5tU0FPTkJsOFhhS0hpWVBJN3pD?=
 =?utf-8?B?N2NRZ0xXY0JHaTQvWk9uMGF2Tk1VMFNKWGxQbWJhMGNrMGxYZFBaUWVpK2xu?=
 =?utf-8?B?bHZVWkFYbUVzTmhqRXR0SUFrNU1TUUJLQUU2WlQzNmttbWpJUEpyNVloUnFu?=
 =?utf-8?B?MTZ3aVgwU1RYb082dkZRcU1uL2QvTS94cVg3MUhuQk9qRUtrN2h4MmFGSVVw?=
 =?utf-8?B?L21FeEJEL1Nvcmk2SnBmYmNiYVFBVmFIblNSUkFPWlYxSUcxNlUrd0ltMkF3?=
 =?utf-8?B?TC9LUGxaaFZ3SGVlSWNybHBsZVNSUG45OGpzNFdFODFzN0FlMVcxMG05YmNn?=
 =?utf-8?B?SXVHVnU5NnM2c1RUaXJiMEJmRE5GUlFsWkhLL2hlVEpPR2t5M0k1VnZxUDJG?=
 =?utf-8?B?NDdpL2ppQkExaTFDNjRzQ3luOE5sU2kwUXBBZzBZMmt4NzRMWTFESERlVk1x?=
 =?utf-8?B?a2xac1dOUVBLc1p3STVwZ0lFV0RRRjl0WE5JLytKS0N0OEFzVkhFZjdlc3pG?=
 =?utf-8?B?bll4R0NwVWRvUk9yUTlWN0hFc1J1N1NzVTdMRHlYU0FINXVmclc3N1lUWW4v?=
 =?utf-8?B?aHZJb0x3TlFxbkNwSzBhbWYxRXBmMm91bFFDdEk0Z00vMnR5aXd0c1lMY2Jx?=
 =?utf-8?B?RWN4SWR2TFROZlRhOUI5RU9wQmtHaFY5c2tXYVI2dVhsVUtxZkU4YjkwTUZx?=
 =?utf-8?B?SGFGYUdmNTdWaWpFVVVrQjF6NW9YVDAzTmExdERwWjJJbkVMYzJjTGdCS0Z1?=
 =?utf-8?B?cTM3dTRIbFZnOUdwZGZWekZFZ0JmNjBreUxCQ3V4Vm1MUjdSZDJpVVFpWk9W?=
 =?utf-8?B?QS96MVo4d1VLWmg5OWIyNFhFdGpRQU5OdkUweGtNb21vcWM2WUd5N3lDTjM4?=
 =?utf-8?B?SDBpblZ6MjAyam82Q1g0aHNwVkRFc0I4bUY0S0RpdmJIeFVQSmJRUjdCZlFq?=
 =?utf-8?B?bVFzU210TTNrYnpEQUNOTUVqTzZhUUw2TU4xK0YwckFIdEh2RXdscVdKZEFH?=
 =?utf-8?B?cmx2ZmE1a0V6dnNLNnhUVVVJcnpTa0lDbjZWOWlheXZadUxIdGd5Z3Y0bmI4?=
 =?utf-8?B?dE5BV2RCRU1JdndjVnNJa1NpcDZIS2s4Mmx0dFhDdnBDVi9jSGhVbCtnakQr?=
 =?utf-8?B?UE1LOVVuVUFFUzZGN0twWGI4WElmUDBtYnhzR093UEVHenI3UTlLZExyTUdS?=
 =?utf-8?B?a0tuejlSRzFmRG8vNC8xeXZyaUVCcXQ2YW9YT0FURXJOdzh0UUowYUI2anJ3?=
 =?utf-8?B?OStKemRGOFUxZ3kzVXBkbEdOUHdSaVVvUGFjK1V5Y3BOVHJUK3lQdFdGNUI4?=
 =?utf-8?B?dE5UM1MzNkxvbnFJSW5BZzVQOFhQUkh4SzJoMnhwaitmREVROHRXQ2hlUk5E?=
 =?utf-8?B?U0lUdGY1clJBRG92eTJTSDRyVlF4bUIwOGtOaXRwU0tBRTNaZGg2bkZHeENB?=
 =?utf-8?B?VzA2aWdRR2RqY25aU29INmkvQmpQWWt2QStoNExDZk1PSnpjWHVtQ3NQZUIy?=
 =?utf-8?B?YVoxSkNYbXQrL21BdXJkVkRCbFFpOXFCNDEyNzFLQVlsZlhub2lVek5ZaUR0?=
 =?utf-8?B?WTljbWVYSTZYOWIwdEc2dHJyRE1iaFQwN1lmV0lHeUhUeFBNK0t1ZXcrVDlZ?=
 =?utf-8?B?MHFDcFFwSUpVdWxUUWJXdE11N284T2VscmFDdWo3NDU3NDlqd0h1bVhYeEZB?=
 =?utf-8?B?Q0kycE1UZEd1RlQvTFI2eEorOVlwdXpUaFE2NE5qU3RvK1pCSU1MQlJBZ1hk?=
 =?utf-8?B?U09LejQwbHQ4YVN2b1Zmejl1Y0ZjSVJKS1JpaERacFdhNHkrTm1Mclh4YWE3?=
 =?utf-8?B?enUxbnBINEkrSmk1UVlGNXpYNW9DdUpTeHRKTlh6ZWd3NngzeGUrMEpidXZm?=
 =?utf-8?B?dlJ4aldVOXBqY2o0eVpPMGp3Y1Q4bEkwRzdBOTVsdGU4L0FqKzVqY1p4Z3pU?=
 =?utf-8?B?WUp5SE9VbkNHb1l5eHl0OEZYS2taRjBCZTlXa2pITTQ1Mk9jRGdXMWlEaTJ6?=
 =?utf-8?Q?O1eyFrALNqwmkEAA4V/nxZFx1BQdfE=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR12MB8451.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?WVo2RlJJU1RzZGFER2pMcFZBN2hRWG5LOXdHMHJBMU8wTWdjdmxDb1hRSDU3?=
 =?utf-8?B?U1FNNjVSZHppRlcrSlRsRUNQUmorVFBSUCttVHhQblluU0ZEbHRhZ1FKMmhG?=
 =?utf-8?B?blJMRU0zY0NhbTVPRWJjTEJFQTdZM1F4b0ZCd0dudWZQYjY5UXRNOUZPMGRS?=
 =?utf-8?B?T295VXR2S2VwYmllNk1xMnZsMkh5RDJrQTZOTFhTNXNPVXc4RmpPeDRIUlZ0?=
 =?utf-8?B?eDBGN21kVlZkUHRTbm9sN21ISWFtbEZHdjZBTElEeE9EZTRCbmptd1lpTE5O?=
 =?utf-8?B?MnJBQ0lGRForeERVWXN5QkNXWkNGL0UrWEhOdU9pNVpxUVQxV2ZKbk45eTIx?=
 =?utf-8?B?eEtYdDl2dTM5N3huTVQ1ek95OVV4Ly9kUFJ4Vi8xZUxDRVBUTHVYT2ZwTFVU?=
 =?utf-8?B?R3NDOWdUTitsS0RZaG0xZnlScml1ek9xS0dhdXU2akpzWXJwS3hFa2xtUWpM?=
 =?utf-8?B?czVEMGJsVUl5NGFvT1U2YXdKMkJKS3N1R1I0bW5Fd082ZHpVT1dUcDBJVXBY?=
 =?utf-8?B?VHU0YXRGYXFnRFBLL3ZWSjQ4TE0wbGtNK0pYZUw5ZWxtL0FxRzlqWmVvQnRZ?=
 =?utf-8?B?UnBPK1ZuaWg4czlXVTZwbDJwZERWVVFzWkVqOGx0S2gyTTZ4MFR0RHdheUNS?=
 =?utf-8?B?WWVRbktWakp4Y3poSEYvczdtSjdjemZVRy9kZndsKzV4S0RYQWhva0h4ZWUx?=
 =?utf-8?B?U1E2c2s5RUdLbldoZTBYdktCaXFJUTBzZzUwRFlXcmN0a052c0FkN093OExt?=
 =?utf-8?B?TWRFcFN4WTZXM1lZTVViVElnbXFBd3pDbng2MjNtOWIrcHNrdzl0NEs5SjJS?=
 =?utf-8?B?OGwxMzFGWWNkaHVYREF2cVFPU1pwanZsbzBGUU05dHBNSWh6b3NiZHI5QXUv?=
 =?utf-8?B?THdPQTc3c2hrOWhFRnRpcEU1OUF6UkhobVEzOTh4UzhhNCtIQmVLSHFQK2RQ?=
 =?utf-8?B?am5hWDAvU0RrTnFJZVBENEh2YjNObUMzbmRFRUN1ME1EclpPYWtwaFFFYXZB?=
 =?utf-8?B?SDNnOFVWb0p1UVdyRHI4SHp2dDdJRnBTQyt5QlNiaUZNQmFyb01RU0FwMDlT?=
 =?utf-8?B?ZzJXMm1wQmQ1VXczZXpIbkF4a1VSMGw5Y3p4ZDNla0lZLzY0cW0ySU1JWjRy?=
 =?utf-8?B?MzJzbVBFbVoxQlBLenYreGZYeStMaTU0dGxPWWdpbGlNa1lMZERWc0tzTGQ1?=
 =?utf-8?B?T0NlSEhHcU1OTmpuYkdQR21ocU1waUxUY1J5QTVxYy9PTWlzUTVRemRXNm1F?=
 =?utf-8?B?b29EYlN3TlUyZGpCY2JTSjZMcmNTd1Ura2t3Umh3c0FhbysyamZUbXErL240?=
 =?utf-8?B?YTJYbDU0QVJxWFFxRzRFMkpkK2hZRnQ4OVF1TzNpUEJTeEFpNVFHNGF6SnRu?=
 =?utf-8?B?M2UyVjIwblc1bFQ5NjRqd3l5SXZtVFRpSGRiU0NPUlhTa1RKSXg4c2NUZnMr?=
 =?utf-8?B?S3pRNHVqcURHcGZIZ1JXb2ZZaWNNL1Ixc01mMmJSZXZlLzN2aEgyNnNoOE8v?=
 =?utf-8?B?aFJxTW5XVW5kL2crNTNyODRXMGpYRVNEQUNPNTBpbjRPQ09KUXF6RGVGcUVv?=
 =?utf-8?B?REFNUVZKdWZjMGlqWmZIeFEwTnVIOEpIM1F5TzQ2RVJsa1VJS1MvbnRtbVl0?=
 =?utf-8?B?QUhOOGJSdFhQZ29KUzFqWnFkUjE1MjlPdjF5NGo3R01IMHNjMzdpOTBYNTIv?=
 =?utf-8?B?SUQ4RzRQQlk3ZThqQ0lNYzNKczd0NTNMeHBGMnQwSXhJa01IRHIzQVZWYUtp?=
 =?utf-8?B?a3lwUDZ5NkloMWNEQStwWFRxMlg2R01uMmRXNnpLdjhEMHR1MXYrMU1wK3Y4?=
 =?utf-8?B?SDJWaUVvMzVwMW94K3Q2WWNhaHFQT3JQS01NYkd3NEdBWUhqVHE3OHhjNHNQ?=
 =?utf-8?B?V1p6SkpuT0ltaVo1WXhWeFJGcDhyWXVxU0pDbUVDNksxOFZmZXNqNTFHTStS?=
 =?utf-8?B?Q1psRzhGRkszaFc3eVh2VjV5cXFuQTU1NWRHT3dpWTY4am5nSTc0YTZBdTdK?=
 =?utf-8?B?NUF3QVUrMHpKYzRZeXp3Q29Ca3piNndXd0NzL2lYUnhiY3hZdlcwdlo5Wndh?=
 =?utf-8?B?ek5rcVFHS0NOVEVPazZmazg5RlNsaGRtSzU2OFBORURBYi9LSUl3U1lDVjFX?=
 =?utf-8?Q?84bE=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB8451.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 67cfb7b7-f0be-4500-7a1b-08ddd31a7306
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Aug 2025 05:47:50.8477
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: XWr3Gbq27kJ8aYHk2U7LPq3OwMahIIna7sZgb6bBbW4B3lNehJfnHdpcwu7fCIAT3GiubB71Y4y9cijWTCTQxw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB8196

W1B1YmxpY10NCg0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBKYW4gQmV1
bGljaCA8amJldWxpY2hAc3VzZS5jb20+DQo+IFNlbnQ6IFdlZG5lc2RheSwgSnVseSAxNiwgMjAy
NSAxMTowMSBQTQ0KPiBUbzogUGVubnksIFpoZW5nIDxwZW5ueS56aGVuZ0BhbWQuY29tPg0KPiBD
YzogSHVhbmcsIFJheSA8UmF5Lkh1YW5nQGFtZC5jb20+OyB4ZW4tZGV2ZWxAbGlzdHMueGVucHJv
amVjdC5vcmcNCj4gU3ViamVjdDogUmU6IFtQQVRDSCB2NiAwNS8xOV0geGVuL2NwdWZyZXE6IHJl
ZmFjdG9yIGNtZGxpbmUgImNwdWZyZXE9eHh4Ig0KPg0KPiBPbiAxMS4wNy4yMDI1IDA1OjUwLCBQ
ZW5ueSBaaGVuZyB3cm90ZToNCj4gPiAtLS0gYS94ZW4vZHJpdmVycy9jcHVmcmVxL2NwdWZyZXEu
Yw0KPiA+ICsrKyBiL3hlbi9kcml2ZXJzL2NwdWZyZXEvY3B1ZnJlcS5jDQo+ID4gQEAgLTY0LDEy
ICs2NCw1MyBAQCBMSVNUX0hFQURfUkVBRF9NT1NUTFkoY3B1ZnJlcV9nb3Zlcm5vcl9saXN0KTsN
Cj4gPiAgLyogc2V0IHhlbiBhcyBkZWZhdWx0IGNwdWZyZXEgKi8NCj4gPiAgZW51bSBjcHVmcmVx
X2NvbnRyb2xsZXIgY3B1ZnJlcV9jb250cm9sbGVyID0gRlJFUUNUTF94ZW47DQo+ID4NCj4gPiAt
ZW51bSBjcHVmcmVxX3hlbl9vcHQgX19pbml0ZGF0YSBjcHVmcmVxX3hlbl9vcHRzWzJdID0geyBD
UFVGUkVRX3hlbiwNCj4gPiAtICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICBDUFVGUkVRX25vbmUgfTsNCj4gPiArZW51bSBjcHVmcmVxX3hlbl9v
cHQgX19pbml0ZGF0YSBjcHVmcmVxX3hlbl9vcHRzW05SX0NQVUZSRVFfT1BUU10gPSB7DQo+ID4g
KyAgICBDUFVGUkVRX3hlbiwNCj4gPiArICAgIENQVUZSRVFfbm9uZQ0KPiA+ICt9Ow0KPiA+ICB1
bnNpZ25lZCBpbnQgX19pbml0ZGF0YSBjcHVmcmVxX3hlbl9jbnQgPSAxOw0KPg0KPiBHaXZlbiB0
aGlzLCBpc24ndCB0aGUgYXJyYXkgaW5kZXggMSBpbml0aWFsaXplciBxdWl0ZSBwb2ludGxlc3Mg
YWJvdmU/IE9yIGVsc2UsIGlmIHlvdQ0KPiByZWFsbHkgbWVhbiB0byBleHBsaWNpdGx5IGZpbGwg
YWxsIHNsb3RzIHdpdGggQ1BVRlJFUV9ub25lIChkZXNwaXRlIHRoYXQgZGVsaWJlcmF0ZWx5DQo+
IGhhdmluZyBudW1lcmljIHZhbHVlIDApLCB3aHkgbm90DQo+ICJbMSAuLi4gTlJfQ1BVRlJFUV9P
UFRTIC0gMV0gPSBDUFVGUkVRX25vbmUiIChvciB1c2luZyBBUlJBWV9TSVpFKCksIGFzDQo+IHBl
ciBiZWxvdyk/DQo+DQoNClRoZSBjcHVmcmVxX3hlbl9jbnQgaW5pdGlhbGl6ZWQgYXMgMSBpcyB0
byBoYXZlIGRlZmF1bHQgIENQVUZSRVFfeGVuIHZhbHVlIHdoZW4gdGhlcmUgaXMgbm8gImNwdWZy
ZXE9eHh4IiBjbWRsaW5lIG9wdGlvbg0KSSBzdXBwb3NlIHlvdSBhcmUgcG9pbnRpbmcgb3V0IHRo
YXQgdGhlIG1hY3JvIE5SX0NQVUZSRVFfT1BUUyBpcyBwb2ludGxlc3MsIGFzIHdlIGNvdWxkIHVz
ZSBBUlJBWV9TSVpFKCkuDQoNCj4gPiAgc3RhdGljIGludCBfX2luaXQgY3B1ZnJlcV9jbWRsaW5l
X3BhcnNlKGNvbnN0IGNoYXIgKnMsIGNvbnN0IGNoYXINCj4gPiAqZSk7DQo+ID4NCj4gPiArc3Rh
dGljIGJvb2wgX19pbml0IGNwdWZyZXFfb3B0c19jb250YWluKGVudW0gY3B1ZnJlcV94ZW5fb3B0
IG9wdGlvbikNCj4gPiArew0KPiA+ICsgICAgdW5zaWduZWQgaW50IGNvdW50ID0gY3B1ZnJlcV94
ZW5fY250Ow0KPiA+ICsNCj4gPiArICAgIHdoaWxlICggY291bnQtLSApDQo+ID4gKyAgICB7DQo+
ID4gKyAgICAgICAgaWYgKCBjcHVmcmVxX3hlbl9vcHRzW2NvdW50XSA9PSBvcHRpb24gKQ0KPiA+
ICsgICAgICAgICAgICByZXR1cm4gdHJ1ZTsNCj4gPiArICAgIH0NCj4gPiArDQo+ID4gKyAgICBy
ZXR1cm4gZmFsc2U7DQo+ID4gK30NCj4gPiArDQo+ID4gK3N0YXRpYyBpbnQgX19pbml0IGhhbmRs
ZV9jcHVmcmVxX2NtZGxpbmUoZW51bSBjcHVmcmVxX3hlbl9vcHQgb3B0aW9uKQ0KPiA+ICt7DQo+
ID4gKyAgICBpbnQgcmV0ID0gMDsNCj4gPiArDQo+ID4gKyAgICBpZiAoIGNwdWZyZXFfb3B0c19j
b250YWluKG9wdGlvbikgKQ0KPiA+ICsgICAgICAgIHJldHVybiAwOw0KPiA+ICsNCj4gPiArICAg
IGNwdWZyZXFfY29udHJvbGxlciA9IEZSRVFDVExfeGVuOw0KPiA+ICsgICAgQVNTRVJUKGNwdWZy
ZXFfeGVuX2NudCA8IE5SX0NQVUZSRVFfT1BUUyk7DQo+DQo+IFRoaXMgd291bGQgYmV0dGVyIHVz
ZSBBUlJBWV9TSVpFKCksIGF0IHdoaWNoIHBvaW50IE5SX0NQVUZSRVFfT1BUUyBjYW4gZ28NCj4g
YXdheSBhZ2Fpbi4gV2hhdCdzIHdvcnNlLCB0aG91Z2gsIGlzIHRoYXQgb24gcmVsZWFzZSBidWls
ZHMgLi4uDQo+DQoNClVuZGVyc3Rvb2QsIHdpbGwgdXNlIEFSUkFZX1NJWkUoKSwgYW5kIHdpbGwg
dXNlIGlmKCkgdG8gZXJyb3Igb3V0DQoNCj4gPiArICAgIGNwdWZyZXFfeGVuX29wdHNbY3B1ZnJl
cV94ZW5fY250KytdID0gb3B0aW9uOw0KPg0KPiAuLi4geW91IHRoZW4gc3RpbGwgb3ZlcnJ1biB0
aGlzIGFycmF5IGlmIHNvbWV0aGluZydzIHdyb25nIGluIHRoaXMgcmVnYXJkLg0KPg0KPiBKYW4N
Cg==

