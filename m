Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BA35933EB93
	for <lists+xen-devel@lfdr.de>; Wed, 17 Mar 2021 09:33:52 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.98575.187057 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lMRbb-00030w-GI; Wed, 17 Mar 2021 08:32:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 98575.187057; Wed, 17 Mar 2021 08:32:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lMRbb-00030X-Cp; Wed, 17 Mar 2021 08:32:39 +0000
Received: by outflank-mailman (input) for mailman id 98575;
 Wed, 17 Mar 2021 08:32:37 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=FSUP=IP=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1lMRbZ-00030S-Ag
 for xen-devel@lists.xenproject.org; Wed, 17 Mar 2021 08:32:37 +0000
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 0bf144e0-13b7-4e00-9689-bafa52b56587;
 Wed, 17 Mar 2021 08:32:33 +0000 (UTC)
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
X-Inumbo-ID: 0bf144e0-13b7-4e00-9689-bafa52b56587
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1615969955;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=/DCCVV615bfnZ7YEotovwWJkhckCXTT0wENqsoENMO8=;
  b=gb7QK8+ZsdjQSQ6CZizf8ZrF14hmnvdvPiRCDzypOgAVdNnr8pyL91dW
   gtXtcN5zqHU3VbsBBz7XDI5QyxHR06+fupmOK11dCKMbhxq9Wb+CZyi4n
   UflPQsf0D6lHO+uyHtzHYFSCNAMKQORjtZ30wM486j9URuIc0E4C4b+nw
   8=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: ttqiE4udgdHXHe8gTFK25Bv3i4u4DQSXPFIvJ4awyIJiafScpJrz4PCEHqFiMn4iRphH+GbQF9
 Cup1YhaXKX3X0xQ/HIJkEt15iSM+617gdfA4ivcKEurM0fZAU2kyIeURnixPPQvq3R3lp3+ohL
 HjkQe4+A/AXr6+HmWuTPYThM33aggjf0x7QWAA6SXSD4Wu6UipN/GwJxzQH1zWOvb2LPzZ89r+
 Ax5nK+u1Dc8q/dE/zihs+x9vcuiLILyji9s7cTqTSYfiwrFysMw4rPt+N7CG+GxsUWGA4+MkEZ
 /zY=
X-SBRS: 5.2
X-MesageID: 39368451
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:rMRnOK2Q8/qdkGbdyrD5NgqjBQJ3eYIsi2QD101hICF9Wvez0+
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
X-IronPort-AV: E=Sophos;i="5.81,255,1610427600"; 
   d="scan'208";a="39368451"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ESOjIKVOOa1TwZeituf2ZPETd7UoC1uRxnJ50j5zzI9dns6tLnWH3P2RrBXWrZ1CVxTU+EgLksGZDIhNwTORk0s/HYDWbISWnXCgn6pbaSPSkheBcKEldajTwtXCdOR/5OmY7yoOanRI7QxHgY32Fq3wQVjIOg+aTvMCoS7YolQ2jK/Kku582OxsaZcZNgGqdEEUun2dFc6vcaGAtqK8mWu90/Y0lj9i3zlgeKjAKYPsYi8KGmSESGU5xGSIghOaS5j4mps8ZGl4XQDA7c11gD0Sb2H3dVLpH6iUv4DtAryATfa4n4/JhErBfq0O4pgf5rjKobBz1YVKce3G1vIbbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2bAnlotiP0mzCSlLRX4b0h1kwvlfLAQmOZuMy8axsTA=;
 b=PdwAr7gzij1X//XwMcGzkYD4uKWcsKno5P7i8BGycCQqcz1AfjWKoUujrc1nZqv2t6G7izQFjgvgPZhOOK0sjwUU0aQmXkm7aJvbgtx9rk3y1Gg1+ueufIofYTf/cDTZMWgh+FQBXPOHIjRd7ZaQSP2rgWYPrSJMFdaW87VUXK9ya6IhRCShvejTGdzIynTySGRGKFhKv5oFyNxmAnsJQvL+3aqJFZ+JqjwzuG7uTfe2KVbdeU5T3C7tHy85owegcF4y7GIycSX1kH+CrRDcUyGkDNKkkQjRW49yjGIDPSWxgfVM8TNXUnawAh+8mZXwMi9RIFDXA7z7O1aliABxow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2bAnlotiP0mzCSlLRX4b0h1kwvlfLAQmOZuMy8axsTA=;
 b=PPjn+6622O8qI95+qwH/EROZ0qdT0+zAxqDYIa1vwyihHHLdADU7m3YxCZOsjMCyNG7NTlKPJZ5xfvmqEAgLZ1cXf49MFuyALdJvZdBVflSMQksQEMkAOIOXJEzJUbCNEL/6AJ1iMR9jfH63Tw8AyNJQct7CpgwpI6KA5LNZMEw=
Date: Wed, 17 Mar 2021 09:32:20 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Jan Beulich
	<JBeulich@suse.com>, Wei Liu <wl@xen.org>, Boris Ostrovsky
	<boris.ostrovsky@oracle.com>, Ian Jackson <iwj@xenproject.org>
Subject: Re: [PATCH 3/3] x86/msr: Fix Solaris and turbostat following XSA-351
Message-ID: <YFG+lNDsNRH66Ql+@Air-de-Roger>
References: <20210316161844.1658-1-andrew.cooper3@citrix.com>
 <20210316161844.1658-4-andrew.cooper3@citrix.com>
 <YFDjUSz/whe9Jrqp@Air-de-Roger>
 <e7ee5d1d-d793-1ab6-deb0-e2eb13b89a47@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <e7ee5d1d-d793-1ab6-deb0-e2eb13b89a47@citrix.com>
X-ClientProxiedBy: MRXP264CA0041.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:500:14::29) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 183cf8b5-f103-4436-6c16-08d8e91f325c
X-MS-TrafficTypeDiagnostic: DM5PR03MB3066:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM5PR03MB306690F77789E9D08BD99FC28F6A9@DM5PR03MB3066.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: D3+ojkV4lNyyogpj+Z6keqIISQcKVYnsrsq4aYldDUpjeEIoREQBKfPsU8yOM+e7Nj7ceFTQpq2egkgtFp3w1kdB9mVyLtmgh2PrU2M9kes669e5HXcP3q1E33QvOjKtG8IchB8NcEkeKppVSkuwMhnfu8AXj5d9Upk7AcR8dym27snkbkdWXl70xlOF2/bDbACCQXdzKRLpqi0mxK+0yq2qc/SLCgV2i1ZJHIlcQQKuc7oi/g6vhvm1hmbcK02fA372gAJqgFRpGQjyXrwyAxpvFpX63D08j6dsPIEMRG40OnIIbTqpmr4Az7zF7y+ti7wIBPau0UlYRAtSCWDLB6HhwvqFQMfiSJ8HmdMFm9Qes1IgpscEkapmpJDuGhGBna9xJhUXGGj78dqSgb7JuW+3UapWFrwpHbedmISErJRp6RSL/RguAnlFcioO+Qx9WHb9n1z2Exo/IlDPU5KIWuptI+aJVmGkCQ2ug/ETLGmFqJqLkdsWUCDjJN7KhuOAbR6P5lMztRehQYsrir3XBTHTFXvwIuEgEHz316bm9Hh5s63J246eR0EdR1pFxkBKC/8cIXiWUfIx/S3Kiwebo8clePasXqoJrH9lkCvXQMSfkVM25wFoO0szwJ970p5g
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(7916004)(4636009)(366004)(396003)(39860400002)(136003)(376002)(346002)(6666004)(8676002)(66556008)(33716001)(6636002)(66946007)(6862004)(66476007)(478600001)(85182001)(86362001)(8936002)(83380400001)(966005)(4326008)(956004)(6486002)(316002)(26005)(186003)(54906003)(16526019)(5660300002)(53546011)(2906002)(6496006)(9686003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?QzBZQm02VnMxbVI3b2VnN1ovYlc2NUU4NVU3N2x2d0piY0VNc0FHSUZRbmg0?=
 =?utf-8?B?eUFYdHJHU3pNeUdsODUvcGw3SUVKVlNNZ0MvQUVyaytubDVBWjZkQ09TSG56?=
 =?utf-8?B?K2lGOE5PTlV5L1ozbXA0TlV6dm1QeFFKeU8vZm9HR1p1VGlOaVpJQURiR1Zr?=
 =?utf-8?B?WDlWMm04YklEY3FoWE15STZGcVNLcEtPcW15NHdVdHRVcVMxZThlbVB5YTUr?=
 =?utf-8?B?UG0vQi8zT29TaDM3UDh5cXkyU2NJcUQrTHpBU2xSdHp4S1RwVFB2dVhTVzZ6?=
 =?utf-8?B?dU9wSzM3eWFNQURPWlpKcVRseTVyOVpIOHZYNDJweTNEb3R2Ti9HclB1SFd3?=
 =?utf-8?B?MnI4aFN1cEUwR1V1TVdJdDBCMERWSWZqYjBDek90NmtuQ1pLUVRvWTB0N0Vr?=
 =?utf-8?B?R2ozeGYxUWVCOHpnTlBSeExZK1VUM2RSQ2VDTjI5M2RSeVdKRnd2aVlweERG?=
 =?utf-8?B?Q0NzOU01emlhQVNTOTBHK21HZFFKdnhtMkJGRkdvOEdQbHl2amlpRFJSbEx6?=
 =?utf-8?B?TFVWd3liWFJ4ZjkvR2l1VW1DZWFXRi9qTDc2MUlkZG0wYTJJMU5GNFhDS1dz?=
 =?utf-8?B?LzZxNDFDYVN5cFVCcytsTWpLNkIzd1BubU1LN0l5VERsWjZVOCtYcnhhYjdT?=
 =?utf-8?B?UEI4cFVyS2daNWZnYm9XSGhOajM5aENpaTYwaXF5a3pKbUpHZnR6TXVCYmpX?=
 =?utf-8?B?R0JjdzJpZ1FoSjBFZ0QvU2k1Sy9XUy9aTFZNRzF4SEw2SGh5SVNCbllHL1A2?=
 =?utf-8?B?WjQ5Z3VZOTh5MjBJYTZSVGtTQ1pRR3JHVWVNWERXdlVTQlZLZkJoNmNuWWlt?=
 =?utf-8?B?UW9pZWVEK1lIc2JxQTljYzZWSnlDNXJ6ZmNZcEx2VzhGZ01jVW5NejZuSklj?=
 =?utf-8?B?NHRuZ3pyZEhUa3RPMTI5K1hvVVIyM1o1b1NYdFg0UlQyWTNEZFJnU09lSXBy?=
 =?utf-8?B?U3luWm1sR05qTWk3cXNIRWl2c3RyK1Z0UGx6R0JZSWMvaW1iKy9hc2g5Uzkz?=
 =?utf-8?B?TFNFY3ZkSEsydlJ6MmdYTmdJczlCSnZXVm1wb0REdDNST0lXVnZxMHRWd2FJ?=
 =?utf-8?B?MHh0cG5sK1plbnlIUHJqRnYrYWdYWTNDWmNNbHJzSDFLVTMreE1BaTk2NWJX?=
 =?utf-8?B?MEtWYm5ML0ZtMHBaVkQ3RytYTkUxSlpyZDZHRi91bVhBQktFSEQ4cFd2dXVG?=
 =?utf-8?B?OFAwSXo1c1ZtYmdKYWI4aDhpdEF4Wk16NUNzVjZKUm5tSFhHcHM3RVppbEVK?=
 =?utf-8?B?bUgyMHBzU2tFaG9sM1Q3TjlYNEl4V2JGRndkdkdRaHhjU0QzN2NFNGF4eXBs?=
 =?utf-8?B?bC9wQ2RNKzZETkJwcVI4ejRiOWJhdklOTHBPbUM2Z3E2K0VvTDRaTUl4V1A2?=
 =?utf-8?B?aytXMUc0TGVBeFFOSndHcVRwMGhuRm1PVlM4WUs5WXJ5NzNpRE91ajhveUZC?=
 =?utf-8?B?OVVNeW5EZFRTUFpURkVaYTBHTVpLZHprcEdSMjdJeTJqclkrR000ejVDZ2RV?=
 =?utf-8?B?eWZpVGtpdlhSNjZKeTBMYWM5ZWx3WDI2ME9wNEZVcS8xZDdHVys1aU8zSDhn?=
 =?utf-8?B?T1Z0dTBmaDVQY1VHWXZvUS9hWG1oZllzU1YyeldBS2UrR3Q2ai9MRzhOcEdI?=
 =?utf-8?B?T0doL3BFMmRwOFY0cG9OTFltM3M2b1pleG8zWEFhbUMzNWVkVGRtVFExenlS?=
 =?utf-8?B?eUFmbkw0RFc3eXphNlYrTzVzcnk3WE9qZEFXczBVT2VPUWRoWXcxL1Mxa1pM?=
 =?utf-8?Q?jRfPtiB2to7j0zJwGPHbrm5y8kvHZbl3lb+aNYY?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 183cf8b5-f103-4436-6c16-08d8e91f325c
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Mar 2021 08:32:27.4038
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DBMlZudHxO/HodN32MaRbQP6OcCsvlbK3vnN9SCjaN8njR0yIqmGVtwcmwcbC9r29cdGDJHFta/kJlcuC2LVmQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR03MB3066
X-OriginatorOrg: citrix.com

On Tue, Mar 16, 2021 at 09:20:10PM +0000, Andrew Cooper wrote:
> On 16/03/2021 16:56, Roger Pau Monné wrote:
> > On Tue, Mar 16, 2021 at 04:18:44PM +0000, Andrew Cooper wrote:
> >> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> > Thanks!
> >
> >> ---
> >> CC: Jan Beulich <JBeulich@suse.com>
> >> CC: Roger Pau Monné <roger.pau@citrix.com>
> >> CC: Wei Liu <wl@xen.org>
> >> CC: Boris Ostrovsky <boris.ostrovsky@oracle.com>
> >> CC: Ian Jackson <iwj@xenproject.org>
> >>
> >> For 4.15 This wants backporting to all security trees, as it is a fix to a
> >> regression introduced in XSA-351.
> >>
> >> Also it means that users don't need msr_relaxed=1 to unbreak Solaris guests,
> >> which is a strict useability improvement.
> >> ---
> >>  xen/arch/x86/msr.c | 13 ++++++++++++-
> >>  1 file changed, 12 insertions(+), 1 deletion(-)
> >>
> >> diff --git a/xen/arch/x86/msr.c b/xen/arch/x86/msr.c
> >> index 5927b6811b..a83a1d7fba 100644
> >> --- a/xen/arch/x86/msr.c
> >> +++ b/xen/arch/x86/msr.c
> >> @@ -188,7 +188,6 @@ int guest_rdmsr(struct vcpu *v, uint32_t msr, uint64_t *val)
> >>      case MSR_TSX_CTRL:
> >>      case MSR_MCU_OPT_CTRL:
> >>      case MSR_RTIT_OUTPUT_BASE ... MSR_RTIT_ADDR_B(7):
> >> -    case MSR_RAPL_POWER_UNIT:
> >>      case MSR_PKG_POWER_LIMIT  ... MSR_PKG_POWER_INFO:
> >>      case MSR_DRAM_POWER_LIMIT ... MSR_DRAM_POWER_INFO:
> >>      case MSR_PP0_POWER_LIMIT  ... MSR_PP0_POLICY:
> >> @@ -284,6 +283,18 @@ int guest_rdmsr(struct vcpu *v, uint32_t msr, uint64_t *val)
> >>              goto gp_fault;
> >>          break;
> >>  
> >> +    case MSR_RAPL_POWER_UNIT:
> >> +        /*
> >> +         * This MSR is non-architectural.  However, some versions of Solaris
> >> +         * blindly reads it without a #GP guard, and some versions of
> >> +         * turbostat crash after expecting a read of /proc/cpu/0/msr not to
> >> +         * fail.  Read as zero on Intel hardware.
> >> +         */
> >> +        if ( !(cp->x86_vendor & X86_VENDOR_INTEL) )
> >> +            goto gp_fault;
> > AFAICT from Linux usage this is Intel specific (not present in any of
> > the clones).
> 
> Indeed.
> 
> >
> >> +        *val = 0;
> >> +        break;
> > Do we also need to care about MSR_AMD_RAPL_POWER_UNIT (0xc0010299) for
> > Solaris?
> 
> AMD has a CPUID bit for this interface, 0x80000007.EDX[14].

Right, I see now on the manual. I guess I was confused because I don't
seem to see Linux checking this CPUID bit in:

https://elixir.bootlin.com/linux/latest/source/arch/x86/events/rapl.c#L773

And instead it seems to attach the RAPL driver based on CPU model
information. That's fine on Linux because accesses are using the _safe
variants.

The patch looks good to me, I wonder whether you should move the
"users don't need msr_relaxed=1..." to the commit log, but that might
be weird if the patch is backported, because it won't make sense for
any older Xen version.

Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>

Thanks.

