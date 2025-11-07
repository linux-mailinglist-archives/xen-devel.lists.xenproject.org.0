Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DC598C41429
	for <lists+xen-devel@lfdr.de>; Fri, 07 Nov 2025 19:18:50 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1157831.1486460 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vHR1t-00027R-Mr; Fri, 07 Nov 2025 18:17:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1157831.1486460; Fri, 07 Nov 2025 18:17:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vHR1t-00025S-Jx; Fri, 07 Nov 2025 18:17:45 +0000
Received: by outflank-mailman (input) for mailman id 1157831;
 Fri, 07 Nov 2025 18:17:44 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=qRNH=5P=epam.com=grygorii_strashko@srs-se1.protection.inumbo.net>)
 id 1vHR1s-000253-GC
 for xen-devel@lists.xenproject.org; Fri, 07 Nov 2025 18:17:44 +0000
Received: from DU2PR03CU002.outbound.protection.outlook.com
 (mail-northeuropeazlp170110003.outbound.protection.outlook.com
 [2a01:111:f403:c200::3])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0d652d83-bc06-11f0-9d17-b5c5bf9af7f9;
 Fri, 07 Nov 2025 19:17:43 +0100 (CET)
Received: from DB3PR0302MB8919.eurprd03.prod.outlook.com
 (2603:10a6:10:435::21) by DBBPR03MB10293.eurprd03.prod.outlook.com
 (2603:10a6:10:535::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.16; Fri, 7 Nov
 2025 18:17:41 +0000
Received: from DB3PR0302MB8919.eurprd03.prod.outlook.com
 ([fe80::ce88:43f9:c971:9584]) by DB3PR0302MB8919.eurprd03.prod.outlook.com
 ([fe80::ce88:43f9:c971:9584%6]) with mapi id 15.20.9298.007; Fri, 7 Nov 2025
 18:17:40 +0000
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
X-Inumbo-ID: 0d652d83-bc06-11f0-9d17-b5c5bf9af7f9
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VY9F3BW7lTwS29qXDLRTXrKHpzAVrRifISpIRpkn+if5yaZc5InePKg1WZhDyA6t7GZdcWMv+oILSCggDhSlByVgTg8hwC/b533QY6O9x9kTWGG2AXuI9PG61KFG0qIYpGV5UTDHAoOdz7tkgv2CofpSaW7Olkw78e1PehGGvBC/yZj4hJPEdysm2bb4zXyyn+s2axnO28T8NsCQc1gERMEPmbUJClk4AJc2uz0ulbnEer2CYwrRSTSovUAv1D3hYRGVVseSBCJUXM+T9RVLuCeCNsyKsisptJDHq1l/pCykrhQ0qaxtAQueYbkGnRfdNj6UNuBYC7PgjTgyFN5fog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AD/9dVOEMVFu1MKExFT7CnKSb3AtEHaiYuNxtfykA74=;
 b=dNwYrWgLfxxcxkONAJh2Ts+U200oXf7w9j30YH0KzDAww3Eyg8P2IJefVf5Ns+EpWHCqEh9VFWWpKa4OBm0CcnCjzQlNG5xPkK4HQvgLDezYp0xJtbPY3Vk7HYVc++5EbqTpyd4XjAT85vb5T5uLL/LVYAVK0vkEX2NSpbtmSiCOZ0ETWfHzUGKOsa97lVBaEAGF9z8e+ZvgBbkQRANuEXCDr7OtCmR9w6VVpTHFYW2FhrCZ8Hzq5yF49Y56xyuKU0gYuhjPjJ5hQphKwylaq53+vR9o5GflHwgVxGY+/A9714AiSEVMyIDSY7Fwv3+S8zFaJAzNDoEY4ZDwj3w4IQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AD/9dVOEMVFu1MKExFT7CnKSb3AtEHaiYuNxtfykA74=;
 b=ITFhWRviWwUD25iEjkoqI5OG7j1hfVtYcbSHX/5rnUz6L3oT5/aZb6gb8/POjOniPNbSUahVu8rKKAbVIfH+xmqRSdPya2IfkAm67UykZAnkyjc6x9irxB7AJZXjDSHwKak6F9s14QddgMkDm2PdXBpqFFzCeqFwQXQSa/ykHoI3KB1I19e1ylPVLdEkKcsOl4+psZtEQqYfQ1HW9pLeSMwrzeC2qwzDM7PWFT31CWcqVohjl+e9R9Zekn3wZVkNArM5jRZOjm6UsXP14uGBc8Nb1720wNW+KE+ksSvg78O1wF2oOofvSJzb0s4pFw9n4g0hNilpdC0nZrbP+MK59g==
From: Grygorii Strashko <grygorii_strashko@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Grygorii Strashko <grygorii_strashko@epam.com>, Jan Beulich
	<jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
	=?iso-8859-1?Q?Roger_Pau_Monn=E9?= <roger.pau@citrix.com>, Jason Andryuk
	<jason.andryuk@amd.com>, Teddy Astie <teddy.astie@vates.tech>
Subject: [XEN][PATCH v3] xen/x86: guest_access: optimize raw_x_guest() for PV
 and HVM combinations
Thread-Topic: [XEN][PATCH v3] xen/x86: guest_access: optimize raw_x_guest()
 for PV and HVM combinations
Thread-Index: AQHcUBLN3SGq8p5NMUWAtm58KOFfGg==
Date: Fri, 7 Nov 2025 18:17:40 +0000
Message-ID: <20251107181739.3034098-1-grygorii_strashko@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DB3PR0302MB8919:EE_|DBBPR03MB10293:EE_
x-ms-office365-filtering-correlation-id: a6596213-e362-42d0-8926-08de1e29f05f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|1800799024|366016|38070700021;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?HU5CFNaH85dI16XrziNwm/faT8IkbZBcCzfT47X8EOekhfYPNSUVNi2dbE?=
 =?iso-8859-1?Q?fXAVSKWbkLmRw2UTiJVgVd38ZePoYgeduxzzpQtrllTtNBGfFmllNo0uf4?=
 =?iso-8859-1?Q?3NPiRooyyiUhf/92IPBvgwYZzTrjLLQ8oS7ttyO7fMh04uSgU33FYJlJ/h?=
 =?iso-8859-1?Q?Xqu40CMiaS7iezATJ4IhAhFbuJW61CLn4OUyJNsek5E3PGKqg2JB7v0+au?=
 =?iso-8859-1?Q?zGm6nBtcvQrkbg0bJeX9tHrxy36ZuCSJDOMy1VZBf+WLJmfVejkjNHz17d?=
 =?iso-8859-1?Q?uWMtrTDZ+HsnyDxCGtZrH35Mo5TCgBCCoRgABB+BDvzmaWFkRtr1XGL1zm?=
 =?iso-8859-1?Q?5lXDdEfHO1fA26GUuBCBpeThUQ2FKwZiMyi0aw6flrDnJxiLub6RX2NFDJ?=
 =?iso-8859-1?Q?E5kHmVsOBdIWgG9hZ6R2tyBFW4G8T86jUxF9FIeI6cMTZWx4jNoJMBusL/?=
 =?iso-8859-1?Q?R7uuGuGyJmezz+MPMYHHsLyiKHXhdKNkeO55HCBmcUlJ+Vp7o/0dsb9b0w?=
 =?iso-8859-1?Q?xjOdjHEQ7jxTIryvwhtCazS3zhj2KXkcZKnNfFuvgEM3ZYD5WO8+6KTHwG?=
 =?iso-8859-1?Q?GhNO+25oDhZ0FrL/ixJmWI0QhZxbl1u5ZpyQkx2xSKPX7QEhaH7d5FcDuM?=
 =?iso-8859-1?Q?7Dmm7Hp9W8GEixiqJrbWBDq25eKgODoOqSHQxraKvR7ZgGPodD7d/N7fsP?=
 =?iso-8859-1?Q?8plKtv+WGKfI9VwwQvvxrRcKaBkMw0xL31E5G5exW6X8hM8GUenkLCnHtM?=
 =?iso-8859-1?Q?RObjB7Pv2KY94Gbgg3QYMea7WW5/Dqshs23Ra7CKYQvt+3vozCQDEYZkOe?=
 =?iso-8859-1?Q?EhfZrjlJrQvvCjH5zaL7ZQgqqrpZoGRgYlPeU+KHgwnf/HxBJuYUen4UUx?=
 =?iso-8859-1?Q?V4OmGXOG5cC7CPtclmmcxIzNtyfGUD3YQBXWHHdUlkQnDuBhAvR05KSydR?=
 =?iso-8859-1?Q?sm76Lsxz52xS7pNBh2e+exKqv3lrBz5+3IfFicpDQm+KhZHE/7g5M7y5+u?=
 =?iso-8859-1?Q?5LMKUX+ECclZAqS1b7o2b84kG17mPxjgOJHy0w2NEUzoCPPDDrFdTztCNe?=
 =?iso-8859-1?Q?BtPC/J7FMEIyXIcNPj79mW05GjP6tnx4MkMCXbEdD3HEdZRiSDyoCOeyrV?=
 =?iso-8859-1?Q?iPqHLjGOA/kaNYro/PLy0HROPbgP6PhEFn90mOCPo7GEDkvhJ9B05EAkem?=
 =?iso-8859-1?Q?SxEDQ2c8+rWVg3qVVuFQD7ttzA6NqXQHlHeMqjifJ+URduDD+lgJwbwOB1?=
 =?iso-8859-1?Q?vZ0hkV7DW49tXRSLUT1Te0U67yWzkI4nvhUTgK8GGom7rAzoYPx3HLJe7g?=
 =?iso-8859-1?Q?GUjz1pC6cNljKy6L/eoAbUWJRNbz3h5qOweFutmLPU/1/TrCdlCl5pHNYK?=
 =?iso-8859-1?Q?Uwxcw3+bNEhQ3ImFbqVLFX98rjbX/kNlRckfUJxcvPKVGz601VLoz9G/n/?=
 =?iso-8859-1?Q?LU6eBjwrjXYMqBKEpXShF5ExoNYI2PG/7mDD6Vtfx+ji9ntbmtzsghYT8d?=
 =?iso-8859-1?Q?OxNN0i9JjFx8pMIXKl4ch1wyh6J+bffXA8V2JniBjRg9EGrJue+Ld2nZV7?=
 =?iso-8859-1?Q?6MkMqHOlhTjIaHGPkDotkixpmr3e?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB3PR0302MB8919.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?6fXoxgD333C/qBabBr425Zkq5Ft1S47qeH/rRsXVoJLA4Y/c2USkQbSoNx?=
 =?iso-8859-1?Q?lcS+2IU8rO/2vCCMYgK7OwLGVrhcI/eehu1qm2u2UVMZNQJHQBfMTBCKVe?=
 =?iso-8859-1?Q?oM+pX7kNThWQUI28RUxgeTgXksXiVUn4FEzO2LmtrGe4yWvR6n6NjdyMWq?=
 =?iso-8859-1?Q?4jnJptJYVOiH4rfJx0qdkWwlGX83vlEaZjgpVeI5gHjIMu+8eZEPp7Vl84?=
 =?iso-8859-1?Q?lHJMT3XCpiTV8YDLXPzcLXXUbHcByLw3AwxLxrevG4vKO5zs4y8/tumBmO?=
 =?iso-8859-1?Q?LhlaJ+suys/QZMr4QxS1p+EtZEB5kWzjDKJTqhAFGYIn7+5Z8OSHx0tDA2?=
 =?iso-8859-1?Q?TOELMy4gr7CzYkqXYoQE90Lac5358QKq4JbbomU9paKytE42xC8ZljdjUo?=
 =?iso-8859-1?Q?w7g8h5JIniglXY7H268PKpeu8uTS9p4n6L7jXDpoZMv4NQMoC5pv/1fP3I?=
 =?iso-8859-1?Q?z040/1jLW9VcmAX0r/0fnpaRPvoWQFNM2uk0NpAI+UNXWMaYkQQ8X4B+Rd?=
 =?iso-8859-1?Q?z5z7QeQZee5WxmFXulZfvQ+/kLkgnl1CokS9HVL094LdaevKvDnJafazur?=
 =?iso-8859-1?Q?vklCz5wvo0IfDmErdtCB1xcfwW057aJ2DBFM772Ql2LlWGO7pZwzyENTQg?=
 =?iso-8859-1?Q?Kx+2VcPYeeEv0mPzGHOaAhHRVpjZUzTuTmRRAAYh5DB6Y8LG3PrMo5aD7T?=
 =?iso-8859-1?Q?QE+A0tWtsSUA2EucdSqCWlovFNWNrkU1PnRwUNTW8EE78VNirjb2XYcN9T?=
 =?iso-8859-1?Q?2PhVeyd+uD56aeakR0vI/MbY6D9vv7J8stB8zoULOJhrbMZPUKqLQMuNmD?=
 =?iso-8859-1?Q?wOAywNWmWxP5ZKvj64m6z/HKFgHkwspsFg3vm7CWBqUwdqXOq4EGE64oFB?=
 =?iso-8859-1?Q?OXWGim5Ny7rn9oZ9ySugCH5FMKeEWtH4BgBOGKfUUYJvcz7Rd6ymSbL3bT?=
 =?iso-8859-1?Q?4vAHK7rsj7XWvjfJN4FHRaXshgGkD0Ji0xNxnsbFPXhUmo6ZSLss1Apj8m?=
 =?iso-8859-1?Q?1gGtl+YIC2viTzvYqtVN+EDETFQo9icSGEdXvkgCDEcNIUTSyAUumoqfqS?=
 =?iso-8859-1?Q?U8VvD8NjtDqGygPCySPhNQEGfF47PfFBVEEGYh35GvXNuYa0ADHwUSg8Jg?=
 =?iso-8859-1?Q?BgxAsIsNCseFUnHHLxNvmCRV9APvhkt/+PIz1dZDU1jWSte8/rr9/HgK+f?=
 =?iso-8859-1?Q?9J61KOCYZHvfJwV5SVPOR/+vLbPTgpwz57SNHj2X9cmVqNKhWccX3MADDs?=
 =?iso-8859-1?Q?2lYENVV6N+T1sbW1ap6vZMYpcY6wr0kOQFQ6xA4XRpnBudXQw4dklzOMVK?=
 =?iso-8859-1?Q?vTmrS6f7TyC/gCE+YPhBtgpI9lqjyDUC9LaS8FZnQCf3qjDAfUPulM71Z3?=
 =?iso-8859-1?Q?nVq01dLivFTvQ0RkwDX+6OPjjRPj5TGo48zNyai2CWBqEue1mUmalwc7hc?=
 =?iso-8859-1?Q?G8As15oOT9BxC4eXcPldKxjEgMfH9p1agEaol7DYEIZxa18bs8Pl1xeOS6?=
 =?iso-8859-1?Q?vu5+dxEk37E1H7ui5E6HUHCnqx96Lk4pRV9S6dJhyykOxCGAi0fHzyvyXd?=
 =?iso-8859-1?Q?Z5xvnRjVTZKT4LniIPeLFkO9l3HfbOINBTn6KEQt3ZfyKmxx5Qgmz8sHtP?=
 =?iso-8859-1?Q?leTTObgmNCJc7dxyI+KIvifn0QD6wdYNMG68dbiXlYIcnEw+HmjUDRUg?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB3PR0302MB8919.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a6596213-e362-42d0-8926-08de1e29f05f
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Nov 2025 18:17:40.8175
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: /1lVy2eyj30e1W0zzk8laHENZBoouWIZZwliyf8PEhQ4UsdtwAGyG967r/FkwdkOoD5egsaAptCIol5NBk6zj4x8Ic265aXzJkM0lstaoDk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR03MB10293

From: Grygorii Strashko <grygorii_strashko@epam.com>

Xen uses below pattern for raw_x_guest() functions:

define raw_copy_to_guest(dst, src, len)        \
    (is_hvm_vcpu(current) ?                     \
     copy_to_user_hvm((dst), (src), (len)) :    \
     copy_to_guest_pv(dst, src, len))

This pattern works depending on CONFIG_PV/CONFIG_HVM as:
- PV=3Dy and HVM=3Dy
  Proper guest access function is selected depending on domain type.
- PV=3Dy and HVM=3Dn
  Only PV domains are possible. is_hvm_domain/vcpu() will constify to "fals=
e"
  and compiler will optimize code and skip HVM specific part.
- PV=3Dn and HVM=3Dy
  Only HVM domains are possible. is_hvm_domain/vcpu() will not be constifie=
d.
  No PV specific code will be optimized by compiler.
- PV=3Dn and HVM=3Dn
  No guests should possible. The code will still follow PV path.

Rework raw_x_guest() code to use static inline functions which account for
above PV/HVM possible configurations with main intention to optimize code
for (PV=3Dn and HVM=3Dy) case.

For the case (PV=3Dn and HVM=3Dn) return "len" value indicating a failure (=
no
guests should be possible in this case, which means no access to guest
memory should ever happen).

Finally build arch/x86/usercopy.c only for PV=3Dy.

The measured (bloat-o-meter) improvement for (PV=3Dn and HVM=3Dy) case is:
  add/remove: 2/9 grow/shrink: 2/90 up/down: 1678/-32560 (-30882)
  Total: Before=3D1937092, After=3D1906210, chg -1.59%

[teddy.astie@vates.tech: Suggested to use static inline functions vs
macro combinations]
Suggested-by: Teddy Astie <teddy.astie@vates.tech>
Signed-off-by: Grygorii Strashko <grygorii_strashko@epam.com>
---
changes in v3:
- add raw_use_hvm_access() wrapper

changes in v2:
- use static inline functions instead of macro combinations

 xen/arch/x86/Makefile                   |  2 +-
 xen/arch/x86/include/asm/guest_access.h | 78 ++++++++++++++++++-------
 2 files changed, 59 insertions(+), 21 deletions(-)

diff --git a/xen/arch/x86/Makefile b/xen/arch/x86/Makefile
index 407571c510e1..27f131ffeb61 100644
--- a/xen/arch/x86/Makefile
+++ b/xen/arch/x86/Makefile
@@ -71,7 +71,7 @@ obj-y +=3D time.o
 obj-y +=3D traps-setup.o
 obj-y +=3D traps.o
 obj-$(CONFIG_INTEL) +=3D tsx.o
-obj-y +=3D usercopy.o
+obj-$(CONFIG_PV) +=3D usercopy.o
 obj-y +=3D x86_emulate.o
 obj-$(CONFIG_TBOOT) +=3D tboot.o
 obj-y +=3D hpet.o
diff --git a/xen/arch/x86/include/asm/guest_access.h b/xen/arch/x86/include=
/asm/guest_access.h
index 69716c8b41bb..eb1fb0aef76d 100644
--- a/xen/arch/x86/include/asm/guest_access.h
+++ b/xen/arch/x86/include/asm/guest_access.h
@@ -13,26 +13,64 @@
 #include <asm/hvm/guest_access.h>
=20
 /* Raw access functions: no type checking. */
-#define raw_copy_to_guest(dst, src, len)        \
-    (is_hvm_vcpu(current) ?                     \
-     copy_to_user_hvm((dst), (src), (len)) :    \
-     copy_to_guest_pv(dst, src, len))
-#define raw_copy_from_guest(dst, src, len)      \
-    (is_hvm_vcpu(current) ?                     \
-     copy_from_user_hvm((dst), (src), (len)) :  \
-     copy_from_guest_pv(dst, src, len))
-#define raw_clear_guest(dst,  len)              \
-    (is_hvm_vcpu(current) ?                     \
-     clear_user_hvm((dst), (len)) :             \
-     clear_guest_pv(dst, len))
-#define __raw_copy_to_guest(dst, src, len)      \
-    (is_hvm_vcpu(current) ?                     \
-     copy_to_user_hvm((dst), (src), (len)) :    \
-     __copy_to_guest_pv(dst, src, len))
-#define __raw_copy_from_guest(dst, src, len)    \
-    (is_hvm_vcpu(current) ?                     \
-     copy_from_user_hvm((dst), (src), (len)) :  \
-     __copy_from_guest_pv(dst, src, len))
+static inline bool raw_use_hvm_access(const struct vcpu *v)
+{
+    return IS_ENABLED(CONFIG_HVM) && (!IS_ENABLED(CONFIG_PV) || is_hvm_vcp=
u(v));
+}
+
+static inline unsigned int raw_copy_to_guest(void *dst, const void *src,
+                                             unsigned int len)
+{
+    if ( raw_use_hvm_access(current) )
+        return copy_to_user_hvm(dst, src, len);
+    else if ( IS_ENABLED(CONFIG_PV) )
+        return copy_to_guest_pv(dst, src, len);
+    else
+        return len;
+}
+
+static inline unsigned int raw_copy_from_guest(void *dst, const void *src,
+                                               unsigned int len)
+{
+    if ( raw_use_hvm_access(current) )
+        return copy_from_user_hvm(dst, src, len);
+    else if ( IS_ENABLED(CONFIG_PV) )
+        return copy_from_guest_pv(dst, src, len);
+    else
+        return len;
+}
+
+static inline unsigned int raw_clear_guest(void *dst, unsigned int len)
+{
+    if ( raw_use_hvm_access(current) )
+        return clear_user_hvm(dst, len);
+    else if ( IS_ENABLED(CONFIG_PV) )
+        return clear_guest_pv(dst, len);
+    else
+        return len;
+}
+
+static inline unsigned int __raw_copy_to_guest(void *dst, const void *src,
+                                               unsigned int len)
+{
+    if ( raw_use_hvm_access(current) )
+        return copy_to_user_hvm(dst, src, len);
+    else if ( IS_ENABLED(CONFIG_PV) )
+        return __copy_to_guest_pv(dst, src, len);
+    else
+        return len;
+}
+
+static inline unsigned int __raw_copy_from_guest(void *dst, const void *sr=
c,
+                                                 unsigned int len)
+{
+    if ( raw_use_hvm_access(current) )
+        return copy_from_user_hvm(dst, src, len);
+    else if ( IS_ENABLED(CONFIG_PV) )
+        return __copy_from_guest_pv(dst, src, len);
+    else
+        return len;
+}
=20
 /*
  * Pre-validate a guest handle.
--=20
2.34.1

