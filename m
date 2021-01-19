Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8443C2FB541
	for <lists+xen-devel@lfdr.de>; Tue, 19 Jan 2021 11:22:13 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.70246.126004 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l1o92-0006kW-Kn; Tue, 19 Jan 2021 10:21:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 70246.126004; Tue, 19 Jan 2021 10:21:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l1o92-0006k7-HW; Tue, 19 Jan 2021 10:21:52 +0000
Received: by outflank-mailman (input) for mailman id 70246;
 Tue, 19 Jan 2021 10:21:51 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jC7I=GW=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1l1o91-0006k2-Ro
 for xen-devel@lists.xenproject.org; Tue, 19 Jan 2021 10:21:51 +0000
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id cbf037e1-b2bc-4d27-8907-7db592b8d57e;
 Tue, 19 Jan 2021 10:21:50 +0000 (UTC)
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
X-Inumbo-ID: cbf037e1-b2bc-4d27-8907-7db592b8d57e
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1611051709;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=UFn2COXuBHxblLRGoZBsxxh6zIy1E1Z4KkjjEeYPCRs=;
  b=Uo3EKQ7tdbm3v1tLV1ei/vbt8nM8+Lc2eYBBbcCLdwTB+PLgGhHpBHfz
   4+R3e/M1VOvjkWrO4+gJKZMz9N7+fdnujtdOWgE1WQpVvhMmNa90FLj6G
   F4lyEzqK0ZdjcEwFGK53wAyx7V3x7P88n/h05kSFeDiPkWLn2qV8v25Xx
   Y=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: UF7WhgJgjWLU9lGOyA3tr2U4FskkHg1LRT2LTcBI2t8idR4pP4NOOu74oP8M8ZqwGlGYxFXXLK
 9LpwqsILAKrivRJyQdM+z+E2aYd4JSd5LQtUZ7GT6N5kU6zQ0++iUGTbGhHq9lXphEW+6CY2/e
 akixllOzaaE2GYV2iDNO3uXvx5Mn8rr+TzqpXlbp9ZxSXYhNuedGixSLaZGSD5JYTx3sigQD0H
 O+5HRwH5jq6YhDhI15RWTDK50G9quYjnbzwFBzpcIAJZQax9/Tgyl+x1czgk8aaYI3tlcaHRBy
 ffQ=
X-SBRS: 5.2
X-MesageID: 36650108
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.79,358,1602561600"; 
   d="scan'208";a="36650108"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Rx2qv89ObsXUVHxHuCpF06QAbyTzkNzxZcZGD5Lnw854gm+PaVHkuHKntc3aQR0J2fGzpsYB8+/SkfliPKh1s5Mvv9KRv9bh7VtPXf0T1og/OljE3hCakCulUkjVuv8AkhnaUeywOWJv7k1Vc0D3mQR8/2hYsvaVTc7HHhFTqMJYLyXfcD0hzu9gnlWTencZcskzJWPgLuPNGUftbxE+hry8irqAZOeZW9PPK1O2hOeUU0HAGsOLUnp0tZwBzFSWWw55mkf3fN1I9B9Ygz/DkgE9T450WyfGmCusVLRBo1pZkI+4oSFlf/1R5DcmnD161B0FOCvQO75a/G7qTEnmOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HFDSjVH+Td1ailRqBHdNwccecEOujYQNjO/T5gnFcuA=;
 b=FBFYmTkcqC76WPyz1HbSGlGTICeONN8o5QXoH/eckczuCZK0pEt5FXvRZS4aaKrA3H1TUlycNWf069diPf6gbxxSYr+COtrhUoibF3r1B/39LXDboaRE+pAlBJhln6e+1kFAWzt4fv03l+pGenuMT9YoOovpvcNxZBZeH6MxmDsVwjHtA2zX841BROMhxSrXNf4V+1w4UV3nS9KraXRZkKQ60uu8VxyH7dmJrL0em8z+EiG0+sJJvGTB7CuNWzu+3FWejIiaZTa4Iz1mkszJsPRQO/NrKb+sKGG8Ra2vbOKmYDO6GTr8jSPKyHzQrINQUfyb6/0K4guIFko34Wm5DA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HFDSjVH+Td1ailRqBHdNwccecEOujYQNjO/T5gnFcuA=;
 b=LcqvNk7YtJBlO6YDEx3oCPrOSUIIxVqUxXmjfdj5C6gd93yMVusUzIrXZAivzn5S96KrOi1LNdMPvmt729TMl/hozlhK07Z7zjfI9efBAAgmyEAMOPURd0Srbj4N9+71DoGhWUFP8l3ByCkmUXDpH/CYwk91hWKv/0z3C/5+syE=
Date: Tue, 19 Jan 2021 11:21:39 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: =?utf-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
CC: <linux-kernel@vger.kernel.org>, Arthur Borsboom
	<arthurborsboom@gmail.com>, Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	Stefano Stabellini <sstabellini@kernel.org>, Konrad Rzeszutek Wilk
	<konrad.wilk@oracle.com>, Jens Axboe <axboe@kernel.dk>,
	<xen-devel@lists.xenproject.org>, <linux-block@vger.kernel.org>
Subject: Re: [PATCH] xen-blkfront: don't make discard-alignment mandatory
Message-ID: <20210119102139.4zzfb2heytfsetmg@Air-de-Roger>
References: <20210118151528.81668-1-roger.pau@citrix.com>
 <7cef385d-efe3-2661-bee2-9d21f159a5fb@suse.com>
 <20210119100651.afyccratx6ha52kc@Air-de-Roger>
 <20969962-331d-50d9-dc65-772b564ab1c6@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20969962-331d-50d9-dc65-772b564ab1c6@suse.com>
X-ClientProxiedBy: AM5PR0502CA0005.eurprd05.prod.outlook.com
 (2603:10a6:203:91::15) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: fe5124b2-3780-43b4-6d17-08d8bc64053d
X-MS-TrafficTypeDiagnostic: DM5PR03MB2556:
X-Microsoft-Antispam-PRVS: <DM5PR03MB2556C192659398F86176CE838FA30@DM5PR03MB2556.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1051;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: C4mAq4zmzSLZ9qjAv3eZdlGG2pPLq5I4rosWhzIzjbXJ3sB28IsHvJsy7BHOfrCtVcO32WW52nJGbpk+xAEU66Uf5HGWpD1F3KTm5fGQ7Ae2bC78A4IoO5ZxY6niSjCP/Y8hCua3PHN5rRkHdTF3unV7P2eSY/6t+ZbF37PfQuT1K6OWmBjbbAYgWCwAC3ci2qDYV77czwH9oe/NeTMEaDM3DCmFrgmuq1VKk5JHRgJH0zNRwPkTAH7gK5sAN8wrcQ0d1lYE7um/P58u5sfqKNB7XgG/FWQUr0gUzEHsemQroQkl2IOHIP0WoJKCjCoCnnltVpS5YFAfUoEPPYBsonbxeWb/QLAMJwk+X8k9fTJGmG9tLTM7lxbEWfQqIOiMR6vjFsg7xjpV/pS1IFHAfQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(7916004)(346002)(376002)(136003)(366004)(39860400002)(396003)(9686003)(5660300002)(1076003)(66574015)(66946007)(2906002)(6916009)(86362001)(6486002)(316002)(54906003)(83380400001)(478600001)(85182001)(53546011)(6496006)(26005)(8936002)(33716001)(66556008)(16526019)(956004)(186003)(8676002)(6666004)(4326008)(66476007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?NTVla2NiQWxnYmZiY0VNbWhQYXpUR3h6SHZnN0J2QjhPTGs1dVNqNkxoY0x4?=
 =?utf-8?B?ckhaTTIzdUxIbWtPVUVlMktGcW0zS0JYWVJubFhZb2MyeUxIVHprRWpNaW1U?=
 =?utf-8?B?TnFaL1NkbjVKdUp4T0hvZ01VWnVSanJOUEFZV2JSd1VIYzN3OVpRSkw1Nzg3?=
 =?utf-8?B?QmFkdFNBOVIwVU1pVnZjcjZnVVBHd09TNzB3Rll0MHM2U1RtdC9Ya01EYTFV?=
 =?utf-8?B?U0V0SThLQ3lPSE5mbzRnWjhrM1kzd2NEbHBNeDVnM0Y0WFhvTGV0U0JYNEZl?=
 =?utf-8?B?M3c5WVM0dldJcnpuSnVKWDdMWXl3WVNXR0U0Sm5CWHQvY0RINVVvRHlyQ2FV?=
 =?utf-8?B?SzVOYmxjYjBZb2pKczF0VFhmNTZjSkdWc2RCZ2M4aUFlU2swL0RUcUttdVhV?=
 =?utf-8?B?NnBub2RZOS9MK2FmbnR6aTBHbUE3L28rY3VnY1RZdWIraWw0Z2NLUGdsZ1px?=
 =?utf-8?B?S2kwWk1Kb1FocTMvbzVQdFBmYjRKZ1NqQUYwbi9SQndnK1kwNzZsWHh0MWo1?=
 =?utf-8?B?ZVVLemVKc3pONlVBMzJrSndMY0poQnNUaHRNSXgzbFRhVkd3WWlxTUpOclpC?=
 =?utf-8?B?N1ZGRDI3ZDU4UjRjZ0poUUVXSUh4Z3h2QjZFcVU5ME16NUtJMzNkSEhjOEFt?=
 =?utf-8?B?Y2tuYlJiRm5OUDRiWHdTYkppZjFOVm5NYXprNmhzTkp4ZHZmM2gxSFc0bi8w?=
 =?utf-8?B?bVZPeWJWQkRJRVAzUHA3NVNJMSs2Y3VtZWZSN0NtTjFJeXNMNURUOE92WXRZ?=
 =?utf-8?B?bkxES3lDRG13ME90Ylk2QWpFNkZtVldBTjk2Vk4yWTlFc2pqMFB0eS8rWUF6?=
 =?utf-8?B?N2ZKQysreEkrRGRpWGNYTVE1Vy9uaDVtRnVDeGlaM0RKNXdaNlRVeG41Z3RF?=
 =?utf-8?B?UXVCVUR6a0J0VXd6ZWpVaVFMa3ZmUmNEUlVsZ0VXZk1kWnp5NHBYdUhIcVZr?=
 =?utf-8?B?ekZVL3QwbEJlTEd3bjJPaGpDTGFwdkdRT2FDa1NIdm5VOEFqUll4VEhxUDls?=
 =?utf-8?B?Tk9WSGdvOEluR0M1bVlzSXV2eGRjanhaOTdTZloyNXYrVG1sYzdsNnJJbWsy?=
 =?utf-8?B?TmRwdWVKcUQ3QUphcm5zcXZhZDZxb2lSS1ViaVNaRXVDU3k5MS9SaTBZNS9S?=
 =?utf-8?B?bDlMT1U2Y0pBUzdMb3NFcmNzZzhycE5jdzhHNGZmZ1VoWjVwcnVnNXAxaVI1?=
 =?utf-8?B?TzkyK2hHd0JUMnZEMkx1Q2M3SnZzdGx3UStZQUZXRFhIKzJUMkdBd0FseVZq?=
 =?utf-8?B?eEdUcytKVXM5NTliMm9BY3dpNUpMNDJCMm5hQTZzS3JNWDNqV3Q4Q2s4cU51?=
 =?utf-8?Q?yB/oMm4jzN06h2ckLlmMoHQlo9g/UkmbeR?=
X-MS-Exchange-CrossTenant-Network-Message-Id: fe5124b2-3780-43b4-6d17-08d8bc64053d
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jan 2021 10:21:44.5131
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1z/0kPgFywujPE9eeO7psHJUYh27LQiKKp79zaKRvfdmRvMEdI5nT5sv9GM/7w9iaKElBhfM4DLupKryRK6Guw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR03MB2556
X-OriginatorOrg: citrix.com

On Tue, Jan 19, 2021 at 11:11:26AM +0100, Jürgen Groß wrote:
> On 19.01.21 11:06, Roger Pau Monné wrote:
> > On Tue, Jan 19, 2021 at 08:43:01AM +0100, Jürgen Groß wrote:
> > > On 18.01.21 16:15, Roger Pau Monne wrote:
> > > > Don't require the discard-alignment xenstore node to be present in
> > > > order to correctly setup the feature. This can happen with versions of
> > > > QEMU that only write the discard-granularity but not the
> > > > discard-alignment node.
> > > > 
> > > > Assume discard-alignment is 0 if not present. While there also fix the
> > > > logic to not enable the discard feature if discard-granularity is not
> > > > present.
> > > > 
> > > > Reported-by: Arthur Borsboom <arthurborsboom@gmail.com>
> > > > Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> > > > ---
> > > > Cc: Boris Ostrovsky <boris.ostrovsky@oracle.com>
> > > > Cc: Juergen Gross <jgross@suse.com>
> > > > Cc: Stefano Stabellini <sstabellini@kernel.org>
> > > > Cc: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
> > > > Cc: "Roger Pau Monné" <roger.pau@citrix.com>
> > > > Cc: Jens Axboe <axboe@kernel.dk>
> > > > Cc: xen-devel@lists.xenproject.org
> > > > Cc: linux-block@vger.kernel.org
> > > > Cc: Arthur Borsboom <arthurborsboom@gmail.com>
> > > > ---
> > > >    drivers/block/xen-blkfront.c | 25 +++++++++++++------------
> > > >    1 file changed, 13 insertions(+), 12 deletions(-)
> > > > 
> > > > diff --git a/drivers/block/xen-blkfront.c b/drivers/block/xen-blkfront.c
> > > > index 5265975b3fba..5a93f7cc2939 100644
> > > > --- a/drivers/block/xen-blkfront.c
> > > > +++ b/drivers/block/xen-blkfront.c
> > > > @@ -2179,22 +2179,23 @@ static void blkfront_closing(struct blkfront_info *info)
> > > >    static void blkfront_setup_discard(struct blkfront_info *info)
> > > >    {
> > > > -	int err;
> > > > -	unsigned int discard_granularity;
> > > > -	unsigned int discard_alignment;
> > > > +	unsigned int discard_granularity = 0;
> > > > +	unsigned int discard_alignment = 0;
> > > > +	unsigned int discard_secure = 0;
> > > > -	info->feature_discard = 1;
> > > > -	err = xenbus_gather(XBT_NIL, info->xbdev->otherend,
> > > > +	xenbus_gather(XBT_NIL, info->xbdev->otherend,
> > > >    		"discard-granularity", "%u", &discard_granularity,
> > > >    		"discard-alignment", "%u", &discard_alignment,
> > > > +		"discard-secure", "%u", &discard_secure,
> > > >    		NULL);
> > > 
> > > This would mean that "discard-secure" will be evaluated only if the
> > > other two items are set in Xenstore. From blkif.h I can't see this is
> > > required, and your patch is modifying today's behavior in this regard.
> > > 
> > > You might want to have three xenbus_read_unsigned() calls instead.
> > 
> > You are right, discard-secure should be fetched regardless of whether
> > discard-alignment exists.
> > 
> > I can fetch discard-granularity and discard-alignment using
> > xenbus_gather and keep discard-secure using xenbus_read_unsigned. Let
> > me send a new version.
> 
> I'm still not convinced this is correct. blkif.h doesn't mention that
> discard-alignment will be valid only with discard-granularity being
> present.

No, in fact I think I need to rework this a little further. Just
having feature-discard = 1 should enable the discard functionality, by
setting discard-granularity = physical block size and
discard-alignment = 0.

Roger.

