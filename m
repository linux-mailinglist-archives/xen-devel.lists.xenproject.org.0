Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 886EE5544B5
	for <lists+xen-devel@lfdr.de>; Wed, 22 Jun 2022 10:46:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.353563.580503 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o3w0P-0005Ag-Pk; Wed, 22 Jun 2022 08:46:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 353563.580503; Wed, 22 Jun 2022 08:46:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o3w0P-00057E-Lh; Wed, 22 Jun 2022 08:46:33 +0000
Received: by outflank-mailman (input) for mailman id 353563;
 Wed, 22 Jun 2022 08:46:32 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=kzGk=W5=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1o3w0O-000578-DH
 for xen-devel@lists.xenproject.org; Wed, 22 Jun 2022 08:46:32 +0000
Received: from EUR02-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur02on062f.outbound.protection.outlook.com
 [2a01:111:f400:fe05::62f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id cfa050a2-f207-11ec-b725-ed86ccbb4733;
 Wed, 22 Jun 2022 10:46:31 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by PA4PR04MB7661.eurprd04.prod.outlook.com (2603:10a6:102:e3::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5353.22; Wed, 22 Jun
 2022 08:46:28 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::dfa:a64a:432f:e26b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::dfa:a64a:432f:e26b%7]) with mapi id 15.20.5353.022; Wed, 22 Jun 2022
 08:46:28 +0000
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
X-Inumbo-ID: cfa050a2-f207-11ec-b725-ed86ccbb4733
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RDQwKz6et6h36fGijV986VAEdDrKS/IZUuzxyzx8Q28jgWpIqVTbkVWfxxLMAD3HZIi5pqO7p1OKzMeApqhEaSNkQiNYj/IZmOpRvCIbdhxnvnXzg0p7GpNDg9SRLot58G+nVMJ1tEt8PH0OEz1oH38WRNT+7aFOPMatG23eJO9uWe1I7uiNXyMxZ2zjdv9giwwJRTKer8JeCZaA5Rvz/EjHZlEZJdQ3GbikI0h99B2vlJEJ4IvSOMtPk68tnL/R36x6YbGXSSTHeCmK2EYqUMcZs8TpnFBVgSc+j3ZDvKpsmhTc2fuRVlH6VCe7f/soH0pP1eMBuFIMGeLDov9Yug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xfexDT+BrAztnNIMygwZKhS3UlXhMWRKZIm9dzJOBJ8=;
 b=n3M8B2rEi3VTKSwKSm8rX96LNbQFDA1nIup4qP8gStFn4x9ia1zD+vcaY5fUgP81LPIYHZ/qPlaPl1YGDaFjoFAxjV9WlpN0Hi8EBOxM1j9fnH7nZ9lCDbRY5kPFV8XK1YPTgTFMENbzD2+4L3RjfX8mnmky2v0nA32i6Vr0fX6lefv/6SX8paWBtjMTA4xAxM5+LvFKq4+oB2Qua0EHP2vY9OdoGI2JjeN5HF7yXN2aUWuLawtWwTmiHygTUnTbet3CTGal4wZpGXFFSQWsiWu/MW+KshaLnMv3Oz3S0+xUDHEBciqoe7Sqq3gYxjx+TbldI0Q0jdFqPwRsATn5fw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xfexDT+BrAztnNIMygwZKhS3UlXhMWRKZIm9dzJOBJ8=;
 b=Q2S7k9yyAyq+eHXvuWQRrX8nYJwNdxEo8l6sRI0Nvnqvgz6ZPHpvt82fKJw4UwWCoaEW6Zc2ddRjVcZ9XUsXWiklnTozgOpiWjhhx93ywIW9XZHYNEzcU0+m6QnmIWIplSbvY2dE/4Ekq+fAsKrjXhumHMxB4fDBnsF6pzYLa6H/n87OroJgoLEUq7n3++PSVcG1xFamFO46QYyBWOsq3kGkIBqySCNEln6/H9Dhgu//uzReLG6yTNHFWeXnucXkx09Mjk7jAXHHIqp/mxnQ8XcIG9P1tVkVoQTED8dFdFBLLAKsrIO+10COVDLCp5403Un0i1qF1CKx6RRhjVrBZw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <5a1eada8-90b6-f998-cb8d-6b0d1b781590@suse.com>
Date: Wed, 22 Jun 2022 10:46:31 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH v6 3/3] amd/msr: implement VIRT_SPEC_CTRL for HVM guests
 using legacy SSBD
Content-Language: en-US
To: Henry Wang <Henry.Wang@arm.com>
Cc: Community Manager <community.manager@xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 Roger Pau Monne <roger.pau@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <20220517153127.40276-1-roger.pau@citrix.com>
 <20220517153127.40276-4-roger.pau@citrix.com>
 <AS8PR08MB799195FC7D9949031F33802892AF9@AS8PR08MB7991.eurprd08.prod.outlook.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <AS8PR08MB799195FC7D9949031F33802892AF9@AS8PR08MB7991.eurprd08.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS8P189CA0040.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:458::7) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: baabdc2a-615b-4ee0-7bee-08da542bb2ab
X-MS-TrafficTypeDiagnostic: PA4PR04MB7661:EE_
X-Microsoft-Antispam-PRVS:
	<PA4PR04MB7661AE0B1B167F74BDDE240AB3B29@PA4PR04MB7661.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	eOrKED2alV4gYeYGlR6Sjo1ktXlHZL/lD0YsOxj6/On1mwa5U15IM1HWDTOotpugakgSgW/q/ApUbDZd+02cKb3a3AOI9Ki9ukV9mryzzg3qw8LZx5RnzMj6DYpxVeUD9lWvwZC/lH6OOuA/SBDgVDBDwpVYPuUcKFDbskxSphIIE//KjFBghs+0stiJ8Uh6N3qW810Zm1MEl4GdxC5iBcmEeoZjyXcrrMsDHN0gB/WfXqILtFlfYCeKoRqA2Ss6+0vT3zyJwM/7JYetHVEUW1sZCW7FxpwyWxONsyGJCU6LTezJ1DIwRkD2/SaJdIWYHdE3HOiCgPKz2ChuaBgTQ7zoVF8rx2frtiLNCH+6Ep46R0UtCH2U/ktQX4Y7CcdRE6yhvPf3y+8vC39kg0zGEwLP14tHNz8AXe1n21tx4Xz6+t6v2HcXZwEk3UNa916mOFL6FNsWaxuvq0Cp76w1BdR7rN5weySVa72IZ6kEbP8C/4K5lwUxfxE745HTSiHOOvT4eRcplW5D3+1GtFyha+wzcroly6Zf/3/0PvD0ep7+p2x/VM8aIKnU3rWvsqORVXH6b5+Z8DPZgKqVY1AZ69jRGQfiBLpJaCe12KR1pcpuD56MenauWFGT727sEVhidfSk5sM5NQV185k+X92ywnVll+woGOKFJoGtzTrxD1tvipvKf/PXtUmgkcJiLA1zJeOTepPulD7UKDC5O/RvFoA2gC7LaC+CACCVMx3sl9vys0/RJK6oMT4pR5cZkeNkqVSWvH2yd8YT3VSANalYmr3PAxN6f/kFxHun8+v2EtY=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(396003)(346002)(39860400002)(366004)(136003)(376002)(4326008)(6506007)(53546011)(66946007)(6666004)(6512007)(186003)(26005)(41300700001)(38100700002)(2616005)(86362001)(31696002)(66476007)(8676002)(6916009)(6486002)(478600001)(36756003)(83380400001)(54906003)(4744005)(2906002)(8936002)(316002)(5660300002)(31686004)(66556008)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZE1UUnRmN3F2ZmJ3NGdpYjRkOWlJNnF6RVZqZnMxc2xjdFBqR2xUbWpxcGtj?=
 =?utf-8?B?UFdweVFnL3JWMEZwZXhYZlpRYWRpLzJFTXk1NG01Znc2VDNSNE43NGF0YmVz?=
 =?utf-8?B?eDFZZGF3Uk5DS01pa2dZWHZlcWk0UWJvU2ZZUTc5T0RCZmlkejFUWmlYNFRL?=
 =?utf-8?B?RmZrSVRlZnpUN2V3SUV3QXJ4YThaMEVLdVFzeEhkdU9HQWQwWGZ5U3FucW9T?=
 =?utf-8?B?UGwwYzJjQ1IzRWdlNGorN3UxeEZiR0twZWlTVVpnSWVNSDZqOHk1cHA3TlpM?=
 =?utf-8?B?d3pBQUZJQjBmbnVOeVU4Z3BsdENRYlJKU1YwRDQxVjE1ckV1NVVBOWZMcFpZ?=
 =?utf-8?B?TVFDNmhuSTJiQTlCQmpvaTV0RDBoMENRcXdad0c3aE0xVkxDNGJRUDQyVk5H?=
 =?utf-8?B?Smd4M2s5UWZ1MHZOZUtBV2p4WTVZWEhvaDVid2pBMFZyVHFDUGsxQkw3d0c2?=
 =?utf-8?B?OU1hMlJlS3hDQVIxVnkrbmd0V2JoZ2NYL1ljUXY3OVhhc0hqUnlEcmNTMWhD?=
 =?utf-8?B?aDQ3MkNSOWxCeWZQUFFFZ3g4UnVCOE5NSEc3SWlTUlZOdmJTQ1RHR1d0L3J3?=
 =?utf-8?B?b3hmSFh5TVkrOWRsOE4wOXpNZE1nc1lPR0R4ZDJWTWc3MUlpZW9tekkrekFN?=
 =?utf-8?B?cWxxejhvbW5jcFR0OUYxWmo4dzlEdUNYMUs0UkhteWtjYkoyTTZDOW1MYkts?=
 =?utf-8?B?Q3kyM3R5UjRrL2hIdzgzekNtb3E5YjhZcThYZVkxK09KYldpU2NOY01YUkZB?=
 =?utf-8?B?Ty8zaGx0aTZLQTlpRUtBdTZJNDlwQlU4QmNLcnF1VW01L0hhWXA1V043OVFl?=
 =?utf-8?B?YmxKOTRqZ0VEN3NUMmpYMVF3UlNPdUVzQVNrV3BxOEFhKzFmSm54MDN3VHdI?=
 =?utf-8?B?SS9YV0E4dnU0OUt5ZDhpWUdpRTZoblprcUtOT29zKzBwMEp6WndRQ3BIeXJJ?=
 =?utf-8?B?MFFCT0dvVjdHOFJRT1huZlN1R09yQ0kwbzRUZkpmSm1EMmtnVi9zUWhLRG0v?=
 =?utf-8?B?dzZhOWY4YjdSZnRrUmQvZ3NjTDhUY3dVcGRraXJTdEJGRFdNY0NXaTl4QjNK?=
 =?utf-8?B?MW5kdjYrUDNlTGJwWUZtcWJlSE8rV2RVSWFZd29pc3d6RmxucjFDanlDNmM4?=
 =?utf-8?B?c1B6bVZNWXNpREt6bGIxT0FSNTJoelFHZWlKTjBuMzdxTE5kQWJ6NktadVBR?=
 =?utf-8?B?dm0xbXZ3Qysrd2ZYYytaZVZUOGFGUUh3WGtsSitvQ1l6czNSWGRJNlRYdFQr?=
 =?utf-8?B?UEtnQk9lOVZ2N051cUpGSVowZ2lIUjRyeERJVkk2TkEwbnBSbG1nUjJYUWho?=
 =?utf-8?B?WXltKzE3R0JiZ0twczR4N09jV0hUdElubkdDWVkxTlBPckFoaE5DTnBkaE9w?=
 =?utf-8?B?NFN5WEdoZnA5ZTdoVXI0dWI5K2MzVlJ4VmVzeXFrZTN1REI4QzZ2MGtYTnFM?=
 =?utf-8?B?cjN4MHo0c3ZDVkp1SHhEdWJXSUN4eXRjRkg4MVZpRWdvTWF3Q0VTUU42U2R4?=
 =?utf-8?B?MVIrUi9adVloTmF5QkFhT3FCTWc5VzNaU1UrTXQ2VXNJSmFRRHYrc0syL2FI?=
 =?utf-8?B?MkZpQVdSNDRMdHRQVGtuR05HUmRuSkNpdmd4bzgwYzRUc1BMUUV6STVYOTlR?=
 =?utf-8?B?eHRUZERrdG54MXFUOEpWeHJlWkVETXlsbDZpN1R5NE1XRkRINEREbVJFc0Uy?=
 =?utf-8?B?ZTE2UXVFSEV1NWcyaFF6NVFNOERiTjR4QWtUV2s0aFlGQWpkZEhHRlFGa0lW?=
 =?utf-8?B?aENaS1ZLdDdHU2R4WVg1cUZTTW5mZFozUXJYNXl2ZGZYNVlIZ1lrYkR4Ujhm?=
 =?utf-8?B?SFJDdXZLT1Q2RmRrRjhESkZPOTlkTG5qQzZGN1V6eS8wN24rZlM5YW5ETmRF?=
 =?utf-8?B?cWNVSXVsTVlxVWxwOElmOGhFYWFac0FraVo1Y0hNb3JGSCsyNjBieUpRWWsv?=
 =?utf-8?B?MEdpUWV1eTJrZ2FLN2JJa3NSZitNYXZkV0hxRnNOQ0F5dm9LMkVHUEo5cEFx?=
 =?utf-8?B?K0hidXE3bTI4NllUS2lOMGxkaGY2dHpyekhRSHZkV3V5TmJySXoycHdOWnFs?=
 =?utf-8?B?U29GNDFNSUwxVHltQjZNTU9YVnBhb0xwYVZrY3BjOFQ2cERZSnZvUE5Zb0tR?=
 =?utf-8?B?VlBXS2FRU1ZIQ3dnZUhwNFJ1QTlkNlFEVGZocCswcmxaR1A4L0ZyNk1PbVk1?=
 =?utf-8?B?ZUVWNVBKWS9MbmZZWS9adkY5OWFpYzA4VWVjREFhL0QvY0lHeGxKYVRnSm8z?=
 =?utf-8?B?VUZqUDdFQkxhWXNzM2svcmpRNkNkSk55cDNEOWMxMlB5K2pjQmE3TXdwU2px?=
 =?utf-8?B?c1ltRDRzTHhzTVBzeVVrQ0ZZNTVwOXVSYXFxR0V5MkNMWjZQNWhzdz09?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: baabdc2a-615b-4ee0-7bee-08da542bb2ab
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jun 2022 08:46:28.6131
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iFHUo4GnHSnMNQijSQeNie9yPM78W5eAs0PXLIYaPZhLKTS9Iu/N5ytaubivOsnQgCuqxdwxj0fz1fMQdF5bBg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB7661

On 17.06.2022 05:26, Henry Wang wrote:
> It seems that this series [1] has been stale for more than a month and also
> this series seems to be properly reviewed and acked already. 
> 
> From what Jan has replied to Roger and Andrew:
> "... this addition the series would now look to be ready to go in,
> I'd like to have some form of confirmation by you, Andrew, that
> you now view this as meeting the comments you gave on an earlier
> version."
> 
> So I guess this can be merged. Sending this as a gentle reminder for
> possible actions from Roger and Andrew. Thanks!

My view here remains as before - I'd prefer to avoid merging this
without at least informal agreement by Andrew.

> Also, not sure why my acked-by for the CHANGELOG.md is missing in
> patchwork, just in case - for the change in CHANGELOG.md in patch#3:
> 
> Acked-by: Henry Wang <Henry.Wang@arm.com>

At a guess that might be because that earlier reply that you did send
was to 0/3, not 3/3.

Jan

