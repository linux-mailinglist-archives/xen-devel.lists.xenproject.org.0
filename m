Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C7102AEF5B
	for <lists+xen-devel@lfdr.de>; Wed, 11 Nov 2020 12:15:26 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.24629.51974 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kco5t-0005DA-SW; Wed, 11 Nov 2020 11:15:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 24629.51974; Wed, 11 Nov 2020 11:15:17 +0000
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
	id 1kco5t-0005Cl-Ou; Wed, 11 Nov 2020 11:15:17 +0000
Received: by outflank-mailman (input) for mailman id 24629;
 Wed, 11 Nov 2020 11:15:16 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=nKbA=ER=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1kco5s-0005Cg-BF
 for xen-devel@lists.xenproject.org; Wed, 11 Nov 2020 11:15:16 +0000
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id b00f005a-604b-46f2-acb1-7d14fe048649;
 Wed, 11 Nov 2020 11:15:13 +0000 (UTC)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=nKbA=ER=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
	id 1kco5s-0005Cg-BF
	for xen-devel@lists.xenproject.org; Wed, 11 Nov 2020 11:15:16 +0000
X-Inumbo-ID: b00f005a-604b-46f2-acb1-7d14fe048649
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id b00f005a-604b-46f2-acb1-7d14fe048649;
	Wed, 11 Nov 2020 11:15:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1605093314;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=ZBbY9I2LeAb8lHantSX4XXM+wh0OxsXIi0G3DhcUL0I=;
  b=UgGvdwLUjVRE6cUOG2X190cZn+AIFfuMZ5HeGBaNoG1LyBfF7/uUeZr9
   FywQAdzdKT8Z+hmln/rV/z/Qk4JnC6k3VmVHC0kIygS0zzg6ctwqWGhGz
   7skozSRFCLBtVCxpTreWUYCdLcqRAXrztNzW7kXnakJh3c9Wu9T9dGltE
   o=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: v6UgKnQOtgauWvFaxGyafM0Ys5ihbE0V8wRH7IrF/NUFEPjG+jboxBAXtTQU+mG9H6i+YMyHDf
 GAK5S+yyGeaOvipQy/4XQyyIzVJieSsvOvB5IkJe1pT6g5tRH3KZnIV3aARa7cJeCR9o4TAS39
 k1s924ak6Eoa2E7g7kYZUfXRK6ZlOvYOtZO0CsU4vitxnsP0GlGD8UfJqEp6lu2FsNPTW5xp1W
 i+OK6R5y1JCCbj+hYnBFVHh26SHncT3HELipczTo1qQ3kiY4s0HNYCGfrXJrM8E8UDgZRCYJhN
 /XA=
X-SBRS: None
X-MesageID: 31277148
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.77,469,1596513600"; 
   d="scan'208";a="31277148"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LRCtg4j0jd8RP3MqZ5tqxOy+JZGYKwLY4X/UkqYSOSrJBRiVNZcUFhz+qAr/U0an6t/FqHKldzc2+LE56kPOffikNiOXsldKTiBKHRNQ0mUU+6zGOATNPoO9mzJcqnnVB6ckISTsnPkE/P0wcjmeE2nczGMfRBc7bkK/ReE8YDr8Aap834QLztloyeykqLknu83UmJ2TD2J5LWc5WNujE7j8cvzYC/g2YXuGI34u7LjomVAXOjvs27BNZcowou4fBESA6yn7nkME5h7o6x2ljkQqf1Cum38uVJzBATytmFnCcm9SiazwAL5CpNGu4ImZlSG+Nr6JoBfhDQwsQJ57MA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/8NKIoQS2S86uhyFZ2/dOmcBEiEleM/wLw3QW8a8L9U=;
 b=K6HqNkaA/WGC4ZHBnqKFCPhwiNUjEMKuo2a00xuEsr3/t4VCPbKAcqMVjAVkiibHix5ucXFIcSCEazEcX35DuYkmB5whGp82yQ86IrJ8WtyeOf/SnQ/n/JVkhHpMesw/z/UtStvQ60HSdsky+1tiF6QTxt1fKvt/P+/Lqtnbd2y2qjCwgdhemrZmEvS98v20J9JhnlaNp8WxHIt54HV/b2vLwhtnp+/6DhJN1ya9YyPT8ivYhkaj+Jo0M+/LeLAAJUuyiWyKeP8ZZabqQfTY0fbDcY1Z54DsbJylIkQ15PUNic2RKofmzYcMVe7Z4uGPepu0dOkqoIf8QCNtSMy2/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/8NKIoQS2S86uhyFZ2/dOmcBEiEleM/wLw3QW8a8L9U=;
 b=Jq008qv7j5zYChIPoCE73C6baETvccKyvH0SNjAPnUWD94HJDg9OCv5oFXqauTEw1MqeHC0iDV7sdbjx+s7HD97Di+VimdVqKli/Efff2Kz9J0n8dk9HEz9P+xwPnejEBxgBw1fFdyGz1f0ExZywH5DE0cWkjwMxlh7qnoSqLVQ=
Date: Wed, 11 Nov 2020 12:15:04 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, "Andrew
 Cooper" <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH v3 5/7] x86: guard against straight-line speculation past
 RET
Message-ID: <20201111111504.r4k7a53spsy7pzjq@Air-de-Roger>
References: <7065e2dc-f846-be79-1081-682c2295358c@suse.com>
 <80ceea17-958d-f409-5f39-9f353e780f5b@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <80ceea17-958d-f409-5f39-9f353e780f5b@suse.com>
X-ClientProxiedBy: LO2P265CA0094.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:8::34) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 94c67ec4-6d28-4d10-9c22-08d886330cc6
X-MS-TrafficTypeDiagnostic: DM6PR03MB3737:
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM6PR03MB373783BF7412E4E82A9D48C48FE80@DM6PR03MB3737.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: emZeiTn+XYPpnpqCsBAcc6VXISkTu6Z4XvA10lzBDi2LTNn9h7uq9LDDwTdbNlT+3AaUuEitsAzJvXx3uDQBCQwediXtYY1EtzFFBH21k7GCc4l1F5AWUFiQ1y9zwVf8RoKSFb1ygzVLMesha4TXMh1lP+wkM0coLU+i6+ULMNVkLBLZcCfJUeoJ9KUsvaxMq2TVMq7DDrXFmQGTqTWos0kTTLLQ6AFKsWyizO0T0IACtI69n83x6wCA9GytXtZtjL/tXL5QcQcZ0ehVVfe5pe2gpPg050JeEvNQSAYw4yNzNJj9FPr3x0fdosy6A0wSUq8hBMuNstiIIXj2E+ClKZyDu0DsRThPX0sTUKO5bmxbblQbsTh721jJ0GEMOiI5k13BuUc3/QpvKG9wy2plRg==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(7916004)(4636009)(376002)(346002)(366004)(396003)(136003)(39860400002)(1076003)(6916009)(8936002)(956004)(478600001)(2906002)(66946007)(66476007)(316002)(26005)(5660300002)(86362001)(6496006)(4326008)(9686003)(66556008)(16526019)(186003)(85182001)(33716001)(54906003)(83380400001)(6666004)(8676002)(6486002)(966005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 4y4U592Y2uVV7q4HpWgsxsKdHw7Y5R+E4GFJrZJE7OUlekfW7TE331nVZqkUBVdU82BSHcPdshDN6Jb30H2E+0uOUBCALHgzb55jxAy7lv5HtMzf0UBhjAQI49ew5/NaQNLjhKENjxoHAZnADzdfQVFyYiEqT4klD6kR18TGPretMSIO+mXAR8YSJr0Kr6mM7wgJk/n71Z+kv/qaxqEtdGQR6kAolnyx9BeVCzkq639SmmsCwN5bNuSgTs0zmQppvCxXJrEUE7U/CLizH52VAGscLpg7YI4wvXHQSm23Riv3BJ7fWjbbAS6p+CQH+xYL+z9f/UIstPv1MArYm/o74PsPojQux5D3bTnV9s4MHo/UQ0nkCt7H7DAeO6TAV3mDRSIXQkNwIw3PSQWc6S9OTfVI5aJwW+KlkPYwm9wQnzWRT3zAIJBciSHZAPyccr0JSlZtzdKwnyD5rQ8nbl+VOm9hB4vMsiBNqjRqCzOT4O8p99y7VH4qvP1BZcpvolWJhi8OS38q0CbV7ZWq/XG8kAgd3fbgp8JkwaxWlVbx2TvjBfCPAmKqBMHajNc5igJx40CcdSBj8v1Q0sfAu9GdvmmfiXSUbyZWocEykh3Xgsp2YZ2oKa7Opfwt2f/KY7wK4oG2Pt5VedK/bUOjsFac4hQ0rdIwibJ3nYedhEOroHfWNfLc7QccxMniwHEPCj3nGdl7DjyHJijNq72XfkAfA6xthPmIjvKxFIfN0z9UqMU4ZqdvW6mw1XrArG3jPctKNB862cBzUtqwJ98o7ZYu77UYxiDOvD+bpfyX5xVH1T2jsx7UoXmwXyEF1Ts1Ye0+dSFYLtfNFgkaFr1G5MnerpqHP8Ze88vfWMAhVB8Jxy8e9VgQ1QTg4MZ3yVVN0oa51QWhFHwUXfo+MMBgPZJD5A==
X-MS-Exchange-CrossTenant-Network-Message-Id: 94c67ec4-6d28-4d10-9c22-08d886330cc6
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2020 11:15:09.2236
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZiHepMZSZTYCVMQAl5mX+ai1M0Mwef6h+Lgow6VwzOJkA9Ll/2MqTeHqFzM7uV5PHOFREyxBxqoz/96acMFFXg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB3737
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
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> Acked-by: Roger Pau Monné <roger.pau@citrix.com>
> ---
> TBD: Would be nice to avoid the additions in .init.text, but a query to
>      the binutils folks regarding the ability to identify the section
>      stuff is in (by Peter Zijlstra over a year ago:
>      https://sourceware.org/pipermail/binutils/2019-July/107528.html)
>      has been left without helpful replies.
> ---
> v3: Use .byte 0xc[23] instead of the nested macros.
> v2: Fix build with newer clang. Use int3 mnemonic. Also override retq.
> 
> --- a/xen/Makefile
> +++ b/xen/Makefile
> @@ -145,7 +145,15 @@ t2 = $(call as-insn,$(CC) -I$(BASEDIR)/i
>  # https://bugs.llvm.org/show_bug.cgi?id=36110
>  t3 = $(call as-insn,$(CC),".macro FOO;.endm"$(close); asm volatile $(open)".macro FOO;.endm",-no-integrated-as)
>  
> -CLANG_FLAGS += $(call or,$(t1),$(t2),$(t3))
> +# Check whether \(text) escaping in macro bodies is supported.
> +t4 = $(call as-insn,$(CC),".macro m ret:req; \\(ret) $$\\ret; .endm; m 8",,-no-integrated-as)
> +
> +# Check whether macros can override insn mnemonics in inline assembly.
> +t5 = $(call as-insn,$(CC),".macro ret; .error; .endm; .macro retq; .error; .endm",-no-integrated-as)

I was going over this to post a bug report to LLVM, but it seems like
gcc also doesn't overwrite ret when using the above snippet:

https://godbolt.org/z/oqsPTv

Roger.

