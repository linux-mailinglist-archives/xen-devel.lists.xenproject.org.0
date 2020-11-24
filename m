Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E539A2C25E5
	for <lists+xen-devel@lfdr.de>; Tue, 24 Nov 2020 13:45:16 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.35931.67606 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1khXgs-0004i7-DF; Tue, 24 Nov 2020 12:45:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 35931.67606; Tue, 24 Nov 2020 12:45:02 +0000
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
	id 1khXgs-0004he-9T; Tue, 24 Nov 2020 12:45:02 +0000
Received: by outflank-mailman (input) for mailman id 35931;
 Tue, 24 Nov 2020 12:45:00 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=IwAZ=E6=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1khXgq-0004fn-ER
 for xen-devel@lists.xen.org; Tue, 24 Nov 2020 12:45:00 +0000
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 1498ab9e-817d-4733-b60a-98a139788c53;
 Tue, 24 Nov 2020 12:44:53 +0000 (UTC)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=IwAZ=E6=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
	id 1khXgq-0004fn-ER
	for xen-devel@lists.xen.org; Tue, 24 Nov 2020 12:45:00 +0000
X-Inumbo-ID: 1498ab9e-817d-4733-b60a-98a139788c53
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 1498ab9e-817d-4733-b60a-98a139788c53;
	Tue, 24 Nov 2020 12:44:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1606221893;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=v5+NeC+1f1FcIE26rPZNgQI1C2Y2AZyD7lZuHqqxYiI=;
  b=iIWkRyzHIiQI6qmttGVvmWtnlqizVwdvLeBlcvH8yvueSY4fNthAjkik
   X7Rg2dZgTFzNYQUfGMyoeLzjVwbH/mCUXCs30+Etks2hPogef6MK2TNzr
   Xkd/gjiRhugJBqya7QfUL0mIqm+cgUJTm0EOZBTwl1N9/ix25CIoFUIoS
   0=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: eKs0eZxbg0+zgHMPFHr9cMPGlBuwKOFKxUkti8i7fsjECZsruRuki7+T5vsXTSbpVveOryn+nw
 70n5WDvmk4SYc4JtS9wQAG8IJpRldZQ1kgpG4qROZktsFUlVGyifu19b62s7Ows6a2sIeYBXQ5
 GWTB9pXAHz+fkO/FYuYzYC7EXxJfpxYCqGv2WHBcJ5bc4+lE80YMPhiWdZglHTjR31dFOlXPr4
 72LWOUGusSSKHq6sCW5vBatreC8Pv45jRHM1mtTvLgNoTgD9P8bNHiQuAKC6jueEFfX7q4j/lB
 IAM=
X-SBRS: None
X-MesageID: 32165581
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.78,366,1599537600"; 
   d="scan'208";a="32165581"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AcyiBqK8YdNNzsr4yjSWsiGDDzUY0wVk+uWRBRKSQu6vvvJzboiEYqS3WBdUOjrNM+566a1QP3Eta/6QH/fx9cJkfRuHQWxVyk8J7ayBlfqofwiH4vLWInAMNBg6c24aS0iDJ0F/6R9mqfai3tzNkvGPKdBYjXjWN2Fu0FhVCnetkLQZCgNQqpM3gEEVOGjA3Y0fQJHDuzlqs2spKX/EMkZAvBQ68oAYWeJdNbm1N0VTxn9c7vMq7NPrJVcXQye9aYaVQQlylwmko2EsH+lOu/yuXcaULrfYojBzzPO4cRm0nzphEADoUkNFmbZdxCfpHue+iVrbudVFP8onU8JW1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bNiiNcKeu69XwjDnhN0RCQkefm9PB3+H4JgnQ+jvX+A=;
 b=XIbARE+jo6nK76OhUOBC14Oh9thzAOuS66Rh3AawtqDUgHGKuGbfXUTTTf29rBizqizNWOzS6uqB/Q7r++r5voVbSJ9Q18n4l3uKjp7wqfPNtuR9TazOGX9LeKTBnx+6h7LyaAQvCQRMwlT36MyhH3hAOahb7E04y4KrYCmOjHK+HYkH1vqHIWbWJXG1kpTD64yNVNYEXkOYnlwu1GH16etL0RJRLEnHjTbxI1hXh9sVSogMYU2zXoGr16dDadLBVZurtSel/SczS4hXWyrWygQQh9R/81QdUxTL2KvnYm5NPoNAw3UEHBi+MwMmf6bkwEG7SNls9ebFW0CQntiSeQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bNiiNcKeu69XwjDnhN0RCQkefm9PB3+H4JgnQ+jvX+A=;
 b=eEN2V8Hh1KONWUQPx7v4lC9iduZaiW+JOp1H6Cb+yU6YiRkfa/vbGCTkLmme5omndJVprR6lQEBxaukY73bfHe86dovFJR/5M4ghQDJl9PQ3DRG4XObMX/HdqWAHA+PbaHYI9dHdtz0ErdY1Su98Ld7X/B02XYVvCilLuiKKRhc=
Date: Tue, 24 Nov 2020 13:44:43 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Xen.org security team <security@xen.org>
CC: <xen-announce@lists.xen.org>, <xen-devel@lists.xen.org>,
	<xen-users@lists.xen.org>, <oss-security@lists.openwall.com>, Xen.org
 security team <security-team-members@xen.org>
Subject: Re: Xen Security Advisory 355 v2 - stack corruption from XSA-346
 change
Message-ID: <20201124124443.jhl25ldkhkawmzdb@Air-de-Roger>
References: <E1khX2v-0002f4-3b@xenbits.xenproject.org-0>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <E1khX2v-0002f4-3b@xenbits.xenproject.org-0>
X-ClientProxiedBy: MR2P264CA0017.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:500:1::29) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3147ea02-0eb6-4151-5739-08d89076bab1
X-MS-TrafficTypeDiagnostic: DM5PR03MB3291:
X-Microsoft-Antispam-PRVS: <DM5PR03MB32916E80552EF3FC151D88A18FFB0@DM5PR03MB3291.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: N2f/L8i+iwiAFRJSzfb1OMS02pTfA9Ka1VvEqH7hp3zn/00+4emuWofp4IGZOP3TFuT/+q8p6Orz+7S4pc1q68S6KLS88XUGypOtG47umjSgdku9MjSK4IulM0k6OGVENE2annZeHFn2jTE2zQOQwL2t8WubzdKMDRL0GzLyE15SUFYSDskPa881GsRuMBRt7EyzKDclJPo166HEnrbPqaDe1GbnZT4DlSAQd50mjUqP9HNFAGflfmHKOzXSU8b6FchTSEa+f692CtHBuTTlx9wIOj9ZSj4CNrg8mJrzChhQflnkt3tz18soAhTbFqtg
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(7916004)(346002)(136003)(366004)(376002)(39860400002)(396003)(186003)(16526019)(66556008)(9686003)(83380400001)(6486002)(478600001)(6666004)(86362001)(8676002)(85182001)(2906002)(1076003)(26005)(956004)(33716001)(15650500001)(4326008)(316002)(6916009)(5660300002)(6496006)(66946007)(66476007)(8936002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: yG39Q838Qld/lZnJpxGKg83PjAV0eqUt1RqT4k8eQaQgqkMgT4S7i74MywZ1tYJpAnSepPAV4sDBx+SjSnnAVjGHiKkH8ct3Jo3OFfBeJ5lGs1c+95wym1yqwNAowKF8qI8z61+EVA0PTRMTLTq6B433AVFT1+Hvu7ThesxG4aEpK8AGFTTJ1skreC2obC5bm8JAIlpcdmkNlWnmc5PYBRZaAIkgGo6N3aOU8QYfBev0DBuXS5r73jLAXSi2+9/VHQTGriC2uHVLRa+OGunzlqtM22q85X+0JP1HhCa/MiGWqgyNhPtChPcw4tS5i/nIIzjJxbSwxE9DD5XFfdsA8IrY4iJDuH/fdjKpLJT8FeEibhxQDU8sGcHAGFDIiCCg22UcnzoBZ8Dlvm8QcJ2SnuMSHjAKfJliDkIDE8NSdqnng3euKIfZgpkHv/58k0lTLdFc+KrSjk9j/+iJMjUYH745yZuzImRuP6FRwTN1g487hn7RNQ7YDn85BDErV4BfFvOpZcCOoYITXHArttk8/NiVUt1+xkIoE8Zd8alFbJbbn1tiMGBBEwvXhkjxbezn1liUB4yvHs8K1134eqw8wi3jT86JRSuK2OKkr7K4+MZqcoXSgtFtnlvbVkpj3JJH+Q7hYs37J5JEtFTdTbw0+70T4z4bIFqI4l68L5wfceDCdaC+bKZ6mC7iDFpTuBMNeKVr6MOelBuhALzpIWjuGSOsv53TAXWD37HXmUa88a4I7Ias0Q32JuknD4GJkJSuSai5HG+LKJcfwzU/gMlFMGVA5OLrHdIAXr250c2ihQsGjYB0M6tRq2dj6rQI/Zof7CtVB9H8MbYxexXtfn8XDoWkevhn1wNK5AHC+0o4Kc2TcMucXndKNPpiMJ4iotyuOmdDU+DJaUwpTwVW5BigNA==
X-MS-Exchange-CrossTenant-Network-Message-Id: 3147ea02-0eb6-4151-5739-08d89076bab1
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Nov 2020 12:44:48.9154
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7z1s1dAgcqlMw3grk9KStbeGbU6L9V1hv7xHY6mGHbZJ9VLCqMKaFKVKk9YQavywUWdQQYJBfM8bcxVqxTx14g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR03MB3291
X-OriginatorOrg: citrix.com

On Tue, Nov 24, 2020 at 12:03:45PM +0000, Xen.org security team wrote:
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA256
> 
>                     Xen Security Advisory XSA-355
>                               version 2
> 
>                  stack corruption from XSA-346 change
> 
> UPDATES IN VERSION 2
> ====================
> 
> Added metadata file.
> 
> Public release.
> 
> ISSUE DESCRIPTION
> =================
> 
> One of the two changes for XSA-346 introduced an on-stack array.  The
> check for guarding against overrunning this array was off by one,
> allowing for corruption of the first stack slot immediately following
> this array.
> 
> IMPACT
> ======
> 
> A malicious or buggy HVM or PVH guest can cause Xen to crash, resulting
> in a Denial of Service (DoS) to the entire host.  Privilege escalation
> as well as information leaks cannot be excluded.
> 
> VULNERABLE SYSTEMS
> ==================
> 
> All Xen versions which have the patches for XSA-346 applied are
> vulnerable.
> 
> Only x86 HVM and PVH guests can leverage the vulnerability.  Arm guests
> and x86 PV guests cannot leverage the vulnerability.
> 
> Only x86 HVM and PVH guests which have physical devices passed through
> to them can leverage the vulnerability.

There's no support for passthrough for x86 PVH guests yet, so this
issue only affects x86 HVM with passthrough.

Roger.

