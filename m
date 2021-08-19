Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D1023F1E77
	for <lists+xen-devel@lfdr.de>; Thu, 19 Aug 2021 18:56:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.168980.308619 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mGlLA-0004Gn-5Q; Thu, 19 Aug 2021 16:56:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 168980.308619; Thu, 19 Aug 2021 16:56:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mGlLA-0004Dp-0N; Thu, 19 Aug 2021 16:56:28 +0000
Received: by outflank-mailman (input) for mailman id 168980;
 Thu, 19 Aug 2021 16:56:26 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=GG3y=NK=citrix.com=Andrew.Cooper3@srs-us1.protection.inumbo.net>)
 id 1mGlL8-0004DK-Az
 for xen-devel@lists.xenproject.org; Thu, 19 Aug 2021 16:56:26 +0000
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id ff91d953-062c-4e0d-94b8-09de15f1d068;
 Thu, 19 Aug 2021 16:56:24 +0000 (UTC)
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
X-Inumbo-ID: ff91d953-062c-4e0d-94b8-09de15f1d068
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1629392184;
  h=to:cc:references:from:subject:message-id:date:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=mn0M0AcmfeHH1YO0ZPxYsRh3byoIMwKRXpCYHJk11mE=;
  b=H/fjQkaYT8hy5eqfjYVLWOyxFDprisirnJKQBacEfxwcYNOGtApRsvIy
   uOv6rZ6L9wmxUggkeVBm+el7KLq0qUT0INbe3mfiR0R5EuoG79Oy5U2LL
   ZhWHvFNpDz8/2A/dKkH1HzCiN/2h9nD8wQAhxNfPFsLbaFOMwrxEtdEYx
   Q=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: LsirwRQxWz987v+dZEX449nldelerDFzs0B8+gKCzgZlGsxn/3OwrnJNZ3Q+n+cNmS7BY+7CLC
 wPwVkf6MVVZeK4Grt0gxAFQgl2c4DBnT1OyEmiqN8FmBXahcV7RH+6Nq5qo0t0WtW00cOqN8xP
 2P+FOjh66XTZb6w1rwDX8kpbfMZu/VPt/uBsqmR7tY1fLmRyDQ7bg606ZAc6XowG80plM831af
 7Oy2+6kmC2fWnC5nvxmhYL+aTMDM16IwkgulntASfy45Y3ekMwZGO5xrVh7G7JJubMghbrJSsM
 T1Ds9VJ9o0sxurSu0XMs/v6v
X-SBRS: 5.1
X-MesageID: 51247304
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:XHUkgKldU+7StZWDtYiywa9NQc3pDfOiimdD5ihNYBxZY6Wkfp
 +V88jzhCWZtN9OYhwdcLC7WZVpQRvnhPtICPoqTMiftW7dyReVxeBZnPbfKljbdREWmdQtrZ
 uIH5IOb+EYSGIK9/oSgzPIY+rIouP3iZxA7N22pxwGLXAIGtNdBkVCe2Km+yVNNXh77PECZf
 yhD6R81lidkDgsH7+G7i5vZZm8mzSHruOoXTc2QzocrCWehzKh77D3VzCewxclSjtKhZMv63
 LMnQDV7riq96jT8G6c60bjq7Bt3PfxwNpKA8KBzuATNzXXkw6tIKBsQaeLsjwZqPymrHwqjN
 7PiRE9ONkb0QKeQkiF5T/WnyXw2jcn7HHvjXeenHvYuMT8AAk3DsJQ7LgpOCfx2g4FhpVRwa
 hL12WWu958FhXbhhnw4NDOSlVDile0iWBKq59Qs1VvFa8lLJNBp40W+01YVL0aGjjh1YwhGO
 5ySOnB+fdtd0+AZXyxhBgt/DWVZAV2Iv66eDlEhiTMuAIm2kyRjnFohPD3p01wsa7UEPJ/lr
 352s0CrsA8cicUBZgNT9vpD/HHUlAk7Hr3QRSvyG/cZdU60kT22tbKCYUOlZSXkaMzvewPcb
 T6IR5lXD0JCg7T4fPn5uwDzvmKehTnYQjQ
X-IronPort-AV: E=Sophos;i="5.84,335,1620705600"; 
   d="scan'208";a="51247304"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oApYPki5F725pbk93gtMDngABGRQMIOPaReeMLKMPefH4aqs+z0N/PNGHsbbLPRdHyMKxcZX0/Cq5WoHSkXBveWiwn6GKTyFp8DokUCI+RSdfSRUi6OypcDxV4QB6iaR0l7KPkDxqVaSXqceCvGfiu4HKMYDxuVarx/Lt0Z1M0w6ZmVOdCd3WMGjdvmEQ56MIB2uvdGN3qQbbY2y84f08ts2GPQm+ezIe7lWi5Qus5TdD9JOnMI0H2LsaiUwqsX2fdvs313TbQlOgaBGa7FklcTsGilcHWT92/v0IawXsY5h4cBH4IOD7WU4a5ceUxtBPMK8pXPMSHbYhebsFCUPQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tlmvmu1H259mfHoV7cWTKiw5Oox7kxRba5Xf2uLSN8M=;
 b=VtUO9H9mUaAvBBMUE01Ullm/YAlCagTdgH45iqEsgfLhOpO5TDXfWnWGPNIaI0uqTaq/aWc7KjcV8/7Xjpe+L5TXeBmRt9nkf6yOtcYW1l7y312dmQSROiImZzACT+tl2r6J8obj5HWiTJO8svmAhbucra+WLYnC/e6c5AeUbu0QA4t6QTweYVTzDcHNzrxc9RzNHiiKQuKCu4pLuu2W0IH7urEPsbpu+8qqUeaYxpU5uq8QiKVdva/yjLPJ2BvtznJFvDGCWGX1XqevjDDw/P7P/3NaFKUJM4mhWzvxlQsB11QmNIR/AWyxwwJIdCgMZgJy8wVpGt/TZgeHzJziBw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tlmvmu1H259mfHoV7cWTKiw5Oox7kxRba5Xf2uLSN8M=;
 b=Uwfm0kuSyYljHLbDErBY0j/Sa+/JaifLlC4YclNxMg+jRyLk96aB2YxKkRbGQCDa5TamFY0Z+psKxBFbbGMrsCpS0Jj+wFTkSrgm9weD+6W3KQT0RxHBtXldOI1nijRGSH3dvVoCXpqYXqdA/y6/H9uGfHKr4CXn3NwAI6o8/eo=
To: Ian Jackson <iwj@xenproject.org>, Jan Beulich <jbeulich@suse.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Ian
 Jackson <ian.jackson@citrix.com>, George Dunlap <george.dunlap@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>, Anthony
 Perard <anthony.perard@citrix.com>, Julien Grall <julien@xen.org>
References: <48cc22b9-6d0a-2cfc-ce34-6aabeb84b160@suse.com>
 <8324f959-924b-d196-149d-2fdad95da8fa@citrix.com>
 <24862.35359.95257.223452@mariner.uk.xensource.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: preparations for 4.15.1 and 4.13.4 [and 1 more messages]
Message-ID: <0ff278fe-a3d4-6c42-5b74-16162f7a28c3@citrix.com>
Date: Thu, 19 Aug 2021 17:56:13 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
In-Reply-To: <24862.35359.95257.223452@mariner.uk.xensource.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Content-Language: en-GB
X-ClientProxiedBy: LO4P123CA0250.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1a7::21) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8053ba4d-763b-4a82-b8f3-08d963324553
X-MS-TrafficTypeDiagnostic: BYAPR03MB4487:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BYAPR03MB44873627ADC1E7DAF42B0F95BAC09@BYAPR03MB4487.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: leNmF7jUxoTVha3JNbtU9i5Qs8Lu7p8UuZ2dXo13/krVoc1MnNzsC3uug43urUmK9y9vcr+RH48Un50+VxUie3Z9hgT0G7/w5CADCZgTuk1cGNVG4w/ciPAnERXAGdvevPHRGS/c/qLYclekgL9S92R8pvIWlucdC9zyhUqIxI8ihzyPYbwgTRFQrMGbxjNLVjdWDsGJ0//przHC6LUiJQB+18x2jWvxY/f6Ru2363Xyus7RQVH60fAI0Yc8O+boeLWQT9Z0yH3v10TC5Q/WFyjclzJ+eNCtpRpjfCX8ycbznsAKEHQapsY0GJwn+NSzWTknJTioIA1Fjfg9YLn96NTmo9FQsjDlPl8YPid0g7WojMcYaONAdx/xEmVcnXZT54uVyvDVg0TtMucDKXCbJ9SplnrjA/3LHejQm1jQY4dmF2D02IAvQyAtYE58Iwh04cPI5OkOo7W8ZSqEZ/MGGDDz01ziw6MUfpoW07lXd+lJND66DGRRO7cf0J8z5eCrylz2xP/IXXNzoreC381DonxiDFV0vZQYChRYd9Oh0FY56kIg0z1oKlbFRYMbfcYROQRgRgrwtq7KtAXHA9uCAC2983kdquok1ez9MjhbSXLT6LsoNCPRUp907zyURKRKTLNBl/7iq1DIiOHfblfH3n4t/J8KuKwxV089TPIDha3FAIDyKVdu+IXFnKFiCxbqmYluqN6uMTcGQR97wMDglDskpz8LPAHV7/ljxaDICfc=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(346002)(376002)(39860400002)(366004)(136003)(316002)(6486002)(66946007)(186003)(6666004)(86362001)(16576012)(53546011)(26005)(31686004)(36756003)(31696002)(5660300002)(38100700002)(2616005)(478600001)(15650500001)(66556008)(66476007)(83380400001)(2906002)(54906003)(110136005)(8936002)(956004)(4326008)(8676002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SFZuVGY1SEZrTVQzaTZCUkc2NkxlTWRJSDEreVVIUGpibmFxeFBhV0E1ZDJp?=
 =?utf-8?B?c1VGTGFFWUtrRDc4ZURUcXluSUZhZUN3UllBRVF4Wmt3bFQ3NnRMTHFMRUg4?=
 =?utf-8?B?YUlrSWI1d05XaFZrbHhlYlgwUng1a0NseVU5a0hxaG9VVlYrQ1FieTNISmpw?=
 =?utf-8?B?emtCTGpmTjAxVjJpdXhRVUpPMDA0NnFPVEdYT0t6Y1IxRGlqV2VBMEFTcVN5?=
 =?utf-8?B?Z3NHa3lOdzJjbnE0MU5VYTBySDEyV0o3UTNXU0JZc3FQamJWZThFK1R4WE1H?=
 =?utf-8?B?eFNyKzlnbEE4KzB4YklyNFBzazA4QmJ4V0NtaGp1N20wSUY3eWhZSThmYjlR?=
 =?utf-8?B?dVJnQXZkVklzaG5ZSExlSEF0ZUxhTGFZK0RwMFNjRWY4Ly94K29FUEZWUnZR?=
 =?utf-8?B?WndXRDY1b2pmSGYrdEpwUnpCaWxFVThDWlBOSm9neTlEZVpLV0pGaS9pOUly?=
 =?utf-8?B?RmY1Rk1yWGIyVkhRZVNBTzRTdldoTWdPTzFiZ1NveE1MK0ZLMkJseWIvMmlF?=
 =?utf-8?B?emxGRDI5NS9nK0tsRXpzMGJXcUJlZkdpZ094anJrdWYxL0gxWHh6KytWcXp5?=
 =?utf-8?B?TVg0OVkxRTdxYWhxZWV0aUlOY21OTzZSeGIvMGRVTjFQeWsyQVRYVERWYWQ0?=
 =?utf-8?B?UitSQWNXTlpnVGdpaGVlM2RNLzBPbXpsNy9lSHl0dlRKeitZMmlQR2pXQ0tF?=
 =?utf-8?B?RVpWTVJqWDRneDBTRG00Ly9zSUNHM1JxajVIZ3haZmtsbElIOWRXak1qUXZu?=
 =?utf-8?B?N1ZJVUNCZWtaNkdHUnNIeDYrRFBoOXEvSGxIRU9tbVV1UXh4S3c1TkZnTmlF?=
 =?utf-8?B?bjJEb09XNWZsSHdvSU54YlJGbW9FUmxZanJIR0VwTk1vNXc2VmkvamZ1TWYy?=
 =?utf-8?B?T1dkVzB3K3p6WTkzVGcybURxSThCYmNOdEdCNmFrN1IrdGV6SHpFK2F3VzVI?=
 =?utf-8?B?aU14aG9Kc2VrUnZxTHhOM1NnQ0t5OTRsRlZIem5nQUdoeTdEdHRUUHRGU0lK?=
 =?utf-8?B?eEpjcWtmRGRqWk9sdlljWjJwVHJOSHMzbVNUQ1Q2UlNjMVdxUW5QMTBzeFBP?=
 =?utf-8?B?V1hsUElyN3hFWXJQQldlNlkrYjc4b2JIR3EvS2ZiYVhmdk9wT1BJL01UT3I5?=
 =?utf-8?B?ZGdQYVQ2NWlNNjFHZGZOMHhGN3pTQXlVMUdEQWVOb1krYkpRY3VTTVdsV1NB?=
 =?utf-8?B?SzN2RlVQbEVNUndmdlVWeUdrMmlIWlVFdDFiVHJYZmlVMlA4V2xwSkZDQ3N5?=
 =?utf-8?B?TmhvQWVzcnliMFk4dm1OZy9oTFdFMUxpKytlWXp6RlpRenliemlXdHZyamNU?=
 =?utf-8?B?MWp3K0Q3MlE1UzRmSStLckJkaE5rL1BoazRXUU1nMTJsb29TdFRUb0EvaU4v?=
 =?utf-8?B?NmhOS3VkeXRyVG1wU1cyY1I5OTdMSlNRRURrWUFQcWFXVFUycVFhVTB5aFpU?=
 =?utf-8?B?RUNKWnp0MCsxamVWbXpUZ3cwQUhCWXh0QWg2T0VwRWlFSzdtNGtJbUdWdk1F?=
 =?utf-8?B?VHpTaitSUDAwZEpjeThtWUUxNGp0bFdCaVR0cmFIZGE2aU5XdURWVGkwTVBG?=
 =?utf-8?B?UEYyN015ZS9VTHNsV1JkalNuWGVKQ3phYjNMcVNrVXU4L2JEbkVhTkFvS3do?=
 =?utf-8?B?VDhRTFRqaVFHMG1YSkt0OFpjcTZ5SHBadERlaDIvT3Y1N2FMUzhEM1BtTUVB?=
 =?utf-8?B?bWFxVWpGTWMrOG8rd3pzcU05ejkra0dKY1JXZ3FBUll1OEZ6QUk5bHFOZzJP?=
 =?utf-8?Q?qzI2BAsJiPfIpEkglp2DcE6lH95do5gx/8CJwtu?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 8053ba4d-763b-4a82-b8f3-08d963324553
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Aug 2021 16:56:21.3514
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: G6+M73bvfYLUBiul5CQHgxfnWI2K9Xb28/WyXWpQ+WaG4FP0YaBktxKnphjtJqFZc2yrZEvIaI7ls6XSb6zMC8XQPMcu0wto7RpqXSidCfI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR03MB4487
X-OriginatorOrg: citrix.com

On 19/08/2021 17:43, Ian Jackson wrote:
> Jan Beulich writes ("preparations for 4.15.1 and 4.13.4"):
>> Ian: I did take the liberty to backport Anthony's
>>
>> 5d3e4ebb5c71 libs/foreignmemory: Fix osdep_xenforeignmemory_map prototyp=
e
> Thanks.
>
>> Beyond this I'd like the following to be considered:
>>
>> 6409210a5f51 libxencall: osdep_hypercall() should return long
>> bef64f2c0019 libxencall: introduce variant of xencall2() returning long
>> 01a2d001dea2 libxencall: Bump SONAME following new functionality
>> 6f02d1ea4a10 libxc: use multicall for memory-op on Linux (and Solaris)
> I agree these are needed.
>
> Don't we need these, or something like them in 4.14 and earlier too ?
>
>> If those are to be taken (which means in particular if the question of
>> the .so versioning can be properly sorted),
>>
>> 198a2bc6f149 x86/HVM: wire up multicalls
>>
>> is going to be required as a prereq. I have backports of all of the
>> above ready (so I could put them in if you tell me to), but for
>> 01a2d001dea2 only in its straightforward but simplistic form, which I'm
>> not sure is the right thing to do.
> So, I have queued 198a2bc6f149 too.
>
> As for the ABI: 01a2d001dea2 introduces VERS_1.3 with xencall2L.
> I think backporting it to 4.15 means declaring that that is precisely
> what VERS_1.3 is, and that any future changes must be in VERS_1.4.

Yes

>
> I checked that after the backport of 198a2bc6f149, the two files
> defining VERS_1.3 are the same.  Well, they are different because of
>   7ffbed8681a0
>   libxencall: drop bogus mentioning of xencall6()
> which is fine, since that symbol didn't exist in any version.

That's probably ok, but I'd be tempted to backport that fix too.

> So I propose to bump xencall to 1.4 in staging, to make sure we don't
> break the ABI for 1.3 by mistake.

We don't proactively bump the stable libs sonames - they get bumped on
first new addition.

Otherwise, if there is no addition between now and the 4.16 release,
then the 4.16 build will produce a libfoo.so.1.4 with 1.3's effective ABI.

The same would be true in general for every stable library we didn't
modify in a specific release cycle.

>
> Andrew Cooper writes ("Re: preparations for 4.15.1 and 4.13.4"):
>> We can backport changes in SONAME safely so long as:
>>
>> 1) We declare VERS_1.2 to be fixed and released.=C2=A0 This means that w=
e
>> bump to 1.3 for the next change, even if it is ahead of Xen 4.16 being
>> release, and
>>
>> 2) *All* ABI changes up to VERS_1.2 are backported.
> I think this is what I am doing, except that I think Andy wrote "1.2"
> instead of "1.3".  "1.2" is currently in staging-4.15, without my
> queued series.

Oops - my mistake.

>
>> The ABI called VERS_1.2 must be identical on all older branches to avoid
>> binary problems when rebuilding a package against old-xen+updates, and
>> then updating to a newer Xen.
> Indeed.  But that is less relevant than the fact that this must also
> be true for VERS_1.3 which is what we are introducing to 4.15 here :-).
>
> Andy, I usually agree with you on ABI matters.  I think I am doing
> what you mean.  Please correct me if I have misunderstood you.  If
> what I hnve done is wrong, we should revert and/or fix it quickly on
> staging-4.15.

Looks good to me.

~Andrew


