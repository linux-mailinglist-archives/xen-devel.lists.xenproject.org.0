Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 192102E9BED
	for <lists+xen-devel@lfdr.de>; Mon,  4 Jan 2021 18:24:39 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.61420.108073 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kwTag-0002Gg-6I; Mon, 04 Jan 2021 17:24:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 61420.108073; Mon, 04 Jan 2021 17:24:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kwTag-0002GL-2t; Mon, 04 Jan 2021 17:24:22 +0000
Received: by outflank-mailman (input) for mailman id 61420;
 Mon, 04 Jan 2021 17:24:20 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=N5j7=GH=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1kwTae-0002GG-Ku
 for xen-devel@lists.xenproject.org; Mon, 04 Jan 2021 17:24:20 +0000
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 976abe26-1dec-4524-81da-e63beecc6875;
 Mon, 04 Jan 2021 17:24:19 +0000 (UTC)
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
X-Inumbo-ID: 976abe26-1dec-4524-81da-e63beecc6875
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1609781059;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=BXxbHXE5HtdCF0wqhBm06vU6qLsNZ7D5livuyxigZgw=;
  b=d5xqvy15R2SJVCEace3RkkjpIcsriWybEst188XOZN+WJ8Zn6nJtDj6H
   YLsCS2JHMXq8eeG4Wg5Gh/xJ1PzdRLvkohRdzoFHhZFFiiQ9BWnrL3/z6
   9YGFTF+UPXY2Cq7iKRj3f2zd2zvbqqUJxYN+TUzdglhEhCrBpAvGuCA5J
   g=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: gzSaRCWrXe/bCF564QU+wyEPzXkrRarQGp9kK6LFqJF+HIr3bkD/UBHfjPKCfc1PwlHd1vDr4f
 4Lzx9OzZIJZHr0/NuBtdzPcR73aR/CFIQC1l5GJNp+qX+hWJgsOBJK0fDQRaW+SOS7nv5cUuso
 daBGuV1cLZOHk7MClIDRNMQ2Oi5Q3eIYTBuuSeIko5YXqSwwsanpVLaXBKm8qEZGL+zqT1UVkb
 Vqbog+LFYsvYz+gBfYZIUagP02z8SE0A93zTKvYF1FXwiWQQmpjEFwZg9lvqhXUzEkIwIdoIlc
 q2g=
X-SBRS: 5.2
X-MesageID: 34585851
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.78,474,1599537600"; 
   d="scan'208";a="34585851"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=I3P+fYmnQh7LBR+CieJQOYx7gCNI7LaHSyROEu3N6dZtNjz/2AhrgXZmwz0e5Gn42Du79hKgRow12qbdNNw4Q95bucI7+siFFa9o8ePyzLk94UzFCjPqXhkbFuf4nEP0/BJ3eGxlnBBsFA++/YsKntjhoQZ6GHv4UWjkavh4FaJFYWhiQJGy8Jc9lPv/4tqPuBA2p8FpjMvDmvfNqu3zAkUFJ4xyn20zfRVvZhf68zxJU+3zSnQPk3Pm73MfasIffUtul/hbqbYlz8AKXqwaYLnxH84KfDpXUbIqYa9/cAfNplAunsdQIJSoaZ5TfPHuTmbLOB06SNhxFR+IQ7hajg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hnUAMHaoljILWgfC+ylf5X6xuslvAkjPN2r+eA3ot9Y=;
 b=SQzZ+GsalsLRSjewbPPyYQoXzi7bHnZBL2VyODYFleqofNcC4jQsSbi/9D0XvhO09p7yIUgXwIImUXqb9m6fH1uppr3Z6aV+28sJMiRbn9EdCCvU84GwNCVF7d61XTXSfX5sTUue5hVOZWliTj67F9VvK3feYHAw4ZJ8nF2c7rMucrpImqdto323Jt6icEjq1cbjavYSAnNNS8iC0LNRgeH7teNK2tpdM84TgVqZJ6416xnMVe4I+C+4/VBSSIJPSgGRSqNs5XyNtWj/bYMu6lTsHU0mgsnPYvwMEGQdlr7hrSJoWKkbHkMYmvqzHZ2BkJpND/Nj4lMQyo8PxKCbkQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hnUAMHaoljILWgfC+ylf5X6xuslvAkjPN2r+eA3ot9Y=;
 b=p9RentdLZqGRALtG+sQT/QQ86efGdT7BMlWe0Rx45CLJABJVu7JkLDPBwM42DvyMZn9g4UDfFyxYhKaJ1yzWw/mkSdm0YxvH+gVNDOr0KXdrPP2Or/cpGvGEJIrHwHrud6OL4jLYjTslzLhFXJfH42mAYtIdY14qgKKt12FuVCk=
Date: Mon, 4 Jan 2021 18:24:11 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Manuel Bouyer <bouyer@antioche.eu.org>
CC: <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH 12/24] Implement gnttab on NetBSD
Message-ID: <20210104172411.pajmvdz45xlobq34@Air-de-Roger>
References: <20201214163623.2127-1-bouyer@netbsd.org>
 <20201214163623.2127-13-bouyer@netbsd.org>
 <20201229111601.x5gmbcai4d7ex5yd@Air-de-Roger>
 <20210104102951.GE2005@antioche.eu.org>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210104102951.GE2005@antioche.eu.org>
X-ClientProxiedBy: MR2P264CA0011.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:500:1::23) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a4feb271-87af-4dd7-4411-08d8b0d59002
X-MS-TrafficTypeDiagnostic: DM6PR03MB4539:
X-Microsoft-Antispam-PRVS: <DM6PR03MB4539DE9F6EBDE980421C595F8FD20@DM6PR03MB4539.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: oomJLzBDztk4VgJdsDo8R/jiZrpFb+sdonFisQI5pvwUx1W6KilI2YKpB4B17rXCjgbv/xiqbA1Q9qUOB43CGuZjmSlCf7oxqkJCn+HAXSKy0rIn4n/Xw1XYFExHZI+RzDKRJzrA/wYhlu4n9ORCvb3udOEf3K5YWthG2r8RkJ0V31pPLHDE6iEom+6NkdsirgflkSYUBUz3Le7VspvhTebNYHSxt6ActlWNYC/M9AXRSsUtYTInOxlXFEBN5R+s4NdLlnTS1+Ih/z4xr0vOQsW1Q0+HPa+hPPs3Mj/6goOYxM2iJJGiIrELKq6AYeUS4SZf9hHP8WiWCZamI6h/8F2COqBKe9FGP1NlGabymp0E9RUmonDI1O53Es+IKhXCdtJ8uCIJGyD2dB4gnQo58g==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(7916004)(346002)(396003)(376002)(366004)(136003)(39860400002)(4326008)(26005)(9686003)(6496006)(5660300002)(66946007)(16526019)(186003)(86362001)(85182001)(66556008)(66476007)(6486002)(8676002)(1076003)(6666004)(316002)(83380400001)(2906002)(8936002)(478600001)(6916009)(33716001)(956004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?V1FZc0l4bEF1UzVLU2lGSXFHcm91NVptcmtFTUQybzJOOTl4bWVmbFZ6ZnpR?=
 =?utf-8?B?M20zMWd2UEhpUThyRzh6WFlzSTM1TFJNdXloMk9Zd1BHS1kxNS9ITjNjOFVy?=
 =?utf-8?B?MDVKNUljL0JYL2IxeFV1TUo0dGZmWUFXVGs1Y0hFS2ErOHpKRkxKaCtuR01S?=
 =?utf-8?B?aCtiM2JDaVlVRUIvN2pSN1EwTDhuRURrOC9jeEY2Yi80SmcxZTFnd3BVS0hD?=
 =?utf-8?B?UjdwV2I0bXg4Q2VFbGE1VHFuNGdWMjBmdko4RGJ5OU9maTZaeEMvRnZ2ODRl?=
 =?utf-8?B?VUt3cktmandEeVp3a0lXdUs2WUZ4OEZndGVYYlFGR2xrUU9PSFlKeklvTkhS?=
 =?utf-8?B?VVZ1N2gxdUZKYk02dWlsOWFFd3dWQVdlMGRKb1dmZy9lMVA5N2FDaUdqTENq?=
 =?utf-8?B?aXJydnFaSjVadDcrMmZIS09KL3REb2Nkc1E1blhYd1ZuNktEZXJ6L3dJT0JB?=
 =?utf-8?B?WkxGQXEvVlNMVlVlTHRKOGh0THdqMzRQNFVHWnArZHQxdGk2MGZmaHpaa3NJ?=
 =?utf-8?B?MXlkdDgrWDdYZXN3bzlwSE9OcFhxN1YwTzZERkZFempnR1hxbGowaGR4VTgx?=
 =?utf-8?B?UDNjdWQvYlhrUFRYVXVONE9mb2lOZlBpMUlRNzA4VmhPVFZjTTF1WWxOc1cv?=
 =?utf-8?B?N0FoaVc1UVI1Wi9Nc3FoSjRaTFRGZnRuVisxVUNZUFAyVS8rNldpRiswTE1Y?=
 =?utf-8?B?R3hQWlExYXJRUmtYWjdBL0V6NERBRU9ONE9rOWd1YkllZW85SUtKUldSSGF2?=
 =?utf-8?B?cEthWWczMHF3V3paMHVJdWhJV3J4RTV1MG80T28rMUlzaTVpNFV4QkNpazBj?=
 =?utf-8?B?WHphdlE5QUV0cUdobGNPSGN6cUs0bHhzNG1iLzkveUhLdUY5OFlwMmptRFhZ?=
 =?utf-8?B?MEh6dGhFcm1zVjhRbk1hd1JoK0ZzK3hsQWdsRVpRZnpTbFEwVThoYm9sL2ZZ?=
 =?utf-8?B?M3k3VGYyeUJTS2pmQlp6QkdQbjJBdktZVktpZUJ1V1d5ajN1Wno2bTlYbkN0?=
 =?utf-8?B?NjhoZjdNa1lrTGRIb3FueFdaeWNMRWVRTzVhbCs5a2l2OE13UDRlcUM5V0Qv?=
 =?utf-8?B?dUJqZnBGNDIzWUgrREYwajNobTJZWEcyQXgyK3Y5K2dFZForMW1zS2xlbnVp?=
 =?utf-8?B?N2g3SzNPbVFMTVNMVEF5K1NsMUNZZkRBRENCTjdLMU9pR3JvY2F5amdsYVRx?=
 =?utf-8?B?a0g0b0hLN1lkTVczbGViWlI2d081MkVBTmZkcW9kaXlic3Jia2dqNHQxN1VT?=
 =?utf-8?B?S2VaN3VINWhvNTI4cEE1OTNmUHVHcElFaG9wU3Y0Q2k5YXZyZzBORjhwYTdK?=
 =?utf-8?Q?z8Baq5ySNT7vXcAtiaudtRM5meulZLPZ33?=
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jan 2021 17:24:16.2021
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-Network-Message-Id: a4feb271-87af-4dd7-4411-08d8b0d59002
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AnMchfa9x2ijrP3z/n8Ow8pXlBeqctZ1XaVrCCZqsUhMNqwvtS1unVQYF8lAMdpI3USKD4V3paHgQRY+UjHIpg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB4539
X-OriginatorOrg: citrix.com

On Mon, Jan 04, 2021 at 11:29:51AM +0100, Manuel Bouyer wrote:
> On Tue, Dec 29, 2020 at 12:16:01PM +0100, Roger Pau Monné wrote:
> > Might need some kind of log message, and will also required your
> > Signed-off-by (or from the original author of the patch).
> > 
> > On Mon, Dec 14, 2020 at 05:36:11PM +0100, Manuel Bouyer wrote:
> > > ---
> > >  tools/libs/gnttab/Makefile |   2 +-
> > >  tools/libs/gnttab/netbsd.c | 267 +++++++++++++++++++++++++++++++++++++
> > >  2 files changed, 268 insertions(+), 1 deletion(-)
> > >  create mode 100644 tools/libs/gnttab/netbsd.c
> > > 
> > > diff --git a/tools/libs/gnttab/Makefile b/tools/libs/gnttab/Makefile
> > > index d86c49d243..ae390ce60f 100644
> > > --- a/tools/libs/gnttab/Makefile
> > > +++ b/tools/libs/gnttab/Makefile
> > > @@ -10,7 +10,7 @@ SRCS-GNTSHR            += gntshr_core.c
> > >  SRCS-$(CONFIG_Linux)   += $(SRCS-GNTTAB) $(SRCS-GNTSHR) linux.c
> > >  SRCS-$(CONFIG_MiniOS)  += $(SRCS-GNTTAB) gntshr_unimp.c minios.c
> > >  SRCS-$(CONFIG_FreeBSD) += $(SRCS-GNTTAB) $(SRCS-GNTSHR) freebsd.c
> > > +SRCS-$(CONFIG_NetBSD)  += $(SRCS-GNTTAB) $(SRCS-GNTSHR) netbsd.c
> > >  SRCS-$(CONFIG_SunOS)   += gnttab_unimp.c gntshr_unimp.c
> > > -SRCS-$(CONFIG_NetBSD)  += gnttab_unimp.c gntshr_unimp.c
> > >  
> > >  include $(XEN_ROOT)/tools/libs/libs.mk
> > > diff --git a/tools/libs/gnttab/netbsd.c b/tools/libs/gnttab/netbsd.c
> > > new file mode 100644
> > > index 0000000000..2df7058cd7
> > > --- /dev/null
> > > +++ b/tools/libs/gnttab/netbsd.c
> > 
> > I think this is mostly (if not equal) to the FreeBSD version, in which
> > case we could rename freebsd.c to plain bsd.c and use it for
> > both FreeBSD and NetBSD?
> 
> I can't see why they won't diverge in the future ...

True, but then let's diverge when we have to cross that bridge I would
say.

There's IMO no point in having two verbatim copies of the same code in
different places, it's just more churn to maintain and to remember to
apply duplicate fixes.

Roger.

