Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 80D5DAC2352
	for <lists+xen-devel@lfdr.de>; Fri, 23 May 2025 15:03:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.995743.1377977 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uIS2z-0003HH-03; Fri, 23 May 2025 13:02:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 995743.1377977; Fri, 23 May 2025 13:02:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uIS2y-0003Ep-SZ; Fri, 23 May 2025 13:02:48 +0000
Received: by outflank-mailman (input) for mailman id 995743;
 Fri, 23 May 2025 13:02:48 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jXdV=YH=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1uIS2x-0003Ej-JB
 for xen-devel@lists.xenproject.org; Fri, 23 May 2025 13:02:47 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3873f40e-37d6-11f0-a2fb-13f23c93f187;
 Fri, 23 May 2025 15:02:46 +0200 (CEST)
Received: from support.bugseng.com (support.bugseng.com [162.55.131.47])
 (Authenticated sender: nicola)
 by support.bugseng.com (Postfix) with ESMTPA id E627F4EE7BD6;
 Fri, 23 May 2025 15:02:44 +0200 (CEST)
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
X-Inumbo-ID: 3873f40e-37d6-11f0-a2fb-13f23c93f187
Authentication-Results: bugseng.com; arc=none smtp.remote-ip=162.55.131.47
ARC-Seal: i=1; d=bugseng.com; s=openarc; a=rsa-sha256; cv=none; t=1748005365;
	b=eeAV/aai1PQnEefO5xKhvClq4hrEVHinntSJsw0Qhbs7FBWk6NiN9y2hVqskMYiCZVxE
	 k8khlKMg4+JXHR006boSkMo1FFvQtn/EBmJmZ+lswOBUUxK3PmMC9lA3+UsJBUQ77UvZM
	 M4LU2JQ/P5O2OVC6nYEzBbxVamIcqWI7SUpnQIEfqpjRB+PNepgCPtZCezA+Sqvf9M2QF
	 464iy9x6CI+uArVlRPgSEoPlhOOauJKgCdlgXge41uxIkuSfMLSIcNufFuOxsS0pCqf84
	 EqQ1f+AAYAjAXiSsuwVB1/+/BXagUoHKMYkoEPwHM6Rqi2fhHsfPkx9To4Yc37ogOAbP7
	 4p5mPnqwrJECt1KcRWmuoMscY9WkNC5WpdpQTZW5RYmZxu/1zCSmrToBuCFTfSmFyvoIv
	 pwFCTKVPV8UTtEnkRt/+0V0xloei5IsZn3yNnk4SJwOz/hccyMX7JPfDG3DFOGo7u5LLW
	 MY0CRULfUh/LyA8pGIohL6qBPsQ1WWxo1OttmxQ6HTaCGVE18CnlwJIB3nX2OhdWgbytC
	 SKxON/O439UA2wg8imicqiT9wm0AGRKZi4hbMX3EV7nQS+fKMyscgYDZOEoAFoHd+ZcNK
	 ramAViRUgAeCexwUlvJpCjL7z6n6hR0buEoTWGCvKzx0tczWAhHErh+7pQ5mmWI=
ARC-Message-Signature: i=1; d=bugseng.com; s=openarc; a=rsa-sha256;
	c=relaxed/relaxed; t=1748005365;
	h=DKIM-Signature:MIME-Version:Date:From:To:Cc:Subject:In-Reply-To:
	 References:Message-ID:X-Sender:Organization:Content-Type:
	 Content-Transfer-Encoding;
	bh=QMhOkikQblqSeiPEaylQHLkswdulAMttTtfH5q+coI0=;
	b=OQ41NEHitoyGTfVE2gsi21589rD954yUfozNKqIG0iSndIyvy21pwWhaZ7Kf1JwYL3Bp
	 2CBoSJcuiAEW1SUz8jVRR/VXSa5mShZEBgr5uNmVru8jgUtm2unIQFAnI/XJF7QEw7XYO
	 g8uYIG3FCjP6vbh6FgRTE4CGh/aPrJBMGxfs1KMbfReMr2TWxmHE1LkBzFkhi4xTZ05mT
	 Rg/kDKzRv3b88lS5bLlR08b+pXftFt8SdDOaLtqs7egFdC6Rn5TEk2TnXGPbfU9aXyGSj
	 9O8DFtClfPvB3bYyENtWS0xXI9EspTrJx3WAKpMwsxaTueqQj85mxYI+Zj6E7DvQADwe7
	 Cnu05aCDEMsRRkazyYIWduFITQM39yAuXoWo/LuZtxMKEf2/Jx/80YcHfqhO6JkLrYNRR
	 up703mm1gr8fVlYedEvHfB2qUaC/ZcleLSgD5df5+mbfVzMX4fY8pmuBct20/ZUuBe7kX
	 8wn+Rh+fxO1tQgrHiOXWH1qwPoP8VTUU/s9d304jC0zbawDzhqmp4KuPEpMdL15b4eHuN
	 AsqLolOgl04DYexAmvc1WeTie4M4MGF8qpryi72mm2qI75w3f/ojacjww24yb8qB40tmz
	 stqSqrAQeGmT0jQiQVylmF0I5e5O71VfzSsT4IrfwyBVhh4Rfut/osF+Ys6M/UI=
ARC-Authentication-Results: i=1; bugseng.com; arc=none smtp.remote-ip=162.55.131.47
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=bugseng.com; s=mail;
	t=1748005365; bh=LKM8JtUvIntWKxk9g+9bwG/Hl0rdwJTNx/O0T6hZcRQ=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=dQ50955XaaAE26x5hbIOfNMzG3KLx/ouerMxFJM4kFseY1HnniMZdswcT26ISJrD8
	 pnZlfxalJKXtG9dq4lY8ZW2haJq38c/pxKdjIR7aJzqiQS/uPTeINaVEQ51R9HcxNw
	 OhQvr3g4Wkx5xLSDOvQX4I8qKcNL9PiedOdHMnmYLyfJ6DkhWU7HWKCvLfJR5+sn7Z
	 lzPb5VP4z8BaW5yUdJPqfgdDJW2AWj8rtA1RLiT0Y1kkw/uaQErq508rzHuuH7U2G0
	 BN4QuVzmy8/7egEPCyOBIMvzda9AYe+9ui8d1pPxzC7bnWro5aMYtBCLeLUa6G95tI
	 1BL1Vxj4Tmeqw==
MIME-Version: 1.0
Date: Fri, 23 May 2025 15:02:44 +0200
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: xen-devel@lists.xenproject.org, sstabellini@kernel.org,
 michal.orzel@amd.com, xenia.ragiadakou@amd.com, ayan.kumar.halder@amd.com,
 consulting@bugseng.com, Doug Goldstein <cardoe@cardoe.com>, Anthony PERARD
 <anthony.perard@vates.tech>, Jan Beulich <jbeulich@suse.com>, Julien Grall
 <julien@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Subject: Re: [XEN PATCH] eclair: allow and document use of GCC extension for
 label addresses
In-Reply-To: <7486eb78-50e8-4959-b494-5bd58e123af4@citrix.com>
References: <d9dbce35d6857f79a21b68e4edd45f0febe3d3c9.1747984747.git.nicola.vetrini@bugseng.com>
 <7486eb78-50e8-4959-b494-5bd58e123af4@citrix.com>
Message-ID: <cd4cf32a207802150b93d3b8b819a024@bugseng.com>
X-Sender: nicola.vetrini@bugseng.com
Organization: BUGSENG s.r.l.
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit

On 2025-05-23 14:57, Andrew Cooper wrote:
> On 23/05/2025 8:20 am, Nicola Vetrini wrote:
>> No functional change.
>> 
>> Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
> 
> Ah, very nice and easy.
> 
> Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>
> 
> Is this dependent on the updated Eclair, or can it go in now?
> 

Hi Andrew,

it's independent on the updated ECLAIR.

Thanks,
  Nicola

-- 
Nicola Vetrini, B.Sc.
Software Engineer
BUGSENG (https://bugseng.com)
LinkedIn: https://www.linkedin.com/in/nicola-vetrini-a42471253

