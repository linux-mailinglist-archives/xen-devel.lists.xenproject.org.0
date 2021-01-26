Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C6B28303DD4
	for <lists+xen-devel@lfdr.de>; Tue, 26 Jan 2021 13:55:35 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.74966.134830 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l4NsR-0004u8-0N; Tue, 26 Jan 2021 12:55:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 74966.134830; Tue, 26 Jan 2021 12:55:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l4NsQ-0004tj-Sy; Tue, 26 Jan 2021 12:55:22 +0000
Received: by outflank-mailman (input) for mailman id 74966;
 Tue, 26 Jan 2021 12:55:21 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=PjTf=G5=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1l4NsP-0004te-9b
 for xen-devel@lists.xenproject.org; Tue, 26 Jan 2021 12:55:21 +0000
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 6f2ff0ce-1ea8-467c-9eec-62dedc96da95;
 Tue, 26 Jan 2021 12:55:19 +0000 (UTC)
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
X-Inumbo-ID: 6f2ff0ce-1ea8-467c-9eec-62dedc96da95
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1611665719;
  h=subject:to:cc:references:from:message-id:date:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=0ofQkRP8G45OxjduCSyQew8JrLk/98Ast4e8Diq4WgE=;
  b=Ltipza8hFzrgUQUGu5+OqclmctD0yP3fge47sdQDYyHgiA+soiCdr/iy
   Z4nrcoWRmyJPpt2MXW8gEukk7k69/FvhzN2UNemZIcuwc+rk/aDMO+kOV
   ikGAmhbUREZDjTtw+xGEAwav9p5lHv3ugY+X2dUQ6+pAzfD0hJJ83zWXz
   o=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: kcLVWp7wnMUXahkBmR6/JVnZINRgZy/GoRthBJQWMQ8EUs8mq9z64QyttVfK4KLajZkslT8sCS
 IrHYDfFTs9zOneXdm9m/UNZkzHO7npc3IhXA18bhO+LYJ7AqNgKkrkl6AEhFi2/kvNA9+NjbUH
 bqW56ZNU7rmyPeElgFTVxIwrJz8L3atAWUFZmoPg9y5PUN36n76Sugo87QgnEyX0RtG1pU8NZM
 eaMwcAwknvWhwtTBLu8bBxQWzdoRPgsoFZdaEiEzeeBUWot/ivQo2n0H8IQ4yQI51dvzHdl75v
 56c=
X-SBRS: 5.2
X-MesageID: 36067436
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.79,375,1602561600"; 
   d="scan'208";a="36067436"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=a/3ebkNinhNiNG2oaL0xk+PQNi132gmyorMsUVoc8U1d34f37f3Qgu0/sGeOm/ndS7R3hUbLyUVQvo/0l5UY7nOO8jeinq4ySMpfZhQ+iwFVoKUkGEHWncxP/AzyFUXlyxknu6vA2tA7tnYnP3wpPgfFPfYpyIERNDcJmdugQYfpxdShlzuHUUXdaOk+kLRdyS8CsPX//MDPRUTu/lOCs0nxCfqKAJGqs+g1M4/doSkwxPG993Bu1StIZsVnAN++HBG4RT+2P3V6hpBvLZRP0Ckk9GDRe49Jgt4B+OjLMwt1u2ab5KUpMj8/i6EwbHgOtGZmMHjK2xUKxIlsBXgV2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0ofQkRP8G45OxjduCSyQew8JrLk/98Ast4e8Diq4WgE=;
 b=fX+2Xn/JoAR0kcDxR+8N6aj8Wcx1ZgJpHlu6kNDtU5rC0i9o4ee9TIezvgs/QFviAYI+35BwVchpu7jW2P+oHBpFQ2prm+Ggxw1gAUannHQ/r/rTH5ZUKKJxYNKyi3TD9WWZWkhtvMD7z0q9tAlgh7sGQOfYe8IJZ2spzWV17upX+/l/e4SJty+kccjvFp3iTUnpGdl216pe/aJMLy2jwWk7dy79jl1YFy6BBX6+T9/WNhcJ2Q/yOrlT2ubbIi6U23CX2sy3qxhHuoOfqNHdaYX7D0zD6jzur58HYcXf6jl3NdCfEddiU9rDU9fumXsWHjAjRY76lDI3REnY/yi1HA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0ofQkRP8G45OxjduCSyQew8JrLk/98Ast4e8Diq4WgE=;
 b=NsgQnnbnw0NoK0hUM9sqCFy0Aep3SzhIPZpMijJI/qPgJwuqKHvocoGHoYWZfmOEDVxjG8wFPgqs9Ct0INO0y1XADEmre2Bc/KmkhT8SGJOxk+WbExx1y2WWkg2w2TqpxkgMK9sWoFEFLloKbqqOHe8SUyofvCVlI8shiU08esk=
Subject: Re: [PATCH v7 08/10] tools/misc: Add xen-vmtrace tool
To: Ian Jackson <iwj@xenproject.org>
CC: Xen-devel <xen-devel@lists.xenproject.org>,
	=?UTF-8?Q?Micha=c5=82_Leszczy=c5=84ski?= <michal.leszczynski@cert.pl>, Wei
 Liu <wl@xen.org>, Tamas K Lengyel <tamas@tklengyel.com>
References: <20210121212718.2441-1-andrew.cooper3@citrix.com>
 <20210121212718.2441-9-andrew.cooper3@citrix.com>
 <24586.61484.451595.44272@mariner.uk.xensource.com>
 <f8b43de9-03e8-a1ec-b60f-6bbc1691e928@citrix.com>
 <24592.1081.38318.522643@mariner.uk.xensource.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <445bd883-3900-6a28-10e9-84251af43123@citrix.com>
Date: Tue, 26 Jan 2021 12:55:09 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
In-Reply-To: <24592.1081.38318.522643@mariner.uk.xensource.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
X-ClientProxiedBy: LO4P123CA0053.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:152::22) To BYAPR03MB4728.namprd03.prod.outlook.com
 (2603:10b6:a03:13a::24)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 085a2bfd-2fb4-41b9-1b5b-08d8c1f9a09c
X-MS-TrafficTypeDiagnostic: BYAPR03MB3416:
X-Microsoft-Antispam-PRVS: <BYAPR03MB3416F3D31ADD31B2CC114DD4BABC9@BYAPR03MB3416.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: A1+6cObggGS01n9HGin+4F3UGoAfRd+gc0m300Q6zAwWK3rIf9OJJTo0EFZmjP4uIqvqapIBiHiMb5E9aJcmIhoxRsnVHyjfjn4os/0eOCol3sRWCMTWgAODUZOlB/Nd2sgvGFRwqTGar18HgkufLFQLJCvAZS9JZccH0skWndk3b4eYwLezgZssKeWM2lD7ABHnnGusoQqKQA1pDWW3grgB7ja5aj7b0+oEz7EyR5TN1U/GnfuNVm42phO7+4uOvmP3f+iJRjDkOchG9YJ6wsxwqhQ8KzM3MPGcHaKAqHbx/zb2Mde3KQJkoxZwyAqCpAmxBN7fctWougxTQ+5ml8LelKPZ84WS7+n8xQyAFChZfVf1cYfVlAwqc3eDSXzHbLl69ngEmcTZekbwu2tuKYRw03XCmNgiwiFPDPHbKS8uF6RmymUUvCL1B6WpNk+lSBpCZM7kSO/SVdcP77QnVK/XVVVXsrpfX2HWwYUsclE=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB4728.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(186003)(8676002)(4326008)(6666004)(66946007)(31686004)(2616005)(66476007)(31696002)(16526019)(53546011)(36756003)(956004)(66556008)(86362001)(4744005)(6486002)(16576012)(498600001)(83380400001)(54906003)(5660300002)(26005)(6916009)(2906002)(8936002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?R2JUSGhIM2RPWS9NcXJwQ0w2U092VkdzV3VXcmZRdU5aYmpyd2VVMkp5azVX?=
 =?utf-8?B?T1VsQklIVHA1Y0NncTdJRXhWTEpRdEVrTHoxY0hzekVkY1pmaTlwYWl4aGg5?=
 =?utf-8?B?VWVzVFUyM256cFdDam9rdGRqSGo1YjBGY2FFS3k3N291RTRyOHliK1JqZXBI?=
 =?utf-8?B?MkZ5SGFBMG1LcXo2ZnVzR3dwVlZVZlBCTjhOV0ZFU2ZyanBGWkpsSU1TdWRF?=
 =?utf-8?B?QmdlaHFvMEdjK01IcnExcHpEdzE2bHg5VjBpMFFLdVVaRE9PZldHRy92bnRI?=
 =?utf-8?B?QVYzZ01mNHNmTjV1MnNRZkY3WE0vaGw2WGQrOTFhV2RRZGFaZDViVjNSeHpZ?=
 =?utf-8?B?QlhTa2t1SXdOZmZKU3Zybys0MTVwRVNKT0d6Wmd4SEhlNTZGQ09OYk1jVkpR?=
 =?utf-8?B?ZVR5SlB6cER0WjFJKytQcTlETzZXcWRuZUZqZ2NtMW02cWZ1VWdGbmhWNko0?=
 =?utf-8?B?cnlMajZIQ1ZhZmdsL1ZRMCsyN3lDZ2d2bk1vT1BxK0M2VnZNYzE1SDY2Y0du?=
 =?utf-8?B?Yi9tcXdhbThtTlczWkhzWStNa1FCSjdadnZSY0hGako0WDBWWGwybldYSnU0?=
 =?utf-8?B?OVN1d0dhYlpMamlzQy82THcrd2JyZTllc2pRcy9OSjA3TkpCUkt4OFBhc21B?=
 =?utf-8?B?ZDRPQUtxZ2N3b1BkaHhYZUhia050TWlhRE9Ob2o3T3ZpVFlJSnFzdlNZSi9E?=
 =?utf-8?B?TUZSVHFBNHRUK0ZnUTdlR1lDcU5Ud2I3MG9hS3BaRjhIaEp2Q05qY014UEgw?=
 =?utf-8?B?SUp1Q1d6ZFNRMUF1b3FvOWNhVmIydnFCT3E3RmY4ZjRmaGhodnFUbUhXdVFJ?=
 =?utf-8?B?WkJTWFF0cmxPU2ZjWElpSFZsaUdYTis4bndoVForSDVQNjlCak8yRm1reTFH?=
 =?utf-8?B?NnhtYis1NTdEd2JObUgzaUJacUlQY1NXa1g3aEYycGVMaXVtM2JDckRTekRn?=
 =?utf-8?B?VzZiSjlodHhKNGNOZVVFRnZneTk2S2F1QlRUem5kMkNOMzZ0bzlXZzU3RjF6?=
 =?utf-8?B?ZHFwYWovTXJldzg0YUNxNm5JRkh5czF4ZVlKbFd5TDJOV3JQZjAxaXR4Tjht?=
 =?utf-8?B?U1h4bEJQbllqa1J4T3Zoank3cHhoUi9acWFzSHdRZUdlVlFidkErVkliNk5I?=
 =?utf-8?B?c0pFNlV5eG4xOEtzQVQxZGxHdWZxQllBQUxRU3NPNEYwQjJFQzhWZ3BKTHVy?=
 =?utf-8?B?cDk0c0pNSXc3aGZGZEVFTmo1SlZsNFJ6M2JZWmpvc3lHSnBWdDBwaWRjbDhK?=
 =?utf-8?B?UEplWjJKRXkvTWtSNmFBR0UrOHpqVnF4eFF1dUFoU01KaTkvZ0RSR2FGR0Mw?=
 =?utf-8?B?Q0x1aGU0Sno0RUZFVmtsY2Qxakp5VFRLbHd0MW5wWVN0SkZOU1A2c3prV09y?=
 =?utf-8?B?R0d6aVNVaTkyZEp0b2NKRVlLTWNTNjRtRW1RVkNxUkhZQ01XNEw4dHVyTVhv?=
 =?utf-8?Q?/AWxsIOA?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 085a2bfd-2fb4-41b9-1b5b-08d8c1f9a09c
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB4728.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jan 2021 12:55:15.9767
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gMx/PoY/L3fvf0/SdM4HD+i/0KLt1jhvaKUTJ3E7QIQ63OEDc99QfnvBzENfSIErzHmRBZX8dfdpwTRDBsxd3Gn/A3CBLAV8iVHnOSpmCNM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR03MB3416
X-OriginatorOrg: citrix.com

On 26/01/2021 11:59, Ian Jackson wrote:
>>> Also: at the very least, you need to trap SIGTERM SIGHUP SIGPIPE.
>>>
>>> It would be good to exit with the right signal by re-raising it.
>> This is example code, not a production utility.
> Perhaps the utility could print some kind of health warning about it
> possibly leaving this perf-impacting feature enabled, and how to clean
> up ?

Why?  The theoretical fallout here is not conceptually different to
libxl or qemu segfaulting, or any of the myriad other random utilities
we have.

Printing "Warning - this program, just like everything else in the Xen
tree, might in exceptional circumstances segfault and leave the domain
in a weird state" is obvious, and doesn't need stating.

The domain is stuffed. `xl destroy` may or may not make the problem go away.

~Andrew

