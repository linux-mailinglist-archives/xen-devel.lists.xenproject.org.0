Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E66CA84E04
	for <lists+xen-devel@lfdr.de>; Thu, 10 Apr 2025 22:18:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.946274.1344226 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u2yLW-0007zD-OV; Thu, 10 Apr 2025 20:17:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 946274.1344226; Thu, 10 Apr 2025 20:17:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u2yLW-0007xN-Lk; Thu, 10 Apr 2025 20:17:58 +0000
Received: by outflank-mailman (input) for mailman id 946274;
 Thu, 10 Apr 2025 20:17:57 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=4FIM=W4=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1u2yLV-0007xG-8C
 for xen-devel@lists.xenproject.org; Thu, 10 Apr 2025 20:17:57 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e106bd2c-1648-11f0-9ffb-bf95429c2676;
 Thu, 10 Apr 2025 22:17:52 +0200 (CEST)
Received: from support.bugseng.com (support.bugseng.com [162.55.131.47])
 (Authenticated sender: nicola)
 by support.bugseng.com (Postfix) with ESMTPA id DC3C34EE074F;
 Thu, 10 Apr 2025 22:17:50 +0200 (CEST)
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
X-Inumbo-ID: e106bd2c-1648-11f0-9ffb-bf95429c2676
Authentication-Results: bugseng.com; arc=none smtp.remote-ip=162.55.131.47
ARC-Seal: i=1; d=bugseng.com; s=openarc; a=rsa-sha256; cv=none; t=1744316271;
	b=JauWh9nY+rMTFRletHs7bytwvUHfwYRPtNaXVxGeUxPkDeKq5UwqP7I5WdvPVBbFAmQ6
	 GBt2jcs2E3mPn3oIWi5qk5XYD3USgIj8PTh9qabXRHbY6ZcKlQmbfmVgDcJwNqgoG17tA
	 31rOGKvBKN8fGCjTDbSdbJaxyT/mT7wCcd7lPZqASUm5//+E8KYcg9n5BbW40Yg02TIAh
	 tUq7VcJoZ8if0/GvS9zmWCmCMAiT0Uvvpb2A+dmbnJwdpE9LbpVHEmoc/iy74N3xrpW9c
	 6vdlEWc3u2/dDMgExEynSn04rhLswXP3oDFeE/A/FpHLeMozIs6R4SokFR+8F4/JLRrQL
	 gB//HQDlglt3+QQdExYpYNoBogQyEnLFfJ+Ks4NOmNnrLqDBlnYyUO9Cmn67p2O+funR+
	 N1FIbfhJNwISbjvVoiyluJxcN/snhXue5i7L7BfSzBFfieGWpa+ZjSkwg4XDbC4QNIf88
	 s9WJ7xRu3H9VHPhED8ozelUg8ZpicPc/y42If/Hl+cOVxX3989LA5tmDBS8PNx7a3IoGF
	 ViFLV5zi7ejxnQKXNWQ7l7mYeGsb5j2DtduEoxFUKYsKGLMhH7w24b/M5IAg74hxdL6GL
	 dbKyja4Y8T6M6E+vaDfw8LLseGDdix3hOeRINQkgT/dpOMxsMcmEEcxXxC26px8=
ARC-Message-Signature: i=1; d=bugseng.com; s=openarc; a=rsa-sha256;
	c=relaxed/relaxed; t=1744316271;
	h=DKIM-Signature:MIME-Version:Date:From:To:Cc:Subject:In-Reply-To:
	 References:Message-ID:X-Sender:Organization:Content-Type:
	 Content-Transfer-Encoding;
	bh=vm2zriBhBMO1r00V0jmKJoxFv58Rj6rC8zzFXuem/nE=;
	b=uFzFOzP/q5o2ipfSRGwiHRgdOQNHPZUDL9VYy0vbfP3lbUK3rCRUyanbakrmdfEbICj8
	 LbGfBjUXnbPCcCdj1fIr2SmToWPVMnBI2auMv/F+dPB6HRAekVEH0b7zk2ghXA0i6FYBE
	 G3hF6CdvNP+5/RrheeCx1w4iVdh/JWzCr238U4DdAWT2MHkgmdlvhlLC8MGDMwMYDp9/M
	 RB33w7o7rRqcL9OENu5pftkFE9hVQYdUiEIzfYXbsS1JkdXTmuV0ftAzWtP7caZgyptei
	 fC8raaTb5Xwg1pvND7oZKHIdk5NY15214rsOmf8PZxJueqBHKL0iyfVszzReqwvcGhcYQ
	 Dz2q+VhHgQpRLhB7MTYbi38oAX8RHjh4aJ/IHWRR6hlAAZLwoQVm0ZcXwQEtu+vtTBVD1
	 GS0dviptSzzwUHDOxv5JtYDBA/+FXTu/l88Ww066EjJeGzcdMwd3fxV1NHCaYYh9mSKPQ
	 WPHm7OWzV4EZy/8cWxmPgQaNQAn1Hn5I6pqjpJdUvO+NZlO73dRbGk8IX8WUPoG6pNF81
	 mJ0unV7n+4rZaxdJ3iyBY0gmmUtUVCtfIsBZTjVThAm423fia09g1tHdmxddvpiZ3LCnX
	 zEUYhyWpIklCpr0wyGzQQ89mi7w8cAo2dIofhHOAlPYETi1BsRrG5kOrYAD+nno=
ARC-Authentication-Results: i=1; bugseng.com; arc=none smtp.remote-ip=162.55.131.47
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=bugseng.com; s=mail;
	t=1744316270; bh=YJxZFtsNZB5z7376VRdZK35cUGOopf2ptWmn2BIScGU=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=nIo0Uf27L6P0ZV5l7M+NXEaH6SWMnbP9OxBVuNhpTUA4hMgivrgUSL8ESX6O912ZO
	 i2tcaiV0Fs3gAYd2cpjdmxlUASlliuKxujCQ0/eNrdTvrWvoBrXPKlK9eJJElELBOf
	 QoMHjDX9iZ6LsvkdyCUeAk+oOsK+dK9mQjWtHSIevJLaFrzP8tVSceFTIA1ZmQJUHE
	 lz5zq8bukDFG1rGL64tpbACnKnRUKFPG3GIbgXIj4oInWjkq7RKj36vMTC/Q1YdmAc
	 5GNoY1rShHKtXXrWOXF26QzdD/bZAHh6LopclT0qX1jGaTRXs/LVkUVTh4OIhghwA8
	 JelxqnrV3mPBQ==
MIME-Version: 1.0
Date: Thu, 10 Apr 2025 22:17:50 +0200
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: xen-devel@lists.xenproject.org, sstabellini@kernel.org,
 michal.orzel@amd.com, xenia.ragiadakou@amd.com, ayan.kumar.halder@amd.com,
 consulting@bugseng.com, Doug Goldstein <cardoe@cardoe.com>
Subject: Re: [XEN PATCH] automation/eclair: Remove bespoke service B.UNEVALEFF
In-Reply-To: <b5f0ef7c-2f5d-49a2-b164-9f1e433b748a@citrix.com>
References: <a2b2d290e62bf6727769af91d3955bdd989ede3c.1744313419.git.nicola.vetrini@bugseng.com>
 <b5f0ef7c-2f5d-49a2-b164-9f1e433b748a@citrix.com>
Message-ID: <a39c5089ab9e1b5b97308bfd9728a162@bugseng.com>
X-Sender: nicola.vetrini@bugseng.com
Organization: BUGSENG s.r.l.
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit

On 2025-04-10 22:08, Andrew Cooper wrote:
> On 10/04/2025 8:32 pm, Nicola Vetrini wrote:
>> The service is now part of the updated ECLAIR runner, therefore
>> redefining will result in an error.
>> 
>> No functional change.
>> 
>> Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
> 
> Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>
> 
> Presumably this will be needed on all branches using Eclair ?
> 

Tes, that would allow to reuse the latest runner on those branches, 
which is probably the best course of action. Since they get 
(presumably?) less activity than staging, that might be held off until 
then, before any other backports.

I'm still waiting for the container image to finish copying to the other 
runner though, so you might experience some short-term breakage.

> ~Andrew

-- 
Nicola Vetrini, B.Sc.
Software Engineer
BUGSENG (https://bugseng.com)
LinkedIn: https://www.linkedin.com/in/nicola-vetrini-a42471253

