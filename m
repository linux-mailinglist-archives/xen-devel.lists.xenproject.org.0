Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DB06373E51
	for <lists+xen-devel@lfdr.de>; Wed,  5 May 2021 17:18:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.123184.232370 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1leJIB-0000eK-30; Wed, 05 May 2021 15:18:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 123184.232370; Wed, 05 May 2021 15:18:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1leJIA-0000cQ-WB; Wed, 05 May 2021 15:18:26 +0000
Received: by outflank-mailman (input) for mailman id 123184;
 Wed, 05 May 2021 15:18:25 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+Yav=KA=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1leJI9-0000c0-Lh
 for xen-devel@lists.xenproject.org; Wed, 05 May 2021 15:18:25 +0000
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 5c4ed296-f76c-49df-bf91-cba68778399c;
 Wed, 05 May 2021 15:18:22 +0000 (UTC)
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
X-Inumbo-ID: 5c4ed296-f76c-49df-bf91-cba68778399c
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1620227902;
  h=to:cc:references:from:subject:message-id:date:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=BhXJwv1YbiixRQMPu9WCfwdzGSKbSp4J4vdDjkuUw2E=;
  b=Jhn+3abVU/+K8p6kisMUJDYC/XNOk3LBSP4ZUFO4r3jAeU6dMtu2ysSR
   47EeomF3PzmC3TY1dXIHc7tEEZd+Bgl1q6ueNCqTGPKeR6v7taoP+iHXu
   1Tu5/ocpDcQwIGMcYb7aEgvVNMZkXZ8QaD1b4T7yNOWYsgCZlfP7dbUt9
   c=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: d1I0m5LSx96YFbIfhV7YaHnv8xSX4B8oZHP9+ifGwT6DRF5tIT/jKfkV/tQfsPHwj5ceVQKF9g
 4WkhleZRoYsSULJTrakBBBMatK3wGcYHnQCii0X0JGjwMxYKe8hiyNO7px3kuau3qrTBwajIqh
 TwLckxlwOPmYgXMw2VGLvtKqcZOgP0/KqRzzyGNGseVI5hjSam56XE01d8dE6Wj4oX96AtomQZ
 44qazqBczz8B+tQ2FaQMlAxd9Hq1TAHvS91ueUo42jmDQ/o06jcJY2rn/43AF5PWeCUUSbkzTn
 160=
X-SBRS: 5.1
X-MesageID: 42932511
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:GFwEHa7ns+vb3MaJTAPXwRKBI+orLtY04lQ7vn1ZYQBJc8Ceis
 CllOka0xixszoKRHQ8g7m7VZWoa3Xa6JJz/M0tLa6vNTOW3VeAAaNDyc/ZwzPmEzDj7eI178
 1dWoV3FdGYNzdHpOng5g3QKbgd6f2m1IztuuvE1XdqSmhRGsNdxiN0EBySHEEzZCQuP/oEPa
 GR7MZGuDasEE5/BqiGL0IIQvTZoJnznI/mCCRsOzcc9AKMgTm0gYSKcCSw4xF2aVJy6IZny0
 fpuUjT5qKvs/a0oyWsrVP73tBtt/bKjvdGDMyIoMAJJjvrkRbAXvUdZ5Sy+AobjcvqxFE2kM
 TdgxpIBbUO11rhOlubjDGo+w783C0g43XvoGXo/kfLkIjCax8RT+9i7LgpFifx2g4bk/xXlJ
 9v5Sa/saFaCBvR9R6Nn+TgZlVRuWef5UY5nfV7tQ05baIuLIV/gKY4501vHJIJDEvBmfsaOd
 grNs3a6fpMGGnqCUzxjy1qyNyoaHw5Ag2LdEgEotCUyDhbhhlCvjIl+PA=
X-IronPort-AV: E=Sophos;i="5.82,275,1613451600"; 
   d="scan'208";a="42932511"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jUJn913lFvv354V/PP2Vpd5UCxTpk6omQEohxdfBSjT/Av7YsuUxbG9AKiv9hM1w3QFdFgWDHAp3I0HApikXDzN1MzdNQW0taYsuSqmoAYBIsEgdQFMBy9itN8YbYPgqK7VvtaTFybChpBQaRzPmLnnNn+lM8HaMk/xQqwB7yCwMaJG4b5FgTh2avAIktd4oDyitk+YF/idWjLOJ3OYh1fY8/vjTmSe/1Ns4pRuPa5MZiemaM0D/89YYM/9JhkLaBmRzqO0KSDAKD6h1YjWrkLWGEjqDKDHJQvJ8Pn9QO0jQC7GvAGtyxavyTcQCsXQ5EhbJ99pnZOi6C5DTUd1JMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BhXJwv1YbiixRQMPu9WCfwdzGSKbSp4J4vdDjkuUw2E=;
 b=j2K6+YcTIRolZmEHzfoOvOAxq2cTv/ezS8peR8HXIbSp+5SIbNBns4wpzkESMfaYcF56K/KK69IlMG9rQwglvjrvcNaJc5R1K/TH4x/RumJx5ynFrVS9lbVd6T5oH68y/9xqfeuzooo03kDz2FUMMX9q4CLoO9GH6s71oQgTzHQrBKlbXI7tVcDeZolbHdnDXX7ADb8c3zXen48Ss6QAUZ8ZNLja7xqEmCe0/xNVneXhbjc74zzYaVzOrd701+hg0BnYecDlI4AitmwbQaqEdMc9lWpQ9+HwDnRjJlMQBqTfnfxGIkYSMqn7DC1O4SdhUyabv3UltXC4Q7pxzE85/g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BhXJwv1YbiixRQMPu9WCfwdzGSKbSp4J4vdDjkuUw2E=;
 b=s2A5ltrzmqa21Sk1B1jS78FDnjkoDc4ZvK5V+Yv60duiQCD1wawEr/svCTaDMTyU5jIyFtoiuWOEgtiJYBrvx9dbl0isHmxNPpnnePfI2gj297ka5HXpvzvUajJw4PMpfkpa4ZxM4rwRRtUFs+VZrrvkN3QZ2eDSWwqQYjL3t1o=
To: Jan Beulich <jbeulich@suse.com>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wl@xen.org>,
	=?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <20210504213120.4179-1-andrew.cooper3@citrix.com>
 <YJJtqyDOIkMxjvxW@Air-de-Roger>
 <8f6f339b-f025-2cd0-e666-a3083e79af3a@citrix.com>
 <YJKXZyCHpRg32tyc@Air-de-Roger>
 <38f5b74f-b005-784b-a92d-8ddb9e1b8d3c@citrix.com>
 <bb2089cf-74f3-a7f2-7001-21a0d009440f@suse.com>
 <8d786331-0d9a-2ec7-0fe5-ba86d4a2547c@citrix.com>
 <d9e03aa4-bbf4-a1ef-bfab-2803e707f498@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH] libx86: Introduce x86_cpu_policy_calculate_compatible()
 with MSR_ARCH_CAPS handling
Message-ID: <03b94402-6233-b6a9-6621-064b5c6bce26@citrix.com>
Date: Wed, 5 May 2021 16:18:10 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
In-Reply-To: <d9e03aa4-bbf4-a1ef-bfab-2803e707f498@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Content-Language: en-GB
X-ClientProxiedBy: LO4P123CA0181.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1a4::6) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 69bdbe19-659d-4081-f29a-08d90fd901e8
X-MS-TrafficTypeDiagnostic: BYAPR03MB3495:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BYAPR03MB34958AB2B83B152F7521BDFFBA599@BYAPR03MB3495.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: R/XU10XBDvOhGgdeb8tTwA+XiqDeCB84SHDG1cNHcvDc0ZVhNBBaKSTo3KObG4NAEpe6QXs1TJam6ws1y/G2JxYlvdL34T0B3rEf6OhNseGrnSGK9aBdwIhCIravtl2y+jGt6e2dk9Y7JlgbmHKrUHyFAJ0uq7Wc4OCsDp5mbOA0CcRR7AhTxSrrNbmo6dvoE/fbgocm/lQaF+keAH2KJJ85ZgBeYgvwsWxvXOSKImrjg0qfZh5XnVT+94DVyG0lRSbJmdBsU9J4RdWt7/8r9E0kEQrwa/3/Kmx9B9r7OYKpkhHKNX0BzfhTsHP5rj8+1uG/PMRSYfYu70vwXY1JZ0zDYnrnVzYXyDqhVAwCbnrcdCST9c+sEoigrO87no2DR7dSytOtS/KWyISnSdbH2YCm1qGGWKMf5AiFZXHs1iMXVdkntAMwgJC1Hh9eFtIy8cNS0lPMZyib+qeiVa/O6JUc4ZHT1NK7E6iXa9EGRZqgdtpMWuz8K7q7RBmTxpAVmIJduhAKenssGKxcBiEOqKVHocQ+9E3aYhaS+XI8sMoNyvaBSZN2RKDXfAszpxFedibU2uh9rF4X7IULyZIjSbMSyiAN1gwHm1grlb3k3ExyfdywYJlg5C/KjLKK0YyeCJ0OfKd7nfwDqRwOldf9RyG5E7iUvNX4YbEHb/qs7ffqGlNcdSNCZ7IVO5K9fyL/
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(186003)(498600001)(4326008)(38100700002)(26005)(16526019)(2616005)(107886003)(6666004)(31686004)(6916009)(8936002)(956004)(83380400001)(31696002)(6486002)(5660300002)(86362001)(16576012)(66476007)(66946007)(66556008)(8676002)(36756003)(2906002)(54906003)(53546011)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?QzNiRVBwaHN6ak5zTHF5bVNta1gwTng2WTVVQWZPUVFKYWcxSkQrOXhiSEZo?=
 =?utf-8?B?TTg5OXZsZnRWY2pGakdzenllY3FZZTJmRHRudHZmMnhuRWJUd2JmNFp1cURi?=
 =?utf-8?B?Z1czQlgwK1VKUTYvUUxJUktUYml0cXI3cnhOQ29lUHVFdksxYWlGdHUza0Yz?=
 =?utf-8?B?R2hIT1VMYkpsQnhvRU8ybGd6clBjTG5qelU0aEJqenZxMTgzbTN4Z0FJMkQ0?=
 =?utf-8?B?S0R4dnN2SGgwQU9sU2ZPUGF2YzFuUldsMkR1MXpsaWZnaDRHbDBFRlBJZjRH?=
 =?utf-8?B?WTBWQVZLWnVpY3crT0lRYzZCRUx6ZVJ5VkxSSWZoWEtWU0lzN0g0VWw1RWZo?=
 =?utf-8?B?ejFvczFuK0V6SFMrL3hhQmt6MjRNdyszZ3Q2RFBNOXRuUXZDeFgvUjRHMlFn?=
 =?utf-8?B?UC8va21uRjNRRDk4Y0hsaXhnMTFCOVQzQm9uTlRoa214MzN0bXR4ei84VmNY?=
 =?utf-8?B?SFN3M2M3ampZdmw2cXN5VFJtOTJ2TUJOYTFaSFVwSjI0eXJkZ2FOSmVPS21Y?=
 =?utf-8?B?em1QRWowdFBxQzlyS1NPb1RBcFhhOHhKYWZsNFZKVCtldnBPT2FvSFl2NEdU?=
 =?utf-8?B?clZRb2h4RzBkREhWNk1neHk0Qkp5L2hTeGU5R2hhTnZNUzNVMFpsUkRwNDFk?=
 =?utf-8?B?MUx4VkpFZ01LcnFNTUNtQlB0bDg4eEFhNHpEYkw5NHVSYnFWbXhEQ2N4dWNq?=
 =?utf-8?B?YmV2TDhXSzIremw1c1ZWd1dNd1VkVE5UK2lLNDArNVBIREpWQVA1bFNaU2g5?=
 =?utf-8?B?TEZqK3ptSGR1WkZNcXdSZkp6UFNRaVdZK1FDdnVDM0N4Y1BMcFpyNW9NcmJM?=
 =?utf-8?B?ekNaY2NIdWRaVmtjVEoxSzdyODltR29vWlpKUEFhamtQVktOMHA4WFp6cWFu?=
 =?utf-8?B?aG50SzFtUy9adEVVNUpJWGNNNkVNd3NCd1JOWFQyZXo3dmsvd0k4WURkV1Iy?=
 =?utf-8?B?QVU0Vm1mUXdTT1ZWN2V3NGpUQ29sU2F2dG9XYjJtTnZFakYzeUlTcGpKTlVs?=
 =?utf-8?B?SXRFd3JsUEFSeGdEVk5NMnJSSFdUN2cwc3dtSHNja3dOVXgxUmdSbGY5S0lT?=
 =?utf-8?B?WEFMK2JIYjNybGowUHRaVVg1bDVVUGVMa2pPTHRENEpxNmN2QWdSSC9LYUx5?=
 =?utf-8?B?SUlrbnE1K0o4Y2hoK2dGT2NMUHRjUFhBRmN3VStFRTVnMENuTGh0UzNTdlNY?=
 =?utf-8?B?SFJRRU5Ta3l1WEoxK2wwcmg4L0hwWWZtNFNSbWUrZnpsdklhZEpHL2l6ZUp6?=
 =?utf-8?B?NW1VNEk4aDVaZ2F3bytJNkVYL2Y4QTh4MXZuN3BhdW9yU1poN2UyMzdEQnpr?=
 =?utf-8?B?WDRuZkdZVERvdk5rMTlGdHJSczFGV2NVOUdPL21yNzlYRHFQb21zMWpvaGtC?=
 =?utf-8?B?U24xa0dkT1FKY05BZkgrWm52eTRUK3ltaUlsYWFGcXE0Q3lxSXo0TFVzZnAx?=
 =?utf-8?B?VEFIOVFqYXdtdTBZOWUzYkJUdWJKZEdveE9lcjhJRFhZUWlqalR2RFhRZ095?=
 =?utf-8?B?T1FWNTgyNjIwWHJ3SFBCZXNZdWcvOFVublozaDhwOEpIMFdyK3ZzTE1teElp?=
 =?utf-8?B?K1pMcjYzQVdtUTZJdzA3cEVoU3RXT3pzTzZtTldWKy83NnI5MUVKbEJpTGlD?=
 =?utf-8?B?QnMwUnhLdndxVENFaElUbVdNMTlhVVZQbm82RkFKV3YyRHZKNEdxQzlzM0FZ?=
 =?utf-8?B?UkdybS9lNHBjQnFoOUVSV2xnWGpHaDRjd24wWkN0K3lTYUl5N0hxWW0rZkUx?=
 =?utf-8?Q?Vz+rqBkjx+PnD90D5L3iK3EchA/EIrjJ4oFO3V0?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 69bdbe19-659d-4081-f29a-08d90fd901e8
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 May 2021 15:18:16.5648
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QIHHWISrSMhSQsOVY5ikojtEF662ndgqHeVPFWsDcqoGTYcA1egR3jfShACjy2eH+u8HjVDeeIYWW8iWLUB12BgE+pmx/Y4cFrusPQah4uU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR03MB3495
X-OriginatorOrg: citrix.com

On 05/05/2021 16:00, Jan Beulich wrote:
> On 05.05.2021 16:50, Andrew Cooper wrote:
>> On 05/05/2021 15:48, Jan Beulich wrote:
>>> On 05.05.2021 16:29, Andrew Cooper wrote:
>>>> Technically, MCXSR_MASK is also a hard blocker to migration, but we
>>>> don't even have that data in a consumable form, and we just might be
>>>> extremely lucky and discover that it is restricted to non-64-bit CPUs.
>>> "it" being what here? The value's presence / absence in an {F,}XSAVE
>>> image? Or the precise value of it?
>> The precise value of it.
> Not sure whether DAZ is new enough, but relatively sure MM isn't.
>
>> =C2=A0 Migrating across the boundary where the
>> default changed will cause {F,}RSTOR instructions to #GP.
> That's understood. Is there actually anything standing in the way
> of treating MXCSR_MASK like yet another feature flag group?

Well - we'd need to find somewhere to put it.=C2=A0 It doesn't fit in
architectural CPUID or MSR information.

We could add a 3rd category of information in "a cpu policy", and that
is always an option.

However, this issue hasn't been a problem so far, is only for very
legacy CPUs at this point, and isn't high on my list of worries.

~Andrew


