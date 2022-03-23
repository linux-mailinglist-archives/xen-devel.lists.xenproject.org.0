Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 82B794E4D34
	for <lists+xen-devel@lfdr.de>; Wed, 23 Mar 2022 08:18:19 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.293771.499176 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nWvFS-00082u-VK; Wed, 23 Mar 2022 07:17:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 293771.499176; Wed, 23 Mar 2022 07:17:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nWvFS-000802-Rl; Wed, 23 Mar 2022 07:17:38 +0000
Received: by outflank-mailman (input) for mailman id 293771;
 Wed, 23 Mar 2022 07:17:38 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=TYzS=UC=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nWvFS-0007zw-9R
 for xen-devel@lists.xenproject.org; Wed, 23 Mar 2022 07:17:38 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 50f9f2fe-aa79-11ec-8fbc-03012f2f19d4;
 Wed, 23 Mar 2022 08:17:37 +0100 (CET)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05lp2112.outbound.protection.outlook.com [104.47.17.112]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-17-YbVBUQ-HMCeKMV_vaCNsTg-1; Wed, 23 Mar 2022 08:17:35 +0100
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com (2603:10a6:10:2db::16)
 by AM5PR04MB2993.eurprd04.prod.outlook.com (2603:10a6:206:f::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5081.22; Wed, 23 Mar
 2022 07:17:33 +0000
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::fc39:fd17:1086:307a]) by DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::fc39:fd17:1086:307a%6]) with mapi id 15.20.5102.017; Wed, 23 Mar 2022
 07:17:33 +0000
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
X-Inumbo-ID: 50f9f2fe-aa79-11ec-8fbc-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1648019856;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=24d05wNlI9gx55noH4ybuK5koG6OXEWX1QXEsQFXk74=;
	b=iLbv+dn9O9QfJyx4hpQHuhsVk/JzbVKxpxvS416RfgSM1DArNP9uIwARB9WyymfzRGexDD
	gkY7hDu9jWdxsbFyLSgLMyDOqJfK7gfTU/1hRmYbmT3rbLLv2jEd8nlgPWzIaubMihe9Cd
	pL8Pn5APgfHNaVloZiXMge0cVDqYFqY=
X-MC-Unique: YbVBUQ-HMCeKMV_vaCNsTg-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=n94tITH14Mhb18E6Xu97ErCcgNhGmtvx+wmkr3l1sCyqmBwVhg3CcI29Obpp1Dmx+n3iOydDook8fvwiJU9dJZrpJFXHoHbbAQS+3L5SIVM6KHWb8DYujM/YEH5Y+wY5SrML1AJEjjsNLSfKqPzNce3whYg//sByjLIHF9zEkWcsj3WUsnmZhlCfKgju1zjnMuJ87q5gvWOqwg4au5WlEkof2uSe95+L/vkx+Fwm5Y0DJ8QwAZX9x4lGiBEzWi7Y3npjZbf1bdQuUhfRvJ1jtxAbnsAPyUSA+clz7rziW/cbxpBLrtf05KjbmwWBdDNb6dCavmj+EXp0kzGTmbTfUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=24d05wNlI9gx55noH4ybuK5koG6OXEWX1QXEsQFXk74=;
 b=eQ4XKiT8fA4YzMfLu8xpBeCHIV9edifrdzG3NcNL0xccuqw85RC9mhiTx4usX4bKNPQpWScZbBN1VNk5CGM9K+6zcLFTawK/wbTB1igP6HN5uzEMQ83Kd81+F3UrwZh5G0mGRPI0llEkEE64kJ+Dd+8zEtV36UGEYABFL+3hOkRi+sqzzi2cpdaTqUHYDEV0PSgTerCx1YcaPNEC16I3hLnXeInw6EYyBObXNnLri9ozRTvdMZxepqQbLnm4O8VaHZONhG2YqpP7nyWhBo0+U+uwkPFVivrVqVOAmT2kBdfp9Gwh1ZRAqIKifZ+CY+qTImnmP2ylY9rNCr5/w70i+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <a49b15ef-964c-85c5-72ab-d970bdfcdca0@suse.com>
Date: Wed, 23 Mar 2022 08:17:32 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v2] xen/arm: set CPSR Z bit when creating aarch32 guests
Content-Language: en-US
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: julien@xen.org, bertrand.marquis@arm.com, Volodymyr_Babchuk@epam.com,
 Stefano Stabellini <stefano.stabellini@xilinx.com>,
 xen-devel@lists.xenproject.org
References: <20220322202825.418232-1-sstabellini@kernel.org>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20220322202825.418232-1-sstabellini@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS8PR04CA0158.eurprd04.prod.outlook.com
 (2603:10a6:20b:331::13) To DU2PR04MB8616.eurprd04.prod.outlook.com
 (2603:10a6:10:2db::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c300c786-4542-429d-d870-08da0c9d3345
X-MS-TrafficTypeDiagnostic: AM5PR04MB2993:EE_
X-Microsoft-Antispam-PRVS:
	<AM5PR04MB2993C3AC18B0FB1A5BA2D801B3189@AM5PR04MB2993.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	e5Ky4XL10SWVQV6WqRYvJQLnAxoyv+dkqBHsTcFzkuUJa0Gv0P7lRRlBqYN+QwGQp4hZRMxptZtFcsmz+g2pdwCRby44pTjXEk4w1FTT2TP1cyVOjVrKIZeYYrNeFGpjEt6iTmT6b7VFIzlnrIfQ7WZ5nBHgA7XkqPMRcJA/OKsaPRzaHg/sD2qU8lFRV5NOIe34ODVhkMHcR0DvHf0Zeg1JVC/XNFB+v0kw/2TWV+AccEEtZr1L4sd7nDhlZ2iGtMWoqbcxZehi5iKCiz7Z9Cg1693W6oVctNDvNVEJ07SqoPfAExx0hZ+gDMJ+UtYf9ugWqc2ZLD1KFUbUddZGKJ27UE6zJESmb9DREmPamMqqXYUTrsS2QxyAu1G3BtRsj0NdevVQuJW7FqEbQlQlhsZw+Liod73ODRIqTcSoZ5JHLdBR+CZvTdEWFPSncqRJn2ymXFxn7xVEx0vXKJI95allPKjfcevybiQ8VjabXpdrkFrHM9gF0F1qfm0D8SjvLSfALydSSGG63BXniO9hqiQZSjrX0N3g5or+OsHLCbJ7AVIQjYf1t8dapPkpqs19JUptqsiXySEvhSFl5Pxy/DXFVUNDms30tJBfhmjZY4jDh/UviIpBjmtg0CvCZFPu+IwAgiNBXkyfbO2GDTRFme0sn/yJF99214o8/riIJNb836VVjyFXG17DOpYI5+VnvfkSE62QvApbSeowQuQPsOz+8QvANDyag+sHeSsltBWVDVt7lppmj/Zd7bPhF0YI
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8616.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(508600001)(66556008)(31686004)(66476007)(6916009)(66946007)(2616005)(6486002)(2906002)(8936002)(316002)(5660300002)(4326008)(8676002)(26005)(36756003)(31696002)(6512007)(38100700002)(86362001)(6506007)(53546011)(186003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WG1RRk94Ymx0ZTExSlUvcnVLVDVJV24xejZrK1cxTzhjVWJZeHJmWlpBU1NV?=
 =?utf-8?B?OVNWMmlXRWtCLzRXYzNtZW9QUDJLSVpsLzFwSE1JQVgvQURIWUdSZk02RE5m?=
 =?utf-8?B?T2xjdDB6RFVySkl2SC9vWlhYMHJWaW9jMFMvRi9kSnFOVmQ0WU83L2xkRnhl?=
 =?utf-8?B?SHduMWZ0Nm1hc0c3VnpnWlVRMFNZU1dwdlRoZUxxTjVEODErb0xvY3lUclZ2?=
 =?utf-8?B?VXZIM3JxdmdjSzM3UG1VVXQ2MXk5RGp3OFBKYWRueExRSjhrNGNZOWZUWjhS?=
 =?utf-8?B?Tm1PRFIzMEpRWDVjYXg4N016M2ZHZ2c2Wlk0N00xVDNRejlHblE0T1VVSFBU?=
 =?utf-8?B?cjk4VnZaeno0UVkwdlkxREMraXREdStwd2ZNYUY2QzR0ZlZkNThnbmdtRldw?=
 =?utf-8?B?VThJUzZPaENiZGQwcTJDMC9HcTRnTFBkZnZLYlVzRFNzTm5uZS9LUWZaNnBr?=
 =?utf-8?B?RkJqWmNwbkZwbjV5M2NaNlNBb0tqTDlhWDl3cEcyWlNCelRHdktjellUdEZt?=
 =?utf-8?B?SjA0Q1E1QzNRQTFzZlFkN1B6Z0F4dkFxaXZScWZNdmN4S3Q0N21PeUcrMVRZ?=
 =?utf-8?B?VXg5Yis5UnhQUzNXMXQ2Vy9OL0E1OWRTSWQwdXhOa3ZGeTNtVVBxOWhYKzEx?=
 =?utf-8?B?aEc5bXJDNk55Z3N3WHNtazNTR2hXNVhXY0xDNmlWbVUwaUhmRnY4MVNTQTk4?=
 =?utf-8?B?VElCS3dVL0tubWtrNkRaVUJjekVDOTJKMVhMTk9pV1krU0UyUFY1SHBBT2Vs?=
 =?utf-8?B?c3ZJa3hHSHczVG9JZEtCak93SVNYRkZpSXBWaFBlUjRzVi9TY3FWcHhFOFRR?=
 =?utf-8?B?aHl3QjM4SGhXNy9LS1BEUTFpTjY1OXZkTXNjaGs2MnhDQ215UmQ4ekZ6OHN1?=
 =?utf-8?B?WUVYbSsvTkZvK2ZBVXNZdG5Id2IraHA4VDJ4SEJKdks0Y0F1N3NwU0Q3ZHY0?=
 =?utf-8?B?bmhGZW44V2kvN203MCtQTWc2Q0x5THVtWFZOTjQ2WmFDSzVxR2hnV1VVVTdM?=
 =?utf-8?B?elBSLytTd1dkeDdObS80NG45d1g1Tk1qd2tZdnh3S1lpZXk5a2UxMWRkeW94?=
 =?utf-8?B?YXZkSWhTTFdnaEVKZEZHWmd1TExxejgvaTV6aVhOa0V6ZmRNZkxjWFNEaHMr?=
 =?utf-8?B?WTRNV2dEUVB5K3Q1cE4xbjdxSFFzcDVVZzRpTkcvQUlIZ3VJa1haVHRWSE1Q?=
 =?utf-8?B?RGd4bThxMnhXeFlDbVFWRU9aZCs2VHMyaDgwN3lwR2VtSkZ6N0Y0STBlSkF5?=
 =?utf-8?B?RHlvZWtMbDlwNzhObHBuUVIyWXlSdDhFcFF5TmQ0eDY2OVJJT2d1eHVoNHkx?=
 =?utf-8?B?bFhiNEFJNmU4OFhIYktLMkxZZkZFWjNrWWk2alRyVDRMMjVDMkhZSDZHdFhQ?=
 =?utf-8?B?aWEraHp6cDhJTFdESTg2eXVsMm9oeWJaTGd5b0xqbGpyYXdSd1NNblhFTjU4?=
 =?utf-8?B?aEQ0cWpmSmNqYUphMFQvVm1IS0k1MEd5NW03aXh5TkxlUFJlZmp5cVVreng0?=
 =?utf-8?B?V1JBMnlXSGNZSFdOT0dCUklEeVlWaTF5VTVlb2JQbXNJL29LMmlQWXc5WEt4?=
 =?utf-8?B?YjRmdnN4UmlRTDZ4UUV2M1plMzBFZlJYMHVkdnJEbGlhU2s3cVNNSEhJMnl6?=
 =?utf-8?B?d0FzbHMrYWthQUV3a2RyOEtWcGhaaGlnVWFEbjVveEJBMUlHS1Z0VTNaQ3FM?=
 =?utf-8?B?T3hNRDd4SCtCbXFyT3k3SVorczhOTDg4ZkYvLytEZVRWaXQ1dXJhZlRIaDJp?=
 =?utf-8?B?U2hUUTV2RE9yVXJUZUZ6NTU2NWpKL0pKK1crMEp1SUZMTXVucGtabEo2Tmxz?=
 =?utf-8?B?TzhaaVRyUFJFYWpGUkJJdjFxWjZFd2ROZW4ydHJCTU9xT3ovWFJEWFpTL0x4?=
 =?utf-8?B?KzZ6eGxuM2NDa3V1TjdzU251aHp3QTBIOHlieVRsWE45YStvYkpKL05GUDhF?=
 =?utf-8?Q?hiev3b2lukvl1EX/yBB3RICnEdTR9RjJ?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c300c786-4542-429d-d870-08da0c9d3345
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8616.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Mar 2022 07:17:33.7054
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HMApyE8r+tyOKRhW0QECeEjuCw5fAYceIi1HEbg5lfyj3T27/i0wqnkOgYZQk1B6VKuEaGl5wzh6PPABDIQuCQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR04MB2993

On 22.03.2022 21:28, Stefano Stabellini wrote:
> From: Stefano Stabellini <stefano.stabellini@xilinx.com>
> 
> The first 32 bytes of zImage are NOPs. When CONFIG_EFI is enabled in the
> kernel, certain versions of Linux will use an UNPREDICATABLE NOP
> encoding, sometimes resulting in an unbootable kernel. Whether the
> resulting kernel is bootable or not depends on the processor. See commit
> a92882a4d270 in the Linux kernel for all the details.

Is this a problem only under Xen or also on bare hardware? In the
latter case I'd be even more inclined to require this issue to be
dealt with in the kernels, rather than working around it by an ABI
change in Xen.

> All kernel releases starting from Linux 4.9 without commit a92882a4d270
> are affected.
> 
> Fortunately there is a simple workaround: setting the "Z" bit in CPSR
> make it so those invalid NOP instructions are never executed. That is
> because the instruction is conditional (not equal). So, on QEMU at
> least, the instruction will end up to be ignored and not generate an
> exception. Setting the "Z" bit makes those kernel versions bootable
> again and it is harmless in the other cases.

I'm afraid such an ABI change being harmless needs to be not just
claimed, but proven. There could certainly be reasons this is safe,
e.g. the same path being taken on bare hardware, and the state of
the bit not being specified there. Yet even in presence of such a
specification it cannot be excluded that non-standard (something
XTF-like, for example) uses might have grown a dependency on the
Xen ABI specification.

Jan


