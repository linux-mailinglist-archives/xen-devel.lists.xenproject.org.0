Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CF7430FF42
	for <lists+xen-devel@lfdr.de>; Thu,  4 Feb 2021 22:24:11 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.81437.150556 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l7m6L-0004Nc-BF; Thu, 04 Feb 2021 21:23:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 81437.150556; Thu, 04 Feb 2021 21:23:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l7m6L-0004ND-7a; Thu, 04 Feb 2021 21:23:45 +0000
Received: by outflank-mailman (input) for mailman id 81437;
 Thu, 04 Feb 2021 21:23:44 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=KAxh=HG=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1l7m6J-0004N8-Po
 for xen-devel@lists.xenproject.org; Thu, 04 Feb 2021 21:23:44 +0000
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 226ca2ba-08de-4096-afad-1d2d230f74de;
 Thu, 04 Feb 2021 21:23:42 +0000 (UTC)
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
X-Inumbo-ID: 226ca2ba-08de-4096-afad-1d2d230f74de
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1612473822;
  h=subject:to:cc:references:from:message-id:date:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=E6QeFw8xwAcE5+K8wHwb/uaOF+w+rMLsifm2BpSDz7s=;
  b=He2Q2Q52G3IaoWjj+qX9gYuFJyr1P3Wl8vJKuo9QQWFrv6FhV4vRIKd7
   7ZFmkc4fH1yo/Yg4GpCh6ZCkqOXm9ixNcUzMX5roFRkLQV7xiaHzsNuEV
   g28Q1xlxOyM1GfOcoi+BnDxNYOOgCHYfknpnNPgEbFzfPScLJh2EHPbI/
   E=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: jaGDq4Xg0cAu1SqeIXRqTQOSGy8qqt/Ctuke8NqtZ+scDLh/DTlUmqiuPb2TEILbakeW34sxT7
 hCTFB59qeeMn+sRpZ1nTryBmM2TooYX0QgZQgQvCzjvakgcC+7QZTHwrY/hR1xauWaeFYu8C0a
 ycbG38jKK93Wo+I0Mryb6XYPZOo5RyzwVMKvpuGIjKOnGqOTv0ptImhWQvfa5U0pHsqE3kWDO9
 +tShPugQaNxkcIBz9hIEMORGqC9CKAZ+B6jNcOHJyeIx+RmlDFNJa1haF+OSXXsTeNzGrIcv73
 t40=
X-SBRS: 5.2
X-MesageID: 36547878
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.81,153,1610427600"; 
   d="scan'208";a="36547878"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oQiH8ImkkrAOPHslBF0GX9P1w5RbTiM1ZFAMYh52HIQ1rFe1QUQRLYWHOWx9HgmSTH6pn4+S38N/IIAzh/w69dDbDct+sbWnLSuW06Nkt1RBJ3CAi8weoiRR7cMmb6MxeDyLXWGEh+Mv6QKlC6eO+cUYdL4KfgpYK1r2DP4fveS9BQB61PYk3Bvc6BV+mbH7ye9CXDMoyzMSVzw0/R5lj1+sBJ9zE80o+C+dGtZtzatzf95cAdq1jkRITSvCLVTlHPBKd7bRhbEjA8sZgAwJ3oJc67i7VOSze3EO1DNqMw1h3bSCeuo9uYUwMOOaoHvi13XNDJNelwfchjgMPqDHFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VMv3LYQK/0CHBXpc5n3kLk7zi6yi7umBpDakIZDZya8=;
 b=OvPCLXVNFHGctWmoECrE5tEp/asAGKuzwfu7p+M9b1cIOjkxQaVEhk8Wtb5J2eXk2EfUVe1l0Bj9YplyLHCEIhrObzMDHRVmlYpknSHNyTzsMlh2/JveBDL5qiq70bQWo15npjgdb+LOHex8jAwFk7iNAnePt78m2lRVP2DyWAoY1YUx9mB/yCkVImMrNhvQOlWspCjw1Ov9QLPhW63PjhMBl/yh/ah82u5m37agk7DsGm/nwjQn2J9Khdv0k2SBu035pA8mx4PaEGLdXNBzBm7mq2z1JLuRZFDkT4pe41mtTa/0fZ6kjmKhymgCYDvqcFYyVb1Q1qby+Y+8OVypSQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VMv3LYQK/0CHBXpc5n3kLk7zi6yi7umBpDakIZDZya8=;
 b=IXJET+s3zxVxMZziMFhnfTl7Haz3CctbRNbny85PSvPtVo18wuP+YFVVWZF3JcK9A0nb4ncTcMG7up5ydNJQxg5bYPwQhe+0aJ/5u2e+4JFXGFTZNK46xlFQK2kgxHlGHyT3zat7e6E2QxcBEHGJ4PawHMMfrceW01o2iyIAVLs=
Subject: Re: [PATCH v9 01/11] xen/memory: Fix mapping grant tables with
 XENMEM_acquire_resource
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: George Dunlap <George.Dunlap@eu.citrix.com>, Ian Jackson
	<iwj@xenproject.org>, Jan Beulich <JBeulich@suse.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Wei Liu <wl@xen.org>, Julien Grall
	<julien@xen.org>, Paul Durrant <paul@xen.org>,
	=?UTF-8?Q?Micha=c5=82_Leszczy=c5=84ski?= <michal.leszczynski@cert.pl>, Hubert
 Jasudowicz <hubert.jasudowicz@cert.pl>, Tamas K Lengyel <tamas@tklengyel.com>
References: <20210201232703.29275-1-andrew.cooper3@citrix.com>
 <20210201232703.29275-2-andrew.cooper3@citrix.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <86f9845f-f0a5-93c7-0703-c3a51d50febc@citrix.com>
Date: Thu, 4 Feb 2021 21:23:31 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
In-Reply-To: <20210201232703.29275-2-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
X-ClientProxiedBy: LO4P123CA0423.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:18b::14) To BYAPR03MB4728.namprd03.prod.outlook.com
 (2603:10b6:a03:13a::24)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 038c8a9e-76da-49ff-1b39-08d8c9532311
X-MS-TrafficTypeDiagnostic: SJ0PR03MB5646:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SJ0PR03MB5646A8F6E7873EA1DF51DB16BAB39@SJ0PR03MB5646.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Uep/unc3UYteG5qYV6jM/xXGxsR04GucYayIJ45Lbj4002HgQ5um9MSe/pSKbMgJ1V8Ey5bVw2JEZIff+vLKCz42aa9FW9Da5+9AuxlhxGSHiRUhFo5gEqXzCgexaWD94CdwU2uVp4nzUEBU2bbf4l4XgCVmf45W3Aac5l2wxllB0oG5J+ax4swQTR4awmvYhx5eLFq3bvqpVbz6yCDpO2yB6DWSMxIFDb3+Q4pOEQwfAollp5yBntPSL0zFGMaPDGiCj67Mli0WfPE+VCDrr0IbwQ/I/vMBSQIaOQFYtTKuL50HaFrXCB84DnbTZXXX5MiATRzMBsRp/XY8z6AOOpl4mrgStTFloBjQpNHSkjbL7EdIZlaGV+iObUIQkEnYQmvEHrWcgPq5QmrWTBQCqEX7Z0mWdgxr58uBdVDYt6rdW7/ac6ijvM3DqaLW7wfu0bzhc8pj83S+jAjeww91Xq19pWKUR+Xu+WVxe7qgdg5AfxKsWnPe0iNholxipQzJhoezx7yXfITJlZbzmJOtzXFihVBdZx+e/Cg0Xuprk8fm7FS0LedZug0DJ03dOBW4HKAPHVVDVpM1E1RpuF5WmcX9P2TbuRA9ba1GXduH67Y=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB4728.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39860400002)(396003)(346002)(376002)(136003)(366004)(6666004)(86362001)(956004)(66476007)(31686004)(16576012)(8676002)(4326008)(66946007)(478600001)(316002)(2616005)(6916009)(53546011)(7416002)(8936002)(83380400001)(2906002)(66574015)(5660300002)(31696002)(66556008)(6486002)(16526019)(26005)(186003)(36756003)(54906003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?MGYrRklEWWpZdUdmM01VWlFNa0MrMnJjOURWdVE5ZmJwTnltNlhmbGN1Wjhs?=
 =?utf-8?B?bDFCM0s1MHVMSTR3aWJZd2lmbjVIcUxydVlwNkFxbktENHdVTXJNQzNHdjZG?=
 =?utf-8?B?UFFmTGVNRzcyeGQyNFVFaDNkZ2ZXWkxwWHZ1T1dNbFVRaDZ0Q3c1cExJTjYy?=
 =?utf-8?B?THo3Ty9NY3JQVzdGWUdJUWNjMGxOTndlaW94Q2tSMWlqODAyelRaZXRXeG9u?=
 =?utf-8?B?R1lMelNRcmFaQjhrT2VucVM5bFRRbWo0UHgxZFZqazFHeDhOUTVXQWwxYmZl?=
 =?utf-8?B?VWMyUHEwaS9RQ1NUSWJkODh2Q2t2a0NZNm8zaFpCcCtqaE1ET0FTVkVBbG9l?=
 =?utf-8?B?SDBzcnNMZDU5VVhYRXExYk9kbGUvK1JQTEhrT1kyblY3OEpWZEJla0svUmNH?=
 =?utf-8?B?dExQZkhsMmJvcWlzeDZpeW12YWdjTWQzV05SbDJYaXFUcVRSZ010VUF3dVNq?=
 =?utf-8?B?Y2dVY2gwMkZyWTBOSEVYL215Nkw2bkdtN3h6SlZnejdhdTZQQjRkanRUR0pu?=
 =?utf-8?B?bm8yN1A1R0Z3K1VHbk1YNVpQWTdYcTBlM0xNOGRXdlhHSFZScVkvdUwrdW1l?=
 =?utf-8?B?K2JwUFdjZ0JCZ2ZXa1E0a2ZsSVIxZS8xZnBVaFBSN1haREFCc0Z5OUJtbWxs?=
 =?utf-8?B?bWg1V0p4cEUwQk16d3NaazhuQTk0blVrNHg3NmRYRUxNYW5GZnRVNkp2TUlF?=
 =?utf-8?B?QUtjRUU3ZUp3VkIzZDhoZEF5UHVxbXloWHNyMVJObW1MVkZnL0ZWMDBKSlZu?=
 =?utf-8?B?RU1KTWxCbVdIY0FnOGxBbW1aWlRPeUVuS2hpYzM3Mzd3RWFBc215WXloMlVG?=
 =?utf-8?B?cHdhVEFOazdEdU00RjZiUlBwWVF6a1BXaitoL0xUMkxqcjBFYjdpVlYvUCsx?=
 =?utf-8?B?a1hqR3BiVXkxT29ONXZ4YzZVWUtUd2gyZGpibmoxYlFsa3p4dndEbDdvdTNU?=
 =?utf-8?B?SUIwZWlwNDVlQmhSdEY5R3kwZFp3WERpeFFTUm9uMDdsR2l1dEYyWi95WlBS?=
 =?utf-8?B?Vk5mdGZHTCsxT21TcmdUS2JkYUhIQXFJNVMrL0JOcVJZamlJMStYOGxCYlN1?=
 =?utf-8?B?NzdKUnhwdFBHY1NRVXNpOWVldUlqbWtOSC9yb3ZVcDRWT3dNYnhSU1RVM0R2?=
 =?utf-8?B?SzI1QjhySFF6NzNOcGhVOUd1c0dHVUhMeURuM2JXUE0rUlIrR1JQSWZHZytv?=
 =?utf-8?B?SHdZcEl4bmRxc0NjWDdrMzIwZ2kwMHY2emhxUk9Tb1d5TXd6V2JuT2MzSDdC?=
 =?utf-8?B?TzVsTHpBeUNnd2ZjZVg1WDZCcE5ScDhoWlRNdFI2QXlNNi8wUS9yb1FkRDBY?=
 =?utf-8?B?MExadnk2S0MzaXF3Q1J6SE4rWE9kNHAzZGx2aFdwUG1YUlkzd2lSV1dZVjRF?=
 =?utf-8?B?UkE4VG9GT2NDRXFzbzRVVmRHTW5GSUplbTJWZk1MUzFqZk8zUnN0d1IwTHlW?=
 =?utf-8?Q?28FFhLoP?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 038c8a9e-76da-49ff-1b39-08d8c9532311
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB4728.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Feb 2021 21:23:38.2406
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mLeQND0luqiMwRMMJQPCwoY+rBQbxp9xMp5VSiKb6lL1A3twmmiNDL817o/vbz3PowV96Fla6LNxL+vpOSHtB9Tvt+t7unG+hMWbUnBqv4c=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB5646
X-OriginatorOrg: citrix.com

On 01/02/2021 23:26, Andrew Cooper wrote:
> A guest's default number of grant frames is 64, and XENMEM_acquire_resource
> will reject an attempt to map more than 32 frames.  This limit is caused by
> the size of mfn_list[] on the stack.
>
> Fix mapping of arbitrary size requests by looping over batches of 32 in
> acquire_resource(), and using hypercall continuations when necessary.
>
> To start with, break _acquire_resource() out of acquire_resource() to cope
> with type-specific dispatching, and update the return semantics to indicate
> the number of mfns returned.  Update gnttab_acquire_resource() and x86's
> arch_acquire_resource() to match these new semantics.
>
> Have do_memory_op() pass start_extent into acquire_resource() so it can pick
> up where it left off after a continuation, and loop over batches of 32 until
> all the work is done, or a continuation needs to occur.
>
> compat_memory_op() is a bit more complicated, because it also has to marshal
> frame_list in the XLAT buffer.  Have it account for continuation information
> itself and hide details from the upper layer, so it can marshal the buffer in
> chunks if necessary.
>
> With these fixes in place, it is now possible to map the whole grant table for
> a guest.
>
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>
> ---
> CC: George Dunlap <George.Dunlap@eu.citrix.com>
> CC: Ian Jackson <iwj@xenproject.org>
> CC: Jan Beulich <JBeulich@suse.com>
> CC: Stefano Stabellini <sstabellini@kernel.org>
> CC: Wei Liu <wl@xen.org>
> CC: Julien Grall <julien@xen.org>
> CC: Paul Durrant <paul@xen.org>
> CC: Michał Leszczyński <michal.leszczynski@cert.pl>
> CC: Hubert Jasudowicz <hubert.jasudowicz@cert.pl>
> CC: Tamas K Lengyel <tamas@tklengyel.com>
>
> v9:
>  * Crash domain rather than returning late with -ERANGE/-EFAULT.
>
> v8:
>  * nat => cmp change in the start_extent check.
>  * Rebase over 'frame' and ARM/IOREQ series.
>
> v3:
>  * Spelling fixes
> ---
>  xen/common/compat/memory.c | 114 +++++++++++++++++++++++++++++++++--------
>  xen/common/grant_table.c   |   3 ++
>  xen/common/memory.c        | 124 +++++++++++++++++++++++++++++++++------------
>  3 files changed, 187 insertions(+), 54 deletions(-)

Attempt at release-ack paperwork.

This is a bugfix for an issue which doesn't manifest by in-tree default
callers, but does manifest when using the
xenforeignmemory_map_resource() interface in the expected manner.

The hypercall is made of a metadata structure, and an array of frames. 
The bug is that Xen only tolerates a maximum of 32 frames, and the
bugfix is to accept an arbitrary number of frames.


What can go wrong (other than the theoretical base case of everything,
seeing as we're talking about C in system context)?

The bugfix is basically "do { chunk_of_32(); } while ( !done );", so
we're adding in an extra loop into the hypervisor.  We could fail to
terminate the loop (possible livelock in the hypervisor), or we could
incorrectly marshal the buffer (guest kernel might receive junk instead
of the mapping they expected).

The majority of the complexity actually comes from the fact there are
two nested loops, one in the compat layer doing 32=>64 (and back)
marshalling, and one in the main layer, looping over chunks of 32
frames.  Therefore, the same risks apply at both layers.

I am certain the code is not bug free.  The compat layer here is
practically impossible to follow, and has (self inflicted) patterns
where we have to crash the guest rather than raise a clean failure, due
to an inability to unwind the fact that the upper layer decided to issue
a continuation.

There is also one bit where I literally had to give up, and put this
logic in:
> +            /*
> +             * Well... Somethings gone wrong with the two levels of chunking.
> +             * My condolences to whomever next has to debug this mess.
> +             */
> +            ASSERT_UNREACHABLE();
> +            domain_crash(current->domain);
> +            split = 0;
>              break;

Mitigations to these risks are thus:

* Explicit use of failsafe coding patterns, will break out of the loops
and pass -EINVAL back to the caller, or crashing the domain when we
can't figure out how to pass an error back safely.

* This codepath codepath gets used multiple times on every single VM
boot, so will get ample testing from the in-tree caller point of view,
as soon as OSSTest starts running.

* The IPT series (which discovered this mess to start with) shows that,
in addition to the in-tree paths working, the >32 frame mappings appear
to work correctly.

* An in-tree unit test exercising this codepath in a way which
demonstrates this bug.  Further work planned for this test.

* Some incredibly invasive Xen+XTF testing to prove the correctness of
the marshalling.  Not suitable for committing, but available for
inspection/query.  In particular, this covers aspects of the logic with
won't get any practical testing elsewhere.


Overall, if there are bugs, they're very likely to be spotted by OSSTest
in short order.

~Andrew

