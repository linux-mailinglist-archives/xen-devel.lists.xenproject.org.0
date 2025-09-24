Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B11DB98B72
	for <lists+xen-devel@lfdr.de>; Wed, 24 Sep 2025 09:59:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1129035.1469211 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v1KPU-0000ZN-FW; Wed, 24 Sep 2025 07:59:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1129035.1469211; Wed, 24 Sep 2025 07:59:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v1KPU-0000UZ-5N; Wed, 24 Sep 2025 07:59:32 +0000
Received: by outflank-mailman (input) for mailman id 1129035;
 Wed, 24 Sep 2025 07:59:29 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=A4Db=4D=epam.com=Mykyta_Poturai@srs-se1.protection.inumbo.net>)
 id 1v1KPR-0007no-Ng
 for xen-devel@lists.xenproject.org; Wed, 24 Sep 2025 07:59:29 +0000
Received: from OSPPR02CU001.outbound.protection.outlook.com
 (mail-norwayeastazlp170130007.outbound.protection.outlook.com
 [2a01:111:f403:c20f::7])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 64f23e9a-991c-11f0-9d14-b5c5bf9af7f9;
 Wed, 24 Sep 2025 09:59:28 +0200 (CEST)
Received: from PAVPR03MB10102.eurprd03.prod.outlook.com
 (2603:10a6:102:30d::12) by DU5PR03MB10523.eurprd03.prod.outlook.com
 (2603:10a6:10:525::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.9; Wed, 24 Sep
 2025 07:59:24 +0000
Received: from PAVPR03MB10102.eurprd03.prod.outlook.com
 ([fe80::b8c6:f37a:987a:beb]) by PAVPR03MB10102.eurprd03.prod.outlook.com
 ([fe80::b8c6:f37a:987a:beb%7]) with mapi id 15.20.9137.018; Wed, 24 Sep 2025
 07:59:24 +0000
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
X-Inumbo-ID: 64f23e9a-991c-11f0-9d14-b5c5bf9af7f9
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=X1Lq4NfbRMoUUme+iW/ZmcTQaGLo3/1cFeQF+vPbNdKvo2yMI23JpLMVa4O1nFYqGRjglyn0RTaeQed7Laj94pxaTn1WbLALShurZJXMrmyU3LKyQCaM/PYr4usKe6Tgwx6QhHTMJYmTr6eCCZ5HzSiOybUoLyoaPDK5jiiRg+Yqgc6tkaItQWMxMiP7TzlyivxEmsevQCLoFEcp8DTjSun89hS+FdBRlkOy1SlHN6TyVV/Q9Kw30+MsO5gZmFCYtFGz6LzzFHQvpaiRqw1JzmUZ9hqqORx64YBcGBZzcR+SmVhe9XOp4TXQ9x/IB0Nv06ZYwN2w3ZKv7tZWu+QbVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4eHiYxqylL9naaTy3qk16KarDfJtDb7zV8vKSWL+Tjg=;
 b=LZK6K4xudjU09lhKYF52SAkc839z242xnJX+haXMsbjCa/qwQHoCnFqc0eP+i9lvfap4dmLm9Mc8GbCsmU5M/5Ckpa1a/ptRjvfSnFUmG4lOz1EAhy2NI4rxKMgsTvPmDUuOmtRW31HA0ts+xJkykwJZguanlJvOY13XisWuSNybg4ur1XxDcvmyY1nJrk0sYSgTV1LEYSoSEniKU6PSIjlD0wGugUMmlIw3/UAiMJiT4sYWBF5OCQWlZ5K5OV9jMSmgyvt/UoWmf2KVx1QcmzDWOPknP2KvYEyW38fYXhU6Npdkl6gA4l0ETPv9plf6yuGLVtZucTq6jGfh4XAkuA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4eHiYxqylL9naaTy3qk16KarDfJtDb7zV8vKSWL+Tjg=;
 b=UmE3MFVDjHpCEyO+l9MU+KZyV8OSP9qltWMnJUVAv4m+kehqkanRX+/4Y5GIiRzQCjIoArCLwchzou/f/0Xq8k5zGekCibXsz7s8uyRunnJGbYanuqNy7UU0Muw8B6slK2FZMzR9fnjovea1e17eUOjkLD7Eb1sueaYGeTaZCZ9JvnM1sthKZ/gVIs/AwOZ/ptWmNm5621Vf9KQU2JvGJ5njhioY8/QP0qkcR8f83bxeYmYGN76M5MTsDFznfLgYn7jeEn2JcajTPVqbbu0XX7OBW3DaFLZ3mx2yf3ZfO5pjpQ28rvSRCqwG+4oLwKAFVrpJ7+olmqjsiMMR2lI04Q==
From: Mykyta Poturai <Mykyta_Poturai@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Mykyta Poturai <Mykyta_Poturai@epam.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH v1 8/8] arm/pci: enable vpci for hwdom when pci-scan is
 enabled
Thread-Topic: [PATCH v1 8/8] arm/pci: enable vpci for hwdom when pci-scan is
 enabled
Thread-Index: AQHcLSkkrFCa0+UvQk64FYmsNCFhTg==
Date: Wed, 24 Sep 2025 07:59:24 +0000
Message-ID:
 <2ac11726b5a236b022da5c51235e9a4efd92087f.1758618839.git.mykyta_poturai@epam.com>
References: <cover.1758618839.git.mykyta_poturai@epam.com>
In-Reply-To: <cover.1758618839.git.mykyta_poturai@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAVPR03MB10102:EE_|DU5PR03MB10523:EE_
x-ms-office365-filtering-correlation-id: 5b503497-6275-45e2-ab53-08ddfb404711
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|376014|1800799024|38070700021;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?FIqJeBUwzTddogCAwXZuOcupEjR5Zvlz1Lp06v+ckHIhYIRwQk7xL+v90p?=
 =?iso-8859-1?Q?qpBUrGAH8tOXtMtl/er+L7Gw//xVXwCD/wxNnYsn9JGoXE0DaYWX8aW5fQ?=
 =?iso-8859-1?Q?vZobbuZGLvKCclavaSeiRBQ47laRrMKjqNww3iVTSxmHaLx4jlqLOw9vOK?=
 =?iso-8859-1?Q?mUoTVpNQt2LuAvQnNQBaTVtriS9/R/tpWCembXtqYH3JT/BjUkQVB/ZQTq?=
 =?iso-8859-1?Q?RPDahSy0NGJJzYMs17rIue7p7I7iuDWKCiZ8MEh0XbuK/AS9/YdTv3KIMo?=
 =?iso-8859-1?Q?r8nXYhMVipXYysFpfiHf9sD5siUlZKJRFHFQt5hS8Y+xVAJys4KxexghYc?=
 =?iso-8859-1?Q?RV408wkeMtfnhXPBZUqBZceSpTtRrm6PSzIn+9gjHJ8pRpkpmGp4Ud/nQB?=
 =?iso-8859-1?Q?CtPGHYfheQ3eNiocG1vBVStDhS9HOKXyRYDI2KTKzT55AxDipaKKdjhmHt?=
 =?iso-8859-1?Q?CLSuQul0cPI5VUl9k+9WAuwNAu5DbBL8Srn+YMQGe9LEJgdsBdKmWWfutb?=
 =?iso-8859-1?Q?uNc5PrQcOHInIpOUQPU/BMrHFRIhPp5aYUfyCHRQoJYXuP77sIhZWVIelK?=
 =?iso-8859-1?Q?WaI49ox7B7EDcXh+gnCYLS4BAiOatFAaCWZ6BZwKPKMAxX+8sPtKC1r2TO?=
 =?iso-8859-1?Q?yLVEm7ZmjLZ8as5FnUOmGc+Kkfv7NS6rJvaUEEBC443RzTBHsuRC3ncSMs?=
 =?iso-8859-1?Q?pfYg8OgoWss8jN8zpQGHmUjNXRE5b2KjERka7LJbEs2FFKCOeAPwX4eKSA?=
 =?iso-8859-1?Q?eb/zoKtKo2k7Q8HJn4DO9jVGpMF4rvjiob24b+aa0UA99dm5WeTBFaxWxO?=
 =?iso-8859-1?Q?kSfwtjPLJsE+16tjer3BJHXCMVMEWsLEfBpPZf8Z4/daEH4AGejYAGJ9OH?=
 =?iso-8859-1?Q?IPy0WznlZMzWniBGyhZC3mOWlMN9Q8nYPfKIzX3xDrzhJraHVmoukNz1FA?=
 =?iso-8859-1?Q?duDGexb3BYWFcJWYywWPLmzYqu5PU+QjOaEdvbjpRIMbYJBQ0nohn8W2FK?=
 =?iso-8859-1?Q?B573VwaDCDNDkyAXqY2Pjv4cw7jAF4TrROjL6vWOdDQOAyfDgCD/Kiqejw?=
 =?iso-8859-1?Q?ECw9BC7ydkQbNyKPXJ/53FmD0bz/4zYMAiTUWGropvaEdQF03qHUtqCxmr?=
 =?iso-8859-1?Q?ADvuL8sWyjPf7abxq1MEXle0OsFhs4A6mlp+CtnYR6xykc22zVKy+4E9mX?=
 =?iso-8859-1?Q?Npv3WGzMu5KUbG7riQ5Oay4azM1cO4gqaZUbkfp0OfU3Ygn4CsNR98Ttzy?=
 =?iso-8859-1?Q?bzsdUPBROsrvLmPnLUOGA3SaJgKDq81qNO5g6xnmLMOkNmxFJ6luTTOJ9R?=
 =?iso-8859-1?Q?jlW3N+Ck5AL9FHogsvNxSLiIBQldr2zK6htcTSG2QwSPiB2nYEYISHHZDX?=
 =?iso-8859-1?Q?RV3k8CYUFQJliEAGRkDrwdCEEQaUHMiIb7HDE8EXTC7vYZzhInEK3BM7GU?=
 =?iso-8859-1?Q?Fn+aQ5zRdlKqn6xtYGUQWQ+yWSJ/yFM43VCBRGA8lTpUsAGmnsJjXEMUtO?=
 =?iso-8859-1?Q?zTA+8fdoALHYMNy44EgzpwtUI6aMxUGwxroRv+jrFZ1MKTXpexnpY2Fx/b?=
 =?iso-8859-1?Q?ncEx6RM=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAVPR03MB10102.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?HY5ctcj8rZEZxH4MikYfQ+gduxtxLJepKs/VV00QAVCF6kJczqafF4Djz4?=
 =?iso-8859-1?Q?vTaXtjGLALxLD1vclKKRWaKB1iuadvbAHotcL60COpDf7Y/TSKSCn6u6RF?=
 =?iso-8859-1?Q?knB2AF+xsoKSc7GutY0g64oki5flqLAi8ZeDG4OfEw9jn/bADsXrIVTnLd?=
 =?iso-8859-1?Q?3HbxuwJC2gBPM3GGusaP5dw8Hgdmg5+SNnXxEVppDa+3rzqYxXqVN5SVPI?=
 =?iso-8859-1?Q?sgdUmGNcmT0id5n7SvLFLPLBZ6lFhd1bq54L9SQ86jb0HWlZmpwW9gQunS?=
 =?iso-8859-1?Q?ou6P1X8dH/6lCBDOdUIzt/3y4GMQBKko9tqygJ35S0iDRIS8fT8wCW4glh?=
 =?iso-8859-1?Q?r1ZFGcdm34UCM46zJi5SMjoraiHmQJAk5uFmMfsLvdPPPxGI98LI9eStlD?=
 =?iso-8859-1?Q?DSExXCmt/VZS3a4wukeAVQdutDLOrL+KQpujoXwivv8SSyq7XxpMPIn9Kl?=
 =?iso-8859-1?Q?dMxViryMCiZout4RxLnWxYASrpxKY6szUnzt4XWK1NScUhv53z0cD7a9MM?=
 =?iso-8859-1?Q?JKNLeuJcEK68akOz5V22GKnBggzXTtVR1WexA9PiIIth9ZByVsjC0LDVZ3?=
 =?iso-8859-1?Q?ImVnJ6N5OFNb0sfggkHXZTu19PG1I8Y4yY6BTGF0tp9hJr91HAE32Ld+9I?=
 =?iso-8859-1?Q?mg0rIDjZ8ZuIimTN8SdXyP4T620FrvYotfhLD4BJIJM+8e20GwAOLUr2Q/?=
 =?iso-8859-1?Q?z82TWTlarnB1OsGBlCqUraMI4uOrnPe0tEz3Nqt8GP8eLt+CLrpr/mdzma?=
 =?iso-8859-1?Q?/GfZSNPYzeqoGCs2eKHAnsH46PHokrvTlLTGM1nVKnaLv6rmKK1en3RBiu?=
 =?iso-8859-1?Q?w6phVBJ2LVsNK/ySEcwQ/5cwADcXE5xH+6lwJV5xCoVeRbgN7NE06DzdZG?=
 =?iso-8859-1?Q?+v+m2rumm1Fwn8FCC1nf2gQlIa336MRLdpAsbsRNXYdYFqUZlHMENRLQuu?=
 =?iso-8859-1?Q?lYEO3z3cJnYDDYoFYcbTTH+9yxWjNQcu9hWouGxQaqTfnpqqxdRE0AxxED?=
 =?iso-8859-1?Q?jV0mGnYIw3/NMdacXKZAkUtRRJB/jRwnjnBKjjef72pqw0ozcIjuaXr61R?=
 =?iso-8859-1?Q?xU3/8dQ+FACDsojHxwHhG1VXNd/p6IuYBLt6wbpduI/y9rsSrUIfBM23p1?=
 =?iso-8859-1?Q?iWPu3eUXzfxJYehIaLTPtIW1vr9UsT44gX68BfKgTgU2oc8SjpJ/F9W5+l?=
 =?iso-8859-1?Q?hyONv7/ngdcWfQApWHqrXarFbb6bgyS+cMkWQLxzL2Cc1zIoGyqLtiWNcX?=
 =?iso-8859-1?Q?G+Tvcjv4+4mj+czZOM9yEHP6uTum5tKYLaq3nubyWjU8EvU0VLZaoXEs48?=
 =?iso-8859-1?Q?bgZr1jfBuLIFBCvJAoR6WvyOaZR9ted+L2WCGvn/c3N+t/FgEWi5pJFtXR?=
 =?iso-8859-1?Q?HrqWbQdtNXeOI57KjAVQ5wCatkmTcBO3hH79hxpzqHO9KuwfdsLA+SKnln?=
 =?iso-8859-1?Q?+AtvWfjJ5OH77qyowbObi6DM9wAcFS2AICvw8yUFXALe+9TVUtYfz1dzv9?=
 =?iso-8859-1?Q?CYtn7cbbHli5P8yf5AwSSmUem4lcvcOWiGTjV5XOI7Y/bKgidixTAVeHmf?=
 =?iso-8859-1?Q?bu+sIKM1Zc8vLrNYG4UrM57kiHDbvf9L8H6g+WsEDceGaronZ6M9ayf0Ic?=
 =?iso-8859-1?Q?c7iaG4FNLHmTznoqNIoRmJK0VFh+Vs89JZtdc97Bn5Wdm5NFqBnFC0hQ?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAVPR03MB10102.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5b503497-6275-45e2-ab53-08ddfb404711
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Sep 2025 07:59:24.4781
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ddc6Shw1P1AReHaP/QJpUx4aU8MqlYi3cZ4kbRnslP5u6dTi81tuW/N6W0IOS9o4IkVcL2ChdeHW8Bs1mxeFEA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU5PR03MB10523

With pci-scan implemented it is now possible to use vpci for hardware
domains. Update has_vpci to reflrect this change.

Signed-off-by: Mykyta Poturai <mykyta_poturai@epam.com>
---
 xen/arch/arm/include/asm/domain.h | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/xen/arch/arm/include/asm/domain.h b/xen/arch/arm/include/asm/d=
omain.h
index af3e168374..dbe3347cea 100644
--- a/xen/arch/arm/include/asm/domain.h
+++ b/xen/arch/arm/include/asm/domain.h
@@ -305,8 +305,7 @@ static inline void arch_vcpu_block(struct vcpu *v) {}
=20
 #define arch_vm_assist_valid_mask(d) (1UL << VMASST_TYPE_runstate_update_f=
lag)
=20
-/* vPCI is not available on Arm */
-#define has_vpci(d)    ({ (void)(d); false; })
+#define has_vpci(d)    (is_hardware_domain(d) && hwdom_uses_vpci())
=20
 struct arch_vcpu_io {
     struct instr_details dabt_instr; /* when the instruction is decoded */
--=20
2.34.1

