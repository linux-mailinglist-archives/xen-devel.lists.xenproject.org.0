Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C16A14F2804
	for <lists+xen-devel@lfdr.de>; Tue,  5 Apr 2022 10:19:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.298579.508660 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nbeOP-0005xE-DQ; Tue, 05 Apr 2022 08:18:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 298579.508660; Tue, 05 Apr 2022 08:18:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nbeOP-0005uY-AM; Tue, 05 Apr 2022 08:18:25 +0000
Received: by outflank-mailman (input) for mailman id 298579;
 Tue, 05 Apr 2022 08:18:22 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=nhpA=UP=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nbeOM-0005uS-U7
 for xen-devel@lists.xenproject.org; Tue, 05 Apr 2022 08:18:22 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f444d125-b4b8-11ec-a405-831a346695d4;
 Tue, 05 Apr 2022 10:18:21 +0200 (CEST)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05lp2107.outbound.protection.outlook.com [104.47.17.107]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-7-q8Y01zFPMS2JmzcYdRbU-A-1; Tue, 05 Apr 2022 10:18:16 +0200
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com (2603:10a6:10:2db::16)
 by VI1PR04MB5501.eurprd04.prod.outlook.com (2603:10a6:803:d3::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5123.31; Tue, 5 Apr
 2022 08:18:11 +0000
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::914d:e08d:7798:8476]) by DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::914d:e08d:7798:8476%7]) with mapi id 15.20.5123.031; Tue, 5 Apr 2022
 08:18:11 +0000
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
X-Inumbo-ID: f444d125-b4b8-11ec-a405-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1649146701;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=k7qlTFmxRuPfZaRPWud7AGTUFLNRrBgyDK50q6nKywY=;
	b=Tw5RWIVyP7RKRm9g7M1VFEY5d8Go+NqlQJQW7ixJ1n9QCcg7muJCSxfbrtHjXLl7p4dW/6
	2JDvHTvPpr2dCfPo6NwUGKKJ0CmcQDbMiqJ8PMs5Psuiipi4xuuanrpIU6RGnRiHNOQ3UY
	UZ+ImJ6OncNqHlNeB3rZGyYTG2abZJA=
X-MC-Unique: q8Y01zFPMS2JmzcYdRbU-A-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CR7RrGZZKQWrPp3REe8iHygHYbZM1f1AtyyAl+z1Qpxf1yAxH201aOhYXzyHtHm2ClwhdDcLl/JWwJ0gvC7vUI957lEl9WH5yg6w4LJGrKd8XGzSmTNxSsKmPhnx2KxGObFqN8kRR0jvY36xrgJoenrvGTJtUkowVJIJ75MO0rH3SjNACw5QKn8mYju5YT1pXP6JSiCqT/oCPxAB/yE20qw8idPTqKCMpd9AKxZnxmbKJR2Mjra4oF5yWoLMoVk2euPmsooNr+0tlsJXBYr9h/XrH/nXgAfwRmJSFSlqWowaKs3E5sPSJfMu1A8sDPOoBNYloYLZ50EZ9isBbJ+KGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=k7qlTFmxRuPfZaRPWud7AGTUFLNRrBgyDK50q6nKywY=;
 b=Dvb6XD7yPruZ/2Zt5mbx8vSV3OyrBF1S2UukiUTIm7BDjcJehcZd7wxgvur/0dG5grRIFy72zMq4h7HHVxEnvZ5ojU1xmpg4ESnidcY00Fa53wt8FDmf6veZN5jwFoeDyTSF6TPHD7ofRtfBMxDr4Q0F6ILquHg3cA4FerdLuikAEznATCagyW332rZWIzCYW+Y/VMC8KgNsGQj3UDQJlxCrkEE2X8tG16mwGK2//61wjSK65xmv5GDvqkE/8/JM9qGAf13N01OMvck+2rGH1J04OHJb675s2UYeL+oEeoWqPShIJbJiQGwRrylhfYq+vrFUH+Y4DxWSE3zPJjV9uw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <f5225d49-fcc5-c02c-2e48-cd96cc2bd940@suse.com>
Date: Tue, 5 Apr 2022 10:18:09 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH] x86/irq: Skip unmap_domain_pirq XSM during destruction
Content-Language: en-US
To: Jason Andryuk <jandryuk@gmail.com>,
 "Daniel P. Smith" <dpsmith@apertussolutions.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, xen-devel@lists.xenproject.org
References: <20220330181734.30319-1-jandryuk@gmail.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20220330181734.30319-1-jandryuk@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM6PR04CA0030.eurprd04.prod.outlook.com
 (2603:10a6:20b:92::43) To DU2PR04MB8616.eurprd04.prod.outlook.com
 (2603:10a6:10:2db::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e596e491-e7f1-4854-e777-08da16dcd2d1
X-MS-TrafficTypeDiagnostic: VI1PR04MB5501:EE_
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB55016723602BAC08E0D5FB9EB3E49@VI1PR04MB5501.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	hnmb47+/srbwno3P0Uh1MWKDhpuBPjNl40v1dmjfEQJkE6ihF2ndWhdjoSWvn9oyUEHh+SO7ptKme/bsukFlUWGmnti0JgbEkd9N1OzC551FjKSNkrcptDEcJC35IftKRtbuaxIJm5/myEB+ZZ3It8EQP/3P8mkcy846UF0ZlNpMFPH/ze06Mym3CrQnswid+uLcBH/CLnJTYlx/62XFLlPeONuztUvqjpBaBt7gigjXeqhwrPh4GXR2QJzSDwgmYty0NvIW/eO6xkAPj3CvmoCn0kFnh86JZsJOss7OJ4SHwdhJW3CO0AW9r+5gRW659ktXFA59hjl1QJXkzlr80qtSIORlBoxIm7XfLaYPDsHqB4oxdgfwaxK+5AbPp9f3poPE68MaIGbzQutnrFIdw5Vn1mvR3NP8r7ezw1S25Cm+0W3X3R2VazReeWelT5/B9NfHZDmSteGt/9DdmuCHq5QVbhn9xh8RrUs8s9SRdP4c5sX23UuDPpfm4Gcfxufmc2KUEhMDKLbIIkW37LMMEdBFvAe/OzIs92njaPaQ1EiMUCFLrNodXdiYxP1tJIHBK95y/Zsyr1ZDrf3G7HamVrdjH4Gu7OCl2rTFAcM8sJrLRkxJlefcJJCY+bo4+ysPjeA/Orc+yItMKMOAMQpid7kyqLkCGlg1ERruiiQpO1pmXOlb6aD8dszBoPojjme/kOAW/e+vQ2EUHNB9OLEmvbNRjv7okW07dVlOflj+SMU=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8616.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(6506007)(508600001)(5660300002)(6512007)(2906002)(316002)(53546011)(26005)(186003)(83380400001)(36756003)(54906003)(66556008)(66476007)(31696002)(66946007)(38100700002)(4326008)(110136005)(8936002)(6486002)(86362001)(8676002)(2616005)(31686004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?a1h1b1NZZUdSSEZHZVFZaWdOQWtvbk1FZHUvdzdtY0I2cnJjcitBRXlVSUo2?=
 =?utf-8?B?TWsvdmFOanJ2c1BUZGJTTVNmZWVSU2xCREJMR3Q3OS92NGNNMy80ckV4a2dL?=
 =?utf-8?B?ejRKVVBYTjFYYWh0bWFiZ05ncVo5enF6ODVwdmxpZHp5cFVqZ3NxdlNncmVU?=
 =?utf-8?B?NklWU29KNEliTGF4ajVZTDFWaUVwVUZhUnBSczZaVUVsb2Q5T3hhTDdVbG1X?=
 =?utf-8?B?VERzenJ2VFNQbUpMc0UxUXIvTjJWQjM4YlV0L0F1ZXdCRFZyOHZiUmtuR3Rs?=
 =?utf-8?B?RTNsUHZhS1VwR1NtbmtTRjJrclpFQWdVb1NXSUUvQlBaN0xqTzN1RXE2Q3o2?=
 =?utf-8?B?bXNaa3VsVThzTzdrenNlZERyMnJOZWVQMkpYZmZHeUVhaGp1NzRLQzdPYzNF?=
 =?utf-8?B?OUtHVVlJN0NxRGJ3bk9nSFRUcFdaUlZ5L2pCSFRYZjFqRHZLOG5LekF2NWk1?=
 =?utf-8?B?amZpWU1ialc2aWNjbEVIbjAyeTI3SVZKWjRhVnlmM1dRTUpCOXhHMk5keDY3?=
 =?utf-8?B?UkFrSVRnUCtrYmxwNW1lbk5WQUNteCtpVDduSzRVYVFPTFlCeUR5OCs1Smo5?=
 =?utf-8?B?bThGTThFUHJHMHgwT1BqaEJwS0RhQ255ZnU1ZXQvOC8xYW1WUjErSlgxN3Zh?=
 =?utf-8?B?OTZ2Qk9LQURsNjZrM0J5aU5PalBBSXhyS1RVRHprQW0vbDVuNjJsQVorYmpC?=
 =?utf-8?B?WlhiUE1seWZES3BrNlg2ZjZSdlRtUjIwOWQ3UURkU2JwZ3A1dFZnRlhIaTk2?=
 =?utf-8?B?MWZ1TEhTVGhCYnQ1RUxGbFVIRzlXSXpBazhzMGhmK0FuWUlOeFpnRDg1QXl4?=
 =?utf-8?B?ZUpSN3JqeVhJbFAyRW1sZitPUWpBaTEzWUsxY2hhcXZYaEEyZDVGOGgrdXoy?=
 =?utf-8?B?Nkh3OGRWb1BSUWo1NXgzc0l6aGN1REtlY2pSbUF6eG1MZU5kZ1gzUUlYZ2Vy?=
 =?utf-8?B?WFR5VjBsQ2pkVWhkNE9XaDd1S2lGYmJ0UFIzUUFEd1o5TnFmYkMxZWRPZ21Y?=
 =?utf-8?B?T3ZTT2RVc25TdUFOREsyN0FUdXFRdStkTWxCWldkOWh3TDJ2aVNyWDg0bWZ2?=
 =?utf-8?B?elpudkhoamlXejUzS3dOUGh1eDJmeHlFbExYOU1rNUY2eWg2UFZJMThQaGsx?=
 =?utf-8?B?eHBDZWlvOE9nUDM0cXg5c211UFZVcVF5SmxkVzhvT3RGNVF3dVJ3RjIvNUht?=
 =?utf-8?B?ajJpNVJ3T0xEUmE1Zk9RdUZTaXpuTHNEeG53cXlNVjZHNDZ6ZC9KdzZCeDZP?=
 =?utf-8?B?dmlHVEVnY0p3Zk5SdW5mSm5kb1pLQ1NhUGhBTVdIQXhjbUh0OXFCVXM0Sm1s?=
 =?utf-8?B?TGNET3M5bjNhWlQ0RHpWbnZ6bEUrMXY3aWcvdEI2THQ5c2ZWS0l4Y2lMUkNX?=
 =?utf-8?B?ak9hOGdlWHlacE1rVnBIbWtGckVhVUc2cnE0NHpkZm55S0RUQnBOUG9SOFVE?=
 =?utf-8?B?aE8zQUloWjV5aUxXYTBzMlNkWFJ0b1ArVzlNcnhvem9vbWlDYWVqdXpIdkFq?=
 =?utf-8?B?NXhwb2Y4My9iSmt2MGEwcHdWK1J2WG8xcGlYU3lxTXZYZlZ1d2hHUjA4YkNl?=
 =?utf-8?B?TVZIclhWSFFTYmdJVkdCdjNiZmRFV1BOLzJyZ0Z0dUNtTkFhbmFIejRMT0tN?=
 =?utf-8?B?VGdXbENBZTBJOXZoODkva2U0WklMaHgrQnRXLzNGOHBmaHhJdk5rUkx0UW5D?=
 =?utf-8?B?c3EvODNRbFdJck9URDBkQTFYZW5hMHI0clBjcFBhd2lBSzk2U3dJZWJLMUpW?=
 =?utf-8?B?WU1hUWczUDZDQWFCL01xUXZDM3ZuS09LSmtvRWVFTjMrcFB6V0hVN1Ivb1F1?=
 =?utf-8?B?c0ppMUhnNVp3Y3kwQlpUNlVyWUZDZXJkV0NQMFFxOWl0b1Y4VEhFbVEyRmY0?=
 =?utf-8?B?aDIwSUVDbzArRkI0eUUwdHYyR0ErNmVJSUFCYXlOR3ZxK1lSY2pzWU5hNXgz?=
 =?utf-8?B?dnlxYnpTNDl1amRJanN6UzVlcTFIQ2NjYURmbmZLanV1VXNvVlFXMVZGTVl5?=
 =?utf-8?B?MDJjUm96NUxEUkJ4NWtFNEc4QjM3K3h1WEVEVjVtZ2xTMG51UjRMWmxMejlK?=
 =?utf-8?B?cEdLWVFjWkhWN1ByWXJaOFczOGZpcVRnbzBuUmEyWWtYQnpjWjNMeWNhci9B?=
 =?utf-8?B?UWxqZ1k0b3Azc2RjNHAzWkcxNXVwemxMU1F6M1BxUUdFdW9RSlhJYWxlSmNR?=
 =?utf-8?B?TnlrWUtaSE94UmlRMUgzRUtnd1VlOGZscjlWelZGbVR1VjZjSlIwUXB2R3c0?=
 =?utf-8?B?ZERQUEwwQ09mOGdVbzNLcndCb2VkeWNmZC9RaFRVa2QwbmQ1enpwS1lNNVhI?=
 =?utf-8?B?SFNHcFFjRmY3L1dncXZ0TDAvcitYeGhCZnlFdENxQzcwWDlCcFZZZz09?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e596e491-e7f1-4854-e777-08da16dcd2d1
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8616.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Apr 2022 08:18:11.3965
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yuZ54pp3Qw+ldzrkIzPA7b8k7TjNf15wSi4Osu4zfB5G+yLztXIT4sZG1l4fEM3p5gKVT9cJ1c7WjkwvrCMhXw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB5501

On 30.03.2022 20:17, Jason Andryuk wrote:
> xsm_unmap_domain_irq was seen denying unmap_domain_pirq when called from
> complete_domain_destroy as an RCU callback.  The source context was an
> unexpected, random domain.  Since this is a xen-internal operation,
> we don't want the XSM hook denying the operation.
> 
> Check d->is_dying and skip the check when the domain is dead.  The RCU
> callback runs when a domain is in that state.

One question which has always been puzzling me (perhaps to Daniel): While
I can see why mapping of an IRQ needs to be subject to an XSM check, it's
not really clear to me why unmapping would need to be, at least as long
as it's the domain itself which requests the unmap (and which I would
view to extend to the domain being cleaned up). But maybe that's why it's
XSM_HOOK ...

> ---
> Dan wants to change current to point at DOMID_IDLE when the RCU callback
> runs.  I think Juergen's commit 53594c7bd197 "rcu: don't use
> stop_machine_run() for rcu_barrier()" may have changed this since it
> mentions stop_machine_run scheduled the idle vcpus to run the callbacks
> for the old code.
> 
> Would that be as easy as changing rcu_do_batch() to do:
> 
> +        /* Run as "Xen" not a random domain's vcpu. */
> +        vcpu = get_current();
> +        set_current(idle_vcpu[smp_processor_id()]);
>          list->func(list);
> +        set_current(vcpu);
> 
> or is using set_current() only acceptable as part of context_switch?

Indeed I would question any uses outside of context_switch() (and
system bringup).

> --- a/xen/arch/x86/irq.c
> +++ b/xen/arch/x86/irq.c
> @@ -2340,10 +2340,14 @@ int unmap_domain_pirq(struct domain *d, int pirq)
>          nr = msi_desc->msi.nvec;
>      }
>  
> -    ret = xsm_unmap_domain_irq(XSM_HOOK, d, irq,
> -                               msi_desc ? msi_desc->dev : NULL);
> -    if ( ret )
> -        goto done;
> +    /* When called by complete_domain_destroy via RCU, current is a random
> +     * domain.  Skip the XSM check since this is a Xen-initiated action. */

Comment style.

> +    if ( d->is_dying != DOMDYING_dead ) {

Please use !d->is_dying. Also please correct the placement of the brace.
Or you could avoid the need for a brace by leveraging that ret is zero
ahead of this if(), i.e. ...

> +        ret = xsm_unmap_domain_irq(XSM_HOOK, d, irq,
> +                                   msi_desc ? msi_desc->dev : NULL);
> +        if ( ret )
> +            goto done;
> +    }


    if ( !d->is_dying )
        ret = xsm_unmap_domain_irq(XSM_HOOK, d, irq,
                                   msi_desc ? msi_desc->dev : NULL);
    if ( ret )
        goto done;

Jan


