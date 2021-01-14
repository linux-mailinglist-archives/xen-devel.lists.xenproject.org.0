Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F17D42F674F
	for <lists+xen-devel@lfdr.de>; Thu, 14 Jan 2021 18:21:11 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.67455.120431 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l06Il-0002Ay-S6; Thu, 14 Jan 2021 17:20:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 67455.120431; Thu, 14 Jan 2021 17:20:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l06Il-0002AZ-OP; Thu, 14 Jan 2021 17:20:51 +0000
Received: by outflank-mailman (input) for mailman id 67455;
 Thu, 14 Jan 2021 17:20:50 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=D7Rz=GR=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1l06Ik-0002AU-E4
 for xen-devel@lists.xenproject.org; Thu, 14 Jan 2021 17:20:50 +0000
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 9bd35fe8-f134-4180-9a82-3ccb74171ea1;
 Thu, 14 Jan 2021 17:20:48 +0000 (UTC)
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
X-Inumbo-ID: 9bd35fe8-f134-4180-9a82-3ccb74171ea1
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1610644848;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=SLNvqKq+3Lj2bnj8OKer46Eb5syweNtJP0iai/18Dk0=;
  b=R7BcRoGKaeeoatHIUfS2YBlj08rnNzLvOYET1ohs5R2MqbMz8UxiYCdd
   eR66sTyUWowSr1l5EsW7icFWA23L3n2NFlxCF3kFR4rfpOCNce4QQ96TS
   Iyo7ZSetf6lXmO9XQmkUQ9SzjzPO1bCz+N5ZClyymAaJhscGYIgK6KyP7
   c=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: 9ZQPueFL5SfvnqP5fTLMVCi7LSxDQiMvNIbJCzFEdRUKPFgs7Ppr5RE1wUvZqaIBoUx8EJUeQZ
 qzY8n2CT4uLbaB0rcqdb2E43QYdNBqSZTsz9pbfUctv73YSaGtPGSYR8BgOHJsp45rsOenVFbo
 guhvRQvmS/EdNzuWtpXEaWSJ+rGkou7p+quC+YevNtkoffIEVDxqfXxrrD2639SXiAPQYeSyds
 BMtmUuxeh+WdmZyyIQCBJbNztS16T35QoMnlQaHcpT4G5nJXgrwNSWstzOwyDnLBcbNuT2Y6/P
 7D8=
X-SBRS: 5.2
X-MesageID: 35108176
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.79,347,1602561600"; 
   d="scan'208";a="35108176"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Q6NARcjxcGJRyNFNuQWIDpHnhXWEvaF0HXzJEs/uUTXhgiW80ciSmEzYZiATID8QfPUcvZ5+2OH8AEtKv/hma5Dw38m+W1pgSkYorAKcOy5VLusA5/UgviM4XwmiE6Lp+4m41r2U3il2iZk3xiZBMMzC7uiGCsnYDj66V8m47vk1gWAMZImeEdMQcKR/L7ku69DQvT9YYAfj3Bk5jMP9X2gkWoJrVpT+htP3K+7txf9jpLpMH/Rkw4qkFEn4NOBBfgVujp+rapRH7TQWww1MN+9Ee7E8DneKDsHVVgXq6P2+HF8NVfHMvCwMABhBpFVzd5rnR6CV1eso8+ceOIWAjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WaYEPe4rX+026KRDnpyMO09TN/kdKnPc59mVZ5N5cLk=;
 b=a5B31xPFCelsKzf3FIEY4lfs4XVyL6Z3SLJz60oVNTWcp9gqeilVwV1l701PkqXkxfEuhLJlgB0/mgs4kz2GZDh6bkQ9/qdC908fhOPLuSG1CbAojtts56uYR8/ZsPHCA8o9aLmkixZr5QDl4A/xhPINfwVMqrI7wmwCOoCI+eAklTJLMFnQtAQpdYZOSAYs2Q+19TPbIwjAAEkFPLWHIrrYOHARk9ifRDKBf0y3xW3BK1cjAv8tidmgQUHHEYEoy92OWpp1m3g8NM6rXa7eojfyyYVTWzePqyYUkXz4kZQUyoTxb/fa5qPFTBq3JKthZNjYtFX/pJ9RqoqyFY0dPg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WaYEPe4rX+026KRDnpyMO09TN/kdKnPc59mVZ5N5cLk=;
 b=THeG/PZmf9wAd3xUdozvILSffNPnGBngi5JTM1AKdxEKCpX5JRpKGvQSur/4uKNXmVJ72YcbREHeiF7yOVT5d8YfATr3t+BOhvt+JyhR9dTQgSsUblENaLqnCf6tGDapMsILipyCLCV63hazfo4MGbK8kMgSxqfBOZqA6IXReF0=
Date: Thu, 14 Jan 2021 18:20:40 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: "Tian, Kevin" <kevin.tian@intel.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, "Paul
 Durrant" <paul@xen.org>, "Cooper, Andrew" <andrew.cooper3@citrix.com>, Wei
 Liu <wl@xen.org>, Jason Andryuk <jandryuk@gmail.com>
Subject: Re: [PATCH] x86/dpci: remove the dpci EOI timer
Message-ID: <20210114172040.2vqo7yfcbgw5lees@Air-de-Roger>
References: <MWHPR11MB1886695BC900030C025DD09A8CA90@MWHPR11MB1886.namprd11.prod.outlook.com>
 <20210113131100.p5xiyfgtp5s5rktz@Air-de-Roger>
 <CAKf6xps-GOMSsYzDHf9wgyjDes0X4hnaq9vBsn02rCv-DadW8A@mail.gmail.com>
 <20210113180558.do2xq4iaur6kyuy4@Air-de-Roger>
 <CAKf6xptFiFdh=Uwbia-6BOpB4_qO7h1PCST4WT-0BXTygssFaA@mail.gmail.com>
 <CAKf6xpuTgdpqBx7AR8QUA8nJgn64X9ttZns2aSEcwjjvzqw_fA@mail.gmail.com>
 <20210114102205.ferwl6y7idooqy3y@Air-de-Roger>
 <ecb3298d-39f1-183e-6ef6-2771dc3f79cf@suse.com>
 <20210114123307.aq6ysxggevzfyvwr@Air-de-Roger>
 <2b9ed9bc-eae2-d4e8-c760-d429c6bedc24@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <2b9ed9bc-eae2-d4e8-c760-d429c6bedc24@suse.com>
X-ClientProxiedBy: AM5PR0701CA0002.eurprd07.prod.outlook.com
 (2603:10a6:203:51::12) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: cc98d8f7-6862-4fa6-8930-08d8b8b0ba60
X-MS-TrafficTypeDiagnostic: DM5PR03MB2921:
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM5PR03MB29214FD650B58B57E826E06D8FA80@DM5PR03MB2921.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: /BOTekLFfLjq0tXZ04wruQOi18b+gDvNqqd4LMdDW+y/EhdJ5Tudl1XQAeYl8LeLRmGoIr+3B3ptGgVEGJFtgmUMElAmM0qrIn2dc8frtWvUI40r/HYeYZG1HW6/nAwTeI24n3cHNVZL9TSCXbadKLsPZymZ2ftXnUo2X5Hk6sRgA8VX5Sm59U+czq7thhZfVzdtM49t1E6rjexLkycwceqlGofFvxouEcN81yhSpT09hx235nfoJZtSTTip2ooczaumamJNO/SMqvsPQT6u/tO+v+ovMe2T77iwsuORlp7Pz1TOe26QVmqXVmB9676pfQfIw6oqjmHa5JVYmRM2ZVcI9x28zJ3gdZSebGkWwueFRtzygEyLD2f7T27Ymi41KdjXSPJIVvOz8fhq/BXrtA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(7916004)(346002)(396003)(39860400002)(136003)(366004)(376002)(6666004)(2906002)(316002)(4326008)(478600001)(6916009)(1076003)(16526019)(26005)(54906003)(66476007)(66556008)(8676002)(83380400001)(8936002)(186003)(6496006)(956004)(9686003)(33716001)(53546011)(6486002)(5660300002)(86362001)(85182001)(66946007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?eSt2aStlblo3eDdPdWhac2FFUnFET0IvMnNYek5QQkVVTDVSeFkwNjRqaXRR?=
 =?utf-8?B?RXlNWG90dy8zUk5iUGlrRVo3QW5rL2ltTmZOenIyLzczOVpQcXNieHpHNEVr?=
 =?utf-8?B?LzBlUGpHZjRHNkQyM1kvQU9QS2dIbWNqVXlVMGova0x0aEV4RG9veGlPSlhq?=
 =?utf-8?B?WDBBSE1xSTJhU0dqOFRVSWl0T3BJekMwZk5qL1lPWWRtWHgzeFNGUWM1ZmxW?=
 =?utf-8?B?QmlPY1JpTndmV1MvbXdBVncvSkVOTFBFU0MwZzg0a05OTEViR2VzYU5VUFhy?=
 =?utf-8?B?RzVmMmlDdiswSjEzNDBveUJoY0dkMURpSWZLMWRXSjF6bWhlWXFIdmVUdG1Z?=
 =?utf-8?B?di9zbnl1SFhOY0F1bkNQbXpja045TTlEMkVSMmdYNjZwUlRiSTF4c0pTdTVQ?=
 =?utf-8?B?L2twT2pmK1NhSFRMQzBWdDZ1cTEzWkQ4eVpuMGFOSGx2eXpETVlPcDZ3elN0?=
 =?utf-8?B?K2RyY0NUNkxlOTh2L2VhNHprcitCMXRjamUzNEc2SmpDTlRpVERxSmVFV29F?=
 =?utf-8?B?WGpvU2k3NjFmY29FRk1mdWd4alEyZ2hxbTJyMTlsL21ycHo3OU9pU1dNTVBm?=
 =?utf-8?B?azB2NWtmWTAzdzlkTi9Kb2FGQTRTb1ZEZVNSMDhoTmpUWDFHd0xsTGVoMlox?=
 =?utf-8?B?RDlhdlJWVUdjazBBaEVoVmUvckd5MHpzVU0zdmtSNVdjc3BkSzB0bEp3UzVy?=
 =?utf-8?B?VG9lQ3JweWFLMW9HRDhoZXU2cEl4eDdLS3EyVEFJckJHVU5tZmNlMGFLWUh0?=
 =?utf-8?B?M2FlZ2RRTHg0WEl6dGYrQVFlajB6MUNQemZSQ0tuUGFHYi9GNy9ETmpYZU9m?=
 =?utf-8?B?cnNxMnp4VG5yQVdZL2FJeUszUWRvcnozbDR0WStsd0dLbkdRS2Y0VXFNbkV3?=
 =?utf-8?B?bGI4Q3R1bmxBaGR2RXNqaWlmdlVqSVhnQy9MYks4cmhScnd3MUJCZ0VITGlq?=
 =?utf-8?B?RjVBKzM2cDJnang5SW1yUVJWdVhaa0dZaXkrdmkrUTdRVEovUUQ0ZEhmMXBM?=
 =?utf-8?B?eFZ3cGM5K0pUWmdjaHZRcjFjTFhkZDRJUGMxMytlWjN0MUJscUo0bkt6TC80?=
 =?utf-8?B?eW1ZYUFHaHloWHduQmhsRWZJNVUrckMySldEQWNTV2tMazh4YklVcnBTV3Bj?=
 =?utf-8?B?OG5kemVmMnNhajN3b1gvU05HbWc4YkY3LzFjZi90MjlVclhNdTY1aDBKcnNj?=
 =?utf-8?B?L3A5OE81bytVQUt6VVJ5M1ZaRmYxL0VrMEU2bmpWZzJKL2EwMzd6VjJaVmw3?=
 =?utf-8?B?VmpubGNoWWpNd09ac3RMVm5hOG8zcVBvZENLUVJQbXd3TDNLUW9tVkRuRE1D?=
 =?utf-8?Q?2mLQqK+vxO6JUz53p5NPrnHo4+yp4UIPQ8?=
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jan 2021 17:20:45.2553
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-Network-Message-Id: cc98d8f7-6862-4fa6-8930-08d8b8b0ba60
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yPpg8LYbCKt1GFQpXmUR1fB3h0FIWDjeJErMpeNnl5FKa7Q4Bi7lWPKpeGkiDYDbI+Ub5xu3kNEPAc16PRe+6w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR03MB2921
X-OriginatorOrg: citrix.com

On Thu, Jan 14, 2021 at 02:41:29PM +0100, Jan Beulich wrote:
> On 14.01.2021 13:33, Roger Pau Monné wrote:
> > On Thu, Jan 14, 2021 at 12:45:27PM +0100, Jan Beulich wrote:
> >> On 14.01.2021 11:22, Roger Pau Monné wrote:
> >>> On Wed, Jan 13, 2021 at 04:31:33PM -0500, Jason Andryuk wrote:
> >>>> On Wed, Jan 13, 2021 at 1:34 PM Jason Andryuk <jandryuk@gmail.com> wrote:
> >>>>> I guess I'd also need to disable MSI for the two devices to ensure
> >>>>> they are both using the GSI?
> >>>>
> >>>> lspci in dom0 shows the USB xhci controller, iwlwifi, and e1000e
> >>>> devices all with IRQ 16 and all with MSI disabled ("MSI: Enabled-").
> >>>> The two linux HVMs run with (PV) linux stubdoms, and the HVM kernels
> >>>> were started with pci=nosmi.  Networking through the iwlwifi device
> >>>> works for that VM while a mouse attached to the xhci controller is
> >>>> also working in the second VM.  Is there something else I should test?
> >>>
> >>> Not really, I think that test should be good enough, the issue is that
> >>> we don't know which OS was seeing the issues noted by Kevin.
> >>
> >> Why a specific OS? Isn't this also guarding against malice?
> > 
> > No, I don't think this protects against any kind of malice (at least
> > that I can think of). It just deasserts the guest virtual line
> > periodically if the guest itself hasn't done so. It will also attempt
> > to EOI the physical interrupt, but that's already done by the
> > eoi_timer in irq_guest_action_t (which would be the part that protects
> > against malice IMO).
> 
> Hmm, yes, there's certainly some overlap. And indeed the EOI
> timer is set 1ms in the future, while the timer here allows
> for 8ms to pass before taking action.
> 
> What I'm uncertain about is the interaction between both: It
> would seem to me that the pirq_guest_eoi() invocation from
> here could undermine the purpose of the EOI timer. In which
> case it would in fact be a win to get rid of this timer here.

It's not clear to me either. In any case having two timers for the
same irq also seems like a waste of resources.

> > It's my understanding that according to what Kevin pointed out this
> > was done because when sharing a pirq amongst different guests a guest
> > can get interrupts delivered before it has properly setup the device,
> > and not deasserting those by Xen would get the guest into some kind of
> > stuck state, where it's not deasserting the line for itself.
> > 
> > TBH I'm still trying to figure out how that scenario would look like,
> > and why would just deasserting the line fix it. On the vIO-APIC case
> > you would need to forcefully clean the IRR bit in order to receive
> > further interrupts on that pin, so maybe the issue is that switching a
> > vIO-APIC pin from level to trigger mode (which clears the IRR bit)
> > should also deassert the line?
> 
> I suppose this was directed at Kevin - I'm struggling as well.

Right, was a question for anyone who might know the answer really. I
think I will prepare some more stuff to try to clean this up. Let's
see if Kevin has some input.

Thanks, Roger.

