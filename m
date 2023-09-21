Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CCD47A945D
	for <lists+xen-devel@lfdr.de>; Thu, 21 Sep 2023 14:42:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.606418.944316 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qjJ0L-0003in-SG; Thu, 21 Sep 2023 12:42:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 606418.944316; Thu, 21 Sep 2023 12:42:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qjJ0L-0003fl-P1; Thu, 21 Sep 2023 12:42:01 +0000
Received: by outflank-mailman (input) for mailman id 606418;
 Thu, 21 Sep 2023 12:42:00 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=wlCU=FF=linaro.org=philmd@srs-se1.protection.inumbo.net>)
 id 1qjJ0K-0003ff-Mt
 for xen-devel@lists.xenproject.org; Thu, 21 Sep 2023 12:42:00 +0000
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com
 [2a00:1450:4864:20::529])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 418bc264-587c-11ee-878a-cb3800f73035;
 Thu, 21 Sep 2023 14:41:59 +0200 (CEST)
Received: by mail-ed1-x529.google.com with SMTP id
 4fb4d7f45d1cf-52889bc61b6so1055169a12.0
 for <xen-devel@lists.xenproject.org>; Thu, 21 Sep 2023 05:41:59 -0700 (PDT)
Received: from [172.20.41.70] (static-212-193-78-212.thenetworkfactory.nl.
 [212.78.193.212]) by smtp.gmail.com with ESMTPSA id
 r21-20020aa7c155000000b005227e53cec2sm787038edp.50.2023.09.21.05.41.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 21 Sep 2023 05:41:58 -0700 (PDT)
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
X-Inumbo-ID: 418bc264-587c-11ee-878a-cb3800f73035
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1695300119; x=1695904919; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=hzHv5wRRxnGLl33iiUbNmV1KkzNxk+do0fTlDHKrnPg=;
        b=SFL3+lJK+ZCQAIABa8xyll4sryvbR+vr6fcpR73vO0pUDIn/ecKGzmx4xFapS3aBme
         ibR845UBj4JFLnv+p5o5tDvwf3g4tKPSWer51L1Hd+2yuqHMdSGIwcsiN9aCEMoCPHA1
         tUR1AuyGCChBD405VnZ9gRtTXd4SYeZt5dGXK43dXVmsNMNPMPdtXo9r0nwLYDqhRrsO
         SBpKYtKkNMprb6Dp0dpls9gwL990ONiE+I8D+DoDEvAuuCzSROgyfh2qKa+SSvghupCA
         eFNmUffDO8KsOUnC/GaOokPFcNXO3RKVuDuBi5NhckPqHDdX5h2Nx/O97GtnKysCQ44i
         8wgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695300119; x=1695904919;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hzHv5wRRxnGLl33iiUbNmV1KkzNxk+do0fTlDHKrnPg=;
        b=ZjvYELJcUZu/3LEH4tyzg9GQ/Chh2yQX+MZY68Gzsb9dc299AuzBhxIgxPX5qe1I4H
         DAGChTnmTHZL83KdIypSIC/Cfi2HX6QfyylT1NZBtG3qIug9Sr30F3pxfIzSpKLSKedr
         XHrJXmcAdYem7porKJIyWVQ49DxUOhnF1EpNfyblk1ShplTB2OgfSWAt2SNoj5iXQ+7K
         hbGVkw1WIEY7ru1PY5bjNWS5UyCubby1najnfEHdCluAupSP6gHidJhbtgMH/wetJn0b
         m35U5EPsw258Bh3MrNoPTQMivJnOtfgTO44w8Le1d0E6pgh35w1ab+qAKpUfSZzfluw5
         zCAQ==
X-Gm-Message-State: AOJu0YwXGkaMbN3wdsDQzLcnHnQqemLkF63Fh8di97X/TwcQF5ZF3f0i
	GlIaP1XThRGeBoTYd9mAGc6vjw==
X-Google-Smtp-Source: AGHT+IFq6Gkfx1rvH/W76kLaY8mfGpbiX5vLzomsHrnI36knR+WJY/4ipOIpGsVRwTRwCx55YJKgNw==
X-Received: by 2002:a05:6402:1489:b0:52b:c980:43f3 with SMTP id e9-20020a056402148900b0052bc98043f3mr4352474edv.28.1695300119124;
        Thu, 21 Sep 2023 05:41:59 -0700 (PDT)
Message-ID: <e0d25860-9fdb-cd56-1d2a-b886af2e3297@linaro.org>
Date: Thu, 21 Sep 2023 14:41:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.15.1
Subject: Re: [PATCH v3 7/7] qobject atomics osdep: Make a few macros more
 hygienic
Content-Language: en-US
To: Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org
Cc: kwolf@redhat.com, hreitz@redhat.com, eblake@redhat.com,
 vsementsov@yandex-team.ru, jsnow@redhat.com, idryomov@gmail.com, pl@kamp.de,
 sw@weilnetz.de, sstabellini@kernel.org, anthony.perard@citrix.com,
 paul@xen.org, pbonzini@redhat.com, marcandre.lureau@redhat.com,
 berrange@redhat.com, thuth@redhat.com, stefanha@redhat.com, fam@euphon.net,
 quintela@redhat.com, peterx@redhat.com, leobras@redhat.com,
 kraxel@redhat.com, qemu-block@nongnu.org, xen-devel@lists.xenproject.org,
 alex.bennee@linaro.org, peter.maydell@linaro.org
References: <20230921121312.1301864-1-armbru@redhat.com>
 <20230921121312.1301864-8-armbru@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230921121312.1301864-8-armbru@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 21/9/23 14:13, Markus Armbruster wrote:
> Variables declared in macros can shadow other variables.  Much of the
> time, this is harmless, e.g.:
> 
>      #define _FDT(exp)                                                  \
>          do {                                                           \
>              int ret = (exp);                                           \
>              if (ret < 0) {                                             \
>                  error_report("error creating device tree: %s: %s",   \
>                          #exp, fdt_strerror(ret));                      \
>                  exit(1);                                               \
>              }                                                          \
>          } while (0)
> 
> Harmless shadowing in h_client_architecture_support():
> 
>          target_ulong ret;
> 
>          [...]
> 
>          ret = do_client_architecture_support(cpu, spapr, vec, fdt_bufsize);
>          if (ret == H_SUCCESS) {
>              _FDT((fdt_pack(spapr->fdt_blob)));
>              [...]
>          }
> 
>          return ret;
> 
> However, we can get in trouble when the shadowed variable is used in a
> macro argument:
> 
>      #define QOBJECT(obj) ({                                 \
>          typeof(obj) o = (obj);                              \
>          o ? container_of(&(o)->base, QObject, base) : NULL; \
>       })
> 
> QOBJECT(o) expands into
> 
>      ({
> --->    typeof(o) o = (o);
>          o ? container_of(&(o)->base, QObject, base) : NULL;
>      })
> 
> Unintended variable name capture at --->.  We'd be saved by
> -Winit-self.  But I could certainly construct more elaborate death
> traps that don't trigger it.
> 
> To reduce the risk of trapping ourselves, we use variable names in
> macros that no sane person would use elsewhere.  Here's our actual
> definition of QOBJECT():
> 
>      #define QOBJECT(obj) ({                                         \
>          typeof(obj) _obj = (obj);                                   \
>          _obj ? container_of(&(_obj)->base, QObject, base) : NULL;   \
>      })
> 
> Works well enough until we nest macro calls.  For instance, with
> 
>      #define qobject_ref(obj) ({                     \
>          typeof(obj) _obj = (obj);                   \
>          qobject_ref_impl(QOBJECT(_obj));            \
>          _obj;                                       \
>      })
> 
> the expression qobject_ref(obj) expands into
> 
>      ({
>          typeof(obj) _obj = (obj);
>          qobject_ref_impl(
>              ({
> --->            typeof(_obj) _obj = (_obj);
>                  _obj ? container_of(&(_obj)->base, QObject, base) : NULL;
>              }));
>          _obj;
>      })
> 
> Unintended variable name capture at --->.
> 
> The only reliable way to prevent unintended variable name capture is
> -Wshadow.
> 
> One blocker for enabling it is shadowing hiding in function-like
> macros like
> 
>       qdict_put(dict, "name", qobject_ref(...))
> 
> qdict_put() wraps its last argument in QOBJECT(), and the last
> argument here contains another QOBJECT().
> 
> Use dark preprocessor sorcery to make the macros that give us this
> problem use different variable names on every call.
> 
> Signed-off-by: Markus Armbruster <armbru@redhat.com>
> Reviewed-by: Eric Blake <eblake@redhat.com>
> ---
>   include/qapi/qmp/qobject.h | 10 ++++++++--
>   include/qemu/atomic.h      | 17 ++++++++++++-----
>   include/qemu/compiler.h    |  3 +++
>   include/qemu/osdep.h       | 27 ++++++++++++++++++++-------
>   4 files changed, 43 insertions(+), 14 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


