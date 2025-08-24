Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DE9A7B331A1
	for <lists+xen-devel@lfdr.de>; Sun, 24 Aug 2025 19:28:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1092163.1448185 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uqEVS-0003ck-Gr; Sun, 24 Aug 2025 17:27:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1092163.1448185; Sun, 24 Aug 2025 17:27:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uqEVS-0003a2-E0; Sun, 24 Aug 2025 17:27:50 +0000
Received: by outflank-mailman (input) for mailman id 1092163;
 Sun, 24 Aug 2025 17:27:49 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=epLo=3E=epam.com=dmytro_prokopchuk1@srs-se1.protection.inumbo.net>)
 id 1uqEVQ-0003Zw-UV
 for xen-devel@lists.xenproject.org; Sun, 24 Aug 2025 17:27:49 +0000
Received: from GVXPR05CU001.outbound.protection.outlook.com
 (mail-swedencentralazlp170130007.outbound.protection.outlook.com
 [2a01:111:f403:c202::7])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a4b04cb3-810f-11f0-b898-0df219b8e170;
 Sun, 24 Aug 2025 19:27:43 +0200 (CEST)
Received: from GV2PR03MB9572.eurprd03.prod.outlook.com (2603:10a6:150:da::5)
 by DU4PR03MB11037.eurprd03.prod.outlook.com (2603:10a6:10:5f3::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.21; Sun, 24 Aug
 2025 17:27:41 +0000
Received: from GV2PR03MB9572.eurprd03.prod.outlook.com
 ([fe80::edd1:842f:9b14:509e]) by GV2PR03MB9572.eurprd03.prod.outlook.com
 ([fe80::edd1:842f:9b14:509e%3]) with mapi id 15.20.9052.019; Sun, 24 Aug 2025
 17:27:41 +0000
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
X-Inumbo-ID: a4b04cb3-810f-11f0-b898-0df219b8e170
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Zlsk3+prIwpYlpH4Zk6nh3np/0qCPAdeb+DtgmS7+ITL/TFX2fbpxvMS2BXrQoywdZXytOn7bdobXdaHnEZmxZPoZSAxnpKahBHslsyvtZ3JyZl3lGNmIfYOKRD3f6H0WHeISKyQAfe3fO2T7PwBuqKUPh9hU525uGghniwf58oSl3RzaB1aEYEiVeJTZGXrBVDv3D/TkzqIalYuQ51Mh2SHU2PUBfBhFmYkH0QMKbnElvEWhRPoKcXFHJ2zF3DJs8SqWZ38mpqRd/b32tQCEutiEcWSrjV2j/M7wHVN2BMaBaDvpIwvGwgdOaHADUDBBwvAcTeCe2ZJJ/+EV8fAOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ta1fZvw0Prwed4zFLSHqjbQtXhX+eSxrwrowmHnYric=;
 b=U5J8wOslolQdgtYSdiR752fl9ZsimZImRr4AYPsK97eUMVhTrlKVdopG3gKYFbvmlESYbAPez7RHBPAZgdrux3ighPTKZu9RCCEBcuBu4AadnaVXQwX6vs5MXt7PSFiuO4dTut0zop8B/q5xNGqmLfQm0IK9NLJyB1jZzWokamCGhP06nA2bJR0LFB2JQaNDZptKsByYQzGfGAXUHIqLgOZdR28q5jCHAyKzux0l/f3XpOhWDLL4H5ck2k56+E4NPiXPMprl3SGFrFasa4PxOSCKUEz37qaxDpu2Oof37pzttqEMdgzQQoGc0Eh/vB9cj/fsSQuXHkoc+G/ltWZ24w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ta1fZvw0Prwed4zFLSHqjbQtXhX+eSxrwrowmHnYric=;
 b=lY1DPmPW1gX6ZX+jK6PNkeD7GPoSAK/laG522kAz2QT93/7jfC1bJndhCowmO2U+PWGcmi0gWwP2Wr45WO2/QkYqWOH23eXw3IdQyrfZDEzuGUhgBfJ5SakKuUj1Zo/qMJsXtEPt/RLcqCifxm39BrL6WbFwxVnTV0Hia2hRVMi3fU5pFu2gvTqJjSCoJDWROsDrxta8fCglYpRz2hU4oMiD8VuFkddqf0Otm/NzMlN4D4Embrc8kWOwpjsArB+bt68AXgTIrdkuy4vFCvEj6lMOmY/jtYBq9DKj9aGd1cWZibpHSadPjK/1Ni0xfF9nWdCjEGPRa4N/s8lW/iYYnQ==
From: Dmytro Prokopchuk1 <dmytro_prokopchuk1@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Dmytro Prokopchuk1 <dmytro_prokopchuk1@epam.com>, Nicola Vetrini
	<nicola.vetrini@bugseng.com>, Doug Goldstein <cardoe@cardoe.com>, Stefano
 Stabellini <sstabellini@kernel.org>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>, Julien
 Grall <julien@xen.org>, =?iso-8859-1?Q?Roger_Pau_Monn=E9?=
	<roger.pau@citrix.com>
Subject: [PATCH v2] misra: add deviation for MISRA C Rule 11.3
Thread-Topic: [PATCH v2] misra: add deviation for MISRA C Rule 11.3
Thread-Index: AQHcFRxkNZTwf+a94EKUOod0hf+3zw==
Date: Sun, 24 Aug 2025 17:27:40 +0000
Message-ID:
 <859503540c6b7447f13365c2b70b386c2975edd0.1756056144.git.dmytro_prokopchuk1@epam.com>
Accept-Language: en-US, uk-UA, ru-RU
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: GV2PR03MB9572:EE_|DU4PR03MB11037:EE_
x-ms-office365-filtering-correlation-id: d15c57d6-4c1e-4cde-04d0-08dde3338754
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|7416014|376014|366016|42112799006|38070700018;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?oo684HmTG4gQ4j8KkNZgEMzDaCO45aH3A9L4/U/MzyCxYgDMg4InoEJxlL?=
 =?iso-8859-1?Q?ezs90am0b7M+jz2ayyHDlvU1P8CmxH0hKY4NLieXCx3x9ZRoEkuSItH0DQ?=
 =?iso-8859-1?Q?9srMpaMjLr8gv/GlJp7ykDDJAKMtU6rtNA6P6La/1wsRkUhBPCvtv2HVbh?=
 =?iso-8859-1?Q?2zggiBFUtkVKbrndfkiLKqjda/JjwOjdRCgmjUABi+mlO3HSVRmATxNEzK?=
 =?iso-8859-1?Q?HDNB/LH4S5ai3SQPpL7SLeL+DVoMemRAB1IhU7mQOWnU28wYlWGG45vq9U?=
 =?iso-8859-1?Q?VknPS4yYoHKkwkNmd6ducK95UzV0B1shm/HoJbsRlI8dKg/NWhMIuDIJS4?=
 =?iso-8859-1?Q?XfIzVAJ5yQbLT7cuGWyAsEbeJ4FsC1kPvHX+mty80ftNC7dhDEk1TXoCSJ?=
 =?iso-8859-1?Q?xCcjsURM0d8j47Bzwd8HVwYrKQ4zl/CyZuUX6cZ6oJjGFnvLm1bA8RaZdO?=
 =?iso-8859-1?Q?lVmRN2g9nb7gEknZ+WNkzgQAAvKGzpm0ZgwRU4ZMNy0LIyVrto5xFjZLAZ?=
 =?iso-8859-1?Q?GMcvLLOxb6FZDLJh3bX/9p9LGoSpousvOo/zUwOQbbRBJ5c1Ja0wTQYkBT?=
 =?iso-8859-1?Q?IwwFL/EOnYWiN5CuQCW12eRMTlHT2vno+i4CljWe/hMnbWvbas3XXVHPWE?=
 =?iso-8859-1?Q?diwBeOdgdgEUXqC8n7BhRgSxxTzYwHQ/iZsTZLhb1BiNRF1bpdFvj0Xcad?=
 =?iso-8859-1?Q?5qEzJEd9hHyJTkjbRhOLWIk0++PYYGoJgLa+ZCgOC3QoGcMF93zCn1E/gJ?=
 =?iso-8859-1?Q?sAhgqkSqg1lqA6GkoGq6mETi8X/N1DEL/pvl+6zUebbuWG5C3MljyN+5/n?=
 =?iso-8859-1?Q?4ugb9ijDdNbbvUmOzaHeKQeBlTSerbZ9g94FliE4sKm/B4EoSZUuNoTt7a?=
 =?iso-8859-1?Q?pTFUlxbFbylRg7ds+6P/QN+LLhUVr07cJZYPOUMJ8oydfshmMOlj34wcUk?=
 =?iso-8859-1?Q?UX3KxlqYhuFRly75X1i9CUXl8F+OvieOmZLihXdQPrLuc6WcAYLokL6Ykt?=
 =?iso-8859-1?Q?QOiY4esTs3rtBFcNMs6zWprx3dwP9eITk25i1qoosplRo/8mLU5JpJHtY6?=
 =?iso-8859-1?Q?/q5kFYNY889RZIC8+veDY3kuETXvEB2d7XmUycB125Q5mpcWtbaO3w6Lc4?=
 =?iso-8859-1?Q?mrwzNroToYn1RaQJjyKRW2nYRbRcyDJ98bBprS2YIpqXTv9f0xMs3SyGhe?=
 =?iso-8859-1?Q?SWQ7qhqmSclGK1QQRE2kSrSkVPG6ucch1HGDOamNOpLbPZa1oa4esWE5Vy?=
 =?iso-8859-1?Q?GydOrxIWmGZiH+6RI0tWXqtZUTPIXUgyoDnsWUFgisZ+YUeAS98e1agXTM?=
 =?iso-8859-1?Q?9ZYQEGcy+odBIqLNL1xaRkLONg2L/aKGpt4AMI7zWZt5PeR8dEFkSv3hjF?=
 =?iso-8859-1?Q?msJ3yRm44u8g7LU8PbMT/c7ulqZDeEW9W8LyfUBGU8sMfjNirG2kIvAQAy?=
 =?iso-8859-1?Q?aGST/zdFy9e49VP4ds57fKKfBy9vr8y0O67m1rnmlkZdYQpgbiRkrHbEht?=
 =?iso-8859-1?Q?E=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR03MB9572.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(366016)(42112799006)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?6wWDDEEsrvBeeKL0IXUkjVkHIC6vy4IpJOH+uf9J8tQQLfSjKaukBoEgPl?=
 =?iso-8859-1?Q?zleux4YLYUWbT2HaSsga1KTfpPTCHCcyamC/NJc9+PxcAhATqdjaHV7JpM?=
 =?iso-8859-1?Q?r3LuO6y5DR2UwPA918DFGC1aecXueSdFWAQOXTAfiwqMh72qrqaFbZqR7p?=
 =?iso-8859-1?Q?p2SvqU1PlpRM42KUJRkyVBDZmqjJx/wq8C98DT3k4o4pbjtu+x18IRBV4l?=
 =?iso-8859-1?Q?3pr/6HZ7Tv/eunrHTdyx4ZhwNps49evOO69jTuZDHlsm5TGBy8DgMFD4Tz?=
 =?iso-8859-1?Q?MUHQAp3uKUhD4zg1JACvLlrqiIF0J6z9AhOtu1MYTsIHEQMmHx5kSHAnIo?=
 =?iso-8859-1?Q?c3ACiZVoDoUHZzDqotLj1CyWLkHRq1L84WmjOoYK9F7e9u89vkdCHjklBN?=
 =?iso-8859-1?Q?1JXbemgDP4ZE/oNBxBJoAVFdgkdiigvWRAcGA/N6Moir26b9a3hTEkBx90?=
 =?iso-8859-1?Q?moC2sqkAkMFAcecf6zrTHvpszuVVRzl0wIxKIn8dwIRQaJZfXxoZ/yGhcG?=
 =?iso-8859-1?Q?y+dFKkHCH31TP6sRWM3dS/jwwIWtqQr3ZjXvhcxMilrxYWXn9iOn77zNUG?=
 =?iso-8859-1?Q?F3ObsgXsXQ/Z6MSHHxRkjhe5j5D5nkzJxbxIhAiGkDYbDHAR982KFljN1A?=
 =?iso-8859-1?Q?YonjJUPwFZStPJqF31W75/mFW5/5YW4AJWQ+5oLlKNmXrBwd/umcWIO40Z?=
 =?iso-8859-1?Q?4jVfo7Mtr3wRI0F5iEMkUZGq8RzFCa+zlsvACfCPAYyEUT0XXQriYGH6MH?=
 =?iso-8859-1?Q?n7BHLQRc0+CFsMQl2xtb8+TnTwkIvAt02Ode1ARsI00GKXFOxsPIB1y8mV?=
 =?iso-8859-1?Q?zTGfYSh6Ixby82TYcPscZRttBf+g5/bu8ROq/TkWw4Bj37TwN9AVcDqlOp?=
 =?iso-8859-1?Q?baBoUFIST1T3XEPtMDlRRaI2tgA53ahN5vRs9+W2O4Cc+LL/IWrFSBl/dV?=
 =?iso-8859-1?Q?gV684RFH8X2GVKazd11wRXteR5lHNSb5ULq9RORHZVueiE0F+vRHWh5mRX?=
 =?iso-8859-1?Q?WIWb9Es5RxZa2UYs2wytHX6zWeKf1yeEbpMDp1otORPC4NaOkdT7S2ezVc?=
 =?iso-8859-1?Q?5P0FIIzn9OWuQAgDKahN0O4f7VvX359SfsfaUyVGWbPpmJwUL4YmE0CcNj?=
 =?iso-8859-1?Q?k9KZG2YUOaFQC8bGYpmM0tLlLFYpdkSP9VveFg1yM/2V1iMEehkjdUwoAF?=
 =?iso-8859-1?Q?FYDZFM9RNynMd31gaVK/OnnkIE/B/9ctU098Yc8zRgsznfzooIp1PKDa0M?=
 =?iso-8859-1?Q?fRmrVQX6oYChD8Sw0BiLKIwo3vWIi1r6Ny9W2x2TtC6LWcU/hpJvMKmt5w?=
 =?iso-8859-1?Q?4Tsu6d5y0Mv3SRn/IbIol9Dhov/nJsdCDYFAhqSGODaNrumG4SI+XNDiwh?=
 =?iso-8859-1?Q?zGoA7MkIFypirSQsUCphuUfhII1yNtz+dgfLWf5e/LmsuzeQm8mfC3ra5Q?=
 =?iso-8859-1?Q?YUESi+nCa98KYYC9T1Ri7rQBwWuvsTViPIeyHZh08I5CG7OcfLQST5WBHx?=
 =?iso-8859-1?Q?ysXqHSD+6rYhSiKQybWpXR6rYU9Ik+ZRVh+2jC1645jAmQwYCNvZ6lM6Qx?=
 =?iso-8859-1?Q?My0e5rkCt6TU/rkFRJ1wCTjbz2YDwyv9t3PCUhXpo7sEtSsJegWVLBjke6?=
 =?iso-8859-1?Q?87XvWhcAAh+Pw63yoG5hGbIEliKqEmN1Kgrm2/IIULB89aAjoCm13Kfw?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: GV2PR03MB9572.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d15c57d6-4c1e-4cde-04d0-08dde3338754
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Aug 2025 17:27:40.9351
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: DKu5DczvDm6VqZy+u6EWCKYrqsFqAbDnHhRcy8VyoOCzXC7S5bf8G9kfOwnjsfEQMbs+xdUnL9ns8517OgcQbwLkOuK5br/aqDcDEUTOhJc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4PR03MB11037

MISRA C Rule 11.3 states: "A cast shall not be performed between a pointer
to object type and a pointer to a different object type."

Violations of this rule arise due to the 'container_of()' macro, which cast=
s
a member of a structure to its containing structure:
    container_of(ptr, type, member) ({                             \
           typeof_field(type, member) *__mptr =3D (ptr);             \
           (type *)( (char *)__mptr - offsetof(type,member) );})

The 'container_of()' macro is safe because it relies on the standardized an=
d
well-defined 'offsetof()' macro to calculate the memory address of the
containing structure, while assuming proper alignment and ensuring no
undefined behavior, provided that the input pointer is valid and points to
the specified member.

Configure Eclair to suppress violation reports related to 'container_of()'
macro. Update 'deviations.rst' file accordingly.
No functional changes.

Signed-off-by: Dmytro Prokopchuk <dmytro_prokopchuk1@epam.com>
---
Changes in v2:
- removed '-enable=3DMC3A2.R11.3' from the monitored.ecl file
- fixed typo: "Convesions" -> "Conversions"
- added parentheses for macros container_of() and offsetof()

Link to v1:
https://patchew.org/Xen/d6a8682c98880d66ea99f882520b3defda0e3fe0.1755672275=
.git.dmytro._5Fprokopchuk1@epam.com/
---
 automation/eclair_analysis/ECLAIR/deviations.ecl | 8 ++++++++
 docs/misra/deviations.rst                        | 8 ++++++++
 2 files changed, 16 insertions(+)

diff --git a/automation/eclair_analysis/ECLAIR/deviations.ecl b/automation/=
eclair_analysis/ECLAIR/deviations.ecl
index 7f3fd35a33..42b84429f0 100644
--- a/automation/eclair_analysis/ECLAIR/deviations.ecl
+++ b/automation/eclair_analysis/ECLAIR/deviations.ecl
@@ -403,6 +403,14 @@ because the semantics of the 'noreturn' attribute do n=
ot alter the calling conve
 }
 -doc_end
=20
+-doc_begin=3D"Conversions in the 'container_of()' macro are safe because i=
t relies on
+the standardized and well-defined 'offsetof()' macro to calculate the memo=
ry address
+of the containing structure, while assuming proper alignment and ensuring =
no
+undefined behavior, provided that the input pointer is valid and points to=
 the
+specified member."
+-config=3DMC3A2.R11.3,reports+=3D{safe,"any_area(any_loc(any_exp(macro(^co=
ntainer_of$))))"}
+-doc_end
+
 -doc_begin=3D"Conversions from and to integral types are safe, in the assu=
mption that the target type has enough bits to store the value.
 See also Section \"4.7 Arrays and Pointers\" of \"GCC_MANUAL\""
 -config=3DMC3A2.R11.6,casts+=3D{safe,
diff --git a/docs/misra/deviations.rst b/docs/misra/deviations.rst
index 2119066531..db9e09c3cb 100644
--- a/docs/misra/deviations.rst
+++ b/docs/misra/deviations.rst
@@ -393,6 +393,14 @@ Deviations related to MISRA C:2012 Rules:
        (i.e., less strict) alignment requirement are safe.
      - Tagged as `safe` for ECLAIR.
=20
+   * - R11.3
+     - Conversions in the 'container_of()' macro are safe because it relie=
s on
+       the standardized and well-defined 'offsetof()' macro to calculate t=
he
+       memory address of the containing structure, while assuming proper
+       alignment and ensuring no undefined behavior, provided that the inp=
ut
+       pointer is valid and points to the specified member.
+     - Tagged as `safe` for ECLAIR.
+
    * - R11.6
      - Conversions from and to integral types are safe, in the assumption =
that
        the target type has enough bits to store the value.
--=20
2.43.0

