Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 412FB76571A
	for <lists+xen-devel@lfdr.de>; Thu, 27 Jul 2023 17:13:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.571178.894415 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qP2g3-0001Ri-0g; Thu, 27 Jul 2023 15:13:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 571178.894415; Thu, 27 Jul 2023 15:13:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qP2g2-0001PS-U4; Thu, 27 Jul 2023 15:13:18 +0000
Received: by outflank-mailman (input) for mailman id 571178;
 Thu, 27 Jul 2023 15:13:17 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=o85N=DN=citrix.com=prvs=5659ebe79=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1qP2g1-0001PH-Gn
 for xen-devel@lists.xenproject.org; Thu, 27 Jul 2023 15:13:17 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1b19a6d9-2c90-11ee-8613-37d641c3527e;
 Thu, 27 Jul 2023 17:13:15 +0200 (CEST)
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
X-Inumbo-ID: 1b19a6d9-2c90-11ee-8613-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1690470795;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=c3cHlorBvItoJwyOnP1VkXqTWaBZGBM+0SxfLv2i4m8=;
  b=Y10r6IGhkSfAD4yVm4Vp30EZZx5vTn3DslP6UjuixQHMm/nvHx24eDwI
   BxvoH/qvMJ70Alsk3P6RjE3b91btsue4SbakdKZIeZ2/6s/OANmkp3dX+
   2+ifY/JWnUXsdyhWOTWk021VfS1Sx4y7D0GcKFF83E1k4IkzhaDnEMmdy
   k=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 4.0
X-MesageID: 116356293
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.123
X-Policy: $RELAYED
IronPort-Data: A9a23:2WvXxKxJz9bK3nnTuQ96t+cYxirEfRIJ4+MujC+fZmUNrF6WrkUDn
 TZODGrTbPrcajf2c4p3Oo7k9ElTvMfRyoIwG1M4pCAxQypGp/SeCIXCJC8cHc8wwu7rFxs7s
 ppEOrEsCOhuExcwcz/0auCJQUFUjP3OHfykTrafYEidfCc8IA85kxVvhuUltYBhhNm9Emult
 Mj75sbSIzdJ4RYtWo4vw/zF8EoHUMja4mtC5QRhP68T5jcyqlFOZH4hDfDpR5fHatE88t6SH
 47r0Ly/92XFyBYhYvvNfmHTKxBirhb6ZGBiu1IOM0SQqkEqSh8ai87XAME0e0ZP4whlqvgqo
 Dl7WT5cfi9yVkHEsLx1vxC1iEiSN4UekFPMCSDXXcB+UyQq2pYjqhljJBheAGEWxgp4KXpF9
 tMHFBcGVDCai8+XwaiAE8UrhMt2eaEHPKtH0p1h5TTQDPJgSpHfWaTao9Rf2V/chOgXQ6yYP
 ZBAL2MyMlKZOUYn1lQ/UfrSmM+hgGX/dDtJ7kqYv6Mt70DYzRBr0airO93QEjCPbZwMwB3F+
 DiXpAwVBDkdKPnYwzWn6k6cxdfGmQLnVr9VLJC3o6sCbFq7mTVIVUx+uUGAifuwjEKkSs9cA
 0MR8ysq66M18SSDXtT7GhG1vnOAlhodQMZLVf037hmXzajZ6BrfAXILJhZebPQ2uclwQiYlv
 neLld70AT1ksJWOVGmQsLyTqFuaMDAYN2YYaQcYTAEO5J/op4Rbs/7UZo89Sujv1ISzQGyuh
 WnQ90DSmon/k+YQ3KaU4mzgiAiMv5Tkbw8v3Vz7GWCqu1YRiJGeW2C41bTKxa8efd7CHwLR5
 CRsd9u2t75XU8zU/MCZaKBURezyua7YWNHJqQQ3d6TN4QhB7JJKkWp4xDhlbHlkPc8fEdMCS
 B+C4FgBjHO/0ZbDUEOWX25SI55wpUQYPY65Ps04l/IXCnSLSCeJ/Tt1eWmb1H33nU4nnMkXY
 MnKKZ39UyxFWP8/k1JaotvxN5dxmEjSIkuKG/jGI+mPi+LCNBZ5t59bWLdxUgzJxPzd+1iEm
 zquH8CL1w9eQIXDjtr/qOYuwaQxBSFjX/je8pUHHtNv1yI6QAnN/deNm+J+E2Gk9owJ/tr1E
 oaVBh4DkAWn2SKvxMfjQikLVY4DlK1X9RoTVRHA937ys5T/Se5DNJsiSqY=
IronPort-HdrOrdr: A9a23:cif+ZKOAkUhtacBcTvijsMiBIKoaSvp037BL7TEJdfUxSKalfq
 +V7ZEmPHPP+VQssTQb6LO90cq7IE80l6QFhbX5VI3KNGLbUSmTTL2KhrGSpAEIdReOkNK1Fp
 0NT0G9MrDN5JRB4voSKTPXL+od
X-Talos-CUID: 9a23:3kwe32DnJV1Gkzf6EzJs92ELJucuSF3EwFrxIlWDUEouSrLAHA==
X-Talos-MUID: 9a23:f9yWowiaHrZoADlKjv5pysMpM9tNpK6hKlgxodY+ss2lKSJNfA+wg2Hi
X-IronPort-AV: E=Sophos;i="6.01,235,1684814400"; 
   d="scan'208";a="116356293"
Date: Thu, 27 Jul 2023 16:13:04 +0100
From: Anthony PERARD <anthony.perard@citrix.com>
To: Jason Andryuk <jandryuk@gmail.com>
CC: <xen-devel@lists.xenproject.org>, Wei Liu <wl@xen.org>, Jan Beulich
	<jbeulich@suse.com>
Subject: Re: [PATCH v7 08/15] xenpm: Change get-cpufreq-para output for hwp
Message-ID: <bcc13d17-dbf3-41a6-b161-7fcfd5b1a885@perard>
References: <20230726170945.34961-1-jandryuk@gmail.com>
 <20230726170945.34961-9-jandryuk@gmail.com>
 <30360e09-5ae9-4232-a8fe-5b9f9deccf97@perard>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <30360e09-5ae9-4232-a8fe-5b9f9deccf97@perard>

On Thu, Jul 27, 2023 at 12:00:54PM +0100, Anthony PERARD wrote:
> On Wed, Jul 26, 2023 at 01:09:38PM -0400, Jason Andryuk wrote:
> > diff --git a/tools/misc/xenpm.c b/tools/misc/xenpm.c
> > index 1c474c3b59..21c93386de 100644
> > --- a/tools/misc/xenpm.c
> > +++ b/tools/misc/xenpm.c
> > @@ -711,6 +711,7 @@ void start_gather_func(int argc, char *argv[])
> >  /* print out parameters about cpu frequency */
> >  static void print_cpufreq_para(int cpuid, struct xc_get_cpufreq_para *p_cpufreq)
> >  {
> > +    bool hwp = strcmp(p_cpufreq->scaling_driver, XEN_HWP_DRIVER_NAME) == 0;
> >      int i;
> >  
> >      printf("cpu id               : %d\n", cpuid);
> > @@ -720,49 +721,57 @@ static void print_cpufreq_para(int cpuid, struct xc_get_cpufreq_para *p_cpufreq)
> >      printf("scaling_driver       : %s\n", p_cpufreq->scaling_driver);
> >  
> > +    if ( !hwp )
> 
> This test kind of feels wrong. Should we test instead the thing we want
> to print? Maybe declaring another bool, something like "bool
> scaling_governor = !hwp" just below the declaration of "bool hwp"?
> Otherwise, if there's another technology that comes along that isn't
> "hwp" and not something that can be printed with this, there's going to
> be some kind of hidden bug (even if probably easy to spot during
> development).

We agreed in patch 11 that this test would be temporary, and changed in
patch 11, so:

Acked-by: Anthony PERARD <anthony.perard@citrix.com>

Thanks,

-- 
Anthony PERARD

