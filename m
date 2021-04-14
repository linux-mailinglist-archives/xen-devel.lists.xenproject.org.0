Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4988F35F478
	for <lists+xen-devel@lfdr.de>; Wed, 14 Apr 2021 15:05:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.110594.211091 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lWfD2-0000al-JW; Wed, 14 Apr 2021 13:05:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 110594.211091; Wed, 14 Apr 2021 13:05:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lWfD2-0000aM-GD; Wed, 14 Apr 2021 13:05:32 +0000
Received: by outflank-mailman (input) for mailman id 110594;
 Wed, 14 Apr 2021 13:05:31 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=UoOq=JL=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1lWfD1-0000aH-3n
 for xen-devel@lists.xenproject.org; Wed, 14 Apr 2021 13:05:31 +0000
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 819dec4d-1aae-4bb6-8afb-6541c768b4da;
 Wed, 14 Apr 2021 13:05:29 +0000 (UTC)
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
X-Inumbo-ID: 819dec4d-1aae-4bb6-8afb-6541c768b4da
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1618405528;
  h=subject:to:cc:references:from:message-id:date:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=DYipI0/rzdlhhi93aqgC+ctI/xPJdZ/8NS8g+JaO4KQ=;
  b=ZzW+TxEYloSWtY/D9pVnmutP9ahc58UzDVBLVAA/o2bib/BLGrgHF3Is
   +i8yv18o1/1i6quP3MryJsCDaa1d5TnjTNl6PhlOVtejrpPbw6bUZ4mqp
   4aBGEqaoeDBtVH11lQ+eDQkcNsZ6dM5Rpalt3Ro2lpwzOkYtjuQYagsU6
   I=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: l9M6ygpq9RYTA67GUbPSY+pLKZK9JvRiHdhU+CP4fuj77n2Bk01CkOAtSLddy3YfL+enZ1sf0Q
 Ht4tymAFaZuUyHMRB1u5kFzhlZ1rqrp0sV2SuUV8kCOf9gNEQHe/1MtDoIGu2RAN33jEteti3b
 f0LpaU97YN5xJaAPdGC/mDDo0q6P8RuRcabMgrRV2rXOiiVGOAxdIRBsuPGhFF/t7rN3Fqh870
 HY7MMEa1ovpo5VGlEAahvw8beatfuzDn04LSNhti3mnJ4oP3MCQOltFMzM6W7+kz/WlvPL83VT
 e6A=
X-SBRS: 5.2
X-MesageID: 41409838
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:Ns+Cf6gpOfik5fyMLxtAZgmDl3BQX3Vw3DAbvn1ZSRFFG/Gwv/
 uF2NwGyB75jysQUnk8mdaGfJKNW2/Y6IQd2+csFJ+Ydk3DtHGzJI9vqbHjzTrpBjHk+odmup
 tIW5NVTOf9BV0St6rHySGlDtctx8SG+qi0heHYi0xgVx1udrsI1WdEIyywe3cGIzVuL5w/CZ
 aa+45jrz2vZXwYYq2Adwc4dsLEoMDGk4+jXAUPAAQp5BLLoTSj7rP7FBbw5GZgbxpkx7A+/W
 /Z1zHo/6nLiYDG9jbw9U/2q65Xltzo18dZCKW36/Q9Bz3whm+TFf9ccpKYujRdmpDX1H8Ll5
 32rw4kL4BP7RrqDxyIiD/M/yWl7zo08X/lzjaj8AneiOj0XigzBcYEpa8xSGqg12MasNtx0L
 1G0gui3vI9Z36w/1Welqz1fipnmUaurX0pnfR7tQ04baIkZKJMtotaxUtJEf47bVHHwbo6G+
 pjBty03ocyTXqmaRnizw1S6eC3Um92NhmLRVVqgL3u7xFm2Fp9z0ce2fUFmGYB+J8XW/B/lp
 T5G5Utu7dUQsAMa6VhQM8HXMusE2TIBSnBKWSIPD3cZe86EkOIj6SyzKQ+5emsdpBN5JwumK
 7ZWFcdkWIpYUrhBeCHwZUjyGGNfEyNGRDWju1O7ZlwvbPxAJDxNzeYdVwom8y8590CH8zyQZ
 +ISdBrKs6mCVGrNZdC3gX4VZUXA2IZStcpttEyXE/Lit7XK7ftqvfQfJ/oVfnQOAdhflm6Lm
 oIXTD1KskFxFusQGXEjB/YXG6oVVf4+b52DajG78kewIUALeR3w0wooGX8wvvOBSxJs6Qwck
 c7CqjgiLmHqW6/+nuNz2gBAGsbMm9lpJHbF19arw4DNE35NZwZvc+ERGxU1HybYjt2T8bcFh
 9jt016kJjHaaC49GQHMZaKI2iah3wcqDahVJEHgJCO4s/jZ9ceAos5XrdyUSHGDQZ8lwoviG
 orUn5FembvUhfVzYm1hp0dA+/SM/Nmhh2wHMJSoXXD8WOGpc8uQXMfdyW0UdGehDsvQzY8vC
 w1z4YvxJ673Rq/I2o2h+o1dHdWbn6MPb5ABAOZILlPlqvTYwF2R2eSjTm8gxU+E1Carnk6ty
 jEF2m5aPvLCl1StjR93rzx+F15TGmbYnl9c2t3q4F7CGTAtEtiyOPjXNvH70KhLn85hs0NOj
 DMZjUfZjljwN26zza5sjePH3dO/ORiAsXtSJAYN53D0HKkL4OF0ZwcF/hP5ZB/KZTFqekQS9
 +SfAeTMRL1A+4kwBauu34gISV4wUNUyc/A6VnA1iyVzXQ/Cf3dLBBaXLkdOcib9HWhaPCS0p
 l15OhF9deYAyHUUJqhxq7WZTIYdU+Wjm6yUu0yqZdb+Yg1r6B+GpHHUT3OkFFLtS9OWvvcpQ
 c7euBc5ruEB6pEO+o1UAhd9kAylNuOIFAw2zaGSNMWTBUItTvjI9iN47D0srIhDU2KmRvoNT
 Ckglpg1saAexHG6KUTBK0xK1lHcUQQ6Hxt++WZao3bYT/aPt1rzR6fMnWndqVaR7XAMbIMrg
 xi69XgpZ7aSwPInCTRtyB8OKRA7iKORt6zGhuFHapt/8ahMVqBxous78jbtka5dRKLL2AZj5
 ZCb0oec4BqjSQjlpQ+1myKcZPMy3hV2Gd20HVAjV7i2o+v/WfdEwVnCGTi8+RrdAgWFGOJg8
 TD+fWfz1Ln7lF+qML+KHs=
X-IronPort-AV: E=Sophos;i="5.82,222,1613451600"; 
   d="scan'208";a="41409838"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Z0WgOQAvkP/lNP1QaByBwvacIQ44rmTYi2GbVM5p78VIEFdZNdF60fLVnm8BH9tJCk8kMoX0DdgEMAdRaqBYpXAG5iAMwSLa+C3xlR4YTTUffQVPnbGPVaYbKaD7BwRrSKTloU5XDjqhQUCooPlfGpz8uBFffG9W6ym03FOelkp012ec0XEE/WIS5K3D4IT7pRY37RWixa84CQzdemrHswm6yG/a5Z72POeWvuEXBgtGcsK4H1Yss62HdXVDx3XcKZd5CqKPrtIHm7CVJ91SCjyXjoNWoG6QFKpr9nqci7cS3Nux7lkQF2ZzZbfDOApT3yJSJAf8Sd6TTpjIiMTw4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gPZzrhmhXmUS62/S96Vum7xVOSM8+MXrgg2yVqqPLQw=;
 b=gpF26wz1Y5VxwP5sHU7u4M5tLpkAzONE5SPVnJ4PwP3RtOE6KZhFouUwmx3MRt8vgm2bR68N1t1v+WyR153S5d5/zaov4QJr2P4+EA3gR+kZaP4RA5PYM/yFfyrUp3M+HqeSZz53fUB+fA6mbF5ocu1CV1pSsghgqcn8AybcXddTzfdOBLA97ZYgBj4WA6DKSbl6UoEFPaXKaJw4Oxkv+g4ONcxmxiT3SmRoak4s/8ZagxZJ+K70x4Bnsby74bPSyhyw71TKvuFFylRzg8FnoPV7t/6UnIbMVt11nXNgJi/zTzTIjSQhYNS9ZNNN/2MQNBfk3UxkW6NBgest1UeH7w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gPZzrhmhXmUS62/S96Vum7xVOSM8+MXrgg2yVqqPLQw=;
 b=BedvjX/b+ie+4+AcZjgrWr8imq+YH/PNWtxqjq4nJE/Dpp1fNH4IpDV2d7r+jsRxj0mw/8MQHMUO0o3ZQYZLn7YS/G57s15U5CUd/s4dcI1UozKeRkQz2u5zDMZ/v9wMnUPRf0m1RMRJYo+Xg9B5KiRhuKN0C2KTNUCBAXRPJdU=
Subject: Re: [PATCH 2/2] x86/cpuid: support LFENCE always serializing CPUID
 bit
To: Jan Beulich <jbeulich@suse.com>, Roger Pau Monne <roger.pau@citrix.com>
CC: Wei Liu <wl@xen.org>, Ian Jackson <iwj@xenproject.org>,
	<xen-devel@lists.xenproject.org>
References: <20210414110433.83084-1-roger.pau@citrix.com>
 <20210414110433.83084-3-roger.pau@citrix.com>
 <29e8e2a4-3489-17b9-849b-ddfeed76451d@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <5fa30ed1-967e-dcd1-b9cf-110708f2c069@citrix.com>
Date: Wed, 14 Apr 2021 14:05:17 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
In-Reply-To: <29e8e2a4-3489-17b9-849b-ddfeed76451d@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
X-ClientProxiedBy: LO4P123CA0166.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:18a::9) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0e460e18-214d-4363-747f-08d8ff45f7d1
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6271:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SJ0PR03MB62719FF7ACE0A584E936724EBA4E9@SJ0PR03MB6271.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: j9BMvPA7FuEWax2X4qJH5TKwi+k0PcvtleMGbSSZSfXEsSj6WIk1L3L1nTBxX906UEEtZz3uVZ0DqsDjhmAJulEe/c4iybejg6Ap/zgGkNWqcvIH5jF0zJtDeCYOSPqmA3lfXETconkUJfCMX9C4qipLzUs/nM8pJHmQdIOHyu5zJSKPZqZeVPEovCAtHI7CV9HykHiB+8H/1SpNEi7EDAEW/PBQtqunpN76Nhdwoei6Vrp7+xhvYxIC6hpEyyMkIzgWG0hVGeHToZoPXUMJdXp2c1eGiyV1Av+g5JWyG8sEZ3B+h4OoUeSjN6eCksorLsP2Eu0+UR5duW7oen9yEXpzw5INP22+JIV6HnGOKnUNNodbrTgdXSZcfLNEtDS0JJhJMwtpZKamoYOqV8IiueVl+Sm4s3pKXR61B9C6Wgz+h5dOIXjob1qD3MXLV/6YEAFI96vpJSJheF06stRUD2xB/wQLK0tQKOo4VDFJvsD/TSjpHrBjwZ5PpHrxyoeQju24ZfKKcIR3HsSilriZ37qJRef5fnaoHQQ0dI4/zAyXfumEIGDHSRnmv8nMJ+vPaD0qHXwTqwBrcY5SGmN+/m8930iU7rKlhyEqZ8P5EWdgmAEL7yEZv+RtEBaZcV3Ln+SfKusq0+vO2XVM58IFsZBEZjbqAN+WOaM+9xE+rH1I4PQsnhpykwa5sCvex26Z
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(346002)(396003)(39860400002)(366004)(136003)(6486002)(16526019)(31696002)(316002)(53546011)(4326008)(16576012)(54906003)(26005)(478600001)(956004)(6636002)(31686004)(5660300002)(110136005)(36756003)(2616005)(38100700002)(83380400001)(6666004)(8936002)(66946007)(86362001)(2906002)(66476007)(8676002)(186003)(66556008)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?V0hIdEkxTUVkb1RTNkFGQXgrc0t5NWdRU2NyMlNrN2M2aVI5WWtrZWhWUm8w?=
 =?utf-8?B?OG91VFZFVHRDRmhydkNSUVFydER3RGVkZ3duNTBGaVNBL3pvOFVVMmZTeC83?=
 =?utf-8?B?dzhBMVhYa2crbmN0SUtYbWw2RVI3dGxFSTNTTmI0SEpLR1VoWml4TnJ1V2JL?=
 =?utf-8?B?cmlHaUxsMCtLUStyQUxqbzkyVGJxNlhETmw3d2VpMzl3RmFYTDkrT1dBZWsv?=
 =?utf-8?B?bDAwcC96YUlXWGhZOHVnNVFMOGpoZTQwWjI1QS9yTGpwVEt4cmdQeFpNbFJH?=
 =?utf-8?B?MzVDTktxQVN1Vk41T1FGcHVOWVJRVzlab2RsZHhxNEM4b0laYmFwMGIzRGd6?=
 =?utf-8?B?T1loUmQxTXBmSk5kaXhGbGl0TGltVHc2OG1ydHk4M2Z2UjRFTmNISkxEVkY5?=
 =?utf-8?B?bW5Ta2dteEQ2clRxRDBUdnRLM3RXT2NwSW5kWWVST0w3OGtXTVA3WjB3YUdt?=
 =?utf-8?B?RE52ZVVqWjlWSEFmRnNsSHFuY0t1dC9LWnlTZ2JOK3U1aWgvb1ozZU8vdzAz?=
 =?utf-8?B?VnA0T1dhOEVQZEFvdHhhSWg3M3ZyLzB1dDhDMy9zVFRFWGo3Zy9xcEhkakNs?=
 =?utf-8?B?bC9Ic1g1TjBhVGJ3aGdlbmpMTkNOaitRU0RUR1ZQOU5RUFdibUQxWXpiR2hm?=
 =?utf-8?B?QktPYnRRUkVKS2hnWjlpY0FWNUoyUzV0WldYWUlCR08rY2huekJLelI4a1FX?=
 =?utf-8?B?ME92dTY3dy9JbFBZaWNBbjVPVXhCc0d1MldkdXgxd1ZsaW41dG1BNE1HWHJn?=
 =?utf-8?B?TUVuTmNpcXJsRTRZSkwyUGllN0ZJVDhSMjBEQXZxbzNDUTFNT1NCMDl4OGJk?=
 =?utf-8?B?RUh2TUN6bnNtR0pzWVVoLyt4YkN5Slh0cVQ1QVV1YnUzMmpGUXhoWlVvVVE0?=
 =?utf-8?B?Uk1Wb0ZMYjYvT1B1M2FHajROY0M5djNGN0lxYkZDd3BITDZqbG43VElPV2pW?=
 =?utf-8?B?MnZOZit0ZkFlbC8rcGRKeWNxa054UmllYTkzcnNka0lYSG5HbmhBZjlwU1Ar?=
 =?utf-8?B?Zk42WDZncmtZODJsZlBZa1R6ZWxYTmkrc0tQMExXbjR5dmRlQUxUaG9wSWVP?=
 =?utf-8?B?WnpUUThwVHh4UDRxWFUwSGZBVE9yeW5sME9EWFNHTU13Z1hOc1pvU1R1VVV6?=
 =?utf-8?B?K0h3d0s5ek1RRkpOZGVRdDNBVnA0amlnbll2bml4NVY3MW1DYUg5Y3pqOXpY?=
 =?utf-8?B?QzJEQ2x1YUdRTndMV1RCNGRxbytpQkF3NWNZUkU5SEVqOW5NVWFRbUV6M29Y?=
 =?utf-8?B?NzN5VjM3MFJYR0VRZEx6NlRIZDFkTVV5cTZYcHNlMFdEckQ3akdTVWFiNUtS?=
 =?utf-8?B?OWlOOWdRSmU1KzdINVJmdnpFYk5nOGt1ZGRtK3k5VklvTWZHMnlndlhsdWNO?=
 =?utf-8?B?cWlWZFdnNXBUcUxHY3NoWTFTZFlGbG9GZW1xMjhXaVVjTUc3U0RQK0E4NVBP?=
 =?utf-8?B?eGhxcWlxd0Fqc3o1RXg5UERKSm5aV3FtdE9LVG93WUE4SW9sMWJOamthaitV?=
 =?utf-8?B?UGxLbk5ZbWR2eHUrTzZMYm1pZ3IvQjkrVkpvTGFqcEFFUDBWMERDNEtNWDZP?=
 =?utf-8?B?MGZGVjVwei9rSFRxMXRZZGRvN0FrNEZsMHpyVzhwT3pKNmlOMkpoeUFjbmUv?=
 =?utf-8?B?YU92Z0JaeitCNFVFZXhGMzI3VG1wa3ArRFNaK1B6WUZVdG13YTVaQnZWNkMx?=
 =?utf-8?B?SE4yZS8vWEtDclByc3ljQnZ1cXFScHRnb2xIL3RaaEx3WVBUejV0RG5wbkJn?=
 =?utf-8?Q?ugZRLxxMb6WjxbuHmHrE5FqXiNikspjJy67Igad?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 0e460e18-214d-4363-747f-08d8ff45f7d1
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Apr 2021 13:05:25.0649
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0wI3+jiERy4H9YQ5ule03qBqtA2hHbR0VZAuIqzzgt1QOgAlX299pU82N8Q5Yl8YOqQvraDl+Lz27yQJ5NDwRH0Zg7cNroAfuvwLfxQI9y4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB6271
X-OriginatorOrg: citrix.com

On 14/04/2021 13:57, Jan Beulich wrote:
> On 14.04.2021 13:04, Roger Pau Monne wrote:
>> @@ -264,6 +265,38 @@ struct cpuid_policy
>>              };
>>              uint32_t nc:8, :4, apic_id_size:4, :16;
>>              uint32_t /* d */:32;
>> +
>> +            uint64_t :64, :64; /* Leaf 0x80000009. */
>> +            uint64_t :64, :64; /* Leaf 0x8000000a - SVM rev and features. */
>> +            uint64_t :64, :64; /* Leaf 0x8000000b. */
>> +            uint64_t :64, :64; /* Leaf 0x8000000c. */
>> +            uint64_t :64, :64; /* Leaf 0x8000000d. */
>> +            uint64_t :64, :64; /* Leaf 0x8000000e. */
>> +            uint64_t :64, :64; /* Leaf 0x8000000f. */
>> +            uint64_t :64, :64; /* Leaf 0x80000010. */
>> +            uint64_t :64, :64; /* Leaf 0x80000011. */
>> +            uint64_t :64, :64; /* Leaf 0x80000012. */
>> +            uint64_t :64, :64; /* Leaf 0x80000013. */
>> +            uint64_t :64, :64; /* Leaf 0x80000014. */
>> +            uint64_t :64, :64; /* Leaf 0x80000015. */
>> +            uint64_t :64, :64; /* Leaf 0x80000016. */
>> +            uint64_t :64, :64; /* Leaf 0x80000017. */
>> +            uint64_t :64, :64; /* Leaf 0x80000018. */
>> +            uint64_t :64, :64; /* Leaf 0x80000019 - TLB 1GB Identifiers. */
>> +            uint64_t :64, :64; /* Leaf 0x8000001a - Performance related info. */
>> +            uint64_t :64, :64; /* Leaf 0x8000001b - IBS feature information. */
>> +            uint64_t :64, :64; /* Leaf 0x8000001c. */
>> +            uint64_t :64, :64; /* Leaf 0x8000001d - Cache properties. */
>> +            uint64_t :64, :64; /* Leaf 0x8000001e - Extd APIC/Core/Node IDs. */
>> +            uint64_t :64, :64; /* Leaf 0x8000001f - AMD Secure Encryption. */
>> +            uint64_t :64, :64; /* Leaf 0x80000020 - Platform QoS. */
>> +
>> +            /* Leaf 0x80000021 - Extended Feature 2 */
>> +            union {
>> +                uint32_t e21a;
>> +                struct { DECL_BITFIELD(e21a); };
>> +            };
>> +            uint32_t /* b */:32, /* c */:32, /* d */:32;
>>          };
>>      } extd;
> Due to the effect of this on what guests get to see, I think this
> wants to take my "x86/CPUID: shrink max_{,sub}leaf fields according
> to actual leaf contents" as a prereq, which in turn may better
> remain on top of "x86/CPUID: adjust extended leaves out of range
> clearing" (both are neighbors in that over 4 months old series,
> fair parts of which could imo go in irrespective of the unsettled
> dispute on xvmalloc() - unfortunately I had made that patch 2 of
> the series, not expecting it to be blocked for so long, and then
> presumably signaling to others that the rest of the series is also
> blocked).

There is no shrinking to be done in this case.  The bit is set across
the board on AMD/Hygon hardware, even on older parts.

What does need changing however is the logic to trim max_extd_leaf down
to what hardware supports, so the bit is visible on Rome/older
hardware.  I.e. after this change, all VMs should get 0x80000021 by
default on AMD hardware.

(A curious observation of Milan hardware is that it actually advertises
0x80000023 as max_extd_leaf, and has two leaves of zeros at the end. 
I've got an open query about this.)

~Andrew

