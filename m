Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 110D8363D7C
	for <lists+xen-devel@lfdr.de>; Mon, 19 Apr 2021 10:32:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.112702.214942 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lYPJi-0007gF-UA; Mon, 19 Apr 2021 08:31:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 112702.214942; Mon, 19 Apr 2021 08:31:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lYPJi-0007fq-R1; Mon, 19 Apr 2021 08:31:38 +0000
Received: by outflank-mailman (input) for mailman id 112702;
 Mon, 19 Apr 2021 08:31:37 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=2xPN=JQ=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1lYPJg-0007fl-Q4
 for xen-devel@lists.xenproject.org; Mon, 19 Apr 2021 08:31:37 +0000
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 50bd4eb1-9b71-47a4-9935-84e23ef87e7c;
 Mon, 19 Apr 2021 08:31:35 +0000 (UTC)
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
X-Inumbo-ID: 50bd4eb1-9b71-47a4-9935-84e23ef87e7c
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1618821095;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=Ag/uJSZmel7PBdinj9gHVRWmJInudpYHYRM0NO4xvUI=;
  b=IGTRl0FTEvbe0/8yNDjI22pcsg10n8PIx0IZ7WUNFq/NwiNTf9cOiWM5
   vCdpeYLU8L5stt7q5s4qBSHcmN8Y46KNeExPh1VVaEvCqpvCKIsWnbG4H
   fha0NOkG29/AFNz8cNCZ7fTmc6sgCnL2WUJSWSglfBch0lw8Z9j5+WDoe
   A=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: DVlt1wLN5EQ8Q2U0sQ/uYOS3Y8AFQckWFiOvnjr+Q4Iu/yLl1GpVfDIoOXc+72aGy+VEHuhm31
 7M7hThMBl7lDbmrFymDclS+gyvZ8jfougzm21SU8yO2L0C+jQ+jD/EbkPYxdFeoXSC8MY0tZmH
 zMPNysHLoPQNFcawG/vm9ppRwgEDBcJYuQwWVWllMPnB+OD6LGTak0mTSPPv5eWBrAThGOHhVH
 ZtFNgszADfymTRYR+S9FRPUPpSS4v3CZUunfGSW9I9RfC6WtSZSLeXufS/dETAh+TQwfpgYOK+
 I6E=
X-SBRS: 5.2
X-MesageID: 42248054
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:57sgZaD8267ZegzlHeh+sceALOonbusQ8zAX/mhsVB1YddGZnc
 iynPIdkST5kioVRWtIo729EYOLKEm9ybde544NMbC+GDT3oWfAFvAH0aLO4R3FXxf/+OlUyL
 t6f8FFYuHYIFBmga/BjzWQPM0nxLC8npyAocf74zNTQRpxa6dmhj0JbzqzNkFtXgFJCd4YOf
 Onl6l6jgGtc3gWcci3b0NtN4T+jubGiY78Zlo+DwMngTPksRqT9LX4HxKEty1uMQ9n/LFKyw
 n4uj283IqPmbWRyhjQ12jchq4m5efJ+594K+GnzuQQIjXooA60aIpmQK3qhkFInMifrGwEvf
 OJjxA8P9liy365RBDLnTLdnzPO/Rxry3j+xUSWiXHuyPaJOg4SOo56qq9yNj76gnBQ2+1U4e
 Zw8E+y86dzN1fmmh/w4tDZPisa7XackD4ZvsM4y0BEXZB2Us42kaUvuHl7Pb0nByzA5IUuAI
 BVfbvhzccTS1+cYnzD11MfueCEbzA2FheCdEAIptaY5ThQhGx41EsV3qUk7w89yK4=
X-IronPort-AV: E=Sophos;i="5.82,233,1613451600"; 
   d="scan'208";a="42248054"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BqG6wAI7cMX8JI31X+yygXum8gMneodcgSR7zx2cfqQOq6fVV3QsNS6RQO3ZG5W/1soKjF3NBxP4Cmv9oJbbBEXkvheEheAK4wL2rC/LXyGCkPnqtlU4GtbaCEpgjSBq1sPb45H1JkO7E7w3Qy1aSQFct6+C8HuptV+L3xUcWaifrUXjPT/vSfEzSFvOw18T7JCitIHngmJHjWDTd/yYCfDRj+L0JUkRm9wubhkgrQ3X4eu9S+tpf4hYbxfTLOsy8twi5hy1XvGMuvsM4aPEFKH8/NwLMB5Qf4MPPoHP+q1NQXrm9GSWC4zIxigXDCKpiODGVrXlTjcs1wpotAAzkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fE4fqxepWG1lQFu4oIhhEc4JBOmCI95lUCTjTFdFK+4=;
 b=IG3k5zRM3+Udvo2Jyc4OZIWko/CgNXDG3jMJK/D4pGhGBe4uEmJPM4zjM9e8Dr2F9BrO7H0pDiHRBBfMRvtCiip88bEGb8sn2WooPcPYDwEOP/VwvywqnTfM/CzTtVHESIhyKc0hg3MS1eVlnrE+5sSTG3mB+2F0Pytz3NErjwjpxyo362znPvuDOm0klgq+4i43C62KkMBaY9I76EFy5E1W6CX5DKVi/FN7Ym5qrPkrCwGKhvU8tT5Q0l1j9XbXhINq4tpmKzcEU3aphRzEzGApOaz/RRLv9hSOfs3wV0KDxbyH9iM1GeRyeY3HzyCFoZ7bQbydZXO3OxTW+z4Gig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fE4fqxepWG1lQFu4oIhhEc4JBOmCI95lUCTjTFdFK+4=;
 b=nGIBt8LGU3UIDBuKfkkXOuU1/qlNaqdXpIQouS9Nq+B53X30F8MdzMKe1xO567yn+flLZWSzPSxWWL/rEFlt6XbAKU1c2xroIyv4kSCTTS4EBnEdoU92k4tAN5pmST0M2c+lFpsqB1eEJg8DilPWcfXZvBL1oOuo9jgmffOMZrU=
Date: Mon, 19 Apr 2021 10:31:26 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
	<xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v3 06/11] x86/hvm: allowing registering EOI callbacks for
 GSIs
Message-ID: <YH0/3v6WKEQOQoay@Air-de-Roger>
References: <20210331103303.79705-1-roger.pau@citrix.com>
 <20210331103303.79705-7-roger.pau@citrix.com>
 <a57f0f75-341d-e6e1-823c-2083184a8f08@suse.com>
 <YG3m9nW6xPeL7MPr@Air-de-Roger> <YHhkBBaXgBQMrov/@Air-de-Roger>
 <afb9ad03-d946-55c3-5f51-62683b69f0dc@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <afb9ad03-d946-55c3-5f51-62683b69f0dc@suse.com>
X-ClientProxiedBy: MR1P264CA0003.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:501:2e::8) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4727d4f0-3a24-4815-4549-08d9030d8921
X-MS-TrafficTypeDiagnostic: DM5PR03MB2554:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM5PR03MB2554031FF605B6D382245ACD8F499@DM5PR03MB2554.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: L7ZSkVlneCpOwn6qt4fB37FxEzjgdRzdWidIUgOV01njqFskEruCtlyeUoyFbfVBIfDDm6NZv0zjf4gBADFGvRTf/aRFeuSasGfzH+pH7faMLKx/IwdlFKFRGLuSQkQzV0BzWPQV5NHhLEDR0D7hbUkE6cZ9IDqEcRVNN+p2+AWhoWAdr1n6dwMfqSTZJEXQ/uu5mIraQM8QBs6ieEPeYNKlV96+CxEQcp77owtREBE1NRFkI+K1yEW5IzNNtlCrG6tivooqzcO/aLvr2+q1luS7gsYn8HETa8LizmEjkAIFUKTEpHoFFZmUU46RXxKvpM91T2bcBvbwXxnr9YBBzEDD5g1EijtFa1wVP4ZCWv31kzfUz2HrKnhJe8W3g5TTPk1HsUFg9qKVrz2a+aVMwBcgJhcEjYw7/GX12IIF3/1mGFFs5xvysmADaxf6fy5UVkFi3Ok+vGUZjH9c6/cKoAo1QkKxvnTPKBd8VzBT5E4GekTsOAFtVPkZUdNV4Aua7FfAanygNh+3XilWfd8s8w2v2A17O8b19dPEEQOki9DPfDhsOBvB3bgLPlpV5FeQW0r7vrIilmhRhlggsIACsNBvqpz96HWW5eCTCfIxc+U=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(7916004)(4636009)(366004)(39850400004)(376002)(396003)(346002)(136003)(86362001)(8676002)(8936002)(85182001)(38100700002)(54906003)(83380400001)(316002)(66946007)(2906002)(66476007)(478600001)(66556008)(6666004)(6496006)(53546011)(956004)(6486002)(4326008)(26005)(5660300002)(6916009)(33716001)(9686003)(16526019)(186003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?MVpFaGIzOUt6RU8zaDA2cytWS1RPd0l2RHJObklTYlFhanhydXk3a3NrejRz?=
 =?utf-8?B?S2lTMklIeUMwMmN1cnNsYnEwdS9vK3d5bmY3andkWDB2Si81SEQ4YVFUTWM0?=
 =?utf-8?B?NWpQaWN4QUVEZ3dpWk94VHRqNTU1OG9GUVNXMzZmNWExTnNsTE52YjFidUc5?=
 =?utf-8?B?ODdxRGtWZS83SDI1a0FwNnB4amIzNXljU0lTWThHdmsyVTJRbDBsQUJITnBr?=
 =?utf-8?B?WjB3dlVKbXpzYmNaMjBrNGJ3M1BZV0QxZlc0UDBNeTFrdjBIR04xMStKeExV?=
 =?utf-8?B?TWZLR0Nib3M2ZGFrbjZrNjRyQUZxWmJaR0lFUUpiRzJlOTA0K1l4ZVdmODdC?=
 =?utf-8?B?Y2R1Q2F6ZTVCVjUwaDN3Q3Z3L05VVzdkUmwyZnYva25XMHRoZDVMRHowZ2xh?=
 =?utf-8?B?N25qdXNWUlBOdVZ1MlN5blgxR3dIN0lLTkxoSmRCSnlNZUY1NFlkRjZHenor?=
 =?utf-8?B?TjVsRzJET0xDNDlqNlV0bXdicHNpcU1oalh5Y1RRdjZzTFRJZkVyVUJodkNP?=
 =?utf-8?B?MkY3VTBnVWRiWjVOdjhwNUdLMlJUNDU2NFZBRTQ4NTRuby9kdmxRRDVyYXNE?=
 =?utf-8?B?TGxKWHBmejA2b3o1cUVIZTNlcXZrWmpTaEdISGpjdkhiekFjMlN6dXRLN3I1?=
 =?utf-8?B?UXpaOXhwQlo3ZkIvR3Aza2VIRHlXVldvNVpVR2ZwVlc5Vmc1MlpjSzNyK3BY?=
 =?utf-8?B?WG5qRmRjcHRsTW9pTGRRL1NtS0hiWGRIRHZyTDg5c0JVYVZ3M1RpVTlvZHc0?=
 =?utf-8?B?NUJDaDdZcHBWL3A1cER0NG5UcVoreFpLQlFyaEVac05VZnpTL3c0N2xpVUVH?=
 =?utf-8?B?SStXdUVubzdPN0NDeVViNVpTRkhVdGpyUlNESS9CbDUwejNRVTgyb1NMazZL?=
 =?utf-8?B?MkJrUDIvemk2T0pHS3ZYUHVxRE16L3ZZdHpZZUNBWVdrM2dzYTI5UFNYVWo1?=
 =?utf-8?B?cTRDOHhxQlpoejVyOERsNkROMnpNRDZZRUtUbWFDSGhaUm1vR2RIYkVXL2l5?=
 =?utf-8?B?NXEvWWxOMzkreDBWVGtWMmRBWE14WVhhZGFmejk2eXZBVlpSVHVSODl1YU8w?=
 =?utf-8?B?a3FZb1psUS9iZ2xhaW5obUFhU3FaWThXbUw1Zk9MVFF1UG1FcUdPaHd0dWpm?=
 =?utf-8?B?RFFocG4zQkxvWnVyM096OE9TbndxQ05PWUJ2T3NaRFZvaHpKQ1UzTEJKUlM0?=
 =?utf-8?B?b2xaSWpXN0FNZXRKcDNraytQbjkzb2tVSTUxRlp4N3hCaGc4YXVud0JQSmdo?=
 =?utf-8?B?aEpVZGxON2NMWTdvOUlxSTRWd1JRbWJ2RXgySGZoWTQ1b3BseWZsUHNPdjZI?=
 =?utf-8?B?ZmoyUmYwMnhpNDRtQW5ZRlp6eTkyWXJkNlIwUXZ2SnpYbVcyQytEdWVTVW5m?=
 =?utf-8?B?UGZ2YU5lSmhQYkFVTlRZV3JwZ0hrZFNKU1J5dG4yR1djMVI2MForYm1Ua2tr?=
 =?utf-8?B?Y2Q0a1NSUnZzUHVuUjVFTGZLUFlWVzdQOWNaRTZqaHZNUFVCMmdzTW9DSXh5?=
 =?utf-8?B?ekptcWl0cUVyM1E0S0VBaG9QTzYzUExJM3dNMGJLMWF6bVRRVlh5ejdzeCts?=
 =?utf-8?B?b0Z1dnREbHlsT1g1cVBOQjdWZEhtWkx0N2Q3TnZ0WklTQWI5enFhL0dtdG5p?=
 =?utf-8?B?NjNEUldJTVgzOUMyWDZpZXJIQ3EyUVFIQUo1N0ZSY1EydzhhUWk5YmVOeElI?=
 =?utf-8?B?dk54bEZZQmY1WmFOS3lBVWtneENFZkVuRkN3UnRGM3MvWEthVUY0bm03MHJS?=
 =?utf-8?Q?rzhovSakoKkUxdoTPjeFP/PFzn6jyxLmCf1sVjT?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 4727d4f0-3a24-4815-4549-08d9030d8921
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Apr 2021 08:31:32.1146
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ib/AM8V7v8lOMcsOJQ/exJmb338m3Z25BJGMa7Jt9LlJsmmeT2fWAEdPfMI7pG05QuHUx67qZSN3icag219DPw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR03MB2554
X-OriginatorOrg: citrix.com

On Fri, Apr 16, 2021 at 09:29:26AM +0200, Jan Beulich wrote:
> On 15.04.2021 18:04, Roger Pau Monné wrote:
> > On Wed, Apr 07, 2021 at 07:08:06PM +0200, Roger Pau Monné wrote:
> >> On Wed, Apr 07, 2021 at 05:51:14PM +0200, Jan Beulich wrote:
> >>> On 31.03.2021 12:32, Roger Pau Monne wrote:
> >>>> --- a/xen/arch/x86/hvm/irq.c
> >>>> +++ b/xen/arch/x86/hvm/irq.c
> >>>> +void hvm_gsi_execute_callbacks(unsigned int gsi)
> >>>> +{
> >>>> +    struct hvm_irq *hvm_irq = hvm_domain_irq(current->domain);
> >>>> +    struct hvm_gsi_eoi_callback *cb;
> >>>> +
> >>>> +    read_lock(&hvm_irq->gsi_callbacks_lock);
> >>>> +    list_for_each_entry ( cb, &hvm_irq->gsi_callbacks[gsi], list )
> >>>> +        cb->callback(gsi, cb->data);
> >>>> +    read_unlock(&hvm_irq->gsi_callbacks_lock);
> >>>> +}
> >>>
> >>> Just as an observation (for now at least) - holding the lock here
> >>> means the callbacks cannot re-register themselves.
> >>
> >> Well, re-registering would be weird, as the callback is not
> >> unregistered after execution. What is likely more relevant is that the
> >> callback cannot unregister itself. I haven't found a need for this so
> >> far, so I think it's fine.
> > 
> > I'm afraid I was wrong here - rtc_pf_callback could attempt to
> > unregister the timer, and thus end up calling
> > hvm_gsi_unregister_callback inside of a callback.
> > 
> > I need to figure a way to solve this. We already run the RTC in no ack
> > mode (which is correct because of the flag we expose in the WAET ACPI
> > table), and hence I wonder if we still need to keep the code for the
> > strict_mode around, since it's not used at all. Would you be OK with
> > me removing the mode_strict related code?
> 
> Not sure, to be honest. Years ago I did submit a patch correcting this
> ("x86/HVM: tie RTC emulation mode to enabling of Viridian emulation"),
> as we shouldn't assume all guests to even know of WAET.

It's very likely guest that don't even know about WAET to continue
working fine even in the no_ack mode. In fact the current code for
strict_mode will inject 10 interrupts without REG_C being read, as
there's no check for the value of REG_C before injecting the
interrupt.

> Hence running
> uniformly in rtc_mode_no_ack isn't really correct. I'm still carrying
> this patch, as Tim (iirc) had asked not to tie the behavior to the
> Viridian param, but give it its own one. Which I still didn't get to.
> 
> Of course, if we decided to drop mode_strict support, I could also
> drop that patch ...

AFAICT the no_ack mode it's been used since Xen 4.3, and so far we had
no complains, so I think it's safe to just remove the code for
strict_mode. It can always be fetched from the repository history if
there's a need to support strict_mode in the future.

Thanks, Roger.

