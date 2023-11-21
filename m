Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EF277F2349
	for <lists+xen-devel@lfdr.de>; Tue, 21 Nov 2023 02:45:49 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.637479.993297 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r5FpZ-0006F3-7D; Tue, 21 Nov 2023 01:45:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 637479.993297; Tue, 21 Nov 2023 01:45:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r5FpZ-0006DK-41; Tue, 21 Nov 2023 01:45:37 +0000
Received: by outflank-mailman (input) for mailman id 637479;
 Tue, 21 Nov 2023 01:45:35 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=GQYN=HC=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1r5FpX-0006BD-Pr
 for xen-devel@lists.xenproject.org; Tue, 21 Nov 2023 01:45:35 +0000
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a810d161-880f-11ee-9b0e-b553b5be7939;
 Tue, 21 Nov 2023 02:45:34 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id DA60CCE13CA;
 Tue, 21 Nov 2023 01:45:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9F131C433C7;
 Tue, 21 Nov 2023 01:45:28 +0000 (UTC)
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
X-Inumbo-ID: a810d161-880f-11ee-9b0e-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1700531130;
	bh=/KzoCEs8D5qEoss0E3LSwt+/32lHJT7kV70/L/cMnZY=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=pKIcB9RgClVxhhcpMovGdUassibXgFIYphorAKR9k+N/HmwOlaUE8t6h1tdwyBl1v
	 BHs34RaZFPrcVlinNbWkvgQIj/hiXScF93GAD0BcBq//Bb7lY+coTPQ4zdHVJ+8nz6
	 yBwOYzRkfNajQDWb2HPj7JLeoGA05Efv1zlF6kbcmh0WH046jw4PN3GmuHDh414a9z
	 SD1WnyD8BZsE19DZYdsTntclhPdzZMUL4jquPa/pQLatNyAozKosdYK+vK25maH4KR
	 tcgKm/mjv/NKFNm0gEat93W8XIdq54O+zIoa5mhcaR6xDvvHKiJYkTa/9z5DAO0Lsz
	 R1PNgFL85Pq+A==
Date: Mon, 20 Nov 2023 17:45:27 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Andrew Cooper <andrew.cooper3@citrix.com>
cc: Xen-devel <xen-devel@lists.xenproject.org>, 
    Jan Beulich <JBeulich@suse.com>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
    Wei Liu <wl@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, 
    Julien Grall <julien@xen.org>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, 
    Bertrand Marquis <bertrand.marquis@arm.com>, 
    Michal Orzel <michal.orzel@amd.com>, 
    Roberto Bagnara <roberto.bagnara@bugseng.com>, 
    Nicola Vetrini <nicola.vetrini@bugseng.com>
Subject: Re: [PATCH 0/6] xen: Enable -Wwrite-strings
In-Reply-To: <8f52b3d7-1a4c-4e9e-80ef-63f148c4392e@citrix.com>
Message-ID: <alpine.DEB.2.22.394.2311201744371.773207@ubuntu-linux-20-04-desktop>
References: <20231120224912.1421916-1-andrew.cooper3@citrix.com> <8f52b3d7-1a4c-4e9e-80ef-63f148c4392e@citrix.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-1996054475-1700531130=:773207"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-1996054475-1700531130=:773207
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT

On Mon, 20 Nov 2023, Andrew Cooper wrote:

> On 20/11/2023 10:49 pm, Andrew Cooper wrote:
> > I got carried away and fixed all remaining -Wwrite-strings issues I could
> > reproduce in local builds.
> >
> > Pipeline in Gitlab:
> >
> >   https://gitlab.com/xen-project/people/andyhhp/xen/-/pipelines/1079379918
> 
> Randconfig found:
> 
> https://gitlab.com/xen-project/people/andyhhp/xen/-/jobs/5580160813
> 
> which looks to be the ACPI support.
> 
> diff --git a/xen/arch/arm/acpi/domain_build.c
> b/xen/arch/arm/acpi/domain_build.c
> index ed824c017882..b58389ce9e9f 100644
> --- a/xen/arch/arm/acpi/domain_build.c
> +++ b/xen/arch/arm/acpi/domain_build.c
> @@ -245,7 +245,7 @@ static int __init acpi_create_rsdp(struct domain *d,
> struct membank tbl_add[])
>  
>  static void __init acpi_xsdt_modify_entry(u64 entry[],
>                                            unsigned long entry_count,
> -                                          char *signature, u64 addr)
> +                                          const char *signature, u64 addr)
>  {
>      int i;
>      struct acpi_table_header *table;
> 
> 
> should fix it, and it probably wants to merge into patch 5.


Acked-by: Stefano Stabellini <sstabellini@kernel.org>
--8323329-1996054475-1700531130=:773207--

