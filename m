Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C48987BA287
	for <lists+xen-devel@lfdr.de>; Thu,  5 Oct 2023 17:40:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.613047.953306 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qoQSO-0002jE-42; Thu, 05 Oct 2023 15:40:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 613047.953306; Thu, 05 Oct 2023 15:40:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qoQSO-0002g2-14; Thu, 05 Oct 2023 15:40:08 +0000
Received: by outflank-mailman (input) for mailman id 613047;
 Thu, 05 Oct 2023 15:40:06 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=X9r3=FT=gmail.com=k.kahurani@srs-se1.protection.inumbo.net>)
 id 1qoQSM-0002fw-SD
 for xen-devel@lists.xenproject.org; Thu, 05 Oct 2023 15:40:06 +0000
Received: from mail-pg1-x52e.google.com (mail-pg1-x52e.google.com
 [2607:f8b0:4864:20::52e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7432db21-6395-11ee-98d3-6d05b1d4d9a1;
 Thu, 05 Oct 2023 17:40:05 +0200 (CEST)
Received: by mail-pg1-x52e.google.com with SMTP id
 41be03b00d2f7-58907163519so765774a12.1
 for <xen-devel@lists.xenproject.org>; Thu, 05 Oct 2023 08:40:05 -0700 (PDT)
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
X-Inumbo-ID: 7432db21-6395-11ee-98d3-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1696520404; x=1697125204; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Yf+AiQkBJuLFlOTFx5Each8LtFYadlmD+9qdSbBgp1k=;
        b=ho/NH+LTI2Om6ssMhFPphh1R+CqXwJZtXGW2lJL19Mn0r22xICmScEkviUS4j5FrWw
         QLF65Hv9qier+zzvqysIjE8926Y796zwS6ZYNW27aNmrwfhtmpg6FcDxBQd6BV+t6kQs
         QGH3K8uH/4UBHfB+SPC7C5lbRCcwSliBYj6FPhUQe9Aj5+s0U3A459B2ZC/N7kAJo4vI
         51DDZrfqdIGDQdULY/6ZKMizHwpKBZrcmx3XB4PxxhW0PC6zFbAtnyCzBKJt5j8WWjDn
         mrri/7rfBJ3pfpfvqj3F9hY/C1CCqvM7X8k/7x5Fvwq/CCFHmuagh5nE7UENPzzJASnP
         Tpug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696520404; x=1697125204;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Yf+AiQkBJuLFlOTFx5Each8LtFYadlmD+9qdSbBgp1k=;
        b=nv0k3KbPpEmEDKouBtSEqfhoPedl8XJNFdjKQBHigbXJPLQgB023zlQYgad8nLcQ7h
         ogS0zOAfJ1wQxkoCj86FoTDK3alcKmPcj9g4xMnEq9bzQ2Cn4epJqug4yPD1+06uS/gW
         JwnvV3TKkDKrtE5UfZBOajr7VN0yetwH1NoNgf3i68D6c/jQCj0gSnjEU+AZdfIS6BK+
         hlwQU796fJAF6sFfDd+YIlQLkEFZS3CxTS4CT5w+K5Zqog+barhGxiBKRpMulqkaRXQ1
         wiDA//8pIMV666Q/k8IvuPOYOMLtxBLrBGgqxP34wx8HP6QM4oD9evFnhvhc5uU2PQ42
         D8ng==
X-Gm-Message-State: AOJu0YzbKAIudB5GHXiWUrv+YviaOty9JYXZ86dhBtCEECMKoL8AMu7U
	t0zpxqmkBDhmqGPdTyHlsaJObL1+jI3zi36QKW0=
X-Google-Smtp-Source: AGHT+IGR23NeeHBp/H0Nd93mf0n6/TrD8pVQM3G+ZeE4+PSLkP5OUBwS4Uk/S9BMUCFUdkV+ExijdXyuGs1Iln6iuDY=
X-Received: by 2002:a17:90a:4926:b0:273:6b28:9e30 with SMTP id
 c35-20020a17090a492600b002736b289e30mr5393867pjh.41.1696520403842; Thu, 05
 Oct 2023 08:40:03 -0700 (PDT)
MIME-Version: 1.0
References: <20230927082918.197030-1-k.kahurani@gmail.com> <20231004114758.44944e5d@kernel.org>
In-Reply-To: <20231004114758.44944e5d@kernel.org>
From: David Kahurani <k.kahurani@gmail.com>
Date: Thu, 5 Oct 2023 18:39:51 +0300
Message-ID: <CAAZOf27_Cy8jaJBnjKV7YgyaKO2WohYrxcftV5BdOdm66g_Apw@mail.gmail.com>
Subject: Re: [PATCH] net/xen-netback: Break build if netback slots > max_skbs
 + 1
To: Jakub Kicinski <kuba@kernel.org>, Juergen Gross <jgross@suse.com>
Cc: xen-devel@lists.xenproject.org, netdev@vger.kernel.org, wei.liu@kernel.org, 
	paul@xen.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

This change was suggested by Juergen and looked okay and straightforward to=
 me.

On Wed, Oct 4, 2023 at 9:48=E2=80=AFPM Jakub Kicinski <kuba@kernel.org> wro=
te:
>
> On Wed, 27 Sep 2023 11:29:18 +0300 David Kahurani wrote:
> > If XEN_NETBK_LEGACY_SLOTS_MAX and MAX_SKB_FRAGS have a difference of
> > more than 1, with MAX_SKB_FRAGS being the lesser value, it opens up a
> > path for null-dereference. It was also noted that some distributions
> > were modifying upstream behaviour in that direction which necessitates
> > this patch.
>
> MAX_SKB_FRAGS can now be set via Kconfig, this allows us to create
> larger super-packets. Can XEN_NETBK_LEGACY_SLOTS_MAX be made relative
> to MAX_SKB_FRAGS, or does the number have to match between guest and
> host?

Historically, netback driver allows for a maximum of 18 fragments.
With recent changes, it also relies on the assumption that the
difference between MAX_SKB_FRAGS and XEN_NETBK_LEGACY_SLOTS_MAX is one
and MAX_SKB_FRAGS is the lesser value.

Now, look at Ubuntu kernel for instance( a change has been made and,
presumably, with good reason so we have reason to assume that the
change will persist in future releases).

/* To allow 64K frame to be packed as single skb without frag_list we
 * require 64K/PAGE_SIZE pages plus 1 additional page to allow for
 * buffers which do not start on a page boundary.
 *
 * Since GRO uses frags we allocate at least 16 regardless of page
 * size.
 */
#if (65536/PAGE_SIZE + 1) < 16
#define MAX_SKB_FRAGS 16UL
#else
#define MAX_SKB_FRAGS (65536/PAGE_SIZE + 1)
#endif

So, MAX_SKB_FRAGS can sometimes be 16. This is exactly what we're
trying to avoid with this patch. I host running with this change is
vulnerable to attack by the guest(though, this will only happen when
PAGE_SIZE > 4096).

Option #2 would be to add a Kconfig dependency for the driver
> to make sure high MAX_SKB_FRAGS is incompatible with it.

netback doesn't support larger super-packets. At least as of now. The
maximum number of fragments in a packet is 18. Any packets with the
number of fragments above that value from the guest are dropped. I
would assume that support for super-packets is probably something that
should be worked on or maybe even is already being worked on. However,
this is not the issue we are trying to fix in this patch.

>
> Breaking the build will make build bots very sad.

This patch build should not break build for upstream. It will only
break for those patching upstream behaviour. My intent is not to break
build bots but to alert someone building that netback doesn't work
with the particular MAX_SKB_FRAGS value. Seeing as they have modified
upstream behaviour, then, they might as well take a look at the issue
and make a decision themselves. Seeing as this issue will hit the
distros before it goes downstream, I don't think it should be a
problem for users.

>
> We'll also need a Fixes tag, I presume this is a fix?

Yeah, I guess that would be needed too.

> --
> pw-bot: cr

