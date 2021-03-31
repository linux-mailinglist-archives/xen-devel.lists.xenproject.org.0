Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 536A43500AB
	for <lists+xen-devel@lfdr.de>; Wed, 31 Mar 2021 14:51:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.103928.198230 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lRaJ5-0001gl-04; Wed, 31 Mar 2021 12:50:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 103928.198230; Wed, 31 Mar 2021 12:50:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lRaJ4-0001gM-Sn; Wed, 31 Mar 2021 12:50:46 +0000
Received: by outflank-mailman (input) for mailman id 103928;
 Wed, 31 Mar 2021 12:50:45 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=9hby=I5=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1lRaJ2-0001gH-Vo
 for xen-devel@lists.xenproject.org; Wed, 31 Mar 2021 12:50:45 +0000
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id b0450925-8022-4edd-a324-9b5b7669f04e;
 Wed, 31 Mar 2021 12:50:43 +0000 (UTC)
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
X-Inumbo-ID: b0450925-8022-4edd-a324-9b5b7669f04e
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1617195043;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=cPH+z4L6JW4hQ8Lz4x8+qyaHSCyBB2eOY8GQLgyvDWY=;
  b=dQCFjSAR1i5+IUccUO0TOkDTy3waRyfmHENIIyIXwDvdCDySDntMeG/U
   BIONFjgRgq3ZXpjBYSvhGyzdBE4hz/mYNeXpfjSeWJwPXhQKp0aDSINfC
   SIO/Tk9IWPO2r2PnIBcfRJIYEIoELDvWVbWQegMjtRTNKW0OWU+p2kKgJ
   Y=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: AegqovlZAbSJjAzXZgMB+bE6enBPSEm33OC70BL1ljUTW56JO+il4agfVB1Y/1ZRy18LW432sU
 w/lbFzTsL/Ng1S6ClzT7CHAqHw8zx1w/lbN4ma5jWoAT65ENXmako3QHI5QXWrHaOLKCngLIdm
 Y4gqdPdBqJs33W1UM/Aa14BxZpyhxiwbxJu0vl04iMAU2dSdsbGDqtUy5laEFsM5CQUt3K7b/c
 NjnZuJ/VwNXnrBm7YsQiin1/DlU6hOnnlCfg3PgxC8c3RfRz1U6DJysX/A4/vs7ZRIMs2+6wxB
 XoA=
X-SBRS: 5.2
X-MesageID: 42006579
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23: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
 rkYSvfe44N4C/UqGT96SNXYN8Oqj5ltHUnmQ==
X-IronPort-AV: E=Sophos;i="5.81,293,1610427600"; 
   d="scan'208";a="42006579"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=A/HxBBWp8gfuPKYKiZsBwe+bG+r3JHZAu4dK3szzZxn94GTLPgCzpYLS+gZbuvJzP0IQ+8tEcDWRkk59FWM7MOdoYX1MCayJZTf306LkmbwOw967KYB6NLopvIeSVVapZ50KioHm3IeIZO51a95RvZ1HFlmq0o91vqJnBaizXxOmDE5JPmS/h1BNM6THhgVMXkNllfm7mxfK6EIJBvYvMJFqXw3BX1tCrWoa9EuL279MDxLOpFhHZyTQWd+UjvoRTUVxJzz5hFdpcvy4BuDIDwinrGwbjnV6Kb5QdJFnWWEZKW1T/zNEUmAgNfozKByetAnjeonPj7mpzBwAEat0CQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IEvQ/Iptiq4A6duRyyG70TCDG33jMLzwaxZ+FKl4iQQ=;
 b=dEqGssWwGuD7JCWTXAUR/McHR+GlDY4SnbW6qIOnRZgzmQurq2Qg5hZQRHTCYMVUX9aMcPNRGZgDSPocgjVWNRHOVux+dl2IGmPreqRXT4fKzEBPr7wAM7RogbukeLjJWaNzoEMIujpPOXIRZ9yaiIuktxL8q9d5oAyXouSYmW768JUsd1gxuyiN8dHvPdmqx34kCoGrX3Dhx1amGTtf0kV9vZmioreP3Tr8PL0iDltgFf6ezijHB2DOWH20WRk0F9w4uLok8bcaRgRtTs5RYsqk8ht43gtGjro66VTbGm3DkI2+W9LPCFIQcgFGveU9OaRfxfL9jBvYI7T8XFnfFQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IEvQ/Iptiq4A6duRyyG70TCDG33jMLzwaxZ+FKl4iQQ=;
 b=uuslX/I+bgCI9jzbuBrGIm64+7C2vlVq8VWezbYP6Tht77BgMpsdmWFuF8br2PTg/+VsFqOcvYo/OLtSpUE8REuGupmg1OiSUPWPR96nNjzjNTdFoCXCwy+/FsnhI9tf/V//puxlxPvxc22SSsGFgVp6knwoN3qjlUVaSO7vHh4=
Date: Wed, 31 Mar 2021 14:50:35 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
CC: <xen-devel@lists.xenproject.org>, Jan Beulich <jbeulich@suse.com>, Wei Liu
	<wl@xen.org>
Subject: Re: [PATCH v3 03/11] x86/vlapic: introduce an EOI callback mechanism
Message-ID: <YGRwG0B5d+LTNqMK@Air-de-Roger>
References: <20210331103303.79705-1-roger.pau@citrix.com>
 <20210331103303.79705-4-roger.pau@citrix.com>
 <a41aea8e-9ffb-957c-10ca-b70937400f21@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <a41aea8e-9ffb-957c-10ca-b70937400f21@citrix.com>
X-ClientProxiedBy: AM7PR04CA0028.eurprd04.prod.outlook.com
 (2603:10a6:20b:110::38) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: cd652ce9-4484-403a-3593-08d8f4439719
X-MS-TrafficTypeDiagnostic: DM5PR03MB2553:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM5PR03MB255317BD13DEF6142CF72A378F7C9@DM5PR03MB2553.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: +n7zB+KGbSzvPMumD6cv4R8ovkrMtrVmWqb+bGbU9IdisnflHq9T5jGObdywsgfFiuJmsG2+vDeFe75vaC9oiJb6VRfj3uukGpu1jQ//++AXu9RBE2gdVxhwDNLqvgjynA6wJ3fBm5bAiM7A89jYyIWTCFvRtouARAqlGg6aqYrYZUna15M+LPOtVKA4HNDxkoDoFkc1rsMJgCxiOnAcG1aJqnnnOuGrgYemHve8xzFWZIuEpLRviUD6G45f01nJNaRrI0qfU5v6vYkQk8bpeP6jMsZKrkgJ33FS/GObCXLOAkODlLFKnGTUFW5MQopwS2C++dlbMTJ7hHARLtBD1qZTmw/oI8rgOC9EfoTitZx1PJzB0/66vjU7KZsM+iCAnEff2zZDJiHC7ITb8syZa3NEVYSpki1iyaHJk/IR7Qm/Gpyt+RIjsPqqu1ytiuw/fdxJPIVK2pjVhxbEt6Aa16jocQgo6c66j0Esv2968dwQfoO3GveNdrD9lcFjfJnYt1Nvj+tdXspVCYQ/210QRSmHOLKS8apKyGf7DZ0FU8Gb4plrCXFyEGAqvCxpWPzFIqqPi0tgdQgGc7L5uyFQ+6EHb5H3x7XzzbwCV81LXZNSJD9NS+D2JdBkE2PdcD/qImELBcBstCW7LYdjzqWbCdOsB0l1zhWZlSZlV8XWxbnVx5a2F0MajRRtkkn2NdkO
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(7916004)(346002)(376002)(39860400002)(366004)(396003)(136003)(8936002)(478600001)(6636002)(2906002)(66476007)(9686003)(54906003)(186003)(66946007)(316002)(956004)(66556008)(6496006)(26005)(16526019)(8676002)(86362001)(38100700001)(6666004)(33716001)(85182001)(6486002)(53546011)(5660300002)(6862004)(4326008)(67856001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?SW1vdHR1ZDFSdWRTUGhTeld2T0g3emdXc2NQMkZ0dysrQWpicHRrdjdiV2xh?=
 =?utf-8?B?MEdKaUlqRFMwdkYrR1o0NHJ0YXcrWjVLcXU1WEJva1BoUlZtbkNlejh4amZm?=
 =?utf-8?B?RmhpTVFHTlVtM1dtbXFwdXNtV2h4ZGlZcHBpb1lnNUU2ZWxWODlSVWFPV3dB?=
 =?utf-8?B?Wk1SK1dzV3pHNVJnWVVheWpQeWw3a0JHZlNUNFJkZDRWOUx0QUFDRy9DcmUw?=
 =?utf-8?B?OTR3UGlRaTlUN2VYVFJqSW0zcHZrc3k5elJMd1UrR2QzckVWVkxzNVp2TW9r?=
 =?utf-8?B?WXlRY2FXWXcwSUx2RFBtZWNBc0lqWXpIekVuY3UzQk1qaFVoVHdCUTlkQkQz?=
 =?utf-8?B?QU9vcTE0V0prVFgvVnlhVUUxNzhObDBYT05kT3FzaGJKbU5mc0o2c3hlSGdN?=
 =?utf-8?B?REZNSlNIdGNqZkM1ZzFLS0EybU9rZDRncitpS21YNjRJUmhmMU9COXY4ME1w?=
 =?utf-8?B?SFpzM1V6RVdmNmJkQ1hiWkhDMWM2K0NicFhoSEJYc1NUNHZYNzdhN0JwV2o1?=
 =?utf-8?B?T2swcWl4aDZBeDlwa2xtZHlVaUs0U1VMMWQ3dVZ0QXphbmRmd29jN3d1dlEv?=
 =?utf-8?B?S2RuZDZweFo0R0M0U1NrZENGT1pvZlFoNFV1UHdLQjdrN3gwSDNoUnlHWU01?=
 =?utf-8?B?MXNGVmwxVDZUQy9CeGZDYjdWb0xFdjlDMElBVE9QVENSUnVGQmJoTjVNYmdq?=
 =?utf-8?B?UFlwZ2REcjRxMUt1a2dKU3psLzlLSmp3NnZSU2NtN3NVMGpCWjFHeXJqYk14?=
 =?utf-8?B?Qm5iSGJGV1B5WUE4d2pqdTZLd25LWTRXN3d6OWJuamVSVEZIVW5wTUVDYUdE?=
 =?utf-8?B?SDcyNDNobTdvNFVhUVZkbnhYTERKTjk1L3k2ZVJmNEp2bUJLYlZ6SEl6Wk9a?=
 =?utf-8?B?Wng5R2NDQXV2ZUdtWk5MZlZWZkpIV0paZW9YNFJta21BS1lkZG50ZHJaSzZm?=
 =?utf-8?B?M2Rya0krNGhROWJ5ZllwK2JKTUdGZ0dJSCs0TW5HMm53Wi8rVXhNc2FyTzVy?=
 =?utf-8?B?SVI5RGJKMml5OExFZmJIVnFma0ZXYW5QNlBaUWM1dGY4V3VNRzRTNXhoUzB4?=
 =?utf-8?B?TzJ4K2c0dXMxUkljUWR2QXkweVF6ZEVMMWlxekFFK3RDK1phOVE4U0JzT1lq?=
 =?utf-8?B?ckN0R2VuaXBjN3N5N2hBSkV3ckVFL053YkZaYmVENWVSeGVuRlRZVjNRd054?=
 =?utf-8?B?Mkx3VXJ5ZFJLWmczdUQ0S0h6dmdpNDNTMHFXQnNuVHJYcndPclZ0cGZ2Ry9w?=
 =?utf-8?B?UTE3aFVsSVpiMEI2MDcrY0Z2Rnc5Rk5vTldNRFRLL2ZML085RjE5Z1RHamRk?=
 =?utf-8?B?YmhIM3dhVFY3azNhd3FONmF0Q3d4MjRPc0dXZ3g0R2VQcFZrL20zVGdGZldn?=
 =?utf-8?B?YW9NbmREVSt2YkhWTER0Uk0xS0FBa2EremRPN3B4azJwNitHZWlyYXNPWXZO?=
 =?utf-8?B?bnE3U2VQalFLcDhqaUNWRmRBdmRrcWtVVVVqaFQ2Y2psT3lXb01YOWlFanlv?=
 =?utf-8?B?bkhZbUNGZU5qVHcvR1ZmRmlYT0FIdVhycUJVelBUdWxTY3NsT2E4M2xiZGY5?=
 =?utf-8?B?OUlZZ2lGSlRpZ29USFFtUEhaQ2V3M2NHVlJoS0RYUjNPcmJQWWovMzhsQUFV?=
 =?utf-8?B?Q25HY3V0YmxZVmRkTDFYMVA4SnNRa25OK3RPV1FZMVZiQThXMHA2Y1EyNjh3?=
 =?utf-8?B?bkE5a3VMS3hQM3Z5OUtjS2NKT0lqVkkyVVQzYS9uZGJPSGpycDVjVXVFWmxO?=
 =?utf-8?B?aXI4QUZRRHJDV0dYTUZTanlTaGk1SFk3cXdWRm9XUnkxOU8vLzlHbXdJVTVs?=
 =?utf-8?B?cjJUUUJBeWlyMVd5T1JCdz09?=
X-MS-Exchange-CrossTenant-Network-Message-Id: cd652ce9-4484-403a-3593-08d8f4439719
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Mar 2021 12:50:40.8659
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PffKy11Veq0P4ohPFmTsOZHu7I7IypNDmHV0rAsEsWCROZm9eg+fRz3m7RBTTrqjHzqAcc3IfGKR5ZBAowptLg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR03MB2553
X-OriginatorOrg: citrix.com

On Wed, Mar 31, 2021 at 12:47:54PM +0100, Andrew Cooper wrote:
> On 31/03/2021 11:32, Roger Pau Monne wrote:
> > @@ -1620,9 +1666,22 @@ int vlapic_init(struct vcpu *v)
> >  
> >      clear_page(vlapic->regs);
> >  
> > +    vlapic->callbacks = xmalloc_array(typeof(*vlapic->callbacks),
> > +                                      X86_NR_VECTORS - 16);
> > +    if ( !vlapic->callbacks )
> > +    {
> > +        dprintk(XENLOG_ERR, "%pv: alloc vlapic callbacks error\n", v);
> > +        unmap_domain_page_global(vlapic->regs);
> > +        free_domheap_page(vlapic->regs_page);
> > +        return -ENOMEM;
> > +    }
> > +    memset(vlapic->callbacks, 0,
> > +           sizeof(*vlapic->callbacks) * (X86_NR_VECTORS - 16));
> 
> xzalloc_array() instead of memset().  Also, we shouldn't be printing for
> -ENOMEM cases.
> 
> As for the construction/teardown logic, vlapic_init()'s caller already
> vlapic_destory().  Therefore, the existing error path you've copied is
> buggy because it will cause a double-free if __map_domain_page_global()
> fails.

Right, let me adjust that path.

> I'll do a cleanup patch to fix the idempotency, which needs backporting too.

Ack, I don't mind doiing one myself either.

Thanks, Roger.

