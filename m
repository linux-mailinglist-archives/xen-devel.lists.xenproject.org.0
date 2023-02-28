Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6117C6A5D37
	for <lists+xen-devel@lfdr.de>; Tue, 28 Feb 2023 17:36:38 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.503556.775850 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pX2xc-00022p-IP; Tue, 28 Feb 2023 16:36:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 503556.775850; Tue, 28 Feb 2023 16:36:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pX2xc-00020K-Fd; Tue, 28 Feb 2023 16:36:16 +0000
Received: by outflank-mailman (input) for mailman id 503556;
 Tue, 28 Feb 2023 16:36:15 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=rjMb=6Y=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pX2xb-00020E-42
 for xen-devel@lists.xenproject.org; Tue, 28 Feb 2023 16:36:15 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04on0609.outbound.protection.outlook.com
 [2a01:111:f400:fe0c::609])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0343aebf-b786-11ed-a550-8520e6686977;
 Tue, 28 Feb 2023 17:36:13 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM8PR04MB7844.eurprd04.prod.outlook.com (2603:10a6:20b:236::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6134.30; Tue, 28 Feb
 2023 16:36:10 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b%7]) with mapi id 15.20.6134.030; Tue, 28 Feb 2023
 16:36:10 +0000
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
X-Inumbo-ID: 0343aebf-b786-11ed-a550-8520e6686977
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=grPMp6iRcIq4HvQkE+U20njA/7t5MokBG8v0YlcDBmhnkJX0hFJwjQkRdd/Pezmso77xQUVG9aLMaORrJ66/nN+xyivN1+YHLKMADHx46WTX04F05SZSpfmWxu+DfW48dtZxv8Cghn4EJ/iwgqi+Nn6u9+GJsuexmPgSftmiJuqjGB3YR+Jz3FL6Bsx/zFTdOF4g+LvNq7O8Of8m0WUd7aJ6eToIsXSZGpz7go5xbKS9sG3AYFLx1FWmqfwsUCEyXUIzJtozRLCDzb3G5VJFZVha9RUfnZWP9J6E+ZCZK0qhz2qiYEgOHwcXpFM3Z+9r5TUWoP4qRUX+DEgRHCrA9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ufMg31m+Q+V40XItPgiZFw9nmEaMZayuZQeNAbRETwg=;
 b=dpf2EB1k8HCyl62+66Ekr95Fhr9k4m/H3hQzgkcPVfMN5e7p3ee+Fuku1nZ+HOWuuv4RN1Gafikidh4YCPZkQfys7MD59Cwn+jNx1s0/6RLIGBrYOQIDaqJ98COgGJaJHRmn98BbxhC4bZWA6eDalysRhpybJKMunHVI/zdOJOFJZqE5jv7jLeaQHKKBmYUZ3HyaOrMFC86Vc10DJ5ixGL2LmmgkQw0BYVySwT3yJSn4Jw6+6JTzkHpkQ/XThfYnyd12sA8RS5pph0h9VyTbb05e8XHnsUzS1daNgiiRK2CctUY5Dsl6sxXys4XoAIn264zR8164t7qu55wbYBjgUA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ufMg31m+Q+V40XItPgiZFw9nmEaMZayuZQeNAbRETwg=;
 b=SUTZM20AUoKYuLXEUISIZ7IgXkk7peWG3Xj/BFrK32JNbkdtWWFUnbeHDtnOIhPoY5ND5oFr2S17my4LhCeujHCy/t9QxJFH19Ek+dggnYMcXB2qc6YWbGeGaku3vC31z+Uc4NUbCLCK/GXaO0DYCt2DjRxOsIEUAY9Q5CyqL9ieiJujkz31Yg+S2E8kHdfzmR+ppqjD1Z2lbQAEcGOGrOAJvrqpxlcdZfBZ5X6h+qrQqy93im1Lw/Kt17MoOs5uIIb61Pa2LH3c9rU+dUW+JEta5mXzPXE+YVP28j/9bGPAuK6cK/c+jFj3i4yxSPnX0LF2n/7pMR27pQiSaDkj8A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <89b27c44-5287-ab31-1fa2-46b9762da272@suse.com>
Date: Tue, 28 Feb 2023 17:36:08 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v3 4/4] xen/x86: switch x86 to use generic implemetation
 of bug.h
Content-Language: en-US
To: Oleksii <oleksii.kurochko@gmail.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Gianluca Guida <gianluca@rivosinc.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, xen-devel@lists.xenproject.org
References: <cover.1677233393.git.oleksii.kurochko@gmail.com>
 <38bb75b9add8655288347aa4df1394450e4e10c9.1677233393.git.oleksii.kurochko@gmail.com>
 <90ec98cc-e416-05c3-f507-5e4b2b7f937d@suse.com>
 <48e16f406cd85fea531c736f1f213038f8282613.camel@gmail.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <48e16f406cd85fea531c736f1f213038f8282613.camel@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0041.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:4a::17) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AM8PR04MB7844:EE_
X-MS-Office365-Filtering-Correlation-Id: 8e5a8276-7916-4fbf-7997-08db19a9e61f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	elhNgVkgkH6qNamoZ77LGQ79a57KBxGA3TUGFt0nPUGYaOjXYndw9TsLnphWEJXflIPoW85E9/enrK6oFwYJM+neTGg9RgoJ4/dHvzb1S5D8/jL3x8CjTlZs8R0bCfjOGNzHk10/TvtWKXztRmVVlRbscXgESt3AI4K0Q+u0DG6g1Gb3IEGjjuoHVSMAGSocxJT8P42wO9Yno+obTIW7Ft3zSkjcImQKuNrrZPkJ5X+2+DEYFIjyDZUUbF0cq4CbFF8I2vSi1w6G8uKFz0V8ItcxkmYchZn24eHAXl+IGsKt4Q+ADDDHhveFfNOZPbvNYRCL5d5J2nEAiqQmQGg/t2usUb9XgGvV2XQ1wStDZiFCCvfJTJLVBWoEnTnXJKiGAI/TXDZbtCM+csqW+TLosVEisssMLQHowlMkrOw3r8MJ75cMKwg95wj/PI8GHqTPLp0V7EDv1bj7Rhz7XE40I489lqoRoSIw2+Pyg8TEjbj3RVOiZllELkl5KzucSBZ6selglOPyn6avq4wK0hpa7YF7OsfZdkAdy95pZjm+guVaV4DnhqUT+9o3qVjLlMpa9eLY0o4C6THUyuaIhUpNG+AZfTkRku85Lj5vJehj1q+5Y2j5MsZDF7Vfkndv6B2iqvS1yzqoaR9SbeN9fGEKHPfR3va/RDYfQsNF3kiXK0wPJJMoKpAMySUlaCPokjDbXnP0JSh/URvvxl+NHmXgjUTLXTDko4/s6HupmKjj/AkGICeG4v4Q63OVDgee2Ged
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(366004)(136003)(376002)(346002)(396003)(39860400002)(451199018)(41300700001)(8936002)(31686004)(5660300002)(2906002)(66946007)(8676002)(66556008)(6916009)(66476007)(4326008)(54906003)(83380400001)(316002)(478600001)(6486002)(6506007)(36756003)(186003)(6512007)(53546011)(26005)(86362001)(38100700002)(2616005)(31696002)(41533002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dzBuM2E0WFBNN1h2L1hkQ3FZR1AwSmdMZXVVeGd6OUN4K1NId3B6N2V5bWhN?=
 =?utf-8?B?SytGYXExdmlRMVRUTHZ5V1c2a0FCcjV5VXFOTkFaOGl2Q21UcnpXcVE3Lys0?=
 =?utf-8?B?UTJsK1Z0cFhWSXh6VmRBRmRFSHVhbGhDMmVDVU16dU8rR1BSaDFSQ3orWjRs?=
 =?utf-8?B?UmVpbmpYVC84UHZZTFp2UjcrTytubEQ3aEZCd2h4NVgzVWluaElYL3JpZ3c2?=
 =?utf-8?B?U0F3VXdwTzkzdUNiUUVuN0gydTJBa1VIdW5oclF6YzlPLzFMYTlYS25SemJT?=
 =?utf-8?B?dkk4Y1BYdzl2YS83eWFGUjdNbmcybzM0QUFLYXdqMjJDeFB3aUZMZUIxZDhM?=
 =?utf-8?B?Ym1WcFRZM1RidjdtOHhKYTB3NWtnbzFPS215aVB2MU5aVC95YmFxdEIzdk5M?=
 =?utf-8?B?RWJRQjVDSmNKdlNCbHc1ZUxwbkR6QVcxQ0huOHZJS29IL3g0Y1UxNGVlWVd0?=
 =?utf-8?B?N1lpSkF5K0ZXZGFGREdxZjhpVWNCaUtGa3ZCVm5jcCtzK29PSERJd0RXVU4z?=
 =?utf-8?B?ckMvZWtuN1ByaC8yS0p3c0hUNS9PZWxGbEpnYTY5MUViYmZ0SURIK1ROR1Nl?=
 =?utf-8?B?TkdsOFo4RHIyWXJ6bU1wb1cxUzVZSmFWQjFkc1FoYWdkbStzVDYzMXJSYzNB?=
 =?utf-8?B?RnhWNm8rMTU0ZGRobXJ6Z2haUW9BdXo2RmVMY2FNZGhkV0F5RFIrWFZsL0tJ?=
 =?utf-8?B?dmtIaTRmdFU2TmM5OHFVOUhEcm5pUGRDVXVaQ2ZDcS9DQ2dsdnR1aEtMRy83?=
 =?utf-8?B?UDhJcldld0t6Y25Dem4zY0ZkczVPeWptUjhaNnNFWWZZWFQrYlROMFZWRWRj?=
 =?utf-8?B?aDJubUsxL1ZkM080N0RxRWhiVVdxUnltMEIyUW5jZ2FwTGFYaWgxRzhqaDRM?=
 =?utf-8?B?bFZhT3BQc2wyazVhemdRcHpsL0h0UFZTRUJlSm9wVE5qSkdoejU1eGxJQ0U4?=
 =?utf-8?B?UmRmazJleWlvTVIvREM5dDVheVI2R0VsRmoxd1pYWk1ad1FUcWhwWkNyUnpW?=
 =?utf-8?B?dzlkdlh5TU9QWklsaDhOYmhrM1RmU0VhNWVmYXE3aVdWejdyVmpWK0FYRGpa?=
 =?utf-8?B?QXEwb21oS0t3eXppTjdkNklRZG1KZmJGa1lQTk1yTS9FN2hPZUNWT0ViNjI3?=
 =?utf-8?B?QlE4dFBiVGZVSmNmb3lKelVoQVp1c0lCVU1qbWpFT3Q0WDRYc2Q0NHFDdmxZ?=
 =?utf-8?B?TlM5V0VaNTFpVDNydjI2WUpqd3BaY05xQWZ2MGVaNkZ0UjZRbnE4OERGWFVn?=
 =?utf-8?B?UTR5a1lvT3RLZERVVGdyMVA3RnlhWWZ4dDFDR1A3VVBiclhzMVdZenFQbzhB?=
 =?utf-8?B?eWxiN1NzeUFnS0szN3FNem85UGRmYXcvOVcvVE1MbWZrOERjMWlWaTEyQVR5?=
 =?utf-8?B?eU9aNGNQb1hETkhoQll5SUhCWlowN1V0a1VvVlBIVi9YSUtQRjY3eUVhR1d5?=
 =?utf-8?B?clFhcE56VVlEZXRkYlptTjN0ZDJKdDFsV3AvZkFYWEFyamNXY1VSZHBIYk84?=
 =?utf-8?B?TXh6Y05xSjdIVENwRnA1VWdoQk5iczNnekFFaXgyZkl5WGp6MWlWdnRuQzRM?=
 =?utf-8?B?VjhFclU4R0J6TUtjODBud1pBYXRZRjh3OEM5WEMzQWo0U1U4NXZya1lTdjRV?=
 =?utf-8?B?L1FTTldGTUNnOUg5SzU3elVwb1RPMTQ2ZkFKeDJqNCtqdXVwbHRMQlhUTEFM?=
 =?utf-8?B?VjNjYVZKZ2JwclNTQnRyTzJXTGoweFNxVXVUVGdTQlRCcThNdmw2dm16eTVn?=
 =?utf-8?B?aXRPTHJMckJ1L20raHdkOThqUXJuSlppZ0U2SHRpdkdUcFd5SDRCbENMZjVD?=
 =?utf-8?B?S1pBN3JpRVhRN0hwSDNnamRwNXJRRnEwSTRWNjh6Q3J0MmExV0hCV3hJelFC?=
 =?utf-8?B?TUp2Yis3cENzbmpyWFBsUlJiVjlMeEpzcHVjaEJZbC9rTzBoMGFLems1TUZ6?=
 =?utf-8?B?VmZTNDlpR0VBVFUyMzJDbGdObCt3bStVT2lOdis4MmVJYXBONm9odjhPay9w?=
 =?utf-8?B?SHcrZyswb0JqV25QenRaYm82NUd4VUYwaHdOU20xU3hWaUhteW8zYVB3NzNz?=
 =?utf-8?B?Nkc4YW9TZHlPaXdwWjZpRi80S2hralhQTmk2NmdPK3hBSFA3L3pxNERTS0ZE?=
 =?utf-8?Q?RtdRGzXHD4gs5vmrUI2kYEEjh?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8e5a8276-7916-4fbf-7997-08db19a9e61f
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Feb 2023 16:36:10.5609
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uZI7XnIHfPyXrAQCVl9AfhziCGxsv5itBr5I7wnnhuvUtPaiOU5jzTiht8HvjDcVktPRvVUnD4aQbJ+R237EfQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR04MB7844

On 28.02.2023 17:28, Oleksii wrote:
> On Mon, 2023-02-27 at 15:46 +0100, Jan Beulich wrote:
>> On 24.02.2023 12:31, Oleksii Kurochko wrote:
>>> --- a/xen/arch/x86/include/asm/debugger.h
>>> +++ b/xen/arch/x86/include/asm/debugger.h
>>> @@ -14,9 +14,9 @@
>>>  
>>>  /* Returns true if GDB handled the trap, or it is surviveable. */
>>>  static inline bool debugger_trap_fatal(
>>> -    unsigned int vector, struct cpu_user_regs *regs)
>>> +    unsigned int vector, const struct cpu_user_regs *regs)
>>>  {
>>> -    int rc = __trap_to_gdb(regs, vector);
>>> +    int rc = __trap_to_gdb((struct cpu_user_regs *)regs, vector);
>>
>> I view casts in general as risky and hence preferable to avoid.
>> Casting
>> away const-ness is particularly problematic. I guess the least bad
>> option is to drop const from the do_bug_frame()'s parameter again in
>> patch 1. However, for a fatal trap (assuming that really _is_ fatal,
>> i.e. execution cannot continue), not allowing register state to be
>> altered makes kind of sense. So I wonder whether we couldn't push the
>> casting into the gdbstub functions. But quite likely that's going to
>> be too intrusive for re-work like you do here.
> I am not sure that casting inside the gdbstub functions will help as
> do_bug_frame() calls debugger_trap_fatal() which has define regs 
> without const. So it will still be compile issue as in do_bug_frame()
> regs are declared as const.

Well, the idea was of course to propagate const further down, to cast
it away only in restricted cases. But ...

> So it looks like the best one issue now will be drop const from the
> do_bug_frame()...

... looks like we're in agreement then about this being the better
route for the time being.

Jan

