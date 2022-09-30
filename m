Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 849F05F0A0B
	for <lists+xen-devel@lfdr.de>; Fri, 30 Sep 2022 13:25:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.414160.658292 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oeE8y-00071H-57; Fri, 30 Sep 2022 11:25:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 414160.658292; Fri, 30 Sep 2022 11:25:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oeE8y-0006yi-1n; Fri, 30 Sep 2022 11:25:24 +0000
Received: by outflank-mailman (input) for mailman id 414160;
 Fri, 30 Sep 2022 11:25:23 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=7LLR=2B=citrix.com=prvs=265fc461d=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1oeE8x-0006ya-3M
 for xen-devel@lists.xenproject.org; Fri, 30 Sep 2022 11:25:23 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8f3ae2b6-40b2-11ed-964a-05401a9f4f97;
 Fri, 30 Sep 2022 13:25:20 +0200 (CEST)
Received: from mail-sn1anam02lp2042.outbound.protection.outlook.com (HELO
 NAM02-SN1-obe.outbound.protection.outlook.com) ([104.47.57.42])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 30 Sep 2022 07:25:15 -0400
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by MW4PR03MB6652.namprd03.prod.outlook.com (2603:10b6:303:12f::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5676.23; Fri, 30 Sep
 2022 11:25:12 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::988c:c9e4:ce0d:b37c]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::988c:c9e4:ce0d:b37c%4]) with mapi id 15.20.5676.023; Fri, 30 Sep 2022
 11:25:12 +0000
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
X-Inumbo-ID: 8f3ae2b6-40b2-11ed-964a-05401a9f4f97
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1664537120;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=u4hVsaWZGVndS8Y965KFmTSBHmyhvKBwGtz1v68xNPI=;
  b=gufcfH8MRt17lAaH4Mc+CpFU31FRXjNNbrnzXZ3f29gs6cxnCUhLgSLv
   pW+ZSfPxfsC/ArYSkKlDxMUJG1JGhUYUQTEJdG2quiku1OJd4F/bbcTUc
   lojo13MaRZrMNz/gnsSpzgxTqF0kmaW9iO7Vp+ExLSNGA902oFrRlILd5
   0=;
X-IronPort-RemoteIP: 104.47.57.42
X-IronPort-MID: 81687832
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:URCcv6JRctZ/BbC/FE+RKJQlxSXFcZb7ZxGr2PjKsXjdYENS0GBTy
 2QZDDuFbq6MYzSkedEgbN7loU0BupLWx9QxTAtlqX01Q3x08seUXt7xwmUcnc+xBpaaEB84t
 ZV2hv3odp1coqr0/0/1WlTZhSAgk/vOHtIQMcacUghpXwhoVSw9vhxqnu89k+ZAjMOwRgiAo
 rsemeWGULOe82MyYzl8B56r8ks15qyj42tA5DTSWNgQ1LPgvyhNZH4gDfnZw0vQGuF8AuO8T
 uDf+7C1lkuxE8AFU47Nfh7TKyXmc5aKVeS8oiM+t5uK23CukhcawKcjXMfwXG8M49m/c3Kd/
 /0W3XC4YV9B0qQhA43xWTEAe811FfUuFLMqvRFTGCFcpqHLWyKE/hlgMK05FbEY+71NEV1fz
 OJGBA8ITiK9renx5q3uH4GAhux7RCXqFKU2nyk6iAr/VLMhS52FRLjW79hF2jt2ntpJAfvVe
 8seb3xocQjEZBpMfFwQDfrSns/x3iW5L2Ie9Q3T+fBfD2v7lWSd1JDENtbPd8PMbsJShkuC/
 UrN/njjAwFcP9uaodaA2iL12L+QzXihMG4UPJO+z/wpvm+i/GIaMRZGaGCl4um7smfrDrqzL
 GRRoELCt5Ma9kamU938VB2Qu2Ofs1gXXN84O/037kSBx7TZ5y6dB3MYVXhRZdo+rsg0SDc2k
 FiTkLvBByFrsbCTYWKQ8PGTtzzaETMOMWYIaCsATA0Ey9ruuoc+ilTIVNkLOLGxps34H3f32
 T/ihCQzgrQ7jMgV1r6691TKnzKtoJfSSgc/oA7QWwqNzg5/fp/jWIWu5nDS9/MGJ4GcJmRtp
 1ABksmaqfsIVJiLnSnVGuEVRun1vbCCLSHWhkNpE9857TOx9nW/fIdWpjZjOENuNcVCcjjsC
 KPOhT5sCFZoFCPCRcdKj0iZV6zGEYCI+QzZa83p
IronPort-HdrOrdr: A9a23:vKA4cKBWNE4nq8TlHegPsceALOsnbusQ8zAXPh9KJCC9I/bzqy
 nxpp8mPEfP+U0ssHFJo6HiBEEZKUmsuKKdkrNhR4tKOzOW9FdATbsSp7cKpgeNJ8SQzJ876U
 4NSclD4ZjLfCBHZKXBkUaF+rQbsb+6GcmT7I+woUuFDzsaEp2IhD0JaDpzZ3cGIDWucqBJca
 Z0iPAmmxOQPVAsKuirDHgMWObO4/fRkoj9XBIADxk7rCGTkDKB8tfBYlml9yZbdwkK7aYp8G
 DDnQC8zL6kqeuHxhjV0HKWx4hKmeHm1sBICKW3+4gow3TX+0WVjbZaKvi/VQMO0aWSAZER4Z
 7xSiIbToZOArXqDyeISFXWqlDdOX0VmgLfIBej8AfeSIrCNXwH4oN69PxkmlGy0TtegPhslK
 1MxG6XrJxREFfJmzn8/cHBU1VwmlOzumdKq59bs5Vza/poVFZql/1owGpFVJMbWC7q4oEuF+
 djSMna+fZNaFufK3TUpHNmztCgVmk6Wk7ueDlIhuWFlzxN2HxpxUoRw8IS2n8G6ZImUpFBo+
 DJKL5hmr1CRtIfKah9GOACS82qDXGle2OFDEuCZVD8UK0XMXPErJD6pL0z+eGxYZQNiIA/nZ
 zQOWkowVLau3iefPFm8Kc7gSwlGl/NLAgF4vsul6RRq/n7WKfhNzGFRRQnj9agys9vcPHmZw
 ==
X-IronPort-AV: E=Sophos;i="5.93,358,1654574400"; 
   d="scan'208";a="81687832"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OEFbQJUMhGBdYvcCteJ35gkzmXv8PrG6K/E5KXW02LHmGd0q0OCvphW63A1hSjFmnjEPFW7vBGgW+I0+WVvUbAcmbgeZXvWp4d5I1GVwR1ReAqrVMb0hE5SO5hoHQsTXC4e5NYdZXjswWn/I5eDt7EaU39xHV5R9zvM2ryFt3OOYRaEJ+f/VkmqIvrCzF9NU/EVUvkMok7Hq0fVpuc1G77XlK/+306hQfJfvmg+MNIT3DLlT5dOd3LTssJIP0r03j3j0oE5I4ugSmseoj2LIuCUC5zBIktEOEp1HWv4bvd3q23sk1d4GMndMPkXkmgT510VY+McRGSWhkkXyY26P+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=u4hVsaWZGVndS8Y965KFmTSBHmyhvKBwGtz1v68xNPI=;
 b=HM1/n8b7ERoUsdoc5PJKJchUpzGPxk2cZzU2cKPBgwKRC/Q4JixvT4iRnnKrZlOOuevSkq9l2jDDgfV6IipHE9f3X1Jfi+vRY/mH8sgGrCovHCY5X6ZJmq9gv5puBE4U8bIoPr0y9adUx6rhnBWae5UaIxui3l2ruKkD8aOQQ7IBOp8XoUSUWIEQOr45r/31v7GlnzmH7F3Qhw1c9N8amkKxWNL9gMk7npiSW1R/zI+h2x6Ke/+SQnHYZotfUFhv4mp8PsQ0pLqFPhImLwH3KW+gvhqfhkdwv8wOgheDntvl/ZMsJp0m84lE2A0imvCzuBRhDpoRPY0bPuJE/Fg/mg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=u4hVsaWZGVndS8Y965KFmTSBHmyhvKBwGtz1v68xNPI=;
 b=WTWNJF3qogOKiEt1ItlmDUfslOlHrjNpHNXaVOB2PsSPx2ZVvh1jSfPxQLNS2iBScaCHjyB1If4XNKEq4RANrBUrMojoRopaWPPO2NYmKTB5Mejdw4iditJzm/9phIshbl8E8tTRZhgD5RmF28TWzdZeGzYFEe89XeTrYg6XbgI=
From: Andrew Cooper <Andrew.Cooper3@citrix.com>
To: Jan Beulich <jbeulich@suse.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: George Dunlap <George.Dunlap@citrix.com>, Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>, Roger Pau
 Monne <roger.pau@citrix.com>, Demi Marie Obenour
	<demi@invisiblethingslab.com>, Henry Wang <Henry.Wang@arm.com>
Subject: Re: [PATCH for-4.17?] x86: support data operand independent timing
 mode
Thread-Topic: [PATCH for-4.17?] x86: support data operand independent timing
 mode
Thread-Index: AQHYyOqg1ICCMP96kUmBwLmrDRKGKa337MYA
Date: Fri, 30 Sep 2022 11:25:12 +0000
Message-ID: <8f07c532-e742-fa02-27ee-b08c56299d09@citrix.com>
References: <f793ef22-54d4-a74e-b01b-4ebca58b2abd@suse.com>
In-Reply-To: <f793ef22-54d4-a74e-b01b-4ebca58b2abd@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BYAPR03MB3623:EE_|MW4PR03MB6652:EE_
x-ms-office365-filtering-correlation-id: 6735e46b-4c60-4b31-d800-08daa2d670c1
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 P/LSBn8/rFYm51gbItN6+teEfdCqkpWQosWT274YoZZn2n7f6DWUFfyGDQLOvy0CqosSJfoBxyPwXO43+QFkCU6dmsXErx6lZ/QZJ7CAFvSk1jzNBZsU+A+xbTrs7aAzZxaYNcuTjK6TXGZLrNxnq0O2PGv38C54Y6zES0K8tcoVUJgtF8KhJS6N6Pj12tIi35CmIFWSuCSAKaOVMPyieYCDsxuqQu5jVhPZds91nFhbuo/U40RInoxNQCiR5edvbFhtXW2h0DtDYQw5dldBYgOq8LpKhcIVKi+tfKXxC1T2mkLgSBWmRV7oglXuNDXTzzldxaUN7SwTUKY1mpNK7fsB5lC65718E6uCr/wBtOBha5VGGReSr3CQkV7USWzwfZgzGezp+dpYZiP6ZFKFOE+eRVSaryJdVAPp6D0LBy1L/qB2fif1p9/9OxAmfmCN2sZ8ZdoLOYCTtK8PRtnyNA32BS3wPABcJAT18+FomLoAAZ+Tp68E6oYPHHaoBQfsFVpANe/sJGltYLsqKGT65rugqmcDxC4XzmMQJiIsnYjfz1pQ8gsffr/qdXFzaT8oh1MHiciN+gwH+G+nHlmIX1HSGU2+t9SsDxo18+KXwvmZ9yhNuEHnh3hZGlQhryWPE9Zfi568oYxMLJl4wr1emZTFBfOwJeTOIrePCjIPdf4KaINVg+Tm924lGlYMqFILBWhVy6Xnysvohjkilf+O2DsPFqI/qsX3f+XrKEqia5RJHMQscICHegKK7Pw5QsG0UnZxd+DoLjapCfY0bgUbvdomM0ZuH7elM1WA0DvKcd3IU2VD+a2mPBXDIchGRTLBVB9hKaak3usYNVTO69IgPAL0Yhgp3YgUSV/yrF1uTVU=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(396003)(376002)(346002)(136003)(366004)(39860400002)(451199015)(66476007)(41300700001)(83380400001)(82960400001)(8676002)(66446008)(66946007)(64756008)(76116006)(66556008)(91956017)(4326008)(5660300002)(36756003)(8936002)(38070700005)(71200400001)(53546011)(6506007)(31696002)(186003)(6512007)(26005)(966005)(6486002)(478600001)(86362001)(2616005)(316002)(31686004)(122000001)(38100700002)(2906002)(110136005)(54906003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?YmFVd3FHQTlpbW9sR29PYnZMRE40REIxMUdLZzB0NkljZFI3dytCY3llODlw?=
 =?utf-8?B?QUk3cGdRUHplc2xOMnorUVVzdUVVc2RVMVBIWjA4NEE1Lzg3MzNnSXVUT0ZP?=
 =?utf-8?B?bGVqZG90RnYrc213U205SEc4YmJzZDFNOTRDaXJucks3V3Rjb1BLKzhzcjgv?=
 =?utf-8?B?SytDY1lWa3RKM0JJc21KNHVwK1ZaUEYzL0JHeStWYVZQVEpGRlVSeG5ya3VK?=
 =?utf-8?B?SmsvTFFmWWtnSC83NjlITVRxN1RheWczZFhaWFFpZVd3OUF4b0xqd0lVOXEw?=
 =?utf-8?B?b2xtcGFtVklITnpBUE55Nk5ub29EbUVna3RwY1dVWXQ5WmJndEZ2WFg5T1Yw?=
 =?utf-8?B?M09hMkJ6b1FzQi90WjZUa3JaMjY1NzlUcFRXcHNaVjRpcVZ1Mk5EdW9oL05x?=
 =?utf-8?B?bFJvMWY0Zlh0b2Q0ZllBNUZjeVFDU2lISnZUMXF4Mm9qT2RhZ0JwVzdscWtu?=
 =?utf-8?B?dXlMN0FFZHhpUFM3OFhsN3VhU3hVcDJzVzB2dnh1K0FieWhGQkVhU0VEQ1lj?=
 =?utf-8?B?Q1pvV2dpd0hEdjIwQTNaVkxzaUoxYW9NV294MFplMk0zdlZYNTZNY2RCdjcv?=
 =?utf-8?B?ajlQNjYxd1oyYXdqRytJcVNlOTdwS3U0WVl5OStaKy83NFA1aDZEbG5qSXV6?=
 =?utf-8?B?SHpwMTA1a2ZsT2dMa1ZrdDg3N2tBcWg4Ui9xS25Db0NEUHpWUFh2SW9rd05C?=
 =?utf-8?B?WVVQbHFJZkFPcW5ocUxISGtwaFlzQXEyQlcwSUFaaXNZWEFnc2RhaG9RSzB4?=
 =?utf-8?B?YiszNUlMaGxRaUFUV3h6cGJkUkJncm53T3VYb1JXOStNRFA3enFFc0pTbDNq?=
 =?utf-8?B?Y0NoREFNRU9jbkJyTk51S3QwWFpoUkNEVUxkcVhQdHhaRHFxdmRqTm9Jc3FS?=
 =?utf-8?B?d3BPNjFuQVF6VVptbnJsK0QzK092emxjdml2a0NoMFlnYzFaejkyMmw4SVR6?=
 =?utf-8?B?d1Jsd0hNQkl0M1ovVVExdjcrRnh2WGhKS05pVHBST3lOSWtHZzd4SmhCdzVB?=
 =?utf-8?B?K2I3d0FNcC9Ddm5mQnJGbU5CZXZJbFovY0h5VDdHYWxtdy90WWNuc2g5NjRo?=
 =?utf-8?B?K0lSSlcrbUJGNjh0UUp1eHMxUGgyU1NUMVRWYks3MUYvcmdaTTYyMmIwVU9B?=
 =?utf-8?B?WTQ1YjZsZElabEdFcTlKTHVORUxjTktFL2VtVms1WExLY1NRSVEwQUNqZlNU?=
 =?utf-8?B?RFhMblpHeFp2MTZLR3dJV0hlNkxtOXQ4UWhJRlpRVDJHcE16TEhWZW1SWHpj?=
 =?utf-8?B?d1JibzE1SEhkODFlbDNwOUl1dGtBSFVLMnRmekVXSnFrSDI3d1MvSHIvZ2kx?=
 =?utf-8?B?M0RRRDF3S1BrdVBFMmcwQm9GUEFZaFJWamZzRmdVb0pRcnBOL25UVnBEdXp3?=
 =?utf-8?B?OHRLZnRwaGpTUGNuWjBCZTQ4dW5kSHh0TE9nazE2WXROTm1NdmlwMlBMWjBq?=
 =?utf-8?B?eGVkRy9PRXZYUlVtUlVCd3VmRTNBUzY3dEs5UkVzRlVFUXN4T1pPaDdnNUU0?=
 =?utf-8?B?STd1L0prb2pIdERaY3lXWU1FcGVuQ09XZzZDWVJlY1Roam15SW44b1NvRGpU?=
 =?utf-8?B?VGtSUTRRY05OYndXeXhMS2NnLzMwdzdBVXJOUkc3V3R0aHROLytVSnF2SzFO?=
 =?utf-8?B?YldBemxPN0JzU0J1T3BYekhPK3YzSFQrNjZYWFdscUx0UlpXclE3TjVxOEZn?=
 =?utf-8?B?cWlrbTI0VzB3VE1IcDJiOTVJaEJVczdXVWFaSTFtaFFBMnBNL25vNXQ4VVBt?=
 =?utf-8?B?YktiRitLUE5jK0JRVW1FUjVzMGlXNk50TDhlWWJaOXJkcUljRDdYRjJtSFVD?=
 =?utf-8?B?ZEJVQmRYbUprNGZwSk9ZbzgzWE10MUwySENLTmgrSEZRSVVQem9pUnhPM0c3?=
 =?utf-8?B?RWJNQ0xpT0o4K3UzalBTcCtLbDdrYzJiWG0yZkhWQ2R1dnE4TnJqNHl6N3kw?=
 =?utf-8?B?V054cTZTaU5nd2dkZzdraFJRRDkvTHMxK1Z5YWEwR251eXd0cThReGVmTmt2?=
 =?utf-8?B?Tm4vTGdvdEE3eC9pdks5R2JRekNsQ1h1WDVQN3RkaWpCOU9CYjVUbTdyVlh3?=
 =?utf-8?B?SkhsRG5mRVlnZkZBelNpMHYyTUxrRWYzTTR6aFlqQkZnWlFNL3lGdGZlV1Ez?=
 =?utf-8?Q?SbWANKgIm6zOCJI7jTcyf4VY0?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <6F2F245944539E4FB19CA548858A3EBD@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6735e46b-4c60-4b31-d800-08daa2d670c1
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Sep 2022 11:25:12.4486
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 07bEuQpQEXJP1pr7hqmcEgB4Q1ofbgPOBXwo1zstkTU2q8g0ctxs/Rup9MXnM0yZEPhrtezmsXfdo4KuHLJFHM2PxY+5HoJI0YUNZ8yEn3o=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR03MB6652

T24gMTUvMDkvMjAyMiAxMTowNCwgSmFuIEJldWxpY2ggd3JvdGU6DQo+IFsxXSBzcGVjaWZpZXMg
YSBsb25nIGxpc3Qgb2YgaW5zdHJ1Y3Rpb25zIHdoaWNoIGFyZSBpbnRlbmRlZCB0byBleGhpYml0
DQo+IHRpbWluZyBiZWhhdmlvciBpbmRlcGVuZGVudCBvZiB0aGUgZGF0YSB0aGV5IG9wZXJhdGUg
b24uIE9uIGNlcnRhaW4NCj4gaGFyZHdhcmUgdGhpcyBpbmRlcGVuZGVuY2UgaXMgb3B0aW9uYWws
IGNvbnRyb2xsZWQgYnkgYSBiaXQgaW4gYSBuZXcNCj4gTVNSLiBQcm92aWRlIGEgY29tbWFuZCBs
aW5lIG9wdGlvbiB0byBjb250cm9sIHRoZSBtb2RlIFhlbiBhbmQgaXRzDQo+IGd1ZXN0cyBhcmUg
dG8gb3BlcmF0ZSBpbiwgd2l0aCBhIGJ1aWxkIHRpbWUgY29udHJvbCBvdmVyIHRoZSBkZWZhdWx0
Lg0KPiBMb25nZXIgdGVybSB3ZSBtYXkgd2FudCB0byBhbGxvdyBndWVzdHMgdG8gY29udHJvbCB0
aGlzLg0KPg0KPiBTaW5jZSBBcm02NCBzdXBwb3NlZGx5IGFsc28gaGFzIHN1Y2ggYSBjb250cm9s
LCBwdXQgY29tbWFuZCBsaW5lIG9wdGlvbg0KPiBhbmQgS2NvbmZpZyBjb250cm9sIGluIGNvbW1v
biBmaWxlcy4NCj4NCj4gWzFdIGh0dHBzOi8vd3d3LmludGVsLmNvbS9jb250ZW50L3d3dy91cy9l
bi9kZXZlbG9wZXIvYXJ0aWNsZXMvdGVjaG5pY2FsL3NvZnR3YXJlLXNlY3VyaXR5LWd1aWRhbmNl
L2Jlc3QtcHJhY3RpY2VzL2RhdGEtb3BlcmFuZC1pbmRlcGVuZGVudC10aW1pbmctaXNhLWd1aWRh
bmNlLmh0bWwNCj4NCj4gUmVxdWVzdGVkLWJ5OiBEZW1pIE1hcmllIE9iZW5vdXIgPGRlbWlAaW52
aXNpYmxldGhpbmdzbGFiLmNvbT4NCj4gU2lnbmVkLW9mZi1ieTogSmFuIEJldWxpY2ggPGpiZXVs
aWNoQHN1c2UuY29tPg0KDQpUaGlzIHBhdGNoIHNob3VsZCBub3QgYmUgdGFrZW47IGF0IGxlYXN0
IG5vdCBpbiB0aGlzIGZvcm0uwqAgVGhlIHdob2xlDQpET0lUTSBpbmZyYXN0cnVjdHVyZSBpcyBj
dXJyZW50bHkgdW5kZXIgYXJndW1lbnQsIGZvciBiZWluZyBpbXBvc3NpYmxlDQp0byB1c2UgYXBw
cm9wcmlhdGVseS4NCg0KSSB1bmRlcnN0YW5kIHdoeSBRdWJlcyB3YW50IHRoaXMgYmxhbmtldCBz
ZXQsIGJ1dCBpdCBpcyBhIHN0ZWVwIHBlbmFsdHkNCnRvIHBheTvCoCBJdCdzIG9ubHkgY29kZSB3
aGljaCBpcyBhbHJlYWR5IHdyaXR0ZW4gdHJ5aW5nIHRvIGJlIGNvbnN0YW50DQp0aW1lL2NhY2hl
IHdoaWNoIGdhaW5zIGFueSBzZWN1cml0eSBmcm9tIHRoaXMuwqAgT24gY3VycmVudCBwYXJ0cywg
dXNpbmcNClNTQkQgaGFzIHRoZSBzYW1lIGJlaGF2aW91ciwgYnV0IHRoaXMgaXNuJ3QgZXhwZWN0
ZWQgdG8gcmVtYWluIHRydWUgaW4NCnRoZSBmdXR1cmUuDQoNCkZvcmNpbmcgaXQgb24gYmVoaW5k
IHRoZSBiYWNrIG9mIGEgVk0gaXMgbXV0dWFsbHkgZXhjbHVzaXZlIHdpdGgNCmVudW1lcmF0aW5n
IGl0IGZvciBWTXMgdG8gdXNlIGF0IHNvbWUgcG9pbnQgaW4gdGhlIGZ1dHVyZSB3aGVuIHdlIGhh
dmUNCnRoZSBjYXBhYmlsaXR5IHRvLsKgIGkuZS4gc3BlY2lmaWNhbGx5LCB5b3UgYXJlIG5vdCBh
YmxlIHRvIG1haW50YWluIHRoZQ0KQUJJL0FQSSBpbiB0aGlzIHBhdGNoIGluIHRoZSBmdXR1cmUu
DQoNCklmIHdlIGRvIG1vdmUgZm9yd2FyZCB3aXRoIHNvbWV0aGluZyBsaWtlIHRoaXMgKHVuZGVy
IHRoZSBzdHJpY3QNCnVuZGVyc3RhbmRpbmcgdGhhdCB0aGUgYmVoYXZpb3VyIGlzIGdvaW5nIHRv
IGNoYW5nZSBpbiB0aGUgZnV0dXJlKSwgdGhlbg0KIkRJVCIgaXMgdG9vIHNob3J0IG9mIGFuIGFj
cm9ueW0gdG8gdXNlLsKgIEFtb25nc3Qgb3RoZXIgdGhpbmdzLCBpdCdzIG5vdA0KImRhdGEgaW5k
ZXBlbmRlbnQgdGltaW5nIjsgaXQncyAiY29udHJvbHMgZm9yIGZvcmNpbmcgLi4uIiB3aGljaCBp
cw0KaW1wb3J0YW50IGJlY2F1c2UgdGhlc2UgYXJlIGdvaW5nIHRvIGJlIHZlbmRvciBzcGVjaWZp
YywgaWYgZXZlbiBuZWVkZWQNCmluIHRoZSBmaXJzdCBwbGFjZS4NCg0KfkFuZHJldw0K

