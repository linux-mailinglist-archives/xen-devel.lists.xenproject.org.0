Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E6C895D42B
	for <lists+xen-devel@lfdr.de>; Fri, 23 Aug 2024 19:19:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.782534.1192039 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1shXwX-0000tc-Ev; Fri, 23 Aug 2024 17:19:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 782534.1192039; Fri, 23 Aug 2024 17:19:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1shXwX-0000ru-Ae; Fri, 23 Aug 2024 17:19:21 +0000
Received: by outflank-mailman (input) for mailman id 782534;
 Fri, 23 Aug 2024 17:19:20 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=imIp=PW=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1shXwV-0000ro-T5
 for xen-devel@lists.xenproject.org; Fri, 23 Aug 2024 17:19:20 +0000
Received: from mail-qk1-x72a.google.com (mail-qk1-x72a.google.com
 [2607:f8b0:4864:20::72a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d3ac7e84-6173-11ef-a50a-bb4a2ccca743;
 Fri, 23 Aug 2024 19:19:18 +0200 (CEST)
Received: by mail-qk1-x72a.google.com with SMTP id
 af79cd13be357-7a1dea79e1aso132246585a.1
 for <xen-devel@lists.xenproject.org>; Fri, 23 Aug 2024 10:19:18 -0700 (PDT)
Received: from [10.125.226.166] ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-6c162d49e1asm20598916d6.34.2024.08.23.10.19.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 23 Aug 2024 10:19:15 -0700 (PDT)
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
X-Inumbo-ID: d3ac7e84-6173-11ef-a50a-bb4a2ccca743
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1724433557; x=1725038357; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=lJSCweDSTwWUs38vyHETenZE7V4JOT6YUtYqRS42w8g=;
        b=qg9dOotoyj89nSltULMJN3KFxeD3a2VV1jtInOw9BPltFWhinieFmZ6sY65ltJz0Jq
         /1LKPxvMSyCUFKoS2hV4ISIpN2RAL4t0s3NhJg849f+TZpAxiDhGRCKyUvAXRHSatWl6
         o4hZ0IkMXGp8WVQhNdysD+xeskj4sv/9VlV9o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724433557; x=1725038357;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lJSCweDSTwWUs38vyHETenZE7V4JOT6YUtYqRS42w8g=;
        b=INt7+SLRS/Upc+wpyoH+1G56BAtFeZHLQf7KzfRfS7AdybE3nh6Nv8mdWxRob7kBkt
         AbT2BC5IssqkLLCjBg5OElzao4mW/H+HcZiiUF0y9ChXA5RP+Cte3XoffBPYJNxvNSFb
         LoMwyeay/9EmJeq3lFjfRAmxQQtNb0M9PUz9e/e0bSx1/GNGEOYxp1A71t7HXfaEluHk
         TWRkGHax9r7lYNDAM2jgl9ND6UEZfmRLoxbARItIFouOIFNGy+m7Rxvyyo7vNSCO6GzN
         TEdDIdstYp0rSir4ccfPZq8ni/9dQ65iR0FfUUjUl8Ik2AS07lvVuCMd4PoxDWqeomaK
         hqCQ==
X-Forwarded-Encrypted: i=1; AJvYcCVz7OB6xIzCOWkrbVj7b4c2i5y86l7doiqa8PlA+GeLbyLfiEH3gUrCmYM3NwrqkAA+qq602CyfRLg=@lists.xenproject.org
X-Gm-Message-State: AOJu0YytWy/oAr3Sk32NLNgELY+Vd762ig+Hh6B0wSo8iTEDQ3rRSr9x
	P0x/xPmVyOHEMK1uKECPI2XoWNS8nP3+OFA+FSAI3G+Ne84fx1ST6OuOISUKC+FAZPJ7iJWlHlk
	K
X-Google-Smtp-Source: AGHT+IHvny4c83C6Oo544Qh1orNFcoU1AZ1SD+4veXLV3Ye7wUYdkl5WNe5y2dWa8L24uvszjJF65w==
X-Received: by 2002:a05:6214:54c6:b0:6c1:6f9b:619a with SMTP id 6a1803df08f44-6c16f9b63admr30455566d6.30.1724433556321;
        Fri, 23 Aug 2024 10:19:16 -0700 (PDT)
Message-ID: <da0e9836-33f3-42c3-bda7-53d868a99ae1@citrix.com>
Date: Fri, 23 Aug 2024 18:19:11 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 2/4] ocaml/libs: Implement a dynamically-loaded plugin
 for Xenctrl.domain_getinfo
To: Andrii Sultanov <andrii.sultanov@cloud.com>,
 xen-devel@lists.xenproject.org
Cc: Christian Lindig <christian.lindig@citrix.com>,
 David Scott <dave@recoil.org>, Anthony PERARD <anthony.perard@vates.tech>,
 =?UTF-8?B?RWR3aW4gVMO2csO2aw==?= <edwin.torok@cloud.com>
References: <cover.1724314239.git.andrii.sultanov@cloud.com>
 <6d4b94939c8910ffd7d70301b1d26c828f72ad86.1724314239.git.andrii.sultanov@cloud.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 xsFNBFLhNn8BEADVhE+Hb8i0GV6mihnnr/uiQQdPF8kUoFzCOPXkf7jQ5sLYeJa0cQi6Penp
 VtiFYznTairnVsN5J+ujSTIb+OlMSJUWV4opS7WVNnxHbFTPYZVQ3erv7NKc2iVizCRZ2Kxn
 srM1oPXWRic8BIAdYOKOloF2300SL/bIpeD+x7h3w9B/qez7nOin5NzkxgFoaUeIal12pXSR
 Q354FKFoy6Vh96gc4VRqte3jw8mPuJQpfws+Pb+swvSf/i1q1+1I4jsRQQh2m6OTADHIqg2E
 ofTYAEh7R5HfPx0EXoEDMdRjOeKn8+vvkAwhviWXTHlG3R1QkbE5M/oywnZ83udJmi+lxjJ5
 YhQ5IzomvJ16H0Bq+TLyVLO/VRksp1VR9HxCzItLNCS8PdpYYz5TC204ViycobYU65WMpzWe
 LFAGn8jSS25XIpqv0Y9k87dLbctKKA14Ifw2kq5OIVu2FuX+3i446JOa2vpCI9GcjCzi3oHV
 e00bzYiHMIl0FICrNJU0Kjho8pdo0m2uxkn6SYEpogAy9pnatUlO+erL4LqFUO7GXSdBRbw5
 gNt25XTLdSFuZtMxkY3tq8MFss5QnjhehCVPEpE6y9ZjI4XB8ad1G4oBHVGK5LMsvg22PfMJ
 ISWFSHoF/B5+lHkCKWkFxZ0gZn33ju5n6/FOdEx4B8cMJt+cWwARAQABzSlBbmRyZXcgQ29v
 cGVyIDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tPsLBegQTAQgAJAIbAwULCQgHAwUVCgkI
 CwUWAgMBAAIeAQIXgAUCWKD95wIZAQAKCRBlw/kGpdefoHbdD/9AIoR3k6fKl+RFiFpyAhvO
 59ttDFI7nIAnlYngev2XUR3acFElJATHSDO0ju+hqWqAb8kVijXLops0gOfqt3VPZq9cuHlh
 IMDquatGLzAadfFx2eQYIYT+FYuMoPZy/aTUazmJIDVxP7L383grjIkn+7tAv+qeDfE+txL4
 SAm1UHNvmdfgL2/lcmL3xRh7sub3nJilM93RWX1Pe5LBSDXO45uzCGEdst6uSlzYR/MEr+5Z
 JQQ32JV64zwvf/aKaagSQSQMYNX9JFgfZ3TKWC1KJQbX5ssoX/5hNLqxMcZV3TN7kU8I3kjK
 mPec9+1nECOjjJSO/h4P0sBZyIUGfguwzhEeGf4sMCuSEM4xjCnwiBwftR17sr0spYcOpqET
 ZGcAmyYcNjy6CYadNCnfR40vhhWuCfNCBzWnUW0lFoo12wb0YnzoOLjvfD6OL3JjIUJNOmJy
 RCsJ5IA/Iz33RhSVRmROu+TztwuThClw63g7+hoyewv7BemKyuU6FTVhjjW+XUWmS/FzknSi
 dAG+insr0746cTPpSkGl3KAXeWDGJzve7/SBBfyznWCMGaf8E2P1oOdIZRxHgWj0zNr1+ooF
 /PzgLPiCI4OMUttTlEKChgbUTQ+5o0P080JojqfXwbPAyumbaYcQNiH1/xYbJdOFSiBv9rpt
 TQTBLzDKXok86M7BTQRS4TZ/ARAAkgqudHsp+hd82UVkvgnlqZjzz2vyrYfz7bkPtXaGb9H4
 Rfo7mQsEQavEBdWWjbga6eMnDqtu+FC+qeTGYebToxEyp2lKDSoAsvt8w82tIlP/EbmRbDVn
 7bhjBlfRcFjVYw8uVDPptT0TV47vpoCVkTwcyb6OltJrvg/QzV9f07DJswuda1JH3/qvYu0p
 vjPnYvCq4NsqY2XSdAJ02HrdYPFtNyPEntu1n1KK+gJrstjtw7KsZ4ygXYrsm/oCBiVW/OgU
 g/XIlGErkrxe4vQvJyVwg6YH653YTX5hLLUEL1NS4TCo47RP+wi6y+TnuAL36UtK/uFyEuPy
 wwrDVcC4cIFhYSfsO0BumEI65yu7a8aHbGfq2lW251UcoU48Z27ZUUZd2Dr6O/n8poQHbaTd
 6bJJSjzGGHZVbRP9UQ3lkmkmc0+XCHmj5WhwNNYjgbbmML7y0fsJT5RgvefAIFfHBg7fTY/i
 kBEimoUsTEQz+N4hbKwo1hULfVxDJStE4sbPhjbsPCrlXf6W9CxSyQ0qmZ2bXsLQYRj2xqd1
 bpA+1o1j2N4/au1R/uSiUFjewJdT/LX1EklKDcQwpk06Af/N7VZtSfEJeRV04unbsKVXWZAk
 uAJyDDKN99ziC0Wz5kcPyVD1HNf8bgaqGDzrv3TfYjwqayRFcMf7xJaL9xXedMcAEQEAAcLB
 XwQYAQgACQUCUuE2fwIbDAAKCRBlw/kGpdefoG4XEACD1Qf/er8EA7g23HMxYWd3FXHThrVQ
 HgiGdk5Yh632vjOm9L4sd/GCEACVQKjsu98e8o3ysitFlznEns5EAAXEbITrgKWXDDUWGYxd
 pnjj2u+GkVdsOAGk0kxczX6s+VRBhpbBI2PWnOsRJgU2n10PZ3mZD4Xu9kU2IXYmuW+e5KCA
 vTArRUdCrAtIa1k01sPipPPw6dfxx2e5asy21YOytzxuWFfJTGnVxZZSCyLUO83sh6OZhJkk
 b9rxL9wPmpN/t2IPaEKoAc0FTQZS36wAMOXkBh24PQ9gaLJvfPKpNzGD8XWR5HHF0NLIJhgg
 4ZlEXQ2fVp3XrtocHqhu4UZR4koCijgB8sB7Tb0GCpwK+C4UePdFLfhKyRdSXuvY3AHJd4CP
 4JzW0Bzq/WXY3XMOzUTYApGQpnUpdOmuQSfpV9MQO+/jo7r6yPbxT7CwRS5dcQPzUiuHLK9i
 nvjREdh84qycnx0/6dDroYhp0DFv4udxuAvt1h4wGwTPRQZerSm4xaYegEFusyhbZrI0U9tJ
 B8WrhBLXDiYlyJT6zOV2yZFuW47VrLsjYnHwn27hmxTC/7tvG3euCklmkn9Sl9IAKFu29RSo
 d5bD8kMSCYsTqtTfT6W4A3qHGvIDta3ptLYpIAOD2sY3GYq2nf3Bbzx81wZK14JdDDHUX2Rs
 6+ahAA==
In-Reply-To: <6d4b94939c8910ffd7d70301b1d26c828f72ad86.1724314239.git.andrii.sultanov@cloud.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 22/08/2024 10:06 am, Andrii Sultanov wrote:
> This plugin intends to hide the unstable Xenctrl interface under a
> stable one. In case of the change in the interface, a V2 of this plugin
> would need to be produced, but V1 with the old interface would
> need to be kept (with potential change in the implementation) in the
> meantime.
>
> To reduce the need for such changes in the future, this plugin only
> provides the absolute minimum functionality that Oxenstored uses - only
> four fields of the domaininfo struct are used and presented here.
>
> Oxenstored currently uses the single-domain domain_getinfo function,
> whereas Cxenstored uses the more-efficient domain_getinfolist. Both of
> these are provided in the plugin to allow a transition from one to the
> other without modifying the interface in the future. Both return
> identical structures and rely on the same fields in xenctrl, thus if one
> of them breaks, both will break, and a new version of the interface would
> need to be issued.
>
> Signed-off-by: Andrii Sultanov <andrii.sultanov@cloud.com>
> ---
>  tools/ocaml/Makefile                          |   1 +
>  tools/ocaml/Makefile.rules                    |  17 +-

This patch is already very big.  One minor way to help would be to split
out the changes to Makefile.rules as a separate "build infrastructure
for Ocaml dynamic libraries".

>  tools/ocaml/libs/Makefile                     |   2 +-
>  tools/ocaml/libs/xenstoredglue/META.in        |   4 +
>  tools/ocaml/libs/xenstoredglue/Makefile       |  39 ++++
>  .../domain_getinfo_plugin_v1/META.in          |   5 +
>  .../domain_getinfo_plugin_v1/Makefile         |  38 ++++
>  .../domain_getinfo_stubs_v1.c                 | 169 ++++++++++++++++++
>  .../domain_getinfo_v1.ml                      |  51 ++++++
>  .../domain_getinfo_v1.mli                     |   0
>  .../libs/xenstoredglue/plugin_interface_v1.ml |  25 +++
>  .../xenstoredglue/plugin_interface_v1.mli     |  34 ++++
>  12 files changed, 383 insertions(+), 2 deletions(-)
>  create mode 100644 tools/ocaml/libs/xenstoredglue/META.in
>  create mode 100644 tools/ocaml/libs/xenstoredglue/Makefile
>  create mode 100644 tools/ocaml/libs/xenstoredglue/domain_getinfo_plugin_v1/META.in
>  create mode 100644 tools/ocaml/libs/xenstoredglue/domain_getinfo_plugin_v1/Makefile
>  create mode 100644 tools/ocaml/libs/xenstoredglue/domain_getinfo_plugin_v1/domain_getinfo_stubs_v1.c
>  create mode 100644 tools/ocaml/libs/xenstoredglue/domain_getinfo_plugin_v1/domain_getinfo_v1.ml
>  create mode 100644 tools/ocaml/libs/xenstoredglue/domain_getinfo_plugin_v1/domain_getinfo_v1.mli
>  create mode 100644 tools/ocaml/libs/xenstoredglue/plugin_interface_v1.ml
>  create mode 100644 tools/ocaml/libs/xenstoredglue/plugin_interface_v1.mli

Peeking at your specfile change for XenServer too, I see that the only
new file packaged is:

%{_libexecdir}/%{name}/bin/xenctrl_plugin/domain_getinfo_v1.cmxs

So does this mean that the rest of xenstoredglue is just a build-time
requirement for oxenstored?

If so, then surely we'll still need to package it in
xen-ocaml-{libs,devel}, so an out-of-tree oxenstored can build?


Who should own plugin ABIs?  Logically it ought to oxenstored, but the
way this is structured, it's looks like its Xen which would end up
owning it.


Are we expecting to get one cmxs per $THING-$VERSION?  xenctrl_plugin is
a bit generic, and it probably ought to have xenstoredglue somewhere in
the path.

Talking of, can we call it xenstored-glue or perhaps just xsd-glue?  Or
will Ocaml's sensitivity around names get in our way?

Are there any standards on Ocaml dynamic libraries, or are we playing in
rare waters here?


> diff --git a/tools/ocaml/libs/xenstoredglue/domain_getinfo_plugin_v1/domain_getinfo_stubs_v1.c b/tools/ocaml/libs/xenstoredglue/domain_getinfo_plugin_v1/domain_getinfo_stubs_v1.c
> new file mode 100644
> index 0000000000..a29ac7c877
> --- /dev/null
> +++ b/tools/ocaml/libs/xenstoredglue/domain_getinfo_plugin_v1/domain_getinfo_stubs_v1.c
> @@ -0,0 +1,169 @@
> +#define _XOPEN_SOURCE 600

This is very unlikely to be relevant.  It probably wants dropping from
elsewhere in Xen too.

> +#include <stdlib.h>
> +#include <errno.h>
> +
> +#define CAML_NAME_SPACE
> +#include <caml/alloc.h>
> +#include <caml/memory.h>
> +#include <caml/signals.h>
> +#include <caml/fail.h>
> +#include <caml/callback.h>
> +#include <caml/custom.h>
> +
> +#include <xen-tools/common-macros.h>
> +
> +#include <string.h>

Given the other sorting, this wants to be up by stdlib.

> +#define XC_WANT_COMPAT_MAP_FOREIGN_API

This is definitely not needed by this stub.

> +#include <xenctrl.h>
> +
> +#define ERR_MSG_LEN (XC_MAX_ERROR_MSG_LEN + 6)
> +#define MAX_FUNC_LINE_LEN 64
> +#define failwith_xc_v1(xch) xsglue_failwith_xc(xch, __FUNCTION__, __LINE__)
> +
> +// This is a minimal stub to xenctrl for oxenstored's purposes
> +// For the full xenctrl stubs, see tools/ocaml/libs/xc/xenctrl_stubs.c

Xen style is to use /* */ uniformly.  (Xen really does predate C++
comments being commonly supported in C compilers.)

> +
> +static inline xc_interface *xsglue_xch_of_val_v1(value v)
> +{
> +	xc_interface *xch = *(xc_interface **)Data_custom_val(v);
> +
> +	return xch;
> +}
> +
> +static void xsglue_xenctrl_finalize(value v)
> +{
> +	xc_interface *xch = xsglue_xch_of_val_v1(v);
> +
> +	xc_interface_close(xch);
> +}
> +
> +static struct custom_operations xsglue_xenctrl_ops = {
> +	.identifier  = "xenctrl",
> +	.finalize    = xsglue_xenctrl_finalize,
> +	.compare     = custom_compare_default,     /* Can't compare     */
> +	.hash        = custom_hash_default,        /* Can't hash        */
> +	.serialize   = custom_serialize_default,   /* Can't serialize   */
> +	.deserialize = custom_deserialize_default, /* Can't deserialize */
> +	.compare_ext = custom_compare_ext_default, /* Can't compare     */
> +};
> +
> +static void Noreturn xsglue_failwith_xc(xc_interface *xch,
> +		char const* func,
> +		int line)

const char *func, unsigned int line)

Unless you think there's a likelyhood that we'll get errors from a
negative line number.

> +{
> +	char error_str[ERR_MSG_LEN + MAX_FUNC_LINE_LEN];
> +	size_t str_len = 0;
> +	if (xch) {
> +		const xc_error *error = xc_get_last_error(xch);
> +		if (error->code == XC_ERROR_NONE)
> +			str_len = snprintf(error_str, ERR_MSG_LEN,
> +				           "%d: %s", errno, strerror(errno));
> +		else
> +			str_len = snprintf(error_str, ERR_MSG_LEN,
> +				      	   "%d: %s: %s", error->code,
> +					   xc_error_code_to_desc(error->code),
> +					   error->message);
> +	} else {
> +		str_len = snprintf(error_str, ERR_MSG_LEN,
> +			           "Unable to open XC interface");
> +	}
> +	str_len = str_len < ERR_MSG_LEN ? str_len : ERR_MSG_LEN;
> +	// Log caller's source code function and line
> +	snprintf(error_str+str_len, MAX_FUNC_LINE_LEN,
> +                 " - called from %s:%d", func, line);
> +	caml_raise_with_string(*caml_named_value("xsg.error"), error_str);

There's a lot of complexity here, not least because of trying to handle
the !xch special case.

But, to begin with, what is xsg.error?  I see there's a registration of
something by that name.  Is the Error referenced there the `exception
Error of string` from the module?

If so, what happens if we get a v2 module?  Won't we get a clash on the
name of this exception?


For the string handling, life is too short for fixed bounds like this. 
I'd recommend something more of the form:

...
        const xc_error *error = xch ? xc_get_last_error(xch) : NULL;
        char *str = NULL;
        CAMLlocal1(msg);

#define ERR (error && error->code != XC_ERROR_NONE)

        asprintf(&str,
                 "%d: %s%s%s - called from %s:%u"
                 ERR ? error->code : errno,
                 ERR ? xc_error_code_to_desc(error->code) : strerror(errno),
                 ERR ? ": " : "",
                 ERR ? error->message : "",
                 func, line);

#endif

        if (!*str)
                caml_raise_out_of_memory();

        msg = caml_copy_string(str);
        free(str);

        caml_raise_with_arg(*caml_named_value("xsg.error"), msg);
}

This has the property that even in the !xsh special case, it still
renders errno which might be helpful when debugging.

> +}
> +
> +CAMLprim value stub_xsglue_xc_interface_open(value unit)
> +{
> +	CAMLparam1(unit);
> +	CAMLlocal1(result);
> +	xc_interface *xch;
> +
> +	result = caml_alloc_custom(&xsglue_xenctrl_ops, sizeof(xch), 0, 1);
> +
> +	caml_enter_blocking_section();
> +	xch = xc_interface_open(NULL, NULL, 0);
> +	caml_leave_blocking_section();
> +
> +	if ( !xch )

This wants to be `if (!xch)` to match the rest of the file style.

> +		failwith_xc_v1(xch);
> +
> +	*(xc_interface **)Data_custom_val(result) = xch;
> +
> +	CAMLreturn(result);
> +}
> +
> +static value xsglue_alloc_domaininfo_v1(xc_domaininfo_t * info)

xc_domaininfo_t *info

And probably a const for good measure.

> +{
> +	CAMLparam0();
> +	CAMLlocal1(result);
> +	result = caml_alloc_tuple(4);
> +
> +	Store_field(result,  0, Val_int(info->domain));
> +	Store_field(result,  1, Val_bool(info->flags & XEN_DOMINF_dying));
> +	Store_field(result,  2, Val_bool(info->flags & XEN_DOMINF_shutdown));
> +	Store_field(result,  3, Val_int(MASK_EXTR(info->flags, XEN_DOMINF_shutdownmask)));
> +
> +	CAMLreturn(result);
> +}
> +
> +CAMLprim value stub_xsglue_xc_domain_getinfo(value xch_val, value domid)
> +{
> +	CAMLparam2(xch_val, domid);
> +	CAMLlocal1(result);
> +	xc_interface *xch = xsglue_xch_of_val_v1(xch_val);
> +	xc_domaininfo_t info;
> +	int ret;
> +
> +	ret = xc_domain_getinfo_single(xch, Int_val(domid), &info);
> +	if (ret < 0)
> +		failwith_xc_v1(xch);
> +
> +	result = xsglue_alloc_domaininfo_v1(&info);
> +
> +	CAMLreturn(result);
> +}
> +
> +CAMLprim value stub_xsglue_xc_domain_getinfolist(value xch_val, value first_domain, value nb)
> +{
> +	CAMLparam3(xch_val, first_domain, nb);
> +	CAMLlocal2(result, temp);
> +	xc_interface *xch = xsglue_xch_of_val_v1(xch_val);
> +	xc_domaininfo_t * info;
> +	int i, ret, toalloc, retval;
> +	unsigned int c_max_domains;
> +	uint32_t c_first_domain;
> +
> +	/* get the minimum number of allocate byte we need and bump it up to page boundary */
> +	toalloc = (sizeof(xc_domaininfo_t) * Int_val(nb)) | 0xfff;
> +	ret = posix_memalign((void **) ((void *) &info), 4096, toalloc);
> +	if (ret)
> +		caml_raise_out_of_memory();
> +
> +	result = temp = Val_emptylist;
> +
> +	c_first_domain = Int_val(first_domain);
> +	c_max_domains = Int_val(nb);
> +	caml_enter_blocking_section();
> +	retval = xc_domain_getinfolist(xch, c_first_domain,
> +				       c_max_domains, info);
> +	caml_leave_blocking_section();
> +
> +	if (retval < 0) {
> +		free(info);
> +		failwith_xc_v1(xch);
> +	}
> +	for (i = 0; i < retval; i++) {
> +		result = caml_alloc_small(2, Tag_cons);
> +		Field(result, 0) = Val_int(0);

The is Val_none, isn't it?

I've got a patch I should dust off to provide some C stub compatibility
for Ocaml < 4.12, which at least introduces some of the more common naming.

> +		Field(result, 1) = temp;
> +		temp = result;
> +
> +		Store_field(result, 0, xsglue_alloc_domaininfo_v1(info + i));
> +	}
> +
> +	free(info);
> +	CAMLreturn(result);
> +}
> diff --git a/tools/ocaml/libs/xenstoredglue/domain_getinfo_plugin_v1/domain_getinfo_v1.ml b/tools/ocaml/libs/xenstoredglue/domain_getinfo_plugin_v1/domain_getinfo_v1.ml
> new file mode 100644
> index 0000000000..d8947b618f
> --- /dev/null
> +++ b/tools/ocaml/libs/xenstoredglue/domain_getinfo_plugin_v1/domain_getinfo_v1.ml
> @@ -0,0 +1,51 @@
> +(** Minimal interface on top of unstable Xenctrl for Oxenstored's usage *)
> +
> +(** For the full Xenctrl interface, see: tools/ocaml/libs/xc/ *)
> +
> +module M : Plugin_interface_v1.Domain_getinfo_V1 = struct
> +  exception Error of string
> +
> +  type domid = int
> +  type handle
> +
> +  type domaininfo = {
> +    domid : domid;
> +    dying : bool;
> +    shutdown : bool;
> +    shutdown_code : int;

I see Xenctrl uses this as an int too, but do we want to consider

type shutdown_code =
  | SHUTDOWN_poweroff
  | SHUTDOWN_reboot
  | SHUTDOWN_suspend
  | SHUTDOWN_crash
  | SHUTDOWN_watchdog
  | SHUTDOWN_soft_reset

One awkward thing is that the shutdown_code isn't valid unless the
shutdown bool is true, but we could fix this by having:

type domaininfo = {
  domid : domind;
  shutdown : Some shutdown_code;
}

One downside is that we'd have to bump the interface version when adding
new constants, and we'd have to be very careful not to generate a bad
SHUTDOWN_* constant as far as Ocaml is concerned.

I'm on the fence, but it's something to consider before we set the ABI
in stone.

> +  }
> +
> +  external interface_open : unit -> handle = "stub_xsglue_xc_interface_open"
> +
> +  external domain_getinfo : handle -> domid -> domaininfo
> +    = "stub_xsglue_xc_domain_getinfo"
> +
> +  external __domain_getinfolist : handle -> domid -> int -> domaininfo list
> +    = "stub_xsglue_xc_domain_getinfolist"
> +
> +  let domain_getinfolist handle first_domain =
> +    (* [rev_concat lst] is equivalent to [lst |> List.concat |> List.rev]
> +     * except it is tail recursive, whereas [List.concat] isn't.
> +     * Example:
> +     * rev_concat [[10;9;8];[7;6];[5]]] = [5; 6; 7; 8; 9; 10]
> +     *)
> +    let rev_append_fold acc e = List.rev_append e acc in
> +    let rev_concat lst = List.fold_left rev_append_fold [] lst in
> +
> +    let nb = 1024 in
> +    let rec __getlist lst from =
> +      (* _domain_getinfolist returns domains in reverse order, largest first *)
> +      match __domain_getinfolist handle from nb with
> +      | [] -> rev_concat lst
> +      | hd :: _ as l -> __getlist (l :: lst) (hd.domid + 1)
> +    in
> +    __getlist [] first_domain

This (and the C) was a hack to avoid being too invasive at the time
(iirc, it was a Xenctrl interface used by Xenopsd and we didn't want to
change the API), but it's racy when there are more than @nb domains running.

The problem is that in between the multiple hypercalls, you've dropped
Xen's domlist lock, and e.g. a new domain with a lower domid could have
come into existence.  This doesn't matter for most things, but
Oxenstored is the authoritative source of which domains are alive or
not, and it does need to be accurate.

Oxenstored really does need to make a single hypercall asking for all
32k domains in order to get a coherent view.  This is how Cxenstored works.

However, we can do this from within C and also not double-process the
resulting list.

On that subject, is list the right thing here, or would an array be
better?  One has less in the way of pointer chasing than the other,
although whether it makes any appreciable difference is a different
question.

> +
> +  let _ = Callback.register_exception "xsg.error" (Error "register_callback")
> +end
> +
> +let () =
> +  Printf.printf "Registration of %s plugin started\n%!" __MODULE__;
> +  Plugin_interface_v1.register_plugin_v1
> +    (module M : Plugin_interface_v1.Domain_getinfo_V1);
> +  Printf.printf "Registration of %s plugin successful\n%!" __MODULE__

Its rude for libraries to make assumptions about stdout.  Indeed,
oxenstored uses syslog() rather than stdout.

If this can't be hooked into Oxenstored's logging infrastructure, then
the printf() want gating on some kind of debug setting, most likely an
environment variable.

~Andrew

