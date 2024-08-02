Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DAB059459DF
	for <lists+xen-devel@lfdr.de>; Fri,  2 Aug 2024 10:27:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.770614.1181300 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sZncu-00040p-PG; Fri, 02 Aug 2024 08:27:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 770614.1181300; Fri, 02 Aug 2024 08:27:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sZncu-0003xi-LN; Fri, 02 Aug 2024 08:27:04 +0000
Received: by outflank-mailman (input) for mailman id 770614;
 Fri, 02 Aug 2024 08:27:03 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=uPwv=PB=amd.com=Jiqian.Chen@srs-se1.protection.inumbo.net>)
 id 1sZnTV-0008NN-Vr
 for xen-devel@lists.xenproject.org; Fri, 02 Aug 2024 08:17:22 +0000
Received: from NAM04-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam04on20600.outbound.protection.outlook.com
 [2a01:111:f403:2409::600])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a302cf9a-50a7-11ef-8776-851b0ebba9a2;
 Fri, 02 Aug 2024 10:17:19 +0200 (CEST)
Received: from BL1PR12MB5849.namprd12.prod.outlook.com (2603:10b6:208:384::18)
 by PH8PR12MB7111.namprd12.prod.outlook.com (2603:10b6:510:22d::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7784.19; Fri, 2 Aug
 2024 08:17:15 +0000
Received: from BL1PR12MB5849.namprd12.prod.outlook.com
 ([fe80::b77f:9333:3a5a:d285]) by BL1PR12MB5849.namprd12.prod.outlook.com
 ([fe80::b77f:9333:3a5a:d285%3]) with mapi id 15.20.7828.021; Fri, 2 Aug 2024
 08:17:15 +0000
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
X-Inumbo-ID: a302cf9a-50a7-11ef-8776-851b0ebba9a2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hW6pO0Et/+OVcLjuqYxssjhBUWMnDMW1Sf5TNe+QYS343qQGkYnJROfwWIYLI/mOqsFlmBJ5HuLzN1vpoE+nua/bJiBsFc06JIv5Bn84zjchw44ILvWGbSNeI2nGfiMV7dwfV3BWSQpNVbGoNV+/GolZxg777P90myQ65Jo58HH5mcDNktVKNifcxBm2h9X5aErtMS1rpGxAnc7BIBo/sCEm+R0Bch9N6GZ3VqHrJLtMQXn0VFrNZFMEGym+D4VVggIEcD4P1Fc1sdS4x/BAQGtAyFC6HHFb3TGCUWVq8PlAqNXkxxIXzjjgCJ4eQhs+UqDA0aFfWreeQOHtAoi05Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5/Xdn0c6GSwx/UBo0/+K3FdxF6Lu5JfgjRT/youEiSw=;
 b=YdlU0NhMQKE79xB+2RYXPruElIWPsQouURNAqY/RB1L8f3cfcFf2QhrefrqGmfUE1jVfNlUIsyGyUT+tO3D4ECkKVsptIiYKdfw9jzr/0zDioyfBi2yvZ1Jr0E+PZ3EO1JQF9F08fH7CEyA8lb2VNTnFpjRmzzbDWiYDNDFfKa3/E5EU0gXBMH5spr10mHUoxGxwINS3ldBp3bCBAmJPm3cUdix1Er006aXKWycfmn6wN3s2t/XJ+ID+ylZJ0IyZUqAKUyiCYttEOQrCap/PQEIzZ22TEwznLftp/lep0GdL+WvM8lhs7VI7CSWNqqoV1cOtAjkEeneoX7vd30R+GQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5/Xdn0c6GSwx/UBo0/+K3FdxF6Lu5JfgjRT/youEiSw=;
 b=JWo2ga9kmX0KG6azBd5velk0zN/P0rgrxweVRjn/p9XGlYAv4RQ4dMmZL1ULWCBTdLdHNi1oSEN08wx4sPX+qKnRtfvOjXtOtwSW5TrT8cD1xdyZ6OSNrbc8OofxdLauEoKIsxgHvGcLkNHndFydSB7/Rcsv4xIKdbasfjPKBi0=
From: "Chen, Jiqian" <Jiqian.Chen@amd.com>
To: =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>
CC: Jan Beulich <jbeulich@suse.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
	Wei Liu <wl@xen.org>, George Dunlap <gwd@xenproject.org>, Julien Grall
	<julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Anthony PERARD
	<anthony@xenproject.org>, Juergen Gross <jgross@suse.com>, "Daniel P . Smith"
	<dpsmith@apertussolutions.com>, "Hildebrand, Stewart"
	<Stewart.Hildebrand@amd.com>, "Huang, Ray" <Ray.Huang@amd.com>, "Chen,
 Jiqian" <Jiqian.Chen@amd.com>
Subject: Re: [XEN PATCH v12 2/7] x86/pvh: Allow (un)map_pirq when dom0 is PVH
Thread-Topic: [XEN PATCH v12 2/7] x86/pvh: Allow (un)map_pirq when dom0 is PVH
Thread-Index:
 AQHa0SvUYCKIEvNO4Ei/mjm7Qit34LIQmkQAgAACPwCAAAdkgIAABG0AgAADDACAAALkgIAACfqAgAAE/oCAABpKgIAAAsoAgAAXhYCAAvm8AP//2VcAgACHGIA=
Date: Fri, 2 Aug 2024 08:17:15 +0000
Message-ID:
 <BL1PR12MB584967C87F8EBC9B753C7B10E7B32@BL1PR12MB5849.namprd12.prod.outlook.com>
References: <Zqn014wCEfWhyo1-@macbook>
 <8ff685a6-0cbd-45cd-a818-4535a040c478@suse.com> <Zqn7HEuooChgRCuf@macbook>
 <d65ae152-22ee-4a57-8ff4-43ef0c234f5f@suse.com> <ZqoF55yapMxGN_WM@macbook>
 <fa33fbf8-32b6-48dc-a30c-dd76b021a76d@suse.com> <ZqogJVHV36ytYVP1@macbook>
 <ff922c7a-aa66-4b23-8b9f-63b0b403ff14@suse.com> <Zqo2N7CDshL7ZoMK@macbook>
 <BL1PR12MB584914D078416A5F0ECA0AE0E7B32@BL1PR12MB5849.namprd12.prod.outlook.com>
 <ZqyUxv7UcaRcksCG@macbook>
In-Reply-To: <ZqyUxv7UcaRcksCG@macbook>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-exchange-imapappendstamp: BL1PR12MB5849.namprd12.prod.outlook.com
 (15.20.7828.000)
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BL1PR12MB5849:EE_|PH8PR12MB7111:EE_
x-ms-office365-filtering-correlation-id: 8f06b300-3ce7-456d-63ef-08dcb2cb84a2
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|376014|366016|7416014|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?YmxNY0pZdjlRVWtuNEt2UHJhVTdINTBUYnU2a3FqeXM5Tkd4YWtyTmdwbCsw?=
 =?utf-8?B?eXJWbnNSSWFnMGx6b0lGRjhFRnkvZWx1bm5JR0Y2cUdXVnZyUnV3WndzU0Fs?=
 =?utf-8?B?TDU3UytmeFBnYkFqaXBDUmJ6blBCSFZaVjNGUzBJb1kxcFQ5N2JGSGFoTEVt?=
 =?utf-8?B?VjFNeUYxSm16RGFEY1BrTnVqY05Ba3FFTlJyYlg4OEY1RUpxRDIreDJCTGNL?=
 =?utf-8?B?TzlZN0VjUTY0NlRkQkJ5bElobEY3c2dVdXlJQjU0eE5ibnE1ZUxKUzZyQTBa?=
 =?utf-8?B?YVU4blFtN3R3ZTJ0Z0J6YllBQnRiemhDaVdUdWFBaE5iSkgvREpLc2w5Mnl6?=
 =?utf-8?B?dGllQ21rdkZaZUhrMDFmZE1QMDUwb3hqdXlpZlBRdEVPeUoxZ1Z1aVJHYXZq?=
 =?utf-8?B?SDR5bzhqQTM2TTQweVBhMVZYeUUyVVNaaHBIYUlQdzdLRWJvRTJUZTN3NUlR?=
 =?utf-8?B?Nmw1VmJkUUk2R3JDK252OVp4MzFzd0NvZitxVmpRSWsxK0NmS0RvcWt2THZa?=
 =?utf-8?B?Lzc2SVk3VE5LRFFPZitTVzZzaEVVS2hmOFNqREErcGQ1OVA5VlpXR0g0UWJP?=
 =?utf-8?B?cCszTVk4RmZnT3J2VHQzSnZNWU1mc3hIU0c5bklDbUw1ZW1yVVhTMndNditX?=
 =?utf-8?B?K1FnWHZQRm1xOHdlblJQQUR4TCs4US85ZldZRFJ2UkE1SjA0RUtJWUhvcnlh?=
 =?utf-8?B?T05oWmRaNndLWE1ZcU5sRGlsb2k0bnBZeEZ5VFRDRHZmL2Z2NUlVRko5NHVh?=
 =?utf-8?B?RVVzdFVXd0FjWXVoQnlWaE4wYlAzZEo0a3czU3Q1SHZsSXBzR091aXZkalFQ?=
 =?utf-8?B?WWVzN2lHL0t4ZE1FNFMwdzluQWpTTTdQb1BwL1U0WGhXdFZpbXVMdU1BL1BV?=
 =?utf-8?B?TFF6bmNHRVFMeUZSNXJ3S3hqM1MrWVMybFBYQk8ydWN1NXhxeXNVanBORytl?=
 =?utf-8?B?cHArb3d3V0FsM0d1a2VCOGVteVJYaHIvWndSMWJJc2xucjhpdzhWSkxjQjBz?=
 =?utf-8?B?SS9nZERCZUltWFZKY0lZWS81SDNRZUczMk01cW1QVXhDeXBCcE5zNytQU0RN?=
 =?utf-8?B?dU00WDhodFJUeTdqdFJJdlhMayt6RzlmeVZJdUVnZWJOditVU1psTzlwaXdt?=
 =?utf-8?B?OWt1SWJFQ3ZIY01YS0hYeWc5MXBmWWw0ZjZOZDdRaE9zejdTUkpXeDdkaWsy?=
 =?utf-8?B?TWY2R2dKYnJEUjlVRXFLOU1OZmJoV3c3ZVJlMDlMQmE1WGhjN2pua01sRE40?=
 =?utf-8?B?MWRKYjd5Wkc0TGNVUUVkZDJhOFZGZWh1WU05RlY5eWg3U2F2MFB1SDdnQXNo?=
 =?utf-8?B?OWkyY1AxeXIzS3IzN0w2djhFSk1WSGRSNWlwNkplamRDYmtjY0tDK2RaZXlN?=
 =?utf-8?B?UklEbWZObFRxaXRmeGJobDlvQm85YVFQUzUreE9HZllrUUI4MEkrbkZjVlBH?=
 =?utf-8?B?TGNLS2tCVmVhMGlmUTZmTmVDaXVhSUw0Q1hnRnRKODJxMFNjYXBFUHZJMGNB?=
 =?utf-8?B?YjRkWFlEZ2RjRmFXSkpndHNxd0I1L2JwdzlJbzdtWGpJQVBJQjZ6djdDOGpT?=
 =?utf-8?B?LzRvMjZzaDFoQzMrclZ0bG03T1U1RWo0RXRUYTRkcnZqK3doMWF2cWFDSWgv?=
 =?utf-8?B?bEFMQmxEaDBLUCtUeEVOVERCUEdXbUdVUmQwVjJSMU1ianV5ekVWTnpQRTlV?=
 =?utf-8?B?M0ZON3lHVkQ4cTFEMW0rSWdPeXdZR2dpWjdSaFM5NTNXRmdneVJ1aU9xOXdr?=
 =?utf-8?B?QktnTGJ2L0lEOWVuSHdmMHV5VEZqL0tqUjFrVUxKZlNsWHhlRHlNUm9CMGJj?=
 =?utf-8?B?aWQ3RUpKRzdyRm90KzZRZzhtYjNvL1lTTS9NdnBQdmVZam9VWStJd3g5S010?=
 =?utf-8?B?MG5NMzBVeTdnY3V5YzFLZmI3bDlSdXJhcE5SSm5VcHBFblE9PQ==?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR12MB5849.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(7416014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?aE13a2psMjFob21tWC9ZdVJSU3duMWF3dHRETS9qdlBWQm5YZnU0clZaZ3ZX?=
 =?utf-8?B?UnkvNnh0MFUvRjJtL1lhc3ZPVXJGOUFHVkZBZXhKMytoQUxvaHFPRTZ4QmRU?=
 =?utf-8?B?aldPcDN1Z2xKNUxyYlp4VW54SUxsbEp6NnI5cmY4NFdOZGpXZTAvT1VvTDYv?=
 =?utf-8?B?T0QrcVdnWWJOVTUwbUt2ZnAva0ZGbW5ubG4vd2FYUENua0dTUWlhcDVxN3dj?=
 =?utf-8?B?cUtqQ1FOeHpaeXBDRTJCMVVhbDlCY2RCVlc4Q1FPbkRIbk5kR01ubkpReGgy?=
 =?utf-8?B?cVBnSGxZbGRRanRiWDhsalBMM05UOU9zaGg3SzRtd0ZNSElEZTFnTXhiZ3Y1?=
 =?utf-8?B?Ymt0NFY4djBKY3JiQXVueHpXTCs3OGJiQUNUcUNYbkkwSnJBbFdnQnMwVkJE?=
 =?utf-8?B?ZjYwOGs4Q3ZxT1Z1TmhjanZPYzUrako2TmZSQVQzUU5HdnBaMWJDNnFSQzh4?=
 =?utf-8?B?NHZzeUZUUUlRb0l1RmJGL3FvQ2hWa2JFekRxWG1JckdkUDlXdmY5dE9hSTR3?=
 =?utf-8?B?YUZoYVE1SUl3MXF1Z2IvRE51dlA2UGdwUEtHeWJEeno3L2RxQU9obS9uUFRh?=
 =?utf-8?B?M0N6a0ZTd3dlMmhycy8vam1OTjBEWXNNRlh6VnpBTTluQ0hROUJqZU85bHUz?=
 =?utf-8?B?cjFzUyt3TjYxamI4KytiQlExR2kycUtRcmRLME1XTFV3Z0E5WXQ3eklma1J0?=
 =?utf-8?B?MFFIT2sxRno0UFdaRDlCWFNkaHIwRXdKSkhaZ2xPN1hnekR5WE1INjY0UERB?=
 =?utf-8?B?dGY1YXVWODFsRUFzRm1temxFNXU2ZGZvdm45MXE3OW1FaXFiblZyTFduTVJP?=
 =?utf-8?B?LzkrQ1B4cnRaTXl3cVlYMkw3MytIZXkxTlo5a1N5REtLV2JHNjArTmJtVnZi?=
 =?utf-8?B?V2ZySUZBUGlqeGhoTldKRjU1UTIxM3V3YXh4TTVNNlZkdzZiQURGOHQ4MSs2?=
 =?utf-8?B?NzVpdlNObE8yQm1XeHlZZ1E4ZlpNLzRnb1VLcGpHK1hnNko4eGg2WjdiU2xr?=
 =?utf-8?B?LzR5SlMrZ05FVWlOV2xUdkhxLzJKaWh4bWNxWHdVcFZ2a21raWppQW0xOFVO?=
 =?utf-8?B?QVhlOEs1a01pY244UXN5eUFBOTRWdHIvUEJFUjFQckxmRkVWWWQ5MmZ1NmJz?=
 =?utf-8?B?eE9lNlRZTnJqck16NUpLM2F1T2pKWVJyYXlQUzM2aUlSZWxTbVlBT1B3bXZa?=
 =?utf-8?B?bmlvcWN1RnkrZHIxNi9UWnJta3phTlR4WjB3VGtMdWZYdlpUOG40OXBhdGUw?=
 =?utf-8?B?VVF5bFJQZXdGcUtHMjdjbklPWXc3RTQvZENFeUZuNGxCMEw3TzNnS3E4aTQr?=
 =?utf-8?B?d2NQblNnRnZqMlpTNW9aTmMzR3diamRyNytPMGtPaCtCSWREMndXa1VWUHJJ?=
 =?utf-8?B?RnlaNklqTDJJNTYvdTc5aUVKVEhGVDV4RGxJRUwveXR6SEhHZ3lpZVpTQkdj?=
 =?utf-8?B?UnZWOGR0QWNrQUxmSVV0UWladER3OUhnQ2pldlkzNWlULzFMK1dmYS9VTFFC?=
 =?utf-8?B?MTg5VUgxUjJRaU55VW1sb0pjTFhaWi9XMG1WTS82T3lLUlJ5MWgyMW9aeWo2?=
 =?utf-8?B?a01Oa0R1eGUzcDNrVVJPZWxQM3hmV1B6cWdobjVHMWVRRGtHZEh6L3BldkV1?=
 =?utf-8?B?dEJwSGlTMWdrMXlWbC9PdW1VcEdQT1VGYnlnNHVEakZYT21ocmhmdHl0ZzFF?=
 =?utf-8?B?eGhZZzJEM0N4aXFDUFdocFpwc25Yd0piNk9yaTRUb3dCNjRQcDg4NnlhOHp2?=
 =?utf-8?B?UEs3NXpWQ1lZNXlBeDFtbnlOVktvbDJsVGcxbVU1KzNGZnFyY1FDbVVDeiti?=
 =?utf-8?B?VEdCODFwa3VOZ1FUempLcDhWVHc5UVkvSCtGN09HN1d1d1Jub2NOZEFNaW1C?=
 =?utf-8?B?MVg2WXBPcEovSVI1NVl6VGF0RnlhQmxkNUtLU21scGxScVlKRTlaVERIaWZz?=
 =?utf-8?B?RVcxbFBDc01VUldJWjFGdGE1OXphdDF0cmVhY1ZJOTJWZ0RNc2xCTjRycERu?=
 =?utf-8?B?amw3TUxXdXdGckNMbW10N1B6UkRhVHF1NTJjcDhjdVJXaFdXTmNNUVJ2ekgy?=
 =?utf-8?B?bE1PZmdSSWt6Qi8rSHVFVlZZZjlnV0ZFUG1rRi9SYWRXNnJzN1RqRXRCZUpj?=
 =?utf-8?Q?TSE8=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <B90A1A7DB16E724183E59EC977C15DB5@amdcloud.onmicrosoft.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5849.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8f06b300-3ce7-456d-63ef-08dcb2cb84a2
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Aug 2024 08:17:15.2687
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: cmtwphKaDIBwK6AUZTE+cm6m18BR8zL3/Z/xecAus+JQ7iYwJy3wz78wi2rw6MvJNqKLPPlOgLVp3RWQs/cKkQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB7111

T24gMjAyNC84LzIgMTY6MTEsIFJvZ2VyIFBhdSBNb25uw6kgd3JvdGU6DQo+IE9uIEZyaSwgQXVn
IDAyLCAyMDI0IGF0IDAyOjM3OjI0QU0gKzAwMDAsIENoZW4sIEppcWlhbiB3cm90ZToNCj4+IE9u
IDIwMjQvNy8zMSAyMTowMywgUm9nZXIgUGF1IE1vbm7DqSB3cm90ZToNCj4+PiBPbiBXZWQsIEp1
bCAzMSwgMjAyNCBhdCAwMTozOTo0MFBNICswMjAwLCBKYW4gQmV1bGljaCB3cm90ZToNCj4+Pj4g
T24gMzEuMDcuMjAyNCAxMzoyOSwgUm9nZXIgUGF1IE1vbm7DqSB3cm90ZToNCj4+Pj4+IE9uIFdl
ZCwgSnVsIDMxLCAyMDI0IGF0IDExOjU1OjM1QU0gKzAyMDAsIEphbiBCZXVsaWNoIHdyb3RlOg0K
Pj4+Pj4+IE9uIDMxLjA3LjIwMjQgMTE6MzcsIFJvZ2VyIFBhdSBNb25uw6kgd3JvdGU6DQo+Pj4+
Pj4+IE9uIFdlZCwgSnVsIDMxLCAyMDI0IGF0IDExOjAyOjAxQU0gKzAyMDAsIEphbiBCZXVsaWNo
IHdyb3RlOg0KPj4+Pj4+Pj4gT24gMzEuMDcuMjAyNCAxMDo1MSwgUm9nZXIgUGF1IE1vbm7DqSB3
cm90ZToNCj4+Pj4+Pj4+PiBJIGFncmVlIHdpdGggKGEpLCBidXQgSSBkb24ndCB0aGluayBlbmFi
bGluZyBQVkggZG9tMCB1c2FnZSBvZiB0aGUNCj4+Pj4+Pj4+PiBoeXBlcmNhbGxzIHNob3VsZCBi
ZSBnYXRlZCBvbiB0aGlzLiAgQXMgc2FpZCBhIFBWIGRvbTAgaXMgYWxyZWFkeQ0KPj4+Pj4+Pj4+
IGNhcGFibGUgb2YgaXNzdWluZyBQSFlTREVWT1Bfeyx1bn1tYXBfcGlycSBvcGVyYXRpb25zIGFn
YWluc3QgYSBQVkgNCj4+Pj4+Pj4+PiBkb21VLg0KPj4+Pj4+Pj4NCj4+Pj4+Pj4+IE9rYXksIEkg
Y2FuIGFjY2VwdCB0aGF0IGFzIGFuIGludGVybWVkaWF0ZSBwb3NpdGlvbi4gV2Ugb3VnaHQgdG8g
ZGVueQ0KPj4+Pj4+Pj4gc3VjaCByZXF1ZXN0cyBhdCBzb21lIHBvaW50IHRob3VnaCBmb3IgUFZI
IGRvbWFpbnMsIHRoZSBsYXRlc3QgaW4gdGhlDQo+Pj4+Pj4+PiBjb3Vyc2Ugb2YgbWFraW5nIHZQ
Q0kgd29yayB0aGVyZS4NCj4+Pj4+Pj4NCj4+Pj4+Pj4gSG0sIG9uY2UgcGh5c2Rldl9tYXBfcGly
cSgpIHdvcmtzIGFzIGludGVuZGVkIGFnYWluc3QgUFZIIGRvbWFpbnMsIEkNCj4+Pj4+Pj4gZG9u
J3Qgc2VlIHdoeSB3ZSB3b3VsZCBwcmV2ZW50IHRoZSB1c2FnZSBvZiBQSFlTREVWT1Bfeyx1bn1t
YXBfcGlycQ0KPj4+Pj4+PiBhZ2FpbnN0IHN1Y2ggZG9tYWlucy4NCj4+Pj4+Pg0KPj4+Pj4+IFdl
bGwuIElmIGl0IGNhbiBiZSBtYWRlIHdvcmsgYXMgaW50ZW5kZWQsIHRoZW4gSSBjZXJ0YWlubHkg
YWdyZWUuIEhvd2V2ZXIsDQo+Pj4+Pj4gd2l0aG91dCBldmVuIHRoZSBjb25jZXB0IG9mIHBJUlEg
aW4gUFZIIEknbSBoYXZpbmcgYSBoYXJkIHRpbWUgc2VlaW5nIGhvdw0KPj4+Pj4+IGl0IGNhbiBi
ZSBtYWRlIHdvcmsuIElpcmMgeW91IHdlcmUgYWR2b2NhdGluZyBmb3IgdXMgdG8gbm90IGludHJv
ZHVjZSBwSVJRDQo+Pj4+Pj4gaW50byBQVkguDQo+Pj4+Pg0KPj4+Pj4gRnJvbSB3aGF0IEknbSBz
ZWVpbmcgaGVyZSB0aGUgaW50ZW50aW9uIGlzIHRvIGV4cG9zZQ0KPj4+Pj4gUEhZU0RFVk9QX3ss
dW59bWFwX3BpcnEgdG8gUFZIIGRvbTAsIHNvIHRoZXJlIG11c3QgYmUgc29tZSBub3Rpb24gb2YN
Cj4+Pj4+IHBJUlFzIG9yIGFraW4gaW4gYSBQVkggZG9tMD8gIEV2ZW4gaWYgb25seSBmb3IgcGFz
c3Rocm91Z2ggbmVlZHMuDQo+Pj4+DQo+Pj4+IE9ubHkgaW4gc28gZmFyIGFzIGl0IGlzIGFuIGFi
c3RyYWN0LCBoYW5kbGUtbGlrZSB2YWx1ZSBwZXJ0YWluaW5nIHNvbGVseQ0KPj4+PiB0byB0aGUg
dGFyZ2V0IGRvbWFpbi4NCj4+Pj4NCj4+Pj4+PiBNYXliZSB5b3UncmUgdGhpbmtpbmcgb2YgcmUt
dXNpbmcgdGhlIHN1Yi1vcHMsIHJlcXVpcmluZyBQVkggZG9tYWlucyB0bw0KPj4+Pj4+IHBhc3Mg
aW4gR1NJcz8NCj4+Pj4+DQo+Pj4+PiBJIHRoaW5rIHRoYXQgd2FzIG9uZSBteSBwcm9wb3NhbHMs
IHRvIGVpdGhlciBpbnRyb2R1Y2UgYSBuZXcNCj4+Pj4+IGh5cGVyY2FsbCB0aGF0IHRha2VzIGEg
R1NJLCBvciB0byBtb2RpZnkgdGhlIFBIWVNERVZPUF97LHVufW1hcF9waXJxDQo+Pj4+PiBpbiBh
biBBQkkgY29tcGF0aWJsZSB3YXkgc28gdGhhdCBzZW1hbnRpY2FsbHkgdGhlIGZpZWxkIGNvdWxk
IGJlIGEgR1NJDQo+Pj4+PiByYXRoZXIgdGhhbiBhIHBJUlEuICBXZSBob3dldmVyIHdvdWxkIGFs
c28gbmVlZCBhIHdheSB0byByZWZlcmVuY2UgYW4NCj4+Pj4+IE1TSSBlbnRyeS4NCj4+Pj4NCj4+
Pj4gT2YgY291cnNlLg0KPj4+Pg0KPj4+Pj4gTXkgbWFpbiBjb25jZXJuIGlzIG5vdCB3aXRoIHBJ
UlFzIGJ5IGl0c2VsZiwgcElSUXMgYXJlIGp1c3QgYW4NCj4+Pj4+IGFic3RyYWN0IHdheSB0byBy
ZWZlcmVuY2UgaW50ZXJydXB0cywgbXkgY29uY2VybiBhbmQgd2hhdCBJIHdhbnRlZCB0bw0KPj4+
Pj4gYXZvaWQgb24gUFZIIGlzIGJlaW5nIGFibGUgdG8gcm91dGUgcElSUXMgb3ZlciBldmVudCBj
aGFubmVscy4gIElPVzoNCj4+Pj4+IGhhdmUgaW50ZXJydXB0cyBmcm9tIHBoeXNpY2FsIGRldmlj
ZXMgZGVsaXZlcmVkIG92ZXIgZXZlbnQgY2hhbm5lbHMuDQo+Pj4+DQo+Pj4+IE9oLCBJIG1pZ2h0
IGhhdmUgc2xpZ2h0bHkgbWlzdW5kZXJzdG9vZCB5b3VyIGludGVudGlvbnMgdGhlbi4NCj4+Pg0K
Pj4+IE15IGludGVudGlvbiB3b3VsZCBiZSB0byBub3QgZXZlbiB1c2UgcElSUXMgYXQgYWxsLCBp
biBvcmRlciB0byBhdm9pZA0KPj4+IHRoZSB0ZW1wdGF0aW9uIG9mIHRoZSBndWVzdCBpdHNlbGYg
bWFuYWdpbmcgaW50ZXJydXB0cyB1c2luZw0KPj4+IGh5cGVyY2FsbHMsIGhlbmNlIEkgd291bGQg
aGF2ZSBwcmVmZXJyZWQgdGhhdCBhYnN0cmFjdCBpbnRlcmZhY2UgdG8gYmUNCj4+PiBzb21ldGhp
bmcgZWxzZS4NCj4+Pg0KPj4+IE1heWJlIHdlIGNvdWxkIGV2ZW4gZXhwb3NlIHRoZSBYZW4gSVJR
IHNwYWNlIGRpcmVjdGx5LCBhbmQganVzdCB1c2UNCj4+PiB0aGF0IGFzIGludGVycnVwdCBoYW5k
bGVzLCBidXQgc2luY2UgSSdtIG5vdCB0aGUgb25lIGRvaW5nIHRoZSB3b3JrDQo+Pj4gSSdtIG5v
dCBzdXJlIGl0J3MgZmFpciB0byBhc2sgZm9yIHNvbWV0aGluZyB0aGF0IHdvdWxkIHJlcXVpcmUg
bW9yZQ0KPj4+IGNoYW5nZXMgaW50ZXJuYWxseSB0byBYZW4uDQo+Pj4NCj4+Pj4+PiBJIHRoaW5r
IEkgc3VnZ2VzdGVkIHNvbWV0aGluZyBhbG9uZyB0aGVzZSBsaW5lcyBhbHNvIHRvDQo+Pj4+Pj4g
SmlxaWFuLCB5ZXQgd2l0aCB0aGUgbm93IGludGVuZGVkIGV4cG9zdXJlIHRvICFoYXNfcGlycSgp
IGRvbWFpbnMgSSdtDQo+Pj4+Pj4gbm90IHN1cmUgdGhpcyBjb3VsZCBiZSBtYWRlIHdvcmsgcmVs
aWFibHkuDQo+Pj4+Pg0KPj4+Pj4gSSdtIGFmcmFpZCBJJ3ZlIGJlZW4gbGFja2luZyBiZWhpbmQg
b24gcmV2aWV3aW5nIHRob3NlIHNlcmllcy4NCj4+Pj4+DQo+Pj4+Pj4gV2hpY2ggcmVtaW5kcyBt
ZSBvZiBhbm90aGVyIHF1ZXN0aW9uIEkgaGFkOiBXaGF0IG1lYW5pbmcgZG9lcyB0aGUgcGlycQ0K
Pj4+Pj4+IGZpZWxkIGhhdmUgcmlnaHQgbm93LCBpZiBEb20wIHdvdWxkIGlzc3VlIHRoZSByZXF1
ZXN0IGFnYWluc3QgYSBQVkggRG9tVT8NCj4+Pj4+PiBXaGF0IG1lYW5pbmcgd2lsbCBpdCBoYXZl
IGZvciBhICFoYXNfcGlycSgpIEhWTSBkb21haW4/DQo+Pj4+Pg0KPj4+Pj4gVGhlIHBpcnEgZmll
bGQgY291bGQgYmUgYSB3YXkgdG8gcmVmZXJlbmNlIGFuIGludGVycnVwdC4gIEl0IGRvZXNuJ3QN
Cj4+Pj4+IG5lZWQgdG8gYmUgZXhwb3NlZCB0byB0aGUgUFZIIGRvbVUgYXQgYWxsLCBidXQgaXQn
cyBhIHdheSBmb3IgdGhlDQo+Pj4+PiBkZXZpY2UgbW9kZWwgdG8gaWRlbnRpZnkgd2hpY2ggaW50
ZXJydXB0IHNob3VsZCBiZSBtYXBwZWQgdG8gd2hpY2gNCj4+Pj4+IGRvbWFpbi4NCj4+Pj4NCj4+
Pj4gU2luY2UgcElSUS1zIGFyZSBwZXItZG9tYWluLCBfdGhhdF8ga2luZCBvZiBhc3NvY2lhdGlv
biB3b24ndCBiZQ0KPj4+PiBoZWxwZWQuIEJ1dCB5ZXMsIGFzIHBlciBhYm92ZSBpdCBjb3VsZCBz
ZXJ2ZSBhcyBhbiBhYnN0cmFjdCBoYW5kbGUtDQo+Pj4+IGxpa2UgdmFsdWUuDQo+Pj4NCj4+PiBJ
IHdvdWxkIGJlIGZpbmUgd2l0aCBkb2luZyB0aGUgaW50ZXJydXB0IGJpbmRpbmdzIGJhc2VkIG9u
IElSUXMNCj4+PiBpbnN0ZWFkIG9mIHBJUlFzLCBidXQgSSdtIGFmcmFpZCB0aGF0IHdvdWxkIHJl
cXVpcmUgbW9yZSBjaGFuZ2VzIHRvDQo+Pj4gaHlwZXJjYWxscyBhbmQgWGVuIGludGVybmFscy4N
Cj4+Pg0KPj4+IEF0IHNvbWUgcG9pbnQgSSBuZWVkIHRvIHdvcmsgb24gYSBuZXcgaW50ZXJmYWNl
IHRvIGRvIHBhc3N0aHJvdWdoLCBzbw0KPj4+IHRoYXQgd2UgY2FuIHJlbW92ZSB0aGUgdXNhZ2Ug
b2YgZG9tY3RscyBmcm9tIFFFTVUuICBUaGF0IG1pZ2h0IGJlIGENCj4+PiBnb29kIG9wcG9ydHVu
aXR5IHRvIHN3aXRjaCBmcm9tIHVzaW5nIHBJUlFzLg0KPj4NCj4+IFRoYW5rcyBmb3IgeW91ciBp
bnB1dCwgYnV0IEkgbWF5IGJlIGEgYml0IGJlaGluZCB5b3Ugd2l0aCBteSBrbm93bGVkZ2UgYW5k
IGNhbid0IGZ1bGx5IHVuZGVyc3RhbmQgdGhlIGRpc2N1c3Npb24uDQo+PiBIb3cgc2hvdWxkIEkg
bW9kaWZ5IHRoaXMgcXVlc3Rpb24gbGF0ZXI/DQo+PiBTaG91bGQgSSBhZGQgYSBuZXcgaHlwZXJj
YWxsIHNwZWNpZmljYWxseSBmb3IgcGFzc3Rocm91Z2g/DQo+PiBPciBpZiBpdCBpcyB0byBwcmV2
ZW50IHRoZSAodW4pbWFwIGZyb20gYmVpbmcgdXNlZCBmb3IgUFZIIGd1ZXN0cywgY2FuIEkganVz
dCBhZGQgYSBuZXcgZnVuY3Rpb24gdG8gY2hlY2sgaWYgdGhlIHN1YmplY3QgZG9tYWluIGlzIGEg
UFZIIHR5cGU/IExpa2UgaXNfcHZoX2RvbWFpbigpLg0KPiANCj4gSSB0aGluayB0aGF0IHdvdWxk
IGJlIHBhcnQgb2YgYSBuZXcgaW50ZXJmYWNlLCBhcyBzYWlkIGJlZm9yZSBJIGRvbid0DQo+IHRo
aW5rIGl0IHdvdWxkIGJlIGZhaXIgdG8gZm9yY2UgeW91IHRvIGRvIGFsbCB0aGlzIHdvcmsuICBJ
IHdvbid0DQo+IG9wcG9zZSB3aXRoIHRoZSBhcHByb2FjaCB0byBhdHRlbXB0IHRvIHJlLXVzZSB0
aGUgZXhpc3RpbmcgaW50ZXJmYWNlcw0KPiBhcyBtdWNoIGFzIHBvc3NpYmxlLg0KVGhhbmtzLg0K
DQo+IA0KPiBJIHRoaW5rIHRoaXMgcGF0Y2ggbmVlZHMgdG8gYmUgYWRqdXN0ZWQgdG8gZHJvcCB0
aGUgY2hhbmdlIHRvDQo+IHhlbi9hcmNoL3g4Ni9waHlzZGV2LmMsIGFzIGp1c3QgYWxsb3dpbmcg
UEhZU0RFVk9QX3ssdW59bWFwX3BpcnENCj4gd2l0aG91dCBhbnkgY2hhbmdlIHRvIGRvX3BoeXNk
ZXZfb3AoKSBzaG91bGQgcmVzdWx0IGluIHRoZSBjb3JyZWN0DQo+IGJlaGF2aW9yLg0KRG8geW91
IG1lYW4gdGhhdCBJIGRvbid0IG5lZWQgdG8gYWRkIGFueSBmdXJ0aGVyIHJlc3RyaWN0aW9ucyBp
biBkb19waHlzZGV2X29wKCksIGp1c3Qgc2ltcGx5IGFsbG93IFBIWVNERVZPUF97LHVufW1hcF9w
aXJxIGluIGh2bV9waHlzZGV2X29wKCkgPw0KDQo+IA0KPiBUaGFua3MsIFJvZ2VyLg0KDQotLSAN
CkJlc3QgcmVnYXJkcywNCkppcWlhbiBDaGVuLg0K

