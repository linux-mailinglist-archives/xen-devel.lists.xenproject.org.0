Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 13E97492362
	for <lists+xen-devel@lfdr.de>; Tue, 18 Jan 2022 10:57:02 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.258417.444985 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n9lDZ-00008j-BH; Tue, 18 Jan 2022 09:55:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 258417.444985; Tue, 18 Jan 2022 09:55:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n9lDZ-00006i-8D; Tue, 18 Jan 2022 09:55:57 +0000
Received: by outflank-mailman (input) for mailman id 258417;
 Tue, 18 Jan 2022 09:55:55 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=4BW1=SC=citrix.com=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1n9lDX-00006c-8V
 for xen-devel@lists.xenproject.org; Tue, 18 Jan 2022 09:55:55 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d12cbfd8-7844-11ec-9bbc-9dff3e4ee8c5;
 Tue, 18 Jan 2022 10:55:53 +0100 (CET)
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
X-Inumbo-ID: d12cbfd8-7844-11ec-9bbc-9dff3e4ee8c5
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1642499752;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=ZuOli/wuQtowMR4L5j91WuiavUS/ZEtkZ+CwtGm8Rvs=;
  b=I16yQwxSl0akMTeJSCFqjF5RtuMcNZmrhVkFMnH9J5pzPqgdvMwYK1Qg
   0X2CHRFTcNs/W6nQwc6hy4faCo1ExqUBoNkMY6U3P/V5VZLvuRNzIHzsP
   bNaQhwlybFbzQHdo1/zhLTYoz+SEGFP8+tDXh1ydAqmnQs+w8QBv3lq+9
   E=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: Eno0jErlkLeZJJsbRB7lqKy3FbDrGmDiQQ7Og7L/612FLm1Jz4PcT/9gL5jBNXjtDIyqXDM4WC
 gq5KqCw31SlLzKKzkvpJ6n1ROt00CZrkWCt7WazD+PT1ON0IX3HyXKW2NYigUrK7RL/vsS8Gc6
 2mMnomiujcQx1FMlc5iGWOSZ5GXYpMyuKgkS0d+9SLAnS30DP9YTelGAPR+EGVdXFBUREZJiG0
 M3a/RjAo1jqoprD2Q+KMzuBAXcoU9gQyRPVS7KBSV3/gKHo+og+J5OkfckPnjV/4TjeuopHfQa
 aJMqQ+bD0uRUsz0ckRcOdl7F
X-SBRS: 5.2
X-MesageID: 62206003
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:TkaU56szISD6q9Uom0aR5ZptcOfnVLBZMUV32f8akzHdYApBsoF/q
 tZmKT/XbvaJZWTyL9B3OYTk9xkAvcXdx4JrT1E9/Cw1RSlE+JbJXdiXEBz9bniYRiHhoOOLz
 Cm8hv3odp1coqr0/0/1WlTZQP0VOZigHtIQMsadUsxKbVIiGHdJZS5LwbZj2NYx2IjhWmthh
 PupyyHhEA79s9JLGjp8B5Kr8HuDa9yr5Vv0FnRnDRx6lAe2e0s9VfrzFonoR5fMeaFGH/bSe
 gr25OrRElU1XfsaIojNfr7TKiXmS1NJVOSEoiI+t6OK2nCuqsGuu0qS2TV1hUp/0l20c95NJ
 Npll82ARQIYYJL3xsctczRzQmZDDY9f9+qSSZS/mZT7I0zudnLtx7NlDV0sPJ1e8eFyaY1M3
 aVGcnZXNEnF3r/ohuLgIgVvrp1LwM3DNYUDunZm3HfBAOwvW5zrSKTW/95Imjw3g6iiGN6AP
 ZBBN2I3N3wsZTUTCnIPUNEfttv1j3SifgZ9tEuf+LAetj27IAtZj+G2bYu9lsaxbcdahEGDv
 Urd4n/0RBodMbS3yzCI73atje/nhj7gVcQZE7jQ3u5nhhify3IeDDUSVECnur+ph0imQdVdJ
 kcIvC00osAa60iDXtT7GRqirxa5UgU0AoQKVbdgsUfUl/SSs13x6nU4oiBpSo0WuMoHGwMRi
 Hy5v/7CVHtSgJ+MRifInluLlg+aNS8QJG4EQCYLSwoZ/tXuyL0OYgLzosVLS/Ds0ICscd3k6
 3XT9XVl2e1P5SIe//zjpQivvt66mnTeoufZDC3zV3nt0A52bZXNi2eAuQmCtqYowGp0ozC8U
 Jk4dyq2sbhm4XKlznXlrAAx8FeBvant3Nr02w8HInXZ327xk0NPhKgJiN2EGG9nM9wfZRjia
 1LJtAVa6fd7ZSX2N/MrP9PvV59wkMAM8OgJsNiOMbKihbArJWe6ENxGPxbMjwgBbmBx+U3AB
 XtrWZn1VitLYUiW5DG3W/0cwdcWKtMWngvuqWTA503/i9K2PSfNIZ9caQfmRr1nsMus/VuEm
 /4CZ5ri40gOC4XWP3iImbP/2HhXdxDX87is9ZwOHgNCSyI7cFwc5wj5muJ+K9c7zvUMxo8lP
 BiVAydl9bY2vlWfQS3iV5ypQOmHsU9XoS1pMCoyE0yv3nR/M4+j4L1GL8k8fKU99fwlxvlxF
 qFXd8KFC/VJazLG5zVCMsWt8N08LEym1VCUIi6oQDkjZJo8FQbHzcDpI1n0/y4UAyvp6cZn+
 ++81hnWSIYoThh5CJqEc+qmyl685CBPmO97U0bSDMNUfUHgrNpjJyDr16dlKMAQMxTTgDCd0
 l/OUxsfoODMpa4z8cXI2v/Y/9v4TbMmExMDTWfB7LuwOS3LxUaZwNdNALSSYDTQdGLo46H+N
 +9b+O7xba8cl1FQvosiT7sylfAi58HirqNxxxh/GCmZdEyiD75tLyXU3cRLsaERlLZVtRHvB
 xCK89hef76IJNnkABgaIw98NraP0vQdmz/z6/UpIRqluH8rreTfCUgCbQORjCF9LaduNNJ3y
 Ogsj8ca9gijh0d4Kd2BlC1VqzyBI3Fov3/LbX3G7FsHUjYW92w=
IronPort-HdrOrdr: A9a23:GzCYUKiqx3CAOrU1YfDe3au07XBQXt4ji2hC6mlwRA09TyX+rb
 HIoB17726RtN91YhodcL+7VJVoLUmyyXcX2+ks1NWZMjUO0VHAROsO0WKI+VzdMhy72ulB1b
 pxN4hSYeeAaGSSVPyKgzVQxexQouW6zA==
X-IronPort-AV: E=Sophos;i="5.88,297,1635220800"; 
   d="scan'208";a="62206003"
Date: Tue, 18 Jan 2022 09:55:45 +0000
From: Anthony PERARD <anthony.perard@citrix.com>
To: Roger Pau Monne <roger.pau@citrix.com>
CC: <xen-devel@lists.xenproject.org>, Wei Liu <wl@xen.org>, Juergen Gross
	<jgross@suse.com>, Jan Beulich <jbeulich@suse.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>
Subject: Re: [PATCH v6 01/12] libs/guest: move cpu policy related prototypes
 to xenguest.h
Message-ID: <YeaOoQ1ELpJpL/cg@perard>
References: <20220117094827.16756-1-roger.pau@citrix.com>
 <20220117094827.16756-2-roger.pau@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220117094827.16756-2-roger.pau@citrix.com>

On Mon, Jan 17, 2022 at 10:48:16AM +0100, Roger Pau Monne wrote:
> Do this before adding any more stuff to xg_cpuid_x86.c.
> 
> The placement in xenctrl.h is wrong, as they are implemented by the
> xenguest library. Note that xg_cpuid_x86.c needs to include
> xg_private.h, and in turn also fix xg_private.h to include
> xc_bitops.h. The bitops definition of BITS_PER_LONG needs to be
> changed to not be an expression, so that xxhash.h can use it in a
> preprocessor if directive.
> 
> As a result also modify xen-cpuid and the ocaml stubs to include
> xenguest.h.

Adding xenguest.h to ocaml stub has been done so it isn't part of this
patch anymore ;-).

> Reported-by: Andrew Cooper <andrew.cooper3@citrix.com>
> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>

Acked-by: Anthony PERARD <anthony.perard@citrix.com>

Thanks,

-- 
Anthony PERARD

