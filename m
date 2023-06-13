Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AE91D72E78D
	for <lists+xen-devel@lfdr.de>; Tue, 13 Jun 2023 17:45:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.548234.856069 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q96Bo-0002xN-S4; Tue, 13 Jun 2023 15:44:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 548234.856069; Tue, 13 Jun 2023 15:44:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q96Bo-0002ug-Nx; Tue, 13 Jun 2023 15:44:12 +0000
Received: by outflank-mailman (input) for mailman id 548234;
 Tue, 13 Jun 2023 15:44:12 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Ia/t=CB=citrix.com=prvs=5214cf225=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1q96Bn-0002ua-TG
 for xen-devel@lists.xenproject.org; Tue, 13 Jun 2023 15:44:11 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2289dcab-0a01-11ee-b232-6b7b168915f2;
 Tue, 13 Jun 2023 17:44:10 +0200 (CEST)
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
X-Inumbo-ID: 2289dcab-0a01-11ee-b232-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1686671050;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=MXaIcm9LNLLIre10K1LG1BSQeRPlaAhnUNamcV9olYU=;
  b=FD65DveQKRv3c/Qu8Bp+If9t9co7rznKGgE5SJad0vpUZATUa0apZwJ5
   VU/FC0u7iBn06msYLYw+B5BOcnfg1ohP2Bd8mkiBR7YbkhHM/eb2wox4I
   GYWmH4oqmr89bqNpRuS3LNPLSyM3TaUkRVjJ1OlmenHDukh1fSMq1fJ82
   o=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 4.0
X-MesageID: 115157347
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.123
X-Policy: $RELAYED
IronPort-Data: A9a23:r9LbGKmLNExpkcGPqh2ni2ro5gyoJkRdPkR7XQ2eYbSJt1+Wr1Gzt
 xJKWmvUPqzZZGL1eoonPYq3pEkGvJOByddqHgJvqn1nFSMWpZLJC+rCIxarNUt+DCFhoGFPt
 JxCN4aafKjYaleG+39B55C49SEUOZmgH+a6U6icfHgqH2eIcQ954Tp7gek1n4V0ttawBgKJq
 LvartbWfVSowFaYCEpNg064gE0p5KyaVA8w5ARkPqgV5QSGzRH5MbpETU2PByqgKmVrNrbSq
 9brlNmR4m7f9hExPdKp+p6TnpoiG+O60aCm0xK6aoD66vRwjnVaPpUTbZLwXXx/mTSR9+2d/
 f0W3XCGpaXFCYWX8AgVe0Ew/yiTpsSq8pefSZS0mZT7I0Er7xIAahihZa07FdRwxwp5PY1B3
 eE6EGA0YkCEvMTs8ZOJcKpvnut+HeC+aevzulk4pd3YJfMvQJSFSKTW/95Imjw3g6iiH96HO
 ZBfM2A2Kk2dPVsWYAx/5JEWxY9EglH2dSFYr1SE47I6+WHJwCR60aT3McqTcduPLSlQth/B+
 zuboD+lXXn2MvS+xSepzFKSudaIhH/5SY0pJKGa665D1Qj7Kms7V0RNCArTTeOCoky3Xd5FO
 lEX0iUrpKk2skesS7HVXRe1vXqFtR40QMdLHqsx7wTl4rrZ5UOVC3YJShZFacc6r4kmSDoyz
 FiLktj1Qzt1v9W9Vna15rqS6zSoNkA9JHcPfyYeQSMZ4tPop8c4iRenczp4OPfr1JuvQ2i2m
 m3U6nFk3N3/kPLnyY2m32iXuj78oaPvFD8U1D+UXXqKszJQMdvNi5OT1bTL0RpRBN/HHgff5
 iRcxJT2APMmVs/UynHUKAkZNPTwvqvebmWB6bJ6N8N5nwlB7UJPamy5DNtWAE5yevgJdjbyC
 KM4kVMAvcQDVJdGgEIeXm5QNyjJ5fK6fTgdfqqIBueim7AoHON9wAlgZFSLw0fmm1U2nKc0N
 P+zKJj8UytLVfs8nWbmHo/xNIPHIAhknQs/orihlnyaPUe2PibJGd/pznPTBgzG0E90iFqMq
 IsOXyd74x5eTPf/ckHqHX07dDg3wYwALcmu8aR/L7fTSjeK7Ul9U5c9N5t9Id0690mU/8+Ul
 kyAtrhwkQKv3yebeFvbNxiOqtrHBP5CkJ7yBgR0VX7A5pTpSd/HAHs3H3fvQYQayQ==
IronPort-HdrOrdr: A9a23:0f6mzqPuAxVFw8BcTgWjsMiBIKoaSvp037BK7S1MoH1uA6mlfq
 WV9sjzuiWatN98Yh8dcLO7Scu9qBHnlaKdiLN5VduftWHd01dAR7sSjrcKrQeAJ8X/nNQtr5
 uJccJFeaDN5Y4Rt7eH3OG6eexQv+Vu6MqT9IPjJ+8Gd3ATV0lnhT0JbTqzIwlNayRtI4E2L5
 aY7tovnUvaRZxGBv7LYEXsRoL41qT2qK4=
X-Talos-CUID: 9a23:obe4QW8Lx/xN7pbfqvOVv1M2IpAcfi3a91GKEm6KMyVqUJLIeHbFrQ==
X-Talos-MUID: 9a23:HnvAAAhKfw8zVvSR2EMC88MpFct1z5qONn801oxaudiLDhxsGSrNpWHi
X-IronPort-AV: E=Sophos;i="6.00,240,1681185600"; 
   d="scan'208";a="115157347"
Date: Tue, 13 Jun 2023 16:43:58 +0100
From: Anthony PERARD <anthony.perard@citrix.com>
To: Jason Andryuk <jandryuk@gmail.com>
CC: Jan Beulich <jbeulich@suse.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH 1/5] xen-mfndump: drop dead assignment to "page" from
 lookup_pte_func()
Message-ID: <71f080c4-5e7f-4230-ad18-f1f7fb16c9ef@perard>
References: <2dc50b58-a4e4-3e32-1876-94412b14b052@suse.com>
 <fc7b72ce-2426-4452-bff6-f98b07b5a41c@suse.com>
 <CAKf6xptx4hNCZm6T371VJopUS+4=Fvp2Wd1m+16mAH5B0UHKYA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAKf6xptx4hNCZm6T371VJopUS+4=Fvp2Wd1m+16mAH5B0UHKYA@mail.gmail.com>

On Mon, Jun 12, 2023 at 08:47:41AM -0400, Jason Andryuk wrote:
> On Mon, Jun 12, 2023 at 7:45 AM Jan Beulich <jbeulich@suse.com> wrote:
> >
> > The variable isn't used past the loop, and its value also isn't
> > meaningful across iterations. Reduce its scope to make this more
> > obvious.
> >
> > Coverity ID: 1532310
> > Fixes: ae763e422430 ("tools/misc: introduce xen-mfndump")
> > Signed-off-by: Jan Beulich <jbeulich@suse.com>
> 
> Reviewed-by: Jason Andryuk <jandryuk@gmail.com>

Acked-by: Anthony PERARD <anthony.perard@citrix.com>

Thanks,

-- 
Anthony PERARD

