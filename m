Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EA82E9D94B9
	for <lists+xen-devel@lfdr.de>; Tue, 26 Nov 2024 10:40:36 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.843461.1259080 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tFs3T-0008Kk-Pj; Tue, 26 Nov 2024 09:40:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 843461.1259080; Tue, 26 Nov 2024 09:40:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tFs3T-0008IL-Ma; Tue, 26 Nov 2024 09:40:23 +0000
Received: by outflank-mailman (input) for mailman id 843461;
 Tue, 26 Nov 2024 09:40:22 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=zjIj=SV=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tFs3S-0008IF-FD
 for xen-devel@lists.xenproject.org; Tue, 26 Nov 2024 09:40:22 +0000
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [2a00:1450:4864:20::331])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 707324ee-abda-11ef-99a3-01e77a169b0f;
 Tue, 26 Nov 2024 10:40:15 +0100 (CET)
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-434a10588f3so13424135e9.1
 for <xen-devel@lists.xenproject.org>; Tue, 26 Nov 2024 01:40:15 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3825fb537dfsm12740393f8f.63.2024.11.26.01.40.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 26 Nov 2024 01:40:14 -0800 (PST)
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
X-Inumbo-ID: 707324ee-abda-11ef-99a3-01e77a169b0f
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDA6MTQ1MDo0ODY0OjIwOjozMzEiLCJoZWxvIjoibWFpbC13bTEteDMzMS5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6IjcwNzMyNGVlLWFiZGEtMTFlZi05OWEzLTAxZTc3YTE2OWIwZiIsInRzIjoxNzMyNjE0MDE1LjE3NTA5Mywic2VuZGVyIjoiamJldWxpY2hAc3VzZS5jb20iLCJyZWNpcGllbnQiOiJ4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcifQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1732614014; x=1733218814; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=8w+R585ArY6dj+SymyS1SEpF2eLQMwTzkI580s0ANjE=;
        b=C2C0Jzp5FGVoJEe5W+QuOUpNgk+Lm5UC0AsFz8x0WU8XlNf8xkVFlSXRFDwKIwYlaA
         BsJAw1WFHhdysmShpa2DAjSgUdxvFp1hbeBslt5vmOI0wmTIbxz/6b/CzNs7b6HNhZCy
         +3mamBJodrfb1EFLzaMKdSgfL0sUDzn/VjDevOIyDgZtNGSyFnS0QYkQUYfZ/QwZ6MeF
         uvW6JpbkgYBnPDfQ42Tql5gPwPWg4AtC3BPOjwFSIpndb3TxbZEZyea7R0na5kIa23PK
         sfNKTM5BcOB2p7F9xTpGI4nSo6QXxTPd2qmziFrAoe2xey0rtncBx0WQmXtdqg19ZMi6
         xlpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732614014; x=1733218814;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8w+R585ArY6dj+SymyS1SEpF2eLQMwTzkI580s0ANjE=;
        b=URPuiL5CPFmRlYj4D/E/rOXVf3qzCIG7Juy9SUUVmWTHgTPj76qF+h6+c2PShUeXCV
         QzFdT0m5/8iKJdoWudPfsY4EpiaKdnJHw7oxB/W7g+Z/nsCW2z88yaOmbV2gNlxuhKqL
         yLO+Lm9wjENBeicVl0YlrjBpvw2eNNgzWXT4jS6RG/3lIdVJsDN8XoblTeeHTfG1c/BC
         R2fh0Qufrpk0pJx6lQ14kEZQSHmpy3OgpcQNnXXNAtfgPp6hM8SXQ09pFI9fpy6YmTSQ
         2RtNULzCgavj7UokvYdyTkQIId3DDKfl6Ifaa2qWnufAPTMlaXsRlZKg9lZslxvxW+Ri
         7IrQ==
X-Forwarded-Encrypted: i=1; AJvYcCV4vU4PWKuZZaD/j/E2uguWVor8NGQBvrNRgxDY5LqdMsnmqtI3al6nh7RWj7AhRwykXpOJUD9CN3s=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzIZ7XLgdEz/X0Y6tu1Uyoo3HuiV+MONKIcYvhjU9qGdSWrHZeB
	oaJ0Sxrhp0YDKuN8h9xRdGhUlRDnObhHDSKLPbFYES/xYnhOP7zyZoT/vJRGUw==
X-Gm-Gg: ASbGncuB5jq6G+kprnto7UO0cVNYQ//dMGPcOoCsZwl0icqNHbEhS1j3Jk5BO4NxF0V
	Lus9gIdclutSd3pndMWoUbLig8g/A8XogMpZbjxmvoH2mLsXwBzAeivLLCWbTa1xOGIxU1Db6e/
	gC6OLwScmD43YY9hFr562+hlLZPsw8p07tKBWXPB9HGZqUtshYE1dWEU6gHEEPZTM99ihdCiptV
	0wLC2+cn3eZNKiUs2PkXzSHLe/iDZdqbh99e/oII1BjJucyn786rxUV8SgDPIyVIAYZhqhSMq89
	c4Gdd/4+BjWuqrVNIonHq55xe6VfjCV1QoQ=
X-Google-Smtp-Source: AGHT+IGr8b17ihGnPIZTev2qFn61YEtRUtJYJZHyGeUv7S/uuj/Zn1TgVo20rdsI0HegcPBoOzqi/g==
X-Received: by 2002:a05:6000:2d06:b0:382:4b83:d4c0 with SMTP id ffacd0b85a97d-38260b486f8mr10807601f8f.3.1732614014398;
        Tue, 26 Nov 2024 01:40:14 -0800 (PST)
Message-ID: <737292fd-1c4a-4fd6-ae98-a701adb0b88e@suse.com>
Date: Tue, 26 Nov 2024 10:40:12 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 12/25] xen: Replace sysctl/readconsole with
 autogenerated version
To: Alejandro Vallejo <alejandro.vallejo@cloud.com>
Cc: Anthony PERARD <anthony.perard@vates.tech>,
 Samuel Thibault <samuel.thibault@ens-lyon.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 xen-devel@lists.xenproject.org
References: <20241115115200.2824-1-alejandro.vallejo@cloud.com>
 <20241115115200.2824-13-alejandro.vallejo@cloud.com>
 <0a5a66d9-4fd4-4084-b7f9-0923d5a4c6d5@suse.com>
 <D5VHI2OA8QTK.1H4ZDUSP5EZX5@cloud.com>
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
In-Reply-To: <D5VHI2OA8QTK.1H4ZDUSP5EZX5@cloud.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 25.11.2024 19:51, Alejandro Vallejo wrote:
> On Mon Nov 25, 2024 at 12:05 PM GMT, Jan Beulich wrote:
>> On 15.11.2024 12:51, Alejandro Vallejo wrote:
>>> Describe sysctl/readconsole as a TOML specification, remove old
>>> hand-coded version and replace it with autogenerated file.
>>>
>>> While at it, transform the console driver to use uint8_t rather than
>>> char in order to mandate the type to be unsigned and ensure the ABI is
>>> not defined with regards to C-specific types.
>>
>> Yet the derived C representation imo then should still be using char, not
>> uint8_t.
> 
> There's 2 issued addressed by this patch.
> 
>   1. The removal of char from the external headers (and the Xen driver).
>   2. The replacement of the existing struct by the autogenerated one.
> 
> (1) wants doing irrespective of (2). char has neither a fixed width nor a fixed
> sign. Which is irrelevant for ABI purposes in this case because what we really
> meant is "give me a pointer" in this hypercall, but it may be important in
> other cases.
> 
> IOW, char should've never made it to the definition of the public ABI, and I'm
> merely taking the chance to take it out. Happy to extract this patch and send
> it separately.

Well, work towards fully getting char out of the public headers may indeed be
worthwhile. Otoh with char being the basic addressing granularity, I think
the ABI is pretty much tied to sizeof(char) == 1, imo limiting the
worthwhile-ness quite a bit.

Signed-ness of plain char doesn't really matter as long as it's used only for
what really are characters (or strings thereof). And that looks the be pretty
much the case throughout the public headers.

>> In particular it would be a good sign if the Xen sources wouldn't
>> need to change, unlike happens here (altering types of a few internals of
>> the console machinery).
> 
> And that would be the case if Xen had uniform naming conventions and its ABI
> was fully unambiguous. The process of uniformizing the naming convention and
> disambiguating the ABI is bound to cause (non-functional) changes, mostly in
> the naming conventions side of things.
> 
> Naming conventions can be _MOSTLY_ sorted by creating compat #defines and
> typedefs that match the old types. I can do that, but note that even then some
> code would have to change in order to i.e: s/struct OLD_NAME/NEW_NAME_T/

Here we already disagree: I think we'd better avoid any typedef-s in the public
interface when they're not strictly needed (e.g. in order to declare associated
handles). Imo we simply shouldn't introduce more into the name space than
actually required.

> If this is deemed important for backporting changes, I can do it for invasive
> replacements, like the createdomain flags.
> 
> On the topic of changing types, The present case is an ABI inconsistency case.
> My intention is to keep the ABI fixed as a matter of principle (if anything,
> because the domU ABI cannot be changed). However, changing the way C represents
> said ABI is a requirement if the current definition is ambiguous. In those
> cases we ought to change C to ensure there's one and only one way of
> interpreting it.

I wonder what concrete cases of ambiguity you're thinking of here.

>>>  xen/include/public/autogen/sysctl.h           | 35 +++++++++++++++
>>
>> In the build tree, having an autogen subdir under public/ _may_ be okay
>> (personally I dislike even that). I didn't manage to spot adjustments to
>> how files are eventually installed, yet at that point there clearly
>> shouldn't be any autogen subdir(s) anymore. How the individual files come
>> into existence is, imo, nothing consumers of the interface ought to (need
>> to) care about.
> 
> Anthony already mentioned an error while building QEMU, which I'm guessing
> comes from the same problem. The stitching is definitely up for discussion. I
> got far enough to allow the compilation of `dist` to go through, but didn't
> think incredibly hard about the finer details (like the install targets).
> 
> In principle, renaming `autogen` to `abi` and adding its contents to the list of
> installed headers ought to sort that particular concern? 

Not really, no. That only gives the child a different name. Imo the original
tree structure shouldn't change. By the end of the conversion work, all-
generated stuff would simply replace all-hand-written stuff.

>>> --- /dev/null
>>> +++ b/tools/rust/xenbindgen/extra/sysctl/readconsole.toml
>>> @@ -0,0 +1,43 @@
>>> +[[structs]]
>>> +name = "xen_sysctl_readconsole"
>>> +description = "Read console content from Xen buffer ring."
>>> +
>>> +[[structs.fields]]
>>> +name = "clear"
>>> +description = "IN: Non-zero -> clear after reading."
>>> +typ = { tag = "u8" }
>>> +
>>> +[[structs.fields]]
>>> +name = "incremental"
>>> +description = "IN: Non-zero -> start index specified by `index` field."
>>> +typ = { tag = "u8" }
>>> +
>>> +[[structs.fields]]
>>> +name = "_pad"
>>> +description = "Unused."
>>> +typ = { tag = "u16" }
>>> +
>>> +[[structs.fields]]
>>> +name = "index"
>>> +description = """
>>> +IN:  Start index for consuming from ring buffer (if @incremental);
>>> +OUT: End index after consuming from ring buffer."""
>>> +typ = { tag = "u32" }
>>> +
>>> +[[structs.fields]]
>>> +name = "buffer"
>>> +description = """
>>> +IN: Virtual address to write console data.
>>> +
>>> +NOTE: The pointer itself is IN, but the contents of the buffer are OUT."""
>>> +typ = { tag = "ptr", args = { tag = "u8" } }
>>> +
>>> +[[structs.fields]]
>>> +name = "count"
>>> +description = "IN: Size of buffer; OUT: Bytes written to buffer."
>>> +typ = { tag = "u32" }
>>> +
>>> +[[structs.fields]]
>>> +name = "rsvd0_a"
>>> +description = "Tail padding reserved to zero."
>>> +typ = { tag = "u32" }
>>
>> Up to here I wasn't able to spot any documentation on what it to be written
>> in which way.
> 
> You're right that the specification is not itself specified. I neglected to do
> so to avoid having to rewrite it should we settle on a different markup
> language.
> 
> Much of your confusion seems to stem from simultanuously looking at a new
> markup language and a new schema for it. Let me try to unpick some of that...
> 
>> I already struggle with the double square brackets. The TOML
>> doc I found when searching the web doesn't have such. Taking just the example
>> above also doesn't allow me to conclude how e.g. nested structures would be
>> specified.
> 
> The schema is represented by the contents of `spec.rs`. All structs with a
> Deserialize attribute (i.e: #[derive(Foo, Bar, Deserialize)]) map to some
> "table" in TOML.
> 
> When I say "struct" now I mean a struct inside the generator that represents
> the input file (_NOT_ a struct representing a hypercall).
> 
> The rules are as follows. The whole file is deserialized in a single struct
> (InFileDef). When there's a single square bracket (which I don't think I've
> required yet), that means that what follows is a "table" with the name between
> the brackets. There's several ways to represent table
> 
>     Regular tables:           [foo]
>                               bar = "some_bar"
>                               baz = "some_baz"
> 
>                               [foo2]
>                               bar = "blergh"
> 
>     Inline tables:            foo = { bar = "some_bar", baz = "some_baz" }
>                               foo2 = { bar = "blergh" }
> 
> Both of those deserialize to the same thing (it's C for ease of explaining it
> here, but it's actually Rust in the generator).
> 
>                 struct infiledef {
>                     struct {
>                         char *bar; // points to "some_bar"
>                         char *baz; // points to "some_baz"
>                     } foo;
>                     struct {
>                         char *bar; // points to "blergh"
>                     } foo2;
>                 };
> 
> The double brackets are adding one more element to a "list"
> 
> That is. This TOML...
> 
>                              [[foos]]
>                              bar = "some_bar"
>                              baz = "some_baz"
> 
>                              [[foos]]
>                              bar = "some_bar"
>                              baz = "some_baz"
> 
> ... deserializes to...
> 
>                 struct foodef {
>                     char *bar;
>                     char *baz;
>                 }
> 
>                 struct infiledef {
>                     struct foodef *foos;
>                 };
> 
> The last bit of relevant information is that you can identify which table you
> want to add to with dots. So [[structs.fields]] is saying "Add this field to
> the list of fields of the current hypercall struct".
> 
> The "typ" field is a bit quirky (I have a solution to simplify it), but that
> uses inline tables.
> 
>> Really, when talk was of some form of IDL, I expected to see
>> something IDLish (im particular closer to typical programming languages we
>> use). Whereas TOML, aiui, is more an easy language for config files of all
>> sorts.
> 
> I might've been unclear in the talk. One of my goals is to _not_ define a new
> language. Or I'll just exchange one problem for two. Maybe I should've called
> it an Interface Definition Schema, rather than Language.
> 
> The key benefit here is that, while the generators can be tricky, the parser is
> all done and strictly specified. We can experiment with YAML (Anthony already
> asked about it). But it really is a matter of getting used to. TOML is
> fantastic for saving horizontal space. And multi-line comments are neatly
> organized.

It may indeed be a matter of getting used to, yet I'm afraid your explanations
above make the situation yet more confusing, at least for the moment. Just to
explain my expectations some: I don't really speak e.g. Python or Perl, but the
languages are self-explanatory above that I can at least roughly follow not
overly involved pieces of code written therein. An interface specification imo
certainly falls in the group of "not overly involved". Yet the (so far small)
pieces of TOML that there aren't as self-explanatory as I'd have expected them
to be.

>> What I have in mind wouldn't allow for descriptions, yet I'm not sure that's
>> relevant. The description ought to, first of all, live in the primary source
>> (i.e. the IDL itself) anyway. Commentary there might be possible to extract
>> into proper (machine generated/derived) documentation.
> 
> Not sure I follow, these TOML files _are_ the IDL itself.
> 
> The descriptions here are propagated to the generated code, so they are
> infinitely helpful when reaching the type via e.g: cscope, LSPs, etc.

Yet they are full-fledged attributes, when normally I'd expect such to be
comments (thus clearly separating "code" from "non-code").

As to propagating to generated code - hmm, yes, for use of cscope and alike
it may indeed be helpful to propagate, if such tools can't associate back
the generated files to their origins. My general take though is that
generated code is something you look at as a human only when actually
dealing with their generation. For all other purposes one would prefer the
"original" source.

>>> --- a/xen/drivers/char/console.c
>>> +++ b/xen/drivers/char/console.c
>>> @@ -42,6 +42,8 @@
>>>  #include <asm/vpl011.h>
>>>  #endif
>>>  
>>> +#include <public/xen.h>
>>
>> Why would this be needed all of the sudden?
>>
> 
> Because of the new XEN_GUEST_HANDLE_64(uint8) type. The macro is quite ugly and
> requires being declared ahead.

How's that different from the earlier XEN_GUEST_HANDLE_PARAM(char)?

>>> --- /dev/null
>>> +++ b/xen/include/public/autogen/sysctl.h
>>> @@ -0,0 +1,35 @@
>>> +/*
>>> + * sysctl
>>> + *
>>> + * AUTOGENERATED. DO NOT MODIFY
>>> + */
>>> +#ifndef __XEN_AUTOGEN_SYSCTL_H
>>> +#define __XEN_AUTOGEN_SYSCTL_H
>>> +
>>> +/* Read console content from Xen buffer ring. */
>>> +struct xen_sysctl_readconsole {
>>> +    /* IN: Non-zero -> clear after reading. */
>>> +    uint8_t clear;
>>> +    /* IN: Non-zero -> start index specified by `index` field. */
>>> +    uint8_t incremental;
>>> +    /* Unused. */
>>> +    uint16_t _pad;
>>> +    /*
>>> +     * IN:  Start index for consuming from ring buffer (if @incremental);
>>> +     * OUT: End index after consuming from ring buffer.
>>> +     */
>>> +    uint32_t index;
>>> +    /*
>>> +     * IN: Virtual address to write console data.
>>> +     *
>>> +     * NOTE: The pointer itself is IN, but the contents of the buffer are OUT.
>>> +     */
>>> +    XEN_GUEST_HANDLE_64(uint8) buffer;
>>> +    /* IN: Size of buffer; OUT: Bytes written to buffer. */
>>> +    uint32_t count;
>>> +    /* Tail padding reserved to zero. */
>>> +    uint32_t rsvd0_a;
>>> +};
>>> +
>>> +#endif /* __XEN_AUTOGEN_SYSCTL_H */
>>> +
>>
>> If this file is auto-generated, why would it need committing? And yes, there
>> is the connected question: Will everyone then need to have a Rust compiler
>> available?
> 
> Committing it is required precisely so that no one needs to have a Rust
> compiler available.

How would that work? If I make a change to what currently is a public header,
I'd still need to have one available, wouldn't I?

> The last patch in the series checks the generated code
> matches the specs byte by byte. It has the nice benefit that you can git-grep
> for it and tags work even without compiling first. You also get all
> architectures upfront and it's a lot easier to review changes to the generator
> because CI will scream to you if the outputs diverge.
> 
>>
>> Nit: For anything that is committed, it would be nice if those files were as
>> tidy as possible style-wise. Most of the above looks entirely okay, just
>> that there is an unnecessary trailing blank line.
> 
> I did go out of my way to prettify the output.
> 
> The trailing newline was intentional to make it C++03-compatible. I can get rid
> of it, as it doesn't matter a whole lot.

I haven't followed the development of C++ very closely; my experience with it
is mostly from far more than 20 years ago. What's that C++03 compatibility
requirement?

Jan

