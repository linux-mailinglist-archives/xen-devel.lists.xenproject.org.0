Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C356AEB116
	for <lists+xen-devel@lfdr.de>; Fri, 27 Jun 2025 10:17:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1027371.1402024 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uV4Gg-0004bv-QI; Fri, 27 Jun 2025 08:17:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1027371.1402024; Fri, 27 Jun 2025 08:17:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uV4Gg-0004Zh-NV; Fri, 27 Jun 2025 08:17:06 +0000
Received: by outflank-mailman (input) for mailman id 1027371;
 Fri, 27 Jun 2025 08:17:05 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=8Eu8=ZK=amd.com=Jiqian.Chen@srs-se1.protection.inumbo.net>)
 id 1uV4Gf-0004Zb-8m
 for xen-devel@lists.xenproject.org; Fri, 27 Jun 2025 08:17:05 +0000
Received: from NAM02-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam02on20618.outbound.protection.outlook.com
 [2a01:111:f403:2405::618])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 18790c10-532f-11f0-b894-0df219b8e170;
 Fri, 27 Jun 2025 10:16:59 +0200 (CEST)
Received: from BL1PR12MB5849.namprd12.prod.outlook.com (2603:10b6:208:384::18)
 by MW6PR12MB9018.namprd12.prod.outlook.com (2603:10b6:303:241::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.22; Fri, 27 Jun
 2025 08:16:56 +0000
Received: from BL1PR12MB5849.namprd12.prod.outlook.com
 ([fe80::b77f:9333:3a5a:d285]) by BL1PR12MB5849.namprd12.prod.outlook.com
 ([fe80::b77f:9333:3a5a:d285%4]) with mapi id 15.20.8835.027; Fri, 27 Jun 2025
 08:16:55 +0000
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
X-Inumbo-ID: 18790c10-532f-11f0-b894-0df219b8e170
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sx1QJYCoEXA4GRqE1sBn/HhdBKhuR5UevIzFonLofMEN7BArl5nrM0HG99t8mxjc8AcKrCAoXtOkCy7204asuM5xihjTqzKRDPEAfEmM1aDLFvJdfbLsOqcoah8u3Tfrd+qsx23mOjza5ZgLpu9HvvXXDffA7iVORHlmEEZhOXKIFcWlI8BNW3aubXwk/4b/jeHpFU4VlnIs/I3v5Jn6tLR6heQL5GNBs8KuCSMYl0kx28NYvavp/4t2XgS6NCYpt9sqpWwDE8Fpnpj1V8UwnhunC1915O51J3aqHgLRnDPk4b67lG/fyulb0PYowlX8Ihz/wWK0OexlXtb3e99XEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OhursG92AhVjiFUsg1WjvyI4dMawgJC4uy8nKrFwTaw=;
 b=xs7jrE4VuHV81wcIcjcosw1SABb7cw8mZcWlefYs0LEBpJCfsBanW3qf7iee4wRakhIdpMdmouDNQPjgKGplbTOn0o0KYpEOPFVXSRfwS0JQhe5FPQ3Ctk9Y1P357oHWhxXceHF3bFNXE5uuVLWLvK4ditpyZYEJ30LVq4T8kXlwuxhIyLJfj68qDSfeas1ltBHCofkfIzLgi7TW4NITJLzJLnWy5O/Q9cNig7p3qct8CtdydTLqb0NMpOfuZCONLVsGrywVPcYD59kyOUmmrW8RBVklpMnRWHY5eGv0Am0DSwOLRaFctWkIVr8r2a6Rupa23GFJR2bJQM2mpaPmZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OhursG92AhVjiFUsg1WjvyI4dMawgJC4uy8nKrFwTaw=;
 b=DC7mh2wzlj9FHh7C0Nf78aHt7Dhs6yn0T8HO55LUt7DKchiuwr3iLdNyLpE9K0T35sOnYkSsw8w4vloWjmlEDXWk0uyaY6W8DuZyjNPZotnasK47Nklyd7yfw725WzcWLA+E++YN7WNdsEqApjiGRp7+EnTUiLuHXmwHVEgKTIA=
From: "Chen, Jiqian" <Jiqian.Chen@amd.com>
To: Jan Beulich <jbeulich@suse.com>
CC: =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>,
	"Orzel, Michal" <Michal.Orzel@amd.com>, Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>, "Huang, Ray" <Ray.Huang@amd.com>, "Chen,
 Jiqian" <Jiqian.Chen@amd.com>
Subject: Re: [PATCH v6 2/8] vpci: Refactor REGISTER_VPCI_INIT
Thread-Topic: [PATCH v6 2/8] vpci: Refactor REGISTER_VPCI_INIT
Thread-Index:
 AQHb23yakGdVC9XxvEWnYcnp8zrTt7QI/QAAgAGa9QCAAQzVgIAG5D6A//99hgCAAJwoAP//hioAgAHew4D//5oCgAASTfCA//+FrwCAAIi+gP//u5+AgAGwYID//8AMgIABfE8A//+xAYAAFS19AA==
Date: Fri, 27 Jun 2025 08:16:54 +0000
Message-ID:
 <BL1PR12MB5849EE5D3CD34DECBEC084A3E745A@BL1PR12MB5849.namprd12.prod.outlook.com>
References: <20250612092942.1450344-1-Jiqian.Chen@amd.com>
 <BL1PR12MB5849C69BD1485B1B98F7D0FDE778A@BL1PR12MB5849.namprd12.prod.outlook.com>
 <5c4b186e-686e-4fc8-bcf1-854bc1f5ec8b@suse.com>
 <BL1PR12MB5849DE8416FE549834235780E778A@BL1PR12MB5849.namprd12.prod.outlook.com>
 <9d5d0e44-66c3-4e3f-8704-2c862c5f5aff@suse.com>
 <BL1PR12MB5849B3C334EF0C5BBCAFB7BAE77BA@BL1PR12MB5849.namprd12.prod.outlook.com>
 <3638e73c-2a83-4164-9a84-839245245727@suse.com>
 <BL1PR12MB584988E00D0F4A4330B9B968E77BA@BL1PR12MB5849.namprd12.prod.outlook.com>
 <771cd5b7-2b89-49b1-9aba-8cd79319d3ce@suse.com>
 <BL1PR12MB58492A16BFE80B49045AB936E77BA@BL1PR12MB5849.namprd12.prod.outlook.com>
 <7753470a-efef-478a-bbe5-ae48d008cfdb@suse.com>
 <BL1PR12MB584979FA987CE2D6E242648FE77AA@BL1PR12MB5849.namprd12.prod.outlook.com>
 <cf41d703-dae1-42fd-86a2-aec32184adcc@suse.com>
 <BL1PR12MB5849302474B73599557CC1F2E745A@BL1PR12MB5849.namprd12.prod.outlook.com>
 <f50a5c04-73f8-42b6-bcaa-fd9b30088f21@suse.com>
In-Reply-To: <f50a5c04-73f8-42b6-bcaa-fd9b30088f21@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-exchange-imapappendstamp: BL1PR12MB5849.namprd12.prod.outlook.com
 (15.20.8835.025)
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BL1PR12MB5849:EE_|MW6PR12MB9018:EE_
x-ms-office365-filtering-correlation-id: 3d7bc48c-a59d-44cb-defd-08ddb552fa6e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|376014|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?UmdsSlFLSGVoT1QrbFcxT0IrSkpVb3lkemlRWXlyY29HNUwzdUdPNmlrRkp2?=
 =?utf-8?B?Q283WmVIU2hFeFRhRlNIMmRPK0RGRnZ5TGhIS3BKMitYeG9uVFBnUEZFdGEv?=
 =?utf-8?B?V3VnOEQycHZtWXlTRzl2NkdBVGxIRk1pV3lndnlYQWRMTnZKZHVCRWw4Y0gw?=
 =?utf-8?B?RVhWcnJCaldNazJOZHg0U2VmOENzc3cwSmZuMjllaFE1ZW5xVnJpa09hZlh4?=
 =?utf-8?B?RHdRbFRlcHZyQWozMjBoTDM1UjUxQmdNY1N3ZmNidm1hMFFNVytiQTlSaGg5?=
 =?utf-8?B?TEhTdnpPUWduMXZwRkx2V3R0UGd1cndyaDlsYWx1S01XRm5oblR2N3ZPaVFE?=
 =?utf-8?B?VmdIOTFVczNpNzNlL3habzZWTk5TMEVvZnJmNnJoWDNDU0R6YndYL0Ria1hy?=
 =?utf-8?B?My9FNlVDa2lvS3QrcXpTMnAya0xHRFV3cDc3WkU2SitZYzBHVDg3aFJwclhN?=
 =?utf-8?B?VTQxUFZyeDF6YVhQY3lxaEhHVVMvWEhYSXAzcWxkN1dURHl5Ym85dHF2YzJx?=
 =?utf-8?B?T294VW1JMlk4R0NiMHp4VmhqSVVGamN3ckhOeFVZUC92eGJnalZYQ1FCTnlK?=
 =?utf-8?B?UEt3YTFMUmNyb2g5cGtnUDdiWHBteCtwM1JtVGZQTEFiaFl3TFdVTUFuNjlO?=
 =?utf-8?B?ZVJzSnA0NnRkdW9wRzJBMmZSWC94ZzNjemRNdWdoSTVWMVduZ3RFM3lMRTBM?=
 =?utf-8?B?WUwyWmVnd3czOVI2VktTS1Z2amUxUlhYZjd4akc4M2owYUN2MnZUOEZlbXFQ?=
 =?utf-8?B?SGNtVmRRVUlrd0xEVGkxeno0MmVXbldjL1R0SStRT3NzQU44SmowZ0ZvL1RU?=
 =?utf-8?B?TUpSQXp6TjNkaVc5U0wxdHlvZHlaTDBxeGpuRU5wTmdmNE5vZUFhekZOaklO?=
 =?utf-8?B?Z21kYlZrUXo3ZTFsbjNZaW0wY3lBS0RpUmFYUFI5Rzg4Ukc4allveGgrTlVD?=
 =?utf-8?B?SWFkay93Z3F0N1JWeTlMUGg1VUFxbjBnVHdybFlybGFRRDliNFJROEJ5R2dy?=
 =?utf-8?B?OGNJU3hvTjBOSVdTaGRWaDlHd3JWRU43QmZaeGx0VWZ3SDJKZHJzWU1CdWt2?=
 =?utf-8?B?MGR0TDgyQzVWaDhvZlp6NTV0SnV3cFBIZ1RLT2c2L01ybGNCZ09CWXRtSGxQ?=
 =?utf-8?B?VUNYaVhGK085eWpZOXFjL096ZHZXUU5XcDVMQ0JXNUFFakk2cUNhdXJMUVll?=
 =?utf-8?B?dDcwdmpnNDhkbmhTU1Q3WTlrNzNTSVVDRndVVjN5ZHJwdEdWVEtUS21XdHFJ?=
 =?utf-8?B?U2lXbklRNXFnTG1VNmVuNnhRZjd5SnJZYVhnQU03VDlKRTZhOC9SRGIycXcz?=
 =?utf-8?B?V1pqVDRvRlVRT3U5SGs0dnFrdGFOUm5PS3p5WHl4R2pmOEUycFhydVJxVDlq?=
 =?utf-8?B?aVRLcCsxMnozTjl4aDUzSHFydnpiTUNGWEFLM1NOYWZVTi9vNEtOUGZSVlkz?=
 =?utf-8?B?MU5jLzVjZFRQYlU4VWxVcWNFQWhxbTVhUENtSThXdElLeTBveUYycG1xeXlE?=
 =?utf-8?B?WXBOMXVDQ0x2QTlEeE1SclNHazhjcElucnZCbThCeUs5U09neW9vRHZHdHk0?=
 =?utf-8?B?YWxaSk9nV1J3d2hzUDhHRkh3V0Q0UkdpcDdDRlMxaHQrSlF2NkM4anhIaHZw?=
 =?utf-8?B?UFpKR3lYZkNvdG5DWGtmdWxUYlFTQ05iRWpEcVFZN3hNdDlVQlEvOXRwWHJH?=
 =?utf-8?B?NWxkQVh6STlhREVLbjBZNUpmcndLeVRUVXIrMEVhaVJrdTMya1dtTTEvSlUr?=
 =?utf-8?B?VkkwU1NnVTlDSFZTSFFFbFN5UVdhL3hEeEU1SDdpU1puMDgxTGlOTURmOVEr?=
 =?utf-8?B?TGo1TjJoYTNYZU14UVI5RGtFdVdFVzRURGZzTUFsU2Fod3U1WGF6N0xSSHNM?=
 =?utf-8?B?R2l0ZGlUL2x3eGhLa216TnBDYWRubEtBc2ZLSVZnS1RqVkZkVndjYzlsNnlD?=
 =?utf-8?B?ZktJMGZ1TDBsZ0c2L241WDNLY0I4K1JVTk44N0lVOHMxU2hGWnEvbkFMNXRV?=
 =?utf-8?B?ZExPWW1qa0hnPT0=?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR12MB5849.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?U2pPZnhvK3FjTmsxZ3pCVjZqenN5cWtmeUI1Q2dibEZlK3NyZmtTZTFXbXY0?=
 =?utf-8?B?MkZ6TWx4NUVjMXVyVDdHcWJPMGpzbHFqcDlLd1d5aVlmeVFNa29xVzVMOVFh?=
 =?utf-8?B?alNHRHBXTU1DQjJVbUErWTVFNktpQmZ5ejJobmNPS1MyM3NuVEU2UmpyWldN?=
 =?utf-8?B?UjFTUjJYN0ptbkpwbU4zdVE2c1h4dkVFTC9JN2xLSm5Yb281ZUo3cVpxZ2x3?=
 =?utf-8?B?alRTWEtaS29UblZsLy9rS3NtSE9QWi9oUzM2bG00UDZ3ZGQ3Q21XdDBFWFdq?=
 =?utf-8?B?dXdpQnFCUEQ3VS9WbU4xUGlmY2RaaUMzTGRzSlF4N2hKMkhFTENSdjhKRWNI?=
 =?utf-8?B?QXRIcmlXZXg1NFpDQzdtWVlzSkhiZER0OER3V2R6dDRETGZMMjJnUWh6WlNY?=
 =?utf-8?B?ekhEYWlxKy85TVJWaDEzbUV3b2JZdnkxR1NVR21qUWhJbzZhcHhuNGtTRHFu?=
 =?utf-8?B?ekdSTVovVk80ejR3WXRoRE9sRlBFUHEzdldtMC9mc09jb0M2M0hTdnB2dSt2?=
 =?utf-8?B?NmhQTTUxOXZPSmZrcy9Qb1cza1ROY3IveGNYNG53WFBqL1c5MDVGTzB5NEt4?=
 =?utf-8?B?SGVsOU51eEt2ZlpKeVBPYjFPY2lva1RsNHc5ak1PK1E4d0diRTVGc2VpTk90?=
 =?utf-8?B?MjVsbDk0MUI1TWNNRmlxazRwQ0dld3E2UkQ0TGVZOTJFZ3lzZHZjUWprdjZs?=
 =?utf-8?B?NFNKandEZVV2N0h1enZtbmEvR0NyQ3J2RGp5UzRIQ3lzZ0JTcEdPNmpQcGJV?=
 =?utf-8?B?WEhTUjdNWkxOYUZ5UVhkMnErQ2pKTVpDSnNkUjZFZ1lCWTg0b1N4eTFPdWg4?=
 =?utf-8?B?bm1vM3dwYW9tZ1p1aE1FM3diQUhmaE1HenE4Mk9zY3VQcWd5VUd3VjR5VlFX?=
 =?utf-8?B?VC9JdVplWW9pRnRYb1ZoMXRMNUtQalZ4Z2ZYYTkyUlRIMHdsd1JWQkIyYW1o?=
 =?utf-8?B?VFBYZnZwMVp1ZzBIN1JTaFhCNHI5S0RjRGFEbkcxV0JyV21lbXNQeUN6alBH?=
 =?utf-8?B?bjhUR3JwNDVMcTZhbXUxenhaUXJhTldla2xUZjhpUldYdGg2c3ZDL01kdGhm?=
 =?utf-8?B?M1R0aC9hR0ROSXZyZlIvNERoUzZMLzFQRjZQMUt5VUd1VG50bkFWQ2xQTWtE?=
 =?utf-8?B?WXFadDRUYTcyaTEzVUhJZk1Wbk1WMk1Eb0RkUU0yQ1AweEFIMkVlU0xZdWxZ?=
 =?utf-8?B?aFpqMjNubGhPa2h2UUpmcERsVVdqNzRJRTlzNUxEdnp6c0ZlT1FyUW81UzA5?=
 =?utf-8?B?N1gzT0k5M0RHNVJDaVFwUmxEdWVsK0FCWjhvMFBxSW9JVkhnSjdPSU9HaWxO?=
 =?utf-8?B?T2pBT3k5UitmZWp1S01tK21sMHVjU1NzMlBtYmtianpwS2poWjVRdTJOVnNT?=
 =?utf-8?B?R2FoWGF4VnQyRjhzWHl4eitUUWlEY1hpVHBQTE1GMktmazFsSzFkbU5CQkdJ?=
 =?utf-8?B?NFU2eG9uWkxFT3JTb2FlZEk2emI0ZFgrTTRONTNoeUtQa1AxbmhRWmx4dG1n?=
 =?utf-8?B?U1BIUCtpZlFvbmNNTWZPREMvdjRZVWFwZ09hMzZRTjZRSW9haGd6c21zNUVl?=
 =?utf-8?B?UEdUN2Vxano3NjhRVXNYbjFaMVBaUU9naTRWc1RQUHNYRkY1MHR0UjBOMkdN?=
 =?utf-8?B?cndBYmhoWlIyN0ZlL2ZKb25rU0xZalVlejNWQmxhcUZYdVROK01hTCtBSS9k?=
 =?utf-8?B?QUhvT1kxRit4NXZ4MnpHTjVqdTJudWpGSEJlb3pQeTc0UlVJWEVpSEU0bEE2?=
 =?utf-8?B?clcxd1FzOGtOaFhLU3VtaGtJOGxJTWJxVFpnL1ZFWDRaaG9paWdIZW1yWkg2?=
 =?utf-8?B?VWpDaEkyaXlHZ0NHeXUwZmk3T25tT0hOUldjNjFKbWNaN3lkM3pXSFNudk5l?=
 =?utf-8?B?RmM3TzlPZGJqcnU5TDNLOTFIOGRKZUFjbGxDNkRJWWJhTUNLTW5pV0JLMi9G?=
 =?utf-8?B?Y3BiZVA4TklrS0FyaGlDZXVEWGxhVHg2eC9IU1p1dW1QQWhMSEJ1NXE1Wm04?=
 =?utf-8?B?d01Tb0lwVHpvQndhTHN5OGZKU2pYVUk0T0d4Z2J4ZzZiRGF3VGxvTnNuU0tm?=
 =?utf-8?B?M1VKT1MybWlzS3c3OEM0ODNTVU9VZCs1dUo4Vm9rSWtpbnhtU0FpYTBLYk1T?=
 =?utf-8?Q?5NwQ=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <3B619359734FAC4B8C74819D1CF62AB4@amdcloud.onmicrosoft.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5849.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3d7bc48c-a59d-44cb-defd-08ddb552fa6e
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Jun 2025 08:16:54.9392
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: b0qRwR4ijV3hyyXJqQDo9eEAo9mMCY11nVlSkX6s2XiDw6WV8FakKnLNTErUcexdBuGH+M24OPD12R0DWo2p3w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW6PR12MB9018

T24gMjAyNS82LzI3IDE0OjA1LCBKYW4gQmV1bGljaCB3cm90ZToNCj4gT24gMjcuMDYuMjAyNSAw
NDo1OSwgQ2hlbiwgSmlxaWFuIHdyb3RlOg0KPj4gT24gMjAyNS82LzI2IDIwOjA2LCBKYW4gQmV1
bGljaCB3cm90ZToNCj4+PiBPbiAyNi4wNi4yMDI1IDEwOjAzLCBDaGVuLCBKaXFpYW4gd3JvdGU6
DQo+Pj4+IE9uIDIwMjUvNi8yNSAyMjowNywgSmFuIEJldWxpY2ggd3JvdGU6DQo+Pj4+PiBPbiAy
NS4wNi4yMDI1IDEyOjE2LCBDaGVuLCBKaXFpYW4gd3JvdGU6DQo+Pj4+Pj4gT24gMjAyNS82LzI1
IDE4OjAzLCBKYW4gQmV1bGljaCB3cm90ZToNCj4+Pj4+Pj4gQWxzbywgYXMgc2FpZCAtIHlvdSB3
aWxsIG5lZWQgdG8gY2hlY2sgd2hldGhlciBvdGhlciBhcmNoaXRlY3R1cmVzIGFyZQ0KPj4+Pj4+
PiBkaWZmZXJlbnQgZnJvbSB4ODYtNjQgaW4gdGhpcyByZWdhcmQuIFdlIGJldHRlciB3b3VsZG4n
dCBsZWF2ZSBhIHRyYXAgaGVyZSwNCj4+Pj4+Pj4gZm9yIHRoZW0gdG8gZmFsbCBpbnRvIHdoZW4g
dGhleSBlbmFibGUgdlBDSSBzdXBwb3J0LiBJLmUuIG15IHJlY29tbWVuZGF0aW9uDQo+Pj4+Pj4+
IHdvdWxkIGJlIHRoYXQgaWYgaW4gZG91YnQsIHdlIHB1dCB0aGUgX19hbGlnbmVkKCkgdGhlcmUg
dW5jb25kaXRpb25hbGx5Lg0KPj4+DQo+Pj4gTm90ZSBob3cgSSB1c2VkIF9fYWxpZ25lZCgpIGhl
cmUuIFdoeSB3b3VsZCB5b3UgLi4uDQo+Pj4NCj4+Pj4+PiBUaGF0J3MgZGlmZmljdWx0IGZvciBt
ZSB0byBjaGVjayBvbiBhbGwgZGlmZmVyZW50IHBsYXRmb3JtcyBzaW5jZSBJIGRvbid0IGhhdmUg
dGhlbSBhbGwuDQo+Pj4+Pg0KPj4+Pj4gWW91IGRvbid0IG5lZWQgdG8gaGF2ZSB0aGVtLiBZb3Un
ZCBuZWVkIHRvIGNhcmVmdWxseSBnbyB0aHJvdWdoIHRoZSByZXNwZWN0aXZlDQo+Pj4+PiBzZWN0
aW9uKHMpIG9mIHRoZWlyIHBzQUJJLXMuDQo+Pj4+Pg0KPj4+Pj4+IFNvIHlvdSBtZWFuIEkgc2hv
dWxkIHJlbW92ZSAiI2lmZGVmIENPTkZJR19YODYiPyBKdXN0IGxldCBfX2FsaWduZWQoMTYpIGZv
ciBhbGwgcGxhdGZvcm1zPw0KPj4+Pj4NCj4+Pj4+IFllcy4gQW5kLCBhcyBhbHNvIHNhaWQsIHdp
dGggYSBzdWl0YWJsZSBjb21tZW50IHBsZWFzZS4NCj4+Pj4gQWgsIG15IGNvbW1lbnQgZGVmaW5p
dGVseSBuZWVkcyB5b3VyIGNoYW5nZSBzdWdnZXN0aW9uLg0KPj4+PiBJIHdyb3RlIGEgZHJhZnQg
YXMgYmVsb3c6DQo+Pj4+DQo+Pj4+IC8qDQo+Pj4+ICAqIFNpemUgb2YgdnBjaV9jYXBhYmlsaXR5
IGlzIGxhZ2VyIHRoYW4gOCBieXRlcy4gV2hlbiBpdCBpcyB1c2VkIGFzIHRoZSBlbnRyeQ0KPj4+
PiAgKiBvZiBfX3N0YXJ0X3ZwY2lfYXJyYXkgaW4gc2VjdGlvbiwgaXQgaXMgMTYtYnl0ZSBhbGln
bmVkIGJ5IGFzc2VtYmxlciwgdGhhdA0KPj4+PiAgKiBjYXVzZXMgdGhlIGFycmF5IGxlbmd0aCAo
X19lbmRfdnBjaV9hcnJheSAtIF9fc3RhcnRfdnBjaV9hcnJheSkgd3JvbmcsIHNvDQo+Pj4+ICAq
IGZvcmNlIGl0cyBkZWZpbml0aW9uIHRvIHVzZSAxNi1ieXRlIGFsaWduZWQgaGVyZS4NCj4+Pj4g
ICovDQo+Pj4+IHN0cnVjdCB2cGNpX2NhcGFiaWxpdHkgew0KPj4+PiAgICAgdW5zaWduZWQgaW50
IGlkOw0KPj4+PiAgICAgYm9vbCBpc19leHQ7DQo+Pj4+ICAgICBpbnQgKCogaW5pdCkoY29uc3Qg
c3RydWN0IHBjaV9kZXYgKnBkZXYpOw0KPj4+PiAgICAgaW50ICgqIGNsZWFudXApKGNvbnN0IHN0
cnVjdCBwY2lfZGV2ICpwZGV2KTsNCj4+Pj4gfSBfX2F0dHJpYnV0ZV9fKChhbGlnbmVkKDE2KSkp
Ow0KPj4+DQo+Pj4gLi4uIG9wZW4tY29kZSB0aGF0IGhlcmU/DQo+PiBUaGF0IGJlY2F1c2Ugd2hl
biB1c2luZyBfX2FsaWduZWQoKSB3aXRob3V0IENPTkZJR19YODYsIEkgZ290IGNvbXBpbGUgZXJy
b3INCj4+IHZwY2kuaDoxODoxMzogZXJyb3I6IGV4cGVjdGVkIGRlY2xhcmF0aW9uIHNwZWNpZmll
cnMgb3Ig4oCYLi4u4oCZIGJlZm9yZSBudW1lcmljIGNvbnN0YW50DQo+PiAgICAxOCB8IH0gX19h
bGlnbmVkKDE2KTsNCj4+ICAgICAgIHwgICAgICAgICAgICAgXn4NCj4+IEkgdHJpZWQgc29tZSBt
ZXRob2RzLCBvbmx5IG9wZW4tY29kZSBjYW4gZml4IGl0Lg0KPiANCj4gV2VsbCwgdGhhdCdzIG9k
ZC4gSW4gZS5nLiB4ZW4vc2NoZWQuaCB3ZSBoYXZlDQpZZXMsIEkgc2VlLg0KVGhhdCdzIHNvIHN0
cmFuZ2UuDQpFdmVuIEkgZG8gYmVsb3cgYWxzbyBnZXQgdGhlIGVycm9yIG1lc3NhZ2UuIEJ1dCBp
ZiBvcGVuLWNvZGUsIGl0IHdvcmtzLg0KDQpkaWZmIC0tZ2l0IGEveGVuL2luY2x1ZGUveGVuL3Zw
Y2kuaCBiL3hlbi9pbmNsdWRlL3hlbi92cGNpLmgNCmluZGV4IDUxNTczYmFhYmMuLjM1MGViNWYy
ODkgMTAwNjQ0DQotLS0gYS94ZW4vaW5jbHVkZS94ZW4vdnBjaS5oDQorKysgYi94ZW4vaW5jbHVk
ZS94ZW4vdnBjaS5oDQpAQCAtMTMsMTIgKzEzLDE3IEBAIHR5cGVkZWYgdWludDMyX3QgdnBjaV9y
ZWFkX3QoY29uc3Qgc3RydWN0IHBjaV9kZXYgKnBkZXYsIHVuc2lnbmVkIGludCByZWcsDQogdHlw
ZWRlZiB2b2lkIHZwY2lfd3JpdGVfdChjb25zdCBzdHJ1Y3QgcGNpX2RldiAqcGRldiwgdW5zaWdu
ZWQgaW50IHJlZywNCiAgICAgICAgICAgICAgICAgICAgICAgICAgIHVpbnQzMl90IHZhbCwgdm9p
ZCAqZGF0YSk7DQoNCisjaWZkZWYgX19hbGlnbmVkDQorI3VuZGVmIF9fYWxpZ25lZA0KKyNkZWZp
bmUgX19hbGlnbmVkKGEpIF9fYXR0cmlidXRlX18oKF9fYWxpZ25lZF9fKGEpKSkNCisjZW5kaWYN
CisNCiBzdHJ1Y3QgdnBjaV9jYXBhYmlsaXR5IHsNCiAgICAgdW5zaWduZWQgaW50IGlkOw0KICAg
ICBib29sIGlzX2V4dDsNCiAgICAgaW50ICgqIGNvbnN0IGluaXQpKHN0cnVjdCBwY2lfZGV2ICpw
ZGV2KTsNCiAgICAgaW50ICgqIGNvbnN0IGNsZWFudXApKHN0cnVjdCBwY2lfZGV2ICpwZGV2KTsN
Cn0gX19hbGlnbmVkKDE2KTsNCg0KDQpBbnl3YXksIEkgd2lsbCB3YWl0IGZvciB5b3VyIHBhdGNo
IG1lcmdlZC4NCg0KPiANCj4gc3RydWN0IGRvbWFpbg0KPiB7DQo+ICAgICAuLi4NCj4gfSBfX2Fs
aWduZWQoUEFHRV9TSVpFKTsNCj4gDQo+IHdoaWNoIGNsZWFybHkgbXVzdCBiZSB3b3JraW5nIGZp
bmUuIFRoZSBlcnJvciBtZXNzYWdlIGZyb20gdGhlIGNvbXBpbGVyDQo+IGRvZXNuJ3Qgc2F5IHZl
cnkgbXVjaCBhbG9uZS4gRm9yIGluZm9ybWF0aW9uYWwgZGlhZ25vc3RpY3MgdGhlIGNvbXBpbGVy
DQo+IG5vcm1hbGx5IGFsc28gZW1pdHMgbWF5IGhlbHAsIG9yIGVsc2UgaXQgd291bGQgdGFrZSBs
b29raW5nIGF0IHRoZQ0KPiBwcmUtcHJvY2Vzc2VkIG91dHB1dCB0byB1bmRlcnN0YW5kIHdoYXQn
cyBnb2luZyBvbiBoZXJlLg0KPiANCj4+PiBBcyB0byB0aGUgY29tbWVudDogRmlyc3QsIGl0IHdh
bnRzIHRvIGJlIGFzIGNsb3NlIHRvIHdoYXQgaXMgYmVpbmcgY29tbWVudGVkIGFzDQo+Pj4gcG9z
c2libGUuIEhlbmNlDQo+Pj4NCj4+PiBzdHJ1Y3QgX19hbGlnbmVkKDE2KSB2cGNpX2NhcGFiaWxp
dHkgew0KPj4gVGhpcyBhbHNvIGdvdCB0aGUgY29tcGlsZSBlcnJvci4NCj4+Pg0KPj4+IGlzIGxp
a2VseSB0aGUgYmV0dGVyIHBsYWNlbWVudC4gU2Vjb25kLCB0aGVyZSdzIG5vdGhpbmcgaGVyZSB0
aGUgYXNzZW1ibGVyIGRvZXMNCj4+PiBvbiBpdHMgb3duLiBJdCdzIHRoZSBjb21waWxlciB3aGlj
aCBkb2VzIHNvbWV0aGluZyAoaW5zZXJ0IGFsaWdubWVudCBkaXJlY3RpdmVzKSwNCj4+PiBhbmQg
b25seSB0byBmb2xsb3cgY2VydGFpbiBydWxlcy4gKFNlZSAieDg2OiBkb24ndCBoYXZlIGdjYyBv
dmVyLWFsaWduIGRhdGEiDQo+Pj4gdGhhdCBJIENjLWVkIHlvdSBvbiBmb3Igc29tZSBvZiB0aGUg
cmVsZXZhbnQgYXNwZWN0cy4pIFRoYXQgaXMsIHlvdSBkb24ndCB3YW50DQo+Pj4gdG8gImJsYW1l
IiBhbnkgcGFydCBvZiB0aGUgdG9vbCBjaGFpbiwgYXQgbGVhc3Qgbm90IHdoZXJlIGl0J3MgdGhl
IHVuZGVybHlpbmcNCj4+PiBBQkkgdGhhdCBtYW5kYXRlcyBjZXJ0YWluIGJlaGF2aW9yLiBUaGVy
ZSdzIGFsc28gbm8gc3Ryb25nIG5lZWQgdG8gdGFsayBhYm91dA0KPj4+IHRoZSBzcGVjaWZpYyBl
ZmZlY3RzIHRoYXQgaXQgd291bGQgaGF2ZSBpZiB3ZSBkaWRuJ3QgYXJyYW5nZSB0aGluZ3MgcHJv
cGVybHkuDQo+Pj4gVGhhdCBpcywgdGFsa2luZyBhYm91dCB0aGUgZWZmZWN0IG9uIGFycmF5cyBp
biBnZW5lcmFsIGlzIGZpbmUgYW5kIGhlbHBmdWwuDQo+Pj4gVGFsa2luZyBhYm91dCBfX3tzdGFy
dCxlbmR9X3ZwY2lfYXJyYXkgaW1vIGlzIG5vdC4NCj4+Pg0KPj4+IFdoaWxlIGZ1cnRoZXIgcGxh
eWluZyB3aXRoIHRoZSBjb21waWxlciwgSSBub3RpY2VkIHRoYXQgYWRkaW5nIF9fYWxpZ25lZCgx
NikNCj4+PiBhY3R1YWxseSBoYXMgYSBuZWdhdGl2ZSBlZmZlY3QgYXMgbG9uZyBhcyB0aGF0IG90
aGVyIHBhdGNoIGlzbid0IGluIHVzZTogVGhlDQo+Pj4gc3RydWN0IGluc3RhbmNlcyB0aGVuIGFy
ZSBiZWluZyBhbGlnbmVkIHRvIGV2ZW4gMzItYnl0ZSBib3VuZGFyaWVzICh3aGljaCBtZWFucw0K
Pj4+IF9fc3RhcnRfdnBjaV9hcnJheSB3b3VsZCB0aGVuIGFsc28gbmVlZCBhbGlnbmluZyBhcyBt
dWNoKS4gV2hlbiB0aGF0IG90aGVyDQo+Pj4gcGF0Y2ggaXMgaW4gdXNlLCB0aGUgX19hbGlnbmVk
KCkgYmVjb21lcyB1bm5lY2Vzc2FyeS4gVGhlcmVmb3JlIEknbSBubyBsb25nZXINCj4+PiBjb252
aW5jZWQgdXNpbmcgX19hbGlnbmVkKCkgaXMgdGhlIGJlc3Qgc29sdXRpb24gaGVyZS4NCj4+IEVt
LCBjaGFuZ2luZyBfX3N0YXJ0X3ZwY2lfYXJyYXkgdG8gYmUgc3RydWN0IHZwY2lfY2FwYWJpbGl0
eSBhcnJheSBjYXVzZSB0aG9zZSBjb25jZXJucywgbWF5YmUga2VlcGluZyB1c2luZyBzdHJ1Y3Qg
cG9pbnRlciBpcyBhIGNvbXByb21pc2UgbWV0aG9kLg0KPiANCj4gSXQgd291bGQgYmUgYSBsYXN0
IHJlc29ydCwgeWVzLCBidXQgaW1vIChhKSB3ZSBvdWdodCB0byBzdHJpdmUgdG8gYXZvaWQNCj4g
dW5uZWNlc3NhcnkgaW5kaXJlY3Rpb24gYW5kIChiKSB0aGUgc2FtZSB1bmRlcmx5aW5nIGlzc3Vl
IGNvdWxkIGJlY29tZSBhDQo+IHByb2JsZW0gZWxzZXdoZXJlIGFzIHdlbGwuDQo+IA0KPiBKYW4N
Cg0KLS0gDQpCZXN0IHJlZ2FyZHMsDQpKaXFpYW4gQ2hlbi4NCg==

