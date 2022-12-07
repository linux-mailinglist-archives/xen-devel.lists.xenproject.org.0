Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9407C645D90
	for <lists+xen-devel@lfdr.de>; Wed,  7 Dec 2022 16:23:51 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.456401.714182 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p2wGN-0004lF-P9; Wed, 07 Dec 2022 15:23:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 456401.714182; Wed, 07 Dec 2022 15:23:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p2wGN-0004iV-Lu; Wed, 07 Dec 2022 15:23:11 +0000
Received: by outflank-mailman (input) for mailman id 456401;
 Wed, 07 Dec 2022 15:23:09 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=NsCr=4F=citrix.com=prvs=333ae5379=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1p2wGL-0004iP-PZ
 for xen-devel@lists.xenproject.org; Wed, 07 Dec 2022 15:23:09 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0c47adf4-7643-11ed-8fd2-01056ac49cbb;
 Wed, 07 Dec 2022 16:23:07 +0100 (CET)
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
X-Inumbo-ID: 0c47adf4-7643-11ed-8fd2-01056ac49cbb
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1670426587;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=1SskvU+UKp/+GvzUEJ43cXHCi0V/xqV1sS9n7CwSkFg=;
  b=INBuaXJBANyP9NgehzXL2xWEIDLAMYVFD+lzQxHQvHQumQDtVllqXuns
   Afy1hzRdTTbpyROJAOyjDT2XIEc31CpdcObCRS7OBsFfewU6T1aSaSOJx
   uX8xY91Uzx8gIfAAmzH+JqyGisrYCnov/7nWBCodz/VmaY8b9brLSxFpT
   4=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 4.0
X-MesageID: 87080960
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:7GaMKatvu/ZAas89YwfCBBWB5+fnVGBeMUV32f8akzHdYApBsoF/q
 tZmKW+CPvfeYGXze4twaojg80hXu8TTz9UwQFNkrH0wFipD+JbJXdiXEBz9bniYRiHhoOCLz
 O1FM4Wdc5pkJpP4jk3wWlQ0hSAkjclkfpKlVKiffHg0HVU/IMsYoUoLs/YjhYJ1isSODQqIu
 Nfjy+XSI1bg0DNvWo4uw/vrRChH4bKj5lv0gnRkPaoR5QWGyCFPZH4iDfrZw0XQE9E88tGSH
 44v/JnhlkvF8hEkDM+Sk7qTWiXmlZaLYGBiIlIPM0STqkAqSh4ai87XB9JFAatjsB2bnsgZ9
 Tl4ncfYpTHFnEH7sL91vxFwS0mSNEDdkVPNCSDXXce7lyUqf5ZwqhnH4Y5f0YAwo45K7W9yG
 fMweQ8Vc0qfiOaK2OyyUdQ0xcYIC9LAFdZK0p1g5Wmx4fcORJnCR+PB5MNC3Sd2jcdLdRrcT
 5NHM3w1Nk2GOkARfAdMYH49tL7Aan3XejtEqFWTtOwv7nLa1gBZ27nxKtvFPNeNQK25m27I+
 TqWpzWnWnn2MvSl6jqm3C6LudTrgGDKcrlNBZyx1t1T1Qj7Kms7V0RNCArTTeOCoky3Xd5FO
 lEX0iUrpKk2skesS7HVQBmQsHOC+BkGVLJ4FuQg7QiXx6n84gCHB3MFRDpMdNwnssAtQTUgk
 FSOmrvBFTFp9bGYV3+Z3rOVti+pfzgYK3cYYi0JRhdD5MPsyLzflTqWEIwlSvTsyISoR3egm
 FhmsRTSmZ1CstYWjbm0+Wzf3Tu3m8CKTCUS/S7+CzfNAhxCWKapYImh6F7+5PlGLZqEQlTpg
 EXoi/Ry/8hVU8jTyXXlrPElWejwuq3baGG0bUtHRcFJyti7x5K0kWm8ChlaLVwhDMsLcCSBj
 KT76VIIv8870JdHgMZKj2ON5yYCl/CI+TfNDKq8gj9yjn9ZKme6ENlGPxL44owUuBFEfVsDE
 Zmaa92wKn0RFL5qyjG7L89Ej+BznX1nmzuKG8imp/hC7VZ5TCfEIYrpzXPUNrxphE96iFq9H
 ylj2zuilEwEDbyWjtj/+o8PN1EaRUXX9rivw/G7gtWre1I8cEl4Uq+5/F/UU9A990ijvruSr
 y7Vt44x4AaXuEAr3i3QNSA6Oe2wAcsnxZ/5VAR1VWuVN7EYSd7HxM8im1EfJOlPGDBLpRKsc
 8Q4Rg==
IronPort-HdrOrdr: A9a23:8urx3KOKRJhM7MBcTnqjsMiBIKoaSvp037Dk7SFMoHtuA6qlfq
 GV7ZMmPHrP4gr5N0tMpTntAsW9qDbnhP1ICWd4B8bfYOCkghrUEGlahbGSvAEIYheOiNK1t5
 0BT0EOMqyVMbEgt7eC3ODQKb9Jq+VvsprY59s2qU0DcegAUdAE0+4WMGim+2RNNXh7LKt8Op
 qAx9ZN4wGtcW4Qaa2AdwM4dtmGid3XtY7sJSULDR4/6AWIkFqTmcXHOind8BcCci9FhYwv+2
 jdkwD/++GKvvyhxgXHvlWjn6h+qZ/OysZjGMfJsMQTJzn24zzYHLhcZw==
X-IronPort-AV: E=Sophos;i="5.96,225,1665460800"; 
   d="scan'208";a="87080960"
Date: Wed, 7 Dec 2022 15:22:46 +0000
From: Anthony PERARD <anthony.perard@citrix.com>
To: Marek =?iso-8859-1?Q?Marczykowski-G=F3recki?=
	<marmarek@invisiblethingslab.com>
CC: <xen-devel@lists.xenproject.org>, Jason Andryuk <jandryuk@gmail.com>, "Wei
 Liu" <wl@xen.org>
Subject: Re: [PATCH 1/2] vchan-socket-proxy: add reconnect marker support
Message-ID: <Y5CvxjkqB2qIKVz3@perard.uk.xensource.com>
References: <20220905135019.3749982-1-marmarek@invisiblethingslab.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220905135019.3749982-1-marmarek@invisiblethingslab.com>

On Mon, Sep 05, 2022 at 03:50:18PM +0200, Marek Marczykowski-Górecki wrote:
> +                reconnect_marker_value = atoi(optarg);

atoi() isn't great, if there's garbage it just return 0, which is
validated below.

Would there be value here in using strtol() which can detect input
error? To at least help with maybe hard to debug issues?

> +                if (reconnect_marker_value < 0 || reconnect_marker_value > 255) {
> +                    fprintf(stderr, "invalid argument for --reconnect-marker, "
> +                                    "must be a number between 0 and 255\n");
> +                    usage(argv);
> +                }
> +                break;
>              case '?':
>                  usage(argv);
>          }
> @@ -509,6 +549,15 @@ int main(int argc, char **argv)
>                  ret = 1;
>                  break;
>              }
> +            if (reconnect_marker_value != -1) {
> +                const char marker_buf[] = { reconnect_marker_value };
> +
> +                if (libxenvchan_write(state.ctrl, marker_buf, sizeof(marker_buf))
> +                        != sizeof(marker_buf)) {
> +                    fprintf(stderr, "failed to send reconnect marker\n");

Is this an expected failure? If so, maybe adding "(ignored)" might be
valuable to someone reading the logs?

> +                    break;
> +                }
> +            }
>              if (data_loop(&state) != 0)
>                  break;
>              /* don't reconnect if output was stdout */


Otherwise, the patch looks fine. Even if kept as is:
Acked-by: Anthony PERARD <anthony.perard@citrix.com>

Thanks,

-- 
Anthony PERARD

