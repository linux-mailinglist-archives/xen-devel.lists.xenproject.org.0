Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CA2E3BF045
	for <lists+xen-devel@lfdr.de>; Wed,  7 Jul 2021 21:30:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.152683.282061 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m1DFF-0007Aw-Hw; Wed, 07 Jul 2021 19:30:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 152683.282061; Wed, 07 Jul 2021 19:30:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m1DFF-00077A-Dy; Wed, 07 Jul 2021 19:30:05 +0000
Received: by outflank-mailman (input) for mailman id 152683;
 Wed, 07 Jul 2021 19:30:04 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=CPPN=L7=gmail.com=rosbrookn@srs-us1.protection.inumbo.net>)
 id 1m1DFE-0006wK-6U
 for xen-devel@lists.xenproject.org; Wed, 07 Jul 2021 19:30:04 +0000
Received: from mail-qt1-x82d.google.com (unknown [2607:f8b0:4864:20::82d])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 1f8a3c8c-e5c1-4f4e-bee4-0e4e5e230a2c;
 Wed, 07 Jul 2021 19:30:03 +0000 (UTC)
Received: by mail-qt1-x82d.google.com with SMTP id d1so2921225qto.4
 for <xen-devel@lists.xenproject.org>; Wed, 07 Jul 2021 12:30:03 -0700 (PDT)
Received: from FED-nrosbr-BE.crux.rad.ainfosec.com
 (209-217-208-226.northland.net. [209.217.208.226])
 by smtp.gmail.com with ESMTPSA id x14sm5309510qkm.64.2021.07.07.12.30.01
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 07 Jul 2021 12:30:02 -0700 (PDT)
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
X-Inumbo-ID: 1f8a3c8c-e5c1-4f4e-bee4-0e4e5e230a2c
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=X/zO85YjvOrB7woXveint/YGYqlecHwG0pUi1LLySbw=;
        b=LRwsg7UjMKEOFGZ1wxkP2mbtz2Xid4zr68SQGOYiFJOGesveDNU881EuqdXkaQlKd4
         SDTYggjVe8ut6lkBNw1ab7WJ69c+sfuEbmLl7vPVaBPzHc6MuhyzfSUkmgiTI6Hg5kuB
         yoc7n+aC2/NijWsMyf1Nz1tzJRYB2RGRhK3rEobK0q2a1MdCux3l0ptpSEYnFs5yJ30G
         QUJulDCr1MQ+T/ZwBxdU3MSnDNp/J2tvQ/prYoCiYsh655pNj60W3wiY5iirNk0qCiMC
         p3tDUo4CSCMahJjFNHia54bPpjuVbCWE+0ZYk4dyUWCWKJF/E5MQlLqe3l5poiuq7vVE
         +41A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=X/zO85YjvOrB7woXveint/YGYqlecHwG0pUi1LLySbw=;
        b=mOehaq4r/+NOK2J+qZPopoY6qNJksQW6Ln6azr4x9E1vPVK8OX0Sb46M7Pg46IteX5
         SjE18GVB6irL2uZINMGP+uUoXUQzpkWeqkPYyFcjZ6JzrmX1ZflVvco8W/lBqMywOlCw
         4UgAVrZwWQlz8rT9rNDD34VWz9xEelxI2QD6zVjClVOQ1ZHRpk9HmZnjF1/WvpWT2FvV
         qjgb1RDuRWsPx35O/XgJ1ei47nLssPQg8pE2WMcHP6qh+ZTqZGVQzlo0jPp08J35eOh8
         0XUigdmQE1dCwhtwMERIk/Qa44QyDM+0sET9jRuoPxRaZH987Tdq9AdWTIcChlXBDcSi
         Sc3Q==
X-Gm-Message-State: AOAM532fNCQhT3EC5+kP+TbOdaoNrY4sJA5DkAOopW95kP2WtIB078Mh
	4PpkQUmdh+wtmCJ1YYIOiyc=
X-Google-Smtp-Source: ABdhPJwssPXanCWHpIwA6NtdL6nKYk+/VW75N1Ine48YNrCRjgtvIY7/NHhDqAoztG/d68iNQt5KDw==
X-Received: by 2002:a05:622a:290:: with SMTP id z16mr18154094qtw.29.1625686203236;
        Wed, 07 Jul 2021 12:30:03 -0700 (PDT)
Date: Wed, 7 Jul 2021 15:29:59 -0400
From: Nick Rosbrook <rosbrookn@gmail.com>
To: George Dunlap <George.Dunlap@citrix.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>,
	Nick Rosbrook <rosbrookn@ainfosec.com>,
	Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>
Subject: Re: [RESEND PATCH 03/12] golang/xenlight: fix string conversion in
 generated toC functions
Message-ID: <YOYAtx54IDRWT7O0@FED-nrosbr-BE.crux.rad.ainfosec.com>
References: <cover.1621887506.git.rosbrookn@ainfosec.com>
 <06763aceff41167d3d3bbd603f729572c1f55c77.1621887506.git.rosbrookn@ainfosec.com>
 <6BAF6F60-EC63-41AC-A46E-2045E746C7E1@citrix.com>
 <YNC6LzVHXCcNfg+E@FED-nrosbr-BE.crux.rad.ainfosec.com>
 <22BCDDFA-0EDB-466D-B644-54A956C0D84C@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <22BCDDFA-0EDB-466D-B644-54A956C0D84C@citrix.com>

On Thu, Jul 01, 2021 at 02:09:47PM +0000, George Dunlap wrote:
> 
> 
> > On Jun 21, 2021, at 5:11 PM, Nick Rosbrook <rosbrookn@gmail.com> wrote:
> > 
> > On Fri, Jun 18, 2021 at 11:00:26AM +0000, George Dunlap wrote:
> >> 
> >> 
> >>> On May 24, 2021, at 9:36 PM, Nick Rosbrook <rosbrookn@gmail.com> wrote:
> >>> 
> >>> In gengotypes.py, the toC functions only set C string fields when
> >>> the Go strings are non-empty. However, to prevent segfaults in some
> >>> cases, these fields should always at least be set to nil so that the C
> >>> memory is zeroed out.
> >>> 
> >>> Update gengotypes.py so that the generated code always sets these fields
> >>> to nil first, and then proceeds to check if the Go string is non-empty.
> >>> And, commit the new generated code.
> >>> 
> >>> Signed-off-by: Nick Rosbrook <rosbrookn@ainfosec.com>
> >> 
> >> So wait — if you do
> >> 
> >> var foo C.typename
> >> 
> >> Then golang won’t automatically zero out `foo`?
> >> 
> >> That seems like a bug really; but assuming this fixes real behavior you’ve encountered:
> > 
> > I would have to dig in again to figure out exactly what Go/cgo is doing
> > here, and whether or not this is a bug. But, the behavior I observed was
> > that without these nil assignments, I would sometimes get segfaults in
> > libxl_string_copy. This patch ensures that libxl__str_dup is not called
> > in the empty string case, thus avoiding the segfault.
> 
> I skimmed through the CGo page again when I was looking at this, and didn’t see anything specified about what happens if something is passed to a C function before being used by golang.  If you get a chance, I think it would be good to try to file a ticket with the golang project, pointing out the observed behavior, and asking them to either:
> 
> 1. Document that the golang compiler may not initialize a structure before passing it in to a C function
> 
> 2. Document that it *will* initialize values to zero, and fix the bug.
> 
Sorry for the late reply. But that's a good idea, I can try and come up
with a reproducible example and open an issue.

Thanks,
NR

