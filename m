Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AB064A776A4
	for <lists+xen-devel@lfdr.de>; Tue,  1 Apr 2025 10:42:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.933640.1335528 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tzXC0-0007Lt-5g; Tue, 01 Apr 2025 08:41:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 933640.1335528; Tue, 01 Apr 2025 08:41:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tzXC0-0007JK-2y; Tue, 01 Apr 2025 08:41:56 +0000
Received: by outflank-mailman (input) for mailman id 933640;
 Tue, 01 Apr 2025 08:41:55 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=FaGF=WT=amd.com=penny.zheng@srs-se1.protection.inumbo.net>)
 id 1tzXBy-0007JE-NY
 for xen-devel@lists.xenproject.org; Tue, 01 Apr 2025 08:41:55 +0000
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on20624.outbound.protection.outlook.com
 [2a01:111:f403:2416::624])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 274c06f8-0ed5-11f0-9ea7-5ba50f476ded;
 Tue, 01 Apr 2025 10:41:53 +0200 (CEST)
Received: from DM4PR12MB8451.namprd12.prod.outlook.com (2603:10b6:8:182::7) by
 DM4PR12MB6544.namprd12.prod.outlook.com (2603:10b6:8:8d::6) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8534.54; Tue, 1 Apr 2025 08:41:45 +0000
Received: from DM4PR12MB8451.namprd12.prod.outlook.com
 ([fe80::b04e:2da5:7189:4c4d]) by DM4PR12MB8451.namprd12.prod.outlook.com
 ([fe80::b04e:2da5:7189:4c4d%6]) with mapi id 15.20.8534.045; Tue, 1 Apr 2025
 08:41:45 +0000
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
X-Inumbo-ID: 274c06f8-0ed5-11f0-9ea7-5ba50f476ded
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OKoAoGXkM+PV50GEaWmLRVErzU6oL9J0kckPgrAsfzsKrAqTcIcIdBlxGrOUGCJyd9i+yk+Ixn/GZ1k5lkQ9C8CviX7yYJJdhihAVWYvjRK5kdrGkjKGOb5CUMal6ZB7iz9GaJawR0Aa3gtLk41DPDdoV1jh2/DtUe2hVbEcwDseLvgJ23/ysYoYQ8qxSQLqVzlwV2oxagmO2mhhZEnmaMW4o1IDufxqEu1Husxe6/ST45t2eL8bDVv+qQoefJzdPccn30uIQHJs67mVzqCI9MwsCO5w2pwQL3HO/y9JMDhtRKg4t27KIr+ZK0jpiVysZ7e6qxyG2rXoNj40OUqpNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BNXJ/K7D+4UO5wnw40yPCH7jryRqnk8zYHkM2mCKS5s=;
 b=t2ekMYLZjuFBox/zh+rQX/uP21GRHjyMyVMk1oIsODIJCv8WKQl3WFMCBkC4DxmjVb4Qsr0UlmAkDbyAa0/fI6bxwyzLIOHvKZyJtHDqRDMNQCA5aZkUJtcMHUCPkVKwip0+KrdBKQIbu9g7WWIJTxwhqByd9ouFA0fT/SyZUDTlCzwXylPzB07EU9nHY9QW6p4ZY9l0LBiLVn3lPXgnq930yIHEGgc+VX2TQgAaNh/YS/Y/mcrCVXzpaK6UnCmxJ2uw50SdP5CdB23fS7qdM8NHSmK+mYghp8lH7p1fo3B4O6lngDGKXxlZIfLVU77Ng74EBa+aqsKn2aH7CuYqxg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BNXJ/K7D+4UO5wnw40yPCH7jryRqnk8zYHkM2mCKS5s=;
 b=lfgTdvCQrJi/pyYAK7NEAYyxzLEpzddvbgO9VFhFF1EkP/OI6CpqqhAycqSZxwcMUi5Tz5td0NL8aAx4tjubx7uPeuBhEZJVwth7Z4kpGg4WQcJkKb12NzHcsPVGKj89faZhLbgEgxjEbqFv5lqVr6SBnyE9KeXhzlM+IHc55yA=
From: "Penny, Zheng" <penny.zheng@amd.com>
To: Jan Beulich <jbeulich@suse.com>, Stefano Stabellini
	<sstabellini@kernel.org>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, "Huang,
 Ray" <Ray.Huang@amd.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
	=?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>, Anthony PERARD
	<anthony.perard@vates.tech>, "Orzel, Michal" <Michal.Orzel@amd.com>, Julien
 Grall <julien@xen.org>
Subject: RE: [PATCH v2 01/19] xen/x86: remove "depends on !PV_SHIM_EXCLUSIVE"
Thread-Topic: [PATCH v2 01/19] xen/x86: remove "depends on !PV_SHIM_EXCLUSIVE"
Thread-Index: AQHbnhNmXaX6/9Ps5keSZ4aq1y0sz7OJPdwAgAOSgQCAAbXbAA==
Date: Tue, 1 Apr 2025 08:41:45 +0000
Message-ID:
 <DM4PR12MB845170590A152B7AEF4D4153E1AC2@DM4PR12MB8451.namprd12.prod.outlook.com>
References: <20250326055053.3313146-1-Penny.Zheng@amd.com>
 <20250326055053.3313146-2-Penny.Zheng@amd.com>
 <alpine.DEB.2.22.394.2503281655590.563920@ubuntu-linux-20-04-desktop>
 <6b3c3baa-331c-44fa-9085-9b0bf72c62a1@suse.com>
In-Reply-To: <6b3c3baa-331c-44fa-9085-9b0bf72c62a1@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
 MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_ActionId=edf9968a-536f-4ae0-969c-cffbd64106b9;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_ContentBits=0;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Enabled=true;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Method=Privileged;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Name=Open
 Source;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_SetDate=2025-04-01T08:39:29Z;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Tag=10,
 0, 1, 1;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR12MB8451:EE_|DM4PR12MB6544:EE_
x-ms-office365-filtering-correlation-id: e022503f-549f-4a8e-9565-08dd70f908e3
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|376014|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?VVFuOWtMVTVxSHA2QXNUNjk3KzFFcFlkdTZzYjJBc0pjY3ZiZXZRMWFSQ1dC?=
 =?utf-8?B?Umx6dVk2NlArdG5uRnQrN1I2TmRjY01vVjkvWmFVRGFPd245OHJpb2hyaUxU?=
 =?utf-8?B?Yk1paDRBaHlFWjgxSDNuakowZXZJaVUwMGQzbnU4OVFtbUp4a0Nrc3pFa0hr?=
 =?utf-8?B?VDJ2WnFYaHN3cWhLejVtUjFQUjlOQXVtdzA3YUk0QStrd3RMRTVWTm9CSndv?=
 =?utf-8?B?aFlZQVducVluVkJNNEZrdVMyNVAvTzFGQVByWGtpdC9xcnFncXNxNWtONll6?=
 =?utf-8?B?dHZnZjRxL01xUjJsWEhQZThuTjk3V0FIYm9EWk9wME03eVNSbjRmTVVWZFJL?=
 =?utf-8?B?VGR3Z3gvY2hHUXpMZ0JJdElWRFNnL2RpTEdFVEY1UlpBY2NVV0tBbmgvdllK?=
 =?utf-8?B?eHo3VGhZV2tpWW9zY3lZS2JFVkt5Y2NWV2lTMUovell2UW1rNytMZXhnTlZt?=
 =?utf-8?B?cG1yV0ExdzkxeGhyeUFhckFUYUdSK05NenNkSnBxcDVKNHd0cTZCVlRUOXpa?=
 =?utf-8?B?S2I4WHlQOW81UVgwR2RYUlhRTENjdEM4Ylg0K0pudSttaThqcThZNVRxYUxV?=
 =?utf-8?B?VHhnblVOSW1EZVNyOEI5V1hGRUVzd0VkeXI5YXlFUlU1Z2t5NTFPdFAvQTlB?=
 =?utf-8?B?TXFwK1I1ZjZWWEJnM25DYWkyQzZnNG1MdnI5TURKeGZKeVlkcnRHUWszWmxB?=
 =?utf-8?B?bGRTL2FRZG9vRW5sSFJUVFlTTmYyblE4MjVRM3RrSEdNWkhJS1Y1anZ1ejF5?=
 =?utf-8?B?U2lESVQxdUIydXpDd21IWXNaWk5udEJYMzZuK2NWMTVIbmtlbGhCeXRLQmlX?=
 =?utf-8?B?cDlOWDI3eFBSc3gyZG5RdTBlbGJ1QTJTVU1wUUd6SGNZSzN5dVpvMC9NNmtQ?=
 =?utf-8?B?cHk0TTRXRjJjTjdBMVQ5cm0yQUVkNy95cTNPb0VVNHlhKzkwQ2dKSC9RTHNh?=
 =?utf-8?B?S2ZTVWl3ZGo1NW12bWM1K3owNFd2bGNJRUFtbjBGY015M2xnOGxoc2t3WVJm?=
 =?utf-8?B?WEUxWHFZQjJVZk5TQjJEMXBiSzhpTXUxZ3Y5ZVdxdm0yN1liSHl0c000Mk1U?=
 =?utf-8?B?VnM5K3UxNHRvTUM1Rk1Rek95KzJ3dE54bG9UVUQxUTRSU1E4Nmx4ZENzQjdF?=
 =?utf-8?B?blpLb2pJYVJQNTdRZjJDRG5wbmIrZ3F2eENVT0JvMDBvY2UzUXRhRlkwWmVo?=
 =?utf-8?B?OU9sbDhFU2NNQVNQUlpMUkZiQ2tBRDU1TlVva1FVeHUxREpOQWtWdkRERzdU?=
 =?utf-8?B?NUFCdmRIbERvUkE0bnovemVvNi9QOUQyVE1vSmRYWWd4VE95eDdMM25tVkJK?=
 =?utf-8?B?MjVVaFVhVU41UFBNZ3hjL0NLblZFSVE1VzNXbzNMVFJKYkVnVzZiSFhiNm5C?=
 =?utf-8?B?UTIrU1ZZTmlkWVFQMlFnRXFPekI4RTJFc2dxNm9ORklxQXRkSmxMbkh2dDhT?=
 =?utf-8?B?WkFsa0xCR0ZVNThWeHdMeStDb3hPbjZsbDFtL1NBT2F3UGRHbFRJcnRUU0c1?=
 =?utf-8?B?MVlhRHVpbGVNdUJYek9NdmVudjFzeXkydnFOOWo1U2FiUi9IM1V2ODBJUUtE?=
 =?utf-8?B?L01lOHdEMDJhaHF2SG9zUEpjSzAxVUZ5dmt4NkRSb1pVSU1aMzNZVGZhRnFy?=
 =?utf-8?B?K0U0Z1hSdEUzN2o5RTVkU0FkSjNwdUxOalR6eFBGdTR5MStKeUhDaHd4K25J?=
 =?utf-8?B?RmxrNFRwSy9YYk9rcTFKcmx0SDhhdS9TNGdHUlNmOXcwS0dkdXVwM2ZDUkEx?=
 =?utf-8?B?RXpZZjRob2JNZmdaaWJjZ3dZeE04MTF4ait5ZHVpZFVlTDFDeis5MjhuSysw?=
 =?utf-8?B?eGxxS0RqVnh4Q0s2cnZIYWprUk9iNHZLL2dXaUI0bi9Tdy9xckxKcTBNdzFu?=
 =?utf-8?B?TzZPSTZTcVpTanVMOWJOVmtzTzNjRW9FSWs3Mi8xTHlwYmc9PQ==?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR12MB8451.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?VHJGdnc5RjhrQzhXUmdtcW5iS2pTNDJZdENuZGRaNC9GY0U2MEp3cG1NODZI?=
 =?utf-8?B?Tk5ydU80UFIxdHFQaFhPak9CRWR4NGZ2MVRlMVFIRk01MGcvdUx0bkdtRUly?=
 =?utf-8?B?TGJlU2haQVhXS1JsTUk5VHdvdU92SGNSdHYva1RHOFhicUlZNU1TTHJIUnQ4?=
 =?utf-8?B?TGNpcXg5YzNveWwvRTQ4Tms2YzdaYldwRTgxSFRBdTBaMGxUZk9xaDg0SGd5?=
 =?utf-8?B?TlI2cEFadXBnREtVZFlqaVZxYTB0cnBGU1Y1ZVJJbEtML2c4RVZZc2YwQ2c0?=
 =?utf-8?B?OXlYN1hQSFEwdGgrTzM2WWdQZHZ3cnpJSUZwRWxIalJ1ZkJ6T0wzRXJjRnc3?=
 =?utf-8?B?clRwMTlHdGozdmczTUJEVjBDZ0tTeTBxYXh4REM3WFV4M3NYWlVjWll1SW9u?=
 =?utf-8?B?N0V4SEpvbE1HaS83aHRMZFEyUm9FdmdkcDNwRUVPZmwxMTB4Q21iRkN0dTF0?=
 =?utf-8?B?MGlaMnZack1xV214N2p5T01aSEM4UWt6UUdRQW5ySmdqcE5CR0E2Z3JrTDd2?=
 =?utf-8?B?dW4xOCtqcXZyR2ZGTDNUZWh5UEg0RC92aHgrV0NFQlhCYWcrSUl5L1BmZjNi?=
 =?utf-8?B?N1MwbVJ5Z0N4bnlLdjltOXcxWGN1cUw4YzlsZ1NIMU9xL21YenIwMU1YampZ?=
 =?utf-8?B?eDhiZHE0cGlWUTVkbmI0ZUd1ZEpnbkNQc0tUMHprbm5mVWd3aGhrY1ViY0dF?=
 =?utf-8?B?WVdsd2R0STNFVjhYdkNGOExZT3o5V1ZyMEY4bUVIRnVIa2ozc0FMZisreGhx?=
 =?utf-8?B?ZkI3WEtQNUN3Z2pwcVJPWDhucEdrMFZXc3cwZXNmOXpidVF2NkpQTzRXK0lZ?=
 =?utf-8?B?QzUwMWNFL0loUG9qUG1XaXkwZXl3b01JRUp3K3F5VVEvWlgvTS83K1BDTWta?=
 =?utf-8?B?V3k5RU1TRWRvQTdEWCtNQThVZkZnWlF6YmFNRmljcSswUmRPNVJXVVN6eFht?=
 =?utf-8?B?MzhmR3hZaWdaUFVNTC83Q292MzI5Vk5FYUl4ZmIzMS9jOFFSQlk4c2J2S3Zw?=
 =?utf-8?B?K1JmMmtabGdzUzRXc3UyaWEzSzZoV1BYRWxaOWpWcTdXZG5vQXF3ejd3OXJX?=
 =?utf-8?B?bmY0b2pGSnNpUzN4U3hlVEl6ZU1mUjNIb2JIMUxCMGhZM1lIM3NIZ2NsdW1l?=
 =?utf-8?B?YnpPbEhib2NTakg3ckR6VitESHd0cFFQMjdpVURZWWdHOFdKQzRRZFBHeXFZ?=
 =?utf-8?B?MVZmRkZibkF5QWI4WndYS2ZLdVZuTVdTblJoeE9MbGJxNG95cm9kaVFSOElm?=
 =?utf-8?B?U2p5NTlVKzB4c05pKzVhSGdDdW5TN0RmMDljMGJpTm5qdXRaUGtlQ2lZVXBr?=
 =?utf-8?B?SVFlVmkrUDZPTHZNYnh3elpsd3NTRUVsaDJmd2hlZFR5ZXZkNUpUY3FZZXFY?=
 =?utf-8?B?L3pwTzVKemVxRGlsL3FVbWcxVzhaaC9UeEczdGFDU3RHNzZndmxaUC9JYVlY?=
 =?utf-8?B?U0dnOUR0dkNjUzNrcU80ZU9JZWlqY0V5cnpBdFA1QUZaRFNRMmFvR2V3TzE5?=
 =?utf-8?B?akRMSmlkNkMxZitTQnZWWlJMRzZSaFR6L3QxdER5YmFYSWI2emJkWTNkUjNi?=
 =?utf-8?B?MnhNdkxxWXBsRDFhYmFNRmYyUjUydzhzdXZyQzBtSFlVQ3Z3dWd2Q1ZucDRq?=
 =?utf-8?B?eUNZS096WWtJK082MzdKeXJtR1FyQnlVSGVOd01zT240dlQwSjdYcVM5c3RU?=
 =?utf-8?B?dkNYS3JVc1JmbjRNQ1hVZXhkUkJlek5UN2RYMW9HRUI2UDJycmZiV0VsWjF6?=
 =?utf-8?B?T2pGU3YvTnVQRTQvZDNmM0Y3SzFnTHBlVGNSS1Z3VU92SSsydi9vY1NIUUQ4?=
 =?utf-8?B?WDVpSU9aK0pQZGVGZmppaHVJQjR0WGhsbDhTRnMwTWthU3NtMkRUQXIwSTk3?=
 =?utf-8?B?SnFzcGVBVjRBVlorWmUzVzZLWWdjK0xSTFdOTnVUQjI4RmswTXA2akdhWVg0?=
 =?utf-8?B?ckp6bXZnRkh0RWtpRm1LMDNRZG1DYlNUMjRJWmIrN2lNTFB4cGpmeHgvQ0h0?=
 =?utf-8?B?bC9QRjNPcEVKRWpHUElReEp2anNtS2JvZU9CeHVUMjJBVE8rZy96eHFMREtJ?=
 =?utf-8?B?YmQ3WUhzODBISU5vb0s3RVBieUpmV1JXTkc3bmw1YUVrZmJlamIzT29jbHpU?=
 =?utf-8?Q?tKvk=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB8451.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e022503f-549f-4a8e-9565-08dd70f908e3
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Apr 2025 08:41:45.4274
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Ng5wpaR6HjUQw6vU0f7ESaeLOqZXtODqS8N1H1I3mF6dtMIombd06LfJT5pa11uBrT7qor0DdDy+xpCUHft5wQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6544

W1B1YmxpY10NCg0KSGksDQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTog
SmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPg0KPiBTZW50OiBNb25kYXksIE1hcmNoIDMx
LCAyMDI1IDI6MzAgUE0NCj4gVG86IFN0ZWZhbm8gU3RhYmVsbGluaSA8c3N0YWJlbGxpbmlAa2Vy
bmVsLm9yZz47IFBlbm55LCBaaGVuZw0KPiA8cGVubnkuemhlbmdAYW1kLmNvbT4NCj4gQ2M6IHhl
bi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZzsgSHVhbmcsIFJheSA8UmF5Lkh1YW5nQGFtZC5j
b20+Ow0KPiBBbmRyZXcgQ29vcGVyIDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tPjsgUm9nZXIg
UGF1IE1vbm7DqQ0KPiA8cm9nZXIucGF1QGNpdHJpeC5jb20+OyBBbnRob255IFBFUkFSRCA8YW50
aG9ueS5wZXJhcmRAdmF0ZXMudGVjaD47IE9yemVsLA0KPiBNaWNoYWwgPE1pY2hhbC5PcnplbEBh
bWQuY29tPjsgSnVsaWVuIEdyYWxsIDxqdWxpZW5AeGVuLm9yZz4NCj4gU3ViamVjdDogUmU6IFtQ
QVRDSCB2MiAwMS8xOV0geGVuL3g4NjogcmVtb3ZlICJkZXBlbmRzDQo+IG9uICFQVl9TSElNX0VY
Q0xVU0lWRSINCj4NCj4gT24gMjkuMDMuMjAyNSAwMDo1NiwgU3RlZmFubyBTdGFiZWxsaW5pIHdy
b3RlOg0KPiA+IE9uIFdlZCwgMjYgTWFyIDIwMjUsIFBlbm55IFpoZW5nIHdyb3RlOg0KPiA+PiBX
ZSBpbnRlbmQgdG8gcmVtb3ZlIGFsbCAiZGVwZW5kcyBvbiAhUFZfU0hJTV9FWENMVVNJVkUiIChh
bHNvIHRoZQ0KPiA+PiBmdW5jdGlvbmFsbHkgZXF1aXZhbGVudCAiaWYgIS4uLiIpIGluIEtjb25m
aWcgZmlsZSwgc2luY2UgbmVnYXRpdmUNCj4gPj4gZGVwZW5kYW5jeSB3aWxsIGJhZGx5IGFmZmVj
dCBhbGx5ZXNjb25maWcuDQo+ID4+IFRoaXMgY29tbWl0IGlzIGJhc2VkIG9uICJ4ODY6IHByb3Zp
ZGUgYW4gaW52ZXJ0ZWQgS2NvbmZpZyBjb250cm9sIGZvcg0KPiA+PiBzaGltLWV4Y2x1c2l2ZSBt
b2RlIlsxXQ0KPiA+Pg0KPiA+PiBbMV0NCj4gPj4gaHR0cHM6Ly9saXN0cy54ZW4ub3JnL2FyY2hp
dmVzL2h0bWwveGVuLWRldmVsLzIwMjMtMDMvbXNnMDAwNDAuaHRtbA0KPiA+Pg0KPiA+PiBTaWdu
ZWQtb2ZmLWJ5OiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+DQo+DQo+IFdoZXJlJ3Mg
dGhpcyBjb21pbmcgZnJvbSwgaWYgSSBtYXkgYXNrPw0KPg0KDQpJIHNhaWQgaW4gdGhlIGNvbW1p
dCBtZXNzYWdlLCB0aGlzIGNvbW1pdCBpcyBiYXNlZCBvbiB5b3VyIGNvbW1pdCAieDg2OiBwcm92
aWRlIGFuIGludmVydGVkIEtjb25maWcgY29udHJvbCBmb3INCnNoaW0tZXhjbHVzaXZlIG1vZGUi
WzFdLg0KU28gSSB0aGluayBJIHNoYWxsIGFkZC1pbiB0aGUgb3JpZ2luYWwgYXV0aG9yLCBpZiBp
dCBpcyBub3QgdGhlIHJ1bGUsIEknbGwgcmVtb3ZlIGl0Lg0KDQo+ID4+IFNpZ25lZC1vZmYtYnk6
IFBlbm55IFpoZW5nIDxQZW5ueS5aaGVuZ0BhbWQuY29tPg0KPiA+PiAtLS0NCj4gPj4gIHhlbi9h
cmNoL3g4Ni9LY29uZmlnICAgICAgfCA2ICsrLS0tLQ0KPiA+PiAgeGVuL2FyY2gveDg2L2h2bS9L
Y29uZmlnICB8IDEgLQ0KPiA+PiAgeGVuL2RyaXZlcnMvdmlkZW8vS2NvbmZpZyB8IDQgKystLQ0K
PiA+PiAgMyBmaWxlcyBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKyksIDcgZGVsZXRpb25zKC0pDQo+
ID4+DQo+ID4+IGRpZmYgLS1naXQgYS94ZW4vYXJjaC94ODYvS2NvbmZpZyBiL3hlbi9hcmNoL3g4
Ni9LY29uZmlnIGluZGV4DQo+ID4+IDE4ZWZkYjJlMzEuLjFlNWRmODRiMjUgMTAwNjQ0DQo+ID4+
IC0tLSBhL3hlbi9hcmNoL3g4Ni9LY29uZmlnDQo+ID4+ICsrKyBiL3hlbi9hcmNoL3g4Ni9LY29u
ZmlnDQo+ID4+IEBAIC0xMzcsNyArMTM3LDYgQEAgY29uZmlnIFhFTl9JQlQNCj4gPj4NCj4gPj4g
IGNvbmZpZyBTSEFET1dfUEFHSU5HDQo+ID4+ICAgIGJvb2wgIlNoYWRvdyBQYWdpbmciDQo+ID4+
IC0gIGRlZmF1bHQgIVBWX1NISU1fRVhDTFVTSVZFDQo+ID4+ICAgIGRlcGVuZHMgb24gUFYgfHwg
SFZNDQo+ID4+ICAgIGhlbHANCj4gPj4NCj4gPj4gQEAgLTE2OSw3ICsxNjgsNiBAQCBjb25maWcg
QklHTUVNDQo+ID4+ICBjb25maWcgVEJPT1QNCj4gPj4gICAgYm9vbCAiWGVuIHRib290IHN1cHBv
cnQgKFVOU1VQUE9SVEVEKSINCj4gPj4gICAgZGVwZW5kcyBvbiBJTlRFTCAmJiBVTlNVUFBPUlRF
RA0KPiA+PiAtICBkZWZhdWx0ICFQVl9TSElNX0VYQ0xVU0lWRQ0KPiA+PiAgICBzZWxlY3QgQ1JZ
UFRPDQo+ID4+ICAgIGhlbHANCj4gPj4gICAgICBBbGxvd3Mgc3VwcG9ydCBmb3IgVHJ1c3RlZCBC
b290IHVzaW5nIHRoZSBJbnRlbChSKSBUcnVzdGVkDQo+ID4+IEV4ZWN1dGlvbiBAQCAtMjc5LDEw
ICsyNzcsMTEgQEAgY29uZmlnIFBWX1NISU1fRVhDTFVTSVZFDQo+ID4+ICAgICAgQnVpbGQgWGVu
IGluIGEgd2F5IHdoaWNoIHVuY29uZGl0aW9uYWxseSBhc3N1bWVzIFBWX1NISU0gbW9kZS4gIFRo
aXMNCj4gPj4gICAgICBvcHRpb24gaXMgb25seSBpbnRlbmRlZCBmb3IgdXNlIHdoZW4gYnVpbGRp
bmcgYSBkZWRpY2F0ZWQgUFYgU2hpbQ0KPiA+PiAgICAgIGZpcm13YXJlLCBhbmQgd2lsbCBub3Qg
ZnVuY3Rpb24gY29ycmVjdGx5IGluIG90aGVyIHNjZW5hcmlvcy4NCj4gPj4gKyAgICBGZWF0dXJl
cywgbGlrZSB0Ym9vdCwgc2hhZG93IHBhZ2UsIFZHQSwgSFZNLCBIeXBlci1WIEd1ZXN0LCBldGMs
DQo+ID4+ICsgICAgYXJlIHVuYXZhaWxhYmxlIGluIHNoaW0tZXhjbHVzaXZlIG1vZGUuDQo+ID4N
Cj4gPiBJIGRvbid0IGtub3cgaWYgd2Ugd2FudCB0byBhZGQgdGhlc2UgdHdvIGxpbmVzIG9yIG5v
dC4gRWl0aGVyIHdheToNCj4gPg0KPiA+IFJldmlld2VkLWJ5OiBTdGVmYW5vIFN0YWJlbGxpbmkg
PHNzdGFiZWxsaW5pQGtlcm5lbC5vcmc+DQo+DQo+IEkgZG9uJ3QgdGhpbmsgd2Ugc2hvdWxkIGFk
ZCB0aGF0LiBJdCdzIGFsc28gd3JvbmcgZm9yIHNoYWRvdyBpbiB0aGUgZmlyc3QgcGxhY2UgKHdo
ZXJlDQo+IGl0IHdhcyBhIGRlZmF1bHQgb25seSBhbnl3YXksIG5vdCBhIGRlcGVuZGVuY3kpLg0K
DQpBY2ssIEknbGwgcmVtb3ZlDQoNCj4NCj4gSmFuDQo=

