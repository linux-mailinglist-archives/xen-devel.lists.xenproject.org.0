Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 976994904B4
	for <lists+xen-devel@lfdr.de>; Mon, 17 Jan 2022 10:21:54 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.258036.443890 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n9OCi-0000E6-Ug; Mon, 17 Jan 2022 09:21:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 258036.443890; Mon, 17 Jan 2022 09:21:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n9OCi-0000Bs-QZ; Mon, 17 Jan 2022 09:21:32 +0000
Received: by outflank-mailman (input) for mailman id 258036;
 Mon, 17 Jan 2022 09:21:31 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ZUQe=SB=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1n9OCh-0000Bl-QN
 for xen-devel@lists.xenproject.org; Mon, 17 Jan 2022 09:21:31 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id da57ad70-7776-11ec-a115-11989b9578b4;
 Mon, 17 Jan 2022 10:21:29 +0100 (CET)
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04lp2051.outbound.protection.outlook.com [104.47.14.51]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-22-t6nVw-r0M3OlJ8p1EU7k1Q-1; Mon, 17 Jan 2022 10:21:29 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by DBAPR04MB7415.eurprd04.prod.outlook.com (2603:10a6:10:1aa::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4888.11; Mon, 17 Jan
 2022 09:21:27 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe%6]) with mapi id 15.20.4888.013; Mon, 17 Jan 2022
 09:21:27 +0000
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
X-Inumbo-ID: da57ad70-7776-11ec-a115-11989b9578b4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1642411290;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=UtlGm62QK5vvDPWCoiY8kMh8X5NyeROfuxabHiFCQOQ=;
	b=C8VX6cHUS7WE3K7O44tkYdK/ZWOkh3lguBxjl1JVVXMvsbqT1HU+mYFelGjYsYjrRKzxLZ
	sLq7EOWKiNy2yLHa/1PqiC3wXaROQFBjWAy+MECGww0dYCaOZxBCX1o/2bwWAQfLBaN9cq
	fsf2+m3HErtYQD9DCGZvJIlVy4S9BMc=
X-MC-Unique: t6nVw-r0M3OlJ8p1EU7k1Q-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=k5XZ1y4CklqnhRGdrLRmYVaWZfevu91IA/U3xI2wOKbkxkUSt7M08zO4ovwNSvuMbNJNWFzfiD0zCZyTKMoIDLNBE3QSsVY1IUtZEFqtoPgn8eGRX3K/8HlvIz0dEsrfmOqIX5pRU2l3PYq7aQBSvB7U9I4XE05ySDt6Zxt0gtDFLJKdz4GLNwltL9mDZghizpSG5B6qaNJacclOS75qfZtKYE4ixReKtbc7Yp9ESEbTM/b2medTituBlkUSLTQe5CaueCddkbxgh90Cx891nbfqcsQqAk/Af5A3UYkbMSyPzupJKmkgw4fXvwjsCV5x83tIhEW0G3oxfutmz8vGtQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=41x0D36Ab8/5Xyue/wcP6Z2ttVGUR5sCaCBD/lWC4PE=;
 b=E6yZ5buD9EhJnVULp3ig97bHC+zPRl/3N2GMdUXnNWSqnPeVj6CCaT7VnCPn02yLn/XXJcveki3n7YGycV7netU1qsx0wY/ItvhQFfYOglvmneUj6mqNM9Uha5k6vvClJudgxYBQkz1imkShO+1u0z+vx4eIpyv1NJ9zH5tK1rMsbNJgcYv+zYBDtJGxTbkzOH1Xkd/mXd0ucEEZRz8Jtfm+BZ9jylsoEorHLkxzJNPWUH6oY6dmU9t8ssUZMEHa2maSC+jDnKBemnFoEGgs+S251jYE4d1BoA5MgLkrqxgI5huNqsAZpVylgVg5LXHrHbBKxvFUi3wo3w6wNYIekA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <02bec1da-9ea8-3bca-519c-855332eedde1@suse.com>
Date: Mon, 17 Jan 2022 10:21:25 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 3/3] x86/spec-ctrl: Fix NMI race condition with VT-x
 MSR_SPEC_CTRL handling
Content-Language: en-US
To: Andrew Cooper <amc96@srcf.net>, Andrew Cooper <andrew.cooper3@citrix.com>
CC: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Jun Nakajima <jun.nakajima@intel.com>,
 Kevin Tian <kevin.tian@intel.com>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20220113163833.3831-1-andrew.cooper3@citrix.com>
 <20220113163833.3831-4-andrew.cooper3@citrix.com>
 <0745653b-6525-a7ba-f6c8-b47838559db2@srcf.net>
 <76f9d499-fabe-5d90-d769-bbd86ae421f8@srcf.net>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <76f9d499-fabe-5d90-d769-bbd86ae421f8@srcf.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AS8PR07CA0016.eurprd07.prod.outlook.com
 (2603:10a6:20b:451::16) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 52f05718-3ef2-4fb2-7ba0-08d9d99abd06
X-MS-TrafficTypeDiagnostic: DBAPR04MB7415:EE_
X-Microsoft-Antispam-PRVS:
	<DBAPR04MB7415F46E682DCE8F1D40A80CB3579@DBAPR04MB7415.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	mXqUk42qK1hwXVjAsP9EVJJd661D9IUKhoSUiaR9DB0i50svoG1Yeihqj8fDvv74RHGb60X5XNvB7evJta6yhdc5u3+5p85QDDjPhkv7FDBoJYhF6wZD8vaNtU+GJ7Qi17AoPvSLBsTpWaixN8aGV0NbDM+0R65XJ66xE4YLczFXHCWiuWLg/i9GEVYtqG3lWhTlS4NHTaWcs+tOkftr/nMVk72d/GxwNC2BUKKcn8JEV95fly3s1TEYPMzcmfZmDH9WYRl7ge2TPts+TR+mxZy8au8vPM9JGEoVpTYLm27tnH3ViPww9FGj1jiOVxWVfcPbK4OyETSuGXA0orRLE6nJ4TvEpRmE23b6Nw5xzLJ8+zp1ATXS4nhVr6mVuT9IBZNpCsCJz1dbsUTwgA3UHc0hyVO0yHnaU3SRErroGZzwr5W0/de/S+qJ4KQXOSRkDGcLRHZBV9LHsRtjlOoJmD0RqgDrQy0ghjaFBD5XV3PA8ZBHDvEd7mMe68kxSZnxGTw7Nk4xZpkS6qDCptLt2jTVNfbWR7syhvQeLe4Dhf2Uk3Laxt9iViKeWiiD8FQNH/IIar36eweWY2b7YVCxnGkwJjglvXShbpqUZqQ+Z+z3NrXtmZoIjMV1um1ZbHxRhLHvVNk1kuM6q0RJ5hJiwBS4Ym1vf9rFN9lyFlbTifG0YRNkeCDRwutlHF1Yqni4krqAgGzvyu/1YyH8wf0p+abaE610eF8x71paiyR0i+4=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(54906003)(6512007)(53546011)(66556008)(31696002)(2906002)(186003)(66476007)(316002)(66946007)(83380400001)(6506007)(2616005)(4326008)(86362001)(508600001)(110136005)(8676002)(5660300002)(8936002)(38100700002)(6486002)(36756003)(31686004)(26005)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?xI6EHqQcyQcvqudURR45RkIEMYPo/QIF5ogtq+a4aswk0xeW1hyOdbCOc/fT?=
 =?us-ascii?Q?imjxGhrnNzJhQfGNNekeOeZDSvNgmTHQBSVc+MnQqFrBsnULvIDmEqupcLy9?=
 =?us-ascii?Q?p2tOkCgzuFPd1A8E8Rb0cOKGk+rzdckloBQ+5r7RU431SEp88TmMbWSF6VeF?=
 =?us-ascii?Q?hsOGcBz8KAgOOb5BVW5Vny41rnrpc8+K29c8Em8iDov1eR8L4w5D05pNklsa?=
 =?us-ascii?Q?u1jvOEzATnvphisq/uuFm7rg9iqrgqcJ/HHKAjBARGDA+1YxImUFGdm6DAg+?=
 =?us-ascii?Q?iLSwuN5092Pdl340KwLY+1694XoFhRrjwthFO/pyv4DxbkNVna4/43SsXoGO?=
 =?us-ascii?Q?8GrJD9LImchIdGYB8GuoLJRjK7vHWHuUQ50xygm0AQN0qh9pmfmvLRnIFke9?=
 =?us-ascii?Q?5FY3l2c/o8jk0pPhb9eOd97GrApwgwPN9AFK3OyoXcwvl3ljRILMkGN1Y8dZ?=
 =?us-ascii?Q?hZWwEVY2Z+NgXGQm2Ov0I9YdI2BzmyalZrzk5hd+TfHkFsW2He/GxjFErU6A?=
 =?us-ascii?Q?WsawJZXOdtbJg3bxj9Ufjl+o0PR48m71bvCBuquUS2/5qM+bnhlelJMnwuZb?=
 =?us-ascii?Q?89U8p7PtVZyBnF0xhFg+oBe+EUFZgipI987cGMChXS9sp+95NqTxiou3aPJ4?=
 =?us-ascii?Q?sH2Z6aA/UpPBUAOwF6SRsNdG9G2coj8BMCsm25Rf5wFai8sDipzcNGIt4Klr?=
 =?us-ascii?Q?FDX6WpKbgai74Gvqd/uA93WAh7qg3+YGqNz1vyOkMlr8HGLMmipF9IxIKK7h?=
 =?us-ascii?Q?AwLUtkMnWy8whwp+WSLFeh1o+SahFDJFhPLYesbc+87b2zOopPcP6NNlD43B?=
 =?us-ascii?Q?YxBwBczf5fu2giBnFARk1Od62DuA/TQf1Jh00xEIIv9GL8yBFGYKLXKDld+w?=
 =?us-ascii?Q?NbG2vYbJbdzZe33v68IjtmkW5iL59FcY/K+3YstiueLNW9eeTe+kRRvh8ryo?=
 =?us-ascii?Q?M74P5Gya1e0GlBlNJXBztYiG0bzYpUtoB80tDlZkJFrw/wxtavZ9AnT7Sd0n?=
 =?us-ascii?Q?Nv/1HMD3p+I5WVF1AbR08+pCww74AHDVPD0r222JLYMG23rASbJBgXUwfxxx?=
 =?us-ascii?Q?z63FSZx5YtQI+cImhuQEf2DyElyWhwRyJvT7YUNLswtEvyzskxkmW16OFXLV?=
 =?us-ascii?Q?VFuJ8kygyY1PPjGr+c8Vkfs0BAukVnvvgX49S4wXDIWdBlvAm5s7JlXlDwj+?=
 =?us-ascii?Q?zmYu2UB2sxY/GDLSfx8a23q8QK2L6PXb/MLF0B8i8cOImRA7RGg3RrcFfVTU?=
 =?us-ascii?Q?aK2UpRnxdIelzLlYBnvBCiMbEu/n9sOqNe98men+gjJz54bSZ6LECz78azu+?=
 =?us-ascii?Q?NgyRjweXKO/v3QsFwvayrdOkK0buOuUEtVlTlcUnc3Z6JEhSw1rdg1JPJxJm?=
 =?us-ascii?Q?Yk2KPXXAhRePcF4U3Kw68scTanoADQ8osuIVjGW48lsb2c6KdM7wwuZNY7xn?=
 =?us-ascii?Q?yY5VoRroUeP1gBtoYU+LMBXbv03hLRhXXa7ZMvjCSuvWuQyFI6WCY0kvfNRn?=
 =?us-ascii?Q?I+BgtT30dHmfeh2Ow0ehH32LsFfLmd6A4Xxwx8cx8OoM9DDQwlkRLeuiSAM6?=
 =?us-ascii?Q?dybbJQS88zmY6eJTz+Aovamk0ZKLUxwqFXYdWq8r5j3gmoCEBzDrWigK6Gy1?=
 =?us-ascii?Q?rgKK3xL2Q7LYilVCvGOoXvA=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 52f05718-3ef2-4fb2-7ba0-08d9d99abd06
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jan 2022 09:21:27.0774
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lhCW8fQOG6UwCwZm02vwqfNL1QNK86DUoYHzGaIG/nrEVRpFm6q+C3ZaQvsxJ/sEgKA9MKdshF4PMqwXSANH1A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR04MB7415

On 14.01.2022 15:41, Andrew Cooper wrote:
> On 14/01/2022 14:14, Andrew Cooper wrote:
>> On 13/01/2022 16:38, Andrew Cooper wrote:
>>> The logic was based on a mistaken understanding of how NMI blocking on =
vmexit
>>> works.  NMIs are only blocked for EXIT_REASON_NMI, and not for general =
exits.
>>> Therefore, an NMI can in general hit early in the vmx_asm_vmexit_handle=
r path,
>>> and the guest's value will be clobbered before it is saved.
>>>
>>> Switch to using MSR load/save lists.  This causes the guest value to be=
 saved
>>> atomically with respect to NMIs/MCEs/etc.
>>>
>>> First, update vmx_cpuid_policy_changed() to configure the load/save lis=
ts at
>>> the same time as configuring the intercepts.  This function is always u=
sed in
>>> remote context, so extend the vmx_vmcs_{enter,exit}() block to cover th=
e whole
>>> function, rather than having multiple remote acquisitions of the same V=
MCS.
>>>
>>> vmx_add_guest_msr() can fail, but only in ways which are entirely fatal=
 to the
>>> guest, so handle failures using domain_crash().  vmx_del_msr() can fail=
 with
>>> -ESRCH but we don't matter, and this path will be taken during domain c=
reate
>>> on a system lacking IBRSB.
>>>
>>> Second, update vmx_msr_{read,write}_intercept() to use the load/save li=
sts
>>> rather than vcpu_msrs, and update the comment to describe the new state
>>> location.
>>>
>>> Finally, adjust the entry/exit asm.  Drop DO_SPEC_CTRL_ENTRY_FROM_HVM
>>> entirely, and use a shorter code sequence to simply reload Xen's settin=
g from
>>> the top-of-stack block.
>>>
>>> Because the guest values are loaded/saved atomically, we do not need to=
 use
>>> the shadowing logic to cope with late NMIs/etc, so we can omit
>>> DO_SPEC_CTRL_EXIT_TO_GUEST entirely and VMRESUME/VMLAUNCH with Xen's va=
lue in
>>> context.  Furthermore, we can drop the SPEC_CTRL_ENTRY_FROM_PV too, as =
there's
>>> no need to switch back to Xen's context on an early failure.
>>>
>>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
>>> ---
>>> CC: Jan Beulich <JBeulich@suse.com>
>>> CC: Roger Pau Monn=C3=A9 <roger.pau@citrix.com>
>>> CC: Wei Liu <wl@xen.org>
>>> CC: Jun Nakajima <jun.nakajima@intel.com>
>>> CC: Kevin Tian <kevin.tian@intel.com>
>>>
>>> Needs backporting as far as people can tolerate.
>>>
>>> If the entry/exit logic were in C, I'd ASSERT() that shadow tracking is=
 off,
>>> but this is awkard to arrange in asm.
>> Actually, it's just occurred to me that an ASSERT is actually quite easy
>> here.=C2=A0 I'm proposing this additional delta (totally untested).
>>
>> diff --git a/xen/arch/x86/hvm/vmx/entry.S b/xen/arch/x86/hvm/vmx/entry.S
>> index 297ed8685126..f569c3259b32 100644
>> --- a/xen/arch/x86/hvm/vmx/entry.S
>> +++ b/xen/arch/x86/hvm/vmx/entry.S
>> @@ -41,6 +41,13 @@ ENTRY(vmx_asm_vmexit_handler)
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 movzbl CPUINFO_xen_spec_ctrl(%rsp), %eax
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 xor=C2=A0=C2=A0=C2=A0 %edx, %edx
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 wrmsr
>> +
>> +#ifdef CONFIG_DEBUG
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 test=
b $SCF_use_shadow, CPUINFO_spec_ctrl_flags(%rsp)
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 jz 1=
f
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ASSE=
RT_FAILED("MSR_SPEC_CTRL shadowing active")
>> +1:
>> +#endif
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .endm
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ALTERNATIVE "", restore=
_spec_ctrl, X86_FEATURE_SC_MSR_HVM
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /* WARNING! `ret`, `cal=
l *`, `jmp *` not safe before this point. */
>=20
> Irritatingly this doesn't work, because the metadata associated with the
> ud2 instruction is tied to the compiled position in
> .altinstr_replacement, not the runtime position after alternatives have r=
un.

Could we have the macro "return" ZF, leaving it to the invocation
site of the macro to act on it? ALTERNATIVE's first argument could
easily be "xor %reg, %reg" to set ZF without much other overhead.

Jan


