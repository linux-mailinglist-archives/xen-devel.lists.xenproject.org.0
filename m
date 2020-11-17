Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 21EF02B6EFD
	for <lists+xen-devel@lfdr.de>; Tue, 17 Nov 2020 20:43:53 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.29242.58542 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kf6tF-0000I5-9r; Tue, 17 Nov 2020 19:43:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 29242.58542; Tue, 17 Nov 2020 19:43:45 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kf6tF-0000Hg-6e; Tue, 17 Nov 2020 19:43:45 +0000
Received: by outflank-mailman (input) for mailman id 29242;
 Tue, 17 Nov 2020 19:43:43 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=lsz4=EX=gmail.com=xadimgnik@srs-us1.protection.inumbo.net>)
 id 1kf6tD-0000HV-A7
 for xen-devel@lists.xenproject.org; Tue, 17 Nov 2020 19:43:43 +0000
Received: from mail-wm1-x335.google.com (unknown [2a00:1450:4864:20::335])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 01e27463-f56f-4c89-af77-7822685a6d84;
 Tue, 17 Nov 2020 19:43:42 +0000 (UTC)
Received: by mail-wm1-x335.google.com with SMTP id p22so4511082wmg.3
 for <xen-devel@lists.xenproject.org>; Tue, 17 Nov 2020 11:43:42 -0800 (PST)
Received: from CBGR90WXYV0
 (host109-146-187-185.range109-146.btcentralplus.com. [109.146.187.185])
 by smtp.gmail.com with ESMTPSA id s25sm4983361wmh.16.2020.11.17.11.43.40
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 17 Nov 2020 11:43:41 -0800 (PST)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=lsz4=EX=gmail.com=xadimgnik@srs-us1.protection.inumbo.net>)
	id 1kf6tD-0000HV-A7
	for xen-devel@lists.xenproject.org; Tue, 17 Nov 2020 19:43:43 +0000
X-Inumbo-ID: 01e27463-f56f-4c89-af77-7822685a6d84
Received: from mail-wm1-x335.google.com (unknown [2a00:1450:4864:20::335])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 01e27463-f56f-4c89-af77-7822685a6d84;
	Tue, 17 Nov 2020 19:43:42 +0000 (UTC)
Received: by mail-wm1-x335.google.com with SMTP id p22so4511082wmg.3
        for <xen-devel@lists.xenproject.org>; Tue, 17 Nov 2020 11:43:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:reply-to:to:cc:references:in-reply-to:subject:date:message-id
         :mime-version:content-transfer-encoding:content-language
         :thread-index;
        bh=cww5t69Y+TBbd051sTPKSFMR0SdWNduPcjesmSdMtYI=;
        b=qLs0rGSw8fdrVx4pKU0crQEHN3u+cG2Ulme1YvIl6yYA69ZykFQeU0E01NPdcCIMLo
         OE+PQY8LNxvu6I2EA2LkaWc7Ek2kH0uoUo55goUQy7WVt11NeJoLbCsl6/NXqsazamYZ
         loogO4efz1bY4twyfvWvVNrcvvXvJbOmKMu6GcEyBWdPr86y0PVWJ5fN0K9B/x2Cbjd/
         55CFbvPh6E1YSneDaD58qrRkGzcM6abE6+/4BoMBquQATQrFl7LNGLqOh6DyY44qHrSj
         IKZ9BEKrai3fgV2IMaSxPaVll5BN6VJyRb0eJoL4bmYtW0BT47c+Qm2uFudF0SDEat1w
         TRLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:reply-to:to:cc:references:in-reply-to
         :subject:date:message-id:mime-version:content-transfer-encoding
         :content-language:thread-index;
        bh=cww5t69Y+TBbd051sTPKSFMR0SdWNduPcjesmSdMtYI=;
        b=bJnTdIYSbTdQsK+bC+HgVgC7OLdxws6cP53PZk2wCoF9lg59YnXpvrKNvv7MoRyC+V
         w9bgNEAQeKYbkuRF/0XpWpFNrDtvAENwevL3UmKHslhB6eOivgq1x/4XWmbZO8MRYlUJ
         FuNHKZXxc+hJtE6A3E22Ids2xkXcs6v2iOWYl+qRgq/cBENMSld82pV/Bup0zSxDphjq
         E36PoDsaotpkGhUeNJpw4NjZKEbR4i/PK0+Oqwc7dsWFCFkYygIIPBA13lHTDVWkpX8s
         r1gvbD3dM3XZfeTzz1Pv4Bowuj0dtq2fALzZXqVx7VKOjKSrt6TOQLnAKfiGgHpkZMG0
         XwmQ==
X-Gm-Message-State: AOAM5321migAd8KXeoeLV9ous68kKK2EDsQtfGene7SVzbfkJBFhXvlj
	SVLQ6igpnkx6k5iwfa25aVI=
X-Google-Smtp-Source: ABdhPJzzBrFavBO5uUzSdp1x4fUscTc0mqBukRptDocamSJyLDfd5Zpoz09GPqfkLV6C9NIyAdeQIA==
X-Received: by 2002:a1c:230b:: with SMTP id j11mr693664wmj.12.1605642221762;
        Tue, 17 Nov 2020 11:43:41 -0800 (PST)
Received: from CBGR90WXYV0 (host109-146-187-185.range109-146.btcentralplus.com. [109.146.187.185])
        by smtp.gmail.com with ESMTPSA id s25sm4983361wmh.16.2020.11.17.11.43.40
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 17 Nov 2020 11:43:41 -0800 (PST)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: "Paul Durrant" <paul@xen.org>
Reply-To: <paul@xen.org>
To: "'Oleksandr'" <olekstysh@gmail.com>
Cc: <xen-devel@lists.xenproject.org>,
	"'Oleksandr Tyshchenko'" <oleksandr_tyshchenko@epam.com>,
	"'Andrew Cooper'" <andrew.cooper3@citrix.com>,
	"'George Dunlap'" <george.dunlap@citrix.com>,
	"'Ian Jackson'" <iwj@xenproject.org>,
	"'Jan Beulich'" <jbeulich@suse.com>,
	"'Julien Grall'" <julien@xen.org>,
	"'Stefano Stabellini'" <sstabellini@kernel.org>,
	"'Wei Liu'" <wl@xen.org>,
	=?UTF-8?Q?'Roger_Pau_Monn=C3=A9'?= <roger.pau@citrix.com>,
	"'Tim Deegan'" <tim@xen.org>,
	"'Julien Grall'" <julien.grall@arm.com>
References: <1602780274-29141-1-git-send-email-olekstysh@gmail.com> <1602780274-29141-3-git-send-email-olekstysh@gmail.com> <004001d6a6b6$9ffd3ac0$dff7b040$@xen.org> <436143ea-609f-f6c3-4952-19fcf410fe8f@gmail.com> <34133df1-bff2-f4df-00a5-674a2af867fc@gmail.com> <007401d6bcf6$63d3f420$2b7bdc60$@xen.org> <a2eecf9b-7246-68c8-aee4-b4009ee16ed8@gmail.com>
In-Reply-To: <a2eecf9b-7246-68c8-aee4-b4009ee16ed8@gmail.com>
Subject: RE: [PATCH V2 02/23] xen/ioreq: Make x86's IOREQ feature common
Date: Tue, 17 Nov 2020 19:43:40 -0000
Message-ID: <009601d6bd19$f379b4c0$da6d1e40$@xen.org>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Mailer: Microsoft Outlook 16.0
Content-Language: en-gb
Thread-Index: AQFqp5MaNUj6MKEiN9RM6S6pfA5bVAJRJ+K5AatvYagBUPuZ1AIVomhYAiEk0csBuTFrDapK928g

> -----Original Message-----
[snip]
> 
> Both hvm_ioreq_server_init() and hvm_ioreq_server_deinit() call "legacy"
> hvm_ioreq_server_unmap_pages()
> which we want to be abstracted. The only difference between these two
> usages is that the former calls it during rollback only (in case of error).
> Taking into the account what has been suggested for question #1 could we
> just introduce arch_ioreq_server_unmap_pages() to be called from both
> init and deinit?
> 

That sounds fine, yes.

> 
> [Not completed not tested]
> 
> @@ -762,7 +772,7 @@ static int hvm_ioreq_server_init(struct
> hvm_ioreq_server *s,
> 
>    fail_add:
>       hvm_ioreq_server_remove_all_vcpus(s);
> -    hvm_ioreq_server_unmap_pages(s);
> +    arch_ioreq_server_unmap_pages(s);
> 
>       hvm_ioreq_server_free_rangesets(s);
> 
> @@ -776,7 +786,7 @@ static void hvm_ioreq_server_deinit(struct
> hvm_ioreq_server *s)
>       hvm_ioreq_server_remove_all_vcpus(s);
> 
>       /*
> -     * NOTE: It is safe to call both hvm_ioreq_server_unmap_pages() and
> +     * NOTE: It is safe to call both arch_ioreq_server_unmap_pages() and
>        *       hvm_ioreq_server_free_pages() in that order.
>        *       This is because the former will do nothing if the pages
>        *       are not mapped, leaving the page to be freed by the latter.
> @@ -784,7 +794,7 @@ static void hvm_ioreq_server_deinit(struct
> hvm_ioreq_server *s)
>        *       the page_info pointer to NULL, meaning the latter will do
>        *       nothing.
>        */
> -    hvm_ioreq_server_unmap_pages(s);
> +    arch_ioreq_server_unmap_pages(s);
>       hvm_ioreq_server_free_pages(s);
> 
>       hvm_ioreq_server_free_rangesets(s);
> @@ -918,7 +928,7 @@ int hvm_get_ioreq_server_info(struct domain *d,
> ioservid_t id,
> 
>       if ( ioreq_gfn || bufioreq_gfn )
>       {
> -        rc = hvm_ioreq_server_map_pages(s);
> +        rc = arch_ioreq_server_map_pages(s);
>           if ( rc )
>               goto out;
>       }
> 
> 
> So looks like for leaving legacy mechanism x86 specific we need 4 new
> arch callbacks:
> 
> - arch_ioreq_server_enable
> - arch_ioreq_server_disable
> - arch_ioreq_server_map_pages
> - arch_ioreq_server_unmap_pages

Yes, that looks ok.

  Paul


