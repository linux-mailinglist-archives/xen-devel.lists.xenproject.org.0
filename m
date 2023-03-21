Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 861F96C32FC
	for <lists+xen-devel@lfdr.de>; Tue, 21 Mar 2023 14:35:17 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.512638.792671 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pec8p-0005zb-Py; Tue, 21 Mar 2023 13:35:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 512638.792671; Tue, 21 Mar 2023 13:35:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pec8p-0005wc-Ms; Tue, 21 Mar 2023 13:35:07 +0000
Received: by outflank-mailman (input) for mailman id 512638;
 Tue, 21 Mar 2023 13:35:05 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=NAJ/=7N=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pec8n-0005wU-HT
 for xen-devel@lists.xenproject.org; Tue, 21 Mar 2023 13:35:05 +0000
Received: from EUR03-AM7-obe.outbound.protection.outlook.com
 (mail-am7eur03on20605.outbound.protection.outlook.com
 [2a01:111:f400:7eaf::605])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2fbb048b-c7ed-11ed-87f5-c1b5be75604c;
 Tue, 21 Mar 2023 14:35:04 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by PAXPR04MB8288.eurprd04.prod.outlook.com (2603:10a6:102:1bc::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.37; Tue, 21 Mar
 2023 13:35:02 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b%5]) with mapi id 15.20.6178.037; Tue, 21 Mar 2023
 13:35:02 +0000
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
X-Inumbo-ID: 2fbb048b-c7ed-11ed-87f5-c1b5be75604c
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=I1SgaVQDw5dDwTtO9j6n4YOTWP3bavNLnSzM0ETj8HiO7wmWOIUFPP1hyyZ6TsBVs55P1oo0FQv/NefDvr79IZ1EmPHc9Y9vS0GFJeBxt5kWV/kje/yVU8If7MuP1SSRrzqsac9b+hxEDpXFiKi67QuY7spGhmy6f26NVb40YkhBviCclZgEPIuS75rek7Er5Ytb9G+2ij/1wKk7x7SBPE+Djo03P9GPUYQndH+Txtu3q5hsXgEe8X4BehWOS/pmJ0h5iato1EEGyBbkWUrgqLtfFyN1OCEai8fCnUTF25/4RBDbBLVTO3dUnJtaOpuisvJUzDPNbrwKPYMaknAl8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Y1Sddv7mPOy04AljTxgKHzjxeYzcYqbtbN+CLQsf2Ig=;
 b=KzgAW9GUygLG7X5DmwbMF6jR2AAIOtkGQ3qiJz1GiIJwH4yJavGL6QY99e5w2/Wl89GmUNsAMYBq8nkoFkYh25OY1/ZbccIeU5z0cNreM3VssdjMYptS2v8GTsCwk6O/tgegWbkJerVb8J8Ih08jf0jm4kPb5ZizP659j8f/SDvdGcUHziM2iyTPhSIqkW16RafoeR4td1N+lFdvvB1VSBj9Vo4aUfbG48AHSVEg+uOzW/HiFTLZRrpV7dcy9HVwvmK9VowVSVnVkvDxxKz/8KM7J1WixYtSY8n5s6YEk5fNJLoi0U8eaFZSP2vhPM5GF6HSRZAXgMnYqSUEzSVbQg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Y1Sddv7mPOy04AljTxgKHzjxeYzcYqbtbN+CLQsf2Ig=;
 b=dKymkrIQirQMNHQoIyqMYlu8PS5QuNWKTB39a2Jv23RXTMb2yQaLdrQV9hBxVq6bX2iPuG/zmw4NzODNyil63M6ejhBVMIWEHd7HrfjUVVNEaK31+nw4n/M5LUl1hSyiI0hSMswijsgaCN5kc/QtNCL14WKzqofzEvfcIDyoTJEicnB5skNZHdWQ22/3s/QSQuuMV48SRrp3xnQYnk6k0g3hAqvzSjxbydGrAScUc81s76nSqRtJhRVD5WLBhs5GMUJFDjUAzuiVFGhN49Pi+TDdIrW7pVuoY/G2RQf9bIL3FA4M0yCbzC51rwGDbf5TR0rnzjAK9lFfuCXgQb1piQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <7ebd7064-8ebd-a072-fc2e-2629cc99f7eb@suse.com>
Date: Tue, 21 Mar 2023 14:35:00 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v8 1/5] xen: introduce CONFIG_GENERIC_BUG_FRAME
Content-Language: en-US
To: Oleksii <oleksii.kurochko@gmail.com>
Cc: Julien Grall <julien@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Gianluca Guida <gianluca@rivosinc.com>,
 George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <cover.1678900513.git.oleksii.kurochko@gmail.com>
 <2afad972cd8da98dcb0ba509ba29ff239dc47cd0.1678900513.git.oleksii.kurochko@gmail.com>
 <3bc211fa-a8f7-70ce-bfa9-5e4380776070@suse.com>
 <99354bbeabf11e86cbf3fd46019c08fb36bf0098.camel@gmail.com>
 <6af7a3ea-f454-7027-590d-f883e6c2a523@suse.com>
 <02a815ffe1d3839f6f82ab4d16ec8d124642617d.camel@gmail.com>
 <390dd04d369fad707fd786ed37992ec27a63b7cf.camel@gmail.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <390dd04d369fad707fd786ed37992ec27a63b7cf.camel@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0172.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a0::10) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|PAXPR04MB8288:EE_
X-MS-Office365-Filtering-Correlation-Id: 104dd74d-b51b-47cb-d98b-08db2a11130b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	oMGKGz92x0c4B2AuZMngdFLUeWE2nQJeiggax1P7AH1JQ3JOcPcSNKdi/Xg1mtTQdcy4MMt+G2wqUbcrqfv/kkzjG+f+CoQgiO2HHUa9THlsJi2vVTp9MM9MlyPjF9QTPnzsg1oXwh1u6frvvJhiX564tilKsX7z3yvCINafRQx8yl1JPQLgcRe7foJ0IXju2PQo8b81AzaejWC92zq3Ot7edtXg/mvXOVymJQQ453uZhJe91pW2DMuZSjtIltJt2t0C/xdm0aZUl/ni7WCav91dJYoy5X/Sh2G4bG0snZ87cXXNYjUGl+5xy09MupaJpMpgXW0FVn6i9oKC26DDtBl1PrxCY58HxS1Bw83vF+Fj4z2ivxXjeprvKsMwf5ynQYXXLBoh88t60nv5yFlHGx5K6i2mNFLojJAmR7bHtpBf3/BUZ0gyAtym30fuHra/rtkdYASN5lyz9qUvMDsTkCSKMaQmD2tt39UpovQg7hgt82NuKrvatZCmWaWhYwzMfCUKeLB0sc/HeRZHRr5GnHvq1rQOkMR39xdMz7gpsqvPnrZSIb0R+1tNhsxpykE92xsyMlXuRRjE8vunUUFLu7/DHU0QKLHz0VVOdKCuK0O9WiCgq1yV0wXCmgcaxMWjSVfIL7GmNEA/WSxA84Ox3wmmWdou6xIhBT/jDeDzVaFm4LHfCp9Xx+rTHWC+5PkhoBfmsUs6Ufx51ZqJX7l+NjLf7s9OIorBuTMB/Sd7N4j2WcePBNlQSyiSmxusWEob
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(346002)(396003)(39860400002)(376002)(366004)(136003)(451199018)(2616005)(186003)(6486002)(4326008)(478600001)(53546011)(66476007)(316002)(6916009)(8676002)(66946007)(66556008)(31686004)(6512007)(6506007)(26005)(54906003)(41300700001)(8936002)(5660300002)(38100700002)(2906002)(86362001)(36756003)(31696002)(41533002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UDRDOU5LazFSdFpVTDIyU0s2bFpoZG5SUTZYcG1VWUNaQSszcjFJNlBSOGRW?=
 =?utf-8?B?cE8wd1ZLMDJld0FodUZmZWhwQlR5ZTFra1dJQkt3dmZ5Smp3QWp6cWFxbGsy?=
 =?utf-8?B?QXovY3dPVlpFcmRzSk5iazJMZmVHSWdRVTNxZjJLNkhWcEhocTliSEJ1ZExa?=
 =?utf-8?B?NFhzZU9HelZidnNkekh6bFlNOVNyMWFGanlFSjZmMXUzcHdMN2llZVE1S0Iy?=
 =?utf-8?B?cnpram81aGRWOVQ3L3J3bTdGR3IrOUZWSytrQTBia1VmbkFyaE03TXJycVVV?=
 =?utf-8?B?R0l0REhHOFNEckY2Y1kvZ1hwV1hIUHlPekkvaXlLSDkxR1d1Wjh3MDY0UVhs?=
 =?utf-8?B?THJ5cDBFT0tablJTTHEwRDQ5YTlRb2tucWw3REtNS3RMcTN6clVkSElPQ3BW?=
 =?utf-8?B?aVZ4UVlEQ2VpVGVvZnRlNDUyT2hkNS9zVHA4TjZxZTV4enoxRW9RUG43SWNi?=
 =?utf-8?B?dy9uNDE3eVc4UEoxMDhKMGFIc0pPYU0xcHVzOGJ3Z3UrQytYRDJ3RHZtM1NB?=
 =?utf-8?B?c2VFNS9udFZXK0hhMllueHNKTWJ4ZmUyVzFJTFZzc0RMUTdiTHBnczUrRDFU?=
 =?utf-8?B?M2VMT2dxUEFNa2FzZEQ0ZUloOVozTERKMkFsT2dWb0RFbklXYmxuVXhHMEln?=
 =?utf-8?B?NUJIVXF3SGs5WkE4MnBMZlpza1JXM1d6K3lXZ0NvVjQwRmcxM3F1MXk0OWRh?=
 =?utf-8?B?WUhMVmptVFhNNi92UWcvc0RzMjlvcFFNNVdqS0hJZ04yNEFON3JrTWZsUThB?=
 =?utf-8?B?T0RGbUJyZm5yTXhCL1RwWVpVRHBLaStVcGFHYlBsQ2tSeWJEdkNMNytCRFN4?=
 =?utf-8?B?NHgxaXRmTGlyMHdDNVhIUlVSMlJWTFVNcy9KZHBPTzBCZnhQak9EOEpXSGFT?=
 =?utf-8?B?VklLemlCOXlPTm5OWnZhSnRpWlpQZUtERHAvZDlUTXVHUmxmSnoyaDJOaXNv?=
 =?utf-8?B?T1V3dnJ2NjZqK1NVNVhSSGhBa2ROSkxzS3dDYnhLSW9UTWNZR09ZMjRjdmFw?=
 =?utf-8?B?T0ZqV3VVaFQ0MGwvOERWei9INVNiTC9DY3RqS24vOEMzZFFUMk5DZkRnUk05?=
 =?utf-8?B?RW5VeHl1NzBMckZyTXFja1BHcVJ6cXdDSmdseHpJTkFSR3AzUjU0dkMrWVNk?=
 =?utf-8?B?MzVNZTQyNEJDTFUzQzZKUkJWZU5ESGkzYVJTeHMxa2FMb3FmVElRL0g1UnpY?=
 =?utf-8?B?VHRDTXRzTkREODRHUk1wSjBObW90b2FveHZxQlZzL25UWUVXNWM5U2hMYm10?=
 =?utf-8?B?T0VqV1hVeWVicWhqT0RXSjRjdnlsYnBEY2dGZDhOQTlRNllwZll0eUF1RnZj?=
 =?utf-8?B?SjNILzlsNmhPNTlGdTFnb21ZMGk5b05LNnQ0TXM1TU00M1ZqSllGL2VSaXZm?=
 =?utf-8?B?RE8wNUdpcm5ub3c2SEdRRW5Rb3puaS8xc2R2Zi9SN0VaWWZvc2p4emxDTzIw?=
 =?utf-8?B?QmFaeGVMQmdBc2JMS0xPd0loZXIxUU5PN2VMM2RWR3B1RllhYjlrSVNvVTNj?=
 =?utf-8?B?ZW9tUHo3Q0hkY2lKbHJOVFhVcG8zZzh3ZXN6bjRUUDNTV2VGWTJJY29QT0ky?=
 =?utf-8?B?c3pCS0tvMU0vWVlZWUNGdS9taCsyNHFRb2VPRnBvc3hQWHBLYXg2WjRKQnpL?=
 =?utf-8?B?bFhsejF1bzhWVUt4RmpRTFZSVlN5ZGpYeWRFaWVTWEVNcVRjNW4rVFQ2bWcz?=
 =?utf-8?B?VGRPTGRyUWsxZzM2YkUwKzBxWnlJYllwVS9xaDJ3dnNYZjZ2Vjlta3RnVmFo?=
 =?utf-8?B?OGZjenV1OC9uRDlRemVBMlpsUHlBTzRTYXE1Z0lZMEFmTmpZajBNanR1R2dQ?=
 =?utf-8?B?TDlxdmxmc0dHZlllMk9WekNKNENXbmhQQ3B2dHArNnJhQnRXcmN1cUlhTGVD?=
 =?utf-8?B?ZEFuNFZLZ3pRRVZEWXg0UVpkNW0xU3k3cDA3QkQ4bys2STV4MkJrMnpXQzlv?=
 =?utf-8?B?aVNYbHpMallsVmwxWXBQa2Q1b3ZVcGZHSmtyL3RDODdDOVBrbUt5Q2QyVm5y?=
 =?utf-8?B?emIzYU1oMlJlaGNNT25RUTFESE1nakUza3F1WDA0S0I1TFk3L0xIOHVscGJm?=
 =?utf-8?B?SVFORkZPN1phTmoxU2NTNkYrVlRXdlFiV2lRODNUdzZQWTZMY21USHdRUVBS?=
 =?utf-8?Q?nmo8Su9t4d+9TQXnH5Fpz9UBg?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 104dd74d-b51b-47cb-d98b-08db2a11130b
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Mar 2023 13:35:02.6973
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AVdWgO4Ipowyhk4JSK7Pm9lMHWF7RosyRWKPWs7gEF+tAaI7W0B4OEit1A53HVhBmD3AWwNFFOfSJyak5EEuzg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8288

On 21.03.2023 12:18, Oleksii wrote:
> On Mon, 2023-03-20 at 13:36 +0200, Oleksii wrote:
>> On Fri, 2023-03-17 at 15:59 +0100, Jan Beulich wrote:
>>> On 17.03.2023 10:23, Oleksii wrote:
>>>> On Thu, 2023-03-16 at 12:26 +0100, Jan Beulich wrote:
>>>>> On 15.03.2023 18:21, Oleksii Kurochko wrote:
>>>>>> --- /dev/null
>>>>>> +++ b/xen/common/bug.c
>>>>>> @@ -0,0 +1,108 @@
>>>>>> +#include <xen/bug.h>
>>>>>> +#include <xen/debugger.h>
>>>>>> +#include <xen/errno.h>
>>>>>> +#include <xen/kernel.h>
>>>>>> +#include <xen/livepatch.h>
>>>>>> +#include <xen/string.h>
>>>>>> +#include <xen/types.h>
>>>>>> +#include <xen/virtual_region.h>
>>>>>> +
>>>>>> +#include <asm/processor.h>
>>>>>
>>>>> I actually meant to also ask: What is this needed for? Glancing
>>>>> over
>>>>> the
>>>>> code ...
>>>>>
>>>>>> +/*
>>>>>> + * Returns a negative value in case of an error otherwise
>>>>>> + * BUGFRAME_{run_fn, warn, bug, assert}
>>>>>> + */
>>>>>> +int do_bug_frame(struct cpu_user_regs *regs, unsigned long
>>>>>> pc)
>>>>>> +{
>>>>>> +    const struct bug_frame *bug = NULL;
>>>>>> +    const struct virtual_region *region;
>>>>>> +    const char *prefix = "", *filename, *predicate;
>>>>>> +    unsigned long fixup;
>>>>>> +    unsigned int id, lineno;
>>>>>> +
>>>>>> +    region = find_text_region(pc);
>>>>>> +    if ( !region )
>>>>>> +        return -EINVAL;
>>>>>> +
>>>>>> +    for ( id = 0; id < BUGFRAME_NR; id++ )
>>>>>> +    {
>>>>>> +        const struct bug_frame *b;
>>>>>> +        size_t i;
>>>>>> +
>>>>>> +        for ( i = 0, b = region->frame[id].bugs;
>>>>>> +              i < region->frame[id].n_bugs; b++, i++ )
>>>>>> +        {
>>>>>> +            if ( bug_loc(b) == pc )
>>>>>> +            {
>>>>>> +                bug = b;
>>>>>> +                goto found;
>>>>>> +            }
>>>>>> +        }
>>>>>> +    }
>>>>>> +
>>>>>> + found:
>>>>>> +    if ( !bug )
>>>>>> +        return -ENOENT;
>>>>>> +
>>>>>> +    if ( id == BUGFRAME_run_fn )
>>>>>> +    {
>>>>>> +        void (*fn)(struct cpu_user_regs *) = bug_ptr(bug);
>>>>>> +
>>>>>> +        fn(regs);
>>>>>> +
>>>>>> +        /* Re-enforce consistent types, because of the casts
>>>>>> involved. */
>>>>>> +        if ( false )
>>>>>> +            run_in_exception_handler(fn);
>>>>>> +
>>>>>> +        return id;
>>>>>> +    }
>>>>>> +
>>>>>> +    /* WARN, BUG or ASSERT: decode the filename pointer and
>>>>>> line
>>>>>> number. */
>>>>>> +    filename = bug_ptr(bug);
>>>>>> +    if ( !is_kernel(filename) && !is_patch(filename) )
>>>>>> +        return -EINVAL;
>>>>>> +    fixup = strlen(filename);
>>>>>> +    if ( fixup > 50 )
>>>>>> +    {
>>>>>> +        filename += fixup - 47;
>>>>>> +        prefix = "...";
>>>>>> +    }
>>>>>> +    lineno = bug_line(bug);
>>>>>> +
>>>>>> +    switch ( id )
>>>>>> +    {
>>>>>> +    case BUGFRAME_warn:
>>>>>> +        printk("Xen WARN at %s%s:%d\n", prefix, filename,
>>>>>> lineno);
>>>>>> +        show_execution_state(regs);
>>>>>> +
>>>>>> +        break;
>>>>>> +
>>>>>> +    case BUGFRAME_bug:
>>>>>> +        printk("Xen BUG at %s%s:%d\n", prefix, filename,
>>>>>> lineno);
>>>>>> +
>>>>>> +        if ( BUG_DEBUGGER_TRAP_FATAL(regs) )
>>>>>> +            break;
>>>>>> +
>>>>>> +        show_execution_state(regs);
>>>>>> +        panic("Xen BUG at %s%s:%d\n", prefix, filename,
>>>>>> lineno);
>>>>>> +
>>>>>> +    case BUGFRAME_assert:
>>>>>> +        /* ASSERT: decode the predicate string pointer. */
>>>>>> +        predicate = bug_msg(bug);
>>>>>> +        if ( !is_kernel(predicate) && !is_patch(predicate) )
>>>>>> +            predicate = "<unknown>";
>>>>>> +
>>>>>> +        printk("Assertion '%s' failed at %s%s:%d\n",
>>>>>> +               predicate, prefix, filename, lineno);
>>>>>> +
>>>>>> +        if ( BUG_DEBUGGER_TRAP_FATAL(regs) )
>>>>>> +            break;
>>>>>> +
>>>>>> +        show_execution_state(regs);
>>>>>> +        panic("Assertion '%s' failed at %s%s:%d\n",
>>>>>> +              predicate, prefix, filename, lineno);
>>>>>> +    }
>>>>>> +
>>>>>> +    return id;
>>>>>> +}
>>>>>
>>>>> ... I can't really spot what it might be that comes from that
>>>>> header.
>>>>> Oh, on the N+1st run I've spotted it - it's
>>>>> show_execution_state().
>>>>> The declaration of which, already being used from common code
>>>>> ahead
>>>>> of this series, should imo be moved to a common header. I guess
>>>>> I'll
>>>>> make yet another patch ...
>>>> As mentioned above. Not only show_execution_state() but also
>>>> cpu_user_regs structure. ( at lest, for ARM & RISCV )
>>>
>>> Do we deref "regs" anywhere? I can't seem to be able to spot an
>>> instance.
>>> Without a deref (or alike) a forward decl is all that's needed for
>>> this
>>> code to compile.
>> You are there is no a deref so let's swich to a forward decl.
>>
>> I'll add it to a new version of the patch series.
> I just realized that show_execution_state() is declared in
> <asm/processor.h>.

Not anymore with "move {,vcpu_}show_execution_state() declarations
to common header", which was specifically made ...

> So we have to leave an inclusion of the header or declare the function
> explicitly.

... to eliminate this dependency, but which sadly is still pending an
Arm side ack.

Jan

