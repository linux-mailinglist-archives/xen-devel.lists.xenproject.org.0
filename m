Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 48F79B37587
	for <lists+xen-devel@lfdr.de>; Wed, 27 Aug 2025 01:29:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1095310.1450376 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ur366-0005lU-Vk; Tue, 26 Aug 2025 23:29:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1095310.1450376; Tue, 26 Aug 2025 23:29:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ur366-0005im-SM; Tue, 26 Aug 2025 23:29:02 +0000
Received: by outflank-mailman (input) for mailman id 1095310;
 Tue, 26 Aug 2025 23:29:01 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=VNE8=3G=epam.com=Volodymyr_Babchuk@srs-se1.protection.inumbo.net>)
 id 1ur365-0005ig-Ef
 for xen-devel@lists.xenproject.org; Tue, 26 Aug 2025 23:29:01 +0000
Received: from OSPPR02CU001.outbound.protection.outlook.com
 (mail-norwayeastazlp170130007.outbound.protection.outlook.com
 [2a01:111:f403:c20f::7])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6e240cdd-82d4-11f0-a32c-13f23c93f187;
 Wed, 27 Aug 2025 01:28:54 +0200 (CEST)
Received: from GV1PR03MB10456.eurprd03.prod.outlook.com
 (2603:10a6:150:16a::21) by VI1PR03MB9897.eurprd03.prod.outlook.com
 (2603:10a6:800:1c2::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.21; Tue, 26 Aug
 2025 23:28:48 +0000
Received: from GV1PR03MB10456.eurprd03.prod.outlook.com
 ([fe80::a41e:5aa8:e298:757e]) by GV1PR03MB10456.eurprd03.prod.outlook.com
 ([fe80::a41e:5aa8:e298:757e%5]) with mapi id 15.20.9052.019; Tue, 26 Aug 2025
 23:28:48 +0000
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
X-Inumbo-ID: 6e240cdd-82d4-11f0-a32c-13f23c93f187
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dff+1qn9PuPPTA0BemM9UxNVpBAyc7g7/+gQr0UkLcrVnbc96oj52tPLKctjhE5uupH7xq4iqWRnMAKL1hPGwgJ0QSJf4laDpm6aiGw9s+M1ysnVB+vQzcUA1Fn64h0I5TtZCSSe2TIT+JktvTjqpmD8J10qspU0MW6eXarm0011hlumvL6YXso6z1jzkINhxs2F2SpzgA05A3QtYRpw4E5mGXlJ4qjLrYtr7ngfRMuC6AFOabm42LZGFxJWdDsgCNYS92TaD+4ehgMW+QcYz5CpdtUT94MeHQXbLTi5s2ZmUC4s0G+2S5HfuOSha8Y6nCc+EpjGtAbWHeF0Dx8XTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0fZO0FKMNgCLBfTbAFP9rEgzO5HIIkykpAkW0GEQTKU=;
 b=OUyyQS4HHtKSOdCoissIWlnvR0s5GPdK8UkL6IhvBNWWDIbwsB56HYvTKiUOBle2ZCkfb6CUY2yi67OEVEx4uNLsrO7383aT+GCNYaGRbltW3sg+slUE5a0pQl4kjp/o9lhS/ExTY9kSoigaL33fLjmxRJolaNVZqtbhbmcQek0Dn2ErFZnvttCaZej+GDWK5S+G2fbX/9h5kPzvFlzEpahOGe7ghZU6oom/gJBm37dfi8/kb//RLD1FVAaWGkdSWQOMT4WiONRQACWQkkZLX8LozFZh0pN41njdl6IdMD6iFSV0o95GHGoUttAGJLf1rkBUu1nhVi/BSFgdi3zP6A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0fZO0FKMNgCLBfTbAFP9rEgzO5HIIkykpAkW0GEQTKU=;
 b=kfoOK6d7zKCVeorYA8cUoZGQI1vTvr0K0i0dJ2/i1k2e6z+pvCqL49A+E4lUjPXs90e8nQhTUSM0PXLmVOk64Ar/6yD5cOFeVvyvvQRnrkzWN5cXOZdAHI8OOON5ph7DioHbD7PH7yAr1I+PHJqIvHYTDWPfHVQ+WBerHsRW/WiF63cFrWdzFwLwdil9VEXKQgsKVeJVpPp8tBSv2hXFCVb6nnBnrIkZsXNs4lnQwa9NMhs5GwVPi5RXkuFVxBB+VM0xXMlXQt/QZ4mXAd5FuGoJBm9b2y6ADuHv70tm55p5yg5mQt/c++oEn27EbIjCCqomaBesWFU3xirihXgVMA==
From: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
To: Milan Djokic <milan_djokic@epam.com>
CC: Julien Grall <julien@xen.org>, Julien Grall <julien.grall.oss@gmail.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Bertrand
 Marquis <bertrand.marquis@arm.com>, Rahul Singh <rahul.singh@arm.com>,
	Stefano Stabellini <sstabellini@kernel.org>, Michal Orzel
	<michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>,
	=?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>, Anthony PERARD
	<anthony.perard@vates.tech>, Nick Rosbrook <enr0n@ubuntu.com>, George Dunlap
	<gwd@xenproject.org>, Juergen Gross <jgross@suse.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>
Subject: Re: [PATCH 00/20] Add SMMUv3 Stage 1 Support for XEN guests
Thread-Topic: [PATCH 00/20] Add SMMUv3 Stage 1 Support for XEN guests
Thread-Index: AQHcB7wdmg15F24Gc0ClRsxpCVedRA==
Date: Tue, 26 Aug 2025 23:28:48 +0000
Message-ID: <87v7m93bo0.fsf@epam.com>
References: <cover.1754580687.git.milan_djokic@epam.com>
	<CAJ=z9a1eM6M+Gagond9TiFtF7c7EEQKOKHANcvDWDhW_3JzqOA@mail.gmail.com>
	<12ba4388-ee23-4e17-910f-9702271865ad@epam.com>
	<b1f79b84-d0c4-4807-87a7-1cf94e58ecee@xen.org>
	<a5943713-85fa-48ad-86fe-5698604ed8c9@epam.com>
In-Reply-To: <a5943713-85fa-48ad-86fe-5698604ed8c9@epam.com> (Milan Djokic's
	message of "Thu, 14 Aug 2025 18:26:00 +0200")
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: GV1PR03MB10456:EE_|VI1PR03MB9897:EE_
x-ms-office365-filtering-correlation-id: b50a2b12-710c-48f3-1e58-08dde4f84f04
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|42112799006|7416014|366016|376014|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?N3ZHZ2k0RC9OMVFkWEF0TjFsUVV4WDdKVHVhRkJDaGxqM3JGMUU3TkpESEc1?=
 =?utf-8?B?OU1kWFlpZEVsNEUwQWU1OVJPNjVwK0daRVJjTGRCQmlnL1VRcldFUkZLWlZl?=
 =?utf-8?B?SHFHSkZzaW0rbG1ONFBZSzBVcVNKZmM0VEFUak5XVjNlaEZvb0pRaERnQ0lC?=
 =?utf-8?B?Mk4rb1BNZktXaHpBMjZiVTVlalIrRjAwY0FJYWJka0FvYTRTRE95UTdqc0My?=
 =?utf-8?B?N1ZiVk13dzVLMjN6dU0rYlordkYyYXIxejE1K0FqZWE3UDRRbnV6RDZ4N1ky?=
 =?utf-8?B?SU9VUGRaUXBwS0Z6WVdHYlRMbXB3U3lqOFEwWFY1enBtR0xYYmE4YSszaDEw?=
 =?utf-8?B?Q1BiVWZTNzlRaEVQZTh6cFlLUnQ1ZXpSZ3dZRDZ1d1EwS25lbTF3MGxoeW1N?=
 =?utf-8?B?L0YzeXo4ZDltUjE1TGJCYWJWeDd3aXFGMTU4dGNoZ0J1OUZXSVVsYTJKKzBV?=
 =?utf-8?B?WjkxSGpZRXVKTVU4eTFlTXhFSThld3cyMDlkZFhvT1FMUzRVK1lXYWNseGZh?=
 =?utf-8?B?VzNudlVFeGpKNkdGV3VpZEVRekJDUjNLY1FFRjBWRjBwNERLbmR6UHZmUkJw?=
 =?utf-8?B?K1RhVVdkbDJmdTZyZmpRVWFxa01IeWVYRTlKemxwUHYxeitZby9HeW42TjdV?=
 =?utf-8?B?TWE4bm9DYVNva3NvVEVlYXNrNnNyeTJVU2dBZHhnRzBwcVVHZkphRmp4UHBC?=
 =?utf-8?B?ZmswZ2JBRTExazRTT0w3cUhHWlk3dEtkeER0QXRJNmhBalUwOG9pdk5SNVlj?=
 =?utf-8?B?eTZ6cUdaS2w5ajZzUUxmRkhjTEJvaWlMeHNGQlRldVAxalZDUUdCL29uS2dC?=
 =?utf-8?B?bHFSQkhpUEZkeVlEVXhwT2ZrbEp6Z3dXQksrTGZYM2k5RFV5bmJqdk5qR2lQ?=
 =?utf-8?B?L3l4TjBzQnp1RndtWFpUY3hpT3hLYkR2MlY5WGtoY2RRQjRmd3E5cTFWT2VI?=
 =?utf-8?B?NjNqR0V5YmowcUxQcWxvMWV2c2xRL1REWXhjNHFnN3ZuTWVFNmZJZzFhVkxV?=
 =?utf-8?B?ZHF2YXVNUGdyak1lbWQ3eVJLcU9xR2FSa3ZqYVNQdWlNeHFZc004WkE3SG1U?=
 =?utf-8?B?b3BiS3RDRUZnbW1KUXRVKzdPVmxkMkkrWk9pODNmaW1yaU1rMHZYQXY4bDJh?=
 =?utf-8?B?SHhJY1B2ekpXUlRab0VDK3lSS0VaUU5IME95MFplQ3NqUnZBN1lBWDlyTWVq?=
 =?utf-8?B?S2o3SG1EWFZqb0JWYTl1VHdRRnFlK1BMNmRDa3FYNFFwRGZNNXZaVVI2ajBO?=
 =?utf-8?B?MzY5OFVGTmpIUEQwL1c2VWNPclBmaG1pQ2lWZzk1blkrUTdzQ0pqT1dZaU5Q?=
 =?utf-8?B?VmNHMEl5QVUzV0oyM0RKbUkzQUxtcHVUdS81L0tLeWRpUFB2dFR0dktOdVEx?=
 =?utf-8?B?OHBSUzZBYUxac0p4eGhRb1F4ZW5iRTZQeWdmcUVWc0t1ZjU5VHZtelNNRXVO?=
 =?utf-8?B?Umc3Mk5IV1NmUmQyNTRmNXBmR1poS1h2L044ci83YUZ6K3FvQ2NDZXBqTW1W?=
 =?utf-8?B?azhic2ZCRFFzSE5uWDRwVllPc3pIN0NTMFQ2QUd2akM4aWxlR0JTWGx4Rmc1?=
 =?utf-8?B?NGkvSjFRcCtIbmJVRDY1YTgyNWt2ckhRdm5GYmZOaXhPeUJUSDJueFp4dGxn?=
 =?utf-8?B?bWlKRGxqVjA0bzR2Z3Z3OXFVMU1TQmJCTFViQmxLWjlTVC9OZCtkR3pIZklZ?=
 =?utf-8?B?WSt1cTdyTWZueHl0TVZ5cWhrU2FKdHlVWGV4YjBySkRieXBvU3B6MXZrQnU1?=
 =?utf-8?B?RzNlckExU1RxMDNqSm8wNll4NmhWeG42WExZa1ZOZ05Edjl3aTE5K05uRGd1?=
 =?utf-8?B?MjJFV0pOeG5NL3ZwYTQxeVR2VDRodFo3cWNFQkJSREs4eFRsWmxOaUc1cjJZ?=
 =?utf-8?B?YXhVZlp3UG1kaFZoZ0o0aERHdkpac25xVnhaaTI3dlgxemM2Rk1LbjgrZkpV?=
 =?utf-8?B?Rm1LekdGc3A0THNDdjBORHVWbHFJVGQrNmpOd2FWekQ1TWRhbXhXSE43dEZj?=
 =?utf-8?B?YWxlMW94K3ZRPT0=?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV1PR03MB10456.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(42112799006)(7416014)(366016)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?WW5GZVNvY1N1UTRpR3VLMlY1UmFYWmY0MTRoWnR4Ky9QRHFtT1JXcUZWQ0hm?=
 =?utf-8?B?ZlJuSnNJUW55NWdwbHRjYzAzTVFZTzNMb0I2aUlyU0VvZXdSc0QzV0JhQ1M4?=
 =?utf-8?B?NmQyZklJc3N2Z2UvTFJ4Y00wZkQyWDBrRGlIalo1bE1kdUFLTEdVVURPZTM4?=
 =?utf-8?B?R3hHR0JqVG5pZUhSUlRkb2Y5NHFNWGdFWkU0NHY3OG9vS0F4U3NETnV6MGIz?=
 =?utf-8?B?NllFakh3YmN6eldMMnFpQW43TGxZQmVnRW1QUE9uaWRqc1N0c3llZHdtVVds?=
 =?utf-8?B?TU01alZ2TGN2NTRrREVzY21ieUhvQTY1S1RPcEJwWEVkN2xIclArb0ZqV3VD?=
 =?utf-8?B?Y0JpUDlNQy8xWkYxd0RiZGU0a0FsVjA5YTNERTF3ZDRYWnJPQ2l4RWorbS9K?=
 =?utf-8?B?cFpNS0pCdUh0SFJNL2xZb1dkMEc3bUE5b3M1cFZKdTc2eGhOQ3puS0dXbGhI?=
 =?utf-8?B?KzVyUGp5THp0Q3ZyWEFCQXpJTkhZaXpZR0NVd2liOXcyekNCZzNJOVFMSENN?=
 =?utf-8?B?d0krUmNMSktReWtDZkxWNkNpWXNYUXRPTERjWGFUOW9iNHg2VUVnSEpiSCtY?=
 =?utf-8?B?UkJZQ212TzdPUzg4NDQvcEZxMkhSVGhLNXd3ZzNCOEp1TG9ab3VUamRHams2?=
 =?utf-8?B?N3NlMFRXZmFPbzFvZ241eDZMa3oyUTNjSDJLL2NPanJGd010cW1wQjJSWVBI?=
 =?utf-8?B?b1dWMWh3S3lmRW12SXUxZDRYTTZaaUF5aTgyQ0VPdHI3U1FQTHNsc2pYSGNX?=
 =?utf-8?B?ZWVzdDRScXFGY1BTdis1ZEY2RjVhL0dQUURBTkhsMkoxdVlHNzZXOE9WeGRm?=
 =?utf-8?B?TWhsMDB2V05SWTBWMjRLdGUxeVgzMnJCSEdwYlVITklXU1VOcnZlMnZaZkF1?=
 =?utf-8?B?bXNXcVpZWUZxUHljQncwUU5POXpSMmwyeHEyVHVjRms0VGxsejg3NkxjaVcr?=
 =?utf-8?B?bGp4dHFraXdCY01JaXFxOERrb0NaZ3BnQVEwc3FYUTFTaUU0WlZxb2ZRSUZk?=
 =?utf-8?B?V2RGQkJKekNRc1NuaFJORmtoMU54ZFEweG44ZGJTM21paFRoVEw3RGVJY0Vi?=
 =?utf-8?B?Zk5WbVhjZlpzQWVKZVBqdnM2emRIZk1rbE42c1BGbjQzQnhiOTZWUk1YRW95?=
 =?utf-8?B?OEptNXdCM21PS0tSRXVSM0hEZll6RlRjU3d0TVNKTHRXc3BOQ0VkZzgzTG91?=
 =?utf-8?B?UGdEZmZZZm91dlhKWm1HYmQzeVNhZU9lajhva1lqbml5cnk0bWdySDNSL3I2?=
 =?utf-8?B?VVZlV2FkbDkrZC9tV005L0F4Mmhic1diR3VpRVMyb3Z6dmM1Mkw4dVpZZDJE?=
 =?utf-8?B?NkZMQ09ORHV0NmRIMy9LSTVvNU1tK3RjV1V1dERHMjl1Vll1RnhQOUJHcTkz?=
 =?utf-8?B?NjFkcUVGRk41c1RydUNzVHBicTBudkZQZnU3L3BDOEtHZjk4aElZb1U0RWJC?=
 =?utf-8?B?ZktxSnoxYkFyUEFBOSs1YjFSY3hGYXNuR3F5RitFY2VzMGM1ZlhBdjhnVDFh?=
 =?utf-8?B?WWhKUHY5NytJTGVoZEY2YlRKOTZDTG5qenBWa004RWpsY0N6QjNlcFhxTmQx?=
 =?utf-8?B?L3pqWm9UMFdIeWgvYXBoQnZHb3IwL24wUDRwQU92Q0ptaU9mMTlJQ3lkVXBK?=
 =?utf-8?B?azl3YkR6dm5ISmJvNm9ubWszMXE3UUpMbW05SWJJQ3hYNGNJTDBycU1PMXNO?=
 =?utf-8?B?UVVkUCs0UUtJU1NYY2Z2YjJPN2crYkt3N3Jad2tBeGdkdkUzYksyanNZVzlp?=
 =?utf-8?B?aFdCcHMzU01IYSs3ZW5YKzhxa0xJMW9HNis4R0hzK0MvL0VzdVQ3V1AvUEdT?=
 =?utf-8?B?Y1oyUEM1aFlCQVlPNWcwU3ArdGZBamtQSXJKMGxubzJOQ2tsNGhwKzZTb3N5?=
 =?utf-8?B?dFBHUWhOdlcrNGRzakQyVCtBUzhIRFQvODV6NDlsc3dQUUpsSVd6cGRRekpI?=
 =?utf-8?B?MEV6WkN6cUtyN3pDR2RNZEhucWFRUTV4eWZTbUdrSmZqL3FUbjRYQ2MrNHJx?=
 =?utf-8?B?c1R4QUpKY2ZlQnFham45VlFqREtMbmRxazhEUndCUmlWRnJ0Zk5NekVodzZY?=
 =?utf-8?B?YWNLNTBxeEZuZlo1N2NXN2hrWUxtZTJXRGYyQkt1cmlxelIzbERkK2loRzVG?=
 =?utf-8?B?bFFvRTd1RnJMZEhqc2R3ekF4a0FaMVAxMUg0TVZjazUrNXJzdlkva09Td0c1?=
 =?utf-8?B?THc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <141B706CA25700489BF31796C0AF9199@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: GV1PR03MB10456.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b50a2b12-710c-48f3-1e58-08dde4f84f04
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Aug 2025 23:28:48.4644
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: FjbSeduPpiujKx9+GIZN5Q4t5M29BTgrL25wR2LSHGw+6X7jyIQR1FophjyfqlYX0UKx5Cf14D05/L9CrCtCtaw5NdG7MpqTE8dXLf8V318=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR03MB9897

DQpIaSBNaWxhbiwNCg0KTWlsYW4gRGpva2ljIDxtaWxhbl9kam9raWNAZXBhbS5jb20+IHdyaXRl
czoNCg0KPiBIZWxsbyBKdWxpZW4sDQo+DQo+IE9uIDgvMTMvMjUgMTQ6MTEsIEp1bGllbiBHcmFs
bCB3cm90ZToNCj4+IE9uIDEzLzA4LzIwMjUgMTE6MDQsIE1pbGFuIERqb2tpYyB3cm90ZToNCj4+
PiBIZWxsbyBKdWxpZW4sDQo+PiBIaSBNaWxhbiwNCj4+IA0KPj4+DQo+Pj4gV2UgaGF2ZSBwcmVw
YXJlZCBhIGRlc2lnbiBkb2N1bWVudCBhbmQgaXQgd2lsbCBiZSBwYXJ0IG9mIHRoZSB1cGRhdGVk
DQo+Pj4gcGF0Y2ggc2VyaWVzIChhZGRlZCBpbiBkb2NzL2Rlc2lnbikuIEknbGwgYWxzbyBleHRl
bmQgY292ZXIgbGV0dGVyIHdpdGgNCj4+PiBkZXRhaWxzIG9uIGltcGxlbWVudGF0aW9uIHN0cnVj
dHVyZSB0byBtYWtlIHJldmlldyBlYXNpZXIuDQo+PiBJIHdvdWxkIHN1Z2dlc3QgdG8ganVzdCBp
dGVyYXRlIG9uIHRoZSBkZXNpZ24gZG9jdW1lbnQgZm9yIG5vdy4NCj4+IA0KPj4+IEZvbGxvd2lu
ZyBpcyB0aGUgZGVzaWduIGRvY3VtZW50IGNvbnRlbnQgd2hpY2ggd2lsbCBiZSBwcm92aWRlZCBp
bg0KPj4+IHVwZGF0ZWQgcGF0Y2ggc2VyaWVzOg0KPj4+DQo+Pj4gRGVzaWduIFByb3Bvc2FsOiBB
ZGQgU01NVXYzIFN0YWdlLTEgU3VwcG9ydCBmb3IgWEVOIEd1ZXN0cw0KPj4+ID09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT0NCj4+Pg0KPj4+
IEF1dGhvcjogTWlsYW4gRGpva2ljIDxtaWxhbl9kam9raWNAZXBhbS5jb20+DQo+Pj4gRGF0ZTrC
oMKgIDIwMjUtMDgtMDcNCj4+PiBTdGF0dXM6IERyYWZ0DQo+Pj4NCj4+PiBJbnRyb2R1Y3Rpb24N
Cj4+PiAtLS0tLS0tLS0tLS0NCj4+Pg0KPj4+IFRoZSBTTU1VdjMgc3VwcG9ydHMgdHdvIHN0YWdl
cyBvZiB0cmFuc2xhdGlvbi4gRWFjaCBzdGFnZSBvZiB0cmFuc2xhdGlvbg0KPj4+IGNhbiBiZSBp
bmRlcGVuZGVudGx5IGVuYWJsZWQuIEFuIGluY29taW5nIGFkZHJlc3MgaXMgbG9naWNhbGx5DQo+
Pj4gdHJhbnNsYXRlZCBmcm9tIFZBIHRvIElQQSBpbiBzdGFnZSAxLCB0aGVuIHRoZSBJUEEgaXMg
aW5wdXQgdG8gc3RhZ2UgMg0KPj4+IHdoaWNoIHRyYW5zbGF0ZXMgdGhlIElQQSB0byB0aGUgb3V0
cHV0IFBBLiBTdGFnZSAxIHRyYW5zbGF0aW9uIHN1cHBvcnQNCj4+PiBpcyByZXF1aXJlZCB0byBw
cm92aWRlIGlzb2xhdGlvbiBiZXR3ZWVuIGRpZmZlcmVudCBkZXZpY2VzIHdpdGhpbiB0aGUgT1Mu
DQo+Pj4NCj4+PiBYZW4gYWxyZWFkeSBzdXBwb3J0cyBTdGFnZSAyIHRyYW5zbGF0aW9uIGJ1dCB0
aGVyZSBpcyBubyBzdXBwb3J0IGZvcg0KPj4+IFN0YWdlIDEgdHJhbnNsYXRpb24uIFRoaXMgZGVz
aWduIHByb3Bvc2FsIG91dGxpbmVzIHRoZSBpbnRyb2R1Y3Rpb24gb2YNCj4+PiBTdGFnZS0xIFNN
TVV2MyBzdXBwb3J0IGluIFhlbiBmb3IgQVJNIGd1ZXN0cy4NCj4+Pg0KPj4+IE1vdGl2YXRpb24N
Cj4+PiAtLS0tLS0tLS0tDQo+Pj4NCj4+PiBBUk0gc3lzdGVtcyB1dGlsaXppbmcgU01NVXYzIHJl
cXVpcmUgU3RhZ2UtMSBhZGRyZXNzIHRyYW5zbGF0aW9uIHRvDQo+Pj4gZW5zdXJlIGNvcnJlY3Qg
YW5kIHNlY3VyZSBETUEgYmVoYXZpb3IgaW5zaWRlIGd1ZXN0cy4NCj4+IENhbiB5b3UgY2xhcmlm
eSB3aGF0IHlvdSBtZWFuIGJ5ICJjb3JyZWN0Ij8gRE1BIHdvdWxkIHN0aWxsIHdvcmsNCj4+IHdp
dGhvdXQNCj4+IHN0YWdlLTEuDQo+DQo+IENvcnJlY3QgaW4gdGVybXMgb2Ygd29ya2luZyB3aXRo
IGd1ZXN0IG1hbmFnZWQgSS9PIHNwYWNlLiBJJ2xsDQo+IHJlcGhyYXNlIHRoaXMgc3RhdGVtZW50
LCBpdCBzZWVtcyBhbWJpZ3VvdXMuDQo+DQo+Pj4NCj4+PiBUaGlzIGZlYXR1cmUgZW5hYmxlczoN
Cj4+PiAtIFN0YWdlLTEgdHJhbnNsYXRpb24gaW4gZ3Vlc3QgZG9tYWluDQo+Pj4gLSBTYWZlIGRl
dmljZSBwYXNzdGhyb3VnaCB1bmRlciBzZWN1cmUgbWVtb3J5IHRyYW5zbGF0aW9uDQo+Pj4NCj4+
PiBEZXNpZ24gT3ZlcnZpZXcNCj4+PiAtLS0tLS0tLS0tLS0tLS0NCj4+Pg0KPj4+IFRoZXNlIGNo
YW5nZXMgcHJvdmlkZSBlbXVsYXRlZCBTTU1VdjMgc3VwcG9ydDoNCj4+Pg0KPj4+IC0gU01NVXYz
IFN0YWdlLTEgVHJhbnNsYXRpb246IHN0YWdlLTEgYW5kIG5lc3RlZCB0cmFuc2xhdGlvbiBzdXBw
b3J0IGluDQo+Pj4gICDCoCBTTU1VdjMgZHJpdmVyDQo+Pj4gLSB2SU9NTVUgQWJzdHJhY3Rpb246
IHZpcnR1YWwgSU9NTVUgZnJhbWV3b3JrIGZvciBndWVzdCBTdGFnZS0xIGhhbmRsaW5nDQo+PiBT
byB3aGF0IGFyZSB5b3UgcGxhbm5pbmcgdG8gZXhwb3NlIHRvIGEgZ3Vlc3Q/IElzIGl0IG9uZSB2
SU9NTVUgcGVyDQo+PiBwSU9NTVU/IE9yIGEgc2luZ2xlIG9uZT8NCj4NCj4gU2luZ2xlIHZJT01N
VSBtb2RlbCBpcyB1c2VkIGluIHRoaXMgZGVzaWduLg0KPg0KPj4gSGF2ZSB5b3UgY29uc2lkZXJl
ZCB0aGUgcHJvcy9jb25zIGZvciBib3RoPw0KPj4+IC0gUmVnaXN0ZXIvQ29tbWFuZCBFbXVsYXRp
b246IFNNTVV2MyByZWdpc3RlciBlbXVsYXRpb24gYW5kIGNvbW1hbmQNCj4+PiAgIMKgIHF1ZXVl
IGhhbmRsaW5nDQo+PiANCj4NCj4gVGhhdCdzIGEgcG9pbnQgZm9yIGNvbnNpZGVyYXRpb24uDQo+
IHNpbmdsZSB2SU9NTVUgcHJldmFpbHMgaW4gdGVybXMgb2YgbGVzcyBjb21wbGV4IGltcGxlbWVu
dGF0aW9uIGFuZCBhDQo+IHNpbXBsZSBndWVzdCBpb21tbXUgbW9kZWwgLSBzaW5nbGUgdklPTU1V
IG5vZGUsIG9uZSBpbnRlcnJ1cHQgcGF0aCwNCj4gZXZlbnQgcXVldWUsIHNpbmdsZSBzZXQgb2Yg
dHJhcCBoYW5kbGVycyBmb3IgZW11bGF0aW9uLCBldGMuDQo+IENvbnMgZm9yIGEgc2luZ2xlIHZJ
T01NVSBtb2RlbCBjb3VsZCBiZSBsZXNzIGFjY3VyYXRlIGh3DQo+IHJlcHJlc2VudGF0aW9uIGFu
ZCBhIHBvdGVudGlhbCBib3R0bGVuZWNrIHdpdGggb25lIGVtdWxhdGVkIHF1ZXVlIGFuZA0KPiBp
bnRlcnJ1cHQgcGF0aC4NCj4gT24gdGhlIG90aGVyIGhhbmQsIHZJT01NVSBwZXIgcElPTU1VIHBy
b3ZpZGVzIG1vcmUgYWNjdXJhdGUgaHcNCj4gbW9kZWxpbmcgYW5kIG9mZmVycyBiZXR0ZXIgc2Nh
bGFiaWxpdHkgaW4gY2FzZSBvZiBtYW55IElPTU1VcyBpbiB0aGUNCj4gc3lzdGVtLCBidXQgdGhp
cyBjb21lcyB3aXRoIG1vcmUgY29tcGxleCBlbXVsYXRpb24gbG9naWMgYW5kIGRldmljZQ0KPiB0
cmVlLCBhbHNvIGhhbmRsaW5nIG11bHRpcGxlIHZJT01NVXMgb24gZ3Vlc3Qgc2lkZS4NCj4gSU1P
LCBzaW5nbGUgdklPTU1VIG1vZGVsIHNlZW1zIGxpa2UgYSBiZXR0ZXIgb3B0aW9uIG1vc3RseSBi
ZWNhdXNlDQo+IGl0J3MgbGVzcyBjb21wbGV4LCBlYXNpZXIgdG8gbWFpbnRhaW4gYW5kIGRlYnVn
LiBPZiBjb3Vyc2UsIHRoaXMNCj4gZGVjaXNpb24gY2FuIGFuZCBzaG91bGQgYmUgZGlzY3Vzc2Vk
Lg0KPg0KDQpXZWxsLCBJIGFtIG5vdCBzdXJlIHRoYXQgdGhpcyBpcyBwb3NzaWJsZSwgYmVjYXVz
ZSBvZiBTdHJlYW1JRA0KYWxsb2NhdGlvbi4gVGhlIGJpZ2dlc3Qgb2ZmZW5kZXIgaXMgb2YgY291
cnNlIFBDSSwgYXMgZWFjaCBSb290IFBDSQ0KYnJpZGdlIHdpbGwgcmVxdWlyZSBvd24gU01NVSBp
bnN0YW5jZSB3aXRoIG93biBTdHJlYW1JRCBzcGFjZS4gQnV0IGV2ZW4NCndpdGhvdXQgUENJIHlv
dSdsbCBuZWVkIHNvbWUgbWVjaGFuaXNtIHRvIG1hcCB2U3RyZW1JRCB0bw0KPHBTTU1VLCBwU3Ry
ZWFtSUQ+LCBiZWNhdXNlIHRoZXJlIHdpbGwgYmUgb3ZlcmxhcHMgaW4gU0lEIHNwYWNlLg0KDQoN
CkFjdHVhbGx5LCBQQ0kvdlBDSSB3aXRoIHZTTU1VIGlzIGl0cyBvd24gY2FuIG9mIHdvcm1zLi4u
DQoNCj4+IEZvciBlYWNoIHBTTU1VLCB3ZSBoYXZlIGEgc2luZ2xlIGNvbW1hbmQgcXVldWUgdGhh
dCB3aWxsIHJlY2VpdmUgY29tbWFuZA0KPj4gZnJvbSBhbGwgdGhlIGd1ZXN0cy4gSG93IGRvIHlv
dSBwbGFuIHRvIHByZXZlbnQgYSBndWVzdCBob2dnaW5nIHRoZQ0KPj4gY29tbWFuZCBxdWV1ZT8N
Cj4+IEluIGFkZGl0aW9uIHRvIHRoYXQsIEFGQUlVLCB0aGUgc2l6ZSBvZiB0aGUgdmlydHVhbCBj
b21tYW5kIHF1ZXVlIGlzDQo+PiBmaXhlZCBieSB0aGUgZ3Vlc3QgcmF0aGVyIHRoYW4gWGVuLiBJ
ZiBhIGd1ZXN0IGlzIGZpbGxpbmcgdXAgdGhlIHF1ZXVlDQo+PiB3aXRoIGNvbW1hbmRzIGJlZm9y
ZSBub3RpZnlpbmcgWGVuLCBob3cgZG8geW91IHBsYW4gdG8gZW5zdXJlIHdlIGRvbid0DQo+PiBz
cGVuZCB0b28gbXVjaCB0aW1lIGluIFhlbiAod2hpY2ggaXMgbm90IHByZWVtcHRpYmxlKT8NCj4+
IA0KPg0KPiBXZSdsbCBoYXZlIHRvIGRvIGEgZGV0YWlsZWQgYW5hbHlzaXMgb24gdGhlc2Ugc2Nl
bmFyaW9zLCB0aGV5IGFyZSBub3QNCj4gY292ZXJlZCBieSB0aGUgZGVzaWduIChhcyB3ZWxsIGFz
IHNvbWUgb3RoZXJzIHdoaWNoIGlzIGNsZWFyIGFmdGVyDQo+IHlvdXIgY29tbWVudHMpLiBJJ2xs
IGNvbWUgYmFjayB3aXRoIGFuIHVwZGF0ZWQgZGVzaWduLg0KDQpJIHRoaW5rIHRoYXQgY2FuIGJl
IGhhbmRsZWQgYWtpbiB0byBoeXBlcmNhbGwgY29udGludWF0aW9uLCB3aGljaCBpcw0KdXNlZCBp
biBzaW1pbGFyIHBsYWNlcywgbGlrZSBQMk0gY29kZQ0KDQpbLi4uXQ0KDQotLSANCldCUiwgVm9s
b2R5bXly

