Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 508AE42BC88
	for <lists+xen-devel@lfdr.de>; Wed, 13 Oct 2021 12:12:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.208188.364231 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mabEn-0000YW-NE; Wed, 13 Oct 2021 10:11:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 208188.364231; Wed, 13 Oct 2021 10:11:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mabEn-0000VT-JO; Wed, 13 Oct 2021 10:11:53 +0000
Received: by outflank-mailman (input) for mailman id 208188;
 Wed, 13 Oct 2021 10:11:52 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=EFKL=PB=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1mabEm-0000VN-D6
 for xen-devel@lists.xenproject.org; Wed, 13 Oct 2021 10:11:52 +0000
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id fb5baf72-2c0d-11ec-816a-12813bfff9fa;
 Wed, 13 Oct 2021 10:11:51 +0000 (UTC)
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
X-Inumbo-ID: fb5baf72-2c0d-11ec-816a-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1634119911;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=8hcJ2xs+Xfc93ZRhdwvT7V0M7cKCwISdZpqvce68kYo=;
  b=H/WzhDuMdnY68DsNw8pDncXBa731hyrYb9WQSEY+ACkEBIHDNDuCMPKj
   Ac9ROI3pR3VUAKP77YC6mXleYIf1c63V1gc2cO8+sn+eFWGEwd/mrIViZ
   e+GjqcLTi0fmxkoH2qmpfH824eBshCazxsDW9iSbfAE7HqDD2QMZpaQ4V
   8=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: Vy+HU4zE2w0pf6sAMdphTcAZ6/7YIHPYJjT8Y4cq6oDOsrgJ7Ax8btiR3kS109nUqOroFlVRGB
 qrr4SSAr2R77X3dhUWOf7dXKdhegNUcpL+GEooz/39bVbkM6l51Q4kjeg5ratic7tTworCWe+j
 SB36x9lHtVJOq3rKm2DddVQDorskwl4m33f1hxEfP7r9uxqND+XsdPs7SizdulTSZNXSpWmFf6
 w93uu5EgcgxQnzjINepq124mntwdQZcIvPyj2EKrC41zihhOD8M5cSA5idCBCPA22BRlskOftJ
 FH/EzZPzl9fqpSgy8Yoiuay9
X-SBRS: 5.1
X-MesageID: 55103390
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:vN7BF65hituwjMI0xW0/bQxRtP3BchMFZxGqfqrLsTDasY5as4F+v
 jMZUWiCP6uMamGmc4x+bYWx/B8HsMXUnNFrHFZqrXhmHi5G8cbLO4+Ufxz6V8+wwmwvb67FA
 +E2MISowBUcFyeEzvuV3zyIQUBUjclkfJKlYAL/En03FVIMpBsJ00o5wrdh29Uw2LBVPivW0
 T/Mi5yHULOa82Yc3lI8s8pvfzs24ZweEBtB1rAPTagjUG32zhH5P7pGTU2FFFPqQ5E8IwKPb
 72rIIdVXI/u10xF5tuNyt4Xe6CRK1LYFVDmZnF+A8BOjvXez8CbP2lS2Pc0MC9qZzu1c99Z+
 v8SnsC2ChYSOpbIkecZaF5YKi9BFPgTkFPHCSDXXc27ykTHdz3nwul0DVFwNoodkgp1KTgQr
 7pCcmlLN03dwbLtqF64YrAEasALNs7kMZlZonh95TrYEewnUdbIRKCiCdpwgWpp3psVTK62i
 8wxbjd2UTudUTp2M3Q3CZdlncungl7UbGgNwL6SjfVuuDWCpOBr65D1OcfRUsyHQ4NShEnwj
 mDM8nn9AxoaHMeC0jfD+XWp7sfmhz/2XbU3BbKx9/N0qFCLz2lVAxoTPXO8pfS6kUe4V8hoI
 koY4Dc1raMy+UqoSfHwRxS95nWDu3Y0QdNQDul88wCLxar86hycQGMDS1ZpYtE8qNU/QzBs0
 1aThs7oHhRmqrjTQnWYnp+WsDezNC49PWIEIygeQmMt89Tl5Y0+kB/LZtJiC7KuyM34Hynqx
 DKHpzR4gK8c5eYC0amhpwif2xqjo5HISkg+4QC/dnyi6gR1dYu0fbui4FLQ7etDBIuBR1zHt
 38B8+CZ6O0NFpiLmDa6XPQWHLqp6vCGNxXRmVdqWZIm8lyF4GW/dIpd5DV/IkZBMcsefzLtJ
 kjJtmtsCIR7ZSXwK/UtOsToVppsnfOI+cnZuu78XPARScR3Nx68+BpqbE2U5CftqUYTuPRqU
 XuESvqEAXEfAKVh6TO5QeYBzLMmrhwDKXPvqYPTlEv/j+LPDJKBYfJcagHWN7FmhE+RiFyNq
 443Ciec9/lIvAQSiAHs+okPMUtCE3E/AZ3nwyC8Xr/eelQ4cI3N5vm4/F/AR2CHt/gL/gsr1
 ivkMqO99LYZrSaYQeltQioyAI4Dpb4l8RoG0dUEZD5EIUQLb4e197s4fJAqZ7Qh/+EL5acqF
 KVdJZnaWq4TEWivF9EhgX/V99MKmPOD31PmAsZYSGJnI84Iq/Lhq7cIgTcDBAFRV3Hq5KPSU
 pWr1x/BQIpreuiRJJ2+VR5b9Hvo5SJ1sLsrByPge4APEG2xoNkCA3Gg1ZcffpBTQSgvMxPHj
 m569z9D/rKTy2L0mfGU7Z25Q3CBSrMkQBUBRTWHtN5b90DypwKe/GOJa87RFRj1X2Lo4qSyI
 +JTyvD3Kvocm1hW9YF7Ft5WIWgWuLMDfpdWkVZpGmvldVOuBu8yK3WKx5AX5KZM2qVYqU29X
 UfWootWPrCAOcXEFl8NJVV6MrTfhK9MwjSCv+4oJEja5TNs+ObVW0tlIBTR2jdWK6F4Md15z
 L556tIW8QG2ljEjLs2C0nJP722JI3FZC/cnu5gWDZXFkA0uzl0eM5XQBjWvuMOEaslWM1lsK
 TiR3fKQi7NZz0vEUnwyCXmSgrYN2cVQ4EhHlQZQKU6Il9zJgu4M8CdQqTlnHB5Iyhhn0v5oP
 jQ5PUNCOqjTrSxjg9JOXj7wFlgZVgGZ4EH413AAiHbdExuzTmXIIWAwZbSN8UQe/z4OdzRX5
 ujFmmPsUDKsd8DtxCoiH0VirqW7H9B28wTDnuGhHtiEQMZmMWa03Pf2aDpasQbjDOMwmFbD9
 Ltj8+tHYKHmMTId/v8gAI6A2LVMEB2JKQSumx26EH/lyY0ERAyP5A==
IronPort-HdrOrdr: A9a23:epU4rK5OScQVGsqqsgPXwVWBI+orL9Y04lQ7vn2ZFiY6TiXIra
 +TdaoguSMc6AxwZJkh8erwXpVoZUmsiKKdgLNhR4tKOTOGhILGFvAG0WKP+UyFJ8S6zJ8g6U
 4CSdkONDSTNykDsS+S2mDReLxMsbr3ktHZuQ6d9QYXcegDUdAf0+4TMHfjLqQZfnggOXJvf6
 Dsmfav6gDQNEg/X4CePD0oTuLDr9rEmNbPZgMHPQcu7E2rgSmz4LD3PhCE1lNGOgk/josKwC
 zgqUjU96+ju/a0xlv10HLS1Y1fnJ/ExsFYDMKBp8AJInHHixquZq5mR7qe1QpF7N2H2RIPqp
 3hsh0gN8N85zf4eXy0mwLk303a3DMn+xbZuBelqEqmhfa8aCMxCsJHi44cWADe8VAcsNZ117
 8O936FtrJMZCmw3BjV1pztbVVHh0C0qX0tnao4lHpES7YTb7dXsMg24F5VKpEdByj3gbpXUd
 WGNPuspsq+TGnqKkww5gJUsZiRtzUIb1m7q3E5y4+oO2M8pgE/86MarPZv10vouqhNDaWtSo
 z/Q9BVfYp1P70rhJRGdZE8qPuMex/wqC33QRevyHTcZeo60iH22tTKCItc3pDcRHVP9upqpK
 j8
X-IronPort-AV: E=Sophos;i="5.85,370,1624334400"; 
   d="scan'208";a="55103390"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZfeOsFp3YLNGF1Pz7yTn+3ribuQkF90wsMQMshTuXYG0OEQskXQRQolxirPxO7aZqQVH04I7OYIxoEUXSGVKj/sOVI40IAPKQ95nEXzrSFdzDioujGi1bnbVtaHkGXEiyFgATd5QqdAYmakxLBmdPKvbt9M5mLT3J8CwW5YASOEwHuEx0ExaSaK3olo+lFWsLYJleRHiDH9kixX7rj6UEEMr6PPraOYBiCpm//aasOMakaG8OABXe9qgJOigPWKNhEqoYJ9QBkQ+7FaVMbARZOAcKnJgQ7bGi8bU2AS6zvegmx+sIQph7ZEI/yDxtJ7PeHXD8fJpXdK61nh3ts0RFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lq0ic0EKu9fMVWxvUOeXaI3hJ6HsrCauPoh96HDl8is=;
 b=cjhwmvSJLTfg7gxiEiB93+IItfSSfFW98kmB88utgjNKGwv+lWtZy41S4IYpddRB9Oq+dgWIvelHtYXfZpvBFdzy2Be4ycebYqyVXv4ynEBXWUHYNKTgCIoodkmJOm4JxTTprTPi9ipa6fbYx/AwMmgNUltJfEAKBo+nnsRSEj4RMRn6r0C3Zx06R3lqH3smojycHCBzeZ4KyELfv1sTBWl1DMuq8hUVm9HZMROC23LaTnG9nnRK1aMWdqO3Rjhktpvb97oWg/Vgsvb/ta6okfnvidmeaBhamRqSybz25aeySeREw7nLEJbzbY3t4xfbSUJHo5pzSl7zY973MUKjFA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lq0ic0EKu9fMVWxvUOeXaI3hJ6HsrCauPoh96HDl8is=;
 b=XF8GdG9nAeFDJnziXNwIID1Sb/i0m53Ud6ovkZyV3hZC1PTsvjDekgiwhLY37+FGOMz9wPc91U2S9gca0AAbn3NVJcBtelNj8f/KmHk9D9KF4PqSCWXN/Jw2DnIVlKw9kXM7Jj0g4KbcucnUMKAmiLKITFGjUu7YwF3pnnxgFjU=
Date: Wed, 13 Oct 2021 12:11:09 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Oleksandr Andrushchenko <andr2000@gmail.com>
CC: <xen-devel@lists.xenproject.org>, <julien@xen.org>,
	<sstabellini@kernel.org>, <oleksandr_tyshchenko@epam.com>,
	<volodymyr_babchuk@epam.com>, <Artem_Mygaiev@epam.com>, <jbeulich@suse.com>,
	<andrew.cooper3@citrix.com>, <george.dunlap@citrix.com>, <paul@xen.org>,
	<bertrand.marquis@arm.com>, <rahul.singh@arm.com>, Oleksandr Andrushchenko
	<oleksandr_andrushchenko@epam.com>
Subject: Re: [PATCH v5 08/10] xen/arm: Setup MMIO range trap handlers for
 hardware domain
Message-ID: <YWawvYGqIe3DwZfI@MacBook-Air-de-Roger.local>
References: <20211008055535.337436-1-andr2000@gmail.com>
 <20211008055535.337436-9-andr2000@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20211008055535.337436-9-andr2000@gmail.com>
X-ClientProxiedBy: LO4P123CA0300.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:196::17) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 40ef440a-88f8-48ca-146e-08d98e31ca9f
X-MS-TrafficTypeDiagnostic: DM6PR03MB4604:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM6PR03MB4604841A21A86670C9A5CA218FB79@DM6PR03MB4604.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2803;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: gowRp2aUrR7qvKe/hRQLlvCtAAsPE3G9HK3AUngYcLlZrd+3Wpc1ojzeM9k0N6FemlEEvudvNZ6FbC/rfIUwSjkX1dOrEOyObsPGWKrCkkTZNRvdCijVKaWAO/r0+O4XivX0GLSEcRLwwenW3i96RhwlJQ0+5l7bZBdlhBoNK/bAG+VhIlJ+TvRE9+ZD5S5S6mYfNRBCKLKu/CPhdiqVMsupOMKn1AKduqWi4Lcd71ujUfyL2oZRAl0IMo+fK7/D3XkIVel+XNAHJyzco4y0gTA0bn105VuJ2PDqWBXlBCmFOt3x731RW6uu+6fXW+CSz4P6RNEX4SMdm3YRS7xIrLpV1qrLsE7szCPdIixzE/ObeytkKP3SQWFydMfahyQX2fy3zkuT7Wxzqz+qySlOqo5+pHSFdyHxqPjsRGZpv1GFxDFn98q5mrcJEPe4u3SV85i25m2L//woe/7vkB8wbLIqThYJGjEmKIdF5bzYd9Y2ijL5QAmc1pB0QVPLCxzH0xKhLLhjpl0HCojXFzgNrW9do6XVLFRBj42MkCXA42E5a5MXkkahYAm/+4Cg47V6t3FRBZGmsLID58pCvo5L9SXyj8ta+biYYTtuWMypQHi6G+Tf7lYGRmIP/UT2opp28sSvOC/eOsQecoL9NCPOnA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(4326008)(8936002)(6916009)(508600001)(6486002)(66476007)(66556008)(8676002)(6496006)(2906002)(316002)(85182001)(5660300002)(9686003)(82960400001)(83380400001)(66946007)(956004)(86362001)(7416002)(186003)(38100700002)(26005)(6666004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?anlTU2tqYzdoTXhLM2hqalQ3U3h1TFd2VXJhejNzT2h2aFBMaTN5MlB4em5l?=
 =?utf-8?B?ZVp3M0pMa21oMm5IUmxpRXFUZHU2Yzl5bU1oRzRGL2dYdE5KLytVamFMVHVu?=
 =?utf-8?B?SGttSE44K0JCYytFTzRaY2Z5R0xiampSVm9aWVNsREhJTGdDVTRzVmNQRFM0?=
 =?utf-8?B?clhQLys2VThEQWQwZDgyelB4RmxaNWRKcmMzMEpqUXVkaHFqZkJOL1RiVWtM?=
 =?utf-8?B?UEo5OUI0RjZUVHZvOFphaWJtR2pic2MveGhGeGpXcXcyUGtjWDRWeEt3TDNs?=
 =?utf-8?B?OHNaNnRoRGEvMFFyVEJzQWJBeEx0akRGQ1hTRUMzWDVSYmdaaTN6dnJTVmJK?=
 =?utf-8?B?aXQxUlFYVWpKNEI1bUE0b3Z2WnVKVi9mTW5KZ0JLd1cxVW5qYmgxTlRRejNp?=
 =?utf-8?B?MjdhV1psN2YwZEZFWE4zb0owY3dmcU5vRHJ5ZFByYkNtekQ4MUFSamxwZjhV?=
 =?utf-8?B?UkxCTmdwS0dGWnhZVFI3Y1lDWnNQYkNSMVJnSEJDN1o1M3RtM2VEcG5PZ1Rz?=
 =?utf-8?B?dWhGMU9CTTFVRmFLZ3U1ajkxR25VUlFoQ0lwVVdqMFVCSU1PdEUxQzdvUnlH?=
 =?utf-8?B?WVJDcGFyeU94Rlh2ZkFpSUtOT0V0SkFBQWE5UFhybStCVVNkeWR6cTBWWEZ6?=
 =?utf-8?B?WWhXUW9CeWtVdkJmbEppZGpQUjQrQjRhTEg1LzQ3WG0wWjNtVndXeUI4ZlRi?=
 =?utf-8?B?b1dLQ1haQVBEOFlZRTBrTlJPWEFBc2EvSE1xdTNKbG5icCsyeG1jOHIyajVG?=
 =?utf-8?B?cEwxK1UyTjQvZFBjRDVBbkFwZkdCU2pVNUFNNlhmcnR6RDJjcXZGMmRPbmdu?=
 =?utf-8?B?a3BhL1lraHRETUpONjlYbjR3cm1lR2t1RldaTTFhMTRYYzcrUkQzejRwQUw0?=
 =?utf-8?B?a29XbzNuaGhMVktpVDhqVThrWlNITGdtSnNpSGhGL3pscWRGYzhmcndGRHBS?=
 =?utf-8?B?Sm42Sjg4cVVtbjJFQTJyT2tkK21ydm9XUnRZZk5HTGZXbHVFajFiNHhteVRE?=
 =?utf-8?B?UE5Fbnl4OG9VUktqRHpwbHdNMkVlTUdLSHBoeDlQeEFUTHpWMi9LM3VOWmVq?=
 =?utf-8?B?N2lmRzNXcTAzeFhBS09DUmFJUXQrUEg3amFnTXBpc2M0YWtxWk8wUjhwdkpZ?=
 =?utf-8?B?cWd3SEFGK1ExU3N6ZS9UbTN0cUVkK2NRcWRnSm1LeWIyZkh2Qk15QStUOGVG?=
 =?utf-8?B?UE5rdGU0R2NjWXJlT0ZxYlQ5UXpZR05KOUlSb1VpNXJrNzF4MGZrSnlKcFZa?=
 =?utf-8?B?NGp4OGwvVTE5eklnVHFBMlEvQVNDcTVOSjZqY3ZjY1djUHlWUk1HYWtHaTFs?=
 =?utf-8?B?RWFWd2RlTGlyUjh6ZGFhSlZxZzRUc00xM0NTYXdKdkgwcG9sRVZ3RHVjNXNN?=
 =?utf-8?B?WWJhNi9pM2hMYlVDYkZ1eVFQQ0crL3ZwaTNZS2trdTg2Ni9tVlhsVzdBREJy?=
 =?utf-8?B?RzIvRzJqSXZ2Nzc0SGliTzAwUEIrVk9xb2tBVUx2TWZkMnFsaWpUVVpiMmJr?=
 =?utf-8?B?WFRLdUQwZXpCMHk4TWg5NkRBL1pTd3RKbmM2ekNNcVRUTDg0SjBOeG42K0VD?=
 =?utf-8?B?MGZNWEFLSnIxM1JkR3JCdmFWN3VMQ2RIWDhhTmJFcGJrZXBhQnVUYjJRR0RH?=
 =?utf-8?B?ZWQzUUZDUEc4ZzNiNzZOSWk2TU9Obm9tQ2FzelNyai9EYmxOQkNsTWxmYXVt?=
 =?utf-8?B?UUVSVSt3V3ZPbEs3UVprbDhCakNFaW1ZZVErTktGbVAyUVR2aXRyWHZ2bUNm?=
 =?utf-8?Q?dMcxWjpuYIQqDct6713nFXBbNuv4iYGhZ/71UP2?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 40ef440a-88f8-48ca-146e-08d98e31ca9f
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Oct 2021 10:11:15.5193
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oNz893k3Kx5QCSRtAUzrMdoCHOb6YFW4kK9hamrZcMZK8ek9e+uJtTeiwB/QP1lQWvxgcu5zO1K6bZW+NOBwWw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB4604
X-OriginatorOrg: citrix.com

On Fri, Oct 08, 2021 at 08:55:33AM +0300, Oleksandr Andrushchenko wrote:
> From: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
> 
> In order for vPCI to work it needs to maintain guest and hardware
> domain's views of the configuration space. For example, BARs and
> COMMAND registers require emulation for guests and the guest view
> of the registers needs to be in sync with the real contents of the
> relevant registers. For that ECAM address space needs to also be
> trapped for the hardware domain, so we need to implement PCI host
> bridge specific callbacks to properly setup MMIO handlers for those
> ranges depending on particular host bridge implementation.
> 
> Signed-off-by: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
> Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
> Reviewed-by: Rahul Singh <rahul.singh@arm.com>
> Tested-by: Rahul Singh <rahul.singh@arm.com>
> ---
> Since v3:
> - fixed comment formatting
> Since v2:
> - removed unneeded assignment (count = 0)
> - removed unneeded header inclusion
> - update commit message
> Since v1:
>  - Dynamically calculate the number of MMIO handlers required for vPCI
>    and update the total number accordingly
>  - s/clb/cb
>  - Do not introduce a new callback for MMIO handler setup
> ---
>  xen/arch/arm/domain.c              |  2 ++
>  xen/arch/arm/pci/pci-host-common.c | 28 ++++++++++++++++++++++++
>  xen/arch/arm/vpci.c                | 34 ++++++++++++++++++++++++++++++
>  xen/arch/arm/vpci.h                |  6 ++++++
>  xen/include/asm-arm/pci.h          |  5 +++++
>  5 files changed, 75 insertions(+)
> 
> diff --git a/xen/arch/arm/domain.c b/xen/arch/arm/domain.c
> index 79012bf77757..fa6fcc5e467c 100644
> --- a/xen/arch/arm/domain.c
> +++ b/xen/arch/arm/domain.c
> @@ -733,6 +733,8 @@ int arch_domain_create(struct domain *d,
>      if ( (rc = domain_vgic_register(d, &count)) != 0 )
>          goto fail;
>  
> +    count += domain_vpci_get_num_mmio_handlers(d);
> +
>      if ( (rc = domain_io_init(d, count + MAX_IO_HANDLER)) != 0 )

IMO it might be better to convert the fixed array into a linked list,
I guess this made sense when Arm had a very limited number of mmio
trap handlers, but having to do all this accounting seems quite
tedious every time you want to add new handlers.

>          goto fail;
>  
> diff --git a/xen/arch/arm/pci/pci-host-common.c b/xen/arch/arm/pci/pci-host-common.c
> index 592c01aae5bb..1eb4daa87365 100644
> --- a/xen/arch/arm/pci/pci-host-common.c
> +++ b/xen/arch/arm/pci/pci-host-common.c
> @@ -292,6 +292,34 @@ struct dt_device_node *pci_find_host_bridge_node(struct device *dev)
>      }
>      return bridge->dt_node;
>  }
> +
> +int pci_host_iterate_bridges(struct domain *d,
> +                             int (*cb)(struct domain *d,
> +                                       struct pci_host_bridge *bridge))
> +{
> +    struct pci_host_bridge *bridge;
> +    int err;
> +
> +    list_for_each_entry( bridge, &pci_host_bridges, node )
> +    {
> +        err = cb(d, bridge);
> +        if ( err )
> +            return err;
> +    }
> +    return 0;
> +}
> +
> +int pci_host_get_num_bridges(void)
> +{
> +    struct pci_host_bridge *bridge;
> +    int count = 0;

unsigned int for both the local variable and the return type.

> +
> +    list_for_each_entry( bridge, &pci_host_bridges, node )
> +        count++;
> +
> +    return count;
> +}
> +
>  /*
>   * Local variables:
>   * mode: C
> diff --git a/xen/arch/arm/vpci.c b/xen/arch/arm/vpci.c
> index 76c12b92814f..6e179cd3010b 100644
> --- a/xen/arch/arm/vpci.c
> +++ b/xen/arch/arm/vpci.c
> @@ -80,17 +80,51 @@ static const struct mmio_handler_ops vpci_mmio_handler = {
>      .write = vpci_mmio_write,
>  };
>  
> +static int vpci_setup_mmio_handler(struct domain *d,
> +                                   struct pci_host_bridge *bridge)
> +{
> +    struct pci_config_window *cfg = bridge->cfg;
> +
> +    register_mmio_handler(d, &vpci_mmio_handler,
> +                          cfg->phys_addr, cfg->size, NULL);

I'm confused here, don't you need to use a slightly different handler
for dom0 so that you can differentiate between the segments of the
host bridges?

AFAICT the translation done by vpci_mmio_handler using MMCFG_BDF
always assume segment 0.

> +    return 0;
> +}
> +
>  int domain_vpci_init(struct domain *d)
>  {
>      if ( !has_vpci(d) )
>          return 0;
>  
> +    if ( is_hardware_domain(d) )
> +        return pci_host_iterate_bridges(d, vpci_setup_mmio_handler);
> +
> +    /* Guest domains use what is programmed in their device tree. */
>      register_mmio_handler(d, &vpci_mmio_handler,
>                            GUEST_VPCI_ECAM_BASE, GUEST_VPCI_ECAM_SIZE, NULL);
>  
>      return 0;
>  }
>  
> +int domain_vpci_get_num_mmio_handlers(struct domain *d)
> +{
> +    int count;

unsigned for both types.

> +
> +    if ( is_hardware_domain(d) )
> +        /* For each PCI host bridge's configuration space. */
> +        count = pci_host_get_num_bridges();

There's no need to trap MSI-X Table/PBA accesses for dom0 I assume?

> +    else
> +        /*
> +         * VPCI_MSIX_MEM_NUM handlers for MSI-X tables per each PCI device
> +         * being passed through. Maximum number of supported devices
> +         * is 32 as virtual bus topology emulates the devices as embedded
> +         * endpoints.
> +         * +1 for a single emulated host bridge's configuration space.
> +         */
> +        count = VPCI_MSIX_MEM_NUM * 32 + 1;

There's a single MSI-X mmio handler that deals with both PBA and MSIX
tables, so I don't see the need to * VPCI_MSIX_MEM_NUM.

Thanks, Roger.

