Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E573C78BB00
	for <lists+xen-devel@lfdr.de>; Tue, 29 Aug 2023 00:28:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.591821.924344 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qakhl-0001MB-LT; Mon, 28 Aug 2023 22:27:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 591821.924344; Mon, 28 Aug 2023 22:27:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qakhl-0001JK-Hy; Mon, 28 Aug 2023 22:27:29 +0000
Received: by outflank-mailman (input) for mailman id 591821;
 Mon, 28 Aug 2023 22:27:28 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=yBR3=EN=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1qakhk-0001JE-OI
 for xen-devel@lists.xenproject.org; Mon, 28 Aug 2023 22:27:28 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 10bbc066-45f2-11ee-8783-cb3800f73035;
 Tue, 29 Aug 2023 00:27:27 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 6653361195;
 Mon, 28 Aug 2023 22:27:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1C0B1C433C8;
 Mon, 28 Aug 2023 22:27:22 +0000 (UTC)
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
X-Inumbo-ID: 10bbc066-45f2-11ee-8783-cb3800f73035
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1693261644;
	bh=ATmAbCYCJbO0FxAloNPbQsQq94vsfnxi83wFOXli/gk=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=KzRdiMMhGe5+Jsloiflh5rASQx7Kpu5WsyRTgHwwfnWmikUJxB+8OZ48ysnAkzBbB
	 K6F/xBOU/b0PdgOGPkSeCxjGIdb0TWU8AguryuXm6g1exQWQpsEh8lIsOzUFrbzVF3
	 pjDbMVcFI3esvYemlvmZHCo40u8xEqa8+ZUvNGN1TjHYLd3jTeaAOzg2X/rSIKGP3h
	 6x6KKRrpWzQFm5TH2P1QJ4Y8L3C5R0pvHcNZQlkpcRHvtULQGNHxxKKsJkyli98hMx
	 8D+sBoMolqk6SOaROMKp9XKd6CN54QwN8adstoKjwzEO7H7tawms41TrDeSyOwN4Oh
	 qnkQdeeo1IljQ==
Date: Mon, 28 Aug 2023 15:27:20 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Simone Ballarin <simone.ballarin@bugseng.com>
cc: xen-devel@lists.xenproject.org, consulting@bugseng.com, 
    sstabellini@kernel.org, Doug Goldstein <cardoe@cardoe.com>, 
    Andrew Cooper <andrew.cooper3@citrix.com>, 
    George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>, 
    Julien Grall <julien@xen.org>, Wei Liu <wl@xen.org>, 
    nicola.vetrini@bugseng.com, Bertrand.Marquis@arm.com, 
    Luca.Fancellu@arm.com, michal.orzel@amd.com
Subject: Re: [XEN PATCH 05/13] automation/eclair: add deviation for
 usercopy.c
In-Reply-To: <4039623dc4341758f383ec49228c1e55e5862b0f.1693228255.git.simone.ballarin@bugseng.com>
Message-ID: <alpine.DEB.2.22.394.2308281512360.6458@ubuntu-linux-20-04-desktop>
References: <cover.1693228255.git.simone.ballarin@bugseng.com> <4039623dc4341758f383ec49228c1e55e5862b0f.1693228255.git.simone.ballarin@bugseng.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

+Nicola, Luca

On Mon, 28 Aug 2023, Simone Ballarin wrote:
> xen/arch/x86/usercopy.c includes itself, so it is not supposed to
> comply with Directive 4.10:
> "Precautions shall be taken in order to prevent the contents of a
> header file being included more than once"
> 
> This patch adds a deviation for the file.
> 
> Signed-off-by: Simone Ballarin <simone.ballarin@bugseng.com>
>
> ---
>  automation/eclair_analysis/ECLAIR/deviations.ecl | 4 ++++
>  docs/misra/rules.rst                             | 2 ++
>  2 files changed, 6 insertions(+)
> 
> diff --git a/automation/eclair_analysis/ECLAIR/deviations.ecl b/automation/eclair_analysis/ECLAIR/deviations.ecl
> index 2681a4cff5..a7d4f29b43 100644
> --- a/automation/eclair_analysis/ECLAIR/deviations.ecl
> +++ b/automation/eclair_analysis/ECLAIR/deviations.ecl
> @@ -96,6 +96,10 @@ conform to the directive."
>  -config=MC3R1.D4.10,reports+={safe, "first_area(text(^ \\* In this case, no inclusion guards apply and the caller is responsible.*\\*/$, begin-1))"}
>  -doc_end
>  
> +-doc_begin="xen/arch/x86/usercopy.c includes itself: it is not supposed to comply with the directive"
> +-config=MC3R1.D4.10,reports+={deliberate, "all_area(all_loc(file("^xen/arch/x86/usercopy\\.c$")))"}
> +-doc_end
> +
>  #
>  # Series 5.
>  #
> diff --git a/docs/misra/rules.rst b/docs/misra/rules.rst
> index 4b1a7b02b6..45e13d0302 100644
> --- a/docs/misra/rules.rst
> +++ b/docs/misra/rules.rst
> @@ -62,6 +62,8 @@ maintainers if you want to suggest a change.
>       - Files that are intended to be included more than once do not need to
>         conform to the directive. Files that explicitly avoid inclusion guards
>         under specific circumstances do not need to conform the directive.
> +       xen/arch/x86/usercopy.c includes itself: it is not supposed to comply
> +       with the directive.


We need to find a consistent way to document this kind of deviations in
a non-ECLAIR specific way, without adding the complete list of
deviations to rules.rst.

Can we use safe.json and add an in-code comment at the top of
usercopy.c? E.g.:

diff --git a/xen/arch/x86/usercopy.c b/xen/arch/x86/usercopy.c
index b8c2d1cc0b..8bb591f472 100644
--- a/xen/arch/x86/usercopy.c
+++ b/xen/arch/x86/usercopy.c
@@ -1,3 +1,4 @@
+/* SAF-1-safe */
 /* 
  * User address space access functions.
  *

Otherwise, maybe we should extend safe.json to also have an extra field
with a list of paths. For instance see "files" below:

{
    "version": "1.0",
    "content": [
        {
            "id": "SAF-0-safe",
            "analyser": {
                "eclair": "MC3R1.R8.6",
                "coverity": "misra_c_2012_rule_8_6_violation"
            },
            "name": "Rule 8.6: linker script defined symbols",
            "text": "It is safe to declare this symbol because it is defined in the linker script."
        },
        {
            "id": "SAF-1-safe",
            "analyser": {
                "eclair": "MC3R1.D4.10"
            },
            "name": "Dir 4.10: files that include themselves",
            "text": "Files purposely written to include themselves are not supposed to comply with D4.10.",
            "files": ["xen/arch/x86/usercopy.c"]
        },
        {
            "id": "SAF-2-safe",
            "analyser": {},
            "name": "Sentinel",
            "text": "Next ID to be used"
        }
    ]
}

