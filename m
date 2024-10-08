Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 35E5899542C
	for <lists+xen-devel@lfdr.de>; Tue,  8 Oct 2024 18:15:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.813324.1226210 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1syCri-0005AN-Eu; Tue, 08 Oct 2024 16:15:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 813324.1226210; Tue, 08 Oct 2024 16:15:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1syCri-00058T-Bn; Tue, 08 Oct 2024 16:15:14 +0000
Received: by outflank-mailman (input) for mailman id 813324;
 Tue, 08 Oct 2024 16:15:12 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=UDM+=RE=gmail.com=edgar.iglesias@srs-se1.protection.inumbo.net>)
 id 1syCrg-00058E-CK
 for xen-devel@lists.xenproject.org; Tue, 08 Oct 2024 16:15:12 +0000
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com
 [2a00:1450:4864:20::233])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7e6008b0-8590-11ef-a0bc-8be0dac302b0;
 Tue, 08 Oct 2024 18:15:11 +0200 (CEST)
Received: by mail-lj1-x233.google.com with SMTP id
 38308e7fff4ca-2fadb636abaso58312701fa.3
 for <xen-devel@lists.xenproject.org>; Tue, 08 Oct 2024 09:15:11 -0700 (PDT)
Received: from gmail.com (213-67-3-247-no600.tbcn.telia.com. [213.67.3.247])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-2faf9ab16d6sm12134871fa.9.2024.10.08.09.15.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Oct 2024 09:15:09 -0700 (PDT)
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
X-Inumbo-ID: 7e6008b0-8590-11ef-a0bc-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728404111; x=1729008911; darn=lists.xenproject.org;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IMIvpHcd45lnY83/T5RuSlqtxEHFtUU4rXlFswYQzkM=;
        b=FL3ZlS9clDW6vQM1axDGbaMBOZ4sCMzN3afPgSnLmNyuiHhQs49bO61fjw7w/t9V0C
         fCLp8uC0XgN9LYUKvcEAatefwC7wWzKAgQ8d02kIKlyloR0A95B/im3H4FX1Ap3FppB+
         kEUhXvqBiEPb+zFb4jbNQGwFFGD+9xP/bW545StcT5eHo8ySeadNnJJRsbV+w385SVVV
         6vI12QEUD6Uhw06lssKHlfEfE9J/jSNWMRuToj3OW+WFI0WhByaRgOnaFWecPsc01abB
         O6zkGtTphrJFFbPUQQONTMghOcO4U3gDLGUuTw9VVZ17E5hVdSDOj93FFEkTVaaCAzCl
         bYSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728404111; x=1729008911;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IMIvpHcd45lnY83/T5RuSlqtxEHFtUU4rXlFswYQzkM=;
        b=BJWpB+FzI3mxOliFik2sgc912Zlz3ZodB2s/ojvHkILY5KhgQ2wo7UAHlW+A/QrWXC
         DL3Jae0tsXnFLRQw3DCYYlCuvkfvJrNUtpvHt/CI2E8EV7LVqLWIpt096UY7cJ2kg8Da
         Iq6Zox3xKcmsQgbQbXffblEcVKTCeBRftpt+vFXMfE6t0dVFTwyccrq2HA+/Yeoy2A0o
         lqtdYYFHmbbwX222KqoWiTj7VfUBjq4acJBq92LxmcgkZwtArwH5xGIYQEDwH3YgS2I9
         ng2fbCq5tjHvd5W9WWobnF1qKG54nx3fO0vnDc6fCq+OOOzYVT9IU0A8CGAC++HVL8gN
         v2Rg==
X-Forwarded-Encrypted: i=1; AJvYcCWId62tMwQFVmXp3t2joTMRtFhq73g0kcjOjJTDcQZzfvG9tXedDM6Yu9K7jUrlPCQAEMMPGC2lLZA=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yx1zcNcRL3jZTg6SEtn4lHy9s9xA8jH0QgjmlVAQlPiFHDKpw2s
	7+1wmORaKbKaM1OHN2jyaqC8VnwgDeUSducrjiz8A9a18KvKc6ht
X-Google-Smtp-Source: AGHT+IGDWMbqRpqybixokuuP3QnOFg281QMvVsPNrT/ERnJ4OB4eKlTCgCDG90riRqCH5QN2YB4N+Q==
X-Received: by 2002:a2e:bea7:0:b0:2fb:c20:dbc5 with SMTP id 38308e7fff4ca-2fb0c20dc90mr31779931fa.29.1728404110528;
        Tue, 08 Oct 2024 09:15:10 -0700 (PDT)
Date: Tue, 8 Oct 2024 18:15:09 +0200
From: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, sstabellini@kernel.org, anthony@xenproject.org,
	paul@xen.org, edgar.iglesias@amd.com,
	xen-devel@lists.xenproject.org, Paolo Bonzini <pbonzini@redhat.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	Eduardo Habkost <eduardo@habkost.net>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
Subject: Re: [PULL v2 2/5] hw/xen: Expose handle_bufioreq in
 xen_register_ioreq
Message-ID: <ZwVaje_9lg9lwavh@zapote>
References: <20241003185655.1480819-1-edgar.iglesias@gmail.com>
 <20241003185655.1480819-3-edgar.iglesias@gmail.com>
 <CAFEAcA9SgThjVW=VY_ZeKZh0bAe+rbTReK00DAQEXgMwD8cNqQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAFEAcA9SgThjVW=VY_ZeKZh0bAe+rbTReK00DAQEXgMwD8cNqQ@mail.gmail.com>
User-Agent: Mutt/2.2.12 (2023-09-09)

On Mon, Oct 07, 2024 at 04:42:49PM +0100, Peter Maydell wrote:
> On Thu, 3 Oct 2024 at 19:57, Edgar E. Iglesias <edgar.iglesias@gmail.com> wrote:
> >
> > From: "Edgar E. Iglesias" <edgar.iglesias@amd.com>
> >
> > Expose handle_bufioreq in xen_register_ioreq().
> > This is to allow machines to enable or disable buffered ioreqs.
> >
> > No functional change since all callers still set it to
> > HVM_IOREQSRV_BUFIOREQ_ATOMIC.
> >
> > Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
> > Signed-off-by: Edgar E. Iglesias <edgar.iglesias@amd.com>
> 
> Hi; Coverity has noticed a problem (CID 1563383) with this change:
> 
> > diff --git a/hw/xen/xen-hvm-common.c b/hw/xen/xen-hvm-common.c
> > index 3a9d6f981b..7d2b72853b 100644
> > --- a/hw/xen/xen-hvm-common.c
> > +++ b/hw/xen/xen-hvm-common.c
> > @@ -667,6 +667,8 @@ static int xen_map_ioreq_server(XenIOState *state)
> >      xen_pfn_t ioreq_pfn;
> >      xen_pfn_t bufioreq_pfn;
> >      evtchn_port_t bufioreq_evtchn;
> 
> In this function bufioreq_evtchn is declared uninitialized...
> 
> > +    unsigned long num_frames = 1;
> > +    unsigned long frame = 1;
> >      int rc;
> >
> >      /*
> > @@ -675,59 +677,78 @@ static int xen_map_ioreq_server(XenIOState *state)
> >       */
> >      QEMU_BUILD_BUG_ON(XENMEM_resource_ioreq_server_frame_bufioreq != 0);
> >      QEMU_BUILD_BUG_ON(XENMEM_resource_ioreq_server_frame_ioreq(0) != 1);
> > +
> > +    if (state->has_bufioreq) {
> > +        frame = 0;
> > +        num_frames = 2;
> > +    }
> >      state->fres = xenforeignmemory_map_resource(xen_fmem, xen_domid,
> >                                           XENMEM_resource_ioreq_server,
> > -                                         state->ioservid, 0, 2,
> > +                                         state->ioservid,
> > +                                         frame, num_frames,
> >                                           &addr,
> >                                           PROT_READ | PROT_WRITE, 0);
> >      if (state->fres != NULL) {
> >          trace_xen_map_resource_ioreq(state->ioservid, addr);
> > -        state->buffered_io_page = addr;
> > -        state->shared_page = addr + XC_PAGE_SIZE;
> > +        state->shared_page = addr;
> > +        if (state->has_bufioreq) {
> > +            state->buffered_io_page = addr;
> > +            state->shared_page = addr + XC_PAGE_SIZE;
> > +        }
> >      } else if (errno != EOPNOTSUPP) {
> >          error_report("failed to map ioreq server resources: error %d handle=%p",
> >                       errno, xen_xc);
> >          return -1;
> >      }
> >
> > -    rc = xen_get_ioreq_server_info(xen_domid, state->ioservid,
> > -                                   (state->shared_page == NULL) ?
> > -                                   &ioreq_pfn : NULL,
> > -                                   (state->buffered_io_page == NULL) ?
> > -                                   &bufioreq_pfn : NULL,
> > -                                   &bufioreq_evtchn);
> 
> ...which was OK prior to this change, because (ignoring the
> early-exit case) we would always pass through this function
> call, which initializes bufioreq_evtchn...
> 
> > -    if (rc < 0) {
> > -        error_report("failed to get ioreq server info: error %d handle=%p",
> > -                     errno, xen_xc);
> > -        return rc;
> > -    }
> > +    /*
> > +     * If we fail to map the shared page with xenforeignmemory_map_resource()
> > +     * or if we're using buffered ioreqs, we need xen_get_ioreq_server_info()
> > +     * to provide the the addresses to map the shared page and/or to get the
> > +     * event-channel port for buffered ioreqs.
> > +     */
> > +    if (state->shared_page == NULL || state->has_bufioreq) {
> > +        rc = xen_get_ioreq_server_info(xen_domid, state->ioservid,
> > +                                       (state->shared_page == NULL) ?
> > +                                       &ioreq_pfn : NULL,
> > +                                       (state->has_bufioreq &&
> > +                                        state->buffered_io_page == NULL) ?
> > +                                       &bufioreq_pfn : NULL,
> > +                                       &bufioreq_evtchn);
> 
> ...but now the initialization has moved inside an if() so it only
> happens under certain conditions...
> 
> > +        if (rc < 0) {
> > +            error_report("failed to get ioreq server info: error %d handle=%p",
> > +                         errno, xen_xc);
> > +            return rc;
> > +        }
> >
> > -    if (state->shared_page == NULL) {
> > -        trace_xen_map_ioreq_server_shared_page(ioreq_pfn);
> > +        if (state->shared_page == NULL) {
> > +            trace_xen_map_ioreq_server_shared_page(ioreq_pfn);
> >
> > -        state->shared_page = xenforeignmemory_map(xen_fmem, xen_domid,
> > -                                                  PROT_READ | PROT_WRITE,
> > -                                                  1, &ioreq_pfn, NULL);
> > +            state->shared_page = xenforeignmemory_map(xen_fmem, xen_domid,
> > +                                                      PROT_READ | PROT_WRITE,
> > +                                                      1, &ioreq_pfn, NULL);
> > +        }
> >          if (state->shared_page == NULL) {
> >              error_report("map shared IO page returned error %d handle=%p",
> >                           errno, xen_xc);
> >          }
> > -    }
> >
> > -    if (state->buffered_io_page == NULL) {
> > -        trace_xen_map_ioreq_server_buffered_io_page(bufioreq_pfn);
> > +        if (state->has_bufioreq && state->buffered_io_page == NULL) {
> > +            trace_xen_map_ioreq_server_buffered_io_page(bufioreq_pfn);
> >
> > -        state->buffered_io_page = xenforeignmemory_map(xen_fmem, xen_domid,
> > -                                                       PROT_READ | PROT_WRITE,
> > -                                                       1, &bufioreq_pfn,
> > -                                                       NULL);
> > -        if (state->buffered_io_page == NULL) {
> > -            error_report("map buffered IO page returned error %d", errno);
> > -            return -1;
> > +            state->buffered_io_page = xenforeignmemory_map(xen_fmem, xen_domid,
> > +                                                        PROT_READ | PROT_WRITE,
> > +                                                        1, &bufioreq_pfn,
> > +                                                        NULL);
> > +            if (state->buffered_io_page == NULL) {
> > +                error_report("map buffered IO page returned error %d", errno);
> > +                return -1;
> > +            }
> >          }
> >      }
> >
> > -    if (state->shared_page == NULL || state->buffered_io_page == NULL) {
> > +    if (state->shared_page == NULL ||
> > +        (state->has_bufioreq && state->buffered_io_page == NULL)) {
> >          return -1;
> >      }
> 
> ...and the tail end of the function has not been modified, so
> (not visible in this diff context) when we do:
> 
>     trace_xen_map_ioreq_server_buffered_io_evtchn(bufioreq_evtchn);
> 
>     state->bufioreq_remote_port = bufioreq_evtchn;
> 
>     return 0;
> 
> we may be using it uninitialized (in the trace statement
> and when assigning it to state->bufioreq_remote_port).
> 
> Could you have a look at this and send a fix, please?
>

Thanks Peter,

I sent a fix for this yesterday.

Best regards,
Edgar

