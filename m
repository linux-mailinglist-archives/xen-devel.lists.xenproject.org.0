Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9ED442AF369
	for <lists+xen-devel@lfdr.de>; Wed, 11 Nov 2020 15:21:40 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.24859.52316 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kcqzx-0000Hk-Kl; Wed, 11 Nov 2020 14:21:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 24859.52316; Wed, 11 Nov 2020 14:21:21 +0000
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
	id 1kcqzx-0000HL-H8; Wed, 11 Nov 2020 14:21:21 +0000
Received: by outflank-mailman (input) for mailman id 24859;
 Wed, 11 Nov 2020 14:21:20 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=nKbA=ER=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1kcqzw-0000HG-AN
 for xen-devel@lists.xenproject.org; Wed, 11 Nov 2020 14:21:20 +0000
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 80ecf6f6-b88a-4a52-be21-a36ed6aad28f;
 Wed, 11 Nov 2020 14:21:18 +0000 (UTC)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=nKbA=ER=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
	id 1kcqzw-0000HG-AN
	for xen-devel@lists.xenproject.org; Wed, 11 Nov 2020 14:21:20 +0000
X-Inumbo-ID: 80ecf6f6-b88a-4a52-be21-a36ed6aad28f
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id 80ecf6f6-b88a-4a52-be21-a36ed6aad28f;
	Wed, 11 Nov 2020 14:21:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1605104478;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=Qyf4EkU3HoZ4llq6faj93sshsSNbe4kG0PN62CehT4o=;
  b=ZM4nfzlannVfQmMPbO89CICQbZ37m0p/TEMDLJoKHLpSkkErBP8obJmo
   zTS9iYahgZWuW/Xl3gQ0WwjdPAWYCm3IOopMTAUmKlCkgKE7bGdukdPng
   Ie3CDeNtGIrN7VVuvYPB2TWNjombuxzV+lrnAGpKL9GkG45y8qYNmzqBK
   8=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: qhiZWmqMcktUGflrEsoQv5rNE7TL6FUVRRe3KjwCkMkv9xIFld5SguRitlv0gM7ad/BUvV+H8s
 gR5jitW1eKq5xdi7wBuqknORRhqZyaFu1LGrUwkOKTmzU+swncgBhBdATTnuofvxHqANf/S1Ib
 7u9t4i8mRu9Qb6oaABLWtUM4Ku477rcZDlQixFe6mgpW89Hd3sf/wG2xS8x8tFLrv9TkyOznPT
 dEuXe8SDUDe6AsqF+5gZ6OrLxKtF6Ct36JajuyzROACoUF4Y0Khaepo0DY7DtKKShQ28URyqO9
 Ew4=
X-SBRS: None
X-MesageID: 30953259
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.77,469,1596513600"; 
   d="scan'208";a="30953259"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oFaQkV0V9i+gZ2jMmjOK+P3QOJvk/vrPuKG9rHL+vCDIxaJEN5SB7yw6rEDOtJijewriRJCfRX74ldx/OQOEUVCmitvyf/pjyI7kSiH+15j7VY2QMl6CgckaEC8t7C2MUKyYatrnQR5svW2fmpk0GjyhIZb7LjDiOCgBW6li1i1XTsqbUzmXO0fHh0fYTCDYRU3rssmB0kT9z9pNrYSx3Od+ql43hcSdZBd6Ivuwbd9NJgYSrKefdAgC0Ql7FSu9hWRoy8DOgXWXn+FA39OX25rj4wFvOneRx971JhgTLghIdVGSitgWpk1KF8K/YvgY/m7xwRm0Kg2mnkKGokFj3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zIuRIBYUodhU7YjxRg4obkkTosdRqYr++JOcSlXvKcs=;
 b=nUZ/xWzB5cKdsdMkSGmJhw0elw0OO8hhjfTyhZHgfBknK5c9/mnFUlONI8YuT6eDEPIzLg6PQfeBfhhgmd7T7utupLp7iorQ6ODsWEkez2NxPNAn0CeqnvGXKmxsMQz65z1MNLYtF07nxlJIGIgw5vlbYu7G/+JMyzXKtAVtwC0/rVjtuGf9MO5MMhHxenRwH2Ke9cQgPP3jp4RFzOTVLegIYxGACVF2Vtkhl20SNw1tAgzYDI6pQZ5NNkAySh6XApMnc67ehkJUrYvDFXVzS9Ft6RvMuaFzz3xikebPhelR7V22BAV3OGBQz03iBNHT0Xg+VfzgyqU55J1WCcZ6LQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zIuRIBYUodhU7YjxRg4obkkTosdRqYr++JOcSlXvKcs=;
 b=qNhk6YiWekkV1kE63iOtndnDIo3kFn4HX5wv/QKb42KK3S5ctk67DK+warurH8eouUVQGjwFE41lkNA8ezyf4Eq2GeHui8D6O0V/HHlA9SfxGk2fHHeUCqN/jpYpeSaowt0cjtaP+pEZS0SFrTfxI1HgRLjIEjvPivQh/+EOkrU=
Date: Wed, 11 Nov 2020 15:19:50 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, "Andrew
 Cooper" <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH v3 5/7] x86: guard against straight-line speculation past
 RET
Message-ID: <20201111141950.3a4blschvpcyexw4@Air-de-Roger>
References: <7065e2dc-f846-be79-1081-682c2295358c@suse.com>
 <80ceea17-958d-f409-5f39-9f353e780f5b@suse.com>
 <20201111111504.r4k7a53spsy7pzjq@Air-de-Roger>
 <8ab3658f-8b69-455e-74b3-462f89f1cfe4@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <8ab3658f-8b69-455e-74b3-462f89f1cfe4@suse.com>
X-ClientProxiedBy: LO2P123CA0010.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:a6::22) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b4fe150e-3c0b-411c-3ac3-08d8864cdc6e
X-MS-TrafficTypeDiagnostic: DM6PR03MB4297:
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM6PR03MB4297CEA839AF69BAE5B557AC8FE80@DM6PR03MB4297.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: f5S+6H3rGgGVf/eUGfj9ftjkq/tP6fenwWz5tgJtc1+S6dVQhX7TPzYWJ31AQVck7/qaWgmWU+dMAj6p0JFSShmlM3vE8D0xoQx6Eb0KB3o3gWHJL5/kQtV1vbSfAuK1tbN2XLkSVepZrQAirv68NLZ5p6MQiU/47WFSm59FkXO4e4wPpxcgiOkl4A8xUymCKYI/+WOx3U2cd50PpHcGYafUY7paOGdhlv1FR4sgwHZqAeUueMRY2radeG0DN7X1Xzylzv+buz0tJ+kswXA8X1JS6VZpQFknMw9klg+LDPjBwdoZ+vqgZJ+xDgIWBb+himXXjmRmgJJmTrQU5J3lAj1oqzXZpk1mO3gI2udEUOxN4IVIZaFRFIOHiocjLyBuUh4Su5qgwGVjh5g8Y8a08g==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(7916004)(136003)(39860400002)(376002)(396003)(366004)(346002)(16526019)(2906002)(956004)(6666004)(54906003)(53546011)(6496006)(316002)(8936002)(9686003)(8676002)(83380400001)(4326008)(86362001)(186003)(966005)(33716001)(5660300002)(6916009)(66946007)(1076003)(85182001)(26005)(6486002)(478600001)(66476007)(66556008);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: uUHjHEeso467z8KAdMFXICN8U2UGIjYaQPMJjkGt0hEIVFxyEub5QnDr8hdnC3ZGpgRqV5FYYmokKOzTy5BMfkFWwYol8XOoUvAMWd7Uo9Bw+PE1MV1pBszL56nEfWPReJZEhMGu5Ke9Dq233tcEwvQhC7cv7gp4migDSna3cySpRsxrL67CuK9SSInDqsE3RT4nAPZMASuoifc9HvMXgmI7j81mpfUCK2Tx+UemElfqoZf8UMYsDH861XIbgOP/O/P0tcHiPJg4maAXWClH5+n6bXexdjXMMvHv+8VN4J9xEpgve9iASjlvTt+m9ujG6yM96kzXJKtbxSEjezQxmidbGgSShmZlafJqBIiXT4Jh4DkSzUvNptwUE5F9xqLbSId6c2OS1k/sOMiG3BsN7SHkPTeS41N+3fEReUBDPZ0mOzOqjdeYGdNXbCA8oOGmw5zKf20Bk1XObWFbfdvovwSxZ2H3I4rzMoun0rSnJICTnQb4/ABtIMFDesfcjtZKmcfw09L5GOTq69sRnU53R29flkyuj1Gi5zc4jomF66JxMtMxeCt3hDU2enuOeZRwcOJB8Whk3CpxA6MKUGKWv3AkTUP9teUdOsi7loupWmadVgqVxHHb6gAoWI8wtK4fbGaScX2c39DnVvLI/ojo7VRlBXXssnWqYxXTfi/PFtTGIJasPoY6JV7aQJkbkINSYYMV/quVcigJ4p24ghEGvlEUfkLkTEqW4w1pPrEa06fsa7ZlTc7eHzW5rZa8JagRIwYKjoQ/YVEbD9U9DcOszKYcTOi7xWZw0nuqJrCYc4cD1o36Rp+bLa9Y4BoiX1DQE+8lVGo3qrwbFs6DL3gXFgTXtdPmxb74Js3+3mgv1DlF3DeLuqCAPenSnu5bac7MjrEb1+97g80HSdOM3NjU5A==
X-MS-Exchange-CrossTenant-Network-Message-Id: b4fe150e-3c0b-411c-3ac3-08d8864cdc6e
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2020 14:19:54.7967
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FVa/XDJFkn1ETrUZJGRJ/IsNbOwz6tHgAt7/7kgb3EfILqJGyvlYgpCJzt/qiPGHz2AAjU4XThJ2kSuQ5ZukOQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB4297
X-OriginatorOrg: citrix.com

On Wed, Nov 11, 2020 at 02:33:34PM +0100, Jan Beulich wrote:
> On 11.11.2020 12:15, Roger Pau Monné wrote:
> > On Fri, Oct 23, 2020 at 10:38:04AM +0200, Jan Beulich wrote:
> >> Under certain conditions CPUs can speculate into the instruction stream
> >> past a RET instruction. Guard against this just like 3b7dab93f240
> >> ("x86/spec-ctrl: Protect against CALL/JMP straight-line speculation")
> >> did - by inserting an "INT $3" insn. It's merely the mechanics of how to
> >> achieve this that differ: A set of macros gets introduced to post-
> >> process RET insns issued by the compiler (or living in assembly files).
> >>
> >> Unfortunately for clang this requires further features their built-in
> >> assembler doesn't support: We need to be able to override insn mnemonics
> >> produced by the compiler (which may be impossible, if internally
> >> assembly mnemonics never get generated), and we want to use \(text)
> >> escaping / quoting in the auxiliary macro.
> >>
> >> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> >> Acked-by: Roger Pau Monné <roger.pau@citrix.com>
> >> ---
> >> TBD: Would be nice to avoid the additions in .init.text, but a query to
> >>      the binutils folks regarding the ability to identify the section
> >>      stuff is in (by Peter Zijlstra over a year ago:
> >>      https://sourceware.org/pipermail/binutils/2019-July/107528.html)
> >>      has been left without helpful replies.
> >> ---
> >> v3: Use .byte 0xc[23] instead of the nested macros.
> >> v2: Fix build with newer clang. Use int3 mnemonic. Also override retq.
> >>
> >> --- a/xen/Makefile
> >> +++ b/xen/Makefile
> >> @@ -145,7 +145,15 @@ t2 = $(call as-insn,$(CC) -I$(BASEDIR)/i
> >>  # https://bugs.llvm.org/show_bug.cgi?id=36110
> >>  t3 = $(call as-insn,$(CC),".macro FOO;.endm"$(close); asm volatile $(open)".macro FOO;.endm",-no-integrated-as)
> >>  
> >> -CLANG_FLAGS += $(call or,$(t1),$(t2),$(t3))
> >> +# Check whether \(text) escaping in macro bodies is supported.
> >> +t4 = $(call as-insn,$(CC),".macro m ret:req; \\(ret) $$\\ret; .endm; m 8",,-no-integrated-as)
> >> +
> >> +# Check whether macros can override insn mnemonics in inline assembly.
> >> +t5 = $(call as-insn,$(CC),".macro ret; .error; .endm; .macro retq; .error; .endm",-no-integrated-as)
> > 
> > I was going over this to post a bug report to LLVM, but it seems like
> > gcc also doesn't overwrite ret when using the above snippet:
> > 
> > https://godbolt.org/z/oqsPTv
> 
> I can't see what's different from
> 
> void test(void) {
> 	asm volatile (".macro ret; .error; .endm; .macro retq; .error; .endm");
> }
> 
> but this one produces "Error: .error directive invoked in source file"
> for me with both old and new gcc.

You are right, I think godbolt is somehow busted?

I can reproduce your results with my version of gcc, so will just
report to LLVM.

Roger.

