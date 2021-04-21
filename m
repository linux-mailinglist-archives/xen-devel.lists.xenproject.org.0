Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3244B3666E0
	for <lists+xen-devel@lfdr.de>; Wed, 21 Apr 2021 10:16:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.114150.217410 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lZ81x-0001FF-7K; Wed, 21 Apr 2021 08:16:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 114150.217410; Wed, 21 Apr 2021 08:16:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lZ81x-0001Eq-3v; Wed, 21 Apr 2021 08:16:17 +0000
Received: by outflank-mailman (input) for mailman id 114150;
 Wed, 21 Apr 2021 08:16:15 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=wOap=JS=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1lZ81v-0001El-C2
 for xen-devel@lists.xenproject.org; Wed, 21 Apr 2021 08:16:15 +0000
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id c82d378e-242f-4625-8fe3-dd663cfaa482;
 Wed, 21 Apr 2021 08:16:13 +0000 (UTC)
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
X-Inumbo-ID: c82d378e-242f-4625-8fe3-dd663cfaa482
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1618992973;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=ER5CdPYKgx9ct46QfFtZNx+DHMRByXsTv+2duyRv1Oc=;
  b=FyYwuqC7cSeKeD2Ip5SsdPnLv5e68fNQAuHS8anHDxq19jWwBLc8yC08
   UNnijXx8kq8fzw2ZlNFoFjI7FC2iHEdafPCZMluuXsBYYzchpf4jaXhqi
   x/arOfg5J4kr8rHXl44oa7L38SVdKVa4jPf347cUO0OiTbcVNH/nYYFr3
   o=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: ryg0IIhZC8q+Y/S3O9N+C+Xu9KRjwbaf2CzgjGU+ePlYzhweJIKpdSze4qStaR3SSCn+iNnhHy
 dnwS5EBDRlMGM2UA3iu74JsSwk35ylwyfZ35whOxxEsTXCloiMJLDLaSZVbfoSFDQ0WVR37GMU
 MSbaeXhvT/OLf3qDB9Yt1GazqIJWF53BykN+RCxUy1uZNV3x9TwL88ezC3MkGkedXzayFGisis
 D3P3h+k8BXngazJhUTVy/UZZjFIJzoTZuDMWCQA7rROm+VB9N6Ol+8AlfZtGfnpwttyhij49ea
 /eI=
X-SBRS: 5.2
X-MesageID: 42182168
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:WJ++la33TKcGyZuscjx3UwqjBQJ3eYIsi2QD101hICF9Wvez0+
 izgfUW0gL1gj4NWHcm3euNIrWEXGm0z/FIyKErF/OHUBP9sGWlaLtj44zr3iH6F0TFmtJ1/Z
 xLN5JzANiYNzVHpO7n/Qi1FMshytGb8KauwdzT1WtpUBsCUcBdxi1SYzzrdXFebg9AGJY/Cd
 6w5tBfoSChZHQQaa2AdwM4dsLEoMDGk4+jXAUPAAQp5BLLoTSj7rP7FBbw5GZibxpkx7A+/W
 /Z1zHo/6nLiYDB9jbw9U/2q65Xltzo18dZCKW35PQ9Bz3whm+TFeZccpKYujRdmpDL1H8Ll5
 32rw4kL4BP7RrqDx2IiD/M/yWl7zo08X/lzjaj8AveiOj0XigzBcYEpa8xSGqh12MasNtx0L
 1G0gui3vI9Z3Ow/1WO2/HyWx5njUayq3Y5+NRj90B3aocCdKRX6bUW4UI9KuZwIAvB9IslHO
 NyZfusgsp+TFXyVQG8gkBfhPaoXng1Ay6cRFkDtsG/w1Ft7Q5E5npd68oFknga8pUhD7FC+u
 TfK6xt0IpDV8kMcMtGdas8aPryLlaIbQPHMWqUL1iiPKYbO0jVo5qyxLku/umldLEB0ZNaou
 WPbHpo8UoJP27+A8yH25NGtjrXRn+mYDjrwsZCo7Bkp7zVXtPQQG2+YWFrt/Hlj+QUA8XdVf
 r2EolRGeXfIWznHpsM9xHiWqNVNWIVXKQuy5cGcmPLhviOBpzht+TdfvqWDqHqCywYVmT2BW
 ZGcyP0IOlG80C3Sl71iBXcQBrWCw7C1KM1NJKf0/kYyYALOIEJmBMSk06F6saCLiAHkqFeRj
 o6HJrX1oeA4UWm92fB6GtkfjBHCFxO3bnmW3RW4SsDM0b+d6c/q8ySEFoimEevF1tadYf7AQ
 Rfr1N49eacNJqL3x0vDNqhLya8g2YMommJC7MRgLeK68ugWp5QNOdpZIVBUSHwUzBlkwdjr2
 lOLCUeQFXEKz/ogaK5yLoOBO/ecNF4qByxIdFdrE/esUn0n7BtelIrGxqVFeKHiwcnQDRZwn
 dr9bUEvbaGkTGzbVckjP8AK11KYmSPCLdgBACIDb8k3YzDSUVVdyOnlDaagxY8di7P+18Jjm
 LsFyGSZMrGG0FQoHxez6bs/m5lb2n1RTMCVllK9alGUUjWsHd61uGGIpC+1GaccXMu6OAQOj
 OtW0pYHipeg/SMkDKFkjeLEnsrgqg0NuvGFbI5bvX4wXW2MrCFkqkAAt5Z9JtoL8rVr+cOSO
 6TEjXlag/QOqcM4Ui4t3wlMC57pD0YivvuwgTi93X983glA/beSW4WMY0zEpW51SzDSPmJ2p
 ki0o5wkuu0L2nratmJjYvQdCVOLxvPoWiwC8EkwKokyZ4ahf9WJd38VzCN6VRsmDMZB+3wnF
 kFQKt67KvaU7UfN/A6SmZ8xB4RiN+LLEEXqQT4De81QEE1gxbgTqa0youNjYBqP1aIqwTxM2
 SO6iFx///KWC2YyL4RYphAVlh+WQwZ6H54+vmFeJCVIAK2d/tb9F7SCA72TJZtDIyEE64XtB
 B0/pWhmPKWbTPx3ET1sSFgKqxDt0ahTsXaOnPAJcd4t/i7M0+LmK2k/Yqaiyr2UyKybwAgvr
 J+HHZgJ/hru30Fl4040i+7V6zxrAYEqjJlkE5av2+o/JOn7mfdFVxBKivDjPxtLGBuDkQ=
X-IronPort-AV: E=Sophos;i="5.82,238,1613451600"; 
   d="scan'208";a="42182168"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fDQnPucBAkK1Rp11zQzMgf2yJo5kdMmfnmRGpr603hwjYqDdd+0Nlmwil6y6/ksobgq/YVYHUN0aEo+hgR7986Pu26P3wn5GNt81HYnqgAgnkyv6mb1Ghv8FlbD+/XLu9Mxp3VuGRid8uXu1PFJxvwYavvbq8KpxUCZH5h0sfVZmHoBXUYA97bUs6IwTbhcGHdHzvFeytM+536H9wqsdXVqgBhWbpiLgtpGCYER6CTbbmYXpiiTUMSXQSZz+ViPNm98rkn7TAwtxP/CClugKLjtM2QJLLTZ4K7nYROPn4yJeX9Gu9E+dIJnzxH9TNX7LiCywhtgigNdZwRU/AHbZ5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=U2hRAq3+YX7RJRkWS1dDJjmY2yeL5As8KH5f4C7/470=;
 b=AlFV5n1om9op7huEyR1Fq91gBdEmghfiPI+XwrCdw6nsC+8FiNCDxew5wSFjFpi1aLiuBIF/Z6OjrOyowLAC2Aky9oNOM1O7SQIKXaX2WrihJf2Msml4bXoIdX8BZ1LV7hblfPs4ZnGSs81JFKkE66Ht5xmoN5IFeUlda/wUQJgtgEIIHCYM629abAgEt2QPLfmEg1cqVHtJIlqyNjOtvlb6ujebDgW/+IdkfkSxOwcB0MXip4XB5zh1RfHpVyWmnLjjDUWEv6/f/K/wgwfAI3CuIQnC6SmY2kH2+yBZs9sTib7euAfvkwoFRYKwXDibcnOOFI7txyOLD06wBlnZcg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=U2hRAq3+YX7RJRkWS1dDJjmY2yeL5As8KH5f4C7/470=;
 b=S9LDcBempl1kcSyz1Rc1Akh2G2WSi0D+SV4F2kZvJqE9X7Wn6YKYqUw45nvk0pa8POrYRpZ1wUamERQwzf5rQOSX7TL9fu5DSHtRvQ7Ot0EvZSoX0yNh1W9mn4jW+Ntm77J/JUtRrGoApf2XGNLX9f7vYaSwh5S+d4zLJXvbmP4=
Date: Wed, 21 Apr 2021 10:16:02 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Rahul Singh <Rahul.Singh@arm.com>
CC: Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>, xen-devel
	<xen-devel@lists.xenproject.org>, Bertrand Marquis
	<Bertrand.Marquis@arm.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Wei
 Liu <wl@xen.org>, George Dunlap <george.dunlap@citrix.com>, Ian Jackson
	<iwj@xenproject.org>, Stefano Stabellini <sstabellini@kernel.org>, Paul
 Durrant <paul@xen.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Daniel De Graaf <dgdegra@tycho.nsa.gov>
Subject: Re: [PATCH v2] xen/pci: Refactor PCI MSI interrupts related code
Message-ID: <YH/fQpgEQyhiaj1Y@Air-de-Roger>
References: <YHg+6rLN0rBWXcTs@Air-de-Roger>
 <788665ad-9815-e3e9-2d5a-851b35c566d0@xen.org>
 <AD2BC1CD-74AF-48FF-8B42-2853C0E7A7BE@arm.com>
 <YH1CBP8At7lVoHCz@Air-de-Roger>
 <a365ffbd-5b88-85c3-9e68-46a9a730a6fa@suse.com>
 <0d5539e3-32e3-8275-f695-351eda49cb29@xen.org>
 <6291effa-1589-1013-e89d-c795bce44d9c@suse.com>
 <D2D9A348-3B21-47FD-A9C6-4C66C5778F11@arm.com>
 <a1beaee4-0d6b-e38e-07f7-90a014c504b6@suse.com>
 <30D00B1B-ECB9-4A5B-ACBD-37E532285CCD@arm.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <30D00B1B-ECB9-4A5B-ACBD-37E532285CCD@arm.com>
X-ClientProxiedBy: PR3P189CA0066.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:102:b4::11) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8bd3c029-bf85-463e-8b0f-08d9049db86e
X-MS-TrafficTypeDiagnostic: DM6PR03MB4843:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM6PR03MB4843F63C2ECC43E851FDA96A8F479@DM6PR03MB4843.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: fkigz1UFQKK3NP+vR3CYaLWt4ExWyIW4ynq5awr91DPfsPUfwRawoMeJLrJBhQEJtim9btj9x/NUeYaETRRQmXWVf+JWz+RacdULROns96RfWJLqC7O+U+srpegugb1pF3fgRqRYRhhE6GbcAgMwDLeHGq70cUvV9okmOJ4G+5onlVPfkm9wCEHNBkR3p2oQqvdCwshHUhUTqHjwiFKSvC2eIA3B9c8OrToqAG0qQQsycPNW5aQ+B/kUsCKhNtMhLByDe4nubijIiu25JYaIMc1qQJOICd8+tCKAa0H6ZxSpssjUbPquvy6+1Oca/Fok7YKFLyI2+CwAbCCf2s3pYRoylql/LOJ/rADV9W9QJwFymsTV1P7VeO5fWDrtg1XuC8J/Gkv0HhcH0JwdWcJ4Nck/mYpbWwIGvsMdMkI+bE2xp81LTtM/ZI77T3IrL0OFfmam6BiUc1pZ09fTV697D7N0JnzAlPn5/GpSWsrv4a+sfjrqHZMwCdlFPqeArcujrzSN7V0GWO4eo/V8EN1WQ9nxwH/gv46XwJG9CAxWu6JFvuDO8+zcNfF8nHy2kagUuYjhPTbKqA3+DeDDvjiyMg==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(7916004)(4636009)(136003)(366004)(346002)(39850400004)(396003)(376002)(86362001)(6666004)(7416002)(54906003)(316002)(66476007)(53546011)(26005)(66946007)(33716001)(6916009)(83380400001)(4326008)(85182001)(6486002)(9686003)(5660300002)(6496006)(16526019)(2906002)(956004)(8676002)(66556008)(38100700002)(478600001)(186003)(8936002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?b3BXSzVqRXkyRGpxN0xOSnc0Mjh0R2M3YkQ3SmFtd3N2d1BDK1dJL3lnR1VG?=
 =?utf-8?B?anlwSXd2eUZ5eHpnZTdoV0trSUxNeDdHb3lqa1Y1QjhqV3llL0psMUVONk0y?=
 =?utf-8?B?RytuVEtRSFFXSTZISjZLU0NVZGIvKzhoMWtLL1ltOG9UL0tnaGNpdHpRcnRv?=
 =?utf-8?B?enFXT2xUTTFLc2wwalRyclYzb3lGNG5yWXRjQ3lrZ3BSYngwTlhyY09lQmlH?=
 =?utf-8?B?dGRMcEpXS0J3V1JxaVE2UzNTWjl5V2RrUW5UV1BJblNkSVo0NkI1a2xCVGpP?=
 =?utf-8?B?Um9Nb0FEN3p1Rng2M2hiRjR1VGl2eDJMTDNuZEF0d0tOcG0wbjRqOTY4dFU0?=
 =?utf-8?B?S0JTKzFzcjJ0c1BkeHpHTzlGZStHQ3BOVTNQOGxzdnc5ZmZzWWFMUHpDSXk0?=
 =?utf-8?B?Q0ZnS0ZZSEJ2eDJlTk5tRVl0a3k1R3c5WVBrd1k4R29oWVNSYVJSREpRN1Yx?=
 =?utf-8?B?bnU3STZrbVlod0hTcEl4b3BTaXVMY0lJclZIRktLZG5yeFd0eHZFMzArUGI4?=
 =?utf-8?B?Zm0zalEwM1RyWEIwRGhVVU5SbVJMY2ZhODJYTzlkSjF5K29HaUE3eFVOS0hZ?=
 =?utf-8?B?RDdGQ1lSYWxzbTZDeWlha2tzeis5Mmk5UVgvVTR1NHI5d3hrVnFDbCtyalNY?=
 =?utf-8?B?bUl6MlpSY3Exd0F1djNEVWIrK2ZGb3BUZ0ZPdVM5YWVudC9pWmhFNk84bHZ2?=
 =?utf-8?B?c0I5YUp6c2lPZGtzUlVtWVNiaVB1eld6eGV0UVhDMVRWRFRKQkFEdUt5T2Nn?=
 =?utf-8?B?NWFsVHlFd2JFeXpVSEpPRzFpbkgrNWRYWUc5WWdlRWtxYUtSMXJIS0o0ZHpD?=
 =?utf-8?B?QzdmS0pwYkU3ZTJTTjh3WGdla1pJaE8vb1hhWUV3ZDcybUliTHI2ZlNpOXRx?=
 =?utf-8?B?b2E4V1M5ZjRLT3pNZ2w1UlBKdE1qRFJrYmVVYVo5L3l4L01aNEhmUDJHWlJs?=
 =?utf-8?B?Y1FOdjQ1ZVFVN2NGRWtTM0F6YXRpTmkweXB0cTEyeG9JV0NsMjRDaS85TEUy?=
 =?utf-8?B?NVh6Tm5WZ2pBTXdXYkZUSWFZTk9RTzVEWCtEcE5HYVVYRXg3WUl1anZ3RFQx?=
 =?utf-8?B?M2Z2UERxaDRKUExnMTY1bFRma1RnWjY0aXcyYXdyZGl6U004eW1nMEh3aEsz?=
 =?utf-8?B?L0diMHYyZTUrb2ZGU1VvcUYwYXJrTlg4WkcvQzBIeDlUTTRqQUlORVJLYnZj?=
 =?utf-8?B?N2phL01uTjdETDRzdk13Qk52aUY3U0x4T2VSMnU4eDVlQ005Q2Y5eUR4dWFp?=
 =?utf-8?B?MHNyY0FlN3JqaHZCVldIcUxsUlBvK0MrZDBpVk1qbTg1V3Z3Q0lJNVl1b01j?=
 =?utf-8?B?cmR0ZmorK2IzSDVLdjlrbTQ0V2krQ2lyV043dGx4eVMvRDJ0ajZGdUhWNGNU?=
 =?utf-8?B?T0YvZUtlL0FTc3VEMWpvMEFzRVlVQU9KMEs3Z09hWFU4Q1dxd1FCb1A2RURh?=
 =?utf-8?B?cDIwTGlURGZ1Sk5wa2RRTUUwNER4U0xhNG9rNTB1NlljWmhmM1lodkk4Mk9o?=
 =?utf-8?B?eUx1S2hEeDZLRjBVMTJHWGJWZ1FxQWM3UFpoUGdjWEJmUVVKSzA2NEhTajFw?=
 =?utf-8?B?TW9qczNoUTlPd2RrbnhBV1ZxVXkrV1ZOK3piTkx6NTN3WWNBaUtoQTVPK0N4?=
 =?utf-8?B?bzlNSTlnVzlwK0FXNE83YXIzUEpOMHVLT2lXczNkUVhUN0FuWnA1OUc0TTlv?=
 =?utf-8?B?OHdMam1vNXN4bkVpeFYxdUtzS045R01DVVFvMmlRWjZmaVBUUFBlSnlPckp2?=
 =?utf-8?Q?cCzuaDxPU0TfAzgJLImfSy1FHgRCfzD13PPxIal?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 8bd3c029-bf85-463e-8b0f-08d9049db86e
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Apr 2021 08:16:10.2017
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Hf6kKyRDi1DKznkewPrQrjFcNUGJMRzbK9bodsM6lke2E0IYkEn2sXZ/u8a0iW6SsjEYga6ErsoFX+11EsKQNQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB4843
X-OriginatorOrg: citrix.com

On Wed, Apr 21, 2021 at 08:07:08AM +0000, Rahul Singh wrote:
> Hi Jan,
> 
> > On 20 Apr 2021, at 4:36 pm, Jan Beulich <jbeulich@suse.com> wrote:
> > 
> > On 20.04.2021 15:45, Rahul Singh wrote:
> >>> On 19 Apr 2021, at 1:33 pm, Jan Beulich <jbeulich@suse.com> wrote:
> >>> On 19.04.2021 13:54, Julien Grall wrote:
> >>>> For the time being, I think move this code in x86 is a lot better than 
> >>>> #ifdef or keep the code in common code.
> >>> 
> >>> Well, I would perhaps agree if it ended up being #ifdef CONFIG_X86.
> >>> I would perhaps not agree if there was a new CONFIG_* which other
> >>> (future) arch-es could select if desired.
> >> 
> >> I agree with Julien moving the code to x86 file as currently it is referenced only in x86 code
> >> and as of now we are not sure how other architecture will implement the Interrupt remapping
> >> (via IOMMU or any other means).  
> >> 
> >> Let me know if you are ok with moving the code to x86.
> > 
> > I can't answer this with "yes" or "no" without knowing what the alternative
> > would be. As said, if the alternative is CONFIG_X86 #ifdef-ary, then yes.
> > If a separate CONFIG_* gets introduced (and selected by X86), then a
> > separate file (getting built only when that new setting is y) would seem
> > better to me.
> 
> I just made a quick patch. Please let me know if below patch is ok. I move the definition to  "passthrough/x86/iommu.c” file.
> 
> diff --git a/xen/drivers/passthrough/pci.c b/xen/drivers/passthrough/pci.c
> index 705137f8be..199ce08612 100644
> --- a/xen/drivers/passthrough/pci.c
> +++ b/xen/drivers/passthrough/pci.c
> @@ -1303,13 +1303,6 @@ static int __init setup_dump_pcidevs(void)
>  }
>  __initcall(setup_dump_pcidevs);
>  
> -int iommu_update_ire_from_msi(
> -    struct msi_desc *msi_desc, struct msi_msg *msg)
> -{
> -    return iommu_intremap
> -           ? iommu_call(&iommu_ops, update_ire_from_msi, msi_desc, msg) : 0;
> -}
> -
>  static int iommu_add_device(struct pci_dev *pdev)
>  {
>      const struct domain_iommu *hd;
> diff --git a/xen/drivers/passthrough/x86/iommu.c b/xen/drivers/passthrough/x86/iommu.c
> index b90bb31bfe..cf51dec564 100644
> --- a/xen/drivers/passthrough/x86/iommu.c
> +++ b/xen/drivers/passthrough/x86/iommu.c
> @@ -340,6 +340,13 @@ bool arch_iommu_use_permitted(const struct domain *d)
>              likely(!p2m_get_hostp2m(d)->global_logdirty));
>  }
>  
> +int iommu_update_ire_from_msi(
> +    struct msi_desc *msi_desc, struct msi_msg *msg)
> +{
> +    return iommu_intremap
> +           ? iommu_call(&iommu_ops, update_ire_from_msi, msi_desc, msg) : 0;
> +}
> +
>  /*
>   * Local variables:
>   * mode: C
> diff --git a/xen/include/xen/iommu.h b/xen/include/xen/iommu.h
> index ea0cd0f1a2..bd42d87b72 100644
> --- a/xen/include/xen/iommu.h
> +++ b/xen/include/xen/iommu.h
> @@ -243,7 +243,6 @@ struct iommu_ops {
>                             u8 devfn, device_t *dev);
>  #ifdef CONFIG_HAS_PCI
>      int (*get_device_group_id)(u16 seg, u8 bus, u8 devfn);
> -    int (*update_ire_from_msi)(struct msi_desc *msi_desc, struct msi_msg *msg);
>  #endif /* HAS_PCI */
>  
>      void (*teardown)(struct domain *d);
> @@ -272,6 +271,7 @@ struct iommu_ops {
>      int (*adjust_irq_affinities)(void);
>      void (*sync_cache)(const void *addr, unsigned int size);
>      void (*clear_root_pgtable)(struct domain *d);
> +    int (*update_ire_from_msi)(struct msi_desc *msi_desc, struct msi_msg *msg);

You also need to move the function prototype
(iommu_update_ire_from_msi) from iommu.h into asm-x86/iommu.h, or
maybe you could just define the function itself as static inline in
asm-x86/iommu.h?

Thanks, Roger.

