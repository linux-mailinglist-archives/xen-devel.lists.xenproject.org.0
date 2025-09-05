Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ED829B46667
	for <lists+xen-devel@lfdr.de>; Sat,  6 Sep 2025 00:02:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1112456.1460709 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uueV3-000371-76; Fri, 05 Sep 2025 22:01:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1112456.1460709; Fri, 05 Sep 2025 22:01:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uueV3-00033r-48; Fri, 05 Sep 2025 22:01:41 +0000
Received: by outflank-mailman (input) for mailman id 1112456;
 Fri, 05 Sep 2025 22:01:39 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=nTaj=3Q=apertussolutions.com=dpsmith@srs-se1.protection.inumbo.net>)
 id 1uueV1-00032r-DN
 for xen-devel@lists.xenproject.org; Fri, 05 Sep 2025 22:01:39 +0000
Received: from sender3-of-o50.zoho.com (sender3-of-o50.zoho.com
 [136.143.184.50]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e487d7c2-8aa3-11f0-9d12-b5c5bf9af7f9;
 Sat, 06 Sep 2025 00:01:37 +0200 (CEST)
Received: by mx.zohomail.com with SMTPS id 1757109687852185.963518623823;
 Fri, 5 Sep 2025 15:01:27 -0700 (PDT)
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
X-Inumbo-ID: e487d7c2-8aa3-11f0-9d12-b5c5bf9af7f9
ARC-Seal: i=1; a=rsa-sha256; t=1757109690; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=boqs4QylBKzZHRmmYiho2A0YcLRaJbYtJPclLj8VxYiCkZD4qR9BVlLzqMAsuQtTt00cWSolGLO8rOap1DpQDKdeAAR16DBwV70F0viYU2PzHAj5bMh8d6yesm2ELgTGBSORvKt/kMlWNwKvDQUGGPQCiwaWLEcS7D/WmJ/a/xo=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1757109690; h=Content-Type:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=8L+EHnK0q6dte/hfCAknQn7thqJFz+eAfxwfsypDOpg=; 
	b=iinOD5lmoPIF95MKF9QdqGFBShFvmlSvWMl4FMAzUZiSYISAzqIGnalD45s6pFfP5N8ZpqWb7caW4PugP799OolqjgqlKkXwtVKV4TXvSsMJw1qI2dD8nK2CBcXUuI6A9m+qwKp833Y0nkSQyXjXC+1eWHe7UH1CetX9Jlhltjk=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1757109689;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=Content-Type:Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Message-Id:Reply-To;
	bh=8L+EHnK0q6dte/hfCAknQn7thqJFz+eAfxwfsypDOpg=;
	b=OHc21ik3a6Rxc0I/aPRMpyCDKnLC6Gypu1+HidoD9TGzXON8jRcLbzQzoNgNe04w
	3RIFDVrn1aqdz38EPPHAd0kaGwixLjhQjP/RFR2OBviS9lH960B6fX3ptVs7CbfI04U
	8f9dWOc8WkQmXItLcR14mU0JoeUhgJc6ehP3/+bc=
Content-Type: multipart/alternative;
 boundary="------------KgpkQQUcUT8uNV0gnwgvxhI2"
Message-ID: <7b36e8fe-c19d-40eb-b1d7-d869cdfb1a28@apertussolutions.com>
Date: Fri, 5 Sep 2025 18:01:26 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH v2] xen/flask: limit sidtable size
To: Jan Beulich <jbeulich@suse.com>, Sergiy Kibrik <Sergiy_Kibrik@epam.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <20250901105231.1570041-1-Sergiy_Kibrik@epam.com>
 <de8380a4-cad9-4589-ae46-8649036186b2@suse.com>
Content-Language: en-US
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
Autocrypt: addr=dpsmith@apertussolutions.com; keydata=
 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
In-Reply-To: <de8380a4-cad9-4589-ae46-8649036186b2@suse.com>
X-ZohoMailClient: External

This is a multi-part message in MIME format.
--------------KgpkQQUcUT8uNV0gnwgvxhI2
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Sergiy,

If you don't mind, please CC me directly, as I am the only XSM 
maintainer for which you will need my Ack. And for whatever reason, I 
cannot find the v2 post in my xen-devel folder. If you want to resend me 
v2, it would be greatly appreciated.

V/r,
Daniel P. Smith
Apertus Solutions, LLC

On 9/2/25 05:41, Jan Beulich wrote:
> On 01.09.2025 12:52, Sergiy Kibrik wrote:
>> --- a/xen/common/Kconfig
>> +++ b/xen/common/Kconfig
>> @@ -418,6 +418,17 @@ config XSM_FLASK_AVC_STATS
>>   
>>   	  If unsure, say Y.
>>   
>> +config XSM_FLASK_SIDTABLE_ORDER
>> +	int "Maximum number of security identifiers (base-2 exponent)" if EXPERT
>> +	range 4 32
>> +	default 32
> When 32 is chosen (i.e. also the default when the prompt is hidden), ...
>
>> --- a/xen/xsm/flask/ss/sidtab.c
>> +++ b/xen/xsm/flask/ss/sidtab.c
>> @@ -14,6 +14,8 @@
>>   #include "security.h"
>>   #include "sidtab.h"
>>   
>> +#define SID_LIMIT ((1UL << CONFIG_XSM_FLASK_SIDTABLE_ORDER) - 1)
> ... for Arm32 I expect either already the compiler will not like this construct,
> or the latest an UBSAN checker would object.
>
> Jan
--------------KgpkQQUcUT8uNV0gnwgvxhI2
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 7bit

<!DOCTYPE html>
<html data-lt-installed="true">
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body style="padding-bottom: 1px;">
    <p>Hi Sergiy,</p>
    <p>If you don't mind, please CC me directly, as I am the only XSM
      maintainer for which you will need my Ack. And for whatever
      reason, I cannot find the v2 post in my xen-devel folder. If you
      want to resend me v2, it would be greatly appreciated. <br>
    </p>
    <pre class="moz-signature" cols="72">V/r,
Daniel P. Smith
Apertus Solutions, LLC</pre>
    <div class="moz-cite-prefix">On 9/2/25 05:41, Jan Beulich wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:de8380a4-cad9-4589-ae46-8649036186b2@suse.com">
      <pre wrap="" class="moz-quote-pre">On 01.09.2025 12:52, Sergiy Kibrik wrote:
</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">--- a/xen/common/Kconfig
+++ b/xen/common/Kconfig
@@ -418,6 +418,17 @@ config XSM_FLASK_AVC_STATS
 
 	  If unsure, say Y.
 
+config XSM_FLASK_SIDTABLE_ORDER
+	int "Maximum number of security identifiers (base-2 exponent)" if EXPERT
+	range 4 32
+	default 32
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
When 32 is chosen (i.e. also the default when the prompt is hidden), ...

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">--- a/xen/xsm/flask/ss/sidtab.c
+++ b/xen/xsm/flask/ss/sidtab.c
@@ -14,6 +14,8 @@
 #include "security.h"
 #include "sidtab.h"
 
+#define SID_LIMIT ((1UL &lt;&lt; CONFIG_XSM_FLASK_SIDTABLE_ORDER) - 1)
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
... for Arm32 I expect either already the compiler will not like this construct,
or the latest an UBSAN checker would object.

Jan
</pre>
    </blockquote>
  </body>
  <lt-container></lt-container>
</html>

--------------KgpkQQUcUT8uNV0gnwgvxhI2--

