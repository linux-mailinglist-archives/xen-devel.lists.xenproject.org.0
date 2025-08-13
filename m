Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D8F3B24BD3
	for <lists+xen-devel@lfdr.de>; Wed, 13 Aug 2025 16:28:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1079979.1440630 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1umCRk-0002Xe-70; Wed, 13 Aug 2025 14:27:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1079979.1440630; Wed, 13 Aug 2025 14:27:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1umCRk-0002VC-36; Wed, 13 Aug 2025 14:27:20 +0000
Received: by outflank-mailman (input) for mailman id 1079979;
 Wed, 13 Aug 2025 14:27:18 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=7RVd=2Z=net-space.pl=dkiper@srs-se1.protection.inumbo.net>)
 id 1umCRi-0002V5-CV
 for xen-devel@lists.xenproject.org; Wed, 13 Aug 2025 14:27:18 +0000
Received: from dibed.net-space.pl (dibed.net-space.pl [84.10.22.86])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9c0c6033-7851-11f0-b898-0df219b8e170;
 Wed, 13 Aug 2025 16:27:15 +0200 (CEST)
Received: from router-fw.i.net-space.pl ([192.168.52.1]:46210 "EHLO
 tomti.i.net-space.pl") by router-fw-old.i.net-space.pl with ESMTP
 id S2272809AblHMO1O (ORCPT <rfc822;xen-devel@lists.xenproject.org>);
 Wed, 13 Aug 2025 16:27:14 +0200
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
X-Inumbo-ID: 9c0c6033-7851-11f0-b898-0df219b8e170
X-Comment: RFC 2476 MSA function at dibed.net-space.pl logged sender identity as: dkiper
Date:	Wed, 13 Aug 2025 16:27:11 +0200
From:	Daniel Kiper <dkiper@net-space.pl>
To:	Aaron Rainbolt <arraybolt3@gmail.com>
Cc:	grub-devel@gnu.org, xen-devel@lists.xenproject.org
Subject: Re: [PATCH v4 2/2] kern/xen: Add Xen command line parsing
Message-ID: <20250813142711.l4jxlgjk426ansab@tomti.i.net-space.pl>
References: <20250804234816.3d14f53f@kf-m2g5>
 <20250804234911.3cc3997c@kf-m2g5>
 <20250804235009.30e39bd9@kf-m2g5>
 <20250812170211.q7ezlveygfsdkz34@tomti.i.net-space.pl>
 <20250812185515.436a33da@kf-m2g5>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250812185515.436a33da@kf-m2g5>
User-Agent: NeoMutt/20170113 (1.7.2)

On Tue, Aug 12, 2025 at 06:55:15PM -0500, Aaron Rainbolt wrote:
> On Tue, 12 Aug 2025 19:02:11 +0200 Daniel Kiper <dkiper@net-space.pl> wrote:
> > On Mon, Aug 04, 2025 at 11:50:09PM -0500, Aaron Rainbolt wrote:
> > > Xen traditionally allows customizing guest behavior by passing
> > > arguments to the VM kernel via the kernel command line. This is no
> > > longer possible when using GRUB with Xen, as the kernel command
> > > line is decided by the GRUB configuration file within the guest,
> > > not data passed to the guest by Xen.
> > >
> > > To work around this limitation, enable GRUB to parse a command line
> > > passed to it by Xen, and expose data from the command line to the
> > > GRUB configuration as environment variables. These variables can be
> > > used in the GRUB configuration for any desired purpose, such as
> > > extending the kernel command line passed to the guest. The command
> > > line format is inspired by the Linux kernel's command line format.
> > >
> > > To reduce the risk of misuse, abuse, or accidents in production, the
> > > command line will only be parsed if it consists entirely of 7-bit
> > > ASCII characters, only alphabetical characters and underscores are
> > > permitted in variable names, and all variable names must start with
> > > the string "xen_grub_env_". This also allows room for expanding the
> > > command line arguments accepted by GRUB in the future, should other
> > > arguments end up becoming desirable in the future.
> > >
> > > Signed-off-by: Aaron Rainbolt <arraybolt3@gmail.com>

[...]

> > > diff --git a/grub-core/kern/i386/xen/pvh.c b/grub-core/kern/i386/xen/pvh.c index 91fbca8..a8988d2 100644
> > > --- a/grub-core/kern/i386/xen/pvh.c
> > > +++ b/grub-core/kern/i386/xen/pvh.c
> > > @@ -321,6 +321,8 @@ void
> > >  grub_xen_setup_pvh (void)
> > >  {
> > >    grub_addr_t par;
> > > +  const char *xen_cmdline;
> > > +  int i;
> > >
> > >    grub_xen_cpuid_base ();
> > >    grub_xen_setup_hypercall_page ();
> > > @@ -352,6 +354,27 @@ grub_xen_setup_pvh (void)
> > >    grub_xen_mm_init_regions ();
> > >
> > >    grub_rsdp_addr = pvh_start_info->rsdp_paddr;
> > > +
> > > +  xen_cmdline = (const char *) pvh_start_info->cmdline_paddr;
> > > +  for (i = 0; i < GRUB_XEN_MAX_GUEST_CMDLINE; i++)
> > > +    {
> > > +      if (xen_cmdline[i] == '\0')
> >
> > This code still does not make a lot of sense for me. You have NUL
> > check in grub_parse_xen_cmdline(). So, you duplicate the check here...
> >
> > I would just fire grub_strncpy() here and forget...
>
> I guess it depends on how you view grub_xen_start_page_addr->cmd_line's
> semantics. In my mind, cmd_line is a NUL-terminated string, always. If
> you boot in PV mode, Xen ensures it's a NUL-terminated string, so it's
> reasonable for code in GRUB to assume it will be one. If you boot in
> PVH mode, it starts out initialized to all zeros which is technically a
> NUL-terminated string, and the code that exists here ensures that if we
> copy the kernel command line to cmd_line, it will still be a
> NUL-terminated string. If we use a "bare" grub_strncpy() here, then if
> someone passes a kernel command line larger than
> GRUB_XEN_MAX_GUEST_CMDLINE - 1, cmd_line will end up not being
> NUL-terminated anymore, and any code added to GRUB in the future that
> assumes it is a NUL-terminated string may buffer overflow.
>
> One could argue "let's keep the NUL check here and remove it from
> grub_parse_xen_cmdline()", but that doesn't work either because we only
> get to control the contents of cmd_line if we boot in PVH mode. If
> instead we boot in PV mode, cmd_line is initialized by Xen itself. GRUB
> receives a pre-populated and ready-to-use start_info struct directly
> from the hypervisor in this scenario. Xen is supposed to ensure that
> start_info is always NUL-terminated, but if there's ever a bug in Xen
> that breaks that assumption, that could result in bad things happening,
> the same as if we didn't do the NUL check in grub_xen_setup_pvh(). Now
> of course there's nothing we can do about Xen possibly being buggy (if
> it gives us a GRUB_XEN_MAX_GUEST_CMDLINE-long buffer with no NUL
> terminator, too bad), but we can at least make sure that we're ready
> for that eventuality. That's why I like having both NUL checks - we're
> ready for if Xen does things wrong, and any future code that isn't
> ready for that eventuality will still work if things go wrong, at least
> in PVH mode.

OK, it looks like this explanation, in shortened form, should land
around this code... Or not... Please look below...

> (Arguably any new code that depends on cmd_line *should* check it for a
> NUL terminator. But I don't want to assume that all new code *will* do
> so.)
>
> > > +        {
> > > +          grub_strncpy ((char *)
> > > grub_xen_start_page_addr->cmd_line,
> > > +			(char *) pvh_start_info->cmdline_paddr,
> > > +			GRUB_XEN_MAX_GUEST_CMDLINE);
> > > +
> > > +          if
> > > (grub_xen_start_page_addr->cmd_line[GRUB_XEN_MAX_GUEST_CMDLINE - 1]
> > > != '\0')
> >
> > If you convince me this code is still needed then I am afraid that
> > this is not what you meant here...
>
> grub_strncpy doesn't just NUL-terminate the command line, it also fills
> the entire remainder of the buffer with NUL characters. Therefore if

I am afraid we are looking at different grub_strncpy() functions...

> grub_strncpy NUL-terminated the copied string, the last character of
> the buffer will always be NUL. This is a redundant check since the code
> above goes to great lengths to avoid ever putting anything
> non-NUL-terminated into the buffer, but I was under the impression you
> wanted the check added just in case. I'm happy to remove it if it's not
> desirable.

I think we misunderstood each other. This code is redundant now...

[...]

> > > +is_key_safe (char *key, grub_size_t len)
> > > +{
> > > +  grub_size_t i;
> > > +
> > > +  for (i = 0; i < len; i++)
> > > +    {
> > > +      if (! (grub_isalpha (key[i]) || key[i] == '_'))
> >
> > Please drop space after "!"...
>
> Will change.
>
> > > +        return false;
> > > +    }
> >
> > You can drop curly braces from here...
>
> Will change.
>
> (I initially kept this written the way it was though because the GNU
> coding standards seemed to indicate I should keep the braces. "When
> you have an if-else statement nested in another if statement, always
> put braces around the if-else." [1] This isn't a nested if, but it's an
> if within a for which is very similar.)
>
> Is there any recommended coding style documentation I should be looking
> at other than the GNU coding standards and the GRUB coding style
> guidelines? It seems I'm making an awful lot of style mistakes and
> would like to avoid that going forward.

Yes, it is but sadly it is not fully/properly/.. documented [1]...

[...]

> > > +  for (i = 0; i < GRUB_XEN_MAX_GUEST_CMDLINE; i++)
> > > +    {
> > > +      if (cmdline[i] == '\0')
> > > +        {
> > > +          cmdline_valid = true;
> > > +          break;
> > > +        }
> > > +    }
> > > +
> > > +  if (cmdline_valid == false)
> > > +    {
> > > +      grub_error (GRUB_ERR_BAD_ARGUMENT,
> > > +		  "command line from Xen is not NUL-terminated");
> > > +      grub_print_error ();
> >
> > grub_fatal()?
>
> That would probably be a bad idea here. We use (or, at least, will use)
> grub_fatal() in grub_xen_setup_pvh() because if grub_strncpy() doesn't
> NUL-terminate the string it copies, it indicates a bug in GRUB (either
> in grub_strncpy, or more likely in the nearby NUL-checking code). On
> the other hand, cmdline_valid may equal false if we boot in PV mode and
> Xen incorrectly hands us a non-NUL-terminated string. That's bad and
> prevents us from parsing the command line safely, but I'd argue it
> shouldn't entirely block boot. (Then again, maybe if it does block
> boot, that will make this kind of theoretical Xen bug be much more
> noticeable and help it get fixed quicker. If you'd prefer that we bail
> out entirely here, I'm happy to change it.)

As I said earlier, I would simply call grub_strncpy() in grub_xen_setup_pvh()
without additional NUL-check there and fail if non-NUL-terminated string
is detected here...

> > > +      goto cleanup_main;
> > > +    }
> > > +
> > > +  cmdline_len = grub_strlen (cmdline);
> > > +  for (i = 0; i < cmdline_len; i++)
> > > +    {
> > > +      current_char = cmdline[i];
> > > +
> > > +      /*
> > > +       * If the previous character was a backslash, append the current
> > > +       * character to the word verbatim
> > > +       */
> > > +      if (splitter_state & SPLITTER_HIT_BACKSLASH)
> > > +        {
> > > +          splitter_state &= ~SPLITTER_HIT_BACKSLASH;
> > > +          if (append_char_to_word (s, current_char, false) == false)
> > > +            goto cleanup_main;
> > > +          continue;
> > > +        }
> > > +
> > > +      switch (current_char)
> > > +        {
> > > +        case '\\':
> > > +          /* Backslashes escape arbitrary characters. */
> > > +          splitter_state |= SPLITTER_HIT_BACKSLASH;
> > > +          continue;
> > > +
> > > +        case '\'':
> > > +          /*
> > > +           * Single quotes suppress word splitting and double quoting until
> > > +           * the next single quote is encountered.
> > > +           */
> > > +          if (splitter_state & SPLITTER_IN_DOUBLE_QUOTES)
> > > +            {
> > > +              if (append_char_to_word (s, current_char, false) == false)
> > > +                goto cleanup_main;
> > > +              continue;
> > > +            }
> > > +
> > > +          splitter_state ^= SPLITTER_IN_SINGLE_QUOTES;
> > > +          continue;
> > > +
> > > +        case '"':
> > > +          /*
> > > +           * Double quotes suppress word splitting and single quoting until
> > > +           * the next double quote is encountered.
> > > +           */
> > > +          if (splitter_state & SPLITTER_IN_SINGLE_QUOTES)
> > > +            {
> > > +              if (append_char_to_word (s, current_char, false) == false)
> > > +                goto cleanup_main;
> > > +              continue;
> > > +            }
> > > +
> > > +          splitter_state ^= SPLITTER_IN_DOUBLE_QUOTES;
> > > +          continue;
> > > +
> > > +        case ' ':
> > > +          /* Spaces separate words in the command line from each other. */
> > > +          if (splitter_state & SPLITTER_IN_SINGLE_QUOTES ||
> > > +              splitter_state & SPLITTER_IN_DOUBLE_QUOTES)
> > > +            {
> > > +              if (append_char_to_word (s, current_char, false) == false)
> > > +                goto cleanup_main;
> > > +              continue;
> > > +            }
> > > +
> > > +          if (append_word_to_list (s) == false)
> > > +            goto cleanup_main;
> >
> > I think this is not fully correct. You should not run
> > append_word_to_list() until the closing quote. So, here you should
> > have "else" for the first "if", i.e., "if (splitter_state & ..." and
> > call append_word_to_list() for closing \" and \' above.
>
> What closing quote? If we're in quotes, the `if (splitter_state &...`
> block will run. That block runs `continue`, restarting the loop before
> we get to the `append_word_to_list (s)` call. If we hit a closing
> quote, either the `case '\''` or the `case '"'` block will be
> triggered, changing the splitter's state so that it knows it's no
> longer within a quote block, and then the next space (or the end of the
> string) will cause `append_word_to_list()` to be called, adding the
> quoted word to the list. Even if this `continue` changes to a `break`
> like suggested below, the logic and control flow will remain the same.
>
> Calling `append_word_to_list()` for closing quotes would break the
> splitter. I'm trying to implement splitting behavior similar to Bash or
> GRUB's configuration language, both of which parse
> `xen_grub_env_var="abc def"ghi` into the variable `xen_grub_env_var`
> with the value `abc defghi`. If we split on closing quotes too, the
> input above will be parsed into two words, `xen_grub_env_var=abc def`
> and an extra word `ghi`, resulting in the environment variable
> `xen_grub_env_var` being set to `abc def` and the `ghi` being lost
> entirely. One could argue that this is reasonable behavior, but it
> isn't consistent with the other splitting behavior in GRUB.

OK, makes sense for me... Maybe you should mention somewhere in the code
current splitter behavior...

Daniel

[1] https://www.gnu.org/software/grub/manual/grub-dev/grub-dev.html#Coding-style

