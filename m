Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6196C2AD6CF
	for <lists+xen-devel@lfdr.de>; Tue, 10 Nov 2020 13:49:32 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.23345.50020 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kcT5E-0007CW-Me; Tue, 10 Nov 2020 12:49:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 23345.50020; Tue, 10 Nov 2020 12:49:12 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kcT5E-0007CA-JS; Tue, 10 Nov 2020 12:49:12 +0000
Received: by outflank-mailman (input) for mailman id 23345;
 Tue, 10 Nov 2020 12:49:11 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hJ2u=EQ=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1kcT5C-0007C5-MS
 for xen-devel@lists.xenproject.org; Tue, 10 Nov 2020 12:49:10 +0000
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id e6b0d1ac-4652-4e48-accb-bcab033c7f66;
 Tue, 10 Nov 2020 12:49:09 +0000 (UTC)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=hJ2u=EQ=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
	id 1kcT5C-0007C5-MS
	for xen-devel@lists.xenproject.org; Tue, 10 Nov 2020 12:49:10 +0000
X-Inumbo-ID: e6b0d1ac-4652-4e48-accb-bcab033c7f66
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id e6b0d1ac-4652-4e48-accb-bcab033c7f66;
	Tue, 10 Nov 2020 12:49:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1605012549;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=kGOAcPyvw+4dMkrB/343daA5zT95B08sLkeXyo9XKVQ=;
  b=bd9u02HjDWCBT2GqZxi2/xWY01Y1XDuM5BSNAAOa329NUMwH25H5JsPa
   F2yzId+A1ThbO0o5oSOKf9NhrOMWOgA3ao1XFEn+vq96xL8kcgaeUvxrn
   NdEru934QG40457Q8vjy6sprua1Pxm02FNCGkj+s7/JEmKQ0zz8DHGWfv
   o=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: SIu95eLLXhVgsoRszmQdX7MT47r5+U5X9aQO1+sOVkGDgw905QyQCpCjtusg0CL8i77Lf75twL
 8De/Y6rK4fg3OMOhbWhq8pZ3zL+8JPEXtucOcJw3+PWI9a2OijBw/hyuzCPs8LCzA/GvFAj7BV
 /9SNxP/cFzqM/Jww1DbhDyGz7dkyJxruZnsAtpZoD15qIx/aYSi9Rk/4Jphz8/BKSDeimgF/DY
 k4BkObu1L/1T5Wc415GUTAJEiIVhBnnK27E+Hs8Vt5vFEckiP3jrCWXl30hWQiOQytyERfxJXF
 Q44=
X-SBRS: None
X-MesageID: 31955429
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.77,466,1596513600"; 
   d="scan'208";a="31955429"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=O9PsT0qrAliX4oNyvxLOIAvYYqlcYse8YzvnYOANOkXe4qmYvQxArVdxINXx0NcMuHY1yAVO3BgJNnmDDJcpXaNYfDo0w8fIsCe8T9W2W1X44G4VGLFabkz8hF/t0SEdn35wqveSXnWKMmPgtbBqr4AE3KCTtttgbcnWWGpOBbYDKPqfw8hTVnlkMsOTYKISDRTHbSQ1cwzWgGTiumNqJ9MEhoERn7z5LfnCWM01FXuTCDcmUSUMXmKGgTqs7XL6zbbEmeb0/7NH+9hynlrdO/dKlSVrkn9Pf05UajUU8UvGAMZN+6ZVELm5kRzJl3vz7mbNpBpHLGM8rDXVtWe/FA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PJW52Z4umjhNmHjsR3iz/CLYwuqpkZqVSsMAAX9G8sg=;
 b=k4gAVCrln5TMyoQa9H0P9npKDbShjAEVU0XuLNNCCleV+ciqNwmgVv09mQTMJyQbh6FJM/1wwrj6XALfkB8TTuugv0fzCStbZL+lEpICXhDz910n4UeOg6XGq33sbaZRoxejd0TR5HWsnzmu5/AlFA3Q4t7ddgS2S1AHh+q8tTSwbXw10yIWOJLGZeDFM5xT9kxeUio803xSxAkmlmF/L7So4MPWD94aFRFM7yxOHBTk2JKoCiDVCq7BMZ/mo8Cp2lDqQHWwRd7AHGU5Wr9wXcCQL8l1EmyBGQKlw9GL5GK+1Av6xjgDcZnJhbHufxNtCaKOdXIrD6JG4vLbg67uWw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PJW52Z4umjhNmHjsR3iz/CLYwuqpkZqVSsMAAX9G8sg=;
 b=qM/ybuf/Rk4nIjPuaqqmSKa56TPyOcMg7yplonNgC//Irccpzh1H4W4PmkVgpTXdj5rf1NbVNUIhimmQBw9GWg+U9UQPtHasjXPGqONASFEwvfNX2Yow5dUaUC0Di9ROfQqBCQOqUimigR86U51rnRiL7q1rIUMHvmWiPcivYRE=
Date: Tue, 10 Nov 2020 13:49:00 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: =?utf-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
CC: <xen-devel@lists.xenproject.org>, Andrew Cooper
	<andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, "Ian
 Jackson" <iwj@xenproject.org>, Jan Beulich <jbeulich@suse.com>, Julien Grall
	<julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu
	<wl@xen.org>
Subject: Re: [PATCH] docs: fix documentation to notice credit2 is the default
Message-ID: <20201110124900.2hjgn45i7ynf33p3@Air-de-Roger>
References: <20201110112118.99960-1-roger.pau@citrix.com>
 <b9ca219d-b6d7-9f59-3ede-9b4c9225e01b@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <b9ca219d-b6d7-9f59-3ede-9b4c9225e01b@suse.com>
X-ClientProxiedBy: LO2P265CA0338.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:d::14) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 26e02c4d-19e9-4d83-4d3a-08d8857701fc
X-MS-TrafficTypeDiagnostic: DM6PR03MB3481:
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM6PR03MB34812AB491B7A9AF4164C32B8FE90@DM6PR03MB3481.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: pV8/UV5mXZlpkTYbmTcsCv7cuwjYa5xIQojUIg49D3qAfPcVGEJLS+8g1etBIxNS1ELVidlaz9xMS7IQmpb55RqAzjhfLRU8sVPYl/fbJrofznk1ofccF1tiDE7VHDt5tZQqYx8rxpZwe7vza9+w0GlxirvvU2/89gvoVug6Cl7kwGVf55CbfSUDCCcrzW+HQNJPSBHxZEUquCscgXA9AtMQ1VnlQFBpgRCA22bmnKqKBPHfIhbr8/PN/gHRIA1pc+Oy9go06ayRy5DJB0l42ryprvgbrdFrQfDO2LcLW3Brzd0NaE8wmUl9aupdrdeG6qULz6LqOxQTEvL26+cCoBAIVSCMm4/Z3LoxF8IsrDYLENXM+jfy2iYQmhsh0xFS29UDrK4bZct2RBLbn86w9g==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(7916004)(4636009)(136003)(376002)(346002)(396003)(366004)(39860400002)(186003)(16526019)(26005)(66476007)(33716001)(6486002)(66556008)(6916009)(86362001)(66946007)(6496006)(5660300002)(53546011)(66574015)(316002)(966005)(478600001)(83380400001)(85182001)(8936002)(1076003)(2906002)(54906003)(8676002)(6666004)(4326008)(9686003)(15650500001)(956004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: ciy0zDrI3FofNreUEbyfb6XDfqg/SGQ6WaD/jn9Zvvc257Bu25j0MhsUKVN3xXq+7tV/xW3bDSaW6PPEMykUtzcbzm4DpVgkvVTcNbgo0Xdh/Ck+wlZf+cVBMwdrEPWyYGfGhe3APWwIa/PT+EeALKO1vzpO+r6GO9Irtj4dC06/LSgV+po/xY9L7kcvRTxMkNWBlNdBad+GGE9gsHHnH8kgCmddgH+/6HcnVDQod8s/apzBmKOnyw609KOeQ0SrYi7SLIXv9CmiAbXFcK3J9FpDkqQAyzzDbf9Mt+pxvMhjn4krvXaeZspnWl/l26jjZSaFkoJIHfRxSGSWMc/X4E99nwtaVjHE7t2M7EV6jqM1rYASnX94kJJsg4/nahoWkbcZcIDJPpZ3pvArN794hfYD+nOAJZ1MSvX0VzjhziZKlQGveIMmIzuK2v1rbX5cn6MkGK4FomrBmUGhCeLGap8u7UTLD3DzVC0z2u02MM/cWUWlvWlR80aKXL8/e2n0WLgSVjjPLsCkUarbraDouFFYl7w0lgfuxtakT4U6j/kVdNlUwJZwdxH9Ti4WIsx43lzRGf7dQ34VNwxAEyd3Lzq7RK+qIkRq+mLNCUfGtfiFKg2gEwQpJ1h5uRb3BpUs8QKPqQaQLNQepHmxHijE/DW8oi4UBvJSUjy4Y1o1hRSWIbHbjoZkWezWhy4hkUo5OiMfF7HmcSPWSqYSxq1q+zaEzqXF29kVZk6kCoXfpKIswvhsxndhXdXRr4XdaVUtiapCd7HF8pa9YeLUOg+4Wfbpei3qK4j6wvWdEZQEgbUCo6RoLCOTW4afgA426kjydkCuuvrJ+niBCo59B7b4wxgRHRZWPVlHUGcECgQwXrA6YdqPLOPseQAhzgYpAihNZgeK01jrjNQ7gmJI1GdEQA==
X-MS-Exchange-CrossTenant-Network-Message-Id: 26e02c4d-19e9-4d83-4d3a-08d8857701fc
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Nov 2020 12:49:05.7005
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yKlz8+4NW+3tp8Y3JRTlZv8PFB2Mo6fbfzixmfqhPL9Lthu34Qzk6tuEOmoh8PAW+uOaHrGV2KCg0jBOFddEuA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB3481
X-OriginatorOrg: citrix.com

On Tue, Nov 10, 2020 at 12:31:14PM +0100, Jürgen Groß wrote:
> On 10.11.20 12:21, Roger Pau Monne wrote:
> > Fix the command line document to account for credit2 now being the
> > default scheduler.
> > 
> > Fixes: dafd936dddbd ('Make credit2 the default scheduler')
> > Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> > ---
> >   docs/misc/xen-command-line.pandoc | 2 +-
> >   1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/docs/misc/xen-command-line.pandoc b/docs/misc/xen-command-line.pandoc
> > index 4ae9391fcd..789aead148 100644
> > --- a/docs/misc/xen-command-line.pandoc
> > +++ b/docs/misc/xen-command-line.pandoc
> > @@ -1876,7 +1876,7 @@ with read and write permissions.
> >   ### sched
> >   > `= credit | credit2 | arinc653 | rtds | null`
> > -> Default: `sched=credit`
> > +> Default: `sched=credit2`
> >   Choose the default scheduler.
> > 
> 
> Tried that before:
> 
> https://lists.xen.org/archives/html/xen-devel/2019-01/msg01097.html
> 
> And Andrew didn't like it...

One way or another we need to get this fixed in the document. Listing
credit as the still the default is wrong.

I think there are several places in xen-command-line.pandoc that just
contain the default values set in Kconfig, so IMO if we want to
change this it should be done wholesale rather than picking on every
default value change. Opinions?

Thanks, Roger.

