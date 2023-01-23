Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E70E8677E1F
	for <lists+xen-devel@lfdr.de>; Mon, 23 Jan 2023 15:33:09 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.482933.748746 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pJxsY-0001Qa-PU; Mon, 23 Jan 2023 14:32:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 482933.748746; Mon, 23 Jan 2023 14:32:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pJxsY-0001NU-Lp; Mon, 23 Jan 2023 14:32:58 +0000
Received: by outflank-mailman (input) for mailman id 482933;
 Mon, 23 Jan 2023 14:32:56 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ngzL=5U=tibco.com=sdyasli@srs-se1.protection.inumbo.net>)
 id 1pJxsW-0000nx-F3
 for xen-devel@lists.xenproject.org; Mon, 23 Jan 2023 14:32:56 +0000
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com
 [2a00:1450:4864:20::533])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d2aea49c-9b2a-11ed-b8d1-410ff93cb8f0;
 Mon, 23 Jan 2023 15:32:54 +0100 (CET)
Received: by mail-ed1-x533.google.com with SMTP id v30so14779997edb.9
 for <xen-devel@lists.xenproject.org>; Mon, 23 Jan 2023 06:32:54 -0800 (PST)
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
X-Inumbo-ID: d2aea49c-9b2a-11ed-b8d1-410ff93cb8f0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=N8AsWlAsbBlhe+Tp8QN35vlVyqqOmej6saY8HnP7Ycc=;
        b=Fl+kIQPC7okkNUKLErNzRHbBlWpdWBlEacal2SfvBO60x+N7l0zghSwO9h/6vzfXz7
         sllTGVlg07JBapJxeBiBNP8XKMCTw6Wj9nHx05myn5wcnNQo1Ku67zvXbOUTcfB7yRth
         ts5+Gv/sGUiuf13A/lQEkzvAzoyEGZJbYCR8I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=N8AsWlAsbBlhe+Tp8QN35vlVyqqOmej6saY8HnP7Ycc=;
        b=0ZceL+kMqKfj69SHw3phNXyNBCXCmOLOP3SjET2WxYazak0rov+M+ZOBzwA+dyc93M
         s71JrvD6ewFK1eGQp5pXvWgKpSY5VsM7tCxz/jnifdhnfTyQ261+jvjJAoCzPcQ/zaun
         6URVH3zis6io46IhjrzV45kMmyel7z91BuxjmQbAAIPjSLiKkMGqT2sctapRTKgQvXRh
         nzdKMbQBbFyeDgSeVe3PHYlJwXjBzQ7HS/Ipvvugtrkhr0xPXqy5GVDf/4MyUwzQITsD
         fWiIGbhzWceSdYeBONGonuceUksUrb8QoUWsVv79PWpjb9QGiG6dezlVvn6Fwh695aiI
         ohgQ==
X-Gm-Message-State: AFqh2krZbASej63swK8m+7UrGnUbbsfTx7VOpwBcO51xi4odWDSm65DR
	vVKTpCljoUHyAV3IhglUNouDqAqxQiE8qLusM+bOlg==
X-Google-Smtp-Source: AMrXdXsMeNnHU39VmQyOxKwMDbxooKY3JURUsaHmTDKqJ+UtAhk2sMYjrRjGT5jfwI1Q7syIzZ8ar5Bbr1g3sp34dhQ=
X-Received: by 2002:a05:6402:f15:b0:49e:f062:99f1 with SMTP id
 i21-20020a0564020f1500b0049ef06299f1mr1318823eda.146.1674484374038; Mon, 23
 Jan 2023 06:32:54 -0800 (PST)
MIME-Version: 1.0
References: <20230111142329.4379-1-sergey.dyasli@citrix.com> <a728fa61-eb33-f348-ca72-caec45154889@suse.com>
In-Reply-To: <a728fa61-eb33-f348-ca72-caec45154889@suse.com>
From: Sergey Dyasli <sergey.dyasli@cloud.com>
Date: Mon, 23 Jan 2023 14:32:43 +0000
Message-ID: <CAPRVcudS_LR4_dXPrLZ5KspHqvrp0vPxSD_8RkogLes+ZZ-NDw@mail.gmail.com>
Subject: Re: [PATCH v2] x86/ucode/AMD: apply the patch early on every logical thread
To: Jan Beulich <jbeulich@suse.com>
Cc: Sergey Dyasli <sergey.dyasli@citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, 
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, Wei Liu <wl@xen.org>, 
	xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="UTF-8"

On Mon, Jan 16, 2023 at 2:47 PM Jan Beulich <jbeulich@suse.com> wrote:
>
> On 11.01.2023 15:23, Sergey Dyasli wrote:
> > --- a/xen/arch/x86/cpu/microcode/amd.c
> > +++ b/xen/arch/x86/cpu/microcode/amd.c
> > @@ -176,8 +176,13 @@ static enum microcode_match_result compare_revisions(
> >      if ( new_rev > old_rev )
> >          return NEW_UCODE;
> >
> > -    if ( opt_ucode_allow_same && new_rev == old_rev )
> > -        return NEW_UCODE;
> > +    if ( new_rev == old_rev )
> > +    {
> > +        if ( opt_ucode_allow_same )
> > +            return NEW_UCODE;
> > +        else
> > +            return SAME_UCODE;
> > +    }
>
> I find this misleading: "same" should not depend on the command line
> option.

The alternative diff I was considering is this:

--- a/xen/arch/x86/cpu/microcode/amd.c
+++ b/xen/arch/x86/cpu/microcode/amd.c
@@ -179,6 +179,9 @@ static enum microcode_match_result compare_revisions(
     if ( opt_ucode_allow_same && new_rev == old_rev )
         return NEW_UCODE;

+    if ( new_rev == old_rev )
+        return SAME_UCODE;
+
     return OLD_UCODE;
 }

Do you think the logic is clearer this way? Or should I simply remove
"else" from the first diff above?

> In fact the command line option should affect only the cases
> where ucode is actually to be loaded; it should not affect cases where
> the check is done merely to know whether the cache needs updating.
>
> With that e.g. microcode_update_helper() should then also be adjusted:
> It shouldn't say merely "newer" when "allow-same" is in effect.

I haven't tried late-loading an older ucode blob to see this
inconsistency, but you should be right. I'll test and adjust the
message.

Sergey

