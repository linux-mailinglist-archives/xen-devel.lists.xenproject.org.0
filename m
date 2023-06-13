Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4022972DE64
	for <lists+xen-devel@lfdr.de>; Tue, 13 Jun 2023 11:57:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.547940.855608 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q90lE-0000RO-FJ; Tue, 13 Jun 2023 09:56:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 547940.855608; Tue, 13 Jun 2023 09:56:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q90lE-0000PC-Cg; Tue, 13 Jun 2023 09:56:24 +0000
Received: by outflank-mailman (input) for mailman id 547940;
 Tue, 13 Jun 2023 09:56:23 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=tWOB=CB=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1q90lD-0000P6-2B
 for xen-devel@lists.xenproject.org; Tue, 13 Jun 2023 09:56:23 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8c69079b-09d0-11ee-b232-6b7b168915f2;
 Tue, 13 Jun 2023 11:56:21 +0200 (CEST)
Received: from [192.168.1.88] (unknown [176.206.20.8])
 by support.bugseng.com (Postfix) with ESMTPSA id 83DCE4EE073F
 for <xen-devel@lists.xenproject.org>; Tue, 13 Jun 2023 11:56:20 +0200 (CEST)
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
X-Inumbo-ID: 8c69079b-09d0-11ee-b232-6b7b168915f2
Content-Type: multipart/alternative;
 boundary="------------sgipg8zKbYjPxXItngEYtImS"
Message-ID: <c1d32438-fdef-fdc6-d4e9-e09fd13db9a1@bugseng.com>
Date: Tue, 13 Jun 2023 11:56:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [XEN PATCH] xen: fixed violations of MISRA C:2012 Rule 3.1
Content-Language: en-US
To: xen-devel@lists.xenproject.org
References: <e139df541183df7c92b3bd73841cf1fb2851e054.1686575613.git.nicola.vetrini@bugseng.com>
 <42cb13a7-3b62-8d48-a1a1-3094a7bd07fa@suse.com>
From: nicola <nicola.vetrini@bugseng.com>
In-Reply-To: <42cb13a7-3b62-8d48-a1a1-3094a7bd07fa@suse.com>

This is a multi-part message in MIME format.
--------------sgipg8zKbYjPxXItngEYtImS
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On 13/06/23 10:27, Jan Beulich wrote:

> On 13.06.2023 09:42, Nicola Vetrini wrote:
>> --- a/xen/common/xmalloc_tlsf.c
>> +++ b/xen/common/xmalloc_tlsf.c
>> @@ -140,9 +140,10 @@ static inline void MAPPING_SEARCH(unsigned long *r, int *fl, int *sl)
>>           *fl = flsl(*r) - 1;
>>           *sl = (*r >> (*fl - MAX_LOG2_SLI)) - MAX_SLI;
>>           *fl -= FLI_OFFSET;
>> -        /*if ((*fl -= FLI_OFFSET) < 0) // FL will be always >0!
>> -         *fl = *sl = 0;
>> -         */
>> +#if 0
>> +        if ((*fl -= FLI_OFFSET) < 0) // FL will be always >0!
>> +        fl = *sl = 0;
> You want to get indentation right here, and you don't want to lose
> the indirection on fl.

Understood.


>> +#endif
>>           *r &= ~t;
>>       }
>>   }
> If you split this to 4 patches, leaving the URL proposal in just
> the cover letter, then I think this one change (with the adjustments)
> could go in right away. Similarly I expect the arm64/flushtlb.h
> change could be ack-ed right away by an Arm maintainer.
Ok. I do not understand what you mean by "leaving the URL proposal in 
just the cover letter". Which URL?



I'm sorry, I didn't notice your previous reply. I'm going to address 
your observations now:

> Here "propose" is appropriate in the description, as this is something 
> the patch does not do. Further down, however, you mean to describe 
> what the patch does, not what an eventual patch might do.
>
To my knowledge, there is not a standard format to define a project 
deviation for a certain MISRA rule in Xen right now (this can also be 
discussed in a separate thread). To clarify, I meant to describe why I 
wasn't addressing these violations in the patch (they are the vast 
majority, but they do not have any implication w.r.t. functional safety 
and can therefore be safely deviated with an appropriate written 
justification).


> Somewhat similarly you don't want to use past tense in the title, as
> that wants to describe what is being done, rather than describing a
> patch that has already landed.

Understood.


> and it would avoid the somewhat odd splitting of adjacent comments
> (which then is at risk of someone later coming forward with a patch
> re-combining them).
>
> >/--- a/xen/include/xen/atomic.h/
> >/+++ b/xen/include/xen/atomic.h/
> >/@@ -71,7 +71,10 @@ static inline void _atomic_set(atomic_t *v, int i);/
> >/* Returns the initial value in @v, hence succeeds when the return value/
> >/* matches that of @old./
> >/*/
> >/- * Sample (tries atomic increment of v until the operation succeeds):/
> >/+ *//
> >/+/**/
> >/+ */
> >/+ * Code sample: Tries atomic increment of v until the operation 
> succeeds./
> >/*/
> >/* while(1)/
> >/* {/
>
> Somewhat similarly here: I don't think the inner comment provides
> much value, and could hence be dropped instead of splitting the comment.

The rationale behind these modifications was to separate clearly 
comments and code samples, so that the latter can be easily deviated by 
tool configurations. I'm ok with the suggestion of removing the nested 
comments, and otherwise leave the code as is, but i'll probably do this 
by splitting the patch as you suggested above.

Regards,

   Nicola

--------------sgipg8zKbYjPxXItngEYtImS
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p><br>
    </p>
    <p>On 13/06/23 10:27, Jan Beulich wrote:<br>
    </p>
    <blockquote type="cite"
      cite="mid:42cb13a7-3b62-8d48-a1a1-3094a7bd07fa@suse.com">
      <pre class="moz-quote-pre" wrap="">On 13.06.2023 09:42, Nicola Vetrini wrote:
</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">--- a/xen/common/xmalloc_tlsf.c
+++ b/xen/common/xmalloc_tlsf.c
@@ -140,9 +140,10 @@ static inline void MAPPING_SEARCH(unsigned long *r, int *fl, int *sl)
         *fl = flsl(*r) - 1;
         *sl = (*r &gt;&gt; (*fl - MAX_LOG2_SLI)) - MAX_SLI;
         *fl -= FLI_OFFSET;
-        /*if ((*fl -= FLI_OFFSET) &lt; 0) // FL will be always &gt;0!
-         *fl = *sl = 0;
-         */
+#if 0
+        if ((*fl -= FLI_OFFSET) &lt; 0) // FL will be always &gt;0!
+        fl = *sl = 0;
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
You want to get indentation right here, and you don't want to lose
the indirection on fl.</pre>
    </blockquote>
    <p>Understood.</p>
    <p><br>
    </p>
    <p>
    </p>
    <blockquote type="cite"
      cite="mid:42cb13a7-3b62-8d48-a1a1-3094a7bd07fa@suse.com">
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">+#endif
         *r &amp;= ~t;
     }
 }
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
If you split this to 4 patches, leaving the URL proposal in just
the cover letter, then I think this one change (with the adjustments)
could go in right away. Similarly I expect the arm64/flushtlb.h
change could be ack-ed right away by an Arm maintainer.</pre>
    </blockquote>
    Ok. I do not understand what you mean by "leaving the URL proposal
    in just the cover letter". Which URL?<br>
    <p><br>
    </p>
    <p><br>
    </p>
    <p>I'm sorry, I didn't notice your previous reply. I'm going to
      address your observations now:</p>
    <pre><blockquote type="cite"><p class="moz-quote-pre" wrap="">Here "propose" is appropriate in the description, as this is something
the patch does not do. Further down, however, you mean to describe what
the patch does, not what an eventual patch might do.</p></blockquote></pre>
    <p>To my knowledge, there is not a standard format to define a
      project deviation for a certain MISRA rule in Xen right now (this
      can also be discussed in a separate thread). To clarify, I meant
      to describe why I wasn't addressing these violations in the patch
      (they are the vast majority, but they do not have any implication
      w.r.t. functional safety and can therefore be safely deviated with
      an appropriate written justification).</p>
    <p><br>
    </p>
    <p>
    </p>
    <pre><blockquote type="cite"><pre class="moz-quote-pre" wrap="">Somewhat similarly you don't want to use past tense in the title, as
that wants to describe what is being done, rather than describing a
patch that has already landed.</pre></blockquote></pre>
    <p>Understood.</p>
    <p>
    </p>
    <p><br>
      <blockquote type="cite">
        <pre>
and it would avoid the somewhat odd splitting of adjacent comments
(which then is at risk of someone later coming forward with a patch
re-combining them).

&gt;<i> --- a/xen/include/xen/atomic.h</i>
&gt;<i> +++ b/xen/include/xen/atomic.h</i>
&gt;<i> @@ -71,7 +71,10 @@ static inline void _atomic_set(atomic_t *v, int i);</i>
&gt;<i>   * Returns the initial value in @v, hence succeeds when the return value</i>
&gt;<i>   * matches that of @old.</i>
&gt;<i>   *</i>
&gt;<i> - * Sample (tries atomic increment of v until the operation succeeds):</i>
&gt;<i> + */</i>
&gt;<i> +/**</i>
&gt;<i> + *</i>
&gt;<i> + * Code sample: Tries atomic increment of v until the operation succeeds.</i>
&gt;<i>   *</i>
&gt;<i>   *  while(1)</i>
&gt;<i>   *  {</i>

Somewhat similarly here: I don't think the inner comment provides
much value, and could hence be dropped instead of splitting the comment.</pre>
      </blockquote>
    </p>
    <p>The rationale behind these modifications was to separate clearly
      comments and code samples, so that the latter can be easily
      deviated by tool configurations. I'm ok with the suggestion of
      removing the nested comments, and otherwise leave the code as is,
      but i'll probably do this by splitting the patch as you suggested
      above.</p>
    <p>Regards,</p>
    <p>  Nicola<br>
    </p>
  </body>
</html>

--------------sgipg8zKbYjPxXItngEYtImS--

