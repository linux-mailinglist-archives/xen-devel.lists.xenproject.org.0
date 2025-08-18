Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A00C2B2A5EB
	for <lists+xen-devel@lfdr.de>; Mon, 18 Aug 2025 15:39:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1086134.1444363 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uo04r-00072A-5v; Mon, 18 Aug 2025 13:39:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1086134.1444363; Mon, 18 Aug 2025 13:39:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uo04r-00070h-2o; Mon, 18 Aug 2025 13:39:09 +0000
Received: by outflank-mailman (input) for mailman id 1086134;
 Mon, 18 Aug 2025 13:39:07 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=YQjc=26=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1uo04p-0006nx-GW
 for xen-devel@lists.xenproject.org; Mon, 18 Aug 2025 13:39:07 +0000
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com
 [2a00:1450:4864:20::632])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b5b57923-7c38-11f0-b898-0df219b8e170;
 Mon, 18 Aug 2025 15:39:05 +0200 (CEST)
Received: by mail-ej1-x632.google.com with SMTP id
 a640c23a62f3a-afcb78d5e74so701817666b.1
 for <xen-devel@lists.xenproject.org>; Mon, 18 Aug 2025 06:39:05 -0700 (PDT)
Received: from [192.168.1.5] (user-109-243-64-38.play-internet.pl.
 [109.243.64.38]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-afcdd010d4csm790828366b.85.2025.08.18.06.39.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 18 Aug 2025 06:39:04 -0700 (PDT)
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
X-Inumbo-ID: b5b57923-7c38-11f0-b898-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755524345; x=1756129145; darn=lists.xenproject.org;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TC2/844wfRxMJ18+GlAvLJqaXFcGO14qdcOCaL4dm6Y=;
        b=DIcucqp0u0Sow0EIi8ukxw/wD+Ql+968DItqcgc3WVWDL7Btw6TzKuRDr4VBN8ouLx
         IzWth4bwi58H4AHdDESu7hlfES1bTOJ5aDTy6DfL/1wESjK/dMECTqfYovk0LF5p0L6c
         Refv8iOMJv2EbmQD8CgeDEoOYXgSPQc5RfguONsWr+q5vt0y6Pczy3gtEy1rAefRof0g
         o6d4lGa3CtP4cL+GisE5Prj5AUYDPSiOT1YuS1ozjXTgQtTi+NLPuRjIfvV8h400iESi
         A1RRyEe7nKLV/hpslKWuaKVd2Yb963elnK4xKSsqtZ/2aq42FZL+I+Ngdfh4BmvM7RHV
         hEBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755524345; x=1756129145;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=TC2/844wfRxMJ18+GlAvLJqaXFcGO14qdcOCaL4dm6Y=;
        b=b/eo9yBMORHQbjSfCvd8luNsRB25Lo6IRLsduUdTfpOpV2tgh2rAkCF9Hf3+jpEOcA
         FIcbJ10o05yD/yZqfoLNGzV9yH1YKuu2+SuEiqRSu3GoiPknlGMFbbPZbbdLnbw1gK7G
         v/chGizvpK6r5KHcqgfBZGH6bC5ucQPBsn+taoXkM8dH7d32/KdIqbP7317ScnVFHrqu
         aknxOe0QBIXSKi29oflTngT3QWWt+RPuoJpN17wu7tGrgMulykkiO5snaTkArKcQEwhF
         PFHRuyjC33u0WwR3/OQ1Uf5vTUIEvnVd2U/rHOTGv7MXVEzIN/jxU6cNv1Ch9Nl/0eKS
         agMQ==
X-Forwarded-Encrypted: i=1; AJvYcCX/2kFURJq1uy8ChWGxZLIg0PhNQUtkKBI9rZ1oxOWW5sU34rfgiopdzTPDTNfX6Rmghm48TcW/gHc=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwRFmWwWDSZ/smlCgb6Chq3OPK9MNhYbN1NyI7PJbWeP52CKWd9
	F0WbByN7qRY5CptMQt/N5GeS1o6ZlDx7fk9GQK3Ial2bhdP/hQTsH15Y
X-Gm-Gg: ASbGnct2IIeXiur8V58GxANAMwtlSSAE+fY+5TlcaubrKM8cMTlmB5+yxDJtAjQTWXY
	zPZw97NHZl94DKt1HB/NXDYTmy3xOzIb38a4ouP/y/BouNxsn8a7eLr3+IZpMoAhqZYHAONaqu9
	hMosM+cwi+yBsT1rrBqJJfnoRKwR+WjJZVTWpQtx+hWT8/Nibgw9a6DwWZ5mvfPjywgpVWlOBM4
	6p4hhbG2Jtv+0zrbQUNEwUoV5r+SzL54+0vMO1OCXKSRBiEEyBN5yrrQnBrvDcRQyqg219hLXyW
	+3Fo6GvpdgJXZ5HGxZpjLtm2CHDPSKpML7yr/NpdTIFbfZnqZJd2C7/zc2TyGTvAzNpV1YiIiPp
	FwX5+YHXUvNWuaahzQzueRLoM9+gnpJCs4MkZ1vyJ1NgzsQZmwTVO82LykRqo6qU2Ai/kvKo=
X-Google-Smtp-Source: AGHT+IHjm0rZMpYZjl0ZYPm12EwnfvJq0+bNg2Vyh2b25408ZBszyLz6hGWudlmy9fN8cPvRJtmF1Q==
X-Received: by 2002:a17:907:2dac:b0:afa:1b05:69c3 with SMTP id a640c23a62f3a-afcdc3ab862mr1013590466b.47.1755524345060;
        Mon, 18 Aug 2025 06:39:05 -0700 (PDT)
Content-Type: multipart/alternative;
 boundary="------------9bLFxSR9aZ0wdvA79F6IpIYB"
Message-ID: <da5aae89-2a8a-4c29-aaa1-16af43f43785@gmail.com>
Date: Mon, 18 Aug 2025 15:39:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] tools/xl: hide xenstore-features behind option
To: Jan Beulich <jbeulich@suse.com>, Juergen Gross <jgross@suse.com>
Cc: Anthony PERARD <anthony.perard@vates.tech>,
 Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
References: <20250815143236.27641-1-jgross@suse.com>
 <115eca26-32a3-403f-9bf6-553c6b20940c@suse.com>
 <6330d03a-b228-4946-bb5e-c0142d0df6c8@suse.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <6330d03a-b228-4946-bb5e-c0142d0df6c8@suse.com>

This is a multi-part message in MIME format.
--------------9bLFxSR9aZ0wdvA79F6IpIYB
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 8/18/25 9:42 AM, Jan Beulich wrote:
> On 15.08.2025 16:35, Juergen Gross wrote:
>> + Release Manager
> While this surely doesn't hurt, my understanding is that bug fixes don't
> require release-acks just yet.

Yes, your understanding is correct.


~ Oleksii

>> On 15.08.25 16:32, Juergen Gross wrote:
>>> In order to be able to use "xl info" before Xenstore has been started
>>> or after it has crashed, hide obtaining the available Xenstore features
>>> behind the new option "-x".
>>>
>>> Fixes: ecce7970cfe7 ("tools/xl: add available Xenstore features to xl info output")
>>> Reported-by: Andrew Cooper<andrew.cooper3@citrix.com>
>>> Signed-off-by: Juergen Gross<jgross@suse.com>
>>> ---
>>>    docs/man/xl.1.pod.in     |  4 ++++
>>>    docs/man/xl.cfg.5.pod.in |  2 +-
>>>    tools/xl/xl_info.c       | 14 ++++++++++----
>>>    3 files changed, 15 insertions(+), 5 deletions(-)
>>>
>>> diff --git a/docs/man/xl.1.pod.in b/docs/man/xl.1.pod.in
>>> index fe38724b2b..88ccf7ad82 100644
>>> --- a/docs/man/xl.1.pod.in
>>> +++ b/docs/man/xl.1.pod.in
>>> @@ -996,6 +996,10 @@ B<OPTIONS>
>>>    
>>>    List host NUMA topology information
>>>    
>>> +=item B<-x>, B<--xenstore>
>>> +
>>> +Show Xenstore features available.
>>> +
>>>    =back
>>>    
>>>    =item B<top>
>>> diff --git a/docs/man/xl.cfg.5.pod.in b/docs/man/xl.cfg.5.pod.in
>>> index f0c920b39d..acff45d308 100644
>>> --- a/docs/man/xl.cfg.5.pod.in
>>> +++ b/docs/man/xl.cfg.5.pod.in
>>> @@ -743,7 +743,7 @@ condition.
>>>    =back
>>>    
>>>    The features supported by the running Xenstore instance can be retrieved
>>> -via the B<xl info> command in dom0.
>>> +via the B<xl info -x> command in dom0.
>>>    
>>>    The default value is B<0xffffffff>, meaning that all possible Xenstore
>>>    features are visible by the guest.
>>> diff --git a/tools/xl/xl_info.c b/tools/xl/xl_info.c
>>> index eb019e3ee9..d3583cbf8f 100644
>>> --- a/tools/xl/xl_info.c
>>> +++ b/tools/xl/xl_info.c
>>> @@ -353,7 +353,7 @@ static void output_xenstore_info(void)
>>>        xs_close(xsh);
>>>    }
>>>    
>>> -static void print_info(int numa)
>>> +static void print_info(int numa, bool xs)
>>>    {
>>>        output_nodeinfo();
>>>    
>>> @@ -365,7 +365,8 @@ static void print_info(int numa)
>>>        }
>>>        output_xeninfo();
>>>    
>>> -    output_xenstore_info();
>>> +    if (xs)
>>> +        output_xenstore_info();
>>>    
>>>        maybe_printf("xend_config_format     : 4\n");
>>>    
>>> @@ -631,14 +632,19 @@ int main_info(int argc, char **argv)
>>>        int opt;
>>>        static struct option opts[] = {
>>>            {"numa", 0, 0, 'n'},
>>> +        {"xenstore", 0, 0, 'x'},
>>>            COMMON_LONG_OPTS
>>>        };
>>>        int numa = 0;
>>> +    bool xs = false;
>>>    
>>> -    SWITCH_FOREACH_OPT(opt, "n", opts, "info", 0) {
>>> +    SWITCH_FOREACH_OPT(opt, "nx", opts, "info", 0) {
>>>        case 'n':
>>>            numa = 1;
>>>            break;
>>> +    case 'x':
>>> +        xs = true;
>>> +        break;
>>>        }
>>>    
>>>        /*
>>> @@ -648,7 +654,7 @@ int main_info(int argc, char **argv)
>>>        if (numa == 0 && argc > optind)
>>>            info_name = argv[optind];
>>>    
>>> -    print_info(numa);
>>> +    print_info(numa, xs);
>>>        return 0;
>>>    }
>>>    
--------------9bLFxSR9aZ0wdvA79F6IpIYB
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 7bit

<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 8/18/25 9:42 AM, Jan Beulich wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:6330d03a-b228-4946-bb5e-c0142d0df6c8@suse.com">
      <pre wrap="" class="moz-quote-pre">On 15.08.2025 16:35, Juergen Gross wrote:
</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">+ Release Manager
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
While this surely doesn't hurt, my understanding is that bug fixes don't
require release-acks just yet.</pre>
    </blockquote>
    <pre>Yes, your understanding is correct.


~ Oleksii</pre>
    <blockquote type="cite"
      cite="mid:6330d03a-b228-4946-bb5e-c0142d0df6c8@suse.com">
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">On 15.08.25 16:32, Juergen Gross wrote:
</pre>
        <blockquote type="cite">
          <pre wrap="" class="moz-quote-pre">In order to be able to use "xl info" before Xenstore has been started
or after it has crashed, hide obtaining the available Xenstore features
behind the new option "-x".

Fixes: ecce7970cfe7 ("tools/xl: add available Xenstore features to xl info output")
Reported-by: Andrew Cooper <a class="moz-txt-link-rfc2396E" href="mailto:andrew.cooper3@citrix.com">&lt;andrew.cooper3@citrix.com&gt;</a>
Signed-off-by: Juergen Gross <a class="moz-txt-link-rfc2396E" href="mailto:jgross@suse.com">&lt;jgross@suse.com&gt;</a>
---
  docs/man/xl.1.pod.in     |  4 ++++
  docs/man/xl.cfg.5.pod.in |  2 +-
  tools/xl/xl_info.c       | 14 ++++++++++----
  3 files changed, 15 insertions(+), 5 deletions(-)

diff --git a/docs/man/xl.1.pod.in b/docs/man/xl.1.pod.in
index fe38724b2b..88ccf7ad82 100644
--- a/docs/man/xl.1.pod.in
+++ b/docs/man/xl.1.pod.in
@@ -996,6 +996,10 @@ B&lt;OPTIONS&gt;
  
  List host NUMA topology information
  
+=item B&lt;-x&gt;, B&lt;--xenstore&gt;
+
+Show Xenstore features available.
+
  =back
  
  =item B&lt;top&gt;
diff --git a/docs/man/xl.cfg.5.pod.in b/docs/man/xl.cfg.5.pod.in
index f0c920b39d..acff45d308 100644
--- a/docs/man/xl.cfg.5.pod.in
+++ b/docs/man/xl.cfg.5.pod.in
@@ -743,7 +743,7 @@ condition.
  =back
  
  The features supported by the running Xenstore instance can be retrieved
-via the B&lt;xl info&gt; command in dom0.
+via the B&lt;xl info -x&gt; command in dom0.
  
  The default value is B&lt;0xffffffff&gt;, meaning that all possible Xenstore
  features are visible by the guest.
diff --git a/tools/xl/xl_info.c b/tools/xl/xl_info.c
index eb019e3ee9..d3583cbf8f 100644
--- a/tools/xl/xl_info.c
+++ b/tools/xl/xl_info.c
@@ -353,7 +353,7 @@ static void output_xenstore_info(void)
      xs_close(xsh);
  }
  
-static void print_info(int numa)
+static void print_info(int numa, bool xs)
  {
      output_nodeinfo();
  
@@ -365,7 +365,8 @@ static void print_info(int numa)
      }
      output_xeninfo();
  
-    output_xenstore_info();
+    if (xs)
+        output_xenstore_info();
  
      maybe_printf("xend_config_format     : 4\n");
  
@@ -631,14 +632,19 @@ int main_info(int argc, char **argv)
      int opt;
      static struct option opts[] = {
          {"numa", 0, 0, 'n'},
+        {"xenstore", 0, 0, 'x'},
          COMMON_LONG_OPTS
      };
      int numa = 0;
+    bool xs = false;
  
-    SWITCH_FOREACH_OPT(opt, "n", opts, "info", 0) {
+    SWITCH_FOREACH_OPT(opt, "nx", opts, "info", 0) {
      case 'n':
          numa = 1;
          break;
+    case 'x':
+        xs = true;
+        break;
      }
  
      /*
@@ -648,7 +654,7 @@ int main_info(int argc, char **argv)
      if (numa == 0 &amp;&amp; argc &gt; optind)
          info_name = argv[optind];
  
-    print_info(numa);
+    print_info(numa, xs);
      return 0;
  }
  
</pre>
        </blockquote>
        <pre wrap="" class="moz-quote-pre">
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
</pre>
    </blockquote>
  </body>
</html>

--------------9bLFxSR9aZ0wdvA79F6IpIYB--

