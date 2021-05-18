Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2949738779A
	for <lists+xen-devel@lfdr.de>; Tue, 18 May 2021 13:28:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.129099.242346 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lixtk-0000dB-O7; Tue, 18 May 2021 11:28:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 129099.242346; Tue, 18 May 2021 11:28:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lixtk-0000Zi-Kq; Tue, 18 May 2021 11:28:28 +0000
Received: by outflank-mailman (input) for mailman id 129099;
 Tue, 18 May 2021 11:28:27 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=9UfV=KN=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1lixtj-0000Zc-C6
 for xen-devel@lists.xenproject.org; Tue, 18 May 2021 11:28:27 +0000
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 04e9f61e-5f24-45c3-ad53-2bce603edf7c;
 Tue, 18 May 2021 11:28:26 +0000 (UTC)
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
X-Inumbo-ID: 04e9f61e-5f24-45c3-ad53-2bce603edf7c
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1621337306;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=vINazI0C98YJU6gdc3lBCRp/OBiqxrdwqxXj73qfbac=;
  b=XBmus5OenOB8tsCTnwh/CU7ENQsOpbjUxoTSmIjtCuMVmDOI0AEAeKtS
   qaOoGQF4WA18q94XIC5RG2hjdR6fuQ1bSFWv0h7MYP05ui5A2EnLIvk/n
   KZuLm5KzFFPveD6y8bWXou+6crSgQFpWHRUH9VSnhj+M6ID35v75mhgry
   8=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: UM99sqw0VpGoJXcXcETiBYoAtSMXZbyNmEfoecWmXOTWE6aUzumN8YSXpf3UQGI4RswR1KhePC
 +bDwx8sU0tsMCzesAkTLuMXClm394aR2o/cVRPQg+Fto84EwfTrTf+tq9pn/p8u/JCij6UDyzj
 IJZsJ/cH6T4cip61OG9Eef2visZpMBWG35PFSP35Ni7Jq+MR0Pyb7UbbvJG86A5qhSpN/GPIY+
 DpDuMvyaF1BCDS9EW4XHLsmW8wFsdh9/ZVv9Xm4S148ei6q4qugrpKzmoOnDsfrMdWUfkHlmwg
 pdY=
X-SBRS: 5.1
X-MesageID: 44038943
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:eLFey6uT79B7LhryqG6ezXqp7skCdoMji2hC6mlwRA09TyXGra
 +TdaUguSMc1gx9ZJhBo7G90KnpewK6yXdQ2/hqAV7CZnichILMFu9fBOTZsl/d8kHFh4tgPO
 JbAtVD4b7LfClHZKTBkXCF+r8bqbHtmsDY5pas854ud3ATV0gJ1XYGNu/xKDwReOApP+tcKH
 LKjfA32AZINE5nI/hSaRI+LqT+juyOsKijTQ8NBhYh5gXLpyiv8qTGHx+R2Qpbey9TwJ85mF
 K10jDR1+GGibWW2xXc32jc49B9g9360OZOA8SKl4w8NijssAC1f45sMofy8gzdmNvfq2rCre
 O84SvJZ69ImjbslyCO0FTQMjDboXYTAySI8y7dvZOLyvaJNA7TCKJ69Mpkm1Ximg0dVHwV6t
 M944ujjesjMfr3plW12zH5bWAZqqOKmwtXrQcytQ0VbWJMUs4akWQglHklZqvoSxiKlLzPVt
 MeSv3h2A==
X-IronPort-AV: E=Sophos;i="5.82,310,1613451600"; 
   d="scan'208";a="44038943"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GDsgHiJNAMKb6aIQqzDNEKwqkfpAbr1GG4pZzakX4Yv3sOfpjH5LLSlF+zw1aEeivFc8Jbf8dxv8Cq3FVgAGE5z6n3w9NjZ5j7rLDD2GA6F/g/r9vr9zOrO0Imuyp3GthTOJo9hwLoUCPMZC3R9A3W1SmaqaUsVvofbTvqqSV1EunaOFa7JPWewnyGvdbqzhlc/6XcFTf29x9oKegPRvqkaOH39lw+RCs2Tfv+wC3le1vhIt5X/SUtrtwXIOGyNLxksF96dEE9mnmE3okQOcDR5F5JCkWlt2fd0lEvQKiGrJ/7NbGGQ3PEfFQJJmid/3FNyvVB4Q+8sW2bS1BNkHOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3IkFluejZckp15DsuWXvgNhQs8OSc1Ee5IBdC3fu5XE=;
 b=hXOf7U7r0VnHzwKo1xh7mz8IddAaOluqRCWkm1gqeCdK30FnnQSN20+rIgFnWw0Y1ctNI7he9Je4mEfaS4f3l47UFwDbSWcDNPic9N0E4SLTnWzZ11dj73aY8I/LZt/ZSHbN8iUP3yNnG4eLvR1a8z0rsim5WV4jKeC/U64JGholfYLjXSaN80Mnmw/vMrrndxsLU2faPd4QKH6t7uTIumojbmHgDbgnnim/52osoWeIQ6zX6ysisnT+CsJm7untzyn8e3aYF7kmISx0s152oRF/puvZSt0sTmB/2Jj7p3Xu/Cmdsb1kAAcYInUALHiOUHPvizvxAawjmxLagwMZUQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3IkFluejZckp15DsuWXvgNhQs8OSc1Ee5IBdC3fu5XE=;
 b=mpA2+Zd7ZYwVnOcODo8kStZ9xpvYnOpvhOfQsP+C9U6uHWoPba3i0t30/7PsfCiWOUKQiDQtAsLuMq3i9eDa+DJehYdmRRLWa1XRDgtGDbhGDoyZryA1jU3Kiggip3tyKWAFhTJse5HB5YTsJG1mEeaiz5v1XoV2ke9fKE7Un+c=
Date: Tue, 18 May 2021 13:28:16 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jason Andryuk <jandryuk@gmail.com>
CC: xen-devel <xen-devel@lists.xenproject.org>, Ian Jackson
	<iwj@xenproject.org>, Wei Liu <wl@xen.org>, Andrew Cooper
	<andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, Jan
 Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>, Stefano
 Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH] libelf: improve PVH elfnote parsing
Message-ID: <YKOk0Jy+jD8xs0j5@Air-de-Roger>
References: <20210514135014.78389-1-roger.pau@citrix.com>
 <CAKf6xpsyzazbY_mA0QtAuAqpOPkpuhjrZ1wid0khWy1urh4iBg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAKf6xpsyzazbY_mA0QtAuAqpOPkpuhjrZ1wid0khWy1urh4iBg@mail.gmail.com>
X-ClientProxiedBy: PAYP264CA0027.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:102:11f::14) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 81afef7d-0c6a-46a8-dbf1-08d919f00b71
X-MS-TrafficTypeDiagnostic: DM6PR03MB5084:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM6PR03MB5084209F085D9DBBE1A6FFC98F2C9@DM6PR03MB5084.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: rb0foB80Ng6gb+9Li3vZmYkHBe7q9DvdEPHH28AN5VjuUxHuRUWZNIkeQcJKEhm3OKoNKzczjzr6LnwTe4uFdtiRrRB+kBDERmmFY4zCwmHnIt/h/8rbiQs0ccxXe3mwzrkFMv3yPl6u42VaJUgW7qnm/tnPq2UO8MwScURM0wA5QQzx6mBz+8ZZZUxX/XmHxd5HugqN+y9WulFPiTveCbQn3scZVwxEKRX5smIWq7nun+Fx8t+/4r2r+MryWKGAdfgA3bLPsHJM3WiWosz4aqyFzijQsizlqElkOkNbpdt2f3xT/igKJ4JvD1W5pmPZpAGDrmQxeZcSCCf6gZq7kOoKPtMnN8dF9rYyfH64dW+b3IwKCcEliAYkD80jPVymPKDcdXLHJhGVSdHsis7nlYFKxdI38rwQ2fNrGWAnKPBpUMvka3F4+Mk25rApnkTnu1e4O8WqZmnebZXbpjibBfg5N+vl0P2mOcx3+ErO6vqc5VuMS5W8X+HJxDPAXYOKKIVf6sdVpwPeA+b9sqfB2p+A0L4F5FRqyCPpuIR3eUj9CF8xqRsWD/gUT5+qBqGvpXiTuJbjallg9f32cV2prX7SWPm+ZhwPV+t2YQUCXYMh+MRAJkMop9VoKAVOcZg8TSLw5PzDoNCHOEXIksszGg==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(7916004)(346002)(39850400004)(396003)(366004)(136003)(376002)(4326008)(6666004)(6486002)(66946007)(5660300002)(186003)(16526019)(85182001)(8676002)(478600001)(53546011)(8936002)(38100700002)(33716001)(9686003)(956004)(54906003)(6496006)(83380400001)(316002)(66556008)(2906002)(86362001)(6916009)(66476007)(26005)(67856001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?U3VUZHlwSmdwclFJOFlXS3hTNUozMCtRaHl1NjFSbkdwWlhuOWtkbVBJaUhE?=
 =?utf-8?B?d3FCeUdSU3FQK1M0SDJGTWVpaGVTYVhIenhHZE9Yd1hxaFF4TXptTXM0bk1h?=
 =?utf-8?B?a3h5enhYTi9vV2h0KzFGOTE1cWZpWFhvcnBVZy9nQXZCTFBXM0tobGVLdm5V?=
 =?utf-8?B?bUtXVnJ0TDBSZ1F3dXgwRUp2aDRYRm5xQVgrOExCOG9teE9yRnEyOFY0RndF?=
 =?utf-8?B?M2Vkck1iNVRUNU5MYUNVcDRucFl4L0VzU3hkM1ZIVkdpQzlVcWx4bW1zdVcv?=
 =?utf-8?B?UHBVNU1MdURldFgxZWMwSzRtMi95RHJORW05TVMrNVZEaHVnVjI1M1NBN1Y5?=
 =?utf-8?B?UTFiOEhQSkZEUmJSU28zSGlxelFjSEdMZkp4SnVRMC8vM3BVWHRqWDhQVEV2?=
 =?utf-8?B?ZjVjZUMyNC9nSjg5V2IyUmhsNmhjck11Mk1zUk03dEpOQmNpWjZZNWc5c2gr?=
 =?utf-8?B?dER4N1hvaHhDYjU4VEZKbGUxZ1FEa2lEQW5nQWpWMWt2VjJaS3NvaXlsVGlu?=
 =?utf-8?B?Snp1ZjdSeldDQ3R2M2hVaEpod3hsclRYdndSMEMySngvY2FDZTNhazlKenFK?=
 =?utf-8?B?dVFEUC8vQjhOVittMFVTVlRmRzd5MlUyOEJXQjg3NlhCWlM1REFLVHRsNEtz?=
 =?utf-8?B?NjVYUWZReUQwVkRsVk1pZDl4alRwU3h0bTdzZzBvaXEvSzVvUTNyMm1Hd2sr?=
 =?utf-8?B?YVpLdk1DOHhHMFFaTzdtVURVNjM3RmxsVkU1bEtWem5CMlBQdGp2Kys2M0Ft?=
 =?utf-8?B?N2RFMVNCMDV4UUJiK2Q5NzBtL1N5eWdUbnNRNGdFbmhxdFBKcGJEZ0F6bWU0?=
 =?utf-8?B?YW9xUExXM1dCeFJ1RlZzVGZpcVFHTVVLT1doTW56ekM2eU42UzJkVUxEZ040?=
 =?utf-8?B?dUFCK3E3WnY0bnlvcERBUkpiVVVBdUVyVlpzeWZrZ29vSG9lbFpUN2h1a0J5?=
 =?utf-8?B?eDZHZWpJSlQwNWY1V1JsRjJDZTVFellDNGp0ZFhUWEUyTWs2TG5GL3hCVzFW?=
 =?utf-8?B?QXpLT0VzNDVSZHIycVZSYzBzS3czSjNqRU44T1hqcFJxajdLYUZZenZwdGxx?=
 =?utf-8?B?c2RKTFpOTnBQYVpLSmx4VXEvd2RnRGxDS0MzYlBUTWNhbWZ4ajdtMjdKMFEv?=
 =?utf-8?B?SzlER0ZlTlJFRUZhOUI0TS91Y2RmeWhHb1ptdGtEVnJjbGVlajJrSFk0WVRJ?=
 =?utf-8?B?M1FqRFMzRDM4dGh4VWlwZnhiRmNIalhsWTA3WjErL3oxemJyakVUQXE4UEF3?=
 =?utf-8?B?dlV6UmRRMkI1L2Z2VTYyTHd4Wnh0TUcvY0UzYTNsY0FWRUo2dXh6WDZYZm05?=
 =?utf-8?B?Qnc5NUVKSDlMU08xNUlKbDd3M1podTFScUhYZ3dpZlNyNGJSeFd0TlZVczFC?=
 =?utf-8?B?ajlMV1duaC94c05sS3djSkU3bHJsbnMzNzg4UTd1NjdJUjFXeEwyeU5zdW5q?=
 =?utf-8?B?VkczenUveHY4aWQ1QnVZQi9JRm1LL21TdmJNdlhKaHlTQ2xiR2ttKzZPM2tx?=
 =?utf-8?B?ZmxscGtqTUVQSHhoL3NEUXM5UUhHdmZ6QldDQlZDUHpUa0N0THNTaloyblFi?=
 =?utf-8?B?bk8zYmFxZDM3UkpuNWU1YjBZOTFpc3RjTStmNXozRTNnTHpmY2oyby9JakxX?=
 =?utf-8?B?RkZNZU5qZ2piSytLTW1vZVltejd0eUtmOG5UREVZTTRYZEZCS2N3c3M5OVph?=
 =?utf-8?B?T2x0YmRubW16L1lMcjlXUG01OWhQQmpaamg4VmVJVmR0QWdlOXRtSWVIcERQ?=
 =?utf-8?Q?XrBriIABlSbSqzZ2h4E5cLvNdx+PGg8Y9vTTrcH?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 81afef7d-0c6a-46a8-dbf1-08d919f00b71
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 May 2021 11:28:22.6852
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: c6hpUZzBampDN6uA6CMMgQiLfFH8J+X6Y6ub6/1Gbrqzps84tZHTNABz+hDtXO7DFgqwo3ySC1qPQGmOjgZzqg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB5084
X-OriginatorOrg: citrix.com

On Fri, May 14, 2021 at 11:11:14AM -0400, Jason Andryuk wrote:
> On Fri, May 14, 2021 at 9:50 AM Roger Pau Monne <roger.pau@citrix.com> wrote:
> >
> > Pass an hvm boolean parameter to the elf note parsing and checking
> > routines, so that better checking can be done in case libelf is
> > dealing with an hvm container.
> >
> > elf_xen_note_check shouldn't return early unless PHYS32_ENTRY is set
> > and the container is of type HVM, or else the loader and version
> > checks would be avoided for kernels intended to be booted as PV but
> > that also have PHYS32_ENTRY set.
> >
> > Adjust elf_xen_addr_calc_check so that the virtual addresses are
> > actually physical ones (by setting virt_base and elf_paddr_offset to
> > zero) when the container is of type HVM, as that container is always
> > started with paging disabled.
> 
> Should elf_xen_addr_calc_check be changed so that PV operates on
> virtual addresses and HVM operates on physical addresses?

Right... I was aiming with getting away with something simpler and
just assume phys == virt on HVM in order to avoid more complicated
changes and the need to introduce new fields on the structure.

> I worked on some patches for this a while back, but lost track when
> other work pulled me away.  I'll send out what I had, but I think I
> had not tested many of the cases.  Also, I had other questions about
> the approach.  Fundamentally, what notes and limits need to be checked
> for PVH vs. PV?

Those are only sanity checks to assert that the image is kind of fine,
libelf also has checks when loading stuff to make sure a malicious elf
payload cannot fool the loader.

I'm unlikely to be able to do much work on this aside from this
current patch.

Thanks, Roger.

