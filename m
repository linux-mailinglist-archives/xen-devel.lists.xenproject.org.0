Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 72339A6DEE2
	for <lists+xen-devel@lfdr.de>; Mon, 24 Mar 2025 16:38:47 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.925835.1328715 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1twjsn-0002HW-Az; Mon, 24 Mar 2025 15:38:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 925835.1328715; Mon, 24 Mar 2025 15:38:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1twjsn-0002F2-7y; Mon, 24 Mar 2025 15:38:33 +0000
Received: by outflank-mailman (input) for mailman id 925835;
 Mon, 24 Mar 2025 15:38:31 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=f4s0=WL=dornerworks.com=Nathan.Studer@srs-se1.protection.inumbo.net>)
 id 1twjsl-0002Ew-2Q
 for xen-devel@lists.xenproject.org; Mon, 24 Mar 2025 15:38:31 +0000
Received: from USG02-CY1-obe.outbound.protection.office365.us
 (mail-cy1usg02on061c.outbound.protection.office365.us
 [2001:489a:2202:d::61c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 06ab85d6-08c6-11f0-9ffa-bf95429c2676;
 Mon, 24 Mar 2025 16:38:28 +0100 (CET)
Received: from SA1P110MB1629.NAMP110.PROD.OUTLOOK.COM (2001:489a:200:195::20)
 by PH1P110MB1700.NAMP110.PROD.OUTLOOK.COM (2001:489a:200:18e::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.31; Mon, 24 Mar
 2025 15:38:21 +0000
Received: from SA1P110MB1629.NAMP110.PROD.OUTLOOK.COM
 ([fe80::4c02:35de:2909:2bea]) by SA1P110MB1629.NAMP110.PROD.OUTLOOK.COM
 ([fe80::4c02:35de:2909:2bea%4]) with mapi id 15.20.8511.031; Mon, 24 Mar 2025
 15:38:20 +0000
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
X-Inumbo-ID: 06ab85d6-08c6-11f0-9ffa-bf95429c2676
ARC-Seal: i=1; a=rsa-sha256; s=arcselector5401; d=microsoft.com; cv=none;
 b=VqZtTKpABAIYSleuwmnMHhNMnyIFsbOpfJYC2+XTTtZ4MpxZ+oCXdKcHtwEf7G0MZLuv6mYz/J68XsW6kMW5xlrgwJEbpL/2VUae5RuiAgScmRK8gad7kZnNcNChd/PW/p0iRHA5ZlA6KfydvpwD5ynLjIBxmix0ZOBEJHfsWSvaNbHNq7HzjKyALDIZPP6KEa3chpI+k44RD5Jl+zb+IEJfkJFy2kl8asfUk1QP6PQrJ24Y0k0ES9hckzeKGKrZ9WtAupIs9Lo/2OHSuCP4/7q3p+URG7zFfVhdIvA5ALOcWU0WYavZD90N6/67LBKZibC0fNEtupX+CqxtfAe/NQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector5401;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vMvSwHJWGCUu+Hy1vhGJbsbE9FBQNQNYLG/OUhrwbqs=;
 b=aCldGLhveis+kiVWK9RN5W5Uh1JNV3Uu1rrcSeuBTGp4B8NgUlfY3oWEzPJvV3bPvxCQu6pr3OK2UZbuKh1EsaqlXSJZ5ii+rLTrjJWV3yzrOReGGQ63mzI70RfDhIf+9kRd9pv3eCf4CQdL0MedABlXGUDYDp75HFmkBzN0ErFKzxHBhrMqoF0n27fcV0XsjMDalPAmL8wLNZCc3+7UkThh4xb7eKoJhMf6AacTUqbkzXFeLrEjkBVhUoBRsynO4XLo/XrSC6abxU9wV33C2td8W3Pwg5x9D1pft31WVj6NP/fGUDJaaBZtdYzxCmdvkHRCjLDJy9heH5OXIuEQLw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=dornerworks.com; dmarc=pass action=none
 header.from=dornerworks.com; dkim=pass header.d=dornerworks.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dornerworks.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vMvSwHJWGCUu+Hy1vhGJbsbE9FBQNQNYLG/OUhrwbqs=;
 b=W3t0gQpgiH/cBCuoXcYtFtIMGkfB5Xfppn7fztyJQOxxS2D6FctozoCW24pUx+iqAiOk5T/bJh2XPIIPwuj2NK+pBGO8AFaKSbJG0egHhMROnqPDuLIIKBoQAgWj7uMuFZ9NWMa5Cfl5jW4QMU+m2cvb/RK0UJ5bTBQq+ReOiMuSJli8WrjN+eSVcgPKiWxqM0wAx3YqLSOKqmyw13wmVsV1UGfU3Ltrh+58AhDh4At1mDWqy1FmqZH7MUTTkz1Pw7bM4C2B3gYM+Vp4+4mv7MU1p9Y9DlwdnFi5D8UW//TcEhkiexd4PUNmUEIJV6wQuD/waU7kXNbNpGdyG7SOWw==
From: Nathan Studer <Nathan.Studer@dornerworks.com>
To: Jan Beulich <jbeulich@suse.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Stewart Hildebrand <stewart@stew.dk>
Subject: RE: [PATCH v2] arinc653: move next_switch_time access under lock
Thread-Topic: [PATCH v2] arinc653: move next_switch_time access under lock
Thread-Index: AQHbnMukIEKfBYQg6ka2nNYRWSyAuLOCay7A
Date: Mon, 24 Mar 2025 15:38:20 +0000
Message-ID:
 <SA1P110MB1629984ED4398B85D2485A8BF4A4A@SA1P110MB1629.NAMP110.PROD.OUTLOOK.COM>
References: <b18e523d-89a6-482d-b2ce-a5576578ff58@suse.com>
In-Reply-To: <b18e523d-89a6-482d-b2ce-a5576578ff58@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=dornerworks.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SA1P110MB1629:EE_|PH1P110MB1700:EE_
x-ms-office365-filtering-correlation-id: 59570630-b852-412d-2796-08dd6ae9e806
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam:
 BCL:0;ARA:13230040|41320700013|1800799024|366016|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?V1JtRFNiMm8wZUVwMkZSWkc4TnZyMS8wV2ZzeVZta0EyV3c2YWU5cDdrMVND?=
 =?utf-8?B?bGhiOWhwUmFKbXZXN2xaQnllaXlFR0dFMFh5anZYOERvU3hPVXloKzJhOWxR?=
 =?utf-8?B?dkg0czF4OU1Hd3lkbkJZVE0rdlhwYmtJUFNBZUZac0JGQm90RFZiZXJWam0z?=
 =?utf-8?B?UEs1WVBCSzNwRGtwTlN4SEh4Z3d2K1pIRG5pVW52UUxQZUd6aHpkMW5tN3I3?=
 =?utf-8?B?bVhKSmhQeVJLeHk3QUhoL00rVDRTY2M2Mm54Uk1hcG4vTXgwOThDV0gzbHps?=
 =?utf-8?B?MGt4VS81MVNkUDQyL1VTUmZJYzJmMVdDcFhrekI1ZFZuVGpPTFRjVTcvRGJV?=
 =?utf-8?B?Smt6dnhVSXJOZkhDV2M1Q2xVOE56VkUwWDUyUndOZnQ2eCt3UTNjSmNOSUNU?=
 =?utf-8?B?L0xjOWhhZHk3LzF1ZDNpZkRwRWNEbEtmWVk3SlhZQ0dxckVid21uZkFabEd6?=
 =?utf-8?B?anJQYmQ5eXMrdGZ1anB1YkJWWlV2YTlHS0p4Wmg4bGZiOUU2cTBzNXBLQVEr?=
 =?utf-8?B?NWVyNllnc0JBRnQwMVJjVE9TUHV3TUNzUjBvekQyQnluRXRWZDZGNTVzWW1u?=
 =?utf-8?B?WWJDMmE4ZVE5dkIrbkZWS1BGQkNLSTk3OU12RXpjTDdCWmJnRFhaYk9IZnQr?=
 =?utf-8?B?MHBzWlhpNC9MQ1BndUQ5TEVIQmhqMkxWYWxXZjN3TmJTZll2aThua0cvUGVm?=
 =?utf-8?B?cytySEt5eHR0Q0lRaTRMYVJ2UktsVmZTM2wyZ3Q4U3ZQbHZGNVJoZjlPNWcz?=
 =?utf-8?B?UUhLaWR2ZGc3UFBBSjVhOTc3MjhXS3AvWmZrd040Q2pqMGlpMXNlUU5POUpF?=
 =?utf-8?B?cGFxd2J0RlAvSjY0dWllOVZkTmVHOXhwVnd5YXBzREJETFI2SEd3a1VaUHNM?=
 =?utf-8?B?NkpOZXJ4LzJDRDN0OUQ1cC9Gci9GcTJiV0duY01wWmdTSTVtYW5kYWQ1UXcy?=
 =?utf-8?B?SnZBdThkQ3FSWHcwNmw3TTk2UXI0ZExiYysrT3JVNkZOOXdER3ZDR0NhT1Uy?=
 =?utf-8?B?S3VQQThkZElWaUlWT2lwOHVLYjZuR0hpdkk3THovM3JzTTE0R0JQb0M3Ylh6?=
 =?utf-8?B?blhrbUxSaHJNa1JkMUY0Mm1nNTdBbmN0eXhFWi9RMER0QTdtQk8rbnQ5QjF2?=
 =?utf-8?B?ZnNHSVdoZFR2WGt4U3pNOFJDYnE5RWNYdXU5cExTanYyeURkRWRNWTZsS0I5?=
 =?utf-8?B?bEFqSjFGcWx0TXhEeGVwNElyMjZIb3JCbTJmdG82eExDRDNpVUQzdTlPcDZo?=
 =?utf-8?B?dkZWeC9pMEwrZDFnS3ZiQWxwMDhtL09qM2JmQkdMb01ENnYrbXg0bSt6OXgx?=
 =?utf-8?B?bk9uQnI1eDJaUEJlUWhDYjY1bFlNLy9qQUUyZDFHVlU1Z01HaDdtalp4YS9U?=
 =?utf-8?B?VW9mWEpuUlNVaDVSUFRZNGsvNzhJQ0E4dHpQZmMzMHRHMlNWRG96TzNjcExF?=
 =?utf-8?B?UktnZEMwYUlOT05OVHR5OUdQWXBXM0xZeFVFQmtwZXRHakw2dnlqTEgxN3RW?=
 =?utf-8?B?cjU5WWxUcGR1OWZMY3NSYUFpLzN6UkV5V1NnbjFZNkV6cFcvamQ5N0wyem0v?=
 =?utf-8?B?Q3p5UjhQcGpUU0RJWlVLcG5QZVZoVHFSNGhVMmh5cWRZU2h3dWJnVDdLeGdw?=
 =?utf-8?B?b0tSbFJiM0VDVlU2TU9oeE1FSWRaVk5jKzZ5ZUdtQTRnVWZNc2p6K2dNQStY?=
 =?utf-8?B?YllZQUkwQzNOY1VpdnFaT3dGdjEzcUplRmlKUnFpQTBZZk9INWRKbDY0cllp?=
 =?utf-8?B?bDdOVHJkem1FcjBUS29TT3A4QzJjYmxXbXBXWDVLdUZMR1lFTGRweDV6OG9W?=
 =?utf-8?B?TjVSNVNsQ0ZCNkZqSEN4RGxQcERZZkZQaFRhWVYxR2ZweHQrNFlIUGJEWVFT?=
 =?utf-8?B?UFFUUVNUZDZESUhOei9rdCtSU1plWkNjeWFjUkpBVEl2OFpBanJpUy9sa3pP?=
 =?utf-8?Q?ZgqQpBcHG6sizsCnZtMlPl25aZkPjoZl?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA1P110MB1629.NAMP110.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(41320700013)(1800799024)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?KzRNTm4wWVFybzFvcUliQkY0c0RzWHlPcTA2R0dYWU1NWmRrdVVBODdTNlM1?=
 =?utf-8?B?dnFHSm9XdnhUT3F6aDhFc0IzSC9PUjJJRzhhTFVxZXVNdHI1RTc0M3dpUGZn?=
 =?utf-8?B?TUgwZUptQUZ2L1BReWVVL1JhUUdld1lDc09lc2RQRWhidW96VzVGSlA3ajdF?=
 =?utf-8?B?RE9PcFdEQ3YyTHFqTjJMRS9QcEp6KzYvejQ0Zmh5TVRuNXl4bGhNbHFDTE5l?=
 =?utf-8?B?QUhXYnp3eDhNbzBzTkl4dkF1RFJmWEQxa21paVlnUjduYjlsaWJNZzl1K3Ny?=
 =?utf-8?B?N0NtMXhGSDQyd3EwL3RtUTBFdG4va1ZWcHZTSlIyQVZOS1BOS2J2eUd4ZUJT?=
 =?utf-8?B?aVJTU0tqcEZHSWJrQ1NnREhOTk9yZ0FQVEw5T09TNDhOcnJLUVFaTm9CQ29h?=
 =?utf-8?B?MXphV2hjNlgyU2Npd2VJcnZlNEJCNERRYWx1cjBRSDkrQlI2OVhtSG1sWEUr?=
 =?utf-8?B?alNRUEwreE1FN0JsaGVQakNIUDgxcFF4c0orNmxvTjVRbVV3ZGVTU1J0MGpm?=
 =?utf-8?B?M1NCNWE1SHZXWmJUb0VJd1dCa01sSG5KRlJsOThITnQ1aUZpU0hENFpuS0cw?=
 =?utf-8?B?TG1LdGtiWHdCRFhWYjB0WW9NQ3Jnc2JOY2M1V25JS3ZkUnUwYXNvWHU5bXo5?=
 =?utf-8?B?LzFKUGcwd0tBWmtHT2tiUndVVVNYUElaRkphTEtldzFrWVQrckVOL2tkdmlV?=
 =?utf-8?B?YmJnTVFDaDAwNy83NWF6Y1RMQkZVYjlYdmRML0VqOE1QN1IwdWpsZ2pXWFhx?=
 =?utf-8?B?MzBZaHQwNTV5THgzeGlOS21LbUs2NTFURnUvNHo1TUZudFhwM0g2SklUcHd1?=
 =?utf-8?B?NFpRR3VDWEdjMzlEMXhLZ3BWcmY2Vm85QVlueWdVQTllSHIrN3MrOXZGVWhW?=
 =?utf-8?B?ZUd2NVRqM3NndU5qa3JIZjFyVHZ5Nkd6N0tjdU04ZlRyZWREMUdnRWNVQTVk?=
 =?utf-8?B?WERXY24rdWFJM3hEMmlGODVqZkpmVFpLTnUvcGJTOVJsMnRVWGtYM2JnWmRS?=
 =?utf-8?B?K01BYm4xMjBaTjZqWnMxa1h6M094RWZJV0pDZFlOdDVYVnlWUlZJcERoUkxL?=
 =?utf-8?B?aE51U1JYZ2RsL1VQVi9lMXhBd2hJSERlUytVQzUzMFRYVjRnZTVyaC8vT1Vr?=
 =?utf-8?B?TEtEM0gxb3F0T2dTZDJJTGhFUzZVOWs5RjdZa2V1ZEhlam05N0NraTBBaWl4?=
 =?utf-8?B?NnBuTE94UDRpQmJTeGRCZ2lGYSsveVQ0RUFQbWwwUjN2UUhzbDVTcEM4WXRn?=
 =?utf-8?B?KzMreFloWUxNc3doZmxSWWp1bHVRYWRidTYyQ3Y1djhJdHpLUkhraHZzeG5z?=
 =?utf-8?B?VGFVaGpGallCTGxPcjAvT2RkVTFuOVRYQTc1SktKeEc1OUwyemVxMTdqNHFk?=
 =?utf-8?B?SWo0REpxejljZC9ESUFUbFlpYkMwMk1MSFhUMjNQS0x1UnBFM1VDVFE3M0R1?=
 =?utf-8?B?YVBXdlNYLzkyTEFCMXl2NnZxQjY4WC9WS3VGRkpBbFl6ZnlDL2xVVTVzbGNZ?=
 =?utf-8?B?N21oQllyVEVyMExpTlM1NklGNXVhNlNKYlZpVGdtbi9wU0tYcDZUTXNjdWlJ?=
 =?utf-8?B?TWlUNG5SY2hhTWxQNStTai9YOFhKTFE5VjBLWU5Tb21UWm53Y1N4S3hJY1hC?=
 =?utf-8?B?dHRIWFhHNHQ0VFZQMXBELzBJOCtYK3g0V212Qmo0ck1RdytFK0RIc3RKcytn?=
 =?utf-8?B?S1BXVWFFZitQcWprczhVRkhGMlVIY1VvWkc1ZEovcFp5K3Y4ejk5MHhxU09R?=
 =?utf-8?B?S29vNHJ1OHE4L2M4aUdZT2RFWEFDdDZad1NqSVhtZStkVHlrclI4eFA5VCtS?=
 =?utf-8?B?U0lLS3RtdGNyY1VjU1VYWm92T09GYUNUS0E0SnNyUE5xMCt4UDhBNjVoUDNr?=
 =?utf-8?B?aHFBNkN3SnZSU2JYUEJ6SmxnZ011K1JqWE1kc056WjM0Zm1EVW11Uk1MTkc0?=
 =?utf-8?B?d0Z5Q0g5RHZ0OTBnUHU3TXU1L3gwTUN2Mm1aUlZjTG9uQngrN29GQzBhQlJn?=
 =?utf-8?B?dlE4NkN5VjBsMm12TW9VQUpOamV3Y3ZMUFdBUFhFbXdnK0x1NVpBNUluN0po?=
 =?utf-8?Q?R3rj4j?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: dornerworks.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA1P110MB1629.NAMP110.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 59570630-b852-412d-2796-08dd6ae9e806
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Mar 2025 15:38:20.8740
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 097cf9aa-db69-4b12-aeab-ab5f513dbff9
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH1P110MB1700

T24gMjQvMDMvMjUgMTA6NDcsIEphbiBCZXVsaWNoIHdyb3RlOg0KPiBFdmVuIGJlZm9yZSBpdHMg
cmVjZW50IG1vdmVtZW50IHRvIHRoZSBzY2hlZHVsZXIncyBwcml2YXRlIGRhdGEgc3RydWN0dXJl
IGl0IGxvb2tzDQo+IHRvIGhhdmUgYmVlbiB3cm9uZyB0byB1cGRhdGUgdGhlIGZpZWxkIHVuZGVy
IGxvY2ssIGJ1dCB0aGVuIHJlYWQgaXQgd2l0aCB0aGUgbG9jaw0KPiBubyBsb25nZXIgaGVsZC4N
Cj4gDQo+IENvdmVyaXR5LUlEOiAxNjQ0NTAwDQo+IEZpeGVzOiA5ZjBjNjU4YmFlZGMgKCJhcmlu
YzogYWRkIGNwdS1wb29sIHN1cHBvcnQgdG8gc2NoZWR1bGVyIikNCj4gU2lnbmVkLW9mZi1ieTog
SmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPg0KPiAtLS0NCj4gVGhlIEZpeGVzOiB0YWcg
cmVmZXJlbmNlcyB3aGVyZSB0aGUgbG9ja2luZyB3YXMgYWRkZWQ7IEkgY2FuJ3QgZXhjbHVkZSB0
aGVyZSB3YXMNCj4gYW4gaXNzdWUgaGVyZSBhbHJlYWR5IGJlZm9yZSB0aGF0Lg0KPiAtLS0NCj4g
djI6IFB1dCBjb21tZW50IGluIGFwcHJvcHJpYXRlIHBsYWNlLg0KPiANCg0KQWNrZWQtYnk6IE5h
dGhhbiBTdHVkZXIgPG5hdGhhbi5zdHVkZXJAZG9ybmVyd29ya3MuY29tPg0K

