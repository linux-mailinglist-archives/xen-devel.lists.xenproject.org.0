Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A54154F133F
	for <lists+xen-devel@lfdr.de>; Mon,  4 Apr 2022 12:42:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.298242.507992 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nbK9R-0005uy-DH; Mon, 04 Apr 2022 10:41:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 298242.507992; Mon, 04 Apr 2022 10:41:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nbK9R-0005se-9o; Mon, 04 Apr 2022 10:41:37 +0000
Received: by outflank-mailman (input) for mailman id 298242;
 Mon, 04 Apr 2022 10:41:35 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=2Zjy=UO=citrix.com=prvs=08688decb=roger.pau@srs-se1.protection.inumbo.net>)
 id 1nbK9P-0005sY-Ra
 for xen-devel@lists.xenproject.org; Mon, 04 Apr 2022 10:41:35 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id cb4c61be-b403-11ec-8fbc-03012f2f19d4;
 Mon, 04 Apr 2022 12:41:34 +0200 (CEST)
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
X-Inumbo-ID: cb4c61be-b403-11ec-8fbc-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1649068894;
  h=from:to:cc:subject:date:message-id:
   content-transfer-encoding:mime-version;
  bh=uhJBpq+DahclFodW1RITXMAAJa6OZlPb/T/RNd4e1IA=;
  b=U3yK1rNtajjjuq7J044uXvVUGi2EVtRpuFXlGeUn9XGKdRk+2wsC9J2K
   nbBhLTWbqJLCC6kR8PnM1eaZ/kCAaihMUe14XQliHhIG6fi2Gt8j46dIF
   NJQvyPjee+34JuCAAxx/3CVpaQ019ccFIFtkpOwx+HLHHjETrCUBtSXoW
   Y=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
X-SBRS: 5.1
X-MesageID: 67357433
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:Cu7KOqj9HsumwySL22smuBsXX161XxAKZh0ujC45NGQN5FlHY01je
 htvUWvQOKvYNzHwKN9waIW/8U8Ov8DQzIBnTFduqHgyQ3kb9cadCdqndUqhZCn6wu8v7a5EA
 2fyTvGacajYm1eF/k/F3oDJ9CU6jefSLlbFILas1hpZHGeIcw98z0M78wIFqtQw24LhX1vR4
 YqaT/D3YzdJ5RYlagr41IrbwP9flKyaVOQw5wFWiVhj5TcyplFNZH4tDfjZw0jQG+G4KtWSV
 efbpIxVy0uCl/sb5nFJpZ6gGqECaua60QFjERO6UYD66vRJjnRaPqrWqJPwwKqY4tmEt4kZ9
 TlDiXC/YRwxN6HxsrUxaD8GCAZ5HJ10+KXOCHfq5KR/z2WeG5ft6/BnDUVwNowE4OdnR2pJ8
 JT0KhhUMErF3bjvhuvmFK883azPL+GyVG8bkmtnwjzDS+4vXLjIQrnQ5M8e1zA17ixLNaiBP
 JdGNWE0BPjGS0ZsYH0LBK8ioNzrmnvgfTcJiW+a/bVitgA/yyQuieOwYbI5YOeiR9hRn0uej
 nLL+SL+GB5yHMeE1TOP/3aoh+nOtSD2QoQfEPu/7PECqF+Zy3EXCRYWfUCmuvT/gUm7M/pPJ
 kpR9icwoKwa8E2wUsK7TxC+uGSDvBMXR5xXCeJSwB6J4rrZ5UCeHGdsc9JaQIV47olsH2Vsj
 wLX2YOybdByjFGLYWmF/7uph2KeAg5LNkgFRB82TREMyta29enfkSnzZtpkFae0iPj8Fjfx3
 y2GoUACulkDsSIY//7lpA6a2lpAsrCMF1dovVuPAgpJ+ysjPOaYi5qUBU83BBqqBKKQVRG/s
 XcNgKByB8heXMjWxERhrAjgdYxFBspp0hWB2jaD/LF7rlxBHkJPm6gKvVmSw28zb645lcfBO
 hO7hO+ozMY70IGWRaF2eZmtLM8h0LLtE9/oPtiNMIYfOsIpKFLbp30yDaJ144wLuBJx+U3YE
 c3FGftA8F5AUfg3pNZIb7l1PUAXKtAWmjqIGMGTI+WP2ruCfn+FIYrpw3PVBt3VGJis+V2Pm
 /4GbpPi40wGDIXWP3mGmaZOfAtiBSVqWvjLRzl/K7frzvxOQzp6VZc8ANoJJuRYokiivryTo
 SHlAx8BlwKXaL+uAVziV02PoYjHBP5XhXk6ITYtLRCv3X0iapyo96ARa908erxPyQCp5aQco
 yUtEylYPslydw==
IronPort-HdrOrdr: A9a23:Z4o7la/aj4DXD8CGh/Buk+Ewdb1zdoMgy1knxilNoENuHPBwxv
 rAoB1E73PJYVYqOE3Jmbi7Sc69qBTnhONICOgqTM2ftWzd2VdAQ7sSlLcKrweQfhEWldQtq5
 uIEZIOcOEYZGIS5a2RjXjaYrQdKbG8gd+VbIzlvhFQpG9RGsVdB1ATMHfmLqQ6fngOObMJUL
 6nouZXrTupfnoaKuy9G3k+RuDG4/nGjojvbxIqDwMurFDmt0Li1JfKVzyjmjsOWTJGxrkvtU
 DDjgzC/62m99W20AXV2WP/54lf3PHh1txALsqRjdV9EESlti+YIKBaH5GStjE8p++irH4sjd
 n3uh8le/9+7nvAF1vF1SfF6k3F6nID+nXiwViXjT/IusriXg83DMJHmMZwbgbZw1BIhqAx7I
 t7m0ai87ZHBxLJmyrwo/LSUQtxq0ayqX0+1cYOkn1kV5cEYrM5l/1TwKpsKuZPIMvG0vFnLA
 E3Z/uspMq+MGnqJUwxh1Mfj+BFBR8Ib1S7qktrgL3h79EZpgE686Ii/r1uop4xzuNNd3B63Z
 W2Dk0RrsA0ciY3V9MLOA5Te7rANoTyKSi8Ql56Z26XUZ06Bw==
X-IronPort-AV: E=Sophos;i="5.90,234,1643691600"; 
   d="scan'208";a="67357433"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CenCBjiv/AL8yaWtExKOBsubHi4XCwzCrrqwJTraFIlw8/Haf+PNWAeM9xGI1F63ulvE5Ii+XmC7a0SRc4cLO4hTGNA0ZYI/keie0VJgpQqdEyfgq9zrn5yQcZN2pQex5q5tby2++w6qVhhlF2LDGgS7RG+14MnkRM8FCG2Oq1uGC0WfcH17H9n4cu1DVKPXa6mTCXgZOgWu+8/GsNrQoTQ9tD70gC7H7rnAqrx5T56fme8cwEZfvkO4NXf7Gd34ad7YSVNuVHMkecQFIR0+MGVc8E0KmFPR3GxFVTf2VCPMpArxc+oOr9Dk4SFDX9rxn1T9BzaVxn7uuj4sCMLI+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=T90N2Kp4KnZ1HpykkkoYeJN1vbz958iNVPnDyEk4R5g=;
 b=oV4QnSp6JwSi4eJ9gWZ7F4FYJC9T0qgyGGIuU6+qbihsO+dQBIFatH3z9wEHV77PLJ3MtmOOwdA2ASlV+lz03A8gJ2ctAUF8oEzQah4DajQWKby0FrdAIWBvxtXl97lf/tIr0LyCXuv4rdskPk2DBMmXQ/0hkUP+KyzMzT1PjsfNoTQQaRFMHMiAksAQXaDa5ykfADVQNfJ08/QkjTqwzKDnp+wrNrOeowBtjRZ216ihfEr7+ui6vyBe/gdUBsOWMStXz5pCNofq08i3JVXcWeXbs5jAcNXRBOonERZvUkfzIB5X1Zuhi7vQulCIR7ur8LtXTz1YPUywen3kHp5tpA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=T90N2Kp4KnZ1HpykkkoYeJN1vbz958iNVPnDyEk4R5g=;
 b=f4tInBrFQJn8A6YwZ5cqnwZYUP6BfjAijD/0F2yyAR9ot3GM+OZ2Q1IF6Cf9vXQTAvstB/7xlm4Q7QQWgUjp37iSwVPxmYCGzNxBRcAco8zrivuMBKsQ5lHpxQRQ1QZ6n3mkJ81Q32szu2QYRC8cjBpV5kUpHLpkHn6v//8lLkQ=
From: Roger Pau Monne <roger.pau@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Roger Pau Monne <roger.pau@citrix.com>, Wei Liu <wl@xen.org>, "Anthony
 PERARD" <anthony.perard@citrix.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, "Jan
 Beulich" <jbeulich@suse.com>, Julien Grall <julien@xen.org>, "Stefano
 Stabellini" <sstabellini@kernel.org>
Subject: [PATCH v2 0/2] firmware: build fixes with gcc-11
Date: Mon,  4 Apr 2022 12:40:42 +0200
Message-ID: <20220404104044.37652-1-roger.pau@citrix.com>
X-Mailer: git-send-email 2.35.1
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO2P265CA0265.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:a1::13) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 46a2222a-cb82-422d-89f5-08da1627ace3
X-MS-TrafficTypeDiagnostic: MN2PR03MB4669:EE_
X-Microsoft-Antispam-PRVS: <MN2PR03MB466980CBBC07145401DE26098FE59@MN2PR03MB4669.namprd03.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 04Et60iqdaEmdUN570HelOwKzN9J74TwUl3p3HK9JG5OafcD0ntOUtNStnCZB9spjR7hFFRFRgXqmKXYj6TxYBwl8i8gQSUMxIa/nw92qJ6hqwiYojH7BrfGD8OwtB+asXpygass4amZoAxBE1PRpzZXSJbMADq47nt1IfiCdSNzhgNtsbkzOi9KNL2tigNgIYDfEN17LmStGVuc7fheAIvEVplpJQ0w5H1fKfrj6vl1u3LCRbJYTCZhWbWWnZhG+fPSCkSpijOlox7fZOeapYMymLoD+dItnXIduVgKgslN/YO1g5PT/arNx51xlEh3YB8gMIhbq7/oz3ui9Z1IyvM4WOTMHgBViTE8AuImv9UM2mG+xnarkhNoJYH3PPljQk7DhgVYIRUXGs6tPG1suXHf8DEdVzWj0X1bQiL8KpZJX28cD5YZdCB4FSetYlrrgUlQIHuEdfzMl/58sDQCbmv55EbtBPImtSyTULDkEvw1xEun5kE4qEfOn6wJQi7n0UuGb+9X6aJ0sPBzQ6ZhpgtI66I8zshIUXwx22jLDYw4ugPMQfEi/W5EnGreE9TO99lBGhNLf+sXy7a0XR3Ks1C64inN1wHqh7HG6EzTMgT4u1EUsQCXUcrApOaXPRjAInOnsPHEsSo5zAjyLd/TLA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(6486002)(36756003)(2906002)(6512007)(66556008)(8676002)(4326008)(38100700002)(54906003)(508600001)(5660300002)(66946007)(66476007)(316002)(6916009)(6506007)(4744005)(6666004)(8936002)(1076003)(86362001)(2616005)(83380400001)(186003)(26005)(82960400001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MmlVVUlLc1JnL3pMV21XQ2txcUN5S2pIanR6bjdIOTVqZkJhbVYrQk1SZTds?=
 =?utf-8?B?dHFxZzQzQ3Q5enNmUzdnb3l4ZnVEWHhBUU5UTmMyZlE2L2x2VlovNzVUd21o?=
 =?utf-8?B?SU10VFdHOFVpUEVST0JSWUQzMnJqR2VGSVlOK0ZwbVJWUGpwTXBUbHVqN2NU?=
 =?utf-8?B?dW00ZEltbjd2clBkN2VGVHB2NmNmTWxERWhST2ZONWdwYW5HdkZUQzVRbkRm?=
 =?utf-8?B?bkNTRGRhTUlXRlVjUHV4ZjZXTzFLQzhENk1LdTF1N3BRMDlxMmVYUno0R1Jv?=
 =?utf-8?B?VFZZYWthYUtKUEIyTGpMMUtQbUNLYTdmVm5sUWpqY0xTTGhPV0ZyRm1XbGlk?=
 =?utf-8?B?b3ZEUnNrK1Z0UXlpUXVWTnJ5dVBWOVF4d2FZZFNLQWJOVG90dW5PdTY4Wjlp?=
 =?utf-8?B?ZkRVNUxTUHYzaVNYemN6M3BWaE1wdHYzcjE1UFdoNjQ5NkVTYnB3LzdwTGlm?=
 =?utf-8?B?MGU1QTBmS0V1TFJkMWZkSkZVY1gzRSsyQWN3YmQvd3R6eG9OUDFlQ0lPSkts?=
 =?utf-8?B?MHZvT1RsNk4xYkJGa0Q1aERwWjY2OTFJNXdROFZCaU4rSlVld1BnNDJzRlI5?=
 =?utf-8?B?ZVNrK0ZyUVZmWXdqVFgwQVFhVUtGNGVTdG1yVURZOVM1RFBBQkFwRmJ1a0xD?=
 =?utf-8?B?dkFWVFVtZmNFYXJRblJONnVZZ0p6cEZEdG8yMVhZcGVzMlREV1VXcFhOVjZ5?=
 =?utf-8?B?b3dSM3VWcU5TWHdHUGNPdzFXRkR2cmxWWHlSSkR6UWdsTDdVVk51a0xOYk9D?=
 =?utf-8?B?T1ZOajlMTnhkcVN4UVZ1MnBVeDJUbG1ENEJxWmFzNm85V294MDNLUlkwOXdR?=
 =?utf-8?B?b2NNT2hBaTNKYUVFbG01UERoeDI0dG94c3ZEM2pacG44YTIrdWZsVk1WWnFp?=
 =?utf-8?B?WkdjNWdJY2NueUVneFhpTGYydjlXOWtEaDkrSVdnMzVucGZwdGdFTTc4dGoz?=
 =?utf-8?B?TEFrcHVlZmRRREFtbGtIaU13NWlyTEVMYXhiVThHM3NCZ1c1cmxPQ0lvWXRy?=
 =?utf-8?B?cVppUEx5WkxQamJGZWxBc2ZUWkdaT3g1cFlZSnV0bVZzVjY0T3I4M3JXZFBV?=
 =?utf-8?B?QytiV0ZtMXUxSUxaWGNidnlTNURBdkxIeXdYNEF6dHZGNUJaelE0NXVqMjdQ?=
 =?utf-8?B?dyt3Wk9QODFYVGo0ZWQ4OVI5NmN0NGV2Y3JtRVZWWS9OWXRsZUZUdUZxbnNl?=
 =?utf-8?B?bTNZUUJZbTB5cXpWblZNUEFzT05BNFU3bG92Rkh0ZkhxUjhvT1owZVhKN1po?=
 =?utf-8?B?YXFTYWZwdHNKYUNCQzA3c0tVamJPdmJHUm92cS9pcTdpZHZYbStRY0JLbmlm?=
 =?utf-8?B?ekdWa2hjUUZXZ3dxUXYrQW1YczNrdm9jQUxGYjdEMGNLUmhRZFdqZmJGUXdW?=
 =?utf-8?B?dVdDL1ZIN044M0ZBbWhTZ3RySHNOaHl4V3QzaElnSkcwREdaaDhoTVlRK2ll?=
 =?utf-8?B?THNmem9ZVUtKYUZEZlNOekIvWGVtNFQvMGh2VW02c0JCeXh4eXpuY1Ewc3FE?=
 =?utf-8?B?VUowZGVCSVhZbTFETklFeWliV200cDRuZW9DMVRCd2I3NmVhQk9TQnRWOFhC?=
 =?utf-8?B?VVNFbVh0NWxMa05rZDVUV1A3Zjk1dksvVklxSmNHelMxS09qM3JTSGppRWs2?=
 =?utf-8?B?K09uNWRaZ0xrVVRTbWlLVDFqT1dtZkFPdjZhMzlscnJ0b045SWNMUlllSzdw?=
 =?utf-8?B?QXVQUmhoWDNUc21zL1BVK1A5cmhzK2FYMGQ1Y1RLWDhZVjRjdUxHWnV4dmhY?=
 =?utf-8?B?bVoyYTRsQ1NhdHRIbzJvTm5jSnBZcUpVTlRoV0VkcWlRM21VTW1tL0FvMWRT?=
 =?utf-8?B?VTd0UGVsZzBGTlRlbnhLVnFNTkc3R0Z6SEZIWHBkN29ibVBGVlZQbVpRamVY?=
 =?utf-8?B?Umx2eDNzRmJ1R2RRVWN2QUdMbk9rcXNvSHJaNGpIZEJ3TWpyOXV3eEZ4UHFW?=
 =?utf-8?B?VzlzS1lUSHNhL3pKdUVnNFBibVB1eTFvQ3dlclVBUWJtTXl5c1l4SCtHWDZR?=
 =?utf-8?B?TU1CMkwzSnoreTBTL2VlRnVmUjVCeGpZMitzQm9DWXJHcnVQMSs4NllnSDRG?=
 =?utf-8?B?VXR6YmJ6QUduODdFNUVUeUFRNHFIQzFmemc1WXJ4T0VBVXNiblhPZjJ0N2VW?=
 =?utf-8?B?Z2ZBdno0K0RCN2xIMGxablVaMU5SUks3MVJrUTExSnhJbmFsazRqaEdvcDJV?=
 =?utf-8?B?TzRZdWE5ekdWTkNHUlQ4My8xcWJWNzZ4bUoydytzbzU0TU42QW4ramowanRK?=
 =?utf-8?B?aGtXaHpiQ0c1a2ZTbnFzclc1YUd6OW1lNEgxQitnVjhzYjAyTnJqWFRja0Jq?=
 =?utf-8?B?d0NnbHZzZHdJMjFvdDhCMVNnVE55WU1pcElheHVGbDFTa3FjcWY0Z3hYYkcy?=
 =?utf-8?Q?wW6gArfLuCkROmzQ=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 46a2222a-cb82-422d-89f5-08da1627ace3
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Apr 2022 10:41:28.7099
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: whc0qick6vj8E7t8TGRRnFOzj3SOcQUiCryom/0xYiwGXUda0/M23Ny+8fYpV6xDla+NKHPGJovijwQI/+NWYA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR03MB4669
X-OriginatorOrg: citrix.com

Hello,

The following fixes some firmware build issues with gcc-11. Note that
dropping of .note.gnu.property section could likely be done in the
linker script in the hvmloader case, but rombios has no linker script
and such note is causing a non-working image. Other options could be
using objcopy to drop the section, but those seems more complicated than
just using the assembler command line option.

Thanks, Roger.

Roger Pau Monne (2):
  tools/firmware: fix setting of fcf-protection=none
  tools/firmware: do not add a .note.gnu.property section

 Config.mk               | 2 +-
 tools/firmware/Makefile | 2 --
 tools/firmware/Rules.mk | 6 ++++++
 3 files changed, 7 insertions(+), 3 deletions(-)

-- 
2.35.1


