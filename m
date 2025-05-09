Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AD70AB0966
	for <lists+xen-devel@lfdr.de>; Fri,  9 May 2025 06:52:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.979759.1366264 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uDFiM-0003Fh-BS; Fri, 09 May 2025 04:52:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 979759.1366264; Fri, 09 May 2025 04:52:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uDFiM-0003E0-84; Fri, 09 May 2025 04:52:02 +0000
Received: by outflank-mailman (input) for mailman id 979759;
 Fri, 09 May 2025 04:52:00 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=AoqA=XZ=gmail.com=demiobenour@srs-se1.protection.inumbo.net>)
 id 1uDFiK-0003Dp-H8
 for xen-devel@lists.xenproject.org; Fri, 09 May 2025 04:52:00 +0000
Received: from mail-yw1-x1132.google.com (mail-yw1-x1132.google.com
 [2607:f8b0:4864:20::1132])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 531a3ff9-2c91-11f0-9ffb-bf95429c2676;
 Fri, 09 May 2025 06:51:53 +0200 (CEST)
Received: by mail-yw1-x1132.google.com with SMTP id
 00721157ae682-70a35432c21so11796677b3.0; 
 Thu, 08 May 2025 21:51:53 -0700 (PDT)
Received: from [10.138.7.94] ([45.134.140.51])
 by smtp.gmail.com with ESMTPSA id
 00721157ae682-70a3d9ec4e6sm3964487b3.95.2025.05.08.21.51.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 08 May 2025 21:51:50 -0700 (PDT)
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
X-Inumbo-ID: 531a3ff9-2c91-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746766312; x=1747371112; darn=lists.xenproject.org;
        h=in-reply-to:subject:autocrypt:from:content-language:references:cc
         :to:user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DYVVwNV/rBOmGTfp+DHX6WAdh7n1L1q/MEI16uRebkM=;
        b=ZzSs4SgZV1q06JdSXLnUDMrPw9Lz91sPoWqaWdkrc12zFGdOeeuDpaplGXSYDjCDUa
         zGbRlw8N8lRlpE1qtTVJlVf5BfW6eylFuSW1xAmNkd17El6UdGcH1Hs2nVRV4kcFszPA
         NXnwpIYhQD0bB6c9aZchv/ghq7FNypjfDjLdEGO8BhcleN933j/U0hxbmdM9fazONPz8
         kxy28QpXFJ3zcYqhl1utJOfa8wmPXC8u2s/aLhz2XqZ2TuExG/HcBwHmpxb4rvseq5Zz
         mpAlbSEQA3GIfcj+EPllfm1Cjyzjo6Qs2mhSrc0VYBLcUjKvObz355SyYc2bDzLOk4qt
         tbbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746766312; x=1747371112;
        h=in-reply-to:subject:autocrypt:from:content-language:references:cc
         :to:user-agent:mime-version:date:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=DYVVwNV/rBOmGTfp+DHX6WAdh7n1L1q/MEI16uRebkM=;
        b=Shhszq/phjJZzgAebsIE8d1unhsZbV0ql/Jq3alMNYHQFphnp0QfrbIKgBj4g3h3up
         UJesNPK8kaFnYCtH6TRIoAUOZo4U9hnZn94IABkLoTXK8rIRerjfqJ5tiUATqxYZtubb
         drZsGGKfFAcCa7wvqzdjNzD+tdriAZ4n92kgEg1/NBi5qAbgPr3JTjta5Q5HLgrKvOJA
         gjX9WK/+Jbv25siJ1DyONZdWTXduXlMPlw7sOTNxd/PELF/OWFSotSIYl61ZLUKVp3sG
         qc/gllJFNWbuRBt2WLjVnE1qXGe2JjLZONw1Zt5BwA3Ceh0i0JXf8CTZ3BzilfBkuiM4
         n0cg==
X-Forwarded-Encrypted: i=1; AJvYcCVFXJFGODclEzWDZ2X03maKhUqat5xTX3q1G2Y0mVshQOMFMQZvsMEnQ/Gf2KWY/56HMhA06GsUIOiPFtEw/n2OuA==@lists.xenproject.org, AJvYcCVWBCLYu+JlugjC5QosSOPUlpLTgYuJJRGJarEzTVAxTQsNpITORi04oHf0qNQIJlxtEPvhnayuALp5@lists.xenproject.org
X-Gm-Message-State: AOJu0Yy9Aor/jVJwEFHswUVLtWOYoOAviquP8JlMNv7RDK1pNp6qrTye
	sXnm61Lp11MWZJVvQWwMRYsEOMkydIvgLQal3/q1MaTjuNoD7Txh
X-Gm-Gg: ASbGnctwE/D8xTNUwBEGtdLFZ6m35nvscVNOhVy77KVa/VSpotntBLq4v99X2LkUdPv
	bM1IFTXjkr6LW4tbj3S3ew/vo/x8mAEgBAnGZ66p/DEw3C/oCMK4va7KOXYrMuhYvpWXGsBJB2W
	uVFzxls4J5usnKZ2eOFGMWQqIHw9NfegBcbhuEuf1rBS7M1+/czePfkzKhB+2WdMD0e18u7xOKY
	PndvJaPbAb9EYOWd5tc9GmdGd1tpzoHm3FQhsXcongdkFASGIVu/Zo7NNc8MeZQBnSXoi2usRdi
	Pw6esc5cHlCu0EF4r5ipBg6ntGtejgRQyFFBMspiD3zg
X-Google-Smtp-Source: AGHT+IFNN+w/zLbsPTSq+jWtBLyJEiL7LR8EvcR00Hn2A+A3YiUykcdPY/WVw9l8XeFRdibuPcJFyQ==
X-Received: by 2002:a05:690c:fd3:b0:703:b5ae:987e with SMTP id 00721157ae682-70a3f9eab6amr30917567b3.2.1746766311775;
        Thu, 08 May 2025 21:51:51 -0700 (PDT)
Message-ID: <ae1a35dd-b7b2-426f-b2d5-723bb07b0e79@gmail.com>
Date: Fri, 9 May 2025 00:52:28 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Xenia Ragiadakou <Xenia.Ragiadakou@amd.com>,
 Stefano Stabellini <sstabellini@kernel.org>
Cc: Alejandro Vallejo <agarciav@amd.com>,
 Xen developer discussion <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Juergen Gross <jgross@suse.com>,
 Xen-devel <xen-devel-bounces@lists.xenproject.org>
References: <82772686-edcd-41e4-b81c-f6b3ded30901@gmail.com>
 <D9O702EAEGRU.10CY1WTUELAKF@amd.com>
 <24a0a77b-e543-453d-b20b-0dbac111287c@gmail.com>
 <D9P3M1Z20DAB.1HSZ79GOZOMKR@amd.com>
 <ae3465e2-b803-4a26-8443-0bc1d38da7ac@gmail.com>
 <aBuatoL1dm0tjZ9P@macbook.lan>
 <30243d25-881d-42d3-90c2-f791c3632372@gmail.com>
 <aBxizlMj3D94M3WS@macbook.lan>
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
Subject: Re: Mapping memory into a domain
In-Reply-To: <aBxizlMj3D94M3WS@macbook.lan>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------0J501F4yNtHBTLbtY7AqHWmY"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------0J501F4yNtHBTLbtY7AqHWmY
Content-Type: multipart/mixed; boundary="------------cq2pLCqOCBKNgEhclUilQvE2";
 protected-headers="v1"
From: Demi Marie Obenour <demiobenour@gmail.com>
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Xenia Ragiadakou <Xenia.Ragiadakou@amd.com>,
 Stefano Stabellini <sstabellini@kernel.org>
Cc: Alejandro Vallejo <agarciav@amd.com>,
 Xen developer discussion <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Juergen Gross <jgross@suse.com>,
 Xen-devel <xen-devel-bounces@lists.xenproject.org>
Message-ID: <ae1a35dd-b7b2-426f-b2d5-723bb07b0e79@gmail.com>
Subject: Re: Mapping memory into a domain
References: <82772686-edcd-41e4-b81c-f6b3ded30901@gmail.com>
 <D9O702EAEGRU.10CY1WTUELAKF@amd.com>
 <24a0a77b-e543-453d-b20b-0dbac111287c@gmail.com>
 <D9P3M1Z20DAB.1HSZ79GOZOMKR@amd.com>
 <ae3465e2-b803-4a26-8443-0bc1d38da7ac@gmail.com>
 <aBuatoL1dm0tjZ9P@macbook.lan>
 <30243d25-881d-42d3-90c2-f791c3632372@gmail.com>
 <aBxizlMj3D94M3WS@macbook.lan>
In-Reply-To: <aBxizlMj3D94M3WS@macbook.lan>
Autocrypt-Gossip: addr=jgross@suse.com; keydata=
 xsBNBFOMcBYBCACgGjqjoGvbEouQZw/ToiBg9W98AlM2QHV+iNHsEs7kxWhKMjrioyspZKOB
 ycWxw3ie3j9uvg9EOB3aN4xiTv4qbnGiTr3oJhkB1gsb6ToJQZ8uxGq2kaV2KL9650I1SJve
 dYm8Of8Zd621lSmoKOwlNClALZNew72NjJLEzTalU1OdT7/i1TXkH09XSSI8mEQ/ouNcMvIJ
 NwQpd369y9bfIhWUiVXEK7MlRgUG6MvIj6Y3Am/BBLUVbDa4+gmzDC9ezlZkTZG2t14zWPvx
 XP3FAp2pkW0xqG7/377qptDmrk42GlSKN4z76ELnLxussxc7I2hx18NUcbP8+uty4bMxABEB
 AAHNH0p1ZXJnZW4gR3Jvc3MgPGpncm9zc0BzdXNlLmNvbT7CwHkEEwECACMFAlOMcK8CGwMH
 CwkIBwMCAQYVCAIJCgsEFgIDAQIeAQIXgAAKCRCw3p3WKL8TL8eZB/9G0juS/kDY9LhEXseh
 mE9U+iA1VsLhgDqVbsOtZ/S14LRFHczNd/Lqkn7souCSoyWsBs3/wO+OjPvxf7m+Ef+sMtr0
 G5lCWEWa9wa0IXx5HRPW/ScL+e4AVUbL7rurYMfwCzco+7TfjhMEOkC+va5gzi1KrErgNRHH
 kg3PhlnRY0Udyqx++UYkAsN4TQuEhNN32MvN0Np3WlBJOgKcuXpIElmMM5f1BBzJSKBkW0Jc
 Wy3h2Wy912vHKpPV/Xv7ZwVJ27v7KcuZcErtptDevAljxJtE7aJG6WiBzm+v9EswyWxwMCIO
 RoVBYuiocc51872tRGywc03xaQydB+9R7BHPzsBNBFOMcBYBCADLMfoA44MwGOB9YT1V4KCy
 vAfd7E0BTfaAurbG+Olacciz3yd09QOmejFZC6AnoykydyvTFLAWYcSCdISMr88COmmCbJzn
 sHAogjexXiif6ANUUlHpjxlHCCcELmZUzomNDnEOTxZFeWMTFF9Rf2k2F0Tl4E5kmsNGgtSa
 aMO0rNZoOEiD/7UfPP3dfh8JCQ1VtUUsQtT1sxos8Eb/HmriJhnaTZ7Hp3jtgTVkV0ybpgFg
 w6WMaRkrBh17mV0z2ajjmabB7SJxcouSkR0hcpNl4oM74d2/VqoW4BxxxOD1FcNCObCELfIS
 auZx+XT6s+CE7Qi/c44ibBMR7hyjdzWbABEBAAHCwF8EGAECAAkFAlOMcBYCGwwACgkQsN6d
 1ii/Ey9D+Af/WFr3q+bg/8v5tCknCtn92d5lyYTBNt7xgWzDZX8G6/pngzKyWfedArllp0Pn
 fgIXtMNV+3t8Li1Tg843EXkP7+2+CQ98MB8XvvPLYAfW8nNDV85TyVgWlldNcgdv7nn1Sq8g
 HwB2BHdIAkYce3hEoDQXt/mKlgEGsLpzJcnLKimtPXQQy9TxUaLBe9PInPd+Ohix0XOlY+Uk
 QFEx50Ki3rSDl2Zt2tnkNYKUCvTJq7jvOlaPd6d/W0tZqpyy7KVay+K4aMobDsodB3dvEAs6
 ScCnh03dDAFgIq5nsB11j3KPKdVoPlfucX2c7kGNH+LUMbzqV6beIENfNexkOfxHfw==

--------------cq2pLCqOCBKNgEhclUilQvE2
Content-Type: multipart/mixed; boundary="------------nvqOraiAUlImmzT6HAh2PVHM"

--------------nvqOraiAUlImmzT6HAh2PVHM
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On 5/8/25 3:52 AM, Roger Pau Monn=C3=A9 wrote:
> On Wed, May 07, 2025 at 08:36:07PM -0400, Demi Marie Obenour wrote:
>> On 5/7/25 1:39 PM, Roger Pau Monn=C3=A9 wrote:
>>> On Tue, May 06, 2025 at 04:56:12PM -0400, Demi Marie Obenour wrote:
>>>> On 5/6/25 9:06 AM, Alejandro Vallejo wrote:
>>>>> On Tue May 6, 2025 at 3:02 AM CEST, Demi Marie Obenour wrote:
>>>>>> On 5/5/25 7:32 AM, Alejandro Vallejo wrote:
>>>>>>> I suppose this is still about multiplexing the GPU driver the way=
 we
>>>>>>> last discussed at Xen Summit?
>>>>>>>
>>>>>>> On Mon May 5, 2025 at 12:51 AM CEST, Demi Marie Obenour wrote:
>>>>>>>> What are the appropriate Xen internal functions for:
>>>>>>>>
>>>>>>>> 1. Turning a PFN into an MFN?
>>>>>>>> 2. Mapping an MFN into a guest?
>>>>>>>> 3. Unmapping that MFN from a guest?
>>>>>>>
>>>>>>> The p2m is the single source of truth about such mappings.
>>>>>>>
>>>>>>> This is all racy business. You want to keep the p2m lock for the =
full
>>>>>>> duration of whatever operation you wish do, or you risk another C=
PU
>>>>>>> taking it and pulling the rug under your feet at the most inconve=
nient
>>>>>>> time.
>>>>>>>
>>>>>>> In general all this faff is hidden under way too many layers bene=
ath
>>>>>>> copy_{to,from}_guest(). Other p2m manipulation high-level constru=
cts
>>>>>>> that might do interesting things worth looking at may be {map,unm=
ap}_mmio_region()
>>>>>>>
>>>>>>> Note that not every pfn has an associated mfn. Not even every val=
id pfn
>>>>>>> has necessarily an associated mfn (there's pod). And all of this =
is
>>>>>>> volatile business in the presence of a baloon driver or vPCI plac=
ing
>>>>>>> mmio windows over guest memory.
>>>>>>
>>>>>> Can I check that POD is not in use? =20
>>>>>
>>>>> Maybe, but now you're reaching exponential complexity considering e=
ach
>>>>> individual knob of the p2m into account.
>>>>>
>>>>>>
>>>>>>> In general anything up this alley would need a cohesive pair for
>>>>>>> map/unmap and a credible plan for concurrency and how it's all ha=
ndled
>>>>>>> in conjunction with other bits that touch the p2m.
>>>>>>
>>>>>> Is taking the p2m lock for the entire operation a reasonable appro=
ach
>>>>>> for concurrency?  Will this cause too much lock contention?
>>>>>
>>>>> Maybe. It'd be fine for a page. Likely not so for several GiB if th=
ey
>>>>> aren't already superpages.
>>>>>
>>>>>>
>>>>>>>> The first patch I am going to send with this information is a do=
cumentation
>>>>>>>> patch so that others do not need to figure this out for themselv=
es.
>>>>>>>> I remember being unsure even after looking through the source co=
de, which
>>>>>>>> is why I am asking here.
>>>>>>>
>>>>>>> That's not surprising. There's per-arch stuff, per-p2mtype stuff,=

>>>>>>> per-guesttype stuff. Plus madness like on-demand memory. It's no =
wonder
>>>>>>> such helpers don't exist and the general manipulations are hard t=
o
>>>>>>> explain.
>>>>>>
>>>>>> Is this a task that is only suitable for someone who has several y=
ears
>>>>>> experience working on Xen, or is it something that would make sens=
e for
>>>>>> someone who is less experienced?
>>>>>
>>>>> The p2m is a very complex beast that integrates more features than =
I
>>>>> care to count. It requires a lot of prior knowledge. Whoever does i=
t
>>>>> must know Xen fairly well in many configurations.
>>>>>
>>>>> The real problem is finding the right primitives that do what you w=
ant
>>>>> without overcomplicating everything else, preserving system securit=
y
>>>>> invariants and have benign (and ideally clear) edge cases.
>>>>>
>>>>> This was the last email you sent (I think?). Has any of the require=
ments
>>>>> changed in any direction?
>>>>>
>>>>>   https://lore.kernel.org/xen-devel/Z5794ysNE4KDkFuT@itl-email/
>>>>
>>>> Map and Revoke are still needed, with the same requirements as descr=
ibed
>>>> in this email.  Steal and Return were needed for GPU shared virtual =
memory,
>>>> but it has been decided to not support this with virtio-GPU, so thes=
e
>>>> primitives are no longer needed.
>>>>
>>>>> Something I'm missing there is how everything works without Xen. Th=
at
>>>>> might help (me, at least) guage what could prove enough to support =
the
>>>>> usecase. Are there sequence diagrams anywhere about how this whole =
thing
>>>>> works without Xen? I vaguely remember you showing something last ye=
ar in
>>>>> Xen Summit in the design session, but my memory isn't that good :)
>>>
>>> Hello,
>>>
>>> Sorry, possibly replying a bit out of context here.
>>>
>>> Since I will mention this in several places: p2m is the second stage
>>> page-tables used by Xen for PVH and HVM guests.  A p2m violation is
>>> the equivalent of a page-fault for guest p2m accesses.
>>>
>>>> A Linux driver that needs access to userspace memory
>>>> pages can get it in two different ways:
>>>>
>>>> 1. It can pin the pages using the pin_user_pages family of APIs.
>>>>    If these functions succeed, the driver is guaranteed to be able
>>>>    to access the pages until it unpins them.  However, this also
>>>>    means that the pages cannot be paged out or migrated.  Furthermor=
e,
>>>>    file-backed pages cannot be safely pinned, and pinning GPU memory=

>>>>    isn=E2=80=99t supported.  (At a minimum, it would prevent the pag=
es from
>>>>    migrating from system RAM to VRAM, so all access by a dGPU would
>>>>    cross the PCIe bus, which would be very slow.)
>>>
>>> From a Xen p2m this is all fine - Xen will never remove pages from th=
e
>>> p2m unless it's requested to.  So the pining, while needed on the Lin=
ux
>>> side, doesn't need to be propagated to Xen I would think.
>>
>> If pinning were enough things would be simple, but sadly it=E2=80=99s =
not.
>>
>>>> 2. It can grab the *current* location of the pages and register an
>>>>    MMU notifier.  This works for GPU memory and file-backed memory.
>>>>    However, when the invalidate_range function of this callback, the=

>>>>    driver *must* stop all further accesses to the pages.
>>>>
>>>>    The invalidate_range callback is not allowed to block for a long
>>>>    period of time.  My understanding is that things like dirty page
>>>>    writeback are blocked while the callback is in progress.  My
>>>>    understanding is also that the callback is not allowed to fail.
>>>>    I believe it can return a retryable error but I don=E2=80=99t thi=
nk that
>>>>    it is allowed to keep failing forever.
>>>>
>>>>    Linux=E2=80=99s grant table driver actually had a bug in this are=
a, which
>>>>    led to deadlocks.  I fixed that a while back.
>>>>
>>>> KVM implements the second option: it maps pages into the stage-2
>>>> page tables (or shadow page tables, if that is chosen) and unmaps
>>>> them when the invalidate_range callback is called.
>>>
>>> I assume this map and unmap is done by the host as a result of some
>>> guest action?
>>
>> Unmapping can happen at any time for any or no reason.  Semantically,
>> it would be correct to only map the pages in response to a p2m violati=
on,
>> but for performance it might be better to map the pages eagerly instea=
d.
>=20
> That's an implementation detail, you can certainly map the pages
> eagerly, or even map multiple contiguous pages as a result of a single
> p2m violation.
>=20
> I would focus on making a functioning prototype first, performance
> comes afterwards.

Makes sense.

>>>> Furthermore,
>>>> if a page fault happens while the page is unmapped, KVM will try
>>>> to bring the pages back into memory so the guest can access it.
>>>
>>> You could likely handle this in Xen in the following way:
>>>
>>>  - A device model will get p2m violations forwarded, as it's the same=

>>>    model that's used to handle emulation of device MMIO.  You will
>>>    need to register an ioreq server to request those faults to be
>>>    forwarded, I think the hardware domain kernel will handle those?
>>>
>>>  - Allow ioreqs to signal to Xen that a guest operation must be
>>>    retried.  IOW: resume guest execution without advancing the IP.
>>>
>>> I think this last bit is the one that will require changes to Xen, so=

>>> that you can add a type of ioreq reply that implies a retry from the
>>> guest context.
>> I=E2=80=99m not actually sure if this is needed, though it would be ni=
ce.  It
>> might be possible for Xen to instead emulate the current instruction a=
nd
>> continue, with the ioreq server just returning the current value of th=
e
>> pages.
>=20
> You can, indeed, but it's cumbersome?  You might have to map the page
> in the context of the entity that implements the ioreq server to
> access the data.  Allowing retries would be more generic, and reduce
> the code in the ioreq server handler, that would only map the page
> to the guest p2m and request a retry.

Yeah, it is cumbersome indeed.

>> What I=E2=80=99m more concerned about is being able to provide a page
>> into the p2m so that the *next* access doesn=E2=80=99t fault, and bein=
g able
>> to remove that page from the p2m so that the next access *does* fault.=

>=20
> Maybe I'm not getting the question right, all Xen modifications to the
> p2m take immediate effect.  By the time a XEN_DOMCTL_memory_mapping
> hypercall returns the operation would have taken effect.

Ah, that makes sense.  When revoking access, can XEN_DOMCTL_iomem_permiss=
ion
and XEN_DOMCTL_memory_mapping fail even if the parameters are correct and=

the caller has enough permissions, or will they always succeed?

>> Are there any hypercalls that can be used for these operations right
>> now?
>=20
> With some trickery you could likely use XEN_DOMCTL_memory_mapping to
> add and remove those pages.  You will need calls to
> XEN_DOMCTL_iomem_permission beforehand so that you grant the receiving
> domain permissions to access those (and of course the granting domain
> needs to have full access to them).
>=20
> This is no ideal if mapping RAM pages, AFAICT there are no strict
> checks that the added page is not RAM, but still you will need to
> handle RAM pages as IOMEM so and grant them using
> XEN_DOMCTL_iomem_permission which is not great.  Also note that this
> is a domctl, so not stable.  It might however be enough for a
> prototype.

Unfortunately this won=E2=80=99t work if the backend is a PVH domain, as =
a PVH
domain doesn=E2=80=99t know its own MFNs.  It also won=E2=80=99t work for=
 deprivileged
backends because XEN_DOMCTL_iomem_permission is subject to XSA-77.

> Long term I think we want to expand XENMEM_add_to_physmap{,_batch} to
> handle this use-case.

That would indeed be better.

>> If not, which Xen functions would one use to implement them?
>> Some notes:
>>
>> - The p2m might need to be made to point to a PCI BAR or system RAM.
>>   The guest kernel and host userspace don=E2=80=99t know which, and in=
 any
>>   case don=E2=80=99t need to care.  The host kernel knows, but I don=E2=
=80=99t know
>>   if the information is exposed to the Xen driver.
>=20
> Hm, as said above, while you could possible handle RAM as IOMEM, it
> has the slight inconvenience of having to add such RAM pages to the
> d->iomem_caps rangeset for XEN_DOMCTL_memory_mapping to succeed.
>=20
> From a guest PoV, it doesn't matter if the underlying page is RAM or
> MMIO, as long as it's mapped in the p2m.

Understood, thanks!

>> - If the p2m needs to point to system RAM, the RAM will be memory
>>   that belongs to the backend.
>>
>> - If the p2m needs to point to a PCI BAR, it will initially need
>>   to point to a real PCI device that is owned by the backend.
>=20
> As long as you give the destination domain access to the page using
> XEN_DOMCTL_iomem_permission prior to the XEN_DOMCTL_memory_mapping
> call it should work.
>=20
> How does this work for device DMA accesses?  If the device is assigned
> to the backend domain (and thus using the backend domain IOMMU context
> entry and page-tables) DMA accesses cannot be done against guest
> provided addresses, there needs to be some kind of translation layer
> that filters commands?

Thankfully, this is handled by the backend.

> My initial recommendation would be to look into what you can do with
> the existing XEN_DOMCTL_iomem_permission and XEN_DOMCTL_memory_mapping
> hypercalls.

I think this would be suitable for a prototype but not for production.

>> - The switch from =E2=80=9Cemulated MMIO=E2=80=9D to =E2=80=9CMMIO or =
real RAM=E2=80=9D needs to
>>   be atomic from the guest=E2=80=99s perspective.
>=20
> Updates of p2m PTEs are always atomic.
That=E2=80=99s good.

Xenia, would it be possible for AMD to post whatever has been
implemented so far?  I think this would help a lot, even if it
is incomplete.
--=20
Sincerely,
Demi Marie Obenour (she/her/hers)
--------------nvqOraiAUlImmzT6HAh2PVHM
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
YXJpZSBPYmVub3VyIChJVEwgRW1haWwgS2V5KSA8ZGVtaUBpbnZpc2libGV0aGlu
Z3NsYWIuY29tPsLBjgQTAQgAOBYhBHaHTZ8TNroiWQcccbKItV//nCLBBQJgOEV+
AhsDBQsJCAcCBhUKCQgLAgQWAgMBAh4BAheAAAoJELKItV//nCLBKwoP/1WSnFdv
SAD0g7fD0WlF+oi7ISFT7oqJnchFLOwVHK4Jg0e4hGn1ekWsF3Ha5tFLh4V/7UUu
obYJpTfBAA2CckspYBqLtKGjFxcaqjjpO1I2W/jeNELVtSYuCOZICjdNGw2Hl9yH
KRZiBkqc9u8lQcHDZKq4LIpVJj6ZQV/nxttDX90ax2No1nLLQXFbr5wb465LAPpU
lXwunYDij7xJGye+VUASQh9datye6orZYuJvNo8Tr3mAQxxkfR46LzWgxFCPEAZJ
5P56Nc0IMHdJZj0Uc9+1jxERhOGppp5jlLgYGK7faGB/jTV6LaRQ4Ad+xiqokDWp
mUOZsmA+bMbtPfYjDZBz5mlyHcIRKIFpE1l3Y8F7PhJuzzMUKkJi90CYakCV4x/a
Zs4pzk5E96c2VQx01RIEJ7fzHF7lwFdtfTS4YsLtAbQFsKayqwkGcVv2B1AHeqdo
TMX+cgDvjd1ZganGlWA8Sv9RkNSMchn1hMuTwERTyFTr2dKPnQdA1F480+jUap41
ClXgn227WkCIMrNhQGNyJsnwyzi5wS8rBVRQ3BOTMyvGM07j3axUOYaejEpg7wKi
wTPZGLGH1sz5GljD/916v5+v2xLbOo5606j9dWf5/tAhbPuqrQgWv41wuKDi+dDD
EKkODF7DHes8No+QcHTDyETMn1RYm7t0RKR4zsFNBFp+A0oBEAC9ynZI9LU+uJkM
eEJeJyQ/8VFkCJQPQZEsIGzOTlPnwvVna0AS86n2Z+rK7R/usYs5iJCZ55/JISWd
8xD57ue0eB47bcJvVqGlObI2DEG8TwaW0O0duRhDgzMEL4t1KdRAepIESBEA/iPp
I4gfUbVEIEQuqdqQyO4GAe+MkD0Hy5JH/0qgFmbaSegNTdQg5iqYjRZ3ttiswalq
l1/iSyv1WYeC1OAs+2BLOAT2NEggSiVOtxEfgewsQtCWi8H1SoirakIfo45Hz0tk
/Ad9ZWh2PvOGt97Ka85o4TLJxgJJqGEnqcFUZnJJriwoaRIS8N2C8/nEM53jb1sH
0gYddMU3QxY7dYNLIUrRKQeNkF30dK7V6JRH7pleRlf+wQcNfRAIUrNlatj9Txwi
vQrKnC9aIFFHEy/0mAgtrQShcMRmMgVlRoOA5B8RTulRLCmkafvwuhs6dCxN0GNA
ORIVVFxjx9Vn7OqYPgwiofZ6SbEl0hgPyWBQvE85klFLZLoj7p+joDY1XNQztmfA
rnJ9x+YV4igjWImINAZSlmEcYtd+xy3Li/8oeYDAqrsnrOjb+WvGhCykJk4urBog
2LNtcyCjkTs7F+WeXGUo0NDhbd3Z6AyFfqeF7uJ3D5hlpX2nI9no/ugPrrTVoVZA
grrnNz0iZG2DVx46x913pVKHl5mlYQARAQABwsFfBBgBAgAJBQJafgNKAhsMAAoJ
ELKItV//nCLBwNIP/AiIHE8boIqReFQyaMzxq6lE4YZCZNj65B/nkDOvodSiwfwj
jVVE2V3iEzxMHbgyTCGA67+Bo/d5aQGjgn0TPtsGzelyQHipaUzEyrsceUGWYoKX
YyVWKEfyh0cDfnd9diAm3VeNqchtcMpoehETH8frRHnJdBcjf112PzQSdKC6kqU0
Q196c4Vp5HDOQfNiDnTf7gZSj0BraHOByy9LEDCLhQiCmr+2E0rW4tBtDAn2HkT9
uf32ZGqJCn1O+2uVfFhGu6vPE5qkqrbSE8TG+03H8ecU2q50zgHWPdHMOBvy3Ehz
fAh2VmOSTcRK+tSUe/u3wdLRDPwv/DTzGI36Kgky9MsDC5gpIwNbOJP2G/q1wT1o
Gkw4IXfWv2ufWiXqJ+k7HEi2N1sree7Dy9KBCqb+ca1vFhYPDJfhP75I/VnzHVss
Z/rYZ9+51yDoUABoNdJNSGUYl+Yh9Pw9pE3Kt4EFzUlFZWbE4xKL/NPno+z4J9aW
emLLszcYz/u3XnbOvUSQHSrmfOzX3cV4yfmjM5lewgSstoxGyTx2M8enslgdXhPt
hZlDnTnOT+C+OTsh8+m5tos8HQjaPM01MKBiAqdPgksm1wu2DrrwUi6ChRVTUBcj
6+/9IJ81H2P2gJk3Ls3AVIxIffLoY34E+MYSfkEjBz0E8CLOcAw7JIwAaeBTzsFN
BGbyLVgBEACqClxh50hmBepTSVlan6EBq3OAoxhrAhWZYEwN78k+ENhK68KhqC5R
IsHzlL7QHW1gmfVBQZ63GnWiraM6wOJqFTL4ZWvRslga9u28FJ5XyK860mZLgYhK
9BzoUk4s+dat9jVUbq6LpQ1Ot5I9vrdzo2p1jtQ8h9WCIiFxSYy8s8pZ3hHh5T64
GIj1m/kY7lG3VIdUgoNiREGf/iOMjUFjwwE9ZoJ26j9p7p1U+TkKeF6wgswEB1T3
J8KCAtvmRtqJDq558IU5jhg5fgN+xHB8cgvUWulgK9FIF9oFxcuxtaf/juhHWKMO
RtL0bHfNdXoBdpUDZE+mLBUAxF6KSsRrvx6AQyJs7VjgXJDtQVWvH0PUmTrEswgb
49nNU+dLLZQAZagxqnZ9Dp5l6GqaGZCHERJcLmdY/EmMzSf5YazJ6c0vO8rdW27M
kn73qcWAplQn5mOXaqbfzWkAUPyUXppuRHfrjxTDz3GyJJVOeMmMrTxH4uCaGpOX
Z8tN6829J1roGw4oKDRUQsaBAeEDqizXMPRc+6U9vI5FXzbAsb+8lKW65G7JWHym
YPOGUt2hK4DdTA1PmVo0DxH00eWWeKxqvmGyX+Dhcg+5e191rPsMRGsDlH6KihI6
+3JIuc0y6ngdjcp6aalbuvPIGFrCRx3tnRtNc7He6cBWQoH9RPwluwARAQABwsOs
BBgBCgAgFiEEdodNnxM2uiJZBxxxsoi1X/+cIsEFAmbyLVgCGwICQAkQsoi1X/+c
IsHBdCAEGQEKAB0WIQSilC2pUlbVp66j3+yzNoc6synyUwUCZvItWAAKCRCzNoc6
synyU85gD/0T1QDtPhovkGwoqv4jUbEMMvpeYQf+oWgm/TjWPeLwdjl7AtY0G9Ml
ZoyGniYkoHi37Gnn/ShLT3B5vtyI58ap2+SSa8SnGftdAKRLiWFWCiAEklm9FRk8
N3hwxhmSFF1KR/AIDS4g+HIsZn7YEMubBSgLlZZ9zHl4O4vwuXlREBEW97iL/FSt
VownU2V39t7PtFvGZNk+DJH7eLO3jmNRYB0PL4JOyyda3NH/J92iwrFmjFWWmmWb
/Xz8l9DIs+Z59pRCVTTwbBEZhcUc7rVMCcIYL+q1WxBG2e6lMn15OQJ5WfiE6E0I
sGirAEDnXWx92JNGx5l+mMpdpsWhBZ5iGTtttZesibNkQfd48/eCgFi4cxJUC4PT
UQwfD9AMgzwSTGJrkI5XGy+XqxwOjL8UA0iIrtTpMh49zw46uV6kwFQCgkf32jZM
OLwLTNSzclbnA7GRd8tKwezQ/XqeK3dal2n+cOr+o+Eka7yGmGWNUqFbIe8cjj9T
JeF3mgOCmZOwMI+wIcQYRSf+e5VTMO6TNWH5BI3vqeHSt7HkYuPlHT0pGum88d4a
pWqhulH4rUhEMtirX1hYx8Q4HlUOQqLtxzmwOYWkhl1C+yPObAvUDNiHCLf9w28n
uihgEkzHt9J4VKYulyJM9fe3ENcyU6rpXD7iANQqcr87ogKXFxknZ97uEACvSucc
RbnnAgRqZ7GDzgoBerJ2zrmhLkeREZ08iz1zze1JgyW3HEwdr2UbyAuqvSADCSUU
GN0vtQHsPzWl8onRc7lOPqPDF8OO+UfN9NAfA4wl3QyChD1GXl9rwKQOkbvdlYFV
UFx9u86LNi4ssTmU8p9NtHIGpz1SYMVYNoYy9NU7EVqypGMguDCL7gJt6GUmA0sw
p+YCroXiwL2BJ7RwRqTpgQuFL1gShkA17D5jK4mDPEetq1d8kz9rQYvAR/sTKBsR
ImC3xSfn8zpWoNTTB6lnwyP5Ng1bu6esS7+SpYprFTe7ZqGZF6xhvBPf1Ldi9UAm
U2xPN1/eeWxEa2kusidmFKPmN8lcT4miiAvwGxEnY7Oww9CgZlUB+LP4dl5VPjEt
sFeAhrgxLdpVTjPRRwTd9VQF3/XYl83j5wySIQKIPXgT3sG3ngAhDhC8I8GpM36r
8WJJ3x2yVzyJUbBPO0GBhWE2xPNIfhxVoU4cGGhpFqz7dPKSTRDGq++MrFgKKGpI
ZwT3CPTSSKc7ySndEXWkOYArDIdtyxdE1p5/c3aoz4utzUU7NDHQ+vVIwlnZSMiZ
jek2IJP3SZ+COOIHCVxpUaZ4lnzWT4eDqABhMLpIzw6NmGfg+kLBJhouqz81WITr
EtJuZYM5blWncBOJCoWMnBEcTEo/viU3GgcVRw=3D=3D
=3Dx94R
-----END PGP PUBLIC KEY BLOCK-----

--------------nvqOraiAUlImmzT6HAh2PVHM--

--------------cq2pLCqOCBKNgEhclUilQvE2--

--------------0J501F4yNtHBTLbtY7AqHWmY
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEopQtqVJW1aeuo9/sszaHOrMp8lMFAmgdihUACgkQszaHOrMp
8lOyHA//X03qV4z2Vi71RG4/DzyeuBxlp+C7G93CWCRbgCDZX0AJAwcjOKGZZVze
wvU38FEzRCjyLVfQlA/XX5N/IihIcMLycuQu1uf6iql/aFaN9390050FEAMJJRl8
TjEhYDeESHxY9mE66QLbQ790Cb1BmbZKKkbq0FNSjk4GVxHFutOC8GQOv6bBWDc9
tqj4qnmxOj+v6/NB2hQaJLo98JRhZBE1tXJxUMLc9HQqhmzkZBQRl4ftj7OeXyxe
+5akcV6NkEvYu6R/PKLpPgCwm3Wf8azbJg4FoD7JU99TNZ+qKV7Ywqqo5l88t5xM
H4vZlnnwx77bEhP03diYbsrNz5jvLg8ujG9itJFD6z+aR0v15mwdgzu1DRZ3Z/+n
QAJ7fF5C+NLQHHzD5aOuR+aSlZXypnlIGzEWJcbeAAnePFn/w4zow+kUswBndhkf
j/lwr8NtQ7OkI3cqtTFljK6zJ4HIruH91AeuCOck7E+92G/y3lKfZlBuxZY0rcgY
ks9wj57SpaxK/qz2X7dy3TPkikHuF1Dxjd9hT80FjP5zxvtkjSYQxvcreRL7hkpv
klBWzuOH/fEoBiRQ7yNW5DwxAIb0jpaataXrbStCxd9keILGT1o3FhPHsFW6iaDe
wjG02QqGllGKU54QMhNN04F99YaBelW4YYYEqi3RJxGMOpI9qaY=
=Cz+T
-----END PGP SIGNATURE-----

--------------0J501F4yNtHBTLbtY7AqHWmY--

