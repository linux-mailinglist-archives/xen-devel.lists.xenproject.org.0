Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 274FB41EC51
	for <lists+xen-devel@lfdr.de>; Fri,  1 Oct 2021 13:37:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.200561.355080 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mWGqJ-0002sK-6n; Fri, 01 Oct 2021 11:36:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 200561.355080; Fri, 01 Oct 2021 11:36:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mWGqJ-0002pQ-3B; Fri, 01 Oct 2021 11:36:43 +0000
Received: by outflank-mailman (input) for mailman id 200561;
 Fri, 01 Oct 2021 11:36:41 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=wBg0=OV=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1mWGqH-0002pK-7I
 for xen-devel@lists.xenproject.org; Fri, 01 Oct 2021 11:36:41 +0000
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 21035c22-fb66-4b0b-8e4f-1b0fe8f4d506;
 Fri, 01 Oct 2021 11:36:39 +0000 (UTC)
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
X-Inumbo-ID: 21035c22-fb66-4b0b-8e4f-1b0fe8f4d506
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1633088199;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=26LQk5eAfzqIVg+MS7ERysMyqBCQ9TCP6tfHR15Yj28=;
  b=MP0obStfKq8H1AyDu/R4SjsrzOwoF/4hMX5VPLpLAq9f2unyT+xSR6I3
   aicZ9Juc6ngZtzKixXDHOOKhokZQQXhREVDxM50cK4FBV9C8+VLrrOOir
   UXem+G28bL/zAt8uabW+dXzwqclEjgCLO7ULX0WjG7mwIcpF5azW9mfen
   I=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: +50nVW9FiLNllIiudHsg9bxE2UEAxWZ30B09aScdgmk7ByzklQrj6vnRB/24Wzat64PnP5ZhwH
 JOZitmVbwNcPTRsao4djVwaMYWrZGp1i/zPyYinkMJEpt1kIbQaVAi0c2+qCgEQHmC5lJ9WdsV
 Aw763X11BAVobbS2zA5JoVWGMs1scYCRBeMWivZUkG+REVQvqG32lFCrZBvHrjMPdEcEm8hfsN
 ceN9f9mYm1KvNUSC1LbgmhHfdoGgK+XnCQ5WrrXAwyvTl9BDWMtJoZ2LSXtPHH6DuAlcWAf2s1
 O+li8fkWPX0/HWHludtNeudt
X-SBRS: 5.1
X-MesageID: 54131767
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:US57Y6/xiDlTIj9HVq9gDrUDY3mTJUtcMsCJ2f8bNWPcYEJGY0x3n
 2EYXjyOaKuPNGf0L4p+b9u2/B8D6sfXydJnSgpq+Xw8E34SpcT7XtnIdU2Y0wF+jyHgoOCLy
 +1EN7Es+ehtFie0Si9AttENlFEkvU2ybuOU5NXsZ2YhGGeIdA970Ug6wrZh29Yy6TSEK1jlV
 e3a8pW31GCNg1aYAkpMg05UgEoy1BhakGpwUm0WPZinjneH/5UmJMt3yZWKB2n5WuFp8tuSH
 I4v+l0bElTxpH/BAvv9+lryn9ZjrrT6ZWBigVIOM0Sub4QrSoXfHc/XOdJFAXq7hQllkPhD0
 f9XkaygTD0JI/zho8QYFBYHFntxaPguFL/veRBTsOSWxkzCNXDt3+9vHAc9OohwFuRfWD8Us
 6ZCcXZUM07F17neLLGTE4GAguwqKtXrO4UO/Glt1zjDAd4tQIzZQrWM7thdtNs1rp0SRK2HO
 JRGAdZpRAzOPwVPAHcHM58zvsinukahaQR8hU3A8MLb5ECMlVcsgdABKuH9e8OIbdVYmF6Co
 WDL9Hi/BQsVXPSAzRKV/3TqgfXA9Qv6Q4sTF7y+s/JvgUGJ10QCARsaWEv9u+TRol6zXZdTJ
 lIZ/gIqrLMu7wq7Q9/lRRq6rXWY+BkGVLJt//YSsV/XjPCOukDAWzZCHmUphMEaWNEedyUAz
 Hu5j9bTJSE+nYa1TDWSqbLOombnUcQKFlMqaSgBRAoDxtDspoAvkx7CJupe/L6JYs7dQ2+pn
 GHTxMQqr/BD1ZdUi/XTEUXv2WrEm3TfcuIiCuw7tEqL6RllLKqseoCl81TS6fsowG2xFQLa5
 ClsdyRz9okz4XCxeM6lHLhl8FKBva/t3NjgbbhHRMVJG9OFoSDLQGyoyGsiTHqFy+5dEdMTX
 GfduBlK+LhYN2awYKl8buqZUppxlvC6So+7D62EP7Kih6SdkifcoEmCgmbKgQjQfLUEy/lja
 f93j+72ZZrlNUiX5GXvHLpMuVPa7is/2XnSVfjGI+ePitKjiIquYe5dajOmN7lhhIvd+Vm92
 4sPZqOilkQEOMWjM3a/zGLmBQ1TRZTNLcut8JI/my/qClcOJVzN/NeLmu5+J9w5wf4F/goKl
 1nkMnJlJJPErSWvAW23hrpLMtsDhL5z8iA2OzICJ1Gt1yRxaIqj9v5HJZA2YaMm5KpoyvstF
 6sJfMCJA/JuTDXb+mtCMcmh/dI6LBn71xiTOyeFYSQke8IyTQL+5dK5LBDk8zMDD3TruJJm8
 aGgzA7SXbEKWx9mUJTNcPuqwl7o5Sodlet+UlHmON5WfEmwooFmJzao1q08It0WKAWFzTyfj
 l7EDRAdrOjLgok07NiW2vzU89b3S7NzRxMIEXPa4LC6MTjh0lCimYIQAvyVeT39VX/v/Pnwb
 +ti0PyhYuYMm0xHstQgHu8zn74+/dbmu5RT0h9gQCfQd12uB75tfiuG0M1IuvEfz7NVo1LrC
 EeG+90cMrSVIsL1VlUWIVN9POiE0PgVnBjU7Og0fxqmtHMmouLfXBUAJQSIhQxcMKBxYdEsz
 uoWscIL7xCy10gxOdGcgyEIr2mBIxTsiUn8Wk321GMztjcW9w==
IronPort-HdrOrdr: A9a23:thF7YaEJmUgnhwyGpLqE6MeALOsnbusQ8zAXP0AYc3Jom+ij5q
 STdZUgpHrJYVkqNU3I9ertBEDEewK6yXcX2/hyAV7BZmnbUQKTRekIh7cKgQeQeBEWntQts5
 uIGJIeNDSfNzdHsfo=
X-IronPort-AV: E=Sophos;i="5.85,337,1624334400"; 
   d="scan'208";a="54131767"
Date: Fri, 1 Oct 2021 12:36:16 +0100
From: Anthony PERARD <anthony.perard@citrix.com>
To: Dmitry Isaykin <isaikin-dmitry@yandex.ru>
CC: <xen-devel@lists.xenproject.org>, Ian Jackson <iwj@xenproject.org>, Wei
 Liu <wl@xen.org>
Subject: Re: [SUSPECTED SPAM][PATCH v4] tools/xl: fix autoballoon regex
Message-ID: <YVbysEUbylUZTY6E@perard>
References: <57f69075b77651c64b7dc6d86acd03fe03b4a18f.1632907890.git.isaikin-dmitry@yandex.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <57f69075b77651c64b7dc6d86acd03fe03b4a18f.1632907890.git.isaikin-dmitry@yandex.ru>

On Wed, Sep 29, 2021 at 03:44:33PM +0300, Dmitry Isaykin wrote:
> This regex is used for auto-balloon mode detection based on Xen command line.
> 
> The case of specifying a negative size was handled incorrectly.
> From misc/xen-command-line documentation:
> 
>     dom0_mem (x86)
>     = List of ( min:<sz> | max:<sz> | <sz> )
> 
>     If a size is positive, it represents an absolute value.
>     If a size is negative, it is subtracted from the total available memory.
> 
> Also add support for [tT] granularity suffix.
> Also add support for memory fractions (i.e. '50%' or '1G+25%').
> 
> Signed-off-by: Dmitry Isaykin <isaikin-dmitry@yandex.ru>
> ---

> +#define SIZE_PATTERN "-?[0-9]+[bBkKmMgGtT]?"
> +
>      ret = regcomp(&regex,
> -                  "(^| )dom0_mem=((|min:|max:)[0-9]+[bBkKmMgG]?,?)+($| )",
> +                  "(^| )dom0_mem=((|min:|max:)(" SIZE_PATTERN "|(" SIZE_PATTERN "\\+)?[0-9]{1,2}%),?)+($| )",
>                    REG_NOSUB | REG_EXTENDED);

Reviewed-by: Anthony PERARD <anthony.perard@citrix.com>

Thanks,

-- 
Anthony PERARD

