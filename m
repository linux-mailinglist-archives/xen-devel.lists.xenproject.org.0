Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 088E65AE09E
	for <lists+xen-devel@lfdr.de>; Tue,  6 Sep 2022 09:10:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.399444.640615 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oVSim-0006oS-4A; Tue, 06 Sep 2022 07:10:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 399444.640615; Tue, 06 Sep 2022 07:10:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oVSim-0006mf-1B; Tue, 06 Sep 2022 07:10:08 +0000
Received: by outflank-mailman (input) for mailman id 399444;
 Tue, 06 Sep 2022 07:10:06 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=o/Pp=ZJ=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1oVSik-0006iQ-61
 for xen-devel@lists.xenproject.org; Tue, 06 Sep 2022 07:10:06 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on2071.outbound.protection.outlook.com [40.107.21.71])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id eea39d88-2db2-11ed-a016-b9edf5238543;
 Tue, 06 Sep 2022 09:10:05 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DB6PR0402MB2775.eurprd04.prod.outlook.com (2603:10a6:4:99::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5588.17; Tue, 6 Sep
 2022 07:10:03 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::59bc:901a:98a7:76d4]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::59bc:901a:98a7:76d4%5]) with mapi id 15.20.5588.017; Tue, 6 Sep 2022
 07:10:03 +0000
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
X-Inumbo-ID: eea39d88-2db2-11ed-a016-b9edf5238543
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=T+uPVakEg9iCuSZGgaL1kxnntWXlc4Nt1Rooa1M1A2b40qWabWmnLNLYo9Keikef173XNCScxXf3w3xX2vykLF+ZuJ9NQJlnIVB1nwo0Mfq5aWkBboD9yeP6PCRhY2mQpNQ6pcCobuvI/z20ciqbRq+vR4+RBcLqdyOsLZRrk210KJHbwo7fLWav8PelUrm5BstlSz9VURu+dUaXkROnUqErzeWfAo6WZqjmfrTladPtc+G4hgZysw/fhDjlwKpHxtTkShMj26V3/LuelyZC0MvgdUarE/dwfqgKqTLcVsYLTOAQxmBRkogH0RggjBjpK7j6mZnCKKs0Qg/CW1WG2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DsDDV/FN9vy0G1r/S2w2wFWcUVlkivmZdtxVuZRHZZM=;
 b=mbM+ZcrACjqM8rIHTfCuGf2cCk/GJc2fE+Wqf1KE2K/vuJp09LLeUCfCz5u+AaPDobKIzcG1puJ8+U1uIeTT9Pj7kLscNHKUayK/x6iAQilHe+3Z5lDq9xhAV8cds5wt4d+5VmkffXAF1iMzjgp+MHWkJJ9wo8xQzgqXy/EfSLgouHUNlxNp53VRFxW6CboQbSzFrPuonTabbJTginq9jZ/Z+Unfee66XlHjvtl5iuO/WH9O/ADjMF7e39wDJPa6wyJqeBHLrvo19THkCrXJNoJgfKPGc9C4bsHQcH7jjDYSr3qo1Wl3BkH0urQQUMksqTonk6uO4Mm6e6TAqLvRWQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DsDDV/FN9vy0G1r/S2w2wFWcUVlkivmZdtxVuZRHZZM=;
 b=bg9GiSVeJxFjwWrtM11mqeC9KQna+yqAMqd9lSkUK50NJkI6dBluSp+apcBIcaHldx9klo+qO+FUxVpguTLPkNmTd4zZ0iJhcVvlxb9ptu8NTDQboC20cZ/UKy6agaG8fthKESsMrVHlPUMT7xOgrW2KM53JOjPABaIyJ1Fi3HJql0XhSEYNuKSYMDcPwWf7y3dPImOcMWpS/zqEkFd9pUoVLTt6/JeBQqTawhKFf4Ihe9Fbv3MQAUJpVWEimN+iqDTPOWQHUhxo8+JSF5pIRa/yycmKu80kdquHkE8pj8pO8/qjwGDd9HM7wER7sEHh/qfbNCgb5/XBWAcASOJthA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <68f9ca92-1971-f881-02d7-97560bb24617@suse.com>
Date: Tue, 6 Sep 2022 09:10:08 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.1
Subject: Re: [PATCH v3 5/6] xen/x86: move NUMA scan nodes codes from x86 to
 common
Content-Language: en-US
To: Wei Chen <Wei.Chen@arm.com>
Cc: nd <nd@arm.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, George Dunlap <george.dunlap@citrix.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <20220822025810.2240707-1-wei.chen@arm.com>
 <20220822025810.2240707-6-wei.chen@arm.com>
 <67d9e7bf-8e0c-9290-5ac5-30d8cd8b9177@suse.com>
 <PAXPR08MB742071B0098747255B9A95F39E769@PAXPR08MB7420.eurprd08.prod.outlook.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <PAXPR08MB742071B0098747255B9A95F39E769@PAXPR08MB7420.eurprd08.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AS8PR04CA0038.eurprd04.prod.outlook.com
 (2603:10a6:20b:312::13) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a2093ac4-9122-433d-d38c-08da8fd6d1bd
X-MS-TrafficTypeDiagnostic: DB6PR0402MB2775:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	8me1e0cm8NNJYk7GwIde5/0ueNfihAYCtexjHi9pHQYggCVymP29iD+5GNq+SJcL36xdTcNlekxSjU+NxiFB1siU+zO/zPylUaLre/N4KWlpbL3ri0cYQxDterV5PyMRq7r24jrCZuDKCwnfP75ibUszhVtU6nB/pDQaWGb9L1RhxzaFi5hLZ396PvoJgetHc8q+89lCqKJaPWPj4QrDz6clzOqTBYtO6SIRxvllda0jEPm/Rx/k9PETwNTlI1vJAoD2MfjLD2gY2IfuqoEfJU5YhR9goKtpeN1e1Kit+80sfANGz3R0cUEjN4N5MckQ28zREJLNPKkiKgG2gmfaUP5O7s3lweG8TEJRCjc/MRpVrj743Inrde9t9By9fJooh+0cpPGVxzgFWzOV/IcILhELy76bUXD1FkCh0yXH52VJhTkMuH6XsA5J12L60Zag8L8I1uQ2E5bAYql2NTSzUaVa9Tvo6WRl2IgmMgbOJNJoOKuwYNR9B9o8NkHAHxP1Rd4drJs/nESBNpTRVDjIbUynOgKfsRXKax66e/3q6HiMbv8YtViiBM13vb/X1E67HdUQEQiXmf7q0fWUEURMjxOHHOE9jH8s62Pu8W+hs9PQIj2K4H3VYhAgFaX5sbORPfhxeWSUDaQeJ0FxILme1cJENB7UrGZ2x/myTpWQ4ba36pcc3JSotrQhijlJHg5eVDG6Oy3jcEo8hqOoW1YX/L+eIpHSjh+ARF5tvIVuYnArBYZylaGPOfm4LhelTFmmFhO1yysAOjC3KJCKMu1MgfkcYiBezZ+UUU+frvRV4Yw=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(366004)(396003)(39860400002)(136003)(376002)(346002)(2616005)(186003)(41300700001)(5660300002)(8936002)(6916009)(316002)(83380400001)(54906003)(26005)(478600001)(66946007)(53546011)(8676002)(6512007)(31686004)(66556008)(86362001)(2906002)(6506007)(6486002)(4744005)(38100700002)(66476007)(31696002)(4326008)(36756003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?akdRWnZSeExvbmVtTFhKUlZXMkR6eENGak5XVGt1d2RJKytXMDdTZjB6UHls?=
 =?utf-8?B?VERlRCtpYU5HSnpEdFlOV2x1NXpTMjlidDRQTkRyRDVJbGc0Y1F2VUNyTzNr?=
 =?utf-8?B?Mm9kZ203QWVkWkg1R1JER0N1aVEvWkIySVBwRjlueVlNODdzVTgwdXM4dG5x?=
 =?utf-8?B?N2hndkR1VnZERVVka0t6UE84SlNYS2V2eGhXSG92YTFtRVJtYkZWaDZwdWdx?=
 =?utf-8?B?bU9yL082TDJNdzhWd0hoMk4wc0hNVzlieFFyUXBWcUVWYVVxMXVVRSs2L1RB?=
 =?utf-8?B?T3N3dXRVN2J0dmtqdmszYjd6VW8yRmJGU3Z5Q2V5R1ZleHVhUURjaWFjSmFG?=
 =?utf-8?B?b3IxUFhydEMwNDIxdGFPUnoyVWNSTkt0YzdCK2ZtMmR3dktHUEZkaXMvU0N1?=
 =?utf-8?B?N3pnTmN0Q2hwS0NJdWw5ajluK2U3Zkk4RGJlWmUwdUdQemk4SHFZc1RRK3Bq?=
 =?utf-8?B?amZxMSs0MW55S3BuR1JwTXFnV0NCc2lTM2FoUlpDeDF3THU1a3J3NU9YYXlW?=
 =?utf-8?B?ejdybndxV1ZPckplSHM0S1pVSGhaaldCSVd6UEtGRWNrajZIbnlSZ1ZzSUpz?=
 =?utf-8?B?VFhnNkFnNllncHg0bEFYKy9JcXM1eHRTQ0RPMENVa0ZmMTZSZFBiYUIybWRR?=
 =?utf-8?B?QVV4Uk1HZ1hVTDBXOEl3TysycUErbzBOQUxqeTJMc0J2UjIzd2tDa2ZzWWtv?=
 =?utf-8?B?OEZURS9ObHprQzRrdGsxREdDN2N5ZnFGYmU1a1FiT1E4S2FoVXR1L0p2ZnN3?=
 =?utf-8?B?SnhYRHNKenpoK09vREJIRXVYSXNTSXZ1dlBrSFJLa2VsRjVyMnpwcDZzYXJi?=
 =?utf-8?B?WVBBVGJSRCtpZlNQbXVVNmtYMTZtbnlSSjB6ME1ieFp5bVJtaFd5YUxSUE51?=
 =?utf-8?B?VUlRVmU1ekFjc0RnL0l0WEVYS1U5RC9mK3ByMWFlOTBNM3VQN2lGa0JCcDR1?=
 =?utf-8?B?MUhRTlhab3Zxb1ljK1JlL2tqbDd6VXN6ZFl0L2ZhYkZhZzVpb2F3YkJ3WDMr?=
 =?utf-8?B?MHZCNldvclI3S1ZkT0kxdHZEZ1hza2N4NXpGZER6UitRbU5vdFJTY3pDRHpu?=
 =?utf-8?B?V0hqTmVvZzFQVXMrWTlWZUVaOVM4NWZOOHVKQXM2VTVRNGlCMkNGTENvVnZr?=
 =?utf-8?B?SjVQNFJySndNejdzcVZhaWxLL0E0ZStySDd5eTlITlJaUUJUcDY5SXo3czUy?=
 =?utf-8?B?UnlwYWtTNGl4NjladXZqZWgvU0ZzY1BaODBPdDdjRTBUUlM4NlNpNGVyeTla?=
 =?utf-8?B?dE5UejRYUi9OeVFJVWNwWVMvRTRsbUFWVzF0cm02Wm9kbTd4TTJjbEVZY0tG?=
 =?utf-8?B?ZXc2QkxET3NZUnRrSm5MalNDQzZwSXRDZTJVMzhVUmZQRXNKcDU1KzVpMWlL?=
 =?utf-8?B?Y3ZSNmJ2WlNTU0tLYXVUc3dXUytscTdVSXo3aDFVaHFJYXRoeTB4a3h2bVZk?=
 =?utf-8?B?Z3QrazI4ZXBYeU4rMkVUUFFCcnR1RWJxbmd0ZWRqalJVZmJ5UkRqK0ZZVUda?=
 =?utf-8?B?V0dtQzNieFZ0VUtQbEpDNjljN2lnRVhaaUNnRTI2cnl3akdpTU5uZXJ6WjJy?=
 =?utf-8?B?Yjh6Z1o1eTNhSzdOZmZJMkwvSGUraHpQQXJVQXkreE95OURZSzZVWm5aUW1V?=
 =?utf-8?B?alNyYURmYUhYZlFYNGJtYzZqWG9heXIrY3doSW83cHVkTmJva0ptMVdqRCtE?=
 =?utf-8?B?dEJpWDUwNXNLbWoxdXNiUWIweUQ1Qng4bmZrWWFYWmxaYkdsTGY2bmY3Vm5x?=
 =?utf-8?B?REZWbXFxNnJuRG83NzNlNDBiVS9LdERZc3BiWnJucUV3a20wWTFVdWJpZE4w?=
 =?utf-8?B?bENXdHFmNmtXZ0hEZXNubE15ZGFlOW16VWhnczRHLy9WT09Dd2JMemkvUmYz?=
 =?utf-8?B?Q1RRenRBT1NrOFMyMm5GMG9zVzhhZ1YyRmd6M2p3K0FIK28rMmFHMXM5ajg0?=
 =?utf-8?B?ZXVncWk2eXJZemQ4VUVHdnlXZ3M5OVlsNUh6WFlIWTdDR2I5Ri9ZK1ZOUmVG?=
 =?utf-8?B?QTl0bWRnNEp6REx2dW5DRllMeE9XM0FXcDhTbzFPcHpwVng2WGpRVEpscVBp?=
 =?utf-8?B?S05lVmlZTGN2ZC9PM09JV2hINlJyS2FlRldqbDNqNmFpUzJDZVpZOFFFTjBG?=
 =?utf-8?Q?4Sw4k0/J5kSiwNNf6sK9qNXYq?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a2093ac4-9122-433d-d38c-08da8fd6d1bd
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Sep 2022 07:10:03.2092
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: y6AcpPib0n3zQXLHy3ZtTgxT72Fm28vK03l7bJ6DZwnJQWSs0tcudc7z2JLSEynzcRZFKAhb2JxJBLw6L/iTtA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR0402MB2775

On 29.08.2022 12:47, Wei Chen wrote:
>> -----Original Message-----
>> From: Jan Beulich <jbeulich@suse.com>
>> Sent: 2022年8月25日 20:50
>>
>> On 22.08.2022 04:58, Wei Chen wrote:
>>> +bool __init numa_memblks_available(void)
>>> +{
>>> +    return num_node_memblks < NR_NODE_MEMBLKS;
>>> +}
>>
>> This is kind of clumsy, but I have no better suggestion.
>>
> 
> Did you mean the whole function or just the name?

The need for it (as even a non-inline function) primarily. Its
name at least reflects its purpose, so would be okay-ish.

Jan

