Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D2C00201E0F
	for <lists+xen-devel@lfdr.de>; Sat, 20 Jun 2020 00:34:36 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jmPaK-0007Td-Qv; Fri, 19 Jun 2020 22:34:08 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=8bIi=AA=epam.com=volodymyr_babchuk@srs-us1.protection.inumbo.net>)
 id 1jmPaJ-0007TH-BI
 for xen-devel@lists.xenproject.org; Fri, 19 Jun 2020 22:34:07 +0000
X-Inumbo-ID: f9b03fd2-b27c-11ea-bc14-12813bfff9fa
Received: from EUR02-VE1-obe.outbound.protection.outlook.com (unknown
 [40.107.2.83]) by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id f9b03fd2-b27c-11ea-bc14-12813bfff9fa;
 Fri, 19 Jun 2020 22:34:02 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FffT4ONo8ifhOx0OsH2Oz/aFSP5LVsam3uNimhGBZg/gj68iaLXeu8E8tcPde3ZpLEbKp6nIQLnMAiSYWkxon5GfmdibTcEqNJOq7MJXORr6VqP+yfHB1zzhU0Hsi2uh0cDDxiTDpbkp1RJtphwezWOVBXOWEHL9vPEecK8X/4XyA6sp62Cf1wuhuN1mkqCmJDw05kWx1m4eeDbIuqfo+hE96Vbb+Rxts3wdFknE8t3fK8QkeQb4VvnHYCz4z4TKM6eAZxZLdZjbiKGBWGqbw0TT9FTlhyV0+Lk2W7+fZWurMlwPH9+IqbgwLG8YRIbDXgGjegpKcVOGX5RYkoGmxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0bdpwoLHFQMj1SYEBKXuxitCU7+h+os+vfddbprIScE=;
 b=hT70BpSTY4HGqZOzVDEuJj6zz/mafoFzW0egH+TjxeGXPXA7yjF2KpvWOpwqChZz7fMg/imUgwZJYLBMh4l7jTFO7X8XbiniN8BbD5uS8L5kwyMBfQSPGqW/n7CSdcMRRAMNmSnQNs/Lbgg3hNXZ8zcOuO070ciyrlgurjHF3XJPD+n6sYr1NBHIrLH0JCWH9gtV07W88HlKYR7JIuG6gaZ/gLkdNpvVkVl1cuisohTQVgaRRZYIigBIOV5VvYubzIcszmY3+SUQ9xc0NmyBJa77vWeGS6XqqUchfnVwqjG33sBf8ZMMefsUq9QNf0AASWnW66zAI9wyO6dpF/zZCw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0bdpwoLHFQMj1SYEBKXuxitCU7+h+os+vfddbprIScE=;
 b=r2aHDYPsYhEMiNpOd++hgNSxzRXe6+0bQ476ggWh1jVfmOak+k5s9Eu85GkccDgL+kxfKqHnCnGor/0l6ZWajYa3OjyTLWN4g5Aa891ma4cl2W8lGkNYNyyuC60LQQblKzfKF9q9lEWwauPVVZ6IPUzRi+0EmUYGuheBhRZlzvdSlBzqh0aOkiV3OcAfSBB2OzHMDtYikkltoMIEvwaiPnUN6ePSf2ZLQ029LcI4XCOGjVzHZuelm1YIT1E4J3tnaSa9na/qT3cLfY4snm0HiunX2GsM+axDRaTrSE5Fhp2NlZHaZpjVVGfEKjTt3HpKZW8j8Y2nzgHOZIADZWixeA==
Received: from VI1PR03MB2926.eurprd03.prod.outlook.com (2603:10a6:802:35::28)
 by VI1PR03MB6304.eurprd03.prod.outlook.com (2603:10a6:800:136::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3109.21; Fri, 19 Jun
 2020 22:34:00 +0000
Received: from VI1PR03MB2926.eurprd03.prod.outlook.com
 ([fe80::95fd:55d9:421b:1f37]) by VI1PR03MB2926.eurprd03.prod.outlook.com
 ([fe80::95fd:55d9:421b:1f37%7]) with mapi id 15.20.3109.023; Fri, 19 Jun 2020
 22:34:00 +0000
From: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
To: "pdurrant@amazon.com" <pdurrant@amazon.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: [PATCH v2 1/2] optee: immediately free buffers that are released by
 OP-TEE
Thread-Topic: [PATCH v2 1/2] optee: immediately free buffers that are released
 by OP-TEE
Thread-Index: AQHWRom6MCrom+3VqUO0pBfpeyeOQA==
Date: Fri, 19 Jun 2020 22:33:59 +0000
Message-ID: <20200619223332.438344-2-volodymyr_babchuk@epam.com>
References: <20200619223332.438344-1-volodymyr_babchuk@epam.com>
In-Reply-To: <20200619223332.438344-1-volodymyr_babchuk@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: amazon.com; dkim=none (message not signed)
 header.d=none;amazon.com; dmarc=none action=none header.from=epam.com;
x-originating-ip: [176.36.48.175]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: e9a766f3-029b-4244-9a6b-08d814a0dc96
x-ms-traffictypediagnostic: VI1PR03MB6304:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <VI1PR03MB63047ECD096E730C0A24C190E6980@VI1PR03MB6304.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-forefront-prvs: 0439571D1D
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 3s00kgvd36aXVnXNv1pM4WjPlnjq6KbaB6WUF1EjThKZU+WNp40rkVFpMGBlRvPGNDVte75ke+kgoXUzTFkoZ/laYfRH4rkI0IJsrwF8S0QTqTo/m7nGFZltmcUwtmFrg+ylbYRd35jwZRcHIjkB60fUyeypqvc23ALzgTeS3pexZ2uqCbTfznlIJCZdKbd4FXZ/pS8OnsDYlTbhOoaRRUmrZg+KDe3HyLQ7loMrUw5SVlPCKWuNNczCoJAEyDS/LXs6jag/yWiqVB5GscGiHRb5Pbs6nMOTRfbhsJzI4qNEGfAQDsk06W6X0BKOH4+oTNLha6mZo6GqKmxa67yrQqrW3sSIFaqOvaoCc/DYAbYurJMpNavZJHxOCOwq3OQF
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR03MB2926.eurprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(4636009)(376002)(396003)(366004)(39860400002)(346002)(136003)(66946007)(66476007)(76116006)(91956017)(66556008)(64756008)(86362001)(5660300002)(66446008)(2616005)(4326008)(36756003)(6486002)(478600001)(71200400001)(2906002)(316002)(1076003)(186003)(54906003)(55236004)(8936002)(26005)(6506007)(110136005)(8676002)(83380400001)(6512007)(14773001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: wxR7DXmKoBz8ZTNhFTMn6dPuhxfcsBdN3lIwI/bHb5vKI+u5CQH8ks/3TDCBXy6hCWoc9Zi0wD7ne5imNWWrhKZdzGXsE5jvezMOFMh1o5uD0ZzZ0H2hvBtLZf2gEjYCarOF36sFKrzfjHKJ6RNHxofdYB+pyBQBwqziGM8RPykbfO+PH0PJQAxKMKrRkDp0S9LjlurGXyqsEFTKEuRzCAodnmli394rqdjU8/BmDbHJloa4fbJ2YZW6sm9Zxe1QiYqj3E/r5+3SMwRfpLbAFyM0MzVsza5Hog47qFK42LJwNCW+RlHH0YI2U3yz9jH6MVF4lxv/R0l2xfBtQMAGz/d6AVwCTej9BIwZPjjWojXPubIG+GVBbJHA+/gI15SVEd51XtinbYs90/mQ5cxFlOet1+jfKMumB3HNjdixry804nSlkZF6pRolSYQwX+n6ej+w+ukbbmeGpvkcb72HyzZeSIn3Ohz9sljS9rTd2MQ=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e9a766f3-029b-4244-9a6b-08d814a0dc96
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Jun 2020 22:33:59.9476 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: CSacZWdHnbH+p/pSxWQ6//OPfg7wUXmXw7Cfwm3R5H22nZl4Jv3aCnMS7t2XHWAQ2FpPNlvU3quzwRWVz0EEa9OOfmloRmHznVIu32yZYuU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR03MB6304
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
Cc: Julien Grall <julien@xen.org>,
 "op-tee@lists.trustedfirmware.org" <op-tee@lists.trustedfirmware.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Stefano Stabellini <sstabellini@kernel.org>
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

Changes from v1:
 - reworded the comments
 - added WARN() for a case when OP-TEE wants to release not the
   buffer it requeset to allocate durint this call

---
 xen/arch/arm/tee/optee.c | 32 ++++++++++++++++++++++++++++----
 1 file changed, 28 insertions(+), 4 deletions(-)

diff --git a/xen/arch/arm/tee/optee.c b/xen/arch/arm/tee/optee.c
index 6a035355db..6963238056 100644
--- a/xen/arch/arm/tee/optee.c
+++ b/xen/arch/arm/tee/optee.c
@@ -1099,6 +1099,34 @@ static int handle_rpc_return(struct optee_domain *ct=
x,
         if ( shm_rpc->xen_arg->cmd =3D=3D OPTEE_RPC_CMD_SHM_ALLOC )
             call->rpc_buffer_type =3D shm_rpc->xen_arg->params[0].u.value.=
a;
=20
+        /*
+         * OP-TEE is signalling that it has freed the buffer that it
+         * requested before. This is the right time for us to do the
+         * same.
+         */
+        if ( shm_rpc->xen_arg->cmd =3D=3D OPTEE_RPC_CMD_SHM_FREE )
+        {
+            uint64_t cookie =3D shm_rpc->xen_arg->params[0].u.value.b;
+
+            free_optee_shm_buf(ctx, cookie);
+
+            /*
+             * OP-TEE asks to free buffer, but this is not the same
+             * buffer we previously allocated for it. While nothing
+             * prevents OP-TEE from asking this, it is the strange
+             * situation. This may or may not be caused by a bug in
+             * OP-TEE or mediator. But is better to print warning.
+             */
+            if ( call->rpc_data_cookie && call->rpc_data_cookie !=3D cooki=
e )
+            {
+                gprintk(XENLOG_ERR,
+                        "Saved RPC cookie does not corresponds to OP-TEE's=
 (%"PRIx64" !=3D %"PRIx64")\n",
+                        call->rpc_data_cookie, cookie);
+
+                WARN();
+            }
+            call->rpc_data_cookie =3D 0;
+        }
         unmap_domain_page(shm_rpc->xen_arg);
     }
=20
@@ -1464,10 +1492,6 @@ static void handle_rpc_cmd(struct optee_domain *ctx,=
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
2.26.2

