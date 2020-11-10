Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 819E12AD284
	for <lists+xen-devel@lfdr.de>; Tue, 10 Nov 2020 10:32:25 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.23115.49690 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kcQ0G-00057c-Iq; Tue, 10 Nov 2020 09:31:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 23115.49690; Tue, 10 Nov 2020 09:31:52 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kcQ0G-00057D-Fp; Tue, 10 Nov 2020 09:31:52 +0000
Received: by outflank-mailman (input) for mailman id 23115;
 Tue, 10 Nov 2020 09:31:51 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hJ2u=EQ=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1kcQ0F-000578-8H
 for xen-devel@lists.xenproject.org; Tue, 10 Nov 2020 09:31:51 +0000
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id f5b55895-8899-4afe-b034-9212727a23d7;
 Tue, 10 Nov 2020 09:31:50 +0000 (UTC)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=hJ2u=EQ=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
	id 1kcQ0F-000578-8H
	for xen-devel@lists.xenproject.org; Tue, 10 Nov 2020 09:31:51 +0000
X-Inumbo-ID: f5b55895-8899-4afe-b034-9212727a23d7
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id f5b55895-8899-4afe-b034-9212727a23d7;
	Tue, 10 Nov 2020 09:31:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1605000710;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=+T+QAPDe8sIL4BaSXGHfzPQAR/jSS1vNs6ir8MsEOBI=;
  b=E0Bg1kTj0zGoc/whWgdhGEW7KhA3mVoFOd9BJFCTwAf5q0GQLudZzK7D
   L68pF9lAXY5hXx2j/KLSnZiE9rjfWWK9IxsE8XD1oEbhxjoM2O+nM4bkN
   GsiNNQ955iCakbCEB7z+qpQ8stB/f6kdbcdvgj1vHEmP7vT3Ar+S1giTJ
   g=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: b4Oc9sYOlA7OPfP5KugD1DplPah5xUojux4VVDKaZ0ZjAH/H2P+a1OnXpOIAmMxuC9/9oxdxnD
 ZbcXrk1XmNjQj9lcgIA/H1UfrUzGE9g58jWoLJ235SKI/3OYPmKXCg9lHyLho5AVSfk8HM8N/S
 bkmbsbLSwXUeAloxWrS16nM0TejFb1jgPF10P505Fh8GziT/kiaF/1R4yLK6qm5mk80mV07j0y
 Aod0ora0yaVIm1+hGoWONTarc0fLBoA+kzu3R3Cw60ztR1Gfnm4v1qSCR85nnNU4Cnx/SuGu4O
 cjc=
X-SBRS: None
X-MesageID: 31066316
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.77,466,1596513600"; 
   d="scan'208";a="31066316"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=N0QdhoLJvdk+wrxWHoyWoNMEXn3MrKWWzwTVkCXtEjqE3pV0SFifYAcLVgc4CPt8qetmm/vgJtNBB1qdlLjOjip/nxNIgJt6toR2GzDfISsvkfwbtWKitUCSg+xAAmXT+XQt8OIpSlD60/mdN224cMKxlviFYaRijadSTDQ6LrB5C3FSOOxxa42c9TFvU1uBJ4Vco5e8hujq9jHEGzxxv0zrjt3nz+ilZU4Hvu8LC+Ot4u8LNyKMJMrt2tgbhhzocrSDFyXCZ505tmZ1bAZ3Fghzyu+QoeQFakjSaj4MwOE86oLpYWWUYNSEF2uKhxFk44t6L1az4xtk1xwzv61SZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CY6pf+Of+ze4JW9l14slxpn+ssZAYMU0Um5kRS/63n4=;
 b=ofX6xA/gznKZsZo0am89Je6RDV1VUE2UvPGLf3tkX+TsOaZw46ijS5c3MhIsFI4LH1OnwAxgzdgKjGJ/22wtEL6CsOryXb9gzX2Ha/3Jc+ceIu1VvAIkUHFawSV/KddE8oQw/HohWXzvHLJGZl1cnYgU2jWe2Hb4UO3dTaf99GyzOHrm+sGy1F/p+XYNxAxl0Pg6BFfuHPO2pdpiWEQTRCiwoBf1GN3XqcWibUGPSJHxopn5Uxr61I3SZ6HtrTGbnDtvFMDQ42ey8rKHcS1mV8ccR9oA0vGymQ+RXsyhqSmXpFJfHc3P2M05eHUYb0I6rR8zUVFU2yUCluS5/kP//Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CY6pf+Of+ze4JW9l14slxpn+ssZAYMU0Um5kRS/63n4=;
 b=rlybPT93ilqhQLDz3dly15inHoWyXOUxIosAmb3nqaJWB30hfDvRHLr6jf+fKI4JbqTVIfgz+C/RgYPtOOlWR7HnhPC1zCtxAlEnPb58norgyBxjZMvZ8U8dCU22Jo0MGv5QavNZHCA56+ycgksURvJnKmFzEIfnGY6fSDsSugk=
Date: Tue, 10 Nov 2020 10:31:42 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, "Andrew
 Cooper" <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH v3 5/7] x86: guard against straight-line speculation past
 RET
Message-ID: <20201110093142.hkufamaepn67gv43@Air-de-Roger>
References: <7065e2dc-f846-be79-1081-682c2295358c@suse.com>
 <80ceea17-958d-f409-5f39-9f353e780f5b@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <80ceea17-958d-f409-5f39-9f353e780f5b@suse.com>
X-ClientProxiedBy: LO3P265CA0007.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:bb::12) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e4dc072e-55a4-400b-91dd-08d8855b718b
X-MS-TrafficTypeDiagnostic: DM6PR03MB3833:
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM6PR03MB3833EFB775F0436FFE883CB78FE90@DM6PR03MB3833.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: LaDLTZvWUThqjiahwl7dJycw8HnBXlu4dxJtRySElHqnAOiiTQajRA6a3sDH3pIswxLCMYp5EZWmEMPp9CF04RnA3vx258Chd4UWCrLAn+AK6S00Ma6txJCWAHZ8RPnwKIiN/mjTHNlI9ks/3hIw9nxNNGV859ztMPJvYL2tFde3ziQMxQZ438QikGMI4f4sVMGdMO6uBfS2vbtkipAOT06y7OtIey7vyAmxPG37MHklJRTPKLc9aF6tb6Jh0IxlFRWBXoOws2mqFfICdhthxy8PbWAjRqAVPv4QPynT6//+cdmtwWl64hJuRRqiFe1eF/ANx77xbj+vFHgpu6Q3CA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(7916004)(346002)(376002)(396003)(366004)(39860400002)(136003)(478600001)(316002)(5660300002)(8936002)(85182001)(33716001)(6496006)(1076003)(9686003)(6486002)(54906003)(66946007)(86362001)(66476007)(2906002)(16526019)(956004)(26005)(186003)(6916009)(8676002)(66556008)(6666004)(4326008);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: KpoOW2kFXNq8MvuAUTtryC0NyNoCULgQBKv8edv5n3r4q7mzjrOibt24w22JQoHnbNfpyvGNYqOR48+mi85Ch/h+qQ3Ir9he0Z6KzoyvKtwMg/7CCQEPTVSeX0z3BJIgZSPYKO1WK8NsyOPNujberhUqRo/i73ZB4dUQuJAYtSS52j6UxOjfLqV0VZFqXZ7/B/w/Oj7rwYjGn+dQ/iGqX29/okjB8UdDZo185wT0JIUku5Hp7eSu1GBrDe/xMqeGIve3xyI6Pzv/b7cGlvojNarg2xj4siztXEUdd3MywkK51Wf54MwsjWNcwLB5Mk9tBgYUPo405Ov7xiZeoiSb7J0HrtB3GQgB2OiNkrgfIyd8DC4Ssd85MmMW7KLUN+0nF6BMyipVf+/Ym5kqsGyh5vzFsG45Q5oLojo6yw8j/0sG5MNIkMPcd8ZkAi0va5U1AV9hRIQmjksLyHY6OtJCaGA4jZCnaXp40+6ms/3dgE0PC6h+2uCZjD33mblkq1vkWyxMAjTl/H/NkhP0DRsfrTJj112/WR3wezXMNhyA7TLPuWBr+KRIh3qnJvX+T7aqhtmyB+tHlXYgfb8E6soO86JUE1Q1ERrNoMs3bo4FfWqrc7xpQCk+AyvgPwahZv7fj7zxIxRpZVBAzQI4m5W9+EGmWcvdBrpmhcNqUgmTw9HXIAiS09WGN2TlPLwsucZkSaiVTh8Ckeqk+8hZv4ZjqwrRz7pK7hVrLY2RFQ8XSX2aOZ56yrJY2RS7yUAEUywoifNkG+N63yEh4efrskK0T7oVimkPSVlB/jxSDEGpkfxHzbuiotVdazWZxWVNonp+5NgY1rjTXaE8HDUr6ArljmFeDF9h0Ucc5mfFRFT+CuaLQvqcJPP8knR93gva4PqGW5DCepLAHou+T89CyFhK0g==
X-MS-Exchange-CrossTenant-Network-Message-Id: e4dc072e-55a4-400b-91dd-08d8855b718b
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Nov 2020 09:31:46.7570
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UabrwSISwisq2+yQ4QLHW3EamLWIcRCaj57pBZG//EiIdtjUDx4korbj1ZBMwSLoUeuZBIA6d+7oz2l/kLoAcw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB3833
X-OriginatorOrg: citrix.com

On Fri, Oct 23, 2020 at 10:38:04AM +0200, Jan Beulich wrote:
> Under certain conditions CPUs can speculate into the instruction stream
> past a RET instruction. Guard against this just like 3b7dab93f240
> ("x86/spec-ctrl: Protect against CALL/JMP straight-line speculation")
> did - by inserting an "INT $3" insn. It's merely the mechanics of how to
> achieve this that differ: A set of macros gets introduced to post-
> process RET insns issued by the compiler (or living in assembly files).
> 
> Unfortunately for clang this requires further features their built-in
> assembler doesn't support: We need to be able to override insn mnemonics
> produced by the compiler (which may be impossible, if internally
> assembly mnemonics never get generated), and we want to use \(text)
> escaping / quoting in the auxiliary macro.

Could this have an option to enable/disable at build time?

FreeBSD will drop GNU as quite soon from base, and albeit it can be
installed as a package I would like to be able to build Xen using a
toolchain based on LLVM exclusively.

Thanks, Roger.

