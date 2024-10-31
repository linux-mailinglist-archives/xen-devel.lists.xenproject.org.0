Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3496C9B7CF6
	for <lists+xen-devel@lfdr.de>; Thu, 31 Oct 2024 15:34:23 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.828770.1243791 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t6WFS-0001Aw-NI; Thu, 31 Oct 2024 14:34:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 828770.1243791; Thu, 31 Oct 2024 14:34:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t6WFS-000182-Jh; Thu, 31 Oct 2024 14:34:06 +0000
Received: by outflank-mailman (input) for mailman id 828770;
 Thu, 31 Oct 2024 14:34:05 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=35SK=R3=cloud.com=alejandro.vallejo@srs-se1.protection.inumbo.net>)
 id 1t6WFR-00017s-Nw
 for xen-devel@lists.xenproject.org; Thu, 31 Oct 2024 14:34:05 +0000
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [2a00:1450:4864:20::629])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2be4f7fb-9795-11ef-a0c3-8be0dac302b0;
 Thu, 31 Oct 2024 15:34:01 +0100 (CET)
Received: by mail-ej1-x629.google.com with SMTP id
 a640c23a62f3a-a9a0ec0a94fso138453466b.1
 for <xen-devel@lists.xenproject.org>; Thu, 31 Oct 2024 07:34:01 -0700 (PDT)
Received: from localhost ([217.156.233.154]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a9e566845c1sm74133466b.210.2024.10.31.07.34.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 31 Oct 2024 07:34:00 -0700 (PDT)
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
X-Inumbo-ID: 2be4f7fb-9795-11ef-a0c3-8be0dac302b0
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDA6MTQ1MDo0ODY0OjIwOjo2MjkiLCJoZWxvIjoibWFpbC1lajEteDYyOS5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6IjJiZTRmN2ZiLTk3OTUtMTFlZi1hMGMzLThiZTBkYWMzMDJiMCIsInRzIjoxNzMwMzg1MjQxLjY3MTU1MSwic2VuZGVyIjoiYWxlamFuZHJvLnZhbGxlam9AY2xvdWQuY29tIiwicmVjaXBpZW50IjoieGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnIn0=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1730385241; x=1730990041; darn=lists.xenproject.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=w/C1uCWNQbR525Ldt5XKrfNTId8XnaGIAOWBCVbtFm0=;
        b=g2fXXZoHtjTD8mLI6ijvF23ntFHmIlAr7RfJS8r5NBq2K/wmPSMe+/wFBPhZ6w7JjU
         ICGQ5qYNOhBsBbE5GrS0DhCTsXHuNZVCSe7PjDu2g/mOv1ikGhSlJuLPb2NYN92/h+Fy
         JRHQPa7zF997jWA1ZJHnnlmYaC81DEj2kDanA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730385241; x=1730990041;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=w/C1uCWNQbR525Ldt5XKrfNTId8XnaGIAOWBCVbtFm0=;
        b=iP2yq7lRo5wvHxXmOqtvzzXx4Loj7piW/duBIzO8GGggzXtDtetyKaBTYlLqMg386E
         0sfy380vC46AcZnUFWOkynrPOPp9L41xhwKSRzN0xl2C6nSAoeQNeuWI7uYhk9S+QC3k
         5BpeAeAs2MwKEfCSNuIYcIqKim/CpvlEQ/bhLlMobcc0N0bQoi6uX4rUoRHmoYThnbpc
         fi5J/X1TBXVDxJSEIJqzzrqeTSdWNa+JSlzm5eQncrNIGEkKNZknOXZQbr4+AtHBVsb5
         72w2OfF2N78SrPwJbF9h16VldPRV4GKofzfSaaZC/OGilfy6xY7EDGdlQgXfWuGN/6jG
         u2UA==
X-Forwarded-Encrypted: i=1; AJvYcCXp+Na/nUhv2rMhP4u/+JYOZXNFkN6riotSVH49vNPgkaodpvV1cdN37zRcrGmuJCt7+L/Bx4GP1B4=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwMA6wzPZsHM2NWPgk1RStrA/X3TzDk4Mg3TOY/pVLP69NeOdT/
	op+f2Ki6SamNaGkCZRfx6jiGsPkuj0ss4HR+sW5cTC8n9TG5whjbxpTOqORUvDQ=
X-Google-Smtp-Source: AGHT+IFchsbaSg3ApHMZ9h1X1QoGlPnjxsHQlgT3mGgOprtKpMn6yerGs9o+ivpg3W/tO1pyndkAhQ==
X-Received: by 2002:a17:907:96a9:b0:a9a:a88a:466c with SMTP id a640c23a62f3a-a9de632e59emr1809313966b.61.1730385240895;
        Thu, 31 Oct 2024 07:34:00 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 31 Oct 2024 14:33:58 +0000
Message-Id: <D5A2DGKM2L73.Y7P349LNCAO5@cloud.com>
Cc: "Jan Beulich" <JBeulich@suse.com>, "Stefano Stabellini"
 <sstabellini@kernel.org>, "Julien Grall" <julien@xen.org>
Subject: Re: [PATCH] scripts: Refine git-checkout.sh change for different
 branches
From: "Alejandro Vallejo" <alejandro.vallejo@cloud.com>
To: "Andrew Cooper" <andrew.cooper3@citrix.com>, "Xen-devel"
 <xen-devel@lists.xenproject.org>
X-Mailer: aerc 0.18.2
References: <20241031134702.2913536-1-andrew.cooper3@citrix.com>
 <D5A20JD5PC3G.22TWXL5RY7PQD@cloud.com>
 <dbf733c0-14a4-40cd-8849-29a87b45c64c@citrix.com>
In-Reply-To: <dbf733c0-14a4-40cd-8849-29a87b45c64c@citrix.com>

On Thu Oct 31, 2024 at 2:21 PM GMT, Andrew Cooper wrote:
> On 31/10/2024 2:17 pm, Alejandro Vallejo wrote:
> > On Thu Oct 31, 2024 at 1:47 PM GMT, Andrew Cooper wrote:
> >> The change works for divergent branches, but doesn't work for explicit=
 SHAs.
> >>
> >> Instead of passing `-b $TAG` to clone, explicitly fetch the $TAG we wa=
nt after
> >> cloning.
> >>
> >> Fixes: c554ec124b12 ("scripts: Fix git-checkout.sh to work with branch=
es other than master")
> >> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> >> ---
> >> CC: Jan Beulich <JBeulich@suse.com>
> >> CC: Stefano Stabellini <sstabellini@kernel.org>
> >> CC: Julien Grall <julien@xen.org>
> >>
> >> Speculative fix, pending CI:
> >>   https://gitlab.com/xen-project/people/andyhhp/xen/-/pipelines/152184=
7529
> >> ---
> >>  scripts/git-checkout.sh | 3 ++-
> >>  1 file changed, 2 insertions(+), 1 deletion(-)
> >>
> >> diff --git a/scripts/git-checkout.sh b/scripts/git-checkout.sh
> >> index 3796cbfe39a7..9f8f2bd04fca 100755
> >> --- a/scripts/git-checkout.sh
> >> +++ b/scripts/git-checkout.sh
> >> @@ -14,9 +14,10 @@ set -e
> >>  if test \! -d $DIR-remote; then
> >>  	rm -rf $DIR-remote $DIR-remote.tmp
> >>  	mkdir -p $DIR-remote.tmp; rmdir $DIR-remote.tmp
> >> -	$GIT clone -b $TAG $TREE $DIR-remote.tmp
> >> +	$GIT clone $TREE $DIR-remote.tmp
> > Can this be shallow (--depth 1) clone instead to avoid pulling for whol=
e
> > history in CI? There's probably some ENV variable that  could be recove=
red
> > from.
>
> Maybe, but not here.=C2=A0 One swamp at a time.
>
> More specifically, my first iteration of this fix did use --depth 1, but
> it broke QEMU's submodules.=C2=A0 I'm not debugging that as a prerequisit=
e of
> fixing other CI breakages.
>
> ~Andrew

Fair. From inspection, pending an ok from some pipelines:

  Reviewed-by: Alejandro Vallejo <alejandro.vallejo@cloud.com>

Cheers,
Alejandro

