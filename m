Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6275E318A3E
	for <lists+xen-devel@lfdr.de>; Thu, 11 Feb 2021 13:18:06 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.83894.157100 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lAAui-0006vb-RS; Thu, 11 Feb 2021 12:17:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 83894.157100; Thu, 11 Feb 2021 12:17:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lAAui-0006vC-Mh; Thu, 11 Feb 2021 12:17:40 +0000
Received: by outflank-mailman (input) for mailman id 83894;
 Thu, 11 Feb 2021 12:17:39 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=fzmj=HN=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1lAAuh-0006v7-A2
 for xen-devel@lists.xenproject.org; Thu, 11 Feb 2021 12:17:39 +0000
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 431f18ba-df61-4803-832a-10fdf6134ba9;
 Thu, 11 Feb 2021 12:17:37 +0000 (UTC)
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
X-Inumbo-ID: 431f18ba-df61-4803-832a-10fdf6134ba9
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1613045857;
  h=subject:to:references:from:message-id:date:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=0yPHMVpqh8KgihOcoJHIkFlCwxhj0MXJpGUALjSmcm0=;
  b=WKjtUAxG3SAznKrYcBL8oyBSn6fORdrecZ6iU2irK29SMS0hIFVwY0ck
   vvXTUlDAi38FsHgGFXQ60d6gDQLgPlbqNDmUWzQbABtC+gSUptwYEsJwy
   tKwdlPfyhFjPp6vCFJK5E427bgctbfD4wDxoH86cRcnNGctH4WlUwPcdK
   w=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: DCrIMEkgX54EbOCwOsgaZOMjc1upsJou9A9Ae6RfKejq1IpeeIYwUd2XZ3DQREBFIxiekZbY+u
 XTJ+G1mNepDYyWWjikctD5dXPI6caHj1XB674+o78ie80YRIGgNU5Q1ei8DyTqTP3fghtJ6B/Q
 YIDGZmdweXuHEninK+UKtT9V/oJAV+vu8kg81AtRlYhn9vYhtNkFyMxY1UN48ZBLcw5k1fZ5er
 EJ0HuscmauGUiqJ65b/Pqwy57gNrZuwfAC9UPBLiESEHh0Gs+EEH5Zu+qYsm0CY2IdXo3Yxysq
 XG0=
X-SBRS: 5.2
X-MesageID: 37230265
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.81,170,1610427600"; 
   d="scan'208";a="37230265"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OZQhSsRPphNHbgeN8R9T6bq2OORs14WLMtW5k1YpGfCHY6ow3TtvoTRYjys4GgJut43pr9QG8gZrF54tDWGm9FISrwRnjaWDzfnRiSH2e8CEBQd5S3afnV122LfFetXYBJc5GE5bfG8WcbCju85nUbRUWZNFkGKZ5eTsp5oLJFzGXXprwApFsQt/dodvZiWpE9OED3E04J/Yu+VdMYNCQL1upuRNdLCBhT/Z3RgQGPxfT8QxfCCkeBis24tug6gX2c5Xi2ajDEI6KXJfhVRV28G8WKOwIAMJstt2k93r6PB2SH0V51V6O4i1wM5mU1PZs7Sr6nH7UrBDSx5YIGvM3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0yPHMVpqh8KgihOcoJHIkFlCwxhj0MXJpGUALjSmcm0=;
 b=FJPM4l2qcw4j7/WlPNrBzwsh6pkNzgigUALMoK3A6TNzHr9PTe99Mw1Wk31gybbmf2+ZbhlH5HdMou3oa2NTEG3CxCuQBY8wPozLGLAHqbFehDRnfO4AXg6QEuh8B6Xlr509kjKAnvVn8OoMZSrLzoyRCrZzGmScKwrRvvexDKbw1NpAQjRbICuyvBL3i86wZnWdg8i2DqGRS6M38uien539K7MngNPSGqh6b0MTJwd59K3wHSgV53uGPV3Q/cwrGBFj02fQaFqfv8FqjsgXoGdJB2pzyJOxddJvBKdLjJSbj5320SdAqyWloebxjYU2YulRs6Jo19qV4eDaOB+1MQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0yPHMVpqh8KgihOcoJHIkFlCwxhj0MXJpGUALjSmcm0=;
 b=K+1Co9I1Ss4iL+ZldvdXnf4PP+KMWgyPeUxcqZ9E7iFF34BF/KJEw1Nxf8y1CEdCx56Gv2VTeR1DNlITSUS7weKPfC1RSc7YUXYBA5XSqzyz/dAsPevwjiv38Ax3qPGhNbthXA5Lyr2eRLxARMRotJSceIty7Trg6wh3uFMblLc=
Subject: Re: Stable library ABI compatibility checking
To: <xen-devel@lists.xenproject.org>
References: <22a01569-1ea0-bb87-eda1-1450d0229cf7@citrix.com>
 <816d28b2-df85-9259-de96-5a6654c8b341@suse.com>
 <35654104-5445-9e44-792b-3059d601db5e@citrix.com>
 <c0b35b70-5cac-d25f-92c6-181d95785a89@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <03f845f2-6d5e-04e2-0cad-47648b3f8949@citrix.com>
Date: Thu, 11 Feb 2021 12:17:26 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
In-Reply-To: <c0b35b70-5cac-d25f-92c6-181d95785a89@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
X-ClientProxiedBy: LO4P123CA0065.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:153::16) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a392b750-6172-4aa3-3fdd-08d8ce870221
X-MS-TrafficTypeDiagnostic: SJ0PR03MB5439:
X-Microsoft-Antispam-PRVS: <SJ0PR03MB5439F756B1B1E88B5B22F998BA8C9@SJ0PR03MB5439.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3044;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: QetDSbkKO8/hx/7ju59jbVzpLG+gOU4IkzcZkQFFq0wRo/eLyBwzjsl5FWCKLCGKRQM+mYWFLcqvYm31WZz9QmLWnP+/FSQWPspQNpnOiaBealPwct8g0i8JR7uLqh6l0VF2Y+RFsGZdiVapgPk7VPViOc4M+H+s06MjTtcidnZmHbZ4Gt+kEKXFxVNsb623v7Xjvr4ITjeVK/dVk39QPgm0LZDt8uh2x1nJ66xJ1ojTIunwVooF5Yso+e+zuN2PHpaonyWKIpMHjGLJ8eRr+RAoWKO+cI/26dLhJXdzx7z1fFwNagz0gM5LRJH7Vdi8CWXDBh+pMK6KNLrsBx/NsYCmFYBuRKgBT7e2dMod6FuB6p5ktHiVqtpsE4qWwkaJjK29sX3+ReWTGRY9iYQQXANmVg7rmpLlW9tgZ0HUVIyAzyKNYddH3H08axCdEZRyQqlptvAgWfho5M/toj9j4qoYKyDw6r2ETrM6Mo39CcWg0xGJNjGu3SDyP+2D5WkoVnR1mBqax+gfcH0HRx+2tAVcNqwuPfJp8wGtUAWkWSJzeg61cBmzy3lRp+stl1H5+VbROgE4eKIMaKE62PQBFpd7061CIPNCyJXDnidvKpJzWZ8fKDWGR3L1ZCdi43eoTzikb2sNFVmgdjVgo6WPl2GSfBt/akBIrFgX/R0bvhCLiRDJmsd8t2dJm8Amiohs
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(396003)(376002)(366004)(39850400004)(136003)(186003)(16526019)(86362001)(956004)(26005)(8936002)(31696002)(66946007)(2906002)(6666004)(2616005)(66556008)(478600001)(6486002)(6916009)(16576012)(8676002)(316002)(66476007)(53546011)(5660300002)(36756003)(31686004)(966005)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?NUFiQThlQkNHM0RrWU1rU2xVaWZYVG5pZUN6V1h2cVI1NEFNMkFSVXRFQlBP?=
 =?utf-8?B?Zm92N0dEajY4RlB4K2gxMDNhSU5taENxQS85QWxDOVpWUlB4dktMSXdVRmZN?=
 =?utf-8?B?TEkrTTV5VUN2akREelNTY3pwZlBOR2R4NXczUzFjTkxRMHZsU2ZCOEZxeVlk?=
 =?utf-8?B?R0lEMXBGT3FLVXUwTzl6U3lhQWRhTHBBMEJCdXBUbVVVZ3BLazZNUE1GY1Rw?=
 =?utf-8?B?MU9QOGRpS1dRNDVEaThpUEt1WWVhRU5scTltdkt3Y25zY1NJNitvMFEwbmV6?=
 =?utf-8?B?eFErYWgzcW9CVkljQzF1cWpFUE9xUWUwOWw5c3Vnd3JMcFR5Vkk2VmdLVjVX?=
 =?utf-8?B?dGtUWkJxbjAzMmNrTlJMZFVHZ1AwQXVtU1ozM0orYmp0NElBUzRVeVpGalBJ?=
 =?utf-8?B?aTJDOG5vU04wdlhjL3VhKzVQMWZuQ1ZmZDVIVFVYTHM3Y0dxUmE0SWtQK0dj?=
 =?utf-8?B?UG1ON25La3NaaVJQV01VYS9oa2Zva3Q4emdxemg0VWJaT2cvSHIrTDRPb2gw?=
 =?utf-8?B?aUJNdHc2eUg3eGYyZVdLRW9pZE5qRi8wZHNXNE4rS3ZYc3NxWlRKSkdJMmpR?=
 =?utf-8?B?T213SithT1RuLzQ3L1pPYXYzYmRXamZhSHRQd1dGQ1ZOVWtOK1M5VTlkRFpH?=
 =?utf-8?B?WlhQWG9OM3pDMk5RTE93aDNvZ2NzMFIzNE82VlpTQitMNlJyNnlHV3VaaW9q?=
 =?utf-8?B?eEtZVW1HRlcxaXpJYUhqVmJlUXg5NlFuS0dnZlVFU3UxZC9odTRGWlVxTFNH?=
 =?utf-8?B?S3I5ZWhFZTdqaW8wTG1PYnJMaUZYTm9idnRINm83UThmN3JpYUJ0cnl4aGlF?=
 =?utf-8?B?QW1RdHlicUtESnNJQ2d2M3BFWDJtcldza2wyb3l5cUdUd2Nsd0RZN25Jd09G?=
 =?utf-8?B?TXZ1aWNSNEFDdXo3M0Y2YlhjTDREa0hucTFqQ1R3dGxJRnlqRUQzbzFDRFF0?=
 =?utf-8?B?amREYm5oSWhNTGVLNUp4Q0FTSEM3QjhLVE05MEpLamRUN01SZFpqTi9LMHRh?=
 =?utf-8?B?aHJFVmZvVS9QME5lYWpqSE1JTnhLb1kvSlhwbjNFZUVUT0RsVVV5SzNJd1BV?=
 =?utf-8?B?QktsWFVXU3pnSjYraFR4Sjd0V0RYbVNVU1Q4bXRnQ0dISm9hTnFkZm5IaUNN?=
 =?utf-8?B?N2p1NkxQRlI1cVVVdXlOSDk2Um95bGxsdkFMR3lxaGk1dlRWcmE0VnN0bnFJ?=
 =?utf-8?B?a0I2UWZuZUJTRXN6RHRVWWVnYi90dDF6ZS9FMmxnU0l4cTRjMDI1cU9zblBq?=
 =?utf-8?B?Z2tuU2d0NStYMWxBNG9vT3JOVWdRQTBlcjU1RVFqMnlZeWJMZ1pNQXJoVlF4?=
 =?utf-8?B?dlZvcDZQcHNxUFMrTS9yMVNhZXFwUGRPektUSlE4V2VCWE1QQzA5dzA5djFa?=
 =?utf-8?B?R1BDa240R2pmYXdjL3QrVDJQeWNzMDNqMlV6UTQxK21PdnpsSk5adnVyekhZ?=
 =?utf-8?B?QXdZaTZiZHMxK3IyMG5NcHNmWGZyaENWU1JYK05DNEZwc2IxUXlVeHpsYWpz?=
 =?utf-8?B?Q0c3YWZSa08wK1ppRis0L3NDZEoyVXRCZ284cXZDMVpGLzdPZk5kYVdIeE84?=
 =?utf-8?B?YkYvUUUwdGxpc0VFMEJLZDhHMmdKb3VHYTgxbWM5VExyUTUvaDQyNzNoa1Fs?=
 =?utf-8?B?R1dxbGNsWDA1S0gxYjU1Y0tCVXhQNllGbFY3aXFKOEtFMUt4ckt0MkIwRmJr?=
 =?utf-8?B?WWtSWnpRSlFUdHhOREk2a2pTekxjQW9zWk1BemJsU1VDRnB2K3pReGdibkhJ?=
 =?utf-8?Q?Zd5VPYvCXJBHGATIQYOSmLQ4xq3JG6JbQ+pUas+?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a392b750-6172-4aa3-3fdd-08d8ce870221
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Feb 2021 12:17:32.5734
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BYCfPJOnb5CdAjnWYBuyQsEdk32P2vSlnABFI+e4HFS2gzsDIsJlqf5vzQNdeAc8MFO/vNtKDWdiJL451I0TwSTUPC/5JQ3qvOjdxxRgMKo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB5439
X-OriginatorOrg: citrix.com

On 11/02/2021 11:53, Jan Beulich wrote:
> On 11.02.2021 12:30, Andrew Cooper wrote:
>> On 11/02/2021 11:05, Jan Beulich wrote:
>>> On 11.02.2021 02:08, Andrew Cooper wrote:
>>>> Hello,
>>>>
>>>> Last things first, some examples:
>>>>
>>>> http://xenbits.xen.org/people/andrewcoop/abi/libxenevtchn-1.1_to_1.2.html
>>>> http://xenbits.xen.org/people/andrewcoop/abi/libxenforeignmemory-1.3_to_1.4.html
>>>>
>>>> These are an ABI compatibility report between RELEASE-4.14.0 and staging.
>>>>
>>>> They're performed with abi-dumper (takes a shared object and header
>>>> file(s) and write out a text "dump" file which happens to be a perl
>>>> hash) and abi-compliance-checker checker, which takes two dumps and
>>>> produces the HTML reports linked above.  They're both debian tools
>>>> originally, but have found their way across the ecosystem.  They have no
>>>> impact on build time (when invoked correctly).
>>>>
>>>> I'm encouraged to see that the foreignmem analysis has even spotted that
>>>> we deliberately renamed one parameter to clarify its purpose.
>>>>
>>>>
>>>> For the stable libraries, the RELEASE-$X.$Y.0 tag is the formal point
>>>> when accumulated changes in staging become fixed.  What we ought to be
>>>> doing is taking a "dump" of libraries at this point, and publishing
>>>> them, probably on xenbits.
>>>>
>>>> Subsequent builds on all the staging branches should be performing an
>>>> ABI check against the appropriate lib version.  This will let us catch
>>>> breakages in staging (c/s e8af54084586f4) as well as breakages if we
>>>> ever need to backport changes to the libs.
>>>>
>>>> For libraries wrapped by Juergen's tools/libs/ common-makefile changes,
>>>> adding ABI dumping is easy.  The only complicating is needing to build
>>>> everything with "-Og -g", but this is easy to arrange, and frankly ought
>>>> to be the default for debug builds anyway (the current use of -O0 is
>>>> silly and interferes with common distro hardening settings).
>>>>
>>>> What I propose is tweaking the library build to write out
>>>> lib$FOO.so.$X.$Y-$(ARCH).abi.dump files.  A pristine set of these should
>>>> be put somewhere on xenbits, and a task put on the release technicians
>>>> checklist for future releases.
>>>>
>>>> That way, subsequent builds which have these tools available can include
>>>> a call to abi-compliance-checker between the authoritative copy and the
>>>> one from the local build, which will make the report available, and exit
>>>> nonzero on breaking problems.
>>>>
>>>>
>>>> To make the pristine set, I need to retrofit the tooling to 4.14 and
>>>> ideally 4.13.  This is in contravention to our normal policy of not
>>>> backporting features, but I think, being optional build-time-only
>>>> tooling, it is worthy of an exception considering the gains we get
>>>> (specifically - to be able to check for ABI breakages on these branches
>>>> in OSSTest).  Backporting to 4.12 and older is far more invasive, due to
>>>> it being before the library build systems were common'd.
>>>>
>>>>
>>>> Anyway, thoughts?
>>> +1
>>>
>>> Not sure about the backporting effects - tools/libs/ had quite a bit
>>> less content in 4.14 and older, so the coverage would be smaller.
>> tools/libs/ has been the stable libraries, since IanC split them years
>> ago.  The only odd-one-out is libxenstored IIRC, which moved during the
>> 4.15 window.
> As well as ctrl/, guest/, light/, stat/, util/, and vchan/.

Right, but 5 of those don't have stable ABIs.

~Andrew

