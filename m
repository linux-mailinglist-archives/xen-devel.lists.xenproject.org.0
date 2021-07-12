Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B2873C62B4
	for <lists+xen-devel@lfdr.de>; Mon, 12 Jul 2021 20:35:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.154667.285771 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m30lu-00032d-LT; Mon, 12 Jul 2021 18:35:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 154667.285771; Mon, 12 Jul 2021 18:35:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m30lu-0002zF-Hd; Mon, 12 Jul 2021 18:35:14 +0000
Received: by outflank-mailman (input) for mailman id 154667;
 Mon, 12 Jul 2021 18:35:13 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=9Tj0=ME=gmail.com=xadimgnik@srs-us1.protection.inumbo.net>)
 id 1m30ls-0002z3-UK
 for xen-devel@lists.xenproject.org; Mon, 12 Jul 2021 18:35:12 +0000
Received: from mail-wr1-x42f.google.com (unknown [2a00:1450:4864:20::42f])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 537434f8-cf87-46a1-9570-e2b4f7e51665;
 Mon, 12 Jul 2021 18:35:12 +0000 (UTC)
Received: by mail-wr1-x42f.google.com with SMTP id d12so26312431wre.13
 for <xen-devel@lists.xenproject.org>; Mon, 12 Jul 2021 11:35:12 -0700 (PDT)
Received: from [192.168.1.186]
 (host86-143-223-59.range86-143.btcentralplus.com. [86.143.223.59])
 by smtp.gmail.com with ESMTPSA id h13sm15046299wrs.68.2021.07.12.11.35.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 12 Jul 2021 11:35:11 -0700 (PDT)
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
X-Inumbo-ID: 537434f8-cf87-46a1-9570-e2b4f7e51665
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:reply-to:subject:to:cc:references:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=7IOFMEaRXeb4lEhp2WUWQKlciZCWXIIZtMZDzWywoQE=;
        b=iJ5ypSOwhZ1GrRtpiXszUM+5DzrGOgexYHG8U7Mc+DDSREbz0w+aHGa45PxH42Gyxi
         0pfPYkDMR+fOdhj2yWUtiErQzJL5BlIQNHCbJk3nVBOwmSmBbinAjKGjfJ/HKvcttf7a
         6fao64lFvcgyNHsLTspMvmYZ12+VBWaDyAZCQQBvjZW6ui1thulFX9DIpLNjrAWvwF7R
         ADn797u2YfILlvEemxqBw2xGzWFJdpSarYg1PsGbGie0lhBG9EHiS4Cx4GirY50veGSH
         bfTCZGb5ZC6nV4enyfCrSP0vQCQGOGkGBsfVKuSHUFKRlt33UOxxPJ+90xN1ut1GnIbx
         zmng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:reply-to:subject:to:cc:references
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=7IOFMEaRXeb4lEhp2WUWQKlciZCWXIIZtMZDzWywoQE=;
        b=isZFozRyx4ofkkYxloVhOHoz87wxZqJ6+mNZFsxLYBBSpmBQ8lIKJ2iSPei0iX9BhL
         Fari3FIcAW+1QuCUSrVv2uYGBsVTkujUgUl7/XOguRMDbiEOmdYgra6qaekaBaISD+/u
         6RDZxru5UV8nuJ8CQnBngKpL2E5XuGS+h5yjzjcM5O2VpGdgc1/zvgQKpaPfZrQjBkCL
         A8cqP526RdkGtKzj8+/YaVsIOyvwnZ2j+g2KCkke7549dJPm4N4VVdMzt6bXLQdB+olW
         yZW5P5NL+FGDmajTxFTL1KsEOud6T8+NqIggrHwk1ov700nnWAS6pfXVDu0SGEyki4sh
         zFmA==
X-Gm-Message-State: AOAM531xSCxb9hE5jRevp6f1ikb3rqWj4krs03KAwxl7wPZbAucxxhPz
	S6gEjTNDsZ3JuYHT5yl14xk=
X-Google-Smtp-Source: ABdhPJzlymIG/+7+4jY63p8axw0hsT46LSF5jRgU2hk2Q0460Tgl8C/UNryGwoIamG4oXsb9663AGQ==
X-Received: by 2002:adf:fb8f:: with SMTP id a15mr465196wrr.92.1626114911428;
        Mon, 12 Jul 2021 11:35:11 -0700 (PDT)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: Paul Durrant <paul@xen.org>
Reply-To: paul@xen.org
Subject: Re: [PATCH 2/2] CHANGELOG: record changed PCI device quarantining
 default
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>
References: <95ceeea0-5623-952e-00c9-2c7f1a3459dc@suse.com>
 <79d35b3a-4f13-fd5b-91db-2805c999b36d@suse.com>
Message-ID: <8ba4e63d-12f6-2aef-0833-d9e0b989a9b9@xen.org>
Date: Mon, 12 Jul 2021 19:35:10 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <79d35b3a-4f13-fd5b-91db-2805c999b36d@suse.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 07/07/2021 14:22, Jan Beulich wrote:
> This amends commit 980d6acf1517 ("IOMMU: make DMA containment of
> quarantined devices optional").
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Reviewed-by: Paul Durrant <paul@xen.org>

> 
> --- a/CHANGELOG.md
> +++ b/CHANGELOG.md
> @@ -10,6 +10,13 @@ The format is based on [Keep a Changelog
>    - XENSTORED_ROOTDIR environment variable from configuartion files and
>      initscripts, due to being unused.
>   
> +### Changed
> + - Quarantining of passed-through PCI devices no longer defaults to directing I/O to a scratch
> +   page, matching original post-XSA-302 behavior (albeit the change was also backported, first
> +   appearing in 4.12.2 and 4.11.4). Prior (4.13...4.15-like) behavior can be arranged for
> +   either by enabling the IOMMU_QUARANTINE_SCRATCH_PAGE setting at build (configuration) time
> +   or by passing "iommu=quarantine=scratch-page" on the hypervisor command line.
> +
>   ## [4.15.0 UNRELEASED](https://xenbits.xen.org/gitweb/?p=xen.git;a=shortlog;h=RELEASE-4.15.0) - TBD
>   
>   ### Added / support upgraded
> 


