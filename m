Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A72DD30A31E
	for <lists+xen-devel@lfdr.de>; Mon,  1 Feb 2021 09:15:32 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.79599.144913 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l6UMe-0006U9-N4; Mon, 01 Feb 2021 08:15:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 79599.144913; Mon, 01 Feb 2021 08:15:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l6UMe-0006Tk-Jf; Mon, 01 Feb 2021 08:15:16 +0000
Received: by outflank-mailman (input) for mailman id 79599;
 Mon, 01 Feb 2021 08:15:14 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Dub/=HD=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1l6UMc-0006Tf-JP
 for xen-devel@lists.xenproject.org; Mon, 01 Feb 2021 08:15:14 +0000
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 6abc3799-8422-496c-939d-e1111ec35f3f;
 Mon, 01 Feb 2021 08:15:12 +0000 (UTC)
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
X-Inumbo-ID: 6abc3799-8422-496c-939d-e1111ec35f3f
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1612167312;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=sfJygqxGL57ldSNgJ7sdvK1cZ+s42CO9qcTX01xar84=;
  b=Q7Kr8d01Ko1mOTGj7laUcmNjXmkDoz8Xw8+C4Ik+WA6LbtW2aWcIjUKo
   92ffu+JCA2I23KabztAIg+HtBzF8UwxqqJr714YJxDoDPytX+AXi97hdu
   /aHCfQmkKYquWDlbGSv0V88T5Qg0tanr9s2C7w3gj5wJiZhHFlCdfix5B
   U=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: qLTbDWCk7U/Bb+FqsqmbU1k5TRIkuYF+2du4fCPfJXkzuS74kEzgz+CHSqcu5CUOkjSVgjbxhr
 ghn3oZ0w2tErG0EXap7nQfkvpNaPxsDsG2x7IzKai9qWZNm0ouhhyMNlwvTRT4FbqXx6JWlx6T
 LWwmf9ncxn++TBtmt9JBkcTtJE3cCbrAZE+Y3wZDoiVFoYBKAhspKbtg9W96Ma4kf5JAAqKaFV
 /WR9e3kCw2jnhj/TQ/AQmeF846peXU2aff7BvS4NVgSBq7JIzYQvLMISfgtvaMU1tu4YTZm5Le
 Tkg=
X-SBRS: 5.2
X-MesageID: 36295524
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.79,391,1602561600"; 
   d="scan'208";a="36295524"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cf+rI8hnZPuVph0CR59JthQ8XpPqmy6OXR/1pYZnutOlXX+oaCHPyAkp6mhiSy7DwSJu8q5mYegUDeG3ZHQZ5Sp19pqiJJ19t42ljVB2DngEo9umqaL6rfreuyO6bbn8U6SYNpqvCt7cYSYukE7MNNpg26wv+s/nIFPt3eEnRHcI1quMfrqNqjRQGrwWdfy8fXZLDwjUtQz0GzgvVrWzyngXXOdJL6ULl3z2Gi6zslFPovBy/UMkzMlwC5oZJq4zKLMHVfZ2cuCoL7/GmHZU5lzRG3E9CA0CSr1rWxb7fD2VCk7OQsFnYNGYTPWJTSszXC1IVXhY99t9b+doyNbzpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GUXDxMsGy43OVp3KsnzbywguZBgojdHyN0MWev1RQQ8=;
 b=d+nKZ60+lH3Ub2c9+qI3ihLhVLc5nLUE01/VrDQBCqRZ47EkcT6yAP4tjr9v1o+nO/zjAjlKhyiwL2kD15Giepp5v0bih3OGY2hBS9nutONhMqQF17U0hFkd7j1ZGuy9kPVaOX2gk9dzqf/A77s+kb1B3lEz7LGVHJ/doQoDc8n2fIZxOnOhTcMloev6tlIDW4JXCja+o9b9QobSbmivS8XS2Ay20UgrJFMWfllJefEXSj1fHgwLgWOy0JIkmnfjgSpq0capYZYiWoB/OsKqvhafKfn2kUmdXV/JiDdO2Ie8mzaT0cYtRqM7B5aMD7xXZ8b6XKNUUMUWzeHg0hvpaw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GUXDxMsGy43OVp3KsnzbywguZBgojdHyN0MWev1RQQ8=;
 b=K5XobmLT9B7BPmR4lqrTFGc3M9gLovhIpkp7gniRXxu4nY1yHb0zaO+niPUUfpbO26VTvKLBrellkAwOjXAex90xqvvg6zsbZ0DIcMOcvPYFNvM3QiR+uY7L7w/mGh3DkH1hpyGpWPkEhfYAl8OvdDld/MDU6sVnhwvRITPjN14=
Date: Mon, 1 Feb 2021 09:15:04 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Elliott Mitchell <ehem+xen@m5p.com>
CC: George Dunlap <George.Dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
	Wei Liu <wl@xen.org>, "open list:X86" <xen-devel@lists.xenproject.org>,
	Andrew Cooper <Andrew.Cooper3@citrix.com>
Subject: Re: [PATCH] x86/pod: Do not fragment PoD memory allocations
Message-ID: <YBe4iNMbmaeUBLcp@Air-de-Roger>
References: <c0a70f39-d529-6ee4-511d-e82730c14879@suse.com>
 <YBBWj7NO+1HVKEgX@mattapan.m5p.com>
 <f6a75725-edc2-ee2d-0565-da1efae05190@suse.com>
 <YBHJS3NEX5+iEqyd@mattapan.m5p.com>
 <67ef8210-a65f-9d6a-bea1-46ce06d47fb7@citrix.com>
 <YBHo/gscAfcAZqst@mattapan.m5p.com>
 <44450edc-9a64-8a6e-e8d3-3a3f726a96bc@suse.com>
 <YBMB1VUhYd3RUuDO@mattapan.m5p.com>
 <DC18947E-BC67-4BF8-A889-04B812DACACC@citrix.com>
 <YBbzXQt2GBAvpvgQ@mattapan.m5p.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <YBbzXQt2GBAvpvgQ@mattapan.m5p.com>
X-ClientProxiedBy: PR0P264CA0226.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:100:1e::22) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3be08554-cfd8-4b56-7911-08d8c6897cfb
X-MS-TrafficTypeDiagnostic: DM6PR03MB5083:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM6PR03MB5083BF669BEA54FB7A0D7F2C8FB69@DM6PR03MB5083.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 3K0WJvphH9/TRKaiqS9d/DHdYH7vjxay6AHVRWYmS46kATgk2COLbMwlKHOQOfoLcyl/y2mBc1i3LzAS0odQXAzPXim8EERdYQFqkm7+TzLc8uR77I/dJqvC1okvqUq2jMLJMFcqgkGQO2rAKNvxf5fv7doEqx4RAzbCWtJHM44zVxs7L1YBMOYW/qFJmdEaUIbGgjiWfLGO5TS5QL8bSzcc0NbhoFkEXtOuBUJCQRTgqHk8OKleNIH6p7SY2YmtUMBaKOLKAgiBtjt+GNPStPKHSLMBoR1bTrQ3C0CX6eB/2g7cGqlAoScqOpMoaHA3vW1EyX8cnmfIux92aPdZBVf2Cy4XuZyaYJ7P0jZR+uaFiObBAgTHJjPn40BFnMw9iVQg965KYqoz8zgrwOOxfH0dtno4VW5340b/TlvtMmYIR3LYd6VroWgzGdoEQ2ZmxbAPuS1kEK7fYNWMOebnB/PGz5SsEvt/DbfHroFzrkadKcY33wHcBYP6YsS95LuM0qR/UJZPHWzvFvNM9PFWCQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(7916004)(396003)(136003)(39850400004)(346002)(376002)(366004)(86362001)(4326008)(107886003)(186003)(16526019)(85182001)(6496006)(956004)(33716001)(8936002)(66946007)(54906003)(316002)(66476007)(66556008)(6666004)(5660300002)(8676002)(9686003)(478600001)(26005)(53546011)(2906002)(83380400001)(6486002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?NmRscXRlOTFLQVhmMzVnalo0OEdtNGFpbzJtVmdVdXE1SzN2djA0QTAvNXA3?=
 =?utf-8?B?bEVUUHFVTlNhYzVrWmhhVFk4dlVNUFFERHorL3VoeThRNDR2RXRDMDBmM3Z5?=
 =?utf-8?B?OFBvZ0FoTHJNT1pPUHlIcFdQbHY5L1hROXZKZWcvTkVqZmdTUW5qaWhVd1J5?=
 =?utf-8?B?ZW9qSkhETGJ1WTMzeDBqTE1KclJ2S25Oelo0eXFEVTA3OSs3bmwwNkdLVUMz?=
 =?utf-8?B?ZWI4b1oveFh6TzdtTnVZSDRlV3dyK0o4L3RCaU9ORHJwVkRUeUJ2d29FUFNy?=
 =?utf-8?B?SGZ5UU5YbDBhQ2JyZlhIOGxSMVo0V2ZWTWJQdCtpUzFJZUJXL2RHZHNDRVYy?=
 =?utf-8?B?VTNSNkFVYXdTcnFmc1hTdjBReDlqMXhKclRPV2FYNXpsVmE3R3YyK0hzMjcx?=
 =?utf-8?B?L0dIVllFeFNGOGVRbnhLbEFXdHZWQ0ZJZXRCVlVFbEpYeHhJc0FLTkdYbmpS?=
 =?utf-8?B?dnV3ZFM0Uy9nRWVQNXZoVXJJL1VBOXBtanVmKy9LK1dhaG1nNXpVOS9jRTJY?=
 =?utf-8?B?cXpOY0tQQkcrM09wLzBCV0dhaGxXaWhITG1IWTVNYVZaY3pmMjFGSzRXd1I3?=
 =?utf-8?B?M212VE9ZaDdMUTYwaEtONFdSNFcxM1RmKzNrc1Ircjl4L0tOL2hIRzZQdnFr?=
 =?utf-8?B?Q3FMY2RNWldRMko1MkNiUzRoT0NVSGs2OVJ6bWZCWXF4b2VMVElpYjJ4TDJm?=
 =?utf-8?B?Q1gwYjJCdUk5ZDBXVDRoenI2RkpDQkF5RllwVDlWcnJ4dXd5Rm5tL1FFdUZC?=
 =?utf-8?B?S0E3UitPcE1lOEtyTXp3b01vMXR6dzJiZnkzUkN3NWJOSmV1QTFsNnpkZll3?=
 =?utf-8?B?eWIveTlQVG5paUxNNVZkUnllVG1HNnJnV1ZLZlFiRWJZVFZleUt4Q1JUVitM?=
 =?utf-8?B?NXZyMUpLQjFWQzJtYjN3NzhsN0xzRzVEMmhkOWRTM0RCbTBPdEN1UFNlYUFr?=
 =?utf-8?B?b3NMcHUrTHMvZ09kMFBobGUzbnFWK0VkSjZFYVlxWWpoQnFZeDF0N1p0SWlI?=
 =?utf-8?B?YmhSZ21YbkVTc2RuZTFMOU9ta3ZlczFhenBXSkxXc1RDU2NvVzVPNlJuemh6?=
 =?utf-8?B?eW5ZSE1RTzNPZ05Bd3ptUnV3cmZKQXR0a2tNMDZGRjl1aFVzWkVadmhZenFT?=
 =?utf-8?B?TVFxL0c4VnJyRGNPR3ZDdUlVVUpodVM2Nkt6d1dJUUxVUmZFUk8raWhFQzA5?=
 =?utf-8?B?TmdKbEhub2N2ZVZrRTZlQVJUaUVGbFRRZDcrd2JwQVRwbW4yTy9JNFJlcXJr?=
 =?utf-8?B?QWlxUkZaZFdvOUxzSWR0aU9iSmNSM3NCUHp1WjdiRTZ2SG1TOEdEVzZ0ZkVa?=
 =?utf-8?B?SVNoazJZN2dndHplRDd5b0ZKckRudTZvOTh1OGJxWGo2aG9PWS9SR3RrdWR6?=
 =?utf-8?B?N1ZwR2cwQ3ZuR0dwaVl6dm1xVFFIcEtjQnJKc1huVVViZ04vV3dnTDZYSXIz?=
 =?utf-8?B?UU5qejBXNWlPUmFreEVueWZIL053ei9SZjU0aFZ3PT0=?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 3be08554-cfd8-4b56-7911-08d8c6897cfb
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Feb 2021 08:15:08.5009
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: R0PY5S/uxc3gEGNmnSzCCi/6jPhvCdfon7cZzR9swAbXYIeZNZVEnIwTh5PixGaCnQTyraXr7ojo3qPfWeWz0Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB5083
X-OriginatorOrg: citrix.com

On Sun, Jan 31, 2021 at 10:13:49AM -0800, Elliott Mitchell wrote:
> On Thu, Jan 28, 2021 at 10:42:27PM +0000, George Dunlap wrote:
> > 
> > > On Jan 28, 2021, at 6:26 PM, Elliott Mitchell <ehem+xen@m5p.com> wrote:
> > > type = "hvm"
> > > memory = 1024
> > > maxmem = 1073741824
> > > 
> > > I suspect maxmem > free Xen memory may be sufficient.  The instances I
> > > can be certain of have been maxmem = total host memory *7.
> > 
> > Can you include your Xen version and dom0 command-line?
> 
> > This is on staging-4.14 from a month or two ago (i.e., what I happened to have on a random test  box), and `dom0_mem=1024M,max:1024M` in my command-line.  That rune will give dom0 only 1GiB of RAM, but also prevent it from auto-ballooning down to free up memory for the guest.
> > 
> 
> As this is a server, not a development target, Debian's build of 4.11 is
> in use.  Your domain 0 memory allocation is extremely generous compared
> to mine.  One thing which is on the command-line though is
> "watchdog=true".
> 
> I've got 3 candidates which presently concern me:ble:
> 
> 1> There is a limited range of maxmem values where this occurs.  Perhaps
> 1TB is too high on your machine for the problem to reproduce.  As
> previously stated my sample configuration has maxmem being roughly 7
> times actual machine memory.
> 
> 2> Between issuing the `xl create` command and the machine rebooting a
> few moments of slow response have been observed.  Perhaps the memory
> allocator loop is hogging processor cores long enough for the watchdog to
> trigger?
> 
> 3> Perhaps one of the patches on Debian broke things?  This seems
> unlikely since nearly all of Debian's patches are either strictly for
> packaging or else picks from Xen's main branch, but this is certainly
> possible.

If you have a reliable way to reproduce this, and such error happens
on one of your server boxes, is it impossible for you to connect to
the serial console and get the output of the crash?

I would assume this being a server it must have some kind of serial
console support, even if Serial over LAN.

That way we could remove all the speculation about what has gone
wrong.

Thanks, Roger.

