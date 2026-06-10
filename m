Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id FxwAELt+KWqWXwMAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 10 Jun 2026 17:11:55 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C48966A957
	for <lists+xen-devel@lfdr.de>; Wed, 10 Jun 2026 17:11:54 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=web.de header.s=s29768273 header.b="ZiZ2eGe/";
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=quarantine) header.from=web.de
Received: from list by lists.xenproject.org with outflank-mailman.1334470.1597500 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wXKah-0007hT-4H; Wed, 10 Jun 2026 15:11:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1334470.1597500; Wed, 10 Jun 2026 15:11:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wXKah-0007ft-1M; Wed, 10 Jun 2026 15:11:39 +0000
Received: by outflank-mailman (input) for mailman id 1334470;
 Wed, 10 Jun 2026 15:11:37 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Markus.Elfring@web.de>) id 1wXKaf-0007fn-9r
 for xen-devel@lists.xenproject.org; Wed, 10 Jun 2026 15:11:37 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wXKae-000Vn6-AV
 for xen-devel@lists.xenproject.org; Wed, 10 Jun 2026 17:11:36 +0200
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Markus.Elfring@web.de>)
 id 6a297e99-5cb7-0a2a0a5109dd-0a2a4508d210-12
 for <xen-devel@lists.xenproject.org>; Wed, 10 Jun 2026 17:11:36 +0200
Received: from [212.227.15.4] (helo=mout.web.de)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <Markus.Elfring@web.de>)
 id 6a297ea8-63b5-0a2a45080019-d4e30f04d2ab-3
 for <xen-devel@lists.xenproject.org>; Wed, 10 Jun 2026 17:11:36 +0200
Received: from client.hidden.invalid by smtp.web.de (mrweb005
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1N7gXO-1xKIDH3PqE-00wJp6; Wed, 10
 Jun 2026 17:11:25 +0200
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
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1781104285; x=1781709085; i=markus.elfring@web.de;
	bh=/67hHk+W7NbPsYULrCbnnZFhKtw0QsXXIqIOpv7d2jI=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:Cc:From:
	 Subject:Content-Type:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=ZiZ2eGe/ykaqQ9uWwKmbO8c7WTyUHvApBvZmkqDai0rlaRCofDmIU1sXQR1klcOQ
	 J6TUd92lWMFNeLpVkr6WoDRi9nPEkFsujtr0ZCtOKlM838OfJ7bNnQI2y9CSPzh/A
	 UgfOAe7gjQqzXw+yW8+uyuaxZA1JlqjBSWScMeIuX06xH/Q1eWf9YJiA3m8RUYFkR
	 noJYuzEuJZUpB4t/2d40YbGkvCIiuTVoadFlVlaDrucxG5Qyfyj+u3QyOUDnniUMt
	 1nx8Ck9db+ljUb6JYbs54faGtuhG/CQDEDQDcGGZ/MFvyroH06M+A/fboxJfjn8DQ
	 l2XoRAfzJD1KscnTjQ==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Message-ID: <f13e34bc-20e2-479f-92e5-167a139bcea7@web.de>
Date: Wed, 10 Jun 2026 17:11:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: xen-devel@lists.xenproject.org, =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?=
 <jgross@suse.com>, Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 Stefano Stabellini <sstabellini@kernel.org>
Content-Language: en-GB, de-DE
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org
From: Markus Elfring <Markus.Elfring@web.de>
Subject: [PATCH] xen/mcelog: Use common error handling code in
 bind_virq_for_mce()
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:MAq7XN4d+MqNcQHceBR09FGGS5D+dnyHF50hd5vl3mcYCbkhfBh
 cV5Y4yEAp1Vd+oG145zvrFIqalhWK2TEUCj4NaPAQlmIQCkQstz/CNeCdglRo7V9tU4fZwE
 FqTYu9gVPRCdjglBx+XysoQyPlxDrg3mPTdfCE0MwTA7feJrJlscA0Lu65FqankvaOz4QPP
 GOUPan+I8zAyvjh4RNX/Q==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:6mJcs9brbtw=;/YqmtxyExKkVsjjT+y/2uP4HMwB
 7cskJ01Vz/INcpJU9D38+6/QzdDqsO/s7egU5OvWMFmxnDnM1JvlvrZlTA90pFURV5e1+g1IQ
 hKG75w/6JCBkt6880dPvHSfly3/Hwgz0aPkWGwJjCUB76kC3J1obx/ZNNwzmpf9mWwDBSc6lv
 5F+c0kOSgXwu5vNnGLWWZ28cjSQ4kk9dydWvIa3uNO8lCPad4lBXQ4O16c6f7LqtkWtEBOteu
 B+db00Ua0bWfmvvDzbl4qh3IBMlWhrfcvTXslFuDdMvwdXIJ0PGm84r41g5CyiAN6VKdl0zkE
 /VbZ9rjNIhrjLTmcLShOcN+f/1ddTzSOhkjv6/XGkuvyZTPjHmXNPpJpW8PY0nMtzSstFpEn+
 QtwCJ+2WCJefEbJswqxx629bdBAQfYZzuqsGTYWqCAZtxHBiUn56Ul0jGNlCf/TLnUhFbpvkK
 hTq7v4bXzPnHBawd1c1zFE02lgnK6KlwaMF9j7B/qe9SKcxme7NrBPy3KP58DcdZh60FZFszh
 OCiE9btpcREY9r5KVAIt9OfsBPonyd8qMCR6VgXNFRIfDmyN06YzYdT7RnnmillLWZfFnM6Y1
 76hghHjWohtto9urywwcbuEw21wMez3KXr+F7NXNc5zFCCo+dbInBB3jWjJQX9aKGuMZX9jFk
 lBZSZdCEvNY7F5vvC6RMVGOg2yo2yblImWh033hbM6qUvYP+gclFRLtSS755Uk2XM7OFW6Psn
 BAWQQJXnT9/g8kr4LcvBaSXsiLcuqrP+zW2kzYiRA+d3OWGwshP5BBQC/6r8xwsjJOUzA/H2l
 AfMKkTnPH0KDLgoH2RSt3lY1K3tDnfDNaJnNubWQIspM3nW+85E/juw9vvEfIEXKgSmWmavmX
 hxC63/j3kdyssE5Gv6YvguEsu5On3ZJ59DizsUHm043/9E7+zdqXJ4GQf8ztVCI1uvP3wzF3z
 k1LhZ+th2Ck/9RZ2iCZR/QoYMjUYDEHjAyohole5FqvMxlqWXFJ/vliVxVZ/VWUKxHzyEm8XY
 idEzNENeviS/rc/9R5FSKuA0SiKhQJSB6zPAQObamGzXrLK9TSITnlH5DGI4aQ3Pjvz2o9kta
 TpTMEICVTZ8qVSmkHIRXH3rv8+4WvqYwDfWpckeuXKbXOA2SG+ckCxYlUhwSmbiWzI7ln7Is5
 gKXkZF+46AZfLoKFL6pp9Au0FUxArOObPAcq4XCWXcVFH6wM/c0vOqxPGavs5VvRJyqAaiM8K
 4Mnrt+p9sNLOtgcXTUIee6uneyUlv1YBOhqTJ01PoNQhyVvzq8H/NX/Kf5McwfJLpHRhhQ3Xd
 QYwt4JxVb0D6emWr7K0Ag53i3DceBXRYH6dYljcT2yn4he64jgX8T7cQyTocRV8eYu7Tqlww+
 ML9WjkMzSV/M2FB+IPoi87SiK7rWtxQMQl1XPEiIAVQOJ5IcSe2adLqO/aM6DdMV/ln4tiYsS
 hEk7fAl33fDmrXem04vS34U01cvUkfhegvcnrPaAsM9EKFXIvKZyOvtUsoxmZDmhl2V9fJ+UY
 u+hlNOQcKtux+nxzjNenhuXLGail8yRJ7xF82ScKiWD7FdeI52XEWqGLyfUPONN/cXv0gkc8v
 O1OOXubK80UfjUnC6EMcPkkb4uZRTsAX6mz8LIirawOh7kPP4wyoMshcDicFRU99fpQSMHS5r
 mNLbHUHrRS8bxm+l5yuSDljNNz+S+35VqjIarxkd3KCM9xTnezn4rRce95F42EAOKC5h+lrRT
 3mborARU7T2veU2AdFoDLNpTuzr2ZQgstTLi+KVozju5C7kHHF6+7PJaulSP10CTol91b4UuZ
 mRNaZUQqUjsAbpboaqxnjPMepdCWc8ri7NgBpq6koHiCHzqaM0cr7rRaJCGVgDI4P3/tZNwjE
 bGNUKZ1CzFKC2b6beAfuGU2vL6lLJM+73pBdHkbP3h36TWq0IAoSBQTjrJcxh9WldT5r3LWyf
 LBrQSrS5qmVKACLu0e7jQTI1+9MvcOnzaLWLZhYBR+nK1AQvjblgkTMPfTWLzBFvyxjSF7bhk
 y8CvLCKS9/M7vgxGQ/r4lTgRiJxJbAtv0wu/QE4DfnZxSAPxarRte5dDxQbDiVftJnSjSM/vk
 mMYdVWEO4BPxllXos0lWR+jjiz4HMM8AA+ozxgiLsLj98NwDjqUJWvkN63TbBoX2dxKQr61sy
 CroMtKvcixlsomzzdC588xCB+WFkXAgplmMk3ywzpZpcE9Y1BrfdwK7o5O3RQqyPID6Nrl739
 oAF5PFTH6NUbXZ2ADvTd8x+58TjCSMtHk2ualuOJ2rwVRua1TP+CyLikF58GAncwkLZ1JeNGL
 hTZOFHHIjvRaFwqeQU121N4adBbM25WoUbAzRdwIuTP5tnaSUuQfvNtB+AbW58vUdcurUVv6v
 M63K0lkBG0Phxz2CYYzjMEzgGSlExoxOefsJz9crZ341mMqEkD5nZoWG5obwrIlbMKgqLpQPm
 N3ICgjlqjVQwR/0zSNT6Z7Sf4Rsl4A49V0SUojs2T4FBajGA+LD8rMVbx+QnRLlQFX5wnvyZe
 py70mqwpIN2K+xjFd498x7md26ZmyoF4zDx6qN6lLZtZdmDPXNV7qUjpGCudrvIqlW4pATD49
 wNmpf+v/4QVusu4DqRTTQUbE1+ikbr9Ejgr/z1ShvD9hPVfmta/D5pAFbdVo91OWkVTxu0FJo
 IUCCuG3twYCQSvMO/J9fwHVeVL0tI2wAfp8jX4vwiaUZYyQz2tMdRojJJx5y9M8rNr+z4/bJv
 f9LphznA91AA+YBqRC1/Gljb85cHVorhXYaSkLlvLZN5D1PO0FQS+zn2cLYNWzsiPgGxiX/Es
 A5top4KrgEJt7MXvru2X/UhtAKdTsNQYmbHfjwaIP1E0Sd67lMRUE9gUCpnq81ETzHfG1QZog
 uPdusr0wprEoqYd6+wDbnk13dX8zPS7uLxsAdRwFvxJc/GYYp4xln7KZr/4g5HYxZhrRPNTyq
 mcNVJ5GoVbe1cTEKL0ELzfKzOZvQqaZbqo6ROA6SDOWvVSrH3Rz/vUIt0aOGck6tdVZn2woH7
 iHtZueO6t39rgVdmECfBC1Q/2qnA5VOBA+Vz959fWxqI9XAoOjN3ZYARyYspK9el9gKZLR+Kn
 JReP+qPo4QhwPEaWszH3jmdd0xbH8njQUiKiBcM7aCZxo6hudgtmgeVhyRj4HrUqymVe+m0R3
 12ZY/KfU1xhMs90Z01cXonhplBsuyAbbVf/alkqfsEAOJoDBcS1rVf3Wpba3BRkcc8HSECv/7
 9w/IbepK11x8muFm8x06uAXw/YxD1ctRpEEEctC4ZZgIJYeKf/AFyYQh5QcyX1/g/nXvFH2gy
 pW3WDTFSmFwd4jary7vNSs/jOOtH8xIREL9ns4ZZ+0we6TSD5kQd2FkdqsWNE5iUQ/erpxnyb
 AcRL5PqVUaobxpLX1eLWG0Zhvf+qHjl97g1Jr7+EJVURGvglJ8rN2ix1y2NJIiro6E0whH6W2
 n4bD2QF/zCUpW5D1iQthCB/qLdtwbmXVNfYUQadvzCeEc+lr2IHs5DIVIuzatRNf0rvmKPX7X
 yUFuuuumkktWwnZCvbsrOCiNbZX/l15Ixv5VqrsJXC3PXiygLXb6qm/tsaMogPUlZAxU6redG
 ZN1d5Qd3xHVE91G/FWB2trH/Pb3ojHMYqXSB8ICjdvIWmm21rIbehCx/BW0JI2Ll3YY4yRQG+
 kT3y2haSH4M+sMbJ6SwpUcd4QvivIGvJpCgy15kLU5G+XzJEVzvp+w+XctxtHx5Bx9QvPkVkM
 KhsOERqhHCHEtHvTD5pbxlwCwtSwzIMS35V1zV1jmePqBkIpNMPDnFwEYZfEQw/GCvffjCKzJ
 ZYjD44Ea4tiS4nOrhVe8h0QVHaC60sJ+7gneM2yyXgc77TRW8b/1J57Nsxv8gXfU2OQD37quh
 U2biiPujSqHOwjZeU3ax2kTKOrHY15BTvwinpj0saryI3WOaSJZnjfG4JetEEA7iQ2Zc0vr8r
 Og/BBpB0U4sa/fXZUuf/7Pub0nvxjKGZ21gMkaFltCY+zOCmW8fnn2HiddMdsdZkJ1r9Z3hKY
 Q7WJiSwV5DOQh9OKupO4uH02AaJ9X+dNclBs4s9qAYgXe4M9RqADYEDtHZH/0NeTZ9skE67iz
 IIjKIpbX8ZTqZuVlbPRaFuoS5MaEik+urzwQU2wztvlf9hdq5reNGpdl3XHqUxvP053beWDp0
 3kY4nGwRpKXFxG4yWfgV7Ln/D+wuh61QumlMxxmTrDYfal/nIFq4JRToj6k7XOF10kzh2fFjR
 qkSkqah3GeQ/i3zaul/8qygsKHhYe2XfaLmuQmNYU780o30BFZ/CD2yf+KpeiZMaNi2HMI+9J
 tqcvDvC99MivTScBb/JEE3ag2DGeXyU2WQON83J0ZxmPYaaAT16IshLld7Fs8k+dZQFX5uofP
 dwqyH/NuFJkhn/UTjx+3w3HgGo7Gn9s8KzGRh9ovNmkUZUth2zN1CA51c2S0SS+fmayKOH3qZ
 U1niAEC6oXy9+KmtvLWRL9HLKPKfofo1T0hQidsp0GNELM7HHf5lU8reRTok8f0UiArm6anXi
 LX8w+oVTmtb9yLh8/CYivhC4KmYhQGUjyufdrUKlLZCeggbmRIXiipwxkWk2PVJJNFyyqZbVC
 PCPydCwLgXGcjSh5mFYPFrZTi+rxMlGrKxxU/WVMgFbcVLGbztBF7utNPTl93faP1uW8zNTuK
 re+5+HmVtZnBCBW0AVP6Afg9GLGuJrW8cqfjZfSyiGxCT/Xy+fNCJ6zEk3Op5TbyfB1BxfyM7
 8/40zFAaMA1WfhF6cN0OzsRAkVudwXYbN2KcbJQRqBz0TiB2IMZTARy60rMWE+HKDryOhfuXx
 VJ+LGI979WcYpl/QkOHoZjGyRq+tC1hwUVYkI/bPVvvjWUc3X3cChh2ehykF+PrApSmIRJ8X8
 +L3+ckAk3fHe5meysuG/y2ZUC3zJGQzw5tHcQ9dce/lO0KeB0TkiQSEDk2rJNl6yZlVOZHQvs
 6paXhSPvQ79H7T/tBI/6BzG/m/ET2FZlXx7uwoLSZR4rbIKk36X/H5Mmd+V472RM/Yn8TByn8
 AcHpckH+z10Gn8SrvGO11C+AYYlzhR7ZsymjjcbeHuXqfbk5y9XPZSfS3uCxe7tG/OT4qNYDv
 gSgxOfdWDDYe5ZbEjTnVQs1NPQuJqWOdUG/jfcEiyRC9psx/4VF8CGaiLthKijPLDMbUHs9mc
 GDq6YxZ40QgygSKw6jHqtfHrzdZrDGxNjG2dk2+0yj3vVkSu+rWiU6GT7nsxOeroVxYlyc4xR
 E0jDLOYBKoCnNK9jBtq0Oj/EgCr21v/A4IM4v7e+ChAa/+Hrkd4vyHS4b9mZ/oPzgu87iTTW6
 Bb/v0c0QLvY9R/Bd1jyi1EL/N/0nmbV/jwtJwrN7wtmMWy4OywK1Y0GMtBOz43RiBRUQGzoo9
 0CtM9zcXsQ3wyw6YDGTVVyi1iUsc2fvok0kVhEeltCiuzcXbVGpGXnhNsL5L+oul2nohTKIXR
 JY0DFo0mxUGSdN+4XnqOZAIQHn6++dQQ0Q7oMhuomTMro3kBNO6vtx1w4f7gdtRfo17mArv52
 nN4Lha2McnitVjD5NoOR4UgMcJRbIlGJbIO+fWL4oBwOygMD
X-purgate-ID: tlsNG-c1860d/1781104296-BD96DDB1-9ADE20B2/0/0
X-purgate-type: clean
X-purgate-size: 1112
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[web.de,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[web.de:s=s29768273];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:jgross@suse.com,m:oleksandr_tyshchenko@epam.com,m:sstabellini@kernel.org,m:linux-kernel@vger.kernel.org,m:kernel-janitors@vger.kernel.org,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER(0.00)[Markus.Elfring@web.de,xen-devel-bounces@lists.xenproject.org];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[mailman];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_FROM(0.00)[web.de];
	TO_DN_SOME(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	ALIAS_RESOLVED(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[Markus.Elfring@web.de,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[web.de:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[9]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 8C48966A957

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Wed, 10 Jun 2026 17:05:22 +0200
Subject: [PATCH] xen/mcelog: Use common error handling code in bind_virq_f=
or_mce()

Use an additional label so that a bit of exception handling can be better
reused at the end of an if branch.

This issue was detected by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
=2D--
 drivers/xen/mcelog.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/xen/mcelog.c b/drivers/xen/mcelog.c
index 53a8720f5cae..df15d5cf6d4c 100644
=2D-- a/drivers/xen/mcelog.c
+++ b/drivers/xen/mcelog.c
@@ -380,14 +380,14 @@ static int bind_virq_for_mce(void)
 	ret =3D HYPERVISOR_mca(&mc_op);
 	if (ret) {
 		pr_err("Failed to get CPU info\n");
-		kfree(g_physinfo);
-		return ret;
+		goto free_info;
 	}
=20
 	ret  =3D bind_virq_to_irqhandler(VIRQ_MCA, 0,
 				       xen_mce_interrupt, 0, "mce", NULL);
 	if (ret < 0) {
 		pr_err("Failed to bind virq\n");
+free_info:
 		kfree(g_physinfo);
 		return ret;
 	}
=2D-=20
2.54.0


