Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FB3292CC62
	for <lists+xen-devel@lfdr.de>; Wed, 10 Jul 2024 10:02:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.756599.1165257 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sRSGi-0004B2-7j; Wed, 10 Jul 2024 08:01:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 756599.1165257; Wed, 10 Jul 2024 08:01:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sRSGi-00048M-3j; Wed, 10 Jul 2024 08:01:40 +0000
Received: by outflank-mailman (input) for mailman id 756599;
 Wed, 10 Jul 2024 08:01:38 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=KEHK=OK=amd.com=Jiqian.Chen@srs-se1.protection.inumbo.net>)
 id 1sRSGg-000480-3o
 for xen-devel@lists.xenproject.org; Wed, 10 Jul 2024 08:01:38 +0000
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on20623.outbound.protection.outlook.com
 [2a01:111:f400:7e88::623])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a0fb6d84-3e92-11ef-bbfb-fd08da9f4363;
 Wed, 10 Jul 2024 10:01:37 +0200 (CEST)
Received: from BL1PR12MB5849.namprd12.prod.outlook.com (2603:10b6:208:384::18)
 by MW4PR12MB7120.namprd12.prod.outlook.com (2603:10b6:303:222::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7741.31; Wed, 10 Jul
 2024 08:01:33 +0000
Received: from BL1PR12MB5849.namprd12.prod.outlook.com
 ([fe80::b77f:9333:3a5a:d285]) by BL1PR12MB5849.namprd12.prod.outlook.com
 ([fe80::b77f:9333:3a5a:d285%3]) with mapi id 15.20.7762.016; Wed, 10 Jul 2024
 08:01:31 +0000
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
X-Inumbo-ID: a0fb6d84-3e92-11ef-bbfb-fd08da9f4363
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=F8am/tgn08soBlwnVYGUuclqo8EOA8f4EEMIopFFLCO1aD7P0QOUukxltWEa1h8/lyGHbRvpfN/xMOh+yRl+VO3c1WrIBJuTkq4aWhGrRpLU5xCJy4syYCeCi2a7xhhvl9ynAMY5OwFFxa9zlUOJYZvsowEB2D5kOjRQjsgt1p4vaeqQPb/oCIi7OtQTF5Qtye2CmJTgrdDhjwNPU8ZEFnmWAXACgQidrlChkOSWMZQYjJwTkU4cS+WMwLBZqzYMdmvnEUAr4pws9BuDpI+jWL4kTxRYDORa7G/Wika93BY+7sC07Dgcff+BaENbhXmeS798NWYfCVRtlVr7YgkhnQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=v3zFQnRwW4a3vC0+neD4A9pAereLjZyjsAfAkfHRpuM=;
 b=eSndRa7M/oeXExKv0eeulc1YQ3Kn9PyU5cUu+M0bPuW3GNwf2tTMaEviG/M60GJOC+OMXP9OxkYBRpQXKXQKyt5yc4equfTSjhdUD8yk9U/a3zp3IXp7+utIhCwvczDnUtzIm7WpdSqUUFqNU2leuNAdbXhfklD26M/Q4w849I4CraAtXNOlwY4z0ANKFQFEsKtvcTmP818hM9MfbHY7ChHSMIPCHI8a2/H1BZE5zA1ajnWijtjM5WhBlbD0oq/sizG5hsUffScS/oa0VJ0QguuHcP/aox9/WWXjHvabdkt1iXghHtXiO66TLkPyTs5xCFfY3XSzhqZNup7eEltvBw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=v3zFQnRwW4a3vC0+neD4A9pAereLjZyjsAfAkfHRpuM=;
 b=JjherIyAickFCZq+Z8H5T9bwm/MSsuU18ih3fued9coLKeN9KH00jkgUCCO6qr1AskFqNxaasRucuQQFkLiqtuaax/fdCNPX0t3/jkDKUHggBsJrJbDvjkBTmCghN372M+T9WVuaRr0DfTxaeKPOqNL0NguBUNicNinK2uxPLWU=
From: "Chen, Jiqian" <Jiqian.Chen@amd.com>
To: Jan Beulich <jbeulich@suse.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?=
	<roger.pau@citrix.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Wei Liu
	<wl@xen.org>, George Dunlap <gwd@xenproject.org>, Julien Grall
	<julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Anthony PERARD
	<anthony@xenproject.org>, Juergen Gross <jgross@suse.com>, "Daniel P . Smith"
	<dpsmith@apertussolutions.com>, "Hildebrand, Stewart"
	<Stewart.Hildebrand@amd.com>, "Huang, Ray" <Ray.Huang@amd.com>, "Chen,
 Jiqian" <Jiqian.Chen@amd.com>
Subject: Re: [XEN PATCH v12 3/7] x86/pvh: Add PHYSDEVOP_setup_gsi for PVH dom0
Thread-Topic: [XEN PATCH v12 3/7] x86/pvh: Add PHYSDEVOP_setup_gsi for PVH
 dom0
Thread-Index: AQHa0SvX+81a6HzJk0WXqL6d0XE9YLHwIU0A
Date: Wed, 10 Jul 2024 08:01:31 +0000
Message-ID:
 <BL1PR12MB58499D36DFB961ACE8CE3FC5E7A42@BL1PR12MB5849.namprd12.prod.outlook.com>
References: <20240708114124.407797-1-Jiqian.Chen@amd.com>
 <20240708114124.407797-4-Jiqian.Chen@amd.com>
In-Reply-To: <20240708114124.407797-4-Jiqian.Chen@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-exchange-imapappendstamp: BL1PR12MB5849.namprd12.prod.outlook.com
 (15.20.7762.000)
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BL1PR12MB5849:EE_|MW4PR12MB7120:EE_
x-ms-office365-filtering-correlation-id: b18fc62b-295d-4e71-7e5c-08dca0b682cb
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|7416014|366016|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?RlA3eVZDUE8wVlVqSndKUEMxeTBBM1g5b1FPQlI1MFNYZWUxMmFiTEhZbk5C?=
 =?utf-8?B?M1huOGxhNDN0M0ZzTTh6bDVzNTJSOGVycXkveFJzMEdBTHdGQVl2bEtyWmh3?=
 =?utf-8?B?UHFrTmRyS2NZdm5LNm4rNlY0d3k1WERTU2sxdnp0UThYMWVKc21GMUdYU2hK?=
 =?utf-8?B?ckdnWTY2K2lPekZPbnRoS0JzQlRKUHVNMHl4RTNUSUU2aFB6MWxoTkd0bXpx?=
 =?utf-8?B?UmxEMTdkWWtncjJHY0l1K3lpOVQwc1hFZWwyK09oMnlVTXZPM1krLzVad3I3?=
 =?utf-8?B?aEw1REVQbUY1M01EUmlha2Q2VVdBdGp0OVVkQWxzR3dhdTNsclpyZmt3ZktV?=
 =?utf-8?B?M05YdzVuN0xlV3hDT0U0QlpKTGNub3RhVTZpdlZyMjdpck1CSDVOcnUzTndH?=
 =?utf-8?B?dlRnV3JUenR6bXJ2QWlGSmEwR0xLWDAxTm5Kbm9XTkpzZGxFKzJsVjcwTnE5?=
 =?utf-8?B?aFRmUUVYb3d2cGF4NWZQL3N0ZXNOdVVYaFJpM2JCTm1DQnoyYm0yVWVJUEY3?=
 =?utf-8?B?QnA0ejhBSlVIV2pEdUxzdjBKUDRtek5jY3dzY1BOK0plY3V6SlVtMUZvZ05Z?=
 =?utf-8?B?MC9admliSWw0UUtWQWRxMlRnV0dRVDgwaTE4c3M0ZUNtdXNTeVJsaEh2TkFn?=
 =?utf-8?B?a3UyaTV6K1JVUXFFSGU3VHZiemU4T1Fxdm9VSm5rLytkYks5SGY5aWJUREky?=
 =?utf-8?B?aFVsYVFOQll1bGI1ektCcDJyc01BcWo4OHZlYmZlbjRvTjJQSTNCUWVkdktV?=
 =?utf-8?B?dXZiVkhJODBsMTh1QkV1cXo2RDIvNytySzBLUFJsTmlrbUk2YXAvNGJwRHgw?=
 =?utf-8?B?ZjB0MHhYV0txS0hKYnh1RzhnVHdPbkVuWGNKY01kRHdheThHREt2VGFJeDd6?=
 =?utf-8?B?bS91N3JKWHRHTVlaMk1lRUhyOGtYdGFuN29pY04rdjBxcWdxamI0amhGNVVq?=
 =?utf-8?B?OUI1b3piaERYamxVNmQvNWtReXJFclh1RXlqRXBrUTlZZnI2V2JVcU55T0xB?=
 =?utf-8?B?S2laY0dwT2dZRG9tbjVxdmZCaFJWQVpXMGd6VExyQzVIcTd0dlU1clNCblNT?=
 =?utf-8?B?SG8zR2NLU1ZzNndieVBITHBxMnNrR3pPMzNFQmhpeHh2YzJVT1pnMmIramJ0?=
 =?utf-8?B?UkJVRjZQT0hjVVh3UmJzRzc5cGNVZ3JrUjNxUnlOSVdNanIxM01Tc3Rtem1z?=
 =?utf-8?B?a2lnY0NrWmZyUmcvRWtHOTRLV2gva0RJWDZUWW5POFFTMkRjemFhWUFyNEZH?=
 =?utf-8?B?dy9pZzlNWmJ3a3BYVHE4aEpWRjkwS2NUYTBrNmdhdGVFWlNySFNUNmlkR3VH?=
 =?utf-8?B?UkxERzUwanVyWUtjZ2MvR0J0M0JrV1pHOGdFVmR5ekI3QUhNaENUdGcyc3Nq?=
 =?utf-8?B?MHBqaDhFN2tpb1pOenpubHFNbGFxRjFjdkFzRHZOOW5ZZ0VQamxmUGRaTXoy?=
 =?utf-8?B?bTFHcVhZVzlQOTB2Rkx3V3dFRHo2UHlNaGwwUlN6SmNubGJycENHQUxxR0lU?=
 =?utf-8?B?MjBNNzFQdklhRE5LS2I3ZWpzM2w0K0xTTHNVcUhkME02Z1dCWTI0MStkVkVG?=
 =?utf-8?B?WmtRM3Qzb0MrS0VXSmpVVkNFdnRoN3VHZUlRaFFHTE0yYmtKQjlUVFJzaDI0?=
 =?utf-8?B?VXRzNVBocTA2d0NWejhLMUdFNTk5YTdoZkJnVENzNFhkb1FoT3lVVVRHbDhi?=
 =?utf-8?B?Ri9RaGJoemQ2OURSTlFJQTYzdUtBVStTRGZBZUNrT042MTl6TEVrMi80am1x?=
 =?utf-8?B?MEZzc3pXeDlBVzV1WE0zZXVBeVFnRFlFeGF6TXNsSTZPdEgva3VLV3dNWGdo?=
 =?utf-8?B?WlpYMFlBZW1PekFIZmdTNUNMZVRqWUtxUUxBQm41MTlLTHBNVHd0VDJWOFd1?=
 =?utf-8?B?aklGRER2Q21VYWo1Qk91MGNnR0QyYzJhZjFtcU5jeSt6d1E9PQ==?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR12MB5849.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?aVZkWld5VEtnekRHR2d4YWZDTUFhcjM0VDI5aHpzUEtLS21zYlZpMDJJNjcv?=
 =?utf-8?B?RGI2WXdiUGlNMy9CVG5NbXNwVGFIS0VMUWN2eWVYKzNLc3FTS0hFKy9pTkVZ?=
 =?utf-8?B?OVFUYjdKUVpXRE8yb2ZSTGtWS21TWmNXTTZpTlJJSURsclRndlhoYjRYRStp?=
 =?utf-8?B?SmMxcDZqL3FHM2ZQTUtCQm5UL0JydnFhK1FhNjg5dDdHbTRoWTBCclJ4dGY2?=
 =?utf-8?B?allwMS9QUjBidkZxNlJSSlpvTGcvUk5BczlsM203Rk5xY1h6L1R3M0p1bmVi?=
 =?utf-8?B?ajJvZVhrdjFVQU1EM29rQzhXWDhYS0FvWTlaSnVxNjlyMlVzazdTVlJPL05u?=
 =?utf-8?B?NUNVeC94d3NrQlQ2Uk1yMnJKV1AyZDQxKzNIb0ZLbkVlOHlIaVFEbDVDSkhP?=
 =?utf-8?B?TTdNeGhHWFBWV29UQldOSVR0azVKd3U2VWJMOVdid0NTUzE5djRDVmEwUGM0?=
 =?utf-8?B?eUlhbnJSUVdRUlZwV2M3cVVZaXhnbUNDSzhaL0xyZFpxY1hXRFVnanlIbWJS?=
 =?utf-8?B?bnY2QU1lODlLVndKS25sUmhQeUxuWWQ0ZS9GM0dJdzhUa2lkbG1qdkV5Q21O?=
 =?utf-8?B?V0JaemwwU3NCNHNKc3YvbG9aZ1RCYk1ESFdmY3g3dlQrREJiUGgzZGZpbTZs?=
 =?utf-8?B?OEVGajBpQ0Y0dm81bWt3Y1k0bktPSHNwQ3NMUWQrYkY0UXlDSnp6MzZKSXVj?=
 =?utf-8?B?cStRVDhKU1J0MzM1WTJiWWVLRWc0Mi9pRGw5K1VVem43U3VOV21DblBrV2hV?=
 =?utf-8?B?L1VnZGovN2tORUxhWWpxZU9VOUdHSzZPVDZsQUt4WDN3ck5TWmFMb0x4US92?=
 =?utf-8?B?V1UwVXo1dGtEcXV6ZW1hTUNNdmJ1akhvRWpNcW4xWmZTSm1XaG5pM08rNjI5?=
 =?utf-8?B?bmJPcmlkZVpUcFNpOWNqSzNzSFRmay9hV3NNdk1vNWU1MFRFQ2V6a3BPWllk?=
 =?utf-8?B?alhNVUh4YThUdVpVUE13RWlKVUw1Y2NnaTBjaGZvNzZRd0dqVUhFV0lDYmsz?=
 =?utf-8?B?WC9FT2ZHN09Qc2dPNnphRmprZkRZZ2hCY0VLSVRYbWNyV2RaOFZ1QVUvczFr?=
 =?utf-8?B?OHA2OHFKeVRNZDRLZ3pzYzNSZkhrVk1XOUdFZlZuK01OM0lubG5uZGtqcklq?=
 =?utf-8?B?aUNrTjZTb2daQWEyd1dSMjNkblVJVkpYc2lJTkM3aklxekFuMnB1TExwcDUv?=
 =?utf-8?B?VDFoNkUwQ2o5V2YrdmYzVnJ5NEErZ0Y1UUVCUm9lNHFGWnJkZzQ2Sld5NnhJ?=
 =?utf-8?B?eFNxWEREYUpuUTdaVXo0eWNJS0ZGYlN0akQxKzFTR2s0cDBBQWdnbkNkcnNm?=
 =?utf-8?B?QTB0OEplOGtaTW5pL0hwcDl1Y3JjYnpEN0pwSXlzc01SRW84c2NaNkowTWxi?=
 =?utf-8?B?S015S2NpWCtzZVRLV0FzWTJjYmVjZnhrUTJ6K01QSUhRbWMrbzVxd2d0b2tO?=
 =?utf-8?B?cUhPZFVGeVVBZW83VkFJcWJZM2VsQlVoaXFoM0FCcnJMTnVtS0JwN3NLb1Ay?=
 =?utf-8?B?MDVFRi85eUwyWDlNODBuWVFsZk5IaVdselc1clpnc1pDRy9RQnJZeDNkdEJ2?=
 =?utf-8?B?K2pncUJBZmUwVGJMMi9Jdi9rZytmenVQRG9qd0dwSCtiU0ZTUjVSZEY1MjRr?=
 =?utf-8?B?L3dGeHk4K2ZWbkNBZGVYRHBwRjhFb2pLbVVEYjllVXIvZkJ3RHl1UVpxKzBD?=
 =?utf-8?B?TE5OdERTc3hsSFQyOG9WcU5YTC85S0ZLUHd4akJETER1eVpLMkd3MzQ0bHZ4?=
 =?utf-8?B?eHJ2QXV5NmhFVkRpOXQwQjhjdDhzVjhUbHpRT1M1UzFHWlFEemhnMTNDcGJq?=
 =?utf-8?B?OWtFTUlZcU05R1ZKRVZiTkMrRnR1MCs4ZWI0OFdGenY4aU56T1lkQjVIRm9V?=
 =?utf-8?B?T1ZuUHIrTnpZOXducGphOWZ4NmlvcG9sVFpUeHMwanpCTzlzV0dhMUcrUlJD?=
 =?utf-8?B?M2lUK1pUSHN5cEtXWVFKLzdGaDVtanR6RWxMZmpmZ3pNa0xjTzZYWTRKUGF3?=
 =?utf-8?B?bm94bE9lb25oSFllZnY2YTlHd2hBWXcyay9yVDNMVExweEpIWlIvNnBWc2VQ?=
 =?utf-8?B?VWJCcVFLdUZDcEdHQk5NSFlhM3JoUWRFTkY0a3JSVk1oRXpjam00ME1aa1JJ?=
 =?utf-8?Q?i7i0=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <2BCE6C9807FB63438A7E380BC2CD29F7@amdcloud.onmicrosoft.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5849.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b18fc62b-295d-4e71-7e5c-08dca0b682cb
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Jul 2024 08:01:31.8163
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: LhhRnodi2VuyPYQpK9P+wtZnXN82g7UE8vGe97p9qCxQc335sz4ctaQblfsPyjlV+NlNCtSyHM8cYqLZuiNNnQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB7120

SGksDQoNCk9uIDIwMjQvNy84IDE5OjQxLCBKaXFpYW4gQ2hlbiB3cm90ZToNCj4gVGhlIGdzaSBv
ZiBhIHBhc3N0aHJvdWdoIGRldmljZSBtdXN0IGJlIGNvbmZpZ3VyZWQgZm9yIGl0IHRvIGJlDQo+
IGFibGUgdG8gYmUgbWFwcGVkIGludG8gYSBodm0gZG9tVS4NCj4gQnV0IFdoZW4gZG9tMCBpcyBQ
VkgsIHRoZSBnc2lzIG1heSBub3QgZ2V0IHJlZ2lzdGVyZWQoc2VlIGJlbG93DQo+IGNsYXJpZmlj
YXRpb24pLCBpdCBjYXVzZXMgdGhlIGluZm8gb2YgYXBpYywgcGluIGFuZCBpcnEgbm90IGJlDQo+
IGFkZGVkIGludG8gaXJxXzJfcGluIGxpc3QsIGFuZCB0aGUgaGFuZGxlciBvZiBpcnFfZGVzYyBp
cyBub3Qgc2V0LA0KPiB0aGVuIHdoZW4gcGFzc3Rocm91Z2ggYSBkZXZpY2UsIHNldHRpbmcgaW9h
cGljIGFmZmluaXR5IGFuZCB2ZWN0b3INCj4gd2lsbCBmYWlsLg0KPiANCj4gVG8gZml4IGFib3Zl
IHByb2JsZW0sIG9uIExpbnV4IGtlcm5lbCBzaWRlLCBhIG5ldyBjb2RlIHdpbGwNCj4gbmVlZCB0
byBjYWxsIFBIWVNERVZPUF9zZXR1cF9nc2kgZm9yIHBhc3N0aHJvdWdoIGRldmljZXMgdG8NCj4g
cmVnaXN0ZXIgZ3NpIHdoZW4gZG9tMCBpcyBQVkguDQo+IA0KPiBTbywgYWRkIFBIWVNERVZPUF9z
ZXR1cF9nc2kgaW50byBodm1fcGh5c2Rldl9vcCBmb3IgYWJvdmUNCj4gcHVycG9zZS4NCj4gDQo+
IENsYXJpZnkgdHdvIHF1ZXN0aW9uczoNCj4gRmlyc3QsIHdoeSB0aGUgZ3NpIG9mIGRldmljZXMg
YmVsb25nIHRvIFBWSCBkb20wIGNhbiB3b3JrPw0KPiBCZWNhdXNlIHdoZW4gcHJvYmUgYSBkcml2
ZXIgdG8gYSBub3JtYWwgZGV2aWNlLCBpdCB1c2VzIHRoZSBub3JtYWwNCj4gcHJvYmUgZnVuY3Rp
b24gb2YgcGNpIGRldmljZSwgaW4gaXRzIGNhbGxzdGFjaywgaXQgcmVxdWVzdHMgaXJxDQo+IGFu
ZCB1bm1hc2sgY29ycmVzcG9uZGluZyBpb2FwaWMgb2YgZ3NpLCB0aGVuIHRyYXAgaW50byB4ZW4g
YW5kDQo+IHJlZ2lzdGVyIGdzaSBmaW5hbGx5Lg0KPiBDYWxsc3RhY2sgaXMob24gbGludXgga2Vy
bmVsIHNpZGUpIHBjaV9kZXZpY2VfcHJvYmUtPg0KPiByZXF1ZXN0X3RocmVhZGVkX2lycS0+IGly
cV9zdGFydHVwLT4gX191bm1hc2tfaW9hcGljLT4NCj4gaW9fYXBpY193cml0ZSwgdGhlbiB0cmFw
IGludG8geGVuIGh2bWVtdWxfZG9faW8tPg0KPiBodm1faW9faW50ZXJjZXB0LT4gaHZtX3Byb2Nl
c3NfaW9faW50ZXJjZXB0LT4NCj4gdmlvYXBpY193cml0ZV9pbmRpcmVjdC0+IHZpb2FwaWNfaHdk
b21fbWFwX2dzaS0+IG1wX3JlZ2lzdGVyX2dzaS4NCj4gU28gdGhhdCB0aGUgZ3NpIGNhbiBiZSBy
ZWdpc3RlcmVkLg0KPiANCj4gU2Vjb25kLCB3aHkgdGhlIGdzaSBvZiBwYXNzdGhyb3VnaCBkZXZp
Y2UgY2FuJ3Qgd29yayB3aGVuIGRvbTANCj4gaXMgUFZIPw0KPiBCZWNhdXNlIHdoZW4gYXNzaWdu
IGEgZGV2aWNlIHRvIHBhc3N0aHJvdWdoLCBpdCB1c2VzIHRoZSBzcGVjaWZpYw0KPiBwcm9iZSBm
dW5jdGlvbiBvZiBwY2liYWNrLCBpbiBpdHMgY2FsbHN0YWNrLCBpdCBkb2Vzbid0IGluc3RhbGwg
YQ0KPiBmYWtlIGlycSBoYW5kbGVyIGR1ZSB0byB0aGUgSVNSIGlzIG5vdCBydW5uaW5nLiBTbyB0
aGF0DQo+IG1wX3JlZ2lzdGVyX2dzaSBvbiBYZW4gc2lkZSBpcyBuZXZlciBjYWxsZWQsIHRoZW4g
dGhlIGdzaSBpcyBub3QNCj4gcmVnaXN0ZXJlZC4NCj4gQ2FsbHN0YWNrIGlzKG9uIGxpbnV4IGtl
cm5lbCBzaWRlKSBwY2lzdHViX3Byb2JlLT5wY2lzdHViX3NlaXplLT4NCj4gcGNpc3R1Yl9pbml0
X2RldmljZS0+IHhlbl9wY2lia19yZXNldF9kZXZpY2UtPg0KPiB4ZW5fcGNpYmtfY29udHJvbF9p
c3ItPmlzcl9vbj09MC4NCj4gDQo+IFNpZ25lZC1vZmYtYnk6IEppcWlhbiBDaGVuIDxKaXFpYW4u
Q2hlbkBhbWQuY29tPg0KPiBTaWduZWQtb2ZmLWJ5OiBIdWFuZyBSdWkgPHJheS5odWFuZ0BhbWQu
Y29tPg0KPiBTaWduZWQtb2ZmLWJ5OiBKaXFpYW4gQ2hlbiA8SmlxaWFuLkNoZW5AYW1kLmNvbT4N
Cj4gLS0tDQo+ICB4ZW4vYXJjaC94ODYvaHZtL2h5cGVyY2FsbC5jIHwgMSArDQo+ICAxIGZpbGUg
Y2hhbmdlZCwgMSBpbnNlcnRpb24oKykNCj4gDQo+IGRpZmYgLS1naXQgYS94ZW4vYXJjaC94ODYv
aHZtL2h5cGVyY2FsbC5jIGIveGVuL2FyY2gveDg2L2h2bS9oeXBlcmNhbGwuYw0KPiBpbmRleCAw
M2FkYTNjODgwYmQuLmNmZTgyZDBmOTZlZCAxMDA2NDQNCj4gLS0tIGEveGVuL2FyY2gveDg2L2h2
bS9oeXBlcmNhbGwuYw0KPiArKysgYi94ZW4vYXJjaC94ODYvaHZtL2h5cGVyY2FsbC5jDQo+IEBA
IC04Niw2ICs4Niw3IEBAIGxvbmcgaHZtX3BoeXNkZXZfb3AoaW50IGNtZCwgWEVOX0dVRVNUX0hB
TkRMRV9QQVJBTSh2b2lkKSBhcmcpDQo+ICAgICAgICAgICAgICByZXR1cm4gLUVOT1NZUzsNCj4g
ICAgICAgICAgYnJlYWs7DQo+ICANCj4gKyAgICBjYXNlIFBIWVNERVZPUF9zZXR1cF9nc2k6DQo+
ICAgICAgY2FzZSBQSFlTREVWT1BfcGNpX21tY2ZnX3Jlc2VydmVkOg0KPiAgICAgIGNhc2UgUEhZ
U0RFVk9QX3BjaV9kZXZpY2VfYWRkOg0KPiAgICAgIGNhc2UgUEhZU0RFVk9QX3BjaV9kZXZpY2Vf
cmVtb3ZlOg0KDQpEbyB5b3UgaGF2ZSBhbnkgb3RoZXIgY29uY2VybiBhYm91dCB0aGlzIHBhdGNo
Pw0KSWYgbm90LCBtYXkgSSBnZXQgeW91ciBSZXZpZXdkLWJ5Pw0KVGhlbiB0aGUgZmlyc3QgdGhy
ZWUgcGF0Y2hlcyBvZiB0aGlzIHNlcmllcyBjYW4gYmUgY29uc2lkZXJlZCB0byBtZXJnZWQgb25j
ZSBJIHNlbmQgbmV4dCB2ZXJzaW9uLCBzbyB0aGF0IEkgY2FuIGNvbnRpbnVlIHRvIHVwc3RyZWFt
IHRoZSBrZXJuZWwgcGF0Y2hlcyB0aGF0IGRlcGVuZCBvbiB0aGVtLg0KDQotLSANCkJlc3QgcmVn
YXJkcywNCkppcWlhbiBDaGVuLg0K

