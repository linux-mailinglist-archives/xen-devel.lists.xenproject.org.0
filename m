Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C85A2B1E1EC
	for <lists+xen-devel@lfdr.de>; Fri,  8 Aug 2025 08:05:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1074014.1436726 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ukGDA-0005ui-2n; Fri, 08 Aug 2025 06:04:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1074014.1436726; Fri, 08 Aug 2025 06:04:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ukGD9-0005tH-VR; Fri, 08 Aug 2025 06:04:15 +0000
Received: by outflank-mailman (input) for mailman id 1074014;
 Fri, 08 Aug 2025 06:04:14 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=illN=2U=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1ukGD8-0005tB-CI
 for xen-devel@lists.xenproject.org; Fri, 08 Aug 2025 06:04:14 +0000
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [2a00:1450:4864:20::62f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 81a766c9-741d-11f0-a324-13f23c93f187;
 Fri, 08 Aug 2025 08:04:12 +0200 (CEST)
Received: by mail-ej1-x62f.google.com with SMTP id
 a640c23a62f3a-af97c0290dcso323635866b.0
 for <xen-devel@lists.xenproject.org>; Thu, 07 Aug 2025 23:04:13 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-af91a21c06bsm1434159366b.119.2025.08.07.23.04.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 07 Aug 2025 23:04:12 -0700 (PDT)
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
X-Inumbo-ID: 81a766c9-741d-11f0-a324-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1754633052; x=1755237852; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=wE/fhVaUFn7jesFbrfTRvtqsCfjCoY7T1fwfr2b8YIE=;
        b=LIDAVS2k29kC2SiTQoeIbcdTKf2u7s6MyS50jZ9u5H+dMoECPEP1Cyn15/Xf2OjZ+H
         e+q0WEvN1G8vRfB6wVtZx9IHb4fHyq4+JkaGqnoOuZeB02kDKS7hZY9KsDONSk2TwrWb
         xaC69aOH04LUpjCi3aByQZdXEtoP0k8kjBTXgPR345Q6gpu0tmIkOVKUQh8aBYENXTrt
         mM48Ug5T7gE7IvVKUTbEhfoWaGdrm5rbZjV9IERVTsMRAC8wZ0NjN0fwzmLqEv30DR+a
         7dmxRL7REp5ifc2ZZz6Aa8580572K3dI49InUqfygMkK10L6Yj23At9a7o8mLsQzk2og
         Gmnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754633052; x=1755237852;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wE/fhVaUFn7jesFbrfTRvtqsCfjCoY7T1fwfr2b8YIE=;
        b=lm9uTt/Q7zAQdjmkcrJ2wBrMVUhGCjs6BkNtik4SkSt1lXJLV6fv+EcsRE12m+PAQs
         Ufg2LcCcXa48et03RnbG8DWrOSZinNFGgkxacERMo0qSQgHZdnrhv6hwxk1+cX3O2rrY
         fL6RgP6th9u9J/segrn0kVtxMNFUniMixEovGVdlXw/Nm/BlTyMZ/F1guNnGVxZbJe8k
         Umrld15VHPHhI7Mq8n8SQwRMm1gIuXmZjGdep07ny0SIH9O/EuzbG3AgRkdrVgbP9vmM
         efSv1neDlEgbiRB2HeuIvDiv2e3eVcnVfuOqpaW46OxfZ9XyZV2hEqKggW1AbO+mhVmj
         bJAQ==
X-Forwarded-Encrypted: i=1; AJvYcCXu0eswWj1KnCoOy5R+GkdGMdGcB1uNdf3VcDHl2/oy3dwm+gsjfo2XAAGUoGwLmBBZJKiPtNApivQ=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyX7OiDI0zRTN0EY7SoRmR7LJWsj3Vie1gKQZ69hckIzXR7zKBq
	qRapWyiH+a+FdMsVC4HYR4tCQIEhOoGXItna3nnB9T+suZpqMLztp5m0vE9Q7Bxuww==
X-Gm-Gg: ASbGnctDxjz5o/AYYPzcypg5IAs5dgQd8xsnfYNkIJSZ2jm1A1glCiT6bJHNihI+GQ3
	eEj8bwpcFgvGhXPioWeZ24gJV9r0wWUn3tr3OMdHLcSh0lwx/5HmE6JE5uByGvbI8hqRfdfwSTi
	IwmSxKd3BQ0AA5UTJgwlz6H4ifuNYEuxl12r9+eDyDjY9Tap2F/qm2WCRo9JyV6wBZGuYhpXE6S
	Lewi8jrE5w3FE+OChUNuq7NxAtKWvUhCLISgHN2HDBLM0/fS5AxTWR8MdSmqoYUND2nd1eXQgLS
	sjseGY7CckZOGPAkh9nklYUgFUNam184eESoYlhmD70azt/UoMPpH40cIWxngHJA26tx/MZQTnc
	gUKyxdBHVC5sRWo+verjtsglLbf72u8gC7AWYssBr/YO09JmJ4ySC0Yq6P4GmngHlSYc/MWq/oO
	90CoDnwC4=
X-Google-Smtp-Source: AGHT+IEqVhUrfBNakI9VU2ypaR62MJ7IHTHKwaL8kcVWyURcgIbjnfUWjIjIm06agCPsDt9iyaZzTQ==
X-Received: by 2002:a17:907:3cd6:b0:af9:bfef:156b with SMTP id a640c23a62f3a-af9c65e83ccmr135894866b.59.1754633052451;
        Thu, 07 Aug 2025 23:04:12 -0700 (PDT)
Message-ID: <65a67891-34a6-4ef4-ba43-f9e793979067@suse.com>
Date: Fri, 8 Aug 2025 08:04:10 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Xen 4.21 Development Update [June-July]
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Oleksii Moisieiev <Oleksii_Moisieiev@epam.com>,
 Ayan Kumar Halder <ayan.kumar.halder@amd.com>,
 Mykyta Poturai <Mykyta_Poturai@epam.com>, Juergen Gross <jgross@suse.com>,
 Teddy Astie <teddy.astie@vates.tech>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Luca Fancellu <luca.fancellu@arm.com>, "Jason Andryuk,"
 <jason.andryuk@amd.com>, Sergii Dmytruk <sergii.dmytruk@3mdeb.com>,
 "Penny Zheng," <Penny.Zheng@amd.com>,
 =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki=2C?=
 <marmarek@invisiblethingslab.com>, Roger Pau Monne <roger.pau@citrix.com>,
 dmkhn@proton.me, Mykola Kvach <xakep.amatop@gmail.com>,
 "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 Grygorii Strashko <gragst.linux@gmail.com>,
 Alejandro Vallejo <agarciav@amd.com>,
 Community Manager <community.manager@xenproject.org>,
 Xen-devel <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 "committers@xenproject.org" <committers@xenproject.org>
References: <ae2c2e35-72df-40ed-bffe-391f3c11b826@gmail.com>
 <242a93cf-20f7-4fcd-8eef-6945af5d864c@suse.com>
 <03a1d0b8-facd-4c02-97c6-45fa694da0b6@gmail.com>
 <f07b7bf9-8e9a-49b6-824e-0c3b346bebd2@suse.com>
 <a664643e-bf54-4518-83f9-497d2b9351f9@gmail.com>
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
In-Reply-To: <a664643e-bf54-4518-83f9-497d2b9351f9@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 07.08.2025 18:20, Oleksii Kurochko wrote:
> 
> On 8/6/25 10:12 AM, Jan Beulich wrote:
>> On 06.08.2025 09:45, Oleksii Kurochko wrote:
>>> On 8/6/25 8:05 AM, Jan Beulich wrote:
>>>> Overall: There are very many items on this list, and it seems entirely clear to
>>>> me that not all of them will make it. I think it would be quite helpful to strip
>>>> down the set for 4.21 to some realistic subset. Maybe something to discuss on
>>>> the community call later today?
>>> Good point, lets discuss that tomorrow during the community call.
>> Oh, right, it's only Wednesday today.
> 
> I had the Xen Community Call marked at 6 PM in my calendar, so I missed it as
> it actually took place at 15:00... I'm not sure if a recording is available
> somewhere, but based on the notes:
>      Call for major work items for 4.21 or 4.22
>          Please make yourself known if you are intending to work on major items
>          PDX compression.
>          FRED, AVX10, APX, and AMX support (x86)
>          Host UEFI Secure Boot
>          FF-A 1.2 Support (Arm)
> 
> I completely agree with the first point — it would be great to receive feedback
> from the authors of major patch series, similar to how the team at EPAM does.
> 
> As for the other items, I assume this is a list of major work items that are
> likely to slip to 4.22, correct? From the looks of it, PDX compression and
> FRED-related work might still make it into 4.21.
> 
> I also wanted to ask this during the call, but since I missed it,
> I’ll ask here instead:
> What should be the criteria for continuing to track a patch series?
> It seems that the best approach would be to rely on feedback from the series'
> author. However, obtaining that feedback can be challenging. So perhaps the
> only practical solution is to keep tracking major items throughout the current
> release cycle and drop them at the start of the next cycle if no activity has
> taken place.
> 
> P.S.: Andrew, could you please provide a list for FRED connected patch series,
> I am tracking some of them, but wanted to be sure that I'm tracking all of them.

This is possibly one of the problems: The tracking is too fine-grained. I don't
think every little piece needs tracking throughout the entire dev cycle. Close
to relevant milestones, adding certain things (like bugfixes) that definitely
want to go in for the release may make sense. But prior to that I think it would
help if things were more coarse grained, and less focused on individual patches
or patch series. (Connecting the individual items with their series would of
course be a plus, but to allow having an overview the two aspects may want
separating.)

Jan

