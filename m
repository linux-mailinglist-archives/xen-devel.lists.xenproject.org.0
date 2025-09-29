Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 71B29BAA890
	for <lists+xen-devel@lfdr.de>; Mon, 29 Sep 2025 21:56:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1133366.1471497 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v3JyU-0008R1-IG; Mon, 29 Sep 2025 19:55:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1133366.1471497; Mon, 29 Sep 2025 19:55:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v3JyU-0008PL-Ep; Mon, 29 Sep 2025 19:55:54 +0000
Received: by outflank-mailman (input) for mailman id 1133366;
 Mon, 29 Sep 2025 19:55:52 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=6YU8=4I=epam.com=dmytro_prokopchuk1@srs-se1.protection.inumbo.net>)
 id 1v3JyS-0008PF-SQ
 for xen-devel@lists.xenproject.org; Mon, 29 Sep 2025 19:55:52 +0000
Received: from AM0PR02CU008.outbound.protection.outlook.com
 (mail-westeuropeazlp170130006.outbound.protection.outlook.com
 [2a01:111:f403:c201::6])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4c86f93a-9d6e-11f0-9809-7dc792cee155;
 Mon, 29 Sep 2025 21:55:50 +0200 (CEST)
Received: from GV2PR03MB9572.eurprd03.prod.outlook.com (2603:10a6:150:da::5)
 by DB9PR03MB8774.eurprd03.prod.outlook.com (2603:10a6:10:3c6::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.16; Mon, 29 Sep
 2025 19:55:46 +0000
Received: from GV2PR03MB9572.eurprd03.prod.outlook.com
 ([fe80::edd1:842f:9b14:509e]) by GV2PR03MB9572.eurprd03.prod.outlook.com
 ([fe80::edd1:842f:9b14:509e%5]) with mapi id 15.20.9160.015; Mon, 29 Sep 2025
 19:55:46 +0000
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
X-Inumbo-ID: 4c86f93a-9d6e-11f0-9809-7dc792cee155
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=S9+maWaf1WGlCYm/Q08OV0rxcQQFJ7zH3qPIDd3zQaycN1AY587r7pJEw0c1yPEKE2R/Qm9ddb1ae3rLhxbxdq/ojBMQvvylqDR54/LSrdCtRLBnT0k223eXs1h7Lxv9U/JxvBjROxW7uMm+1EpphRTIqQ6OmTlMmLMwgZTCojidZ3apZ72iA/+YIuEbzTzQlQF4/40MwSUDfqmS9sE62FDTHGYhKs77oqCFWLezW/9MdMhP08mybGLdhZwp5FBgKogBcBHDv+HL3/EAc/NFPQbV+PazZbb90iy4B+raMkr6VJVhz3+ZlOUD7UBxuwOSbYBPqCJ/y/HQkzQf/RZcNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PDNpMY8JYLJcz1TcoJVtdxvjvaqDkSl07G6GkIo5MQ8=;
 b=g0bh9CsHyA34mL4Z2y6rTsquDzwzaFE8WL/mvoYywcho+ql9WmvfJOrAZgvrpqN1qj38coO9swpyhxtl2qFq/UGXG9nU+s5fgeDxxAZoyIqZSDlSjKty2sF3kOy9KKOSab7vJBW8q3zC4aM81sad+/zRAZz+eEy1sPSP3P36oBJhpC7eTkyPsUgfXm68iw1qbBxajDd+xQn6ceLcNPtxZpzSPPhXTFf4k2Ru5sAIgjMWD0XOtkQ9WhpKv/koAdTNmgv0xY3alsBB/YCijvfDUHJHwGC2dVqcMJg9sm7K3BBIwMAcBv2qIYt4DQEGd6NDT+HlEQPRzWDlr1SJ6EGtEA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PDNpMY8JYLJcz1TcoJVtdxvjvaqDkSl07G6GkIo5MQ8=;
 b=ZqAuTs1VobQOAqO5JnHPBKIHwH9gFsmuKHj9xlBRqLKcqQ976I/jt98dghOBPWnCp3gu2dDPU2PmqPCnsE60jZUGE7gYYtWsJRxCTHERqALHhxLRpNR7jllWdmjnrGkcvD5kzXY/MutQpooRWimuhwD3f5Y0WRQsUQ4H010uKZSpYRw/bYJuvRRbLFnNaBjQLRpQSNxrpTz/KL13tblMlOQF4Bwvf1sl9cWPMDBauVjHhDuEnsvcV/hWpzudUqkJ32v9i3/+rbEN/DYO4YkYQkETsL0v0Khb5lhdaihJ9r5wwqx00UEow1k3aH4hcXyog9cPrhXvaomrFW7UsQ1Yaw==
From: Dmytro Prokopchuk1 <dmytro_prokopchuk1@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Dmytro Prokopchuk1 <dmytro_prokopchuk1@epam.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>, Julien
 Grall <julien@xen.org>, =?iso-8859-1?Q?Roger_Pau_Monn=E9?=
	<roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>, Bertrand
 Marquis <bertrand.marquis@arm.com>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>
Subject: [PATCH] arm/gic_v3: fix MISRA C R2.1 violations in gicv3_do_LPI()
Thread-Topic: [PATCH] arm/gic_v3: fix MISRA C R2.1 violations in
 gicv3_do_LPI()
Thread-Index: AQHcMXsLUvRxhyKkhUuhWVAohL+E7Q==
Date: Mon, 29 Sep 2025 19:55:46 +0000
Message-ID:
 <b26772df8733dbd1ce6ea14a6e8b73f278db3a3d.1759174857.git.dmytro_prokopchuk1@epam.com>
Accept-Language: en-US, uk-UA, ru-RU
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: GV2PR03MB9572:EE_|DB9PR03MB8774:EE_
x-ms-office365-filtering-correlation-id: ffba5b74-e953-4808-c61c-08ddff922e3a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|42112799006|376014|1800799024|366016|38070700021;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?OEL/kmJSMXs4wt2f1iyHQt2iY7PqnunzoLqYIwfLNCAMhfGdh9ffpLSE4f?=
 =?iso-8859-1?Q?VGHyaOn7MRApTHT3OQzXVjCvGHuSTOyABUppEQhdC/u5vBdsf/MOz7nuzl?=
 =?iso-8859-1?Q?/kLM+l0yAe5TvKIhcImmzrVXyaMYE6xywSGqsZ7O5RcolhxNH3ZzoLIj+I?=
 =?iso-8859-1?Q?7MPePyQhh/eTBTSZeatzwgPwvY+NeRZ578G7yA1lFkmjkfnct6yzDJiCbN?=
 =?iso-8859-1?Q?oFFy0r5N4qY2Chqmr3TZB08UfLlr75WT9B8UMy79pLJJlOJfPbSf8HOwwe?=
 =?iso-8859-1?Q?58aGmcmoDzxTefBk+wZFxf6RKm7wPJFwzJ9CrnBEEa+pYTHTeGhUx9zXND?=
 =?iso-8859-1?Q?2ZnNCA6q1ttvk1VbO0UCCIAh8NP25JQqLgyv9oLNh+wMfDmreNUtOU7PK/?=
 =?iso-8859-1?Q?9RoYnFX3+dmVN7NL8QxP9kN1DDkxcz2OzSPSC5f/KV8zqZVtK6N/uOCGjp?=
 =?iso-8859-1?Q?n0Lnax2uC8aTTcmsbFH6lcdg716PFZTaquAgEhNlvxYTxRl/9OVnSlkaiA?=
 =?iso-8859-1?Q?bhXjwhiVJu9iGIWcqmC+PEpzDLCNcMinqy2sOSwNfqzV+DVNiiXgOy0CZo?=
 =?iso-8859-1?Q?7WUvYNhVd/EPkFLGgQUEdUEz89Kv0hzb9pEkKS9hnwZB4rZhzSttuX4jkY?=
 =?iso-8859-1?Q?tTW52sqtQ+Xx9sTL5aN0/H9v360egSPyJX2s1bOyuxnGzV22Kcm14qUuar?=
 =?iso-8859-1?Q?2LhtzgoJgG+GkuVEMj4+g3ZXuLyidH4VtZ4CKD+KdUdv018JNbCsaEXI9Y?=
 =?iso-8859-1?Q?r68J4CtET1PGHA4NCVnHbNCS+HHSYCserxJL7C+yJiMv/ViM3bPEgOVsCB?=
 =?iso-8859-1?Q?H9cycgGMuE6XwxtlaRJXiP++AdXrNR1dLA5R+RdA79nZ5+MU9wnG8UmpoV?=
 =?iso-8859-1?Q?fSabFhVHcXU2BhCAcnOXHysZLI7I7lIf1eRn340uDYcTSsXcgIal1yLNd1?=
 =?iso-8859-1?Q?2nGA7fPesJ21PyR20LOP3nzU0WPFtw0d37wWIDIFnY+P+YA4/SAFbwp8jb?=
 =?iso-8859-1?Q?IJphu5ekLhbPdQ8zNGgPYg92FUEJ0cMsWBn7f65+hOlfdifUbDtVmHwZOs?=
 =?iso-8859-1?Q?a/yaj6SF7FrPPlGQncB357RS/sVuGPFqnjTOmYPnA14IpZxJK7I0rcP2/1?=
 =?iso-8859-1?Q?PTYD05LxbQE113e84hfKx6Vl1elAGXVjOYSq9ACKKrgz+W8muXAHWQivnv?=
 =?iso-8859-1?Q?FwqqwvOy234pYuvFYsBGdNXTQ16EuHF4QNEc4y/GBqv6nlF0gJM/3+g5N3?=
 =?iso-8859-1?Q?io0clMk92ToDhJH0ZHWnwviD+VsodWYhANmjqdt8mJcLTmTGolp4L36TlU?=
 =?iso-8859-1?Q?v2Ol/owxQwvNVibMSXPnUZFp3ogHdHJrHL8UMZ/dhbV6l8PSNeJL6FyBtV?=
 =?iso-8859-1?Q?wVHCZQDFIJB0rvMPGrio5b0daaSj5lHM8QzOrEHtybPZ/+ZHmfu+oe4Wrm?=
 =?iso-8859-1?Q?9NKWbClcwGvxVJCswP8nUfo+tu7k3FxK+iDOtAkcvPGik6gjHMp/euLANR?=
 =?iso-8859-1?Q?2Dl0vhr7l/IwQTojm8mmMPBdkprQqnPFkiSGDE6U/ejw=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR03MB9572.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(42112799006)(376014)(1800799024)(366016)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?cK5NZtJmwGtIgdwNL9eBFpJRv781rfgXUXmZARwvFMWioYV+tKwD4D/Z8G?=
 =?iso-8859-1?Q?ZOvlfQ6jZVkTzmSFpWYS8V0c/zz+LO9uZImWYwuG7YrNx56ytoIqu6xOK9?=
 =?iso-8859-1?Q?atUyg17k/0zSIvjenHVvOTGY5b3YzjqoOYZMrQWxKJqPgv9wjoUPkSvYZO?=
 =?iso-8859-1?Q?+a5bP4gePjejM8gQAeymgIvLx3xh8yxasR9HE5h4H5rtOJHA3Qz2JTvCeQ?=
 =?iso-8859-1?Q?Q5KZX6wKQP7qP8Sc1qAl105Kc+wJUbLR++MMuCOL6lrFkUTC+FsArjqjh+?=
 =?iso-8859-1?Q?z9LtAg8nTjOluLQrIYbr5mUSdOWZL1Qx+VY7SjcWxaLjpimWNKpn+/X0Ez?=
 =?iso-8859-1?Q?hOeydb8Xz+M1ChrWpO6yAwY4ybH35g8PfPaxzGc6D0VMfRLFqk8GkpqfPD?=
 =?iso-8859-1?Q?eCQgYN+4hn/pjJ0VrLAVyR1LxFSTP2zYQBHmsaqFkNc6iz8OgmNiDd+EZr?=
 =?iso-8859-1?Q?SzaEBavL0cYlQN8144etK+Ll+q+4WX/ITROw/38uMH8eKhBLdO66mrJ5bI?=
 =?iso-8859-1?Q?cHhCNMS5GRaVfgAy5N3BwZLDdOuYLAg6iBchE3hp19DsCKdVyuS5YR+IcH?=
 =?iso-8859-1?Q?bSHrzlXEBJbJYGa3Qg225PWmbe7YkOjs5stFKat31llFEwlwuYSXJd+kvG?=
 =?iso-8859-1?Q?+61JFFg+XLsePyr7u82pjJECxYMK76DFBQMUrylRcp2/62j9aCVJb9dr/p?=
 =?iso-8859-1?Q?cxH+IE1dkphOHuOvGsBIt6PeThI1PqKQAXb/ytQNaVfCUouoh0ZgfhTADu?=
 =?iso-8859-1?Q?W5nIJ8nTYQJ06cQi4t/ZPoA23spOFXYjgZqlPDB4qPKj86mDWgcIPQij0s?=
 =?iso-8859-1?Q?6jyuTAQ/YQ+su0BJ0STTH24yQ+topjh8ppckWUUaCa8mvQWEKOAdI+qRJn?=
 =?iso-8859-1?Q?aVk7C/MsrSRxKhTbgBnlBlp7MIxy8+EZOxM3dsVw3S54oVqtVX2iD7y3tA?=
 =?iso-8859-1?Q?9YHCcVDBLbDwlb6F8Dg4FdyyfwSA+BFsb7QrEB0gqqIMrCR7VOhVcXYJX6?=
 =?iso-8859-1?Q?yeXx4F00ClJL7HPxk//73FmbRuDQ9Mllk8KSwmaSA9omSVx0j/he/s5agk?=
 =?iso-8859-1?Q?5N5bOu2zItJQJYCoZ+Hxs6AtxwlyW731x0gVYpuKrt1qMpGx0npQ19uly+?=
 =?iso-8859-1?Q?rT0u/dPWX63bHHC5sJa9aby5RHKlOcDhVIaal5aKjZHS+BVHSAJXAjxCdX?=
 =?iso-8859-1?Q?w3QBGPN/Le/v93e5BExSP9HBymMN0RqWx0z26LJkgsyuD+Vpw7HDM1g0p7?=
 =?iso-8859-1?Q?bKipO6OgcgRIxQPYuDbD5ZLXlZ3/E4WSMgrDDPsNjmyxljt/quXAAlTdol?=
 =?iso-8859-1?Q?gnwnrayYNct/R8mlaLnME+7yFuBqB8MlibeDIqGLzP6bE/tlUydK18Zev/?=
 =?iso-8859-1?Q?3wIkO3BUBeCeZYDJGounkPrNsQv5kHHVcxhMA2+3qruhoc7Nvd6TPyA1td?=
 =?iso-8859-1?Q?vGOpkrxSx6YpfzgjRV5VASX9wB7+iBSrhYS2dV30V8lh1Ofhr2kSdkdaaa?=
 =?iso-8859-1?Q?0cdsONaiysbm+ODEpszearX2hePtxs1OccG+wqxOZF8mU8AuEKnH2Iapve?=
 =?iso-8859-1?Q?5bzAlesCAkdH15fJQIcfXqQlNq6PKcu34p3pqSPYQm1XDveTPNARzhnRx5?=
 =?iso-8859-1?Q?ruX7XpCaOyx1PayvbwLQnIV9dcX64SbRPG1ey2mFCPkbI0F7V58hNp+A?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: GV2PR03MB9572.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ffba5b74-e953-4808-c61c-08ddff922e3a
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Sep 2025 19:55:46.2008
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: gKj6Hz4T0VCVWJ+APjhTAhv2pnyK9tPpURZDV9osPS1W13Y3Y7/ChhrVN1IdSwf1jUurV/lUJTEo14BHnqIoNi5vWmDYOGyaYvGzZmXOZ6E=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR03MB8774

The function 'gicv3_do_LPI()' violates MISRA C 2012 Rule 2.1, which states:
"A project shall not contain unreachable code." This is due to the use of
the 'BUG()' macro, which causes the function to never return.

This behavior is intentional and safe within the specific build configurati=
on
defined by 'CONFIG_HAS_ITS'. The 'BUG()' macro handles irrecoverable error
conditions where LPIs must not occur without an ITS enabled.

A SAF comment has been added to document the justification for this violati=
on,
stating that it is safe within the context of the Xen project.

Signed-off-by: Dmytro Prokopchuk <dmytro_prokopchuk1@epam.com>
---
Test CI pipeline:
https://gitlab.com/xen-project/people/dimaprkp4k/xen/-/pipelines/2070455717
---
 docs/misra/safe.json                  | 8 ++++++++
 xen/arch/arm/include/asm/gic_v3_its.h | 1 +
 2 files changed, 9 insertions(+)

diff --git a/docs/misra/safe.json b/docs/misra/safe.json
index 3584cb90c6..4c227c1e8b 100644
--- a/docs/misra/safe.json
+++ b/docs/misra/safe.json
@@ -124,6 +124,14 @@
         },
         {
             "id": "SAF-15-safe",
+            "analyser": {
+                "eclair": "MC3A2.R2.1"
+            },
+            "name": "Rule 2.1: Unreachable code",
+            "text": "It is safe because the BUG() macro is intentionally u=
sed to terminate execution when LPIs are enabled without an ITS."
+        },
+        {
+            "id": "SAF-16-safe",
             "analyser": {},
             "name": "Sentinel",
             "text": "Next ID to be used"
diff --git a/xen/arch/arm/include/asm/gic_v3_its.h b/xen/arch/arm/include/a=
sm/gic_v3_its.h
index fc5a84892c..672dae7ac3 100644
--- a/xen/arch/arm/include/asm/gic_v3_its.h
+++ b/xen/arch/arm/include/asm/gic_v3_its.h
@@ -229,6 +229,7 @@ static inline unsigned int vgic_v3_its_count(const stru=
ct domain *d)
     return 0;
 }
=20
+/* SAF-15-safe */
 static inline void gicv3_do_LPI(unsigned int lpi)
 {
     /* We don't enable LPIs without an ITS. */
--=20
2.43.0

