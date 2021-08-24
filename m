Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CE2273F5DD1
	for <lists+xen-devel@lfdr.de>; Tue, 24 Aug 2021 14:20:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.171283.312562 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mIVPU-0005Ar-Og; Tue, 24 Aug 2021 12:20:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 171283.312562; Tue, 24 Aug 2021 12:20:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mIVPU-00057V-LX; Tue, 24 Aug 2021 12:20:08 +0000
Received: by outflank-mailman (input) for mailman id 171283;
 Tue, 24 Aug 2021 12:20:07 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=mvQ+=NP=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mIVPT-00055s-Bq
 for xen-devel@lists.xenproject.org; Tue, 24 Aug 2021 12:20:07 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.109.102])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 7730dc7e-b78f-49ac-9156-420fb75c6841;
 Tue, 24 Aug 2021 12:20:06 +0000 (UTC)
Received: from EUR03-AM5-obe.outbound.protection.outlook.com
 (mail-am5eur03lp2052.outbound.protection.outlook.com [104.47.8.52]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-33-SI1zAqYEPJq1vQnv0BKtIQ-1; Tue, 24 Aug 2021 14:20:04 +0200
Received: from AM0PR04MB5587.eurprd04.prod.outlook.com (2603:10a6:208:125::12)
 by AM4PR0401MB2420.eurprd04.prod.outlook.com (2603:10a6:200:53::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4436.19; Tue, 24 Aug
 2021 12:20:01 +0000
Received: from AM0PR04MB5587.eurprd04.prod.outlook.com
 ([fe80::4822:460f:7561:33bf]) by AM0PR04MB5587.eurprd04.prod.outlook.com
 ([fe80::4822:460f:7561:33bf%5]) with mapi id 15.20.4436.025; Tue, 24 Aug 2021
 12:20:01 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 FR3P281CA0040.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:4a::8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4457.6 via Frontend Transport; Tue, 24 Aug 2021 12:20:00 +0000
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
X-Inumbo-ID: 7730dc7e-b78f-49ac-9156-420fb75c6841
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1629807605;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=xMcInLkTOC6aqL0Kvqwr2p25IHw8varYDATpodJKymI=;
	b=dL+x67tfyo82v2bnLn5SarzkD+pFq5aPVbmHu2XdZTCRw63PUZBUy2PEqvq9TuY4WUs/8a
	nTuWPIH3KEhhBBDqIEh1z+osP8zFk+0QbTRvxpnJuEDUJ2nJsLb0fIP0PmDFIWSqYd6WPa
	ygYb97VUzVNFkZjblzNP8P8fPIu8IUM=
X-MC-Unique: SI1zAqYEPJq1vQnv0BKtIQ-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Q9+6ih0eL1RpDMrW/qG+RiIjYAUD1h6CbbMWK5+mY3hum3jC7o3HWfinTmh4BimBwEmFIAIQG9RSyiLREn0RMy4S4F1i0QzJl2clYc3oqL0uAyQq93vogvXto8dOD2sJW8yMF9Y6eapimUcsU/P3dN8B4SSAACN0T6ndATBmqbkJVJg6Ar0x0jIM9ONqTf85sCXd/tpgNbECpXerMAdfpZXVwb39N4EvtIIVx9eZKoOOCS/KIa4L7gQpsJOMDOYz5CLc89CYsD+ej3NGW9O/ZP/1lt+pkjxKyAy3q+DquHEdWtR397NkguN3NtBl3NDO7NKLgpczgGJVcCtmRKNQDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xMcInLkTOC6aqL0Kvqwr2p25IHw8varYDATpodJKymI=;
 b=ka+D7ykkf9fGWq2JkfYx/7VUiyP/mS/+5F9hSwvJ4ZcdDild5zgqrxmdZMNxFJ9dRWkxy5agjWpa56KnbmUmXhf7Jh+cabj6846anu3kYA86RBffNXFymM7ejE7GGaBqEjkivflqj/ACaALO/JxqIaXACm79ITqJdL4tcIItyhPuG05DXCZRJVN+xn0toC1Mja7qS5QTbmCrKCwqJ9d3GVEoIJ4qy7vrET4sDn4SmUiVLv+kASqsll/qZke38Ltsd9ZxBL+Ok7jeoIrMxqA3qiYkuFV63cnzdofwwKYXBTsqAExXDNDvunK3jCpMaUszMSqOFEKAtF2qLJcy+B8ORw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=suse.com;
Subject: Re: [PATCH v3 3/6] arch/x86: rename debug.c to gdbsx.c
To: Bobby Eshleman <bobby.eshleman@gmail.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, Elena Ufimtseva <elena.ufimtseva@oracle.com>,
 Jun Nakajima <jun.nakajima@intel.com>, Kevin Tian <kevin.tian@intel.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 xen-devel@lists.xenproject.org
References: <cover.1629315873.git.bobby.eshleman@gmail.com>
 <9ab53497cdd52e3aeaeff8079d934dcee94d6479.1629315873.git.bobby.eshleman@gmail.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <aafc217e-e998-7610-04e5-9cf7fde904ec@suse.com>
Date: Tue, 24 Aug 2021 14:19:58 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
In-Reply-To: <9ab53497cdd52e3aeaeff8079d934dcee94d6479.1629315873.git.bobby.eshleman@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0040.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:4a::8) To AM0PR04MB5587.eurprd04.prod.outlook.com
 (2603:10a6:208:125::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1ca85505-cf90-4818-3cc0-08d966f97ead
X-MS-TrafficTypeDiagnostic: AM4PR0401MB2420:
X-Microsoft-Antispam-PRVS:
	<AM4PR0401MB2420986A3E0F188C1CA34824B3C59@AM4PR0401MB2420.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4941;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	9K7UR7iPzU2vRw681f5mabzXw8H/2XmrLtS81N+P947tCSclYRHQEOVE7MaoQ/6MFq6+35ozpnBS16EgyWiv0rHRonwEpVkfyB0YRfjou/UhXm/eJUBi/yy3QbEKGvjNjQchry40PJPqgqjBX0byp0OU79V9Uo76kfBLFf5jWAGkYoMm3a7L5A9IJZ0/qpsCREkPL0SBjXxjkTMCpjgiz/Iho4Y9PJOVxbSIYVyaaojfI0uIC9XMw89FpcBJ367gUAirHzk0d/0WucdRXRtyrmF9GkQlEODZymOKOS3C1Y2KrcAyzpT0CQqLwLvrs7SePkaH4lYpEfQlRsFNupKVGO7EXWKOM7gEZkLcgWFPOJBvhi86pDNAWFFFwK0SeRzoa2zDSLic9MOh5MI9SU3+iCud38LoZng+bKoycTVHtj9NhYE6lv5qjjgcmmyWHtes2mowlzB2rxp26UwV2ufMnCl0Cmi4505kD97KGTeD3rngR7kqhe+IdZRT88dJM/YNOKrfHQB9kOao02p2OfXTXektuoG9SEm4W4U7vhXcIgxISnrOkCPb9Nwp8o2dw6w7aBispv5kgVHn4B3eAmOXjFbkwBdMPFuIaCH8g2ByNCNeojOEAlq3F8uZ8U6L44jychfTvgyZlRVKwhDi/sa3S72oSk30uIeW3ZEGW+c3QlxRLtyDbEKf1osxT7LN2KVhlfbfP7HfplJyLkFXfgH4IQXT49cvmqnlsonG/yoGUOg=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR04MB5587.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(39860400002)(366004)(376002)(136003)(346002)(396003)(6486002)(38100700002)(7416002)(5660300002)(8676002)(31696002)(2906002)(8936002)(6916009)(66476007)(66946007)(4744005)(2616005)(956004)(36756003)(54906003)(16576012)(4326008)(66556008)(26005)(478600001)(316002)(31686004)(86362001)(53546011)(186003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RTd2WjJ0SkVLcXJSVkZTc2JYZytHdlNLMFdjQ2YrM2xhZDYydTJkWmloSTRZ?=
 =?utf-8?B?OXNFTmV1MG9zcEFlM0hzNHJjMXoyYU1UNWtraG5SYXc1dzc4UEtGN2FaUUJJ?=
 =?utf-8?B?djBHc1ozdlozdFBRc0tia1JVbFJYeUtDZHA4ajhOemZWZ3NsMFQ3dGpMYm9r?=
 =?utf-8?B?cXBVTlRCeG1FUWphTmNXb0toMHdMbmxScFZyYjc2alZSZ0pJMXFEUDlLdzhO?=
 =?utf-8?B?TUtpdTMxWVE4UXMxU0dBTWpuVFBoaTlHcVlxN0xHRGE2aEhiTHk2S0hoQ1pZ?=
 =?utf-8?B?L2xUTXN2a0wzbDA3NnV4bENJRlFsWEN4VGh1THlSTUU1b1h3dm82S0lUN2Qy?=
 =?utf-8?B?b05hYmdLRnU4clVOMmZHQ3g5U2hXYlR6YkhPb09jTThKWENVRVA0eU95TjFI?=
 =?utf-8?B?OWFwazdnaGZpbFh4RGUrcVZjYWRvLzQwcW9IYnlIUm4ydVM2MFk2STN2Q2J2?=
 =?utf-8?B?SnFLZjNNRTM2QVhIZFVYTjhPS3R4cnk4ZEsvMXcwWUhIVmVOY2tLZmZMK0Yz?=
 =?utf-8?B?c1dOZzJPbEk4M0JUdWpzTDQ2WEJtQ2RiZ285UHhXeklZY2VTdU9ZV3pYMUtp?=
 =?utf-8?B?b1FNQWNSaDVNeHkxYlZVUUg5RG9lbHJvdDloeFVFVGw1SVV6WStWT0xzZmZ2?=
 =?utf-8?B?c05IS3BIMzhmRGgvZUMrUXZEbTFWdUZ1VURlcjhGcE9TUjB5cXFzV3MrVHA4?=
 =?utf-8?B?Smt4RGRGd0N6RkFYNGo5eHgzM2RFaHpXMDNPeTF6eW9KYW5mNDd0cGRJU0xO?=
 =?utf-8?B?NktJUlNkT001bTlUamdwRUxqNEVNc3NVaU1wK1Boa0pIQi9Na0pFWnlXMzBa?=
 =?utf-8?B?d1dicDNIcitvT1gwcjMxT2lndVo1Tll5ZHRsZ2U2bWpFUHlhcW5PdkpRK2pO?=
 =?utf-8?B?ejBNUmc4L3pzS0RpaTkxYjBGWXFjSFJ2VndHc3ppSjM2QklOODFSNWIvVDlD?=
 =?utf-8?B?djdOcDdTUmc0Q3p6YmVXdVM0VTlFN2Y5TGJicldXVHNCYm5jYzFsT3g3RnBH?=
 =?utf-8?B?UGhuVldQNjhqU3dlTy9WdTVtZWc5WTl1TkNDTVlLUTVIWXEzNEF1a3ljN0Yv?=
 =?utf-8?B?QXZBWmp1dkRBcnZGZzVQSDlJYm04R29QdEhVSU1UeHZxNXNQUFBEWUlRTC94?=
 =?utf-8?B?RWhaaS9RejNjWWU0Qk9DeXhIVzM1RWhZMlNHb1k0aEpzb1RoSkpwRW03YitC?=
 =?utf-8?B?R296enVpc2ZZZXo4U0FwTEdwUzd0VnRyd2x4Ukd2UU5OMzBxQnk2V3NoZ0VL?=
 =?utf-8?B?WHNQVVdNNmJ0cWhZd29ITk1wTnl2ZHpMS29uZGxGRms1dFhpOUs5SjBHQzcr?=
 =?utf-8?B?aVlrSkJRdE0wL3cxOXFHVC9zS2I5QnJEbENHMHZFRzgvSVgyeCswVXBKc2NO?=
 =?utf-8?B?Wm1HK2NJQUMxNXdwUTBqM1NrYUs4REFnblkrUzMxQTQyRVZhYno1YW41YWho?=
 =?utf-8?B?ZjFmQWp0dklGRncyazFKWDdVZlBCQytmMEE0M1hDTUZjYzN4Lzh0VjJqOHA2?=
 =?utf-8?B?MTlsL3FVc0dEUVdmcUtkc3pPTVN0Szk0VS85blQzU1FrWGFpYTUydG9JOU1k?=
 =?utf-8?B?Y3ByRkw5QngzRVd4OEF2alZ5RTVyMnQ2aXlUTUZoTFlraXcrSG5KSjhGRmhw?=
 =?utf-8?B?K1EwR09LVkFESWJERHF3OGxkbmdTa3E3bFVtdStDbGRhZFovU2tvTm1ZTTlm?=
 =?utf-8?B?ZkZaUWR6akxielB5dG5WMHhISVAwWko4aXgzQm45dE5FZW8xU1hXUTB6Mmly?=
 =?utf-8?Q?6h489aZxwSoCC+hfGT05F8yMbzDTlmKqZ06Bm3Q?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1ca85505-cf90-4818-3cc0-08d966f97ead
X-MS-Exchange-CrossTenant-AuthSource: AM0PR04MB5587.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Aug 2021 12:20:01.0716
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kNpz35gC7crnk4LjstfcMptcF0Gv56QawuJ8nEKbd9IidXBeWRx9GzcSZPMr9929Eiv6D7cUOtq6Z7ri2xbpZg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM4PR0401MB2420

On 18.08.2021 22:29, Bobby Eshleman wrote:
> --- /dev/null
> +++ b/xen/include/asm-x86/gdbsx.h
> @@ -0,0 +1,17 @@
> +#ifndef __X86_GDBX_H
> +#define __X86_GDBX_H__
> +
> +#ifdef CONFIG_GDBSX
> +
> +int gdbsx_guest_mem_io(domid_t domid, struct xen_domctl_gdbsx_memio *iop);
> +
> +#else
> +
> +static inline int gdbsx_guest_mem_io(domid_t domid, struct xen_domctl_gdbsx_memio *iop)
> +{
> +    return -EOPNOTSUPP;
> +}
> +
> +#endif

In addition to what Andrew has said, you also want to make sure
- domid_t is actually declared (need to include public/xen.h, I think),
- struct xen_domctl_gdbsx_memio has a forward declaration (ahead of the
  #ifdef).
This is so the header can actually be #include-d without needing to
worry about prereq #include-s.

Jan


