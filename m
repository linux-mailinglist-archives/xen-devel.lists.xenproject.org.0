Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B6782F9B5D
	for <lists+xen-devel@lfdr.de>; Mon, 18 Jan 2021 09:37:17 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.69444.124271 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l1Q1u-00087H-KT; Mon, 18 Jan 2021 08:36:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 69444.124271; Mon, 18 Jan 2021 08:36:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l1Q1u-00086r-H0; Mon, 18 Jan 2021 08:36:54 +0000
Received: by outflank-mailman (input) for mailman id 69444;
 Mon, 18 Jan 2021 08:36:53 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=wFfa=GV=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1l1Q1t-00086m-Ci
 for xen-devel@lists.xenproject.org; Mon, 18 Jan 2021 08:36:53 +0000
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 3a9ebc30-5ed1-45dc-90a4-baef782ca21a;
 Mon, 18 Jan 2021 08:36:52 +0000 (UTC)
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
X-Inumbo-ID: 3a9ebc30-5ed1-45dc-90a4-baef782ca21a
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1610959011;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=AjOcmkTga7A5RbxLgMlULRDXGacHNiEG7q8UW0chu9c=;
  b=UlQfHPKlc/7iUW0loPEeVTZPNnMJF51drcrL1CC+umkfmU0w8J9GCo/R
   gvIQcRZ4HwEGau7CpyVM5h/RfDeF5hMF9loFNrSYRelEOrm8EuD1DfdFy
   pmZXzVoFS/mpM8RDNkVRELe3Qd93DIrU3a2hkTaLLQX/OSfPztASO9H6t
   I=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: g1QNv0xjmMztcCJ5cBsJA9ua//hNz65yGSWf0LD+a/nf3GvOzVEX8H16YjpdjzxutZ1T1LHQy5
 DNBfnnnPOa8CTTzprY/0Jcp0JhzA69NNxj22qIk31gkLxdqIiJUlFk95CxW62dJWtKz9+NcgG4
 ZAH98UVegKQ9X+DRgfY2Q88zY9EKz9FgYphazdflgi5ifBk7JtsLKSdP8EB6oBrWw2u5woYv31
 58PWWVyTFzGIpoxAyr53EL8U12u3TXLNzaBvcsQ4nH5MdZ6ttBAKYPLJHw6WsRMA2NIKmtiWWn
 sFU=
X-SBRS: 5.2
X-MesageID: 36578394
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.79,355,1602561600"; 
   d="scan'208";a="36578394"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NB1MqlGcbAYxlM97ZP+au67iMsd8Dfsz9SulXf5qI7W60Ny/iGhoY7b7q513p/afV5vuR++zZkFwejNpA+YoCVJVNGHePvZUrNumBdFNsi+JHh6KJIm2w/qI/W6kNsNKhHZ+PiOql9Vhl2M3Ag2IKGkYbX//req7/605MbuYJctp5esdiLKYl6D73p1JzL/YLOYex7kRuBfiH/TVTCuzDNs4mDpT0Rx/02vIl/mgyijxI99AI5EogNx4QfTmLHJTWoTCUaFAu+4VXHo17+YtyBI/T9zUo9JlEM8ffG8I+nYGbJP57mm9RWfnqguyFA4NA/mtcBlTZWefc6znKnsmIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+WMtZFaI/PYvDbVoc+UqhJm8Ozkd5lD/yFCuoT5gb+c=;
 b=Q5bG7S0RcZMc9p8VWrI+PYtJft69tTfn6m/F4+eyZoacYG3BQdPsc7JWjDe6rKvo4fcXbI1rKy84DclhEr2l/bdR5yb2AdZSH49LvRfbbLoslpc2jgr9fyV4fmO48TYiKZUpUNNuduFiKWM2FtHKqsjGK1+O/Xm6xl6mcAebO9Nu84GSNbxfmp/qLgw9XR7Zx2KS4MbrJWQUCLBD2eXsuXEurb3fTXMZasm/RkVyHhoUZ2T8udbMTayNtMneE1qkJOYlmjvmgTLHFgnt2ms3hO9+v/tI0OPOcZxuvQUeZeIoX+ncVvw3nxeYqdAmecbg0GFDbYcwlStwZAjO8fGi1g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+WMtZFaI/PYvDbVoc+UqhJm8Ozkd5lD/yFCuoT5gb+c=;
 b=n479d79B7clkRU/CRTB5s5gE4RK/ZlDcf4zkR/nTrXghgvSDOz9TU82bAFBq3mHYzGp3FZ1YkduH9fyBuHdTjVwTwyqBHy/dmYAskJtvq5x7CPLpP0CIi5WfCkqq36/u2Te4FKP3P6WaDUnsDdhoG2oeJGwzrz6ApCvVvefPfjs=
Date: Mon, 18 Jan 2021 09:36:42 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Manuel Bouyer <bouyer@antioche.eu.org>
CC: <xen-devel@lists.xenproject.org>, Ian Jackson <iwj@xenproject.org>, Wei
 Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>
Subject: Re: [PATCH] libs/light: pass some infos to qemu
Message-ID: <20210118083642.deozyeo5o6yziba7@Air-de-Roger>
References: <20210112181242.1570-1-bouyer@antioche.eu.org>
 <20210112181242.1570-17-bouyer@antioche.eu.org>
 <20210116101606.sogfpgzg7upunua7@Air-de-Roger>
 <20210116112502.GA1133@antioche.eu.org>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210116112502.GA1133@antioche.eu.org>
X-ClientProxiedBy: PR0P264CA0098.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:100:19::14) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 64b1774f-d24d-4855-9333-08d8bb8c31ba
X-MS-TrafficTypeDiagnostic: DM6PR03MB4601:
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM6PR03MB46019AAEFDB119870A61EBC88FA40@DM6PR03MB4601.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1079;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: YaHyfw1+q3b5O1gbt1eBld63YBkU98GMQnfU0tQXQVlRxuWQoOFX7aDrLDOIXXKBVU7ANhxpFBeLI7RaCuxQ7alaN8cyUV0FX+dRx1JYdIXv+7nrpTCTbOjgYNxCCXGVxj7W1tw83oa+pWtHojGo4sQb45LwqZ3/+1QUGNifim1u5UOI06SVxu8SBshVIpI9erWboNWVRqO0fTVUZaJfd5q/XS8Wky3+X2ppVbY0eS23wM+rUSNl6p61OCkdUcgb05Nje/wwcp6qq4EMrQwltZMukijhvdVJwwKkIH0XMEo1vK8mWUA+nOAHKdd8zVZJgx86quhvtmDa9R5fy7zyzF5qQUaqfHSoHQtknKG3EAs94JaywfzLlzQ/h885ueEpkw37/NSiaF89XOdGemIYkg==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(7916004)(4636009)(346002)(136003)(376002)(39850400004)(396003)(366004)(66476007)(478600001)(66946007)(316002)(66556008)(8676002)(6496006)(5660300002)(6916009)(956004)(85182001)(1076003)(54906003)(33716001)(4326008)(86362001)(8936002)(6486002)(107886003)(16526019)(26005)(83380400001)(186003)(6666004)(9686003)(2906002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?U2NjNm4xcVpldWZGMnhDNFo4WFJMV01XQ0p4M3ZIWHBsN0trVmtsNCtqMmdF?=
 =?utf-8?B?b1ZadUYzWCtNWDBGYXJoOFhFWjhEOFhvekY4MlZGaXBLNVhuNlA2VmE2Vy90?=
 =?utf-8?B?dnhtZUhtZCtCU1RDMytOZ0VRQmtvQjkybnQvaitza0RKRUJmVUFvRHpuQnJP?=
 =?utf-8?B?emx6WGlMS21rd3c2ZkpUbnNwbFJzZ0dHU29MMVJhUXNkQitZbnM3alB4NWw1?=
 =?utf-8?B?Slo5NnNQV0t2aWw1NEtqb1NxUm5vWm4yczdTRmR4ZXRCSTBuQmwwNHVKdC9C?=
 =?utf-8?B?M0dRT0NyeWgyNERXWTlSQmpaU0pzTkhtblZGODdtY1d3L1g5VGJucTRicFNo?=
 =?utf-8?B?WG5PajRXMlMvcGhoeUQwTEhaODNscDBVZE5KMStwOXB2NE93cmlTYjl0Rjln?=
 =?utf-8?B?NytBR3pFQzdLK2pzTGRqUU4zU0lWQ09KMlduRk1FMTRBTTd3LzVtb0dZb3Nw?=
 =?utf-8?B?UmFWaVJreGJ3NG1EcnM5V0ZGMkoxU2xPNE12ZVlTeVFqcHFZL2l3ZFAzY3lI?=
 =?utf-8?B?ZXBuaVhtWVN6RGMwL2UzM2o1MXg2eGJqQ1pwU2UwSlBwQlpmOHE0TlFpZkxs?=
 =?utf-8?B?dGp5Z3VIQkRNMVl5ODJmUDlBS2ZLRXhkbVpnZTJxT0ZQTjZEWkl0K3pIMVM4?=
 =?utf-8?B?S1g3akU5TzlpRG53N2RzTmNvQ3h4VEJUdnBpTEEzQXI0ZmxXRUhaWEpLdEkw?=
 =?utf-8?B?d1dySld0TXpETWJoQUFLVDlYTjFKd2Z5SHJVaDhPMjAzUCtRa2dnVURVdXVO?=
 =?utf-8?B?N0xRK0VqZlFuK1JEakg3bEZaN085V3h0SUplN1JCWURCNU54VTNWZ2pLTmJV?=
 =?utf-8?B?RTVkS2E0azF5Z0swQ2xDUU9vWERxWjRiSzE2TDVyWlNiRDNCZ0g4WFRuYXZn?=
 =?utf-8?B?MUgxblFRMzh5dlNRVVR5NkxkNDI4bEJqWHhZdW5sR0haekpXdUFSVURsRmt4?=
 =?utf-8?B?WTkzVVlOMEV6WUsyZlJuUDZXMjE3ellmbEg0Sld2cGhDM0IyaHIvUC9PQit1?=
 =?utf-8?B?a1pZOUNKaEdEcTZLejRlZG5YWnBUZCt6amRIUXorQzlkbmRJSWxvWlJPVG83?=
 =?utf-8?B?bUFQUHlhSFBsbGtYUTNUTmh5UWhnbFdOWjF0SkNVMllyU0YwMFlBS0F2S0xY?=
 =?utf-8?B?enNHRGVRQjZRR2c3VTA0NkdrajZ3aTd3Q25TZFo2ZnZUTWJYR0xxTS9EM1Er?=
 =?utf-8?B?YWJrdE1DVXRkb1l2OVJMcUFYRkQ0TXdjR2hqREJUalBwYWZaeVNxUVF4aFRu?=
 =?utf-8?B?MzhlNkNib2c5OFFZSHJYYWUyWUVCQTR0bkVVb3MyN0FvN3Q1N1VTZW96UFVO?=
 =?utf-8?Q?pKTr+nFGSxcDyfmAucVbet00/UEC3jzA0v?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 64b1774f-d24d-4855-9333-08d8bb8c31ba
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jan 2021 08:36:47.9042
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lBSBsJx298N/A0rMMprnejxtt6hMBmFGg4LzY3rh6ymwemZEiDf3zn6cqLp1XdduLQhZVfVSlL2kZt0BUq2R8g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB4601
X-OriginatorOrg: citrix.com

On Sat, Jan 16, 2021 at 12:25:02PM +0100, Manuel Bouyer wrote:
> On Sat, Jan 16, 2021 at 11:16:06AM +0100, Roger Pau Monné wrote:
> > On Tue, Jan 12, 2021 at 07:12:37PM +0100, Manuel Bouyer wrote:
> > > From: Manuel Bouyer <bouyer@netbsd.org>
> > > 
> > > Pass bridge name to qemu as command line option
> > > When starting qemu, set an environnement variable XEN_DOMAIN_ID,
> > > to be used by qemu helper scripts
> > > 
> > > Signed-off-by: Manuel Bouyer <bouyer@netbsd.org>
> > > ---
> > >  tools/libs/light/libxl_dm.c | 6 ++++++
> > >  1 file changed, 6 insertions(+)
> > > 
> > > diff --git a/tools/libs/light/libxl_dm.c b/tools/libs/light/libxl_dm.c
> > > index 3da83259c0..8866c3f5ad 100644
> > > --- a/tools/libs/light/libxl_dm.c
> > > +++ b/tools/libs/light/libxl_dm.c
> > > @@ -761,6 +761,8 @@ static int libxl__build_device_model_args_old(libxl__gc *gc,
> > >          int nr_set_cpus = 0;
> > >          char *s;
> > >  
> > > +        flexarray_append_pair(dm_envs, "XEN_DOMAIN_ID", GCSPRINTF("%d", domid));
> > > +
> > >          if (b_info->kernel) {
> > >              LOGD(ERROR, domid, "HVM direct kernel boot is not supported by "
> > >                   "qemu-xen-traditional");
> > > @@ -1547,8 +1549,10 @@ static int libxl__build_device_model_args_new(libxl__gc *gc,
> > >                  flexarray_append(dm_args, "-netdev");
> > >                  flexarray_append(dm_args,
> > >                                   GCSPRINTF("type=tap,id=net%d,ifname=%s,"
> > > +					   "br=%s,"
> > >                                             "script=%s,downscript=%s",
> > >                                             nics[i].devid, ifname,
> > > +					   nics[i].bridge,
> > 
> > You have some hard tabs in there.
> 
> Yes. What's the problem ?

This file (and libxenlight) uses only spaces for indentation, it
breaks the coding style.

The line you added above uses spaces and it's fine.

> > 
> > Also looking at the manual the br= option seems to only be available
> > for the bridge networking mode, while here Xen is using tap instead?
> 
> Unless I missed something, the bridge networking mode is using the
> tap interface, to connect qemu to the bridge. And indeed, the qemu-ifup
> script is doing
> exec /sbin/brconfig $2 add $1
> 
> (the script is called with: qemu-ifup <tap if> <bridge if>)
> 
> This is a problem that hit me when I converted NetBSD to qemu-xen:
> qemu-traditional does call the qemu-ifup script with the 2 parameters,
> while qemu-xen calls it only with the tap if. So the qemu-ifup script can't
> know to which bridge the tap interface should be attached to.

OK, so the only functional difference of adding the br parameter is
that it gets passed to the script. I would add that to the commit
message:

"The only functional difference of using the br parameter is that the
bridge name gets passed to the QEMU script."

Note also that there are networking modes that don't use a bridge, so
you could likely end up with nics[i].bridge == NULL?

I also wonder why NetBSD needs to add the tap interface to the bridge
in the QEMU script instead of doing it from the hotplug script called
by libxl, like Linux and FreeBSD do.

Thanks, Roger.

