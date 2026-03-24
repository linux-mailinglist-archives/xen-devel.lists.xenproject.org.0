Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sPoZJ89gwmmecAQAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 24 Mar 2026 11:00:47 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 23DC9306136
	for <lists+xen-devel@lfdr.de>; Tue, 24 Mar 2026 11:00:40 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1260208.1553568 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w4yYk-0008L7-8T; Tue, 24 Mar 2026 10:00:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1260208.1553568; Tue, 24 Mar 2026 10:00:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w4yYk-0008Jj-5e; Tue, 24 Mar 2026 10:00:26 +0000
Received: by outflank-mailman (input) for mailman id 1260208;
 Tue, 24 Mar 2026 10:00:25 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ehxs=BY=gmail.com=xakep.amatop@srs-se1.protection.inumbo.net>)
 id 1w4yYi-0008JZ-T5
 for xen-devel@lists.xenproject.org; Tue, 24 Mar 2026 10:00:25 +0000
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com
 [209.85.208.172]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 454081e2-2768-11f1-9ccf-f158ae23cfc8;
 Tue, 24 Mar 2026 11:00:21 +0100 (CET)
Received: by mail-lj1-f172.google.com with SMTP id
 38308e7fff4ca-38bd3c6c502so25368201fa.1
 for <xen-devel@lists.xenproject.org>; Tue, 24 Mar 2026 03:00:21 -0700 (PDT)
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
X-Inumbo-ID: 454081e2-2768-11f1-9ccf-f158ae23cfc8
ARC-Seal: i=1; a=rsa-sha256; t=1774346421; cv=none;
        d=google.com; s=arc-20240605;
        b=C/wb4elKdp+Ha0KL8O9taextno0BFoRrG9GObsf3ZMYWup95RIsIZrO2P1giRToyiD
         Hn8q2TJyMbvEyRxj4u8WBJGVNCka3f3bHArBhJpK0k8D7P6dbbSEi4hv2mjd9r0jhEPp
         n8UveL15H6SOMkKUhHenMl0XlmXcRQUiZw0YwdbEGrCia6DWH/KlrRQV0LEHYQ8nb06i
         nbcUAFDMxFKlXXjKAkZrSI84FtahcVt0xquedsMDFouyskdO37Y+9oIMI+ACAl/+mmEL
         j9o0RqsrdBONJTm7wGaBfPV5lXjzJh4YkQSe31iNO/5YMZnBOAbXZe7kN9UtLmrmPW7i
         zzwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=ar1bjqW5Lo0tgcZE6DdGTP/006Egrh4tUuj0RN0FzWo=;
        fh=ZqQ1W4s2sAoJbRyzgY8rmX9kckACA2A930LY2DVXlfc=;
        b=i1u7bakG/N3YwpvMf03J+I33gj8mtCd/JsxV/kl1/A/+rnIhUEmvVNe/uG+a9YVVFe
         NvuXzOf7SHLqjFWx5aRw9PniM67qbLkwg03NKPDjG7b7t/9YHgS4HyaYxcUJWS8r0UPx
         W5m/BO1szHEAk+98TqxVhCJoREuTFhOL8rB6V3Q2Nmww9yuYu3xVeeq+9Uyn77e2IxU/
         T7y/3NkWjRgmBfJXeZGPjwiz3G3iWIFhoFxyd89ZRn1G7e463mmMU/D7WKeSv6OjQ49M
         b77zuZ0na/M4eGW+zQw/Pgy9W+yH0EJ4wiT9U+kvp5MaVmK9Z/BFNclfwpq3U+vXdscG
         GnYg==;
        darn=lists.xenproject.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774346421; x=1774951221; darn=lists.xenproject.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ar1bjqW5Lo0tgcZE6DdGTP/006Egrh4tUuj0RN0FzWo=;
        b=kidA2v3nakXHomlUvAwq85ou8keCcpKDlPK1V+zlCexXPR/s5/EiKXJgKVHkxDXOsM
         z/xXS0IHDwQqTtxzLDeNSU17hrVKJ7uxuc3YOUIlLwOvQ8Lw80zNQf9+3rS+uSzrYp1z
         OGUtn3f6tMR7y/kIO3vWUzY+/WYijpTurH9mGGHcDvWiry/F25Tvz7pZvWWFcPtkrTnB
         387+q69HA5UvIvnovzI979Vs2yTIJ/lDeXY/PwVjMybInHOowBreS4H0l2BBLzoxc41L
         1mdSO0YhO94yWhj9laufyrd3f+/43XAF+AtRzuYw/1E0zKq9mVHAA2b4+JRykDtyW1ra
         6XsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774346421; x=1774951221;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ar1bjqW5Lo0tgcZE6DdGTP/006Egrh4tUuj0RN0FzWo=;
        b=UiCt5Vw6t0lzDLjZxlwZerpEcw2mem2iDSU8wMBA7B8B6l61Axu/b36HNzQdev/is/
         JNcSctmOgqkYuOMOV7tzYjXUZVaKpQ9GY+w0H87qdMxY5Xe+Z6ljLBw9G9qgldvJLJV7
         4nkytgSyhAi/12bYYtVDb6S+1AywSfLAjTlvp2xxdHRcc6rBIs03+hKha8W/ticsbOGI
         5nDm9j38yEIwK1FxM5pDydGmvD/Z2CV2gj/HGx+iIVMHCQ1l7SjaLkBUx27F4gBg37mz
         D2aerZ6qpZrQWv6BavfYz5m30kS9XvKJPKrczd9qvirEyZ8ZHU4m3FCaTFpEm1Nly4fd
         ztnQ==
X-Forwarded-Encrypted: i=1; AJvYcCVdR8CHDbxGjA2WHJFwW+NRO3JwM/U5E7mNUgMHo6DLw0Oe2FkZVtWIDWZjjfog0q1j+XUgWy9eA4o=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyUy6F0nkBBUUOvfdZ0Wv9Y+HR+ge5oX+cTueQNvJ8SvtVCJZZx
	lPE6HPvL//TAlV7HobMWTsVNcPRy0umTDt1R4rpKbowM81CBPy1VKhECMBVm2onlB7NICsJLXfY
	FAGm7fKgKKwHR/K0St63y7xQeDJ96viA=
X-Gm-Gg: ATEYQzw5xGImPT26A+0ABpCKoxKEXS367BBZw7Z2ItIOZXSu6UH2kSORmy6s7KrNo7K
	XnLcYsWAfNVfRpJ1C4X6z0BMXPohUXIa0O+ciscHth1kM1+ooODtz1nmlRW8v7Ex5tNieZ7NxcW
	M6CRHHXipTftYnOkCr7SFN7CyJ4JWYkm/Bzq5x6Ml+A4EEGTJGFBZH9/Fi//e97CvDOP79cNMnc
	HBgamLs+zZeAmXC7UDy7JKUVwZHjLdRf26f0mGwwSRORv/kzinYwXsk5IA7JPbM2ohv7jKFpwKh
	cG0YEg==
X-Received: by 2002:a2e:be23:0:b0:383:5390:bc96 with SMTP id
 38308e7fff4ca-38bf9497737mr50967261fa.0.1774346420485; Tue, 24 Mar 2026
 03:00:20 -0700 (PDT)
MIME-Version: 1.0
References: <2004584dbbe393c9de4b3231bf91a24f6e5de5de.1773875416.git.mykola_kvach@epam.com>
 <c37859f7-bac6-4394-ae12-83e054a1743e@suse.com>
In-Reply-To: <c37859f7-bac6-4394-ae12-83e054a1743e@suse.com>
From: Mykola Kvach <xakep.amatop@gmail.com>
Date: Tue, 24 Mar 2026 12:00:00 +0200
X-Gm-Features: AaiRm51g_2nk-mf2Q3XudCZiifG074T4J_3rZ9J6ays6Lex437u85Sfiggq91cs
Message-ID: <CAGeoDV8v3=b46qrmzmBjH8BN7rs3CRcSAkrOCgHGgr=8+PcuEg@mail.gmail.com>
Subject: Re: [PATCH] xen/domain: make shutdown state explicit
To: Jan Beulich <jbeulich@suse.com>
Cc: Mykola Kvach <mykola_kvach@epam.com>, Paul Durrant <paul@xen.org>, 
	Andrew Cooper <andrew.cooper3@citrix.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
	Anthony PERARD <anthony.perard@vates.tech>, Michal Orzel <michal.orzel@amd.com>, 
	Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Tim Deegan <tim@xen.org>, 
	Dario Faggioli <dfaggioli@suse.com>, Juergen Gross <jgross@suse.com>, George Dunlap <gwd@xenproject.org>, 
	xen-devel@lists.xenproject.org
Content-Type: multipart/alternative; boundary="0000000000001a0122064dc2388f"
X-Spamd-Result: default: False [-2.18 / 15.00];
	ARC_ALLOW(-1.00)[google.com:s=arc-20240605:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[multipart/alternative,text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jbeulich@suse.com,m:mykola_kvach@epam.com,m:paul@xen.org,m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:sstabellini@kernel.org,m:tim@xen.org,m:dfaggioli@suse.com,m:jgross@suse.com,m:gwd@xenproject.org,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RSPAMD_URIBL_FAIL(0.00)[epam.com:query timed out];
	FORGED_SENDER(0.00)[xakepamatop@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	TAGGED_FROM(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	FORWARDED(0.00)[mailman];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	RCVD_COUNT_SEVEN(0.00)[7];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[xakepamatop@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,suse.com:email,lists.xenproject.org:helo,lists.xenproject.org:rdns]
X-Rspamd-Queue-Id: 23DC9306136
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

--0000000000001a0122064dc2388f
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Jan,

Thank you for the review.

On Thu, Mar 19, 2026 at 12:32=E2=80=AFPM Jan Beulich <jbeulich@suse.com> wr=
ote:
>
> On 19.03.2026 00:25, Mykola Kvach wrote:
> > From: Mykola Kvach <mykola_kvach@epam.com>
> >
> > The domain shutdown flow currently overloads is_shutting_down and
> > is_shut_down to represent multiple phases of the shutdown lifecycle,
> > while some users treat is_shutting_down as a broader "domain is no
> > longer normal" condition.
> >
> > Make the shutdown lifecycle explicit by introducing
> > enum domain_shutdown_state and converting the existing users to helper
> > predicates describing whether shutdown is in progress, complete, or
> > active.
>
> Mind me asking what the distinction is between "active" and "in progress"=
?
> They feel like synonyms to me. To me "is shutting down" vs "was shut down=
"
> would be the clearer distinction (i.e. domain_shutting_down() and
> domain_shut_down() or some such, albeit for the latter I could also live
> with domain_shutdown_complete() as you have it, or maybe slightly less
> ambiguously domain_shutdown_completed()). Yet then I'm not a native
> speaker.

Yes, the distinction I was trying to make is:

  - in progress: shutdown has been initiated, but not all vCPUs may
    have reached the paused-for-shutdown state yet

  - complete: shutdown has been finalized, i.e. all vCPUs are paused
    and the domain is fully shut down

  - active: a shorthand for "shutdown_state !=3D none", i.e. covering
    both of the above

So "active" was meant as a broader "the domain is already in shutdown
state", rather than as a synonym for "shutdown is currently progressing".

>
> Further, I can't quite derive upon what criteria you chose whether
> ->is_shutting_down checks are to be converted to domain_shutdown_active()
> vs domain_shutdown_in_progress(). This could do with writing down. (It
> also might be easier with the suggested alternative naming.)

Likewise, the conversions from is_shutting_down/is_shut_down were not
meant to be mechanical. The criterion I used was:

  - domain_shutdown_in_progress() where the code cares specifically
    about the transient phase before shutdown is fully finalized

  - domain_shutdown_complete() where the code is specifically about
    the fully shut down state being reported or tested

  - domain_shutdown_active() where the old logic was effectively using
    the combined condition "the domain is already somewhere in the
    shutdown lifecycle"

One detail which likely wasn't obvious from the patch is that the old
flags were not mutually exclusive. Once is_shut_down became true,
is_shutting_down still remains set as well.

Because of that, the conversion was not just about replacing old
is_shutting_down checks. I also had to account for sites using
is_shut_down explicitly, so that the resulting logic would preserve the
old distinctions between the in-progress, complete, and combined cases.

In particular, old !is_shutting_down checks implicitly excluded both
the in-progress and fully shut down states. Those are the places where
I used domain_shutdown_active(). Sites specifically testing the fully
shut down state were converted to domain_shutdown_complete(), while the
ones caring about the transient shutdown phase were converted to
domain_shutdown_in_progress().

vcpu_check_shutdown() is an example of the latter. That path exists to
drive a shutdown already in flight to completion: it may still need to
pause this vCPU, clear defer_shutdown, and then re-check whether
shutdown can now be finalized. Once shutdown is already complete,
there is nothing left for that path to do, so using the broader
combined state there would not be appropriate.

I agree this selection criterion is not obvious enough from the patch
as posted. I'll make that rationale explicit in the commit message.


If you think naming is part of the confusion, I could switch to
something along these lines instead:

  - domain_shutting_down()      for the in-progress state
  - domain_shutdown_completed() for the finalized state
  - domain_in_shutdown_state()  for the union of both

Would that look better to you?

>
> > @@ -1444,9 +1458,17 @@ void domain_resume(struct domain *d)
> >          v->paused_for_shutdown =3D 0;
> >      }
> >
> > +out_unlock:
>
> Nit (style): Labels indented by at least one blank please.

Ack.

Best regards,
Mykola

>
> Jan

--0000000000001a0122064dc2388f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi Jan,<br><br>Thank you for the review.<br><br>On Thu, Ma=
r 19, 2026 at 12:32=E2=80=AFPM Jan Beulich &lt;<a href=3D"mailto:jbeulich@s=
use.com">jbeulich@suse.com</a>&gt; wrote:<br>&gt;<br>&gt; On 19.03.2026 00:=
25, Mykola Kvach wrote:<br>&gt; &gt; From: Mykola Kvach &lt;<a href=3D"mail=
to:mykola_kvach@epam.com">mykola_kvach@epam.com</a>&gt;<br>&gt; &gt;<br>&gt=
; &gt; The domain shutdown flow currently overloads is_shutting_down and<br=
>&gt; &gt; is_shut_down to represent multiple phases of the shutdown lifecy=
cle,<br>&gt; &gt; while some users treat is_shutting_down as a broader &quo=
t;domain is no<br>&gt; &gt; longer normal&quot; condition.<br>&gt; &gt;<br>=
&gt; &gt; Make the shutdown lifecycle explicit by introducing<br>&gt; &gt; =
enum domain_shutdown_state and converting the existing users to helper<br>&=
gt; &gt; predicates describing whether shutdown is in progress, complete, o=
r<br>&gt; &gt; active.<br>&gt;<br>&gt; Mind me asking what the distinction =
is between &quot;active&quot; and &quot;in progress&quot;?<br>&gt; They fee=
l like synonyms to me. To me &quot;is shutting down&quot; vs &quot;was shut=
 down&quot;<br>&gt; would be the clearer distinction (i.e. domain_shutting_=
down() and<br>&gt; domain_shut_down() or some such, albeit for the latter I=
 could also live<br>&gt; with domain_shutdown_complete() as you have it, or=
 maybe slightly less<br>&gt; ambiguously domain_shutdown_completed()). Yet =
then I&#39;m not a native<br>&gt; speaker.<br><br>Yes, the distinction I wa=
s trying to make is:<br><br>=C2=A0 - in progress: shutdown has been initiat=
ed, but not all vCPUs may<br>=C2=A0 =C2=A0 have reached the paused-for-shut=
down state yet<br><br>=C2=A0 - complete: shutdown has been finalized, i.e. =
all vCPUs are paused<br>=C2=A0 =C2=A0 and the domain is fully shut down<br>=
<br>=C2=A0 - active: a shorthand for &quot;shutdown_state !=3D none&quot;, =
i.e. covering<br>=C2=A0 =C2=A0 both of the above<br><br>So &quot;active&quo=
t; was meant as a broader &quot;the domain is already in shutdown<br>state&=
quot;, rather than as a synonym for &quot;shutdown is currently progressing=
&quot;.<br><br>&gt;<br>&gt; Further, I can&#39;t quite derive upon what cri=
teria you chose whether<br>&gt; -&gt;is_shutting_down checks are to be conv=
erted to domain_shutdown_active()<br>&gt; vs domain_shutdown_in_progress().=
 This could do with writing down. (It<br>&gt; also might be easier with the=
 suggested alternative naming.)<br><br>Likewise, the conversions from is_sh=
utting_down/is_shut_down were not<br>meant to be mechanical. The criterion =
I used was:<br><br>=C2=A0 - domain_shutdown_in_progress() where the code ca=
res specifically<br>=C2=A0 =C2=A0 about the transient phase before shutdown=
 is fully finalized<br><br>=C2=A0 - domain_shutdown_complete() where the co=
de is specifically about<br>=C2=A0 =C2=A0 the fully shut down state being r=
eported or tested<br><br>=C2=A0 - domain_shutdown_active() where the old lo=
gic was effectively using<br>=C2=A0 =C2=A0 the combined condition &quot;the=
 domain is already somewhere in the<br>=C2=A0 =C2=A0 shutdown lifecycle&quo=
t;<br><br>One detail which likely wasn&#39;t obvious from the patch is that=
 the old<br>flags were not mutually exclusive. Once is_shut_down became tru=
e,<br>is_shutting_down still remains set as well.<br><br>Because of that, t=
he conversion was not just about replacing old<br>is_shutting_down checks. =
I also had to account for sites using<br>is_shut_down explicitly, so that t=
he resulting logic would preserve the<br>old distinctions between the in-pr=
ogress, complete, and combined cases.<br><br>In particular, old !is_shuttin=
g_down checks implicitly excluded both<br>the in-progress and fully shut do=
wn states. Those are the places where<br>I used domain_shutdown_active(). S=
ites specifically testing the fully<br>shut down state were converted to do=
main_shutdown_complete(), while the<br>ones caring about the transient shut=
down phase were converted to<br>domain_shutdown_in_progress().<br><br>vcpu_=
check_shutdown() is an example of the latter. That path exists to<br>drive =
a shutdown already in flight to completion: it may still need to<br>pause t=
his vCPU, clear defer_shutdown, and then re-check whether<br>shutdown can n=
ow be finalized. Once shutdown is already complete,<br>there is nothing lef=
t for that path to do, so using the broader<br>combined state there would n=
ot be appropriate.<br><br>I agree this selection criterion is not obvious e=
nough from the patch<br>as posted. I&#39;ll make that rationale explicit in=
 the commit message.<br><br><br>If you think naming is part of the confusio=
n, I could switch to<br>something along these lines instead:<br><br>=C2=A0 =
- domain_shutting_down() =C2=A0 =C2=A0 =C2=A0for the in-progress state<br>=
=C2=A0 - domain_shutdown_completed() for the finalized state<br>=C2=A0 - do=
main_in_shutdown_state() =C2=A0for the union of both<br><br>Would that look=
 better to you?<br><br>&gt;<br>&gt; &gt; @@ -1444,9 +1458,17 @@ void domain=
_resume(struct domain *d)<br>&gt; &gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0v-=
&gt;paused_for_shutdown =3D 0;<br>&gt; &gt; =C2=A0 =C2=A0 =C2=A0}<br>&gt; &=
gt;<br>&gt; &gt; +out_unlock:<br>&gt;<br>&gt; Nit (style): Labels indented =
by at least one blank please.<br><br>Ack.<br><br>Best regards,<br>Mykola<br=
><br>&gt;<br>&gt; Jan</div>

--0000000000001a0122064dc2388f--

