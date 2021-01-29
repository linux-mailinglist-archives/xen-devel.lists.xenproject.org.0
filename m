Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8782A30878E
	for <lists+xen-devel@lfdr.de>; Fri, 29 Jan 2021 10:48:59 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.77853.141310 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l5QOY-0000LN-9U; Fri, 29 Jan 2021 09:48:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 77853.141310; Fri, 29 Jan 2021 09:48:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l5QOY-0000Kx-6D; Fri, 29 Jan 2021 09:48:50 +0000
Received: by outflank-mailman (input) for mailman id 77853;
 Fri, 29 Jan 2021 09:48:48 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=CEfz=HA=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1l5QOW-0000Ks-HS
 for xen-devel@lists.xenproject.org; Fri, 29 Jan 2021 09:48:48 +0000
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 71d8dc8c-c3ea-4e5b-81ea-84eb65e9f063;
 Fri, 29 Jan 2021 09:48:47 +0000 (UTC)
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
X-Inumbo-ID: 71d8dc8c-c3ea-4e5b-81ea-84eb65e9f063
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1611913727;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=G29lUgRBoJ0D/MzmpaqLmTOiJEwHHpqQctmvluQ1/Cc=;
  b=KX8j/y/Ylo0v+G+jHOUrq/9YtpHPwxcclVcyf6s3mdwpZOUc7+ZZBvo2
   o3owKtlwvkIvCkWyR4MrEDGq8TSewjFVGZVy3ae5sMgSlA7VdwGOwoLeW
   jRKMLD9R+0E9/t2wPUmSKiRRqk+kwFq3xSDMx7EdATf+vaZAYRh0tLYpt
   o=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: cw4qTC5Yqi/nLjla1fBUIUhGcIxmZ8JHp4i66H7V/Ie19tP+KMA86iqHWDgUA4bJTHJ8EbqPL3
 xpfNbj5lAVfkjtIrAPR9CnZ/l27ZsxOJzQAFtKBZ0yxQRlojru5dJObKbSMnPM2rFe5j1rsAWB
 ggUJBMIVARQRp3bJv1aa9bpEFv2YtJgZ3NkVdgmlnrFnwiDPBaYeiioSmHxjIgA7pCgAFX8jyF
 tm/5+f0naQM5iFyUp6OY8QCPV6C/NjNAvqigRjS+8WcC8pM3uCkDSgsYq9G8P7MyVeaDtgRgZg
 SX4=
X-SBRS: 5.2
X-MesageID: 36177103
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.79,385,1602561600"; 
   d="scan'208";a="36177103"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ot9Uf9d+Mg9q0Fg0woC3RsfE5bnhgaz+u2ShHxCbXsRtpx17w9DYjaFIDLK7JKXP+r+MvN2+KxhTpbXq71Js8jCm80JanuI7xhQtzBzWGzwAFBi4YPrDQyNJNXn61QpTlIBu/q0ovDtTe5jLIkl6LYouaUhiehSE2a4u5S13576YtgVP1A6K8CDiHEtqr5yEUTW7IZfLLkdi2Ja9Ueqh2M975zx3Yp78KrXUtEzWRLCJSDPoGum8mFFxhvCzzLETnQ6/FBqHWlzgm0iyUZmWbrV9QfKkJJEfwcTRAJ3TsqqRmTU7BVFnDPlBI5/invgZUVd7KK4PEDRhA3LnSLyHog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hTmy30oIwGm3CM9kBqi/4iHWD/EryOnwkFe1Y2snvXs=;
 b=iPlfhCYo8EPIxWGbI1a9GB2HZg16LELgqVDOKrY85nxzQNzdpv+v5wc/IYNneVE03647A91gXuIqPUjyNQTagmnJUCdty2nGDeBhDK4LBq9qNxNDJp4gYsoUdm+ASU/vaL1Kd2cwi5mS6GRnlaOjrGPaIWg1lTt7jl9fhHGx6TvpsmnAG9bCTHUANPF/n/Y4agvLTJFF+AfbqavcMUP6cYhC0/caCW3DUGrTYVr1EEJy+2CiZnp27BGhq8EvgYuZZQo6S3nBmafnZA8ARK9Z/l+8JpKLfT493DaWDVYXDhihTA0521FLla6Ll24w4yac6E7juAmVtPUi2uQzMmk52Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hTmy30oIwGm3CM9kBqi/4iHWD/EryOnwkFe1Y2snvXs=;
 b=O/ayljj/5zoMkjfJczNPgYqXbHj2GQwzTTrr5rEGpwubothb9lT1F0aa532bdffdpsjUSaRKLW/uNH/SeLlu2JC6AU3p3Mn/qRUKYVs2+aSKTC3cNPa52rD/PFJCiqaGVTAIfYNhoCyRCKJyEIg/jxIxgjtx2tMqtiGF9WS6ycI=
Date: Fri, 29 Jan 2021 10:48:38 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
	<xen-devel@lists.xenproject.org>, Ian Jackson <iwj@xenproject.org>
Subject: Re: [PATCH] x86/pvh: pass module command line to dom0
Message-ID: <YBPZ9iNdMogwTMl9@Air-de-Roger>
References: <20210129090551.15608-1-roger.pau@citrix.com>
 <e41a9832-e5e8-f56d-a0d9-636bf4dfe7ed@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <e41a9832-e5e8-f56d-a0d9-636bf4dfe7ed@suse.com>
X-ClientProxiedBy: AM6PR08CA0017.eurprd08.prod.outlook.com
 (2603:10a6:20b:b2::29) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0e5679a9-3691-4b81-6055-08d8c43b1108
X-MS-TrafficTypeDiagnostic: DS7PR03MB5525:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DS7PR03MB5525C2BAB95DAC96B64B42A28FB99@DS7PR03MB5525.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: rKxLP63i37TY8DqWvxoKQbfo5H8zrDehYVxcr8Brq1m62SSFIOYlXgX5/GTrJX98YHtSZmhDh3IC/cLHqxLF1DJuHmjBRuMvV4aUiFxPvG0eTKmbwN02XZ77yy+gDATxdxb5sDhxw/gCKfp9dXZoDGWsy/BWd07bH0fy6saKIOTmblQEp7uhyXYrWjduVabqRr7/cRkB9gP47h0mRJFNOivx3yF5Zjyj1pdyX9SjQAI6K8+5aK36UrbzWynZScCw6GwW1sUAC556u/34v1f3RclZc6wwlUrxjC+37eG49jZsqSUveV4RarOI/L/doF7Rt5UnY5bl14BnAU2/6X3u34w7xhKQ8+i2vlOvaiO/IzIOgI1m8nkch+7luXnJ4WE7TDqwcmoECIOlbEcD2mDtbGwgxMEJYMnB65VJBisK+xUQElKm1phjh9UlLcixVHuzLpFNcqyBoe15xJYFMdLxyd8Y7g3MK22PFbzvS2wsyWk7tPARIkcfFgkE/0V+OC4zp/20jnNcukdDCmsRbYEsFg==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(7916004)(4636009)(136003)(396003)(376002)(366004)(39860400002)(346002)(4326008)(316002)(5660300002)(956004)(53546011)(54906003)(6486002)(186003)(6916009)(6666004)(83380400001)(8676002)(86362001)(26005)(6496006)(478600001)(85182001)(33716001)(2906002)(9686003)(66946007)(66476007)(16526019)(66556008)(8936002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?NlRVSU9pNm9TeUZjWG1kZEh5UkdzdWJJZ2FDODVXZ1pXNi9rRFB5QjFUOWx0?=
 =?utf-8?B?MUNNQ0dSTzNwVVNkZ1lJQzgyM3JSUmlrYzRzdDdyZU1hRmtvMjFZL2F2RXhK?=
 =?utf-8?B?ZldlajBEbE9hZEdZNWRsUVY1MFQvcUhVdUF5NCthQ3Fkb2VpQS9oZW10UHNQ?=
 =?utf-8?B?MWR6M3lJemJZWkJsL09PcHhXOGxhS2FxMC82NjRDd2l6NUlUZ2Y3OTJEVENi?=
 =?utf-8?B?UzV6TWU5UkZRaVpTVDZvdFllcnhMYWxoTVRzTWF0YTlzTllLUlMxc0U3SUZ2?=
 =?utf-8?B?MnRRY1FOc2RPYWMzUXg2RnF1WWcrSEgwOWlYeUgrQXYyV0crQW5oMStqZlND?=
 =?utf-8?B?dWUyU1hHQndCYXhFbDFacDlEOHBjTnhQbFBXVy95TDZyaW9PbEVSbXRwUzJj?=
 =?utf-8?B?YVMzNnlRdUNlSExWMDh2N0FCM3pPYUgyVFhSUkZDbWprMlpZcDVvS0ZFdHR5?=
 =?utf-8?B?cTFQOTNTU3JqM0toZmlpaU92VmZRVEZYMjFkWEJ2cHcwZGxQSXZnM1g4RU5K?=
 =?utf-8?B?T054SE5JZU5zQXFqSXEwelF6eTZIS2lhSjFqS2t3cW4wOVNmVGIyTzNaQUh4?=
 =?utf-8?B?K2x5dnhMSDNVY1ZlWW9wSUpac1NSdFdwZmxPaDc1amVmSGR3T3hpeUhSWFlC?=
 =?utf-8?B?WklobjU5RDl2N0NrQnhBMmVQUUxsbnltbk1KU3IxVnRmSWc3Rlk4Umg5b281?=
 =?utf-8?B?M1B2VjFUeHlZR1EvMHV6ZWxUNFV1NHZXTm4wNUhLY1h1TjVIL3gyK3dTekNW?=
 =?utf-8?B?SmpqUitQZkNFeTVSWmxmSlhLaHRZSzh2U0hrZUpmcFdYTEJqaTZUYUlZdWJm?=
 =?utf-8?B?bnNIY2JYMzE0SEE5OEo5amFXVjBlN2Q2L0V2VXBBTnhWVjBMbVVReGQxcnVV?=
 =?utf-8?B?WVBqK0krQmdVbTJwanhvNGFUL0FHQkw1b2ZJL1J6ZDJNZTlYZDA2YlRQQnhu?=
 =?utf-8?B?Z01pSEhIeDQ5TzJvTlQ0OUhJUDZyVklHRGdMQ1M5bGtjYlNCcytOYTRvUi9G?=
 =?utf-8?B?bVkvZW9zUHFmeTlmTnhtT1p5VXM0Q0FQbnZWcnNqWGFLYUUzNGZOSnhLVmR3?=
 =?utf-8?B?Q1VlQzRkdFB2RFBBTy8rUzF6VlJXZDJNVVQrNkxYQjJDUll1NElROTQ5c0wr?=
 =?utf-8?B?aU4wSm9YdTlMOXA4MlFnWm9SNVRmSkxpdzRrbnhOZU52dXRwOGpEb0ZhOGhM?=
 =?utf-8?B?V2oxbVFqTVdRNk13N1lvd01tVzBsUjNnV2xzYURGQUZHUGUycm85TlJyQzJn?=
 =?utf-8?B?bDVOSVdPR3JCcTlZZi9nVzFKSWg1MXowOGFOUXZ2UnVNR2c2RWdLTWgyV0l6?=
 =?utf-8?B?RDNpblZZa2s0REllRWpCb2VsbDdDRXNmZFFnWit3akVMbHRaZVFqdDd2Ti9x?=
 =?utf-8?B?bTJFMnVtWnp5R0FmczBwSWdvVVJLTFFaaXpMOU9UbTZMcnBvdlluS3RnbFJ0?=
 =?utf-8?B?SEFZL281MnpSN0JmY0VaSWl1aWhSQVFQdU1LMTFRPT0=?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 0e5679a9-3691-4b81-6055-08d8c43b1108
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jan 2021 09:48:44.2354
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RAuqZ7tsFOeSGebGhaUj3/8dAEGSP26AdOE5CMP3t7PCcLu29LlA19WBHpd957NbFpwm+malnqTb9pGghm4TSw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR03MB5525
X-OriginatorOrg: citrix.com

On Fri, Jan 29, 2021 at 10:26:31AM +0100, Jan Beulich wrote:
> On 29.01.2021 10:05, Roger Pau Monne wrote:
> > Both the multiboot and the HVM start info structures allow passing a
> > string together with a module. Implement the missing support in
> > pvh_load_kernel so that module strings found in the multiboot
> > structure are forwarded to dom0.
> > 
> > Fixes: 62ba982424 ('x86: parse Dom0 kernel for PVHv2')
> 
> This really is relevant only when it's not an initrd which gets
> passed as module, I suppose? I'm not fully convinced I'd call
> this a bug then, but perhaps more a missing feature. Which in
> turn means I'm not sure about the change's disposition wrt 4.15.
> Cc-ing Ian.

Right, the whole kernel loading stuff is IMO not the best one, because
all the multiboot modules apart from Xen and the dom0 kernel (the
first 2) should be passed to the dom0 IMO using the HVM start_info
structure.

The module command line is just a red herring, as none of the OSes
that currently have PVH dom0 support need this, but still would be
nice to get it fixed so that if new OSes are added it works properly.
It's unexpected that a loader can append a string to a module, but
then the dom0 kernel finds none in the start_info module list.

Regarding 4.15 acceptance: I think this is very low risk, as it
exclusively touches PVH dom0 code which is experimental anyway, but
I'm not going to insist on it getting committed.

> > Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> 
> Acked-by: Jan Beulich <jbeulich@suse.com>
> Albeit ...
> 
> > --- a/xen/arch/x86/hvm/dom0_build.c
> > +++ b/xen/arch/x86/hvm/dom0_build.c
> > @@ -617,7 +617,21 @@ static int __init pvh_load_kernel(struct domain *d, const module_t *image,
> >  
> >          mod.paddr = last_addr;
> >          mod.size = initrd->mod_end;
> > -        last_addr += ROUNDUP(initrd->mod_end, PAGE_SIZE);
> > +        last_addr += ROUNDUP(initrd->mod_end, elf_64bit(&elf) ? 8 : 4);
> > +        if ( initrd->string )
> > +        {
> > +            char *str = __va(initrd->string);
> > +
> > +            rc = hvm_copy_to_guest_phys(last_addr, str, strlen(str) + 1, v);
> > +            if ( rc )
> > +            {
> > +                printk("Unable to copy module command line\n");
> > +                return rc;
> > +            }
> > +            mod.cmdline_paddr = last_addr;
> > +            last_addr += strlen(str) + 1;
> 
> ... it would have been nice if this length was calculated just
> once, into a local variable. I'd be fine making the adjustment
> while committing, so long as you agree.

Sure, feel free to add a len variable to the scope of the if.

Thanks, Roger.

