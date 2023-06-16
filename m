Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CFFC733078
	for <lists+xen-devel@lfdr.de>; Fri, 16 Jun 2023 13:53:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.550118.859027 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qA80b-0007SY-CC; Fri, 16 Jun 2023 11:52:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 550118.859027; Fri, 16 Jun 2023 11:52:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qA80b-0007PZ-8l; Fri, 16 Jun 2023 11:52:53 +0000
Received: by outflank-mailman (input) for mailman id 550118;
 Fri, 16 Jun 2023 11:52:51 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=vb2W=CE=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qA80Z-0007PT-8D
 for xen-devel@lists.xenproject.org; Fri, 16 Jun 2023 11:52:51 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04on2052.outbound.protection.outlook.com [40.107.7.52])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 518ce087-0c3c-11ee-b232-6b7b168915f2;
 Fri, 16 Jun 2023 13:52:50 +0200 (CEST)
Received: from AM6PR04MB6551.eurprd04.prod.outlook.com (2603:10a6:20b:fa::20)
 by AM0PR04MB6770.eurprd04.prod.outlook.com (2603:10a6:208:187::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6500.25; Fri, 16 Jun
 2023 11:52:21 +0000
Received: from AM6PR04MB6551.eurprd04.prod.outlook.com
 ([fe80::d5cd:a63d:6ce1:2be3]) by AM6PR04MB6551.eurprd04.prod.outlook.com
 ([fe80::d5cd:a63d:6ce1:2be3%2]) with mapi id 15.20.6477.028; Fri, 16 Jun 2023
 11:52:21 +0000
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
X-Inumbo-ID: 518ce087-0c3c-11ee-b232-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GQdjmFfDjjLRy2DIqKqEVOJvAnBJ1qPw6mue3r3RvzAzxljeqF3sl5MTLk3JB+AWUsNgdwjR08oqNORNBcLKtOWaHLs3ixt5+U7mUiNEXBwB+jLY6ow/Hf/tAXjHMyNeBTk1bgatNPCDIYzgqF1mDdx67TSzIFE2twGfQ5CoglBk/q1QM3FysynhLMZqq+psF0vlyL0k6ivZAY2ZbKejQVQstzELjDkuIxq0Rc4+nQPMoXT9bBT7c++HQtrO0sCLYBujxRtbrxsUO+lzrhIP9g8e/6Ycgdf5dQiRoLkmITFXXFPrXJXggV3PzH7qRnUbnY+4ypUy9cUS2+ydl/dIcQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BmAqTKUHvtih2PbS7cm+jZjRazW++IkRPBWTxvFyeEs=;
 b=Y4zpQ+zpOl/gh2Kbvj7y33woDQYSztBPdlsJ/tR9Fz6WuMTOlC6YGWORjZWuHS6p+YH9jz0JBXCYQx/D77R/xie+E7M5LwUcim3sZ4SZ4GRiS7hLyVCT8icn8x34ZTbkopG+OaDwJ8+R6QvvZTLZMdL00y9y5/TiqwfC57wxeobwiM5h6BiTGn8DFOfdPoJ0pBjjIrlqZSlkXoq3NLe3Hp1zCeoCvOBmaAedPackBVyFxT844ks9SISeuk8iWzuloeFnGIaIRZtGj4Mp9JflU/3t2Vx0cSyRBe67MM5KGaJ8YYH907y+Juz6Pd6P/W5vl/fCFsUbgNXEXa+8dc1MXw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BmAqTKUHvtih2PbS7cm+jZjRazW++IkRPBWTxvFyeEs=;
 b=P5wunL3GKlSFBCvFg9r28jJAgKa52vimzQOvFoL5psodNKoIubV8Yl7Qt0zAPXP5gl0s9ADPmKmszhTDmjP9D09lv2xElC0mHI0sLemNknM5qkuHSgAdXgNvkNVocEPFwEiOcPvRB60r8bgb5Gr6Ey/q8eLoweE/muBYp4DDaYJ64eLONhblAfpNwa4vsCv+UUhKug1mg0Go/0y3vn1fBbVwlucHZ0qgtK/RSwzJA4aLQKo2iEevff+H/PpRQIdIvCiy3fw2vj3gzQ5zeii+rjv4hIUByNTOO0tZCmXLqMSRSCG77ErCKA/I8LGPnDB7niBL4jZ5g/ah1Nbz57gNAw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <b50a8e23-f3fc-bdb9-5a76-780d2a4a7aa3@suse.com>
Date: Fri, 16 Jun 2023 13:52:17 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: xentrace buffer size, maxcpus and online cpus
Content-Language: en-US
To: Olaf Hering <olaf@aepfle.de>
Cc: xen-devel@lists.xenproject.org, Juergen Gross <jgross@suse.com>,
 George Dunlap <george.dunlap@citrix.com>
References: <20230530095859.60a3e4ea.olaf@aepfle.de>
 <578d341d-0c54-de64-73e7-1dfc7e5d7584@suse.com>
 <20230530220613.4c4da5cc.olaf@aepfle.de>
 <1b99e58d-338c-02af-eeab-00d691337d00@suse.com>
 <20230616134708.6b3c6964.olaf@aepfle.de>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20230616134708.6b3c6964.olaf@aepfle.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0164.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:99::14) To AM6PR04MB6551.eurprd04.prod.outlook.com
 (2603:10a6:20b:fa::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM6PR04MB6551:EE_|AM0PR04MB6770:EE_
X-MS-Office365-Filtering-Correlation-Id: 4d8a32b3-e7ed-4bfc-e0d4-08db6e602339
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	q7XykT5JBohmz1SsE08ksLRun+C4JaewK225P10svVhsjGzzis1pwrdtdlkctF0Q2S9EK/e3cJ0GAm5vrhxsnPjBB7ukklUoQ8YRvQJ6GYoyly96MaKol/ALCBQXlzBaQrmdlJjJYJqKpiiSGVQeZYQ45nlD5Iuanm9ZttNdyPP3++sc0ZcmQYonVEq17tgJ/n3ql9EwsvVkZpUA2R1kiUr2I2IFt+bD2WsVy8XjixmGxf1maGd7jIYdrzqtXS/O5jhRrsVsxASLgyhmwlA7AwayOqpCH1EuWtN6iBiY+E0FipRGdANBUJLNcdfQbMJfL9kxzuRPYlwsFu+CMTVnyTfUoQ06MVeN0RkZWDmPLIH3qEBM/7NpPeclTR71Indh1NRbIw2HY9pq867zSnyzH9gG7D9UWgCz3Loh6mWFtkf2Bt5udDgTWbJoxNkpwcF7wBV9Kz/8aOH5D6gmAwQlFVIMzzf0KlNN19iWABDwISDc5Ba84vbdRxoatH0Gz82MVyzvRecJoM+z3d2Z/C8apQZLchimmk9r8jVNuiJRlscxJ5pzk0GeROmUaNVnfJq6k9FULJXf12W3mDifl22KagMxh9SGyNywFvqWWmCiE3PsIOHh3+EWaIEYZUrrpsEPG1mBgXMgre6iKVyWpap2Zw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR04MB6551.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(366004)(39860400002)(396003)(346002)(136003)(376002)(451199021)(66946007)(54906003)(31686004)(4326008)(86362001)(66476007)(66556008)(6916009)(6666004)(8936002)(8676002)(6486002)(41300700001)(316002)(36756003)(38100700002)(31696002)(6506007)(53546011)(5660300002)(478600001)(4744005)(26005)(6512007)(2906002)(186003)(2616005)(83380400001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?L2Q0eGVxbHVORDB0SWdtNTI0bUljeDdlSVk3djRoWjZpVTVrVnc3d1FSd05V?=
 =?utf-8?B?QnY5V016WWVJb0JURXJiYmVsZ1dnckh3ZzRsV0gxYjBWY3E3c1BXVXNvUU9h?=
 =?utf-8?B?dHlJbXVJZTZGMDI4eFZRdFZLMWpEM1Nadk55VXFwMVZQb25lc0FKQm0reVBs?=
 =?utf-8?B?T1NJYWVPT0VIWTBna09kK2g3ODBseWdncjZGdFFUaHRDVGFpWWxWd1lTck5p?=
 =?utf-8?B?ektjUWg3TmpKdXh0cU8xVE9XckFFdC9kYVp6M1hiWi9wL202QjhHOERGOWhH?=
 =?utf-8?B?Ry9sbDhVTkhJejNjUWNWRWx5TTBacDhyY2hYcysvdGxVWExmYkE4V2F1Q2Z5?=
 =?utf-8?B?d0JDdDBDOVpZcVVxWWh0YlpyWUVNRWpkM3pFeDg1bFFqQVhwcDQ3UDUxVVBF?=
 =?utf-8?B?ZDlNSVU4YTlsK01rNDJZdmcrWW1kbkhLN0VkTjVYOUNVQ1N4QjF4Qzdja3R6?=
 =?utf-8?B?VVFzVUpGMDhpaGpjWTcxQlpLbDY5NXAwVkxXbWFFUW9uUHg0eU8vZUFEYWs5?=
 =?utf-8?B?UnNMNFZybHBURU94SzcwUmo1bGR2S3MrUWh4R3lrbVFRZTIvUmtvQ0VWWno2?=
 =?utf-8?B?SGVIWUYwRW5mYmxFMjNTTUtjKzRGd01XcmlxSXVwUXFOOEdYUkVuYTRCeSti?=
 =?utf-8?B?ZWd4RFdyT1hIbmdQL1AvNnFGZTRlODIvRmhUeFVFblR3SWcwR0Q5UGRVUWQy?=
 =?utf-8?B?TDdQeGlHN2orcWxxTWpUSVMzQWhTdXdlM1I0Si9laVNIU2UwUWVNU0pSMXZI?=
 =?utf-8?B?aUlwWVFlc0kxaElDWjJsTHNFYXZVY0tJSHd4eGpHZGkydjVhMitYL3lyRG96?=
 =?utf-8?B?UTFMVXQwaHUvV0ExWDdSc25xd0tKbG1mMU5Ka251bEw1dm13VUdQN1JUNXg5?=
 =?utf-8?B?VitWNnFPTk5jd29GZmRhb09uelowcEEwOVQvTVJrSG5XZVpCNTFJN2lDcUVB?=
 =?utf-8?B?cDJ2K1NXcFNiS211RXZvSzR3N05RTHoxd2RnMUNSdEJCbFFhN3FxNFQzWEJ5?=
 =?utf-8?B?dTBvay9GOVQ1MzhJUnRXVDd6SVI4UUdYalN6QTl1S29DaTFhcUQvVWxNK1ZP?=
 =?utf-8?B?ejhiVHlmM0FYQ3B6T1AzQkFMNXBlTzNUS2h1c0dxaGlvQXRxVHRFc0JPZlA1?=
 =?utf-8?B?NGFXamp0dEczbHNNTVNONVhka3JrOC9rSndVUTNBbCs5SG8rSWdkeVVtNmoy?=
 =?utf-8?B?SXI3YmdwZGxDQzVzWGRDTVpGVXRzek1mdHpjSTFqNUxJenNoTFBOM2hOQnY1?=
 =?utf-8?B?djZCVS91Wk01VkdKcUU0M0I5aFJVdVUxTTJmSWJ5dkdMYm50WGlUdHBDOFJ0?=
 =?utf-8?B?U2NqYnMrTGVEVE1YdEpmSjErSVVRNW5Ic2ZvdVdzVk80c1B0U2M1Q0lkYTBP?=
 =?utf-8?B?YmJpOHZ4VmVCc2laeEs5MVJZU29ZQWd5dmUxU3BKekNXSElONFFITURKVTdG?=
 =?utf-8?B?TlJCNk1IZ0xwL1dQWlQ0RVk3elVJdnlPdHhKcDlyUG5ZN1EyVFFXNVdId01S?=
 =?utf-8?B?dHN4TmswQVluK1hlbnJkczNOWEZpaFNaYXVFOEV1VzdtMFQ2ai9ZQ0VtaDda?=
 =?utf-8?B?d05Gd1VJbWNPRHhaWCtmRUIwN0hzcVdaZHkvSm95azY1c2UxVkEwZ3VIT0NF?=
 =?utf-8?B?L25hMWhGcVBqcVhIWTc3cVlvOGwvd3U3ekZqKzNhZW56QTdzdkZHMFJ2OWJr?=
 =?utf-8?B?SnlHN25Oa3hreE5NL01zNGpndjFER1NJNk1BOUtNMXRpdytCK05HYTIxZ21t?=
 =?utf-8?B?MDIyMG8rQlpjazZIWUdqc1J2R2NYMmFvMWUyQ29qSEtRVzUyaFR2N2poTDZE?=
 =?utf-8?B?M1E4YnBQK2N6bm9WYXJJMGFJWHQ1RVdlcDFZRGg4M05FL09YVndWblA0d3Nl?=
 =?utf-8?B?MzhybFl4QVZ3ODNkeUhyL3pPVExuWG9oQWZIeU5oMzBjZTFwZFlyQktYYTcz?=
 =?utf-8?B?NE13TkpUY0FoOEFUN2VkWW0xY3BNK0ZNRzk3ZTAvNDBIdEV0OHhNV01FWFh3?=
 =?utf-8?B?TUd1NHBUSVRHbUt6ajNMb0xMS0ZkVGJvR3BDeVBvQlBlTkd5SmRsM3FOL2Jh?=
 =?utf-8?B?bmltVGczNFlNcEhhTlEzRDNYRFEzWTJDbmVHNzRQNVp6ekI0ZUFNbURncmxk?=
 =?utf-8?Q?BvpiR42+761I2QT+Xnc0gl6D2?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4d8a32b3-e7ed-4bfc-e0d4-08db6e602339
X-MS-Exchange-CrossTenant-AuthSource: AM6PR04MB6551.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jun 2023 11:52:21.5672
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xyCNxlBCVgb/ecT+LwFguU00qqqhk66HGz96iCzODiEHG/Qo+qc4wr1KvZV+H6pd1Kzm6v/RN5YDsU3xxYbQmQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB6770

On 16.06.2023 13:47, Olaf Hering wrote:
> Wed, 31 May 2023 11:05:52 +0200 Jan Beulich <jbeulich@suse.com>:
> 
>> As said before, num_online_cpus() will under-report for the purpose
>> here, as CPUs may have been brought offline, and may be brought online
>> again later (independent of the use of "maxcpus=").
> 
> It turned out, commit 74584a367051bc0d6f4b96fd360fa7bc6538fc39 broke
> the expected behavior. But to me it is unclear what bug was fixed by
> this commit.

Hmm, I find title and description quite clear there.

> If I read alloc_trace_bufs correctly, it already operates on online
> cpus. And __trace_var will do nothing if called on a cpu which was
> not online, t_bufs will likely be NULL.

Yielding an incomplete overall trace, at best.

> To me it looks like commit 74584a367051bc0d6f4b96fd360fa7bc6538fc39
> could be reverted.

I don't think so. I'll add George to Cc as well, as he's the maintainer
of this stuff.

Jan

