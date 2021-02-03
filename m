Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 38B1D30E31A
	for <lists+xen-devel@lfdr.de>; Wed,  3 Feb 2021 20:11:52 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.81042.148993 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l7NYW-0003Co-Db; Wed, 03 Feb 2021 19:11:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 81042.148993; Wed, 03 Feb 2021 19:11:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l7NYW-0003CO-9w; Wed, 03 Feb 2021 19:11:12 +0000
Received: by outflank-mailman (input) for mailman id 81042;
 Wed, 03 Feb 2021 19:11:11 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=c0lb=HF=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1l7NYU-0003C0-UC
 for xen-devel@lists.xenproject.org; Wed, 03 Feb 2021 19:11:10 +0000
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id dd1dc9f7-dfbf-404a-81e1-03c4088b6821;
 Wed, 03 Feb 2021 19:11:08 +0000 (UTC)
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
X-Inumbo-ID: dd1dc9f7-dfbf-404a-81e1-03c4088b6821
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1612379468;
  h=subject:to:cc:references:from:message-id:date:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=L+dtwTpfiUA9Jrs29DLC3iQ37Wh7rLi2dpTVGGU2vOM=;
  b=L/SKWULRFvG40rnE79zxkQpocYHNxs6FoKVMS7p8pFAqRf9/4ezeaU8r
   bv/5uAeOxuFByMldE0JmkHzdsaG82qyj4o9514UPaY0hiC01j9QyhcN+r
   xEbp1p35VYO8Hq8MfNue6ftjNPZMNWmzISl9WxJ3wDynSMc/k0gypPT0t
   E=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: RIK8rXJgwVN8lN1f6khucoH41vSVUvaSTdYfvlOHApGOFaVT5a2k7X6dpEoROEqBIerMXmubE1
 abPbzsoiYZfRw3pueKW2XWdH6fymF/uzmke3Lvw/4THXifjdp9Pha5RSo3V5RIvd7ba9UoTksA
 XKin55ALPTrGF9/14th6/D1pb5YsvWVmn9sK3sP/8HmewFNv5l4vUQyhru0yTgXOHJBl498uGr
 He+aNMCWtcdAvOitBT4xVdXln2vlM6KXeEV7dsLzB4E0VvOGaP2kcMp8HvP7826lElc1M4Ma/K
 5h8=
X-SBRS: 5.2
X-MesageID: 36491746
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.79,399,1602561600"; 
   d="scan'208";a="36491746"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QfFtU9hZEOMeHWXjmv1kPGgIfa2l0aGdVfBAuXHGEAlG4yedtqfMCN3lLM/rCPkl19axoc3rbTtAw0pptGDyRQdiYQKNqJCHjzJECTc0WowI8nVS+CUPbhGU4+doYnJ5XiH53FglmnWR+E2RyPeyNFABl4Bkl1VMMRTub3rB0k5pT+vKpDI69iyea1fBUbneciOvrhFOoO2gm2G72uQ1OTvICbVrwFFgdfrgb791My9PUs+ZmW4uRhOZxik1lb2p9q45eJ+nbHqDYV28uORJ6X2JtHgmYzMSGppVxKRiRcB9xC6f2u2GN3j0NZmNXWQJEPgzr4pVFXd92HyBfeV2OA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=L+dtwTpfiUA9Jrs29DLC3iQ37Wh7rLi2dpTVGGU2vOM=;
 b=U6s0Wvj+rLpBX7FHNawJdMuy8S/325SI4ONG8vIyhTxpahJBs9jZWCgdvwwdhM8RB/te5gVWXuK8x19ELYZWQNDjSJuj/Aabf0Fy7XCQXz3tWO1CngKBebqzYFOSoJet26Mlq2aGoHqntvrgm+WPi4fEayZYPKBvrbnf/g3HTGoC9bYx9o9xpYRiHILw2zdrB22NcMpu0L9LaEc8XuxmF/ZrVD+zJiN0ZLv393ATRpzobmuN940hou7wew6GYKOhvYslP+BSj3IK8CpppHkWaszSzPh6G7kQfPPROLe6KFbpK1tALSrb619jNqyIGNbETP20NsV5sAPYLPTjviz75w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=L+dtwTpfiUA9Jrs29DLC3iQ37Wh7rLi2dpTVGGU2vOM=;
 b=r9O11xVBrtpMRTZq6HZpViPKCZGevnPj5O8XDXEfuu3LKEoF/yfY4bVfsjHewT2u948U4zwL/r8KzpCCKIQODDxC8tDdVbyQ+43xsNlJ3zQxst622H//Pst5eEEl9F9gJUVpxvgwZlx/oUb5Ir2TCBjVlZTWh3qhrHoE4ccd9Wo=
Subject: Re: [PATCH for-4.15] x86/efi: enable MS ABI attribute on clang
To: Roger Pau Monne <roger.pau@citrix.com>, <xen-devel@lists.xenproject.org>
CC: Jan Beulich <jbeulich@suse.com>, Wei Liu <wl@xen.org>, Ian Jackson
	<iwj@xenproject.org>
References: <20210203175805.86465-1-roger.pau@citrix.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <234bbdc1-d8a0-b1a9-63e4-83cbd46d0220@citrix.com>
Date: Wed, 3 Feb 2021 19:10:49 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
In-Reply-To: <20210203175805.86465-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
X-ClientProxiedBy: LO2P265CA0026.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:61::14) To BYAPR03MB4728.namprd03.prod.outlook.com
 (2603:10b6:a03:13a::24)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 81326eba-d69f-48d0-30a8-08d8c8776e5f
X-MS-TrafficTypeDiagnostic: BYAPR03MB3415:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BYAPR03MB341594A7689C76E81201644DBAB49@BYAPR03MB3415.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: qTqfvTNlQ/yeB425h+Z9M6tBsXJMUQUs3cTEi2tZlyV4DDwuLzKDIIW5Ydz90GXMdT6CvxtJPvV8XzRtVne/88Cd002Q6VIfd4pcFu38HDn2vJlytVU/MJN0gHSgaJzKydZ+bnQAhZmU2c2P93Wd6+JC7Pn8cY/Hsf2E/wg87dxytotvWmCcKg2Va2j+elqw1OLqXAilWi043YJ2VRqSLbxc3YOlX713xtiaPtjIoyL5HQ/1IUQ4Ovjz/eqfjkgfshdPCL6A6D+QuJw1vIAftNQ10Nd4lN1elMhHekm/tg5XEL5ucBYplPsWmIki4DrYDvKlgmn1MoZBw4j5hh1WroG/h1iWxRkkel04Zh+ENWkNm7fgeKf9k2LWqcjHRxor230hhUYQVvYLrDReu3XIu8XYwEBmmK1untAgXL2GdtRN8vBRrsJp5D7/3nyVkI3uMjoXhjHonNh+mpwndtQLtKQwhmwYNp7tJBtDnAs0uvNdXSEQoGTPGwNYjHJd4YyZ/OAj/ssUqlfF07XO3iyhsqKiJzF0pBAnRBZA5zSCefdIbtydZnapx+NlTrLyDRv7PM+g6xpMSI8kSP20uAfwisUFSxc8nDcZJI7hDHZIeuo=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB4728.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(366004)(396003)(39860400002)(346002)(376002)(316002)(6666004)(54906003)(2616005)(956004)(4326008)(36756003)(16576012)(8936002)(16526019)(8676002)(2906002)(66476007)(186003)(53546011)(478600001)(31696002)(4744005)(66556008)(66946007)(26005)(6486002)(83380400001)(31686004)(86362001)(5660300002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?WWg0RUJYeW8wcG9HNEJDNkNNaGR4eEQrR1c1UnBUUE1JSnByMCtQd2lVNy9o?=
 =?utf-8?B?SDdYVVY1YzJncUUwSWtXdHh0OXlSL3hjYUQ4OUJYazY5TUdKR3ZZMnJEc1pE?=
 =?utf-8?B?QnYxQTlzM1RZQzFIYUcxMXorM05DRUNRV2dNdkJDcDhmV3hXN2hqajYrdWZ1?=
 =?utf-8?B?VGg3RWhzYXFpYnNGdkszRnRwTzFaOWRJYVkzczVoNW4zL3dkQTZPZ2NWM0Rp?=
 =?utf-8?B?dDNKY0R6S0s4MEE1K3pOaXprci9vZTZkT3V3RWZiKzNtYlE2MGhMY3NTaCt6?=
 =?utf-8?B?OGdLMDBTanozVDRoSzRrTkRtZFc5dlp2bkMwREgzU3NZbzlFRGdzc2hNRDNh?=
 =?utf-8?B?R2JLSTdwV1NManJVTDlOMC9SQmtMdEVYWUpqYnRiUlF2UDFzc1BqTmRUbGEy?=
 =?utf-8?B?ZitjSkFLUU0vcEUwZXluYmkzMWVoYlZES3Jlbko5alFIZmVSOTA1OEFDTldu?=
 =?utf-8?B?YjMycWlPVFU4WTlPOWRkUGxJaEd5UFhDWUdkRjhVMEFGc0hRbFJLbUNnSXhH?=
 =?utf-8?B?THNmTWx2OWxDVWhoSlgzNFVrZEdtd2YvU0lNbzhMTzlWbEVnY2phMVBaclox?=
 =?utf-8?B?WFp1SXl5TGJneFkreTRSMDBtZGhucllta0h2UmpoSFpydzRsVFZ3YmtGL0ti?=
 =?utf-8?B?UzVMSWpDbElXb0xCNVhHUno3MjkyNk8wNjd6K2ZsQy83cG1ycnppUFJyU0ZD?=
 =?utf-8?B?VEd2cDJ2bGlkc2R3c3NKTm9ocjAvOHZrNjNuTE5abnZtWkl2ZGZxYURMeGEv?=
 =?utf-8?B?alk4Ynp4K2Qrb0xEYmovVnhmckZwbTVaUXBYM1JHS3U4M2doQjArM1VhaDF3?=
 =?utf-8?B?RlZSc2tsV2VhV1kvRElxbXoydDlEUmxWd3hFV0tyTE42bFVXMDN3bW1DdW50?=
 =?utf-8?B?aEpYTWdIK1dqWXowR1V6K3lPeVo4ZTVSSnBxdWhvUFErTmowN0xBeE5VM3Ix?=
 =?utf-8?B?RDI1M2E2OVJCdDZCL2l3djhNbCt3S0R6WHhaMndoWnQ0WjlJYjlENHh4S1Ry?=
 =?utf-8?B?WFZpak1tNmlGT2lpUDkwK01ER2NsZlAxWm5rN1JadVI2VzJKeG4zTXlYUkpX?=
 =?utf-8?B?WDRiRjU0TXVyaXh5K3VlalI0WGNLdFpqUUZsMG5IeEZWa2ZuYTRBcGJqZ3hQ?=
 =?utf-8?B?YkJlTnJxN3BrOUJrcFd1UWloRHFEVnRrWnByR2ZIVy9TRGRCeHU3OGpEdDdN?=
 =?utf-8?B?REtnWURJVVI5THBuOWxhV0w2TWVRMmxxM1ZmUnNhQnZBeFlja1cyZlVRcVBU?=
 =?utf-8?B?NS8yZFhMalFzb1M5WW44R0t6ZG5Mb0o4K3lMaGhWdGJMS0dvT1l1Qzl1VCs0?=
 =?utf-8?B?ZUtDZE1oSzFkbUk2WlUzb3ZvTDVkWDFsZU9GTFk1OTQveUd6b09LeGxPdFRX?=
 =?utf-8?B?L08rRFF6akUyUEEybnlpNlJIY2RJSEJ3WHRoaHhlbGUxelRiWW5CY3p3SWhm?=
 =?utf-8?Q?H2YdbGeG?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 81326eba-d69f-48d0-30a8-08d8c8776e5f
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB4728.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Feb 2021 19:10:55.3689
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3dZW0aiyYQPJi8107KT4bbFuoVltmbozJz6AV9BSahQ66SRPhg+tpmwoHmlZf8cfNyyv2e9LpvNv/UCoE4dHLMUDNsvV1nEM/w99d/AEXhQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR03MB3415
X-OriginatorOrg: citrix.com

On 03/02/2021 17:58, Roger Pau Monne wrote:
> Or else the EFI service calls will use the wrong calling convention.
>
> The __ms_abi__ attribute is available on all supported versions of
> clang.
>
> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>

Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>

> ---
> Cc: Ian Jackson <iwj@xenproject.org>
>
> Without this a Xen built with clang won't be able to correctly use the
> EFI services, leading to weird messages from the firmware and crashes.
> The impact of this fix for GCC users is exactly 0, and will fix the
> build on clang.

DYM "fix the compiled binary"?

The build on clang isn't broken atm, but it provably has the wrong ABI.

~Andrew

