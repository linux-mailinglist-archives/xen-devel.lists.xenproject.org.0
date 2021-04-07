Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CB0D3572C6
	for <lists+xen-devel@lfdr.de>; Wed,  7 Apr 2021 19:09:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.106860.204301 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lUBfH-0007k5-Lr; Wed, 07 Apr 2021 17:08:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 106860.204301; Wed, 07 Apr 2021 17:08:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lUBfH-0007jg-ID; Wed, 07 Apr 2021 17:08:27 +0000
Received: by outflank-mailman (input) for mailman id 106860;
 Wed, 07 Apr 2021 17:08:26 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gkPf=JE=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1lUBfG-0007jb-31
 for xen-devel@lists.xenproject.org; Wed, 07 Apr 2021 17:08:26 +0000
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id cbfa56ed-c6eb-481c-a05f-f745abc74e39;
 Wed, 07 Apr 2021 17:08:24 +0000 (UTC)
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
X-Inumbo-ID: cbfa56ed-c6eb-481c-a05f-f745abc74e39
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1617815304;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=tbSlAJqOVZnqbsZhPkwjBxLWhtyYW006qpspGifeuK4=;
  b=VzyHpxbZ7BohurAphOJZ5s2KLqNBo8/78vgooOyqzu6MR236dR655QkI
   dJGRXCeLauzAmxo3OE+WVaILIbg5j9FjLdQeNh0t6YzPOp3LQ+pA89gKo
   8p8a5rcBfo1G0KGEaP4lbdPT9O8YRTs6LFyDVcmjAskzwTMMp28q2j/Nz
   I=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: +yK8MahubZTKYZIfQ+5pyGsqL3/2/B47gRyY3Ez6oDsM5LakjEsQkWn01sbtixu3NvKcmcaTyb
 SfQzNGdKJa7jczmxdqQIdWLrjrhuhYkBUXgrovwvqtnKcZ70TwFiOEh2c0BgjsesYtkoIMX/mm
 CSM9n/tKzif7IP8VEK5l5lry/iDb3Ws+/ZqmeTATNOzKwHWGfeQxNACWfrHJNwEpPKBwdV6jme
 AOqxOkcksQpWzvJnvtJ+YP9n6LRNKfojaN0/toDUy+g8RY/VRj5pAjxQQ0DeQWQc4gLEfMJ2E2
 HvE=
X-SBRS: 5.2
X-MesageID: 41095372
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:O6U+z65nZsoYSd3R5QPXwRqBI+orLtY04lQ7vn1ZYQBJc8Ceis
 CllOka0xixszoKRHQ8g7m7VZWoa3m0z/5IyKMWOqqvWxSjhXuwIOhZnO/f6hDDOwm7zO5S0q
 98b7NzYeebMXFWhdv3iTPWL/8O29+CmZrHuc7771NACT5ncLth6QARMHf/LmRTSBNdDZQ0UL
 qwj/A3xAaIQngcYsSlCnRtZYGqy+Hjr576fQUAQycu9Qjmt1iVwYTnGBuV1Ap2aUIs/Z4e9w
 H+8jDR1+GYnNyQjjTd0GLS6Jo+oqqd9vJzQPaip+JQBjHligODbJlsVbuYrFkO0Z2SwWdvqv
 bgiVMNONly9mPwcwiO0GTQ8jil6hkCwTvDzkKVmnTqq8CRfkNFN+Nxwbh3XzGczmhIhqAa7I
 t7m1i3mrASMDb72AP63NTMXwECrDvOnVMS1dQ9olYabZETc9Zq3Ooi1XIQKrgsNgTg5rsqFe
 F/Zfusnsp+QBehY3fVsnIH+q3UYl0DWhOPQk01sseIyTRhnHdg00sCxMAE901wjK4Adw==
X-IronPort-AV: E=Sophos;i="5.82,203,1613451600"; 
   d="scan'208";a="41095372"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OELFKVpETRdmoTs5NWwcAJSOG+VKa0KU29dBzzbvMUUiSUzyIivVGv30Nv6UbjBiUaWjqTIkq9HKvqfBCsSZoGHQ8zaLuEIlfhSr0pjQYHa8tGF/E3cjd07eZqZI2OaCsjeg6LZDWJNyJshFtxdDYEp8hVWsAWWJk4qYZDHsS72nqa7yN3kWbR3RFklMVZjSY/dXAMYd/6XwKNT9bEQEnqrRPE8Wj0eUOuxdzCdGXf++bb7VBy1JQqgR5Aq22JTuc+WxZq09cxkvhGMwZo0wb+zlsn3NC+12YU4uaW2GVBWvF7H4uglVF8o0jqPiREXRUueDwPcmoMZfslCfUXBxuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1t7+AMStHmLCsfi6rt8034ry140rhrQQSlgl5JVwRCY=;
 b=KX3i3gko5+h0PyzXgisjKT5gIsYZKDKDUtW1Pb9tgdfcNZ7goTTf2O+Z2jnS2YBSL0xSMCsgjoWn+va4Li1kzrXULkH4tCpN+D/Rqr3fIQJCpk6DPPfN2v4qeEYDYSZvKpEoww0N85+h0ZnDLrZhIly43a4/4grCW1ICCcKzf9HIr9xMdQt95DioE9JGq4QSAsWCqbIgO+Hdpr42idKOf5kgCKGpyjQdnqAVjo9PB5p8qGClLopQa2XN6kmXbe8IUBYIPkR9GIPkYTto+PfD+Y2tT65fOKDQErZRvLcqCNE4G4w/+dY9Wj3glc15m8NXPv6n17/SZvJj3c+b3bh4cg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1t7+AMStHmLCsfi6rt8034ry140rhrQQSlgl5JVwRCY=;
 b=PE4JIQyldn013X1S/qMdeIOcCtezShyz6ryAwu9+20gYr/1Kv+xidSleOw/4IUD9x3/BVxnv0gKFOI3EzWYMFUbSX0is6LhkEP6bNjc46DyKbFdehOOI03TPXtWkg9NTRj04dxTxNSmsyP0cgtSxAuTgaWe59TGp6tfM2lbENS4=
Date: Wed, 7 Apr 2021 19:08:06 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
	<xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v3 06/11] x86/hvm: allowing registering EOI callbacks for
 GSIs
Message-ID: <YG3m9nW6xPeL7MPr@Air-de-Roger>
References: <20210331103303.79705-1-roger.pau@citrix.com>
 <20210331103303.79705-7-roger.pau@citrix.com>
 <a57f0f75-341d-e6e1-823c-2083184a8f08@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <a57f0f75-341d-e6e1-823c-2083184a8f08@suse.com>
X-ClientProxiedBy: MR2P264CA0146.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:1::9)
 To DS7PR03MB5608.namprd03.prod.outlook.com (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d6e8e3da-1321-4a8d-2a69-08d8f9e7bd33
X-MS-TrafficTypeDiagnostic: DM6PR03MB4601:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM6PR03MB460113C195B263C67E2FBC6F8F759@DM6PR03MB4601.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ai3ChuNhW4idI6+luDeG+NSb4S3Mq9+sOTSrLphs/nKyKnEm+wivZV0wlRlL1tgV05BsY8VBQDd+82Hwt33ChOvaOzj9SY6l+zNxqKOm5S4YggYjlXxH+6WArsdln3brxaQ1Qw+ThAuNrgh5PR+QVHZ40eBOgynPIPxiAq0GOSh/yuEhV15SYK1X3HYute5ZpaoDXqWF5QaFlffQNavtwHJnTQv0DNn/bJStxdkailY8BkN7dLYmWdqgk80Rntydom9MuMhJwGDERr8ZMDz3K6XVjDZF+4GFlXxvtLRhDkyOUg0iWzuizrkPEkNQLPvMpVnAvbauz76SmdQ5yDI5PyRCwg6iF8rF5EMwiSaHbzNbjwUaigFshVspgHKJZ6IQ1ChVXUU2sfwYxZOGCf/ps1mthiw9XiRKnWWtYm6eJoMNRk9yi8AYDAQl8ZxDxmeSwwzK6WLhPN63pcgl/ljLTvhoPUTe/pQOrlfoBc6r8oodEHEzzgAu2odKKy2zQTxSXt2XeMWVYgzYgi5B6hpDkGnTa8TQXr2rkF4SJdfOZhjcQrUrrNY1D6yiKNvPMW/cbiaWR+dmEUh2RQDS6S8FU/lEZIwJJhQcXWOIkoiwM+SIILO3RDQNtB6B/xTZ6q2TZTPej8n0BaJvHF+bx0TXXkbpYxo0A0Rjfdhrs8g3hXw=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(7916004)(4636009)(366004)(346002)(376002)(39860400002)(396003)(136003)(33716001)(16526019)(83380400001)(4326008)(186003)(5660300002)(9686003)(66476007)(66556008)(66946007)(6666004)(26005)(2906002)(86362001)(478600001)(6496006)(53546011)(6916009)(8936002)(8676002)(54906003)(956004)(316002)(6486002)(85182001)(38100700001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?djNtUklNci9rVFJVcC9UTmtEUlpTbi9iZ3prbCtiU2JvcHlXSDUxZ2hraDV2?=
 =?utf-8?B?QmFSOStrOGtzSDVVbUpnc1l2Z1RzeWpDcGhyT1ZLTitqVGZGekpHM3djc3Rs?=
 =?utf-8?B?L0ZrbDdJYmtKZlpyTDlZMXRiTS9xOGRqRXZrcG9GV25hNFo3SzF5WHdSdXc3?=
 =?utf-8?B?S0plRm9iTDBaNWZkZXA1ZjRHNnlWS04xcjI5UmltNmxFZmovRmFOU25rQVJy?=
 =?utf-8?B?MlNsbjNtTHJVSEw0S0dIajkxMnpIaHVGWnMzd2tEcHNyRHcwTzVKNFN2ZzBu?=
 =?utf-8?B?YVFjYWlOUWdCQzQzZkQwN2JSVjVoQzRCL0lvblFLMGI2Ky9qMFpKdmNKZnV6?=
 =?utf-8?B?OE1CQ21HTkJRbTY2eno5WUtvdjI1akJsSmJrNEw4N28rQk10Ti9TZUJvZWZi?=
 =?utf-8?B?bmJvcUpUYVFXUzNodkJDaFhoK1JtcmphU1V1YkR0Vmp3N2JUOVVZWVVxL2hl?=
 =?utf-8?B?b2M5eWd5YW9GMVJUVFZoT1dScTEyK2FobFVGSVptakt3NTlBK0dNV1l4dEoy?=
 =?utf-8?B?dk9ZZkQ2dEwzeGwxSVplS3Yya0p0RGN4VVYxRHNCcGNDK0VCUWNwTkxETVFR?=
 =?utf-8?B?S0dqY054VXhyMHY2b2R5SEtxQjdRWk1hQ2loSzJaeWhBR0hkSlFSZENrYzF4?=
 =?utf-8?B?U2lTRUNUaWY3YkVxSHRsMndqQVRDNzBBdDE5UTdPRlVQajBJTzlTYUxVTXF2?=
 =?utf-8?B?MzBQbG4wNjExeTArSEY5RlhibTJtdithdXI4dGdPQVJTaHBYbkxHdERTTS9v?=
 =?utf-8?B?TkxzTzRhdVRPMjhud1ROUC92KzlLODZ0SWw1UEZLeHB1bCtSK1dib0hFV0Vj?=
 =?utf-8?B?ZTlpa1hONkwwWHA2aWt3b2FGc2Z6VHN1VjYvTGQxeUpVTGpTaFAvODVJRFhB?=
 =?utf-8?B?VFo0R1kwMjVMMFNmOTdPOEhpOS9nRngrWHhxV3RqYUhFbzNaZzBpUTBSSVZH?=
 =?utf-8?B?NVlvdEhJWWhHcUxOcXdlRjB3UWV3K1dhdGwrL0hHa0lKQzR3S2hzSWdFSHZM?=
 =?utf-8?B?U1pZYWxkVGtBT0g4ZE91UzV6ZWpIK3dwWnpkc1BUdFcrMFRVSW85NzFVY3Ju?=
 =?utf-8?B?bDVrQitxSzFYVDJXMnhyN2lySkNnQzVMZ3I5YW9pbVlKYTNxOTQwL2hWZHJ6?=
 =?utf-8?B?dCtQMk9DaXUwQ3ZRNjFxWjhDS0RZeVNrcUM4bi9yc2N6ZURtZzhhTGE4cmNk?=
 =?utf-8?B?cTBxYzJ4bW9SeE43WWFMbmJ3N1MxWWNla2dDZmxUSG4ydi90SUk1NDZkYVJR?=
 =?utf-8?B?WGhVMGt1ajdlR2Z4RnlHcmV2TEtZZkJpUE9qWDJsblA2UjhRNEdFYzJ6SWRk?=
 =?utf-8?B?b1RwSGZmM3pPcEtTdGRNYS9pN3Rwd3hVNEtJL1hFRkpQc0xqOXRtYlFsNU5v?=
 =?utf-8?B?NG1kYVRNZk1acGZXTVFpelp3K3pIOGlEVW5hYWZ1a3RIY0tsa1lheDRNU1A4?=
 =?utf-8?B?M0xCR1ZPVEF6OEZIWEZhbXhrTUdwd0wyVnZ1QmRuZnJSdjhPaURZWHVKN3NM?=
 =?utf-8?B?WUFvQWRjTm5KbFFqak45eVdnTXY1cWd0ZEQralRUYmNNRlIwdWRlWlp3OGlX?=
 =?utf-8?B?WmQxQW43Y0hiZDgrTmdwUU9oWklNMFBIMGFrbUxoOXB2UlI5OG8zTHJZVXBX?=
 =?utf-8?B?VnJZZmtpRlVXcG9vTTFkeEdyellabVQzbWY0cm1uV3Bmbm5sTEN4Tko0bFRw?=
 =?utf-8?B?ZzNGOEk2OHdMTlFaR0haME1BVlhGSWFjL0R2T2dtUUpNMHUvMUoxT3EwTnJW?=
 =?utf-8?Q?lI7C+L2UTXGPQsjDYeoxGGPfiPv2Xe///fz+yCZ?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d6e8e3da-1321-4a8d-2a69-08d8f9e7bd33
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Apr 2021 17:08:18.1024
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ukLwh+eZKwo8J1wx/lSjwt4UrnMISKDgYhFvUbgZrhe2LTBWvY/Fjtvj3R7jdxakBRPp4rR1bKIN7GStk3a4QQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB4601
X-OriginatorOrg: citrix.com

On Wed, Apr 07, 2021 at 05:51:14PM +0200, Jan Beulich wrote:
> On 31.03.2021 12:32, Roger Pau Monne wrote:
> > --- a/xen/arch/x86/hvm/irq.c
> > +++ b/xen/arch/x86/hvm/irq.c
> > +void hvm_gsi_execute_callbacks(unsigned int gsi)
> > +{
> > +    struct hvm_irq *hvm_irq = hvm_domain_irq(current->domain);
> > +    struct hvm_gsi_eoi_callback *cb;
> > +
> > +    read_lock(&hvm_irq->gsi_callbacks_lock);
> > +    list_for_each_entry ( cb, &hvm_irq->gsi_callbacks[gsi], list )
> > +        cb->callback(gsi, cb->data);
> > +    read_unlock(&hvm_irq->gsi_callbacks_lock);
> > +}
> 
> Just as an observation (for now at least) - holding the lock here
> means the callbacks cannot re-register themselves.

Well, re-registering would be weird, as the callback is not
unregistered after execution. What is likely more relevant is that the
callback cannot unregister itself. I haven't found a need for this so
far, so I think it's fine.

> > +bool hvm_gsi_has_callbacks(const struct domain *d, unsigned int gsi)
> > +{
> > +    struct hvm_irq *hvm_irq = hvm_domain_irq(d);
> > +    bool has_callbacks;
> > +
> > +    read_lock(&hvm_irq->gsi_callbacks_lock);
> > +    has_callbacks = !list_empty(&hvm_irq->gsi_callbacks[gsi]);
> > +    read_unlock(&hvm_irq->gsi_callbacks_lock);
> > +
> > +    return has_callbacks;
> > +}
> 
> What use is this function? Its result is stale by the time the
> caller can look at it, as you've dropped the lock.

Right, that function is only used to decide whether the vIOAPIC needs
to register an EOI callback when injecting a vector to the vlapic. The
workflow is to first register a callback with the vIOAPIC and
afterwards inject an interrupt which will trigger the callback
logic.

Playing with the callback registration while interrupts can be
injected will likely result in a malfunction of the device that relies
on those callbacks, but that's to be expected anyway when playing such
games.

That said multiple users sharing a vIOAPIC pin should be fine as long
as they follow the logic above: always register a callback before
attempting to inject an interrupt.

> > @@ -421,13 +423,25 @@ static void eoi_callback(unsigned int vector, void *data)
> >              if ( is_iommu_enabled(d) )
> >              {
> >                  spin_unlock(&d->arch.hvm.irq_lock);
> > -                hvm_dpci_eoi(vioapic->base_gsi + pin);
> > +                hvm_dpci_eoi(gsi);
> >                  spin_lock(&d->arch.hvm.irq_lock);
> >              }
> >  
> > +            /*
> > +             * Callbacks don't expect to be executed with any lock held, so
> > +             * drop the lock that protects the vIO-APIC fields from changing.
> > +             *
> > +             * Note that the redirection entry itself cannot go away, so upon
> > +             * retaking the lock we only need to avoid making assumptions on
> > +             * redirection entry field values (ie: recheck the IRR field).
> > +             */
> > +            spin_unlock(&d->arch.hvm.irq_lock);
> > +            hvm_gsi_execute_callbacks(gsi);
> > +            spin_lock(&d->arch.hvm.irq_lock);
> 
> The two pairs of unlock / re-lock want folding, I think - there's
> no point causing extra contention on the lock here.

The chunk above will go away on the next patch - there's no need to
fold it as it makes the following patch less clear.

> > @@ -443,7 +457,8 @@ static void ioapic_inj_irq(
> >      struct vlapic *target,
> >      uint8_t vector,
> >      uint8_t trig_mode,
> > -    uint8_t delivery_mode)
> > +    uint8_t delivery_mode,
> > +    bool callback)
> >  {
> >      HVM_DBG_LOG(DBG_LEVEL_IOAPIC, "irq %d trig %d deliv %d",
> >                  vector, trig_mode, delivery_mode);
> > @@ -452,7 +467,7 @@ static void ioapic_inj_irq(
> >             (delivery_mode == dest_LowestPrio));
> >  
> >      vlapic_set_irq_callback(target, vector, trig_mode,
> > -                            trig_mode ? eoi_callback : NULL, NULL);
> > +                            callback ? eoi_callback : NULL, NULL);
> 
> I think you'd better use trig_mode || callback here and ...
> 
> > @@ -466,6 +481,7 @@ static void vioapic_deliver(struct hvm_vioapic *vioapic, unsigned int pin)
> >      struct vlapic *target;
> >      struct vcpu *v;
> >      unsigned int irq = vioapic->base_gsi + pin;
> > +    bool callback = trig_mode || hvm_gsi_has_callbacks(d, irq);
> >  
> >      ASSERT(spin_is_locked(&d->arch.hvm.irq_lock));
> >  
> > @@ -492,7 +508,8 @@ static void vioapic_deliver(struct hvm_vioapic *vioapic, unsigned int pin)
> >              target = vlapic_lowest_prio(d, NULL, 0, dest, dest_mode);
> >          if ( target != NULL )
> >          {
> > -            ioapic_inj_irq(vioapic, target, vector, trig_mode, delivery_mode);
> > +            ioapic_inj_irq(vioapic, target, vector, trig_mode, delivery_mode,
> > +                           callback);
> 
> ... invoke hvm_gsi_has_callbacks() right here and ...
> 
> > @@ -507,7 +524,7 @@ static void vioapic_deliver(struct hvm_vioapic *vioapic, unsigned int pin)
> >          for_each_vcpu ( d, v )
> >              if ( vlapic_match_dest(vcpu_vlapic(v), NULL, 0, dest, dest_mode) )
> >                  ioapic_inj_irq(vioapic, vcpu_vlapic(v), vector, trig_mode,
> > -                               delivery_mode);
> > +                               delivery_mode, callback);
> 
> ... here, avoiding to call the function when you don't need the
> result.

I think there's a slim chance of not needing to use the callback local
variable, and hence didn't consider limiting it. I can do, but I'm
unsure this will bring any real benefit while making the code more
complex IMO.

Thanks, Roger.

