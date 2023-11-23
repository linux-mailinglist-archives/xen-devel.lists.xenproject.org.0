Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 26FD07F5CD0
	for <lists+xen-devel@lfdr.de>; Thu, 23 Nov 2023 11:47:36 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.639541.997062 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r67F0-00011g-Kz; Thu, 23 Nov 2023 10:47:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 639541.997062; Thu, 23 Nov 2023 10:47:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r67F0-0000yq-I3; Thu, 23 Nov 2023 10:47:26 +0000
Received: by outflank-mailman (input) for mailman id 639541;
 Thu, 23 Nov 2023 10:47:25 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=RRmN=HE=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1r67Ez-0000yi-Co
 for xen-devel@lists.xenproject.org; Thu, 23 Nov 2023 10:47:25 +0000
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [2a00:1450:4864:20::429])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id af2beb35-89ed-11ee-9b0e-b553b5be7939;
 Thu, 23 Nov 2023 11:47:23 +0100 (CET)
Received: by mail-wr1-x429.google.com with SMTP id
 ffacd0b85a97d-332ddd8e0bdso278991f8f.0
 for <xen-devel@lists.xenproject.org>; Thu, 23 Nov 2023 02:47:23 -0800 (PST)
Received: from localhost ([213.195.113.99]) by smtp.gmail.com with ESMTPSA id
 t15-20020a5d6a4f000000b0033169676e83sm1296712wrw.13.2023.11.23.02.47.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 Nov 2023 02:47:22 -0800 (PST)
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
X-Inumbo-ID: af2beb35-89ed-11ee-9b0e-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1700736443; x=1701341243; darn=lists.xenproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=OLzMxB3RRuLaZNQDLruop9mFWfM1jlnEeFZemnewlgI=;
        b=oG3iisJZ2n7BImIkHgGJ9MDnMKhB+xfR0oj3lHeLf2O0KzxDQB0hO0qjglbz9bCfD/
         NJTjkkZBPNhQFmQYfERBfLTRCkB7MHIEwqBXRSmXBPEb9KQ/uLXK2jnOeRl24cv2pqWh
         fBxaJLUN+w7ZaEOhxRCi2VidI75ck/glgPJ9A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700736443; x=1701341243;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OLzMxB3RRuLaZNQDLruop9mFWfM1jlnEeFZemnewlgI=;
        b=ip7MueSmEJVXGCMuzxM1d9vgWigkbHMRb62HaS0/uKh7n9v+umQSZQ8xMjQ3RGuRWS
         +55igx9TwafgL/+HuD2p2TEd1laMyudAdLcZRxCewQMWYOrz+KbF0pQ3yqC0MUjAmrx3
         QdXhAmmDYVHez2XWPySVbhVMSd7OFcaVwA8D9SnA1BuyQ1wfNshWOpPdkGYLsTqvZxKE
         MVepa7jR14rdtv5uMtEOhEsSkh7W3ZmfEJkxld6SbAGpm3mfE1Krseo186yCyGMm9+SM
         oHVoQCfPa9mAtPQFwcKs3agi08f+xzPNc1tPjsLZAZlH2FUtEWrBwA3hgwWMi7Z+GxJe
         /VRg==
X-Gm-Message-State: AOJu0Yx/F1J3trgeVJjm6FwA5R/cCfxcu/JkIxolPK1rZ4WJB0yuRNNk
	/PYtEVGYyicWKYs0BJRiTTP/Hw==
X-Google-Smtp-Source: AGHT+IHXy3gUNCKkVWGTOzVDfXRKKrK7ivDIK2b83umr0xzUDGpHrR7awK1I74juwiuhrmgFahimIA==
X-Received: by 2002:a5d:54c1:0:b0:332:cae1:dd5 with SMTP id x1-20020a5d54c1000000b00332cae10dd5mr1823579wrv.34.1700736443027;
        Thu, 23 Nov 2023 02:47:23 -0800 (PST)
Date: Thu, 23 Nov 2023 11:47:21 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH] x86/HVM: limit upcall vector related verbosity
Message-ID: <ZV8tueH53FROk86e@macbook>
References: <8efe0fed-8533-474c-9893-e6fcb38b93ca@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <8efe0fed-8533-474c-9893-e6fcb38b93ca@suse.com>

On Thu, Nov 23, 2023 at 11:25:34AM +0100, Jan Beulich wrote:
> Avoid logging all-identical messages for every vCPU, but make sure to
> log unusual events like the vector differing from vCPU 0's (note that
> the respective condition also makes sure vCPU 0 itself will have the
> vector setting logged), or it changing after it was once set. (Arguably
> a downside is that some vCPU not having its vector set would no longer
> be recognizable from the logs. But I think that's tolerable as
> sufficiently unlikely outside of people actively fiddling with related
> code.)

Maybe we could consider printing unconditionally for debug builds?

Thanks, Roger.

