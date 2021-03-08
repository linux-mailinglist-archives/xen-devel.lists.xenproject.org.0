Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0054A3310CB
	for <lists+xen-devel@lfdr.de>; Mon,  8 Mar 2021 15:31:37 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.94978.179088 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lJGuv-0002yX-6S; Mon, 08 Mar 2021 14:31:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 94978.179088; Mon, 08 Mar 2021 14:31:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lJGuv-0002y7-2i; Mon, 08 Mar 2021 14:31:29 +0000
Received: by outflank-mailman (input) for mailman id 94978;
 Mon, 08 Mar 2021 14:31:27 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=QSVd=IG=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1lJGut-0002y1-Ol
 for xen-devel@lists.xenproject.org; Mon, 08 Mar 2021 14:31:27 +0000
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id cc59eb84-4328-41ed-ba10-5786d5b1c7ae;
 Mon, 08 Mar 2021 14:31:26 +0000 (UTC)
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
X-Inumbo-ID: cc59eb84-4328-41ed-ba10-5786d5b1c7ae
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1615213886;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=mWN3spQ59wAH3sbB2qM3oeD6NUs3Q3h3kF0fyOdYMZU=;
  b=JqCzgfJQoh+gdNT/O0gq71pC1c0eoTs7S0rOOx81uXi67zOUBnmlWhDX
   IvQmq80lMDxFXo7Y6ZBTOaSxa9f1mBvesm/82BlVCo9ba8U2eGNY6NuTK
   y0lDqiEO0+WTg42irD0HxwPpjL+TdD4q1yY1eFr41UKQxTUt/6Lmhzmfp
   Q=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: PzLq33xz9an6GQUv3BMNSxCw9kcT0W7yXnY/FBvuSKYNdyBiMlguqJqFZnfMuOuSbwNB37tMHf
 PmIrSGcot4F5imP7TWQ5YmSkWN4INbXYlCipOi9zZO+wkkcwlW4vvxaTYEYhs4Qpy961r9Qa/W
 5eM06Mr8aaPd+16YCsWy84LUTG7G2DQSf3a8u02L/S/eS6uA9eu3scaStrlunc3gOuYy+CcNcm
 owU/g7cYg33aF1FRnEsql/pnGeHepXntEfHvID7Rtu5uEgaz0n1XrDCDX9SUXy4GMeE6FFd8sV
 Ivc=
X-SBRS: 5.2
X-MesageID: 40183706
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.81,232,1610427600"; 
   d="scan'208";a="40183706"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CSYHXPI8ZReX43OqOZJFlSxOUjUg78O9spm9dZId90cv5+M6f63nRDruIrhUVtNwVyVYzWubLEcsGDL/mS+PAKa56vQP6lDXRlHpu8xJu28bWUrf+PBTVZbAD12RXPIkf/I/6t1ng1PIHDxxGz15DxF1+ZlME9hLXx8JUVZkEhGXpAJ+4h9/2PAO54eUFTVpq2zx1Ev9ZU04vkfU9w71IL0/kbAjx0ZRv64YdRzoGsu7ixevZxpbm9cT8BJQSSC452ojOpC0q7lXiJNttyNLxbKbL96utKI2KZkbEH7ZUJHvBQmM+utPq+L56W/CZsJ4OS1ZyShineFzpyxlj+9bSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4d3Dy42PE2eMQRfsKn+OZa7KCKiS9akaynW4wHVieqg=;
 b=ikY4LwpgbclGAMC1qTfKwYZeYIez4mIqYf/I8hvHTZy8qZNn/pQVdvGE8ZnpEUOg1FNCSIE6KjwNUVOj/IGCFVF/wU305mN8mwerPq8UcFO5xolr2buJR5cwnRR+4qXPEF0AuXDknMzR1TVI+50Y3K/BlL69G85a+Xw07GTQKblbkFoy/J8Zu50jKkUp3MWDkH7W4NXEu5r3O08Ukt4kEjrKO2ozdQoOj0yM6nMObEFFBg83wcNeBnjDwjZ3FmkcsB/xoZ2jYX2Bi3iLSyu+aHCwvIhbQi16KBDpBYw9FxUPnXeffxuMsKGpEHsF+HXBNKQZK5PxqHe3akk5Jgkm6A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4d3Dy42PE2eMQRfsKn+OZa7KCKiS9akaynW4wHVieqg=;
 b=XcASOlhHq3XfeZgZr+pCeAFO6HpaXyAqUhg0lxhuUbVrg2fZEfJPwjoQBNlm0ycN+X9FycUkD1ajFRsNS8O3XIe1whjtcyKT6Ahyh9vVxDkryeDJeMwx3ff2BnypfRR3PHPbrQ+8TC7AAz+qoOT3BNFFn6RVC+rv0ePWa0SKPLk=
Date: Mon, 8 Mar 2021 15:30:58 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>, Anthony PERARD
	<anthony.perard@citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Jun
 Nakajima <jun.nakajima@intel.com>, Kevin Tian <kevin.tian@intel.com>, Boris
 Ostrovsky <boris.ostrovsky@oracle.com>, <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v2 for-4.15] x86/msr: introduce an option for HVM relaxed
 rdmsr behavior
Message-ID: <YEY1IhUuo71xCGdH@Air-de-Roger>
References: <20210304144755.35891-1-roger.pau@citrix.com>
 <fc2e724b-bada-ded3-97b4-26e9a0f3ff4a@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <fc2e724b-bada-ded3-97b4-26e9a0f3ff4a@suse.com>
X-ClientProxiedBy: AM6PR10CA0104.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:209:8c::45) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 39bce5de-24dd-4abe-c57a-08d8e23ecdff
X-MS-TrafficTypeDiagnostic: DS7PR03MB5608:
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DS7PR03MB5608167B66169ED4F6D0A0CB8F939@DS7PR03MB5608.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:316;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: QybXIf5Sj4/u2pfrB9YzViQq8a3R0ctP2XamxhyGp7sFS2ym2v2yBY00WYRBfQA7GLjiTKjld+onmq4hgmTMlGDCOXocHqYgopwPwZMzk7kSCnHparR3D3+sUJsYg3JyrKi70Jz4jzoJH+9i5iq97lsK7kC6TNultccIMDod8cSGjkqQC0YjIxWaiIi+MRrDsanJU9rWIhsAej+eCOCVZEtB7mH3oiSgT/2DzD3MI/6RIFoOw+0/Pq9KZvqUCgFXRFzr7AxJelzm8s71wTQDvRLpkcRab4ge/wb1Ey6R16vllw+fPs8XAi6NoxE4Pb4QddExthWgisS8f+nSOsC3O9i/lw7oKULzO7fItcVmuolgI/P9Aw3Inpa2L127XTx3tPSIv4VnD0+ie2bbLSBfPgk3gABhTUIdkjRHT2jX8UAmNXie4KTwo2uqZgU/Gw9Bmq72M9fgackTVTQLT8vgeeyCyMMEh5LKKfCR8sLk50lglT11dP5cBRfgfQtNr/4o4aNDS2s2/g+AHVYvEExh7A==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(7916004)(4636009)(39860400002)(366004)(396003)(346002)(136003)(376002)(6916009)(478600001)(6666004)(5660300002)(6486002)(4326008)(33716001)(85182001)(66946007)(9686003)(186003)(956004)(66476007)(53546011)(66556008)(16526019)(8676002)(8936002)(86362001)(26005)(54906003)(6496006)(316002)(2906002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?N2V5eHpjSXNBQkpqcGJqTEh4K284WUptSm5MQVpHdzh5N1l1UnNaanRqeWEz?=
 =?utf-8?B?bk9OY1FzRmYvbkhORjhKcHNwVy9EVnMwSkMrRkR6M2RZejZjNU15cnQ3S0lx?=
 =?utf-8?B?TDRVM1JmUkYrNE05Ynl6dG1wbGpRSGUraUd0OEJCcFUrbGtCTFlBODJhVjBJ?=
 =?utf-8?B?Q0NvQ1hQRzg3NWN4VDhYWUlVdCtXMkxqMm1pT09sbnRBbHJFWjVpcmNiK3l1?=
 =?utf-8?B?MU9icnJ2WmlRVzVvSUN6Sk9PanFVOXI0RjV6YnIzMmZJUW5lRE9uazJtWms0?=
 =?utf-8?B?TU0rVzhvY1pjTXJiYTg1SzQ4SHFPNHRzT253cWt6cEdvd0lncVhkNDZWVXJ4?=
 =?utf-8?B?bDR2MVpkSWpZVm51VWJaUENXSDZ6Q0t4djZVV2xiVUgwWkhkblMzUXllMXBv?=
 =?utf-8?B?aFlMUHl6djNaOHFoZnZkcHU4N3RKVXdGK29xazlhYTdEdWtzSEFqZ0F2MGtR?=
 =?utf-8?B?K3JKVktZRDE2amJFNWpCYURhc1N0cERxeEdDcUR6VWtuU0ZEQ0xEMFRHR0Q3?=
 =?utf-8?B?VW5rN3ppMTVGaitpSWgwS0gxL3E2dTRaMnZ2WWYzZ0RQMThKR0x2Z2tYZENO?=
 =?utf-8?B?SEhWZkxzOXJnUWxzT0NhMS9FOC9UTmIyVXlQaStCSDliZk1McFJIZlJzVHpH?=
 =?utf-8?B?ajl4eFRDdXlqOFhMRUJZaERqeW1UMjl4NTBURHlFOTQ1cVF1NzZmMEZDRjVq?=
 =?utf-8?B?cVNlRUFYcFVsb2VGb1I1R3Zhcy9KOG5tKzVDUzYxTGw3NGV6WnFQZ1JPWFl2?=
 =?utf-8?B?aTVYUGkvVXlhWlBGUEY2RGxUR2c0ZGd1V0hKMzFoZzBzRDlxWEVEK0RweENS?=
 =?utf-8?B?clNxR010UUE0Y29vQnRLNXdaaXFZQ2xNWmJyWlRZR01mNjFORStWMzcwdlN4?=
 =?utf-8?B?RHBIcWRLTGt2N1BnNHRQVlNGMXlmNmxwQ0RHZ3hBRUROVGtpeW1xckxkNW52?=
 =?utf-8?B?cmlncFQ3MGVjbklJSnFVYzhRTWIydlZRUCtsWThpdVpoZTU3YWQ5TTdmZkdt?=
 =?utf-8?B?QVNYOHZjUG1YLzZMbXR5TEQ2OEIwczFVclllVjB6eW1yalFLUGg3a0svZG95?=
 =?utf-8?B?Q29OTWlCb0c1YWxuNWpDWUFhdTE0M0dGbUtzaGFEM2pmRWpDWnhyMHE0YmVn?=
 =?utf-8?B?RjVxc2ZBQkVMQjJoVXdzK0pTVGlmeGJIM0RGSjZsQ2VkNUtGTU9hdkxLanEr?=
 =?utf-8?B?TmVUUUI1SVRrTUQ3S2hZdnpTQVJTUnJCWGlseEo3QkNYZEhVSlNNWFdrZ3lr?=
 =?utf-8?B?WVV5OFdCRlgzNUNQV2xQWG5wNE1PbWZrUFRPSWQvTmlqM0haZGI2eWNCNTJH?=
 =?utf-8?B?ZndDRTZRNFFuc040ZVBHZWtkWFRYMWRaR0ZZK1IvQ2lWb0FCcnE2dzcvME5i?=
 =?utf-8?B?aGFPTjJqbHYxbC9EWmtjZHpLNytZb3F4ck9ENnFvQ3ZoUmZSK1llWXlUclVl?=
 =?utf-8?B?djlpeTJSSFVBeU94SzdWMWMwL25qQUxwRDg4SjFOL3NUMTViVDRreTFmSDFH?=
 =?utf-8?B?NklKWjZUZGp0Z3Ezbk83T3liaEZKMFBzdFpoZzRTYXV1R0thbzRzRmFEdU1E?=
 =?utf-8?B?M3NEZXcxQWp3aS9YdGlOanN5bTdiSitVOTAxRjJiVUZiL3VKSG5uRDVLNi9O?=
 =?utf-8?B?V3Rmdis1dkJIdy80MGROSisrSWhQbXBJWHM4ZG5hY1oxZEE4V252bnNGSko1?=
 =?utf-8?B?UEVnVjhVOHpZZEpCaDI3ZDg3dS8zcVJFZVFNZEZSSnZzc3p0SWZmWWF4eCtz?=
 =?utf-8?Q?kOlOhLNgSBf4V5/kD53tmjZElw2W6/So45ERXQ9?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 39bce5de-24dd-4abe-c57a-08d8e23ecdff
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Mar 2021 14:31:04.7016
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: g5Bz8JEUX5p3jp7P8XEQoMg7N+JCz86Sr2u8Vn7QV4B+89YMk34xgREFLH1IVi/gr5e5cdbChzanW2ym3LiW2g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR03MB5608
X-OriginatorOrg: citrix.com

On Fri, Mar 05, 2021 at 11:56:33AM +0100, Jan Beulich wrote:
> On 04.03.2021 15:47, Roger Pau Monne wrote:
> > --- a/xen/arch/x86/hvm/svm/svm.c
> > +++ b/xen/arch/x86/hvm/svm/svm.c
> > @@ -1795,6 +1795,7 @@ static int svm_msr_read_intercept(unsigned int msr, uint64_t *msr_content)
> >      const struct domain *d = v->domain;
> >      struct vmcb_struct *vmcb = v->arch.hvm.svm.vmcb;
> >      const struct nestedsvm *nsvm = &vcpu_nestedsvm(v);
> > +    uint64_t tmp;
> >  
> >      switch ( msr )
> >      {
> > @@ -1965,6 +1966,11 @@ static int svm_msr_read_intercept(unsigned int msr, uint64_t *msr_content)
> >          break;
> >  
> >      default:
> > +        if ( d->arch.hvm.rdmsr_relaxed && !rdmsr_safe(msr, tmp) )
> > +        {
> > +            *msr_content = 0;
> > +            break;
> > +        }
> 
> You don't really need "tmp" here, do you? You could as well read
> into *msr_content, as you're zapping the value afterwards anyway.

I also thought about doing this, but felt unease. I fear the code
might be changed in the future and maybe msr_content is not zapped
anymore, thus leaking the content. I feel it's safer to use a
temporary variable that will never be returned to the guest. Maybe
I'm just too paranoid.

Thanks, Roger.

