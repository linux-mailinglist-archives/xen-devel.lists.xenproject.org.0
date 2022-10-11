Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 44E6A5FB1E9
	for <lists+xen-devel@lfdr.de>; Tue, 11 Oct 2022 14:00:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.419657.664482 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oiDvZ-0007Ro-87; Tue, 11 Oct 2022 12:00:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 419657.664482; Tue, 11 Oct 2022 12:00:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oiDvZ-0007OO-52; Tue, 11 Oct 2022 12:00:05 +0000
Received: by outflank-mailman (input) for mailman id 419657;
 Tue, 11 Oct 2022 12:00:04 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=lm68=2M=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1oiDvY-0007DV-D0
 for xen-devel@lists.xenproject.org; Tue, 11 Oct 2022 12:00:04 +0000
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 (mail-eopbgr130053.outbound.protection.outlook.com [40.107.13.53])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3cfb5adc-495c-11ed-91b4-6bf2151ebd3b;
 Tue, 11 Oct 2022 14:00:02 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AS8PR04MB8852.eurprd04.prod.outlook.com (2603:10a6:20b:42f::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5709.15; Tue, 11 Oct
 2022 12:00:01 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2459:15ae:e6cb:218a]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2459:15ae:e6cb:218a%7]) with mapi id 15.20.5676.034; Tue, 11 Oct 2022
 12:00:01 +0000
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
X-Inumbo-ID: 3cfb5adc-495c-11ed-91b4-6bf2151ebd3b
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LGh+6mIDFH03iyWvLNoDUhDHfXY3QVuY83jbw7u+aQSi6ga/kBxCB2zr1XSi0yyetJpJEQjAP61EuX06pEV6k+yuAWtGgQZ4WD2ko2mt5p9KKhZ5c926zJ8ALSMEW7MVIOKq2Kjg8qceiGTw2iwn/z9XW28RDXVYrUC4Jlwsebc6OS1vDxpdB77UO4+aKemT+vUMzE/44YSikVuiL0agRuPBLrQEax6zflWHL9l3f3Z2wi8U0Oc5SYR1UqMRLGHhP6ynkgW+WVg5bFLldVHsESty9bWx4FD/JQgQGTCXvhfmCHSyTdxJw7BIQ/RD4CN+PzhRvGSZhF+CCfTnihNb7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XatgHpPKUxXVOOyNfudNkIqba4tIM7LNzz3DahNNyR0=;
 b=e6L51KQusJJNldmen6TAMC9P4f7DA01DBQrXVMfQwsXJOfjharkdBcGe5m6UFKE56LnN6uSoYLTDNtQRKs03PEp7Qxnd+c3cVqG09U/N5+SCZjM08YrRrDU7h3P6oK9SID6Dn5Hor2us8ppxUYfRCcJQd0equEj6zpqaKjdJzqft2xEqUf4AlUy8QeOVPk86sEzh8OYBZrr6u35A9eU+i5vtSlCm2DanQZCmwMnrGc9WZEGKiu5xy2PgpBCSTCmmcJ6VF/ksArqWbw8z5GFzIKKQCSGpX3+k9vi9PAWWYfFXKL63ILOzQdgKxuDEH6jKNsQSZEtMOOq5NDTmSYCxpg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XatgHpPKUxXVOOyNfudNkIqba4tIM7LNzz3DahNNyR0=;
 b=N10kQ7aWG7Pt8K9jOQ00NlhjCDvl+Aw00OeSRhUBenfgcX0tTZSJ0PgTk8ObPmNqTGmwwyh7+V6tKOjnz4RvHvu7Fsbhm3PSvJKqfLtB1jVyhW52ytxR0LtZwL77sYmDGHzuRi2ypqCSp163Jk4DGRmneTsQngW4K64QfHEtLe5A7c8msjUBH/WbiOgqYHRB9CZUENr954razsBDNmtp22Yo9Nh3axXwTF24Q6fQpQOkjd91KEmkZ35L6N43cbYJ0TFwhEKQ7odnSx7CTdWGDkN0mfDZ0RXY+pbkYAtHwKiz7kzQS0Gst0DZmYmhvNLq8fqAUTAzKDcJJTmtCMfn5w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <df56f268-59d8-4b9a-52a6-40bfd0b91414@suse.com>
Date: Tue, 11 Oct 2022 13:59:59 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.2
Subject: Re: [PATCH V7 2/2] xen/gnttab: Store frame GFN in struct page_info on
 Arm
Content-Language: en-US
To: Oleksandr Tyshchenko <olekstysh@gmail.com>
Cc: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Julien Grall <jgrall@amazon.com>, xen-devel@lists.xenproject.org,
 Henry Wang <Henry.Wang@arm.com>
References: <20220716145658.4175730-1-olekstysh@gmail.com>
 <20220716145658.4175730-2-olekstysh@gmail.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20220716145658.4175730-2-olekstysh@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM6PR04CA0020.eurprd04.prod.outlook.com
 (2603:10a6:20b:92::33) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AS8PR04MB8852:EE_
X-MS-Office365-Filtering-Correlation-Id: 2bc76c25-4e57-438f-1966-08daab802016
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	D4660kSBaPXqPuncWIUVR1OhuIwP2UnAtPUauIzeapsi8xAihE/vTcCpaZt8NRmC+NUhC0Tgit51XrchRfs0GaV1eLb2pwVSwpyg0d/XZn6nyY2M1F5Iy+OETNQaLfYilhVR77CCcbyjzx6nTZZKoobg3KFUeFAsAnmyXAeqIZIZDAJLOR1EuYphVIfHOTiEatO5FhhVBG1G1yPi35zEmn4rwoo987cA63FnAySInrUMwPuWagm7ToQXHf1tZsiaH+U4VfnMuRc8Yax+hHtUipL+d+b2Vn20WMZI38Py4UCC9QggYZsg55Xfvynn68uucp1BIUu6ZTYtR0D+jrYtaw4Kjc7PJdTcDGL7iwZeaPGVUeLZjVuGe8VK0wYTqaqgtBQkjypTIpp3p80bhGLoI0Ta1XvN3C4BvfprEHKhCdRYzxuoKe3OjUaRbCkuscUkJPuxLfWVzuXCTZJCWmljH+mVLdSEyqxBKcXmSpb4OlXLr/K8bT8Q0wcC5hb2y662dW5lrKWDiE1EHMUGe5vFNDnMEFFbGkor+eNVgD8LXKT9tz3/Q1IfiWt4Zlh0F3N0FdU3hqdZblm4yBBCUEmSCcYAakrnoOgztdE8smqEHwWKgO3Uvp1mPQrh7fYv6p/briu3NiU8TGy3c4EZ7IhEEswj8Fv1XEoa9dFgwx+AHcpZx1Kd9WUpcAaxrjymT+cFDJNdtIDrT+juayhtQEvF3a7KhjSa1De1WnlZ2auWZMNPiK4zrG8lkIejjUZqcnQ6Y+oygnisVnA0612j8PT2kTh1bERs35vd8Ubxx+lhTeA=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(39860400002)(366004)(396003)(346002)(376002)(136003)(451199015)(31686004)(6512007)(26005)(6916009)(54906003)(316002)(86362001)(38100700002)(6486002)(36756003)(66556008)(83380400001)(2616005)(53546011)(6506007)(7416002)(8936002)(31696002)(5660300002)(66946007)(8676002)(186003)(41300700001)(66476007)(478600001)(4326008)(2906002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VTJHaHJrdUxPVDMyczgrRUxjdkJyR1Axbnh4NzZKeTlFMHY4RDRtN2JFWDFE?=
 =?utf-8?B?ZjN6SDNuL21nT0ZpMGxrejE5Zk5ZTjRHcGdRMDY5N21KWjhELy9qOHY3OU0r?=
 =?utf-8?B?UjFvekZpbyt1clE4Tmhzb3JVT25waTFRYThxQXo0Y2JSUDg3RzlVNnNHd2Mz?=
 =?utf-8?B?SlI4WlRYM09YZHBqamYySkdqN01TZ3EvdjZ3VWN3QXpibHVYL2tmbHZOTUty?=
 =?utf-8?B?NlFvWkJSYUdndmVoMWxLUzFqNCtvOUxqTGNVSWxGVVNRakNhVDlLNWl3TkJS?=
 =?utf-8?B?eEZZT1orbTkyTUFDWjFrdEhtVkF1eU5nQjh4ZW9WRzNPallMTFdyYXR4UzFC?=
 =?utf-8?B?VzZseVVSdXdVejNYRFZOOFkrTFRSeENtZzBVODZyMmg5SlF1NVhMQzVCVTFG?=
 =?utf-8?B?N3Z0TkE3dEoySFhJNXlVKzlkUW1hV2xTN3RmU2NBR3JodXd5SGlDREJTV1N2?=
 =?utf-8?B?eVVPUmFpNnhDcEZkWE1SMkNVekpJWEZkdEFHTzJSN3JkcXBPS0xOd043UXdD?=
 =?utf-8?B?dENWckQxMm5rUWN5bnErZHVxSXpzMjl5MlBVSUs1L3VnWEZuQmNSNitxSHRQ?=
 =?utf-8?B?VnNlaWtsSXJVK1BoY0tvR3NqcHJKSFRHbUwwZjIwL25rQko5TDNURVF4WWMz?=
 =?utf-8?B?eklUeURSZlgrVTU5Nmw4MExFOVNOcVBVT0RrL0w0YlVORzlBMHpid1NOUnda?=
 =?utf-8?B?NkYvQ2ZPMy9vQS9KZWFKYnZuYnYwc0M0eE04dGpTNHE0M0pQZVlJeFFEbDVF?=
 =?utf-8?B?a3UyVldhS3NYQ1hoRzRuOHpNV0c1c2dXMXhkY2RtN004TXZqbU5RVXJFQmhI?=
 =?utf-8?B?OHlNRzRvZk9mMFIrNnlTN0xiT01xRHJnTnJkb0lRc3p5eHR4OTF1UnlGQW9N?=
 =?utf-8?B?SFQ4Z1dOV1JLc0U3bkE3Nm1uUUEzSnJadm5EZ3Z1ZGh5UC9lYjMvVmpQTUVi?=
 =?utf-8?B?enV0cHE0b0xkZUMwSWREYlRkU29tS3l2S2MzRGFtTFdvUHpVRjUxOFJ2cHo5?=
 =?utf-8?B?NGFiM1ZvYWxFdVFhYU5xaGlpQ2Z0MkxjYkVpWWxXRVBmaHN2a2dFUTI1MVlM?=
 =?utf-8?B?ZUVhUDNSdXc4Z2ZCVXlsOGtueUxwMzFtNlhES2NEWkZFd2l0TUN5aFlJM0dz?=
 =?utf-8?B?VGhKemRuRkhJejRrcW1CU2hDeDhDSkt3NEY0UG82K0hEZ25QTFdaaTgxVXRn?=
 =?utf-8?B?QXFFb0t3ODc0VEVMb1E1VXlZbGtaSDI3NUtENnlLMWhmOXVvb25pT0tJTkVa?=
 =?utf-8?B?NXVKZjFNZ0V2ckMyc0RCWlNaa0cwR0V6OWx0a1NDaDBsZmhPSGQyS2c4M3ZX?=
 =?utf-8?B?Sk42THo4NXR0N3Y1MnpDbTkya0RvWmlWWldHcmhHZXM1eCswQWs1K2FlUjJS?=
 =?utf-8?B?VGpDMFI1VlZmNklKT2hLdW9IQndFS1FFakhPSlV3blJUN0laUFBWd0xPNC9h?=
 =?utf-8?B?b3VOd3l4ZVdxOFhkL0l5OWVuMFFhU2ZiYTdjQUJaZ0lBSFRTbXphaUh4ZEZ6?=
 =?utf-8?B?M2tsWGdZdldrVVh5VFZTZSs1SjkwOEtoc0FlQURZaVZ0cTRoNDJPRFNCR20r?=
 =?utf-8?B?YVF0ZWhuMHd6OHRkcytDdUJSOUYyVVlMZ3ZkQ213cmp1ZFRQa3k3NmxKMlhO?=
 =?utf-8?B?T2tiVkxnREFZVE8xcXJKekl4QjNpakVpMkdsMlB5U0JqQUlGQ2Rad2o4Um1s?=
 =?utf-8?B?V1poYWtxNHdGYm90T1ZhYk80SThyYW1FNzlCQlZLeWN2RGdXZUxkYkVxNUJN?=
 =?utf-8?B?MXc0NGxZK05rVG1pbXQxS2MvUERINGs5TS82ZVg1aG1nOTN3TE9Mbzh5d29V?=
 =?utf-8?B?ZGo0MEdzQXNRcFV3cVFONW5vRVk5N2JTaWk3SHcyNTR1cGxPdmw1Sm9qOXQy?=
 =?utf-8?B?UFFqYXdmZ1Z0YUxPM0hzYVAzWkVJNFpYV3FzZi9wYVhhZjJ6VWlwNUtjYXhQ?=
 =?utf-8?B?OFZHM1U3N2o0cWUvaHBwbFJLRU1NNy9WQlkxQ21YSXZhK0F2cHE2bEhWRHdX?=
 =?utf-8?B?TzBOZGNaSi9IVDBYMURVMmpHdTVueURQa0NlUHlneEVKNzlZa3ZWdEdFdHYz?=
 =?utf-8?B?WVRsZFh0SzBqaUJXSkxDRkNZRHc2ZmVoWVdSRnJCN0JDOVFDVmtKZlFUVnM1?=
 =?utf-8?Q?uV2X3Hbp011KBaTzDKRBobC2v?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2bc76c25-4e57-438f-1966-08daab802016
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Oct 2022 12:00:01.0704
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mmmLVQGgFxQ4H8AWJn4zfmUMFcW3apCSTYH3PdnN39jJR/M6o+h6rqKzprLyjVkecS5HBNcAnL7VIncNeHyM/Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8852

On 16.07.2022 16:56, Oleksandr Tyshchenko wrote:
> From: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
> 
> Rework Arm implementation to store grant table frame GFN
> in struct page_info directly instead of keeping it in
> standalone status/shared arrays. This patch is based on
> the assumption that a grant table page is a xenheap page.
> 
> To cover 64-bit/40-bit IPA on Arm64/Arm32 we need the space
> to hold 52-bit/28-bit + extra bit value respectively. In order
> to not grow the size of struct page_info borrow the required
> amount of bits from type_info's count portion which current
> context won't suffer (currently only 1 bit is used on Arm).

I'm afraid this isn't true: There's no requirement for a guest to pass
all different GFNs to VCPUOP_register_vcpu_info, yet map_vcpu_info()
tries to obtain a reference for every vCPU. With my adding of GFN
(really gaddr) based registration of the runstate area (already
looking towards 4.18) the maximum possible count is to further grow.

I guess this went unnoticed because Linux presumably uses different
GFNs for every vCPU, so the issue doesn't surface. But I'm afraid this
is a regression (unless I'm overlooking something, perhaps a
mitigating factor) which wants fixing for 4.17.

Jan

