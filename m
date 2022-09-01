Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F9045A958D
	for <lists+xen-devel@lfdr.de>; Thu,  1 Sep 2022 13:17:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.396516.636674 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oTiCA-0001Af-AM; Thu, 01 Sep 2022 11:17:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 396516.636674; Thu, 01 Sep 2022 11:17:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oTiCA-00018s-7N; Thu, 01 Sep 2022 11:17:14 +0000
Received: by outflank-mailman (input) for mailman id 396516;
 Thu, 01 Sep 2022 11:17:12 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=LpUB=ZE=citrix.com=prvs=236e65341=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1oTiC7-00018m-PS
 for xen-devel@lists.xenproject.org; Thu, 01 Sep 2022 11:17:11 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9cc091b6-29e7-11ed-82f2-63bd783d45fa;
 Thu, 01 Sep 2022 13:17:08 +0200 (CEST)
Received: from mail-dm6nam10lp2105.outbound.protection.outlook.com (HELO
 NAM10-DM6-obe.outbound.protection.outlook.com) ([104.47.58.105])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 01 Sep 2022 07:17:04 -0400
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by BL1PR03MB6101.namprd03.prod.outlook.com (2603:10b6:208:308::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5588.12; Thu, 1 Sep
 2022 11:17:03 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::b9c9:c866:817c:60dd]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::b9c9:c866:817c:60dd%4]) with mapi id 15.20.5588.012; Thu, 1 Sep 2022
 11:17:03 +0000
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
X-Inumbo-ID: 9cc091b6-29e7-11ed-82f2-63bd783d45fa
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1662031027;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=1XeAqMZOQn8rtmQbiOmOwn6tHWrlcUZaXrWPVJfxQso=;
  b=H1CSfbkfZKsz7yyscqJihxlYDxZv6cKUAnWBDyIkFhLrntuyurTN+Wm9
   Rzj/ifk2hr66xw5kuWPvDB6uQH/oCkO295I1anfaMXs1yKNdAZDhr5Zgl
   VGSMCRd5kJdOlb+F5WysH/m5pAJqlfLq/9VMou1vHqNWgAfAUW9Fv7St+
   g=;
X-IronPort-RemoteIP: 104.47.58.105
X-IronPort-MID: 79547364
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:ScAj/qt11Wc6c3I1Tb/LOJjEn+fnVHFfMUV32f8akzHdYApBsoF/q
 tZmKTuPPfiDY2DwLdlyaojg80JV7MDcyIJhSQNkrS9gHi5A+JbJXdiXEBz9bniYRiHhoOOLz
 Cm8hv3odp1coqr0/0/1WlTZhSAgk/vOHtIQMcacUghpXwhoVSw9vhxqnu89k+ZAjMOwRgiAo
 rsemeWGULOe82MyYzl8B56r8ks15qyj4GpA5zTSWNgQ1LPgvyhNZH4gDfnZw0vQGuF8AuO8T
 uDf+7C1lkuxE8AFU47Nfh7TKyXmc5aKVeS8oiM+t5uK23CukhcawKcjXMfwXG8M49m/c3Kd/
 /0W3XC4YV9B0qQhA43xWTEAe811FfUuFLMqvRFTGCFcpqHLWyKE/hlgMK05FYwx+bxQMHhyz
 sw3GjExTAivjv+Uwb3uH4GAhux7RCXqFKU2nyg4iB38U7MhS52FRLjW79hF2jt2ntpJAfvVe
 8seb3xocQjEZBpMfFwQDfrSns/x3iW5L2Ie9QLT/PJqi4TQ5FUZPLzFGdzZYNGVA+5SmV6Vv
 Dnu9GXlGBAKcteYzFJp91rz17KTwnilBOr+EpXj691B0HKw21YcJxhKVAeVgeKBkEuhDoc3x
 0s8v3BGQbIJ3E6kVN7mRDWjvWWJ+BUbXrJ4A+A8rQ2A1KfQywKYHXQfCC5MbsQ8s807TiBs0
 UWG9/vlCzVgv7ySTXO17aqPoHW5Pi19EIMZTSoNTA9A79y9pog210rLVow6SPPzicDpEzbtx
 TzMtDI5m7gYkc8M0eO84EzDhDWv4JPOS2bZ+znqY45s1SshDKbNWmBiwQKzASpoRGpBcmS8g
 Q==
IronPort-HdrOrdr: A9a23:cqR5dqMhuEvU6sBcT2L155DYdb4zR+YMi2TDiHoddfUFSKalfp
 6V98jzjSWE8wr4WBkb6LO90DHpewKQyXcH2/hqAV7EZnirhILIFvAp0WKG+VHd8kLFh4lgPM
 tbEpSWTeeAdWSS7vyKrzVQcexQpuVvmZrA7Yix854ud3ASV0gK1XYaNu/vKDwTeOAwP+tdKH
 Pz3Kp6jgvlXU5SQtWwB3EDUeSGjcbMjojabRkPAANiwBWSjBuzgYSKUiSw71M7aXdi0L0i+W
 /Kn0jS/aO4qcy2zRfayiv684lWot380dFObfb8yvT9aw+cyTpAVr4RHoFqjwpF5N1HL2xa1+
 Ukli1QffibLUmhOF1d7yGdgjUImwxelkMKgWXo/UcL5/aJCg7SQvAx+76wOHHimjUdlcA536
 RR022DsZ1LSRvGgSTm/tDNEwpnj0yuvBMZ4KcuZlFkIPwjgYVq3Poi1VIQFI1FEDPx6YghHu
 UrBMbA5OxOeVffa3zCpGFgzNGlQ3x2R369MwM/k93Q1yITkGFyzkMeysBalnAc9IglQ50B4+
 jfKKxnmLxHU8dTZ6NgA+UKR9exFwX2MFrxGXPXJU6iGLAMOnrLpZKy6LIp5PuycJhN15c2kI
 SpaiItiYfzQTOaNSSj5uw6zvmWehTNYd3E8LAs27Fp/rvhWbHsLSqPDFgzjsrImYRsPvHm
X-IronPort-AV: E=Sophos;i="5.93,280,1654574400"; 
   d="scan'208";a="79547364"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hrBhQ5o417KMBLU2me2mhEG1ne2tKKGfH/tMqj+eMnMOEvWEB2mriuvezjRoAKviCyYjDYKrVuosvtvwK5u8K/vPYVGeqTIroa48J+fJN/ymLMJnsDgn6Kqx6kW10fyGeOwTLHacl6vzfGdeZBKXIgWkZVeB/tkkgxZqny85u5ToTLWRFw9B81rSU+A91ClhF59Zlv8YK7gF1AOJfqsMmQh3y8GUBk53TVsuyKyMoSWUM/+oBH3Dxpyd1CK4Lv2TzFWp1aq1u6DssjtAscmiftZ4AS19xmXM006OAcB+KDU6BwJWncCegouMSlIbSYG9G9oGIh5A42mO/2lFCUIznA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1XeAqMZOQn8rtmQbiOmOwn6tHWrlcUZaXrWPVJfxQso=;
 b=Ch+VGjZLf3npPrNJLepsxzoVf0sZKIIhI/aUZVdOBhphSXS+bFykY9jb143+ya7ikgIzwtOHtgDZRu+tx7dAgUnAQuo9cGkWmbm+ZZyZNDbKVJWy/uPwg2U8i2PdUH4pPIfFD4LXGuRz5gCtatQQs6G5ED4x8aUB2vQDYi0FNm2C60jZHUut7hPN1YgiR0LtaBUlCZcMAriiI1eAKVVeQtphHtbBI/EIkOUmDmehKSk1wUGFGyUJgUnrhTfwYdPonlkxYB2eJUrbMkvzPNyZ6QBgJu7kzYzbhAFUIb7vDvS4ktSK7MiGDjz5FWixn+ZHwIaUxl/O99dxeZzNCp4WQw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1XeAqMZOQn8rtmQbiOmOwn6tHWrlcUZaXrWPVJfxQso=;
 b=hN6hCRxEaK+bdCBw6pWnCfnAybYanzknL9V/bFEwX2tbDJViNoypbAmY0H5uOExN6n0HYeqePYJhpXDNgQ7+ePtoytUrXlOOoyOiT313i7QQQmjhDwCtl60XU77QpZG6ky7I0nmPQwnO/bziKTcesq0krsjXdbD2hG5Z6nqZNwk=
From: Andrew Cooper <Andrew.Cooper3@citrix.com>
To: Juergen Gross <jgross@suse.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: George Dunlap <George.Dunlap@citrix.com>, Dario Faggioli
	<dfaggioli@suse.com>
Subject: Re: [PATCH v3 2/3] xen/sched: carve out memory allocation and freeing
 from schedule_cpu_rm()
Thread-Topic: [PATCH v3 2/3] xen/sched: carve out memory allocation and
 freeing from schedule_cpu_rm()
Thread-Index: AQHYsVjU6cwqlcc3IUyYiKoWS8gK1a3KhgKA
Date: Thu, 1 Sep 2022 11:17:02 +0000
Message-ID: <f2f53416-c2bf-4239-4816-685b0c105952@citrix.com>
References: <20220816101317.23014-1-jgross@suse.com>
 <20220816101317.23014-3-jgross@suse.com>
In-Reply-To: <20220816101317.23014-3-jgross@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: dc6f92b7-3099-4ebd-6829-08da8c0b7f08
x-ms-traffictypediagnostic: BL1PR03MB6101:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 bwKIwI6G69hy1IPdtcwA2x1q687+39ExLkun7/2pRw6kZ9ki3vpdSx6+AyfwwPi5RANOxpFOryu6PsAgwQlSe+aYiQd6Iqdt1ZGY+RUrl78YaVWuPpjjmQg2BqTP7T1+jl9rPr3OeJWb5WKQBc/fV60yEvvD5+fTiipQA6N9LwSWQxLHXAiNcKK7kcMAw1W6Ke+K8iIssXwZEOG4X61eFoPU1eRCbq+ZvRfn8Byvb/Ruwlx3/buBnrchEL8tr9Y5tKHs/2x076jSTjbnZ+ffzMsrO0gFP+xmVn/M9VUhqGjdBZP1jGVhVnQJkmUqoE9gvkXzTInW1ZKb1b8/qhMt+zhqCQfDn5KwiwM1UPIaWyJ52AXhmNblws/vre1cHF2iDKF0MJK0b7ZBPNgIRb4NgVsIiFOzbYLfhHwGqqJSBPFR40/5jW3TnHEIk1oLbVnvlTldHl7e0ZAludDlgxwo6HABIYuJlxo8bLcX5j4GgsuQk+hTf2K6WXZw4DJ2fYzClsmUO6pfvEOsRrp9jiGBgE2xMg2NLXPwQWqpZey6/VwKvxuy1VGhz0YNgbBbjm9uCW2ZFJkCxYrCKiMmADxc9hHIUUu5fOBO1lovbJ0o8nH4FQXOvTPUCfXyrQhpHAGnwTTcbonYvEOBcWr9E/DJ2UK4Z7BMWOvP1Sb8k5/3k0Cz2AALTatbJ47+ooCgS7iwVzVCBv6zo3Wn1BkfCKG8bQ9s/voHruSu4EDc/WP5mrL9R2KLFpjPZSUJH3tS5qBJHH8b4S4vLz/qXwx5Zyd/C/iw9fQ2d/BqxxWXdEY2TYX7VBqCoAy9aK77nPbahtwRGHSyighStwmeGMSstbDxjA==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(376002)(366004)(39860400002)(346002)(136003)(396003)(478600001)(6486002)(53546011)(26005)(6506007)(6512007)(41300700001)(71200400001)(66556008)(66476007)(64756008)(66446008)(76116006)(66946007)(4326008)(8676002)(91956017)(5660300002)(4744005)(8936002)(54906003)(110136005)(2906002)(316002)(82960400001)(38070700005)(38100700002)(36756003)(31696002)(86362001)(31686004)(83380400001)(2616005)(186003)(122000001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?WTFJOElyY3hyOFUrTHFyeEhuSnc0Q3JGbkxKOEFmREJ4RVVxaFRMUGZPVmVO?=
 =?utf-8?B?VFpHME5qd3podk5lano5SDdJVDlzcDlEQjdXbm53UHFFazJabXZMcXNSNm5a?=
 =?utf-8?B?ajRMWE1ZN25kQTJla295ZlkyY2Uvc0w5Wkt1UndueVRhRFo3TVlpa2Z2dzIz?=
 =?utf-8?B?bmlEYU4yZVlYR0ZGVWlSa3ZYbUMyZHYxZ3dHVld5UndKVFp4OFd2Y0U1aitC?=
 =?utf-8?B?N3RqekhlL2NnRy9ydG5XN1l2blQxbzZZaEhHT3B4bXZ2aU5DV1A5bjRXTjNo?=
 =?utf-8?B?Qi9BdkhxaFlGSGYyZ2s1REN0Y0t5NnhtQUd6Z2Z2dk92SzNLTXpZM3V1MTJI?=
 =?utf-8?B?UmhlUFIrTGdpNXZVaGxBMng4eVM3bWJqQU1MWjhlZUIwYW56b3VaN05rT2xB?=
 =?utf-8?B?SS8vTWhFdzNuUWVRR3dUWlFhU2xoTzVmWjJ1aU1lQmdqcjRsTFk2R1ZtVkE1?=
 =?utf-8?B?ZWFBbktiOEs1SnlsSzFISVlKQ0ZLSlh1SVVxNWY2SG83Z1ptYUgzOVowd2pi?=
 =?utf-8?B?YmVpWldnRkZxZGZQeGZGOG52d0NVSzBjcUZNUXp2SkE0NlVpb041ekJ3bVh0?=
 =?utf-8?B?OVlTdmU5TEV3TDdsWnNNTW1PQTU3NGptS0E1ck5vbStjd08ybk91SEhZSjRZ?=
 =?utf-8?B?bVpINU1UcTJyQkNZQmhmbkZYUTJWYUVGSFEyUnhYV2g3Y0hwL1g3SXhJeSto?=
 =?utf-8?B?WHBGdmcxc1VZTGlLRVcvM2lQMzExZ1dCSTZsdUo5REU4ZnJWVnhCTUZoZ29W?=
 =?utf-8?B?OHFlRWFsMkNxQkQ0T3JGMG0wYzhpL0VTMXRySDZZZUwwcU1QNTRUdStXV29s?=
 =?utf-8?B?NnR5cTJ6ektIT0JlNzc3UEUrWWYrVDVCYTdxQ0sycm5EaHRIUmFaMklyTUwr?=
 =?utf-8?B?N2l3UWtNdjNZcGpjYzNRL0srWDRsV0hsRnlIcDU4SW1TK0ozTWRSZ1BPYUcz?=
 =?utf-8?B?QzBWZit2SHdOR1BPTHVKRWdjbURmdHBDSVlKYVI1RnVSOU80Vlp4VHd2Y1By?=
 =?utf-8?B?cVk3M0h4YkRlT040eklGejVDZ3BVZzdpQmJwNWFwOHZwVU5wMGZSN3RwblFI?=
 =?utf-8?B?a2RTZ2hUMHFYNEpzWThtTis3eUZ5aWpwSVhnMG5jRUpaL3JDS216Vnd2UFkx?=
 =?utf-8?B?eFlBaGtBZ2ZmUzdMd1lkRzRGQlZuc1FvcVc5UkRKREVTa0pmVUhZeHJ5ZzJa?=
 =?utf-8?B?MXoxaWlISmtNRFlDTHZpYm9yRGJDWVdyWHova0xLVmUvWm9JQks4dW5zbWdy?=
 =?utf-8?B?Yy9qU09ZdlpZaHNyczNjdDdtN3ZmMkNEOUIrN3NGcVB1Ums5NmNJcFJvVjRL?=
 =?utf-8?B?L1dOby9oOHlxYUZOSkZVSTFXK1F3QWJFWXdVOGpidGIwNkQvZk83cndqOEts?=
 =?utf-8?B?TkROTzhocG5MOEE3WHVHS3ZVaGhQcERFeWN6QXZ6OWdLeFY1YnF5ZHk0cDBB?=
 =?utf-8?B?Tk5OMTh2S3NoSFlUWVc0azRxK1NXVkd1NWFlOUh4N2dVeENVbms4VkFwVlF1?=
 =?utf-8?B?eFoxbG1SSHA2WWlzSzhUbGVwbkNNK094ZEgzQU1aQThMbXl4bXZSWnBNNEhs?=
 =?utf-8?B?dkNad0hGU1dZd0J1ZFBnc2hFWFRzY3J4VU5naGdjcGhLUmM4ZGhzaU9IZGN1?=
 =?utf-8?B?Ym4rSmkxdDFLS29XeDdpL0M2YjRlTi9rNHlUTDlMbU0zbzc4WXAzVWtTM2lu?=
 =?utf-8?B?R1R4WHRZNUFqejExYi9mRTVMaVBGeGtZcTZaOGRoSjByT2JIQ1owaDExMzN6?=
 =?utf-8?B?SVlIRktIanQyd3V1Sk1nQ3pnczBWdzVIL0k2Uis0bml6dVQxelRLbytJSWI0?=
 =?utf-8?B?RU5aMmx0cE9lODJyMzZORkhaOElKWk9QemVrR2IwT3VGam51QXpCb3dsdjMz?=
 =?utf-8?B?dC8vMTA5aHRwZnBGenNhWVJlQzB1UjloRTEwM28xcDRydkQ5a2Z4eFJUb3Yz?=
 =?utf-8?B?TEYra2l6cHQrbDl3eFcxcGx1MzBxVnRDeEFZVldBOERoZ25qRktaZ2RHZkJU?=
 =?utf-8?B?QjlNb2N1WFJEeW9GUmoweFJDemh3U2E5Z0R4U2p3a3FzdzVwQ0RsWlc1Yitz?=
 =?utf-8?B?QTNDRXc3ZWdTU0ZQM0gwY2JFN3dkZmxCSUNlbWhkZkhCMU90TndsNm1DamFw?=
 =?utf-8?Q?eG0WQBk7trvN9gIo/07twn6M2?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <990A17905BE2FD45BB98697101413B65@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dc6f92b7-3099-4ebd-6829-08da8c0b7f08
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Sep 2022 11:17:02.9664
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: XMH8jlBrmUmCkxG1HEV+tJZwWkQkjK4nOh0s0yw8aNdiIKzS0mQfHZb4tcFyc6IcBa8Hbj3pP5k6eRcamb7mfhzEjDhprsm9vP7kl/I8oPY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR03MB6101

T24gMTYvMDgvMjAyMiAxMToxMywgSnVlcmdlbiBHcm9zcyB3cm90ZToNCj4gZGlmZiAtLWdpdCBh
L3hlbi9jb21tb24vc2NoZWQvY29yZS5jIGIveGVuL2NvbW1vbi9zY2hlZC9jb3JlLmMNCj4gaW5k
ZXggZjZlZWQ4ODkzMC4uMjI4NDcwYWM0MSAxMDA2NDQNCj4gLS0tIGEveGVuL2NvbW1vbi9zY2hl
ZC9jb3JlLmMNCj4gKysrIGIveGVuL2NvbW1vbi9zY2hlZC9jb3JlLmMNCj4gQEAgLTMyMzcsNiAr
MzIzNyw3NSBAQCBvdXQ6DQo+ICAgICAgcmV0dXJuIHJldDsNCj4gIH0NCj4gIA0KPiArLyoNCj4g
KyAqIEFsbG9jYXRlIGFsbCBtZW1vcnkgbmVlZGVkIGZvciBzY2hlZHVsZV9jcHVfcm1fZnJlZSgp
LCB3aGljaCBjYW4ndCBkbyB0aGF0DQo+ICsgKiBkdWUgdG8gYmUgY2FsbGVkIGluIHN0b3BfbWFj
aGluZSgpIGNvbnRleHQgd2l0aCBpbnRlcnJ1cHRzIGRpc2FibGVkLg0KDQpBcyBhIG1pbm9yIG9i
c2VydmF0aW9uLCB0aGlzIGlzIGF3a3dhcmQgZ3JhbW1hci7CoCBJJ2Qgc3VnZ2VzdCAiLi4uDQpu
ZWVkZWQgZm9yIGZyZWVfY3B1X3JtX2RhdGEoKSwgYXMgYWxsb2NhdGlvbnMgY2Fubm90IGJlIG1h
ZGUgaW4NCnN0b3BfbWFjaGluZSgpIGNvbnRleHQiLg0KDQp+QW5kcmV3DQo=

