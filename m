Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 53E8E431B41
	for <lists+xen-devel@lfdr.de>; Mon, 18 Oct 2021 15:30:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.212294.370120 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mcShq-0006XQ-Mk; Mon, 18 Oct 2021 13:29:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 212294.370120; Mon, 18 Oct 2021 13:29:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mcShq-0006Ui-Ip; Mon, 18 Oct 2021 13:29:34 +0000
Received: by outflank-mailman (input) for mailman id 212294;
 Mon, 18 Oct 2021 13:29:33 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=RJnW=PG=citrix.com=Andrew.Cooper3@srs-us1.protection.inumbo.net>)
 id 1mcShp-0006Ub-0X
 for xen-devel@lists.xenproject.org; Mon, 18 Oct 2021 13:29:33 +0000
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 6d170604-3017-11ec-82d7-12813bfff9fa;
 Mon, 18 Oct 2021 13:29:32 +0000 (UTC)
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
X-Inumbo-ID: 6d170604-3017-11ec-82d7-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1634563771;
  h=to:cc:references:from:subject:message-id:date:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=Ece8lD7yKfqI9OUWub6J+dTkRoS1NKzNSvdQ8ZiE+Gg=;
  b=HTDgI78wbosTX8wGyFkOqAtx2o/pSz2SCzfxG8Gw2kRgv4N7xCsa1Ogc
   ZDIohmb8mdXmvSeKkjlfC6fJxefeAV1LX7BzVi3HzfY/K1V5c+Hxj/EFZ
   nfJat+odezJTChYlUlOm+rVF3RK7kseNi30f1B4D8F7E7pcwFZNly/L7Q
   k=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: PZY0ckOnrNcz1QDsUS3MKkKsKkoMJwFj/j73EJiQrN0GD7rjzzdmilvn5quXuzkQVrqvTTkngW
 +GXWQ1iuX4y6O2jm7Rrw3bfiVVbFF9Cc7Zo0wVXj3+TpULUNEO4WFqMuVZdd/iB4mN5cR3ko+j
 t5qzZfQws+91gLpnx3fBVx8g+b6CUFPcBzD+kofv53WVOaSRODYyoeX6JZ3W3/2wTnUBe/POil
 sRHMYEhNvgo+SQ89lcFMq/84D92i8Rn/4We0fsxGjMp9+myn3hUivtpK1SAMbujGuUf9aJtqRO
 4czWqNVhytErJ/c6YPjgnzKW
X-SBRS: 5.1
X-MesageID: 55422363
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:t/iMlakcAhkj5Wq5QMp+d1fo5gxgIURdPkR7XQ2eYbSJt1+Wr1Gzt
 xIZDG7Ta/rba2GkKoh1YNnkoExX7ZLTxtEwHgM4+y1hFyMWpZLJC+rCIxarNUt+DCFioGGLT
 Sk6QoOdRCzhZiaE/n9BClVlxJVF/fngqoDUUYYoAQgsA185IMsdoUg7wbdg2tc42YLR7z6l4
 rseneWOYDdJ5BYsWo4kw/rrRMRH5amaVJsw5zTSVNgT1LPsvyB94KE3fMldG0DQUIhMdtNWc
 s6YpF2PEsE1yD92Yj+tuu6TnkTn2dc+NyDW4pZdc/DKbhSvOkXee0v0XRYRQR4/ttmHozx+4
 M5Bm4G1FBcVBYDdt8Q2WDlYTjtTYKITrdcrIVDn2SCS50jPcn+qyPRyFkAme4Yf/46bA0kXq
 6ZecmpUKEne2aTmm9pXScE17ignBODtMJkSpTdLyjbBAOx9aZvCX7/L9ZlT2zJYasVmQKuCP
 ZBCN2EHgBLoOyB3FA8NA64HnqSTqSP1dBd6pk2+jP9ii4TU5FMoi+W8WDbPQfSLWsd9jkuev
 njB/WnyHlcdLtP34SWB2mKhgKnIhyyTcJIfEvi0++BnhHWXx3cPE1sGWF2ju/67h0WiHdVFJ
 CQpFjEG9PZoshbxF5+kAkP+8CXsUgMgt8R4COEU9QTQ2pbvzhe2JkMPbj4ccvF7u5pjLdA17
 WOhk9TsDD1plbSaT3OB67uZxQ+P1TgpwXwqPnBcE1NUizX3iMRq1EiXF4c8eEKgpoStQWmY/
 tyckMQpa1z/Z+Yw3KKn4UuPvTuoopXYJuLezlSKBjz7hu+ViYjMWmBJ1bQ5xasYRGp6ZgPY1
 JThpyR4xLpfZX1qvHfVKNjh5Jnzu5643MT02DaD5aUJ+TW34GKEdotN+jx4L0oBGp9aImO1M
 RKC418Nvs470J6WgUlfOdPZ5yMClvCIKDgYfqqMMoomjmZZJWdrAx2ClWbPhjuwwSDAYIk0O
 IuBcNbEMJrpIf8P8dZCfM9EieVD7nlnnQv7HMmnpzz6gev2TCPEEt8tbQrRBt3VGYvZ+W05B
 f4EbJDUo/ieOcWjChTqHXk7dgxTciVnWMmr8qS6tIere2JbJY3oMNeIqZsJcI15haVF0ODO+
 3C2QEhDz1Tjw3bALG23hrpLNNsDhL5z8iA2OzICJ1Gt1yRxaIqj9v5HJZA2YaMm5KpoyvstF
 6sJfMCJA/JuTDXb+mtCMcmh/dI6LBn71xiTOyeFYSQke8IyTQL+5dK5LBDk8zMDD3TruJJm8
 aGgzA7SXbEKWx9mUJTNcPuqwl7o5Sodlet+UlHmON5WfEmwooFmJzao1q08It0WKAWFzTyfj
 l7EDRAdrOjLgok07NiW2vzU89b3S7NzRxMIEXPa4LC6MTjh0lCimYIQAvyVeT39VX/v/Pnwb
 +ti0PyhYuYMm0xHstQgHu8zn74+/dbmu5RT0h9gQCfQd12uB75tfiuG0M1IuvEfz7NVo1LrC
 EeG+90cMrSVIsL1VlUWIVN9POiE0PgVnBjU7Og0fxqmtHMmouLfXBUAJQSIhQxcMKBxYdEsz
 uoWscIL7xCy10gxOdGcgyEIr2mBIxTsiUn8Wk321GMztjcW9w==
IronPort-HdrOrdr: A9a23:M2vhR6g8Dp0mLwODRT61FdYroHBQX0113DAbv31ZSRFFG/FwyP
 rAoB1L73PJYWgqNU3I+ergBEGBKUmskKKdkrNhQotKOzOWxFdATbsSkLcKpgePJ8SQzJ8k6U
 4NSdkYNDS0NykBsS+Y2njJLz9D+qj/zEnAv463pB0MPGIaGJ2IrT0JbjpzencGNTWubqBJcq
 Z0iPA3xQZINU5nFfhSURI+Lpb+TpDw5d7bSC9DIyRixBiFjDuu5rK/Ox+E3i0GWzcK5bs562
 DKnyHw+63m6piAu1Hh/l6Wy64TtMrqy9NFCsDJos8JKg/0ggLtQIh6QbWNsB08venqwlc3l9
 vnpQsmIq1ImjzsV1DwhSGo9xjr0T4o5XOn4ViEgUH7qci8fz4+A9opv/MTTjLpr24b+P1s2q
 NC2GyU87BNCwnboSj779/UEzl3i0uduxMZ4K0upk0adbFbRK5arIQZ8k8QOowHBjjG5IcuF/
 QrJN3A5cxRbUiRYxnizylSKeSXLzEO9yq9Mww/UpT/6UkQoJk59TpY+CUnpAZDyHpnIKM0od
 gtMcxT5flzp4EtHPtA7Epoe7rBNoX3e2O4DIulGyWvKEg2AQO+l3fJ2sRA2AiLQu1D8HJgou
 WNbLtn3VRCDX4GT/f+hKF2zg==
X-IronPort-AV: E=Sophos;i="5.85,382,1624334400"; 
   d="scan'208";a="55422363"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gp/pqutOdCJl/jfw+EBPWQcB4r5tqvAVuGj1uDJ7eC2npNulDhawHQg977XMMpYjx6GyJApdQxSDWDB0o20RrHYITnWMfWBJ3Ra+/fkm0UHXqZq2QV489yKgGYy7eS9tVzWEMauhlNWBnirbVWf0n8BqBtU0TQlL+/L0WLiFU1ioN+Z/fUVVC3oXJqE6fY1PA2FELlT9MHSVV/YSEfjqtSJhMcgRv+VoCiB1+Gumf2aRsBqJEBNBWHrwYQxLtLnZpgH1rykdgkqKL2SCDIBQhCSML08HwR7RTPS0mWPoVKcSonMKZ7krkcAMZwp45iLB09n0TzPvXxDuKGtm3byrmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ece8lD7yKfqI9OUWub6J+dTkRoS1NKzNSvdQ8ZiE+Gg=;
 b=J59/YsSwnRUcZH/VFZ4w3xj8O4jc/5WsTWnVWVqPHrb71PoddeGBCa1CvTSNCq8KDncY7EoUOcZUf707HD9vMmIIueJrUArI6xwKE1pgZHAZc8N48wKetgBqOdBLWsFFeDAkRIZWkYIp0bu+VoEpDYATZnQla6xNWbzRQ4QA36SQIl7VB6Yl0VeQRG4pkkUDxVu1Kw3rfZuq/yHXt+7K+4GZ4kAJK95iGX/BDVm5aZ9qAI6Eisa8/AObT99p88yOyfCMpUtzxVoHzjDRMtZ3UTg6DsX5r4Xd5Aq/H95XwnincAGrbQ3dWe+dXaLXVLpkks3Bn8MjwyWu3cC6rp9JFA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ece8lD7yKfqI9OUWub6J+dTkRoS1NKzNSvdQ8ZiE+Gg=;
 b=v0bjXBRYGx6WCFvlaaX+ps4WtC8+vS8BYkjG+srRaMRH0VW+eEK8e7LuoGcp6hHDw6T5FPW59j361ZoVcSfSU1Z3NrmmVXO+GVgNb5so0+ee3DIyq/lIW3EImBInOlor+uNvLoxrwHeSHWH5fr/c3clhVv4FEVNfTppXklBsXgM=
To: Ian Jackson <iwj@xenproject.org>
CC: Wei Liu <wl@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>, Jane
 Malalane <jane.malalane@citrix.com>
References: <20211018100848.10612-1-jane.malalane@citrix.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH for-4.16] tests/resource: Extend to check that the grant
 frames are mapped correctly
Message-ID: <f25e1fdb-90fb-7273-243d-e197eb9e2f92@citrix.com>
Date: Mon, 18 Oct 2021 14:28:53 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <20211018100848.10612-1-jane.malalane@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Content-Language: en-GB
X-ClientProxiedBy: LO4P123CA0063.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:153::14) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3a1b73b6-5d8c-4b6b-72da-08d9923b3e60
X-MS-TrafficTypeDiagnostic: BY5PR03MB5046:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BY5PR03MB50460A5CC4987054F1BD46D0BABC9@BY5PR03MB5046.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: KjnjVVi6MpxvCL/AKPwxyj9l8LixojsN/yPgtaKHcobZCcGX/JNcSSN+IylVdM2eou7qBcc6DcF4kXGuOWP0UILLUT54iGZaGKzUtz2qCorWGgSyYg+NDp4Kau6EE6Sh8kCl3Yjb5c1zjmI1U5/004Ns0eLhlmvjG7cqxg0p2B6kL64n2bGA/Jz7L7I7soJ58395n4gNryRsTwiQA7ilVfF72xTO1X2BKgtHyPLKJzdhsLcNOssO+u4Pb1/twrMzwGQiJ3RdIv54vKmkDITanQOdZpfzQqyoKz1xPINPw/mpwQoPTEsLJm99HdctQMhO2c5mi5neY2A7kKU/WKwQY4MnxKsIWp7RoKTGBSAUMiZrZxVn1Y2Ay+H168JHUEyW7yiYPDfVJc8K6fnDtgios5ptvqNXbWVocI7MsmEC78H4Bc/yJNUxpM0+gDGCW0ayEhc+krFoFWikUaujoUYF/lRHOeeF5WEb0nou5kQWgekoZ0gh4nTG/MOn9hxJowlYzW9KSPls3q1SNLvsl0jh/95wgOL+RlIPpIHrWf2kOEVjaIdGKD0Rd7kfy1d6ucMa0Rby1cppgqFMeU7Da6BOM6aqi/4CqmNixxpORI75BYTsaJlA5SsF4iNMgPZI/2FjfKK2ENo3CvcZtOu903NulSulnqrDZU+slHspTefLeme+X1PVrAiYkdPojlMk6Ou0wTVLUraowYNzt8A5CR8Dl5X51B7iUfoCCMAQAHIQp00=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(8936002)(26005)(316002)(66946007)(4744005)(6486002)(16576012)(2616005)(5660300002)(54906003)(956004)(31686004)(107886003)(31696002)(36756003)(8676002)(82960400001)(66556008)(66476007)(53546011)(508600001)(4326008)(6916009)(2906002)(83380400001)(86362001)(186003)(38100700002)(6666004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UE16NnNkNlRnV1luQzZiWlVXRENDSFNEMWhhUDNIN2VvWEJwbEV5bDh3U1c5?=
 =?utf-8?B?Y1FWVzgyZEN2RUM2TW13WER4bWdvMEhTR25YeFdOS2F1UzZkWElVT2RvZWhS?=
 =?utf-8?B?NGtuWTd2dWUxQXNXS05WV2VqMVJUcVBkWlQ5L1FnTGhHWmJzSWJ6K1lUQmV3?=
 =?utf-8?B?M2hOT1NmRUZiQktqemQ0QjJldDV6WjVWVEpNSDlDanc4OGRWMGdrOGp4L0s4?=
 =?utf-8?B?WjJlUXdFQmp5Y3RTRlZBWlhlWmhSYU1OZ1p0V1NHbDgrc0hsdXdlTHFIWWlS?=
 =?utf-8?B?UkQ0eFhYQVM3N0dzSStuNGV2eFJzWXR6LzRGbE5DRUYwNTA1WU5tbFMrTHdk?=
 =?utf-8?B?QmpVUVl1cytMcGVaNTJTUGlWeVJoSXgxbjFucnF4bEtvOGVDRSt3Q3kvby9X?=
 =?utf-8?B?YnJqZE5GM1BtK0VLVDFJYU5iYUFEMHRDRW42RlJkYTR5TDYwN2JXWTQ1WW55?=
 =?utf-8?B?TFhJUVhYZkFXODVqbndZYzN5Y0ozME5JMmlGSk5Fb1B3dEtiek0wM3I4OUZF?=
 =?utf-8?B?TWwwci9VNDd5ZVZsZm1kREFFTGQxTzdzdkNrKzQvaTVTTEVxalpnZE9VRk9Z?=
 =?utf-8?B?TDIwUDZQckJYdTQ2S2I2N2JuRFpQR0gxL3hFNURWSFA1ZWYwREIxbEl5MXBF?=
 =?utf-8?B?TDF1aUY2RDQ5NC8yQzRDNDlCdTlQTnBZZHFGL05SWUdoRWJWTFBBREpoTVoz?=
 =?utf-8?B?eC9DUW8zYjZRYlRoZ05Fd3Z1YitNeXlCNHVsQVdyYlhKK2xla3J5cHVmZ0Fs?=
 =?utf-8?B?c1o0Z0pZYnNXVS9hcWY0RjN3VWpSV0srQkZJblMxM3JvMWxlRmVWQmttcmNl?=
 =?utf-8?B?L2VZSmk1ZTYxTXJEY2pIVXBrRlR3Z2FZMC9wUUs1RTdIUXBoaTZDZWhLVFJo?=
 =?utf-8?B?WE56THQ2TytRamJHdmJNVGtqZ0tqVUNHQ24zbWNKQkFaNkJSU2FXaUxTay9i?=
 =?utf-8?B?RDFSUmJOZUZkNktVV2dOZzYrM1lPQ0FTTWVtV0xUbjN6Y3U3RGllelQ0WEpT?=
 =?utf-8?B?cUFQSW0yMVJvU1UvYlVKVms0REVVUDlvYVBzcW1YUGE2UEpHNEpVM1lEYmtD?=
 =?utf-8?B?UHNKUE40cS8rSmgrNVJZRjJzQUYrRG5xNktHdWRMTFZ0MmM1S2MrWEFNTXRH?=
 =?utf-8?B?eGIxeTczV01UQ3BUWFZFWUl1b0JaTi9TM1hwQzErcWxNQm9yZWZKZEM0L3U1?=
 =?utf-8?B?S0JvbXRtbCsxdWQwbGxKa1MvRWU5eCt6ZUhVTGVmM05VVi8zZy9CRjF4SmxJ?=
 =?utf-8?B?Sk1ONit1QU1tR3V6c0JNRTBGUUNhUitsL3lnQk11UXBJbEQxeVJwNWlRMkY0?=
 =?utf-8?B?cTU0UkR3ejdwOTV2Wnh1NFJ4U3RtaTFFb2Y3YUtBVzVBV0I2d1RmNlRNQ0J0?=
 =?utf-8?B?UFVHMU1hZ2R1L1FJa0ZRR3ZmQ1FPV2owZXlHQ3dWeEdNcE9zY21HM0ZhSTlo?=
 =?utf-8?B?TkVkMWJpRUtLbHd3TmRhSXp4RGJHeUhyNW9PTFRlUll4YmZISEJ0QUN4RThi?=
 =?utf-8?B?ZmdZMUQ4TVAxVE4wZEFzdlQzRTJGRjBnSGFxeXQra0F5ZVBRMXF0Wm5JNWpH?=
 =?utf-8?B?aVY3L1BvcTRVTzhSWGpDNlBIMDhWWXRGQ2ljRW1oVmRXSnFVSWpvQlJWK1Nq?=
 =?utf-8?B?R1hzV3BJOFQyYlJBaHZIU1lPYVlUN1ovTURBVlFqRWdYODFZSUxEbWdmL3FW?=
 =?utf-8?B?MHdIMjhjbmF1STR3emFMYjhMOUo4dzBDS0xtRUVvUUFkR0J5S0RtMmxxbWxM?=
 =?utf-8?Q?hpcA22MlsxqS7hcxbknBoo6u29zsFMF1Mz3MJNy?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 3a1b73b6-5d8c-4b6b-72da-08d9923b3e60
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Oct 2021 13:28:59.8349
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GnClVom18x1xGfXQ3jDuGK6MZ8pqMQqzMyUUQlfRhmaQ+NFLeS8N8euePirctDqMTtl8HtIv/3Jtg0pWwgxUWA+kP7D9/KIIZjMYJGB0040=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR03MB5046
X-OriginatorOrg: citrix.com

On 18/10/2021 11:08, Jane Malalane wrote:
> Previously, we checked that we could map 40 pages with nothing
> complaining. Now we're adding extra logic to check that those 40
> frames are "correct".
>
> Suggested-by: Andrew Cooper <andrew.cooper3@citrix.com>
> Signed-off-by: Jane Malalane <jane.malalane@citrix.com>

Ian:=C2=A0 I'd like this to be considered for 4.16.=C2=A0 It is extending a=
n
existing test case with better error detection.

It was a task I didn't get around to at the time, because of the 4.15
release freeze...=C2=A0 How time flies.

Anyway, it is very low risk to the release, and 0 risk for anyone who
doesn't run the tests...

~Andrew


