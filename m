Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FF3648D81C
	for <lists+xen-devel@lfdr.de>; Thu, 13 Jan 2022 13:39:30 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.257189.441866 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n7zNT-0002n1-BZ; Thu, 13 Jan 2022 12:38:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 257189.441866; Thu, 13 Jan 2022 12:38:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n7zNT-0002jz-8R; Thu, 13 Jan 2022 12:38:51 +0000
Received: by outflank-mailman (input) for mailman id 257189;
 Thu, 13 Jan 2022 12:38:49 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=GUHC=R5=citrix.com=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1n7zNR-0002jp-Bj
 for xen-devel@lists.xenproject.org; Thu, 13 Jan 2022 12:38:49 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id bfbdd39a-746d-11ec-bcf3-e9554a921baa;
 Thu, 13 Jan 2022 13:38:47 +0100 (CET)
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
X-Inumbo-ID: bfbdd39a-746d-11ec-bcf3-e9554a921baa
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1642077527;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=2pnkM3yeQQmIXje+ECMwMClIifQOVqcPkmxL7UJRtUo=;
  b=iNBwOwRJBCnMlShb82mLnjBpCZH8WAnNtoDT/TdM1VyMC7Unm64fn9OZ
   2EOVPKp4GMkvEkjyp7VeAR3aPfJkA7upR2e1CBqwkMBxR0j2Q0NXsKx+4
   xsCRz8+Czsg/zUwWYqwQiGpnR7cectAtuGN+5H3aFh7+5LRiG6NoRPObc
   Q=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: im32WwA8wqy95LTe8LxrOVydWg/fOhlJGH0ZDQmpfo2UO03uqfxNWtgulUJdE4h3oY99ecIoW4
 pLys2WJ5ozAWZvQmtlzmmqNz8MgOlsCMq3psJHz/Mi7rDJcF4Lb+dfkud8Mkw0Ct1bXundRcpT
 h8s+rHe9tJw0enU+fclUXQEvF8VaIY9FXNHjPUXdpAKuG8e1ubt7Zf9LrtWA4erH2gcvZTUeS5
 UPPZ2KuoaBVZDsS4nCQxn5vHDB/5sw1MhB9bkLcsyACRpvhJsdLf1KhKTqYaxSFaWRybtMPu3g
 A1N3PmOETwVjUoPKTF7powke
X-SBRS: 5.2
X-MesageID: 61833130
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:v+PBeqzZrCFoEcOPFB56t+fHwSrEfRIJ4+MujC+fZmUNrF6WrkVWz
 GQcDTzSPquNNGTzKtojbom/8B9Svp6AmIUwSAM+riAxQypGp/SeCIXCJC8cHc8zwu4v7q5Dx
 59DAjUVBJlsFhcwnvopW1TYhSEUOZugH9IQM8aZfHAhLeNYYH1500g7wrdi2tQAbeWRWGthh
 /uj+6UzB3f9s9JEGjp8B3Wr8U4HUFza4Vv0j3RmDRx5lAa2e0o9VfrzEZqZPXrgKrS4K8bhL
 wr1IBNVyUuCl/slIovNfr8W6STmSJaKVeSFoiI+t6RPHnGuD8H9u0o2HKN0VKtZt9mGt9Eg7
 otctMOMdUQoG6bDvcMdFBRCUAgraMWq+JefSZS+mcmazkmAeHrw2fR+SkoxOOX0+M4uXzsIr
 6ZBbmlQMFbT3Ipaw5riIgVors0lMMnsOpJZonx6xCvVJf0nXYrCU+PB4towMDIY2JkeRq2HP
 JJxhTxHd0WYOhBkY0orA9EvmteB33X7UBl2twfAzUYwyzeKl1EguFT3C/LKfvSaSMMTmVyXz
 krE8H7+GQoyL8GExHyO9XfEru3BkCP/WY06D6Cj+7hhh1j77mAdARIZVFy/oNGil1WzHdlYL
 iQ86ico6KQ/6kGvZt38RAGj5m6JuAYGXNhdGPF87xuCopc4+C7AWDJCFGQYLoV76olmHlTGy
 2NlgfvoVBoxobzKdU7e95KfohaVOW8YNywrMHpsoRQ+3/Hvp4Q6jxTqR9llEbKogtCdJQwc0
 wxmvwBl2exN0JdjO7GTuAme3mny/sShohsdu12PNl9J+D+Vc2JMi2aAzVHApchNI4+CJrVql
 ChVwpPOhAzi4HzkqcBsfAnvNO34jxpmGGeF6bKKI3XH3279k5JEVdoBiAyS3G8zbq45lcbBO
 Sc/Qz956p5JJ2eNZqRqeY+3AMlC5fG+SY69D6uMMIYeOcIZmOq7EMdGPx74M4fFyhlErE3CE
 c3DLZbE4YgyVMyLMwZat89CiOR2l0jSNEvYRIzhzgTP7FZtTCX9dFvxC3PXNrpRxPrd+G39q
 o8DX+PXlUk3eLCgM0H/rN5CRXhXfCNTLc2n9KRqmhurf1AO9JcJUaGBmNvMuuVNwsxoqws/1
 irsBR8Dlguu3C2vxMfjQikLVY4DlK1X9RoTVRHA937xs5T6SYrwvqoZabUterwrqL5qwfJuF
 qFXcMScGPVfDD/A/m1FP5X6qYVjcjWthB6PYHX5MGRuIcY4Slyb4MLgcyvu6DIKUni9u/whr
 uDyzQjcW5cCGVhvVZ6EdPK1wlqtlnEBg+YuDVDQK9xedRy0oohnIiD8lNEtJMQIJUmRzzeWz
 V/OUxwZufPMs8k+99yQ3fKIqIKgEu1fGEtGHjaEsebqZHeCpmf6mN1OSueFezzZRVjYwqT6a
 LUH1ez4Pd0GgE1O79h2HYF0wP9s/NDovbJbkFhpRS2Zc1SxB7p8CXCaxs0T5LZVz7pUtAbqC
 EKC/t5WZeeANM//SQNDIQMkaqKI1O0OmymU5vMweR2o6Chy9buBcENTIxjT13ANcOoraNsok
 bU7pcobyw2jkR57YN+Jgxdd+3mIMnFdAb4ssYsXAdOzhwcmor2YjUcw1sMiDEmzVuhx
IronPort-HdrOrdr: A9a23:LUCQP6yPvwRAq8lsaWfkKrPwLr1zdoMgy1knxilNoRw8SK2lfu
 SV7ZMmPH7P+VIssR4b9exoVJPufZqYz+8S3WBzB8bGYOCFghrKEGgK1+KLqFeMJ8S9zJ8+6U
 4JSdkGNDSaNzhHZKjBjjWFLw==
X-IronPort-AV: E=Sophos;i="5.88,286,1635220800"; 
   d="scan'208";a="61833130"
Date: Thu, 13 Jan 2022 12:38:41 +0000
From: Anthony PERARD <anthony.perard@citrix.com>
To: Dario Faggioli <dfaggioli@suse.com>
CC: <xen-devel@lists.xenproject.org>, James Fehlig <jfehlig@suse.com>, Wei Liu
	<wl@xen.org>, Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH 2/2] tools/libs/light: don't touch nr_vcpus_out if
 listing vcpus and returning NULL
Message-ID: <YeAdUZB4/51PC176@perard>
References: <164200566223.24755.262723784847161301.stgit@work>
 <164200570276.24755.1849386285622380597.stgit@work>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <164200570276.24755.1849386285622380597.stgit@work>

On Wed, Jan 12, 2022 at 05:41:42PM +0100, Dario Faggioli wrote:
> If we are in libvxl_list_vcpu() and we are returning NULL, let's avoid

extra 'v'         ^ here.

> touching the output parameter *nr_vcpus_out (which should contain the
> number of vcpus in the list). Ideally, the caller initialized it to 0,
> which is therefore consistent with us returning NULL (or, as an alternative,
> we can explicitly set it to 0 if we're returning null... But just not
> touching it seems the best behavior).
> 
> In fact, the current behavior is especially problematic if, for
> instance, a domain is destroyed after we have done some steps of the
> for() loop. In which case, calls like xc_vcpu_getinfo() or
> xc_vcpu_getaffinity() will start to fail, and we return back to the
> caller inconsistent information, such as a NULL list of vcpus, but a
> modified and not 0 any longer, number of vcpus in the list.
> 
> Signed-off-by: Dario Faggioli <dfaggioli@suse.com>
> Tested-by: James Fehlig <jfehlig@suse.com>
> ---
> diff --git a/tools/libs/light/libxl_domain.c b/tools/libs/light/libxl_domain.c
> index 544a9bf59d..aabc264e16 100644
> --- a/tools/libs/light/libxl_domain.c
> +++ b/tools/libs/light/libxl_domain.c
> @@ -1705,6 +1706,7 @@ libxl_vcpuinfo *libxl_list_vcpu(libxl_ctx *ctx, uint32_t domid,
>          ptr->vcpu_time = vcpuinfo.cpu_time;
>      }
>      GC_FREE;
> +    *nr_vcpus_out = nr_vcpus;

Can you swap those two lines, to keep GC_FREE just before return?

>      return ret;
>  
>  err:
> diff --git a/tools/libs/light/libxl_numa.c b/tools/libs/light/libxl_numa.c
> index 3679028c79..b04e3917a0 100644
> --- a/tools/libs/light/libxl_numa.c
> +++ b/tools/libs/light/libxl_numa.c
> @@ -219,8 +219,10 @@ static int nr_vcpus_on_nodes(libxl__gc *gc, libxl_cputopology *tinfo,
>              goto next;
>  
>          vinfo = libxl_list_vcpu(CTX, dinfo[i].domid, &nr_dom_vcpus, &nr_cpus);
> -        if (vinfo == NULL)
> +        if (vinfo == NULL) {
> +            assert(nr_dom_vcpus == 0);

I don't think this assert is necessary.

>              goto next;
> +        }

Otherwise, this patch looks fine.

Thanks,

-- 
Anthony PERARD

