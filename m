Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CA3A44B4501
	for <lists+xen-devel@lfdr.de>; Mon, 14 Feb 2022 09:56:56 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.271238.465595 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nJX9y-0006Sf-SQ; Mon, 14 Feb 2022 08:56:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 271238.465595; Mon, 14 Feb 2022 08:56:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nJX9y-0006Ql-OK; Mon, 14 Feb 2022 08:56:38 +0000
Received: by outflank-mailman (input) for mailman id 271238;
 Mon, 14 Feb 2022 08:56:37 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=KkXt=S5=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nJX9x-0006Qf-DU
 for xen-devel@lists.xen.org; Mon, 14 Feb 2022 08:56:37 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 00fa70eb-8d74-11ec-b215-9bbe72dcb22c;
 Mon, 14 Feb 2022 09:56:32 +0100 (CET)
Received: from EUR03-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur03lp2059.outbound.protection.outlook.com [104.47.9.59]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-41--E9HlSLbPs-w55SFsBq-6Q-1; Mon, 14 Feb 2022 09:56:33 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB4352.eurprd04.prod.outlook.com (2603:10a6:803:4a::25)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.19; Mon, 14 Feb
 2022 08:56:33 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::d479:b728:345c:bd65]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::d479:b728:345c:bd65%5]) with mapi id 15.20.4975.015; Mon, 14 Feb 2022
 08:56:32 +0000
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
X-Inumbo-ID: 00fa70eb-8d74-11ec-b215-9bbe72dcb22c
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1644828995;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=nmcLXdKCZh2RrIZlwlMXZjoH+JRYIYQEMFj87H/mvMU=;
	b=H+8ayhugkRFTCGKL2sR3mqyMCTdFfQ4oMTSQFQ0jUvenINQnhB/4vpWATHDe0Eae3tuaIb
	0jnoZDPkae/NSRFyT5E3cK5ABNOn5r4CLo90BEusJz9dKQ2T/3r3SDVfOg2TlezWvNqraj
	b2DRUz8AUSXRZhSDl6Ol1QUj7vCWQ0c=
X-MC-Unique: -E9HlSLbPs-w55SFsBq-6Q-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JSGZjnLoa6J37+f1/13hkjimeVkBuFSmtjdcf+eKPvAC7ostLXN9oxc2ZAGxsZ20gj//YzQSvBRFS60SH0gIcv6gRIrZrbsfds4zG6eLhrYI1AU1vtD1HJzZhCJFTpiS5/LXiBpDGyBidLXKNIotv+/eQZKLHM6GSgFFcK1iN7EuXn6Xu/WH+TEWL4exfLXRB31mbkvNgi3pwqY8kfoDO/CUWmSB2eoDj/jz2RPxCLxdFrmAddZbPZ8GF/4feBAeCyltz974nec3nepusLPqX6K8QJWFdiMlzkJjOJDM87R1OzP21E2Sd0q6lZPb36x+YF7HG4tFRSY21bdbU+if7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nmcLXdKCZh2RrIZlwlMXZjoH+JRYIYQEMFj87H/mvMU=;
 b=BW0gfoO1XvBiiZZzsm4Dfs07rfJR1gRwoiQEWZ8b8AyxjefAlHpnhhWv8aFn4wd7Wb/NDINRFxgni1cFq1DmdWZAno99a3a3Pwepkp4nXgCHi1sJXFrtICbLcgYUuDf8J2uHWRxxsrYtIht3IsHyu710CYZWRErbnqhE3FmpByZTHuEDQ9THq6KcF3qfS2GPzUm2II5jTPp23Eg3PqtPI0wRR6ZeR3G509JMoJg5wSn+oEwfnYfXnC8LPBOr33e5MQsNxADZL3VXoZJA3xdqvgaCjFFg4NC9O0w+KblGPN9ISm+Gkf9752mbkzBjGZIZ7GsrmrgZK3q3pf33lwsb+g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <198ef291-4dee-ddac-aef6-8451bc1e880c@suse.com>
Date: Mon, 14 Feb 2022 09:56:34 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.0
Subject: Re: IGD pass-through failures since 4.10.
Content-Language: en-US
To: "Dr. Greg" <greg@enjellic.com>
References: <20220214060011.GA24404@wind.enjellic.com>
Cc: xen-devel@lists.xen.org
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20220214060011.GA24404@wind.enjellic.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0054.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:48::16) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9ad2a51e-3de4-4124-5460-08d9ef97e5fa
X-MS-TrafficTypeDiagnostic: VI1PR04MB4352:EE_
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB4352E9E7A43CAD6B44686665B3339@VI1PR04MB4352.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	8evDbwQg6fp43OS0Zatqc6PJd0fhVOQ02EjnPrQAJn2kAqTBVCVUAELJ7fiyI4UACd7ReXxlEchsfQAA09z+PyaytxWhFhyK6ui2dk4wbXrXD/zTY4IVD3ioUfBSO3b5vYW0hsz6k43wgpbV9b1vLtyCtB9bd2tf/Ti6jUHzSFXWvHcDnfXmj2SVipbT5CMzRZJUpf1wD2Hm1MF8DSIg7c6PLXQQenSwc3pPEeQnEIIae6VVelYQ9+HHMZqQEq2Ddbu65ZRnLQzW2O2W11txp8e82F6ipWjq7fjAThmSxeucbXSf+E6CSjaKBISSbda/C6oW/7+QuAW6cr/MC+fS7OGhrNgGLIeStDD7DZH/X9+kQkR2ehhBtsTXUEl2gIcOVA+FhnfZlc9yQbghDH93PwwBWEbpwMilCrshe68mPwFWVy47h0G/0lCQF0x/cJEdU2jR/G6BXsapIDaXNviZExdoX73mLBCrIGvpmmqRHfdorFAXncppDZgQuXBGOtD7GTSXY4ckunjbHgeB6E8xt5pQ2GlF2/Uw6s4IEsECFTBV+qS4XdJIawcAZMyxOF1YTXSDb2QZgsI2WhMrl867WcHFS3UjZSvV7cpw3iWBLZOYnNxtGLqQogWii7n37oLRofkmOHNbxj9AzJYtOABxsX8YhgKnPhoSk+rL1zu76BXcS0c1BuOMDvAf7aiLrIxnUmARCKXOZv30BNcV4QWc3gezJoZ3hbpvjwRb30itB1k=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(6512007)(6916009)(36756003)(316002)(86362001)(53546011)(2616005)(508600001)(31686004)(6486002)(186003)(26005)(31696002)(40140700001)(6506007)(66556008)(5660300002)(66476007)(4326008)(66946007)(8676002)(8936002)(38100700002)(2906002)(83380400001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?blp4SUYrUjR4enNZS21YUFJJYVEwYVo2ZE96b0xYTlRHQy9mZTZ1Q2hSbGNH?=
 =?utf-8?B?d3FjcmovQXdyL2dIRHkrODVLSklPTVZwWU13SGpDRVVFT3JrWnFteG5IV2hZ?=
 =?utf-8?B?UTZiRzk2S1JQZFlCclRLOGRVRzFYQWFFMkJVTWI0Q3d1a09DTWNPS0FERTRu?=
 =?utf-8?B?dFdhYmdkcWpKYTdKWE5Sci9kc1pIV0lNanNmYjQwT2ZjQjJNQWJ1TXNqWVhm?=
 =?utf-8?B?ZHVaQXcyTEx3NXBnbGJCRTRQZDV2TmxLYU5vQTkwMmRDWGRXNVd3TW9nZ29z?=
 =?utf-8?B?SkxrN3R0eVlmQ3JyVU9wcDFqQzRKcGdPZjk1Y2pFU1hSU1FtZFd2d3lTejhB?=
 =?utf-8?B?MTlyYjgwY2Q3TXlRdUNxVm5xM25lNGJCSnY4SjlIb1hoaHIxNEo5M3lHM0E2?=
 =?utf-8?B?VXM0ZVNXQkRBaWVjRVkvbW9PRWxLMHdhRWxoTmsvYTE3REFBN1pBcGdrK1RK?=
 =?utf-8?B?Y0hzdWJSYU5HMW9JSUdSWXJTSm9pczVaRXJTZlN0ZXN5TnBwcjd2d0NhUEFG?=
 =?utf-8?B?MXQ3VEovRFNiaGdZaldFSHVzQVNvUXcwZEtyd0VPMlgyYXlrNGloMEsxMTZ0?=
 =?utf-8?B?cVAramZRclROL2xZQVNwNFdybm5GeUZYdEpIVlJrRisxTzlCdGxGUDk3THdz?=
 =?utf-8?B?eVV5dFV3eDJKdGNabGZQR25BVHFDMEpobVNOemx0NkpBWGRIWndvWnMxY2Z4?=
 =?utf-8?B?dlU4QlZ6WEVYcEorQUdiT0kzR3k3ZWYvOW9MYjZlczR1b09JVEtsM0hvMVI5?=
 =?utf-8?B?bDBYWG1OcUkvOEppQ3RWalArdHhoOTYyQ2VtSmZwaE0vTGdiWkJEUE9WVnNh?=
 =?utf-8?B?Tk5DQWNPbGxDLzM2YXY0TG1menQxanZtZ3d3Y2ZpVFhMRDZCMVFlN1J5SzlZ?=
 =?utf-8?B?SzhkUmVHNE00TytnNGhVcktGS05CTG9WY01JdUZPY2tTcnoxekRPeEVZL0Y1?=
 =?utf-8?B?Sk1jWnJaZDdTM2ZmN1FsL0dOTDNqNHhENWNyMzE0RVd1ZUFOeW5MaGtOMzhB?=
 =?utf-8?B?OFFNazlsNmFiMmRwRTk2ZTVoVEc0a3pXTkVwd0dnRGF4Z0t4YjNtb2pLZ2hF?=
 =?utf-8?B?S3JMV2JXc2U5d3BGN2RFOWVaZW81TVVIWm1TT0R2TEZTRzVkaWhGZkZQM2Y2?=
 =?utf-8?B?ZVROQ1FDUWlsM1IxNE9IY1NzdkovWTdWNVoyOW5mYjlYdkdkUGg3VVhrc3J2?=
 =?utf-8?B?cjI2TmQ0US90TkJjQnZ1Nk5LZlhmYm9ULzU4NzlhUGh5U0Q3cDlpclBONkIr?=
 =?utf-8?B?MFVlYTFQR1VTMlF4UHlnVktDNWNhek5GbVFwSTdsdm53ZEtRVzNqdC9rUUZT?=
 =?utf-8?B?SzJOelhySVZOUzE4VlVMaW15TXJCL3pZYkV0RjNjaGhqZW5sS1JEUXAvd0V5?=
 =?utf-8?B?ZHBuMHRlQlF4MlB1aHRvQUo5a3NIUjV4NUtLQlYvcHRiTllhWUQ4R1hjRUZG?=
 =?utf-8?B?NERCR3RuU2xteU9idFR1NG1rVHZpWS9GZGRvZlcwUFNYc1ZsaERIZ2hYRW1D?=
 =?utf-8?B?Sm01bFJsQ0NHY3A5OC9Jb0kwcmxIQVNrT3NSVjBzRFQ1S1Baa2pjTFlWL1E0?=
 =?utf-8?B?NTF1NDlmdkVBMkpYN3hRMXZLTTRSZnBjTHo2TTNybGoxcVNGcEpVZzU1a1pm?=
 =?utf-8?B?TEZHRUl5bmN3VFdGSmIvcCtXcWc5WXFTNC9XbGtCYUlFanNmWVV2bkxJQm5J?=
 =?utf-8?B?R2hsYVVoa3MwRXZ5U2ZEVnJaTklURzlJYUoweGZxZGJEZUt0aGNaL3NDcFB4?=
 =?utf-8?B?RmdKNjNqaW15M2FrNmlFdHdJZk5QT0dvR1Y4SURqOTJKM1BKY1dEVG96djFm?=
 =?utf-8?B?QUlEa1BhY05Oc0xUNEdFNnFvdG5CMXdIVXRxVjMyaTBSeVFPZWdGdWVrNWt1?=
 =?utf-8?B?Sm1pZEZFM29iclpzNG9PVDZvS3kyK0ZUc20vci9ya1ZzbXRxK0hibTZyU1Vo?=
 =?utf-8?B?ZlRpZFhqMFZnV2VSR2xUTU5KaVcrTEJ0OEQ4SEZSL2NwalZiVnpDalZGY1lq?=
 =?utf-8?B?cjR5U05TM0pJVndtRDdaYzF6Mys5TnNpR1k4RGMvMWFJb0RjMFdUOGFjc2JY?=
 =?utf-8?B?Tll3VlBaSFpHUWE4UE9RSEUzZG1XZ1NnZjhzdnY0MGU1VEtaZHZ1OUwvT1dL?=
 =?utf-8?B?UUVhRXc2SlUyZFhqSlFHUm1pMGpIV3Q5NzcyOVdKSzY5K1pNTnBDa2Z5ODhK?=
 =?utf-8?Q?uOlh+6MDsCDHjbwcYPwUoj8=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9ad2a51e-3de4-4124-5460-08d9ef97e5fa
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Feb 2022 08:56:32.8530
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jadD8QXT3VT58xXcYUGZ5QfNYJMPDgYFQeiRIOaqErnZtcWnsW8pYOHiuoa3xAobuc1wKWe/N6O9NlSFiulS0A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB4352

On 14.02.2022 07:00, Dr. Greg wrote:
> Good morning, I hope the week is starting well for everyone.
> 
> We've made extensive use of PCI based graphics pass through for many
> years, since around Xen 4.2.  In fact, we maintained a set of patches
> for ATI cards against qemu-traditional that have seen a lot of
> downloads from our FTP site.
> 
> We ended up switching to IGD based graphics a couple of years ago and
> built a stack on top of Xen 4.10 using qemu-traditional.  That
> coincided with our transition from Windows 7 to Windows 10.
> 
> We've never enjoyed anywhere near the stability with IGD/Windows-10
> that we had with the ATI/Windows-7 desktops, ie. we see fairly
> frequent crashes, lockups, reduced performance etc.  The ATI/Windows-y
> desktops were almost astonishingly reliable, ie. hundreds of
> consecutive Windows VM boot/passthrough cycles.
> 
> In order to try and address this issue we set out to upgrade our
> workstation infrastructure.  Unfortunately we haven't found anything
> that has worked post 4.10.
> 
> To be precise, 4.11 with qemu-traditional works, but upon exit from
> the virtual machine, to which the graphics adapter and USB controller
> are passed through to, both the USB controller and the graphics
> controller cannot be re-initialized and re-attached to the Dom0
> instance.
> 
> It appears to be a problem with mapping interrupts back to dom0 given
> that we see the following:
> 
> Feb 10 08:16:05 hostname kernel: xhci_hcd 0000:00:14.0: xen map irq failed -19 for 32752 domain
> 
> Feb 10 08:16:05 hostname kernel: i915 0000:00:02.0: xen map irq failed -19 for 32752 domain
> 
> Feb 10 08:16:12 hostname kernel: xhci_hcd 0000:00:14.0: Error while assigning device slot ID

Just on this one aspect: It depends a lot what precisely you've used as
4.10 before. Was this the plain 4.10.4 release, or did you track the
stable branch, accumulating security fixes? In the former case I would
suspect device quarantining to get getting in your way. In which case
it would be relevant to know what exactly "re-attach to the Dom0" means
in your case.

Which brings me to this more general remark: What you describe sounds
like a number of possibly independent problems. I'm afraid it'll be
difficult for anyone to help without you drilling further down into
what lower level operations are actually causing trouble. It also feels
as if things may have ended up working for you on 4.10 just by chance.

I'm sorry that I'm not really of any help here,
Jan

> At which point the monitor has green and block bars on it and the USB
> controller doesn't function.
> 
> Upstream QEMU doesn't work at all, the qemu-system-i386 process fails
> and is caught by xl and then tries to re-start the domain, which
> remains dead to the world and has to be destroyed.
> 
> We revved up to the most current 4.14.x release, but that acts exactly
> the same way that 4.11.x does.  We've built up the most recent 4.15.x
> release, so that we would be testing the most current release that
> still supports qemu-traditional, but haven't been able to get the
> testing done yet.  Given our current experiences, I would be surpised
> if it would work.
> 
> We've tentatively tracked the poor Windows 10 performance down to the
> hypervisor emitting hundreds of thousands of IOMMU/DMA violations.  We
> made those go away by disabling the IGD IOMMU but that doesn't fix the
> problem with upstream QEMU being able to boot the Windows instance,
> nor does it fix the problem with remapping the device interrupts back
> to Dom0 on domain exit.
> 
> The 4.10 based stack had been running with 16 GIG of memory in the
> DomU Windows instances.  Based on some online comments, we tested
> guests with 4 GIG of RAM but that doesn't impact the issues we are
> seeing.
> 
> We've tested with the most recent 5.4 and 5.10 Linux kernels but the
> Dom0 kernel version doesn't seem to have any impact on the issues we
> are seeing.
> 
> We'd be interested in any comments/suggestions the group may have.  We
> have the in-house skills to do fairly significant investigations and
> would like to improve the performance of IGD pass-through for other
> users of what is fairly useful and ubiquitious (IGD) technology.
> 
> Have a good day.
> 
> Dr. Greg
> 
> As always,
> Dr. Greg Wettstein, Ph.D, Worker      Autonomously self-defensive
> Enjellic Systems Development, LLC     IOT platforms and edge devices.
> 4206 N. 19th Ave.
> Fargo, ND  58102
> PH: 701-281-1686                      EMAIL: dg@enjellic.com
> ------------------------------------------------------------------------------
> "My thoughts on the composition and effectiveness of the advisory
>  committee?
> 
>  I think they are destined to accomplish about the same thing as what
>  you would get from locking 9 chimpanzees in a room with an armed
>  thermonuclear weapon and a can opener with orders to disarm it."
>                                 -- Dr. Greg Wettstein
>                                    Resurrection
> 


