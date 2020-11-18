Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B07CC2B7A8C
	for <lists+xen-devel@lfdr.de>; Wed, 18 Nov 2020 10:44:41 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.29680.59283 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kfK0s-000060-Ct; Wed, 18 Nov 2020 09:44:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 29680.59283; Wed, 18 Nov 2020 09:44:30 +0000
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
	id 1kfK0s-00005a-9h; Wed, 18 Nov 2020 09:44:30 +0000
Received: by outflank-mailman (input) for mailman id 29680;
 Wed, 18 Nov 2020 09:44:29 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=4dya=EY=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1kfK0q-00005R-Tm
 for xen-devel@lists.xenproject.org; Wed, 18 Nov 2020 09:44:28 +0000
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 80b480db-5905-4325-aecc-695260f3d9bd;
 Wed, 18 Nov 2020 09:44:27 +0000 (UTC)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=4dya=EY=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
	id 1kfK0q-00005R-Tm
	for xen-devel@lists.xenproject.org; Wed, 18 Nov 2020 09:44:28 +0000
X-Inumbo-ID: 80b480db-5905-4325-aecc-695260f3d9bd
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 80b480db-5905-4325-aecc-695260f3d9bd;
	Wed, 18 Nov 2020 09:44:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1605692667;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=YmgK07ayw2G2NeZFVI4DRzYRO/KslHxB77nroqGzB2E=;
  b=D0whtFxdBGfQQgoFD4QNCzyKyz+7JMEaHfjWD2tgOYev5gkxbx+rj3qQ
   a7RF14s468VrHc6nGvLOyk+u+7i7aCXqVLKCCreddrgaDG1m892sk73ti
   0F3Up7e9i5U/fb+IXr6ePKVHjL3myWin3aHT8cmipp3gwxdCLDoueLBYW
   8=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: RirDLYARrrYEuaqzJ1YOVEfk0AMqtKljaAf4jhY618h5YNuoFnlQL7otdQnVsKOW0XKBWro6M7
 iJjgcl3SVTfSiAslNoQZk593alDN4pKoTcOLxpi3Of8g3cseGb01VHA7vzN44/wD1Nbp4XGoXN
 l+h3dqxKrT6XWcSn2CBfS96ejRDHtrXJ9HnaaIEyQIZSMchLVdS6c+qBbzlGhZ46PI/NtSeqgD
 wftbcHvJI64ZByGPVnffa1TbVy2sXFvmVQMdGy6LBRjfMA4KTyFsWr1CEJAMQVJlNmcTDPoX4D
 U8E=
X-SBRS: None
X-MesageID: 31754309
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.77,486,1596513600"; 
   d="scan'208";a="31754309"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QPih3etPREROqIgGukkt7Ip4PO6Np1tYHMeah8EU/Mb7colNFqsyKK58f+YtDNaC/kfjMnqoP88Jwy33qdPxX2+6bEc/KxAyv6/Qom71sHmOgEg+rV/i2pMUwBktdRd/BXKiJrLo3WX9UTNN/2MaZSe6aQ9K8gQocPwCk922baIkpHXUhy9djDUgqB93MDbGEQw/T6IBg1qKvb0Sg9ohrUAzLAh9gX/zR5z19n18UhGNLaHDI4ZonzU7cSkWxwWiMhcUDZyxEL0ph7mwppy7BotIhLqh/9JpR/f4pQCqhTQkyEFMdV4RoUO2DOvr9s9PqbhPjZJhHuX9Hvo6qanlGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wmmAjf5SK5orqrFLjr6dR7kJQ5lZWnqbrI0k43wG11M=;
 b=FNHix/PUFOv73OecbWPLq5hKt80BuceZPQRSbpYf+jGL3WhwfnQ7qNiLfAKvSP5o6tWRO99gpPkzA9EpUMRbF4hggVYXOUsmMfUNWzu1AOZl0L2CsVRGhaNR0mcRYYtp9NGXnmqsdmTh2+QdMEfMCCBx4qvdfoPHVbjsWlXuT5IdRjTM4Wh3p6PsZ8F4TEWwW1W75vlwzXm2z1jDhzOni7EFP5vkvBe1Mf8insUy8IXS1Da8Yltx9/K/DW4HQXv8b5l0L12qYieESvzBHhUDRoHVk4gszd8QD3gGz+AapaJkupJjpcOX0mkcHm0u2jH0TbPa8ZLxk27ncYxd791+8w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wmmAjf5SK5orqrFLjr6dR7kJQ5lZWnqbrI0k43wG11M=;
 b=EQltPWBpvcrafz8XAvCjTtb1Ed0DFyUNF20qFGZwnB5BsiDsEXo0XSvopjyIaRPSGjCOEvW0gMuyIN0weFaW29wzKA/yJU86bHhcq7bHdBUz7vAwmJE2+DkjkQOcTAXFU+jfqnvK2qkCdwVkfK1X0AIce7QFMx4oZ+0b9k7JFV4=
Date: Wed, 18 Nov 2020 10:44:09 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, "Andrew
 Cooper" <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>, George Dunlap
	<George.Dunlap@eu.citrix.com>, Tim Deegan <tim@xen.org>
Subject: Re: [PATCH 2/5] x86/p2m: collapse the two ->write_p2m_entry() hooks
Message-ID: <20201118094409.kpw2uie6kpb3gso4@Air-de-Roger>
References: <29d30de1-2a8d-aee2-d3c3-331758766fc9@suse.com>
 <b26981d1-7a1a-2387-0640-574bdf11ceff@suse.com>
 <20201110110611.p3twf6rmy7qdlxa7@Air-de-Roger>
 <b4932c75-c9c4-1da0-2218-fe3cb959e2e2@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <b4932c75-c9c4-1da0-2218-fe3cb959e2e2@suse.com>
X-ClientProxiedBy: MR2P264CA0115.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:500:33::31) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 462ce6de-3fdd-4008-e2b3-08d88ba682cd
X-MS-TrafficTypeDiagnostic: DM5PR03MB2922:
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM5PR03MB29220E9F65DD7FC40ECDD7408FE10@DM5PR03MB2922.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: u5lBEeuQgxl6CRlAQt3huOMn/9H6pcwKBaVKq1xW+4eUZi1JMYgFYRO0EhFGGqhNg9eWInSvqdE7jSMOLOq6eML1QIyAQmt45k8YuBSCBHI9fDOKIfrCzbd+/yDDZXI8CINCrkm374BV6QmaGc01fQq1FNF66miDYodJQWW6x/yrU/OhfZlrrTUZ8hRdlE5vyptdkCVBy313cxdhvlbJwLTtF9U3lMf/tD4VXlAiYHiFZ7x4HvH6+1WXyo+CqJ+aNaf/Su/IB57w9exz28zo54jqUGRLp+4Mjl9KmDGpU0fegN6PC93xqbPhOiHnBpfnVtm5Y/qSkSs85OneEwICCvrWp8VillmSMI7IG7ax5zuJKFPk4okiPn6jB/C+/cwK
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(7916004)(4636009)(366004)(346002)(376002)(396003)(39850400004)(136003)(1076003)(4326008)(6916009)(6486002)(53546011)(5660300002)(85182001)(316002)(26005)(186003)(33716001)(956004)(16526019)(86362001)(66946007)(6666004)(54906003)(9686003)(478600001)(66556008)(8936002)(66476007)(83380400001)(6496006)(2906002)(8676002)(70780200001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: obHOiJhFv8VLJVl55PnxLA0P0AdWvC0H1VbJmbzWTtW1IMfvO8X+WGvWWyZ/Vb0JcLSTFeYigbz9iH+Faqd63qArwXt/Pj3BjTHPIaBJyhUqmgKMi5Q1Vl2ZkAy7GxoB98+XNO+/f73+cNr0kx1bDKYXyNSBwuZb4CIyCy6qMeI/W/Mb3PpYJ8N8c4/5Ub5JQU420X5MDQNzGgehZ5hpgGLRkQElQO0t0C5z0wV32loNtOdu7ACYJ95C0Ymcafi6FhkME9u+ktqBJD8B90n5h13G4yicEej/uDQe8tIqXZGFLDuiPXCue37MXEhGqz9Zt1vpPl/+EoZ8AmOilU/EO0JazlR7iV0c5qcpJPapWBhhx99WXTl7JLxVrlTgXRqg8NpvBIybLan7+l2VrkvbWtdKlblAX9R8/diIu42Ph13hHDPpZ7Ugvt3LziwL0gQSq9ENghNpxGrT1UFbHZW4mQjxBsqDohP1aWk64ZR+WQLsX60Ekh/7CSe3Yv+9Lv0msM69Sit6fy9O4Bl43r9laZTmFegVsn2p4ncYOSEBWVikr8IqqO68bExFV0TopXdngh0ObgzTOQzkJGdqvLPot00ankbWN+wOyRYQ2SJ+QtHSYXcP9PeEWwjGnCiAdCmeA4VbcH5JoXgsML1VdDn0GcxX/M4gC7HVr9hgR08pBs03gUFHL1LdkNlYanfTe/5Gi3zOx8vH9fCUPrrnnb+KBXGthQrYhB5Ng0QdhdqUhCcW4c7gm97MFXd4X+jZOKWvAsSaEf5nYEZ6PE1O9I+m7CmuKNbVS7UcHicwGovC0ZvI/rrAhOIc7VC8/QLy0UBQB+IGmka2cU03jlDgTWMyzmRWAx4tzQMxhdTJbnsctR6/7i+GElqIFPotnJcwPHmcNLt8i7EF66BoeEsan29IqQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: 462ce6de-3fdd-4008-e2b3-08d88ba682cd
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2020 09:44:15.0568
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tGKuGSuPcxE++h1OvAa5Ch/Cm1JIdqedOEMqU/kpa0a5kD/KwFIR05/+TsXw+RxetC3glHqOiWtkyzU22GlPEw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR03MB2922
X-OriginatorOrg: citrix.com

On Tue, Nov 10, 2020 at 02:51:11PM +0100, Jan Beulich wrote:
> On 10.11.2020 12:06, Roger Pau Monné wrote:
> > On Wed, Oct 28, 2020 at 10:22:58AM +0100, Jan Beulich wrote:
> >> @@ -1132,7 +1132,13 @@ void p2m_pt_init(struct p2m_domain *p2m)
> >>      p2m->recalc = do_recalc;
> >>      p2m->change_entry_type_global = p2m_pt_change_entry_type_global;
> >>      p2m->change_entry_type_range = p2m_pt_change_entry_type_range;
> >> -    p2m->write_p2m_entry = write_p2m_entry;
> >> +
> >> +    /* Still too early to use paging_mode_hap(). */
> >> +    if ( hap_enabled(p2m->domain) )
> >> +        hap_p2m_init(p2m);
> >> +    else if ( IS_ENABLED(CONFIG_SHADOW_PAGING) )
> >> +        shadow_p2m_init(p2m);
> > 
> > There's already some logic in p2m_initialise that checks for
> > hap_enabled for EPT specific initialization. Do you think you could
> > move this there so that it's more contained?
> > 
> > I think having the initialization condition sprinkled all over the
> > different functions makes the logic more complicated to follow.
> > 
> > Also, should hap_p2m_init be limited to HAP and PT, as opposed to HAP
> > and EPT which doesn't use the helper AFAICT?
> 
> It is limited to HAP and PT - we're in p2m_pt_init() here. This is
> also why I don't want to move it to e.g. p2m_initialise(), as that
> would be the wrong layer.

All those sub-initializations make the code slightly harder to follow,
but I guess it's fine if we want to keep it layered in this way.

> > Maybe it would be clearer to unify shadow_write_p2m_entry with
> > hap_write_p2m_entry and call it p2m_pt_write_p2m_entry to match the
> > rest of the p2m PT helpers?
> 
> This looks to go along the lines of what I'd put up as a post-
> commit-message remark in "x86/p2m: collapse the two
> ->write_p2m_entry() hooks". The nested handler is perhaps the
> bigger problem with such merging, plus it would feel a little like
> a layering violation (which is why I did put up the question
> instead of doing it right away).

Right, we could look into it on further patches:

Acked-by: Roger Pau Monné <roger.pau@citrix.com>

Thanks, Roger.

