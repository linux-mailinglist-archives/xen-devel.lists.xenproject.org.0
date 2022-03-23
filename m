Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BDF24E524E
	for <lists+xen-devel@lfdr.de>; Wed, 23 Mar 2022 13:37:15 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.293879.499411 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nX0Dw-0008Ni-Iq; Wed, 23 Mar 2022 12:36:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 293879.499411; Wed, 23 Mar 2022 12:36:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nX0Dw-0008Ls-FD; Wed, 23 Mar 2022 12:36:24 +0000
Received: by outflank-mailman (input) for mailman id 293879;
 Wed, 23 Mar 2022 12:36:23 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hFSt=UC=citrix.com=prvs=074729667=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1nX0Du-0008Lm-Nq
 for xen-devel@lists.xenproject.org; Wed, 23 Mar 2022 12:36:23 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d61136dc-aaa5-11ec-a405-831a346695d4;
 Wed, 23 Mar 2022 13:36:19 +0100 (CET)
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
X-Inumbo-ID: d61136dc-aaa5-11ec-a405-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1648038979;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=zkWRf2qNvZGX3PK4pKDgbGQUFAsVK8mVCexAGI9THbE=;
  b=WViE2ZjQXFCPLG93Zso0SOrq0AL8qMMozHZMiDAgaxpEHA1jE1i+pDAI
   hpjyMVUiR5DZs9Or3Jt0qatSFLYZxywRfoui5a3xpitEIMQF0cMuCqgB4
   3IAJCqkXeGbZvdH3c+D2Ya33zI8BOrWeJWH2/Crf/RHtD6EeN/Jx49IYK
   Y=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
X-SBRS: 5.1
X-MesageID: 66955240
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:lfISJquxQlBb4vOM2BX+a+PXSefnVKZeMUV32f8akzHdYApBsoF/q
 tZmKWGCa67eYGL9LdsiO96ypx8OsJHUzIJjQFQ6+XgzE3sb+JbJXdiXEBz9bniYRiHhoOOLz
 Cm8hv3odp1coqr0/0/1WlTZhSAgk/nOHNIQMcacUsxLbVYMpBwJ1FQyw4bVvqYy2YLjW1jX4
 ouryyHiEATNNwBcYzp8B52r8HuDjNyq0N/PlgVjDRzjlAa2e0g9VPrzF4noR5fLatA88tqBb
 /TC1NmEElbxpH/BPD8HfoHTKSXmSpaKVeSHZ+E/t6KK2nCurQRquko32WZ1he66RFxlkvgoo
 Oihu6BcRi8GDqnnx7smSyJdPBBbAqpJxfiAMXGG5Jn7I03uKxMAwt1rBUAye4YZ5vx2ESdF8
 vlwxDIlN07ZwbjsmfTiF7cq1p9LwMrDZevzvllJyz3DAOlgapfEW6jQvvdT3Ssqh9AIFvHbD
 yYcQWQxPUmdOUEXUrsRIJUHuNi2hlXjSjZz9EjLt/cQ2XbX6BMkhdABN/KKI4fXFK25hH2wr
 G/c437wBB1cMdWF0CeE6VqlnOqJliT+MKosE7m/+u9vkUek7GUZAx0LVnO2ufC8zEW5Xrp3M
 FAZ9CMoqu4p6EWhQ935Xhu5iG6Fuh8aS5xbFOhSwBqW1qPe7gKdB24FZj1MctorsIkxXzNC/
 k+EmZblCCJitJWRSGmB7fGEoDWqIy8XIGQeIygeQmMt4cTnoYw1pgLCSJBkCqHdszHuMWium
 XbQ9nF43uhNy55Qv0mmwbzZqx2corOWETUt3QD4b0ea6QxEI8m1brX9vDA38s18BIqeS1CAu
 l0NlM6f8P0CAPmxqcCdfAkeNOr3vqjYaVUwlXYqRsB8rGr1pxZPaKgKuFlDyFFV3tHokNMDS
 Gvaoktv6ZBaJxNGhocnMtvqW6zGIUUNfOkJt8w4jPITOvCdlyfdpUmCgHJ8OUi0wSDAdollZ
 f+mnT6EVypyNEie5GPeqx0h+bEq3Dsi4mjYWIr2yR+quZLHOiLKGOheYQvTMrtmhE9hnOkz2
 4wCXydt408CONASnwGNqdJDRbz0BSZT6W/KRzx/KbfYf1sO9JAJAP7N27IxE7GJbIwO/tokC
 kqVAxcCoHKm3CWvAVzTNhhLNeO+Nb4i/ClTFXF9Yj6VN40LPN/HAFE3LMBsI9HKNYVLkJZJc
 hXyU57ZU6oVFWifpWh1gFuUhNUKSSlHTDmmZkKNSDM+Y4RhV0rO/NrldRHo7y4AEmy8ss5Wn
 lFq/lqzrUYrL+i6MPvrVQ==
IronPort-HdrOrdr: A9a23:0XzXIa5X9B9z7SCNKwPXwMzXdLJyesId70hD6qkXc20zTiX4rb
 HLoB1/73TJYVkqNE3I9eruBEDiexPhHPxOj7X5VI3KNGOKhILCFuBfxLqn7zr8GzDvss5xvJ
 0QFpSW0eeAbmSSW/yKgjWFLw==
X-IronPort-AV: E=Sophos;i="5.90,204,1643691600"; 
   d="scan'208";a="66955240"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bng6SWTF9odq10gMErdQOLCgak/C6SS2s0AKEzxW1G60jsRVXmAVwzxsi1MGPcSKtZdDTBO4KB57AFkgU4KQ3ELCZQ5wACisO+pe5EmBQ8GZ5i6wTvVoDgyYUyjvjtpwDj4kYocs/FX3YHoDVcjEm7OPB/vAksnvdNyrx9+of5y0txxTAyra89DYZU/HH+tDzrD4SDv0dWYXh6hn0XuzAezAf68jhTG0qtHxSKIg0fjZHzb92F9rtB5hj/jJhbGfmUudzZiZdO+hvJEUqHAnjcz9gzS2r725nu7l8PTTorkwMMcrZ9ElS+vhiYPmjyzUtrFfCHU0nSCZp5q3kSowKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zkWRf2qNvZGX3PK4pKDgbGQUFAsVK8mVCexAGI9THbE=;
 b=KBQqMgbZ4aFoRiKhGZ3GHER6/K0dtZZvPE8YJEy3U3rteU8uMQVLFozSl5GnyD5hhodl8Hs/7FkA3QLvuXrO6zYS6M2dT4Ums4AjwjBlOk6XG8ab2lnhIlj08f6Aqd8Cm0e9iOYFFk8ugfNod0dpwsLkf+m/1+k7zTjnzmpDO38REvEvF8ZlvPHL4RFyUgujFOEa5l4PbMIagmWF3OuT4+A+FH15yyvN0y7tjKWZVjLTH7Suh/FNfP+TzWMxduIDmBZ5v7PKY/MmyfRyuJsUBZ8PhGXWvaGpvu1A3k+8uI0Eac/pL6MLnJRvVu1EhCKQgQtx7od8Cku+HbILxeEiYw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zkWRf2qNvZGX3PK4pKDgbGQUFAsVK8mVCexAGI9THbE=;
 b=PLthDGZgbgjHqk8YwpE6qeAGjjflaOhuz+0vlXJma7QKAR8RuJdbios4qPQZE9LgA323ugJJLT4esJeAT42rkKwyXR6xW9gfw0o44uwfz8snRgVbwvkvMWhWumC4kBxLNdR09PUvQl8y3/3Dv+Dn1vkp+O3i95D/0Pny8WduZD0=
From: Andrew Cooper <Andrew.Cooper3@citrix.com>
To: Stefano Stabellini <sstabellini@kernel.org>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: "julien@xen.org" <julien@xen.org>, "bertrand.marquis@arm.com"
	<bertrand.marquis@arm.com>, "Volodymyr_Babchuk@epam.com"
	<Volodymyr_Babchuk@epam.com>, Stefano Stabellini
	<stefano.stabellini@xilinx.com>
Subject: Re: [PATCH v2] xen/arm: set CPSR Z bit when creating aarch32 guests
Thread-Topic: [PATCH v2] xen/arm: set CPSR Z bit when creating aarch32 guests
Thread-Index: AQHYPittYWCwptKqXU+Nvu1B7Q61VazM6MoA
Date: Wed, 23 Mar 2022 12:36:06 +0000
Message-ID: <57924f67-2419-bcdc-73ab-96ea9f1d2614@citrix.com>
References: <20220322202825.418232-1-sstabellini@kernel.org>
In-Reply-To: <20220322202825.418232-1-sstabellini@kernel.org>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 279eef0d-87d1-48d0-779d-08da0cc9b3c2
x-ms-traffictypediagnostic: MN2PR03MB4879:EE_
x-microsoft-antispam-prvs: <MN2PR03MB4879282B6DFDBE5A2DB859B0BA189@MN2PR03MB4879.namprd03.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 9qn+9Bzx6ALkYXR23tWXpl5xSP4Uif6JCVDbHoaB0jUw4BuPp0cJwh1+5ThZF699/A6C/xjfmJp/0BV1Gd6rYfa89ZovMRal79cQ9BBKUws2uF/2wvY1ZOz0SDx4V7GU8VnkMx1YL/9lf8xlhcR0qxaUUY5xwjsGXHZ01Gq1j0SRGJthiR8Me4A8F+J4O0kzLK4gCkE9n9Lfcmi6Q8tQkGLyM4Z7Yf/xbGDUVQwaB2fkJ2eyJOtXfRb7MicsXJXDur69sXkVuO1E40PKRMx2rb3MyKyF9A5XVqpEMrFBmx79OPVvs3s99c5TMsME7c/CzdwDlj+VQDJpowLyzBwlo79P11DY/KL7PdZ1Mac9zLFk8MpYGWg01NhlItiZyeF70UQ7yL7O6nQsCVHOo91UNxg08KRZCpueV+Y6TUg6/6FH0XZV4Pp6ZB1KFjDkVrecoTXPbg7ECym6ob64BbZy3KkEY6wiricZPATpfEAzaPS5XTr2Wf9VD3K4UWDW+3KZtiCT7hhzPPYJ9fVPdWe4rk/c5c72Pfb+ISmeCHmq1Ib6ncUsqhFTqrHpiOYHW2tZfV/ihjGnf7SjysgrMbW+apIch4BX6tGmIPvfX58lOEjO/AUG+eToe3++1MLyG3lmuscI94yomlzpw2fSbI2T7jCcuyTTJcQM43esAnmpyvzU0cyXnp0SxcRONRo5oi/tf+fIRNnuI5tG51dS0yfsLdqLm7XhqWijLauehrmqi+4L3h0GqsknBOdf5Q9gVM7i1Hv9gxlP4Hzf3Rt67Pr2zQ==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(31686004)(66946007)(31696002)(64756008)(91956017)(86362001)(82960400001)(36756003)(5660300002)(54906003)(8936002)(2906002)(66556008)(55236004)(66476007)(76116006)(66446008)(26005)(8676002)(2616005)(83380400001)(4326008)(122000001)(71200400001)(186003)(38070700005)(6512007)(6506007)(508600001)(110136005)(38100700002)(6486002)(316002)(53546011)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?TXdrQVdRUlBnZ1dpMk1mL0tBMnUrWUFBalNENjJIeXdiOTB3QVZjeWlwZVlp?=
 =?utf-8?B?QjBRVzFGLzZmcDF1UkpVdFlIbFZPTTF3bHZOOTRxdndIRHRmVUkvZ3VtVkE4?=
 =?utf-8?B?Z0ZqWCs4SVBISFU1Tm8yb2NQb2Z5QkF6M1o4SnZBTE82cWVWSUNyTnB0VUcw?=
 =?utf-8?B?VW9ncHFjbnRiWjhVcnk5NTdtNFp1V2YvWi9BOXRBVnZ3Q2pGemt0bEZGUHlK?=
 =?utf-8?B?NGFSOUN3anRxN3BnTERhQVNmQnZmMnVPdG0xcmNZeXp1V3phM1huRUxRUlhh?=
 =?utf-8?B?ZXNuSnl1clhxNTEwcFZXT2V2aVJWSlkzV0d0NUhrK3JuaXA2MFFCdFl5ZXFK?=
 =?utf-8?B?RVFsemJJK1NrbTlseUdocUtHaUZyT08wZCtob3RIa1ZzUlAraEdEQmwrK1hl?=
 =?utf-8?B?MmNidUVRZ2pXcG1IdlFoMExzL054SE54dHkxWkdXUVZlN01xNENwcWhwSnVk?=
 =?utf-8?B?dE5OampsRUlUQUJ6Q09NdzNpZkRCVEdKVFJYdnIyWVM3bnd3RDdMa0d3MkN1?=
 =?utf-8?B?N05zaUFQZzI1Z21VdXA5Z2ZBa01KK2FHNXdYelV5YTVMWDBjdUh5ejFIZmRa?=
 =?utf-8?B?Qzl6STNZNkVoOElBMWQ4ZkxVTmRPQXZqUHprYUEwc04vb29HZHRQdUd6bVBm?=
 =?utf-8?B?NjFCV3NFUlJreEljM2F1MWlwR0tKMXdzbG9jdGQ5Z2txZU1MdGt4eTVOSkFm?=
 =?utf-8?B?R3dLa3lVZEpaTGtDNzdlbXZTM0txTDFBSFNZRWhRQ3M0bEVZOXBWZU80VFVo?=
 =?utf-8?B?NHZ1aVNYU0I4OFBzQ1NMUkVFbTAwbWtER0hWNlA5K2NyakNJUnd5NUcvaVJ2?=
 =?utf-8?B?ZUNrZUJ2WnVpL2pCMExkOFIxaDVXWEJnK2MwSUdGRTdCN0dkRU4xWEJCV0tH?=
 =?utf-8?B?ejlRZmxpQUZDODg5NjJSTnN3OVVCYWdOT2hVRHdTN25ReG1BdlhqcS92MS9W?=
 =?utf-8?B?aDVqQ21iYTdiRDJzSjFpdTR2UGNEWmlRcXRYc25OdlU5ZmJhbmdNZ2EzMGF2?=
 =?utf-8?B?a1N4M0NOOXRyLzhzRmVlUmV5Sll6WkhXWkxZM2FBNHhSbzlpNHBPSjhQRzdU?=
 =?utf-8?B?OXZBeFZJMWFnQXBUWXdYRi9LazYzRXlULytuLzh2Wk5sSnVDNXNtY1VrMW56?=
 =?utf-8?B?V29RZHNKcTVhRG1CbXhXQ2lnSXNNWGdIZHNPdEVvb2g2UEZLK0lseS9rcndD?=
 =?utf-8?B?UFg4WWFlM2tHWE56UGxkN1JIanhPWU5Qb0wyZ0drMDRwamZHRTNxMDVnYjNs?=
 =?utf-8?B?QmdpdmtWelRMdm5kd3RhNmhRcG9Oc2RuWjJkTHZZY0IwM2VCWGZuSit2UGZS?=
 =?utf-8?B?VCt0b0RKTXRrR1kza0dtb0hjL2IyWWJlTkVFcENJakpldEtiOTZJdVZUeVN1?=
 =?utf-8?B?UlNMd2htRldKWWc3V2UxM0g0Wnp1bTZkYVk2bE5icitWenliMUlkLzZ3YU9M?=
 =?utf-8?B?WXBneDBpQjByS1p6aUlJNUt4cHMvbjhkVDhlNWo2QW9IQUJBZHN3RCthMlJY?=
 =?utf-8?B?OTFOQTBSaHcxdXIrMVhZaEV4WjFIQjZPSG1CUHV6Niswa0ZNRnYxS2N1WVhi?=
 =?utf-8?B?ZlgxMXJVOUlXMEN3L1FSaDRwY1Zic2pxTVZ3NGwxS1Y3K09MYzNBZEVUa0N5?=
 =?utf-8?B?Nno5bitTRkY0alhJYVpHSUNsZFVUZlBEZjkyMDNMTTA3VTR4Y2ZYM0Qyd21a?=
 =?utf-8?B?eWF4NUY4RUlYbkpiZ01mMDJhTmw3QUhrS04ySUQyc0V1MURwUDN1bGwvMGR6?=
 =?utf-8?B?aUcvSVJOQzIwdzBwWUlFMVZWUFVxekZ1Zk9ML0RQZTR6SktRRXpKL0VOSHgz?=
 =?utf-8?B?S3duekZRV2oxU2w2aCs4Mm54RWFIZlR4WTE3S1RHU0EzRWxBV3o2QSs2Tzdu?=
 =?utf-8?B?RmpEeVU3dWdJbFlHL3pQazY0U21YQW5xK0NrTzFkbUg3cmRnL3RNRzBKdFc4?=
 =?utf-8?Q?neL7AA33O5hYhE5PHw8o2xUl2Li/PVds?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <F38F832948599E4E854DF109D0D69C12@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 279eef0d-87d1-48d0-779d-08da0cc9b3c2
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Mar 2022 12:36:06.9235
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Lg6jHSbk5JXlF5r92upiMJhMfYmd8K7pik7fySTCjVH1oYmk1cTbTP0YfEG2doFyEEkE75X1QowLE+402FjGybP+ZQhXpooMoyoUjFHk0ow=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR03MB4879
X-OriginatorOrg: citrix.com

T24gMjIvMDMvMjAyMiAyMDoyOCwgU3RlZmFubyBTdGFiZWxsaW5pIHdyb3RlOg0KPiBGcm9tOiBT
dGVmYW5vIFN0YWJlbGxpbmkgPHN0ZWZhbm8uc3RhYmVsbGluaUB4aWxpbnguY29tPg0KPg0KPiBU
aGUgZmlyc3QgMzIgYnl0ZXMgb2YgekltYWdlIGFyZSBOT1BzLiBXaGVuIENPTkZJR19FRkkgaXMg
ZW5hYmxlZCBpbiB0aGUNCj4ga2VybmVsLCBjZXJ0YWluIHZlcnNpb25zIG9mIExpbnV4IHdpbGwg
dXNlIGFuIFVOUFJFRElDQVRBQkxFIE5PUA0KPiBlbmNvZGluZywgc29tZXRpbWVzIHJlc3VsdGlu
ZyBpbiBhbiB1bmJvb3RhYmxlIGtlcm5lbC4gV2hldGhlciB0aGUNCj4gcmVzdWx0aW5nIGtlcm5l
bCBpcyBib290YWJsZSBvciBub3QgZGVwZW5kcyBvbiB0aGUgcHJvY2Vzc29yLiBTZWUgY29tbWl0
DQo+IGE5Mjg4MmE0ZDI3MCBpbiB0aGUgTGludXgga2VybmVsIGZvciBhbGwgdGhlIGRldGFpbHMu
DQo+DQo+IEFsbCBrZXJuZWwgcmVsZWFzZXMgc3RhcnRpbmcgZnJvbSBMaW51eCA0Ljkgd2l0aG91
dCBjb21taXQgYTkyODgyYTRkMjcwDQo+IGFyZSBhZmZlY3RlZC4NCj4NCj4gRm9ydHVuYXRlbHkg
dGhlcmUgaXMgYSBzaW1wbGUgd29ya2Fyb3VuZDogc2V0dGluZyB0aGUgIloiIGJpdCBpbiBDUFNS
DQo+IG1ha2UgaXQgc28gdGhvc2UgaW52YWxpZCBOT1AgaW5zdHJ1Y3Rpb25zIGFyZSBuZXZlciBl
eGVjdXRlZC4gVGhhdCBpcw0KPiBiZWNhdXNlIHRoZSBpbnN0cnVjdGlvbiBpcyBjb25kaXRpb25h
bCAobm90IGVxdWFsKS4gU28sIG9uIFFFTVUgYXQNCj4gbGVhc3QsIHRoZSBpbnN0cnVjdGlvbiB3
aWxsIGVuZCB1cCB0byBiZSBpZ25vcmVkIGFuZCBub3QgZ2VuZXJhdGUgYW4NCj4gZXhjZXB0aW9u
LiBTZXR0aW5nIHRoZSAiWiIgYml0IG1ha2VzIHRob3NlIGtlcm5lbCB2ZXJzaW9ucyBib290YWJs
ZQ0KPiBhZ2FpbiBhbmQgaXQgaXMgaGFybWxlc3MgaW4gdGhlIG90aGVyIGNhc2VzLg0KPg0KPiBT
aWduZWQtb2ZmLWJ5OiBTdGVmYW5vIFN0YWJlbGxpbmkgPHN0ZWZhbm8uc3RhYmVsbGluaUB4aWxp
bnguY29tPg0KDQpBIGRpc2N1c3Npb24gcmVsZXZhbnQgdG8gdGhpcyBjYW1lIHVwIHdpdGggWFRG
L0FSTS4NCg0KVGhlcmUgaXMgbm90IGN1cnJlbnRseSBhIHdyaXR0ZW4gQUJJIGZvciB0aGUgc3Rh
cnQgc3RhdGUgb2YgdkNQVXMsIGFuZA0KdGhlcmUgbmVlZHMgdG8gYmUuwqAgSSBrbm93IHg4NiBp
cyBpbiBhIHBvb3Igc2hhcGUgdG9vLCBidXQgd2UgZG8gYXQNCmxlYXN0IGhhdmUgc29tZSBzY3Jh
cHMgb2YgZG9jcyBsaXR0ZXJlZCBhcm91bmQgYW5kIGEgcGxhbiB0byB3cml0ZSBzb21lDQpwcm9w
ZXIgU3BoaW54IGRvY3MuDQoNCihBIHNlcGFyYXRlIGNvbnZlcnNhdGlvbiB3YXMgYWJvdXQgYm9v
dGluZyBmcm9tIHBsYWluIEVMRiBmaWxlcy7CoCBMaW51eA0KQVJNIFppbWFnZSBpcyBlbnRpcmVs
eSB1bmRvY3VtZW50ZWQgZm9yIDMyYml0LCBhbmQgZGlzY3Vzc2lvbnMgd2l0aCBSTUsNCnN1Z2dl
c3QgdGhhdCB3ZSd2ZSBnb3QgYnVncywgd2hpbGUgNjRiaXQgaGFzIGluc3VmZmljaWVudCBkb2N1
bWVudGF0aW9uDQp0byBkZW1vbnN0cmF0ZSB0aGF0IG91ciBsb2dpYyBpcyBjb3JyZWN0LikNCg0K
SW4gcGFydGljdWxhci4uLg0KDQo+IC0tLQ0KPiBDaGFuZ2VzIGluIHYyOg0KPiAtIGltcHJvdmUg
Y29tbWl0IG1lc3NhZ2UNCj4gLSBhZGQgaW4tY29kZSBjb21tZW50DQo+IC0gbW92ZSBQU1JfWiB0
byB0aGUgYmVnaW5uaW5nDQo+IC0tLQ0KPiAgeGVuL2luY2x1ZGUvcHVibGljL2FyY2gtYXJtLmgg
fCA4ICsrKysrKystDQo+ICAxIGZpbGUgY2hhbmdlZCwgNyBpbnNlcnRpb25zKCspLCAxIGRlbGV0
aW9uKC0pDQo+DQo+IGRpZmYgLS1naXQgYS94ZW4vaW5jbHVkZS9wdWJsaWMvYXJjaC1hcm0uaCBi
L3hlbi9pbmNsdWRlL3B1YmxpYy9hcmNoLWFybS5oDQo+IGluZGV4IDk0YjMxNTExZGQuLjgxY2Vl
OTVmMTQgMTAwNjQ0DQo+IC0tLSBhL3hlbi9pbmNsdWRlL3B1YmxpYy9hcmNoLWFybS5oDQo+ICsr
KyBiL3hlbi9pbmNsdWRlL3B1YmxpYy9hcmNoLWFybS5oDQo+IEBAIC0zNjEsNiArMzYxLDcgQEAg
dHlwZWRlZiB1aW50NjRfdCB4ZW5fY2FsbGJhY2tfdDsNCj4gICNkZWZpbmUgUFNSX0RCR19NQVNL
ICAgICgxPDw5KSAgICAgICAgLyogYXJtNjQ6IERlYnVnIEV4Y2VwdGlvbiBtYXNrICovDQo+ICAj
ZGVmaW5lIFBTUl9JVF9NQVNLICAgICAoMHgwNjAwZmMwMCkgIC8qIFRodW1iIElmLVRoZW4gTWFz
ayAqLw0KPiAgI2RlZmluZSBQU1JfSkFaRUxMRSAgICAgKDE8PDI0KSAgICAgICAvKiBKYXplbGxl
IE1vZGUgKi8NCj4gKyNkZWZpbmUgUFNSX1ogICAgICAgICAgICgxPDwzMCkgICAgICAgLyogWmVy
byBjb25kaXRpb24gZmxhZyAqLw0KPiAgDQo+ICAvKiAzMiBiaXQgbW9kZXMgKi8NCj4gICNkZWZp
bmUgUFNSX01PREVfVVNSIDB4MTANCj4gQEAgLTM4Myw3ICszODQsMTIgQEAgdHlwZWRlZiB1aW50
NjRfdCB4ZW5fY2FsbGJhY2tfdDsNCj4gICNkZWZpbmUgUFNSX01PREVfRUwxdCAweDA0DQo+ICAj
ZGVmaW5lIFBTUl9NT0RFX0VMMHQgMHgwMA0KPiAgDQo+IC0jZGVmaW5lIFBTUl9HVUVTVDMyX0lO
SVQgIChQU1JfQUJUX01BU0t8UFNSX0ZJUV9NQVNLfFBTUl9JUlFfTUFTS3xQU1JfTU9ERV9TVkMp
DQo+ICsvKg0KPiArICogV2Ugc2V0IFBTUl9aIHRvIGJlIGFibGUgdG8gYm9vdCBMaW51eCBrZXJu
ZWwgdmVyc2lvbnMgd2l0aCBhbiBpbnZhbGlkDQo+ICsgKiBlbmNvZGluZyBvZiB0aGUgZmlyc3Qg
OCBOT1AgaW5zdHJ1Y3Rpb25zLiBTZWUgY29tbWl0IGE5Mjg4MmE0ZDI3MCBpbg0KPiArICogTGlu
dXguDQo+ICsgKi8NCj4gKyNkZWZpbmUgUFNSX0dVRVNUMzJfSU5JVCAgKFBTUl9afFBTUl9BQlRf
TUFTS3xQU1JfRklRX01BU0t8UFNSX0lSUV9NQVNLfFBTUl9NT0RFX1NWQykNCg0KLi4uIHRoaXMg
Y2hhbmdlIGlzIGVpdGhlciBicmVha2luZyB0aGUgQUJJLCBvciBkZW1vbnN0cmF0ZXMgdGhhdCB0
aGVzZQ0KdmFsdWVzIG11c3Qgbm90IGJlIGluIGEgcHVibGljIGhlYWRlciBmaWxlIHRvIGJlZ2lu
IHdpdGguDQoNCn5BbmRyZXcNCg==

