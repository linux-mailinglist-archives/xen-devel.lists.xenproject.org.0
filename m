Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8205E56820C
	for <lists+xen-devel@lfdr.de>; Wed,  6 Jul 2022 10:47:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.361967.591771 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o90gQ-0007Nv-1v; Wed, 06 Jul 2022 08:46:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 361967.591771; Wed, 06 Jul 2022 08:46:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o90gP-0007Le-V8; Wed, 06 Jul 2022 08:46:53 +0000
Received: by outflank-mailman (input) for mailman id 361967;
 Wed, 06 Jul 2022 08:46:52 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ZJ1s=XL=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1o90gO-0007LY-9Y
 for xen-devel@lists.xenproject.org; Wed, 06 Jul 2022 08:46:52 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2070.outbound.protection.outlook.com [40.107.20.70])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2d94a737-fd08-11ec-924f-1f966e50362f;
 Wed, 06 Jul 2022 10:46:51 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM6PR04MB4296.eurprd04.prod.outlook.com (2603:10a6:209:50::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5417.16; Wed, 6 Jul
 2022 08:46:49 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::60ad:4d78:a28a:7df4]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::60ad:4d78:a28a:7df4%4]) with mapi id 15.20.5417.016; Wed, 6 Jul 2022
 08:46:48 +0000
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
X-Inumbo-ID: 2d94a737-fd08-11ec-924f-1f966e50362f
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ioR0u1HhB8K4jlvKallxTUrg3q78M8c0OPCD49Vdc0PNKW4CWOGYSXwpsnDBC0UyevOutK2mzaRQde6XESqgMBPSP/k6lq7S/T+Lvitdt7vHhrOM5sNiS3WiSCtkg8aCjwOBRyqrG/0E6c+px2V2ZbgHEQiGs84PimIXvRvmKHVDANUvjyhraTbLFs1JK3hiNJUkxyJBO/glLK6RJWOaAxehfryHsxX5/dTu+PkYO5OdD/dPjrL8m+rnIQEhFVkh9d3zRjGTg52F59pNGQWMRIJg9gF+z/aTAO0hvLI54M+GCnUKzJ0366M9KslKZvme6OHpYe2bLlf/tmZYeIBYGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OYwDSGtlzCDza/XFA6m56Oh4qahZA6wtvisv2G3Sy9w=;
 b=FiE0b/s6hXvj5DGqGZ9t4WuWdgTcz+zwdwmVU8xRZNlRTLeBGczcyiaEfx0oGnd1puQ8yXqdw+r4m05xGC7+m2nfGFqCm5jVSQE/5NXh4oMY6jMxrPk/bh0kL+m/0QMi+lD5/AdnPwn3WVcpi5Nfu8PY01zy2b2XBxj/BOidpQOlC2ayM9Dd1uv7BuQUgSD5aHIX8oHv5hwhg/ShpRSPDsVY+pACRt7I0aCtlvbavsgDkcKyNgQXqkwZBLNompR3eJ3UsXQMJ+uCwbX4lsoCWejFKG5XpS8my5SgtFFppDHlJWijzj0IbGpIKQ+GJsn7BjPBA2Tiv8vrV34yRhqnxw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OYwDSGtlzCDza/XFA6m56Oh4qahZA6wtvisv2G3Sy9w=;
 b=L+E/+wGnrD9pzX1BKV7PGjKcb3+RO15ih0/swDDby9h2s1OmTuyrBhV33kXrYgut5yboV/3HTs7IST8FxWJ38A+reaVucErV+QXygTlsWaw83M7ZzbmKwH7yG6DhikNQWieQEDBD7bHlY6yRbZEI4OWTet11k6s/+cGTLIOCwjG6BQd5LCexONw57enMzIJ+Ho3eZ/5IrOsnLvqzKKK3V1UD1dooKZQyj2fDaqlQFwvaIpwMYUPmYorlkHsBkdbr0Q53As3A6Idqs5huazvwyjadRECqHTV2Njqr4876aDIgZcsMZknjS5dYvB1WzDKVaLYqMLYDvrJC0qwd6YnL2w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <58b535a2-f916-3c95-6b96-4ab0b7541ec4@suse.com>
Date: Wed, 6 Jul 2022 10:46:46 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [xen-unstable-smoke test] 171511: regressions - FAIL
Content-Language: en-US
To: Julien Grall <julien@xen.org>,
 Demi Marie Obenour <demi@invisiblethingslab.com>
Cc: osstest service owner <osstest-admin@xenproject.org>,
 xen-devel@lists.xenproject.org
References: <osstest-171511-mainreport@xen.org>
 <a9a8276f-725a-db6e-8223-a9e6060f7700@suse.com>
 <14334329-baf8-5b71-5a48-421e2b6652b5@xen.org> <YsVCUITQ8nWKi+W0@itl-email>
 <dff668b5-9876-e353-325c-c5de6e9b0af5@xen.org>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <dff668b5-9876-e353-325c-c5de6e9b0af5@xen.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AS8P189CA0010.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:31f::9) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 68766e09-9f5b-4889-5f31-08da5f2c105f
X-MS-TrafficTypeDiagnostic: AM6PR04MB4296:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	CDF8KYc1UFKabHdF5AzuI7MQ/C4PI7bbGTkYCRfarigZgPn3KPse0qjls/AIwSSd2LYVP+vVZzN+eU70U2lQRFA9Fh6ixjr+Pu3Av7WdFqTqhpW7jp1+3s0yZrbD5N7Id4svT4gKpFe2ZPkG8SZdaAwJ0zsCUbK1x5aFmoibSYK+PkOHjlcjt3j6+lvUvrCeQGslIpynwJ/mSYaiqdn5Q6AlpP2pqF0Vz03vG94aZywr/O0swSPNNuYmqgBNVq2+MrgSEKgW1ysJR77zxkJnuHQQybyflWZ7arynI3kse4/pUE3YbOAMlq6/4vt0n7/eyL1TDW9zj1kys+FtVXYkaAvePFP4Hbnu7FZhfprV6sN5y/4urXnDixDsqLaUTIKg5Kv3Y8XPSaCmPx26GVj1HKAcPboHZ7yVxYQgnps8/LvXjK3tJ09GkwLZhUrlWf8WAcIobTnPAPl9c1qPxqxKE8xkWd7UQmee3O0BDfKGR48drhZtFdhOHzCHwfk2qDhliZeBRlXMm/XAd8NOZMI+tGCX99KonE4xIH6pNo5MhhQzG9PVt67v7922qSGzqq76sp9kwIJW74N7j9PAgOtuVOBNcbz5UX7qbBTIJsxq6lfZq5jbbhX7j9eo9TvQURNHa6ZJWKWq+gkg9t+3SuI8e8zcrmDmx4/gWx9MYYp/MWvmgnR65BHqbJE1yeFXLrHIpascdzqWMsmsFzLsQleKQW4ZU1JqAgWDLXVautaX8F6g3jkjPfE9q5mYvZJ/TF6W17oLMvhkN7+2Pb/ty+kbST1CnjLn+/E8pgI0jHFBn665Y1MRPLnSGe3YY4BztPUarkhHWnrxJM09Rzxv3Y6Czt/OGo/u3msmz7azfGBWOGVNMnxuDCTuCyFTBv/nSt4mMSnYyyg1rV7WrsMkXVs7Syta7keNKKlWef2wH+2BMPo=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(346002)(39860400002)(136003)(396003)(366004)(376002)(186003)(26005)(6506007)(83380400001)(41300700001)(2906002)(110136005)(53546011)(316002)(36756003)(31686004)(38100700002)(966005)(6486002)(8936002)(31696002)(5660300002)(86362001)(2616005)(66556008)(478600001)(66946007)(6512007)(4326008)(8676002)(66476007)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?aG1YckRYT1lJTXpUdGJlZ2lzZ1RrbXBLZ0xSWERqSTlrT04vZjI2Y0QwcndJ?=
 =?utf-8?B?SEE4a2I3QkpQa2RVanJHcXc4V3I1RGwyUHZHZkcxb0xUem1hK3hTUk41ZGRs?=
 =?utf-8?B?WlRVQzEzRUtlZ3M4SUdHRmtFc2JRMGZHdHlHVllqalF5UGdFYW1KMkRhSG1i?=
 =?utf-8?B?R3V1eXpxVlVhZmtBek40SFZUZW8yYnZYNWR5WUxKMHBTUkJGQmhZckN6dVVB?=
 =?utf-8?B?ekoxOU1WM3BFMW9zODQycFBDbXIweld0VHNidmlqczJSOUhHYlJQNGZYSGlx?=
 =?utf-8?B?SE93NlEzY0FHYWROVjZ3VjRUekVTMDVMRjF4dzFRbmlqTDNGaU5rcisyZWd1?=
 =?utf-8?B?YkozYjdPNjBaWEJPcmFqS25CQ2lVTERERHVtWFFlS043TFJkME1nQU1XNDBK?=
 =?utf-8?B?aUwrVit0NEl4cDZVUm1ySDhnNlFsR1FMcHcyclBwWWg5UGJCVU85L1hDUlF4?=
 =?utf-8?B?U1JRQ0ZVb0Rqc1ZCNkU3TXEzcVErckN5TTNuZklSU0NWeWZqSzdvaGlaUlh6?=
 =?utf-8?B?MVY0R1A1bWZtYzVkY3V6Zm5rbXpUZG9ra3BhM2xIck9rSFMxUktVbUorK29R?=
 =?utf-8?B?N2ltYWkyMVYrVGJnQkxyVkdOUVJzWWZsMDUzbjk1ZkNReVk2R3lwNGtBL3dD?=
 =?utf-8?B?UzVlTVhrTllPQk03a1VYSVI3ajJ0Z1VUZkZOZHdpa3JXUUEzTmd5R0lBbGRM?=
 =?utf-8?B?VWpvOVk2SktaWmpsMlFRU3NFUWVZeG1GT08wQWFuU2ZacENSOVlzTGFwTkFD?=
 =?utf-8?B?NStoSkNIeGNuOFUySHg5eFIwVWVrOVdlMWJKenlCTHhXWUNZeTFVaTdFOXhv?=
 =?utf-8?B?Um5vK0RUSFZkb0Z0a2VhVmJhOFZNcDg2aGVJRjRlSVJZNlhodWFGZ2tyUU1r?=
 =?utf-8?B?OVh4eWd3eXlYQkpyYjZGOE1hMkdTRzI1bHVNQThCZE5LR2dxSW5yMUxxVDU2?=
 =?utf-8?B?R3drUkFsUUxrVVdYdUJyYldrWHB1MHNGYmlxTFVjbHM5bm1YaUllNjBTcmJO?=
 =?utf-8?B?OUxjUTRUbG55MmV4TmNOa0Jad0xzZCtyRUp2S0pvRWNTSmQ1ZXBxallKRU82?=
 =?utf-8?B?UHVoQ3lZNVVIZENtZTZRTnFVZWtjblVRMng2YWNSclJFSksvZUZvTzBabFNP?=
 =?utf-8?B?ODJObEJhc21xTmFjbVVrc2EzcmxOVWE3RlRHcVE5bC81RzJha2VTQ21ORzFI?=
 =?utf-8?B?Mm95RElpTG1wMGYyQXRtNHFtUmZ6NjFyQ2M5akdWSnVYV3FXbzZGRFdBQSt4?=
 =?utf-8?B?Z2cvMlFwZSthSjZNQllyb3p4SnZLZlRJWHJjdjdYdG80MkxFYjRCTUpYWCtG?=
 =?utf-8?B?VVYxTVl2ZFlJUitCY2JPd0Jzd2pkZnBZZ1dENkZnR2ZQVFJzeDl4ZmM4U3Fa?=
 =?utf-8?B?ZkUwd0Q0QVhlT0FiRUQ3ZjRGdTlBNUN1VTNGRTgxWWJQYlRmNU1QMWYvZERa?=
 =?utf-8?B?QmN4cjlNTEVIVDk3Snp2MTZqREcwQUJ1R2xQbFZzU0ZsM0ZGTkxZRnFvN3BI?=
 =?utf-8?B?UlpMRGlEVWVKa0RybjJFaTNsbnlWaVBpTnRvRU00Ri9JMCsvckdDSm0xTFBH?=
 =?utf-8?B?YTJ5S0doK0Q5QU5hWDlXeC9CaCtId2dxMGZTVGdoUU04djRBdUM1aFo1eitD?=
 =?utf-8?B?dnE3STF1QVBNVXVkd21NN1BySnA5S1NNOFRZbG01NG5hRUVKenk4VENOeUY2?=
 =?utf-8?B?TWwzbkdKbGh3d1pQNUZtdVZ3WVpWa2ZSVFYrd1l6Vk84MkNIZjBwNERyV2pV?=
 =?utf-8?B?aEVsZWVtSjN3WmdldEZsUDYzVFRSNThldkNoMmFLRkxMSFZ4amszOEczQWFX?=
 =?utf-8?B?L0EyNnNLcmVhdXFESklMYWVIMjd0RlE4OXF3eklQQ29DT3Z3OGZRby9hMEph?=
 =?utf-8?B?TnlObnVZaTdESVo1cXJqVDBYOTAza3gzTWtXMk0zSXVHeTFYMFY5UnFPMGZL?=
 =?utf-8?B?NHB3Rk9YTkNxN0hLZ04vbjJTK0xOSVB0c3doNUpqckZyU0FMVHlHY0gxeUov?=
 =?utf-8?B?azBiOUNHZ2tueDFQNnY0TXlUNkhTQ2FpaVFkRFd6VXdaOGlFQjNsQ2YxaG9M?=
 =?utf-8?B?TVJ1OFN4QThWUnc0R1lwVSt2cytCbVNGOFJKNUtIcW13aENJUm5hU1o3WjhT?=
 =?utf-8?Q?n0d89InkaA25vPKfzFPEZ9ckP?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 68766e09-9f5b-4889-5f31-08da5f2c105f
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jul 2022 08:46:48.5794
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QSiP3o0zw2hDORRlDT+zUlZexXM3YDtjvcCA7QSR2+4nabQ5+mDj8iZGioiNJQs6ifGvSGymee10rjwpRiP0nw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR04MB4296

On 06.07.2022 10:17, Julien Grall wrote:
> Hi Demi,
> 
> On 06/07/2022 09:05, Demi Marie Obenour wrote:
>> On Wed, Jul 06, 2022 at 08:53:49AM +0100, Julien Grall wrote:
>>> Hi Jan,
>>>
>>> On 06/07/2022 07:44, Jan Beulich wrote:
>>>> On 06.07.2022 05:39, osstest service owner wrote:
>>>>> flight 171511 xen-unstable-smoke real [real]
>>>>> flight 171517 xen-unstable-smoke real-retest [real]
>>>>> http://logs.test-lab.xenproject.org/osstest/logs/171511/
>>>>> http://logs.test-lab.xenproject.org/osstest/logs/171517/
>>>>>
>>>>> Regressions :-(
>>>>>
>>>>> Tests which did not succeed and are blocking,
>>>>> including tests which could not be run:
>>>>>    test-arm64-arm64-xl-xsm       8 xen-boot                 fail REGR. vs. 171486
>>>>
>>>> Looking at what's under test, I guess ...
>>>>
>>>>> commit 8d410ac2c178e1dd1001cadddbe9ca75a9738c95
>>>>> Author: Demi Marie Obenour <demi@invisiblethingslab.com>
>>>>> Date:   Tue Jul 5 13:10:46 2022 +0200
>>>>>
>>>>>       EFI: preserve the System Resource Table for dom0
>>>>>       The EFI System Resource Table (ESRT) is necessary for fwupd to identify
>>>>>       firmware updates to install.  According to the UEFI specification §23.4,
>>>>>       the ESRT shall be stored in memory of type EfiBootServicesData.  However,
>>>>>       memory of type EfiBootServicesData is considered general-purpose memory
>>>>>       by Xen, so the ESRT needs to be moved somewhere where Xen will not
>>>>>       overwrite it.  Copy the ESRT to memory of type EfiRuntimeServicesData,
>>>>>       which Xen will not reuse.  dom0 can use the ESRT if (and only if) it is
>>>>>       in memory of type EfiRuntimeServicesData.
>>>>>       Earlier versions of this patch reserved the memory in which the ESRT was
>>>>>       located.  This created awkward alignment problems, and required either
>>>>>       splitting the E820 table or wasting memory.  It also would have required
>>>>>       a new platform op for dom0 to use to indicate if the ESRT is reserved.
>>>>>       By copying the ESRT into EfiRuntimeServicesData memory, the E820 table
>>>>>       does not need to be modified, and dom0 can just check the type of the
>>>>>       memory region containing the ESRT.  The copy is only done if the ESRT is
>>>>>       not already in EfiRuntimeServicesData memory, avoiding memory leaks on
>>>>>       repeated kexec.
>>>>>       See https://lore.kernel.org/xen-devel/20200818184018.GN1679@mail-itl/T/
>>>>>       for details.
>>>>>       Signed-off-by: Demi Marie Obenour <demi@invisiblethingslab.com>
>>>>>       Reviewed-by: Jan Beulich <jbeulich@suse.com>
>>>>
>>>> ... this is the most likely candidate, considering in the log all we
>>>> see is:
>>>>
>>>> Xen 4.17-unstable (c/s Mon Jun 27 15:15:39 2022 +0200 git:61ff273322-dirty) EFI loader
>>>> Jul  5 23:09:15.692859 Using configuration file 'xen.cfg'
>>>> Jul  5 23:09:15.704878 vmlinuz: 0x00000083fb1ac000-0x00000083fc880a00
>>>> Jul  5 23:09:15.704931 initrd.gz: 0x00000083f94b7000-0x00000083fb1ab6e8
>>>> Jul  5 23:09:15.836836 xenpolicy: 0x00000083f94b4000-0x00000083f94b6a5f
>>>> Jul  5 23:09:15.980866 Using bootargs from Xen configuration file.
>>>>
>>>> But I guess we'll want to wait for the bi-sector to give us a more
>>>> solid indication ...
>>>
>>> I have tested a Xen with and without this patch this morning and can EFI. I
>>> haven't looked into details yet why.
>>>
>>> Can we consider to revert it?
>>
>> I'm fine with reverting it for now, but I would like to know what the
>> bug was.  Does a Xen with this patch boot okay on x86?
> 
> I haven't tried and I don't know whether we have UEFI system on x86.
> 
>>  If so, could it
>> be temporarily turned off on ARM until the problem can be tracked down?
> 
> I am not in favor of this approach. There are no reason for this to be 
> x86-only aside there is a bug in the code.

I agree - either we keep the patch in anticipation of a soon-ish fix,
or we revert it.

Jan

