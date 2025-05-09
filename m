Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 66645AB0AAD
	for <lists+xen-devel@lfdr.de>; Fri,  9 May 2025 08:38:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.979799.1366298 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uDHM8-0000Hu-9B; Fri, 09 May 2025 06:37:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 979799.1366298; Fri, 09 May 2025 06:37:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uDHM8-0000Fl-5a; Fri, 09 May 2025 06:37:12 +0000
Received: by outflank-mailman (input) for mailman id 979799;
 Fri, 09 May 2025 06:37:10 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Yxiy=XZ=amd.com=penny.zheng@srs-se1.protection.inumbo.net>)
 id 1uDHM6-0000Di-Av
 for xen-devel@lists.xenproject.org; Fri, 09 May 2025 06:37:10 +0000
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on20610.outbound.protection.outlook.com
 [2a01:111:f403:2413::610])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 03f044e8-2ca0-11f0-9ffb-bf95429c2676;
 Fri, 09 May 2025 08:37:02 +0200 (CEST)
Received: from DM4PR12MB8451.namprd12.prod.outlook.com (2603:10b6:8:182::7) by
 CH2PR12MB4184.namprd12.prod.outlook.com (2603:10b6:610:a7::9) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8722.24; Fri, 9 May 2025 06:36:53 +0000
Received: from DM4PR12MB8451.namprd12.prod.outlook.com
 ([fe80::b04e:2da5:7189:4c4d]) by DM4PR12MB8451.namprd12.prod.outlook.com
 ([fe80::b04e:2da5:7189:4c4d%5]) with mapi id 15.20.8699.026; Fri, 9 May 2025
 06:36:53 +0000
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
X-Inumbo-ID: 03f044e8-2ca0-11f0-9ffb-bf95429c2676
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=W2q8bOd3sGP1ZVVwaXNA8baht9aiim6Yr7PtGI0N2wXG8BuqNrTAWVKVckC/jPAc3PDDEkjEP1GY8xCvPraU7VjFfZvT3Vn9jDa/HdU3Nq0irAZmNRpTGXSvFJeu9VWgJczjtC6NK5ztSBAxKNcPI91PxA7SDS//IlYHuLRO1lexZsWmR51jAXApa+fkR4a0cfZn6+oZ4+dh9e39827Ugzvbt3KZU9AlDjQk31z8mgcX2SQwuHemlZDmXb1x5n4G1bS/iaSLRq+5pxnGJRn/Wu2gggyOhljGk6/ae/d/L7kZ/coneGDtgmiWX8S6mnsDHllI8o/f72ebMvp3ff78Pw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hd10w4jlfwI4deCty2vaPhalV31ZNZ5V6MfJegapS/o=;
 b=UcPrKdKfHw67xHC1XywGWKxG5b5JszedhZpn9muYSJ+UiTbLU/SZeO8X4mkOERs4O5hCUF5lzdjx0xSqWiRZhXHWCji8riMDd4xIs47gxjAQTFStdpJECsguxcQ1LLSBwQc6yjlVq1ngML+EnZ9DWKtZAygmXytgxVfjofZ3RWXWQwU9evKL7rPYcJsnOwjRJ3LbsrgeoYan2LMPKZn8JdPWu5LeXrtgyPRR1Xu33XtY5y/0v4oGXFNjIs/8gk0F5vZefNXCVqhILq2xhTy5myZ6lBjpN4YdCdCjWK4p6le2dX745zai+alOsODHpDUCOxdz9JabpktUZa/o3nwFfA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hd10w4jlfwI4deCty2vaPhalV31ZNZ5V6MfJegapS/o=;
 b=L86OqjEci9e9NsQgWMP68vHfLfjrL8YjL3uBo+HtvQwEhwv50eCritmb+eiPOK1k1Gp1qu1z9Lk12mlLbBT20PlwYct6ji4fGKfMl6clCtGNcXJVX6R5ETxL4MSMDmBnP45WPlw78hP8lweK7HIyMtIkmpJoGhGB1qyWugB9B24=
From: "Penny, Zheng" <penny.zheng@amd.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "Huang, Ray" <Ray.Huang@amd.com>, Anthony PERARD
	<anthony.perard@vates.tech>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
Subject: RE: [PATCH v4 12/15] tools/xenpm: Print CPPC parameters for amd-cppc
 driver
Thread-Topic: [PATCH v4 12/15] tools/xenpm: Print CPPC parameters for amd-cppc
 driver
Thread-Index: AQHbrRCuBHJz/5ZpqUqHhc0gdq6hGrO8VLYAgA1zbxA=
Date: Fri, 9 May 2025 06:36:53 +0000
Message-ID:
 <DM4PR12MB8451F0794ED87DE6F9E5F2A3E18AA@DM4PR12MB8451.namprd12.prod.outlook.com>
References: <20250414074056.3696888-1-Penny.Zheng@amd.com>
 <20250414074056.3696888-13-Penny.Zheng@amd.com>
 <63b3b016-551c-4201-a3b3-db19b27ea649@suse.com>
In-Reply-To: <63b3b016-551c-4201-a3b3-db19b27ea649@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
 MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_ActionId=60030911-e914-41fa-8d24-07a684a6c104;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_ContentBits=0;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Enabled=true;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Method=Privileged;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Name=Open
 Source;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_SetDate=2025-05-09T06:36:45Z;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Tag=10,
 0, 1, 1;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR12MB8451:EE_|CH2PR12MB4184:EE_
x-ms-office365-filtering-correlation-id: 9542a5b7-3408-458b-b2a2-08dd8ec3e321
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?cVc4SU1zdjUzOFFmMWFCRFMrcE56QUZEN1MrNzZNZWQxNWgrZE51MHBJRit6?=
 =?utf-8?B?anlLQWpRK0NlN2NDQlFPSEFvaXJVUURlOGduTnB1dnZEOHRXWUF5TE1wdU95?=
 =?utf-8?B?Y0h1RFZRQ0h1TytPZERjeW9BQlVteVRaZ2VUamlBVDQxM1JFQmVhWGRuMnZ0?=
 =?utf-8?B?N1ErbC93eXBHcFlFeE51dUExR2hqazZORHl0RnVMbkdVMk9CblBHQjNEUnhp?=
 =?utf-8?B?enZDNXF3N21uUlpjODN0NWFOdjhTY2pVY2hFVzhSUERrRmR1bjhIa210aTVR?=
 =?utf-8?B?WGVIZy9oa05GVktVazI3b1JaSzdKUDFyTGN2KzVoZHFUUUlRQ3p5WDVkeDB1?=
 =?utf-8?B?SmR4MzVHMEt1TU04WW12WFA5YmlqekF1VXVtbDJuUmhGWlRKVDNiRG5vd0cy?=
 =?utf-8?B?emhKMXRRUVZTTzdGTGY3QzFyMVpCY29WWi9iYUxKVmVoSloycjk4Mm0xUU5l?=
 =?utf-8?B?Y0hWSE1VeTVCZUlYK2FhN2d3UHdjTFFMNG15ZlBqZjl6V3ZGaE5ESmtCKzhW?=
 =?utf-8?B?KzhsYms1aHBsQVFENGhSTE5xS0t2TmxyZ3ErcU5TSFFUL3BnbTJQUjQ2ZnVq?=
 =?utf-8?B?WHArQmRUWmQvaFhMMDl0RTdyV1pYdFBFRUpoaStGKzNzZDNCQ2krMUJSMlV3?=
 =?utf-8?B?U3RjWXJJbGFhaU42aGhRazI1MjQvc2o0aEx4K1NHaFNYQzNRY1pNZG5keEI2?=
 =?utf-8?B?QUJWVUYyWVEzUytENHF6TVJkdkxlY2RDekN3MSs2QW5iS2szV0pWUSt2NFF3?=
 =?utf-8?B?cDJiUyt4dTVvMUdCSVRRUWNDVlFsZzBHRkZNSHVNeGYwbUJadXRzckM5Z2RJ?=
 =?utf-8?B?Z0xyc2U3ekxJSXR0UTg1VmdCR3hkUjBWYWl3a2dONXBrTTZyTDlDM1l4VHg1?=
 =?utf-8?B?UWFkSFpPS0VLTHh3UkZ1NTVFY3VpditBNGxvY1NRM3RTa3UxVjNQUWxWY2ZK?=
 =?utf-8?B?RWh6cmFqNXNzSTZsVjVBTG1jNXR2cmVVclJtNEdDay9wbndBL01VUjNrRnFG?=
 =?utf-8?B?RURlMm03YXhSUHhoaVYvSUlLNWJOYjl0bmdiZlFlSmZJUmF3RFViT2RMRVZJ?=
 =?utf-8?B?VUJiSmFlWlVrY3JrVlYyckVjU3dVOWcxS1hDS2h3UXp0Y200WWQ2WUQvOHp3?=
 =?utf-8?B?R2hDVUNrdFFDRjNhL1RYbGlVa0NUSDhubUx2VDV6cHkzNGV3Z1FiemJPb2Qz?=
 =?utf-8?B?cHBUVlVZZW9GYkJGaXAyczc1Q0xFdEZOSDRJNStabk1vUTkzcVhQcEhlaVg5?=
 =?utf-8?B?QkY2Y1BuaHh1UGFzWHl5UnNBbFBBMUVOTEZtaDBTU0wyV3BzMHNSbE5ueE9h?=
 =?utf-8?B?U3IzeXFSWnM4cjZUdlU1Rmk4QTJ0OXVhVElqVVZVZDgwdzFCdS8zSzY4YTJ1?=
 =?utf-8?B?OFV4MEQxTUdFdGlCRFRORG9LZzlkOXVoanlFVWs3SThGdkJHbEo3M3FpbFI2?=
 =?utf-8?B?Nkh0bTBXUWZnL0JzaWUxQm9wY0l4TmU0QU1ERy92VmFiT0xpbklFUGJScEZj?=
 =?utf-8?B?VVVLVWJzdWQ0aWpCdy9ydFJyVEpna21nWGdOdENuQmdZSjZodnQ2M3YxOEx5?=
 =?utf-8?B?di9qYlBPSlpkdXBhbzRSaTFHTlljODBnYitpNE5xZ2k5TkJyWS9kRUVQZENv?=
 =?utf-8?B?N2oyTjVnRG4veVdCTGJRa3N4MG9BVkdYcUw3VjJnVENzdkI5OHJWNm9palNF?=
 =?utf-8?B?Ukw1SDFqOEY3NUVXd2NnQmUvNGxQcUtzZURLK3RNaG9GalFPNkp1YnRUMURn?=
 =?utf-8?B?K3lYcVV2d0FkMW9SWHk4eVJXd2tVa2oxTkpQei82L3FsVTBOenJTa0tYb2g3?=
 =?utf-8?B?TGlPRzJGU0JIeXU1UUJiY1BaOHlUZ0IzUnQ0cjAwc3B3amxGTUg2TldZcXFZ?=
 =?utf-8?B?QnpmRmlFUjhPZGRmSzZHY0Z6TUtFOUxtQk13cjdwRmNpdjNZOWc0eW9PQXow?=
 =?utf-8?B?U2hRbFF0dlNqOHdLNnBSSk1wREp5K0txelY3eVJZeHZGcDR0eXA2RXp1SGxq?=
 =?utf-8?Q?IYAGCdpE6GCTx5CPTw6Zn6lCiiC1a8=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR12MB8451.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?VmNmS3ovRmJ4ZTRDRm9tVU9wMCtxaU8zUUo2cWpKbEpkNnYwY3B5VGR4NVE0?=
 =?utf-8?B?UE15NmV1M1hDMFNkUFVmbU9kS09wR0xCMkJFUWZnT055K0hCSjRwdExEUnM3?=
 =?utf-8?B?UlRhdWRENnJNcHhudUF3NDUyT1BWVW5DSHk3YnZOa3VHMThJdUNLT1dVOXNT?=
 =?utf-8?B?bGpaTEF1TFJxWnB4b0JaQnFUcDRVeTNFNjdtTXNDd0hiODhRdndSV2JSVnhH?=
 =?utf-8?B?bkhJVHdEbDlWalZuY3dPWWg2bGpFNHkzM1dvTThITm5Ua2ZmMVk2Z0twVEha?=
 =?utf-8?B?UTBLVFhLRWIvZEZkajRQZFB1VDhvc0drMk5JYXhScVNtY2pDNXQrenRwOFBN?=
 =?utf-8?B?bnpCN2lGdlpucTdMQ1lmOXNvY013NlFFSjhiR0E1ZnhYMEFZMlkzNjY4b2Z4?=
 =?utf-8?B?MndUNjkyMmsxSWNJdlNYWSt3c09rMitSMGRYSitBNVAvRnBCYzJoaU1pWXFI?=
 =?utf-8?B?NENEWWdsVGg3d2JtTWJYQkRRODFDYk9TU2xtVytPZE5KdjFaN2hQSU1CaExp?=
 =?utf-8?B?eUw5eWp6L2pXZ3o0RzFHVXFFZUxTOG5kYlhEUVU4T0Nib0JZMm1OUnVqc0lw?=
 =?utf-8?B?SUYxd3ZNYllVS1BOMUZYRUx2aE5vVjBubzFIUVRpSzJDUENHU3hQaEFxVllt?=
 =?utf-8?B?RlU1Q29hbm1pSkZCVnN4WHV2Y29vSDJKVG5NcjNTN1pPci95czdUdUxMeUht?=
 =?utf-8?B?TU5aSVo5OExXZXV3MzcwcmJyUjhsYlRjZ0NvSWQ0aGo1c0M0c2gvYmtMcndO?=
 =?utf-8?B?TXhSWHlMMWtCQTQzRDFlNk5Zam83V1kyb1BqU2lHVGhxaVA1djduREZwQncv?=
 =?utf-8?B?aGp0R3NGYVViOVNadVVjS1FJa29GUk9kQ3h6WHVDOG81U2JzaG9md21VZjNh?=
 =?utf-8?B?Z01QQkpiUEZYa1MzZDVYUVpqSTNoNHlBamJjRDZLSzNtOFQ3aEhsK2JGcUQy?=
 =?utf-8?B?d3Y1MHRPdHNPbUhFR0h3YkIwRVcrOGlTRU1sa2M3NWxwVjBHYkxoeDg0N2py?=
 =?utf-8?B?eDVITUxRYlEzYzEvM004YWlyWGhBL0EyaDBSdDF2RU1qNEU1aGhWVnBOUEZG?=
 =?utf-8?B?NU1NR05TWnlHWTNtVmVXdXJQQlZNVGEyQVd6ZnlzSnhsTURYNElxZGhManVy?=
 =?utf-8?B?NG9oSXllb3NyMVJBSE5mN2FucjVLWHlLZlFJTHYrRGM2OXA0b0kyb2VwUStJ?=
 =?utf-8?B?MkEzai9RRGQ2YXpNUktIWWgvSjM2OC9wdE04SjluYnpPY3E4WHh1QXZSRWQ4?=
 =?utf-8?B?OFVtVVJMRmorY3B0K3plcHhDakF0TnpTTitMR3k3RXN3RWJiSStINlVRSjI1?=
 =?utf-8?B?WXo5ajlhVFFwNEVxWXNZa2R3aWlsM2ZXc1RRSnVBa2FxeStaQnpGaGFnSDRV?=
 =?utf-8?B?bVVrWitmNnNuYjROMjJabHZybzN6M01XdEhpaTY1N2J0akI2V2gzdG02SFBw?=
 =?utf-8?B?Y0dkUm91NFhpV3NNWFQrOEVsMmxmSGpJRFlHZSswb01CWmdkV0t4bk1vcFhY?=
 =?utf-8?B?K1VFZU9PZU9yL1cvVm42alU0aTFPaVJWdmsxWUNiSTF3aThBenJWL1dyeDVP?=
 =?utf-8?B?VGJvOURycWEzaDdOclk2TUs5ZVQzN0dJL1JCTFNXNnZNZU94anVMK1ViQWR1?=
 =?utf-8?B?SitDN0ZvalhoS1hqbzRlblRadzV2RzNDRGFibUpBVmlJMGpLZ1pMVXY3WFJZ?=
 =?utf-8?B?ZDdoc1R1TlVyMllBYzBpYktxVEQyVHNnWkpEMDQ2b1diOXQrMkhKTFN5Sys4?=
 =?utf-8?B?cUloT3VzOXV2M3hzRk5sRzJmWUxQSkxFSGtrQUo4UzFUU01VNDNDU1c2Z3VP?=
 =?utf-8?B?WkNBQWNoOUZzd2xlSjlvTFEyZ0EvaG1NMDJXbG5vanpWanoxckQxNVBxcFVy?=
 =?utf-8?B?Z25sQSs1ZFN0elUzVDdEOGF2aTIzN0VTQWlkS1llaGxKNFBsVTU5UkYzU2F4?=
 =?utf-8?B?NWZCSHR2ZUgvUzNET2kxS3hSMTNqZ3d4RW4za3ZpdjFhK2J0dVNXNW9CNk5E?=
 =?utf-8?B?My9Ebk8wRWVZamgwcFRFYW1Od0hFK003dGFudnFXSHhVVGZXQjZQNU5jNTJv?=
 =?utf-8?B?eW9XcFpIWWFES3EzemhoZTZFMjZNT2J5eDJJQ1RSaGIyVjB0TGYzQkpYZHNK?=
 =?utf-8?Q?F4VU=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB8451.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9542a5b7-3408-458b-b2a2-08dd8ec3e321
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 May 2025 06:36:53.6272
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: absYz3HT1JJUUV8U4pZ7erfhFI7ThKBhnKZfqtvCX79iE1M45Wgsep6hyH7GqB8PkAIFQbatI8dEuOo1sBvyzw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4184

W1B1YmxpY10NCg0KSGksDQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTog
SmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPg0KPiBTZW50OiBXZWRuZXNkYXksIEFwcmls
IDMwLCAyMDI1IDk6NTUgUE0NCj4gVG86IFBlbm55LCBaaGVuZyA8cGVubnkuemhlbmdAYW1kLmNv
bT4NCj4gQ2M6IEh1YW5nLCBSYXkgPFJheS5IdWFuZ0BhbWQuY29tPjsgQW50aG9ueSBQRVJBUkQN
Cj4gPGFudGhvbnkucGVyYXJkQHZhdGVzLnRlY2g+OyB4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVj
dC5vcmcNCj4gU3ViamVjdDogUmU6IFtQQVRDSCB2NCAxMi8xNV0gdG9vbHMveGVucG06IFByaW50
IENQUEMgcGFyYW1ldGVycyBmb3IgYW1kLWNwcGMNCj4gZHJpdmVyDQo+DQo+IE9uIDE0LjA0LjIw
MjUgMDk6NDAsIFBlbm55IFpoZW5nIHdyb3RlOg0KPiA+IEhXUCwgYW1kLWNwcGMsIGFtZC1jcHBj
LWVwcCBhcmUgYWxsIHRoZSBpbXBsZW1lbnRhdGlvbiBvZiBBQ1BJIENQUEMNCj4gPiAoQ29sbGFi
b3JhdGl2ZSBQcm9jZXNzb3IgUGVyZm9ybWFjZSBDb250cm9sKSwgc28gd2UgaW50cm9kdWNlDQo+
ID4gY3BwY19tb2RlIGZsYWcgdG8gcHJpbnQgQ1BQQy1yZWxhdGVkIHBhcmEuDQo+ID4NCj4gPiBB
bmQgSFdQIGFuZCBhbWQtY3BwYy1lcHAgYXJlIGJvdGggZ292ZXJub3ItbGVzcyBkcml2ZXIsIHNv
IHdlDQo+ID4gaW50cm9kdWNlIGh3X2F1dG8gZmxhZyB0byBieXBhc3MgZ292ZXJub3ItcmVsYXRl
ZCBwcmludC4NCj4NCj4gQnV0IGluIHRoZSBFUFAgZHJpdmVyIHlvdSB1c2UgdGhlIGluZm9ybWF0
aW9uIHdoaWNoIGdvdmVybm9yIGlzIGFjdGl2ZS4NCj4NCg0KV2Ugd2FudCB0byBoYXZlIGEgb25l
LW9uZSBtYXBwaW5nIGJldHdlZW4gZ292ZXJub3IgYW5kIGVwcCB2YWx1ZSwgc3VjaCBhcywNCklm
IHVzZXJzIGNob29zZSBwZXJmb3JtYW5jZSBnb3Zlcm5vciwgbm8gbWF0dGVyIHZpYSAieGVucG0i
IG9yIGNtZGxpbmUsIHVzZXJzIHdhbnQgbWF4aW11bSBwZXJmb3JtYW5jZSwNCldlIHNldCBlcHAg
d2l0aCAwIHRvIG1lZXQgdGhlIGV4cGVjdGF0aW9uLg0KQW5kIGlmIHVzZXJzIGNob29zZSBwb3dl
cnNhdmUgZ292ZXJub3IsIHVzZXJzIHdhbnQgdGhlIGxlYXN0IHBvd2VyIGNvbnN1bXB0aW9uLCB0
aGVuIHdlIHNoYWxsIHNldA0KZXBwIHdpdGggMjU1IHRvIG1lZXQgdGhlIGV4cGVjdGF0aW9uLg0K
T25kZW1hbmQgaXMgYSB0cmlja3kgcGFydCwgaG1tbW0sIEkgZG9uJ3Qga25vdyB3aGljaCB2YWx1
ZSBpcyBzdWl0YWJsZSBmb3IgaXQsIHRoZSBtZWRpdW0gb25lPyBTbyBJIG5lZ2xlY3QgaXQgaW4g
dGhlIGZpcnN0IHBsYWNlDQpJJ2xsIGFkZCBhYm92ZSBleHBsYW5hdGlvbiBpbiBjb21taXQgd2hp
Y2ggaW50cm9kdWNlcyBDUFVGUkVRX1BPTElDWV9QT1dFUlNBVkUvUEVSRk9STUFOQ0UNCg0KPiA+
IC0tLSBhL3Rvb2xzL21pc2MveGVucG0uYw0KPiA+ICsrKyBiL3Rvb2xzL21pc2MveGVucG0uYw0K
PiA+IEBAIC03OTAsOSArNzkwLDE4IEBAIHN0YXRpYyB1bnNpZ25lZCBpbnQNCj4gPiBjYWxjdWxh
dGVfYWN0aXZpdHlfd2luZG93KGNvbnN0IHhjX2NwcGNfcGFyYV90ICpjcHBjLA0KPiA+ICAvKiBw
cmludCBvdXQgcGFyYW1ldGVycyBhYm91dCBjcHUgZnJlcXVlbmN5ICovICBzdGF0aWMgdm9pZA0K
PiA+IHByaW50X2NwdWZyZXFfcGFyYShpbnQgY3B1aWQsIHN0cnVjdCB4Y19nZXRfY3B1ZnJlcV9w
YXJhICpwX2NwdWZyZXEpDQo+ID4gew0KPiA+IC0gICAgYm9vbCBod3AgPSBzdHJjbXAocF9jcHVm
cmVxLT5zY2FsaW5nX2RyaXZlciwgWEVOX0hXUF9EUklWRVJfTkFNRSkNCj4gPT0gMDsNCj4gPiAr
ICAgIGJvb2wgY3BwY19tb2RlID0gZmFsc2UsIGh3X2F1dG8gPSBmYWxzZTsNCj4gPiAgICAgIGlu
dCBpOw0KPiA+DQo+ID4gKyAgICBpZiAoICFzdHJjbXAocF9jcHVmcmVxLT5zY2FsaW5nX2RyaXZl
ciwgWEVOX0hXUF9EUklWRVJfTkFNRSkgfHwNCj4gPiArICAgICAgICAgIXN0cmNtcChwX2NwdWZy
ZXEtPnNjYWxpbmdfZHJpdmVyLCBYRU5fQU1EX0NQUENfRFJJVkVSX05BTUUpIHx8DQo+ID4gKyAg
ICAgICAgICFzdHJjbXAocF9jcHVmcmVxLT5zY2FsaW5nX2RyaXZlciwNCj4gWEVOX0FNRF9DUFBD
X0VQUF9EUklWRVJfTkFNRSkgKQ0KPiA+ICsgICAgICAgIGNwcGNfbW9kZSA9IHRydWU7DQo+ID4g
Kw0KPiA+ICsgICAgaWYgKCAhc3RyY21wKHBfY3B1ZnJlcS0+c2NhbGluZ19kcml2ZXIsIFhFTl9I
V1BfRFJJVkVSX05BTUUpIHx8DQo+ID4gKyAgICAgICAgICFzdHJjbXAocF9jcHVmcmVxLT5zY2Fs
aW5nX2RyaXZlciwNCj4gWEVOX0FNRF9DUFBDX0VQUF9EUklWRVJfTkFNRSkgKQ0KPiA+ICsgICAg
ICAgIGh3X2F1dG8gPSB0cnVlOw0KPg0KPiBQbGVhc2UgYXZvaWQgZG9pbmcgdGhlIHNhbWUgc3Ry
Y21wKClzIHR3aWNlLiBUaGVyZSBhcmUgc2V2ZXJhbCB3YXlzIGhvdyB0bywgc28NCj4gSSdtIG5v
dCBnb2luZyB0byBtYWtlIGEgcGFydGljdWxhciBzdWdnZXN0aW9uLg0KPg0KDQpNYXliZSB3ZSBz
aGFsbCB1c2Ugc3dpdGNoLWNhc2UoKSB0byByZXBsYWNlIHRoZSBzYW1lIHN0cmNtcCgpcw0KU2lu
Y2UgaXQncyBub3QgZWFzeSB0byBzd2l0Y2gtY2FzZSgpIHN0cmluZyB2YWx1ZSwgSSBoYWQgYSBk
cmFmdCBpZGVhIHRvIGluY2x1ZGUgYW4gbmV3IGVudHJ5IGluICJzdHJ1Y3QgeGVuX2NwcGNfcGFy
YSIsDQpTZWU6DQpgYGANCmRpZmYgLS1naXQgYS94ZW4vaW5jbHVkZS9wdWJsaWMvc3lzY3RsLmgg
Yi94ZW4vaW5jbHVkZS9wdWJsaWMvc3lzY3RsLmgNCmluZGV4IGZhNDMxZmQ5ODMuLmI4NzJmMWI2
NmEgMTAwNjQ0DQotLS0gYS94ZW4vaW5jbHVkZS9wdWJsaWMvc3lzY3RsLmgNCisrKyBiL3hlbi9p
bmNsdWRlL3B1YmxpYy9zeXNjdGwuaA0KQEAgLTMwOCw2ICszMDgsMTAgQEAgc3RydWN0IHhlbl9v
bmRlbWFuZCB7DQoNCiBzdHJ1Y3QgeGVuX2NwcGNfcGFyYSB7DQogICAgIC8qIE9VVCAqLw0KKyNk
ZWZpbmUgWEVOX1NZU0NUTF9DUFBDX1ZFTkRPUl9IV1AgICAgICAxDQorI2RlZmluZSBYRU5fU1lT
Q1RMX0NQUENfVkVORE9SX0FNRCAgICAgIDINCisjZGVmaW5lIFhFTl9TWVNDVExfQ1BQQ19WRU5E
T1JfQU1EX0VQUCAgMw0KKyAgICB1aW50OF90IHZlbmRvcjsNCiAgICAgLyogYWN0aXZpdHlfd2lu
ZG93IHN1cHBvcnRlZCBpZiBzZXQgKi8NCiAjZGVmaW5lIFhFTl9TWVNDVExfQ1BQQ19GRUFUX0FD
VF9XSU5ET1cgICgxIDw8IDApDQogICAgIHVpbnQzMl90IGZlYXR1cmVzOyAvKiBiaXQgZmxhZ3Mg
Zm9yIGZlYXR1cmVzICovDQoNCmBgYA0KQSBuZXcgdmVuZG9yIGZpbGVkIGluIHN0cnVjdCB4ZW5f
Y3BwY19wYXJhIGNvdWxkIGhlbHAgdXMgZGlmZmVyIHRoZSB1bmRlcmx5aW5nIGltcGxlbWVudGF0
aW9uLg0KT3IgYW55IGJldHRlciBzdWdnZXN0aW9ucz8NCg0KPiA+IEBAIC04MDAsNyArODA5LDcg
QEAgc3RhdGljIHZvaWQgcHJpbnRfY3B1ZnJlcV9wYXJhKGludCBjcHVpZCwgc3RydWN0DQo+IHhj
X2dldF9jcHVmcmVxX3BhcmEgKnBfY3B1ZnJlcSkNCj4gPiAgICAgICAgICBwcmludGYoIiAlZCIs
IHBfY3B1ZnJlcS0+YWZmZWN0ZWRfY3B1c1tpXSk7DQo+ID4gICAgICBwcmludGYoIlxuIik7DQo+
ID4NCj4gPiAtICAgIGlmICggaHdwICkNCj4gPiArICAgIGlmICggaHdfYXV0byApDQo+ID4gICAg
ICAgICAgcHJpbnRmKCJjcHVpbmZvIGZyZXF1ZW5jeSAgICA6IGJhc2UgWyUiUFJJdTMyIl0gbWF4
IFslIlBSSXUzMiJdXG4iLA0KPiA+ICAgICAgICAgICAgICAgICBwX2NwdWZyZXEtPmNwdWluZm9f
bWluX2ZyZXEsDQo+ID4gICAgICAgICAgICAgICAgIHBfY3B1ZnJlcS0+Y3B1aW5mb19tYXhfZnJl
cSk7DQo+ID4gLS0tIGEveGVuL2RyaXZlcnMvYWNwaS9wbXN0YXQuYw0KPiA+ICsrKyBiL3hlbi9k
cml2ZXJzL2FjcGkvcG1zdGF0LmMNCj4gPiBAQCAtMjAxLDcgKzIwMSw3IEBAIHN0YXRpYyBpbnQg
Z2V0X2NwdWZyZXFfcGFyYShzdHJ1Y3QgeGVuX3N5c2N0bF9wbV9vcA0KPiAqb3ApDQo+ID4gICAg
ICBwbXB0ID0gcHJvY2Vzc29yX3BtaW5mb1tvcC0+Y3B1aWRdOw0KPiA+ICAgICAgcG9saWN5ID0g
cGVyX2NwdShjcHVmcmVxX2NwdV9wb2xpY3ksIG9wLT5jcHVpZCk7DQo+ID4NCj4gPiAtICAgIGlm
ICggIXBtcHQgfHwgIXBtcHQtPnBlcmYuc3RhdGVzIHx8DQo+ID4gKyAgICBpZiAoICFwbXB0IHx8
ICgocG1wdC0+aW5pdCAmIFhFTl9QWF9JTklUKSAmJiAhcG1wdC0+cGVyZi5zdGF0ZXMpDQo+ID4g
KyB8fA0KPiA+ICAgICAgICAgICAhcG9saWN5IHx8ICFwb2xpY3ktPmdvdmVybm9yICkNCj4gPiAg
ICAgICAgICByZXR1cm4gLUVJTlZBTDsNCj4NCj4gVGhpcyBsb29rcyBxdWVzdGlvbmFibGUgYWxs
IG9uIGl0cyBvd24uIFdoZXJlIGlzIGl0IHRoYXQgLT5wZXJmLnN0YXRlcyBhbGxvY2F0aW9uIGlz
DQo+IGJlaW5nIGF2b2lkZWQ/IEkgZmlyc3QgdGhvdWdodCBpdCBtaWdodCBiZSBwYXRjaCAwNiB3
aGljaCBpcyByZWxhdGVkLCBidXQgdGhhdCBkb2Vzbid0DQo+IGxvb2sgdG8gYmUgaXQuIEluIGFu
eSBldmVudCBmdXJ0aGVyIGRvd24gZnJvbSBoZXJlIHRoZXJlIGlzDQo+DQoNCi0+cGVyZi5zdGF0
ZXMgaXMgYWxsb2NhdGVkIGluIHNldF9weF9wbWluZm8oKQ0KSXQgaXMgYSBweC1zcGVjaWZpYyBm
dW5jdGlvbi4NCg0KPiAgICAgZm9yICggaSA9IDA7IGkgPCBvcC0+dS5nZXRfcGFyYS5mcmVxX251
bTsgaSsrICkNCj4gICAgICAgICBkYXRhW2ldID0gcG1wdC0+cGVyZi5zdGF0ZXNbaV0uY29yZV9m
cmVxdWVuY3kgKiAxMDAwOw0KPg0KPiBpLmUuIGFuIGFjY2VzcyB0byB0aGUgYXJyYXkgc29sZWx5
IGJhc2VkIG9uIGh5cGVyY2FsbCBpbnB1dC4NCj4NCg0KSSdsbCBndWFyZCBpdCB3aXRoIHBtcHQt
PmluaXQgJiBYRU5fUFhfSU5JVCB0b28NCg0KPiBCb3RoIHRoaXMgYW5kIC4uLg0KPg0KPiA+IEBA
IC00NjEsOSArNDYxLDEwIEBAIGludCBkb19wbV9vcChzdHJ1Y3QgeGVuX3N5c2N0bF9wbV9vcCAq
b3ApDQo+ID4gICAgICBzd2l0Y2ggKCBvcC0+Y21kICYgUE1fUEFSQV9DQVRFR09SWV9NQVNLICkN
Cj4gPiAgICAgIHsNCj4gPiAgICAgIGNhc2UgQ1BVRlJFUV9QQVJBOg0KPiA+IC0gICAgICAgIGlm
ICggISh4ZW5fcHJvY2Vzc29yX3BtYml0cyAmIFhFTl9QUk9DRVNTT1JfUE1fUFgpICkNCj4gPiAr
ICAgICAgICBpZiAoICEoeGVuX3Byb2Nlc3Nvcl9wbWJpdHMgJiAoWEVOX1BST0NFU1NPUl9QTV9Q
WCB8DQo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIFhFTl9QUk9D
RVNTT1JfUE1fQ1BQQykpICkNCj4gPiAgICAgICAgICAgICAgcmV0dXJuIC1FTk9ERVY7DQo+ID4g
LSAgICAgICAgaWYgKCAhcG1wdCB8fCAhKHBtcHQtPmluaXQgJiBYRU5fUFhfSU5JVCkgKQ0KPiA+
ICsgICAgICAgIGlmICggIXBtcHQgfHwgIShwbXB0LT5pbml0ICYgKFhFTl9QWF9JTklUIHwgWEVO
X0NQUENfSU5JVCkpICkNCj4gPiAgICAgICAgICAgICAgcmV0dXJuIC1FSU5WQUw7DQo+ID4gICAg
ICAgICAgYnJlYWs7DQo+ID4gICAgICB9DQo+DQo+IC4uLiB0aGlzIGh1bmsgYWxzbyBsb29rIGFz
IGlmIHRoZXkgd291bGQgYmVsb25nIChwYXJ0bHk/KSBpbiBtYXliZSBwYXRjaCAwMz8NCj4gRXZl
biBtb3JlIHNvIGFzIHBlciB0aGUgdGl0bGUgdGhpcyBpcyBzb2xlbHkgYSB0b29sIHN0YWNrICh4
ZW5wbSkgY2hhbmdlLg0KPg0KDQpUcnVlLCBJIHNoYWxsIG1vdmUgdGhlbSB0byAwMywgdG8gbGV0
IHRoaXMgY29tbWl0IGJlaW5nIHNvbGVseSBhIHRvb2wgc3RhY2sgKHhlbnBtKSBjaGFuZ2UNCj4g
SmFuDQo=

