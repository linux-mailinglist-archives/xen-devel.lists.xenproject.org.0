Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A94063243BF
	for <lists+xen-devel@lfdr.de>; Wed, 24 Feb 2021 19:29:54 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.89476.168566 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lEyuv-00009B-5o; Wed, 24 Feb 2021 18:29:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 89476.168566; Wed, 24 Feb 2021 18:29:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lEyuv-00008m-1r; Wed, 24 Feb 2021 18:29:45 +0000
Received: by outflank-mailman (input) for mailman id 89476;
 Wed, 24 Feb 2021 18:29:43 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=mT50=H2=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1lEyut-00008c-6P
 for xen-devel@lists.xenproject.org; Wed, 24 Feb 2021 18:29:43 +0000
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 17d4a9c2-1ed5-4aab-b2bf-3f7249d12b4e;
 Wed, 24 Feb 2021 18:29:42 +0000 (UTC)
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
X-Inumbo-ID: 17d4a9c2-1ed5-4aab-b2bf-3f7249d12b4e
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1614191382;
  h=subject:to:cc:references:from:message-id:date:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=4D45fhMbVNY7HwSrUfby8l6DNxZ+oy/vDwl1OVkHISI=;
  b=IVeIVzj2yEOVyovTzJN7jHHX2FyRYIikrcFbMKKXfuI4un8dG47ckRrN
   XQRuqYTPt3r64BBTorww6MM19Av7sTsEbKEHxIa2qsGdS+Iy9xFQacrlk
   3tCRB40Akh1IyZgYsMmCrlnGaw83DAYNxTgIMZxVqijcFw9f0nzRxnKz5
   8=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: U5ruABiQsx1p2QeAfF9JDHhx+JzXj1pXIKcgQuAaIGXEx/1AxJ0SI+/2ZPFG33KCAHgk1XimIT
 Vj+P4Qe/RKZU+bs7JOKJHtL3hpVVX6YrCdndjn7PVrNV9+BpDJNWunBmez7vfLwQbGsmiAPxeZ
 N8BD5AN7QZeIREhvVtkqacGoPG1wdV8ER2YdI+rCVHwKmyLwLXYZKpmsHHVfWsAQSxuXre9kI6
 SobAxsc5b4PpsBUOA9nLf+xxSjPu4x3Z5echvvFGJsP/5sATWy8juqnd5FKbx4R6ckqaXwLMo0
 Vr0=
X-SBRS: 5.2
X-MesageID: 37948377
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.81,203,1610427600"; 
   d="scan'208";a="37948377"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=h2ZqP/kOYZoZ2W92GiDICCHF+A/EtXaV338lIUgAGkRn+meC4u7zbVRh7XNgd9cK0zPHmtLgntPV8m8Z6/l1dSFgxGf6dHowfHwGLNrzDquSaBbEy9xQHAvwaBmFwF/BnE0XB5Ia0t2fJJ32CKKNIMpXa69CGNwWhKM2vwDGVI09ATgWC75Nj8KKGdF6ogaIy5L3wxADuZbrQ9MLHhT5q0jB9wuOrZTBE4ptFMSzHiev3zKDVzA+C9r0VHCcVncJBgvsREokhgVClKqDWEd9IVFk3Ax/Pyif2SPTBVSp/zC78Qa5mAOfs6FSCcys14bf/OWCrfDEx1zR9th02xSmYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4D45fhMbVNY7HwSrUfby8l6DNxZ+oy/vDwl1OVkHISI=;
 b=btNKMKJrY+ReLjsT7jakWGpuroeL/gYyM4wtk7oliqX1ciXho/fhPvRbYq/pC8kwGgMzGNn79MSBC0f2R8Ynl4E4zaeherrOe9mpItk8c4nBJapzbiv3HL0LeBUqB+hd+oSmMpNpuCpPFSlXC7t2ljWDJVl35NptYW52X5KNmEaZVZfSx9rsSe+40gTYPLRBAwW9yGOTJRREwf+aUgkktzvN7PEjWmX81xlDSQ6CLJ19naXTBQLipMGAyI8Sabb7cabzzpigzjr8+U+hayKfpv5tX95u8OEyi+7fgWBpq1AQbJXrPKeAr8UPxcL8o2wgJCKgVpsCcbgBYDhTMvcLvg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4D45fhMbVNY7HwSrUfby8l6DNxZ+oy/vDwl1OVkHISI=;
 b=uRhNX0zjoiLE/7Qf6fP5rn66tSdPxFcpyEIRzzeq9jpz0M1FUXfW/M6NSNlYcdarJ0stfvpb46j442qUn0lWsmVTv/X9FbQu3uqerPXjVFmd1LQQwedYHvSc3VUKQnRkpXDtnOgzMTclXVzZIhSEW+ZhgZg20h7ja8gvpUA7Xsc=
Subject: Re: [RFC PATCH 01/10] sched: core: save IRQ state during locking
To: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: George Dunlap <george.dunlap@citrix.com>, Dario Faggioli
	<dfaggioli@suse.com>
References: <20210223023428.757694-1-volodymyr_babchuk@epam.com>
 <20210223023428.757694-2-volodymyr_babchuk@epam.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <c8475a6a-5a33-cc42-a909-b6d8dce61fab@citrix.com>
Date: Wed, 24 Feb 2021 18:29:30 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
In-Reply-To: <20210223023428.757694-2-volodymyr_babchuk@epam.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
X-ClientProxiedBy: LO2P265CA0172.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:a::16) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 65d989ed-5b4c-4a91-97b4-08d8d8f22491
X-MS-TrafficTypeDiagnostic: BYAPR03MB4120:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BYAPR03MB41208BC4117D38F81F32FB3FBA9F9@BYAPR03MB4120.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: QUpqg5SCZPBi27d4LxzXlMXDK/qJTpfj9fKfYVDBJLk9iHwxH9SRBCGnvHd0qK6aLYgc/yw9lEtjBPoA4+v1hnk7saPZ36ouMIVwhBlRdsgpoO/ld7C4rO+Xx8WASMMIp7rtYrxvGeMCeeRuUB23J8+th2HJ59hvx/KONPmnS14v6kgBAD9q03qKzULYXgLop1+QDsLx8F/Pyf33pYQGeJJXEQchbT0TBpnwVtAYA8REY/UxrsG2DbqztP0Uu1WosL/Tgm2hRR3nBlFX11UkSs5QNFMWprHATeGtow5M9x+vfnlAbBuw1ERt17IAd4v1qFpK0jhxCgqkyWAryhSN1CWepP24heApw9nNedJcIuTpDgqKznCUOWS6xQPrxFnJXokebc2U8EHb+GhZHSiUN6eLG+I+5W1ZSfBZakA7gbEPZ4q9DG2TJ337VnzNNyLWC0DDc/E90ucAbjR7aOC1h1A5YInioQEuTtnWNrahCqOYjnxVoo1p0G6QC/A0K/6XuZeYv7SDwK6xg/QItaZFIOCitdDTWb1CTqyC5HR9K8K9srSOW1OXWCFHgHil7Vfsa0cSF7VJ9TcvyTVxMNTFZj95+/9mvWa6AMcJumMdcJU=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(366004)(346002)(136003)(396003)(39860400002)(66556008)(26005)(53546011)(478600001)(8936002)(66476007)(86362001)(186003)(5660300002)(6486002)(31696002)(36756003)(4326008)(16576012)(31686004)(316002)(6666004)(54906003)(956004)(4744005)(8676002)(16526019)(110136005)(2616005)(2906002)(66946007)(83380400001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?QWVCdmsvQXdZUU4zYnlmTERYWEt5Zy9ZYThqYnZSaGlKaHpwQ3c5bml4YzV3?=
 =?utf-8?B?bGtPS0pBY1NRWWRvWGZESG5Xb2JZblhNNGpqUHVzdkJuQzdkenN4LzJKVXhX?=
 =?utf-8?B?OUJVamMxbC9qaFlSbVluengzbkxmTGxvYllDMTk3VkJQUVkxbjdObld6SGNC?=
 =?utf-8?B?VDNhUE9DNUJ6Vk1kbGxEYk5Ic1lvc1JyWDRCd2huWE5yeVhJMFdYN3ZCdUcx?=
 =?utf-8?B?bk5aMHhJMzlHNDBuVFllWTQ0RDlXaUtBbldqdmdJQlE0MkpGaWZHcy81MW8z?=
 =?utf-8?B?VlluR2k0TTdERTl1WkppT2xGQXl1WVBYczdRRGE1MUhxSmtVMFN4MjY0Qnlt?=
 =?utf-8?B?bDA4Y2JGamZ5Z3BDSStkK2F1ekQvczdTYllQTVF2U1Q5d3VRdlNrczljMHdP?=
 =?utf-8?B?dVBNNVBETEs5ZE52QjdPdVJWeXdnNEtuRC9ybm1NdEhCc2hVcWU0aW9mN0ZX?=
 =?utf-8?B?N3djZUFCZFlVQ2tUUW1DYmdFUHBZTTNibVd4bzRUaEpSOVdsK2t1bE1rVkxi?=
 =?utf-8?B?b3pWOVlCQjJsbGRoRGtVMkx0YmhTODA4UTRJMEM0QTF0WnpFLzJBa1k1TDVF?=
 =?utf-8?B?bnI1QkF3MEJXeWhuc0cvSmVPWDl0THR2dEFhNHJMVm53b2dkbmpSK09zVVl0?=
 =?utf-8?B?WkZlajdPWjZvTEQ5Q1hWeGk5bWZaeGRTNytYR0FlSXNIZDkrSFo2NGFQNktv?=
 =?utf-8?B?UWhUN2VidDd2WFQ2Y2dlc2JnTkoxRVhsSVd0Wm9XZFZkY3pqTlNKdkNUcFBI?=
 =?utf-8?B?VlBiTEJNRDFGbUwrKzVYV0svTGJUamZDWncyQ0JFOU1xUUFRN2gzWm92dGsy?=
 =?utf-8?B?akl5MEVPNWVtaHlWZ04xVHdwL2JVQWJKSVBLQWxkRm1heGNUN3Jib1c3Sk9G?=
 =?utf-8?B?aDJjNE5jVGJ6M0hyTGVOUlNQNUNVTkpBV2lZSHdWTFNBWGhoK3NldmFXTHl1?=
 =?utf-8?B?QWVtRG42aCtVN1o2ZDRmeDFscGRtSDAzVHJTclBtYkhRdm96Y2VhRkFEL3BP?=
 =?utf-8?B?eXo3T0N4TlZJdFJxc1F0NlBLRjZLZEJCRkdacExZbkZ2SmxrejEreThUK0FV?=
 =?utf-8?B?OExVQXVsZTM3VlJhY3FLSkFKVkNSSmFiMjNHWjB2RzA1WitpcnI1VDJ0ekxy?=
 =?utf-8?B?anJLM2prUEVhUHVaUEhqQkNJeitzRDQxTG5IZjA1QXZrSU91WjltQ05OblVP?=
 =?utf-8?B?dkxoSW5UOWwrcDU5MzZnZE1VcTFOZHZQdGJqL3hoZ0krTTZpOWU2d0xidWx5?=
 =?utf-8?B?SEVwVU9uZTYwRW1aTmM2M0NDdkprMm5WVC9rQjFCdVo3QXBxUFREM1diS2Ev?=
 =?utf-8?B?WDVKSFJRYWQyZlFqdnZCbzhrQktJZjM5ZFVvdi9PWWtPNGtBVHUrejZmUWtt?=
 =?utf-8?B?Vlhzc1hSL280ajRUc0kybTFLMnVIM1liTGttZERUN2QyNS8zZnpDN1VPRFlT?=
 =?utf-8?B?Mi9mSG41V3hrc2hRMVVuMzhzL3dBMEFsM2RLUTdMamY2ZFd1MHZacWplNjE5?=
 =?utf-8?B?a2IrWFhkbzU2WktoUlg5cmZkcEpEVUVYTVB0MkdVV1Ara3NEOVFKaVJUM29n?=
 =?utf-8?B?VVd4L2tiNmNjTk1vVytVNnhqRkZ2czllamhYajhuSGIwS3YxUjZwZWdkNVZJ?=
 =?utf-8?B?Q0dEczRyKytUQzYxVzZLL2pWNUJNVFR1Z3RaNkpMUUtlNTROQXhMZlhlMVRN?=
 =?utf-8?B?QU1xeTRBbDJxV2xySVJxMWR4dTNkWWQzd1AzYStHb3BMSUNoN0oyK0Z0c3Y4?=
 =?utf-8?Q?kZKbVhzVDEsfDn1vCF1KduS4KSZJ4oGiApc+jAS?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 65d989ed-5b4c-4a91-97b4-08d8d8f22491
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Feb 2021 18:29:38.3359
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yJ9ygkdnrznorPY7ucnAXRgx0nonu6Ez0v2QxKkJk/IDHWMazal1xcRuM4GzUmSXiwS7SZ/RXXTc2F26uyXS2fo7QdPH4ewXAk0ffsvTtYo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR03MB4120
X-OriginatorOrg: citrix.com

On 23/02/2021 02:34, Volodymyr Babchuk wrote:
> With XEN preemption enabled, scheduler functions can be called with
> IRQs disabled (for example, at end of IRQ handler), so we should
> save and restore IRQ state in schedulers code.
>
> Signed-off-by: Volodymyr Babchuk <volodymyr_babchuk@epam.com>

These functions need to fixed not to be _irq() variants in the first place.

The only reason they're like that is so the schedule softirq/irq can
edit the runqueues.  I seem to recall Dario having a plan to switch the
runqueues to using a lockless update mechanism, which IIRC removes any
need for any of the scheduler locks to be irqs-off.

~Andrew

