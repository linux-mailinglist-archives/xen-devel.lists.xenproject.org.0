Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BDB2327ED08
	for <lists+xen-devel@lfdr.de>; Wed, 30 Sep 2020 17:31:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.820.2790 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kNe55-0000hV-QA; Wed, 30 Sep 2020 15:31:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 820.2790; Wed, 30 Sep 2020 15:31:47 +0000
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
	id 1kNe55-0000h9-Mm; Wed, 30 Sep 2020 15:31:47 +0000
Received: by outflank-mailman (input) for mailman id 820;
 Wed, 30 Sep 2020 15:31:45 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=SQnX=DH=gmail.com=wei.liu.xen@srs-us1.protection.inumbo.net>)
 id 1kNe53-0000h2-Pc
 for xen-devel@lists.xenproject.org; Wed, 30 Sep 2020 15:31:45 +0000
Received: from mail-wr1-f65.google.com (unknown [209.85.221.65])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id aa27eb86-9aa2-46dd-b2a2-6cbe8eed8bfe;
 Wed, 30 Sep 2020 15:31:44 +0000 (UTC)
Received: by mail-wr1-f65.google.com with SMTP id w5so2295909wrp.8
 for <xen-devel@lists.xenproject.org>; Wed, 30 Sep 2020 08:31:44 -0700 (PDT)
Received: from liuwe-devbox-debian-v2 ([51.145.34.42])
 by smtp.gmail.com with ESMTPSA id z8sm3531246wrl.11.2020.09.30.08.31.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 30 Sep 2020 08:31:43 -0700 (PDT)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=SQnX=DH=gmail.com=wei.liu.xen@srs-us1.protection.inumbo.net>)
	id 1kNe53-0000h2-Pc
	for xen-devel@lists.xenproject.org; Wed, 30 Sep 2020 15:31:45 +0000
X-Inumbo-ID: aa27eb86-9aa2-46dd-b2a2-6cbe8eed8bfe
Received: from mail-wr1-f65.google.com (unknown [209.85.221.65])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id aa27eb86-9aa2-46dd-b2a2-6cbe8eed8bfe;
	Wed, 30 Sep 2020 15:31:44 +0000 (UTC)
Received: by mail-wr1-f65.google.com with SMTP id w5so2295909wrp.8
        for <xen-devel@lists.xenproject.org>; Wed, 30 Sep 2020 08:31:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=YKnpNa3RywVZcSB4G4FPHeZ5EFBm36qOrvTiCwQiMCE=;
        b=OIG5kgPdUrpX01kkD+QWVjH1sCU0ptq8GwQmcoLeYZ/px1iqmK4FS1Ja9m3nHeLQ5q
         3jKbISx3TbZFLq13XSJR10NhbmKO/+Lu1qcAxjxMDjmn444H2gmb0wDPPAfwi4sY4Exa
         +xuGfUPl8sdeOIp0MDKck1uJti4KyeWhObaWz6DkQz/WLiBgt5ZOsY78G/tdgRCW1w+E
         6LyhZ2DcH6NzAI+8dnGk8TpUilOoaAXc23LHYQDj/DGIyHuFaySajsoH0mpQrZHugano
         SpZ3Jrs8/ObN/hbs8M++xv+GKDNQgGjENzKr05T9MU2fUp1VCIfUcXlJ6nUoxNTo6BKe
         EKlA==
X-Gm-Message-State: AOAM532sKYrEQATnkSE/QUsKnoWAF4qtoa3QhWkLqdplbhXekSRp2fpr
	huJgsgWeD9oCzZBJ8AnuhTM=
X-Google-Smtp-Source: ABdhPJwe03TCttfnSbIrOEDrs2NsGWDMEUb+M+Sx+R6mV/JmstkRx0ceaOeU6EtWuTnNaCBQ85xBbg==
X-Received: by 2002:a5d:50cd:: with SMTP id f13mr3736483wrt.211.1601479903686;
        Wed, 30 Sep 2020 08:31:43 -0700 (PDT)
Received: from liuwe-devbox-debian-v2 ([51.145.34.42])
        by smtp.gmail.com with ESMTPSA id z8sm3531246wrl.11.2020.09.30.08.31.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2020 08:31:43 -0700 (PDT)
Date: Wed, 30 Sep 2020 15:31:41 +0000
From: Wei Liu <wl@xen.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Wei Liu <wl@xen.org>,
	=?utf-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>,
	xen-devel@lists.xenproject.org, Ian Jackson <iwj@xenproject.org>
Subject: Re: [PATCH] tools/xenstore: set maximum number of grants needed
Message-ID: <20200930153141.5syi3vrqan4emtiy@liuwe-devbox-debian-v2>
References: <20200924143648.27861-1-jgross@suse.com>
 <20200930151442.25qnwooqxqu4tm4o@liuwe-devbox-debian-v2>
 <95c9ecc7-046b-b1d8-7778-7ca94a60b1e1@suse.com>
 <20200930152828.bh4q5sn23xvzf3ua@liuwe-devbox-debian-v2>
 <65a3d0ff-2a0b-75ba-27d0-8fa9d6b8f830@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <65a3d0ff-2a0b-75ba-27d0-8fa9d6b8f830@citrix.com>
User-Agent: NeoMutt/20180716

On Wed, Sep 30, 2020 at 04:30:16PM +0100, Andrew Cooper wrote:
> On 30/09/2020 16:28, Wei Liu wrote:
> > On Wed, Sep 30, 2020 at 05:23:58PM +0200, Jürgen Groß wrote:
> >> On 30.09.20 17:14, Wei Liu wrote:
> >>> On Thu, Sep 24, 2020 at 04:36:48PM +0200, Juergen Gross wrote:
> >>>> When running as a stubdom Xenstore should set the maximum number of
> >>>> grants needed via a call of xengnttab_set_max_grants(), as otherwise
> >>>> the number of domains which can be supported will be 128 only (the
> >>>> default number of grants supported by Mini-OS).
> >>>>
> >>>> Signed-off-by: Juergen Gross <jgross@suse.com>
> >>>> ---
> >>>> This is a backport candidate IMO.
> >>>> ---
> >>>>   tools/xenstore/xenstored_domain.c | 2 ++
> >>>>   1 file changed, 2 insertions(+)
> >>>>
> >>>> diff --git a/tools/xenstore/xenstored_domain.c b/tools/xenstore/xenstored_domain.c
> >>>> index 06359503f0..f740aa02f5 100644
> >>>> --- a/tools/xenstore/xenstored_domain.c
> >>>> +++ b/tools/xenstore/xenstored_domain.c
> >>>> @@ -630,6 +630,8 @@ void domain_init(void)
> >>>>   	*xgt_handle = xengnttab_open(NULL, 0);
> >>>>   	if (*xgt_handle == NULL)
> >>>>   		barf_perror("Failed to open connection to gnttab");
> >>>> +	/* Allow max number of domains for mappings. */
> >>>> +	xengnttab_set_max_grants(*xgt_handle, DOMID_FIRST_RESERVED);
> >>> Why DOMID_FIRST_RESERVED as the count argument? Is the expectation here
> >>> xenstored maps one grant per domain?
> >> Yes. This is the theoretical maximum.
> >>
> > In that case:
> >
> > Acked-by: Wei Liu <wl@xen.org>
> >
> > I will also add that information to the commit message.
> 
> And the comment if possible please.  That's where it will be most useful
> to the next person doing a doubletake at this code.  :)

Yes sure.

Wei.

> 
> ~Andrew

