Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 05D272FF1D8
	for <lists+xen-devel@lfdr.de>; Thu, 21 Jan 2021 18:27:44 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.72284.130030 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l2dk0-0003j4-Hi; Thu, 21 Jan 2021 17:27:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 72284.130030; Thu, 21 Jan 2021 17:27:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l2dk0-0003iK-CU; Thu, 21 Jan 2021 17:27:28 +0000
Received: by outflank-mailman (input) for mailman id 72284;
 Thu, 21 Jan 2021 17:27:27 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=aMxC=GY=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1l2djz-0003gZ-9H
 for xen-devel@lists.xenproject.org; Thu, 21 Jan 2021 17:27:27 +0000
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id cdd199c5-0a6b-401c-8975-40b609c338d4;
 Thu, 21 Jan 2021 17:27:25 +0000 (UTC)
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
X-Inumbo-ID: cdd199c5-0a6b-401c-8975-40b609c338d4
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1611250045;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=FSTeabBJe7owD2TJFK+TV91DBagN741XDIzUAnpm07M=;
  b=EbawaV5wmXteJ2BIJqGD8uvp0lOVPR+LSPhIqQ5zB7bdGBQ1HjzpqQ9i
   OPUcKt0xx5KYkXKTMRzONCWzKy+O5uBhwcg+ZktRHaiLYOwccC2UxmktV
   mM5OGHgFg5LqCmHhKqF+93VzGMODLCjRKckh7hIFFwdupXCzkcRerk9xh
   o=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: hdnBSiTDYhxK8ASIB/EWfaJSIJKeY8asVCJ/W6TEVb1t2TCZ9IYF+soJzoyyRCvsNrvvlGkinY
 P7rj3NH/KiRyOKTlP97lM6eof0yPJgNSIfTWD3N6zp//AaSuYT4iOfBUNC4+5W6AIkQoYHfokN
 nm+KKrs0PuGTdo45nPNuBD1oK8fwdaTsfAri1M0yulS+YYIvUNCUJ6QPCLH6MECYXuOmHYDuM9
 F/BUR89NIUnYWfRGFwR7Ni0Kp2ziN/m5EcOEKL5Old3jboAOVNMP3pz+0gafJv13TQw4ioeEOy
 1SE=
X-SBRS: 5.2
X-MesageID: 36887758
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.79,364,1602561600"; 
   d="scan'208";a="36887758"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Qu5mEVLggGInWJmsB0S0Pksb4ZREfZz3hP79TAPt7Kz/FLWWYQRCC3avXa3oC5J0JHQLSYqCmdbWWLSKYWzhXM/P/SQOBichrdXs7mKyvJAhRz985Z2ddfMorEgSTahdoXnPfCgOuOPjb2VhBQFPu+NcGjumDsOdEG35goaTMTJAhfcgUpbCAhnPPFByDgD7NLAub12DS8a1ysGSvw8nxh2g0Y9SRHuFwcqza/I5k6zkrMpZh6BK6ucunnIfxZ8DIkYb4+4j0pkTsvfuxtE7HQIHJ+gu+3BA/iCFUxj1zRqG0/lH2VmffY5Pby8EOlL+GGmqhhhs28FGfASe4zID/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6x/nKLlVZNIv+D59+I1UEtjPy9lAlVvCZLxweSM1qnk=;
 b=E8oj1XQFornmLeC6G7qECCNb2uTDmEFZjcLFt7qLRriHFWYtBoo3QQn+RwzaLMAM5IdIdnXljlWC//HoxJpX7wnjOoi/0bRgLSewmnm3dGBewU70x/TCQ66MmsvEZ4X+kR0rZuTg/AaU3hryxun44gdvbwv43q3NnbdBslpS1zNG7krMGoKbvtok4z4aTkNLxubo1QD0IqaAX7/5BeNRRJ8Imi5vRVuxHLXTKzowajiH80xCkj81SohHO73YC51t8mUg3asvZtPQrgHr35JhXVIV8O1Ojx7YGE4kUOvE9GVgIaX02fLSZSvbWLFyMU6SWEqWw2mk9s8tgZ+92/VLEA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6x/nKLlVZNIv+D59+I1UEtjPy9lAlVvCZLxweSM1qnk=;
 b=vnwdGfSiRTl2rI9vTRTxGdIp6fRMJ+LwXrZpPNsujRrOenGH1Mcxt0sRE0sFz2x1ySmx6o6KYptSfSRwnXN5XrmUwZ4EeldEGW6ZnW1RRAbXshqw9apPasjyhP2+8qTgCMO05aRIYgh8hEBFYch35mWYGR6O7PvQk3pPnrGzK+8=
Date: Thu, 21 Jan 2021 18:27:16 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
	<xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v2 1/4] x86/vioapic: check IRR before attempting to
 inject interrupt after EOI
Message-ID: <20210121172716.kdfepuukimrylyru@Air-de-Roger>
References: <20210115142820.35224-1-roger.pau@citrix.com>
 <20210115142820.35224-2-roger.pau@citrix.com>
 <1cdc469f-5ccf-6c0c-157c-31abca5f089d@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1cdc469f-5ccf-6c0c-157c-31abca5f089d@suse.com>
X-ClientProxiedBy: MR2P264CA0079.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:500:32::19) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b882df61-96fd-45e8-5436-08d8be31cfd7
X-MS-TrafficTypeDiagnostic: DM5PR03MB2556:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM5PR03MB25560F6AF8DE493AFF35D6018FA10@DM5PR03MB2556.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: TRjSWAigzYCb1spuWcpF85r2ijNXz221SoqjJ0w1B+MzulEN5cEpf7RWqY6L4SL0hfnizL/MPd2vMTfjMEfcaF4pUzsM0W/g/IK2gVwzQ0ewFhy7oxzO9m66c3vaZZfKPPCNS7abxdYTi8QRRpJD0HlQSRTp/i9YgSjim9xtMx6ByYy1lPy6VOAi0/lOOkGm63bafdQ/tC//wcBL4IUUKvY3/8uny8JBbJBJ+2ETkO5n400jWanLRbADhVVVxawRroiJOmXoJ4454RhaKqdzHqHs1VMccH7m5vDH4O1U9NYvcGC6YFuHonIxEkAUevpeofe8XNpdZ4XYYjeFsm8x8q9HUTV0GAGxW+jp4EDA/ogv+4+s2f2cp0QSNbFFLR9F1odHfRJ+w+fpp6TsOrjk1g==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(7916004)(4636009)(396003)(39860400002)(376002)(136003)(346002)(366004)(86362001)(3716004)(9686003)(26005)(6486002)(8676002)(6916009)(478600001)(956004)(16526019)(53546011)(186003)(2906002)(85182001)(8936002)(83380400001)(66946007)(33716001)(316002)(1076003)(5660300002)(6496006)(54906003)(4326008)(66476007)(66556008)(6666004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?RHBLcTFxbkNaaE1SWXBTczdZdTQwSWxsUnJLV2QvTmhORzY2RnpKVVNuQlN2?=
 =?utf-8?B?dG1qMlVpSWNoRWJlRDAwVWZsRjZkUWZBOGZnOUloQ0lERGtyTFFEZVJxS1FQ?=
 =?utf-8?B?elNSTTk0dUtvVU54S24wbE45a0dFR29qdVpwUW9lWnNRaHg1K25BSWFOS0NN?=
 =?utf-8?B?elVHRG94UloxTUhsaTdTWTN3WWhFcStmbWN1aCt0c1hLSFFDTjFmS1VlYVZz?=
 =?utf-8?B?TlVaZkY4NCtpYTd3YnZUbjVWMk5tclBxTEs0emNvQzB2ajVvU1AwU2h2cVhh?=
 =?utf-8?B?TUhQY2t2WkRDOTU5eTI0NE9obklOcVNLM1FCNFFFZHovSVQyRU9CeUlQdFVQ?=
 =?utf-8?B?WmZhbFVoQlJnaktyQmVaKzkxR3NWQk5MNFVrZ0JVZkVrZ0hmZzk1U1BmWUto?=
 =?utf-8?B?a25jcjBKdmRzc2ovdW53VGIzSFJtTHNTOHU1TjVFUkN6S0JQc2N6bDVJTWhh?=
 =?utf-8?B?SG51ZHY1ZHpQUFcrSnhpSWhWektlUU1qVTFMdjVlUmxYMGJ0Z1dkSndJV2dq?=
 =?utf-8?B?TUNhUm52YlIvVzhpemRNR1gzOUpjanZoVm1CL3Z2ejVyZXFMUUc1MEFQUUNK?=
 =?utf-8?B?a0FnQlVzMDFWc0ViNU1OTUFFTjdHK0Y1NUNZcWVWZFNlbGUwTVd4b0w1dlgr?=
 =?utf-8?B?ZWQ3SnhxZVBNSCs1cEJhdjVFYUxCMWVjQ3pkcWpjOGJYZjMrKzJxcFlYQWpU?=
 =?utf-8?B?dSt3K3g1Y3pyYWYwdnk0VFJNamZLWkZKTVc0Q1ZCeU9FelV6dWt1bjkrajEv?=
 =?utf-8?B?MXpiMWx0b1ZyZjJwZGE3dU41Z1A2RlMyZENEMnY1VnRVbG9aVDlDR1AwK1ow?=
 =?utf-8?B?eGdTYlo2ZkN4OEZlcHpaSjFRc3E1b1NNZnlRNXR2eXdORDBMdnpjMm1TQjR6?=
 =?utf-8?B?V1loWDVoOUswdzhpQW9HSTdVSFZidVljRTVueDdYcVBDOUNsazVaZVFtd0lG?=
 =?utf-8?B?VCtyd3dxVzZ6NWdSZWFLMXJyK2grQU5rZDZ5TnBKN1NNTmhCdUpYeEpoWk03?=
 =?utf-8?B?QmJxQnBCV0d3by8vSHVKNTdhUjgxcFpGVkhjYmd6NnBNMEJMNlRWRkxJTVFT?=
 =?utf-8?B?WTNNZjVlTDQ2YmFGUHZFWi9za1FXcUcvWFRmQVhZcXdGVHljSG05OE83TFpF?=
 =?utf-8?B?M3Q3bk81SlpmOXlXc2Y5ZEFMc3NyeHhSdU44TWw0blFKenYxNnpKSEM4Wi9u?=
 =?utf-8?B?TXBmVWZqVjNieXdlNUx6Y2NzYlhGSHNNOG9nN0xtTGZRM2RKeVp4UjhpN3Zr?=
 =?utf-8?B?ay9jNDZoWHFYTWVLdE5Ucm1PU2tjVFF3eGRWRTlxVTBXWDRDTlV1N0RPbmdQ?=
 =?utf-8?Q?cdvR+RpTS0qK2MyfAhwff8h4zVkoPmnlH3?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b882df61-96fd-45e8-5436-08d8be31cfd7
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jan 2021 17:27:22.4835
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3DpkRQ0XoayXHiNnsbTkduP1WJYs/zhNWcWsOUFn5dszN5VH//YYzPEVxPDkcJPVvYrxSuTJkSkVUTFIqyi9gw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR03MB2556
X-OriginatorOrg: citrix.com

On Thu, Jan 21, 2021 at 05:03:51PM +0100, Jan Beulich wrote:
> On 15.01.2021 15:28, Roger Pau Monne wrote:
> > In vioapic_update_EOI the irq_lock will be dropped in order to forward
> > the EOI to the dpci handler, so there's a window between clearing IRR
> > and checking if the line is asserted where IRR can change behind our
> > back.
> > 
> > Fix this by checking whether IRR is set before attempting to inject a
> > new interrupt.
> > 
> > Fixes: 06e3f8f2766 ('vt-d: Do dpci eoi outside of irq_lock.')
> > Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> 
> It's fine this way, so
> Reviewed-by: Jan Beulich <jbeulich@suse.com>
> but how about a slightly different change:
> 
> > --- a/xen/arch/x86/hvm/vioapic.c
> > +++ b/xen/arch/x86/hvm/vioapic.c
> > @@ -526,7 +526,7 @@ void vioapic_update_EOI(struct domain *d, u8 vector)
> >              }
> >  
> >              if ( (ent->fields.trig_mode == VIOAPIC_LEVEL_TRIG) &&
> > -                 !ent->fields.mask &&
> > +                 !ent->fields.mask && !ent->fields.remote_irr &&
> >                   hvm_irq->gsi_assert_count[vioapic->base_gsi + pin] )
> >              {
> >                  ent->fields.remote_irr = 1;
> 
> The check is only needed if the lock was dropped intermediately,
> which happens only conditionally. So an alternative would seem
> to be
> 
>             if ( is_iommu_enabled(d) )
>             {
>                 spin_unlock(&d->arch.hvm.irq_lock);
>                 hvm_dpci_eoi(d, vioapic->base_gsi + pin, ent);
>                 spin_lock(&d->arch.hvm.irq_lock);
> 
>                 if ( ent->fields.remote_irr )
>                     continue;
>             }
> 
> in the code immediately above. Thoughts?

IMO that seems more dangerous as if new code is added below that chunk
that wouldn't depend on the value of IRR it might get skipped
unintentionally, as it's possible to oversight that the loop is
short-circuited here.

Thanks, Roger.

