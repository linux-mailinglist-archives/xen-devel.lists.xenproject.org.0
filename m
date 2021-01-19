Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 02AFA2FB51F
	for <lists+xen-devel@lfdr.de>; Tue, 19 Jan 2021 11:07:43 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.70231.125974 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l1nul-0004kU-SW; Tue, 19 Jan 2021 10:07:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 70231.125974; Tue, 19 Jan 2021 10:07:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l1nul-0004k5-P6; Tue, 19 Jan 2021 10:07:07 +0000
Received: by outflank-mailman (input) for mailman id 70231;
 Tue, 19 Jan 2021 10:07:06 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jC7I=GW=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1l1nuk-0004k0-3z
 for xen-devel@lists.xenproject.org; Tue, 19 Jan 2021 10:07:06 +0000
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id b81b8521-090b-47c4-a8e3-f1f30bd6c669;
 Tue, 19 Jan 2021 10:07:04 +0000 (UTC)
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
X-Inumbo-ID: b81b8521-090b-47c4-a8e3-f1f30bd6c669
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1611050824;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=/bjQxp8HUntoGdxdqO1JnJG/djS2EtEng8HELIQA1cw=;
  b=NPDec9w0o2VLg4e7YOxJn2rJrmKuh96+oNmXA7s6F22+BBAWY/eMdUbi
   /papufk6Z/HdG4SOUAFCfnUna9DrZn6A/ew66ufd3m10R4lkpULFdmrEn
   UphQcuLWy9t4w+dkP/567LyGj0HVcTlBmr1+EW+gPVsP4BAbMg7X+MjEM
   Q=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: C22xdEYPtmlMTywRWCzJWkbz4H34HboZFqMQZaLRBHJU6B7XaruOD7Pm60y4S+1oNspAVig0y6
 4MJvJ520QTu85q9CcpmDZEn61DPRyYV6QEQ9kl9r/AdnokSiP0Ezv+GKLvKF/p8k4f+1Uj2429
 wvQn/3YspDHrG8U+AP1GeqWYvezAOJt4EKbptRwESiPn24yDG2PndQjtvUK14tlLssweM58yuy
 uHcJQeHsdsb/s1Ua/41cFU+nwxMRXwJgBWBHi2t0kgwQQ4EsaLf6kMB1mww/W4LVm8LjXBIo8g
 lH8=
X-SBRS: 5.2
X-MesageID: 35341747
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.79,358,1602561600"; 
   d="scan'208";a="35341747"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JI0XUotUQaEZValQfSFcb7Pn0oDqqMixD51pQEdPNBKF+XTimHLUqfd8V0KyN6iVp+f7JBBtToTh9o19wCgs2IWVO3xm4HaWa9MqHAfW4pirSFEljHWmyHA+bEGi8qPEecOENrIkAF4fACwvRKXGV7gAsnGvoC3auLNt4GUI4vdcQmUiQthEdTHUqyY1+KA6fT+haAGv45XJbrI3bwItuV4e/C6gP2ke7SerFTRr4Ywz1tfJE339kmYsnFyaOYklyq3rKi+iAnOjn0vMwABiu9gMR2khuowr9jvpYvxC2EVwk9U5hXgqicxdY/igATjhQYpqMuDqh2AoGYjWK5KIaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lc8cFj7Eh/9trtedhQvRmKRka4ZR+13SpzisBpzDx6g=;
 b=eA1mhZfzWE7o1o3NHmurcOJWH2WeXXG7d5n6LyH3ZpGM2WDll2x9DqQX+Yu/nupsvmVAVZVof2xNwRC9W4dH6Mb0svDh7L3VsP86nu6u2SPb2f79f/mwOwAVgYmzG+pU7e6WgMj5hZnuFWG4wEFVDktS3+hUBjUPIAPm7xkm9Bs+Tyy83vTO8Ol7N1fGHUsgFsjjiHFZ4plaQ+e/U6RXsjlY/C/AB9ZBGzdmMC7O3kWHmRzpBG37oIjqu+6x40cbyFpoZlMhyJffzRNGUJ5X9xb1s1xPwXfT51UkE7IOeQcs+QoXvj8bYQtn/DZ0oro28dYHvEUhzQg4W4Xsci1ZzQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lc8cFj7Eh/9trtedhQvRmKRka4ZR+13SpzisBpzDx6g=;
 b=iWiaRucQYYKQ8iONu+Ww4h5bq2rrjQmjJsNIoREKszM3g8ddBkv6xRohECn2jjETxf80QdHoqFJ/2Wa0A/+Dp59T8s6qxJDV8aKJQGUXS7hnM0KYEE2nfYtASYtfXLRMBwWJkWipGIIu3Jc6dgJoihDnJ57tN96p28i6waOScM8=
Date: Tue, 19 Jan 2021 11:06:51 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: =?utf-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
CC: <linux-kernel@vger.kernel.org>, Arthur Borsboom
	<arthurborsboom@gmail.com>, Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	Stefano Stabellini <sstabellini@kernel.org>, Konrad Rzeszutek Wilk
	<konrad.wilk@oracle.com>, Jens Axboe <axboe@kernel.dk>,
	<xen-devel@lists.xenproject.org>, <linux-block@vger.kernel.org>
Subject: Re: [PATCH] xen-blkfront: don't make discard-alignment mandatory
Message-ID: <20210119100651.afyccratx6ha52kc@Air-de-Roger>
References: <20210118151528.81668-1-roger.pau@citrix.com>
 <7cef385d-efe3-2661-bee2-9d21f159a5fb@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <7cef385d-efe3-2661-bee2-9d21f159a5fb@suse.com>
X-ClientProxiedBy: AM6P194CA0083.EURP194.PROD.OUTLOOK.COM
 (2603:10a6:209:8f::24) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0d9fe86e-2153-4dab-5323-08d8bc61f596
X-MS-TrafficTypeDiagnostic: DM6PR03MB3481:
X-Microsoft-Antispam-PRVS: <DM6PR03MB3481398789CAF19A303019478FA30@DM6PR03MB3481.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1751;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: tJqjiTTFz2G0fHOM331E2sz92CaSn0KOqmYR7mHRZVSwNp7baqZhNObdvWnSZnioDVWi7vy6pIE2T+QYufPfGSKSzT/zeB+F/MCdln7Jlc8LxWjj4G8GcsEUpt4PtDt8IuzyX+9Vj5Q79FcUxkJy/45i5Bq5oqYS3uIinkMnun3LPelyo1BzDKQ8vLuYNYegahXrPd25VCFv9edmalAZBXydbnyp6WLT6BGT6vYQ1+EJIYDHEj/G/7O8RGk0pFMnwI0ZNrjTS0/DGuUV2Ev9aH5DDW3csu5foUn6Oj8FOqleWygI71QVm7PPX8lVSsFO7LB3RkTaOT8yAs6UIeimX/jYwfDoUns/c/00Xc7VkUeb5FwB4kH7XDcP6D1/hUItS17efeQ62UfOE99HJCLC4DU/bgVpzbl00lF447F3kH1Gi4pyWCLgbxqDzikqWXpp5D7QgW1q+AHq/9jC1g1PWbzKAH4J2v8YpsvZ9MWhkOk5o0NQG5zPCYvTFQV7MP6v/YlFEx3j8bg+CSyRoDLLrg==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(7916004)(376002)(396003)(136003)(39860400002)(366004)(346002)(8936002)(66574015)(26005)(6666004)(6486002)(956004)(9686003)(33716001)(66476007)(66556008)(186003)(16526019)(66946007)(85182001)(4326008)(53546011)(316002)(54906003)(1076003)(83380400001)(86362001)(478600001)(2906002)(5660300002)(6496006)(6916009)(8676002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?elhpREVUS1NyMUZEQnJRVGVvT0FBNUZLSlRnd2RNSjV5ZW5GaGVrdWQvWG9t?=
 =?utf-8?B?aGU3WW5OREhUSGh5VVhUL2tSUWhXSzc4TzMyd0EzczdOZ1VoYmNXSVVCNGdG?=
 =?utf-8?B?SjJtNnQ2endKaHc4TExYTmpsU3J4Ri9GOHR2M2phU01EV1JKU3BWODZVVDh5?=
 =?utf-8?B?T1Q4N1l1emo4VG1tckNObEsza0Jwc0ZCL3lDemhpYWxoODNFS2RONW1oM1RE?=
 =?utf-8?B?blJVVEtmVmV0VmZYcE5kcnM2QjBYQ1RnTEJWY0tEdFd1MnBQS0M0UHEzRk1U?=
 =?utf-8?B?QVo0V3MwY20zR2JzeElUOGN2c0lwcjhKQ29NZHlFR09Wckc3QThYbVJ4cWxB?=
 =?utf-8?B?bHRyU25rbTl5QVRRUHluRTJYMkovc0RwVU93V2sxNWRmeVIzUDBVLzFQQ09w?=
 =?utf-8?B?VjYzWEtLRTQxUGdlS0pzdVFHd0hySkVVOExVVzhhMHkrdTIxdXA5alhSdEZR?=
 =?utf-8?B?ODBpVlAybXI1Qm1WMEJIblBnRTBlK0ZDTDVaamNGQWtMMW4wUjVsUnBhTUVr?=
 =?utf-8?B?c0lyZkdXeitOaCs1WUFhcGI2Ukk1ZVhRc2RnQTNWQkR6b1FncG9GSWlBOTls?=
 =?utf-8?B?YjNZUFJWSHZnKzNDMWN6aWR5em9JdktEYjg5SWtJRElXc2txcEJhTTJFV3Fw?=
 =?utf-8?B?UzVzNXVqQmFvMllzUlBkdGpHWEwvL0l5T1B2S01WYVkvS3lLUXZkaWZzNlpM?=
 =?utf-8?B?amRGQXpWZXJVa2pIOUlTZnZUY0txeFRqblUyYi9OK1A3MU1HNXJ5TVNreEJZ?=
 =?utf-8?B?emhCM1A5Wk1abHI3TmlKMVNKMUQ2S2RhUHhzaG9tYy9ZM1N6eTRtMk5XSzZI?=
 =?utf-8?B?TWdTUEFyUG1zaXRKVDR1UTBmUnhDeURHRjIzdnh3VkpPVEUwQVJRZFo5VXIw?=
 =?utf-8?B?QkhBYURZUnFjUUZHOUE1WjFWVlIrdDFvWU0xRU0xdnlFMVRWK29UNmErcSti?=
 =?utf-8?B?YXRIVXdNa0VMQmlpcXNnY0ZmNTVId2QzaTM0WWI0WUNGZHhQaVoxNEFtRTdU?=
 =?utf-8?B?VE1udllEQldxVHJiZk1RSFFCR1BaYXdHMTNScVh3VjVSalpMclh4ZGwvL1B2?=
 =?utf-8?B?ZEhqeGRURVdPTEtjT0V4bk9TUnRMWHE4eTEvUWtrcEZNTWNoV2phRTd3YlA1?=
 =?utf-8?B?aFNlWEE2SVdwVFpLcXQ1ZjVPODNtKzFZdmtPMGhpVkJlSk45SUYwRjF2c2Jm?=
 =?utf-8?B?UDhBSXNNb1g3bmpPNWxzanJyS3ZIZXhrRGlmYmVQVSt2Ky9lSmdUZy9UOW9y?=
 =?utf-8?B?QzQ5TzNqTThYamVRcXVaV2lOSTZGTEdOamR0V2dpTmlpS0cwa1JiSEtpY2lS?=
 =?utf-8?Q?wG2Awy1W0yUG+WIAEgaPdOu40dEpyaFILN?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 0d9fe86e-2153-4dab-5323-08d8bc61f596
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jan 2021 10:06:59.3702
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: f8qqa/7EX7wQyTYcrPspb2by8JpoSuBv6VmbpZLyKsQ8aj/DNjxJ+Ki2szPywdVVfICW1UeCuGX+CkEzyWJx0Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB3481
X-OriginatorOrg: citrix.com

On Tue, Jan 19, 2021 at 08:43:01AM +0100, Jürgen Groß wrote:
> On 18.01.21 16:15, Roger Pau Monne wrote:
> > Don't require the discard-alignment xenstore node to be present in
> > order to correctly setup the feature. This can happen with versions of
> > QEMU that only write the discard-granularity but not the
> > discard-alignment node.
> > 
> > Assume discard-alignment is 0 if not present. While there also fix the
> > logic to not enable the discard feature if discard-granularity is not
> > present.
> > 
> > Reported-by: Arthur Borsboom <arthurborsboom@gmail.com>
> > Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> > ---
> > Cc: Boris Ostrovsky <boris.ostrovsky@oracle.com>
> > Cc: Juergen Gross <jgross@suse.com>
> > Cc: Stefano Stabellini <sstabellini@kernel.org>
> > Cc: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
> > Cc: "Roger Pau Monné" <roger.pau@citrix.com>
> > Cc: Jens Axboe <axboe@kernel.dk>
> > Cc: xen-devel@lists.xenproject.org
> > Cc: linux-block@vger.kernel.org
> > Cc: Arthur Borsboom <arthurborsboom@gmail.com>
> > ---
> >   drivers/block/xen-blkfront.c | 25 +++++++++++++------------
> >   1 file changed, 13 insertions(+), 12 deletions(-)
> > 
> > diff --git a/drivers/block/xen-blkfront.c b/drivers/block/xen-blkfront.c
> > index 5265975b3fba..5a93f7cc2939 100644
> > --- a/drivers/block/xen-blkfront.c
> > +++ b/drivers/block/xen-blkfront.c
> > @@ -2179,22 +2179,23 @@ static void blkfront_closing(struct blkfront_info *info)
> >   static void blkfront_setup_discard(struct blkfront_info *info)
> >   {
> > -	int err;
> > -	unsigned int discard_granularity;
> > -	unsigned int discard_alignment;
> > +	unsigned int discard_granularity = 0;
> > +	unsigned int discard_alignment = 0;
> > +	unsigned int discard_secure = 0;
> > -	info->feature_discard = 1;
> > -	err = xenbus_gather(XBT_NIL, info->xbdev->otherend,
> > +	xenbus_gather(XBT_NIL, info->xbdev->otherend,
> >   		"discard-granularity", "%u", &discard_granularity,
> >   		"discard-alignment", "%u", &discard_alignment,
> > +		"discard-secure", "%u", &discard_secure,
> >   		NULL);
> 
> This would mean that "discard-secure" will be evaluated only if the
> other two items are set in Xenstore. From blkif.h I can't see this is
> required, and your patch is modifying today's behavior in this regard.
> 
> You might want to have three xenbus_read_unsigned() calls instead.

You are right, discard-secure should be fetched regardless of whether
discard-alignment exists.

I can fetch discard-granularity and discard-alignment using
xenbus_gather and keep discard-secure using xenbus_read_unsigned. Let
me send a new version.

Thanks, Roger.

