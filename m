Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BA8BB3B8CC
	for <lists+xen-devel@lfdr.de>; Fri, 29 Aug 2025 12:31:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1101119.1454312 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1urwOW-0007Mh-AH; Fri, 29 Aug 2025 10:31:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1101119.1454312; Fri, 29 Aug 2025 10:31:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1urwOW-0007KU-7R; Fri, 29 Aug 2025 10:31:44 +0000
Received: by outflank-mailman (input) for mailman id 1101119;
 Fri, 29 Aug 2025 10:31:42 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=oFyT=3J=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1urwOU-00075X-TX
 for xen-devel@lists.xenproject.org; Fri, 29 Aug 2025 10:31:42 +0000
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [2a00:1450:4864:20::434])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5ac7d798-84c3-11f0-8adc-4578a1afcccb;
 Fri, 29 Aug 2025 12:31:42 +0200 (CEST)
Received: by mail-wr1-x434.google.com with SMTP id
 ffacd0b85a97d-3ceb9c3d98cso670983f8f.0
 for <xen-devel@lists.xenproject.org>; Fri, 29 Aug 2025 03:31:42 -0700 (PDT)
Received: from localhost (112.pool92-178-7.dynamic.orange.es. [92.178.7.112])
 by smtp.gmail.com with UTF8SMTPSA id
 5b1f17b1804b1-45b72c55c1bsm111559315e9.10.2025.08.29.03.31.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 Aug 2025 03:31:41 -0700 (PDT)
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
X-Inumbo-ID: 5ac7d798-84c3-11f0-8adc-4578a1afcccb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1756463502; x=1757068302; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=u3Wb6xFED7ceBBSRRCmhfub6Z8cAaaYt5mk/x6fGVQ4=;
        b=rr2QlFUngdpBJR8GORFY+5HEvBfK8l8HbEJR8hiHFAPNW6lxUju9YT1pIyYrFxYoK1
         ZyEgK2V5q61t2GKb46STy8HC7kNB03wM3SQnkCJyloMXdXYM/QK95IdjNf2m4ZZ1TCuv
         DcpqHBiaSgtpiMU/HFnJt/8WvcmNbYF6aWM4w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756463502; x=1757068302;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=u3Wb6xFED7ceBBSRRCmhfub6Z8cAaaYt5mk/x6fGVQ4=;
        b=V/KJOieyMrx462ROAsD7QcTHoUnXUII+YIKQMvmGipdd02teNnBOMHA3Re/h0BpSZ9
         /WFMKJTQdIJnx0m99HQsA2MPZostvi9+lRtCMkOo84Jt1iOiju4qxLxMB/doZZPub+6t
         UVAc4vhO5ZpCJIGwtxSc/OXya/VPb9tP2Xcw0Vwmpx+PWjk0CRWTVew8VEu64bvuVxKF
         ohgM+6683KgWCZ/byQYgnW7zuXym+kS+HIfbbKQADpOT+OuiN1YyerX7L43opfGRZ8XJ
         UwlWZt3byCsBsI34JWE4JXKd9V9i0daJjWlp0VJfHoASd+EBl6MT1eXD++MXjTd/fvk4
         VTYg==
X-Forwarded-Encrypted: i=1; AJvYcCXxJFEUGTyv2g2Lpg6CiI2fCZg2g0LRufpVmNfF/gvKLheP17vAVIE5H5+Rx77LDRjNp1xQvBuvOZI=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyW4uEmP6AF9pLov9x1n/gy84RrjvEZwquiapghr5g9KSvHLhog
	0nAxrWN6/3kqc9fJMuplZKih0ClgFe3Tsh9MrYNtQARu6GHAqXTFRcwJOKfI7In2Xj8=
X-Gm-Gg: ASbGncsPABzHIMJz++0JVRnjxQLttHtVzz4tezkhR5vF3nRvpqW3FQzgcssPvseU0te
	7qqdG8FN+XVPi7SJTXBc47ZESPsPAS5XoyDWsxkqsh/Jzv1VExl51xiU9jYOSnisFpVRjujOzFe
	/A8O29RF5MJGXre/me5VSqMcugdyFhum/1Xqi+lGTVZdYlnPBqfvJeT2VHCPFaQX95uUPFTUvmb
	QMaKQAaJ0Z8g9zJJ7Np0DsQcT+sFXxlKUR4RQvH1VacSbZPDI3bmOr/OzeKMlBS+jNKPR0y91Dl
	igp5RjgXOCMYkb2hPtU6Lobb0GiMqxXo/RTC551q9m+o6jdGvkAWNQcja2SYByHkBRjTS2kUYTU
	pu0I5FQguFVleZUtqlYGam9fgVvzYDRRt3Y9A27WL3DL+239xl6OFXkd+b7Cgt24y9A==
X-Google-Smtp-Source: AGHT+IHN4RBZoxwBzdiR2o2nL8kZ4jhdtdsMwKZvl8kkVmdXx7Wn+lUadlT70RUdz5xS4Fwp6Y0qQg==
X-Received: by 2002:a05:6000:178b:b0:3c8:e9d3:c38a with SMTP id ffacd0b85a97d-3c8e9d3d0bemr16560484f8f.5.1756463501833;
        Fri, 29 Aug 2025 03:31:41 -0700 (PDT)
Date: Fri, 29 Aug 2025 12:31:40 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH] x86/pvshim: disable PDX compression in PV shim defconfig
Message-ID: <aLGBjKcXi_uwifBk@Mac.lan>
References: <20250829075154.48787-1-roger.pau@citrix.com>
 <e11d81c9-cb3b-4838-b25d-50545deba64b@suse.com>
 <aLFrLxdcb2nIkim6@Mac.lan>
 <77299b94-43cd-4d55-891a-8e1209b4b669@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <77299b94-43cd-4d55-891a-8e1209b4b669@suse.com>

On Fri, Aug 29, 2025 at 12:21:26PM +0200, Jan Beulich wrote:
> On 29.08.2025 10:56, Roger Pau Monné wrote:
> > On Fri, Aug 29, 2025 at 10:10:59AM +0200, Jan Beulich wrote:
> >> On 29.08.2025 09:51, Roger Pau Monne wrote:
> >>> There's no need for PDX compression given the memory map provided by Xen
> >>> to guests is contiguous, turn off the feature by default in the PV shim
> >>> defconfig.
> >>>
> >>> Reported-by: Jan Beulich <jbeulich@suse.com>
> >>> Fixes: c5c45bcbd6a1 ('pdx: introduce a new compression algorithm based on region offsets')
> >>> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> >>
> >> Acked-by: Jan Beulich <jbeulich@suse.com>
> >>
> >> Not sure if a Fixes: tag is really appropriate here. The shim is working as
> >> is, just carrying code which won't ever be used.
> > 
> > I was borderline also, but I felt it was important to notice that the
> > change here should ideally had been part of that commit.  Do you have
> > a recommendation of any other tag I could use for that purpose?
> 
> In rare cases I think I've used Amends: (not formally mentioned anywhere,
> of course).

Oh, how would you feel about adding it formally to
sending-patches.pandoc?

It's a rare tag, but I would find it useful in contexts like the
above.

Thanks, Roger.

