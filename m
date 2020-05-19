Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 905081D9ADD
	for <lists+xen-devel@lfdr.de>; Tue, 19 May 2020 17:12:21 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jb3ud-0007XC-KM; Tue, 19 May 2020 15:12:11 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=FgAx=7B=gmail.com=xadimgnik@srs-us1.protection.inumbo.net>)
 id 1jb3uc-0007X4-33
 for xen-devel@lists.xenproject.org; Tue, 19 May 2020 15:12:10 +0000
X-Inumbo-ID: 1bc5493a-99e3-11ea-b07b-bc764e2007e4
Received: from mail-wr1-x443.google.com (unknown [2a00:1450:4864:20::443])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 1bc5493a-99e3-11ea-b07b-bc764e2007e4;
 Tue, 19 May 2020 15:12:09 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id l11so16402461wru.0
 for <xen-devel@lists.xenproject.org>; Tue, 19 May 2020 08:12:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:reply-to:to:cc:references:in-reply-to:subject:date:message-id
 :mime-version:content-transfer-encoding:content-language
 :thread-index; bh=BQQ4RGfaBDiChHD4UyQzlyaQqcVc9ngnZqQ32zLBwh8=;
 b=VnZizwWZHqLTaTFOjr9rzEY/JRZX473RjNO0owwTz3GPO77MZPWYvVjNaPoXgQ4eZG
 ffXnTx7gZ0RQQt4CzmjNVs5nTDsfWhoIK5iKAviCQ57dzURYw8rQ/SwgNJRvDokxKUD3
 xQgW0qMBU8q4dFn+D/rOQC3TYW6uw0j5HQ6l7yL62xJw4s/3p4MXH2am1I0SmWTR5790
 GtybqJmrxHXxui3G1gKrbJDmZWC6VMiLioevNDxuOHJ5W5BDaAWXuw3YGaJ+N7g4nuVh
 3QyUZG39wwUz9uvKr+dMjdU+0H5KNa/uc0vGIX4ThGKgxcuIjLO+hZmbVQR9lWzprRJ8
 +j9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:reply-to:to:cc:references:in-reply-to
 :subject:date:message-id:mime-version:content-transfer-encoding
 :content-language:thread-index;
 bh=BQQ4RGfaBDiChHD4UyQzlyaQqcVc9ngnZqQ32zLBwh8=;
 b=JZ8hRvK65TM34kJFYkQbAJceU0sXlYtdRT36w+pLHu0N+2KcYguTfuWYt1erMwZf3N
 fc5ctUmolZ0kgy21cyJkK/PiLi+y53EEMpVHo9+LT/x5Sk7bp+cth6BNdZniiKE6t+fk
 m2GvVxNZpEDmHd11K0bZ4fB+K4+F98MfC2cKQfwrhNCKx9Xbv1XV/9qVhcCtw2jrR4SD
 GJgiNabo5SH/orV6rdpS4O5d5xjCpKNfQowgdOFSWZIeoZNb5MEk3Ax46jKaU+p0SEiS
 Uvl5BP3o5GnVZDHaMrNIiPMT9MlDBePIeaGdWsDKqoxGXVVKmKi1KL8FKj+ZaOSlINr5
 Vb7w==
X-Gm-Message-State: AOAM530IthkTQ0iQMtyx605xahRNrruvgtehhcOM2aHypjUzxTUUUAI5
 FFTdVf67jk/TaPxW1Wsn3+0=
X-Google-Smtp-Source: ABdhPJzKC5wCniCoTCE5LpNwDSVOTZYCzIuaLFHGJL1mzBy1svCtORPhKxuWICOo6Qd61vDrSjO3Ag==
X-Received: by 2002:adf:ef01:: with SMTP id e1mr25169611wro.28.1589901128674; 
 Tue, 19 May 2020 08:12:08 -0700 (PDT)
Received: from CBGR90WXYV0 ([54.239.6.187])
 by smtp.gmail.com with ESMTPSA id z11sm21260621wro.48.2020.05.19.08.12.07
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 19 May 2020 08:12:08 -0700 (PDT)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: "Paul Durrant" <paul@xen.org>
To: "'Jan Beulich'" <jbeulich@suse.com>
References: <20200514104416.16657-1-paul@xen.org>
 <20200514104416.16657-3-paul@xen.org>
 <7455ebb7-89c8-75f0-5904-aec344c8b85f@suse.com>
In-Reply-To: <7455ebb7-89c8-75f0-5904-aec344c8b85f@suse.com>
Subject: RE: [PATCH v3 2/5] xen/common/domctl: introduce
 XEN_DOMCTL_get/setdomaincontext
Date: Tue, 19 May 2020 16:12:06 +0100
Message-ID: <000701d62def$dce3f950$96abebf0$@xen.org>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: Microsoft Outlook 16.0
Content-Language: en-gb
Thread-Index: AQH3ss8UVmWNzdPcdrMljFFlRuFHxQK96sr+AURHycuoTGhNIA==
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Reply-To: paul@xen.org
Cc: 'Stefano Stabellini' <sstabellini@kernel.org>,
 'Julien Grall' <julien@xen.org>, 'Wei Liu' <wl@xen.org>,
 'Andrew Cooper' <andrew.cooper3@citrix.com>,
 'Paul Durrant' <pdurrant@amazon.com>,
 'Ian Jackson' <ian.jackson@eu.citrix.com>,
 'George Dunlap' <george.dunlap@citrix.com>, xen-devel@lists.xenproject.org,
 'Daniel De Graaf' <dgdegra@tycho.nsa.gov>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

> -----Original Message-----
> From: Jan Beulich <jbeulich@suse.com>
> Sent: 19 May 2020 14:49
> To: Paul Durrant <paul@xen.org>
> Cc: xen-devel@lists.xenproject.org; Paul Durrant <pdurrant@amazon.com>; Daniel De Graaf
> <dgdegra@tycho.nsa.gov>; Ian Jackson <ian.jackson@eu.citrix.com>; Wei Liu <wl@xen.org>; Andrew Cooper
> <andrew.cooper3@citrix.com>; George Dunlap <george.dunlap@citrix.com>; Julien Grall <julien@xen.org>;
> Stefano Stabellini <sstabellini@kernel.org>
> Subject: Re: [PATCH v3 2/5] xen/common/domctl: introduce XEN_DOMCTL_get/setdomaincontext
> 
> On 14.05.2020 12:44, Paul Durrant wrote:
> > --- a/xen/include/public/domctl.h
> > +++ b/xen/include/public/domctl.h
> > @@ -1129,6 +1129,43 @@ struct xen_domctl_vuart_op {
> >                                   */
> >  };
> >
> > +/*
> > + * XEN_DOMCTL_getdomaincontext
> > + * ---------------------------
> > + *
> > + * buffer (IN):   The buffer into which the context data should be
> > + *                copied, or NULL to query the buffer size that should
> > + *                be allocated.
> > + * size (IN/OUT): If 'buffer' is NULL then the value passed in must be
> > + *                zero, and the value passed out will be the size of the
> > + *                buffer to allocate.
> > + *                If 'buffer' is non-NULL then the value passed in must
> > + *                be the size of the buffer into which data may be copied.
> > + *                The value passed out will be the size of data written.
> > + */
> > +struct xen_domctl_getdomaincontext {
> > +    uint32_t size;
> > +    uint32_t pad;
> 
> This and its counterpart don't seem to get checked to be zero.
> While an option for a domctl, any desire to use the field in
> the future would then require an interface version bump.
> 

Indeed. It does need to be zero checked.

  Paul

> Jan


