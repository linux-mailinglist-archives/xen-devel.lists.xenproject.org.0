Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C2980307F9C
	for <lists+xen-devel@lfdr.de>; Thu, 28 Jan 2021 21:26:53 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.77453.140278 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l5Ds6-0006Lg-Ar; Thu, 28 Jan 2021 20:26:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 77453.140278; Thu, 28 Jan 2021 20:26:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l5Ds6-0006LH-7U; Thu, 28 Jan 2021 20:26:30 +0000
Received: by outflank-mailman (input) for mailman id 77453;
 Thu, 28 Jan 2021 20:26:27 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0GBf=G7=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1l5Ds3-0006LC-QT
 for xen-devel@lists.xenproject.org; Thu, 28 Jan 2021 20:26:27 +0000
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 43a21df8-f4a1-4267-9461-3e207b654fe5;
 Thu, 28 Jan 2021 20:26:21 +0000 (UTC)
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
X-Inumbo-ID: 43a21df8-f4a1-4267-9461-3e207b654fe5
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1611865581;
  h=subject:to:cc:references:from:message-id:date:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=F4a3DDbCFSKdizj/PM4LircCnTXvv0v1SMmkeRUY3eU=;
  b=O1G5nJV9Mi7euJGpu93G/k2wg/1icqo+UhIYJMuUe66Vqe3W+ucE8jvh
   BJbuFu/Zhrsf+NYFOYaO4YH15f4uBviRNl4BKRuHYaaYGZa7CiQR7ujSd
   fD4d81lSsd2NWlxIFPT0jS3NqI3QqRmzsM9wieleFSj8QDEaGYEu5EToH
   4=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: J8mlK8GF7l96YRuruUxin6jVWLAjTCI6reJrGxs2sV0FdN0+nEHSNz7lL/0/72Ch0gNm7DNInT
 QNd4mLR8T30sSz3XMTaGhfpVAgDtnnD+oHLHEYU+x9ZtlQguKltlYheZL9UO7A9dDVZHR9wPT+
 swzZT6msZviz5+2fxDlKMJeh/3lFZW3kJw2qq4mHS3vdeJlzUkD2Bclur8AQrWlnrk/PDcmcSy
 JR11FcMnQYsQbKSDYfV+SfRseGQO7pgQ5/Xt9oTDmoh4EukjPfLDAX5wie7sLgGzd1DxWgS9Fq
 tg4=
X-SBRS: 5.2
X-MesageID: 36140557
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.79,383,1602561600"; 
   d="scan'208";a="36140557"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BvWzT2x9Sjihxs/8drTALMSEupD6B1L0qadL1t83cmdpKsVjUVCAYqbJjbrlo8yTj5EUpnQonCirRNIac9k+i+UjsRt1O4lMjV+4XUbl1QZI4f4OO+cZXMmpyCP7d0SF/BkjRAbYLKVV4+MB0zjZlgFZSKSWqNh8ipBmvPgTwsyBneI5ndRZKoHqmxD9mznoJFq1vzwnv61D969Dn0+K1Mb1vSg/JNWwcUiI566hkTMNoO8asY9OfPe7uVElp8achUqlsgirvtZSEZIOQ9QBzcmn6eU/AqO5cyQ1NJJm5uXAiqthsORe9GEUmNL6OZGmzaw7DCcsgJScVj8rbXTBjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yXyeJAT/pBhn/NP9mcxQ2jGuJoEQpuy3FAFAqKJNqVk=;
 b=B1k1BBTJxurGQKEMDy8QKvVTrKfYQYU+myQhqLgwNAWTGWPXf3y6i4jConkNbY7YImCFhdyxPsptdCfBaEQbqAmwqDs5NUdIoOg7dNDufhKj2y29WMlU6vsvTTKbNvp0Gp0m8vyifpHubbfnNZhg59zRZg2gfoJ1Zp0lPxBjd/g2Z5IHTiDyxDHKR1boZyVx1l0Gr6f7GOPyZxp0TStxq/sh0gCJYHZBp+AnHVEKZzXp2SsHf3SPYPIMFP9CLoh6hxWrD6SVzFtpjtFvRnORaAGYQPC2CLvPU/uDKJvfA8OGwXuv1z2LdMJlQ7Q+CqZD2dnp9EdIAFQjudRUqWcRXA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yXyeJAT/pBhn/NP9mcxQ2jGuJoEQpuy3FAFAqKJNqVk=;
 b=dBjj+gMG6mFG4AxtBKv4+XVJgY4tFp1pq/oFqN5h5XO5VaoF5xLNXTEEYC9f2A6ZUQHcjgrVtG0uypozK+oRUQfXg3DulZ1isaBXZTgie/fO2Pevo43K0ZVjhML0+3kKOcs1XFTbL28n/a6nbafgSKnPS14SyiNzUbhM/tIXygA=
Subject: Re: [PATCH 3/3] x86: Support booting under Secure Startup via SKINIT
To: Jan Beulich <jbeulich@suse.com>
CC: =?UTF-8?Q?Norbert_Kami=c5=84ski?= <norbert.kaminski@3mdeb.com>, "Marek
 Kasiewicz" <marek.kasiewicz@3mdeb.com>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>, Michal Zygowski
	<michal.zygowski@3mdeb.com>, Piotr Krol <piotr.krol@3mdeb.co>, Krystian Hebel
	<krystian.hebel@3mdeb.com>, "Daniel P . Smith"
	<dpsmith@apertussolutions.com>, Rich Persaud <persaur@gmail.com>,
	"Christopher Clark" <christopher.w.clark@gmail.com>, Xen-devel
	<xen-devel@lists.xenproject.org>
References: <20210115231046.31785-1-andrew.cooper3@citrix.com>
 <20210115231046.31785-4-andrew.cooper3@citrix.com>
 <7c24ddd1-a443-9da8-d840-93a5518b741f@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <15d53d9c-0e05-c4cb-f0e6-ef7eb51e1c9a@citrix.com>
Date: Thu, 28 Jan 2021 20:26:09 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
In-Reply-To: <7c24ddd1-a443-9da8-d840-93a5518b741f@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
X-ClientProxiedBy: LO4P123CA0086.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:190::19) To BYAPR03MB4728.namprd03.prod.outlook.com
 (2603:10b6:a03:13a::24)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d119956d-e07c-4b92-d9bf-08d8c3caf70c
X-MS-TrafficTypeDiagnostic: BY5PR03MB5128:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BY5PR03MB5128F898703BDCFC8BE44D5DBABA9@BY5PR03MB5128.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: r9z2mhqvrpXN/eX3YOpfXe4WB3M5wuJocfU7Y9UlanQQoGp8bB2Qv5qkASok46xScGOOszBjy3H1QWt/8ZvNv5UIyRA78q1mzO1zCvq8HzI+AJe7oc83gqbnXALtcTJHNElMCzHKnXuL/T0N4GaWhHXCMfuIWSbYlIaKzzcMd83cjx8O6diVP18tZ+iOSuuRYUiWMIV8990EJB+wo4XlQn9mg2bLz8AsDwkGq/g4WXeSxj+JFrsZfUAFUsVTWdoLa/GY/5EasYdHoUCmcRhCBU0IqnKeer8mqDOoXIKrFf1Psu9EWQJ7V8bkeCs8U2zokcTwg+wzlLE6rwmgzYViyMzG271IRn3xzeW18javxceWuSwtFbvhj+56qFEy5IvB/nsgYF8CNrv5BXkQB4cOCsXXsXV9VgbCKvJWgXyVaUfMjXVZm76yS1Czb6oXAj22VsKQCLdm72FlqkWntvenhXa11/4l711+mjAn2cdQvXKOvE7nlBB/GFRy0ciq7rk0uvVS9ht/IsvILAl17B14j+OWw4IBVssn1N5FRumEbEgv9YkfvSLyG/BunxEW7mWvAT/E6c+WIBuKClfjIw03bvxVTryd/AksoZd9DWQTELU=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB4728.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(366004)(396003)(346002)(136003)(39860400002)(66946007)(83380400001)(31696002)(316002)(186003)(31686004)(54906003)(5660300002)(4326008)(2616005)(7416002)(66476007)(6916009)(36756003)(6486002)(16526019)(478600001)(26005)(16576012)(53546011)(2906002)(8936002)(6666004)(66556008)(86362001)(956004)(8676002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?c3RiaDE3YVluZ1o4Q0JkVTY0YlpIMkNVTlZ3bTR3UGVyQmdtVFdQS2JDUEtB?=
 =?utf-8?B?WDRoV2pmN3BqYkFEMjFzdWtHQSs4d1UvR1RabERDZ3dWSlhFekx2bldTaWZr?=
 =?utf-8?B?Y0lLT1dHR3RWRjdCT0Irc2dWeHl3YXR5SmR2Yk54TmRIeTc5Wmp6OGN4cWRW?=
 =?utf-8?B?SlZmMDhyOVRRb0d3QUxBVDNPZFd6T1VRaklERXZ1ajR1dkhoV2pQSUswUFFT?=
 =?utf-8?B?K2hsc21NVGZ2emdHemxNNHIrek9EWXpCMlJ6QnZBTldHblBHV1JGVTZRZ0lX?=
 =?utf-8?B?VVYwQ2w0YmxVczIwSHVvdkJ3ZGVPTkFQTkhBVEx5c2FITTNGQUFJbXkzU1pw?=
 =?utf-8?B?c0g4THY5R3d4eUIwTUlhRHk1Q2ZFc2hSVWpTREhmYVlPU00vR3lVNlg0U0d0?=
 =?utf-8?B?RGFndUEybTYxT3hyVzU0SGZkbmYvSHRrZDN0Q2IvMEpIcmtPVmV5SU9DbWlo?=
 =?utf-8?B?NnNQZFg4Z0QrbHFEM2dYaDNhQ2syeUMyOXhqdDFuOHM5UWlzcHNtUlJ1NHBn?=
 =?utf-8?B?N3VsVnp3QkZCZEFRM2RiT3lmQ2lNZlN5MjJJWVMzb0w5OUNGYm1MUm9jSncw?=
 =?utf-8?B?RFQvTHdCMFdVWkhqOExMTXRSMC9YRCtjVCtuOG5LTVpybmNwdlhOelQram40?=
 =?utf-8?B?UlhVd3ZVQ3BJeXNUOUc4b2NFYjJBako3b2RGeFlnZ1oxSDNpQU12WlhiL3dM?=
 =?utf-8?B?RFRxQy9ob1hnWjJtcHE3UXI0UE1xeXl5ZzhtaHg2S09WeVluTlkrNzN1N3NQ?=
 =?utf-8?B?d2krMEpFQ0hCbjl6VVd1ZjFSWGhCckcvV3duTi9WWWJrY002TjlLcldTVit2?=
 =?utf-8?B?dzRCYlJBWStjZElGZHRJOTZJWEJQMWNabTNaSjUvc3NiKy9IdkNOQzJ1Y3FN?=
 =?utf-8?B?OFY2ZXVBM1NNVWFXZmJheEVQQmxVeWlJSUpZTTR5Tm5GS3FoL1V4cVE0a2pU?=
 =?utf-8?B?eFQ3YTlJQ0ZQSTAxNkFoT1IzRHdQT2RZVHNTYnpBQmpQbGhpc291NjYwbW9w?=
 =?utf-8?B?TkczcGYzN1owSkFZWEp5YXNPRTUrUHVXd29kUFRQY0paOXZjdFgyK1F2SWpt?=
 =?utf-8?B?azFkT09sRlg5R3dpVnRIWWtCckh2QXcvcHpJZUpoREhGbE5jd3NsWFIrc3l1?=
 =?utf-8?B?Z29iOTk3ZkZUYW5FaXlNa0o2b1VmN0swK1AxWFB3UzFjaXp5dk5yMWNtNE11?=
 =?utf-8?B?TW9GMS9zNklvektDK2NnYmZST2VEcnN3TUdsVmtZbXdJSm9uRStTc3lVdFA5?=
 =?utf-8?B?QVVmRWtSL05IeGZ6RVl6OHJQN0ZEYi96OFJCUkZtQTVtOWhxbHJJVmNUcDlF?=
 =?utf-8?B?bVM4OUtPOVlBY24rajhpcTFkd2ZwT1ZvaFU4YmFPWU9NS1k3SjhRb2ZDWFVV?=
 =?utf-8?B?TkhNaC8xL2IyVURVVHQ1RE1TVXBqMk1HMGVnOER1aEVwK1lEbEdXUGRLUzZn?=
 =?utf-8?B?Mm13SlRTQnJwbWRsZFhPY2xRSTlTS0JVV3N5SWhnPT0=?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d119956d-e07c-4b92-d9bf-08d8c3caf70c
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB4728.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jan 2021 20:26:17.0078
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HNuIFVMqkjRrAQah/muCbIRjUuQCnTkJfhZpBOLl7q6M3BZZpR2Uo35UiKo01MLEAA45bAAMam78pycwg1m/AQCEjG8KtH+BXUXQ1jXBla4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR03MB5128
X-OriginatorOrg: citrix.com

On 20/01/2021 09:19, Jan Beulich wrote:
> On 16.01.2021 00:10, Andrew Cooper wrote:
>> --- a/xen/arch/x86/cpu/common.c
>> +++ b/xen/arch/x86/cpu/common.c
>> @@ -834,6 +834,29 @@ void load_system_tables(void)
>>  	BUG_ON(system_state != SYS_STATE_early_boot && (stack_bottom & 0xf));
>>  }
>>  
>> +static void skinit_enable_intr(void)
>> +{
>> +	uint64_t val;
>> +
>> +	/*
>> +	 * If the platform is performing a Secure Launch via SKINIT
>> +	 * INIT_REDIRECTION flag will be active.
>> +	 */
>> +	if ( !cpu_has_skinit || rdmsr_safe(MSR_K8_VM_CR, val) ||
>> +	     !(val & VM_CR_INIT_REDIRECTION) )
>> +		return;
>> +
>> +	ap_boot_method = AP_BOOT_SKINIT;
>> +
>> +	/*
>> +	 * We don't yet handle #SX.  Disable INIT_REDIRECTION first, before
>> +	 * enabling GIF, so a pending INIT resets us, rather than causing a
>> +	 * panic due to an unknown exception.
>> +	 */
>> +	wrmsr_safe(MSR_K8_VM_CR, val & ~VM_CR_INIT_REDIRECTION);
> Why wrmsr_safe() without checking its return value? If the write
> faults, we're hosed anyway, aren't we, so we may as well crash on
> the offending WRMSR rather than some time later?

Paranoia.

Xen's old MSR behaviour would have leaked INIT_REDIRECTION into guest
context but discarded writes, and there are usecases to keep
INIT_REDIRECTION enabled (if you're willing to sacrifice PV guests to
avoid #SX-over-the-syscall-gap or back-to-back-INIT-on-IST shaped
security holes).

I can make it unconditional if you'd prefer.  At the moment, all this is
is a best-effort attempt to get back into the old state, so development
can continue more easily.

~Andrew

