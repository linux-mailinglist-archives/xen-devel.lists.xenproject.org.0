Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9483593F728
	for <lists+xen-devel@lfdr.de>; Mon, 29 Jul 2024 16:01:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.766776.1177293 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sYQvj-0007BB-8s; Mon, 29 Jul 2024 14:00:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 766776.1177293; Mon, 29 Jul 2024 14:00:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sYQvj-00078E-5s; Mon, 29 Jul 2024 14:00:51 +0000
Received: by outflank-mailman (input) for mailman id 766776;
 Mon, 29 Jul 2024 14:00:50 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=7lGn=O5=cloud.com=matthew.barnes@srs-se1.protection.inumbo.net>)
 id 1sYQvh-000788-Vj
 for xen-devel@lists.xenproject.org; Mon, 29 Jul 2024 14:00:50 +0000
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [2a00:1450:4864:20::635])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f5557428-4db2-11ef-bc01-fd08da9f4363;
 Mon, 29 Jul 2024 16:00:48 +0200 (CEST)
Received: by mail-ej1-x635.google.com with SMTP id
 a640c23a62f3a-a7ab76558a9so676638466b.1
 for <xen-devel@lists.xenproject.org>; Mon, 29 Jul 2024 07:00:48 -0700 (PDT)
Received: from EMEAENGAAD91498. ([217.156.233.154])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a7acadb8313sm511972166b.211.2024.07.29.07.00.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 29 Jul 2024 07:00:47 -0700 (PDT)
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
X-Inumbo-ID: f5557428-4db2-11ef-bc01-fd08da9f4363
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1722261648; x=1722866448; darn=lists.xenproject.org;
        h=in-reply-to:content-disposition:mime-version:references:subject:cc
         :to:from:date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=tPWdhGz+1Zr1Fi+/4UAxIQSk+5sixhT902OdGrxe3JQ=;
        b=hwMXkJTz+H+h4VfnG585ogU9y8wNFyeP8CRkBRPMOHdT4NttjOD1ZDpQdI4WDvCJBQ
         fgpi80arwtev2YXfp7pu8S5S+a0zi0xheml9YTbfLXFTH8HzL4bqkZD0geOoRr/M45UN
         zoCxQOf+ckgneeyRZOR5EQW9Ng0nZ23BgvqdU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722261648; x=1722866448;
        h=in-reply-to:content-disposition:mime-version:references:subject:cc
         :to:from:date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tPWdhGz+1Zr1Fi+/4UAxIQSk+5sixhT902OdGrxe3JQ=;
        b=Nv2T5kFkdXUWoBWPlDDcxDTtDh3VIOnuGVkyLMZ9pDVwh4Qmt7hCiTivbJJGnbxYLb
         e6VUyvmKzvZQWfCpema4tZpbeVz45+qruFIP763p8JrRhEDrmTIQ+DzLkP2LTA7PzCaC
         yH3oMtKJW1iux3+X6z0Uv5ZY79v3GWqv5aPm1RuD7x0Oeb6+i1tqF/VKVSR8dngMEpze
         ZMQAhMR7VyRxtoVh7aN95/TQXXnH2+NK13hZryyMUwMsDgps9igi5y8Fr9EQv2Zt9lz9
         oh+1f3jPfz4WkAOJWvvH0fNqO8bD4THyYB5I/fMEEfsOvlu7PsGjTw4tOcEMkeoeskeD
         UgcA==
X-Forwarded-Encrypted: i=1; AJvYcCU/G7azgmIkLr+SdrNnmi5NfwaaTyjT0wlefR+YmzYwPPAYz0XiO8y6jaWsSB6krGKFeUupegL1CErKbe0dmqJ3SHoVQvnlo2t9fl4GR4k=
X-Gm-Message-State: AOJu0YyKWU8AyRHOG+WRl+hD5XK/cQcH6EYLPrgFaFlLFIR7MycJD2xy
	AM41VrzJWRf4Kam4F4RQyD0+NhsRyafSmWPN5sDim5zZg3p4BdtgqUw6Mm7g0T8=
X-Google-Smtp-Source: AGHT+IHjmgjWZ4jn/s31/CsMLtw1MvZbXZBEXWi1v+6ALWREYaWLovE0bF55FCvbIjnkhB5blwYRxQ==
X-Received: by 2002:a17:906:c10d:b0:a77:c7d8:7b4c with SMTP id a640c23a62f3a-a7d3f86fd32mr766962466b.11.1722261647947;
        Mon, 29 Jul 2024 07:00:47 -0700 (PDT)
Message-ID: <66a7a08f.170a0220.ecc03.23f1@mx.google.com>
X-Google-Original-Message-ID: <20240729140042.d6yzd7v67tmnbpx3@EMEAENGAAD91498.>
Date: Mon, 29 Jul 2024 15:00:42 +0100
From: Matthew Barnes <matthew.barnes@cloud.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Anthony PERARD <anthony.perard@vates.tech>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Xen-devel <xen-devel@lists.xenproject.org>
Subject: Re: [XEN PATCH v4] tools/lsevtchn: Use errno macro to handle
 hypercall error cases
References: <cce46da98274f84a3cea16d0e1e34b56d4d09410.1722011581.git.matthew.barnes@cloud.com>
 <1491a5c3-bb30-4804-95d6-31946ee1588d@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1491a5c3-bb30-4804-95d6-31946ee1588d@suse.com>

On Mon, Jul 29, 2024 at 09:58:46AM +0200, Jan Beulich wrote:
> On 26.07.2024 18:40, Matthew Barnes wrote:
> > @@ -24,7 +25,23 @@ int main(int argc, char **argv)
> >          status.port = port;
> >          rc = xc_evtchn_status(xch, &status);
> >          if ( rc < 0 )
> > -            break;
> > +        {
> > +            switch ( errno ) {
> > +                case EACCES: continue; /* Xen-owned evtchn */
> > +                case EINVAL: /* Port enumeration has ended */
> > +                    rc = 0;
> > +                    goto out;
> > +
> > +                case ESRCH:
> > +                    perror("Domain ID does not correspond to valid domain");
> > +                    rc = ESRCH;
> > +                    goto out;
> > +                default:
> > +                    perror(NULL);
> > +                    rc = errno;
> > +                    goto out;
> > +            }
> > +        }
> 
> There are a number of style violations here: Opening figure brace
> placement, indentation of the case labels, placement of the
> "continue", lack of blank lines between non-fall-through case blocks.
> Also why three "goto out" when one would do?

There's no particular reason why three "goto out"s were used.

I will tweak these style decisions in patch v5.

Matt

