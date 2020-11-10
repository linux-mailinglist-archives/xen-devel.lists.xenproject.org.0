Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 88F8C2AD532
	for <lists+xen-devel@lfdr.de>; Tue, 10 Nov 2020 12:30:32 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.23279.49943 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kcRqo-0000Sb-54; Tue, 10 Nov 2020 11:30:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 23279.49943; Tue, 10 Nov 2020 11:30:14 +0000
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
	id 1kcRqo-0000SC-1n; Tue, 10 Nov 2020 11:30:14 +0000
Received: by outflank-mailman (input) for mailman id 23279;
 Tue, 10 Nov 2020 11:30:12 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hJ2u=EQ=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1kcRqm-0000S7-Fn
 for xen-devel@lists.xenproject.org; Tue, 10 Nov 2020 11:30:12 +0000
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 3e372d28-f65c-42b7-bc12-48b90cd970d1;
 Tue, 10 Nov 2020 11:30:11 +0000 (UTC)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=hJ2u=EQ=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
	id 1kcRqm-0000S7-Fn
	for xen-devel@lists.xenproject.org; Tue, 10 Nov 2020 11:30:12 +0000
X-Inumbo-ID: 3e372d28-f65c-42b7-bc12-48b90cd970d1
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id 3e372d28-f65c-42b7-bc12-48b90cd970d1;
	Tue, 10 Nov 2020 11:30:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1605007811;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=DswWUBFVhefM0AiWW5aZVrzExhrh8izShQ7k4bwFu2c=;
  b=NtaZUL4Salgjy5blYQMnYcvZln3BFEeokc7JizgE52l04QNID5JTlDTt
   VdrWw9cIdQMK3+NjG8IqarGLDXzgP3DoT8QHyRcMxOZ8V/UTrLSOs23Hz
   /qNIfj+i0fnh6wpwlWMDpHflq0sSDMc215Q3zf1tj9pVSPg7hrHyPJRLN
   A=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: NltpuTUiRVMSwgsnUyRDxCAVv5qRsF21vhXMhIY/q6oKvMsCatopih6MsV9T6bBWmxXIXHfGkP
 gGpqPC7sn7a/P70fZnuCTdrbTufMm6fYgQKdpGWoOXbCxUOQfIB59g05fOsKMUlgeT3xkXSAoZ
 czmSIL8car2H+B56/x5VVFLDn6bQiZQLcHNUl+KtLpmwAjtiEtJ6RnWc/jsSoLEZF67TZ9uziJ
 s7kU85CKooSSu4DTq/rvioxlwpsRhb4NBQqaIGOkZWGB2ISrJcU3CVELfYaTJnDdg1I/uExhGn
 FEc=
X-SBRS: None
X-MesageID: 30839964
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.77,466,1596513600"; 
   d="scan'208";a="30839964"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YZ+awRR7yQ1b4INNuRBAM7vUdGifA7kyvVmtv6MHIkobcMaGGBpNvxTAvNsIquoFyZQ4s8Afbap7vN3pPEqlHgCVnTRfuIcQlEGjaK0PFXRBA5bin8eBEJAMxRwT4t2AdEkGrZ1XCHJwP8mQfMjsWsseIrE5Y7GA8EQ1ElnWXn4HgyCOsr/ECwptyBx02mcssOpolREzZAEChFG6umiQ3Z+3TSLsE7QFE0Kj+/tUDhklJ2hG0/5e0x46cLjSglgMQDeLk8yjErycZZG2JSG1G6ZcLQUEpFLEvo0TIqiq4q2HVngRBjBWf3iZ6GxU/MsfCO/2hTC7rc32g+1z3buOyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GmFRSLA9nNldh/+JrLsL8VNAG5HwvNv1XF129AwYSVQ=;
 b=iBD/+bt2aTjbSSY7pu3Z0NXkEjQ5PIsDRbWRfNXMT1xgHcGD2bJLWDLMu8tPS33c9vdVoJVuGI4+3LTNhwDwK+r2IhhjEDIAjG8ELQ4qN8AH20I4pMXGk4brYiV4ysQZPYphxNVEM5HRBw/PFDdFoM9BTs3eVHDW9ZJMk5v2Vyhe/R971hKTUWObgStZ5wisINoNeO+iecMD6x31k70/xeGVvTn40ApxOnw9JOV+mRQN772w6MC2F+X5Z968qDQAKd/F/xg5rqtf1FLtdZHbQNaDomQxHv+SPMdJv019ZJzUxWVRd/2mY25pWKf8bva5sHJGoyHh38sObpY/wUD9pw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GmFRSLA9nNldh/+JrLsL8VNAG5HwvNv1XF129AwYSVQ=;
 b=RhSPNFbPzyVbgmOXuqS/jyf7prnoP7MiQvPSVImZWp+uQg81We7Jgty+if9MZJDa/wj49WpvuOT7ljOkEK/uowbSrDqgHjRlAGvpe9Ys7HeRMK7Iz6vPSJNtRIeRS2nigfQz9FXcbWDgJCKGjToJjRAMak0rx0b0ljiO7lUcxtI=
Date: Tue, 10 Nov 2020 12:30:02 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, "Andrew
 Cooper" <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>, George Dunlap
	<George.Dunlap@eu.citrix.com>
Subject: Re: [PATCH 3/5] x86/p2m: suppress audit_p2m hook when possible
Message-ID: <20201110113002.maox2v2w6om4lmik@Air-de-Roger>
References: <29d30de1-2a8d-aee2-d3c3-331758766fc9@suse.com>
 <722cf75e-da6a-49c5-472a-898796c9030e@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <722cf75e-da6a-49c5-472a-898796c9030e@suse.com>
X-ClientProxiedBy: LO2P265CA0365.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:a3::17) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: cac03f18-fe99-4974-2944-08d8856bfa08
X-MS-TrafficTypeDiagnostic: DM6PR03MB5338:
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM6PR03MB533811B284361C1830DCA5828FE90@DM6PR03MB5338.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3513;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: h00qtaTWA0QD6Exz77iwApjiCojiQPwelqQye4UggmWF0tJ24qW+ZxoIfGuElSToTCbp+wvCAcbflPWvhzLt8k69ZpPbqgKZdZkPtBo/PL9Tw/nXda7gXEUMmsklubE1sUpYs3CU+EAhmwUl4KMYihvWhZ8OjmlN5w4faReuGAc5yGScRkXcoBuX+FSFBabOBNk761GfPTtMCQYo8/PrP5sS93bqfet7h/XjtM5/hrWFNjUQGJjkxnav7EPHfL7QiZcnn73gumsAD1CCDQUVXGazaS7tpslm1OsQo047a7J3q758e/y2ZgqYgY1xVC4gBEioSfNT6W/dW9OH31d3Lw==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(7916004)(4636009)(39860400002)(396003)(376002)(346002)(136003)(366004)(1076003)(6486002)(186003)(4744005)(5660300002)(6496006)(54906003)(8936002)(26005)(107886003)(16526019)(6916009)(316002)(956004)(2906002)(85182001)(66476007)(8676002)(478600001)(86362001)(4326008)(6666004)(9686003)(66946007)(33716001)(66556008);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: GWmaIT7Kql9Wy8O5sfqpJJZWS+mb2m7BRcvQvlQrsXeeDJPNUwZCUwVIPTODXqmB2z5kImfOs40ZOUkRXxI5KS1mbTbZUZnRrJ0QhhsrjQolxUV6YVCSg6ehW0b+LnK+kWW/UepmJD/qIUVuH+DxZ8XioWstoKzfdthw+3SV6A2hVJTUfhu/MUcyISCtAymetFdrwQrdrMeD/r0ShDv7AXx99x9UCV4b8Rh5LenxrZRlqTp9mtb8j2wVeDzuu7rRLwPbMMZda9YOHLzWI3vKYly2RqC3Dj8m1Y0nixJaAQgbCpjXFFCjgSukyCZIWW0k50HnmgBZsXYzLG7l1C8FXEYoX82y41f2QNUAPOP0I3UWRYj6O348Et+6sjpNols6fdk3TTTo7GolhE4nGXn51tFpx7BZyKWpvHukqxPNzPgkdd834JQfqNSyDlre1Q52IHrHkGlGhLKYlNJHoHxRPZOIAqZRYUC/uaUFL0c1wIjvS6hyxNLBGHw8DjIuWmTjw/GjuFS+auIvm40mmw0djXZkjv780LnLBH5mG3o2WmH2oLxGcqesgDbxoPt0jFGu5gzTpgy83JdO6HZPFU9cg1NnixFzulHvBIKgmYOVXQ3E9Je7uYr/Y3Kkr8kmD9K+GwgDK2xEdYtdC8Ax2ZXT8tQAqgSipQ3iI/kBMGnMXynd5f56bkjinwgl0TbgB0QW/62ajxEOSalKQ5W9gEseSUVqo+INkv1Vdp4lm6E1dwyKc9KHxZ/f2SfmIWaA0ZxprLVtFjIRtl4saOXIJGAoPMAIwVyS5WhTJzm2h2Xi738fO42w93VNe9Bl9OiIJU6HWUWoxVvbqTLjmT4v6Ic2FBPwqkx9cntmosSO8qoUAHkBhdGFW4vrLed0uLoFeeejZInvpGo9bfebGtCGdSWqkA==
X-MS-Exchange-CrossTenant-Network-Message-Id: cac03f18-fe99-4974-2944-08d8856bfa08
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Nov 2020 11:30:07.6854
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lJcNMBOT7o5sOseQxhbbmdxL6BZghzHbGtA78GtevX7+7X73wWBsdoYI2534OyvQoVKU+8StTwm1bXxVMKvpCA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB5338
X-OriginatorOrg: citrix.com

On Wed, Oct 28, 2020 at 10:23:42AM +0100, Jan Beulich wrote:
> When P2M_AUDIT is false, it's unused, so instead of having a dangling
> NULL pointer sit there, omit the field altogether.
> 
> Instead of adding "#if P2M_AUDIT && defined(CONFIG_HVM)" in even more
> places, fold the latter part right into the definition of P2M_AUDIT.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Acked-by: Roger Pau Monné <roger.pau@citrix.com>

Thanks, Roger.

