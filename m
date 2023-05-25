Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D7F8710848
	for <lists+xen-devel@lfdr.de>; Thu, 25 May 2023 11:06:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.539445.840321 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q26v3-00085r-3q; Thu, 25 May 2023 09:06:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 539445.840321; Thu, 25 May 2023 09:06:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q26v3-00083h-12; Thu, 25 May 2023 09:06:01 +0000
Received: by outflank-mailman (input) for mailman id 539445;
 Thu, 25 May 2023 09:06:00 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=xzDE=BO=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1q26v2-00083X-3W
 for xen-devel@lists.xenproject.org; Thu, 25 May 2023 09:06:00 +0000
Received: from EUR02-AM0-obe.outbound.protection.outlook.com
 (mail-am0eur02on20605.outbound.protection.outlook.com
 [2a01:111:f400:fe13::605])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5c96a40d-fadb-11ed-8611-37d641c3527e;
 Thu, 25 May 2023 11:05:58 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by PAXPR04MB8622.eurprd04.prod.outlook.com (2603:10a6:102:219::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6433.15; Thu, 25 May
 2023 09:05:54 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e442:306f:7711:e24c]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e442:306f:7711:e24c%5]) with mapi id 15.20.6433.016; Thu, 25 May 2023
 09:05:54 +0000
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
X-Inumbo-ID: 5c96a40d-fadb-11ed-8611-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IA4CIa+Vc+QrdzQT9pqPdopfTlREjYq5ml8y9KfgJj7fDOUzMHyKPu8jlmNY34JIqQ1qpbV/Uq/SvtgLLnnC32uMOE0eg2bqwtyN/hwCwkQtL5AFEF+qREQbjE4lHi6CdsmgLnYXxX/uW7qkSZUTpxq7P9U5XstXN7MwPn4HGopORLgS4UjZDDorTPsVnqGlDDkXshB3kX6fnJAY/ZcvvWpcKRwiuZl0CoGuc2LJUtHSoQRmFLkhkBd8EgksCrnOnI3iC23JZwIPX5IakLyyJgaXu9ZZJC7cDk3wg1Eij8MZtZrNtqib6FWC7TgT3nBM7vtYmLOToJZKHCfudQqkdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GrUiGt6mj0LVWBMgUBMQiyi6/Kq8PjlXSx1Wp5gIW9M=;
 b=MMWzlJXZou04Uj1e+ijxjSzOYCIhXJZ7L8S+M0YziPn3DP504O2VuMtTvEP6xWRKuRScidnQqEM8Q8YAJ5N9To13y4V3g5QEl+wjQlPqBuijaQ7DlZJrzoZThnV5aUTwIJfOg8gI2zB/FkYEuyAGy1mWPz3OqwSFjJ71BAXEsbGStPXV7Y/YFV1tQemIlsYxUJobH5AL4RjT5tlsngMJ3LFnyXBBQpPakPd/duYvFSSprvysvQqQteWon7/MS10HSAgI+L6Jc3QRv/dWKba3kVbQY+rW+DYAvN9Yqw1gpgVHQVhjf7iKP1p3gQ6pGV6k4Ca8DrVOjBsgUuPAuvgNuQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GrUiGt6mj0LVWBMgUBMQiyi6/Kq8PjlXSx1Wp5gIW9M=;
 b=yNdD8PNyx8Gs/1es6kvLPrkkKV9mkLdJP/ARSl3PyjFFh5Fu9RRHpi1RbJampkGnM37mGnieEmk+hJAZNDfUCWxr3ZMcLEBQD4funwt75k3gtoMJ5DEjJeEWmBCFIU5Y3hOS6uxz1kVbW4pli4EtP/k8/HFd3IVKaLIzIq7yqXa2jrJE5m9ig965vh49mNFyY5E6dTJkrPuW2gq068Gn6nvW3WnT0fa9SbcYDGorN4YIgfxQvj9MPnloyZY12anM0boMKDY2eJ0jqtS4q8by89msUn1ofQVDvTwFAUhDdAk3RVYWEc+4PRHIJ9mp2whDUq49DyNKT2h43HDVExdYGQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <25a73290-7677-e202-5e91-fdf32ad5c01b@suse.com>
Date: Thu, 25 May 2023 11:05:52 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH] vpci/header: cope with devices not having vpci allocated
Content-Language: en-US
To: Roger Pau Monne <roger.pau@citrix.com>
References: <20230525083051.30366-1-roger.pau@citrix.com>
Cc: xen-devel@lists.xenproject.org
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20230525083051.30366-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0130.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:97::17) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|PAXPR04MB8622:EE_
X-MS-Office365-Filtering-Correlation-Id: cd2a1d50-7ec7-4a08-73c5-08db5cff3ea4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	ExXzCXNEmGxUwKnkt9LqHFxC8X9ewGA1V9kUj1roAingHwBRU/KTwgfNT/ZFcEhpSvQ69Ns+QjyOE1u/2n5pT5ObH1Xf3VfM1ZuEogblhIIShzbbwKuU3HCmO5PG19g7GUSChIWunenOQ+xht1FG1w3k6PZeeT51y4Ug/AcgKPDEaPjEiRhwc2qQWhf0exYQ0lMKNhzymp+yhktAYhTvqdXCxSG6+HnNBqj4Ii+UM3VwbrKGSUQ9jKaOBw1BXnDXQEhNepju1jPurGWvSL4tSVrdJoiyLCQxpwPfrVIBEPtq7RcMonuuqKRBzEdRHJF8GS9MbyQTS1lsRHYlFYzcxAg1s3GmnDLRwdcpJAUDskQHzQxUdbNyVKjQhgo/D0lblJgchG2saA9F5tZ33xQTkwsjT8wiwuSYPc2A90j0b+y4AMmNi0VV1cQDW96MquK4ebyCCV5XH2pvBXJBLbDZ0zwLjKhcGZcoO9giwyJK3gFKqMxnWSwTgMpLvZ7vYL2BaGXWPRvECj8Ec9M2fEUQyJxCSll10exVJh2KNLsB4QEUnOenSx2/nxuD+ug5uathbIgcqdfvOJ7D5gnbJZb5ibamgGAmbd3P/YbivwcV+Y/XkN2Axz78iH23YX33Gb3UulXhkMa/RKCIb35Q3wE24A==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(376002)(396003)(346002)(366004)(136003)(39860400002)(451199021)(478600001)(83380400001)(2616005)(31696002)(38100700002)(86362001)(6486002)(26005)(6506007)(6512007)(36756003)(186003)(53546011)(41300700001)(8936002)(316002)(2906002)(8676002)(31686004)(5660300002)(66946007)(66556008)(66476007)(4326008)(6916009)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZzZNY1IvdHJVeFBxaERPaWJXV3FsQjZaQzNsanhNeWQvckVhMjl4czhORUhm?=
 =?utf-8?B?bXdaTGZIZFhPUDhyS2ZOZDQzVERDQlBWK2xZcWdLOVdJMXZqaE9jcm1hU2tr?=
 =?utf-8?B?Q09vU0l0MXdRT3dnODhNV1JoVkV0MXFEQ1NIREFTTWdXbFFBTWUwQXRSRXRo?=
 =?utf-8?B?TTNGalZaUnhzc1FaN29EVDhTSWVad0gyeUlFd0MyamU2RmFUU09XRkluMjZW?=
 =?utf-8?B?SzZLL2lub20rNXZ2b3krdHlpSHNRNFJDV2Nidm1PN3I1eTVzWDZKWWFyMS8w?=
 =?utf-8?B?WGZTa1UveXVhbDZhTGRrc3M3cnJzTG5Bb1BWdFlNSFBHeStEdE5HUWxtOThB?=
 =?utf-8?B?WkJCUFJ2RFNvU0NSc2hsOFNscXkxUzdXZ1V6aHY4SFRsdUM3VzZ4WURrSHJB?=
 =?utf-8?B?ajdnc3p6MFVMUHZqZ1JhU1VUOFJCR2lLRm4yQkxndkJoNXJ6S3UwMnhqY09v?=
 =?utf-8?B?b2tNd01aaGFoTTNXamRaY1BJTE9HUU82cmZrVTNoWXNkL3ZwS3M2d2NYWmgw?=
 =?utf-8?B?emJWMlVOZHlibm5qTGpiNkhCMjMya0tKNkVxMDUvZXVnVzdodDZMZmJad29p?=
 =?utf-8?B?MmdENlRINUVmd0UyZWVENHU3dXVzeWhPMm1NU3FIVDlKUStCN2RQNVBDQW1a?=
 =?utf-8?B?TDQraEhSQ3VjRjg1TEljbXhXSEk3RHZhL3lMcXorWEV1eENNYUJsRFBVaDAz?=
 =?utf-8?B?N2NCRktpTjN5alFhTzZhUlp1QWNSSGJJMklGeTFrM1B1dTNTNFJCTFhBWWls?=
 =?utf-8?B?RCtUR3JjOUFqQXVPZSs4SzZ2RGozRUttam9qNC85N0ZlUGlYNkdtNG5aV2Nt?=
 =?utf-8?B?bitESXdpQ1I0Zm5BYVFQcTZRaUNpRXIzNGd2ZFpjbXRNM2x5ODk5MU1vS1FB?=
 =?utf-8?B?NDlKSms0YmplYjRidzBabGkxT3AvL2srempjWDNKeTJqamUvVW82QmpDUEFV?=
 =?utf-8?B?RU4zR2ZRdU9uVDh2Nloxc05UKzdaOCtWUUI5VWorcWtib1oyamdMd2ZPMFNy?=
 =?utf-8?B?TGRTdVRzNEY4LzJVY0RsbjlmZ2dnUVNiVTgwZktOSXpWYmV5dDJ6bm5kMVF0?=
 =?utf-8?B?QjQyWnZOQTlDak1tSXJiYXpJUHpmMnVmL09FOVZGL1VVSXBKMXo2V2RHL1dK?=
 =?utf-8?B?VCt6ejFVREk1U0dPRmtRbWdOT0EzTmxUNW5iSTdjN3gvdkVkelBndGdDVy9Z?=
 =?utf-8?B?azBmQXd3S21pV3g1Vy9MV29vWVE3SXlNYmZ6ajNjbXphR09mRFNNaFVmQ1k0?=
 =?utf-8?B?V1NibXZVL3plWENSWmxMYmN5bVJtcS9OQUpDMTNIT2o2ME43RzM4c091K3Vk?=
 =?utf-8?B?MGFLc2sxa3pXMzlObFJmTU9oR2x5TGlmamJPWlBwQ2FPTjZ6UjB2ZzNjaVNx?=
 =?utf-8?B?WXJuTjhUNDdjREorVXl5RklXd0t0YUlldUE2UG12YzNLQlVQS2J1NXRWTS9E?=
 =?utf-8?B?UzU0emorRE50NlZTLzF4aElFM0EwUWk3VmJMUkhUaWg5MkF6blliWE5CZFoy?=
 =?utf-8?B?QnROODdHejNSdk54aEpqWk43WEgwNWNQU3FDYkpaUi9xbWVneW9NZ0IvcjRz?=
 =?utf-8?B?TkpETVBhYXlpVE9OUEtrMWU0Tkp0Q0lWd1huYjdZNmEyajZueGdvcmpRZDRi?=
 =?utf-8?B?dDNXOG5PTEVGQjlpRlRuWlg1RUxHODFuTjJjU3ZLU0syUDNCcXlJanZYWkFQ?=
 =?utf-8?B?QXAwa0lJcGJNYkxjNGJvS0I1T2hrZVgwTm95UG9hRS9oV0lzNk9nUVlCdy8x?=
 =?utf-8?B?QmUxUU5yWkd0ZWdLSUVsNWJyM3Z3ajQ3cWdSQW1LSk1JVUJmc2wyclZ0Y0tR?=
 =?utf-8?B?aFdBRmEvVnNKOTJjY0N3YjBpK3hvYzlGYXhZdng2WXNNWGN0emVHNWd2eGxv?=
 =?utf-8?B?eHlBZ0o0ZjFsRWZic0VSN1pqeDRYTStSVnE2WlY3bVdlYWlYWXBNMkF6cUZa?=
 =?utf-8?B?L2x2cStxY3VacDB1cUxJY1dpL1lQWnMzSmhYNE1qQks5cXRxem9DaFJyTWUr?=
 =?utf-8?B?ekpoZzJRUVM5R1g3RnJyTEtVU2I4blVwNGdSSHRDZUJsNFNYc0l3NnlJcDJp?=
 =?utf-8?B?UUQxdzhOeE43Rm1OTkNzZVg3bnh4TWFsVHhJNkIyWGlPOXlrL0J2TlcxQStG?=
 =?utf-8?Q?H6H0bGoMJh+gskOMQNo98vGVR?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cd2a1d50-7ec7-4a08-73c5-08db5cff3ea4
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 May 2023 09:05:54.1766
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ff3yv9ieeLICbhXZE0F4YHL5Wx+8lYBae/j0CjJ9MMNBUyhYOV80jQJeCR9j6EhbgyBNNQYiPwqp/N88q552Vw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8622

On 25.05.2023 10:30, Roger Pau Monne wrote:
> When traversing the list of pci devices assigned to a domain cope with
> some of them not having the vpci struct allocated. It's possible for
> the hardware domain to have read-only devices assigned that are not
> handled by vPCI, or for unprivileged domains to have some devices
> handled by an emulator different than vPCI.
> 
> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> ---
>  xen/drivers/vpci/header.c | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
> 
> diff --git a/xen/drivers/vpci/header.c b/xen/drivers/vpci/header.c
> index ec2e978a4e6b..3c1fcfb208cf 100644
> --- a/xen/drivers/vpci/header.c
> +++ b/xen/drivers/vpci/header.c
> @@ -289,6 +289,20 @@ static int modify_bars(const struct pci_dev *pdev, uint16_t cmd, bool rom_only)
>       */
>      for_each_pdev ( pdev->domain, tmp )
>      {
> +        if ( !tmp->vpci )
> +            /*
> +             * For the hardware domain it's possible to have devices assigned
> +             * to it that are not handled by vPCI, either because those are
> +             * read-only devices, or because vPCI setup has failed.

So this really is a forward looking comment, becoming true only (aiui)
when my patch also makes it in.

> +             * For unprivileged domains we should aim for passthrough devices
> +             * to be capable of being handled by different emulators, and hence
> +             * a domain could have some devices handled by vPCI and others by
> +             * QEMU for example, and the later won't have pdev->vpci
> +             * allocated.

This, otoh, I don't understand: Do we really intend to have pass-through
devices handled by qemu or alike, for PVH? Or are you thinking of hybrid
HVM (some vPCI, some qemu)? Plus, when considering hybrid guests, won't
we need to take into account BARs of externally handled devices as well,
to avoid overlaps?

In any event, until the DomU side picture is more clear, I'd suggest we
avoid making statements pinning down expectations. That said, you're the
maintainer, so if you really want it like this, so be it.

Jan

> +             */
> +            continue;
> +
>          if ( tmp == pdev )
>          {
>              /*


