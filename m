Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 87D873B9091
	for <lists+xen-devel@lfdr.de>; Thu,  1 Jul 2021 12:37:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.148608.274620 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lyu4Y-0001Bi-SP; Thu, 01 Jul 2021 10:37:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 148608.274620; Thu, 01 Jul 2021 10:37:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lyu4Y-00018w-Od; Thu, 01 Jul 2021 10:37:30 +0000
Received: by outflank-mailman (input) for mailman id 148608;
 Thu, 01 Jul 2021 10:37:29 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=xRek=LZ=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1lyu4X-00018q-5w
 for xen-devel@lists.xenproject.org; Thu, 01 Jul 2021 10:37:29 +0000
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 822fb6e9-e771-4340-bc09-db7355af4b2c;
 Thu, 01 Jul 2021 10:37:28 +0000 (UTC)
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
X-Inumbo-ID: 822fb6e9-e771-4340-bc09-db7355af4b2c
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1625135847;
  h=subject:to:cc:references:from:message-id:date:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=WSCKT4OxFnyTL2XKksw+AQ3g+XGkrMfygXLYy+0V/Hg=;
  b=SWmG7SNpNvnS37iCYCvtfddWrEdlYlg7mXE0IRMdWPL+PpZJ9mvk2WOu
   KL1IqpxkXzSnabSYgTcNbXJq0VU5U3otmDe6mGifpT2Ax0edbzC5liJQW
   hZ39+UfNWrLtXDtNLtGJUAmuiJR5RiQTf6JM5jw+6dxhwnlMlbTNt1hN6
   0=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: kH4uyMaTgITXJB/Q66akr59F0sAN4W4KT+idpgkEgvZbLUizONMRudOyTSCCp0htWucfSva+gr
 a8l1XE009Ndffr7A7icfTCE/nj2tEpckrvm4C3bJV/MjqTD8xkJZIJOKJQjORKSpY311u+PDos
 2lbiVD7EI4UaPow0aZz3oH178oeCWkZdFn4hMVZP/k0cZ7FG8R6I+7xqv3x5l0Re3AT4i7CAxE
 /ctWOrroUo1wTTPk0NWLicKzkwAGjv6UCc7Yto6VTdU3epE2WQqJAPg8UkwKo8EU7V7lH5Iat8
 Ons=
X-SBRS: 5.1
X-MesageID: 47075608
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:DWI9SqpUDqWpGsZbaBHjvE4aV5vJL9V00zEX/kB9WHVpm5Oj+P
 xGzc526farslsssREb+OxpOMG7MBfhHO1OkPYs1NCZLXXbUQqTXfxfBO7ZrQEIdBeOjtK1uZ
 0QFZSWTeeAd2SS7vyKkzVQcexQueVvmZrA7Yy1rwYPPHRXguNbnmBE426gYz1LrWJ9dPgE/f
 Snl696TnabCA8qhpPRPAh1YwGPnayFqLvWJTo9QzI34giHij2lrJb8Dhijxx8bFxdC260r/2
 TpmxHwovzLiYD79jbsk0voq7hGktrozdVOQOSKl8guMz3pziKlfp5oVbGutC085Muv9FEput
 /RpApIBbU811rhOkWO5Tf90Qjp1zgjr1X4z0WDvHflqcvlABonFston+tiA1nkwntlmOs5/L
 NA3mqfuZYSJwjHhj7B69/BUAwvvlaooEAljfUYgxVkIMgjgYdq3MgiFX5uYdA99HqQ0vFgLA
 AuNrCd2B9uSyLeU5iD1VMfmeBFNx8Ib2W7qktrgL3e79EZpgEg86O0rPZv10voz6hNPKWs0d
 60eZiApIs+OvP+UpgNctvpYfHHR1AlEii8fF57HzzcZek60iX22uDKCfMOlbqXRKA=
X-IronPort-AV: E=Sophos;i="5.83,313,1616472000"; 
   d="scan'208";a="47075608"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=a1QY/Bs03C3Re4fmkQogDI7qvPqug9oNl/aFQ4mXt1QY4HaNnboCyyWIpDYZHEmOn2slsuObchK/aQ8/EcD/vHaqIDKpMs4tc1XEOfVMN5CNVoHVE+iS2U2MTlB9UtqMy98f0WaS+RDr/Ui7MuXD9YsuiJJQQ5gis/AjRXUKI9x4kZ+pFbQS2nBDM95RM5P5S+p6U+tIEGLlVdz/NoORor+cY5kG5vHXjCjgP4G9APy9M3Sw7gb+n5DlneqBZ75DMplv7T69oSfEwAP8/lIS8R0X4l8QjuwnNvjHThGGazu29b3pNTp6IT3/i1kpCOH6jF117BC0f4gL1Hrs0miHug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WSCKT4OxFnyTL2XKksw+AQ3g+XGkrMfygXLYy+0V/Hg=;
 b=QONwnpLk55o5W/Cxl4KqG3mI16XlPq+cZAqAwy0pq+pg5ev21Pnzl6/jR/2RLRn9YPSFqoozOS5UBmuAqmUIXpzEDYYqBl8nmDPISH77dL7aEr0IKAsMHvHGAGYHLd3ZQFCajrskYH1GnwvfR7m9/vWn2KFvv9w2FPw38QZ4ymHpppzfZ0OMIsixxzL5w+H6fp1QUqQ0Jqb4FSmcImj+AGsX/6yBKG01p6027efz7rlqZygbzgom2WY8BdkNRx3TNsJ530JpuuVF/DDIEvHrqVj3jag4hCX8JqGbjrBkMwd/o+qHRw1qLVzi6PjvRnnOHjRuScMMaThDbBzp54rFtQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WSCKT4OxFnyTL2XKksw+AQ3g+XGkrMfygXLYy+0V/Hg=;
 b=TbhqcEv/hbP4m3vIMyiOAeTgTJ1QPsYDLPGLvtgB4cc3k0wjxWozXqII1injOJCAFPulIE+7ZpwIJ08VimuNS72RRaCiMLRQrb3EuVvUUxmgFYfOZPO08PRdHa8bOzq2SbHOZ93pBw+nB0r94fTQRSXYygh4IZvu/yxyfMkWSbw=
Subject: Re: [PATCH v1] tools: fix comment typo in libxl__cpuid_legacy
To: Olaf Hering <olaf@aepfle.de>, <xen-devel@lists.xenproject.org>
CC: Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>, Anthony PERARD
	<anthony.perard@citrix.com>, Juergen Gross <jgross@suse.com>
References: <20210701103048.971-1-olaf@aepfle.de>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <b6b4937d-dc71-bbdd-e00a-8777af9892d5@citrix.com>
Date: Thu, 1 Jul 2021 11:37:10 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <20210701103048.971-1-olaf@aepfle.de>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-GB
X-ClientProxiedBy: LO2P265CA0223.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:b::19) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2697696b-9d7f-4cd5-2189-08d93c7c32ab
X-MS-TrafficTypeDiagnostic: SJ0PR03MB5648:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SJ0PR03MB5648FBACDB8DAB2FD882BF64BA009@SJ0PR03MB5648.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:400;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: geMAGgO56xMb+rDh4PbuWwH2VD5//WBGT09ARHFKGmjnlNwEILt56KdY1Zwa2XY+XDL2dWg3/LTPta8wSPLPfI0B7inkn9giNwkQVgG7jH7z9U38yJX5lKYQAimpgr+f7uEb3C9tzTtNjNL1EXXf89DOefERFHfz5kP9kw0iiVO0DwK1RgU47IvfHwNc+itwP0QrDIkNnbs+J5PTUn60lbJNTfNlCY4JutRiSZLTwtagpcAu6ZzFww0w4j50HN+0Qy0vSWRyYUokaZLgO34ZhzVol+gzy9O41/bOL3RtUSmu7obRyy4C2gQQthBJT1NGRpM7vYRbhnT1u1aVTbL1760M6vmXAPhATnngI6upZQ0q1xxH9b7fDETWgr5Ya6rj/lRPshnD7zMDrICUwdicgAbTODJSOLuf6GTIl0/X7uabGZ7p6GxArUwOVBfPjFAuVmRTSw9L/OHFaexgIhsoPJnMquNcrxPgO8RIijIfvdgBPX8WPkYJJiq0dtPwFgq5plpejdQcXMdHBoirJJ1rcXx4P8DUrMFMTbGClNZFqQ6c+lVANWHrSqk94rN6QmgN0JgbNYkxbo1RfIDB5xmEZg5gqWaN5DLwYQxISTnKuez4WmYkDD55Y/jmBjWvvo0xqwInrbxunHYmxOY1eWHIqrf2JGXWp8j3gQIvFDB8LiPJIW5wnS24jb8JTF0Ygss2i4vBFitTkXiIX5sIPBnSmeBQr+faR0q+LUwxcT0mzOPzBIzui642RGhO/ykr9GOMFPSCVLFOBUHTZC3BEjuzkw==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(396003)(376002)(366004)(39850400004)(346002)(5660300002)(86362001)(186003)(31686004)(16526019)(53546011)(31696002)(2906002)(8936002)(558084003)(6486002)(8676002)(478600001)(38100700002)(66946007)(2616005)(66476007)(66556008)(956004)(16576012)(26005)(36756003)(4326008)(6666004)(316002)(54906003)(101420200003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Q2hXVU0xRjZveVJERUpqeDUySnVnbmZJMDQ2czJ2WjdLVFZid1Y5WUhDUnk2?=
 =?utf-8?B?QVlPc1VTZi8ya3AxZ1YwdlBDM1pHaWJOM1A3MDVsSkg2eWEvUExWa2E2UVpY?=
 =?utf-8?B?UG5rMXIzQU1KTHF0N1cwNExkSWNqUU56TmhMK1gvMTZNNnJWN05kaUlxcXYv?=
 =?utf-8?B?SHpJZ05PN21XRSsxS1BHQ1BSMFIwcUFHekxJZDZja0ZOZUI0ZVcrSXZuOG9B?=
 =?utf-8?B?N3FTK0FJYys0YUxoQndzcFlGUVJMWFJxSzIvdDRDNllraFlEL2hOVU1PdEZH?=
 =?utf-8?B?RmI3OHRSQ2s4M3d3a3UyR2tFaFBkNGd6Tk5qVHc0cWF0WlBlM1ZYci9iRkky?=
 =?utf-8?B?TTEvNXdTdzE2OVgzMHVSYUtHZElCMUlCL3NIbi9zNzNlcnRZV2ZYVDJXbmts?=
 =?utf-8?B?MG0wQnY2dXBtUlBFVmpRK05ZclU1SFd2UHdjSWZ2SUMzRTdaSDU1NEVIaEUx?=
 =?utf-8?B?ME9VRWhNdU1JZnh4VTB2QSt5bVhzTzZLMzl3R2MwRFpzN1A1QnlXMTFkUWZB?=
 =?utf-8?B?U2tZSi9DQS92bTJZQmc2d3ZpcWlySXJIQWlmQ0IvekFxdEJKQW5Gdk9XNnda?=
 =?utf-8?B?enlwV2p1MGhVRFRwbTNkM2ZGeDg3NVVlZ0o2T0FSM1dJWFp1S3ZGcHFmQ2oy?=
 =?utf-8?B?K0ZycVlXano3NGlsaXE4dXdRN0E3ZmtXZWp2NTN1eEtQaWFZUUdIUzhxUTVj?=
 =?utf-8?B?Yk1hdm9XY1YvNmlVV05zMkRQdEpnZ1oxd3R4TWQ5WXFkVDhtakYzckh3WUtG?=
 =?utf-8?B?VFEzaHNZU0xpQjVtTUVHMTJHMzFiS2xkMHFWZ1E4SURmdkFFRDFNRytmNENw?=
 =?utf-8?B?Y0kxRXNDS3FxeEJ1UlRuc1lBbGNzSGhnZHUxZW1YWDIvWjhpYUFEMytZSEFh?=
 =?utf-8?B?eXNDRUZIWjM4bnYxdStybGFwNGoyOUxpYWZrYlBhTXhsdEwraHl2THVCK095?=
 =?utf-8?B?NDVsOXBmallnYjdMZzRFVklnK2FDTm1ZU1BFK1daWkxBbmpEcmJLREFLN1ds?=
 =?utf-8?B?c1Q0NllyZHVRcjhqdzA1REJhSjFlWFVSSlFuNVllUFE2MHVUdXEyS3dSZWpK?=
 =?utf-8?B?UVE0Q3NYTFJaWkVSemlMR1M4ZHMySFovVkZVYUF3OXNFeGpJTGhLVzFLOEhH?=
 =?utf-8?B?S3M5MjArVERPTEVwaWg5RHN4ejRDUUdndEQ4ZTdEKzhyclVmN1ZnelJZeGw3?=
 =?utf-8?B?RnRrdjJaNTRXbHYvVEl2MW91K0IydEcvQ2ozekRXd3ZVVVV1N1hlVWxPYXM1?=
 =?utf-8?B?WlpRMUpWTEsrS3BFNnJoRldvRkl1dEFlSmJlZloyT1FWWjY4alFJTTNXcFUy?=
 =?utf-8?B?bnowbU1obWhqMGVsbStSQStCdU84QW5ITjdJUnpoS0JxZ3hVaExjMzhLQXRk?=
 =?utf-8?B?YVU4ZUdHekQ0dkt2U01IMGovZDNnUktJVWVKd0QvZGJOYjJmVUtLMG03Y0xT?=
 =?utf-8?B?Rks4RDEyZmJLblhPUHg5aFVXdkVtU2hBSW1lMFBqN3lmUTNRTG1VaC9mRG53?=
 =?utf-8?B?VmhCQmxJUjRWWkl5TlEzeEMwakNRZVoyZjMwZmR4UUFvbStoVmJTV1Nudm5R?=
 =?utf-8?B?NllDbXFOZEtLOUgwQ0lzUFdIM2UrZFRvS3BIZWNlblJMc1g2OE11R1VOVFEz?=
 =?utf-8?B?MnVEdjV0V01SS2toMTdpMEVDTlBJYVZaQVV2TFJ0SklWZ21WTmk5ck5RVmtK?=
 =?utf-8?B?NWFpRVZmUXl2NVAralJpaGQwQjhhd2NMcnlHY044aGhCS1FjVzFOZzV6YlBq?=
 =?utf-8?Q?Z/yEli98FUlj5rmciuAODS3Byn7A/okgYisGkgI?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 2697696b-9d7f-4cd5-2189-08d93c7c32ab
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jul 2021 10:37:17.5192
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vktocXS2LQAYFPcIbcmV/1YvpmYkRO0tJ/P+9X/OOaC8ysVc86WDOg0m5BiQZQxhYdYixXHEwRr0lV6OJOYhhXpnsIkSl0KTNAf1KzRW+Ws=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB5648
X-OriginatorOrg: citrix.com

On 01/07/2021 11:30, Olaf Hering wrote:
> Replace emualted with emulated.
>
> Signed-off-by: Olaf Hering <olaf@aepfle.de>

Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>

