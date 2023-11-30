Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B63637FEE0F
	for <lists+xen-devel@lfdr.de>; Thu, 30 Nov 2023 12:38:55 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.644566.1005730 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r8fNT-0001sd-V6; Thu, 30 Nov 2023 11:38:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 644566.1005730; Thu, 30 Nov 2023 11:38:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r8fNT-0001q0-SH; Thu, 30 Nov 2023 11:38:43 +0000
Received: by outflank-mailman (input) for mailman id 644566;
 Thu, 30 Nov 2023 11:38:42 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=EhhW=HL=cloud.com=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1r8fNS-0001pu-7S
 for xen-devel@lists.xenproject.org; Thu, 30 Nov 2023 11:38:42 +0000
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [2a00:1450:4864:20::434])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 02671f06-8f75-11ee-98e4-6d05b1d4d9a1;
 Thu, 30 Nov 2023 12:38:41 +0100 (CET)
Received: by mail-wr1-x434.google.com with SMTP id
 ffacd0b85a97d-3316a4bc37dso692733f8f.2
 for <xen-devel@lists.xenproject.org>; Thu, 30 Nov 2023 03:38:41 -0800 (PST)
Received: from perard.uk.xensource.com (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 f9-20020a056000036900b00332e073f12bsm1297737wrf.19.2023.11.30.03.38.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 Nov 2023 03:38:40 -0800 (PST)
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
X-Inumbo-ID: 02671f06-8f75-11ee-98e4-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1701344320; x=1701949120; darn=lists.xenproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=GjTW6WtUqalAGV5ZSLXYYpCDyjSBF9HGbitOatrJhxg=;
        b=BfQDo38ubjdSMl6mH1dla0urJNSojcnNrOZfmXInjIVRm95iqhTpkNuspAQVf73guS
         Ia6ABOICIqDQvVnL6L61xmnc8oq+s6x9vowIwYLsmA8WYL6kAmAjTRv0gh3zxbjGZKOd
         R3zbJnSbMFrXpaJWSk6YD1NQ8EldniJvnHZnk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701344320; x=1701949120;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GjTW6WtUqalAGV5ZSLXYYpCDyjSBF9HGbitOatrJhxg=;
        b=mikDaAaQOvYR0tdleFpIojYJqvZZqfc2QO9BUrqc3YZfzd2pgV6+g+UbiBcwOoQSFT
         LTCxIhpXkMRU1KdEc5HeMDRZDGZWoCMqcqC/TLcnbIKQBUIBms2B4bizTbCqW3Evxi77
         sU8f+uB1iQI/OJQntsfdvJpcf3xUYr0Aw1z97XXJjoqTA+xuFs8bNNwPnpAwRl2sgGP/
         vwClV55ApjR7h7u8rTdV5hgJ+ugLD0HrJaV5XJUanUIuly2O2EbcUe3KmNfnQSO6OQX5
         7hWlkxSHgx9SuxKWaToo07Q2eFKLIOof6kZUtIp+0qxGSTRkhr4hY6N2R+S0q6wyM0bN
         sWGw==
X-Gm-Message-State: AOJu0Yw7zOzGMZhUXtyw7tx4qAE3xLYK8LL64xbu0bE+Jq9wZsoCx4mZ
	M1DaBE8pFYt/V3HM87tA71fO15zPamlqL9mC+Q4=
X-Google-Smtp-Source: AGHT+IGaOTqRHDYQtr/WpUs7LSLeQF3ccjoBGWyUTPJJXIBkz1xassDPLS5S/1Z7uRQ6euosmHqDww==
X-Received: by 2002:adf:f945:0:b0:333:17d2:454a with SMTP id q5-20020adff945000000b0033317d2454amr3372403wrr.4.1701344320510;
        Thu, 30 Nov 2023 03:38:40 -0800 (PST)
Date: Thu, 30 Nov 2023 11:38:39 +0000
From: Anthony PERARD <anthony.perard@citrix.com>
To: Alejandro Vallejo <alejandro.vallejo@cloud.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wl@xen.org>,
	Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH] tools/xg: Fix potential memory leak in cpu policy
 getters/setters
Message-ID: <a365578b-de7b-4eff-8ec1-f2847d791aa4@perard>
References: <20231129160028.67226-1-alejandro.vallejo@cloud.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231129160028.67226-1-alejandro.vallejo@cloud.com>

On Wed, Nov 29, 2023 at 04:00:28PM +0000, Alejandro Vallejo wrote:
> They allocate two different hypercall buffers, but leak the first
> allocation if the second one failed due to an early return that bypasses
> cleanup.
> 
> Remove the early exit and go through _post() instead. Invoking _post() is
> benign even if _pre() failed.
> 
> Fixes: 6b85e427098c ('x86/sysctl: Implement XEN_SYSCTL_get_cpu_policy')
> Fixes: 60529dfeca14 ('x86/domctl: Implement XEN_DOMCTL_get_cpu_policy')
> Fixes: 14ba07e6f816 ('x86/domctl: Implement XEN_DOMCTL_set_cpumsr_policy')
> Signed-off-by: Alejandro Vallejo <alejandro.vallejo@cloud.com>

Reviewed-by: Anthony PERARD <anthony.perard@citrix.com>

Thanks,

-- 
Anthony PERARD

