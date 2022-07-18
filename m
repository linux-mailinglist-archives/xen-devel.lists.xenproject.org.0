Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4189D577F5F
	for <lists+xen-devel@lfdr.de>; Mon, 18 Jul 2022 12:11:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.369500.600950 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oDNiw-0001Lc-BH; Mon, 18 Jul 2022 10:11:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 369500.600950; Mon, 18 Jul 2022 10:11:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oDNiw-0001IL-7l; Mon, 18 Jul 2022 10:11:34 +0000
Received: by outflank-mailman (input) for mailman id 369500;
 Mon, 18 Jul 2022 10:11:32 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=fb5k=XX=citrix.com=prvs=1919bed39=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1oDNiu-0001I9-H4
 for xen-devel@lists.xenproject.org; Mon, 18 Jul 2022 10:11:32 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id fd56e558-0681-11ed-bd2d-47488cf2e6aa;
 Mon, 18 Jul 2022 12:11:30 +0200 (CEST)
Received: from mail-dm6nam11lp2172.outbound.protection.outlook.com (HELO
 NAM11-DM6-obe.outbound.protection.outlook.com) ([104.47.57.172])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 18 Jul 2022 06:11:19 -0400
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by BLAPR03MB5555.namprd03.prod.outlook.com (2603:10b6:208:29b::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5438.20; Mon, 18 Jul
 2022 10:11:17 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::bd46:feab:b3:4a5c]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::bd46:feab:b3:4a5c%4]) with mapi id 15.20.5438.023; Mon, 18 Jul 2022
 10:11:16 +0000
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
X-Inumbo-ID: fd56e558-0681-11ed-bd2d-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1658139090;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=zVxoY6IXl/6MojUYRI21I/D5pL0heFwimBj6noRG9w8=;
  b=PktPOOouGIrkC12dKooru+p1SkdBHapXFvBazL0gao8CpWQkNDnN0UF2
   poEC42BOfG8I7hdnQgqavffYgUV0aLdSgtTbfn0MWku4Fu+eo5o3GIWk9
   9kUzH5Zq+czfopinZeoQHs+YwAvcNWg+wawPWekTkBeiJMpp/qLtCO5UC
   Y=;
X-IronPort-RemoteIP: 104.47.57.172
X-IronPort-MID: 76452664
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:Jhlip6nh8InNcrw94TNMO9Lo5gyYJ0RdPkR7XQ2eYbSJt1+Wr1Gzt
 xJLCG/VPf+KMDfyfdx3Poq/9U0B7ZfQzIA2SQFtriEwRCMWpZLJC+rCIxarNUt+DCFioGGLT
 Sk6QoOdRCzhZiaE/n9BCpC48T8mk/ngqoPUUIbsIjp2SRJvVBAvgBdin/9RqoNziJ2yDhjlV
 ena+qUzA3f4nW8uWo4ow/jb8kk3462t4GlwUmEWPpingnePzxH5M7pHTU2BByOQapVZGOe8W
 9HCwNmRlo8O105wYj8Nuu+TnnwiGtY+DyDX4pZlc/HKbix5jj4zys4G2M80Mi+7vdkrc+dZk
 72hvbToIesg0zaldO41C3G0GAkmVUFKFSOuzdFSfqV/wmWfG0YAzcmCA2ltHNNEp/hrBl1u2
 sNbOSEmYSulov6plefTpulE3qzPLeHNFaZG4zRM6G+cCvwrB5feX6/N+NlUmi8qgdxDFurfY
 MxfbidzaBPHYFtEPVJ/5JAWxb/0wCWgNWAH7gvK/8Lb4ECKpOB1+JHrPMDYZZqhQsJNk1zDj
 mnH4374ElcRM9n3JT+trSzw27WRw3+TtIQ6RaL/+e5a20aqnEsKLBEaclC+kMiglRvrMz5YA
 wlOksY0loAw/kG2Stj2XzWjvWWJ+BUbXrJ4DOkS+AyLjK3O7G6xFmUCCzJMdtEinMs3XiAxk
 E+EmcvzAj5iu6HTTmiSnop4thu3MCkRaGMHOykNSFJc58G5+d5pyBXSUtxkDai5yMXvHi39y
 CyLqy54gKgPickM1OOw+lWvby+Qm6UlhzUdvm3/Nl9JJCspDGJ5T+REMWTm0Ms=
IronPort-HdrOrdr: A9a23:lsRCI6+qs3By1CPc7Lhuk+F7db1zdoMgy1knxilNoENuH/Bwxv
 rFoB1E73TJYW4qKQodcdDpAtjifZtFnaQFrLX5To3SJjUO31HYYL2KjLGSiQEIfheTygcz79
 YGT0ETMrzN5B1B/L7HCWqDYpkdKbu8gcaVbI7lph8DIz2CKZsQljuRYTzrcHGeMTM2YabRY6
 Dsg/avyQDBRV0nKuCAQlUVVenKoNPG0Lj8ZwQdOhIh4A6SyRu19b/TCXGjr1YjegIK5Y1n3X
 nOkgT/6Knmmeq80AXg22ja6IkTsMf9y+FEGNeHhqEuW3XRY0eTFcdcso+5zXUISdKUmRIXeR
 730lAd1vFImjHsl6eO0F3QMkfboW8TAjTZuCKlaDPY0LDErXQBeoR8bMtiA2XkAwBLhqAC7I
 tbm22erJZZFhXGgWD04MXJTQhjkg6urWMlivN7tQ0XbWIyUs4nkWUkxjIiLL4QWCbhrIw3Gu
 hnC8/RoP5QbFOBdnjc+m1i2salUHg/FgqPBhFqgL3f7xFG2HRii0cIzs0WmXkNsJo7Vplf/u
 zBdqBljqtHQMMaZb90QO0BXcy0AGrQRg+kChPbHX33UKUcf37doZ/+57s4oOmsZZwT1ZM33I
 /MVVtJ3FRCD34Gyff+qaGj3iq9MFlVBw6du/22z6IJyYHUVf7sLTCJTkwono+pv+gfa/erKc
 qOBA==
X-IronPort-AV: E=Sophos;i="5.92,280,1650945600"; 
   d="scan'208";a="76452664"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DV2PQIBSES6vy8jqxx15oIFPilrvMytjy8VC1+tg8bY3ke3Zq3N4kA4Z4HuoRE56Au64avqc4bj2dzaFglBEIezRz6tHJrb6aYBVf+fXnGbI7dTVK+RtWf3TkGgNDs6YUMfMlBm617ithM00/7OS0HthJmk+HLJcJbvHHCG6Lft41m8kDknHtWCOXNyDBptiRKl/PqSl/irPODsvEGqGKP19kR8JqM4Ee2XHC6llsBQ8L8IdMvYOMb0uo5lY5JDvF/AqypyehvObfZo/sbKHhd7JO+qrtXECjeV3ow1u1tK48RXsjqK9IknqXN+cdXfqcfFuR4uloWTqEJ3i7rjquw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zVxoY6IXl/6MojUYRI21I/D5pL0heFwimBj6noRG9w8=;
 b=B/g0H5YItiHtUCo67JvgP5tbVHJ9C3n7NyETuqKtAyaKOlHDssz3XEexAf1ZZRhlsJcHRwbgaiUGJmVTGHRedB+5GtyoKKdYvX7qKk+KqhuqUR8q9m+kU22E6qAJqP0S/sfF8vQjhYaFMTEW+QEXL9Jxf4LjFQJ7sIQUruKVTsXqBoWOIegmsg4S9hlsv7YdNXXIuC8hUUizDAAePwboj0mHr/UXoAeEHRVjk2TXjOa9AjDw992Fqz+p6ejA9UkoXd90WYo+JhZkPBMLmEhoc9lQHleBE8r0Pb5G09jUBZPP63SlOA38aC/8x6/kEYeX+3c8u8G2riZda5ml7XdXXQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zVxoY6IXl/6MojUYRI21I/D5pL0heFwimBj6noRG9w8=;
 b=n6yl+42HXLYD3qaypW1nv9OtkWrqv97thje+OqSXMiK/oKCS3zE6n2RN8CUnivSjQD3zTolG8Dg8+SEe9pI1OdXiZMhPTSyFEhtHiCNCcbplmpBS6sCV3vq8E6CEkTT/TYd/l/N3vjdVWcVMc26t3L/DvULOeLzqaCCpFHyudPs=
From: Andrew Cooper <Andrew.Cooper3@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Roger Pau Monne <roger.pau@citrix.com>, Wei Liu <wl@xen.org>, Xen-devel
	<xen-devel@lists.xenproject.org>
Subject: Re: [PATCH 2/5] xen/wait: Extend the description of how this logic
 actually works
Thread-Topic: [PATCH 2/5] xen/wait: Extend the description of how this logic
 actually works
Thread-Index: AQHYmnakh8+7xfqMQ0Kng4mRuadHxa2D5W+AgAADEgA=
Date: Mon, 18 Jul 2022 10:11:16 +0000
Message-ID: <347aef21-e6e3-3ab3-f230-4e01339c742d@citrix.com>
References: <20220718071825.22113-1-andrew.cooper3@citrix.com>
 <20220718071825.22113-3-andrew.cooper3@citrix.com>
 <40b1ab24-5e94-ea2b-c9cc-6efa5418d283@suse.com>
In-Reply-To: <40b1ab24-5e94-ea2b-c9cc-6efa5418d283@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 08812a67-df93-4d9a-3a76-08da68a5da59
x-ms-traffictypediagnostic: BLAPR03MB5555:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 Z7Wz3gpcZM2Dpb8val7wVwRJlcMHOIM6oCSJeVlOWddEEQ5iTF1xvJhpBhY+3p03z41E+GBbwO/qyfSWILJTA9l5xFovtAa4Ty9pMatpZ7woEEvbP30SmglfizeM2fUWpOFA/2dN44fuRlJYip7Ck1Cn2/GJOnimpXxY1GezLyvLxs/X4h7QCkZM4hcgQ5sX7OBbMNmPPLVqVpXcTA/pFJq5gsNiJMgra/C4eE/MRscwNL70AmdSX0iNWVpzbrwh/rjPJrIPAqe+VRVqA7QO+wMg957PHmVls3y+TtjhuWnNGY0g8pqSi7u99S2X9Lmn+71/bAA33aG7MJt2tib21xtfWu/avGmFcAbt1H9J/cFm06msrU9dpUdeST5IEWDd0jWXflQIfHJqQQhTWN2Ldajx4DLBmZ81Iy0BKg1lyYSqRY9fPyo/9vsujdlEip8oDAklnLQ22n6J/vYjiruYQ3Kw4Unds7vdxitH0fsuhGXwe8CE4mywHPu6Ljy1f6T2p40sJafhQ85o6VEaKqLmqgXvRxmGMi+e0cMLSMGbPMNkx+45cw3x3W1+8QJuqxH82K5FKhyYEoyzmRhdBu3bJjvoXA3W0m0ThMNbqzA/OPGl0SebTaZgKE1tdUJ/ofkbcM7q6HiXSkYTYorqqas25ynKMWPT5CMJsjs+GTE4Nx2A0WkdVSGP//MdI8TDuj7xCenGA6g/Hga5hPrtDenC8dw3RazjfgZPQS9QmDfXQYflGMXDgHJAs963PCcCbcsJI+iHI3SLRZmWXe8qLAOyrDT18fTok0FQrRKr6Xr7PfXVnaAawJsjAw0dzQVPTLEmbrO6RnesYlSpu3U2FIfkgaC4dZ8OmhU8TSENXaLqWixNWswtZujQT5eI0foc7P9C
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(376002)(366004)(39860400002)(396003)(346002)(136003)(316002)(91956017)(8936002)(86362001)(38100700002)(31696002)(82960400001)(76116006)(66446008)(66946007)(8676002)(4326008)(66556008)(6506007)(53546011)(83380400001)(38070700005)(5660300002)(54906003)(6916009)(186003)(64756008)(2616005)(6512007)(26005)(122000001)(478600001)(6486002)(2906002)(71200400001)(66476007)(36756003)(31686004)(41300700001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?M1ZmWTBENmdNRVFnd0pRWGdVbjM5TVdhOVpFZnJva1pOZy9NVmVSRnhDT29C?=
 =?utf-8?B?MlZ6TTZiSjFSQllHRDFVUnFxOExYR0RybzNqMVI4bUt5ODBpWGRmaVhmb1Jo?=
 =?utf-8?B?b3ZDeXR3UHBPZWZwTTZNRTlQVCtNTVA3RFFyT0E5YTE5QlpObVBqdWZqTFR5?=
 =?utf-8?B?Mzd0WEZtNy9UTVMvZG1ENlFCcFU4WTdMdy8wRFZ0cHkyb1JoanhIQlFKRVFF?=
 =?utf-8?B?ck1CYlV1bW0xWTZBd2xrSXc4OWZ1VlhMSmZyZzF1ampNU043c2hscDlnUDZJ?=
 =?utf-8?B?ZlM4RmZ1UDJEekc3K1RJd1labmN4ckd2Q1o2Vkl1ZXZPakZjb1NaVWlWL3pk?=
 =?utf-8?B?djNnWjlXbnlTRkZsMU54VG1lRjhTbW9lUFA1R0N1ZjBTN0FxMGxJc1IwR3JO?=
 =?utf-8?B?akJZKzh4aHc2UWFucTBVNE5oOUpLNXhhbzBZYVpweFdtV252blJDQW54SkVo?=
 =?utf-8?B?Wm9rYUdnLzZZWEFLazlpTXAxOGhPM2ZUTzY3VzQrWWhRVjlpMVM0Y1R4SnZT?=
 =?utf-8?B?QWpFNFM5WFBlWXNvL2J3T2hGekxhM2hqbE8wRGc4ZWxOdXNud2w3amtzTlhq?=
 =?utf-8?B?U2RRMmV4alVYREw1bGQ1SmVBaUtQVU1JQ1hndENWeTRPdEt6QmFIZSt3Snh2?=
 =?utf-8?B?dnRsK2lha3N5VkZROXJLSHNXb0ZzZ3EvbjRoTEhHejRXUEdIWjNVbEN3dm1i?=
 =?utf-8?B?bEliT0RXaVpnS0tERUhuMU1kTmt1NVNlUWEyWHJQbzBVNUR5YUNiUUZaVnpT?=
 =?utf-8?B?QlNrY21VUUd2MUNoUThnUXoyWTFjNXRtY2RBcDNwNG1ldXBiYXlHbjA5Ymxw?=
 =?utf-8?B?aVg4K092MEJ1dGRHakN5WEZnRWlERHpuUGZXVjlBR0lNcnM2eTNjdnFpV2Vn?=
 =?utf-8?B?S2xFYmh3L09yekw4MitwZ2RPa25EK3JzV2VLcWtQbW1wQm13eUp5NjZ4SU9Z?=
 =?utf-8?B?c0VBTzZFZHRpSzl1ZGZYR0wwa1dmNlBCZnlHS2NkV0IzaDhJSHAzaHVnQzMx?=
 =?utf-8?B?alJZOU93R0VyMk1tcUQvTVc1dVZmZm9uK1lPUEdWVVBzd0NIcWYvRHJURWFF?=
 =?utf-8?B?K1pxVEhpT1dVdVRydlVGQ3FtL20wQ21WcGZYVmc4SWxUM0pVUG5LNk5YQXdm?=
 =?utf-8?B?dHVXQnpDMmwzdU5ieDBPdUVRUWhIU0xDdWdIVXVzYTZCVFpxTnUwdVJMSFZv?=
 =?utf-8?B?d1M1S05Da0xpL2RaS1pYcmc5Vm00VzFEbEplbnA4a0c0bXV2ZTJZZ1JQVHYw?=
 =?utf-8?B?QlBlQ1FkUSs0OWE2eFB2aUZLTGs1ellmTmtpdXEzYWVoeUNoNmJxUjcreUZw?=
 =?utf-8?B?SVJNd1JkSjNqWHJSZTlDMzVIa3E2TGk1Ujk0NkZvOWNsakNhakw3NUJnd1ow?=
 =?utf-8?B?U2FyREZHT1hlUllhVFVJbWl6MVd0NC9acXdsN0t1c0pHZXVUUGphdnFzUGlW?=
 =?utf-8?B?TjltN1k3NTcvYTltejZFTlUxdTNzYnZZQjN6MmFQODI3UkFHbExnU0ptZTdL?=
 =?utf-8?B?NkVWYW8yb0pSeXV3cVlDQUpqc3JhSmtiMmYwRVhvOW5PdDlZd2tROWM3NlNv?=
 =?utf-8?B?MmRrdGEwMThIVm9kQmNwMFhNelF5eW9YSDNyWnFHSmlBTjhZYkQzYmVIaHpl?=
 =?utf-8?B?SnBHMTY1bFFMRXBEQlB3QkkyVUZZNm9SU1BEaVBMNlhZR09zd3VmQWU5T2JM?=
 =?utf-8?B?YVhDVXFxQmdpemFTS1BZWElCbDNSeWRrMVllaFFmZnk0NGR5azRzVjViSngr?=
 =?utf-8?B?a1hPaHowQlJCUlpsOGJsUVd6dEJUN2o5R1pUMkJBV1NZZkZCQ1VEaGk1LytH?=
 =?utf-8?B?QWVRbmFQNUNiYVNiZzlhVzRqUHVaZTZkMW9kWklhSy9aWkl5cmJyZWFTcHIw?=
 =?utf-8?B?K05yMTI4dU9HTStKSmo1YllhdFRjR1RYeDdncGhpWXZMTkJmdkFLT0k1d2du?=
 =?utf-8?B?cDVjRzB5SjJwVURoc01HRkVLQTRhekxqdit1bGRSbWRsSkY4K2p2UnJpS1FN?=
 =?utf-8?B?Z09WREhlMDRSY0pkUjE2WnlIWU5Oa2psRW5oUzBYRkwyVjhhUFRZQzl6ck80?=
 =?utf-8?B?aEFlRlQ5akFmK2cyNkR6SytjSmFjSmZjaUYyMGVtVFNIeEZRd2xlcEdreVZH?=
 =?utf-8?Q?f3e4tXqGI2qaaFytqccoMnzyE?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <C73EEBF95D7EB744B4731ACB41DE8EC9@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 08812a67-df93-4d9a-3a76-08da68a5da59
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Jul 2022 10:11:16.8051
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: b8YiimXkz+Pog/661bw62OzTAhB67Fi98MVX5i1jxwNpdD8VF7uwi/NhVPV+tErgY79Mr3dAQ0+bHTLkZ/tygEfNGPfnPnUDjjGENogawFM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BLAPR03MB5555

T24gMTgvMDcvMjAyMiAxMTowMCwgSmFuIEJldWxpY2ggd3JvdGU6DQo+IE9uIDE4LjA3LjIwMjIg
MDk6MTgsIEFuZHJldyBDb29wZXIgd3JvdGU6DQo+PiBAQCAtMTk5LDkgKzIxMSwxOCBAQCB2b2lk
IGNoZWNrX3dha2V1cF9mcm9tX3dhaXQodm9pZCkNCj4+ICAgICAgfQ0KPj4gIA0KPj4gICAgICAv
Kg0KPj4gLSAgICAgKiBIYW5kLXJvbGxlZCBsb25nam1wKCkuICBSZXR1cm5zIHRvIF9fcHJlcGFy
ZV90b193YWl0KCksIGFuZCBsYW5kcyBvbiBhDQo+PiAtICAgICAqIGByZXAgbW92c2AgaW5zdHJ1
Y3Rpb24uICBBbGwgb3RoZXIgR1BScyBhcmUgcmVzdG9yZWQgZnJvbSB0aGUgc3RhY2ssIHNvDQo+
PiAtICAgICAqIGFyZSBhdmFpbGFibGUgZm9yIHVzZSBoZXJlLg0KPj4gKyAgICAgKiBIYW5kLXJv
bGxlZCBsb25nam1wKCkuDQo+PiArICAgICAqDQo+PiArICAgICAqIGNoZWNrX3dha2V1cF9mcm9t
X3dhaXQoKSBpcyBhbHdheXMgY2FsbGVkIHdpdGggYSBzaGFsbG93IHN0YWNrLA0KPj4gKyAgICAg
KiBpbW1lZGlhdGVseSBhZnRlciB0aGUgdkNQVSBoYXMgYmVlbiByZXNjaGVkdWxlZC4NCj4+ICsg
ICAgICoNCj4+ICsgICAgICogQWRqdXN0ICVyc3AgdG8gYmUgdGhlIGNvcnJlY3QgZGVwdGggZm9y
IHRoZSAoZGVlcGVyKSBzdGFjayB3ZSB3YW50IHRvDQo+PiArICAgICAqIHJlc3RvcmUsIHRoZW4g
cHJlcGFyZSAlcnNpLCAlcmRpIGFuZCAlcmN4IHN1Y2ggdGhhdCB3aGVuIHdlIGludGVyY2VwdA0K
Pj4gKyAgICAgKiB0aGUgcmVwIG1vdnMgaW4gX19wcmVwYXJlX3RvX3dhaXQoKSwgaXQgY29waWVz
IGZyb20gd3F2LT5zdGFjayBvdmVyIHRoZQ0KPj4gKyAgICAgKiBhY3RpdmUgc3RhY2suDQo+IEkn
bSBzdHJ1Z2dsaW5nIHdpdGggdGhlIHVzZSBvZiAiaW50ZXJjZXB0IiBoZXJlLCBidXQgSSBndWVz
cyB0aGF0J3MganVzdA0KPiBiZWNhdXNlIEknbSBub3QgYSBuYXRpdmUgc3BlYWtlci4NCg0KImlu
dGVyY2VwdCIgaXMgdGhlIHNhbWUgdGVybWlub2xvZ3kgdXNlZCBpbiB0aGUgbWlkZGxlIG9mDQpf
X3ByZXBhcmVfdG9fd2FpdCgpJ3MgYmxvY2suDQoNCkl0J3MgYmVjYXVzZSB3ZSBoYXZlIGEgd2Vp
cmQgc2V0dXAgd2hlcmUgdGhpcyBpcyAobm93KSBhIG5vcmV0dXJuDQpmdW5jdGlvbiBtZXJnaW5n
IGludG8gdGhlIG1pZGRsZSBvZiBhIGZ1bmN0aW9uIHdoaWNoIGFscmVhZHkgZXhlY3V0ZWQgb25j
ZS4NCg0KSSdtIGhhcHB5IHRvIGNoYW5nZSBpdCBpZiBpdCdzIHVuY2xlYXIsIGJ1dCBJIGNhbid0
IHRoaW5rIG9mIGEgYmV0dGVyDQpkZXNjcmlwdGlvbi4NCg0KPj4gKyAgICAgKiBBbGwgb3RoZXIg
R1BScyBhcmUgYXZhaWxhYmxlIGZvciB1c2U7IHRoZXkncmUgZWl0aGVyIHJlc3RvcmVkIGZyb20N
Cj4+ICsgICAgICogd3F2LT5zdGFjayBvciBleHBsaWNpdGx5IGNsb2JiZXJlZC4NCj4gWW91IHRh
bGtpbmcgb2YgIm90aGVyIEdQUnMiIC0gdGhlcmUgYXJlbid0IGFueSB3aGljaCBhcmUgZXhwbGlj
aXRseQ0KPiBjbG9iYmVyZWQuIEl0J3Mgb25seSB0aGUgcHJldmlvdXNseSBuYW1lZCBvbmVzIHdo
aWNoIGFyZS4gSGVuY2UgSSdkIGxpa2UNCj4gdG8gYXNrIHRoYXQgdGhlIHJlc3BlY3RpdmUgcGFy
dHMgb2YgdGhlIHNlbnRlbmNlIGJlIGRyb3BwZWQuIFRoZW4NCj4gUmV2aWV3ZWQtYnk6IEphbiBC
ZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4NCg0KSXQgYmVjb21lcyB0cnVlIGluIHRoZSBuZXh0
IHBhdGNoLsKgIEknbGwgdHJ5IGFuZCBzaHVmZmxlIHRoaW5ncy4NCg0KfkFuZHJldw0K

