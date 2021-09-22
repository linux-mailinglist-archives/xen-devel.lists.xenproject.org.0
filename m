Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EFE55414553
	for <lists+xen-devel@lfdr.de>; Wed, 22 Sep 2021 11:38:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.192335.342736 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mSyhn-0003N4-0q; Wed, 22 Sep 2021 09:38:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 192335.342736; Wed, 22 Sep 2021 09:38:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mSyhm-0003Jw-SZ; Wed, 22 Sep 2021 09:38:18 +0000
Received: by outflank-mailman (input) for mailman id 192335;
 Wed, 22 Sep 2021 09:38:18 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/3we=OM=citrix.com=Andrew.Cooper3@srs-us1.protection.inumbo.net>)
 id 1mSyhm-0003Jo-3I
 for xen-devel@lists.xenproject.org; Wed, 22 Sep 2021 09:38:18 +0000
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id d30a9dfc-fca7-441b-b1fc-6f4ceed8d2b3;
 Wed, 22 Sep 2021 09:38:17 +0000 (UTC)
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
X-Inumbo-ID: d30a9dfc-fca7-441b-b1fc-6f4ceed8d2b3
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1632303496;
  h=to:cc:references:from:subject:message-id:date:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=DeFHLfT6FhtD/+P5O/dO2BdBq0jqEifzE5pQ0jwkd68=;
  b=VnXQNg9xE4ag0UoIAP6eYkIz5iXcKUhWiFosEcy0F/Zo6LEalrEOQYsg
   KkAC52iS75O4xrK+Wa86Io35y5YaKZzeWwSiigl3MSDpWMZujMk3ZlDo6
   ZfLDj3aYK5cwtjmVtMPpBrz3KxDuBWJ8eBAQ11YkCl8lVv5SY/I7KQQPv
   k=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: FPdGzB7/LiMCCPAgm3RytwewjDHeCDsqwZbU138ECICK8asHPlFc75wd7ZOFRb2fppwamOkAFF
 5E2+7IgxDarqHCTYCK+aTQTxHbAapdUcAxtd/CxQkK7jFOvyS2vEj+6xhsA2Gmu6+tn8VydgE/
 Sd/YlJUI9SINH7vSke3yFk2J03Gn08fnNjlgNlQ/2MupqZRZqJSa3iZqE5XMGPkpBKzlwbUTR8
 DbYfRzFYRTNpi4A1/7yYPuok+VAamVbQ2CDFgC8jPbPDdfKF4gjFhVwvavlmoJKs1XDkYvi8Yo
 VF5E7a1GOT9bjUaZiK6etzRU
X-SBRS: 5.1
X-MesageID: 53320157
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:6+ro1qJ0DfpJeFBgFE+RZ5IlxSXFcZb7ZxGr2PjKsXjdYENS0mdRz
 GUeC2yAO/6OYmekc993btm09EpXv8OEyNBgT1dlqX01Q3x08seUXt7xwmUcns+xwm8vaGo9s
 q3yv/GZdJhcokcxIn5BC5C5xZVG/fjgqoHUVaiUZ0ideSc+EH140UM5wbZj6mJVqYPR7z2l6
 IuaT/L3YDdJ6xYsWo7Dw/vewP/HlK2aVAIw5jTSV9gS1LPtvyB94KYkDbOwNxPFrrx8RYZWc
 QphIIaRpQs19z91Yj+sfy2SnkciGtY+NiDW4pZatjTLbrGvaUXe345iXMfwZ3u7hB2FhNBhy
 u9VmqCcWFlxNK7thbkSTghxRnQW0a1uoNcrIFC6uM2XiUbHb2Ht07NlC0Re0Y8wo7gtRzsUr
 LpBdW5LPkvra+GemdpXTsFFgMg5IdatF4QYonx6lhnSDOo8QICFSKLPjTNd9Gpr3ZoWRKuBD
 yYfQR1hPFecTzFGAXg0Mag9wMjxj33+LSIN/Tp5ooJoujOOnWSdyoPFL979atGMA8JPkS6wp
 H/C/mn/KgEXMpqY0zXt2mm3mubFkCf/WYQTPL617PhnhBuU3GN7IB8cWEa/oPK5olWjQN8ZI
 EsRkgIvsqoa5EGtVsP6XRCzvDiDpBF0c99dFeIq9SmGy7GS/h6UAG5CQzJcAPQ2uclzSTE02
 1uhm9LyGScpoLCTUWia9LqfsXW1Iyd9BVEFYSgIXA4U+e7JqYs4jg/MZtt7GavzhdrwcRn8z
 TmFoyk5g7Q7ltMQ2uOw+lWvqzCjvJ/SVSYu+x7aGGmi62tEiJWNPtLyrwKBtLAZcdjfHgLpU
 GU4d9a24PsOHZO3jAOxbPRTRLuqxuvYPyDNqAs6d3U+zAhB60JPbKgJvmokfRc3bp5dEdP6S
 BSM4lIKvfe/KFPvNPUuMtzrU6zG2IC9TYyNaxzCUjZZjnGdnie89SdybAa722n3mSDAeoluZ
 M/GLa5A4ZscYJmLLQZapc9GitfHJQhknAs/oKwXKDz9itKjiIa9E+ttDbd3RrlRAFm4TODpz
 jqiH5HSl0U3vBLCjtn/rtdIcAFiwYkTLpHqsc1HHtO+zv5dMDh5UZf5mOp5E6Q8xvg9vrqYr
 xmVBx4DoHKi1CKvFOl/Qi06AF8Zdc0k9ixT0O1FFQvA5kXPlq71vf9DKMNoLed4nAGhpNYtJ
 8Q4lwy7Kq0nYhzM+igHbIm7q4pndR+xghmJMTbjaz86F6OMjSSQkjM9VgewpiQIEAStss4y/
 ++p2g/BGMJRTAV+FsfGLvmoygrp73QanetzWWrOI8VSJxqwoNQ7dXSpg69lOdwIJDXC2iCei
 1ScDyAHqLSfuIQy6tTI2/yJ9t/7D+tkE0NGNGDH9rLqZzLC92+uzNYYAuaFdDzQTk3u/6Cma
 bkHxv3wKqRfzl1Lr5B9A/Bgyqdnv4njoLpTzwJFGnTXbgv0VuM8cyfehcQW7/9D3L5UvweyS
 3mjwNgCNOXbIt7hHX4QOBEhMraJ28YLl2SA9v8yOkj7unN6peLVTUVIMhCQoyVBN78pYpg9y
 OIstcNKuQyyjh0mboSPgixOrjneK3UBV+Mst40AAZ+tgQ0ukwkQbZvZAy7wwZeOd9QTbRV6f
 m7K3PLP1+ZG207PU3svDnycj+NSiKMHtA1O0FJfdU+CncDIh6Nv0RBcmdjtot+5EvmTPzpPB
 1VW
IronPort-HdrOrdr: A9a23:zwdNDKgoMsEa4NnRvBBeLxGZmnBQX0113DAbv31ZSRFFG/FwyP
 rAoB1L73PJYWgqNU3I+ergBEGBKUmskKKdkrNhQotKOzOWxFdATbsSkLcKpgePJ8SQzJ8k6U
 4NSdkYNDS0NykBsS+Y2njJLz9D+qj/zEnAv463pB0MPGIaGJ2IrT0JbjpzencGNTWubqBJcq
 Z0iPA3xQZINU5nFfhSURI+Lpb+TpDw5d7bSC9DIyRixBiFjDuu5rK/Ox+E3i0GWzcK5bs562
 DKnyHw+63m6piAu1Hh/l6Wy64TtMrqy9NFCsDJos8JKg/0ggLtQIh6QbWNsB08venqwlc3l9
 vnpQsmIq1ImjzsV1DwhSGo9xjr0T4o5XOn4ViEgUH7qci8fz4+A9opv/MTTjLpr24b+P1s2q
 NC2GyU87BNCwnboSj779/UEzl3i0uduxMZ4K0upk0adbFbRK5arIQZ8k8QOowHBjjG5IcuF/
 QrJN3A5cxRbUiRYxnizylSKeSXLzEO9yq9Mww/UpT/6UkQoJk59TpY+CUnpAZDyHpnIKM0od
 gtMcxT5flzp4EtHPtA7Epoe7rBNoX3e2O4DIulGyWvKEg2AQO+l3fJ2sRA2AiLQu1D8HJgou
 WNbLtn3VRCDX4GT/f+hKF2zg==
X-IronPort-AV: E=Sophos;i="5.85,313,1624334400"; 
   d="scan'208";a="53320157"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YkFg648Oj43vv0Slrd2ZFmn3JVLLt6o5j+eDUs8GIQ26+Kb4AE4pCQBBAjsU9WCxjD9yqWBl/noKZa9DjKNQ40HVjXUu2OEgWs6pe3r4fnBKrwJIlEzBaHRqrh5hcZ4+Dug4YW6+dGqQRAD1aV7qJtf3lCHzeOlN/E5aVltw0N4pq/SM+jwdwNg77c2d0iQBZtIwMtMToT0how0MwZhU+51sReWjVRuGbXn5ci7dw8qHEZ6LeTcTfCHM45Ki36JnJKJBzkbu9BZY2CN4eJKpAYi6m7heKBIHr/th77QIFPuH/HrWoYv2UrMo6MpbIaMtaYMgj3BVIH4HXSb91bFhgA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=DeFHLfT6FhtD/+P5O/dO2BdBq0jqEifzE5pQ0jwkd68=;
 b=LU3rUCheTRMu6bPcFID90s+z1IBLb0BOFagHvIT/AJAjw1hZHUswpDfSMBiatH+vRPwfmvirAsuDbJr0AZIIGbKRQP2bNMA04QVZd4a+YlJLDxMYZ7NZ+ck4nx1IRzZZYnJLEfLH4453X7IoYkACNKVR88xa3y9VEJ/P8SGaHDDUtEBJ/IaPTuUmyrMQQ2uQHT9OrZtmoR2PKQ1eiool7VGiUnqtJpUUG7F3l7I3HNIuNseqojqLhwKLtC9LiJMN6VoVfPQWsRwNYMxTQEBPTxv224LykLVcKDTZJTWdlT49Xd5HfCilacqL9i+QcGvzEFHF+EBgCHxZgBwdl+HRAQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DeFHLfT6FhtD/+P5O/dO2BdBq0jqEifzE5pQ0jwkd68=;
 b=qyfAXl3yMuz2ZOKfoS+rsvRbPXlPI54JNQe34yS8n3Gzt9NlX/d5O33y+YsbgsCLkWiWwkmg00thKEurEvv3wUHFJ+ITDcOsyd7iXbehGwdwX/xyZ6SJfInKunHpZPTSu5vgDXcXBwf7Cfcwy0hzap3QFU2/pugKCWFmYhebUx0=
To: Jan Beulich <jbeulich@suse.com>
CC: George Dunlap <George.Dunlap@eu.citrix.com>, Ian Jackson
	<iwj@xenproject.org>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu
	<wl@xen.org>, Julien Grall <julien@xen.org>, Dario Faggioli
	<dfaggioli@suse.com>, Juergen Gross <jgross@suse.com>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>, Meng Xu <mengxu@cis.upenn.edu>, Xen-devel
	<xen-devel@lists.xenproject.org>
References: <20210920172529.24932-1-andrew.cooper3@citrix.com>
 <2bd51843-de50-d442-dd5f-7fcc340c3f26@citrix.com>
 <c56b991c-d9cb-0fbf-a29a-6bcd60b09d58@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH v2.1 RFC 17/12] xen/trace: Drop cycles parameter
Message-ID: <47ac9e5b-abed-0201-14bf-e7ea2cd22508@citrix.com>
Date: Wed, 22 Sep 2021 10:38:06 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <c56b991c-d9cb-0fbf-a29a-6bcd60b09d58@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Content-Language: en-GB
X-ClientProxiedBy: LO2P123CA0085.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:138::18) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 62744f2c-3066-44bb-9b48-08d97dacb29e
X-MS-TrafficTypeDiagnostic: BYAPR03MB4549:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BYAPR03MB4549035336089FB5043A1593BAA29@BYAPR03MB4549.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 5h7A+YXiaFy5gq61mlrsh4I2chp72ofKZqcVpjFc6w2IkFiEcz5+W/NN6ucdSjo3vXdAHXiz5wrGgt/QFL8p6yeZ4aHadMuc7CszDeyn47o4wIAJmoHAdeQrvDDSYs85JRahjGhVrFR+zmjYMJhuxSmmrkR8uIHg6S7ZVRud+5vCBxaNr1ame2Zn28iQiifvYs/R5Ia5pfKbZZc2wNDk/j2Cj5y7py9B/QOPr1ZvkaaXLQ5xPMNIDEGz1e8GxoOJdpTvQyowvbLPim/gFlh2vUD8lkf4amI8hhBH7ZjzNYu/eanZ6NaKnGCCNJrmwmuOl3FSagdjad/j/DUQtFwWAS9mu15vnfKPilOUOv0EgZHFdOIgn3pQnxc74Y7xmvPWXPMxwyomS32kKgOuqOgNUe8Mg4EqPZasbgMRHzL8DYO8/8Sm/nk7yxj9qZY6uHQM9EKf1C2o6+gseSlRmpVlcX7+thEzMfrKewqWkRjNz47yR/Ead4mTrWvkcBkOjgI5p6JUf5OJbltWYTqBtAoCWbJeoFLccw6oVsCYZ/Xfmmy9T/VqVQu8kCDWYkEr566Eoc32/czQhOWLdFTzeVaYUYXmZnGArXrH81iHbNKl4UC9hH/J6nWfeIuHKfSCADyyerDNKU0sqp56Zstl9NES80N5RJ2UOZRnbJ1bJlUxW8wyrxL+oYDFRBcTYIgWOFEyKtXnkV5y8Eq7dHFCcXMoGcNyllUJLzfKo1tcTOTgWc8=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(4326008)(66476007)(66946007)(53546011)(66556008)(38100700002)(8676002)(7416002)(8936002)(55236004)(6666004)(6486002)(31696002)(2906002)(5660300002)(956004)(31686004)(26005)(86362001)(2616005)(83380400001)(6916009)(16576012)(316002)(36756003)(508600001)(54906003)(186003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SGVBUVhNK2hqT0doMjQwdHg2VVl1Z1NVUlY3ZW50K20rSm94dnRZMlJYZHdx?=
 =?utf-8?B?S255QmFCajEvd29LQVZZSmpGZkFnajJNU3ViTEhaMk1ldGErMTA1aUgzaVZt?=
 =?utf-8?B?OVdSK0tFdFYzV244QkVuWmNtQjd1cS9OT1FuZEZXUjI5Kyt1YXhWRklyNDBU?=
 =?utf-8?B?Mmw0WjVyMlBib1pOcGFxVW1zVkNHVDNPY1p0YjFQTy9xTnltR2hBb05wVUpI?=
 =?utf-8?B?aWd3WEUyVThCZzZ3K3M5VkRNSGZTZHVzUkkrUWVwN0NQdE1xWkR3SDBaOXlz?=
 =?utf-8?B?VmhvaGRRUlloWW1qTENKYlNpNnR3MFNOcGZyNGJ6aWpmZ2taeUZhbVVLc1dZ?=
 =?utf-8?B?Q29Lc2FOL0tJKzhtd1UxNjA2bGNNbURReUVTTTBrbzJiR0N3NGNpeVpnNHI4?=
 =?utf-8?B?M0JPU0IwS1RNWEdUMHQrYmdISFN1SVY5SHM4Mk1zR3U2NFMzRExXVWMvd3Js?=
 =?utf-8?B?QWE1S25ZL2xMQ2NROCtGQmVBUEJibGZOU3dYd3I3bmMxbFVEL1MwMExMZWZI?=
 =?utf-8?B?TjdDZlBRdW9aRUVJdkJNc0RsRW1UaEhxaXJSZis5Y1RaTGYvSGkxT2NZTmxr?=
 =?utf-8?B?aEo2T1pCL2tsZ1ZOTTk0eitDODArcXg5cERqUG1IbThVRVl0NDNPZkdWYmRn?=
 =?utf-8?B?b3JFNklmQlpUdW80WGhWdEtHSG1ZSmFIWW90TmNUeFpXc0g4aGNpWUlnUFN3?=
 =?utf-8?B?MGRkeTlEY2FCQXBXRys2S1F3d1F5OU9qdTJYVXh5eklPSjNaQVJoVjlwcnVj?=
 =?utf-8?B?cFFyZElCb2MwM0JaK2N1Q05qUjZkZ3dSRk9oeVFMV3R4Q0Qzdk1JMXgzYWhW?=
 =?utf-8?B?SjlodUtQRWp3Slc4cDJWdlJLRHVUdWt1czJFRzZmN1UyUTJudHc4QzVZQWh3?=
 =?utf-8?B?VTZGalhjOVgzMFRCZlZudEJVT2FSTUR3SFQyd2QyanduSitCMlJrUXhrRkFP?=
 =?utf-8?B?eSt2TTNFWlZ1MFhJSmVTb2ZMT1NYU3ZRQVdKU3VLVmp5cW1pZm8vanlQWDRz?=
 =?utf-8?B?NXB5RXpwQlJ6QUJqT0tHblgzUDk5VlRWYXNob2hBT2ltSU1PQlJpV0NjS1Jn?=
 =?utf-8?B?VnJHZEZYbGpMUUk2N0NIQWQ2UTZpSURoOGRzN2NsTzlZQW03UTcvK0tBbGNq?=
 =?utf-8?B?NHpNUEIyNGl2UzRlbGhwbGVCTHdsSWN2Z1RXbXozSCtFTDg5UlpxZUJDM2t6?=
 =?utf-8?B?Qmp3ZklWSVN5SmpHR0NzWlhLbDA3bmFnYk9hVjV5T21UaHFPak1PMTFlTXF2?=
 =?utf-8?B?aVFNaDNKcDNiTWVIMnRNS0d4NDdQbWtXU3dseDF2ODVwVFR2TnpRcTRoQ2pI?=
 =?utf-8?B?QnQwbHM2RkRXMFNoQ3pYc0lsUkxITFE1T2J1bXoraGFhMjZodFYzclV3OHFQ?=
 =?utf-8?B?ZDgyd0YxY1IzK0FNUmEyTFZQMVdUT292clpBaHBXVUhxQ01QOVB2NXZ1SXpX?=
 =?utf-8?B?SjJSc2lUQkR1N3dVUHp6bk9QMGw1MEpueVBWZnJWNlYyanFxVWZiaklMV1Vs?=
 =?utf-8?B?ZGVtUWJBSGZUcUlZc2RxRys5T2NLN1RCQWw0OXlTc3J1Ulg0VkxpSFhpTlpV?=
 =?utf-8?B?cmpyb2dOZU1qK0d6YWk0dyt4OHNOcXZNSzFXbGVIQVF4VmtnYk12UTBYNDdz?=
 =?utf-8?B?ZnMzRGhBRFhYMUhhaTMyNmxzd0VlQktzREJTaTdWZDNMV0syZkhhTnN5cGxM?=
 =?utf-8?B?V2NSNW5DTXhDbUV1VDVWcEUyVTdraWtlMDRpTFZRRXhEMG1NcGdmS3k4M3dI?=
 =?utf-8?Q?tUSlc5IVUun78jw98L28becn51c4F3sPpl8KuLF?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 62744f2c-3066-44bb-9b48-08d97dacb29e
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Sep 2021 09:38:13.6500
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3zfBVdt3qY3ZkPJwpzmBIi4RxfU66dx8Iv90rVfhC2HS/Cwz88CXgT9w87X+kw801xkkGYVExT3F0ZRLw8HDtF3x20ny+QHz2CE3OwUIYQI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR03MB4549
X-OriginatorOrg: citrix.com

On 22/09/2021 08:03, Jan Beulich wrote:
> On 21.09.2021 22:08, Andrew Cooper wrote:
>> Not a patch, but an RFC idea for one...
>>
>> It occurred to me that the cycles parameter from __trace_var() and
>> friends is pointless, as the cycles bit is encoded in the top bit of the
>> event field anyway, and passed in the adjacent parameter.
>>
>> Dropping the cycles parameter results in +85/-1029 (-944) net change.
>>
>> The common change in callers is e.g. from:
>>
>> lea=C2=A0=C2=A0=C2=A0 0x3c(%rsp),%rcx
>> mov=C2=A0=C2=A0=C2=A0 $0x4,%edx
>> mov=C2=A0=C2=A0=C2=A0 $0x1,%esi
>> mov=C2=A0=C2=A0=C2=A0 $0x10f002,%edi
>> mov=C2=A0=C2=A0=C2=A0 %ebp,0x3c(%rsp)
>> callq=C2=A0 ffff82d04022ea20 <__trace_var>
>>
>> to this:
>>
>> lea=C2=A0=C2=A0=C2=A0 0x3c(%rsp),%rdx
>> mov=C2=A0=C2=A0=C2=A0 $0x4,%esi
>> mov=C2=A0=C2=A0=C2=A0 $0x8010f002,%edi
>> mov=C2=A0=C2=A0=C2=A0 %ebp,0x3c(%rsp)
>> callq=C2=A0 ffff82d04022ea20 <__trace_var>
>>
>>
>> Just sprinkling "| TRC_HD_CYCLE_FLAG" over the place makes things a
>> little bit unwieldy.
>>
>> Instead, I was thinking of implementing trace() (and a thin trace_time()
>> wrapper) mirroring the "new API" in patch 14.=C2=A0 Half of the trace_va=
r()
>> users should be __trace_var() already because of living inside a
>> tb_init_done conditional, and the rest are actually opencoded TRACE()
>> taking no extra data.
>>
>> Thoughts?
> Sounds quite reasonable to me.

In which case, for v3 I'll reposition "new API" towards the beginning of
the series, extend it with these two new APIs, then adjust all the
cleanup patches to avoid double-patching most of the call-sites.

~Andrew


