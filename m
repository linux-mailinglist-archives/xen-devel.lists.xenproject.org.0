Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E5D5CB2FB6D
	for <lists+xen-devel@lfdr.de>; Thu, 21 Aug 2025 15:57:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1088698.1446434 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1up5mN-0003tY-PB; Thu, 21 Aug 2025 13:56:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1088698.1446434; Thu, 21 Aug 2025 13:56:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1up5mN-0003r4-Ma; Thu, 21 Aug 2025 13:56:35 +0000
Received: by outflank-mailman (input) for mailman id 1088698;
 Thu, 21 Aug 2025 13:56:34 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=aDER=3B=epam.com=dmytro_prokopchuk1@srs-se1.protection.inumbo.net>)
 id 1up5mL-0003qy-Ve
 for xen-devel@lists.xenproject.org; Thu, 21 Aug 2025 13:56:34 +0000
Received: from AM0PR83CU005.outbound.protection.outlook.com
 (mail-westeuropeazlp170100001.outbound.protection.outlook.com
 [2a01:111:f403:c201::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a4f4d098-7e96-11f0-a32b-13f23c93f187;
 Thu, 21 Aug 2025 15:56:32 +0200 (CEST)
Received: from GV2PR03MB9572.eurprd03.prod.outlook.com (2603:10a6:150:da::5)
 by PR3PR03MB6411.eurprd03.prod.outlook.com (2603:10a6:102:7a::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.13; Thu, 21 Aug
 2025 13:56:28 +0000
Received: from GV2PR03MB9572.eurprd03.prod.outlook.com
 ([fe80::edd1:842f:9b14:509e]) by GV2PR03MB9572.eurprd03.prod.outlook.com
 ([fe80::edd1:842f:9b14:509e%3]) with mapi id 15.20.9052.013; Thu, 21 Aug 2025
 13:56:28 +0000
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
X-Inumbo-ID: a4f4d098-7e96-11f0-a32b-13f23c93f187
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Xf6KdXASpAa1eatOlEv5eYIZrzMdSUIrbf+OD5Yi4ws+WpKgBA2BRSjdORejJuffxSPjyvhaKl3HSqj7CkvrnAODOla+hgn/uwL3bgx8C8QaUnYJNv43w0GvCJjJ3W7aKpeXgVdkz4gSg8Fe6HYgbt9BDFcSbPTF4H7hNEe3y/o3KLq+U/upGgdZqRPMeiI4rbx16PSpwBVqq9NA7piRDvYN7X5qyQ0aocDGCG4iqmyW9IVlNryV4mgACbwhffq+0mc555QE5G+Be6oY0MNYKBoglufu38iH6l7qL7XmBsBinUGa/mOkPhV0RyU7tlH+SwzoaVN8/64fjOPP7yaJWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zjnAPyabuhbFGzDZa6AQffS5/rmzZj4F9F9bNt8eKAk=;
 b=O9TuCG/2qeqmB/MSP/e9UBieQ5DXQHMM9utwZQJN2tvDjGfUntc1Qngq9nGpydSWYO1gMEEuEmmx7aOQ6+yl9f2nWTzA82bBkisdMFQBwqpRPDvhk89RfXKGqA1DQyY9eoNlw0CUpNAtKkfRpY9grE83IWENQM9ISNqSu1+0QvMvPQF+nAIsW1ZKlDVV9B6TtV652VhaErzyn0lU2iyVNLXjYAglb/tVSMnHiFRDhTbg+ko2mnzEWZueT2QC8U+eqzwrUoL990DPfJNVAGPDLWozR9h9fmI+QuwxvT/DFma+/EtixA2IGGWBxh1N/l4FsWxHCiAJ7qSRvmvj4jRFjA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zjnAPyabuhbFGzDZa6AQffS5/rmzZj4F9F9bNt8eKAk=;
 b=Q4g8+QgIjz7EgTbfXKHNPJW/+GBvIdgZ4VJNWto/I7AHVJfmaTneRzy9KyNS+d9evWm3gzXwoYe5Flss2eDQZ4bdzGVfiy2ES+GufZjuXTlMS9Er2RnP1sxoGnhGzfKPyadku4tvVjDYC3BK82twctdA05R8sEvcynslJoHcKt3qILt5XMGIqeueA/6SRWaH0rcGGvghz+NiSY0U1I1Aw+BsPiVZLeb9X1hB+dH+Skgh7iyvWoilkqAueeWXZbK1j64cIXIYzVdL06RnR5mWTtRJQXpY0wm6DZ1DtVmoQqvBcMvMUlvpR0Rmez1NvLskiTDGHFRe9JhzsbHrTzwn/Q==
From: Dmytro Prokopchuk1 <dmytro_prokopchuk1@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Dmytro Prokopchuk1 <dmytro_prokopchuk1@epam.com>, "Daniel P. Smith"
	<dpsmith@apertussolutions.com>, =?iso-8859-1?Q?Marek_Marczykowski-G=F3recki?=
	<marmarek@invisiblethingslab.com>, Jan Beulich <jbeulich@suse.com>
Subject: [PATCH v3] common/efi: fix Rule 2.1 violation in read_file()
Thread-Topic: [PATCH v3] common/efi: fix Rule 2.1 violation in read_file()
Thread-Index: AQHcEqNkBxL+JigLCU+o9uoHNz/rIQ==
Date: Thu, 21 Aug 2025 13:56:28 +0000
Message-ID:
 <4a1a4a3406d227348afa1ad2ce90dc5264fdb44a.1755783750.git.dmytro_prokopchuk1@epam.com>
Accept-Language: en-US, uk-UA, ru-RU
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: GV2PR03MB9572:EE_|PR3PR03MB6411:EE_
x-ms-office365-filtering-correlation-id: 125c403a-a27f-493d-5d2e-08dde0ba86a9
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|366016|42112799006|376014|38070700018;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?7ji+ekNtpDjELaUTwdQvZBCdylL2ixZmcy5inUblp2UU0MEdgb/iu1HrkE?=
 =?iso-8859-1?Q?8KGQqaYPxeEfJZe/YfBa6/2/hScjxw9EdaERCsCHJusMqlQGToMrerQJ3g?=
 =?iso-8859-1?Q?o4YCSaPrdfmAAN9+SbfMdTac513uiUrfp8ORpFjeFyeqViW8x4MGWBLYtt?=
 =?iso-8859-1?Q?lNHaYCkg4H14ptW9N/waAG/AVBeVnIdx5nj6PhAlvLUOdWG1uBVZgtQBX2?=
 =?iso-8859-1?Q?2DaT5fqGnX9Zsmsef9I689gBwpCE3vd1TrNaboutZ9m9LSUs6Re17yw3zA?=
 =?iso-8859-1?Q?9Rijh6akm3tRpAUkFRaj+S5QhnMtSxuU8O1J2hcad/YN8BeGLgg4aZ5Sat?=
 =?iso-8859-1?Q?ISEkLMpchHN7bsB0Xihh5DN7ukZREazB3V4wfnn/PNbbdcD21Sq/RuemZo?=
 =?iso-8859-1?Q?mpU3buQgvJw4P7WrKoejwB1rH3KdFMFLIdgW7dAq9FEz8khJaEwvi55Hbu?=
 =?iso-8859-1?Q?1KypZZ6WU2VuFPnSDXElpDApGb/qrAVx7DyEzLVgbKAyjt8XVdFLyRtDQI?=
 =?iso-8859-1?Q?IuDd2h3CbidE3Yk0GTBjFuG9TmPL9XpaOFTBre6CBm2VV6ETZJ9xy1MtQe?=
 =?iso-8859-1?Q?RiKu6yayxjdwJ/DSEDmeCvM6tiRh+NBF7UXS6o23vFhX5MwdotAIj51V8p?=
 =?iso-8859-1?Q?LNhmFc+wmSqQOBVBLvL3ZfIBcCIMjj+WwcHR0hgQMzUz6RLZZjfTbEvy6s?=
 =?iso-8859-1?Q?6lgR4DzEklfnOE6+jbfUnaTRoPVQ4I1E7pbil/xyZ0V4rP6imQbnhTyULN?=
 =?iso-8859-1?Q?XUSEaEUgf2QGJKMqu5BP6lN0B1d3CW0XZGC1Z0F9260PT+1yQc6DNUQM65?=
 =?iso-8859-1?Q?J4CP1WkEViSdiGKR9xGG54ENvlU7UPsFWW4jFGRmcIaSWJh5JEgAxvplhR?=
 =?iso-8859-1?Q?KKfyaDHNI8WNBK9gdVuNeeNzn9KvEHUwUzI/xH0De01ejsdSjyzX6UHeto?=
 =?iso-8859-1?Q?5rX09nYS+1pY92Yx7A7Uwof5WvyLmKnp4n3JsDRXhCGf9viKH+rq/A9YYm?=
 =?iso-8859-1?Q?M/fzZZ4L3oyFbPXgR5fhgdLZTavTDAHUIIDhmes/965GrHBBacxr5tbO/m?=
 =?iso-8859-1?Q?zMFjJAcnXBHodTgmYPrMu8A9ibEhbrFk7cZ3fgyyo6EROwMaH+q3bORLMx?=
 =?iso-8859-1?Q?1zQMxAPvfqpKU0UHu0MJULslmVwj/TFU+lfU70cw6WT2Sc3LpHvrjaADdX?=
 =?iso-8859-1?Q?5mWPVt4+orDInk5od9T9rZmPcV/oWq1xq9PdWO/YadXHgAbYxe2u6P2iV8?=
 =?iso-8859-1?Q?ZmvhX1xnhhF74YXC4QKq+HjUZY90vAwHzjSoSqInojZcVZSutBUI41vL8U?=
 =?iso-8859-1?Q?LsSHCkFpiclnv2dzVwacnGcfU6/OxB6nB1m8Q6bAEqpbH32hbyl6SLwasR?=
 =?iso-8859-1?Q?rUy58h0aBVYRbwKZcklHjYbo0z62Uia5PBJg3qVz2f0dDCcrViEBFIOZPj?=
 =?iso-8859-1?Q?totzu3CZUcvUyGTcpWXDOCXp7eKlgK+WTPUjuzk0iwqYvmOURSS2vUk0+V?=
 =?iso-8859-1?Q?E=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR03MB9572.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(42112799006)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?aDT30Ah/KGkjVWrlLuhVIkxjFTFsNtSBNIoxos2WnYPMPr9lmIbfEd4vYh?=
 =?iso-8859-1?Q?GTgqgU6uz6pNfbjaYdcJXXDa0MWlELynrAbZUxovrXZocOHOD9p6Oc3j3t?=
 =?iso-8859-1?Q?usNGl16Q5l3p+6O08CDqJHI844X+fTao/fAOu4XGh21jzNz+U1jubd7fcY?=
 =?iso-8859-1?Q?sw3/Qi4W/Zn0WCyZ3NAuf16Cn5v+XBnyVsCSP2ALk0jcYSSROi/mwGJaFT?=
 =?iso-8859-1?Q?eEPE4i8djV+qdGTvLsMPgv2TVLRO3aTCmba00uhIirh74jRW3lkef0TNCC?=
 =?iso-8859-1?Q?FNLIM3u09pu1rSCFeMcNjmmSpthnceQksOREwR93j21di6GeX2ETrWHLMX?=
 =?iso-8859-1?Q?ldvciiDd/xgie/NVTKYTmJf3Z6QjjYBzuc8nkw2WxTXSXPNS4FdtggckQc?=
 =?iso-8859-1?Q?do2rKiX1Vf/jYP59uZnqWRdLWrav5grHZexKcbz2TAYoqZhr1Wb2fAgsj3?=
 =?iso-8859-1?Q?NXie85doiBzZ2aIq+5h5zVRnFthWCteKqb/lcXncHMFuSOzvMi03FN7uAO?=
 =?iso-8859-1?Q?jT6Wtm2APSiEkRtDw+uR/xzgPNvTSujFkELTSUKpvcTRMbd+3FjRx6hmBw?=
 =?iso-8859-1?Q?0ud30ScHSMYe8ueybOVA/2vwhVs29v7epTsqw+8IZauUym4vmhhzjwKIyF?=
 =?iso-8859-1?Q?e4GX6vZA2wKugy8sZ5RntPi4PilRm/BkPurLPBco0ZlrBfCGxpzO3ymbI7?=
 =?iso-8859-1?Q?GhNbBspRgQ6cJi1VbW9vbTuVRHLi0/PQdddxFi3BJzo+v6tDfehRENP8AK?=
 =?iso-8859-1?Q?czicPnPhLGkdMQShtoJ8qgS57bw+97N4MdEv5haD/lfi2s6YFcki56O44S?=
 =?iso-8859-1?Q?9ZbkBdWtTg4dvsPw2gJqDfqxjIChNi8YQ6iBKiZjCe5ZfPLXyfIub1UwQr?=
 =?iso-8859-1?Q?/rZDb3cuimaFIpU+vucWFJ8k60ItZIsLtXUbixyvQhTrVsLIbmhwsrIg1W?=
 =?iso-8859-1?Q?taaUJGf+lur/r9CiZmGsmqk6xddaz7u4h8RgD10z2Qra4zy4JxYzImteSM?=
 =?iso-8859-1?Q?0PUQ4uoPNvc6KC4Xsu5kCNruG0ey1NYM8J33Ia4PqRvRWVhxW18Pd7yQGX?=
 =?iso-8859-1?Q?uNmmuaFanGGmRQQSN4RWh3RAd6TIuVEgshpa0x1Ewq19gWzK5mlnZZeE09?=
 =?iso-8859-1?Q?oRfVqnAUKjkA20HJl9q32Tv+slsF6ZOiDH7JtEHpcyyTvZnrNH2/8n8Fod?=
 =?iso-8859-1?Q?6rjC69xj7VpFDwI/aeMrsJvDItMaDpnPkCl/rrG+aqtF692wlQIilAf2FS?=
 =?iso-8859-1?Q?5y2nuaklaFazbazpj+CWz4Td9oCIk0J3bYQro6z17kKItQCZOBPWgU3Uw6?=
 =?iso-8859-1?Q?0QIsfiW2c7oKFlPHgWVMyczJt0QLwpeV2VmLtsuQgQZO0+0SNnJzooNXyp?=
 =?iso-8859-1?Q?UW+kJIPSN/vyZ2C+iApnP7X3HPlJlNGy+voKpw2Zz0qNK+4u9nFMIcjIdO?=
 =?iso-8859-1?Q?KCmjHTUPxp2Im+UTa1j1nJdfoybz0gKNbQ+XDI6YyaLzoFOrFhSixcaJHQ?=
 =?iso-8859-1?Q?AC3c8ZFKN193Yq9zAx5AWXBsM0uJ11/W6VBy3ySpHBFYZ5zHvcQFYBHVO+?=
 =?iso-8859-1?Q?r9nYMFCUzE7Vp27Ht9fh8kZNK0S2S+bfAh0b7invMJjzZxjfbSBfbDv/1Z?=
 =?iso-8859-1?Q?L9fV3JFEaKeKKJdEyQMKTCPVF/VGl94IAjKRngjxY/DrBuaOfNZytJdg?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: GV2PR03MB9572.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 125c403a-a27f-493d-5d2e-08dde0ba86a9
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Aug 2025 13:56:28.4008
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: kiW6kXLns5gu+4szT7X8dy7ZjirE+GVTdVaEVvYrZjtR3XD1g0zHEj2Zwd76TeUKGRq64uLHAMSJgMPYptSrZa6lG+kyCbRHWVAthW/xbng=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR03MB6411

MISRA C Rule 2.1 states: "A project shall not contain unreachable code."

The return statements in the 'read_file()' function is unreachable due
to function 'PrintErrMesg()' which has 'noreturn' attribute:
        PrintErrMesg(name, ret);
        /* not reached */
        return false;
    }

No explicit return statement is needed here. Remove the statement and
write a justification comment instead. No functional changes.

Signed-off-by: Dmytro Prokopchuk <dmytro_prokopchuk1@epam.com>
---
Link to v2:
https://patchew.org/Xen/c20a58f24875806adfaf491f9c6eef2ca8682d18.1755711594=
.git.dmytro._5Fprokopchuk1@epam.com/

Changes in v3:
- removed unreachable code instead of deviation
- updated commit subject and message

Test CI pipeline:
https://gitlab.com/xen-project/people/dimaprkp4k/xen/-/pipelines/1996439444
---
 xen/common/efi/boot.c | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/xen/common/efi/boot.c b/xen/common/efi/boot.c
index 50ff1d1bd2..325de05b18 100644
--- a/xen/common/efi/boot.c
+++ b/xen/common/efi/boot.c
@@ -851,9 +851,13 @@ static bool __init read_file(EFI_FILE_HANDLE dir_handl=
e, CHAR16 *name,
     PrintErr(what);
     PrintErr(L" failed for ");
     PrintErrMesg(name, ret);
-
-    /* not reached */
-    return false;
+    /*
+     * No explicit return statement is needed here because 'PrintErrMesg()=
' is
+     * marked as 'noreturn', which guarantees that it never returns contro=
l to
+     * the caller. If the 'noreturn' attribute of 'PrintErrMesg()' is remo=
ved
+     * in the future, compiler will emit an error about the missing return
+     * statement (build-time safeguard).
+     */
 }
=20
 static bool __init read_section(const EFI_LOADED_IMAGE *image,
--=20
2.43.0

