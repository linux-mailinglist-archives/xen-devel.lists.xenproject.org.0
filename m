Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D9F163583DE
	for <lists+xen-devel@lfdr.de>; Thu,  8 Apr 2021 14:53:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.107313.205149 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lUU9B-0000AY-0N; Thu, 08 Apr 2021 12:52:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 107313.205149; Thu, 08 Apr 2021 12:52:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lUU9A-0000A2-TF; Thu, 08 Apr 2021 12:52:32 +0000
Received: by outflank-mailman (input) for mailman id 107313;
 Thu, 08 Apr 2021 12:52:30 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=3iLd=JF=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1lUU98-00009v-Pj
 for xen-devel@lists.xenproject.org; Thu, 08 Apr 2021 12:52:30 +0000
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 5ffa4883-30ce-42be-8293-1536f55cb07f;
 Thu, 08 Apr 2021 12:52:29 +0000 (UTC)
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
X-Inumbo-ID: 5ffa4883-30ce-42be-8293-1536f55cb07f
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1617886349;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=TDvHHOtN+gmEmrYNnxOtV12A852F4SbSC/pk5AfDT20=;
  b=WKklbmKxDuBi0tkXvkEq+7x8okrAxQX9GlniSiUFERV4p0LzhTiWdB0P
   9E6DKZxYr3YASTKvlbiJwNLWL/Y2BPsnJ/dXT4HxsNbeuxlsAvIRnTNo8
   UXljh7rjw7YQDm9+5u8hYZfkk14oCbuX32aeSYN83dHnQ2yazPqXtn69C
   U=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: T0FvJo/9/EPz6Ji2XpJzsPg6/GYcEBvjA0Lleziwvn4pQRDfD1T5sj9zoZ0yZgXr7rouFJ7kJb
 /pUlXMZPn1nLJmCIWRbazJUSNbaEHxGUfvW/82542qVDzkgLQwuL4jLx3y5ytfJ14XgK6uIfpW
 CtFgC7dU/EoHbmU8bgYDUrxAseXtSAggCIZr+YbqKGLqLNsJoqWlqebB4pZgplZZ5KzzyMHadu
 Ul+pvprMmh37bHu4NrslIJ+VRO76RV6ekTMC85zayTF4gO3tEzoJnp3/Kn8f5FDDPQspcQZ30T
 484=
X-SBRS: 5.2
X-MesageID: 41536137
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:SAHUdaE2/svrG5tepLqFipHXdLJzesId70hD6mlYQxZYa9Hdss
 iokugS2xOcskd1ZFgLn9ecNK6cBVbV8pBo6YccVI3SODXOkm2uMY1k8M/e2DXmASLz7apw0q
 1nfqh4BrTLfCNHpOz95xS1FMtl/cmf/MmT9J/j5lpkUA0CUdAC0y5XEQCee3cbeCBjJb4UUK
 WR/dBGoT3IQwVsUu2eCmMeV+bO4/3n/aiWAyIuPBIs5AmQgT7A0teTeHL04j4kXy5S2rBnyG
 DZkmXCl9iemsumwRzR3XK71fprsebh0ddKCYitjcUYO1zX6jqAWYV7V7WO+A0yueGkgWxKrP
 DwpX4bUPhb2jf0RCWVqQGo8xT82DwugkWSrmOwsD/Gm4jFYx4UT+BGnplUdxPF7VFIhqAb7I
 tbm2SDt5RWChvcnCPyo9jQPisa73aJnQ==
X-IronPort-AV: E=Sophos;i="5.82,206,1613451600"; 
   d="scan'208";a="41536137"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fMFyTW7Ys6xo662O/Mu7OpcRjQBlkm7V0zvXKM7jn4lMydOK2HJbDZXzFQC3wI8sy5UD+H33l3UWvqgxBf85W3AcdmPpRY8qDDey6/uXjYx34AIFePKvQ8c4+zu1GT5B2k8KYfXaztzve9YcZkQ2umJjb3AEFK7Ql3lSDNt68eACb2Pw8QTqH+PuQnGdiodCF9h9C63JzGU0cX8A9BsD1Shp/ZtxXReK4mEG6AKYllY97/5MW9ijW2TLA0Rz8OdTK9+PaHuQsnKItu/hQIn8/I0FVEWNuN0mU/NjiB3O6ozXGdrsJtrm/ejfqnseCce0WISl3FA+rExTchLGye6AVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UnkaIzl0sG2ha4I24F3qmNNOsqwb4SuhiuGvbcyONGE=;
 b=Ipd9I6sT54AG08MhYWhpT6W52Z0CIL01CXqzYHBVlTOPC6tp1WJ5tqfdONqC/Ui8dSFXodvmpmeHCyghtc+YxgwD+hYM0Ia5cUhUacFUfzLUZS0yUOQTZXGP6F4nGlTXlMbI5L5rU+2A8YEHHQ78XGtIT2f1mkakzH8YA9t5d21HKWPI4Ex3tqVStfo2IaijvG2LUkWCNe8IfrfU+CueEZXWwkPZ/FsoHDTAZYt384iuqmTdyt6zvZvUS50SKe938yVa10t1unCFJKge0V1XIa0DVxWDjFwCYFclPi0s+mgwlkkpCddNuKzvmTQnPxd9EKMwt5kzA/ypOwWM5pLGuw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UnkaIzl0sG2ha4I24F3qmNNOsqwb4SuhiuGvbcyONGE=;
 b=XciYh52nnQ86nqL0ReltkD8Y+HYv8uIBm7yEanOVPABZkrmrcPI/r44OfWaOOcBoTKokPDIptxizdeGnKn2v3S3hG2JgAC1tTRC7nz5F/Tje+xPDYbBXkrTl3Rfu+mwCoNzQrpqwOFDWtVETU38crXqGGIxT4d0r5inFIcvZm/k=
Date: Thu, 8 Apr 2021 14:52:20 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
	<xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v3 06/11] x86/hvm: allowing registering EOI callbacks for
 GSIs
Message-ID: <YG78hECMfLSB6Aao@Air-de-Roger>
References: <20210331103303.79705-1-roger.pau@citrix.com>
 <20210331103303.79705-7-roger.pau@citrix.com>
 <a57f0f75-341d-e6e1-823c-2083184a8f08@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <a57f0f75-341d-e6e1-823c-2083184a8f08@suse.com>
X-ClientProxiedBy: PR0P264CA0242.FRAP264.PROD.OUTLOOK.COM (2603:10a6:100::14)
 To DS7PR03MB5608.namprd03.prod.outlook.com (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 43a7f921-cbff-48fa-cb94-08d8fa8d28f0
X-MS-TrafficTypeDiagnostic: DM6PR03MB5324:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM6PR03MB5324660C51A6D14342178C738F749@DM6PR03MB5324.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ACEwJXniE1IKmq0vkXf3cXENK8pqf5+heCGr4buL06RdKB5aMvIfr5bBY1ACeUuCoM4Zr28aPLMYGnhbeeRzpIlZMqMvBlrynpsD0gzoDCZggdlkDXZnS1tpyfQxOf+gCUJvCYQ2vIDUG4TAvAz5SXd7n+A5dW5mmusvHe78Wbp7jxYMIx4pSwgy8ImCJTnGZtHTQhXcQ1uP1smQ8+12Fdu0EX2MTHm5jLKJCPS18mDe7aPvgx5eDfU/+wcIH6Jg7SUyDPOgRg8CYoI0CGPVIgVfJjnmpFOahPWeUM37xTHzm9U6sheTtDESeJAnIkGTpysr3LD4rbfSmU0WQv9doOLthmU3UCKxuMU8ZZaq0ax1VDklBJHBHK0c6cpSWlScJcVoAY28kbXNWOaEjJOjjClqJyeospZWPvIv8lgQjRaCsrWPkpcFGj7eAMXBfv9V072kCq47xDatXpnbFHzXfJAfZ0dkATllVp1mE/lPTO0gpdRm7ZUHuhDAr6/OaDq5BRCM++8c0miijRgA8tOv39Kdl26AbfQXYhxHLW6K0I1RKrjqgltxcBp6HIEYOz2p9nGwdFeNpiIIsFZU4e3jFGX5+QKPe30kflQGSPXhh7N/GPfpIKJnYOj2km0YOzTOzd5zOzQ2Y3ZzRvqB3qPyYNjHwlGDM+//V61GCP3BpT0=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(7916004)(4636009)(136003)(39860400002)(366004)(346002)(376002)(396003)(85182001)(956004)(38100700001)(6666004)(316002)(2906002)(83380400001)(26005)(186003)(16526019)(9686003)(8676002)(66556008)(6916009)(478600001)(66476007)(66946007)(6496006)(5660300002)(8936002)(33716001)(86362001)(53546011)(4326008)(54906003)(6486002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?OHZHd0VDdUF2QVRpcU83NDJyOVRHUTNjZzdvYWJwdWRzNnA0dTlWc3lzUmFn?=
 =?utf-8?B?OWJpL0Z0R3ZmS0JvY0xydElzWXhjbFdrdTY3RzVrMjEwZDdteXpVSEF6bjJL?=
 =?utf-8?B?N0V5bVdIQkx6R3M4Z0NnOVFTNFB3R21QbFFZbVNKazJhN3lqQ05qckxNRUhw?=
 =?utf-8?B?MDd4dC9xc3ZjNjBLYUtXZE1KQ3RxODR2OXRtRFpuWkY0WG81VmZuR0JwcXNG?=
 =?utf-8?B?QXNRRHdnT0NzYnB2SWZKakM3TmlWcUJ2MHc2SXBrZGxjMEdRVnVEZXlUMm4v?=
 =?utf-8?B?RENYSTI4bG9IWHJVaHg4bGxUaHNrdHF4Z01FMGVveUw4NzhMZGpDaHJSM2dR?=
 =?utf-8?B?SGFtc3VmS0RrQmxEN29lajU5c2s3YjRPZTB5ODE2d2QwR1YrYjhYNkQ4Qzhr?=
 =?utf-8?B?S3IxZDhkWVF3OTlsNXdxZXFSb21WQUNvR2FsdmtJZjZEVXUvVWxBSUdwYVVh?=
 =?utf-8?B?UnB0d0wwcXo4bzZnZDg2Q0plcUdVdlo1ajgwNFozeHdjM0wyMVEzUkYrUzI5?=
 =?utf-8?B?Vi9DdTBWVkp6enJuYTUvcTNmVXprS3ZhNFM3MU16UjZ2Q3pPMG1pVEUrZnNy?=
 =?utf-8?B?cXpiU29jdWszUnFHTXBpaTl1SEI3UjhtUDRBa2JUL3dnMUhFdCt0U25lNFFM?=
 =?utf-8?B?dVB2MWFNYit4MVJGUENlUWFEd2Fjb2hNenY2UUZIaE80N2R4VDdSRWlLb0c1?=
 =?utf-8?B?K0EwbVhjUnhMWlo1azNkTW1NOHFpZFkyeWsrQ0E5MHllS1lHQ1FGUnM4ZWtC?=
 =?utf-8?B?SC9vRmwzbzZ3N0Vtb2hrUnBzK2RxWlY1YTUzTW5nVlNPd05wRVg5cEt2ejZQ?=
 =?utf-8?B?M3piWGxpLzFOS0RRYkJCZ2xoSjYxWHJVNTNuLzV2UlF5T2kvak1CbzFDelp1?=
 =?utf-8?B?VzNqN21Rcy9ZMkhVbzVsVVIrR0hsYlZQTWdXVkloZ2tJc1RwMjZ6dkxQa25s?=
 =?utf-8?B?OXJOWS8zWDFmd0FDeDd3dzlhL0lUa1hQZHdyekt2T2h2UWhCZGVaQVdVbWRt?=
 =?utf-8?B?OVgzT1hyK3dmeDZJOW1SR1JrSnk5TkZTY0Q4eE5JRldDMlZscDVDdENzbzdF?=
 =?utf-8?B?RUFqSVdpYkd5K0UwKzlnYTg5V1M0ekt4Vlg2elBGbWRWV0JISkVycG5PRXZV?=
 =?utf-8?B?SjFpczZaZUE5cnlDMTZFRGV3a2hweEtYZlpkYmgwS0pXMk5jZ0FuRXBHQWYz?=
 =?utf-8?B?dldyckc2WUsxL0gyM1padVIvdDR6Z3ROZWJpRUhLZ1FrZ201MnlkQ0F2QXNm?=
 =?utf-8?B?ODkwRDhySXZuMSszd1A4ck5pdEtIcXZBeXN5NU1HZ1Z0ZzA4NERKakNjS2Vx?=
 =?utf-8?B?ak1YZWk4UXlhME52RTJaRDRyNlpITjcrdmhTMXErQktFTENJOGFubGlEMkFB?=
 =?utf-8?B?ZktMQTZSK3E2UTF5clA1RWJHblBBQWF6WUxCUXFyNW5HMDduLzBJVGRPSlcr?=
 =?utf-8?B?cXlaV3BtMjRLU1dsbml3dDh6RUdudG9teGNza3JLdlZlNGVFcWljNDBYTG5h?=
 =?utf-8?B?U2pOVTdCQXQydWZsTWRIbHNaMThYWDlWcHRFc0pKeEtnQ3hLOGxhZUppdVNF?=
 =?utf-8?B?aTFiNGxReHdsaTFINko1N0Evc00vMXk3cFdqdVhTYzZUdURkaTZtdnkwNzNl?=
 =?utf-8?B?ZS8wanVxRDQ2bmRRYitlK2d3ZHM2U2RVK2tKKzdBc3RzYkxpK2hjcHJqa2dJ?=
 =?utf-8?B?WXIwdzk3eWhzeEM4cU43VkxTeFNsUmlCV3VzcTdQelR4UUZxNEZsTGN5ZStx?=
 =?utf-8?Q?jFTZKsKO2E+8EZJ6qJ7QVs9SpQ9wZxFIO69g8Bs?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 43a7f921-cbff-48fa-cb94-08d8fa8d28f0
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Apr 2021 12:52:25.9496
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wDDPo0g4PWzyseEjJm+gqH8Wknlcv0fjSiwnYLcn5UFksH/SwGBz2VpqyCbvGMdMFjKvYFsTKh3T2jkgNANOFA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB5324
X-OriginatorOrg: citrix.com

On Wed, Apr 07, 2021 at 05:51:14PM +0200, Jan Beulich wrote:
> On 31.03.2021 12:32, Roger Pau Monne wrote:
> > --- a/xen/arch/x86/hvm/irq.c
> > +++ b/xen/arch/x86/hvm/irq.c
> > +void hvm_gsi_unregister_callback(struct domain *d, unsigned int gsi,
> > +                                 struct hvm_gsi_eoi_callback *cb)
> > +{
> > +    struct hvm_irq *hvm_irq = hvm_domain_irq(d);
> > +    const struct list_head *tmp;
> > +
> > +    if ( gsi >= hvm_irq->nr_gsis )
> > +    {
> > +        ASSERT_UNREACHABLE();
> > +        return;
> > +    }
> > +
> > +    write_lock(&hvm_irq->gsi_callbacks_lock);
> > +    list_for_each ( tmp, &hvm_irq->gsi_callbacks[gsi] )
> > +        if ( tmp == &cb->list )
> > +        {
> > +            list_del(&cb->list);
> > +            break;
> > +        }
> > +    write_unlock(&hvm_irq->gsi_callbacks_lock);
> > +}
> 
> Perhaps somehow flag, at least in debug builds, if the callback
> wasn#t found?

I've added a debug printf here to warn if the callback is not found,
but I see it triggering because hpet_set_timer will call
destroy_periodic_time and create_periodic_time and thus two calls will
be made to hvm_gsi_unregister_callback. This is fine, but adding a
message there gets too verbose, so I will drop it and leave the code
as-is.

I don't see a problem with calling destroy_periodic_time multiple
times even if the timer was not active, and that shouldn't result in a
message being printed.

Thanks, Roger.

