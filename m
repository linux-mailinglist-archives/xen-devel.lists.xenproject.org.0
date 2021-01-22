Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4649D3008B3
	for <lists+xen-devel@lfdr.de>; Fri, 22 Jan 2021 17:30:10 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.72963.131541 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l2zJx-0001JY-DM; Fri, 22 Jan 2021 16:30:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 72963.131541; Fri, 22 Jan 2021 16:30:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l2zJx-0001IL-85; Fri, 22 Jan 2021 16:30:01 +0000
Received: by outflank-mailman (input) for mailman id 72963;
 Fri, 22 Jan 2021 16:30:00 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=wVda=GZ=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1l2zJv-0001IF-UP
 for xen-devel@lists.xenproject.org; Fri, 22 Jan 2021 16:29:59 +0000
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 235791e0-2bc7-4497-b3a5-77dd7bb51ab8;
 Fri, 22 Jan 2021 16:29:58 +0000 (UTC)
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
X-Inumbo-ID: 235791e0-2bc7-4497-b3a5-77dd7bb51ab8
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1611332998;
  h=subject:to:cc:references:from:message-id:date:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=S9k3ejj42zXZeAuHs0dk+eRTCUs2SpcAQxufycWyK+4=;
  b=OoXpK0skyu8LS6H7t/ONh9jQsgUJxJvDpjMH3b1Yuykmz6rZVO+hz+5E
   Uo9zSOuk5oxu5tEngPSOx5C+5YCKdkm6tMiNwPrGK/vW3rSuIfV7Vsbzu
   sxlEIP0YOv+T9OJKPecnMLba1xd1gKY7gRYYT5q6BweQt8XpGCpe+k9cx
   4=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: w1WV9bz2jKtZGFJJ0/7e4I0lW6ZBPnnPnul+iH5DtqIPUqx/XIrER94YNt+6WJlHvFrRHeoyZf
 kCWANHsTFWhG3DPO8keLqHbmyJAhwiA1X8nkzpSq0Kd9JEIFlRNYNe2IL9XV6RZt41OrfpzZY9
 bJ7ps6uuzjVR7YSzCc9zilIH075sxGawbVj2FAj0t2NTzOsezlCknX33DmxbGVaR0eyUtabiaq
 6EQdaNfg8x0cz7i0MEZ5gM1c9GgqChB2N61djYei3+CawlwSxi6Yn056+oA/NjRQiVYJ7ih645
 S0M=
X-SBRS: 5.2
X-MesageID: 36045745
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.79,367,1602561600"; 
   d="scan'208";a="36045745"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lWY1B1Adi3JQSLCpLAbkB2QNtyADeAvbo6AOGQRebS67TEaDgvmJ0AohZnlVYjMFQYzU9tFb0JYyyYdKwR03a/GB15Sqds7PJCn5F6+4IK8X+ekoY0mxmtgEO0XpPahCQVlwmfne7YId4J6pIGCOulqEDu2IJNuyh37IEw/964pEv0btPBrdUtF4pbXbje8I1GaWVjhPn3JDvXGEBZgv76S1vuWXq1aUV5nLVUvYGXg3h8yj0HiDgURBak31xyUQV0o9YNf0BKqu16hXDw/TkPEEuOtLPMSkwSqOx1yKHmTqamkVNlcQ+45xNAloD+kT5c6R6cUGRdltlWBcXWq+iA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8Jw7KHiSwwCynEmSwy2n8HXXHzxss4QsTgbRYA5ujr4=;
 b=ZXHysHmLwyIwwO5oDM78ycUF6HHw9Ap+EKapvVSsKPExucoEkev/OmTNM7hcZtHz9PyHPmbHyEaCye7i5u7zsUsdjSufdh2CfTKnDjOCiDkFybpmjJnZRE1stpI4k5saJxXuvBsWbfqpA7YXC2t0LLo/YPp9zEZML3dnx8dnt650TAhbpT261UkZUvMx0lZ/zQc3/pBYgrmHV+GToZH9Aa48s7xA6tN5FZP5+ICQUoduQbznM5ojAH8PnkxvLMwv7VdV5XUfCEcO5Dk9IZWvK0c7PTvlAZgFlUbmrKPtp3/To9Vi6mePQPK0UL0q/KKnKVK5gN+ENYra/2SzpN9Wkg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8Jw7KHiSwwCynEmSwy2n8HXXHzxss4QsTgbRYA5ujr4=;
 b=XvYDV/vDN9uwdKHDjNQXb/HwUflkbS/bTs4U0iZkV3EkUPRcJlK8PR5IV5vhifAHs7+pnNRm4UcnHwK+UnEIuSBMwK1xVIsKmuakiI/trO8Kk2RdW7B3ngILRgIkLxZjpBTu2iP06NWVMUr3i5SEZVyUMKo94IQx87kjFzDG0I0=
Subject: Re: [OSSTEST PATCH 7/7] make-flight: Stripy xenstored
To: Ian Jackson <iwj@xenproject.org>
CC: <xen-devel@lists.xenproject.org>, =?UTF-8?B?RWR3aW4gVMO2csO2aw==?=
	<edvin.torok@citrix.com>, Christian Lindig <christian.lindig@citrix.com>,
	=?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>, Wei Liu <wl@xen.org>
References: <20210122155603.23402-1-iwj@xenproject.org>
 <20210122155603.23402-7-iwj@xenproject.org>
 <0361ffd5-a640-ac59-c222-4a2d5a9a4727@citrix.com>
 <24586.64456.905401.474099@mariner.uk.xensource.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <a436baeb-888e-a213-2a68-6817309a6b2a@citrix.com>
Date: Fri, 22 Jan 2021 16:29:49 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
In-Reply-To: <24586.64456.905401.474099@mariner.uk.xensource.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
X-ClientProxiedBy: LO4P123CA0092.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:191::7) To BYAPR03MB4728.namprd03.prod.outlook.com
 (2603:10b6:a03:13a::24)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: bbf9cbff-477c-4cc9-c163-08d8bef2f39e
X-MS-TrafficTypeDiagnostic: SJ0PR03MB5424:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SJ0PR03MB54246C5AFE3FA26A5A103BEBBAA09@SJ0PR03MB5424.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: FHiNuIYDp7JzcCS9oe8GCzN6orEoOZtGPjdKeH6URQbaH5ubMxe5Ko65JAHMIOTow60MaURTfVGJRE5IgOzobab2+BLj6GI0dVq+w6Sj6A28iB49vB2CYlWRi+DkUxqCF2T5zsaFTdfpUEJlwvEcIYVc6xdafyJxk0fgUlUdcewIAZbn/J3OnATVvpo1BbJAAlwTjJh3v7mFgJZnAPt4BrUIMVDL6HMwzefYl+h/W206vGSYOUDRaaRcM+88GV/wMNHZ2W3W02Zee4aWAnj7tIyPE77WA9HTFsqIyo1LE8GDwWwpSgpOgVb7q41D34nmaX5x/ezoQLm75S9qQ67lJM0HNR/Q+6RprC+BGJD8iuk76ZstsnyvXUfkLm3SCwreY6JQNLfuXLiXnjDLFyhfg8cbByMwzYyJJi2bPhEFwqmOvmJaWaCWvJRsn+iSj0BaBiGJiMCyKgIyZ251pbYNnN2y9c8Xhxuf95Lirh17owQ=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB4728.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(136003)(39860400002)(376002)(366004)(346002)(16576012)(316002)(53546011)(36756003)(956004)(8936002)(66556008)(4326008)(5660300002)(6916009)(26005)(6666004)(66946007)(66476007)(186003)(54906003)(2616005)(8676002)(16526019)(2906002)(83380400001)(6486002)(86362001)(478600001)(31696002)(31686004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?a0gxUG9RTU0xY1h6NHNhN3pmcTY4ZFBhTDhucTVlUEZjeVdlVjlWUjBnVjJK?=
 =?utf-8?B?ZysxU29COWI4ZmFNSW82YXNJaGtlQ2YrUi94WE1HSFJoVlRKdzkxcGtBU3FN?=
 =?utf-8?B?NHg2aVhXejdWUDYrYVZmQjM3N1BiZGJCU29CbGdSYkdlZ2R6MFFBNGFsdEhP?=
 =?utf-8?B?d21hQ2hEVnlDL0pWbmNqT1hwNG90ZzFqSzRqayt1SGhDTFJiN2JyWEFxZ1l3?=
 =?utf-8?B?VXAvWTJ4ZWpjL2NJTVdGMjg5Q3BydkFDQWZoT3ZPYU50MTlDbGhYTUdscGNG?=
 =?utf-8?B?TDd0d0t0bjNFZFpsODlPaGJ2QlNacktLM211NU9OOFNhZkJDWXQ0ekRQV2VC?=
 =?utf-8?B?VE8ycmNVVGxqV1B3RG1yWnNRT0tqV2VoaE5zY0dlU0Uwbm1zamZyRWZ6SjlK?=
 =?utf-8?B?VmRmUHVyMXVvY25MQ2IyZU4rMUg2dzBpeEx3YzE1RzNFaUVBTEtLMlZmYndp?=
 =?utf-8?B?OWtDMGZJWHkvS09XM0xJcGM5akRaRWhqckVzc056THFpamlqTGFITmNEQ3Ba?=
 =?utf-8?B?WDBGa0N2YWx3NmxlQVdIeklQQTBLNHdmTnBHUzl2d1RicFRINjlmVzM2cnhn?=
 =?utf-8?B?bktPZkZJeEZxV0xHZzBySXlOWm5RYjcvWUlGaDl0dy84Y1ZRRmx4dWpVU0FY?=
 =?utf-8?B?K2lGeFpmb042ekV3US9XeStmN0c0a2NzWU8rdGp5RHRNL2IybVc1NGJ0ZU5v?=
 =?utf-8?B?RDAveUNPUVRwY3dieE5lS2dpbDQ4Y1hGT3NlOTNSa1dvOUtkYmRYQmZsVFZo?=
 =?utf-8?B?Z3pvNm43NFllUlFCS1Y4a0NUbkxnTlRtWXZuSjJTZWh1aDU5RlR6K0VMYm0w?=
 =?utf-8?B?eDdXSmFyOHRSZkFCNko2SGRxMHJOdWRzQjNzM3Nja3FmRUdEMmZYaThaWkJO?=
 =?utf-8?B?bU84ckxObjlWSktjZVpQV05HQ2FpL1o1ZU94R2o5TlpiakdDMGxwNUUxblIx?=
 =?utf-8?B?Vm0xQ1Q5L0ZHNnhnZkVQendSK1VjT2tzYmp2dW9Pb1g2RjFLVGFrbE9jWVFy?=
 =?utf-8?B?RkFhakIyZ3BOMFpJenE2dUc2akpBTHM0eDJBMjZDVEZ6dy91OUcyYnJuNDhV?=
 =?utf-8?B?N2tmWi9KY0pNTHNlRG84YnV6K3YrN1Y4ekgxL3lZbEhkSVpSTW44VGs1Nld0?=
 =?utf-8?B?cVJoQXNLVEQrVmNJdzNSM1lUS2VqRldWbEdsQjhhSU11N25pK2daWlR1aXZp?=
 =?utf-8?B?cnV4TWtYK2ZYdllLU2tYWUgvUzdoeHh5dllISUgrYnJ4ZHpVYlNZQU1RUDdL?=
 =?utf-8?B?T1ZRU3dIT1ovV0lxRStydkJmeFFZWWxpUmQvM3FpbWJZdGRmMnZCQmgzd3hH?=
 =?utf-8?Q?3UJf+b0A/urO5DBqQukbBjGDi1hrDsRUkE?=
X-MS-Exchange-CrossTenant-Network-Message-Id: bbf9cbff-477c-4cc9-c163-08d8bef2f39e
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB4728.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jan 2021 16:29:55.2765
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sHDnksb/Sf3GBacXXu6LdxT3slc+drKL0EJE81Map0RkE9EnwmsFHVqyxGqjEfdEXROkERBYINpJrqEI8YRtvmmcQ0OwIUaCMs5zZBb7csE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB5424
X-OriginatorOrg: citrix.com

On 22/01/2021 16:22, Ian Jackson wrote:
> Andrew Cooper writes ("Re: [OSSTEST PATCH 7/7] make-flight: Stripy xenstored"):
>> A couple of quick questions/observations.  Does this cope in a sensible
>> way if, for whatever reason, the chosen daemon isn't present?
> That would depend on what you mean by "sensible".  I think that given
> that we now think we support both on all architectures, "sensible"
> means "the tests fail if one of the xenstoreds doesn't build".  And
>
> that's what this will do :-).

Right, but nothing will actually fail the build.

So the way this error will manifest is the first non-trivial `xl $FOO`
executed in dom0 hanging until the job timeout.

Or does OSSTest have an explicit "is xenstored running" check after
boot, before any further testing occurs?

>> How hard would it be to add the 3rd option, stub-cxenstored into this
>> mix?  It is just one other key in xencommons to tweak.
> We would presumably want to do that for a smaller set of tests, but
> yes, that could be done as a future enhancement.
>
>> SUPPORT.md doesn't appear to make any statements about the disposition
>> of xenstoreds, but stub-cxenstored is used by at least two major
>> downstreams so is obviously has security support in practice, and ought
>> to be tested.
> Looking at /etc/default/xencommons, I think that testing would be done
> by setting XENSTORETYPE=domain.  Do we want to test stub C xentored or
> stub ocaml xenstored or both ?  The config seems not to have a way to
> specify which.  Do we build only one ?

There is no such thing as an ocaml stub-xenstored yet, but I have asked
the Mirage folk if they'd like to remedy this.

~Andrew

