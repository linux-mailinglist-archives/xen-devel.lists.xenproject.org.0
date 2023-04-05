Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DFDC06D8157
	for <lists+xen-devel@lfdr.de>; Wed,  5 Apr 2023 17:15:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.518571.805268 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pk4qk-0004Ip-2r; Wed, 05 Apr 2023 15:15:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 518571.805268; Wed, 05 Apr 2023 15:15:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pk4qj-0004FS-W0; Wed, 05 Apr 2023 15:15:01 +0000
Received: by outflank-mailman (input) for mailman id 518571;
 Wed, 05 Apr 2023 15:15:00 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=4lP2=74=citrix.com=prvs=452340087=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1pk4qi-0004FH-Dq
 for xen-devel@lists.xenproject.org; Wed, 05 Apr 2023 15:15:00 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9f4a7723-d3c4-11ed-b464-930f4c7d94ae;
 Wed, 05 Apr 2023 17:14:57 +0200 (CEST)
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
X-Inumbo-ID: 9f4a7723-d3c4-11ed-b464-930f4c7d94ae
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1680707697;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=EJ3ev2JBehdWtPeyrAnBZaPmtmxUVr18gM35xQh8XrI=;
  b=ZWjvMY9iypUv4t4Edm2mCdtYVPyqaAWjY64mOgjepXB9T06ulkeCjym5
   mjOoChhX3AmkTj/fe7WVhFwrEilCpXiZAq733V7I60elfxptr0tknE+MN
   TM+sRY8wEhEIQ7VahznJ235p0O0PaIo9Ta3zsTboKqODYJC7bO/JOEQnC
   g=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 4.0
X-MesageID: 104465613
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.123
X-Policy: $RELAYED
IronPort-Data: A9a23:LVFSxqlOxkdm7OGEc2OAvhvo5gxnJkRdPkR7XQ2eYbSJt1+Wr1Gzt
 xIdX2CHaPqCNGTzetEkOY+28ENS75LSndA3T1Fk+Xg2QyMWpZLJC+rCIxarNUt+DCFhoGFPt
 JxCN4aafKjYaleG+39B55C49SEUOZmgH+a6U6icfHgqH2eIcQ954Tp7gek1n4V0ttawBgKJq
 LvartbWfVSowFaYCEpNg064gE4p7aSaVA8w5ARkPqgX5AKGzRH5MbpETU2PByqgKmVrNrbSq
 9brlNmR4m7f9hExPdKp+p6TnpoiG+O60aCm0xK6aoD66vRwjnVaPpUTbZLwXXx/mTSR9+2d/
 f0W3XCGpaXFCYWX8AgVe0Ew/yiTpsSq8pefSZS0mZT7I0Er7xIAahihZa07FdRwxwp5PY1B3
 fgpDzsXKTWYvOSrmLS0Dc5WvOJ8Dsa+aevzulk4pd3YJfMvQJSFSKTW/95Imjw3g6iiH96HO
 ZBfM2A2Kk2dPVsWYAx/5JEWxY9EglH2dSFYr1SE47I6+WHJwCR60aT3McqTcduPLSlQth/A+
 j6YojqgWXn2MvSkihXd/WKdntTpph3lfaIJOaaEqKVT1Qj7Kms7V0RNCArTTeOComqjUNsZB
 UUS8ScqqbUa/VauCNL6WnWQsHOC+xIRRddUO+k78x2WjLrZ5R6DAWoJRSIHb8Yp3OccSCY2z
 FaPk5XMDCZ2rbyOYXuH8/GfqjbaERcYLCkpZSICZQIf5p/op4Rbpg3LZsZuFuiylNKdMSv32
 DqQqy89gZ0ciMcK0+Ow+lWvqzCjvJ/SVSYu+x7aGGmi62tRbZaofYWy5XDH7PxLK8CSSVzpg
 ZQfs5HAtqZUV8jLzXHTBrxXR9lF+sppLhXYsHlkBd4E7A+r5ialcsd32gtYe2VmZ5NslSDSX
 KPDhe9AzMYNbCP0PPcmPd3Z59cClva5S4m8PhzARp8XO8UqKlfalM17TRTIt10BhnTAhk3W1
 X2zVc+3RUgXBq18pNZdb7dMiOR7rszSKI66eHwa8/hE+eDEDJJtYe1ZWGZil8hghE9+nC3b8
 sxEK+yBwAhFXev1b0H/qNBDdQ5RdiJqXsCn86S7k9JvxSI/QQkc5wL5m+t9K+SJYYwO/gs3w
 p1NchABkweu7ZE2AQ6LdmpieNvSYHqLllpiZXZEFQ/xixAejXOHsP93m20fIeN2q4SODJdcE
 5E4Ril3Kq8VEGiWoGhAMMKVQU4LXE3DuD9i9hGNOFAXF6OMjSSQkjM4VmMDLBUzMxc=
IronPort-HdrOrdr: A9a23:1tJHzKj6rj9X9XshvrlI23ODQ3BQXvgji2hC6mlwRA09TyX4rb
 HKoB1/73WYtN9/Yh0dcLy7V5VoOEmskqKdgrNhX4tKPjOHhILAFugL0WKF+VPd8kbFh41gPM
 lbEpSWP+eAaWSS3fyQ3OBhKadb/DBcytHRuQ4C9QYKcei3UdAa0+6mMHfnLqUYLDM2fKYEKA
 ==
X-IronPort-AV: E=Sophos;i="5.98,321,1673931600"; 
   d="scan'208";a="104465613"
Date: Wed, 5 Apr 2023 16:14:45 +0100
From: Anthony PERARD <anthony.perard@citrix.com>
To: Luca Fancellu <Luca.Fancellu@arm.com>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Bertrand Marquis
	<Bertrand.Marquis@arm.com>, Wei Chen <Wei.Chen@arm.com>, Wei Liu
	<wl@xen.org>, George Dunlap <george.dunlap@citrix.com>, Nick Rosbrook
	<rosbrookn@gmail.com>, Juergen Gross <jgross@suse.com>, George Dunlap
	<george.dunlap@cloud.com>
Subject: Re: [PATCH v4 10/12] xen/tools: add sve parameter in XL configuration
Message-ID: <8921a9ca-7284-44ce-8ce5-bc631b0980d6@perard>
References: <20230327105944.1360856-1-luca.fancellu@arm.com>
 <20230327105944.1360856-11-luca.fancellu@arm.com>
 <9bd2924b-bb4a-440d-ae31-0253e66c56e5@perard>
 <328A9CBD-5FCE-481B-93AF-D139963488D5@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <328A9CBD-5FCE-481B-93AF-D139963488D5@arm.com>

On Tue, Apr 04, 2023 at 01:48:34PM +0000, Luca Fancellu wrote:
> > On 31 Mar 2023, at 15:23, Anthony PERARD <anthony.perard@citrix.com> wrote:
> > 
> > On Mon, Mar 27, 2023 at 11:59:42AM +0100, Luca Fancellu wrote:
> >> diff --git a/docs/man/xl.cfg.5.pod.in b/docs/man/xl.cfg.5.pod.in
> >> index 10f37990be57..adf48fe8ac1d 100644
> >> --- a/docs/man/xl.cfg.5.pod.in
> >> +++ b/docs/man/xl.cfg.5.pod.in
> >> @@ -2952,6 +2952,17 @@ Currently, only the "sbsa_uart" model is supported for ARM.
> >> 
> >> =back
> >> 
> >> +=item B<sve="NUMBER">
> >> +
> >> +To enable SVE, user must specify a number different from zero, maximum 2048 and
> >> +multiple of 128. That value will be the maximum number of SVE registers bits
> >> +that the hypervisor will impose to this guest. If the platform has a lower
> > 
> > Maybe start by describing what the "sve" value is before imposing
> > limits. Maybe something like:
> > 
> >    Set the maximum vector length that a guest's Scalable Vector
> >    Extension (SVE) can use. Or disable it by specifying 0, the default.
> > 
> >    Value needs to be a multiple of 128, with a maximum of 2048 or the
> >    maximum supported by the platform.
> > 
> > Would this, or something like that be a good explanation of the "sve"
> > configuration option?
> 
> Yes I can change it, a need to do it anyway because I think also here, the suggestion
> From Jan can apply and we could pass a negative value that means “max VL supported
> by the platform"

Well, it's a config file, not a C ABI, so max allowed here doesn't have to be
spelled "-1", it could also be "max", "max-allowed",
"max-size-supported", ... So fill free deviate from the restricted C
ABI. But "-1" works as long as it's the only allowed negative number.

> > 
> >> +supported bits value, then the domain creation will fail.
> >> +A value equal to zero is the default and it means this guest is not allowed to
> >> +use SVE.
> >> +
> >> +=back
> >> +
> >> =head3 x86
> >> 
> >> =over 4
> >> diff --git a/tools/libs/light/libxl_arm.c b/tools/libs/light/libxl_arm.c
> >> index ddc7b2a15975..16a49031fd51 100644
> >> --- a/tools/libs/light/libxl_arm.c
> >> +++ b/tools/libs/light/libxl_arm.c
> >> @@ -211,6 +211,8 @@ int libxl__arch_domain_prepare_config(libxl__gc *gc,
> >>         return ERROR_FAIL;
> >>     }
> >> 
> >> +    config->arch.sve_vl = d_config->b_info.arch_arm.sve;
> > 
> > This truncate a 16bit value into an 8bit value, I think you should check
> > that the value can actually fit.
> > 
> > And maybe check `d_config->b_info.arch_arm.sve` value here instead of
> > `xl` as commented later.
> 
> Yes I can do it, one question, can I use here xc_physinfo to retrieve the maximum
> Vector length from arch_capabilities?
> I mean, is there a better way or I can go for that?

Yeah, there might be a "better" way. I think me suggestion to check the
sve value here was wrong. I still want to have it checked in libxl, but
it might be better to do that in the previous step, that is
"libxl__domain_config_setdefault". libxl__arch_domain_build_info_setdefault()
will have `physinfo` so you won't have to call xc_physinfo().


Regarding the default, libxl is capable of selecting a good set of
option, depending on the underling hardware. So is it possible that in
the future we would want to enable SVE by default? If that's even a
remote possibility, the current API wouldn't allow it because we have
"default" and "disable" been the same.

Since we want to add a max VL supported option, maybe we want to
separate the default and disable options. So we could keep the
single field `libxl_domain_build_info.arch_arm.sve` and have for example
"-1" for max-supported and "-2" for disabled, while "0" mean default.
Or alternatively, add an extra field libxl_defbool (can be
default/true/false) and keep the second one for VL. (That extra
"disabled" option would only be for libxl, for xl we can keep "sve=0"
mean disable, and the missing option just mean default.)

In any case, libxl__arch_domain_build_info_setdefault() will check
`b_info.arch_arm.sve` and set it to the value that can given to Xen. And
as of now, libxl__arch_domain_prepare_config() will just copy the value
from `b_info` to `config`. (I guess that last step _prepare_config()
could still do the division by 128.)


Thanks,

-- 
Anthony PERARD

