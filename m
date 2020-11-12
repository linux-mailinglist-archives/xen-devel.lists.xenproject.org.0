Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 993392B02C9
	for <lists+xen-devel@lfdr.de>; Thu, 12 Nov 2020 11:35:53 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.25642.53537 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kd9wp-0004OT-VK; Thu, 12 Nov 2020 10:35:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 25642.53537; Thu, 12 Nov 2020 10:35:23 +0000
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
	id 1kd9wp-0004O3-RW; Thu, 12 Nov 2020 10:35:23 +0000
Received: by outflank-mailman (input) for mailman id 25642;
 Thu, 12 Nov 2020 10:35:22 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=muz0=ES=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1kd9wo-0004Ny-Ch
 for xen-devel@lists.xenproject.org; Thu, 12 Nov 2020 10:35:22 +0000
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 9c8b0d01-f763-4355-85ed-8fa784ddcfb3;
 Thu, 12 Nov 2020 10:35:21 +0000 (UTC)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=muz0=ES=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
	id 1kd9wo-0004Ny-Ch
	for xen-devel@lists.xenproject.org; Thu, 12 Nov 2020 10:35:22 +0000
X-Inumbo-ID: 9c8b0d01-f763-4355-85ed-8fa784ddcfb3
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id 9c8b0d01-f763-4355-85ed-8fa784ddcfb3;
	Thu, 12 Nov 2020 10:35:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1605177321;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=RqmP5mYY4erSSWm5+MM0WefqxEmGhuyBO3vreM3YtSs=;
  b=gV9VGO4USDR6WqgGwPleBdzD99EXtAfbGczYJ1EUnP0QHOFH+TWvbTtl
   VV85po3BGGVppDj3uLOk8DGaErLuDF0mho/D+BBB3g4u0UqagZNz2q9qT
   ENIboEMSxZEGVMhchmc8p3FKbZ7ZX27xNkKNHovwytwI+m3h1ectIzuBd
   Q=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: PfHtFi9M8d6PVVc/pKF0mnJL5DeLgMzvdIMgemYX32ldDMSygW934npku/4OH4wvsNXItT1XwA
 R4X0twJ9LTACiwefnGlvIUG2gLDxiBp2t0bQxKPW/pNiaRxsFamFY6zVWh7Nk7rUyqaWu0q8b+
 KHIFbSJrJox6b94raLgBrR7vuGxGl1nq0yD+tWdqmQCO7G2D/OHfqBPacrRDwzWue02irSN3EB
 vPYihzQ5QAyvcq2m2vqYWGFBr6y2pDZ66URZMiI0EqeOQxo2cv0RubHTAwYj2PCtHrPEpbQjNV
 vC4=
X-SBRS: None
X-MesageID: 31015255
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.77,471,1596513600"; 
   d="scan'208";a="31015255"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iidulBiQGbH+/hrHNTE4OLWNW4XUszONW0mRE5X+zzl9V+WSWMZupQxATzykrPWuAZDIJfAsB+I4Xv6P+GaqMpi9EIUHx5IK4xXqKXfKRAW+jbUGs/k8+dTN3Kbs7rWnRrvlaSLh2HC55uyaHPxhX/zqQSzOmjFTXjr3CxhSmL0BbZg1YaPdXlxwTI6gEEWcHjvbMDm0RPiFZvrcl7j54PqdQFEDcVF8QVyuT+99aA8O9wADw/7R37ii+/QUmlE6Elqn7gNTJ15ZANIZ2oogF53vRnPGCVGZ2Rai737SdWrg9ybAFGm66yfDh8CUYhfZt9QqPn793i4H+rOFQzoMew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MEEjLEP/zHA/yXqIeWbl2pBjd23k2UPx3qQL4Jl/nVw=;
 b=mh720namB5e++RjelzlqR7rOtG1BX1iL8ws3g5diGHVP/9foPasWkhAFtf7rCIL3d0ymPpXc5g4Zy4X5WP5tEXx6rhTrSf7yqFKv9buUcsMYFqANJpkA8EKeVnW1qe6IQhQk4alGfHVV+qG5FweIGxJRl16L3SJOzcLo5kl8iGEE6qF+v60Kb4fc+oxrDGttPSWffamBJoJTDy9KTYT7l7/QtxECZ+zqhRXPKbZehqz/h+kQf2lkwbxoWpG2PknhrF42yg6mgxU1yi+QIy80QdPXF37PL+HtCWJZNI66b/LqRdWzeJZxGo4N8VSBZyTpiFgl7cMv+hfh+pZ4thtq0g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MEEjLEP/zHA/yXqIeWbl2pBjd23k2UPx3qQL4Jl/nVw=;
 b=UJmd6XFekZ3H4EB7VzXlX6MgnzJFBjVc5TKmy7R0FhDlV6EXbq8EbrRrGjN/J60ILaz5V7e+Ai/2EmwRXAwzzJF9z/2tprIjPAVsSErHU/40mNCYFGKEFl2tda0M7Tq2+9t8ve4nSQqgTkBW44yoUBbadhD/otzkiCNYNV7xoBo=
Date: Thu, 12 Nov 2020 11:35:08 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, "Andrew
 Cooper" <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH v3 5/7] x86: guard against straight-line speculation past
 RET
Message-ID: <20201112103508.f4egyghvdhxuyo3t@Air-de-Roger>
References: <7065e2dc-f846-be79-1081-682c2295358c@suse.com>
 <80ceea17-958d-f409-5f39-9f353e780f5b@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <80ceea17-958d-f409-5f39-9f353e780f5b@suse.com>
X-ClientProxiedBy: LO2P265CA0053.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:60::17) To SA0PR03MB5610.namprd03.prod.outlook.com
 (2603:10b6:806:b2::9)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1d988a6c-29ef-4f77-4301-08d886f6a322
X-MS-TrafficTypeDiagnostic: SN6PR03MB4094:
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SN6PR03MB4094F5EC1902D95B5695B50D8FE70@SN6PR03MB4094.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6430;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Jdf5tM19LJFGM2P45F2kC67KfY+2dAZ523MV7VzhsFE864OB48SYlOOXhmq4+HRvgnSGDDG7jE+TUOlpkZb7hyGfnTntfUJ33AbKeeh0aztPNYz/wAxAtHY2xL5skV2zIDh7EZ0ZnjLdcuotaNQQh2EKQ2WhyOGaMA43Onwy6LIMhi9sxucEoa7hIFXPjQVpRQFyDJ5XjVnJ+mQxQbmjJ8QXnK4U02SNabOBWBXx4YUAvrBHjYddaAG4xxX6isSGhvqNbG7eJ/lYUrWWjddqzZKiEJ1iL2loufYKeWgAMOQYx6+zBsQKIuQKz/DZrQeT2IG0k3vwd2jWeh0IdKkqiRNgdhQCCddfaJ5hoHM84g41bKnjmExRdvfEXO3hGEG9LPsOc544FNqoOZ9BxEgD4w==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA0PR03MB5610.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(7916004)(4636009)(346002)(366004)(39860400002)(136003)(396003)(376002)(956004)(966005)(8936002)(316002)(478600001)(16526019)(8676002)(26005)(4326008)(6666004)(4744005)(54906003)(85182001)(186003)(5660300002)(1076003)(6486002)(66556008)(33716001)(9686003)(86362001)(66946007)(2906002)(66476007)(6496006)(6916009);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: pKAfx7GzNzFs5J85jOaimb+9C5B/yXA/b5H/cMfQZPZlcS+Db4q29s7xgDFPbxDtiPXdbS828jaYs+9n9R/gI4vPkQOMEXuMpt8faob80PzpGqe4zD83eWPGpUhqT8s9ZbiqTpdzmh4Aw7IkaD+63wy6ID+J1Te7ioAjcizHRhejwwzAfg/BHCMtriPW3XjlOg8DyIWoD8Oengw6mTBlQrWBseQSwuV2qtbU3gUiIKL2bR4RRNBqdVZkghKfNKw42wsiXszQ30x1jX+dguqP7azipDx8LrPX/ZSq8m1f5p17SLHwNDAC7uM4qYJ9pIW3hPLC+EqpkF9xw44VKkfWLMO16maXFRhPKJFSASe/VyV2dTuHYU5637C9vK58d1lPgQHUwAYa4RzQdE/8GwPhdHllJn1n8JVVDRbuBvAs+SMfl2haOPkBpVKAeDOnrKcnqvNp4PNab9pO5ftMERF5iq17dZwKqxwAjj5SDCaCXiF7plsfjFo4pfEJanB5waGlsfonqz54ikbjZg6NRhIsIPDpvVIH0zLuEMwvzsdHmVOsM6/rKa8i150z+LVwLBOn0HEN01kXq9xzluausTPZoiJ/NLP4O14sTieMSpBIpC4e+t43mG5s+/4s8tdoDBOPt1jLm8ZcZbKu26KweioWEA==
X-MS-Exchange-CrossTenant-Network-Message-Id: 1d988a6c-29ef-4f77-4301-08d886f6a322
X-MS-Exchange-CrossTenant-AuthSource: SA0PR03MB5610.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Nov 2020 10:35:13.2104
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IsT++5rBv+7BWQJA8sZ/Lx4HnYzC5q7wGPbBeNw6JljdtPaDw7h4O+wS1cSQwxVxyHY1SBk7zFg40HIAwiQ0Jw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR03MB4094
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
> assembly mnemonics never get generated)

FTR I've reported this to LLVM upstream:

https://bugs.llvm.org/show_bug.cgi?id=48159

Roger.

