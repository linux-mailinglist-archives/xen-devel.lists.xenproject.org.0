Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AF9BB2687D
	for <lists+xen-devel@lfdr.de>; Thu, 14 Aug 2025 16:05:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1081767.1441769 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1umYZj-0007RP-Sj; Thu, 14 Aug 2025 14:05:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1081767.1441769; Thu, 14 Aug 2025 14:05:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1umYZj-0007PU-Px; Thu, 14 Aug 2025 14:05:03 +0000
Received: by outflank-mailman (input) for mailman id 1081767;
 Thu, 14 Aug 2025 14:05:02 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=6Upc=22=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1umYZi-0006vV-36
 for xen-devel@lists.xenproject.org; Thu, 14 Aug 2025 14:05:02 +0000
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [2a00:1450:4864:20::32f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ab43d6cb-7917-11f0-a328-13f23c93f187;
 Thu, 14 Aug 2025 16:05:01 +0200 (CEST)
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-45a1b0bde14so4899375e9.2
 for <xen-devel@lists.xenproject.org>; Thu, 14 Aug 2025 07:05:01 -0700 (PDT)
Received: from localhost (112.pool92-178-7.dynamic.orange.es. [92.178.7.112])
 by smtp.gmail.com with UTF8SMTPSA id
 5b1f17b1804b1-45a1c78b33csm23945245e9.25.2025.08.14.07.05.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Aug 2025 07:05:00 -0700 (PDT)
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
X-Inumbo-ID: ab43d6cb-7917-11f0-a328-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1755180301; x=1755785101; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=k2xvaITA3b0kdsxlFAbZtv4pFa7e33kAas+Pqqz57dY=;
        b=JR9wAzFhrtm7v7+5HgcTX31VP1YOI1z+lW+ixQedhAfHM5qSjC87js4bPG+0V5Ckxi
         4HZqGcjtLstnxlNdIfMu5/QwArVFurMelG7VzAEP6MkHQ2Aj4K4JwPPb2WkEMN/+JweY
         Hx+RcwIZq1IUyKUkTMTf6wsgR+L3R5B2uQtcQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755180301; x=1755785101;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=k2xvaITA3b0kdsxlFAbZtv4pFa7e33kAas+Pqqz57dY=;
        b=CbEhn7kJfe8M4NbG87oOgLXxX+LWrdlek3+4jNqalvUTh+oBqUFE7yCQLEwo5dMBRW
         P4q2lN9olWK/i0QfPoJBcZWosk7WCM5BEya21/uIc7V1fDnyT2HLNy/FfoJzXwCZmyMG
         bNIVGfd+g6ikQ2s0WZWE4sN9beX5j1dj2TjdTdVzOHxM/Wg07XyNIoAboYgYeIaSI0N8
         1gAQMET/j0AyqnyMUxmrfa+gu7kVJaCtdiULO7fQC54VtLcENYIppYa4Jw2/4xH2oOwc
         j+wvNWgYzwgmBvmUWB5itQ3YV1TsZQC/tkSJ5zPA1eGn6QuYbZmV/j9L6Ox+KhBTDDx8
         ekdw==
X-Gm-Message-State: AOJu0YzFieqILiGi2G9PO295Pv15z66LcVloNUHY+6WibIILAce71oQ5
	uizPx8XYY4sbLYFV19oWFVIcmzqr2PL9ofnig521i7fuxIkX+ftzrBE0wNcNmGIatIs=
X-Gm-Gg: ASbGncuAHZiXFNh2aBBkKRglrjUKSdE06F6Fn0MMaxv78M5GirwJzTiwrwyMCyfM9aY
	1KWpQOExBR76xbGCKx0Gp1g1KDnAInL6oGjuYSEefuOBU1xFEcTY0wBLzZCWcVrTIdTx6X22Phe
	srD67GXhoO08Fq+2nbAXLqlzO3dckvmTRWX5IXrg+j1ajcBqwT4FYIOUoMhrtdlcwZng8EqnzNH
	bFNR8EY+R+vNP+s2cS0lEq8/TSLnBaI8ffyBevuKqvon1LrToUUhcEk2x3Sstj0gI+uWQXIXfye
	plZi4JAe8vxfzsTgch4RVBQVZiq15ouG7kW5hJMOD77S9B0pAhuw0SGmN52h2T+G6YPT6SZwVuJ
	SyGdjxQAh54JGJVLyBPhQqIm9Xyb8gc2VW8Ho7V1PBrvjTKq9YchAeTJghREyRwUIPg==
X-Google-Smtp-Source: AGHT+IHpiNAwz1bjaejTn8Am/As73IbST4bvPRvozdYr0Z3+R0X6wSqfXHJtwYY95hM7tJYktlVLGA==
X-Received: by 2002:a05:600c:4509:b0:459:443e:b177 with SMTP id 5b1f17b1804b1-45a1b6682f3mr23512835e9.25.1755180300783;
        Thu, 14 Aug 2025 07:05:00 -0700 (PDT)
Date: Thu, 14 Aug 2025 16:04:59 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH v2 1/2] x86/mkelf32: pad load segment to 2Mb boundary
Message-ID: <aJ3tC9h0ERajD-Ya@macbook.local>
References: <ddfd86ad-19b3-495b-930c-1770dd92fa99@suse.com>
 <6e295921-0432-435e-9efe-51caa106f203@suse.com>
 <aJtpXOM2AERnOCrH@macbook.local>
 <38430fbf-a6e4-4ba9-bbff-2279108721e6@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <38430fbf-a6e4-4ba9-bbff-2279108721e6@suse.com>

On Thu, Aug 14, 2025 at 09:02:35AM +0200, Jan Beulich wrote:
> On 12.08.2025 18:18, Roger Pau Monné wrote:
> > On Mon, Aug 11, 2025 at 12:49:57PM +0200, Jan Beulich wrote:
> >> @@ -339,9 +340,12 @@ int main(int argc, char **argv)
> >>      (void)lseek(infd, in64_phdr.p_offset, SEEK_SET);
> >>      dat_siz = (uint32_t)in64_phdr.p_filesz;
> >>  
> >> -    /* Do not use p_memsz: it does not include BSS alignment padding. */
> >> -    /*mem_siz = (uint32_t)in64_phdr.p_memsz;*/
> >> -    mem_siz = (uint32_t)(final_exec_addr - in64_phdr.p_vaddr);
> >> +    /*
> >> +     * We don't pad .bss in the linker script, but during early boot we map
> >> +     * the Xen image using 2M pages.  To avoid running into adjacent non-RAM
> >> +     * regions, pad the segment to the next 2M boundary.
> > 
> > Won't it be easier to pad in the linker script?  We could still have
> > __bss_end before the padding, so that initialization isn't done to the
> > extra padding area.  Otherwise it would be helpful to mention why the
> > padding must be done here (opposed to being done in the linker
> > script).
> 
> The way the linker script currently is written doesn't lend itself to do
> the padding there: It would either mean to introduce an artificial
> padding section (which I'd dislike), or it would result in _end[] and
> __2M_rwdata_end[] also moving, which pretty clearly we don't want. Maybe
> there are other options that I simply don't see.

We could move both _end and __2M_rwdata_end inside the .bss section,
but that's also ugly IMO.  I would probably prefer the extra padding
section.

> A further complication would be xen.efi's .reloc, which we don't want to
> needlessly move either. That may be coverable by pr-processor
> conditionals, but I wanted to mention the aspect nevertheless.

Yeah, we could make the extra padding section depend on pre-processor
checks.  I think I would prefer the usage of such extra section rather
than mangling the elf program headers afterwards, but since we are
already doing it:

Acked-by: Roger Pau Monné <roger.pau@citrix.com>

Thanks, Roger.

