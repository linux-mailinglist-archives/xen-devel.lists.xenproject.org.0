Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 701452F1BBB
	for <lists+xen-devel@lfdr.de>; Mon, 11 Jan 2021 18:05:12 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.65082.115183 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kz0ci-0007DU-6q; Mon, 11 Jan 2021 17:04:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 65082.115183; Mon, 11 Jan 2021 17:04:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kz0ci-0007D5-3M; Mon, 11 Jan 2021 17:04:56 +0000
Received: by outflank-mailman (input) for mailman id 65082;
 Mon, 11 Jan 2021 17:04:54 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/ci+=GO=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1kz0cg-0007Cf-JH
 for xen-devel@lists.xenproject.org; Mon, 11 Jan 2021 17:04:54 +0000
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 0d002faf-011d-4d59-b9e9-ac643f5a5d3e;
 Mon, 11 Jan 2021 17:04:52 +0000 (UTC)
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
X-Inumbo-ID: 0d002faf-011d-4d59-b9e9-ac643f5a5d3e
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1610384691;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=L1CQjddltj8uPn/cnJVdkDrfGU5fDv7mgmpOTp2E93I=;
  b=GDGG314LE0tE54EdgmW+IjC3XV3qGrbWCQzzno2FHOoEQjq36APKDsMT
   CU8JN1sIbRsQ5Cai4qlmRnZ3FlRM6xIKmgN/HGHjoh4vDDZ07l9orYlFB
   z6SAms35waaaGfyf8dMmJZmRWyiMFYsfExIFQNQxf119QPleUxJgQS0GH
   o=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: SJHqcfI/mAEhNTFc01dVLezf84StVhUqPeZa3Jx2cudJGxRKof6gITcG4JZ2VeWfrCcQMlNBTL
 iw9EzoeaXA7pELDK5HkKDsyRRoMBrnEisPoSiw97FT5cPGvPinR9kE81fygfCpHSRgXQTjpjkY
 JqNsR/CRboVcy/hCRdeJI8RD5ZTzF/PVo8nyzQqqn3Pv+cugRSUMnvh1Y+2DYHjVXmFx0T17B5
 Ua/l3Mr1ceiDVvAfmjmu1b9+lC2D3t3JP8ayJsecKkuqesB1QKwYzHPu4PGBhZ3ZGD4S+xYAFZ
 MME=
X-SBRS: 5.2
X-MesageID: 35061640
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.79,339,1602561600"; 
   d="scan'208";a="35061640"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NOkZM4acDPbKfSQgKUo/PKxEwOtiN/1orcB6tGsEud/YXlu7IBLtYetz8Q7uLiJO6ALeIwpEIUbzY9v+EyHcxtPp6JsO87alM/fue6eLIiFcau4Jc1YGJc8iWBdzFg0CPup/Dn0xYaBizfTIE2WK/JHKBArU40a1f3EQlsMjKlfISUwFOPaPGj4yJcMOtAzUzZLQhkWQhJEm/IRzK4o1mDgFwYXJ2IdW+LufOCvApVTFqNw2qBkYUWd/e4+lQL+LqoU5fpvVrcoRs1BjLPLIK2B9ExXPXp9z/73O0yAMB2uVam/Rlm2CGKhCl1eEor2UyJZYy3L1TDEEDHf2V1q9hg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=q8GT9nWdKrqVquB2JAJVotLQcqVdBNo/f/slwfxYONE=;
 b=XeE8kxc0dEGivdglAkqXPRe2KJBvLJWj2FfAx3SgNBytzRrAQETm0zJOyXXwF57IMpgkjQERrMIk/Gk2q2QfBXV2clVIm7ZKPOVP0U4jSrdzi8x3FCqpcNlqCoJcwvkaGdVmcQ57O5q0FdWwJwsXKgZ1gguV3sfnXK/A+fT2oZt4DmgVKqxZ5AbEI3k0MTwRQUuxZPAbJWlk1Bhz7Msdo62clpZekbO03QT9VYv3thfYcZg7VtGNcYuJ9WE2KSpcJzKbxGlGTViYR4X05kQeOK1HZ9gYPf2fBRdbkLlRnMjLJLr8sEBQiENgvZZ+jToINiukUIOG1h/2r/BRZpyanQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=q8GT9nWdKrqVquB2JAJVotLQcqVdBNo/f/slwfxYONE=;
 b=UPB88pFf/c4tFFcTxW28ASv7llUQHeps0gfHdPyxN7fcM396repx6E0R5qQ8jBdOZb4B6Swtc/uyNBH6EDllpVpIXaW7TptIJiU2Fzcp9ram3DQyg0BOVqTgpY9LyUwbDoTdcshT4Al44AUimYG2YgIBkRGeMYgy9eA1kfuXGsY=
Date: Mon, 11 Jan 2021 18:04:41 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Manuel Bouyer <bouyer@antioche.eu.org>
CC: <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH 12/24] Implement gnttab on NetBSD
Message-ID: <20210111170441.s6o3z7fwnn4o4aoa@Air-de-Roger>
References: <20201214163623.2127-1-bouyer@netbsd.org>
 <20201214163623.2127-13-bouyer@netbsd.org>
 <20201229111601.x5gmbcai4d7ex5yd@Air-de-Roger>
 <20210104102951.GE2005@antioche.eu.org>
 <20210104172411.pajmvdz45xlobq34@Air-de-Roger>
 <20210110124050.GB1966@antioche.eu.org>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210110124050.GB1966@antioche.eu.org>
X-ClientProxiedBy: ZR0P278CA0028.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:1c::15) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: bb189181-28b3-41e0-21e0-08d8b652ff9a
X-MS-TrafficTypeDiagnostic: DM6PR03MB5321:
X-Microsoft-Antispam-PRVS: <DM6PR03MB53215F36D5B9F0B9116B73208FAB0@DM6PR03MB5321.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 1E7fW2yltKtD5+JYHq6YyWOqTNAQsCl4Aeq6AIniOJ/lHOMOVekvKIBe74p6n3G1XItV2esbNoXVxpMcHXJp7yM9TlP5WBAISpfrGkJPqugz5mM7GPAtfJRcIgl/giNZ2UrAHlesd07laM6Z2j/jWLfcnbluznOLbWANXqujcVQrO/PgWkMdpHSR0nOps4rLcQM/L09agOmW/FfzLxS4nFEk55X7ejLiYBdvIl/4vUaDvbQT7KAo6xgbul8Xlg/xOYL19cTSoHRqqwXiVo9SXxIfdShP7ox4JPN6tLy2etF7dmpRQ7R5mTSX/n+CaGpCitWVNaErZFI/AFM1OFLwIpLj2BAAOYLAfh9zSaOhDUjKz4ElZ3zMFhSSNorx2MqUDlLfOV87qrykuZEMxKhRPA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(7916004)(4636009)(39860400002)(396003)(136003)(366004)(376002)(346002)(6916009)(9686003)(33716001)(6486002)(6666004)(1076003)(316002)(5660300002)(6496006)(85182001)(66946007)(4326008)(66476007)(66556008)(8676002)(83380400001)(186003)(8936002)(956004)(478600001)(2906002)(86362001)(26005)(16526019);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?b1NPR1hjUU5seGtKRVRwOGE4UUJ0WUhXYTd5T3FjYXppajVHTjQ4dVYvenJp?=
 =?utf-8?B?ckdRdE1SUHY1NG1acW5jb1JXSFZ4K0ROWGVZdFYrVTVhZGFYUlFRQ1ZDTlo4?=
 =?utf-8?B?SGpHN3pOd2svS0tqeFVWWlJEWlJRYlZsWnV1K2tIWFUxemFlR1VuV212TXVK?=
 =?utf-8?B?ZXpkQ0pValY0RjJIQ3hSckl5eHYvVlB1Qy9XUkxYOFJtU2o3Ny9aZ1g5dzht?=
 =?utf-8?B?K2gyczRCN09IVG5zU0dSTnV5OHdQSnN5Q2x2OWRhZE5HWllzN1p1Q29YWUN5?=
 =?utf-8?B?dWlPSTFPYzZLcG9FZzRETk9YaHZXYkloYW5yS2V0YjFMc3ZsaE42Qk9ZS2tL?=
 =?utf-8?B?OHBCOEJZQnptUk1CaVRDWThkcVUwRXRSRk5SVXdTOXR5YTBtTWlnakRKakJE?=
 =?utf-8?B?RjJCMHBUaFAxcW1lNEl1SGQxRk9ibVZXb0FXejkwZDA1eWd2OUZOenlISVZT?=
 =?utf-8?B?eVY0QUhwdThCT2kyaUMxNS91T2pCN0JneXVKek5vaGN5Z0pjdnZFQU9XS0dP?=
 =?utf-8?B?WlRhOTFnbjU5RXYvOFZtUVV5V1lqWXBLVzN4THpIWlEwVldKeFRzWDh0MUhZ?=
 =?utf-8?B?OXMrZy9GdmQ3Vkdib1UwYTJzMERLem5OOU5RRS9TdFQ1RkJyTEhsL1ZvUGFu?=
 =?utf-8?B?ay9SZ1MzOGZiQmVHMGpwZFBEeHJGT0hKNmNlYjN0S2M5dGpXZGxxYkVISFZI?=
 =?utf-8?B?K3JFNEtETDZKNmU5djhYdDluSHRVbjBCdWFRUWgvTUpIU3c3cXVOeTd2TnVU?=
 =?utf-8?B?YXpseHhIaGVIR0ZnZiszeGsvMHZSOHJ2YlZXd1lic2NVb2Jmc3VKNEpidExn?=
 =?utf-8?B?bktTOXdPOWZNa01jZ1RkVkEzdjR1MGZOSDZjSXdsR0VHSzdobjdmRkcvd0ZS?=
 =?utf-8?B?Q29MekRrZTBwaC9zQkliMU4zMVZta2U3QkJmaHlGUGlxeGdub3pIbDFmN21W?=
 =?utf-8?B?d0treENHZXFIRU91RkFsN3ZiQ1JucUNEdndoQllEbUlKV09ieGJDV0tiM2gx?=
 =?utf-8?B?U3FnUGhyL3JvOGFad3IrNU8rU05JajVWNnM0bFVCRUpPaTVNbVI0L3FmbDFI?=
 =?utf-8?B?WUhHMENhckZZcmVud0ZTTWNnVWdzc2ZlVTJjb3VCbHlQWmRRSk9ic3JZeUcv?=
 =?utf-8?B?NWF6TTB1bnJ5TXA4dTZKQnlRRWsxUnFOclpCVVViZkhFWDQrcGVPdFZndzh0?=
 =?utf-8?B?Nm5BQ29XdFFxRnRGemNGV2R2cVlFR29HRS9wYldjZFVNQmViQnBkY2xRbGN4?=
 =?utf-8?B?K3cwV1VzOGlZbUx3MFhudEVrR3YyemFCWWxjNzh4SXBTUEhieXlTZkNFUWVt?=
 =?utf-8?Q?UjQn5Wy1DHogaOwm8gFJnscaJEzTSqISlw?=
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jan 2021 17:04:46.3505
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-Network-Message-Id: bb189181-28b3-41e0-21e0-08d8b652ff9a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dyfCVWbtBNTJQ7BC+vjrRD8dOb8GEPbCbp8hhnNJ+USMDdU8Rk0e8TYd7EtyZ+QwFhv3EUrpHF1gI25C9odB0Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB5321
X-OriginatorOrg: citrix.com

On Sun, Jan 10, 2021 at 01:40:50PM +0100, Manuel Bouyer wrote:
> On Mon, Jan 04, 2021 at 06:24:11PM +0100, Roger Pau Monné wrote:
> > On Mon, Jan 04, 2021 at 11:29:51AM +0100, Manuel Bouyer wrote:
> > > On Tue, Dec 29, 2020 at 12:16:01PM +0100, Roger Pau Monné wrote:
> > > > Might need some kind of log message, and will also required your
> > > > Signed-off-by (or from the original author of the patch).
> > > > 
> > > > On Mon, Dec 14, 2020 at 05:36:11PM +0100, Manuel Bouyer wrote:
> > > > > ---
> > > > >  tools/libs/gnttab/Makefile |   2 +-
> > > > >  tools/libs/gnttab/netbsd.c | 267 +++++++++++++++++++++++++++++++++++++
> > > > >  2 files changed, 268 insertions(+), 1 deletion(-)
> > > > >  create mode 100644 tools/libs/gnttab/netbsd.c
> > > > > 
> > > > > diff --git a/tools/libs/gnttab/Makefile b/tools/libs/gnttab/Makefile
> > > > > index d86c49d243..ae390ce60f 100644
> > > > > --- a/tools/libs/gnttab/Makefile
> > > > > +++ b/tools/libs/gnttab/Makefile
> > > > > @@ -10,7 +10,7 @@ SRCS-GNTSHR            += gntshr_core.c
> > > > >  SRCS-$(CONFIG_Linux)   += $(SRCS-GNTTAB) $(SRCS-GNTSHR) linux.c
> > > > >  SRCS-$(CONFIG_MiniOS)  += $(SRCS-GNTTAB) gntshr_unimp.c minios.c
> > > > >  SRCS-$(CONFIG_FreeBSD) += $(SRCS-GNTTAB) $(SRCS-GNTSHR) freebsd.c
> > > > > +SRCS-$(CONFIG_NetBSD)  += $(SRCS-GNTTAB) $(SRCS-GNTSHR) netbsd.c
> > > > >  SRCS-$(CONFIG_SunOS)   += gnttab_unimp.c gntshr_unimp.c
> > > > > -SRCS-$(CONFIG_NetBSD)  += gnttab_unimp.c gntshr_unimp.c
> > > > >  
> > > > >  include $(XEN_ROOT)/tools/libs/libs.mk
> > > > > diff --git a/tools/libs/gnttab/netbsd.c b/tools/libs/gnttab/netbsd.c
> > > > > new file mode 100644
> > > > > index 0000000000..2df7058cd7
> > > > > --- /dev/null
> > > > > +++ b/tools/libs/gnttab/netbsd.c
> > > > 
> > > > I think this is mostly (if not equal) to the FreeBSD version, in which
> > > > case we could rename freebsd.c to plain bsd.c and use it for
> > > > both FreeBSD and NetBSD?
> > > 
> > > I can't see why they won't diverge in the future ...
> > 
> > True, but then let's diverge when we have to cross that bridge I would
> > say.
> > 
> > There's IMO no point in having two verbatim copies of the same code in
> > different places, it's just more churn to maintain and to remember to
> > apply duplicate fixes.
> 
> Actually I just checked, the files are quite different, because the
> GNTTAB ioctls are not the same, and it seems they don't work the same way
> either. FreeBSD does mmap against the gnttab device; this is not supported
> on NetBSD. Merging the two would cause an #ifdef maze.

Ack, my bad. Then it's fine. I got to think they where the same by the
copyright message.

Thanks, Roger.

