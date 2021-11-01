Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A4739441A77
	for <lists+xen-devel@lfdr.de>; Mon,  1 Nov 2021 12:11:54 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.219143.379823 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mhVDF-00068n-QP; Mon, 01 Nov 2021 11:10:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 219143.379823; Mon, 01 Nov 2021 11:10:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mhVDF-00065u-N9; Mon, 01 Nov 2021 11:10:49 +0000
Received: by outflank-mailman (input) for mailman id 219143;
 Mon, 01 Nov 2021 11:10:48 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=37jG=PU=citrix.com=Andrew.Cooper3@srs-us1.protection.inumbo.net>)
 id 1mhVDE-00065o-3O
 for xen-devel@lists.xenproject.org; Mon, 01 Nov 2021 11:10:48 +0000
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 73a9e9df-6c53-4a0e-8bcd-e66fe9a6b346;
 Mon, 01 Nov 2021 11:10:46 +0000 (UTC)
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
X-Inumbo-ID: 73a9e9df-6c53-4a0e-8bcd-e66fe9a6b346
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1635765046;
  h=to:cc:references:from:subject:message-id:date:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=6A2Kejp7E1Z3kIVNaVPwjjztrx4ZwMw7mR7qAsGyyaU=;
  b=UcReTnXbmc+ZWFs7y9xiPGC9Dlwo4lxG4iTK+9Qk+pbC4hV21omlFgiW
   zVHCmL8yqmIg2t/mpEop5gW0YtKMWN63InLqhZ9uWyWCVpj4y+UMfKqxc
   d3fWUwuUy5rTvdpDUEymPzczaeVwYPnGPM9+iloKaY+6yWMVu1FqMGwtL
   Y=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: nQ4ShJkNYWf1JXsB26VfeZH5ry4xG3zrEmgmPSWP0LeWDHyzkQLjJK/Q/ockAuY5yjmx1JgupD
 pCxo1g3fubZ3nGGtnYjxVjsrUIFc1BM4YLd0GuS2s6/l04DNLmsV4uyQP3/6febYlVgQBaq8f9
 XEhOzd/NwU8Jym4YGnZ7tW9t7aYMi8Nr2ArIlufW/GhHYGCpXUSaKTafkbsUjTv/3BPbJXHGx+
 /UMq8DFsFS60nMFYZukLzBLYkUnxilj9Xkae6MwtKUPsANtHWCo87j3o0rAbX2fIGwnB+yjs2L
 X1Y2vR6hD+/IXFPVbuHK6m4D
X-SBRS: 5.1
X-MesageID: 56769430
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:68w8layRa7BTRiFFOep6t+fTwSrEfRIJ4+MujC+fZmUNrF6WrkVUx
 2sXWWjTP6yLNGXxe4olO9izoU0H7J6GmNE2SlNoqyAxQypGp/SeCIXCJC8cHc8zwu4v7q5Dx
 59DAjUVBJlsFhcwnvopW1TYhSEUOZugH9IQM8aZfHAuLeNYYH1500s6wrZg2tcAbeWRWGthh
 /uj+6UzB3f9s9JEGjp8B3Wr8U4HUFza4Vv0j3RmDRx5lAa2e0o9VfrzEZqZPXrgKrS4K8bhL
 wr1IBNVyUuCl/slIovNfr8W6STmSJaKVeSFoiI+t6RPHnGuD8H9u0o2HKN0VKtZt9mGt9F7j
 9YQj8KVcAkKEe7shKclciJ9IxgraMWq+JefSZS+mcmazkmAeHrw2fR+SkoxOOX0+M4uXzsIr
 6ZBbmlQMFbT3Ipaw5riIgVoru0lINPmI8U0vXZ4wCuCJf0nXYrCU+PB4towMDIY254RQ6eCP
 JJxhTxHMRjEehlhGVcuBpcDnbyhvV/RVD5+twfAzUYwyzeKl1EguFT3C/LUZd6iVchThlyfp
 G/N4yL+GB5yHMySz3+J/2yhgsfLnDjnQ8QCGbug7PlojVaPgGsJB3U+d3G2vP24gU6WQM9EJ
 gof/S9GkEQp3BX1FJ+nBUT++SPa+E5HMzZNLwEkwACHjamJ2Vi8P2YnYX1hdJ8elfQTdQV/g
 zdlgOjVLTBotbSUT1eU+bGVsS6+NEApEIMSWcMXZVBbuoe++enfmjqKF48+S/Dt0rUZDBmpm
 2jSxBXSkYn/miLiO0+T2VncywyhqZHSJuLezlWGBzn1hu+ViWPMWmBJ1bQ5xasYRGp6ZgPY1
 JThpyR5xLtWZaxhbATXHI0w8EiBvp5pygH0j191BIUG/D+w4XOldo04yGggfxo2aptZI2+4P
 B67VeZtCHl7ZiHCgUhfONrZNijX5fK4SYSNug78N4ImjmdNmP+vo3g1OB/4M5HFm0kwi6AvU
 ap3gu73ZUv2/Z9PlWLsL89EiOdD7nlnmQv7GMCqpzz6gOH2TCPEFt843K6mM7lRAFWs+16Or
 b6y9qKiln1ibQEJSnCMrNNIcgxSdRDWx/ne8qRqSwJKGSI/cEkJAP7N27IxPYtjmqVejODT+
 X+hHERfzTLCabfvcG1ms1hvN+HiW4hRt3U+MXB+NFqkwSF7M42u8L0eZ908erx+rL5vyvt9T
 v8kfcScA6sQFmSbqmpFNZSt/pZ/cBmLhB6VO3b3ajYIYJM9FRfC/cXpf1Wz+XBWXDa3r8Y3v
 5apyhjfHcgYXw1nAcuPMKCvwlq9sGIzguV3W0eUcNBfdF+1qNphKjDrj+9xKMYJcE2Ryjyf3
 geQIBEZueiS/NNlrIiX3fiJ9t77HfF/E0xWG3jgwYy3bSSKrHC+xYJgUfqTeWyPXm3D56j/N
 /5eyOvxMaNbkQ8S4ZZ8Cbti0Yk3+8Dr++1B1g1hEXjGMwarB7dnLiXU1MVDrPQQlLpQuA/wU
 UOT4NhKf76OPZq9QlIWIQMkaMWF1O0VxWaOvahkfh2i6X8l5qeDXGVTIwKI2X5UI7ZCOY84x
 fss5ZwN4Aulhxt2atuLg0i4LYhXwqDsh0n/iqwnPQ==
IronPort-HdrOrdr: A9a23:z2AxbK3gegMXmEffgI55uwqjBLwkLtp133Aq2lEZdPU1SKClfq
 WV98jzuiWatN98Yh8dcLK7WJVoMEm8yXcd2+B4V9qftWLdyQiVxe9ZnO7f6gylNyri9vNMkY
 dMGpIObOEY1GIK7/rH3A==
X-IronPort-AV: E=Sophos;i="5.87,199,1631592000"; 
   d="scan'208";a="56769430"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fx4mDTp+ldWq9LB42XQqRImzmBkbwyrAjyWZAAUA275f+ISKzDW1qUGuwhfMlegGQojuPglgaBvdMG0XKHS4Wxkb+3mDv828NFQgstgvRK7bdOAc+lGnU+6ucTjRzKdt9TrZKn+Hv4wVeeMWnsMkgejde8GugLLJCJ99qL+OypwCK3LxiDUwzd4pWFOC9Fq/Yex9hE0HsGkYEy62nbcEEDWm3Sgg6VPewKkJv+pWNZSd834tBbJTXYsW9EE9/qq4nrW9KbTSX5ZsDhHdC71b1dbgccq+L684YQn+J+3VaQvHObkwvHShEUQRywa5xw77Ak/UDANL++Kianor1k7w6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=L9YUjeiSixQ1cD1QcNB4+h2kZ4Rz0DzTeL3ImiJc608=;
 b=OVVicLFLksS8sCYMWX3y7OxLSDgTOnaBPnDitVsUlXRMGeVOGE4zTz0bhjEqtNC3ZydSAqEoE1DhylRm/fX7u6kzy9DEYsEAUvnJ8OCagE2c6tEl/tHvJL3+nT7o/LTR3tNGi0N+fdMOAfplfiruWSg7sBVd2+Y6P6ZzOuTAHukRP05n0UcQoGKn1L+4+BWVcTOT3ei/h4ecZd3p5RdcYXCN+lc40OJdPaQdp9wNqt3SHkXIMc1BxgebKmUJfkHYq2ia19qOcYeNQ+9+eXIvtQBgAAMt5xvTxVgW5gLkNjft4Z9vhpnPilCkwNlsGbx0st68ZFbUzrvHy0Qv1eUR0g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=L9YUjeiSixQ1cD1QcNB4+h2kZ4Rz0DzTeL3ImiJc608=;
 b=ko3J/hspWCupD25KaSP/His4FxIqqnYaIc0GEbNQEp28viQjOyDyEcoUcayOGFR3v8m9U6s6wmxTbVBCXu9iU0h71D0wEzsL/YPX6z57PKqSSVGS83UbgFl50sOE0oHeZcxZyiBItT4RTLHhaQqZT1kBOk131bcq6Us3gBurzLA=
To: Ian Jackson <iwj@xenproject.org>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Jan Beulich
	<JBeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <20211028232658.20637-1-andrew.cooper3@citrix.com>
 <24959.50965.967784.441954@mariner.uk.xensource.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH] x86/kexec: Fix crash on transition to a 32bit kernel on
 AMD hardware
Message-ID: <0ab2bad5-ad32-06e1-755c-c4fe5cb2bdd3@citrix.com>
Date: Mon, 1 Nov 2021 11:10:35 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <24959.50965.967784.441954@mariner.uk.xensource.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Content-Language: en-GB
X-ClientProxiedBy: LO4P123CA0263.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:194::16) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c413d8be-547e-4c45-d1af-08d99d283d9d
X-MS-TrafficTypeDiagnostic: SJ0PR03MB5773:
X-Microsoft-Antispam-PRVS: <SJ0PR03MB577322135D707DFD72CA7543BA8A9@SJ0PR03MB5773.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 412ZxLDDAY0c4AXmgql8kCtFOg3dkahHp+nt1F4hURSHmWrIGDnrPm34VxU1Z/1+5yS63zoO/MCNT1WRQJVVWDB6Py+fo3bY5o1R+7PFtEV8sRrCwTvLc7GXfdCle27bRwCldxnX3hN5WXKvld7Mk2c3seOo9uY0gnudp1HQNQo3AM1HpmooRHEsY4o5iEPMPPhra9n3i7VPtEy6a1GI6xHKDjEPJNUCsHnaNLzvlkgc4B+iPt/suGQMUnwvzL2MDCQNpJHdNVohuJlTm9rbmC4p845Nl66cGAoj3+i5hiAfh3nUs4pfv40jAjQX31iMgP5ShsJUWXwsPDvVriEXx+eoNMUfu9LJ95NVEqjE+gBhiwCnoJyPvZd1xuL7LOrObDxnR8CNyjdru7wsZjHKspGmVttuROVz5q0CynuNXqdEF+yJIxInICOu4lteNMvjQTqepC/sc7L/v9orWPUMh+qfKw/PJ9RZmUXpJKUeZHxYojHDFrzvRzn3HTuKQhuslG3y1nLgTqpJeriEsim2qzHxnv+ciAIKaoljgQvZ3fJyd1l8jhBl02SZWgrsE1tJM6Oo9et1ZR1ajxNWniaKTVqCQqEkMiRgyNYsrGtvg3RW0NAAmuzCdB/CVmFQ1XYq2K+f3VRmZ+eQsrpr/L+onZ/xqNscMowrqOmKS8tSj9EJT4xiTNB9gHae7rMmlpMpX0SvCLaBtIvBD5yLnNm29bDnNQ5goxarmDQjoVzbTjfItfIDe9ILLt9uswwWy5O8
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(31696002)(8676002)(26005)(16576012)(508600001)(6486002)(8936002)(54906003)(316002)(31686004)(86362001)(36756003)(53546011)(66946007)(107886003)(2906002)(6666004)(6916009)(5660300002)(66556008)(66476007)(2616005)(956004)(82960400001)(83380400001)(4326008)(38100700002)(186003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NVZreVBST3U3eE5HUnU1YUR3UXpPeGhWN0IvNlhveGZTYkNTTTNJZWdLU29p?=
 =?utf-8?B?OGhKQktMWW9jYk5uSzhJWGFWWDUzTkdaU0Y3MUdYNThqaTVqaGhiY1liRzJQ?=
 =?utf-8?B?aDZMRTFVcHhkQU10dWl6cndxZ2JoVVVncGdzbzNwekF1N2tGci90MnBxN0Vp?=
 =?utf-8?B?MWpFNW02UTc5Y3NHSFdCUUdVZGJVdWh0ZmRjcEE4b0pCdDR0elRTSkg3NEFr?=
 =?utf-8?B?ZWtlcDFteUNmcVdGcnM0Y2FqMDlaU1dZaWg3bGZqZ3B4ZCthb3pMemplTEl6?=
 =?utf-8?B?cTJlMVpDL0ZVK3I5dnZ6S09VK1BUTHZMK0dFQWVQV1VKVEVvNDNRNSt2YXVi?=
 =?utf-8?B?YnRla0gwQnV4dDVqYTNLOTJFMUxUY3I0a3RDalNYV0ZWTGRmQmFXM3V4QTVP?=
 =?utf-8?B?K3N1SzdLWXJQYVRRMmdLTVFLVWpxMExBSEdlaHgrTzZscTlNQnQ3ZFFHelFX?=
 =?utf-8?B?aExOYisxVmswNHgzYW1PcFJva29aVHhScXNlb0JMS0toS2tVcVZVeTNEc3N4?=
 =?utf-8?B?Y3N4L29KUnNhUFNJTkZ5M05ja0cwYzFaeG12WTRPOE5ubnNoRXBlTTErQ2hH?=
 =?utf-8?B?NGJ2QTlJUHpLQVBoTVJkQnVvY0pidVo0OVBVVGZMc3d2Rk9NMDBjYzk3S2Rn?=
 =?utf-8?B?UEI2MWVMNDBvMDRmOVZkUzkzdmxCbUh0M1hWNkJZTG1mdm5OcTNPNmhicEdp?=
 =?utf-8?B?YmZ2cWVYVDNQV2dWRlgxQ2JXUVV2aUEzdGpmR3J6TnNwZ0hxZjdKNG9YRTZr?=
 =?utf-8?B?Tld6N0NmZUFiMkJjSzhqRUY0RnNKZTJicDNzK0Y4ZkZOTmpKSEJsR2UxSjB5?=
 =?utf-8?B?N2tQdmVvSDhIdklxQ0Rid0RJOFhoeldoK3cwaTdpY28xQ2I2eHBzUmM2T09o?=
 =?utf-8?B?MUhvLzNYc09TZC9EcFVlbEdSTnl2eVlxTm55Zm5NY1dSUkhCUUlpNXoveDNG?=
 =?utf-8?B?bW9wNXNCLzFqVjBIeWZFSEFBaE1ZRUZjL3IrbnNoazVZNCsybHZUMFUvZWpq?=
 =?utf-8?B?RWtMaGxPRzJTa0I1T2JHanBNN2VDYjUxNTY0b1l6ZnFoTVhDS2Q4bkxkRUt3?=
 =?utf-8?B?VDdvQ3p4eUF6THZSR3FSTVgybXloT09yUUIyNTFQYWNNRkkya1QrMXY3S1N4?=
 =?utf-8?B?UjlFd1AvR3Q5RXZMZVpEcm9GbEhLS2xpUDhiTmVwb3F2SzVxQ1RpbWtrUFRO?=
 =?utf-8?B?TnFVMUJLTExkbENzeHIzVTdVc1JHU1hobFh6aHdPbHZsMGZ4bEtRMFdtQm5l?=
 =?utf-8?B?bFhaemxuTXRqRkZON0RPUkhzZkFCSk12cFBqVmE1ZFpoZTExNjZsQ1ZIOGdm?=
 =?utf-8?B?czlqNmJmR3NTUGpqTm9BVUtsdE9LdXRTNmVUN2xwT2ZNcnE1MUtydTZiY1RE?=
 =?utf-8?B?dkNZUElLZVgzQUpqSVZxV2FJR2xxR1d0WmFMeHJXaXd2cnFaR1lIOGhWRXJv?=
 =?utf-8?B?Qk14R2ZXUW52R1R0WHJiQmp2YVpVZCsyS0ZHR2VrYW5tY2poN2YyakhaRk5V?=
 =?utf-8?B?UEtrUFNaeXloMjc2SjZ1aWJyNXE1UUVSM3UxYzQ4VzBPQnB4TTEwN3Q4RUNX?=
 =?utf-8?B?UUl5TndRb0ljNnBoQ25BK3dVTXUvQ2piMTZUOW1EallZQUlReGQ3MUEvUW8r?=
 =?utf-8?B?RlhCQzgwL2Zxb1RUd3hldTZ2MVdFelpUekhCSFArNjM4NnVXSFIrVHBIVTBY?=
 =?utf-8?B?YWtqS0xyWW9vV2taL1NoK3ZvWmRrUEJPUVoxdWp5MzU1NDFrQkpabzZVMFFN?=
 =?utf-8?B?TitPcFZrK3E3Q2Vhd296L2lINStYdjRSS0hnbHU1eEt0YjNNNGhwTE5RQUgx?=
 =?utf-8?B?Q25STytPSnVmcFJQODBZNU92NGhHd0p1eEFKOUhiQ3BjK0NOdTk4MUR5MkY1?=
 =?utf-8?B?S25yOVB4WjRpQjU5U0NvalNTTmRYRFZVb0NoK3pMUnVQeENLTjJTemdqTEg0?=
 =?utf-8?B?UjdqcW5sdUJQR2FXZnBIaWIybTBUYnBmZ2Y1bDRwbmh3NUNEVHhUZjBIbDln?=
 =?utf-8?B?NUFNd2FyRTZ4blpFaHlsVnc4bTAzRk9acWoxYU4yem5paGdpdkE2RXlaaUZo?=
 =?utf-8?B?YnFLR2luSk4zcUY1ZktvZXFUVHBoSDBGUG96dzVPQmVGZ3Y2aytOQjZ4T3lu?=
 =?utf-8?B?SXlaeUZoOGs4LzluQ2J5SDhmWWtqV1NyZWVmWnVzR2J2eEg3THRNOEhBS2k2?=
 =?utf-8?B?L0RkV2k0QTl1blpnUVRSOVpZdU03OVVvOFFyUVFPd3AwM1lvS3FPamFQMmhJ?=
 =?utf-8?B?TEprVHI3RzdlcGpXaW53dk56ajJBPT0=?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c413d8be-547e-4c45-d1af-08d99d283d9d
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Nov 2021 11:10:41.0240
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bYDdV+dF2kafazAHiz2g5lUnwjpwKxPeBI8dUBN+UF7CsjAnMYR22ZgffhZBehBzXs3M04TxVo3wx6WOL7SkqcuR9bKLOHCOHIfVzMuahjQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB5773
X-OriginatorOrg: citrix.com

On 01/11/2021 10:53, Ian Jackson wrote:
> Andrew Cooper writes ("[PATCH] x86/kexec: Fix crash on transition to a 32=
bit kernel on AMD hardware"):
>> The `ljmp *mem` instruction is (famously?) not binary compatible between=
 Intel
>> and AMD CPUS.  The AMD-compatible version would require .long to be .qua=
d in
>> the second hunk.
>>
>> Switch to using lretq, which is compatible between Intel and AMD, as wel=
l as
>> being less logic overall.
>>
>> Fixes: 5a82d5cf352d ("kexec: extend hypercall with improved load/unload =
ops")
>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
>> ---
>> CC: Jan Beulich <JBeulich@suse.com>
>> CC: Roger Pau Monn=C3=A9 <roger.pau@citrix.com>
>> CC: Wei Liu <wl@xen.org>
>> CC: Ian Jackson <iwj@xenproject.org>
>>
>> For 4.16.  This is a bugfix for rare (so rare it has probably never been
>> exercised) but plain-broken usecase.
>>
>> One argument against taking it says that this has been broken for 8 year=
s
>> already, so what's a few extra weeks.  Another is that this patch is onl=
y
>> compile tested because I don't have a suitable setup to repro, nor the t=
ime to
>> try organising one.
> Thanks for being frank about testing.
>
> The bug is a ?race? ?  Which hardly ever happens ?  Or it only affects
> some strange configurations ?  Or ... ?

Strange configuration.

On AMD hardware, if you try to use a 32bit crash kernel, then Xen will
unconditionally crash when trying to transition to it.

Any other scenario (Intel hardware, or a 64bit crash kernel) will work
fine and without incident.

>> On the other hand, I specifically used the point of binary incompatibili=
ty to
>> persuade Intel to drop Call Gates out of the architecture in the forthco=
ming
>> FRED spec.
> I'm afraid I can't make head or tail of this.  What are the
> implications ?

I managed to get some CPU architects to agree that there was a binary
incompatibility here.

>> The lretq pattern used here matches x86_32_switch() in
>> xen/arch/x86/boot/head.S, and this codepath is executed on every MB2+EFI
>> xen.gz boot, which from XenServer alone is a very wide set of testing.
> AIUI this is an argument saying that the basic principle of this
> change is good.  Good.
>
> However: is there some risk of a non-catastrophic breakage here, for
> example, if there was a slip in the actual implementation ?
> (Catastrophic breakage would break all our tests, I think.)

This path is only taken for a 32bit crash kernel.=C2=A0 It is not taken for
64bit crash kernels, or they wouldn't work on AMD either, and this is
something we test routinely in XenServer.

The worst that can happen is that I've messed the lretq pattern up, and
broken transition to all 32bit crash kernels, irrespective of hardware
vendor.

It will either function correctly, or explode.=C2=A0 If it is broken, it
won't be subtle, or dependent on the phase of the moon/etc.

~Andrew


