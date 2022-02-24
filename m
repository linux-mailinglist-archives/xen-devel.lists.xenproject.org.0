Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 65ABC4C39D9
	for <lists+xen-devel@lfdr.de>; Fri, 25 Feb 2022 00:49:21 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.278680.476027 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nNNqn-0000qK-VY; Thu, 24 Feb 2022 23:48:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 278680.476027; Thu, 24 Feb 2022 23:48:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nNNqn-0000ns-SU; Thu, 24 Feb 2022 23:48:45 +0000
Received: by outflank-mailman (input) for mailman id 278680;
 Thu, 24 Feb 2022 23:48:44 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=oTFz=TH=citrix.com=prvs=047b345d9=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1nNNql-0000nm-W9
 for xen-devel@lists.xenproject.org; Thu, 24 Feb 2022 23:48:44 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4a76fd1e-95cc-11ec-8539-5f4723681683;
 Fri, 25 Feb 2022 00:48:41 +0100 (CET)
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
X-Inumbo-ID: 4a76fd1e-95cc-11ec-8539-5f4723681683
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1645746521;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=X+XSqHV7lU0CNkmac3rR6tHMGH3mlOEN46r4Dp2ok3M=;
  b=bjDxiy7sOwPun70BszSeE1gVKMKoizyL/izOFEeeZtcB1vnojO61Bprw
   8IcPjnF25G6a8S8kPlmMA15gqTEYj0VB79QsEG3oS0w8adMTq/cZwHxeI
   0L7zL9g9QGtLn2AHLPVSxMSQ2J9xppviXvAO6uE0VDHTd+N2Jt4ApXYMv
   A=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
X-SBRS: 5.1
X-MesageID: 65362840
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:fIeCEqhBuCZ7LaLARo6fdrGkX161fRAKZh0ujC45NGQN5FlHY01je
 htvXGiCbKmOYjanc493YYXkpBxTup+Ez9FmSgJk+SFhFX4b9cadCdqndUqhZCn6wu8v7a5EA
 2fyTvGacajYm1eF/k/F3oDJ9CU6jefSLlbFILas1hpZHGeIcw98z0M78wIFqtQw24LhWVnR4
 YiaT/D3YzdJ5RYlagr41IrbwP9flKyaVOQw5wFWiVhj5TcyplFNZH4tDfjZw0jQG+G4KtWSV
 efbpIxVy0uCl/sb5nFJpZ6gGqECaua60QFjERO6UYD66vRJjnRaPqrWqJPwwKqY4tmEt4kZ9
 TlDiXC/YQAwEqPLp/0laQQGOQ4iDOpJwJTqB1Hq5KR/z2WeG5ft6/BnDUVwNowE4OdnR2pJ8
 JT0KhhUMErF3bjvhuvmFK883azPL+GyVG8bklhmwSvUErANRpfbTr+RzdRZwC0xloZFGvO2i
 88xN2c0Mk6QP0Un1lE/Jbwludq1iX/FTjRBsGieq/cR7VaDw1kkuFTqGIWMIYHbLSlPpW6Ho
 krW8mK/BQsVXPSPxDzA/n+yi+vnmSLgRJlUBLC+7uRtglCY2ioUEhJ+fVmxrOS9i0W+c8lCM
 EFS8S0rxZXe72TyEIO7BUfh5ifZ4FhMALK8DtHW9imK04ba5DmAPlIZEBRuNO1hu/cdaBoDg
 wrhc8zSORRjt7icSHS4/7iSrC+vNSV9EVLudRPoXiNevYC9/dhbYgbnC486TfXr1oGd9STYn
 mjSxBXSkYn/miLiO0+T2VncywyhqZHSJuLezlWGBzn1hu+ViWPMWmBJ1bQ5xasYRGp6ZgPY1
 JThpyR4xLpQZX1qvHbQKNjh5Jnzu5643MT02DaD5aUJ+TW34GKEdotN+jx4L0oBGp9aJWK3P
 BWP41gOvMQ70J6WgUlfOdzZ5yMCl/WIKDgYfqqMMoomjmZZLmdrAx2ClWbPhjuwwSDAYIk0O
 IuBcNbEMJrpIf8P8dZCfM9EieVD7nlnnQv7HMmnpzz6gev2TCPEEt8tbQrRBt3VGYvZ+W05B
 f4EbJDUo/ieOcWjChTqHXk7dghbfSBmXsmt86S6tIere2JbJY3oMNeIqZsJcI15haVF0ODO+
 3C2QEhDz1Tjw3bALG23hrpLMdsDgb4XQaoHABER
IronPort-HdrOrdr: A9a23:GWfQ7aM5XB/YJMBcT2H155DYdb4zR+YMi2TDiHoedfUFSKOlfp
 6V8MjzjSWE9Ar4WBkb6LS90DHpewKTyXcH2/hvAV7EZnimhILIFvAs0WKG+Vzd8kLFh5ZgPM
 tbAspD4ZjLfCVHZKXBkUmF+rQbsaK6GcmT7I+0pRoMPGJXguNbnn1E426gYxdLrWJ9dP0E/e
 +nl7N6Tk2bCBIqh6qAdxw4dtmGg+eOuIPtYBYACRJiwhKJlymU5LnzFAXd9gsCUhtUqI1Ssl
 Ttokjc3OGOovu7whjT2yv49JJNgubszdNFGYilltUVEDPxkQylDb4RGYFq/QpF5d1H2mxa1+
 UkkC1QefibLEmhJ11dlCGdnzUIFgxes0MKh2Xo2kcL6vaJOg7SQ/Ax9L6xNCGptnbI9esMo5
 6ilQiixupqJAKFkyLn69fSURZ20kKyvHo5iOYWy2dSSI0EddZq3MYiFW5uYd899RjBmcsa+S
 hVfbbhzecTdUnfY2HSv2FpztDpVnMvHg2eSkxHvsCOyTBZkH1w0kNdnaUk7zs93YN4T4MB6/
 XPM6xumr0LRsgKbbhlDONERcesEGTCTR/FLWrXK1X6E6MMPW7LtvfMkfgIzfDvfIZNwIo5mZ
 zHXl8dvWkue1j2AcnLx5FP+gClehT1Yd0s8LAp23FUgMyIeFOwC1zwdLkHqbrVn8ki
X-IronPort-AV: E=Sophos;i="5.90,134,1643691600"; 
   d="scan'208";a="65362840"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lAmivvg0V4n2AwPU9ATZ4vYVXeFp74HCRmTPyRiXyVrbqRTnXRO+/1DVjBSAyQoQNydhhuFet5Ka2PK0RPQffgQZn0pWPQ1+Sx07Zk55P8sl/SyqbAHNgETr0yOv0PrdzGyjJbjfrD+D4K8vRVWBIkgjbjUFPXRe+x3ikM9h9KfsVFkY36xnhsXagIAsmHb7w3+KHct1t3kKcgi17M78i/UD1u5rDrG/kiHUcag+nel+HgoHs7i3qsgoQCEdKFveRtUhtIrR99ZkCn6qGqvoy16XVkeacQ2KCMj4ilqv8Vs4/IjfzX7iJtSnFhJaDsa0ZEqh+rna0nP4CuwHv8if7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=X+XSqHV7lU0CNkmac3rR6tHMGH3mlOEN46r4Dp2ok3M=;
 b=Z8KyVfB05fT9qHP77x3ijUxHHVXG/qbLn+k29r6NAQpHnywVLEV/Q2wL2bZfFbllh7Gcbs0vFl59lBo78bsQCtCMPkWdEbCXl6CZqxB7zF1biTkwJ7dMJy/ncsmHfYWwQY/UeeaRR4BUAzqtgEshINLcn5p7ekwlKY9OAKA7mOVM+ZvwWa8htMPDwv/onV60qF322RMDnDQTDbkMM5jeSEoAf0cXpFZJTW8CXdcT2+j9Atdw9iyqDkSul6G8ViewjO9W2A87Yl0SJGCtzxj74CYuj8Ench0VVdFMn9zQLA5a8e7T12QiWtDr0HzuN4BEGafE+Z0YLNPano7jd8OJfA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=X+XSqHV7lU0CNkmac3rR6tHMGH3mlOEN46r4Dp2ok3M=;
 b=GM+4TeVMGzH81+d7wsM9btJ0wT4e1QqdXGeMCEz1uiKoXP5X7UZzRUCbesUw579jf3OLoP7p+1WqQyGehc+dxvC53wte36d9P5938tFd3lBdk8EJsWR/nn3mNl8tVGJlfKjnSL2OaOc1efX3a6E/zXb9dAHPJFWTfHnrYIojDYE=
From: Andrew Cooper <Andrew.Cooper3@citrix.com>
To: Jan Beulich <jbeulich@suse.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Wei Liu <wl@xen.org>, Roger Pau Monne <roger.pau@citrix.com>
Subject: Re: [PATCH] x86: make embedded endbr64 check compatible with older
 GNU grep
Thread-Topic: [PATCH] x86: make embedded endbr64 check compatible with older
 GNU grep
Thread-Index: AQHYKWdr96DvHtmiCE6n5nuoqf1KFayifeMAgAAQ3YCAANCCAA==
Date: Thu, 24 Feb 2022 23:48:34 +0000
Message-ID: <609a06a9-20ab-4315-0ffa-0b0e76d28c8e@citrix.com>
References: <ceaae3c8-0c35-efc1-c7bc-f44364ce29e4@suse.com>
 <cced4ec0-f522-9273-b10c-0e652bcc5aa3@citrix.com>
 <d6392c5c-b70d-6efd-f49e-567e703d64a3@citrix.com>
In-Reply-To: <d6392c5c-b70d-6efd-f49e-567e703d64a3@citrix.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 89c808d3-bce1-40f5-07fb-08d9f7f02bb0
x-ms-traffictypediagnostic: BN7PR03MB4340:EE_
x-microsoft-antispam-prvs: <BN7PR03MB4340F208DFF0E47DF5122725BA3D9@BN7PR03MB4340.namprd03.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: QYb6AKOTAdvTsLX1Muzmq5G4azGoeGnekjQeYn0s6LMjpGZxYWWXV/Al/F00VPhzEupFsrcNtuHQ8gmWhx3V0y2HAxRZOu3lFK96wR/f0+Id5tTm1yfSnXyPm8HDwuEnYVDz86RwA7pxdFSk08JmcaNQrH06Tnvkt+w2+gySHVeE0S/GHHJJFCrSqCe8Ok6gdwyzlzHc+ZVd5THliNl59nc/Eo2TvaNzXZFPk4zErhA4qcO/eKDFG2yCUEUf3+csHpUU+3Y04DJqde9HnEG/joS6k5VFvWsw8n5kfkzsQdBZKypQlV/tcbfuZNWGdpBAoX0fx3+XTqNra1D2cz04w8L6djPHoqMKHaCF4e1KO5AX021MRBFECIkqUMRQy7qgg66f5fGfO4ukjfB7qdrpB/u4BFCDTrtcfx95DjQgsB8PvH3URmq0PxZK9PVDjcXFWrWi+AL+ID5534TI4xt5z1Vbc3BBq3pXJ4TAQHk7nBbh+Bx1bRMSzK//V8al943CY0NPohVIzA7/e9pPu8Bl3yDWdIa45f6t3fDTvUu1Ma5teDrXnj0rlFsYnQdxT0c7w74120YPiovqcOokEAJHjHO2okLQVwG5ApVfNX3fKtpB4pQZmXoQ+KH9kXRQSIipaeWn1ZAUSYl2GchU6qVfCzDKgkVeEpAlRdR6+7gJr6GnXleQAvKxmW67I0xYihRwid2UeOH6JsTLdOwcFumpiiPcOwDZj1HlbNrBKjhIBVsmwrZiaZInPBo4HnC7oqDzDiBR9KYIrpxDhL2UFu+E21JuVL+q1OyzFxIe+WvPC7pypl+I/PGoA1GFWZm6QfrEKBDGkhQPLh7Tg+etE0XI8UFC0fInse0bwhzgwbXxbjK3da/spSMLuD8TKzYTg/UBAFFCKzbGNmXdnTAG1abZUg==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(66946007)(36756003)(38100700002)(2616005)(6512007)(186003)(31686004)(76116006)(91956017)(82960400001)(122000001)(26005)(107886003)(66446008)(64756008)(66476007)(4326008)(8676002)(66556008)(2906002)(316002)(54906003)(110136005)(4744005)(31696002)(8936002)(53546011)(6506007)(86362001)(38070700005)(966005)(508600001)(5660300002)(6486002)(71200400001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?RVJHKy93THJsYWJqSlJvSXh2cEtQa1pVMXlaMmtvVlF2RVZUVTd3WjhxWHpU?=
 =?utf-8?B?ZXEvMG1PUThZS2pLL1pVZ2hyR0ZjRVZpRnhhUzQwQmRVaDBML1o2dDVFRWpa?=
 =?utf-8?B?ZUhRSkd2WlloMEtkcmIzU3pQV3pseEVuSVMzWXJBWTk3blNEenBjQ3ZZT3pO?=
 =?utf-8?B?dHUyVkxUUTNTZkl5RmFqVi82RTNIenRleU05RURJTHhaQVZTOUdRaWZZSHM1?=
 =?utf-8?B?S1IvU0RuVm1vdmd1YWhoT0pYb2psRlJsbzBMRkZpNDRWaUFxOUtTWGZWM0M5?=
 =?utf-8?B?bWZBRnF5Q2NoOU05V0Q0dW11QURwU3g4MWtzMzdqN2p6ZmVqL2xTYkVTOE1X?=
 =?utf-8?B?YllGbTkrMXk3R2ZRREpVYm14QWdHcXBpUldpaEgybTZBRW5TczlHMHcxbzRV?=
 =?utf-8?B?SWNRUW9BdDRGTHUvY0lEM2VtZGtnbStSZzdXVDJSM1c0c1d5WFJEaTJCK2Rw?=
 =?utf-8?B?dXFRSmFYUnlwYnBrdXZTUXJEc2lPYjMxb0xvdmlkVUk0TDRwZWJZWXU2dm9a?=
 =?utf-8?B?Z3Z2QmRnUFhUUnZQaGROeWt6bGNkQUNNMk02R3pUMjlMVHVhZnczejhrY2Nz?=
 =?utf-8?B?V2RMRVNkN0tMZUNnSWhZN1NCeS9ITVN4WXYxZXFFL0JFcHg3bW5IeTNmN2Vh?=
 =?utf-8?B?OEJMU0tqbmI4ZFFLQ01CYlRHTFhvZUpqbFIrR3lycENub1FmV0t5aDdsdHhE?=
 =?utf-8?B?Z2RielZCZUNYSTJiUmZpVXhuRm40c2xnamdhUnBJVE5WYXBhWFNVMlZ2Sm1t?=
 =?utf-8?B?ZUNGKzFpZjBuanhkWWFXWWVWUXhjVk9mQ1dYbjRTTzNXb1E5NFBWMEtKYkVm?=
 =?utf-8?B?MUlWS0wvaGRIL0xtVVI1TDEyRU9jQWk3RHM0RlBMYmFkV2hrdEhXMkdtejdW?=
 =?utf-8?B?azRJSTZBNkNFSk1XYWVQM0xFQTBLZDV3bUczaXlJYnNyL2NhT2l4NEV0RytM?=
 =?utf-8?B?azExT1lJS0p0WnJrZ3lKTjhEZG1Ec2RBcE9HcVVGWk50d0pWdjdieC9ncWxs?=
 =?utf-8?B?RjQ5dUVjYW80L3JYRld1aVFVRUZEVFIxU3Vibm9rU05VUkVPNDZkUTkrQUt4?=
 =?utf-8?B?RkZOcFJETGI3WHpCdG5XQ1JCa0VNS2RKTisvTitqYldSS21vNEcwOFVKN2lq?=
 =?utf-8?B?M2lVZ0NqOWs4bjZacGpmdVNKdk85ZndzY1RJWEpqZHV5RWJkQ212ZXZ5OFVk?=
 =?utf-8?B?dFRvUSt4eTFIVUFHL1pqMnFKOWJDVnBrdTVwdVBpeUp1UHlkeHZYRGQ4VThG?=
 =?utf-8?B?UjJyR21JOTNZS3dxQStqLytvQ0xQNGlsemNWMGh4cWlZS082Y0F6eGpTb2xj?=
 =?utf-8?B?cnZ1MGlJMlRqdExsNUd6VndIdDc5K25pL1lWRFhnMkRZRE0veWp4TlNBNktY?=
 =?utf-8?B?V2R1ejBFcm5CNDJ0T0xjbWdsME1MTnl4TjJCUXl0T3pHQmNYWEV6NVl3M3kr?=
 =?utf-8?B?SzVvekdKWjV3S2IyZk9mMHhkTDI2WlorV0ZEM2phemZFZE1rWkovc3p1WWEx?=
 =?utf-8?B?VUtrWGN0WFZDdlUveXFSZkJ5YmYzeVJlWVBQOVJDNmlacTBaOTd6Nmg0VWY1?=
 =?utf-8?B?ci9oMkcxTzZPaDQyT2s0RG40c3NzL1laNUhoNDd3NzhiRzBudjhUZFgwa2Zl?=
 =?utf-8?B?T3FLa2szRVlqaHlaTHY1L1hHVkcyMjYrbTFrZFBJeC9USTB3RGpCdlZTNlR4?=
 =?utf-8?B?US96SXRRRG9aT3IwT1Z3VEpIenJxcDBaMnRTN05ZOEVRY0E3RUhEUUFueVBt?=
 =?utf-8?B?SlhlbmJtTSs3amdjUm9EMDZqQjNJYzU3MDY5Y25WaXppcGxoUzVIUUNtdEZw?=
 =?utf-8?B?L0gwUHRrWVJQQnlRSGh2cVZPcm5DQWE1T2djMGNSTm5xR2pleUd6RXl2Rkhy?=
 =?utf-8?B?WWpSWndCS3hVN2kzY2xaeGsyTXArbVJVMkFSNjlMZVVwNzBhYUdiM0l3eDlL?=
 =?utf-8?B?VlBUOUsyb1NtWTd4clhCVVZWRlQ4cVl6c2EwQ1o4L1FoWDUxVjdidnA3b0ls?=
 =?utf-8?B?V21VaU4xdWxpSzZqSWtCdFlJOVRWVWpOenhiRHB3OUlzblM2N0tkTkFQd3g1?=
 =?utf-8?B?YmZ3WDBsbXY3ZE4rZU5iMUZ5WG9mcVNVelRJSUJkR0xqT1diRGxUZGZSenF2?=
 =?utf-8?B?bk93dzZmNmhhOElEOS9pWUhxYlYydmt5Z3pqSGdwVVZPdWlzL0F0L2QvU1Uz?=
 =?utf-8?B?TU1qMEFhRGdTVnFWS0hGMnpCeUpRWFRvNmdEUEVpZnRBK1dUZEVBbys4bDAw?=
 =?utf-8?B?eE1HeXJHYVpyRHZuODJybDVnTHhBPT0=?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <64154F183EDC2040AB1BD66FA1354DE2@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 89c808d3-bce1-40f5-07fb-08d9f7f02bb0
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Feb 2022 23:48:34.5398
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: cRyrgV9f9ldi9HkORczU2qiFr+EjJvDokTAdw18fpBh0wCO98WM3H9D+5mu8ZrTSDVjQxsnMd9GNVQP4+1nWXOlpOb/Q+39yN7Xs/ifCrIQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN7PR03MB4340
X-OriginatorOrg: citrix.com

T24gMjQvMDIvMjAyMiAxMToyMiwgQW5kcmV3IENvb3BlciB3cm90ZToNCj4gT24gMjQvMDIvMjAy
MiAxMDoyMSwgQW5kcmV3IENvb3BlciB3cm90ZToNCj4+IE9uIDI0LzAyLzIwMjIgMTA6MTQsIEph
biBCZXVsaWNoIHdyb3RlOg0KPj4+IFdpdGggdmVyc2lvbiAyLjcgSSdtIG9ic2VydmluZyBzdXBw
b3J0IGZvciBiaW5hcnkgc2VhcmNoZXMsIGJ1dA0KPj4+IHVucmVsaWFibGUgcmVzdWx0czogT25s
eSBhIHN1YnNldCBvZiB0aGUgc3VwcG9zZWQgbWF0Y2hlcyBpcyBhY3R1YWxseQ0KPj4+IHJlcG9y
dGVkOyBmb3Igb3VyIHBhdHRlcm4gSSd2ZSBuZXZlciBvYnNlcnZlZCBhbnkgbWF0Y2guIFRoaXMg
c2FtZQ0KPj4+IHZlcnNpb24gd29ya3MgZmluZSB3aGVuIGhhbmRpbmcgaXQgYSBQZXJsIHJlZ2V4
cCB1c2luZyBoZXggb3Igb2N0YWwNCj4+PiBlc2NhcGVzLiBQcm9iZSBmb3Igc3VwcG9ydCBvZiAt
UCBhbmQgcHJlZmVyIHRoYXQgb3ZlciB0aGUgb3JpZ2luYWwNCj4+PiBhcHByb2FjaC4NCj4+Pg0K
Pj4+IEZpeGVzOiA0ZDAzNzQyNWRjY2YgKCJ4ODY6IEJ1aWxkIGNoZWNrIGZvciBlbWJlZGRlZCBl
bmRicjY0IGluc3RydWN0aW9ucyIpDQo+Pj4gU2lnbmVkLW9mZi1ieTogSmFuIEJldWxpY2ggPGpi
ZXVsaWNoQHN1c2UuY29tPg0KPj4gTG9va3MgcGxhdXNpYmxlLsKgIFRlbnRhdGl2ZSBhY2ssIGJ1
dCB0aGlzIGRlZmluaXRlbHkgbmVlZHMgYSBmdWxsIHJ1bg0KPj4gdGhyb3VnaCBDSSBiZWZvcmUg
Y29tbWl0dGluZy7CoCBMZXQgbWUga2ljayBzb21ldGhpbmcgb2ZmLg0KPiBTdGFydGVkIG5vdzoN
Cj4NCj4gaHR0cHM6Ly9naXRsYWIuY29tL3hlbi1wcm9qZWN0L3Blb3BsZS9hbmR5aGhwL3hlbi8t
L3BpcGVsaW5lcy80Nzg1MDg0NTkNCj4gaHR0cHM6Ly9jaXJydXMtY2kuY29tL2J1aWxkLzYyNTUx
OTYwMTg4MzU0NTYNCg0KRXZlcnl0aGluZyBpcyBncmVlbi7CoCBHb29kIHRvIGNvbW1pdC4NCg0K
QWNrZWQtYnk6IEFuZHJldyBDb29wZXIgPGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+DQoNCn5B
bmRyZXcNCg==

