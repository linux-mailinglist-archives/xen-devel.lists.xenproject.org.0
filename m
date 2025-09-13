Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DEDF9B56044
	for <lists+xen-devel@lfdr.de>; Sat, 13 Sep 2025 12:32:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1123115.1466384 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uxNX3-0003HB-JU; Sat, 13 Sep 2025 10:31:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1123115.1466384; Sat, 13 Sep 2025 10:31:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uxNX3-0003Fc-DL; Sat, 13 Sep 2025 10:31:01 +0000
Received: by outflank-mailman (input) for mailman id 1123115;
 Sat, 13 Sep 2025 10:31:00 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=nB/d=3Y=epam.com=Oleksii_Moisieiev@srs-se1.protection.inumbo.net>)
 id 1uxNX2-0003FW-Bv
 for xen-devel@lists.xenproject.org; Sat, 13 Sep 2025 10:31:00 +0000
Received: from AS8PR04CU009.outbound.protection.outlook.com
 (mail-westeuropeazlp170110003.outbound.protection.outlook.com
 [2a01:111:f403:c201::3])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id bb9b6d7d-908c-11f0-9809-7dc792cee155;
 Sat, 13 Sep 2025 12:30:58 +0200 (CEST)
Received: from PAVPR03MB8946.eurprd03.prod.outlook.com (2603:10a6:102:32e::21)
 by PR3PR03MB6412.eurprd03.prod.outlook.com (2603:10a6:102:7d::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.22; Sat, 13 Sep
 2025 10:30:55 +0000
Received: from PAVPR03MB8946.eurprd03.prod.outlook.com
 ([fe80::f12d:7394:bbe3:dfc]) by PAVPR03MB8946.eurprd03.prod.outlook.com
 ([fe80::f12d:7394:bbe3:dfc%5]) with mapi id 15.20.9115.018; Sat, 13 Sep 2025
 10:30:54 +0000
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
X-Inumbo-ID: bb9b6d7d-908c-11f0-9809-7dc792cee155
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dpyK50VMM+LbzAbHgDw/Y4ML3popKtn57TEg7aYhy755dgK22Ng1bfJBxUdVIhZn96zzejoUibZJqlrVRGtRhK9Zf+VY9PLJT0C+KTsZHl2BxrQO1LwT0+Za+eI4vioTcVwiCTUURaWwXIiEL4UhmchiNOo8RyZVrAfC988pa6UF5ihh4DGLzSh2d2z6HGNdllPo7btOl9yVVZ8NICntxtEzQmMEaBtOV1DnGuVZLjAiFnNV/d+rSmv0GeUf+zTGP5ZmyIi5njpoNs5ffwICxmsVC37wM+dLb/YcYNJWX694HnmX8Bg0eYoPtrdkMdVsIbisPVnRpPEq070FtyOuCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yUBRdFfjv4vjz/L1/mnMHHZQZNhjzGWw6xIiUs8MDUc=;
 b=QBqSvBsMPMXpIyvOzqQrKvTSGrlHqFWxe7n06/34ybWvTwcqkbg2wxs7kR3OtGbkDJN87CF5/nufYiSaXFQlmURpZFIIlKnNHnXyVSOTIWsU+RqdcmYp6BTLRh03quJ1e+WPtWytc5fYxt1mOQBkkAf8Gz6HAn4q9jYHyLDHHmRwkbiWH9b8pZZRwVw1fb61zAaB67f59rcwrebf+eMeGNIuvUomSr3K1/dH99Og4hnccsr8jdYbHEJvJ5SzfavfOCloIiQcpTXiJalX+VhB76b8AayVzb8xQdpJ3g+sXvLw2M6DktmfcF0Rbp0enfwbqwK2Q0IKZuPZPDBKiVrgHQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yUBRdFfjv4vjz/L1/mnMHHZQZNhjzGWw6xIiUs8MDUc=;
 b=bOt5xka4xxYKbudhdFhKyh0S6M5bGxl79aBt8nUgvo0I+bFD0ko5m48OY5MOhEh/2bxUXywWMLkorMw8BVuSNOczt3TbgT1tsqsAsX4IVEfVLwBZpXPwxazcj56eFG6MXGqA3RKNs8N07zVAbIoiPMyoBphJ5HUJGs0hyWtQ33qYxcfB7t6733nTwNsyUp8xJJc4IUJRVhqt6g9HopXqUtQA43sMU50vmY3hmc138oGB+L5G/QLBh4xQ0dGglBKS6z4U0CVT+fgXwRXQJaAyPr7NcscmwArC/neiPlUV9n4jGGbTpM2fNr01xOd3VIOsUBqXbYPxwQMszzyXtFEydQ==
From: Oleksii Moisieiev <Oleksii_Moisieiev@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
	<julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>, Michal Orzel
	<michal.orzel@amd.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Oleksii Moisieiev <Oleksii_Moisieiev@epam.com>
Subject: [PATCH][for-4.21] xen/arm: Reorder SCI resource cleanup in domain
 destruction
Thread-Topic: [PATCH][for-4.21] xen/arm: Reorder SCI resource cleanup in
 domain destruction
Thread-Index: AQHcJJl8FFyN4sTuc02XpBtKM5m65Q==
Date: Sat, 13 Sep 2025 10:30:54 +0000
Message-ID:
 <164651d0662e674002ed17399300c3a25e6dcbfc.1757757602.git.oleksii_moisieiev@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAVPR03MB8946:EE_|PR3PR03MB6412:EE_
x-ms-office365-filtering-correlation-id: 87ab38af-1eb5-4f90-2e93-08ddf2b09ea2
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|376014|366016|38070700021;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?b/dYcs6OiQ8UPMhbtpU7EHfmB2dtQ8m7hNq/kCr/G9gwOFoS/C9qJdLx8/?=
 =?iso-8859-1?Q?oNMVpMS+nuv/rKb4WIlJ+yvTXiLH/e3ov09LdHIvb/SeQQOHOaUgn8FgBh?=
 =?iso-8859-1?Q?oaXE97mVYC5Sn/PNmzrLdE4Qo6EDW+TVEQeE+xIIE3vvQsoTknjMTbj3ce?=
 =?iso-8859-1?Q?vko6v2Q9e0Sym+jD/074HfB0rHgGuwG9J9TvZMrnLYTUat4eaveVeCn2ts?=
 =?iso-8859-1?Q?3GZtdlCQIrUN6bPffXKrBPEvxE8CvTNuShfRyrfEtUiqVLqxofic+yYyUS?=
 =?iso-8859-1?Q?4ss+utMRmUSTvv420ZsPo3uY5QSk6oEQAKqn6QyGcbiG0Wn4R7C6QqONI4?=
 =?iso-8859-1?Q?fzDaG+aCrWg42xfNs9QXVZP2rhievQ7TvQqhuqGXyVnzJz8v8ZPvnVJuKy?=
 =?iso-8859-1?Q?Uvv88ttwhWyYvxl6frrrC2saR1lXW3ptuDjbSOD14ZHlWRWMQOyzibB95s?=
 =?iso-8859-1?Q?iGXUlimM0AyUpqorQvCV6qJnJWwat9BfDxo21TLFpt3ljHcC5XvTJa3rSH?=
 =?iso-8859-1?Q?oH9+ySVcT5OtSx+NNEwhvOFm9hsxDsXNTDiDDnWZIKrwNh+y0VHX9YRVPH?=
 =?iso-8859-1?Q?R14iGHHv/qBFGgfHmnIChhzanaHHMSCi0hvKrBIBpoLmc9lm9IEnbPLLgL?=
 =?iso-8859-1?Q?xWwj6dkmInM4BlhbfCUVSHIMqLhAP6b9AzNcszj61U30BrdK/7X41YTLQw?=
 =?iso-8859-1?Q?n0EAUFvzSJ2xwQQH75wxHoYl6QLJpAgvPkxQfoGcHJftJDjHTvDGKO44jX?=
 =?iso-8859-1?Q?GAoql2sC7ZgcrktDePJKRZc7zjujMQijoluRTBDAErYjcJHFxtmkGrhBud?=
 =?iso-8859-1?Q?PXwvq9zDVx1Ex/fMhM9fViFr86+c+F8tOLNXq9LjwRzlkPlobBPlwFMBJM?=
 =?iso-8859-1?Q?xTQWsAmd8E1USCu1QlGs9K/TAQTB/XoNFLRjibj07yynmqwR0wl+SR0lx5?=
 =?iso-8859-1?Q?7s9Jgb47Jl7fe9XTL24fqzQcB45INKlzcvaBk4ZfzHvWrqACQTrWUJEf/G?=
 =?iso-8859-1?Q?4Swf57On2wnrgeo3t+dnbwlhhDse1M8xj1Rs3YzToA7zwy6gDyv0SukfK+?=
 =?iso-8859-1?Q?8Ah9Cft5ZszOVp5MNIcQVRMeXAQshQgf4pd/riysgcwW8mVza1I6Z6Gv9p?=
 =?iso-8859-1?Q?xcka/rbpQb+WeHkDlqdx9rf4/VhAFGjXnsd3OiPk8n9K7hbi5/ooobS89L?=
 =?iso-8859-1?Q?Jy7Ld3n7DPO5jecD1066sK8LScAQjShPRfYPuX8Rz+j+mxXy9LCr8BDKXm?=
 =?iso-8859-1?Q?bVrYVL9bPUCiPzYbqFZZ5q08aMUvdazcljuUu0z+p+/ttoFSM+c52/ppBv?=
 =?iso-8859-1?Q?f3fQptOq95+aELG1BNUIXGw9SDFIBLC+l8Ac8eAXhVjI0b6R3SAygU/zg7?=
 =?iso-8859-1?Q?hVmuqUPltncUcNBb2vDfYXbs6KSMCgz3nlI9CBheRfZ5FGXqgz71kfqhUI?=
 =?iso-8859-1?Q?RFXK1sNnj85riXxB1H+fBZKKr/0hcc2x6x12vtxvfBuskuzxjGIburFloO?=
 =?iso-8859-1?Q?CXPFdKPFpk6SY96CnV2NYQhST/SRZe0ks5V9qwLXYe9QbGINI3PJNvs+xw?=
 =?iso-8859-1?Q?e7KdBdQ=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAVPR03MB8946.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?NY6t1Jw9aE0/bOs6bvGwPNlXeSaqK2fNJoJaWWyKWOf7d55nVdZ0L+ORZE?=
 =?iso-8859-1?Q?yUI+P24LsS197AhLivXgwhvTOLZv/AX0doUoXaMvcMoqTlHQCq1N5T+t+E?=
 =?iso-8859-1?Q?5peEL0WW4mTE/gOqUgu872mWzILdqbUCJk2HkGEcJ+JhMflnu8JGJr5s7P?=
 =?iso-8859-1?Q?n8848PBk9aDaxFwk98oVTrA/3/5L+tkSVAyLniH1qv7kMxL8uB5l8wqc5N?=
 =?iso-8859-1?Q?H3/1Mgc5YoPWZ7nOqWhCsUKTOWIbgbobD7HLWdeevfmnf0/xJi7EXos8qm?=
 =?iso-8859-1?Q?a0weYnns3/kTqe3hnW+8baI0dAMgu1C11K4hzrRnH+GpJDwjCxc+jY1WKr?=
 =?iso-8859-1?Q?zeFf3m07rct0Uj4NK9rmecw81vsxLQlIos5/DBr81OJE9TqqoYJXeFEpfi?=
 =?iso-8859-1?Q?Un10wZNBjasH1T+XMXTU2XTRUfI56gTPx3Y32EyrXDAw/Mw/EOq7YKOXuY?=
 =?iso-8859-1?Q?iaAyjt0PlIEN+0mXF29xI70d73MVB1pr/RO59Uym93zPeDQGMkgRWroTxq?=
 =?iso-8859-1?Q?oVgCgb+ubeTCoRk/AmucdgERFsttrz7R6ssoEWy/RFpZhRmdcCnzWaw/nk?=
 =?iso-8859-1?Q?4855elwN+yJF4093ypy5h7q0ZaumVxTdfYg+HQ8eGZ1td0m4sYV4MBRYkQ?=
 =?iso-8859-1?Q?Xgf5ns/LZm322YSQpRk53VnSI0aRzEucUCB+em+fmEwI3xFR7BNldUk/NH?=
 =?iso-8859-1?Q?Fa1brTtrg+KmYHd4ovDOAMJukBIVhMhxCXvfb+XcsHZLLuFTq4gmootH/K?=
 =?iso-8859-1?Q?hK4vKgzwX0FumQKwiVROaG7wb+S6r+015KWebIx6xM0u0DAP4/1lNPdnB2?=
 =?iso-8859-1?Q?0kXxmvsMdTmdUnDVtDgFoySVooz2mVQBn+ZQXhrUPWvy0NX3985gkfmPTl?=
 =?iso-8859-1?Q?UzcoDwcolv4mHynvgpBY3Iw9PCXKTAGObE5nFlpqWMkoAnxiVG4ZWNO6zf?=
 =?iso-8859-1?Q?zgfmKK5PtIHrOMyPLS9U2e4BO/m2XhfV4Em0P75c3JFzJg1+NokuSCG/i5?=
 =?iso-8859-1?Q?JPuNvDSkK0ZldVx6lBMvcoR//ZHccDduakvegH37Zwey5SSXFnkZuZvrkN?=
 =?iso-8859-1?Q?mgk3zQVzgK4X5MhcOvX/JU87wrx56HyieHhEP/Slkqj8zQjN3B4p/zVYoX?=
 =?iso-8859-1?Q?4OHarTKoSZxSJNu1Q8L6jLTv74yEGfsc7NTpqoN/0yKicg9YgJbKE8gSI4?=
 =?iso-8859-1?Q?j/wOEEjdcocJJJy3uRYLNXFvLIsXjvngHRFzol4GIQFacIs64gshA0wPBx?=
 =?iso-8859-1?Q?z2y54ikexmMIafw5zWJNUFreVAFpgtLYjKhjQKme5SfNSNmWpS0S0xUBlq?=
 =?iso-8859-1?Q?4+96vCl0nXrfQ5TEiHkDcIc6dlLqJPhd0RYavWeTyRWXphcXDvNDz04wS+?=
 =?iso-8859-1?Q?Sph0IQTr4HkRBrv+7jf3S/f15tItoi/bO3GrKkyyiJ+lXGI+ve4qruZurn?=
 =?iso-8859-1?Q?oQkS0Qigbi3ZlOFPr9NFBb99LNEZI1tkEm32TfAHIjAWVVDjUNn+V1CrAu?=
 =?iso-8859-1?Q?s3ny/DcTjg5qZuVm5xEohBBoxNCJh3nPS0Oh4QCgr6hs6z5P2U7g4diwtW?=
 =?iso-8859-1?Q?hgGqLBFKd91bUOSknXPQzh2jCvxUMnLc+1++PLdlS6PVYleB62TuYc7WPA?=
 =?iso-8859-1?Q?1d3Xw2fIyM7c+Uq0FBZsqkGbXg+WUModuRWtASgtbComhCRvlYN9jfpA?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAVPR03MB8946.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 87ab38af-1eb5-4f90-2e93-08ddf2b09ea2
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Sep 2025 10:30:54.5998
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: cz4garfWzjOnHbRDGQhzd2MCa3jbKgsCdTE3yKIF3f8YFdkuNw8TzChIanSwfp7ZeedPoujsJ663fXAqgORLlEZPjUGVuOZf9rzO61M/Sco=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR03MB6412

Move the SCI (System Control and Management Interface) resource cleanup
earlier in the domain_relinquish_resources() sequence to ensure proper
cleanup ordering during domain destruction.

The SCI cleanup is now performed before TEE (Trusted Execution Environment)
cleanup rather than after P2M mapping cleanup. This reordering ensures that
SCI resources are properly released before other subsystems that might
depend on them are torn down.

This change addresses potential resource cleanup dependencies where SCI
resources need to be released before P2M mappings are cleaned up, preventin=
g
potential issues during domain destruction on ARM platforms with SCI suppor=
t.

Signed-off-by: Oleksii Moisieiev <oleksii_moisieiev@epam.com>
---

 xen/arch/arm/domain.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/xen/arch/arm/domain.c b/xen/arch/arm/domain.c
index 1a8585d02b..0ac381a5a5 100644
--- a/xen/arch/arm/domain.c
+++ b/xen/arch/arm/domain.c
@@ -1090,6 +1090,11 @@ int domain_relinquish_resources(struct domain *d)
             return ret;
 #endif
=20
+    PROGRESS(sci):
+        ret =3D sci_relinquish_resources(d);
+        if ( ret )
+            return ret;
+
     PROGRESS(tee):
         ret =3D tee_relinquish_resources(d);
         if (ret )
@@ -1109,10 +1114,6 @@ int domain_relinquish_resources(struct domain *d)
         ret =3D relinquish_p2m_mapping(d);
         if ( ret )
             return ret;
-    PROGRESS(sci):
-        ret =3D sci_relinquish_resources(d);
-        if ( ret )
-            return ret;
=20
     PROGRESS(p2m_root):
         /*
--=20
2.34.1

