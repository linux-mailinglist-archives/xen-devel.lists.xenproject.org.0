Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C1190B2AD56
	for <lists+xen-devel@lfdr.de>; Mon, 18 Aug 2025 17:53:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1086182.1444394 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uo2A6-0007tT-I7; Mon, 18 Aug 2025 15:52:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1086182.1444394; Mon, 18 Aug 2025 15:52:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uo2A6-0007qj-F5; Mon, 18 Aug 2025 15:52:42 +0000
Received: by outflank-mailman (input) for mailman id 1086182;
 Mon, 18 Aug 2025 15:52:41 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/WGh=26=net-space.pl=dkiper@srs-se1.protection.inumbo.net>)
 id 1uo2A5-0007qd-C3
 for xen-devel@lists.xenproject.org; Mon, 18 Aug 2025 15:52:41 +0000
Received: from dibed.net-space.pl (dibed.net-space.pl [84.10.22.86])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5e5096c3-7c4b-11f0-a32a-13f23c93f187;
 Mon, 18 Aug 2025 17:52:40 +0200 (CEST)
Received: from router-fw.i.net-space.pl ([192.168.52.1]:52762 "EHLO
 tomti.i.net-space.pl") by router-fw-old.i.net-space.pl with ESMTP
 id S2270817AblHRPwj (ORCPT <rfc822;xen-devel@lists.xenproject.org>);
 Mon, 18 Aug 2025 17:52:39 +0200
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
X-Inumbo-ID: 5e5096c3-7c4b-11f0-a32a-13f23c93f187
X-Comment: RFC 2476 MSA function at dibed.net-space.pl logged sender identity as: dkiper
Date:	Mon, 18 Aug 2025 17:52:37 +0200
From:	Daniel Kiper <dkiper@net-space.pl>
To:	arraybolt3@gmail.com
Cc:	grub-devel@gnu.org, xen-devel@lists.xenproject.org
Subject: Re: [PATCH v5 3/3] kern/xen: Add Xen command line parsing
Message-ID: <20250818155237.rj6alei6vydwjfyp@tomti.i.net-space.pl>
References: <20250814013645.2488043-1-arraybolt3@gmail.com>
 <20250814013645.2488043-4-arraybolt3@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250814013645.2488043-4-arraybolt3@gmail.com>
User-Agent: NeoMutt/20170113 (1.7.2)

On Wed, Aug 13, 2025 at 08:36:45PM -0500, arraybolt3@gmail.com wrote:
> From: Aaron Rainbolt <arraybolt3@gmail.com>
>
> Xen traditionally allows customizing guest behavior by passing arguments
> to the VM kernel via the kernel command line. This is no longer possible
> when using GRUB with Xen, as the kernel command line is decided by the
> GRUB configuration file within the guest, not data passed to the guest
> by Xen.
>
> To work around this limitation, enable GRUB to parse a command line
> passed to it by Xen, and expose data from the command line to the GRUB
> configuration as environment variables. These variables can be used in
> the GRUB configuration for any desired purpose, such as extending the
> kernel command line passed to the guest. The command line format is
> inspired by the Linux kernel's command line format.
>
> To reduce the risk of misuse, abuse, or accidents in production, the
> command line will only be parsed if it consists entirely of 7-bit ASCII
> characters, only alphabetical characters and underscores are permitted
> in variable names, and all variable names must start with the string
> "xen_grub_env_". This also allows room for expanding the command line
> arguments accepted by GRUB in the future, should other arguments end up
> becoming desirable in the future.
>
> Signed-off-by: Aaron Rainbolt <arraybolt3@gmail.com>

Reviewed-by: Daniel Kiper <daniel.kiper@oracle.com>

... but two nits below...

> +      else if (is_key_safe (ps.current_word, ps.current_word_len - 1) == true)
> +        {
> +          param_dict_pos = param_dict_len++;
> +          param_keys[param_dict_pos] = grub_malloc (ps.current_word_len);
> +          if (param_keys == NULL)
> +            goto cleanup_main;
> +          param_vals[param_dict_pos] = grub_malloc (2);

grub_zalloc()

> +          if (param_vals == NULL)
> +            goto cleanup_main;
> +
> +          grub_strncpy (param_keys[param_dict_pos], ps.current_word,
> +			ps.current_word_len);
> +          if (param_keys[param_dict_pos][ps.current_word_len - 1] != '\0' )
> +            grub_fatal ("NUL terminator missing from key during Xen cmdline parsing");
> +          grub_strcpy (param_vals[param_dict_pos], "1");

*param_vals[param_dict_pos] = '1';

I can fix these two issues for you before push...

If I do not hear any objections from Xen community in a week or
so I will push this patch into GRUB upstream git repo.

Anyway, thank you for doing this work!

Daniel

