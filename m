Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A017A3B271
	for <lists+xen-devel@lfdr.de>; Wed, 19 Feb 2025 08:33:15 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.892389.1301367 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tkeZ0-00048f-Kk; Wed, 19 Feb 2025 07:32:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 892389.1301367; Wed, 19 Feb 2025 07:32:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tkeZ0-00046I-Hu; Wed, 19 Feb 2025 07:32:10 +0000
Received: by outflank-mailman (input) for mailman id 892389;
 Wed, 19 Feb 2025 07:32:09 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ODj2=VK=amd.com=penny.zheng@srs-se1.protection.inumbo.net>)
 id 1tkeYz-00046C-6o
 for xen-devel@lists.xenproject.org; Wed, 19 Feb 2025 07:32:09 +0000
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on20628.outbound.protection.outlook.com
 [2a01:111:f403:2418::628])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9e746e3e-ee93-11ef-9aa8-95dc52dad729;
 Wed, 19 Feb 2025 08:32:06 +0100 (CET)
Received: from DM4PR12MB8451.namprd12.prod.outlook.com (2603:10b6:8:182::7) by
 CH3PR12MB8329.namprd12.prod.outlook.com (2603:10b6:610:12e::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8445.19; Wed, 19 Feb
 2025 07:32:02 +0000
Received: from DM4PR12MB8451.namprd12.prod.outlook.com
 ([fe80::b04e:2da5:7189:4c4d]) by DM4PR12MB8451.namprd12.prod.outlook.com
 ([fe80::b04e:2da5:7189:4c4d%6]) with mapi id 15.20.8466.013; Wed, 19 Feb 2025
 07:32:02 +0000
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
X-Inumbo-ID: 9e746e3e-ee93-11ef-9aa8-95dc52dad729
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hhpKIZX+DRrVNYu7PW2jyXcYhRhxYGESbZP5IM4ySqhBbgDl72yY2UT0k5qvaBWQtJTPhoavIzKRjlylvd8HiH/QAh1u4nhz++rMMvBUXC+symWAAmj5RmTu+u10UZFrrMZH7m/LzJHDm4UMCKgY3TkRcIjTsJsbW9qYqB10etGYCJqjay5ZPWYhDwoZR+UVHn8Zh5CKTey8mW6LFDkNH+2OblSncPd9g7OQHi6vZVLE7e5c1rzxBrT1FV6TTvxXULCElr5/yzniaSMUw3QE5Kbo0XSPxqMX4eWEgE8oEtLaADGOV4GKmaBF+i0o83IjhvkPHQ0bbFVgw4g6ylqRKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FY3bgAgV90s4Zh8D6FJa0014niVPN+8Tdxx65c3HMZQ=;
 b=RqU8LX99BnGhZ5T4HL2QjxncLmHpzCxhw9rpYa5HKVVQpryACzllHux5X1Y6NGdS1XWIlhY7OF9Wa1uD69EFGG88vQn5Wnk+H3emuLuPgJgVXXBjHWzjh4sl2Wgf+eWaHG3RFmd4ctw67Sr0ev3ZMtDmTcHJHIOkqSite3Lbq/7Duff1xnzpYJm8eLhJVxhvrdypMAkSgofyN4vFANh6j+YURES/xBnbHW4R/ALhqgYuhLgxdnCEiHIanmm1Y1ItCS3B09RX6Fctu8sORpKYR8edQkwlz/e9pje2LidnF3aIAgM86R1hHd1YofXhWsYX+iJNXlcGXvMfckVoqsYqAw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FY3bgAgV90s4Zh8D6FJa0014niVPN+8Tdxx65c3HMZQ=;
 b=doD3pmOeRtsD7emjKDGh63jg3Igq0QtUzYIvHo8kjS5RQRubayeQl5ag7GTAjDHecusKIdIDDL4a9s0AGCh8dLxpHXZxVWhqpJUOibaut0QK+uskhrizwMYv738HX3k8xu2JvYU3EdyaAk+9Kk0Jtj4hKArIceGDRtz0IHhXLdA=
From: "Penny, Zheng" <penny.zheng@amd.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "Huang, Ray" <Ray.Huang@amd.com>, "Andryuk, Jason"
	<Jason.Andryuk@amd.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
	=?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: RE: [PATCH v2 04/11] xen/amd: export processor max frequency value
Thread-Topic: [PATCH v2 04/11] xen/amd: export processor max frequency value
Thread-Index: AQHbeHHNz+yPLcfmW0WrRfgDeQNp47NCKNYAgAp8kWCAAJUBgIABEyNg
Date: Wed, 19 Feb 2025 07:32:02 +0000
Message-ID:
 <DM4PR12MB84519B5C5A16AAD9E695DBCCE1C52@DM4PR12MB8451.namprd12.prod.outlook.com>
References: <20250206083255.1296363-1-Penny.Zheng@amd.com>
 <20250206083255.1296363-5-Penny.Zheng@amd.com>
 <5d19f9a6-2be8-4a69-a9c8-19a0e4196e44@suse.com>
 <DM4PR12MB8451598930C730001060B1DEE1FA2@DM4PR12MB8451.namprd12.prod.outlook.com>
 <6200aaee-25cf-4fe1-b71b-b8a0a3798afc@suse.com>
In-Reply-To: <6200aaee-25cf-4fe1-b71b-b8a0a3798afc@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_ActionId=f4fb025f-8f50-459f-9655-1512c0cee04b;MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_ContentBits=0;MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Enabled=true;MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Method=Standard;MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Name=AMD
 Internal Distribution
 Only;MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_SetDate=2025-02-19T07:23:48Z;MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Tag=10,
 3, 0, 1;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR12MB8451:EE_|CH3PR12MB8329:EE_
x-ms-office365-filtering-correlation-id: b5c7418b-f992-4f7a-32cf-08dd50b780dd
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|366016|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?MEMyVGc0ZnVON0MweTlxaUhxK1NZYkEvTlFOM2dHcjZOcVBKYTdOdUVCKy9H?=
 =?utf-8?B?QUlTV1FLREk4WTF1dVU5LzUvaFcvY3dnUllrOXFUaVNEcWpGSnFkWVdKNWJj?=
 =?utf-8?B?NGdZcll5OW5qODlBeTArOTlZRTU2MnV1cjFEL3B3YkRmRGp2M1owT2c0QTJh?=
 =?utf-8?B?YkJpRnJtK1ZMdXJ3VGo3YjBOM2FSY29iZHdJUDZnb2RxTjF3K2l4VlozOXN0?=
 =?utf-8?B?MTJTazFKdWxVNys3b2FSSnIxL3kvNzNRQ3U5QUtqL2RDd2dNYThEQXFlZVZ6?=
 =?utf-8?B?SzZPV0VldlNmN3dSbEdTTXVOV0JVajF5TFovbUNvdkVvRmU3VmtZK0Q4UXhw?=
 =?utf-8?B?Wjl6QlFkbHQyMDBSUWJKdS9FRURHTjk2UVB4V3RTbXB3Rk1iVFJtS0FpSm4w?=
 =?utf-8?B?cDk4UklTZVVwL2RPK1hwaGRXNzNkbFN0cnA4cDVlNUk5dm45bWlOUllKSzNG?=
 =?utf-8?B?bnRQVkcyMU0vRm9Ma0U1WWNjdnZRWkN2VWQwOTUxYmZ4YzVNR24rN1BObmNa?=
 =?utf-8?B?cjN4NU0xUFJleXkyaGsvNERoNVVzU0JmTVgzVk9Ma2JmU1ZZdWs5SjU1Zkg1?=
 =?utf-8?B?OXkzeWxma1ZYWGlLU1lBd0R0bzlRNWFtMTR0ZlhVQUFWeTVLd3p1SjI0a3Fn?=
 =?utf-8?B?REV2VUJCYmsxRFNYK3BvSUUyTlhwZ1MvWXlPNGRtZUJpZ0tnc0JlNUtGQS8x?=
 =?utf-8?B?QTM5QktrS1NkU3EvQ0RucTRyazdvNXM3R2JqWWgwT0hlVG5EaDRRa3gxaVo3?=
 =?utf-8?B?SWVLUEx5bEJweWlLUmtuZmVxZ3dLNGsxUnNYekl0YTdhZHFVWjBNazFmYTRw?=
 =?utf-8?B?MDdyT0d6Tmwya2JCQVFteThWL2QweW9YUHlRTFNTb2IrbFdTRFJBV2xBcm9E?=
 =?utf-8?B?RGpQbmZaVHloRDJscXllWTdSbUtIdTFlZEdKb1pZRjRXUURjUVc3bEl3MVhp?=
 =?utf-8?B?ZHROZmluamNnUU9iQU1IRFZOeHJuZTBRdXdpL0hqUTBlc2ZOcHcvQUtZV0NC?=
 =?utf-8?B?M3pKYjNoVFpJbE5zL0RpL2o4NVRObU1Od1plb09MSldaWkFyYXcwNktmUm1E?=
 =?utf-8?B?M3JRQmpNclNiZC9xeGQ1OUxCZ2dVMHEwVFpaaHhRMmZPcGprbE1BRENBN3cx?=
 =?utf-8?B?WXJBNFlpVWcyRnRURmQxTkViYTBpRlBTM2xNTlZsZXhzMllOTFAzU1FNMVRr?=
 =?utf-8?B?VjAwTWpJaGljNDkvVzNQSVpZd2dLTTBKcm9jOFRTZ3FiSjVGUURNdDJSLys0?=
 =?utf-8?B?VDJnSHNGMUVQdlFCTVkzMUZWUnRuYTdDT25KQk5ZbDk1Qml6MGx3UXhVMC9J?=
 =?utf-8?B?K2R5WldMNjljOWxCbk1uWFhmNTdpaXdQSDVxTis2S0p0NUZWUFVrZ0hGU1pD?=
 =?utf-8?B?ZjYyUTUwbW9nZDFEUXhOcXEydXpXSTR2bDFxcEVHaVpYN2VER1VXY3R2ZmNh?=
 =?utf-8?B?Z01mS0dob2lPblhFVjg2OWpvK3B0cDBlRS9DYjBqMFZoYS9HdGRBNjZpakVP?=
 =?utf-8?B?YXBrK3ozZ012aDBDTlI3R25pMTJtd1FiaHFOSFVpM2QrWjY2bng0YUNUd1l3?=
 =?utf-8?B?TS8vTjJrTDBQVnVGZTc4MmNPdDZYZCtZaDRXWDZUbk1SZlVuTHdHYTQ5QzMy?=
 =?utf-8?B?VEVSbjN2aVdjTE5IRHBiWnJJenlzZHJkRThWWFBsemRjV1ppVjJ6SmRCSWJ5?=
 =?utf-8?B?bjkyaE5OdFd5SUdJaDhkU3JCb1JiOXEzcmpndWhWbjhEZmhyZjRVTmFiR0hk?=
 =?utf-8?B?SHhtWUcvUFRKRS94MHIvM214ZW81VGN2Vlk5bG9lQnc0R0o0MDUwNkpEM3BS?=
 =?utf-8?B?MWZqa3FJb01GdENEU1dWc1BVc0tOUDZlcUF2ejRXTjhHU3E1R2tINW5XZkZ3?=
 =?utf-8?B?cGpGZDVUTFl4V3kyQ21TRzJiZWZKSVI0N2UwamtzK3kxRGc9PQ==?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR12MB8451.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?ZE11SzNRQzJWSWk0STRETjNzb3UrMWtNVWVDOEdRQWtJRmJOZldaeHJyQ3c5?=
 =?utf-8?B?OUhJT3JpeGRVb1RSenRzY2I1TllKQXhudjlCYmFNVkJoTWwrTytvNFkxa3ZW?=
 =?utf-8?B?eUU3bkhpQko1Q04wbHpWUDU5VXl3cE1qem1PdnJPWFlKN3hkN0VvdU1mTXhh?=
 =?utf-8?B?Um1sT3VOeS9OQS9VckZadGhxQ3cvanNmZjBReWdBL1VrSFMwajJneVRUVlNN?=
 =?utf-8?B?d3FIeXpDOFRKS2JUelNGOFZEbExHejYyVURhRytDaGtDbi9JdnRzZmJERXhi?=
 =?utf-8?B?M2JaaGRaK1ZQZ2p3Z0xxNGZFeWFvYzlSSTVQTnZoUTZlZ0tjUnVjNnBlRUh6?=
 =?utf-8?B?MlpzdTZBRHRPWEMvRndXbW5HdmFWNzJLM1kxZjNaNmY5U2ViOWN2amR5ODBY?=
 =?utf-8?B?ZXA0SXRpWG1GdjJOSE56NFdtZFNqQmNmbzJRVGUwd1RXNEdZcFhMaXI3SXE2?=
 =?utf-8?B?MFFVb0pnTGpXUFZjR2hSZGRTRkxJQjFLUlpmSTQyMnJDeWRrV3pOZENCTjRD?=
 =?utf-8?B?ZU03MHpZams1cEVGYVR2L0FvNHJLSUJic3VvRFpoQ3N0SVZOUEYyeDhCZ29h?=
 =?utf-8?B?MTlrYk9MT1pocG9yb1d2TDEra1h4QXZ6Ujk1eEc5TC9BUjUzOXRuUVAwTGhL?=
 =?utf-8?B?eUNJY0RQUFFyUHRQbGZFMzZYaTZ3Qkdnb3R6Ymp3MjlmUUd3VmY3Ny9zQjdJ?=
 =?utf-8?B?SitZcDRrdUY5OWM0V3hIQzJzVmRpNDIvVStuMTJhNjIyUEpPOEd5TWpFeWdV?=
 =?utf-8?B?MXBsN1V4ejhmWTNtNlYrVTBNUXd2YVMwUmVnQk9mN2FxL3FqSmYyU00rM3Ax?=
 =?utf-8?B?YXFPMzlIM2I4dVlqcndDOWRpZ1ZzS1JnaXNHT0JzbC84ZG9YSXgwcHN1dlF0?=
 =?utf-8?B?YlFBZG9nWTdQVERLeFQ4SVNHTTdETFQ5V0pFMk1nU1ZnMnJMYUxzMGpseVFU?=
 =?utf-8?B?VytzOHIwRHZtRnMzR1NEdEVEdzNQMnNncmVydnFmWmtWRG1weFEvZTU1NVAy?=
 =?utf-8?B?OHh1aEdQeEZFQWhVS2hIQmRvNTgyQjdFSGRHWFNPeWY3a0tQNmNVaHdFQTZV?=
 =?utf-8?B?QmROandJa012WXNSY3R0aTNaSzhSeERINFJZclVrSlBjcHljRjZLa1MvRTlK?=
 =?utf-8?B?QXdZTDQ4bnFOaU5tcXg5dTZRWndkSHBMWFBCRzhwTTJKaVMrMW9Rd1ViVTBz?=
 =?utf-8?B?cGo1VGtzMERqSmRWQzJYVmZacWoySkd3bkh6TVdla0JQZm02dklsTXdGMi9L?=
 =?utf-8?B?R2czNFZSUUtkbEpjTUJHY2pIS0RBSWVwV0V5S0xCQnZEOUwvQTd6eUp0c25D?=
 =?utf-8?B?REFFWGZNWm1ncnNaK1FCYmdSTG9nbjhrMy9LK3JyMGdHamxvMzhJWTFad0Jh?=
 =?utf-8?B?UEx2bml2b1RhNUk2eEZTK0RCY1ZrNVZtTWNlOXhxNFc5MzBKYk16L3ZNNXRC?=
 =?utf-8?B?bkIzQkVxTW5wczM3NUZjTERuZ2R6dE1hampXOEJ0SnV3Rm9jd2FJVGRtVjJ1?=
 =?utf-8?B?bE5nOVVpZHBEVUptNnA2K01pSmtQSjlGM0dPYjU0cnhya3Mxcm9TaVVsLzM1?=
 =?utf-8?B?L0YzQ0NZODhwUjFKby9PY2NPdEtqNlFJb0grbjRIZXdwS2k2bjM0YytWK2VX?=
 =?utf-8?B?Wm9TdGNlYTNCcWhRZHp2amJXbkZFTXdZU3hIM2wvcm94dG5RSDkwazY0a09a?=
 =?utf-8?B?OVMzajQyVDYrVnBIT01GWFhLUElCOXlaRG1NWDZ3OXYwK2xVMEFTcTVSbFk4?=
 =?utf-8?B?dEc1ME8wWmp6N3g2NER3b09WMHhPZ3RoK1JIRldncUttL2gyWG14Snhzbitq?=
 =?utf-8?B?Zk5HbUVFb2psNlhOMHgxYUhzZWtCZUdWMERicmdLOHlCdkJ1U0pDZ3lXSDZ6?=
 =?utf-8?B?cUMyQ0E4RUlnZmhhYzBENjBlZ2p6bWN3R0g1TWtHWnhNZEZndjFucWFZYld0?=
 =?utf-8?B?WFZSUmNac0lFR3dvdFVNUlpxR0I0WFBNajNhdUdmM2FtU1MzdWtkYUJ3ZkRR?=
 =?utf-8?B?WGtNc0M3WUF4ZUxFVzZxSE1JQS9CejNoM3QvdERxRWZUMWpuMGt3NkNUaDhx?=
 =?utf-8?B?MjNkTHBoaXpoSnV1QTNLZWNHaTYyMlkwcjhTOWJWcDlQWUNuSkpTbFc5S2E2?=
 =?utf-8?Q?y0fc=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB8451.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b5c7418b-f992-4f7a-32cf-08dd50b780dd
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Feb 2025 07:32:02.7299
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: pxsEHpSsDbU9osZFul0pXAxTwf4hw5c5zHEATLKfAm9x/4U09Z5rzdVnVf5PtmGp1IJKs8328sz5nmJOqz+WvQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8329

W0FNRCBPZmZpY2lhbCBVc2UgT25seSAtIEFNRCBJbnRlcm5hbCBEaXN0cmlidXRpb24gT25seV0N
Cg0KSGksDQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogSmFuIEJldWxp
Y2ggPGpiZXVsaWNoQHN1c2UuY29tPg0KPiBTZW50OiBUdWVzZGF5LCBGZWJydWFyeSAxOCwgMjAy
NSAxMDo1OSBQTQ0KPiBUbzogUGVubnksIFpoZW5nIDxwZW5ueS56aGVuZ0BhbWQuY29tPg0KPiBD
YzogSHVhbmcsIFJheSA8UmF5Lkh1YW5nQGFtZC5jb20+OyBBbmRyeXVrLCBKYXNvbg0KPiA8SmFz
b24uQW5kcnl1a0BhbWQuY29tPjsgQW5kcmV3IENvb3BlciA8YW5kcmV3LmNvb3BlcjNAY2l0cml4
LmNvbT47DQo+IFJvZ2VyIFBhdSBNb25uw6kgPHJvZ2VyLnBhdUBjaXRyaXguY29tPjsgeGVuLWRl
dmVsQGxpc3RzLnhlbnByb2plY3Qub3JnDQo+IFN1YmplY3Q6IFJlOiBbUEFUQ0ggdjIgMDQvMTFd
IHhlbi9hbWQ6IGV4cG9ydCBwcm9jZXNzb3IgbWF4IGZyZXF1ZW5jeSB2YWx1ZQ0KPg0KPiBPbiAx
OC4wMi4yMDI1IDA3OjE0LCBQZW5ueSwgWmhlbmcgd3JvdGU6DQo+ID4gW0FNRCBPZmZpY2lhbCBV
c2UgT25seSAtIEFNRCBJbnRlcm5hbCBEaXN0cmlidXRpb24gT25seV0NCj4gPg0KPiA+IEhpLA0K
PiA+DQo+ID4+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+ID4+IEZyb206IEphbiBCZXVs
aWNoIDxqYmV1bGljaEBzdXNlLmNvbT4NCj4gPj4gU2VudDogVHVlc2RheSwgRmVicnVhcnkgMTEs
IDIwMjUgOTo1NyBQTQ0KPiA+PiBUbzogUGVubnksIFpoZW5nIDxwZW5ueS56aGVuZ0BhbWQuY29t
Pg0KPiA+PiBDYzogSHVhbmcsIFJheSA8UmF5Lkh1YW5nQGFtZC5jb20+OyBBbmRyeXVrLCBKYXNv
bg0KPiA+PiA8SmFzb24uQW5kcnl1a0BhbWQuY29tPjsgQW5kcmV3IENvb3BlciA8YW5kcmV3LmNv
b3BlcjNAY2l0cml4LmNvbT47DQo+ID4+IFJvZ2VyIFBhdSBNb25uw6kgPHJvZ2VyLnBhdUBjaXRy
aXguY29tPjsNCj4gPj4geGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnDQo+ID4+IFN1Ympl
Y3Q6IFJlOiBbUEFUQ0ggdjIgMDQvMTFdIHhlbi9hbWQ6IGV4cG9ydCBwcm9jZXNzb3IgbWF4IGZy
ZXF1ZW5jeQ0KPiA+PiB2YWx1ZQ0KPiA+Pg0KPiA+PiBPbiAwNi4wMi4yMDI1IDA5OjMyLCBQZW5u
eSBaaGVuZyB3cm90ZToNCj4gPj4+IC0tLSBhL3hlbi9hcmNoL3g4Ni9jcHUvYW1kLmMNCj4gPj4+
ICsrKyBiL3hlbi9hcmNoL3g4Ni9jcHUvYW1kLmMNCj4gPj4+IEBAIC01Niw2ICs1Niw4IEBAIGJv
b2wgX19pbml0ZGF0YSBhbWRfdmlydF9zcGVjX2N0cmw7DQo+ID4+Pg0KPiA+Pj4gIHN0YXRpYyBi
b29sIF9fcmVhZF9tb3N0bHkgZmFtMTdfYzZfZGlzYWJsZWQ7DQo+ID4+Pg0KPiA+Pj4gK0RFRklO
RV9QRVJfQ1BVX1JFQURfTU9TVExZKHVpbnQ2NF90LCBtYXhfZnJlcV9taHopOw0KPiA+Pg0KPiA+
PiBTdWNoIGFuIEFNRC1vbmx5IHZhcmlhYmxlIHdvdWxkIGJldHRlciBoYXZlIGFuIGFtZF8gcHJl
Zml4Lg0KPiA+Pg0KPiA+Pj4gQEAgLTY2OSw3ICs2NzEsMTIgQEAgdm9pZCBhbWRfbG9nX2ZyZXEo
Y29uc3Qgc3RydWN0IGNwdWluZm9feDg2ICpjKQ0KPiA+Pj4gICAgICAgICAgICAgcHJpbnRrKCJD
UFUldTogJWx1IC4uLiAlbHUgTUh6XG4iLA0KPiA+Pj4gICAgICAgICAgICAgICAgICAgIHNtcF9w
cm9jZXNzb3JfaWQoKSwgRlJFUShsbyksIEZSRVEoaGkpKTsNCj4gPj4+ICAgICBlbHNlDQo+ID4+
PiArICAgew0KPiA+Pj4gICAgICAgICAgICAgcHJpbnRrKCJDUFUldTogJWx1IE1IelxuIiwgc21w
X3Byb2Nlc3Nvcl9pZCgpLA0KPiA+Pj4gRlJFUShsbykpOw0KPiA+Pj4gKyAgICAgICAgICAgcmV0
dXJuOw0KPiA+Pj4gKyAgIH0NCj4gPj4+ICsNCj4gPj4+ICsgICBwZXJfY3B1KG1heF9mcmVxX21o
eiwgc21wX3Byb2Nlc3Nvcl9pZCgpKSA9IEZSRVEoaGkpOw0KPiA+Pg0KPiA+PiB0aGlzX2NwdSgp
IHBsZWFzZSwgb3IgbGF0Y2ggdGhlIHJlc3VsdCBvZiBzbXBfcHJvY2Vzc29yX2lkKCkgaW50byBh
DQo+ID4+IGxvY2FsIHZhcmlhYmxlICh0aGVyZSBhcmUgZnVydGhlciB1c2VzIGluIHRoZSBmdW5j
dGlvbiB3aGljaCB0aGVuIHdvdWxkIHdhbnQNCj4gcmVwbGFjaW5nKS4NCj4gPj4NCj4gPj4gVGhl
IGZ1bmN0aW9uIGhhcyAibG9nIiBpbiBpdHMgbmFtZSBmb3IgYSByZWFzb24uIERpZCB5b3UgbG9v
ayBhdCB0aGUNCj4gPj4gY29uZGl0aW9uYWwgYXQgaXRzIHZlcnkgdG9wPyBZb3Ugd29uJ3QgZ2V0
IGhlcmUgZm9yIGFsbCBDUFVzLiBZb3UNCj4gPj4gd29uJ3QgZ2V0IGhlcmUgYXQgYWxsIGZvciBG
YW0xQSBDUFVzLCBhcyBmb3IgdGhlbSB0aGUgbG9naWMgd2lsbCBmaXJzdCBuZWVkDQo+IGFtZW5k
aW5nLg0KPiA+DQo+ID4gU29ycnkgdG8gb3Zlcmxvb2sgdGhhdA0KPiA+IFRoZW4gSSBzaGFsbCBh
ZGQgYSBzcGVjaWZpYyBhbWRfZXhwb3J0X2NwdWZyZXFfbWh6IHRvIGNvdmVyIGFsbCBzY2VuYXJp
b3MuLi4NCj4gPiBGb3IgRmFtMUEsIEkgY291bGQgdGhpbmsgb2YgYnJpbmdpbmcgYmFjayBlYXJs
eSBETUkgbWV0aG9kIHJpZ2h0IG5vdy4uLg0KPg0KPiBIb3cgcmVsaWFibGUgaXMgRE1JIGRhdGEg
Z29pbmcgdG8gYmU/IE5vdCB0byBzcGVhayBvZiBpdCBiZWluZyBhdmFpbGFibGUgZXZlcndoZXJl
Lg0KPg0KPiA+IE1heSBJIGFzayB3aGF0IGlzIHRoZSBtb3JlIGFkZHJlc3NlZCBzcGVjaWZpYyBy
ZWFzb24gZm9yIG5vdCBhcHBseWluZyB0byBGYW0xQT8NCj4NCj4gSSdtIHNvcnJ5LCBJIG1heSBu
b3QgdW5kZXJzdGFuZCB0aGUgcXVlc3Rpb24uIFdoYXQgSSB1bmRlcnN0YW5kIHdhcyBhbHJlYWR5
DQo+IGFkZHJlc3NlZCBieSBtZSBoYXZpbmcgc2FpZCAiZm9yIHRoZW0gdGhlIGxvZ2ljIHdpbGwg
Zmlyc3QgbmVlZCBhbWVuZGluZyIuDQoNCkkndmUgY2hlY2tlZCB0aGUgbGF0ZXN0IHNwZWMgaHR0
cHM6Ly9idWd6aWxsYS5rZXJuZWwub3JnL2F0dGFjaG1lbnQuY2dpP2lkPTMwNzAxMCZhY3Rpb249
ZWRpdA0KYW5kIGZvdW5kIExpbnV4IGFscmVhZHkgaGFzIHNpbWlsYXIgcGF0Y2ggIHRvIGZpeCBp
dCwgIGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2xrbWwvOWZmMWZhZjgtZWVjNC00Nzc2LWE1OTAt
NGVmYmMxNDFmZTkzQGxpbnV4Zm91bmRhdGlvbi5vcmcvDQoNCkkndmUgd3JpdHRlbiB0aGUgZm9s
bG93aW5nIGNvZGVzIHRvIGxldCBhbWRfbG9nX2ZyZXEoKSBhbHNvIGFkYXB0IGZvciAxYSsNCmBg
YA0KZGlmZiAtLWdpdCBhL3hlbi9hcmNoL3g4Ni9jcHUvYW1kLmMgYi94ZW4vYXJjaC94ODYvY3B1
L2FtZC5jDQppbmRleCA0ODllMDkyODE1Li5jMjllNTlkNTU2IDEwMDY0NA0KLS0tIGEveGVuL2Fy
Y2gveDg2L2NwdS9hbWQuYw0KKysrIGIveGVuL2FyY2gveDg2L2NwdS9hbWQuYw0KQEAgLTU3OSw4
ICs1NzksNyBAQCB2b2lkIGFtZF9sb2dfZnJlcShjb25zdCBzdHJ1Y3QgY3B1aW5mb194ODYgKmMp
DQogICAgICAgIHVuc2lnbmVkIGludCBpZHggPSAwLCBoOw0KICAgICAgICB1aW50NjRfdCBoaSwg
bG8sIHZhbDsNCg0KLSAgICAgICBpZiAoYy0+eDg2IDwgMHgxMCB8fCBjLT54ODYgPiAweDE5IHx8
DQotICAgICAgICAgICAoYyAhPSAmYm9vdF9jcHVfZGF0YSAmJg0KKyAgICAgICBpZiAoYy0+eDg2
IDwgMHgxMCB8fCAoYyAhPSAmYm9vdF9jcHVfZGF0YSAmJg0KICAgICAgICAgICAgICghb3B0X2Nw
dV9pbmZvIHx8IChjLT5hcGljaWQgJiAoYy0+eDg2X251bV9zaWJsaW5ncyAtIDEpKSkpKQ0KICAg
ICAgICAgICAgICAgIHJldHVybjsNCg0KQEAgLTY1MywyMSArNjUyLDIzIEBAIHZvaWQgYW1kX2xv
Z19mcmVxKGNvbnN0IHN0cnVjdCBjcHVpbmZvX3g4NiAqYykNCiAgICAgICAgICAgICAgICB3cm1z
cmwoTVNSX0FNRDY0X05CX0NGRywgbmJjZmcpOw0KICAgICAgICB9DQoNCisjZGVmaW5lIFZBTElE
QVRFX0ZJRCh2KSAoYy0+eDg2IDwgMHgxOSA/IHRydWUgOiAoKHYgJiAweGZmZikgPiAweDBmKSkN
CiAgICAgICAgbG8gPSAwOyAvKiBnY2MgbWF5IG5vdCByZWNvZ25pemUgdGhlIGxvb3AgaGF2aW5n
IGF0IGxlYXN0IDUgaXRlcmF0aW9ucyAqLw0KICAgICAgICBmb3IgKGggPSBjLT54ODYgPT0gMHgx
MCA/IDUgOiA4OyBoLS07ICkNCi0gICAgICAgICAgICAgICBpZiAoIXJkbXNyX3NhZmUoMHhDMDAx
MDA2NCArIGgsIGxvKSAmJiAobG8gPj4gNjMpKQ0KLSAgICAgICAgICAgICAgICAgICAgICAgYnJl
YWs7DQorICAgICAgICAgICAgICAgaWYgKCFyZG1zcl9zYWZlKDB4QzAwMTAwNjQgKyBoLCBsbykg
JiYgKGxvID4+IDYzKSAmJiBWQUxJREFURV9GSUQobG8pKQ0KKyAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICBicmVhazsNCiAgICAgICAgaWYgKCEobG8gPj4gNjMpKQ0KICAgICAgICAgICAg
ICAgIHJldHVybjsNCg0KLSNkZWZpbmUgRlJFUSh2KSAoYy0+eDg2IDwgMHgxNyA/ICgoKCh2KSAm
IDB4M2YpICsgMHgxMCkgKiAxMDApID4+ICgoKHYpID4+IDYpICYgNykgXA0KLSAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgIDogKCgodikgJiAweGZmKSAqIDI1ICogOCkgLyAoKCh2
KSA+PiA4KSAmIDB4M2YpKQ0KKyNkZWZpbmUgRlJFUSh2KSAoYy0+eDg2ID4gMHgxOSA/ICgodiAm
IDB4ZmZmKSAqIDUpIDogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICBcDQorICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGMtPng4NiA8IDB4MTcgPyAoKCgo
dikgJiAweDNmKSArIDB4MTApICogMTAwKSA+PiAoKCh2KSA+PiA2KSAmIDcpIFwNCisgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgOiAoKCh2KSAmIDB4ZmYpICogMjUgKiA4KSAvICgoKHYp
ID4+IDgpICYgMHgzZikpDQogICAgICAgIGlmIChpZHggJiYgaWR4IDwgaCAmJg0KICAgICAgICAg
ICAgIXJkbXNyX3NhZmUoMHhDMDAxMDA2NCArIGlkeCwgdmFsKSAmJiAodmFsID4+IDYzKSAmJg0K
ICAgICAgICAgICAgIXJkbXNyX3NhZmUoMHhDMDAxMDA2NCwgaGkpICYmIChoaSA+PiA2MykpDQog
ICAgICAgICAgICAgICAgcHJpbnRrKCJDUFUldTogJWx1ICglbHUgLi4uICVsdSkgTUh6XG4iLA0K
ICAgICAgICAgICAgICAgICAgICAgICBzbXBfcHJvY2Vzc29yX2lkKCksIEZSRVEodmFsKSwgRlJF
UShsbyksIEZSRVEoaGkpKTsNCi0gICAgICAgZWxzZSBpZiAoaCAmJiAhcmRtc3Jfc2FmZSgweEMw
MDEwMDY0LCBoaSkgJiYgKGhpID4+IDYzKSkNCisgICAgICAgZWxzZSBpZiAoaCAmJiAhcmRtc3Jf
c2FmZSgweEMwMDEwMDY0LCBoaSkgJiYgKGhpID4+IDYzKSAmJiBWQUxJREFURV9GSUQoaGkpKQ0K
ICAgICAgICAgICAgICAgIHByaW50aygiQ1BVJXU6ICVsdSAuLi4gJWx1IE1IelxuIiwNCiAgICAg
ICAgICAgICAgICAgICAgICAgc21wX3Byb2Nlc3Nvcl9pZCgpLCBGUkVRKGxvKSwgRlJFUShoaSkp
Ow0KICAgICAgICBlbHNlDQpAQCAtNjc4LDYgKzY3OSw3IEBAIHZvaWQgYW1kX2xvZ19mcmVxKGNv
bnN0IHN0cnVjdCBjcHVpbmZvX3g4NiAqYykNCg0KICAgICAgICBwZXJfY3B1KG1heF9mcmVxX21o
eiwgc21wX3Byb2Nlc3Nvcl9pZCgpKSA9IEZSRVEoaGkpOw0KICN1bmRlZiBGUkVRDQorI3VuZGVm
IFZBTElEQVRFX0ZJRA0KIH0NCmBgYA0KPg0KPiBKYW4NCg==

