Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EA42993E88
	for <lists+xen-devel@lfdr.de>; Tue,  8 Oct 2024 07:59:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.812623.1225399 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sy3Fa-0002vx-5v; Tue, 08 Oct 2024 05:59:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 812623.1225399; Tue, 08 Oct 2024 05:59:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sy3Fa-0002uT-38; Tue, 08 Oct 2024 05:59:14 +0000
Received: by outflank-mailman (input) for mailman id 812623;
 Tue, 08 Oct 2024 05:59:12 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Vy9o=RE=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sy3FY-0002uI-FC
 for xen-devel@lists.xenproject.org; Tue, 08 Oct 2024 05:59:12 +0000
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [2a00:1450:4864:20::42d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 701a3ecd-853a-11ef-a0bc-8be0dac302b0;
 Tue, 08 Oct 2024 07:59:11 +0200 (CEST)
Received: by mail-wr1-x42d.google.com with SMTP id
 ffacd0b85a97d-37ce9644daaso3414114f8f.3
 for <xen-devel@lists.xenproject.org>; Mon, 07 Oct 2024 22:59:10 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5c8e05eb34csm3927725a12.59.2024.10.07.22.59.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 07 Oct 2024 22:59:09 -0700 (PDT)
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
X-Inumbo-ID: 701a3ecd-853a-11ef-a0bc-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1728367150; x=1728971950; darn=lists.xenproject.org;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=26d1rfUuMlhiGKmx+jD5HJ+W6LdLEy3kLIG52H3Zkcg=;
        b=RhQ5O4w2+WtVWTOZ7Jq+x5Nh6RugiYyOmquOLLsRVGEgk0JB7hyx25OZ+7ov8SFFtQ
         Jx1Xjs4Cu91yh01dcOTFuPwiiKYhhcEQJcmmi7F2P+R2qL50r+ElfbfagEO6GDc50hxn
         W2ns/V6/3F2/13jfBPQ4qTtt2UUf/Awdgn1JunhGKW5dRGoJwd92UQhAeMK/8dcIdrc3
         Y/4QsAiAMh+GznXB0sYI8f4wS15nypSwCfEsLNcyVWNbOPxzaaZTwlYNshlfXPNrTUeF
         zuTl+eh3RiufGmVpPuQ4DvLY3JaEQpH7Xmmm+GvP6gZ/tHKPftO7ahbFkzBMcWloSBO3
         SQQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728367150; x=1728971950;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=26d1rfUuMlhiGKmx+jD5HJ+W6LdLEy3kLIG52H3Zkcg=;
        b=l3m9/tiXGS/Tnjt5dYOiXukzruELit0lMdmWmOXADUkyh+uWRvYpP6ARDGFpq3knLB
         /69EBxUDuWvSZBUDl3PFA550TBIwWP3uJJ/2sPITDoYUTuWbsq7a3ZVIzUcD4ImAIjIG
         pUNsWZOk6v6njVvGxGT7Pj8o3nzUF7i/KovItiWWRA7RyaG2AziJhD/Fi2F2o993zz+R
         ywKPEKhWZXnJhljqjOr/BNQwxgVVblSrm35BxKAiFM2IupQa6ieftjtw5upI6rkXzdef
         I0Mpy+x1PC//2jEbbVr0TWcPKNOgELRQT79vr72bseVv5Es18Z6g/cKAJA55gVMiwi/X
         60fg==
X-Forwarded-Encrypted: i=1; AJvYcCVsX5nSxVpyW/QtfBEHM4Hw+CNjSKC4Ar5b4kKuDAoHMd93AeFQahX4Ub5nbnwnScGCi5k9XFEjqzM=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxE2kI2bhISqOGr92i/5M9RwhqlaogAlgEyEr/ddaZh+C84uKiR
	xSRAWIGGc4wW/J009jMiw9b5iLjZ2ixVOPg0g5/a3FSY3csWKAZFAtHtsarL1g==
X-Google-Smtp-Source: AGHT+IELPQp8jecRWkGRxxwA4EWYRUz9X79CLIDpxh6rGKDwJZ1Drp/Db9L6rlIYfTmX/96abZw1Wg==
X-Received: by 2002:a5d:4411:0:b0:377:9867:9028 with SMTP id ffacd0b85a97d-37d0e8e2837mr8260587f8f.44.1728367150112;
        Mon, 07 Oct 2024 22:59:10 -0700 (PDT)
Content-Type: multipart/mixed; boundary="------------2zBCrRS4K8n5HsxT4n0sMbJF"
Message-ID: <1f8f6a0c-980f-43cb-9967-801641f8dbc0@suse.com>
Date: Tue, 8 Oct 2024 07:59:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH v2 1/3] EFI: address a violation of MISRA C Rule 13.6
To: Roberto Bagnara <roberto.bagnara@bugseng.com>,
 Stefano Stabellini <sstabellini@kernel.org>
Cc: Federico Serafini <federico.serafini@bugseng.com>,
 consulting@bugseng.com, "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>, Andrew Cooper
 <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
References: <cover.1727690180.git.federico.serafini@bugseng.com>
 <c447f9faf0283bc6b83bbfbf05acd7acca00762d.1727690180.git.federico.serafini@bugseng.com>
 <b4fafd2c-d71a-4336-b009-07f3474f5a04@suse.com>
 <a8dfe133-6f9b-4a26-918b-d0531d6af918@bugseng.com>
 <8d5e4761-9fc2-4e18-a6c2-9df1822dbbea@suse.com>
 <alpine.DEB.2.22.394.2410011431360.451631@ubuntu-linux-20-04-desktop>
 <02833aad-d6f1-4ffa-8d4a-d8c31e9b0524@suse.com>
 <2f51a8e7-4044-4a84-a541-100799a28012@bugseng.com>
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
Autocrypt: addr=jbeulich@suse.com; keydata=
 xsDiBFk3nEQRBADAEaSw6zC/EJkiwGPXbWtPxl2xCdSoeepS07jW8UgcHNurfHvUzogEq5xk
 hu507c3BarVjyWCJOylMNR98Yd8VqD9UfmX0Hb8/BrA+Hl6/DB/eqGptrf4BSRwcZQM32aZK
 7Pj2XbGWIUrZrd70x1eAP9QE3P79Y2oLrsCgbZJfEwCgvz9JjGmQqQkRiTVzlZVCJYcyGGsD
 /0tbFCzD2h20ahe8rC1gbb3K3qk+LpBtvjBu1RY9drYk0NymiGbJWZgab6t1jM7sk2vuf0Py
 O9Hf9XBmK0uE9IgMaiCpc32XV9oASz6UJebwkX+zF2jG5I1BfnO9g7KlotcA/v5ClMjgo6Gl
 MDY4HxoSRu3i1cqqSDtVlt+AOVBJBACrZcnHAUSuCXBPy0jOlBhxPqRWv6ND4c9PH1xjQ3NP
 nxJuMBS8rnNg22uyfAgmBKNLpLgAGVRMZGaGoJObGf72s6TeIqKJo/LtggAS9qAUiuKVnygo
 3wjfkS9A3DRO+SpU7JqWdsveeIQyeyEJ/8PTowmSQLakF+3fote9ybzd880fSmFuIEJldWxp
 Y2ggPGpiZXVsaWNoQHN1c2UuY29tPsJgBBMRAgAgBQJZN5xEAhsDBgsJCAcDAgQVAggDBBYC
 AwECHgECF4AACgkQoDSui/t3IH4J+wCfQ5jHdEjCRHj23O/5ttg9r9OIruwAn3103WUITZee
 e7Sbg12UgcQ5lv7SzsFNBFk3nEQQCACCuTjCjFOUdi5Nm244F+78kLghRcin/awv+IrTcIWF
 hUpSs1Y91iQQ7KItirz5uwCPlwejSJDQJLIS+QtJHaXDXeV6NI0Uef1hP20+y8qydDiVkv6l
 IreXjTb7DvksRgJNvCkWtYnlS3mYvQ9NzS9PhyALWbXnH6sIJd2O9lKS1Mrfq+y0IXCP10eS
 FFGg+Av3IQeFatkJAyju0PPthyTqxSI4lZYuJVPknzgaeuJv/2NccrPvmeDg6Coe7ZIeQ8Yj
 t0ARxu2xytAkkLCel1Lz1WLmwLstV30g80nkgZf/wr+/BXJW/oIvRlonUkxv+IbBM3dX2OV8
 AmRv1ySWPTP7AAMFB/9PQK/VtlNUJvg8GXj9ootzrteGfVZVVT4XBJkfwBcpC/XcPzldjv+3
 HYudvpdNK3lLujXeA5fLOH+Z/G9WBc5pFVSMocI71I8bT8lIAzreg0WvkWg5V2WZsUMlnDL9
 mpwIGFhlbM3gfDMs7MPMu8YQRFVdUvtSpaAs8OFfGQ0ia3LGZcjA6Ik2+xcqscEJzNH+qh8V
 m5jjp28yZgaqTaRbg3M/+MTbMpicpZuqF4rnB0AQD12/3BNWDR6bmh+EkYSMcEIpQmBM51qM
 EKYTQGybRCjpnKHGOxG0rfFY1085mBDZCH5Kx0cl0HVJuQKC+dV2ZY5AqjcKwAxpE75MLFkr
 wkkEGBECAAkFAlk3nEQCGwwACgkQoDSui/t3IH7nnwCfcJWUDUFKdCsBH/E5d+0ZnMQi+G0A
 nAuWpQkjM1ASeQwSHEeAWPgskBQL
In-Reply-To: <2f51a8e7-4044-4a84-a541-100799a28012@bugseng.com>

This is a multi-part message in MIME format.
--------------2zBCrRS4K8n5HsxT4n0sMbJF
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 02.10.2024 08:54, Roberto Bagnara wrote:
> On 2024-10-02 08:09, Jan Beulich wrote:
>> On 01.10.2024 23:36, Stefano Stabellini wrote:
>>> On Tue, 1 Oct 2024, Jan Beulich wrote:
>>>> On 01.10.2024 07:25, Roberto Bagnara wrote:
>>>>> On 2024-09-30 15:07, Jan Beulich wrote:
>>>>>> On 30.09.2024 14:49, Federico Serafini wrote:
>>>>>>> guest_handle_ok()'s expansion contains a sizeof() involving its
>>>>>>> first argument which is guest_handle_cast().
>>>>>>> The expansion of the latter, in turn, contains a variable
>>>>>>> initialization.
>>>>>>>
>>>>>>> Since MISRA considers the initialization (even of a local variable)
>>>>>>> a side effect, the chain of expansions mentioned above violates
>>>>>>> MISRA C:2012 Rule 13.6 (The operand of the `sizeof' operator shall not
>>>>>>> contain any expression which has potential side effect).
>>>>>>
>>>>>> I'm afraid I need to ask for clarification of terminology and alike here.
>>>>>> While the Misra doc has a section on Persistent Side Effects in its
>>>>>> Glossary appendix, what constitutes a side effect from its pov isn't
>>>>>> really spelled out anywhere. Which in turn raises the question whether it
>>>>>> is indeed Misra (and not just Eclair) which deems initialization a side
>>>>>> effect. This is even more so relevant as 13.6 talks of only expressions,
>>>>>> yet initializers fall under declarations (in turn involving an expression
>>>>>> on the rhs of the equal sign).
>>>>>>
>>>>>> All the same of course affects patch 2 then, too.
>>>>>
>>>>> MISRA C leaves the definition of "side effect" to the C Standard.
>>>>> E.g., C18 5.1.2.3p2:
>>>>>
>>>>>     Accessing a volatile object, modifying an object, modifying a file,
>>>>>     or calling a function that does any of those operations are all
>>>>>     side effects,[omitted irrelevant footnote reference] which are
>>>>>     changes in the state of the execution environment.
>>>>>
>>>>> The MISRA C:2012/2023 Glossary entry for "Persistent side effect"
>>>>> indirectly confirms that initialization is always a side effect.
>>>>
>>>> Hmm, that's interesting: There's indeed an example with an initializer
>>>> there. Yet to me the text you quote from the C standard does not say
>>>> that initialization is a side effect - it would be "modifying an
>>>> object" aiui, yet ahead of initialization being complete the object
>>>> doesn't "exist" imo, and hence can be "modified" only afterwards.
>>>
>>> I feel it's becoming a bit too philosophical. Since there's some room
>>> for interpretation and only two violations left to address, I believe
>>> it's best to stick with the stricter interpretation of the definition.
>>> Therefore, I'd proceed with this series in its current form.
>>
>> Proceeding with the series in its current form may be okay (as you say,
>> you view the changes as readability improvements anyway), but imo the
>> interpretation needs settling on no matter what. In fact even for these
>> two patches it may affect what their descriptions ought to say (would
>> be nice imo to avoid permanently recording potentially misleading
>> information by committing as is). And of course clarity would help
>> dealing with future instances that might appear. I take it you realize
>> that if someone had submitted a patch adding code similar to the
>> original forms of what's being altered here, it would be relatively
>> unlikely for a reviewer to spot the issue. IOW here we're making
>> ourselves heavily dependent upon Eclair spotting (supposed) issues,
>> adding extra work and delays for such changes to go in.
> 
> You can do two things to obtain a second opinion:
> 
> 1) Use the MISRA forum (here is the link to the forum
>     section devoted to the side-effect rules of MISRA C:2012
>     and MISRA C:2023 (https://forum.misra.org.uk/forumdisplay.php?fid=168).
>     The MISRA C Working Group will, in due course, provide
>     you with an official answer to your questions about what,
>     for the interpretation of Rule 13.6, has to be considered
>     a side effect.
> 
> 2) Reach out to your ISO National Body and try to obtain
>     an official answer from ISO/IEC JTC1/SC22/WG14 (the
>     international standardization working group for the
>     programming language C) to your questions about what the
>     C Standard considers to be side effects.

I took the latter route, and to my (positive) surprise I got back an answer
the same day. There was a request for someone to confirm, but so far I didn't
see further replies. Since this is a German institution I raised the question
in German and got back an answer in German (attached); I've tried my best to
translate this without falsifying anything, but I've omitted non-technical
parts:

"Initialization of an object is never a side effect of the initialization
by itself. Of course expressions used for initialization can themselves have
side effects on other objects.

@Andreas: Do you agree? C after all has a far simpler object model than C++.
The (potential) change in object representation (i.e. the bytes underlying
the object) is not a side effect of object initialization, but its primary
purpose."

Further for Misra she added a reference to a Swiss person, but I think with
Bugseng we have sufficient expertise there.

Jan
--------------2zBCrRS4K8n5HsxT4n0sMbJF
Content-Type: message/rfc822; name="AW: Klarstellung zu ISO/IEC
 JTC1/SC22/WG14.eml"
Content-Disposition: attachment; filename="AW: Klarstellung zu ISO/IEC
 JTC1/SC22/WG14.eml"
Content-Transfer-Encoding: 7bit

Delivered-To: jbeulich@suse.com
Received: by 2002:aa6:d944:0:b0:29e:fd31:2d61 with SMTP id w4csp815882lkc;
        Wed, 2 Oct 2024 06:31:13 -0700 (PDT)
X-Forwarded-Encrypted: i=3; AJvYcCUlFKYRaZYurI/h7lQwXs152YhXa5iwjjWQYctxdsY+sbL897nj3ukkJ9Bg3+drc2kvK2webpch8A==@suse.com
X-Google-Smtp-Source: AGHT+IFcRQYJ5yGqL8Ek4N3GF+m4qWcUaFbE6DfiTpe9tSR3G+Ut0B7svl+CrxUKa/uhWZFoi2ir
X-Received: by 2002:a05:6000:e11:b0:37c:ced1:dd06 with SMTP id ffacd0b85a97d-37cfb9f9ccbmr1874792f8f.41.1727875873631;
        Wed, 02 Oct 2024 06:31:13 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1727875873; cv=pass;
        d=google.com; s=arc-20240605;
        b=Ccsmv0tSonPNOmraBzwBXS3zs8xzOLjV8jSifYGhBVO2J0O/1+ul+u+ly3WtnqRR70
         GRKB7a+0GGpnFST969+Syw6GOwi4Rqq61CYguA8Kaisc5kZxaVWAmnfXTNnFDmnZt5lo
         dnle60GSE3eLKBsmo9Gufw9fD4EVvc1HlXqdLNggfjxitEDYEFcqfvOkClAMKsQLGR3N
         KTY1uuZkOD2O+6P+qHI5m54C+1aUeHkUzMPHRd9H+SR3r6WMCG8F84RhR+Vw+u9p+xR+
         EYRLbZr2ffVhkM/Ewok4mbW+QibOrtfXoURvdLlgoP3mVqUBTU8jTfWyQGHa8YVX3jIw
         yVmg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=importance:content-transfer-encoding:mime-version:subject
         :references:in-reply-to:message-id:cc:to:from:date:dkim-signature
         :dkim-signature;
        bh=gqLzixRFcExxmwgQxITcEHF+zRUaT8QWyXD37Sf7WF4=;
        fh=wjE6VCDYDgSWmMpPztkPEeR7njgHslLn8MmGM3lclnI=;
        b=NfDr9hJCAEEloGqHJW5XvsxJuXCTuNe1wvcmSUlm19mdO+L1wlAYUVWvVsYeki56DW
         i60MNPV3tEY5lksIWxJqHMhzdF78NNtm97DWr8bTkzzqJbtaVEpfqfGlhUpcqe2/eOBf
         p1qRpSlD+kec+zyy8Y2w/9hCy27TkJWQTLc3mnVH1XDdr3V9v8alQ59/3mIMNlGLjb6b
         ybuRFPCm9HSSfwq2R3u6Qvls4XsIMpb4F+ftIPM5cBn1Z26HxqM5fSUpwXKSP7It6g5r
         xFpemWpu3cro+1osIt3d1FLhtTYfuGmdNB45TvCLvnCvfvb1a6jN7C7f5vH2OLxXN56m
         /rSw==;
        dara=google.com
ARC-Authentication-Results: i=2; mx.google.com;
       dkim=pass header.i=@ngrt.de header.s=strato-dkim-0002 header.b=Av+BfH85;
       dkim=neutral (no key) header.i=@ngrt.de header.s=strato-dkim-0003;
       arc=pass (i=1);
       spf=pass (google.com: domain of dani@ngrt.de designates 85.215.255.24 as permitted sender) smtp.mailfrom=dani@ngrt.de
Return-Path: <dani@ngrt.de>
Received: from mo4-p00-ob.smtp.rzone.de (mo4-p00-ob.smtp.rzone.de. [85.215.255.24])
        by mx.google.com with ESMTPS id ffacd0b85a97d-37cd56cf6c8si5300144f8f.617.2024.10.02.06.31.13
        for <jbeulich@suse.com>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Oct 2024 06:31:13 -0700 (PDT)
Received-SPF: pass (google.com: domain of dani@ngrt.de designates 85.215.255.24 as permitted sender) client-ip=85.215.255.24;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@ngrt.de header.s=strato-dkim-0002 header.b=Av+BfH85;
       dkim=neutral (no key) header.i=@ngrt.de header.s=strato-dkim-0003;
       arc=pass (i=1);
       spf=pass (google.com: domain of dani@ngrt.de designates 85.215.255.24 as permitted sender) smtp.mailfrom=dani@ngrt.de
ARC-Seal: i=1; a=rsa-sha256; t=1727875873; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=Abrj5yW+HdijCFE1QHmPhJ02h0qBgoyX/e5PcMv+3s2FoJkI4t+NPpVKqr0POW4ECa
    Xgk5eujrEcBsdWp/T2bIFfAD1R6xKeE3h4qwR/uHOc8ISLSUGVqVLsw3Iet55evVqJvF
    bIOv1GhgjGa+PWZt2Jrm9cNxfNFrgndjk8ocLZ3NclYudDn0XSg20Xy4zyxaubLCCx51
    GfCGk4TSmvrtYVZWGSZHswYQNXJzq8zcu3vuacSbL4WOjgQbmLu/5UDpfZmSHxmzegYL
    IPXZ89Kom/KFepabWl/WMOXuG4AzCXKlHZOR04WMd4jZvjlOv63VzpGJAKLTqFvc+fN/
    uTgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1727875873;
    s=strato-dkim-0002; d=strato.com;
    h=Subject:References:In-Reply-To:Message-ID:Cc:To:From:Date:Cc:Date:
    From:Subject:Sender;
    bh=gqLzixRFcExxmwgQxITcEHF+zRUaT8QWyXD37Sf7WF4=;
    b=Q6XWALr3hfdXMnqQIn14d+NatToraGG7HjA+ToS4UJnpVVhWJsG8qBlpaLvfKi2Lup
    Qlm4yTf4DNp67XkjDA9cYEwYtQbudIer1MShNaMXtc6z9bxsGXL/Oh6kCGqpsDZMJMcE
    dQ9+bxry2PVfYO6BIuenMt3aZI0pXIySzB3QpSkfDKbaSnSPDmlSmrNsiImU9h/hRzhk
    LyCx2iyrQWADTgx0EW+XrTitYSIfoCB0XZUI4Dhe9ne9J0h80OCH+4XiFYx6xNzLKaUS
    dkBc8oYdBFigoDwv9POQmOF2w7FuUqMtKd70EgaFKNTtnxyrKJlxFxlpO0QJo7CS4VcM
    rU6w==
ARC-Authentication-Results: i=1; strato.com;
    arc=none;
    dkim=none
X-RZG-CLASS-ID: mo00
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1727875873;
    s=strato-dkim-0002; d=ngrt.de;
    h=Subject:References:In-Reply-To:Message-ID:Cc:To:From:Date:Cc:Date:
    From:Subject:Sender;
    bh=gqLzixRFcExxmwgQxITcEHF+zRUaT8QWyXD37Sf7WF4=;
    b=Av+BfH85GQ9ECzlC4ADD6WurBdFbutoMfQszQfBszTRyiVM0TZE/YCwdV5tJE/Z5QM
    db5xpXW2zg2FkzaT14cB2Or9totjrPSiybbSojijvlUHD27zXgoAYb5oHqFOf3Xt4UPf
    yGlt3ejah93HiRFZic7Uh+zgvlZsPO8aS9LAeXgm7cpogDbNRosTYSU71iN2gLHPLo9k
    g7X0OGkPjbAUC6pJXcynPdM9VoFy9rZ8alUgA/AoTmMvQn8jV9YYoAzq7m77Cnh2q7b5
    Tf663YZ4+2805MFrhp9HRZq7/L09fOAdz6mrS7pYiO+Cc8/IZRWA61fwIAlvXrOJ07bb
    kQYQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1727875873;
    s=strato-dkim-0003; d=ngrt.de;
    h=Subject:References:In-Reply-To:Message-ID:Cc:To:From:Date:Cc:Date:
    From:Subject:Sender;
    bh=gqLzixRFcExxmwgQxITcEHF+zRUaT8QWyXD37Sf7WF4=;
    b=wTBbHMhx/6GL9ys4qh7ER/wiHOfilLdOTdyXjfV/FPFuBt/3BrY3K6woEJ+TNJiQre
    9hXojmNrDT/tjWbkriAg==
X-RZG-AUTH: ":KG0KfGCmfO2xIKhf4vD7ORHThey/wL2HBH6a3w/S2CcNEt1015DndVmP"
Received: from ox-live-app302.back.ox.d0m.de
    by smtp-ox.front (RZmta 51.2.8 AUTH)
    with ESMTPSA id g2ce28092DVCZRm
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (curve X9_62_prime256v1 with 256 ECDH bits, eq. 3072 bits RSA))
	(Client did not present a certificate);
    Wed, 2 Oct 2024 15:31:12 +0200 (CEST)
Date: Wed, 2 Oct 2024 15:31:12 +0200 (CEST)
From: Daniela Engert <dani@ngrt.de>
To: =?UTF-8?Q?Wellh=C3=B6fer=2C_Johannes?= <Johannes.Wellhoefer@din.de>,
	"jbeulich@suse.com" <jbeulich@suse.com>
Cc: Andreas Weis <der_ghulbus@ghulbus-inc.de>
Message-ID: <1532591295.2404908.1727875872865@com4.strato.de>
In-Reply-To: <BEZP281MB186263DD7EAE62D49202FDCC83702@BEZP281MB1862.DEUP281.PROD.OUTLOOK.COM>
References: <1967078726.21.1727857048144@cae-live-2-1.cae.dg-init-cm-int-prod.svc.cluster.local>
 <BEVP281MB3443E83F6317B6087B01AC91AE702@BEVP281MB3443.DEUP281.PROD.OUTLOOK.COM>
 <BEZP281MB186263DD7EAE62D49202FDCC83702@BEZP281MB1862.DEUP281.PROD.OUTLOOK.COM>
Subject: Re: AW: Klarstellung zu ISO/IEC JTC1/SC22/WG14
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Priority: 3
Importance: Normal
X-Mailer: Open-Xchange Mailer v7.10.6-Rev68
X-Originating-Client: open-xchange-appsuite

Hallo zusammen,

bitte nicht wundern, aber sobald ich "Ingenieur" rieche, bin ich sofort bei=
m "Du" (bin ja selber eine).
Mein Hauptfokus liegt zwar auf C++, und C ist f=C3=BCr mich ein "Seiteneffe=
kt", aber diese Frage kann ich vermutlich ebenfalls beantworten:

Die Initialisierung eines Objekts ist niemals ein Seiteneffekt der Initiali=
sierung von sich selbst. In den Expressions, welche zur Initialisierung eva=
luiert werden, k=C3=B6nnen jedoch sehr wohl Seiteneffekte in anderen Objekt=
en auftreten.

@Andreas: kannst du dem zustimmen? C hat ja ein sehr viel einfacheres Objek=
tmodell als C++. Die (potentielle) =C3=84nderung der Objektrepr=C3=A4sentat=
ion (d.h. die Bytes, welche das Objekt hinterlegen) ist ja kein Seiteneffek=
t der Objektinitialisierung, sondern sein prim=C3=A4rer Zweck.

Wenn es um MISRA geht, w=C3=A4re sicherlich P. Sommerlad der richtige Anspr=
echpartner (https://sommerlad.ch/). Ansonsten tagt das WG14 Komittee gerade=
, gro=C3=9Fe Teile der WG14 Tafelrunde sind versammelt, Robert Seacord ist =
sein Chair.

lG Daniela



> Wellh=C3=B6fer, Johannes <johannes.wellhoefer@din.de> hat am 02.10.2024 1=
5:02 CEST geschrieben:
>=20
>=20
> Danke Manuela, f=C3=BCrs weiterleiten.
> =20
>  Sehr geehrter Herr Beulich,=20
> =20
>  vielen Dank f=C3=BCr Ihre Anfrage. Ich habe Frau Engert hier mit in den =
Emailverlauf genommen. Sie arbeitet als deutsche Expertin in der JTC1/SC22/=
WG14 mit.
>=20
> @Daniela Engert k=C3=B6nnen Sie Herrn Beulich mit seiner Frage (unten im =
Verlauf gelb markiert) weiterhelfen?
> =20
>  Mit freundlichen Gr=C3=BC=C3=9Fen
>=20
> Johannes Wellh=C3=B6fer
> Er/Sein
> Projektmanager
> DIN-Normenausschuss Informationstechnik und Anwendungen (NIA)
> DIN Deutsches Institut f=C3=BCr Normung e. V. =E2=80=93 Industrie und Inf=
ormationstechnik (DIN =E2=80=93 NuS IIT IuA)
>=20
> LinkedIn (https://www.linkedin.com/in/johannes-wellhoefer/) | T +49 30 26=
01-2455 | F +49 30 2601-4-2455 | M +49 174 2007820
> LinkedIn-Kanal des Normenausschusses f=C3=BCr Informationstechnik und Anw=
endungen (https://www.linkedin.com/showcase/din-nia/)
>=20
>=20
>=20
>=20
> Ab sofort kostenlos: Der Normungs-Monitor (https://www.din.de/de/din-und-=
seine-partner/presse/mitteilungen/ab-januar-kostenlos-der-normungs-monitor-=
983794)
> Unkompliziert zu Normungsprojekten Ihrer Branche auf dem Laufenden bleibe=
n
>=20
>=20
> Folgen Sie uns auf=09 https://twitter.com/DIN_Norm=09 https://www.linkedi=
n.com/company/din-ev=09 https://www.youtube.com/user/DINBerlin=09
>=20
> DIN Deutsches Institut f=C3=BCr Normung e. V., Am DIN-Platz, Burggrafenst=
ra=C3=9Fe 6, 10787 Berlin; www.din.de (http://www.din.de/)} Registergericht=
: AG Berlin-Charlottenburg, VR 288 B; Pr=C3=A4sident: Ulrich B. Stoll; Vors=
tand: Christoph Winterhalter (Vorsitzender), Daniel Schmidt;
> Der Inhalt dieser E-Mail (einschlie=C3=9Flich Anh=C3=A4ngen) ist vertraul=
ich. Falls Sie diese E-Mail versehentlich erhalten haben, l=C3=B6schen Sie =
sie bitte und informieren den Absender. The contents of this e-mail (includ=
ing attachments) are confidential. If you received this e-mail in error, pl=
ease delete it and notify the sender.
> -----Urspr=C3=BCngliche Nachricht-----
>  Von: Tillack-L=C3=BCbke, Manuela <Manuela.Tillack-luebke@din.de>=20
>  Gesendet: Mittwoch, 2. Oktober 2024 12:09
>  An: Wellh=C3=B6fer, Johannes <Johannes.Wellhoefer@din.de>
>  Betreff: WG: Klarstellung zu ISO/IEC JTC1/SC22/WG14
>=20
> Lieber Johannes,
>=20
> zust=C3=A4ndigkeitshalber bitte ich Dich um Beantwortung der unten angef=
=C3=BCgten Anfrage. Vielen Dank.
>=20
>=20
> Mit besten Gr=C3=BC=C3=9Fen
>=20
> Manuela
> AP A. 634
> -=C2=A02419
>=20
>=20
>=20
> -----Urspr=C3=BCngliche Nachricht-----
> Von: info@din.de <info@din.de>
> Gesendet: Mittwoch, 2. Oktober 2024 10:17
> An: DIN Info <DIN-Info@din.de>
> Betreff: Klarstellung zu ISO/IEC JTC1/SC22/WG14
>=20
> Guten Tag,
>=20
> folgende Nachricht wurde auf https://www.din.de/de an Sie geschickt.
>=20
> Guten Tag,
>=20
> im Zusammenhang mit Misra C:2012 ist eine Interpretationsfrage zum C99 St=
andard (ISO/IEC 9899:TC3) aufgetaucht. Zur Kl=C3=A4rung wurde ich an den IS=
O National Body verwiesen, der - soweit ich feststellen kann - Sie sind.
>=20
> Die eigentliche Frage betrifft "side effects": F=C3=A4llt die Initialisie=
rung eines Objekts auch darunter?
>=20
> In der Hoffnung, dass Sie uns bei der Kl=C3=A4rung behilflich sein k=C3=
=B6nnen, m=C3=B6glicherweise auch durch Verweis an eine andere geeignete St=
elle, vielen Dank im Voraus,
> Jan Beulich
>=20
> Herr Jan Beulich
> jbeulich@suse.com

--------------2zBCrRS4K8n5HsxT4n0sMbJF--

