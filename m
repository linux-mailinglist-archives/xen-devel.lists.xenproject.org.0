Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 834CEA543DF
	for <lists+xen-devel@lfdr.de>; Thu,  6 Mar 2025 08:44:08 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.903006.1310927 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tq5tA-0003qS-Gu; Thu, 06 Mar 2025 07:43:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 903006.1310927; Thu, 06 Mar 2025 07:43:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tq5tA-0003oF-Dw; Thu, 06 Mar 2025 07:43:28 +0000
Received: by outflank-mailman (input) for mailman id 903006;
 Thu, 06 Mar 2025 07:43:27 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=t507=VZ=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1tq5t8-0003o9-MI
 for xen-devel@lists.xenproject.org; Thu, 06 Mar 2025 07:43:27 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id af17b7a3-fa5e-11ef-9ab4-95dc52dad729;
 Thu, 06 Mar 2025 08:43:24 +0100 (CET)
Received: from support.bugseng.com (support.bugseng.com [162.55.131.47])
 (Authenticated sender: nicola)
 by support.bugseng.com (Postfix) with ESMTPA id 882AD4EF512A;
 Thu,  6 Mar 2025 08:43:23 +0100 (CET)
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
X-Inumbo-ID: af17b7a3-fa5e-11ef-9ab4-95dc52dad729
Authentication-Results: bugseng.com; arc=none smtp.remote-ip=162.55.131.47
ARC-Seal: i=1; d=bugseng.com; s=openarc; a=rsa-sha256; cv=none; t=1741247003;
	b=wB2sFPniLCmpqj70pgfCiIpg0Tjr2Y1Jn+vcfKB0lND18nXx4Rf2ShKUZTIs+kI6rXRZ
	 OnWvjTfJT/o7aeqgrhvNbP+x0y8qGz0ZIlUV6xJN19Pez12bzihl9a5IssT43jeBgi0QK
	 OP6Mr5sCZKbjRaaVG95A69OmRGG04vD6eoojj9yeGknfAVloSTsVfCeQqR4JReYypUF/3
	 rD64B8zpxjQv0NBfaB12QEc8UbRSrk1hr/DHGMDddz+rmC9IsdlLzS95GfbNd8FIbZGpp
	 vxOEOTMgq7xzWOkzSUavVHHRUko/7dhYhIuBUWESYSZr3ewlBVwSQuchWmD9PllGBc1cr
	 YXo+H1U0GNtIVG+mLaUIXxYUQGObewZMXUYT4DPb6ni2mYg+KVi9FwSiW7MTnmCSc2ZkU
	 ENiiR/NFKFmAMykievmiG1Cvwm2pxx1lCkr+a6j+mzBjepENzcXBuKy2QJRlY9Zq9+QC1
	 B9jRmEhQqtOumDcYyvA4hZ8TA33PuuRIZU3fllgZCLCnjPC2SQ8sp/DP36uHcMmCrab00
	 mUDx0/LTM1876bc7D25he8ILSa0y1RuZJV8486ndytnaWzoFngxomVoQItsljS1a6AIcY
	 qoltBlb+PBopCj0xMlKW1OzPJyjJWqCtkaEoz4nYZS7WS95MYoLA7+HqQPYpTu8=
ARC-Message-Signature: i=1; d=bugseng.com; s=openarc; a=rsa-sha256;
	c=relaxed/relaxed; t=1741247003;
	h=DKIM-Signature:MIME-Version:Date:From:To:Cc:Subject:In-Reply-To:
	 References:Message-ID:X-Sender:Organization:Content-Type:
	 Content-Transfer-Encoding;
	bh=CcaqJOPjnFy3yKhiXV1YpeD4tvqdyipHd4a64lZUdIQ=;
	b=Go4eEPm7Q146xjjpWVnptAxLIN4Npv/E4Mio++jvEII7JZDiCpH7bSb+oNBVKOFjlTgB
	 EGDHxzawuf7piJq4ttwG8xxt+ucXhD57OC30Q56bRVKQjfstdu5eiuLOWmQLVAZeE6eI9
	 EmvZwgcFfnUIbfeVNR3Q8SO0WRxpkW3GqkbG30Ns3tiFbmOX0LODmLD30A1lP5aoYCj2A
	 mVgCbFdrTGGBaJyxKvVYSmTCAtqmYrE8pR778qvTug23JbJGoVrJfKXdKlTp4jFQO5OU/
	 EgA7fiUAdMsDI2vY0xGsMSdogtgoWgrf6DIo58cPGOnqc2UyAIsu+4hrDHnfMJOJvG+xl
	 hWvHsbVE9LATzxLCglmACqc2Y13DRKT9/KWraEEr9tkpRfc7LNJA0WB3pgH3P3DUu+5+m
	 fKiYwS23XPudQHjgQweP1FyyyCMknG2+dEi/sImQd4XqUr3Wa9eN+M/ap9r8EkOqLm/Zh
	 6eqHMX3d/fuFSMcrw2k7Sag+6BamQC5TJZQehExe6n41MSdqer5eyM3hvdwxEGRbZ1gms
	 xq5bvPbmyRwKtbCFjTM/NV8qKMJ0L/CKZlR/89vMiaLuNh6uomvzJhEdwslNGgvuwfswm
	 U1/weOqI2Tw6wA2G6LzVsv7rIBCxBSw9SDjaEsypi1htzlJLq2YAmjDTYEmKcTc=
ARC-Authentication-Results: i=1; bugseng.com; arc=none smtp.remote-ip=162.55.131.47
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=bugseng.com; s=mail;
	t=1741247003; bh=QCSgnfWjBJBo3Di9c0lbl17h5seljaYuONGD380g1kg=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=vV0lqLaNcUbf8LByo12pbt+WpTJ/WodJPZ+WxwCoJRO36Qf5HCd0ceJERbbXz6H0j
	 OsX7V5sxbqUERlOg2YPaBKJIu5H09h94g4AcfiCRw8AzesAV5JyRcBrMID8++W4v4J
	 AqdiYi1RhBG2UvrMtwRDx8WRRNRKGI/FHDB8gOAq4zFsINUesoeM53GrcQB06T6Jii
	 ySUuQG3V3jjtqZKsXay6+ZjgauG1cjHo70YkcJjqUm+wgK6teLHFbeqXKOJTD4dZgx
	 P2t3kifWc6OUSsNhgS4TbXXZonMiUPa/SRFidiybLwxAuZ9RQih54O8AojtQZ+lZja
	 WfOPKUvBfutNA==
MIME-Version: 1.0
Date: Thu, 06 Mar 2025 08:43:23 +0100
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: Jan Beulich <jbeulich@suse.com>, michal.orzel@amd.com,
 xenia.ragiadakou@amd.com, ayan.kumar.halder@amd.com, consulting@bugseng.com,
 Dario Faggioli <dfaggioli@suse.com>, Meng Xu <mengxu@cis.upenn.edu>, Juergen
 Gross <jgross@suse.com>, George Dunlap <gwd@xenproject.org>,
 xen-devel@lists.xenproject.org
Subject: Re: [XEN PATCH v2 2/3] xen/rt: address violation of MISRA C Rule 8.2
In-Reply-To: <alpine.DEB.2.22.394.2503051524030.1303386@ubuntu-linux-20-04-desktop>
References: <cover.1740476096.git.nicola.vetrini@bugseng.com>
 <e3c6457e50d61daa05fd9c3a7c71b06d912216a0.1740476096.git.nicola.vetrini@bugseng.com>
 <fc6c0113-484d-4eb5-8b66-0ef547d8dbf1@suse.com>
 <alpine.DEB.2.22.394.2503051524030.1303386@ubuntu-linux-20-04-desktop>
Message-ID: <6c932b6a486e43387d3923f39e2f48c7@bugseng.com>
X-Sender: nicola.vetrini@bugseng.com
Organization: BUGSENG s.r.l.
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit

On 2025-03-06 00:24, Stefano Stabellini wrote:
> On Wed, 5 Mar 2025, Jan Beulich wrote:
>> On 25.02.2025 10:38, Nicola Vetrini wrote:
>> > Rule 8.2 states: "Function types shall be in prototype form with
>> > named parameters".
>> >
>> > The parameter name is missing from the function pointer type
>> > that constitutes the first parameter.
>> >
>> > No functional change.
>> >
>> > Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
>> > Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
>> > Reviewed-by: Juergen Gross <jgross@suse.com>
>> > ---
>> > Changes in v2:
>> > - renamed function parameter name to "elem"
>> > - changed prefix to xen/rt since only that scheduler is touched
>> 
>> Looks like you committed v1 of this, and without a maintainer ack?
> 
> Hi Jan, I took Juergen's comment and his maintainer ack, making the
> change on commit: https://marc.info/?l=xen-devel&m=173978187314898

I think Jan's comment is due to the subject prefix of the commit being 
xen/sched, rather than xen/rt, as I touched only the rt scheduler, but 
that's too late to change.

-- 
Nicola Vetrini, B.Sc.
Software Engineer
BUGSENG (https://bugseng.com)
LinkedIn: https://www.linkedin.com/in/nicola-vetrini-a42471253

