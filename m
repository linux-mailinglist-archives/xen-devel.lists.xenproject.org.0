Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B5C86B18209
	for <lists+xen-devel@lfdr.de>; Fri,  1 Aug 2025 14:56:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1067240.1432141 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uhpIV-0006EU-01; Fri, 01 Aug 2025 12:55:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1067240.1432141; Fri, 01 Aug 2025 12:55:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uhpIU-0006CX-TK; Fri, 01 Aug 2025 12:55:42 +0000
Received: by outflank-mailman (input) for mailman id 1067240;
 Fri, 01 Aug 2025 12:55:42 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=mF25=2N=net-space.pl=dkiper@srs-se1.protection.inumbo.net>)
 id 1uhpIU-0006CR-5q
 for xen-devel@lists.xenproject.org; Fri, 01 Aug 2025 12:55:42 +0000
Received: from dibed.net-space.pl (dibed.net-space.pl [84.10.22.86])
 by se1-gles-sth1.inumbo.com (Halon) with SMTP
 id d355f362-6ed6-11f0-a320-13f23c93f187;
 Fri, 01 Aug 2025 14:55:39 +0200 (CEST)
Received: from router-fw.i.net-space.pl ([192.168.52.1]:48616 "EHLO
 tomti.i.net-space.pl") by router-fw-old.i.net-space.pl with ESMTP
 id S998191AblHAMzh (ORCPT <rfc822;xen-devel@lists.xenproject.org>);
 Fri, 1 Aug 2025 14:55:37 +0200
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
X-Inumbo-ID: d355f362-6ed6-11f0-a320-13f23c93f187
X-Comment: RFC 2476 MSA function at dibed.net-space.pl logged sender identity as: dkiper
Date:	Fri, 1 Aug 2025 14:55:36 +0200
From:	Daniel Kiper <dkiper@net-space.pl>
To:	Aaron Rainbolt <arraybolt3@gmail.com>
Cc:	grub-devel@gnu.org, xen-devel@lists.xenproject.org
Subject: Re: [RESEND PATCH v3 1/1] kern/xen: Add Xen command line parsing
Message-ID: <20250801125536.mc2sjrdyikljzea6@tomti.i.net-space.pl>
References: <20250725153012.1dd46644@kf-m2g5>
 <20250725153112.4ea25243@kf-m2g5>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250725153112.4ea25243@kf-m2g5>
User-Agent: NeoMutt/20170113 (1.7.2)

On Fri, Jul 25, 2025 at 03:31:12PM -0500, Aaron Rainbolt wrote:
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
>  docs/grub.texi                |  50 +++++
>  grub-core/Makefile.core.def   |   2 +
>  grub-core/kern/i386/xen/pvh.c |  14 ++
>  grub-core/kern/main.c         |  12 ++
>  grub-core/kern/xen/cmdline.c  | 343 ++++++++++++++++++++++++++++++++++
>  include/grub/xen.h            |   2 +
>  6 files changed, 423 insertions(+)
>  create mode 100644 grub-core/kern/xen/cmdline.c
>
> diff --git a/docs/grub.texi b/docs/grub.texi
> index 34b3484..ce82483 100644
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
> @@ -3871,6 +3872,55 @@ using BIOS or EFI functions (no ATA, USB or IEEE1275).
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
> +spaces. Arbitrary characters may be backslash-escaped to make them a literal
> +component of a word rather than being parsed as quotes or word separators. The
> +command line must consist entirely of printable 7-bit ASCII characters and
> +spaces. If a non-printing ASCII character is found anywhere in the command
> +line, the entire command line will be ignored by GRUB.
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
> +extra = "xen_grub_env_kernelappend='loglevel=3'"

s/kernelappend/kernel_append/

or maybe even

s/kernelappend/linux_append/

to make it clear it is appended to the "linux" command line...

> +memory = 1024
> +disk = [ "file:/srv/vms/linux_vm.img,sda,w" ]
> +
> +# In the guest's GRUB configuration file
> +menuentry "Linux VM with dom0-specified kernel parameters" @{
> +    search --set=root --label linux_vm --hint hd0,msdos1
> +    linux /boot/vmlinuz root=LABEL=linux_vm $@{xen_grub_env_kernelappend@}

Ditto...

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
> index 91fbca8..12df2d8 100644
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
> @@ -352,6 +354,18 @@ grub_xen_setup_pvh (void)
>    grub_xen_mm_init_regions ();
>
>    grub_rsdp_addr = pvh_start_info->rsdp_paddr;
> +
> +  xen_cmdline = (const char *) pvh_start_info->cmdline_paddr;
> +  for (i = 0; i < MAX_GUEST_CMDLINE; i++)

Oh, MAX_GUEST_CMDLINE is a too generic. May I ask you to rename it to
GRUB_XEN_MAX_GUEST_CMDLINE? This should be done in separate patch
preceding this one.

> +    {
> +      if (xen_cmdline[i] == '\0')

I cannot see much sense in this check. Please look below...

> +        {
> +          grub_strncpy ((char *) grub_xen_start_page_addr->cmd_line,
> +			(char *) pvh_start_info->cmdline_paddr,

s/char */const char */

Is it always guaranteed that pvh_start_info->cmdline_paddr have
MAX_GUEST_CMDLINE size? If yes then...

grub_memset ((void *) pvh_start_info->cmdline_paddr, 0, MAX_GUEST_CMDLINE);
grub_strncpy ((char *) grub_xen_start_page_addr->cmd_line,
              (const char *) pvh_start_info->cmdline_paddr,
	      MAX_GUEST_CMDLINE - 1);

... and you are done...

> +			MAX_GUEST_CMDLINE);
> +          break;
> +        }
> +    }
>  }
>
>  grub_err_t
> diff --git a/grub-core/kern/main.c b/grub-core/kern/main.c
> index 143a232..b4377d3 100644
> --- a/grub-core/kern/main.c
> +++ b/grub-core/kern/main.c
> @@ -37,6 +37,10 @@
>  #include <grub/machine/memory.h>
>  #endif
>
> +#if defined (GRUB_MACHINE_XEN) || defined (GRUB_MACHINE_XEN_PVH)
> +#include <grub/xen.h>
> +#endif
> +
>  static bool cli_disabled = false;
>  static bool cli_need_auth = false;
>
> @@ -351,6 +355,14 @@ grub_main (void)
>    grub_env_export ("root");
>    grub_env_export ("prefix");
>
> +  /*
> +   * Parse command line parameters from Xen and export them as environment
> +   * variables
> +   */
> +#if defined (GRUB_MACHINE_XEN) || defined (GRUB_MACHINE_XEN_PVH)
> +  grub_parse_xen_cmdline ();

Please move this call to the grub-core/kern/xen/init.c:grub_machine_init().

> +#endif
> +
>    /* Reclaim space used for modules.  */
>    reclaim_module_space ();
>
> diff --git a/grub-core/kern/xen/cmdline.c b/grub-core/kern/xen/cmdline.c
> new file mode 100644
> index 0000000..03dd88f
> --- /dev/null
> +++ b/grub-core/kern/xen/cmdline.c
> @@ -0,0 +1,343 @@
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
> +enum parse_flags
> +{
> +  PARSER_HIT_BACKSLASH = 0x1,
> +  PARSER_IN_SINGLE_QUOTES = 0x2,
> +  PARSER_IN_DOUBLE_QUOTES = 0x4,
> +};
typedef parse_flags parse_flags_t;

... and use parse_flags_t instead below...

And probably this should be a local variable...

> +
> +#define PARSER_BASE_WORD_LEN 16

This constant begs for a few words of comment...

> +static grub_size_t word_list_len;
> +static char **word_list;
> +static grub_size_t current_word_len;
> +static grub_size_t current_word_pos;
> +static char *current_word;
> +static char current_char;

I have a feeling that most if not all of this variables should be
local in a given function...

> +static bool
> +append_char_to_word (bool allow_null)
> +{
> +  /*
> +   * Fail if the current char is outside of the range 0x20 to 0x7E. If
> +   * allow_null is true, make an exception for 0x00. This is a safeguard

Could you elaborate here when allow_null == true is useful?

> +   * against likely-invalid data.
> +   */
> +  if ( (!(current_char >= 0x20) || !(current_char <= 0x7E) )

grub_isprint()?

> +      && (current_char != '\0' || allow_null == false))

I would drop redundant spaces between "(" and ")" and move "&&" to the
end of first line of "if".

> +    return false;
> +
> +  if (current_word_pos == current_word_len)
> +    {
> +      current_word_len *= 2;

You can do this in the argument of the function below...

> +      current_word = grub_realloc (current_word, current_word_len);
> +      if (current_word == NULL)
> +        {
> +          current_word_len /= 2;
> +          return false;
> +        }
> +    }
> +
> +  current_word[current_word_pos] = current_char;
> +  current_word_pos++;

Again, you can do this operation in the "[]" above...

> +  return true;
> +}
> +
> +static bool
> +append_word_to_list (void)
> +{
> +  /* No-op on empty words. */
> +  if (current_word_pos == 0)

This should be probably an argument for the function...

> +    return true;
> +
> +  current_char = '\0';
> +  if (append_char_to_word (true) == false)
> +    {
> +      grub_error (GRUB_ERR_BUG,
> +		  "couldn't append null terminator to word during Xen cmdline parsing");
> +      grub_print_error ();
> +      grub_exit ();
> +    }
> +
> +  current_word_len = grub_strlen (current_word) + 1;
> +  current_word = grub_realloc (current_word, current_word_len);
> +  if (current_word == NULL)
> +    return false;
> +  word_list_len++;

Again this, OK ++word_list_len to be precise, can be done in a function
argument below...

> +  word_list = grub_realloc (word_list, word_list_len * sizeof (char *));
> +  if (word_list == NULL)
> +    return false;
> +  word_list[word_list_len - 1] = current_word;
> +
> +  current_word_len = PARSER_BASE_WORD_LEN;
> +  current_word_pos = 0;
> +  current_word = grub_malloc (current_word_len);
> +  if (current_word == NULL)
> +    return false;
> +
> +  return true;
> +}
> +
> +static bool
> +check_key_is_safe (char *key, grub_size_t len)
> +{
> +  grub_size_t i;
> +
> +  for (i = 0; i < len; i++)
> +  {
> +    /*
> +     * Ensure only a-z, A-Z, and _ are allowed.
> +     */
> +    if (! ( (key[i] >= 'A' && key[i] <= 'Z')
> +          || (key[i] >= 'a' && key[i] <= 'z')

You have whole family of grub_isalpha() functions. Could not use them
here and there?

> +          || (key[i] == '_') ) )
> +      return false;
> +  }
> +  return true;
> +}
> +
> +void
> +grub_parse_xen_cmdline (void)
> +{
> +  const char *cmdline = (const char *) grub_xen_start_page_addr->cmd_line;
> +  grub_size_t cmdline_len;
> +  bool cmdline_valid = false;
> +  char **param_keys = NULL;
> +  char **param_vals = NULL;
> +  grub_size_t param_dict_len = 0;
> +  grub_size_t param_dict_pos = 0;
> +  enum parse_flags parse_flags = 0;
> +  grub_size_t i = 0;
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

I think not all from this valuable comment landed in the documentation.
Please fix it...

> +   */
> +
> +  current_word_len = PARSER_BASE_WORD_LEN;
> +  current_word = grub_malloc (current_word_len);
> +  if (current_word == NULL)
> +    goto cleanup;
> +
> +  for (i = 0; i < MAX_GUEST_CMDLINE; i++)
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
> +		  "Command line from Xen is not NUL-terminated");

GRUB errors usually start with lowercase...

> +      grub_print_error ();
> +      goto cleanup;
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
> +      if (parse_flags & PARSER_HIT_BACKSLASH)

s/parse_flags/parser_state/

> +        {
> +          parse_flags &= ~PARSER_HIT_BACKSLASH;
> +          if (append_char_to_word (false) == false)
> +            goto cleanup;
> +          continue;
> +        }
> +
> +      switch (current_char)
> +        {
> +        case '\\':
> +          /* Backslashes escape arbitrary characters. */
> +          parse_flags |= PARSER_HIT_BACKSLASH;
> +          continue;
> +
> +        case '\'':
> +          /*
> +           * Single quotes suppress word splitting and double quoting until
> +           * the next single quote is encountered.
> +           */
> +          if (parse_flags & PARSER_IN_DOUBLE_QUOTES)
> +            {
> +              if (append_char_to_word (false) == false)
> +                goto cleanup;
> +              continue;
> +            }
> +
> +          parse_flags ^= PARSER_IN_SINGLE_QUOTES;
> +          continue;
> +
> +        case '"':
> +          /*
> +           * Double quotes suppress word splitting and single quoting until
> +           * the next double quote is encountered.
> +           */
> +          if (parse_flags & PARSER_IN_SINGLE_QUOTES)
> +            {
> +              if (append_char_to_word (false) == false)
> +                goto cleanup;
> +              continue;
> +            }
> +
> +          parse_flags ^= PARSER_IN_DOUBLE_QUOTES;
> +          continue;
> +
> +        case ' ':
> +          /* Spaces separate words in the command line from each other. */
> +          if (parse_flags & PARSER_IN_SINGLE_QUOTES
> +              || parse_flags & PARSER_IN_DOUBLE_QUOTES)

I prefer "||" and "&&" at the end of the lines...

> +            {
> +              if (append_char_to_word (false) == false)
> +                goto cleanup;
> +              continue;
> +            }
> +
> +          if (append_word_to_list () == false)

This shows nicely that the function misses arguments...

> +            goto cleanup;
> +          continue;
> +        }
> +
> +      if (append_char_to_word (false) == false)

Ditto...

> +        goto cleanup;
> +    }
> +
> +  if (append_word_to_list () == false)

Ditto...

> +    goto cleanup;
> +
> +  param_keys = grub_malloc (word_list_len * sizeof (char *));
> +  if (param_keys == NULL)
> +    goto cleanup;
> +  param_vals = grub_malloc (word_list_len * sizeof (char *));
> +  if (param_vals == NULL)
> +    goto cleanup;
> +
> +  for (i = 0; i < word_list_len; i++)
> +    {
> +      char *current_word_eq_ptr;
> +
> +      current_word = word_list[i];
> +      current_word_len = grub_strlen (current_word) + 1;
> +      current_word_eq_ptr = grub_strchr (current_word, '=');
> +
> +      if (current_word_eq_ptr)

current_word_eq_ptr != NULL

> +        {
> +          grub_size_t eq_idx = (grub_size_t)(current_word_eq_ptr - current_word);

Missing space after "(grub_size_t)"...

> +          grub_size_t post_eq_len = current_word_len - (eq_idx);

You can drop "()" from eq_idx

> +
> +          if (check_key_is_safe (current_word, eq_idx))

check_key_is_safe() == true

s/check_key_is_safe/is_key_safe/

> +            {
> +              param_dict_pos = param_dict_len;
> +              param_dict_len++;
> +              param_keys[param_dict_pos] = grub_malloc (eq_idx + 1);
> +              if (param_keys == NULL)
> +                goto cleanup;
> +              param_vals[param_dict_pos] = grub_malloc (post_eq_len + 1);
> +              if (param_vals == NULL)
> +                goto cleanup;
> +
> +              grub_strncpy (param_keys[param_dict_pos], current_word,
> +			    eq_idx);

Please do not wrap line here...

> +              grub_strncpy (param_vals[param_dict_pos],
> +			    current_word + eq_idx + 1, post_eq_len);

Please remember that grub_strncpy() may return non-NUL terminated
strings... You should check this everywhere...

> +              param_keys[param_dict_pos][eq_idx] = '\0';
> +              param_vals[param_dict_pos][post_eq_len] = '\0';
> +            }
> +        }
> +      else
> +        {
> +          if (check_key_is_safe (current_word, current_word_len - 1))

check_key_is_safe() == true

> +            {
> +              param_dict_pos = param_dict_len;
> +              param_dict_len++;
> +              param_keys[param_dict_pos] = grub_malloc (current_word_len);
> +              if (param_keys == NULL)
> +                goto cleanup;
> +              param_vals[param_dict_pos] = grub_malloc (2);
> +              if (param_vals == NULL)
> +                goto cleanup;
> +
> +              grub_strncpy (param_keys[param_dict_pos], current_word,
> +			    current_word_len);
> +              grub_strcpy (param_vals[param_dict_pos], "1");
> +            }
> +        }
> +    }
> +
> +  for (i = 0; i < param_dict_len; i++)
> +    {
> +      /*
> +       * Find keys that start with "xen_grub_env_" and export them
> +       * as environment variables.
> +       */
> +      if (grub_strncmp (param_keys[i],
> +			"xen_grub_env_",
> +			sizeof ("xen_grub_env_") - 1) != 0)
> +        continue;
> +      grub_env_set (param_keys[i], param_vals[i]);
> +      grub_env_export (param_keys[i]);

Both functions may fail. Don't we care about that? Should not we print a warning?

> +    }
> +
> + cleanup:
> +  for (i = 0; i < word_list_len; i++)
> +    grub_free (word_list[i]);
> +
> +  for (i = 0; i < param_dict_len; i++)
> +    {
> +      grub_free (param_keys[i]);
> +      grub_free (param_vals[i]);
> +    }
> +
> +  grub_free (param_keys);
> +  grub_free (param_vals);
> +  grub_free (word_list);
> +}

Daniel

