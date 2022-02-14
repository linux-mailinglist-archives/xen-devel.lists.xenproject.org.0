Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F23004B4940
	for <lists+xen-devel@lfdr.de>; Mon, 14 Feb 2022 11:35:20 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.271390.465810 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nJYhF-0000J9-LU; Mon, 14 Feb 2022 10:35:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 271390.465810; Mon, 14 Feb 2022 10:35:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nJYhF-0000Fu-Hz; Mon, 14 Feb 2022 10:35:05 +0000
Received: by outflank-mailman (input) for mailman id 271390;
 Mon, 14 Feb 2022 10:35:03 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=HcNt=S5=citrix.com=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1nJYhD-00009q-GR
 for xen-devel@lists.xenproject.org; Mon, 14 Feb 2022 10:35:03 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c2ba31f5-8d81-11ec-8eb8-a37418f5ba1a;
 Mon, 14 Feb 2022 11:35:02 +0100 (CET)
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
X-Inumbo-ID: c2ba31f5-8d81-11ec-8eb8-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1644834902;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=QFE2DIl/Ie7gzfnmO+D9RWOr4Uik6UQDTVuD/Xn5gDI=;
  b=J2Wv85NHzUE1/m9TwL3yhnWftWosoxveKnScrc8aiZdJ/Okpvf2VvTHY
   MYhSKm+f/l9rFOeSt5wdInqvnMB0gL9FSsBIyO1YToV/xWACHThZkyPtv
   uuQXUF4Ty0bwob4fESM1XgHUubMis0PwvGQ2ftppdNCerh7r1cYN/AoRl
   M=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: UiOY1U4cqR3t7qoW2qN6joT9BJhhKYaXTl05ZBUzhsP8uK1r8dOcy4eFq+bw2oUw2pJRALq5i8
 nudI64AeWUwU2xkVQ+lPh8pDXWwhqBVMQJHJJAjIryaIQaLhKSXQVJMQS3/Ax4i9MJRbAqrMlN
 v4tUxIquLLqtRGEGBWSnk0I4FEzcfqxeYXJBiolXlgNuussSwD46ZJDxGW4zCv8li4m8/pn3Vc
 JM/oEIM513laFIqEWElfNyoGdqcKbGxYmkUCkjChbd57baWGWhmq8fYpcluc98MaXni7WWBIiP
 2sKTC/sRl8iyvbusxTA/z2r5
X-SBRS: 5.1
X-MesageID: 66366182
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:aAp+eKPRl7Th4nLvrR1lkMFynXyQoLVcMsEvi/4bfWQNrUp01TxRy
 WNMDDiHMq6Pa2T2f9t3PIzk8EoHsMTcmoI3Ggto+SlhQUwRpJueD7x1DKtR0wB+jCHnZBg6h
 ynLQoCYdKjYdpJYz/uUGuCJQUNUjMlkfZKhTr6UUsxNbVU8En1500s/w7dRbrNA2rBVPSvc4
 bsenOWHULOV82Yc3rU8sv/rRLtH5ZweiRtA1rAMTakjUGz2zhH5OKk3N6CpR0YUd6EPdgKMq
 0Qv+5nilo/R109F5tpICd8XeGVSKlLZFVDmZna7x8FOK/WNz8A/+v9TCRYSVatYow2Xxu5vw
 9VGjtufYygLHZXqu7kmaTANRkmSPYUekFPGCX22sMjVxEzaaXr8hf5pCSnaP6VBpLwxWzsXs
 6VFdnZdNXhvhMrvqF6/YsBqit4uM4/AO4QHt2s75TrYEewnUdbIRKCiCdpwgmlr2J4XTay2i
 8wxcDFjYSXbbg9zPUYaN6sgh7aEhGbZfGgNwL6SjfVuuDWCpOBr65D9PdyQdtGUSMF9mkeDu
 nmA72n/GgsdNtGU1XyC6H3Eru3FkD7/WYkSPKal7fMsi1qWrlH/EzVPCwH9+6PgzBfjBZQPc
 CT45xbCs4AK6hWVUNL9VCb/j1SrnD0kffkNKNcTvVTlJrXv3y6VAW0NTzhkYdMgtdMrSTFC6
 mJlj+8FFhQ07uTLFCv1GqO86GrrZHNLdTNqiTosEFNdi+QPtr3fmf4mojxLNKeuxuP4Fjjrq
 9xhhHhv3u5D5SLnOkjSwLwmv95OjsWTJuLWzl+ONo5A0u+eTNT7D7FEEXCBsZ59wH+xFzFtR
 kQslcmE9/wpBpqQjiGLS+hlNOj3u6raYG2B3AY2RMNJG9GRF5mLJ9443d2DDB0xbpZslcHBP
 Cc/Rj+9FLcMZSD3PMebkqq6CtgwzLiIKDgWfqu8Uza6WbAoLFXv1Hg3PSa4hjmx+GBxwfBXE
 crKKq6EUCdFYZmLORLrHo/xJ5dwnXtgrY4SLLimpymaPU22OiLLF+dfbQfmgyJQxPrsnTg5O
 u13bqOi4x5eTPf/cm/Q94sSJkoNNn81Gdb9rMk/SwJJClM2cI34I/OOk74nZaJ/mKFZyrXB8
 n2nAxcKw1vjn3zXbw6Nbyk7Or/oWJ9+q1M9PDAtYgn0iyRyP9734fdNbYYzcJkm6Pdnkax+Q
 c4adpjSGf9IUDnGpWgQNMGvsIx4eR23rguSJC75MiMndpttSlWRqN/pdwfi7gcUCS+zuZdsq
 rGszFqDE5ECWx5jHIDdb/f2lwG9un0UmeRTWUrUI4YMJBWwodYycyGo1605OcABLxnH1wC27
 QfODEdKv/TJrq807MLN2fKOobC2HrYsBUFdBWTas+q7bHGI4mq5zIZce++UZjSBBnjs8aCva
 OgJnfHxNPoLwARDv4ZmSus5yKs/453kpqNAzxQiF3LONgz5BrRlK3iA/M9OqqwSmeMJ5VroA
 hqCqotAJLGEGML5C1pAdgMqY9OK2ewQhjSPv+8+J1/35XMv8beKOamI08JgVMCJwGNJDb4Y
IronPort-HdrOrdr: A9a23:bIaJEql3zEx8/kPytZNyAKLqOn/pDfOIimdD5ihNYBxZY6Wkfp
 +V88jzhCWZtN9OYhwdcIi7SdS9qXO1z+8R3WGIVY3SEjUOy1HYUL2KirGSggEIeheOudK1sJ
 0PT0EQMqyIMbEXt7eY3OD8Kadb/DDlytHpuQ699QYUcegCUcgJhG0ZajpzUHcGPzWubaBJTq
 Z0jfA3wwZIDE5nCPhTcUN1ONQryee79q7OUFojPVoK+QOOhTSn5PrRCB6DxCoTVDtJ3PML7X
 XFuxaR3NThj9iLjjvnk0PD5ZVfn9XsjvFZAtaXt8QTIjLwzi61eYVaXaGYtjxdmpDs1L9qqq
 iIn/4TBbU115rjRBDynfIr4Xi47N8a0Q6n9bZfuwq6nSW2fkNgNyMLv/MnTvKQ0TtfgDg76t
 MX44vRjesmMfuL9h6NluTgRlVkkFG5rmEllvNWh3tDUZEGYLsUtoAH+lhJea1wVh4SxbpXWN
 WGNvusr8q+sGnqG0zxry1q2pihT34zFhCJTgwLvdGUySFfmDR8w1EDzMISk38c/NZlIqM0q9
 jsI+BtjvVDX8UWZaVyCKMIRta2EHXERVbJPHiJKVrqGakbMzbGqoLx4r8y+Oa2EaZ4gacaid
 DEShdVpGQyc0XhBYmH24BK6AnERCGnUTHk2qhlltFEU33HNczW2AG4OSITevqb0oIi65fgKo
 WO0bptcoreEVc=
X-IronPort-AV: E=Sophos;i="5.88,367,1635220800"; 
   d="scan'208";a="66366182"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QxcrzXsZSLS+tF6nxynWsZeP/UrFZCP2tfHJt+QeKEWSgGUQGPtoKDt5VQMXTodpEbCu+l3QntsAK6Zsixjd+iRbiV9wbejVBI7/EcBMv7qHEypLA9hXakuK27nc0QtKj7IYfHf+gPD2QAIXV3Zql8i46IV69ZGNLnV9fDpXSptkBPvTRA/rqjK7mLLdYmwOz/qSq/ORzZ6B7g5dsjsgBplqVlsTUxz9v4MGzwc6Bw1B7xrAV5jJT7kRkmEkzfbqxsmn5TauDwdLz0HupNupDPLGUZnTbrJ0YaO7j3IhARGTUGHDt11xF8sB+k+Fn2twzD0pam2zrcQbJxdusBiBYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QFE2DIl/Ie7gzfnmO+D9RWOr4Uik6UQDTVuD/Xn5gDI=;
 b=kaACbmOXJCTk9pB6S0cZN3ftmDDUehYhl9lHw5RS41brZCE53K+ZIqXQ8Ht/cziCPdUyU7Mg1TvaysRqEYuc/SSEGMCOYSZK+cLTj7fhYn4z8xqdh3PzDyBrthQgMEXKo5ljgygNqUTH2wSQG1voPr6j/iCYvzJb0VPtcs90tR1ca3ZVuunDqLAkBKrGnA/t4btk5KJeCBbUSay8i+/eRaYTyOr3/NiZasysGJoeWMD41xfhJGD6pgWlk4ib1jOVBMRd+WE3lgDLDt9tlpKwj0IUW5Tu3ivsVlFyPb7057hjCkr87t7d0v9py/OzzaolNajHSAivfzH2w71EUXdG7w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QFE2DIl/Ie7gzfnmO+D9RWOr4Uik6UQDTVuD/Xn5gDI=;
 b=oXNosxhKs8astVZXIk4eZn6iA/sB2L4hliXVu37ScYhSG+8dddakp2DtsgBPL5fUlnuPj8bQ/5HvgdHoHTxLvITwWQAL5U/sgOrm41lk7stm02XMxC/08/yIgaobClvrW2EsrYtEJfI+CZI41m74NInL19yU956pp+zvhSxO6EM=
From: Andrew Cooper <Andrew.Cooper3@citrix.com>
To: Jan Beulich <jbeulich@suse.com>, Andrew Cooper <Andrew.Cooper3@citrix.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	"Anthony Perard" <anthony.perard@citrix.com>
Subject: Re: tools backports
Thread-Topic: tools backports
Thread-Index: AQHYIYxOf3hnmEAHzECVq7GqiCZgPKyS1kwAgAAC8oCAAACrAA==
Date: Mon, 14 Feb 2022 10:34:54 +0000
Message-ID: <d806c100-0f11-fd2c-db7a-9806d936154a@citrix.com>
References: <710fd687-16d5-c088-d3be-749851e6eab3@suse.com>
 <6f3157af-6ab7-ae67-0080-48754d41c19f@citrix.com>
 <7a71b56d-1f28-e0df-c89e-6fb69ff64dcd@suse.com>
In-Reply-To: <7a71b56d-1f28-e0df-c89e-6fb69ff64dcd@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.0
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: c5d59cc2-8bfd-4fa4-f111-08d9efa5a3f1
x-ms-traffictypediagnostic: SJ0PR03MB5439:EE_
x-microsoft-antispam-prvs: <SJ0PR03MB5439E5AF9FA99C4A20A011CBBA339@SJ0PR03MB5439.namprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: q43xaR5uVwvmCBXpINzXbykSsbv/qTXf8oi7gbnGyLjBj5c2FieSToFjtkM+oZb315EcOrSiA1eksWt693iyBTr//j7h6vgmaIIGgPezg0d0SotTm6k/42qIhHakLsYjBGIqcSSMDm/wtZhBXLgyzthEK0MoIl3dIuf0tVv4g2lCDyuZRo/FL7106PCOI9bSquK9ETKXLfCM+A5xjDqRXhoMGPVjDUSEQ0ls5uic6ATGM8JSm85/JqxiBPZvqa4Jhkt5O+1AHpn+QNI052TWAziw/dfDccH3Uz8mY+HMQdbQ2eKWrZntixvDK4P246mJUr0m/NK9XhGRyO6WBa6Ah/piBOq1HXMQ6GheJNYYKZmJBlPqqe98NfsATpPPjsWvl3gTdFnh8AndpXmOt7M2afHZQgoP3j2AOg01M1lkIFcbfIEhObO+Naf0k8lJ2d2gwF/CJ88+OAmKV6uMKwVuCXOcpXd+ar6cGSZpDYaY45vBbJNMS8A7cWW8J3YFjxY0auSOByEvykW2vBnIWCU0CEfapwl4LgLQKhA5l4oV0Euki2W0gdgC2yaVWwNnMjnPff3ry4NpGPfaq4vr2oDyPZPYz42REEu+qLeEQgAoQ4VoE1sg34UkjUgC7es6Vl1O7tf6wDdVfv6099rRkNjIXBNVqa9NB7EYskF8Wl4IFDgU4Sbljt1pSmJal48M0VXpF3bsJyeZ6ZeSScpHKSDMpkQ4kRKWcz00pU3ftfY8AHAPqZfPfZDx3xC7NE8wHIOrKRdLDuUddJIxa3LxDaK0jw==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(26005)(91956017)(186003)(82960400001)(122000001)(31686004)(71200400001)(2616005)(38070700005)(5660300002)(6506007)(6512007)(107886003)(64756008)(36756003)(38100700002)(54906003)(4744005)(316002)(66476007)(76116006)(66446008)(66946007)(4326008)(66556008)(8676002)(31696002)(2906002)(86362001)(110136005)(508600001)(6486002)(8936002)(7116003)(53546011)(3480700007)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?UXdFWGJaVTdVaUx6N1NHWlNYd3dZNS85aE9wRHdIK0Q0SDk4Ym9PSjF4OWhE?=
 =?utf-8?B?dnJxKzhJeHJsVkIwbVVta0poUG5CenVNbjlrbkJBWnlVTEpOOFhnNHRacVZS?=
 =?utf-8?B?RHBjdmRFMk8vSFQvdCtNUllYZjN3S3JDNTNPUjEweWpyR1hxRGVLZVJDU05v?=
 =?utf-8?B?VEFOeGtRNzFIa29nT0g4Nk9EMkRza0FlVkRWemNsWllIMlJoU2FEVEtUWUZ2?=
 =?utf-8?B?QVJka0E4bngrNDkrUWsveU1nMElkTzYwMnJmZ1NJZkZWRTN0aEZ0ZGVpbU45?=
 =?utf-8?B?ZHA1eDhQWHVMSXdZa0hFb0lpRjVEeVhWbnZCNFRUY083d2lnbDZIQnI2OU5I?=
 =?utf-8?B?alRjVVJZV0p4WncwYStRNG9KYkMwa0poWTFGUjA3dk1CTmI3SWw1aExrTG43?=
 =?utf-8?B?aUsxSDlXNFFsYkxRVnhqNFVDSUlCOUIzQi9DR0Nneit3WXVCVHpxcnpXSHRN?=
 =?utf-8?B?Q2tVdlhVanpCTTZQcFRYQW5BMHNzUXgvejJjR0FwRkxrL09tUnl4MW9sWGFB?=
 =?utf-8?B?TlZsQkU2N0c1ZG5BcWZMR1FrbVlydkhKdEVzQ21zQUFQZnZuNEZhQy9rUk5Q?=
 =?utf-8?B?d3ZFeE0ydFQ5Tk4yTVhGSDBFNnhYRi9UY0VoOHlvbnRkRFhIUVoyT0hzYkIx?=
 =?utf-8?B?LzVFZlpBTzVPU243MmZtSWZSUjA2WFF5MnZlMXVobmVCZG1YV3Y1UXNwa0F6?=
 =?utf-8?B?UDhmMDVWTzgxN2dnQXI2S242QnlZN1lTZk9mUjBnV1JmZFJEeDc3L2JMTFJI?=
 =?utf-8?B?ZzYzcDdIYW81ejJPMWxrQTlRWnJFdWs1WEJlV2hFSUVtWWpWSlQ1Qm8zd2Zw?=
 =?utf-8?B?RXE5cmxXUXk2WnpleDlDV1lvYk5ZUWNvTVUxdENmVml5UEVGdU9EamVwT0h2?=
 =?utf-8?B?YnpUbEtKMG5RL0QwS3kwbTNxbHZER0RyclBxSEQyZEVLY1BqM1l0TG51UXlQ?=
 =?utf-8?B?ckQ2OHBGcjhLcUQyNitRZEdRdnI3b0NZYjJ1RUhnSXAwZDNJbUdwS1FxbThz?=
 =?utf-8?B?d2YwS1psYnc1b0dtSEhzdHViNkJ4d3JKcVphSjRCc2Rrd1dhRkNaWVN4V2tl?=
 =?utf-8?B?N2dPeFVqbnVlWm1lZy91b2JKaXhCSWw0a01sQjAvSWFkd1FPc29SZk1uUTBL?=
 =?utf-8?B?eHg2VnRiV0czU1ZyUkJmUUMyNFp3WjRMcVd4RFdlOUVvZ2tGU2VseFg1ZmZn?=
 =?utf-8?B?U2kzbkRveWZDVmxOaW5waWhGZjNCd3JDa1VHRFRXamJRcGVlRmtDL3p3Uyt0?=
 =?utf-8?B?VnlTejNOVnN1L0thUUNuRnNNQ1ZOUE5yNkNMSE1hYi91ZkNNd1VGL3RPOUQ0?=
 =?utf-8?B?eFRjN2ZvZEtQenZCMldTdG5JR1JVM2QzQUNzTkFhMW4wZm4rNlRGVnpUYTFY?=
 =?utf-8?B?VGd2VXJubzB1Zm5xMTJVQmZUYTAycE5hME5sSkg2c0p6TlVvNHd4NXpSMDg5?=
 =?utf-8?B?R0hEaFBlbFplT2NUVytGZ1VycDdiano4aDVXdEg0dit5Q0ZsQkxhOUxOSzZW?=
 =?utf-8?B?d1MxYm40cTE1bEpFNUxrNWJBem8xT2hFMUVHVkdocEUybHQ2bnFac09lRlJC?=
 =?utf-8?B?b2xVRnFWOS9XNnFEQXM2MEtIblkvWE9GZTVZWlBQTW5WZjJ2OTJCK1VGb1p4?=
 =?utf-8?B?cENweWZDSm9wZEhaRUxLZ1oxR3FPS2dob0pSY2xoMkJEa0RFUXh6ZGhUTm00?=
 =?utf-8?B?M2VsZmVjN1pTU2RpNUxnbXBUUEJ2S3l1Vy9yWklLaCtVcXFkWTVlancwQjNK?=
 =?utf-8?B?UGk5emwvZE9xU3F4YkNyS1hUYjFZS2tOTG10aGFxUmZxRXBRL1lnSDZNYnRh?=
 =?utf-8?B?dlpuWVpQcjNnU3ZGMElIZFpZNGN1Skp1TEQ2bHBnRkZRUmdFa2JzVFN1QXZG?=
 =?utf-8?B?MWdSMW1TbXE0aXp0ME9rSGRadFhaNDV3aC81TFQvb0hCRGZZaU15SzM1UGFP?=
 =?utf-8?B?SVIrVVl1U2kxMGZSWUZFVmplbGdxc3VkUE5KbEx3R0VJN2ljQ0t5Q1dFTVNi?=
 =?utf-8?B?OEtMaFM5Sk9oMEZQWGNidEhOZFU1QmYrb2FmN1oycGR5Y2NmcklBRFdRV3M3?=
 =?utf-8?B?TXE5MlZyaWRvV0JlaDV1VnlpWDdSbVNEdXUyUDZ2NXNseVBmZ3BFRkdzR3Q4?=
 =?utf-8?B?M0N6NVhIRUdUaVNTa1VXOFh6YlNocE9zQnZxTGN0V2ZNSmZtcW1GMWNiZWpk?=
 =?utf-8?B?cmw1VzlWWVc3RkVrcHMvM2hyZTBqWk00MkdhY0l1aHlMQ3FkUFR0VEdxeVlQ?=
 =?utf-8?B?MTlXbWdxWTNYL3FNOHZKZWRaQmVBPT0=?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <4F7A51CCCC28FE418F7DB0D112D00DEF@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c5d59cc2-8bfd-4fa4-f111-08d9efa5a3f1
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Feb 2022 10:34:54.8195
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: CjqXeAcoorUmpfpJiBzrhED4ym7hj7CAPLJQ1MhdyIt28FtrcjHATYPCRwoNEJufahtrwM2ClixvjS7os7YKutK8PyWMYDRhNFOn0Ru/ZK4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB5439
X-OriginatorOrg: citrix.com

T24gMTQvMDIvMjAyMiAxMDozMiwgSmFuIEJldWxpY2ggd3JvdGU6DQo+IE9uIDE0LjAyLjIwMjIg
MTE6MjEsIEFuZHJldyBDb29wZXIgd3JvdGU6DQo+PiBPbiAxNC8wMi8yMDIyIDEwOjE4LCBKYW4g
QmV1bGljaCB3cm90ZToNCj4+PiBJIGhhdmUgYSBjb3VwbGUgb2Ygc2ltcGxlIHRvb2wgc3RhY2sg
YmFja3BvcnRzIHF1ZXVlZCwgd2hpY2ggLSB3aXRoIHlvdXINCj4+PiBhZ3JlZW1lbnQgLSBJIHdv
dWxkIHdhbnQgdG8gcHV0IG9udG8gdGhlIHN0YWJsZSB0cmVlIHdoZW5ldmVyIEkgZ2V0DQo+Pj4g
YXJvdW5kIHRvIGFwcGx5aW5nIHRoZSBuZXh0IGJhdGNoIG9mIGJhY2twb3J0czoNCj4+Pg0KPj4+
IGQ5ZDM0OTZlODE3YSB0b29scy9saWJzL2xpZ2h0OiBkb24ndCB0b3VjaCBucl92Y3B1c19vdXQg
aWYgbGlzdGluZyB2Y3B1cyBhbmQgcmV0dXJuaW5nIE5VTEwNCj4+PiBlNjJjYzI5ZjliNmMgdG9v
bHMvbGliczogRml4IGJ1aWxkIGRlcGVuZGVuY2llcw0KPj4+DQo+Pj4gRm9yIDQuMTUgYWRkaXRp
b25hbGx5DQo+Pj4NCj4+PiBkZDZjMDYyYTdhNGEgdG9vbHMvbGlieGw6IENvcnJlY3RseSBhbGln
biB0aGUgQUNQSSB0YWJsZXMNCj4+IGM3NmNmYWRhMWNmYWQwICJ0b29scy9saWJhY3BpOiBVc2Ug
NjQtYnl0ZSBhbGlnbm1lbnQgZm9yIEZBQ1MiIHRvbywNCj4+IHdoaWNoIHdhcyB0aGUgdW5kZXJs
eWluZyBidWcuDQo+IFdlbGwsIHllcywgdGhhdCBvbmUgaXMgYWxyZWFkeSBpbiA0LjE1LjIuDQoN
Ck9vcHMuwqAgSSB0eXBvJ2QgbXkgYGdpdCBsb2dgIGNvbW1hbmQgdG8gc2VlIHdoZXRoZXIgaXQg
d2FzIHByZXNlbnQgb3Igbm90Lg0KDQpTb3JyeSBmb3IgdGhlIG5vaXNlLg0KDQp+QW5kcmV3DQo=

