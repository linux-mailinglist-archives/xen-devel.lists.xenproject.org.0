Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 481DF2FFEB0
	for <lists+xen-devel@lfdr.de>; Fri, 22 Jan 2021 09:52:29 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.72576.130705 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l2sAU-0007xF-LP; Fri, 22 Jan 2021 08:51:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 72576.130705; Fri, 22 Jan 2021 08:51:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l2sAU-0007wq-Hz; Fri, 22 Jan 2021 08:51:46 +0000
Received: by outflank-mailman (input) for mailman id 72576;
 Fri, 22 Jan 2021 08:51:45 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=33kp=GZ=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1l2sAS-0007wl-QM
 for xen-devel@lists.xenproject.org; Fri, 22 Jan 2021 08:51:44 +0000
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 9724f74b-64db-4497-8c28-a8d28ff796aa;
 Fri, 22 Jan 2021 08:51:43 +0000 (UTC)
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
X-Inumbo-ID: 9724f74b-64db-4497-8c28-a8d28ff796aa
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1611305503;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=F61RfeRIfiuz2Fn7+TFkzO7PUNogLxLtQlWstVovkEQ=;
  b=ZTmd2aA+lWCBZVbMZw55C8KgJ2QDUsNbeLrv9lq+Ca7G+DJH4DX1h/l4
   b3DR2b504c1yH32faRAIR+O+KapGq+gXwMHoDysqk260yF9Aee2fZrRHA
   DvLnbQUmQMIe/zqZQHIiONZspHPa1+RgYCiMrC0NN0KzwraxOt22nbt3W
   s=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: RAbwB4RgnPyoQxkj0/C/c2Zc+LY33g23ZNJ2op1BHjuMtUwLVWxHNwqQ0qn2cfjhi5pIf5sOxs
 xSCTpDwBlD7pTSURKe6tNl10Sf2ursb2D7LC0EgX3OkTEGm47GE1PtJrzOkr2BdB/W5AJb5VGS
 rbZmPrAqpMzNNMmLl2hyUn3ZL3HmagoOTn/e6Gmq0m5fhdSrTGWjeyoZXJPLAeY9mwsWkinZ8q
 SegA+mZwqTHgepGs1jIHnykwljTsUFXpw27K+vG9/HSNMeEWCKre2QulzNqYzJPefC2MdyvqOw
 Mac=
X-SBRS: 5.2
X-MesageID: 36948350
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.79,366,1602561600"; 
   d="scan'208";a="36948350"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HJPaUuNdeP8HwdkuFvT1sxCX7QfzIx0cWouw2YK66ptAgTVFU4nnlGuHuuv60NpNNQqhiScCLyx2P9xUpZRjFuDhSAbWctubAy8CNh77eV/4bVGdGNQHQg+ERVUtqSKX87Hz5WRZGDu1UNH6f8jkV/3Kr8iwA1ck13VBv57Y30aPOxRl0nijXCnqo1eMnymEwIDjlJSoTcosiWHhUUWrrrwBztDYAi+9QV+EamUsF7ph5nRbJgthS4VydthEXqF9/H1UaV/CDcl8iwQuZ6lagnc+6BeExMwnGBtcxUfiHwxF2llAH1BMFcGv2SGolSUAiSagxj+KvUVaQEe5ijAt6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=u4PIirLThyp7w8ACFajJ1dyg7dZxtz321VdYD4lVDlA=;
 b=HQJ7onleCKV5zxwnhMQzDtZpynKIcDqQUYFAt2d4WgNMRUU2vc7jUI2zo0YGFaLzmeqqjTbdAbjJLRuvqtlD7SaKimGW5A28n8PTIdm6wKzMUOSW3rUqP0vsTcGcYzFZLN9iYNzKL/2ecjiOXVUJAfdNKH1yJOy9DGwCY1ZZHwtCEKpVqPmmFoZ7zYHvCFymBv2boNSb7IZNM/jE9fhSjsR/kQ6R6sAg6z37k7Gc4IGtKfe7yr4nUuJ0PpEFYFS6Omvfb63AEJpHUtpdJPZXtzIT/GLGvZbgra6SbJfjq25OSWZfHveh/FtMMGNk1ONYzrEHrJw0GR8c0b/3vWA+Iw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=u4PIirLThyp7w8ACFajJ1dyg7dZxtz321VdYD4lVDlA=;
 b=qpxfCZFs4HA9G5QIPvQsOaPqgvDbiVb8HZsgmHqBNPZoWusNn0AXvjl9x7HtcR7xxKWCvUMb0soJBWNlSvGUfg/X1EUkicqalLubs0y+H4Y4lIozDWXVxKLUeZo6V+nV1XhcfPfzColcUjd9GuQBWYIlaAUrKifjhJT7D2RAMtg=
Date: Fri, 22 Jan 2021 09:51:33 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: <xen-devel@lists.xenproject.org>, osstest service owner
	<osstest-admin@xenproject.org>
Subject: Re: [linux-5.4 bisection] complete test-amd64-amd64-dom0pvh-xl-intel
Message-ID: <20210122085133.swj32vphkzwjup4j@Air-de-Roger>
References: <E1l1vyr-00074y-8j@osstest.test-lab.xenproject.org>
 <dbd283e5-44d4-99b2-74a2-f725b6b1b8ce@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <dbd283e5-44d4-99b2-74a2-f725b6b1b8ce@suse.com>
X-ClientProxiedBy: AM6P192CA0056.EURP192.PROD.OUTLOOK.COM
 (2603:10a6:209:82::33) To SA0PR03MB5610.namprd03.prod.outlook.com
 (2603:10b6:806:b2::9)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 27b9caa2-f457-473a-023b-08d8beb2eebf
X-MS-TrafficTypeDiagnostic: SN6PR03MB4255:
X-Microsoft-Antispam-PRVS: <SN6PR03MB42559B608990F7B3BDB278EC8FA09@SN6PR03MB4255.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: nAu6uJ4fDww+dJpOBUUn6H5iDDn+ByHUU6S/tcILCZTmppTASo6Lrc+g9+NICYHaY0+ND2qIuh9GV9Oauu7WO+U87mAZbS2kPxqkknImZb+6Q2nGzTdCmvxte2wJbmxBYKnvllN9pK3/3sqyGMQpTnRxhUnB8I1SVe23fiXIeiRnXVSJ14umLrtQ5D0c7tzzcHtPgfxZabdZ+AZDcfOj1HN5cgnHpsY6qnvROroDOe134lz8pWd/U7aPLkfZXwolzyv+TBUDZQ94OCQrDpNWj/hjiRJjtGDgxWLz/OVegXcrFWwuzC9zgfH/oHMZDjsAZQqX6qYZg3pOnMUPLcLy6AyzVxYSC7kRMhTbtXX0MV+zkdjeoYAaMIJtzZ3mSHt1kQtkGLHyh8u21yqYeFWAi/MQoctpeDVsN55Tb9T0OCN4fG0jDpi4KqxFqRCmdoDUJZ1/To2bZMFBDmbFzh2qTrqB0uC8xRXISJEyJASZClvcKbTdo6wIZ6HCdyY91prf2ec+rMG/iIP0eGrnGf5emhrwTEo/wPKqUZyEA9PE++vZxn5gAiuFP5soAEEDMwwxXaG04HmAYK2rzkiHVjdL2s9dCNSH+IVFSdx6/XQc3Cg=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA0PR03MB5610.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(7916004)(4636009)(39860400002)(396003)(366004)(136003)(346002)(376002)(6916009)(478600001)(6486002)(956004)(86362001)(4326008)(6496006)(26005)(2906002)(8936002)(316002)(6666004)(8676002)(9686003)(5660300002)(66556008)(1076003)(16526019)(66476007)(966005)(33716001)(83380400001)(186003)(85182001)(53546011)(66946007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?Si8rYW1EdXFxWCtnQmxBdXdGaGU1ZzV1eUtXQjFkbkEwaEdiVTRNK1lIQjBC?=
 =?utf-8?B?WjQ2aEhxdDhRcHJoS2lta1orVnN3ZEV1Tmo2SEZuSTdFMGszWk5GUnBZTVJ4?=
 =?utf-8?B?bXUwaWtQeXYxWFBqa0swMVlLdk9aOVN0bFAxQlluMVlEbWdmak0zNTkrWWJP?=
 =?utf-8?B?alRPeG53TkhHSHZld25BR3grd2thVGVQbDBQOVM2RXN5SmNTaTcyK3dDRU9M?=
 =?utf-8?B?YzM3WTRjRTl6TjZyU0RyZTJEWG9VMnJPYzdhdWFFS3pGWlEwb3lrd0RjeG9K?=
 =?utf-8?B?aFhKclIyZWY2ZmhWUkVWby90QlhHaFNLMzhZUnN3V2FBTFRPZVFRSDV4cWcz?=
 =?utf-8?B?ODNRZk0xUmFiUG43SlIxMEdBZHRRTmVmUWtPazUyUjNQNFVzMVJ0OUl2VG1h?=
 =?utf-8?B?cGozb3VtRjR0Uzk0M09RckdVMEVjWHRGRzVpYzZxbHZTVnJNWG9nZ1BiaVN0?=
 =?utf-8?B?anNPMklMSTVoRjJyKzVyWWt4dXdJRnh0RFFJbHN4L0VZK0NzQm1qNk5VRzVN?=
 =?utf-8?B?Nk9IT0ZMWGVNUDZxbFlVaDljalJMYllrTndhcWIyVzZjYkMwaSs1YWU3MGEv?=
 =?utf-8?B?VDJURDBDeDhYUEdWbjFpZXRJUkZPZm56VUtxUVlUS1hrcU9Uckw2bU90dElE?=
 =?utf-8?B?aUc1Q2pmbFROSXZKV3NKbFM1dWdyZmxYZmlUaWR2UWRuczRBSE1pSVYwNWxi?=
 =?utf-8?B?ZVdKNHk1ZjhrYy9uTXZBZ25FdDhJSEVpM1hzd0o5cFhBMGJTWUNCVDJRbEJK?=
 =?utf-8?B?SVIzNEgvOS82S1loRHM3N0VRTjlXNW1nYkV4Sjc2OWV4SVU0aXo1Mkd3VDEx?=
 =?utf-8?B?aXNIbWphejRDVUJBeXYwMVN3UU0yL25qZUZiSi9LZ0lydEpQdUZuUVljWEIz?=
 =?utf-8?B?bEVlR2t5eVpSSmw5aEZwVjFPVHFqVGs5M0tvNUhxVm1WSVNlUyt0TDZrc0xR?=
 =?utf-8?B?Yk1lcUdBNGJ6WmdCL1dTNElMMUtiRkR2SldpMGhLRWhDYW1hd1RzQWFnYi9h?=
 =?utf-8?B?THY5cno1L09GV3JjbSt2dm1ySG5TMFZwMlVxaStIZG1ES29YTEttaTFCVDNl?=
 =?utf-8?B?OUd6SjhIdERzMTEveFdnWExTdDg1K2FiZXlXeVJ3bDhYVTcvQWZxVkxyT3ZR?=
 =?utf-8?B?ZmkyS3BUMjdwK1VlVUt3UzJaTHdYaXFZM2FLUXJTN251bHhQWVBaSkNGQzJB?=
 =?utf-8?B?VjFHQmlJcUZZMTNrZ0ZtWHE4dUdLQjNlZHhRcklsSkRXMmhsTUNiMjllMjNL?=
 =?utf-8?B?QThqZWZ2OWtsUGw1eUVReFYyNVJDeWp1bHltNFhvQUczVi9nN2pZOFgvQ1Zv?=
 =?utf-8?Q?PY6t5yfZRjgoK7J2wlZEcFSuj8/oPRrofm?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 27b9caa2-f457-473a-023b-08d8beb2eebf
X-MS-Exchange-CrossTenant-AuthSource: SA0PR03MB5610.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jan 2021 08:51:39.4375
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1VPAzulxztiNId49Dyjx9QdjPoeMDg2p7szV1DF6OfEYawi23itPgrrtTqpm4OwmZ+43UFAuIvnGTKXrHq38kQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR03MB4255
X-OriginatorOrg: citrix.com

On Wed, Jan 20, 2021 at 10:04:13AM +0100, Jan Beulich wrote:
> On 19.01.2021 19:43, osstest service owner wrote:
> > branch xen-unstable
> > xenbranch xen-unstable
> > job test-amd64-amd64-dom0pvh-xl-intel
> > testid xen-boot
> > 
> > Tree: linux git://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git
> > Tree: linuxfirmware git://xenbits.xen.org/osstest/linux-firmware.git
> > Tree: ovmf git://xenbits.xen.org/osstest/ovmf.git
> > Tree: qemu git://xenbits.xen.org/qemu-xen-traditional.git
> > Tree: qemuu git://xenbits.xen.org/qemu-xen.git
> > Tree: seabios git://xenbits.xen.org/osstest/seabios.git
> > Tree: xen git://xenbits.xen.org/xen.git
> > 
> > *** Found and reproduced problem changeset ***
> > 
> >   Bug is in tree:  xen git://xenbits.xen.org/xen.git
> >   Bug introduced:  0f7bcaf19f7c67ee8c07d1674b2bbb70f16c2d11
> >   Bug not present: 04b090366ca59e8a75837c822df261a8d0bd1a30
> >   Last fail repro: http://logs.test-lab.xenproject.org/osstest/logs/158526/
> > 
> > 
> >   commit 0f7bcaf19f7c67ee8c07d1674b2bbb70f16c2d11
> >   Author: Jan Beulich <jbeulich@suse.com>
> >   Date:   Tue Jan 5 13:18:26 2021 +0100
> >   
> >       x86/vPCI: check address in vpci_msi_update()
> >       
> >       If the upper address bits don't match the interrupt delivery address
> >       space window, entirely different behavior would need to be implemented.
> >       Refuse such requests for the time being.
> >       
> >       Replace adjacent hard tabs while introducing MSI_ADDR_BASE_MASK.
> >       
> >       Signed-off-by: Jan Beulich <jbeulich@suse.com>
> >       Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>
> 
> Hmm, I'm puzzled. I see
> 
> (XEN) irq.c:2812: dom0: -1:-1 already mapped to -640
> (XEN) vmsi.c:762:d0v0 0000:00:19.0: failed to map PIRQ: -16
> 
> and
> 
> (XEN) irq.c:2812: dom0: -1:-1 already mapped to -640
> (XEN) vmsi.c:762:d0v0 0000:03:00.0: failed to map PIRQ: -16
> (XEN) d0v0 0000:03:00.0: unable to enable entry 0: -16
> (XEN) irq.c:2812: dom0: -1:-1 already mapped to -640
> (XEN) vmsi.c:762:d0v0 0000:03:00.0: failed to map PIRQ: -16
> (XEN) d0v0 0000:03:00.0: unable to enable entry 1: -16
> (XEN) irq.c:2812: dom0: -1:-1 already mapped to -640
> (XEN) vmsi.c:762:d0v0 0000:03:00.0: failed to map PIRQ: -16
> (XEN) d0v0 0000:03:00.0: unable to enable entry 2: -16
> (XEN) irq.c:2812: dom0: -1:-1 already mapped to -640
> (XEN) vmsi.c:762:d0v0 0000:03:00.0: failed to map PIRQ: -16
> (XEN) d0v0 0000:03:00.0: unable to enable entry 3: -16
> (XEN) irq.c:2812: dom0: -1:-1 already mapped to -640
> (XEN) vmsi.c:762:d0v0 0000:03:00.0: failed to map PIRQ: -16
> (XEN) d0v0 0000:03:00.0: unable to enable entry 4: -16
> 
> but I specifically do not see any instance of the debugging
> message that the supposedly offending commit added. Yet without
> any instance of that message I don't see how the change could
> make any difference to the behavior.

I don't seem to be able to reproduce with my test box, so I'm setting
up a repro on the test lab to debug. Will update when I get more
information.

Roger.

