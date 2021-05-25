Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D174738FDBD
	for <lists+xen-devel@lfdr.de>; Tue, 25 May 2021 11:25:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.132125.246566 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1llTId-0006QN-CI; Tue, 25 May 2021 09:24:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 132125.246566; Tue, 25 May 2021 09:24:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1llTId-0006OL-8w; Tue, 25 May 2021 09:24:31 +0000
Received: by outflank-mailman (input) for mailman id 132125;
 Tue, 25 May 2021 09:24:29 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=pLNi=KU=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1llTIa-0006OF-PS
 for xen-devel@lists.xenproject.org; Tue, 25 May 2021 09:24:29 +0000
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 3f30c449-f908-4993-8ffc-66a6f84fe015;
 Tue, 25 May 2021 09:24:26 +0000 (UTC)
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
X-Inumbo-ID: 3f30c449-f908-4993-8ffc-66a6f84fe015
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1621934666;
  h=subject:to:cc:references:from:message-id:date:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=vfxo4eo5HcMNYGZ7SiCXmnyzIB2jtqxnw1kYpE6N8Vk=;
  b=Xj6uRvK+rF6CO4RyX7DJGJq6sta24wDn38RW/sx9XMsTIWW/2sdvHBgA
   z14Fy5YrUI8TM9p9tm0hjtvu07h6JwBLEfz6kwlyWkeTxwkiVUq2zrSZR
   vJdBEYKt5F+KFZlOOZS4lIClww2PY7aL+XdDLDKPo8Yl2sw316iAk5Fpx
   c=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: zDKtbVCtGvzCIeCT3H2UOUFw0qOV5CJvdWa2NolGKuiPWc4ItO0r9W/RupWKZPAKbudf911E8E
 FzuDWl0AJOt+IRYBIrTpvk6chYWxwU7X03siXIh2P5zmfZACVZl/4oGiVv56cLLsjxOQ2GguJ1
 sm1XDxtN+T3LPd07J3sMapFJWypH8p+Iplirb3NS5p30rBvdpvYt9csN1+TRaM/G4wzbMlGILD
 wqgdkXcjNGujKAZ32nKVWgRdK5nPg2GlJHMfHcVxUAnUyKjmRHJ6JG7beZ82UkZd8b2jIWWIyP
 f9k=
X-SBRS: 5.1
X-MesageID: 44557381
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
IronPort-Data: A9a23:k0ZN7KoJpB2B7irUlXhIiNqWokdeBmIEZRIvgKrLsJaIsI4StFCzt
 garIBnSaPfZZjb8c493b4/i9UhSsMSBnYVmQQJo/HpkHylD9puZCYyVIHmrMnLJJKUvbq7GA
 +byyDXkBJppJpMJjk71atANlVEljufXAOKU5NfsYkidfyc9IMsaoU8ly7RRbrJA24DjWlvQ4
 46q+aUzBXf+s9JKGjNMg068gEsHUMTa4Fv0aXRnOJinFHeH/5UkJMp3yZOZdhMUcaENdgKOf
 M7RzanRw4/s10xF5uVJMFrMWhZirrb6ZWBig5fNMkSoqkAqSicais7XOBeAAKv+Zvrgc91Zk
 b1wWZKMpQgBY6uPp8s7UAlhGGJRNIlI87TIGkO7rpnGp6HGWyOEL/RGCUg3OcsT+/ptAHEI/
 vsdQNwPRknd3aTsmuv9E7Q8wJ56RCXoFNp3VnVI5DfVF/s5B7vERL3H/4Rw1zYsnMFeW/3ZY
 qL1bBIzMEmdPEYfYz/7Dro+wNywjX7BcAFUg2Kyo6MG7XPT0AJ+he2F3N39JYXRGJQ9clyjj
 nLL+SH1Dw8XMPSbyCGZ6TS8i+nXhyT5VYkOUrqi+ZZCi1qVwGsRBBQIVECTrvywi0r4UNVaQ
 2Qe/SAkvKUp9EimS9D7dxK9qX+A+BUbXrJ4GOQg5AaA4qHd+QqeCy4PSTspQNUitdQqTD0wj
 AShkNbgBDgpu7qQIU9x7Z/N82n0Y3JMazZfNWleFGPp/uUPvqluiFHwYfBgAJe+zfL8PT/7y
 D+xlywh0uB7YdEw60mrwbzWq2vy/MGUHlBtuVy/snGNtF0gP9H5D2C8wR2Lta8efNrxokyp4
 SBc8/Vy+tziGn1keMalbuIXAPmN7uuJPSfQiFpid3XK32/2oCf6FWy8DSsXGauIDirmUWSzC
 KMwkVkLjHO2AJdNRfUpC79d8+xwkcDd+S3ND5g4lOaih6SdkyfdrElTibO4hj+8yiDAb4lkU
 XtkTSpcJSlDUvk2pNZHb8wczaUq1kgDKZD7H8yjpylLJYG2OS7EIZ9YYQDmRr1os8u5TPD9r
 o832z2ikE4EDoUTo0D/rOYuELz9BShqXcyp85QPKIZu4GNOQQkcNhMY+pt4E6RNlKVJjObYu
 Ha7X05T0l3kgnPbbw6NbxhehHnHBP6TcVpT0fQQAGuV
IronPort-HdrOrdr: A9a23:ywSCkqECJ6Uz9fHIpLqFx5HXdLJyesId70hD6qkvc3Fom52j/f
 xGws5x6fatskdrZJkh8erwW5VoMkmsj6KdhrNhcItKPTOW8ldASbsP0WKM+UyGJ8STzI9gPO
 JbAtBD4b7LfBRHZKTBkW+F+r8bqbHpnpxAx92utkuFJjsaCZ2Imj0JbjpzZXcGITWua6BYKL
 Osou584xawc3Ueacq2QlMfWfLYmtHNnJX6JTYbGh8O8mC1/H2VwY+/NyLd8gYVUjtJz7tn23
 PCiRbF6qKqtOz+4gPA1lXU849dlLLau5p+7Y23+4gowwfX+0SVjbdaKvi/VfcO0aWSAWMR4Z
 rxStEbToNOAj3qDyeISFDWqnTdOX4VmgPfIBmj8DTeSIXCNU0HItsEioRDfhTD7U08+Nl6za
 JQxmqc84FaFBXagU3GlpD1vjxR5zyJSEAZ4KcuZr1kIP4jgbRq3MciFYNuYeA99QfBmfIa+c
 VVfbHhDcdtACenhirizxhSKfSXLwcO9zm9MzY/hvA=
X-IronPort-AV: E=Sophos;i="5.82,328,1613451600"; 
   d="scan'208";a="44557381"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=k09gtwyQWCWJqzhQWCeGFl6yZxIhIoWxmzAZL53V5uEIol7QThmkgplQ2qVi98MYBX1dU1EvChF8TGh6CEauBDm5NgyeMWVBl2rE1vS1XB3vGQhSdk8CuafB+tUC0hSUlwEhyVyZehph1VD4at6iix3Tdj1jwrLQSP0Fn8qa1gw0OU9Ek1yMm3MuicuZcOipcMFtkYIxi7Ah+Guq+W3idhVVtsmG+Pg42cRW93p9ij0uwf5DCNfACL1VNvhJ05djTAfAgQaSoDF5fFY4atk/kg62nwdQUa7CdVkkn1QtOgpL/yJz1oP8uDM2M3pFsjccBNRyep6LrEAAYQArOxT9Sg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vfxo4eo5HcMNYGZ7SiCXmnyzIB2jtqxnw1kYpE6N8Vk=;
 b=T30qaUE1V4HVEVQ3Dd0dv/PN+6OzlW5tPR+6G+RKX+j1JwQP7ctTLABHaJLJvepCzswS9KjlBsqv+utOXzW/wy40IWTaAIOQwm9JbSKjF/EjGMUIcH+bX6sxwIsKm6w4Jc0CQ3UAf/3u9T7DaJ6dL19B+5+n+tSYFfGm7lEQs4fPn12Yu7E8xOehzfE1rD/LXPENc2UrSKyE80sH7iifmOgrY7rC7XWdNnprSaJ9F4tSScd5jla3Ax9+SJu0O7Fo+xF4+Xxhi7hIwAkaI3jAQS3drbjybt7Kzx6sCuZ/w9/Cv+Y/V2PqOBecfG7kZKQKJikIbbvjipiPN1rsNbT95A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vfxo4eo5HcMNYGZ7SiCXmnyzIB2jtqxnw1kYpE6N8Vk=;
 b=HBTIqIsbwPMTnGauXxybGFuJD0uhNrwg5kF3UWXFwEMUlUj3nNnUewi+eBloaXvTs23Q3W15u8sE62yj9eCcDA+sCkYcZ0kZmCR9rINvFc2gPKqoxrSG5XHxqLIkocBzr8CZf1qq55jVIdRu9aM9b9QBBgx8KKa+Qdmccbhv6fc=
Subject: Re: [PATCH v4 4/4] automation: Add container for riscv64 builds
To: Connor Davis <connojdavis@gmail.com>, <xen-devel@lists.xenproject.org>
CC: Bobby Eshleman <bobbyeshleman@gmail.com>, Alistair Francis
	<alistair23@gmail.com>, Doug Goldstein <cardoe@cardoe.com>
References: <cover.1621712830.git.connojdavis@gmail.com>
 <e43a22c723b0320883e4f0dc3d08287937d29181.1621712830.git.connojdavis@gmail.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <44872529-9e06-c17e-a635-5255d0825541@citrix.com>
Date: Tue, 25 May 2021 10:24:16 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
In-Reply-To: <e43a22c723b0320883e4f0dc3d08287937d29181.1621712830.git.connojdavis@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-GB
X-ClientProxiedBy: LO4P123CA0494.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1ab::13) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: eba49eab-3113-413e-48b4-08d91f5ee1d8
X-MS-TrafficTypeDiagnostic: BYAPR03MB4552:
X-Microsoft-Antispam-PRVS: <BYAPR03MB45522528A980371B0E75DAACBA259@BYAPR03MB4552.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:773;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: rsvovlFrVrM/sARhlxL+hErL4BXCaWMKvh004XbXm5h8uhZoP8wQ0zoDWNYcwdYgLdey+dsEG2OZLnVE8CVw4Zmw8cEeLRfzZnIsVymq71W2jXdc/tYqxfKoflpRb+GZ1OyEO8h/1icLlqz6MBUPsnCFXadK1OoyhroXfpeEMOXGroX5k7A4vDTRt9A/LR64so+b3z+Lf03cwyiQhSBeEeR41slVdBmy04xdk1yRzCDQyu3IUt8JdTfeRPjBMNlMQbV7Eyj52aRibmFti5Ohu9cWPttRiD1e7LJK+U1TuQ9aJe64utVHJ1YLfGP1rfEd6FZfdKEJlrlJTLINjWnH5fRgUWgxNkAuMmyGrcwhEXSs8B3MSE53Uo9wVntjAEf0OIb6pJKufTWaE2j5v9FUKiK5QjwU6COxGp3W2VM6c6SfU6gdt7IwZlPT53vmx8h3Ay/ZBRKpa2R2sovucAIAk5r8KBNJXMURQQGFtCh3f/QjFHPBbIK0qsvACZA8kr8w7AeTyRqA9eSB1InZ2nmcT+hmzV0aD8SdBDuaFD9RGEXicvstWYN2HYub72Mg1lSLIGoeEPej26Tm+ERHbIk/W1WO8Jx6tGnVqUVG4KjNVmRTR9mE4TXtgIVeDYyIvVrSrrfSsTkQyN8FKDQm0WSxlcpvAYyos3//XZdxaOsKvE76wuEOeJGFwp06qwAcwgks
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(366004)(39850400004)(346002)(376002)(396003)(6666004)(478600001)(16576012)(86362001)(31686004)(6486002)(316002)(54906003)(36756003)(8936002)(31696002)(4744005)(2906002)(956004)(53546011)(2616005)(4326008)(16526019)(66556008)(66946007)(26005)(38100700002)(8676002)(5660300002)(66476007)(186003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?VmRyK0Z0aE02ZVcrL2U3b0lCeFJDa0FsOEl0dTc0KzhVa2tJdmRtYTNKUDlr?=
 =?utf-8?B?blZUZFFaNTBPQ2hXUzZDVGxmTXlpeHdHdm5DK1pCVlFDRThndExQbEVMdmFE?=
 =?utf-8?B?bmJaVmczNVhiS2dYelZZZmRQVkRaZ0ppMXJpbEpDL2wrVDlPYTlhT3Fka1Q5?=
 =?utf-8?B?Zm5lWDdYeDZKbWNrQ0w3ckkzTEFWaWlFUGw3Wm9xSXRKcUhONnpGME5lZ1du?=
 =?utf-8?B?NFZmUTJkRmkzZ0JwMU1td2o0aU1WeXpjb1llb0ZPWFdrRkwyWnplMXhQdWdx?=
 =?utf-8?B?QldLU0d2cEN3VHJlbTBKcERLbG1jOTFGQ2tpOHB6Yjk3S3kzcU5EQnpHRGpv?=
 =?utf-8?B?TnBranNXZWRhY2wzQzkwRWxOdFZDS1ZWTHl1dHRLZkJXMGp0aVVkLzRrVnI1?=
 =?utf-8?B?SE41NG1xUlZsYWpDajdjdHpkeUNZdUhhMzNnZTNrSytla3dmSkNsQTZaRVFY?=
 =?utf-8?B?ZDlVaDNHdjA1MjN2c3JTeHk4ZE9tZ21oekZaWjVVR1FjVG95a1FuUmVCaG5C?=
 =?utf-8?B?RmlZUVo0Tm81SUJONDVabFpBOTZzZm5HRVZuRUVaVm1JQXp2ZmliRmlwakF1?=
 =?utf-8?B?ZW1mUEpBUHpWaFFpOE9FOUdza0piSW5hSTZLRFBieUMrZEd3dTZqbFhYN25S?=
 =?utf-8?B?YVRSSTMyenMwZzF5MUJYVTF1eTBPMU5TVksvczZRSjhhdG9MbkpHY3o0bmcy?=
 =?utf-8?B?WXBmSndEdVlLSWozbzlkRVVVTFBsOU8yMXZUZUZaanMvNGMrRlpLdnR6Q3lQ?=
 =?utf-8?B?bStQcFhGaHNGTVNxSmxwZE1hSm1PTmNqYURzWjluR1lodlhmK0xYeXd1RnA3?=
 =?utf-8?B?SnM3TUZ6MndXMXNLUlBUUWMvTUZ2TGlFeEtvK1FweHFpVjdjZjBVKy94N2Jj?=
 =?utf-8?B?Nm5MZFpISExjRVFNYkFJdi9EeHJFamtOWTNmK2RMNW5memEzeE8yQnUzMUg0?=
 =?utf-8?B?ZEMrQXZseG1Tb24wOWNIK29vaVdxMTg5QkNHVE1tbTI3emJsVW4wSHZud1ZK?=
 =?utf-8?B?b1dBWlhsTlJoSlBTSkcvTWRzVjJvUjVBL3gwcGNyR3h1K3JieHRHalZSQVdw?=
 =?utf-8?B?dXp3Y1R5RDJnOCs1TVJySDFpcWhVZDRhWldLWmNVUDFGUjVpVG9ydFZuaXVF?=
 =?utf-8?B?ZXdxQTVid21aYUNxWEUrOVpWRVpPWjQ4RjB5cFJ6N2ZpZUtidklFS2hkNlpC?=
 =?utf-8?B?OFVnZW92T1V4WHR5RnlBSS93MjFwam9PenAwOVQ5WFpnbklzQWNQY1lwN3hs?=
 =?utf-8?B?SS9ZS0Z3THBUOHJvcHphaUJHQUVrUlRRL0l6NzloU3VsZFBUVmZ3bFV0b2JK?=
 =?utf-8?B?bEE4RzNqTzVhVitGbEE3bis0VEx6RXFTRDY0eHUrMDdpY2F5SHRlSWdVb2lq?=
 =?utf-8?B?NWtzV0pBV1ZYWE14WDNzcGZjVzVuemRuVCsxL2tVWFYwdldqZnNZQkVSZXp2?=
 =?utf-8?B?bFVOV3NiZlRXV3lVTWlWbm9ESk5oUFA4VG04VlVCT3dBTGwzRWtKYWMyNDZr?=
 =?utf-8?B?RU9QYkRXUUlZOFU4ZWlNanp2QU1GalAyb3I2MGVESjgrVk1IeEcxSG40Vjd5?=
 =?utf-8?B?VkxFdDcwd09ZbHFqV0RIZXh4UTkzSml2WmRpY0hNYmlBcUdheno2aWJ5MSt2?=
 =?utf-8?B?RWJiRUNlNCt6cVd1cFl4Wktta2RWa2JRNkJTR3gvNktOSDJDNUJmWXNIZ3BF?=
 =?utf-8?B?L3c3VWUwaE5sZ0M2T1Y4MFordWlrdU5MeUNFZUtxc2huK1UyKzhNdUU1TVZI?=
 =?utf-8?Q?EDv4Q26LMi2VnwkLUcogWJ4C6VFnKfPbaACynE7?=
X-MS-Exchange-CrossTenant-Network-Message-Id: eba49eab-3113-413e-48b4-08d91f5ee1d8
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 May 2021 09:24:22.8359
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: O/tm/cT5uPiGApSQC+8rLPPbQ1TJVndF5glUeDd9gkwPDRw1nTChQkHTBXcoSCuUxEeL5YbsYmgat91Y3FUGSuUPeg2jFIMcjDPYXrPpYXY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR03MB4552
X-OriginatorOrg: citrix.com

On 24/05/2021 15:34, Connor Davis wrote:
> Add a container for cross-compiling xen to riscv64.
> This just includes the cross-compiler and necessary packages for
> building xen itself (packages for tools, stubdoms, etc., can be
> added later).
>
> Signed-off-by: Connor Davis <connojdavis@gmail.com>

I've deployed this version of the container, which (surprisingly, not)
is rather smaller than the one with the locally built gcc toolchain.

Therefore, Acked-by: Andrew Cooper <andrew.cooper3@citrix.com> and I'll
commit this right away to make xen.git match reality.

~Andrew

