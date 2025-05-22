Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A260CAC0724
	for <lists+xen-devel@lfdr.de>; Thu, 22 May 2025 10:31:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.993211.1376654 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uI1KM-00025F-Sz; Thu, 22 May 2025 08:30:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 993211.1376654; Thu, 22 May 2025 08:30:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uI1KM-00020L-Pp; Thu, 22 May 2025 08:30:58 +0000
Received: by outflank-mailman (input) for mailman id 993211;
 Thu, 22 May 2025 08:30:57 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=XMjk=YG=linaro.org=jens.wiklander@srs-se1.protection.inumbo.net>)
 id 1uI1KL-0001z8-Fi
 for xen-devel@lists.xenproject.org; Thu, 22 May 2025 08:30:57 +0000
Received: from mail-oo1-xc29.google.com (mail-oo1-xc29.google.com
 [2607:f8b0:4864:20::c29])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 14662097-36e7-11f0-a2fb-13f23c93f187;
 Thu, 22 May 2025 10:30:56 +0200 (CEST)
Received: by mail-oo1-xc29.google.com with SMTP id
 006d021491bc7-6021e3daeabso4097995eaf.3
 for <xen-devel@lists.xenproject.org>; Thu, 22 May 2025 01:30:56 -0700 (PDT)
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
X-Inumbo-ID: 14662097-36e7-11f0-a2fb-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747902655; x=1748507455; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kQT+aGoqV4JMu0Aj/XrzebHqrG3rh4Nwn3I2DCSc7bc=;
        b=Tvb3mxtuLBOUOxacr6pBwuJcfVdMtix4W2aUwVwHDDMdFxGcSLKZNneJyFdFnNpQj1
         z2cIbFPWjYdOHTwaE+nU5wt6CVg6eaTc1Q4WySJjh83kG8iU5cDlDfiUd6XpTOPS4fCw
         +oGkrve+e1p+r2dzKmPGyi19ZTFyhOjVnoO+5S8OXZ+LeYe5M3jznAFVb+l3dAlvTfBa
         K8c9OSAum5baaD47F36zrwl0FFYq9quIIGpR0949/tE42g4Lhsw+yzw27hC5gdNATgnL
         kaThITfORlY3McvjiOPT8fu264JmRXABzng2FNDJXuTJC8cPPz+ypwdEJhI0Jj3czSuZ
         y4eQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747902655; x=1748507455;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kQT+aGoqV4JMu0Aj/XrzebHqrG3rh4Nwn3I2DCSc7bc=;
        b=PDvjndZN9llKgXsxca91XECMeTPX/n3NGJ53G2OOLhRRIWV5UUg8UtMBOzYjXqflvt
         eBMUqYwcp1VQSfcgFzgw4WTIoRGBb0WAcSw5kS4OdfJtDOETLx5OuelKFL+gBuQvQpE/
         ADHRbcUTlY3rDfmBn2Hpv1RIX59XIW8aom/9vdslArY8by0IbkqY+LxYVsacrNUm6bt1
         21Roa2MamJDklk/ujrZDMZLdne7qGzLWgghgNPmTKrKCIf5U8MHj1B0KpTDUeTS//clK
         xOAjXXW7q7CmRIUoeHs2gD5f8Ize8AZLRzIB54cwqpZ2OHPphprEHNwxBvWKor3FuFys
         eBgA==
X-Gm-Message-State: AOJu0YwU0+NxdoOL9d1pgOfgXOiuZVOPsXayWXHXOv5ATqIRSdTFKuQX
	kOqfHaWlHFfRP/Jd7dERIXs5hmdacMnOKUJ3or6eLSxkO+rth/mNUGQIiCIQ5DYScSInLoqYxu1
	55Jm15nxI5yRQOhWNMZvtfINloJ3OFMYzJMILSQEE/A==
X-Gm-Gg: ASbGncsvAfRmbBJl90m/1geZjQmoV840J/ds7VPIwOFgoiRQVsH978wAno/EZKz97t0
	iZfUJPo3v5yRsIf2GxiZxdh0i03lWKqY74s/uiJg0uOE1n32zqVBub/Uif8AlotZLEy6f8k9kSY
	XN81CDAXARZXHMhLfObcr33dXJbw+CtTt0Cg==
X-Google-Smtp-Source: AGHT+IE+JfJcr807f7Q6D/jccBPesa+UehwQHAq2MJXIU+j2Cv4gNjLI2dGs2j8zUpcnUl7ZuxUg2623FGtN8R5oY4s=
X-Received: by 2002:a05:6820:4a90:b0:60a:383:dbce with SMTP id
 006d021491bc7-60a0383dd43mr9035249eaf.8.1747902654919; Thu, 22 May 2025
 01:30:54 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1744787720.git.bertrand.marquis@arm.com>
 <ec7213548581c176a2328d051aee77bbd8a6d45a.1744787720.git.bertrand.marquis@arm.com>
 <CAHUa44H5K+=eX_OhPMTCsNAeBb-XWMNout0UeLvSyJzYrnXRcg@mail.gmail.com> <D2791D4F-C357-43D3-A5ED-6719E5650F02@arm.com>
In-Reply-To: <D2791D4F-C357-43D3-A5ED-6719E5650F02@arm.com>
From: Jens Wiklander <jens.wiklander@linaro.org>
Date: Thu, 22 May 2025 10:30:43 +0200
X-Gm-Features: AX0GCFtfV2LAEVAGSPwHXgrNK0HisKb4sWpbAP7F5ZCdoAU-XQA-TQG66VLfszU
Message-ID: <CAHUa44Gu2axg0UhXXt8U-W5kh=GejYJvCmcFOL0oiOa=iYKkfg@mail.gmail.com>
Subject: Re: [PATCH v5 6/6] xen/arm: ffa: Enable VM to VM without firmware
To: Bertrand Marquis <Bertrand.Marquis@arm.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, 
	Volodymyr Babchuk <volodymyr_babchuk@epam.com>, Stefano Stabellini <sstabellini@kernel.org>, 
	Julien Grall <julien@xen.org>, Michal Orzel <michal.orzel@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Thu, May 22, 2025 at 10:18=E2=80=AFAM Bertrand Marquis
<Bertrand.Marquis@arm.com> wrote:
>
> Hi Jens,
>
> > On 22 May 2025, at 10:00, Jens Wiklander <jens.wiklander@linaro.org> wr=
ote:
> >
> > Hi Bertrand,
> >
> > On Wed, Apr 16, 2025 at 9:40=E2=80=AFAM Bertrand Marquis
> > <bertrand.marquis@arm.com> wrote:
> >>
> >> When VM to VM support is activated and there is no suitable FF-A suppo=
rt
> >> in the firmware, enable FF-A support for VMs to allow using it for VM =
to
> >> VM communications.
> >> If there is OP-TEE running in the secure world and using the non FF-A
> >> communication system, having CONFIG_FFA_VM_TO_VM could be non function=
al
> >> (if optee is probed first) or OP-TEE could be non functional (if FF-A =
is
> >> probed first) so it is not recommended to activate the configuration
> >> option for such systems.
> >>
> >> To make buffer full notification work between VMs when there is no
> >> firmware, rework the notification handling and modify the global flag =
to
> >> only be used as check for firmware notification support instead.
> >>
> >> Signed-off-by: Bertrand Marquis <bertrand.marquis@arm.com>
> >> ---
> >> Changes in v5:
> >> - init ctx list when there is no firmware
> >> - rework init a bit to prevent duplicates
> >> - Remove Jens R-b due to changes done
> >> Changes in v4:
> >> - Fix Optee to OP-TEE in commit message
> >> - Add Jens R-b
> >> Changes in v3:
> >> - fix typos in commit message
> >> - add spaces around <<
> >> - move notification id fix back into buffer full patch
> >> - fix | position in if
> >> Changes in v2:
> >> - replace ifdef with IS_ENABLED when possible
> >> ---
> >> xen/arch/arm/tee/ffa.c       |  24 ++++++--
> >> xen/arch/arm/tee/ffa_notif.c | 104 ++++++++++++++++-------------------
> >> 2 files changed, 67 insertions(+), 61 deletions(-)
> >>
> >> diff --git a/xen/arch/arm/tee/ffa.c b/xen/arch/arm/tee/ffa.c
> >> index c1c4c0957091..b86c88cefa8c 100644
> >> --- a/xen/arch/arm/tee/ffa.c
> >> +++ b/xen/arch/arm/tee/ffa.c
> >> @@ -342,8 +342,9 @@ static int ffa_domain_init(struct domain *d)
> >>     struct ffa_ctx *ctx;
> >>     int ret;
> >>
> >> -    if ( !ffa_fw_version )
> >> +    if ( !IS_ENABLED(CONFIG_FFA_VM_TO_VM) && !ffa_fw_version )
> >>         return -ENODEV;
> >> +
> >>     /*
> >>      * We are using the domain_id + 1 as the FF-A ID for VMs as FF-A I=
D 0 is
> >>      * reserved for the hypervisor and we only support secure endpoint=
s using
> >> @@ -579,11 +580,8 @@ static bool ffa_probe(void)
> >>         goto err_rxtx_destroy;
> >>
> >>     ffa_notif_init();
> >> -    INIT_LIST_HEAD(&ffa_teardown_head);
> >> -    INIT_LIST_HEAD(&ffa_ctx_head);
> >> -    init_timer(&ffa_teardown_timer, ffa_teardown_timer_callback, NULL=
, 0);
> >>
> >> -    return true;
> >> +    goto exit;
> >>
> >> err_rxtx_destroy:
> >>     ffa_rxtx_destroy();
> >> @@ -592,6 +590,22 @@ err_no_fw:
> >>     bitmap_zero(ffa_fw_abi_supported, FFA_ABI_BITMAP_SIZE);
> >>     printk(XENLOG_WARNING "ARM FF-A No firmware support\n");
> >>
> >> +exit:
> >> +    if ( IS_ENABLED(CONFIG_FFA_VM_TO_VM) || ffa_fw_version )
> >> +    {
> >> +        INIT_LIST_HEAD(&ffa_teardown_head);
> >> +        INIT_LIST_HEAD(&ffa_ctx_head);
> >> +        init_timer(&ffa_teardown_timer, ffa_teardown_timer_callback, =
NULL, 0);
> >> +    }
> >> +
> >> +    if ( IS_ENABLED(CONFIG_FFA_VM_TO_VM) )
> >> +    {
> >> +        printk(XENLOG_INFO "ARM FF-A only available between VMs\n");
> >
> > This should only be printed if ffa_fw_version =3D=3D 0
>
> Right i will fix but ...
>
> >
> >> +        return true;
> >> +    }
> >> +    else if ( ffa_fw_version )
> >
> > The else isn't needed.
>
> the else is needed so that we return true and not false.

I meant the "else" isn't needed, the "if" is still needed, as you explain.

>
> We have 3 cases:
> - firmware is there: return true
> - firmware not there but vm to vm enable: return true
> - otherwise: return false
>
> I will modify it like this to make it clearer:
> diff --git a/xen/arch/arm/tee/ffa.c b/xen/arch/arm/tee/ffa.c
> index 57b648a22840..768b4e9ec968 100644
> --- a/xen/arch/arm/tee/ffa.c
> +++ b/xen/arch/arm/tee/ffa.c
> @@ -601,13 +601,13 @@ exit:
>          init_timer(&ffa_teardown_timer, ffa_teardown_timer_callback, NUL=
L, 0);
>      }
>
> -    if ( IS_ENABLED(CONFIG_FFA_VM_TO_VM) )
> +    if ( ffa_fw_version )
> +        return true;
> +    else if ( IS_ENABLED(CONFIG_FFA_VM_TO_VM) )
>      {
>          printk(XENLOG_INFO "ARM FF-A only available between VMs\n");
>          return true;
>      }
> -    else if ( ffa_fw_version )
> -        return true;
>
>      return false;
>  }
>
> Tell me if you agree.

Yes, this is an improvement. A return at the end of an if block makes
the eventual following "else" redundant. I suppose there are coding
styles where it's still preferred. I'm not sure if that applies in
Xen, though.

Cheers,
Jens

>
> Cheers
> Bertrand
>

