Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E5D5B20398
	for <lists+xen-devel@lfdr.de>; Mon, 11 Aug 2025 11:30:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1077157.1438232 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ulOqq-0004fd-Fh; Mon, 11 Aug 2025 09:29:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1077157.1438232; Mon, 11 Aug 2025 09:29:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ulOqq-0004dS-Bb; Mon, 11 Aug 2025 09:29:56 +0000
Received: by outflank-mailman (input) for mailman id 1077157;
 Mon, 11 Aug 2025 09:29:54 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=MOyo=2X=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1ulOqo-0004dM-TO
 for xen-devel@lists.xenproject.org; Mon, 11 Aug 2025 09:29:54 +0000
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com
 [2a00:1450:4864:20::634])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id bcbe3934-7695-11f0-a325-13f23c93f187;
 Mon, 11 Aug 2025 11:29:53 +0200 (CEST)
Received: by mail-ej1-x634.google.com with SMTP id
 a640c23a62f3a-af968aa2de4so760406866b.1
 for <xen-devel@lists.xenproject.org>; Mon, 11 Aug 2025 02:29:53 -0700 (PDT)
Received: from [192.168.1.5] (user-109-243-64-38.play-internet.pl.
 [109.243.64.38]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-af91dfd4b31sm1960350966b.85.2025.08.11.02.29.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 11 Aug 2025 02:29:52 -0700 (PDT)
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
X-Inumbo-ID: bcbe3934-7695-11f0-a325-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754904593; x=1755509393; darn=lists.xenproject.org;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ygEu8Zq34Qj+4eE6Zo2ZjMIiW9SUV/Kk87MPF/tT2VY=;
        b=Se+fbOdXSRtnjVY93xfKRTAdkNeKO7w5QdML5nrEyWeBsIpGtYplrMxyklTGRO62DL
         FtvHnvv6XEclmlvMrlt3SMUpWrL96jzAFtp3GkC/hF+4tSdw1NgieFFS7butWkT19CtI
         SgEPXil/4l8X3w6iCdb+aQ2fvOvUy5IwhOoBu0IZcbgEW+I22BqjFbP/FFEocZrCFyOH
         m4pRxT+Nfp1FEJUorD2R3q+oF+l3/qporEk2yvaoDdV20dtuPzyj1cMgFvKwvDqX6fny
         Jff4yx6C4Wn8sd7mQlskzgoPjuHJa7C1NLt8jBxb4b7LfKCJmsyDcCbdKmjMrfJ70963
         M63w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754904593; x=1755509393;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ygEu8Zq34Qj+4eE6Zo2ZjMIiW9SUV/Kk87MPF/tT2VY=;
        b=Clh9/46Wu5c5b8zCHYtV93sxwu5Bbb59iBq+mvoUs36LCG9a8ZrAqgXaCEuncL0ck6
         XAN3EXc78Xr51S2sa+2lN27ittKlU0OTGStmm1D2vK8uons1y25hYvbs3bBY4RPVIODE
         XU+3b5DesxS/q7ARQIS17EetI0JfCvVUZ3si/lGOpVEuhdMTcYPnRpytCIJVEeblmK5F
         brOTDX9tgj5ZdnLAphy7Vz1GFrSHR8loDyLR0QlkOg3aHSwzzaHLy3MQNfOKNZIzLYI4
         lS3izbo0W7Es8VWrE0nriao9gSKmr5oKfxu40idJNSExlI+Npr1nrWd66eA6zu53fEtj
         mtrA==
X-Forwarded-Encrypted: i=1; AJvYcCVKJMqVJDQh6kVE1N7Es0aXUO0qsiXBm6Ri1x5czDPKvScCxVLHA+cvtnla9rvHSiDe0T4Pfwnlt1g=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzJt+sF+hzl8dV4nHh5j3N72eqShwJi4aM0ZXU1sh0Lo9B26pcf
	Xs1OSaUGhVUPHvpYUrqPMiXKuoSIvk1yH477P48/tcVaqD/W0+XmUCEL
X-Gm-Gg: ASbGncuqRPurHH/WgFrEpCepcL7+sM5xkkb5yPmr6pCgBnBOhJUrEcveFIwPS7s15qx
	NCGLTphepTPf9+NjcCIAggU2QFDhrQ+yfexoR9sU4ehWjBlpQKMb8JnbkKyf0Fl4ZVNvQMZoE3P
	GFcbkkgS95IsMuW6+FdlKsTOi5tu0zUbLcof7U0/LkIW9/cswcVq8cPC3IJ3o5/dURyZ+w3p6e+
	+cB+xMXooZ/N4PFG+bxbBN9uOcc3neCaHlP6E7Jeq4pYTa02/YWtcNYwnccVdoUponYVNbFZUxN
	9k++znbnnOdehT+/QiV3PtYU2MDM2dcGk2KW6d80gXTdJTK++qJ4E1WB/8GvYh9mTldz0741w6k
	SsiAQzwyPodXN6UfxkrNkfd1NFnmw8NTNB02mjk+FthsJZYj1BdDFxf0heUBiwjuAE/M6xcU=
X-Google-Smtp-Source: AGHT+IFd8UJ5bwzo5FO2pkFNIF2c/faOTe1hNAdhQI7m35AbUmaa/g9grOw+c3n8D7pUpk1qvlr0yw==
X-Received: by 2002:a17:906:730a:b0:af9:c31c:eeca with SMTP id a640c23a62f3a-af9c6546458mr1234671566b.48.1754904593108;
        Mon, 11 Aug 2025 02:29:53 -0700 (PDT)
Content-Type: multipart/alternative;
 boundary="------------ZP86uGEkdA3IPxgR203hpA6P"
Message-ID: <89787fe2-3eea-44b7-ad38-82d0d09be06f@gmail.com>
Date: Mon, 11 Aug 2025 11:29:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 11/20] xen/riscv: implement function to map memory in
 guest p2m
To: Jan Beulich <jbeulich@suse.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org,
 Andrew Cooper <andrew.cooper3@citrix.com>
References: <cover.1753973161.git.oleksii.kurochko@gmail.com>
 <e00dcbecf8f0dbe863628dcc45526100f9ee86a3.1753973161.git.oleksii.kurochko@gmail.com>
 <e7b4b220-4da9-4a87-a4d6-179350849eaa@suse.com>
 <31c75a64-8b69-47ac-9e08-6010fa6cfb9c@gmail.com>
 <ffec4fe0-cca7-40fb-a870-6fdf0201f44a@suse.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <ffec4fe0-cca7-40fb-a870-6fdf0201f44a@suse.com>

This is a multi-part message in MIME format.
--------------ZP86uGEkdA3IPxgR203hpA6P
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 8/11/25 9:28 AM, Jan Beulich wrote:
> On 08.08.2025 15:46, Oleksii Kurochko wrote:
>> On 8/5/25 5:20 PM, Jan Beulich wrote:
>>> On 31.07.2025 17:58, Oleksii Kurochko wrote:
>>>> +/* Unlock the flush and do a P2M TLB flush if necessary */
>>>> +void p2m_write_unlock(struct p2m_domain *p2m)
>>>> +{
>>>> +    /*
>>>> +     * The final flush is done with the P2M write lock taken to avoid
>>>> +     * someone else modifying the P2M wbefore the TLB invalidation has
>>> Nit: Stray 'w'.
>>>
>>>> +     * completed.
>>>> +     */
>>>> +    p2m_tlb_flush_sync(p2m);
>>> Wasn't the plan to have this be conditional?
>> Not really, probably, I misunderstood you before.
>>
>> Previously, I only had|p2m_force_tlb_flush_sync()| here, instead of
>> |p2m_tlb_flush_sync()|, and the latter includes a condition check on
>> |p2m->need_flush|.
> Just to re-iterate my point: Not every unlock will require a flush. Hence
> why I expect the flush to be conditional upon there being an indication
> that some change was done that requires flushing.
>
The flush is actually conditional; the condition is inside
|p2m_tlb_flush_sync()|:
   void p2m_tlb_flush_sync(struct p2m_domain *p2m)
   {
     if ( p2m->need_flush )
       p2m_force_tlb_flush_sync(p2m);
   }

~ Oleksii

--------------ZP86uGEkdA3IPxgR203hpA6P
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
    <div class="moz-cite-prefix">On 8/11/25 9:28 AM, Jan Beulich wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:ffec4fe0-cca7-40fb-a870-6fdf0201f44a@suse.com">
      <pre wrap="" class="moz-quote-pre">On 08.08.2025 15:46, Oleksii Kurochko wrote:
</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">On 8/5/25 5:20 PM, Jan Beulich wrote:
</pre>
        <blockquote type="cite">
          <pre wrap="" class="moz-quote-pre">On 31.07.2025 17:58, Oleksii Kurochko wrote:
</pre>
          <blockquote type="cite">
            <pre wrap="" class="moz-quote-pre">+/* Unlock the flush and do a P2M TLB flush if necessary */
+void p2m_write_unlock(struct p2m_domain *p2m)
+{
+    /*
+     * The final flush is done with the P2M write lock taken to avoid
+     * someone else modifying the P2M wbefore the TLB invalidation has
</pre>
          </blockquote>
          <pre wrap="" class="moz-quote-pre">Nit: Stray 'w'.

</pre>
          <blockquote type="cite">
            <pre wrap="" class="moz-quote-pre">+     * completed.
+     */
+    p2m_tlb_flush_sync(p2m);
</pre>
          </blockquote>
          <pre wrap="" class="moz-quote-pre">Wasn't the plan to have this be conditional?
</pre>
        </blockquote>
        <pre wrap="" class="moz-quote-pre">
Not really, probably, I misunderstood you before.

Previously, I only had|p2m_force_tlb_flush_sync()| here, instead of
|p2m_tlb_flush_sync()|, and the latter includes a condition check on
|p2m-&gt;need_flush|.
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
Just to re-iterate my point: Not every unlock will require a flush. Hence
why I expect the flush to be conditional upon there being an indication
that some change was done that requires flushing.

</pre>
    </blockquote>
    <pre>The flush is actually conditional; the condition is inside
<code data-start="94" data-end="116">p2m_tlb_flush_sync()</code>:
  void p2m_tlb_flush_sync(struct p2m_domain *p2m)
  {
    if ( p2m-&gt;need_flush )
      p2m_force_tlb_flush_sync(p2m);
  }

~ Oleksii</pre>
  </body>
</html>

--------------ZP86uGEkdA3IPxgR203hpA6P--

