Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 47F9F59D1EC
	for <lists+xen-devel@lfdr.de>; Tue, 23 Aug 2022 09:22:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.391692.629627 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oQODz-0002Kt-Hx; Tue, 23 Aug 2022 07:21:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 391692.629627; Tue, 23 Aug 2022 07:21:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oQODz-0002HQ-ED; Tue, 23 Aug 2022 07:21:23 +0000
Received: by outflank-mailman (input) for mailman id 391692;
 Tue, 23 Aug 2022 07:21:21 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=TRIX=Y3=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1oQODx-0002HH-Dt
 for xen-devel@lists.xenproject.org; Tue, 23 Aug 2022 07:21:21 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on2042.outbound.protection.outlook.com [40.107.21.42])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2e33658b-22b4-11ed-9250-1f966e50362f;
 Tue, 23 Aug 2022 09:21:18 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DB7PR04MB4907.eurprd04.prod.outlook.com (2603:10a6:10:14::29) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5546.22; Tue, 23 Aug
 2022 07:21:15 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2d5d:bae0:430f:70ad]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2d5d:bae0:430f:70ad%4]) with mapi id 15.20.5546.024; Tue, 23 Aug 2022
 07:21:15 +0000
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
X-Inumbo-ID: 2e33658b-22b4-11ed-9250-1f966e50362f
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YKv3isSmE5hY8/WnCFvWhwtfjQsHMy+PAfBIEPmTzFN6FJ+za42bj96pz2sRHBR0Sx1HoPgMVNd6qcb5sEdWNGAhmvGx/JhrRcnG93oKdIVcjSP08ESgtMtvMdBdi53y8cY/UK4/sYySjZ2MeZwoSsiv8bK7tT7quUfrMrarzCVHxUrkK6ynQyb+QgxmBzpqYU8CZgITi8MnhYwkrcxeM9cBHhudNgZ6OmkB9qO/As6kWrdGN5baSja1NBUGJaRMaFMoeubGaDq4i/kKtdxXbI4OlB41SFSTUtpFF99glJyxhUwcO8V/sVB3peeBobPrefDf1HOCW0JOzvGcqBs/fA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CAPQXkzhIff2CNVVOIYs7M9XH4MSGDROlNiJNRGHEUw=;
 b=DB4pv3xFi1qBpzGAUvc3kPaDQXNx9gfz83WXXw3iWBmhO01rwDirT2OjmXM3C/ESRGXM6nIVDLmojtIHrS8a68QaGe/kEP3VUCvA0EdaEZAOoO5D3ujgiBTEQtHjI3jq7aAwBp4eoSWC6Nip2mfrymM4t2+7hkTdbtSN8Udi9HaisaOwJELSiVnnIG0fyLjmWsPbdnoVZ78Zx5wvaBFfYAm2rkDC0jEyfl5WRSgpx0F4elS0arDhYI3JsWFYQR3gG6vcfg5iogLzpKsdPDASQW60JbvpQeXyHpgJ/zzCV0d3EBD59NtZMOI9dZHEoJNlCIza9BhKiJQvAWSqlxxcRg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CAPQXkzhIff2CNVVOIYs7M9XH4MSGDROlNiJNRGHEUw=;
 b=AobpJrDbhbx9kRqj+vTpIsG+NIDqzV3RLPh3By2xzj4cHWKeZTADDSXJKcxZhAgUJaNwVFgqXmtn8+7hiVmn7Ma8L2EScDDa2+fg12+/3Arl2JR2ppHO6d8fSwg/RzWqaD9TUwjAc12TlGceVSXGIUZIk7NUJhEtwLdupcmWf2d6DBxKx1culG2eRXu3avUVGLBGhLgTIVS95ZcNVt/OVaVA1moW5EN4gpE/EM0EmR35s3+b9kYOZ/OiPfhu4HiTccBYj+wj1TyS+ypZRBtzTVuHNXCEQkEkyLUwcNQmooCjhk22owaZDBcUr6cgXsTkiLiJ9dtUM8jthXD0kOMvNQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <1dcb2390-e15d-815b-d63d-527628bd939a@suse.com>
Date: Tue, 23 Aug 2022 09:21:14 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH] x86/domain: Fix struct domain memory corruption when
 building PV guests
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Jane Malalane <jane.malalane@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20220822213036.21630-1-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20220822213036.21630-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0054.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:48::16) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: aff45ff4-31c0-435f-29dc-08da84d810b8
X-MS-TrafficTypeDiagnostic: DB7PR04MB4907:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	jcWJiKBNej/BgMKlWMYXLkWThSEdJMqbQ7EnA3QVKTXpHfa4otZHYm6e7lYbis/Pyyi/4+AuXoeHhsAHcHzp79m17FGpOTZwqzh57XsgkSoGYLj1NCeFkpXL4FC3Om9rkIYrV0ZPCH4+SBsXejpe/yMJKHVvqfuKyIL9svXqyW6KZRVRUmLul+GDQGjMY8GyKLqxrEv8y3517aFUrodVkMA6eYSqysUFLhGKvdqxxQ5ka95uOgJE2GAbpA97xSXvVVeJ1Hn8PbS0xfxDEvoI3a5t6TUaTW4EBRB1x/va3vnEeREqLOkdDBsZaTf0fa/G6kgOyhz+nXnbl6aCD3NqsPTRyR9QoFsGjVLQuzMUH40Ptih13ii3mqmS8TVR3lZMv4jK1dAwKE4rRTmETnjpsHlTu2pXJBlfn9bFxdnYAWc+s0eT4nKQu2KIHrNIzGbZwrLexhjGpjemysxVa1Hui/I9JABRGbVuHg8gRCxrubl6uQm0pl/mx5nRKbOpAoCCdXCcCUWpDs/EdzlARfpIxIPKc5wMrgMnIODqnSZlJ/ODLmkU2uVm3cIO88awK/uyDl95T/BqolAG4Ovrz5yH9adWFttmdL5IVuyR7Fwr2k1viv3OYiBxraPRWLDcQtos/XlS25hlSxSs0bDcnkcL3vfrbsPgf6uQyMJts16H+gzjmkLrJvNAZ4XndeT63h/ZKFTqNZyi8U5oMJ3IkvuIy+qgRmdEAwlzPTSVvt3k7FKG1HjFCjzr3QY2ODDwCtyrWoHdIrajtt9BE+yjxxTC9eurNJtGLn/lXfpZJc09/I4=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(376002)(346002)(396003)(366004)(136003)(39860400002)(478600001)(31686004)(6486002)(26005)(6512007)(316002)(54906003)(6916009)(36756003)(2616005)(186003)(5660300002)(6506007)(38100700002)(66556008)(66946007)(4326008)(66476007)(8676002)(2906002)(41300700001)(53546011)(31696002)(86362001)(8936002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TTlleDBRaGp6RzJzS2ROZXhSeHBLSU1ERENtREx1MUxCVnl6MGNtS3BwVzVF?=
 =?utf-8?B?M2ZKTUdxbEJ0NlpZNEc3Y2FNVVBxbUl0N0JNMUhyd1NMUzZkcTVtQ0RZeVY5?=
 =?utf-8?B?d1N4MEgyNVlOWmp2MTQ2S1hGSGIwMUZvL0FQWWF4NWsxeEwxT1VwZjh5elp4?=
 =?utf-8?B?bHhORXp5Wkgvc21ZM01IRURuVkFxS2trNkR1MGx3N1VKZ3lNaitubE5aQ1pR?=
 =?utf-8?B?NEpwUDhXY2NIank4OFpxbnFxRWtVS1JBS2UrZEFhVmt4SXM5S2lxZkdpWmRZ?=
 =?utf-8?B?NCtydmtBa3hmL0Y2Ti92MUtja3hldVlBN1BMMlNyMmRLS1dqTjBlMTRXbXZV?=
 =?utf-8?B?MEtDbkdKWm11SE5PNzBOUFNxZnlwM2drK0FqU2MxVnExWnZoeVlmRXBoWEpH?=
 =?utf-8?B?UXdJcWZnWExRbkxYd0d1cVBJMTlMT0VnRk5SSkRnZ1lMcFRhQXAvamZ4RUk0?=
 =?utf-8?B?TEZHOGN4eE5HbmtqTE52Z0htd2tXc1A5cy9CN1lHbGVzWU9pRStpOUwxdXlM?=
 =?utf-8?B?Z1pWM1pqOGJZREF0NWpDbFA2OXlXaGpPNGhzcDIxeDRSMm5laGczVHhaNnhL?=
 =?utf-8?B?RURGaDUrTThXdFJuYi9Ubk5FOEk1S052TnJtQWRQSlRtTGMzRmhPVTZMUXQx?=
 =?utf-8?B?MlRWNTE5amZxZ2lhSVFPZldFbTcxcU5mRmtkaW9VMjlyZU9jaGdjMkg0U3BD?=
 =?utf-8?B?bUU3d1cxS0xxODhraUhIQ29rWWRxd3M5RkQrTjdnYTBsVndmK3Y2OEpHTUR4?=
 =?utf-8?B?RDluQkduZkt1TCtQb1p6ZzJzZ0Qza0gwTVBkUzhIQVl0QkVoNWRUSFpMME0y?=
 =?utf-8?B?eDErb052ZWlDVDJDeHVLU1RsUGxnM1VxRzV3WDB0UTJiZnU2MFdGRExYMWVK?=
 =?utf-8?B?d01LY1dnVTBiUEdIeVIxUjFrc1p0NHk2L1VPSFlJelFSYi9td0h2R1VlZS9L?=
 =?utf-8?B?clVucXpBWGFIWk1JS1RqODNSNWlQektQT1V6ek8xUisxYzB5VHR5Rmp4djRp?=
 =?utf-8?B?ekV1V3M2ekppeFhnd1V1ajc3bHgzcmZPUE5qaE5XVnM2UUhjeUhrSi9LU014?=
 =?utf-8?B?NWJTWlljcFlCUW85K08ybk9pOG82cUN5OWtoeSttWitZeFh6MFl4Ti83SE5z?=
 =?utf-8?B?MlArV1VUZ3Nvc2p3ZjE2bGhkaEx2ajk4TmpWWVB1dlFIbndST3dsTW5YUGV4?=
 =?utf-8?B?cGhjVlAxN29FV2h1ejFaN2dnUEFmb29KMXc1VlVkb09TYXRSVjRZTFlsS3dw?=
 =?utf-8?B?UkY4Zmp1eEJvNnpvTDNwditKKys1b3hYSEhuQkZxREJKaDlxVTU3VjB4Rlow?=
 =?utf-8?B?NFBCUEtZamhxNzJ6TlJxWDRmc1F3WEVIakxFZzc4WjZ6VkhObFNxSHZJeUhH?=
 =?utf-8?B?K3FuM0dkMnNBZmc0bUVpUVJUSE5DMDA3TUkxS3BCQkZ4Q3FGRENFanFFTTlR?=
 =?utf-8?B?eldKTFVJRHBuTzRQWkxUTytnU2FnZHhuSDlxSzdza3cvakgrckUvTjRYa1NG?=
 =?utf-8?B?WW93V3k5NG9jUWQ2TFZwNHpFdUpJdWpyN3ZrQVV1VWNhVzhvYUhJRHY0NTg5?=
 =?utf-8?B?R09lSEwvMHZueUxvUnF4cExLVGU4L091cmNsTXJSZHZCTkFFbkdxOUo2VmZC?=
 =?utf-8?B?N01zMnhoNjdYUXhGT3hEeWN6UjRKczN2MXp1SDdSUFp4amFhR1M2Uysrck9L?=
 =?utf-8?B?Zzl2a0JvZm1wZzFsell3NUlLWGErWXg4NGFrL0tpR0VGcVB6TnZ4OTZ3OC9j?=
 =?utf-8?B?RmpTK1M4cGNrU2gxSHgrVFhIRlBpVGJDZ0Z3NXJUYmo1WlNVMlhDektBNXYx?=
 =?utf-8?B?S3YvY1EyU25lUU92QlZxdmNxOXpBTW5pTXQyZXFiejF4cEdLL2VOYzU3MGRt?=
 =?utf-8?B?VExSa0lHVWNwb2RVS21nMmJRcThQaFZmd0RuVG1hWVZyelg4VHVidDNUcnVt?=
 =?utf-8?B?YWhXK3FlT2tkOE5zRTNqYUNQUW1kWTV6RVZsdkNoendiQ1V6bVFrdEY3SnU3?=
 =?utf-8?B?cERKVHI3RkpTZjFvS1pzSnJtRnpmeE5WT0djek4wOVZ2VnFUWmpwd3lEV0pa?=
 =?utf-8?B?bVBiLzlsTVhsRUNCYkpVVU51UnF0ZDZ4bXZ6WGVXd1dYRy94a1dxVmY5MzM0?=
 =?utf-8?Q?RKjRqodVyfE5xKFIFV14RjmAX?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: aff45ff4-31c0-435f-29dc-08da84d810b8
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Aug 2022 07:21:15.5903
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6gRHTSreYyukJMMSzWAzy9cFZvTSMKqr57d2qteEo/3AccKWk6Yc1+voZRsZp13Gpi01GMZVcJwSNWAgUXjOfQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR04MB4907

On 22.08.2022 23:30, Andrew Cooper wrote:
> arch_domain_create() can't blindly write into d->arch.hvm union.  Move the
> logic into hvm_domain_initialise(), which involves passing config down.
> 
> Fixes: 2ce11ce249a3 ("x86/HVM: allow per-domain usage of hardware virtualized APIC")
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>
preferably with a small adjustment (see below).


> This does not fix XenServer's wall of red from testing, but I have at least
> figured out what's going on.  There's a piece of plain RAM in place of a
> working LAPIC MMIO mapping (accelerated or otherwise), which causes HVMLoader
> to spin in a tight loop waiting for CPU 1 to come up after failing to send an
> INIT-SIPI-SIPI.

Where's that page of plain RAM coming from? And do you meanwhile
understand why XenServer testing is exposing the issue while osstest
isn't?

> --- a/xen/arch/x86/hvm/hvm.c
> +++ b/xen/arch/x86/hvm/hvm.c
> @@ -576,7 +576,8 @@ static int cf_check hvm_print_line(
>      return X86EMUL_OKAY;
>  }
>  
> -int hvm_domain_initialise(struct domain *d)
> +int hvm_domain_initialise(struct domain *d,
> +                          struct xen_domctl_createdomain *config)

May I ask for const to be added here? Unless you anticipate the
function might legitimately modify the config data?

Jan

