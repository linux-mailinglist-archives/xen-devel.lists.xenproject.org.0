Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B6315B5BAD
	for <lists+xen-devel@lfdr.de>; Mon, 12 Sep 2022 15:55:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.405821.648255 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oXjtf-0004IN-Ii; Mon, 12 Sep 2022 13:54:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 405821.648255; Mon, 12 Sep 2022 13:54:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oXjtf-0004G9-G5; Mon, 12 Sep 2022 13:54:47 +0000
Received: by outflank-mailman (input) for mailman id 405821;
 Mon, 12 Sep 2022 13:54:45 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=nJqN=ZP=minervasys.tech=carlo.nonato@srs-se1.protection.inumbo.net>)
 id 1oXjtd-0004G3-FS
 for xen-devel@lists.xenproject.org; Mon, 12 Sep 2022 13:54:45 +0000
Received: from mail-qt1-x834.google.com (mail-qt1-x834.google.com
 [2607:f8b0:4864:20::834])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7453953d-32a2-11ed-9760-273f2230c3a0;
 Mon, 12 Sep 2022 15:54:44 +0200 (CEST)
Received: by mail-qt1-x834.google.com with SMTP id cb8so6214015qtb.0
 for <xen-devel@lists.xenproject.org>; Mon, 12 Sep 2022 06:54:44 -0700 (PDT)
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
X-Inumbo-ID: 7453953d-32a2-11ed-9760-273f2230c3a0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=minervasys-tech.20210112.gappssmtp.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=1TfDPzeWKoR38ig0PtJOl+hpfHqUaMAu2cCjgQ7L6uk=;
        b=wHJhPaJ9XAaizcdwTeQTnsOjl9z+FlLNuYlgj1UUtUcdMZrYSgBTd4qzn8gAt6zWjX
         EbJUy7zStO0RfI9PaXYvlOpF+kYRsynCGi9x+8hA468fLPCCy4lbaaodWf9aVegZQibm
         TDZXy0Li8lY8HZQM/PXodLdcelZ89Z38hf3SIb9oxL9xObpX0x2pBfUTKdrzpCeyT3gc
         Zgj7PqlvhxEqmqLLkHt7cXRpMDXjCM4RPQmsHm/eoMibEnwiizw9pU3CclcaX+C8IsN3
         nKEF88PparwtMK7QNhVhM7cdyK80JbXnscbd6zCDABMVuQsW+KIHpvj/Uz44B/AsPGed
         5ooQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=1TfDPzeWKoR38ig0PtJOl+hpfHqUaMAu2cCjgQ7L6uk=;
        b=rSEH9Pzudn5g+A1vi4qqT9l/BSKNqPhkbzJkBbdqz+QtCBlS9gIiOuazKgwsTOWAav
         Qoi0F0xzubWm0d+KSsx01oPzF0B09696+m0kWipGyU5nJp+O7zFQU+Gh/psmB69csvEd
         PxHC00e0Yp1ABQb+OLdSaWDZOz3VO17y+tRfmYPYNGHqq7xyu7nY4klycOYIqfVC5SOK
         PMGESR1LG5jZmvTutzPnAQJ+NDfgDTtDw6mK90adRcWvxGieBntLdO9LaYoAWWXyrPIn
         olz2dAlqBZCP87TYSD1FMMKMKSHY6Stx1b+bTdygcxQoZPhuc3IMeDMzNHA0dS9HJdu+
         +8hQ==
X-Gm-Message-State: ACgBeo07+6nfp0x54gpzG16MSc6l+cYs+IjO1Lj2qX/UbTB2DjzgLQvd
	aoMBUFqpILsCZKO9skV+qOVikxsIm/gaW83nzBIqruU+6vo6NQ==
X-Google-Smtp-Source: AA6agR7Vm57a313IFHC04iCVaSL8FfVcBWTO7OslfPrjK+qMkV+7KzaQHqbmhyn4ZLO0fJF4Fkh0vYol81IBk5KMH90=
X-Received: by 2002:ac8:57ce:0:b0:344:ad3e:cb16 with SMTP id
 w14-20020ac857ce000000b00344ad3ecb16mr23347234qta.214.1662990883199; Mon, 12
 Sep 2022 06:54:43 -0700 (PDT)
MIME-Version: 1.0
References: <20220826125111.152261-1-carlo.nonato@minervasys.tech>
 <20220826125111.152261-9-carlo.nonato@minervasys.tech> <a073d250-ade5-8048-e638-025dcf90ba96@xen.org>
In-Reply-To: <a073d250-ade5-8048-e638-025dcf90ba96@xen.org>
From: Carlo Nonato <carlo.nonato@minervasys.tech>
Date: Mon, 12 Sep 2022 15:54:32 +0200
Message-ID: <CAG+AhRUn6ntUDc1tNqKsGjAn1mNH=hhU1tn6tTLKxF_q5tZNdQ@mail.gmail.com>
Subject: Re: [PATCH 08/12] Revert "xen/arm: setup: Add Xen as boot module
 before printing all boot modules"
To: Julien Grall <julien@xen.org>
Cc: xen-devel@lists.xenproject.org, andrew.cooper3@citrix.com, 
	george.dunlap@citrix.com, jbeulich@suse.com, stefano.stabellini@amd.com, 
	wl@xen.org, marco.solieri@unimore.it, andrea.bastoni@minervasys.tech, 
	lucmiccio@gmail.com, Marco Solieri <marco.solieri@minervasys.tech>
Content-Type: text/plain; charset="UTF-8"

Hi Julien,

On Sat, Sep 10, 2022 at 4:01 PM Julien Grall <julien@xen.org> wrote:
>
> Hi,
>
> On 26/08/2022 13:51, Carlo Nonato wrote:
> > From: Luca Miccio <lucmiccio@gmail.com>
> >
> > This reverts commit 48fb2a9deba11ee48dde21c5c1aa93b4d4e1043b.
> >
> > The cache coloring support has the command line parsing as a prerequisite
> > because of the color configurations passed in this way. Also, the Xen boot
> > module will be placed at an address that depends on the coloring
> > initialization. This commit moves the Xen boot module after the coloring
> > initialization to allow the order of operations previously described to
> > take place.
>
> The commit you revert was created in order to print the position of Xen
> on the console. So while I understand your aim, you are (temporarily?)
> not printing Xen address anymore.

Yes. The address will be printed by the get_xen_paddr() function in later
patches, but only when coloring is enabled.
So I probably need to find a way to print it regardless of the configuration.
Do you have any suggestions? Is it ok to add the print to this very patch
explaining why I added that (since it would edit the clean revert)?

>
> Therefore your commit message, should contain some words explaining why
> this is fine and how this problem will be addressed.
>
> Cheers,
>
> --
> Julien Grall

