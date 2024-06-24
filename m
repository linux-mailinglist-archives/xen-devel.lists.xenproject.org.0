Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DC26914A27
	for <lists+xen-devel@lfdr.de>; Mon, 24 Jun 2024 14:33:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.746554.1153646 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sLiso-0000ww-3o; Mon, 24 Jun 2024 12:33:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 746554.1153646; Mon, 24 Jun 2024 12:33:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sLiso-0000vS-0z; Mon, 24 Jun 2024 12:33:18 +0000
Received: by outflank-mailman (input) for mailman id 746554;
 Mon, 24 Jun 2024 12:33:16 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ZTmZ=N2=bounce.vates.tech=bounce-md_30504962.66796788.v1-d58da3792a2e46e584d132937eda4056@srs-se1.protection.inumbo.net>)
 id 1sLism-0000vK-Lv
 for xen-devel@lists.xenproject.org; Mon, 24 Jun 2024 12:33:16 +0000
Received: from mail134-3.atl141.mandrillapp.com
 (mail134-3.atl141.mandrillapp.com [198.2.134.3])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ec947485-3225-11ef-b4bb-af5377834399;
 Mon, 24 Jun 2024 14:33:14 +0200 (CEST)
Received: from pmta10.mandrill.prod.atl01.rsglab.com (localhost [127.0.0.1])
 by mail134-3.atl141.mandrillapp.com (Mailchimp) with ESMTP id
 4W76nN3H6rzDRHxQ8
 for <xen-devel@lists.xenproject.org>; Mon, 24 Jun 2024 12:33:12 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 d58da3792a2e46e584d132937eda4056; Mon, 24 Jun 2024 12:33:12 +0000
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
X-Inumbo-ID: ec947485-3225-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1719232392; x=1719492892;
	bh=pwBR3KA6BhYJX7ge26Cw/EkOnRSGlcYsjSqQ3E5ejtA=;
	h=From:Subject:To:Cc:Message-Id:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=G6WkQZF61bJn0gJol7tuDMU+L9cxVQgBGSvoiQFlaA3/XqXaJRokn06L4skBAvSUY
	 yLA5N213qoTHoWcgJaaFIqE3ZPTuXgOV+u6OIDjTNCs53EWOZ0EIP2nw8iy4p3tcyz
	 16vjbKQS/sxE1Km+T86B9t4QrDEriaORHGB5pZ+0ztzcbqjWEJau7ekCgivyOmT9vb
	 ykstGNw/2peZLPA/V5f0M69+E8+9rqFYv+TVAh/aH74N+Q4OkZLqKHt/CymkW/+m58
	 yZIHmb29LOZTYbBeXWDceAkoBrTGdpCMGrbnhokmMO6OT6oo8wGIczCj1oBwcNcKH/
	 tkB96aeC8QWhA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1719232392; x=1719492892; i=anthony.perard@vates.tech;
	bh=pwBR3KA6BhYJX7ge26Cw/EkOnRSGlcYsjSqQ3E5ejtA=;
	h=From:Subject:To:Cc:Message-Id:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=uDS3Y1uDUUE49iLczrV6Vz1I/VsnVhLZfAc1leyDFYux/wYSBTcC1Q2hKCslvLcgI
	 qqFVS99klr7nCBTbrKdsV3qBXMIBbuXG/b6JQV+zpkgSGJ4RUHRKiJ6HzBNrtoTI+5
	 P9z5h33NZ1bhZu2ZPCCvnLSxvV4E3DeogIRXQ27nXOcpJiHFrb0C/QugIZtHocfN5e
	 nCGIi2CeVAzNmkVhS0YCskJuq2srais3S7EQrx4qArqanzpEepRopya89Sk7piiLxV
	 FR2Cuubs3AGkgivslTF7A+DrllwJTBBMeuhNzOnG7A2oyDcM3skA52mhNoZ1MR6RK3
	 PwW8AU6/xTr6A==
From: Anthony PERARD <anthony.perard@vates.tech>
Subject: =?utf-8?Q?Re:=20[XEN=20PATCH=20v10=205/5]=20domctl:=20Add=20XEN=5FDOMCTL=5Fgsi=5Fpermission=20to=20grant=20gsi?=
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1719232384688
To: "Chen, Jiqian" <Jiqian.Chen@amd.com>
Cc: Jan Beulich <jbeulich@suse.com>, Keir Fraser <keir@xensource.com>, Andrew Cooper <andrew.cooper3@citrix.com>, =?utf-8?Q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>, Wei Liu <wl@xen.org>, George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Juergen Gross <jgross@suse.com>, "Daniel P . Smith" <dpsmith@apertussolutions.com>, "Hildebrand, Stewart" <Stewart.Hildebrand@amd.com>, "Huang, Ray" <Ray.Huang@amd.com>, xen-devel@lists.xenproject.org
Message-Id: <Znlnf2CHxCFadcIX@l14>
References: <20240617090035.839640-1-Jiqian.Chen@amd.com> <20240617090035.839640-6-Jiqian.Chen@amd.com> <b4b6cbcd-dd71-44da-aea8-6a4a170d73d5@suse.com> <BL1PR12MB584916579E2C16C6C9F86D1FE7CE2@BL1PR12MB5849.namprd12.prod.outlook.com> <b6beb3f3-9c33-4d4c-a607-ca0eba76f049@suse.com> <BL1PR12MB58493479F9EF4E56E9CB814FE7C82@BL1PR12MB5849.namprd12.prod.outlook.com> <96ba4e66-5d33-4c39-b733-790e7996332f@suse.com> <BL1PR12MB58493B55E074243D356B0CAAE7C92@BL1PR12MB5849.namprd12.prod.outlook.com>
In-Reply-To: <BL1PR12MB58493B55E074243D356B0CAAE7C92@BL1PR12MB5849.namprd12.prod.outlook.com>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.d58da3792a2e46e584d132937eda4056?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20240624:md
Date: Mon, 24 Jun 2024 12:33:12 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

On Fri, Jun 21, 2024 at 08:20:55AM +0000, Chen, Jiqian wrote:
> On 2024/6/20 18:42, Jan Beulich wrote:
> > On 20.06.2024 11:40, Chen, Jiqian wrote:
> >> On 2024/6/18 17:23, Jan Beulich wrote:
> >>> On 18.06.2024 10:23, Chen, Jiqian wrote:
> >>>> On 2024/6/17 23:32, Jan Beulich wrote:
> >>>>> On 17.06.2024 11:00, Jiqian Chen wrote:
> >>>>>> @@ -1516,14 +1519,39 @@ static void pci_add_dm_done(libxl__egc *egc,
> >>>>>>              rc = ERROR_FAIL;
> >>>>>>              goto out;
> >>>>>>          }
> >>>>>> -        r = xc_domain_irq_permission(ctx->xch, domid, irq, 1);
> >>>>>> +#ifdef CONFIG_X86
> >>>>>> +        /* If dom0 doesn't have PIRQs, need to use xc_domain_gsi_permission */
> >>>>>> +        r = xc_domain_getinfo_single(ctx->xch, 0, &info);
> >>>>>
> >>>>> Hard-coded 0 is imposing limitations. Ideally you would use DOMID_SELF, but
> >>>>> I didn't check if that can be used with the underlying hypercall(s). Otherwise
> >> From the commit 10ef7a91b5a8cb8c58903c60e2dd16ed490b3bcf, DOMID_SELF is not allowed for XEN_DOMCTL_getdomaininfo.
> >> And now XEN_DOMCTL_getdomaininfo gets domain through rcu_lock_domain_by_id.
> >>
> >>>>> you want to pass the actual domid of the local domain here.
> >> What is the local domain here?
> > 
> > The domain your code is running in.
> > 
> >> What is method for me to get its domid?
> > 
> > I hope there's an available function in one of the libraries to do that.
> I didn't find relate function.
> Hi Anthony, do you know?

Yes, I managed to find:
LIBXL_TOOLSTACK_DOMID
That's the value you can use instead of "0" do designate dom0.
(That was harder than necessary to find.)

Cheers,

-- 

Anthony Perard | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech

