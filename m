Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C7A28372F3B
	for <lists+xen-devel@lfdr.de>; Tue,  4 May 2021 19:51:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.122663.231396 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ldzCA-0006gO-Pd; Tue, 04 May 2021 17:50:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 122663.231396; Tue, 04 May 2021 17:50:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ldzCA-0006fy-M8; Tue, 04 May 2021 17:50:54 +0000
Received: by outflank-mailman (input) for mailman id 122663;
 Tue, 04 May 2021 17:50:54 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=6Poa=J7=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1ldzC9-0006fs-SX
 for xen-devel@lists.xenproject.org; Tue, 04 May 2021 17:50:53 +0000
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id d67874f8-41cf-4c4d-acd6-42b85d002d38;
 Tue, 04 May 2021 17:50:52 +0000 (UTC)
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
X-Inumbo-ID: d67874f8-41cf-4c4d-acd6-42b85d002d38
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1620150652;
  h=subject:to:cc:references:from:message-id:date:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=2zwOtvbYCeCrrEEu3ky6mj/LhH83mJ6RRHaJM5BD6f8=;
  b=Suv70BuYCTJ4eLtWqsOqHhYNa3bjrC0ihaWvn7sXnz6w8fheX4CnrIok
   MOJqIaNjUQZ0epyypvKBMTCcX4FOlRFUxNWUy7Ojulm4MxyUU0n02uCRg
   8IrfwOLAbYXO56rQ7PK4QYJt+Q4CjT6Tg9Sbl06yRHgFtpuwKuMyDJwNf
   U=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: qmH1LsJ8y21Z5MsTOlQEENc4Az6eNte778E25JqcTdBfi2CEHNSZL/OsSO5f0ernOe9QbjfU0i
 0iWzG+IudaicYSDLy8OQrF6IW8tAz6B4BNytj8AIGRk4rRLy1Ct5svsahEONa/qG5eSly4VME4
 YiXwrDNmXyEFMypVfUk6wcjBRgXiluyy7ho2asZMRWnjJ9LlX+NcP21dM4Lk/H6IIcV8dUDs9W
 ahrVQZgD8HwYBboEX+2KcHdEM+km6WOK6LEGiSHTVlk22wmCm2UryzBHyk//aWf416jwvW6LDn
 hQk=
X-SBRS: 5.1
X-MesageID: 43063475
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:eG2I0alvexdfEESR5lKd7Cbfvn3pDfOnj2dD5ilNYBxZY6Wkvu
 iUtrAyyQL0hDENWHsphNCHP+26TWnB8INuiLN+AZ6LZyOjnGezNolt4c/ZwzPmEzDj7eI178
 hdWoBEIpnLAVB+5PyX3CCRD8sgzN6b8KqhmOfZyDNXQRt3brx7hj0YNi+wOCRNNW57LLA+E4
 eR4dcCgjKmd2geYMjTPAh6Y8HoodrXmJX6JSMcDxk85wWUyR+u4rj2Ex+Xty1uLA9n67Ek7G
 TDjkjF9ryu2svLtiP0+k3yy9BtmNXnwsZeH8DksKkoAxjllwrAXvUbZ5SspzYwydvfkWoCsN
 6JmBs4OtQ21nW5RBDJnTLI+y3NlAkj8GXjz1jwuwqQneXcSCghA8RMwaJ1GyGpk3YIh9133K
 JV02/xjfM+Znms7UeNham9azhQmkW5unYkm+II5kYvN7c2U7NNsZcZuHpcDZZoJlOI1KkcDO
 JsAMvAjcwmFG+yUnaxhBgK/PWRRHgpWj+JTk8e0/blqQR+rTRSyksVw9EnhXEQ9J4xYIks3Z
 W1Do1Y0J5JVcMYdqR7GaMoRta2EHXERVb2PHuVOkmPLtBJB1v977rMpJkl7uCjf5IFiLM0hZ
 T6SVtd8Uo/YVjnB8Gi1IBCmyq9DlmVbHDI8IVz9pJ5srrzSP7AKiuYUm0jlMOmvrE2HtDbc+
 zbAuMUP9bTaU/VXapZ1Qz3XJdfbVMEVtcOh9o9U1WS5urWN4zRsPDBevq7HsusLR8UHkfERl
 cTVjn6I8tNqmqxXGXjvRTXU3TxPmPl+5ZdF7Xb4vgzxIABOpYkiHlRtX2JouWwbRFSuK0/e0
 VzZJn9lLmgmGWw9WHUq0VlUyAtSnp90fHFaTdntAUKO0T7ffIooNOEY11f23OBO1taR8PSGw
 hPmkRv9cuMXtut7BFnL+jiHnORjnMVqn7PZYwbgLe/6cDsfY59KZo6RqprF0HuGwZukQhn7E
 dPATV0B3P3J3fLs+GInZYUDObQe51XmwGwO/NZrnrZqAG7vsEgRnwSWha0Ss6JiQMSRz5Z72
 cBsZM3sf6lo3KCOGE/iOM3PBlnc2KMGo9LCwyDecFpgLzxQRpxSm2LnDSerBk2dgPRhgMvr1
 2kCRfRVeDAA1JbtHwd9qrx6lt7el+QeF9KZmlgvZdwEnnHvXhPwfaGD5DDple5Wx8n+KUwIT
 vFaTwdLkdVy9e72AW8tRyCGX8lr69edND1PfAGSfX+y3mtIIqHmeU6BPdS5o9iL82rmPQMS/
 ijdwicKy7YB+sl1xeOnGssPDB5pRAf4KrV8SygyFL9+nExAfDfegs7A54aJsyR9GjiSbKj1o
 5jgdc8oOu3NSHQZ7e9uNfqRg8GDimWh2i8C9wMg9Rzm4kZsbNoBZnVUTfSzhh8rV4DBfaxsH
 lbebhx5bDKB5RmcMMTcR9I51ZBrqX5EGIb9ijNRtIkdV4jj3XnL8qEzrrBp70oGFCArmLLSB
 Ci2hwY2/fORC2Y07EGT4o2PGRNcUA5gU4Ssd+qRsn1CA+wcftE80f/GnihcKVFQKzAPbkLtB
 5175WpmOCQHhCIlDz4jH9eIqhU9XygTt73KAWQGfRQ+9j/AG+yuMKRkYaOpQaybyC6ZUQejZ
 BEckJVTv0rsEhSsKQHlg6oSqL2pUo5lUB5+j8PrC+05rSb
X-IronPort-AV: E=Sophos;i="5.82,272,1613451600"; 
   d="scan'208";a="43063475"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hoSh307uEBxEr8pfIoj3dxW3099US50Zb6QD1pVtECbF1JkiYrC8vfNH+68XmIAujb3CMPKXk7WuaH+n7G3oNGKE1L6+qaey00BNLEh6sUQOL3RHPGYo7GByx9G587FiwjXLtyL21C03/m00WEyf2YdvVT7NXPj8L1ZCCKFfQFxou9AA4yXphOf9AdRIVkh6lSb9bCRvX5yAggi7F/bi7B/JI4/xOFYePIIU+JjWBBzeR+fa3Ee1P+0Y2tc49gtZHTgYHGX5dkieiQZGg/0SO7B3Y3cbpsxHt/GWnWZyWdzPmZRSMe3BwQgsTL1cDk2OL1Ccj26IzbNahX4k++v6gg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2zwOtvbYCeCrrEEu3ky6mj/LhH83mJ6RRHaJM5BD6f8=;
 b=XR2UYx79mLzTCQ7oLb91cu8J5nKVueNJY3zAjGjz/hDXcpavQ8BtN7ePi0baDjzcv74dIUaYktxobFcarmPNjA4BqEzhpXfUGQHfpkey6JV8HRO7whxka6clVUdwcOgAuv3U/Vnj4rvmCQcpUHhKRUns0os6s8LEbzqO6Jx3LZN2ASuM7B+b6+0pFUEnkJf786jDaHDg//29/RcKwVSIXyNe++B03UyOdPOj1P9O29X8yEC48hlb5BOYR7hrQhtMDdn/WSYIs/F87RtNxMv0bmuNAV1K12Nh+aHst+/gYS/DBbJHFhws1f1qgeMjWpH67IVroShmiCcacqEPx6sq+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2zwOtvbYCeCrrEEu3ky6mj/LhH83mJ6RRHaJM5BD6f8=;
 b=upw3dibWr+1yCgPJ2QVGmEjiPA1touOBnWjFrKP6M7ifU2QgtNxYYwIycTlBNkAFdXeFCS38NTb2uwOYVKLsJHqhK5nca26zC8eY3pzzz6IHd7Qg0yFgWUkEqVOvf2BieFekncTHStE3AI/Q0+DIHPTv/hGLlow4VMyZVg2Ilbk=
Subject: Re: [PATCH v1] tools: handle missing xencommons in
 xen-init-dom0.service
To: Olaf Hering <olaf@aepfle.de>, <xen-devel@lists.xenproject.org>
CC: Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>
References: <20210504143128.16456-1-olaf@aepfle.de>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <fe3987b5-c04f-24f3-88c6-24553710352d@citrix.com>
Date: Tue, 4 May 2021 18:50:36 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
In-Reply-To: <20210504143128.16456-1-olaf@aepfle.de>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-GB
X-ClientProxiedBy: LO4P123CA0342.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:18c::23) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 352bac7b-dd66-4fa7-b4c2-08d90f2526a9
X-MS-TrafficTypeDiagnostic: BYAPR03MB4743:
X-Microsoft-Antispam-PRVS: <BYAPR03MB47434B736082E62DBF1C24A4BA5A9@BYAPR03MB4743.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:989;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: rB5sauJdf3VjJw6+hDRRRPeKoLywtraDbe+oziS0o9vG9Rk7djNDd46JDQwAIsYv9aAVLKJHTOOHShn6oIKP0l/G7iFlMWclCkc5X9Kswg/x562P24KwXytsgmDpZA2Yz4aFEJSinM3Sa8mhg/PRNgxzX4W5ETT6JgYvzRTsixAEUwrkGWJjJpA6i00hefZt4Gf4SIKixOHKYmbg0zoWVpWLYA0UQAlIdUUBQJlATnskLD3xTVOGF0ne40nxsajdlP9r61olz86G8KFCuDmSC+IEcGTOKhgq8wD1fUkSHLqqW1sduAdliTK0F/FJBGzuTH9ntQWDoscRP3kZxRG57XiAaoPbji6dQdaWk079NMog1yUEOwfg+6bOsPRYnWzc5G4eZyL16SrPHRhFqCSlDBtgYfRJE7WQ24PUVQaMc45jHlBwgpbwRW/PmXn+e5Z0XlbkSdP4DPh1Jjkb46BcA32W81kzMep8QOaJB04pGkYgmaKxqR/sZTjHhwKXTwR7Sx0/QZ4dZBuED/Qak7kwytJQu10cX/40M8CL1yoBfvu4KC3AuOuj3Yf2wmcKP4sZZgyB13r7T7qNzVFcfZfc+ApsOCgpfzXPrnMEnBKdtGAsQyvKf5C1ElDBL+8oUOy7kbRDuesrHKHJIRsDoqjjjrhBENgarSNYfcrHKzJqOmpoFEmWtW+yrfSy22Xivi6A
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(366004)(136003)(346002)(376002)(39830400003)(316002)(478600001)(31696002)(558084003)(956004)(31686004)(5660300002)(8676002)(4326008)(36756003)(16576012)(6666004)(54906003)(2616005)(8936002)(6486002)(86362001)(186003)(2906002)(26005)(66476007)(66556008)(53546011)(16526019)(38100700002)(66946007)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?TkR1RE5Scy9IS1pkL1Jzb2hhZ0xOUmRiUlEwUkRRcHNqQlhMaXBxdkZzOUh6?=
 =?utf-8?B?YU1kMXNva2lQRmZRNDB0SXgySk5PMWhleHJmMFdzaDB6cWdWSGJMZTVPYjBE?=
 =?utf-8?B?eWZDTHZMbzZ2bjdtcmp4RWY3dDRIempCS1FZUXd5cXRTdC94bmc1NHB2b2lS?=
 =?utf-8?B?NUVSbmgyZXFSUzBXSXFGQVZrb01uWURkeUc4ZXVrRjF6cTNMN080aFByUWor?=
 =?utf-8?B?bXVOVE5zcWxPUVhqRUl3dlhYeUlFV0FTT2UwakZzV3RXdkJ6NkE1YTREVndF?=
 =?utf-8?B?S0ZRZVJsb1MwR0dHYjlsSDhtOU1XMmdoMm81aXYzUUhWSEJOdEc4amlZZG1K?=
 =?utf-8?B?ZnJqdW5kZ3Jlb0lCQWh0dkR1SWkvSng2R3NwWnRjcVlTRk56OUpLVytRM0RN?=
 =?utf-8?B?QS8raDhjWlJJYnppQjd4T1d6ZnM2NXNhMjdvK3d4aFZ0cUVJLzB3bFJzK2RH?=
 =?utf-8?B?NmJWR2V0cFFRYTJ5U09GY3l3VFNGblFhMU0vQ3ZZMnR4YThiR3ZoS095dU9m?=
 =?utf-8?B?emtIamRZVDh0YU92b29pZzB0cFBFY3BwOERlRkJnQ0JNWDVhNzB2RmZVK0R3?=
 =?utf-8?B?VVNsVlVjaGsvKzNkSU1QT1FZUkhueVlNcmMyM2ZnU2ZiNjFqUXZwRVVmSGVR?=
 =?utf-8?B?NG12QnNVR0RvUXNUVDhCWlZzTEQ4YWhBemY2QkUxL25FUzhQOTRIanFzaS8x?=
 =?utf-8?B?MG5WK3M0M3VIS3l4cW9GdVBkWkFLTlEyNmtYMmRPY2VvaUlhRG9SaUREb2R2?=
 =?utf-8?B?bEpQU0hrZkpBY2ZlMENVNGdmSnNKMFZiMTY2OC9YZWV2ZDdmTXhHL3RyL1Qx?=
 =?utf-8?B?aVlLWnFZTlRsOUN1UVBkN0VBNDBpMFpXcUxUTHhtcUNoR0dUVVJGRWhxOHE0?=
 =?utf-8?B?MzRhZ2liSzhDZjBHejJwMlRTQ05BYUozZE5FOVMrOU9BSHRoVnpkVTZUbDJ5?=
 =?utf-8?B?eWorZXVYYlRpZDd4VlljOFpyS0Z5UG1RUE5ocTM2YkxDR1duMCtiTTRRNHBi?=
 =?utf-8?B?SjNadk5ORTZ6aGFlcHg3MUJrenhpZitqMjd1T25IeTZBbldpTUIrUTVVVENL?=
 =?utf-8?B?ZDJCSnJ3Q3pZVlJ1UGo5eDVZTVBvOUZpWjkrN1RZMCs5MlR2WGwwbWNlTnlF?=
 =?utf-8?B?NlNoWCtMLzFndjlnTmNMUVBualNBNXdNUHBhaUZ6SnVhbUhnbWNnN1RDWVIz?=
 =?utf-8?B?MVoyR01WUGNRaU9YQ0R5N3hjaEdkS3RGZDg4UVkwK1R1bFZlczVjcnBndDha?=
 =?utf-8?B?R1h1MmVCZGtwbUY2M290RlVMdG9mSi9NRVdjNzdhOVlYNEZWVUptRjhKdnJy?=
 =?utf-8?B?clgzeTdEQisrcHhWTmxUQXp3aklMUjJTSExTM1ArY21WOUJwaWxEcWtnL09s?=
 =?utf-8?B?MzIxYyt3VFBTNXF1N3NwYlg2MHNyMjhXYWpBaVlsQjlYVk9YSUR6RW1jT3Bi?=
 =?utf-8?B?cE5GQlk3UnhvS1ZUMm4rNEx2Mm1tT1Bjc2srOXFMSE9FSzQxdmdCWldMRFha?=
 =?utf-8?B?V3VVNTY3dUJxc2hvTGJOcFlZYjdVK2RtUnFjd0lYQVJBbmp0eThNOXlyMmNy?=
 =?utf-8?B?dEJ6N2o1NElEOVovbUpEUC9iQkw5eXJ2YmViQ1ZsWGpPNkUzakdORHYyMGho?=
 =?utf-8?B?NXpqR2pIdWxXWCtMYnJqUEk3eThXOG1sczM3OEhKT0l4WmJGejkvZjdiNWJv?=
 =?utf-8?B?TkdZNDR5Tk1yUTJCYWxxTzM5RnZlejFZeWIwZE9ZUnpVM2lyOEtKVDExNVlr?=
 =?utf-8?Q?pM4qXsQAL1F9FKDGQ9OT9YbYd1AsVGgxyuMoYkA?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 352bac7b-dd66-4fa7-b4c2-08d90f2526a9
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 May 2021 17:50:49.4194
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YQx+Nc0vQsG7W9Ssa298wkC1RCSIXZJzwB0L6KeAucRJKJfd8mwIU9E3JRVDZE6w4XEOuvmV1LhP302PhNOouY8GJ3zS6fdzQgLvlGSaQ4s=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR03MB4743
X-OriginatorOrg: citrix.com

On 04/05/2021 15:31, Olaf Hering wrote:
> sysconfig files are not mandatory.
> Adjust xen-init-dom0.service to handle a missing sysconfig file by
> prepending a dash to the to-be-sourced filename.
>
> Signed-off-by: Olaf Hering <olaf@aepfle.de>

Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>

