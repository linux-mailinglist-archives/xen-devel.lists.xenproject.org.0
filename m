Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 11ED1997990
	for <lists+xen-devel@lfdr.de>; Thu, 10 Oct 2024 02:19:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.815288.1228996 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sygsm-0000sP-Nh; Thu, 10 Oct 2024 00:18:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 815288.1228996; Thu, 10 Oct 2024 00:18:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sygsm-0000qj-L1; Thu, 10 Oct 2024 00:18:20 +0000
Received: by outflank-mailman (input) for mailman id 815288;
 Thu, 10 Oct 2024 00:18:18 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=7jWX=RG=gmail.com=christopher.w.clark@srs-se1.protection.inumbo.net>)
 id 1sygsk-0000qK-QM
 for xen-devel@lists.xenproject.org; Thu, 10 Oct 2024 00:18:18 +0000
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com
 [2a00:1450:4864:20::133])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 255c83cb-869d-11ef-99a2-01e77a169b0f;
 Thu, 10 Oct 2024 02:18:16 +0200 (CEST)
Received: by mail-lf1-x133.google.com with SMTP id
 2adb3069b0e04-53959a88668so352552e87.2
 for <xen-devel@lists.xenproject.org>; Wed, 09 Oct 2024 17:18:16 -0700 (PDT)
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
X-Inumbo-ID: 255c83cb-869d-11ef-99a2-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728519496; x=1729124296; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=L1811Kbn77xL0wMEOCKfnuB9mBO/276WQPGSrtUSYL0=;
        b=TEoOKvifiNPdibdyYn+nT6prSbGSy3Y3uNpDcGxYeIzD47XyNmKD2lIPEh5v/uk6Qd
         xkQbMJ3bQYrrfo3JAlPndieJyP/310RB7PEv5V8IN1Rdj7eCgbtHMIXExBVEg9dsz3Pp
         /CcOPoiz95sRQrzlEBTZNpy5TjY0mSeHvz8z2pqBqXroFN388nNlfe6YKUUGfiHWQejt
         PZBzeeAMa9s2/xDz3/3LCUQyx/ZnwB4RRyzAjEjESaSVQzFnWrUsjJAWGwOolB+fHevf
         x5jbmPZmd7wpk//BDuVcbyhaq2ZlFFA03Nn9+30IHrDcdag9AmycaVKoT/bcwdB4qJie
         z2TA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728519496; x=1729124296;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=L1811Kbn77xL0wMEOCKfnuB9mBO/276WQPGSrtUSYL0=;
        b=U/KVUEn6TCaLct2LrjWpCafcgj7ffV5PGluWghhfHDtBZH1fiMN6tgrCFAGiSfTOe2
         OZoOAc+IpSRq61BFlFna4vHgNA2twF1F+ufObw7LWC/iWwC5Pb7SSLtCcCII3ibJ22M5
         4h1eTNPG2FbrCAUaFAzsJ47hg+nzfK4AGs1JTadkiCIX+A+PlCLdr06E/l0IwYNYE1gs
         cUQ9nOAlzm6/JMjfCw5socGNmWVtx2vhborG3pixKFccf2RoIp6oDRN7z1sbMBPa9Cea
         4i9AAg426oTwryHqbmEJuicFq3sPHMSRuoqPcDe3cM7pUBXcRq+LEcd3YF783Nf1zexk
         nzDg==
X-Gm-Message-State: AOJu0YxslAQaJT2nvEyb98e48uYPky2RI320Lt805n9Q577GeDHzfIks
	Fgt1cI12+39Gdc6KDqSQMv8jApsMiQK+kLTrhRuFXAyryEcIP4dxmbs0J3RO6WZtfeG7PqTzKTJ
	gvlLSEZOucFQzIwAqkzDugc4cBsqwAA==
X-Google-Smtp-Source: AGHT+IEfFgtTzHwLAUorL4yKPIcXGHitXSBxS7K1Jinzdg8yPdwUtHDVjUZYfQc7q+JOLFfT0NXh9PA2lkTh5ZfyNRk=
X-Received: by 2002:a05:6512:2211:b0:52f:2ea:499f with SMTP id
 2adb3069b0e04-539c489a455mr2891299e87.24.1728519495925; Wed, 09 Oct 2024
 17:18:15 -0700 (PDT)
MIME-Version: 1.0
References: <20241004081713.749031-1-frediano.ziglio@cloud.com> <20241004081713.749031-5-frediano.ziglio@cloud.com>
In-Reply-To: <20241004081713.749031-5-frediano.ziglio@cloud.com>
From: Christopher Clark <christopher.w.clark@gmail.com>
Date: Thu, 10 Oct 2024 01:18:04 +0100
Message-ID: <CACMJ4GY3USqMM3Ha9M45GCRLxk8usSX4kcpuD_s4-h6SroJX-A@mail.gmail.com>
Subject: Re: [PATCH v3 04/19] xen: Update header guards - ARGO
To: Frediano Ziglio <frediano.ziglio@cloud.com>
Cc: xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 4, 2024 at 9:17=E2=80=AFAM Frediano Ziglio
<frediano.ziglio@cloud.com> wrote:
>
> Updated headers related to ARGO.
>
> Signed-off-by: Frediano Ziglio <frediano.ziglio@cloud.com>

Acked-by: Christopher Clark <christopher.w.clark@gmail.com>

> ---
>  xen/include/xen/argo.h | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> ---
> Changes since v2:
> - exclude missing public headers.
>
> diff --git a/xen/include/xen/argo.h b/xen/include/xen/argo.h
> index fd4cfdd55c..3ef62dab19 100644
> --- a/xen/include/xen/argo.h
> +++ b/xen/include/xen/argo.h
> @@ -12,8 +12,8 @@
>   * along with this program; If not, see <http://www.gnu.org/licenses/>.
>   */
>
> -#ifndef __XEN_ARGO_H__
> -#define __XEN_ARGO_H__
> +#ifndef XEN__ARGO_H
> +#define XEN__ARGO_H
>
>  #include <xen/sched.h>
>
> --
> 2.34.1
>

