Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B93DDA736DE
	for <lists+xen-devel@lfdr.de>; Thu, 27 Mar 2025 17:31:54 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.929747.1332500 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1txq8w-0007Xq-T5; Thu, 27 Mar 2025 16:31:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 929747.1332500; Thu, 27 Mar 2025 16:31:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1txq8w-0007WF-QI; Thu, 27 Mar 2025 16:31:46 +0000
Received: by outflank-mailman (input) for mailman id 929747;
 Thu, 27 Mar 2025 16:31:45 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=U7fn=WO=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1txq8v-0007N3-BW
 for xen-devel@lists.xenproject.org; Thu, 27 Mar 2025 16:31:45 +0000
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com
 [2a00:1450:4864:20::533])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f895ee73-0b28-11f0-9ea3-5ba50f476ded;
 Thu, 27 Mar 2025 17:31:44 +0100 (CET)
Received: by mail-ed1-x533.google.com with SMTP id
 4fb4d7f45d1cf-5e8be1bdb7bso1985431a12.0
 for <xen-devel@lists.xenproject.org>; Thu, 27 Mar 2025 09:31:44 -0700 (PDT)
Received: from localhost ([84.78.159.3]) by smtp.gmail.com with UTF8SMTPSA id
 4fb4d7f45d1cf-5edc17e01f7sm34052a12.79.2025.03.27.09.31.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Mar 2025 09:31:43 -0700 (PDT)
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
X-Inumbo-ID: f895ee73-0b28-11f0-9ea3-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1743093104; x=1743697904; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=TTcpwQghemzPVtac8LblK6+2AfxY03jru2N5EbYHh74=;
        b=iVuTTg4DInFd5Civ5RgSurLdRskg5kCngIsDcJDO8wzjE39rQQNaa6cu+Yn2E7Z2av
         tJeLeRODrqf8jjKIiZGJYjzQfVlslHUO1jyywtk8nFFJpjhwqN9Ag2GO30OGuCHe28Q1
         HPAXAWMhZ4emsRuUrwp8DEw4o/mBGIUiUJl2w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743093104; x=1743697904;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=TTcpwQghemzPVtac8LblK6+2AfxY03jru2N5EbYHh74=;
        b=rCFqS72w61LLGykvE2bNoYePoWwuZ/An2XsgtOmEYowpeXM0vzrGGYaCY6aGXNLqPu
         L1p2bvn0iYO6ifqVkB/+e5a9h6+K5sbNNoVsCT2B+EwXFJdfA4mfQVLGmcgGH+zkwxMT
         U7aCOIWWRNOtKRTIJCPRv6z7vNfSmvkWfGwkZidvxrnN9T/i0eQZTbnGvESaFijFtmB1
         0dsQ69osqfqID7oAQiyIndgyIgE9rb4FBUuGgCwGUh7toorLMVhVM8iu2ta/uFvKVrJR
         zQaDdI77d7+HxC/iCyZepQTKKDl7/bLGHcn/+u1jjyQG4o009fswdN108tUhZ5MlEKUQ
         W0tg==
X-Gm-Message-State: AOJu0YyGOEuqmJBBrMnoHyX/dSyDCyO4vfjIIdIK1YSTbJVJIJ9Zkncg
	uWbL+pSOk9ASsHwbraU7V7tmcqyhbYKNU48sC3Hdr+8bVyocvXR5dbPCpn1P1Kw=
X-Gm-Gg: ASbGncttjjejXGXDUMdumoDGxJFXaaoftLJk68H1vD/6veM0EeJHI8aCNFgrv9d487J
	eDk0ZiUYGGd9+g7YLZmh+Z2eczFJ2div9Xtuhk577oZyIdRTM7/YV3RPzqCaTi4/Is0pd8JvHs5
	AquxZuhJTTZkZ+j+otHhtK1KoR0f2FNAeL3YKWnzwS1RxaU4G7QrrRxDPRLaw2f5jDdq6KJeCup
	3hiSporPRaDWPH5OHSgs8WlzXe0bnHY4NjsL376AGSVjzKObAhDeqzLsgOowPUj6GHSkbBxQP5v
	H1oefz15q20JMy+WIQcFp5OkTYL302eJsZUE7JpEbO5qjXFlzw==
X-Google-Smtp-Source: AGHT+IGrr50VcctwrN2mkdbDRU8vcGhqmKEms7g6ZZ788ceiEuz27OT+z1ok2UOU4mTAuQI2dZJ3HA==
X-Received: by 2002:a05:6402:354e:b0:5e5:dbd0:2a4d with SMTP id 4fb4d7f45d1cf-5ed8e27a9aemr3728902a12.8.1743093104118;
        Thu, 27 Mar 2025 09:31:44 -0700 (PDT)
Date: Thu, 27 Mar 2025 17:31:42 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH] x86/MTRR: constrain AP sync and BSP restore
Message-ID: <Z-V9btYNKSmEj-HA@macbook.local>
References: <56fbfae0-aac7-4841-ab3c-a7e00dda3744@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <56fbfae0-aac7-4841-ab3c-a7e00dda3744@suse.com>

On Thu, Mar 27, 2025 at 10:54:23AM +0100, Jan Beulich wrote:
> mtrr_set_all() has quite a bit of overhead, which is entirely useless
> when set_mtrr_state() really does nothing. Furthermore, with
> mtrr_state.def_type never initialized from hardware, post_set()'s
> unconditional writing of the MSR means would leave us running in UC
> mode after the sync.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Acked-by: Roger Pau Monné <roger.pau@citrix.com>

Conditional on reaching consensus on whether the mtrr_bp_restore()
needs re-adding to the resume path.  Otherwise the code needs to be
removed.

Thanks, Roger.

