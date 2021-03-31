Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BC38C3501C4
	for <lists+xen-devel@lfdr.de>; Wed, 31 Mar 2021 15:58:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.103961.198314 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lRbMG-0007gs-0k; Wed, 31 Mar 2021 13:58:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 103961.198314; Wed, 31 Mar 2021 13:58:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lRbMF-0007gT-Th; Wed, 31 Mar 2021 13:58:07 +0000
Received: by outflank-mailman (input) for mailman id 103961;
 Wed, 31 Mar 2021 13:58:06 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=9hby=I5=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1lRbMD-0007gM-Vj
 for xen-devel@lists.xenproject.org; Wed, 31 Mar 2021 13:58:06 +0000
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id e6e90a75-fa96-45e0-ab62-4c419187b29f;
 Wed, 31 Mar 2021 13:58:04 +0000 (UTC)
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
X-Inumbo-ID: e6e90a75-fa96-45e0-ab62-4c419187b29f
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1617199084;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=oaQ5d73A7ONCkvTRszCxcC2b5AN5hC+zf+t6roImfW4=;
  b=Z/zmQDSmYekcOfrQHQvrSdu2XKFeRw4YVDPtePR54vgveYDvsu6IYAUa
   m2c7mFc0Mz/1oTJx/vfE8+VWd6RZezAf9WPl67F5rx5yJsm4H/nJzU4yU
   A+Qqd9j/y/BkEpa6WyKYlhH9uWqp53xQjZGvz1pr6oAxn4f14LBOL7RbP
   Q=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: rAk9kULo2orzUaE07Zrs+3pf5j78MsNmUIcc4LAZehhPcQvZHnrND6HSogFIRUOlIUA/LScm4v
 r1M3ghrmo0W2sRJWPM5D4EtsaJZw5NfzAzu7maOYEGJ6KtlAkqLhC6CPFdVX8BhAXIzDITAbSI
 jq1TLeJqxA/z1DBSnI5/XHTycuKeZekxn6jPGBl1f74B7vcN8k5qYzsWSBg6vMvh3sNFPPyiV0
 K6hiH+hjwyeALYJq4wYzYUof7UNUKKP7iA/CKhRt96FMQv4w4+VkSTt+t+kU4WXY+g3nngZosb
 S3s=
X-SBRS: 5.2
X-MesageID: 42014455
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:P3GOkq3PyOC3KiE9Z7MXbgqjBQJ3eYIsi2QD101hICF9Wvez0+
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
X-IronPort-AV: E=Sophos;i="5.81,293,1610427600"; 
   d="scan'208";a="42014455"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=I5W81CPDrkCkr/2k0qh6lIeVsdIfaI1m0dUAVnrA359SoDsxLv2+A1gAVcLuQ9BQJEcMQtBDDVT8KRULff7v6Kn/Zf/fC0EaY1wK053yfPIHXHJ4jS6KAyWpbsOn734Fn2YSUlOqZrxE/80jS6vTIRL59+5mBXZk9w1vU1HQji9zThaKo6NuwTPsINOh66NSle0AGpuNNu08eEczK72qU6bTxkMeW/kanO2uEp08Pt648cvATvGQ0/Sldwvpg9ZZZRdaqOAo9xpSnFpS68HH4bLPo01Nq+MjHjkA9flUjDq2X5e9k5qTbBLFJkVqtH9LRb3oqzqW5VU9QpUg5UcyAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=y/P5L6W9u5PncH7s10IMUlBsuZUVrseB6TT68j/XCYE=;
 b=kWGBM9AypmFcMwu1VF/IVajA7pb2qI7WhNCOA5mBvmZKntF4HDGd3uMSoMX4opHKMq45GTy/HNjFfb3OQp/kVhiKV37lQr4TSlbrdLflevuleg7bvLoY7iy0bITtOxcXqu1iUOfO2fzL+QjnFVEoq9F2OGw3/xgMa9DeYUl2yctIJndOBxKIWFPckk9ZNFegd/cJsh5+VpTnikrDA6BsLHbTRhu9d7rXQZSUHFxHpCcxvwJxVWzmmSTFAbHEy+6KH1oz9gi/SbqZiAOwVqlVS0scYBUzeeqVumg1F59n27XC9HEP1lzkyyJuyWBgTNMe1ovTrciq/gD8lh7nqBIoLw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=y/P5L6W9u5PncH7s10IMUlBsuZUVrseB6TT68j/XCYE=;
 b=A5k1CLgveIo2Dt4io7Mosk7Tt5L3rNOIQH41qX2Dra5UBu0thEV9342XxrytP0U98GhFN6a+FoGyGpag0RC4iIwjqcS6C0z2CDGmElsGoOtDMD/bqQStR+uFGCDp9G7aQF2p553mYwxPURGBep9Pl9wmMZF5x98aqk4X3e2lJG0=
Date: Wed, 31 Mar 2021 15:57:57 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Jan Beulich
	<JBeulich@suse.com>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH] x86/hvm: Fix double free from vlapic_init() early error
 path
Message-ID: <YGR/5bYbLtV+bKLM@Air-de-Roger>
References: <20210331133125.7072-1-andrew.cooper3@citrix.com>
 <YGR9+is03vAZgtd0@Air-de-Roger>
 <bd3541f6-4f5a-95fd-d3d4-56860e7c2736@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <bd3541f6-4f5a-95fd-d3d4-56860e7c2736@citrix.com>
X-ClientProxiedBy: MR1P264CA0035.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:501:2f::22) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ad7a76be-9a63-4f06-a713-08d8f44cff9e
X-MS-TrafficTypeDiagnostic: DS7PR03MB5526:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DS7PR03MB5526605E3B77FA19413DE0208F7C9@DS7PR03MB5526.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3173;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: uZf771vaj+TBkGpZlvNLxyN9RJOiCad+zuYtu2TfDQBy8SI7SIEEP2UhWQTx9JDblluFVSQptK1mY+91d9+2sk2qxl9eXtOh/fn2PhJK4lNf2sfurYnvH1zP87TYc+ZfEiIJ4lHaVmd2MnxH9JbZS6YWM1TNQoTpAN5IK77YjDyu+qmKiVd6ZoAzEFyaA8q380hJJIckL50iycHKlkyhTwlhGdetDijqbo6KVPDk+WHP+T2uts7pccQnh2w2ipQmOWJZ608KbpAJmSPduhG0NnTKm7MjaafvfGGl9k7+zNWxztcKlLzVBxIoY0ov/zh9qryaHtn27NZNLvvESAAyVJQmTnRlKfHjVb7wt9ex2gsuQwg49niUja0ljL4CgHLe51P1pMHryk5AfgPDD6dEjmNBPxmRzXuzMJc7YeQNVISXXyoYYR/lXDiuoE3SVmH9biGhFCBSIDEpLbXam/MB0xkohPoFL2rPsePDClUC2qQcgxwytbPhLkZQEOzwkOnI4Tp2tyAg68gRGvzqjP7+O6c5NAMvkCsH0rx/qsV08yKwbVhH6ssGX26/Lgy54mdEzg2UEAHxgzDYE9tFEUTtRidV6kgo/DumPen//70pZXcQkO0GE7JoG21abChwNDR62sAJvGT9rVCP0zhrveLH93IWoI6JvgQW3/qYCh4gBag=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(7916004)(396003)(346002)(376002)(136003)(366004)(39860400002)(53546011)(38100700001)(6862004)(9686003)(5660300002)(956004)(85182001)(83380400001)(6666004)(33716001)(8936002)(478600001)(186003)(4326008)(6486002)(16526019)(86362001)(8676002)(316002)(26005)(6636002)(2906002)(54906003)(66946007)(66556008)(6496006)(66476007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?ZTZ3RVJkdjhhcS94a2tqVVFCd0ZScE5kZk5YUVA4UWZIRUFSdVJLZFlITUNp?=
 =?utf-8?B?UXlocGVhbXFaK2tRYjhPL0l4cFA2OHJoSVhHQmg1Z0s1bmR0dVh1L0FhYm92?=
 =?utf-8?B?Qm16eDVGQTU5eFJqTGwrbXNzZ0JYOGJSeFJFQVorcnFSalN0d3NtQStrNVR5?=
 =?utf-8?B?VzV4bWlRQ2tVdlpGcTQ2Z3RSNEFkMHVibm5CU096S2wrazQ5RzZTMUNKWXpV?=
 =?utf-8?B?SU5tUXcrT1lJMkU5RnhmRXRtbTdXcjhyNGlmbm5KK3Z5TWFOSkljL3Z3QVNI?=
 =?utf-8?B?emFvWUlEdWlabkxuRmo4S1p0VWRHc0FRU0kvMDFmUkl2bTFjL0dpRFdNR0NK?=
 =?utf-8?B?YTFMdVMvVFdaZVpZcHUvSUR3RVlNN0NhYURXWTBBS0RPT0ZNU0o0bG5HV1Z3?=
 =?utf-8?B?NXZZOUUzZkI4Tjd1MStKMTFUc29UZldCSnplRTJpbzlvTkxsNHRrOE5ieTBV?=
 =?utf-8?B?SjlXWEp2OTd6aUVockVoUVpRMHF4MFg3YldJUUwxQVVuU21LMzFORStUQzRD?=
 =?utf-8?B?bVYwc3BOQmF1bTl2ZGcyQThzVU5leHRJbDNOSUFDSG0zRHBRRm9lTUt0cFlh?=
 =?utf-8?B?dnZuQlRnbmJyQ1Y0dURyZmVVbVlsOU1TQWpCczhVM1l3dWJYNzNlVFBSMFFt?=
 =?utf-8?B?T3psQXluZE5LR3FyK2h6aEI3SDlJVmhkeFdsV3BuS2FnZUFCcUdMWGRaczRx?=
 =?utf-8?B?YzRHaGhVeTZCMmhCa1A1MWhHSDNCVDFBd3oxQ1dOUmROYnB4ZnJ3d2VHcVg1?=
 =?utf-8?B?UkYzVENIN1dLYStVWmxHeVg4dm5IS1d0RC9XWnVwR0E4YUhUY01IL1F0b3Rx?=
 =?utf-8?B?eE9HMTQ5N1dXa21zbzY2SHNTRWI5akdseFh3T0VSbjdBYWVJQWFWdjNwZHAz?=
 =?utf-8?B?c1g2WHdPVVdoWUlhejNJck5GNTRFR3gyRnViQ1Z5N2xsR20xdEtNYlpCYjJD?=
 =?utf-8?B?a0lrem1XV3ZJYjE1MU53cDZITU9ZTXZzVHpwNlQyMlZuc3NhT1NvOWVEQ0RU?=
 =?utf-8?B?ZDBLK0RSd1VoeTl6cDRBRTg3SlZNVzMvR2dsOWhlYS80dGh1NDdZUVdkRFJB?=
 =?utf-8?B?Q0VnV0ZEaFVMV3dYNmdyVzFOUkJKZGMxOUxxL2REMWpTcEh3eGtxVE5ETVdS?=
 =?utf-8?B?TXIrb3dRVVdTalJnT252NENxT1BWUFNlbHptK3FvS1pyVTY3RnFIU2kxM25v?=
 =?utf-8?B?Q0hnWitOcVVoVHZla0V2U01HazBNWVU4Q3F1d1NncTJiSGJFZU9HSmcyMUVQ?=
 =?utf-8?B?YzNhY0FwaGJoTUZHQVdsZmQ2R29lMkFVWFNXYVl5ZnZJTXA0K25uOE1oSE5R?=
 =?utf-8?B?MDNONko5TkRKTGlmSURabVY1RzBqQWdQRFVlVTR5NFJ2SEtKT0FkTStqaTZV?=
 =?utf-8?B?djcyTzNUTnYrQ3UyZmNkUzV3Sk55OFZwRGVpMVNVUVVMZFRneitERW56ZFV1?=
 =?utf-8?B?TGlTVkJOdkVIZzNUbGpzemYvdUNUazdtM2EyNHAyb3FKb0ZBaXZRandOeGZh?=
 =?utf-8?B?WUZGL2x1SkRLWDYzcTJWUHAyYVdmbmhBajVGd3ZUQ1d0eWVZTndOcmdnMnFK?=
 =?utf-8?B?MUZ2RUpLSDl6bGRsenlmS3c3VlA0U1h5azVDNlBnQlRuSVVvb0lHbEIyeXZN?=
 =?utf-8?B?V1NpaUVEZkhyUW1nT1B0QXhjU3JUY1VHSGxUQmpaYUtXZ3RiUU1EMXU3ZjFQ?=
 =?utf-8?B?emI1OXBxcDFEUVRNRnZRVEx0RUNlNVFBM0QwNTJtWDFiSWpkQWF1S1hLZFVF?=
 =?utf-8?B?VGJtTmN3SmV3TlNGSlpHZTVObVhJZE85Ym1NZlEyMk1yYWUzQTg0Q3Ftb2k3?=
 =?utf-8?B?WWRqejJkcFdQSUMzbERidz09?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ad7a76be-9a63-4f06-a713-08d8f44cff9e
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Mar 2021 13:58:01.8444
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: D2pFZba6AUI8jzPpNqWduIz8RXI1mmUHx9IlT02HVVQJA4I2LJuBAQuz99IxC+sXzz6oMlsoXhG2Rno/Qks93w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR03MB5526
X-OriginatorOrg: citrix.com

On Wed, Mar 31, 2021 at 02:56:27PM +0100, Andrew Cooper wrote:
> On 31/03/2021 14:49, Roger Pau Monné wrote:
> > On Wed, Mar 31, 2021 at 02:31:25PM +0100, Andrew Cooper wrote:
> >> vlapic_init()'s caller calls vlapic_destroy() on error.  Therefore, the error
> >> path from __map_domain_page_global() failing would doubly free
> >> vlapic->regs_page.
> >>
> >> Rework vlapic_destroy() to be properly idempotent, introducing the necessary
> >> UNMAP_DOMAIN_PAGE_GLOBAL() and FREE_DOMHEAP_PAGE() wrappers.
> >>
> >> Rearrange vlapic_init() to group all trivial initialisation, and leave all
> >> cleanup to the caller, in line with our longer term plans.
> >>
> >> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> >> ---
> >> CC: Jan Beulich <JBeulich@suse.com>
> >> CC: Roger Pau Monné <roger.pau@citrix.com>
> >> CC: Wei Liu <wl@xen.org>
> >> ---
> >>  xen/arch/x86/hvm/vlapic.c     | 11 ++++-------
> >>  xen/include/xen/domain_page.h |  5 +++++
> >>  xen/include/xen/mm.h          |  6 ++++++
> >>  3 files changed, 15 insertions(+), 7 deletions(-)
> >>
> >> diff --git a/xen/arch/x86/hvm/vlapic.c b/xen/arch/x86/hvm/vlapic.c
> >> index 5e21fb4937..da030f41b5 100644
> >> --- a/xen/arch/x86/hvm/vlapic.c
> >> +++ b/xen/arch/x86/hvm/vlapic.c
> >> @@ -1608,7 +1608,9 @@ int vlapic_init(struct vcpu *v)
> >>          return 0;
> >>      }
> >>  
> >> +    /* Trivial init. */
> >>      vlapic->pt.source = PTSRC_lapic;
> >> +    spin_lock_init(&vlapic->esr_lock);
> >>  
> >>      vlapic->regs_page = alloc_domheap_page(v->domain, MEMF_no_owner);
> >>      if ( !vlapic->regs_page )
> >> @@ -1616,17 +1618,12 @@ int vlapic_init(struct vcpu *v)
> >>  
> >>      vlapic->regs = __map_domain_page_global(vlapic->regs_page);
> >>      if ( vlapic->regs == NULL )
> >> -    {
> >> -        free_domheap_page(vlapic->regs_page);
> >>          return -ENOMEM;
> >> -    }
> >>  
> >>      clear_page(vlapic->regs);
> >>  
> >>      vlapic_reset(vlapic);
> >>  
> >> -    spin_lock_init(&vlapic->esr_lock);
> >> -
> >>      tasklet_init(&vlapic->init_sipi.tasklet, vlapic_init_sipi_action, v);
> >>  
> >>      if ( v->vcpu_id == 0 )
> >> @@ -1645,8 +1642,8 @@ void vlapic_destroy(struct vcpu *v)
> >>      tasklet_kill(&vlapic->init_sipi.tasklet);
> >>      TRACE_0D(TRC_HVM_EMUL_LAPIC_STOP_TIMER);
> >>      destroy_periodic_time(&vlapic->pt);
> >> -    unmap_domain_page_global(vlapic->regs);
> >> -    free_domheap_page(vlapic->regs_page);
> >> +    UNMAP_DOMAIN_PAGE_GLOBAL(vlapic->regs);
> > I think you need to check whether vlapic->regs_page is NULL here...
> >
> >> +    FREE_DOMHEAP_PAGE(vlapic->regs_page);
> >>  }
> >>  
> >>  /*
> >> diff --git a/xen/include/xen/domain_page.h b/xen/include/xen/domain_page.h
> >> index a182d33b67..0cb7f2aad3 100644
> >> --- a/xen/include/xen/domain_page.h
> >> +++ b/xen/include/xen/domain_page.h
> >> @@ -77,4 +77,9 @@ static inline void unmap_domain_page_global(const void *va) {};
> >>      (p) = NULL;                     \
> >>  } while ( false )
> >>  
> >> +#define UNMAP_DOMAIN_PAGE_GLOBAL(p) do {   \
> >> +    unmap_domain_page_global(p);           \
> >> +    (p) = NULL;                            \
> >> +} while ( false )
> >> +
> >>  #endif /* __XEN_DOMAIN_PAGE_H__ */
> >> diff --git a/xen/include/xen/mm.h b/xen/include/xen/mm.h
> >> index 667f9dac83..c274e2eac4 100644
> >> --- a/xen/include/xen/mm.h
> >> +++ b/xen/include/xen/mm.h
> >> @@ -85,6 +85,12 @@ bool scrub_free_pages(void);
> >>  } while ( false )
> >>  #define FREE_XENHEAP_PAGE(p) FREE_XENHEAP_PAGES(p, 0)
> >>  
> >> +#define FREE_DOMHEAP_PAGES(p, o) do { \
> >> +    free_domheap_pages(p, o);         \
> > ...as both unmap_domain_page_global and free_domheap_pages don't
> > support being passed a NULL pointer.
> >
> > Passing such NULL pointer will result in unmap_domain_page_global
> > hitting an assert AFAICT, and free_domheap_pages will try to use
> > page_get_owner(NULL).
> 
> Urgh - very good points.
> 
> Do we perhaps want to take the opportunity to make these functions
> tolerate NULL, to simplify all cleanup code across the hypervisor?

Yes please, I prefer that rather than open coding the check in
FREE_DOMHEAP_PAGES/UNMAP_DOMAIN_PAGE_GLOBAL (or the callers).

Thanks, Roger.

