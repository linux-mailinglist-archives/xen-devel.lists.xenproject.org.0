Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 37DF4533A79
	for <lists+xen-devel@lfdr.de>; Wed, 25 May 2022 12:13:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.337100.561605 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ntnzg-0000ZV-4h; Wed, 25 May 2022 10:11:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 337100.561605; Wed, 25 May 2022 10:11:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ntnzg-0000W3-0g; Wed, 25 May 2022 10:11:56 +0000
Received: by outflank-mailman (input) for mailman id 337100;
 Wed, 25 May 2022 10:11:54 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=P1TG=WB=citrix.com=prvs=137181a29=George.Dunlap@srs-se1.protection.inumbo.net>)
 id 1ntnze-0000Vx-CI
 for xen-devel@lists.xenproject.org; Wed, 25 May 2022 10:11:54 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1743abc8-dc13-11ec-837f-e5687231ffcc;
 Wed, 25 May 2022 12:11:51 +0200 (CEST)
Received: from mail-bn8nam12lp2168.outbound.protection.outlook.com (HELO
 NAM12-BN8-obe.outbound.protection.outlook.com) ([104.47.55.168])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 25 May 2022 06:11:45 -0400
Received: from CO1PR03MB5665.namprd03.prod.outlook.com (2603:10b6:303:94::6)
 by BLAPR03MB5572.namprd03.prod.outlook.com (2603:10b6:208:292::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5293.13; Wed, 25 May
 2022 10:11:43 +0000
Received: from CO1PR03MB5665.namprd03.prod.outlook.com
 ([fe80::1d9e:d2a0:5b4d:6374]) by CO1PR03MB5665.namprd03.prod.outlook.com
 ([fe80::1d9e:d2a0:5b4d:6374%2]) with mapi id 15.20.5293.013; Wed, 25 May 2022
 10:11:43 +0000
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
X-Inumbo-ID: 1743abc8-dc13-11ec-837f-e5687231ffcc
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1653473511;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:mime-version;
  bh=iQ+9ZYvrMVv0q3VmwDIkOlF738TxWHq4oav8OSQcZtE=;
  b=NFJ+YJHKyzneVKdXaSfAjk+9NhNBpCiEcNO+oK37KF7BXhdtVG4ItkRl
   SRw0EXd6fnvcCRxiMNSsbVaRTJGBvXHP9SQU9aOC2jU3/NgT165S+a4M+
   rZ46P8nsH0BzdOCc7dRqFjX7F7sT/LAzkQgbDJ5BSDxVThzXL81ln4z8P
   8=;
X-IronPort-RemoteIP: 104.47.55.168
X-IronPort-MID: 71499162
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:j/jlPKh7UkOBBv21QQLtrvZ2X1616BEKZh0ujC45NGQN5FlGYwSy9
 lOraxnFY6jUMyawOYxoOc7lxf41ycTSzd5qSgVtpHowFnsXpcTJXISSdRz6YS7Nd5WfFh42v
 swQY9fKd5psHnKBrEqma7S6p3cjiv7WS7H3Vb7IY3gZqWOIMMsEoUsLd7kR3t446TTAPz6wh
 D/SnyH+EAP8izIrPmhN4viK90hksav/5D5Ct1djOvsT4gGHziFPXc4Tfa2/ESD1E9JedgKYq
 0cv710bEkfxpUpF5gaNy+6jGqEyaueOe1DI0BK6YoD66vR4jnVaPp0TabxNMC+7tx3Tx4ork
 IgX6MTpIesUFvakdNo1AkEw/x5WZcWqyJefSZRomZXOp6FuWyKEL8RGVCnaD6VBkgpEKTgmG
 cgjACIMdni+a9eem9pXfAXOavMLd6EHNKtH0p1pIKqw4fwOGfgvSI2SjTNUMatZammj0p8ya
 uJAAQeDYigsbDUTYg1HKaoimtuwn3XxbCdmgQLKp4Eetj27IAxZiNABMfLzU/nTH4B/uBbdo
 WjLuWPkHhsdKdqTjyKf9W6hjfPOmiW9X58OELq/9bhhh1j7Km47UUVKEwfk56TkzBfgC7qzK
 GRNksYqhYc/81akQ5/RQhu8qWastR8AQdtAVeY97Wlhz4KLulrIVzFaFFatbvR+jYxvdAJ09
 mTYgoPjGjwzoOelZk20o+L8QTSafHJ9wXU5TS0OQBYB4tLjiJoulR+JRdFmeIalg9uwFTzuz
 jSiqCklm65VncMNz7+8/13Mn3SrvJehZgwo4gTaWEq14wU/Y5SqD6Sz8kTS5/tEKIefT3GCs
 WIClszY6/oBZbmSkASdTeNLG6umj8tpKxXZiF9rWpMnpzKk/if5eZgKuW8uYkB0LswDZDnlJ
 lfJvh9c74NSO33sarJrZ4W2CIIhyq2I+cnZa804p+FmOvBZHDJrNgk3DaJM9wgBSHQRrJw=
IronPort-HdrOrdr: A9a23:uvVQUqHptlpBa/sopLqFRJHXdLJyesId70hD6qkvc3Fom52j/f
 xGws5x6fatskdrZJkh8erwW5VoMkmsj6KdgLNhcItKOTOLhILGFvAE0WKP+Vzd8mjFh5ZgPM
 RbAuRD4b/LfD5HZK/BiWHWferIguP3iZxA7t2urUuFODsaD52ImD0JbzpzfHcXeCB2Qb4CUL
 aM7MtOoDStPV4NaN6gO3UDV+/f4/XWiZPPe3c9dlAawTjLqQntxK/xEhCe0BtbeShI260e/W
 /MlBG8zrm/ssu81gTX2wbontVrcZrau5t+7f63+4oowwbX+0OVjUNaKvm/VQUO0aKSAZAR4Z
 7xSlkbToJOAjjqDxyISFPWqnXdOXAVmjDfIBaj8AXeiN28SzQgB8Vbg4VFNhPf9ko7pdl5lL
 lGxmSDqvNsfFv9dLSU3am2a/hGrDvDnZMZq59bs5Wfa/ptVJZB6YgEuE9FGpYJGyz3rIghDe
 l1FcnZoPJba0mTYXzVtnRmhIXEZAV4Ij6WBkwZ/sCF2Tlfm350i0Me2cwEh38FsJYwUYNN6e
 jIOrlh0LtOUsgVZ6RgA/ppe7r9NkXdBRbXdG6CK1XuE68Kf3rLtp7s+b0woPqnfZQZpaFC76
 gpkGkowVLaV3ieefFmhqc7gywlaF/NLgjF24VZ+4VzvKH6Sf7iLTCDIWpe5vednw==
X-IronPort-AV: E=Sophos;i="5.91,250,1647316800"; 
   d="asc'?scan'208";a="71499162"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RBzB3X2g/mqYw+rcTTlrcKljR3CIH7zh11qmMFCL2TKMwj770uTYjSsWJbPgLSnSOU6OqPG4D7D4Tik+GS8cMDqHohGhXn+OM/lAz68/5dg7k9d5cn/j7Wj0y+PnavY/wK24TArpmBTiWa7BzJA/b3yvZEx//2wipLIvRq55N4jMpsXxFreXMsNvViGLpyigvywFOcFzstcwplRKhG470Frhyf8t/a1RcUhxlOWanaheiSiNw5NebpufEMwOJZZ4LQhm9KB50UQLdjTgLnAvd3QXWyIrL2ndwXZL4bUWXFhJGMd+QYKw+HE+W4qpCVrxEtN1rFmtfoQKYZwi3tfgQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=C1sMPRpRtdJlwn+FvFZMBvAovNRw+WBr4Wwzqhk1Xic=;
 b=J3FVHmbX69MbKmRlvhA7jUFpULAyzikawicOSTottVLzrC3KpjY0D62LWLHsIao9uUT+GfBGflJVI43kildjrXI46gveO0ElSq9+IHjkxY/ioXoesXkTFd6+ZGKIECjBF/iHzTqkXxT70yE1QNSsac4mpBJjQkmXNV6mUsa+fG03CSeJkwRkxiLPedXgl5nhYND8t6vGKMrTi/g6s+Cw/YRhwZEDohTijgnZesT2OY+pBX+9EI/QXUV+7qGSOTo20R6aBNBf/X8dsBtFkg7uoWutatzkGRkcHjUr9z187tpJK7TZaDAeBZ5kDCv5QYwVSRgj39wHU0ib8MjpgvOmrg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=C1sMPRpRtdJlwn+FvFZMBvAovNRw+WBr4Wwzqhk1Xic=;
 b=Z3uSUJRniAzdfCR8X+4eRYQ1zIv7wsT5DdgMY8UKelFso+2xqed1DlTfJdj9wRfLPQf1t64QCIOeccoe0ltO3+hN1UZhFSGg6h06OpupoLioTTKeKSPQJAhZY3zdGKLOpYy2+EHlWtygB+ytSD4N0nDRoQehmVAdi8oyqKaXGA0=
From: George Dunlap <George.Dunlap@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Andrew
 Cooper <Andrew.Cooper3@citrix.com>, Julien Grall <julien@xen.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH v2] SUPPORT.md: extend security support for x86 hosts to
 12 TiB of memory
Thread-Topic: [PATCH v2] SUPPORT.md: extend security support for x86 hosts to
 12 TiB of memory
Thread-Index: AQHYcBjWfPzTxGjMZkmAolCxhSaQOa0vX3IA
Date: Wed, 25 May 2022 10:11:42 +0000
Message-ID: <1958AF4F-8DF0-43BC-B31A-38C2A1835A78@citrix.com>
References: <5835df1e-8f92-79ce-94c5-1b5df9c9ff65@suse.com>
In-Reply-To: <5835df1e-8f92-79ce-94c5-1b5df9c9ff65@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3696.80.82.1.1)
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 8081ea24-5ccd-42f4-2a16-08da3e36f79c
x-ms-traffictypediagnostic: BLAPR03MB5572:EE_
x-microsoft-antispam-prvs:
 <BLAPR03MB55723EC0F67081CC6EE6F95B99D69@BLAPR03MB5572.namprd03.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 Mfyg9IbEaG/P710z+4dHMP1BO/P30wgxICMPaZgVuUgJDDGfoiDvJPBxOfheBLQ+z/TaSQfzmSEpWWa+w6d2PRcOLDbcQEW0PcHhnXflxOjdG8T51d9l5f7Yt8DHgfeGQKsQBaNgJVoZKdsgCSuXPX3rKBG3iOuLVq6cNuxr7IH7cCjJv57DQVPf/Dn3fvjs3N//kmZjuCUoPEvdOLbXoe/9B56NRoMzpFup7K5B8HDfvF8IauBJuTdfDq7IcNVaPqRjHbFY9kQooCkGP7CgSYqT8HQrpfLoyM53RIJWh8anQe7598dwu0Y6dKNyJ09NC4cfqRg9iwFSm4TFghoEKQLUjI3IsiYBELUUl1hCypMRjhhuZfUqFvCaJR6IO6b6YkFHmwHrNroJNKvxgwz0yBz5BWgYHXQE9x2y3zSanqTwW6Gw+3/4iOzmPdq/cifK1Nx7uQiTePJ8613i7Nabcl/Cj4eKig846ApeA0lI7xjhaRHeFUDgyWmgR16LOs/NTbuka1JuymAMDCz8w3ym/uONts89K0R7f4C8iYIiNGRBc56wYdCaeYoKa+2uNYxU6bM8Z3EyLvrC98Ha+AYQDxkrlMdQxjU2QXiF43ggbWLS47cm57QHQPCa2pJsE83O0YDklg6UxtQOMkZ73NN0n4CjvjmF0cG2W2OJYJVgnExh9/g4fvF71gC7U62G38PDQ+QWkM2H6sWBZdDtBdY9LWFHV+5vMmE50EzbDuTXWMufxDXmAmYCxm2i0LKbk6msXJEPWX5xEt7/J8te4ZSGA2zbsd0DAgb2gOd25PwWSCe+bRjh62PqygTefs9nTtstwi6FooU5p6TRe1MqS+r9nA==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR03MB5665.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(66446008)(66556008)(66946007)(64756008)(6512007)(26005)(6506007)(8676002)(66476007)(4744005)(15650500001)(76116006)(99936003)(91956017)(82960400001)(86362001)(71200400001)(508600001)(33656002)(5660300002)(83380400001)(6486002)(4326008)(966005)(122000001)(38100700002)(2906002)(316002)(8936002)(2616005)(38070700005)(36756003)(6916009)(53546011)(54906003)(186003)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?NEc1bWFPbEJxemNZOUI1Y2FsaldGbGVUUVJsQUl5dmxYT0RyS21sTlYzYXRT?=
 =?utf-8?B?ODJzMElwQWM3WWZMWDR1aE5lRlE3bS91VWZOaE80OGo3REV0am43RnhpUnl6?=
 =?utf-8?B?Nm1oRk5PRFF6NDZlTlVBNUVmSktwRndCc2xpRUxGOGRPNFAwM1l1YnBkQUsz?=
 =?utf-8?B?aUp5Qks1cVFyOHVVUXhzZHZDd09wNHNwV0VZTTN3WVNWRm1LT2cxaHM0eGVl?=
 =?utf-8?B?dWZGVklVY3lMcmw3RUN3OE1kVzlxTC9wRThXNys2a09DcVR5OWZxaTNZUmNG?=
 =?utf-8?B?eXpkR2E5eDQ3L3I1d0piNHBXY0NVV3lVcnRxZys3OVdkWWEyOGpXSWREWmxV?=
 =?utf-8?B?UDhGV0dDK2hoSjlwM0NQOXBKbHVlZVR4REJxSWN3NklpNG9BYzZ4d3pkbi9X?=
 =?utf-8?B?R25qcEY3dVNLNEM4bE8wQU5QSUM2Z0xtZDRvNktWcldFNlVvYnJXaWhPYTFo?=
 =?utf-8?B?RVBJU2dNSUJLVU9JNnBBZ0ZUZkJJTHYza2YxVlVERTlpR0tVTm84b2pSaitp?=
 =?utf-8?B?Z2U4YVU4Z2N3czlPanBQRmtWMHV2czdZUlhpaUtYdmlKclZHeHpVVitibG5w?=
 =?utf-8?B?RUxKTU5rdm9kd0RxbnBYS0lrK1pTWlRIR1BsckY4elAweFZZRm41NTFrRzN1?=
 =?utf-8?B?RE1EU21sc2ducncySUhPZHhmS0h2UTRlWVVYcW54bTh5eEIxQTQ5QjlZdFFq?=
 =?utf-8?B?VDEvOWxQdkRNcWhMNVVGWStqQk9OK3pESWh4Sk42ZGxncERreGs0c3RFYXFy?=
 =?utf-8?B?MGtPUFdmMG1IOXlTUGJSZFJmcnN1NjQzVjRkNGlwUWE3NG1MVDhjUkJlTnJL?=
 =?utf-8?B?ZEFhMlM4OExWNkdORVJwR2dMMnA2ekdPQzFLWXlrQW00bjl5Z1RqQ1ZQTFFq?=
 =?utf-8?B?TFphcVZFUTc4d0pFY2ZSYVZCdmRFbGNzZG9rR2lQcXBhNEVvbFJOamFHdkkx?=
 =?utf-8?B?VzVhZEoySlB3YXIxc3graTduelN0alArSWhXQ2EraGFYelgwUXFncmNSUVgw?=
 =?utf-8?B?ZnVsckw4RmNLbnI3a1RrMVhMcER5dUJzZTlwenl6QUI2U3BxSGc0MjlqbW1h?=
 =?utf-8?B?WlRBbVpCMS9PQTJudy9GR04wc01oMjZvaUZlY2x3WDRQUW1kVEtoenJJTDVS?=
 =?utf-8?B?VnlhYjRGZkV3K3JmVDlrN0ZPZ0ZXMmNSLzlDTHhxanhXbi91R1pVWTJWcHdy?=
 =?utf-8?B?c0dSTjFyRzd1T0sxQ3NWUk9TWjRjYVdWS25aTWx5OTM5VUd2K3BQK2V5dmJv?=
 =?utf-8?B?a3FYaHpLSFVhZU8vcHBiNXNKSExrZnBqQ2FOL0xCczJzNFQvclFXR09QT2ty?=
 =?utf-8?B?K0Q4ZFlnNUxiOWM3WndteFhaTHI0UFRyNUw4UXZ6T0JKcjg4TUp3Tk9CNzI0?=
 =?utf-8?B?UDRoQTI2SEZ2RTVzYjU2L3NUODZVVDlHMTN2UkVwb3V5cW1OdVVCaVlCOTdP?=
 =?utf-8?B?c0pKWHN1Zm9ndWpKNTF6VWpGS0h3bnpJUnQwRU1QdVloVkNFV2tQRTNTMVNL?=
 =?utf-8?B?ZGwzbzFUMzVIaDdFL1BIb0ZHcVp2a1QzeHFZMVE3VFhxR3RzQUNwVnlLa016?=
 =?utf-8?B?QVloakgwZk9tNDNvbi9keGZ1dmZWajBmVHFWMDhuTjhSTWRUWlN2aGZhUGht?=
 =?utf-8?B?ZW9NYTByTjJrWmE4WlNPZjVFbmxJdHpvWWl5TjIxSXZQUndqb0dxTWtNVDUr?=
 =?utf-8?B?bEY4NmhCQytZL3M2VGVrbmtWUFpoSzhvUUJFVGVTb05oMndnUjFqekZDcEhI?=
 =?utf-8?B?Zkd2djMwcVVZcmU5NTd6OWhhZVBXRzFJMzZCdkRRVDhPdVpTUUg4L2d6bExP?=
 =?utf-8?B?WE5WZVQ1SmRDdzZaZzNWeWJsKzJSaEY2SUtQcXV4YURqajBzNmczOG5KdTV3?=
 =?utf-8?B?ZFA4VVRWc20rdnVrRzJxYWptelE2dHFRRTVuQU9CN2RvUHlpaXNlWmlzMkpS?=
 =?utf-8?B?MjhJOGcrVXlkVXIyM3Q0Vi9HaDROVEVrZ3NpbEZSWkxCVVlEZ2VUT21YbkQw?=
 =?utf-8?B?VGNwaGRnYUZDQXBHczIvV1VYclVWZjVhQlhjTzRUekgvRmhPMDlNeUJZZWxB?=
 =?utf-8?B?MFlPbEwybGVMSHJBeXE4djBZaFhDRnc4dkFzMGJhN0xhWnBrcjAvdXo5L1Iv?=
 =?utf-8?B?cnhwc2tUMEFjZ2txYVNTL0NFb0VZOXdyc3QveFFCbzEwQkc4RG1HckdxekdS?=
 =?utf-8?B?TUtxaU1qNjVBTzNLSjlVeDFOdzVETFBpQ3IyWFpKcHJwcFBsUnBDaVBFUnkr?=
 =?utf-8?B?RnUrbW0yQXQ3aHBrSG5zYUhPejROL0JLU3RTRjFlemVNVEkxc05WU0ZvbEQ0?=
 =?utf-8?B?RXowdWJOZDRZc3ZqTVo4UkVQVHJzNDhjNnBLaS9RWUlKWllOdGVTLzhhWFl2?=
 =?utf-8?Q?oHC4F68Ox57zyLZI=3D?=
Content-Type: multipart/signed;
	boundary="Apple-Mail=_63A6192B-B54A-438A-B4E0-CDA5ABF4C499";
	protocol="application/pgp-signature";
	micalg=pgp-sha512
MIME-Version: 1.0
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO1PR03MB5665.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8081ea24-5ccd-42f4-2a16-08da3e36f79c
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 May 2022 10:11:42.9240
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: TjinqYdzw6x9yCipe1n5krNAUocuZneTyUg5r9UGR9EYOqGA/NX6B6sZ/1KGr18yxfiOWU+Nj6YbYvUVM1zozlpz2roTbh/oSNdt8HFKxb4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BLAPR03MB5572

--Apple-Mail=_63A6192B-B54A-438A-B4E0-CDA5ABF4C499
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=utf-8



> On May 25, 2022, at 10:21 AM, Jan Beulich <jbeulich@suse.com> wrote:
>=20
> c49ee0329ff3 ("SUPPORT.md: limit security support for hosts with very
> much memory"), as a result of XSA-385, restricted security support to
> 8 TiB of host memory. While subsequently further restricted for Arm,
> extend this to 12 TiB on x86, putting in place a guest restriction to
> 8 TiB (or yet less for Arm) in exchange.
>=20
> A 12 TiB x86 host was certified successfully for use with Xen 4.14 as
> per =
https://www.suse.com/nbswebapp/yesBulletin.jsp?bulletinNumber=3D150753.
> This in particular included running as many guests (2 TiB each) as
> possible in parallel, to actually prove that all the memory can be =
used
> like this. It may be relevant to note that the Optane memory there was
> used in memory-only mode, with DRAM acting as cache.
>=20
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

I haven=E2=80=99t been following the discussion, but the form &c LGTM:

Acked-by: George Dunlap <george.dunlap@citrix.com>


--Apple-Mail=_63A6192B-B54A-438A-B4E0-CDA5ABF4C499
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCgAdFiEEj3+7SZ4EDefWZFyCshXHp8eEG+0FAmKOANoACgkQshXHp8eE
G+1ElggAsYmdsZWPrxYtF/23LHtpQfN3CIx6kFHEfAbG2t14a4EwUuWzvL9TTM/X
SyT9UILMXxnThrtIIp7u6D3sqeVI9VcW+Q70fYAdC6k6K/8ILplVY5H55ERaxm5I
U4nTBkqnp8yXxfPshqy4JLcjElSgHf4IafN43aN4LyXs8jjnOQZybwFqGoVVsT2S
5X2mvHvreerg6KrTXp/FcKsyetov1pauvrqotp29GwRRw6vsoBeC4luvR9buIDco
O5TtUALooPAM54PbgRSoN5drXqI679fPYqvnK6t7N2IQS+znp1TUsn4mU/2hKDVm
rR0f2NQOBqZzoX7GIHvx3CR0C82YmA==
=VNR3
-----END PGP SIGNATURE-----

--Apple-Mail=_63A6192B-B54A-438A-B4E0-CDA5ABF4C499--

