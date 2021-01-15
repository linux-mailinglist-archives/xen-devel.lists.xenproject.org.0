Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B3542F82BF
	for <lists+xen-devel@lfdr.de>; Fri, 15 Jan 2021 18:44:18 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.68478.122629 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l0T8e-0001wA-OY; Fri, 15 Jan 2021 17:43:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 68478.122629; Fri, 15 Jan 2021 17:43:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l0T8e-0001vo-LL; Fri, 15 Jan 2021 17:43:56 +0000
Received: by outflank-mailman (input) for mailman id 68478;
 Fri, 15 Jan 2021 17:43:54 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+hG6=GS=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1l0T8c-0001vj-Pj
 for xen-devel@lists.xenproject.org; Fri, 15 Jan 2021 17:43:54 +0000
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 7fda2e1f-fa32-40fb-8585-5025bb1837f7;
 Fri, 15 Jan 2021 17:43:51 +0000 (UTC)
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
X-Inumbo-ID: 7fda2e1f-fa32-40fb-8585-5025bb1837f7
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1610732631;
  h=subject:to:cc:references:from:message-id:date:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=vUX/m6ved6BItJKcqXyAZlkimWtlc5+oOL94ZjEiRIk=;
  b=R+TrRMBDsKosTKOayChBgkZR4UXhqzLhvowfL7anV/1mxV5wu49iYH1X
   oKouUWrs0t9mV0M+JeOjHINh4r9vle6ffbMIQLWsg31z+yw08qq4ZvGI/
   ME6idrCFipB5uQFoRin1jGFla4/6LY42cUJtkVL8UVPY7VXPMGQapmHcC
   g=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: Pol2fCPY3TChQH3wv8+8xsQvpsofgzQ+4iF7ixEtBKm1pNRaPK1iIM2ahGodTks1uVCwAr2PP/
 NXec+wcrkpfkdwCPJPE6WMAOork1DlJQYHXUbQSBt7JeuxKsT77PyuxiVz6H48KrvZigf2/+Dd
 OCk1L09AV4SmVHg4/BZRq5XEeOyuownm4UtRSi+Qa0x8H7pX9NkPnhjwtD5lxXrwY2UmL5fprP
 8AHxQFQpcg0VpLlKtqdXQcdV2xdvXor14i5Z7G8wEx+D4+Ew9MfTnkbqjxCKb1s7Q5+lS+nhsH
 nJU=
X-SBRS: 5.2
X-MesageID: 35241776
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.79,350,1602561600"; 
   d="scan'208";a="35241776"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ajLs4c/BYL3C5BCZWU80vMsAOUaf9U4u+67+X+1Bz+X8ZE1Z+Kymo5Hx00ZYjeeBWmCsHfRzsRy92Di0mp7bk1xjK99Q2ctBtFopcRgfY5mKPcaya9CXeczUuKAxPnbowhW0xxQ/+Zo1fQKZsR4sZUtSgM9r7RbagckzXwrvqArmPqFpMR0Zt84hX8mbP9/PtxexwCSOO5TUCOhv+kuxKynD9ej4/xFEcrYnqNqimUDHgyhIjbA4m1MN1SVQxCLMl9nOgffQZHybroggaVLABcS1lnx48syKxH1ByqQfnRMEdArk9pVVAsBzn5X+t4LqaONUCBBb+Y1NThmZl9SsBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=N4H9VpFK00uwBl0he/8lHRcNyAUIQNCwiupTYWoJzRQ=;
 b=Q9sf6uPuOjD2CIht3OzYHXRMvotoLG4u9G1BmLZ+gmNJEgOH6dwCJCNnuRHsMaAtEywRD9p2YYdQi+z3STf3ALEtzKV6YAYd78+5BmwAlHriCXKnhRtft5qnvQyQ/+Wu6CO5U+nBM+zMRDdQP6v1OzTlYQ+cKfHmYeSBkQDQFcT9cLfcbGzh6JTUZMQZGEKSsWf/O+2aSDKtFtRuKJAsvPRX+rJDVoWY/X5+FBCKiUv0nmXUcCJKwk5/LZm9apPxZC60Gzi4/Nv8S1RZ/7yoi34080eR35N/1TTWRORuJtyq+f12BvgwTbwQlY6+Yq0TTt521k0ydMi8kYgm6RZaew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=N4H9VpFK00uwBl0he/8lHRcNyAUIQNCwiupTYWoJzRQ=;
 b=mgVR4SjAG536DiM9cpGntC5Iib1ekvcI0YzGSZmpiNcMVt40sxN1xls6uwp3asI1sLn9G9m1Ob2QdFCwQCh1oKbRNKOYVxjlx4a8mS6DGPuSq/gFW4jgxc64zCNnJoFczI2lDnOpHgvAtsV84KI5V0HxPE4yrBKlWhkzz0kUXuw=
Subject: Re: Proposal - lightweight auto test binaries
To: =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?=
	<marmarek@invisiblethingslab.com>
CC: Ian Jackson <iwj@xenproject.org>, <xen-devel@lists.xenproject.org>, Wei
 Liu <wl@xen.org>, Juergen Gross <jgross@suse.com>
References: <24573.56774.41487.933922@mariner.uk.xensource.com>
 <1623bbc5-5258-30eb-2e1a-7c9b0f27fbd7@cam.ac.uk>
 <20210113180244.GA1592@mail-itl>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <f1a0cadc-07fc-4f6a-b7d9-eb08813ae606@citrix.com>
Date: Fri, 15 Jan 2021 17:43:40 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
In-Reply-To: <20210113180244.GA1592@mail-itl>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
X-ClientProxiedBy: LO4P123CA0053.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:152::22) To BYAPR03MB4728.namprd03.prod.outlook.com
 (2603:10b6:a03:13a::24)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 10193afc-8820-4d1b-4254-08d8b97d1c09
X-MS-TrafficTypeDiagnostic: BYAPR03MB4262:
X-Microsoft-Antispam-PRVS: <BYAPR03MB426271C3512DB0943EEF89D2BAA70@BYAPR03MB4262.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 4UGRx3JaYxeHNEta0GwPnNTPhsFq/Y9QQBEYP+vdf1La6EErI/Yhb1T4CpU6z8ZdRT/wVZKGPuWwk9/MHYrsoKCLLSIwvMR95ZEakCha/fbQA0pJWFQoq+PMq6EPm+py9TkBIwxvO1G6SNLcb6k+KlOeDdSD4xEOI2mfFfOTWMF15yEr22q7fsW8bCLSW+yJ7HwSW+7xVt4MYeSM3NxaTwh7BqxK0N2UCAGgW0NFXhxXwd2708gTnt1vlajrQTi7nnO5h3Wx0vcamZ6kCTJu6SP92JPei1CP2hh3A60eSxyiSyhK+NxHRMdORPNlwRlOa3wwgwNnM/gQinsX24QuYfUIZtkQBWltqWfhN/YfKWE8RqaM8eyIrQgrV9TJv0aN1Qd3fSmgMjFsC6kkamtrY0V7I9bpWcaofQg8RIfxDmogKZ4Nyo3uYKuzUvI1ldTFxHmeAaW275IX8zYGPCSFtTCwLAnu8TMCWskADS+upOs=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB4728.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(366004)(136003)(346002)(376002)(39860400002)(316002)(8676002)(6486002)(16576012)(31696002)(16526019)(2906002)(31686004)(6666004)(4326008)(66574015)(6916009)(54906003)(66946007)(66556008)(186003)(86362001)(956004)(66476007)(26005)(478600001)(2616005)(83380400001)(36756003)(5660300002)(8936002)(53546011)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?d2JsZVFrNExyMUFQQnFHbEpiRWxLbDZ3MkxJKzdmczU1cnpyRERyZTFsY3k5?=
 =?utf-8?B?ZytqRkQyWEJSNDcwZDVSeEUrUnVmYWtzZFlrVTdlSW1Da1hCejVuaTY0NWQ2?=
 =?utf-8?B?QmRzUnZJYnhxcnU0OW5GdTVZR1VYMFlJTXkxVWEzK1pLR1pvcFQ5emdDdjdl?=
 =?utf-8?B?L3VjL2hqWnVYclZqM1psa3dUWjQyNWF5S2pvTXRnL2g2M3RQMTBjV0FJZ3hB?=
 =?utf-8?B?UmRDalY4V2oyRXVsY0Q4Zm9SMUtGOVpjUzRSSm11K0JkdzVDN2hFQURSdWxG?=
 =?utf-8?B?MHU1OXRwS1FOUjliWStRVlVHb283d0FtZXRGM1VTYkFIdW9xd2hDSlVNdlNp?=
 =?utf-8?B?YU9LeEV2SUh6Mmt0bXZEK1doTGRJU29HbExCRmVYVFZmb0wxZDhkbnZLQjFv?=
 =?utf-8?B?ZjlvckVUQ1pqeE9ZZDlSbFNGV3UrbXFCN1ZYcG1velZWT2I5aVdlb2lCTUdp?=
 =?utf-8?B?MTBJNEp4ZWNiSVEwRFpaV2luZGFObk93NXlqbFIwTW1OYzJyV3dDU0F2RUNU?=
 =?utf-8?B?ZXpzam1LSHZHRFRMbFRhZytIM3M3ZWh1MzlQenQxTEFheEdvbDZ2UlRIaDNs?=
 =?utf-8?B?REtseUNaMjFMZE9oNFM2eFZ2R2k2cm5HYThFYWNLdUord0tUanY3WWtkTCs2?=
 =?utf-8?B?U0RHNlNCdlRqb2lUU0RSSHBTZXJVczVvMU5FTUdXVW5tU2Z2OVdzRGp0ODFu?=
 =?utf-8?B?bHhBbEhGZk16VFIxYnNIR3p2dkM3T21zOVNjUXdlL3VVQ2dVNkl2bVRmNUpT?=
 =?utf-8?B?RHlvdFkyODRDTkt6ZlNBczUweVNvbjM2dkVkQUFSSC9SNTNZSVRGRitwRWxQ?=
 =?utf-8?B?YksySlV0RDBkR3VSak9oeVA2M04xa1FSMUtsbGxnTXJCaTRVVlRhc2wzeUhX?=
 =?utf-8?B?QjJIMC95ZXhBUC9OWFBKZmZJK1o4YU9KZ3dVdmJHRldBd2lPR1lHVU1sUERW?=
 =?utf-8?B?WkJ4RjZPZXg3K3FWTHBZNXdiNGRzaDl1NzBVWHh1QU5TbGhTZkkydXZ2UHpF?=
 =?utf-8?B?OE9JVU1wdnk2SXhsSUN2OWFuU2ZTc3l5SndxZ1NNMHRDalFvUnpaVC9Ha0Rk?=
 =?utf-8?B?RVdaSG1pUjhTZENJQlZ1WUx2QzRTZW5sdjhCQ0JjM1FpQWtxVTJWMFQzQTE3?=
 =?utf-8?B?bkt6aUl6amRNOFNKR1pBVmdEV1VUL09wMFNlekpTSmRJNnplSE5NWHNoWjl6?=
 =?utf-8?B?VVZEU1VVRUtvRVYxV1lPcWYvV3VpKzduTVdnTCtHbmRVN0NLVzYvbGJ1M1RR?=
 =?utf-8?B?NTNpUnFUWUFNU05vSjBnVysrOFU3NmdMOGxyRnQwWXpjbDBiRVBuLy9PcnU4?=
 =?utf-8?Q?OWMhcxdNjeTUI1gafB+k/utS4TYF1ofpm2?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 10193afc-8820-4d1b-4254-08d8b97d1c09
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB4728.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jan 2021 17:43:46.8142
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ezU4hQzgGr8TA+hRqoCmhE+r2XhKMDybyPA3N1pCFS593j2xWYNx+saCyOC9ghArrP/dPylWQWfN37V/AspzW5qo7jPBbp+XotNZgUeCFM8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR03MB4262
X-OriginatorOrg: citrix.com

On 13/01/2021 18:02, Marek Marczykowski-Górecki wrote:
> On Wed, Jan 13, 2021 at 03:45:10PM +0000, Andrew Cooper wrote:
>> On 12/01/2021 17:35, Ian Jackson wrote:
>>>  * When appropriately configured, the xen.git build system
>>>    will ship them into dist/install/usr/local/....
>>>
>>>  * There will be a specific directory containing tests which
>>>    are suitable for running automatically:
>>>       dist/install/usr/local/lib/xen/autotests
>>>
>>>  * The pass/success reporting API will be encoded into the
>>>    filename.  For now we define only one API:
>>>      dist/install/usr/local/lib/xen/autotests/simple/*
>> Whatever we go for, it ought to be an easy path, and honestly - that's a
>> mouthful to get to.  These tests need to be just as easy for developers
>> to use.
>>
>> How about opt/xen-autotest/* ?  Much easier in a deb/rpm build to filter
>> the things which clearly shouldn't be in a production system.  It's also
>> invariant of libdir which is an advantage for downstreams who test on
>> more than one distro.
> I can see them being packaged as a separate sub-package instead of not
> packaging at all. And many distributions have rules forbidding native
> packages form putting stuff into /opt. So a location somewhere in /usr
> would be preferable.
> I'm fine with dist/install/usr/local/lib/xen/autotests.
> For running manually, there could be a trivial test runner (shell
> script) that could be installed into dist/install/usr/local/sbin - to
> make it even more convenient to access.

local, or not, is down to --prefix, but I do like the idea of having a
trivial test runner put into sbin for humans to use.

Automation such as OSSTest and XenRT will want to track tests
individually for reporting and/or regression purposes.  But humans
wanting to test their change want an easy "run everything and confirm ok".

This is precisely why `./xtf-runner -aqq` exists.

>>>  * A test may exit with one of the XTF exit statuses:
>>>           0 # XTF SUCCESS
>>>           3 # XTF SKIP
>>>           4 # XTF ERROR
>>>           5 # XTF FAILURE
>>>           6 # XTF CRASH
>>>    (osstest will treat anything other than 0 and 3 as "fail")
>>>    Any other termination should be treated as CRASH.
>>>
>>>  * If a test exits nonzero it should print some information about
>>>    the situation to stderr.
>>>
>>>  * Tests may print other information to stderr, which will be captured
>>>    and logged.
>>>
>>>  * Tests *must not* print anything to stdout.  Test runners *must*
>>>    ignore stdout (though they may log it, possibly mixed in with
>>>    stderr).  stdout is reserved for future extension.
>> I disagree.  It is far more important that the tests are pleasant for
>> humans to use, both in terms of developing them to begin with, and
>> maintaining them if they go wrong.
> I can see why such restriction would be useful for future extensions,
> but I don't think it's strictly necessary. An extension can for example
> require stdout lines with a specific prefix and ignore others.

If it comes down to it, we can define a new ABI if we need to make an
change, and can't find a compatible way of doing it.

But I don't see this plausibly happening for "simple".

>>>  * Tests should exit with XTF ERROR if they are passed any arguments.
>> ./test-foo --debug-this-harder would be a perfectly reasonable thing for
>> a human to use to investigate problems, and it is what we use in the
>> fuzzing harnesses for investigating crashes.
> A data point: libvirt test suite have very same requirement - test
> binaries needs to be run without an argument and error when they get
> one. In addition to the error, you get a help message with env variables
> to use instead (VIR_TEST_DEBUG=1 for example). And I do run it with some
> dummy argument, to get this help message, because I can't remember how
> those variables are named. Every single time.
> But TBH, if parameters wouldn't be very obvious (like --verbose, or
> --debug), I'd run --help first too.
>
> In any case, unknown command like arguments should result in an error.

It's somewhat rude to lump every test with needing to use getopt, but I
suppose we ought to do something.

>> The problem is "for these configurations".  Even at the totally basic level,
>>
>> * PV and Shadow are conditional on Xen's Kconfig.
>> * PV32 is further conditional on command line settings, and/or whether
>> the hardware supports CET-SS.
>> * HVM is dependent on Kconfig, hardware, firmware and command line
>> settings.  HAP similarly.
>>
>> `xl create` doesn't handle missing CONFIG_SHADOW, or PV32 being disabled
>> cleanly, despite having suitable information available in `xl info`. 
>> While this can (and should) be fixed, its not helpful for the more
>> general testing case.
> It indeed is an issue, but in practice this can be worked up
> incrementally - when the test fails, see if the reason is unsupported
> (by the test) configuration. And if so - add a condition for this
> specific case (to return SKIP or choose another configuration). Rinse
> and repeat.

That isn't robust.  For the examples given, they all yield EOPNOTSUPP,
and from that alone, you can't distinguish "Xen really can't do $X" from
"Someone regressed Xen's logic", but you can't distinguish "shadow
unavailable" from "HVM unavailable" like this.

Really, what you want is:

if ( xen claims feature $X )
    success = ("text $X" == SUCCESS)
else
    success = ("test $X" == EOPNOTSUPP)

Because that will allow you to spot "someone broke the domain
construction logic around $X".


Combined with the orchestration framework's idea of "what should Xen be
able to do", you also have:

success = ("xen claims $X" == "xen ought to claim $X")

which allows you to spot "someone broke Xen's ability to spot/enable $X
on boot".


Other similar testable areas here are:

foreach interesting CPUID bit:
    if ( bit supported in guest )
        success = ("vm configured with $X" == "$X visible in guest") &&
                   ("vm configured without $X" == "$X not visible in guest")
    else
        success = "vm configured with $X" rejected during construction


There is absolutely a time and a place for the simple tests, and there
is a lot of value in having them, but a small piece of C isn't capable
of doing this higher level reasoning.

Reasoning this fine grained *is* important given the shear complexity of
virtualisation, and I fully intend that the "simple", and this
"not-quite-so-simple" set of autotests will be sufficiently quick as to
be minutes worth of testing, and live in the Gitlab/patchew pre-commit
testing.

~Andrew

P.S. if its not already clear by now, I've spent a lot of time trying to
figure out how to turn "something, somewhere, went wrong" bug reports
into something more useful for a test robot to report, at the point that
it has figured out that something went wrong.

