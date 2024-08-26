Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1615695E828
	for <lists+xen-devel@lfdr.de>; Mon, 26 Aug 2024 07:59:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.783273.1192588 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1siSkH-0008Dx-RN; Mon, 26 Aug 2024 05:58:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 783273.1192588; Mon, 26 Aug 2024 05:58:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1siSkH-0008BD-Lq; Mon, 26 Aug 2024 05:58:29 +0000
Received: by outflank-mailman (input) for mailman id 783273;
 Mon, 26 Aug 2024 05:58:28 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Dc7R=PZ=amd.com=Jiqian.Chen@srs-se1.protection.inumbo.net>)
 id 1siSkF-0008B7-Qb
 for xen-devel@lists.xenproject.org; Mon, 26 Aug 2024 05:58:27 +0000
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on20625.outbound.protection.outlook.com
 [2a01:111:f403:200a::625])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3505f55a-6370-11ef-a50b-bb4a2ccca743;
 Mon, 26 Aug 2024 07:58:26 +0200 (CEST)
Received: from BL1PR12MB5849.namprd12.prod.outlook.com (2603:10b6:208:384::18)
 by PH7PR12MB8594.namprd12.prod.outlook.com (2603:10b6:510:1b3::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.24; Mon, 26 Aug
 2024 05:58:19 +0000
Received: from BL1PR12MB5849.namprd12.prod.outlook.com
 ([fe80::b77f:9333:3a5a:d285]) by BL1PR12MB5849.namprd12.prod.outlook.com
 ([fe80::b77f:9333:3a5a:d285%4]) with mapi id 15.20.7897.021; Mon, 26 Aug 2024
 05:58:19 +0000
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
X-Inumbo-ID: 3505f55a-6370-11ef-a50b-bb4a2ccca743
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PAPio0fuTgrGbUqzTAMeGvCZDj3+kbl2nQWX6tzFbv5nChpmlOLw03Pbf04o/jq0uaZZqRc37vNlofnqwTpsWlY7Ty1ILQUPWZ7/pqFTJCIlxEVQgtgw6gQH2AcL/xdzXYsAms8Qq+t5eX8e4K7RjaI3UvJ9JKPKvje9dVTtD49VtxPo/0gMQCX1njh5Ury7OY9pOBGEJvbTArvaunuorEWIOsZ4jWFxVPD7KSL5I4YHu9idO6U0hXOHkSda5kEmGrT1wuPl0wav25CCL6I4coFjIouCw/EFOd6MWi8XVVCgu3HASVhV3YSMVp5Kx9Zw2RFKAT0TDnJgJSXuECCi1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Oz9l8B7Cl1KzTHi7R6Qr23XDXWSi1KxdvVbzFE6z+qk=;
 b=HIf428zI9lcokfzbMcfFQQIhUOdQI2VNTX1ezK9a/y8gaZFZNWgcCkoJyJuMH47gjlmU+YlfuymowdzV/1WA04WLzibl/HTYkd2DRofM6fu5UacdQzD2fHneps48Fidi/b45Z1p9iWnNgJqu8bDGIpkenjXp/x4YO97xlNHh2brLk3MhTKui+LMFxBDT5H7TS4/HHz7Hurl1q5YD9pEwl5FmWonmidDIyIixnxFwKxhzuQEHfp8veZoIJ0fBcIId/70Qh0lTNK/pVHstgdnoI98vr5ga41AJc+dzZoR5LqsgLMNLXpJCATGlQGLexv6+JoIlZQVLA0rGs9XpzyRtsw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Oz9l8B7Cl1KzTHi7R6Qr23XDXWSi1KxdvVbzFE6z+qk=;
 b=NZQ7emYUyrH56aRE/JHoNcnezosgh/Kz7fSlwFaGjfw2OCDdxZI+Z+lXox/G3jnABZrVG35Yh/lVxBYSjscYHEqPXgiZDj+WYX2gfZKK0IBxO89cmdYSv3OyGMNL9f+Er3sL50T4VcVypGGd0ewR4Er7J4Wp3w5gkecxNAAFLE8=
From: "Chen, Jiqian" <Jiqian.Chen@amd.com>
To: "Hildebrand, Stewart" <Stewart.Hildebrand@amd.com>, Jan Beulich
	<jbeulich@suse.com>
CC: Stefano Stabellini <sstabellini@kernel.org>, Andrew Cooper
	<andrew.cooper3@citrix.com>, =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>, George Dunlap
	<gwd@xenproject.org>, Anthony PERARD <anthony@xenproject.org>, Juergen Gross
	<jgross@suse.com>, Julien Grall <julien@xen.org>, "Daniel P . Smith"
	<dpsmith@apertussolutions.com>, "Huang, Ray" <Ray.Huang@amd.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, "Orzel,
 Michal" <Michal.Orzel@amd.com>, Oleksii Kurochko
	<oleksii.kurochko@gmail.com>, Rahul Singh <Rahul.Singh@arm.com>, Bertrand
 Marquis <bertrand.marquis@arm.com>, "Chen, Jiqian" <Jiqian.Chen@amd.com>
Subject: Re: [XEN PATCH v13 1/6] xen/pci: Add hypercall to support reset of
 pcidev
Thread-Topic: [XEN PATCH v13 1/6] xen/pci: Add hypercall to support reset of
 pcidev
Thread-Index: AQHa78yrMx2rme7kLk2Lfq5OhJcOzrIuThwAgAGubYD//8GBAIAA9fyAgAjrwgA=
Date: Mon, 26 Aug 2024 05:58:19 +0000
Message-ID:
 <BL1PR12MB5849590DC35AC9E613838C48E78B2@BL1PR12MB5849.namprd12.prod.outlook.com>
References: <20240816110820.75672-1-Jiqian.Chen@amd.com>
 <20240816110820.75672-2-Jiqian.Chen@amd.com>
 <50717151-3098-491f-9dfb-71ebaff4b684@suse.com>
 <BL1PR12MB58498DC98719ED77DA950478E78D2@BL1PR12MB5849.namprd12.prod.outlook.com>
 <1e0eee6c-0dcd-4ed4-970f-3d7e569cec09@suse.com>
 <c8f84256-dfb8-4f42-a71c-30373bafab23@amd.com>
In-Reply-To: <c8f84256-dfb8-4f42-a71c-30373bafab23@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-exchange-imapappendstamp: BL1PR12MB5849.namprd12.prod.outlook.com
 (15.20.7897.019)
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BL1PR12MB5849:EE_|PH7PR12MB8594:EE_
x-ms-office365-filtering-correlation-id: 33516d2e-08f3-4cfc-444e-08dcc5941635
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|7416014|376014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?b2dTL3R4Q1lUTnU5V1hzc2lmN1J2MzlHa3FJSUZEZ3dXOWJIT3Z2bGxZQmpD?=
 =?utf-8?B?MENWY3BqV1FBa3U5TFp1ejRqcU55VEdBOWt1Z3RqOWFPSjFXemVOOWlMOG4y?=
 =?utf-8?B?alVmckIveldPVnJuSDNSblBrZW5ZeTJKbEpsdDVXVzZOaHg4My92WVQyaWgx?=
 =?utf-8?B?akprMWZ6ajk3ZWY3ckVSQ293eVlKelpjdXBSNG9jakdISXZobEpOOStpYkdW?=
 =?utf-8?B?MDhuVnZIVytQNDBaQjZadUpBWktjTm5YSm8zNGg5cUZHczdNVmJOVmFHNkVJ?=
 =?utf-8?B?K3I0eUM5VDVnc2xscTNTOWFxYWs1dlFjMEp1aTZTWHo1OEQvSTNweG9xdEht?=
 =?utf-8?B?SGpkVkUrQVJrTWVsd2FBbTZPMForMWR6clgrYkIwdWoxUElNenJPazJQWkd3?=
 =?utf-8?B?NDcva3hVQTFaQVdnRktoWkF6VGIzQm15V2tra0dQNkUra09EZVJZZVBXekxx?=
 =?utf-8?B?YjFDQmtrSzRwU251RjEzWHMxSWFZaFZzRDJVU0pTT2VMb3YrNklYYUQyb1FO?=
 =?utf-8?B?WWtxTk1nZi9QTDdZN3NvRVBlVmd5YTU1dkFvaHZ4Z0NDSW50OVZCeXRFUEwv?=
 =?utf-8?B?TWxhWEpIMDhsamlFL0tVK1NIN04xYkUyUnMvb3Fiei9BZUJOMXl5RlZLN3Nm?=
 =?utf-8?B?aWJINWw2WjI0d01JbjBSKzNyd3AzTmV6aDBWLzJydWRjVjZNOEtaaFAzb2Vr?=
 =?utf-8?B?Y3pEbTA3Vk9DTE5jRmJhKzZqNktIalNaT01SellyVEllSGZZU1ErTFdDMFpF?=
 =?utf-8?B?VkVrWmFMTy83RUk0TXlURXE0c1RNYmxTSlE1MnA0WldwUTM4Sk5ibVR2Qkd5?=
 =?utf-8?B?b3NIWVFNMFlYWFpwWUVyQjUydXF2ckNDR2I2OFRUNXlUVXk1c1dyU1pYa0xr?=
 =?utf-8?B?R0hyek5JcC9pZEZzOThmazkvNkdyUXowdDA5UTdVVUZWU3Q5T3BlVTZqaUo4?=
 =?utf-8?B?S1ZGcEFmV1B6UTFEcnBybzlBd1E4VmlGcWlHSklTV0U0aG01bVdNY1JSUk1K?=
 =?utf-8?B?NVFIbWdUaWJyNGtKSnJoa1pDWGV1SnJFYWw5eEQ0N1kyWXVuRGgrV1Y5QWc4?=
 =?utf-8?B?RWRvMWJtQk1TcTVlWDR4ZXB0aVNNKzhkSjlLSFk4QmtoZ1hIek5abFF6TGZv?=
 =?utf-8?B?MDl6a3JvZTQ2NXVOcGdlbEwxMW12SEVaT1crNC9rOS9mTGZPQXRFMjhmdnZI?=
 =?utf-8?B?NjZ2ZUdyMm1DbXpyZjgxRGI4SkpvOExQd2ltSWMrczBoSWJEMHphZk5ialRv?=
 =?utf-8?B?NUluMlg4V3gwYUxWSDVLM25yVklQcDVVUkVHMnNOcW5IcDBXVWU5SmZpeGU5?=
 =?utf-8?B?MkRiSlF5R05JOHkwam9XYUM5OC9oMDFUeVlzcDRmWldOUU0zN29XZk5sWldq?=
 =?utf-8?B?QldUNjFSVVI2czRGVWFwMlhTMGl0eGFCMnBEYXBhOGk5L0FsdDNCZ055eFNE?=
 =?utf-8?B?UWpzcTdFbDZtK0p1eDI2UWdmWVc2YVB3cXg4SGRLRE8yRWd4U3N1cGlVT3Zy?=
 =?utf-8?B?blZBOExVV3lWcjB5ZDRTamVoSFNQOUlsN25mdkxZSDIzaE0rSWhDdzMrS25Y?=
 =?utf-8?B?dzltREJsUTkxWU5meWxvU1ZGcTRRQnE5Tkk1Nnk3YUVkaStiMER1bjVBR2lu?=
 =?utf-8?B?cDVFc0lramZmd3ZwRFRXMUNQVkQyT0NFeDBORmFEOHFPQ1hzTThjMFRMUmhj?=
 =?utf-8?B?NUdhTWZsQ3ZUeVhIU2tEVWRFVjdhblRBNmozNDdxQ2lQdEVhR2lpZnRFUjNh?=
 =?utf-8?B?UlJNOGt0RnRFZ3Z2OU5WUFV0Q2s5ck5WYlRlYnFrVjNRc3JCWUZObXZVcGxp?=
 =?utf-8?Q?HXSm35dDA9Px5YRg0Hdtpc92vt4tcbnR9g9UI=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR12MB5849.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?K25vSUFISWEyVi9IdHlqZW9DSlZoVWxJR2FQQ1BxS0hUMjc3aXBtZDlQQ3FB?=
 =?utf-8?B?SCtKcmRsNnlPYVdYWE5pMllya05UNGZ4RHRQcWh0Y2dyTHR4M3ZQTmMweHYv?=
 =?utf-8?B?MjhuTHVYbGJhWjdUL3p5N2NIc3FOc3BZcFVSdHNndW8xRVduYzBSR3BzV3NU?=
 =?utf-8?B?Z21PemNsbGh5VVkwWjhCTGNoenhrSEkzSUlaUXdDRk41amVaMU0zbk1aMW1B?=
 =?utf-8?B?KzZOUi9uMkF3UDAzMGZWbnJydS9veGdQYkFaVDRnYSszQlArQmgwL1ExWFZm?=
 =?utf-8?B?cC9uZ3RzUE1hUG0wOS9aL3JqK3p4bUIwS2NqMnc1U0l4MnAyb2hmR042Vm9L?=
 =?utf-8?B?Rlplbnd5MDU0ck9oekxPdE03bEdON3JJa2hyd0tMbmhwaDdmb0JFSFA3YVBX?=
 =?utf-8?B?c1BIaGpFdzdxYnhyVEN6ZkNGNnRDTHRBRkhQVnB6dDNST1J1U1Y3R1ZCY0pL?=
 =?utf-8?B?VUJ2cVpNOVV3clhaVm0wQ0JCV3lYM3kyeWNsZlZvZ1hCUitoSVVwbjJqOWRT?=
 =?utf-8?B?R1N5VW5tTE14a3FTaUlBUHBzdDRzN1duQm5sUW5xQVdKZWxERUF1bWgwZENB?=
 =?utf-8?B?TkR5c3VBOUduOEphaXFQZlBxbXpSRXRzaEtzNVVJSzlsQzZKWXlLQU12alBl?=
 =?utf-8?B?clVud3l0NjZxMVh1Ym5Kd2NGOC83bVptZTkvdHVlNEFlZUpvVlJJWmZSTVdN?=
 =?utf-8?B?MVAxWFNQZ0xrQmNDelMrcFdxUWYrcmhqd05zQ2pBaEdFTldlOFlDcUNERjRF?=
 =?utf-8?B?SzR1TDRqd3p6bGxOU0tSWjJ4VHkrbnowbDJPVHl5c1JGcHYyenExKzdUdnJY?=
 =?utf-8?B?a00xbndzMmdOMHNzV1ZZTFZhZHdhTEQyRm4ybVQwQTVUZzRNR1cySmtCQ01p?=
 =?utf-8?B?dVE4NzAzNElxTnFhOGJ4Ly9JR0JiMjZvdUZSQWN2THZnSk81TXhxeWNiUkkr?=
 =?utf-8?B?MWJIaXdGZkpGVGZzaER4dTZZWkowN0dPcXd1VVBuN1FmVTZJKzhSaVNUWHpk?=
 =?utf-8?B?Tklzd1piQ2FSRGVxWHA5N3pVcHV3Q0JyTmxhRjJQMHR5MWFPNTNuU1RKSVA1?=
 =?utf-8?B?KzJFakNmYmsyZXMwR2tWOG9nREFDSDQxS2M3OG1OQTRZdmdoV1d1MU1nZHBn?=
 =?utf-8?B?MGZvSUlCMW1SdWhOMlJpdDZlQ0xFVVpJMDBKUnNBT1JqUThjcUFNL2VURldI?=
 =?utf-8?B?ZWZwNEJqZkNXZEpYKzBuN2ZHVmJ2dDRDK3F1bWFpWHdzakJack1BODRhQzhz?=
 =?utf-8?B?Z3lieGg1WTVNM0lzTUs2c0l3K1hJS2tEMG9xTTl2QXZZQlNEbTMySC8xanVv?=
 =?utf-8?B?VU8xZzVZeFZBOVJwRmhicElnc0FjTmtEVGNaVzNrZ05ZWDlTQi9tdDdIelQy?=
 =?utf-8?B?WWdlRnJiZ0tIaWJOVzNPcVZ1V0xSeTJmRHF6Y0hEVE0wQU0xK04vRWY1ZFFy?=
 =?utf-8?B?TDZMVDZtV3hEMUE4bS9kZTBmUjJadVcxQk01dkFBZmc2WitPZGRoalZyMnp3?=
 =?utf-8?B?NUxrT0pySUpFK1d0YWw1MFJMRTNzK1NQMnRTSFE4RTZGUmQwdmF0Qk5pTllk?=
 =?utf-8?B?dUdPQUFqd0FkNThiU1V3T0t1Yk0xT2lwYjVCdGQrQ0Z2YTNGZ1FOamtUUWhL?=
 =?utf-8?B?enY3UFZ3ZDhPdWQrZE9vcTlFSlhuc3hwQnFGSHh5TzZZUmIvbC8vTmZOOGNN?=
 =?utf-8?B?d2ZxMVFheTMxZFIvU1lEQy9HV1JNU0RPOXhmOWdBQ1pXRzZQL0FUUk1CaU50?=
 =?utf-8?B?OTFZQnlndHVweWt3UkxuZkM2dTEzTHBhSEZCZlV4NHkrdUNGeVFSQzRtQkox?=
 =?utf-8?B?THlWUmh3SHIyQW5XbUFFTXlrU0d3aElIc2N4cnNGNXk3U0Y4QjhkdHg5VWQ4?=
 =?utf-8?B?U3c5U2d3V0lmclVCUzN4U2EvdHRjcndJME44TkR4TU5UaEhIc3VZS2NDWVNQ?=
 =?utf-8?B?dkFjTlVaS2xSeVBicVdYZTVNdExaQlF6WUJaRU56NlRSbklNMjIyWmx3QUgw?=
 =?utf-8?B?cWRkTkRNd05ZK2VBQzBHZHNWY0Jmd2VKYmJKbi9XcDlxUW8rL2pkRE01Q29h?=
 =?utf-8?B?OEJvbFh2ZUNhbVdWR0Y4RTZxeFpLYlpMMnFMMk5jN0xCd3lHa0FtUnBXQlkz?=
 =?utf-8?Q?2kD0=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <D3CC0CC50B3E7F44AFD97E2025CD114C@amdcloud.onmicrosoft.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5849.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 33516d2e-08f3-4cfc-444e-08dcc5941635
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Aug 2024 05:58:19.8128
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: GkK8h3OiuWgpP73bIwtgqaUrEejC3wC0csksV6TsQiQM7+UCenu9os4OuLkmmr7K0doOICrdIHTwnHA1ERV8ng==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB8594

T24gMjAyNC84LzIxIDA1OjQyLCBTdGV3YXJ0IEhpbGRlYnJhbmQgd3JvdGU6DQo+IE9uIDgvMjAv
MjQgMDM6MDEsIEphbiBCZXVsaWNoIHdyb3RlOg0KPj4gT24gMjAuMDguMjAyNCAwODowMCwgQ2hl
biwgSmlxaWFuIHdyb3RlOg0KPj4+IE9uIDIwMjQvOC8xOSAxNzowNCwgSmFuIEJldWxpY2ggd3Jv
dGU6DQo+Pj4+IE9uIDE2LjA4LjIwMjQgMTM6MDgsIEppcWlhbiBDaGVuIHdyb3RlOg0KPj4+Pj4g
QEAgLTY3LDYgKzY4LDU3IEBAIHJldF90IHBjaV9waHlzZGV2X29wKGludCBjbWQsIFhFTl9HVUVT
VF9IQU5ETEVfUEFSQU0odm9pZCkgYXJnKQ0KPj4+Pj4gICAgICAgICAgYnJlYWs7DQo+Pj4+PiAg
ICAgIH0NCj4+Pj4+ICANCj4+Pj4+ICsgICAgY2FzZSBQSFlTREVWT1BfcGNpX2RldmljZV9yZXNl
dDoNCj4+Pj4+ICsgICAgew0KPj4+Pj4gKyAgICAgICAgc3RydWN0IHBjaV9kZXZpY2VfcmVzZXQg
ZGV2X3Jlc2V0Ow0KPj4+Pj4gKyAgICAgICAgc3RydWN0IHBjaV9kZXYgKnBkZXY7DQo+Pj4+PiAr
ICAgICAgICBwY2lfc2JkZl90IHNiZGY7DQo+Pj4+PiArDQo+Pj4+PiArICAgICAgICByZXQgPSAt
RU9QTk9UU1VQUDsNCj4+Pj4+ICsgICAgICAgIGlmICggIWlzX3BjaV9wYXNzdGhyb3VnaF9lbmFi
bGVkKCkgKQ0KPj4+Pj4gKyAgICAgICAgICAgIGJyZWFrOw0KPj4+Pg0KPj4+PiBJdCBvY2N1cnMg
dG8gbWUgKG9ubHkgbm93LCBzb3JyeSk6IERvZXMgdGhpcyBjYXNlIHJlYWxseSBuZWVkIHRvIGJl
IGFuDQo+Pj4+IGVycm9yPyBJLmUuIGRvIHdlIHJlYWxseSBuZWVkIHRvIGJvdGhlciBjYWxsZXJz
IGJ5IGhhdmluZyB0aGVtIGZpbmQgb3V0DQo+Pj4+IHdoZXRoZXIgcGFzcy10aHJvdWdoIGlzIHN1
cHBvcnRlZCBpbiB0aGUgdW5kZXJseWluZyBYZW4/DQo+Pj4gSSBhbSBub3Qgc3VyZSwgYnV0IGZv
ciB4ODYsIHBhc3N0aHJvdWdoIGlzIGFsd2F5cyB0cnVlLCBpdCBkb2Vzbid0IG1hdHRlci4NCj4+
PiBGb3IgYXJtLCB0aGlzIGh5cGVyY2FsbCBpcyBhbHNvIHVzZWQgZm9yIHBhc3N0aHJvdWdoIGRl
dmljZXMgZm9yIG5vdywgc28gaXQgaXMgYmV0dGVyIHRvIGtlZXAgdGhlIHNhbWUgYmVoYXZpb3Ig
YXMgb3RoZXIgUEhZU0RFVk9QX3BjaV9kZXZpY2VfKiBvcGVyYXRpb24/DQo+Pg0KPj4gRGVzcGl0
ZSBzZWVpbmcgdGhhdCBJIGRpZCBhY2sgdGhlIHJlc3BlY3RpdmUgY2hhbmdlWzFdIGJhY2sgYXQg
dGhlIHRpbWUsIEkNCj4+IChub3cpIHZpZXcgdGhpcyBhcyBncm9zc2x5IG1pc25hbWVkLCBhdCBi
ZXN0LiBJbW8gaXQgbWFrZXMgcHJldHR5IGxpdHRsZQ0KPj4gc2Vuc2UgZm9yIHRoYXQgcHJlZGlj
YXRlIGhlbHBlciB0byByZXR1cm4gdHJ1ZSB3aGVuIHRoZXJlIGFyZSBubyBJT01NVXMgaW4NCj4+
IHVzZS4gRXZlbiBtb3JlIHNvIHRoYXQgb24gYW4gQXJtL1BDSSBzeXN0ZW0gd2l0aG91dCBJT01N
VXMgb25lIGNhbiB1c2UgdGhlDQo+PiBjb21tYW5kIGxpbmUgb3B0aW9uIGFuZCB0aGVuIGV4ZWN1
dGlvbiB3aWxsIG1ha2UgaXQgcGFzdCB0aGlzIGNoZWNrLg0KPj4NCj4+IEkgZnVydGhlciBxdWVz
dGlvbiB0aGUgcmVsYXRlZCBwYXJ0IG9mIFsyXTogV2h5IGRpZCB0aGUgc3R1YiBuZWVkIG1vdmlu
Zz8NCj4+IEknbSBub3QgZXZlbiBzdXJlIHRoYXQgcGFydCBvZiB0aGUgY2hhbmdlIGZlbGwgdW5k
ZXIgdGhlIFN1Z2dlc3RlZC1ieToNCj4+IHRoZXJlLCBidXQgSSBhbHNvIGNhbid0IGV4Y2x1ZGUg
aXQgKEkgZGlkbid0IGJvdGhlciB0cnlpbmcgdG8gZmluZCB3aGVyZQ0KPj4gdGhlIHN1Z2dlc3Rp
b24gd2FzIG1hZGUpLg0KPj4NCj4+IEluIGFueSBldmVudCAtIHdpdGggWzFdIFBIWVNERVZPUF8q
cGNpKiBlbmRlZCB1cCBpbmNvbnNpc3RlbnQgb24geDg2LA0KPj4gZXZlbiBpZiByaWdodCBub3cg
b25seSBvbiB0aGUgc3VyZmFjZS4gWWV0IGFzIHNvb24gYXMgdGhpcyBwcmVkaWNhdGUgaXMNCj4+
IGNoYW5nZWQgdG8gdGFrZSBJT01NVXMgaW50byBhY2NvdW50LCB0aGUgbGF0ZW50IGluY29uc2lz
dGVuY3kgd291bGQNCj4+IGJlY29tZSBhIHJlYWwgb25lLg0KPj4NCj4+IEFuIGFsdGVybmF0aXZl
IHRvIGNoYW5naW5nIGhvdyB0aGUgZnVuY3Rpb24gYmVoYXZlcyB3b3VsZCBiZSB0byByZW5hbWUg
aXQsDQo+PiBmb3IgbmFtZSBhbmQgcHVycG9zZSB0byBhY3R1YWxseSBtYXRjaCAtIGlzX3BjaV9w
YXNzdGhyb3VnaF9wZXJtaXR0ZWQoKQ0KPj4gbWF5YmU/DQo+Pg0KPj4gVGhvdWdodHMgYW55b25l
LCBBcm0gLyBTTU1VIG1haW50YWluZXJzIGluIHBhcnRpY3VsYXI/DQo+Pg0KPj4gRmluYWxseSwg
YXMgdG8gdGhlIGNoYW5nZSBoZXJlOiBPbiBhbiBBcm0vUENJIHN5c3RlbSB3aGVyZSBwYXNzLXRo
cm91Z2gNCj4+IGlzbid0IGVuYWJsZWQsIHRoZSBoeXBlcnZpc29yIHdpbGwgc3RpbGwgbmVlZCB0
byBrbm93IGFib3V0IHJlc2V0cyB3aGVuDQo+PiB2UENJIGlzIGluIHVzZSBmb3IgRG9tMC4gSU9X
IEknZCBsaWtlIHRvIHJlZmluZSBteSBlYXJsaWVyIGNvbW1lbnQgaW50bw0KPj4gc3VnZ2VzdGlu
ZyB0aGF0IHRoZSBjb25kaXRpb25hbCBiZSBkcm9wcGVkIGFsdG9nZXRoZXIuDQo+IA0KPiBJIGFn
cmVlIG9uIHJlbW92aW5nIHRoZSBjb25kaXRpb24gZm9yIHRoZSByZWFzb24geW91IG1lbnRpb25l
ZC4gSSdkDQo+IGxpa2UgdG8gcmVtb3ZlIHRoZSBvdGhlciBpbnN0YW5jZXMgb2YgdGhlIGNvbmRp
dGlvbiBpbiB0aGlzIGZpbGUgYXMNCj4gd2VsbCwgYnV0IHRoYXQgaXMgdGhlIHN1YmplY3Qgb2Yg
YSBzZXBhcmF0ZSBwYXRjaCBpbiB0aGUgd29ya3MgWzNdLg0KPiANCj4gWzNdIGh0dHBzOi8vbG9y
ZS5rZXJuZWwub3JnL3hlbi1kZXZlbC8yMDIzMTEwOTE4MjcxNi4zNjcxMTktOS1zdGV3YXJ0Lmhp
bGRlYnJhbmRAYW1kLmNvbS8NClRoYW5rcyBTdGV3YXJ0IGFuZCBKYW4sIEkgd2lsbCByZW1vdmUg
dGhpcyBjaGVjayBmcm9tIG15IHBhdGNoIGluIG5leHQgdmVyc2lvbi4NCg0KPiANCj4+DQo+PiBK
YW4NCj4+DQo+PiBbMV0gMTU1MTdlZDYxZjU1IHhlbi9hcm06IEFkZCBjbWRsaW5lIGJvb3Qgb3B0
aW9uICJwY2ktcGFzc3Rocm91Z2ggPSA8Ym9vbGVhbj4iDQo+PiBbMl0gZGVjOWUwMmYzMTkwIHhl
bjogYXZvaWQgZ2VuZXJhdGlvbiBvZiBzdHViIDxhc20vcGNpLmg+IGhlYWRlcg0KPiANCg0KLS0g
DQpCZXN0IHJlZ2FyZHMsDQpKaXFpYW4gQ2hlbi4NCg==

