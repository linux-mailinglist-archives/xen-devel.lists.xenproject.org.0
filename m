Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CCA62E7267
	for <lists+xen-devel@lfdr.de>; Tue, 29 Dec 2020 17:48:48 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.59996.105202 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kuI9t-0000Cq-Bk; Tue, 29 Dec 2020 16:47:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 59996.105202; Tue, 29 Dec 2020 16:47:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kuI9t-0000CP-7k; Tue, 29 Dec 2020 16:47:41 +0000
Received: by outflank-mailman (input) for mailman id 59996;
 Tue, 29 Dec 2020 16:47:40 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+dLv=GB=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1kuI9r-0000CJ-Uz
 for xen-devel@lists.xenproject.org; Tue, 29 Dec 2020 16:47:40 +0000
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 8dd56975-d545-4cca-ae91-c659e8192e0d;
 Tue, 29 Dec 2020 16:47:38 +0000 (UTC)
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
X-Inumbo-ID: 8dd56975-d545-4cca-ae91-c659e8192e0d
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1609260458;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=cmTPdKGUwWx3NY6QNn0UlcMK4WGx6V/356wiqtW7AF4=;
  b=CSzf3YtDdHp2F7zbr+96Kp7EDtPseF/KuACWUV7WcWRs4TnkRUImW6c2
   xrSijiI6o/T+FD2HlizYJtCoimkxcv8iK8F99Pt1g8s7HemTTJe62lAHg
   qquZTbCKcKP8HNERMdS53S2Q8fkQZJDHBw2+QsUyxHK5ymfTfzX/VeMrA
   k=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: Yv5bDJI6PwMDzTphQAunHE+XhBy+6QntrPxz085G7jvmeZtMnLwycCv6EnK/W4aLOU6HAgvkjP
 1N+8HDQujBcGJxTkewKgu1SeupIzDn8EajPeg6XtqVp7n1P/0WDcjkm4hxLd8Za6+xBUqD9gR/
 8WZVh+O6f0x3mpsFxiSHLRjM7fbcCUuVWft8/KZJMOYPU0ewd6N773Xqe9JnumKUxModvPh2qA
 3zkSunproLdyDuym3tEB62tR1D4RK4rufTnMOq641WrDTuoUqBUSF249xCHjQ5DJG2HQCvYWte
 KUw=
X-SBRS: 5.2
X-MesageID: 34137495
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.78,458,1599537600"; 
   d="scan'208";a="34137495"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jKx/fxh7jbYGzSozAa7I9RDqSwtS11N0oF9r51Ya2BpQ3msyHBa+aPZqxdB7pfZLVdrutqiPbLVSn5SwWdATU+BQUmTwXRJezawG4kLWfkSxKtSfB/9OKAMsBHqqPTbTpk0FD5iTEvhHY+rxDWmCjZdZ8bMjPMRdq+XI84bVP3ZZx9jTrLx4zugLD7hFbBYCVqytL95M1HS4ZcxetGaqox8DbVJ7WDD8+T2XWI6Of+H3bLSAMU6FbtLKcHJydA60GXbA1IwScF1ita4sHoXJv+SNxwKUl9tSNcaNbD7ZE4r0JWMATfyf0Jx226qjzJdy/zOgq/Dr2ftKK+4fR35kRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tNFZy/MIRSFikQTym8lclrghQytdhgD3kmzLxP9N5XY=;
 b=AbtbvwP3eoxoVk+RRIyR0hPmNNICeW1Aox9hszyADHLuKrTq8XODJYJ9doFGlQEFNdFXQ16X6p5MimiEdkSZkK4MaxAZTC+jArVDmTomQRQIeyyCCSHShk0IG69wffOtZoBLBhEcs8//KMHuonNA97JET9DZa+7Eh9n1WzxqZBQMeUcM1UAuXSS9g8QEbS+XjmfyhVv/j7Q0JX2x6W/X1l0wRUuglvjyZNAxICYwuxxbJGmxAVpT8q/zaj1IM6qdhWtf2SO2cFWXE3U1w6VZlFjL/30FNSROmckaPGPWraDlLrbHMJHXwz9CMZfghTj0Gm/AdOaOj3IdFXcjHJ69Hg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tNFZy/MIRSFikQTym8lclrghQytdhgD3kmzLxP9N5XY=;
 b=OagXve4cDSMZ0Rx7Ls3RqNLUiXK82nxOpCimjo8/uN1YXixTT0m88M1b2ukkRNhXamKRM9cirfVtP2l23OFkfjvgXoKzqiepoSWIiKsrvQixN6jJT7i2scrRxMFMGkJiMtiz73klwsjBmgTIfEzJ9TSRmfrMqz5vfUyjx0DKkM8=
Date: Tue, 29 Dec 2020 17:47:20 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
	<xen-devel@lists.xenproject.org>
Subject: Re: [PATCH] x86/msr: don't inject #GP when trying to read
 FEATURE_CONTROL
Message-ID: <20201229164720.ss45re57jjip57ls@Air-de-Roger>
References: <20201127104614.71933-1-roger.pau@citrix.com>
 <c1f686e2-dcc3-233a-c241-edf997d2cef7@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <c1f686e2-dcc3-233a-c241-edf997d2cef7@suse.com>
X-ClientProxiedBy: MR2P264CA0038.FRAP264.PROD.OUTLOOK.COM (2603:10a6:500::26)
 To DS7PR03MB5608.namprd03.prod.outlook.com (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 38316f42-c92c-4084-10d3-08d8ac196c9f
X-MS-TrafficTypeDiagnostic: DM5PR03MB2780:
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM5PR03MB278034B60C8C3FA18BFD9E0F8FD80@DM5PR03MB2780.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: GY+PKJiGJ8rvwg8h+NjfxUs4HEPdA/Z4O7XzJQLNoEWgJzr80J3SumT/PErItIyg+8oY03HdBt56ahPaKprnRDydsI2ERx7iXZ+uQ8VvxmlHd2oaaAsfBE64W+hFUYCOd9bW5spiWZgYSqEbAp9qLQH9E/tZGIWPZQ5IuGNoOTgkiDhMEWO8MEv4M+xwBGS1pgW4BYC5B/5g7yBddOjJ2oicaJ76XcpUGDGIsPqHTPUROGMCv0DPWHQJVYrTfNwkgFWw9GArGIJRJjatUMy4z8bq+lWoPyYzDhCOn13VDDah7sOfYfPuAoSz0pQynebTCCZVbBd59z1O7xk/HIH4qzpL2YIjvcZ/qKd3h5cq93LdpYy1b8r6yIDztZr31qqjyR3gBKIkrURdeu27VgboVw==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(7916004)(4636009)(396003)(136003)(346002)(376002)(366004)(39860400002)(478600001)(86362001)(6496006)(33716001)(54906003)(2906002)(6916009)(8936002)(316002)(956004)(8676002)(186003)(53546011)(66556008)(5660300002)(6486002)(4326008)(85182001)(66476007)(26005)(66946007)(16526019)(83380400001)(9686003)(6666004)(1076003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?cEt2NEU0SnZPbGh6VDZSQTU2cVU2cXBpZHEvcm83RDVKZ3NqSHQvVTQ0T215?=
 =?utf-8?B?Ri94dnJsaHB2R3ZrMU1IVmlHK2ozWnhZVEd1YWsyNnpqSU5MWDZWb3FHT2l6?=
 =?utf-8?B?dHNKUDE3dnN2VXJTNGZLUkhTMldZcnRvTHhnQnBEZkM5SnZGRjhpM0MxYklO?=
 =?utf-8?B?MFlWaVlibTgzdlV2bHZudTlBb28vZUl2d3dzNlNJUjJaMXlzK2NZWXNTd2lu?=
 =?utf-8?B?N01kMGlha0x0cU1FR2xnMUZHUTY1SGo2NktyVnJ6cnh2eVFHUnFxYit6T1J4?=
 =?utf-8?B?VTc0WTBUNEhSUUh3Vzh3a3F0bVI2Y3M0dlp0dWFqMWgzVWJ6RGFzNlZHcGJM?=
 =?utf-8?B?YnJObVFwZHV2c0M3UW5RWGh2aGhKdWVtN3ZLL1dtOFlWdDlLK1RrYzBNNjdP?=
 =?utf-8?B?aWdsazlUVGh3SGgwczgrT0dCU1hhQkxxeEY4dUdkY21RUm9lbnNqaUNqRGwr?=
 =?utf-8?B?MEFYcmg0TjA4ZTY4OTYzRnAwS2xIcHNkWkxyYytjVG9uRUkvUVJ1anBYR0Jv?=
 =?utf-8?B?N3F4bVpseWs2a1FJSGxpa2paL3Z1SVNkV1RCREFqeVN1dmVseEsxdlZiQjhU?=
 =?utf-8?B?RnVoVEREZGREN0ZYS01tQWhpRnNLakQ5dmRFUm05OEEyazZQSVdEYkVJVjBt?=
 =?utf-8?B?b0hGbTZWWVpsclFxa0piZjVjczNRZDFqcTArZ3k5Z0VpNmJScFNWMmYvUWJ1?=
 =?utf-8?B?Qnc3OUxodi9XREROSDBqS3Z6QmwwdUFYSXlLanpnVTgwVnVqVTZZTFR6Z0Zn?=
 =?utf-8?B?QUpLWTFLWnhWUVRrNVdoNkwvdk9sY1hEdWpHS3ZUNXF4S3JpQ1NweDE5Ulox?=
 =?utf-8?B?dVd4Qy9YMlppVlpGb1d4NEFkTWVzMHAwbk5vSHBsOGZNdFEwbzV1WkdQWVhl?=
 =?utf-8?B?V0lGMG9QUmxjRFNURU9BeEo5clUxemdORVVUMk1HQVJZdHNKL05tL0p3SVA3?=
 =?utf-8?B?bkdZRS80d1hYaHV3V041dm9iQVNUYVoxYk1ROGdXZUhhSTh2b0VBbGFoZU42?=
 =?utf-8?B?Vzc4MEZyOWRLcTJiTDA5QUhHa29PcjhpZUZJUU9na0lNT3ZoajZ6L2lVdmlq?=
 =?utf-8?B?ZUxIUFZmVEg2Umt2QWpKQmpBbUxuN2l0d1FjNU95SGFLdmdtakxvanpmamMz?=
 =?utf-8?B?VGRoWXQ4M0x2SkY1NGhkR0l2SWZmc0huR2FvYUZjc2hJNUxCZGE5a1pGcy9n?=
 =?utf-8?B?b21yVWpVVlkydjdOOXpTeGp4N3BCM2RvZE9TdVlUcUdMNnpETUFHQi9YdFUw?=
 =?utf-8?B?bHpSN2c5ZGhsZGxjVDY4VDhYMkNrNzd2dWxoVTBPZWVuR25sQ3BUMFBLS1FQ?=
 =?utf-8?Q?21O3cvOe/9Q4bMwimwDKkAOQGrcQ9/S5vm?=
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Dec 2020 16:47:26.8483
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-Network-Message-Id: 38316f42-c92c-4084-10d3-08d8ac196c9f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lCnG0dppHabvUqbOI+D014Z5HB8AORT5pd8zc9Ts9CDMHgtCbncH2BKO4UCeP56Y21lVJNxc7SECEzvEhmGWzw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR03MB2780
X-OriginatorOrg: citrix.com

On Fri, Nov 27, 2020 at 11:56:25AM +0100, Jan Beulich wrote:
> On 27.11.2020 11:46, Roger Pau Monne wrote:
> > Windows 10 will triple fault if #GP is injected when attempting to
> > read the FEATURE_CONTROL MSR on Intel or compatible hardware. Fix this
> > by injecting a #GP only when the vendor doesn't support the MSR, even
> > if there are no features to expose.
> > 
> > Fixes: 39ab598c50a2 ('x86/pv: allow reading FEATURE_CONTROL MSR')
> > Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> 
> In principle
> Acked-by: Jan Beulich <jbeulich@suse.com>
> 
> However, iirc it was Andrew who had suggested the conditional you
> now replace, so I'd like to wait for him to voice a view.
> 
> > --- a/xen/arch/x86/msr.c
> > +++ b/xen/arch/x86/msr.c
> > @@ -176,7 +176,7 @@ int guest_rdmsr(struct vcpu *v, uint32_t msr, uint64_t *val)
> >      switch ( msr )
> >      {
> >      case MSR_IA32_FEATURE_CONTROL:
> > -        if ( !cp->basic.vmx && !vmce_has_lmce(v) )
> > +        if ( !(cp->x86_vendor & (X86_VENDOR_INTEL | X86_VENDOR_CENTAUR)) )
> 
> What about Shanghai? init_shanghai() calling init_intel_cacheinfo()
> suggests to me it's at least as Intel-like as Centaur/VIA.

Right, and it also has VMX AFAICT. I'm not sure whether we could also
gate on the presence of VMX and LMCE on the physical CPU. I will send
and updated version with Shanghai added and will keep your Ack.

Thanks, Roger.

