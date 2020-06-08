Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 77C981F1A38
	for <lists+xen-devel@lfdr.de>; Mon,  8 Jun 2020 15:39:17 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jiHyn-0005Z3-UJ; Mon, 08 Jun 2020 13:38:21 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=9p0X=7V=gmail.com=xadimgnik@srs-us1.protection.inumbo.net>)
 id 1jiHym-0005YJ-7I
 for xen-devel@lists.xenproject.org; Mon, 08 Jun 2020 13:38:20 +0000
X-Inumbo-ID: 4f7f35ce-a98d-11ea-9ad7-bc764e2007e4
Received: from mail-wm1-x335.google.com (unknown [2a00:1450:4864:20::335])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 4f7f35ce-a98d-11ea-9ad7-bc764e2007e4;
 Mon, 08 Jun 2020 13:38:18 +0000 (UTC)
Received: by mail-wm1-x335.google.com with SMTP id u13so15393142wml.1
 for <xen-devel@lists.xenproject.org>; Mon, 08 Jun 2020 06:38:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:reply-to:to:cc:references:in-reply-to:subject:date:message-id
 :mime-version:content-transfer-encoding:content-language
 :thread-index; bh=z2FvhJj0rboD2ZNlDgF/UnMTbEK6UqBAOC4li2lmzI4=;
 b=ia/Lz60saGcOssbgF1HoIvrU5vjHprdlt+ZJgRr/GrHhJU9ZEDPO0aos0eelP0nB8w
 735/VfMRDeX1er3eEKXkJtH7LX3ONqRYFgo+rF0QbrBOFTdRfFxsQHG6n9V07Ld/PRJg
 eO7rDqpedOJ2rwDpoDoE8N9tskqZ+T3xE9ojUnFjCSc8rfFVYKoN9HARqH860sNuY0QX
 KoY19YrMGon2PqbeFtBeiP3B8zMz+Z8y7Eqp6UhHELXtzD2OU1DNw75/7YEAMujEKU0S
 vf1cWAnzoaMGgAknK3RrCN9dkEBOM6/99vIdB02LjDq2uByrxVj999L6+xsww80NDGh9
 M7bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:reply-to:to:cc:references:in-reply-to
 :subject:date:message-id:mime-version:content-transfer-encoding
 :content-language:thread-index;
 bh=z2FvhJj0rboD2ZNlDgF/UnMTbEK6UqBAOC4li2lmzI4=;
 b=qgfn/sHP/mANiJrBvP1Qc2VlDxAj7zYpOmg0kSgbKh/xF9WCGoIQebGGS4tQbKBTmP
 gHb5C0K7aKs9yfsifAZ9TE4UJy9ZLXAjLZfq+yogoXDL7XU3XSZjF7BOagUjwBWTPH7T
 dcJbWv5TvU0YKzo63gLlZfDSmH2Y+OuyJrr69FzCTO7/g9VyV7Vm1sBteB9IzkbtiVZZ
 ngi8alEimwt1XP9mnpKicSpDRg2rp2VN1ZqH3s0i6sosG40yKvbTX67cb9izFrwwKxEn
 PG4ypkpiBHyomBdvA0OQiEd4BRwke70PsMsy/YvMHMxZwO7aUaBlMK/lhT/rppKr87NI
 +TYw==
X-Gm-Message-State: AOAM533i1Ws2TzfpJ/8+OPzg/Cmuy8/6bbZaekSp6AOAp4Z59ozbYgML
 WXSDNjVZLGsasryH3Tclt+I=
X-Google-Smtp-Source: ABdhPJxUCbfA+B1QRkslt9DCIbp/k9qzxUuL5axNYq4GvWO7p09sdGw03Py4/30qq8HbH3hlNfMCNQ==
X-Received: by 2002:a7b:c1ce:: with SMTP id a14mr15434623wmj.144.1591623497392; 
 Mon, 08 Jun 2020 06:38:17 -0700 (PDT)
Received: from CBGR90WXYV0 ([54.239.6.185])
 by smtp.gmail.com with ESMTPSA id l17sm21342417wmi.3.2020.06.08.06.38.15
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 08 Jun 2020 06:38:16 -0700 (PDT)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: "Paul Durrant" <paul@xen.org>
To: "'Andrew Cooper'" <andrew.cooper3@citrix.com>,
 "'Xen-devel'" <xen-devel@lists.xenproject.org>
References: <20200608133433.23659-1-andrew.cooper3@citrix.com>
In-Reply-To: <20200608133433.23659-1-andrew.cooper3@citrix.com>
Subject: RE: [PATCH v2 for-4.14] docs/support-matrix: unbreak docs rendering
Date: Mon, 8 Jun 2020 14:38:15 +0100
Message-ID: <003201d63d9a$10a07f20$31e17d60$@xen.org>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Mailer: Microsoft Outlook 16.0
Content-Language: en-gb
Thread-Index: AQF3f+tZUFdPAi1ShdzcWao/KRWiYamMM+ow
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Reply-To: paul@xen.org
Cc: 'Stefano Stabellini' <sstabellini@kernel.org>,
 'Julien Grall' <julien@xen.org>, 'Wei Liu' <wl@xen.org>,
 'Konrad Rzeszutek Wilk' <konrad.wilk@oracle.com>,
 'George Dunlap' <George.Dunlap@eu.citrix.com>,
 'Jan Beulich' <JBeulich@suse.com>,
 'Anthony PERARD' <anthony.perard@citrix.com>,
 'Ian Jackson' <ian.jackson@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

> -----Original Message-----
> From: Andrew Cooper <andrew.cooper3@citrix.com>
> Sent: 08 June 2020 14:35
> To: Xen-devel <xen-devel@lists.xenproject.org>
> Cc: Andrew Cooper <andrew.cooper3@citrix.com>; George Dunlap <George.Dunlap@eu.citrix.com>; Ian
> Jackson <ian.jackson@citrix.com>; Jan Beulich <JBeulich@suse.com>; Konrad Rzeszutek Wilk
> <konrad.wilk@oracle.com>; Stefano Stabellini <sstabellini@kernel.org>; Wei Liu <wl@xen.org>; Julien
> Grall <julien@xen.org>; Anthony PERARD <anthony.perard@citrix.com>; Paul Durrant <paul@xen.org>
> Subject: [PATCH v2 for-4.14] docs/support-matrix: unbreak docs rendering
> 
> The cronjob which renders https://xenbits.xen.org/docs/ has been broken for a
> while.  commitish_version() pulls an old version of xen/Makefile out of
> history, and uses the xenversion rule.
> 
> Currently, this fails with:
> 
>   tmp.support-matrix.xen.make:130: scripts/Kbuild.include: No such file or directory
> 
> which is because the Makefile legitimately references Kbuild.include with a
> relative rather than absolute path.
> 
> Rework support-matrix-generate to use sed to extract the major/minor, rather
> than expecting xen/Makefile to be usable in a different tree.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Release-acked-by: Paul Durrant <paul@xen.org>

> ---
> CC: George Dunlap <George.Dunlap@eu.citrix.com>
> CC: Ian Jackson <ian.jackson@citrix.com>
> CC: Jan Beulich <JBeulich@suse.com>
> CC: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
> CC: Stefano Stabellini <sstabellini@kernel.org>
> CC: Wei Liu <wl@xen.org>
> CC: Julien Grall <julien@xen.org>
> CC: Anthony PERARD <anthony.perard@citrix.com>
> CC: Paul Durrant <paul@xen.org>
> 
> v2:
>  * Use sed rather than fixing up the makefile environment
> 
> This needs backporting to all trees with the support matrix logic, to unbreak
> docs rendering
> ---
>  docs/support-matrix-generate | 25 +++++++++++++------------
>  1 file changed, 13 insertions(+), 12 deletions(-)
> 
> diff --git a/docs/support-matrix-generate b/docs/support-matrix-generate
> index a3d93321f1..b759d0440c 100755
> --- a/docs/support-matrix-generate
> +++ b/docs/support-matrix-generate
> @@ -26,12 +26,9 @@
>  # SUPPORT.md into json.
>  #
>  # Then we try to find the next previous revision.  This is done by
> -# extracting the current version number from xen/Makefile.  (We make
> -# some slight assumption about how xen/Makefile's xenversion target
> -# works, because we want to be able to do this without checking out
> -# the whole tree for the version in question.)  Then we use git log on
> -# xen/Makefile to try to find a commit where the version changed.
> -# This gives us the previous version number, NN.
> +# extracting the current version number from xen/Makefile.  Then we
> +# use git log on xen/Makefile to try to find a commit where the
> +# version changed.  This gives us the previous version number, NN.
>  #
>  # That is substituted into the `refs/remotes/origin/stable-NN'
>  # argument to get the tip of the relevant branch.  That in turns
> @@ -102,12 +99,16 @@ commitish_version () {
>      esac
> 
>      git cat-file blob "$commitish:$versionfile" >"$tmp_versionfile"
> -    version=$(make --no-print-directory -C docs \
> -                   -f "${tmp_versionfile#docs/}" xenversion)
> -    case "$version" in
> -        *.*.*) version="${version%.*}" ;;
> -    esac
> -    printf "%s\n" "${version%%-*}"
> +
> +    local maj=$(sed -n 's/.*XEN_VERSION.*= \([0-9]\+\)/\1/p' < "$tmp_versionfile")
> +    local min=$(sed -n 's/.*XEN_SUBVERSION.*= \([0-9]\+\)/\1/p' < "$tmp_versionfile")
> +
> +    if [[ -z $maj || -z $min ]];
> +    then
> +        fail "Unable to identify Xen version for ${commitish}";
> +    fi
> +
> +    printf "%d.%d\n" "${maj}" "${min}"
>  }
> 
>  exec 4>"$tmp_revisions"
> --
> 2.11.0



