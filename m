Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 219DE415A01
	for <lists+xen-devel@lfdr.de>; Thu, 23 Sep 2021 10:23:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.193497.344655 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mTK0o-0006Sk-16; Thu, 23 Sep 2021 08:23:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 193497.344655; Thu, 23 Sep 2021 08:23:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mTK0n-0006QO-Tl; Thu, 23 Sep 2021 08:23:21 +0000
Received: by outflank-mailman (input) for mailman id 193497;
 Thu, 23 Sep 2021 08:23:20 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=qmWf=ON=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1mTK0m-0006QI-5Z
 for xen-devel@lists.xenproject.org; Thu, 23 Sep 2021 08:23:20 +0000
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 81b2aade-1c47-11ec-ba1b-12813bfff9fa;
 Thu, 23 Sep 2021 08:23:19 +0000 (UTC)
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
X-Inumbo-ID: 81b2aade-1c47-11ec-ba1b-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1632385399;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=SVVg9QjwxI5bFvKqj21ypl6w122xBh2MGFBLxXhmFtQ=;
  b=d/bnPlGcwXZhu1AUjaxl8N3DWsjRx1HQ5BiEzOgbz2AuhRjLQ9e0ION8
   H062UjYBPTti48k4cuHQLwIzpEYJHXvZ9vnvaBEjGu6Qxv5IB6sDJST72
   rYJoa/xXVK5fZseeGekI02VMJQUYLeYSgqzQBqvacakP66Mx2v5wJtpsb
   E=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: BsvoHUPuhHF3qYKbY+Folo+4ZARk791rq5Wo1ESxVwXDk9/WWXuKOjybb3VHK/1jcmp5IfQQfM
 KedGlKUcSio2gBLfe5uCi7A53hcvivgZnD16i6KU8Q2z/7hLIo2Rvy/13frK/ASZyfg2AZ5jT3
 GmLBzEaiKOCn8b9bJSsbGIOxlssTKjRSkH4EsICsr8evYe+tmhQ/aBvAzD9snyXEGUOFnLQKFG
 oU0taD8IPt/Jwyc39pGJMBtkSy6LsGlJeTHkzvPVhL/07k5KS1PUnWb8fmrBnAUR0HM8VOUzPZ
 gw4WAOLmhFDLTttAwhcCjNVJ
X-SBRS: 5.1
X-MesageID: 53407651
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:9j2NU6Idr2KUfCzeFE+RKZIlxSXFcZb7ZxGr2PjKsXjdYENS32FRn
 zMZXGmAMv+NZTHwKNt3bN+/o00FupLSy9NqGQFlqX01Q3x08seUXt7xwmUcns+xwm8vaGo9s
 q3yv/GZdJhcokcxIn5BC5C5xZVG/fjgqoHUVaiUZ0ideSc+EH140UM5wLZg6mJVqYPR7z2l6
 IuaT/L3YDdJ6xYsWo7Dw/vewP/HlK2aVAIw5jTSV9gS1LPtvyB94KYkDbOwNxPFrrx8RYZWc
 QphIIaRpQs19z91Yj+sfy2SnkciGtY+NiDW4pZatjTLbrGvaUXe345iXMfwZ3u7hB3Zvo4y0
 fpT5aCVaiImb4HwqN0WSh9XRnQW0a1uoNcrIFC6uM2XiUbHb2Ht07NlC0Re0Y8wo7gtRzsUr
 LpBdW5LPkvra+GemdpXTsF2gcsuNo/zNZ43sXB81zDJS/0hRPgvRo2XvoMAg2lt36iiG97TV
 dAHOBwwTi7uSD4SZW01M4sEpsKR0yyXnzpw9wvO+PtfD3Lo5A98zrnrdsbUc9qiRMNJk0Ler
 WXDl0z7HxdcMtWcwDiE93uEh+nTkCe9U4UXfJW6/PN3hFyYxkQIFQYbE1C8pJGRmkO4Ht5SN
 UEQ0i4vtrQpslymSMHnWB+1q2LCuQQTM+e8CMVjtlvLkPCNpV/EWC5UFVatdeDKqudmZGJpz
 3CXz+/MJhlg4ZGpeUuW77Gb+Gba1TcuEUcOYioNTA0g6tbloZ0ugh+ncuuPAJJZnfWuRmqtm
 W7iQDwWwuxJ1J9Wi/zTEUXv3mr0zqUlWDLZ8ek+soiN1Qp/eIftTIih81GzAR1ofdvBEwHpU
 JTpnaGjAAEy4XOlyHflrAYlRujBCxO53Nv02wUH834JrWjFxpJbVdoMiAyS3W8wWir+RRfnY
 VXIpSRa74JJMX2hYMdfOtzqUZ9xlfC7S460B5g4i+aihLArL2drGwk0OSatM53FyhBwwcnTx
 7/BGSpTMZrqIfs+l2fnLwvs+bQq2jo/1QvuqWPTlXyaPU6lTCfNE98taQLWBshgtf/siFiFo
 r53aprRoz0CAbKWX8Ui2dNKRbz8BSNgXs6eRg0+XrPrHzeK70l7UKKOneN9JdY190mX/8+Rl
 kyAtoZj4AOXrVXMKBmQa2Alb7XqXJ1lqmk8MzBqNlGts0XPq671hEvGX5doL7Qh6sJ5yvt4E
 6sMd8maW6wdQTXb4TUNK5L6qdU6JhisgAuPOQujYSQ+IME8F1CYpIe8c1u97jQKAwq2qdA6/
 ++q2DTETMdRXA9lFsvXNq6ilgvjoXgHletudELUOd0PKl70+Y1nJnWp3P86Ks0BMzvZwT6e2
 1rECBsUv7CV8YQ07MPIleaPqILwS7lyGU9THm/667eqNHaFojr/kNEYCOvRJGLTTmL5/qmmd
 N559fCkPa1VhktOvqp9D61vkfA06ezwquII1Q9jBnjKMQimU+syPnmc0MBTnaRR3bsF6xCuU
 0eC99QGa7WEPMTpTAwYKAY/N7nR0PgVnn/Z7OgvIVW87yhypeLVXUJXNhiKqSpcMLoqb991n
 bZ/4JYbu16llx4nEtealSQFpW2DI0sJX7gjqpxHUpTgjRAmyw0abJHRYsMsDEpjtzmY3pEWH
 wKp
IronPort-HdrOrdr: A9a23:pgMAs6optGbW7kRbnmnBIiYaV5uhL9V00zEX/kB9WHVpm5Oj+f
 xGzc516farslossREb+expOMG7MBXhHLpOkPQs1NCZLXXbUQqTXftfBO7ZogEIdBeOk9K1uZ
 0QF5SWTeeAcmSS7vyKkDVQcexQuOVvmZrA7Yy1ogYPPGMaGJ2IrT0JcTpzencGNTWubqBJba
 Z0iPA3wAZJLh8sH7qG7zQ+Lqf+T5qhruOQXTc2QzocrCWehzKh77D3VzCewxclSjtKhZMv63
 LMnQDV7riq96jT8G6c60bjq7Bt3PfxwNpKA8KBzuATNzXXkw6tIKBsQaeLsjwZqPymrHwqjN
 7PiRE9ONkb0QKeQkiF5T/WnyXw2jcn7HHvjXeenHvYuMT8AAk3DsJQ7LgpOCfx2g4FhpVRwa
 hL12WWu958FhXbhhnw4NDOSlVDile0iWBKq59Qs1VvFa8lLJNBp40W+01YVL0aGjjh1YwhGO
 5ySOnB+fdtd0+AZXyxhBgt/DWVZAV2Iv66eDlEhiTMuAIm2kyRjnFohPD3p01wsa7UEPJ/lr
 352qcBrsAEciZZV9MkOA+tKfHHfFAleii8RV56F26XXJ3vC0i92aIf349FkN1CWKZ4gafay6
 6xHG+xiwYJCgvT4Iu1rcZ2ziw=
X-IronPort-AV: E=Sophos;i="5.85,316,1624334400"; 
   d="scan'208";a="53407651"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DTIYaMjLpdNHwATwqpn6SSBOwNsR+fDaBBADRD8q3kpMe6kj1ruxySXm8RqXZZ9j7ZajYsyazi6oj50TgYkB/uVZj2O3CLxfUpzwrHQ6bKOg/vW7axUN5WabtrV7/sAPKrWGcoa8dPttybR12N0mpsVHQ9A+lfMf7DwGfGUClfe1BiH3W1KP+YBhegj9ZBYrVCoFkFJAcVGTseVXm5ObsP6Sfc4RHfH5bUmMC7ZTRnEZZBMEEVIQMCc9Kl6IEZ2aEzXvvokZcVrKCDJSj1nTMPnOLZ9WJgWDt9sW4k4OtxxrSnSy5jMQSfMIvf068b2eeS0Py75bNbcFHsT7XHJUMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=pL5THT8DeRWbL+ZkXLmt1JQ/FRxDsykKgKZKcA1bbjw=;
 b=PJEcmji94If1/FTuQCV07cegHPB+ytC6HUvq1aBFbZTlXnRr2BRIUI+1afmNqWX5+KtmLDM5elG15v0id83QYiEjMdzX8HTAlVR7xea7h8K0uUEX8Y1CBk6FkmlcLxbFsAao4UNXY18nQOOlSCY3IFK9DsxCo0vbPdb2OJZsMPpX1hLQ1IWDBhMG3HV+UKTJRrkPoo7Bc+uCnEM7bQz8T0G+JFMnlkQt5h9C8gvwA6wciOEzS/5ToiZO5iMFbV4Ai+KPhgFqz5Rpm2YfmO/gYdrQXX90Bti8eUrvBvMYkdVP+Jx71xMYfCz31931hugd4vcAfVlbh+rEzJGFvbJZfQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pL5THT8DeRWbL+ZkXLmt1JQ/FRxDsykKgKZKcA1bbjw=;
 b=vec+Vi7Co/XreJtEWsy3qSop2LdwuWsNUPArB163yUW4Y43zuschAIaf0ndpsugK2S9YikMf/duFFDzP5JeCWTE8lb9EyuAF6ugrbOgAW7NgtePQkqj04VuOc4jBZbgUE1gamglpd8/08jy7AG9KOTjXuO2+gSONr3x6sA8vkb4=
Date: Thu, 23 Sep 2021 10:23:09 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, "Andrew
 Cooper" <andrew.cooper3@citrix.com>, Kevin Tian <kevin.tian@intel.com>, "Jun
 Nakajima" <jun.nakajima@intel.com>
Subject: Re: [PATCH v3 8/9] x86/HVM: skip offline vCPU-s when dumping
 VMCBs/VMCSes
Message-ID: <YUw5babRHdk6Jh8E@MacBook-Air-de-Roger.local>
References: <e4959bab-0e0b-1037-c5da-3d2f14592c20@suse.com>
 <5cc8f7e0-399e-f6a5-bc84-823a6160a3f1@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <5cc8f7e0-399e-f6a5-bc84-823a6160a3f1@suse.com>
X-ClientProxiedBy: LNXP265CA0022.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:5e::34) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: af49ae8c-dadb-4153-a25c-08d97e6b63d1
X-MS-TrafficTypeDiagnostic: DS7PR03MB5463:
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DS7PR03MB5463060B54D92BAB1FBFEA128FA39@DS7PR03MB5463.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5236;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: OY/nJvcY1GdLOJWGrAeTioahC3H03cH0QO4H9KbO8hMQEvFlxozdCqgAdy+EzpQcUsTruW+GyAdRjw+fMB67kiEGmGj0qCobCNQzkTY3pxvbnd4brV+q1TAV92oN1DmSXiPOvxWBndTuGV2+5c7sMyC6zMKhFcBL7E41eL7ye4Wf/NUhkaKBnLm6Zkj6HG7vI+WmaygGYGkVqTqFm1PM5Sh5zzyMvk+VN+JMWA9YqEi6RmUiw9nyj2+RvKBd/nwebpGkzv6S7PtS62bqpMlSk7f0QoKDBfR1RAP6FhIykpx6bksDEAv42l2ACgDOnmYs9kRyy9nbENnvLl11L0YMmsbiyu5ET58oH787TDsp5ssSCm7hPoZCDYHIq3hFQ2V3HUQ6OrALyJEAQ5IwDueb/4QJfjXjHzBJMxDVdXBmxE0FFpx1zZVNb5QLDr6at2dQDYUt2BrcrosjZjZPs7/j0BWZ5KmzMQ3CTfe3q0DwoM06kShpHZt3a58bHVNYPjjgBOoimKiSIkw1Z/3ffSrdYltc9FbYzURuZCNoHZNqs/7BoYqJw5LVnmDtlDv+IZzyBgu3XyelxPrGS/zNY7ykugnOO8DEX/5ydzZq7FmV7DcnEfBR486sP4nzd+hay8CMBt4GTh9x4HwXenbyJZlOHw==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(38100700002)(66556008)(66946007)(26005)(956004)(4744005)(9686003)(66476007)(85182001)(5660300002)(186003)(6496006)(6486002)(4326008)(316002)(8676002)(8936002)(2906002)(6666004)(6916009)(508600001)(54906003)(86362001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?N21HdDlhbVlnMUlYNlQ1elZMZk0rWU4vUVZIcW1OeVpSdkN2UUljaTdLTXZL?=
 =?utf-8?B?NFNGRituMitoYXNyVmVVRGcwNXVTUDVCV1B0UnJZOWpvQWNTY0Q2N3hyNUpi?=
 =?utf-8?B?K244NE5PcVdZU0wxL3B1bUZnZW5xZEJlS3BDRjVpRERGekJsbmFWcG90bU5W?=
 =?utf-8?B?UnJOWXRoN3dEbHAxdkZPZGlMZlJEY3VJcEF0ZVdFcDYxT05ZN2ZCNm5HeHAz?=
 =?utf-8?B?Sy84NXMvQ0JOdTdOb3V1cTdSbjFLQisyWHFIR1R3NFA5YS9xaWtSR3lrdGYy?=
 =?utf-8?B?L1hmOEJ5MFJWK3h2a3JnT25RM1luRmVHRXVCc0NOR0V3TXFEVXE2bjVqVlRm?=
 =?utf-8?B?SjBOSDZLNmppRXpqU0hIWlFZeFRSSEZ4Q1hPbnJWNzF4ZkxmM0FnNkIzZFZR?=
 =?utf-8?B?VjJaajlJU0RTekk0SFNKQWF4d2d4b3oyVno5WVBabUY4Z1VNcG9DRXZqOXk0?=
 =?utf-8?B?ZnRXMUNPSXFRc2FUUm1WY1VlUm9uTGZwYlJMcXlQRWZjTzRoTGhxeUJ3VmE1?=
 =?utf-8?B?dG9UTWE1alNpTEdvT2p1UVhOcitjYVNybHJMeEM4THFKWUlkQy82enJueko5?=
 =?utf-8?B?bWJYaWVRcWpBeFFNOU1YTEZTb3oxQlFhUzJ5VkQrOHJOZXNmNmRwRVlGK0NH?=
 =?utf-8?B?UWpNdnZsR0w5MjJWalROV1dZTEtQbWZHRXNqaW4yU295R0tsQkxOSlk3dVRU?=
 =?utf-8?B?eVoxc28vem9teGM1b1ZTZ1VCQWpYdXRvRTNQa0ZLek1MczcyTzZaZHE3NXFw?=
 =?utf-8?B?TzVWeUJKN0ErdW1TM2xhcnpNK3FkdnNnZHdXeTdrT3c2VCs4WmdtSmZJLzlp?=
 =?utf-8?B?cHhsQWRQd3VzOE9IS3o5L1BuRklwMU5VemNSY2lFcEhQRFdvR2JPZzRWcnRX?=
 =?utf-8?B?QmExMUFYSTNEWHIzWjJkeFlTekU0VUhYZjBieERSRlIzTnh2eXF5eXFkSmFD?=
 =?utf-8?B?ZllWQTZjWkQ2dGNGc0I5Ri9Gai9McjgySEFKZTJ4Z2lhWU1rdDEzSDJ6b3hq?=
 =?utf-8?B?MmlDSjZnQmwwcUlpT3MxczNzYU9EcktqMmwxdVJTZFNWb095dHVGVVE0bHkr?=
 =?utf-8?B?OXpJL2g3OVJmMk1HSnNsVi82N296dHZ1ZmM4Y1JvZWxVN1pvZXFZcWYwcXoy?=
 =?utf-8?B?Umc5NUJDQVJjWTFoYUV0ZTNvNFBEWm42QXVHcXpUQS9qT3JheWVFK3hlZUwz?=
 =?utf-8?B?bThRUnBMZFk3R2owdTBjS0FlQ3V3WXVKL25kQUllSzUrRHIxVjhYRHhnM2Jh?=
 =?utf-8?B?Q3RXbGt3eHN1UGo5QVNVMVFWSHByVDZrSDFrZnl2SGR3RWMxNFljbFlHU0Rv?=
 =?utf-8?B?TktaNXhzandNdm9yVlhPVkhuQ0NqdUxOU0wyMmtIM01iUjNFYkxmaEZ5Zk9s?=
 =?utf-8?B?bUMweks4NnE1Vy9Qb3EyeWh6RWtoTHZnT0xuUWJiRG9DZE9TNzBsMXlDd28z?=
 =?utf-8?B?b1UvY0NxeGllVGs0bGtRd1ZpdG1KNFVYWUdWaUdTckJDbUFHRFlVR3pCMXk2?=
 =?utf-8?B?ODdRcloxOE0wZExuNStNbnl3akdPRHFsL3g2Q05jcytNNk94QmdvYlhva1Rt?=
 =?utf-8?B?Q0ZwcDMwaXhROEduaEpZMlk2ODdrbUZsTFdpRWVzM212MzVWSVUzQnJ6WEZN?=
 =?utf-8?B?dUhOOS9Jd0NYcktGaURpWGs4c3NzMDFEaSsvR0xZd3ZkQ0dpTjFLcHFKWldQ?=
 =?utf-8?B?cVppMGJTZHpXTlB5NnFxa3FDMFFBTFdBWnRmeXBac2RmZVJhdGRNTE82a1NG?=
 =?utf-8?Q?SQaw6T2vZuUEosi2lWU4qh27Wu9yxVsfxAIocEi?=
X-MS-Exchange-CrossTenant-Network-Message-Id: af49ae8c-dadb-4153-a25c-08d97e6b63d1
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Sep 2021 08:23:15.2173
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 30IcUcn7kT8TALqPhz0PSq0Jbc96/Z6hebRFv/ZOivJ7cT9pLbvA7cZOvepJrRjSNGG1iNB0leKOk87eTwUJcw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR03MB5463
X-OriginatorOrg: citrix.com

On Tue, Sep 21, 2021 at 09:20:32AM +0200, Jan Beulich wrote:
> There's not really any register state associated with offline vCPU-s, so
> avoid spamming the log with largely useless information while still
> leaving an indication of the fact.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>

Is the state cleared when the vCPU is brought down? Or else it might
be interesting to print such state for debug purposes.

Thanks, Roger.

