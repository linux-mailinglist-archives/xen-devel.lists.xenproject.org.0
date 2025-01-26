Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DE217A1C673
	for <lists+xen-devel@lfdr.de>; Sun, 26 Jan 2025 07:31:43 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.877166.1287333 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tbwB9-000365-BA; Sun, 26 Jan 2025 06:31:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 877166.1287333; Sun, 26 Jan 2025 06:31:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tbwB9-00033M-7z; Sun, 26 Jan 2025 06:31:31 +0000
Received: by outflank-mailman (input) for mailman id 877166;
 Sun, 26 Jan 2025 06:31:30 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=L+Qa=US=amd.com=penny.zheng@srs-se1.protection.inumbo.net>)
 id 1tbwB7-00033G-TS
 for xen-devel@lists.xenproject.org; Sun, 26 Jan 2025 06:31:30 +0000
Received: from NAM02-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam02on20628.outbound.protection.outlook.com
 [2a01:111:f403:2405::628])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2c49edea-dbaf-11ef-a0e6-8be0dac302b0;
 Sun, 26 Jan 2025 07:31:28 +0100 (CET)
Received: from DM4PR12MB8451.namprd12.prod.outlook.com (2603:10b6:8:182::7) by
 PH7PR12MB9175.namprd12.prod.outlook.com (2603:10b6:510:2e6::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8377.21; Sun, 26 Jan
 2025 06:31:23 +0000
Received: from DM4PR12MB8451.namprd12.prod.outlook.com
 ([fe80::b04e:2da5:7189:4c4d]) by DM4PR12MB8451.namprd12.prod.outlook.com
 ([fe80::b04e:2da5:7189:4c4d%3]) with mapi id 15.20.8377.009; Sun, 26 Jan 2025
 06:31:22 +0000
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
X-Inumbo-ID: 2c49edea-dbaf-11ef-a0e6-8be0dac302b0
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PcyxGe7qE89Lw1fwpUB5RFSdzrW1CKnUuyvi/PeSlFyvLkSylx/CWrJARF4cs78hpdUQyLJbidxEM4b7JvIYix0PYwAo6tUMIycGbKClxUWEQTteai0nZ6c2B8HHrwuSmVmMhLypWRGaYGSwoQQu1PV1/1OoyoZ19nCBBMDJfNHmuHh1fJPHkoAtdCpn4WOH+4398c7RntPddhDLr1ohS94C9I2Oq+jPMl+tkZGpl8IhYh8aw/9n1K/tCAaYdVm3r2D9+WeKCZ6jk8RxH0j7ypKLqBrdsUtNy+qVxDvtLg4nG+9rHWQ7VEIxAKCjRQFKeUO2P4emBNfNe9cfkx+NjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=V95NOD/e1Nfta/zORbzw8yrPcqp45Uf6O2pBW0TPYEs=;
 b=Y/Ddvh1xwF798SLeFILNq8QkaJSkhvXKjrw0/qG9VPbc6K6XPQ9jnpNsNXEj4ClBp2rcYhZArPGqSzY82FFNxv1h8lt80Q7yINSYDyaOV+DmmTm9VOzV/O1hfHvLteF2kLXTeapMuJCEv0laGnMGjs+GAJLT+HvnmRCBlTHj9tRZZjQpOWCfks7jZXiz1dvIpQW90E8qyhQGNIn9vWGBSU+a3R4foYWmffb7azBY2Ah93lnhBxqbbi7yf0XDkYafWc5gofo7aANBqMrASYBLBW3A9+ksbU0eeY7z7Z9VZZICLQzQdyAjC6ZzfavRwrrTmLo52FvlJ5d+Q2RGg4E8Ew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=V95NOD/e1Nfta/zORbzw8yrPcqp45Uf6O2pBW0TPYEs=;
 b=gvfphmcAHv9G1Xt+iljlT7r/c8G4vSEXTmG1eaSPgOWBNYD175I6LPWkyYH7y/fhES4BuB0c5zaqmsolWRvqruplTbnEf/l+TlR2dhFR7AdeH5M6NB/O7VPkxy+glFWn72VgOs63DPmdHQipYLI9G5E5whxBdWVt+RjuJZN+Zi0=
From: "Penny, Zheng" <penny.zheng@amd.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "Stabellini, Stefano" <stefano.stabellini@amd.com>, "Huang, Ray"
	<Ray.Huang@amd.com>, "Ragiadakou, Xenia" <Xenia.Ragiadakou@amd.com>,
	"Andryuk, Jason" <Jason.Andryuk@amd.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>, Stefano
 Stabellini <sstabellini@kernel.org>, =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?=
	<roger.pau@citrix.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
Subject: RE: [PATCH v1 08/11] x86/cpufreq: add "cpufreq=amd-pstate,active"
 para
Thread-Topic: [PATCH v1 08/11] x86/cpufreq: add "cpufreq=amd-pstate,active"
 para
Thread-Index: AQHbRVygzo/tK+M4KUarRbqVB0cwPLMOhysAgBpiznA=
Date: Sun, 26 Jan 2025 06:31:22 +0000
Message-ID:
 <DM4PR12MB8451F12422667E90EFD54113E1ED2@DM4PR12MB8451.namprd12.prod.outlook.com>
References: <20241203081111.463400-1-Penny.Zheng@amd.com>
 <20241203081111.463400-9-Penny.Zheng@amd.com>
 <541ed82a-6cf3-4964-9421-23905b777f9c@suse.com>
In-Reply-To: <541ed82a-6cf3-4964-9421-23905b777f9c@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_ActionId=12b1e095-db75-495f-88c8-b42dfce5c969;MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_ContentBits=0;MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Enabled=true;MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Method=Standard;MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Name=AMD
 Internal Distribution
 Only;MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_SetDate=2025-01-26T06:20:09Z;MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR12MB8451:EE_|PH7PR12MB9175:EE_
x-ms-office365-filtering-correlation-id: 735e272f-e7f2-412c-ebb6-08dd3dd30d65
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|376014|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?MEJET2ZNamY3R05wN0JhRlFMYjdoM1ZjWG96R3FFOGhnUnJpTlhJSnRaMzly?=
 =?utf-8?B?WFpqaHVDNTRlL21xb2FyeTQ4VjB1RFpicjk5SmZQd2lsR05tTzhCZTRaSUw4?=
 =?utf-8?B?eENvcXU5Z0ZGZ1pMWEZUWWd2VnZ3SE8rNjVsVGtlUjBTR2hQT0sxbW9yVHhI?=
 =?utf-8?B?OWxEU3Vvc0F1amxiOWs2OHpUM1cvNWxJdzZrV0pBbzRGRVN3aHA4a1pXdG1F?=
 =?utf-8?B?bFUwVGFNRStPUDhiZ3hLRDdUS0tqdU1sV3N5SUdGTzBqY2JrdTdXaW1DcmRY?=
 =?utf-8?B?dFBqeDZ5ZGpJdXJka1Q4Ym5HNitIRHVJa3EyRHRxVm9PWTk2M25udmFIQXFx?=
 =?utf-8?B?dGJJZDRYWGozVUptSEt3RFM0bC9JMS9URTV0RjA0V0YvYkFIaHBPcWo1RnZ5?=
 =?utf-8?B?dkJIaWd1OXhFRTdrTzZxaVJtWXF6VG94djhCK25qbnpCVHFmWGJ5S3BicnBO?=
 =?utf-8?B?dkZnc2p5di9ZMXFneENZZS96OVBEaWo0WU5qTzd3ZHFxREVmbGdPOVNWVTRQ?=
 =?utf-8?B?RU8yNnZsUTVUYnJPYVVBcXpDQU1aU1U2aFZOQld1U1ZqWFU4UExxR2ZNWkNo?=
 =?utf-8?B?bDQweW52UjJEcUhWU3puM1ZXbnJ2eWVWcWo3N0YxSVFVWU9hTUFGVzJYRURK?=
 =?utf-8?B?eFhVKzNTeVd0Vm1ISG5PQkUxR1o4MDhTemhaMFBGd3kyaEkwckI1WEFGWEFq?=
 =?utf-8?B?dHNSMkVxZXBnYm5QK1dUekNjR0g3YjJiU1UrQWthdHdiZS9tWHVlR2trSjUy?=
 =?utf-8?B?Mk8rQTFQZ0VvSmo5WnF0UGMrZjEwTEs5bWgwbmZRc29XWUdFTGZBQW4vZWFR?=
 =?utf-8?B?VkhaRXhFN3ZmUlBkTDVYRXNpOERTUm4rV2dyY0ZyN1gwR1BuZWl4KzZYZkVs?=
 =?utf-8?B?TzUrTGFNVFljTlQxMnFTUVp3bVVNZW56N1lHaGtTZ2MvQi9rZkI3cksvZWxt?=
 =?utf-8?B?TG4rQ1VMc2kvalk1NzIxV0h1VnVCcCtEVGVtcFVtN0FvVTk0SFJPeVRVditt?=
 =?utf-8?B?di9OZmM1Qi9VSWd6MHBmUkUvdkVVa0g1K1RDT0l4WHBaYUlzRFcvZmdRemZm?=
 =?utf-8?B?WTZSbXJIU1pKakduQVo1cVg3eDdCYWowSEgrWDRoMTI5a1ZBdjBRSE9mbWNk?=
 =?utf-8?B?OEFqckttTnczZ0NVZU5wNzJUalp2a0FNTFpnQm9zdng1NFU0S1dlMEx1N1ZM?=
 =?utf-8?B?Vm1aZDNITmRWWHB5WGlKK2JMbHNWdDNvSGNHZmZxSGtqZ3lKTHJvQVpTdXM4?=
 =?utf-8?B?ekxnYzVLQUNuT0NSMVhvUDNpWnY2WDNrUjF6N3hUNHNqdHpxbWkycElJdGRX?=
 =?utf-8?B?RHh5VWpXVzQ5d3plRVhYR09uWWlWOC9wQkFTdjNzdnp1SXFjcnJwakxMbUhp?=
 =?utf-8?B?S05sVnNrKy9DTGFOSDR1V2dZUERzVTBLNTdwNGVVNkNUcWJWUjNIZmFKemFV?=
 =?utf-8?B?SnBhaCtINE5tbldJTlNRUGpobEo2R0poVkRIU084Y0NJOHE4SnBkRTZtdlpQ?=
 =?utf-8?B?R29XSEVWVWFIMmJJMG1zZmJhZzZGYjJUNzRHUHVscUM4cjhtWVFEVVJXVUFQ?=
 =?utf-8?B?ZXJvR25odHRISk1rUkR0MTE5WENEY2U0SzBwUVI0eGdGbTV4MnNKNUxzbGZK?=
 =?utf-8?B?K0hOMDkvUkUxRnN0dkVWc3Y1REZMd0FGNlNPcnppRzhNSDF5WUI1T0VvRUdu?=
 =?utf-8?B?N0NveEpMQjUrTDZTVUlMWkFYMksvZE5Fd3dadFRhQ1p0OHFkVnJCTkpWYVpP?=
 =?utf-8?B?enNFV1kyamhzN0Q4RFNNQlZsNCtvQ2tPVzM3d0pRUlV6OUxFOWh3L2xWeGcr?=
 =?utf-8?B?ZjNaaENsZmhIWmhUUm5LMWl2M042Qnk3ZzV5VmxpbG1ETEZqTW96Yk0zZVVR?=
 =?utf-8?B?YkV5Yi8rbitMM0dyR1hKY2xweFh2QTBXRnl6cVowMkEyQnE0K3E0clV1NmdS?=
 =?utf-8?Q?FZYczzIzeftNyhrxGAYXOjB/OwcibO3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR12MB8451.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?Tk1QWk9WZlNhT3lmM0c1M0ZRTloxRkhYeXdKT2lFay93eXdmRWtYSGpOR0li?=
 =?utf-8?B?UVBhZTdvbGt0eWRDYS8ydWVMMkZUVlRSb3VyQjJ5d0VJTFZYUDhUV3FheVRK?=
 =?utf-8?B?a0NQTHdPME50ZmJaRlk2cHFFOWV4N3Z2VS8xNy91a0llZEN3d0FVRHcvYXlE?=
 =?utf-8?B?aGwzdjNvR0hkVTAya1Y4T0p0aUxqVDNoOXd3cHhWa09rNE05bTZqMjZERU5l?=
 =?utf-8?B?SGJsZys5cXhEMklvRWtFcXJlUkxHaW90R2VlMUg4TzJ1SXdRY2llcFIwNE5V?=
 =?utf-8?B?U0ZVb3M1d0l2TTRiaWFqbmQyMHhzejJyU2V4ZFY1NjRydTFlM2doYU1YOGZK?=
 =?utf-8?B?alEzWHpaZHJMSWZqb1BZVlcvL20wOUVObXczNkRla0tKa0ZhUndaOXVtamIx?=
 =?utf-8?B?MWlXMlZuWUw0N05jWU95UlZwTUJMSmVxTFFpcnM0Y3grQ245MkhNdytpd0Zr?=
 =?utf-8?B?a0dJS2VLVGpybFAzY21DVmVFMytsZWhEZFQ0VjFHNkZ4VVcwZG9SZzFqVmwy?=
 =?utf-8?B?dzF3bzdZMW0xcXl1bTZQWHNxcUZ3bEp5QWJSQTl3N3RvRHhNTU9Ka1BIdnRk?=
 =?utf-8?B?Yml4dGhYSEh2dWRNN2txRDkrYUZIeVhuNFVvYSs3V3g4Sm9icVlOMTR3Q0NS?=
 =?utf-8?B?N3AwNUlSK3ZHR3hoamJ4d0ticE44cWp2YW0yK0VxUTA3U3pveURLWkdzSWt1?=
 =?utf-8?B?d3NaS0hIbnRUU2pLWTVuT3BsK2FBVDhOUWkzL1FmZ2RCeEtsbFlDRkMyYWZm?=
 =?utf-8?B?SUIvLzluNXQ0b0Q3QTNQOVZiSlNCT29RWURDeWtSOHlxb2RsRFdEUGYxYjRh?=
 =?utf-8?B?VVl5bjhxTzV4aG1lSWJzQzRZVDRqZEZrMTd0U1BWUUdOM1JBa2ZaaktmK1NH?=
 =?utf-8?B?RXVhcE0rYytzbVNHNzdyTTdxbjNxelpYRytoWFkwT0FESmk4dUx1QWp1OUJL?=
 =?utf-8?B?ano0ZmxqQTk5OE1JNVdwSmJtQldWSndHelJ1cWNEV3lVTkU5dlkrYUUvK0Mv?=
 =?utf-8?B?OFIvNEYzbFlseEVNalNMdEphVmtEZXNZZCsxYVR0RlhPTDFISkFSVkxpRG1C?=
 =?utf-8?B?QUtBbFZ0S1FxK0RPM0hDTGVvOXhkK0dSWWJnck1pbkRmQ2JJSnp4SWxSckxo?=
 =?utf-8?B?MVR6dzlES0JFYkV0bjFDOFlqN3EwMWlhZCtzZzdSdXRXNEhvWlJCS2RKc3kr?=
 =?utf-8?B?RkhWOGd5WHVpM2dsUUJsL0ZPdGM0OG1JY0dnYndSbGc2dlNBckhoaUtuTHU4?=
 =?utf-8?B?T0dPc2xmOXMzNERMdDcvdGhnTXdNWnlsMFFKZEZoY1ZTRHlhWU5DZ0tlaWQz?=
 =?utf-8?B?bXZGK0F1SWQ4Y1M5SFVwOEwydkppSDJPTEU1N2d4SDhVYitjNWc5c1dWR3hL?=
 =?utf-8?B?TU1tUmdYYk9HaGJYeS8xclhWdXJUSTZDV09sQVJ5Qk1vNW53R0l3c1p2cUU2?=
 =?utf-8?B?cm1CS3NrMmNodjRLV1pnbUNIWHU2VzUrS09SWVRvNDdqL0ZGVElaU2EwT0pv?=
 =?utf-8?B?cXpTa3R5VzZaSHRseDN3SzBmbGJkMHpnMzJ1b1cxZmpZS2d3RlB5Y2FJWFNB?=
 =?utf-8?B?ZzdLQVd2aFdwcXZyTUlzUkN5UmZWUnBhc1dKUkZST0FvaUdQb0ZRc2c3b1du?=
 =?utf-8?B?cGtlT0l1cVJsbWE0YzdxejJuajFGUWIvMXdwLzdiM1c1QUhHQTJhU29McWpK?=
 =?utf-8?B?WS9aVmU5NGdyczY1RVQ2bDh6aXdKV1lwUk1wQ2JmWE9jTFh5WFY0ZXJtSTc2?=
 =?utf-8?B?SmdSMWpjZnAyV3BiMjN2SFlwYnBlT3VrNmM5VnhDWERZS054KzZYa2g3amhH?=
 =?utf-8?B?a3gyaWlqTzNnRDYzVzVFTnJKWU5rZmJXWTBMcmE0Z3pSVE51emR1bkJkM0RD?=
 =?utf-8?B?SzRibFA4Q0lXN2pQbUVZZlNxYjRKMFAxVTRjVzhyQ2xNRFBJZkwyTTZic2gr?=
 =?utf-8?B?QnNad20zc1BXT2tqT3RZR1FvdUhnUFhDelVDMFB1N0F1Y0hJenFCdWNENW9D?=
 =?utf-8?B?dnZ6K2Y3OXlRTGFNNEF1WlExTjVsZXA1TWtJbDhQZHMzZG1TeDRaNnFqb3U1?=
 =?utf-8?B?RUovdFF1WEZoZXYrRjU5WG1wc2FGcHEyRFc5eFZqazV0Y1Y4V3ZYWlBza054?=
 =?utf-8?Q?HVeU=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB8451.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 735e272f-e7f2-412c-ebb6-08dd3dd30d65
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Jan 2025 06:31:22.8153
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ZtRl0XoJhimsyEotzEM9pwRuidl8+Hl2XENmuIMF5/t5gI5y6RupTlPl9M9DnPqUkcMgZLnbmzcpBgMV3U0Rxg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB9175

W0FNRCBPZmZpY2lhbCBVc2UgT25seSAtIEFNRCBJbnRlcm5hbCBEaXN0cmlidXRpb24gT25seV0N
Cg0KSGksDQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogSmFuIEJldWxp
Y2ggPGpiZXVsaWNoQHN1c2UuY29tPg0KPiBTZW50OiBUaHVyc2RheSwgSmFudWFyeSA5LCAyMDI1
IDc6MjQgUE0NCj4gVG86IFBlbm55LCBaaGVuZyA8cGVubnkuemhlbmdAYW1kLmNvbT4NCj4gQ2M6
IFN0YWJlbGxpbmksIFN0ZWZhbm8gPHN0ZWZhbm8uc3RhYmVsbGluaUBhbWQuY29tPjsgSHVhbmcs
IFJheQ0KPiA8UmF5Lkh1YW5nQGFtZC5jb20+OyBSYWdpYWRha291LCBYZW5pYSA8WGVuaWEuUmFn
aWFkYWtvdUBhbWQuY29tPjsNCj4gQW5kcnl1aywgSmFzb24gPEphc29uLkFuZHJ5dWtAYW1kLmNv
bT47IEFuZHJldyBDb29wZXINCj4gPGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+OyBKdWxpZW4g
R3JhbGwgPGp1bGllbkB4ZW4ub3JnPjsgU3RlZmFubyBTdGFiZWxsaW5pDQo+IDxzc3RhYmVsbGlu
aUBrZXJuZWwub3JnPjsgUm9nZXIgUGF1IE1vbm7DqSA8cm9nZXIucGF1QGNpdHJpeC5jb20+OyB4
ZW4tDQo+IGRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnDQo+IFN1YmplY3Q6IFJlOiBbUEFUQ0gg
djEgMDgvMTFdIHg4Ni9jcHVmcmVxOiBhZGQgImNwdWZyZXE9YW1kLXBzdGF0ZSxhY3RpdmUiIHBh
cmENCj4NCj4gT24gMDMuMTIuMjAyNCAwOToxMSwgUGVubnkgWmhlbmcgd3JvdGU6DQo+ID4gRnJv
bTogUGVubnkgWmhlbmcgPHBlbm55LnpoZW5nQGFtZC5jb20+DQo+ID4NCj4gPiBUaGUgYW1kLXBz
dGF0ZSBkcml2ZXIgbWF5IHN1cHBvcnQgbXVsdGlwbGUgd29ya2luZyBtb2RlcywgcGFzc2l2ZSBh
bmQgYWN0aXZlLg0KPiA+DQo+ID4gSW50cm9kdWNlIGEgbmV3IHZhcmlhYmxlIHRvIGtlZXAgdHJh
Y2sgb2Ygd2hpY2ggbW9kZSBpcyBjdXJyZW50bHkgZW5hYmxlZC4NCj4gPiBUaGlzIHZhcmlhYmxl
IHdpbGwgYWxzbyBoZWxwIHRvIGNob29zZSB3aGljaCBjcHVmcmVxIGRyaXZlciB0byBiZSByZWdp
c3RlcmVkLg0KPiA+DQo+ID4gU2lnbmVkLW9mZi1ieTogUGVubnkgWmhlbmcgPFBlbm55LlpoZW5n
QGFtZC5jb20+DQo+ID4gLS0tDQo+ID4gIGRvY3MvbWlzYy94ZW4tY29tbWFuZC1saW5lLnBhbmRv
YyAgICAgIHwgIDkgKysrKysrKystDQo+ID4gIHhlbi9hcmNoL3g4Ni9hY3BpL2NwdWZyZXEvYW1k
LXBzdGF0ZS5jIHwgMTIgKysrKysrKysrKystDQo+ID4gIDIgZmlsZXMgY2hhbmdlZCwgMTkgaW5z
ZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkNCj4gPg0KPiA+IGRpZmYgLS1naXQgYS9kb2NzL21p
c2MveGVuLWNvbW1hbmQtbGluZS5wYW5kb2MNCj4gPiBiL2RvY3MvbWlzYy94ZW4tY29tbWFuZC1s
aW5lLnBhbmRvYw0KPiA+IGluZGV4IDMwZjg1NWZhMTguLmE5YTNlMGVmNzkgMTAwNjQ0DQo+ID4g
LS0tIGEvZG9jcy9taXNjL3hlbi1jb21tYW5kLWxpbmUucGFuZG9jDQo+ID4gKysrIGIvZG9jcy9t
aXNjL3hlbi1jb21tYW5kLWxpbmUucGFuZG9jDQo+ID4gQEAgLTQ5OSw3ICs0OTksOCBAQCBJZiBz
ZXQsIGZvcmNlIHVzZSBvZiB0aGUgcGVyZm9ybWFuY2UgY291bnRlcnMgZm9yDQo+ID4gb3Byb2Zp
bGUsIHJhdGhlciB0aGFuIGRldGVjdGluICBhdmFpbGFibGUgc3VwcG9ydC4NCj4gPg0KPiA+ICAj
IyMgY3B1ZnJlcQ0KPiA+IC0+IGA9IG5vbmUgfCB7eyA8Ym9vbGVhbj4gfCB4ZW4gfSB7DQo+ID4g
LT4gWzpbcG93ZXJzYXZlfHBlcmZvcm1hbmNlfG9uZGVtYW5kfHVzZXJzcGFjZV1bLFs8bWF4ZnJl
cT5dXVssWzxtaW5mcg0KPiA+IC0+IGVxPl1dXSB9IFssdmVyYm9zZV19IHwgZG9tMC1rZXJuZWwg
fCBod3BbOls8aGRjPl1bLHZlcmJvc2VdXSB8DQo+ID4gLT4gYW1kLXBzdGF0ZVs6W3ZlcmJvc2Vd
XWANCj4gPiArPiBgPSBub25lIHwge3sgPGJvb2xlYW4+IHwgeGVuIH0gew0KPiA+ICs+IFs6W3Bv
d2Vyc2F2ZXxwZXJmb3JtYW5jZXxvbmRlbWFuZHx1c2Vyc3BhY2VdWyxbPG1heGZyZXE+XV1bLFs8
bWluZnINCj4gPiArPiBlcT5dXV0gfQ0KPiA+ICtbLHZlcmJvc2VdfSB8IGRvbTAta2VybmVsIHwg
aHdwWzpbPGhkYz5dWyx2ZXJib3NlXV0gfA0KPiA+ICthbWQtcHN0YXRlWzpbYWN0aXZlXVssdmVy
Ym9zZV1dYA0KPiA+DQo+ID4gID4gRGVmYXVsdDogYHhlbmANCj4gPg0KPiA+IEBAIC01MjIsNiAr
NTIzLDEyIEBAIGNob2ljZSBvZiBgZG9tMC1rZXJuZWxgIGlzIGRlcHJlY2F0ZWQgYW5kIG5vdA0K
PiBzdXBwb3J0ZWQgYnkgYWxsIERvbTAga2VybmVscy4NCj4gPiAgICBvbiBzdXBwb3J0ZWQgQU1E
IGhhcmR3YXJlIHRvIHByb3ZpZGUgYSBmaW5lciBncmFpbmVkIGZyZXF1ZW5jeSBjb250cm9sDQo+
IG1lY2hhbmlzbS4NCj4gPiAgICBUaGUgZGVmYXVsdCBpcyBkaXNhYmxlZC4gSWYgYGFtZC1wc3Rh
dGVgIGlzIHNlbGVjdGVkLCBidXQgaGFyZHdhcmUgc3VwcG9ydA0KPiA+ICAgIGlzIG5vdCBhdmFp
bGFibGUsIFhlbiB3aWxsIGZhbGxiYWNrIHRvIGNwdWZyZXE9eGVuLg0KPiA+ICsqIGBhY3RpdmVg
IGlzIGEgYm9vbGVhbiB0byBlbmFibGUgYW1kLXBzdGF0ZSBkcml2ZXIgaW4gYWN0aXZlKGF1dG9u
b21vdXMpIG1vZGUuDQo+ID4gKyAgSW4gdGhpcyBtb2RlLCB1c2VycyBjb3VsZCBwcm92aWRlIGEg
aGludCB3aXRoIGVuZXJneSBwZXJmb3JtYW5jZQ0KPiA+ICtwcmVmZXJlbmNlDQo+ID4gKyAgcmVn
aXN0ZXIgdG8gdGhlIGhhcmR3YXJlIGlmIHRoZXkgd2FudCB0byBiaWFzIHRvd2FyZA0KPiA+ICtw
ZXJmb3JtYW5jZSgweDApIG9yDQo+ID4gKyAgZW5lcmd5IGVmZmljaWVuY3koMHhmZiksIHRoZW4g
Q1BQQyBwb3dlciBhbGdvcml0aG0gd2lsbCBjYWxjdWxhdGUNCj4gPiArdGhlIHJ1bnRpbWUNCj4g
PiArICB3b3JrbG9hZCBhbmQgYWRqdXN0IHRoZSByZWFsdGltZSBjb3JlcyBmcmVxdWVuY3kgYWNj
b3JkaW5nIHRvIHRoZQ0KPiA+ICtwb3dlciBzdXBwbHkNCj4gPiArICBhbmQgdGhlbWFsLCBjb3Jl
IHZvbHRhZ2UgYW5kIHNvbWUgb3RoZXIgaGFyZHdhcmUgY29uZGl0aW9ucy4NCj4NCj4gTml0OiB0
aGVybWFsDQo+DQo+ID4gLS0tIGEveGVuL2FyY2gveDg2L2FjcGkvY3B1ZnJlcS9hbWQtcHN0YXRl
LmMNCj4gPiArKysgYi94ZW4vYXJjaC94ODYvYWNwaS9jcHVmcmVxL2FtZC1wc3RhdGUuYw0KPiA+
IEBAIC0yNyw2ICsyNyw4IEBADQo+ID4gICNkZWZpbmUgYW1kX3BzdGF0ZV93YXJuKGZtdCwgYXJn
cy4uLikgXA0KPiA+ICAgICAgcHJpbnRrKFhFTkxPR19XQVJOSU5HICJBTURfUFNUQVRFOiBDUFUl
dSB3YXJuaW5nOiAiIGZtdCwgY3B1LCAjIw0KPiA+IGFyZ3MpDQo+ID4NCj4gPiArc3RhdGljIGJv
b2wgX19yb19hZnRlcl9pbml0IG9wdF9jcHVmcmVxX2FjdGl2ZSA9IGZhbHNlOw0KPg0KPiBQb2lu
dGxlc3MgaW5pdGlhbGl6ZXIuDQo+DQo+ID4gQEAgLTM5OCw1ICs0MDcsNiBAQCBpbnQgX19pbml0
IGFtZF9wc3RhdGVfcmVnaXN0ZXJfZHJpdmVyKHZvaWQpDQo+ID4gICAgICBpZiAoICFjcHVfaGFz
X2NwcGMgKQ0KPiA+ICAgICAgICAgIHJldHVybiAtRU5PREVWOw0KPiA+DQo+ID4gLSAgICByZXR1
cm4gY3B1ZnJlcV9yZWdpc3Rlcl9kcml2ZXIoJmFtZF9wc3RhdGVfY3B1ZnJlcV9kcml2ZXIpOw0K
PiA+ICsgICAgaWYgKCAhb3B0X2NwdWZyZXFfYWN0aXZlICkNCj4gPiArICAgICAgICByZXR1cm4g
Y3B1ZnJlcV9yZWdpc3Rlcl9kcml2ZXIoJmFtZF9wc3RhdGVfY3B1ZnJlcV9kcml2ZXIpOw0KPiA+
ICB9DQo+DQo+IEknbSBhZnJhaWQgdGhlIGRlc2NyaXB0aW9uIGlzIG9mIG5vIGhlbHAgaW4gZGV0
ZXJtaW5pbmcgd2h5IHRoaXMgaXMgYSBjb3JyZWN0IGNoYW5nZSB0bw0KPiBtYWtlIChoZXJlKS4g
SG93IHdvdWxkIHRoZSB1c2VyIHByb3ZpZGVkIGhpbnQgKHNlZSBjbWRsaW5lIG9wdGlvbiBkZXNj
cmlwdGlvbikgYmUNCj4gY29tbXVuaWNhdGVkIHRvIGhhcmR3YXJlIHdoZW4gdGhlIGRyaXZlciBp
c24ndCBldmVuIHJlZ2lzdGVyZWQ/DQo+DQoNCk1heWJlIEkgc2hhbGwgY29tYmluZSB0aGlzIGNv
bW1pdCBpbnRvIHRoZSBuZXh0IG9uZSBhYm91dCBpbXBsZW1lbnRpbmcgZXBwIGRyaXZlciBmb3Ig
YWN0aXZlIG1vZGUsDQphbmQgdGhlIGNoYW5nZXMgd2lsbCBiZSBsaWtlOg0KICAtICAgIHJldHVy
biBjcHVmcmVxX3JlZ2lzdGVyX2RyaXZlcigmYW1kX3BzdGF0ZV9jcHVmcmVxX2RyaXZlcik7DQog
KyAgICBpZiAoIG9wdF9jcHVmcmVxX2FjdGl2ZSApDQogKyAgICAgICAgcmV0dXJuIGNwdWZyZXFf
cmVnaXN0ZXJfZHJpdmVyKCYmYW1kX2NwcGNfZXBwX2RyaXZlcik7DQogKyAgICBlbHNlDQogKyAg
ICAgICAgcmV0dXJuIGNwdWZyZXFfcmVnaXN0ZXJfZHJpdmVyKCZhbWRfY3BwY19jcHVmcmVxX2Ry
aXZlcik7DQpOb3csIHRoZSBkZXNjcmlwdGlvbiBtYWtlcyBtb3JlIHNlbnNlLg0KDQo+IEZpbmFs
bHkgSSBkb24ndCB0aGluayB0aGUgY2hhbmdlIGFib3ZlIHdvdWxkIGJ1aWxkLCBhcyBpdCBsZWF2
ZXMgYSByZXR1cm4gZnJvbSB0aGUNCj4gZnVuY3Rpb24gd2l0aG91dCByZXR1cm4gdmFsdWUuDQo+
DQo+IEphbg0KDQpNYW55IHRoYW5rcw0KUGVubnkNCg==

