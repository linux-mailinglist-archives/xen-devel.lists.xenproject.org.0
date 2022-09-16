Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E7C0D5BA8D1
	for <lists+xen-devel@lfdr.de>; Fri, 16 Sep 2022 11:00:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.407870.650523 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oZ7CU-0007gc-QT; Fri, 16 Sep 2022 08:59:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 407870.650523; Fri, 16 Sep 2022 08:59:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oZ7CU-0007du-Nk; Fri, 16 Sep 2022 08:59:54 +0000
Received: by outflank-mailman (input) for mailman id 407870;
 Fri, 16 Sep 2022 08:59:53 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=zCzl=ZT=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1oZ7CT-0007do-IG
 for xen-devel@lists.xenproject.org; Fri, 16 Sep 2022 08:59:53 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2089.outbound.protection.outlook.com [40.107.20.89])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ecc60b9d-359d-11ed-a31c-8f8a9ae3403f;
 Fri, 16 Sep 2022 10:59:52 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DB8PR04MB7034.eurprd04.prod.outlook.com (2603:10a6:10:128::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5632.16; Fri, 16 Sep
 2022 08:59:49 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::59bc:901a:98a7:76d4]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::59bc:901a:98a7:76d4%5]) with mapi id 15.20.5632.016; Fri, 16 Sep 2022
 08:59:49 +0000
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
X-Inumbo-ID: ecc60b9d-359d-11ed-a31c-8f8a9ae3403f
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UDx5LZ9AirpOeCX2Om55/FQD55WBNYmuIPkD+jLCPmCfreMFR7rVL9MbHy3cW6i08NhIeWqCqP21cxy/6guQ0XH9QmASaCEnNe8PS58FVlLWRP6NqG7DqXch8oQZm073kZ3hF9386obwzXrdzZWlXZB+OlIzL27TuDKMARHRu43aimssVcRr7e+kruFNW8oW90OnLZU+YC6FgdmQAjkuQCSn39CwVK85P8WYL/Q5556KHhdA5rFjn9steyuD9YbWHDMnlDAv8HEeikRw635RyM+nXe3jBxk65TEFy+oOSe0dIuPakNvIo4yTAmYo9S6uix8o+nfnd3UEaHEmUH+9Qg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rY/6OmsKQbsi3UUQuOxOs7Xe6uWtQ1Xlr23tnbdD/8U=;
 b=GfztoJ75w8hkka6geGPqw4Fg1reaLqdVNix/cLtxvaiWeIBtv8ZKkQqgkvUeTB6K1FAKbh2dVp0jE/AQ9A9JmZVJsoDSQyDYlbgilhh43NWDYe8ccg9AoJlfvlTz9p3D+i9kdmDvtO0934O53E0ZMEmj7t1I3xVxznW2vvQjUA7Jy9FPgLZVYIo7CLR5P61yepYv7jBTjRuB1nvPJVEeRTz5irbjUMRuGkIfEU0zWHzSmZYLdOyNpwG9NjZGiiPGAL5xntpqWnD6lRNzAW3Szx7WSMxnM+0ySWr96k5T1t3BEDOPKc4DQgWyf5VMRdLo7YgeJxXHXrz5riY6qXmWFA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rY/6OmsKQbsi3UUQuOxOs7Xe6uWtQ1Xlr23tnbdD/8U=;
 b=urbDQaxCKtitwEx+zZXhDi4dvLZxsPkaAJou7fDFE0xzc6tDvFtdhe9xC683Zp2gmZvSAap0023FAHs3xXZgXPsJy+M6il/XY/NsUHxRpcRowUPe155MyXMQw1TPuv1D3Y1Xq4BfcO90o575xOAJqh3nH1YIEH0g48uferHaMpqJT6bGdBW7wfDp2UUcrB3eVEiBoFRMPYR6sChlh0WQ1kHxP2X3m5IadlUglUPFAtbxqM/qUHLxDGt4bB6GYorws2gyub1xEPT1OwrZU8FXxe7AEsoyrGTvxp/qRVrLZP2kGQGLok5jaeJICJxCzwb4JKtucSkwfAaGs28LKjzNXQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <c20a5d41-42fa-baa9-342c-f2ca5b2dfddb@suse.com>
Date: Fri, 16 Sep 2022 10:59:47 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [for-4.17] xen/arm: domain_build: Do not use dprintk
 unconditionally
Content-Language: en-US
To: Michal Orzel <michal.orzel@amd.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Julien Grall
 <julien@xen.org>, xen-devel@lists.xenproject.org
References: <20220916071920.8287-1-michal.orzel@amd.com>
 <4f4e254a-6b54-cdf7-40bc-89c25172bebf@xen.org>
 <f6588270-5cfa-7a46-f857-1fb78dfdffea@amd.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <f6588270-5cfa-7a46-f857-1fb78dfdffea@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0131.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:97::16) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|DB8PR04MB7034:EE_
X-MS-Office365-Filtering-Correlation-Id: 5e84f1d5-dd69-4a0d-a702-08da97c1cf72
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	JYhpKIEE4MFkppJU3cziiGTr0EkE038CGH3s2maV+t2UGhpqXaM+2I1m2P06DGkXOZctIrR5gLGvRTwQsMya8aRdY4y8j2WTJWqV8P5YJHh2tD+8gsStxzHNC4CCAPfQipLwd1Z28Gc/lbiOyOejHvAS1Gn4TalMXI8rHhp05EujuepjiWcrscHQf4jV1uyR4i3CGkt5NTt6XW2oXrAZlwF9bLDSKZJWrNhFzn7EO6nzXiYK27soi4PN2N1L2ejSMLCsNhrjs7eUCjmjFvRNrhqgHwLXvZd+sFxQg71sULNYMQYPKooLdJll5/8Z3C1Dx9NKh5M4liEt1oddT66KKXP5J9kkZ/tglioYItMnoT3jyB+FNZZMX0zBb6nX671NKe9MKBiMoPKXFCV4tRqQq2n5vrjsnOuVBhWuSdA/4R7J80rIqs4qJcPdkI1D6dRXaa5ympI17S0xZXYJbuNj/fbc6wDOV0lKkcxaIBLVRJX3uqJ4UsHlmDQE6UvAouOsp715nPr8r0ZQ3lvGhi9ge2JcT0CmErqETz5RP05KElwdXoQkBgceqFl//JnSD6+FtIMJu10CYkGTyd04CwwYN6nYhEHsx3I+pQ5mz/OzWCon4y6CnvC/g9Kqt4hT6WdjRY54YRJsLP/9/CV7mkH5n3k8/ToRNCpqFlP5tHKKnB3DpuB4Tz68SmafciMcqWhRRo0ot1r0+oMA+gmAC4XWJOIuFawh27Is07UqBnYzsIYG3v/oC9Pbivxhpt9QdljJiANR7kqsali4uGEosrAoK0W8KxlMsApok+pDNedpAxA=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(136003)(366004)(39860400002)(346002)(396003)(376002)(451199015)(186003)(8936002)(2616005)(66476007)(66556008)(66946007)(8676002)(36756003)(4326008)(6916009)(316002)(54906003)(86362001)(5660300002)(38100700002)(31696002)(2906002)(83380400001)(6506007)(478600001)(6512007)(53546011)(6486002)(26005)(41300700001)(31686004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NHpaOW1XQkhZMVJNTHpxa2JsV1dlNDM4YXR6RkM0NzNXSTE2R3pEMm96Ri9r?=
 =?utf-8?B?TU1wK0xZTlB3Z1ZDNC9Dbm4zeWZIcUo1RTdWVXZqVEM5bTNDejcwektpQmk3?=
 =?utf-8?B?b1dLcHJXbXdVU0NpZDNxVUpOd1RkRUxQSk1xU3VIR3hyQWE0eVY3L1BDTTZV?=
 =?utf-8?B?UzUrN2lVT25reDVHZGhTS1RhU3JuZWJiYzVBM2FoVjlCcGJCVE5YMDNyRHFQ?=
 =?utf-8?B?aUNFOHJHWS9pcUJLdmRYU3BGWVJ1YTZaZmF6M2xtbUV4a1dnc1MrMjNtWDZX?=
 =?utf-8?B?OGcrYm1pSTZoaGVrbzhCeXhBbmE1S3FwWUphQ1NIT0dxUWg4Z1FXbVdWMXdL?=
 =?utf-8?B?amdCTitDTS8ySVgyZ25oa1Z4cENrQTRhbW5jTGJPdTNBSlMzaWpUQzc2Sk5N?=
 =?utf-8?B?TElzRncxWmRZaDlKWDVnR25xckd5NDEyUUpnY2x2dUxvRVJETzZyaVd5QVdY?=
 =?utf-8?B?YTljekorZmRkV3Z3aWwyclBHb2wzMnRWdVJOZW8yZWNwaFRrSjRQL1c4YzRI?=
 =?utf-8?B?ZVZ5ZzhyNFhVSTl1em55Y0JlcFFBZXVoeXliaUt0QkRtQ09kaDc4Vmp4RmFT?=
 =?utf-8?B?NWpBTHNTUUZRdnQ0OHFudjdJSnpVZitPSUpXdFpJaW5nSWo1YjFSVm43QlJx?=
 =?utf-8?B?NDFtNHBJUjBDQlJYNXhzWVZ5c2xzSzVsUStsbDZvK2ZJTHd2Q0RRZ3NFai9X?=
 =?utf-8?B?aUNqdlkyeDRkeU1DMzM5VTh6SnRBNnJJVDBnSWEzM3pacDZCQm9xOVdINld0?=
 =?utf-8?B?aml5allTOTBKbitmeDJzM2NFNU9UdkJ4SGxNWGRqOE4wNXUvaU0yWlpLVVU2?=
 =?utf-8?B?djNNTUhtVU91UnRqRjI0SXRFTmxJLzE4MUdlYlhvMjRDUnFCTTdCTWkyKzVy?=
 =?utf-8?B?VFJpUUVEdENmZDlnYm9BUU1Oc3hjL3pNR1pRb0EvenczVUxubXIzM1p4OU0x?=
 =?utf-8?B?Vk4xWDRkdDNOaHFaR1VBazV2RzVHTkxVVWh0LzJTUnV4OTRPVmtLck1ueGh6?=
 =?utf-8?B?elQ0OFVZNjl0TVhPUUdXUWhzRG43VWhsU1JpMktURmxBcHlFOWJqbUlGRGI2?=
 =?utf-8?B?WnUyOHhuZERtS09ia0JJTjJDVFFuWG1TSHJnTS85Z3djdlU3Wkh2UGxvcUdF?=
 =?utf-8?B?NnN4VVVXV1BuZnpRR1ZXbXJDZTZMbTJiWXZSdHlmNWhOTkZHdDA2NVdRVUd5?=
 =?utf-8?B?bjFweC9hY3N5aytuQWFsVzBLcTRobmVCVFZESHhKSDloMmhoRDVsYmFmWE95?=
 =?utf-8?B?bkEyRTFKckFVZ2ZtZUs1M2lLQnF1ajd6VlJBQjkyM0RIQkpUZmk3cnJJKzk4?=
 =?utf-8?B?Z29aL2tTTTZYVHQ4UGZMOGNuNkE3bHNqZVd3UDNORVhLWTVoSkVVR2JxaUJo?=
 =?utf-8?B?QlExckhGMGxFeTRzZkNobm9PTmpOMFg2b0tjbW9VUUhUUXlXSUwyNHF6UWIr?=
 =?utf-8?B?ajN0WDhVRCtQV09wb3k1b2wrYm9weGhTYnV4MEpvRy9SbS9Ea3laVFpYNk9v?=
 =?utf-8?B?SUJZQW1WQ00rRWFWdEZiZ05kbmt4N3JvYkphK3B1UTUvNDcrckp5UGpydDlF?=
 =?utf-8?B?TzhqQjc3c0JEVUxYSWtJZ1hqbnpxTWg3YjI1ZGE1VFN1V0ZzTDZFM3BPdTl3?=
 =?utf-8?B?MUl4WmV4SFRqS0dVbUdlOXRzYmREK1BWVEhocVhZNkwzSk9sOWV2Vk9KVHJn?=
 =?utf-8?B?L1VsaUw5SFVNeHVXZFAwbVV0ZUhsTVA1cjlFZTdyMVNZYXI1NVdOa0EyQmth?=
 =?utf-8?B?aU5wWG1HT3FXUm5tNHJlWnovWENQaVAzcVArMUplOGZtcVJsc2xHVnh4OUk0?=
 =?utf-8?B?azFyU2MyckdrZStTQWErRTloUlp2RkdSUzZtL2hiYkczVmNpSmhqTEZxR2Q0?=
 =?utf-8?B?bXplVWFmZ0liNUQvWTZxcThld0tSMjBYYng2dWhhaDhWRXgvZGNabHd1aGRT?=
 =?utf-8?B?WkpwSDk5MC9iUUxGT2NUVlJzR3FReGlBR3VBUDdJd1FXbDdwNTRHNG5SbXlU?=
 =?utf-8?B?NFFNVzNBUFVwNVNUakZBYng5SGRPOVJHSmNNY2Jhd284VFNKbzg3MEF4RjEx?=
 =?utf-8?B?bmwvcWc2U0xxNzBiNlJaZFZoVEJFeG8vc1FSUXg1RVVkdFErMzBmZy90TGpB?=
 =?utf-8?Q?gVEwPc9wfuVjNv5sjaBivECvb?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5e84f1d5-dd69-4a0d-a702-08da97c1cf72
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Sep 2022 08:59:49.2476
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZNOs+9/OQVwlmxzKf+caqzPpvAmOr5rWSdlTxGd0N1ty5s5BL+S9ajuTmmdPsLcBpU9FT3NJ2s+EChBZmPJU6Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR04MB7034

On 16.09.2022 10:32, Michal Orzel wrote:
> On 16/09/2022 10:08, Julien Grall wrote:
>> On 16/09/2022 08:19, Michal Orzel wrote:
>>> Using dprintk results in printing additionally file name and line
>>> number. This is something we do not want when printing regular
>>> information unconditionally as it looks like as if there was some issue.
>> I am OK if you want to switch to a printk() but I disagree with this
>> argument. dprintk() is not about error, it is about anything that
>> doesn't matter in release build.
> 
> In the vast majority of cases, dprintk is used conditionally. That is why
> in the debug build you cannot spot a single line of log starting with
> a file name + line number. That is why I assume this behaviorto be abnormal
> compared to all the other logs.
> 
> If someone adds a printk starting with e.g. "$$$" this is also not a bad
> usage of printk but would result in an inconsistent behavior.
> 
>>
>> I don't think we should just switch to printk() because dprintk() add
>> the line/file. There are message we don't necessarily want to have in
>> release build. So dprintk(XENLOG_INFO, ...) would be right for them.
> 
> I think this is a matter of being consistent.
> We do not have a helper to add printk only for a debug build but without adding
> filename/line number. That is why almost all the dprintks are used conditionally.

FWIW I agree with Julien and I don't view the "conditional" aspect as
relevant to decide whether to use printk() or dprintk().

Jan

