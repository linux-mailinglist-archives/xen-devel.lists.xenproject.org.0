Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A81014CBC3F
	for <lists+xen-devel@lfdr.de>; Thu,  3 Mar 2022 12:15:58 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.283161.482087 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nPjQo-000208-2h; Thu, 03 Mar 2022 11:15:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 283161.482087; Thu, 03 Mar 2022 11:15:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nPjQn-0001xj-V4; Thu, 03 Mar 2022 11:15:37 +0000
Received: by outflank-mailman (input) for mailman id 283161;
 Thu, 03 Mar 2022 11:15:37 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=++p5=TO=citrix.com=prvs=054f29298=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1nPjQm-0001xN-WB
 for xen-devel@lists.xenproject.org; Thu, 03 Mar 2022 11:15:37 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3e715569-9ae3-11ec-8539-5f4723681683;
 Thu, 03 Mar 2022 12:15:35 +0100 (CET)
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
X-Inumbo-ID: 3e715569-9ae3-11ec-8539-5f4723681683
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1646306135;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=Odd7VUtRxTM1w/B3gktcj2B+VIG94zSwy4YhPfWEIQg=;
  b=YpamuuBjpXiOtS6vwZfjxnFSyzShjEUb/wfxiaYIlIud1MHz+GohZAXf
   iSxxJaLEz6C7BhGDI4uc1kibuhMS50H7o2JoOJx1oPl2+p0TNIIUh06cu
   fq5JOceYz8wHn2GqPUWF+v0IGxIWqyX4/QW/ED95uZs2eEg5PGiiHN//n
   g=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
X-SBRS: 5.1
X-MesageID: 65785294
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:u7mdM6nFWYfvwlY2DDT4GXzo5gycJkRdPkR7XQ2eYbSJt1+Wr1Gzt
 xIcCDjQbqnZZGLyftEgOdu/8UJVu5DQyoQyTQBtrX8yFiMWpZLJC+rCIxarNUt+DCFioGGLT
 Sk6QoOdRCzhZiaE/n9BCpC48T8kk/vgqoPUUIYoAAgoLeNfYHpn2EoLd9IR2NYy24DiW1jV4
 7senuWEULOb828sWo4rw/rrRCNH5JwebxtB4zTSzdgS1LPvvyF94KA3fMldHFOhKmVgJcaoR
 v6r8V2M1jixEyHBqD+Suu2TnkUiGtY+NOUV45Zcc/DKbhNq/kTe3kunXRa1hIg+ZzihxrhMJ
 NtxWZOYQycvYJHw36MkDRxlIQpxIo1gu4fJPi3q2SCT5xWun3rExvxvCAc9PJEC+/YxCmZLn
 RAaAGlTNFbZ3bvwme/lDLk37iggBJCD0Ic3k3ds1zzGS90hRojOWf7i7t5ExjYgwMtJGJ4yY
 uJHNGU/MU6RP3WjPH9IVYIHu+6lt0XbcgV6o1upuaYR6VfMmVkZPL/Fb4OOJ43iqd9utlaVo
 CfK8nr0BjkeNceD0nyV/3S0nOjNkCjnHoUIG9WQ6fpCkFCVgGsJB3U+V1G2vP24gU6WQM9EJ
 gof/S9GkEQp3BX1FJ+nBUT++SPa+E5HMzZNLwEkwAutzPTo30HePzYBcwxqZ8MGkowOSyN/g
 zdlgOjVLTBotbSUT1eU+bGVsS6+NEApEIMSWcMXZVBbuoe++enfmjqKF48+S/Dt0rUZDBmtm
 2jikcQou1kEYSfnPY2f9EuPvT+jr4OhouUdtlSOBTLNAu+UieeYi22UBbrzsK4owGWxFADpU
 J04dy62trpm4XalznHlfQn1NOv1j8tpyRWF6bKVI7Ev9i6251modp1K7Td1KS9Ba5hYJ2W1P
 hOC4lwMvfe/2UdGi4ctOepd7OxwkMDd+SnNDKiIPrKinLArHON4wM2eTRHJhD28+KTduao+J
 Y2aYa6R4YUyUsxaIM6Nb75Fi9cDn3lmrUuKHMyT50n3gNK2OS/OIZ9YYQTmUwzMxP7dyOkj2
 40EbJXiJtQ2eLCWXxQ7BqZIdQFadSVgXMuuwyGVH8baSjdb9KgaI6a56ZsqepB/nrQTkeHN/
 3qnXVRfxka5jnrCQThmoFg4AF8zdf6TdU4GABE=
IronPort-HdrOrdr: A9a23:cQUMZqwM1JNOcSTT1/qlKrPxguskLtp133Aq2lEZdPULSKOlfp
 GV8MjziyWYtN9IYgBcpTiBUJPwJE81bfZOkMYs1MSZLXXbUQyTXc9fBOrZsnHd8kjFmNK1up
 0QCpSWZOeAbmSSyPyKmjVQcOxQgeVvkprY/ds2pk0FJWoBCsFdBkVCe32m+yVNNVJ77PECZf
 6hD7981lydkAMsH6OG7xc+Lor+juyOsKijTQ8NBhYh5gXLpyiv8qTGHx+R2Qpbey9TwJ85mF
 K10zDR1+GGibWW2xXc32jc49B9g9360OZOA8SKl4w8NijssAC1f45sMofy/wzd4dvfqmrCou
 O85yvIDP4DrE85uVvF5ycF7jOQlQrGLUWSkGNwz0GT+fARDwhKdPapzbgpDCcxrXBQ5u2UmZ
 g7r15w/fBsfGL9tTW46N7SWx5wkE2o5XIkjO4IlnRaFZATcblLsOUkjQho+bo7bWvHAbocYa
 FT5QDnlYJrWELfa2qcsnhkwdSqUHh2FhCaQlIassjQ1zRNhnh2w0YR2cRaxx47hd8AYogB4/
 6BPrVjlblIQMNTZaVhBP0ZSc/yDmDWWxrDPG+bPFyiHqAaPHDGrYLx/dwOlauXUY1NyIF3lI
 XKUVteu2J3c0XyCdeW1JkO6RzJSHXVZ0Wa9iif3ekPhlTRfsuYDcTYciFcryKJmYRrPvHm
X-IronPort-AV: E=Sophos;i="5.90,151,1643691600"; 
   d="scan'208";a="65785294"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=X2BSj/dCSsf3ropUMFkW/oCu89gMDp6/kF6DXbEJhRXOfBfR6todrwGMv8vmjrOdYoWWLYUJ34+KPQ50+CmoLJJ93Yfdr5lv8d1CjDe9PxxxjWxvBCH1nXK4MN7wS6HvoZg5xAkIU4Lc2R8HI+npCv1Fd1SlFIrcApOJuY9WMYyY3i8SN2F5GTi+Yaqh21qJ3zIvfZsXld+ie/V85wK+6JySVFJdcEK+E4H0quF/JACyIAK8sg4o7dyog55JIpEnO3sWqFVVCL1TF5NGuG0wWuzZmsWtGYh1NDaYGMgJLqeMFpLx000ElZTZeUl3yFKVL8pve/vXPE8nKWXP4ofKLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Odd7VUtRxTM1w/B3gktcj2B+VIG94zSwy4YhPfWEIQg=;
 b=KPlDtD2EL+2UO+psrxqUTjha+B5Ylbaf7TjXdbdef7Dm0AulJQcXBPHvRjBKZQ4/jGsYNJBlMlH2Xubw8q4qBTEf710g6MdlLQE913lO19oj+kyhmTzLkQITyVFqZGcyX0oB5SUA9brC3KgHqBqrq4HE5eLSSwAip9tj2jPwlWS1quNnlS+YQ83Hds5xZ0BKg6GLuNW7EKPhlMftUOUZ9wLUbuTCg5tFMaZvMzsr7toYzJkBANhu2+dqfVYRugYmiVUTOxdUPFcJixykdoBzGxzL75CAGLDxWI8MgUJHm2NAHLsYE2gkTDYzStjruI95AulvOpVQICdH1tnb4w1oyw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Odd7VUtRxTM1w/B3gktcj2B+VIG94zSwy4YhPfWEIQg=;
 b=aq1jlE7By5otg8Ajr9Jin5ZgJmfkWTN6TYc5HA5D/BCITrcs8denxkovpNgYC/Q60PFCO2MMwyHF3c8X52T2SjaHME64I1FXs0MNacUaU9OUjOkeMQqnH/+JUUuYLRqQqUJox/f9H6OlfSMtKS90zGZYecrL8K12iFOuje2Heko=
From: Andrew Cooper <Andrew.Cooper3@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Roger Pau Monne <roger.pau@citrix.com>, Wei Liu <wl@xen.org>, Xen-devel
	<xen-devel@lists.xenproject.org>
Subject: Re: [PATCH] x86/cmdline: Interpret 'vpmu' as a positive boolean
Thread-Topic: [PATCH] x86/cmdline: Interpret 'vpmu' as a positive boolean
Thread-Index: AQHYLoKhjt6lbGTIskelwxGk8I14LqytR+SAgAAzewCAAARlAIAAAy+A
Date: Thu, 3 Mar 2022 11:15:27 +0000
Message-ID: <9377d616-e5ea-a3a5-0a90-e2ec81ca6fb8@citrix.com>
References: <20220302221157.17246-1-andrew.cooper3@citrix.com>
 <6ffbc025-758e-bb7e-4e87-0b6b9e1bc2e5@suse.com>
 <bd6dda42-fc33-5958-31e7-741853c85c9b@citrix.com>
 <3bbbe906-ca02-c748-23fe-7a98864cfb93@suse.com>
In-Reply-To: <3bbbe906-ca02-c748-23fe-7a98864cfb93@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 00e8cbf7-5ef6-49b1-4716-08d9fd071f00
x-ms-traffictypediagnostic: BYAPR03MB4341:EE_
x-microsoft-antispam-prvs: <BYAPR03MB4341D77DE7D8206462EE5304BA049@BYAPR03MB4341.namprd03.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: kuLl4k2mtVEoWK/xGJMnY/VWbyT7PlXqMhW2Q6H7CuUCWyvfKHR2Fi4hXFm7/dNGsrPQfzVpv8E64uHF1GQcI7dA+1SfR/w/03ZGdUB0NX1JtddOC8E58CDRuY92Rgu9w+DTnE4NwQPV5EZQe2rhGhegIjGznsiqHo9fDekMYtWxrE5os6HC5yx5A1qri7hkCw4nMP7zslbAm1/KNPK+yE+p8km/2NJRDKxA2CLgro9oNXv56k9UzLfYFpN11ENmkvFJuoGzcts6WLAUrDcVY7BlQqURkG/pSO2fr23o2Bkbb7yw0IWQtwD1L2bO+vtiGb0zJWXddHvtJMEyMgebtBwOpZKI1W8aOD6Xqq3eVkRM+J5xxghiRblr9kARJzdIv+/qQEsNMbem+5Q73y9lyy+JMyRKOunASTsiMeZCPiFPfMQkyEEaQB6BGmGSpsD4fm7cFM4rF6rVjl1HPYpA8rhLGsTyS+DzXlq8TgUDvrEUrXzE/PPwvjKRDY7O56xyLiZvzSJf4lGApU63lM/8kyVMsb6n1yUZAZ290rvmeAW5vOX0laZWVKyJWYTN+PCWWw6iz68kh8c3tW0jjq9mvBvZjCSf3pgF6gBpzAMoBiXaADwl8ag699QG9hVLwA79g5EsB1/81Nc5Z8wIKU1Zu8ELLCI70lQcOGijG9JVI8KbVa0sf1R5MxESO0Yt+9sLWiY55gb4zQgGCxw8Y1zRcR/Wz0CpTh5jbeVmISxcVLHFStfw6wrbWmHx17rdcRgwWlD77Zgw59ODujfLVh3Y4w==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(38070700005)(5660300002)(86362001)(31696002)(82960400001)(316002)(6512007)(8676002)(64756008)(66476007)(66946007)(76116006)(66446008)(4326008)(91956017)(2906002)(186003)(26005)(66556008)(2616005)(38100700002)(8936002)(53546011)(36756003)(6506007)(6486002)(71200400001)(508600001)(122000001)(83380400001)(54906003)(6916009)(31686004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?akU4eGJEY0NHN0Q4WldwYnlEdUVtRU5UKzhVZTRlcHJsdll3N2JrV09mUGR0?=
 =?utf-8?B?MWQ1SEZPWURaYXl5bC9xdTR2Q0NBQXdsdzJxQmhmemd0VWdRdVZMajFMWVFL?=
 =?utf-8?B?bHRKMVcrMGNtWFJUd1YrdGZKb1RPMG5zUHJkMFRZd2tmTC81RzhnUlJLd1Jp?=
 =?utf-8?B?UkVIaG5qcWs3NmZKazh5dUdRWnV6MndSSWtIS05XaVNoZ0tlV1R2L1Q2clNj?=
 =?utf-8?B?N2VRQm5VSnJQNUVKbVNrOGovd08zU1dscUhVMjdwS0lLY3JCUkZIZWVQdGx6?=
 =?utf-8?B?NEZJMGZQRjJ2QkYwSGdiY0RLWkREaVNub3JXMFdhcnU4YSs4WEV4blU0M1Ft?=
 =?utf-8?B?L1V4SzlRZTE4OFNRU3J2eHp3OFBTQnFyczJ6YWdjVXpTMDBJcHcyRTlaVmlR?=
 =?utf-8?B?NUg3MVhnRFk0S2xlTVFwZlJhVi9hcWZPSXV1SXJhS1M1VlA0SzM2d3R1WVpL?=
 =?utf-8?B?dVhUTElSRHJPdEdXSmFlSFFGbzVvbUp4ZGxLTnlXNVVkUEoxV1VkZm84N2h4?=
 =?utf-8?B?Mis5U0NvUWhkeUx5MTVsQjhab1hpckJSeWxUZUcrWXQ2RWIvMUovbEZLcm5I?=
 =?utf-8?B?MkwzUmp3RWU4ckdxdE9QM3VrVHpHMFpCQi9URXRIV2l0ak56SW9zaUpQazRJ?=
 =?utf-8?B?ZmNWc2VVcVl2a00xWHNNM1lzVDRKQ2w4c3E2R3dnZXc3SDdYM1dHL0c3Uldy?=
 =?utf-8?B?THZEVVFkdHBpeWhYSEpYS2VobDdNeWJYY1NnbEtVRzZaVlgwWW9MQ1RwdWVU?=
 =?utf-8?B?bFRMeDgreE5GbWQ5MlVjZVFYS3ZoR0ZwRkZaS2phMEl0aUlGTDU5NTgwUnYw?=
 =?utf-8?B?eDVZU3V4RVJzcE9raE1uWi9NYW9ITGxublYxZVlqNjVtZmZWOFFRYTc1SWdL?=
 =?utf-8?B?RVRZN2lYcEs5RWYwZVBFcmNLbTBRVzFpZkR5aXVHM1Q4cjlKUi9mZU1hNjcv?=
 =?utf-8?B?NENTMlJqRkJ3SzNGdGkwazdlVHVkTzA1a3FIUGtncDE4RjFMR1ZyUkJ5K29x?=
 =?utf-8?B?SEdQNDRuMXZwbFdScUV1eUpCTDRna1NFbElZL0NyRHM5cnNPb1I0WGtnS3d6?=
 =?utf-8?B?RHNtelh6NHhXUzduYytRU0diWGIyajc2UmhYRXRLYXQ5Y1lTYlkwNmFuMFZk?=
 =?utf-8?B?SXRuZkNwWjRpR2E3dGoyZ2hyVU9YL08rZ3BoSUVPMDhzYlRWb0dqY0dMaVA0?=
 =?utf-8?B?VElVQWw0SkMyUWF3UjFSMis4dFNRT2lIQWF2ZWQ0TUVWYXhud1ZOaGh6L2Vw?=
 =?utf-8?B?d3FZQ2p1MURoQngraHgvdnpwbi9EM0lvclhGak9aZStmNGFxNU4xV25DRDBm?=
 =?utf-8?B?RXRIcE0zU0VaczNXZEVFa2tsWTh2THhhMXlCZ3MrRE5tNFN3NGJ4MUhOL1hF?=
 =?utf-8?B?OXU4Tm5vY1BtZmY3YkJqSnRrUkVRNGRLZXRIZ1dXYnVEWXpkY29UVjA2VFhw?=
 =?utf-8?B?MHlRUE04Rkx5citWWGNFS1dPaGNrNWFpLy9EY21CcE93ZjlQb0NDdU1MSGFW?=
 =?utf-8?B?V21XTGR0MUxwS3ltaTRlWUJCd2RJTEUxYTQ5SVZyK2IrQzJVU1FLdU9VVmhz?=
 =?utf-8?B?dDBObUdDekJaMWpNaWpXNllKTng4c0JpbTl4d1ZhYWp6anhqMFJuRDlyVG93?=
 =?utf-8?B?M1JURXFwMnRteVFESm4vSnBZT1NnQjRIUjRidkVhRXpGMVVrMEQveHhOS0hV?=
 =?utf-8?B?OU9IcjZCTkI5cFhSdHRZN3NJcEYwSGtteTFjaEhLVkxoQWJpZkFDZE9Pekpj?=
 =?utf-8?B?dUVSd1RGT1FwZXFTbCt1REJqNHpEc1gzSko1TkJaZVpRVGZOY3ExZDd3K0Mv?=
 =?utf-8?B?UTErR2RsYTg4dzFidko4Ti9qY2hpdFBkOFgxbmhuUUNlTGhHSlNaaXpEcGZs?=
 =?utf-8?B?RjF4clBRbFI3TzYrLy9kZDdwcGJabWJQWFRha1F6OXMzaXBLclM1N2p0cnha?=
 =?utf-8?B?NFhja0RjNWlZYjhvaGp1bVFhbW00Qks5UFo5UzhIMzQ4bTcwc09yU0w0Q0tI?=
 =?utf-8?B?UmRSQmpMR0QzNFloSTBQNlF2QW1KVzZONG91dVVpWVREUUlLbWNmb1l4ZEtD?=
 =?utf-8?B?UlJ4c1VJVnc2aHJ4WnNnWktpdVVrcngxYk1SczRlVGFtcndIUHVTVU54QXpn?=
 =?utf-8?B?M1o2WElDSkFBQVpJa1BPK2psSy9nV3ZpTUVIckp5ajIrWHdMRmZyczRvcnBm?=
 =?utf-8?B?K09Vb0lsN2hKN1RGU3J1dmhzSzZyazZJdXgyYm1CaWJQUjZickpnQkx6SlV1?=
 =?utf-8?B?NWpaTFJoVWhYRnBML0RITzBDeWxRPT0=?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <4066AD38C7418C488CA1A9FF4F38E9E8@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 00e8cbf7-5ef6-49b1-4716-08d9fd071f00
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Mar 2022 11:15:27.5408
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: +A4WLVUAirCqxh6CpSzBfp6iXqFXM+G4yTHk+fuUnYhvZupBD93G4OLeyEO2a1NA/jdYjvPu8bbk11wvJsTnAKc5SpnaXVmGo4xGBiyE3ec=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR03MB4341
X-OriginatorOrg: citrix.com

T24gMDMvMDMvMjAyMiAxMTowNCwgSmFuIEJldWxpY2ggd3JvdGU6DQo+IE9uIDAzLjAzLjIwMjIg
MTE6NDgsIEFuZHJldyBDb29wZXIgd3JvdGU6DQo+PiBPbiAwMy8wMy8yMDIyIDA3OjQ0LCBKYW4g
QmV1bGljaCB3cm90ZToNCj4+PiBPbiAwMi4wMy4yMDIyIDIzOjExLCBBbmRyZXcgQ29vcGVyIHdy
b3RlOg0KPj4+PiBUaGlzIG1ha2VzIGl0IGJlaGF2ZSBzbGlnaHRseSBtb3JlIGxpa2UgYSByZWd1
bGFyIGJvb2xlYW4gb3B0aW9uLg0KPj4+Pg0KPj4+PiBTaWduZWQtb2ZmLWJ5OiBBbmRyZXcgQ29v
cGVyIDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tPg0KPj4+IFJldmlld2VkLWJ5OiBKYW4gQmV1
bGljaCA8amJldWxpY2hAc3VzZS5jb20+DQo+Pj4NCj4+Pj4gU2xpZ2h0bHkgUkZDLCBiZWNhdXNl
IHRoZXJlIGlzIG5vIGVhc3kgd2F5IG9mIG1ha2luZyB0aGUgb3Bwb3NpdGUgIm5vcm1hbA0KPj4+
PiBib29sZWFuIiBjYXNlIHdvcmsgZm9yIG5vLXZwbXUuDQo+Pj4gVGhlcmUncyBub3RoaW5nIHRv
IGRvIHRvIG1ha2UgdGhpcyB3b3JrIGFmYWljdDogR2VuZXJpYyBjb21tYW5kIGxpbmUNCj4+PiBo
YW5kbGluZyBjb252ZXJ0cyAibm8tPG9wdGlvbj4iIHRvICI8b3B0aW9uPj1ubyIgZm9yIGN1c3Rv
bSBwYXJhbXMuDQo+PiBPaCAtIEknZCBmb3Jnb3R0ZW4gdGhhdCwgaW4gd2hpY2ggY2FzZSB0aGlz
IHBhdGNoIGFjdHVhbGx5IHdhbnRzIHRvIGJlDQo+PiBzaW1wbHk6DQo+Pg0KPj4gZGlmZiAtLWdp
dCBhL3hlbi9jb21tb24va2VybmVsLmMgYi94ZW4vY29tbW9uL2tlcm5lbC5jDQo+PiBpbmRleCBh
ZGZmMmQyYzc3ZjMuLjJjZWExZGE3ODFhYyAxMDA2NDQNCj4+IC0tLSBhL3hlbi9jb21tb24va2Vy
bmVsLmMNCj4+ICsrKyBiL3hlbi9jb21tb24va2VybmVsLmMNCj4+IEBAIC0xNjIsNiArMTYyLDEx
IEBAIHN0YXRpYyBpbnQgcGFyc2VfcGFyYW1zKGNvbnN0IGNoYXIgKmNtZGxpbmUsIGNvbnN0DQo+
PiBzdHJ1Y3Qga2VybmVsX3BhcmFtICpzdGFydCwNCj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqAgc2FmZV9zdHJjcHkob3B0LCAibm8iKTsNCj4+IMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgb3B0dmFsID0gb3B0Ow0KPj4gwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgfQ0KPj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoCBlbHNlIGlmICggISpvcHR2YWwgKQ0KPj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoCB7DQo+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgc2FmZV9z
dHJjcHkob3B0LCAiMSIpOw0KPj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgIG9wdHZhbCA9IG9wdDsNCj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgfQ0K
Pj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgcmN0bXAgPSBwYXJhbS0+cGFyLmZ1
bmMob3B0dmFsKTsNCj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGJyZWFrOw0K
Pj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGNhc2UgT1BUX0lHTk9SRToNCj4+DQo+PiB0byB0
dXJuICJvcHRpb25cMCIgaW50byAib3B0aW9uPTEiLCBubz8NCj4gSWlyYyBleHRlbmRpbmcgdGhp
cyB0byB0aGUgcG9zaXRpdmUgY2FzZSB3YXMgZGVsaWJlcmF0ZWx5IG5vdCBkb25lLCBmb3INCj4g
dGhlIHJpc2sgb2YgYnJlYWtpbmcgY3VzdG9tIGhhbmRsZXJzIG5vdCBleHBlY3RpbmcgdGhlIHN0
YW5kYXJkIGJvb2xlYW4NCj4gZm9ybXMuIFdlIGNvdWxkIGxpa2VseSBnbyB0aGlzIHJvdXRlLCBi
dXQgb25seSBhZnRlciBhdWRpdGluZyBhbGwgY3VzdG9tDQo+IGhhbmRsZXJzLCBJJ20gYWZyYWlk
Lg0KDQpXZWxsIC0gSSd2ZSBhbHJlYWR5IGF1ZGl0ZWQgdGhlbSBhbGwgb25jZSByZWNlbnRseS7C
oCBXaGF0J3Mgb25jZSBtb3JlLi4uDQoNCkknbGwgaGF2ZSBhIGdvIGluIGR1ZSBjb3Vyc2U7IEkn
ZCBkZWZpbml0ZWx5IHByZWZlciB0byBhdm9pZCBzcGVjaWFsDQpjYXNpbmcgdGhlIHBvc2l0aXZl
IGJvb2xlYW4gZm9ybSBpbiBpbmRpdmlkdWFsIGhhbmRsZXJzLg0KDQp+QW5kcmV3DQo=

