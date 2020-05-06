Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BA061C65A2
	for <lists+xen-devel@lfdr.de>; Wed,  6 May 2020 03:44:43 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jW96X-0000wA-S1; Wed, 06 May 2020 01:44:09 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=VINC=6U=epam.com=volodymyr_babchuk@srs-us1.protection.inumbo.net>)
 id 1jW96W-0000w4-IK
 for xen-devel@lists.xenproject.org; Wed, 06 May 2020 01:44:08 +0000
X-Inumbo-ID: 12bbb868-8f3b-11ea-9887-bc764e2007e4
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (unknown
 [40.107.22.54]) by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 12bbb868-8f3b-11ea-9887-bc764e2007e4;
 Wed, 06 May 2020 01:44:07 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Dg0TjyqMo3ZmVj9F55z6c+JO9PA9WgdLzHJJR3pEmpRGOvVLdRLwtl53Q8clxMy64RjD+rtHu2krfS68xgx5x6aIyB0S5hS5aEVOf6FcT/yl9TQCByTYHRIx7YFnzA9njyRBUzY2KsbxHAf+JhzTvNuN+tAmNDyevUmMqB//DBES0S5edq0EzBZswfVvtCNb6t8aSrYG62W2mGe4OMuTlaXj3z9MneULUJDpE4nr2JDYJ/Y9BXX4Q7uRk+i7PozbRRTWXmwruND80yeEEdubCQ25Mjumw47bkb5mdjT2dyZeUpgR/TCTYLMsldN1ycHvRmsiathU7MIO7rOHBSol2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fKnDljvhrbKgsAXtvfIFdp/jMPzwjBEMHTOWfMN9AuQ=;
 b=TBLOjqNjmeaSxgq4Q3vkqNNixfKHh/X769rn383jtR6vsEmBTug5x5EjybgVa7LsYkPaAohAtpnVZG283Ha/jPxXarIop748HcJOX2R99QBYEaQuxa7y2YwBRnmjJqtHvAeP7A+eNH4BTYfog2h4Le1hcHos/aP+Ds+ro9yeUm7ZjsaJzkRa4+bw1zuKUN+CtS1r9t5RzR8rfzn21BCWuBc2ZMJiEHuI60tWca3PY0gs7npLLIvN9XWT987EbEcfMQLDBbMuXWlyaAZq1n92xSgnbNSEl5FM5hooxhmnEajVIVa/GSfAkKeEyn2ICEh6M1YLZYWvfaXHorGFra3kEw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fKnDljvhrbKgsAXtvfIFdp/jMPzwjBEMHTOWfMN9AuQ=;
 b=JExpJt+0eZ84/gLrD9CQXsSq+Ew0Q2huxoyOIBroNPnp3e56mAfaN00StmtdgNsDglsOchqmxZ7GQKkOp4W4dhoYP2F750BfL82CKA1x3z4QgInBS3zHdGL3FubgDxwrOtXHeYJcrbePBM/Z/xN8YM3Ya1XXGZGcVcS1cSdz+GI=
Received: from AM0PR03MB4148.eurprd03.prod.outlook.com (2603:10a6:208:c7::10)
 by AM0PR03MB6145.eurprd03.prod.outlook.com (2603:10a6:20b:15b::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2979.28; Wed, 6 May
 2020 01:44:05 +0000
Received: from AM0PR03MB4148.eurprd03.prod.outlook.com
 ([fe80::84c0:df74:747c:17bf]) by AM0PR03MB4148.eurprd03.prod.outlook.com
 ([fe80::84c0:df74:747c:17bf%7]) with mapi id 15.20.2958.030; Wed, 6 May 2020
 01:44:05 +0000
From: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: [PATCH] optee: immediately free buffers that are released by OP-TEE
Thread-Topic: [PATCH] optee: immediately free buffers that are released by
 OP-TEE
Thread-Index: AQHWI0fTRy+rlPvmsUKZMLlR49t2iQ==
Date: Wed, 6 May 2020 01:44:05 +0000
Message-ID: <20200506014246.3397490-1-volodymyr_babchuk@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=epam.com;
x-originating-ip: [85.223.209.22]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 150b7557-17b5-44fc-611d-08d7f15ef651
x-ms-traffictypediagnostic: AM0PR03MB6145:|AM0PR03MB6145:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <AM0PR03MB61458D214F0253150C974F47E6A40@AM0PR03MB6145.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-forefront-prvs: 03950F25EC
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: AfDzHHT1oaA+DB/wpTL5BTxXN5432XKuzxII94Mbb7zkYDcZTuDzUv34mc0dMN3dSwJK51aUN4yqpdW7egynaH0dgLK2s+7bFyR6VEAjvVz2zGDc+yGn8jB2Ls4YkXgEPbhqwNmmt+2SAyh6BTWiMnBpu6boxzW1IwfeFKvkj6onQ2rr/bGHkXqettqna/5MfzibhRv1f57iNoCXx29rJm6VZHEiF+N7W/Is0KhcUYMnIdXH22SkbrTA2w8+DL2o9YnzyGL7OMok4oyzDgtyB2cAvTI1sSpPWwZJMX59WwdeK0YwdItTVsQj7m2plLoeH84dUmUcO51EQBig3Hgic1ZEnEmgNDlWJ+vTcCT2X3o+tQPeQuSOQhe/81htreaesteElrZCSxsTX+87y6IqR5la4HOsnzmUIT8gYaTMdPokUBG4XIZhheFxY+t0DRD8dImSUi5l+N/5dEy4CPGcxUzGubmCrEoXDItIb4S9Zu4u6HzZog6bI5yNSKrytPPo9hoyO0fPcdpr94nOnTHJtFcqHlvzNilvCbCwCdse2dI=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM0PR03MB4148.eurprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(4636009)(39860400002)(366004)(396003)(136003)(376002)(346002)(33430700001)(71200400001)(33440700001)(66446008)(64756008)(316002)(2616005)(66476007)(66946007)(66556008)(26005)(54906003)(1076003)(5660300002)(6506007)(186003)(55236004)(86362001)(36756003)(6512007)(6486002)(478600001)(8676002)(6916009)(76116006)(4326008)(2906002)(8936002)(14773001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: P5y37iZRNkpjlW75UxorGWa8vNZqMOVYiJE4yXB5VZCzkVfQF6B5nCKZU+syJHTW5Xtg5BspRtR20mPak870dfUmKoRoAgNV4FoJpq1jXVslEEY5BYpLnT1gdYUtvy6uvSz8LdwWwDvnqxpLGaPC+rNokx2ekcc3CY+8iz3/GSIYaR5LsEklnW3D/WgbdsBJ7T+xYfAYlRJfp6d81vOyhAseLTboGFwWLD0VNRUwQvvuM+Rnl178RJeAGISF/RI83iL4tfR+lYhYPQM5TOBk00q3pIRosoIuzgTKODku8LguVp+jce5cQOkkC2TKWtEq2IvnKywS6MYAyzchd1RdLyWG9OzxJ8serp9bUR6DeX/r708rWh6cKQx4gHwoZs4lWZ/3lhwXkPHWtr1m7r1u94xE4DFY6qwDDAVupm+yisXqgoMS4FaadpiQ4BKSRO5xwN84qbo/wV7r4LDYQI4ilkJUgor+IW+zZseHSpXmyHdO9ipDBKgrgpxTlT09jbGxYQ+XKoiYLXKPzZQaZVzl2b/nbOCNSfZe0x5Z/8++rB/H+5JvbumB8T/p2NqPYtQoi1WpBYIJWNlls0ArYKoEn2TMFlmffIwJMjS9s7wlADOjX9UrsWgR5S/BRNGrlVFE8YFRG505+m4U+d+Sjjw4Wk25fq3Lebyw1N7d2zpplOJm0lx10ekBfPQdpjefgZVaIqpIZjyE5nmJkYPTLP0bEqZ2J3mA4WHu6gprwYU0+Q12gaXXiu2Clw+jyNz5HtlteeHESyr6yoEUBUDdCQcNmaOJgcY8SdHlVJdx6JzHrIk=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 150b7557-17b5-44fc-611d-08d7f15ef651
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 May 2020 01:44:05.7133 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: vsa1WHBaM3sSg+wC1Z7KH3dPlrN/ErEpy+zR+BmZJbwSJYEqz6Xr0H7OG3ScGENOWwF5Dvwbe1mmI6Z9jYxr7BDayk5HpMhN+gK/2IYEO98=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR03MB6145
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: "tee-dev@lists.linaro.org" <tee-dev@lists.linaro.org>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Normal World can share buffer with OP-TEE for two reasons:
1. Some client application wants to exchange data with TA
2. OP-TEE asks for shared buffer for internal needs

The second case was handle more strictly than necessary:

1. In RPC request OP-TEE asks for buffer
2. NW allocates buffer and provides it via RPC response
3. Xen pins pages and translates data
4. Xen provides buffer to OP-TEE
5. OP-TEE uses it
6. OP-TEE sends request to free the buffer
7. NW frees the buffer and sends the RPC response
8. Xen unpins pages and forgets about the buffer

The problem is that Xen should forget about buffer in between stages 6
and 7. I.e. the right flow should be like this:

6. OP-TEE sends request to free the buffer
7. Xen unpins pages and forgets about the buffer
8. NW frees the buffer and sends the RPC response

This is because OP-TEE internally frees the buffer before sending the
"free SHM buffer" request. So we have no reason to hold reference for
this buffer anymore. Moreover, in multiprocessor systems NW have time
to reuse buffer cookie for another buffer. Xen complained about this
and denied the new buffer registration. I have seen this issue while
running tests on iMX SoC.

So, this patch basically corrects that behavior by freeing the buffer
earlier, when handling RPC return from OP-TEE.

Signed-off-by: Volodymyr Babchuk <volodymyr_babchuk@epam.com>
---
 xen/arch/arm/tee/optee.c | 24 ++++++++++++++++++++----
 1 file changed, 20 insertions(+), 4 deletions(-)

diff --git a/xen/arch/arm/tee/optee.c b/xen/arch/arm/tee/optee.c
index 6a035355db..af19fc31f8 100644
--- a/xen/arch/arm/tee/optee.c
+++ b/xen/arch/arm/tee/optee.c
@@ -1099,6 +1099,26 @@ static int handle_rpc_return(struct optee_domain *ct=
x,
         if ( shm_rpc->xen_arg->cmd =3D=3D OPTEE_RPC_CMD_SHM_ALLOC )
             call->rpc_buffer_type =3D shm_rpc->xen_arg->params[0].u.value.=
a;
=20
+        /*
+         * OP-TEE signals that it frees the buffer that it requested
+         * before. This is the right for us to do the same.
+         */
+        if ( shm_rpc->xen_arg->cmd =3D=3D OPTEE_RPC_CMD_SHM_FREE )
+        {
+            uint64_t cookie =3D shm_rpc->xen_arg->params[0].u.value.b;
+
+            free_optee_shm_buf(ctx, cookie);
+
+            /*
+             * This should never happen. We have a bug either in the
+             * OP-TEE or in the mediator.
+             */
+            if ( call->rpc_data_cookie && call->rpc_data_cookie !=3D cooki=
e )
+                gprintk(XENLOG_ERR,
+                        "Saved RPC cookie does not corresponds to OP-TEE's=
 (%"PRIx64" !=3D %"PRIx64")\n",
+                        call->rpc_data_cookie, cookie);
+            call->rpc_data_cookie =3D 0;
+        }
         unmap_domain_page(shm_rpc->xen_arg);
     }
=20
@@ -1464,10 +1484,6 @@ static void handle_rpc_cmd(struct optee_domain *ctx,=
 struct cpu_user_regs *regs,
             }
             break;
         case OPTEE_RPC_CMD_SHM_FREE:
-            free_optee_shm_buf(ctx, shm_rpc->xen_arg->params[0].u.value.b)=
;
-            if ( call->rpc_data_cookie =3D=3D
-                 shm_rpc->xen_arg->params[0].u.value.b )
-                call->rpc_data_cookie =3D 0;
             break;
         default:
             break;
--=20
2.25.0

