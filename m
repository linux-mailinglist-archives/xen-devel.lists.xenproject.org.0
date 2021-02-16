Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E8F931D03D
	for <lists+xen-devel@lfdr.de>; Tue, 16 Feb 2021 19:32:27 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.86021.161055 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lC58R-0007YM-HS; Tue, 16 Feb 2021 18:31:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 86021.161055; Tue, 16 Feb 2021 18:31:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lC58R-0007Xx-ED; Tue, 16 Feb 2021 18:31:43 +0000
Received: by outflank-mailman (input) for mailman id 86021;
 Tue, 16 Feb 2021 18:31:42 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=QcaE=HS=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1lC58Q-0007Xs-4s
 for xen-devel@lists.xenproject.org; Tue, 16 Feb 2021 18:31:42 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 2014e51b-c195-4263-92b6-386ef5a81ba1;
 Tue, 16 Feb 2021 18:31:39 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 8001564E13;
 Tue, 16 Feb 2021 18:31:38 +0000 (UTC)
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
X-Inumbo-ID: 2014e51b-c195-4263-92b6-386ef5a81ba1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1613500298;
	bh=mhvB5DZ9XKO0ImPntfsEEVWA2S7YxYKMmuSSOj+XapE=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=QO0xNW5ipQKutc6TgcF94ChIujWgDEeyCICGs9EenwP4nf1v+RnvgrpBUAJg9Q5Tt
	 b4uEdStSQo7s8VTBi1j6n4w3k1SCFg74Ixeamh92s2cR+KOvWiT0Pt3Tpap+gHOHW9
	 M5SL3FHMWjZpbbADeZzRoDsoMHFmT1EEudxf0QhGj4aKuh58wz1uPLqXn6oIY33TvL
	 aHvJvNr5vh6QPNPaKeZevSHDmvpeD0an4SG1bZ/syjRQHBNP0I7O3hFaFXK3GuMdPK
	 iHVT1A02jwdH6gZ7wSCjSQoZUiFvp6ZulpnxywPv58UeDVC6D6KtJtYTTCUbWcXBEx
	 ZlXqdn408eouQ==
Date: Tue, 16 Feb 2021 10:31:37 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Jan Beulich <jbeulich@suse.com>
cc: =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, 
    xen-devel@lists.xenproject.org, cardoe@cardoe.com, 
    andrew.cooper3@citrix.com, wl@xen.org, iwj@xenproject.org, 
    anthony.perard@citrix.com, 
    Stefano Stabellini <stefano.stabellini@xilinx.com>
Subject: Re: [PATCH] firmware: don't build hvmloader if it is not needed
In-Reply-To: <4d9200cd-bd4b-e429-5c96-7a4399bb00b4@suse.com>
Message-ID: <alpine.DEB.2.21.2102161016000.3234@sstabellini-ThinkPad-T480s>
References: <20210213020540.27894-1-sstabellini@kernel.org> <20210213135056.GA6191@mail-itl> <4d9200cd-bd4b-e429-5c96-7a4399bb00b4@suse.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: multipart/mixed; BOUNDARY="8323329-1061101881-1613499727=:3234"
Content-ID: <alpine.DEB.2.21.2102161022390.3234@sstabellini-ThinkPad-T480s>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-1061101881-1613499727=:3234
Content-Type: text/plain; CHARSET=UTF-8
Content-Transfer-Encoding: 8BIT
Content-ID: <alpine.DEB.2.21.2102161022391.3234@sstabellini-ThinkPad-T480s>

On Mon, 15 Feb 2021, Jan Beulich wrote:
> On 13.02.2021 14:50, Marek Marczykowski-Górecki wrote:
> > On Fri, Feb 12, 2021 at 06:05:40PM -0800, Stefano Stabellini wrote:
> >> If rombios, seabios and ovmf are all disabled, don't attempt to build
> >> hvmloader.
> > 
> > What if you choose to not build any of rombios, seabios, ovmf, but use
> > system one instead? Wouldn't that exclude hvmloader too?
> 
> Even further - one can disable all firmware and have every guest
> config explicitly specify the firmware to use, afaict.

I didn't realize there was a valid reason for wanting to build hvmloader
without rombios, seabios, and ovfm.


> > This heuristic seems like a bit too much, maybe instead add an explicit
> > option to skip hvmloader?
> 
> +1 (If making this configurable is needed at all - is having
> hvmloader without needing it really a problem?)

The hvmloader build fails on Alpine Linux x86:

https://gitlab.com/xen-project/xen/-/jobs/1033722465



I admit I was just trying to find the fastest way to make those Alpine
Linux builds succeed to unblock patchew: although the Alpine Linux
builds are marked as "allow_failure: true" in gitlab-ci, patchew will
still report the whole battery of tests as "failure". As a consequence
the notification emails from patchew after a build of a contributed
patch series always says "job failed" today, making it kind of useless.
See attached.

I would love if somebody else took over this fix as I am doing this
after hours, but if you have a simple suggestion on how to fix the
Alpine Linux hvmloader builds, or skip the build when appropriate, I can
try to follow up.

Otherwise for now it might be best to just temporarily remove the Alpine
Linux x86 builds from gitlab-ci.

Any thoughts?
--8323329-1061101881-1613499727=:3234
Content-Type: text/plain; CHARSET=US-ASCII; NAME=patchew.email
Content-Transfer-Encoding: BASE64
Content-ID: <alpine.DEB.2.21.2102161027550.3234@sstabellini-ThinkPad-T480s>
Content-Description: 
Content-Disposition: ATTACHMENT; FILENAME=patchew.email

RnJvbTogbm8tcmVwbHlAcGF0Y2hldy5vcmcNClRvOiBmYW16aGVuZ0BhbWF6
b24uY29tDQpDYzogc3N0YWJlbGxpbmlAa2VybmVsLm9yZywsIGNhcmRvZUBj
YXJkb2UuY29tLCwgd2xAeGVuLm9yZywsIEJlcnRyYW5kLk1hcnF1aXNAYXJt
LmNvbSwsIGp1bGllbkB4ZW4ub3JnLCwgYW5kcmV3LmNvb3BlcjNAY2l0cml4
LmNvbQ0KRGF0ZTogVGh1LCAxMSBGZWIgMjAyMSAwNTowMzo1MCAtMDgwMCAo
UFNUKQ0KDQpIaSwNCg0KUGF0Y2hldyBhdXRvbWF0aWNhbGx5IHJhbiBnaXRs
YWItY2kgcGlwZWxpbmUgd2l0aCB0aGlzIHBhdGNoIChzZXJpZXMpIGFwcGxp
ZWQsIGJ1dCB0aGUgam9iIGZhaWxlZC4gTWF5YmUgdGhlcmUncyBhIGJ1ZyBp
biB0aGUgcGF0Y2hlcz8NCg0KWW91IGNhbiBmaW5kIHRoZSBsaW5rIHRvIHRo
ZSBwaXBlbGluZSBuZWFyIHRoZSBlbmQgb2YgdGhlIHJlcG9ydCBiZWxvdzoN
Cg0KVHlwZTogc2VyaWVzDQpNZXNzYWdlLWlkOiAyMDIxMDIxMDA5MjIxMS41
MzM1OS0xLXJvZ2VyLnBhdUBjaXRyaXguY29tDQpTdWJqZWN0OiBbUEFUQ0hd
IHg4Ni9pcnE6IHNpbXBsaWZ5IGxvb3AgaW4gdW5tYXBfZG9tYWluX3BpcnEN
Cg0KPT09IFRFU1QgU0NSSVBUIEJFR0lOID09PQ0KIyEvYmluL2Jhc2gNCnNs
ZWVwIDEwDQpwYXRjaGV3IGdpdGxhYi1waXBlbGluZS1jaGVjayAtcCB4ZW4t
cHJvamVjdC9wYXRjaGV3L3hlbg0KPT09IFRFU1QgU0NSSVBUIEVORCA9PT0N
Cg0Kd2FybmluZzogcmVkaXJlY3RpbmcgdG8gaHR0cHM6Ly9naXRsYWIuY29t
L3hlbi1wcm9qZWN0L3BhdGNoZXcveGVuLmdpdC8NCndhcm5pbmc6IHJlZGly
ZWN0aW5nIHRvIGh0dHBzOi8vZ2l0bGFiLmNvbS94ZW4tcHJvamVjdC9wYXRj
aGV3L3hlbi5naXQvDQpGcm9tIGh0dHBzOi8vZ2l0bGFiLmNvbS94ZW4tcHJv
amVjdC9wYXRjaGV3L3hlbg0KICogW25ldyB0YWddICAgICAgICAgICAgICAg
cGF0Y2hldy8yMDIxMDIxMDA5MjIxMS41MzM1OS0xLXJvZ2VyLnBhdUBjaXRy
aXguY29tIC0+IHBhdGNoZXcvMjAyMTAyMTAwOTIyMTEuNTMzNTktMS1yb2dl
ci5wYXVAY2l0cml4LmNvbQ0KU3dpdGNoZWQgdG8gYSBuZXcgYnJhbmNoICd0
ZXN0Jw0KNThiMzZiNzdkNSB4ODYvaXJxOiBzaW1wbGlmeSBsb29wIGluIHVu
bWFwX2RvbWFpbl9waXJxDQoNCj09PSBPVVRQVVQgQkVHSU4gPT09DQpbMjAy
MS0wMi0xMSAxMToxMDowN10gTG9va2luZyB1cCBwaXBlbGluZS4uLg0KWzIw
MjEtMDItMTEgMTE6MTA6MDddIEZvdW5kIHBpcGVsaW5lIDI1NDc2MDQzMzoN
Cg0KaHR0cHM6Ly9naXRsYWIuY29tL3hlbi1wcm9qZWN0L3BhdGNoZXcveGVu
Ly0vcGlwZWxpbmVzLzI1NDc2MDQzMw0KDQpbMjAyMS0wMi0xMSAxMToxMDow
N10gV2FpdGluZyBmb3IgcGlwZWxpbmUgdG8gZmluaXNoLi4uDQpbMjAyMS0w
Mi0xMSAxMToyNToxMl0gU3RpbGwgd2FpdGluZy4uLg0KWzIwMjEtMDItMTEg
MTE6NDA6MTddIFN0aWxsIHdhaXRpbmcuLi4NClsyMDIxLTAyLTExIDExOjU1
OjIxXSBTdGlsbCB3YWl0aW5nLi4uDQpbMjAyMS0wMi0xMSAxMjoxMDoyOV0g
U3RpbGwgd2FpdGluZy4uLg0KWzIwMjEtMDItMTEgMTI6MjU6MzVdIFN0aWxs
IHdhaXRpbmcuLi4NClsyMDIxLTAyLTExIDEyOjQwOjQwXSBTdGlsbCB3YWl0
aW5nLi4uDQpbMjAyMS0wMi0xMSAxMjo1NTo0NV0gU3RpbGwgd2FpdGluZy4u
Lg0KWzIwMjEtMDItMTEgMTM6MDM6NDhdIFBpcGVsaW5lIGZhaWxlZA0KWzIw
MjEtMDItMTEgMTM6MDM6NDhdIEpvYiAnYWxwaW5lLTMuMTItZ2NjLWRlYnVn
LWFybTY0JyBpbiBzdGFnZSAnYnVpbGQnIGlzIGZhaWxlZA0KWzIwMjEtMDIt
MTEgMTM6MDM6NDhdIEpvYiAnYWxwaW5lLTMuMTItZ2NjLWFybTY0JyBpbiBz
dGFnZSAnYnVpbGQnIGlzIGZhaWxlZA0KWzIwMjEtMDItMTEgMTM6MDM6NDhd
IEpvYiAncWVtdS1zbW9rZS14ODYtNjQtY2xhbmctcHZoJyBpbiBzdGFnZSAn
dGVzdCcgaXMgc2tpcHBlZA0KWzIwMjEtMDItMTEgMTM6MDM6NDhdIEpvYiAn
cWVtdS1zbW9rZS14ODYtNjQtZ2NjLXB2aCcgaW4gc3RhZ2UgJ3Rlc3QnIGlz
IHNraXBwZWQNClsyMDIxLTAyLTExIDEzOjAzOjQ4XSBKb2IgJ3FlbXUtc21v
a2UteDg2LTY0LWNsYW5nJyBpbiBzdGFnZSAndGVzdCcgaXMgc2tpcHBlZA0K
WzIwMjEtMDItMTEgMTM6MDM6NDhdIEpvYiAncWVtdS1zbW9rZS14ODYtNjQt
Z2NjJyBpbiBzdGFnZSAndGVzdCcgaXMgc2tpcHBlZA0KWzIwMjEtMDItMTEg
MTM6MDM6NDhdIEpvYiAncWVtdS1zbW9rZS1hcm02NC1nY2MnIGluIHN0YWdl
ICd0ZXN0JyBpcyBza2lwcGVkDQpbMjAyMS0wMi0xMSAxMzowMzo0OF0gSm9i
ICdxZW11LWFscGluZS1hcm02NC1nY2MnIGluIHN0YWdlICd0ZXN0JyBpcyBz
a2lwcGVkDQpbMjAyMS0wMi0xMSAxMzowMzo0OF0gSm9iICdidWlsZC1lYWNo
LWNvbW1pdC1nY2MnIGluIHN0YWdlICd0ZXN0JyBpcyBza2lwcGVkDQpbMjAy
MS0wMi0xMSAxMzowMzo0OF0gSm9iICdhbHBpbmUtMy4xMi1jbGFuZy1kZWJ1
ZycgaW4gc3RhZ2UgJ2J1aWxkJyBpcyBmYWlsZWQNClsyMDIxLTAyLTExIDEz
OjAzOjQ4XSBKb2IgJ2FscGluZS0zLjEyLWNsYW5nJyBpbiBzdGFnZSAnYnVp
bGQnIGlzIGZhaWxlZA0KWzIwMjEtMDItMTEgMTM6MDM6NDhdIEpvYiAnYWxw
aW5lLTMuMTItZ2NjLWRlYnVnJyBpbiBzdGFnZSAnYnVpbGQnIGlzIGZhaWxl
ZA0KWzIwMjEtMDItMTEgMTM6MDM6NDhdIEpvYiAnYWxwaW5lLTMuMTItZ2Nj
JyBpbiBzdGFnZSAnYnVpbGQnIGlzIGZhaWxlZA0KPT09IE9VVFBVVCBFTkQg
PT09DQoNClRlc3QgY29tbWFuZCBleGl0ZWQgd2l0aCBjb2RlOiAxDQo=

--8323329-1061101881-1613499727=:3234--

