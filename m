Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A4094CBB11
	for <lists+xen-devel@lfdr.de>; Thu,  3 Mar 2022 11:13:40 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.282951.481820 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nPiSd-0006fr-Ez; Thu, 03 Mar 2022 10:13:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 282951.481820; Thu, 03 Mar 2022 10:13:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nPiSd-0006e1-Bv; Thu, 03 Mar 2022 10:13:27 +0000
Received: by outflank-mailman (input) for mailman id 282951;
 Thu, 03 Mar 2022 10:13:25 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=NyQH=TO=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nPiSb-0006dv-DM
 for xen-devel@lists.xenproject.org; Thu, 03 Mar 2022 10:13:25 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8f6b6d52-9ada-11ec-8eba-a37418f5ba1a;
 Thu, 03 Mar 2022 11:13:24 +0100 (CET)
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur01lp2056.outbound.protection.outlook.com [104.47.1.56]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-6-XKdewn20NSaezgd0xnvhRg-1; Thu, 03 Mar 2022 11:13:22 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by PAXPR04MB8781.eurprd04.prod.outlook.com (2603:10a6:102:20c::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5038.15; Thu, 3 Mar
 2022 10:13:21 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::d479:b728:345c:bd65]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::d479:b728:345c:bd65%6]) with mapi id 15.20.5038.014; Thu, 3 Mar 2022
 10:13:21 +0000
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
X-Inumbo-ID: 8f6b6d52-9ada-11ec-8eba-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1646302404;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=VR9a98SW9QQhm4ot3co1G/UWbbnwoswadNmfJgaDH10=;
	b=kUw6440AfV3y2u39gUyh+SQAQaYO0/thYjXY967WIujyjynzNJzhh9bfFy5bS7r9R7WFvE
	b/xRnEoCe3rCcBWoH8WNPJkeyAKH4eMPNPFgsHRVx0Y9b6jp/siZd7l5SvXtTju3Bsjiwg
	aPfwfnnBsQ5aLmhko1PAFch3QgKj0yo=
X-MC-Unique: XKdewn20NSaezgd0xnvhRg-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Oc06tngyUXCqw1W5XCnwfQZoI68JcIbQIL48qHLZJ2UNKzXHs3nei0il56YppGffZ7aHpQnqB3aTGhk4fBTz/pUlIK6Z6OBXU0gSNiAo+hHkDXzrhIfwBFeInMqGH4q1XrrSqj+5avw+ThjZU6PXhr0aAXaC3oQlySii+I1HRCooJRw98axW/7OSHXzqyOo8xbj8dC7lIDpfWBHCg6xPNUNRozmSxjdiw7Uio2FH2PGdU9l1aExIS1Nsi1s5TsYJT64nIPLjUhcVTyUST0ulfErphc+v7lHDXYHbH/AbM75crMKwZovD2QptpwRpsikmbSnI6iUr93SlOTT74Wm+vw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VR9a98SW9QQhm4ot3co1G/UWbbnwoswadNmfJgaDH10=;
 b=c9tifaSQSeTqXD3abFte43+K3QEOBgrDovjPcc9bNCjO0UT5H2sEXvaW3BAc8kFW3DrSEF+O5h10lZPtdfNXAzpd/GO9Nt0VPoavYh490k/vjVdZHwq6vUAJSa213z58rIwzJ06unOOqkkKSkubgjRtGI5GUxxsqc6axqQ0sFuwTNxKIbKixliL3w/CjGne8ZM1ub5YFm5Ao78daW/Akw2jBASApu/oJ4IXi0DpEazCNBx/++4mGFVBqlZnIuNSrbStMGLJEjEglLIy/9qB+PJlDHCTv/oIC/Q2dahpFU2Ibr2KIz1zz2n6g37YnvJlsDxXiBphQRSoeTX83Hunzyw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <7ebb1ecd-cbe3-406e-0dc7-4283c64717a1@suse.com>
Date: Thu, 3 Mar 2022 11:13:20 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
Subject: Re: [PATCH v3 0/7] (mainly) xz imports from Linux
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
References: <c0d6eedc-6ea2-5445-117c-0ba623692d0f@suse.com>
In-Reply-To: <c0d6eedc-6ea2-5445-117c-0ba623692d0f@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0008.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a::18) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0b792864-bb9b-4ec6-4e0f-08d9fcfe7204
X-MS-TrafficTypeDiagnostic: PAXPR04MB8781:EE_
X-Microsoft-Antispam-PRVS:
	<PAXPR04MB87812E31C4D54DB6BBEA8E02B3049@PAXPR04MB8781.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	60OAHqLfrwog+fGKxwMWVCCe0fPDFoCkSqzh3KPqYOP4SwJZaG2go9hWZ04nsQX5LGIHE7B+Xcm3L4JJRukmDlAwCjZLO8MKJnmGpplokivwBe1NBRYdFRL/rYC82QlMhYBHddjaoykOU1WfKU+TrUGTvvi7qjDdDR+gr942V6BWRp5Z3cfDmpARkzxQcsIFO7U4PxPbsEWfSG+6bMP2kgN2KBvL05grQY83c8gqGJr/gX8sBKvWTAQYyNVbfERppi5f/u+EK/hKWMIeFvenIjSP6KGVwlCCHeX72+hcJl7GkRmo8EAf2WwbJtnVeIlo29A6WLRxXJPViwcHhPqpDlZ3tDW3cOvadxvyW5ZhVjjK5PcnBd4EgcaXvn4QbmxAJqT3ZQrN6zTHzXzoIu4TIxNamzkAtKN3EnfUmke+wvsv/VU0mFxpIVtAop8Ft1Dz0gh7ehhJHWYbtSINIgM+UlOK+j1S59l/Pw7hYBzBKfUWSPkDI7O597qckiWJugFUU3+9BkvXy9JxA7bi/ECMNWPT7qOS4d13qxutGz2VgP/qxzo4lcmfNtxpTYkW+9NPFZpuNvZ7e2XGZ5TQtSC3oYJflDGs7TvXOLH0e6jAZy2OBzJitLDdVP/joorvg1qTTm7fwJdFyj3NwW4J77i90MiEvLAkvz2JaE6Yy/TrHlOw3GIGe2sxkc9te6pkiTzY/e4sdHZ4vnDjzNvZFzWhwc+p8XNPex4J03ukmLukdCM=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(83380400001)(31686004)(5660300002)(2906002)(36756003)(2616005)(54906003)(26005)(53546011)(186003)(6506007)(6512007)(8936002)(66556008)(66476007)(316002)(38100700002)(31696002)(86362001)(508600001)(6486002)(66946007)(8676002)(4326008)(6916009)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZnpYVDZhM3k2VlQvdHRkSW84OVVUcEdYV3d5T3pwZXBjY2NkWks2Nk16aTFX?=
 =?utf-8?B?ekJXVzJ0aEdsVHhYYlBOUEtpSEVYU1phVDFQNVUyd0Q2SVVqcHgwbVAvTTFP?=
 =?utf-8?B?Mk9vem9jcmVLVzlPVzZFblAvMmhNYnl0cFdWOFNpNjdkWXFKTUt4MGo2V0dT?=
 =?utf-8?B?VXRTeDVHWnM0VklrblpuYzMyQ3ZhRDBYa3ErV05jdWRHK3NUL0EwSjNKYk9M?=
 =?utf-8?B?NXFoOGUzK0x1d2c1RGUxTE15SUxZUGtORWRQNWxMNG9Hd2VwZlZ5amhXVm52?=
 =?utf-8?B?dSs1WmpkZExQSWppbGFJbU5JZ3RISFRhTWZUQzNXamJXRUVLRCtpN2JLYTFj?=
 =?utf-8?B?bW1ybnc1SjdmNzlibU5XN0JMVTRYNktuTjJQM2ZUTEhhb3dTZjZmSkd1OUpD?=
 =?utf-8?B?VHk1RlA2NjcyU2VweFQzcC9VSDJvb2pQRVJTVkQ0enFVSGgrdEU3OEVpSGFt?=
 =?utf-8?B?NzJsVWdVU1Vxd0poT0pObER5cTZoaEM2N205bHBjdEtCRDBYL3Y5VGtlYXJn?=
 =?utf-8?B?WGtPS1F2OWkvN2x0K2VhVWJzbzRrRXZHWEpURFR4cXh5eXJsa3BKNHk2bVRQ?=
 =?utf-8?B?QXlBdnA2aStMS1gvUlVldkl5WEVCK3NaZDdQVTFCaS8veC83eDFHU3hrUXJB?=
 =?utf-8?B?WmU0cSsyRUlSQ1JBMFN6YUxlU2tsK0hJSWlvdmVESlZybmVidk9mNjJybWhs?=
 =?utf-8?B?ODBEa05rRDhkWjh4ZmxqTkd1SWI4bHNGNTdSWjZUTUErTTdZOTNRL2tFS1BO?=
 =?utf-8?B?Vk5EWnpTRzlnUjZQYzRHajlCcUs5c0Urc2dCRmpxeXlVRVdDdCt4SDhVZGIv?=
 =?utf-8?B?YkJIVnRGVDFzMTNzUlIzZVdlRC9MQTRldHFpdlZzYnhyQ1IvOEdXcXFyUmZF?=
 =?utf-8?B?TUh0blNVek50VEhWTW1TeXZaTUdaOHZWU0E5bW1hSGlFQkYvYitlSkEzS0Yr?=
 =?utf-8?B?NW1obXlaZjZ5dURSVzRRT3VFTkJKMUJUVDlaMllUVE9Tc3ZaM3p5QmlqQWhh?=
 =?utf-8?B?UnJ0OFpJME1pSERVWlJLRTc5SGh2cXB4VTlnVGJLdnN3NzJ1ZGd1YnhqckpE?=
 =?utf-8?B?Q1ZKYVNqNERqNnlkdmIyQTFNZjQvcFpiSWdxWjlSR1FJZXk2T2haNmVUTXdN?=
 =?utf-8?B?WUpNUE4wRTF5VWJTa0ZpdkRndXRocWtOZ1dVUFoyc2dZSjJ2MG5NbHFtMnZt?=
 =?utf-8?B?V1UwR2Nydk14YlJJdm9Nd1hCYjEwQlp5MkE0UTNla1lqdkpNNjdOalZReHZI?=
 =?utf-8?B?bDZ2TGxzM09lbllMTXh4UGY2YVA2eUdNMXR5b0ZpUEphRzFsRHBWWEM4RWtz?=
 =?utf-8?B?REVucjJQTzlOYmtYUEM3NUJ0Z0dOT1Jla2NuVVpBM056azlXYWFJdjdwd3h6?=
 =?utf-8?B?dlppUGZySHg3b0l4d0I4VFg2UWsxNEs4MXptWTdwVTN0a21zd21WWThyclp2?=
 =?utf-8?B?VDFXb08vUE1sVWNCQk16WkFRQVBDc2h6U1JSQmxmVnJpSHhtQ1J4dTJGQnNU?=
 =?utf-8?B?bGlneVJKTnZkZXorU0k5NlpLU0xZeW9ka21zR1lZR2hoR1VPQWx1SDUxK2gv?=
 =?utf-8?B?V1YyMjVpeGNxSXI5UFNuRkVzbnpEWHZKTTMwR2RKQ0RZNE5ZUkVvQ1ptdzlL?=
 =?utf-8?B?N1V5Q1hCTkJkSEliTlo1b1FFWTA4ZGxPVU8wWmliZnBYckJLMkpOUXFjdDU1?=
 =?utf-8?B?cFdvNWdhT2FiT2QyZnNVNTE4WHFQVldMZS9ERGQycjlNWmRIaFpGVWFYbjdJ?=
 =?utf-8?B?ZVB1UEZPdXlNWmFyZGhSNW16b0IxQmlKZFc2endNL1cvb3JzdklYRk9nK3pV?=
 =?utf-8?B?ZEUxSlQ4K1ZWdHRiam1ib1VvZWlJT3ZhQzZpTEgxb05pZUlOZDk1ZGRVengv?=
 =?utf-8?B?c3lmRnowT0UyM3RzM3h2SWdZWFpBUTBacEZJNXZHQnpmbi9WL0p5d201Znp0?=
 =?utf-8?B?UXBaekgzRUxySTVXVXIwclgyV3VIby9ldk9CbVR5WWJXdVA4aDFUSFZRbWE5?=
 =?utf-8?B?SnZTbjRYSktERGJPM1J0K1cxd3l2NUhmaTgxOWRjTmFNODU0dEg2UVpod1Vm?=
 =?utf-8?B?aDRCSTVOYVRKamJxL2thOGFDZm9TTWE4S3dBYTF4Rm5KNjNta1pkZ3U5L1pa?=
 =?utf-8?B?SzcyQnJzL2h2Qy8zakRnYk9Icy8vNmJoaUZpVG1HUXdGTlN0UG5NYi8va3pK?=
 =?utf-8?Q?dR6hs40UixObSp4VcbgTbgI=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0b792864-bb9b-4ec6-4e0f-08d9fcfe7204
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Mar 2022 10:13:21.5819
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ocWy1NVK5PySaHDXsqe1+5YX+YgaeeauDD5g++K8lZph4PEEEW2gAnAGJvUdJgi04TtBVrl2eF1f3Hh2AWnI1Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8781

On 03.03.2022 11:03, Jan Beulich wrote:
> While going through their 5.15.3 log I did notice two changes, which made
> me go check what else we might be missing. The series here is the result.
> Linux has also updated zstd, but that includes a pretty large change which
> I'm not ready to deal with right now. Them moving closer to the upstream
> zstd sources is certainly a good thing, so I suppose sooner or later we
> will want to follow them in doing so.
> 
> The only change in v3 is the re-adding of some previously dropped S-o-b in
> patches 2 and 3, to satisfy the rules newly established by 5e326b61693c.
> 
> As the series has R-b by Luca and as the (not) retaining of certain tags
> was the only open issue in v1 and v2, I won't wait long until committing
> this; perhaps just until after the weekend.

I did notice only when already in the process of sending that I should also
have converted to the new Origin: tag. I've done this locally, but won't
resend just for this.

Jan

> 1: xz: add fall-through comments to a switch statement
> 2: xz: fix XZ_DYNALLOC to avoid useless memory reallocations
> 3: decompressors: fix spelling mistakes
> 4: xz: avoid overlapping memcpy() with invalid input with in-place decompression
> 5: xz: fix spelling in comments
> 6: xz: move s->lzma.len = 0 initialization to lzma_reset()
> 7: xz: validate the value before assigning it to an enum variable
> 
> Jan


