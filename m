Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 00683B355BB
	for <lists+xen-devel@lfdr.de>; Tue, 26 Aug 2025 09:36:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1093974.1449332 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uqoEF-0000TW-5s; Tue, 26 Aug 2025 07:36:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1093974.1449332; Tue, 26 Aug 2025 07:36:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uqoEF-0000S3-2U; Tue, 26 Aug 2025 07:36:27 +0000
Received: by outflank-mailman (input) for mailman id 1093974;
 Tue, 26 Aug 2025 07:36:26 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=pZJD=3G=epam.com=dmytro_prokopchuk1@srs-se1.protection.inumbo.net>)
 id 1uqoED-0000Rx-SQ
 for xen-devel@lists.xenproject.org; Tue, 26 Aug 2025 07:36:25 +0000
Received: from AM0PR02CU008.outbound.protection.outlook.com
 (mail-westeuropeazlp170130006.outbound.protection.outlook.com
 [2a01:111:f403:c201::6])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5dae9c3c-824f-11f0-b898-0df219b8e170;
 Tue, 26 Aug 2025 09:36:23 +0200 (CEST)
Received: from GV2PR03MB9572.eurprd03.prod.outlook.com (2603:10a6:150:da::5)
 by PAXPR03MB8251.eurprd03.prod.outlook.com (2603:10a6:102:23d::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.20; Tue, 26 Aug
 2025 07:36:20 +0000
Received: from GV2PR03MB9572.eurprd03.prod.outlook.com
 ([fe80::edd1:842f:9b14:509e]) by GV2PR03MB9572.eurprd03.prod.outlook.com
 ([fe80::edd1:842f:9b14:509e%3]) with mapi id 15.20.9052.019; Tue, 26 Aug 2025
 07:36:20 +0000
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
X-Inumbo-ID: 5dae9c3c-824f-11f0-b898-0df219b8e170
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=n+ThdjTNLVQQydP0GSVBN6Lzs9EGMHj6GDEC9JIxEJE1YEBine8RIG6s0otZMTRA370effuf4GQ90U60ZjEtAhdkfinOTAOATI8Ug+AJFQeJTC0W5Za89XOdgZLXI73yimTziVEl/6cJBwXxQMXvtqut+Nu5kIGUWRkk5h8KyQZ1YHoYJpQGLI5mFwDzyZOXQ6B241Z4a4zap1YNzVUDZ+YtyvbL2QJru1dgDBbO3hAQVEhMqFKBy0fscwoQPeTo/K2QEnX0SkT6BzJyB2BG9XjnGgZo2vYBCgWRZRe82dDTajhPAmpv+n5ANPcuLnYZzNlfDIruaq5Igw0xF/4n/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eG7VgBSoakS2HenjB8k0q9gUCulKgRfpj9rxtOR3G8o=;
 b=da5wHOjaVmWRgsT5QIt2mPL/ffMlzH7FiEeSbbGhH2Y1EF6+f3Uzjicq5V3f9N8w3H7pwE88d1HERIS+MMMykczsZwTBZXVZbC6xXqYYloTMs8yDe+n2JPtdL9eTmXPHBMDUdz8iQitLoVFftVy2E6tKdXsDokYrY2Sew66/aXw0CeexC0V+x5/92ENjj3P6q0zNaOtZQ1iGbb2XZSJo+Zcot6CpT3VO0wgEVgzkSxk/K9YKNwb9VQoCG0d6wigMKEsbVxnJQw96Q3dc3wfL7ufN6Al5g3WxXMqtoJvE96GMhN29EZKS9lTN2x8C1zGHrWL8RktNwpEYVLEg/JtgVg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eG7VgBSoakS2HenjB8k0q9gUCulKgRfpj9rxtOR3G8o=;
 b=VkZPKW9rIMSPBFDYzV5h19iBCvQNzmuIZW3GWXeERkFaZHonUwVBJ65J1Iz43njvSaf5Bhd31plHT3IifrnfMTksnIwLoxizsWBsqn48rLhtP87QmmniDY8QHYeeUTQEQTavLHfLmt296pc/JlcUIRwYZwCfTbwWf4Cf8cyYSHXR9p9GI4KHNkzP8p8Wzbt2zaOXHFPzkG9ESmS8RvXu0Z25pGEEt2AVIAhx4GEyc3mxubyC4OaRThjfXiE7cZpUK49ODk+diyOprIN+bnal669jZwHlWYYcaoYe0lmatmm7R5bSXMZpQ8dnXriMVpwPOlCHwkl1eCx85P3QXD2hYg==
From: Dmytro Prokopchuk1 <dmytro_prokopchuk1@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Dmytro Prokopchuk1 <dmytro_prokopchuk1@epam.com>, Nicola Vetrini
	<nicola.vetrini@bugseng.com>, Doug Goldstein <cardoe@cardoe.com>, Stefano
 Stabellini <sstabellini@kernel.org>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>, Julien
 Grall <julien@xen.org>, =?iso-8859-1?Q?Roger_Pau_Monn=E9?=
	<roger.pau@citrix.com>
Subject: [PATCH v2] misra: add deviation of Rule 17.7
Thread-Topic: [PATCH v2] misra: add deviation of Rule 17.7
Thread-Index: AQHcFlwdO9JZfbniJ0qkcPaDWppdxw==
Date: Tue, 26 Aug 2025 07:36:20 +0000
Message-ID:
 <812b78119cee801662a31d39b556cb453aa69508.1756192362.git.dmytro_prokopchuk1@epam.com>
Accept-Language: en-US, uk-UA, ru-RU
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: GV2PR03MB9572:EE_|PAXPR03MB8251:EE_
x-ms-office365-filtering-correlation-id: e45c846b-a3ee-40b5-89b9-08dde4734016
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|42112799006|7416014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?hwVuU21nDS4ZIEeauVoXneBvtVaJmXtcOUaKVGN8EEH+1+jZA/hDVI6pn9?=
 =?iso-8859-1?Q?tPwW7m9PtYuRP/jzFy6SFIuf6tzFTNjQdY2KBiexTHXJgDyfzdtmcEtpC6?=
 =?iso-8859-1?Q?82msHJfqg1bslGLWtgnHSUidxWqii1IRC2GK1Z0fkXimqmfnfY+Zwp8MhC?=
 =?iso-8859-1?Q?k3DfPAJJQ60Br3CnhMqeQTE/dIBMXr7lp/fSNGhMaIzLAzsSuY68vIFZAS?=
 =?iso-8859-1?Q?enuctifDLmfvDMtQzu6+dFbzdxpW1FYweoJV33FyVGgeZTkUl7TXc2STC+?=
 =?iso-8859-1?Q?7GdXLZAPLjwFos5J5rB7+xRoJGYfH2hrKpmDbEnFYstKpbNOO/aUDl0MRG?=
 =?iso-8859-1?Q?QdSwdXo/lCY79IWeQh7AHcKxdMnEAyEqnBs49NUQRg2M9mvBtYRX1fm3+R?=
 =?iso-8859-1?Q?5U46PTS3jP3ybbL6GWPAjP7CZAP2CYMNskTepw7rLJmSLO5Flb/I5JpjYl?=
 =?iso-8859-1?Q?RaQoTNFRj1McB253n49kyk491nfzB1l8G2gzvm1sMcKIJdlo5upZFGWy2q?=
 =?iso-8859-1?Q?0jqXMKQvp/HZa2StrrsZz5A1eiV2cVpUfYAyZtXJ6ylqLWZg0xT2YMc/3n?=
 =?iso-8859-1?Q?+OlLBNfWW9AsASlzn4jwGSl1V47doBvAlGczSxP2RdZuVhPWr3iLJ5eHBL?=
 =?iso-8859-1?Q?I6vEb86eqVP7jUEsoZhz0SFdnZVszFWrbUx3yI4RinZcTi1PO4UI26bF8u?=
 =?iso-8859-1?Q?voo1ZPeXN9/qXdhXkijAS7u6awkUEEWg+ev0eek+MNV45h7hrdMkKzDGpl?=
 =?iso-8859-1?Q?KnBHkSyr6YIwg/xKJ7ScDMyAw6mpRweLxMr0tFOLQgOyWkPpiRkwHp9Z7m?=
 =?iso-8859-1?Q?9WaQims6boi2aD37yFJWVwdLgsy4TC3C28yzZOz/ShhcD0gjG8gDygVHEy?=
 =?iso-8859-1?Q?NgVeeyPI3GF8DVxqRuwoM1IbdbkRn6tXNd2PHCZ5+Ux/XoX2lcBnXZHGxM?=
 =?iso-8859-1?Q?gAm3uUpWOgFb7zmqlmUdw02AlkL/fmWL2Kgl0nbyP/VmYKKUlSVPsHg23v?=
 =?iso-8859-1?Q?DbdT2OnP9eYc+du6YboUACR7dTV1/M/uKDqkSsUfMouRzQrFR5OcK79UeG?=
 =?iso-8859-1?Q?moielqYmSPvddH8do0WqS9ygSSgEB3+Job/VpLaE7pfYaH/z8Kg0++JQzc?=
 =?iso-8859-1?Q?DHotclfR+Z0d+s6jR1f7Rmp2bfC+Padhbg8FFHLcgL3U+u2h+Yfz/oqh8I?=
 =?iso-8859-1?Q?WDoZz6o/19F1fHoZ1esSpcksSvKfEhr5Wcaeq+d3rH3aDkNWYZkncYeb/8?=
 =?iso-8859-1?Q?KPwlTkVqfMpWmg2idKj6koYeHhsnqeF9uckolsUVg7+kQYuTLjKzrGeLwq?=
 =?iso-8859-1?Q?SIvGsmwXnFuXIlIgJfdcMf64M5AOY09Uu5+SmllceX0WkhVlfEU+r624Yq?=
 =?iso-8859-1?Q?ZsehGWlCSy+kRcRZnTm7ihT9qlBzZxlus3Fx/UZI8ahnsCMPBxtwtRZUip?=
 =?iso-8859-1?Q?I1i1uSGcWea1d1CtwJmfZvhppscDsqnqN05Vv/2nMjrGqX+ADuobgrOCMm?=
 =?iso-8859-1?Q?A=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR03MB9572.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(42112799006)(7416014)(1800799024)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?v9PcU/Jf0LxEoGHN5FJPHMDhoCFJZiUSWjNdaVWG29sUc0wxLINNiZJDsR?=
 =?iso-8859-1?Q?hR7aSdnVRWdazbKzJuxQTbW3H7ifGXozOz1fFpg+u8oe6B4vnzkElKk0ks?=
 =?iso-8859-1?Q?3dVbkpfIrDzigbuXPDnVpKf6Z8flr9rRPyGCD4HLfBaXq8W7ENeglkoQPb?=
 =?iso-8859-1?Q?5qqp812qqTdb+OrkZ2Og6Wi1KOEHajHDc6+JgxOb4OYDZkU2JdgxcPDyPC?=
 =?iso-8859-1?Q?TTUcKgYYS3pj8k+l/1+wbGGFkYtoeir36CwmcjEE2nxiAbMzUve+qBh/y9?=
 =?iso-8859-1?Q?yATsxE+aj5QgKVkOzjgoqtUfCjjkD9Z5kzIVASv8yUJeTGnOBDn0vHlWCw?=
 =?iso-8859-1?Q?ilCYKo7aKtXJ+xB1r9hNyzzU8jqUDu9RzbJOlEUTtZGUMZhz3fbEqdLtWC?=
 =?iso-8859-1?Q?//bJDSQXM2pyUX3EBYUxwv/I9adeo5P0BVpUSftOjiNAwX4HAZBcmMwFa0?=
 =?iso-8859-1?Q?m2Zd+Tvw8OLSJ3z5fXsEEpApX3w/ddvozrO8OLGOfC3nNlTO7SHpJVTTrR?=
 =?iso-8859-1?Q?d/koWJBIF/AuGfxFNBJwzJuSWV9ccoACTLys9g9HOxGIA7Jzyi8a+Lv9Di?=
 =?iso-8859-1?Q?5LneeH/CSvTDS5nBgcuE9RKcW14Dpcghepdlk7hgdJoMMSQAm9fj/IgZPg?=
 =?iso-8859-1?Q?CBFsoiCmhmpoxqONHQpeEx1jQBBxFDC1DR5S44IJEWT0CXeqC12/78Ebwo?=
 =?iso-8859-1?Q?nZ/SJv+HnA7BSfIBpHVyt4NUCylCb++p4qXpGuUfw0V9Xh42XewZxD9kQ5?=
 =?iso-8859-1?Q?ush5J7O/0rlM3YyN24oJSWlQWCLQDzC+Z8KgN80co6HLV1eDgz/Zhjr70S?=
 =?iso-8859-1?Q?aNKstXHsGSsZnYQQV47+Qz0z2WH++GVFZnyarmS4VhbX6mMumHDLmk3QY5?=
 =?iso-8859-1?Q?mhhqUy1MWtNYG7rImBLKl+VdkIl7Nsq+1TlO6x7M3QxCsa9IENb6Ws6Z5J?=
 =?iso-8859-1?Q?a3yzCxNIDOrW9W1iOnLCy+dOeQIgJdIWT/Fg+mVqzOISYN0+clzZB8rbXA?=
 =?iso-8859-1?Q?krqEfg1ZdWkXkit40TtP4+BW8QmBoz5YVWeFMI6YmFKYCOGtyTh2rXbP6D?=
 =?iso-8859-1?Q?wFljHiNVZHGB9rvzNWeBuMd3ziARRp0l1wVJes5+/jhtHVA0itaN932tCn?=
 =?iso-8859-1?Q?OcEpTXY55AWT3L09ioV3JOtQgmAn7DwHRL24+nuIeDEKyWqRAovnGRoYOj?=
 =?iso-8859-1?Q?/2/PtuVgkzBJYPJUc5+y+H4nebQyfzKkcq4HjhTlxzlnZ7Cku/CD15XF1A?=
 =?iso-8859-1?Q?sKx7NlOFeiL7EdwEjehHWee+edHmDpDf2QsMcqofHJNss+WT6aM8hYP9sj?=
 =?iso-8859-1?Q?FpcVLeVHumz8pO7ZRXBQU4glNe1LvfjlgrwCn5/Sazk3gVvaxSAkiH8hBx?=
 =?iso-8859-1?Q?43+2dooQuXnjTpqpWV5/20oQADXl23iPfNFiOytgg/g/7HFgKof2aaoTgi?=
 =?iso-8859-1?Q?QE3umAcvui1YnEIBeIG+coibcPRM+kzwrZrwxH6Q3Z28QwOnzrkja+t4NH?=
 =?iso-8859-1?Q?1yPBfp5/dkK69S9I4Y2Yi0c67/+Fr9UmB1ndrN+wFDzh+ZuuambHGYjKMj?=
 =?iso-8859-1?Q?Yl9P0MIjWaZaRyooY90/KLGuTuozh/+73k9H5DywUZ0rNmsvkTYD7qjhTm?=
 =?iso-8859-1?Q?+/jrkSgLUJaDMiUOiZt5iOtrAXbXLqBNlSJc6+Cg0V9ATBg6hWVbcRKA?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: GV2PR03MB9572.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e45c846b-a3ee-40b5-89b9-08dde4734016
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Aug 2025 07:36:20.3861
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: FQ+W+r7wk07uRsFpdMjqz38M6hEWydEDYoMXU7iIBpprZxOTGXmqvQDh52ll4uUJz5EVUQnBnnHgPQ71wwdoJ/iURX5+0M80gLIHqvAhT9g=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR03MB8251

MISRA C Rule 17.7 states: "The value returned by a function having
non-void return type shall be used."

Deviate functions like 'memcpy()', 'memset()', 'memmove()', as they
return a value purely for convenience, their primary functionality
(memory manipulation) remains unaffected, and their return values
are generally non-critical and seldom relied upon.

Update 'deviations.rst' file accordingly. No functional changes.

Signed-off-by: Dmytro Prokopchuk <dmytro_prokopchuk1@epam.com>
---
Changes in v2:
- removed snprintf(), strlcpy(), strlcat() from the patch scope

Test CI pipeline:
https://gitlab.com/xen-project/people/dimaprkp4k/xen/-/pipelines/2003537146

Link to v1:
https://patchew.org/Xen/ad15582787e675fadf92502f85041c3232749a99.1756112701=
.git.dmytro._5Fprokopchuk1@epam.com/
---
 automation/eclair_analysis/ECLAIR/deviations.ecl | 5 +++++
 docs/misra/deviations.rst                        | 7 +++++++
 2 files changed, 12 insertions(+)

diff --git a/automation/eclair_analysis/ECLAIR/deviations.ecl b/automation/=
eclair_analysis/ECLAIR/deviations.ecl
index 7f3fd35a33..8335af1bce 100644
--- a/automation/eclair_analysis/ECLAIR/deviations.ecl
+++ b/automation/eclair_analysis/ECLAIR/deviations.ecl
@@ -575,6 +575,11 @@ safe."
 -config=3DMC3A2.R17.7,calls+=3D{safe, "any()", "decl(name(__builtin_memcpy=
||__builtin_memmove||__builtin_memset||cpumask_check))"}
 -doc_end
=20
+-doc_begin=3D"It is safe to deviate functions like 'memcpy()', 'memset()',=
 'memmove()', as they return a value purely for convenience,
+their primary functionality (memory manipulation) remains unaffected, and =
their return values are generally non-critical and seldom relied upon."
+-config=3DMC3A2.R17.7,calls+=3D{safe, "any()", "decl(name(memcpy||memset||=
memmove))"}
+-doc_end
+
 #
 # Series 18.
 #
diff --git a/docs/misra/deviations.rst b/docs/misra/deviations.rst
index 2119066531..5ee97f41e8 100644
--- a/docs/misra/deviations.rst
+++ b/docs/misra/deviations.rst
@@ -576,6 +576,13 @@ Deviations related to MISRA C:2012 Rules:
          - __builtin_memset()
          - cpumask_check()
=20
+   * - R17.7
+     - It is safe to deviate functions like 'memcpy()', 'memset()', 'memmo=
ve()',
+       as they return a value purely for convenience, their primary functi=
onality
+       (memory manipulation) remains unaffected, and their return values a=
re
+       generally non-critical and seldom relied upon.
+     - Tagged as `safe` for ECLAIR.
+
    * - R18.2
      - Subtractions between pointers where at least one of the operand is =
a
        pointer to a symbol defined by the linker are safe.
--=20
2.43.0

