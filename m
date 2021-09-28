Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5801141B916
	for <lists+xen-devel@lfdr.de>; Tue, 28 Sep 2021 23:13:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.198487.352013 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mVKPY-0006pB-TN; Tue, 28 Sep 2021 21:13:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 198487.352013; Tue, 28 Sep 2021 21:13:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mVKPY-0006mT-PT; Tue, 28 Sep 2021 21:13:12 +0000
Received: by outflank-mailman (input) for mailman id 198487;
 Tue, 28 Sep 2021 21:13:10 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=XEZ0=OS=citrix.com=Andrew.Cooper3@srs-us1.protection.inumbo.net>)
 id 1mVKPW-0006mN-Qa
 for xen-devel@lists.xenproject.org; Tue, 28 Sep 2021 21:13:10 +0000
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id e1a77bb0-20a0-11ec-bcd0-12813bfff9fa;
 Tue, 28 Sep 2021 21:13:10 +0000 (UTC)
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
X-Inumbo-ID: e1a77bb0-20a0-11ec-bcd0-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1632863589;
  h=subject:to:cc:references:from:message-id:date:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=g9H30OweOlqfCyXAeGD66cP02ubERI/faXG+IFhCBqU=;
  b=gPDNkH872QIPX61j7Scx/9OxZUWlVR6bri8ebfe6sZLYcXBYHOpq64uh
   YhFf47Y2Wx+wmHZGtN3Hx+xIa3axAw6JNfEubsW4JbEQG9gWmIsM9isTh
   Ts7NFusakOt+DQWywB2n+aVl23hLRUsqQwCOeUYzmz38/rCUH9QXyt3BO
   0=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: tTzCYtk5pN0EpRb7gqKOQpKMYzoiOUdWlUiO5JBkOl+HuJCF/O6LviHAfn3ARCKl6t1uEzIKQR
 j3Qx9Ge/9dBs2cl7JOdowmmrGNMdOWW1uPq46FiyBRWVkQ3mjfd1kEYA1wjRXf/8KT+4ka27+t
 XlWLa5sYZNt0MopWpijhIthX9g6dOnHPO1/8R1/G/os04sxdLHKBZGUtcjc3+LNblm9S2VlCm0
 hcFuMYHOmfHzjhbMPBkARueANt6/dlPcXgGCxB2Vw1qpAE+NkSEVRsYLCpEZWLTNLN13Mj1qhu
 pVm7QZ8CIy3CTkZjSUNCdTXd
X-SBRS: 5.1
X-MesageID: 54270071
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:W8MPPqAtalB4BRVW/13lw5YqxClBgxIJ4kV8jS/XYbTApDxz32EDz
 GsZWDuGb/vcajCmfNt2Pdng9EsCv8SAmNU3QQY4rX1jcSlH+JHPbTi7wuYcHM8wwunrFh8PA
 xA2M4GYRCwMo/u1Si6FatANl1ElvU2zbue6WLOs1hxZH1c+EX9w00I7wIbVv6Yz6TSHK1LV0
 T/Ni5W31G+Ng1aY5UpNtspvADs21BjDkGtwUm4WPJinj3eH/5UhN7oNJLnZEpfNatI88thW5
 Qr05OrREmvxp3/BAz4++1rxWhVirrX6ZWBihpfKMkQLb9crSiEai84G2PQghUh/1SqLlMJB0
 sl0mt+pEAE1OfLukco5akwNe81+FfUuFL7vJHG+tYqYzlHccmuqyPJrZK00FdRGoKAtWzgIr
 KFGbmBWBvyAr7veLLaTY+9gnMk8auLsO5sSoCpIxjDFF/c2B5vERs0m4PcFgG1v3pgRRJ4yY
 eICWBF0TBfLQCRPP2UyFLExjO2j2XzGJmgwRFW9+vNsvjm7IBZK+KP2LNPfd9iORMNUtkWVv
 GTL+yL+GB5yHN6CzTuI9Fq8i+mJmjn0MKoYE7ey57hnm12Xy2kaDjUZUFK6pb+yjUvWc8JSL
 QkY9zQjqYA29Ve3VZ/tUhugunmGsxUAHd1KHIUS1gaJzabF5heDMUINRDVBdd8Oudc/QHoh0
 Vrht97tCDpm9qCbSHeB7bqKpBu1IyEeKWJEbigBJSME/NvLsIw1lgjITNtoDOiylNKdMTP6z
 i2OrSM+r64OlsNN3KK+lXjYhxq8q56PSRQ6jjg7RUr8sFk/PtT8IdX1tx6Ltp6sMbp1UHHfo
 3oPifiE8NkhTojUkjCKH8cEMpWQsqPt3CLnvXZjGJwo9jKI8nGlfJxN7DwWGHqFIvroahezP
 haM6Fo5CIt7eSvyNPArM+pdHuxwlcDd+cLZuuc4hzakSrZ2bhPP2ChzaUOK02npnSDAeolkY
 szDIK5A4ZsAYJmLLQZapc9BjdfHJQhknAs/oKwXKTz8itJyg1bPFd843KOmNLxR0U99iFy9H
 yxjH8WL0Q5Dd+b1fzPa94UeRXhTcyNhVc2q9pMMKrHcSuaDJI3HI6SKqV/GU9Y595m5a8+Sp
 i3tMqOm4ACXaYL7xfWiNSk4NeKHsWdXpnMnJy08VWtEKFB4CbtDGJw3LsNtFZF+rbQL5actE
 5EtJpXRatwSG2+v02lMMvHAQHlKKU3DafSmZHH+PlDSvvdIGmT0xzMTVlG0qXZSXnbp75tWT
 n/J/lqzfKfvjj9KVa7+QPmu00mwrT4anudzVFHPOd5dZAPn940CFsA7pqZnSy3VARmclDacy
 SiMBhIU+bvEr4MvqYGbjqGYtYa5VeB5GxMCTWXc6L+3Mwjc/3aintAcALrZI2iFWTOm4rima
 MVU0+r4bK8NkmFVvtcuCL1s168/uYfi/ucI0gR+EXzXRF23Ebc8cGKe1MxCu/QVlL9UsAe7Q
 GyV/dxeNenbMc/pCgdJdgEkcv6CxbcfnTyLtaY5J0Dz5SlW+rubUBoNY0nQ2XIFdLYsadEr2
 +YsvsIS+jeTsBtyP4bUlD1Q+kSNMmcED/ctuKYFDdK5kQEs0FxDP8DRU3ek/JGVZtxQGUA2O
 TvI1rHajrFRy0eeIXo+EX/BgbhUiZgU4U0YyVYDIxKCm8bfh+9x1xpUqGxlQgNQxxRB8uRyJ
 mk0aBElefTQp29l1JpZQmShOwBdHxnIqEX+xmwAmHDdU0T1BHfGK3cwOLrV8U0Um46GkuO3I
 F1MJL7ZbAvX
IronPort-HdrOrdr: A9a23:Irv/kKr3z1/X+KuvPdk0CdsaV5oyeYIsimQD101hICG9Ffb4qy
 nOppomPHDP5Ar5NEtKpTn4Asm9qBDnmqKdg7NhXotKNTOO0FdAR7sO0WKN+VfdJxE=
X-IronPort-AV: E=Sophos;i="5.85,330,1624334400"; 
   d="scan'208";a="54270071"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hLPa0KxSeEi0aCNSmhYXpZHsTb/OUWHOWrggT2NCr/XK2OBVYAOEwPliIdGqMmYVFLIkv+5TUP6i6XoJzha+N3rTRZ8iBvVQqZKVcjZpZpYjEeIbjgZbm59AEPQ0HpdsH+SvlckuayQHxfzXHmYl88jJDoKGrxY5suS2QV6fPorDaDQLq45ke+ALquS6SdJMf6glbfPP8Q+xTarxg57TL8SldRX8Cu8Ld/7Tg2f3xkbqV+2VX8l6Ba/26PSIyH3Yuv2w7sT9GBuhq/hgMY2O7biJIwreydEhpNqsfihQybcL9xB+oTsE1OcQZOGRLvKsJDQfKImnJ4q1sRMQr/rwOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=FFky1Tf/IERdq9HC3apLODEKv5NpKwN1ps/14CdbYw0=;
 b=R35twKqXzaYRnCSwZZSRh1quaeco4aaUV61hNpX1F1mBy3omV9KM5z+VZ/gbcjc2uAeZyX4IuFxIGcPyx5Uh+Dj/ibzI3sOiVRJXGUhxHKNxMPzooB7dactDXOpWMGRvo+2/IWFr6YcJOC0dZ68TeUB3GXwgzMzvKEyEAA6IYVKiDWew+jF/f/WLKYxldXCZDtCNqcvT4LdXKN28gLq/Rbl6yUtmKXn0gbZFClbFJEVmwjGXZGuJF1sohUSYYYby1iZVfZH+L7AjRXzl6eBRdlL+8pSEEWXIEUzNEuqIJT9Fh4cDEOLTJgTn4sEQSx9feEOkrQtPT0jAZtQ+lAq14Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FFky1Tf/IERdq9HC3apLODEKv5NpKwN1ps/14CdbYw0=;
 b=Sz+0ecyjVoHBFnzP4nQ0eF+o3hfs08C2+hvd87/htmc80Ci3H4pW5PlLCBLFNsxgGZ+mk41Kn4MarmqIRYwXJh/V55mcfAjTJ59Ty+FiXqqwuVV9Dh71puL0MEIQkRCXaKFXnhDc/112D86fjAhp27iyo0Md2b8Ibq/8Sjt5JNo=
Subject: Re: [PATCH v4 5/6] arch/x86: move domain_pause_for_debugger() to
 domain.h
To: Bobby Eshleman <bobby.eshleman@gmail.com>,
	<xen-devel@lists.xenproject.org>
CC: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
	<julien@xen.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Jan Beulich
	<jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>, Elena Ufimtseva <elena.ufimtseva@oracle.com>, George
 Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>
References: <cover.1632860589.git.bobby.eshleman@gmail.com>
 <5de82c39ffae1d65c8ab7142b05d304f9d4ddae9.1632860589.git.bobby.eshleman@gmail.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <0d8bc733-33b8-1b4c-9e75-5293135405a5@citrix.com>
Date: Tue, 28 Sep 2021 22:12:43 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <5de82c39ffae1d65c8ab7142b05d304f9d4ddae9.1632860589.git.bobby.eshleman@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-GB
X-ClientProxiedBy: LO2P265CA0405.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:f::33) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: fd69e5da-45b9-497f-99dd-08d982c4bace
X-MS-TrafficTypeDiagnostic: SJ0PR03MB5454:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SJ0PR03MB54545BD6F2E3C0192EA86797BAA89@SJ0PR03MB5454.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:330;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: QFhGKrvw7acNK7St4MG3ckxYKg/mUXA317aG13GOOm4ePL5NUx0Y1LQZ4ZRMIv/mOjSkwV1NnOySpoCMfOtZhA0EwABxm/gzB7TcS9DTU6DYiE6KVZzSf18sq30Tm9hVJLdMcK1A8h18TdU0V5jZ6uXRDyYJjZq2c+YCExIImKoeEhS5dZwjya44M56Bkkcp07TwLUq+wGTd+LQbFZGmqyOmJaTcNn2Uh736Na5Om90lrqmo72+41UUFounlcZdHAWBt4FNFZV8jCMo0nZ3Fcb5kV9lDE1qhp6CPrpuC+xAJNBSc282jD4/4dPbCkw2dit8jUCTR8Wslaclej9FtKKUoEGdAKUhh7JewcQpMkMJlT/bjYi+V8/Y/eqRkxYny+7w1CaCZ44lVvJDsPSO/Wl6RS7tnHE4xdFR5vUnhWoH5NOF2beWTvp5GUQHtHMa7X/d1S/+ZSgt3zT6BAkaJZt6VCg9pQYTqkQNRcgushAOHiolAOBmjjcpKipkD3IOWCZ95SK1S4Xwg3qGwL8qroR02ogkwfiV7zYjqKmWX4ZcyniB78LnBgEBFQT42lLHjAmcUQziTetIxY0VM+IWupDaRpLIzuLiX3gmPUjc5WhRXJmI6O1SDdFyJyiDdRnIvuIR4de1/fJ8m2cTYHZsagKnLLL3w0SQuWQszPq86F90fjys/qjWnRcUoS38jCeOhtdSeEIbs+XHyaBUjR7H00lsXmAgQHchqYq54gCysZO2oopiEzdr4lrc8nxNFWPKF
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(8936002)(55236004)(54906003)(38100700002)(4326008)(6486002)(186003)(26005)(558084003)(31696002)(8676002)(53546011)(86362001)(316002)(508600001)(31686004)(2906002)(66946007)(2616005)(66556008)(36756003)(66476007)(5660300002)(6666004)(956004)(16576012)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VHgva0hIVXFxR1p5TUVuSHFYYXNnVDRzbVRjbE1ZQVRUYkhET2Y3U21lYUtp?=
 =?utf-8?B?UEpydXZoSnB0Q094SUlRSDdZY05abHVIVHpCYWlkZUJtT0duZmRobEJjRC9k?=
 =?utf-8?B?RG1uc2dEMW5BSVFOVkJmME9MT21XRWVrSHdNOFp3S014WWFZaDdwVEpRM1FM?=
 =?utf-8?B?eEh0VjliMDR0Vy9HUnlUbW5zSkI2M1pOcllaZkc0MmJJK3pKYXRGbnJkbTN5?=
 =?utf-8?B?Y0xPZmZkY01MakdRT29pMCtFQnJaTUZYbE5UWGowMUt6OGRHRmIvMjBwK3B2?=
 =?utf-8?B?a2pJYzhXcDFTR05kc1dKOVVCZjRvOFFQMk0yRjQ4VnJzTmdkZVQ1SThaMElo?=
 =?utf-8?B?bkZremxzUkJZb3FRL1FweXc1OEZNYmxVeDNWYWtCM0t1Zlo2VUoxSkIxMUR1?=
 =?utf-8?B?dlJXMEZlRGpIcDZLc1Q3UkU3WXpxQ1lGK2FOR04xbG1hcTM5aXRyYmJFME50?=
 =?utf-8?B?ay9LaGRiZERIMXpnZk14djQwU3k4emswRHZiTW9LRHJKbUhWcFVrOEtBT0xC?=
 =?utf-8?B?RkxWTnBEMmYrb3RDMVZTbjQ4NU1hVGpNRHptWW5YRkxNYW1vTmNnaTQ2MG8w?=
 =?utf-8?B?Qi9rUVptOFpqVXB5TVNzU1RMaEd2cnpDVllsc0t0dm9wY1dUQTJmbDhnMTRB?=
 =?utf-8?B?VkFJTnExQmkzMStZbUs1T2hFV2FUYWE4aXRVZng5UzZHWkxGWHZaM3FoTkx4?=
 =?utf-8?B?ZHlvaWZLT2tVeVVUQnYrL0o1TXJxelppam1CUXdwMHlRU3VaRHNmUjhNdkpY?=
 =?utf-8?B?NGVWak1XcTEyZGppSUdvV1ZTVHBSYmdDWGxZS25CaS9nK2VQelg0NWNQYits?=
 =?utf-8?B?b3dzeVZjSkdVSDVuYmJUYmJyS2pVdG9xcFRDN2k5MmVQUHR2ZC9HMjdzTENp?=
 =?utf-8?B?anl1UkNaRzBjVWFtSG5KQTdwK1ZMeC9xbUpOVFJKWmVkemdGbFNnOGROYVNv?=
 =?utf-8?B?ZTdLMlJYRlcrbzllWWk3Q2hoNHVpejBsQ2xCMlN5dzRoRElKc3FWb3JQcWNo?=
 =?utf-8?B?NzQvWU1oZlFITXM2M3hqRXp4bVJGR3VHOHpUTkEzeEdBUXRnaGJNMndNZ2hq?=
 =?utf-8?B?QTBMWXVSUmNUN3dRRnVmdDFBTmpYOGFiRnFVWDZWRzVTcTUyUUdjbGZ1b2hp?=
 =?utf-8?B?Ri9HUjRpS1p0cDJRODN2Yk91cGFJRklrRWZpcHhsS2VKaGQrdGVydHpkWTlK?=
 =?utf-8?B?LzdEWGo0emhoRkVlQkY3U2NVV2pNMEVlbFZwcE04b2tqVGJEVUVWczFFdHVR?=
 =?utf-8?B?V1dsODFRdnNyZXNNanJ0S1VXT1FrYVo4eGRXZCt5UytLTWduNTFXQWFZMGZx?=
 =?utf-8?B?ZS9RSFowdm1ZdFJHWnhSbjg5R2RXYXpHV3NrZVErdndqUk56a21TbWVZckZN?=
 =?utf-8?B?aTI4UE5uODRNL0hNcG5zSkFkbjVpZExXVnVtcUhNTnM3WTBiSjNDU2wvSUZl?=
 =?utf-8?B?M3Roa21xand1eURDTlkrWlYwMVprOWRWb3g5N2drYmQvUFJGRnBDbWh4MEty?=
 =?utf-8?B?anp1bUJyU2tndjdaZkhJZEpHNUhPbEJvL3BiVFJBcjNvaWd1UDVpbjByTG9m?=
 =?utf-8?B?Z0xKM0g0RGFyeUZSK3lMam5ONXVnVTBFWTVoU2dpaHFBd0pFcnBNRkU1dkRJ?=
 =?utf-8?B?YXN6WTBFK0JkOGc4YlNuMHpPVUx4bHIwejNTbzhJNlFmOTJ3V0xnNWJhb2o5?=
 =?utf-8?B?SGlBMEVmcGRjVzVqTFhtd1VWQmlYdlpJU1pObHU1ODFqTHovajFqMXZKdXRa?=
 =?utf-8?Q?082YUrfIErCu+kggDTXvpHlAypw9C2CWxcVMDRf?=
X-MS-Exchange-CrossTenant-Network-Message-Id: fd69e5da-45b9-497f-99dd-08d982c4bace
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Sep 2021 21:12:51.0487
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WyCD0MZDalS/kH6VQfoQl9zZ5QmYWkKbXZ0ZFzEkBhdcBvOiQXUWUgjku/mq1w18lcWk9KnWKpaNl3YgMD5+ldwadCOqNV3Vkr93Yshktj4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB5454
X-OriginatorOrg: citrix.com

On 28/09/2021 21:30, Bobby Eshleman wrote:
> domain_pause_for_debugger() was previously in debugger.h.  This commit
> moves it to domain.h because its implementation is in domain.c.
>
> Signed-off-by: Bobby Eshleman <bobby.eshleman@gmail.com>

Reviewed-by: Andrew Cooper <andrew.cooper3@citrix.com>

