Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4024AA73280
	for <lists+xen-devel@lfdr.de>; Thu, 27 Mar 2025 13:48:29 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.929214.1331842 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1txmeg-0007mV-4K; Thu, 27 Mar 2025 12:48:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 929214.1331842; Thu, 27 Mar 2025 12:48:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1txmeg-0007ki-1f; Thu, 27 Mar 2025 12:48:18 +0000
Received: by outflank-mailman (input) for mailman id 929214;
 Thu, 27 Mar 2025 12:48:16 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=U7fn=WO=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1txmee-0007ka-P0
 for xen-devel@lists.xenproject.org; Thu, 27 Mar 2025 12:48:16 +0000
Received: from mail-pj1-x1034.google.com (mail-pj1-x1034.google.com
 [2607:f8b0:4864:20::1034])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id bd6a5c3f-0b09-11f0-9ffa-bf95429c2676;
 Thu, 27 Mar 2025 13:48:11 +0100 (CET)
Received: by mail-pj1-x1034.google.com with SMTP id
 98e67ed59e1d1-2ff69365e1dso1136747a91.3
 for <xen-devel@lists.xenproject.org>; Thu, 27 Mar 2025 05:48:11 -0700 (PDT)
Received: from localhost ([84.78.159.3]) by smtp.gmail.com with UTF8SMTPSA id
 98e67ed59e1d1-3039e60bfd6sm2079555a91.41.2025.03.27.05.48.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Mar 2025 05:48:09 -0700 (PDT)
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
X-Inumbo-ID: bd6a5c3f-0b09-11f0-9ffa-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1743079690; x=1743684490; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=FLIWM2we3cEfiyzfwadD2/gV4vcunRmC7++TxYV9XuY=;
        b=lEYk8lmoAVTXbOdizSBsCmQ8Umy8o1YOL0vRi46x+XPPKAigMnQjkosRryzf8dus56
         uxDAbxrG3tphZMFyaRvbdqlBCZ+nFsrnDI5RyntvpBqz9zMxZSQSSGMwUA7MJ27Tpu6v
         o4ykbXr4qmhNUv6dL2bHi+3uGAoHFPnSl3p3c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743079690; x=1743684490;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=FLIWM2we3cEfiyzfwadD2/gV4vcunRmC7++TxYV9XuY=;
        b=v8MmrCLgrqOyJMN2PnexuGdxWkC2WkGJ1hxdD+WUU+2n4PQpM4mKmMNlFs9YW3h1pK
         KIoFVkGckFbDCnrzcTn26Ka3SHfTkwnU8RW7R8mxnCTmXwFm4rawokQi3yT3V+x6QL8Q
         9PIT3bhbgfi3D2NvlU+9uOIpssRO0dcwoW2UyAgVCJbaD0OIJECxjzmAhwS1rHtVq/BM
         C+ThEiSpg4d2dtqHfx1fIugbJqv29vhtzhnC8s/io4GzKBaJ8+rk9VXLcjL9KH4uU1iq
         iKhDCeFg4KGqebytMJ0EbA81kKlugSZLbenjqc06WfpT3eDN1V5iDW1pBlsjDEzcTN9e
         tEBA==
X-Gm-Message-State: AOJu0YyLyXwboWpyYIbzxsE+UnACeky3hDzueZcDzrDvmsm0JwueZ6Hl
	G804vTRfwE4VFbQ+O2sHltB3PwAmyc/4rO+mylYrpgN3lW+tuyTodSTlR0irTb3hPOf6I0ydaYm
	x
X-Gm-Gg: ASbGncuEBZLR+fm5qHgzbvUA+jmv+x3V9KrHvoJBJ+WZRlnnvFz1wQHaBk3MAZB/tqu
	7CJSJ0Yhug2H9MJFgIiTKjcWC5VLAvIrwvEgnMvGgiudvwgGqi0SGqeZDfopA/0TxEiLMmbbWR3
	tzgZ+LQCUWRTeOzIiakcRcCtvSFROOHnRvBMG0BrhMbAz3BPo4B8WeKntbdtilz0KvRQ240gul6
	KIgeFRYU8R1dp/u/695GGxV9rlNRzZwE1FkW4DqxrmgdtNuOLE3+VCbr3CL24ivPDSu36ShLzgd
	KDFw/P/VqqNAUX875gghlhgEqE/9I9t+AX85UsN+Dr9RoAppng==
X-Google-Smtp-Source: AGHT+IHHYTXrY4lPNbUB+y8+1G05Pvvxdk+FY3czfG1sPuuBeORxY9CG5jufcCAZDqgsDyLAO73NAw==
X-Received: by 2002:a17:90a:f947:b0:301:1d03:93cd with SMTP id 98e67ed59e1d1-303a8d81f65mr5799507a91.24.1743079690039;
        Thu, 27 Mar 2025 05:48:10 -0700 (PDT)
Date: Thu, 27 Mar 2025 13:48:04 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Marek Marczykowski <marmarek@invisiblethingslab.com>
Subject: Re: [PATCH] x86/MTRR: hook mtrr_bp_restore() back up
Message-ID: <Z-VJBIbQal-jZAGM@macbook.local>
References: <ad8ea1da-dda9-4567-8b15-55b65777e80f@suse.com>
 <Z-U4ozL6p-Unh5Y8@macbook.local>
 <fde64904-343b-48c9-b396-961811cc2adb@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <fde64904-343b-48c9-b396-961811cc2adb@suse.com>

On Thu, Mar 27, 2025 at 01:30:44PM +0100, Jan Beulich wrote:
> On 27.03.2025 12:38, Roger Pau Monné wrote:
> > On Thu, Mar 27, 2025 at 12:20:47PM +0100, Jan Beulich wrote:
> >> Unlike stated in the offending commit's description,
> >> load_system_tables() wasn't the only thing left to retain from the
> >> earlier restore_rest_processor_state().
> >>
> >> While there also do Misra-related tidying for the function itself: The
> >> function being used from assembly only means it doesn't need to have a
> >> declaration, but wants to be asmlinkage.
> > 
> > I wonder, maybe the intention was for the MTRR restoring on the BSP to
> > also be done by the mtrr_aps_sync_end() call in enter_state()?
> > 
> > AFAICT that will set the MTRRs uniformly on all CPUs, by calling
> > mtrr_set_all() just like mtrr_bp_restore(), but later in the restore
> > process.
> 
> Hmm, yes, that's possible. The comment in set_mtrr() is somewhat misleading
> then, though, as for the BP the writing then isn't just "okay" but necessary.
> Question is whether doing this so much later is actually good enough.

Hm, no idea really.  We do the device restore ahead of the MTRR
restore, so I wonder whether we could have issues by using unexpected
effective cache attributes for device memory accesses as a result of
MTRRs not being initialized?

Thanks, Roger.

