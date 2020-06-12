Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C08401F7C52
	for <lists+xen-devel@lfdr.de>; Fri, 12 Jun 2020 19:15:14 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jjnFg-0006Lb-MX; Fri, 12 Jun 2020 17:14:00 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=d5ow=7Z=gmail.com=xadimgnik@srs-us1.protection.inumbo.net>)
 id 1jjnFf-0006LW-P5
 for xen-devel@lists.xenproject.org; Fri, 12 Jun 2020 17:13:59 +0000
X-Inumbo-ID: 1a545758-acd0-11ea-b7bb-bc764e2007e4
Received: from mail-wr1-x443.google.com (unknown [2a00:1450:4864:20::443])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 1a545758-acd0-11ea-b7bb-bc764e2007e4;
 Fri, 12 Jun 2020 17:13:58 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id r7so10510883wro.1
 for <xen-devel@lists.xenproject.org>; Fri, 12 Jun 2020 10:13:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:reply-to:to:cc:references:in-reply-to:subject:date:message-id
 :mime-version:content-transfer-encoding:content-language
 :thread-index; bh=y8Dar2G/LSH5ykpeI+KYX7dYa1DvwTbGtEFoooB9eCU=;
 b=b8AHygjvK8u5WFrWN1NnCF/M2uzPN7kDgiDojV0WFUuLvfxk6Zv7TTTqpGlJDJxHYR
 d/Pom8yVYS0pUemlDrJsS6aEgsjhu25MNqiAxqKX9zgJ/bJWt1cPqyIxY/+hq6/nk+cl
 rzH/tAzBpvlVqKNJjunvHGQCPJor/K2Vhzu8VloG3RXcr8FzwUoNYqePoewQXMGr5bgn
 GqQy8GAoTEGHZIsZ63XfFjO4qcwJQRRKwiNvLq550zHM3iDqPcdiuzYm3HnsXVyn+Dwl
 Li1lq3cIS0LchMZopmqIEnWSS4i7+gF8sfpo1TLaHfB7r2C73kAkja6+P9Fyql+wR2/J
 onfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:reply-to:to:cc:references:in-reply-to
 :subject:date:message-id:mime-version:content-transfer-encoding
 :content-language:thread-index;
 bh=y8Dar2G/LSH5ykpeI+KYX7dYa1DvwTbGtEFoooB9eCU=;
 b=N4W49Sjhh96BB3vH5aVDpZEQzjFiKxkNPNY3jkNWBrVOqBqQ9c19av25lI4QA2Ve/o
 DCwqYKu1fNPLCRf9szHjObyz8m3XpV1cknvvRbllXjx1jgq9d50Ge9AMcyffdXgYeFjz
 eaO2Pa+6krvogbL5/D58I5/06s4QTideNOFSbYfkhtD09kZDDt7uRA7D2dN3XSYsaP/K
 xmkiTybilO5URwAUeAfLYPAWf9WTAt9DSP5okyLeksP9s+mgyoGKSswOiugElg7zwkrF
 MO7xOXFVScJ2sI1K0YHQ2klVI+JlFl5m343oML2F57G2Oqg0+GE9nU+9ZJ7BQpBZATCg
 Cerg==
X-Gm-Message-State: AOAM532gjJRDXu+6UKrDIpx7N1I1FiQnHsWJHRo0TW0qI2/A1wgNXiPL
 4QCMHvem8jJHlH4WdJhVr60=
X-Google-Smtp-Source: ABdhPJzW2VniIlb4uF+Oca6CLspz0t1eiC7rqwDxT16+O3r86gOe6EbQ9EkaARkhdaes3TAx6taRTg==
X-Received: by 2002:adf:a1d3:: with SMTP id v19mr15824086wrv.245.1591982037976; 
 Fri, 12 Jun 2020 10:13:57 -0700 (PDT)
Received: from CBGR90WXYV0 (54-240-197-226.amazon.com. [54.240.197.226])
 by smtp.gmail.com with ESMTPSA id i15sm4071381wre.93.2020.06.12.10.13.56
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 12 Jun 2020 10:13:57 -0700 (PDT)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: "Paul Durrant" <paul@xen.org>
To: "'Ian Jackson'" <ian.jackson@citrix.com>,
 "'Igor Druzhinin'" <igor.druzhinin@citrix.com>
References: <1591980255-18811-1-git-send-email-igor.druzhinin@citrix.com>
 <24291.45845.782250.165305@mariner.uk.xensource.com>
In-Reply-To: <24291.45845.782250.165305@mariner.uk.xensource.com>
Subject: RE: [XEN PATCH for-4.14] tools/xen-ucode: fix error code propagation
 of microcode load operation
Date: Fri, 12 Jun 2020 18:13:56 +0100
Message-ID: <001001d640dc$db8704d0$92950e70$@xen.org>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit
X-Mailer: Microsoft Outlook 16.0
Content-Language: en-gb
Thread-Index: AQH7H4mqvQMhnY7UKzse1ry3GwMkWwKOiXlJqHcE95A=
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
Cc: xen-devel@lists.xenproject.org, 'Paul Durrant' <xadimgnik@gmail.com>,
 wl@xen.org, 'Andrew Cooper' <Andrew.Cooper3@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

> -----Original Message-----
> From: Ian Jackson <ian.jackson@citrix.com>
> Sent: 12 June 2020 17:54
> To: Igor Druzhinin <igor.druzhinin@citrix.com>
> Cc: xen-devel@lists.xenproject.org; Andrew Cooper <Andrew.Cooper3@citrix.com>; wl@xen.org; Paul
> Durrant <xadimgnik@gmail.com>
> Subject: Re: [XEN PATCH for-4.14] tools/xen-ucode: fix error code propagation of microcode load
> operation
> 
> Igor Druzhinin writes ("[PATCH] tools/xen-ucode: fix error code propagation of microcode load
> operation"):
> > Otherwise it's impossible to know the reason for a fault or blob rejection
> > inside the automation.
> ...
> >          fprintf(stderr, "Failed to update microcode. (err: %s)\n",
> >                  strerror(errno));
> 
> This part is fine.
> 
> > +        ret = errno;
> >      xc_interface_close(xch);
> ...
> >      }
> >      close(fd);
> >
> > -    return 0;
> > +    return ret;
> 
> Unfortunately I don't think this is right.  errno might not fit into a
> return value.

I don't understand this part. Why would errno not fit? 

>  Returning nonzero on microcode loading error would
> definitely be right, but ...
> 
> ... oh I have just read the rest of this file.
> 
> I think what is missing here is simply `return errno' (and the braces)
> There is no need to call xc_interface_close, or munmap, if we are
> about to exit.
> 
> I think fixing the lost error return is 4.14 material, so I have
> added that to the subject line.
> 
> Paul, would you Release-ack a patch that replaced every `return errno'
> with (say) exit(12) ?

Why 12?

>  Otherwise, fixing this program not to try to
> fit errno into an exit status is future work.  Also I notice that the
> program exits 0 if invoked wrongly.  Unhelpful!  I would want to fix
> that too.

Agreed that is unhelpful. I'm happy in principle to release-ack something replacing the returns with exits.

  Paul

> 
> Ian.


