Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E096649E925
	for <lists+xen-devel@lfdr.de>; Thu, 27 Jan 2022 18:36:13 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.261683.453294 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nD8gZ-00026w-Vf; Thu, 27 Jan 2022 17:35:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 261683.453294; Thu, 27 Jan 2022 17:35:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nD8gZ-00024X-S1; Thu, 27 Jan 2022 17:35:51 +0000
Received: by outflank-mailman (input) for mailman id 261683;
 Thu, 27 Jan 2022 17:35:49 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=P5DO=SL=citrix.com=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1nD8gX-00024R-Sy
 for xen-devel@lists.xenproject.org; Thu, 27 Jan 2022 17:35:49 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8f458e23-7f97-11ec-8eb8-a37418f5ba1a;
 Thu, 27 Jan 2022 18:35:48 +0100 (CET)
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
X-Inumbo-ID: 8f458e23-7f97-11ec-8eb8-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1643304948;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=SWVPtmGpUBxhB4f4tqSue2NIRoANcsSL8Cp5qV69uQQ=;
  b=VUh0awcYMiC7wwEPnYUpldqLcg8dj6NNaf9pOInpdsi5UOpoWf7TyUpo
   QNvuY+MANa95Tb4OJ8sCVyYng7cJomnBAgDp1G1hQkx1xPOzr5B6sAGS4
   d/pjph3beN78Ds6Iq+XEKePT9d5rtNbDR/K9KeFxCpIxgTPXHNSbYEEKe
   o=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: 4/OlRQuFodIXadi+GhhjzkhEj/3EfgcWYIkrnje/E866eXWIdUnivWiXf1wKq5VbP6KMhJWQbp
 oLltORLmqlJ3eJe7hkuefMZkhVnNycReRKMVgbJbns9Eze2CDDugdjHtrQH3rlwAdENPgHwTjq
 tIxnOaTuaVa/Y/xD5LLKON/T4vGv74ysrOiGkBz8NjFe8lyEyl5lkP+Z+pKZT9g0MKuMTi6A8r
 VgFKtNSP9TvL4w6cBMnnNkUjv5Kkm3en85xqlkj89r+wylN8iQRAl6Ci2o3p2rr/OjSWvNMn+c
 7C1XyGH8ND5Z4hCxgL5y3dh1
X-SBRS: 5.2
X-MesageID: 62916624
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:ml5mY6907Y53aJWm63/iDrUDbXmTJUtcMsCJ2f8bNWPcYEJGY0x3z
 WROCjrUaamJZjD8eowjYY/noUwO7ZTcyNVmSQVl/y08E34SpcT7XtnIdU2Y0wF+jyHgoOCLy
 +1EN7Es+ehtFie0Si9AttENlFEkvU2ybuOU5NXsZ2YhFWeIdA970Ug5w7dj3dYy6TSEK1jlV
 e3a8pW31GCNg1aYAkpMg05UgEoy1BhakGpwUm0WPZinjneH/5UmJMt3yZWKB2n5WuFp8tuSH
 I4v+l0bElTxpH/BAvv9+lryn9ZjrrT6ZWBigVIOM0Sub4QrSoXfHc/XOdJFAXq7hQllkPh7x
 Ptou5n3Vz03O5fesv5NDxh9NwhhaPguFL/veRBTsOSWxkzCNXDt3+9vHAc9OohwFuRfWD8Us
 6ZCcXZUM07F17neLLGTE4GAguwKKsXxMZxZkXZn1TzDVt4tQIzZQrWM7thdtNs1rp4UTK+AO
 ZBFAdZpRC/+WV5hA0cXMrgFg9yNmHq8WGNe8k3A8MLb5ECMlVcsgdABKuH9atGMAMlYgEucj
 mbH5HjiRAEXMsSFzjiI+W7qgfXA9QvkXKoCGbv+8eRl6HWRzGEODBwdVXOgvOK0zEW5Xrpix
 1c8o3R06/JorQryE4e7D0bQTGO4UgA0UdZ+NuM/rx+31K/u8SyDVjQFaxpod4lz3CMpfgAC2
 liMltLvIDVgtryJVH6QnoupQSOO1Ts9djFbO3JdJecRy5y6+dxo0EqTJjp2OPPt1rXI9SfML
 ydmRcTUr5EaloY12qqy5jgraBr898GSHmbZCug6N19JDz+Vhqb4P+RECnCBtJ6sybp1qHHb4
 RDofODFtIgz4WmlznDlfQn0NOjBCwy5GDPdm0VzOJIq6i6g/XWuFagJvm0lfhwxaZhZIWK4C
 KM2he+3zMUNVJdNRfQvC79d9uxwlfSwfTgbfq68giVyjmhZK1bcoXAGib+41GHxikk8+ZzTy
 r/AGftA+U0yUPw9pBLvHr91+eZymkgWmD2PLbimkUXP+efONRa9FOZeWHPTP79R0U9xiFiPm
 zqpH5HUm0w3vSyXSnS/zLP/2nhTfSFkXsin8pIOHgNBSyI/cFwc5zbq6epJU6RunrhPl/eO+
 Xe4W0RCz0H4i2GBIgKPAk2PopuyNXqmhX5kbyEqI3iy3H0vPdSm4KsFLsNldrg77u1zi/VzS
 qBdKcmHB/1OTBXB+igcMsah/NAzKkzziFLcJTehbRg+Y4VkG17D9Oj7c1a97yIJFCe265cz+
 uXyygPBTJMfbA1+F8KKOum3xla8sCFFyuJ/VkfFOPdJf0Do/NQ4IiD9lKZvccoNNQ/C1n2R0
 APPWUUUouzEookU9tjVhP/b89f1QrUmRkcDRjvV97e7MyXe71GP+44YXbbaZy3ZWUP15L6mO
 bdfwcbjPaBVh11NqYd9TepmlPps+9v1qrZG5Q14B3GXPU+zA7ZtL3Taj8lCsqpBmu1QtQesA
 x/d/9BbPfOCOd//EU5XLw0gN7zR2fYRkzjUzPI0PESlu3MnoOvZCR1fb0uWlShQDLppK4d0k
 +4utfkf5xG7lhd3YM2NiTpZ9jjUI3ENO0n9Wkr23GM/ZtIX92x/
IronPort-HdrOrdr: A9a23:35C0+aD0eG1Bp0HlHegIsceALOsnbusQ8zAXPh9KJiC9I/b1qy
 nxppkmPEfP+UsssHFJo6HkBEEZKUmsu6KdkrNhQYtKOzOW+VdATbsSorcKpgePJ8SQzJ8l6U
 4NSdkcNDS0NykBsS+Y2nj5Lz9D+qj+zEnAv463pB0NLT2CKZsQlDuRYjzrSHGeLzM2YabRYa
 DsgPav0ADQHkj/AP7LZEUtbqzmnZnmhZjmaRkJC1oM8w+Vlw6l77b8Dlyxwgoeeykn+8ZgzU
 H11yjCoomzufCyzRHRk0XJ6Y5NpdfnwtxfQOSRl8kuLCn2gArAXvUiZ1TChkFxnAic0idsrD
 D+mWZnAy210QKJQoiBm2qo5+An6kd315at8y7CvZKpm72HeNtzMbs+uWseSGqF16NohqAN7E
 oAtVjpxqZ/HFfOmj/w6MPPUAwvnk2ooWA6mepWlHBHV5ACAYUh57D30XklWKvoJhiKo7zP0d
 MeeP309bJTaxeXfnrZtm5gzJilWWkyBA6PRgwHttaO2zZbkXhlxw9ArfZv0kso5dY4Ud1J9u
 7EOqNnmPVHSdIXd7t0AKMETdGsAmLATBrQOCaZIEjhFqsAJ3XRwqSHrYkd9aWvYtgF3ZEykJ
 POXBdRsnMzYVvnDYmU0JhC4nn2MSyAtPTWu7djDrRCy8/BrYvQQFq+oQoV4ridSt0kc7jmZ8
 o=
X-IronPort-AV: E=Sophos;i="5.88,321,1635220800"; 
   d="scan'208";a="62916624"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lDEiH61Go5JBKfIfkS6WzM/tmMCiALIaD6qYuHzc9T1gcux/AYjPigvZhi4WAhjoIKaS1e62qc8om2XVhrYtFa2Fs3VEOyWs6hl/CcO8jPt7upAlSRnZASF+UQf8C8bX1P51LefRs0gJa6qEaqTIXJ8HwvHRkrnoln2PZWyx2W3hfkRV7TCRrr9XD1jYbJfkqYu/RRAxKSnW7joEdCxqUfSl1zCqi+LLvzBu1A3HtwmkpZuLXHQylhD0wAooa5Vhm1fnVC+SYABtMMT3xRvL1PK9m4X410DK8U2vdlfubNxhWL6e6tH7PiWCXT9mR+sMc9vdTLmgPkZZpzU6MMJ99g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SWVPtmGpUBxhB4f4tqSue2NIRoANcsSL8Cp5qV69uQQ=;
 b=MpSH4AHONVv44pppqM2Pl145vAH+2Unq0/4KMW11+eW5JK3X5vz5zPAEiHrcWZBc/RRUlIjP/oDTj9apXXXsXAXHHbZWlN0v47eNO5sbYcquHF17XdxzxJMVUspm3kbeE/mlR4tRquC78Gcz2zYTMRaMGC2bv/qrE0LSg/pJyUbxaLPAXnuPOn7ESrWTlwCYlFlRDy5c1bbt/cKDJiEGLDnEoOuVeNbzNm56IC0aig+lrOM3YKT4BsUUBf7e/kjbhNCNFXsaDgCds94A4UHK05Op/YrOZgm0QwS83LFMcUICgiZyMloTktGLchHTpNWhiqqcx3n65gTO4oqqilE55w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SWVPtmGpUBxhB4f4tqSue2NIRoANcsSL8Cp5qV69uQQ=;
 b=phT/1fu+2hQfB3HHMeccHlfOrpObbFUHJSniqOYAvRF8lwBf+/HQAzj0RYodRHuMW6P2YQjHHvj+bxogoyAhsgj3ANK+P8iAlySaVLbjr5WXQhAl1BMRHdd01b1MbEPX1bVGVFqe80621AFCNBjrEH4y0TNW+yEmVF7Yx7fbfGI=
From: Andrew Cooper <Andrew.Cooper3@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Roger Pau Monne <roger.pau@citrix.com>, Wei Liu <wl@xen.org>, Xen-devel
	<xen-devel@lists.xenproject.org>
Subject: Re: [PATCH 2/3] x86/cpuid: Infrastructure for leaf 0x00000007:1.ebx
Thread-Topic: [PATCH 2/3] x86/cpuid: Infrastructure for leaf 0x00000007:1.ebx
Thread-Index: AQHYE5huD7pVCoL/d0KskraI0R0Urax3Ej+AgAAPHYA=
Date: Thu, 27 Jan 2022 17:35:29 +0000
Message-ID: <ccb7bfb0-20a4-e80b-62ad-aabe41e358c1@citrix.com>
References: <20220127160940.19469-1-andrew.cooper3@citrix.com>
 <20220127160940.19469-3-andrew.cooper3@citrix.com>
 <d2405bc8-64be-206d-7d79-b06e2fdb6ae9@suse.com>
In-Reply-To: <d2405bc8-64be-206d-7d79-b06e2fdb6ae9@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: e8ea79c0-2bf8-4369-e6a1-08d9e1bb6991
x-ms-traffictypediagnostic: DM5PR03MB2841:EE_
x-microsoft-antispam-prvs: <DM5PR03MB284176C7C676FE3A602B1571BA219@DM5PR03MB2841.namprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1091;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: l7nFVxIKBdjinTYVny3uLMw6gkX8DZt/20Kji8n23sopqXvmBY/LO6zYf4WUdodqbjREYGPWfUHs1aaYqeleer5qeLCJB6eZOoiPLrBenfOmbXjcPX4MYpeanPAE1d39M3Oh2PIi2V3CX8c3mBUUX1SGFNFpeeKG+XLHhF2N7UXv9771Di2PnssVr8w+5/U9l7c99aVcp50tb5bZsxeA7YUC8pl1zMNlDt9zWXX260l23HhsFuPdbij+j+yJUC29mHivfOoDzF0dI2/TQj6QE3zYXIdxjKG14BlAT0o3qvaZUYuCCLupjVBOHzpyEWh6Cl/T0QzkrtL3tGR7fCjvT3Um8prVZURr+5hWFFnMuuYGTkzmzhUrUSaUXRLm0hIk4WvSXZIagpVP0f+y+PIhQJNTJi/XYSA34QFg/f8Hr1xOP697i5jGhxWjbyyrU7s1YM2esF5PfT0q/kNjKnDTKuaL8Sth8zAtoviHk/yaPZOgdWXJARgIG5yCEMRj3DmiprbhD80mUucaUCA7vXXa52FRN5i8enN/5pX32I2Rg7Pgzn12BsBqYsGePmp8XNY6HVbgfiN+S8mALmbUykVbgq4gISNu2KSOhfTAIxPat//PkYBZVV+Fkf3wK1sl1dNbMDDx6uDDkzXx+zoLfyUF4XFDn6DKvyEU7/3PgweAsrlgN+AjnaFq0vZiYHEI0WZ/a64NnFpgONb9NiXEq4B1FmvjU/jrJGk7B24RQxIF/QQgUigb6wo8wks9yFv6ey0hAt0I4bytnFcncKQdMFURaw==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(508600001)(6916009)(54906003)(316002)(6486002)(86362001)(6512007)(186003)(76116006)(66476007)(5660300002)(4326008)(8676002)(8936002)(66446008)(66556008)(64756008)(66946007)(82960400001)(31696002)(36756003)(2616005)(31686004)(6506007)(91956017)(53546011)(38070700005)(71200400001)(38100700002)(26005)(4744005)(2906002)(122000001)(45980500001)(43740500002)(20210929001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?ZXh0N2JCbDliWEhMV091aEt1emxHN1hESXNjYWVPRkpwTmxyVFp2anNmcllR?=
 =?utf-8?B?ZWZCTTJvdGFQbWsxeW5wVVQ4UlR2YVU3bENkdFRpS256dzBRU1lIY2lyVGww?=
 =?utf-8?B?bTRVdmZrNkN5N3R1N0xwY2d4ZWtqdkNhZlBDL0hEM0s3RGpnZEZWRlNOUjVi?=
 =?utf-8?B?TDZhRGFoV1lOeWhiY1BNVzVISGRseWc5YmJsbGFhd1JKMHpFSTNrNE84RDJY?=
 =?utf-8?B?SXk2aVZub1pNdWErVWZEdjE1U29SUzMxRjROZXVWMHo0T1hkY3NBWGJuK0dE?=
 =?utf-8?B?dG1EVFREWVQ5enZoUXNHWWNGbGRKZFpmYmhjS2RMUC9CRWZ3bWIyN3NBUGNO?=
 =?utf-8?B?aGRrdDQwTjNSWFN5dWYvVUM1dmxXcFFZdUhTdkFtQW91MUNJd0VmUm1mdWtN?=
 =?utf-8?B?VTZtQ0tpeTd1SmhrZ1JaVE1qU05FbVVMbEMrUUhobWdhaTVuYTFNSFhuOFdO?=
 =?utf-8?B?M0N0YlVyZ1FCSk80Qi91UGI2UHJqVE5kQVVQbVlzNnVDZTlxb3hxRDJKVGNX?=
 =?utf-8?B?MDA3UU9YUDBDditRekppZUhxelR2L3FwWE0xb2txc1FMR053S3lRdUVFU2I2?=
 =?utf-8?B?ZTU3KzE5dW9QMzJMRWc0RzZOTUh5TDhOdWRqbnVqTFY0TElQUEdndkVUYkR3?=
 =?utf-8?B?V0NtaTMxMVdrZ0d6NTBieWFXbGxVKytZY0VxUTNDalRTYUc2c1czb0JpYkIy?=
 =?utf-8?B?WCtPUTEwcEtFNCtucWxMdTFPS2M4S21MaFdaWDAybGIzWTIyVyt6QTMzZHpo?=
 =?utf-8?B?Tm1xWHJOWERpK0VhM3FUdDZHaHBIN1hCaCtsRzhkREt4QVVBUkorZFJzTSty?=
 =?utf-8?B?MFYxeXNHeWVWdVZQeVE1TCtqNDVZSTk5RmlXeUhPRmQwRTBwMkpRQXRrbHdC?=
 =?utf-8?B?MU5lV0NrUUJyTWMwWVNXanpobEVyMTk0TEs0S3pSbTR6RGpOVlVUaWZNREo2?=
 =?utf-8?B?d0Z6STFjbU9yTkZucXdaWWd4UnE2V0pLRXZNZW9YaHBSazRreVZOamVKT3Bj?=
 =?utf-8?B?QXhPek9SWEdwQS9TM25pYlE0MDBEb0VPNk9veWpGenVUZ0x4cU1GYUFodHZI?=
 =?utf-8?B?bTJjT1hlV0FQa0wrV2hHbno5T01jRUJPUW5BMHNyRVlsWk9rTE5LejV1TlZl?=
 =?utf-8?B?bWoyRGZKSUgwM2JUbUdhbkhLdmI3Smg4UnNCdXphb0p1WlpKWEk1Ti81RHFk?=
 =?utf-8?B?cHJJVzRCSTlZNElyQ3VvU3BrUHJsYlJiaWpoeEdJZmhieFQvVDRQNG1ERHRv?=
 =?utf-8?B?eExxbWhkVGlPdlZFZkdwOTJxZ3hYNU9lcVk3V0hGVHU5eTkwWDJtZUZyQ0R1?=
 =?utf-8?B?R2lnUDg5MmpLRE9HK3BIN1laOTl6emdaRjJzZXlPS3poUURSaklVNm1vbDJN?=
 =?utf-8?B?ejJKVTA5WTVsb0VoVlFYSmhkSmMyU1RMQTkzWjhkOW9TcUE4VlhmV3ROSnU5?=
 =?utf-8?B?cjl2elYrOXRRY0FWNlFlWE43bEZXNEVEc3lOMXp1QVFDeWt5L1ZtVlFMZGR0?=
 =?utf-8?B?L21SOUdTUFRienJOb29Gc0Fqak5EU2dxQWpQOEZwUDRlaW1vNU9uRXBMUUdJ?=
 =?utf-8?B?MURoRlFFNzJKdUJtcStVU281dUZRbHpKMVJyNklGMVplUy9HV2djMGNYeGp3?=
 =?utf-8?B?U3BaZDR3aUxZK3dSamQvSFRDNFB5YndBL3lwdGdrWkliN1Y5eXZ0NTZsUm94?=
 =?utf-8?B?amZwUGFMWlVRYnk2Y0YrRWtnUGFBdFZWSmpKVkd3Ujd2eHFaeFl5MVhqN3N6?=
 =?utf-8?B?T0JwR1h0eGJpbjdUMkVjbWg3U3MwdkFkWm1za3d0TUFnYnFvSlV5YVQwKzg5?=
 =?utf-8?B?c2h0VUt1M2Q2eXBPdzU2SndxSU9qZ1JpalQwRWFOelpmZXlCM0xXQTZSYVBp?=
 =?utf-8?B?MlBjTUxyM3VHVkp0N2luUFBGNHA5QkZmaURiclM5dnd6VTNXR0hCS2ZGNUFv?=
 =?utf-8?B?cUc4S2ZBemp4RVZqcVA3OElGVkovL0R5ekFXTHh6RUE5WHdPejhlbEtmZWtI?=
 =?utf-8?B?MFZoZy95d2xzeGVKWklPNWc1VDZtajNBZmtZMkp5RStKREZtOWN6b1FFc0RP?=
 =?utf-8?B?WGZGVHY3QUl2VVVZRTEyK0RkelpWM2ZGcmQ3K3kyNHh4aUlFd294WjFvaEN5?=
 =?utf-8?B?b1Q0MEFzaDNHUmRGbFEvcUtibFI1ekI5ZzJlRTN6TzJTOU5kVG1NZ2RudDQw?=
 =?utf-8?B?NS9ub1FoZFJOYVpscDhyWitnL3NwMkRlb1FSLy9rOGZFUXl4dnBwKzhROVY0?=
 =?utf-8?B?dUlCM2hzalVHTGFDVFhZdm5UaStRPT0=?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <11873813DC81C3428DC02A81AB4C1E42@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e8ea79c0-2bf8-4369-e6a1-08d9e1bb6991
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Jan 2022 17:35:29.5001
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Tj7DIbwVecW7o5BsdTLDFrPQVsoUFehs/4xKsLvu7m3xEHRgq1hZUMh7qaCC8SjV+NbSKEVmW5qNQM5QB7YLnIaWHMiIJgQp9Yk4x2pSGDk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR03MB2841
X-OriginatorOrg: citrix.com

T24gMjcvMDEvMjAyMiAxNjo0MSwgSmFuIEJldWxpY2ggd3JvdGU6DQo+IE9uIDI3LjAxLjIwMjIg
MTc6MDksIEFuZHJldyBDb29wZXIgd3JvdGU6DQo+PiBGcm9tOiBKYW4gQmV1bGljaCA8amJldWxp
Y2hAc3VzZS5jb20+DQo+Pg0KPj4gU2lnbmVkLW9mZi1ieTogSmFuIEJldWxpY2ggPGpiZXVsaWNo
QHN1c2UuY29tPg0KPj4gU2lnbmVkLW9mZi1ieTogQW5kcmV3IENvb3BlciA8YW5kcmV3LmNvb3Bl
cjNAY2l0cml4LmNvbT4NCj4gQ29uc2lkZXJpbmcgd2hhdCBwYXRjaCAxIGRvZXMgdG8gdGhlIGNv
ZGUsIHdvdWxkIHlvdSBtaW5kIGRyb3BwaW5nDQo+IHRoZSAweDAwMDAwMDAgbnVtYmVyIHByZWZp
eCBmcm9tIHRoZSBzdWJqZWN0Pw0KDQpPb3BzLCB5ZXMuwqAgRG9uZS4NCg0KfkFuZHJldw0K

