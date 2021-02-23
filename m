Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 20287322E6F
	for <lists+xen-devel@lfdr.de>; Tue, 23 Feb 2021 17:11:28 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.88881.167273 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lEaHN-0006Pj-7j; Tue, 23 Feb 2021 16:11:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 88881.167273; Tue, 23 Feb 2021 16:11:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lEaHN-0006PH-3L; Tue, 23 Feb 2021 16:11:17 +0000
Received: by outflank-mailman (input) for mailman id 88881;
 Tue, 23 Feb 2021 16:11:15 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=UeLE=HZ=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1lEaHL-0006PA-EP
 for xen-devel@lists.xenproject.org; Tue, 23 Feb 2021 16:11:15 +0000
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id a5c6574e-51da-466a-8be0-f9538bb9b015;
 Tue, 23 Feb 2021 16:11:14 +0000 (UTC)
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
X-Inumbo-ID: a5c6574e-51da-466a-8be0-f9538bb9b015
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1614096674;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=GMAvHhBZ4kHJNR00wvWm1wUpfp5Z1cl6G21K5K7JKPU=;
  b=Gf9WiEQcVOkhvpaHgjwK3SVeCEso/ZfrfQ6F+HcHeElF6xuKI/kCuJSB
   wdvlkqBBtpjaYZQ+qjQ0MGYpPL5TQHPHL7Kn8rOWGQ16k5yrT2j9BrFxh
   /m599abEoRVwYn/UXdiBYa0T/REgaQpxg7Fa+unsbf21GUnSw86r0yRY0
   0=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: xJ0uFc0bob3OeP2mDDVoKNhqkQG8YsZJ8Yw2OOjzCpNvPRLsUoVn6BJrFj4DvKwKXNsdFMBq6n
 dDbw3Q425J+2qKxSvh3ucE0iHwX33Bghe0JHOyWa3kAa/mwdpK/E8y2c1yk/4mobZp4W8ES7I8
 Hkz2hFOwd653F3elEQT1/+ISadjcbYrppVt5SPr0dL69Zv0725yeWW7wl1unhVjVkvZQ+JasBW
 q0alV1dp3MZR/nqHG4RWcVTAJ0AXYHMJ2At+HINs+FxMks7nomBn96vy99fxIO/YX4ZVMIAule
 25Q=
X-SBRS: None
X-MesageID: 37769854
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.81,200,1610427600"; 
   d="scan'208";a="37769854"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MUoPU8HNRedOJFDKOBXUeNmTknObLPHewQJtrjt/x6MaW31JJhwYmz5tXVS4NbadywdSf0W4wEXJMb13xotjiwr36iK8envUbUkj8MVjjIZWy5qGzAizDo5N5gM/yKajSuo0EPemJVnYl7mM6ArCjTmfwd2Q3C38OM+QIZi633SZ4C8vTdc5uSu7GpC5+HoPHvxP/hXbiM4mGXhRVyygOWdEn6p1IcaN379tlcfq6SZRlcH+Wygafrubz0I5WO9mUbU+Cq5NoXx9Di3w/y4h9PLEruyvG8iZkHovByQ/C8R+ajXhBjq1hpMhioRdpXEDetqBWPKoUpfAzq6JLAfREw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hv04ppCqndpvRQCyHm3bZB5wiK7zxXlt/61PCaJpAXc=;
 b=S+x8U1ZxioBO/Hhmq5OdTWJZ/6Mq/AERpLlwqTTb2N4cm13sVKzkHA2XGbLJpKYt34u/L6JrVujIUKERDwNdu/9IDU51MmZoslrLne5yweVv7yoxTIa5qXbrXYddgYlgsW9doTABp4shoU6FHTEyF/FI9tzqyg0ZTnmJvupSYAMEnVDGO0Porqv0ohAU5EafxfRcmen0nSSleircJ1e8Kf4tZLWclQVdj+zdcclgigX5KXfUT6o3KgByCx+FQNSY63sKwNJefz0F3NARSvhZ/Ra2+5JOhXlzUa6B0rjZ1U+r+CcrfmBZicSUtaZmSkx3R5w8d+qdSL6au+gurxcyHA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hv04ppCqndpvRQCyHm3bZB5wiK7zxXlt/61PCaJpAXc=;
 b=MbG4yQv+/e6FZMPpXYlrJOPO62XjMPdKyvP7j03xd8TakTKJTyWsDvi1CtlXezmofAQIwm/snM/MGRQea2CLjdAQgAe6qMCJvUpyG3xS0PO2COFab8yGMGlfceXPY0xibs/lPlMpl6yOHR2iV5tX7bc6lCtkSB8pmQF68j5e0Gg=
Date: Tue, 23 Feb 2021 17:11:03 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Boris Ostrovsky <boris.ostrovsky@oracle.com>
CC: Jan Beulich <jbeulich@suse.com>, <andrew.cooper3@citrix.com>,
	<xen-devel@lists.xenproject.org>, <iwj@xenproject.org>, <wl@xen.org>,
	<anthony.perard@citrix.com>, <jun.nakajima@intel.com>, <kevin.tian@intel.com>
Subject: Re: [PATCH v2 2/4] x86: Introduce MSR_UNHANDLED
Message-ID: <YDUpF8gf6fbm4ouQ@Air-de-Roger>
References: <YC5GrgqwsR/eBwpy@Air-de-Roger>
 <4e585daa-f255-fbff-d1cf-38ef49f146f5@oracle.com>
 <YDOQvU1h8zpOv5PH@Air-de-Roger>
 <ce2ef7a3-0583-ffff-182a-0ab078f45b82@oracle.com>
 <307a4765-1c54-63fd-b3fb-ecb47ba3dbca@suse.com>
 <YDTMIW5vBe0IncVR@Air-de-Roger>
 <2744f277-06fb-e49f-2023-0ec6175259dd@suse.com>
 <YDTyScmud26aiaMi@Air-de-Roger>
 <172dfcab-9366-47f0-9c56-2202a8b7a7db@suse.com>
 <3ae19e76-2543-28f4-9c7f-697ccf9ed202@oracle.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <3ae19e76-2543-28f4-9c7f-697ccf9ed202@oracle.com>
X-ClientProxiedBy: PR1P264CA0029.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:102:19f::16) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c9dc5841-66ac-4431-3fa9-08d8d815a126
X-MS-TrafficTypeDiagnostic: DM5PR03MB3065:
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM5PR03MB3065031B654B7A0B3493EC638F809@DM5PR03MB3065.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 741MvTSetGTB+B3zH7rcwq4zVAMyy0DL6m4Ihc//HO3zgwq/9U4bOlHtWfjEwrMPojC3CbeUUPJYvbhYMH7h85dIvHJccHEgyyQToTMRlVAW3ef22G32COxgI+NHcN/2vhJPcJ5z3kc/Hlw21YRKOoUSbQBv+8O4D4fw1V2DGodtUqiT0D1+GUvEaWIJVnUxvVhyeA004c1qBzm9vSAK4zowlm7FNsbLHwusqSj4TO1++8e0QBS7lYOrIIw9VySXEFWIbQIX8nCduVI9o55bZeTWWJwDw+GLXkWLI80ShY8yEZiC8OTV8IuxBeXtyrYKYElYtOMJQZya2/ifj+mle2RXl/V4tuKaeuPgy7Hmsb8oCnmDrYpE3j/74hKyF5AIAvXB5t475VwOXmEX2idjrT/EY3MRBymID+1fFF/6p2RttIMvQal33D3XMDMPZcIai6JIcbkv24JdwwEFvZhpY3Sos2xZDvEAZEJf/Ehlj/UzwLfqMo591z9+Lum3UqPIamLPNutwsD/kAkDYs808MA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(7916004)(136003)(396003)(346002)(39860400002)(376002)(366004)(26005)(5660300002)(2906002)(33716001)(66556008)(956004)(4326008)(6496006)(53546011)(8936002)(8676002)(6666004)(16526019)(85182001)(6916009)(66476007)(9686003)(186003)(6486002)(83380400001)(66946007)(86362001)(316002)(478600001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?TTJYUFdVcGErNXhRWVRLZ3ptczk5bnhmMDBrYVlwVUczK1dnMy9NRW5pWU1C?=
 =?utf-8?B?blVpL01JRGtvakNBNE5xUzRuOW03eSs3cEpnZFBZSVBUVXNJdndBMEY1dE9H?=
 =?utf-8?B?QTQyS081N2xBQyt6SmJ1RUdOeFVDbEgrNnhYNGdiY2RTdm90MGo1ZFg1dlJ6?=
 =?utf-8?B?em4rcmNGYVRYa3dpWHN1ZFQ5S2VGU0J2YkFOMHpCNFNPVllXdXdTd1lRRUU4?=
 =?utf-8?B?SVJGRXlJNWhIdEdaVXllbkJWU2ZjZFdSdVFLRGZTQ1hQSGNxemRBVk53NElY?=
 =?utf-8?B?Y2JwcndtUzNNNDB3UDNDN0FhVmpxenBpcWNobjlzRDhWcWJCV2hqQ0lobmlo?=
 =?utf-8?B?d2RiUGJVR2hYWDBCbnN0R3hjR2k5aWtMMFloYXpLT0hEbzZENW1aM2Z1QVpw?=
 =?utf-8?B?b1RabXg1YzRkOGc2SWwyRXptQkNUZW8zSUoyMFAzVEVHL3BPWGFGZ3JWYk50?=
 =?utf-8?B?ZUtCSEZlOU5MOVNxWFFjN1NINlUvZC9wT0N2cnNnY1R4N1FUTmJLU3gvRVRX?=
 =?utf-8?B?MUhTMEc4bUxQeFppQUc5cHUwNjBZd1hEN1d2aEdDUFVOYTZYVytEMzZDMzZm?=
 =?utf-8?B?QXM1eUpPa1dCNFc0c0ZKbGo2KzFLM0dJd1hEdGdRZUpFVlVTZWwxS3hQNmdy?=
 =?utf-8?B?aWgwT09iR1FYM2ZLUDhwYStkd0txTEM3cXgweklDVjBwbzlZbXB5N2JQTGgz?=
 =?utf-8?B?YWZwbnl0emh3M1NrbFkxTk81V0NyQmF4T3hhSVV6Z0J3alB1MlNPY1o3Y0hp?=
 =?utf-8?B?NGlsSUR3dEMwV21uaU9lWTNuN1k5MmhCTFVOaUtGcWtuVk9QdDZzb2pOTkd4?=
 =?utf-8?B?Y2FzbHhVa3EzTGFRS05kaDJtSml5cHIwTU14eXg2eVpDOGFxOG1jK2xFUXdk?=
 =?utf-8?B?aXlENlhncWpCRytTMFVBc3ZmMXdFK2Z1ZlJKeExIeE16emJsZGFjMkQ1c1h5?=
 =?utf-8?B?RGRZd2pXRFlML2R0MUlGTkxwVTF1OHUvdnlXL3YrRHlVcHBxTk5mcEJtRjBw?=
 =?utf-8?B?alRMZ2lWM04yckx3c1JzcWVOTFZVVVlBa2xRbFlramZ0TlNGWmM1dmdvdVZB?=
 =?utf-8?B?SmIvaFNsYlBObDZRa3FZZVN3UkF5Q2dIdlBFeUJHcG1uVDA3bTFXcG0wRlJS?=
 =?utf-8?B?RWw0VERjT1ZRRXVpNG12ZnpMSTd3d0tEc0JYSFR2RmZ2R1IrOGlBeWVWRHF1?=
 =?utf-8?B?MG4vQktmaC9Pa1dhdG8vSVJDT3NjZC9hU01TeUI5cklISUl2Vm01ZFlEeUc0?=
 =?utf-8?B?OFQ3MGl4bmZYT2NrVXJZcDBHTmNOQy9qK3RSTzM5QitZSVZaY3kvL2FBOGd1?=
 =?utf-8?B?MXJvTnVWS3c0bDZrL1lpanBDVStMTmpISEx1bVJoeU5Sb0ZSc3VEeUt6SStp?=
 =?utf-8?B?SWpDWmMreFJESnZtSVg1ckJhaGQzdjFOZjQrYjFtZnV6QyszaTNkUUlHU0lm?=
 =?utf-8?B?TDNCT1hwTi9CWVdhSkZWZmVDbWZtQm52bFZJaERmVEsxdkFyK0t3amVVR04v?=
 =?utf-8?B?SzgrSEZXeUVDT1RoY3BwWnJxT0NoWmhmcE5NQUtGUjZBSkxMUFVabkE4QUpB?=
 =?utf-8?B?UmlOSmxudEtsR2c1aWt2U0M5emE2ZjVVUnE4Vm56emhyWk1YZDNXUmpobFRJ?=
 =?utf-8?B?WUEzUm5CWm9aRmlSV1h2b0krTUtKS0xWS0RrcXNlaGZiek9IOWZwamNBT3Iw?=
 =?utf-8?B?aVRNb1dCVXo3VDZuL1ZsVU12QS9Pbm5xNGg3enJRbkpuV3RDK00zMy8rQ3ZT?=
 =?utf-8?B?aXJXd0VvUkN0Vmg3VnBGV2ZxQkUyVXlMRElOU2pkZkhuVUhrL09CbDMyOEVv?=
 =?utf-8?B?YXBBSE9OMVk5RnJreFN3QT09?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c9dc5841-66ac-4431-3fa9-08d8d815a126
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Feb 2021 16:11:08.4019
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dscUJWrfmCYVyQI+9RFBqGjACMdMXLhVEpu+1Kh3KhJqeWmsxZ83icWrlFrU5YrkK+lVn9EzH9SMAZi4gYvKmA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR03MB3065
X-OriginatorOrg: citrix.com

On Tue, Feb 23, 2021 at 10:39:48AM -0500, Boris Ostrovsky wrote:
> 
> On 2/23/21 8:23 AM, Jan Beulich wrote:
> > On 23.02.2021 13:17, Roger Pau Monné wrote:
> >> On Tue, Feb 23, 2021 at 11:15:31AM +0100, Jan Beulich wrote:
> >>> On 23.02.2021 10:34, Roger Pau Monné wrote:
> >>>> On Tue, Feb 23, 2021 at 08:57:00AM +0100, Jan Beulich wrote:
> >>>>> On 22.02.2021 22:19, Boris Ostrovsky wrote:
> >>>>>> On 2/22/21 6:08 AM, Roger Pau Monné wrote:
> >>>>>>> On Fri, Feb 19, 2021 at 09:56:32AM -0500, Boris Ostrovsky wrote:
> >>>>>>>> On 2/18/21 5:51 AM, Roger Pau Monné wrote:
> >>>>>>>>> On Wed, Jan 20, 2021 at 05:49:10PM -0500, Boris Ostrovsky wrote:
> >>>>>>>>>> When toolstack updates MSR policy, this MSR offset (which is the last
> >>>>>>>>>> index in the hypervisor MSR range) is used to indicate hypervisor
> >>>>>>>>>> behavior when guest accesses an MSR which is not explicitly emulated.
> >>>>>>>>> It's kind of weird to use an MSR to store this. I assume this is done
> >>>>>>>>> for migration reasons?
> >>>>>>>> Not really. It just seemed to me that MSR policy is the logical place to do that. Because it *is* a policy of how to deal with such accesses, isn't it?
> >>>>>>> I agree that using the msr_policy seems like the most suitable place
> >>>>>>> to convey this information between the toolstack and Xen. I wonder if
> >>>>>>> it would be fine to have fields in msr_policy that don't directly
> >>>>>>> translate into an MSR value?
> >>>>>>
> >>>>>> We have xen_msr_entry_t.flags that we can use when passing policy array back and forth. Then we can ignore xen_msr_entry_t.idx for that entry (although in earlier version of this series Jan preferred to use idx and leave flags alone).
> >>>>> Which, just to clarify, was not the least because of the flags
> >>>>> field being per-entry, i.e. per MSR, while here we want a global
> >>>>> indicator.
> >>>> We could exploit a bit the xen_msr_entry_t structure and use it
> >>>> like:
> >>>>
> >>>> typedef struct xen_msr_entry {
> >>>>     uint32_t idx;
> >>>> #define XEN_MSR_IGNORE (1u << 0)
> >>>>     uint32_t flags;
> >>>>     uint64_t val;
> >>>> } xen_msr_entry_t;
> >>>>
> >>>> Then use the idx and val fields to signal the start and size of the
> >>>> range to ignore accesses to when XEN_MSR_IGNORE is set in the flags
> >>>> field?
> >>>>
> >>>> xen_msr_entry_t = {
> >>>>     .idx = 0,
> >>>>     .val = 0xffffffff,
> >>>>     .flags = XEN_MSR_IGNORE,
> >>>> };
> >>>>
> >>>> Would be equivalent to ignoring accesses to the whole MSR range.
> >>>>
> >>>> This would allow selectively selecting which MSRs to ignore, while
> >>>> not wasting a MSR itself to convey the information?
> >>> Hmm, yes, the added flexibility would be nice from an abstract pov
> >>> (not sure how relevant it would be to Solaris'es issue). But my
> >>> dislike of using a flag which is meaningless in ordinary entries
> >>> remains, as was voiced against Boris'es original version.
> >> I understand the flags field is meaningless for regular MSRs, but I
> >> don't see why it would be an issue to start using it for this specific
> >> case of registering ranges of ignored MSRs.
> > It's not an "issue", it is - as said - my dislike. However, the way
> > it is in your proposal it is perhaps indeed not as bad as in Boris'es
> > original one: The flag now designates the purpose of the entry, and
> > the other two fields still have a meaning. Hence I was wrong to state
> > that it's "meaningless" - it now is required to be clear for
> > "ordinary" entries.
> >
> > In principle there could then also be multiple such entries / ranges.
> 
> 
> TBH I am not sold on usefulness of multiple ranges but if both of you feel it can be handy I'll do that, using Roger's proposal above. (Would it make sense to make val a union with, say, size or should the context be clear from flag's value?)

Doing an union with { val, size } would be fine for me, I'm also fine
with not doing it though.

> 
> Before I do that though --- what was the conclusion on verbosity control?

Ideally I would like to find a way to have a more generic interface to
change verbosity level on a per-guest basis, but I haven't looked at
all about how to do that, neither I think it would be acceptable to
put that burden on you.

Maybe we could introduce another flag to set whether ignored MSRs
should be logged, as that would be easier to implement?

I think in that case we could enforce that either all ranges have the
flag set or not, in order to prevent ending up tracking two different
ranges of ignored MSRs, one that triggers a message and another one
that doesn't.

Thanks, Roger.

