Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B629D4C1C67
	for <lists+xen-devel@lfdr.de>; Wed, 23 Feb 2022 20:38:38 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.277778.474609 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nMxSu-00005n-Ak; Wed, 23 Feb 2022 19:38:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 277778.474609; Wed, 23 Feb 2022 19:38:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nMxSu-0008UI-7W; Wed, 23 Feb 2022 19:38:20 +0000
Received: by outflank-mailman (input) for mailman id 277778;
 Wed, 23 Feb 2022 19:38:18 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=PMTg=TG=citrix.com=prvs=046033a78=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1nMxSs-0008UC-Bo
 for xen-devel@lists.xenproject.org; Wed, 23 Feb 2022 19:38:18 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 24cf2dae-94e0-11ec-8eb8-a37418f5ba1a;
 Wed, 23 Feb 2022 20:38:16 +0100 (CET)
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
X-Inumbo-ID: 24cf2dae-94e0-11ec-8eb8-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1645645096;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=OsNSTOAFzRvtTZXg+Ac4XNrjMuDp1cbY+Z5tYgitLv4=;
  b=QD1pRo2+zE/Hd7FSh4fr1t4eW7b1lqziTWMjxRd3NdDbjIcoO4cVs3/1
   i3cqNSOFOjeci69Cu5HL0PgQpbc5nb/h/cDL4O6IcwaGWpEpnn/vCgqn+
   L1f1vPRJdQz5uGMls52yzmmFMAB2wJwovyFtbE2amPVPhdR1tN0DhCgjb
   k=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
X-SBRS: 5.1
X-MesageID: 64849239
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:qHT7la/lwAab0UsfnDREDrUDnn6TJUtcMsCJ2f8bNWPcYEJGY0x3y
 jAZXGyDPvjfYzHwfo8ibty09h5UvpaBnIdlTVNpryo8E34SpcT7XtnIdU2Y0wF+jyHgoOCLy
 +1EN7Es+ehtFie0Si+Fa+Sn9T8mvU2xbuKU5NTsY0idfic5Dndx4f5fs7Rh2NQw24LiW1nlV
 e7a+KUzBnf0g1aYDUpMg06zgEsHUCPa4W5wUvQWPJinjXeG/5UnJMt3yZKZdhMUdrJ8DO+iL
 9sv+Znilo/vE7XBPfv++lrzWhVirrc/pmFigFIOM0SpqkAqSiDfTs/XnRfTAKtao2zhojx/9
 DlCnaawe1obGof1o7siXEBbNgd4foBhwrCSdBBTseTLp6HHW37lwvEoB0AqJ4wIvO1wBAmi9
 9RBdmpLNErawbvrnvTrEYGAhex6RCXvFKoZtmtt0nfyCvE+TIqYa67L+cVZzHE7gcUm8fP2O
 ZZJNWs1N0WojxtnHA8uOr4Vv8GRmyfNVAN/gluKnrhn7D2GpOB2+Oe0a4eEEjCQfu1XkVyRo
 mbu9mHwEBYccteYzFKt4n+qw+PCgy7/cIYTD6GjsO5nhkWJwW4eAwFQUkG0ydG7l0q/VtR3O
 0ESvC00osAPGFeDF4enGUfi+Tjd40BaC4E4//AGBB+l8KrmvjS9LFE/EQFOMd8Dksl1aBsQ2
 Qrc9z/2PgBHvLqQQHOb076bqzKuJCQYRVM/iT84oRgtuIe6/txq5v7bZpM6SfPu0IWpcd3l6
 23S9EADa6MvYdnnPklR1XTOmHqSq5fAVWbZDS2HDzv+vmuViGNIDrFECGQ3D94ddO51rXHb5
 RDofvRyCshUUflhcwTXHY0w8EmBvartDdElqQcH82Md3zqs4WW/Wotb/StzIkxkWu5dJ2O0P
 RKN4VMLuMADVJdPUUORS9jtYyjN5fK9fekJq9iONoYeCnSPXFXvEN5Sib64gDm2zRlEfVAXM
 paHa8e8ZUv2+ow8pAdas9w1iOdxrghnnDu7bcmik3yPjOrPDFbIGOxtGAbfMYgEAFas/Vy9H
 yB3bJDRlX2ykYTWP0HqzGLkBQpUdSNiXciu8aS6tIere2JbJY3oMNeIqZsJcI15haVF0ODO+
 3C2QEhDz1Tjw3bALG23hrpLNdsDgb4XQaoHABER
IronPort-HdrOrdr: A9a23:CQndjKk1BmQF8JH05TtBfNYgYuTpDfOCimdD5ihNYBxZY6Wkfp
 +V88jzhCWZtN9OYhwdcIi7SdS9qXO1z+8R3WGIVY3SEzUOy1HYUL2KirGSjQEIeheOutK1sJ
 0PT0EQMqyIMbEXt7eY3OD8Kadb/DDlytHouQ699QYUcegCUcgJhG0ZajpzUHcGPzWubaBJT6
 Z0jfA3wwZIDE5nCPhTcUN1ONQryee79q7OUFojPVoK+QOOhTSn5PrRCB6DxCoTVDtJ3PML7X
 XFuxaR3NTij9iLjjvnk0PD5ZVfn9XsjvFZAtaXt8QTIjLwzi61eYVaXaGYtjxdmpDt1L9qqq
 iPn/4TBbU215rjRBDznfIr4Xin7N8a0Q6m9bZfuwq7nSW2fkNjNyMLv/MnTvKQ0TtfgDg76t
 MQ44vRjesmMfuL9h6NluTgRlVkkFG5rmEllvNWh3tDUZEGYLsUtoAH+lhJea1wVx4SxbpXWd
 WGNvusrMq+sGnqG0zxry1q2pihT34zFhCJTgwLvdGUySFfmDR8w1EDzMISk38c/NZlIqM0qt
 jsI+BtjvVDX8UWZaVyCKMIRta2EHXERVbJPHiJKVrqGakbMzbGqoLx4r8y+Oa2EaZ4hqcaid
 DEShdVpGQyc0XhBYmH24BK6AnERCGnUTHk2qhllu5EU33HNc3W2AG4OSITepGb0oYi6+XgKo
 OOBK4=
X-IronPort-AV: E=Sophos;i="5.88,391,1635220800"; 
   d="scan'208";a="64849239"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PiPvpQ1sZUOjAvX7RrzmCzhcjT7bFe+hjustFkG5Xi0aVHMsJ8usdINU0WsC1EyweoD2USHbqYYzxUWTLNP50SLDO1Sac5g1/LBErWG84dW8Gyt59R73pm+WOl4H2Xbdp3/L5MJ6hh0h8cQclZ0dFdqR5o1vrcUEhr4ZJdHbfP9VJuGtwlKDMsybHXQVHH6z5wQlL5Ny3dyUYnzGeuP+1AbjeNup1BF5hYNdCAR/w0UWgmNbkApTlekqJYEi0kVuFlA9g+SKX1nKcCRO5k5Unv/g9ZTEc4lTbXb0fPjyaLkXVwJM3wRewYuP8+IzzLyiid73SJWEmzB+xSbllfhHdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OsNSTOAFzRvtTZXg+Ac4XNrjMuDp1cbY+Z5tYgitLv4=;
 b=jr+nwk6DMpimgIRhqYAEBGh3hUDHrsMdegCiNwuIMljf+npcO1aSs9GJxRaceWP0Tq6T48bK0yPkCUV+BCINnJutSpyXE2VsAlo8M0omKnWJSAFBgw9XRYDJGuC8MJ60dzoHNr6AIrzCe7sIBpkSK+rl7KTd6voF2pKhS6NzcBbq0tTjI9EGCEiNBPuu2/jJgmuBzaqOOT5oEP3t+tB2QVsm66dAFQ/MuFUUv6cJQX9mUEH/6AI89mxoXSnpTefVT2IsSaKR4bnqB1mgizJ8naS5G0pnAiJQDclveLWV5r05s9Nxu628TI9Kqd8UvIEJUX9VcqO8ZwB70dJEMpu0Ug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OsNSTOAFzRvtTZXg+Ac4XNrjMuDp1cbY+Z5tYgitLv4=;
 b=FnRdXtCc1Hm2AIHcLZY5aMJWpWg8u1PmhOmQPPZIC48nM/Lri4CE0Ms/A/DW3kvO1z8jcOK/jHWDBH5wuJlPXXhx0AXw0LxIvIH4GIb3q/eU1rieU8BI/M5SmvfuxE62lhS1Buo6xhCcaHGn22M1D6SagEocYSyvA8RPQdv1zxY=
From: Andrew Cooper <Andrew.Cooper3@citrix.com>
To: Julien Grall <julien@xen.org>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Julien Grall <jgrall@amazon.com>
Subject: Re: [PATCH v2] xen/mm: pg_offlined can be defined as bool in
 free_heap_pages()
Thread-Topic: [PATCH v2] xen/mm: pg_offlined can be defined as bool in
 free_heap_pages()
Thread-Index: AQHYKOjWJCDx2mm9mk6Wd3Mq36vJRKyhh/cA
Date: Wed, 23 Feb 2022 19:38:12 +0000
Message-ID: <27fd5c5f-591c-42c4-abed-95a9e5829d56@citrix.com>
References: <20220223190833.24710-1-julien@xen.org>
In-Reply-To: <20220223190833.24710-1-julien@xen.org>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 26ce85f0-6a9c-4df3-f30f-08d9f704076a
x-ms-traffictypediagnostic: SJ0PR03MB5856:EE_
x-microsoft-antispam-prvs: <SJ0PR03MB58568C1DD3FDEF71B7E902C2BA3C9@SJ0PR03MB5856.namprd03.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: h8a9lgbd6PR+aRz8/l5HVxx6l6bYouabcxlnEwKnsVP8f15u1iFiATGKyooJTcPmuEwED7j6cdNDd5FpaIIr2neq7ucGkcO1E7TJymddONjx/pUAtgY7piBRK09MDWQ6zrYgqEdww5027VU1i7HW6NBogYDKA3h59FVuLSlG7EUxvR7jlJwL2ml1XPnvGqtbbgazkC5S/klP1EwQt1aOVt++CduXHNWVjTPmc3hSV1A0PEjPw5MyD4Ensy4lxVnNjlL3X6ok0BmUEqhXF1Do3MiL5r67rzEvruCZVdeQYmdR2xXUEHCew7Og2MzYQ12TjvHzln2kO2SkIgjZL6N0WMDH4A4FDjlepBKIjsIRwOURmaGJSohXoPw2Ajm4RUbjqeivnzNCah8BOD8Enj9UEDidfQvDZ4RMwcDb+ycspZAUFv0jqBPJgQ/NyrUbp7k1bfiJdjyOm1n7WiuLKpAnpx2YT7thchX+lEmqbcKq1CiWVXDPyqpZhxddJRsgkde9mMMLYEO4xMGBXVk9WgLcwIN25Alp3qXCD7cmBmSt6o3DiJB43MyQbwrrV9KGG40PmpB0+txjRG1ThnXX0pgJMvHlkEm2nRQsH7M0wzTszfbXjz4WL6oawHyaAAA5b5tdFWVUlVcSw3Jsy/qnWwYd/2Vixlo2iVfezu0tuUZ4OQlYl5NlcLrj1sq3VbQyHhm4GUZOtrDyOXhOi6WN9DjrKhL1RIZj1CcOb6ExwnTIdcPk273Lo4mKjz0TbMfMgM4UrLrM5nEtnvcSU0KULkiHcg==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(2906002)(38100700002)(122000001)(82960400001)(66476007)(66556008)(66446008)(64756008)(66946007)(91956017)(8936002)(76116006)(8676002)(4326008)(38070700005)(53546011)(508600001)(6512007)(31686004)(4744005)(6486002)(71200400001)(110136005)(31696002)(86362001)(2616005)(26005)(5660300002)(36756003)(6506007)(186003)(316002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?dzIyRzREWTJsWktkL0NXcVNGMHFkUnRpczg5c29XWnBoSllMVDhuMWJuVjJY?=
 =?utf-8?B?dXlxTEkwaHZ0UC82TVhmYXRhQTBwaGd3WnlDUG1xWDNOSE8vNEpXYkpkV1Vm?=
 =?utf-8?B?WmNYd0t1clpRZDRSdEFEN1BXM0NYdVh4R2NwUFEzVkxQUW9vWkQ4enBaVjJ5?=
 =?utf-8?B?ODlEUnorN25Hd2xsVUhvcXZGQ1ZVdmp3cVVQZDVNYmtzQjR3aWhEcXlIakVR?=
 =?utf-8?B?UmI5dmtlYzJncXFobUlyc0U0ZldJWEc1Qk1zOU55Z0tma09mTHVZRG4xaklX?=
 =?utf-8?B?WU40TG0vY3dKQ2liMmVnNUgxcUZsSlpOY1FmdGY2MHdxQTJWbDdmM3VRM0lw?=
 =?utf-8?B?d2p4NWFRbnFtcjQ0cHkvb21kd3pzOWZrTmZ3STRNbGdpU2VROGRHWnpidXB1?=
 =?utf-8?B?bEZhNE83Y0ZKdG5PaFZVUTZLRjVzL2kzd3c2NVkwSkNkVHMreGYzZWlqeFJT?=
 =?utf-8?B?bWtzeXFFem1NTTdwSmJTeE0vRDArdHJzb0JmMWtMODBPUURROXRkeEFpSG5C?=
 =?utf-8?B?dUU0R29ua3Fjak83VHVxWFg5cHpDbFFYWTluNkl1MEpLRU1oaDlHWUFRYWox?=
 =?utf-8?B?VzA4cFpPOWdKb29xRzNmR0VFL3VWeGdZWWROWjRYcmFldHVEYmkzL1hnTkQ0?=
 =?utf-8?B?WnNWWi90T1Bra3lDOFd0M1FMUTJldm9rbHk1YVdmMU8zK0E4VTZKR3ZtZG9v?=
 =?utf-8?B?OEc4djFiQTZKN0xYT0hHSG9aYmRZZm9LYllxQmVoSkxRclUyU1dWOU8rWlZk?=
 =?utf-8?B?TUl2NGpabC9IZUFsaWtqb0hIQ1BWU0RxdUgrcmZEcVpiWlZrSDM4UzEvVnFj?=
 =?utf-8?B?OExJc2FUcGQxZzlhQ3JwTkw3S0RpaGo5K1BDSWtOQXVMdTBOckJmd3NMU05I?=
 =?utf-8?B?ODMwdFFZd3lYSHM3aWlEZ0szSktwS2d0QVVpK24rQ09sbXFqVXdxejNkbDVE?=
 =?utf-8?B?UmVpbkU5WVN1SGdJRnFwM29DZzdzSFRSQkxRaUZEUHJ0SUpNQXdLU1pKY1pu?=
 =?utf-8?B?OXdocC8zWUVuZDM0NnZSdWsxcWN3dmliRFlaVU04eTFaeU1nMThHaE1LWi9y?=
 =?utf-8?B?WGsrMzVCSWxXTUd4MFpEdHdiYnI0bTU1NGNibVQrQnZzTEVtNnJ6OXNmTEpk?=
 =?utf-8?B?Q1lycEZud1J4Y3VWd1ZQalFBTlV5cmpuRFBQeE9Wcmw4SHVrZHl6UXFjK1FS?=
 =?utf-8?B?cXBGcU5jV0RLcHdJZGF3Z1pCa1dlOEhYdmtVNUY3Um9HSlBMOHhpVDBxbUFN?=
 =?utf-8?B?Q3Jyb0ltWExaVVFNZ2VwSXIrMkZWQTltbEt2bEk1Q3YrYXlkdDhlZ0J1NDRh?=
 =?utf-8?B?MnZ4VFVCQUpoRnZMWHRXaFVMRzNlUW9oVlk3bkJ0WTMvSmNGYnFqSGRKa2oz?=
 =?utf-8?B?UnNiQi9WSlM4SDVOdVFmYkhCMGFXOVdDVERTOE5PN0pycUdkZHhRanZxcVYw?=
 =?utf-8?B?TUR2NTBqZEt6MWJEY3Izb295WkpuRXNGa1ZmY2tnbU9xM1JHd3FlWS80SDBP?=
 =?utf-8?B?MTZkWEpKcDl5Z0JqSmJJTXJaRlVrdVpOQjI3QnRGRUcwbnVkdTJ3cjFWcFJy?=
 =?utf-8?B?OWpCVFVLallrQ0pnQXh3UktMdnM3UGwzYWRPa3k2QjduK21FSGVqN3JyNTly?=
 =?utf-8?B?OFVucmpPdEI3aUtXa2l3c2JKUFduMHN2b2NZL1pNKzlrSHJhQjRrRWs0VEJN?=
 =?utf-8?B?UVRyWlpUZEZCbDBSTkc0NGdKK3hwcW0yTWFsUFRWNTYxZFNHTzJOZTNGZWlw?=
 =?utf-8?B?UlI4UVhSU1FtUDVXM0lwWU5sSi8rZWxKT3B6c0lUSTdIb1NtTFNReUhnTEY3?=
 =?utf-8?B?UlZuMW9wQ24rVVJIajZ0Z2ZyWEVuVWxzU1pwUks0ZGpjVTlUMTZiZklPNVcv?=
 =?utf-8?B?UllySmQ2dGJ1ZVBBZHVGUFdHUnRpL204bHRCWUFUR2ZNWXpkcThVbjdCbVAr?=
 =?utf-8?B?bi9oWm9OTERpTUN4VjlaWHVLZFZhNFgzMUt3Z2UxLzRJelZQTjRQSEpVNDJH?=
 =?utf-8?B?ZjRpZnU2TjJxT3lTZklVTGk1SVhOYk1YT3MrK1hEVy94TGJnYnRZaHJyS1hq?=
 =?utf-8?B?QUxaY3pjSVJuRW9MMjRic1hhSytIQXRucDlYN21pZ2hraFdBRFFoSWRFZ2dG?=
 =?utf-8?B?eG5yTTcxWWdncDgzSlRuZlRORTJiQjY5c3lidituaW10WVdGUHlUV2dLZXA5?=
 =?utf-8?B?V0pVdDk1cDVMM2FvQ0FVOVdFeHUwamx5VGNXSnZqMWRRNG9kVmpad3JnQU1y?=
 =?utf-8?B?Y3VKTHZFc1JzY3liUElYRU1BSDV3PT0=?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <3F25AF936AD2944CBC3A0B60483F9934@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 26ce85f0-6a9c-4df3-f30f-08d9f704076a
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Feb 2022 19:38:12.4609
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: /vXA8WbE5RUjQl37E6tBMI4EE3H6F/9DmYHwoIPS5eBbdqmSHXfqlVV0rynstiU37OvbqxmWR2+e9hLD2Vc6XxIykJhBLG296FeHD7kiU0I=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB5856
X-OriginatorOrg: citrix.com

T24gMjMvMDIvMjAyMiAxOTowOCwgSnVsaWVuIEdyYWxsIHdyb3RlOg0KPiBGcm9tOiBKdWxpZW4g
R3JhbGwgPGpncmFsbEBhbWF6b24uY29tPg0KPg0KPiBUaGUgbG9jYWwgdmFyaWFibGUgcGdfb2Zm
bGluZWQgaW4gZnJlZV9oZWFwX3BhZ2VzKCkgY2FuIG9ubHkgdGFrZSB0d28NCj4gdmFsdWVzLiBT
byBzd2l0Y2ggaXQgdG8gYSBib29sLg0KPg0KPiBTaWduZWQtb2ZmLWJ5OiBKdWxpZW4gR3JhbGwg
PGpncmFsbEBhbWF6b24uY29tPg0KDQpJJ2QgYXJndWUgdGhpcyBtaWdodCB3YW50IHRvIGdvIGFz
IGZhciBhcyBkZWNsYXJpbmcgRml4ZXM6IDI4OTYxMDQ4M2ZjNDMNCndoaWNoIHJlYWxseSBkaWQg
aW50cm9kdWNlIG9uZSBib29sIHBnX29mZmxpbmVkIGFuZCBvbmUgdW5zaWduZWQgaW50DQpwZ19v
ZmZsaW5lZCB3aGljaCB3ZXJlIHRoZSBzYW1lIHRoaW5nLg0KDQpFaXRoZXIgd2F5LCBBY2tlZC1i
eTogQW5kcmV3IENvb3BlciA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4NCg==

