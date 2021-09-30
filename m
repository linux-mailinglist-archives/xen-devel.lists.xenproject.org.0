Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 165AD41D971
	for <lists+xen-devel@lfdr.de>; Thu, 30 Sep 2021 14:14:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.199786.354047 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mVuvb-0001tB-3X; Thu, 30 Sep 2021 12:12:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 199786.354047; Thu, 30 Sep 2021 12:12:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mVuva-0001qE-W4; Thu, 30 Sep 2021 12:12:42 +0000
Received: by outflank-mailman (input) for mailman id 199786;
 Thu, 30 Sep 2021 12:12:42 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=lHSZ=OU=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mVuva-0001q8-4u
 for xen-devel@lists.xenproject.org; Thu, 30 Sep 2021 12:12:42 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.109.102])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id b4e88860-21e7-11ec-bd48-12813bfff9fa;
 Thu, 30 Sep 2021 12:12:40 +0000 (UTC)
Received: from EUR02-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur02lp2053.outbound.protection.outlook.com [104.47.5.53]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-27-JLtMH3sINxKkIHz7YCw7mQ-1; Thu, 30 Sep 2021 14:12:37 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VE1PR04MB6382.eurprd04.prod.outlook.com (2603:10a6:803:122::31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.15; Thu, 30 Sep
 2021 12:12:33 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b%7]) with mapi id 15.20.4566.014; Thu, 30 Sep 2021
 12:12:33 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AM6P192CA0085.EURP192.PROD.OUTLOOK.COM (2603:10a6:209:8d::26) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4566.14 via Frontend Transport; Thu, 30 Sep 2021 12:12:32 +0000
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
X-Inumbo-ID: b4e88860-21e7-11ec-bd48-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1633003959;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=QEISk7lW5cGpTfVXdr7Uq4IqbkSOrbZC3tjyIezCZzo=;
	b=BH1hnzscBByBrTDwN/CqIxeWoGG4aBSYJ63xuZ1ziKBTcg7dMjZ940Wicp8pvm+sygU8Rz
	iNE4GHBToPVfQcb7rYbFbHRG6I9ylzvYsNiMfH80ppmWujqNSnulfXKEgEdgMSd4x01kJd
	cZyeUaTicbk9D/ti4+nhjTciznOKf30=
X-MC-Unique: JLtMH3sINxKkIHz7YCw7mQ-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ODqMRHZ2QVJbk1/sYWquUYTxdgCqd1WDABi9PmEVHBu98VkJuXUHgFA+1PBzYonf2urHk3GYCestx74nqKd3jCIf0kIM+HNlnb5kNYdDD7YXCO4DVynXZITsJj2r9b1iWd9CEUGXTLGtPIsqmQWVWsDCrWtvJUShwD28aK3o8sGSpU6Vnh4+2AbLwx6We92oPDho9aeHCG3BKMFZKc9+lmVsPGGnvkngGSxcqb6OAJTS9OVjbXGSEzCFd1vDqDhCCJW7/jvNy8LShUYPnzsNWxS4nVnH6ngEO+kU3On7HLovF4OdTcW+sTpMtRdZK1tx80qSiqe/qsiiquDUBCWnvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=QEISk7lW5cGpTfVXdr7Uq4IqbkSOrbZC3tjyIezCZzo=;
 b=A7BT+0LbeiSNdnWpjdK/6zMLC950wGwt8Woe95yC61hgN+6rDb1ZKxw+/k+bs1tVCgQK8rq1ciNlRduxX1T7MnpZH0n+dvQ3jVRMY+2PGmH7FbsJP8H3nD9ByT/kgGuPoV5eT+w2UEHv+YxYw1RJ2/s1JJ949yDwWOvqST5TCPALosP6O4d7aMepix1J8Up6wSQcjl3iEB1VjYDXHCSDjJxE3RM+JIokfm1/9gZMb/ldT9YLOLox7WJgCI5QZrtVoh1VVGFG+dIrxjWXIaiTvT8uKnOW1J3uFB6QRzSGXbfeTkRFMBK3P6EtpARBLl7uzJkw1ZeUSKTk4sE8/H3T1Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=suse.com;
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH v2 0/9] xen/x86: PVH Dom0 fixes and fallout adjustments
To: Juergen Gross <jgross@suse.com>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 lkml <linux-kernel@vger.kernel.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Message-ID: <9a26d4ff-80a1-e0c1-f528-31a8568d41f7@suse.com>
Date: Thu, 30 Sep 2021 14:12:31 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM6P192CA0085.EURP192.PROD.OUTLOOK.COM
 (2603:10a6:209:8d::26) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ae202350-3d4f-4be3-939b-08d9840b951a
X-MS-TrafficTypeDiagnostic: VE1PR04MB6382:
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS:
	<VE1PR04MB6382FEC671A6C5A22987A4EAB3AA9@VE1PR04MB6382.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	FR4T0bpe9/MF4EthAX96l8WilIl24HM8Q6f+Pohv8SCzqSwpZQEnSWQAM3rEiAIWNLRrmLC4bWmDx2N0KfDFG5ix9xYufS1+iVSRMdlad5D4oUo0YXFXM4AI+QvwirlNTI2/RhMbYXTd48atV1lnfmJqsk+G+JJVvV4/iD+TbvjShf47SM6hHedCM/DtGG0U6JH6HXNdL3TqqsaEw1A1juE2m8dCl3YPV4oFUEli0loCiFvCs3RUJ0qcQmqTqg3rQXJXJgakT3TNoN36Rhpfoivhy3oV52xbHR5KaTn7gyHT4ZTlOxXooRnLRY8/7cyQdvjchC2M5DvS6RuSkRQl4fCMvzM1LxkyEgZTHz9l+oU0kE8ycOBpiUwYS3k7HuebXiCzYwNJt6w2Xl+jOfRu8dIOHGOSlYHNQrO8dOXzrq0afCcBtovR2u06KSk8SxmVojWWK0SLnTU/NJO4Y3zEmiGZ6UMyQ2DwqWbHUMpfclTo7NJA1AAA/aUwtpvf7j/DbWGHa9L80hq74ymZxaOyI1p3p/nWVYT+kwqW7BvHPfIospsDFd/tcSqyrilIm1lgJhR+lFvs2Wqng+RyjDO48jTalvVfWt8rMR64DxQW6kzYttoJ56cuJx16hxnnPFRpbZdkv9smPYkKdR3RKbY5mBdzxRKWg7JZwE6Ddo/3UyPu4pdFu37uPo8t2cg98wgxJOncnVQwb4cNUQehY8M+UyWGihe4slag9uDlQ0wYkGs=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(38100700002)(86362001)(31696002)(186003)(8676002)(31686004)(83380400001)(26005)(66476007)(4326008)(508600001)(316002)(956004)(54906003)(6486002)(5660300002)(16576012)(8936002)(2616005)(36756003)(66556008)(110136005)(2906002)(66946007)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TEVSVzFiWnFIVFdDS3RPdFhkMmxuKzdMam5sd1IyT1B3dzdyR3dIeWJPdzF2?=
 =?utf-8?B?dTNtbmpTOWlpelBYekl0eG90SXgzYSsyVWg3clllbG43WTNqR0dCRTFZdUNp?=
 =?utf-8?B?bFpKQ3dNTEE2MDlBSWRVWHcyTnhVdE10clVvd1VMZC85QXBTbEEzdTNwUVlP?=
 =?utf-8?B?N0lYRElFV0R1OFBQc2JxSS9YcTlKTEpFZjNqZ3RMajFOVUIrYmxvelVKamtO?=
 =?utf-8?B?QVlBLzFIM0VFMzZRbGVTNDMvSnpxNmdNMndRMGxsQXRVMWNyc0cwRjVkaDU3?=
 =?utf-8?B?SFhDTjRuVzFxTzNIcVorZUhDTmQ2L1hJdnZoZnBzUGoxS3dlMUsvYXZENUZp?=
 =?utf-8?B?eUwvdlh6U3o4NGlmajE4UURYMWdQNmdEOXlxOWVqSnkxWExnQlIrZjk4Vzlj?=
 =?utf-8?B?SlUyZFNCaVR5cWhRbmIwTkRCM3Ntc3JJbXNaWW9YMkJWZkpMTWM3RDU0OVVS?=
 =?utf-8?B?d2tFYmxqeFM5dVFBSXdMb1pPUmZJQ0t3aURrNTJ3TmU5Vjg3NlNoQVNURVJi?=
 =?utf-8?B?amtUUWZ1S0l0TzdPZS9NVlBBbWFVUEZGUFdFNGk0MVRlT2hBRnFxU1BTdGFG?=
 =?utf-8?B?emovSUZnNWRSZ29qYUVLUTNuVThzZHpxQ2tNeE5CL1V6SUhvRlJXbGlHa2Yy?=
 =?utf-8?B?d3VCcXgzVjZidlU0WDB2cmNTVys4ZTAyNytGanVZbEJtbHFUSXVzblBMSUhu?=
 =?utf-8?B?cjZTZDIyVFBWclVKQVhJa0hiUFptaUpXc0FkSVVvMG5QTW9BMitJWVFPMnFQ?=
 =?utf-8?B?TkpSaUFoZGJ3amVQVWtocjhqNXB0VE9PV0V0ejUxVUZweHlGNFI1c3lPTDJE?=
 =?utf-8?B?czZ0Ky9va0dPRDkxRFFoQ3NsR2N1YkVwSTZZajF0a2tneXIxWDFvMGN4bm1H?=
 =?utf-8?B?MitaU3pLQ2dRaEYweU93UHhlZmFlMnk5bTZOeUowUUI5YWhZaVJtS09NV0F4?=
 =?utf-8?B?Wlg3YThlcG9aVGU4UnR1ZHZZaGR2KzRBZjF1Rmw1WGIzUmRlKzM2Y1J3R2JX?=
 =?utf-8?B?TXJUR3A4TE8wRDM2VWU2clYwUVNZSllnK3VFWTZkVUpPZHBJVC9jQlo2VjJB?=
 =?utf-8?B?K21HWGtrUlhzWjZja3p5NlUvV0EzanJFK2dXVnVXVXRUY3lXN1cxbEpaclpa?=
 =?utf-8?B?bTVpakpWWW52NWN1UThEVlZYMXpNTTJlY0E0VkZudlA0eU9SdXhkZG1IaDJ6?=
 =?utf-8?B?UFFZbFRNb3FFa2ZNZDY1UHBubWhkWWI1a3FybXZ1M3RUb0VOVEg0Qzl2amVD?=
 =?utf-8?B?OG1YaDd2MVl5ays1TGV3cXZmcGJ6L0RHZEJwUUt0Y0sxcXpEMlhaSmVEckFD?=
 =?utf-8?B?dVFDZm1PR2VYVGRUSGtrd0c4MnhwdGt1YTlIaEtIL1Fzc0YwcmxXTWp2NHRX?=
 =?utf-8?B?bTZsRFNqNTlwWHF1TWtQK0p0dE12d3h1MzlxejlhdDk0RW9uLyt3dVNrUjN1?=
 =?utf-8?B?TTMyVTdGbHNCQXI0RmFUTUVpMlI3VmwvR0M1V214MUhTMnkvSmhVUXBHRElz?=
 =?utf-8?B?T3Z1N3BZUGFLMFZWNXYwNkRXUFhXN3BuTFRqNGczM2VDUTBPZ1Nzbk1QRmdP?=
 =?utf-8?B?bVZoRlYwcVNQdFM4NFloQktEVkFZaThJenVIOTE5b2Y3YTRudGdCWHJqRmtz?=
 =?utf-8?B?NjZtVWQrV3loS0t3dzY4VFY4SXB0eHBJNkdQUDhyOXdEdmRHUHl6NXdoejdN?=
 =?utf-8?B?TUUxcVYrWHJNK1RpNy9UaGo5RUlwRzlyaFFPL0V6eUNkNXpSdG8vNzNnekQ4?=
 =?utf-8?Q?aXsJHbJ6Ar011t4nWode5ixf+gCgZTOzXpZyDqp?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ae202350-3d4f-4be3-939b-08d9840b951a
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Sep 2021 12:12:33.1758
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XxWRJUU7dRPfmjmjzvXaaWx/SV972jQGpT4qIg6Bh93Yd0iwDXHzbxo3mA3jZUkY+k29WtjCkt2yAiZZDOWmrw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB6382

In order to try to debug hypervisor side breakage from XSA-378 I found
myself urged to finally give PVH Dom0 a try. Sadly things didn't work
quite as expected. In the course of investigating these issues I actually
spotted one piece of PV Dom0 breakage as well, a fix for which is also
included here.

There are one immediate remaining issues: Dom0, unlike in the PV case,
cannot access the screen (to use as a console) when in a non-default
mode (i.e. not 80x25 text), as the necessary information (in particular
about VESA-bases LFB modes) is not communicated. On the hypervisor side
this looks like deliberate behavior, but it is unclear to me what the
intentions were towards an alternative model. (X may be able to access
the screen depending on whether it has a suitable driver besides the
presently unusable /dev/fb<N> based one.)

v2 merely addresses small review comments in patches 7 and 9 (see there).

1: xen/x86: prevent PVH type from getting clobbered
2: xen/x86: allow PVH Dom0 without XEN_PV=y
3: xen/x86: make "earlyprintk=xen" work better for PVH Dom0
4: xen/x86: allow "earlyprintk=xen" to work for PV Dom0
5: xen/x86: make "earlyprintk=xen" work for HVM/PVH DomU
6: xen/x86: generalize preferred console model from PV to PVH Dom0
7: xen/x86: hook up xen_banner() also for PVH 
8: x86/PVH: adjust function/data placement
9: xen/x86: adjust data placement

Jan


