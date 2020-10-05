Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ECD9D2832DA
	for <lists+xen-devel@lfdr.de>; Mon,  5 Oct 2020 11:13:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.2903.8285 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kPMXz-0005GA-8B; Mon, 05 Oct 2020 09:12:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 2903.8285; Mon, 05 Oct 2020 09:12:43 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kPMXz-0005Fo-4A; Mon, 05 Oct 2020 09:12:43 +0000
Received: by outflank-mailman (input) for mailman id 2903;
 Mon, 05 Oct 2020 09:12:41 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=vcsX=DM=epam.com=prvs=85474143a1=volodymyr_babchuk@srs-us1.protection.inumbo.net>)
 id 1kPMXx-0005FZ-8c
 for xen-devel@lists.xenproject.org; Mon, 05 Oct 2020 09:12:41 +0000
Received: from mx0a-0039f301.pphosted.com (unknown [148.163.133.242])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 851728b0-46e4-46fe-a50a-dc65a2d327ae;
 Mon, 05 Oct 2020 09:12:38 +0000 (UTC)
Received: from pps.filterd (m0174679.ppops.net [127.0.0.1])
 by mx0a-0039f301.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 09595GJv023244; Mon, 5 Oct 2020 09:12:35 GMT
Received: from eur04-db3-obe.outbound.protection.outlook.com
 (mail-db3eur04lp2058.outbound.protection.outlook.com [104.47.12.58])
 by mx0a-0039f301.pphosted.com with ESMTP id 33xjp5uvvg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 05 Oct 2020 09:12:35 +0000
Received: from VI1PR03MB6400.eurprd03.prod.outlook.com (2603:10a6:800:17e::20)
 by VI1PR03MB4847.eurprd03.prod.outlook.com (2603:10a6:803:bb::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3433.34; Mon, 5 Oct
 2020 09:12:32 +0000
Received: from VI1PR03MB6400.eurprd03.prod.outlook.com
 ([fe80::71d4:858b:cc47:7da0]) by VI1PR03MB6400.eurprd03.prod.outlook.com
 ([fe80::71d4:858b:cc47:7da0%4]) with mapi id 15.20.3433.043; Mon, 5 Oct 2020
 09:12:32 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=vcsX=DM=epam.com=prvs=85474143a1=volodymyr_babchuk@srs-us1.protection.inumbo.net>)
	id 1kPMXx-0005FZ-8c
	for xen-devel@lists.xenproject.org; Mon, 05 Oct 2020 09:12:41 +0000
X-Inumbo-ID: 851728b0-46e4-46fe-a50a-dc65a2d327ae
Received: from mx0a-0039f301.pphosted.com (unknown [148.163.133.242])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id 851728b0-46e4-46fe-a50a-dc65a2d327ae;
	Mon, 05 Oct 2020 09:12:38 +0000 (UTC)
Received: from pps.filterd (m0174679.ppops.net [127.0.0.1])
	by mx0a-0039f301.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id 09595GJv023244;
	Mon, 5 Oct 2020 09:12:35 GMT
Received: from eur04-db3-obe.outbound.protection.outlook.com (mail-db3eur04lp2058.outbound.protection.outlook.com [104.47.12.58])
	by mx0a-0039f301.pphosted.com with ESMTP id 33xjp5uvvg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 05 Oct 2020 09:12:35 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dxFwJSIKbHI5On33/5odsW1RgwsLb3Z+kwLGSlvn18dpWN3dWekVpAjv1IBzdMjPPCpMs5GirIxeQ705yCThy0svh1FGwZg9hgcScJZ28zZ6zlMx5vx7V2gvNV/4lmHflPvDUeFegPUNERCHkHfY9qNvEaKT0urUQDViHoCZ3/DIY6Cw4qkJRSBB/eO2wImniyf31vTjQy6a0DLiCaZojndIlGqAzBZTXMc412AuZd7q4LBs7dTRCXRaZFtxPscIVKRMDqxnDMFR7+amv/f0FYKWj7NICSYo+3uP5IL14YXQ/c3NONe6L8qsNzoIADm+vnL/zx/+YdbrvzTd5uQb7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QoxAd8gi+GZNq9Lcq2t5WvdxqX9WQ9ewfqYfmUe3/Mg=;
 b=BZuvlwsunZenyl8uEQd3PxNATQhW+5NoxKiCei6xT4HNkYr+dBLMrY4mS51mtxI0mxanRE12krxmuBckspRPHRG3QsmMB+/tzF4YJTONcpFYJiLNFpTEF48/wpcpKLTz8/1KBkRa+LJxHE2+5IAUUHI8bfhOI2o7XEOA9HRQjw/T18wnmpW+T/ofuv8uicysdpz1gecb5Tt60ms+Eg8YZ634yVARfeqsZuJSuPtyjLKXok0fCRvW3vWsyxsFomvoYo9i2sYwETpsMkS/dgpg3FHhKcmRIJEk2OUfLRReOdLcX1RN6lo3PVwSW8GBi6bqV6VsqFS3DRheFijWWljLDA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QoxAd8gi+GZNq9Lcq2t5WvdxqX9WQ9ewfqYfmUe3/Mg=;
 b=b22kCCOkLOSCyXq0tCq/K7cvt3R2eLRnhicT6DECqIrPlQ4DCAnop25MnBja9a1J3mqpMZ+oePrlp4NrXwqmOs9yH059MSgWmuYHVRyl5qXXcHbKA42bOYKfeVUp9V/fCreSNkPo15FVIc7FmQ4HZ8bvL31QpXmZA2twiC6XrA4+n9B2pvb8loU1tdLEGYxS74Pt9eB49tTh9IsPVyuEM0BrAoHSEyFDJbne5IOHo+OkUxHwxz/kgK4pNsOL47TAukFq+Jutw8kKg2ZWDFl88QCnRvj+AZabaKemCkY1GU1QOzoLU6zVxnPUtM7UuYwYzdFawpLsUdTpg0RcURxclQ==
Received: from VI1PR03MB6400.eurprd03.prod.outlook.com (2603:10a6:800:17e::20)
 by VI1PR03MB4847.eurprd03.prod.outlook.com (2603:10a6:803:bb::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3433.34; Mon, 5 Oct
 2020 09:12:32 +0000
Received: from VI1PR03MB6400.eurprd03.prod.outlook.com
 ([fe80::71d4:858b:cc47:7da0]) by VI1PR03MB6400.eurprd03.prod.outlook.com
 ([fe80::71d4:858b:cc47:7da0%4]) with mapi id 15.20.3433.043; Mon, 5 Oct 2020
 09:12:32 +0000
From: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
        Stefano
 Stabellini <sstabellini@kernel.org>,
        Julien Grall <julien@xen.org>
CC: "tee-dev@lists.linaro.org" <tee-dev@lists.linaro.org>,
        Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>
Subject: [PATCH] arm: optee: don't print warning about "wrong" RPC buffer
Thread-Topic: [PATCH] arm: optee: don't print warning about "wrong" RPC buffer
Thread-Index: AQHWmveoJ/DTTDqDgE+9I2W9l7TFKg==
Date: Mon, 5 Oct 2020 09:12:32 +0000
Message-ID: <20201005091212.186934-1-volodymyr_babchuk@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=epam.com;
x-originating-ip: [176.36.48.175]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: c0ef2115-fa02-446d-61dd-08d8690ecab4
x-ms-traffictypediagnostic: VI1PR03MB4847:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: 
 <VI1PR03MB4847247E34BE2B423D378C51E60C0@VI1PR03MB4847.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 Wq5JTLAzaUCyzWTIK3VmAWaRLSimcljm8mQFqnEzZOeYZL/fn4w9NY1NA0xfnUDc03+0RzZamvpCtmLa2PhHS5wwPfzHeLZmqV5QlVA2qhanuwmO81RSR0WV/vUVxT6TNANQS6Pz5UxY/4d4/YdnMrD7/whl78abgY3AjMi4M1IBL1nlF2nw+a2yT6VgXNpdYOwn8NJ4AlvEo72u8yUX33T8CV5FRQAU0mMrmy3H2rRXnVIPMIKPzc/Jz9T39NViwx0+WIQcX/bvz52dLUy2KkBQfEVUzCa0166dazdrSZDOHAqzneNKQ+/sfm81vWSqs/3kJdQQF9WpZimexC4W0w==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR03MB6400.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(39850400004)(376002)(396003)(136003)(346002)(6512007)(478600001)(107886003)(8676002)(2906002)(4326008)(83380400001)(26005)(8936002)(76116006)(5660300002)(316002)(54906003)(36756003)(71200400001)(110136005)(66446008)(64756008)(86362001)(6486002)(91956017)(6506007)(55236004)(66476007)(66946007)(1076003)(186003)(2616005)(66556008);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: 
 H8hp6AX6W847xNUKd9xpQozoVhucOq1LfOt2Rhh1L5DYgunV8xS0BTnimQht3sguG7qNUglky6pGVMochgUdKvPW/eXr36p0kh5Vi33D+RHOxTFyCmgxQjJR/e9qlWzQ2yJ66Db+Kr1N6Vb/1+yZihkUOfn5gwU7SGMVACAqHGFjgyP4Bt69axUErsiwz1AS7fZgYI4HhEPNZLmw88gHyhjvoa+EGFvHUd5QvPiISpycTRRzdS8LJFzK1jkSl5wdiZvwoH2wZZMXQsACOsJLj3uSKJItKjr/WLvHbHNQluC7m1uI6ql3uhaGM1rjqotwa8GwA/0KNqJksFJppCM0priE/Xx+a/D8V3+FaPByQWOVZvzOjHj6TN9wAzCJy2Af/T09dHqN6QE6iv9YumM7WV9cr8u9SxYdM33d/ISPFQGo4Y+tMgnWZEpuCsFosOlo7hwKZd4yTg7ebEgwA9M06J5CRr93NdwSu3Rd5inuJ4sgvhvQMKlnuzeX9ixNiNg6gB7pVJwaeV62PzMnyV4mxJA6FzHasookwP+shxw4Ai3Tivwjg7AglZI72uSnvwSEOSZn7QXzDbN762UOBYPMAaOOjbok9NoiGf0I2k8iAA127jSh7VQM3K/oeNyPbI0qUJPV+xPiY/XzeP8GfNX5sw==
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VI1PR03MB6400.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c0ef2115-fa02-446d-61dd-08d8690ecab4
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Oct 2020 09:12:32.3147
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ksyOC71X2v+cSGO/5Jp3/JqA4yUUhb7TkrsDtr0rqieWja+UhnGHdP4YMLSsdee1XTgw2bbIn69241OX1X790/tG87dwjQtlQd/F48PaUQ4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR03MB4847
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235,18.0.687
 definitions=2020-10-05_06:2020-10-02,2020-10-05 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0
 priorityscore=1501 spamscore=0 mlxlogscore=999 malwarescore=0
 lowpriorityscore=0 mlxscore=0 adultscore=0 bulkscore=0 suspectscore=0
 impostorscore=0 clxscore=1011 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2006250000 definitions=main-2010050069

OP-TEE mediator tracks cookie value for a last buffer which
was requested by OP-TEE. This tracked value serves one important
purpose: if OP-TEE wants to request another buffer, we know
that it finished importing previous one and we can free page list
associated with it.

Also, we had false premise that OP_TEE will free requested buffers in
reversed order. So we checked rpc_data_cookie during handling
OPTEE_RPC_CMD_SHM_FREE call and printed warning if cookie of buffer
which is requested to be freed differs from last allocated one.

During testing RPMB FS services I discovered, that RPMB code frees
request and response buffers in the same order is it allocated
them. And this is perfectly fine, actually.

So, we are removing mentioned warning message in Xen, as it is
perfectly normal to free buffers in arbitrary order.

Signed-off-by: Volodymyr Babchuk <volodymyr_babchuk@epam.com>
---
 xen/arch/arm/tee/optee.c | 20 +-------------------
 1 file changed, 1 insertion(+), 19 deletions(-)

diff --git a/xen/arch/arm/tee/optee.c b/xen/arch/arm/tee/optee.c
index 8a39fe33b0..ee85359742 100644
--- a/xen/arch/arm/tee/optee.c
+++ b/xen/arch/arm/tee/optee.c
@@ -1127,25 +1127,7 @@ static int handle_rpc_return(struct optee_domain *ct=
x,
          */
         if ( shm_rpc->xen_arg->cmd =3D=3D OPTEE_RPC_CMD_SHM_FREE )
         {
-            uint64_t cookie =3D shm_rpc->xen_arg->params[0].u.value.b;
-
-            free_optee_shm_buf(ctx, cookie);
-
-            /*
-             * OP-TEE asks to free the buffer, but this is not the same
-             * buffer we previously allocated for it. While nothing
-             * prevents OP-TEE from asking this, it is the strange
-             * situation. This may or may not be caused by a bug in
-             * OP-TEE or mediator. But is better to print warning.
-             */
-            if ( call->rpc_data_cookie && call->rpc_data_cookie !=3D cooki=
e )
-            {
-                gprintk(XENLOG_ERR,
-                        "Saved RPC cookie does not corresponds to OP-TEE's=
 (%"PRIx64" !=3D %"PRIx64")\n",
-                        call->rpc_data_cookie, cookie);
-
-                WARN();
-            }
+            free_optee_shm_buf(ctx, shm_rpc->xen_arg->params[0].u.value.b)=
;
             call->rpc_data_cookie =3D 0;
         }
         unmap_domain_page(shm_rpc->xen_arg);
--=20
2.27.0

