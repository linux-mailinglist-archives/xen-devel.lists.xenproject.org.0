Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Bo+UMvwANWqVlwYAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 19 Jun 2026 10:42:36 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 21D956A4AA6
	for <lists+xen-devel@lfdr.de>; Fri, 19 Jun 2026 10:42:36 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=valinux.co.jp header.s=selector1 header.b=ZeoVW6Zj;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=none) header.from=valinux.co.jp;
	arc=pass ("microsoft.com:s=arcselector10001:i=1")
Received: from list by lists.xenproject.org with outflank-mailman.1341922.1602218 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1waUnn-0003SD-MW; Fri, 19 Jun 2026 08:42:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1341922.1602218; Fri, 19 Jun 2026 08:42:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1waUnn-0003PO-Ik; Fri, 19 Jun 2026 08:42:15 +0000
Received: by outflank-mailman (input) for mailman id 1341922;
 Fri, 19 Jun 2026 08:42:13 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <taka@valinux.co.jp>) id 1waUnk-0003PI-M0
 for xen-devel@lists.xenproject.org; Fri, 19 Jun 2026 08:42:13 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1waUnj-00EAka-Ov
 for xen-devel@lists.xenproject.org; Fri, 19 Jun 2026 10:42:11 +0200
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <taka@valinux.co.jp>)
 id 6a3500dc-bab6-0a2a0a5309dd-0a2a4506886c-14
 for <xen-devel@lists.xenproject.org>; Fri, 19 Jun 2026 10:42:07 +0200
Received: from [52.101.125.130]
 (helo=TYVP286CU001.outbound.protection.outlook.com)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.0)
 (envelope-from <taka@valinux.co.jp>)
 id 6a3500dc-b690-0a2a45060019-34657d821b93-3
 for <xen-devel@lists.xenproject.org>; Fri, 19 Jun 2026 10:42:06 +0200
Received: from OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM (2603:1096:604:458::18)
 by TYWP286MB2404.JPNP286.PROD.OUTLOOK.COM (2603:1096:400:16b::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.139.13; Fri, 19 Jun
 2026 08:41:59 +0000
Received: from OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM
 ([fe80::c8c9:25cd:8d13:96d6]) by OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM
 ([fe80::c8c9:25cd:8d13:96d6%6]) with mapi id 15.21.0139.011; Fri, 19 Jun 2026
 08:41:59 +0000
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
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dOp3RoFBgIGaOZkJYqamUATFSFy+PLEB6HdmXIxn7UxU+DYlqiEL/STohKRGt1r1qZzOuaLJHWcwDO23ggekOfEX54Q52Afnciww9251cYa+IlMAnswRwTyGSU/LWrGJhLXsH2Xjwiq80T6GhmBiRmQEGHpZevtBPyUubQ4+JAY4fjnWq3wRf9Iwzr3kSybat4CjkI7kM4ZEbCjl+c+WLOj+oRv3UwXxRoD3vS8LKizmpn2UlowV0Cnx/QBGdD8rCMVxFgPilFNc2T8dFmDcmRcK01Ui/DyJ8MrQ8HZ0cen8y1NflZHyDUqmTEikopeloghCikX9KY1p+pw0uiHg1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JQpEszSiO0j0hlIkArKN8kGhc4y0+SA7He+5r2P6x1A=;
 b=Y31vnvAZxCTJGeDc+olHYx5IQHMPU/PioPY4t5j5D6rp3R+bWE6VQx4RpBISxSnNM60ZHCm1s7c2/qNBAjdNIulkRxgNTpVj8n8vfJU5JN/hJ0f7o9v5hafjIn6cMS5K3V/7kzXTU526AYocSBgc/EMV9TUjxmsLowhbdPmAPrIo0dlTlyYNW52Mf6/iIH5eBGMiFqNYEEzln8KrvSsMJXlCLO8PFjYN53+f/2SaoY4r2lnpYwL4+c8dEhkgtMt+ys/fiiurr7X/6T0LDj9ovnGqRN2rZWuvVqCD6UI45bu7IxQjEBfAkFLXRclGh8xndSNkFxkbnd9Tw8vSDJbF/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=valinux.co.jp; dmarc=pass action=none
 header.from=valinux.co.jp; dkim=pass header.d=valinux.co.jp; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=valinux.co.jp;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JQpEszSiO0j0hlIkArKN8kGhc4y0+SA7He+5r2P6x1A=;
 b=ZeoVW6ZjrqMm3HZwlrncaG9sKp9i+Vmvfikb7TreDEzlxxglmx/5hTIJ1/zmqGo97/2NYA02ycGT8nEikpGyoPPzemPilWSQ2CKzEA1YftBBQ7N3uhlqI30mQBJvHG/lCmObCOOV+WxmdkUTMc9bRamYjugCwa8ev5uI9Khn+pQ=
From: Hirokazu Takahashi <taka@valinux.co.jp>
To: Jan Beulich <jbeulich@suse.com>
CC: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
	<julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>, Michal Orzel
	<michal.orzel@amd.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>, Anthony PERARD
	<anthony.perard@vates.tech>, =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?=
	<roger.pau@citrix.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
Subject: RE: [PATCH v3 04/22] xen/arm: Introduce CONFIG_DEVICE_TREE_NUMA
 config option
Thread-Topic: [PATCH v3 04/22] xen/arm: Introduce CONFIG_DEVICE_TREE_NUMA
 config option
Thread-Index: AQHc/8BHecTxkYY0UkipDILxaDEvGrZFizYAgAAD51A=
Date: Fri, 19 Jun 2026 08:41:59 +0000
Message-ID:
 <OS9P286MB72223429F26167256AF8F06782E22@OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM>
References: <20260619075011.377116-1-taka@valinux.co.jp>
 <20260619075011.377116-5-taka@valinux.co.jp>
 <e5cd5952-d01d-4233-b771-cfbdd40615ac@suse.com>
In-Reply-To: <e5cd5952-d01d-4233-b771-cfbdd40615ac@suse.com>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OS9P286MB7222:EE_|TYWP286MB2404:EE_
x-ms-office365-filtering-correlation-id: 852092a4-d604-4df1-91e5-08decddea0c8
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|23010399003|366016|1800799024|7416014|376014|56012099006|18002099003|22082099003|4143699003|38070700021;
x-microsoft-antispam-message-info:
 8/qtv79TMWRnVa9gmGKqng9KHhWkuE9Jq5+AE3d2ujSKmzJba/CUvZpqjPjcYj/CzDfudjeTp6XnUIZUrEF8GfXXOjRW1gayYkgPhZN5CUdFr+AYY4zbZAtfZHR0mXtrfmbipjBdi3QC0+ccHrlhFCA2ujgOjSF+xecEV2+G4I6QkwJ9SJpJn09cQAw+DfjaG9Cg4bE0inzOZ1gr06ZcYYUHda8jPL/EBmW2jXVA4I8ulKAQMYkAGy84f5mpO2WJKVPbLICYuWhK4Htl0GFXa4Pv+tjf3dgrUiNJdTf6DrLhLWxO9a3lS86ayPX32eC9uWC4WqCsYNSfnYxrMaz50ikdKeOGQ16i5LZ6JNARKzQ0I0wYUmSIFjeArLko1mtHSaTE/RxUgkwmByYFbyFqBBFmCOeUCFTu5mUo151StAJD7mCfAoT3p29+51XkvnTnWa9/slK+UiB7eiLeoqq2QQHIDdaE1RcEc4+q9j14ytbHBkZGxHaLOe41HKohwq48ALtabh2KqPMcJOFVSaMn1fpYmXv3FoFdh2XFJacJ2tAi+uia0uIU1/jqYcWRWNbFnuUtHpez64SIinKkv/BGyf9N0zClp09v6+AKEVnot3ro0qOVCWjZBeQVHYx1otNHPEKmboyCe0/4Dl8Giq6ti2QJ4atGMx5zWO+9OAl1SNuw3C9T/DdHpxlgezQEnsrTuP1YGbx5/SfsoFT3gsG9gQ==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:ja;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(1800799024)(7416014)(376014)(56012099006)(18002099003)(22082099003)(4143699003)(38070700021);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?Ti9PeWRqRENNY3Z5ZDVVdzJ6bGNockE2YTdxbU9vclZOZFk0QTdTRWR0bzRj?=
 =?utf-8?B?bGxZRFhBeUxzZStDWmtqNVVLdkFTVThiRmlvUmZ1ZHFyaHA4NCsvY2V2cEQv?=
 =?utf-8?B?Rmh3VUEzZEpEY0ZtOVJIY0R4RE5QUnVySWJ3ZUd4cFNtQk0xMXNWTzNvT1NJ?=
 =?utf-8?B?bDdGcGhJdlZmeGUvRzBjcjR4OVVqQzVtbTZMMER3V3VvcktjZlpwaW1sNTV5?=
 =?utf-8?B?aTlLcGpWcXBUdXI4NTFla2dCWWd4RmdvYjM4MUZhR2FnMnhEZ0FiQnR4bWtp?=
 =?utf-8?B?S1kxVnFKRGRFTHNHS1QxYXJQT1Z5SjBDSTJrV3NkRnhqbHB3Z1d1VXFvelk4?=
 =?utf-8?B?MnZVT2JBZFB5SFhqTThWWHVYOHZMNEdiTlVXNzEyalZMamxReDl0QThlVWF0?=
 =?utf-8?B?dktCUDFtNE83UFVPR09jejJ4NnQ5cU5DU0NpQVI0MVFRVWJMdWlJb1h3NU14?=
 =?utf-8?B?OVBXM2NGVFh3Q1pHbm50NW8zTjlzYi81UkdPUjdia0hGWGc0c2tvTXlZSXF4?=
 =?utf-8?B?ajNtQkVOSmxsT3RWbGxhZGxkNG5TQ0YzWmNVRklwa0k5KzBtUWdZMTZDL0hs?=
 =?utf-8?B?L1d0bFpJOEpmVVBMeE9qNHFUOUdXeGhhMGRWdjFzdHEyS2l5YlhENFhUV3J3?=
 =?utf-8?B?bmRvUk5KWDNRVHRmS2c3emxuSi9DRGpGLzN6dFpzdGNKaS9OVjJIZ3hQV0Nl?=
 =?utf-8?B?bEM4K0dXTERRVGZPTldUNHA1WjhLWTRpbGtSOWpyaDROZHN6RCtEQzV4RUZW?=
 =?utf-8?B?blZpMDR3aGkwdnNxeVErWE0rUngrYW1Jd2c5RENuVkhwQkVqZ2dyY2VmclNS?=
 =?utf-8?B?TzRFT0hJdEJucjkxVzlDdVVzMzMwc0JuTmFzS2E1TUZqYzI0c29kZ3IyaFFz?=
 =?utf-8?B?aW9mbWlzM2dmMnVxTFNjcmlXR3lWdXA1SE81QUJsS1ZzekJzU0N5d3dqTERh?=
 =?utf-8?B?NVNqdE44Y3VRK2lOaUtVZUx2R0lEVTIxZ0RkL1d6UUlySEQ3Z1lOcnhvdUdz?=
 =?utf-8?B?UlBlWk9RNnFacVNrSkdNaGhvQ1I0a2UramYrWkpqS0xkcG85UFhpMDhOUXA1?=
 =?utf-8?B?NVJlY0JjRG95M2N5NEowQ0c3bjdOdnhwWHlxMG9idlFXUFhNdmx0Rmx4bjc5?=
 =?utf-8?B?S0xsTExpbDZ4ZTRuRFdSTnRLSUNnQm1rNk8rak9hS2NWUUxjU2hNOTFuLzQz?=
 =?utf-8?B?a1U3SGxpQ2dqYlJEc3BxaXFzWCswZlRSNkw0aDQyUjRrUzhjdk9GaExxejFW?=
 =?utf-8?B?U0w2Q1BqNUx4R29rNDY0RkdaY1lCUDdsWWpFbUxUWlB5TXNzYml6NXBDUmdK?=
 =?utf-8?B?SURYRW4vMFVTOWtyeWxvNVZ4SVYzY2dFYTZCd1VIUUU2VmdENnkzZlNZYjRs?=
 =?utf-8?B?a003MklTZ1cwNjhtYU9zbVd6RTl1QWswMHFXS09SYXFKOElyc1VUL1VZTTZx?=
 =?utf-8?B?TDFoSVZqTCtYb0J4bWhGRml6UG9Tc1ovMGhYaEt3dE1XVkgyRUJCTSsrZnJs?=
 =?utf-8?B?QkRrNXNmbkVhbVdzT29ZWm9YSXdDeUIrdU9jWU41TW9DWnpianY3emg0WTZh?=
 =?utf-8?B?SGRvS2R5NUJwY0FqaTJsa3FmUUQ3Rmg1MGxJRldLNVp4QWtESU9ueGdGeXZ0?=
 =?utf-8?B?RHZHalQzTXg2TEZONXlKN1BPYUhzNS9qQWdPbzhaTk4vRno3WGJibFpaMXQr?=
 =?utf-8?B?bFdNS081S3FrRGVPTnROUGNCZVhycEt4UDVWMnpVMG1mclhZMGhpeE1hTndo?=
 =?utf-8?B?UXpTeXRSV2FoMmRWdDBDRHJZUmhCTmVVeWZCQ1hFVGZaWDNGOGNObXhOZVlz?=
 =?utf-8?B?c3J3MG94aXdENHlkT1U0amNqTUlKQ01yVEtWM0hvR0lBWEJmd0NvVlJmWERu?=
 =?utf-8?B?U0doZDYvZzBtSGFXOU5TYUVRajhibVVmQndOcmpGSTd5anBrbklLZG02RzJK?=
 =?utf-8?B?RnNRdm1Fclh0WGppUytoQXdOaE9VTVF5Ti9KYUduei9xNm5GY3dsNk1oRzJm?=
 =?utf-8?B?MVNBa2dZdHJvelZWRXIvMDJ4eHJNV3JpUVN4Zi9YYkhzTXRGMXdDRVRDZHJt?=
 =?utf-8?B?TGxSVXhnWUpaTHFQTVdmWFRkMHNYcUdPUnUrNEFRaTNDYmhqK0VLdjRpUjE3?=
 =?utf-8?B?QlRyZGpDUGxIb0Q1NDNCREl4SXNjSXY4VTVQWlFKSVlVSWxacEM3cWRMaGZw?=
 =?utf-8?B?V3RDZGJKenM0YXZTL2hDTmt2M1NldGFZcGl2WGJ2RktTcTE5WG5XdUcyZnMz?=
 =?utf-8?B?cXJrcTZsT3E3b1dMZWU3aks5UEpIanpvb0ZONytIaG80K2J6b3FzZENwcHRB?=
 =?utf-8?Q?hUuI3i9NyDKGnbgz0Y?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: valinux.co.jp
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 852092a4-d604-4df1-91e5-08decddea0c8
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Jun 2026 08:41:59.7082
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 7a57bee8-f73d-4c5f-a4f7-d72c91c8c111
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: KbQOjGNRLAHPlmh05QZSQSLicsU0g58UF1b8js6T8tiXy5mQv+XQZ2Z7cbtbB1eWAmg6jdMCfJHKNfwhaGVcgg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWP286MB2404
X-purgate-ID: tlsNG-16d1c6/1781858527-B31EC853-6A5454DE/0/0
X-purgate-type: clean
X-purgate-size: 802
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.09 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	MIME_BASE64_TEXT_BOGUS(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[valinux.co.jp,none];
	R_DKIM_ALLOW(-0.20)[valinux.co.jp:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_BASE64_TEXT(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jbeulich@suse.com,m:sstabellini@kernel.org,m:julien@xen.org,m:bertrand.marquis@arm.com,m:michal.orzel@amd.com,m:Volodymyr_Babchuk@epam.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:roger.pau@citrix.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[taka@valinux.co.jp,xen-devel-bounces@lists.xenproject.org];
	FORWARDED(0.00)[mailman];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	ALIAS_RESOLVED(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[taka@valinux.co.jp,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[valinux.co.jp:+];
	RCPT_COUNT_SEVEN(0.00)[10];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 21D956A4AA6

SGVsbG8sIA0KDQo+ID4gLS0tIGEveGVuL2NvbW1vbi9LY29uZmlnDQo+ID4gKysrIGIveGVuL2Nv
bW1vbi9LY29uZmlnDQo+ID4gQEAgLTE4OCw2ICsxODgsMTQgQEAgY29uZmlnIFZNX0VWRU5UDQo+
ID4gIGNvbmZpZyBORUVEU19MSUJFTEYNCj4gPiAgCWJvb2wNCj4gPg0KPiA+ICtjb25maWcgTlVN
QV9ESVNUQU5DRV9NQVANCj4gPiArCWJvb2wNCj4gPiArDQo+ID4gK2NvbmZpZyBERVZJQ0VfVFJF
RV9OVU1BDQo+ID4gKwlib29sDQo+ID4gKwlzZWxlY3QgTlVNQQ0KPiA+ICsJc2VsZWN0IE5VTUFf
RElTVEFOQ0VfTUFQDQo+ID4gKw0KPiA+ICBjb25maWcgTlVNQQ0KPiA+ICAJYm9vbA0KPiA+DQo+
IA0KPiBZb3Ugd2FudCB0byBpbnNlcnQgYmVsb3cgTlVNQSwgbm90IGFib3ZlLiBJdCBtYXkgYWxz
byBtYWtlIHNlbnNlIHRvIG1vdmUNCj4gInNlbGVjdCBOVU1BIiB0byBOVU1BX0RJU1RBTkNFX01B
UC4gSSBkb24ndCB0aGluayB0aGUgbGF0dGVyIHNob3VsZCBiZQ0KPiBzZWxlY3RlZCB3aGVuIE5V
TUEgaXNuJ3QgYWxzbyB3YW50ZWQuDQoNCk9rYXksIEkgd2lsbCBmaXggdGhlbS4NCg0KSGlyb2th
enUgVGFrYWhhc2hpLg0K

