Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AE840592E8B
	for <lists+xen-devel@lfdr.de>; Mon, 15 Aug 2022 13:56:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.387345.623549 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oNYhJ-0004SD-Qj; Mon, 15 Aug 2022 11:55:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 387345.623549; Mon, 15 Aug 2022 11:55:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oNYhJ-0004Pf-NU; Mon, 15 Aug 2022 11:55:57 +0000
Received: by outflank-mailman (input) for mailman id 387345;
 Mon, 15 Aug 2022 11:55:56 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=iVAg=YT=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1oNYhI-00046d-86
 for xen-devel@lists.xenproject.org; Mon, 15 Aug 2022 11:55:56 +0000
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 (mail-eopbgr150044.outbound.protection.outlook.com [40.107.15.44])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 37e74590-1c91-11ed-924f-1f966e50362f;
 Mon, 15 Aug 2022 13:55:55 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM6PR04MB6103.eurprd04.prod.outlook.com (2603:10a6:20b:72::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5504.28; Mon, 15 Aug
 2022 11:55:54 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2d5d:bae0:430f:70ad]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2d5d:bae0:430f:70ad%4]) with mapi id 15.20.5525.010; Mon, 15 Aug 2022
 11:55:54 +0000
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
X-Inumbo-ID: 37e74590-1c91-11ed-924f-1f966e50362f
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iAQozg8OHzRZGd01kDc9268b9qyPBB8nmYUfAAs5h2wo2t7RSDsKKoMhqTKoiX163qrSydA5CRLdFmCbLuLWIboW6+SRlim4sBcE1v7d1ZagepQajbuSZz4cFdB3lUhZRkvY9eSUY6q6AtKOZTNhVyeV1iUTqnup74Z/x3Hu7AnTECRXo9sX9ECxRi2yEzAy2kpasW+DQ5rVXEzY1I/MmhM76puVXh4pKpS/fvre5NVEPO86iFPAusiMojSd3AMrzO6MXh9x7v6+5QZga/hj4CV3UzdwTKVKLcVEGOgMDzLAXIzLxaJcBoh8D8PDkO0MLeGvJ0VNHoShweoouEdpUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=p5O4UlV95jZ9ZctpZWdByMELpMoc/tlH45jPm3TqM8s=;
 b=AtDhsQdfF75u9R+L7oQ1gh2qIH5jRXwA69IRdVjrkjWOeIh53kOK1dlhBMSBwcD50fylBd84deTRjyH1tFq9lb06/Sbo1reCkc9pmPh3M3DkFASwTP9UZpJwUgUZOg+Uq05XcrJUpHmoHI6AN8ROyUH9EVwBgVX7DzKOrt9luBFxEmFa171VWZV51p3wpxMVZ8XQHCCBpjfP6pOXOevPZ4X73T8agRDDbZ9c43b5toKaRqZ2ZqfR+nlOEf0Jm+H5vJuhr224wJTqtoomr60/fEVt06p3EAlOPc9SfEMbUwhM4Ir0/9+0Kn7BBZaLWXNqQHRw49e/QE/ok2Jsau3Ftw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=p5O4UlV95jZ9ZctpZWdByMELpMoc/tlH45jPm3TqM8s=;
 b=Qa2a3Oy7IM9akFp3KVX29v/hy7+48vBKmG+0bMzJ3h1Y0/JOPinN1odUtXRAQTzf5GNkExXzUMMhJy/Ce9s7XkEhnlwe1R8BmHLCcc92lK6Qnj4QLnoCCwcvxSQqpzR99LVOEtcdimQVQHG41u90wAnro398Qyqgxm8BVr3MgmmQUsHwrU9KWxkL1CjBnHpCPxNV3Q+1SIWFfVqTapUKW+ykYAF5PiqOuJVuRmBO85Gunnah39Jv7+BJ8GDgny7n/REq7b186EYR0nArbjB2FnviZMR+3SJhBRV4NRZLjKl+70xqBKRUbeZqOpxW2cGsN/us71msYQd1l/1u1J/rRg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <c70041ca-1e0f-f267-af2a-daca35e7a1dc@suse.com>
Date: Mon, 15 Aug 2022 13:55:52 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: Ryzen 6000 (Mobile)
Content-Language: en-US
To: Dylanger Daly <dylangerdaly@protonmail.com>
Cc: xen-devel@lists.xenproject.org, Andrew.Cooper3@citrix.com
References: <wMV4okoInWxTqAaH6sxUug6my9BOlkurOWuCUILGFxoYe96U_-Z-KPjDdacRmuIksOMX-chaAN0lnGj5XevfNJKw6fIVhsSIqBCxGHweK-Q=@protonmail.com>
 <4c3976aa-dad4-2707-2852-9b26593692d0@citrix.com>
 <pDQL7BhwlO49buWymLE-VFEZJim7qNeMmAeThZgHF9qzcbNbQ6ZoSXktgD14I_HYpsdxqfCugrNoJ227u5DLCWEEXk_h9c7bf4iKdgoQbQ8=@protonmail.com>
 <b3e00f33-527e-e29c-87fb-0773344aa1f6@suse.com>
 <a485f128-6caf-4f4a-3d61-423e2ee67121@suse.com>
 <uGB9M0prJ1uFQ4e4SWvoe_jFXgjpBlNr1C8q90DWeR6CtiSzXBUQ1nGLD6tl1dTeYvqP6347vsu-MVKu7P17KH4QU8GFSkeuOCcQCyslSMY=@protonmail.com>
 <2155eb83-e421-1f55-75ca-d9e828b609de@suse.com>
 <hmW-sWMVRYCoU-mAfrk4S7t4r2n26KUbGH8niCwfyCgij4Xj8cur2HVqAbrwbf-slNF8JQlARIWuMpAUhNTUf4peJCMMKUO4lhl-WvC2F2g=@protonmail.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <hmW-sWMVRYCoU-mAfrk4S7t4r2n26KUbGH8niCwfyCgij4Xj8cur2HVqAbrwbf-slNF8JQlARIWuMpAUhNTUf4peJCMMKUO4lhl-WvC2F2g=@protonmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0111.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a8::12) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 452c5438-95f1-41be-02a7-08da7eb51b71
X-MS-TrafficTypeDiagnostic: AM6PR04MB6103:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	4AqzuYEwgKXxP9Pw44czybg2exh0npHSy5PgzD1FC4szeXMtK18Jp+F/hyBRrWo01cUAbROELVDC83mUzMhZ+3iA6bgQoIXyhraAnYH47Hzh6pIbQu3N02T028tDOX54zJwcavuG1E1wUaxrbDQlU+DKJHOXsiFnweBxFM58lCizTNkp2PNSo2/oRg1LvpQLJx34yQtz/oYRpoXh86jMCUx3xfmVGjCI+ZwbtFXhnh8qbLdjkAAadILYvFiHSyH2pWFetYpqGjDlBY//xqvnWrQbW/nHmHXURRMij+PO3/mXP91uuMPG5kA06KYRyp1ruHmvnzo1W/LJvgQC6fB0hFmGVDc+CTfkTbEn9UPfyLwEH7QHy9k4qtCQxZqUTobcGEud7/z6wyP37WfR+nljEnuiKTZyMw4VD3Klz8widWcnjq+NKfgPDrPp9YvF0ZJBo5vcz5DxibhlQWEKTc1/7XiEvQGJncQOxMr+aaVvmZ7xgGc0GAWIehSFEFJe/HyQ0Hx2vsnIel1iHiNHJYtlbyEj+k5lITHreKylzNLJLhxp7IxgnU88ztZ88MVB+30YOzucyK3E56bT1GvYPsMTNIY5+r5VzOgjjNoZMLiFHdqooE62GF1d76D1f7fzeRqJCAyZcSyhOqF2+H9xK2QIyDzGaKAPWu56c2afFpmfSSb/0I73ghyuOm5F64nXeQWeVT8j5HDy/AApJ/l+xrP2b9jdUGZ9t1vMOuHzCP3yezNTQMdIFYIZo2bWDuvPSKLQXB4i3Z+P3ar9kZ2KycsjlpnAf3ailNtZHnURVPOTajlBjb3hZI1XhjOaiDxIgq1vABkvP6i5IubreTJLsPaYZg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(346002)(396003)(136003)(366004)(39860400002)(376002)(8936002)(41300700001)(5660300002)(316002)(6916009)(66476007)(31696002)(86362001)(478600001)(66556008)(66946007)(8676002)(4326008)(6486002)(2906002)(53546011)(6512007)(26005)(83380400001)(2616005)(38100700002)(186003)(4744005)(6506007)(36756003)(31686004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MERaTC9WTzZ6RmFCRzZ3UStLazdXdTdrOGxVMXFXNlY5MCtqTnNaRVh1Q2tn?=
 =?utf-8?B?QkpKbkVUMWF0OTYwbUE1UklLdkxhektnY2ZCblplQTlqa3lObENpRVdibzRh?=
 =?utf-8?B?MlV4RWZlQ0xnSUJxWlhqVjV6S2F0dldMWmJOOXNoWXVIZnpXSWZuaWwwWTNw?=
 =?utf-8?B?MlpqRi9YUGVja0pKSytMb0cxTDdnRnFTZGx4dnNOVEQ3YUZEU3pRbUl2SVJE?=
 =?utf-8?B?SmlCZHVJV3Jvc0pMSXMwZHlqZlUydmNpYjh1dHhGSm9WZzRKb05YbitVUXA0?=
 =?utf-8?B?MURubnRHNTdpT3h1a2d5cXhtQndrZElITFFkRVNpT1lSQ1ZwMUhSanpIbXNI?=
 =?utf-8?B?Z1FsdDBaT2RHN2JQTytPN3YzMUhqZ2FjOG85VUZnbXNyYzBPdFpOemo1VXFZ?=
 =?utf-8?B?ZGQwV0tSWExFQm5NLzB2QVIxOFFqM2VORWJHcmZyRkpIclgwMEcybUx3TmFq?=
 =?utf-8?B?UzY1a3I1UnNyZ1o1WitqeUNZNGtZYmo1NVZvd1dyZjFBSkJaYVcwKzUweDRr?=
 =?utf-8?B?Z0tjVXhpV2dtYm80S000dGdQVnl5Q1lKQlhmQXc1U3ZQd3VwWTF5QU9mUzdF?=
 =?utf-8?B?UWlqSXhyaGRlaFlaMU5yM2twWklzdUpMalgrZnRQZVZOeGUzckFUTndiNWRX?=
 =?utf-8?B?SUlpYVVCVzlZQWJVWlZwbGdITDh5NXRMMkQ0U0pJaG56QW44eEUxUG1obWdP?=
 =?utf-8?B?NzluWWlmaUtjc2hKL3d2eGdKS3plSFIwYlNqQ3R4K0RCS3dKQjZ2OFlQY2tZ?=
 =?utf-8?B?RU1odjM3eDh4OFp3ZnNXNFI4MW1RKytzY1Y0OHZtc2pibmhOLzdqWHc0S24r?=
 =?utf-8?B?VlcyYytNYkdrejRoeDBjd1lSeWp2b2owSmZoVktVNXVBT1V6RndacTNOb0NL?=
 =?utf-8?B?MnhDZ1NRMzkzeEN2T3ozYWJyWTg1dk1SR1lBUUQvcE1NSzdGQVpHNFJWZjBO?=
 =?utf-8?B?Q2paaUloam5YK3o4N0xJWkpJWWZQcFM2cHJpYmdyRnBvNWdlc0JEai9VMzZn?=
 =?utf-8?B?RUVnd2pPNm81YTBTMXNUR2NnRDhsWXVQdHN6eFRkK0wzZjZWendUUlVQRnJ4?=
 =?utf-8?B?NXBNTU56YmRoU0FJUnA2dWtoMC90TG9Vd0oxWXdhQng2WTYrbjI1SGhvSVNY?=
 =?utf-8?B?OWdEUVRYakpNa29oTWtyTDA2c1ROYVkxUXYzZ2VmYjF4eFRMRjZSeTYvZnRV?=
 =?utf-8?B?TFVNbGl3YjZNR1A5Lzk0SlpkcXpiNVMwT3I5OEo5TmNoSmF2a3I4L0pwZzAy?=
 =?utf-8?B?ckVkaDYvRTdSNHZsNkxmVGVZTlJnamJjdUNOOWJiSWRFMThrQjJnQThlWVQ1?=
 =?utf-8?B?ZDAvOU5CWFljOE9vRTQwWTdrd1M1K0VZWVZzcHNsLzJtV2QwY3huS0NYbHha?=
 =?utf-8?B?b0lFbnhDMlF1TUtiRnJzQlA1c3dlYWNtMWVrTmpEMXFPZHZBazM1WW5DWHZP?=
 =?utf-8?B?Y1pWN2R5NU1FVFg4eGtMM1BNUzk2cklqZWZ6ZGI1akdrVFZZME1qcXVqYzBK?=
 =?utf-8?B?bHUzY0NrZFUrb1hNa0VZMjVicFRZMlMrcWFYSkRjTkJVQmo0OHdpVTJ5MUJi?=
 =?utf-8?B?REJUNTFlV3k3M1gyenFUaUFJalMwMk5ramtzSUlqcUhVVVFIclp6TXBjUWtv?=
 =?utf-8?B?VEkyRzR4akVNbFVpWXlMS1UwbnJGcmFFcHFOeVhsWTh2SzR5NG1MU3drK0dM?=
 =?utf-8?B?d3JCUk9qbHVqaHMyL3NlNmlsZjZ4S2FKMzdnOUZQNHZkY1J5ZWlJdE9ReStY?=
 =?utf-8?B?Yzh5TnFxQk5jd0Njc25UMHRnQ2dTdUtydHhMT3paa0N0cWczRDY2cFdOTVp0?=
 =?utf-8?B?UThncHFGWHo5aEdBVktMcURHOFFJakk2d3B0ajBsa2RBM0E3Q2IyWkpYVDds?=
 =?utf-8?B?d2tJN2RrMERNYkduYWVXdnYzM3dhVGsyR3ZQMk5WRC9pdldZRXlOUHNoVnhy?=
 =?utf-8?B?KzZYaDhhWkVHVUVWZkJGMkx1djFhOW91d3NIZ3ExU0YrY2kyRUp1bk55aE9L?=
 =?utf-8?B?VVhvVkhMVTMrNEhhUmpzb1BVK1Y5MmltTHhwOTRsZHhBeDQrd2d6MERNdXZx?=
 =?utf-8?B?dWdDcTI1eFBRNmZ0UE5yWjVQbWs5R2RWNE9QNHRLUE9JbTdsN1UweU5lMSts?=
 =?utf-8?Q?yJ4Eru4ckKkmAU70VS4/sXnX7?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 452c5438-95f1-41be-02a7-08da7eb51b71
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Aug 2022 11:55:54.2167
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: p3F3FAJ5Io0fR66Zk0dawMaLOleThXAqpp1yAYfX6OqXgmLXPQ+LYF3536hhr/8SU88RROrPZoQJn/9Wi/L9ag==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR04MB6103

On 15.08.2022 13:50, Dylanger Daly wrote:
> Indeed adding noreboot does result in the device just hanging there after starting a VM.
> 
> I wonder if it's possible to have Xen write out it's log to some memory address, hoping it's doing a warm reset the log messages should still be present.

Well, it's certainly possible, but would require code to be written and an
un-clobbered address range to be determined. (In earlier projects I found
it easiest to store data towards the end of the video card's memory, as on
most systems only the part actually used for displaying purposes would be
overwritten.)

Jan

