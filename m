Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2595875A3B0
	for <lists+xen-devel@lfdr.de>; Thu, 20 Jul 2023 02:55:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.566311.885000 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qMHxE-00056w-43; Thu, 20 Jul 2023 00:55:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 566311.885000; Thu, 20 Jul 2023 00:55:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qMHxE-00054i-1J; Thu, 20 Jul 2023 00:55:40 +0000
Received: by outflank-mailman (input) for mailman id 566311;
 Thu, 20 Jul 2023 00:55:38 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1UDO=DG=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1qMHxC-00054V-S6
 for xen-devel@lists.xenproject.org; Thu, 20 Jul 2023 00:55:38 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 22e1cd3b-2698-11ee-8611-37d641c3527e;
 Thu, 20 Jul 2023 02:55:36 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 666576185F;
 Thu, 20 Jul 2023 00:55:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3E858C433C8;
 Thu, 20 Jul 2023 00:55:34 +0000 (UTC)
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
X-Inumbo-ID: 22e1cd3b-2698-11ee-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1689814534;
	bh=+qw275kn3Q34BuF4wr/IBRpFm8H5A78DeUfTVsmKwHE=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=SGhfmY1fHKFs/yjn7xzRLPj/QMiycPSk+9xMOPIZry2gNMMWx4IcJfA9ipbXZNqVh
	 Ajemnziu0pBmDGqJgj28KPYYft16LLrHynefjGr2fP4UW1Ab+XJFVlvPeXorXj3LD9
	 Js6c+KnwcqbDLsJgq85wWCaEua304uevtR2Oas70TuE8/qTgTttGPewdTavAkHmKEK
	 1csF0tJC8GeMkQ/u4xfYSUxwXFExF5CCPnyVo8tRdCKeyrOKb5qaS4UHLxX0kYwatw
	 Zn3jcADICyJBny//mTLiiPBotSackxhUUUanVPg3SDOSm5wk2BsDSuOPhjKSatszF7
	 HT/bpypYMzT2g==
Date: Wed, 19 Jul 2023 17:55:32 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Luca Fancellu <luca.fancellu@arm.com>
cc: xen-devel@lists.xenproject.org, wei.chen@arm.com, 
    Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH 2/2] xen/misra: diff-report.py: fix function invocation
In-Reply-To: <20230718092637.2433974-3-luca.fancellu@arm.com>
Message-ID: <alpine.DEB.2.22.394.2307191755250.3118466@ubuntu-linux-20-04-desktop>
References: <20230718092637.2433974-1-luca.fancellu@arm.com> <20230718092637.2433974-3-luca.fancellu@arm.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Tue, 18 Jul 2023, Luca Fancellu wrote:
> Fix the invocation of invoke_command() that takes an optional
> parameter for the exception type, but in the code the error
> message template was passed instead, so fix it passing a new
> exception type.
> 
> Fixes: 1d7c45f895b6 ("xen/misra: diff-report.py: add report patching feature")
> Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>

Acked-by: Stefano Stabellini <sstabellini@kernel.org>


> ---
>  xen/scripts/diff-report.py | 8 ++++++--
>  1 file changed, 6 insertions(+), 2 deletions(-)
> 
> diff --git a/xen/scripts/diff-report.py b/xen/scripts/diff-report.py
> index 636f98f5eebe..a1fe6bc2fccd 100755
> --- a/xen/scripts/diff-report.py
> +++ b/xen/scripts/diff-report.py
> @@ -13,6 +13,10 @@ from xen_analysis.settings import repo_dir
>  from xen_analysis.utils import invoke_command
>  
>  
> +class DiffReportError(Exception):
> +    pass
> +
> +
>  def log_info(text, end='\n'):
>      # type: (str, str) -> None
>      global args
> @@ -97,7 +101,7 @@ def main(argv):
>              git_diff = invoke_command(
>                  "git --git-dir={}/.git diff -C -C {}..{}"
>                  .format(repo_dir, args.baseline_rev, args.report_rev),
> -                True, "Error occured invoking:\n{}\n\n{}"
> +                True, DiffReportError, "Error occured invoking:\n{}\n\n{}"
>              )
>              diff_source = git_diff.splitlines(keepends=True)
>          if diff_source:
> @@ -105,7 +109,7 @@ def main(argv):
>              diffs = UnifiedFormatParser(diff_source)
>              debug.debug_print_parsed_diff(diffs)
>              log_info(" [OK]")
> -    except (ReportError, UnifiedFormatParseError) as e:
> +    except (DiffReportError, ReportError, UnifiedFormatParseError) as e:
>          print("ERROR: {}".format(e))
>          sys.exit(1)
>  
> -- 
> 2.34.1
> 

