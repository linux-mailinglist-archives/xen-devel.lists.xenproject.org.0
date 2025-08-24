Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8261CB3333C
	for <lists+xen-devel@lfdr.de>; Mon, 25 Aug 2025 00:46:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1092361.1448275 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uqJTH-0007cW-64; Sun, 24 Aug 2025 22:45:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1092361.1448275; Sun, 24 Aug 2025 22:45:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uqJTH-0007ZO-2Y; Sun, 24 Aug 2025 22:45:55 +0000
Received: by outflank-mailman (input) for mailman id 1092361;
 Sun, 24 Aug 2025 22:45:53 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/oRm=3E=gmail.com=demiobenour@srs-se1.protection.inumbo.net>)
 id 1uqJTF-0007ZD-63
 for xen-devel@lists.xenproject.org; Sun, 24 Aug 2025 22:45:53 +0000
Received: from mail-yw1-x1134.google.com (mail-yw1-x1134.google.com
 [2607:f8b0:4864:20::1134])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 15b21bb9-813c-11f0-a32c-13f23c93f187;
 Mon, 25 Aug 2025 00:45:52 +0200 (CEST)
Received: by mail-yw1-x1134.google.com with SMTP id
 00721157ae682-71d6083cc69so30131637b3.2; 
 Sun, 24 Aug 2025 15:45:51 -0700 (PDT)
Received: from [10.138.34.110]
 (h96-60-249-169.cncrtn.broadband.dynamic.tds.net. [96.60.249.169])
 by smtp.gmail.com with ESMTPSA id
 00721157ae682-71ffd8ef450sm9964177b3.71.2025.08.24.15.45.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 24 Aug 2025 15:45:49 -0700 (PDT)
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
X-Inumbo-ID: 15b21bb9-813c-11f0-a32c-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756075550; x=1756680350; darn=lists.xenproject.org;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=7GrOiQ5LBRM2OG2jXjSf3cnG6Dj9j4mlYfmhqpWrcR4=;
        b=huxUcIV4DZWJx7OsW4UgzPey+qlKzq6l2Po2ABIvtHeLxMVvofDxGv0GSizhLquiNL
         LI3E09W8KoMS3hWGK60zBGy57kQNNDXakJSJjdgqq1sqHzXt8OFPzQZcvrmidJLefFxa
         ilodKhbxWshUTPChgcoG1NlLVRaPac/e3qJW3cESCsGfa7yCRhNF0zuevWXIeW97GWi6
         1P5tT7p9L6BqKMPfbpTu5XpY1ECmRt/y/IJxBJ72o5Y0Iz9r4Om5GWjoyJ8LQRERQmWA
         ZlDzZLq0Bv9dEGp065d6tAxAJLfvwmyuD8WjNFybWkWO1+8e68vOOc+fB0h96WSAOy4W
         Qdxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756075550; x=1756680350;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=7GrOiQ5LBRM2OG2jXjSf3cnG6Dj9j4mlYfmhqpWrcR4=;
        b=oJHUs/ETjW66ZfPZBDn2XFmAUvbPPyHDPQqRCS2n0Z/mD06v5znkw3bZUtnMgNaljo
         umAEAWq/7nBCdfLtOXAadZq5lFHet1rWbTr4KVd/6WtmrW4gwagB/CJp+AYxmbf6TTVg
         YYHszswnECvUo2PfZQGSyVtiISfLtPZpV2WNSaCi9Ta8EGuxGECH1KpYXdB1xmbwwMLX
         UeGtZWoAUiws8UB9C8+DoYFR39YlpB0MtTArLAW4VXorRcR43ZYXwJrjeNcdltPQmUid
         1KwO7jExI5is2yPVJwfX5qQmB4zVKY56Z/Vr6+CPMNcKWPtAhhBKuzOpUeHeTnKs2I+P
         oS0g==
X-Forwarded-Encrypted: i=1; AJvYcCVG53MtYhmJcc4ydW2F240XGPxrDLFpf0nOL4CLssUNTWz6DmRqO1MjJAYv59tHEVoptXprFSLnpyI=@lists.xenproject.org, AJvYcCVtWofK1DtiSqDOKEdyFGCNh9AThpuEhqO0TouXthOBhH8wfw3JlYXdvvjyTQiOZRwUzQejnZTz15Ai@lists.xenproject.org
X-Gm-Message-State: AOJu0YzIJra3yJdOdTqww4XLM+D7CXKZoZKrCPHD3MW242vCaDBzJ2ZJ
	Hy9IlUcz1o9qBaR55OwVY9+hM4zBlf2HyCRccau0wmUu9Grm79b5DiYo
X-Gm-Gg: ASbGnctYqpzYPfWBzzTlIlE2NO9BPs2IOBrSyZNwN7DemY93t72g5BwBpsvzlg7Emmi
	7tem15xBaHbn/BAusirbJdhvAyL54vgBrkg/8K5lVji1jWB2zWRBAh6Xmj1x5z7taSe3t23lS5a
	DAQcivB4UEFpAX/8Cj6yH01ceKBb9bne0tNzOFzJGA2zJjni0p6L8y+/vBvO/pJN88ekIMt3L/8
	1G2OFzD/wHR4xE5hEY23yIvUccPS3z8JvZfoIi14tEafGeQJ/kwv6AZZHP/pPv7rphMLl12iQp0
	wzViTX7V+UBvES/FQKMBeZOksZvDNv45Dagm12ve5zHAW5+yiRu2mMwGuTWW0eOAdL5+wDrVaG5
	MNrqfKa6oCptPCJoqkjHpX7BBOw/ZqRAXnT7kyCzJ6gb/t6hREThyDR+1UpKETOZ8W501P9XtIF
	iRwPRNQKIOIoA/CXgDLaqy1NBqYnmtSm5JlbI=
X-Google-Smtp-Source: AGHT+IEmm9hUbRUU2Ka+sHCYKyK7tq5N2YOR27oYD2DFXNHrIm5emOr33ovCbpW7VcJuGbYLrCh/Dg==
X-Received: by 2002:a05:690c:4c90:b0:720:79a:b09b with SMTP id 00721157ae682-720079ab767mr32347697b3.12.1756075550274;
        Sun, 24 Aug 2025 15:45:50 -0700 (PDT)
Message-ID: <15024e7a-f5e2-43df-8de8-e4da200e7ee6@gmail.com>
Date: Sun, 24 Aug 2025 18:45:45 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Consider changing CONFIG_ACPI default on ARM?
To: Elliott Mitchell <ehem+xen@m5p.com>, Julien Grall <julien@xen.org>
Cc: Jan Beulich <jbeulich@suse.com>, xen-users@lists.xenproject.org,
 xen-devel@lists.xenproject.org, Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Paul Leiber <paul@onlineschubla.de>
References: <CAO_48GG1Tg0d3ATnNAYNr0cg7Ty_zsnzT29=dpkk99DxyTWcmg@mail.gmail.com>
 <fceb5df8-d628-479d-acb3-d1d26409fbac@onlineschubla.de>
 <aJLae1Nl0pyOZgyh@mattapan.m5p.com>
 <1b96f2f3-55a2-4b33-84b1-a7c18d38d10c@suse.com>
 <6e9b5265-7a3b-4fd5-b14e-0e60a8b49833@gmail.com>
 <a3092ae1-d836-4403-8fb5-30593fcd2fb8@suse.com>
 <aKjOaT-P74Yh4-bi@mattapan.m5p.com>
 <2f11b8ea-a386-4c2a-afe6-c7e57d1d7f75@xen.org>
 <aKpzjMnNzxJCoIXb@mattapan.m5p.com>
Content-Language: en-US
From: Demi Marie Obenour <demiobenour@gmail.com>
Autocrypt: addr=demiobenour@gmail.com; keydata=
 xsFNBFp+A0oBEADffj6anl9/BHhUSxGTICeVl2tob7hPDdhHNgPR4C8xlYt5q49yB+l2nipd
 aq+4Gk6FZfqC825TKl7eRpUjMriwle4r3R0ydSIGcy4M6eb0IcxmuPYfbWpr/si88QKgyGSV
 Z7GeNW1UnzTdhYHuFlk8dBSmB1fzhEYEk0RcJqg4AKoq6/3/UorR+FaSuVwT7rqzGrTlscnT
 DlPWgRzrQ3jssesI7sZLm82E3pJSgaUoCdCOlL7MMPCJwI8JpPlBedRpe9tfVyfu3euTPLPx
 wcV3L/cfWPGSL4PofBtB8NUU6QwYiQ9Hzx4xOyn67zW73/G0Q2vPPRst8LBDqlxLjbtx/WLR
 6h3nBc3eyuZ+q62HS1pJ5EvUT1vjyJ1ySrqtUXWQ4XlZyoEFUfpJxJoN0A9HCxmHGVckzTRl
 5FMWo8TCniHynNXsBtDQbabt7aNEOaAJdE7to0AH3T/Bvwzcp0ZJtBk0EM6YeMLtotUut7h2
 Bkg1b//r6bTBswMBXVJ5H44Qf0+eKeUg7whSC9qpYOzzrm7+0r9F5u3qF8ZTx55TJc2g656C
 9a1P1MYVysLvkLvS4H+crmxA/i08Tc1h+x9RRvqba4lSzZ6/Tmt60DPM5Sc4R0nSm9BBff0N
 m0bSNRS8InXdO1Aq3362QKX2NOwcL5YaStwODNyZUqF7izjK4QARAQABzTxEZW1pIE1hcmll
 IE9iZW5vdXIgKGxvdmVyIG9mIGNvZGluZykgPGRlbWlvYmVub3VyQGdtYWlsLmNvbT7CwXgE
 EwECACIFAlp+A0oCGwMGCwkIBwMCBhUIAgkKCwQWAgMBAh4BAheAAAoJELKItV//nCLBhr8Q
 AK/xrb4wyi71xII2hkFBpT59ObLN+32FQT7R3lbZRjVFjc6yMUjOb1H/hJVxx+yo5gsSj5LS
 9AwggioUSrcUKldfA/PKKai2mzTlUDxTcF3vKx6iMXKA6AqwAw4B57ZEJoMM6egm57TV19kz
 PMc879NV2nc6+elaKl+/kbVeD3qvBuEwsTe2Do3HAAdrfUG/j9erwIk6gha/Hp9yZlCnPTX+
 VK+xifQqt8RtMqS5R/S8z0msJMI/ajNU03kFjOpqrYziv6OZLJ5cuKb3bZU5aoaRQRDzkFIR
 6aqtFLTohTo20QywXwRa39uFaOT/0YMpNyel0kdOszFOykTEGI2u+kja35g9TkH90kkBTG+a
 EWttIht0Hy6YFmwjcAxisSakBuHnHuMSOiyRQLu43ej2+mDWgItLZ48Mu0C3IG1seeQDjEYP
 tqvyZ6bGkf2Vj+L6wLoLLIhRZxQOedqArIk/Sb2SzQYuxN44IDRt+3ZcDqsPppoKcxSyd1Ny
 2tpvjYJXlfKmOYLhTWs8nwlAlSHX/c/jz/ywwf7eSvGknToo1Y0VpRtoxMaKW1nvH0OeCSVJ
 itfRP7YbiRVc2aNqWPCSgtqHAuVraBRbAFLKh9d2rKFB3BmynTUpc1BQLJP8+D5oNyb8Ts4x
 Xd3iV/uD8JLGJfYZIR7oGWFLP4uZ3tkneDfYzsFNBFp+A0oBEAC9ynZI9LU+uJkMeEJeJyQ/
 8VFkCJQPQZEsIGzOTlPnwvVna0AS86n2Z+rK7R/usYs5iJCZ55/JISWd8xD57ue0eB47bcJv
 VqGlObI2DEG8TwaW0O0duRhDgzMEL4t1KdRAepIESBEA/iPpI4gfUbVEIEQuqdqQyO4GAe+M
 kD0Hy5JH/0qgFmbaSegNTdQg5iqYjRZ3ttiswalql1/iSyv1WYeC1OAs+2BLOAT2NEggSiVO
 txEfgewsQtCWi8H1SoirakIfo45Hz0tk/Ad9ZWh2PvOGt97Ka85o4TLJxgJJqGEnqcFUZnJJ
 riwoaRIS8N2C8/nEM53jb1sH0gYddMU3QxY7dYNLIUrRKQeNkF30dK7V6JRH7pleRlf+wQcN
 fRAIUrNlatj9TxwivQrKnC9aIFFHEy/0mAgtrQShcMRmMgVlRoOA5B8RTulRLCmkafvwuhs6
 dCxN0GNAORIVVFxjx9Vn7OqYPgwiofZ6SbEl0hgPyWBQvE85klFLZLoj7p+joDY1XNQztmfA
 rnJ9x+YV4igjWImINAZSlmEcYtd+xy3Li/8oeYDAqrsnrOjb+WvGhCykJk4urBog2LNtcyCj
 kTs7F+WeXGUo0NDhbd3Z6AyFfqeF7uJ3D5hlpX2nI9no/ugPrrTVoVZAgrrnNz0iZG2DVx46
 x913pVKHl5mlYQARAQABwsFfBBgBAgAJBQJafgNKAhsMAAoJELKItV//nCLBwNIP/AiIHE8b
 oIqReFQyaMzxq6lE4YZCZNj65B/nkDOvodSiwfwjjVVE2V3iEzxMHbgyTCGA67+Bo/d5aQGj
 gn0TPtsGzelyQHipaUzEyrsceUGWYoKXYyVWKEfyh0cDfnd9diAm3VeNqchtcMpoehETH8fr
 RHnJdBcjf112PzQSdKC6kqU0Q196c4Vp5HDOQfNiDnTf7gZSj0BraHOByy9LEDCLhQiCmr+2
 E0rW4tBtDAn2HkT9uf32ZGqJCn1O+2uVfFhGu6vPE5qkqrbSE8TG+03H8ecU2q50zgHWPdHM
 OBvy3EhzfAh2VmOSTcRK+tSUe/u3wdLRDPwv/DTzGI36Kgky9MsDC5gpIwNbOJP2G/q1wT1o
 Gkw4IXfWv2ufWiXqJ+k7HEi2N1sree7Dy9KBCqb+ca1vFhYPDJfhP75I/VnzHVssZ/rYZ9+5
 1yDoUABoNdJNSGUYl+Yh9Pw9pE3Kt4EFzUlFZWbE4xKL/NPno+z4J9aWemLLszcYz/u3XnbO
 vUSQHSrmfOzX3cV4yfmjM5lewgSstoxGyTx2M8enslgdXhPthZlDnTnOT+C+OTsh8+m5tos8
 HQjaPM01MKBiAqdPgksm1wu2DrrwUi6ChRVTUBcj6+/9IJ81H2P2gJk3Ls3AVIxIffLoY34E
 +MYSfkEjBz0E8CLOcAw7JIwAaeBT
In-Reply-To: <aKpzjMnNzxJCoIXb@mattapan.m5p.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------bhY5DSzf495VIr8O8A6zutvS"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------bhY5DSzf495VIr8O8A6zutvS
Content-Type: multipart/mixed; boundary="------------t00hXkO0rFL9WCPjRbNmoM76";
 protected-headers="v1"
From: Demi Marie Obenour <demiobenour@gmail.com>
To: Elliott Mitchell <ehem+xen@m5p.com>, Julien Grall <julien@xen.org>
Cc: Jan Beulich <jbeulich@suse.com>, xen-users@lists.xenproject.org,
 xen-devel@lists.xenproject.org, Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Paul Leiber <paul@onlineschubla.de>
Message-ID: <15024e7a-f5e2-43df-8de8-e4da200e7ee6@gmail.com>
Subject: Re: Consider changing CONFIG_ACPI default on ARM?
References: <CAO_48GG1Tg0d3ATnNAYNr0cg7Ty_zsnzT29=dpkk99DxyTWcmg@mail.gmail.com>
 <fceb5df8-d628-479d-acb3-d1d26409fbac@onlineschubla.de>
 <aJLae1Nl0pyOZgyh@mattapan.m5p.com>
 <1b96f2f3-55a2-4b33-84b1-a7c18d38d10c@suse.com>
 <6e9b5265-7a3b-4fd5-b14e-0e60a8b49833@gmail.com>
 <a3092ae1-d836-4403-8fb5-30593fcd2fb8@suse.com>
 <aKjOaT-P74Yh4-bi@mattapan.m5p.com>
 <2f11b8ea-a386-4c2a-afe6-c7e57d1d7f75@xen.org>
 <aKpzjMnNzxJCoIXb@mattapan.m5p.com>
In-Reply-To: <aKpzjMnNzxJCoIXb@mattapan.m5p.com>

--------------t00hXkO0rFL9WCPjRbNmoM76
Content-Type: multipart/mixed; boundary="------------7dN8ZYe6aEr0MI5TuvZc0AMK"

--------------7dN8ZYe6aEr0MI5TuvZc0AMK
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On 8/23/25 22:06, Elliott Mitchell wrote:
> On Sat, Aug 23, 2025 at 08:59:13AM +0100, Julien Grall wrote:
>>
>> On 22/08/2025 21:09, Elliott Mitchell wrote:
>>> Since you're not pointing to anything definite, could it be everythin=
g
>>> has been resolved?
>>
>> Unfortunately, the situation has not changed since your last thread ab=
out
>> enabling CONFIG_ACPI=3Dy a couple of years ago. The main feature we ar=
e
>> lacking is the parsing the IORT (used to discover SMMUs and MSI
>> controllers). Without this...
>=20
> No one to sponsor this work?  Disappointing with how far ACPI support h=
ad
> gotten.  Surprising the funding ended here.
>=20
>>>  We've got at least two people for whom ACPI on ARM
>>> works pretty well.
>>
>> ... Xen will only properly boot on "simple" case like the Raspberry PI=
=2E
>> Also, IIRC Xen would use ACPI rather than Device-Tree by default.
>=20
> What is the "improper" booting on non-simple cases like?  panic()?
> Domain 0 boots, but the system isn't properly protected by the SMMU?
> Ideally it would be runtime configurable with the former being the
> default, but the panic message indicating how to override to produce th=
e
> latter.  Perhaps even accompanied by an invitation for sponsorship.
>=20
> Yet handling those simple cases would help many people.  For a long tim=
e
> IO-MMUs were rare, yet the world did not end.
>=20
>>> There may be many more using it.  Perhaps this
>>> should even be done on the 4.20 branch given how long this has been
>>> working?
>>
>> I am guessing you mean 4.21 which will be released in a couple of mont=
hs
>> time, correct?
>=20
> As it is very simple to flip the default, I was thinking it might be
> worthwhile to change it on earlier versions too.  After all it has
> actually been known to work for kind of a long time.
>=20
>> We have been discussing among the committers on whether we are ok to e=
nable
>> ACPI despite the fact it is still not feature complete (see above). Th=
e
>> discussion is not fully finalized but if we were to enable CONFIG_ACPI=
=3Dy by
>> default then I think we would need the following:
>>
>>  * Select device-tree by default rather than ACPI
>>  * Go through SUPPORT.MD and check what features we marked as SUPPORTE=
D.md
>> but doesn't work on ACPI.
>>
>> Maybe you can help with that?
>=20
> I'm not sure this is a good role for me.  I suppose I could do a first
> pass marking everything as non-ACPI.  Problem is most recently I've bee=
n
> focussing on another aspect and I would mostly be guessing about things=
=2E
>=20
>> Out of interest, sorry if this was already mentioned before, is there =
any
>> reason ACPI is used on the Raspberry PI over Device-Tree? Is there any=
 issue
>> with the latter on Xen?
>=20
> Issue is various Linux distributions have differing levels of support f=
or
> various targets.  Nearly everyone has some degree of support for
> Raspberry PI (even Tianocore!), but the quality does vary from
> distribution to distribution.
>=20
> My favored distribution is rather limited in what it does for !x86.
> Everything gets built for !x86, but things such as booting hasn't been
> heavily looked at.  There is agreement using U-Boot/UEFI =3D> GRUB woul=
d
> likely be a Good Thing, but there is a shortage of people with the righ=
t
> expertise to get that working.  As a result booting Xen is troublesome.=

>=20
> Whereas copying the Tianocore firmware into place and getting it bootin=
g
> is *extremely* simple.  Further this has very few restrictions (GPT and=

> a ~200MB FAT filesystem).  Better yet once in place this is extremely
> robust.
>=20
> The only argument in favor of device-trees I've seen is that they're ea=
sy
> to deal with.  Certainly they need little runtime processing.  Yet they=

> come with a major weakness that they're really part of the kernel.  Whe=
n
> the Linux kernel is replaced (even patch-level differences) you pretty
> well always need to replace the device-trees.  Once you've done that it=

> is quite difficult to go back to the earlier kernel.
>=20
> New device-trees often cause older kernels to panic or malfunction.  If=

> storage is on USB you can unplug and adjust on a nearby desktop, but th=
is
> means you need to keep another system handy.  Whereas due to being well=

> isolated from the OS, the same set of ACPI tables works for many OSes a=
nd
> nearly all versions of Linux.
>=20
> The instances of ACPI tables which worked with Windows, but failed for
> other operating systems are quite famous.  The instances where a given
> set of device-trees work with Linux, but then fail with other OSes
> (or even merely different version of Linux) are not notable.  In fact
> instances where device-trees *don't* change drastically between kernel
> minor versions are newsworthy.

I think one proper answer is to bundle the device trees with the kernel,
and to make sure Xen uses the same code to handle it as Linux does.
Both are GPLv2 so it is fine to move code back and forth between them.
--=20
Sincerely,
Demi Marie Obenour (she/her/hers)
--------------7dN8ZYe6aEr0MI5TuvZc0AMK
Content-Type: application/pgp-keys; name="OpenPGP_0xB288B55FFF9C22C1.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB288B55FFF9C22C1.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

xsFNBFp+A0oBEADffj6anl9/BHhUSxGTICeVl2tob7hPDdhHNgPR4C8xlYt5q49y
B+l2nipdaq+4Gk6FZfqC825TKl7eRpUjMriwle4r3R0ydSIGcy4M6eb0IcxmuPYf
bWpr/si88QKgyGSVZ7GeNW1UnzTdhYHuFlk8dBSmB1fzhEYEk0RcJqg4AKoq6/3/
UorR+FaSuVwT7rqzGrTlscnTDlPWgRzrQ3jssesI7sZLm82E3pJSgaUoCdCOlL7M
MPCJwI8JpPlBedRpe9tfVyfu3euTPLPxwcV3L/cfWPGSL4PofBtB8NUU6QwYiQ9H
zx4xOyn67zW73/G0Q2vPPRst8LBDqlxLjbtx/WLR6h3nBc3eyuZ+q62HS1pJ5EvU
T1vjyJ1ySrqtUXWQ4XlZyoEFUfpJxJoN0A9HCxmHGVckzTRl5FMWo8TCniHynNXs
BtDQbabt7aNEOaAJdE7to0AH3T/Bvwzcp0ZJtBk0EM6YeMLtotUut7h2Bkg1b//r
6bTBswMBXVJ5H44Qf0+eKeUg7whSC9qpYOzzrm7+0r9F5u3qF8ZTx55TJc2g656C
9a1P1MYVysLvkLvS4H+crmxA/i08Tc1h+x9RRvqba4lSzZ6/Tmt60DPM5Sc4R0nS
m9BBff0Nm0bSNRS8InXdO1Aq3362QKX2NOwcL5YaStwODNyZUqF7izjK4QARAQAB
zTxEZW1pIE9iZW5vdXIgKElUTCBFbWFpbCBLZXkpIDxhdGhlbmFAaW52aXNpYmxl
dGhpbmdzbGFiLmNvbT7CwY4EEwEIADgWIQR2h02fEza6IlkHHHGyiLVf/5wiwQUC
X6YJvQIbAwULCQgHAgYVCgkICwIEFgIDAQIeAQIXgAAKCRCyiLVf/5wiwWRhD/0Y
R+YYC5Kduv/2LBgQJIygMsFiRHbR4+tWXuTFqgrxxFSlMktZ6gQrQCWe38WnOXkB
oY6n/5lSJdfnuGd2UagZ/9dkaGMUkqt+5WshLFly4BnP7pSsWReKgMP7etRTwn3S
zk1OwFx2lzY1EnnconPLfPBc6rWG2moA6l0WX+3WNR1B1ndqpl2hPSjT2jUCBWDV
rGOUSX7r5f1WgtBeNYnEXPBCUUM51pFGESmfHIXQrqFDA7nBNiIVFDJTmQzuEqIy
Jl67pKNgooij5mKzRhFKHfjLRAH4mmWZlB9UjDStAfFBAoDFHwd1HL5VQCNQdqEc
/9lZDApqWuCPadZN+pGouqLysesIYsNxUhJ7dtWOWHl0vs7/3qkWmWun/2uOJMQh
ra2u8nA9g91FbOobWqjrDd6x3ZJoGQf4zLqjmn/P514gb697788e573WN/MpQ5XI
Fl7aM2d6/GJiq6LC9T2gSUW4rbPBiqOCeiUx7Kd/sVm41p9TOA7fEG4bYddCfDsN
xaQJH6VRK3NOuBUGeL+iQEVF5Xs6Yp+U+jwvv2M5Lel3EqAYo5xXTx4ls0xaxDCu
fudcAh8CMMqx3fguSb7Mi31WlnZpk0fDuWQVNKyDP7lYpwc4nCCGNKCj622ZSocH
AcQmX28L8pJdLYacv9pU3jPy4fHcQYvmTavTqowGnM08RGVtaSBNYXJpZSBPYmVu
b3VyIChsb3ZlciBvZiBjb2RpbmcpIDxkZW1pb2Jlbm91ckBnbWFpbC5jb20+wsF4
BBMBAgAiBQJafgNKAhsDBgsJCAcDAgYVCAIJCgsEFgIDAQIeAQIXgAAKCRCyiLVf
/5wiwYa/EACv8a2+MMou9cSCNoZBQaU+fTmyzft9hUE+0d5W2UY1RY3OsjFIzm9R
/4SVccfsqOYLEo+S0vQMIIIqFEq3FCpXXwPzyimotps05VA8U3Bd7yseojFygOgK
sAMOAee2RCaDDOnoJue01dfZMzzHPO/TVdp3OvnpWipfv5G1Xg96rwbhMLE3tg6N
xwAHa31Bv4/Xq8CJOoIWvx6fcmZQpz01/lSvsYn0KrfEbTKkuUf0vM9JrCTCP2oz
VNN5BYzqaq2M4r+jmSyeXLim922VOWqGkUEQ85BSEemqrRS06IU6NtEMsF8EWt/b
hWjk/9GDKTcnpdJHTrMxTspExBiNrvpI2t+YPU5B/dJJAUxvmhFrbSIbdB8umBZs
I3AMYrEmpAbh5x7jEjoskUC7uN3o9vpg1oCLS2ePDLtAtyBtbHnkA4xGD7ar8mem
xpH9lY/i+sC6CyyIUWcUDnnagKyJP0m9ks0GLsTeOCA0bft2XA6rD6aaCnMUsndT
ctrab42CV5XypjmC4U1rPJ8JQJUh1/3P48/8sMH+3krxpJ06KNWNFaUbaMTGiltZ
7x9DngklSYrX0T+2G4kVXNmjaljwkoLahwLla2gUWwBSyofXdqyhQdwZsp01KXNQ
UCyT/Pg+aDcm/E7OMV3d4lf7g/CSxiX2GSEe6BlhSz+Lmd7ZJ3g32M1ARGVtaSBN
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
EtJuZYM5blWncBOJCoWMnBEcTEo/viU3GgcVRw=3D=3D
=3Dx94R
-----END PGP PUBLIC KEY BLOCK-----

--------------7dN8ZYe6aEr0MI5TuvZc0AMK--

--------------t00hXkO0rFL9WCPjRbNmoM76--

--------------bhY5DSzf495VIr8O8A6zutvS
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEopQtqVJW1aeuo9/sszaHOrMp8lMFAmirlhoACgkQszaHOrMp
8lMabxAAidNE1MkZhI7a8HeOEDj6voJr+37OXxJxGRHlPiniSbH9/3hz2FBkqLuz
LOobmL9gSNc4RQ6nDnuO6RW+zsn1CkOmMfs5fa6aTmBZVcbSq4vDmlyCIySxN4X7
q/tY/8kz0ZN52+gKbIy5CqvB6a9NaSxvcZBBODSOpUog0ZOZxgtWcfoWJPsoQE03
eKIF8jDlzxUXPpBut7DqVDmy6FDjHRRa7P2fvXmJegKMTj++JhrqMc+YuTF/aL1z
ZOlUUySMgQfuRdJhTdcIgA3CETRkPZO+VpypMzAL6y81rWe6c8nV+NlLlGWzEvt/
k3YlUPDC+iRoy2QEcQrs2HB9j3edZQ6Cbygq37gCSXFW19jh8KHXwYH1zYeeEPEo
ij+twZUbLTIO8O3SncredUZkAKQvnQd4e2DBfFwJetdcKgUTdAMJWrgE3CNqK/wn
aT2foLPnSzQ5RYvB3r7ldB1dOeEMX77Drb2WelIrEeH4LHNDjFbwdXvV16rmv4aH
WuqUg3bueF+0G1sPf6YnI3qYzQQXSw+a6M7S2c+SQUBp9iETode8+LB9lw+o8a0m
LGk9hqzmLjsoknMaJrs3d8A9/S14xmY2Qyja4HxEYuWZCQhb4kEFxpwDtWf+Qcsw
jRIueASHtxe2LDks5II7pTwqOzyy4jHJaAtvP917rRtDnNUnBw8=
=katF
-----END PGP SIGNATURE-----

--------------bhY5DSzf495VIr8O8A6zutvS--

