Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E7BB2C0FB8
	for <lists+xen-devel@lfdr.de>; Mon, 23 Nov 2020 17:08:18 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.34790.66019 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1khENo-0004Tu-Ox; Mon, 23 Nov 2020 16:08:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 34790.66019; Mon, 23 Nov 2020 16:08:04 +0000
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
	id 1khENo-0004TV-LE; Mon, 23 Nov 2020 16:08:04 +0000
Received: by outflank-mailman (input) for mailman id 34790;
 Mon, 23 Nov 2020 16:08:03 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/SOx=E5=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1khENn-0004TQ-Hw
 for xen-devel@lists.xenproject.org; Mon, 23 Nov 2020 16:08:03 +0000
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id a748d045-e4e2-46f3-88d8-bb1f4ae36658;
 Mon, 23 Nov 2020 16:08:02 +0000 (UTC)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=/SOx=E5=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
	id 1khENn-0004TQ-Hw
	for xen-devel@lists.xenproject.org; Mon, 23 Nov 2020 16:08:03 +0000
X-Inumbo-ID: a748d045-e4e2-46f3-88d8-bb1f4ae36658
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id a748d045-e4e2-46f3-88d8-bb1f4ae36658;
	Mon, 23 Nov 2020 16:08:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1606147682;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=8+ZKc+k1ZmmB3rxiFd3LuQWvhFPGf4Er4HSCxSJXD5o=;
  b=OrtDNfl9UUQp/B4NfF20F1cJL5N/nLawZ0Hc1HA5RLEAgEHQgikcacX8
   CbIueuOp3oDg61XQ/O+Qswrh6oi/BtDyDQm9QIMihz2ipIf0xnZsLMdhp
   opOSs6Pvw2/FSj/mvjH/TEUzv1EUSvCUC3Kqa4KWmGLOyCI8KrhCctAzT
   g=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: KlRta09svDEbrKFHohYIm9jEuN01XoIKs6mE2wbn6jj+wN8eIi3VDQ7fMmOxnug1UlERvzAQP0
 0DePRvQ51Xk8i9GiQgib7DBoShroII9hCs47BnD2V0YYQEmHmjMBIC8u/ICs0u4a+zdSeRRrR/
 w+ph35bb/QauBgYOqrNDj/u1NXEHa9K1hulBYJlbBwuEHEQCVblwk+8dvTaO5M4hbWiNlDjtPE
 G7DPV8aOY9TSzqIDFytj42LYUfJL5689M1jg8iTbV8LmqA//4Q2QAKrpoPyxLyf7g634cDfpwZ
 XNY=
X-SBRS: None
X-MesageID: 31728834
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.78,363,1599537600"; 
   d="scan'208";a="31728834"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZdXf9HL7hf813Qy82MUefN7erm2yjocB0cuYjwK1vv3BVsvPQNDbn2Myun6nlLTYrfbc+elIwjBjHLXxBdo1DYmudAhjcyw4RBoQV2hiCxmoiaEa5dAK98kgEy2B1VM2v75tCVqyi9fFKU2EBI4q4S77qfvzcxzYkFf4GR4aacrqZLv9tOgFXGDJ7uc8kuQpdT/FicFZUnneKPYvG9IardpZiCxN9jnM0cCWsjLVrFxWTJjL5shEfQIez+KeSNET+/kHO9YWCvVpaqRHLpDTreZv7DDJEKTHHr2R3BH5jnP9PDwZ37PAzm0BpBbzmhl/PxOaib2lZYsfVwrtsettQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/WhAvPdIgkF2fb97bY+SwGofAoF7RVa+5/6DK1whcMk=;
 b=FeFypgMjyb8C0kjTBojP+SEc68hQpui3w1qqIWTPLsgvlODUxWMZwr/2R/T2iwGXenHsKxIx5KkI+xBKfdGqajfMCFmpLX6w9FP6iXx6pU2JvrGrRrUdLrlukaKHbMS7po+/y7APFq2LNon7yE24pyfBnxuICMr+2KceBIsYxvP0+oXG98IjrpLLaveATNW+rFCH+ter5uxQ6+U7TkM3gXc7KAIclf4FFLJeCtejJxlXnPZgLN2KDp4WYoaJKeT6U6AQDBHtXHwT9TD9hei+WQdcAHBJ9q09aGfBGNaWOa+BRMnLjn1QCjni6rz3rxg6w7gzF7tts5A2K6G3RQ4/lw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/WhAvPdIgkF2fb97bY+SwGofAoF7RVa+5/6DK1whcMk=;
 b=afklY2d7mudh31SAA287HVlF1aWAt37tKrpB3CLs69nxBTnVSSRz1v83zCJ13veDCqdQo98isGo2bH6mIZq8Dq+f2RyVJA/lX2T0kZ9X+A5f0qBnqnTAdb0xP5Zh7PgkQ+fU+78QZL6AmNccx9/zfMZi5EH+VTgFyTBhio1lrKw=
Date: Mon, 23 Nov 2020 17:07:52 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, "Andrew
 Cooper" <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>, Julien Grall
	<julien@xen.org>
Subject: Re: [PATCH 2/4] x86/ACPI: fix S3 wakeup vector mapping
Message-ID: <20201123160752.uzczcxnz5ytvtd46@Air-de-Roger>
References: <7f895b0e-f46f-8fe2-b0ac-e0503ef06a1f@suse.com>
 <c0210cbf-c07d-7fa6-2ae0-59764514836a@suse.com>
 <20201123152454.yjr3jgvsyucftrff@Air-de-Roger>
 <79776889-c566-5f07-abfe-2cb79cfa78fa@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <79776889-c566-5f07-abfe-2cb79cfa78fa@suse.com>
X-ClientProxiedBy: LO2P265CA0365.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:a3::17) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0067c905-0c3d-4a97-1a0a-08d88fc9f163
X-MS-TrafficTypeDiagnostic: DM6PR03MB3483:
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM6PR03MB34835E3A0FF56E860C3772FC8FFC0@DM6PR03MB3483.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: u/J3vKmu+IhdIGmzIqhbBpL1EpUvZrJ7TypBQCBkiGCSInlxOqVT7TfAgPyqklownaAfcCx5JiZpLqskodLbw66tlmlxevQDwWBJxqPk8XLWlsOCBDZE8y4ZzAexca1YR+H1NKcE0cwHb4IoOgyhMfVvHwZw51rt6r0nCUyGV61Al6rZx0dIjeWDeX/FT9CXb9c5+zU9PEnzbBYeejbnlx4wiYYuLTRCRJNRjvYzSOnx5wezuw3CngGdEpx5Z8Y5tmhuNKEFeo56skg6t7rl8NmprmDss7pwCZkpO7Jf0Q6SAzEVwa8iIxz4mJaaqg/T6rhMkt+RF0jOu8m9S99csw==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(7916004)(4636009)(39860400002)(366004)(396003)(376002)(136003)(346002)(66946007)(66476007)(66556008)(33716001)(8676002)(6666004)(9686003)(186003)(16526019)(316002)(26005)(478600001)(5660300002)(956004)(85182001)(6916009)(53546011)(2906002)(4326008)(1076003)(54906003)(8936002)(6496006)(86362001)(6486002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 2NW3Qosd7hXg+AIGcBrBUZyh54Ucj1i8DBZumoG4B37jVpEvxD7PGtiqXiAQ/sZp+ytyBEmUKX81gqcTjbYB1+w8QCQAkHzQkrLxLPHNWCmyUtb6MIoKcPMv1k4l5F4Ups+um7u0rIrcBk8SNSmn2l2j630Hl0O2n2RM3osvSLqn9M1STg6/ha8LI316/Kq3zhK48jDHY8JMOf+07BARn94fl7djQPHP8PrZT0p8FHZEy7dpbh2vs/bxAwzrjfZpzBzNdYh+is6s4rHzrVw5XjDnc7TpFKR5EHB2G3I5iaDlfx7Mwv2A+9h/HFSygWcNMkQSkSxjLCnKUzJMVwJgmqK99GXD8Fsi2EzbGddTLtKQFfsQ7Pkc5oScE5eifs60XnNTMavWxiEPczFVQUWJ5y0MIjrsTSg5hUk/HB8L1ZGA7OoQMtX4bimC19XFSlRh+btGGPw88q8CB9xGIoYLvRN9f5PNTfDVYzlA0oL5RzKRbQEZefDNkv7TMnh5i3yJX8H0K8Fy8alGfbmjAKI8McULvRRtJWmYpNddqGDheuGjNcKbZScqfeNaREJpps2P4mG0Isqy9vTPimQoNwljU+aAIMc7/8vJE4CbY2rbl94QYUVzhz0FmZl9RZHKes662xj7EnAx41pEpaAT6n5XUeg9DhzvZzQ43EoBXg9p9L8NDfZStun/lR1ntkuj1aGp/UaGFTENoExMo7mLeMaJuJuXAsObzRXFviqczVudZ6y6Niomh/GWEKpFmzs0ZLVqumHiY50NjRlk47QwyyKnl0HgpXYMjk25sBnqX4EQOJH4LNZXsOjU4ddd8QeRzHkDUpJ3LaC2AxDNpOV65qu9xo09zp8wfijoU39lsrF+1t7hBF5ZEuhbYbDSfvIbxVkYcfDOYVr4U/xnmfFa+l38pg==
X-MS-Exchange-CrossTenant-Network-Message-Id: 0067c905-0c3d-4a97-1a0a-08d88fc9f163
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Nov 2020 16:07:57.5968
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ENU8FbwpSFnF0KhLORW341SKGHz0aeAlZ3/20ypNjvyshiXJJ14OYsOqJH5/SD5K5qWIS7Uz08MNDNJEYpQf0w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB3483
X-OriginatorOrg: citrix.com

On Mon, Nov 23, 2020 at 04:30:05PM +0100, Jan Beulich wrote:
> On 23.11.2020 16:24, Roger Pau Monné wrote:
> > On Mon, Nov 23, 2020 at 01:40:12PM +0100, Jan Beulich wrote:
> >> --- a/xen/arch/x86/acpi/power.c
> >> +++ b/xen/arch/x86/acpi/power.c
> >> @@ -174,17 +174,20 @@ static void acpi_sleep_prepare(u32 state
> >>      if ( state != ACPI_STATE_S3 )
> >>          return;
> >>  
> >> -    wakeup_vector_va = __acpi_map_table(
> >> -        acpi_sinfo.wakeup_vector, sizeof(uint64_t));
> >> -
> >>      /* TBoot will set resume vector itself (when it is safe to do so). */
> >>      if ( tboot_in_measured_env() )
> >>          return;
> >>  
> >> +    set_fixmap(FIX_ACPI_END, acpi_sinfo.wakeup_vector);
> >> +    wakeup_vector_va = fix_to_virt(FIX_ACPI_END) +
> >> +                       PAGE_OFFSET(acpi_sinfo.wakeup_vector);
> >> +
> >>      if ( acpi_sinfo.vector_width == 32 )
> >>          *(uint32_t *)wakeup_vector_va = bootsym_phys(wakeup_start);
> >>      else
> >>          *(uint64_t *)wakeup_vector_va = bootsym_phys(wakeup_start);
> >> +
> >> +    clear_fixmap(FIX_ACPI_END);
> > 
> > Why not use vmap here instead of the fixmap?
> 
> Considering the S3 path is relatively fragile (as in: we end up
> breaking it more often than about anything else) I wanted to
> make as little of a change as possible. Hence I decided to stick
> to the fixmap use that was (indirectly) used before as well.

Unless there's a restriction to use the ACPI fixmap entry I would just
switch to use vmap, as it's used extensively in the code and less
likely to trigger issues in the future, or else a bunch of other stuff
would also be broken.

IMO doing the mapping differently here when it's not required will end
up turning this code more fragile in the long run.

Thanks, Roger.

