Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ECD4CB22E79
	for <lists+xen-devel@lfdr.de>; Tue, 12 Aug 2025 19:03:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1078963.1439962 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ulsOH-0003FH-0U; Tue, 12 Aug 2025 17:02:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1078963.1439962; Tue, 12 Aug 2025 17:02:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ulsOG-0003CW-Tv; Tue, 12 Aug 2025 17:02:24 +0000
Received: by outflank-mailman (input) for mailman id 1078963;
 Tue, 12 Aug 2025 17:02:23 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=qHa6=2Y=net-space.pl=dkiper@srs-se1.protection.inumbo.net>)
 id 1ulsOF-0003CQ-NC
 for xen-devel@lists.xenproject.org; Tue, 12 Aug 2025 17:02:23 +0000
Received: from dibed.net-space.pl (dibed.net-space.pl [84.10.22.86])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1940c18c-779e-11f0-b898-0df219b8e170;
 Tue, 12 Aug 2025 19:02:16 +0200 (CEST)
Received: from router-fw.i.net-space.pl ([192.168.52.1]:38848 "EHLO
 tomti.i.net-space.pl") by router-fw-old.i.net-space.pl with ESMTP
 id S1920936AblHLRCO (ORCPT <rfc822;xen-devel@lists.xenproject.org>);
 Tue, 12 Aug 2025 19:02:14 +0200
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
X-Inumbo-ID: 1940c18c-779e-11f0-b898-0df219b8e170
X-Comment: RFC 2476 MSA function at dibed.net-space.pl logged sender identity as: dkiper
Date:	Tue, 12 Aug 2025 19:02:11 +0200
From:	Daniel Kiper <dkiper@net-space.pl>
To:	Aaron Rainbolt <arraybolt3@gmail.com>
Cc:	grub-devel@gnu.org, xen-devel@lists.xenproject.org
Subject: Re: [PATCH v4 2/2] kern/xen: Add Xen command line parsing
Message-ID: <20250812170211.q7ezlveygfsdkz34@tomti.i.net-space.pl>
References: <20250804234816.3d14f53f@kf-m2g5>
 <20250804234911.3cc3997c@kf-m2g5>
 <20250804235009.30e39bd9@kf-m2g5>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250804235009.30e39bd9@kf-m2g5>
User-Agent: NeoMutt/20170113 (1.7.2)

On Mon, Aug 04, 2025 at 11:50:09PM -0500, Aaron Rainbolt wrote:
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
> ---
>  docs/grub.texi                |  51 +++++
>  grub-core/Makefile.core.def   |   2 +
>  grub-core/kern/i386/xen/pvh.c |  23 +++
>  grub-core/kern/xen/cmdline.c  | 376 ++++++++++++++++++++++++++++++++++
>  grub-core/kern/xen/init.c     |   2 +
>  include/grub/xen.h            |   2 +
>  6 files changed, 456 insertions(+)
>  create mode 100644 grub-core/kern/xen/cmdline.c
>
> diff --git a/docs/grub.texi b/docs/grub.texi
> index 34b3484..b58cf98 100644
> --- a/docs/grub.texi
> +++ b/docs/grub.texi
> @@ -3271,6 +3271,7 @@ GRUB.  Others may be used freely in GRUB configuration files.
>  @menu
>  * Special environment variables::
>  * Environment block::
> +* Passing environment variables through Xen::
>  @end menu
>
>
> @@ -3871,6 +3872,56 @@ using BIOS or EFI functions (no ATA, USB or IEEE1275).
>  @command{grub-mkconfig} uses this facility to implement
>  @samp{GRUB_SAVEDEFAULT} (@pxref{Simple configuration}).
>
> +@node Passing environment variables through Xen
> +@section Passing environment variables through Xen
> +
> +If you are using a GRUB image as the kernel for a PV or PVH Xen virtual
> +machine, you can pass environment variables from Xen's dom0 to the VM through
> +the Xen-provided kernel command line. When combined with a properly configured
> +guest, this can be used to customize the guest's behavior on bootup via the
> +VM's Xen configuration file.
> +
> +GRUB will parse the kernel command line passed to it by Xen during bootup.
> +The command line will be split into space-delimited words. Single and
> +double quotes may be used to quote words or portions of words that contain
> +spaces. Single quotes will be considered part of a word if inside double
> +quotes, and vice versa. Arbitrary characters may be backslash-escaped to make
> +them a literal component of a word rather than being parsed as quotes or word
> +separators. The command line must consist entirely of printable 7-bit ASCII
> +characters and spaces. If a non-printing ASCII character is found anywhere in
> +the command line, the entire command line will be ignored by GRUB.
> +
> +Each word should be a variable assignment in the format ``variable'' or
> +``variable=value''. Variable names must contain only the characters A-Z, a-z,
> +and underscore (``_''). Variable names must begin with the string
> +``xen_grub_env_''. Variable values can contain arbitrary printable 7-bit
> +ASCII characters and space. If any variable contains an illegal name, that
> +variable will be ignored.
> +
> +If a variable name and value are both specified, the variable will be set to
> +the specified value. If only a variable name is specified, the variable's
> +value will be set to ``1''.
> +
> +The following is a simple example of how to use this functionality to append
> +arbitrary variables to a guest's kernel command line:
> +
> +@example
> +# In the Xen configuration file for the guest
> +name = "linux_vm"
> +type = "pvh"
> +kernel = "/path/to/grub-i386-xen_pvh.bin"
> +extra = "xen_grub_env_linux_append='loglevel=3'"
> +memory = 1024
> +disk = [ "file:/srv/vms/linux_vm.img,sda,w" ]
> +
> +# In the guest's GRUB configuration file
> +menuentry "Linux VM with dom0-specified kernel parameters" @{
> +    search --set=root --label linux_vm --hint hd0,msdos1
> +    linux /boot/vmlinuz root=LABEL=linux_vm $@{xen_grub_env_linux_append@}
> +    initrd /boot/initrd.img
> +@}
> +@end example
> +
>  @node Modules
>  @chapter Modules
>
> diff --git a/grub-core/Makefile.core.def b/grub-core/Makefile.core.def
> index b3f7119..df0f266 100644
> --- a/grub-core/Makefile.core.def
> +++ b/grub-core/Makefile.core.def
> @@ -248,6 +248,7 @@ kernel = {
>    xen = term/xen/console.c;
>    xen = disk/xen/xendisk.c;
>    xen = commands/boot.c;
> +  xen = kern/xen/cmdline.c;
>
>    i386_xen_pvh = commands/boot.c;
>    i386_xen_pvh = disk/xen/xendisk.c;
> @@ -255,6 +256,7 @@ kernel = {
>    i386_xen_pvh = kern/i386/xen/tsc.c;
>    i386_xen_pvh = kern/i386/xen/pvh.c;
>    i386_xen_pvh = kern/xen/init.c;
> +  i386_xen_pvh = kern/xen/cmdline.c;
>    i386_xen_pvh = term/xen/console.c;
>
>    ia64_efi = kern/ia64/efi/startup.S;
> diff --git a/grub-core/kern/i386/xen/pvh.c b/grub-core/kern/i386/xen/pvh.c
> index 91fbca8..a8988d2 100644
> --- a/grub-core/kern/i386/xen/pvh.c
> +++ b/grub-core/kern/i386/xen/pvh.c
> @@ -321,6 +321,8 @@ void
>  grub_xen_setup_pvh (void)
>  {
>    grub_addr_t par;
> +  const char *xen_cmdline;
> +  int i;
>
>    grub_xen_cpuid_base ();
>    grub_xen_setup_hypercall_page ();
> @@ -352,6 +354,27 @@ grub_xen_setup_pvh (void)
>    grub_xen_mm_init_regions ();
>
>    grub_rsdp_addr = pvh_start_info->rsdp_paddr;
> +
> +  xen_cmdline = (const char *) pvh_start_info->cmdline_paddr;
> +  for (i = 0; i < GRUB_XEN_MAX_GUEST_CMDLINE; i++)
> +    {
> +      if (xen_cmdline[i] == '\0')

This code still does not make a lot of sense for me. You have NUL check
in grub_parse_xen_cmdline(). So, you duplicate the check here...

I would just fire grub_strncpy() here and forget...

> +        {
> +          grub_strncpy ((char *) grub_xen_start_page_addr->cmd_line,
> +			(char *) pvh_start_info->cmdline_paddr,
> +			GRUB_XEN_MAX_GUEST_CMDLINE);
> +
> +          if (grub_xen_start_page_addr->cmd_line[GRUB_XEN_MAX_GUEST_CMDLINE - 1] != '\0')

If you convince me this code is still needed then I am afraid that this
is not what you meant here...

> +            {
> +              grub_error (GRUB_ERR_BUG,
> +			  "Xen command line is not NUL-terminated");
> +              grub_print_error ();
> +              grub_exit ();

grub_fatal() and you are done...

> +            }
> +
> +          break;
> +        }
> +    }
>  }
>
>  grub_err_t
> diff --git a/grub-core/kern/xen/cmdline.c b/grub-core/kern/xen/cmdline.c
> new file mode 100644
> index 0000000..46a9998
> --- /dev/null
> +++ b/grub-core/kern/xen/cmdline.c
> @@ -0,0 +1,376 @@
> +/*
> + *  GRUB  --  GRand Unified Bootloader
> + *  Copyright (C) 2025  Free Software Foundation, Inc.
> + *
> + *  GRUB is free software: you can redistribute it and/or modify
> + *  it under the terms of the GNU General Public License as published by
> + *  the Free Software Foundation, either version 3 of the License, or
> + *  (at your option) any later version.
> + *
> + *  GRUB is distributed in the hope that it will be useful,
> + *  but WITHOUT ANY WARRANTY; without even the implied warranty of
> + *  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> + *  GNU General Public License for more details.
> + *
> + *  You should have received a copy of the GNU General Public License
> + *  along with GRUB.  If not, see <http://www.gnu.org/licenses/>.
> + */
> +
> +#include <grub/env.h>
> +#include <grub/misc.h>
> +#include <grub/mm.h>
> +#include <grub/xen.h>
> +
> +enum splitter_state
> +{
> +  SPLITTER_HIT_BACKSLASH = 0x1,
> +  SPLITTER_IN_SINGLE_QUOTES = 0x2,
> +  SPLITTER_IN_DOUBLE_QUOTES = 0x4,
> +};
> +typedef enum splitter_state splitter_state_t;
> +
> +/*
> + * The initial size of the current_word buffer. The buffer may be resized as
> + * needed.
> + */
> +#define PARSER_BASE_WORD_SIZE 32
> +
> +struct parser_state
> +{
> +  grub_size_t word_list_len;

s/word_list_len/words_count/

And I would put it behind word_list...

> +  char **word_list;

s/word_list/words/

> +  grub_size_t current_word_len;
> +  grub_size_t current_word_pos;
> +  char *current_word;
> +};
> +typedef struct parser_state parser_state_t;
> +
> +static bool

s/bool/grub_err_t/

> +append_char_to_word (parser_state_t *s, char c, bool allow_null)
> +{
> +  /*
> +   * We ban any chars that are not in the ASCII printable range. If
> +   * allow_null == true, we make an exception for NUL. (This is needed so that
> +   * append_word_to_list can add a NUL terminator to the word).
> +   */
> +  if (grub_isprint (c) == false && allow_null == false)

grub_isprint() et consortes return int instead of bool. So, it should be
"!grub_isprint(c)" here...

> +    return false;
> +  else if (allow_null == true && c != '\0')
> +    return false;
> +
> +  if (s->current_word_pos == s->current_word_len)
> +    {
> +      s->current_word = grub_realloc (s->current_word, s->current_word_len *= 2);
> +      if (s->current_word == NULL)
> +        {
> +          s->current_word_len /= 2;
> +          return false;
> +        }
> +    }
> +
> +  s->current_word[s->current_word_pos++] = c;
> +  return true;
> +}
> +
> +static bool

s/bool/grub_err_t/

> +append_word_to_list (parser_state_t *s)
> +{
> +  /* No-op on empty words. */
> +  if (s->current_word_pos == 0)
> +    return true;
> +
> +  if (append_char_to_word (s, '\0', true) == false)
> +    {
> +      grub_error (GRUB_ERR_BUG,
> +		  "couldn't append NUL terminator to word during Xen cmdline parsing");
> +      grub_print_error ();
> +      grub_exit ();

grub_fatal()

> +    }
> +
> +  s->current_word_len = grub_strlen (s->current_word) + 1;
> +  s->current_word = grub_realloc (s->current_word, s->current_word_len);
> +  if (s->current_word == NULL)
> +    return false;

return grub_errno;

> +  s->word_list = grub_realloc (s->word_list, ++s->word_list_len * sizeof (char *));
> +  if (s->word_list == NULL)
> +    return false;

return grub_errno;

...

I think many (related) functions in this code returning bool should
really return grub_err_t...

> +  s->word_list[s->word_list_len - 1] = s->current_word;
> +
> +  s->current_word_len = PARSER_BASE_WORD_SIZE;
> +  s->current_word_pos = 0;
> +  s->current_word = grub_malloc (s->current_word_len);
> +  if (s->current_word == NULL)
> +    return false;
> +
> +  return true;
> +}
> +
> +static bool

But this bool makes sense...

> +is_key_safe (char *key, grub_size_t len)
> +{
> +  grub_size_t i;
> +
> +  for (i = 0; i < len; i++)
> +    {
> +      if (! (grub_isalpha (key[i]) || key[i] == '_'))

Please drop space after "!"...

> +        return false;
> +    }

You can drop curly braces from here...

> +
> +  return true;
> +}
> +
> +void
> +grub_parse_xen_cmdline (void)
> +{
> +  parser_state_t *s = NULL;

parser_state_t ps = {0};

... and you do not need grub_malloc(s) and stuff any longer below...

And I would put it next to splitter_state...

> +  const char *cmdline = (const char *) grub_xen_start_page_addr->cmd_line;
> +  grub_size_t cmdline_len;
> +  bool cmdline_valid = false;
> +  char **param_keys = NULL;
> +  char **param_vals = NULL;
> +  grub_size_t param_dict_len = 0;
> +  grub_size_t param_dict_pos = 0;
> +  splitter_state_t splitter_state = 0;

You nicely define an enum and then assign plain number. Sigh...
I think you should define SPLITTER_NORMAL or something similar
as well...

And s/splitter_state/ss/...

> +  char current_char = '\0';
> +  grub_size_t i = 0;
> +
> +  s = grub_malloc (sizeof (parser_state_t));
> +  if (s == NULL)
> +    goto cleanup_final;
> +
> +  /*
> +   * The following algorithm is used to parse the Xen command line:
> +   *
> +   * - The command line is split into space-separated words.
> +   *   - Single and double quotes may be used to suppress the splitting
> +   *     behavior of spaces.
> +   *   - Double quotes are appended to the current word verbatim if they
> +   *     appear within a single-quoted string portion, and vice versa.
> +   *   - Backslashes may be used to cause the next character to be
> +   *     appended to the current word verbatim. This is only useful when
> +   *     used to escape quotes, spaces, and backslashes, but for simplicity
> +   *     we allow backslash-escaping anything.
> +   * - After splitting the command line into words, each word is checked to
> +   *   see if it contains an equals sign.
> +   *   - If it does, it is split on the equals sign into a key-value pair. The
> +   *     key is then treated as an variable name, and the value is treated as
> +   *     the variable's value.
> +   *   - If it does not, the entire word is treated as a variable name. The
> +   *     variable's value is implicitly considered to be `1`.
> +   * - All variables detected on the command line are checked to see if their
> +   *   names begin with the string `xen_grub_env_`. Variables that do not pass
> +   *   this check are discarded, variables that do pass this check are
> +   *   exported so they are available to the GRUB configuration.
> +   */
> +
> +  s->current_word_len = PARSER_BASE_WORD_SIZE;
> +  s->current_word = grub_malloc (s->current_word_len);
> +  if (s->current_word == NULL)
> +    goto cleanup_main;
> +
> +  for (i = 0; i < GRUB_XEN_MAX_GUEST_CMDLINE; i++)
> +    {
> +      if (cmdline[i] == '\0')
> +        {
> +          cmdline_valid = true;
> +          break;
> +        }
> +    }
> +
> +  if (cmdline_valid == false)
> +    {
> +      grub_error (GRUB_ERR_BAD_ARGUMENT,
> +		  "command line from Xen is not NUL-terminated");
> +      grub_print_error ();

grub_fatal()?

> +      goto cleanup_main;
> +    }
> +
> +  cmdline_len = grub_strlen (cmdline);
> +  for (i = 0; i < cmdline_len; i++)
> +    {
> +      current_char = cmdline[i];
> +
> +      /*
> +       * If the previous character was a backslash, append the current
> +       * character to the word verbatim
> +       */
> +      if (splitter_state & SPLITTER_HIT_BACKSLASH)
> +        {
> +          splitter_state &= ~SPLITTER_HIT_BACKSLASH;
> +          if (append_char_to_word (s, current_char, false) == false)
> +            goto cleanup_main;
> +          continue;
> +        }
> +
> +      switch (current_char)
> +        {
> +        case '\\':
> +          /* Backslashes escape arbitrary characters. */
> +          splitter_state |= SPLITTER_HIT_BACKSLASH;
> +          continue;
> +
> +        case '\'':
> +          /*
> +           * Single quotes suppress word splitting and double quoting until
> +           * the next single quote is encountered.
> +           */
> +          if (splitter_state & SPLITTER_IN_DOUBLE_QUOTES)
> +            {
> +              if (append_char_to_word (s, current_char, false) == false)
> +                goto cleanup_main;
> +              continue;
> +            }
> +
> +          splitter_state ^= SPLITTER_IN_SINGLE_QUOTES;
> +          continue;
> +
> +        case '"':
> +          /*
> +           * Double quotes suppress word splitting and single quoting until
> +           * the next double quote is encountered.
> +           */
> +          if (splitter_state & SPLITTER_IN_SINGLE_QUOTES)
> +            {
> +              if (append_char_to_word (s, current_char, false) == false)
> +                goto cleanup_main;
> +              continue;
> +            }
> +
> +          splitter_state ^= SPLITTER_IN_DOUBLE_QUOTES;
> +          continue;
> +
> +        case ' ':
> +          /* Spaces separate words in the command line from each other. */
> +          if (splitter_state & SPLITTER_IN_SINGLE_QUOTES ||
> +              splitter_state & SPLITTER_IN_DOUBLE_QUOTES)
> +            {
> +              if (append_char_to_word (s, current_char, false) == false)
> +                goto cleanup_main;
> +              continue;
> +            }
> +
> +          if (append_word_to_list (s) == false)
> +            goto cleanup_main;

I think this is not fully correct. You should not run append_word_to_list()
until the closing quote. So, here you should have "else" for the first "if",
i.e., "if (splitter_state & ..." and call append_word_to_list() for closing
\" and \' above.

> +          continue;
> +        }
> +
> +      if (append_char_to_word (s, current_char, false) == false)
> +        goto cleanup_main;

This should be part of "default:" for the switch above... Even if it
works now...

Then many "continue" should be converted to more natural "break"...

> +    }
> +
> +  if (append_word_to_list (s) == false)
> +    goto cleanup_main;
> +
> +  param_keys = grub_malloc (s->word_list_len * sizeof (char *));
> +  if (param_keys == NULL)
> +    goto cleanup_main;
> +  param_vals = grub_malloc (s->word_list_len * sizeof (char *));
> +  if (param_vals == NULL)
> +    goto cleanup_main;
> +
> +  for (i = 0; i < s->word_list_len; i++)
> +    {
> +      char *current_word_eq_ptr;

s/current_word_eq_ptr/eq_pos/

> +      s->current_word = s->word_list[i];
> +      s->current_word_len = grub_strlen (s->current_word) + 1;
> +      current_word_eq_ptr = grub_strchr (s->current_word, '=');
> +
> +      if (current_word_eq_ptr != NULL)
> +        {
> +          /*
> +           * Both pre_eq_len and post_eq_len represent substring lengths
> +           * without a NUL terminator.
> +           */
> +          grub_size_t pre_eq_len = (grub_size_t) (current_word_eq_ptr - s->current_word);
> +          /*
> +           * s->current_word_len includes the NUL terminator, so we subtract
> +           * one to get rid of the terminator, and one more to get rid of the
> +           * equals sign.
> +           */
> +          grub_size_t post_eq_len = (s->current_word_len - 2) - pre_eq_len;
> +
> +          if (is_key_safe (s->current_word, pre_eq_len) == true)
> +            {
> +              param_dict_pos = param_dict_len++;
> +              param_keys[param_dict_pos] = grub_malloc (pre_eq_len + 1);
> +              if (param_keys == NULL)
> +                goto cleanup_main;
> +              param_vals[param_dict_pos] = grub_malloc (post_eq_len + 1);
> +              if (param_vals == NULL)
> +                goto cleanup_main;
> +
> +              grub_strncpy (param_keys[param_dict_pos], s->current_word, pre_eq_len);
> +              grub_strncpy (param_vals[param_dict_pos],
> +			    s->current_word + pre_eq_len + 1, post_eq_len);
> +              param_keys[param_dict_pos][pre_eq_len] = '\0';
> +              param_vals[param_dict_pos][post_eq_len] = '\0';
> +            }
> +        }
> +      else

else if (is_key_safe (s->current_word, s->current_word_len - 1) == true)

... and you can drop an extra indention...

> +        {
> +          if (is_key_safe (s->current_word, s->current_word_len - 1) == true)
> +            {
> +              param_dict_pos = param_dict_len++;
> +              param_keys[param_dict_pos] = grub_malloc (s->current_word_len);
> +              if (param_keys == NULL)
> +                goto cleanup_main;
> +              param_vals[param_dict_pos] = grub_malloc (2);
> +              if (param_vals == NULL)
> +                goto cleanup_main;
> +
> +              grub_strncpy (param_keys[param_dict_pos], s->current_word,
> +			    s->current_word_len);
> +              if (param_keys[param_dict_pos][s->current_word_len - 1] != '\0' )
> +                {
> +                  grub_error (GRUB_ERR_BUG,
> +			      "NUL terminator missing from key during Xen cmdline parsing");
> +                  grub_print_error ();
> +                  grub_exit ();

grub_fatal()

> +                }
> +              grub_strcpy (param_vals[param_dict_pos], "1");
> +            }
> +        }
> +    }

Daniel

