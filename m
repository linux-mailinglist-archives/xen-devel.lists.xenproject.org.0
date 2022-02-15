Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C190D4B691A
	for <lists+xen-devel@lfdr.de>; Tue, 15 Feb 2022 11:20:19 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.272963.467982 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nJuwK-0007MF-An; Tue, 15 Feb 2022 10:20:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 272963.467982; Tue, 15 Feb 2022 10:20:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nJuwK-0007KN-7h; Tue, 15 Feb 2022 10:20:08 +0000
Received: by outflank-mailman (input) for mailman id 272963;
 Tue, 15 Feb 2022 10:20:07 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=p95L=S6=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nJuwI-0007G5-TA
 for xen-devel@lists.xenproject.org; Tue, 15 Feb 2022 10:20:07 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d808a9e0-8e48-11ec-8eb8-a37418f5ba1a;
 Tue, 15 Feb 2022 11:20:05 +0100 (CET)
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04lp2059.outbound.protection.outlook.com [104.47.14.59]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-10-iMvULkZ1OVyDQHLTxCFgfA-1; Tue, 15 Feb 2022 11:20:03 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB4541.eurprd04.prod.outlook.com (2603:10a6:803:76::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.18; Tue, 15 Feb
 2022 10:20:01 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::d479:b728:345c:bd65]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::d479:b728:345c:bd65%5]) with mapi id 15.20.4975.015; Tue, 15 Feb 2022
 10:20:01 +0000
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
X-Inumbo-ID: d808a9e0-8e48-11ec-8eb8-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1644920405;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=nb+0quDZ/iEf1j/BvtqT5iXTvAOuxWVhO59lxJ6gkHQ=;
	b=E5Iw46dp0gPNnQADroyPN/zKQXvONoc+iRHiat3yH2Nx75o8DeRy3RhuKoPQAhEXn6ft3F
	xmgaENs6xUP2BqUUFDsKg7CbPJTMnhQHyPd/OlYdZyv5Wukd3LTmsf2U9oWe49zyc76zua
	5bQjq/Kc2XKQQI5K8T5yS4v+s+3Tr30=
X-MC-Unique: iMvULkZ1OVyDQHLTxCFgfA-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=G28vJjAsWS7JUJ3xVHwmQZ4L5is0zgZXdSP4Scm/+MKsjXYEbX7dWhaJ6CJqC7/XNosLV49FbAzRryuLajoyoUNh24JDoG4G1xoxUNNLhJaFr/3nJoOSMNJViVTr4Ml03IDiHwGA+ndPL4waWgFS9wi8TwaP0ThOwYh6rccSqKyVW6IpxyaYIBbnFC8lZch6mA/X3n/uGvWiG0PIn/4Vp3zkDLrj3Ikp0/3x8dweQDMipy//ewOFlFjyq95EnaxkbRKf3uuRoQ4w0Aw4XVcpxlm99uyoNgkZzOatrFZcsisLH/rqEYthG3EMq83slZTlpfzZOcxKTKNqBY7o1G3nBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oRTZ0+tteJn/CeuVX7mzrpS/X1skiRvMyLiLGsTDhNo=;
 b=jl+p9D6HLv7nzMwbCQQMMl62PUguS7s4x/xrPUgd0On8e7sxlwd3yPLkOhlvEFRes2s0fF4WSMJvMsNkPWrbQ8cjiE1IcXwkFpR9GG0WfIFGxBZUHFF/sstMxZW/Vbiru3M1iUjgfr/NggdVUpcIXrO8vnU6CkXRD69ghjhucjHo6HO+nzF9sIZB7ppJ1YeA/5FWHZ9Hl+ewJ9iDT3D3jtyvm4zMkK0Ah8xiA+NkGU3Ux313e9nVafYRvrWbiNzYL6iz1FZ1aMEBu/Mx/LP8VlCvzu5Qk1LdGyIrwtxrTx7IQRtOZVtP+56uSkYwZSCb6pUTQ0LUWm7UZ03CLf6fdg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <12727658-68f4-1785-9b37-c948eb2cba71@suse.com>
Date: Tue, 15 Feb 2022 11:19:59 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.0
Subject: Re: [PATCH v2 1/2] xen+tools: Report Interrupt Controller
 Virtualization capabilities on x86
Content-Language: en-US
To: Jane Malalane <Jane.Malalane@citrix.com>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wl@xen.org>,
 Anthony Perard <anthony.perard@citrix.com>, Juergen Gross <jgross@suse.com>,
 George Dunlap <George.Dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Jun Nakajima <jun.nakajima@intel.com>, Kevin Tian <kevin.tian@intel.com>,
 Roger Pau Monne <roger.pau@citrix.com>,
 Andrew Cooper <Andrew.Cooper3@citrix.com>
References: <20220207182101.31941-1-jane.malalane@citrix.com>
 <20220207182101.31941-2-jane.malalane@citrix.com>
 <YgTi6bzeojtcu0xL@Air-de-Roger>
 <dff9c5c0-7bee-ce0d-3288-91255a701c99@citrix.com>
 <YgZIo9VQktcqGHTD@Air-de-Roger>
 <6d924061-f2fd-5f3d-0f98-79e76398b908@suse.com>
 <6c9400b8-7c76-34c8-f69e-3fad1eb53b8c@citrix.com>
 <101b0950-b7f2-119b-b654-574a71cec3bc@suse.com>
 <1bac0507-9420-f0b9-f846-f1c73bf9678d@citrix.com>
 <42fb3257-0c36-c156-c81b-f70dd5f247aa@suse.com>
 <9721222d-1c0d-ddaf-fbc6-801f5d9445f5@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <9721222d-1c0d-ddaf-fbc6-801f5d9445f5@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AM6P192CA0092.EURP192.PROD.OUTLOOK.COM
 (2603:10a6:209:8d::33) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7791c558-2397-4bf1-874b-08d9f06cba01
X-MS-TrafficTypeDiagnostic: VI1PR04MB4541:EE_
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB454181411B3F998E36A4FB47B3349@VI1PR04MB4541.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	ok+gkuLAcIMc4m390c6PZpb5t3kDzl3ZX7+Cu1DbELInknXhRtXXsEv32/59ykocwysR+TvUq86SZfwbY/mqRHkYnUDi5RcMHLW23sOH0R3dmYDuBDeOHLmlxQtzTQvjTgRYPLR+dhgbxSeWSf97iRMOeEp/FJPET3MZt5v8ae6dlorlAcw7i3XqyV4Nsk17hFLgmzAfL+ll0W3p7ROMTEe7zeP2w/xSk418y8DP8GJfOkdxPb+dOoo3ibIU4PcdGTtlTtZlgsWUG2RuiAso4gortshZgp5yHqggHkgwcc4CiLGL7HAbyCNlRRme9cM1yCXXtS4towzoYmcZ6P0nc+DMMlztD/1RkK4tYY9nOSbiZNY4kU96KKZ9Peps7UTH74B3I87JHrCF0iZd92PikJsPCu2qHl0aCk97Zwj6AkqgNkOvGqL/s6Zli/UT9mgWsEGf6gLu+U1UOpWv/Yfz15W8T7XwaB0fXyZvdJIzB8PLztOWaVB4UpaDvtuWrih00KCMzB1s+FGH1PbFIEuzoEEdLgqDJ8lg+ZBkPJII0pj2npW9+7hOgjd0o0UsSHRJZc6NL2o7meIs1AFrcw52miD945prQqKBQ7jXuUfu0CMP1AN9QC1/zWwGd+jLd0/20cxgmeVYLzhfp8e9OXyUPzJw32tE9rmKBFhyngcYBbOWXaLDfcvjlGLaSRiq0vFL0hksIXt/OIW5jZyKs9MNIinMs8NK8un59igqwhOQQSv7C4t6kBQPREAdBb23wdGe
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(5660300002)(6486002)(31686004)(508600001)(36756003)(2906002)(31696002)(86362001)(7416002)(83380400001)(6916009)(53546011)(26005)(66556008)(66476007)(66946007)(38100700002)(6506007)(186003)(4326008)(6512007)(2616005)(8936002)(8676002)(54906003)(316002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?jJrDTsD6ZDsH7q0RxMYZjMtcj+Ek/460cYOcVqckbwcCJX393h3FnpNVDKXZ?=
 =?us-ascii?Q?h+S+10u/yZ9Z1Be1Tu6HLc0G2CbEywjvnf0KiruPS3GURkGw0ZRMsbOKtnLv?=
 =?us-ascii?Q?7VjBV6lrxypVhmZvFZbBn9BCNuW1LqPSCClTJdnyMhpscKto+D5Ad4bn6/VV?=
 =?us-ascii?Q?kR5otID/1aDhWGXPVvLMdpOFcurJHyUSIrGdOeGMuYpllwHzVRAVG+RA8pVe?=
 =?us-ascii?Q?cHQY2M6h+Nx+Tl52GX8b/9EYI2VekZ5H1K8mRtYHHTn0md7//s8bjYuduM11?=
 =?us-ascii?Q?lb97MZdJdluCSHlg82kL5Rn5b6ktZBdkNU5NvNE/z6TwZ0+3u6pP3js2NlmU?=
 =?us-ascii?Q?sgTzCxlCsKTc90ICoI7wnwWNeN7DgYoTGWMdbp00peXJe08V0yt7Gmf7DduS?=
 =?us-ascii?Q?d3XdMvp5WuOII3yqneScZKoUYMlaiIj+/J0bKBj1WgQEbckNpH/MDwApfZVM?=
 =?us-ascii?Q?fi+g95xS3d4uJ61ereCw6zqrJw4QVhnAbHCCj5jPg19/V2wWY0ymCWwe6LaQ?=
 =?us-ascii?Q?AWWk0SvbC6wtTqpeXvJfQq3SQgw09Lq9JSAWif911clxQO6EAQLFMrJkmEJs?=
 =?us-ascii?Q?7mi3pY4DkwKKZTGKcJWmq0DIKq7MWnkF29ahl2JuG8Qi+w72o0JkMkth0tpk?=
 =?us-ascii?Q?yNw6XgNSv8gpgvRHvfsSQo0lDC2MeFsMp+W6hOY9WrGcIHi5InbRB1sCmqFm?=
 =?us-ascii?Q?P1XItErYK2jHJr5qE1ALxPYy4CSxD+/LyjlWFB33lj2x5ePqPh73kKuhYXJ5?=
 =?us-ascii?Q?LrTRH1IjmRhUesk+mooy3ncYDIPTiPcyiLu1yS2kjLqIJSUDHLs1xzE2q9/t?=
 =?us-ascii?Q?8aJ1FvFeZU4L88usMDK9KHGSnst1HC7gVrh7qZBNwpYFmgw0PSheCQcBCvbB?=
 =?us-ascii?Q?CYq1F/5ocKijlvllww35tdAkpE1yC8wxYU2iweoXB3nx/0VzzGF97ikf34Mf?=
 =?us-ascii?Q?fHcXkQY19eINWkjQSdVOBAoKJvLcScTAqHHzTdZ+l20DXEtRLpwP1TE+uCZJ?=
 =?us-ascii?Q?I6WZuV6AjmzW2wmZs9+qwVuTs8H6lecaWh7cSVr9Cl+jAV6p3QQI+IJ/oH7c?=
 =?us-ascii?Q?S7TuSV7QIyHDApsQwVwVZ7kuiBeQdBJBsYjBpNKMDbPbvOp/xMXp3UFidjj/?=
 =?us-ascii?Q?vUQfMBX6/xEqqyXVzUMPUPGnpi3Qrb8haS1upRRkj2eAHybOMljUQ9GWoUZ4?=
 =?us-ascii?Q?kTuSAViPepwoibjy67T519awbcHjkCtf2gU0Ygh7xSFZyZUDqpsHmKNLMMPb?=
 =?us-ascii?Q?bmuFOv+BuVJwvfX2wGP6hdu3nopDFFSgl41ThDgpkVpn0gkYFtE+r1eZaKGU?=
 =?us-ascii?Q?G1NDU2jDtQ2aWnACsp4m327ZQ0QsYyTMZtS+bfncjeKy7oZKVSIcx/yMYc7m?=
 =?us-ascii?Q?HDhlrMH9E6b4pOpywmPj7c//YmqaInc3TJQutg3QtVNck2MlnGJQpsSFJKfb?=
 =?us-ascii?Q?fd9DStZ5uhpXWxRrgx8xBqK3QD9vKC2y4zpInnrF3JWdkWto2Swh+5s0AGy8?=
 =?us-ascii?Q?yrSZlZTQFiuCk/LWFbsz+/e8ee1gTpUeAYKVBtoPYXTSN/Cu43LaDhRvaJFS?=
 =?us-ascii?Q?3lqsHUncy8ARLnKUIeojuJG221IlAG+ENeBAEUwlruK32ten3hG8kvwTM6n5?=
 =?us-ascii?Q?XlMKtsiIz2myTo7tAImUwek=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7791c558-2397-4bf1-874b-08d9f06cba01
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Feb 2022 10:20:01.8526
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TiaBk2dvcIdiBOFdxUNEQ2HQFcE42Vud/5NljG/5noexnlOk8gQSNSraf56w2eMzkKAtDXjf4+UB5cvP9ooRyg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB4541

On 15.02.2022 11:14, Jane Malalane wrote:
> On 15/02/2022 07:09, Jan Beulich wrote:
>> [CAUTION - EXTERNAL EMAIL] DO NOT reply, click links, or open attachment=
s unless you have verified the sender and know the content is safe.
>>
>> On 14.02.2022 18:09, Jane Malalane wrote:
>>> On 14/02/2022 13:18, Jan Beulich wrote:
>>>> [CAUTION - EXTERNAL EMAIL] DO NOT reply, click links, or open attachme=
nts unless you have verified the sender and know the content is safe.
>>>>
>>>> On 14.02.2022 14:11, Jane Malalane wrote:
>>>>> On 11/02/2022 11:46, Jan Beulich wrote:
>>>>>> [CAUTION - EXTERNAL EMAIL] DO NOT reply, click links, or open attach=
ments unless you have verified the sender and know the content is safe.
>>>>>>
>>>>>> On 11.02.2022 12:29, Roger Pau Monn=C3=A9 wrote:
>>>>>>> On Fri, Feb 11, 2022 at 10:06:48AM +0000, Jane Malalane wrote:
>>>>>>>> On 10/02/2022 10:03, Roger Pau Monn=C3=A9 wrote:
>>>>>>>>> On Mon, Feb 07, 2022 at 06:21:00PM +0000, Jane Malalane wrote:
>>>>>>>>>> diff --git a/xen/arch/x86/hvm/vmx/vmcs.c b/xen/arch/x86/hvm/vmx/=
vmcs.c
>>>>>>>>>> index 7ab15e07a0..4060aef1bd 100644
>>>>>>>>>> --- a/xen/arch/x86/hvm/vmx/vmcs.c
>>>>>>>>>> +++ b/xen/arch/x86/hvm/vmx/vmcs.c
>>>>>>>>>> @@ -343,6 +343,15 @@ static int vmx_init_vmcs_config(bool bsp)
>>>>>>>>>>                  MSR_IA32_VMX_PROCBASED_CTLS2, &mismatch);
>>>>>>>>>>          }
>>>>>>>>>>     =20
>>>>>>>>>> +    /* Check whether hardware supports accelerated xapic and x2=
apic. */
>>>>>>>>>> +    if ( bsp )
>>>>>>>>>> +    {
>>>>>>>>>> +        assisted_xapic_available =3D cpu_has_vmx_virtualize_api=
c_accesses;
>>>>>>>>>> +        assisted_x2apic_available =3D (cpu_has_vmx_apic_reg_vir=
t ||
>>>>>>>>>> +                                     cpu_has_vmx_virtual_intr_d=
elivery) &&
>>>>>>>>>> +                                    cpu_has_vmx_virtualize_x2ap=
ic_mode;
>>>>>>>>>
>>>>>>>>> I've been think about this, and it seems kind of asymmetric that =
for
>>>>>>>>> xAPIC mode we report hw assisted support only with
>>>>>>>>> virtualize_apic_accesses available, while for x2APIC we require
>>>>>>>>> virtualize_x2apic_mode plus either apic_reg_virt or
>>>>>>>>> virtual_intr_delivery.
>>>>>>>>>
>>>>>>>>> I think we likely need to be more consistent here, and report hw
>>>>>>>>> assisted x2APIC support as long as virtualize_x2apic_mode is
>>>>>>>>> available.
>>>>>>>>>
>>>>>>>>> This will likely have some effect on patch 2 also, as you will ha=
ve to
>>>>>>>>> adjust vmx_vlapic_msr_changed.
>>>>>>>>>
>>>>>>>>> Thanks, Roger.
>>>>>>>>
>>>>>>>> Any other thoughts on this? As on one hand it is asymmetric but al=
so
>>>>>>>> there isn't much assistance with only virtualize_x2apic_mode set a=
s, in
>>>>>>>> this case, a VM exit will be avoided only when trying to access th=
e TPR
>>>>>>>> register.
>>>>>>>
>>>>>>> I've been thinking about this, and reporting hardware assisted
>>>>>>> x{2}APIC virtualization with just
>>>>>>> SECONDARY_EXEC_VIRTUALIZE_APIC_ACCESSES or
>>>>>>> SECONDARY_EXEC_VIRTUALIZE_X2APIC_MODE doesn't seem very helpful. Wh=
ile
>>>>>>> those provide some assistance to the VMM in order to handle APIC
>>>>>>> accesses, it will still require a trap into the hypervisor to handl=
e
>>>>>>> most of the accesses.
>>>>>>>
>>>>>>> So maybe we should only report hardware assisted support when the
>>>>>>> mentioned features are present together with
>>>>>>> SECONDARY_EXEC_APIC_REGISTER_VIRT?
>>>>>>
>>>>>> Not sure - "some assistance" seems still a little better than none a=
t all.
>>>>>> Which route to go depends on what exactly we intend the bit to be us=
ed for.
>>>>>>
>>>>> True. I intended this bit to be specifically for enabling
>>>>> assisted_x{2}apic. So, would it be inconsistent to report hardware
>>>>> assistance with just VIRTUALIZE_APIC_ACCESSES or VIRTUALIZE_X2APIC_MO=
DE
>>>>> but still claim that x{2}apic is virtualized if no MSR accesses are
>>>>> intercepted with XEN_HVM_CPUID_X2APIC_VIRT (in traps.c) so that, as y=
ou
>>>>> say, the guest gets at least "some assistance" instead of none but we
>>>>> still claim x{2}apic virtualization when it is actually complete? May=
be
>>>>> I could also add a comment alluding to this in the xl documentation.
>>>>
>>>> To rephrase my earlier point: Which kind of decisions are the consumer=
(s)
>>>> of us reporting hardware assistance going to take? In how far is there=
 a
>>>> risk that "some assistance" is overall going to lead to a loss of
>>>> performance? I guess I'd need to see comment and actual code all in on=
e
>>>> place ...
>>>>
>>> So, I was thinking of adding something along the lines of:
>>>
>>> +=3Ditem B<assisted_xapic=3DBOOLEAN> B<(x86 only)>
>>> +Enables or disables hardware assisted virtualization for xAPIC. This
>>> +allows accessing APIC registers without a VM-exit. Notice enabling
>>> +this does not guarantee full virtualization for xAPIC, as this can
>>> +only be achieved if hardware supports =E2=80=9CAPIC-register virtualiz=
ation=E2=80=9D
>>> +and =E2=80=9Cvirtual-interrupt delivery=E2=80=9D. The default is setta=
ble via
>>> +L<xl.conf(5)>.
>>
>> But isn't this contradictory? Doesn't lack of APIC-register virtualizati=
on
>> mean VM exits upon (most) accesses?
>=20
> Yes, it does mean. I guess the alternative wouuld be then to require=20
> APIC-register virtualization for enabling xAPIC. But also, although this=
=20
> doesn't provide much acceleration, even getting a VM exit is some=20
> assistance if compared to instead getting an EPT fault and having to=20
> decode the access.

I agree here, albeit I'd like to mention that EPT faults are also VM
exits. All my earlier comment was about is that this piece of doc
wants to express reality, whichever way it is that things end up
being implemented.

Jan


