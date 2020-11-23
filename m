Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AF9202C1156
	for <lists+xen-devel@lfdr.de>; Mon, 23 Nov 2020 18:06:42 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.34874.66145 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1khFIF-0002Hm-OG; Mon, 23 Nov 2020 17:06:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 34874.66145; Mon, 23 Nov 2020 17:06:23 +0000
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
	id 1khFIF-0002H9-JW; Mon, 23 Nov 2020 17:06:23 +0000
Received: by outflank-mailman (input) for mailman id 34874;
 Mon, 23 Nov 2020 17:06:22 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/SOx=E5=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1khFIE-0002Gk-11
 for xen-devel@lists.xenproject.org; Mon, 23 Nov 2020 17:06:22 +0000
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id bd7b5ca9-072e-4126-9b2b-042ca67fce6c;
 Mon, 23 Nov 2020 17:06:20 +0000 (UTC)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=/SOx=E5=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
	id 1khFIE-0002Gk-11
	for xen-devel@lists.xenproject.org; Mon, 23 Nov 2020 17:06:22 +0000
X-Inumbo-ID: bd7b5ca9-072e-4126-9b2b-042ca67fce6c
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id bd7b5ca9-072e-4126-9b2b-042ca67fce6c;
	Mon, 23 Nov 2020 17:06:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1606151180;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=hVzk91sE/ycAQyMp9sp9SsR7dFa6lWuJDB8t4pwhI0k=;
  b=R5MXi5FWts8T0d7QLOKlHIpUuiH29Xpi9JOOEIZTGE9uP6VWPhia2ly+
   f78xrLOSuIng8zXdLS2kb+dY5rHllIZPDb5l2Mb32WzCCVEYarHSFqb6c
   KsUckrKt4l2cwqP1QnIlu7WJrC/AliOs9IOMHpjHmnCBcoRDjE4JjL58f
   I=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: k/RH6pOlc7qwYfdZdpvTXOmLD/L9pWCGcRuWRJ6POCh57kARWR8OmH77mHIlz11L/e6ckqB943
 CV1MsEoFb5j3YPIBIVKCtIBAgNfNrd36meS42Jz/L9O8Hub5peZvy2O0/4YgjUiE4PkviOp3uW
 m3YVN8co9gmEugxjmmFBr238SomsSzey12Ofdkdxo0b9/7hhByz/X9uK01aYMqwf4/NtvsU8Db
 4OdRePx6wZNVL6UCoMSKIK6Jz7ZJvE1b/GKR9IduIZY1xBG3XWbNgPbcMDwEUAXH8cVcqwyI0L
 nLA=
X-SBRS: None
X-MesageID: 32106154
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.78,363,1599537600"; 
   d="scan'208";a="32106154"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TXrTd1JsZEs0sM6HzVoMBwiwRxXGuk5OhhrxLMpNDptISylPd4VZtxyEecAdngTBc5Xq9w2PVe9+kj605hJ9xWedq+JYarlJevKVh5wakdE1qdvqahdqb0i6vDA9OHniK973nyzDevOKy7e65/kE/yyneII0pEU99+HBRXF4Ctl5hC588J5nlgbe6RrtfVU/2wgwUWj2zFLPyg5eBySvo7pyKWGq/lUm7W+x6qNLU/rO8DNNVM/9xPk2EMD3asaHti7HxSIflGPM+z/cMB5f3AaAcj6H8EsjDobpmD+Uc3VBYh+5Q4WRsUX/lfYKQ2o+vHKa8CdBDQl1dv7TGkDnmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=asUtqppFQO1pDKssJig/X4Cohpfx++RKZRdzC55z5hk=;
 b=iwSPFmSyXPWvzSicgYzmngRj8jkzWhGap+e4JuolymSF07C7HDcY8ZC4iplLtKsItJZCm9YKAlILfIO3jqrJ5wvIDdptdNVZfGxz8E9lzNVFdqzGEINU53hN7zlsGm2uonWwTPC2lw1P0Wv1TOyHilueTKbGreDcnVJC5Z0Gc0VbgWzskBpsib9flEcXBLjzbjivL1dxoJPKZ0NgpIZfg8qfWMfohg6DH5hj0Dxm1Lc5/LLth+BB8nN+cjGXoaXr3k9HCXJotwA0IbqtIrRJLYjwo5UQZlQggw2l5J6qELlMSm1MZNe+2/5qPRls9pcD/QTe7fIvhpDDOTWWwZegPA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=asUtqppFQO1pDKssJig/X4Cohpfx++RKZRdzC55z5hk=;
 b=AjMI4uNBc/Cf83rnEMx3HRUAnOoTVkSOrjBiZLkrzU9BCyu5PSCK+5FF2ZE1DzgsL61loaXZKmjgTbmXsNX1mBhfuiRlViFLbWHqXkoNO739SmNv2k7qGr5UYphXqv2mWGR6RepmDGG413qGuEtghIDknOJP1NxSH8ORo/WQGwA=
Date: Mon, 23 Nov 2020 18:06:10 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Manuel Bouyer <bouyer@antioche.eu.org>
CC: Jan Beulich <jbeulich@suse.com>, <xen-devel@lists.xenproject.org>
Subject: Re: NetBSD dom0 PVH: hardware interrupts stalls
Message-ID: <20201123170610.kzfxvcgkdkvh3ex4@Air-de-Roger>
References: <20201120082855.5z4cibcd5djlwmgp@Air-de-Roger>
 <20201120085249.GA1508@antioche.eu.org>
 <97f371a9-00fe-33fe-8923-c247f44f9af6@suse.com>
 <20201120092754.GH1508@antioche.eu.org>
 <20904a6a-ac64-755d-d228-4c49faf66fb5@suse.com>
 <20201120103824.GJ1508@antioche.eu.org>
 <20201123095713.orfpg72r73m7f46n@Air-de-Roger>
 <20201123113241.GE2520@antioche.eu.org>
 <20201123125112.q3zqb4e5nk6jg4hw@Air-de-Roger>
 <20201123143150.GG2520@antioche.eu.org>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20201123143150.GG2520@antioche.eu.org>
X-ClientProxiedBy: MR2P264CA0019.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:500:1::31) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2c1a49a1-52be-4998-a676-08d88fd216d1
X-MS-TrafficTypeDiagnostic: DM6PR03MB3739:
X-Microsoft-Antispam-PRVS: <DM6PR03MB3739A2EBAE6AE6164C158CB68FFC0@DM6PR03MB3739.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: CkK/MF5qLUoOXFCsvTgxP+k5+SlxRXkU+sR37uylOlxCrb/eSJ1e4+3lc9A/DuAJywSqai7z5xrYn/E9PVH/DIwZcOIeLYFgiYvOfRwZhoTUj/eTJYn3N3LuRZzeIazYez85QzL9NXMq74ACmOQ99wnKvCxJCTAEn8FogRuonbpuX3fojUG5VZ1nmo+SYYTpo99Y4RISKNsoDU3QMtRXVE0pOiiSqbLraMmuo0sgeuEPChLroAKK8nNXvzK5yIufUlSXiymsGMWu5LitlxFhTRzc23eq7olQ3/XdbiYs9ds01GrlDRckf4kY5rTS3WFHvdj0H9DSz8HvAvVVSVyTG4K/0tdcBWQdEVhqzxvjuXi6h2hNI+SuTbkGnYbOB08+dX/K0PewULXTZarHqmYTvA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(7916004)(4636009)(396003)(366004)(39860400002)(136003)(346002)(376002)(9686003)(86362001)(83380400001)(316002)(6486002)(1076003)(6916009)(5660300002)(186003)(956004)(966005)(16526019)(478600001)(26005)(66476007)(66556008)(66946007)(4326008)(8936002)(8676002)(6496006)(2906002)(6666004)(85182001)(33716001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: HVwc/PFgxsHRGsKVENhFNvCZh2Dq1MmcGxW3V0Gb7KYEeCK5LlUkVUxUUIIxLpWO29BltL+1KhWFNF+6QlnOq2ZAqhQvhxQudCu7Y2GY+gkiB7P1419i/z58cAUAe4Nkrb8LCo5OQmGaeuEaFkBpHbn7YoOgTGa43SmlUi8JjT/yXKq1WNNv84cGwLbmBaId7v7uqBu+7wM9p3ptZArGnkFxTGWme6ADhTjs14bYY1Hj4rPQFD4waOs9dyz5FIyi8VVcTozlEcxbL6/0+oHkprfABJbaW/qaODVbwFMtLslaKdmNRutWHDJB1/OWhKKVMcIoDrY9PtgsuuapnD5WfEStZbfczeTMMPsii69XtvOfV/owEREr0kWxdZgx2lWjBYuK0oF38meN2GW9MF2L/hOINUrggyWvhvnTT/OeWvq8WehWQpLUqc8naTRMjEH8+5Ccg4Ou+yEk8ST1jw8iiuHy3tgXglXXsZ/tWKvC5tWHFQ9bSp88bga7Sc0BRZ6V5cMSE62HRZS3RIcR/ciHCZeaazZXpMUlJpgMxvvxQL6R/uQe8RY7N6zrdzIZbznDtfDhLKfyufI8o08IGKyvsTI25oPHkDHypTlgSeM6jWVg1cWibIjP7K6AjCpqKT5x+g9bWvYkWIuKLb6uoz/aI5iLJuSyvdHFjOAeGU+VHpihw3XLPq3qNw/yptr9Ig8zgPOjhogd9u7GwL1rDj0edgUINJ10zJSLovT7HIT9j4xlAef7kSmyswWdjuxUbtRfO9uyn6PzBEjhD6sjPJxqqpz0tyofJnjJx+b+XneoT0XVolp4W4h/HN7kj0ZRvT2wNUFsO5k1sTt+xvMVu4/cpfyJ/mix2EbLf/VvnwpsWA2Jt1PhZwRtGDqMdpnMIC0MAY/l0Gl+jWkDm+gNmVhMBQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: 2c1a49a1-52be-4998-a676-08d88fd216d1
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Nov 2020 17:06:16.3688
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: U2gbw10tY0M3CyOq4sFQwhE45ybumTAMO9n54K6qVLjJ9d/00a69jVu9UGK8uEs282Ji8jWLPTE6vkQpIRGVaA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB3739
X-OriginatorOrg: citrix.com

On Mon, Nov 23, 2020 at 03:31:50PM +0100, Manuel Bouyer wrote:
> On Mon, Nov 23, 2020 at 01:51:12PM +0100, Roger Pau Monné wrote:
> > Hm, yes, it's quite weird. Do you know whether a NetBSD kernel can be
> > multibooted from pxelinux with Xen? I would like to see if I can
> > reproduce this myself.
> 
> Yes, if Xen+linux can boot, Xen+netbsd should boot too.
> In a previous mail I wrote:
> In case it helps, I put by Xen and netbsd kernels at
> http://www-soc.lip6.fr/~bouyer/netbsd-dom0-pvh/
> I boot it from the NetBSD boot loader with:
> menu=Boot Xen PVH:load /netbsd-test console=com0 root=dk0 -vx; multiboot /xen-te
> st.gz dom0_mem=1024M console=com2 com2=57600,8n1 loglvl=all guest_loglvl=all gnt
> tab_max_nr_frames=64 dom0=pvh iommu=debug
> I guess with grub this would be
> kernel /xen-test.gz dom0_mem=1024M console=com2 com2=57600,8n1 loglvl=all guest_
> loglvl=all gnttab_max_nr_frames=64 dom0=pvh iommu=debug
> module /netbsd-test console=com0 root=dk0 -vx
> 
> (yes, com2 for xen and com0 for netbsd, that's not a bug :)
> You can enter the NetBSD debugger with
> +++++
> you can then enter commands, lile
> sh ev /i
> to see the interrupt counters
> 
> > 
> > I have the following patch also which will print a warning message
> > when GSI 34 is injected from hardware or when Xen performs an EOI
> > (either from a time out or when reacting to a guest one). I would
> > expect at least the interrupt injection one to trigger together with
> > the existing message.
> 
> It's quite verbose. I put the full log at
> http://www-soc.lip6.fr/~bouyer/xen-log4.txt

OK, I'm afraid this is likely too verbose and messes with the timings.

I've been looking (again) into the code, and I found something weird
that I think could be related to the issue you are seeing, but haven't
managed to try to boot the NetBSD kernel provided in order to assert
whether it solves the issue or not (or even whether I'm able to
repro it). Would you mind giving the patch below a try?

Thanks, Roger.
---8<---
diff --git a/xen/drivers/passthrough/io.c b/xen/drivers/passthrough/io.c
index 6b1305a3e5..ebd6c8e933 100644
--- a/xen/drivers/passthrough/io.c
+++ b/xen/drivers/passthrough/io.c
@@ -174,7 +174,6 @@ static void pt_irq_time_out(void *data)
          * In the identity mapped case the EOI can also be done now, this way
          * the iteration over the list of domain pirqs is avoided.
          */
-        hvm_gsi_deassert(irq_map->dom, dpci_pirq(irq_map)->pirq);
         irq_map->flags |= HVM_IRQ_DPCI_EOI_LATCH;
         pt_irq_guest_eoi(irq_map->dom, irq_map, NULL);
         spin_unlock(&irq_map->dom->event_lock);


