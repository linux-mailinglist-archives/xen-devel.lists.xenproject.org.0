Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id EDHkA2JvK2o29gMAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 12 Jun 2026 04:30:58 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B6E736764A1
	for <lists+xen-devel@lfdr.de>; Fri, 12 Jun 2026 04:30:56 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=valinux.co.jp header.s=selector1 header.b=Tsn5tA9e;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=none) header.from=valinux.co.jp;
	arc=pass ("microsoft.com:s=arcselector10001:i=1")
Received: from list by lists.xenproject.org with outflank-mailman.1336293.1598111 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wXreD-00024a-DO; Fri, 12 Jun 2026 02:29:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1336293.1598111; Fri, 12 Jun 2026 02:29:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wXreD-00021o-74; Fri, 12 Jun 2026 02:29:29 +0000
Received: by outflank-mailman (input) for mailman id 1336293;
 Fri, 12 Jun 2026 02:29:28 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <taka@valinux.co.jp>) id 1wXreB-00021h-7s
 for xen-devel@lists.xenproject.org; Fri, 12 Jun 2026 02:29:28 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wXre9-00CF9q-Us
 for xen-devel@lists.xenproject.org; Fri, 12 Jun 2026 04:29:25 +0200
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <taka@valinux.co.jp>)
 id 6a2b6ea3-2eae-0a2a0a5409dd-0a2a4503c9f0-24
 for <xen-devel@lists.xenproject.org>; Fri, 12 Jun 2026 04:29:25 +0200
Received: from [40.107.74.133]
 (helo=OS0P286CU010.outbound.protection.outlook.com)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <taka@valinux.co.jp>)
 id 6a2b6f03-672d-0a2a45030019-286b4a854133-3
 for <xen-devel@lists.xenproject.org>; Fri, 12 Jun 2026 04:29:25 +0200
Received: from OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM (2603:1096:604:458::18)
 by TY4P286MB5511.JPNP286.PROD.OUTLOOK.COM (2603:1096:405:283::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.14; Fri, 12 Jun
 2026 02:29:17 +0000
Received: from OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM
 ([fe80::c8c9:25cd:8d13:96d6]) by OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM
 ([fe80::c8c9:25cd:8d13:96d6%6]) with mapi id 15.21.0113.011; Fri, 12 Jun 2026
 02:29:17 +0000
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
 b=S+FSKfsBZhSnlEkjTQ3qJN/Lfo+FvSu2rSm3+ZYX79QqRCAovbGKKzdaG5/dCelClWr9gT8nM3+6TXmz6/H1A2ZaALwjDVtuDPVsYm1QuWD7vb8wlAoW2twCG/lEzhOpk3PPOALvc+MC6047NHkcS4FHkjmTg8QSoSF3YFWkdPo1YtyexhTiPQqPLUXQ3/GsjLCfNbcSV25YP6M97Wzeig6BXEEw2JWInALoJS0URmdSFq33D4eAEzFyuGduQTjoJ1BNP0grVxMJf8kRqOUfFMC7kRnLnvjNC88bUkZt+I3lLWoFmjCYyFbpCtooq05+inJ9G99Ge6dBpWYPHnxewA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gKJ7525aI43XAvJkR0xaZW/9PUK0Anwv8gVMuiigYEo=;
 b=l+anIFn/AdqFdtfXW3ia3UF78kBgZnDdRln0YFC8l3oL+TwkF3qmFGlD92pa17CSxapGEIF8l2AmkOMz8iwLIW2WLkpkZ+9KWKLl4+fe95X1oEDQZRkWc4a4jGdJH1rlPRgvqM+23EfYTBUHIRICz3IzKgbrjLtGQilSdeNDRMkOzVf14qBPPCtZV0PIz7ImwyNZd1p6XvWX223obnAY80uHQNBwdgstj2SZOf6mjuGndMjWYV84p9ihqH0Ged5LniKeZ6XuFkAdVyEcPi3BJSzYyoaBHcmY447TBz8vmltxYPOVhXLx00U1euAGWG+z5Rtsik/oaFQ01ZSRqWrcfg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=valinux.co.jp; dmarc=pass action=none
 header.from=valinux.co.jp; dkim=pass header.d=valinux.co.jp; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=valinux.co.jp;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gKJ7525aI43XAvJkR0xaZW/9PUK0Anwv8gVMuiigYEo=;
 b=Tsn5tA9eoCyBRwuM+0XEf8QRXiIhHvoA+3NGfVNQyCIOvq+FCSJ4niNcLeSZHR7dKFEH6/UJORJEOREoKB1/izuuARU76UvQPVWSihxq1Vea+krI3QliMp61RQvKyJTttCd6Opwm2jrOiSgr0l2+bkCe1iIJ7/JwWO5/hwStF8U=
From: Hirokazu Takahashi <taka@valinux.co.jp>
To: Jan Beulich <jbeulich@suse.com>
CC: "Mykyta_Poturai@epam.com" <Mykyta_Poturai@epam.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>,
	=?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: RE: [PATCH 1/3] xen/device-tree: Parse 'cpu-map' node for CPU
 topology exploration
Thread-Topic: [PATCH 1/3] xen/device-tree: Parse 'cpu-map' node for CPU
 topology exploration
Thread-Index: AQHc+MoozrCC9Pa1YkC7YJKVJ6P2UbY5ZUuAgADOheA=
Date: Fri, 12 Jun 2026 02:29:17 +0000
Message-ID:
 <OS9P286MB7222AA4E4F26E616305D08B882182@OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM>
References: <20260610111320.133784-1-taka@valinux.co.jp>
 <20260610111320.133784-2-taka@valinux.co.jp>
 <25065ffe-4bfa-450d-87ff-982ec37a77b3@suse.com>
In-Reply-To: <25065ffe-4bfa-450d-87ff-982ec37a77b3@suse.com>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OS9P286MB7222:EE_|TY4P286MB5511:EE_
x-ms-office365-filtering-correlation-id: 87074284-82af-41f9-fc39-08dec82a66ba
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|23010399003|366016|1800799024|7416014|376014|56012099006|4143699003|38070700021|18002099003|22082099003;
x-microsoft-antispam-message-info:
 u/tbW+FIGPTS0Cj20w+t9QT/vo4BzFM/V8uDNWJi2CcbXv3HBcZZNI6IHOT2j8qDHXrYTFCa1GCZOkPtUNKu1pZvydzcV2/XSqNXbTKSHt8t2M1Ko/SyDVE4DMyiAo0Eg2oZ0Odm1euBYxmc6QH3WDprQcDjki1kK9c9LAUH0jQJ8FmWUeFyrWz+q5s5UAglIAckcEYFcZvaUEAD35CxX+gvotQflVRkx9sGUdQkwsJq0ndatpr1WXTtEB172aWF1JXbJz/1T+ioo3vRPtbONpSMF0ls27WMaT/KH29Pb49nVnNVFg3LOJLqeuGIrSiIiUu9J9KOt22lhSkxW53NQmle/r+lJfDeZHalXLajCGPnEMbPmWds8+OUoRkat4psRspNqjfTrfBmECmJ9gYnV4Pyodzdr95lwSCLLFysizIpVvwkl2XeuaqbLaA97mfs/J7cK2BlWk1Wg96cf7RzbwrD4W188BtqOhnGg/iaG86GegUo/XsqxRxTuzJ/NXypuugHAmqRhmwfAKpNj1+r/S3W8zvxZtF+a0YcRVc3STU/OVD3Y1pyftVwHYc6Udvgq1OM3vqjYouM1C6LA4XMQN6LaqzvjM1QtLOHqSSAVUib8bOuz/6IeqroM72b3CmxIJLLqBigV/lI9G8kk2EaYIVYZydw2xVv/Jk1wA2+Gw3W+8JrPdksjZORKP2MPQjr3ZZBy4/kd81UQeB3HoF3IdX/8JahpKXFHiDjd9/Hh2/EiczW+EEZ4C6vN6SVP04V
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:ja;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(1800799024)(7416014)(376014)(56012099006)(4143699003)(38070700021)(18002099003)(22082099003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?R1ZQNlc0Rnh0Q040WGdBS0hqUlU0eTF6Y0dFOHZsclJtM0l1NVVLV2k1OENV?=
 =?utf-8?B?SFJsbENKUUdWOXhrd0lteENBanlkc3BKU1hQYmxYemgzQlA3YTE0Vk9ieHNs?=
 =?utf-8?B?NVlDd0NPQkErNnJlQU5yN3hJWXA4THJnTUx4bUZTZTUxNFNTdkdmbTlmUkND?=
 =?utf-8?B?YXJERVlERm55bmNGemtkalVpamVxK2FSK0hTenRPa3laTTZWcmlEQ3JKYW9t?=
 =?utf-8?B?S3puem91bmNoakZkTVlBTms2NEhsbGFmR0MzeVgzejRWbmJLNzZtaFc2ajRK?=
 =?utf-8?B?emlKaUhvdmhncm52MXhHbXBlOTdBSWROUnM5cStCSldrQzR0a1FtUGlMTFdj?=
 =?utf-8?B?ZndyT2dyY3FKYmlKS0NHTDhtS09BZGM5UkpreHRiaWFpVmN4U002UEcrR2lk?=
 =?utf-8?B?U05ZSER2dnN6UDdWZGpiUzRCTjFsNy9IZ3RCQWRTcDNsSE05WFY4b2k0dCs0?=
 =?utf-8?B?LzMwRy83aE15NkNBbHMrZm1FeDhIcTZSYTBqdENyQ0dVMmtmOUxVbVRMU3pE?=
 =?utf-8?B?SjhjaUQwM0UydjhBTDNMbUxDRkViRjFwSkhGN2t1OWs3QWt0RmlNS1g3UWJ1?=
 =?utf-8?B?R1p2ZllZN0ZkRnJReUNZaWdTcTRxTE00bzRIWFJaUHhpcDAvYVBDelE3c2JM?=
 =?utf-8?B?UFowM2VoNE9sTEZlNW1pZ3puQnNlYnlCZUNodVNQQTgxVkd4VE9mZlJNK1k3?=
 =?utf-8?B?WElkY0JYSkYwZXJIU0RHaGF3UlZubXUxT1FVVlhTb2VmY0hCMkF3bVdPVmU4?=
 =?utf-8?B?YVBOWHRNZkwzN2NwNWIvRytVcXNydHJHM3l5NUprWmJxem1TTnNyU1FraG5k?=
 =?utf-8?B?eTVmL3MwNU1XWHBaZkxjNzYweFd6VFUzcXNWcmZUekUyRUw3TGVPclhjT0VC?=
 =?utf-8?B?V2tRM1NSZEVzTnpnNjZMYzEyYnE2WWQrQWNvNVFDclFGUGtIem9Eb2tMUGts?=
 =?utf-8?B?aUhDenc4SlA0bE4xSFJaNFFyY29GQW1RVC9uUkJUZlE2MlJXTVZsWGtZWEg2?=
 =?utf-8?B?ZE5uTTVaVHU1eW9YYnlTWDUxU0NXbGxMLys0b3ArNEhOSUtlSEQwanNIcGdQ?=
 =?utf-8?B?ZlhDcFI3YXZwdzBmb3J3RG0ydU5VamZ1Um5FQU1vRFRJUGQ2dTdHNSsrcDhE?=
 =?utf-8?B?MmJQS01LTU1mUUhDaFliZDZOMWFpaHRRdWI2dCtJYjd4WmY2T000b1o0MS9I?=
 =?utf-8?B?Q2Jmb3h3QldzQ3RpcGJuaG9VYkhzQ3NPUklTWVpST0VMWFJqNWFRWDhiR3hP?=
 =?utf-8?B?NkZKTUJwb0krSDdHRnkwL1VkOUF3aFhXM3hUUWJNakxPUHpqRTFDYXBaTmVk?=
 =?utf-8?B?MmlXU3BEMWF6NUI4cHJNSC9hUVk5UWgzaW84WU16OGVrbm1uMXZnb3pQOFUw?=
 =?utf-8?B?SExQbGMzalliWkdwRzJiMTc0Zm00TWJ6MFQvM1hlR2d5TnhiRkxPeHBCWjAw?=
 =?utf-8?B?aFFQRHNpMFdVeE5aczR1RDBXZ3p3QzhEUDkranhucEFyc0syeStWdkVEc01Y?=
 =?utf-8?B?Z3AvcXdYMXQvdmExb1RGM05QbW1jU2UxWm1PdnI3bS9HNWxabm4vL1p2OU9M?=
 =?utf-8?B?L1pMMjJid0JlZC9HWVFDbWw4TkdOeVljVDQ4cHVhalBtWmd0MlhtNFRGZ1Y2?=
 =?utf-8?B?cmRHZVAxMlFuam5ZemhzVmErSG9LV2xsWGRHc2l3ei9KTFJoNkpiZWhtZUtP?=
 =?utf-8?B?aVFoRlhtbXhSUzJuamFnbkhRRlN4dHVQUFp4dCt4TFE0YmVvNlI0aG90MzZy?=
 =?utf-8?B?MjI3QkpFdUl4aUpmZzhYaHJwM0JwdStGek1vK1hjMlFwbnRxRU5EL1ZhS0h4?=
 =?utf-8?B?M3Nxem5zdEo2L0VVSnV4RWtsUkN2cU1zdXZ3ZnhwYjN1Um12blREU1dPbkhu?=
 =?utf-8?B?VlkycmNhVEpOWEsyd0ZqNmYrNzRoRzFtczJFVnFaUDNJZit6a2hmbVdJTGVC?=
 =?utf-8?B?SVFKWk1VSTcxZG5heklQczJGd3JZZHJneFJCdTNpRDBDem5uVXRDRXBrWGdv?=
 =?utf-8?B?SGFvQXBHQklVY0pEVXF2cmY1eGRGU0hWNFlBdUFZRFRKQ0NRV1BBNWJnVmh0?=
 =?utf-8?B?Y2wxZkhuOGtkMGMrTXo4VGU5SHdmc0VId2VRTXU3WGxsamQyQk4vMC9TS003?=
 =?utf-8?B?eWc3ZTNJc2xXZ2JTWEYvV3RBdmd3WmwvdnNBZysvREhuTjFQaDZBenB3Z3g0?=
 =?utf-8?B?S2MwTDRseW5pUjRpM0t4Zk9XU3hDZGJKZWFmN2hqSGQ4c1FiTFBHeVMrYWpy?=
 =?utf-8?B?WVl3MkJVRFNsOWQyR1JTL0dYczg5dHNqc0gvc0M1L0FPTUxESHVPY1dsbnRP?=
 =?utf-8?Q?JutBt1u6jwImQDlyfv?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: valinux.co.jp
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 87074284-82af-41f9-fc39-08dec82a66ba
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Jun 2026 02:29:17.0606
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 7a57bee8-f73d-4c5f-a4f7-d72c91c8c111
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: UxLufc5doyY7YmNNW1KCwNZj2wlq1qVX4rYxbxcUhP/xm4swKiiiC3q3B5AJCTWvtLw08ofl/ExQBvQiD7+G2g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY4P286MB5511
X-purgate-ID: tlsNG-33051d/1781231365-3A766938-5FB2F005/0/0
X-purgate-type: clean
X-purgate-size: 1232
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.09 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	MIME_BASE64_TEXT_BOGUS(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[valinux.co.jp,none];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[valinux.co.jp:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER(0.00)[taka@valinux.co.jp,xen-devel-bounces@lists.xenproject.org];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jbeulich@suse.com,m:Mykyta_Poturai@epam.com,m:sstabellini@kernel.org,m:julien@xen.org,m:bertrand.marquis@arm.com,m:michal.orzel@amd.com,m:Volodymyr_Babchuk@epam.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:roger.pau@citrix.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM:mid];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[taka@valinux.co.jp,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[valinux.co.jp:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: B6E736764A1

SGVsbG8sIA0KDQpUaGFuayB5b3UgZm9yIHRoZSBmZWVkYmFjay4NCg0KPiA+IC0tLSAvZGV2L251
bGwNCj4NCg0KPiBUaGUgbmFtZSBvZiB0aGUgbmV3IGZpbGUgZG9lcyBub3QgaW4gYW55IHdheQ0K
DQo+Li4uIGV4cHJlc3MgdGhpcyBpcyBhbGwgYWJvdXQgRFQgc3R1ZmYuIElzIHRoaXMgaW50ZW50
aW9uYWw/IEVsc2UgaXQNCj4gbWF5IHdhbnQgYWRqdXN0aW5nLg0KDQpUbyBhZGRyZXNzIHRoZSBp
bW1lZGlhdGUgY29uY2VybiwgSSBhZ3JlZSB3aXRoIHJlbmFtaW5nIHRoZSBmaWxlDQp0byAnZHQt
Y3B1LXRvcG9sb2d5LmgnIGluIHYyLCBzaW5jZSB0aGUgY3VycmVudCBpbXBsZW1lbnRhdGlvbiBp
cw0KcHVyZWx5IERldmljZSBUcmVlLWJhc2VkLg0KDQpIb3dldmVyLCBteSBvcmlnaW5hbCBpbnRl
bnRpb24gYmVoaW5kIHRoZSBnZW5lcmljIG5hbWUgd2FzIHRvDQphY2NvbW1vZGF0ZSBmdXR1cmUg
ZW5oYW5jZW1lbnRzLiBTaW5jZSBBUk0gWGVuIHN1cHBvcnRzIGJvdGggRGV2aWNlDQpUcmVlIGFu
ZCBBQ1BJLWJhc2VkIGJvb3RzIGRldGVybWluZWQgYXQgcnVudGltZSwgSSBob3BlZCB0byBhbGxv
dw0KQUNQSSBib290cyB0byBwb3B1bGF0ZSBhbmQgc2hhcmUgdGhlIHNhbWUgdW5kZXJseWluZyB0
b3BvbG9neSBkYXRhDQpzdHJ1Y3R1cmUuIEkgdGhpbmsgdGhpcyBjYW4gYmUgYWNoaWV2ZWQgYnkg
c2Nhbm5pbmcgdGhlIEFDUEkgUFBUVA0KKFByb2Nlc3NvciBQcm9wZXJ0aWVzIFRvcG9sb2d5IFRh
YmxlKS4NCg0KPiA+ICsjZWxpZiBDT05GSUdfREVWSUNFX1RSRUVfUEFSU0UNCj4NCj5EWU0gIiNl
bGlmIGRlZmluZWQoQ09ORklHX0RFVklDRV9UUkVFX1BBUlNFKSI/DQoNCk9vcHMsIEkgd2lsbCBm
aXggaXQuDQoNClRoYW5rIHlvdSwNCkhpcm9rYXp1IFRha2FoYXNoaS4NCg==

