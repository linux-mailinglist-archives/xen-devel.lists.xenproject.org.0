Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id WwFJFyifU2qhcQMAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Sun, 12 Jul 2026 16:05:28 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AA2E5744ED3
	for <lists+xen-devel@lfdr.de>; Sun, 12 Jul 2026 16:05:27 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=epam.com header.s=selector1 header.b=WFn1G+gN;
	dmarc=pass (policy=quarantine) header.from=epam.com;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	arc=pass ("microsoft.com:s=arcselector10001:i=1")
Received: from list by lists.xenproject.org with outflank-mailman.1361069.1613580 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wiunb-0001Sn-2Z; Sun, 12 Jul 2026 14:04:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1361069.1613580; Sun, 12 Jul 2026 14:04:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wiuna-0001RP-VS; Sun, 12 Jul 2026 14:04:50 +0000
Received: by outflank-mailman (input) for mailman id 1361069;
 Sun, 12 Jul 2026 14:04:48 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <dmytro_prokopchuk1@epam.com>) id 1wiunY-00011z-Lm
 for xen-devel@lists.xenproject.org; Sun, 12 Jul 2026 14:04:48 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wiunY-001wfr-2Q
 for xen-devel@lists.xenproject.org; Sun, 12 Jul 2026 16:04:48 +0200
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <dmytro_prokopchuk1@epam.com>)
 id 6a539ec5-bab6-0a2a0a5309dd-0a2a450cb914-28
 for <xen-devel@lists.xenproject.org>; Sun, 12 Jul 2026 16:04:48 +0200
Received: from [52.101.83.131]
 (helo=GVXPR05CU001.outbound.protection.outlook.com)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.2)
 (envelope-from <dmytro_prokopchuk1@epam.com>)
 id 6a539eff-e897-0a2a450c0019-34655383bb6d-3
 for <xen-devel@lists.xenproject.org>; Sun, 12 Jul 2026 16:04:47 +0200
Received: from AM9PR03MB7526.eurprd03.prod.outlook.com (2603:10a6:20b:3de::17)
 by AS2PR03MB9540.eurprd03.prod.outlook.com (2603:10a6:20b:597::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.23; Sun, 12 Jul
 2026 14:04:46 +0000
Received: from AM9PR03MB7526.eurprd03.prod.outlook.com
 ([fe80::904d:5820:80e1:41ba]) by AM9PR03MB7526.eurprd03.prod.outlook.com
 ([fe80::904d:5820:80e1:41ba%5]) with mapi id 15.21.0181.019; Sun, 12 Jul 2026
 14:04:46 +0000
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
 b=XIXYm8nLETFalaod7ahYh9tne8QIUChUnJIVG6wlGhZd4lR6+DU5esvhk01y+Zsa8Yc8DZeT2z/x7OfV8xKB9ciqZSXvd5R6Sni5ZFjt9e1Mk6ckB6fy5e0qGZnrqnvseufpgmhbhG4Uvauo4JOEQ1NCO6C+VITPBj4d/L80feH3xHKn48vXv/Ml/IjmhOIBSka3A6b3Tc8sxOYSPgL9NE2g/1XYAgu250tyKC/wGiM0sZRMCjggxy3AWEC6QkLXQ0grMEb+wz/Ewwdw9zD7ori8GuYhjGyqTil+ufS95kpoSxVB7pH7uCJg6EqJKBuz+h9NLhcCASDdM1oAHHzjAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0pZ1BxC6Bi6p0st6xJAQ+Jaqgwg9JBDmWidIIVcm3DY=;
 b=viqg/sZvTmdp3jX+qkR2dS0BXbIjXWfCSH2E2Ptpxfw7gZB+P4q5RhuRJoRE56MAWz8wuA8OJ8sz6UNZQ/qW4PEBbcVXCPrW6/EVNGnhyv+CKZHNXLMy+BgQvHaUmX4cX08JmIUmEv6aw2Go+jogfV/6CeV9Yj0aYTyIKwTG5ycb8PM3pKyJK3uedPeoJB6feSl3IOP+Pghm3XEudf9uM6yW53ZNmPvaucbSIMDAOPVPqPrV5ZWjOvG/vXzZsDBIgIZOpOktj3wEq00x1frAdqXrgcDz91z5N6UOts3b7iligbPIR8qg5PqHTF7ggpAqSPRj5VakFFFQzMju4rCa4A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0pZ1BxC6Bi6p0st6xJAQ+Jaqgwg9JBDmWidIIVcm3DY=;
 b=WFn1G+gNmwzD4cqHj7A4BNPGt39adXc5p4XRY8ZJtFeEo0dukSkXrFUenqBSuOhFDDq1J6XUyUGs+0sluQd/pVyVdpbZphUUYjIPBKi2q80mFh9ue8Y/1e0PGFPLN8MybWBaVnuNhlzM7GLmWyC1Tzr55qlTydn76ihWNd2Q0ir8NUIadpdpVF+2n6zkgVCSHfP3YCkYvcUhCgZYE5BBBeSZzmwsYVEin9YmTpmvNvDGxTOKw26tyDRb8s64r8YtdVnxBn5tr/+oCnMxAIFvuy6o4gib0V31kRVzm4HDqJsVbvWTkS/AxMZyKyvI5oBdPoAoXxr0kwnhIZhwLSLYEg==
From: Dmytro Prokopchuk1 <dmytro_prokopchuk1@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Dmytro Prokopchuk1 <dmytro_prokopchuk1@epam.com>, Nicola Vetrini
	<nicola.vetrini@bugseng.com>, Doug Goldstein <cardoe@cardoe.com>, Stefano
 Stabellini <sstabellini@kernel.org>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>, Julien
 Grall <julien@xen.org>, =?iso-8859-1?Q?Roger_Pau_Monn=E9?=
	<roger.pau@citrix.com>
Subject: [PATCH v2 2/3] misra: deviate MISRA C Rule 5.5 for 'request_irq()'
Thread-Topic: [PATCH v2 2/3] misra: deviate MISRA C Rule 5.5 for
 'request_irq()'
Thread-Index: AQHdEgdlLv7TI7G6yke6ZZX0wGJbmw==
Date: Sun, 12 Jul 2026 14:04:46 +0000
Message-ID:
 <db38c988b728a52bd7a921201e44558e43c7ed2c.1783864426.git.dmytro_prokopchuk1@epam.com>
References: <cover.1783864426.git.dmytro_prokopchuk1@epam.com>
In-Reply-To: <cover.1783864426.git.dmytro_prokopchuk1@epam.com>
Accept-Language: en-US, uk-UA, ru-RU
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AM9PR03MB7526:EE_|AS2PR03MB9540:EE_
x-ms-office365-filtering-correlation-id: 1921255b-fac5-4f2a-94be-08dee01e8798
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|7416014|376014|366016|42112799006|23010399003|1800799024|38070700021|6133799003|56012099006|11063799006|18002099003|22082099003;
x-microsoft-antispam-message-info:
 b9g93jowf4YkdNINRrEtZEbCpazx+LN0AYN9BJBt43pH/0RugH0VxJg6WGDVAWqePMYfu6Ir9+S7z+xemBmwjwvU+KJ1E5ui9j4fUjEJqfL7t1Ei6KQf03IxJpXnHmOrIYOcBEIWS1h56xSSgggUqr9ODArYGiQclacboc2juD80HBRwmfYsPHdgwEb7WW6+Ovr1uz0fx8h0X5W7C1xL9TxcMR2owrtL1OdGNxktAhb6j/K5L4U/OdD/2yU9BxlgC7sLiBNQHFf2zZWacWrNdfM9NSt5zFDLQuH0k6jPWYSWZsFpKQcm84fL7KzjhlIANvVWtn7uOcy1AfZ5qGTVs6G16J+jVCDe62yfU8+Yv0SmPOjaZiwkxLR49LnlF41DiZluYRKBE9n4twW5h9L12M5nIDlFkvvH53g0VHKwXF6Sa7AdoOLwnsRIn+uZk61W4ONyzWnYFL4d0W7K2UNzthWT/0G1Y3HfBx18GoUJWN5ZTIf1fJMENYA2RhdKKaQRev73FB1ObZwUTVojULUusCc5W3Uhk6jN7psIc4fSnIl/djngaOLF3Ez36ntWP4SOOiKgyZQtFED9yfnP6/7AGoLTOgKwe6SpoE6MHrg50/WmatgkyUvfI2lvXye1Chv4it8U+AeitHQ7z/mG+FdESu9/vMSpXQ7jdbf4GAu32FGaA+DAe6otJGGxxJwASHPBSgTNZusrmsI3OauRhe48eWSdxv4YKSVKP/ejo/idrHk=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR03MB7526.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(42112799006)(23010399003)(1800799024)(38070700021)(6133799003)(56012099006)(11063799006)(18002099003)(22082099003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?lOVuiFzehkbcRSWNxKJL1taZNj8TVQKPGTGrmgWLGvkw1SxCmYKwZZLT/y?=
 =?iso-8859-1?Q?HH80FG+V5n4ogoPAv5GsBAYRAHwtbhAMTNMr2TCMANeCJqZKmDx5nZr/1q?=
 =?iso-8859-1?Q?ffHhdExcdxbNU+2grDy7z1D2uYrVzV5R+6Bu40jAol5oodpPRnVq+j5IDw?=
 =?iso-8859-1?Q?p+2gGS6FJVgK4+oGx8g4yLVeicvo+wrpNBy+XhGFpzr0d0Y8xXVOPi+Pso?=
 =?iso-8859-1?Q?Ex3PqBYt0neM5hCEA682NbNH93bFQUz6sgTRktKpq15gsXkNfOCQLnKTGD?=
 =?iso-8859-1?Q?C/9CK8b/dtBGqgs9SVNluLsIZrjataNs+BdDBl8LdcU0pljf9+EdCnxP/F?=
 =?iso-8859-1?Q?3mhF9NVfMkIchJvt4G3syduORSAoYsYCD/t1TEZQOd89OuhiNB+VVWfk4G?=
 =?iso-8859-1?Q?bKc1FAYBZJGh9dUUlXXIYFdgJg24gLry62HdOrQx1523YsrupehT/lZB9H?=
 =?iso-8859-1?Q?gp1BjvMpTkyWZMC/HouVrI07xVRxAO1F+xkjHDPj71zWHlnA66WHXKc4v2?=
 =?iso-8859-1?Q?w0gDK9TUDMyGYfXmcvL6eFlMwUuhRcOj+EIlX7ryEn57dXWXk8PzWRD+9m?=
 =?iso-8859-1?Q?m0Qx2o76mGTV06mQeRliokUOQqntm5Q4/LghyUE1st4S5Zp6QTqPe3+bqW?=
 =?iso-8859-1?Q?Szr786quKJP5E+cyBN2/PP8lmzCHUxPHu5v4LWWoi3Eg/moUWhBz1hXOi1?=
 =?iso-8859-1?Q?SFCgboNy7GSYkodJulZQT4ZzmWDDgGfoO0c29Jb5478rTuYwY082+8BbKz?=
 =?iso-8859-1?Q?duiIc1Bkq8CPNUQIcvgoPv0k9YIwBj50i/Pe/V6e4utoiLLk4bPVAES3Ui?=
 =?iso-8859-1?Q?Vdfgnxb6ZSrLbRN7qrTaikDW+OxLrMz/dxkYtCLuP5lSNzO8rkQQFoeKgB?=
 =?iso-8859-1?Q?1mMtHXvGH9mZ3tZ/Osu4+HfDNuLqV+lZoIXs3qPpM4WI0T4QyynHCNqohV?=
 =?iso-8859-1?Q?KXg4frwwg87rtG+WqNDmKnsd9gdiqzYitMYxMo4AZy5A8tqQR9grzL/n/K?=
 =?iso-8859-1?Q?snsvi7e0E2yDFYtajOtSdKHjzhos7E63VRo7+jT8Y2N6lNtCh1vcnDLRpz?=
 =?iso-8859-1?Q?7Xnwdht0OW1jDbHdyC1T/COE8dAMUsJunRrpfTOA2zRxI+sfp9oWFU7UE6?=
 =?iso-8859-1?Q?uWp9FIQBLcVK4jwp0Ay/qheI/gI4LLy1FIZxh1J8cY8Wki1OegsQI8oeuH?=
 =?iso-8859-1?Q?rdWCtqsm53qKLQNg+ms2MAC+tPm7PqO3i0KNVeRvEmXzTeeZ7MvzwVuZpJ?=
 =?iso-8859-1?Q?gS+6n6+Sn+dE63ZxV1z+FcZcR91NPFHAT6eq/9IWKGz+7VndntW1bB3mF3?=
 =?iso-8859-1?Q?XKJQRFjmrCVTObBdfdYQW0XeA3uugP19sjtK6yIQ8ewZb2ixnF/ivAhHQr?=
 =?iso-8859-1?Q?bsR1zIKSEKmG6FkQ1ZJCdTaR+5NhlNQU3XpXdeE48CvHBhVRkrWG0C0b5e?=
 =?iso-8859-1?Q?aJ+FHuMa5Gzx+4NOa8mXx1LDO6RXW/4tTunAwNBaRWAQJlgY9ypzwQmiZs?=
 =?iso-8859-1?Q?5cQHLhdFkeawhzV37WZGm0WSwxIvGGK2rrv8yRM5NBpnS9wYF34goj6cxv?=
 =?iso-8859-1?Q?psmFYLp1ooWGQQQ4JSWpGDtkyIs8QSa2pikfgzbwHgho9T0kHFp266Mzoy?=
 =?iso-8859-1?Q?51uKUR2ECFYIBnE53gkoyhdjfpUbUbEsAQIEMRn/iEWiGm55zgOg2KQXCs?=
 =?iso-8859-1?Q?FpRDIQ1GlIRgCcbe99NAIQ1c5yNnoSWt2N9iY3VL3GCr0Zq9e/hh1ZfTBr?=
 =?iso-8859-1?Q?U16jfxJFqhEu6/PRA2poFuRYc0NpX7kKs1N/sPVV1dVnlyxthfc/9w2yl2?=
 =?iso-8859-1?Q?4HCB6vDRT3lBBGlbZgXhx0Q9Ol/fpEc=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM9PR03MB7526.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1921255b-fac5-4f2a-94be-08dee01e8798
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Jul 2026 14:04:46.1247
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Qx4mbIYeN2Y27iyOqA/Y5XfGVae30gVtUPw+WGoM0gx2EYu/rPo1QBu+kiPCHQV/bGbc3AhuU5syrvkJwWOaUlrHVgtz/ZVKuZ5oPuzh3Rg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR03MB9540
X-purgate-ID: tlsNG-d25034/1783865088-57F636B2-C4CD68A7/0/0
X-purgate-type: clean
X-purgate-size: 3296
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[epam.com,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[epam.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gitlab.com:url,epam.com:from_mime,epam.com:email,epam.com:mid,epam.com:dkim];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:dmytro_prokopchuk1@epam.com,m:nicola.vetrini@bugseng.com,m:cardoe@cardoe.com,m:sstabellini@kernel.org,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:jbeulich@suse.com,m:julien@xen.org,m:roger.pau@citrix.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[dmytro_prokopchuk1@epam.com,xen-devel-bounces@lists.xenproject.org];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[epam.com:+];
	MISSING_XM_UA(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[dmytro_prokopchuk1@epam.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: AA2E5744ED3

MISRA C Rule 5.5 states: "Identifiers shall be distinct from macro
names".

Update ECLAIR configuration to deviate identifier and macro name
clashes by specifying the macros that should be ignored.
This includes 'request_irq()', where the Xen function takes the IRQ
flags before the handler argument, while the macro adapts ARM SMMU
driver calls by reordering the arguments.

Update deviations.rst and rules.rst accordingly.

Signed-off-by: Dmytro Prokopchuk <dmytro_prokopchuk1@epam.com>
---
 automation/eclair_analysis/ECLAIR/deviations.ecl | 4 ++++
 docs/misra/deviations.rst                        | 7 +++++++
 docs/misra/rules.rst                             | 4 ++++
 3 files changed, 15 insertions(+)

diff --git a/automation/eclair_analysis/ECLAIR/deviations.ecl b/automation/=
eclair_analysis/ECLAIR/deviations.ecl
index 7e743f7c5e..f7ffd78a36 100644
--- a/automation/eclair_analysis/ECLAIR/deviations.ecl
+++ b/automation/eclair_analysis/ECLAIR/deviations.ecl
@@ -136,6 +136,10 @@ These macros address differences in argument count dur=
ing compile-time, effectiv
 -config=3DMC3A2.R5.5,ignored_macros+=3D"name(hypfs_alloc_dyndata)&&loc(fil=
e(^xen/include/xen/hypfs\\.h$))"
 -doc_end
=20
+-doc_begin=3D"Clash between 'request_irq()' function and macro name in 'xe=
n/drivers/passthrough/arm/smmu.c' is deliberate."
+-config=3DMC3A2.R5.5,ignored_macros+=3D"name(request_irq)&&loc(file(^xen/d=
rivers/passthrough/arm/smmu\\.c$))"
+-doc_end
+
 -doc_begin=3D"The type \"ret_t\" is deliberately defined multiple times,
 depending on the guest."
 -config=3DMC3A2.R5.6,reports+=3D{deliberate,"any_area(any_loc(text(^.*ret_=
t.*$)))"}
diff --git a/docs/misra/deviations.rst b/docs/misra/deviations.rst
index ab80f01195..3eb9912c45 100644
--- a/docs/misra/deviations.rst
+++ b/docs/misra/deviations.rst
@@ -185,6 +185,13 @@ Deviations related to MISRA C:2012 Rules:
        function, so the name clash is controlled.
      - ECLAIR has been configured to ignore this macro.
=20
+   * - R5.5
+     - Clash between the 'request_irq()' function and macro name is delibe=
rate.
+       The function uses the Xen 'request_irq()' argument order, while the=
 macro
+       is a compatibility wrapper for the ARM SMMU driver that adapts call=
s by
+       reordering the handler and flags arguments.
+     - ECLAIR has been configured to ignore this macro.
+
    * - R5.6
      - The type ret_t is deliberately defined multiple times depending on =
the
        type of guest to service.
diff --git a/docs/misra/rules.rst b/docs/misra/rules.rst
index 4f7b7fc848..40aff97a07 100644
--- a/docs/misra/rules.rst
+++ b/docs/misra/rules.rst
@@ -226,6 +226,10 @@ maintainers if you want to suggest a change.
        because the macro is a typed convenience wrapper around the size-ba=
sed
        allocation function.
=20
+       Clash between request_irq() function and macro names is allowed bec=
ause
+       the macro is a local compatibility wrapper that adapts ARM SMMU dri=
ver
+       call to Xen's request_irq() argument order.
+
    * - `Rule 5.6 <https://gitlab.com/MISRA/MISRA-C/MISRA-C-2012/Example-Su=
ite/-/blob/master/R_05_06.c>`_
      - Required
      - A typedef name shall be a unique identifier
--=20
2.43.0

