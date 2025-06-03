Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6477EACCCE8
	for <lists+xen-devel@lfdr.de>; Tue,  3 Jun 2025 20:27:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1004781.1384491 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uMWM7-0003ZX-TJ; Tue, 03 Jun 2025 18:27:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1004781.1384491; Tue, 03 Jun 2025 18:27:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uMWM7-0003Xf-QI; Tue, 03 Jun 2025 18:27:23 +0000
Received: by outflank-mailman (input) for mailman id 1004781;
 Tue, 03 Jun 2025 18:27:22 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=D1uS=YS=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1uMWM6-0003XZ-NU
 for xen-devel@lists.xenproject.org; Tue, 03 Jun 2025 18:27:22 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 62e13eab-40a8-11f0-a300-13f23c93f187;
 Tue, 03 Jun 2025 20:27:21 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id D20F55C5A02;
 Tue,  3 Jun 2025 18:25:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 78D16C4CEED;
 Tue,  3 Jun 2025 18:27:18 +0000 (UTC)
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
X-Inumbo-ID: 62e13eab-40a8-11f0-a300-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748975239;
	bh=J/f+C6keB5M9wVg8IlVxoP0FHVf4r7gWEDaECsO3aLc=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=uZWhyuF3yxWyvDFJukMX8xkPK99nx5Ueb9jQyj26eSpmohQNYR5Y9AU7Nm9Ha1L42
	 B03Jh2Dv4T4WPk9sYrVNin6jgQw6HKVhKHCudXfdP+RxYDRSl0JidNdI4dxYyySIOI
	 AzSv4UQqrmA44KZqiggpTjC9JtffryInSR/JOmwH3Xjx5unAzZ8vtVbQ6TQMZy0Zl3
	 5cfiSLnzjSzXInhMQGbruK2eETtVTCVsXXb9eGT3+dPHsqwpsLMAjKBZ3kRAR4rYcS
	 CrqTQh/TCxm9qFP5759efP2X1f6SJZidUggJ5fMvyicWymt44jyEZBoYMFeCN330nY
	 9MsRRj2YjfLXQ==
Date: Tue, 3 Jun 2025 11:27:18 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Andrew Cooper <andrew.cooper3@citrix.com>
cc: Anthony PERARD <anthony@xenproject.org>, xen-devel@lists.xenproject.org, 
    =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>, 
    Anthony PERARD <anthony.perard@vates.tech>, 
    Doug Goldstein <cardoe@cardoe.com>, 
    Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [XEN PATCH 7/9] CI: Use CDATA avoid the need to escape tests
 outputs
In-Reply-To: <1800c6aa-b3de-418b-967f-d7e7de932fe4@citrix.com>
Message-ID: <alpine.DEB.2.22.394.2506031127080.1147082@ubuntu-linux-20-04-desktop>
References: <20250603124222.52057-1-anthony@xenproject.org> <20250603124222.52057-8-anthony@xenproject.org> <1800c6aa-b3de-418b-967f-d7e7de932fe4@citrix.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Tue, 3 Jun 2025, Andrew Cooper wrote:
> On 03/06/2025 1:42 pm, Anthony PERARD wrote:
> > diff --git a/automation/scripts/run-tools-tests b/automation/scripts/run-tools-tests
> > index 695ed77e46..852c1cfbcf 100755
> > --- a/automation/scripts/run-tools-tests
> > +++ b/automation/scripts/run-tools-tests
> > @@ -25,9 +25,9 @@ for f in "$1"/*; do
> >          echo "FAILED: $f"
> >          failed+=" $f"
> >          printf '   <failure type="failure" message="binary %s exited with code %d">\n' "$f" "$ret" >> "$xml_out"
> > -        # TODO: could use xml escaping... but current tests seems to
> > -        # produce sane output
> > +        printf '<![CDATA[' >> "$xml_out"
> >          cat /tmp/out >> "$xml_out"
> > +        printf ']]>' >> "$xml_out"
> 
> I think you want a \n on this printf.
> 
> I'd also suggest leaving a TODO for "escape ]]> if necessary".
> 
> Otherwise, Reviewed-by: Andrew Cooper <andrew.cooper3@citrix.com>

Acked-by: Stefano Stabellini <sstabellini@kernel.org>

